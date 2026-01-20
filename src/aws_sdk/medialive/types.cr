require "json"
require "time"

module AwsSdk
  module MediaLive
    module Types

      # Aac Settings

      struct AacSettings
        include JSON::Serializable

        # Average bitrate in bits/second. Valid values depend on rate control mode and profile.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Float64?

        # Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. The
        # adReceiverMix setting receives a stereo description plus control track and emits a mono AAC encode
        # of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex
        # E.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD (narration) as a stereo
        # pair. The Audio Type field (audioType) will be set to 3, which signals to downstream systems that
        # this stream contains "broadcaster mixed AD". Note that the input received by the encoder must
        # contain pre-mixed audio; the encoder does not perform the mixing. The values in audioTypeControl and
        # audioType (in AudioDescription) are ignored when set to broadcasterMixedAd. Leave set to "normal"
        # when input does not contain pre-mixed audio + AD.

        @[JSON::Field(key: "inputType")]
        getter input_type : String?

        # AAC Profile.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Rate Control Mode.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Sets LATM / LOAS AAC output for raw containers.

        @[JSON::Field(key: "rawFormat")]
        getter raw_format : String?

        # Sample rate in Hz. Valid values depend on rate control mode and profile.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Float64?

        # Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.

        @[JSON::Field(key: "spec")]
        getter spec : String?

        # VBR Quality Level - Only used if rateControlMode is VBR.

        @[JSON::Field(key: "vbrQuality")]
        getter vbr_quality : String?

        def initialize(
          @bitrate : Float64? = nil,
          @coding_mode : String? = nil,
          @input_type : String? = nil,
          @profile : String? = nil,
          @rate_control_mode : String? = nil,
          @raw_format : String? = nil,
          @sample_rate : Float64? = nil,
          @spec : String? = nil,
          @vbr_quality : String? = nil
        )
        end
      end

      # Ac3 Settings

      struct Ac3Settings
        include JSON::Serializable

        # Applies a 3 dB attenuation to the surround channels. Applies only when the coding mode parameter is
        # CODING_MODE_3_2_LFE.

        @[JSON::Field(key: "attenuationControl")]
        getter attenuation_control : String?

        # Average bitrate in bits/second. Valid bitrates depend on the coding mode.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Float64?

        # Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC A/52-2012 for background
        # on these values.

        @[JSON::Field(key: "bitstreamMode")]
        getter bitstream_mode : String?

        # Dolby Digital coding mode. Determines number of channels.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Sets the dialnorm for the output. If excluded and input audio is Dolby Digital, dialnorm will be
        # passed through.

        @[JSON::Field(key: "dialnorm")]
        getter dialnorm : Int32?

        # If set to filmStandard, adds dynamic range compression signaling to the output bitstream as defined
        # in the Dolby Digital specification.

        @[JSON::Field(key: "drcProfile")]
        getter drc_profile : String?

        # When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid
        # in codingMode32Lfe mode.

        @[JSON::Field(key: "lfeFilter")]
        getter lfe_filter : String?

        # When set to "followInput", encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that
        # supplied this audio data. If audio was not supplied from one of these streams, then the static
        # metadata settings will be used.

        @[JSON::Field(key: "metadataControl")]
        getter metadata_control : String?

        def initialize(
          @attenuation_control : String? = nil,
          @bitrate : Float64? = nil,
          @bitstream_mode : String? = nil,
          @coding_mode : String? = nil,
          @dialnorm : Int32? = nil,
          @drc_profile : String? = nil,
          @lfe_filter : String? = nil,
          @metadata_control : String? = nil
        )
        end
      end


      struct AcceptInputDeviceTransferRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct AcceptInputDeviceTransferResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AccessDenied
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AccountConfiguration
        include JSON::Serializable

        # Specifies the KMS key to use for all features that use key encryption. Specify the ARN of a KMS key
        # that you have created. Or leave blank to use the key that MediaLive creates and manages for you.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # Additional output destinations for a CMAF Ingest output group

      struct AdditionalDestinations
        include JSON::Serializable

        # The destination location

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        def initialize(
          @destination : Types::OutputLocationRef
        )
        end
      end

      # Ancillary Source Settings

      struct AncillarySourceSettings
        include JSON::Serializable

        # Specifies the number (1 to 4) of the captions channel you want to extract from the ancillary
        # captions. If you plan to convert the ancillary captions to another format, complete this field. If
        # you plan to choose Embedded as the captions destination in the output (to pass through all the
        # channels in the ancillary captions), leave this field blank because MediaLive ignores the field.

        @[JSON::Field(key: "sourceAncillaryChannelNumber")]
        getter source_ancillary_channel_number : Int32?

        def initialize(
          @source_ancillary_channel_number : Int32? = nil
        )
        end
      end

      # Elemental anywhere settings

      struct AnywhereSettings
        include JSON::Serializable

        # The ID of the channel placement group for the channel.

        @[JSON::Field(key: "channelPlacementGroupId")]
        getter channel_placement_group_id : String?

        # The ID of the cluster for the channel.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        def initialize(
          @channel_placement_group_id : String? = nil,
          @cluster_id : String? = nil
        )
        end
      end

      # Archive Cdn Settings

      struct ArchiveCdnSettings
        include JSON::Serializable


        @[JSON::Field(key: "archiveS3Settings")]
        getter archive_s3_settings : Types::ArchiveS3Settings?

        def initialize(
          @archive_s3_settings : Types::ArchiveS3Settings? = nil
        )
        end
      end

      # Archive Container Settings

      struct ArchiveContainerSettings
        include JSON::Serializable


        @[JSON::Field(key: "m2tsSettings")]
        getter m2ts_settings : Types::M2tsSettings?


        @[JSON::Field(key: "rawSettings")]
        getter raw_settings : Types::RawSettings?

        def initialize(
          @m2ts_settings : Types::M2tsSettings? = nil,
          @raw_settings : Types::RawSettings? = nil
        )
        end
      end

      # Archive Group Settings

      struct ArchiveGroupSettings
        include JSON::Serializable

        # A directory and base filename where archive files should be written.

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # Parameters that control interactions with the CDN.

        @[JSON::Field(key: "archiveCdnSettings")]
        getter archive_cdn_settings : Types::ArchiveCdnSettings?

        # Number of seconds to write to archive file before closing and starting a new one.

        @[JSON::Field(key: "rolloverInterval")]
        getter rollover_interval : Int32?

        def initialize(
          @destination : Types::OutputLocationRef,
          @archive_cdn_settings : Types::ArchiveCdnSettings? = nil,
          @rollover_interval : Int32? = nil
        )
        end
      end

      # Archive Output Settings

      struct ArchiveOutputSettings
        include JSON::Serializable

        # Container for this output. Can be auto-detected from extension field.

        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::ArchiveContainerSettings

        # Output file extension. If excluded, this will be auto-selected from the container type.

        @[JSON::Field(key: "extension")]
        getter extension : String?

        # String concatenated to the end of the destination filename. Required for multiple outputs of the
        # same type.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        def initialize(
          @container_settings : Types::ArchiveContainerSettings,
          @extension : String? = nil,
          @name_modifier : String? = nil
        )
        end
      end

      # Archive S3 Settings

      struct ArchiveS3Settings
        include JSON::Serializable

        # Specify the canned ACL to apply to each S3 request. Defaults to none.

        @[JSON::Field(key: "cannedAcl")]
        getter canned_acl : String?

        def initialize(
          @canned_acl : String? = nil
        )
        end
      end

      # Arib Destination Settings

      struct AribDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Arib Source Settings

      struct AribSourceSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Audio Channel Mapping

      struct AudioChannelMapping
        include JSON::Serializable

        # Indices and gain values for each input channel that should be remixed into this output channel.

        @[JSON::Field(key: "inputChannelLevels")]
        getter input_channel_levels : Array(Types::InputChannelLevel)

        # The index of the output channel being produced.

        @[JSON::Field(key: "outputChannel")]
        getter output_channel : Int32

        def initialize(
          @input_channel_levels : Array(Types::InputChannelLevel),
          @output_channel : Int32
        )
        end
      end

      # Audio Codec Settings

      struct AudioCodecSettings
        include JSON::Serializable


        @[JSON::Field(key: "aacSettings")]
        getter aac_settings : Types::AacSettings?


        @[JSON::Field(key: "ac3Settings")]
        getter ac3_settings : Types::Ac3Settings?


        @[JSON::Field(key: "eac3AtmosSettings")]
        getter eac3_atmos_settings : Types::Eac3AtmosSettings?


        @[JSON::Field(key: "eac3Settings")]
        getter eac3_settings : Types::Eac3Settings?


        @[JSON::Field(key: "mp2Settings")]
        getter mp2_settings : Types::Mp2Settings?


        @[JSON::Field(key: "passThroughSettings")]
        getter pass_through_settings : Types::PassThroughSettings?


        @[JSON::Field(key: "wavSettings")]
        getter wav_settings : Types::WavSettings?

        def initialize(
          @aac_settings : Types::AacSettings? = nil,
          @ac3_settings : Types::Ac3Settings? = nil,
          @eac3_atmos_settings : Types::Eac3AtmosSettings? = nil,
          @eac3_settings : Types::Eac3Settings? = nil,
          @mp2_settings : Types::Mp2Settings? = nil,
          @pass_through_settings : Types::PassThroughSettings? = nil,
          @wav_settings : Types::WavSettings? = nil
        )
        end
      end

      # Audio Description

      struct AudioDescription
        include JSON::Serializable

        # The name of the AudioSelector used as the source for this AudioDescription.

        @[JSON::Field(key: "audioSelectorName")]
        getter audio_selector_name : String

        # The name of this AudioDescription. Outputs will use this name to uniquely identify this
        # AudioDescription. Description names should be unique within this Live Event.

        @[JSON::Field(key: "name")]
        getter name : String

        # Identifies the DASH roles to assign to this audio output. Applies only when the audio output is
        # configured for DVB DASH accessibility signaling.

        @[JSON::Field(key: "audioDashRoles")]
        getter audio_dash_roles : Array(String)?

        # Advanced audio normalization settings.

        @[JSON::Field(key: "audioNormalizationSettings")]
        getter audio_normalization_settings : Types::AudioNormalizationSettings?

        # Applies only if audioTypeControl is useConfigured. The values for audioType are defined in ISO-IEC
        # 13818-1.

        @[JSON::Field(key: "audioType")]
        getter audio_type : String?

        # Determines how audio type is determined. followInput: If the input contains an ISO 639 audioType,
        # then that value is passed through to the output. If the input contains no ISO 639 audioType, the
        # value in Audio Type is included in the output. useConfigured: The value in Audio Type is included in
        # the output. Note that this field and audioType are both ignored if inputType is broadcasterMixedAd.

        @[JSON::Field(key: "audioTypeControl")]
        getter audio_type_control : String?

        # Settings to configure one or more solutions that insert audio watermarks in the audio encode

        @[JSON::Field(key: "audioWatermarkingSettings")]
        getter audio_watermarking_settings : Types::AudioWatermarkSettings?

        # Audio codec settings.

        @[JSON::Field(key: "codecSettings")]
        getter codec_settings : Types::AudioCodecSettings?

        # Identifies DVB DASH accessibility signaling in this audio output. Used in Microsoft Smooth Streaming
        # outputs to signal accessibility information to packagers.

        @[JSON::Field(key: "dvbDashAccessibility")]
        getter dvb_dash_accessibility : String?

        # RFC 5646 language code representing the language of the audio output track. Only used if
        # languageControlMode is useConfigured, or there is no ISO 639 language code specified in the input.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Choosing followInput will cause the ISO 639 language code of the output to follow the ISO 639
        # language code of the input. The languageCode will be used when useConfigured is set, or when
        # followInput is selected but there is no ISO 639 language code specified by the input.

        @[JSON::Field(key: "languageCodeControl")]
        getter language_code_control : String?

        # Settings that control how input audio channels are remixed into the output audio channels.

        @[JSON::Field(key: "remixSettings")]
        getter remix_settings : Types::RemixSettings?

        # Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by the player (eg. English,
        # or Director Commentary).

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        def initialize(
          @audio_selector_name : String,
          @name : String,
          @audio_dash_roles : Array(String)? = nil,
          @audio_normalization_settings : Types::AudioNormalizationSettings? = nil,
          @audio_type : String? = nil,
          @audio_type_control : String? = nil,
          @audio_watermarking_settings : Types::AudioWatermarkSettings? = nil,
          @codec_settings : Types::AudioCodecSettings? = nil,
          @dvb_dash_accessibility : String? = nil,
          @language_code : String? = nil,
          @language_code_control : String? = nil,
          @remix_settings : Types::RemixSettings? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Audio Dolby EDecode

      struct AudioDolbyEDecode
        include JSON::Serializable

        # Applies only to Dolby E. Enter the program ID (according to the metadata in the audio) of the Dolby
        # E program to extract from the specified track. One program extracted per audio selector. To select
        # multiple programs, create multiple selectors with the same Track and different Program numbers. “All
        # channels” means to ignore the program IDs and include all the channels in this selector; useful if
        # metadata is known to be incorrect.

        @[JSON::Field(key: "programSelection")]
        getter program_selection : String

        def initialize(
          @program_selection : String
        )
        end
      end

      # Audio Hls Rendition Selection

      struct AudioHlsRenditionSelection
        include JSON::Serializable

        # Specifies the GROUP-ID in the #EXT-X-MEDIA tag of the target HLS audio rendition.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # Specifies the NAME in the #EXT-X-MEDIA tag of the target HLS audio rendition.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @group_id : String,
          @name : String
        )
        end
      end

      # Audio Language Selection

      struct AudioLanguageSelection
        include JSON::Serializable

        # Selects a specific three-letter language code from within an audio source.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String

        # When set to "strict", the transport stream demux strictly identifies audio streams by their language
        # descriptor. If a PMT update occurs such that an audio stream matching the initially selected
        # language is no longer present then mute will be encoded until the language returns. If "loose", then
        # on a PMT update the demux will choose another audio stream in the program with the same stream type
        # if it can't find one with the same language.

        @[JSON::Field(key: "languageSelectionPolicy")]
        getter language_selection_policy : String?

        def initialize(
          @language_code : String,
          @language_selection_policy : String? = nil
        )
        end
      end

      # Audio Normalization Settings

      struct AudioNormalizationSettings
        include JSON::Serializable

        # Audio normalization algorithm to use. itu17701 conforms to the CALM Act specification, itu17702
        # conforms to the EBU R-128 specification.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # When set to correctAudio the output audio is corrected using the chosen algorithm. If set to
        # measureOnly, the audio will be measured but not adjusted.

        @[JSON::Field(key: "algorithmControl")]
        getter algorithm_control : String?

        # Target LKFS(loudness) to adjust volume to. If no value is entered, a default value will be used
        # according to the chosen algorithm. The CALM Act recommends a target of -24 LKFS. The EBU R-128
        # specification recommends a target of -23 LKFS.

        @[JSON::Field(key: "targetLkfs")]
        getter target_lkfs : Float64?

        def initialize(
          @algorithm : String? = nil,
          @algorithm_control : String? = nil,
          @target_lkfs : Float64? = nil
        )
        end
      end

      # Audio Only Hls Settings

      struct AudioOnlyHlsSettings
        include JSON::Serializable

        # Specifies the group to which the audio Rendition belongs.

        @[JSON::Field(key: "audioGroupId")]
        getter audio_group_id : String?

        # Optional. Specifies the .jpg or .png image to use as the cover art for an audio-only output. We
        # recommend a low bit-size file because the image increases the output audio bandwidth. The image is
        # attached to the audio as an ID3 tag, frame type APIC, picture type 0x10, as per the "ID3 tag version
        # 2.4.0 - Native Frames" standard.

        @[JSON::Field(key: "audioOnlyImage")]
        getter audio_only_image : Types::InputLocation?

        # Four types of audio-only tracks are supported: Audio-Only Variant Stream The client can play back
        # this audio-only stream instead of video in low-bandwidth scenarios. Represented as an
        # EXT-X-STREAM-INF in the HLS manifest. Alternate Audio, Auto Select, Default Alternate rendition that
        # the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest
        # with DEFAULT=YES, AUTOSELECT=YES Alternate Audio, Auto Select, Not Default Alternate rendition that
        # the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with
        # DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select Alternate rendition that the client will
        # not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO,
        # AUTOSELECT=NO

        @[JSON::Field(key: "audioTrackType")]
        getter audio_track_type : String?

        # Specifies the segment type.

        @[JSON::Field(key: "segmentType")]
        getter segment_type : String?

        def initialize(
          @audio_group_id : String? = nil,
          @audio_only_image : Types::InputLocation? = nil,
          @audio_track_type : String? = nil,
          @segment_type : String? = nil
        )
        end
      end

      # Audio Pid Selection

      struct AudioPidSelection
        include JSON::Serializable

        # Selects a specific PID from within a source.

        @[JSON::Field(key: "pid")]
        getter pid : Int32

        def initialize(
          @pid : Int32
        )
        end
      end

      # Audio Selector

      struct AudioSelector
        include JSON::Serializable

        # The name of this AudioSelector. AudioDescriptions will use this name to uniquely identify this
        # Selector. Selector names should be unique per input.

        @[JSON::Field(key: "name")]
        getter name : String

        # The audio selector settings.

        @[JSON::Field(key: "selectorSettings")]
        getter selector_settings : Types::AudioSelectorSettings?

        def initialize(
          @name : String,
          @selector_settings : Types::AudioSelectorSettings? = nil
        )
        end
      end

      # Audio Selector Settings

      struct AudioSelectorSettings
        include JSON::Serializable


        @[JSON::Field(key: "audioHlsRenditionSelection")]
        getter audio_hls_rendition_selection : Types::AudioHlsRenditionSelection?


        @[JSON::Field(key: "audioLanguageSelection")]
        getter audio_language_selection : Types::AudioLanguageSelection?


        @[JSON::Field(key: "audioPidSelection")]
        getter audio_pid_selection : Types::AudioPidSelection?


        @[JSON::Field(key: "audioTrackSelection")]
        getter audio_track_selection : Types::AudioTrackSelection?

        def initialize(
          @audio_hls_rendition_selection : Types::AudioHlsRenditionSelection? = nil,
          @audio_language_selection : Types::AudioLanguageSelection? = nil,
          @audio_pid_selection : Types::AudioPidSelection? = nil,
          @audio_track_selection : Types::AudioTrackSelection? = nil
        )
        end
      end


      struct AudioSilenceFailoverSettings
        include JSON::Serializable

        # The name of the audio selector in the input that MediaLive should monitor to detect silence. Select
        # your most important rendition. If you didn't create an audio selector in this input, leave blank.

        @[JSON::Field(key: "audioSelectorName")]
        getter audio_selector_name : String

        # The amount of time (in milliseconds) that the active input must be silent before automatic input
        # failover occurs. Silence is defined as audio loss or audio quieter than -50 dBFS.

        @[JSON::Field(key: "audioSilenceThresholdMsec")]
        getter audio_silence_threshold_msec : Int32?

        def initialize(
          @audio_selector_name : String,
          @audio_silence_threshold_msec : Int32? = nil
        )
        end
      end

      # Audio Track

      struct AudioTrack
        include JSON::Serializable

        # 1-based integer value that maps to a specific audio track

        @[JSON::Field(key: "track")]
        getter track : Int32

        def initialize(
          @track : Int32
        )
        end
      end

      # Audio Track Selection

      struct AudioTrackSelection
        include JSON::Serializable

        # Selects one or more unique audio tracks from within a source.

        @[JSON::Field(key: "tracks")]
        getter tracks : Array(Types::AudioTrack)

        # Configure decoding options for Dolby E streams - these should be Dolby E frames carried in PCM
        # streams tagged with SMPTE-337

        @[JSON::Field(key: "dolbyEDecode")]
        getter dolby_e_decode : Types::AudioDolbyEDecode?

        def initialize(
          @tracks : Array(Types::AudioTrack),
          @dolby_e_decode : Types::AudioDolbyEDecode? = nil
        )
        end
      end

      # Audio Watermark Settings

      struct AudioWatermarkSettings
        include JSON::Serializable

        # Settings to configure Nielsen Watermarks in the audio encode

        @[JSON::Field(key: "nielsenWatermarksSettings")]
        getter nielsen_watermarks_settings : Types::NielsenWatermarksSettings?

        def initialize(
          @nielsen_watermarks_settings : Types::NielsenWatermarksSettings? = nil
        )
        end
      end

      # The settings for Automatic Input Failover.

      struct AutomaticInputFailoverSettings
        include JSON::Serializable

        # The input ID of the secondary input in the automatic input failover pair.

        @[JSON::Field(key: "secondaryInputId")]
        getter secondary_input_id : String

        # This clear time defines the requirement a recovered input must meet to be considered healthy. The
        # input must have no failover conditions for this length of time. Enter a time in milliseconds. This
        # value is particularly important if the input_preference for the failover pair is set to
        # PRIMARY_INPUT_PREFERRED, because after this time, MediaLive will switch back to the primary input.

        @[JSON::Field(key: "errorClearTimeMsec")]
        getter error_clear_time_msec : Int32?

        # A list of failover conditions. If any of these conditions occur, MediaLive will perform a failover
        # to the other input.

        @[JSON::Field(key: "failoverConditions")]
        getter failover_conditions : Array(Types::FailoverCondition)?

        # Input preference when deciding which input to make active when a previously failed input has
        # recovered.

        @[JSON::Field(key: "inputPreference")]
        getter input_preference : String?

        def initialize(
          @secondary_input_id : String,
          @error_clear_time_msec : Int32? = nil,
          @failover_conditions : Array(Types::FailoverCondition)? = nil,
          @input_preference : String? = nil
        )
        end
      end

      # Av1 Color Space Settings

      struct Av1ColorSpaceSettings
        include JSON::Serializable


        @[JSON::Field(key: "colorSpacePassthroughSettings")]
        getter color_space_passthrough_settings : Types::ColorSpacePassthroughSettings?


        @[JSON::Field(key: "hdr10Settings")]
        getter hdr10_settings : Types::Hdr10Settings?


        @[JSON::Field(key: "rec601Settings")]
        getter rec601_settings : Types::Rec601Settings?


        @[JSON::Field(key: "rec709Settings")]
        getter rec709_settings : Types::Rec709Settings?

        def initialize(
          @color_space_passthrough_settings : Types::ColorSpacePassthroughSettings? = nil,
          @hdr10_settings : Types::Hdr10Settings? = nil,
          @rec601_settings : Types::Rec601Settings? = nil,
          @rec709_settings : Types::Rec709Settings? = nil
        )
        end
      end

      # Av1 Settings

      struct Av1Settings
        include JSON::Serializable

        # The denominator for the framerate. Framerate is a fraction, for example, 24000 / 1001.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32

        # The numerator for the framerate. Framerate is a fraction, for example, 24000 / 1001.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32

        # Configures whether MediaLive will write AFD values into the video. AUTO: MediaLive will try to
        # preserve the input AFD value (in cases where multiple AFD values are valid). FIXED: the AFD value
        # will be the value configured in the fixedAfd parameter. NONE: MediaLive won't write AFD into the
        # video

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # Average bitrate in bits/second. Required when the rate control mode is CBR. Not used for QVBR.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # The size of the buffer (HRD buffer model) in bits.

        @[JSON::Field(key: "bufSize")]
        getter buf_size : Int32?

        # Specify the type of color space to apply or choose to pass through. The default is to pass through
        # the color space that is in the source.

        @[JSON::Field(key: "colorSpaceSettings")]
        getter color_space_settings : Types::Av1ColorSpaceSettings?

        # Complete this property only if you set the afdSignaling property to FIXED. Choose the AFD value (4
        # bits) to write on all frames of the video encode.

        @[JSON::Field(key: "fixedAfd")]
        getter fixed_afd : String?

        # The GOP size (keyframe interval). If GopSizeUnits is frames, GopSize must be a whole number and must
        # be greater than or equal to 1. If GopSizeUnits is seconds, GopSize must be greater than 0, but it
        # can be a decimal.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Choose the units for the GOP size: FRAMES or SECONDS. For SECONDS, MediaLive converts the size into
        # a frame count at run time.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # Sets the level. This parameter is one of the properties of the encoding scheme for AV1.

        @[JSON::Field(key: "level")]
        getter level : String?

        # Sets the amount of lookahead. A value of LOW can decrease latency and memory usage. A value of HIGH
        # can produce better quality for certain content.

        @[JSON::Field(key: "lookAheadRateControl")]
        getter look_ahead_rate_control : String?

        # The maximum bitrate to assign. For recommendations, see the description for qvbrQualityLevel.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Used for QVBR rate control mode only. Optional. Enter a minimum bitrate if you want to keep the
        # output bitrate about a threshold, in order to prevent the downstream system from de-allocating
        # network bandwidth for this output.

        @[JSON::Field(key: "minBitrate")]
        getter min_bitrate : Int32?

        # Applies only if you enable SceneChangeDetect. Sets the interval between frames. This property
        # ensures a minimum separation between repeated (cadence) I-frames and any I-frames inserted by scene
        # change detection (SCD frames). Enter a number for the interval, measured in number of frames. If an
        # SCD frame and a cadence frame are closer than the specified number of frames, MediaLive shrinks or
        # stretches the GOP to include the SCD frame. Then normal cadence resumes in the next GOP. For GOP
        # stretch to succeed, you must enable LookAheadRateControl. Note that the maximum GOP stretch = (GOP
        # size) + (Minimum I-interval) - 1

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # The denominator for the output pixel aspect ratio (PAR).

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # The numerator for the output pixel aspect ratio (PAR).

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Controls the target quality for the video encode. With QVBR rate control mode, the final quality is
        # the target quality, constrained by the maxBitrate. Set values for the qvbrQualityLevel property and
        # maxBitrate property that suit your most important viewing devices. To let MediaLive set the quality
        # level (AUTO mode), leave the qvbrQualityLevel field empty. In this case, MediaLive uses the maximum
        # bitrate, and the quality follows from that: more complex content might have a lower quality. Or set
        # a target quality level and a maximum bitrate. With more complex content, MediaLive will try to
        # achieve the target quality, but it won't exceed the maximum bitrate. With less complex content, This
        # option will use only the bitrate needed to reach the target quality. Recommended values are: Primary
        # screen: qvbrQualityLevel: Leave empty. maxBitrate: 4,000,000 PC or tablet: qvbrQualityLevel: Leave
        # empty. maxBitrate: 1,500,000 to 3,000,000 Smartphone: qvbrQualityLevel: Leave empty. maxBitrate:
        # 1,000,000 to 1,500,000

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Rate control mode. QVBR: Quality will match the specified quality level except when it is
        # constrained by the maximum bitrate. Recommended if you or your viewers pay for bandwidth. CBR:
        # Quality varies, depending on the video complexity. Recommended only if you distribute your assets to
        # devices that cannot handle variable bitrates.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Controls whether MediaLive inserts I-frames when it detects a scene change. ENABLED or DISABLED.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Spatial AQ makes adjustments within each frame based on spatial variation of content complexity.
        # Enabled: MediaLive will determine the appropriate level of spatial AQ to apply. Disabled: No spatial
        # AQ. For more information, see the topic about video adaptive quantization in the MediaLive user
        # guide.

        @[JSON::Field(key: "spatialAq")]
        getter spatial_aq : String?

        # Temporal AQ makes adjustments within each frame based on variations in content complexity over time.
        # Enabled: MediaLive will determine the appropriate level of temporal AQ to apply. Disabled: No
        # temporal AQ. For more information, see the topic about video adaptive quantization in the MediaLive
        # user guide.

        @[JSON::Field(key: "temporalAq")]
        getter temporal_aq : String?

        # Configures the timecode burn-in feature. If you enable this feature, the timecode will become part
        # of the video.

        @[JSON::Field(key: "timecodeBurninSettings")]
        getter timecode_burnin_settings : Types::TimecodeBurninSettings?

        def initialize(
          @framerate_denominator : Int32,
          @framerate_numerator : Int32,
          @afd_signaling : String? = nil,
          @bitrate : Int32? = nil,
          @buf_size : Int32? = nil,
          @color_space_settings : Types::Av1ColorSpaceSettings? = nil,
          @fixed_afd : String? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @level : String? = nil,
          @look_ahead_rate_control : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @qvbr_quality_level : Int32? = nil,
          @rate_control_mode : String? = nil,
          @scene_change_detect : String? = nil,
          @spatial_aq : String? = nil,
          @temporal_aq : String? = nil,
          @timecode_burnin_settings : Types::TimecodeBurninSettings? = nil
        )
        end
      end

      # Avail Blanking

      struct AvailBlanking
        include JSON::Serializable

        # Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.

        @[JSON::Field(key: "availBlankingImage")]
        getter avail_blanking_image : Types::InputLocation?

        # When set to enabled, causes video, audio and captions to be blanked when insertion metadata is
        # added.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @avail_blanking_image : Types::InputLocation? = nil,
          @state : String? = nil
        )
        end
      end

      # Avail Configuration

      struct AvailConfiguration
        include JSON::Serializable

        # Controls how SCTE-35 messages create cues. Splice Insert mode treats all segmentation signals
        # traditionally. With Time Signal APOS mode only Time Signal Placement Opportunity and Break messages
        # create segment breaks. With ESAM mode, signals are forwarded to an ESAM server for possible update.

        @[JSON::Field(key: "availSettings")]
        getter avail_settings : Types::AvailSettings?

        # Configures whether SCTE 35 passthrough triggers segment breaks in all output groups that use
        # segmented outputs. Insertion of a SCTE 35 message typically results in a segment break, in addition
        # to the regular cadence of breaks. The segment breaks appear in video outputs, audio outputs, and
        # captions outputs (if any). ALL_OUTPUT_GROUPS: Default. Insert the segment break in in all output
        # groups that have segmented outputs. This is the legacy behavior. SCTE35_ENABLED_OUTPUT_GROUPS:
        # Insert the segment break only in output groups that have SCTE 35 passthrough enabled. This is the
        # recommended value, because it reduces unnecessary segment breaks.

        @[JSON::Field(key: "scte35SegmentationScope")]
        getter scte35_segmentation_scope : String?

        def initialize(
          @avail_settings : Types::AvailSettings? = nil,
          @scte35_segmentation_scope : String? = nil
        )
        end
      end

      # Avail Settings

      struct AvailSettings
        include JSON::Serializable


        @[JSON::Field(key: "esam")]
        getter esam : Types::Esam?


        @[JSON::Field(key: "scte35SpliceInsert")]
        getter scte35_splice_insert : Types::Scte35SpliceInsert?


        @[JSON::Field(key: "scte35TimeSignalApos")]
        getter scte35_time_signal_apos : Types::Scte35TimeSignalApos?

        def initialize(
          @esam : Types::Esam? = nil,
          @scte35_splice_insert : Types::Scte35SpliceInsert? = nil,
          @scte35_time_signal_apos : Types::Scte35TimeSignalApos? = nil
        )
        end
      end


      struct BadGatewayException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct BadRequestExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Bandwidth Reduction Filter Settings

      struct BandwidthReductionFilterSettings
        include JSON::Serializable

        # Configures the sharpening control, which is available when the bandwidth reduction filter is
        # enabled. This control sharpens edges and contours, which produces a specific artistic effect that
        # you might want. We recommend that you test each of the values (including DISABLED) to observe the
        # sharpening effect on the content.

        @[JSON::Field(key: "postFilterSharpening")]
        getter post_filter_sharpening : String?

        # Enables the bandwidth reduction filter. The filter strengths range from 1 to 4. We recommend that
        # you always enable this filter and use AUTO, to let MediaLive apply the optimum filtering for the
        # context.

        @[JSON::Field(key: "strength")]
        getter strength : String?

        def initialize(
          @post_filter_sharpening : String? = nil,
          @strength : String? = nil
        )
        end
      end

      # Batch delete resource request

      struct BatchDelete
        include JSON::Serializable

        # List of channel IDs

        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # List of input IDs

        @[JSON::Field(key: "inputIds")]
        getter input_ids : Array(String)?

        # List of input security group IDs

        @[JSON::Field(key: "inputSecurityGroupIds")]
        getter input_security_group_ids : Array(String)?

        # List of multiplex IDs

        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @input_ids : Array(String)? = nil,
          @input_security_group_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchDeleteRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "inputIds")]
        getter input_ids : Array(String)?


        @[JSON::Field(key: "inputSecurityGroupIds")]
        getter input_security_group_ids : Array(String)?


        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @input_ids : Array(String)? = nil,
          @input_security_group_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchDeleteResponse
        include JSON::Serializable


        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?


        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Batch delete resource results

      struct BatchDeleteResultModel
        include JSON::Serializable

        # List of failed operations

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?

        # List of successful operations

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Details from a failed operation

      struct BatchFailedResultModel
        include JSON::Serializable

        # ARN of the resource

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Error code for the failed operation

        @[JSON::Field(key: "code")]
        getter code : String?

        # ID of the resource

        @[JSON::Field(key: "id")]
        getter id : String?

        # Error message for the failed operation

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @arn : String? = nil,
          @code : String? = nil,
          @id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A list of schedule actions to create (in a request) or that have been created (in a response).

      struct BatchScheduleActionCreateRequest
        include JSON::Serializable

        # A list of schedule actions to create.

        @[JSON::Field(key: "scheduleActions")]
        getter schedule_actions : Array(Types::ScheduleAction)

        def initialize(
          @schedule_actions : Array(Types::ScheduleAction)
        )
        end
      end

      # List of actions that have been created in the schedule.

      struct BatchScheduleActionCreateResult
        include JSON::Serializable

        # List of actions that have been created in the schedule.

        @[JSON::Field(key: "scheduleActions")]
        getter schedule_actions : Array(Types::ScheduleAction)

        def initialize(
          @schedule_actions : Array(Types::ScheduleAction)
        )
        end
      end

      # A list of schedule actions to delete.

      struct BatchScheduleActionDeleteRequest
        include JSON::Serializable

        # A list of schedule actions to delete.

        @[JSON::Field(key: "actionNames")]
        getter action_names : Array(String)

        def initialize(
          @action_names : Array(String)
        )
        end
      end

      # List of actions that have been deleted from the schedule.

      struct BatchScheduleActionDeleteResult
        include JSON::Serializable

        # List of actions that have been deleted from the schedule.

        @[JSON::Field(key: "scheduleActions")]
        getter schedule_actions : Array(Types::ScheduleAction)

        def initialize(
          @schedule_actions : Array(Types::ScheduleAction)
        )
        end
      end

      # Batch start resource request

      struct BatchStart
        include JSON::Serializable

        # List of channel IDs

        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # List of multiplex IDs

        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchStartRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchStartResponse
        include JSON::Serializable


        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?


        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Batch start resource results

      struct BatchStartResultModel
        include JSON::Serializable

        # List of failed operations

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?

        # List of successful operations

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Batch stop resource request

      struct BatchStop
        include JSON::Serializable

        # List of channel IDs

        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # List of multiplex IDs

        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchStopRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "multiplexIds")]
        getter multiplex_ids : Array(String)?

        def initialize(
          @channel_ids : Array(String)? = nil,
          @multiplex_ids : Array(String)? = nil
        )
        end
      end


      struct BatchStopResponse
        include JSON::Serializable


        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?


        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Batch stop resource results

      struct BatchStopResultModel
        include JSON::Serializable

        # List of failed operations

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchFailedResultModel)?

        # List of successful operations

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchSuccessfulResultModel)?

        def initialize(
          @failed : Array(Types::BatchFailedResultModel)? = nil,
          @successful : Array(Types::BatchSuccessfulResultModel)? = nil
        )
        end
      end

      # Details from a successful operation

      struct BatchSuccessfulResultModel
        include JSON::Serializable

        # ARN of the resource

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # ID of the resource

        @[JSON::Field(key: "id")]
        getter id : String?

        # Current state of the resource

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # A request to create actions (add actions to the schedule), delete actions (remove actions from the
      # schedule), or both create and delete actions.

      struct BatchUpdateScheduleRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # Schedule actions to create in the schedule.

        @[JSON::Field(key: "creates")]
        getter creates : Types::BatchScheduleActionCreateRequest?

        # Schedule actions to delete from the schedule.

        @[JSON::Field(key: "deletes")]
        getter deletes : Types::BatchScheduleActionDeleteRequest?

        def initialize(
          @channel_id : String,
          @creates : Types::BatchScheduleActionCreateRequest? = nil,
          @deletes : Types::BatchScheduleActionDeleteRequest? = nil
        )
        end
      end


      struct BatchUpdateScheduleResponse
        include JSON::Serializable


        @[JSON::Field(key: "creates")]
        getter creates : Types::BatchScheduleActionCreateResult?


        @[JSON::Field(key: "deletes")]
        getter deletes : Types::BatchScheduleActionDeleteResult?

        def initialize(
          @creates : Types::BatchScheduleActionCreateResult? = nil,
          @deletes : Types::BatchScheduleActionDeleteResult? = nil
        )
        end
      end

      # Results of a batch schedule update.

      struct BatchUpdateScheduleResult
        include JSON::Serializable

        # Schedule actions created in the schedule.

        @[JSON::Field(key: "creates")]
        getter creates : Types::BatchScheduleActionCreateResult?

        # Schedule actions deleted from the schedule.

        @[JSON::Field(key: "deletes")]
        getter deletes : Types::BatchScheduleActionDeleteResult?

        def initialize(
          @creates : Types::BatchScheduleActionCreateResult? = nil,
          @deletes : Types::BatchScheduleActionDeleteResult? = nil
        )
        end
      end

      # Blackout Slate

      struct BlackoutSlate
        include JSON::Serializable

        # Blackout slate image to be used. Leave empty for solid black. Only bmp and png images are supported.

        @[JSON::Field(key: "blackoutSlateImage")]
        getter blackout_slate_image : Types::InputLocation?

        # Setting to enabled causes the encoder to blackout the video, audio, and captions, and raise the
        # "Network Blackout Image" slate when an SCTE104/35 Network End Segmentation Descriptor is
        # encountered. The blackout will be lifted when the Network Start Segmentation Descriptor is
        # encountered. The Network End and Network Start descriptors must contain a network ID that matches
        # the value entered in "Network ID".

        @[JSON::Field(key: "networkEndBlackout")]
        getter network_end_blackout : String?

        # Path to local file to use as Network End Blackout image. Image will be scaled to fill the entire
        # output raster.

        @[JSON::Field(key: "networkEndBlackoutImage")]
        getter network_end_blackout_image : Types::InputLocation?

        # Provides Network ID that matches EIDR ID format (e.g., "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        # When set to enabled, causes video, audio and captions to be blanked when indicated by program
        # metadata.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @blackout_slate_image : Types::InputLocation? = nil,
          @network_end_blackout : String? = nil,
          @network_end_blackout_image : Types::InputLocation? = nil,
          @network_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Burn In Destination Settings

      struct BurnInDestinationSettings
        include JSON::Serializable

        # If no explicit xPosition or yPosition is provided, setting alignment to centered will place the
        # captions at the bottom center of the output. Similarly, setting a left alignment will align captions
        # to the bottom left of the output. If x and y positions are given in conjunction with the alignment
        # parameter, the font will be justified (either left or centered) relative to those coordinates.
        # Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded
        # subtitles. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "alignment")]
        getter alignment : String?

        # Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "backgroundColor")]
        getter background_color : String?

        # Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this
        # parameter out is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings
        # must match.

        @[JSON::Field(key: "backgroundOpacity")]
        getter background_opacity : Int32?

        # External font file used for caption burn-in. File extension must be 'ttf' or 'tte'. Although the
        # user can select output fonts for many different types of input captions, embedded, STL and teletext
        # sources use a strict grid system. Using external fonts with these caption sources could cause
        # unexpected display of proportional fonts. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "font")]
        getter font : Types::InputLocation?

        # Specifies the color of the burned-in captions. This option is not valid for source captions that are
        # STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream.
        # All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "fontColor")]
        getter font_color : String?

        # Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent. All burn-in and
        # DVB-Sub font settings must match.

        @[JSON::Field(key: "fontOpacity")]
        getter font_opacity : Int32?

        # Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and DVB-Sub font settings
        # must match.

        @[JSON::Field(key: "fontResolution")]
        getter font_resolution : Int32?

        # When set to 'auto' fontSize will scale depending on the size of the output. Giving a positive
        # integer will specify the exact font size in points. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "fontSize")]
        getter font_size : String?

        # Specifies font outline color. This option is not valid for source captions that are either
        # 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All
        # burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "outlineColor")]
        getter outline_color : String?

        # Specifies font outline size in pixels. This option is not valid for source captions that are either
        # 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All
        # burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "outlineSize")]
        getter outline_size : Int32?

        # Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "shadowColor")]
        getter shadow_color : String?

        # Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter out is
        # equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "shadowOpacity")]
        getter shadow_opacity : Int32?

        # Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2
        # would result in a shadow offset 2 pixels to the left. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "shadowXOffset")]
        getter shadow_x_offset : Int32?

        # Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels above the text. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "shadowYOffset")]
        getter shadow_y_offset : Int32?

        # Applies only when the input captions are Teletext and the output captions are DVB-Sub or Burn-In.
        # Choose the number of lines for the captions bitmap. The captions bitmap is 700 wide × 576 high and
        # will be laid over the video. For example, a value of 16 divides the bitmap into 16 lines, with each
        # line 36 pixels high (16 × 36 = 576). The default is 24 (24 pixels high). Enter the same number in
        # every encode in every output that converts the same Teletext source to DVB-Sub or Burn-in.

        @[JSON::Field(key: "subtitleRows")]
        getter subtitle_rows : String?

        # Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only
        # applicable for Teletext inputs and DVB-Sub/Burn-in outputs.

        @[JSON::Field(key: "teletextGridControl")]
        getter teletext_grid_control : String?

        # Specifies the horizontal position of the caption relative to the left side of the output in pixels.
        # A value of 10 would result in the captions starting 10 pixels from the left of the output. If no
        # explicit xPosition is provided, the horizontal caption position will be determined by the alignment
        # parameter. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "xPosition")]
        getter x_position : Int32?

        # Specifies the vertical position of the caption relative to the top of the output in pixels. A value
        # of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit
        # yPosition is provided, the caption will be positioned towards the bottom of the output. All burn-in
        # and DVB-Sub font settings must match.

        @[JSON::Field(key: "yPosition")]
        getter y_position : Int32?

        def initialize(
          @alignment : String? = nil,
          @background_color : String? = nil,
          @background_opacity : Int32? = nil,
          @font : Types::InputLocation? = nil,
          @font_color : String? = nil,
          @font_opacity : Int32? = nil,
          @font_resolution : Int32? = nil,
          @font_size : String? = nil,
          @outline_color : String? = nil,
          @outline_size : Int32? = nil,
          @shadow_color : String? = nil,
          @shadow_opacity : Int32? = nil,
          @shadow_x_offset : Int32? = nil,
          @shadow_y_offset : Int32? = nil,
          @subtitle_rows : String? = nil,
          @teletext_grid_control : String? = nil,
          @x_position : Int32? = nil,
          @y_position : Int32? = nil
        )
        end
      end


      struct CancelInputDeviceTransferRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct CancelInputDeviceTransferResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Caption Description

      struct CaptionDescription
        include JSON::Serializable

        # Specifies which input caption selector to use as a caption source when generating output captions.
        # This field should match a captionSelector name.

        @[JSON::Field(key: "captionSelectorName")]
        getter caption_selector_name : String

        # Name of the caption description. Used to associate a caption description with an output. Names must
        # be unique within an event.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether the caption track implements accessibility features such as written descriptions
        # of spoken dialog, music, and sounds. This signaling is added to HLS output group and MediaPackage
        # output group.

        @[JSON::Field(key: "accessibility")]
        getter accessibility : String?

        # Identifies the DASH roles to assign to this captions output. Applies only when the captions output
        # is configured for DVB DASH accessibility signaling.

        @[JSON::Field(key: "captionDashRoles")]
        getter caption_dash_roles : Array(String)?

        # Additional settings for captions destination that depend on the destination type.

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::CaptionDestinationSettings?

        # Identifies DVB DASH accessibility signaling in this captions output. Used in Microsoft Smooth
        # Streaming outputs to signal accessibility information to packagers.

        @[JSON::Field(key: "dvbDashAccessibility")]
        getter dvb_dash_accessibility : String?

        # ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Human readable information to indicate captions available for players (eg. English, or Spanish).

        @[JSON::Field(key: "languageDescription")]
        getter language_description : String?

        def initialize(
          @caption_selector_name : String,
          @name : String,
          @accessibility : String? = nil,
          @caption_dash_roles : Array(String)? = nil,
          @destination_settings : Types::CaptionDestinationSettings? = nil,
          @dvb_dash_accessibility : String? = nil,
          @language_code : String? = nil,
          @language_description : String? = nil
        )
        end
      end

      # Caption Destination Settings

      struct CaptionDestinationSettings
        include JSON::Serializable


        @[JSON::Field(key: "aribDestinationSettings")]
        getter arib_destination_settings : Types::AribDestinationSettings?


        @[JSON::Field(key: "burnInDestinationSettings")]
        getter burn_in_destination_settings : Types::BurnInDestinationSettings?


        @[JSON::Field(key: "dvbSubDestinationSettings")]
        getter dvb_sub_destination_settings : Types::DvbSubDestinationSettings?


        @[JSON::Field(key: "ebuTtDDestinationSettings")]
        getter ebu_tt_d_destination_settings : Types::EbuTtDDestinationSettings?


        @[JSON::Field(key: "embeddedDestinationSettings")]
        getter embedded_destination_settings : Types::EmbeddedDestinationSettings?


        @[JSON::Field(key: "embeddedPlusScte20DestinationSettings")]
        getter embedded_plus_scte20_destination_settings : Types::EmbeddedPlusScte20DestinationSettings?


        @[JSON::Field(key: "rtmpCaptionInfoDestinationSettings")]
        getter rtmp_caption_info_destination_settings : Types::RtmpCaptionInfoDestinationSettings?


        @[JSON::Field(key: "scte20PlusEmbeddedDestinationSettings")]
        getter scte20_plus_embedded_destination_settings : Types::Scte20PlusEmbeddedDestinationSettings?


        @[JSON::Field(key: "scte27DestinationSettings")]
        getter scte27_destination_settings : Types::Scte27DestinationSettings?


        @[JSON::Field(key: "smpteTtDestinationSettings")]
        getter smpte_tt_destination_settings : Types::SmpteTtDestinationSettings?


        @[JSON::Field(key: "teletextDestinationSettings")]
        getter teletext_destination_settings : Types::TeletextDestinationSettings?


        @[JSON::Field(key: "ttmlDestinationSettings")]
        getter ttml_destination_settings : Types::TtmlDestinationSettings?


        @[JSON::Field(key: "webvttDestinationSettings")]
        getter webvtt_destination_settings : Types::WebvttDestinationSettings?

        def initialize(
          @arib_destination_settings : Types::AribDestinationSettings? = nil,
          @burn_in_destination_settings : Types::BurnInDestinationSettings? = nil,
          @dvb_sub_destination_settings : Types::DvbSubDestinationSettings? = nil,
          @ebu_tt_d_destination_settings : Types::EbuTtDDestinationSettings? = nil,
          @embedded_destination_settings : Types::EmbeddedDestinationSettings? = nil,
          @embedded_plus_scte20_destination_settings : Types::EmbeddedPlusScte20DestinationSettings? = nil,
          @rtmp_caption_info_destination_settings : Types::RtmpCaptionInfoDestinationSettings? = nil,
          @scte20_plus_embedded_destination_settings : Types::Scte20PlusEmbeddedDestinationSettings? = nil,
          @scte27_destination_settings : Types::Scte27DestinationSettings? = nil,
          @smpte_tt_destination_settings : Types::SmpteTtDestinationSettings? = nil,
          @teletext_destination_settings : Types::TeletextDestinationSettings? = nil,
          @ttml_destination_settings : Types::TtmlDestinationSettings? = nil,
          @webvtt_destination_settings : Types::WebvttDestinationSettings? = nil
        )
        end
      end

      # Maps a caption channel to an ISO 693-2 language code (http://www.loc.gov/standards/iso639-2), with
      # an optional description.

      struct CaptionLanguageMapping
        include JSON::Serializable

        # The closed caption channel being described by this CaptionLanguageMapping. Each channel mapping must
        # have a unique channel number (maximum of 4)

        @[JSON::Field(key: "captionChannel")]
        getter caption_channel : Int32

        # Three character ISO 639-2 language code (see http://www.loc.gov/standards/iso639-2)

        @[JSON::Field(key: "languageCode")]
        getter language_code : String

        # Textual description of language

        @[JSON::Field(key: "languageDescription")]
        getter language_description : String

        def initialize(
          @caption_channel : Int32,
          @language_code : String,
          @language_description : String
        )
        end
      end

      # Caption Rectangle

      struct CaptionRectangle
        include JSON::Serializable

        # See the description in leftOffset. For height, specify the entire height of the rectangle as a
        # percentage of the underlying frame height. For example, \"80\" means the rectangle height is 80% of
        # the underlying frame height. The topOffset and rectangleHeight must add up to 100% or less. This
        # field corresponds to tts:extent - Y in the TTML standard.

        @[JSON::Field(key: "height")]
        getter height : Float64

        # Applies only if you plan to convert these source captions to EBU-TT-D or TTML in an output. (Make
        # sure to leave the default if you don't have either of these formats in the output.) You can define a
        # display rectangle for the captions that is smaller than the underlying video frame. You define the
        # rectangle by specifying the position of the left edge, top edge, bottom edge, and right edge of the
        # rectangle, all within the underlying video frame. The units for the measurements are percentages. If
        # you specify a value for one of these fields, you must specify a value for all of them. For
        # leftOffset, specify the position of the left edge of the rectangle, as a percentage of the
        # underlying frame width, and relative to the left edge of the frame. For example, \"10\" means the
        # measurement is 10% of the underlying frame width. The rectangle left edge starts at that position
        # from the left edge of the frame. This field corresponds to tts:origin - X in the TTML standard.

        @[JSON::Field(key: "leftOffset")]
        getter left_offset : Float64

        # See the description in leftOffset. For topOffset, specify the position of the top edge of the
        # rectangle, as a percentage of the underlying frame height, and relative to the top edge of the
        # frame. For example, \"10\" means the measurement is 10% of the underlying frame height. The
        # rectangle top edge starts at that position from the top edge of the frame. This field corresponds to
        # tts:origin - Y in the TTML standard.

        @[JSON::Field(key: "topOffset")]
        getter top_offset : Float64

        # See the description in leftOffset. For width, specify the entire width of the rectangle as a
        # percentage of the underlying frame width. For example, \"80\" means the rectangle width is 80% of
        # the underlying frame width. The leftOffset and rectangleWidth must add up to 100% or less. This
        # field corresponds to tts:extent - X in the TTML standard.

        @[JSON::Field(key: "width")]
        getter width : Float64

        def initialize(
          @height : Float64,
          @left_offset : Float64,
          @top_offset : Float64,
          @width : Float64
        )
        end
      end

      # Caption Selector

      struct CaptionSelector
        include JSON::Serializable

        # Name identifier for a caption selector. This name is used to associate this caption selector with
        # one or more caption descriptions. Names must be unique within an event.

        @[JSON::Field(key: "name")]
        getter name : String

        # When specified this field indicates the three letter language code of the caption track to extract
        # from the source.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Caption selector settings.

        @[JSON::Field(key: "selectorSettings")]
        getter selector_settings : Types::CaptionSelectorSettings?

        def initialize(
          @name : String,
          @language_code : String? = nil,
          @selector_settings : Types::CaptionSelectorSettings? = nil
        )
        end
      end

      # Caption Selector Settings

      struct CaptionSelectorSettings
        include JSON::Serializable


        @[JSON::Field(key: "ancillarySourceSettings")]
        getter ancillary_source_settings : Types::AncillarySourceSettings?


        @[JSON::Field(key: "aribSourceSettings")]
        getter arib_source_settings : Types::AribSourceSettings?


        @[JSON::Field(key: "dvbSubSourceSettings")]
        getter dvb_sub_source_settings : Types::DvbSubSourceSettings?


        @[JSON::Field(key: "embeddedSourceSettings")]
        getter embedded_source_settings : Types::EmbeddedSourceSettings?


        @[JSON::Field(key: "scte20SourceSettings")]
        getter scte20_source_settings : Types::Scte20SourceSettings?


        @[JSON::Field(key: "scte27SourceSettings")]
        getter scte27_source_settings : Types::Scte27SourceSettings?


        @[JSON::Field(key: "teletextSourceSettings")]
        getter teletext_source_settings : Types::TeletextSourceSettings?

        def initialize(
          @ancillary_source_settings : Types::AncillarySourceSettings? = nil,
          @arib_source_settings : Types::AribSourceSettings? = nil,
          @dvb_sub_source_settings : Types::DvbSubSourceSettings? = nil,
          @embedded_source_settings : Types::EmbeddedSourceSettings? = nil,
          @scte20_source_settings : Types::Scte20SourceSettings? = nil,
          @scte27_source_settings : Types::Scte27SourceSettings? = nil,
          @teletext_source_settings : Types::TeletextSourceSettings? = nil
        )
        end
      end


      struct CdiInputSpecification
        include JSON::Serializable

        # Maximum CDI input resolution

        @[JSON::Field(key: "resolution")]
        getter resolution : String?

        def initialize(
          @resolution : String? = nil
        )
        end
      end


      struct Channel
        include JSON::Serializable

        # Anywhere settings for this channel.

        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?

        # The unique arn of the channel.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Specification of CDI inputs for this channel

        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?

        # The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a
        # channel with one pipeline.

        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?

        # Requested engine version for this channel.

        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?

        # A list of destinations of the channel. For UDP outputs, there is one destination per output. For
        # other types (HLS, for example), there is one destination per packager.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?

        # The endpoints where outgoing connections initiate from

        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?

        # The unique id of the channel.

        @[JSON::Field(key: "id")]
        getter id : String?

        # List of input attachments for channel.

        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?

        # Specification of network and file inputs for this channel

        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?

        # Linked Channel Settings for this channel.

        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?

        # The log level being written to CloudWatch Logs.

        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # Maintenance settings for this channel.

        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?

        # The name of the channel. (user-mutable)

        @[JSON::Field(key: "name")]
        getter name : String?

        # Runtime details for the pipelines of a running channel.

        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?

        # The number of currently healthy pipelines.

        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?

        # The Amazon Resource Name (ARN) of the role assumed when running the Channel.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Settings for VPC output

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end

      # An alert on a channel

      struct ChannelAlert
        include JSON::Serializable

        # The type of the alert

        @[JSON::Field(key: "alertType")]
        getter alert_type : String?


        @[JSON::Field(key: "clearedTimestamp")]
        getter cleared_timestamp : Time?

        # The unique ID for this alert instance

        @[JSON::Field(key: "id")]
        getter id : String?

        # The user facing alert message which can have more context

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the pipeline this alert is associated with

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?


        @[JSON::Field(key: "setTimestamp")]
        getter set_timestamp : Time?

        # The state of the alert

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @alert_type : String? = nil,
          @cleared_timestamp : Time? = nil,
          @id : String? = nil,
          @message : String? = nil,
          @pipeline_id : String? = nil,
          @set_timestamp : Time? = nil,
          @state : String? = nil
        )
        end
      end


      struct ChannelConfigurationValidationError
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # A collection of validation error responses.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        def initialize(
          @message : String? = nil,
          @validation_errors : Array(Types::ValidationError)? = nil
        )
        end
      end


      struct ChannelEgressEndpoint
        include JSON::Serializable

        # Public IP of where a channel's output comes from

        @[JSON::Field(key: "sourceIp")]
        getter source_ip : String?

        def initialize(
          @source_ip : String? = nil
        )
        end
      end


      struct ChannelEngineVersionRequest
        include JSON::Serializable

        # The build identifier of the engine version to use for this channel. Specify 'DEFAULT' to reset to
        # the default version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @version : String? = nil
        )
        end
      end


      struct ChannelEngineVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # The build identifier for this version of the channel version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @expiration_date : Time? = nil,
          @version : String? = nil
        )
        end
      end


      struct ChannelSummary
        include JSON::Serializable

        # AnywhereSettings settings for this channel.

        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?

        # The unique arn of the channel.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Specification of CDI inputs for this channel

        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?

        # The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a
        # channel with one pipeline.

        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?

        # The engine version that you requested for this channel.

        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?

        # A list of destinations of the channel. For UDP outputs, there is one destination per output. For
        # other types (HLS, for example), there is one destination per packager.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?

        # The endpoints where outgoing connections initiate from

        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?

        # The unique id of the channel.

        @[JSON::Field(key: "id")]
        getter id : String?

        # List of input attachments for channel.

        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?

        # Specification of network and file inputs for this channel

        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?

        # Linked Channel Settings for this channel.

        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?

        # The log level being written to CloudWatch Logs.

        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # Maintenance settings for this channel.

        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?

        # The name of the channel. (user-mutable)

        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of currently healthy pipelines.

        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?

        # The Amazon Resource Name (ARN) of the role assumed when running the Channel.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The engine version that the running pipelines are using.

        @[JSON::Field(key: "usedChannelEngineVersions")]
        getter used_channel_engine_versions : Array(Types::ChannelEngineVersionResponse)?

        # Settings for any VPC outputs.

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @used_channel_engine_versions : Array(Types::ChannelEngineVersionResponse)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end

      # Request to claim an AWS Elemental device that you have purchased from a third-party vendor.

      struct ClaimDeviceRequest
        include JSON::Serializable

        # The id of the device you want to claim.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct ClaimDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CloudWatchAlarmTemplateGroupSummary
        include JSON::Serializable

        # A cloudwatch alarm template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of templates in a group.

        @[JSON::Field(key: "templateCount")]
        getter template_count : Int32

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @template_count : Int32,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CloudWatchAlarmTemplateSummary
        include JSON::Serializable

        # A cloudwatch alarm template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # A cloudwatch alarm template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @comparison_operator : String,
          @created_at : Time,
          @evaluation_periods : Int32,
          @group_id : String,
          @id : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An alert on a cluster

      struct ClusterAlert
        include JSON::Serializable

        # The type of the alert

        @[JSON::Field(key: "alertType")]
        getter alert_type : String?

        # The ID of the channel this alert is associated with

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "clearedTimestamp")]
        getter cleared_timestamp : Time?

        # The further subtype of this alert

        @[JSON::Field(key: "id")]
        getter id : String?

        # The user facing alert message which can have more context

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the node this alert is associated with

        @[JSON::Field(key: "nodeId")]
        getter node_id : String?


        @[JSON::Field(key: "setTimestamp")]
        getter set_timestamp : Time?

        # The state of the alert

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @alert_type : String? = nil,
          @channel_id : String? = nil,
          @cleared_timestamp : Time? = nil,
          @id : String? = nil,
          @message : String? = nil,
          @node_id : String? = nil,
          @set_timestamp : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in DescribeClusterResult, DescribeClusterSummary, UpdateClusterResult.

      struct ClusterNetworkSettings
        include JSON::Serializable

        # The network interface that is the default route for traffic to and from the node. MediaLive Anywhere
        # uses this default when the destination for the traffic isn't covered by the route table for any of
        # the networks. Specify the value of the appropriate logicalInterfaceName parameter that you create in
        # the interfaceMappings.

        @[JSON::Field(key: "defaultRoute")]
        getter default_route : String?

        # An array of interfaceMapping objects for this Cluster. Each mapping logically connects one interface
        # on the nodes with one Network. You need only one mapping for each interface because all the Nodes
        # share the mapping.

        @[JSON::Field(key: "interfaceMappings")]
        getter interface_mappings : Array(Types::InterfaceMapping)?

        def initialize(
          @default_route : String? = nil,
          @interface_mappings : Array(Types::InterfaceMapping)? = nil
        )
        end
      end

      # Used in a CreateClusterRequest.

      struct ClusterNetworkSettingsCreateRequest
        include JSON::Serializable

        # Specify one network interface as the default route for traffic to and from the Node. MediaLive
        # Anywhere uses this default when the destination for the traffic isn't covered by the route table for
        # any of the networks. Specify the value of the appropriate logicalInterfaceName parameter that you
        # create in the interfaceMappings.

        @[JSON::Field(key: "defaultRoute")]
        getter default_route : String?

        # An array of interfaceMapping objects for this Cluster. You must create a mapping for node interfaces
        # that you plan to use for encoding traffic. You typically don't create a mapping for the management
        # interface. You define this mapping in the Cluster so that the mapping can be used by all the Nodes.
        # Each mapping logically connects one interface on the nodes with one Network. Each mapping consists
        # of a pair of parameters. The logicalInterfaceName parameter creates a logical name for the Node
        # interface that handles a specific type of traffic. For example, my-Inputs-Interface. The networkID
        # parameter refers to the ID of the network. When you create the Nodes in this Cluster, you will
        # associate the logicalInterfaceName with the appropriate physical interface.

        @[JSON::Field(key: "interfaceMappings")]
        getter interface_mappings : Array(Types::InterfaceMappingCreateRequest)?

        def initialize(
          @default_route : String? = nil,
          @interface_mappings : Array(Types::InterfaceMappingCreateRequest)? = nil
        )
        end
      end


      struct ClusterNetworkSettingsUpdateRequest
        include JSON::Serializable

        # Include this parameter only if you want to change the default route for the Cluster. Specify one
        # network interface as the default route for traffic to and from the node. MediaLive Anywhere uses
        # this default when the destination for the traffic isn't covered by the route table for any of the
        # networks. Specify the value of the appropriate logicalInterfaceName parameter that you create in the
        # interfaceMappings.

        @[JSON::Field(key: "defaultRoute")]
        getter default_route : String?

        # An array of interfaceMapping objects for this Cluster. Include this parameter only if you want to
        # change the interface mappings for the Cluster. Typically, you change the interface mappings only to
        # fix an error you made when creating the mapping. In an update request, make sure that you enter the
        # entire set of mappings again, not just the mappings that you want to add or change. You define this
        # mapping so that the mapping can be used by all the Nodes. Each mapping logically connects one
        # interface on the nodes with one Network. Each mapping consists of a pair of parameters. The
        # logicalInterfaceName parameter creates a logical name for the Node interface that handles a specific
        # type of traffic. For example, my-Inputs-Interface. The networkID parameter refers to the ID of the
        # network. When you create the Nodes in this Cluster, you will associate the logicalInterfaceName with
        # the appropriate physical interface.

        @[JSON::Field(key: "interfaceMappings")]
        getter interface_mappings : Array(Types::InterfaceMappingUpdateRequest)?

        def initialize(
          @default_route : String? = nil,
          @interface_mappings : Array(Types::InterfaceMappingUpdateRequest)? = nil
        )
        end
      end

      # Add an array item for each language. Follow the order of the caption descriptions. For example, if
      # the first caption description is for German, then the first array item must be for German, and its
      # caption channel must be set to 1. The second array item must be 2, and so on.

      struct CmafIngestCaptionLanguageMapping
        include JSON::Serializable

        # A number for the channel for this caption, 1 to 4.

        @[JSON::Field(key: "captionChannel")]
        getter caption_channel : Int32

        # Language code for the language of the caption in this channel. For example, ger/deu. See
        # http://www.loc.gov/standards/iso639-2

        @[JSON::Field(key: "languageCode")]
        getter language_code : String

        def initialize(
          @caption_channel : Int32,
          @language_code : String
        )
        end
      end

      # Cmaf Ingest Group Settings

      struct CmafIngestGroupSettings
        include JSON::Serializable

        # A HTTP destination for the tracks

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # Optional an array of additional destinational HTTP destinations for the OutputGroup outputs

        @[JSON::Field(key: "additionalDestinations")]
        getter additional_destinations : Array(Types::AdditionalDestinations)?

        # An array that identifies the languages in the four caption channels in the embedded captions.

        @[JSON::Field(key: "captionLanguageMappings")]
        getter caption_language_mappings : Array(Types::CmafIngestCaptionLanguageMapping)?

        # Set to ENABLED to enable ID3 metadata insertion. To include metadata, you configure other parameters
        # in the output group, or you add an ID3 action to the channel schedule.

        @[JSON::Field(key: "id3Behavior")]
        getter id3_behavior : String?

        # Change the modifier that MediaLive automatically adds to the Streams() name that identifies an ID3
        # track. The default is "id3", which means the default name will be Streams(id3.cmfm). Any string you
        # enter here will replace the "id3" string.\nThe modifier can only contain: numbers, letters, plus
        # (+), minus (-), underscore (_) and period (.) and has a maximum length of 100 characters.

        @[JSON::Field(key: "id3NameModifier")]
        getter id3_name_modifier : String?

        # If set to passthrough, passes any KLV data from the input source to this output.

        @[JSON::Field(key: "klvBehavior")]
        getter klv_behavior : String?

        # Change the modifier that MediaLive automatically adds to the Streams() name that identifies a KLV
        # track. The default is "klv", which means the default name will be Streams(klv.cmfm). Any string you
        # enter here will replace the "klv" string.\nThe modifier can only contain: numbers, letters, plus
        # (+), minus (-), underscore (_) and period (.) and has a maximum length of 100 characters.

        @[JSON::Field(key: "klvNameModifier")]
        getter klv_name_modifier : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # Change the modifier that MediaLive automatically adds to the Streams() name that identifies a
        # Nielsen ID3 track. The default is "nid3", which means the default name will be Streams(nid3.cmfm).
        # Any string you enter here will replace the "nid3" string.\nThe modifier can only contain: numbers,
        # letters, plus (+), minus (-), underscore (_) and period (.) and has a maximum length of 100
        # characters.

        @[JSON::Field(key: "nielsenId3NameModifier")]
        getter nielsen_id3_name_modifier : String?

        # Change the modifier that MediaLive automatically adds to the Streams() name for a SCTE 35 track. The
        # default is "scte", which means the default name will be Streams(scte.cmfm). Any string you enter
        # here will replace the "scte" string.\nThe modifier can only contain: numbers, letters, plus (+),
        # minus (-), underscore (_) and period (.) and has a maximum length of 100 characters.

        @[JSON::Field(key: "scte35NameModifier")]
        getter scte35_name_modifier : String?

        # Type of scte35 track to add. none or scte35WithoutSegmentation

        @[JSON::Field(key: "scte35Type")]
        getter scte35_type : String?

        # The nominal duration of segments. The units are specified in SegmentLengthUnits. The segments will
        # end on the next keyframe after the specified duration, so the actual segment length might be longer,
        # and it might be a fraction of the units.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # Time unit for segment length parameter.

        @[JSON::Field(key: "segmentLengthUnits")]
        getter segment_length_units : String?

        # Number of milliseconds to delay the output from the second pipeline.

        @[JSON::Field(key: "sendDelayMs")]
        getter send_delay_ms : Int32?

        # Set to none if you don't want to insert a timecode in the output. Otherwise choose the frame type
        # for the timecode.

        @[JSON::Field(key: "timedMetadataId3Frame")]
        getter timed_metadata_id3_frame : String?

        # If you set up to insert a timecode in the output, specify the frequency for the frame, in seconds.

        @[JSON::Field(key: "timedMetadataId3Period")]
        getter timed_metadata_id3_period : Int32?

        # Set to enabled to pass through ID3 metadata from the input sources.

        @[JSON::Field(key: "timedMetadataPassthrough")]
        getter timed_metadata_passthrough : String?

        def initialize(
          @destination : Types::OutputLocationRef,
          @additional_destinations : Array(Types::AdditionalDestinations)? = nil,
          @caption_language_mappings : Array(Types::CmafIngestCaptionLanguageMapping)? = nil,
          @id3_behavior : String? = nil,
          @id3_name_modifier : String? = nil,
          @klv_behavior : String? = nil,
          @klv_name_modifier : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @nielsen_id3_name_modifier : String? = nil,
          @scte35_name_modifier : String? = nil,
          @scte35_type : String? = nil,
          @segment_length : Int32? = nil,
          @segment_length_units : String? = nil,
          @send_delay_ms : Int32? = nil,
          @timed_metadata_id3_frame : String? = nil,
          @timed_metadata_id3_period : Int32? = nil,
          @timed_metadata_passthrough : String? = nil
        )
        end
      end

      # Cmaf Ingest Output Settings

      struct CmafIngestOutputSettings
        include JSON::Serializable

        # String concatenated to the end of the destination filename. Required for multiple outputs of the
        # same type.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        def initialize(
          @name_modifier : String? = nil
        )
        end
      end

      # Property of ColorCorrectionSettings. Used for custom color space conversion. The object identifies
      # one 3D LUT file and specifies the input/output color space combination that the file will be used
      # for.

      struct ColorCorrection
        include JSON::Serializable

        # The color space of the input.

        @[JSON::Field(key: "inputColorSpace")]
        getter input_color_space : String

        # The color space of the output.

        @[JSON::Field(key: "outputColorSpace")]
        getter output_color_space : String

        # The URI of the 3D LUT file. The protocol must be 's3:' or 's3ssl:':.

        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @input_color_space : String,
          @output_color_space : String,
          @uri : String
        )
        end
      end

      # Property of encoderSettings. Controls color conversion when you are using 3D LUT files to perform
      # color conversion on video.

      struct ColorCorrectionSettings
        include JSON::Serializable

        # An array of colorCorrections that applies when you are using 3D LUT files to perform color
        # conversion on video. Each colorCorrection contains one 3D LUT file (that defines the color mapping
        # for converting an input color space to an output color space), and the input/output combination that
        # this 3D LUT file applies to. MediaLive reads the color space in the input metadata, determines the
        # color space that you have specified for the output, and finds and uses the LUT file that applies to
        # this combination.

        @[JSON::Field(key: "globalColorCorrections")]
        getter global_color_corrections : Array(Types::ColorCorrection)

        def initialize(
          @global_color_corrections : Array(Types::ColorCorrection)
        )
        end
      end

      # Passthrough applies no color space conversion to the output

      struct ColorSpacePassthroughSettings
        include JSON::Serializable

        def initialize
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateChannel
        include JSON::Serializable

        # The Elemental Anywhere settings for this channel.

        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::AnywhereSettings?

        # Specification of CDI inputs for this channel

        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?

        # The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a
        # channel with one pipeline.

        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?

        # The desired engine version for this channel.

        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionRequest?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?

        # List of input attachments for channel.

        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?

        # Specification of network and file inputs for this channel

        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?

        # The linked channel settings for the channel.

        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::LinkedChannelSettings?

        # The log level to write to CloudWatch Logs.

        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # Maintenance settings for this channel.

        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceCreateSettings?

        # Name of channel.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Unique request ID to be specified. This is needed to prevent retries from creating multiple
        # resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Deprecated field that's only usable by whitelisted customers.

        @[JSON::Field(key: "reserved")]
        getter reserved : String?

        # An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Settings for the VPC outputs

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettings?

        def initialize(
          @anywhere_settings : Types::AnywhereSettings? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @dry_run : Bool? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::LinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceCreateSettings? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @reserved : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettings? = nil
        )
        end
      end


      struct CreateChannelPlacementGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # Specify a name that is unique in the Cluster. You can't change the name. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of one ID for the Node that you want to associate with the ChannelPlacementGroup. (You
        # can't associate more than one Node with the ChannelPlacementGroup.) The Node and the
        # ChannelPlacementGroup must be in the same Cluster.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources. the
        # request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_id : String,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateChannelPlacementGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreateChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::AnywhereSettings?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionRequest?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::LinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceCreateSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "reserved")]
        getter reserved : String?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettings?

        def initialize(
          @anywhere_settings : Types::AnywhereSettings? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @dry_run : Bool? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::LinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceCreateSettings? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @reserved : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettings? = nil
        )
        end
      end


      struct CreateChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end


      struct CreateChannelResultModel
        include JSON::Serializable


        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateGroupRequestContent
        include JSON::Serializable

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateGroupResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String


        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String


        @[JSON::Field(key: "metricName")]
        getter metric_name : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String


        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String


        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @comparison_operator : String,
          @evaluation_periods : Int32,
          @group_identifier : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateRequestContent
        include JSON::Serializable


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # A cloudwatch alarm template group's identifier. Can be either be its id or current name.

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @comparison_operator : String,
          @evaluation_periods : Int32,
          @group_identifier : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "metricName")]
        getter metric_name : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "period")]
        getter period : Int32?


        @[JSON::Field(key: "statistic")]
        getter statistic : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String?


        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @arn : String? = nil,
          @comparison_operator : String? = nil,
          @created_at : Time? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @evaluation_periods : Int32? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @metric_name : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_resource_type : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end


      struct CreateCloudWatchAlarmTemplateResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # A cloudwatch alarm template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @comparison_operator : String,
          @created_at : Time,
          @evaluation_periods : Int32,
          @group_id : String,
          @id : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Used in the CreateCluster operation.

      struct CreateClusterRequest
        include JSON::Serializable

        # Specify a type. All the Nodes that you later add to this Cluster must be this type of hardware. One
        # Cluster instance can't contain different hardware types. You won't be able to change this parameter
        # after you create the Cluster.

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The ARN of the IAM role for the Node in this Cluster. The role must include all the operations that
        # you expect these Node to perform. If necessary, create a role in IAM, then attach it here.

        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?

        # Specify a name that is unique in the AWS account. We recommend that you assign a name that hints at
        # the types of Nodes in the Cluster. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Network settings that connect the Nodes in the Cluster to one or more of the Networks that the
        # Cluster is associated with.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettingsCreateRequest?

        # The unique ID of the request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_type : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettingsCreateRequest? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateGroupRequestContent
        include JSON::Serializable

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateGroupResponseContent
        include JSON::Serializable

        # An eventbridge rule template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "eventType")]
        getter event_type : String


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_type : String,
          @group_identifier : String,
          @name : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateRequestContent
        include JSON::Serializable


        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # An eventbridge rule template group's identifier. Can be either be its id or current name.

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_type : String,
          @group_identifier : String,
          @name : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "eventType")]
        getter event_type : String?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @event_type : String? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEventBridgeRuleTemplateResponseContent
        include JSON::Serializable

        # An eventbridge rule template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time


        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # An eventbridge rule template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @event_type : String,
          @group_id : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateInput
        include JSON::Serializable

        # Destination settings for PUSH type inputs.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestinationRequest)?

        # Settings for the devices.

        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSettings)?

        # The location of this input. AWS, for an input existing in the AWS Cloud, On-Prem for an input in a
        # customer network.

        @[JSON::Field(key: "inputNetworkLocation")]
        getter input_network_location : String?

        # A list of security groups referenced by IDs to attach to the input.

        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(String)?

        # A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one
        # Flow and presently, as many as two. The only requirement is when you have more than one is that each
        # Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues.

        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlowRequest)?

        # Multicast Input settings.

        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettingsCreateRequest?

        # Name of the input.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Unique identifier of the request to ensure the request is handled exactly once in case of retries.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The Amazon Resource Name (ARN) of the role this input assumes during and after creation.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "routerSettings")]
        getter router_settings : Types::RouterSettings?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?

        # Include this parameter if the input is a SMPTE 2110 input, to identify the stream sources for this
        # input.

        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?

        # The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for
        # redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSourceRequest)?

        # The settings associated with an SRT input.

        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettingsRequest?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::InputVpcRequest?

        def initialize(
          @destinations : Array(Types::InputDestinationRequest)? = nil,
          @input_devices : Array(Types::InputDeviceSettings)? = nil,
          @input_network_location : String? = nil,
          @input_security_groups : Array(String)? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
          @multicast_settings : Types::MulticastSettingsCreateRequest? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @role_arn : String? = nil,
          @router_settings : Types::RouterSettings? = nil,
          @sdi_sources : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSourceRequest)? = nil,
          @srt_settings : Types::SrtSettingsRequest? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @vpc : Types::InputVpcRequest? = nil
        )
        end
      end


      struct CreateInputRequest
        include JSON::Serializable


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestinationRequest)?


        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSettings)?


        @[JSON::Field(key: "inputNetworkLocation")]
        getter input_network_location : String?


        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(String)?


        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlowRequest)?


        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettingsCreateRequest?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "routerSettings")]
        getter router_settings : Types::RouterSettings?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?


        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSourceRequest)?


        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettingsRequest?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::InputVpcRequest?

        def initialize(
          @destinations : Array(Types::InputDestinationRequest)? = nil,
          @input_devices : Array(Types::InputDeviceSettings)? = nil,
          @input_network_location : String? = nil,
          @input_security_groups : Array(String)? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
          @multicast_settings : Types::MulticastSettingsCreateRequest? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @role_arn : String? = nil,
          @router_settings : Types::RouterSettings? = nil,
          @sdi_sources : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSourceRequest)? = nil,
          @srt_settings : Types::SrtSettingsRequest? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @vpc : Types::InputVpcRequest? = nil
        )
        end
      end


      struct CreateInputResponse
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end


      struct CreateInputResultModel
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end


      struct CreateInputSecurityGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "whitelistRules")]
        getter whitelist_rules : Array(Types::InputWhitelistRuleCidr)?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @whitelist_rules : Array(Types::InputWhitelistRuleCidr)? = nil
        )
        end
      end


      struct CreateInputSecurityGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::InputSecurityGroup?

        def initialize(
          @security_group : Types::InputSecurityGroup? = nil
        )
        end
      end


      struct CreateInputSecurityGroupResultModel
        include JSON::Serializable


        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::InputSecurityGroup?

        def initialize(
          @security_group : Types::InputSecurityGroup? = nil
        )
        end
      end


      struct CreateMultiplex
        include JSON::Serializable

        # A list of availability zones for the multiplex. You must specify exactly two.

        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)

        # Configuration for a multiplex event.

        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings

        # Name of multiplex.

        @[JSON::Field(key: "name")]
        getter name : String

        # Unique request ID. This prevents retries from creating multiple resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @availability_zones : Array(String),
          @multiplex_settings : Types::MultiplexSettings,
          @name : String,
          @request_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMultiplexProgram
        include JSON::Serializable

        # The settings for this multiplex program.

        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings

        # Name of multiplex program.

        @[JSON::Field(key: "programName")]
        getter program_name : String

        # Unique request ID. This prevents retries from creating multiple resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @multiplex_program_settings : Types::MultiplexProgramSettings,
          @program_name : String,
          @request_id : String
        )
        end
      end


      struct CreateMultiplexProgramRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings


        @[JSON::Field(key: "programName")]
        getter program_name : String


        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @multiplex_id : String,
          @multiplex_program_settings : Types::MultiplexProgramSettings,
          @program_name : String,
          @request_id : String
        )
        end
      end


      struct CreateMultiplexProgramResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplexProgram")]
        getter multiplex_program : Types::MultiplexProgram?

        def initialize(
          @multiplex_program : Types::MultiplexProgram? = nil
        )
        end
      end


      struct CreateMultiplexProgramResultModel
        include JSON::Serializable

        # The newly created multiplex program.

        @[JSON::Field(key: "multiplexProgram")]
        getter multiplex_program : Types::MultiplexProgram?

        def initialize(
          @multiplex_program : Types::MultiplexProgram? = nil
        )
        end
      end


      struct CreateMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "requestId")]
        getter request_id : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @availability_zones : Array(String),
          @multiplex_settings : Types::MultiplexSettings,
          @name : String,
          @request_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplex")]
        getter multiplex : Types::Multiplex?

        def initialize(
          @multiplex : Types::Multiplex? = nil
        )
        end
      end


      struct CreateMultiplexResultModel
        include JSON::Serializable

        # The newly created multiplex.

        @[JSON::Field(key: "multiplex")]
        getter multiplex : Types::Multiplex?

        def initialize(
          @multiplex : Types::Multiplex? = nil
        )
        end
      end

      # Used in the CreateNetwork operation.

      struct CreateNetworkRequest
        include JSON::Serializable

        # An array of IpPoolCreateRequests that identify a collection of IP addresses in your network that you
        # want to reserve for use in MediaLive Anywhere. MediaLiveAnywhere uses these IP addresses for Push
        # inputs (in both Bridge and NATnetworks) and for output destinations (only in Bridge networks).
        # EachIpPoolUpdateRequest specifies one CIDR block.

        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPoolCreateRequest)?

        # Specify a name that is unique in the AWS account. We recommend that you assign a name that hints at
        # the type of traffic on the network. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # An array of routes that MediaLive Anywhere needs to know about in order to route encoding traffic.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::RouteCreateRequest)?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ip_pools : Array(Types::IpPoolCreateRequest)? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @routes : Array(Types::RouteCreateRequest)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateNetworkResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in the CreateNodeRegistrationScript operation.

      struct CreateNodeRegistrationScriptRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # If you're generating a re-registration script for an already existing node, this is where you
        # provide the id.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Specify a pattern for MediaLive Anywhere to use to assign a name to each Node in the Cluster. The
        # pattern can include the variables $hn (hostname of the node hardware) and $ts for the date and time
        # that the Node is created, in UTC (for example, 2024-08-20T23:35:12Z).

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of interface mappings for the Node. Each mapping logically connects one physical interface
        # on the node hardware with one logical interface name. This mapping associates a node interface with
        # a network. The association works as follows: Node physicalInterfaceName > Node logicalInterfaceName
        # = Cluster logicalInterfaceName > networkId.

        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The initial role of the Node in the Cluster. ACTIVE means the Node is available for encoding. BACKUP
        # means the Node is a redundant Node and might get used if an ACTIVE Node fails.

        @[JSON::Field(key: "role")]
        getter role : String?

        def initialize(
          @cluster_id : String,
          @id : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @request_id : String? = nil,
          @role : String? = nil
        )
        end
      end


      struct CreateNodeRegistrationScriptResponse
        include JSON::Serializable


        @[JSON::Field(key: "nodeRegistrationScript")]
        getter node_registration_script : String?

        def initialize(
          @node_registration_script : String? = nil
        )
        end
      end

      # Contains the response for CreateNodeRegistrationScript.

      struct CreateNodeRegistrationScriptResult
        include JSON::Serializable

        # A script that can be run on a Bring Your Own Device Elemental Anywhere system to create a node in a
        # cluster.

        @[JSON::Field(key: "nodeRegistrationScript")]
        getter node_registration_script : String?

        def initialize(
          @node_registration_script : String? = nil
        )
        end
      end


      struct CreateNodeRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # The user-specified name of the Node to be created.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of interface mappings for the Node. Each mapping logically connects one physical interface
        # on the node hardware with one logical interface name. You created the logical names in the
        # logicalInterfaceName parameter when you created the Cluster. Create one mapping for each physical
        # interface on the node, but only for node interfaces that you plan to use for encoding content
        # traffic (and not for any management-only interface). In each mapping pair, we recommend that you
        # specify the logical name first, then assign the physical name that applies.The physicalInterfaceName
        # is the final piece of data that associates a node interface with a network. The association works as
        # follows: Node physicalInterfaceName > Node logicalInterfaceName = Cluster logicalInterfaceName >
        # networkId.

        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMappingCreateRequest)?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The initial role of the Node in the Cluster. ACTIVE means the Node is available for encoding. BACKUP
        # means the Node is a redundant Node and might get used if an ACTIVE Node fails.

        @[JSON::Field(key: "role")]
        getter role : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_id : String,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMappingCreateRequest)? = nil,
          @request_id : String? = nil,
          @role : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateNodeResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?


        @[JSON::Field(key: "role")]
        getter role : String?


        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreatePartnerInput
        include JSON::Serializable

        # Unique identifier of the request to ensure the request is handled exactly once in case of retries.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePartnerInputRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputId")]
        getter input_id : String


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input_id : String,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePartnerInputResponse
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end


      struct CreatePartnerInputResultModel
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end

      # Used in the CreateSdiSource operation.

      struct CreateSdiSourceRequest
        include JSON::Serializable

        # Applies only if the type is QUAD. Specify the mode for handling the quad-link signal: QUADRANT or
        # INTERLEAVE.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # Specify a name that is unique in the AWS account. We recommend you assign a name that describes the
        # source, for example curling-cameraA. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specify the type of the SDI source: SINGLE: The source is a single-link source. QUAD: The source is
        # one part of a quad-link source.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @mode : String? = nil,
          @name : String? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Used in CreateSdiSourceResponse.

      struct CreateSdiSourceResponse
        include JSON::Serializable

        # Settings for the SDI source.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : Types::SdiSource?

        def initialize(
          @sdi_source : Types::SdiSource? = nil
        )
        end
      end


      struct CreateSignalMapRequest
        include JSON::Serializable


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIdentifiers")]
        getter cloud_watch_alarm_template_group_identifiers : Array(String)?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIdentifiers")]
        getter event_bridge_rule_template_group_identifiers : Array(String)?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @discovery_entry_point_arn : String,
          @name : String,
          @cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
          @description : String? = nil,
          @event_bridge_rule_template_group_identifiers : Array(String)? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSignalMapRequestContent
        include JSON::Serializable

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIdentifiers")]
        getter cloud_watch_alarm_template_group_identifiers : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIdentifiers")]
        getter event_bridge_rule_template_group_identifiers : Array(String)?

        # An ID that you assign to a create request. This ID ensures idempotency when creating resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @discovery_entry_point_arn : String,
          @name : String,
          @cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
          @description : String? = nil,
          @event_bridge_rule_template_group_identifiers : Array(String)? = nil,
          @request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSignalMapResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @id : String? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_changes_pending_deployment : Bool? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSignalMapResponseContent
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # If true, there are pending monitor changes for this signal map that can be deployed.

        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Error message associated with a failed creation or failed update attempt of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @discovery_entry_point_arn : String,
          @id : String,
          @monitor_changes_pending_deployment : Bool,
          @name : String,
          @status : String,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTagsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteChannelPlacementGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelPlacementGroupId")]
        getter channel_placement_group_id : String


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        def initialize(
          @channel_placement_group_id : String,
          @cluster_id : String
        )
        end
      end


      struct DeleteChannelPlacementGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct DeleteChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end


      struct DeleteCloudWatchAlarmTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteCloudWatchAlarmTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteEventBridgeRuleTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteEventBridgeRuleTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteInputRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputId")]
        getter input_id : String

        def initialize(
          @input_id : String
        )
        end
      end


      struct DeleteInputResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInputSecurityGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputSecurityGroupId")]
        getter input_security_group_id : String

        def initialize(
          @input_security_group_id : String
        )
        end
      end


      struct DeleteInputSecurityGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMultiplexProgramRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "programName")]
        getter program_name : String

        def initialize(
          @multiplex_id : String,
          @program_name : String
        )
        end
      end


      struct DeleteMultiplexProgramResponse
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings?


        @[JSON::Field(key: "packetIdentifiersMap")]
        getter packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::MultiplexProgramPipelineDetail)?


        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @channel_id : String? = nil,
          @multiplex_program_settings : Types::MultiplexProgramSettings? = nil,
          @packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap? = nil,
          @pipeline_details : Array(Types::MultiplexProgramPipelineDetail)? = nil,
          @program_name : String? = nil
        )
        end
      end


      struct DeleteMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String

        def initialize(
          @multiplex_id : String
        )
        end
      end


      struct DeleteMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MultiplexOutputDestination)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @destinations : Array(Types::MultiplexOutputDestination)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteNetworkRequest
        include JSON::Serializable


        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct DeleteNetworkResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteNodeRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        def initialize(
          @cluster_id : String,
          @node_id : String
        )
        end
      end


      struct DeleteNodeResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?


        @[JSON::Field(key: "role")]
        getter role : String?


        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteReservationRequest
        include JSON::Serializable


        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String

        def initialize(
          @reservation_id : String
        )
        end
      end


      struct DeleteReservationResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "count")]
        getter count : Int32?


        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?


        @[JSON::Field(key: "duration")]
        getter duration : Int32?


        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String?


        @[JSON::Field(key: "end")]
        getter end : String?


        @[JSON::Field(key: "fixedPrice")]
        getter fixed_price : Float64?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String?


        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?


        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?


        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?


        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String?


        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ReservationResourceSpecification?


        @[JSON::Field(key: "start")]
        getter start : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "usagePrice")]
        getter usage_price : Float64?

        def initialize(
          @arn : String? = nil,
          @count : Int32? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @duration_units : String? = nil,
          @end : String? = nil,
          @fixed_price : Float64? = nil,
          @name : String? = nil,
          @offering_description : String? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @region : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil,
          @reservation_id : String? = nil,
          @resource_specification : Types::ReservationResourceSpecification? = nil,
          @start : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @usage_price : Float64? = nil
        )
        end
      end


      struct DeleteScheduleRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct DeleteScheduleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSdiSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "sdiSourceId")]
        getter sdi_source_id : String

        def initialize(
          @sdi_source_id : String
        )
        end
      end

      # Used in DeleteSdiSourceResponse.

      struct DeleteSdiSourceResponse
        include JSON::Serializable

        # Settings for the SDI source.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : Types::SdiSource?

        def initialize(
          @sdi_source : Types::SdiSource? = nil
        )
        end
      end


      struct DeleteSignalMapRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteTagsRequest
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


      struct DescribeAccountConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end

      # The account's configuration.

      struct DescribeAccountConfigurationResultModel
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end

      # Elemental anywhere settings

      struct DescribeAnywhereSettings
        include JSON::Serializable

        # The ID of the channel placement group for the channel.

        @[JSON::Field(key: "channelPlacementGroupId")]
        getter channel_placement_group_id : String?

        # The ID of the cluster for the channel.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        def initialize(
          @channel_placement_group_id : String? = nil,
          @cluster_id : String? = nil
        )
        end
      end


      struct DescribeChannelPlacementGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelPlacementGroupId")]
        getter channel_placement_group_id : String


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        def initialize(
          @channel_placement_group_id : String,
          @cluster_id : String
        )
        end
      end


      struct DescribeChannelPlacementGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for CreateChannelPlacementGroup, DescribeChannelPlacementGroup,
      # DeleteChannelPlacementGroup, UpdateChannelPlacementGroup

      struct DescribeChannelPlacementGroupResult
        include JSON::Serializable

        # The ARN of this ChannelPlacementGroup. It is automatically assigned when the ChannelPlacementGroup
        # is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Used in ListChannelPlacementGroupsResult

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The ID of the Cluster that the Node belongs to.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        # The ID of the ChannelPlacementGroup. Unique in the AWS account. The ID is the resource-id portion of
        # the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name that you specified for the ChannelPlacementGroup.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array with one item, which is the single Node that is associated with the ChannelPlacementGroup.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?

        # The current state of the ChannelPlacementGroup.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for ListChannelPlacementGroups

      struct DescribeChannelPlacementGroupSummary
        include JSON::Serializable

        # The ARN of this ChannelPlacementGroup. It is automatically assigned when the ChannelPlacementGroup
        # is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Used in ListChannelPlacementGroupsResult

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The ID of the Cluster that the Node belongs to.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        # The ID of the ChannelPlacementGroup. Unique in the AWS account. The ID is the resource-id portion of
        # the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name that you specified for the ChannelPlacementGroup.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array with one item, which is the single Node that is associated with the ChannelPlacementGroup.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?

        # The current state of the ChannelPlacementGroup.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct DescribeChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end


      struct DescribeClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end


      struct DescribeClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for CreateCluster, DescribeCluster, DeleteCluster, UpdateCluster

      struct DescribeClusterResult
        include JSON::Serializable

        # The ARN of this Cluster. It is automatically assigned when the Cluster is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # The hardware type for the Cluster

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The ID of the Cluster. Unique in the AWS account. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the IAM role for the Node in this Cluster. Any Nodes that are associated with this
        # Cluster assume this role. The role gives permissions to the operations that you expect these Node to
        # perform.

        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?

        # The name that you specified for the Cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Network settings that connect the Nodes in the Cluster to one or more of the Networks that the
        # Cluster is associated with.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?

        # The current state of the Cluster.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in ListClustersResult.

      struct DescribeClusterSummary
        include JSON::Serializable

        # The ARN of this Cluster. It is automatically assigned when the Cluster is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of the IDs of the Channels that are associated with this Cluster. One Channel is associated
        # with the Cluster as follows: A Channel belongs to a ChannelPlacementGroup. A ChannelPlacementGroup
        # is attached to a Node. A Node belongs to a Cluster.

        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # The hardware type for the Cluster.

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The ID of the Cluster. Unique in the AWS account. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the IAM role for the Node in this Cluster. Any Nodes that are associated with this
        # Cluster assume this role. The role gives permissions to the operations that you expect these Node to
        # perform.

        @[JSON::Field(key: "instanceRoleArn")]
        getter instance_role_arn : String?

        # The name that you specified for the Cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Network settings that connect the Nodes in the Cluster to one or more of the Networks that the
        # Cluster is associated with.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?

        # The current state of the Cluster.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @instance_role_arn : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end

      # Details of a follower channel in a linked pair

      struct DescribeFollowerChannelSettings
        include JSON::Serializable

        # Specifies this as a follower channel

        @[JSON::Field(key: "linkedChannelType")]
        getter linked_channel_type : String?

        # The ARN of the primary channel this channel follows

        @[JSON::Field(key: "primaryChannelArn")]
        getter primary_channel_arn : String?

        def initialize(
          @linked_channel_type : String? = nil,
          @primary_channel_arn : String? = nil
        )
        end
      end


      struct DescribeInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct DescribeInputDeviceResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "deviceSettingsSyncState")]
        getter device_settings_sync_state : String?


        @[JSON::Field(key: "deviceUpdateStatus")]
        getter device_update_status : String?


        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceHdSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?


        @[JSON::Field(key: "medialiveInputArns")]
        getter medialive_input_arns : Array(String)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::InputDeviceNetworkSettings?


        @[JSON::Field(key: "outputType")]
        getter output_type : String?


        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceUhdSettings?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @connection_state : String? = nil,
          @device_settings_sync_state : String? = nil,
          @device_update_status : String? = nil,
          @hd_device_settings : Types::InputDeviceHdSettings? = nil,
          @id : String? = nil,
          @mac_address : String? = nil,
          @medialive_input_arns : Array(String)? = nil,
          @name : String? = nil,
          @network_settings : Types::InputDeviceNetworkSettings? = nil,
          @output_type : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uhd_device_settings : Types::InputDeviceUhdSettings? = nil
        )
        end
      end


      struct DescribeInputDeviceThumbnailRequest
        include JSON::Serializable


        @[JSON::Field(key: "accept")]
        getter accept : String


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @accept : String,
          @input_device_id : String
        )
        end
      end


      struct DescribeInputDeviceThumbnailResponse
        include JSON::Serializable


        @[JSON::Field(key: "body")]
        getter body : Bytes?


        @[JSON::Field(key: "Content-Length")]
        getter content_length : Int64?


        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?


        @[JSON::Field(key: "ETag")]
        getter e_tag : String?


        @[JSON::Field(key: "Last-Modified")]
        getter last_modified : Time?

        def initialize(
          @body : Bytes? = nil,
          @content_length : Int64? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil,
          @last_modified : Time? = nil
        )
        end
      end


      struct DescribeInputRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputId")]
        getter input_id : String

        def initialize(
          @input_id : String
        )
        end
      end


      struct DescribeInputResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "attachedChannels")]
        getter attached_channels : Array(String)?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestination)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputClass")]
        getter input_class : String?


        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSettings)?


        @[JSON::Field(key: "inputNetworkLocation")]
        getter input_network_location : String?


        @[JSON::Field(key: "inputPartnerIds")]
        getter input_partner_ids : Array(String)?


        @[JSON::Field(key: "inputSourceType")]
        getter input_source_type : String?


        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlow)?


        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "routerSettings")]
        getter router_settings : Types::RouterInputSettings?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?


        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?


        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSource)?


        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettings?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @attached_channels : Array(String)? = nil,
          @destinations : Array(Types::InputDestination)? = nil,
          @id : String? = nil,
          @input_class : String? = nil,
          @input_devices : Array(Types::InputDeviceSettings)? = nil,
          @input_network_location : String? = nil,
          @input_partner_ids : Array(String)? = nil,
          @input_source_type : String? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlow)? = nil,
          @multicast_settings : Types::MulticastSettings? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @router_settings : Types::RouterInputSettings? = nil,
          @sdi_sources : Array(String)? = nil,
          @security_groups : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSource)? = nil,
          @srt_settings : Types::SrtSettings? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeInputSecurityGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputSecurityGroupId")]
        getter input_security_group_id : String

        def initialize(
          @input_security_group_id : String
        )
        end
      end


      struct DescribeInputSecurityGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputs")]
        getter inputs : Array(String)?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "whitelistRules")]
        getter whitelist_rules : Array(Types::InputWhitelistRule)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @inputs : Array(String)? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @whitelist_rules : Array(Types::InputWhitelistRule)? = nil
        )
        end
      end

      # Linked channel configuration details

      struct DescribeLinkedChannelSettings
        include JSON::Serializable


        @[JSON::Field(key: "followerChannelSettings")]
        getter follower_channel_settings : Types::DescribeFollowerChannelSettings?


        @[JSON::Field(key: "primaryChannelSettings")]
        getter primary_channel_settings : Types::DescribePrimaryChannelSettings?

        def initialize(
          @follower_channel_settings : Types::DescribeFollowerChannelSettings? = nil,
          @primary_channel_settings : Types::DescribePrimaryChannelSettings? = nil
        )
        end
      end


      struct DescribeMultiplexProgramRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "programName")]
        getter program_name : String

        def initialize(
          @multiplex_id : String,
          @program_name : String
        )
        end
      end


      struct DescribeMultiplexProgramResponse
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings?


        @[JSON::Field(key: "packetIdentifiersMap")]
        getter packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::MultiplexProgramPipelineDetail)?


        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @channel_id : String? = nil,
          @multiplex_program_settings : Types::MultiplexProgramSettings? = nil,
          @packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap? = nil,
          @pipeline_details : Array(Types::MultiplexProgramPipelineDetail)? = nil,
          @program_name : String? = nil
        )
        end
      end


      struct DescribeMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String

        def initialize(
          @multiplex_id : String
        )
        end
      end


      struct DescribeMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MultiplexOutputDestination)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @destinations : Array(Types::MultiplexOutputDestination)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeNetworkRequest
        include JSON::Serializable


        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct DescribeNetworkResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for CreateNetwork, DescribeNetwork, DeleteNetwork, UpdateNetwork.

      struct DescribeNetworkResult
        include JSON::Serializable

        # The ARN of this Network. It is automatically assigned when the Network is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?

        # The ID of the Network. Unique in the AWS account. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An array of IpPools in your organization's network that identify a collection of IP addresses in
        # this network that are reserved for use in MediaLive Anywhere. MediaLive Anywhere uses these IP
        # addresses for Push inputs (in both Bridge and NAT networks) and for output destinations (only in
        # Bridge networks). Each IpPool specifies one CIDR block.

        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?

        # The name that you specified for the Network.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of routes that MediaLive Anywhere needs to know about in order to route encoding traffic.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?

        # The current state of the Network. Only MediaLive Anywhere can change the state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in ListNetworksResult.

      struct DescribeNetworkSummary
        include JSON::Serializable

        # The ARN of this Network. It is automatically assigned when the Network is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?

        # The ID of the Network. Unique in the AWS account. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An array of IpPools in your organization's network that identify a collection of IP addresses in
        # your organization's network that are reserved for use in MediaLive Anywhere. MediaLive Anywhere uses
        # these IP addresses for Push inputs (in both Bridge and NAT networks) and for output destinations
        # (only in Bridge networks). Each IpPool specifies one CIDR block.

        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?

        # The name that you specified for this Network.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of routes that MediaLive Anywhere needs to know about in order to route encoding traffic.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?

        # The current state of the Network. Only MediaLive Anywhere can change the state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeNodeRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        def initialize(
          @cluster_id : String,
          @node_id : String
        )
        end
      end


      struct DescribeNodeResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?


        @[JSON::Field(key: "role")]
        getter role : String?


        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for CreateNode, DescribeNode, DeleteNode, UpdateNode

      struct DescribeNodeResult
        include JSON::Serializable

        # The ARN of the Node. It is automatically assigned when the Node is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of IDs. Each ID is one ChannelPlacementGroup that is associated with this Node. Empty if
        # the Node is not yet associated with any groups.

        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?

        # The ID of the Cluster that the Node belongs to.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        # The current connection state of the Node.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        # The unique ID of the Node. Unique in the Cluster. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the EC2 instance hosting the Node.

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # The name that you specified for the Node.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of interface mappings for the Node. Each mapping logically connects one physical interface
        # on the node hardware with one logical interface name. This mapping associates a node interface with
        # a network. The association works as follows: Node physicalInterfaceName > Node logicalInterfaceName
        # = Cluster logicalInterfaceName > networkId.

        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?

        # The initial role current role of the Node in the Cluster. ACTIVE means the Node is available for
        # encoding. BACKUP means the Node is a redundant Node and might get used if an ACTIVE Node fails.

        @[JSON::Field(key: "role")]
        getter role : String?

        # An array of SDI source mappings. Each mapping connects one logical SdiSource to the physical SDI
        # card and port that the physical SDI source uses.

        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?

        # The current state of the Node.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeNodeSummary
        include JSON::Serializable

        # The ARN of the Node. It is automatically assigned when the Node is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of IDs. Each ID is one ChannelPlacementGroup that is associated with this Node. Empty if
        # the Node is not yet associated with any groups.

        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?

        # The ID of the Cluster that the Node belongs to.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        # The current connection state of the Node.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        # The unique ID of the Node. Unique in the Cluster. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The EC2 ARN of the Instance associated with the Node.

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # At the routing layer will get it from the callerId/context for use with bring your own device.

        @[JSON::Field(key: "managedInstanceId")]
        getter managed_instance_id : String?

        # The name that you specified for the Node.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of interface mappings for the Node. Each mapping logically connects one physical interface
        # on the node hardware with one logical interface name. This mapping associates a node interface with
        # a network. The association works as follows: Node physicalInterfaceName > Node logicalInterfaceName
        # = Cluster logicalInterfaceName > networkId.

        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?

        # The initial role current role of the Node in the Cluster. ACTIVE means the Node is available for
        # encoding. BACKUP means the Node is a redundant Node and might get used if an ACTIVE Node fails.

        @[JSON::Field(key: "role")]
        getter role : String?

        # An array of SDI source mappings. Each mapping connects one logical SdiSource to the physical SDI
        # card and port that the physical SDI source uses.

        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?

        # The current state of the Node.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @managed_instance_id : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeOfferingRequest
        include JSON::Serializable


        @[JSON::Field(key: "offeringId")]
        getter offering_id : String

        def initialize(
          @offering_id : String
        )
        end
      end


      struct DescribeOfferingResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?


        @[JSON::Field(key: "duration")]
        getter duration : Int32?


        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String?


        @[JSON::Field(key: "fixedPrice")]
        getter fixed_price : Float64?


        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String?


        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?


        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?


        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ReservationResourceSpecification?


        @[JSON::Field(key: "usagePrice")]
        getter usage_price : Float64?

        def initialize(
          @arn : String? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @duration_units : String? = nil,
          @fixed_price : Float64? = nil,
          @offering_description : String? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @region : String? = nil,
          @resource_specification : Types::ReservationResourceSpecification? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Details of a primary (leader) channel in a linked pair

      struct DescribePrimaryChannelSettings
        include JSON::Serializable

        # The ARNs of the following channels for this primary channel

        @[JSON::Field(key: "followingChannelArns")]
        getter following_channel_arns : Array(String)?

        # Specifies this as a primary channel

        @[JSON::Field(key: "linkedChannelType")]
        getter linked_channel_type : String?

        def initialize(
          @following_channel_arns : Array(String)? = nil,
          @linked_channel_type : String? = nil
        )
        end
      end


      struct DescribeReservationRequest
        include JSON::Serializable


        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String

        def initialize(
          @reservation_id : String
        )
        end
      end


      struct DescribeReservationResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "count")]
        getter count : Int32?


        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?


        @[JSON::Field(key: "duration")]
        getter duration : Int32?


        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String?


        @[JSON::Field(key: "end")]
        getter end : String?


        @[JSON::Field(key: "fixedPrice")]
        getter fixed_price : Float64?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String?


        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?


        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?


        @[JSON::Field(key: "region")]
        getter region : String?


        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?


        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String?


        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ReservationResourceSpecification?


        @[JSON::Field(key: "start")]
        getter start : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "usagePrice")]
        getter usage_price : Float64?

        def initialize(
          @arn : String? = nil,
          @count : Int32? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @duration_units : String? = nil,
          @end : String? = nil,
          @fixed_price : Float64? = nil,
          @name : String? = nil,
          @offering_description : String? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @region : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil,
          @reservation_id : String? = nil,
          @resource_specification : Types::ReservationResourceSpecification? = nil,
          @start : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @usage_price : Float64? = nil
        )
        end
      end


      struct DescribeScheduleRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeScheduleResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "scheduleActions")]
        getter schedule_actions : Array(Types::ScheduleAction)?

        def initialize(
          @next_token : String? = nil,
          @schedule_actions : Array(Types::ScheduleAction)? = nil
        )
        end
      end


      struct DescribeSdiSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "sdiSourceId")]
        getter sdi_source_id : String

        def initialize(
          @sdi_source_id : String
        )
        end
      end

      # Used in DescribeSdiSourceResponse.

      struct DescribeSdiSourceResponse
        include JSON::Serializable

        # Settings for the SDI source.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : Types::SdiSource?

        def initialize(
          @sdi_source : Types::SdiSource? = nil
        )
        end
      end


      struct DescribeThumbnailsRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String


        @[JSON::Field(key: "thumbnailType")]
        getter thumbnail_type : String

        def initialize(
          @channel_id : String,
          @pipeline_id : String,
          @thumbnail_type : String
        )
        end
      end


      struct DescribeThumbnailsResponse
        include JSON::Serializable


        @[JSON::Field(key: "thumbnailDetails")]
        getter thumbnail_details : Array(Types::ThumbnailDetail)?

        def initialize(
          @thumbnail_details : Array(Types::ThumbnailDetail)? = nil
        )
        end
      end

      # Thumbnail details for all the pipelines of a running channel.

      struct DescribeThumbnailsResultModel
        include JSON::Serializable


        @[JSON::Field(key: "thumbnailDetails")]
        getter thumbnail_details : Array(Types::ThumbnailDetail)?

        def initialize(
          @thumbnail_details : Array(Types::ThumbnailDetail)? = nil
        )
        end
      end

      # Dolby Vision81 Settings

      struct DolbyVision81Settings
        include JSON::Serializable

        def initialize
        end
      end

      # DVB Network Information Table (NIT)

      struct DvbNitSettings
        include JSON::Serializable

        # The numeric value placed in the Network Information Table (NIT).

        @[JSON::Field(key: "networkId")]
        getter network_id : Int32

        # The network name text placed in the networkNameDescriptor inside the Network Information Table.
        # Maximum length is 256 characters.

        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "repInterval")]
        getter rep_interval : Int32?

        def initialize(
          @network_id : Int32,
          @network_name : String,
          @rep_interval : Int32? = nil
        )
        end
      end

      # DVB Service Description Table (SDT)

      struct DvbSdtSettings
        include JSON::Serializable

        # Selects method of inserting SDT information into output stream. The sdtFollow setting copies SDT
        # information from input stream to output stream. The sdtFollowIfPresent setting copies SDT
        # information from input stream to output stream if SDT information is present in the input, otherwise
        # it will fall back on the user-defined values. The sdtManual setting means user will enter the SDT
        # information. The sdtNone setting means output stream will not contain SDT information.

        @[JSON::Field(key: "outputSdt")]
        getter output_sdt : String?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "repInterval")]
        getter rep_interval : Int32?

        # The service name placed in the serviceDescriptor in the Service Description Table. Maximum length is
        # 256 characters.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service provider name placed in the serviceDescriptor in the Service Description Table. Maximum
        # length is 256 characters.

        @[JSON::Field(key: "serviceProviderName")]
        getter service_provider_name : String?

        def initialize(
          @output_sdt : String? = nil,
          @rep_interval : Int32? = nil,
          @service_name : String? = nil,
          @service_provider_name : String? = nil
        )
        end
      end

      # Dvb Sub Destination Settings

      struct DvbSubDestinationSettings
        include JSON::Serializable

        # If no explicit xPosition or yPosition is provided, setting alignment to centered will place the
        # captions at the bottom center of the output. Similarly, setting a left alignment will align captions
        # to the bottom left of the output. If x and y positions are given in conjunction with the alignment
        # parameter, the font will be justified (either left or centered) relative to those coordinates.
        # Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded
        # subtitles. This option is not valid for source captions that are STL or 608/embedded. These source
        # settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "alignment")]
        getter alignment : String?

        # Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "backgroundColor")]
        getter background_color : String?

        # Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this
        # parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font
        # settings must match.

        @[JSON::Field(key: "backgroundOpacity")]
        getter background_opacity : Int32?

        # External font file used for caption burn-in. File extension must be 'ttf' or 'tte'. Although the
        # user can select output fonts for many different types of input captions, embedded, STL and teletext
        # sources use a strict grid system. Using external fonts with these caption sources could cause
        # unexpected display of proportional fonts. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "font")]
        getter font : Types::InputLocation?

        # Specifies the color of the burned-in captions. This option is not valid for source captions that are
        # STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream.
        # All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "fontColor")]
        getter font_color : String?

        # Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent. All burn-in and
        # DVB-Sub font settings must match.

        @[JSON::Field(key: "fontOpacity")]
        getter font_opacity : Int32?

        # Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and DVB-Sub font settings
        # must match.

        @[JSON::Field(key: "fontResolution")]
        getter font_resolution : Int32?

        # When set to auto fontSize will scale depending on the size of the output. Giving a positive integer
        # will specify the exact font size in points. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "fontSize")]
        getter font_size : String?

        # Specifies font outline color. This option is not valid for source captions that are either
        # 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All
        # burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "outlineColor")]
        getter outline_color : String?

        # Specifies font outline size in pixels. This option is not valid for source captions that are either
        # 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All
        # burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "outlineSize")]
        getter outline_size : Int32?

        # Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "shadowColor")]
        getter shadow_color : String?

        # Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter blank
        # is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "shadowOpacity")]
        getter shadow_opacity : Int32?

        # Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2
        # would result in a shadow offset 2 pixels to the left. All burn-in and DVB-Sub font settings must
        # match.

        @[JSON::Field(key: "shadowXOffset")]
        getter shadow_x_offset : Int32?

        # Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels above the text. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "shadowYOffset")]
        getter shadow_y_offset : Int32?

        # Applies only when the input captions are Teletext and the output captions are DVB-Sub or Burn-In.
        # Choose the number of lines for the captions bitmap. The captions bitmap is 700 wide × 576 high and
        # will be laid over the video. For example, a value of 16 divides the bitmap into 16 lines, with each
        # line 36 pixels high (16 × 36 = 576). The default is 24 (24 pixels high). Enter the same number in
        # every encode in every output that converts the same Teletext source to DVB-Sub or Burn-in.

        @[JSON::Field(key: "subtitleRows")]
        getter subtitle_rows : String?

        # Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only
        # applicable for Teletext inputs and DVB-Sub/Burn-in outputs.

        @[JSON::Field(key: "teletextGridControl")]
        getter teletext_grid_control : String?

        # Specifies the horizontal position of the caption relative to the left side of the output in pixels.
        # A value of 10 would result in the captions starting 10 pixels from the left of the output. If no
        # explicit xPosition is provided, the horizontal caption position will be determined by the alignment
        # parameter. This option is not valid for source captions that are STL, 608/embedded or teletext.
        # These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font
        # settings must match.

        @[JSON::Field(key: "xPosition")]
        getter x_position : Int32?

        # Specifies the vertical position of the caption relative to the top of the output in pixels. A value
        # of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit
        # yPosition is provided, the caption will be positioned towards the bottom of the output. This option
        # is not valid for source captions that are STL, 608/embedded or teletext. These source settings are
        # already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "yPosition")]
        getter y_position : Int32?

        def initialize(
          @alignment : String? = nil,
          @background_color : String? = nil,
          @background_opacity : Int32? = nil,
          @font : Types::InputLocation? = nil,
          @font_color : String? = nil,
          @font_opacity : Int32? = nil,
          @font_resolution : Int32? = nil,
          @font_size : String? = nil,
          @outline_color : String? = nil,
          @outline_size : Int32? = nil,
          @shadow_color : String? = nil,
          @shadow_opacity : Int32? = nil,
          @shadow_x_offset : Int32? = nil,
          @shadow_y_offset : Int32? = nil,
          @subtitle_rows : String? = nil,
          @teletext_grid_control : String? = nil,
          @x_position : Int32? = nil,
          @y_position : Int32? = nil
        )
        end
      end

      # Dvb Sub Source Settings

      struct DvbSubSourceSettings
        include JSON::Serializable

        # If you will configure a WebVTT caption description that references this caption selector, use this
        # field to provide the language to consider when translating the image-based source to text.

        @[JSON::Field(key: "ocrLanguage")]
        getter ocr_language : String?

        # When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub
        # passthrough. All DVB-Sub content is passed through, regardless of selectors.

        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        def initialize(
          @ocr_language : String? = nil,
          @pid : Int32? = nil
        )
        end
      end

      # DVB Time and Date Table (SDT)

      struct DvbTdtSettings
        include JSON::Serializable

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "repInterval")]
        getter rep_interval : Int32?

        def initialize(
          @rep_interval : Int32? = nil
        )
        end
      end

      # Eac3 Atmos Settings

      struct Eac3AtmosSettings
        include JSON::Serializable

        # Average bitrate in bits/second. Valid bitrates depend on the coding mode.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Float64?

        # Dolby Digital Plus with Dolby Atmos coding mode. Determines number of channels.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Sets the dialnorm for the output. Default 23.

        @[JSON::Field(key: "dialnorm")]
        getter dialnorm : Int32?

        # Sets the Dolby dynamic range compression profile.

        @[JSON::Field(key: "drcLine")]
        getter drc_line : String?

        # Sets the profile for heavy Dolby dynamic range compression, ensures that the instantaneous signal
        # peaks do not exceed specified levels.

        @[JSON::Field(key: "drcRf")]
        getter drc_rf : String?

        # Height dimensional trim. Sets the maximum amount to attenuate the height channels when the
        # downstream player isn??t configured to handle Dolby Digital Plus with Dolby Atmos and must remix the
        # channels.

        @[JSON::Field(key: "heightTrim")]
        getter height_trim : Float64?

        # Surround dimensional trim. Sets the maximum amount to attenuate the surround channels when the
        # downstream player isn't configured to handle Dolby Digital Plus with Dolby Atmos and must remix the
        # channels.

        @[JSON::Field(key: "surroundTrim")]
        getter surround_trim : Float64?

        def initialize(
          @bitrate : Float64? = nil,
          @coding_mode : String? = nil,
          @dialnorm : Int32? = nil,
          @drc_line : String? = nil,
          @drc_rf : String? = nil,
          @height_trim : Float64? = nil,
          @surround_trim : Float64? = nil
        )
        end
      end

      # Eac3 Settings

      struct Eac3Settings
        include JSON::Serializable

        # When set to attenuate3Db, applies a 3 dB attenuation to the surround channels. Only used for 3/2
        # coding mode.

        @[JSON::Field(key: "attenuationControl")]
        getter attenuation_control : String?

        # Average bitrate in bits/second. Valid bitrates depend on the coding mode.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Float64?

        # Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC A/52-2012 (Annex E) for
        # background on these values.

        @[JSON::Field(key: "bitstreamMode")]
        getter bitstream_mode : String?

        # Dolby Digital Plus coding mode. Determines number of channels.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # When set to enabled, activates a DC highpass filter for all input channels.

        @[JSON::Field(key: "dcFilter")]
        getter dc_filter : String?

        # Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be
        # passed through.

        @[JSON::Field(key: "dialnorm")]
        getter dialnorm : Int32?

        # Sets the Dolby dynamic range compression profile.

        @[JSON::Field(key: "drcLine")]
        getter drc_line : String?

        # Sets the profile for heavy Dolby dynamic range compression, ensures that the instantaneous signal
        # peaks do not exceed specified levels.

        @[JSON::Field(key: "drcRf")]
        getter drc_rf : String?

        # When encoding 3/2 audio, setting to lfe enables the LFE channel

        @[JSON::Field(key: "lfeControl")]
        getter lfe_control : String?

        # When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid
        # with codingMode32 coding mode.

        @[JSON::Field(key: "lfeFilter")]
        getter lfe_filter : String?

        # Left only/Right only center mix level. Only used for 3/2 coding mode.

        @[JSON::Field(key: "loRoCenterMixLevel")]
        getter lo_ro_center_mix_level : Float64?

        # Left only/Right only surround mix level. Only used for 3/2 coding mode.

        @[JSON::Field(key: "loRoSurroundMixLevel")]
        getter lo_ro_surround_mix_level : Float64?

        # Left total/Right total center mix level. Only used for 3/2 coding mode.

        @[JSON::Field(key: "ltRtCenterMixLevel")]
        getter lt_rt_center_mix_level : Float64?

        # Left total/Right total surround mix level. Only used for 3/2 coding mode.

        @[JSON::Field(key: "ltRtSurroundMixLevel")]
        getter lt_rt_surround_mix_level : Float64?

        # When set to followInput, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that
        # supplied this audio data. If audio was not supplied from one of these streams, then the static
        # metadata settings will be used.

        @[JSON::Field(key: "metadataControl")]
        getter metadata_control : String?

        # When set to whenPossible, input DD+ audio will be passed through if it is present on the input. This
        # detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+
        # content will have a consistent DD+ output as the system alternates between passthrough and encoding.

        @[JSON::Field(key: "passthroughControl")]
        getter passthrough_control : String?

        # When set to shift90Degrees, applies a 90-degree phase shift to the surround channels. Only used for
        # 3/2 coding mode.

        @[JSON::Field(key: "phaseControl")]
        getter phase_control : String?

        # Stereo downmix preference. Only used for 3/2 coding mode.

        @[JSON::Field(key: "stereoDownmix")]
        getter stereo_downmix : String?

        # When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into
        # the left and right surround channels.

        @[JSON::Field(key: "surroundExMode")]
        getter surround_ex_mode : String?

        # When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.

        @[JSON::Field(key: "surroundMode")]
        getter surround_mode : String?

        def initialize(
          @attenuation_control : String? = nil,
          @bitrate : Float64? = nil,
          @bitstream_mode : String? = nil,
          @coding_mode : String? = nil,
          @dc_filter : String? = nil,
          @dialnorm : Int32? = nil,
          @drc_line : String? = nil,
          @drc_rf : String? = nil,
          @lfe_control : String? = nil,
          @lfe_filter : String? = nil,
          @lo_ro_center_mix_level : Float64? = nil,
          @lo_ro_surround_mix_level : Float64? = nil,
          @lt_rt_center_mix_level : Float64? = nil,
          @lt_rt_surround_mix_level : Float64? = nil,
          @metadata_control : String? = nil,
          @passthrough_control : String? = nil,
          @phase_control : String? = nil,
          @stereo_downmix : String? = nil,
          @surround_ex_mode : String? = nil,
          @surround_mode : String? = nil
        )
        end
      end

      # Ebu Tt DDestination Settings

      struct EbuTtDDestinationSettings
        include JSON::Serializable

        # Complete this field if you want to include the name of the copyright holder in the copyright tag in
        # the captions metadata.

        @[JSON::Field(key: "copyrightHolder")]
        getter copyright_holder : String?

        # Specifies the default font size as a percentage of the computed cell size. Valid only if the
        # defaultLineHeight is also set. If you leave this field empty, the default font size is 80% of the
        # cell size.

        @[JSON::Field(key: "defaultFontSize")]
        getter default_font_size : Int32?

        # Specifies the default line height as a percentage relative to the font size. Valid only if the
        # defaultFontSize is also set. This field should be > 100 (so the font can fit into a line) If you
        # leave this field empty, the default line height is 120% of the font size.

        @[JSON::Field(key: "defaultLineHeight")]
        getter default_line_height : Int32?

        # Specifies how to handle the gap between the lines (in multi-line captions). ENABLED: Fill with the
        # captions background color (as specified in the input captions). DISABLED: Leave the gap unfilled

        @[JSON::Field(key: "fillLineGap")]
        getter fill_line_gap : String?

        # Specifies the font family to include in the font data attached to the EBU-TT captions. Valid only if
        # style_control is set to include. (If style_control is set to exclude, the font family is always set
        # to monospaced.) Enter a list of font families, as a comma-separated list of font names, in order of
        # preference. The name can be a font family (such as Arial), or a generic font family (such as serif),
        # or default (to let the downstream player choose the font). Or leave blank to set the family to
        # monospace. Note that you can specify only the font family. All other style information (color, bold,
        # position and so on) is copied from the input captions. The size is always set to 100% to allow the
        # downstream player to choose the size.

        @[JSON::Field(key: "fontFamily")]
        getter font_family : String?

        # Specifies the style information to include in the font data that is attached to the EBU-TT captions.
        # INCLUDE: Take the style information from the source captions and include that information in the
        # font data attached to the EBU-TT captions. This option is valid only if the source captions are
        # Embedded or Teletext. EXCLUDE: Set the font family to monospaced. Do not include any other style
        # information.

        @[JSON::Field(key: "styleControl")]
        getter style_control : String?

        def initialize(
          @copyright_holder : String? = nil,
          @default_font_size : Int32? = nil,
          @default_line_height : Int32? = nil,
          @fill_line_gap : String? = nil,
          @font_family : String? = nil,
          @style_control : String? = nil
        )
        end
      end

      # Embedded Destination Settings

      struct EmbeddedDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Embedded Plus Scte20 Destination Settings

      struct EmbeddedPlusScte20DestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Embedded Source Settings

      struct EmbeddedSourceSettings
        include JSON::Serializable

        # If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708
        # wrapper as well as translated into 708. 708 data present in the source content will be discarded.

        @[JSON::Field(key: "convert608To708")]
        getter convert608_to708 : String?

        # Set to "auto" to handle streams with intermittent and/or non-aligned SCTE-20 and Embedded captions.

        @[JSON::Field(key: "scte20Detection")]
        getter scte20_detection : String?

        # Specifies the 608/708 channel number within the video track from which to extract captions. Unused
        # for passthrough.

        @[JSON::Field(key: "source608ChannelNumber")]
        getter source608_channel_number : Int32?

        # This field is unused and deprecated.

        @[JSON::Field(key: "source608TrackNumber")]
        getter source608_track_number : Int32?

        def initialize(
          @convert608_to708 : String? = nil,
          @scte20_detection : String? = nil,
          @source608_channel_number : Int32? = nil,
          @source608_track_number : Int32? = nil
        )
        end
      end


      struct Empty
        include JSON::Serializable

        def initialize
        end
      end

      # Encoder Settings

      struct EncoderSettings
        include JSON::Serializable


        @[JSON::Field(key: "audioDescriptions")]
        getter audio_descriptions : Array(Types::AudioDescription)


        @[JSON::Field(key: "outputGroups")]
        getter output_groups : Array(Types::OutputGroup)

        # Contains settings used to acquire and adjust timecode information from inputs.

        @[JSON::Field(key: "timecodeConfig")]
        getter timecode_config : Types::TimecodeConfig


        @[JSON::Field(key: "videoDescriptions")]
        getter video_descriptions : Array(Types::VideoDescription)

        # Settings for ad avail blanking.

        @[JSON::Field(key: "availBlanking")]
        getter avail_blanking : Types::AvailBlanking?

        # Event-wide configuration settings for ad avail insertion.

        @[JSON::Field(key: "availConfiguration")]
        getter avail_configuration : Types::AvailConfiguration?

        # Settings for blackout slate.

        @[JSON::Field(key: "blackoutSlate")]
        getter blackout_slate : Types::BlackoutSlate?

        # Settings for caption decriptions

        @[JSON::Field(key: "captionDescriptions")]
        getter caption_descriptions : Array(Types::CaptionDescription)?

        # Color Correction Settings

        @[JSON::Field(key: "colorCorrectionSettings")]
        getter color_correction_settings : Types::ColorCorrectionSettings?

        # Feature Activations

        @[JSON::Field(key: "featureActivations")]
        getter feature_activations : Types::FeatureActivations?

        # Configuration settings that apply to the event as a whole.

        @[JSON::Field(key: "globalConfiguration")]
        getter global_configuration : Types::GlobalConfiguration?

        # Settings for motion graphics.

        @[JSON::Field(key: "motionGraphicsConfiguration")]
        getter motion_graphics_configuration : Types::MotionGraphicsConfiguration?

        # Nielsen configuration settings.

        @[JSON::Field(key: "nielsenConfiguration")]
        getter nielsen_configuration : Types::NielsenConfiguration?

        # Thumbnail configuration settings.

        @[JSON::Field(key: "thumbnailConfiguration")]
        getter thumbnail_configuration : Types::ThumbnailConfiguration?

        def initialize(
          @audio_descriptions : Array(Types::AudioDescription),
          @output_groups : Array(Types::OutputGroup),
          @timecode_config : Types::TimecodeConfig,
          @video_descriptions : Array(Types::VideoDescription),
          @avail_blanking : Types::AvailBlanking? = nil,
          @avail_configuration : Types::AvailConfiguration? = nil,
          @blackout_slate : Types::BlackoutSlate? = nil,
          @caption_descriptions : Array(Types::CaptionDescription)? = nil,
          @color_correction_settings : Types::ColorCorrectionSettings? = nil,
          @feature_activations : Types::FeatureActivations? = nil,
          @global_configuration : Types::GlobalConfiguration? = nil,
          @motion_graphics_configuration : Types::MotionGraphicsConfiguration? = nil,
          @nielsen_configuration : Types::NielsenConfiguration? = nil,
          @thumbnail_configuration : Types::ThumbnailConfiguration? = nil
        )
        end
      end

      # Epoch Locking Settings

      struct EpochLockingSettings
        include JSON::Serializable

        # Optional. Enter a value here to use a custom epoch, instead of the standard epoch (which started at
        # 1970-01-01T00:00:00 UTC). Specify the start time of the custom epoch, in YYYY-MM-DDTHH:MM:SS in UTC.
        # The time must be 2000-01-01T00:00:00 or later. Always set the MM:SS portion to 00:00.

        @[JSON::Field(key: "customEpoch")]
        getter custom_epoch : String?

        # Optional. Enter a time for the jam sync. The default is midnight UTC. When epoch locking is enabled,
        # MediaLive performs a daily jam sync on every output encode to ensure timecodes don’t diverge from
        # the wall clock. The jam sync applies only to encodes with frame rate of 29.97 or 59.94 FPS. To
        # override, enter a time in HH:MM:SS in UTC. Always set the MM:SS portion to 00:00.

        @[JSON::Field(key: "jamSyncTime")]
        getter jam_sync_time : String?

        def initialize(
          @custom_epoch : String? = nil,
          @jam_sync_time : String? = nil
        )
        end
      end

      # Esam

      struct Esam
        include JSON::Serializable

        # Sent as acquisitionPointIdentity to identify the MediaLive channel to the POIS.

        @[JSON::Field(key: "acquisitionPointId")]
        getter acquisition_point_id : String

        # The URL of the signal conditioner endpoint on the Placement Opportunity Information System (POIS).
        # MediaLive sends SignalProcessingEvents here when SCTE-35 messages are read.

        @[JSON::Field(key: "poisEndpoint")]
        getter pois_endpoint : String

        # When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only
        # applies to embedded SCTE 104/35 messages and does not apply to OOB messages.

        @[JSON::Field(key: "adAvailOffset")]
        getter ad_avail_offset : Int32?

        # Reference to an AWS parameter store name from which the password can be retrieved if credentials are
        # required to access the POIS endpoint. AWS Parameter store format: "ssm:// "

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # Username if credentials are required to access the POIS endpoint. This can be either a plaintext
        # username, or a reference to an AWS parameter store name from which the username can be retrieved.
        # AWS Parameter store format: "ssm:// "

        @[JSON::Field(key: "username")]
        getter username : String?

        # Optional data sent as zoneIdentity to identify the MediaLive channel to the POIS.

        @[JSON::Field(key: "zoneIdentity")]
        getter zone_identity : String?

        def initialize(
          @acquisition_point_id : String,
          @pois_endpoint : String,
          @ad_avail_offset : Int32? = nil,
          @password_param : String? = nil,
          @username : String? = nil,
          @zone_identity : String? = nil
        )
        end
      end


      struct EventBridgeRuleTemplateGroupSummary
        include JSON::Serializable

        # An eventbridge rule template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of templates in a group.

        @[JSON::Field(key: "templateCount")]
        getter template_count : Int32

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @template_count : Int32,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct EventBridgeRuleTemplateSummary
        include JSON::Serializable

        # An eventbridge rule template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of targets configured to send matching events.

        @[JSON::Field(key: "eventTargetCount")]
        getter event_target_count : Int32


        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # An eventbridge rule template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @event_target_count : Int32,
          @event_type : String,
          @group_id : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The target to which to send matching events.

      struct EventBridgeRuleTemplateTarget
        include JSON::Serializable

        # Target ARNs must be either an SNS topic or CloudWatch log group.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Failover Condition settings. There can be multiple failover conditions inside
      # AutomaticInputFailoverSettings.

      struct FailoverCondition
        include JSON::Serializable

        # Failover condition type-specific settings.

        @[JSON::Field(key: "failoverConditionSettings")]
        getter failover_condition_settings : Types::FailoverConditionSettings?

        def initialize(
          @failover_condition_settings : Types::FailoverConditionSettings? = nil
        )
        end
      end

      # Settings for one failover condition.

      struct FailoverConditionSettings
        include JSON::Serializable

        # MediaLive will perform a failover if the specified audio selector is silent for the specified
        # period.

        @[JSON::Field(key: "audioSilenceSettings")]
        getter audio_silence_settings : Types::AudioSilenceFailoverSettings?

        # MediaLive will perform a failover if content is not detected in this input for the specified period.

        @[JSON::Field(key: "inputLossSettings")]
        getter input_loss_settings : Types::InputLossFailoverSettings?

        # MediaLive will perform a failover if content is considered black for the specified period.

        @[JSON::Field(key: "videoBlackSettings")]
        getter video_black_settings : Types::VideoBlackFailoverSettings?

        def initialize(
          @audio_silence_settings : Types::AudioSilenceFailoverSettings? = nil,
          @input_loss_settings : Types::InputLossFailoverSettings? = nil,
          @video_black_settings : Types::VideoBlackFailoverSettings? = nil
        )
        end
      end

      # Feature Activations

      struct FeatureActivations
        include JSON::Serializable

        # Enables the Input Prepare feature. You can create Input Prepare actions in the schedule only if this
        # feature is enabled. If you disable the feature on an existing schedule, make sure that you first
        # delete all input prepare actions from the schedule.

        @[JSON::Field(key: "inputPrepareScheduleActions")]
        getter input_prepare_schedule_actions : String?

        # Enables the output static image overlay feature. Enabling this feature allows you to send channel
        # schedule updates to display/clear/modify image overlays on an output-by-output bases.

        @[JSON::Field(key: "outputStaticImageOverlayScheduleActions")]
        getter output_static_image_overlay_schedule_actions : String?

        def initialize(
          @input_prepare_schedule_actions : String? = nil,
          @output_static_image_overlay_schedule_actions : String? = nil
        )
        end
      end

      # Fec Output Settings

      struct FecOutputSettings
        include JSON::Serializable

        # Parameter D from SMPTE 2022-1. The height of the FEC protection matrix. The number of transport
        # stream packets per column error correction packet. Must be between 4 and 20, inclusive.

        @[JSON::Field(key: "columnDepth")]
        getter column_depth : Int32?

        # Enables column only or column and row based FEC

        @[JSON::Field(key: "includeFec")]
        getter include_fec : String?

        # Parameter L from SMPTE 2022-1. The width of the FEC protection matrix. Must be between 1 and 20,
        # inclusive. If only Column FEC is used, then larger values increase robustness. If Row FEC is used,
        # then this is the number of transport stream packets per row error correction packet, and the value
        # must be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec is column, this
        # value must be 1 to 20, inclusive.

        @[JSON::Field(key: "rowLength")]
        getter row_length : Int32?

        def initialize(
          @column_depth : Int32? = nil,
          @include_fec : String? = nil,
          @row_length : Int32? = nil
        )
        end
      end

      # Start time for the action.

      struct FixedModeScheduleActionStartSettings
        include JSON::Serializable

        # Start time for the action to start in the channel. (Not the time for the action to be added to the
        # schedule: actions are always added to the schedule immediately.) UTC format:
        # yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are digits (for example, mm might be 01) except for the
        # two constants "T" for time and "Z" for "UTC format".

        @[JSON::Field(key: "time")]
        getter time : String

        def initialize(
          @time : String
        )
        end
      end

      # Fmp4 Hls Settings

      struct Fmp4HlsSettings
        include JSON::Serializable

        # List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs
        # that are associated to the video, separate by ','.

        @[JSON::Field(key: "audioRenditionSets")]
        getter audio_rendition_sets : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # Set to PASSTHROUGH to enable ID3 metadata insertion. To include metadata, you configure other
        # parameters in the output group or individual outputs, or you add an ID3 action to the channel
        # schedule.

        @[JSON::Field(key: "timedMetadataBehavior")]
        getter timed_metadata_behavior : String?

        def initialize(
          @audio_rendition_sets : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @timed_metadata_behavior : String? = nil
        )
        end
      end

      # Settings to specify if an action follows another.

      struct FollowModeScheduleActionStartSettings
        include JSON::Serializable

        # Identifies whether this action starts relative to the start or relative to the end of the reference
        # action.

        @[JSON::Field(key: "followPoint")]
        getter follow_point : String

        # The action name of another action that this one refers to.

        @[JSON::Field(key: "referenceActionName")]
        getter reference_action_name : String

        def initialize(
          @follow_point : String,
          @reference_action_name : String
        )
        end
      end

      # Settings for a follower channel in a linked pair

      struct FollowerChannelSettings
        include JSON::Serializable

        # Specifies this as a follower channel

        @[JSON::Field(key: "linkedChannelType")]
        getter linked_channel_type : String?

        # The ARN of the primary channel to follow

        @[JSON::Field(key: "primaryChannelArn")]
        getter primary_channel_arn : String?

        def initialize(
          @linked_channel_type : String? = nil,
          @primary_channel_arn : String? = nil
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

      # User does not have sufficient access to perform this action.

      struct ForbiddenExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Frame Capture Cdn Settings

      struct FrameCaptureCdnSettings
        include JSON::Serializable


        @[JSON::Field(key: "frameCaptureS3Settings")]
        getter frame_capture_s3_settings : Types::FrameCaptureS3Settings?

        def initialize(
          @frame_capture_s3_settings : Types::FrameCaptureS3Settings? = nil
        )
        end
      end

      # Frame Capture Group Settings

      struct FrameCaptureGroupSettings
        include JSON::Serializable

        # The destination for the frame capture files. Either the URI for an Amazon S3 bucket and object, plus
        # a file name prefix (for example, s3ssl://sportsDelivery/highlights/20180820/curling-) or the URI for
        # a MediaStore container, plus a file name prefix (for example,
        # mediastoressl://sportsDelivery/20180820/curling-). The final file names consist of the prefix from
        # the destination field (for example, "curling-") + name modifier + the counter (5 digits, starting
        # from 00001) + extension (which is always .jpg). For example, curling-low.00001.jpg

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # Parameters that control interactions with the CDN.

        @[JSON::Field(key: "frameCaptureCdnSettings")]
        getter frame_capture_cdn_settings : Types::FrameCaptureCdnSettings?

        def initialize(
          @destination : Types::OutputLocationRef,
          @frame_capture_cdn_settings : Types::FrameCaptureCdnSettings? = nil
        )
        end
      end

      # Frame Capture Hls Settings

      struct FrameCaptureHlsSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Frame Capture Output Settings

      struct FrameCaptureOutputSettings
        include JSON::Serializable

        # Required if the output group contains more than one output. This modifier forms part of the output
        # file name.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        def initialize(
          @name_modifier : String? = nil
        )
        end
      end

      # Frame Capture S3 Settings

      struct FrameCaptureS3Settings
        include JSON::Serializable

        # Specify the canned ACL to apply to each S3 request. Defaults to none.

        @[JSON::Field(key: "cannedAcl")]
        getter canned_acl : String?

        def initialize(
          @canned_acl : String? = nil
        )
        end
      end

      # Frame Capture Settings

      struct FrameCaptureSettings
        include JSON::Serializable

        # The frequency at which to capture frames for inclusion in the output. May be specified in either
        # seconds or milliseconds, as specified by captureIntervalUnits.

        @[JSON::Field(key: "captureInterval")]
        getter capture_interval : Int32?

        # Unit for the frame capture interval.

        @[JSON::Field(key: "captureIntervalUnits")]
        getter capture_interval_units : String?

        # Timecode burn-in settings

        @[JSON::Field(key: "timecodeBurninSettings")]
        getter timecode_burnin_settings : Types::TimecodeBurninSettings?

        def initialize(
          @capture_interval : Int32? = nil,
          @capture_interval_units : String? = nil,
          @timecode_burnin_settings : Types::TimecodeBurninSettings? = nil
        )
        end
      end


      struct GatewayTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetCloudWatchAlarmTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetCloudWatchAlarmTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCloudWatchAlarmTemplateGroupResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCloudWatchAlarmTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetCloudWatchAlarmTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "metricName")]
        getter metric_name : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "period")]
        getter period : Int32?


        @[JSON::Field(key: "statistic")]
        getter statistic : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String?


        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @arn : String? = nil,
          @comparison_operator : String? = nil,
          @created_at : Time? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @evaluation_periods : Int32? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @metric_name : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_resource_type : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end


      struct GetCloudWatchAlarmTemplateResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # A cloudwatch alarm template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @comparison_operator : String,
          @created_at : Time,
          @evaluation_periods : Int32,
          @group_id : String,
          @id : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventBridgeRuleTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetEventBridgeRuleTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventBridgeRuleTemplateGroupResponseContent
        include JSON::Serializable

        # An eventbridge rule template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventBridgeRuleTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetEventBridgeRuleTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "eventType")]
        getter event_type : String?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @event_type : String? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetEventBridgeRuleTemplateResponseContent
        include JSON::Serializable

        # An eventbridge rule template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time


        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # An eventbridge rule template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @event_type : String,
          @group_id : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSignalMapRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetSignalMapResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @id : String? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_changes_pending_deployment : Bool? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSignalMapResponseContent
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # If true, there are pending monitor changes for this signal map that can be deployed.

        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Error message associated with a failed creation or failed update attempt of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @discovery_entry_point_arn : String,
          @id : String,
          @monitor_changes_pending_deployment : Bool,
          @name : String,
          @status : String,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Global Configuration

      struct GlobalConfiguration
        include JSON::Serializable

        # Value to set the initial audio gain for the Live Event.

        @[JSON::Field(key: "initialAudioGain")]
        getter initial_audio_gain : Int32?

        # Indicates the action to take when the current input completes (e.g. end-of-file). When
        # switchAndLoopInputs is configured the encoder will restart at the beginning of the first input. When
        # "none" is configured the encoder will transcode either black, a solid color, or a user specified
        # slate images per the "Input Loss Behavior" configuration until the next input switch occurs (which
        # is controlled through the Channel Schedule API).

        @[JSON::Field(key: "inputEndAction")]
        getter input_end_action : String?

        # Settings for system actions when input is lost.

        @[JSON::Field(key: "inputLossBehavior")]
        getter input_loss_behavior : Types::InputLossBehavior?

        # Indicates how MediaLive pipelines are synchronized. PIPELINE_LOCKING - MediaLive will attempt to
        # synchronize the output of each pipeline to the other. EPOCH_LOCKING - MediaLive will attempt to
        # synchronize the output of each pipeline to the Unix epoch. DISABLED - MediaLive will not attempt to
        # synchronize the output of pipelines. We advise against disabling output locking because it has
        # negative side effects in most workflows. For more information, see the section about output locking
        # (pipeline locking) in the Medialive user guide.

        @[JSON::Field(key: "outputLockingMode")]
        getter output_locking_mode : String?

        # Advanced output locking settings

        @[JSON::Field(key: "outputLockingSettings")]
        getter output_locking_settings : Types::OutputLockingSettings?

        # Indicates whether the rate of frames emitted by the Live encoder should be paced by its system clock
        # (which optionally may be locked to another source via NTP) or should be locked to the clock of the
        # source that is providing the input stream.

        @[JSON::Field(key: "outputTimingSource")]
        getter output_timing_source : String?

        # Adjusts video input buffer for streams with very low video framerates. This is commonly set to
        # enabled for music channels with less than one video frame per second.

        @[JSON::Field(key: "supportLowFramerateInputs")]
        getter support_low_framerate_inputs : String?

        def initialize(
          @initial_audio_gain : Int32? = nil,
          @input_end_action : String? = nil,
          @input_loss_behavior : Types::InputLossBehavior? = nil,
          @output_locking_mode : String? = nil,
          @output_locking_settings : Types::OutputLockingSettings? = nil,
          @output_timing_source : String? = nil,
          @support_low_framerate_inputs : String? = nil
        )
        end
      end

      # H264 Color Space Settings

      struct H264ColorSpaceSettings
        include JSON::Serializable


        @[JSON::Field(key: "colorSpacePassthroughSettings")]
        getter color_space_passthrough_settings : Types::ColorSpacePassthroughSettings?


        @[JSON::Field(key: "rec601Settings")]
        getter rec601_settings : Types::Rec601Settings?


        @[JSON::Field(key: "rec709Settings")]
        getter rec709_settings : Types::Rec709Settings?

        def initialize(
          @color_space_passthrough_settings : Types::ColorSpacePassthroughSettings? = nil,
          @rec601_settings : Types::Rec601Settings? = nil,
          @rec709_settings : Types::Rec709Settings? = nil
        )
        end
      end

      # H264 Filter Settings

      struct H264FilterSettings
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthReductionFilterSettings")]
        getter bandwidth_reduction_filter_settings : Types::BandwidthReductionFilterSettings?


        @[JSON::Field(key: "temporalFilterSettings")]
        getter temporal_filter_settings : Types::TemporalFilterSettings?

        def initialize(
          @bandwidth_reduction_filter_settings : Types::BandwidthReductionFilterSettings? = nil,
          @temporal_filter_settings : Types::TemporalFilterSettings? = nil
        )
        end
      end

      # H264 Settings

      struct H264Settings
        include JSON::Serializable

        # Enables or disables adaptive quantization (AQ), which is a technique MediaLive can apply to video on
        # a frame-by-frame basis to produce more compression without losing quality. There are three types of
        # adaptive quantization: spatial, temporal, and flicker. We recommend that you set the field to Auto.
        # For more information about all the options, see the topic about video adaptive quantization in the
        # MediaLive user guide.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Indicates that AFD values will be written into the output stream. If afdSignaling is "auto", the
        # system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If
        # set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for
        # QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded
        # down to the nearest multiple of 1000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Percentage of the buffer that should initially be filled (HRD buffer model).

        @[JSON::Field(key: "bufFillPct")]
        getter buf_fill_pct : Int32?

        # Size of buffer (HRD buffer model) in bits.

        @[JSON::Field(key: "bufSize")]
        getter buf_size : Int32?

        # Includes colorspace metadata in the output.

        @[JSON::Field(key: "colorMetadata")]
        getter color_metadata : String?

        # Specify the type of color space to apply or choose to pass through. The default is to pass through
        # the color space that is in the source.

        @[JSON::Field(key: "colorSpaceSettings")]
        getter color_space_settings : Types::H264ColorSpaceSettings?

        # Entropy encoding mode. Use cabac (must be in Main or High profile) or cavlc.

        @[JSON::Field(key: "entropyEncoding")]
        getter entropy_encoding : String?

        # Optional. Both filters reduce bandwidth by removing imperceptible details. You can enable one of the
        # filters. We recommend that you try both filters and observe the results to decide which one to use.
        # The Temporal Filter reduces bandwidth by removing imperceptible details in the content. It combines
        # perceptual filtering and motion compensated temporal filtering (MCTF). It operates independently of
        # the compression level. The Bandwidth Reduction filter is a perceptual filter located within the
        # encoding loop. It adapts to the current compression level to filter imperceptible signals. This
        # filter works only when the resolution is 1080p or lower.

        @[JSON::Field(key: "filterSettings")]
        getter filter_settings : Types::H264FilterSettings?

        # Four bit AFD value to write on all frames of video in the output stream. Only valid when
        # afdSignaling is set to 'Fixed'.

        @[JSON::Field(key: "fixedAfd")]
        getter fixed_afd : String?

        # Flicker AQ makes adjustments within each frame to reduce flicker or 'pop' on I-frames. The value to
        # enter in this field depends on the value in the Adaptive quantization field. For more information,
        # see the topic about video adaptive quantization in the MediaLive user guide.

        @[JSON::Field(key: "flickerAq")]
        getter flicker_aq : String?

        # This setting applies only when scan type is "interlaced." It controls whether coding is performed on
        # a field basis or on a frame basis. (When the video is progressive, the coding is always performed on
        # a frame basis.) enabled: Force MediaLive to code on a field basis, so that odd and even sets of
        # fields are coded separately. disabled: Code the two sets of fields separately (on a field basis) or
        # together (on a frame basis using PAFF), depending on what is most appropriate for the content.

        @[JSON::Field(key: "forceFieldPictures")]
        getter force_field_pictures : String?

        # This field indicates how the output video frame rate is specified. If "specified" is selected then
        # the output video frame rate is determined by framerateNumerator and framerateDenominator, else if
        # "initializeFromSource" is selected then the output video frame rate will be set equal to the input
        # video frame rate of the first input.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Framerate denominator.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # If enabled, use reference B frames for GOP structures that have B frames > 1.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a
        # decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0
        # will break output segmenting.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Number of B-frames between reference frames.

        @[JSON::Field(key: "gopNumBFrames")]
        getter gop_num_b_frames : Int32?

        # GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits. If gopSizeUnits
        # is frames, gopSize must be an integer and must be greater than or equal to 1. If gopSizeUnits is
        # seconds, gopSize must be greater than 0, but need not be an integer.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the
        # gopSize into a frame count at run time.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # H.264 Level.

        @[JSON::Field(key: "level")]
        getter level : String?

        # Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce
        # better quality for certain content.

        @[JSON::Field(key: "lookAheadRateControl")]
        getter look_ahead_rate_control : String?

        # For QVBR: See the tooltip for Quality level For VBR: Set the maximum bitrate in order to accommodate
        # expected spikes in the complexity of the video.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Used for QVBR rate control mode only. Optional. Enter a minimum bitrate if you want to keep the
        # output bitrate about a threshold, in order to prevent the downstream system from de-allocating
        # network bandwidth for this output.

        @[JSON::Field(key: "minBitrate")]
        getter min_bitrate : Int32?

        # Only meaningful if sceneChangeDetect is set to enabled. Defaults to 5 if multiplex rate control is
        # used. Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change
        # Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is
        # shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well
        # as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP
        # size + Min-I-interval - 1

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # Sets the minimum QP. If you aren't familiar with quantization adjustment, leave the field empty.
        # MediaLive will apply an appropriate value.

        @[JSON::Field(key: "minQp")]
        getter min_qp : Int32?

        # Number of reference frames to use. The encoder may use more than requested if using B-frames and/or
        # interlaced encoding.

        @[JSON::Field(key: "numRefFrames")]
        getter num_ref_frames : Int32?

        # This field indicates how the output pixel aspect ratio is specified. If "specified" is selected then
        # the output video pixel aspect ratio is determined by parNumerator and parDenominator, else if
        # "initializeFromSource" is selected then the output pixsel aspect ratio will be set equal to the
        # input video pixel aspect ratio of the first input.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Pixel Aspect Ratio denominator.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Pixel Aspect Ratio numerator.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # H.264 Profile.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Leave as STANDARD_QUALITY or choose a different value (which might result in additional costs to run
        # the channel). - ENHANCED_QUALITY: Produces a slightly better video quality without an increase in
        # the bitrate. Has an effect only when the Rate control mode is QVBR or CBR. If this channel is in a
        # MediaLive multiplex, the value must be ENHANCED_QUALITY. - STANDARD_QUALITY: Valid for any Rate
        # control mode.

        @[JSON::Field(key: "qualityLevel")]
        getter quality_level : String?

        # Controls the target quality for the video encode. Applies only when the rate control mode is QVBR.
        # You can set a target quality or you can let MediaLive determine the best quality. To set a target
        # quality, enter values in the QVBR quality level field and the Max bitrate field. Enter values that
        # suit your most important viewing devices. Recommended values are: - Primary screen: Quality level: 8
        # to 10. Max bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone:
        # Quality level: 6. Max bitrate: 1M to 1.5M To let MediaLive decide, leave the QVBR quality level
        # field empty, and in Max bitrate enter the maximum rate you want in the video. For more information,
        # see the section called "Video - rate control mode" in the MediaLive user guide

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Rate control mode. QVBR: Quality will match the specified quality level except when it is
        # constrained by the maximum bitrate. Recommended if you or your viewers pay for bandwidth. VBR:
        # Quality and bitrate vary, depending on the video complexity. Recommended instead of QVBR if you want
        # to maintain a specific average bitrate over the duration of the channel. CBR: Quality varies,
        # depending on the video complexity. Recommended only if you distribute your assets to devices that
        # cannot handle variable bitrates. Multiplex: This rate control mode is only supported (and is
        # required) when the video is being delivered to a MediaLive Multiplex in which case the rate control
        # configuration is controlled by the properties within the Multiplex Program.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Sets the scan type of the output to progressive or top-field-first interlaced.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Scene change detection. - On: inserts I-frames when scene change is detected. - Off: does not force
        # an I-frame when scene change is detected.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures. This field is optional; when no value is specified the encoder will choose the number of
        # slices based on encode resolution.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded
        # image. If not set to zero, must be greater than 15.

        @[JSON::Field(key: "softness")]
        getter softness : Int32?

        # Spatial AQ makes adjustments within each frame based on spatial variation of content complexity. The
        # value to enter in this field depends on the value in the Adaptive quantization field. For more
        # information, see the topic about video adaptive quantization in the MediaLive user guide.

        @[JSON::Field(key: "spatialAq")]
        getter spatial_aq : String?

        # If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic, optimize the number of
        # B-frames used for each sub-GOP to improve visual quality.

        @[JSON::Field(key: "subgopLength")]
        getter subgop_length : String?

        # Produces a bitstream compliant with SMPTE RP-2027.

        @[JSON::Field(key: "syntax")]
        getter syntax : String?

        # Temporal makes adjustments within each frame based on variations in content complexity over time.
        # The value to enter in this field depends on the value in the Adaptive quantization field. For more
        # information, see the topic about video adaptive quantization in the MediaLive user guide.

        @[JSON::Field(key: "temporalAq")]
        getter temporal_aq : String?

        # Timecode burn-in settings

        @[JSON::Field(key: "timecodeBurninSettings")]
        getter timecode_burnin_settings : Types::TimecodeBurninSettings?

        # Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not
        # include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source
        # specified in Timecode Config

        @[JSON::Field(key: "timecodeInsertion")]
        getter timecode_insertion : String?

        def initialize(
          @adaptive_quantization : String? = nil,
          @afd_signaling : String? = nil,
          @bitrate : Int32? = nil,
          @buf_fill_pct : Int32? = nil,
          @buf_size : Int32? = nil,
          @color_metadata : String? = nil,
          @color_space_settings : Types::H264ColorSpaceSettings? = nil,
          @entropy_encoding : String? = nil,
          @filter_settings : Types::H264FilterSettings? = nil,
          @fixed_afd : String? = nil,
          @flicker_aq : String? = nil,
          @force_field_pictures : String? = nil,
          @framerate_control : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_num_b_frames : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @level : String? = nil,
          @look_ahead_rate_control : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @min_qp : Int32? = nil,
          @num_ref_frames : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @profile : String? = nil,
          @quality_level : String? = nil,
          @qvbr_quality_level : Int32? = nil,
          @rate_control_mode : String? = nil,
          @scan_type : String? = nil,
          @scene_change_detect : String? = nil,
          @slices : Int32? = nil,
          @softness : Int32? = nil,
          @spatial_aq : String? = nil,
          @subgop_length : String? = nil,
          @syntax : String? = nil,
          @temporal_aq : String? = nil,
          @timecode_burnin_settings : Types::TimecodeBurninSettings? = nil,
          @timecode_insertion : String? = nil
        )
        end
      end

      # H265 Color Space Settings

      struct H265ColorSpaceSettings
        include JSON::Serializable


        @[JSON::Field(key: "colorSpacePassthroughSettings")]
        getter color_space_passthrough_settings : Types::ColorSpacePassthroughSettings?


        @[JSON::Field(key: "dolbyVision81Settings")]
        getter dolby_vision81_settings : Types::DolbyVision81Settings?


        @[JSON::Field(key: "hdr10Settings")]
        getter hdr10_settings : Types::Hdr10Settings?


        @[JSON::Field(key: "hlg2020Settings")]
        getter hlg2020_settings : Types::Hlg2020Settings?


        @[JSON::Field(key: "rec601Settings")]
        getter rec601_settings : Types::Rec601Settings?


        @[JSON::Field(key: "rec709Settings")]
        getter rec709_settings : Types::Rec709Settings?

        def initialize(
          @color_space_passthrough_settings : Types::ColorSpacePassthroughSettings? = nil,
          @dolby_vision81_settings : Types::DolbyVision81Settings? = nil,
          @hdr10_settings : Types::Hdr10Settings? = nil,
          @hlg2020_settings : Types::Hlg2020Settings? = nil,
          @rec601_settings : Types::Rec601Settings? = nil,
          @rec709_settings : Types::Rec709Settings? = nil
        )
        end
      end

      # H265 Filter Settings

      struct H265FilterSettings
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthReductionFilterSettings")]
        getter bandwidth_reduction_filter_settings : Types::BandwidthReductionFilterSettings?


        @[JSON::Field(key: "temporalFilterSettings")]
        getter temporal_filter_settings : Types::TemporalFilterSettings?

        def initialize(
          @bandwidth_reduction_filter_settings : Types::BandwidthReductionFilterSettings? = nil,
          @temporal_filter_settings : Types::TemporalFilterSettings? = nil
        )
        end
      end

      # H265 Settings

      struct H265Settings
        include JSON::Serializable

        # Framerate denominator.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32

        # Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32

        # Enables or disables adaptive quantization (AQ), which is a technique MediaLive can apply to video on
        # a frame-by-frame basis to produce more compression without losing quality. There are three types of
        # adaptive quantization: spatial, temporal, and flicker. Flicker is the only type that you can
        # customize. We recommend that you set the field to Auto. For more information about all the options,
        # see the topic about video adaptive quantization in the MediaLive user guide.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Indicates that AFD values will be written into the output stream. If afdSignaling is "auto", the
        # system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If
        # set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # Whether or not EML should insert an Alternative Transfer Function SEI message to support backwards
        # compatibility with non-HDR decoders and displays.

        @[JSON::Field(key: "alternativeTransferFunction")]
        getter alternative_transfer_function : String?

        # Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for
        # QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded
        # down to the nearest multiple of 1000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Size of buffer (HRD buffer model) in bits.

        @[JSON::Field(key: "bufSize")]
        getter buf_size : Int32?

        # Includes colorspace metadata in the output.

        @[JSON::Field(key: "colorMetadata")]
        getter color_metadata : String?

        # Specify the type of color space to apply or choose to pass through. The default is to pass through
        # the color space that is in the source.

        @[JSON::Field(key: "colorSpaceSettings")]
        getter color_space_settings : Types::H265ColorSpaceSettings?

        # Enable or disable the deblocking filter for this codec. The filter reduces blocking artifacts at
        # block boundaries, which improves overall video quality. If the filter is disabled, visible block
        # edges might appear in the output, especially at lower bitrates.

        @[JSON::Field(key: "deblocking")]
        getter deblocking : String?

        # Optional. Both filters reduce bandwidth by removing imperceptible details. You can enable one of the
        # filters. We recommend that you try both filters and observe the results to decide which one to use.
        # The Temporal Filter reduces bandwidth by removing imperceptible details in the content. It combines
        # perceptual filtering and motion compensated temporal filtering (MCTF). It operates independently of
        # the compression level. The Bandwidth Reduction filter is a perceptual filter located within the
        # encoding loop. It adapts to the current compression level to filter imperceptible signals. This
        # filter works only when the resolution is 1080p or lower.

        @[JSON::Field(key: "filterSettings")]
        getter filter_settings : Types::H265FilterSettings?

        # Four bit AFD value to write on all frames of video in the output stream. Only valid when
        # afdSignaling is set to 'Fixed'.

        @[JSON::Field(key: "fixedAfd")]
        getter fixed_afd : String?

        # Flicker AQ makes adjustments within each frame to reduce flicker or 'pop' on I-frames. The value to
        # enter in this field depends on the value in the Adaptive quantization field. For more information,
        # see the topic about video adaptive quantization in the MediaLive user guide.

        @[JSON::Field(key: "flickerAq")]
        getter flicker_aq : String?

        # Allows the encoder to use a B-Frame as a reference frame as well. ENABLED: B-frames will also serve
        # as reference frames. DISABLED: B-frames won't be reference frames. Must be DISABLED if resolution is
        # greater than 1080p or when using tiled hevc encoding.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a
        # decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0
        # will break output segmenting.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Sets the number of B-frames between reference frames. Set to 2 if resolution is greater than 1080p
        # or when using tiled hevc encoding.

        @[JSON::Field(key: "gopNumBFrames")]
        getter gop_num_b_frames : Int32?

        # GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits. If gopSizeUnits
        # is frames, gopSize must be an integer and must be greater than or equal to 1. If gopSizeUnits is
        # seconds, gopSize must be greater than 0, but need not be an integer.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the
        # gopSize into a frame count at run time.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # H.265 Level.

        @[JSON::Field(key: "level")]
        getter level : String?

        # Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce
        # better quality for certain content.

        @[JSON::Field(key: "lookAheadRateControl")]
        getter look_ahead_rate_control : String?

        # For QVBR: See the tooltip for Quality level

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Used for QVBR rate control mode only. Optional. Enter a minimum bitrate if you want to keep the
        # output bitrate about a threshold, in order to prevent the downstream system from de-allocating
        # network bandwidth for this output.

        @[JSON::Field(key: "minBitrate")]
        getter min_bitrate : Int32?

        # Only meaningful if sceneChangeDetect is set to enabled. Defaults to 5 if multiplex rate control is
        # used. Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change
        # Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is
        # shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well
        # as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP
        # size + Min-I-interval - 1

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # Sets the minimum QP. If you aren't familiar with quantization adjustment, leave the field empty.
        # MediaLive will apply an appropriate value.

        @[JSON::Field(key: "minQp")]
        getter min_qp : Int32?

        # If you are setting up the picture as a tile, you must set this to "disabled". In all other
        # configurations, you typically enter "enabled".

        @[JSON::Field(key: "mvOverPictureBoundaries")]
        getter mv_over_picture_boundaries : String?

        # If you are setting up the picture as a tile, you must set this to "disabled". In other
        # configurations, you typically enter "enabled".

        @[JSON::Field(key: "mvTemporalPredictor")]
        getter mv_temporal_predictor : String?

        # Pixel Aspect Ratio denominator.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Pixel Aspect Ratio numerator.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # H.265 Profile.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Controls the target quality for the video encode. Applies only when the rate control mode is QVBR.
        # Set values for the QVBR quality level field and Max bitrate field that suit your most important
        # viewing devices. Recommended values are: - Primary screen: Quality level: 8 to 10. Max bitrate: 4M -
        # PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone: Quality level: 6. Max bitrate:
        # 1M to 1.5M

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Rate control mode. QVBR: Quality will match the specified quality level except when it is
        # constrained by the maximum bitrate. Recommended if you or your viewers pay for bandwidth. CBR:
        # Quality varies, depending on the video complexity. Recommended only if you distribute your assets to
        # devices that cannot handle variable bitrates. Multiplex: This rate control mode is only supported
        # (and is required) when the video is being delivered to a MediaLive Multiplex in which case the rate
        # control configuration is controlled by the properties within the Multiplex Program.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Sets the scan type of the output to progressive or top-field-first interlaced.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Scene change detection.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures. This field is optional; when no value is specified the encoder will choose the number of
        # slices based on encode resolution.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Sets the number of B-frames in each sub-GOP. FIXED: Use the value in Num B-frames. DYNAMIC:
        # Optimizes the number of B-frames in each sub-GOP to improve visual quality. Must be FIXED if
        # resolution is greater than 1080p or when using tiled hevc encoding.

        @[JSON::Field(key: "subgopLength")]
        getter subgop_length : String?

        # H.265 Tier.

        @[JSON::Field(key: "tier")]
        getter tier : String?

        # Set this field to set up the picture as a tile. You must also set tileWidth. The tile height must
        # result in 22 or fewer rows in the frame. The tile width must result in 20 or fewer columns in the
        # frame. And finally, the product of the column count and row count must be 64 of less. If the tile
        # width and height are specified, MediaLive will override the video codec slices field with a value
        # that MediaLive calculates

        @[JSON::Field(key: "tileHeight")]
        getter tile_height : Int32?

        # Set to "padded" to force MediaLive to add padding to the frame, to obtain a frame that is a whole
        # multiple of the tile size. If you are setting up the picture as a tile, you must enter "padded". In
        # all other configurations, you typically enter "none".

        @[JSON::Field(key: "tilePadding")]
        getter tile_padding : String?

        # Set this field to set up the picture as a tile. See tileHeight for more information.

        @[JSON::Field(key: "tileWidth")]
        getter tile_width : Int32?

        # Timecode burn-in settings

        @[JSON::Field(key: "timecodeBurninSettings")]
        getter timecode_burnin_settings : Types::TimecodeBurninSettings?

        # Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not
        # include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source
        # specified in Timecode Config

        @[JSON::Field(key: "timecodeInsertion")]
        getter timecode_insertion : String?

        # Select the tree block size used for encoding. If you enter "auto", the encoder will pick the best
        # size. If you are setting up the picture as a tile, you must set this to 32x32. In all other
        # configurations, you typically enter "auto".

        @[JSON::Field(key: "treeblockSize")]
        getter treeblock_size : String?

        def initialize(
          @framerate_denominator : Int32,
          @framerate_numerator : Int32,
          @adaptive_quantization : String? = nil,
          @afd_signaling : String? = nil,
          @alternative_transfer_function : String? = nil,
          @bitrate : Int32? = nil,
          @buf_size : Int32? = nil,
          @color_metadata : String? = nil,
          @color_space_settings : Types::H265ColorSpaceSettings? = nil,
          @deblocking : String? = nil,
          @filter_settings : Types::H265FilterSettings? = nil,
          @fixed_afd : String? = nil,
          @flicker_aq : String? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_num_b_frames : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @level : String? = nil,
          @look_ahead_rate_control : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @min_qp : Int32? = nil,
          @mv_over_picture_boundaries : String? = nil,
          @mv_temporal_predictor : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @profile : String? = nil,
          @qvbr_quality_level : Int32? = nil,
          @rate_control_mode : String? = nil,
          @scan_type : String? = nil,
          @scene_change_detect : String? = nil,
          @slices : Int32? = nil,
          @subgop_length : String? = nil,
          @tier : String? = nil,
          @tile_height : Int32? = nil,
          @tile_padding : String? = nil,
          @tile_width : Int32? = nil,
          @timecode_burnin_settings : Types::TimecodeBurninSettings? = nil,
          @timecode_insertion : String? = nil,
          @treeblock_size : String? = nil
        )
        end
      end

      # Hdr10 Settings

      struct Hdr10Settings
        include JSON::Serializable

        # Maximum Content Light Level An integer metadata value defining the maximum light level, in nits, of
        # any single pixel within an encoded HDR video stream or file.

        @[JSON::Field(key: "maxCll")]
        getter max_cll : Int32?

        # Maximum Frame Average Light Level An integer metadata value defining the maximum average light
        # level, in nits, for any single frame within an encoded HDR video stream or file.

        @[JSON::Field(key: "maxFall")]
        getter max_fall : Int32?

        def initialize(
          @max_cll : Int32? = nil,
          @max_fall : Int32? = nil
        )
        end
      end

      # Hlg2020 Settings

      struct Hlg2020Settings
        include JSON::Serializable

        def initialize
        end
      end

      # Hls Akamai Settings

      struct HlsAkamaiSettings
        include JSON::Serializable

        # Number of seconds to wait before retrying connection to the CDN if the connection is lost.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # Size in seconds of file cache for streaming outputs.

        @[JSON::Field(key: "filecacheDuration")]
        getter filecache_duration : Int32?

        # Specify whether or not to use chunked transfer encoding to Akamai. User should contact Akamai to
        # enable this feature.

        @[JSON::Field(key: "httpTransferMode")]
        getter http_transfer_mode : String?

        # Number of retry attempts that will be made before the Live Event is put into an error state. Applies
        # only if the CDN destination URI begins with "s3" or "mediastore". For other URIs, the value is
        # always 3.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        # If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0
        # means never restart.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        # Salt for authenticated Akamai.

        @[JSON::Field(key: "salt")]
        getter salt : String?

        # Token parameter for authenticated akamai. If not specified, _gda_ is used.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @connection_retry_interval : Int32? = nil,
          @filecache_duration : Int32? = nil,
          @http_transfer_mode : String? = nil,
          @num_retries : Int32? = nil,
          @restart_delay : Int32? = nil,
          @salt : String? = nil,
          @token : String? = nil
        )
        end
      end

      # Hls Basic Put Settings

      struct HlsBasicPutSettings
        include JSON::Serializable

        # Number of seconds to wait before retrying connection to the CDN if the connection is lost.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # Size in seconds of file cache for streaming outputs.

        @[JSON::Field(key: "filecacheDuration")]
        getter filecache_duration : Int32?

        # Number of retry attempts that will be made before the Live Event is put into an error state. Applies
        # only if the CDN destination URI begins with "s3" or "mediastore". For other URIs, the value is
        # always 3.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        # If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0
        # means never restart.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        def initialize(
          @connection_retry_interval : Int32? = nil,
          @filecache_duration : Int32? = nil,
          @num_retries : Int32? = nil,
          @restart_delay : Int32? = nil
        )
        end
      end

      # Hls Cdn Settings

      struct HlsCdnSettings
        include JSON::Serializable


        @[JSON::Field(key: "hlsAkamaiSettings")]
        getter hls_akamai_settings : Types::HlsAkamaiSettings?


        @[JSON::Field(key: "hlsBasicPutSettings")]
        getter hls_basic_put_settings : Types::HlsBasicPutSettings?


        @[JSON::Field(key: "hlsMediaStoreSettings")]
        getter hls_media_store_settings : Types::HlsMediaStoreSettings?


        @[JSON::Field(key: "hlsS3Settings")]
        getter hls_s3_settings : Types::HlsS3Settings?


        @[JSON::Field(key: "hlsWebdavSettings")]
        getter hls_webdav_settings : Types::HlsWebdavSettings?

        def initialize(
          @hls_akamai_settings : Types::HlsAkamaiSettings? = nil,
          @hls_basic_put_settings : Types::HlsBasicPutSettings? = nil,
          @hls_media_store_settings : Types::HlsMediaStoreSettings? = nil,
          @hls_s3_settings : Types::HlsS3Settings? = nil,
          @hls_webdav_settings : Types::HlsWebdavSettings? = nil
        )
        end
      end

      # Hls Group Settings

      struct HlsGroupSettings
        include JSON::Serializable

        # A directory or HTTP destination for the HLS segments, manifest files, and encryption keys (if
        # enabled).

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # Choose one or more ad marker types to pass SCTE35 signals through to this group of Apple HLS
        # outputs.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : Array(String)?

        # A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if
        # base manifest is delivered from a different URL than the main .m3u8 file.

        @[JSON::Field(key: "baseUrlContent")]
        getter base_url_content : String?

        # Optional. One value per output group. This field is required only if you are completing Base URL
        # content A, and the downstream system has notified you that the media files for pipeline 1 of all
        # outputs are in a location different from the media files for pipeline 0.

        @[JSON::Field(key: "baseUrlContent1")]
        getter base_url_content1 : String?

        # A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if
        # base manifest is delivered from a different URL than the main .m3u8 file.

        @[JSON::Field(key: "baseUrlManifest")]
        getter base_url_manifest : String?

        # Optional. One value per output group. Complete this field only if you are completing Base URL
        # manifest A, and the downstream system has notified you that the child manifest files for pipeline 1
        # of all outputs are in a location different from the child manifest files for pipeline 0.

        @[JSON::Field(key: "baseUrlManifest1")]
        getter base_url_manifest1 : String?

        # Mapping of up to 4 caption channels to caption languages. Is only meaningful if
        # captionLanguageSetting is set to "insert".

        @[JSON::Field(key: "captionLanguageMappings")]
        getter caption_language_mappings : Array(Types::CaptionLanguageMapping)?

        # Applies only to 608 Embedded output captions. insert: Include CLOSED-CAPTIONS lines in the manifest.
        # Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for
        # each Language Code you specify. Make sure to specify the languages in the order in which they appear
        # in the original source (if the source is embedded format) or the order of the caption selectors (if
        # the source is other than embedded). Otherwise, languages in the manifest will not match up properly
        # with the output captions. none: Include CLOSED-CAPTIONS=NONE line in the manifest. omit: Omit any
        # CLOSED-CAPTIONS line from the manifest.

        @[JSON::Field(key: "captionLanguageSetting")]
        getter caption_language_setting : String?

        # When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest, which prevents clients
        # from saving media segments for later replay.

        @[JSON::Field(key: "clientCache")]
        getter client_cache : String?

        # Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.

        @[JSON::Field(key: "codecSpecification")]
        getter codec_specification : String?

        # For use with encryptionType. This is a 128-bit, 16-byte hex value represented by a 32-character text
        # string. If ivSource is set to "explicit" then this parameter is required and is used as the IV for
        # encryption.

        @[JSON::Field(key: "constantIv")]
        getter constant_iv : String?

        # Place segments in subdirectories.

        @[JSON::Field(key: "directoryStructure")]
        getter directory_structure : String?

        # Specifies whether to insert EXT-X-DISCONTINUITY tags in the HLS child manifests for this output
        # group. Typically, choose Insert because these tags are required in the manifest (according to the
        # HLS specification) and serve an important purpose. Choose Never Insert only if the downstream system
        # is doing real-time failover (without using the MediaLive automatic failover feature) and only if
        # that downstream system has advised you to exclude the tags.

        @[JSON::Field(key: "discontinuityTags")]
        getter discontinuity_tags : String?

        # Encrypts the segments with the given encryption scheme. Exclude this parameter if no encryption is
        # desired.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # Parameters that control interactions with the CDN.

        @[JSON::Field(key: "hlsCdnSettings")]
        getter hls_cdn_settings : Types::HlsCdnSettings?

        # State of HLS ID3 Segment Tagging

        @[JSON::Field(key: "hlsId3SegmentTagging")]
        getter hls_id3_segment_tagging : String?

        # DISABLED: Do not create an I-frame-only manifest, but do create the master and media manifests
        # (according to the Output Selection field). STANDARD: Create an I-frame-only manifest for each output
        # that contains video, as well as the other manifests (according to the Output Selection field). The
        # I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate it is I-frame only, and one or more
        # #EXT-X-BYTERANGE entries identifying the I-frame position. For example,
        # #EXT-X-BYTERANGE:160364@1461888"

        @[JSON::Field(key: "iFrameOnlyPlaylists")]
        getter i_frame_only_playlists : String?

        # Specifies whether to include the final (incomplete) segment in the media output when the pipeline
        # stops producing output because of a channel stop, a channel pause or a loss of input to the
        # pipeline. Auto means that MediaLive decides whether to include the final segment, depending on the
        # channel class and the types of output groups. Suppress means to never include the incomplete
        # segment. We recommend you choose Auto and let MediaLive control the behavior.

        @[JSON::Field(key: "incompleteSegmentBehavior")]
        getter incomplete_segment_behavior : String?

        # Applies only if Mode field is LIVE. Specifies the maximum number of segments in the media manifest
        # file. After this maximum, older segments are removed from the media manifest. This number must be
        # smaller than the number in the Keep Segments field.

        @[JSON::Field(key: "indexNSegments")]
        getter index_n_segments : Int32?

        # Parameter that control output group behavior on input loss.

        @[JSON::Field(key: "inputLossAction")]
        getter input_loss_action : String?

        # For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction
        # with the key for encrypting blocks. If set to "include", IV is listed in the manifest, otherwise the
        # IV is not in the manifest.

        @[JSON::Field(key: "ivInManifest")]
        getter iv_in_manifest : String?

        # For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction
        # with the key for encrypting blocks. If this setting is "followsSegmentNumber", it will cause the IV
        # to change every segment (to match the segment number). If this is set to "explicit", you must enter
        # a constantIv value.

        @[JSON::Field(key: "ivSource")]
        getter iv_source : String?

        # Applies only if Mode field is LIVE. Specifies the number of media segments to retain in the
        # destination directory. This number should be bigger than indexNSegments (Num segments). We recommend
        # (value = (2 x indexNsegments) + 1). If this "keep segments" number is too low, the following might
        # happen: the player is still reading a media manifest file that lists this segment, but that segment
        # has been removed from the destination directory (as directed by indexNSegments). This situation
        # would result in a 404 HTTP error on the player.

        @[JSON::Field(key: "keepSegments")]
        getter keep_segments : Int32?

        # The value specifies how the key is represented in the resource identified by the URI. If parameter
        # is absent, an implicit value of "identity" is used. A reverse DNS string can also be given.

        @[JSON::Field(key: "keyFormat")]
        getter key_format : String?

        # Either a single positive integer version value or a slash delimited list of version values (1/2/3).

        @[JSON::Field(key: "keyFormatVersions")]
        getter key_format_versions : String?

        # The key provider settings.

        @[JSON::Field(key: "keyProviderSettings")]
        getter key_provider_settings : Types::KeyProviderSettings?

        # When set to gzip, compresses HLS playlist.

        @[JSON::Field(key: "manifestCompression")]
        getter manifest_compression : String?

        # Indicates whether the output manifest should use floating point or integer values for segment
        # duration.

        @[JSON::Field(key: "manifestDurationFormat")]
        getter manifest_duration_format : String?

        # Minimum length of MPEG-2 Transport Stream segments in seconds. When set, minimum segment length is
        # enforced by looking ahead and back within the specified range for a nearby avail and extending the
        # segment size if needed.

        @[JSON::Field(key: "minSegmentLength")]
        getter min_segment_length : Int32?

        # If "vod", all segments are indexed and kept permanently in the destination and manifest. If "live",
        # only the number segments specified in keepSegments and indexNSegments are kept; newer segments
        # replace older segments, which may prevent players from rewinding all the way to the beginning of the
        # event. VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running, converting it to
        # a "VOD" type manifest on completion of the stream.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # MANIFESTS_AND_SEGMENTS: Generates manifests (master manifest, if applicable, and media manifests)
        # for this output group. VARIANT_MANIFESTS_AND_SEGMENTS: Generates media manifests for this output
        # group, but not a master manifest. SEGMENTS_ONLY: Does not generate any manifests for this output
        # group.

        @[JSON::Field(key: "outputSelection")]
        getter output_selection : String?

        # Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated
        # using the program date time clock.

        @[JSON::Field(key: "programDateTime")]
        getter program_date_time : String?

        # Specifies the algorithm used to drive the HLS EXT-X-PROGRAM-DATE-TIME clock. Options include:
        # INITIALIZE_FROM_OUTPUT_TIMECODE: The PDT clock is initialized as a function of the first output
        # timecode, then incremented by the EXTINF duration of each encoded segment. SYSTEM_CLOCK: The PDT
        # clock is initialized as a function of the UTC wall clock, then incremented by the EXTINF duration of
        # each encoded segment. If the PDT clock diverges from the wall clock by more than 500ms, it is
        # resynchronized to the wall clock.

        @[JSON::Field(key: "programDateTimeClock")]
        getter program_date_time_clock : String?

        # Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.

        @[JSON::Field(key: "programDateTimePeriod")]
        getter program_date_time_period : Int32?

        # ENABLED: The master manifest (.m3u8 file) for each pipeline includes information about both
        # pipelines: first its own media files, then the media files of the other pipeline. This feature
        # allows playout device that support stale manifest detection to switch from one manifest to the
        # other, when the current manifest seems to be stale. There are still two destinations and two master
        # manifests, but both master manifests reference the media files from both pipelines. DISABLED: The
        # master manifest (.m3u8 file) for each pipeline includes information about its own pipeline only. For
        # an HLS output group with MediaPackage as the destination, the DISABLED behavior is always followed.
        # MediaPackage regenerates the manifests it serves to players so a redundant manifest from MediaLive
        # is irrelevant.

        @[JSON::Field(key: "redundantManifest")]
        getter redundant_manifest : String?

        # Length of MPEG-2 Transport Stream segments to create in seconds. Note that segments will end on the
        # next keyframe after this duration, so actual segment length may be longer.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # useInputSegmentation has been deprecated. The configured segment size is always used.

        @[JSON::Field(key: "segmentationMode")]
        getter segmentation_mode : String?

        # Number of segments to write to a subdirectory before starting a new one. directoryStructure must be
        # subdirectoryPerStream for this setting to have an effect.

        @[JSON::Field(key: "segmentsPerSubdirectory")]
        getter segments_per_subdirectory : Int32?

        # Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.

        @[JSON::Field(key: "streamInfResolution")]
        getter stream_inf_resolution : String?

        # Indicates ID3 frame that has the timecode.

        @[JSON::Field(key: "timedMetadataId3Frame")]
        getter timed_metadata_id3_frame : String?

        # Timed Metadata interval in seconds.

        @[JSON::Field(key: "timedMetadataId3Period")]
        getter timed_metadata_id3_period : Int32?

        # Provides an extra millisecond delta offset to fine tune the timestamps.

        @[JSON::Field(key: "timestampDeltaMilliseconds")]
        getter timestamp_delta_milliseconds : Int32?

        # SEGMENTED_FILES: Emit the program as segments - multiple .ts media files. SINGLE_FILE: Applies only
        # if Mode field is VOD. Emit the program as a single .ts media file. The media manifest includes
        # #EXT-X-BYTERANGE tags to index segments for playback. A typical use for this value is when sending
        # the output to AWS Elemental MediaConvert, which can accept only a single media file. Playback while
        # the channel is running is not guaranteed due to HTTP server caching.

        @[JSON::Field(key: "tsFileMode")]
        getter ts_file_mode : String?

        def initialize(
          @destination : Types::OutputLocationRef,
          @ad_markers : Array(String)? = nil,
          @base_url_content : String? = nil,
          @base_url_content1 : String? = nil,
          @base_url_manifest : String? = nil,
          @base_url_manifest1 : String? = nil,
          @caption_language_mappings : Array(Types::CaptionLanguageMapping)? = nil,
          @caption_language_setting : String? = nil,
          @client_cache : String? = nil,
          @codec_specification : String? = nil,
          @constant_iv : String? = nil,
          @directory_structure : String? = nil,
          @discontinuity_tags : String? = nil,
          @encryption_type : String? = nil,
          @hls_cdn_settings : Types::HlsCdnSettings? = nil,
          @hls_id3_segment_tagging : String? = nil,
          @i_frame_only_playlists : String? = nil,
          @incomplete_segment_behavior : String? = nil,
          @index_n_segments : Int32? = nil,
          @input_loss_action : String? = nil,
          @iv_in_manifest : String? = nil,
          @iv_source : String? = nil,
          @keep_segments : Int32? = nil,
          @key_format : String? = nil,
          @key_format_versions : String? = nil,
          @key_provider_settings : Types::KeyProviderSettings? = nil,
          @manifest_compression : String? = nil,
          @manifest_duration_format : String? = nil,
          @min_segment_length : Int32? = nil,
          @mode : String? = nil,
          @output_selection : String? = nil,
          @program_date_time : String? = nil,
          @program_date_time_clock : String? = nil,
          @program_date_time_period : Int32? = nil,
          @redundant_manifest : String? = nil,
          @segment_length : Int32? = nil,
          @segmentation_mode : String? = nil,
          @segments_per_subdirectory : Int32? = nil,
          @stream_inf_resolution : String? = nil,
          @timed_metadata_id3_frame : String? = nil,
          @timed_metadata_id3_period : Int32? = nil,
          @timestamp_delta_milliseconds : Int32? = nil,
          @ts_file_mode : String? = nil
        )
        end
      end

      # Settings for the action to insert ID3 metadata in every segment, in HLS output groups.

      struct HlsId3SegmentTaggingScheduleActionSettings
        include JSON::Serializable

        # Complete this parameter if you want to specify the entire ID3 metadata. Enter a base64 string that
        # contains one or more fully formed ID3 tags, according to the ID3 specification:
        # http://id3.org/id3v2.4.0-structure

        @[JSON::Field(key: "id3")]
        getter id3 : String?

        # Complete this parameter if you want to specify only the metadata, not the entire frame. MediaLive
        # will insert the metadata in a TXXX frame. Enter the value as plain text. You can include standard
        # MediaLive variable data such as the current segment number.

        @[JSON::Field(key: "tag")]
        getter tag : String?

        def initialize(
          @id3 : String? = nil,
          @tag : String? = nil
        )
        end
      end

      # Hls Input Settings

      struct HlsInputSettings
        include JSON::Serializable

        # When specified the HLS stream with the m3u8 BANDWIDTH that most closely matches this value will be
        # chosen, otherwise the highest bandwidth stream in the m3u8 will be chosen. The bitrate is specified
        # in bits per second, as in an HLS manifest.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : Int32?

        # When specified, reading of the HLS input will begin this many buffer segments from the end (most
        # recently written segment). When not specified, the HLS input will begin with the first segment
        # specified in the m3u8.

        @[JSON::Field(key: "bufferSegments")]
        getter buffer_segments : Int32?

        # The number of consecutive times that attempts to read a manifest or segment must fail before the
        # input is considered unavailable.

        @[JSON::Field(key: "retries")]
        getter retries : Int32?

        # The number of seconds between retries when an attempt to read a manifest or segment fails.

        @[JSON::Field(key: "retryInterval")]
        getter retry_interval : Int32?

        # Identifies the source for the SCTE-35 messages that MediaLive will ingest. Messages can be ingested
        # from the content segments (in the stream) or from tags in the playlist (the HLS manifest). MediaLive
        # ignores SCTE-35 information in the source that is not selected.

        @[JSON::Field(key: "scte35Source")]
        getter scte35_source : String?

        def initialize(
          @bandwidth : Int32? = nil,
          @buffer_segments : Int32? = nil,
          @retries : Int32? = nil,
          @retry_interval : Int32? = nil,
          @scte35_source : String? = nil
        )
        end
      end

      # Hls Media Store Settings

      struct HlsMediaStoreSettings
        include JSON::Serializable

        # Number of seconds to wait before retrying connection to the CDN if the connection is lost.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # Size in seconds of file cache for streaming outputs.

        @[JSON::Field(key: "filecacheDuration")]
        getter filecache_duration : Int32?

        # When set to temporal, output files are stored in non-persistent memory for faster reading and
        # writing.

        @[JSON::Field(key: "mediaStoreStorageClass")]
        getter media_store_storage_class : String?

        # Number of retry attempts that will be made before the Live Event is put into an error state. Applies
        # only if the CDN destination URI begins with "s3" or "mediastore". For other URIs, the value is
        # always 3.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        # If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0
        # means never restart.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        def initialize(
          @connection_retry_interval : Int32? = nil,
          @filecache_duration : Int32? = nil,
          @media_store_storage_class : String? = nil,
          @num_retries : Int32? = nil,
          @restart_delay : Int32? = nil
        )
        end
      end

      # Hls Output Settings

      struct HlsOutputSettings
        include JSON::Serializable

        # Settings regarding the underlying stream. These settings are different for audio-only outputs.

        @[JSON::Field(key: "hlsSettings")]
        getter hls_settings : Types::HlsSettings

        # Only applicable when this output is referencing an H.265 video description. Specifies whether MP4
        # segments should be packaged as HEV1 or HVC1.

        @[JSON::Field(key: "h265PackagingType")]
        getter h265_packaging_type : String?

        # String concatenated to the end of the destination filename. Accepts \"Format
        # Identifiers\":#formatIdentifierParameters.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        # String concatenated to end of segment filenames.

        @[JSON::Field(key: "segmentModifier")]
        getter segment_modifier : String?

        def initialize(
          @hls_settings : Types::HlsSettings,
          @h265_packaging_type : String? = nil,
          @name_modifier : String? = nil,
          @segment_modifier : String? = nil
        )
        end
      end

      # Hls S3 Settings

      struct HlsS3Settings
        include JSON::Serializable

        # Specify the canned ACL to apply to each S3 request. Defaults to none.

        @[JSON::Field(key: "cannedAcl")]
        getter canned_acl : String?

        def initialize(
          @canned_acl : String? = nil
        )
        end
      end

      # Hls Settings

      struct HlsSettings
        include JSON::Serializable


        @[JSON::Field(key: "audioOnlyHlsSettings")]
        getter audio_only_hls_settings : Types::AudioOnlyHlsSettings?


        @[JSON::Field(key: "fmp4HlsSettings")]
        getter fmp4_hls_settings : Types::Fmp4HlsSettings?


        @[JSON::Field(key: "frameCaptureHlsSettings")]
        getter frame_capture_hls_settings : Types::FrameCaptureHlsSettings?


        @[JSON::Field(key: "standardHlsSettings")]
        getter standard_hls_settings : Types::StandardHlsSettings?

        def initialize(
          @audio_only_hls_settings : Types::AudioOnlyHlsSettings? = nil,
          @fmp4_hls_settings : Types::Fmp4HlsSettings? = nil,
          @frame_capture_hls_settings : Types::FrameCaptureHlsSettings? = nil,
          @standard_hls_settings : Types::StandardHlsSettings? = nil
        )
        end
      end

      # Settings for the action to insert ID3 metadata (as a one-time action) in HLS output groups.

      struct HlsTimedMetadataScheduleActionSettings
        include JSON::Serializable

        # Enter a base64 string that contains one or more fully formed ID3 tags.See the ID3 specification:
        # http://id3.org/id3v2.4.0-structure

        @[JSON::Field(key: "id3")]
        getter id3 : String

        def initialize(
          @id3 : String
        )
        end
      end

      # Hls Webdav Settings

      struct HlsWebdavSettings
        include JSON::Serializable

        # Number of seconds to wait before retrying connection to the CDN if the connection is lost.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # Size in seconds of file cache for streaming outputs.

        @[JSON::Field(key: "filecacheDuration")]
        getter filecache_duration : Int32?

        # Specify whether or not to use chunked transfer encoding to WebDAV.

        @[JSON::Field(key: "httpTransferMode")]
        getter http_transfer_mode : String?

        # Number of retry attempts that will be made before the Live Event is put into an error state. Applies
        # only if the CDN destination URI begins with "s3" or "mediastore". For other URIs, the value is
        # always 3.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        # If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0
        # means never restart.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        def initialize(
          @connection_retry_interval : Int32? = nil,
          @filecache_duration : Int32? = nil,
          @http_transfer_mode : String? = nil,
          @num_retries : Int32? = nil,
          @restart_delay : Int32? = nil
        )
        end
      end

      # Html Motion Graphics Settings

      struct HtmlMotionGraphicsSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Settings for the action to insert ID3 metadata in every segment, in applicable output groups.

      struct Id3SegmentTaggingScheduleActionSettings
        include JSON::Serializable

        # Complete this parameter if you want to specify the entire ID3 metadata. Enter a base64 string that
        # contains one or more fully formed ID3 tags, according to the ID3 specification:
        # http://id3.org/id3v2.4.0-structure

        @[JSON::Field(key: "id3")]
        getter id3 : String?

        # Complete this parameter if you want to specify only the metadata, not the entire frame. MediaLive
        # will insert the metadata in a TXXX frame. Enter the value as plain text. You can include standard
        # MediaLive variable data such as the current segment number.

        @[JSON::Field(key: "tag")]
        getter tag : String?

        def initialize(
          @id3 : String? = nil,
          @tag : String? = nil
        )
        end
      end

      # Settings to configure an action so that it occurs as soon as possible.

      struct ImmediateModeScheduleActionStartSettings
        include JSON::Serializable

        def initialize
        end
      end


      struct Input
        include JSON::Serializable

        # The Unique ARN of the input (generated, immutable).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A list of channel IDs that that input is attached to (currently an input can only be attached to one
        # channel).

        @[JSON::Field(key: "attachedChannels")]
        getter attached_channels : Array(String)?

        # A list of the destinations of the input (PUSH-type).

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestination)?

        # The generated ID of the input (unique for user account, immutable).

        @[JSON::Field(key: "id")]
        getter id : String?

        # STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also
        # STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source
        # will be ingested; the second source will always be ignored, even if the first source fails.
        # SINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is also
        # SINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid
        # because the channel requires two sources in the input.

        @[JSON::Field(key: "inputClass")]
        getter input_class : String?

        # Settings for the input devices.

        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSettings)?

        # The location of this input. AWS, for an input existing in the AWS Cloud, On-Prem for an input in a
        # customer network.

        @[JSON::Field(key: "inputNetworkLocation")]
        getter input_network_location : String?

        # A list of IDs for all Inputs which are partners of this one.

        @[JSON::Field(key: "inputPartnerIds")]
        getter input_partner_ids : Array(String)?

        # Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically
        # changes during input switch actions. Presently, this functionality only works with MP4_FILE and
        # TS_FILE inputs.

        @[JSON::Field(key: "inputSourceType")]
        getter input_source_type : String?

        # A list of MediaConnect Flows for this input.

        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlow)?

        # Multicast Input settings.

        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettings?

        # The user-assigned name (This is a mutable value).

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the role this input assumes during and after creation.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Information about any MediaConnect router association with this input.

        @[JSON::Field(key: "routerSettings")]
        getter router_settings : Types::RouterInputSettings?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?

        # A list of IDs for all the Input Security Groups attached to the input.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # Include this parameter if the input is a SMPTE 2110 input, to identify the stream sources for this
        # input.

        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?

        # A list of the sources of the input (PULL-type).

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSource)?

        # The settings associated with an SRT input.

        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettings?


        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @attached_channels : Array(String)? = nil,
          @destinations : Array(Types::InputDestination)? = nil,
          @id : String? = nil,
          @input_class : String? = nil,
          @input_devices : Array(Types::InputDeviceSettings)? = nil,
          @input_network_location : String? = nil,
          @input_partner_ids : Array(String)? = nil,
          @input_source_type : String? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlow)? = nil,
          @multicast_settings : Types::MulticastSettings? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @router_settings : Types::RouterInputSettings? = nil,
          @sdi_sources : Array(String)? = nil,
          @security_groups : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSource)? = nil,
          @srt_settings : Types::SrtSettings? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct InputAttachment
        include JSON::Serializable

        # User-specified settings for defining what the conditions are for declaring the input unhealthy and
        # failing over to a different input.

        @[JSON::Field(key: "automaticInputFailoverSettings")]
        getter automatic_input_failover_settings : Types::AutomaticInputFailoverSettings?

        # User-specified name for the attachment. This is required if the user wants to use this input in an
        # input switch action.

        @[JSON::Field(key: "inputAttachmentName")]
        getter input_attachment_name : String?

        # The ID of the input

        @[JSON::Field(key: "inputId")]
        getter input_id : String?

        # Settings of an input (caption selector, etc.)

        @[JSON::Field(key: "inputSettings")]
        getter input_settings : Types::InputSettings?

        # Optional assignment of an input to a logical interface on the Node. Only applies to on premises
        # channels.

        @[JSON::Field(key: "logicalInterfaceNames")]
        getter logical_interface_names : Array(String)?

        def initialize(
          @automatic_input_failover_settings : Types::AutomaticInputFailoverSettings? = nil,
          @input_attachment_name : String? = nil,
          @input_id : String? = nil,
          @input_settings : Types::InputSettings? = nil,
          @logical_interface_names : Array(String)? = nil
        )
        end
      end

      # Input Channel Level

      struct InputChannelLevel
        include JSON::Serializable

        # Remixing value. Units are in dB and acceptable values are within the range from -60 (mute) and 6 dB.

        @[JSON::Field(key: "gain")]
        getter gain : Int32

        # The index of the input channel used as a source.

        @[JSON::Field(key: "inputChannel")]
        getter input_channel : Int32

        def initialize(
          @gain : Int32,
          @input_channel : Int32
        )
        end
      end

      # Settings to let you create a clip of the file input, in order to set up the input to ingest only a
      # portion of the file.

      struct InputClippingSettings
        include JSON::Serializable

        # The source of the timecodes in the source being clipped.

        @[JSON::Field(key: "inputTimecodeSource")]
        getter input_timecode_source : String

        # Settings to identify the start of the clip.

        @[JSON::Field(key: "startTimecode")]
        getter start_timecode : Types::StartTimecode?

        # Settings to identify the end of the clip.

        @[JSON::Field(key: "stopTimecode")]
        getter stop_timecode : Types::StopTimecode?

        def initialize(
          @input_timecode_source : String,
          @start_timecode : Types::StartTimecode? = nil,
          @stop_timecode : Types::StopTimecode? = nil
        )
        end
      end

      # The settings for a PUSH type input.

      struct InputDestination
        include JSON::Serializable

        # The system-generated static IP address of endpoint. It remains fixed for the lifetime of the input.

        @[JSON::Field(key: "ip")]
        getter ip : String?

        # The ID of the attached network.

        @[JSON::Field(key: "network")]
        getter network : String?

        # If the push input has an input location of ON-PREM it's a requirement to specify what the route of
        # the input is going to be on the customer local network.

        @[JSON::Field(key: "networkRoutes")]
        getter network_routes : Array(Types::InputDestinationRoute)?

        # The port number for the input.

        @[JSON::Field(key: "port")]
        getter port : String?

        # This represents the endpoint that the customer stream will be pushed to.

        @[JSON::Field(key: "url")]
        getter url : String?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::InputDestinationVpc?

        def initialize(
          @ip : String? = nil,
          @network : String? = nil,
          @network_routes : Array(Types::InputDestinationRoute)? = nil,
          @port : String? = nil,
          @url : String? = nil,
          @vpc : Types::InputDestinationVpc? = nil
        )
        end
      end

      # Endpoint settings for a PUSH type input.

      struct InputDestinationRequest
        include JSON::Serializable

        # If the push input has an input location of ON-PREM, ID the ID of the attached network.

        @[JSON::Field(key: "network")]
        getter network : String?

        # If the push input has an input location of ON-PREM it's a requirement to specify what the route of
        # the input is going to be on the customer local network.

        @[JSON::Field(key: "networkRoutes")]
        getter network_routes : Array(Types::InputRequestDestinationRoute)?

        # If the push input has an input location of ON-PREM it's optional to specify what the ip address of
        # the input is going to be on the customer local network.

        @[JSON::Field(key: "staticIpAddress")]
        getter static_ip_address : String?

        # A unique name for the location the RTMP stream is being pushed to.

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        def initialize(
          @network : String? = nil,
          @network_routes : Array(Types::InputRequestDestinationRoute)? = nil,
          @static_ip_address : String? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # A network route configuration.

      struct InputDestinationRoute
        include JSON::Serializable

        # The CIDR of the route.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # An optional gateway for the route.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        def initialize(
          @cidr : String? = nil,
          @gateway : String? = nil
        )
        end
      end

      # The properties for a VPC type input destination.

      struct InputDestinationVpc
        include JSON::Serializable

        # The availability zone of the Input destination.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The network interface ID of the Input destination in the VPC.

        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @network_interface_id : String? = nil
        )
        end
      end

      # An input device.

      struct InputDevice
        include JSON::Serializable

        # The unique ARN of the input device.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Availability Zone associated with this input device.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The state of the connection between the input device and AWS.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        # The status of the action to synchronize the device configuration. If you change the configuration of
        # the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The
        # device might not update itself immediately. SYNCED means the device has updated its configuration.
        # SYNCING means that it has not updated its configuration.

        @[JSON::Field(key: "deviceSettingsSyncState")]
        getter device_settings_sync_state : String?

        # The status of software on the input device.

        @[JSON::Field(key: "deviceUpdateStatus")]
        getter device_update_status : String?

        # Settings that describe an input device that is type HD.

        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceHdSettings?

        # The unique ID of the input device.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The network MAC address of the input device.

        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?

        # An array of the ARNs for the MediaLive inputs attached to the device. Returned only if the
        # outputType is MEDIALIVE_INPUT.

        @[JSON::Field(key: "medialiveInputArns")]
        getter medialive_input_arns : Array(String)?

        # A name that you specify for the input device.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The network settings for the input device.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::InputDeviceNetworkSettings?

        # The output attachment type of the input device. Specifies MEDIACONNECT_FLOW if this device is the
        # source for a MediaConnect flow. Specifies MEDIALIVE_INPUT if this device is the source for a
        # MediaLive input.

        @[JSON::Field(key: "outputType")]
        getter output_type : String?

        # The unique serial number of the input device.

        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the input device.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Settings that describe an input device that is type UHD.

        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceUhdSettings?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @connection_state : String? = nil,
          @device_settings_sync_state : String? = nil,
          @device_update_status : String? = nil,
          @hd_device_settings : Types::InputDeviceHdSettings? = nil,
          @id : String? = nil,
          @mac_address : String? = nil,
          @medialive_input_arns : Array(String)? = nil,
          @name : String? = nil,
          @network_settings : Types::InputDeviceNetworkSettings? = nil,
          @output_type : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uhd_device_settings : Types::InputDeviceUhdSettings? = nil
        )
        end
      end

      # One audio configuration that specifies the format for one audio pair that the device produces as
      # output.

      struct InputDeviceConfigurableAudioChannelPairConfig
        include JSON::Serializable

        # The ID for one audio pair configuration, a value from 1 to 8.

        @[JSON::Field(key: "id")]
        getter id : Int32?

        # The profile to set for one audio pair configuration. Choose an enumeration value. Each value
        # describes one audio configuration using the format (rate control
        # algorithm)-(codec)_(quality)-(bitrate in bytes). For example, CBR-AAC_HQ-192000. Or choose DISABLED,
        # in which case the device won't produce audio for this pair.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        def initialize(
          @id : Int32? = nil,
          @profile : String? = nil
        )
        end
      end

      # Configurable settings for the input device.

      struct InputDeviceConfigurableSettings
        include JSON::Serializable

        # An array of eight audio configurations, one for each audio pair in the source. Set up each audio
        # configuration either to exclude the pair, or to format it and include it in the output from the
        # device. This parameter applies only to UHD devices, and only when the device is configured as the
        # source for a MediaConnect flow. For an HD device, you configure the audio by setting up audio
        # selectors in the channel configuration.

        @[JSON::Field(key: "audioChannelPairs")]
        getter audio_channel_pairs : Array(Types::InputDeviceConfigurableAudioChannelPairConfig)?

        # Choose the codec for the video that the device produces. Only UHD devices can specify this
        # parameter.

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # The input source that you want to use. If the device has a source connected to only one of its input
        # ports, or if you don't care which source the device sends, specify Auto. If the device has sources
        # connected to both its input ports, and you want to use a specific source, specify the source.

        @[JSON::Field(key: "configuredInput")]
        getter configured_input : String?

        # Choose the resolution of the Link device's source (HD or UHD). Make sure the resolution matches the
        # current source from the device. This value determines MediaLive resource allocation and billing for
        # this input. Only UHD devices can specify this parameter.

        @[JSON::Field(key: "inputResolution")]
        getter input_resolution : String?

        # The Link device's buffer size (latency) in milliseconds (ms).

        @[JSON::Field(key: "latencyMs")]
        getter latency_ms : Int32?

        # The maximum bitrate in bits per second. Set a value here to throttle the bitrate of the source
        # video.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # To attach this device to a MediaConnect flow, specify these parameters. To detach an existing flow,
        # enter {} for the value of mediaconnectSettings. Only UHD devices can specify this parameter.

        @[JSON::Field(key: "mediaconnectSettings")]
        getter mediaconnect_settings : Types::InputDeviceMediaConnectConfigurableSettings?

        def initialize(
          @audio_channel_pairs : Array(Types::InputDeviceConfigurableAudioChannelPairConfig)? = nil,
          @codec : String? = nil,
          @configured_input : String? = nil,
          @input_resolution : String? = nil,
          @latency_ms : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @mediaconnect_settings : Types::InputDeviceMediaConnectConfigurableSettings? = nil
        )
        end
      end


      struct InputDeviceConfigurationValidationError
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A collection of validation error responses.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        def initialize(
          @message : String? = nil,
          @validation_errors : Array(Types::ValidationError)? = nil
        )
        end
      end

      # Settings that describe the active source from the input device, and the video characteristics of
      # that source.

      struct InputDeviceHdSettings
        include JSON::Serializable

        # If you specified Auto as the configured input, specifies which of the sources is currently active
        # (SDI or HDMI).

        @[JSON::Field(key: "activeInput")]
        getter active_input : String?

        # The source at the input device that is currently active. You can specify this source.

        @[JSON::Field(key: "configuredInput")]
        getter configured_input : String?

        # The state of the input device.

        @[JSON::Field(key: "deviceState")]
        getter device_state : String?

        # The frame rate of the video source.

        @[JSON::Field(key: "framerate")]
        getter framerate : Float64?

        # The height of the video source, in pixels.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # The Link device's buffer size (latency) in milliseconds (ms). You can specify this value.

        @[JSON::Field(key: "latencyMs")]
        getter latency_ms : Int32?

        # The current maximum bitrate for ingesting this source, in bits per second. You can specify this
        # maximum.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # The scan type of the video source.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # The width of the video source, in pixels.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @active_input : String? = nil,
          @configured_input : String? = nil,
          @device_state : String? = nil,
          @framerate : Float64? = nil,
          @height : Int32? = nil,
          @latency_ms : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @scan_type : String? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Parameters required to attach a MediaConnect flow to the device.

      struct InputDeviceMediaConnectConfigurableSettings
        include JSON::Serializable

        # The ARN of the MediaConnect flow to attach this device to.

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN for the role that MediaLive assumes to access the attached flow and secret. For more
        # information about how to create this role, see the MediaLive user guide.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ARN for the secret that holds the encryption key to encrypt the content output by the device.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        # The name of the MediaConnect Flow source to stream to.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        def initialize(
          @flow_arn : String? = nil,
          @role_arn : String? = nil,
          @secret_arn : String? = nil,
          @source_name : String? = nil
        )
        end
      end

      # Information about the MediaConnect flow attached to the device.

      struct InputDeviceMediaConnectSettings
        include JSON::Serializable

        # The ARN of the MediaConnect flow.

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        # The ARN for the role that MediaLive assumes to access the attached flow and secret.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ARN of the secret used to encrypt the stream.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        # The name of the MediaConnect flow source.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        def initialize(
          @flow_arn : String? = nil,
          @role_arn : String? = nil,
          @secret_arn : String? = nil,
          @source_name : String? = nil
        )
        end
      end

      # The network settings for the input device.

      struct InputDeviceNetworkSettings
        include JSON::Serializable

        # The DNS addresses of the input device.

        @[JSON::Field(key: "dnsAddresses")]
        getter dns_addresses : Array(String)?

        # The network gateway IP address.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        # The IP address of the input device.

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # Specifies whether the input device has been configured (outside of MediaLive) to use a dynamic IP
        # address assignment (DHCP) or a static IP address.

        @[JSON::Field(key: "ipScheme")]
        getter ip_scheme : String?

        # The subnet mask of the input device.

        @[JSON::Field(key: "subnetMask")]
        getter subnet_mask : String?

        def initialize(
          @dns_addresses : Array(String)? = nil,
          @gateway : String? = nil,
          @ip_address : String? = nil,
          @ip_scheme : String? = nil,
          @subnet_mask : String? = nil
        )
        end
      end

      # Settings for an input device.

      struct InputDeviceRequest
        include JSON::Serializable

        # The unique ID for the device.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Settings for an input device.

      struct InputDeviceSettings
        include JSON::Serializable

        # The unique ID for the device.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Details of the input device.

      struct InputDeviceSummary
        include JSON::Serializable

        # The unique ARN of the input device.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Availability Zone associated with this input device.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The state of the connection between the input device and AWS.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        # The status of the action to synchronize the device configuration. If you change the configuration of
        # the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The
        # device might not update itself immediately. SYNCED means the device has updated its configuration.
        # SYNCING means that it has not updated its configuration.

        @[JSON::Field(key: "deviceSettingsSyncState")]
        getter device_settings_sync_state : String?

        # The status of software on the input device.

        @[JSON::Field(key: "deviceUpdateStatus")]
        getter device_update_status : String?

        # Settings that describe an input device that is type HD.

        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceHdSettings?

        # The unique ID of the input device.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The network MAC address of the input device.

        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?

        # An array of the ARNs for the MediaLive inputs attached to the device. Returned only if the
        # outputType is MEDIALIVE_INPUT.

        @[JSON::Field(key: "medialiveInputArns")]
        getter medialive_input_arns : Array(String)?

        # A name that you specify for the input device.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Network settings for the input device.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::InputDeviceNetworkSettings?

        # The output attachment type of the input device. Specifies MEDIACONNECT_FLOW if this device is the
        # source for a MediaConnect flow. Specifies MEDIALIVE_INPUT if this device is the source for a
        # MediaLive input.

        @[JSON::Field(key: "outputType")]
        getter output_type : String?

        # The unique serial number of the input device.

        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the input device.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Settings that describe an input device that is type UHD.

        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceUhdSettings?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @connection_state : String? = nil,
          @device_settings_sync_state : String? = nil,
          @device_update_status : String? = nil,
          @hd_device_settings : Types::InputDeviceHdSettings? = nil,
          @id : String? = nil,
          @mac_address : String? = nil,
          @medialive_input_arns : Array(String)? = nil,
          @name : String? = nil,
          @network_settings : Types::InputDeviceNetworkSettings? = nil,
          @output_type : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uhd_device_settings : Types::InputDeviceUhdSettings? = nil
        )
        end
      end

      # One audio configuration that specifies the format for one audio pair that the device produces as
      # output.

      struct InputDeviceUhdAudioChannelPairConfig
        include JSON::Serializable

        # The ID for one audio pair configuration, a value from 1 to 8.

        @[JSON::Field(key: "id")]
        getter id : Int32?

        # The profile for one audio pair configuration. This property describes one audio configuration in the
        # format (rate control algorithm)-(codec)_(quality)-(bitrate in bytes). For example,
        # CBR-AAC_HQ-192000. Or DISABLED, in which case the device won't produce audio for this pair.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        def initialize(
          @id : Int32? = nil,
          @profile : String? = nil
        )
        end
      end

      # Settings that describe the active source from the input device, and the video characteristics of
      # that source.

      struct InputDeviceUhdSettings
        include JSON::Serializable

        # If you specified Auto as the configured input, specifies which of the sources is currently active
        # (SDI or HDMI).

        @[JSON::Field(key: "activeInput")]
        getter active_input : String?

        # An array of eight audio configurations, one for each audio pair in the source. Each audio
        # configuration specifies either to exclude the pair, or to format it and include it in the output
        # from the UHD device. Applies only when the device is configured as the source for a MediaConnect
        # flow.

        @[JSON::Field(key: "audioChannelPairs")]
        getter audio_channel_pairs : Array(Types::InputDeviceUhdAudioChannelPairConfig)?

        # The codec for the video that the device produces.

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # The source at the input device that is currently active. You can specify this source.

        @[JSON::Field(key: "configuredInput")]
        getter configured_input : String?

        # The state of the input device.

        @[JSON::Field(key: "deviceState")]
        getter device_state : String?

        # The frame rate of the video source.

        @[JSON::Field(key: "framerate")]
        getter framerate : Float64?

        # The height of the video source, in pixels.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # The resolution of the Link device's source (HD or UHD). This value determines MediaLive resource
        # allocation and billing for this input.

        @[JSON::Field(key: "inputResolution")]
        getter input_resolution : String?

        # The Link device's buffer size (latency) in milliseconds (ms). You can specify this value.

        @[JSON::Field(key: "latencyMs")]
        getter latency_ms : Int32?

        # The current maximum bitrate for ingesting this source, in bits per second. You can specify this
        # maximum.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Information about the MediaConnect flow attached to the device. Returned only if the outputType is
        # MEDIACONNECT_FLOW.

        @[JSON::Field(key: "mediaconnectSettings")]
        getter mediaconnect_settings : Types::InputDeviceMediaConnectSettings?

        # The scan type of the video source.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # The width of the video source, in pixels.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @active_input : String? = nil,
          @audio_channel_pairs : Array(Types::InputDeviceUhdAudioChannelPairConfig)? = nil,
          @codec : String? = nil,
          @configured_input : String? = nil,
          @device_state : String? = nil,
          @framerate : Float64? = nil,
          @height : Int32? = nil,
          @input_resolution : String? = nil,
          @latency_ms : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @mediaconnect_settings : Types::InputDeviceMediaConnectSettings? = nil,
          @scan_type : String? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Input Location

      struct InputLocation
        include JSON::Serializable

        # Uniform Resource Identifier - This should be a path to a file accessible to the Live system (eg. a
        # http:// URI) depending on the output type. For example, a RTMP destination should have a uri simliar
        # to: "rtmp://fmsserver/live".

        @[JSON::Field(key: "uri")]
        getter uri : String

        # key used to extract the password from EC2 Parameter store

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # Username if credentials are required to access a file or publishing point. This can be either a
        # plaintext username, or a reference to an AWS parameter store name from which the username can be
        # retrieved. AWS Parameter store format: "ssm:// "

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @uri : String,
          @password_param : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Input Loss Behavior

      struct InputLossBehavior
        include JSON::Serializable

        # On input loss, the number of milliseconds to substitute black into the output before switching to
        # the frame specified by inputLossImageType. A value x, where 0 <= x <= 1,000,000 and a value of
        # 1,000,000 will be interpreted as infinite.

        @[JSON::Field(key: "blackFrameMsec")]
        getter black_frame_msec : Int32?

        # When input loss image type is "color" this field specifies the color to use. Value: 6 hex characters
        # representing the values of RGB.

        @[JSON::Field(key: "inputLossImageColor")]
        getter input_loss_image_color : String?

        # When input loss image type is "slate" these fields specify the parameters for accessing the slate.

        @[JSON::Field(key: "inputLossImageSlate")]
        getter input_loss_image_slate : Types::InputLocation?

        # Indicates whether to substitute a solid color or a slate into the output after input loss exceeds
        # blackFrameMsec.

        @[JSON::Field(key: "inputLossImageType")]
        getter input_loss_image_type : String?

        # On input loss, the number of milliseconds to repeat the previous picture before substituting black
        # into the output. A value x, where 0 <= x <= 1,000,000 and a value of 1,000,000 will be interpreted
        # as infinite.

        @[JSON::Field(key: "repeatFrameMsec")]
        getter repeat_frame_msec : Int32?

        def initialize(
          @black_frame_msec : Int32? = nil,
          @input_loss_image_color : String? = nil,
          @input_loss_image_slate : Types::InputLocation? = nil,
          @input_loss_image_type : String? = nil,
          @repeat_frame_msec : Int32? = nil
        )
        end
      end

      # MediaLive will perform a failover if content is not detected in this input for the specified period.

      struct InputLossFailoverSettings
        include JSON::Serializable

        # The amount of time (in milliseconds) that no input is detected. After that time, an input failover
        # will occur.

        @[JSON::Field(key: "inputLossThresholdMsec")]
        getter input_loss_threshold_msec : Int32?

        def initialize(
          @input_loss_threshold_msec : Int32? = nil
        )
        end
      end

      # Action to prepare an input for a future immediate input switch.

      struct InputPrepareScheduleActionSettings
        include JSON::Serializable

        # The name of the input attachment that should be prepared by this action. If no name is provided, the
        # action will stop the most recent prepare (if any) when activated.

        @[JSON::Field(key: "inputAttachmentNameReference")]
        getter input_attachment_name_reference : String?

        # Settings to let you create a clip of the file input, in order to set up the input to ingest only a
        # portion of the file.

        @[JSON::Field(key: "inputClippingSettings")]
        getter input_clipping_settings : Types::InputClippingSettings?

        # The value for the variable portion of the URL for the dynamic input, for this instance of the input.
        # Each time you use the same dynamic input in an input switch action, you can provide a different
        # value, in order to connect the input to a different content source.

        @[JSON::Field(key: "urlPath")]
        getter url_path : Array(String)?

        def initialize(
          @input_attachment_name_reference : String? = nil,
          @input_clipping_settings : Types::InputClippingSettings? = nil,
          @url_path : Array(String)? = nil
        )
        end
      end

      # A network route configuration.

      struct InputRequestDestinationRoute
        include JSON::Serializable

        # The CIDR of the route.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # An optional gateway for the route.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        def initialize(
          @cidr : String? = nil,
          @gateway : String? = nil
        )
        end
      end

      # The location of the SDP file for one of the SMPTE 2110 streams in a receiver group.

      struct InputSdpLocation
        include JSON::Serializable

        # The index of the media stream in the SDP file for one SMPTE 2110 stream.

        @[JSON::Field(key: "mediaIndex")]
        getter media_index : Int32?

        # The URL of the SDP file for one SMPTE 2110 stream.

        @[JSON::Field(key: "sdpUrl")]
        getter sdp_url : String?

        def initialize(
          @media_index : Int32? = nil,
          @sdp_url : String? = nil
        )
        end
      end

      # An Input Security Group

      struct InputSecurityGroup
        include JSON::Serializable

        # Unique ARN of Input Security Group

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Id of the Input Security Group

        @[JSON::Field(key: "id")]
        getter id : String?

        # The list of inputs currently using this Input Security Group.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(String)?

        # The current state of the Input Security Group.

        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Whitelist rules and their sync status

        @[JSON::Field(key: "whitelistRules")]
        getter whitelist_rules : Array(Types::InputWhitelistRule)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @inputs : Array(String)? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @whitelist_rules : Array(Types::InputWhitelistRule)? = nil
        )
        end
      end

      # Request of IPv4 CIDR addresses to whitelist in a security group.

      struct InputSecurityGroupWhitelistRequest
        include JSON::Serializable

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # List of IPv4 CIDR addresses to whitelist

        @[JSON::Field(key: "whitelistRules")]
        getter whitelist_rules : Array(Types::InputWhitelistRuleCidr)?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @whitelist_rules : Array(Types::InputWhitelistRuleCidr)? = nil
        )
        end
      end

      # Live Event input parameters. There can be multiple inputs in a single Live Event.

      struct InputSettings
        include JSON::Serializable

        # Used to select the audio stream to decode for inputs that have multiple available.

        @[JSON::Field(key: "audioSelectors")]
        getter audio_selectors : Array(Types::AudioSelector)?

        # Used to select the caption input to use for inputs that have multiple available.

        @[JSON::Field(key: "captionSelectors")]
        getter caption_selectors : Array(Types::CaptionSelector)?

        # Enable or disable the deblock filter when filtering.

        @[JSON::Field(key: "deblockFilter")]
        getter deblock_filter : String?

        # Enable or disable the denoise filter when filtering.

        @[JSON::Field(key: "denoiseFilter")]
        getter denoise_filter : String?

        # Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).

        @[JSON::Field(key: "filterStrength")]
        getter filter_strength : Int32?

        # Turns on the filter for this input. MPEG-2 inputs have the deblocking filter enabled by default. 1)
        # auto - filtering will be applied depending on input type/quality 2) disabled - no filtering will be
        # applied to the input 3) forced - filtering will be applied regardless of input type

        @[JSON::Field(key: "inputFilter")]
        getter input_filter : String?

        # Input settings.

        @[JSON::Field(key: "networkInputSettings")]
        getter network_input_settings : Types::NetworkInputSettings?

        # PID from which to read SCTE-35 messages. If left undefined, EML will select the first SCTE-35 PID
        # found in the input.

        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : Int32?

        # Specifies whether to extract applicable ancillary data from a SMPTE-2038 source in this input.
        # Applicable data types are captions, timecode, AFD, and SCTE-104 messages. - PREFER: Extract from
        # SMPTE-2038 if present in this input, otherwise extract from another source (if any). - IGNORE: Never
        # extract any ancillary data from SMPTE-2038.

        @[JSON::Field(key: "smpte2038DataPreference")]
        getter smpte2038_data_preference : String?

        # Loop input if it is a file. This allows a file input to be streamed indefinitely.

        @[JSON::Field(key: "sourceEndBehavior")]
        getter source_end_behavior : String?

        # Informs which video elementary stream to decode for input types that have multiple available.

        @[JSON::Field(key: "videoSelector")]
        getter video_selector : Types::VideoSelector?

        def initialize(
          @audio_selectors : Array(Types::AudioSelector)? = nil,
          @caption_selectors : Array(Types::CaptionSelector)? = nil,
          @deblock_filter : String? = nil,
          @denoise_filter : String? = nil,
          @filter_strength : Int32? = nil,
          @input_filter : String? = nil,
          @network_input_settings : Types::NetworkInputSettings? = nil,
          @scte35_pid : Int32? = nil,
          @smpte2038_data_preference : String? = nil,
          @source_end_behavior : String? = nil,
          @video_selector : Types::VideoSelector? = nil
        )
        end
      end

      # The settings for a PULL type input.

      struct InputSource
        include JSON::Serializable

        # The key used to extract the password from EC2 Parameter store.

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # This represents the customer's source URL where stream is pulled from.

        @[JSON::Field(key: "url")]
        getter url : String?

        # The username for the input source.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @password_param : String? = nil,
          @url : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Settings for for a PULL type input.

      struct InputSourceRequest
        include JSON::Serializable

        # The key used to extract the password from EC2 Parameter store.

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # This represents the customer's source URL where stream is pulled from.

        @[JSON::Field(key: "url")]
        getter url : String?

        # The username for the input source.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @password_param : String? = nil,
          @url : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct InputSpecification
        include JSON::Serializable

        # Input codec

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Maximum input bitrate, categorized coarsely

        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : String?

        # Input resolution, categorized coarsely

        @[JSON::Field(key: "resolution")]
        getter resolution : String?

        def initialize(
          @codec : String? = nil,
          @maximum_bitrate : String? = nil,
          @resolution : String? = nil
        )
        end
      end

      # Settings for the "switch input" action: to switch from ingesting one input to ingesting another
      # input.

      struct InputSwitchScheduleActionSettings
        include JSON::Serializable

        # The name of the input attachment (not the name of the input!) to switch to. The name is specified in
        # the channel configuration.

        @[JSON::Field(key: "inputAttachmentNameReference")]
        getter input_attachment_name_reference : String

        # Settings to let you create a clip of the file input, in order to set up the input to ingest only a
        # portion of the file.

        @[JSON::Field(key: "inputClippingSettings")]
        getter input_clipping_settings : Types::InputClippingSettings?

        # The value for the variable portion of the URL for the dynamic input, for this instance of the input.
        # Each time you use the same dynamic input in an input switch action, you can provide a different
        # value, in order to connect the input to a different content source.

        @[JSON::Field(key: "urlPath")]
        getter url_path : Array(String)?

        def initialize(
          @input_attachment_name_reference : String,
          @input_clipping_settings : Types::InputClippingSettings? = nil,
          @url_path : Array(String)? = nil
        )
        end
      end

      # Settings for a private VPC Input. When this property is specified, the input destination addresses
      # will be created in a VPC rather than with public Internet addresses. This property requires setting
      # the roleArn property on Input creation. Not compatible with the inputSecurityGroups property.

      struct InputVpcRequest
        include JSON::Serializable

        # A list of 2 VPC subnet IDs from the same VPC. Subnet IDs must be mapped to two unique availability
        # zones (AZ).

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC network interfaces. Requires
        # subnetIds. If none are specified then the VPC default security group will be used.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # Whitelist rule

      struct InputWhitelistRule
        include JSON::Serializable

        # The IPv4 CIDR that's whitelisted.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # An IPv4 CIDR to whitelist.

      struct InputWhitelistRuleCidr
        include JSON::Serializable

        # The IPv4 CIDR to whitelist.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # Used in ClusterNetworkSettings

      struct InterfaceMapping
        include JSON::Serializable

        # The logical name for one interface (on every Node) that handles a specific type of traffic. We
        # recommend that the name hints at the physical interface it applies to. For example, it could refer
        # to the traffic that the physical interface handles. For example, my-Inputs-Interface.

        @[JSON::Field(key: "logicalInterfaceName")]
        getter logical_interface_name : String?

        # The ID of the network that you want to connect to the specified logicalInterfaceName.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        def initialize(
          @logical_interface_name : String? = nil,
          @network_id : String? = nil
        )
        end
      end

      # Used in ClusterNetworkSettingsCreateRequest.

      struct InterfaceMappingCreateRequest
        include JSON::Serializable

        # The logical name for one interface (on every Node) that handles a specific type of traffic. We
        # recommend that the name hints at the physical interface it applies to. For example, it could refer
        # to the traffic that the physical interface handles. For example, my-Inputs-Interface.

        @[JSON::Field(key: "logicalInterfaceName")]
        getter logical_interface_name : String?

        # The ID of the network that you want to connect to the specified logicalInterfaceName.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        def initialize(
          @logical_interface_name : String? = nil,
          @network_id : String? = nil
        )
        end
      end


      struct InterfaceMappingUpdateRequest
        include JSON::Serializable

        # The logical name for one interface (on every Node) that handles a specific type of traffic. We
        # recommend that the name hints at the physical interface it applies to. For example, it could refer
        # to the traffic that the physical interface handles. For example, my-Inputs-Interface.

        @[JSON::Field(key: "logicalInterfaceName")]
        getter logical_interface_name : String?

        # The ID of the network that you want to connect to the specified logicalInterfaceName. You can use
        # the ListNetworks operation to discover all the IDs.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        def initialize(
          @logical_interface_name : String? = nil,
          @network_id : String? = nil
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

      # Unexpected error during processing of request.

      struct InternalServerErrorExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InternalServiceError
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvalidRequest
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Used in DescribeNetworkResult, DescribeNetworkSummary, UpdateNetworkResult.

      struct IpPool
        include JSON::Serializable

        # A CIDR block of IP addresses that are reserved for MediaLive Anywhere.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # Used in CreateNetworkRequest.

      struct IpPoolCreateRequest
        include JSON::Serializable

        # A CIDR block of IP addresses to reserve for MediaLive Anywhere.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # Used in UpdateNetworkRequest.

      struct IpPoolUpdateRequest
        include JSON::Serializable

        # A CIDR block of IP addresses to reserve for MediaLive Anywhere.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # Key Provider Settings

      struct KeyProviderSettings
        include JSON::Serializable


        @[JSON::Field(key: "staticKeySettings")]
        getter static_key_settings : Types::StaticKeySettings?

        def initialize(
          @static_key_settings : Types::StaticKeySettings? = nil
        )
        end
      end


      struct LimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration for linked channel relationships

      struct LinkedChannelSettings
        include JSON::Serializable


        @[JSON::Field(key: "followerChannelSettings")]
        getter follower_channel_settings : Types::FollowerChannelSettings?


        @[JSON::Field(key: "primaryChannelSettings")]
        getter primary_channel_settings : Types::PrimaryChannelSettings?

        def initialize(
          @follower_channel_settings : Types::FollowerChannelSettings? = nil,
          @primary_channel_settings : Types::PrimaryChannelSettings? = nil
        )
        end
      end


      struct ListAlertsRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "stateFilter")]
        getter state_filter : String?

        def initialize(
          @channel_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_filter : String? = nil
        )
        end
      end


      struct ListAlertsResponse
        include JSON::Serializable


        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::ChannelAlert)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::ChannelAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListAlerts request

      struct ListAlertsResultModel
        include JSON::Serializable

        # The alerts found for this channel

        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::ChannelAlert)?

        # The token to use to retrieve the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::ChannelAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelPlacementGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelPlacementGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(Types::DescribeChannelPlacementGroupSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_placement_groups : Array(Types::DescribeChannelPlacementGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the response for ListChannelPlacementGroups.

      struct ListChannelPlacementGroupsResult
        include JSON::Serializable

        # An array of ChannelPlacementGroups that exist in the Cluster.

        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(Types::DescribeChannelPlacementGroupSummary)?

        # Token for the next result.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_placement_groups : Array(Types::DescribeChannelPlacementGroupSummary)? = nil,
          @next_token : String? = nil
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
        getter channels : Array(Types::ChannelSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsResultModel
        include JSON::Serializable


        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::ChannelSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplateGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "scope")]
        getter scope : String?


        @[JSON::Field(key: "signalMapIdentifier")]
        getter signal_map_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scope : String? = nil,
          @signal_map_identifier : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplateGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroups")]
        getter cloud_watch_alarm_template_groups : Array(Types::CloudWatchAlarmTemplateGroupSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cloud_watch_alarm_template_groups : Array(Types::CloudWatchAlarmTemplateGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplateGroupsResponseContent
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroups")]
        getter cloud_watch_alarm_template_groups : Array(Types::CloudWatchAlarmTemplateGroupSummary)

        # A token used to retrieve the next set of results in paginated list responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cloud_watch_alarm_template_groups : Array(Types::CloudWatchAlarmTemplateGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplatesRequest
        include JSON::Serializable


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "scope")]
        getter scope : String?


        @[JSON::Field(key: "signalMapIdentifier")]
        getter signal_map_identifier : String?

        def initialize(
          @group_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scope : String? = nil,
          @signal_map_identifier : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplatesResponse
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplates")]
        getter cloud_watch_alarm_templates : Array(Types::CloudWatchAlarmTemplateSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cloud_watch_alarm_templates : Array(Types::CloudWatchAlarmTemplateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCloudWatchAlarmTemplatesResponseContent
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplates")]
        getter cloud_watch_alarm_templates : Array(Types::CloudWatchAlarmTemplateSummary)

        # A token used to retrieve the next set of results in paginated list responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cloud_watch_alarm_templates : Array(Types::CloudWatchAlarmTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListClusterAlertsRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "stateFilter")]
        getter state_filter : String?

        def initialize(
          @cluster_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_filter : String? = nil
        )
        end
      end


      struct ListClusterAlertsResponse
        include JSON::Serializable


        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::ClusterAlert)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::ClusterAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListClusterAlerts request

      struct ListClusterAlertsResultModel
        include JSON::Serializable

        # The alerts found for this cluster

        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::ClusterAlert)?

        # The token to use to retrieve the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::ClusterAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersRequest
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


      struct ListClustersResponse
        include JSON::Serializable


        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::DescribeClusterSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::DescribeClusterSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the response for ListClusters.

      struct ListClustersResult
        include JSON::Serializable

        # A list of the Clusters that exist in your AWS account.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::DescribeClusterSummary)?

        # Token for the next result.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::DescribeClusterSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplateGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "signalMapIdentifier")]
        getter signal_map_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signal_map_identifier : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplateGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "eventBridgeRuleTemplateGroups")]
        getter event_bridge_rule_template_groups : Array(Types::EventBridgeRuleTemplateGroupSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_bridge_rule_template_groups : Array(Types::EventBridgeRuleTemplateGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplateGroupsResponseContent
        include JSON::Serializable


        @[JSON::Field(key: "eventBridgeRuleTemplateGroups")]
        getter event_bridge_rule_template_groups : Array(Types::EventBridgeRuleTemplateGroupSummary)

        # A token used to retrieve the next set of results in paginated list responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_bridge_rule_template_groups : Array(Types::EventBridgeRuleTemplateGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplatesRequest
        include JSON::Serializable


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "signalMapIdentifier")]
        getter signal_map_identifier : String?

        def initialize(
          @group_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signal_map_identifier : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplatesResponse
        include JSON::Serializable


        @[JSON::Field(key: "eventBridgeRuleTemplates")]
        getter event_bridge_rule_templates : Array(Types::EventBridgeRuleTemplateSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_bridge_rule_templates : Array(Types::EventBridgeRuleTemplateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBridgeRuleTemplatesResponseContent
        include JSON::Serializable


        @[JSON::Field(key: "eventBridgeRuleTemplates")]
        getter event_bridge_rule_templates : Array(Types::EventBridgeRuleTemplateSummary)

        # A token used to retrieve the next set of results in paginated list responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_bridge_rule_templates : Array(Types::EventBridgeRuleTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListInputDeviceTransfersRequest
        include JSON::Serializable


        @[JSON::Field(key: "transferType")]
        getter transfer_type : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @transfer_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInputDeviceTransfersResponse
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceTransfers")]
        getter input_device_transfers : Array(Types::TransferringInputDeviceSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_device_transfers : Array(Types::TransferringInputDeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The list of input devices in the transferred state. The recipient hasn't yet accepted or rejected
      # the transfer.

      struct ListInputDeviceTransfersResultModel
        include JSON::Serializable

        # The list of devices that you are transferring or are being transferred to you.

        @[JSON::Field(key: "inputDeviceTransfers")]
        getter input_device_transfers : Array(Types::TransferringInputDeviceSummary)?

        # A token to get additional list results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_device_transfers : Array(Types::TransferringInputDeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInputDevicesRequest
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


      struct ListInputDevicesResponse
        include JSON::Serializable


        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_devices : Array(Types::InputDeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The list of input devices owned by the AWS account.

      struct ListInputDevicesResultModel
        include JSON::Serializable

        # The list of input devices.

        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceSummary)?

        # A token to get additional list results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_devices : Array(Types::InputDeviceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInputSecurityGroupsRequest
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


      struct ListInputSecurityGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(Types::InputSecurityGroup)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_security_groups : Array(Types::InputSecurityGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Result of input security group list request

      struct ListInputSecurityGroupsResultModel
        include JSON::Serializable

        # List of input security groups

        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(Types::InputSecurityGroup)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @input_security_groups : Array(Types::InputSecurityGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInputsRequest
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


      struct ListInputsResponse
        include JSON::Serializable


        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::Input)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @inputs : Array(Types::Input)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInputsResultModel
        include JSON::Serializable


        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::Input)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @inputs : Array(Types::Input)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexAlertsRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "stateFilter")]
        getter state_filter : String?

        def initialize(
          @multiplex_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_filter : String? = nil
        )
        end
      end


      struct ListMultiplexAlertsResponse
        include JSON::Serializable


        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::MultiplexAlert)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::MultiplexAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListMultiplexAlerts request.

      struct ListMultiplexAlertsResultModel
        include JSON::Serializable

        # The alerts found for this multiplex

        @[JSON::Field(key: "alerts")]
        getter alerts : Array(Types::MultiplexAlert)?

        # The token to use to retrieve the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alerts : Array(Types::MultiplexAlert)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexProgramsRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @multiplex_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexProgramsResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplexPrograms")]
        getter multiplex_programs : Array(Types::MultiplexProgramSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @multiplex_programs : Array(Types::MultiplexProgramSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexProgramsResultModel
        include JSON::Serializable

        # List of multiplex programs.

        @[JSON::Field(key: "multiplexPrograms")]
        getter multiplex_programs : Array(Types::MultiplexProgramSummary)?

        # Token for the next ListMultiplexProgram request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @multiplex_programs : Array(Types::MultiplexProgramSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexesRequest
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


      struct ListMultiplexesResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplexes")]
        getter multiplexes : Array(Types::MultiplexSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @multiplexes : Array(Types::MultiplexSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiplexesResultModel
        include JSON::Serializable

        # List of multiplexes.

        @[JSON::Field(key: "multiplexes")]
        getter multiplexes : Array(Types::MultiplexSummary)?

        # Token for the next ListMultiplexes request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @multiplexes : Array(Types::MultiplexSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNetworksRequest
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


      struct ListNetworksResponse
        include JSON::Serializable


        @[JSON::Field(key: "networks")]
        getter networks : Array(Types::DescribeNetworkSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @networks : Array(Types::DescribeNetworkSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the response for ListNetworks

      struct ListNetworksResult
        include JSON::Serializable

        # An array of networks that you have created.

        @[JSON::Field(key: "networks")]
        getter networks : Array(Types::DescribeNetworkSummary)?

        # Token for the next ListNetworks request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @networks : Array(Types::DescribeNetworkSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNodesRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNodesResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::DescribeNodeSummary)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::DescribeNodeSummary)? = nil
        )
        end
      end

      # Contains the response for ListNodes.

      struct ListNodesResult
        include JSON::Serializable

        # Token for the next result.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of Nodes that exist in the Cluster.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::DescribeNodeSummary)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::DescribeNodeSummary)? = nil
        )
        end
      end


      struct ListOfferingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelConfiguration")]
        getter channel_configuration : String?


        @[JSON::Field(key: "codec")]
        getter codec : String?


        @[JSON::Field(key: "duration")]
        getter duration : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : String?


        @[JSON::Field(key: "maximumFramerate")]
        getter maximum_framerate : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resolution")]
        getter resolution : String?


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "specialFeature")]
        getter special_feature : String?


        @[JSON::Field(key: "videoQuality")]
        getter video_quality : String?

        def initialize(
          @channel_class : String? = nil,
          @channel_configuration : String? = nil,
          @codec : String? = nil,
          @duration : String? = nil,
          @max_results : Int32? = nil,
          @maximum_bitrate : String? = nil,
          @maximum_framerate : String? = nil,
          @next_token : String? = nil,
          @resolution : String? = nil,
          @resource_type : String? = nil,
          @special_feature : String? = nil,
          @video_quality : String? = nil
        )
        end
      end


      struct ListOfferingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "offerings")]
        getter offerings : Array(Types::Offering)?

        def initialize(
          @next_token : String? = nil,
          @offerings : Array(Types::Offering)? = nil
        )
        end
      end

      # ListOfferings response

      struct ListOfferingsResultModel
        include JSON::Serializable

        # Token to retrieve the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of offerings

        @[JSON::Field(key: "offerings")]
        getter offerings : Array(Types::Offering)?

        def initialize(
          @next_token : String? = nil,
          @offerings : Array(Types::Offering)? = nil
        )
        end
      end


      struct ListReservationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "codec")]
        getter codec : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : String?


        @[JSON::Field(key: "maximumFramerate")]
        getter maximum_framerate : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resolution")]
        getter resolution : String?


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "specialFeature")]
        getter special_feature : String?


        @[JSON::Field(key: "videoQuality")]
        getter video_quality : String?

        def initialize(
          @channel_class : String? = nil,
          @codec : String? = nil,
          @max_results : Int32? = nil,
          @maximum_bitrate : String? = nil,
          @maximum_framerate : String? = nil,
          @next_token : String? = nil,
          @resolution : String? = nil,
          @resource_type : String? = nil,
          @special_feature : String? = nil,
          @video_quality : String? = nil
        )
        end
      end


      struct ListReservationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "reservations")]
        getter reservations : Array(Types::Reservation)?

        def initialize(
          @next_token : String? = nil,
          @reservations : Array(Types::Reservation)? = nil
        )
        end
      end

      # ListReservations response

      struct ListReservationsResultModel
        include JSON::Serializable

        # Token to retrieve the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of reservations

        @[JSON::Field(key: "reservations")]
        getter reservations : Array(Types::Reservation)?

        def initialize(
          @next_token : String? = nil,
          @reservations : Array(Types::Reservation)? = nil
        )
        end
      end


      struct ListSdiSourcesRequest
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

      # Response for the ListSdiSources operation.

      struct ListSdiSourcesResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(Types::SdiSourceSummary)?

        def initialize(
          @next_token : String? = nil,
          @sdi_sources : Array(Types::SdiSourceSummary)? = nil
        )
        end
      end


      struct ListSignalMapsRequest
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIdentifier")]
        getter cloud_watch_alarm_template_group_identifier : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIdentifier")]
        getter event_bridge_rule_template_group_identifier : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cloud_watch_alarm_template_group_identifier : String? = nil,
          @event_bridge_rule_template_group_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSignalMapsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "signalMaps")]
        getter signal_maps : Array(Types::SignalMapSummary)?

        def initialize(
          @next_token : String? = nil,
          @signal_maps : Array(Types::SignalMapSummary)? = nil
        )
        end
      end


      struct ListSignalMapsResponseContent
        include JSON::Serializable


        @[JSON::Field(key: "signalMaps")]
        getter signal_maps : Array(Types::SignalMapSummary)

        # A token used to retrieve the next set of results in paginated list responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @signal_maps : Array(Types::SignalMapSummary),
          @next_token : String? = nil
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


      struct ListVersionsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct ListVersionsResponse
        include JSON::Serializable

        # List of engine versions that are available for this AWS account.

        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::ChannelEngineVersionResponse)?

        def initialize(
          @versions : Array(Types::ChannelEngineVersionResponse)? = nil
        )
        end
      end

      # M2ts Settings

      struct M2tsSettings
        include JSON::Serializable

        # When set to drop, output audio streams will be removed from the program if the selected input audio
        # stream is removed from the input. This allows the output audio configuration to dynamically change
        # based on input configuration. If this is set to encodeSilence, all output audio streams will output
        # encoded silence when not connected to an active input stream.

        @[JSON::Field(key: "absentInputAudioBehavior")]
        getter absent_input_audio_behavior : String?

        # When set to enabled, uses ARIB-compliant field muxing and removes video descriptor.

        @[JSON::Field(key: "arib")]
        getter arib : String?

        # Packet Identifier (PID) for ARIB Captions in the transport stream. Can be entered as a decimal or
        # hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "aribCaptionsPid")]
        getter arib_captions_pid : String?

        # If set to auto, pid number used for ARIB Captions will be auto-selected from unused pids. If set to
        # useConfigured, ARIB Captions will be on the configured pid number.

        @[JSON::Field(key: "aribCaptionsPidControl")]
        getter arib_captions_pid_control : String?

        # When set to dvb, uses DVB buffer model for Dolby Digital audio. When set to atsc, the ATSC model is
        # used.

        @[JSON::Field(key: "audioBufferModel")]
        getter audio_buffer_model : String?

        # The number of audio frames to insert for each PES packet.

        @[JSON::Field(key: "audioFramesPerPes")]
        getter audio_frames_per_pes : Int32?

        # Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values
        # are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or
        # hexadecimal values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "audioPids")]
        getter audio_pids : String?

        # When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for EAC3. When set to dvb,
        # uses stream type = 0x06.

        @[JSON::Field(key: "audioStreamType")]
        getter audio_stream_type : String?

        # The output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer
        # automatically determine the appropriate bitrate.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Controls the timing accuracy for output network traffic. Leave as MULTIPLEX to ensure accurate
        # network packet timing. Or set to NONE, which might result in lower latency but will result in more
        # variability in output network packet timing. This variability might cause interruptions, jitter, or
        # bursty behavior in your playback or receiving devices.

        @[JSON::Field(key: "bufferModel")]
        getter buffer_model : String?

        # When set to enabled, generates captionServiceDescriptor in PMT.

        @[JSON::Field(key: "ccDescriptor")]
        getter cc_descriptor : String?

        # Inserts DVB Network Information Table (NIT) at the specified table repetition interval.

        @[JSON::Field(key: "dvbNitSettings")]
        getter dvb_nit_settings : Types::DvbNitSettings?

        # Inserts DVB Service Description Table (SDT) at the specified table repetition interval.

        @[JSON::Field(key: "dvbSdtSettings")]
        getter dvb_sdt_settings : Types::DvbSdtSettings?

        # Packet Identifier (PID) for input source DVB Subtitle data to this output. Multiple values are
        # accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or
        # hexadecimal values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "dvbSubPids")]
        getter dvb_sub_pids : String?

        # Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.

        @[JSON::Field(key: "dvbTdtSettings")]
        getter dvb_tdt_settings : Types::DvbTdtSettings?

        # Packet Identifier (PID) for input source DVB Teletext data to this output. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "dvbTeletextPid")]
        getter dvb_teletext_pid : String?

        # If set to passthrough, passes any EBIF data from the input source to this output.

        @[JSON::Field(key: "ebif")]
        getter ebif : String?

        # When videoAndFixedIntervals is selected, audio EBP markers will be added to partitions 3 and 4. The
        # interval between these additional markers will be fixed, and will be slightly shorter than the video
        # EBP marker interval. Only available when EBP Cablelabs segmentation markers are selected. Partitions
        # 1 and 2 will always follow the video interval.

        @[JSON::Field(key: "ebpAudioInterval")]
        getter ebp_audio_interval : String?

        # When set, enforces that Encoder Boundary Points do not come within the specified time interval of
        # each other by looking ahead at input video. If another EBP is going to come in within the specified
        # time interval, the current EBP is not emitted, and the segment is "stretched" to the next marker.
        # The lookahead value does not add latency to the system. The Live Event must be configured elsewhere
        # to create sufficient latency to make the lookahead accurate.

        @[JSON::Field(key: "ebpLookaheadMs")]
        getter ebp_lookahead_ms : Int32?

        # Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP markers will be placed on
        # the video PID and all audio PIDs. If set to videoPid, EBP markers will be placed on only the video
        # PID.

        @[JSON::Field(key: "ebpPlacement")]
        getter ebp_placement : String?

        # This field is unused and deprecated.

        @[JSON::Field(key: "ecmPid")]
        getter ecm_pid : String?

        # Include or exclude the ES Rate field in the PES header.

        @[JSON::Field(key: "esRateInPes")]
        getter es_rate_in_pes : String?

        # Packet Identifier (PID) for input source ETV Platform data to this output. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "etvPlatformPid")]
        getter etv_platform_pid : String?

        # Packet Identifier (PID) for input source ETV Signal data to this output. Can be entered as a decimal
        # or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "etvSignalPid")]
        getter etv_signal_pid : String?

        # The length in seconds of each fragment. Only used with EBP markers.

        @[JSON::Field(key: "fragmentTime")]
        getter fragment_time : Float64?

        # If set to passthrough, passes any KLV data from the input source to this output.

        @[JSON::Field(key: "klv")]
        getter klv : String?

        # Packet Identifier (PID) for input source KLV data to this output. Multiple values are accepted, and
        # can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal
        # values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "klvDataPids")]
        getter klv_data_pids : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # Value in bits per second of extra null packets to insert into the transport stream. This can be used
        # if a downstream encryption system requires periodic null packets.

        @[JSON::Field(key: "nullPacketBitrate")]
        getter null_packet_bitrate : Float64?

        # The number of milliseconds between instances of this table in the output transport stream. Valid
        # values are 0, 10..1000.

        @[JSON::Field(key: "patInterval")]
        getter pat_interval : Int32?

        # When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized
        # Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the
        # video or audio elementary stream.

        @[JSON::Field(key: "pcrControl")]
        getter pcr_control : String?

        # Maximum time in milliseconds between Program Clock Reference (PCRs) inserted into the transport
        # stream.

        @[JSON::Field(key: "pcrPeriod")]
        getter pcr_period : Int32?

        # Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value
        # is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or
        # hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : String?

        # The number of milliseconds between instances of this table in the output transport stream. Valid
        # values are 0, 10..1000.

        @[JSON::Field(key: "pmtInterval")]
        getter pmt_interval : Int32?

        # Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "pmtPid")]
        getter pmt_pid : String?

        # The value of the program number field in the Program Map Table.

        @[JSON::Field(key: "programNum")]
        getter program_num : Int32?

        # When vbr, does not insert null packets into transport stream to fill specified bitrate. The bitrate
        # setting acts as the maximum bitrate when vbr is set.

        @[JSON::Field(key: "rateMode")]
        getter rate_mode : String?

        # Packet Identifier (PID) for input source SCTE-27 data to this output. Multiple values are accepted,
        # and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal
        # values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "scte27Pids")]
        getter scte27_pids : String?

        # Optionally pass SCTE-35 signals from the input source to this output.

        @[JSON::Field(key: "scte35Control")]
        getter scte35_control : String?

        # Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal
        # or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : String?

        # Defines the amount SCTE-35 preroll will be increased (in milliseconds) on the output. Preroll is the
        # amount of time between the presence of a SCTE-35 indication in a transport stream and the PTS of the
        # video frame it references. Zero means don't add pullup (it doesn't mean set the preroll to zero).
        # Negative pullup is not supported, which means that you can't make the preroll shorter. Be aware that
        # latency in the output will increase by the pullup amount.

        @[JSON::Field(key: "scte35PrerollPullupMilliseconds")]
        getter scte35_preroll_pullup_milliseconds : Float64?

        # Inserts segmentation markers at each segmentationTime period. raiSegstart sets the Random Access
        # Indicator bit in the adaptation field. raiAdapt sets the RAI bit and adds the current timecode in
        # the private data bytes. psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds
        # Encoder Boundary Point information to the adaptation field as per OpenCable specification
        # OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point information to the adaptation field
        # using a legacy proprietary format.

        @[JSON::Field(key: "segmentationMarkers")]
        getter segmentation_markers : String?

        # The segmentation style parameter controls how segmentation markers are inserted into the transport
        # stream. With avails, it is possible that segments may be truncated, which can influence where future
        # segmentation markers are inserted. When a segmentation style of "resetCadence" is selected and a
        # segment is truncated due to an avail, we will reset the segmentation cadence. This means the
        # subsequent segment will have a duration of $segmentationTime seconds. When a segmentation style of
        # "maintainCadence" is selected and a segment is truncated due to an avail, we will not reset the
        # segmentation cadence. This means the subsequent segment will likely be truncated as well. However,
        # all segments after that will have a duration of $segmentationTime seconds. Note that EBP lookahead
        # is a slight exception to this rule.

        @[JSON::Field(key: "segmentationStyle")]
        getter segmentation_style : String?

        # The length in seconds of each segment. Required unless markers is set to _none_.

        @[JSON::Field(key: "segmentationTime")]
        getter segmentation_time : Float64?

        # When set to passthrough, timed metadata will be passed through from input to output.

        @[JSON::Field(key: "timedMetadataBehavior")]
        getter timed_metadata_behavior : String?

        # Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "timedMetadataPid")]
        getter timed_metadata_pid : String?

        # The value of the transport stream ID field in the Program Map Table.

        @[JSON::Field(key: "transportStreamId")]
        getter transport_stream_id : Int32?

        # Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "videoPid")]
        getter video_pid : String?

        def initialize(
          @absent_input_audio_behavior : String? = nil,
          @arib : String? = nil,
          @arib_captions_pid : String? = nil,
          @arib_captions_pid_control : String? = nil,
          @audio_buffer_model : String? = nil,
          @audio_frames_per_pes : Int32? = nil,
          @audio_pids : String? = nil,
          @audio_stream_type : String? = nil,
          @bitrate : Int32? = nil,
          @buffer_model : String? = nil,
          @cc_descriptor : String? = nil,
          @dvb_nit_settings : Types::DvbNitSettings? = nil,
          @dvb_sdt_settings : Types::DvbSdtSettings? = nil,
          @dvb_sub_pids : String? = nil,
          @dvb_tdt_settings : Types::DvbTdtSettings? = nil,
          @dvb_teletext_pid : String? = nil,
          @ebif : String? = nil,
          @ebp_audio_interval : String? = nil,
          @ebp_lookahead_ms : Int32? = nil,
          @ebp_placement : String? = nil,
          @ecm_pid : String? = nil,
          @es_rate_in_pes : String? = nil,
          @etv_platform_pid : String? = nil,
          @etv_signal_pid : String? = nil,
          @fragment_time : Float64? = nil,
          @klv : String? = nil,
          @klv_data_pids : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @null_packet_bitrate : Float64? = nil,
          @pat_interval : Int32? = nil,
          @pcr_control : String? = nil,
          @pcr_period : Int32? = nil,
          @pcr_pid : String? = nil,
          @pmt_interval : Int32? = nil,
          @pmt_pid : String? = nil,
          @program_num : Int32? = nil,
          @rate_mode : String? = nil,
          @scte27_pids : String? = nil,
          @scte35_control : String? = nil,
          @scte35_pid : String? = nil,
          @scte35_preroll_pullup_milliseconds : Float64? = nil,
          @segmentation_markers : String? = nil,
          @segmentation_style : String? = nil,
          @segmentation_time : Float64? = nil,
          @timed_metadata_behavior : String? = nil,
          @timed_metadata_pid : String? = nil,
          @transport_stream_id : Int32? = nil,
          @video_pid : String? = nil
        )
        end
      end

      # Settings information for the .m3u8 container

      struct M3u8Settings
        include JSON::Serializable

        # The number of audio frames to insert for each PES packet.

        @[JSON::Field(key: "audioFramesPerPes")]
        getter audio_frames_per_pes : Int32?

        # Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values
        # are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or
        # hexadecimal values.

        @[JSON::Field(key: "audioPids")]
        getter audio_pids : String?

        # This parameter is unused and deprecated.

        @[JSON::Field(key: "ecmPid")]
        getter ecm_pid : String?

        # If set to passthrough, passes any KLV data from the input source to this output.

        @[JSON::Field(key: "klvBehavior")]
        getter klv_behavior : String?

        # Packet Identifier (PID) for input source KLV data to this output. Multiple values are accepted, and
        # can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal
        # values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "klvDataPids")]
        getter klv_data_pids : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # The number of milliseconds between instances of this table in the output transport stream. A value
        # of \"0\" writes out the PMT once per segment file.

        @[JSON::Field(key: "patInterval")]
        getter pat_interval : Int32?

        # When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized
        # Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the
        # video or audio elementary stream.

        @[JSON::Field(key: "pcrControl")]
        getter pcr_control : String?

        # Maximum time in milliseconds between Program Clock References (PCRs) inserted into the transport
        # stream.

        @[JSON::Field(key: "pcrPeriod")]
        getter pcr_period : Int32?

        # Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value
        # is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or
        # hexadecimal value.

        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : String?

        # The number of milliseconds between instances of this table in the output transport stream. A value
        # of \"0\" writes out the PMT once per segment file.

        @[JSON::Field(key: "pmtInterval")]
        getter pmt_interval : Int32?

        # Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a
        # decimal or hexadecimal value.

        @[JSON::Field(key: "pmtPid")]
        getter pmt_pid : String?

        # The value of the program number field in the Program Map Table.

        @[JSON::Field(key: "programNum")]
        getter program_num : Int32?

        # If set to passthrough, passes any SCTE-35 signals from the input source to this output.

        @[JSON::Field(key: "scte35Behavior")]
        getter scte35_behavior : String?

        # Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal
        # or hexadecimal value.

        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : String?

        # Set to PASSTHROUGH to enable ID3 metadata insertion. To include metadata, you configure other
        # parameters in the output group or individual outputs, or you add an ID3 action to the channel
        # schedule.

        @[JSON::Field(key: "timedMetadataBehavior")]
        getter timed_metadata_behavior : String?

        # Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a
        # decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).

        @[JSON::Field(key: "timedMetadataPid")]
        getter timed_metadata_pid : String?

        # The value of the transport stream ID field in the Program Map Table.

        @[JSON::Field(key: "transportStreamId")]
        getter transport_stream_id : Int32?

        # Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a
        # decimal or hexadecimal value.

        @[JSON::Field(key: "videoPid")]
        getter video_pid : String?

        def initialize(
          @audio_frames_per_pes : Int32? = nil,
          @audio_pids : String? = nil,
          @ecm_pid : String? = nil,
          @klv_behavior : String? = nil,
          @klv_data_pids : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @pat_interval : Int32? = nil,
          @pcr_control : String? = nil,
          @pcr_period : Int32? = nil,
          @pcr_pid : String? = nil,
          @pmt_interval : Int32? = nil,
          @pmt_pid : String? = nil,
          @program_num : Int32? = nil,
          @scte35_behavior : String? = nil,
          @scte35_pid : String? = nil,
          @timed_metadata_behavior : String? = nil,
          @timed_metadata_pid : String? = nil,
          @transport_stream_id : Int32? = nil,
          @video_pid : String? = nil
        )
        end
      end


      struct MaintenanceCreateSettings
        include JSON::Serializable

        # Choose one day of the week for maintenance. The chosen day is used for all future maintenance
        # windows.

        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String?

        # Choose the hour that maintenance will start. The chosen time is used for all future maintenance
        # windows.

        @[JSON::Field(key: "maintenanceStartTime")]
        getter maintenance_start_time : String?

        def initialize(
          @maintenance_day : String? = nil,
          @maintenance_start_time : String? = nil
        )
        end
      end


      struct MaintenanceStatus
        include JSON::Serializable

        # The currently selected maintenance day.

        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String?

        # Maintenance is required by the displayed date and time. Date and time is in ISO.

        @[JSON::Field(key: "maintenanceDeadline")]
        getter maintenance_deadline : String?

        # The currently scheduled maintenance date and time. Date and time is in ISO.

        @[JSON::Field(key: "maintenanceScheduledDate")]
        getter maintenance_scheduled_date : String?

        # The currently selected maintenance start time. Time is in UTC.

        @[JSON::Field(key: "maintenanceStartTime")]
        getter maintenance_start_time : String?

        def initialize(
          @maintenance_day : String? = nil,
          @maintenance_deadline : String? = nil,
          @maintenance_scheduled_date : String? = nil,
          @maintenance_start_time : String? = nil
        )
        end
      end


      struct MaintenanceUpdateSettings
        include JSON::Serializable

        # Choose one day of the week for maintenance. The chosen day is used for all future maintenance
        # windows.

        @[JSON::Field(key: "maintenanceDay")]
        getter maintenance_day : String?

        # Choose a specific date for maintenance to occur. The chosen date is used for the next maintenance
        # window only.

        @[JSON::Field(key: "maintenanceScheduledDate")]
        getter maintenance_scheduled_date : String?

        # Choose the hour that maintenance will start. The chosen time is used for all future maintenance
        # windows.

        @[JSON::Field(key: "maintenanceStartTime")]
        getter maintenance_start_time : String?

        def initialize(
          @maintenance_day : String? = nil,
          @maintenance_scheduled_date : String? = nil,
          @maintenance_start_time : String? = nil
        )
        end
      end

      # The settings for a MediaConnect Flow.

      struct MediaConnectFlow
        include JSON::Serializable

        # The unique ARN of the MediaConnect Flow being used as a source.

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        def initialize(
          @flow_arn : String? = nil
        )
        end
      end

      # The settings for a MediaConnect Flow.

      struct MediaConnectFlowRequest
        include JSON::Serializable

        # The ARN of the MediaConnect Flow that you want to use as a source.

        @[JSON::Field(key: "flowArn")]
        getter flow_arn : String?

        def initialize(
          @flow_arn : String? = nil
        )
        end
      end

      # Additional output destinations for a CMAF Ingest output group

      struct MediaPackageAdditionalDestinations
        include JSON::Serializable

        # The destination location

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        def initialize(
          @destination : Types::OutputLocationRef
        )
        end
      end

      # Media Package Group Settings

      struct MediaPackageGroupSettings
        include JSON::Serializable

        # MediaPackage channel destination.

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # Parameters that apply only if the destination parameter (for the output group) specifies a
        # channelGroup and channelName. Use of these two paramters indicates that the output group is for
        # MediaPackage V2 (CMAF Ingest).

        @[JSON::Field(key: "mediapackageV2GroupSettings")]
        getter mediapackage_v2_group_settings : Types::MediaPackageV2GroupSettings?

        def initialize(
          @destination : Types::OutputLocationRef,
          @mediapackage_v2_group_settings : Types::MediaPackageV2GroupSettings? = nil
        )
        end
      end

      # MediaPackage Output Destination Settings

      struct MediaPackageOutputDestinationSettings
        include JSON::Serializable

        # Endpoint 1 or 2 of the channel in MediaPackageV2. Only use if you are sending CMAF Ingest output to
        # a CMAF ingest endpoint on a MediaPackage channel that uses MediaPackage v2.

        @[JSON::Field(key: "channelEndpointId")]
        getter channel_endpoint_id : String?

        # Name of the channel group in MediaPackageV2. Only use if you are sending CMAF Ingest output to a
        # CMAF ingest endpoint on a MediaPackage channel that uses MediaPackage v2.

        @[JSON::Field(key: "channelGroup")]
        getter channel_group : String?

        # ID of the channel in MediaPackage that is the destination for this output group. You do not need to
        # specify the individual inputs in MediaPackage; MediaLive will handle the connection of the two
        # MediaLive pipelines to the two MediaPackage inputs. The MediaPackage channel and MediaLive channel
        # must be in the same region.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?

        # Name of the channel in MediaPackageV2. Only use if you are sending CMAF Ingest output to a CMAF
        # ingest endpoint on a MediaPackage channel that uses MediaPackage v2.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # Region the channel group and channel are located in for MediaPackageV2. Only use if you are sending
        # CMAF Ingest output to a CMAF ingest endpoint on a MediaPackage channel that uses MediaPackage v2.

        @[JSON::Field(key: "mediaPackageRegionName")]
        getter media_package_region_name : String?

        def initialize(
          @channel_endpoint_id : String? = nil,
          @channel_group : String? = nil,
          @channel_id : String? = nil,
          @channel_name : String? = nil,
          @media_package_region_name : String? = nil
        )
        end
      end

      # Media Package Output Settings

      struct MediaPackageOutputSettings
        include JSON::Serializable

        # Optional settings for MediaPackage V2 destinations

        @[JSON::Field(key: "mediaPackageV2DestinationSettings")]
        getter media_package_v2_destination_settings : Types::MediaPackageV2DestinationSettings?

        def initialize(
          @media_package_v2_destination_settings : Types::MediaPackageV2DestinationSettings? = nil
        )
        end
      end

      # Media Package V2 Destination Settings

      struct MediaPackageV2DestinationSettings
        include JSON::Serializable

        # Applies only to an output that contains audio. If you want to put several audio encodes into one
        # audio rendition group, decide on a name (ID) for the group. Then in every audio output that you want
        # to belong to that group, enter that ID in this field. Note that this information is part of the HLS
        # specification (not the CMAF specification), but if you include it then MediaPackage will include it
        # in the manifest it creates for the video player.

        @[JSON::Field(key: "audioGroupId")]
        getter audio_group_id : String?

        # Applies only to an output that contains video, and only if you want to associate one or more audio
        # groups to this video. In this field you assign the groups that you create (in the Group ID fields in
        # the various audio outputs). Enter one group ID, or enter a comma-separated list of group IDs. Note
        # that this information is part of the HLS specification (not the CMAF specification), but if you
        # include it then MediaPackage will include it in the manifest it creates for the video player.

        @[JSON::Field(key: "audioRenditionSets")]
        getter audio_rendition_sets : String?

        # Specifies whether MediaPackage should set this output as the auto-select rendition in the HLS
        # manifest. YES means this must be the auto-select. NO means this should never be the auto-select.
        # OMIT means MediaPackage decides what to set on this rendition. When you consider all the renditions,
        # follow these guidelines. You can set zero or one renditions to YES. You can set zero or more
        # renditions to NO, but you can't set all renditions to NO. You can set zero, some, or all to OMIT.

        @[JSON::Field(key: "hlsAutoSelect")]
        getter hls_auto_select : String?

        # Specifies whether MediaPackage should set this output as the default rendition in the HLS manifest.
        # YES means this must be the default. NO means this should never be the default. OMIT means
        # MediaPackage decides what to set on this rendition. When you consider all the renditions, follow
        # these guidelines. You can set zero or one renditions to YES. You can set zero or more renditions to
        # NO, but you can't set all renditions to NO. You can set zero, some, or all to OMIT.

        @[JSON::Field(key: "hlsDefault")]
        getter hls_default : String?

        def initialize(
          @audio_group_id : String? = nil,
          @audio_rendition_sets : String? = nil,
          @hls_auto_select : String? = nil,
          @hls_default : String? = nil
        )
        end
      end

      # Media Package V2 Group Settings

      struct MediaPackageV2GroupSettings
        include JSON::Serializable

        # Optional an array of additional destinational HTTP destinations for the OutputGroup outputs

        @[JSON::Field(key: "additionalDestinations")]
        getter additional_destinations : Array(Types::MediaPackageAdditionalDestinations)?

        # Mapping of up to 4 caption channels to caption languages.

        @[JSON::Field(key: "captionLanguageMappings")]
        getter caption_language_mappings : Array(Types::CaptionLanguageMapping)?

        # Set to ENABLED to enable ID3 metadata insertion. To include metadata, you configure other parameters
        # in the output group, or you add an ID3 action to the channel schedule.

        @[JSON::Field(key: "id3Behavior")]
        getter id3_behavior : String?

        # If set to passthrough, passes any KLV data from the input source to this output.

        @[JSON::Field(key: "klvBehavior")]
        getter klv_behavior : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # Type of scte35 track to add. none or scte35WithoutSegmentation

        @[JSON::Field(key: "scte35Type")]
        getter scte35_type : String?

        # The nominal duration of segments. The units are specified in SegmentLengthUnits. The segments will
        # end on the next keyframe after the specified duration, so the actual segment length might be longer,
        # and it might be a fraction of the units.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # Time unit for segment length parameter.

        @[JSON::Field(key: "segmentLengthUnits")]
        getter segment_length_units : String?

        # Set to none if you don't want to insert a timecode in the output. Otherwise choose the frame type
        # for the timecode.

        @[JSON::Field(key: "timedMetadataId3Frame")]
        getter timed_metadata_id3_frame : String?

        # If you set up to insert a timecode in the output, specify the frequency for the frame, in seconds.

        @[JSON::Field(key: "timedMetadataId3Period")]
        getter timed_metadata_id3_period : Int32?

        # Set to enabled to pass through ID3 metadata from the input sources.

        @[JSON::Field(key: "timedMetadataPassthrough")]
        getter timed_metadata_passthrough : String?

        def initialize(
          @additional_destinations : Array(Types::MediaPackageAdditionalDestinations)? = nil,
          @caption_language_mappings : Array(Types::CaptionLanguageMapping)? = nil,
          @id3_behavior : String? = nil,
          @klv_behavior : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @scte35_type : String? = nil,
          @segment_length : Int32? = nil,
          @segment_length_units : String? = nil,
          @timed_metadata_id3_frame : String? = nil,
          @timed_metadata_id3_period : Int32? = nil,
          @timed_metadata_passthrough : String? = nil
        )
        end
      end

      # An AWS resource used in media workflows.

      struct MediaResource
        include JSON::Serializable


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MediaResourceNeighbor)?

        # The logical name of an AWS media resource.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::MediaResourceNeighbor)?

        def initialize(
          @destinations : Array(Types::MediaResourceNeighbor)? = nil,
          @name : String? = nil,
          @sources : Array(Types::MediaResourceNeighbor)? = nil
        )
        end
      end

      # A direct source or destination neighbor to an AWS media resource.

      struct MediaResourceNeighbor
        include JSON::Serializable

        # The ARN of a resource used in AWS media workflows.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The logical name of an AWS media resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @name : String? = nil
        )
        end
      end

      # Represents the latest monitor deployment of a signal map.

      struct MonitorDeployment
        include JSON::Serializable


        @[JSON::Field(key: "status")]
        getter status : String

        # URI associated with a signal map's monitor deployment.

        @[JSON::Field(key: "detailsUri")]
        getter details_uri : String?

        # Error message associated with a failed monitor deployment of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @status : String,
          @details_uri : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Settings to specify the rendering of motion graphics into the video stream.

      struct MotionGraphicsActivateScheduleActionSettings
        include JSON::Serializable

        # Duration (in milliseconds) that motion graphics should render on to the video stream. Leaving out
        # this property or setting to 0 will result in rendering continuing until a deactivate action is
        # processed.

        @[JSON::Field(key: "duration")]
        getter duration : Int64?

        # Key used to extract the password from EC2 Parameter store

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # URI of the HTML5 content to be rendered into the live stream.

        @[JSON::Field(key: "url")]
        getter url : String?

        # Username if credentials are required to access a file. This must be a reference to an AWS parameter
        # store name from which the password can be retrieved. AWS Parameter store format: \"ssm:// \"

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @duration : Int64? = nil,
          @password_param : String? = nil,
          @url : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Motion Graphics Configuration

      struct MotionGraphicsConfiguration
        include JSON::Serializable

        # Motion Graphics Settings

        @[JSON::Field(key: "motionGraphicsSettings")]
        getter motion_graphics_settings : Types::MotionGraphicsSettings


        @[JSON::Field(key: "motionGraphicsInsertion")]
        getter motion_graphics_insertion : String?

        def initialize(
          @motion_graphics_settings : Types::MotionGraphicsSettings,
          @motion_graphics_insertion : String? = nil
        )
        end
      end

      # Settings to specify the ending of rendering motion graphics into the video stream.

      struct MotionGraphicsDeactivateScheduleActionSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Motion Graphics Settings

      struct MotionGraphicsSettings
        include JSON::Serializable


        @[JSON::Field(key: "htmlMotionGraphicsSettings")]
        getter html_motion_graphics_settings : Types::HtmlMotionGraphicsSettings?

        def initialize(
          @html_motion_graphics_settings : Types::HtmlMotionGraphicsSettings? = nil
        )
        end
      end

      # Mp2 Settings

      struct Mp2Settings
        include JSON::Serializable

        # Average bitrate in bits/second.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Float64?

        # The MPEG2 Audio coding mode. Valid values are codingMode10 (for mono) or codingMode20 (for stereo).

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Float64?

        def initialize(
          @bitrate : Float64? = nil,
          @coding_mode : String? = nil,
          @sample_rate : Float64? = nil
        )
        end
      end

      # Mpeg2 Filter Settings

      struct Mpeg2FilterSettings
        include JSON::Serializable


        @[JSON::Field(key: "temporalFilterSettings")]
        getter temporal_filter_settings : Types::TemporalFilterSettings?

        def initialize(
          @temporal_filter_settings : Types::TemporalFilterSettings? = nil
        )
        end
      end

      # Mpeg2 Settings

      struct Mpeg2Settings
        include JSON::Serializable

        # description": "The framerate denominator. For example, 1001. The framerate is the numerator divided
        # by the denominator. For example, 24000 / 1001 = 23.976 FPS.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32

        # The framerate numerator. For example, 24000. The framerate is the numerator divided by the
        # denominator. For example, 24000 / 1001 = 23.976 FPS.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32

        # Choose Off to disable adaptive quantization. Or choose another value to enable the quantizer and set
        # its strength. The strengths are: Auto, Off, Low, Medium, High. When you enable this field, MediaLive
        # allows intra-frame quantizers to vary, which might improve visual quality.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Indicates the AFD values that MediaLive will write into the video encode. If you do not know what
        # AFD signaling is, or if your downstream system has not given you guidance, choose AUTO. AUTO:
        # MediaLive will try to preserve the input AFD value (in cases where multiple AFD values are valid).
        # FIXED: MediaLive will use the value you specify in fixedAFD.

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # Specifies whether to include the color space metadata. The metadata describes the color space that
        # applies to the video (the colorSpace field). We recommend that you insert the metadata.

        @[JSON::Field(key: "colorMetadata")]
        getter color_metadata : String?

        # Choose the type of color space conversion to apply to the output. For detailed information on
        # setting up both the input and the output to obtain the desired color space in the output, see the
        # section on \"MediaLive Features - Video - color space\" in the MediaLive User Guide. PASSTHROUGH:
        # Keep the color space of the input content - do not convert it. AUTO:Convert all content that is SD
        # to rec 601, and convert all content that is HD to rec 709.

        @[JSON::Field(key: "colorSpace")]
        getter color_space : String?

        # Sets the pixel aspect ratio for the encode.

        @[JSON::Field(key: "displayAspectRatio")]
        getter display_aspect_ratio : String?

        # Optionally specify a noise reduction filter, which can improve quality of compressed content. If you
        # do not choose a filter, no filter will be applied. TEMPORAL: This filter is useful for both source
        # content that is noisy (when it has excessive digital artifacts) and source content that is clean.
        # When the content is noisy, the filter cleans up the source content before the encoding phase, with
        # these two effects: First, it improves the output video quality because the content has been cleaned
        # up. Secondly, it decreases the bandwidth because MediaLive does not waste bits on encoding noise.
        # When the content is reasonably clean, the filter tends to decrease the bitrate.

        @[JSON::Field(key: "filterSettings")]
        getter filter_settings : Types::Mpeg2FilterSettings?

        # Complete this field only when afdSignaling is set to FIXED. Enter the AFD value (4 bits) to write on
        # all frames of the video encode.

        @[JSON::Field(key: "fixedAfd")]
        getter fixed_afd : String?

        # MPEG2: default is open GOP.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Relates to the GOP structure. The number of B-frames between reference frames. If you do not know
        # what a B-frame is, use the default.

        @[JSON::Field(key: "gopNumBFrames")]
        getter gop_num_b_frames : Int32?

        # Relates to the GOP structure. The GOP size (keyframe interval) in the units specified in
        # gopSizeUnits. If you do not know what GOP is, use the default. If gopSizeUnits is frames, then the
        # gopSize must be an integer and must be greater than or equal to 1. If gopSizeUnits is seconds, the
        # gopSize must be greater than 0, but does not need to be an integer.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Relates to the GOP structure. Specifies whether the gopSize is specified in frames or seconds. If
        # you do not plan to change the default gopSize, leave the default. If you specify SECONDS, MediaLive
        # will internally convert the gop size to a frame count.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # Set the scan type of the output to PROGRESSIVE or INTERLACED (top field first).

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # Relates to the GOP structure. If you do not know what GOP is, use the default. FIXED: Set the number
        # of B-frames in each sub-GOP to the value in gopNumBFrames. DYNAMIC: Let MediaLive optimize the
        # number of B-frames in each sub-GOP, to improve visual quality.

        @[JSON::Field(key: "subgopLength")]
        getter subgop_length : String?

        # Timecode burn-in settings

        @[JSON::Field(key: "timecodeBurninSettings")]
        getter timecode_burnin_settings : Types::TimecodeBurninSettings?

        # Determines how MediaLive inserts timecodes in the output video. For detailed information about
        # setting up the input and the output for a timecode, see the section on \"MediaLive Features -
        # Timecode configuration\" in the MediaLive User Guide. DISABLED: do not include timecodes.
        # GOP_TIMECODE: Include timecode metadata in the GOP header.

        @[JSON::Field(key: "timecodeInsertion")]
        getter timecode_insertion : String?

        def initialize(
          @framerate_denominator : Int32,
          @framerate_numerator : Int32,
          @adaptive_quantization : String? = nil,
          @afd_signaling : String? = nil,
          @color_metadata : String? = nil,
          @color_space : String? = nil,
          @display_aspect_ratio : String? = nil,
          @filter_settings : Types::Mpeg2FilterSettings? = nil,
          @fixed_afd : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_num_b_frames : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @scan_type : String? = nil,
          @subgop_length : String? = nil,
          @timecode_burnin_settings : Types::TimecodeBurninSettings? = nil,
          @timecode_insertion : String? = nil
        )
        end
      end

      # Ms Smooth Group Settings

      struct MsSmoothGroupSettings
        include JSON::Serializable

        # Smooth Streaming publish point on an IIS server. Elemental Live acts as a "Push" encoder to IIS.

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # The ID to include in each message in the sparse track. Ignored if sparseTrackType is NONE.

        @[JSON::Field(key: "acquisitionPointId")]
        getter acquisition_point_id : String?

        # If set to passthrough for an audio-only MS Smooth output, the fragment absolute time will be set to
        # the current timecode. This option does not write timecodes to the audio elementary stream.

        @[JSON::Field(key: "audioOnlyTimecodeControl")]
        getter audio_only_timecode_control : String?

        # If set to verifyAuthenticity, verify the https certificate chain to a trusted Certificate Authority
        # (CA). This will cause https outputs to self-signed certificates to fail.

        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # Number of seconds to wait before retrying connection to the IIS server if the connection is lost.
        # Content will be cached during this time and the cache will be be delivered to the IIS server once
        # the connection is re-established.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # MS Smooth event ID to be sent to the IIS server. Should only be specified if eventIdMode is set to
        # useConfigured.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # Specifies whether or not to send an event ID to the IIS server. If no event ID is sent and the same
        # Live Event is used without changing the publishing point, clients might see cached video from the
        # previous run. Options: - "useConfigured" - use the value provided in eventId - "useTimestamp" -
        # generate and send an event ID based on the current timestamp - "noEventId" - do not send an event ID
        # to the IIS server.

        @[JSON::Field(key: "eventIdMode")]
        getter event_id_mode : String?

        # When set to sendEos, send EOS signal to IIS server when stopping the event

        @[JSON::Field(key: "eventStopBehavior")]
        getter event_stop_behavior : String?

        # Size in seconds of file cache for streaming outputs.

        @[JSON::Field(key: "filecacheDuration")]
        getter filecache_duration : Int32?

        # Length of mp4 fragments to generate (in seconds). Fragment length must be compatible with GOP size
        # and framerate.

        @[JSON::Field(key: "fragmentLength")]
        getter fragment_length : Int32?

        # Parameter that control output group behavior on input loss.

        @[JSON::Field(key: "inputLossAction")]
        getter input_loss_action : String?

        # Number of retry attempts.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        # Number of seconds before initiating a restart due to output failure, due to exhausting the
        # numRetries on one segment, or exceeding filecacheDuration.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        # useInputSegmentation has been deprecated. The configured segment size is always used.

        @[JSON::Field(key: "segmentationMode")]
        getter segmentation_mode : String?

        # Number of milliseconds to delay the output from the second pipeline.

        @[JSON::Field(key: "sendDelayMs")]
        getter send_delay_ms : Int32?

        # Identifies the type of data to place in the sparse track: - SCTE35: Insert SCTE-35 messages from the
        # source content. With each message, insert an IDR frame to start a new segment. -
        # SCTE35_WITHOUT_SEGMENTATION: Insert SCTE-35 messages from the source content. With each message,
        # insert an IDR frame but don't start a new segment. - NONE: Don't generate a sparse track for any
        # outputs in this output group.

        @[JSON::Field(key: "sparseTrackType")]
        getter sparse_track_type : String?

        # When set to send, send stream manifest so publishing point doesn't start until all streams start.

        @[JSON::Field(key: "streamManifestBehavior")]
        getter stream_manifest_behavior : String?

        # Timestamp offset for the event. Only used if timestampOffsetMode is set to useConfiguredOffset.

        @[JSON::Field(key: "timestampOffset")]
        getter timestamp_offset : String?

        # Type of timestamp date offset to use. - useEventStartDate: Use the date the event was started as the
        # offset - useConfiguredOffset: Use an explicitly configured date as the offset

        @[JSON::Field(key: "timestampOffsetMode")]
        getter timestamp_offset_mode : String?

        def initialize(
          @destination : Types::OutputLocationRef,
          @acquisition_point_id : String? = nil,
          @audio_only_timecode_control : String? = nil,
          @certificate_mode : String? = nil,
          @connection_retry_interval : Int32? = nil,
          @event_id : String? = nil,
          @event_id_mode : String? = nil,
          @event_stop_behavior : String? = nil,
          @filecache_duration : Int32? = nil,
          @fragment_length : Int32? = nil,
          @input_loss_action : String? = nil,
          @num_retries : Int32? = nil,
          @restart_delay : Int32? = nil,
          @segmentation_mode : String? = nil,
          @send_delay_ms : Int32? = nil,
          @sparse_track_type : String? = nil,
          @stream_manifest_behavior : String? = nil,
          @timestamp_offset : String? = nil,
          @timestamp_offset_mode : String? = nil
        )
        end
      end

      # Ms Smooth Output Settings

      struct MsSmoothOutputSettings
        include JSON::Serializable

        # Only applicable when this output is referencing an H.265 video description. Specifies whether MP4
        # segments should be packaged as HEV1 or HVC1.

        @[JSON::Field(key: "h265PackagingType")]
        getter h265_packaging_type : String?

        # String concatenated to the end of the destination filename. Required for multiple outputs of the
        # same type.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        def initialize(
          @h265_packaging_type : String? = nil,
          @name_modifier : String? = nil
        )
        end
      end

      # Multicast-specific input settings.

      struct MulticastInputSettings
        include JSON::Serializable

        # Optionally, a source ip address to filter by for Source-specific Multicast (SSM)

        @[JSON::Field(key: "sourceIpAddress")]
        getter source_ip_address : String?

        def initialize(
          @source_ip_address : String? = nil
        )
        end
      end

      # Settings for a Multicast input. Contains a list of multicast Urls and optional source ip addresses.

      struct MulticastSettings
        include JSON::Serializable


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::MulticastSource)?

        def initialize(
          @sources : Array(Types::MulticastSource)? = nil
        )
        end
      end

      # Settings for a Multicast input. Contains a list of multicast Urls and optional source ip addresses.

      struct MulticastSettingsCreateRequest
        include JSON::Serializable


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::MulticastSourceCreateRequest)?

        def initialize(
          @sources : Array(Types::MulticastSourceCreateRequest)? = nil
        )
        end
      end

      # Settings for a Multicast input. Contains a list of multicast Urls and optional source ip addresses.

      struct MulticastSettingsUpdateRequest
        include JSON::Serializable


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::MulticastSourceUpdateRequest)?

        def initialize(
          @sources : Array(Types::MulticastSourceUpdateRequest)? = nil
        )
        end
      end

      # Pair of multicast url and source ip address (optional) that make up a multicast source.

      struct MulticastSource
        include JSON::Serializable

        # This represents the customer's source URL where multicast stream is pulled from.

        @[JSON::Field(key: "url")]
        getter url : String

        # This represents the ip address of the device sending the multicast stream.

        @[JSON::Field(key: "sourceIp")]
        getter source_ip : String?

        def initialize(
          @url : String,
          @source_ip : String? = nil
        )
        end
      end

      # Pair of multicast url and source ip address (optional) that make up a multicast source.

      struct MulticastSourceCreateRequest
        include JSON::Serializable

        # This represents the customer's source URL where multicast stream is pulled from.

        @[JSON::Field(key: "url")]
        getter url : String

        # This represents the ip address of the device sending the multicast stream.

        @[JSON::Field(key: "sourceIp")]
        getter source_ip : String?

        def initialize(
          @url : String,
          @source_ip : String? = nil
        )
        end
      end

      # Pair of multicast url and source ip address (optional) that make up a multicast source.

      struct MulticastSourceUpdateRequest
        include JSON::Serializable

        # This represents the customer's source URL where multicast stream is pulled from.

        @[JSON::Field(key: "url")]
        getter url : String

        # This represents the ip address of the device sending the multicast stream.

        @[JSON::Field(key: "sourceIp")]
        getter source_ip : String?

        def initialize(
          @url : String,
          @source_ip : String? = nil
        )
        end
      end

      # The multiplex object.

      struct Multiplex
        include JSON::Serializable

        # The unique arn of the multiplex.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A list of availability zones for the multiplex.

        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?

        # A list of the multiplex output destinations.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MultiplexOutputDestination)?

        # The unique id of the multiplex.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Configuration for a multiplex event.

        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?

        # The name of the multiplex.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of currently healthy pipelines.

        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?

        # The number of programs in the multiplex.

        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?

        # The current state of the multiplex.

        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @destinations : Array(Types::MultiplexOutputDestination)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An alert on a multiplex

      struct MultiplexAlert
        include JSON::Serializable

        # The type of the alert

        @[JSON::Field(key: "alertType")]
        getter alert_type : String?


        @[JSON::Field(key: "clearedTimestamp")]
        getter cleared_timestamp : Time?

        # The unique ID for this alert instance

        @[JSON::Field(key: "id")]
        getter id : String?

        # The user facing alert message which can have more context

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the pipeline this alert is associated with

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?


        @[JSON::Field(key: "setTimestamp")]
        getter set_timestamp : Time?

        # The state of the alert

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @alert_type : String? = nil,
          @cleared_timestamp : Time? = nil,
          @id : String? = nil,
          @message : String? = nil,
          @pipeline_id : String? = nil,
          @set_timestamp : Time? = nil,
          @state : String? = nil
        )
        end
      end


      struct MultiplexConfigurationValidationError
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A collection of validation error responses.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        def initialize(
          @message : String? = nil,
          @validation_errors : Array(Types::ValidationError)? = nil
        )
        end
      end

      # Multiplex Container Settings

      struct MultiplexContainerSettings
        include JSON::Serializable


        @[JSON::Field(key: "multiplexM2tsSettings")]
        getter multiplex_m2ts_settings : Types::MultiplexM2tsSettings?

        def initialize(
          @multiplex_m2ts_settings : Types::MultiplexM2tsSettings? = nil
        )
        end
      end

      # Multiplex Group Settings

      struct MultiplexGroupSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Multiplex M2ts Settings

      struct MultiplexM2tsSettings
        include JSON::Serializable

        # When set to drop, output audio streams will be removed from the program if the selected input audio
        # stream is removed from the input. This allows the output audio configuration to dynamically change
        # based on input configuration. If this is set to encodeSilence, all output audio streams will output
        # encoded silence when not connected to an active input stream.

        @[JSON::Field(key: "absentInputAudioBehavior")]
        getter absent_input_audio_behavior : String?

        # When set to enabled, uses ARIB-compliant field muxing and removes video descriptor.

        @[JSON::Field(key: "arib")]
        getter arib : String?

        # When set to dvb, uses DVB buffer model for Dolby Digital audio. When set to atsc, the ATSC model is
        # used.

        @[JSON::Field(key: "audioBufferModel")]
        getter audio_buffer_model : String?

        # The number of audio frames to insert for each PES packet.

        @[JSON::Field(key: "audioFramesPerPes")]
        getter audio_frames_per_pes : Int32?

        # When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for EAC3. When set to dvb,
        # uses stream type = 0x06.

        @[JSON::Field(key: "audioStreamType")]
        getter audio_stream_type : String?

        # When set to enabled, generates captionServiceDescriptor in PMT.

        @[JSON::Field(key: "ccDescriptor")]
        getter cc_descriptor : String?

        # If set to passthrough, passes any EBIF data from the input source to this output.

        @[JSON::Field(key: "ebif")]
        getter ebif : String?

        # Include or exclude the ES Rate field in the PES header.

        @[JSON::Field(key: "esRateInPes")]
        getter es_rate_in_pes : String?

        # If set to passthrough, passes any KLV data from the input source to this output.

        @[JSON::Field(key: "klv")]
        getter klv : String?

        # If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input
        # audio and an equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3Behavior")]
        getter nielsen_id3_behavior : String?

        # When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized
        # Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the
        # video or audio elementary stream.

        @[JSON::Field(key: "pcrControl")]
        getter pcr_control : String?

        # Maximum time in milliseconds between Program Clock Reference (PCRs) inserted into the transport
        # stream.

        @[JSON::Field(key: "pcrPeriod")]
        getter pcr_period : Int32?

        # Optionally pass SCTE-35 signals from the input source to this output.

        @[JSON::Field(key: "scte35Control")]
        getter scte35_control : String?

        # Defines the amount SCTE-35 preroll will be increased (in milliseconds) on the output. Preroll is the
        # amount of time between the presence of a SCTE-35 indication in a transport stream and the PTS of the
        # video frame it references. Zero means don't add pullup (it doesn't mean set the preroll to zero).
        # Negative pullup is not supported, which means that you can't make the preroll shorter. Be aware that
        # latency in the output will increase by the pullup amount.

        @[JSON::Field(key: "scte35PrerollPullupMilliseconds")]
        getter scte35_preroll_pullup_milliseconds : Float64?

        def initialize(
          @absent_input_audio_behavior : String? = nil,
          @arib : String? = nil,
          @audio_buffer_model : String? = nil,
          @audio_frames_per_pes : Int32? = nil,
          @audio_stream_type : String? = nil,
          @cc_descriptor : String? = nil,
          @ebif : String? = nil,
          @es_rate_in_pes : String? = nil,
          @klv : String? = nil,
          @nielsen_id3_behavior : String? = nil,
          @pcr_control : String? = nil,
          @pcr_period : Int32? = nil,
          @scte35_control : String? = nil,
          @scte35_preroll_pullup_milliseconds : Float64? = nil
        )
        end
      end

      # Multiplex MediaConnect output destination settings.

      struct MultiplexMediaConnectOutputDestinationSettings
        include JSON::Serializable

        # The MediaConnect entitlement ARN available as a Flow source.

        @[JSON::Field(key: "entitlementArn")]
        getter entitlement_arn : String?

        def initialize(
          @entitlement_arn : String? = nil
        )
        end
      end

      # Multiplex output destination settings

      struct MultiplexOutputDestination
        include JSON::Serializable

        # Multiplex MediaConnect output destination settings.

        @[JSON::Field(key: "mediaConnectSettings")]
        getter media_connect_settings : Types::MultiplexMediaConnectOutputDestinationSettings?

        def initialize(
          @media_connect_settings : Types::MultiplexMediaConnectOutputDestinationSettings? = nil
        )
        end
      end

      # Multiplex Output Settings

      struct MultiplexOutputSettings
        include JSON::Serializable

        # Destination is a Multiplex.

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef


        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::MultiplexContainerSettings?

        def initialize(
          @destination : Types::OutputLocationRef,
          @container_settings : Types::MultiplexContainerSettings? = nil
        )
        end
      end

      # The multiplex program object.

      struct MultiplexProgram
        include JSON::Serializable

        # The MediaLive channel associated with the program.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?

        # The settings for this multiplex program.

        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings?

        # The packet identifier map for this multiplex program.

        @[JSON::Field(key: "packetIdentifiersMap")]
        getter packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap?

        # Contains information about the current sources for the specified program in the specified multiplex.
        # Keep in mind that each multiplex pipeline connects to both pipelines in a given source channel (the
        # channel identified by the program). But only one of those channel pipelines is ever active at one
        # time.

        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::MultiplexProgramPipelineDetail)?

        # The name of the multiplex program.

        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @channel_id : String? = nil,
          @multiplex_program_settings : Types::MultiplexProgramSettings? = nil,
          @packet_identifiers_map : Types::MultiplexProgramPacketIdentifiersMap? = nil,
          @pipeline_details : Array(Types::MultiplexProgramPipelineDetail)? = nil,
          @program_name : String? = nil
        )
        end
      end

      # Multiplex Program Input Destination Settings for outputting a Channel to a Multiplex

      struct MultiplexProgramChannelDestinationSettings
        include JSON::Serializable

        # The ID of the Multiplex that the encoder is providing output to. You do not need to specify the
        # individual inputs to the Multiplex; MediaLive will handle the connection of the two MediaLive
        # pipelines to the two Multiplex instances. The Multiplex must be in the same region as the Channel.

        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String?

        # The program name of the Multiplex program that the encoder is providing output to.

        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @multiplex_id : String? = nil,
          @program_name : String? = nil
        )
        end
      end

      # Packet identifiers map for a given Multiplex program.

      struct MultiplexProgramPacketIdentifiersMap
        include JSON::Serializable


        @[JSON::Field(key: "aribCaptionsPid")]
        getter arib_captions_pid : Int32?


        @[JSON::Field(key: "audioPids")]
        getter audio_pids : Array(Int32)?


        @[JSON::Field(key: "dvbSubPids")]
        getter dvb_sub_pids : Array(Int32)?


        @[JSON::Field(key: "dvbTeletextPid")]
        getter dvb_teletext_pid : Int32?


        @[JSON::Field(key: "dvbTeletextPids")]
        getter dvb_teletext_pids : Array(Int32)?


        @[JSON::Field(key: "ecmPid")]
        getter ecm_pid : Int32?


        @[JSON::Field(key: "etvPlatformPid")]
        getter etv_platform_pid : Int32?


        @[JSON::Field(key: "etvSignalPid")]
        getter etv_signal_pid : Int32?


        @[JSON::Field(key: "klvDataPids")]
        getter klv_data_pids : Array(Int32)?


        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : Int32?


        @[JSON::Field(key: "pmtPid")]
        getter pmt_pid : Int32?


        @[JSON::Field(key: "privateMetadataPid")]
        getter private_metadata_pid : Int32?


        @[JSON::Field(key: "scte27Pids")]
        getter scte27_pids : Array(Int32)?


        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : Int32?


        @[JSON::Field(key: "smpte2038Pid")]
        getter smpte2038_pid : Int32?


        @[JSON::Field(key: "timedMetadataPid")]
        getter timed_metadata_pid : Int32?


        @[JSON::Field(key: "videoPid")]
        getter video_pid : Int32?

        def initialize(
          @arib_captions_pid : Int32? = nil,
          @audio_pids : Array(Int32)? = nil,
          @dvb_sub_pids : Array(Int32)? = nil,
          @dvb_teletext_pid : Int32? = nil,
          @dvb_teletext_pids : Array(Int32)? = nil,
          @ecm_pid : Int32? = nil,
          @etv_platform_pid : Int32? = nil,
          @etv_signal_pid : Int32? = nil,
          @klv_data_pids : Array(Int32)? = nil,
          @pcr_pid : Int32? = nil,
          @pmt_pid : Int32? = nil,
          @private_metadata_pid : Int32? = nil,
          @scte27_pids : Array(Int32)? = nil,
          @scte35_pid : Int32? = nil,
          @smpte2038_pid : Int32? = nil,
          @timed_metadata_pid : Int32? = nil,
          @video_pid : Int32? = nil
        )
        end
      end

      # The current source for one of the pipelines in the multiplex.

      struct MultiplexProgramPipelineDetail
        include JSON::Serializable

        # Identifies the channel pipeline that is currently active for the pipeline (identified by PipelineId)
        # in the multiplex.

        @[JSON::Field(key: "activeChannelPipeline")]
        getter active_channel_pipeline : String?

        # Identifies a specific pipeline in the multiplex.

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?

        def initialize(
          @active_channel_pipeline : String? = nil,
          @pipeline_id : String? = nil
        )
        end
      end

      # Transport stream service descriptor configuration for the Multiplex program.

      struct MultiplexProgramServiceDescriptor
        include JSON::Serializable

        # Name of the provider.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        # Name of the service.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @provider_name : String,
          @service_name : String
        )
        end
      end

      # Multiplex Program settings configuration.

      struct MultiplexProgramSettings
        include JSON::Serializable

        # Unique program number.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32

        # Indicates which pipeline is preferred by the multiplex for program ingest.

        @[JSON::Field(key: "preferredChannelPipeline")]
        getter preferred_channel_pipeline : String?

        # Transport stream service descriptor configuration for the Multiplex program.

        @[JSON::Field(key: "serviceDescriptor")]
        getter service_descriptor : Types::MultiplexProgramServiceDescriptor?

        # Program video settings configuration.

        @[JSON::Field(key: "videoSettings")]
        getter video_settings : Types::MultiplexVideoSettings?

        def initialize(
          @program_number : Int32,
          @preferred_channel_pipeline : String? = nil,
          @service_descriptor : Types::MultiplexProgramServiceDescriptor? = nil,
          @video_settings : Types::MultiplexVideoSettings? = nil
        )
        end
      end


      struct MultiplexProgramSummary
        include JSON::Serializable

        # The MediaLive Channel associated with the program.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?

        # The name of the multiplex program.

        @[JSON::Field(key: "programName")]
        getter program_name : String?

        def initialize(
          @channel_id : String? = nil,
          @program_name : String? = nil
        )
        end
      end

      # Contains configuration for a Multiplex event

      struct MultiplexSettings
        include JSON::Serializable

        # Transport stream bit rate.

        @[JSON::Field(key: "transportStreamBitrate")]
        getter transport_stream_bitrate : Int32

        # Transport stream ID.

        @[JSON::Field(key: "transportStreamId")]
        getter transport_stream_id : Int32

        # Maximum video buffer delay in milliseconds.

        @[JSON::Field(key: "maximumVideoBufferDelayMilliseconds")]
        getter maximum_video_buffer_delay_milliseconds : Int32?

        # Transport stream reserved bit rate.

        @[JSON::Field(key: "transportStreamReservedBitrate")]
        getter transport_stream_reserved_bitrate : Int32?

        def initialize(
          @transport_stream_bitrate : Int32,
          @transport_stream_id : Int32,
          @maximum_video_buffer_delay_milliseconds : Int32? = nil,
          @transport_stream_reserved_bitrate : Int32? = nil
        )
        end
      end

      # Contains summary configuration for a Multiplex event.

      struct MultiplexSettingsSummary
        include JSON::Serializable

        # Transport stream bit rate.

        @[JSON::Field(key: "transportStreamBitrate")]
        getter transport_stream_bitrate : Int32?

        def initialize(
          @transport_stream_bitrate : Int32? = nil
        )
        end
      end

      # Statmux rate control settings

      struct MultiplexStatmuxVideoSettings
        include JSON::Serializable

        # Maximum statmux bitrate.

        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : Int32?

        # Minimum statmux bitrate.

        @[JSON::Field(key: "minimumBitrate")]
        getter minimum_bitrate : Int32?

        # The purpose of the priority is to use a combination of the\nmultiplex rate control algorithm and the
        # QVBR capability of the\nencoder to prioritize the video quality of some channels in a\nmultiplex
        # over others. Channels that have a higher priority will\nget higher video quality at the expense of
        # the video quality of\nother channels in the multiplex with lower priority.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @maximum_bitrate : Int32? = nil,
          @minimum_bitrate : Int32? = nil,
          @priority : Int32? = nil
        )
        end
      end


      struct MultiplexSummary
        include JSON::Serializable

        # The unique arn of the multiplex.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A list of availability zones for the multiplex.

        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?

        # The unique id of the multiplex.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Configuration for a multiplex event.

        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettingsSummary?

        # The name of the multiplex.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of currently healthy pipelines.

        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?

        # The number of programs in the multiplex.

        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?

        # The current state of the multiplex.

        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettingsSummary? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The video configuration for each program in a multiplex.

      struct MultiplexVideoSettings
        include JSON::Serializable

        # The constant bitrate configuration for the video encode. When this field is defined, StatmuxSettings
        # must be undefined.

        @[JSON::Field(key: "constantBitrate")]
        getter constant_bitrate : Int32?

        # Statmux rate control settings. When this field is defined, ConstantBitrate must be undefined.

        @[JSON::Field(key: "statmuxSettings")]
        getter statmux_settings : Types::MultiplexStatmuxVideoSettings?

        def initialize(
          @constant_bitrate : Int32? = nil,
          @statmux_settings : Types::MultiplexStatmuxVideoSettings? = nil
        )
        end
      end

      # Network source to transcode. Must be accessible to the Elemental Live node that is running the live
      # event through a network connection.

      struct NetworkInputSettings
        include JSON::Serializable

        # Specifies HLS input settings when the uri is for a HLS manifest.

        @[JSON::Field(key: "hlsInputSettings")]
        getter hls_input_settings : Types::HlsInputSettings?

        # Specifies multicast input settings when the uri is for a multicast event.

        @[JSON::Field(key: "multicastInputSettings")]
        getter multicast_input_settings : Types::MulticastInputSettings?

        # Check HTTPS server certificates. When set to checkCryptographyOnly, cryptography in the certificate
        # will be checked, but not the server's name. Certain subdomains (notably S3 buckets that use dots in
        # the bucket name) do not strictly match the corresponding certificate's wildcard pattern and would
        # otherwise cause the event to error. This setting is ignored for protocols that do not use https.

        @[JSON::Field(key: "serverValidation")]
        getter server_validation : String?

        def initialize(
          @hls_input_settings : Types::HlsInputSettings? = nil,
          @multicast_input_settings : Types::MulticastInputSettings? = nil,
          @server_validation : String? = nil
        )
        end
      end

      # Nielsen CBET

      struct NielsenCBET
        include JSON::Serializable

        # Enter the CBET check digits to use in the watermark.

        @[JSON::Field(key: "cbetCheckDigitString")]
        getter cbet_check_digit_string : String

        # Determines the method of CBET insertion mode when prior encoding is detected on the same layer.

        @[JSON::Field(key: "cbetStepaside")]
        getter cbet_stepaside : String

        # Enter the CBET Source ID (CSID) to use in the watermark

        @[JSON::Field(key: "csid")]
        getter csid : String

        def initialize(
          @cbet_check_digit_string : String,
          @cbet_stepaside : String,
          @csid : String
        )
        end
      end

      # Nielsen Configuration

      struct NielsenConfiguration
        include JSON::Serializable

        # Enter the Distributor ID assigned to your organization by Nielsen.

        @[JSON::Field(key: "distributorId")]
        getter distributor_id : String?

        # Enables Nielsen PCM to ID3 tagging

        @[JSON::Field(key: "nielsenPcmToId3Tagging")]
        getter nielsen_pcm_to_id3_tagging : String?

        def initialize(
          @distributor_id : String? = nil,
          @nielsen_pcm_to_id3_tagging : String? = nil
        )
        end
      end

      # Nielsen Naes Ii Nw

      struct NielsenNaesIiNw
        include JSON::Serializable

        # Enter the check digit string for the watermark

        @[JSON::Field(key: "checkDigitString")]
        getter check_digit_string : String

        # Enter the Nielsen Source ID (SID) to include in the watermark

        @[JSON::Field(key: "sid")]
        getter sid : Float64

        # Choose the timezone for the time stamps in the watermark. If not provided, the timestamps will be in
        # Coordinated Universal Time (UTC)

        @[JSON::Field(key: "timezone")]
        getter timezone : String?

        def initialize(
          @check_digit_string : String,
          @sid : Float64,
          @timezone : String? = nil
        )
        end
      end

      # Nielsen Watermarks Settings

      struct NielsenWatermarksSettings
        include JSON::Serializable

        # Complete these fields only if you want to insert watermarks of type Nielsen CBET

        @[JSON::Field(key: "nielsenCbetSettings")]
        getter nielsen_cbet_settings : Types::NielsenCBET?

        # Choose the distribution types that you want to assign to the watermarks: - PROGRAM_CONTENT -
        # FINAL_DISTRIBUTOR

        @[JSON::Field(key: "nielsenDistributionType")]
        getter nielsen_distribution_type : String?

        # Complete these fields only if you want to insert watermarks of type Nielsen NAES II (N2) and Nielsen
        # NAES VI (NW).

        @[JSON::Field(key: "nielsenNaesIiNwSettings")]
        getter nielsen_naes_ii_nw_settings : Types::NielsenNaesIiNw?

        def initialize(
          @nielsen_cbet_settings : Types::NielsenCBET? = nil,
          @nielsen_distribution_type : String? = nil,
          @nielsen_naes_ii_nw_settings : Types::NielsenNaesIiNw? = nil
        )
        end
      end

      # Details about a configuration error on the Node.

      struct NodeConfigurationValidationError
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A collection of validation error responses.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(Types::ValidationError)?

        def initialize(
          @message : String? = nil,
          @validation_errors : Array(Types::ValidationError)? = nil
        )
        end
      end

      # A mapping that's used to pair a logical network interface name on a Node with the physical interface
      # name exposed in the operating system.

      struct NodeInterfaceMapping
        include JSON::Serializable

        # A uniform logical interface name to address in a MediaLive channel configuration.

        @[JSON::Field(key: "logicalInterfaceName")]
        getter logical_interface_name : String?


        @[JSON::Field(key: "networkInterfaceMode")]
        getter network_interface_mode : String?

        # The name of the physical interface on the hardware that will be running Elemental anywhere.

        @[JSON::Field(key: "physicalInterfaceName")]
        getter physical_interface_name : String?

        def initialize(
          @logical_interface_name : String? = nil,
          @network_interface_mode : String? = nil,
          @physical_interface_name : String? = nil
        )
        end
      end

      # Used in CreateNodeRequest.

      struct NodeInterfaceMappingCreateRequest
        include JSON::Serializable

        # Specify one of the logicalInterfaceNames that you created in the Cluster that this node belongs to.
        # For example, my-Inputs-Interface.

        @[JSON::Field(key: "logicalInterfaceName")]
        getter logical_interface_name : String?

        # The style of the network -- NAT or BRIDGE.

        @[JSON::Field(key: "networkInterfaceMode")]
        getter network_interface_mode : String?

        # Specify the physical name that corresponds to the logicalInterfaceName that you specified in this
        # interface mapping. For example, Eth1 or ENO1234EXAMPLE.

        @[JSON::Field(key: "physicalInterfaceName")]
        getter physical_interface_name : String?

        def initialize(
          @logical_interface_name : String? = nil,
          @network_interface_mode : String? = nil,
          @physical_interface_name : String? = nil
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

      # Request references a resource which does not exist.

      struct NotFoundExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Reserved resources available for purchase

      struct Offering
        include JSON::Serializable

        # Unique offering ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # Lease duration, e.g. '12'

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Units for duration, e.g. 'MONTHS'

        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String?

        # One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering

        @[JSON::Field(key: "fixedPrice")]
        getter fixed_price : Float64?

        # Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West
        # (Oregon)'

        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String?

        # Unique offering ID, e.g. '87654321'

        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # Offering type, e.g. 'NO_UPFRONT'

        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?

        # AWS region, e.g. 'us-west-2'

        @[JSON::Field(key: "region")]
        getter region : String?

        # Resource configuration details

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ReservationResourceSpecification?

        # Recurring usage charge for each reserved resource, e.g. '157.0'

        @[JSON::Field(key: "usagePrice")]
        getter usage_price : Float64?

        def initialize(
          @arn : String? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @duration_units : String? = nil,
          @fixed_price : Float64? = nil,
          @offering_description : String? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @region : String? = nil,
          @resource_specification : Types::ReservationResourceSpecification? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Output settings. There can be multiple outputs within a group.

      struct Output
        include JSON::Serializable

        # Output type-specific settings.

        @[JSON::Field(key: "outputSettings")]
        getter output_settings : Types::OutputSettings

        # The names of the AudioDescriptions used as audio sources for this output.

        @[JSON::Field(key: "audioDescriptionNames")]
        getter audio_description_names : Array(String)?

        # The names of the CaptionDescriptions used as caption sources for this output.

        @[JSON::Field(key: "captionDescriptionNames")]
        getter caption_description_names : Array(String)?

        # The name used to identify an output.

        @[JSON::Field(key: "outputName")]
        getter output_name : String?

        # The name of the VideoDescription used as the source for this output.

        @[JSON::Field(key: "videoDescriptionName")]
        getter video_description_name : String?

        def initialize(
          @output_settings : Types::OutputSettings,
          @audio_description_names : Array(String)? = nil,
          @caption_description_names : Array(String)? = nil,
          @output_name : String? = nil,
          @video_description_name : String? = nil
        )
        end
      end


      struct OutputDestination
        include JSON::Serializable

        # User-specified id. This is used in an output group or an output.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Optional assignment of an output to a logical interface on the Node. Only applies to on premises
        # channels.

        @[JSON::Field(key: "logicalInterfaceNames")]
        getter logical_interface_names : Array(String)?

        # Destination settings for a MediaPackage output; one destination for both encoders.

        @[JSON::Field(key: "mediaPackageSettings")]
        getter media_package_settings : Array(Types::MediaPackageOutputDestinationSettings)?

        # Destination settings for a Multiplex output; one destination for both encoders.

        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexProgramChannelDestinationSettings?

        # Destination settings for a standard output; one destination for each redundant encoder.

        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::OutputDestinationSettings)?

        # SRT settings for an SRT output; one destination for each redundant encoder.

        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Array(Types::SrtOutputDestinationSettings)?

        def initialize(
          @id : String? = nil,
          @logical_interface_names : Array(String)? = nil,
          @media_package_settings : Array(Types::MediaPackageOutputDestinationSettings)? = nil,
          @multiplex_settings : Types::MultiplexProgramChannelDestinationSettings? = nil,
          @settings : Array(Types::OutputDestinationSettings)? = nil,
          @srt_settings : Array(Types::SrtOutputDestinationSettings)? = nil
        )
        end
      end


      struct OutputDestinationSettings
        include JSON::Serializable

        # key used to extract the password from EC2 Parameter store

        @[JSON::Field(key: "passwordParam")]
        getter password_param : String?

        # Stream name for RTMP destinations (URLs of type rtmp://)

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        # A URL specifying a destination

        @[JSON::Field(key: "url")]
        getter url : String?

        # username for destination

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @password_param : String? = nil,
          @stream_name : String? = nil,
          @url : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Output groups for this Live Event. Output groups contain information about where streams should be
      # distributed.

      struct OutputGroup
        include JSON::Serializable

        # Settings associated with the output group.

        @[JSON::Field(key: "outputGroupSettings")]
        getter output_group_settings : Types::OutputGroupSettings


        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)

        # Custom output group name optionally defined by the user.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @output_group_settings : Types::OutputGroupSettings,
          @outputs : Array(Types::Output),
          @name : String? = nil
        )
        end
      end

      # Output Group Settings

      struct OutputGroupSettings
        include JSON::Serializable


        @[JSON::Field(key: "archiveGroupSettings")]
        getter archive_group_settings : Types::ArchiveGroupSettings?


        @[JSON::Field(key: "cmafIngestGroupSettings")]
        getter cmaf_ingest_group_settings : Types::CmafIngestGroupSettings?


        @[JSON::Field(key: "frameCaptureGroupSettings")]
        getter frame_capture_group_settings : Types::FrameCaptureGroupSettings?


        @[JSON::Field(key: "hlsGroupSettings")]
        getter hls_group_settings : Types::HlsGroupSettings?


        @[JSON::Field(key: "mediaPackageGroupSettings")]
        getter media_package_group_settings : Types::MediaPackageGroupSettings?


        @[JSON::Field(key: "msSmoothGroupSettings")]
        getter ms_smooth_group_settings : Types::MsSmoothGroupSettings?


        @[JSON::Field(key: "multiplexGroupSettings")]
        getter multiplex_group_settings : Types::MultiplexGroupSettings?


        @[JSON::Field(key: "rtmpGroupSettings")]
        getter rtmp_group_settings : Types::RtmpGroupSettings?


        @[JSON::Field(key: "srtGroupSettings")]
        getter srt_group_settings : Types::SrtGroupSettings?


        @[JSON::Field(key: "udpGroupSettings")]
        getter udp_group_settings : Types::UdpGroupSettings?

        def initialize(
          @archive_group_settings : Types::ArchiveGroupSettings? = nil,
          @cmaf_ingest_group_settings : Types::CmafIngestGroupSettings? = nil,
          @frame_capture_group_settings : Types::FrameCaptureGroupSettings? = nil,
          @hls_group_settings : Types::HlsGroupSettings? = nil,
          @media_package_group_settings : Types::MediaPackageGroupSettings? = nil,
          @ms_smooth_group_settings : Types::MsSmoothGroupSettings? = nil,
          @multiplex_group_settings : Types::MultiplexGroupSettings? = nil,
          @rtmp_group_settings : Types::RtmpGroupSettings? = nil,
          @srt_group_settings : Types::SrtGroupSettings? = nil,
          @udp_group_settings : Types::UdpGroupSettings? = nil
        )
        end
      end

      # Reference to an OutputDestination ID defined in the channel

      struct OutputLocationRef
        include JSON::Serializable


        @[JSON::Field(key: "destinationRefId")]
        getter destination_ref_id : String?

        def initialize(
          @destination_ref_id : String? = nil
        )
        end
      end

      # Output Locking Settings

      struct OutputLockingSettings
        include JSON::Serializable


        @[JSON::Field(key: "epochLockingSettings")]
        getter epoch_locking_settings : Types::EpochLockingSettings?


        @[JSON::Field(key: "pipelineLockingSettings")]
        getter pipeline_locking_settings : Types::PipelineLockingSettings?

        def initialize(
          @epoch_locking_settings : Types::EpochLockingSettings? = nil,
          @pipeline_locking_settings : Types::PipelineLockingSettings? = nil
        )
        end
      end

      # Output Settings

      struct OutputSettings
        include JSON::Serializable


        @[JSON::Field(key: "archiveOutputSettings")]
        getter archive_output_settings : Types::ArchiveOutputSettings?


        @[JSON::Field(key: "cmafIngestOutputSettings")]
        getter cmaf_ingest_output_settings : Types::CmafIngestOutputSettings?


        @[JSON::Field(key: "frameCaptureOutputSettings")]
        getter frame_capture_output_settings : Types::FrameCaptureOutputSettings?


        @[JSON::Field(key: "hlsOutputSettings")]
        getter hls_output_settings : Types::HlsOutputSettings?


        @[JSON::Field(key: "mediaPackageOutputSettings")]
        getter media_package_output_settings : Types::MediaPackageOutputSettings?


        @[JSON::Field(key: "msSmoothOutputSettings")]
        getter ms_smooth_output_settings : Types::MsSmoothOutputSettings?


        @[JSON::Field(key: "multiplexOutputSettings")]
        getter multiplex_output_settings : Types::MultiplexOutputSettings?


        @[JSON::Field(key: "rtmpOutputSettings")]
        getter rtmp_output_settings : Types::RtmpOutputSettings?


        @[JSON::Field(key: "srtOutputSettings")]
        getter srt_output_settings : Types::SrtOutputSettings?


        @[JSON::Field(key: "udpOutputSettings")]
        getter udp_output_settings : Types::UdpOutputSettings?

        def initialize(
          @archive_output_settings : Types::ArchiveOutputSettings? = nil,
          @cmaf_ingest_output_settings : Types::CmafIngestOutputSettings? = nil,
          @frame_capture_output_settings : Types::FrameCaptureOutputSettings? = nil,
          @hls_output_settings : Types::HlsOutputSettings? = nil,
          @media_package_output_settings : Types::MediaPackageOutputSettings? = nil,
          @ms_smooth_output_settings : Types::MsSmoothOutputSettings? = nil,
          @multiplex_output_settings : Types::MultiplexOutputSettings? = nil,
          @rtmp_output_settings : Types::RtmpOutputSettings? = nil,
          @srt_output_settings : Types::SrtOutputSettings? = nil,
          @udp_output_settings : Types::UdpOutputSettings? = nil
        )
        end
      end

      # Pass Through Settings

      struct PassThroughSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Settings for the action to set pause state of a channel.

      struct PauseStateScheduleActionSettings
        include JSON::Serializable


        @[JSON::Field(key: "pipelines")]
        getter pipelines : Array(Types::PipelinePauseStateSettings)?

        def initialize(
          @pipelines : Array(Types::PipelinePauseStateSettings)? = nil
        )
        end
      end

      # Runtime details of a pipeline when a channel is running.

      struct PipelineDetail
        include JSON::Serializable

        # The name of the active input attachment currently being ingested by this pipeline.

        @[JSON::Field(key: "activeInputAttachmentName")]
        getter active_input_attachment_name : String?

        # The name of the input switch schedule action that occurred most recently and that resulted in the
        # switch to the current input attachment for this pipeline.

        @[JSON::Field(key: "activeInputSwitchActionName")]
        getter active_input_switch_action_name : String?

        # The name of the motion graphics activate action that occurred most recently and that resulted in the
        # current graphics URI for this pipeline.

        @[JSON::Field(key: "activeMotionGraphicsActionName")]
        getter active_motion_graphics_action_name : String?

        # The current URI being used for HTML5 motion graphics for this pipeline.

        @[JSON::Field(key: "activeMotionGraphicsUri")]
        getter active_motion_graphics_uri : String?

        # Current engine version of the encoder for this pipeline.

        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?

        # Pipeline ID

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?

        def initialize(
          @active_input_attachment_name : String? = nil,
          @active_input_switch_action_name : String? = nil,
          @active_motion_graphics_action_name : String? = nil,
          @active_motion_graphics_uri : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @pipeline_id : String? = nil
        )
        end
      end

      # Pipeline Locking Settings

      struct PipelineLockingSettings
        include JSON::Serializable

        # The method to use to lock the video frames in the pipelines. sourceTimecode (default): Use the
        # timecode in the source. videoAlignment: Lock frames that the encoder identifies as having matching
        # content. If videoAlignment is selected, existing timecodes will not be used for any locking
        # decisions.

        @[JSON::Field(key: "pipelineLockingMethod")]
        getter pipeline_locking_method : String?

        def initialize(
          @pipeline_locking_method : String? = nil
        )
        end
      end

      # Settings for pausing a pipeline.

      struct PipelinePauseStateSettings
        include JSON::Serializable

        # Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String

        def initialize(
          @pipeline_id : String
        )
        end
      end

      # Settings for a primary (leader) channel in a linked pair

      struct PrimaryChannelSettings
        include JSON::Serializable

        # Specifies this as a primary channel

        @[JSON::Field(key: "linkedChannelType")]
        getter linked_channel_type : String?

        def initialize(
          @linked_channel_type : String? = nil
        )
        end
      end

      # PurchaseOffering request

      struct PurchaseOffering
        include JSON::Serializable

        # Number of resources

        @[JSON::Field(key: "count")]
        getter count : Int32

        # Name for the new reservation

        @[JSON::Field(key: "name")]
        getter name : String?

        # Renewal settings for the reservation

        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?

        # Unique request ID to be specified. This is needed to prevent retries from creating multiple
        # resources.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the
        # first day of the current month and one year from now. If no value is given, the default is now.

        @[JSON::Field(key: "start")]
        getter start : String?

        # A collection of key-value pairs

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @count : Int32,
          @name : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil,
          @request_id : String? = nil,
          @start : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PurchaseOfferingRequest
        include JSON::Serializable


        @[JSON::Field(key: "count")]
        getter count : Int32


        @[JSON::Field(key: "offeringId")]
        getter offering_id : String


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?


        @[JSON::Field(key: "requestId")]
        getter request_id : String?


        @[JSON::Field(key: "start")]
        getter start : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @count : Int32,
          @offering_id : String,
          @name : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil,
          @request_id : String? = nil,
          @start : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PurchaseOfferingResponse
        include JSON::Serializable


        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      # PurchaseOffering response

      struct PurchaseOfferingResultModel
        include JSON::Serializable


        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      # Raw Settings

      struct RawSettings
        include JSON::Serializable

        def initialize
        end
      end


      struct RebootInputDevice
        include JSON::Serializable

        # Force a reboot of an input device. If the device is streaming, it will stop streaming and begin
        # rebooting within a few seconds of sending the command. If the device was streaming prior to the
        # reboot, the device will resume streaming when the reboot completes.

        @[JSON::Field(key: "force")]
        getter force : String?

        def initialize(
          @force : String? = nil
        )
        end
      end


      struct RebootInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String


        @[JSON::Field(key: "force")]
        getter force : String?

        def initialize(
          @input_device_id : String,
          @force : String? = nil
        )
        end
      end


      struct RebootInputDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Rec601 Settings

      struct Rec601Settings
        include JSON::Serializable

        def initialize
        end
      end

      # Rec709 Settings

      struct Rec709Settings
        include JSON::Serializable

        def initialize
        end
      end


      struct RejectInputDeviceTransferRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct RejectInputDeviceTransferResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Remix Settings

      struct RemixSettings
        include JSON::Serializable

        # Mapping of input channels to output channels, with appropriate gain adjustments.

        @[JSON::Field(key: "channelMappings")]
        getter channel_mappings : Array(Types::AudioChannelMapping)

        # Number of input channels to be used.

        @[JSON::Field(key: "channelsIn")]
        getter channels_in : Int32?

        # Number of output channels to be produced. Valid values: 1, 2, 4, 6, 8

        @[JSON::Field(key: "channelsOut")]
        getter channels_out : Int32?

        def initialize(
          @channel_mappings : Array(Types::AudioChannelMapping),
          @channels_in : Int32? = nil,
          @channels_out : Int32? = nil
        )
        end
      end

      # The Renewal settings for Reservations

      struct RenewalSettings
        include JSON::Serializable

        # Automatic renewal status for the reservation

        @[JSON::Field(key: "automaticRenewal")]
        getter automatic_renewal : String?

        # Count for the reservation renewal

        @[JSON::Field(key: "renewalCount")]
        getter renewal_count : Int32?

        def initialize(
          @automatic_renewal : String? = nil,
          @renewal_count : Int32? = nil
        )
        end
      end

      # Reserved resources available to use

      struct Reservation
        include JSON::Serializable

        # Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Number of reserved resources

        @[JSON::Field(key: "count")]
        getter count : Int32?

        # Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # Lease duration, e.g. '12'

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Units for duration, e.g. 'MONTHS'

        @[JSON::Field(key: "durationUnits")]
        getter duration_units : String?

        # Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'

        @[JSON::Field(key: "end")]
        getter end : String?

        # One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering

        @[JSON::Field(key: "fixedPrice")]
        getter fixed_price : Float64?

        # User specified reservation name

        @[JSON::Field(key: "name")]
        getter name : String?

        # Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West
        # (Oregon)'

        @[JSON::Field(key: "offeringDescription")]
        getter offering_description : String?

        # Unique offering ID, e.g. '87654321'

        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # Offering type, e.g. 'NO_UPFRONT'

        @[JSON::Field(key: "offeringType")]
        getter offering_type : String?

        # AWS region, e.g. 'us-west-2'

        @[JSON::Field(key: "region")]
        getter region : String?

        # Renewal settings for the reservation

        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?

        # Unique reservation ID, e.g. '1234567'

        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String?

        # Resource configuration details

        @[JSON::Field(key: "resourceSpecification")]
        getter resource_specification : Types::ReservationResourceSpecification?

        # Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'

        @[JSON::Field(key: "start")]
        getter start : String?

        # Current state of reservation, e.g. 'ACTIVE'

        @[JSON::Field(key: "state")]
        getter state : String?

        # A collection of key-value pairs

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Recurring usage charge for each reserved resource, e.g. '157.0'

        @[JSON::Field(key: "usagePrice")]
        getter usage_price : Float64?

        def initialize(
          @arn : String? = nil,
          @count : Int32? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @duration_units : String? = nil,
          @end : String? = nil,
          @fixed_price : Float64? = nil,
          @name : String? = nil,
          @offering_description : String? = nil,
          @offering_id : String? = nil,
          @offering_type : String? = nil,
          @region : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil,
          @reservation_id : String? = nil,
          @resource_specification : Types::ReservationResourceSpecification? = nil,
          @start : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Resource configuration (codec, resolution, bitrate, ...)

      struct ReservationResourceSpecification
        include JSON::Serializable

        # Channel class, e.g. 'STANDARD'

        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?

        # Codec, e.g. 'AVC'

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Maximum bitrate, e.g. 'MAX_20_MBPS'

        @[JSON::Field(key: "maximumBitrate")]
        getter maximum_bitrate : String?

        # Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)

        @[JSON::Field(key: "maximumFramerate")]
        getter maximum_framerate : String?

        # Resolution, e.g. 'HD'

        @[JSON::Field(key: "resolution")]
        getter resolution : String?

        # Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)

        @[JSON::Field(key: "specialFeature")]
        getter special_feature : String?

        # Video quality, e.g. 'STANDARD' (Outputs only)

        @[JSON::Field(key: "videoQuality")]
        getter video_quality : String?

        def initialize(
          @channel_class : String? = nil,
          @codec : String? = nil,
          @maximum_bitrate : String? = nil,
          @maximum_framerate : String? = nil,
          @resolution : String? = nil,
          @resource_type : String? = nil,
          @special_feature : String? = nil,
          @video_quality : String? = nil
        )
        end
      end


      struct ResourceConflict
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ResourceNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RestartChannelPipelinesRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # An array of pipelines to restart in this channel. Format PIPELINE_0 or PIPELINE_1.

        @[JSON::Field(key: "pipelineIds")]
        getter pipeline_ids : Array(String)?

        def initialize(
          @channel_id : String,
          @pipeline_ids : Array(String)? = nil
        )
        end
      end


      struct RestartChannelPipelinesResponse
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?


        @[JSON::Field(key: "maintenanceStatus")]
        getter maintenance_status : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @maintenance_status : String? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end

      # Used in DescribeNetworkResult, DescribeNetworkSummary, UpdateNetworkResult.

      struct Route
        include JSON::Serializable

        # A CIDR block for one Route.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # The IP address of the Gateway for this route, if applicable.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        def initialize(
          @cidr : String? = nil,
          @gateway : String? = nil
        )
        end
      end

      # Used in CreateNetworkRequest.

      struct RouteCreateRequest
        include JSON::Serializable

        # A CIDR block for one Route.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # The IP address of the Gateway for this route, if applicable.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        def initialize(
          @cidr : String? = nil,
          @gateway : String? = nil
        )
        end
      end

      # Used in UpdateNetworkRequest.

      struct RouteUpdateRequest
        include JSON::Serializable

        # A CIDR block for one Route.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # The IP address of the Gateway for this route, if applicable.

        @[JSON::Field(key: "gateway")]
        getter gateway : String?

        def initialize(
          @cidr : String? = nil,
          @gateway : String? = nil
        )
        end
      end


      struct RouterDestination
        include JSON::Serializable

        # The Availability Zone (AZ) names of the AZs this destination is created in.

        @[JSON::Field(key: "availabilityZoneName")]
        getter availability_zone_name : String?

        # ARN of the output from MediaConnect Router currently connected to this input.

        @[JSON::Field(key: "routerOutputArn")]
        getter router_output_arn : String?

        def initialize(
          @availability_zone_name : String? = nil,
          @router_output_arn : String? = nil
        )
        end
      end


      struct RouterDestinationSettings
        include JSON::Serializable

        # Availability Zone for this MediaConnect Router destination.

        @[JSON::Field(key: "availabilityZoneName")]
        getter availability_zone_name : String

        def initialize(
          @availability_zone_name : String
        )
        end
      end

      # The settings for a MediaConnect Router Input.

      struct RouterInputSettings
        include JSON::Serializable

        # MediaConnect Router destinations associated with the MediaLive Input.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::RouterDestination)?


        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # ARN of the secret used to encrypt this input.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @destinations : Array(Types::RouterDestination)? = nil,
          @encryption_type : String? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # This is the collection of settings that are used during the creation of a MediaConnect router input.

      struct RouterSettings
        include JSON::Serializable

        # Destinations for the input from MediaConnect Router. Provide one for a single-pipeline input and two
        # for a standard input.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::RouterDestinationSettings)?


        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # ARN of the secret used to encrypt this input.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @destinations : Array(Types::RouterDestinationSettings)? = nil,
          @encryption_type : String? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # Rtmp Caption Info Destination Settings

      struct RtmpCaptionInfoDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Rtmp Group Settings

      struct RtmpGroupSettings
        include JSON::Serializable

        # Choose the ad marker type for this output group. MediaLive will create a message based on the
        # content of each SCTE-35 message, format it for that marker type, and insert it in the datastream.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : Array(String)?

        # Authentication scheme to use when connecting with CDN

        @[JSON::Field(key: "authenticationScheme")]
        getter authentication_scheme : String?

        # Controls behavior when content cache fills up. If remote origin server stalls the RTMP connection
        # and does not accept content fast enough the 'Media Cache' will fill up. When the cache reaches the
        # duration specified by cacheLength the cache will stop accepting new content. If set to
        # disconnectImmediately, the RTMP output will force a disconnect. Clear the media cache, and reconnect
        # after restartDelay seconds. If set to waitForServer, the RTMP output will wait up to 5 minutes to
        # allow the origin server to begin accepting data again.

        @[JSON::Field(key: "cacheFullBehavior")]
        getter cache_full_behavior : String?

        # Cache length, in seconds, is used to calculate buffer size.

        @[JSON::Field(key: "cacheLength")]
        getter cache_length : Int32?

        # Controls the types of data that passes to onCaptionInfo outputs. If set to 'all' then 608 and 708
        # carried DTVCC data will be passed. If set to 'field1AndField2608' then DTVCC data will be stripped
        # out, but 608 data from both fields will be passed. If set to 'field1608' then only the data carried
        # in 608 from field 1 video will be passed.

        @[JSON::Field(key: "captionData")]
        getter caption_data : String?

        # Applies only when the rate control mode (in the codec settings) is CBR (constant bit rate). Controls
        # whether the RTMP output stream is padded (with FILL NAL units) in order to achieve a constant bit
        # rate that is truly constant. When there is no padding, the bandwidth varies (up to the bitrate value
        # in the codec settings). We recommend that you choose Auto.

        @[JSON::Field(key: "includeFillerNalUnits")]
        getter include_filler_nal_units : String?

        # Controls the behavior of this RTMP group if input becomes unavailable. - emitOutput: Emit a slate
        # until input returns. - pauseOutput: Stop transmitting data until input returns. This does not close
        # the underlying RTMP connection.

        @[JSON::Field(key: "inputLossAction")]
        getter input_loss_action : String?

        # If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0
        # means never restart.

        @[JSON::Field(key: "restartDelay")]
        getter restart_delay : Int32?

        def initialize(
          @ad_markers : Array(String)? = nil,
          @authentication_scheme : String? = nil,
          @cache_full_behavior : String? = nil,
          @cache_length : Int32? = nil,
          @caption_data : String? = nil,
          @include_filler_nal_units : String? = nil,
          @input_loss_action : String? = nil,
          @restart_delay : Int32? = nil
        )
        end
      end

      # Rtmp Output Settings

      struct RtmpOutputSettings
        include JSON::Serializable

        # The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For connection to Akamai, a
        # username and password must be supplied. URI fields accept format identifiers.

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # If set to verifyAuthenticity, verify the tls certificate chain to a trusted Certificate Authority
        # (CA). This will cause rtmps outputs with self-signed certificates to fail.

        @[JSON::Field(key: "certificateMode")]
        getter certificate_mode : String?

        # Number of seconds to wait before retrying a connection to the Flash Media server if the connection
        # is lost.

        @[JSON::Field(key: "connectionRetryInterval")]
        getter connection_retry_interval : Int32?

        # Number of retry attempts.

        @[JSON::Field(key: "numRetries")]
        getter num_retries : Int32?

        def initialize(
          @destination : Types::OutputLocationRef,
          @certificate_mode : String? = nil,
          @connection_retry_interval : Int32? = nil,
          @num_retries : Int32? = nil
        )
        end
      end

      # Contains information on a single schedule action.

      struct ScheduleAction
        include JSON::Serializable

        # The name of the action, must be unique within the schedule. This name provides the main reference to
        # an action once it is added to the schedule. A name is unique if it is no longer in the schedule. The
        # schedule is automatically cleaned up to remove actions with a start time of more than 1 hour ago
        # (approximately) so at that point a name can be reused.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Settings for this schedule action.

        @[JSON::Field(key: "scheduleActionSettings")]
        getter schedule_action_settings : Types::ScheduleActionSettings

        # The time for the action to start in the channel.

        @[JSON::Field(key: "scheduleActionStartSettings")]
        getter schedule_action_start_settings : Types::ScheduleActionStartSettings

        def initialize(
          @action_name : String,
          @schedule_action_settings : Types::ScheduleActionSettings,
          @schedule_action_start_settings : Types::ScheduleActionStartSettings
        )
        end
      end

      # Holds the settings for a single schedule action.

      struct ScheduleActionSettings
        include JSON::Serializable

        # Action to insert ID3 metadata in every segment, in HLS output groups

        @[JSON::Field(key: "hlsId3SegmentTaggingSettings")]
        getter hls_id3_segment_tagging_settings : Types::HlsId3SegmentTaggingScheduleActionSettings?

        # Action to insert ID3 metadata once, in HLS output groups

        @[JSON::Field(key: "hlsTimedMetadataSettings")]
        getter hls_timed_metadata_settings : Types::HlsTimedMetadataScheduleActionSettings?

        # Action to insert ID3 metadata in every segment, in applicable output groups

        @[JSON::Field(key: "id3SegmentTaggingSettings")]
        getter id3_segment_tagging_settings : Types::Id3SegmentTaggingScheduleActionSettings?

        # Action to prepare an input for a future immediate input switch

        @[JSON::Field(key: "inputPrepareSettings")]
        getter input_prepare_settings : Types::InputPrepareScheduleActionSettings?

        # Action to switch the input

        @[JSON::Field(key: "inputSwitchSettings")]
        getter input_switch_settings : Types::InputSwitchScheduleActionSettings?

        # Action to activate a motion graphics image overlay

        @[JSON::Field(key: "motionGraphicsImageActivateSettings")]
        getter motion_graphics_image_activate_settings : Types::MotionGraphicsActivateScheduleActionSettings?

        # Action to deactivate a motion graphics image overlay

        @[JSON::Field(key: "motionGraphicsImageDeactivateSettings")]
        getter motion_graphics_image_deactivate_settings : Types::MotionGraphicsDeactivateScheduleActionSettings?

        # Action to pause or unpause one or both channel pipelines

        @[JSON::Field(key: "pauseStateSettings")]
        getter pause_state_settings : Types::PauseStateScheduleActionSettings?

        # Action to specify scte35 input

        @[JSON::Field(key: "scte35InputSettings")]
        getter scte35_input_settings : Types::Scte35InputScheduleActionSettings?

        # Action to insert SCTE-35 return_to_network message

        @[JSON::Field(key: "scte35ReturnToNetworkSettings")]
        getter scte35_return_to_network_settings : Types::Scte35ReturnToNetworkScheduleActionSettings?

        # Action to insert SCTE-35 splice_insert message

        @[JSON::Field(key: "scte35SpliceInsertSettings")]
        getter scte35_splice_insert_settings : Types::Scte35SpliceInsertScheduleActionSettings?

        # Action to insert SCTE-35 time_signal message

        @[JSON::Field(key: "scte35TimeSignalSettings")]
        getter scte35_time_signal_settings : Types::Scte35TimeSignalScheduleActionSettings?

        # Action to activate a static image overlay

        @[JSON::Field(key: "staticImageActivateSettings")]
        getter static_image_activate_settings : Types::StaticImageActivateScheduleActionSettings?

        # Action to deactivate a static image overlay

        @[JSON::Field(key: "staticImageDeactivateSettings")]
        getter static_image_deactivate_settings : Types::StaticImageDeactivateScheduleActionSettings?

        # Action to activate a static image overlay in one or more specified outputs

        @[JSON::Field(key: "staticImageOutputActivateSettings")]
        getter static_image_output_activate_settings : Types::StaticImageOutputActivateScheduleActionSettings?

        # Action to deactivate a static image overlay in one or more specified outputs

        @[JSON::Field(key: "staticImageOutputDeactivateSettings")]
        getter static_image_output_deactivate_settings : Types::StaticImageOutputDeactivateScheduleActionSettings?

        # Action to insert ID3 metadata once, in applicable output groups

        @[JSON::Field(key: "timedMetadataSettings")]
        getter timed_metadata_settings : Types::TimedMetadataScheduleActionSettings?

        def initialize(
          @hls_id3_segment_tagging_settings : Types::HlsId3SegmentTaggingScheduleActionSettings? = nil,
          @hls_timed_metadata_settings : Types::HlsTimedMetadataScheduleActionSettings? = nil,
          @id3_segment_tagging_settings : Types::Id3SegmentTaggingScheduleActionSettings? = nil,
          @input_prepare_settings : Types::InputPrepareScheduleActionSettings? = nil,
          @input_switch_settings : Types::InputSwitchScheduleActionSettings? = nil,
          @motion_graphics_image_activate_settings : Types::MotionGraphicsActivateScheduleActionSettings? = nil,
          @motion_graphics_image_deactivate_settings : Types::MotionGraphicsDeactivateScheduleActionSettings? = nil,
          @pause_state_settings : Types::PauseStateScheduleActionSettings? = nil,
          @scte35_input_settings : Types::Scte35InputScheduleActionSettings? = nil,
          @scte35_return_to_network_settings : Types::Scte35ReturnToNetworkScheduleActionSettings? = nil,
          @scte35_splice_insert_settings : Types::Scte35SpliceInsertScheduleActionSettings? = nil,
          @scte35_time_signal_settings : Types::Scte35TimeSignalScheduleActionSettings? = nil,
          @static_image_activate_settings : Types::StaticImageActivateScheduleActionSettings? = nil,
          @static_image_deactivate_settings : Types::StaticImageDeactivateScheduleActionSettings? = nil,
          @static_image_output_activate_settings : Types::StaticImageOutputActivateScheduleActionSettings? = nil,
          @static_image_output_deactivate_settings : Types::StaticImageOutputDeactivateScheduleActionSettings? = nil,
          @timed_metadata_settings : Types::TimedMetadataScheduleActionSettings? = nil
        )
        end
      end

      # Settings to specify when an action should occur. Only one of the options must be selected.

      struct ScheduleActionStartSettings
        include JSON::Serializable

        # Option for specifying the start time for an action.

        @[JSON::Field(key: "fixedModeScheduleActionStartSettings")]
        getter fixed_mode_schedule_action_start_settings : Types::FixedModeScheduleActionStartSettings?

        # Option for specifying an action as relative to another action.

        @[JSON::Field(key: "followModeScheduleActionStartSettings")]
        getter follow_mode_schedule_action_start_settings : Types::FollowModeScheduleActionStartSettings?

        # Option for specifying an action that should be applied immediately.

        @[JSON::Field(key: "immediateModeScheduleActionStartSettings")]
        getter immediate_mode_schedule_action_start_settings : Types::ImmediateModeScheduleActionStartSettings?

        def initialize(
          @fixed_mode_schedule_action_start_settings : Types::FixedModeScheduleActionStartSettings? = nil,
          @follow_mode_schedule_action_start_settings : Types::FollowModeScheduleActionStartSettings? = nil,
          @immediate_mode_schedule_action_start_settings : Types::ImmediateModeScheduleActionStartSettings? = nil
        )
        end
      end

      # Result of a schedule deletion.

      struct ScheduleDeleteResultModel
        include JSON::Serializable

        def initialize
        end
      end

      # Results of a schedule describe.

      struct ScheduleDescribeResultModel
        include JSON::Serializable

        # The list of actions in the schedule.

        @[JSON::Field(key: "scheduleActions")]
        getter schedule_actions : Array(Types::ScheduleAction)

        # The next token; for use in pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @schedule_actions : Array(Types::ScheduleAction),
          @next_token : String? = nil
        )
        end
      end

      # Scte20 Plus Embedded Destination Settings

      struct Scte20PlusEmbeddedDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Scte20 Source Settings

      struct Scte20SourceSettings
        include JSON::Serializable

        # If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708
        # wrapper as well as translated into 708. 708 data present in the source content will be discarded.

        @[JSON::Field(key: "convert608To708")]
        getter convert608_to708 : String?

        # Specifies the 608/708 channel number within the video track from which to extract captions. Unused
        # for passthrough.

        @[JSON::Field(key: "source608ChannelNumber")]
        getter source608_channel_number : Int32?

        def initialize(
          @convert608_to708 : String? = nil,
          @source608_channel_number : Int32? = nil
        )
        end
      end

      # Scte27 Destination Settings

      struct Scte27DestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Scte27 Source Settings

      struct Scte27SourceSettings
        include JSON::Serializable

        # If you will configure a WebVTT caption description that references this caption selector, use this
        # field to provide the language to consider when translating the image-based source to text.

        @[JSON::Field(key: "ocrLanguage")]
        getter ocr_language : String?

        # The pid field is used in conjunction with the caption selector languageCode field as follows: -
        # Specify PID and Language: Extracts captions from that PID; the language is "informational". -
        # Specify PID and omit Language: Extracts the specified PID. - Omit PID and specify Language: Extracts
        # the specified language, whichever PID that happens to be. - Omit PID and omit Language: Valid only
        # if source is DVB-Sub that is being passed through; all languages will be passed through.

        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        def initialize(
          @ocr_language : String? = nil,
          @pid : Int32? = nil
        )
        end
      end

      # Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare delivery restrictions,
      # include this element and its four "restriction" flags. To declare that there are no restrictions,
      # omit this element.

      struct Scte35DeliveryRestrictions
        include JSON::Serializable

        # Corresponds to SCTE-35 archive_allowed_flag.

        @[JSON::Field(key: "archiveAllowedFlag")]
        getter archive_allowed_flag : String

        # Corresponds to SCTE-35 device_restrictions parameter.

        @[JSON::Field(key: "deviceRestrictions")]
        getter device_restrictions : String

        # Corresponds to SCTE-35 no_regional_blackout_flag parameter.

        @[JSON::Field(key: "noRegionalBlackoutFlag")]
        getter no_regional_blackout_flag : String

        # Corresponds to SCTE-35 web_delivery_allowed_flag parameter.

        @[JSON::Field(key: "webDeliveryAllowedFlag")]
        getter web_delivery_allowed_flag : String

        def initialize(
          @archive_allowed_flag : String,
          @device_restrictions : String,
          @no_regional_blackout_flag : String,
          @web_delivery_allowed_flag : String
        )
        end
      end

      # Holds one set of SCTE-35 Descriptor Settings.

      struct Scte35Descriptor
        include JSON::Serializable

        # SCTE-35 Descriptor Settings.

        @[JSON::Field(key: "scte35DescriptorSettings")]
        getter scte35_descriptor_settings : Types::Scte35DescriptorSettings

        def initialize(
          @scte35_descriptor_settings : Types::Scte35DescriptorSettings
        )
        end
      end

      # SCTE-35 Descriptor settings.

      struct Scte35DescriptorSettings
        include JSON::Serializable

        # SCTE-35 Segmentation Descriptor.

        @[JSON::Field(key: "segmentationDescriptorScte35DescriptorSettings")]
        getter segmentation_descriptor_scte35_descriptor_settings : Types::Scte35SegmentationDescriptor

        def initialize(
          @segmentation_descriptor_scte35_descriptor_settings : Types::Scte35SegmentationDescriptor
        )
        end
      end

      # Scte35Input Schedule Action Settings

      struct Scte35InputScheduleActionSettings
        include JSON::Serializable

        # Whether the SCTE-35 input should be the active input or a fixed input.

        @[JSON::Field(key: "mode")]
        getter mode : String

        # In fixed mode, enter the name of the input attachment that you want to use as a SCTE-35 input.
        # (Don't enter the ID of the input.)"

        @[JSON::Field(key: "inputAttachmentNameReference")]
        getter input_attachment_name_reference : String?

        def initialize(
          @mode : String,
          @input_attachment_name_reference : String? = nil
        )
        end
      end

      # Settings for a SCTE-35 return_to_network message.

      struct Scte35ReturnToNetworkScheduleActionSettings
        include JSON::Serializable

        # The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.

        @[JSON::Field(key: "spliceEventId")]
        getter splice_event_id : Int64

        def initialize(
          @splice_event_id : Int64
        )
        end
      end

      # Corresponds to SCTE-35 segmentation_descriptor.

      struct Scte35SegmentationDescriptor
        include JSON::Serializable

        # Corresponds to SCTE-35 segmentation_event_cancel_indicator.

        @[JSON::Field(key: "segmentationCancelIndicator")]
        getter segmentation_cancel_indicator : String

        # Corresponds to SCTE-35 segmentation_event_id.

        @[JSON::Field(key: "segmentationEventId")]
        getter segmentation_event_id : Int64

        # Holds the four SCTE-35 delivery restriction parameters.

        @[JSON::Field(key: "deliveryRestrictions")]
        getter delivery_restrictions : Types::Scte35DeliveryRestrictions?

        # Corresponds to SCTE-35 segment_num. A value that is valid for the specified segmentation_type_id.

        @[JSON::Field(key: "segmentNum")]
        getter segment_num : Int32?

        # Corresponds to SCTE-35 segmentation_duration. Optional. The duration for the time_signal, in 90 KHz
        # ticks. To convert seconds to ticks, multiple the seconds by 90,000. Enter time in 90 KHz clock
        # ticks. If you do not enter a duration, the time_signal will continue until you insert a cancellation
        # message.

        @[JSON::Field(key: "segmentationDuration")]
        getter segmentation_duration : Int64?

        # Corresponds to SCTE-35 segmentation_type_id. One of the segmentation_type_id values listed in the
        # SCTE-35 specification. On the console, enter the ID in decimal (for example, "52"). In the CLI, API,
        # or an SDK, enter the ID in hex (for example, "0x34") or decimal (for example, "52").

        @[JSON::Field(key: "segmentationTypeId")]
        getter segmentation_type_id : Int32?

        # Corresponds to SCTE-35 segmentation_upid. Enter a string containing the hexadecimal representation
        # of the characters that make up the SCTE-35 segmentation_upid value. Must contain an even number of
        # hex characters. Do not include spaces between each hex pair. For example, the ASCII "ADS
        # Information" becomes hex "41445320496e666f726d6174696f6e.

        @[JSON::Field(key: "segmentationUpid")]
        getter segmentation_upid : String?

        # Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one of the types listed in the
        # SCTE-35 specification, converted to a decimal. For example, "0x0C" hex from the specification is
        # "12" in decimal. In the CLI, API, or an SDK, enter one of the types listed in the SCTE-35
        # specification, in either hex (for example, "0x0C" ) or in decimal (for example, "12").

        @[JSON::Field(key: "segmentationUpidType")]
        getter segmentation_upid_type : Int32?

        # Corresponds to SCTE-35 segments_expected. A value that is valid for the specified
        # segmentation_type_id.

        @[JSON::Field(key: "segmentsExpected")]
        getter segments_expected : Int32?

        # Corresponds to SCTE-35 sub_segment_num. A value that is valid for the specified
        # segmentation_type_id.

        @[JSON::Field(key: "subSegmentNum")]
        getter sub_segment_num : Int32?

        # Corresponds to SCTE-35 sub_segments_expected. A value that is valid for the specified
        # segmentation_type_id.

        @[JSON::Field(key: "subSegmentsExpected")]
        getter sub_segments_expected : Int32?

        def initialize(
          @segmentation_cancel_indicator : String,
          @segmentation_event_id : Int64,
          @delivery_restrictions : Types::Scte35DeliveryRestrictions? = nil,
          @segment_num : Int32? = nil,
          @segmentation_duration : Int64? = nil,
          @segmentation_type_id : Int32? = nil,
          @segmentation_upid : String? = nil,
          @segmentation_upid_type : Int32? = nil,
          @segments_expected : Int32? = nil,
          @sub_segment_num : Int32? = nil,
          @sub_segments_expected : Int32? = nil
        )
        end
      end

      # Typical configuration that applies breaks on splice inserts in addition to time signal placement
      # opportunities, breaks, and advertisements.

      struct Scte35SpliceInsert
        include JSON::Serializable

        # When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only
        # applies to embedded SCTE 104/35 messages and does not apply to OOB messages.

        @[JSON::Field(key: "adAvailOffset")]
        getter ad_avail_offset : Int32?

        # When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger
        # blackouts or Ad Avail slates

        @[JSON::Field(key: "noRegionalBlackoutFlag")]
        getter no_regional_blackout_flag : String?

        # When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger
        # blackouts or Ad Avail slates

        @[JSON::Field(key: "webDeliveryAllowedFlag")]
        getter web_delivery_allowed_flag : String?

        def initialize(
          @ad_avail_offset : Int32? = nil,
          @no_regional_blackout_flag : String? = nil,
          @web_delivery_allowed_flag : String? = nil
        )
        end
      end

      # Settings for a SCTE-35 splice_insert message.

      struct Scte35SpliceInsertScheduleActionSettings
        include JSON::Serializable

        # The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.

        @[JSON::Field(key: "spliceEventId")]
        getter splice_event_id : Int64

        # Optional, the duration for the splice_insert, in 90 KHz ticks. To convert seconds to ticks, multiple
        # the seconds by 90,000. If you enter a duration, there is an expectation that the downstream system
        # can read the duration and cue in at that time. If you do not enter a duration, the splice_insert
        # will continue indefinitely and there is an expectation that you will enter a return_to_network to
        # end the splice_insert at the appropriate time.

        @[JSON::Field(key: "duration")]
        getter duration : Int64?

        def initialize(
          @splice_event_id : Int64,
          @duration : Int64? = nil
        )
        end
      end

      # Atypical configuration that applies segment breaks only on SCTE-35 time signal placement
      # opportunities and breaks.

      struct Scte35TimeSignalApos
        include JSON::Serializable

        # When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only
        # applies to embedded SCTE 104/35 messages and does not apply to OOB messages.

        @[JSON::Field(key: "adAvailOffset")]
        getter ad_avail_offset : Int32?

        # When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger
        # blackouts or Ad Avail slates

        @[JSON::Field(key: "noRegionalBlackoutFlag")]
        getter no_regional_blackout_flag : String?

        # When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger
        # blackouts or Ad Avail slates

        @[JSON::Field(key: "webDeliveryAllowedFlag")]
        getter web_delivery_allowed_flag : String?

        def initialize(
          @ad_avail_offset : Int32? = nil,
          @no_regional_blackout_flag : String? = nil,
          @web_delivery_allowed_flag : String? = nil
        )
        end
      end

      # Settings for a SCTE-35 time_signal.

      struct Scte35TimeSignalScheduleActionSettings
        include JSON::Serializable

        # The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.

        @[JSON::Field(key: "scte35Descriptors")]
        getter scte35_descriptors : Array(Types::Scte35Descriptor)

        def initialize(
          @scte35_descriptors : Array(Types::Scte35Descriptor)
        )
        end
      end

      # Used in CreateSdiSourceResponse, DeleteSdiSourceResponse, DescribeSdiSourceResponse,
      # ListSdiSourcesResponse, UpdateSdiSourceResponse

      struct SdiSource
        include JSON::Serializable

        # The ARN of this SdiSource. It is automatically assigned when the SdiSource is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the SdiSource. Unique in the AWS account.The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The list of inputs that are currently using this SDI source. This list will be empty if the
        # SdiSource has just been deleted.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(String)?

        # Applies only if the type is QUAD. The mode for handling the quad-link signal QUADRANT or INTERLEAVE.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The name of the SdiSource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies whether the SDI source is attached to an SDI input (IN_USE) or not (IDLE).

        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @inputs : Array(String)? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Used in DescribeNodeSummary, DescribeNodeResult.

      struct SdiSourceMapping
        include JSON::Serializable

        # A number that uniquely identifies the SDI card on the node hardware.

        @[JSON::Field(key: "cardNumber")]
        getter card_number : Int32?

        # A number that uniquely identifies a port on the SDI card.

        @[JSON::Field(key: "channelNumber")]
        getter channel_number : Int32?

        # The ID of the SdiSource to associate with this port on this card. You can use the ListSdiSources
        # operation to discover all the IDs.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : String?

        def initialize(
          @card_number : Int32? = nil,
          @channel_number : Int32? = nil,
          @sdi_source : String? = nil
        )
        end
      end

      # Used in SdiSourceMappingsUpdateRequest. One SDI source mapping. It connects one logical SdiSource to
      # the physical SDI card and port that the physical SDI source uses. You must specify all three
      # parameters in this object.

      struct SdiSourceMappingUpdateRequest
        include JSON::Serializable

        # A number that uniquely identifies the SDI card on the node hardware. For information about how
        # physical cards are identified on your node hardware, see the documentation for your node hardware.
        # The numbering always starts at 1.

        @[JSON::Field(key: "cardNumber")]
        getter card_number : Int32?

        # A number that uniquely identifies a port on the card. This must be an SDI port (not a timecode port,
        # for example). For information about how ports are identified on physical cards, see the
        # documentation for your node hardware.

        @[JSON::Field(key: "channelNumber")]
        getter channel_number : Int32?

        # The ID of a SDI source streaming on the given SDI capture card port.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : String?

        def initialize(
          @card_number : Int32? = nil,
          @channel_number : Int32? = nil,
          @sdi_source : String? = nil
        )
        end
      end

      # Used in CreateSdiSourceResponse, DeleteSdiSourceResponse, DescribeSdiSourceResponse,
      # ListSdiSourcesResponse, UpdateSdiSourceResponse

      struct SdiSourceSummary
        include JSON::Serializable

        # The ARN of this SdiSource. It is automatically assigned when the SdiSource is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the SdiSource. Unique in the AWS account.The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The list of inputs that are currently using this SDI source. This list will be empty if the
        # SdiSource has just been deleted.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(String)?

        # Applies only if the type is QUAD. The mode for handling the quad-link signal QUADRANT or INTERLEAVE.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The name of the SdiSource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies whether the SDI source is attached to an SDI input (IN_USE) or not (IDLE).

        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @inputs : Array(String)? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct SignalMapSummary
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "monitorDeploymentStatus")]
        getter monitor_deployment_status : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @monitor_deployment_status : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A receiver group is a collection of video, audio, and ancillary streams that you want to group
      # together and attach to one input.

      struct Smpte2110ReceiverGroup
        include JSON::Serializable

        # The single Smpte2110ReceiverGroupSdpSettings that identify the video, audio, and ancillary streams
        # for this receiver group.

        @[JSON::Field(key: "sdpSettings")]
        getter sdp_settings : Types::Smpte2110ReceiverGroupSdpSettings?

        def initialize(
          @sdp_settings : Types::Smpte2110ReceiverGroupSdpSettings? = nil
        )
        end
      end

      # Information about the SDP files that describe the SMPTE 2110 streams that go into one SMPTE 2110
      # receiver group.

      struct Smpte2110ReceiverGroupSdpSettings
        include JSON::Serializable

        # A list of InputSdpLocations. Each item in the list specifies the SDP file and index for one
        # ancillary SMPTE 2110 stream. Each stream encapsulates one captions stream (out of any number you can
        # include) or the single SCTE 35 stream that you can include.

        @[JSON::Field(key: "ancillarySdps")]
        getter ancillary_sdps : Array(Types::InputSdpLocation)?

        # A list of InputSdpLocations. Each item in the list specifies the SDP file and index for one audio
        # SMPTE 2110 stream.

        @[JSON::Field(key: "audioSdps")]
        getter audio_sdps : Array(Types::InputSdpLocation)?

        # The InputSdpLocation that specifies the SDP file and index for the single video SMPTE 2110 stream
        # for this 2110 input.

        @[JSON::Field(key: "videoSdp")]
        getter video_sdp : Types::InputSdpLocation?

        def initialize(
          @ancillary_sdps : Array(Types::InputSdpLocation)? = nil,
          @audio_sdps : Array(Types::InputSdpLocation)? = nil,
          @video_sdp : Types::InputSdpLocation? = nil
        )
        end
      end

      # Configures the sources for the SMPTE 2110 Receiver Group input.

      struct Smpte2110ReceiverGroupSettings
        include JSON::Serializable


        @[JSON::Field(key: "smpte2110ReceiverGroups")]
        getter smpte2110_receiver_groups : Array(Types::Smpte2110ReceiverGroup)?

        def initialize(
          @smpte2110_receiver_groups : Array(Types::Smpte2110ReceiverGroup)? = nil
        )
        end
      end

      # Smpte Tt Destination Settings

      struct SmpteTtDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # When using MediaConnect Router as the source of a MediaLive input there's a special handoff that
      # occurs when a router output is created. This group of settings is set on your behalf by the
      # MediaConnect Router service using this set of settings. This setting object can only by used by that
      # service.

      struct SpecialRouterSettings
        include JSON::Serializable

        # This is the arn of the MediaConnect Router resource being associated with the MediaLive Input.

        @[JSON::Field(key: "routerArn")]
        getter router_arn : String?

        def initialize(
          @router_arn : String? = nil
        )
        end
      end

      # The decryption settings for the SRT caller source. Present only if the source has decryption
      # enabled.

      struct SrtCallerDecryption
        include JSON::Serializable

        # The algorithm used to encrypt content.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # The ARN for the secret in Secrets Manager. Someone in your organization must create a secret and
        # provide you with its ARN. The secret holds the passphrase that MediaLive uses to decrypt the source
        # content.

        @[JSON::Field(key: "passphraseSecretArn")]
        getter passphrase_secret_arn : String?

        def initialize(
          @algorithm : String? = nil,
          @passphrase_secret_arn : String? = nil
        )
        end
      end

      # Complete these parameters only if the content is encrypted.

      struct SrtCallerDecryptionRequest
        include JSON::Serializable

        # The algorithm used to encrypt content.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # The ARN for the secret in Secrets Manager. Someone in your organization must create a secret and
        # provide you with its ARN. This secret holds the passphrase that MediaLive will use to decrypt the
        # source content.

        @[JSON::Field(key: "passphraseSecretArn")]
        getter passphrase_secret_arn : String?

        def initialize(
          @algorithm : String? = nil,
          @passphrase_secret_arn : String? = nil
        )
        end
      end

      # The configuration for a source that uses SRT as the connection protocol. In terms of establishing
      # the connection, MediaLive is always caller and the upstream system is always the listener. In terms
      # of transmission of the source content, MediaLive is always the receiver and the upstream system is
      # always the sender.

      struct SrtCallerSource
        include JSON::Serializable


        @[JSON::Field(key: "decryption")]
        getter decryption : Types::SrtCallerDecryption?

        # The preferred latency (in milliseconds) for implementing packet loss and recovery. Packet recovery
        # is a key feature of SRT.

        @[JSON::Field(key: "minimumLatency")]
        getter minimum_latency : Int32?

        # The IP address at the upstream system (the listener) that MediaLive (the caller) connects to.

        @[JSON::Field(key: "srtListenerAddress")]
        getter srt_listener_address : String?

        # The port at the upstream system (the listener) that MediaLive (the caller) connects to.

        @[JSON::Field(key: "srtListenerPort")]
        getter srt_listener_port : String?

        # The stream ID, if the upstream system uses this identifier.

        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @decryption : Types::SrtCallerDecryption? = nil,
          @minimum_latency : Int32? = nil,
          @srt_listener_address : String? = nil,
          @srt_listener_port : String? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # Configures the connection for a source that uses SRT as the connection protocol. In terms of
      # establishing the connection, MediaLive is always the caller and the upstream system is always the
      # listener. In terms of transmission of the source content, MediaLive is always the receiver and the
      # upstream system is always the sender.

      struct SrtCallerSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "decryption")]
        getter decryption : Types::SrtCallerDecryptionRequest?

        # The preferred latency (in milliseconds) for implementing packet loss and recovery. Packet recovery
        # is a key feature of SRT. Obtain this value from the operator at the upstream system.

        @[JSON::Field(key: "minimumLatency")]
        getter minimum_latency : Int32?

        # The IP address at the upstream system (the listener) that MediaLive (the caller) will connect to.

        @[JSON::Field(key: "srtListenerAddress")]
        getter srt_listener_address : String?

        # The port at the upstream system (the listener) that MediaLive (the caller) will connect to.

        @[JSON::Field(key: "srtListenerPort")]
        getter srt_listener_port : String?

        # This value is required if the upstream system uses this identifier because without it, the SRT
        # handshake between MediaLive (the caller) and the upstream system (the listener) might fail.

        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @decryption : Types::SrtCallerDecryptionRequest? = nil,
          @minimum_latency : Int32? = nil,
          @srt_listener_address : String? = nil,
          @srt_listener_port : String? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # Srt Group Settings

      struct SrtGroupSettings
        include JSON::Serializable

        # Specifies behavior of last resort when input video is lost, and no more backup inputs are available.
        # When dropTs is selected the entire transport stream will stop being emitted. When dropProgram is
        # selected the program can be dropped from the transport stream (and replaced with null packets to
        # meet the TS bitrate requirement). Or, when emitProgram is chosen the transport stream will continue
        # to be produced normally with repeat frames, black frames, or slate frames substituted for the absent
        # input video.

        @[JSON::Field(key: "inputLossAction")]
        getter input_loss_action : String?

        def initialize(
          @input_loss_action : String? = nil
        )
        end
      end


      struct SrtOutputDestinationSettings
        include JSON::Serializable

        # Arn used to extract the password from Secrets Manager

        @[JSON::Field(key: "encryptionPassphraseSecretArn")]
        getter encryption_passphrase_secret_arn : String?

        # Stream id for SRT destinations (URLs of type srt://)

        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # A URL specifying a destination

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @encryption_passphrase_secret_arn : String? = nil,
          @stream_id : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Srt Output Settings

      struct SrtOutputSettings
        include JSON::Serializable


        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::UdpContainerSettings


        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # SRT output buffering in milliseconds. A higher value increases latency through the encoder. But the
        # benefits are that it helps to maintain a constant, low-jitter SRT output, and it accommodates clock
        # recovery, input switching, input disruptions, picture reordering, and so on. Range: 0-10000
        # milliseconds.

        @[JSON::Field(key: "bufferMsec")]
        getter buffer_msec : Int32?

        # The encryption level for the content. Valid values are AES128, AES192, AES256. You and the
        # downstream system should plan how to set this field because the values must not conflict with each
        # other.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # The latency value, in milliseconds, that is proposed during the SRT connection handshake. SRT will
        # choose the maximum of the values proposed by the sender and receiver. On the sender side, latency is
        # the amount of time a packet is held to give it a chance to be delivered successfully. On the
        # receiver side, latency is the amount of time the packet is held before delivering to the
        # application, aiding in packet recovery and matching as closely as possible the packet timing of the
        # sender. Range: 40-16000 milliseconds.

        @[JSON::Field(key: "latency")]
        getter latency : Int32?

        def initialize(
          @container_settings : Types::UdpContainerSettings,
          @destination : Types::OutputLocationRef,
          @buffer_msec : Int32? = nil,
          @encryption_type : String? = nil,
          @latency : Int32? = nil
        )
        end
      end

      # The configured sources for this SRT input.

      struct SrtSettings
        include JSON::Serializable


        @[JSON::Field(key: "srtCallerSources")]
        getter srt_caller_sources : Array(Types::SrtCallerSource)?

        def initialize(
          @srt_caller_sources : Array(Types::SrtCallerSource)? = nil
        )
        end
      end

      # Configures the sources for this SRT input. For a single-pipeline input, include one srtCallerSource
      # in the array. For a standard-pipeline input, include two srtCallerSource.

      struct SrtSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "srtCallerSources")]
        getter srt_caller_sources : Array(Types::SrtCallerSourceRequest)?

        def initialize(
          @srt_caller_sources : Array(Types::SrtCallerSourceRequest)? = nil
        )
        end
      end

      # Standard Hls Settings

      struct StandardHlsSettings
        include JSON::Serializable


        @[JSON::Field(key: "m3u8Settings")]
        getter m3u8_settings : Types::M3u8Settings

        # List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs
        # that are associated to the video, separate by ','.

        @[JSON::Field(key: "audioRenditionSets")]
        getter audio_rendition_sets : String?

        def initialize(
          @m3u8_settings : Types::M3u8Settings,
          @audio_rendition_sets : String? = nil
        )
        end
      end


      struct StartChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct StartChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end


      struct StartDeleteMonitorDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct StartDeleteMonitorDeploymentResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @id : String? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_changes_pending_deployment : Bool? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartDeleteMonitorDeploymentResponseContent
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # If true, there are pending monitor changes for this signal map that can be deployed.

        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Error message associated with a failed creation or failed update attempt of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @discovery_entry_point_arn : String,
          @id : String,
          @monitor_changes_pending_deployment : Bool,
          @name : String,
          @status : String,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartInputDeviceMaintenanceWindowRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct StartInputDeviceMaintenanceWindowResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct StartInputDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartMonitorDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        def initialize(
          @identifier : String,
          @dry_run : Bool? = nil
        )
        end
      end


      struct StartMonitorDeploymentRequestContent
        include JSON::Serializable


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        def initialize(
          @dry_run : Bool? = nil
        )
        end
      end


      struct StartMonitorDeploymentResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @id : String? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_changes_pending_deployment : Bool? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartMonitorDeploymentResponseContent
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # If true, there are pending monitor changes for this signal map that can be deployed.

        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Error message associated with a failed creation or failed update attempt of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @discovery_entry_point_arn : String,
          @id : String,
          @monitor_changes_pending_deployment : Bool,
          @name : String,
          @status : String,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String

        def initialize(
          @multiplex_id : String
        )
        end
      end


      struct StartMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MultiplexOutputDestination)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @destinations : Array(Types::MultiplexOutputDestination)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Settings to identify the start of the clip.

      struct StartTimecode
        include JSON::Serializable

        # The timecode for the frame where you want to start the clip. Optional; if not specified, the clip
        # starts at first frame in the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.

        @[JSON::Field(key: "timecode")]
        getter timecode : String?

        def initialize(
          @timecode : String? = nil
        )
        end
      end


      struct StartUpdateSignalMapRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIdentifiers")]
        getter cloud_watch_alarm_template_group_identifiers : Array(String)?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIdentifiers")]
        getter event_bridge_rule_template_group_identifiers : Array(String)?


        @[JSON::Field(key: "forceRediscovery")]
        getter force_rediscovery : Bool?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @event_bridge_rule_template_group_identifiers : Array(String)? = nil,
          @force_rediscovery : Bool? = nil,
          @name : String? = nil
        )
        end
      end


      struct StartUpdateSignalMapRequestContent
        include JSON::Serializable


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIdentifiers")]
        getter cloud_watch_alarm_template_group_identifiers : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIdentifiers")]
        getter event_bridge_rule_template_group_identifiers : Array(String)?

        # If true, will force a rediscovery of a signal map if an unchanged discoveryEntryPointArn is
        # provided.

        @[JSON::Field(key: "forceRediscovery")]
        getter force_rediscovery : Bool?

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @event_bridge_rule_template_group_identifiers : Array(String)? = nil,
          @force_rediscovery : Bool? = nil,
          @name : String? = nil
        )
        end
      end


      struct StartUpdateSignalMapResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @discovery_entry_point_arn : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @id : String? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_changes_pending_deployment : Bool? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartUpdateSignalMapResponseContent
        include JSON::Serializable

        # A signal map's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A top-level supported AWS resource ARN to discovery a signal map from.

        @[JSON::Field(key: "discoveryEntryPointArn")]
        getter discovery_entry_point_arn : String

        # A signal map's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # If true, there are pending monitor changes for this signal map that can be deployed.

        @[JSON::Field(key: "monitorChangesPendingDeployment")]
        getter monitor_changes_pending_deployment : Bool

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "cloudWatchAlarmTemplateGroupIds")]
        getter cloud_watch_alarm_template_group_ids : Array(String)?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Error message associated with a failed creation or failed update attempt of a signal map.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "eventBridgeRuleTemplateGroupIds")]
        getter event_bridge_rule_template_group_ids : Array(String)?


        @[JSON::Field(key: "failedMediaResourceMap")]
        getter failed_media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "lastDiscoveredAt")]
        getter last_discovered_at : Time?


        @[JSON::Field(key: "lastSuccessfulMonitorDeployment")]
        getter last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment?


        @[JSON::Field(key: "mediaResourceMap")]
        getter media_resource_map : Hash(String, Types::MediaResource)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "monitorDeployment")]
        getter monitor_deployment : Types::MonitorDeployment?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @discovery_entry_point_arn : String,
          @id : String,
          @monitor_changes_pending_deployment : Bool,
          @name : String,
          @status : String,
          @cloud_watch_alarm_template_group_ids : Array(String)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @event_bridge_rule_template_group_ids : Array(String)? = nil,
          @failed_media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @last_discovered_at : Time? = nil,
          @last_successful_monitor_deployment : Types::SuccessfulMonitorDeployment? = nil,
          @media_resource_map : Hash(String, Types::MediaResource)? = nil,
          @modified_at : Time? = nil,
          @monitor_deployment : Types::MonitorDeployment? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Settings for the action to activate a static image.

      struct StaticImageActivateScheduleActionSettings
        include JSON::Serializable

        # The location and filename of the image file to overlay on the video. The file must be a 32-bit BMP,
        # PNG, or TGA file, and must not be larger (in pixels) than the input video.

        @[JSON::Field(key: "image")]
        getter image : Types::InputLocation

        # The duration in milliseconds for the image to remain on the video. If omitted or set to 0 the
        # duration is unlimited and the image will remain until it is explicitly deactivated.

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # The time in milliseconds for the image to fade in. The fade-in starts at the start time of the
        # overlay. Default is 0 (no fade-in).

        @[JSON::Field(key: "fadeIn")]
        getter fade_in : Int32?

        # Applies only if a duration is specified. The time in milliseconds for the image to fade out. The
        # fade-out starts when the duration time is hit, so it effectively extends the duration. Default is 0
        # (no fade-out).

        @[JSON::Field(key: "fadeOut")]
        getter fade_out : Int32?

        # The height of the image when inserted into the video, in pixels. The overlay will be scaled up or
        # down to the specified height. Leave blank to use the native height of the overlay.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Placement of the left edge of the overlay relative to the left edge of the video frame, in pixels. 0
        # (the default) is the left edge of the frame. If the placement causes the overlay to extend beyond
        # the right edge of the underlying video, then the overlay is cropped on the right.

        @[JSON::Field(key: "imageX")]
        getter image_x : Int32?

        # Placement of the top edge of the overlay relative to the top edge of the video frame, in pixels. 0
        # (the default) is the top edge of the frame. If the placement causes the overlay to extend beyond the
        # bottom edge of the underlying video, then the overlay is cropped on the bottom.

        @[JSON::Field(key: "imageY")]
        getter image_y : Int32?

        # The number of the layer, 0 to 7. There are 8 layers that can be overlaid on the video, each layer
        # with a different image. The layers are in Z order, which means that overlays with higher values of
        # layer are inserted on top of overlays with lower values of layer. Default is 0.

        @[JSON::Field(key: "layer")]
        getter layer : Int32?

        # Opacity of image where 0 is transparent and 100 is fully opaque. Default is 100.

        @[JSON::Field(key: "opacity")]
        getter opacity : Int32?

        # The width of the image when inserted into the video, in pixels. The overlay will be scaled up or
        # down to the specified width. Leave blank to use the native width of the overlay.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @image : Types::InputLocation,
          @duration : Int32? = nil,
          @fade_in : Int32? = nil,
          @fade_out : Int32? = nil,
          @height : Int32? = nil,
          @image_x : Int32? = nil,
          @image_y : Int32? = nil,
          @layer : Int32? = nil,
          @opacity : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Settings for the action to deactivate the image in a specific layer.

      struct StaticImageDeactivateScheduleActionSettings
        include JSON::Serializable

        # The time in milliseconds for the image to fade out. Default is 0 (no fade-out).

        @[JSON::Field(key: "fadeOut")]
        getter fade_out : Int32?

        # The image overlay layer to deactivate, 0 to 7. Default is 0.

        @[JSON::Field(key: "layer")]
        getter layer : Int32?

        def initialize(
          @fade_out : Int32? = nil,
          @layer : Int32? = nil
        )
        end
      end

      # Settings for the action to activate a static image.

      struct StaticImageOutputActivateScheduleActionSettings
        include JSON::Serializable

        # The location and filename of the image file to overlay on the video. The file must be a 32-bit BMP,
        # PNG, or TGA file, and must not be larger (in pixels) than the input video.

        @[JSON::Field(key: "image")]
        getter image : Types::InputLocation

        # The name(s) of the output(s) the activation should apply to.

        @[JSON::Field(key: "outputNames")]
        getter output_names : Array(String)

        # The duration in milliseconds for the image to remain on the video. If omitted or set to 0 the
        # duration is unlimited and the image will remain until it is explicitly deactivated.

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # The time in milliseconds for the image to fade in. The fade-in starts at the start time of the
        # overlay. Default is 0 (no fade-in).

        @[JSON::Field(key: "fadeIn")]
        getter fade_in : Int32?

        # Applies only if a duration is specified. The time in milliseconds for the image to fade out. The
        # fade-out starts when the duration time is hit, so it effectively extends the duration. Default is 0
        # (no fade-out).

        @[JSON::Field(key: "fadeOut")]
        getter fade_out : Int32?

        # The height of the image when inserted into the video, in pixels. The overlay will be scaled up or
        # down to the specified height. Leave blank to use the native height of the overlay.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Placement of the left edge of the overlay relative to the left edge of the video frame, in pixels. 0
        # (the default) is the left edge of the frame. If the placement causes the overlay to extend beyond
        # the right edge of the underlying video, then the overlay is cropped on the right.

        @[JSON::Field(key: "imageX")]
        getter image_x : Int32?

        # Placement of the top edge of the overlay relative to the top edge of the video frame, in pixels. 0
        # (the default) is the top edge of the frame. If the placement causes the overlay to extend beyond the
        # bottom edge of the underlying video, then the overlay is cropped on the bottom.

        @[JSON::Field(key: "imageY")]
        getter image_y : Int32?

        # The number of the layer, 0 to 7. There are 8 layers that can be overlaid on the video, each layer
        # with a different image. The layers are in Z order, which means that overlays with higher values of
        # layer are inserted on top of overlays with lower values of layer. Default is 0.

        @[JSON::Field(key: "layer")]
        getter layer : Int32?

        # Opacity of image where 0 is transparent and 100 is fully opaque. Default is 100.

        @[JSON::Field(key: "opacity")]
        getter opacity : Int32?

        # The width of the image when inserted into the video, in pixels. The overlay will be scaled up or
        # down to the specified width. Leave blank to use the native width of the overlay.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @image : Types::InputLocation,
          @output_names : Array(String),
          @duration : Int32? = nil,
          @fade_in : Int32? = nil,
          @fade_out : Int32? = nil,
          @height : Int32? = nil,
          @image_x : Int32? = nil,
          @image_y : Int32? = nil,
          @layer : Int32? = nil,
          @opacity : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Settings for the action to deactivate the image in a specific layer.

      struct StaticImageOutputDeactivateScheduleActionSettings
        include JSON::Serializable

        # The name(s) of the output(s) the deactivation should apply to.

        @[JSON::Field(key: "outputNames")]
        getter output_names : Array(String)

        # The time in milliseconds for the image to fade out. Default is 0 (no fade-out).

        @[JSON::Field(key: "fadeOut")]
        getter fade_out : Int32?

        # The image overlay layer to deactivate, 0 to 7. Default is 0.

        @[JSON::Field(key: "layer")]
        getter layer : Int32?

        def initialize(
          @output_names : Array(String),
          @fade_out : Int32? = nil,
          @layer : Int32? = nil
        )
        end
      end

      # Static Key Settings

      struct StaticKeySettings
        include JSON::Serializable

        # Static key value as a 32 character hexadecimal string.

        @[JSON::Field(key: "staticKeyValue")]
        getter static_key_value : String

        # The URL of the license server used for protecting content.

        @[JSON::Field(key: "keyProviderServer")]
        getter key_provider_server : Types::InputLocation?

        def initialize(
          @static_key_value : String,
          @key_provider_server : Types::InputLocation? = nil
        )
        end
      end


      struct StopChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        def initialize(
          @channel_id : String
        )
        end
      end


      struct StopChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::DescribeAnywhereSettings?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionResponse?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::ChannelEgressEndpoint)?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::DescribeLinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceStatus?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelineDetails")]
        getter pipeline_details : Array(Types::PipelineDetail)?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcOutputSettingsDescription?

        def initialize(
          @anywhere_settings : Types::DescribeAnywhereSettings? = nil,
          @arn : String? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_class : String? = nil,
          @channel_engine_version : Types::ChannelEngineVersionResponse? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @egress_endpoints : Array(Types::ChannelEgressEndpoint)? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @id : String? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::DescribeLinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceStatus? = nil,
          @name : String? = nil,
          @pipeline_details : Array(Types::PipelineDetail)? = nil,
          @pipelines_running_count : Int32? = nil,
          @role_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc : Types::VpcOutputSettingsDescription? = nil
        )
        end
      end


      struct StopInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String

        def initialize(
          @input_device_id : String
        )
        end
      end


      struct StopInputDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String

        def initialize(
          @multiplex_id : String
        )
        end
      end


      struct StopMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::MultiplexOutputDestination)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "pipelinesRunningCount")]
        getter pipelines_running_count : Int32?


        @[JSON::Field(key: "programCount")]
        getter program_count : Int32?


        @[JSON::Field(key: "state")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zones : Array(String)? = nil,
          @destinations : Array(Types::MultiplexOutputDestination)? = nil,
          @id : String? = nil,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @pipelines_running_count : Int32? = nil,
          @program_count : Int32? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Settings to identify the end of the clip.

      struct StopTimecode
        include JSON::Serializable

        # If you specify a StopTimecode in an input (in order to clip the file), you can specify if you want
        # the clip to exclude (the default) or include the frame specified by the timecode.

        @[JSON::Field(key: "lastFrameClippingBehavior")]
        getter last_frame_clipping_behavior : String?

        # The timecode for the frame where you want to stop the clip. Optional; if not specified, the clip
        # continues to the end of the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.

        @[JSON::Field(key: "timecode")]
        getter timecode : String?

        def initialize(
          @last_frame_clipping_behavior : String? = nil,
          @timecode : String? = nil
        )
        end
      end

      # Represents the latest successful monitor deployment of a signal map.

      struct SuccessfulMonitorDeployment
        include JSON::Serializable

        # URI associated with a signal map's monitor deployment.

        @[JSON::Field(key: "detailsUri")]
        getter details_uri : String


        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @details_uri : String,
          @status : String
        )
        end
      end


      struct TagsModel
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Teletext Destination Settings

      struct TeletextDestinationSettings
        include JSON::Serializable

        def initialize
        end
      end

      # Teletext Source Settings

      struct TeletextSourceSettings
        include JSON::Serializable

        # Optionally defines a region where TTML style captions will be displayed

        @[JSON::Field(key: "outputRectangle")]
        getter output_rectangle : Types::CaptionRectangle?

        # Specifies the teletext page number within the data stream from which to extract captions. Range of
        # 0x100 (256) to 0x8FF (2303). Unused for passthrough. Should be specified as a hexadecimal string
        # with no "0x" prefix.

        @[JSON::Field(key: "pageNumber")]
        getter page_number : String?

        def initialize(
          @output_rectangle : Types::CaptionRectangle? = nil,
          @page_number : String? = nil
        )
        end
      end

      # Temporal Filter Settings

      struct TemporalFilterSettings
        include JSON::Serializable

        # If you enable this filter, the results are the following: - If the source content is noisy (it
        # contains excessive digital artifacts), the filter cleans up the source. - If the source content is
        # already clean, the filter tends to decrease the bitrate, especially when the rate control mode is
        # QVBR.

        @[JSON::Field(key: "postFilterSharpening")]
        getter post_filter_sharpening : String?

        # Choose a filter strength. We recommend a strength of 1 or 2. A higher strength might take out good
        # information, resulting in an image that is overly soft.

        @[JSON::Field(key: "strength")]
        getter strength : String?

        def initialize(
          @post_filter_sharpening : String? = nil,
          @strength : String? = nil
        )
        end
      end

      # Details of a single thumbnail

      struct Thumbnail
        include JSON::Serializable

        # The binary data for the latest thumbnail.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The content type for the latest thumbnail.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # Thumbnail Type

        @[JSON::Field(key: "thumbnailType")]
        getter thumbnail_type : String?


        @[JSON::Field(key: "timeStamp")]
        getter time_stamp : Time?

        def initialize(
          @body : String? = nil,
          @content_type : String? = nil,
          @thumbnail_type : String? = nil,
          @time_stamp : Time? = nil
        )
        end
      end

      # Thumbnail Configuration

      struct ThumbnailConfiguration
        include JSON::Serializable

        # Enables the thumbnail feature. The feature generates thumbnails of the incoming video in each
        # pipeline in the channel. AUTO turns the feature on, DISABLE turns the feature off.

        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The binary data for the thumbnail that the Link device has most recently sent to MediaLive.

      struct ThumbnailData
        include JSON::Serializable

        # The binary data for the thumbnail that the Link device has most recently sent to MediaLive.

        @[JSON::Field(key: "body")]
        getter body : String?

        def initialize(
          @body : String? = nil
        )
        end
      end

      # Thumbnail details for one pipeline of a running channel.

      struct ThumbnailDetail
        include JSON::Serializable

        # Pipeline ID

        @[JSON::Field(key: "pipelineId")]
        getter pipeline_id : String?

        # thumbnails of a single pipeline

        @[JSON::Field(key: "thumbnails")]
        getter thumbnails : Array(Types::Thumbnail)?

        def initialize(
          @pipeline_id : String? = nil,
          @thumbnails : Array(Types::Thumbnail)? = nil
        )
        end
      end

      # Response when thumbnail has no data. It should have no message.

      struct ThumbnailNoData
        include JSON::Serializable

        def initialize
        end
      end

      # Timecode Burnin Settings

      struct TimecodeBurninSettings
        include JSON::Serializable

        # Choose a timecode burn-in font size

        @[JSON::Field(key: "fontSize")]
        getter font_size : String

        # Choose a timecode burn-in output position

        @[JSON::Field(key: "position")]
        getter position : String

        # Create a timecode burn-in prefix (optional)

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @font_size : String,
          @position : String,
          @prefix : String? = nil
        )
        end
      end

      # Timecode Config

      struct TimecodeConfig
        include JSON::Serializable

        # Identifies the source for the timecode that will be associated with the events outputs. -Embedded
        # (embedded): Initialize the output timecode with timecode from the the source. If no embedded
        # timecode is detected in the source, the system falls back to using "Start at 0" (zerobased). -System
        # Clock (systemclock): Use the UTC time. -Start at 0 (zerobased): The time of the first frame of the
        # event will be 00:00:00:00.

        @[JSON::Field(key: "source")]
        getter source : String

        # Threshold in frames beyond which output timecode is resynchronized to the input timecode.
        # Discrepancies below this threshold are permitted to avoid unnecessary discontinuities in the output
        # timecode. No timecode sync when this is not specified.

        @[JSON::Field(key: "syncThreshold")]
        getter sync_threshold : Int32?

        def initialize(
          @source : String,
          @sync_threshold : Int32? = nil
        )
        end
      end

      # Settings for the action to insert ID3 metadata (as a one-time action) in applicable output groups.

      struct TimedMetadataScheduleActionSettings
        include JSON::Serializable

        # Enter a base64 string that contains one or more fully formed ID3 tags.See the ID3 specification:
        # http://id3.org/id3v2.4.0-structure

        @[JSON::Field(key: "id3")]
        getter id3 : String

        def initialize(
          @id3 : String
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

      # Request was denied due to request throttling.

      struct TooManyRequestsExceptionResponseContent
        include JSON::Serializable

        # Exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The transfer details of the input device.

      struct TransferInputDevice
        include JSON::Serializable

        # The AWS account ID (12 digits) for the recipient of the device transfer.

        @[JSON::Field(key: "targetCustomerId")]
        getter target_customer_id : String?

        # The target AWS region to transfer the device.

        @[JSON::Field(key: "targetRegion")]
        getter target_region : String?

        # An optional message for the recipient. Maximum 280 characters.

        @[JSON::Field(key: "transferMessage")]
        getter transfer_message : String?

        def initialize(
          @target_customer_id : String? = nil,
          @target_region : String? = nil,
          @transfer_message : String? = nil
        )
        end
      end


      struct TransferInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String


        @[JSON::Field(key: "targetCustomerId")]
        getter target_customer_id : String?


        @[JSON::Field(key: "targetRegion")]
        getter target_region : String?


        @[JSON::Field(key: "transferMessage")]
        getter transfer_message : String?

        def initialize(
          @input_device_id : String,
          @target_customer_id : String? = nil,
          @target_region : String? = nil,
          @transfer_message : String? = nil
        )
        end
      end


      struct TransferInputDeviceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Details about the input device that is being transferred.

      struct TransferringInputDeviceSummary
        include JSON::Serializable

        # The unique ID of the input device.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The optional message that the sender has attached to the transfer.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The AWS account ID for the recipient of the input device transfer.

        @[JSON::Field(key: "targetCustomerId")]
        getter target_customer_id : String?

        # The type (direction) of the input device transfer.

        @[JSON::Field(key: "transferType")]
        getter transfer_type : String?

        def initialize(
          @id : String? = nil,
          @message : String? = nil,
          @target_customer_id : String? = nil,
          @transfer_type : String? = nil
        )
        end
      end

      # Ttml Destination Settings

      struct TtmlDestinationSettings
        include JSON::Serializable

        # This field is not currently supported and will not affect the output styling. Leave the default
        # value.

        @[JSON::Field(key: "styleControl")]
        getter style_control : String?

        def initialize(
          @style_control : String? = nil
        )
        end
      end

      # Udp Container Settings

      struct UdpContainerSettings
        include JSON::Serializable


        @[JSON::Field(key: "m2tsSettings")]
        getter m2ts_settings : Types::M2tsSettings?

        def initialize(
          @m2ts_settings : Types::M2tsSettings? = nil
        )
        end
      end

      # Udp Group Settings

      struct UdpGroupSettings
        include JSON::Serializable

        # Specifies behavior of last resort when input video is lost, and no more backup inputs are available.
        # When dropTs is selected the entire transport stream will stop being emitted. When dropProgram is
        # selected the program can be dropped from the transport stream (and replaced with null packets to
        # meet the TS bitrate requirement). Or, when emitProgram is chosen the transport stream will continue
        # to be produced normally with repeat frames, black frames, or slate frames substituted for the absent
        # input video.

        @[JSON::Field(key: "inputLossAction")]
        getter input_loss_action : String?

        # Indicates ID3 frame that has the timecode.

        @[JSON::Field(key: "timedMetadataId3Frame")]
        getter timed_metadata_id3_frame : String?

        # Timed Metadata interval in seconds.

        @[JSON::Field(key: "timedMetadataId3Period")]
        getter timed_metadata_id3_period : Int32?

        def initialize(
          @input_loss_action : String? = nil,
          @timed_metadata_id3_frame : String? = nil,
          @timed_metadata_id3_period : Int32? = nil
        )
        end
      end

      # Udp Output Settings

      struct UdpOutputSettings
        include JSON::Serializable


        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::UdpContainerSettings

        # Destination address and port number for RTP or UDP packets. Can be unicast or multicast RTP or UDP
        # (eg. rtp://239.10.10.10:5001 or udp://10.100.100.100:5002).

        @[JSON::Field(key: "destination")]
        getter destination : Types::OutputLocationRef

        # UDP output buffering in milliseconds. Larger values increase latency through the transcoder but
        # simultaneously assist the transcoder in maintaining a constant, low-jitter UDP/RTP output while
        # accommodating clock recovery, input switching, input disruptions, picture reordering, etc.

        @[JSON::Field(key: "bufferMsec")]
        getter buffer_msec : Int32?

        # Settings for enabling and adjusting Forward Error Correction on UDP outputs.

        @[JSON::Field(key: "fecOutputSettings")]
        getter fec_output_settings : Types::FecOutputSettings?

        def initialize(
          @container_settings : Types::UdpContainerSettings,
          @destination : Types::OutputLocationRef,
          @buffer_msec : Int32? = nil,
          @fec_output_settings : Types::FecOutputSettings? = nil
        )
        end
      end


      struct UnprocessableEntityException
        include JSON::Serializable


        @[JSON::Field(key: "elementPath")]
        getter element_path : String?


        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @element_path : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct UpdateAccountConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end

      # The desired new account configuration.

      struct UpdateAccountConfigurationRequestModel
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end


      struct UpdateAccountConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end

      # The account's updated configuration.

      struct UpdateAccountConfigurationResultModel
        include JSON::Serializable


        @[JSON::Field(key: "accountConfiguration")]
        getter account_configuration : Types::AccountConfiguration?

        def initialize(
          @account_configuration : Types::AccountConfiguration? = nil
        )
        end
      end


      struct UpdateChannel
        include JSON::Serializable

        # The Elemental Anywhere settings for this channel.

        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::AnywhereSettings?

        # Specification of CDI inputs for this channel

        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?

        # Channel engine version for this channel

        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionRequest?

        # A list of output destinations for this channel.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The encoder settings for this channel.

        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?

        # Specification of network and file inputs for this channel

        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?

        # The linked channel settings for the channel.

        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::LinkedChannelSettings?

        # The log level to write to CloudWatch Logs.

        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # Maintenance settings for this channel.

        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceUpdateSettings?

        # The name of the channel.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not
        # specify this on an update call but the role was previously set that role will be removed.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @anywhere_settings : Types::AnywhereSettings? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @dry_run : Bool? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::LinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceUpdateSettings? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateChannelClass
        include JSON::Serializable

        # The channel class that you wish to update this channel to use.

        @[JSON::Field(key: "channelClass")]
        getter channel_class : String

        # A list of output destinations for this channel.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?

        def initialize(
          @channel_class : String,
          @destinations : Array(Types::OutputDestination)? = nil
        )
        end
      end


      struct UpdateChannelClassRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelClass")]
        getter channel_class : String


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?

        def initialize(
          @channel_class : String,
          @channel_id : String,
          @destinations : Array(Types::OutputDestination)? = nil
        )
        end
      end


      struct UpdateChannelClassResponse
        include JSON::Serializable


        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end

      # Used in the UpdateChannelPlacementGroup operation.

      struct UpdateChannelPlacementGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelPlacementGroupId")]
        getter channel_placement_group_id : String


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # Include this parameter only if you want to change the current name of the ChannelPlacementGroup.
        # Specify a name that is unique in the Cluster. You can't change the name. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Include this parameter only if you want to change the list of Nodes that are associated with the
        # ChannelPlacementGroup.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?

        def initialize(
          @channel_placement_group_id : String,
          @cluster_id : String,
          @name : String? = nil,
          @nodes : Array(String)? = nil
        )
        end
      end


      struct UpdateChannelPlacementGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channels : Array(String)? = nil,
          @cluster_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @nodes : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "anywhereSettings")]
        getter anywhere_settings : Types::AnywhereSettings?


        @[JSON::Field(key: "cdiInputSpecification")]
        getter cdi_input_specification : Types::CdiInputSpecification?


        @[JSON::Field(key: "channelEngineVersion")]
        getter channel_engine_version : Types::ChannelEngineVersionRequest?


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::OutputDestination)?


        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?


        @[JSON::Field(key: "encoderSettings")]
        getter encoder_settings : Types::EncoderSettings?


        @[JSON::Field(key: "inputAttachments")]
        getter input_attachments : Array(Types::InputAttachment)?


        @[JSON::Field(key: "inputSpecification")]
        getter input_specification : Types::InputSpecification?


        @[JSON::Field(key: "linkedChannelSettings")]
        getter linked_channel_settings : Types::LinkedChannelSettings?


        @[JSON::Field(key: "logLevel")]
        getter log_level : String?


        @[JSON::Field(key: "maintenance")]
        getter maintenance : Types::MaintenanceUpdateSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @channel_id : String,
          @anywhere_settings : Types::AnywhereSettings? = nil,
          @cdi_input_specification : Types::CdiInputSpecification? = nil,
          @channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
          @destinations : Array(Types::OutputDestination)? = nil,
          @dry_run : Bool? = nil,
          @encoder_settings : Types::EncoderSettings? = nil,
          @input_attachments : Array(Types::InputAttachment)? = nil,
          @input_specification : Types::InputSpecification? = nil,
          @linked_channel_settings : Types::LinkedChannelSettings? = nil,
          @log_level : String? = nil,
          @maintenance : Types::MaintenanceUpdateSettings? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end

      # The updated channel's description.

      struct UpdateChannelResultModel
        include JSON::Serializable


        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @identifier : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateGroupRequestContent
        include JSON::Serializable

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateGroupResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?


        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?


        @[JSON::Field(key: "metricName")]
        getter metric_name : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "period")]
        getter period : Int32?


        @[JSON::Field(key: "statistic")]
        getter statistic : String?


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String?


        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @identifier : String,
          @comparison_operator : String? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @evaluation_periods : Int32? = nil,
          @group_identifier : String? = nil,
          @metric_name : String? = nil,
          @name : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @target_resource_type : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateRequestContent
        include JSON::Serializable


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?

        # A cloudwatch alarm template group's identifier. Can be either be its id or current name.

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32?


        @[JSON::Field(key: "statistic")]
        getter statistic : String?


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String?

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @comparison_operator : String? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @evaluation_periods : Int32? = nil,
          @group_identifier : String? = nil,
          @metric_name : String? = nil,
          @name : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @target_resource_type : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "metricName")]
        getter metric_name : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "period")]
        getter period : Int32?


        @[JSON::Field(key: "statistic")]
        getter statistic : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String?


        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @arn : String? = nil,
          @comparison_operator : String? = nil,
          @created_at : Time? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @evaluation_periods : Int32? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @metric_name : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @period : Int32? = nil,
          @statistic : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_resource_type : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end


      struct UpdateCloudWatchAlarmTemplateResponseContent
        include JSON::Serializable

        # A cloudwatch alarm template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of periods over which data is compared to the specified threshold.

        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # A cloudwatch alarm template group's id. AWS provided template groups have ids that start with `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # A cloudwatch alarm template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the metric associated with the alarm. Must be compatible with targetResourceType.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The period, in seconds, over which the specified statistic is applied.

        @[JSON::Field(key: "period")]
        getter period : Int32


        @[JSON::Field(key: "statistic")]
        getter statistic : String


        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : String

        # The threshold value to compare with the specified statistic.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64


        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String

        # The number of datapoints within the evaluation period that must be breaching to trigger the alarm.

        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @comparison_operator : String,
          @created_at : Time,
          @evaluation_periods : Int32,
          @group_id : String,
          @id : String,
          @metric_name : String,
          @name : String,
          @period : Int32,
          @statistic : String,
          @target_resource_type : String,
          @threshold : Float64,
          @treat_missing_data : String,
          @datapoints_to_alarm : Int32? = nil,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Used in the UpdatedCluster operation.

      struct UpdateClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # Include this parameter only if you want to change the current name of the Cluster. Specify a name
        # that is unique in the AWS account. You can't change the name. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Include this property only if you want to change the current connections between the Nodes in the
        # Cluster and the Networks the Cluster is associated with.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettingsUpdateRequest?

        def initialize(
          @cluster_id : String,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettingsUpdateRequest? = nil
        )
        end
      end


      struct UpdateClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?


        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end

      # The name that you specified for the Cluster.

      struct UpdateClusterResult
        include JSON::Serializable

        # The ARN of the Cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of the IDs of the Channels that are associated with this Cluster. One Channel is associated
        # with the Cluster as follows: A Channel belongs to a ChannelPlacementGroup. A ChannelPlacementGroup
        # is attached to a Node. A Node belongs to a Cluster.

        @[JSON::Field(key: "channelIds")]
        getter channel_ids : Array(String)?

        # The hardware type for the Cluster

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The unique ID of the Cluster.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The user-specified name of the Cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Network settings that connect the Nodes in the Cluster to one or more of the Networks that the
        # Cluster is associated with.

        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::ClusterNetworkSettings?

        # The current state of the Cluster.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_ids : Array(String)? = nil,
          @cluster_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @network_settings : Types::ClusterNetworkSettings? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @identifier : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateGroupRequestContent
        include JSON::Serializable

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateGroupResponseContent
        include JSON::Serializable

        # An eventbridge rule template group's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "eventType")]
        getter event_type : String?


        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @event_type : String? = nil,
          @group_identifier : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateRequestContent
        include JSON::Serializable

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # An eventbridge rule template group's identifier. Can be either be its id or current name.

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @event_type : String? = nil,
          @group_identifier : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "eventType")]
        getter event_type : String?


        @[JSON::Field(key: "groupId")]
        getter group_id : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @event_type : String? = nil,
          @group_id : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateEventBridgeRuleTemplateResponseContent
        include JSON::Serializable

        # An eventbridge rule template's ARN (Amazon Resource Name)

        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "createdAt")]
        getter created_at : Time


        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # An eventbridge rule template group's id. AWS provided template groups have ids that start with
        # `aws-`

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # An eventbridge rule template's id. AWS provided templates have ids that start with `aws-`

        @[JSON::Field(key: "id")]
        getter id : String

        # A resource's name. Names must be unique within the scope of a resource type in a specific region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A resource's optional description.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "eventTargets")]
        getter event_targets : Array(Types::EventBridgeRuleTemplateTarget)?


        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @event_type : String,
          @group_id : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
          @modified_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateInput
        include JSON::Serializable

        # Destination settings for PUSH type inputs.

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestinationRequest)?

        # Settings for the devices.

        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceRequest)?

        # A list of security groups referenced by IDs to attach to the input.

        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(String)?

        # A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can
        # specify as few as one Flow and presently, as many as two. The only requirement is when you have more
        # than one is that each Flow is in a separate Availability Zone as this ensures your EML input is
        # redundant to AZ issues.

        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlowRequest)?

        # Multicast Input settings.

        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettingsUpdateRequest?

        # Name of the input.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the role this input assumes during and after creation.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?

        # Include this parameter if the input is a SMPTE 2110 input, to identify the stream sources for this
        # input.

        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?

        # The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for
        # redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSourceRequest)?

        # When using MediaConnect Router as the source of a MediaLive input there's a special handoff that
        # occurs when a router output is created. This group of settings is set on your behalf by the
        # MediaConnect Router service using this set of settings. This setting object can only by used by that
        # service.

        @[JSON::Field(key: "specialRouterSettings")]
        getter special_router_settings : Types::SpecialRouterSettings?

        # The settings associated with an SRT input.

        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettingsRequest?

        def initialize(
          @destinations : Array(Types::InputDestinationRequest)? = nil,
          @input_devices : Array(Types::InputDeviceRequest)? = nil,
          @input_security_groups : Array(String)? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
          @multicast_settings : Types::MulticastSettingsUpdateRequest? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @sdi_sources : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSourceRequest)? = nil,
          @special_router_settings : Types::SpecialRouterSettings? = nil,
          @srt_settings : Types::SrtSettingsRequest? = nil
        )
        end
      end

      # Updates an input device.

      struct UpdateInputDevice
        include JSON::Serializable

        # The Availability Zone you want associated with this input device.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The settings that you want to apply to the HD input device.

        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceConfigurableSettings?

        # The name that you assigned to this input device (not the unique ID).

        @[JSON::Field(key: "name")]
        getter name : String?

        # The settings that you want to apply to the UHD input device.

        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceConfigurableSettings?

        def initialize(
          @availability_zone : String? = nil,
          @hd_device_settings : Types::InputDeviceConfigurableSettings? = nil,
          @name : String? = nil,
          @uhd_device_settings : Types::InputDeviceConfigurableSettings? = nil
        )
        end
      end


      struct UpdateInputDeviceRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputDeviceId")]
        getter input_device_id : String


        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?


        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceConfigurableSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceConfigurableSettings?

        def initialize(
          @input_device_id : String,
          @availability_zone : String? = nil,
          @hd_device_settings : Types::InputDeviceConfigurableSettings? = nil,
          @name : String? = nil,
          @uhd_device_settings : Types::InputDeviceConfigurableSettings? = nil
        )
        end
      end


      struct UpdateInputDeviceResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "deviceSettingsSyncState")]
        getter device_settings_sync_state : String?


        @[JSON::Field(key: "deviceUpdateStatus")]
        getter device_update_status : String?


        @[JSON::Field(key: "hdDeviceSettings")]
        getter hd_device_settings : Types::InputDeviceHdSettings?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?


        @[JSON::Field(key: "medialiveInputArns")]
        getter medialive_input_arns : Array(String)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "networkSettings")]
        getter network_settings : Types::InputDeviceNetworkSettings?


        @[JSON::Field(key: "outputType")]
        getter output_type : String?


        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?


        @[JSON::Field(key: "uhdDeviceSettings")]
        getter uhd_device_settings : Types::InputDeviceUhdSettings?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @connection_state : String? = nil,
          @device_settings_sync_state : String? = nil,
          @device_update_status : String? = nil,
          @hd_device_settings : Types::InputDeviceHdSettings? = nil,
          @id : String? = nil,
          @mac_address : String? = nil,
          @medialive_input_arns : Array(String)? = nil,
          @name : String? = nil,
          @network_settings : Types::InputDeviceNetworkSettings? = nil,
          @output_type : String? = nil,
          @serial_number : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @uhd_device_settings : Types::InputDeviceUhdSettings? = nil
        )
        end
      end


      struct UpdateInputRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputId")]
        getter input_id : String


        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::InputDestinationRequest)?


        @[JSON::Field(key: "inputDevices")]
        getter input_devices : Array(Types::InputDeviceRequest)?


        @[JSON::Field(key: "inputSecurityGroups")]
        getter input_security_groups : Array(String)?


        @[JSON::Field(key: "mediaConnectFlows")]
        getter media_connect_flows : Array(Types::MediaConnectFlowRequest)?


        @[JSON::Field(key: "multicastSettings")]
        getter multicast_settings : Types::MulticastSettingsUpdateRequest?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "sdiSources")]
        getter sdi_sources : Array(String)?


        @[JSON::Field(key: "smpte2110ReceiverGroupSettings")]
        getter smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings?


        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::InputSourceRequest)?


        @[JSON::Field(key: "specialRouterSettings")]
        getter special_router_settings : Types::SpecialRouterSettings?


        @[JSON::Field(key: "srtSettings")]
        getter srt_settings : Types::SrtSettingsRequest?

        def initialize(
          @input_id : String,
          @destinations : Array(Types::InputDestinationRequest)? = nil,
          @input_devices : Array(Types::InputDeviceRequest)? = nil,
          @input_security_groups : Array(String)? = nil,
          @media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
          @multicast_settings : Types::MulticastSettingsUpdateRequest? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @sdi_sources : Array(String)? = nil,
          @smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
          @sources : Array(Types::InputSourceRequest)? = nil,
          @special_router_settings : Types::SpecialRouterSettings? = nil,
          @srt_settings : Types::SrtSettingsRequest? = nil
        )
        end
      end


      struct UpdateInputResponse
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end


      struct UpdateInputResultModel
        include JSON::Serializable


        @[JSON::Field(key: "input")]
        getter input : Types::Input?

        def initialize(
          @input : Types::Input? = nil
        )
        end
      end


      struct UpdateInputSecurityGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "inputSecurityGroupId")]
        getter input_security_group_id : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "whitelistRules")]
        getter whitelist_rules : Array(Types::InputWhitelistRuleCidr)?

        def initialize(
          @input_security_group_id : String,
          @tags : Hash(String, String)? = nil,
          @whitelist_rules : Array(Types::InputWhitelistRuleCidr)? = nil
        )
        end
      end


      struct UpdateInputSecurityGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::InputSecurityGroup?

        def initialize(
          @security_group : Types::InputSecurityGroup? = nil
        )
        end
      end


      struct UpdateInputSecurityGroupResultModel
        include JSON::Serializable


        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::InputSecurityGroup?

        def initialize(
          @security_group : Types::InputSecurityGroup? = nil
        )
        end
      end


      struct UpdateMultiplex
        include JSON::Serializable

        # The new settings for a multiplex.

        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?

        # Name of the multiplex.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "packetIdentifiersMapping")]
        getter packet_identifiers_mapping : Hash(String, Types::MultiplexProgramPacketIdentifiersMap)?

        def initialize(
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @packet_identifiers_mapping : Hash(String, Types::MultiplexProgramPacketIdentifiersMap)? = nil
        )
        end
      end


      struct UpdateMultiplexProgram
        include JSON::Serializable

        # The new settings for a multiplex program.

        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings?

        def initialize(
          @multiplex_program_settings : Types::MultiplexProgramSettings? = nil
        )
        end
      end


      struct UpdateMultiplexProgramRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "programName")]
        getter program_name : String


        @[JSON::Field(key: "multiplexProgramSettings")]
        getter multiplex_program_settings : Types::MultiplexProgramSettings?

        def initialize(
          @multiplex_id : String,
          @program_name : String,
          @multiplex_program_settings : Types::MultiplexProgramSettings? = nil
        )
        end
      end


      struct UpdateMultiplexProgramResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplexProgram")]
        getter multiplex_program : Types::MultiplexProgram?

        def initialize(
          @multiplex_program : Types::MultiplexProgram? = nil
        )
        end
      end


      struct UpdateMultiplexProgramResultModel
        include JSON::Serializable

        # The updated multiplex program.

        @[JSON::Field(key: "multiplexProgram")]
        getter multiplex_program : Types::MultiplexProgram?

        def initialize(
          @multiplex_program : Types::MultiplexProgram? = nil
        )
        end
      end


      struct UpdateMultiplexRequest
        include JSON::Serializable


        @[JSON::Field(key: "multiplexId")]
        getter multiplex_id : String


        @[JSON::Field(key: "multiplexSettings")]
        getter multiplex_settings : Types::MultiplexSettings?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "packetIdentifiersMapping")]
        getter packet_identifiers_mapping : Hash(String, Types::MultiplexProgramPacketIdentifiersMap)?

        def initialize(
          @multiplex_id : String,
          @multiplex_settings : Types::MultiplexSettings? = nil,
          @name : String? = nil,
          @packet_identifiers_mapping : Hash(String, Types::MultiplexProgramPacketIdentifiersMap)? = nil
        )
        end
      end


      struct UpdateMultiplexResponse
        include JSON::Serializable


        @[JSON::Field(key: "multiplex")]
        getter multiplex : Types::Multiplex?

        def initialize(
          @multiplex : Types::Multiplex? = nil
        )
        end
      end


      struct UpdateMultiplexResultModel
        include JSON::Serializable

        # The updated multiplex.

        @[JSON::Field(key: "multiplex")]
        getter multiplex : Types::Multiplex?

        def initialize(
          @multiplex : Types::Multiplex? = nil
        )
        end
      end

      # Used in the UpdateNetwork operation.

      struct UpdateNetworkRequest
        include JSON::Serializable


        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Include this parameter only if you want to change the pool of IP addresses in the network. An array
        # of IpPoolCreateRequests that identify a collection of IP addresses in this network that you want to
        # reserve for use in MediaLive Anywhere. MediaLive Anywhere uses these IP addresses for Push inputs
        # (in both Bridge and NAT networks) and for output destinations (only in Bridge networks). Each
        # IpPoolUpdateRequest specifies one CIDR block.

        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPoolUpdateRequest)?

        # Include this parameter only if you want to change the name of the Network. Specify a name that is
        # unique in the AWS account. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Include this parameter only if you want to change or add routes in the Network. An array of Routes
        # that MediaLive Anywhere needs to know about in order to route encoding traffic.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::RouteUpdateRequest)?

        def initialize(
          @network_id : String,
          @ip_pools : Array(Types::IpPoolUpdateRequest)? = nil,
          @name : String? = nil,
          @routes : Array(Types::RouteUpdateRequest)? = nil
        )
        end
      end


      struct UpdateNetworkResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the response for the UpdateNetwork

      struct UpdateNetworkResult
        include JSON::Serializable

        # The ARN of this Network. It is automatically assigned when the Network is created.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "associatedClusterIds")]
        getter associated_cluster_ids : Array(String)?

        # The ID of the Network. Unique in the AWS account. The ID is the resource-id portion of the ARN.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An array of IpPools in your organization's network that identify a collection of IP addresses in
        # this network that are reserved for use in MediaLive Anywhere. MediaLive Anywhere uses these IP
        # addresses for Push inputs (in both Bridge and NAT networks) and for output destinations (only in
        # Bridge networks). Each IpPool specifies one CIDR block.

        @[JSON::Field(key: "ipPools")]
        getter ip_pools : Array(Types::IpPool)?

        # The name that you specified for the Network.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of Routes that MediaLive Anywhere needs to know about in order to route encoding traffic.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::Route)?

        # The current state of the Network. Only MediaLive Anywhere can change the state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @associated_cluster_ids : Array(String)? = nil,
          @id : String? = nil,
          @ip_pools : Array(Types::IpPool)? = nil,
          @name : String? = nil,
          @routes : Array(Types::Route)? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in the UpdateNode operation.

      struct UpdateNodeRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        # Include this parameter only if you want to change the current name of the Node. Specify a name that
        # is unique in the Cluster. You can't change the name. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The initial role of the Node in the Cluster. ACTIVE means the Node is available for encoding. BACKUP
        # means the Node is a redundant Node and might get used if an ACTIVE Node fails.

        @[JSON::Field(key: "role")]
        getter role : String?

        # The mappings of a SDI capture card port to a logical SDI data stream

        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMappingUpdateRequest)?

        def initialize(
          @cluster_id : String,
          @node_id : String,
          @name : String? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMappingUpdateRequest)? = nil
        )
        end
      end


      struct UpdateNodeResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?


        @[JSON::Field(key: "role")]
        getter role : String?


        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end

      # Used in the UpdateNode operation.

      struct UpdateNodeStateRequest
        include JSON::Serializable


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String


        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        # The state to apply to the Node. Set to ACTIVE (COMMISSIONED) to indicate that the Node is
        # deployable. MediaLive Anywhere will consider this node it needs a Node to run a Channel on, or when
        # it needs a Node to promote from a backup node to an active node. Set to DRAINING to isolate the Node
        # so that MediaLive Anywhere won't use it.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @cluster_id : String,
          @node_id : String,
          @state : String? = nil
        )
        end
      end


      struct UpdateNodeStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelPlacementGroups")]
        getter channel_placement_groups : Array(String)?


        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?


        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "nodeInterfaceMappings")]
        getter node_interface_mappings : Array(Types::NodeInterfaceMapping)?


        @[JSON::Field(key: "role")]
        getter role : String?


        @[JSON::Field(key: "sdiSourceMappings")]
        getter sdi_source_mappings : Array(Types::SdiSourceMapping)?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @channel_placement_groups : Array(String)? = nil,
          @cluster_id : String? = nil,
          @connection_state : String? = nil,
          @id : String? = nil,
          @instance_arn : String? = nil,
          @name : String? = nil,
          @node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
          @role : String? = nil,
          @sdi_source_mappings : Array(Types::SdiSourceMapping)? = nil,
          @state : String? = nil
        )
        end
      end

      # UpdateReservation request

      struct UpdateReservation
        include JSON::Serializable

        # Name of the reservation

        @[JSON::Field(key: "name")]
        getter name : String?

        # Renewal settings for the reservation

        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?

        def initialize(
          @name : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil
        )
        end
      end


      struct UpdateReservationRequest
        include JSON::Serializable


        @[JSON::Field(key: "reservationId")]
        getter reservation_id : String


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "renewalSettings")]
        getter renewal_settings : Types::RenewalSettings?

        def initialize(
          @reservation_id : String,
          @name : String? = nil,
          @renewal_settings : Types::RenewalSettings? = nil
        )
        end
      end


      struct UpdateReservationResponse
        include JSON::Serializable


        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      # UpdateReservation response

      struct UpdateReservationResultModel
        include JSON::Serializable


        @[JSON::Field(key: "reservation")]
        getter reservation : Types::Reservation?

        def initialize(
          @reservation : Types::Reservation? = nil
        )
        end
      end

      # Used in UpdateSdiSourceRequest.

      struct UpdateSdiSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "sdiSourceId")]
        getter sdi_source_id : String

        # Include this parameter only if you want to change the name of the SdiSource. Specify a name that is
        # unique in the AWS account. We recommend you assign a name that describes the source, for example
        # curling-cameraA. Names are case-sensitive.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # Include this parameter only if you want to change the name of the SdiSource. Specify a name that is
        # unique in the AWS account. We recommend you assign a name that describes the source, for example
        # curling-cameraA. Names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Include this parameter only if you want to change the mode. Specify the type of the SDI source:
        # SINGLE: The source is a single-link source. QUAD: The source is one part of a quad-link source.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @sdi_source_id : String,
          @mode : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Used in UpdateSdiSourceResponse.

      struct UpdateSdiSourceResponse
        include JSON::Serializable

        # Settings for the SDI source.

        @[JSON::Field(key: "sdiSource")]
        getter sdi_source : Types::SdiSource?

        def initialize(
          @sdi_source : Types::SdiSource? = nil
        )
        end
      end


      struct ValidationError
        include JSON::Serializable

        # Path to the source of the error.

        @[JSON::Field(key: "elementPath")]
        getter element_path : String?

        # The error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @element_path : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct VideoBlackFailoverSettings
        include JSON::Serializable

        # A value used in calculating the threshold below which MediaLive considers a pixel to be 'black'. For
        # the input to be considered black, every pixel in a frame must be below this threshold. The threshold
        # is calculated as a percentage (expressed as a decimal) of white. Therefore .1 means 10% white (or
        # 90% black). Note how the formula works for any color depth. For example, if you set this field to
        # 0.1 in 10-bit color depth: (1023*0.1=102.3), which means a pixel value of 102 or less is 'black'. If
        # you set this field to .1 in an 8-bit color depth: (255*0.1=25.5), which means a pixel value of 25 or
        # less is 'black'. The range is 0.0 to 1.0, with any number of decimal places.

        @[JSON::Field(key: "blackDetectThreshold")]
        getter black_detect_threshold : Float64?

        # The amount of time (in milliseconds) that the active input must be black before automatic input
        # failover occurs.

        @[JSON::Field(key: "videoBlackThresholdMsec")]
        getter video_black_threshold_msec : Int32?

        def initialize(
          @black_detect_threshold : Float64? = nil,
          @video_black_threshold_msec : Int32? = nil
        )
        end
      end

      # Video Codec Settings

      struct VideoCodecSettings
        include JSON::Serializable


        @[JSON::Field(key: "av1Settings")]
        getter av1_settings : Types::Av1Settings?


        @[JSON::Field(key: "frameCaptureSettings")]
        getter frame_capture_settings : Types::FrameCaptureSettings?


        @[JSON::Field(key: "h264Settings")]
        getter h264_settings : Types::H264Settings?


        @[JSON::Field(key: "h265Settings")]
        getter h265_settings : Types::H265Settings?


        @[JSON::Field(key: "mpeg2Settings")]
        getter mpeg2_settings : Types::Mpeg2Settings?

        def initialize(
          @av1_settings : Types::Av1Settings? = nil,
          @frame_capture_settings : Types::FrameCaptureSettings? = nil,
          @h264_settings : Types::H264Settings? = nil,
          @h265_settings : Types::H265Settings? = nil,
          @mpeg2_settings : Types::Mpeg2Settings? = nil
        )
        end
      end

      # Video settings for this stream.

      struct VideoDescription
        include JSON::Serializable

        # The name of this VideoDescription. Outputs will use this name to uniquely identify this Description.
        # Description names should be unique within this Live Event.

        @[JSON::Field(key: "name")]
        getter name : String

        # Video codec settings.

        @[JSON::Field(key: "codecSettings")]
        getter codec_settings : Types::VideoCodecSettings?

        # Output video height, in pixels. Must be an even number. For most codecs, you can leave this field
        # and width blank in order to use the height and width (resolution) from the source. Note, however,
        # that leaving blank is not recommended. For the Frame Capture codec, height and width are required.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Indicates how MediaLive will respond to the AFD values that might be in the input video. If you do
        # not know what AFD signaling is, or if your downstream system has not given you guidance, choose
        # PASSTHROUGH. RESPOND: MediaLive clips the input video using a formula that uses the AFD values
        # (configured in afdSignaling ), the input display aspect ratio, and the output display aspect ratio.
        # MediaLive also includes the AFD values in the output, unless the codec for this encode is
        # FRAME_CAPTURE. PASSTHROUGH: MediaLive ignores the AFD values and does not clip the video. But
        # MediaLive does include the values in the output. NONE: MediaLive does not clip the input video and
        # does not include the AFD values in the output

        @[JSON::Field(key: "respondToAfd")]
        getter respond_to_afd : String?

        # STRETCH_TO_OUTPUT configures the output position to stretch the video to the specified output
        # resolution (height and width). This option will override any position value. DEFAULT may insert
        # black boxes (pillar boxes or letter boxes) around the video to provide the specified output
        # resolution.

        @[JSON::Field(key: "scalingBehavior")]
        getter scaling_behavior : String?

        # Changes the strength of the anti-alias filter used for scaling. 0 is the softest setting, 100 is the
        # sharpest. A setting of 50 is recommended for most content.

        @[JSON::Field(key: "sharpness")]
        getter sharpness : Int32?

        # Output video width, in pixels. Must be an even number. For most codecs, you can leave this field and
        # height blank in order to use the height and width (resolution) from the source. Note, however, that
        # leaving blank is not recommended. For the Frame Capture codec, height and width are required.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @name : String,
          @codec_settings : Types::VideoCodecSettings? = nil,
          @height : Int32? = nil,
          @respond_to_afd : String? = nil,
          @scaling_behavior : String? = nil,
          @sharpness : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Specifies a particular video stream within an input source. An input may have only a single video
      # selector.

      struct VideoSelector
        include JSON::Serializable

        # Controls how MediaLive will use the color space metadata from the source. Typically, choose FOLLOW,
        # which means to use the color space metadata without changing it. Or choose another value (a
        # standard). In this case, the handling is controlled by the colorspaceUsage property.

        @[JSON::Field(key: "colorSpace")]
        getter color_space : String?

        # Choose HDR10 only if the following situation applies. Firstly, you specified HDR10 in ColorSpace.
        # Secondly, the attached input is for AWS Elemental Link. Thirdly, you plan to convert the content to
        # another color space. You need to specify the color space metadata that is missing from the source
        # sent from AWS Elemental Link.

        @[JSON::Field(key: "colorSpaceSettings")]
        getter color_space_settings : Types::VideoSelectorColorSpaceSettings?

        # Applies only if colorSpace is a value other than follow. This field controls how the value in the
        # colorSpace field will be used. fallback means that when the input does include color space data,
        # that data will be used, but when the input has no color space data, the value in colorSpace will be
        # used. Choose fallback if your input is sometimes missing color space data, but when it does have
        # color space data, that data is correct. force means to always use the value in colorSpace. Choose
        # force if your input usually has no color space data or might have unreliable color space data.

        @[JSON::Field(key: "colorSpaceUsage")]
        getter color_space_usage : String?

        # The video selector settings.

        @[JSON::Field(key: "selectorSettings")]
        getter selector_settings : Types::VideoSelectorSettings?

        def initialize(
          @color_space : String? = nil,
          @color_space_settings : Types::VideoSelectorColorSpaceSettings? = nil,
          @color_space_usage : String? = nil,
          @selector_settings : Types::VideoSelectorSettings? = nil
        )
        end
      end

      # Video Selector Color Space Settings

      struct VideoSelectorColorSpaceSettings
        include JSON::Serializable


        @[JSON::Field(key: "hdr10Settings")]
        getter hdr10_settings : Types::Hdr10Settings?

        def initialize(
          @hdr10_settings : Types::Hdr10Settings? = nil
        )
        end
      end

      # Video Selector Pid

      struct VideoSelectorPid
        include JSON::Serializable

        # Selects a specific PID from within a video source.

        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        def initialize(
          @pid : Int32? = nil
        )
        end
      end

      # Video Selector Program Id

      struct VideoSelectorProgramId
        include JSON::Serializable

        # Selects a specific program from within a multi-program transport stream. If the program doesn't
        # exist, the first program within the transport stream will be selected by default.

        @[JSON::Field(key: "programId")]
        getter program_id : Int32?

        def initialize(
          @program_id : Int32? = nil
        )
        end
      end

      # Video Selector Settings

      struct VideoSelectorSettings
        include JSON::Serializable


        @[JSON::Field(key: "videoSelectorPid")]
        getter video_selector_pid : Types::VideoSelectorPid?


        @[JSON::Field(key: "videoSelectorProgramId")]
        getter video_selector_program_id : Types::VideoSelectorProgramId?

        def initialize(
          @video_selector_pid : Types::VideoSelectorPid? = nil,
          @video_selector_program_id : Types::VideoSelectorProgramId? = nil
        )
        end
      end

      # The properties for a private VPC Output When this property is specified, the output egress addresses
      # will be created in a user specified VPC

      struct VpcOutputSettings
        include JSON::Serializable

        # A list of VPC subnet IDs from the same VPC. If STANDARD channel, subnet IDs must be mapped to two
        # unique availability zones (AZ).

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # List of public address allocation ids to associate with ENIs that will be created in Output VPC.
        # Must specify one for SINGLE_PIPELINE, two for STANDARD channels

        @[JSON::Field(key: "publicAddressAllocationIds")]
        getter public_address_allocation_ids : Array(String)?

        # A list of up to 5 EC2 VPC security group IDs to attach to the Output VPC network interfaces. If none
        # are specified then the VPC default security group will be used

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @subnet_ids : Array(String),
          @public_address_allocation_ids : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # The properties for a private VPC Output

      struct VpcOutputSettingsDescription
        include JSON::Serializable

        # The Availability Zones where the vpc subnets are located. The first Availability Zone applies to the
        # first subnet in the list of subnets. The second Availability Zone applies to the second subnet.

        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?

        # A list of Elastic Network Interfaces created by MediaLive in the customer's VPC

        @[JSON::Field(key: "networkInterfaceIds")]
        getter network_interface_ids : Array(String)?

        # A list of up EC2 VPC security group IDs attached to the Output VPC network interfaces.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of VPC subnet IDs from the same VPC. If STANDARD channel, subnet IDs must be mapped to two
        # unique availability zones (AZ).

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @network_interface_ids : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # Wav Settings

      struct WavSettings
        include JSON::Serializable

        # Bits per sample.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Float64?

        # The audio coding mode for the WAV audio. The mode determines the number of channels in the audio.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Float64?

        def initialize(
          @bit_depth : Float64? = nil,
          @coding_mode : String? = nil,
          @sample_rate : Float64? = nil
        )
        end
      end

      # Webvtt Destination Settings

      struct WebvttDestinationSettings
        include JSON::Serializable

        # Controls whether the color and position of the source captions is passed through to the WebVTT
        # output captions. PASSTHROUGH - Valid only if the source captions are EMBEDDED or TELETEXT.
        # NO_STYLE_DATA - Don't pass through the style. The output captions will not contain any font styling
        # information.

        @[JSON::Field(key: "styleControl")]
        getter style_control : String?

        def initialize(
          @style_control : String? = nil
        )
        end
      end
    end
  end
end
