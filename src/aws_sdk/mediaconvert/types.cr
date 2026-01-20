require "json"
require "time"

module AwsSdk
  module MediaConvert
    module Types

      # Required when you set Codec to the value AAC. The service accepts one of two mutually exclusive
      # groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control
      # mode to "VBR" or "CBR". In VBR mode, you control the audio quality with the setting VBR quality. In
      # CBR mode, you use the setting Bitrate. Defaults and valid values depend on the rate control mode.

      struct AacSettings
        include JSON::Serializable

        # Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio + audio description (AD) as
        # a stereo pair. The value for AudioType will be set to 3, which signals to downstream systems that
        # this stream contains "broadcaster mixed AD". Note that the input received by the encoder must
        # contain pre-mixed audio; the encoder does not perform the mixing. When you choose
        # BROADCASTER_MIXED_AD, the encoder ignores any values you provide in AudioType and
        # FollowInputAudioType. Choose NORMAL when the input does not contain pre-mixed audio + audio
        # description (AD). In this case, the encoder will use any values you provide for AudioType and
        # FollowInputAudioType.

        @[JSON::Field(key: "audioDescriptionBroadcasterMix")]
        getter audio_description_broadcaster_mix : String?

        # Specify the average bitrate in bits per second. The set of valid values for this setting is: 6000,
        # 8000, 10000, 12000, 14000, 16000, 20000, 24000, 28000, 32000, 40000, 48000, 56000, 64000, 80000,
        # 96000, 112000, 128000, 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000,
        # 576000, 640000, 768000, 896000, 1024000. The value you set is also constrained by the values that
        # you choose for Profile, Bitrate control mode, and Sample rate. Default values depend on Bitrate
        # control mode and Profile.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the AAC profile. For the widest player compatibility and where higher bitrates are
        # acceptable: Keep the default profile, LC (AAC-LC) For improved audio performance at lower bitrates:
        # Choose HEV1 or HEV2. HEV1 (AAC-HE v1) adds spectral band replication to improve speech audio at low
        # bitrates. HEV2 (AAC-HE v2) adds parametric stereo, which optimizes for encoding stereo audio at very
        # low bitrates. For improved audio quality at lower bitrates, adaptive audio bitrate switching, and
        # loudness control: Choose XHE.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # The Coding mode that you specify determines the number of audio channels and the audio channel
        # layout metadata in your AAC output. Valid coding modes depend on the Rate control mode and Profile
        # that you select. The following list shows the number of audio channels and channel layout for each
        # coding mode. * 1.0 Audio Description (Receiver Mix): One channel, C. Includes audio description data
        # from your stereo input. For more information see ETSI TS 101 154 Annex E. * 1.0 Mono: One channel,
        # C. * 2.0 Stereo: Two channels, L, R. * 5.1 Surround: Six channels, C, L, R, Ls, Rs, LFE.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Choose the loudness measurement mode for your audio content. For music or advertisements: We
        # recommend that you keep the default value, Program. For speech or other content: We recommend that
        # you choose Anchor. When you do, MediaConvert optimizes the loudness of your output for clarify by
        # applying speech gates.

        @[JSON::Field(key: "loudnessMeasurementMode")]
        getter loudness_measurement_mode : String?

        # Specify the RAP (Random Access Point) interval for your xHE-AAC audio output. A RAP allows a decoder
        # to decode audio data mid-stream, without the need to reference previous audio frames, and perform
        # adaptive audio bitrate switching. To specify the RAP interval: Enter an integer from 2000 to 30000,
        # in milliseconds. Smaller values allow for better seeking and more frequent stream switching, while
        # large values improve compression efficiency. To have MediaConvert automatically determine the RAP
        # interval: Leave blank.

        @[JSON::Field(key: "rapInterval")]
        getter rap_interval : Int32?

        # Specify the AAC rate control mode. For a constant bitrate: Choose CBR. Your AAC output bitrate will
        # be equal to the value that you choose for Bitrate. For a variable bitrate: Choose VBR. Your AAC
        # output bitrate will vary according to your audio content and the value that you choose for Bitrate
        # quality.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an output, you must choose "No
        # container" for the output container.

        @[JSON::Field(key: "rawFormat")]
        getter raw_format : String?

        # Specify the AAC sample rate in samples per second (Hz). Valid sample rates depend on the AAC profile
        # and Coding mode that you select. For a list of supported sample rates, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/aac-support.html

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.

        @[JSON::Field(key: "specification")]
        getter specification : String?

        # Specify the xHE-AAC loudness target. Enter an integer from 6 to 16, representing "loudness units".
        # For more information, see the following specification: Supplementary information for R 128 EBU Tech
        # 3342-2023.

        @[JSON::Field(key: "targetLoudnessRange")]
        getter target_loudness_range : Int32?

        # Specify the quality of your variable bitrate (VBR) AAC audio. For a list of approximate VBR
        # bitrates, see: https://docs.aws.amazon.com/mediaconvert/latest/ug/aac-support.html#aac_vbr

        @[JSON::Field(key: "vbrQuality")]
        getter vbr_quality : String?

        def initialize(
          @audio_description_broadcaster_mix : String? = nil,
          @bitrate : Int32? = nil,
          @codec_profile : String? = nil,
          @coding_mode : String? = nil,
          @loudness_measurement_mode : String? = nil,
          @rap_interval : Int32? = nil,
          @rate_control_mode : String? = nil,
          @raw_format : String? = nil,
          @sample_rate : Int32? = nil,
          @specification : String? = nil,
          @target_loudness_range : Int32? = nil,
          @vbr_quality : String? = nil
        )
        end
      end

      # Required when you set Codec to the value AC3.

      struct Ac3Settings
        include JSON::Serializable

        # Specify the average bitrate in bits per second. The bitrate that you specify must be a multiple of
        # 8000 within the allowed minimum and maximum values. Leave blank to use the default bitrate for the
        # coding mode you select according ETSI TS 102 366. Valid bitrates for coding mode 1/0: Default:
        # 96000. Minimum: 64000. Maximum: 128000. Valid bitrates for coding mode 1/1: Default: 192000.
        # Minimum: 128000. Maximum: 384000. Valid bitrates for coding mode 2/0: Default: 192000. Minimum:
        # 128000. Maximum: 384000. Valid bitrates for coding mode 3/2 with FLE: Default: 384000. Minimum:
        # 384000. Maximum: 640000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the bitstream mode for the AC-3 stream that the encoder emits. For more information about
        # the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).

        @[JSON::Field(key: "bitstreamMode")]
        getter bitstream_mode : String?

        # Dolby Digital coding mode. Determines number of channels.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Sets the dialnorm for the output. If blank and input audio is Dolby Digital, dialnorm will be passed
        # through.

        @[JSON::Field(key: "dialnorm")]
        getter dialnorm : Int32?

        # Choose the Dolby Digital dynamic range control (DRC) profile that MediaConvert uses when encoding
        # the metadata in the Dolby Digital stream for the line operating mode. Related setting: When you use
        # this setting, MediaConvert ignores any value you provide for Dynamic range compression profile. For
        # information about the Dolby Digital DRC operating modes and profiles, see the Dynamic Range Control
        # chapter of the Dolby Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionLine")]
        getter dynamic_range_compression_line : String?

        # When you want to add Dolby dynamic range compression (DRC) signaling to your output stream, we
        # recommend that you use the mode-specific settings instead of Dynamic range compression profile. The
        # mode-specific settings are Dynamic range compression profile, line mode and Dynamic range
        # compression profile, RF mode. Note that when you specify values for all three settings, MediaConvert
        # ignores the value of this setting in favor of the mode-specific settings. If you do use this setting
        # instead of the mode-specific settings, choose None to leave out DRC signaling. Keep the default Film
        # standard to set the profile to Dolby's film standard profile for all operating modes.

        @[JSON::Field(key: "dynamicRangeCompressionProfile")]
        getter dynamic_range_compression_profile : String?

        # Choose the Dolby Digital dynamic range control (DRC) profile that MediaConvert uses when encoding
        # the metadata in the Dolby Digital stream for the RF operating mode. Related setting: When you use
        # this setting, MediaConvert ignores any value you provide for Dynamic range compression profile. For
        # information about the Dolby Digital DRC operating modes and profiles, see the Dynamic Range Control
        # chapter of the Dolby Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionRf")]
        getter dynamic_range_compression_rf : String?

        # Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding
        # mode.

        @[JSON::Field(key: "lfeFilter")]
        getter lfe_filter : String?

        # When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that
        # supplied this audio data. If audio was not supplied from one of these streams, then the static
        # metadata settings will be used.

        @[JSON::Field(key: "metadataControl")]
        getter metadata_control : String?

        # This value is always 48000. It represents the sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bitrate : Int32? = nil,
          @bitstream_mode : String? = nil,
          @coding_mode : String? = nil,
          @dialnorm : Int32? = nil,
          @dynamic_range_compression_line : String? = nil,
          @dynamic_range_compression_profile : String? = nil,
          @dynamic_range_compression_rf : String? = nil,
          @lfe_filter : String? = nil,
          @metadata_control : String? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Accelerated transcoding can significantly speed up jobs with long, visually complex content.

      struct AccelerationSettings
        include JSON::Serializable

        # Specify the conditions when the service will run your job with accelerated transcoding.

        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # Optional settings for Advanced input filter when you set Advanced input filter to Enabled.

      struct AdvancedInputFilterSettings
        include JSON::Serializable

        # Add texture and detail to areas of your input video content that were lost after applying the
        # Advanced input filter. To adaptively add texture and reduce softness: Choose Enabled. To not add any
        # texture: Keep the default value, Disabled. We recommend that you choose Disabled for input video
        # content that doesn't have texture, including screen recordings, computer graphics, or cartoons.

        @[JSON::Field(key: "addTexture")]
        getter add_texture : String?

        # Optionally specify the amount of sharpening to apply when you use the Advanced input filter.
        # Sharpening adds contrast to the edges of your video content and can reduce softness. To apply no
        # sharpening: Keep the default value, Off. To apply a minimal amount of sharpening choose Low, or for
        # the maximum choose High.

        @[JSON::Field(key: "sharpening")]
        getter sharpening : String?

        def initialize(
          @add_texture : String? = nil,
          @sharpening : String? = nil
        )
        end
      end

      # Required when you set Codec to the value AIFF.

      struct AiffSettings
        include JSON::Serializable

        # Specify Bit depth, in bits per sample, to choose the encoding quality for this audio track.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # Specify the number of channels in this output audio track. Valid values are 1 and even numbers up to
        # 64. For example, 1, 2, 4, 6, and so on, up to 64.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @channels : Int32? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Use Allowed renditions to specify a list of possible resolutions in your ABR stack. * MediaConvert
      # will create an ABR stack exclusively from the list of resolutions that you specify. * Some
      # resolutions in the Allowed renditions list may not be included, however you can force a resolution
      # to be included by setting Required to ENABLED. * You must specify at least one resolution that is
      # greater than or equal to any resolutions that you specify in Min top rendition size or Min bottom
      # rendition size. * If you specify Allowed renditions, you must not specify a separate rule for Force
      # include renditions.

      struct AllowedRenditionSize
        include JSON::Serializable

        # Use Height to define the video resolution height, in pixels, for this rule.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Set to ENABLED to force a rendition to be included.

        @[JSON::Field(key: "required")]
        getter required : String?

        # Use Width to define the video resolution width, in pixels, for this rule.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @height : Int32? = nil,
          @required : String? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Settings for ancillary captions source.

      struct AncillarySourceSettings
        include JSON::Serializable

        # Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If
        # you choose Upconvert, MediaConvert includes the captions data in two ways: it passes the 608 data
        # through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608
        # data into 708.

        @[JSON::Field(key: "convert608To708")]
        getter convert608_to708 : String?

        # Specifies the 608 channel number in the ancillary data track from which to extract captions. Unused
        # for passthrough.

        @[JSON::Field(key: "sourceAncillaryChannelNumber")]
        getter source_ancillary_channel_number : Int32?

        # By default, the service terminates any unterminated captions at the end of each input. If you want
        # the caption to continue onto your next input, disable this setting.

        @[JSON::Field(key: "terminateCaptions")]
        getter terminate_captions : String?

        def initialize(
          @convert608_to708 : String? = nil,
          @source_ancillary_channel_number : Int32? = nil,
          @terminate_captions : String? = nil
        )
        end
      end

      # Associates the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate with an
      # AWS Elemental MediaConvert resource.

      struct AssociateCertificateRequest
        include JSON::Serializable

        # The ARN of the ACM certificate that you want to associate with your MediaConvert resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Successful association of Certificate Manager Amazon Resource Name (ARN) with Mediaconvert returns
      # an OK message.

      struct AssociateCertificateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specify the QuickTime audio channel layout tags for the audio channels in this audio track. When you
      # don't specify a value, MediaConvert labels your track as Center (C) by default. To use Audio layout
      # tagging, your output must be in a QuickTime (MOV) container and your audio codec must be AAC, WAV,
      # or AIFF.

      struct AudioChannelTaggingSettings
        include JSON::Serializable

        # Specify the QuickTime audio channel layout tags for the audio channels in this audio track. Enter
        # channel layout tags in the same order as your output's audio channel order. For example, if your
        # output audio track has a left and a right channel, enter Left (L) for the first channel and Right
        # (R) for the second. If your output has multiple single-channel audio tracks, enter a single channel
        # layout tag for each track.

        @[JSON::Field(key: "channelTag")]
        getter channel_tag : String?

        # Specify the QuickTime audio channel layout tags for the audio channels in this audio track. Enter
        # channel layout tags in the same order as your output's audio channel order. For example, if your
        # output audio track has a left and a right channel, enter Left (L) for the first channel and Right
        # (R) for the second. If your output has multiple single-channel audio tracks, enter a single channel
        # layout tag for each track.

        @[JSON::Field(key: "channelTags")]
        getter channel_tags : Array(String)?

        def initialize(
          @channel_tag : String? = nil,
          @channel_tags : Array(String)? = nil
        )
        end
      end

      # Settings related to audio encoding. The settings in this group vary depending on the value that you
      # choose for your audio codec.

      struct AudioCodecSettings
        include JSON::Serializable

        # Required when you set Codec to the value AAC. The service accepts one of two mutually exclusive
        # groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control
        # mode to "VBR" or "CBR". In VBR mode, you control the audio quality with the setting VBR quality. In
        # CBR mode, you use the setting Bitrate. Defaults and valid values depend on the rate control mode.

        @[JSON::Field(key: "aacSettings")]
        getter aac_settings : Types::AacSettings?

        # Required when you set Codec to the value AC3.

        @[JSON::Field(key: "ac3Settings")]
        getter ac3_settings : Types::Ac3Settings?

        # Required when you set Codec to the value AIFF.

        @[JSON::Field(key: "aiffSettings")]
        getter aiff_settings : Types::AiffSettings?

        # Choose the audio codec for this output. Note that the option Dolby Digital passthrough applies only
        # to Dolby Digital and Dolby Digital Plus audio inputs. Make sure that you choose a codec that's
        # supported with your output container:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/reference-codecs-containers.html#reference-codecs-containers-output-audio
        # For audio-only outputs, make sure that both your input audio codec and your output audio codec are
        # supported for audio-only workflows. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/reference-codecs-containers-input.html#reference-codecs-containers-input-audio-only
        # and
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/reference-codecs-containers.html#audio-only-output

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Required when you set Codec to the value EAC3_ATMOS.

        @[JSON::Field(key: "eac3AtmosSettings")]
        getter eac3_atmos_settings : Types::Eac3AtmosSettings?

        # Required when you set Codec to the value EAC3.

        @[JSON::Field(key: "eac3Settings")]
        getter eac3_settings : Types::Eac3Settings?

        # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value FLAC.

        @[JSON::Field(key: "flacSettings")]
        getter flac_settings : Types::FlacSettings?

        # Required when you set Codec to the value MP2.

        @[JSON::Field(key: "mp2Settings")]
        getter mp2_settings : Types::Mp2Settings?

        # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value MP3.

        @[JSON::Field(key: "mp3Settings")]
        getter mp3_settings : Types::Mp3Settings?

        # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value OPUS.

        @[JSON::Field(key: "opusSettings")]
        getter opus_settings : Types::OpusSettings?

        # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value Vorbis.

        @[JSON::Field(key: "vorbisSettings")]
        getter vorbis_settings : Types::VorbisSettings?

        # Required when you set Codec to the value WAV.

        @[JSON::Field(key: "wavSettings")]
        getter wav_settings : Types::WavSettings?

        def initialize(
          @aac_settings : Types::AacSettings? = nil,
          @ac3_settings : Types::Ac3Settings? = nil,
          @aiff_settings : Types::AiffSettings? = nil,
          @codec : String? = nil,
          @eac3_atmos_settings : Types::Eac3AtmosSettings? = nil,
          @eac3_settings : Types::Eac3Settings? = nil,
          @flac_settings : Types::FlacSettings? = nil,
          @mp2_settings : Types::Mp2Settings? = nil,
          @mp3_settings : Types::Mp3Settings? = nil,
          @opus_settings : Types::OpusSettings? = nil,
          @vorbis_settings : Types::VorbisSettings? = nil,
          @wav_settings : Types::WavSettings? = nil
        )
        end
      end

      # Settings related to one audio tab on the MediaConvert console. In your job JSON, an instance of
      # AudioDescription is equivalent to one audio tab in the console. Usually, one audio tab corresponds
      # to one output audio track. Depending on how you set up your input audio selectors and whether you
      # use audio selector groups, one audio tab can correspond to a group of output audio tracks.

      struct AudioDescription
        include JSON::Serializable

        # Specify the QuickTime audio channel layout tags for the audio channels in this audio track. When you
        # don't specify a value, MediaConvert labels your track as Center (C) by default. To use Audio layout
        # tagging, your output must be in a QuickTime (MOV) container and your audio codec must be AAC, WAV,
        # or AIFF.

        @[JSON::Field(key: "audioChannelTaggingSettings")]
        getter audio_channel_tagging_settings : Types::AudioChannelTaggingSettings?

        # Advanced audio normalization settings. Ignore these settings unless you need to comply with a
        # loudness standard.

        @[JSON::Field(key: "audioNormalizationSettings")]
        getter audio_normalization_settings : Types::AudioNormalizationSettings?

        # Settings for audio pitch correction during framerate conversion.

        @[JSON::Field(key: "audioPitchCorrectionSettings")]
        getter audio_pitch_correction_settings : Types::AudioPitchCorrectionSettings?

        # Specifies which audio data to use from each input. In the simplest case, specify an "Audio
        # Selector":#inputs-audio_selector by name based on its order within each input. For example if you
        # specify "Audio Selector 3", then the third audio selector will be used from each input. If an input
        # does not have an "Audio Selector 3", then the audio selector marked as "default" in that input will
        # be used. If there is no audio selector marked as "default", silence will be inserted for the
        # duration of that input. Alternatively, an "Audio Selector Group":#inputs-audio_selector_group name
        # may be specified, with similar default/silence behavior. If no audio_source_name is specified, then
        # "Audio Selector 1" will be chosen automatically.

        @[JSON::Field(key: "audioSourceName")]
        getter audio_source_name : String?

        # Applies only if Follow Input Audio Type is unchecked (false). A number between 0 and 255. The
        # following are defined in ISO-IEC 13818-1: 0 = Undefined, 1 = Clean Effects, 2 = Hearing Impaired, 3
        # = Visually Impaired Commentary, 4-255 = Reserved.

        @[JSON::Field(key: "audioType")]
        getter audio_type : Int32?

        # When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then that value is passed
        # through to the output. If the input contains no ISO 639 audio_type, the value in Audio Type is
        # included in the output. Otherwise the value in Audio Type is included in the output. Note that this
        # field and audioType are both ignored if audioDescriptionBroadcasterMix is set to
        # BROADCASTER_MIXED_AD.

        @[JSON::Field(key: "audioTypeControl")]
        getter audio_type_control : String?

        # Settings related to audio encoding. The settings in this group vary depending on the value that you
        # choose for your audio codec.

        @[JSON::Field(key: "codecSettings")]
        getter codec_settings : Types::AudioCodecSettings?

        # Specify the language for this audio output track. The service puts this language code into your
        # output audio track when you set Language code control to Use configured. The service also uses your
        # specified custom language code when you set Language code control to Follow input, but your input
        # file doesn't specify a language code. For all outputs, you can use an ISO 639-2 or ISO 639-3 code.
        # For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming
        # outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
        # Microsoft Smooth Streaming.

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # Specify the language for your output audio track. To follow the input language: Leave blank. When
        # you do, also set Language code control to Follow input. If no input language is detected
        # MediaConvert will not write an output language code. To follow the input langauge, but fall back to
        # a specified language code if there is no input language to follow: Enter an ISO 639-2 three-letter
        # language code in all capital letters. When you do, also set Language code control to Follow input.
        # To specify the language code: Enter an ISO 639 three-letter language code in all capital letters.
        # When you do, also set Language code control to Use configured.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Specify which source for language code takes precedence for this audio track. When you choose Follow
        # input, the service uses the language code from the input track if it's present. If there's no
        # languge code on the input track, the service uses the code that you specify in the setting Language
        # code. When you choose Use configured, the service uses the language code that you specify.

        @[JSON::Field(key: "languageCodeControl")]
        getter language_code_control : String?

        # Advanced audio remixing settings.

        @[JSON::Field(key: "remixSettings")]
        getter remix_settings : Types::RemixSettings?

        # Specify a label for this output audio stream. For example, "English", "Director commentary", or
        # "track_2". For streaming outputs, MediaConvert passes this information into destination manifests
        # for display on the end-viewer's player device. For outputs in other output groups, the service
        # ignores this setting.

        @[JSON::Field(key: "streamName")]
        getter stream_name : String?

        def initialize(
          @audio_channel_tagging_settings : Types::AudioChannelTaggingSettings? = nil,
          @audio_normalization_settings : Types::AudioNormalizationSettings? = nil,
          @audio_pitch_correction_settings : Types::AudioPitchCorrectionSettings? = nil,
          @audio_source_name : String? = nil,
          @audio_type : Int32? = nil,
          @audio_type_control : String? = nil,
          @codec_settings : Types::AudioCodecSettings? = nil,
          @custom_language_code : String? = nil,
          @language_code : String? = nil,
          @language_code_control : String? = nil,
          @remix_settings : Types::RemixSettings? = nil,
          @stream_name : String? = nil
        )
        end
      end

      # Advanced audio normalization settings. Ignore these settings unless you need to comply with a
      # loudness standard.

      struct AudioNormalizationSettings
        include JSON::Serializable

        # Choose one of the following audio normalization algorithms: ITU-R BS.1770-1: Ungated loudness. A
        # measurement of ungated average loudness for an entire piece of content, suitable for measurement of
        # short-form content under ATSC recommendation A/85. Supports up to 5.1 audio channels. ITU-R
        # BS.1770-2: Gated loudness. A measurement of gated average loudness compliant with the requirements
        # of EBU-R128. Supports up to 5.1 audio channels. ITU-R BS.1770-3: Modified peak. The same loudness
        # measurement algorithm as 1770-2, with an updated true peak measurement. ITU-R BS.1770-4: Higher
        # channel count. Allows for more audio channels than the other algorithms, including configurations
        # such as 7.1.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # When enabled the output audio is corrected using the chosen algorithm. If disabled, the audio will
        # be measured but not adjusted.

        @[JSON::Field(key: "algorithmControl")]
        getter algorithm_control : String?

        # Content measuring above this level will be corrected to the target level. Content measuring below
        # this level will not be corrected.

        @[JSON::Field(key: "correctionGateLevel")]
        getter correction_gate_level : Int32?

        # If set to LOG, log each output's audio track loudness to a CSV file.

        @[JSON::Field(key: "loudnessLogging")]
        getter loudness_logging : String?

        # If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio track loudness.

        @[JSON::Field(key: "peakCalculation")]
        getter peak_calculation : String?

        # When you use Audio normalization, optionally use this setting to specify a target loudness. If you
        # don't specify a value here, the encoder chooses a value for you, based on the algorithm that you
        # choose for Algorithm. If you choose algorithm 1770-1, the encoder will choose -24 LKFS; otherwise,
        # the encoder will choose -23 LKFS.

        @[JSON::Field(key: "targetLkfs")]
        getter target_lkfs : Float64?

        # Specify the True-peak limiter threshold in decibels relative to full scale (dBFS). The peak
        # inter-audio sample loudness in your output will be limited to the value that you specify, without
        # affecting the overall target LKFS. Enter a value from 0 to -8. Leave blank to use the default value
        # 0.

        @[JSON::Field(key: "truePeakLimiterThreshold")]
        getter true_peak_limiter_threshold : Float64?

        def initialize(
          @algorithm : String? = nil,
          @algorithm_control : String? = nil,
          @correction_gate_level : Int32? = nil,
          @loudness_logging : String? = nil,
          @peak_calculation : String? = nil,
          @target_lkfs : Float64? = nil,
          @true_peak_limiter_threshold : Float64? = nil
        )
        end
      end

      # Settings for audio pitch correction during framerate conversion.

      struct AudioPitchCorrectionSettings
        include JSON::Serializable

        # Use Slow PAL pitch correction to compensate for audio pitch changes during slow PAL frame rate
        # conversion. This setting only applies when Slow PAL is enabled in your output video codec settings.
        # To automatically apply audio pitch correction: Choose Enabled. MediaConvert automatically applies a
        # pitch correction to your output to match the original content's audio pitch. To not apply audio
        # pitch correction: Keep the default value, Disabled.

        @[JSON::Field(key: "slowPalPitchCorrection")]
        getter slow_pal_pitch_correction : String?

        def initialize(
          @slow_pal_pitch_correction : String? = nil
        )
        end
      end

      # Details about the media file's audio track.

      struct AudioProperties
        include JSON::Serializable

        # The bit depth of the audio track.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # The bit rate of the audio track, in bits per second.

        @[JSON::Field(key: "bitRate")]
        getter bit_rate : Int64?

        # The number of audio channels in the audio track.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # The frame rate of the video or audio track, expressed as a fraction with numerator and denominator
        # values.

        @[JSON::Field(key: "frameRate")]
        getter frame_rate : Types::FrameRate?

        # The language code of the audio track, in three character ISO 639-3 format.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # The sample rate of the audio track.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @bit_rate : Int64? = nil,
          @channels : Int32? = nil,
          @frame_rate : Types::FrameRate? = nil,
          @language_code : String? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Use Audio selectors to specify a track or set of tracks from the input that you will use in your
      # outputs. You can use multiple Audio selectors per input.

      struct AudioSelector
        include JSON::Serializable

        # Apply audio timing corrections to help synchronize audio and video in your output. To apply timing
        # corrections, your input must meet the following requirements: * Container: MP4, or MOV, with an
        # accurate time-to-sample (STTS) table. * Audio track: AAC. Choose from the following audio timing
        # correction settings: * Disabled (Default): Apply no correction. * Auto: Recommended for most inputs.
        # MediaConvert analyzes the audio timing in your input and determines which correction setting to use,
        # if needed. * Track: Adjust the duration of each audio frame by a constant amount to align the audio
        # track length with STTS duration. Track-level correction does not affect pitch, and is recommended
        # for tonal audio content such as music. * Frame: Adjust the duration of each audio frame by a
        # variable amount to align audio frames with STTS timestamps. No corrections are made to
        # already-aligned frames. Frame-level correction may affect the pitch of corrected frames, and is
        # recommended for atonal audio content such as speech or percussion. * Force: Apply audio duration
        # correction, either Track or Frame depending on your input, regardless of the accuracy of your
        # input's STTS table. Your output audio and video may not be aligned or it may contain audio
        # artifacts.

        @[JSON::Field(key: "audioDurationCorrection")]
        getter audio_duration_correction : String?

        # Selects a specific language code from within an audio source, using the ISO 639-2 or ISO 639-3
        # three-letter language code

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # Specify a fallback audio selector for this input. Use to ensure outputs have audio even when the
        # audio selector you specify in your output is missing from the source. DEFAULT (Checked in the
        # MediaConvert console): If your output settings specify an audio selector that does not exist in this
        # input, MediaConvert uses this audio selector instead. This is useful when you have multiple inputs
        # with a different number of audio tracks. NOT_DEFAULT (Unchecked in the MediaConvert console):
        # MediaConvert will not fallback from any missing audio selector. Any output specifying a missing
        # audio selector will be silent.

        @[JSON::Field(key: "defaultSelection")]
        getter default_selection : String?

        # Specify the S3, HTTP, or HTTPS URL for your external audio file input.

        @[JSON::Field(key: "externalAudioFileInput")]
        getter external_audio_file_input : String?

        # Settings specific to audio sources in an HLS alternate rendition group. Specify the properties
        # (renditionGroupId, renditionName or renditionLanguageCode) to identify the unique audio track among
        # the alternative rendition groups present in the HLS manifest. If no unique track is found, or
        # multiple tracks match the properties provided, the job fails. If no properties in
        # hlsRenditionGroupSettings are specified, the default audio track within the video segment is chosen.
        # If there is no audio within video segment, the alternative audio with DEFAULT=YES is chosen instead.

        @[JSON::Field(key: "hlsRenditionGroupSettings")]
        getter hls_rendition_group_settings : Types::HlsRenditionGroupSettings?

        # Specify the language, using an ISO 639-2 three-letter code in all capital letters. You can find a
        # list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Specify a time delta, in milliseconds, to offset the audio from the input video. To specify no
        # offset: Keep the default value, 0. To specify an offset: Enter an integer from -2147483648 to
        # 2147483647

        @[JSON::Field(key: "offset")]
        getter offset : Int32?

        # Selects a specific PID from within an audio source (e.g. 257 selects PID 0x101).

        @[JSON::Field(key: "pids")]
        getter pids : Array(Int32)?

        # Use this setting for input streams that contain Dolby E, to have the service extract specific
        # program data from the track. To select multiple programs, create multiple selectors with the same
        # Track and different Program numbers. In the console, this setting is visible when you set Selector
        # type to Track. Choose the program number from the dropdown list. If your input file has incorrect
        # metadata, you can choose All channels instead of a program number to have the service ignore the
        # program IDs and include all the programs in the track.

        @[JSON::Field(key: "programSelection")]
        getter program_selection : Int32?

        # Use these settings to reorder the audio channels of one input to match those of another input. This
        # allows you to combine the two files into a single output, one after the other.

        @[JSON::Field(key: "remixSettings")]
        getter remix_settings : Types::RemixSettings?

        # Specify how MediaConvert selects audio content within your input. The default is Track. PID: Select
        # audio by specifying the Packet Identifier (PID) values for MPEG Transport Stream inputs. Use this
        # when you know the exact PID values of your audio streams. Track: Default. Select audio by track
        # number. This is the most common option and works with most input container formats. If more types of
        # audio data get recognized in the future, these numberings may shift, but the numberings used for
        # Stream mode will not. Language code: Select audio by language using an ISO 639-2 or ISO 639-3
        # three-letter code in all capital letters. Use this when your source has embedded language metadata
        # and you want to select tracks based on their language. HLS rendition group: Select audio from an HLS
        # rendition group. Use this when your input is an HLS package with multiple audio renditions and you
        # want to select specific rendition groups. All PCM: Select all uncompressed PCM audio tracks from
        # your input automatically. This is useful when you want to include all PCM audio tracks without
        # specifying individual track numbers. Stream: Select audio by stream number. Stream numbers include
        # all tracks in the source file, regardless of type, and correspond to either the order of tracks in
        # the file, or if applicable, the stream number metadata of the track. Although all tracks count
        # toward these stream numbers, in this audio selector context, only the stream number of a track
        # containing audio data may be used. If your source file contains a track which is not recognized by
        # the service, then the corresponding stream number will still be reserved for future use. If more
        # types of audio data get recognized in the future, these numberings will not shift.

        @[JSON::Field(key: "selectorType")]
        getter selector_type : String?

        # Identify a track from the input audio to include in this selector by entering the stream index
        # number. These numberings count all tracks in the input file, but only a track containing audio data
        # may be used here. To include several tracks in a single audio selector, specify multiple tracks as
        # follows. Using the console, enter a comma-separated list. For example, type "1,2,3" to include
        # tracks 1 through 3.

        @[JSON::Field(key: "streams")]
        getter streams : Array(Int32)?

        # Identify a track from the input audio to include in this selector by entering the track index
        # number. These numberings include only tracks recognized as audio. If the service recognizes more
        # types of audio tracks in the future, these numberings may shift. To include several tracks in a
        # single audio selector, specify multiple tracks as follows. Using the console, enter a
        # comma-separated list. For example, type "1,2,3" to include tracks 1 through 3.

        @[JSON::Field(key: "tracks")]
        getter tracks : Array(Int32)?

        def initialize(
          @audio_duration_correction : String? = nil,
          @custom_language_code : String? = nil,
          @default_selection : String? = nil,
          @external_audio_file_input : String? = nil,
          @hls_rendition_group_settings : Types::HlsRenditionGroupSettings? = nil,
          @language_code : String? = nil,
          @offset : Int32? = nil,
          @pids : Array(Int32)? = nil,
          @program_selection : Int32? = nil,
          @remix_settings : Types::RemixSettings? = nil,
          @selector_type : String? = nil,
          @streams : Array(Int32)? = nil,
          @tracks : Array(Int32)? = nil
        )
        end
      end

      # Use audio selector groups to combine multiple sidecar audio inputs so that you can assign them to a
      # single output audio tab. Note that, if you're working with embedded audio, it's simpler to assign
      # multiple input tracks into a single audio selector rather than use an audio selector group.

      struct AudioSelectorGroup
        include JSON::Serializable

        # Name of an Audio Selector within the same input to include in the group. Audio selector names are
        # standardized, based on their order within the input (e.g., "Audio Selector 1"). The audio selector
        # name parameter can be repeated to add any number of audio selectors to the group.

        @[JSON::Field(key: "audioSelectorNames")]
        getter audio_selector_names : Array(String)?

        def initialize(
          @audio_selector_names : Array(String)? = nil
        )
        end
      end

      # Specify one or more Automated ABR rule types. Note: Force include and Allowed renditions are
      # mutually exclusive.

      struct AutomatedAbrRule
        include JSON::Serializable

        # When customer adds the allowed renditions rule for auto ABR ladder, they are required to add at leat
        # one rendition to allowedRenditions list

        @[JSON::Field(key: "allowedRenditions")]
        getter allowed_renditions : Array(Types::AllowedRenditionSize)?

        # When customer adds the force include renditions rule for auto ABR ladder, they are required to add
        # at leat one rendition to forceIncludeRenditions list

        @[JSON::Field(key: "forceIncludeRenditions")]
        getter force_include_renditions : Array(Types::ForceIncludeRenditionSize)?

        # Use Min bottom rendition size to specify a minimum size for the lowest resolution in your ABR stack.
        # * The lowest resolution in your ABR stack will be equal to or greater than the value that you enter.
        # For example: If you specify 640x360 the lowest resolution in your ABR stack will be equal to or
        # greater than to 640x360. * If you specify a Min top rendition size rule, the value that you specify
        # for Min bottom rendition size must be less than, or equal to, Min top rendition size.

        @[JSON::Field(key: "minBottomRenditionSize")]
        getter min_bottom_rendition_size : Types::MinBottomRenditionSize?

        # Use Min top rendition size to specify a minimum size for the highest resolution in your ABR stack. *
        # The highest resolution in your ABR stack will be equal to or greater than the value that you enter.
        # For example: If you specify 1280x720 the highest resolution in your ABR stack will be equal to or
        # greater than 1280x720. * If you specify a value for Max resolution, the value that you specify for
        # Min top rendition size must be less than, or equal to, Max resolution.

        @[JSON::Field(key: "minTopRenditionSize")]
        getter min_top_rendition_size : Types::MinTopRenditionSize?

        # Use Min top rendition size to specify a minimum size for the highest resolution in your ABR stack. *
        # The highest resolution in your ABR stack will be equal to or greater than the value that you enter.
        # For example: If you specify 1280x720 the highest resolution in your ABR stack will be equal to or
        # greater than 1280x720. * If you specify a value for Max resolution, the value that you specify for
        # Min top rendition size must be less than, or equal to, Max resolution. Use Min bottom rendition size
        # to specify a minimum size for the lowest resolution in your ABR stack. * The lowest resolution in
        # your ABR stack will be equal to or greater than the value that you enter. For example: If you
        # specify 640x360 the lowest resolution in your ABR stack will be equal to or greater than to 640x360.
        # * If you specify a Min top rendition size rule, the value that you specify for Min bottom rendition
        # size must be less than, or equal to, Min top rendition size. Use Force include renditions to specify
        # one or more resolutions to include your ABR stack. * (Recommended) To optimize automated ABR,
        # specify as few resolutions as possible. * (Required) The number of resolutions that you specify must
        # be equal to, or less than, the Max renditions setting. * If you specify a Min top rendition size
        # rule, specify at least one resolution that is equal to, or greater than, Min top rendition size. *
        # If you specify a Min bottom rendition size rule, only specify resolutions that are equal to, or
        # greater than, Min bottom rendition size. * If you specify a Force include renditions rule, do not
        # specify a separate rule for Allowed renditions. * Note: The ABR stack may include other resolutions
        # that you do not specify here, depending on the Max renditions setting. Use Allowed renditions to
        # specify a list of possible resolutions in your ABR stack. * (Required) The number of resolutions
        # that you specify must be equal to, or greater than, the Max renditions setting. * MediaConvert will
        # create an ABR stack exclusively from the list of resolutions that you specify. * Some resolutions in
        # the Allowed renditions list may not be included, however you can force a resolution to be included
        # by setting Required to ENABLED. * You must specify at least one resolution that is greater than or
        # equal to any resolutions that you specify in Min top rendition size or Min bottom rendition size. *
        # If you specify Allowed renditions, you must not specify a separate rule for Force include
        # renditions.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allowed_renditions : Array(Types::AllowedRenditionSize)? = nil,
          @force_include_renditions : Array(Types::ForceIncludeRenditionSize)? = nil,
          @min_bottom_rendition_size : Types::MinBottomRenditionSize? = nil,
          @min_top_rendition_size : Types::MinTopRenditionSize? = nil,
          @type : String? = nil
        )
        end
      end

      # Use automated ABR to have MediaConvert set up the renditions in your ABR package for you
      # automatically, based on characteristics of your input video. This feature optimizes video quality
      # while minimizing the overall size of your ABR package.

      struct AutomatedAbrSettings
        include JSON::Serializable

        # Specify the maximum average bitrate for MediaConvert to use in your automated ABR stack. If you
        # don't specify a value, MediaConvert uses 8,000,000 (8 mb/s) by default. The average bitrate of your
        # highest-quality rendition will be equal to or below this value, depending on the quality,
        # complexity, and resolution of your content. Note that the instantaneous maximum bitrate may vary
        # above the value that you specify.

        @[JSON::Field(key: "maxAbrBitrate")]
        getter max_abr_bitrate : Int32?

        # Optional. Specify the QVBR quality level to use for all renditions in your automated ABR stack. To
        # have MediaConvert automatically determine the quality level: Leave blank. To manually specify a
        # quality level: Enter a value from 1 to 10. MediaConvert will use a quality level up to the value
        # that you specify, depending on your source. For more information about QVBR quality levels, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/qvbr-guidelines.html

        @[JSON::Field(key: "maxQualityLevel")]
        getter max_quality_level : Float64?

        # Optional. The maximum number of renditions that MediaConvert will create in your automated ABR
        # stack. The number of renditions is determined automatically, based on analysis of each job, but will
        # never exceed this limit. When you set this to Auto in the console, which is equivalent to excluding
        # it from your JSON job specification, MediaConvert defaults to a limit of 15.

        @[JSON::Field(key: "maxRenditions")]
        getter max_renditions : Int32?

        # Specify the minimum average bitrate for MediaConvert to use in your automated ABR stack. If you
        # don't specify a value, MediaConvert uses 600,000 (600 kb/s) by default. The average bitrate of your
        # lowest-quality rendition will be near this value. Note that the instantaneous minimum bitrate may
        # vary below the value that you specify.

        @[JSON::Field(key: "minAbrBitrate")]
        getter min_abr_bitrate : Int32?

        # Optional. Use Automated ABR rules to specify restrictions for the rendition sizes MediaConvert will
        # create in your ABR stack. You can use these rules if your ABR workflow has specific rendition size
        # requirements, but you still want MediaConvert to optimize for video quality and overall file size.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::AutomatedAbrRule)?

        def initialize(
          @max_abr_bitrate : Int32? = nil,
          @max_quality_level : Float64? = nil,
          @max_renditions : Int32? = nil,
          @min_abr_bitrate : Int32? = nil,
          @rules : Array(Types::AutomatedAbrRule)? = nil
        )
        end
      end

      # Use automated encoding to have MediaConvert choose your encoding settings for you, based on
      # characteristics of your input video.

      struct AutomatedEncodingSettings
        include JSON::Serializable

        # Use automated ABR to have MediaConvert set up the renditions in your ABR package for you
        # automatically, based on characteristics of your input video. This feature optimizes video quality
        # while minimizing the overall size of your ABR package.

        @[JSON::Field(key: "abrSettings")]
        getter abr_settings : Types::AutomatedAbrSettings?

        def initialize(
          @abr_settings : Types::AutomatedAbrSettings? = nil
        )
        end
      end

      # Settings for quality-defined variable bitrate encoding with the AV1 codec. Use these settings only
      # when you set QVBR for Rate control mode.

      struct Av1QvbrSettings
        include JSON::Serializable

        # Use this setting only when you set Rate control mode to QVBR. Specify the target quality level for
        # this output. MediaConvert determines the right number of bits to use for each part of the video to
        # maintain the video quality that you specify. When you keep the default value, AUTO, MediaConvert
        # picks a quality level for you, based on characteristics of your input video. If you prefer to
        # specify a quality level, specify a number from 1 through 10. Use higher numbers for greater quality.
        # Level 10 results in nearly lossless compression. The quality level for most broadcast-quality
        # transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a
        # value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to
        # be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For
        # example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set
        # qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of
        # a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune
        # to .25, your actual QVBR quality level is 7.33.

        @[JSON::Field(key: "qvbrQualityLevelFineTune")]
        getter qvbr_quality_level_fine_tune : Float64?

        def initialize(
          @qvbr_quality_level : Int32? = nil,
          @qvbr_quality_level_fine_tune : Float64? = nil
        )
        end
      end

      # Required when you set Codec, under VideoDescription>CodecSettings to the value AV1.

      struct Av1Settings
        include JSON::Serializable

        # Specify the strength of any adaptive quantization filters that you enable. The value that you choose
        # here applies to Spatial adaptive quantization.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Specify the Bit depth. You can choose 8-bit or 10-bit.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : String?

        # Film grain synthesis replaces film grain present in your content with similar quality synthesized
        # AV1 film grain. We recommend that you choose Enabled to reduce the bandwidth of your QVBR quality
        # level 5, 6, 7, or 8 outputs. For QVBR quality level 9 or 10 outputs we recommend that you keep the
        # default value, Disabled. When you include Film grain synthesis, you cannot include the Noise reducer
        # preprocessor.

        @[JSON::Field(key: "filmGrainSynthesis")]
        getter film_grain_synthesis : String?

        # Use the Framerate setting to specify the frame rate for this output. If you want to keep the same
        # frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose
        # a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are
        # decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Specify the GOP length (keyframe interval) in frames. With AV1, MediaConvert doesn't support GOP
        # length in seconds. This value must be greater than zero and preferably equal to 1 + ((numberBFrames
        # + 1) * x), where x is an integer value.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required
        # when Rate control mode is QVBR.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Specify from the number of B-frames, in the range of 0-15. For AV1 encoding, we recommend using 7 or
        # 15. Choose a larger number for a lower bitrate and smaller file size; choose a smaller number for
        # better video quality.

        @[JSON::Field(key: "numberBFramesBetweenReferenceFrames")]
        getter number_b_frames_between_reference_frames : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Settings for quality-defined variable bitrate encoding with the H.265 codec. Use these settings only
        # when you set QVBR for Rate control mode.

        @[JSON::Field(key: "qvbrSettings")]
        getter qvbr_settings : Types::Av1QvbrSettings?

        # 'With AV1 outputs, for rate control mode, MediaConvert supports only quality-defined variable
        # bitrate (QVBR). You can''t use CBR or VBR.'

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Specify the number of slices per picture. This value must be 1, 2, 4, 8, 16, or 32. For progressive
        # pictures, this value must be less than or equal to the number of macroblock rows. For interlaced
        # pictures, this value must be less than or equal to half the number of macroblock rows.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Keep the default value, Enabled, to adjust quantization within each frame based on spatial variation
        # of content complexity. When you enable this feature, the encoder uses fewer bits on areas that can
        # sustain more distortion with no noticeable visual degradation and uses more bits on areas where any
        # small distortion will be noticeable. For example, complex textured blocks are encoded with fewer
        # bits and smooth textured blocks are encoded with more bits. Enabling this feature will almost always
        # improve your video quality. Note, though, that this feature doesn't take into account where the
        # viewer's attention is likely to be. If viewers are likely to be focusing their attention on a part
        # of the screen with a lot of complex texture, you might choose to disable this feature. Related
        # setting: When you enable spatial adaptive quantization, set the value for Adaptive quantization
        # depending on your content. For homogeneous content, such as cartoons and video games, set it to Low.
        # For content with a wider variety of textures, set it to High or Higher.

        @[JSON::Field(key: "spatialAdaptiveQuantization")]
        getter spatial_adaptive_quantization : String?

        def initialize(
          @adaptive_quantization : String? = nil,
          @bit_depth : String? = nil,
          @film_grain_synthesis : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_size : Float64? = nil,
          @max_bitrate : Int32? = nil,
          @number_b_frames_between_reference_frames : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @qvbr_settings : Types::Av1QvbrSettings? = nil,
          @rate_control_mode : String? = nil,
          @slices : Int32? = nil,
          @spatial_adaptive_quantization : String? = nil
        )
        end
      end

      # Use ad avail blanking settings to specify your output content during SCTE-35 triggered ad avails.
      # You can blank your video or overlay it with an image. MediaConvert also removes any audio and
      # embedded captions during the ad avail. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/ad-avail-blanking.html.

      struct AvailBlanking
        include JSON::Serializable

        # Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.

        @[JSON::Field(key: "availBlankingImage")]
        getter avail_blanking_image : String?

        def initialize(
          @avail_blanking_image : String? = nil
        )
        end
      end

      # Required when you choose AVC-Intra for your output video codec. For more information about the
      # AVC-Intra settings, see the relevant specification. For detailed information about SD and HD in
      # AVC-Intra, see https://ieeexplore.ieee.org/document/7290936. For information about 4K/2K in
      # AVC-Intra, see https://pro-av.panasonic.net/en/avc-ultra/AVC-ULTRAoverview.pdf.

      struct AvcIntraSettings
        include JSON::Serializable

        # Specify the AVC-Intra class of your output. The AVC-Intra class selection determines the output
        # video bit rate depending on the frame rate of the output. Outputs with higher class values have
        # higher bitrates and improved image quality. Note that for Class 4K/2K, MediaConvert supports only
        # 4:2:2 chroma subsampling.

        @[JSON::Field(key: "avcIntraClass")]
        getter avc_intra_class : String?

        # Optional when you set AVC-Intra class to Class 4K/2K. When you set AVC-Intra class to a different
        # value, this object isn't allowed.

        @[JSON::Field(key: "avcIntraUhdSettings")]
        getter avc_intra_uhd_settings : Types::AvcIntraUhdSettings?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output. When you enable slow PAL, MediaConvert relabels the video frames
        # to 25 fps and resamples your audio to keep it synchronized with the video. Note that enabling this
        # setting will slightly reduce the duration of your video. Required settings: You must also set
        # Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard telecine to create a smoother picture. When
        # you keep the default value, None, MediaConvert does a standard frame rate conversion to 29.97
        # without doing anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        def initialize(
          @avc_intra_class : String? = nil,
          @avc_intra_uhd_settings : Types::AvcIntraUhdSettings? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @interlace_mode : String? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @scan_type_conversion_mode : String? = nil,
          @slow_pal : String? = nil,
          @telecine : String? = nil
        )
        end
      end

      # Optional when you set AVC-Intra class to Class 4K/2K. When you set AVC-Intra class to a different
      # value, this object isn't allowed.

      struct AvcIntraUhdSettings
        include JSON::Serializable

        # Optional. Use Quality tuning level to choose how many transcoding passes MediaConvert does with your
        # video. When you choose Multi-pass, your video quality is better and your output bitrate is more
        # accurate. That is, the actual bitrate of your output is closer to the target bitrate defined in the
        # specification. When you choose Single-pass, your encoding time is faster. The default behavior is
        # Single-pass.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        def initialize(
          @quality_tuning_level : String? = nil
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

      # The Bandwidth reduction filter increases the video quality of your output relative to its bitrate.
      # Use to lower the bitrate of your constant quality QVBR output, with little or no perceptual decrease
      # in quality. Or, use to increase the video quality of outputs with other rate control modes relative
      # to the bitrate that you specify. Bandwidth reduction increases further when your input is low
      # quality or noisy. Outputs that use this feature incur pro-tier pricing. When you include Bandwidth
      # reduction filter, you cannot include the Noise reducer preprocessor.

      struct BandwidthReductionFilter
        include JSON::Serializable

        # Optionally specify the level of sharpening to apply when you use the Bandwidth reduction filter.
        # Sharpening adds contrast to the edges of your video content and can reduce softness. Keep the
        # default value Off to apply no sharpening. Set Sharpening strength to Low to apply a minimal amount
        # of sharpening, or High to apply a maximum amount of sharpening.

        @[JSON::Field(key: "sharpening")]
        getter sharpening : String?

        # Specify the strength of the Bandwidth reduction filter. For most workflows, we recommend that you
        # choose Auto to reduce the bandwidth of your output with little to no perceptual decrease in video
        # quality. For high quality and high bitrate outputs, choose Low. For the most bandwidth reduction,
        # choose High. We recommend that you choose High for low bitrate outputs. Note that High may incur a
        # slight increase in the softness of your output.

        @[JSON::Field(key: "strength")]
        getter strength : String?

        def initialize(
          @sharpening : String? = nil,
          @strength : String? = nil
        )
        end
      end

      # Burn-in is a captions delivery method, rather than a captions format. Burn-in writes the captions
      # directly on your video frames, replacing pixels of video content with the captions. Set up burn-in
      # captions in the same output as your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/burn-in-output-captions.html.

      struct BurninDestinationSettings
        include JSON::Serializable

        # Specify the alignment of your captions. If no explicit x_position is provided, setting alignment to
        # centered will placethe captions at the bottom center of the output. Similarly, setting a left
        # alignment willalign captions to the bottom left of the output. If x and y positions are given in
        # conjunction with the alignment parameter, the font will be justified (either left or centered)
        # relative to those coordinates.

        @[JSON::Field(key: "alignment")]
        getter alignment : String?

        # Ignore this setting unless Style passthrough is set to Enabled and Font color set to Black, Yellow,
        # Red, Green, Blue, or Hex. Use Apply font color for additional font color controls. When you choose
        # White text only, or leave blank, your font color setting only applies to white text in your input
        # captions. For example, if your font color setting is Yellow, and your input captions have red and
        # white text, your output captions will have red and yellow text. When you choose ALL_TEXT, your font
        # color setting applies to all of your output captions text.

        @[JSON::Field(key: "applyFontColor")]
        getter apply_font_color : String?

        # Specify the color of the rectangle behind the captions. Leave background color blank and set Style
        # passthrough to enabled to use the background color data from your input captions, if present.

        @[JSON::Field(key: "backgroundColor")]
        getter background_color : String?

        # Specify the opacity of the background rectangle. Enter a value from 0 to 255, where 0 is transparent
        # and 255 is opaque. If Style passthrough is set to enabled, leave blank to pass through the
        # background style information in your input captions to your output captions. If Style passthrough is
        # set to disabled, leave blank to use a value of 0 and remove all backgrounds from your output
        # captions.

        @[JSON::Field(key: "backgroundOpacity")]
        getter background_opacity : Int32?

        # Specify the font that you want the service to use for your burn in captions when your input captions
        # specify a font that MediaConvert doesn't support. When you set Fallback font to best match, or leave
        # blank, MediaConvert uses a supported font that most closely matches the font that your input
        # captions specify. When there are multiple unsupported fonts in your input captions, MediaConvert
        # matches each font with the supported font that matches best. When you explicitly choose a
        # replacement font, MediaConvert uses that font to replace all unsupported fonts from your input.

        @[JSON::Field(key: "fallbackFont")]
        getter fallback_font : String?

        # Specify the color of the burned-in captions text. Leave Font color blank and set Style passthrough
        # to enabled to use the font color data from your input captions, if present.

        @[JSON::Field(key: "fontColor")]
        getter font_color : String?

        # Specify a bold TrueType font file to use when rendering your output captions. Enter an S3, HTTP, or
        # HTTPS URL. When you do, you must also separately specify a regular, an italic, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileBold")]
        getter font_file_bold : String?

        # Specify a bold italic TrueType font file to use when rendering your output captions. Enter an S3,
        # HTTP, or HTTPS URL. When you do, you must also separately specify a regular, a bold, and an italic
        # font file.

        @[JSON::Field(key: "fontFileBoldItalic")]
        getter font_file_bold_italic : String?

        # Specify an italic TrueType font file to use when rendering your output captions. Enter an S3, HTTP,
        # or HTTPS URL. When you do, you must also separately specify a regular, a bold, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileItalic")]
        getter font_file_italic : String?

        # Specify a regular TrueType font file to use when rendering your output captions. Enter an S3, HTTP,
        # or HTTPS URL. When you do, you must also separately specify a bold, an italic, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileRegular")]
        getter font_file_regular : String?

        # Specify the opacity of the burned-in captions. 255 is opaque; 0 is transparent.

        @[JSON::Field(key: "fontOpacity")]
        getter font_opacity : Int32?

        # Specify the Font resolution in DPI (dots per inch).

        @[JSON::Field(key: "fontResolution")]
        getter font_resolution : Int32?

        # Set Font script to Automatically determined, or leave blank, to automatically determine the font
        # script in your input captions. Otherwise, set to Simplified Chinese (HANS) or Traditional Chinese
        # (HANT) if your input font script uses Simplified or Traditional Chinese.

        @[JSON::Field(key: "fontScript")]
        getter font_script : String?

        # Specify the Font size in pixels. Must be a positive integer. Set to 0, or leave blank, for automatic
        # font size.

        @[JSON::Field(key: "fontSize")]
        getter font_size : Int32?

        # Ignore this setting unless your Font color is set to Hex. Enter either six or eight hexidecimal
        # digits, representing red, green, and blue, with two optional extra digits for alpha. For example a
        # value of 1122AABB is a red value of 0x11, a green value of 0x22, a blue value of 0xAA, and an alpha
        # value of 0xBB.

        @[JSON::Field(key: "hexFontColor")]
        getter hex_font_color : String?

        # Specify font outline color. Leave Outline color blank and set Style passthrough to enabled to use
        # the font outline color data from your input captions, if present.

        @[JSON::Field(key: "outlineColor")]
        getter outline_color : String?

        # Specify the Outline size of the caption text, in pixels. Leave Outline size blank and set Style
        # passthrough to enabled to use the outline size data from your input captions, if present.

        @[JSON::Field(key: "outlineSize")]
        getter outline_size : Int32?

        # Optionally remove any tts:rubyReserve attributes present in your input, that do not have a tts:ruby
        # attribute in the same element, from your output. Use if your vertical Japanese output captions have
        # alignment issues. To remove ruby reserve attributes when present: Choose Enabled. To not remove any
        # ruby reserve attributes: Keep the default value, Disabled.

        @[JSON::Field(key: "removeRubyReserveAttributes")]
        getter remove_ruby_reserve_attributes : String?

        # Specify the color of the shadow cast by the captions. Leave Shadow color blank and set Style
        # passthrough to enabled to use the shadow color data from your input captions, if present.

        @[JSON::Field(key: "shadowColor")]
        getter shadow_color : String?

        # Specify the opacity of the shadow. Enter a value from 0 to 255, where 0 is transparent and 255 is
        # opaque. If Style passthrough is set to Enabled, leave Shadow opacity blank to pass through the
        # shadow style information in your input captions to your output captions. If Style passthrough is set
        # to disabled, leave blank to use a value of 0 and remove all shadows from your output captions.

        @[JSON::Field(key: "shadowOpacity")]
        getter shadow_opacity : Int32?

        # Specify the horizontal offset of the shadow, relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels to the left.

        @[JSON::Field(key: "shadowXOffset")]
        getter shadow_x_offset : Int32?

        # Specify the vertical offset of the shadow relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels above the text. Leave Shadow y-offset blank and set Style
        # passthrough to enabled to use the shadow y-offset data from your input captions, if present.

        @[JSON::Field(key: "shadowYOffset")]
        getter shadow_y_offset : Int32?

        # To use the available style, color, and position information from your input captions: Set Style
        # passthrough to Enabled. Note that MediaConvert uses default settings for any missing style or
        # position information in your input captions To ignore the style and position information from your
        # input captions and use default settings: Leave blank or keep the default value, Disabled. Default
        # settings include white text with black outlining, bottom-center positioning, and automatic sizing.
        # Whether you set Style passthrough to enabled or not, you can also choose to manually override any of
        # the individual style and position settings. You can also override any fonts by manually specifying
        # custom font files.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        # Specify whether the text spacing in your captions is set by the captions grid, or varies depending
        # on letter width. Choose fixed grid to conform to the spacing specified in the captions file more
        # accurately. Choose proportional to make the text easier to read for closed captions.

        @[JSON::Field(key: "teletextSpacing")]
        getter teletext_spacing : String?

        # Specify the horizontal position of the captions, relative to the left side of the output in pixels.
        # A value of 10 would result in the captions starting 10 pixels from the left of the output. If no
        # explicit x_position is provided, the horizontal caption position will be determined by the alignment
        # parameter.

        @[JSON::Field(key: "xPosition")]
        getter x_position : Int32?

        # Specify the vertical position of the captions, relative to the top of the output in pixels. A value
        # of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit
        # y_position is provided, the caption will be positioned towards the bottom of the output.

        @[JSON::Field(key: "yPosition")]
        getter y_position : Int32?

        def initialize(
          @alignment : String? = nil,
          @apply_font_color : String? = nil,
          @background_color : String? = nil,
          @background_opacity : Int32? = nil,
          @fallback_font : String? = nil,
          @font_color : String? = nil,
          @font_file_bold : String? = nil,
          @font_file_bold_italic : String? = nil,
          @font_file_italic : String? = nil,
          @font_file_regular : String? = nil,
          @font_opacity : Int32? = nil,
          @font_resolution : Int32? = nil,
          @font_script : String? = nil,
          @font_size : Int32? = nil,
          @hex_font_color : String? = nil,
          @outline_color : String? = nil,
          @outline_size : Int32? = nil,
          @remove_ruby_reserve_attributes : String? = nil,
          @shadow_color : String? = nil,
          @shadow_opacity : Int32? = nil,
          @shadow_x_offset : Int32? = nil,
          @shadow_y_offset : Int32? = nil,
          @style_passthrough : String? = nil,
          @teletext_spacing : String? = nil,
          @x_position : Int32? = nil,
          @y_position : Int32? = nil
        )
        end
      end

      # Cancel a job by sending a request with the job ID

      struct CancelJobRequest
        include JSON::Serializable

        # The Job ID of the job to be cancelled.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A cancel job request will receive a response with an empty body.

      struct CancelJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This object holds groups of settings related to captions for one output. For each output that has
      # captions, include one instance of CaptionDescriptions.

      struct CaptionDescription
        include JSON::Serializable

        # Specifies which "Caption Selector":#inputs-caption_selector to use from each input when generating
        # captions. The name should be of the format "Caption Selector ", which denotes that the Nth Caption
        # Selector will be used from each input.

        @[JSON::Field(key: "captionSelectorName")]
        getter caption_selector_name : String?

        # Specify the language for this captions output track. For most captions output formats, the encoder
        # puts this language information in the output captions metadata. If your output captions format is
        # DVB-Sub or Burn in, the encoder uses this language information when automatically selecting the font
        # script for rendering the captions text. For all outputs, you can use an ISO 639-2 or ISO 639-3 code.
        # For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming
        # outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
        # Microsoft Smooth Streaming.

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # Settings related to one captions tab on the MediaConvert console. Usually, one captions tab
        # corresponds to one output captions track. Depending on your output captions format, one tab might
        # correspond to a set of output captions tracks. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/including-captions.html.

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::CaptionDestinationSettings?

        # Specify the language of this captions output track. For most captions output formats, the encoder
        # puts this language information in the output captions metadata. If your output captions format is
        # DVB-Sub or Burn in, the encoder uses this language information to choose the font language for
        # rendering the captions text.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Specify a label for this set of output captions. For example, "English", "Director commentary", or
        # "track_2". For streaming outputs, MediaConvert passes this information into destination manifests
        # for display on the end-viewer's player device. For outputs in other output groups, the service
        # ignores this setting.

        @[JSON::Field(key: "languageDescription")]
        getter language_description : String?

        def initialize(
          @caption_selector_name : String? = nil,
          @custom_language_code : String? = nil,
          @destination_settings : Types::CaptionDestinationSettings? = nil,
          @language_code : String? = nil,
          @language_description : String? = nil
        )
        end
      end

      # Caption Description for preset

      struct CaptionDescriptionPreset
        include JSON::Serializable

        # Specify the language for this captions output track. For most captions output formats, the encoder
        # puts this language information in the output captions metadata. If your output captions format is
        # DVB-Sub or Burn in, the encoder uses this language information when automatically selecting the font
        # script for rendering the captions text. For all outputs, you can use an ISO 639-2 or ISO 639-3 code.
        # For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming
        # outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
        # Microsoft Smooth Streaming.

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # Settings related to one captions tab on the MediaConvert console. Usually, one captions tab
        # corresponds to one output captions track. Depending on your output captions format, one tab might
        # correspond to a set of output captions tracks. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/including-captions.html.

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::CaptionDestinationSettings?

        # Specify the language of this captions output track. For most captions output formats, the encoder
        # puts this language information in the output captions metadata. If your output captions format is
        # DVB-Sub or Burn in, the encoder uses this language information to choose the font language for
        # rendering the captions text.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Specify a label for this set of output captions. For example, "English", "Director commentary", or
        # "track_2". For streaming outputs, MediaConvert passes this information into destination manifests
        # for display on the end-viewer's player device. For outputs in other output groups, the service
        # ignores this setting.

        @[JSON::Field(key: "languageDescription")]
        getter language_description : String?

        def initialize(
          @custom_language_code : String? = nil,
          @destination_settings : Types::CaptionDestinationSettings? = nil,
          @language_code : String? = nil,
          @language_description : String? = nil
        )
        end
      end

      # Settings related to one captions tab on the MediaConvert console. Usually, one captions tab
      # corresponds to one output captions track. Depending on your output captions format, one tab might
      # correspond to a set of output captions tracks. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/including-captions.html.

      struct CaptionDestinationSettings
        include JSON::Serializable

        # Burn-in is a captions delivery method, rather than a captions format. Burn-in writes the captions
        # directly on your video frames, replacing pixels of video content with the captions. Set up burn-in
        # captions in the same output as your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/burn-in-output-captions.html.

        @[JSON::Field(key: "burninDestinationSettings")]
        getter burnin_destination_settings : Types::BurninDestinationSettings?

        # Specify the format for this set of captions on this output. The default format is embedded without
        # SCTE-20. Note that your choice of video output container constrains your choice of output captions
        # format. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/captions-support-tables.html. If you are using
        # SCTE-20 and you want to create an output that complies with the SCTE-43 spec, choose SCTE-20 plus
        # embedded. To create a non-compliant output where the embedded captions come first, choose Embedded
        # plus SCTE-20.

        @[JSON::Field(key: "destinationType")]
        getter destination_type : String?

        # Settings related to DVB-Sub captions. Set up DVB-Sub captions in the same output as your video. For
        # more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/dvb-sub-output-captions.html.

        @[JSON::Field(key: "dvbSubDestinationSettings")]
        getter dvb_sub_destination_settings : Types::DvbSubDestinationSettings?

        # Settings related to CEA/EIA-608 and CEA/EIA-708 (also called embedded or ancillary) captions. Set up
        # embedded captions in the same output as your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/embedded-output-captions.html.

        @[JSON::Field(key: "embeddedDestinationSettings")]
        getter embedded_destination_settings : Types::EmbeddedDestinationSettings?

        # Settings related to IMSC captions. IMSC is a sidecar format that holds captions in a file that is
        # separate from the video container. Set up sidecar captions in the same output group, but different
        # output from your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

        @[JSON::Field(key: "imscDestinationSettings")]
        getter imsc_destination_settings : Types::ImscDestinationSettings?

        # Settings related to SCC captions. SCC is a sidecar format that holds captions in a file that is
        # separate from the video container. Set up sidecar captions in the same output group, but different
        # output from your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/scc-srt-output-captions.html.

        @[JSON::Field(key: "sccDestinationSettings")]
        getter scc_destination_settings : Types::SccDestinationSettings?

        # Settings related to SRT captions. SRT is a sidecar format that holds captions in a file that is
        # separate from the video container. Set up sidecar captions in the same output group, but different
        # output from your video.

        @[JSON::Field(key: "srtDestinationSettings")]
        getter srt_destination_settings : Types::SrtDestinationSettings?

        # Settings related to teletext captions. Set up teletext captions in the same output as your video.
        # For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/teletext-output-captions.html.

        @[JSON::Field(key: "teletextDestinationSettings")]
        getter teletext_destination_settings : Types::TeletextDestinationSettings?

        # Settings related to TTML captions. TTML is a sidecar format that holds captions in a file that is
        # separate from the video container. Set up sidecar captions in the same output group, but different
        # output from your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

        @[JSON::Field(key: "ttmlDestinationSettings")]
        getter ttml_destination_settings : Types::TtmlDestinationSettings?

        # Settings related to WebVTT captions. WebVTT is a sidecar format that holds captions in a file that
        # is separate from the video container. Set up sidecar captions in the same output group, but
        # different output from your video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

        @[JSON::Field(key: "webvttDestinationSettings")]
        getter webvtt_destination_settings : Types::WebvttDestinationSettings?

        def initialize(
          @burnin_destination_settings : Types::BurninDestinationSettings? = nil,
          @destination_type : String? = nil,
          @dvb_sub_destination_settings : Types::DvbSubDestinationSettings? = nil,
          @embedded_destination_settings : Types::EmbeddedDestinationSettings? = nil,
          @imsc_destination_settings : Types::ImscDestinationSettings? = nil,
          @scc_destination_settings : Types::SccDestinationSettings? = nil,
          @srt_destination_settings : Types::SrtDestinationSettings? = nil,
          @teletext_destination_settings : Types::TeletextDestinationSettings? = nil,
          @ttml_destination_settings : Types::TtmlDestinationSettings? = nil,
          @webvtt_destination_settings : Types::WebvttDestinationSettings? = nil
        )
        end
      end

      # Use captions selectors to specify the captions data from your input that you use in your outputs.
      # You can use up to 100 captions selectors per input.

      struct CaptionSelector
        include JSON::Serializable

        # The specific language to extract from source, using the ISO 639-2 or ISO 639-3 three-letter language
        # code. If input is SCTE-27, complete this field and/or PID to select the caption language to extract.
        # If input is DVB-Sub and output is Burn-in, complete this field and/or PID to select the caption
        # language to extract. If input is DVB-Sub that is being passed through, omit this field (and PID
        # field); there is no way to extract a specific language with pass-through captions.

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # The specific language to extract from source. If input is SCTE-27, complete this field and/or PID to
        # select the caption language to extract. If input is DVB-Sub and output is Burn-in, complete this
        # field and/or PID to select the caption language to extract. If input is DVB-Sub that is being passed
        # through, omit this field (and PID field); there is no way to extract a specific language with
        # pass-through captions.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the
        # input captions source file. If your input captions are IMSC in an IMF package, use
        # TrackSourceSettings instead of FileSoureSettings.

        @[JSON::Field(key: "sourceSettings")]
        getter source_settings : Types::CaptionSourceSettings?

        def initialize(
          @custom_language_code : String? = nil,
          @language_code : String? = nil,
          @source_settings : Types::CaptionSourceSettings? = nil
        )
        end
      end

      # Ignore this setting unless your input captions format is SCC. To have the service compensate for
      # differing frame rates between your input captions and input video, specify the frame rate of the
      # captions file. Specify this value as a fraction. For example, you might specify 24 / 1 for 24 fps,
      # 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.

      struct CaptionSourceFramerate
        include JSON::Serializable

        # Specify the denominator of the fraction that represents the frame rate for the setting Caption
        # source frame rate. Use this setting along with the setting Framerate numerator.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # Specify the numerator of the fraction that represents the frame rate for the setting Caption source
        # frame rate. Use this setting along with the setting Framerate denominator.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        def initialize(
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil
        )
        end
      end

      # If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the
      # input captions source file. If your input captions are IMSC in an IMF package, use
      # TrackSourceSettings instead of FileSoureSettings.

      struct CaptionSourceSettings
        include JSON::Serializable

        # Settings for ancillary captions source.

        @[JSON::Field(key: "ancillarySourceSettings")]
        getter ancillary_source_settings : Types::AncillarySourceSettings?

        # DVB Sub Source Settings

        @[JSON::Field(key: "dvbSubSourceSettings")]
        getter dvb_sub_source_settings : Types::DvbSubSourceSettings?

        # Settings for embedded captions Source

        @[JSON::Field(key: "embeddedSourceSettings")]
        getter embedded_source_settings : Types::EmbeddedSourceSettings?

        # If your input captions are SCC, SMI, SRT, STL, TTML, WebVTT, or IMSC 1.1 in an xml file, specify the
        # URI of the input caption source file. If your caption source is IMSC in an IMF package, use
        # TrackSourceSettings instead of FileSoureSettings.

        @[JSON::Field(key: "fileSourceSettings")]
        getter file_source_settings : Types::FileSourceSettings?

        # Use Source to identify the format of your input captions. The service cannot auto-detect caption
        # format.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String?

        # Settings specific to Teletext caption sources, including Page number.

        @[JSON::Field(key: "teletextSourceSettings")]
        getter teletext_source_settings : Types::TeletextSourceSettings?

        # Settings specific to caption sources that are specified by track number. Currently, this is only
        # IMSC captions in an IMF package. If your caption source is IMSC 1.1 in a separate xml file, use
        # FileSourceSettings instead of TrackSourceSettings.

        @[JSON::Field(key: "trackSourceSettings")]
        getter track_source_settings : Types::TrackSourceSettings?

        # Settings specific to WebVTT sources in HLS alternative rendition group. Specify the properties
        # (renditionGroupId, renditionName or renditionLanguageCode) to identify the unique subtitle track
        # among the alternative rendition groups present in the HLS manifest. If no unique track is found, or
        # multiple tracks match the specified properties, the job fails. If there is only one subtitle track
        # in the rendition group, the settings can be left empty and the default subtitle track will be
        # chosen. If your caption source is a sidecar file, use FileSourceSettings instead of
        # WebvttHlsSourceSettings.

        @[JSON::Field(key: "webvttHlsSourceSettings")]
        getter webvtt_hls_source_settings : Types::WebvttHlsSourceSettings?

        def initialize(
          @ancillary_source_settings : Types::AncillarySourceSettings? = nil,
          @dvb_sub_source_settings : Types::DvbSubSourceSettings? = nil,
          @embedded_source_settings : Types::EmbeddedSourceSettings? = nil,
          @file_source_settings : Types::FileSourceSettings? = nil,
          @source_type : String? = nil,
          @teletext_source_settings : Types::TeletextSourceSettings? = nil,
          @track_source_settings : Types::TrackSourceSettings? = nil,
          @webvtt_hls_source_settings : Types::WebvttHlsSourceSettings? = nil
        )
        end
      end

      # Channel mapping contains the group of fields that hold the remixing value for each channel, in dB.
      # Specify remix values to indicate how much of the content from your input audio channel you want in
      # your output audio channels. Each instance of the InputChannels or InputChannelsFineTune array
      # specifies these values for one output channel. Use one instance of this array for each output
      # channel. In the console, each array corresponds to a column in the graphical depiction of the
      # mapping matrix. The rows of the graphical matrix correspond to input channels. Valid values are
      # within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the
      # output channel (no attenuation or amplification). Use InputChannels or InputChannelsFineTune to
      # specify your remix values. Don't use both.

      struct ChannelMapping
        include JSON::Serializable

        # In your JSON job specification, include one child of OutputChannels for each audio channel that you
        # want in your output. Each child should contain one instance of InputChannels or
        # InputChannelsFineTune.

        @[JSON::Field(key: "outputChannels")]
        getter output_channels : Array(Types::OutputChannelMapping)?

        def initialize(
          @output_channels : Array(Types::OutputChannelMapping)? = nil
        )
        end
      end

      # Specify YUV limits and RGB tolerances when you set Sample range conversion to Limited range clip.

      struct ClipLimits
        include JSON::Serializable

        # Specify the Maximum RGB color sample range tolerance for your output. MediaConvert corrects any YUV
        # values that, when converted to RGB, would be outside the upper tolerance that you specify. Enter an
        # integer from 90 to 105 as an offset percentage to the maximum possible value. Leave blank to use the
        # default value 100. When you specify a value for Maximum RGB tolerance, you must set Sample range
        # conversion to Limited range clip.

        @[JSON::Field(key: "maximumRGBTolerance")]
        getter maximum_rgb_tolerance : Int32?

        # Specify the Maximum YUV color sample limit. MediaConvert conforms any pixels in your input above the
        # value that you specify to typical limited range bounds. Enter an integer from 920 to 1023. Leave
        # blank to use the default value 940. The value that you enter applies to 10-bit ranges. For 8-bit
        # ranges, MediaConvert automatically scales this value down. When you specify a value for Maximum YUV,
        # you must set Sample range conversion to Limited range clip.

        @[JSON::Field(key: "maximumYUV")]
        getter maximum_yuv : Int32?

        # Specify the Minimum RGB color sample range tolerance for your output. MediaConvert corrects any YUV
        # values that, when converted to RGB, would be outside the lower tolerance that you specify. Enter an
        # integer from -5 to 10 as an offset percentage to the minimum possible value. Leave blank to use the
        # default value 0. When you specify a value for Minimum RGB tolerance, you must set Sample range
        # conversion to Limited range clip.

        @[JSON::Field(key: "minimumRGBTolerance")]
        getter minimum_rgb_tolerance : Int32?

        # Specify the Minimum YUV color sample limit. MediaConvert conforms any pixels in your input below the
        # value that you specify to typical limited range bounds. Enter an integer from 0 to 128. Leave blank
        # to use the default value 64. The value that you enter applies to 10-bit ranges. For 8-bit ranges,
        # MediaConvert automatically scales this value down. When you specify a value for Minumum YUV, you
        # must set Sample range conversion to Limited range clip.

        @[JSON::Field(key: "minimumYUV")]
        getter minimum_yuv : Int32?

        def initialize(
          @maximum_rgb_tolerance : Int32? = nil,
          @maximum_yuv : Int32? = nil,
          @minimum_rgb_tolerance : Int32? = nil,
          @minimum_yuv : Int32? = nil
        )
        end
      end

      # Specify the details for each pair of HLS and DASH additional manifests that you want the service to
      # generate for this CMAF output group. Each pair of manifests can reference a different subset of
      # outputs in the group.

      struct CmafAdditionalManifest
        include JSON::Serializable

        # Specify a name modifier that the service adds to the name of this manifest to make it different from
        # the file names of the other main manifests in the output group. For example, say that the default
        # main manifest for your HLS group is film-name.m3u8. If you enter "-no-premium" for this setting,
        # then the file name the service generates for this top-level manifest is film-name-no-premium.m3u8.
        # For HLS output groups, specify a manifestNameModifier that is different from the nameModifier of the
        # output. The service uses the output name modifier to create unique names for the individual variant
        # manifests.

        @[JSON::Field(key: "manifestNameModifier")]
        getter manifest_name_modifier : String?

        # Specify the outputs that you want this additional top-level manifest to reference.

        @[JSON::Field(key: "selectedOutputs")]
        getter selected_outputs : Array(String)?

        def initialize(
          @manifest_name_modifier : String? = nil,
          @selected_outputs : Array(String)? = nil
        )
        end
      end

      # Settings for CMAF encryption

      struct CmafEncryptionSettings
        include JSON::Serializable

        # This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is
        # not set then the Initialization Vector will follow the segment number by default.

        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        # Specify the encryption scheme that you want the service to use when encrypting your CMAF segments.
        # Choose AES-CBC subsample or AES_CTR.

        @[JSON::Field(key: "encryptionMethod")]
        getter encryption_method : String?

        # When you use DRM with CMAF outputs, choose whether the service writes the 128-bit encryption
        # initialization vector in the HLS and DASH manifests.

        @[JSON::Field(key: "initializationVectorInManifest")]
        getter initialization_vector_in_manifest : String?

        # If your output group type is CMAF, use these settings when doing DRM encryption with a
        # SPEKE-compliant key provider. If your output group type is HLS, DASH, or Microsoft Smooth, use the
        # SpekeKeyProvider settings instead.

        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProviderCmaf?

        # Use these settings to set up encryption with a static key provider.

        @[JSON::Field(key: "staticKeyProvider")]
        getter static_key_provider : Types::StaticKeyProvider?

        # Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE
        # standard. For more information about SPEKE, see
        # https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @constant_initialization_vector : String? = nil,
          @encryption_method : String? = nil,
          @initialization_vector_in_manifest : String? = nil,
          @speke_key_provider : Types::SpekeKeyProviderCmaf? = nil,
          @static_key_provider : Types::StaticKeyProvider? = nil,
          @type : String? = nil
        )
        end
      end

      # Settings related to your CMAF output package. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

      struct CmafGroupSettings
        include JSON::Serializable

        # By default, the service creates one top-level .m3u8 HLS manifest and one top -level .mpd DASH
        # manifest for each CMAF output group in your job. These default manifests reference every output in
        # the output group. To create additional top-level manifests that reference a subset of the outputs in
        # the output group, specify a list of them here. For each additional manifest that you specify, the
        # service creates one HLS manifest and one DASH manifest.

        @[JSON::Field(key: "additionalManifests")]
        getter additional_manifests : Array(Types::CmafAdditionalManifest)?

        # A partial URI prefix that will be put in the manifest file at the top level BaseURL element. Can be
        # used if streams are delivered from a different URL than the manifest file.

        @[JSON::Field(key: "baseUrl")]
        getter base_url : String?

        # Disable this setting only when your workflow requires the #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep
        # the default value Enabled and control caching in your video distribution set up. For example, use
        # the Cache-Control http header.

        @[JSON::Field(key: "clientCache")]
        getter client_cache : String?

        # Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.

        @[JSON::Field(key: "codecSpecification")]
        getter codec_specification : String?

        # Specify whether MediaConvert generates I-frame only video segments for DASH trick play, also known
        # as trick mode. When specified, the I-frame only video segments are included within an additional
        # AdaptationSet in your DASH output manifest. To generate I-frame only video segments: Enter a name as
        # a text string, up to 256 character long. This name is appended to the end of this output group's
        # base filename, that you specify as part of your destination URI, and used for the I-frame only video
        # segment files. You may also include format identifiers. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html#using-settings-variables-with-streaming-outputs
        # To not generate I-frame only video segments: Leave blank.

        @[JSON::Field(key: "dashIFrameTrickPlayNameModifier")]
        getter dash_i_frame_trick_play_name_modifier : String?

        # Specify how MediaConvert writes SegmentTimeline in your output DASH manifest. To write a
        # SegmentTimeline for outputs that you also specify a Name modifier for: Keep the default value,
        # Basic. Note that if you do not specify a name modifier for an output, MediaConvert will not write a
        # SegmentTimeline for it. To write a common SegmentTimeline in the video AdaptationSet: Choose
        # Compact. Note that MediaConvert will still write a SegmentTimeline in any Representation that does
        # not share a common timeline. To write a video AdaptationSet for each different output framerate, and
        # a common SegmentTimeline in each AdaptationSet: Choose Distinct. To write a SegmentTimeline in each
        # AdaptationSet: Choose Full.

        @[JSON::Field(key: "dashManifestStyle")]
        getter dash_manifest_style : String?

        # Use Destination to specify the S3 output location and the output filename base. Destination accepts
        # format identifiers. If you do not specify the base filename in the URI, the service will use the
        # filename of the input file. If your job has multiple inputs, the service uses the filename of the
        # first input file.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # Settings associated with the destination. Will vary based on the type of destination

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::DestinationSettings?

        # DRM settings.

        @[JSON::Field(key: "encryption")]
        getter encryption : Types::CmafEncryptionSettings?

        # Specify the length, in whole seconds, of the mp4 fragments. When you don't specify a value,
        # MediaConvert defaults to 2. Related setting: Use Fragment length control to specify whether the
        # encoder enforces this value strictly.

        @[JSON::Field(key: "fragmentLength")]
        getter fragment_length : Int32?

        # Specify whether MediaConvert generates images for trick play. Keep the default value, None, to not
        # generate any images. Choose Thumbnail to generate tiled thumbnails. Choose Thumbnail and full frame
        # to generate tiled thumbnails and full-resolution images of single frames. When you enable Write HLS
        # manifest, MediaConvert creates a child manifest for each set of images that you generate and adds
        # corresponding entries to the parent manifest. When you enable Write DASH manifest, MediaConvert adds
        # an entry in the .mpd manifest for each set of images that you generate. A common application for
        # these images is Roku trick mode. The thumbnails and full-frame images that MediaConvert creates with
        # this feature are compatible with this Roku specification:
        # https://developer.roku.com/docs/developer-program/media-playback/trick-mode/hls-and-dash.md

        @[JSON::Field(key: "imageBasedTrickPlay")]
        getter image_based_trick_play : String?

        # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

        @[JSON::Field(key: "imageBasedTrickPlaySettings")]
        getter image_based_trick_play_settings : Types::CmafImageBasedTrickPlaySettings?

        # When set to GZIP, compresses HLS playlist.

        @[JSON::Field(key: "manifestCompression")]
        getter manifest_compression : String?

        # Indicates whether the output manifest should use floating point values for segment duration.

        @[JSON::Field(key: "manifestDurationFormat")]
        getter manifest_duration_format : String?

        # Minimum time of initially buffered media that is needed to ensure smooth playout.

        @[JSON::Field(key: "minBufferTime")]
        getter min_buffer_time : Int32?

        # Keep this setting at the default value of 0, unless you are troubleshooting a problem with how
        # devices play back the end of your video asset. If you know that player devices are hanging on the
        # final segment of your video because the length of your final segment is too short, use this setting
        # to specify a minimum final segment length, in seconds. Choose a value that is greater than or equal
        # to 1 and less than your segment length. When you specify a value for this setting, the encoder will
        # combine any final segment that is shorter than the length that you specify with the previous
        # segment. For example, your segment length is 3 seconds and your final segment is .5 seconds without
        # a minimum final segment length; when you set the minimum final segment length to 1, your final
        # segment is 3.5 seconds.

        @[JSON::Field(key: "minFinalSegmentLength")]
        getter min_final_segment_length : Float64?

        # Specify how the value for bandwidth is determined for each video Representation in your output MPD
        # manifest. We recommend that you choose a MPD manifest bandwidth type that is compatible with your
        # downstream player configuration. Max: Use the same value that you specify for Max bitrate in the
        # video output, in bits per second. Average: Use the calculated average bitrate of the encoded video
        # output, in bits per second.

        @[JSON::Field(key: "mpdManifestBandwidthType")]
        getter mpd_manifest_bandwidth_type : String?

        # Specify whether your DASH profile is on-demand or main. When you choose Main profile, the service
        # signals urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you choose On-demand,
        # the service signals urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
        # On-demand, you must also set the output group setting Segment control to Single file.

        @[JSON::Field(key: "mpdProfile")]
        getter mpd_profile : String?

        # Use this setting only when your output video stream has B-frames, which causes the initial
        # presentation time stamp (PTS) to be offset from the initial decode time stamp (DTS). Specify how
        # MediaConvert handles PTS when writing time stamps in output DASH manifests. Choose Match initial PTS
        # when you want MediaConvert to use the initial PTS as the first time stamp in the manifest. Choose
        # Zero-based to have MediaConvert ignore the initial PTS in the video stream and instead write the
        # initial time stamp as zero in the manifest. For outputs that don't have B-frames, the time stamps in
        # your DASH manifests start at zero regardless of your choice here.

        @[JSON::Field(key: "ptsOffsetHandlingForBFrames")]
        getter pts_offset_handling_for_b_frames : String?

        # When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the
        # Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be
        # created.

        @[JSON::Field(key: "segmentControl")]
        getter segment_control : String?

        # Specify the length, in whole seconds, of each segment. When you don't specify a value, MediaConvert
        # defaults to 10. Related settings: Use Segment length control to specify whether the encoder enforces
        # this value strictly. Use Segment control to specify whether MediaConvert creates separate segment
        # files or one content file that has metadata to mark the segment boundaries.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # Specify how you want MediaConvert to determine segment lengths in this output group. To use the
        # exact value that you specify under Segment length: Choose Exact. Note that this might result in
        # additional I-frames in the output GOP. To create segment lengths that are a multiple of the GOP:
        # Choose Multiple of GOP. MediaConvert will round up the segment lengths to match the next GOP
        # boundary. To have MediaConvert automatically determine a segment duration that is a multiple of both
        # the audio packets and the frame rates: Choose Match. When you do, also specify a target segment
        # duration under Segment length. This is useful for some ad-insertion or segment replacement
        # workflows. Note that Match has the following requirements: - Output containers: Include at least one
        # video output and at least one audio output. Audio-only outputs are not supported. - Output frame
        # rate: Follow source is not supported. - Multiple output frame rates: When you specify multiple
        # outputs, we recommend they share a similar frame rate (as in X/3, X/2, X, or 2X). For example: 5,
        # 15, 30 and 60. Or: 25 and 50. (Outputs must share an integer multiple.) - Output audio codec:
        # Specify Advanced Audio Coding (AAC). - Output sample rate: Choose 48kHz.

        @[JSON::Field(key: "segmentLengthControl")]
        getter segment_length_control : String?

        # Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.

        @[JSON::Field(key: "streamInfResolution")]
        getter stream_inf_resolution : String?

        # When set to LEGACY, the segment target duration is always rounded up to the nearest integer value
        # above its current value in seconds. When set to SPEC\\_COMPLIANT, the segment target duration is
        # rounded up to the nearest integer value if fraction seconds are greater than or equal to 0.5 (>=
        # 0.5) and rounded down if less than 0.5 (< 0.5). You may need to use LEGACY if your client needs to
        # ensure that the target duration is always longer than the actual duration of the segment. Some older
        # players may experience interrupted playback when the actual duration of a track in a segment is
        # longer than the target duration.

        @[JSON::Field(key: "targetDurationCompatibilityMode")]
        getter target_duration_compatibility_mode : String?

        # Specify the video sample composition time offset mode in the output fMP4 TRUN box. For wider player
        # compatibility, set Video composition offsets to Unsigned or leave blank. The earliest presentation
        # time may be greater than zero, and sample composition time offsets will increment using unsigned
        # integers. For strict fMP4 video and audio timing, set Video composition offsets to Signed. The
        # earliest presentation time will be equal to zero, and sample composition time offsets will increment
        # using signed integers.

        @[JSON::Field(key: "videoCompositionOffsets")]
        getter video_composition_offsets : String?

        # When set to ENABLED, a DASH MPD manifest will be generated for this output.

        @[JSON::Field(key: "writeDashManifest")]
        getter write_dash_manifest : String?

        # When set to ENABLED, an Apple HLS manifest will be generated for this output.

        @[JSON::Field(key: "writeHlsManifest")]
        getter write_hls_manifest : String?

        # When you enable Precise segment duration in DASH manifests, your DASH manifest shows precise segment
        # durations. The segment duration information appears inside the SegmentTimeline element, inside
        # SegmentTemplate at the Representation level. When this feature isn't enabled, the segment durations
        # in your DASH manifest are approximate. The segment duration information appears in the duration
        # attribute of the SegmentTemplate element.

        @[JSON::Field(key: "writeSegmentTimelineInRepresentation")]
        getter write_segment_timeline_in_representation : String?

        def initialize(
          @additional_manifests : Array(Types::CmafAdditionalManifest)? = nil,
          @base_url : String? = nil,
          @client_cache : String? = nil,
          @codec_specification : String? = nil,
          @dash_i_frame_trick_play_name_modifier : String? = nil,
          @dash_manifest_style : String? = nil,
          @destination : String? = nil,
          @destination_settings : Types::DestinationSettings? = nil,
          @encryption : Types::CmafEncryptionSettings? = nil,
          @fragment_length : Int32? = nil,
          @image_based_trick_play : String? = nil,
          @image_based_trick_play_settings : Types::CmafImageBasedTrickPlaySettings? = nil,
          @manifest_compression : String? = nil,
          @manifest_duration_format : String? = nil,
          @min_buffer_time : Int32? = nil,
          @min_final_segment_length : Float64? = nil,
          @mpd_manifest_bandwidth_type : String? = nil,
          @mpd_profile : String? = nil,
          @pts_offset_handling_for_b_frames : String? = nil,
          @segment_control : String? = nil,
          @segment_length : Int32? = nil,
          @segment_length_control : String? = nil,
          @stream_inf_resolution : String? = nil,
          @target_duration_compatibility_mode : String? = nil,
          @video_composition_offsets : String? = nil,
          @write_dash_manifest : String? = nil,
          @write_hls_manifest : String? = nil,
          @write_segment_timeline_in_representation : String? = nil
        )
        end
      end

      # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

      struct CmafImageBasedTrickPlaySettings
        include JSON::Serializable

        # The cadence MediaConvert follows for generating thumbnails. If set to FOLLOW_IFRAME, MediaConvert
        # generates thumbnails for each IDR frame in the output (matching the GOP cadence). If set to
        # FOLLOW_CUSTOM, MediaConvert generates thumbnails according to the interval you specify in
        # thumbnailInterval.

        @[JSON::Field(key: "intervalCadence")]
        getter interval_cadence : String?

        # Height of each thumbnail within each tile image, in pixels. Leave blank to maintain aspect ratio
        # with thumbnail width. If following the aspect ratio would lead to a total tile height greater than
        # 4096, then the job will be rejected. Must be divisible by 2.

        @[JSON::Field(key: "thumbnailHeight")]
        getter thumbnail_height : Int32?

        # Enter the interval, in seconds, that MediaConvert uses to generate thumbnails. If the interval you
        # enter doesn't align with the output frame rate, MediaConvert automatically rounds the interval to
        # align with the output frame rate. For example, if the output frame rate is 29.97 frames per second
        # and you enter 5, MediaConvert uses a 150 frame interval to generate thumbnails.

        @[JSON::Field(key: "thumbnailInterval")]
        getter thumbnail_interval : Float64?

        # Width of each thumbnail within each tile image, in pixels. Default is 312. Must be divisible by 8.

        @[JSON::Field(key: "thumbnailWidth")]
        getter thumbnail_width : Int32?

        # Number of thumbnails in each column of a tile image. Set a value between 2 and 2048. Must be
        # divisible by 2.

        @[JSON::Field(key: "tileHeight")]
        getter tile_height : Int32?

        # Number of thumbnails in each row of a tile image. Set a value between 1 and 512.

        @[JSON::Field(key: "tileWidth")]
        getter tile_width : Int32?

        def initialize(
          @interval_cadence : String? = nil,
          @thumbnail_height : Int32? = nil,
          @thumbnail_interval : Float64? = nil,
          @thumbnail_width : Int32? = nil,
          @tile_height : Int32? = nil,
          @tile_width : Int32? = nil
        )
        end
      end

      # These settings relate to the fragmented MP4 container for the segments in your CMAF outputs.

      struct CmfcSettings
        include JSON::Serializable

        # Specify this setting only when your output will be consumed by a downstream repackaging workflow
        # that is sensitive to very small duration differences between video and audio. For this situation,
        # choose Match video duration. In all other cases, keep the default value, Default codec duration.
        # When you choose Match video duration, MediaConvert pads the output audio streams with silence or
        # trims them to ensure that the total duration of each audio stream is at least as long as the total
        # duration of the video stream. After padding or trimming, the audio stream duration is no more than
        # one frame longer than the video stream. MediaConvert applies audio padding or trimming only to the
        # end of the last segment of the output. For unsegmented outputs, MediaConvert adds padding only to
        # the end of the file. When you keep the default value, any minor discrepancies between audio and
        # video duration will depend on your output audio codec.

        @[JSON::Field(key: "audioDuration")]
        getter audio_duration : String?

        # Specify the audio rendition group for this audio rendition. Specify up to one value for each audio
        # output in your output group. This value appears in your HLS parent manifest in the EXT-X-MEDIA tag
        # of TYPE=AUDIO, as the value for the GROUP-ID attribute. For example, if you specify "audio_aac_1"
        # for Audio group ID, it appears in your manifest like this:
        # #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio_aac_1". Related setting: To associate the rendition group
        # that this audio track belongs to with a video rendition, include the same value that you provide
        # here for that video output's setting Audio rendition sets.

        @[JSON::Field(key: "audioGroupId")]
        getter audio_group_id : String?

        # List the audio rendition groups that you want included with this video rendition. Use a
        # comma-separated list. For example, say you want to include the audio rendition groups that have the
        # audio group IDs "audio_aac_1" and "audio_dolby". Then you would specify this value:
        # "audio_aac_1,audio_dolby". Related setting: The rendition groups that you include in your
        # comma-separated list should all match values that you specify in the setting Audio group ID for
        # audio renditions in the same output group as this video rendition. Default behavior: If you don't
        # specify anything here and for Audio group ID, MediaConvert puts each audio variant in its own audio
        # rendition group and associates it with every video variant. Each value in your list appears in your
        # HLS parent manifest in the EXT-X-STREAM-INF tag as the value for the AUDIO attribute. To continue
        # the previous example, say that the file name for the child manifest for your video rendition is
        # "amazing_video_1.m3u8". Then, in your parent manifest, each value will appear on separate lines,
        # like this: #EXT-X-STREAM-INF:AUDIO="audio_aac_1"... amazing_video_1.m3u8
        # #EXT-X-STREAM-INF:AUDIO="audio_dolby"... amazing_video_1.m3u8

        @[JSON::Field(key: "audioRenditionSets")]
        getter audio_rendition_sets : String?

        # Use this setting to control the values that MediaConvert puts in your HLS parent playlist to control
        # how the client player selects which audio track to play. Choose Audio-only variant stream
        # (AUDIO_ONLY_VARIANT_STREAM) for any variant that you want to prohibit the client from playing with
        # video. This causes MediaConvert to represent the variant as an EXT-X-STREAM-INF in the HLS manifest.
        # The other options for this setting determine the values that MediaConvert writes for the DEFAULT and
        # AUTOSELECT attributes of the EXT-X-MEDIA entry for the audio variant. For more information about
        # these attributes, see the Apple documentation article
        # https://developer.apple.com/documentation/http_live_streaming/example_playlists_for_http_live_streaming/adding_alternate_media_to_a_playlist.
        # Choose Alternate audio, auto select, default to set DEFAULT=YES and AUTOSELECT=YES. Choose this
        # value for only one variant in your output group. Choose Alternate audio, auto select, not default to
        # set DEFAULT=NO and AUTOSELECT=YES. Choose Alternate Audio, Not Auto Select to set DEFAULT=NO and
        # AUTOSELECT=NO. When you don't specify a value for this setting, MediaConvert defaults to Alternate
        # audio, auto select, default. When there is more than one variant in your output group, you must
        # explicitly choose a value for this setting.

        @[JSON::Field(key: "audioTrackType")]
        getter audio_track_type : String?

        # When enabled, a C2PA compliant manifest will be generated, signed and embeded in the output. For
        # more information on C2PA, see https://c2pa.org/specifications/specifications/2.1/index.html

        @[JSON::Field(key: "c2paManifest")]
        getter c2pa_manifest : String?

        # Specify the name or ARN of the AWS Secrets Manager secret that contains your C2PA public certificate
        # chain in PEM format. Provide a valid secret name or ARN. Note that your MediaConvert service role
        # must allow access to this secret. The public certificate chain is added to the COSE header (x5chain)
        # for signature validation. Include the signer's certificate and all intermediate certificates. Do not
        # include the root certificate. For details on COSE, see:
        # https://opensource.contentauthenticity.org/docs/manifest/signing-manifests

        @[JSON::Field(key: "certificateSecret")]
        getter certificate_secret : String?

        # Specify whether to flag this audio track as descriptive video service (DVS) in your HLS parent
        # manifest. When you choose Flag, MediaConvert includes the parameter
        # CHARACTERISTICS="public.accessibility.describes-video" in the EXT-X-MEDIA entry for this track. When
        # you keep the default choice, Don't flag, MediaConvert leaves this parameter out. The DVS flag can
        # help with accessibility on Apple devices. For more information, see the Apple documentation.

        @[JSON::Field(key: "descriptiveVideoServiceFlag")]
        getter descriptive_video_service_flag : String?

        # Choose Include to have MediaConvert generate an HLS child manifest that lists only the I-frames for
        # this rendition, in addition to your regular manifest for this rendition. You might use this manifest
        # as part of a workflow that creates preview functions for your video. MediaConvert adds both the
        # I-frame only child manifest and the regular child manifest to the parent manifest. When you don't
        # need the I-frame only child manifest, keep the default value Exclude.

        @[JSON::Field(key: "iFrameOnlyManifest")]
        getter i_frame_only_manifest : String?

        # To include key-length-value metadata in this output: Set KLV metadata insertion to Passthrough.
        # MediaConvert reads KLV metadata present in your input and writes each instance to a separate event
        # message box in the output, according to MISB ST1910.1. To exclude this KLV metadata: Set KLV
        # metadata insertion to None or leave blank.

        @[JSON::Field(key: "klvMetadata")]
        getter klv_metadata : String?

        # To add an InbandEventStream element in your output MPD manifest for each type of event message, set
        # Manifest metadata signaling to Enabled. For ID3 event messages, the InbandEventStream element
        # schemeIdUri will be same value that you specify for ID3 metadata scheme ID URI. For SCTE35 event
        # messages, the InbandEventStream element schemeIdUri will be "urn:scte:scte35:2013:bin". To leave
        # these elements out of your output MPD manifest, set Manifest metadata signaling to Disabled. To
        # enable Manifest metadata signaling, you must also set SCTE-35 source to Passthrough, ESAM SCTE-35 to
        # insert, or ID3 metadata to Passthrough.

        @[JSON::Field(key: "manifestMetadataSignaling")]
        getter manifest_metadata_signaling : String?

        # Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35
        # markers in this output at the insertion points that you specify in an ESAM XML document. Provide the
        # document in the setting SCC XML.

        @[JSON::Field(key: "scte35Esam")]
        getter scte35_esam : String?

        # Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough if
        # you want SCTE-35 markers that appear in your input to also appear in this output. Choose None if you
        # don't want those SCTE-35 markers in this output.

        @[JSON::Field(key: "scte35Source")]
        getter scte35_source : String?

        # Specify the ID or ARN of the AWS KMS key used to sign the C2PA manifest in your MP4 output. Provide
        # a valid KMS key ARN. Note that your MediaConvert service role must allow access to this key.

        @[JSON::Field(key: "signingKmsKey")]
        getter signing_kms_key : String?

        # To include ID3 metadata in this output: Set ID3 metadata to Passthrough. Specify this ID3 metadata
        # in Custom ID3 metadata inserter. MediaConvert writes each instance of ID3 metadata in a separate
        # Event Message (eMSG) box. To exclude this ID3 metadata: Set ID3 metadata to None or leave blank.

        @[JSON::Field(key: "timedMetadata")]
        getter timed_metadata : String?

        # Specify the event message box (eMSG) version for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.3 Syntax. Leave blank to use the default
        # value Version 0. When you specify Version 1, you must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataBoxVersion")]
        getter timed_metadata_box_version : String?

        # Specify the event message box (eMSG) scheme ID URI for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.4 Semantics. Leave blank to use the default
        # value: https://aomedia.org/emsg/ID3 When you specify a value for ID3 metadata scheme ID URI, you
        # must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataSchemeIdUri")]
        getter timed_metadata_scheme_id_uri : String?

        # Specify the event message box (eMSG) value for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.4 Semantics. When you specify a value for ID3
        # Metadata Value, you must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataValue")]
        getter timed_metadata_value : String?

        def initialize(
          @audio_duration : String? = nil,
          @audio_group_id : String? = nil,
          @audio_rendition_sets : String? = nil,
          @audio_track_type : String? = nil,
          @c2pa_manifest : String? = nil,
          @certificate_secret : String? = nil,
          @descriptive_video_service_flag : String? = nil,
          @i_frame_only_manifest : String? = nil,
          @klv_metadata : String? = nil,
          @manifest_metadata_signaling : String? = nil,
          @scte35_esam : String? = nil,
          @scte35_source : String? = nil,
          @signing_kms_key : String? = nil,
          @timed_metadata : String? = nil,
          @timed_metadata_box_version : String? = nil,
          @timed_metadata_scheme_id_uri : String? = nil,
          @timed_metadata_value : String? = nil
        )
        end
      end

      # Codec-specific parameters parsed from the video essence headers. This information provides detailed
      # technical specifications about how the video was encoded, including profile settings, resolution
      # details, and color space information that can help you understand the source video characteristics
      # and make informed encoding decisions.

      struct CodecMetadata
        include JSON::Serializable

        # The number of bits used per color component in the video essence such as 8, 10, or 12 bits. Standard
        # range (SDR) video typically uses 8-bit, while 10-bit is common for high dynamic range (HDR).

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # The chroma subsampling format used in the video encoding, such as "4:2:0" or "4:4:4". This describes
        # how color information is sampled relative to brightness information. Different subsampling ratios
        # affect video quality and file size, with "4:4:4" providing the highest color fidelity and "4:2:0"
        # being most common for standard video.

        @[JSON::Field(key: "chromaSubsampling")]
        getter chroma_subsampling : String?

        # The frame rate of the video or audio track, expressed as a fraction with numerator and denominator
        # values.

        @[JSON::Field(key: "codedFrameRate")]
        getter coded_frame_rate : Types::FrameRate?

        # The color space primaries of the video track, defining the red, green, and blue color coordinates
        # used for the video. This information helps ensure accurate color reproduction during playback and
        # transcoding.

        @[JSON::Field(key: "colorPrimaries")]
        getter color_primaries : String?

        # The height in pixels as coded by the codec. This represents the actual encoded video height as
        # specified in the video stream headers.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # The codec level or tier that specifies the maximum processing requirements and capabilities. Levels
        # define constraints such as maximum bit rate, frame rate, and resolution.

        @[JSON::Field(key: "level")]
        getter level : String?

        # The color space matrix coefficients of the video track, defining how RGB color values are converted
        # to and from YUV color space. This affects color accuracy during encoding and decoding processes.

        @[JSON::Field(key: "matrixCoefficients")]
        getter matrix_coefficients : String?

        # The codec profile used to encode the video. Profiles define specific feature sets and capabilities
        # within a codec standard. For example, H.264 profiles include Baseline, Main, and High, each
        # supporting different encoding features and complexity levels.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # The scanning method specified in the video essence, indicating whether the video uses progressive or
        # interlaced scanning.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # The color space transfer characteristics of the video track, defining the relationship between
        # linear light values and the encoded signal values. This affects brightness and contrast
        # reproduction.

        @[JSON::Field(key: "transferCharacteristics")]
        getter transfer_characteristics : String?

        # The width in pixels as coded by the codec. This represents the actual encoded video width as
        # specified in the video stream headers.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @chroma_subsampling : String? = nil,
          @coded_frame_rate : Types::FrameRate? = nil,
          @color_primaries : String? = nil,
          @height : Int32? = nil,
          @level : String? = nil,
          @matrix_coefficients : String? = nil,
          @profile : String? = nil,
          @scan_type : String? = nil,
          @transfer_characteristics : String? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Custom 3D lut settings

      struct ColorConversion3DLUTSetting
        include JSON::Serializable

        # Specify the input file S3, HTTP, or HTTPS URL for your 3D LUT .cube file. Note that MediaConvert
        # accepts 3D LUT files up to 8MB in size.

        @[JSON::Field(key: "fileInput")]
        getter file_input : String?

        # Specify which inputs use this 3D LUT, according to their color space.

        @[JSON::Field(key: "inputColorSpace")]
        getter input_color_space : String?

        # Specify which inputs use this 3D LUT, according to their luminance. To apply this 3D LUT to HDR10 or
        # P3D65 (HDR) inputs with a specific mastering luminance: Enter an integer from 0 to 2147483647,
        # corresponding to the input's Maximum luminance value. To apply this 3D LUT to any input regardless
        # of its luminance: Leave blank, or enter 0.

        @[JSON::Field(key: "inputMasteringLuminance")]
        getter input_mastering_luminance : Int32?

        # Specify which outputs use this 3D LUT, according to their color space.

        @[JSON::Field(key: "outputColorSpace")]
        getter output_color_space : String?

        # Specify which outputs use this 3D LUT, according to their luminance. To apply this 3D LUT to HDR10
        # or P3D65 (HDR) outputs with a specific luminance: Enter an integer from 0 to 2147483647,
        # corresponding to the output's luminance. To apply this 3D LUT to any output regardless of its
        # luminance: Leave blank, or enter 0.

        @[JSON::Field(key: "outputMasteringLuminance")]
        getter output_mastering_luminance : Int32?

        def initialize(
          @file_input : String? = nil,
          @input_color_space : String? = nil,
          @input_mastering_luminance : Int32? = nil,
          @output_color_space : String? = nil,
          @output_mastering_luminance : Int32? = nil
        )
        end
      end

      # Settings for color correction.

      struct ColorCorrector
        include JSON::Serializable

        # Brightness level.

        @[JSON::Field(key: "brightness")]
        getter brightness : Int32?

        # Specify YUV limits and RGB tolerances when you set Sample range conversion to Limited range clip.

        @[JSON::Field(key: "clipLimits")]
        getter clip_limits : Types::ClipLimits?

        # Specify the color space you want for this output. The service supports conversion between HDR
        # formats, between SDR formats, from SDR to HDR, and from HDR to SDR. SDR to HDR conversion doesn't
        # upgrade the dynamic range. The converted video has an HDR format, but visually appears the same as
        # an unconverted output. HDR to SDR conversion uses tone mapping to approximate the outcome of
        # manually regrading from HDR to SDR. When you specify an output color space, MediaConvert uses the
        # following color space metadata, which includes color primaries, transfer characteristics, and matrix
        # coefficients: * HDR 10: BT.2020, PQ, BT.2020 non-constant * HLG 2020: BT.2020, HLG, BT.2020
        # non-constant * P3DCI (Theater): DCIP3, SMPTE 428M, BT.709 * P3D65 (SDR): Display P3, sRGB, BT.709 *
        # P3D65 (HDR): Display P3, PQ, BT.709

        @[JSON::Field(key: "colorSpaceConversion")]
        getter color_space_conversion : String?

        # Contrast level.

        @[JSON::Field(key: "contrast")]
        getter contrast : Int32?

        # Use these settings when you convert to the HDR 10 color space. Specify the SMPTE ST 2086 Mastering
        # Display Color Volume static metadata that you want signaled in the output. These values don't affect
        # the pixel values that are encoded in the video stream. They are intended to help the downstream
        # video player display content in a way that reflects the intentions of the the content creator. When
        # you set Color space conversion to HDR 10, these settings are required. You must set values for Max
        # frame average light level and Max content light level; these settings don't have a default value.
        # The default values for the other HDR 10 metadata settings are defined by the P3D65 color space. For
        # more information about MediaConvert HDR jobs, see
        # https://docs.aws.amazon.com/console/mediaconvert/hdr.

        @[JSON::Field(key: "hdr10Metadata")]
        getter hdr10_metadata : Types::Hdr10Metadata?

        # Specify how MediaConvert maps brightness and colors from your HDR input to your SDR output. The mode
        # that you select represents a creative choice, with different tradeoffs in the details and tones of
        # your output. To maintain details in bright or saturated areas of your output: Choose Preserve
        # details. For some sources, your SDR output may look less bright and less saturated when compared to
        # your HDR source. MediaConvert automatically applies this mode for HLG sources, regardless of your
        # choice. For a bright and saturated output: Choose Vibrant. We recommend that you choose this mode
        # when any of your source content is HDR10, and for the best results when it is mastered for 1000
        # nits. You may notice loss of details in bright or saturated areas of your output. HDR to SDR tone
        # mapping has no effect when your input is SDR.

        @[JSON::Field(key: "hdrToSdrToneMapper")]
        getter hdr_to_sdr_tone_mapper : String?

        # Hue in degrees.

        @[JSON::Field(key: "hue")]
        getter hue : Int32?

        # Specify the maximum mastering display luminance. Enter an integer from 0 to 2147483647, in units of
        # 0.0001 nits. For example, enter 10000000 for 1000 nits.

        @[JSON::Field(key: "maxLuminance")]
        getter max_luminance : Int32?

        # Specify how MediaConvert limits the color sample range for this output. To create a limited range
        # output from a full range input: Choose Limited range squeeze. For full range inputs, MediaConvert
        # performs a linear offset to color samples equally across all pixels and frames. Color samples in
        # 10-bit outputs are limited to 64 through 940, and 8-bit outputs are limited to 16 through 235. Note:
        # For limited range inputs, values for color samples are passed through to your output unchanged.
        # MediaConvert does not limit the sample range. To correct pixels in your input that are out of range
        # or out of gamut: Choose Limited range clip. Use for broadcast applications. MediaConvert conforms
        # any pixels outside of the values that you specify under Minimum YUV and Maximum YUV to limited range
        # bounds. MediaConvert also corrects any YUV values that, when converted to RGB, would be outside the
        # bounds you specify under Minimum RGB tolerance and Maximum RGB tolerance. With either limited range
        # conversion, MediaConvert writes the sample range metadata in the output.

        @[JSON::Field(key: "sampleRangeConversion")]
        getter sample_range_conversion : String?

        # Saturation level.

        @[JSON::Field(key: "saturation")]
        getter saturation : Int32?

        # Specify the reference white level, in nits, for all of your SDR inputs. Use to correct brightness
        # levels within HDR10 outputs. The following color metadata must be present in your SDR input: color
        # primaries, transfer characteristics, and matrix coefficients. If your SDR input has missing color
        # metadata, or if you want to correct input color metadata, manually specify a color space in the
        # input video selector. For 1,000 nit peak brightness displays, we recommend that you set SDR
        # reference white level to 203 (according to ITU-R BT.2408). Leave blank to use the default value of
        # 100, or specify an integer from 100 to 1000.

        @[JSON::Field(key: "sdrReferenceWhiteLevel")]
        getter sdr_reference_white_level : Int32?

        def initialize(
          @brightness : Int32? = nil,
          @clip_limits : Types::ClipLimits? = nil,
          @color_space_conversion : String? = nil,
          @contrast : Int32? = nil,
          @hdr10_metadata : Types::Hdr10Metadata? = nil,
          @hdr_to_sdr_tone_mapper : String? = nil,
          @hue : Int32? = nil,
          @max_luminance : Int32? = nil,
          @sample_range_conversion : String? = nil,
          @saturation : Int32? = nil,
          @sdr_reference_white_level : Int32? = nil
        )
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

      # The container of your media file. This information helps you understand the overall structure and
      # details of your media, including format, duration, and track layout.

      struct Container
        include JSON::Serializable

        # The total duration of your media file, in seconds.

        @[JSON::Field(key: "duration")]
        getter duration : Float64?

        # The format of your media file. For example: MP4, QuickTime (MOV), Matroska (MKV), WebM or MXF. Note
        # that this will be blank if your media file has a format that the MediaConvert Probe operation does
        # not recognize.

        @[JSON::Field(key: "format")]
        getter format : String?

        # Details about each track (video, audio, or data) in the media file.

        @[JSON::Field(key: "tracks")]
        getter tracks : Array(Types::Track)?

        def initialize(
          @duration : Float64? = nil,
          @format : String? = nil,
          @tracks : Array(Types::Track)? = nil
        )
        end
      end

      # Container specific settings.

      struct ContainerSettings
        include JSON::Serializable

        # These settings relate to the fragmented MP4 container for the segments in your CMAF outputs.

        @[JSON::Field(key: "cmfcSettings")]
        getter cmfc_settings : Types::CmfcSettings?

        # Container for this output. Some containers require a container settings object. If not specified,
        # the default object will be created.

        @[JSON::Field(key: "container")]
        getter container : String?

        # Settings for F4v container

        @[JSON::Field(key: "f4vSettings")]
        getter f4v_settings : Types::F4vSettings?

        # MPEG-2 TS container settings. These apply to outputs in a File output group when the output's
        # container is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map
        # table (PMT). Each transport stream program contains subsets of data, including audio, video, and
        # metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each
        # transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in
        # a program along with their PID. Downstream systems and players use the program map table to look up
        # the PID for each type of data it accesses and then uses the PIDs to locate specific data within the
        # asset.

        @[JSON::Field(key: "m2tsSettings")]
        getter m2ts_settings : Types::M2tsSettings?

        # These settings relate to the MPEG-2 transport stream (MPEG2-TS) container for the MPEG2-TS segments
        # in your HLS outputs.

        @[JSON::Field(key: "m3u8Settings")]
        getter m3u8_settings : Types::M3u8Settings?

        # These settings relate to your QuickTime MOV output container.

        @[JSON::Field(key: "movSettings")]
        getter mov_settings : Types::MovSettings?

        # These settings relate to your MP4 output container. You can create audio only outputs with this
        # container. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/supported-codecs-containers-audio-only.html#output-codecs-and-containers-supported-for-audio-only.

        @[JSON::Field(key: "mp4Settings")]
        getter mp4_settings : Types::Mp4Settings?

        # These settings relate to the fragmented MP4 container for the segments in your DASH outputs.

        @[JSON::Field(key: "mpdSettings")]
        getter mpd_settings : Types::MpdSettings?

        # These settings relate to your MXF output container.

        @[JSON::Field(key: "mxfSettings")]
        getter mxf_settings : Types::MxfSettings?

        def initialize(
          @cmfc_settings : Types::CmfcSettings? = nil,
          @container : String? = nil,
          @f4v_settings : Types::F4vSettings? = nil,
          @m2ts_settings : Types::M2tsSettings? = nil,
          @m3u8_settings : Types::M3u8Settings? = nil,
          @mov_settings : Types::MovSettings? = nil,
          @mp4_settings : Types::Mp4Settings? = nil,
          @mpd_settings : Types::MpdSettings? = nil,
          @mxf_settings : Types::MxfSettings? = nil
        )
        end
      end

      # Send your create job request with your job settings and IAM role. Optionally, include user metadata
      # and the ARN for the queue.

      struct CreateJobRequest
        include JSON::Serializable

        # Required. The IAM role you use for creating this job. For details about permissions, see the User
        # Guide topic at the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.

        @[JSON::Field(key: "role")]
        getter role : String

        # JobSettings contains all the transcode settings for a job.

        @[JSON::Field(key: "settings")]
        getter settings : Types::JobSettings

        # Optional. Accelerated transcoding can significantly speed up jobs with long, visually complex
        # content. Outputs that use this feature incur pro-tier pricing. For information about feature
        # limitations, see the AWS Elemental MediaConvert User Guide.

        @[JSON::Field(key: "accelerationSettings")]
        getter acceleration_settings : Types::AccelerationSettings?

        # Optionally choose a Billing tags source that AWS Billing and Cost Management will use to display
        # tags for individual output costs on any billing report that you set up. Leave blank to use the
        # default value, Job.

        @[JSON::Field(key: "billingTagsSource")]
        getter billing_tags_source : String?

        # Prevent duplicate jobs from being created and ensure idempotency for your requests. A client request
        # token can be any string that includes up to 64 ASCII characters. If you reuse a client request token
        # within one minute of a successful request, the API returns the job details of the original request
        # instead. For more information see
        # https://docs.aws.amazon.com/mediaconvert/latest/apireference/idempotency.html.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Optional. Use queue hopping to avoid overly long waits in the backlog of the queue that you submit
        # your job to. Specify an alternate queue and the maximum time that your job will wait in the initial
        # queue before hopping. For more information about this feature, see the AWS Elemental MediaConvert
        # User Guide.

        @[JSON::Field(key: "hopDestinations")]
        getter hop_destinations : Array(Types::HopDestination)?

        # Use Job engine versions to run jobs for your production workflow on one version, while you test and
        # validate the latest version. Job engine versions represent periodically grouped MediaConvert
        # releases with new features, updates, improvements, and fixes. Job engine versions are in a
        # YYYY-MM-DD format. Note that the Job engine version feature is not publicly available at this time.
        # To request access, contact AWS support.

        @[JSON::Field(key: "jobEngineVersion")]
        getter job_engine_version : String?

        # Optional. When you create a job, you can either specify a job template or specify the transcoding
        # settings individually.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : String?

        # Optional. Specify the relative priority for this job. In any given queue, the service begins
        # processing the job with the highest value first. When more than one job has the same priority, the
        # service begins processing the job that you submitted first. If you don't specify a priority, the
        # service uses the default value 0.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Optional. When you create a job, you can specify a queue to send it to. If you don't specify, the
        # job will go to the default queue. For more about queues, see the User Guide topic at
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Optional. Enable this setting when you run a test job to estimate how many reserved transcoding
        # slots (RTS) you need. When this is enabled, MediaConvert runs your job from an on-demand queue with
        # similar performance to what you will see with one RTS in a reserved queue. This setting is disabled
        # by default.

        @[JSON::Field(key: "simulateReservedQueue")]
        getter simulate_reserved_queue : String?

        # Optional. Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set
        # the interval, in seconds, between status updates. MediaConvert sends an update at this interval from
        # the time the service begins processing your job to the time it completes the transcode or encounters
        # an error.

        @[JSON::Field(key: "statusUpdateInterval")]
        getter status_update_interval : String?

        # Optional. The tags that you want to add to the resource. You can tag resources with a key-value pair
        # or with only a key. Use standard AWS tags on your job for automatic integration with AWS services
        # and for custom integrations and workflows.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Optional. User-defined metadata that you want to associate with an MediaConvert job. You specify
        # metadata in key/value pairs. Use only for existing integrations or workflows that rely on job
        # metadata tags. Otherwise, we recommend that you use standard AWS tags.

        @[JSON::Field(key: "userMetadata")]
        getter user_metadata : Hash(String, String)?

        def initialize(
          @role : String,
          @settings : Types::JobSettings,
          @acceleration_settings : Types::AccelerationSettings? = nil,
          @billing_tags_source : String? = nil,
          @client_request_token : String? = nil,
          @hop_destinations : Array(Types::HopDestination)? = nil,
          @job_engine_version : String? = nil,
          @job_template : String? = nil,
          @priority : Int32? = nil,
          @queue : String? = nil,
          @simulate_reserved_queue : String? = nil,
          @status_update_interval : String? = nil,
          @tags : Hash(String, String)? = nil,
          @user_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Successful create job requests will return the job JSON.

      struct CreateJobResponse
        include JSON::Serializable

        # Each job converts an input file into an output file or files. For more information, see the User
        # Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # Send your create job template request with the name of the template and the JSON for the template.
      # The template JSON should include everything in a valid job, except for input location and filename,
      # IAM role, and user metadata.

      struct CreateJobTemplateRequest
        include JSON::Serializable

        # The name of the job template you are creating.

        @[JSON::Field(key: "name")]
        getter name : String

        # JobTemplateSettings contains all the transcode settings saved in the template that will be applied
        # to jobs created from it.

        @[JSON::Field(key: "settings")]
        getter settings : Types::JobTemplateSettings

        # Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs
        # that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS
        # Elemental MediaConvert User Guide.

        @[JSON::Field(key: "accelerationSettings")]
        getter acceleration_settings : Types::AccelerationSettings?

        # Optional. A category for the job template you are creating

        @[JSON::Field(key: "category")]
        getter category : String?

        # Optional. A description of the job template you are creating.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional. Use queue hopping to avoid overly long waits in the backlog of the queue that you submit
        # your job to. Specify an alternate queue and the maximum time that your job will wait in the initial
        # queue before hopping. For more information about this feature, see the AWS Elemental MediaConvert
        # User Guide.

        @[JSON::Field(key: "hopDestinations")]
        getter hop_destinations : Array(Types::HopDestination)?

        # Specify the relative priority for this job. In any given queue, the service begins processing the
        # job with the highest value first. When more than one job has the same priority, the service begins
        # processing the job that you submitted first. If you don't specify a priority, the service uses the
        # default value 0.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Optional. The queue that jobs created from this template are assigned to. If you don't specify this,
        # jobs will go to the default queue.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the
        # interval, in seconds, between status updates. MediaConvert sends an update at this interval from the
        # time the service begins processing your job to the time it completes the transcode or encounters an
        # error.

        @[JSON::Field(key: "statusUpdateInterval")]
        getter status_update_interval : String?

        # The tags that you want to add to the resource. You can tag resources with a key-value pair or with
        # only a key.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @settings : Types::JobTemplateSettings,
          @acceleration_settings : Types::AccelerationSettings? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @hop_destinations : Array(Types::HopDestination)? = nil,
          @priority : Int32? = nil,
          @queue : String? = nil,
          @status_update_interval : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Successful create job template requests will return the template JSON.

      struct CreateJobTemplateResponse
        include JSON::Serializable

        # A job template is a pre-made set of encoding instructions that you can use to quickly create a job.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : Types::JobTemplate?

        def initialize(
          @job_template : Types::JobTemplate? = nil
        )
        end
      end

      # Send your create preset request with the name of the preset and the JSON for the output settings
      # specified by the preset.

      struct CreatePresetRequest
        include JSON::Serializable

        # The name of the preset you are creating.

        @[JSON::Field(key: "name")]
        getter name : String

        # Settings for preset

        @[JSON::Field(key: "settings")]
        getter settings : Types::PresetSettings

        # Optional. A category for the preset you are creating.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Optional. A description of the preset you are creating.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags that you want to add to the resource. You can tag resources with a key-value pair or with
        # only a key.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @settings : Types::PresetSettings,
          @category : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Successful create preset requests will return the preset JSON.

      struct CreatePresetResponse
        include JSON::Serializable

        # A preset is a collection of preconfigured media conversion settings that you want MediaConvert to
        # apply to the output during the conversion process.

        @[JSON::Field(key: "preset")]
        getter preset : Types::Preset?

        def initialize(
          @preset : Types::Preset? = nil
        )
        end
      end

      # Create an on-demand queue by sending a CreateQueue request with the name of the queue. Create a
      # reserved queue by sending a CreateQueue request with the pricing plan set to RESERVED and with
      # values specified for the settings under reservationPlanSettings. When you create a reserved queue,
      # you enter into a 12-month commitment to purchase the RTS that you specify. You can't cancel this
      # commitment.

      struct CreateQueueRequest
        include JSON::Serializable

        # The name of the queue that you are creating.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify the maximum number of jobs your queue can process concurrently. For on-demand queues, the
        # value you enter is constrained by your service quotas for Maximum concurrent jobs, per on-demand
        # queue and Maximum concurrent jobs, per account. For reserved queues, specify the number of jobs you
        # can process concurrently in your reservation plan instead.

        @[JSON::Field(key: "concurrentJobs")]
        getter concurrent_jobs : Int32?

        # Optional. A description of the queue that you are creating.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the pricing plan for the queue is on-demand or reserved. For on-demand, you pay
        # per minute, billed in increments of .01 minute. For reserved, you pay for the transcoding capacity
        # of the entire queue, regardless of how much or how little you use it. Reserved pricing requires a
        # 12-month commitment. When you use the API to create a queue, the default is on-demand.

        @[JSON::Field(key: "pricingPlan")]
        getter pricing_plan : String?

        # Details about the pricing plan for your reserved queue. Required for reserved queues and not
        # applicable to on-demand queues.

        @[JSON::Field(key: "reservationPlanSettings")]
        getter reservation_plan_settings : Types::ReservationPlanSettings?

        # Initial state of the queue. If you create a paused queue, then jobs in that queue won't begin.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags that you want to add to the resource. You can tag resources with a key-value pair or with
        # only a key.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @concurrent_jobs : Int32? = nil,
          @description : String? = nil,
          @pricing_plan : String? = nil,
          @reservation_plan_settings : Types::ReservationPlanSettings? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Successful create queue requests return the name of the queue that you just created and information
      # about it.

      struct CreateQueueResponse
        include JSON::Serializable

        # You can use queues to manage the resources that are available to your AWS account for running
        # multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs
        # through the default queue. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.

        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # The request to share MediaConvert resources with Support.

      struct CreateResourceShareRequest
        include JSON::Serializable

        # Specify MediaConvert Job ID or ARN to share

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # AWS Support case identifier

        @[JSON::Field(key: "supportCaseId")]
        getter support_case_id : String

        def initialize(
          @job_id : String,
          @support_case_id : String
        )
        end
      end

      # Successfully accepted the request to share MediaConvert resources.

      struct CreateResourceShareResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specify the details for each additional DASH manifest that you want the service to generate for this
      # output group. Each manifest can reference a different subset of outputs in the group.

      struct DashAdditionalManifest
        include JSON::Serializable

        # Specify a name modifier that the service adds to the name of this manifest to make it different from
        # the file names of the other main manifests in the output group. For example, say that the default
        # main manifest for your DASH group is film-name.mpd. If you enter "-no-premium" for this setting,
        # then the file name the service generates for this top-level manifest is film-name-no-premium.mpd.

        @[JSON::Field(key: "manifestNameModifier")]
        getter manifest_name_modifier : String?

        # Specify the outputs that you want this additional top-level manifest to reference.

        @[JSON::Field(key: "selectedOutputs")]
        getter selected_outputs : Array(String)?

        def initialize(
          @manifest_name_modifier : String? = nil,
          @selected_outputs : Array(String)? = nil
        )
        end
      end

      # Specifies DRM settings for DASH outputs.

      struct DashIsoEncryptionSettings
        include JSON::Serializable

        # This setting can improve the compatibility of your output with video players on obsolete devices. It
        # applies only to DASH H.264 outputs with DRM encryption. Choose Unencrypted SEI only to correct
        # problems with playback on older devices. Otherwise, keep the default setting CENC v1. If you choose
        # Unencrypted SEI, for that output, the service will exclude the access unit delimiter and will leave
        # the SEI NAL units unencrypted.

        @[JSON::Field(key: "playbackDeviceCompatibility")]
        getter playback_device_compatibility : String?

        # If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM
        # encryption with a SPEKE-compliant key provider. If your output group type is CMAF, use the
        # SpekeKeyProviderCmaf settings instead.

        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider?

        def initialize(
          @playback_device_compatibility : String? = nil,
          @speke_key_provider : Types::SpekeKeyProvider? = nil
        )
        end
      end

      # Settings related to your DASH output package. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

      struct DashIsoGroupSettings
        include JSON::Serializable

        # By default, the service creates one .mpd DASH manifest for each DASH ISO output group in your job.
        # This default manifest references every output in the output group. To create additional DASH
        # manifests that reference a subset of the outputs in the output group, specify a list of them here.

        @[JSON::Field(key: "additionalManifests")]
        getter additional_manifests : Array(Types::DashAdditionalManifest)?

        # Use this setting only when your audio codec is a Dolby one (AC3, EAC3, or Atmos) and your downstream
        # workflow requires that your DASH manifest use the Dolby channel configuration tag, rather than the
        # MPEG one. For example, you might need to use this to make dynamic ad insertion work. Specify which
        # audio channel configuration scheme ID URI MediaConvert writes in your DASH manifest. Keep the
        # default value, MPEG channel configuration, to have MediaConvert write this:
        # urn:mpeg:mpegB:cicp:ChannelConfiguration. Choose Dolby channel configuration to have MediaConvert
        # write this instead: tag:dolby.com,2014:dash:audio_channel_configuration:2011.

        @[JSON::Field(key: "audioChannelConfigSchemeIdUri")]
        getter audio_channel_config_scheme_id_uri : String?

        # A partial URI prefix that will be put in the manifest (.mpd) file at the top level BaseURL element.
        # Can be used if streams are delivered from a different URL than the manifest file.

        @[JSON::Field(key: "baseUrl")]
        getter base_url : String?

        # Specify whether MediaConvert generates I-frame only video segments for DASH trick play, also known
        # as trick mode. When specified, the I-frame only video segments are included within an additional
        # AdaptationSet in your DASH output manifest. To generate I-frame only video segments: Enter a name as
        # a text string, up to 256 character long. This name is appended to the end of this output group's
        # base filename, that you specify as part of your destination URI, and used for the I-frame only video
        # segment files. You may also include format identifiers. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html#using-settings-variables-with-streaming-outputs
        # To not generate I-frame only video segments: Leave blank.

        @[JSON::Field(key: "dashIFrameTrickPlayNameModifier")]
        getter dash_i_frame_trick_play_name_modifier : String?

        # Specify how MediaConvert writes SegmentTimeline in your output DASH manifest. To write a
        # SegmentTimeline for outputs that you also specify a Name modifier for: Keep the default value,
        # Basic. Note that if you do not specify a name modifier for an output, MediaConvert will not write a
        # SegmentTimeline for it. To write a common SegmentTimeline in the video AdaptationSet: Choose
        # Compact. Note that MediaConvert will still write a SegmentTimeline in any Representation that does
        # not share a common timeline. To write a video AdaptationSet for each different output framerate, and
        # a common SegmentTimeline in each AdaptationSet: Choose Distinct. To write a SegmentTimeline in each
        # AdaptationSet: Choose Full.

        @[JSON::Field(key: "dashManifestStyle")]
        getter dash_manifest_style : String?

        # Use Destination to specify the S3 output location and the output filename base. Destination accepts
        # format identifiers. If you do not specify the base filename in the URI, the service will use the
        # filename of the input file. If your job has multiple inputs, the service uses the filename of the
        # first input file.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # Settings associated with the destination. Will vary based on the type of destination

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::DestinationSettings?

        # DRM settings.

        @[JSON::Field(key: "encryption")]
        getter encryption : Types::DashIsoEncryptionSettings?

        # Length of fragments to generate (in seconds). Fragment length must be compatible with GOP size and
        # Framerate. Note that fragments will end on the next keyframe after this number of seconds, so actual
        # fragment length may be longer. When Emit Single File is checked, the fragmentation is internal to a
        # single output file and it does not cause the creation of many output files as in other output types.

        @[JSON::Field(key: "fragmentLength")]
        getter fragment_length : Int32?

        # Supports HbbTV specification as indicated

        @[JSON::Field(key: "hbbtvCompliance")]
        getter hbbtv_compliance : String?

        # Specify whether MediaConvert generates images for trick play. Keep the default value, None, to not
        # generate any images. Choose Thumbnail to generate tiled thumbnails. Choose Thumbnail and full frame
        # to generate tiled thumbnails and full-resolution images of single frames. MediaConvert adds an entry
        # in the .mpd manifest for each set of images that you generate. A common application for these images
        # is Roku trick mode. The thumbnails and full-frame images that MediaConvert creates with this feature
        # are compatible with this Roku specification:
        # https://developer.roku.com/docs/developer-program/media-playback/trick-mode/hls-and-dash.md

        @[JSON::Field(key: "imageBasedTrickPlay")]
        getter image_based_trick_play : String?

        # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

        @[JSON::Field(key: "imageBasedTrickPlaySettings")]
        getter image_based_trick_play_settings : Types::DashIsoImageBasedTrickPlaySettings?

        # Minimum time of initially buffered media that is needed to ensure smooth playout.

        @[JSON::Field(key: "minBufferTime")]
        getter min_buffer_time : Int32?

        # Keep this setting at the default value of 0, unless you are troubleshooting a problem with how
        # devices play back the end of your video asset. If you know that player devices are hanging on the
        # final segment of your video because the length of your final segment is too short, use this setting
        # to specify a minimum final segment length, in seconds. Choose a value that is greater than or equal
        # to 1 and less than your segment length. When you specify a value for this setting, the encoder will
        # combine any final segment that is shorter than the length that you specify with the previous
        # segment. For example, your segment length is 3 seconds and your final segment is .5 seconds without
        # a minimum final segment length; when you set the minimum final segment length to 1, your final
        # segment is 3.5 seconds.

        @[JSON::Field(key: "minFinalSegmentLength")]
        getter min_final_segment_length : Float64?

        # Specify how the value for bandwidth is determined for each video Representation in your output MPD
        # manifest. We recommend that you choose a MPD manifest bandwidth type that is compatible with your
        # downstream player configuration. Max: Use the same value that you specify for Max bitrate in the
        # video output, in bits per second. Average: Use the calculated average bitrate of the encoded video
        # output, in bits per second.

        @[JSON::Field(key: "mpdManifestBandwidthType")]
        getter mpd_manifest_bandwidth_type : String?

        # Specify whether your DASH profile is on-demand or main. When you choose Main profile, the service
        # signals urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you choose On-demand,
        # the service signals urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
        # On-demand, you must also set the output group setting Segment control to Single file.

        @[JSON::Field(key: "mpdProfile")]
        getter mpd_profile : String?

        # Use this setting only when your output video stream has B-frames, which causes the initial
        # presentation time stamp (PTS) to be offset from the initial decode time stamp (DTS). Specify how
        # MediaConvert handles PTS when writing time stamps in output DASH manifests. Choose Match initial PTS
        # when you want MediaConvert to use the initial PTS as the first time stamp in the manifest. Choose
        # Zero-based to have MediaConvert ignore the initial PTS in the video stream and instead write the
        # initial time stamp as zero in the manifest. For outputs that don't have B-frames, the time stamps in
        # your DASH manifests start at zero regardless of your choice here.

        @[JSON::Field(key: "ptsOffsetHandlingForBFrames")]
        getter pts_offset_handling_for_b_frames : String?

        # When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the
        # Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be
        # created.

        @[JSON::Field(key: "segmentControl")]
        getter segment_control : String?

        # Specify the length, in whole seconds, of each segment. When you don't specify a value, MediaConvert
        # defaults to 30. Related settings: Use Segment length control to specify whether the encoder enforces
        # this value strictly. Use Segment control to specify whether MediaConvert creates separate segment
        # files or one content file that has metadata to mark the segment boundaries.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # Specify how you want MediaConvert to determine segment lengths in this output group. To use the
        # exact value that you specify under Segment length: Choose Exact. Note that this might result in
        # additional I-frames in the output GOP. To create segment lengths that are a multiple of the GOP:
        # Choose Multiple of GOP. MediaConvert will round up the segment lengths to match the next GOP
        # boundary. To have MediaConvert automatically determine a segment duration that is a multiple of both
        # the audio packets and the frame rates: Choose Match. When you do, also specify a target segment
        # duration under Segment length. This is useful for some ad-insertion or segment replacement
        # workflows. Note that Match has the following requirements: - Output containers: Include at least one
        # video output and at least one audio output. Audio-only outputs are not supported. - Output frame
        # rate: Follow source is not supported. - Multiple output frame rates: When you specify multiple
        # outputs, we recommend they share a similar frame rate (as in X/3, X/2, X, or 2X). For example: 5,
        # 15, 30 and 60. Or: 25 and 50. (Outputs must share an integer multiple.) - Output audio codec:
        # Specify Advanced Audio Coding (AAC). - Output sample rate: Choose 48kHz.

        @[JSON::Field(key: "segmentLengthControl")]
        getter segment_length_control : String?

        # Specify the video sample composition time offset mode in the output fMP4 TRUN box. For wider player
        # compatibility, set Video composition offsets to Unsigned or leave blank. The earliest presentation
        # time may be greater than zero, and sample composition time offsets will increment using unsigned
        # integers. For strict fMP4 video and audio timing, set Video composition offsets to Signed. The
        # earliest presentation time will be equal to zero, and sample composition time offsets will increment
        # using signed integers.

        @[JSON::Field(key: "videoCompositionOffsets")]
        getter video_composition_offsets : String?

        # If you get an HTTP error in the 400 range when you play back your DASH output, enable this setting
        # and run your transcoding job again. When you enable this setting, the service writes precise segment
        # durations in the DASH manifest. The segment duration information appears inside the SegmentTimeline
        # element, inside SegmentTemplate at the Representation level. When you don't enable this setting, the
        # service writes approximate segment durations in your DASH manifest.

        @[JSON::Field(key: "writeSegmentTimelineInRepresentation")]
        getter write_segment_timeline_in_representation : String?

        def initialize(
          @additional_manifests : Array(Types::DashAdditionalManifest)? = nil,
          @audio_channel_config_scheme_id_uri : String? = nil,
          @base_url : String? = nil,
          @dash_i_frame_trick_play_name_modifier : String? = nil,
          @dash_manifest_style : String? = nil,
          @destination : String? = nil,
          @destination_settings : Types::DestinationSettings? = nil,
          @encryption : Types::DashIsoEncryptionSettings? = nil,
          @fragment_length : Int32? = nil,
          @hbbtv_compliance : String? = nil,
          @image_based_trick_play : String? = nil,
          @image_based_trick_play_settings : Types::DashIsoImageBasedTrickPlaySettings? = nil,
          @min_buffer_time : Int32? = nil,
          @min_final_segment_length : Float64? = nil,
          @mpd_manifest_bandwidth_type : String? = nil,
          @mpd_profile : String? = nil,
          @pts_offset_handling_for_b_frames : String? = nil,
          @segment_control : String? = nil,
          @segment_length : Int32? = nil,
          @segment_length_control : String? = nil,
          @video_composition_offsets : String? = nil,
          @write_segment_timeline_in_representation : String? = nil
        )
        end
      end

      # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

      struct DashIsoImageBasedTrickPlaySettings
        include JSON::Serializable

        # The cadence MediaConvert follows for generating thumbnails. If set to FOLLOW_IFRAME, MediaConvert
        # generates thumbnails for each IDR frame in the output (matching the GOP cadence). If set to
        # FOLLOW_CUSTOM, MediaConvert generates thumbnails according to the interval you specify in
        # thumbnailInterval.

        @[JSON::Field(key: "intervalCadence")]
        getter interval_cadence : String?

        # Height of each thumbnail within each tile image, in pixels. Leave blank to maintain aspect ratio
        # with thumbnail width. If following the aspect ratio would lead to a total tile height greater than
        # 4096, then the job will be rejected. Must be divisible by 2.

        @[JSON::Field(key: "thumbnailHeight")]
        getter thumbnail_height : Int32?

        # Enter the interval, in seconds, that MediaConvert uses to generate thumbnails. If the interval you
        # enter doesn't align with the output frame rate, MediaConvert automatically rounds the interval to
        # align with the output frame rate. For example, if the output frame rate is 29.97 frames per second
        # and you enter 5, MediaConvert uses a 150 frame interval to generate thumbnails.

        @[JSON::Field(key: "thumbnailInterval")]
        getter thumbnail_interval : Float64?

        # Width of each thumbnail within each tile image, in pixels. Default is 312. Must be divisible by 8.

        @[JSON::Field(key: "thumbnailWidth")]
        getter thumbnail_width : Int32?

        # Number of thumbnails in each column of a tile image. Set a value between 2 and 2048. Must be
        # divisible by 2.

        @[JSON::Field(key: "tileHeight")]
        getter tile_height : Int32?

        # Number of thumbnails in each row of a tile image. Set a value between 1 and 512.

        @[JSON::Field(key: "tileWidth")]
        getter tile_width : Int32?

        def initialize(
          @interval_cadence : String? = nil,
          @thumbnail_height : Int32? = nil,
          @thumbnail_interval : Float64? = nil,
          @thumbnail_width : Int32? = nil,
          @tile_height : Int32? = nil,
          @tile_width : Int32? = nil
        )
        end
      end

      # Details about the media file's data track.

      struct DataProperties
        include JSON::Serializable

        # The language code of the data track, in three character ISO 639-3 format.

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        def initialize(
          @language_code : String? = nil
        )
        end
      end

      # Settings for deinterlacer

      struct Deinterlacer
        include JSON::Serializable

        # Only applies when you set Deinterlace mode to Deinterlace or Adaptive. Interpolate produces sharper
        # pictures, while blend produces smoother motion. If your source file includes a ticker, such as a
        # scrolling headline at the bottom of the frame: Choose Interpolate ticker or Blend ticker. To apply
        # field doubling: Choose Linear interpolation. Note that Linear interpolation may introduce video
        # artifacts into your output.

        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # - When set to NORMAL (default), the deinterlacer does not convert frames that are tagged in metadata
        # as progressive. It will only convert those that are tagged as some other type. - When set to
        # FORCE_ALL_FRAMES, the deinterlacer converts every frame to progressive - even those that are already
        # tagged as progressive. Turn Force mode on only if there is a good chance that the metadata has
        # tagged frames as progressive when they are not progressive. Do not turn on otherwise; processing
        # frames that are already progressive into progressive will probably result in lower quality video.

        @[JSON::Field(key: "control")]
        getter control : String?

        # Use Deinterlacer to choose how the service will do deinterlacing. Default is Deinterlace. -
        # Deinterlace converts interlaced to progressive. - Inverse telecine converts Hard Telecine 29.97i to
        # progressive 23.976p. - Adaptive auto-detects and converts to progressive.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @algorithm : String? = nil,
          @control : String? = nil,
          @mode : String? = nil
        )
        end
      end

      # Delete a job template by sending a request with the job template name

      struct DeleteJobTemplateRequest
        include JSON::Serializable

        # The name of the job template to be deleted.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Delete job template requests will return an OK message or error message with an empty body.

      struct DeleteJobTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Send a request to permanently delete a policy that you created.

      struct DeletePolicyRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Successful DELETE policy requests will return an OK message.

      struct DeletePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Delete a preset by sending a request with the preset name

      struct DeletePresetRequest
        include JSON::Serializable

        # The name of the preset to be deleted.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Delete preset requests will return an OK message or error message with an empty body.

      struct DeletePresetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Delete a queue by sending a request with the queue name. You can't delete a queue with an active
      # pricing plan or one that has unprocessed jobs in it.

      struct DeleteQueueRequest
        include JSON::Serializable

        # The name of the queue that you want to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Delete queue requests return an OK message or error message with an empty body.

      struct DeleteQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Send a request with an empty body to the regional API endpoint to get your account API endpoint.
      # Note that DescribeEndpoints is no longer required. We recommend that you send your requests directly
      # to the regional endpoint instead.

      struct DescribeEndpointsRequest
        include JSON::Serializable

        # Optional. Max number of endpoints, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to return your endpoints if
        # any exist, or to create an endpoint for you and return it if one doesn't already exist. Specify
        # GET_ONLY to return your endpoints if any exist, or an empty list if none exist.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # Use this string, provided with the response to a previous request, to request the next batch of
        # endpoints.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @mode : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Successful describe endpoints requests will return your account API endpoint.

      struct DescribeEndpointsResponse
        include JSON::Serializable

        # List of endpoints

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # Use this string to request the next batch of endpoints.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Settings associated with the destination. Will vary based on the type of destination

      struct DestinationSettings
        include JSON::Serializable

        # Settings associated with S3 destination

        @[JSON::Field(key: "s3Settings")]
        getter s3_settings : Types::S3DestinationSettings?

        def initialize(
          @s3_settings : Types::S3DestinationSettings? = nil
        )
        end
      end

      # Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM)
      # certificate and an AWS Elemental MediaConvert resource.

      struct DisassociateCertificateRequest
        include JSON::Serializable

        # The ARN of the ACM certificate that you want to disassociate from your MediaConvert resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Successful disassociation of Certificate Manager Amazon Resource Name (ARN) with Mediaconvert
      # returns an OK message.

      struct DisassociateCertificateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Create Dolby Vision Profile 5 or Profile 8.1 compatible video output.

      struct DolbyVision
        include JSON::Serializable

        # Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL
        # values in your input with new values.

        @[JSON::Field(key: "l6Metadata")]
        getter l6_metadata : Types::DolbyVisionLevel6Metadata?

        # Use Dolby Vision Mode to choose how the service will handle Dolby Vision MaxCLL and MaxFALL
        # properies.

        @[JSON::Field(key: "l6Mode")]
        getter l6_mode : String?

        # Required when you set Dolby Vision Profile to Profile 8.1. When you set Content mapping to None,
        # content mapping is not applied to the HDR10-compatible signal. Depending on the source peak nit
        # level, clipping might occur on HDR devices without Dolby Vision. When you set Content mapping to
        # HDR10 1000, the transcoder creates a 1,000 nits peak HDR10-compatible signal by applying static
        # content mapping to the source. This mode is speed-optimized for PQ10 sources with metadata that is
        # created from analysis. For graded Dolby Vision content, be aware that creative intent might not be
        # guaranteed with extreme 1,000 nits trims.

        @[JSON::Field(key: "mapping")]
        getter mapping : String?

        # Required when you enable Dolby Vision. Use Profile 5 to include frame-interleaved Dolby Vision
        # metadata in your output. Your input must include Dolby Vision metadata or an HDR10 YUV color space.
        # Use Profile 8.1 to include frame-interleaved Dolby Vision metadata and HDR10 metadata in your
        # output. Your input must include Dolby Vision metadata.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        def initialize(
          @l6_metadata : Types::DolbyVisionLevel6Metadata? = nil,
          @l6_mode : String? = nil,
          @mapping : String? = nil,
          @profile : String? = nil
        )
        end
      end

      # Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL
      # values in your input with new values.

      struct DolbyVisionLevel6Metadata
        include JSON::Serializable

        # Maximum Content Light Level. Static HDR metadata that corresponds to the brightest pixel in the
        # entire stream. Measured in nits.

        @[JSON::Field(key: "maxCll")]
        getter max_cll : Int32?

        # Maximum Frame-Average Light Level. Static HDR metadata that corresponds to the highest frame-average
        # brightness in the entire stream. Measured in nits.

        @[JSON::Field(key: "maxFall")]
        getter max_fall : Int32?

        def initialize(
          @max_cll : Int32? = nil,
          @max_fall : Int32? = nil
        )
        end
      end

      # Use these settings to insert a DVB Network Information Table (NIT) in the transport stream of this
      # output.

      struct DvbNitSettings
        include JSON::Serializable

        # The numeric value placed in the Network Information Table (NIT).

        @[JSON::Field(key: "networkId")]
        getter network_id : Int32?

        # The network name text placed in the network_name_descriptor inside the Network Information Table.
        # Maximum length is 256 characters.

        @[JSON::Field(key: "networkName")]
        getter network_name : String?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "nitInterval")]
        getter nit_interval : Int32?

        def initialize(
          @network_id : Int32? = nil,
          @network_name : String? = nil,
          @nit_interval : Int32? = nil
        )
        end
      end

      # Use these settings to insert a DVB Service Description Table (SDT) in the transport stream of this
      # output.

      struct DvbSdtSettings
        include JSON::Serializable

        # Selects method of inserting SDT information into output stream. "Follow input SDT" copies SDT
        # information from input stream to output stream. "Follow input SDT if present" copies SDT information
        # from input stream to output stream if SDT information is present in the input, otherwise it will
        # fall back on the user-defined values. Enter "SDT Manually" means user will enter the SDT
        # information. "No SDT" means output stream will not contain SDT information.

        @[JSON::Field(key: "outputSdt")]
        getter output_sdt : String?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "sdtInterval")]
        getter sdt_interval : Int32?

        # The service name placed in the service_descriptor in the Service Description Table. Maximum length
        # is 256 characters.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The service provider name placed in the service_descriptor in the Service Description Table. Maximum
        # length is 256 characters.

        @[JSON::Field(key: "serviceProviderName")]
        getter service_provider_name : String?

        def initialize(
          @output_sdt : String? = nil,
          @sdt_interval : Int32? = nil,
          @service_name : String? = nil,
          @service_provider_name : String? = nil
        )
        end
      end

      # Settings related to DVB-Sub captions. Set up DVB-Sub captions in the same output as your video. For
      # more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/dvb-sub-output-captions.html.

      struct DvbSubDestinationSettings
        include JSON::Serializable

        # Specify the alignment of your captions. If no explicit x_position is provided, setting alignment to
        # centered will placethe captions at the bottom center of the output. Similarly, setting a left
        # alignment willalign captions to the bottom left of the output. If x and y positions are given in
        # conjunction with the alignment parameter, the font will be justified (either left or centered)
        # relative to those coordinates. Within your job settings, all of your DVB-Sub settings must be
        # identical.

        @[JSON::Field(key: "alignment")]
        getter alignment : String?

        # Ignore this setting unless Style Passthrough is set to Enabled and Font color set to Black, Yellow,
        # Red, Green, Blue, or Hex. Use Apply font color for additional font color controls. When you choose
        # White text only, or leave blank, your font color setting only applies to white text in your input
        # captions. For example, if your font color setting is Yellow, and your input captions have red and
        # white text, your output captions will have red and yellow text. When you choose ALL_TEXT, your font
        # color setting applies to all of your output captions text.

        @[JSON::Field(key: "applyFontColor")]
        getter apply_font_color : String?

        # Specify the color of the rectangle behind the captions. Leave background color blank and set Style
        # passthrough to enabled to use the background color data from your input captions, if present.

        @[JSON::Field(key: "backgroundColor")]
        getter background_color : String?

        # Specify the opacity of the background rectangle. Enter a value from 0 to 255, where 0 is transparent
        # and 255 is opaque. If Style passthrough is set to enabled, leave blank to pass through the
        # background style information in your input captions to your output captions. If Style passthrough is
        # set to disabled, leave blank to use a value of 0 and remove all backgrounds from your output
        # captions. Within your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "backgroundOpacity")]
        getter background_opacity : Int32?

        # Specify how MediaConvert handles the display definition segment (DDS). To exclude the DDS from this
        # set of captions: Keep the default, None. To include the DDS: Choose Specified. When you do, also
        # specify the offset coordinates of the display window with DDS x-coordinate and DDS y-coordinate. To
        # include the DDS, but not include display window data: Choose No display window. When you do, you can
        # write position metadata to the page composition segment (PCS) with DDS x-coordinate and DDS
        # y-coordinate. For video resolutions with a height of 576 pixels or less, MediaConvert doesn't
        # include the DDS, regardless of the value you choose for DDS handling. All burn-in and DVB-Sub font
        # settings must match. To include the DDS, with optimized subtitle placement and reduced data
        # overhead: We recommend that you choose Specified (optimal). This option provides the same visual
        # positioning as Specified while using less bandwidth. This also supports resolutions higher than
        # 1080p while maintaining full DVB-Sub compatibility. When you do, also specify the offset coordinates
        # of the display window with DDS x-coordinate and DDS y-coordinate.

        @[JSON::Field(key: "ddsHandling")]
        getter dds_handling : String?

        # Use this setting, along with DDS y-coordinate, to specify the upper left corner of the display
        # definition segment (DDS) display window. With this setting, specify the distance, in pixels, between
        # the left side of the frame and the left side of the DDS display window. Keep the default value, 0,
        # to have MediaConvert automatically choose this offset. Related setting: When you use this setting,
        # you must set DDS handling to a value other than None. MediaConvert uses these values to determine
        # whether to write page position data to the DDS or to the page composition segment. All burn-in and
        # DVB-Sub font settings must match.

        @[JSON::Field(key: "ddsXCoordinate")]
        getter dds_x_coordinate : Int32?

        # Use this setting, along with DDS x-coordinate, to specify the upper left corner of the display
        # definition segment (DDS) display window. With this setting, specify the distance, in pixels, between
        # the top of the frame and the top of the DDS display window. Keep the default value, 0, to have
        # MediaConvert automatically choose this offset. Related setting: When you use this setting, you must
        # set DDS handling to a value other than None. MediaConvert uses these values to determine whether to
        # write page position data to the DDS or to the page composition segment (PCS). All burn-in and
        # DVB-Sub font settings must match.

        @[JSON::Field(key: "ddsYCoordinate")]
        getter dds_y_coordinate : Int32?

        # Specify the font that you want the service to use for your burn in captions when your input captions
        # specify a font that MediaConvert doesn't support. When you set Fallback font to best match, or leave
        # blank, MediaConvert uses a supported font that most closely matches the font that your input
        # captions specify. When there are multiple unsupported fonts in your input captions, MediaConvert
        # matches each font with the supported font that matches best. When you explicitly choose a
        # replacement font, MediaConvert uses that font to replace all unsupported fonts from your input.

        @[JSON::Field(key: "fallbackFont")]
        getter fallback_font : String?

        # Specify the color of the captions text. Leave Font color blank and set Style passthrough to enabled
        # to use the font color data from your input captions, if present. Within your job settings, all of
        # your DVB-Sub settings must be identical.

        @[JSON::Field(key: "fontColor")]
        getter font_color : String?

        # Specify a bold TrueType font file to use when rendering your output captions. Enter an S3, HTTP, or
        # HTTPS URL. When you do, you must also separately specify a regular, an italic, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileBold")]
        getter font_file_bold : String?

        # Specify a bold italic TrueType font file to use when rendering your output captions. Enter an S3,
        # HTTP, or HTTPS URL. When you do, you must also separately specify a regular, a bold, and an italic
        # font file.

        @[JSON::Field(key: "fontFileBoldItalic")]
        getter font_file_bold_italic : String?

        # Specify an italic TrueType font file to use when rendering your output captions. Enter an S3, HTTP,
        # or HTTPS URL. When you do, you must also separately specify a regular, a bold, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileItalic")]
        getter font_file_italic : String?

        # Specify a regular TrueType font file to use when rendering your output captions. Enter an S3, HTTP,
        # or HTTPS URL. When you do, you must also separately specify a bold, an italic, and a bold italic
        # font file.

        @[JSON::Field(key: "fontFileRegular")]
        getter font_file_regular : String?

        # Specify the opacity of the burned-in captions. 255 is opaque; 0 is transparent. Within your job
        # settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "fontOpacity")]
        getter font_opacity : Int32?

        # Specify the Font resolution in DPI (dots per inch). Within your job settings, all of your DVB-Sub
        # settings must be identical.

        @[JSON::Field(key: "fontResolution")]
        getter font_resolution : Int32?

        # Set Font script to Automatically determined, or leave blank, to automatically determine the font
        # script in your input captions. Otherwise, set to Simplified Chinese (HANS) or Traditional Chinese
        # (HANT) if your input font script uses Simplified or Traditional Chinese. Within your job settings,
        # all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "fontScript")]
        getter font_script : String?

        # Specify the Font size in pixels. Must be a positive integer. Set to 0, or leave blank, for automatic
        # font size. Within your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "fontSize")]
        getter font_size : Int32?

        # Specify the height, in pixels, of this set of DVB-Sub captions. The default value is 576 pixels.
        # Related setting: When you use this setting, you must set DDS handling to a value other than None.
        # All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Ignore this setting unless your Font color is set to Hex. Enter either six or eight hexidecimal
        # digits, representing red, green, and blue, with two optional extra digits for alpha. For example a
        # value of 1122AABB is a red value of 0x11, a green value of 0x22, a blue value of 0xAA, and an alpha
        # value of 0xBB.

        @[JSON::Field(key: "hexFontColor")]
        getter hex_font_color : String?

        # Specify font outline color. Leave Outline color blank and set Style passthrough to enabled to use
        # the font outline color data from your input captions, if present. Within your job settings, all of
        # your DVB-Sub settings must be identical.

        @[JSON::Field(key: "outlineColor")]
        getter outline_color : String?

        # Specify the Outline size of the caption text, in pixels. Leave Outline size blank and set Style
        # passthrough to enabled to use the outline size data from your input captions, if present. Within
        # your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "outlineSize")]
        getter outline_size : Int32?

        # Specify the color of the shadow cast by the captions. Leave Shadow color blank and set Style
        # passthrough to enabled to use the shadow color data from your input captions, if present. Within
        # your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "shadowColor")]
        getter shadow_color : String?

        # Specify the opacity of the shadow. Enter a value from 0 to 255, where 0 is transparent and 255 is
        # opaque. If Style passthrough is set to Enabled, leave Shadow opacity blank to pass through the
        # shadow style information in your input captions to your output captions. If Style passthrough is set
        # to disabled, leave blank to use a value of 0 and remove all shadows from your output captions.
        # Within your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "shadowOpacity")]
        getter shadow_opacity : Int32?

        # Specify the horizontal offset of the shadow, relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels to the left. Within your job settings, all of your DVB-Sub
        # settings must be identical.

        @[JSON::Field(key: "shadowXOffset")]
        getter shadow_x_offset : Int32?

        # Specify the vertical offset of the shadow relative to the captions in pixels. A value of -2 would
        # result in a shadow offset 2 pixels above the text. Leave Shadow y-offset blank and set Style
        # passthrough to enabled to use the shadow y-offset data from your input captions, if present. Within
        # your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "shadowYOffset")]
        getter shadow_y_offset : Int32?

        # To use the available style, color, and position information from your input captions: Set Style
        # passthrough to Enabled. Note that MediaConvert uses default settings for any missing style or
        # position information in your input captions To ignore the style and position information from your
        # input captions and use default settings: Leave blank or keep the default value, Disabled. Default
        # settings include white text with black outlining, bottom-center positioning, and automatic sizing.
        # Whether you set Style passthrough to enabled or not, you can also choose to manually override any of
        # the individual style and position settings. You can also override any fonts by manually specifying
        # custom font files.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        # Specify whether your DVB subtitles are standard or for hearing impaired. Choose hearing impaired if
        # your subtitles include audio descriptions and dialogue. Choose standard if your subtitles include
        # only dialogue.

        @[JSON::Field(key: "subtitlingType")]
        getter subtitling_type : String?

        # Specify whether the Text spacing in your captions is set by the captions grid, or varies depending
        # on letter width. Choose fixed grid to conform to the spacing specified in the captions file more
        # accurately. Choose proportional to make the text easier to read for closed captions. Within your job
        # settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "teletextSpacing")]
        getter teletext_spacing : String?

        # Specify the width, in pixels, of this set of DVB-Sub captions. The default value is 720 pixels.
        # Related setting: When you use this setting, you must set DDS handling to a value other than None.
        # All burn-in and DVB-Sub font settings must match.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        # Specify the horizontal position of the captions, relative to the left side of the output in pixels.
        # A value of 10 would result in the captions starting 10 pixels from the left of the output. If no
        # explicit x_position is provided, the horizontal caption position will be determined by the alignment
        # parameter. Within your job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "xPosition")]
        getter x_position : Int32?

        # Specify the vertical position of the captions, relative to the top of the output in pixels. A value
        # of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit
        # y_position is provided, the caption will be positioned towards the bottom of the output. Within your
        # job settings, all of your DVB-Sub settings must be identical.

        @[JSON::Field(key: "yPosition")]
        getter y_position : Int32?

        def initialize(
          @alignment : String? = nil,
          @apply_font_color : String? = nil,
          @background_color : String? = nil,
          @background_opacity : Int32? = nil,
          @dds_handling : String? = nil,
          @dds_x_coordinate : Int32? = nil,
          @dds_y_coordinate : Int32? = nil,
          @fallback_font : String? = nil,
          @font_color : String? = nil,
          @font_file_bold : String? = nil,
          @font_file_bold_italic : String? = nil,
          @font_file_italic : String? = nil,
          @font_file_regular : String? = nil,
          @font_opacity : Int32? = nil,
          @font_resolution : Int32? = nil,
          @font_script : String? = nil,
          @font_size : Int32? = nil,
          @height : Int32? = nil,
          @hex_font_color : String? = nil,
          @outline_color : String? = nil,
          @outline_size : Int32? = nil,
          @shadow_color : String? = nil,
          @shadow_opacity : Int32? = nil,
          @shadow_x_offset : Int32? = nil,
          @shadow_y_offset : Int32? = nil,
          @style_passthrough : String? = nil,
          @subtitling_type : String? = nil,
          @teletext_spacing : String? = nil,
          @width : Int32? = nil,
          @x_position : Int32? = nil,
          @y_position : Int32? = nil
        )
        end
      end

      # DVB Sub Source Settings

      struct DvbSubSourceSettings
        include JSON::Serializable

        # When using DVB-Sub with Burn-in, use this PID for the source content. Unused for DVB-Sub
        # passthrough. All DVB-Sub content is passed through, regardless of selectors.

        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        def initialize(
          @pid : Int32? = nil
        )
        end
      end

      # Use these settings to insert a DVB Time and Date Table (TDT) in the transport stream of this output.

      struct DvbTdtSettings
        include JSON::Serializable

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "tdtInterval")]
        getter tdt_interval : Int32?

        def initialize(
          @tdt_interval : Int32? = nil
        )
        end
      end

      # Use Dynamic audio selectors when you do not know the track layout of your source when you submit
      # your job, but want to select multiple audio tracks. When you include an audio track in your output
      # and specify this Dynamic audio selector as the Audio source, MediaConvert creates an audio track
      # within that output for each dynamically selected track. Note that when you include a Dynamic audio
      # selector for two or more inputs, each input must have the same number of audio tracks and audio
      # channels.

      struct DynamicAudioSelector
        include JSON::Serializable

        # Apply audio timing corrections to help synchronize audio and video in your output. To apply timing
        # corrections, your input must meet the following requirements: * Container: MP4, or MOV, with an
        # accurate time-to-sample (STTS) table. * Audio track: AAC. Choose from the following audio timing
        # correction settings: * Disabled (Default): Apply no correction. * Auto: Recommended for most inputs.
        # MediaConvert analyzes the audio timing in your input and determines which correction setting to use,
        # if needed. * Track: Adjust the duration of each audio frame by a constant amount to align the audio
        # track length with STTS duration. Track-level correction does not affect pitch, and is recommended
        # for tonal audio content such as music. * Frame: Adjust the duration of each audio frame by a
        # variable amount to align audio frames with STTS timestamps. No corrections are made to
        # already-aligned frames. Frame-level correction may affect the pitch of corrected frames, and is
        # recommended for atonal audio content such as speech or percussion. * Force: Apply audio duration
        # correction, either Track or Frame depending on your input, regardless of the accuracy of your
        # input's STTS table. Your output audio and video may not be aligned or it may contain audio
        # artifacts.

        @[JSON::Field(key: "audioDurationCorrection")]
        getter audio_duration_correction : String?

        # Specify the S3, HTTP, or HTTPS URL for your external audio file input.

        @[JSON::Field(key: "externalAudioFileInput")]
        getter external_audio_file_input : String?

        # Specify the language, using an ISO 639-2 three-letter code in all capital letters. You can find a
        # list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Specify a time delta, in milliseconds, to offset the audio from the input video. To specify no
        # offset: Keep the default value, 0. To specify an offset: Enter an integer from -2147483648 to
        # 2147483647

        @[JSON::Field(key: "offset")]
        getter offset : Int32?

        # Specify which audio tracks to dynamically select from your source. To select all audio tracks: Keep
        # the default value, All tracks. To select all audio tracks with a specific language code: Choose
        # Language code. When you do, you must also specify a language code under the Language code setting.
        # If there is no matching Language code in your source, then no track will be selected.

        @[JSON::Field(key: "selectorType")]
        getter selector_type : String?

        def initialize(
          @audio_duration_correction : String? = nil,
          @external_audio_file_input : String? = nil,
          @language_code : String? = nil,
          @offset : Int32? = nil,
          @selector_type : String? = nil
        )
        end
      end

      # Required when you set Codec to the value EAC3_ATMOS.

      struct Eac3AtmosSettings
        include JSON::Serializable

        # Specify the average bitrate for this output in bits per second. Valid values: 384k, 448k, 576k,
        # 640k, 768k, 1024k Default value: 448k Note that MediaConvert supports 384k only with channel-based
        # immersive (CBI) 7.1.4 and 5.1.4 inputs. For CBI 9.1.6 and other input types, MediaConvert
        # automatically increases your output bitrate to 448k.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about
        # the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).

        @[JSON::Field(key: "bitstreamMode")]
        getter bitstream_mode : String?

        # The coding mode for Dolby Digital Plus JOC (Atmos).

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue analysis.

        @[JSON::Field(key: "dialogueIntelligence")]
        getter dialogue_intelligence : String?

        # Specify whether MediaConvert should use any downmix metadata from your input file. Keep the default
        # value, Custom to provide downmix values in your job settings. Choose Follow source to use the
        # metadata from your input. Related settings--Use these settings to specify your downmix values: Left
        # only/Right only surround, Left total/Right total surround, Left total/Right total center, Left
        # only/Right only center, and Stereo downmix. When you keep Custom for Downmix control and you don't
        # specify values for the related settings, MediaConvert uses default values for those settings.

        @[JSON::Field(key: "downmixControl")]
        getter downmix_control : String?

        # Choose the Dolby dynamic range control (DRC) profile that MediaConvert uses when encoding the
        # metadata in the Dolby stream for the line operating mode. Default value: Film light Related setting:
        # To have MediaConvert use the value you specify here, keep the default value, Custom for the setting
        # Dynamic range control. Otherwise, MediaConvert ignores Dynamic range compression line. For
        # information about the Dolby DRC operating modes and profiles, see the Dynamic Range Control chapter
        # of the Dolby Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionLine")]
        getter dynamic_range_compression_line : String?

        # Choose the Dolby dynamic range control (DRC) profile that MediaConvert uses when encoding the
        # metadata in the Dolby stream for the RF operating mode. Default value: Film light Related setting:
        # To have MediaConvert use the value you specify here, keep the default value, Custom for the setting
        # Dynamic range control. Otherwise, MediaConvert ignores Dynamic range compression RF. For information
        # about the Dolby DRC operating modes and profiles, see the Dynamic Range Control chapter of the Dolby
        # Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionRf")]
        getter dynamic_range_compression_rf : String?

        # Specify whether MediaConvert should use any dynamic range control metadata from your input file.
        # Keep the default value, Custom, to provide dynamic range control values in your job settings. Choose
        # Follow source to use the metadata from your input. Related settings--Use these settings to specify
        # your dynamic range control values: Dynamic range compression line and Dynamic range compression RF.
        # When you keep the value Custom for Dynamic range control and you don't specify values for the
        # related settings, MediaConvert uses default values for those settings.

        @[JSON::Field(key: "dynamicRangeControl")]
        getter dynamic_range_control : String?

        # Specify a value for the following Dolby Atmos setting: Left only/Right only center mix (Lo/Ro
        # center). MediaConvert uses this value for downmixing. Default value: -3 dB. Valid values: 3.0, 1.5,
        # 0.0, -1.5, -3.0, -4.5, and -6.0. Related setting: How the service uses this value depends on the
        # value that you choose for Stereo downmix. Related setting: To have MediaConvert use this value, keep
        # the default value, Custom for the setting Downmix control. Otherwise, MediaConvert ignores Left
        # only/Right only center.

        @[JSON::Field(key: "loRoCenterMixLevel")]
        getter lo_ro_center_mix_level : Float64?

        # Specify a value for the following Dolby Atmos setting: Left only/Right only. MediaConvert uses this
        # value for downmixing. Default value: -3 dB. Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value
        # -60 mutes the channel. Related setting: How the service uses this value depends on the value that
        # you choose for Stereo downmix. Related setting: To have MediaConvert use this value, keep the
        # default value, Custom for the setting Downmix control. Otherwise, MediaConvert ignores Left
        # only/Right only surround.

        @[JSON::Field(key: "loRoSurroundMixLevel")]
        getter lo_ro_surround_mix_level : Float64?

        # Specify a value for the following Dolby Atmos setting: Left total/Right total center mix (Lt/Rt
        # center). MediaConvert uses this value for downmixing. Default value: -3 dB Valid values: 3.0, 1.5,
        # 0.0, -1.5, -3.0, -4.5, and -6.0. Related setting: How the service uses this value depends on the
        # value that you choose for Stereo downmix. Related setting: To have MediaConvert use this value, keep
        # the default value, Custom for the setting Downmix control. Otherwise, MediaConvert ignores Left
        # total/Right total center.

        @[JSON::Field(key: "ltRtCenterMixLevel")]
        getter lt_rt_center_mix_level : Float64?

        # Specify a value for the following Dolby Atmos setting: Left total/Right total surround mix (Lt/Rt
        # surround). MediaConvert uses this value for downmixing. Default value: -3 dB Valid values: -1.5,
        # -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. Related setting: How the service uses
        # this value depends on the value that you choose for Stereo downmix. Related setting: To have
        # MediaConvert use this value, keep the default value, Custom for the setting Downmix control.
        # Otherwise, the service ignores Left total/Right total surround.

        @[JSON::Field(key: "ltRtSurroundMixLevel")]
        getter lt_rt_surround_mix_level : Float64?

        # Choose how the service meters the loudness of your audio.

        @[JSON::Field(key: "meteringMode")]
        getter metering_mode : String?

        # This value is always 48000. It represents the sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Specify the percentage of audio content, from 0% to 100%, that must be speech in order for the
        # encoder to use the measured speech loudness as the overall program loudness. Default value: 15%

        @[JSON::Field(key: "speechThreshold")]
        getter speech_threshold : Int32?

        # Choose how the service does stereo downmixing. Default value: Not indicated Related setting: To have
        # MediaConvert use this value, keep the default value, Custom for the setting Downmix control.
        # Otherwise, MediaConvert ignores Stereo downmix.

        @[JSON::Field(key: "stereoDownmix")]
        getter stereo_downmix : String?

        # Specify whether your input audio has an additional center rear surround channel matrix encoded into
        # your left and right surround channels.

        @[JSON::Field(key: "surroundExMode")]
        getter surround_ex_mode : String?

        def initialize(
          @bitrate : Int32? = nil,
          @bitstream_mode : String? = nil,
          @coding_mode : String? = nil,
          @dialogue_intelligence : String? = nil,
          @downmix_control : String? = nil,
          @dynamic_range_compression_line : String? = nil,
          @dynamic_range_compression_rf : String? = nil,
          @dynamic_range_control : String? = nil,
          @lo_ro_center_mix_level : Float64? = nil,
          @lo_ro_surround_mix_level : Float64? = nil,
          @lt_rt_center_mix_level : Float64? = nil,
          @lt_rt_surround_mix_level : Float64? = nil,
          @metering_mode : String? = nil,
          @sample_rate : Int32? = nil,
          @speech_threshold : Int32? = nil,
          @stereo_downmix : String? = nil,
          @surround_ex_mode : String? = nil
        )
        end
      end

      # Required when you set Codec to the value EAC3.

      struct Eac3Settings
        include JSON::Serializable

        # If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround channels. Only used for 3/2
        # coding mode.

        @[JSON::Field(key: "attenuationControl")]
        getter attenuation_control : String?

        # Specify the average bitrate in bits per second. The bitrate that you specify must be a multiple of
        # 8000 within the allowed minimum and maximum values. Leave blank to use the default bitrate for the
        # coding mode you select according ETSI TS 102 366. Valid bitrates for coding mode 1/0: Default:
        # 96000. Minimum: 32000. Maximum: 3024000. Valid bitrates for coding mode 2/0: Default: 192000.
        # Minimum: 96000. Maximum: 3024000. Valid bitrates for coding mode 3/2: Default: 384000. Minimum:
        # 192000. Maximum: 3024000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about
        # the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).

        @[JSON::Field(key: "bitstreamMode")]
        getter bitstream_mode : String?

        # Dolby Digital Plus coding mode. Determines number of channels.

        @[JSON::Field(key: "codingMode")]
        getter coding_mode : String?

        # Activates a DC highpass filter for all input channels.

        @[JSON::Field(key: "dcFilter")]
        getter dc_filter : String?

        # Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be
        # passed through.

        @[JSON::Field(key: "dialnorm")]
        getter dialnorm : Int32?

        # Choose the Dolby Digital dynamic range control (DRC) profile that MediaConvert uses when encoding
        # the metadata in the Dolby Digital stream for the line operating mode. Related setting: When you use
        # this setting, MediaConvert ignores any value you provide for Dynamic range compression profile. For
        # information about the Dolby Digital DRC operating modes and profiles, see the Dynamic Range Control
        # chapter of the Dolby Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionLine")]
        getter dynamic_range_compression_line : String?

        # Choose the Dolby Digital dynamic range control (DRC) profile that MediaConvert uses when encoding
        # the metadata in the Dolby Digital stream for the RF operating mode. Related setting: When you use
        # this setting, MediaConvert ignores any value you provide for Dynamic range compression profile. For
        # information about the Dolby Digital DRC operating modes and profiles, see the Dynamic Range Control
        # chapter of the Dolby Metadata Guide at
        # https://developer.dolby.com/globalassets/professional/documents/dolby-metadata-guide.pdf.

        @[JSON::Field(key: "dynamicRangeCompressionRf")]
        getter dynamic_range_compression_rf : String?

        # When encoding 3/2 audio, controls whether the LFE channel is enabled

        @[JSON::Field(key: "lfeControl")]
        getter lfe_control : String?

        # Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding
        # mode.

        @[JSON::Field(key: "lfeFilter")]
        getter lfe_filter : String?

        # Specify a value for the following Dolby Digital Plus setting: Left only/Right only center mix.
        # MediaConvert uses this value for downmixing. How the service uses this value depends on the value
        # that you choose for Stereo downmix. Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, -6.0, and -60.
        # The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L,
        # R, C, Ls, Rs for the setting Coding mode. If you choose a different value for Coding mode, the
        # service ignores Left only/Right only center.

        @[JSON::Field(key: "loRoCenterMixLevel")]
        getter lo_ro_center_mix_level : Float64?

        # Specify a value for the following Dolby Digital Plus setting: Left only/Right only. MediaConvert
        # uses this value for downmixing. How the service uses this value depends on the value that you choose
        # for Stereo downmix. Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
        # This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs for the setting
        # Coding mode. If you choose a different value for Coding mode, the service ignores Left only/Right
        # only surround.

        @[JSON::Field(key: "loRoSurroundMixLevel")]
        getter lo_ro_surround_mix_level : Float64?

        # Specify a value for the following Dolby Digital Plus setting: Left total/Right total center mix.
        # MediaConvert uses this value for downmixing. How the service uses this value depends on the value
        # that you choose for Stereo downmix. Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, -6.0, and -60.
        # The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L,
        # R, C, Ls, Rs for the setting Coding mode. If you choose a different value for Coding mode, the
        # service ignores Left total/Right total center.

        @[JSON::Field(key: "ltRtCenterMixLevel")]
        getter lt_rt_center_mix_level : Float64?

        # Specify a value for the following Dolby Digital Plus setting: Left total/Right total surround mix.
        # MediaConvert uses this value for downmixing. How the service uses this value depends on the value
        # that you choose for Stereo downmix. Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60
        # mutes the channel. This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
        # for the setting Coding mode. If you choose a different value for Coding mode, the service ignores
        # Left total/Right total surround.

        @[JSON::Field(key: "ltRtSurroundMixLevel")]
        getter lt_rt_surround_mix_level : Float64?

        # When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that
        # supplied this audio data. If audio was not supplied from one of these streams, then the static
        # metadata settings will be used.

        @[JSON::Field(key: "metadataControl")]
        getter metadata_control : String?

        # When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is present on the input.
        # this detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and
        # non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and
        # encoding.

        @[JSON::Field(key: "passthroughControl")]
        getter passthrough_control : String?

        # Controls the amount of phase-shift applied to the surround channels. Only used for 3/2 coding mode.

        @[JSON::Field(key: "phaseControl")]
        getter phase_control : String?

        # This value is always 48000. It represents the sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Choose how the service does stereo downmixing. This setting only applies if you keep the default
        # value of 3/2 - L, R, C, Ls, Rs for the setting Coding mode. If you choose a different value for
        # Coding mode, the service ignores Stereo downmix.

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
          @bitrate : Int32? = nil,
          @bitstream_mode : String? = nil,
          @coding_mode : String? = nil,
          @dc_filter : String? = nil,
          @dialnorm : Int32? = nil,
          @dynamic_range_compression_line : String? = nil,
          @dynamic_range_compression_rf : String? = nil,
          @lfe_control : String? = nil,
          @lfe_filter : String? = nil,
          @lo_ro_center_mix_level : Float64? = nil,
          @lo_ro_surround_mix_level : Float64? = nil,
          @lt_rt_center_mix_level : Float64? = nil,
          @lt_rt_surround_mix_level : Float64? = nil,
          @metadata_control : String? = nil,
          @passthrough_control : String? = nil,
          @phase_control : String? = nil,
          @sample_rate : Int32? = nil,
          @stereo_downmix : String? = nil,
          @surround_ex_mode : String? = nil,
          @surround_mode : String? = nil
        )
        end
      end

      # Settings related to CEA/EIA-608 and CEA/EIA-708 (also called embedded or ancillary) captions. Set up
      # embedded captions in the same output as your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/embedded-output-captions.html.

      struct EmbeddedDestinationSettings
        include JSON::Serializable

        # Ignore this setting unless your input captions are SCC format and your output captions are embedded
        # in the video stream. Specify a CC number for each captions channel in this output. If you have two
        # channels, choose CC numbers that aren't in the same field. For example, choose 1 and 3. For more
        # information, see https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.

        @[JSON::Field(key: "destination608ChannelNumber")]
        getter destination608_channel_number : Int32?

        # Ignore this setting unless your input captions are SCC format and you want both 608 and 708 captions
        # embedded in your output stream. Optionally, specify the 708 service number for each output captions
        # channel. Choose a different number for each channel. To use this setting, also set Force 608 to 708
        # upconvert to Upconvert in your input captions selector settings. If you choose to upconvert but
        # don't specify a 708 service number, MediaConvert uses the number that you specify for CC channel
        # number for the 708 service number. For more information, see
        # https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.

        @[JSON::Field(key: "destination708ServiceNumber")]
        getter destination708_service_number : Int32?

        def initialize(
          @destination608_channel_number : Int32? = nil,
          @destination708_service_number : Int32? = nil
        )
        end
      end

      # Settings for embedded captions Source

      struct EmbeddedSourceSettings
        include JSON::Serializable

        # Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If
        # you choose Upconvert, MediaConvert includes the captions data in two ways: it passes the 608 data
        # through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608
        # data into 708.

        @[JSON::Field(key: "convert608To708")]
        getter convert608_to708 : String?

        # Specifies the 608/708 channel number within the video track from which to extract captions. Unused
        # for passthrough.

        @[JSON::Field(key: "source608ChannelNumber")]
        getter source608_channel_number : Int32?

        # Specifies the video track index used for extracting captions. The system only supports one input
        # video track, so this should always be set to '1'.

        @[JSON::Field(key: "source608TrackNumber")]
        getter source608_track_number : Int32?

        # By default, the service terminates any unterminated captions at the end of each input. If you want
        # the caption to continue onto your next input, disable this setting.

        @[JSON::Field(key: "terminateCaptions")]
        getter terminate_captions : String?

        def initialize(
          @convert608_to708 : String? = nil,
          @source608_channel_number : Int32? = nil,
          @source608_track_number : Int32? = nil,
          @terminate_captions : String? = nil
        )
        end
      end

      # Specify the SPEKE version, either v1.0 or v2.0, that MediaConvert uses when encrypting your output.
      # For more information, see:
      # https://docs.aws.amazon.com/speke/latest/documentation/speke-api-specification.html To use SPEKE
      # v1.0: Leave blank. To use SPEKE v2.0: Specify a SPEKE v2.0 video preset and a SPEKE v2.0 audio
      # preset.

      struct EncryptionContractConfiguration
        include JSON::Serializable

        # Specify which SPEKE version 2.0 audio preset MediaConvert uses to request content keys from your
        # SPEKE server. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/drm-content-speke-v2-presets.html To encrypt to
        # your audio outputs, choose from the following: Audio preset 1, Audio preset 2, or Audio preset 3. To
        # encrypt your audio outputs, using the same content key for both your audio and video outputs: Choose
        # Shared. When you do, you must also set SPEKE v2.0 video preset to Shared. To not encrypt your audio
        # outputs: Choose Unencrypted. When you do, to encrypt your video outputs, you must also specify a
        # SPEKE v2.0 video preset (other than Shared or Unencrypted).

        @[JSON::Field(key: "spekeAudioPreset")]
        getter speke_audio_preset : String?

        # Specify which SPEKE version 2.0 video preset MediaConvert uses to request content keys from your
        # SPEKE server. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/drm-content-speke-v2-presets.html To encrypt to
        # your video outputs, choose from the following: Video preset 1, Video preset 2, Video preset 3, Video
        # preset 4, Video preset 5, Video preset 6, Video preset 7, or Video preset 8. To encrypt your video
        # outputs, using the same content key for both your video and audio outputs: Choose Shared. When you
        # do, you must also set SPEKE v2.0 audio preset to Shared. To not encrypt your video outputs: Choose
        # Unencrypted. When you do, to encrypt your audio outputs, you must also specify a SPEKE v2.0 audio
        # preset (other than Shared or Unencrypted).

        @[JSON::Field(key: "spekeVideoPreset")]
        getter speke_video_preset : String?

        def initialize(
          @speke_audio_preset : String? = nil,
          @speke_video_preset : String? = nil
        )
        end
      end

      # Describes an account-specific API endpoint.

      struct Endpoint
        include JSON::Serializable

        # URL of endpoint

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # ESAM ManifestConfirmConditionNotification defined by OC-SP-ESAM-API-I03-131025.

      struct EsamManifestConfirmConditionNotification
        include JSON::Serializable

        # Provide your ESAM ManifestConfirmConditionNotification XML document inside your JSON job settings.
        # Form the XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest
        # Conditioning instructions in the message that you supply.

        @[JSON::Field(key: "mccXml")]
        getter mcc_xml : String?

        def initialize(
          @mcc_xml : String? = nil
        )
        end
      end

      # Settings for Event Signaling And Messaging (ESAM). If you don't do ad insertion, you can ignore
      # these settings.

      struct EsamSettings
        include JSON::Serializable

        # Specifies an ESAM ManifestConfirmConditionNotification XML as per OC-SP-ESAM-API-I03-131025. The
        # transcoder uses the manifest conditioning instructions that you provide in the setting MCC XML.

        @[JSON::Field(key: "manifestConfirmConditionNotification")]
        getter manifest_confirm_condition_notification : Types::EsamManifestConfirmConditionNotification?

        # Specifies the stream distance, in milliseconds, between the SCTE 35 messages that the transcoder
        # places and the splice points that they refer to. If the time between the start of the asset and the
        # SCTE-35 message is less than this value, then the transcoder places the SCTE-35 marker at the
        # beginning of the stream.

        @[JSON::Field(key: "responseSignalPreroll")]
        getter response_signal_preroll : Int32?

        # Specifies an ESAM SignalProcessingNotification XML as per OC-SP-ESAM-API-I03-131025. The transcoder
        # uses the signal processing instructions that you provide in the setting SCC XML.

        @[JSON::Field(key: "signalProcessingNotification")]
        getter signal_processing_notification : Types::EsamSignalProcessingNotification?

        def initialize(
          @manifest_confirm_condition_notification : Types::EsamManifestConfirmConditionNotification? = nil,
          @response_signal_preroll : Int32? = nil,
          @signal_processing_notification : Types::EsamSignalProcessingNotification? = nil
        )
        end
      end

      # ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.

      struct EsamSignalProcessingNotification
        include JSON::Serializable

        # Provide your ESAM SignalProcessingNotification XML document inside your JSON job settings. Form the
        # XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the signal processing
        # instructions in the message that you supply. For your MPEG2-TS file outputs, if you want the service
        # to place SCTE-35 markers at the insertion points you specify in the XML document, you must also
        # enable SCTE-35 ESAM. Note that you can either specify an ESAM XML document or enable SCTE-35
        # passthrough. You can't do both.

        @[JSON::Field(key: "sccXml")]
        getter scc_xml : String?

        def initialize(
          @scc_xml : String? = nil
        )
        end
      end


      struct ExceptionBody
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If your source content has EIA-608 Line 21 Data Services, enable this feature to specify what
      # MediaConvert does with the Extended Data Services (XDS) packets. You can choose to pass through XDS
      # packets, or remove them from the output. For more information about XDS, see EIA-608 Line Data
      # Services, section 9.5.1.5 05h Content Advisory.

      struct ExtendedDataServices
        include JSON::Serializable

        # The action to take on copy and redistribution control XDS packets. If you select PASSTHROUGH,
        # packets will not be changed. If you select STRIP, any packets will be removed in output captions.

        @[JSON::Field(key: "copyProtectionAction")]
        getter copy_protection_action : String?

        # The action to take on content advisory XDS packets. If you select PASSTHROUGH, packets will not be
        # changed. If you select STRIP, any packets will be removed in output captions.

        @[JSON::Field(key: "vchipAction")]
        getter vchip_action : String?

        def initialize(
          @copy_protection_action : String? = nil,
          @vchip_action : String? = nil
        )
        end
      end

      # Settings for F4v container

      struct F4vSettings
        include JSON::Serializable

        # To place the MOOV atom at the beginning of your output, which is useful for progressive downloading:
        # Leave blank or choose Progressive download. To place the MOOV at the end of your output: Choose
        # Normal.

        @[JSON::Field(key: "moovPlacement")]
        getter moov_placement : String?

        def initialize(
          @moov_placement : String? = nil
        )
        end
      end

      # Settings related to your File output group. MediaConvert uses this group of settings to generate a
      # single standalone file, rather than a streaming package.

      struct FileGroupSettings
        include JSON::Serializable

        # Use Destination to specify the S3 output location and the output filename base. Destination accepts
        # format identifiers. If you do not specify the base filename in the URI, the service will use the
        # filename of the input file. If your job has multiple inputs, the service uses the filename of the
        # first input file.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # Settings associated with the destination. Will vary based on the type of destination

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::DestinationSettings?

        def initialize(
          @destination : String? = nil,
          @destination_settings : Types::DestinationSettings? = nil
        )
        end
      end

      # If your input captions are SCC, SMI, SRT, STL, TTML, WebVTT, or IMSC 1.1 in an xml file, specify the
      # URI of the input caption source file. If your caption source is IMSC in an IMF package, use
      # TrackSourceSettings instead of FileSoureSettings.

      struct FileSourceSettings
        include JSON::Serializable

        # Choose whether to limit the byte rate at which your SCC input captions are inserted into your
        # output. To not limit the caption rate: We recommend that you keep the default value, Disabled.
        # MediaConvert inserts captions in your output according to the byte rates listed in the EIA-608
        # specification, typically 2 or 3 caption bytes per frame depending on your output frame rate. To
        # limit your output caption rate: Choose Enabled. Choose this option if your downstream systems
        # require a maximum of 2 caption bytes per frame. Note that this setting has no effect when your
        # output frame rate is 30 or 60.

        @[JSON::Field(key: "byteRateLimit")]
        getter byte_rate_limit : String?

        # Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If
        # you choose Upconvert, MediaConvert includes the captions data in two ways: it passes the 608 data
        # through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608
        # data into 708.

        @[JSON::Field(key: "convert608To708")]
        getter convert608_to708 : String?

        # Choose the presentation style of your input SCC captions. To use the same presentation style as your
        # input: Keep the default value, Disabled. To convert paint-on captions to pop-on: Choose Enabled. We
        # also recommend that you choose Enabled if you notice additional repeated lines in your output
        # captions.

        @[JSON::Field(key: "convertPaintToPop")]
        getter convert_paint_to_pop : String?

        # Ignore this setting unless your input captions format is SCC. To have the service compensate for
        # differing frame rates between your input captions and input video, specify the frame rate of the
        # captions file. Specify this value as a fraction. For example, you might specify 24 / 1 for 24 fps,
        # 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.

        @[JSON::Field(key: "framerate")]
        getter framerate : Types::CaptionSourceFramerate?

        # External caption file used for loading captions. Accepted file extensions are 'scc', 'ttml', 'dfxp',
        # 'stl', 'srt', 'xml', 'smi', 'webvtt', and 'vtt'.

        @[JSON::Field(key: "sourceFile")]
        getter source_file : String?

        # Optional. Use this setting when you need to adjust the sync between your sidecar captions and your
        # video. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/time-delta-use-cases.html. Enter a positive or
        # negative number to modify the times in the captions file. For example, type 15 to add 15 seconds to
        # all the times in the captions file. Type -5 to subtract 5 seconds from the times in the captions
        # file. You can optionally specify your time delta in milliseconds instead of seconds. When you do so,
        # set the related setting, Time delta units to Milliseconds. Note that, when you specify a time delta
        # for timecode-based caption sources, such as SCC and STL, and your time delta isn't a multiple of the
        # input frame rate, MediaConvert snaps the captions to the nearest frame. For example, when your input
        # video frame rate is 25 fps and you specify 1010ms for time delta, MediaConvert delays your captions
        # by 1000 ms.

        @[JSON::Field(key: "timeDelta")]
        getter time_delta : Int32?

        # When you use the setting Time delta to adjust the sync between your sidecar captions and your video,
        # use this setting to specify the units for the delta that you specify. When you don't specify a value
        # for Time delta units, MediaConvert uses seconds by default.

        @[JSON::Field(key: "timeDeltaUnits")]
        getter time_delta_units : String?

        # Specify whether this set of input captions appears in your outputs in both STL and Teletext format.
        # If you choose Upconvert, MediaConvert includes the captions data in two ways: it passes the STL data
        # through using the Teletext compatibility bytes fields of the Teletext wrapper, and it also
        # translates the STL data into Teletext.

        @[JSON::Field(key: "upconvertSTLToTeletext")]
        getter upconvert_stl_to_teletext : String?

        def initialize(
          @byte_rate_limit : String? = nil,
          @convert608_to708 : String? = nil,
          @convert_paint_to_pop : String? = nil,
          @framerate : Types::CaptionSourceFramerate? = nil,
          @source_file : String? = nil,
          @time_delta : Int32? = nil,
          @time_delta_units : String? = nil,
          @upconvert_stl_to_teletext : String? = nil
        )
        end
      end

      # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value FLAC.

      struct FlacSettings
        include JSON::Serializable

        # Specify Bit depth (BitDepth), in bits per sample, to choose the encoding quality for this audio
        # track.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # Specify the number of channels in this output audio track. Choosing Mono on the console gives you 1
        # output channel; choosing Stereo gives you 2. In the API, valid values are between 1 and 8.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @channels : Int32? = nil,
          @sample_rate : Int32? = nil
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

      # Use Force include renditions to specify one or more resolutions to include your ABR stack. *
      # (Recommended) To optimize automated ABR, specify as few resolutions as possible. * (Required) The
      # number of resolutions that you specify must be equal to, or less than, the Max renditions setting. *
      # If you specify a Min top rendition size rule, specify at least one resolution that is equal to, or
      # greater than, Min top rendition size. * If you specify a Min bottom rendition size rule, only
      # specify resolutions that are equal to, or greater than, Min bottom rendition size. * If you specify
      # a Force include renditions rule, do not specify a separate rule for Allowed renditions. * Note: The
      # ABR stack may include other resolutions that you do not specify here, depending on the Max
      # renditions setting.

      struct ForceIncludeRenditionSize
        include JSON::Serializable

        # Use Height to define the video resolution height, in pixels, for this rule.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Use Width to define the video resolution width, in pixels, for this rule.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @height : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Required when you set Codec to the value FRAME_CAPTURE.

      struct FrameCaptureSettings
        include JSON::Serializable

        # Frame capture will encode the first frame of the output stream, then one frame every
        # framerateDenominator/framerateNumerator seconds. For example, settings of framerateNumerator = 1 and
        # framerateDenominator = 3 (a rate of 1/3 frame per second) will capture the first frame, then 1 frame
        # every 3s. Files will be named as filename.n.jpg where n is the 0-based sequence number of each
        # Capture.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # Frame capture will encode the first frame of the output stream, then one frame every
        # framerateDenominator/framerateNumerator seconds. For example, settings of framerateNumerator = 1 and
        # framerateDenominator = 3 (a rate of 1/3 frame per second) will capture the first frame, then 1 frame
        # every 3s. Files will be named as filename.NNNNNNN.jpg where N is the 0-based frame sequence number
        # zero padded to 7 decimal places.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Maximum number of captures (encoded jpg output files).

        @[JSON::Field(key: "maxCaptures")]
        getter max_captures : Int32?

        # JPEG Quality - a higher value equals higher quality.

        @[JSON::Field(key: "quality")]
        getter quality : Int32?

        def initialize(
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @max_captures : Int32? = nil,
          @quality : Int32? = nil
        )
        end
      end

      # The frame rate of the video or audio track, expressed as a fraction with numerator and denominator
      # values.

      struct FrameRate
        include JSON::Serializable

        # The denominator, or bottom number, in the fractional frame rate. For example, if your frame rate is
        # 24000 / 1001 (23.976 frames per second), then the denominator would be 1001.

        @[JSON::Field(key: "denominator")]
        getter denominator : Int32?

        # The numerator, or top number, in the fractional frame rate. For example, if your frame rate is 24000
        # / 1001 (23.976 frames per second), then the numerator would be 24000.

        @[JSON::Field(key: "numerator")]
        getter numerator : Int32?

        def initialize(
          @denominator : Int32? = nil,
          @numerator : Int32? = nil
        )
        end
      end

      # Query a job by sending a request with the job ID.

      struct GetJobRequest
        include JSON::Serializable

        # the job ID of the job.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Successful get job requests will return an OK message and the job JSON.

      struct GetJobResponse
        include JSON::Serializable

        # Each job converts an input file into an output file or files. For more information, see the User
        # Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # Query a job template by sending a request with the job template name.

      struct GetJobTemplateRequest
        include JSON::Serializable

        # The name of the job template.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Successful get job template requests will return an OK message and the job template JSON.

      struct GetJobTemplateResponse
        include JSON::Serializable

        # A job template is a pre-made set of encoding instructions that you can use to quickly create a job.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : Types::JobTemplate?

        def initialize(
          @job_template : Types::JobTemplate? = nil
        )
        end
      end

      # Retrieve a JSON array of up to twenty of your most recent jobs matched by a jobs query.

      struct GetJobsQueryResultsRequest
        include JSON::Serializable

        # The ID of the jobs query.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # If the jobs query completed successfully, then a JSON array of jobs will be included in this
      # response. To retrieve the twenty next most recent jobs matched by your jobs query, call the
      # StartJobsQuery using the nextToken string returned in this response.

      struct GetJobsQueryResultsResponse
        include JSON::Serializable

        # List of jobs.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::Job)?

        # Use this string to request the next batch of jobs via the StartJobsQuery API.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the jobs query.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @jobs : Array(Types::Job)? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Send a request to retrieve the JSON for your policy.

      struct GetPolicyRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Successful GET policy requests will return the JSON for your policy.

      struct GetPolicyResponse
        include JSON::Serializable

        # A policy configures behavior that you allow or disallow for your account. For information about
        # MediaConvert policies, see the user guide at
        # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end

      # Query a preset by sending a request with the preset name.

      struct GetPresetRequest
        include JSON::Serializable

        # The name of the preset.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Successful get preset requests will return an OK message and the preset JSON.

      struct GetPresetResponse
        include JSON::Serializable

        # A preset is a collection of preconfigured media conversion settings that you want MediaConvert to
        # apply to the output during the conversion process.

        @[JSON::Field(key: "preset")]
        getter preset : Types::Preset?

        def initialize(
          @preset : Types::Preset? = nil
        )
        end
      end

      # Get information about a queue by sending a request with the queue name.

      struct GetQueueRequest
        include JSON::Serializable

        # The name of the queue that you want information about.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Successful get queue requests return an OK message and information about the queue in JSON.

      struct GetQueueResponse
        include JSON::Serializable

        # You can use queues to manage the resources that are available to your AWS account for running
        # multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs
        # through the default queue. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.

        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value GIF

      struct GifSettings
        include JSON::Serializable

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file
        # without the console, use FramerateControl to specify which value the service uses for the frame rate
        # for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from
        # the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the
        # settings FramerateNumerator and FramerateDenominator.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use
        # Drop duplicate (DUPLICATE_DROP) conversion. When you choose Interpolate (INTERPOLATE) instead, the
        # conversion produces smoother motion.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        def initialize(
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil
        )
        end
      end

      # Settings for quality-defined variable bitrate encoding with the H.264 codec. Use these settings only
      # when you set QVBR for Rate control mode.

      struct H264QvbrSettings
        include JSON::Serializable

        # Use this setting only when Rate control mode is QVBR and Quality tuning level is Multi-pass HQ. For
        # Max average bitrate values suited to the complexity of your input video, the service limits the
        # average bitrate of the video part of this output to the value that you choose. That is, the total
        # size of the video element is less than or equal to the value you set multiplied by the number of
        # seconds of encoded output.

        @[JSON::Field(key: "maxAverageBitrate")]
        getter max_average_bitrate : Int32?

        # Use this setting only when you set Rate control mode to QVBR. Specify the target quality level for
        # this output. MediaConvert determines the right number of bits to use for each part of the video to
        # maintain the video quality that you specify. When you keep the default value, AUTO, MediaConvert
        # picks a quality level for you, based on characteristics of your input video. If you prefer to
        # specify a quality level, specify a number from 1 through 10. Use higher numbers for greater quality.
        # Level 10 results in nearly lossless compression. The quality level for most broadcast-quality
        # transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a
        # value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to
        # be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For
        # example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set
        # qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of
        # a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune
        # to .25, your actual QVBR quality level is 7.33.

        @[JSON::Field(key: "qvbrQualityLevelFineTune")]
        getter qvbr_quality_level_fine_tune : Float64?

        def initialize(
          @max_average_bitrate : Int32? = nil,
          @qvbr_quality_level : Int32? = nil,
          @qvbr_quality_level_fine_tune : Float64? = nil
        )
        end
      end

      # Required when you set Codec to the value H_264.

      struct H264Settings
        include JSON::Serializable

        # Keep the default value, Auto, for this setting to have MediaConvert automatically apply the best
        # types of quantization for your video content. When you want to apply your quantization settings
        # manually, you must set H264AdaptiveQuantization to a value other than Auto. Use this setting to
        # specify the strength of any adaptive quantization filters that you enable. If you don't want
        # MediaConvert to do any adaptive quantization in this transcode, set Adaptive quantization to Off.
        # Related settings: The value that you choose here applies to the following settings:
        # H264FlickerAdaptiveQuantization, H264SpatialAdaptiveQuantization, and
        # H264TemporalAdaptiveQuantization.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # The Bandwidth reduction filter increases the video quality of your output relative to its bitrate.
        # Use to lower the bitrate of your constant quality QVBR output, with little or no perceptual decrease
        # in quality. Or, use to increase the video quality of outputs with other rate control modes relative
        # to the bitrate that you specify. Bandwidth reduction increases further when your input is low
        # quality or noisy. Outputs that use this feature incur pro-tier pricing. When you include Bandwidth
        # reduction filter, you cannot include the Noise reducer preprocessor.

        @[JSON::Field(key: "bandwidthReductionFilter")]
        getter bandwidth_reduction_filter : Types::BandwidthReductionFilter?

        # Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs,
        # bitrates must be unique when rounded down to the nearest multiple of 1000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify an H.264 level that is consistent with your output video settings. If you aren't sure what
        # level to specify, choose Auto.

        @[JSON::Field(key: "codecLevel")]
        getter codec_level : String?

        # H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the AVC-I License.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # Specify whether to allow the number of B-frames in your output GOP structure to vary or not
        # depending on your input video content. To improve the subjective video quality of your output that
        # has high-motion content: Leave blank or keep the default value Adaptive. MediaConvert will use fewer
        # B-frames for high-motion video content than low-motion content. The maximum number of B- frames is
        # limited by the value that you choose for B-frames between reference frames. To use the same number
        # B-frames for all types of content: Choose Static.

        @[JSON::Field(key: "dynamicSubGop")]
        getter dynamic_sub_gop : String?

        # Optionally include or suppress markers at the end of your output that signal the end of the video
        # stream. To include end of stream markers: Leave blank or keep the default value, Include. To not
        # include end of stream markers: Choose Suppress. This is useful when your output will be inserted
        # into another stream.

        @[JSON::Field(key: "endOfStreamMarkers")]
        getter end_of_stream_markers : String?

        # Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.

        @[JSON::Field(key: "entropyEncoding")]
        getter entropy_encoding : String?

        # The video encoding method for your MPEG-4 AVC output. Keep the default value, PAFF, to have
        # MediaConvert use PAFF encoding for interlaced outputs. Choose Force field to disable PAFF encoding
        # and create separate interlaced fields. Choose MBAFF to disable PAFF and have MediaConvert use MBAFF
        # encoding for interlaced outputs.

        @[JSON::Field(key: "fieldEncoding")]
        getter field_encoding : String?

        # Only use this setting when you change the default value, AUTO, for the setting
        # H264AdaptiveQuantization. When you keep all defaults, excluding H264AdaptiveQuantization and all
        # other adaptive quantization from your JSON job specification, MediaConvert automatically applies the
        # best types of quantization for your video content. When you set H264AdaptiveQuantization to a value
        # other than AUTO, the default value for H264FlickerAdaptiveQuantization is Disabled. Change this
        # value to Enabled to reduce I-frame pop. I-frame pop appears as a visual flicker that can arise when
        # the encoder saves bits by copying some macroblocks many times from frame to frame, and then
        # refreshes them at the I-frame. When you enable this setting, the encoder updates these macroblocks
        # slightly more often to smooth out the flicker. To manually enable or disable
        # H264FlickerAdaptiveQuantization, you must set Adaptive quantization to a value other than AUTO.

        @[JSON::Field(key: "flickerAdaptiveQuantization")]
        getter flicker_adaptive_quantization : String?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Specify whether to allow B-frames to be referenced by other frame types. To use reference B-frames
        # when your GOP structure has 1 or more B-frames: Leave blank or keep the default value Enabled. We
        # recommend that you choose Enabled to help improve the video quality of your output relative to its
        # bitrate. To not use reference B-frames: Choose Disabled.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Specify the relative frequency of open to closed GOPs in this output. For example, if you want to
        # allow four open GOPs and then require a closed GOP, set this value to 5. We recommend that you have
        # the transcoder automatically choose this value for you based on characteristics of your input video.
        # In the console, do this by keeping the default empty value. If you do explicitly specify a value,
        # for segmented outputs, don't set this value to 0.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Use this setting only when you set GOP mode control to Specified, frames or Specified, seconds.
        # Specify the GOP length using a whole number of frames or a decimal value of seconds. MediaConvert
        # will interpret this value as frames or seconds depending on the value you choose for GOP mode
        # control. If you want to allow MediaConvert to automatically determine GOP size, leave GOP size blank
        # and set GOP mode control to Auto. If your output group specifies HLS, DASH, or CMAF, leave GOP size
        # blank and set GOP mode control to Auto in each output in your output group.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Specify how the transcoder determines GOP size for this output. We recommend that you have the
        # transcoder automatically choose this value for you based on characteristics of your input video. To
        # enable this automatic behavior, choose Auto and and leave GOP size blank. By default, if you don't
        # specify GOP mode control, MediaConvert will use automatic behavior. If your output group specifies
        # HLS, DASH, or CMAF, set GOP mode control to Auto and leave GOP size blank in each output in your
        # output group. To explicitly specify the GOP length, choose Specified, frames or Specified, seconds
        # and then provide the GOP length in the related setting GOP size.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # If your downstream systems have strict buffer requirements: Specify the minimum percentage of the
        # HRD buffer that's available at the end of each encoded video segment. For the best video quality:
        # Set to 0 or leave blank to automatically determine the final buffer fill percentage.

        @[JSON::Field(key: "hrdBufferFinalFillPercentage")]
        getter hrd_buffer_final_fill_percentage : Int32?

        # Percentage of the buffer that should initially be filled (HRD buffer model).

        @[JSON::Field(key: "hrdBufferInitialFillPercentage")]
        getter hrd_buffer_initial_fill_percentage : Int32?

        # Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required
        # when Rate control mode is QVBR.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Specify the minimum number of frames allowed between two IDR-frames in your output. This includes
        # frames created at the start of a GOP or a scene change. Use Min I-Interval to improve video
        # compression by varying GOP size when two IDR-frames would be created near each other. For example,
        # if a regular cadence-driven IDR-frame would fall within 5 frames of a scene-change IDR-frame, and
        # you set Min I-interval to 5, then the encoder would only write an IDR-frame for the scene-change. In
        # this way, one GOP is shortened or extended. If a cadence-driven IDR-frame would be further than 5
        # frames from a scene-change IDR-frame, then the encoder leaves all IDR-frames in place. To use an
        # automatically determined interval: We recommend that you keep this value blank. This allows for
        # MediaConvert to use an optimal setting according to the characteristics of your input video, and
        # results in better video compression. To manually specify an interval: Enter a value from 1 to 30.
        # Use when your downstream systems have specific GOP size requirements. To disable GOP size variance:
        # Enter 0. MediaConvert will only create IDR-frames at the start of your output's cadence-driven GOP.
        # Use when your downstream systems require a regular GOP size.

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # Specify the number of B-frames between reference frames in this output. For the best video quality:
        # Leave blank. MediaConvert automatically determines the number of B-frames to use based on the
        # characteristics of your input video. To manually specify the number of B-frames between reference
        # frames: Enter an integer from 0 to 7.

        @[JSON::Field(key: "numberBFramesBetweenReferenceFrames")]
        getter number_b_frames_between_reference_frames : Int32?

        # Number of reference frames to use. The encoder may use more than requested if using B-frames and/or
        # interlaced encoding.

        @[JSON::Field(key: "numberReferenceFrames")]
        getter number_reference_frames : Int32?

        # Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The
        # default behavior, Follow source, uses the PAR from your input video for your output. To specify a
        # different PAR in the console, choose any value other than Follow source. When you choose SPECIFIED
        # for this setting, you must also specify values for the parNumerator and parDenominator settings.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # The Quality tuning level you choose represents a trade-off between the encoding speed of your job
        # and the output video quality. For the fastest encoding speed at the cost of video quality: Choose
        # Single pass. For a good balance between encoding speed and video quality: Leave blank or keep the
        # default value Single pass HQ. For the best video quality, at the cost of encoding speed: Choose
        # Multi pass HQ. MediaConvert performs an analysis pass on your input followed by an encoding pass.
        # Outputs that use this feature incur pro-tier pricing.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # Settings for quality-defined variable bitrate encoding with the H.265 codec. Use these settings only
        # when you set QVBR for Rate control mode.

        @[JSON::Field(key: "qvbrSettings")]
        getter qvbr_settings : Types::H264QvbrSettings?

        # Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR)
        # or quality-defined variable bitrate (QVBR).

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Places a PPS header on each encoded picture, even if repeated.

        @[JSON::Field(key: "repeatPps")]
        getter repeat_pps : String?

        # Specify whether to apply Saliency aware encoding to your output. Use to improve the perceptual video
        # quality of your output by allocating more encoding bits to the prominent or noticeable parts of your
        # content. To apply saliency aware encoding, when possible: We recommend that you choose Preferred.
        # The effects of Saliency aware encoding are best seen in lower bitrate outputs. When you choose
        # Preferred, note that Saliency aware encoding will only apply to outputs that are 720p or higher in
        # resolution. To not apply saliency aware encoding, prioritizing encoding speed over perceptual video
        # quality: Choose Disabled.

        @[JSON::Field(key: "saliencyAwareEncoding")]
        getter saliency_aware_encoding : String?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Enable this setting to insert I-frames at scene changes that the service automatically detects. This
        # improves video quality and is enabled by default. If this output uses QVBR, choose Transition
        # detection for further video quality improvement. For more information about QVBR, see
        # https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output. When you enable slow PAL, MediaConvert relabels the video frames
        # to 25 fps and resamples your audio to keep it synchronized with the video. Note that enabling this
        # setting will slightly reduce the duration of your video. Required settings: You must also set
        # Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # Ignore this setting unless you need to comply with a specification that requires a specific value.
        # If you don't have a specification requirement, we recommend that you adjust the softness of your
        # output by using a lower value for the setting Sharpness or by enabling a noise reducer filter. The
        # Softness setting specifies the quantization matrices that the encoder uses. Keep the default value,
        # 0, for flat quantization. Choose the value 1 or 16 to use the default JVT softening quantization
        # matricies from the H.264 specification. Choose a value from 17 to 128 to use planar interpolation.
        # Increasing values from 17 to 128 result in increasing reduction of high-frequency data. The value
        # 128 results in the softest video.

        @[JSON::Field(key: "softness")]
        getter softness : Int32?

        # Only use this setting when you change the default value, Auto, for the setting
        # H264AdaptiveQuantization. When you keep all defaults, excluding H264AdaptiveQuantization and all
        # other adaptive quantization from your JSON job specification, MediaConvert automatically applies the
        # best types of quantization for your video content. When you set H264AdaptiveQuantization to a value
        # other than AUTO, the default value for H264SpatialAdaptiveQuantization is Enabled. Keep this default
        # value to adjust quantization within each frame based on spatial variation of content complexity.
        # When you enable this feature, the encoder uses fewer bits on areas that can sustain more distortion
        # with no noticeable visual degradation and uses more bits on areas where any small distortion will be
        # noticeable. For example, complex textured blocks are encoded with fewer bits and smooth textured
        # blocks are encoded with more bits. Enabling this feature will almost always improve your video
        # quality. Note, though, that this feature doesn't take into account where the viewer's attention is
        # likely to be. If viewers are likely to be focusing their attention on a part of the screen with a
        # lot of complex texture, you might choose to set H264SpatialAdaptiveQuantization to Disabled. Related
        # setting: When you enable spatial adaptive quantization, set the value for Adaptive quantization
        # depending on your content. For homogeneous content, such as cartoons and video games, set it to Low.
        # For content with a wider variety of textures, set it to High or Higher. To manually enable or
        # disable H264SpatialAdaptiveQuantization, you must set Adaptive quantization to a value other than
        # AUTO.

        @[JSON::Field(key: "spatialAdaptiveQuantization")]
        getter spatial_adaptive_quantization : String?

        # Produces a bitstream compliant with SMPTE RP-2027.

        @[JSON::Field(key: "syntax")]
        getter syntax : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard or soft telecine to create a smoother
        # picture. Hard telecine produces a 29.97i output. Soft telecine produces an output with a 23.976
        # output that signals to the video player device to do the conversion during play back. When you keep
        # the default value, None, MediaConvert does a standard frame rate conversion to 29.97 without doing
        # anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        # Only use this setting when you change the default value, AUTO, for the setting
        # H264AdaptiveQuantization. When you keep all defaults, excluding H264AdaptiveQuantization and all
        # other adaptive quantization from your JSON job specification, MediaConvert automatically applies the
        # best types of quantization for your video content. When you set H264AdaptiveQuantization to a value
        # other than AUTO, the default value for H264TemporalAdaptiveQuantization is Enabled. Keep this
        # default value to adjust quantization within each frame based on temporal variation of content
        # complexity. When you enable this feature, the encoder uses fewer bits on areas of the frame that
        # aren't moving and uses more bits on complex objects with sharp edges that move a lot. For example,
        # this feature improves the readability of text tickers on newscasts and scoreboards on sports
        # matches. Enabling this feature will almost always improve your video quality. Note, though, that
        # this feature doesn't take into account where the viewer's attention is likely to be. If viewers are
        # likely to be focusing their attention on a part of the screen that doesn't have moving objects with
        # sharp edges, such as sports athletes' faces, you might choose to set
        # H264TemporalAdaptiveQuantization to Disabled. Related setting: When you enable temporal
        # quantization, adjust the strength of the filter with the setting Adaptive quantization. To manually
        # enable or disable H264TemporalAdaptiveQuantization, you must set Adaptive quantization to a value
        # other than AUTO.

        @[JSON::Field(key: "temporalAdaptiveQuantization")]
        getter temporal_adaptive_quantization : String?

        # Inserts timecode for each frame as 4 bytes of an unregistered SEI message.

        @[JSON::Field(key: "unregisteredSeiTimecode")]
        getter unregistered_sei_timecode : String?

        # Specify how SPS and PPS NAL units are written in your output MP4 container, according to ISO/IEC
        # 14496-15. If the location of these parameters doesn't matter in your workflow: Keep the default
        # value, AVC1. MediaConvert writes SPS and PPS NAL units in the sample description ('stsd') box (but
        # not into samples directly). To write SPS and PPS NAL units directly into samples (but not in the
        # 'stsd' box): Choose AVC3. When you do, note that your output might not play properly with some
        # downstream systems or players.

        @[JSON::Field(key: "writeMp4PackagingType")]
        getter write_mp4_packaging_type : String?

        def initialize(
          @adaptive_quantization : String? = nil,
          @bandwidth_reduction_filter : Types::BandwidthReductionFilter? = nil,
          @bitrate : Int32? = nil,
          @codec_level : String? = nil,
          @codec_profile : String? = nil,
          @dynamic_sub_gop : String? = nil,
          @end_of_stream_markers : String? = nil,
          @entropy_encoding : String? = nil,
          @field_encoding : String? = nil,
          @flicker_adaptive_quantization : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @hrd_buffer_final_fill_percentage : Int32? = nil,
          @hrd_buffer_initial_fill_percentage : Int32? = nil,
          @hrd_buffer_size : Int32? = nil,
          @interlace_mode : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @number_b_frames_between_reference_frames : Int32? = nil,
          @number_reference_frames : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @quality_tuning_level : String? = nil,
          @qvbr_settings : Types::H264QvbrSettings? = nil,
          @rate_control_mode : String? = nil,
          @repeat_pps : String? = nil,
          @saliency_aware_encoding : String? = nil,
          @scan_type_conversion_mode : String? = nil,
          @scene_change_detect : String? = nil,
          @slices : Int32? = nil,
          @slow_pal : String? = nil,
          @softness : Int32? = nil,
          @spatial_adaptive_quantization : String? = nil,
          @syntax : String? = nil,
          @telecine : String? = nil,
          @temporal_adaptive_quantization : String? = nil,
          @unregistered_sei_timecode : String? = nil,
          @write_mp4_packaging_type : String? = nil
        )
        end
      end

      # Settings for quality-defined variable bitrate encoding with the H.265 codec. Use these settings only
      # when you set QVBR for Rate control mode.

      struct H265QvbrSettings
        include JSON::Serializable

        # Use this setting only when Rate control mode is QVBR and Quality tuning level is Multi-pass HQ. For
        # Max average bitrate values suited to the complexity of your input video, the service limits the
        # average bitrate of the video part of this output to the value that you choose. That is, the total
        # size of the video element is less than or equal to the value you set multiplied by the number of
        # seconds of encoded output.

        @[JSON::Field(key: "maxAverageBitrate")]
        getter max_average_bitrate : Int32?

        # Use this setting only when you set Rate control mode to QVBR. Specify the target quality level for
        # this output. MediaConvert determines the right number of bits to use for each part of the video to
        # maintain the video quality that you specify. When you keep the default value, AUTO, MediaConvert
        # picks a quality level for you, based on characteristics of your input video. If you prefer to
        # specify a quality level, specify a number from 1 through 10. Use higher numbers for greater quality.
        # Level 10 results in nearly lossless compression. The quality level for most broadcast-quality
        # transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a
        # value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to
        # be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.

        @[JSON::Field(key: "qvbrQualityLevel")]
        getter qvbr_quality_level : Int32?

        # Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For
        # example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set
        # qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of
        # a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune
        # to .25, your actual QVBR quality level is 7.33.

        @[JSON::Field(key: "qvbrQualityLevelFineTune")]
        getter qvbr_quality_level_fine_tune : Float64?

        def initialize(
          @max_average_bitrate : Int32? = nil,
          @qvbr_quality_level : Int32? = nil,
          @qvbr_quality_level_fine_tune : Float64? = nil
        )
        end
      end

      # Settings for H265 codec

      struct H265Settings
        include JSON::Serializable

        # When you set Adaptive Quantization to Auto, or leave blank, MediaConvert automatically applies
        # quantization to improve the video quality of your output. Set Adaptive Quantization to Low, Medium,
        # High, Higher, or Max to manually control the strength of the quantization filter. When you do, you
        # can specify a value for Spatial Adaptive Quantization, Temporal Adaptive Quantization, and Flicker
        # Adaptive Quantization, to further control the quantization filter. Set Adaptive Quantization to Off
        # to apply no quantization to your output.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Enables Alternate Transfer Function SEI message for outputs using Hybrid Log Gamma (HLG)
        # Electro-Optical Transfer Function (EOTF).

        @[JSON::Field(key: "alternateTransferFunctionSei")]
        getter alternate_transfer_function_sei : String?

        # The Bandwidth reduction filter increases the video quality of your output relative to its bitrate.
        # Use to lower the bitrate of your constant quality QVBR output, with little or no perceptual decrease
        # in quality. Or, use to increase the video quality of outputs with other rate control modes relative
        # to the bitrate that you specify. Bandwidth reduction increases further when your input is low
        # quality or noisy. Outputs that use this feature incur pro-tier pricing. When you include Bandwidth
        # reduction filter, you cannot include the Noise reducer preprocessor.

        @[JSON::Field(key: "bandwidthReductionFilter")]
        getter bandwidth_reduction_filter : Types::BandwidthReductionFilter?

        # Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs,
        # bitrates must be unique when rounded down to the nearest multiple of 1000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # H.265 Level.

        @[JSON::Field(key: "codecLevel")]
        getter codec_level : String?

        # Represents the Profile and Tier, per the HEVC (H.265) specification. Selections are grouped as
        # [Profile] / [Tier], so "Main/High" represents Main Profile with High Tier. 4:2:2 profiles are only
        # available with the HEVC 4:2:2 License.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # Use Deblocking to improve the video quality of your output by smoothing the edges of macroblock
        # artifacts created during video compression. To reduce blocking artifacts at block boundaries, and
        # improve overall video quality: Keep the default value, Enabled. To not apply any deblocking: Choose
        # Disabled. Visible block edge artifacts might appear in the output, especially at lower bitrates.

        @[JSON::Field(key: "deblocking")]
        getter deblocking : String?

        # Specify whether to allow the number of B-frames in your output GOP structure to vary or not
        # depending on your input video content. To improve the subjective video quality of your output that
        # has high-motion content: Leave blank or keep the default value Adaptive. MediaConvert will use fewer
        # B-frames for high-motion video content than low-motion content. The maximum number of B- frames is
        # limited by the value that you choose for B-frames between reference frames. To use the same number
        # B-frames for all types of content: Choose Static.

        @[JSON::Field(key: "dynamicSubGop")]
        getter dynamic_sub_gop : String?

        # Optionally include or suppress markers at the end of your output that signal the end of the video
        # stream. To include end of stream markers: Leave blank or keep the default value, Include. To not
        # include end of stream markers: Choose Suppress. This is useful when your output will be inserted
        # into another stream.

        @[JSON::Field(key: "endOfStreamMarkers")]
        getter end_of_stream_markers : String?

        # Enable this setting to have the encoder reduce I-frame pop. I-frame pop appears as a visual flicker
        # that can arise when the encoder saves bits by copying some macroblocks many times from frame to
        # frame, and then refreshes them at the I-frame. When you enable this setting, the encoder updates
        # these macroblocks slightly more often to smooth out the flicker. This setting is disabled by
        # default. Related setting: In addition to enabling this setting, you must also set
        # adaptiveQuantization to a value other than Off.

        @[JSON::Field(key: "flickerAdaptiveQuantization")]
        getter flicker_adaptive_quantization : String?

        # Use the Framerate setting to specify the frame rate for this output. If you want to keep the same
        # frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose
        # a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are
        # decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Specify whether to allow B-frames to be referenced by other frame types. To use reference B-frames
        # when your GOP structure has 1 or more B-frames: Leave blank or keep the default value Enabled. We
        # recommend that you choose Enabled to help improve the video quality of your output relative to its
        # bitrate. To not use reference B-frames: Choose Disabled.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Specify the relative frequency of open to closed GOPs in this output. For example, if you want to
        # allow four open GOPs and then require a closed GOP, set this value to 5. We recommend that you have
        # the transcoder automatically choose this value for you based on characteristics of your input video.
        # To enable this automatic behavior, do this by keeping the default empty value. If you do explicitly
        # specify a value, for segmented outputs, don't set this value to 0.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Use this setting only when you set GOP mode control to Specified, frames or Specified, seconds.
        # Specify the GOP length using a whole number of frames or a decimal value of seconds. MediaConvert
        # will interpret this value as frames or seconds depending on the value you choose for GOP mode
        # control. If you want to allow MediaConvert to automatically determine GOP size, leave GOP size blank
        # and set GOP mode control to Auto. If your output group specifies HLS, DASH, or CMAF, leave GOP size
        # blank and set GOP mode control to Auto in each output in your output group.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Specify how the transcoder determines GOP size for this output. We recommend that you have the
        # transcoder automatically choose this value for you based on characteristics of your input video. To
        # enable this automatic behavior, choose Auto and and leave GOP size blank. By default, if you don't
        # specify GOP mode control, MediaConvert will use automatic behavior. If your output group specifies
        # HLS, DASH, or CMAF, set GOP mode control to Auto and leave GOP size blank in each output in your
        # output group. To explicitly specify the GOP length, choose Specified, frames or Specified, seconds
        # and then provide the GOP length in the related setting GOP size.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # If your downstream systems have strict buffer requirements: Specify the minimum percentage of the
        # HRD buffer that's available at the end of each encoded video segment. For the best video quality:
        # Set to 0 or leave blank to automatically determine the final buffer fill percentage.

        @[JSON::Field(key: "hrdBufferFinalFillPercentage")]
        getter hrd_buffer_final_fill_percentage : Int32?

        # Percentage of the buffer that should initially be filled (HRD buffer model).

        @[JSON::Field(key: "hrdBufferInitialFillPercentage")]
        getter hrd_buffer_initial_fill_percentage : Int32?

        # Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required
        # when Rate control mode is QVBR.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Specify the minimum number of frames allowed between two IDR-frames in your output. This includes
        # frames created at the start of a GOP or a scene change. Use Min I-Interval to improve video
        # compression by varying GOP size when two IDR-frames would be created near each other. For example,
        # if a regular cadence-driven IDR-frame would fall within 5 frames of a scene-change IDR-frame, and
        # you set Min I-interval to 5, then the encoder would only write an IDR-frame for the scene-change. In
        # this way, one GOP is shortened or extended. If a cadence-driven IDR-frame would be further than 5
        # frames from a scene-change IDR-frame, then the encoder leaves all IDR-frames in place. To use an
        # automatically determined interval: We recommend that you keep this value blank. This allows for
        # MediaConvert to use an optimal setting according to the characteristics of your input video, and
        # results in better video compression. To manually specify an interval: Enter a value from 1 to 30.
        # Use when your downstream systems have specific GOP size requirements. To disable GOP size variance:
        # Enter 0. MediaConvert will only create IDR-frames at the start of your output's cadence-driven GOP.
        # Use when your downstream systems require a regular GOP size.

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # If you are setting up the picture as a tile, you must set this to "disabled". In all other
        # configurations, you typically enter "enabled".

        @[JSON::Field(key: "mvOverPictureBoundaries")]
        getter mv_over_picture_boundaries : String?

        # If you are setting up the picture as a tile, you must set this to "disabled". In other
        # configurations, you typically enter "enabled".

        @[JSON::Field(key: "mvTemporalPredictor")]
        getter mv_temporal_predictor : String?

        # Specify the number of B-frames between reference frames in this output. For the best video quality:
        # Leave blank. MediaConvert automatically determines the number of B-frames to use based on the
        # characteristics of your input video. To manually specify the number of B-frames between reference
        # frames: Enter an integer from 0 to 7.

        @[JSON::Field(key: "numberBFramesBetweenReferenceFrames")]
        getter number_b_frames_between_reference_frames : Int32?

        # Number of reference frames to use. The encoder may use more than requested if using B-frames and/or
        # interlaced encoding.

        @[JSON::Field(key: "numberReferenceFrames")]
        getter number_reference_frames : Int32?

        # Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The
        # default behavior, Follow source, uses the PAR from your input video for your output. To specify a
        # different PAR, choose any value other than Follow source. When you choose SPECIFIED for this
        # setting, you must also specify values for the parNumerator and parDenominator settings.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, single-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # Settings for quality-defined variable bitrate encoding with the H.265 codec. Use these settings only
        # when you set QVBR for Rate control mode.

        @[JSON::Field(key: "qvbrSettings")]
        getter qvbr_settings : Types::H265QvbrSettings?

        # Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR)
        # or quality-defined variable bitrate (QVBR).

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Specify Sample Adaptive Offset (SAO) filter strength. Adaptive mode dynamically selects best
        # strength based on content

        @[JSON::Field(key: "sampleAdaptiveOffsetFilterMode")]
        getter sample_adaptive_offset_filter_mode : String?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Enable this setting to insert I-frames at scene changes that the service automatically detects. This
        # improves video quality and is enabled by default. If this output uses QVBR, choose Transition
        # detection for further video quality improvement. For more information about QVBR, see
        # https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output. When you enable slow PAL, MediaConvert relabels the video frames
        # to 25 fps and resamples your audio to keep it synchronized with the video. Note that enabling this
        # setting will slightly reduce the duration of your video. Required settings: You must also set
        # Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # Keep the default value, Enabled, to adjust quantization within each frame based on spatial variation
        # of content complexity. When you enable this feature, the encoder uses fewer bits on areas that can
        # sustain more distortion with no noticeable visual degradation and uses more bits on areas where any
        # small distortion will be noticeable. For example, complex textured blocks are encoded with fewer
        # bits and smooth textured blocks are encoded with more bits. Enabling this feature will almost always
        # improve your video quality. Note, though, that this feature doesn't take into account where the
        # viewer's attention is likely to be. If viewers are likely to be focusing their attention on a part
        # of the screen with a lot of complex texture, you might choose to disable this feature. Related
        # setting: When you enable spatial adaptive quantization, set the value for Adaptive quantization
        # depending on your content. For homogeneous content, such as cartoons and video games, set it to Low.
        # For content with a wider variety of textures, set it to High or Higher.

        @[JSON::Field(key: "spatialAdaptiveQuantization")]
        getter spatial_adaptive_quantization : String?

        # This field applies only if the Streams > Advanced > Framerate field is set to 29.970. This field
        # works with the Streams > Advanced > Preprocessors > Deinterlacer field and the Streams > Advanced >
        # Interlaced Mode field to identify the scan type for the output: Progressive, Interlaced, Hard
        # Telecine or Soft Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft: produces
        # 23.976; the player converts this output to 29.97i.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        # Keep the default value, Enabled, to adjust quantization within each frame based on temporal
        # variation of content complexity. When you enable this feature, the encoder uses fewer bits on areas
        # of the frame that aren't moving and uses more bits on complex objects with sharp edges that move a
        # lot. For example, this feature improves the readability of text tickers on newscasts and scoreboards
        # on sports matches. Enabling this feature will almost always improve your video quality. Note,
        # though, that this feature doesn't take into account where the viewer's attention is likely to be. If
        # viewers are likely to be focusing their attention on a part of the screen that doesn't have moving
        # objects with sharp edges, such as sports athletes' faces, you might choose to disable this feature.
        # Related setting: When you enable temporal quantization, adjust the strength of the filter with the
        # setting Adaptive quantization.

        @[JSON::Field(key: "temporalAdaptiveQuantization")]
        getter temporal_adaptive_quantization : String?

        # Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers are supported depending
        # on GOP structure: I- and P-frames form one layer, reference B-frames can form a second layer and
        # non-reference b-frames can form a third layer. Decoders can optionally decode only the lower
        # temporal layers to generate a lower frame rate output. For example, given a bitstream with temporal
        # IDs and with b-frames = 1 (i.e. IbPbPb display order), a decoder could decode all the frames for
        # full frame rate output or only the I and P frames (lowest temporal layer) for a half frame rate
        # output.

        @[JSON::Field(key: "temporalIds")]
        getter temporal_ids : String?

        # Set this field to set up the picture as a tile. You must also set TileWidth. The tile height must
        # result in 22 or fewer rows in the frame. The tile width must result in 20 or fewer columns in the
        # frame. And finally, the product of the column count and row count must be 64 or less. If the tile
        # width and height are specified, MediaConvert will override the video codec slices field with a value
        # that MediaConvert calculates.

        @[JSON::Field(key: "tileHeight")]
        getter tile_height : Int32?

        # Set to "padded" to force MediaConvert to add padding to the frame, to obtain a frame that is a whole
        # multiple of the tile size. If you are setting up the picture as a tile, you must enter "padded". In
        # all other configurations, you typically enter "none".

        @[JSON::Field(key: "tilePadding")]
        getter tile_padding : String?

        # Set this field to set up the picture as a tile. See TileHeight for more information.

        @[JSON::Field(key: "tileWidth")]
        getter tile_width : Int32?

        # Enable use of tiles, allowing horizontal as well as vertical subdivision of the encoded pictures.

        @[JSON::Field(key: "tiles")]
        getter tiles : String?

        # Select the tree block size used for encoding. If you enter "auto", the encoder will pick the best
        # size. If you are setting up the picture as a tile, you must set this to 32x32. In all other
        # configurations, you typically enter "auto".

        @[JSON::Field(key: "treeBlockSize")]
        getter tree_block_size : String?

        # Inserts timecode for each frame as 4 bytes of an unregistered SEI message.

        @[JSON::Field(key: "unregisteredSeiTimecode")]
        getter unregistered_sei_timecode : String?

        # If the location of parameter set NAL units doesn't matter in your workflow, ignore this setting. Use
        # this setting only with CMAF or DASH outputs, or with standalone file outputs in an MPEG-4 container
        # (MP4 outputs). Choose HVC1 to mark your output as HVC1. This makes your output compliant with the
        # following specification: ISO IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15 3rd Edition. For these
        # outputs, the service stores parameter set NAL units in the sample headers but not in the samples
        # directly. For MP4 outputs, when you choose HVC1, your output video might not work properly with some
        # downstream systems and video players. The service defaults to marking your output as HEV1. For these
        # outputs, the service writes parameter set NAL units directly into the samples.

        @[JSON::Field(key: "writeMp4PackagingType")]
        getter write_mp4_packaging_type : String?

        def initialize(
          @adaptive_quantization : String? = nil,
          @alternate_transfer_function_sei : String? = nil,
          @bandwidth_reduction_filter : Types::BandwidthReductionFilter? = nil,
          @bitrate : Int32? = nil,
          @codec_level : String? = nil,
          @codec_profile : String? = nil,
          @deblocking : String? = nil,
          @dynamic_sub_gop : String? = nil,
          @end_of_stream_markers : String? = nil,
          @flicker_adaptive_quantization : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @hrd_buffer_final_fill_percentage : Int32? = nil,
          @hrd_buffer_initial_fill_percentage : Int32? = nil,
          @hrd_buffer_size : Int32? = nil,
          @interlace_mode : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @mv_over_picture_boundaries : String? = nil,
          @mv_temporal_predictor : String? = nil,
          @number_b_frames_between_reference_frames : Int32? = nil,
          @number_reference_frames : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @quality_tuning_level : String? = nil,
          @qvbr_settings : Types::H265QvbrSettings? = nil,
          @rate_control_mode : String? = nil,
          @sample_adaptive_offset_filter_mode : String? = nil,
          @scan_type_conversion_mode : String? = nil,
          @scene_change_detect : String? = nil,
          @slices : Int32? = nil,
          @slow_pal : String? = nil,
          @spatial_adaptive_quantization : String? = nil,
          @telecine : String? = nil,
          @temporal_adaptive_quantization : String? = nil,
          @temporal_ids : String? = nil,
          @tile_height : Int32? = nil,
          @tile_padding : String? = nil,
          @tile_width : Int32? = nil,
          @tiles : String? = nil,
          @tree_block_size : String? = nil,
          @unregistered_sei_timecode : String? = nil,
          @write_mp4_packaging_type : String? = nil
        )
        end
      end

      # Use these settings to specify static color calibration metadata, as defined by SMPTE ST 2086. These
      # values don't affect the pixel values that are encoded in the video stream. They are intended to help
      # the downstream video player display content in a way that reflects the intentions of the the content
      # creator.

      struct Hdr10Metadata
        include JSON::Serializable

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "bluePrimaryX")]
        getter blue_primary_x : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "bluePrimaryY")]
        getter blue_primary_y : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "greenPrimaryX")]
        getter green_primary_x : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "greenPrimaryY")]
        getter green_primary_y : Int32?

        # Maximum light level among all samples in the coded video sequence, in units of candelas per square
        # meter. This setting doesn't have a default value; you must specify a value that is suitable for the
        # content.

        @[JSON::Field(key: "maxContentLightLevel")]
        getter max_content_light_level : Int32?

        # Maximum average light level of any frame in the coded video sequence, in units of candelas per
        # square meter. This setting doesn't have a default value; you must specify a value that is suitable
        # for the content.

        @[JSON::Field(key: "maxFrameAverageLightLevel")]
        getter max_frame_average_light_level : Int32?

        # Nominal maximum mastering display luminance in units of of 0.0001 candelas per square meter.

        @[JSON::Field(key: "maxLuminance")]
        getter max_luminance : Int32?

        # Nominal minimum mastering display luminance in units of of 0.0001 candelas per square meter

        @[JSON::Field(key: "minLuminance")]
        getter min_luminance : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "redPrimaryX")]
        getter red_primary_x : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "redPrimaryY")]
        getter red_primary_y : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "whitePointX")]
        getter white_point_x : Int32?

        # HDR Master Display Information must be provided by a color grader, using color grading tools. Range
        # is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this
        # setting is not for color correction.

        @[JSON::Field(key: "whitePointY")]
        getter white_point_y : Int32?

        def initialize(
          @blue_primary_x : Int32? = nil,
          @blue_primary_y : Int32? = nil,
          @green_primary_x : Int32? = nil,
          @green_primary_y : Int32? = nil,
          @max_content_light_level : Int32? = nil,
          @max_frame_average_light_level : Int32? = nil,
          @max_luminance : Int32? = nil,
          @min_luminance : Int32? = nil,
          @red_primary_x : Int32? = nil,
          @red_primary_y : Int32? = nil,
          @white_point_x : Int32? = nil,
          @white_point_y : Int32? = nil
        )
        end
      end

      # Setting for HDR10+ metadata insertion

      struct Hdr10Plus
        include JSON::Serializable

        # Specify the HDR10+ mastering display normalized peak luminance, in nits. This is the normalized
        # actual peak luminance of the mastering display, as defined by ST 2094-40.

        @[JSON::Field(key: "masteringMonitorNits")]
        getter mastering_monitor_nits : Int32?

        # Specify the HDR10+ target display nominal peak luminance, in nits. This is the nominal maximum
        # luminance of the target display as defined by ST 2094-40.

        @[JSON::Field(key: "targetMonitorNits")]
        getter target_monitor_nits : Int32?

        def initialize(
          @mastering_monitor_nits : Int32? = nil,
          @target_monitor_nits : Int32? = nil
        )
        end
      end

      # Specify the details for each additional HLS manifest that you want the service to generate for this
      # output group. Each manifest can reference a different subset of outputs in the group.

      struct HlsAdditionalManifest
        include JSON::Serializable

        # Specify a name modifier that the service adds to the name of this manifest to make it different from
        # the file names of the other main manifests in the output group. For example, say that the default
        # main manifest for your HLS group is film-name.m3u8. If you enter "-no-premium" for this setting,
        # then the file name the service generates for this top-level manifest is film-name-no-premium.m3u8.
        # For HLS output groups, specify a manifestNameModifier that is different from the nameModifier of the
        # output. The service uses the output name modifier to create unique names for the individual variant
        # manifests.

        @[JSON::Field(key: "manifestNameModifier")]
        getter manifest_name_modifier : String?

        # Specify the outputs that you want this additional top-level manifest to reference.

        @[JSON::Field(key: "selectedOutputs")]
        getter selected_outputs : Array(String)?

        def initialize(
          @manifest_name_modifier : String? = nil,
          @selected_outputs : Array(String)? = nil
        )
        end
      end

      # Caption Language Mapping

      struct HlsCaptionLanguageMapping
        include JSON::Serializable

        # Caption channel.

        @[JSON::Field(key: "captionChannel")]
        getter caption_channel : Int32?

        # Specify the language, using an ISO 639-2 three-letter code in all capital letters. You can find a
        # list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "customLanguageCode")]
        getter custom_language_code : String?

        # Specify the language, using an ISO 639-2 three-letter code in all capital letters. You can find a
        # list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "languageCode")]
        getter language_code : String?

        # Caption language description.

        @[JSON::Field(key: "languageDescription")]
        getter language_description : String?

        def initialize(
          @caption_channel : Int32? = nil,
          @custom_language_code : String? = nil,
          @language_code : String? = nil,
          @language_description : String? = nil
        )
        end
      end

      # Settings for HLS encryption

      struct HlsEncryptionSettings
        include JSON::Serializable

        # This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is
        # not set then the Initialization Vector will follow the segment number by default.

        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        # Encrypts the segments with the given encryption scheme. Leave blank to disable. Selecting 'Disabled'
        # in the web interface also disables encryption.

        @[JSON::Field(key: "encryptionMethod")]
        getter encryption_method : String?

        # The Initialization Vector is a 128-bit number used in conjunction with the key for encrypting
        # blocks. If set to INCLUDE, Initialization Vector is listed in the manifest. Otherwise Initialization
        # Vector is not in the manifest.

        @[JSON::Field(key: "initializationVectorInManifest")]
        getter initialization_vector_in_manifest : String?

        # Enable this setting to insert the EXT-X-SESSION-KEY element into the master playlist. This allows
        # for offline Apple HLS FairPlay content protection.

        @[JSON::Field(key: "offlineEncrypted")]
        getter offline_encrypted : String?

        # If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM
        # encryption with a SPEKE-compliant key provider. If your output group type is CMAF, use the
        # SpekeKeyProviderCmaf settings instead.

        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider?

        # Use these settings to set up encryption with a static key provider.

        @[JSON::Field(key: "staticKeyProvider")]
        getter static_key_provider : Types::StaticKeyProvider?

        # Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE
        # standard. For more information about SPEKE, see
        # https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @constant_initialization_vector : String? = nil,
          @encryption_method : String? = nil,
          @initialization_vector_in_manifest : String? = nil,
          @offline_encrypted : String? = nil,
          @speke_key_provider : Types::SpekeKeyProvider? = nil,
          @static_key_provider : Types::StaticKeyProvider? = nil,
          @type : String? = nil
        )
        end
      end

      # Settings related to your HLS output package. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

      struct HlsGroupSettings
        include JSON::Serializable

        # Choose one or more ad marker types to decorate your Apple HLS manifest. This setting does not
        # determine whether SCTE-35 markers appear in the outputs themselves.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : Array(String)?

        # By default, the service creates one top-level .m3u8 HLS manifest for each HLS output group in your
        # job. This default manifest references every output in the output group. To create additional
        # top-level manifests that reference a subset of the outputs in the output group, specify a list of
        # them here.

        @[JSON::Field(key: "additionalManifests")]
        getter additional_manifests : Array(Types::HlsAdditionalManifest)?

        # Ignore this setting unless you are using FairPlay DRM with Verimatrix and you encounter playback
        # issues. Keep the default value, Include, to output audio-only headers. Choose Exclude to remove the
        # audio-only headers from your audio segments.

        @[JSON::Field(key: "audioOnlyHeader")]
        getter audio_only_header : String?

        # A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if
        # base manifest is delivered from a different URL than the main .m3u8 file.

        @[JSON::Field(key: "baseUrl")]
        getter base_url : String?

        # Language to be used on Caption outputs

        @[JSON::Field(key: "captionLanguageMappings")]
        getter caption_language_mappings : Array(Types::HlsCaptionLanguageMapping)?

        # Applies only to 608 Embedded output captions. Insert: Include CLOSED-CAPTIONS lines in the manifest.
        # Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for
        # each Language Code you specify. Make sure to specify the languages in the order in which they appear
        # in the original source (if the source is embedded format) or the order of the caption selectors (if
        # the source is other than embedded). Otherwise, languages in the manifest will not match up properly
        # with the output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest. Omit: Omit any
        # CLOSED-CAPTIONS line from the manifest.

        @[JSON::Field(key: "captionLanguageSetting")]
        getter caption_language_setting : String?

        # Set Caption segment length control to Match video to create caption segments that align with the
        # video segments from the first video output in this output group. For example, if the video segments
        # are 2 seconds long, your WebVTT segments will also be 2 seconds long. Keep the default setting,
        # Large segments to create caption segments that are 300 seconds long.

        @[JSON::Field(key: "captionSegmentLengthControl")]
        getter caption_segment_length_control : String?

        # Disable this setting only when your workflow requires the #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep
        # the default value Enabled and control caching in your video distribution set up. For example, use
        # the Cache-Control http header.

        @[JSON::Field(key: "clientCache")]
        getter client_cache : String?

        # Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.

        @[JSON::Field(key: "codecSpecification")]
        getter codec_specification : String?

        # Use Destination to specify the S3 output location and the output filename base. Destination accepts
        # format identifiers. If you do not specify the base filename in the URI, the service will use the
        # filename of the input file. If your job has multiple inputs, the service uses the filename of the
        # first input file.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # Settings associated with the destination. Will vary based on the type of destination

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::DestinationSettings?

        # Indicates whether segments should be placed in subdirectories.

        @[JSON::Field(key: "directoryStructure")]
        getter directory_structure : String?

        # DRM settings.

        @[JSON::Field(key: "encryption")]
        getter encryption : Types::HlsEncryptionSettings?

        # Specify whether MediaConvert generates images for trick play. Keep the default value, None, to not
        # generate any images. Choose Thumbnail to generate tiled thumbnails. Choose Thumbnail and full frame
        # to generate tiled thumbnails and full-resolution images of single frames. MediaConvert creates a
        # child manifest for each set of images that you generate and adds corresponding entries to the parent
        # manifest. A common application for these images is Roku trick mode. The thumbnails and full-frame
        # images that MediaConvert creates with this feature are compatible with this Roku specification:
        # https://developer.roku.com/docs/developer-program/media-playback/trick-mode/hls-and-dash.md

        @[JSON::Field(key: "imageBasedTrickPlay")]
        getter image_based_trick_play : String?

        # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

        @[JSON::Field(key: "imageBasedTrickPlaySettings")]
        getter image_based_trick_play_settings : Types::HlsImageBasedTrickPlaySettings?

        # When set to GZIP, compresses HLS playlist.

        @[JSON::Field(key: "manifestCompression")]
        getter manifest_compression : String?

        # Indicates whether the output manifest should use floating point values for segment duration.

        @[JSON::Field(key: "manifestDurationFormat")]
        getter manifest_duration_format : String?

        # Keep this setting at the default value of 0, unless you are troubleshooting a problem with how
        # devices play back the end of your video asset. If you know that player devices are hanging on the
        # final segment of your video because the length of your final segment is too short, use this setting
        # to specify a minimum final segment length, in seconds. Choose a value that is greater than or equal
        # to 1 and less than your segment length. When you specify a value for this setting, the encoder will
        # combine any final segment that is shorter than the length that you specify with the previous
        # segment. For example, your segment length is 3 seconds and your final segment is .5 seconds without
        # a minimum final segment length; when you set the minimum final segment length to 1, your final
        # segment is 3.5 seconds.

        @[JSON::Field(key: "minFinalSegmentLength")]
        getter min_final_segment_length : Float64?

        # When set, Minimum Segment Size is enforced by looking ahead and back within the specified range for
        # a nearby avail and extending the segment size if needed.

        @[JSON::Field(key: "minSegmentLength")]
        getter min_segment_length : Int32?

        # Indicates whether the .m3u8 manifest file should be generated for this HLS output group.

        @[JSON::Field(key: "outputSelection")]
        getter output_selection : String?

        # Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as
        # follows: either the program date and time are initialized using the input timecode source, or the
        # time is initialized using the input timecode source and the date is initialized using the
        # timestamp_offset.

        @[JSON::Field(key: "programDateTime")]
        getter program_date_time : String?

        # Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.

        @[JSON::Field(key: "programDateTimePeriod")]
        getter program_date_time_period : Int32?

        # Specify whether MediaConvert generates HLS manifests while your job is running or when your job is
        # complete. To generate HLS manifests while your job is running: Choose Enabled. Use if you want to
        # play back your content as soon as it's available. MediaConvert writes the parent and child manifests
        # after the first three media segments are written to your destination S3 bucket. It then writes new
        # updated manifests after each additional segment is written. The parent manifest includes the latest
        # BANDWIDTH and AVERAGE-BANDWIDTH attributes, and child manifests include the latest available media
        # segment. When your job completes, the final child playlists include an EXT-X-ENDLIST tag. To
        # generate HLS manifests only when your job completes: Choose Disabled.

        @[JSON::Field(key: "progressiveWriteHlsManifest")]
        getter progressive_write_hls_manifest : String?

        # When set to SINGLE_FILE, emits program as a single media resource (.ts) file, uses #EXT-X-BYTERANGE
        # tags to index segment for playback.

        @[JSON::Field(key: "segmentControl")]
        getter segment_control : String?

        # Specify the length, in whole seconds, of each segment. When you don't specify a value, MediaConvert
        # defaults to 10. Related settings: Use Segment length control to specify whether the encoder enforces
        # this value strictly. Use Segment control to specify whether MediaConvert creates separate segment
        # files or one content file that has metadata to mark the segment boundaries.

        @[JSON::Field(key: "segmentLength")]
        getter segment_length : Int32?

        # Specify how you want MediaConvert to determine segment lengths in this output group. To use the
        # exact value that you specify under Segment length: Choose Exact. Note that this might result in
        # additional I-frames in the output GOP. To create segment lengths that are a multiple of the GOP:
        # Choose Multiple of GOP. MediaConvert will round up the segment lengths to match the next GOP
        # boundary. To have MediaConvert automatically determine a segment duration that is a multiple of both
        # the audio packets and the frame rates: Choose Match. When you do, also specify a target segment
        # duration under Segment length. This is useful for some ad-insertion or segment replacement
        # workflows. Note that Match has the following requirements: - Output containers: Include at least one
        # video output and at least one audio output. Audio-only outputs are not supported. - Output frame
        # rate: Follow source is not supported. - Multiple output frame rates: When you specify multiple
        # outputs, we recommend they share a similar frame rate (as in X/3, X/2, X, or 2X). For example: 5,
        # 15, 30 and 60. Or: 25 and 50. (Outputs must share an integer multiple.) - Output audio codec:
        # Specify Advanced Audio Coding (AAC). - Output sample rate: Choose 48kHz.

        @[JSON::Field(key: "segmentLengthControl")]
        getter segment_length_control : String?

        # Specify the number of segments to write to a subdirectory before starting a new one. You must also
        # set Directory structure to Subdirectory per stream for this setting to have an effect.

        @[JSON::Field(key: "segmentsPerSubdirectory")]
        getter segments_per_subdirectory : Int32?

        # Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.

        @[JSON::Field(key: "streamInfResolution")]
        getter stream_inf_resolution : String?

        # When set to LEGACY, the segment target duration is always rounded up to the nearest integer value
        # above its current value in seconds. When set to SPEC\\_COMPLIANT, the segment target duration is
        # rounded up to the nearest integer value if fraction seconds are greater than or equal to 0.5 (>=
        # 0.5) and rounded down if less than 0.5 (< 0.5). You may need to use LEGACY if your client needs to
        # ensure that the target duration is always longer than the actual duration of the segment. Some older
        # players may experience interrupted playback when the actual duration of a track in a segment is
        # longer than the target duration.

        @[JSON::Field(key: "targetDurationCompatibilityMode")]
        getter target_duration_compatibility_mode : String?

        # Specify the type of the ID3 frame to use for ID3 timestamps in your output. To include ID3
        # timestamps: Specify PRIV or TDRL and set ID3 metadata to Passthrough. To exclude ID3 timestamps: Set
        # ID3 timestamp frame type to None.

        @[JSON::Field(key: "timedMetadataId3Frame")]
        getter timed_metadata_id3_frame : String?

        # Specify the interval in seconds to write ID3 timestamps in your output. The first timestamp starts
        # at the output timecode and date, and increases incrementally with each ID3 timestamp. To use the
        # default interval of 10 seconds: Leave blank. To include this metadata in your output: Set ID3
        # timestamp frame type to PRIV or TDRL, and set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataId3Period")]
        getter timed_metadata_id3_period : Int32?

        # Provides an extra millisecond delta offset to fine tune the timestamps.

        @[JSON::Field(key: "timestampDeltaMilliseconds")]
        getter timestamp_delta_milliseconds : Int32?

        def initialize(
          @ad_markers : Array(String)? = nil,
          @additional_manifests : Array(Types::HlsAdditionalManifest)? = nil,
          @audio_only_header : String? = nil,
          @base_url : String? = nil,
          @caption_language_mappings : Array(Types::HlsCaptionLanguageMapping)? = nil,
          @caption_language_setting : String? = nil,
          @caption_segment_length_control : String? = nil,
          @client_cache : String? = nil,
          @codec_specification : String? = nil,
          @destination : String? = nil,
          @destination_settings : Types::DestinationSettings? = nil,
          @directory_structure : String? = nil,
          @encryption : Types::HlsEncryptionSettings? = nil,
          @image_based_trick_play : String? = nil,
          @image_based_trick_play_settings : Types::HlsImageBasedTrickPlaySettings? = nil,
          @manifest_compression : String? = nil,
          @manifest_duration_format : String? = nil,
          @min_final_segment_length : Float64? = nil,
          @min_segment_length : Int32? = nil,
          @output_selection : String? = nil,
          @program_date_time : String? = nil,
          @program_date_time_period : Int32? = nil,
          @progressive_write_hls_manifest : String? = nil,
          @segment_control : String? = nil,
          @segment_length : Int32? = nil,
          @segment_length_control : String? = nil,
          @segments_per_subdirectory : Int32? = nil,
          @stream_inf_resolution : String? = nil,
          @target_duration_compatibility_mode : String? = nil,
          @timed_metadata_id3_frame : String? = nil,
          @timed_metadata_id3_period : Int32? = nil,
          @timestamp_delta_milliseconds : Int32? = nil
        )
        end
      end

      # Tile and thumbnail settings applicable when imageBasedTrickPlay is ADVANCED

      struct HlsImageBasedTrickPlaySettings
        include JSON::Serializable

        # The cadence MediaConvert follows for generating thumbnails. If set to FOLLOW_IFRAME, MediaConvert
        # generates thumbnails for each IDR frame in the output (matching the GOP cadence). If set to
        # FOLLOW_CUSTOM, MediaConvert generates thumbnails according to the interval you specify in
        # thumbnailInterval.

        @[JSON::Field(key: "intervalCadence")]
        getter interval_cadence : String?

        # Height of each thumbnail within each tile image, in pixels. Leave blank to maintain aspect ratio
        # with thumbnail width. If following the aspect ratio would lead to a total tile height greater than
        # 4096, then the job will be rejected. Must be divisible by 2.

        @[JSON::Field(key: "thumbnailHeight")]
        getter thumbnail_height : Int32?

        # Enter the interval, in seconds, that MediaConvert uses to generate thumbnails. If the interval you
        # enter doesn't align with the output frame rate, MediaConvert automatically rounds the interval to
        # align with the output frame rate. For example, if the output frame rate is 29.97 frames per second
        # and you enter 5, MediaConvert uses a 150 frame interval to generate thumbnails.

        @[JSON::Field(key: "thumbnailInterval")]
        getter thumbnail_interval : Float64?

        # Width of each thumbnail within each tile image, in pixels. Default is 312. Must be divisible by 8.

        @[JSON::Field(key: "thumbnailWidth")]
        getter thumbnail_width : Int32?

        # Number of thumbnails in each column of a tile image. Set a value between 2 and 2048. Must be
        # divisible by 2.

        @[JSON::Field(key: "tileHeight")]
        getter tile_height : Int32?

        # Number of thumbnails in each row of a tile image. Set a value between 1 and 512.

        @[JSON::Field(key: "tileWidth")]
        getter tile_width : Int32?

        def initialize(
          @interval_cadence : String? = nil,
          @thumbnail_height : Int32? = nil,
          @thumbnail_interval : Float64? = nil,
          @thumbnail_width : Int32? = nil,
          @tile_height : Int32? = nil,
          @tile_width : Int32? = nil
        )
        end
      end

      # Settings specific to audio sources in an HLS alternate rendition group. Specify the properties
      # (renditionGroupId, renditionName or renditionLanguageCode) to identify the unique audio track among
      # the alternative rendition groups present in the HLS manifest. If no unique track is found, or
      # multiple tracks match the properties provided, the job fails. If no properties in
      # hlsRenditionGroupSettings are specified, the default audio track within the video segment is chosen.
      # If there is no audio within video segment, the alternative audio with DEFAULT=YES is chosen instead.

      struct HlsRenditionGroupSettings
        include JSON::Serializable

        # Optional. Specify alternative group ID

        @[JSON::Field(key: "renditionGroupId")]
        getter rendition_group_id : String?

        # Optionally specify the language, using an ISO 639-2 or ISO 639-3 three-letter code in all capital
        # letters. You can find a list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "renditionLanguageCode")]
        getter rendition_language_code : String?

        # Optional. Specify media name

        @[JSON::Field(key: "renditionName")]
        getter rendition_name : String?

        def initialize(
          @rendition_group_id : String? = nil,
          @rendition_language_code : String? = nil,
          @rendition_name : String? = nil
        )
        end
      end

      # Settings for HLS output groups

      struct HlsSettings
        include JSON::Serializable

        # Specifies the group to which the audio rendition belongs.

        @[JSON::Field(key: "audioGroupId")]
        getter audio_group_id : String?

        # Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream (M2TS) to create a file
        # in an MPEG2-TS container. Keep the default value Automatic to create an audio-only file in a raw
        # container. Regardless of the value that you specify here, if this output has video, the service will
        # place the output into an MPEG2-TS container.

        @[JSON::Field(key: "audioOnlyContainer")]
        getter audio_only_container : String?

        # List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs
        # that are associated to the video, separate by ','.

        @[JSON::Field(key: "audioRenditionSets")]
        getter audio_rendition_sets : String?

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

        # Specify whether to flag this audio track as descriptive video service (DVS) in your HLS parent
        # manifest. When you choose Flag, MediaConvert includes the parameter
        # CHARACTERISTICS="public.accessibility.describes-video" in the EXT-X-MEDIA entry for this track. When
        # you keep the default choice, Don't flag, MediaConvert leaves this parameter out. The DVS flag can
        # help with accessibility on Apple devices. For more information, see the Apple documentation.

        @[JSON::Field(key: "descriptiveVideoServiceFlag")]
        getter descriptive_video_service_flag : String?

        # Generate a variant manifest that lists only the I-frames for this rendition. You might use this
        # manifest as part of a workflow that creates preview functions for your video. MediaConvert adds both
        # the I-frame only variant manifest and the regular variant manifest to the multivariant manifest. To
        # have MediaConvert write a variant manifest that references I-frames from your output content using
        # EXT-X-BYTERANGE tags: Choose Include. To have MediaConvert output I-frames as single frame TS files
        # and a corresponding variant manifest that references them: Choose Include as TS. When you don't need
        # the I-frame only variant manifest: Keep the default value, Exclude.

        @[JSON::Field(key: "iFrameOnlyManifest")]
        getter i_frame_only_manifest : String?

        # Use this setting to add an identifying string to the filename of each segment. The service adds this
        # string between the name modifier and segment index number. You can use format identifiers in the
        # string. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html

        @[JSON::Field(key: "segmentModifier")]
        getter segment_modifier : String?

        def initialize(
          @audio_group_id : String? = nil,
          @audio_only_container : String? = nil,
          @audio_rendition_sets : String? = nil,
          @audio_track_type : String? = nil,
          @descriptive_video_service_flag : String? = nil,
          @i_frame_only_manifest : String? = nil,
          @segment_modifier : String? = nil
        )
        end
      end

      # Optional. Configuration for a destination queue to which the job can hop once a customer-defined
      # minimum wait time has passed.

      struct HopDestination
        include JSON::Serializable

        # Optional. When you set up a job to use queue hopping, you can specify a different relative priority
        # for the job in the destination queue. If you don't specify, the relative priority will remain the
        # same as in the previous queue.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Optional unless the job is submitted on the default queue. When you set up a job to use queue
        # hopping, you can specify a destination queue. This queue cannot be the original queue to which the
        # job is submitted. If the original queue isn't the default queue and you don't specify the
        # destination queue, the job will move to the default queue.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Required for setting up a job to use queue hopping. Minimum wait time in minutes until the job can
        # hop to the destination queue. Valid range is 1 to 4320 minutes, inclusive.

        @[JSON::Field(key: "waitMinutes")]
        getter wait_minutes : Int32?

        def initialize(
          @priority : Int32? = nil,
          @queue : String? = nil,
          @wait_minutes : Int32? = nil
        )
        end
      end

      # To insert ID3 tags in your output, specify two values. Use ID3 tag to specify the base 64 encoded
      # string and use Timecode to specify the time when the tag should be inserted. To insert multiple ID3
      # tags in your output, create multiple instances of ID3 insertion.

      struct Id3Insertion
        include JSON::Serializable

        # Use ID3 tag to provide a fully formed ID3 tag in base64-encode format.

        @[JSON::Field(key: "id3")]
        getter id3 : String?

        # Provide a Timecode in HH:MM:SS:FF or HH:MM:SS;FF format.

        @[JSON::Field(key: "timecode")]
        getter timecode : String?

        def initialize(
          @id3 : String? = nil,
          @timecode : String? = nil
        )
        end
      end

      # Use the image inserter feature to include a graphic overlay on your video. Enable or disable this
      # feature for each input or output individually. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/graphic-overlay.html. This setting is disabled by
      # default.

      struct ImageInserter
        include JSON::Serializable

        # Specify the images that you want to overlay on your video. The images must be PNG or TGA files.

        @[JSON::Field(key: "insertableImages")]
        getter insertable_images : Array(Types::InsertableImage)?

        # Specify the reference white level, in nits, for all of your image inserter images. Use to correct
        # brightness levels within HDR10 outputs. For 1,000 nit peak brightness displays, we recommend that
        # you set SDR reference white level to 203 (according to ITU-R BT.2408). Leave blank to use the
        # default value of 100, or specify an integer from 100 to 1000.

        @[JSON::Field(key: "sdrReferenceWhiteLevel")]
        getter sdr_reference_white_level : Int32?

        def initialize(
          @insertable_images : Array(Types::InsertableImage)? = nil,
          @sdr_reference_white_level : Int32? = nil
        )
        end
      end

      # Settings related to IMSC captions. IMSC is a sidecar format that holds captions in a file that is
      # separate from the video container. Set up sidecar captions in the same output group, but different
      # output from your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

      struct ImscDestinationSettings
        include JSON::Serializable

        # If the IMSC captions track is intended to provide accessibility for people who are deaf or hard of
        # hearing: Set Accessibility subtitles to Enabled. When you do, MediaConvert adds accessibility
        # attributes to your output HLS or DASH manifest. For HLS manifests, MediaConvert adds the following
        # accessibility attributes under EXT-X-MEDIA for this track:
        # CHARACTERISTICS="public.accessibility.transcribes-spoken-dialog,public.accessibility.describes-music-and-sound"
        # and AUTOSELECT="YES". For DASH manifests, MediaConvert adds the following in the adaptation set for
        # this track: . If the captions track is not intended to provide such accessibility: Keep the default
        # value, Disabled. When you do, for DASH manifests, MediaConvert instead adds the following in the
        # adaptation set for this track: .

        @[JSON::Field(key: "accessibility")]
        getter accessibility : String?

        # Keep this setting enabled to have MediaConvert use the font style and position information from the
        # captions source in the output. This option is available only when your input captions are IMSC,
        # SMPTE-TT, or TTML. Disable this setting for simplified output captions.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        def initialize(
          @accessibility : String? = nil,
          @style_passthrough : String? = nil
        )
        end
      end

      # Use inputs to define the source files used in your transcoding job. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/specify-input-settings.html. You can use multiple
      # video inputs to do input stitching. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/assembling-multiple-inputs-and-input-clips.html

      struct Input
        include JSON::Serializable

        # Use to remove noise, blocking, blurriness, or ringing from your input as a pre-filter step before
        # encoding. The Advanced input filter removes more types of compression artifacts and is an
        # improvement when compared to basic Deblock and Denoise filters. To remove video compression
        # artifacts from your input and improve the video quality: Choose Enabled. Additionally, this filter
        # can help increase the video quality of your output relative to its bitrate, since noisy inputs are
        # more complex and require more bits to encode. To help restore loss of detail after applying the
        # filter, you can optionally add texture or sharpening as an additional step. Jobs that use this
        # feature incur pro-tier pricing. To not apply advanced input filtering: Choose Disabled. Note that
        # you can still apply basic filtering with Deblock and Denoise.

        @[JSON::Field(key: "advancedInputFilter")]
        getter advanced_input_filter : String?

        # Optional settings for Advanced input filter when you set Advanced input filter to Enabled.

        @[JSON::Field(key: "advancedInputFilterSettings")]
        getter advanced_input_filter_settings : Types::AdvancedInputFilterSettings?

        # Use audio selector groups to combine multiple sidecar audio inputs so that you can assign them to a
        # single output audio tab. Note that, if you're working with embedded audio, it's simpler to assign
        # multiple input tracks into a single audio selector rather than use an audio selector group.

        @[JSON::Field(key: "audioSelectorGroups")]
        getter audio_selector_groups : Hash(String, Types::AudioSelectorGroup)?

        # Use Audio selectors to specify a track or set of tracks from the input that you will use in your
        # outputs. You can use multiple Audio selectors per input.

        @[JSON::Field(key: "audioSelectors")]
        getter audio_selectors : Hash(String, Types::AudioSelector)?

        # Use captions selectors to specify the captions data from your input that you use in your outputs.
        # You can use up to 100 captions selectors per input.

        @[JSON::Field(key: "captionSelectors")]
        getter caption_selectors : Hash(String, Types::CaptionSelector)?

        # Use Cropping selection to specify the video area that the service will include in the output video
        # frame. If you specify a value here, it will override any value that you specify in the output
        # setting Cropping selection.

        @[JSON::Field(key: "crop")]
        getter crop : Types::Rectangle?

        # Enable Deblock to produce smoother motion in the output. Default is disabled. Only manually
        # controllable for MPEG2 and uncompressed video inputs.

        @[JSON::Field(key: "deblockFilter")]
        getter deblock_filter : String?

        # Settings for decrypting any input files that you encrypt before you upload them to Amazon S3.
        # MediaConvert can decrypt files only when you use AWS Key Management Service (KMS) to encrypt the
        # data key that you use to encrypt your content.

        @[JSON::Field(key: "decryptionSettings")]
        getter decryption_settings : Types::InputDecryptionSettings?

        # Enable Denoise to filter noise from the input. Default is disabled. Only applicable to MPEG2, H.264,
        # H.265, and uncompressed video inputs.

        @[JSON::Field(key: "denoiseFilter")]
        getter denoise_filter : String?

        # Use this setting only when your video source has Dolby Vision studio mastering metadata that is
        # carried in a separate XML file. Specify the Amazon S3 location for the metadata XML file.
        # MediaConvert uses this file to provide global and frame-level metadata for Dolby Vision
        # preprocessing. When you specify a file here and your input also has interleaved global and frame
        # level metadata, MediaConvert ignores the interleaved metadata and uses only the the metadata from
        # this external XML file. Note that your IAM service role must grant MediaConvert read permissions to
        # this file. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.

        @[JSON::Field(key: "dolbyVisionMetadataXml")]
        getter dolby_vision_metadata_xml : String?

        # Use Dynamic audio selectors when you do not know the track layout of your source when you submit
        # your job, but want to select multiple audio tracks. When you include an audio track in your output
        # and specify this Dynamic audio selector as the Audio source, MediaConvert creates an output audio
        # track for each dynamically selected track. Note that when you include a Dynamic audio selector for
        # two or more inputs, each input must have the same number of audio tracks and audio channels.

        @[JSON::Field(key: "dynamicAudioSelectors")]
        getter dynamic_audio_selectors : Hash(String, Types::DynamicAudioSelector)?

        # Specify the source file for your transcoding job. You can use multiple inputs in a single job. The
        # service concatenates these inputs, in the order that you specify them in the job, to create the
        # outputs. For standard inputs, provide the path to your S3, HTTP, or HTTPS source file. For example,
        # s3://amzn-s3-demo-bucket/input.mp4 for an Amazon S3 input or https://example.com/input.mp4 for an
        # HTTPS input. For TAMS inputs, specify the HTTPS endpoint of your TAMS server. For example,
        # https://tams-server.example.com . When you do, also specify Source ID, Timerange, GAP handling, and
        # the Authorization connection ARN under TAMS settings. (Don't include these parameters in the Input
        # file URL.) For IMF inputs, specify your input by providing the path to your CPL. For example,
        # s3://amzn-s3-demo-bucket/vf/cpl.xml . If the CPL is in an incomplete IMP, make sure to use
        # Supplemental IMPsto specify any supplemental IMPs that contain assets referenced by the CPL.

        @[JSON::Field(key: "fileInput")]
        getter file_input : String?

        # Specify whether to apply input filtering to improve the video quality of your input. To apply
        # filtering depending on your input type and quality: Choose Auto. To apply no filtering: Choose
        # Disable. To apply filtering regardless of your input type and quality: Choose Force. When you do,
        # you must also specify a value for Filter strength.

        @[JSON::Field(key: "filterEnable")]
        getter filter_enable : String?

        # Specify the strength of the input filter. To apply an automatic amount of filtering based the
        # compression artifacts measured in your input: We recommend that you leave Filter strength blank and
        # set Filter enable to Auto. To manually apply filtering: Enter a value from 1 to 5, where 1 is the
        # least amount of filtering and 5 is the most. The value that you enter applies to the strength of the
        # Deblock or Denoise filters, or to the strength of the Advanced input filter.

        @[JSON::Field(key: "filterStrength")]
        getter filter_strength : Int32?

        # Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this
        # feature for each input individually. This setting is disabled by default.

        @[JSON::Field(key: "imageInserter")]
        getter image_inserter : Types::ImageInserter?

        # Contains sets of start and end times that together specify a portion of the input to be used in the
        # outputs. If you provide only a start time, the clip will be the entire input from that point to the
        # end. If you provide only an end time, it will be the entire input up to that point. When you specify
        # more than one input clip, the transcoding service creates the job outputs by stringing the clips
        # together in the order you specify them.

        @[JSON::Field(key: "inputClippings")]
        getter input_clippings : Array(Types::InputClipping)?

        # When you have a progressive segmented frame (PsF) input, use this setting to flag the input as PsF.
        # MediaConvert doesn't automatically detect PsF. Therefore, flagging your input as PsF results in
        # better preservation of video quality when you do deinterlacing and frame rate conversion. If you
        # don't specify, the default value is Auto. Auto is the correct setting for all inputs that are not
        # PsF. Don't set this value to PsF when your input is interlaced. Doing so creates horizontal
        # interlacing artifacts.

        @[JSON::Field(key: "inputScanType")]
        getter input_scan_type : String?

        # Use Selection placement to define the video area in your output frame. The area outside of the
        # rectangle that you specify here is black. If you specify a value here, it will override any value
        # that you specify in the output setting Selection placement. If you specify a value here, this will
        # override any AFD values in your input, even if you set Respond to AFD to Respond. If you specify a
        # value here, this will ignore anything that you specify for the setting Scaling Behavior.

        @[JSON::Field(key: "position")]
        getter position : Types::Rectangle?

        # Use Program to select a specific program from within a multi-program transport stream. Note that
        # Quad 4K is not currently supported. Default is the first program within the transport stream. If the
        # program you specify doesn't exist, the transcoding service will use this default.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32?

        # Set PSI control for transport stream inputs to specify which data the demux process to scans. *
        # Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.

        @[JSON::Field(key: "psiControl")]
        getter psi_control : String?

        # Provide a list of any necessary supplemental IMPs. You need supplemental IMPs if the CPL that you're
        # using for your input is in an incomplete IMP. Specify either the supplemental IMP directories with a
        # trailing slash or the ASSETMAP.xml files. For example ["s3://bucket/ov/",
        # "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to specify the IMP that contains your input CPL,
        # because the service automatically detects it.

        @[JSON::Field(key: "supplementalImps")]
        getter supplemental_imps : Array(String)?

        # Specify a Time Addressable Media Store (TAMS) server as an input source. TAMS is an open-source API
        # specification that provides access to time-segmented media content. Use TAMS to retrieve specific
        # time ranges from live or archived media streams. When you specify TAMS settings, MediaConvert
        # connects to your TAMS server, retrieves the media segments for your specified time range, and
        # processes them as a single input. This enables workflows like extracting clips from live streams or
        # processing specific portions of archived content. To use TAMS, you must: 1. Have access to a
        # TAMS-compliant server 2. Specify the server URL in the Input file URL field 3. Provide the required
        # SourceId and Timerange parameters 4. Configure authentication, if your TAMS server requires it

        @[JSON::Field(key: "tamsSettings")]
        getter tams_settings : Types::InputTamsSettings?

        # Use this Timecode source setting, located under the input settings, to specify how the service
        # counts input video frames. This input frame count affects only the behavior of features that apply
        # to a single input at a time, such as input clipping and synchronizing some captions formats. Choose
        # Embedded to use the timecodes in your input video. Choose Start at zero to start the first frame at
        # zero. Choose Specified start to start the first frame at the timecode that you specify in the
        # setting Start timecode. If you don't specify a value for Timecode source, the service will use
        # Embedded by default. For more information about timecodes, see
        # https://docs.aws.amazon.com/console/mediaconvert/timecode.

        @[JSON::Field(key: "timecodeSource")]
        getter timecode_source : String?

        # Specify the timecode that you want the service to use for this input's initial frame. To use this
        # setting, you must set the Timecode source setting, located under the input settings, to Specified
        # start. For more information about timecodes, see
        # https://docs.aws.amazon.com/console/mediaconvert/timecode.

        @[JSON::Field(key: "timecodeStart")]
        getter timecode_start : String?

        # When you include Video generator, MediaConvert creates a video input with black frames. Use this
        # setting if you do not have a video input or if you want to add black video frames before, or after,
        # other inputs. You can specify Video generator, or you can specify an Input file, but you cannot
        # specify both. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/video-generator.html

        @[JSON::Field(key: "videoGenerator")]
        getter video_generator : Types::InputVideoGenerator?

        # Contains an array of video overlays.

        @[JSON::Field(key: "videoOverlays")]
        getter video_overlays : Array(Types::VideoOverlay)?

        # Input video selectors contain the video settings for the input. Each of your inputs can have up to
        # one video selector.

        @[JSON::Field(key: "videoSelector")]
        getter video_selector : Types::VideoSelector?

        def initialize(
          @advanced_input_filter : String? = nil,
          @advanced_input_filter_settings : Types::AdvancedInputFilterSettings? = nil,
          @audio_selector_groups : Hash(String, Types::AudioSelectorGroup)? = nil,
          @audio_selectors : Hash(String, Types::AudioSelector)? = nil,
          @caption_selectors : Hash(String, Types::CaptionSelector)? = nil,
          @crop : Types::Rectangle? = nil,
          @deblock_filter : String? = nil,
          @decryption_settings : Types::InputDecryptionSettings? = nil,
          @denoise_filter : String? = nil,
          @dolby_vision_metadata_xml : String? = nil,
          @dynamic_audio_selectors : Hash(String, Types::DynamicAudioSelector)? = nil,
          @file_input : String? = nil,
          @filter_enable : String? = nil,
          @filter_strength : Int32? = nil,
          @image_inserter : Types::ImageInserter? = nil,
          @input_clippings : Array(Types::InputClipping)? = nil,
          @input_scan_type : String? = nil,
          @position : Types::Rectangle? = nil,
          @program_number : Int32? = nil,
          @psi_control : String? = nil,
          @supplemental_imps : Array(String)? = nil,
          @tams_settings : Types::InputTamsSettings? = nil,
          @timecode_source : String? = nil,
          @timecode_start : String? = nil,
          @video_generator : Types::InputVideoGenerator? = nil,
          @video_overlays : Array(Types::VideoOverlay)? = nil,
          @video_selector : Types::VideoSelector? = nil
        )
        end
      end

      # To transcode only portions of your input, include one input clip for each part of your input that
      # you want in your output. All input clips that you specify will be included in every output of the
      # job. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/assembling-multiple-inputs-and-input-clips.html.

      struct InputClipping
        include JSON::Serializable

        # Set End timecode to the end of the portion of the input you are clipping. The frame corresponding to
        # the End timecode value is included in the clip. Start timecode or End timecode may be left blank,
        # but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS
        # is the second, and FF is the frame number. When choosing this value, take into account your setting
        # for timecode source under input settings. For example, if you have embedded timecodes that start at
        # 01:00:00:00 and you want your clip to end six minutes into the video, use 01:06:00:00.

        @[JSON::Field(key: "endTimecode")]
        getter end_timecode : String?

        # Set Start timecode to the beginning of the portion of the input you are clipping. The frame
        # corresponding to the Start timecode value is included in the clip. Start timecode or End timecode
        # may be left blank, but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM
        # is the minute, SS is the second, and FF is the frame number. When choosing this value, take into
        # account your setting for Input timecode source. For example, if you have embedded timecodes that
        # start at 01:00:00:00 and you want your clip to begin five minutes into the video, use 01:05:00:00.

        @[JSON::Field(key: "startTimecode")]
        getter start_timecode : String?

        def initialize(
          @end_timecode : String? = nil,
          @start_timecode : String? = nil
        )
        end
      end

      # Settings for decrypting any input files that you encrypt before you upload them to Amazon S3.
      # MediaConvert can decrypt files only when you use AWS Key Management Service (KMS) to encrypt the
      # data key that you use to encrypt your content.

      struct InputDecryptionSettings
        include JSON::Serializable

        # Specify the encryption mode that you used to encrypt your input files.

        @[JSON::Field(key: "decryptionMode")]
        getter decryption_mode : String?

        # Warning! Don't provide your encryption key in plaintext. Your job settings could be intercepted,
        # making your encrypted content vulnerable. Specify the encrypted version of the data key that you
        # used to encrypt your content. The data key must be encrypted by AWS Key Management Service (KMS).
        # The key can be 128, 192, or 256 bits.

        @[JSON::Field(key: "encryptedDecryptionKey")]
        getter encrypted_decryption_key : String?

        # Specify the initialization vector that you used when you encrypted your content before uploading it
        # to Amazon S3. You can use a 16-byte initialization vector with any encryption mode. Or, you can use
        # a 12-byte initialization vector with GCM or CTR. MediaConvert accepts only initialization vectors
        # that are base64-encoded.

        @[JSON::Field(key: "initializationVector")]
        getter initialization_vector : String?

        # Specify the AWS Region for AWS Key Management Service (KMS) that you used to encrypt your data key,
        # if that Region is different from the one you are using for AWS Elemental MediaConvert.

        @[JSON::Field(key: "kmsKeyRegion")]
        getter kms_key_region : String?

        def initialize(
          @decryption_mode : String? = nil,
          @encrypted_decryption_key : String? = nil,
          @initialization_vector : String? = nil,
          @kms_key_region : String? = nil
        )
        end
      end

      # Specify a Time Addressable Media Store (TAMS) server as an input source. TAMS is an open-source API
      # specification that provides access to time-segmented media content. Use TAMS to retrieve specific
      # time ranges from live or archived media streams. When you specify TAMS settings, MediaConvert
      # connects to your TAMS server, retrieves the media segments for your specified time range, and
      # processes them as a single input. This enables workflows like extracting clips from live streams or
      # processing specific portions of archived content. To use TAMS, you must: 1. Have access to a
      # TAMS-compliant server 2. Specify the server URL in the Input file URL field 3. Provide the required
      # SourceId and Timerange parameters 4. Configure authentication, if your TAMS server requires it

      struct InputTamsSettings
        include JSON::Serializable

        # Specify the ARN (Amazon Resource Name) of an EventBridge Connection to authenticate with your TAMS
        # server. The EventBridge Connection stores your authentication credentials securely. MediaConvert
        # assumes your job's IAM role to access this connection, so ensure the role has the
        # events:RetrieveConnectionCredentials, secretsmanager:DescribeSecret, and
        # secretsmanager:GetSecretValue permissions. Format:
        # arn:aws:events:region:account-id:connection/connection-name/unique-id This setting is required when
        # you include TAMS settings in your job.

        @[JSON::Field(key: "authConnectionArn")]
        getter auth_connection_arn : String?

        # Specify how MediaConvert handles gaps between media segments in your TAMS source. Gaps can occur in
        # live streams due to network issues or other interruptions. Choose from the following options: * Skip
        # gaps - Default. Skip over gaps and join segments together. This creates a continuous output with no
        # blank frames, but may cause timeline discontinuities. * Fill with black - Insert black frames to
        # fill gaps between segments. This maintains timeline continuity but adds black frames where content
        # is missing. * Hold last frame - Repeat the last frame before a gap until the next segment begins.
        # This maintains visual continuity during gaps.

        @[JSON::Field(key: "gapHandling")]
        getter gap_handling : String?

        # Specify the unique identifier for the media source in your TAMS server. MediaConvert uses this
        # source ID to locate the appropriate flows containing the media segments you want to process. The
        # source ID corresponds to a specific media source registered in your TAMS server. This source must be
        # of type urn:x-nmos:format:multi, and can can reference multiple flows for audio, video, or combined
        # audio/video content. MediaConvert automatically selects the highest quality flows available for your
        # job. This setting is required when you include TAMS settings in your job.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?

        # Specify the time range of media segments to retrieve from your TAMS server. MediaConvert fetches
        # only the segments that fall within this range. Use the format specified by your TAMS server
        # implementation. This must be two timestamp values with the format {sign?}{seconds}:{nanoseconds},
        # separated by an underscore, surrounded by either parentheses or square brackets. Example:
        # [15:0_35:0) This setting is required when you include TAMS settings in your job.

        @[JSON::Field(key: "timerange")]
        getter timerange : String?

        def initialize(
          @auth_connection_arn : String? = nil,
          @gap_handling : String? = nil,
          @source_id : String? = nil,
          @timerange : String? = nil
        )
        end
      end

      # Specified video input in a template.

      struct InputTemplate
        include JSON::Serializable

        # Use to remove noise, blocking, blurriness, or ringing from your input as a pre-filter step before
        # encoding. The Advanced input filter removes more types of compression artifacts and is an
        # improvement when compared to basic Deblock and Denoise filters. To remove video compression
        # artifacts from your input and improve the video quality: Choose Enabled. Additionally, this filter
        # can help increase the video quality of your output relative to its bitrate, since noisy inputs are
        # more complex and require more bits to encode. To help restore loss of detail after applying the
        # filter, you can optionally add texture or sharpening as an additional step. Jobs that use this
        # feature incur pro-tier pricing. To not apply advanced input filtering: Choose Disabled. Note that
        # you can still apply basic filtering with Deblock and Denoise.

        @[JSON::Field(key: "advancedInputFilter")]
        getter advanced_input_filter : String?

        # Optional settings for Advanced input filter when you set Advanced input filter to Enabled.

        @[JSON::Field(key: "advancedInputFilterSettings")]
        getter advanced_input_filter_settings : Types::AdvancedInputFilterSettings?

        # Use audio selector groups to combine multiple sidecar audio inputs so that you can assign them to a
        # single output audio tab. Note that, if you're working with embedded audio, it's simpler to assign
        # multiple input tracks into a single audio selector rather than use an audio selector group.

        @[JSON::Field(key: "audioSelectorGroups")]
        getter audio_selector_groups : Hash(String, Types::AudioSelectorGroup)?

        # Use Audio selectors to specify a track or set of tracks from the input that you will use in your
        # outputs. You can use multiple Audio selectors per input.

        @[JSON::Field(key: "audioSelectors")]
        getter audio_selectors : Hash(String, Types::AudioSelector)?

        # Use captions selectors to specify the captions data from your input that you use in your outputs.
        # You can use up to 100 captions selectors per input.

        @[JSON::Field(key: "captionSelectors")]
        getter caption_selectors : Hash(String, Types::CaptionSelector)?

        # Use Cropping selection to specify the video area that the service will include in the output video
        # frame. If you specify a value here, it will override any value that you specify in the output
        # setting Cropping selection.

        @[JSON::Field(key: "crop")]
        getter crop : Types::Rectangle?

        # Enable Deblock to produce smoother motion in the output. Default is disabled. Only manually
        # controllable for MPEG2 and uncompressed video inputs.

        @[JSON::Field(key: "deblockFilter")]
        getter deblock_filter : String?

        # Enable Denoise to filter noise from the input. Default is disabled. Only applicable to MPEG2, H.264,
        # H.265, and uncompressed video inputs.

        @[JSON::Field(key: "denoiseFilter")]
        getter denoise_filter : String?

        # Use this setting only when your video source has Dolby Vision studio mastering metadata that is
        # carried in a separate XML file. Specify the Amazon S3 location for the metadata XML file.
        # MediaConvert uses this file to provide global and frame-level metadata for Dolby Vision
        # preprocessing. When you specify a file here and your input also has interleaved global and frame
        # level metadata, MediaConvert ignores the interleaved metadata and uses only the the metadata from
        # this external XML file. Note that your IAM service role must grant MediaConvert read permissions to
        # this file. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.

        @[JSON::Field(key: "dolbyVisionMetadataXml")]
        getter dolby_vision_metadata_xml : String?

        # Use Dynamic audio selectors when you do not know the track layout of your source when you submit
        # your job, but want to select multiple audio tracks. When you include an audio track in your output
        # and specify this Dynamic audio selector as the Audio source, MediaConvert creates an output audio
        # track for each dynamically selected track. Note that when you include a Dynamic audio selector for
        # two or more inputs, each input must have the same number of audio tracks and audio channels.

        @[JSON::Field(key: "dynamicAudioSelectors")]
        getter dynamic_audio_selectors : Hash(String, Types::DynamicAudioSelector)?

        # Specify whether to apply input filtering to improve the video quality of your input. To apply
        # filtering depending on your input type and quality: Choose Auto. To apply no filtering: Choose
        # Disable. To apply filtering regardless of your input type and quality: Choose Force. When you do,
        # you must also specify a value for Filter strength.

        @[JSON::Field(key: "filterEnable")]
        getter filter_enable : String?

        # Specify the strength of the input filter. To apply an automatic amount of filtering based the
        # compression artifacts measured in your input: We recommend that you leave Filter strength blank and
        # set Filter enable to Auto. To manually apply filtering: Enter a value from 1 to 5, where 1 is the
        # least amount of filtering and 5 is the most. The value that you enter applies to the strength of the
        # Deblock or Denoise filters, or to the strength of the Advanced input filter.

        @[JSON::Field(key: "filterStrength")]
        getter filter_strength : Int32?

        # Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this
        # feature for each input individually. This setting is disabled by default.

        @[JSON::Field(key: "imageInserter")]
        getter image_inserter : Types::ImageInserter?

        # Contains sets of start and end times that together specify a portion of the input to be used in the
        # outputs. If you provide only a start time, the clip will be the entire input from that point to the
        # end. If you provide only an end time, it will be the entire input up to that point. When you specify
        # more than one input clip, the transcoding service creates the job outputs by stringing the clips
        # together in the order you specify them.

        @[JSON::Field(key: "inputClippings")]
        getter input_clippings : Array(Types::InputClipping)?

        # When you have a progressive segmented frame (PsF) input, use this setting to flag the input as PsF.
        # MediaConvert doesn't automatically detect PsF. Therefore, flagging your input as PsF results in
        # better preservation of video quality when you do deinterlacing and frame rate conversion. If you
        # don't specify, the default value is Auto. Auto is the correct setting for all inputs that are not
        # PsF. Don't set this value to PsF when your input is interlaced. Doing so creates horizontal
        # interlacing artifacts.

        @[JSON::Field(key: "inputScanType")]
        getter input_scan_type : String?

        # Use Selection placement to define the video area in your output frame. The area outside of the
        # rectangle that you specify here is black. If you specify a value here, it will override any value
        # that you specify in the output setting Selection placement. If you specify a value here, this will
        # override any AFD values in your input, even if you set Respond to AFD to Respond. If you specify a
        # value here, this will ignore anything that you specify for the setting Scaling Behavior.

        @[JSON::Field(key: "position")]
        getter position : Types::Rectangle?

        # Use Program to select a specific program from within a multi-program transport stream. Note that
        # Quad 4K is not currently supported. Default is the first program within the transport stream. If the
        # program you specify doesn't exist, the transcoding service will use this default.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32?

        # Set PSI control for transport stream inputs to specify which data the demux process to scans. *
        # Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.

        @[JSON::Field(key: "psiControl")]
        getter psi_control : String?

        # Use this Timecode source setting, located under the input settings, to specify how the service
        # counts input video frames. This input frame count affects only the behavior of features that apply
        # to a single input at a time, such as input clipping and synchronizing some captions formats. Choose
        # Embedded to use the timecodes in your input video. Choose Start at zero to start the first frame at
        # zero. Choose Specified start to start the first frame at the timecode that you specify in the
        # setting Start timecode. If you don't specify a value for Timecode source, the service will use
        # Embedded by default. For more information about timecodes, see
        # https://docs.aws.amazon.com/console/mediaconvert/timecode.

        @[JSON::Field(key: "timecodeSource")]
        getter timecode_source : String?

        # Specify the timecode that you want the service to use for this input's initial frame. To use this
        # setting, you must set the Timecode source setting, located under the input settings, to Specified
        # start. For more information about timecodes, see
        # https://docs.aws.amazon.com/console/mediaconvert/timecode.

        @[JSON::Field(key: "timecodeStart")]
        getter timecode_start : String?

        # Contains an array of video overlays.

        @[JSON::Field(key: "videoOverlays")]
        getter video_overlays : Array(Types::VideoOverlay)?

        # Input video selectors contain the video settings for the input. Each of your inputs can have up to
        # one video selector.

        @[JSON::Field(key: "videoSelector")]
        getter video_selector : Types::VideoSelector?

        def initialize(
          @advanced_input_filter : String? = nil,
          @advanced_input_filter_settings : Types::AdvancedInputFilterSettings? = nil,
          @audio_selector_groups : Hash(String, Types::AudioSelectorGroup)? = nil,
          @audio_selectors : Hash(String, Types::AudioSelector)? = nil,
          @caption_selectors : Hash(String, Types::CaptionSelector)? = nil,
          @crop : Types::Rectangle? = nil,
          @deblock_filter : String? = nil,
          @denoise_filter : String? = nil,
          @dolby_vision_metadata_xml : String? = nil,
          @dynamic_audio_selectors : Hash(String, Types::DynamicAudioSelector)? = nil,
          @filter_enable : String? = nil,
          @filter_strength : Int32? = nil,
          @image_inserter : Types::ImageInserter? = nil,
          @input_clippings : Array(Types::InputClipping)? = nil,
          @input_scan_type : String? = nil,
          @position : Types::Rectangle? = nil,
          @program_number : Int32? = nil,
          @psi_control : String? = nil,
          @timecode_source : String? = nil,
          @timecode_start : String? = nil,
          @video_overlays : Array(Types::VideoOverlay)? = nil,
          @video_selector : Types::VideoSelector? = nil
        )
        end
      end

      # When you include Video generator, MediaConvert creates a video input with black frames. Use this
      # setting if you do not have a video input or if you want to add black video frames before, or after,
      # other inputs. You can specify Video generator, or you can specify an Input file, but you cannot
      # specify both. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/video-generator.html

      struct InputVideoGenerator
        include JSON::Serializable

        # Specify the number of audio channels to include in your video generator input. MediaConvert creates
        # these audio channels as silent audio within a single audio track. Enter an integer from 1 to 32.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Specify the duration, in milliseconds, for your video generator input. Enter an integer from 1 to
        # 86400000.

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Specify the denominator of the fraction that represents the frame rate for your video generator
        # input. When you do, you must also specify a value for Frame rate numerator. MediaConvert uses a
        # default frame rate of 29.97 when you leave Frame rate numerator and Frame rate denominator blank.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # Specify the numerator of the fraction that represents the frame rate for your video generator input.
        # When you do, you must also specify a value for Frame rate denominator. MediaConvert uses a default
        # frame rate of 29.97 when you leave Frame rate numerator and Frame rate denominator blank.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Specify the height, in pixels, for your video generator input. This is useful for positioning when
        # you include one or more video overlays for this input. To use the default resolution 540x360: Leave
        # both width and height blank. To specify a height: Enter an even integer from 32 to 8192. When you
        # do, you must also specify a value for width.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Specify the HTTP, HTTPS, or Amazon S3 location of the image that you want to overlay on the video.
        # Use a PNG or TGA file.

        @[JSON::Field(key: "imageInput")]
        getter image_input : String?

        # Specify the audio sample rate, in Hz, for the silent audio in your video generator input. Enter an
        # integer from 32000 to 48000.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Specify the width, in pixels, for your video generator input. This is useful for positioning when
        # you include one or more video overlays for this input. To use the default resolution 540x360: Leave
        # both width and height blank. To specify a width: Enter an even integer from 32 to 8192. When you do,
        # you must also specify a value for height.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @channels : Int32? = nil,
          @duration : Int32? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @height : Int32? = nil,
          @image_input : String? = nil,
          @sample_rate : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # These settings apply to a specific graphic overlay. You can include multiple overlays in your job.

      struct InsertableImage
        include JSON::Serializable

        # Specify the time, in milliseconds, for the image to remain on the output video. This duration
        # includes fade-in time but not fade-out time.

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Specify the length of time, in milliseconds, between the Start time that you specify for the image
        # insertion and the time that the image appears at full opacity. Full opacity is the level that you
        # specify for the opacity setting. If you don't specify a value for Fade-in, the image will appear
        # abruptly at the overlay start time.

        @[JSON::Field(key: "fadeIn")]
        getter fade_in : Int32?

        # Specify the length of time, in milliseconds, between the end of the time that you have specified for
        # the image overlay Duration and when the overlaid image has faded to total transparency. If you don't
        # specify a value for Fade-out, the image will disappear abruptly at the end of the inserted image
        # duration.

        @[JSON::Field(key: "fadeOut")]
        getter fade_out : Int32?

        # Specify the height of the inserted image in pixels. If you specify a value that's larger than the
        # video resolution height, the service will crop your overlaid image to fit. To use the native height
        # of the image, keep this setting blank.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Specify the HTTP, HTTPS, or Amazon S3 location of the image that you want to overlay on the video.
        # Use a PNG or TGA file.

        @[JSON::Field(key: "imageInserterInput")]
        getter image_inserter_input : String?

        # Specify the distance, in pixels, between the inserted image and the left edge of the video frame.
        # Required for any image overlay that you specify.

        @[JSON::Field(key: "imageX")]
        getter image_x : Int32?

        # Specify the distance, in pixels, between the overlaid image and the top edge of the video frame.
        # Required for any image overlay that you specify.

        @[JSON::Field(key: "imageY")]
        getter image_y : Int32?

        # Specify how overlapping inserted images appear. Images with higher values for Layer appear on top of
        # images with lower values for Layer.

        @[JSON::Field(key: "layer")]
        getter layer : Int32?

        # Use Opacity to specify how much of the underlying video shows through the inserted image. 0 is
        # transparent and 100 is fully opaque. Default is 50.

        @[JSON::Field(key: "opacity")]
        getter opacity : Int32?

        # Specify the timecode of the frame that you want the overlay to first appear on. This must be in
        # timecode (HH:MM:SS:FF or HH:MM:SS;FF) format. Remember to take into account your timecode source
        # settings.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # Specify the width of the inserted image in pixels. If you specify a value that's larger than the
        # video resolution width, the service will crop your overlaid image to fit. To use the native width of
        # the image, keep this setting blank.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @duration : Int32? = nil,
          @fade_in : Int32? = nil,
          @fade_out : Int32? = nil,
          @height : Int32? = nil,
          @image_inserter_input : String? = nil,
          @image_x : Int32? = nil,
          @image_y : Int32? = nil,
          @layer : Int32? = nil,
          @opacity : Int32? = nil,
          @start_time : String? = nil,
          @width : Int32? = nil
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

      # Each job converts an input file into an output file or files. For more information, see the User
      # Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      struct Job
        include JSON::Serializable

        # The IAM role you use for creating this job. For details about permissions, see the User Guide topic
        # at the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html

        @[JSON::Field(key: "role")]
        getter role : String

        # JobSettings contains all the transcode settings for a job.

        @[JSON::Field(key: "settings")]
        getter settings : Types::JobSettings

        # Accelerated transcoding can significantly speed up jobs with long, visually complex content.

        @[JSON::Field(key: "accelerationSettings")]
        getter acceleration_settings : Types::AccelerationSettings?

        # Describes whether the current job is running with accelerated transcoding. For jobs that have
        # Acceleration (AccelerationMode) set to DISABLED, AccelerationStatus is always NOT_APPLICABLE. For
        # jobs that have Acceleration (AccelerationMode) set to ENABLED or PREFERRED, AccelerationStatus is
        # one of the other states. AccelerationStatus is IN_PROGRESS initially, while the service determines
        # whether the input files and job settings are compatible with accelerated transcoding. If they are,
        # AcclerationStatus is ACCELERATED. If your input files and job settings aren't compatible with
        # accelerated transcoding, the service either fails your job or runs it without accelerated
        # transcoding, depending on how you set Acceleration (AccelerationMode). When the service runs your
        # job without accelerated transcoding, AccelerationStatus is NOT_ACCELERATED.

        @[JSON::Field(key: "accelerationStatus")]
        getter acceleration_status : String?

        # An identifier for this resource that is unique within all of AWS.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The tag type that AWS Billing and Cost Management will use to sort your AWS Elemental MediaConvert
        # costs on any billing report that you set up.

        @[JSON::Field(key: "billingTagsSource")]
        getter billing_tags_source : String?

        # Prevent duplicate jobs from being created and ensure idempotency for your requests. A client request
        # token can be any string that includes up to 64 ASCII characters. If you reuse a client request token
        # within one minute of a successful request, the API returns the job details of the original request
        # instead. For more information see
        # https://docs.aws.amazon.com/mediaconvert/latest/apireference/idempotency.html.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The time, in Unix epoch format in seconds, when the job got created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A job's phase can be PROBING, TRANSCODING OR UPLOADING

        @[JSON::Field(key: "currentPhase")]
        getter current_phase : String?

        # Error code for the job

        @[JSON::Field(key: "errorCode")]
        getter error_code : Int32?

        # Error message of Job

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Optional list of hop destinations.

        @[JSON::Field(key: "hopDestinations")]
        getter hop_destinations : Array(Types::HopDestination)?

        # A portion of the job's ARN, unique within your AWS Elemental MediaConvert resources

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Job engine version that you requested for your job. Valid versions are in a YYYY-MM-DD format.

        @[JSON::Field(key: "jobEngineVersionRequested")]
        getter job_engine_version_requested : String?

        # The Job engine version that your job used. Job engine versions are in a YYYY-MM-DD format. When you
        # request an expired version, the response for this property will be empty. Requests to create jobs
        # with an expired version result in a regular job, as if no specific Job engine version was requested.
        # When you request an invalid version, the response for this property will be empty. Requests to
        # create jobs with an invalid version result in a 400 error message, and no job is created.

        @[JSON::Field(key: "jobEngineVersionUsed")]
        getter job_engine_version_used : String?

        # An estimate of how far your job has progressed. This estimate is shown as a percentage of the total
        # time from when your job leaves its queue to when your output files appear in your output Amazon S3
        # bucket. AWS Elemental MediaConvert provides jobPercentComplete in CloudWatch STATUS_UPDATE events
        # and in the response to GetJob and ListJobs requests. The jobPercentComplete estimate is reliable for
        # the following input containers: Quicktime, Transport Stream, MP4, and MXF. For some jobs, the
        # service can't provide information about job progress. In those cases, jobPercentComplete returns a
        # null value.

        @[JSON::Field(key: "jobPercentComplete")]
        getter job_percent_complete : Int32?

        # The job template that the job is created from, if it is created from a job template.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : String?

        # Contains information about the most recent share attempt for the job. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/creating-resource-share.html

        @[JSON::Field(key: "lastShareDetails")]
        getter last_share_details : String?

        # Provides messages from the service about jobs that you have already successfully submitted.

        @[JSON::Field(key: "messages")]
        getter messages : Types::JobMessages?

        # List of output group details

        @[JSON::Field(key: "outputGroupDetails")]
        getter output_group_details : Array(Types::OutputGroupDetail)?

        # Relative priority on the job.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # When you create a job, you can specify a queue to send it to. If you don't specify, the job will go
        # to the default queue. For more about queues, see the User Guide topic at
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # The job's queue hopping history.

        @[JSON::Field(key: "queueTransitions")]
        getter queue_transitions : Array(Types::QueueTransition)?

        # The number of times that the service automatically attempted to process your job after encountering
        # an error.

        @[JSON::Field(key: "retryCount")]
        getter retry_count : Int32?

        # A job's share status can be NOT_SHARED, INITIATED, or SHARED

        @[JSON::Field(key: "shareStatus")]
        getter share_status : String?

        # Enable this setting when you run a test job to estimate how many reserved transcoding slots (RTS)
        # you need. When this is enabled, MediaConvert runs your job from an on-demand queue with similar
        # performance to what you will see with one RTS in a reserved queue. This setting is disabled by
        # default.

        @[JSON::Field(key: "simulateReservedQueue")]
        getter simulate_reserved_queue : String?

        # A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the
        # interval, in seconds, between status updates. MediaConvert sends an update at this interval from the
        # time the service begins processing your job to the time it completes the transcode or encounters an
        # error.

        @[JSON::Field(key: "statusUpdateInterval")]
        getter status_update_interval : String?

        # Information about when jobs are submitted, started, and finished is specified in Unix epoch format
        # in seconds.

        @[JSON::Field(key: "timing")]
        getter timing : Types::Timing?

        # User-defined metadata that you want to associate with an MediaConvert job. You specify metadata in
        # key/value pairs.

        @[JSON::Field(key: "userMetadata")]
        getter user_metadata : Hash(String, String)?

        # Contains any warning messages for the job. Use to help identify potential issues with your input,
        # output, or job. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/warning_codes.html

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(Types::WarningGroup)?

        def initialize(
          @role : String,
          @settings : Types::JobSettings,
          @acceleration_settings : Types::AccelerationSettings? = nil,
          @acceleration_status : String? = nil,
          @arn : String? = nil,
          @billing_tags_source : String? = nil,
          @client_request_token : String? = nil,
          @created_at : Time? = nil,
          @current_phase : String? = nil,
          @error_code : Int32? = nil,
          @error_message : String? = nil,
          @hop_destinations : Array(Types::HopDestination)? = nil,
          @id : String? = nil,
          @job_engine_version_requested : String? = nil,
          @job_engine_version_used : String? = nil,
          @job_percent_complete : Int32? = nil,
          @job_template : String? = nil,
          @last_share_details : String? = nil,
          @messages : Types::JobMessages? = nil,
          @output_group_details : Array(Types::OutputGroupDetail)? = nil,
          @priority : Int32? = nil,
          @queue : String? = nil,
          @queue_transitions : Array(Types::QueueTransition)? = nil,
          @retry_count : Int32? = nil,
          @share_status : String? = nil,
          @simulate_reserved_queue : String? = nil,
          @status : String? = nil,
          @status_update_interval : String? = nil,
          @timing : Types::Timing? = nil,
          @user_metadata : Hash(String, String)? = nil,
          @warnings : Array(Types::WarningGroup)? = nil
        )
        end
      end

      # Use Job engine versions to run jobs for your production workflow on one version, while you test and
      # validate the latest version. Job engine versions are in a YYYY-MM-DD format.

      struct JobEngineVersion
        include JSON::Serializable

        # The date that this Job engine version expires. Requests to create jobs with an expired version
        # result in a regular job, as if no specific Job engine version was requested.

        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # Use Job engine versions to run jobs for your production workflow on one version, while you test and
        # validate the latest version. Job engine versions represent periodically grouped MediaConvert
        # releases with new features, updates, improvements, and fixes. Job engine versions are in a
        # YYYY-MM-DD format. Note that the Job engine version feature is not publicly available at this time.
        # To request access, contact AWS support.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @expiration_date : Time? = nil,
          @version : String? = nil
        )
        end
      end

      # Provides messages from the service about jobs that you have already successfully submitted.

      struct JobMessages
        include JSON::Serializable

        # List of messages that are informational only and don't indicate a problem with your job.

        @[JSON::Field(key: "info")]
        getter info : Array(String)?

        # List of messages that warn about conditions that might cause your job not to run or to fail.

        @[JSON::Field(key: "warning")]
        getter warning : Array(String)?

        def initialize(
          @info : Array(String)? = nil,
          @warning : Array(String)? = nil
        )
        end
      end

      # JobSettings contains all the transcode settings for a job.

      struct JobSettings
        include JSON::Serializable

        # When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.

        @[JSON::Field(key: "adAvailOffset")]
        getter ad_avail_offset : Int32?

        # Settings for ad avail blanking. Video can be blanked or overlaid with an image, and audio muted
        # during SCTE-35 triggered ad avails.

        @[JSON::Field(key: "availBlanking")]
        getter avail_blanking : Types::AvailBlanking?

        # Use 3D LUTs to specify custom color mapping behavior when you convert from one color space into
        # another. You can include up to 8 different 3D LUTs. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/3d-luts.html

        @[JSON::Field(key: "colorConversion3DLUTSettings")]
        getter color_conversion3_dlut_settings : Array(Types::ColorConversion3DLUTSetting)?

        # Settings for Event Signaling And Messaging (ESAM). If you don't do ad insertion, you can ignore
        # these settings.

        @[JSON::Field(key: "esam")]
        getter esam : Types::EsamSettings?

        # If your source content has EIA-608 Line 21 Data Services, enable this feature to specify what
        # MediaConvert does with the Extended Data Services (XDS) packets. You can choose to pass through XDS
        # packets, or remove them from the output. For more information about XDS, see EIA-608 Line Data
        # Services, section 9.5.1.5 05h Content Advisory.

        @[JSON::Field(key: "extendedDataServices")]
        getter extended_data_services : Types::ExtendedDataServices?

        # Specify the input that MediaConvert references for your default output settings. MediaConvert uses
        # this input's Resolution, Frame rate, and Pixel aspect ratio for all outputs that you don't manually
        # specify different output settings for. Enabling this setting will disable "Follow source" for all
        # other inputs. If MediaConvert cannot follow your source, for example if you specify an audio-only
        # input, MediaConvert uses the first followable input instead. In your JSON job specification, enter
        # an integer from 1 to 150 corresponding to the order of your inputs.

        @[JSON::Field(key: "followSource")]
        getter follow_source : Int32?

        # Use Inputs to define source file used in the transcode job. There can be multiple inputs add in a
        # job. These inputs will be concantenated together to create the output.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::Input)?

        # Use these settings only when you use Kantar watermarking. Specify the values that MediaConvert uses
        # to generate and place Kantar watermarks in your output audio. These settings apply to every output
        # in your job. In addition to specifying these values, you also need to store your Kantar credentials
        # in AWS Secrets Manager. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/kantar-watermarking.html.

        @[JSON::Field(key: "kantarWatermark")]
        getter kantar_watermark : Types::KantarWatermarkSettings?

        # Overlay motion graphics on top of your video. The motion graphics that you specify here appear on
        # all outputs in all output groups. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/motion-graphic-overlay.html.

        @[JSON::Field(key: "motionImageInserter")]
        getter motion_image_inserter : Types::MotionImageInserter?

        # Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore
        # these settings. When you enable Nielsen configuration, MediaConvert enables PCM to ID3 tagging for
        # all outputs in the job.

        @[JSON::Field(key: "nielsenConfiguration")]
        getter nielsen_configuration : Types::NielsenConfiguration?

        # Ignore these settings unless you are using Nielsen non-linear watermarking. Specify the values that
        # MediaConvert uses to generate and place Nielsen watermarks in your output audio. In addition to
        # specifying these values, you also need to set up your cloud TIC server. These settings apply to
        # every output in your job. The MediaConvert implementation is currently with the following Nielsen
        # versions: Nielsen Watermark SDK Version 6.0.13 Nielsen NLM Watermark Engine Version 1.3.3 Nielsen
        # Watermark Authenticator [SID_TIC] Version [7.0.0]

        @[JSON::Field(key: "nielsenNonLinearWatermark")]
        getter nielsen_non_linear_watermark : Types::NielsenNonLinearWatermarkSettings?

        # Contains one group of settings for each set of outputs that share a common package type. All
        # unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single
        # output group as well. Required in is a group of settings that apply to the whole group. This
        # required object depends on the value you set for Type. Type, settings object pairs are as follows. *
        # FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings *
        # DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings *
        # CMAF_GROUP_SETTINGS, CmafGroupSettings

        @[JSON::Field(key: "outputGroups")]
        getter output_groups : Array(Types::OutputGroup)?

        # These settings control how the service handles timecodes throughout the job. These settings don't
        # affect input clipping.

        @[JSON::Field(key: "timecodeConfig")]
        getter timecode_config : Types::TimecodeConfig?

        # Insert user-defined custom ID3 metadata at timecodes that you specify. In each output that you want
        # to include this metadata, you must set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataInsertion")]
        getter timed_metadata_insertion : Types::TimedMetadataInsertion?

        def initialize(
          @ad_avail_offset : Int32? = nil,
          @avail_blanking : Types::AvailBlanking? = nil,
          @color_conversion3_dlut_settings : Array(Types::ColorConversion3DLUTSetting)? = nil,
          @esam : Types::EsamSettings? = nil,
          @extended_data_services : Types::ExtendedDataServices? = nil,
          @follow_source : Int32? = nil,
          @inputs : Array(Types::Input)? = nil,
          @kantar_watermark : Types::KantarWatermarkSettings? = nil,
          @motion_image_inserter : Types::MotionImageInserter? = nil,
          @nielsen_configuration : Types::NielsenConfiguration? = nil,
          @nielsen_non_linear_watermark : Types::NielsenNonLinearWatermarkSettings? = nil,
          @output_groups : Array(Types::OutputGroup)? = nil,
          @timecode_config : Types::TimecodeConfig? = nil,
          @timed_metadata_insertion : Types::TimedMetadataInsertion? = nil
        )
        end
      end

      # A job template is a pre-made set of encoding instructions that you can use to quickly create a job.

      struct JobTemplate
        include JSON::Serializable

        # A name you create for each job template. Each name must be unique within your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # JobTemplateSettings contains all the transcode settings saved in the template that will be applied
        # to jobs created from it.

        @[JSON::Field(key: "settings")]
        getter settings : Types::JobTemplateSettings

        # Accelerated transcoding can significantly speed up jobs with long, visually complex content.

        @[JSON::Field(key: "accelerationSettings")]
        getter acceleration_settings : Types::AccelerationSettings?

        # An identifier for this resource that is unique within all of AWS.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An optional category you create to organize your job templates.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The timestamp in epoch seconds for Job template creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # An optional description you create for each job template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional list of hop destinations.

        @[JSON::Field(key: "hopDestinations")]
        getter hop_destinations : Array(Types::HopDestination)?

        # The timestamp in epoch seconds when the Job template was last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # Relative priority on the job.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Optional. The queue that jobs created from this template are assigned to. If you don't specify this,
        # jobs will go to the default queue.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the
        # interval, in seconds, between status updates. MediaConvert sends an update at this interval from the
        # time the service begins processing your job to the time it completes the transcode or encounters an
        # error.

        @[JSON::Field(key: "statusUpdateInterval")]
        getter status_update_interval : String?

        # A job template can be of two types: system or custom. System or built-in job templates can't be
        # modified or deleted by the user.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @settings : Types::JobTemplateSettings,
          @acceleration_settings : Types::AccelerationSettings? = nil,
          @arn : String? = nil,
          @category : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @hop_destinations : Array(Types::HopDestination)? = nil,
          @last_updated : Time? = nil,
          @priority : Int32? = nil,
          @queue : String? = nil,
          @status_update_interval : String? = nil,
          @type : String? = nil
        )
        end
      end

      # JobTemplateSettings contains all the transcode settings saved in the template that will be applied
      # to jobs created from it.

      struct JobTemplateSettings
        include JSON::Serializable

        # When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.

        @[JSON::Field(key: "adAvailOffset")]
        getter ad_avail_offset : Int32?

        # Settings for ad avail blanking. Video can be blanked or overlaid with an image, and audio muted
        # during SCTE-35 triggered ad avails.

        @[JSON::Field(key: "availBlanking")]
        getter avail_blanking : Types::AvailBlanking?

        # Use 3D LUTs to specify custom color mapping behavior when you convert from one color space into
        # another. You can include up to 8 different 3D LUTs. For more information, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/3d-luts.html

        @[JSON::Field(key: "colorConversion3DLUTSettings")]
        getter color_conversion3_dlut_settings : Array(Types::ColorConversion3DLUTSetting)?

        # Settings for Event Signaling And Messaging (ESAM). If you don't do ad insertion, you can ignore
        # these settings.

        @[JSON::Field(key: "esam")]
        getter esam : Types::EsamSettings?

        # If your source content has EIA-608 Line 21 Data Services, enable this feature to specify what
        # MediaConvert does with the Extended Data Services (XDS) packets. You can choose to pass through XDS
        # packets, or remove them from the output. For more information about XDS, see EIA-608 Line Data
        # Services, section 9.5.1.5 05h Content Advisory.

        @[JSON::Field(key: "extendedDataServices")]
        getter extended_data_services : Types::ExtendedDataServices?

        # Specify the input that MediaConvert references for your default output settings. MediaConvert uses
        # this input's Resolution, Frame rate, and Pixel aspect ratio for all outputs that you don't manually
        # specify different output settings for. Enabling this setting will disable "Follow source" for all
        # other inputs. If MediaConvert cannot follow your source, for example if you specify an audio-only
        # input, MediaConvert uses the first followable input instead. In your JSON job specification, enter
        # an integer from 1 to 150 corresponding to the order of your inputs.

        @[JSON::Field(key: "followSource")]
        getter follow_source : Int32?

        # Use Inputs to define the source file used in the transcode job. There can only be one input in a job
        # template. Using the API, you can include multiple inputs when referencing a job template.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::InputTemplate)?

        # Use these settings only when you use Kantar watermarking. Specify the values that MediaConvert uses
        # to generate and place Kantar watermarks in your output audio. These settings apply to every output
        # in your job. In addition to specifying these values, you also need to store your Kantar credentials
        # in AWS Secrets Manager. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/kantar-watermarking.html.

        @[JSON::Field(key: "kantarWatermark")]
        getter kantar_watermark : Types::KantarWatermarkSettings?

        # Overlay motion graphics on top of your video. The motion graphics that you specify here appear on
        # all outputs in all output groups. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/motion-graphic-overlay.html.

        @[JSON::Field(key: "motionImageInserter")]
        getter motion_image_inserter : Types::MotionImageInserter?

        # Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore
        # these settings. When you enable Nielsen configuration, MediaConvert enables PCM to ID3 tagging for
        # all outputs in the job.

        @[JSON::Field(key: "nielsenConfiguration")]
        getter nielsen_configuration : Types::NielsenConfiguration?

        # Ignore these settings unless you are using Nielsen non-linear watermarking. Specify the values that
        # MediaConvert uses to generate and place Nielsen watermarks in your output audio. In addition to
        # specifying these values, you also need to set up your cloud TIC server. These settings apply to
        # every output in your job. The MediaConvert implementation is currently with the following Nielsen
        # versions: Nielsen Watermark SDK Version 6.0.13 Nielsen NLM Watermark Engine Version 1.3.3 Nielsen
        # Watermark Authenticator [SID_TIC] Version [7.0.0]

        @[JSON::Field(key: "nielsenNonLinearWatermark")]
        getter nielsen_non_linear_watermark : Types::NielsenNonLinearWatermarkSettings?

        # Contains one group of settings for each set of outputs that share a common package type. All
        # unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single
        # output group as well. Required in is a group of settings that apply to the whole group. This
        # required object depends on the value you set for Type. Type, settings object pairs are as follows. *
        # FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings *
        # DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings *
        # CMAF_GROUP_SETTINGS, CmafGroupSettings

        @[JSON::Field(key: "outputGroups")]
        getter output_groups : Array(Types::OutputGroup)?

        # These settings control how the service handles timecodes throughout the job. These settings don't
        # affect input clipping.

        @[JSON::Field(key: "timecodeConfig")]
        getter timecode_config : Types::TimecodeConfig?

        # Insert user-defined custom ID3 metadata at timecodes that you specify. In each output that you want
        # to include this metadata, you must set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataInsertion")]
        getter timed_metadata_insertion : Types::TimedMetadataInsertion?

        def initialize(
          @ad_avail_offset : Int32? = nil,
          @avail_blanking : Types::AvailBlanking? = nil,
          @color_conversion3_dlut_settings : Array(Types::ColorConversion3DLUTSetting)? = nil,
          @esam : Types::EsamSettings? = nil,
          @extended_data_services : Types::ExtendedDataServices? = nil,
          @follow_source : Int32? = nil,
          @inputs : Array(Types::InputTemplate)? = nil,
          @kantar_watermark : Types::KantarWatermarkSettings? = nil,
          @motion_image_inserter : Types::MotionImageInserter? = nil,
          @nielsen_configuration : Types::NielsenConfiguration? = nil,
          @nielsen_non_linear_watermark : Types::NielsenNonLinearWatermarkSettings? = nil,
          @output_groups : Array(Types::OutputGroup)? = nil,
          @timecode_config : Types::TimecodeConfig? = nil,
          @timed_metadata_insertion : Types::TimedMetadataInsertion? = nil
        )
        end
      end

      # Provide one or more JobsQueryFilter objects, each containing a Key with an associated Values array.
      # Note that MediaConvert queries jobs using OR logic.

      struct JobsQueryFilter
        include JSON::Serializable

        # Specify job details to filter for while performing a jobs query. You specify these filters as part
        # of a key-value pair within the JobsQueryFilter array. The following list describes which keys are
        # available and their possible values: * queue - Your Queue's name or ARN. * status - Your job's
        # status. (SUBMITTED | PROGRESSING | COMPLETE | CANCELED | ERROR) * fileInput - Your input file URL,
        # or partial input file name. * jobEngineVersionRequested - The Job engine version that you requested
        # for your job. Valid versions are in a YYYY-MM-DD format. * jobEngineVersionUsed - The Job engine
        # version that your job used. This may differ from the version that you requested. Valid versions are
        # in a YYYY-MM-DD format. * audioCodec - Your output's audio codec. (AAC | MP2 | MP3 | WAV | AIFF |
        # AC3| EAC3 | EAC3_ATMOS | VORBIS | OPUS | PASSTHROUGH | FLAC) * videoCodec - Your output's video
        # codec. (AV1 | AVC_INTRA | FRAME_CAPTURE | H_264 | H_265 | MPEG2 | PASSTHROUGH | PRORES |
        # UNCOMPRESSED | VC3 | VP8 | VP9 | XAVC)

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of values associated with a JobsQueryFilterKey.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Use these settings only when you use Kantar watermarking. Specify the values that MediaConvert uses
      # to generate and place Kantar watermarks in your output audio. These settings apply to every output
      # in your job. In addition to specifying these values, you also need to store your Kantar credentials
      # in AWS Secrets Manager. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/kantar-watermarking.html.

      struct KantarWatermarkSettings
        include JSON::Serializable

        # Provide an audio channel name from your Kantar audio license.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # Specify a unique identifier for Kantar to use for this piece of content.

        @[JSON::Field(key: "contentReference")]
        getter content_reference : String?

        # Provide the name of the AWS Secrets Manager secret where your Kantar credentials are stored. Note
        # that your MediaConvert service role must provide access to this secret. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/granting-permissions-for-mediaconvert-to-access-secrets-manager-secret.html.
        # For instructions on creating a secret, see
        # https://docs.aws.amazon.com/secretsmanager/latest/userguide/tutorials_basic.html, in the AWS Secrets
        # Manager User Guide.

        @[JSON::Field(key: "credentialsSecretName")]
        getter credentials_secret_name : String?

        # Optional. Specify an offset, in whole seconds, from the start of your output and the beginning of
        # the watermarking. When you don't specify an offset, Kantar defaults to zero.

        @[JSON::Field(key: "fileOffset")]
        getter file_offset : Float64?

        # Provide your Kantar license ID number. You should get this number from Kantar.

        @[JSON::Field(key: "kantarLicenseId")]
        getter kantar_license_id : Int32?

        # Provide the HTTPS endpoint to the Kantar server. You should get this endpoint from Kantar.

        @[JSON::Field(key: "kantarServerUrl")]
        getter kantar_server_url : String?

        # Optional. Specify the Amazon S3 bucket where you want MediaConvert to store your Kantar watermark
        # XML logs. When you don't specify a bucket, MediaConvert doesn't save these logs. Note that your
        # MediaConvert service role must provide access to this location. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html

        @[JSON::Field(key: "logDestination")]
        getter log_destination : String?

        # You can optionally use this field to specify the first timestamp that Kantar embeds during
        # watermarking. Kantar suggests that you be very cautious when using this Kantar feature, and that you
        # use it only on channels that are managed specifically for use with this feature by your Audience
        # Measurement Operator. For more information about this feature, contact Kantar technical support.

        @[JSON::Field(key: "metadata3")]
        getter metadata3 : String?

        # Additional metadata that MediaConvert sends to Kantar. Maximum length is 50 characters.

        @[JSON::Field(key: "metadata4")]
        getter metadata4 : String?

        # Additional metadata that MediaConvert sends to Kantar. Maximum length is 50 characters.

        @[JSON::Field(key: "metadata5")]
        getter metadata5 : String?

        # Additional metadata that MediaConvert sends to Kantar. Maximum length is 50 characters.

        @[JSON::Field(key: "metadata6")]
        getter metadata6 : String?

        # Additional metadata that MediaConvert sends to Kantar. Maximum length is 50 characters.

        @[JSON::Field(key: "metadata7")]
        getter metadata7 : String?

        # Additional metadata that MediaConvert sends to Kantar. Maximum length is 50 characters.

        @[JSON::Field(key: "metadata8")]
        getter metadata8 : String?

        def initialize(
          @channel_name : String? = nil,
          @content_reference : String? = nil,
          @credentials_secret_name : String? = nil,
          @file_offset : Float64? = nil,
          @kantar_license_id : Int32? = nil,
          @kantar_server_url : String? = nil,
          @log_destination : String? = nil,
          @metadata3 : String? = nil,
          @metadata4 : String? = nil,
          @metadata5 : String? = nil,
          @metadata6 : String? = nil,
          @metadata7 : String? = nil,
          @metadata8 : String? = nil
        )
        end
      end

      # You can send list job templates requests with an empty body. Optionally, you can filter the response
      # by category by specifying it in your request body. You can also optionally specify the maximum
      # number, up to twenty, of job templates to be returned.

      struct ListJobTemplatesRequest
        include JSON::Serializable

        # Optionally, specify a job template category to limit responses to only job templates from that
        # category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Optional. When you request a list of job templates, you can choose to list them alphabetically by
        # NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by name.

        @[JSON::Field(key: "listBy")]
        getter list_by : String?

        # Optional. Number of job templates, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use this string, provided with the response to a previous request, to request the next batch of job
        # templates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @category : String? = nil,
          @list_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil
        )
        end
      end

      # Successful list job templates requests return a JSON array of job templates. If you don't specify
      # how they are ordered, you will receive them in alphabetical order by name.

      struct ListJobTemplatesResponse
        include JSON::Serializable

        # List of Job templates.

        @[JSON::Field(key: "jobTemplates")]
        getter job_templates : Array(Types::JobTemplate)?

        # Use this string to request the next batch of job templates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_templates : Array(Types::JobTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # You can send list jobs requests with an empty body. Optionally, you can filter the response by queue
      # and/or job status by specifying them in your request body. You can also optionally specify the
      # maximum number, up to twenty, of jobs to be returned.

      struct ListJobsRequest
        include JSON::Serializable

        # Optional. Number of jobs, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Optional. Use this string, provided with the response to a previous request, to request the next
        # batch of jobs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        # Optional. Provide a queue name to get back only jobs from that queue.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Optional. A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil,
          @queue : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Successful list jobs requests return a JSON array of jobs. If you don't specify how they are
      # ordered, you will receive the most recently created first.

      struct ListJobsResponse
        include JSON::Serializable

        # List of jobs

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::Job)?

        # Use this string to request the next batch of jobs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::Job)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # You can send list presets requests with an empty body. Optionally, you can filter the response by
      # category by specifying it in your request body. You can also optionally specify the maximum number,
      # up to twenty, of queues to be returned.

      struct ListPresetsRequest
        include JSON::Serializable

        # Optionally, specify a preset category to limit responses to only presets from that category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Optional. When you request a list of presets, you can choose to list them alphabetically by NAME or
        # chronologically by CREATION_DATE. If you don't specify, the service will list them by name.

        @[JSON::Field(key: "listBy")]
        getter list_by : String?

        # Optional. Number of presets, up to twenty, that will be returned at one time

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use this string, provided with the response to a previous request, to request the next batch of
        # presets.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @category : String? = nil,
          @list_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil
        )
        end
      end

      # Successful list presets requests return a JSON array of presets. If you don't specify how they are
      # ordered, you will receive them alphabetically by name.

      struct ListPresetsResponse
        include JSON::Serializable

        # Use this string to request the next batch of presets.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of presets

        @[JSON::Field(key: "presets")]
        getter presets : Array(Types::Preset)?

        def initialize(
          @next_token : String? = nil,
          @presets : Array(Types::Preset)? = nil
        )
        end
      end

      # You can send list queues requests with an empty body. You can optionally specify the maximum number,
      # up to twenty, of queues to be returned.

      struct ListQueuesRequest
        include JSON::Serializable

        # Optional. When you request a list of queues, you can choose to list them alphabetically by NAME or
        # chronologically by CREATION_DATE. If you don't specify, the service will list them by creation date.

        @[JSON::Field(key: "listBy")]
        getter list_by : String?

        # Optional. Number of queues, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use this string, provided with the response to a previous request, to request the next batch of
        # queues.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @list_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil
        )
        end
      end

      # Successful list queues requests return a JSON array of queues. If you don't specify how they are
      # ordered, you will receive them alphabetically by name.

      struct ListQueuesResponse
        include JSON::Serializable

        # Use this string to request the next batch of queues.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of queues.

        @[JSON::Field(key: "queues")]
        getter queues : Array(Types::Queue)?

        # The maximum number of jobs that MediaConvert can process at one time, across all of your on-demand
        # queues in the current AWS Region.

        @[JSON::Field(key: "totalConcurrentJobs")]
        getter total_concurrent_jobs : Int32?

        # The remaining number of concurrent jobs that are not associated with a queue and are available to
        # allocate to a queue. You can allocate these jobs when you create or update a queue.

        @[JSON::Field(key: "unallocatedConcurrentJobs")]
        getter unallocated_concurrent_jobs : Int32?

        def initialize(
          @next_token : String? = nil,
          @queues : Array(Types::Queue)? = nil,
          @total_concurrent_jobs : Int32? = nil,
          @unallocated_concurrent_jobs : Int32? = nil
        )
        end
      end

      # List the tags for your AWS Elemental MediaConvert resource by sending a request with the Amazon
      # Resource Name (ARN) of the resource. To get the ARN, send a GET request with the resource name.

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to list tags for. To get the ARN, send
        # a GET request with the resource name.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # A successful request to list the tags for a resource returns a JSON map of tags.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Types::ResourceTags?

        def initialize(
          @resource_tags : Types::ResourceTags? = nil
        )
        end
      end

      # Retrieve a JSON array of all available Job engine versions and the date they expire. Job engine
      # versions are in YYYY-MM-DD format. Note that the Job engine version feature is not publicly
      # available at this time. To request access, contact AWS support.

      struct ListVersionsRequest
        include JSON::Serializable

        # Optional. Number of valid Job engine versions, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Optional. Use this string, provided with the response to a previous request, to request the next
        # batch of Job engine versions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Successful list versions requests will return a JSON for available Job engine versions.

      struct ListVersionsResponse
        include JSON::Serializable

        # Optional. Use this string, provided with the response to a previous request, to request the next
        # batch of Job engine versions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Retrieve a JSON array of all available Job engine versions and the date they expire.

        @[JSON::Field(key: "versions")]
        getter versions : Array(Types::JobEngineVersion)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(Types::JobEngineVersion)? = nil
        )
        end
      end

      # Settings for SCTE-35 signals from ESAM. Include this in your job settings to put SCTE-35 markers in
      # your HLS and transport stream outputs at the insertion points that you specify in an ESAM XML
      # document. Provide the document in the setting SCC XML.

      struct M2tsScte35Esam
        include JSON::Serializable

        # Packet Identifier (PID) of the SCTE-35 stream in the transport stream generated by ESAM.

        @[JSON::Field(key: "scte35EsamPid")]
        getter scte35_esam_pid : Int32?

        def initialize(
          @scte35_esam_pid : Int32? = nil
        )
        end
      end

      # MPEG-2 TS container settings. These apply to outputs in a File output group when the output's
      # container is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map
      # table (PMT). Each transport stream program contains subsets of data, including audio, video, and
      # metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each
      # transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in
      # a program along with their PID. Downstream systems and players use the program map table to look up
      # the PID for each type of data it accesses and then uses the PIDs to locate specific data within the
      # asset.

      struct M2tsSettings
        include JSON::Serializable

        # Selects between the DVB and ATSC buffer models for Dolby Digital audio.

        @[JSON::Field(key: "audioBufferModel")]
        getter audio_buffer_model : String?

        # Specify this setting only when your output will be consumed by a downstream repackaging workflow
        # that is sensitive to very small duration differences between video and audio. For this situation,
        # choose Match video duration. In all other cases, keep the default value, Default codec duration.
        # When you choose Match video duration, MediaConvert pads the output audio streams with silence or
        # trims them to ensure that the total duration of each audio stream is at least as long as the total
        # duration of the video stream. After padding or trimming, the audio stream duration is no more than
        # one frame longer than the video stream. MediaConvert applies audio padding or trimming only to the
        # end of the last segment of the output. For unsegmented outputs, MediaConvert adds padding only to
        # the end of the file. When you keep the default value, any minor discrepancies between audio and
        # video duration will depend on your output audio codec.

        @[JSON::Field(key: "audioDuration")]
        getter audio_duration : String?

        # The number of audio frames to insert for each PES packet.

        @[JSON::Field(key: "audioFramesPerPes")]
        getter audio_frames_per_pes : Int32?

        # Specify the packet identifiers (PIDs) for any elementary audio streams you include in this output.
        # Specify multiple PIDs as a JSON array. Default is the range 482-492.

        @[JSON::Field(key: "audioPids")]
        getter audio_pids : Array(Int32)?

        # Manually specify the difference in PTS offset that will be applied to the audio track, in seconds or
        # milliseconds, when you set PTS offset to Seconds or Milliseconds. Enter an integer from -10000 to
        # 10000. Leave blank to keep the default value 0.

        @[JSON::Field(key: "audioPtsOffsetDelta")]
        getter audio_pts_offset_delta : Int32?

        # Specify the output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer
        # automatically determine the appropriate bitrate. Other common values are 3750000, 7500000, and
        # 15000000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Controls what buffer model to use for accurate interleaving. If set to MULTIPLEX, use multiplex
        # buffer model. If set to NONE, this can lead to lower latency, but low-memory devices may not be able
        # to play back the stream without interruptions.

        @[JSON::Field(key: "bufferModel")]
        getter buffer_model : String?

        # If you select ALIGN_TO_VIDEO, MediaConvert writes captions and data packets with Presentation
        # Timestamp (PTS) values greater than or equal to the first video packet PTS (MediaConvert drops
        # captions and data packets with lesser PTS values). Keep the default value to allow all PTS values.

        @[JSON::Field(key: "dataPTSControl")]
        getter data_pts_control : String?

        # Use these settings to insert a DVB Network Information Table (NIT) in the transport stream of this
        # output.

        @[JSON::Field(key: "dvbNitSettings")]
        getter dvb_nit_settings : Types::DvbNitSettings?

        # Use these settings to insert a DVB Service Description Table (SDT) in the transport stream of this
        # output.

        @[JSON::Field(key: "dvbSdtSettings")]
        getter dvb_sdt_settings : Types::DvbSdtSettings?

        # Specify the packet identifiers (PIDs) for DVB subtitle data included in this output. Specify
        # multiple PIDs as a JSON array. Default is the range 460-479.

        @[JSON::Field(key: "dvbSubPids")]
        getter dvb_sub_pids : Array(Int32)?

        # Use these settings to insert a DVB Time and Date Table (TDT) in the transport stream of this output.

        @[JSON::Field(key: "dvbTdtSettings")]
        getter dvb_tdt_settings : Types::DvbTdtSettings?

        # Specify the packet identifier (PID) for DVB teletext data you include in this output. Default is
        # 499.

        @[JSON::Field(key: "dvbTeletextPid")]
        getter dvb_teletext_pid : Int32?

        # When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to partitions 3 and 4. The
        # interval between these additional markers will be fixed, and will be slightly shorter than the video
        # EBP marker interval. When set to VIDEO_INTERVAL, these additional markers will not be inserted. Only
        # applicable when EBP segmentation markers are is selected (segmentationMarkers is EBP or EBP_LEGACY).

        @[JSON::Field(key: "ebpAudioInterval")]
        getter ebp_audio_interval : String?

        # Selects which PIDs to place EBP markers on. They can either be placed only on the video PID, or on
        # both the video PID and all audio PIDs. Only applicable when EBP segmentation markers are is selected
        # (segmentationMarkers is EBP or EBP_LEGACY).

        @[JSON::Field(key: "ebpPlacement")]
        getter ebp_placement : String?

        # Controls whether to include the ES Rate field in the PES header.

        @[JSON::Field(key: "esRateInPes")]
        getter es_rate_in_pes : String?

        # Keep the default value unless you know that your audio EBP markers are incorrectly appearing before
        # your video EBP markers. To correct this problem, set this value to Force.

        @[JSON::Field(key: "forceTsVideoEbpOrder")]
        getter force_ts_video_ebp_order : String?

        # The length, in seconds, of each fragment. Only used with EBP markers.

        @[JSON::Field(key: "fragmentTime")]
        getter fragment_time : Float64?

        # To include key-length-value metadata in this output: Set KLV metadata insertion to Passthrough.
        # MediaConvert reads KLV metadata present in your input and passes it through to the output transport
        # stream. To exclude this KLV metadata: Set KLV metadata insertion to None or leave blank.

        @[JSON::Field(key: "klvMetadata")]
        getter klv_metadata : String?

        # Specify the maximum time, in milliseconds, between Program Clock References (PCRs) inserted into the
        # transport stream.

        @[JSON::Field(key: "maxPcrInterval")]
        getter max_pcr_interval : Int32?

        # When set, enforces that Encoder Boundary Points do not come within the specified time interval of
        # each other by looking ahead at input video. If another EBP is going to come in within the specified
        # time interval, the current EBP is not emitted, and the segment is "stretched" to the next marker.
        # The lookahead value does not add latency to the system. The Live Event must be configured elsewhere
        # to create sufficient latency to make the lookahead accurate.

        @[JSON::Field(key: "minEbpInterval")]
        getter min_ebp_interval : Int32?

        # If INSERT, Nielsen inaudible tones for media tracking will be detected in the input audio and an
        # equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3")]
        getter nielsen_id3 : String?

        # Value in bits per second of extra null packets to insert into the transport stream. This can be used
        # if a downstream encryption system requires periodic null packets.

        @[JSON::Field(key: "nullPacketBitrate")]
        getter null_packet_bitrate : Float64?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "patInterval")]
        getter pat_interval : Int32?

        # When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is inserted for every Packetized
        # Elementary Stream (PES) header. This is effective only when the PCR PID is the same as the video or
        # audio elementary stream.

        @[JSON::Field(key: "pcrControl")]
        getter pcr_control : String?

        # Specify the packet identifier (PID) for the program clock reference (PCR) in this output. If you do
        # not specify a value, the service will use the value for Video PID.

        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : Int32?

        # Specify the number of milliseconds between instances of the program map table (PMT) in the output
        # transport stream.

        @[JSON::Field(key: "pmtInterval")]
        getter pmt_interval : Int32?

        # Specify the packet identifier (PID) for the program map table (PMT) itself. Default is 480.

        @[JSON::Field(key: "pmtPid")]
        getter pmt_pid : Int32?

        # Specify whether MediaConvert automatically attempts to prevent decoder buffer underflows in your
        # transport stream output. Use if you are seeing decoder buffer underflows in your output and are
        # unable to increase your transport stream's bitrate. For most workflows: We recommend that you keep
        # the default value, Disabled. To prevent decoder buffer underflows in your output, when possible:
        # Choose Enabled. Note that if MediaConvert prevents a decoder buffer underflow in your output, output
        # video quality is reduced and your job will take longer to complete.

        @[JSON::Field(key: "preventBufferUnderflow")]
        getter prevent_buffer_underflow : String?

        # Specify the packet identifier (PID) of the private metadata stream. Default is 503.

        @[JSON::Field(key: "privateMetadataPid")]
        getter private_metadata_pid : Int32?

        # Use Program number to specify the program number used in the program map table (PMT) for this
        # output. Default is 1. Program numbers and program map tables are parts of MPEG-2 transport stream
        # containers, used for organizing data.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32?

        # Manually specify the initial PTS offset, in seconds, when you set PTS offset to Seconds. Enter an
        # integer from 0 to 3600. Leave blank to keep the default value 2.

        @[JSON::Field(key: "ptsOffset")]
        getter pts_offset : Int32?

        # Specify the initial presentation timestamp (PTS) offset for your transport stream output. To let
        # MediaConvert automatically determine the initial PTS offset: Keep the default value, Auto. We
        # recommend that you choose Auto for the widest player compatibility. The initial PTS will be at least
        # two seconds and vary depending on your output's bitrate, HRD buffer size and HRD buffer initial fill
        # percentage. To manually specify an initial PTS offset: Choose Seconds or Milliseconds. Then specify
        # the number of seconds or milliseconds with PTS offset.

        @[JSON::Field(key: "ptsOffsetMode")]
        getter pts_offset_mode : String?

        # When set to CBR, inserts null packets into transport stream to fill specified bitrate. When set to
        # VBR, the bitrate setting acts as the maximum bitrate, but the output will not be padded up to that
        # bitrate.

        @[JSON::Field(key: "rateMode")]
        getter rate_mode : String?

        # Include this in your job settings to put SCTE-35 markers in your HLS and transport stream outputs at
        # the insertion points that you specify in an ESAM XML document. Provide the document in the setting
        # SCC XML.

        @[JSON::Field(key: "scte35Esam")]
        getter scte35_esam : Types::M2tsScte35Esam?

        # Specify the packet identifier (PID) of the SCTE-35 stream in the transport stream.

        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : Int32?

        # For SCTE-35 markers from your input-- Choose Passthrough if you want SCTE-35 markers that appear in
        # your input to also appear in this output. Choose None if you don't want SCTE-35 markers in this
        # output. For SCTE-35 markers from an ESAM XML document-- Choose None. Also provide the ESAM XML as a
        # string in the setting Signal processing notification XML. Also enable ESAM SCTE-35 (include the
        # property scte35Esam).

        @[JSON::Field(key: "scte35Source")]
        getter scte35_source : String?

        # Inserts segmentation markers at each segmentation_time period. rai_segstart sets the Random Access
        # Indicator bit in the adaptation field. rai_adapt sets the RAI bit and adds the current timecode in
        # the private data bytes. psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds
        # Encoder Boundary Point information to the adaptation field as per OpenCable specification
        # OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point information to the adaptation field
        # using a legacy proprietary format.

        @[JSON::Field(key: "segmentationMarkers")]
        getter segmentation_markers : String?

        # The segmentation style parameter controls how segmentation markers are inserted into the transport
        # stream. With avails, it is possible that segments may be truncated, which can influence where future
        # segmentation markers are inserted. When a segmentation style of "reset_cadence" is selected and a
        # segment is truncated due to an avail, we will reset the segmentation cadence. This means the
        # subsequent segment will have a duration of of $segmentation_time seconds. When a segmentation style
        # of "maintain_cadence" is selected and a segment is truncated due to an avail, we will not reset the
        # segmentation cadence. This means the subsequent segment will likely be truncated as well. However,
        # all segments after that will have a duration of $segmentation_time seconds. Note that EBP lookahead
        # is a slight exception to this rule.

        @[JSON::Field(key: "segmentationStyle")]
        getter segmentation_style : String?

        # Specify the length, in seconds, of each segment. Required unless markers is set to _none_.

        @[JSON::Field(key: "segmentationTime")]
        getter segmentation_time : Float64?

        # Packet Identifier (PID) of the ID3 metadata stream in the transport stream.

        @[JSON::Field(key: "timedMetadataPid")]
        getter timed_metadata_pid : Int32?

        # Specify the ID for the transport stream itself in the program map table for this output. Transport
        # stream IDs and program map tables are parts of MPEG-2 transport stream containers, used for
        # organizing data.

        @[JSON::Field(key: "transportStreamId")]
        getter transport_stream_id : Int32?

        # Specify the packet identifier (PID) of the elementary video stream in the transport stream.

        @[JSON::Field(key: "videoPid")]
        getter video_pid : Int32?

        def initialize(
          @audio_buffer_model : String? = nil,
          @audio_duration : String? = nil,
          @audio_frames_per_pes : Int32? = nil,
          @audio_pids : Array(Int32)? = nil,
          @audio_pts_offset_delta : Int32? = nil,
          @bitrate : Int32? = nil,
          @buffer_model : String? = nil,
          @data_pts_control : String? = nil,
          @dvb_nit_settings : Types::DvbNitSettings? = nil,
          @dvb_sdt_settings : Types::DvbSdtSettings? = nil,
          @dvb_sub_pids : Array(Int32)? = nil,
          @dvb_tdt_settings : Types::DvbTdtSettings? = nil,
          @dvb_teletext_pid : Int32? = nil,
          @ebp_audio_interval : String? = nil,
          @ebp_placement : String? = nil,
          @es_rate_in_pes : String? = nil,
          @force_ts_video_ebp_order : String? = nil,
          @fragment_time : Float64? = nil,
          @klv_metadata : String? = nil,
          @max_pcr_interval : Int32? = nil,
          @min_ebp_interval : Int32? = nil,
          @nielsen_id3 : String? = nil,
          @null_packet_bitrate : Float64? = nil,
          @pat_interval : Int32? = nil,
          @pcr_control : String? = nil,
          @pcr_pid : Int32? = nil,
          @pmt_interval : Int32? = nil,
          @pmt_pid : Int32? = nil,
          @prevent_buffer_underflow : String? = nil,
          @private_metadata_pid : Int32? = nil,
          @program_number : Int32? = nil,
          @pts_offset : Int32? = nil,
          @pts_offset_mode : String? = nil,
          @rate_mode : String? = nil,
          @scte35_esam : Types::M2tsScte35Esam? = nil,
          @scte35_pid : Int32? = nil,
          @scte35_source : String? = nil,
          @segmentation_markers : String? = nil,
          @segmentation_style : String? = nil,
          @segmentation_time : Float64? = nil,
          @timed_metadata_pid : Int32? = nil,
          @transport_stream_id : Int32? = nil,
          @video_pid : Int32? = nil
        )
        end
      end

      # These settings relate to the MPEG-2 transport stream (MPEG2-TS) container for the MPEG2-TS segments
      # in your HLS outputs.

      struct M3u8Settings
        include JSON::Serializable

        # Specify this setting only when your output will be consumed by a downstream repackaging workflow
        # that is sensitive to very small duration differences between video and audio. For this situation,
        # choose Match video duration. In all other cases, keep the default value, Default codec duration.
        # When you choose Match video duration, MediaConvert pads the output audio streams with silence or
        # trims them to ensure that the total duration of each audio stream is at least as long as the total
        # duration of the video stream. After padding or trimming, the audio stream duration is no more than
        # one frame longer than the video stream. MediaConvert applies audio padding or trimming only to the
        # end of the last segment of the output. For unsegmented outputs, MediaConvert adds padding only to
        # the end of the file. When you keep the default value, any minor discrepancies between audio and
        # video duration will depend on your output audio codec.

        @[JSON::Field(key: "audioDuration")]
        getter audio_duration : String?

        # The number of audio frames to insert for each PES packet.

        @[JSON::Field(key: "audioFramesPerPes")]
        getter audio_frames_per_pes : Int32?

        # Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values
        # are accepted, and can be entered in ranges and/or by comma separation.

        @[JSON::Field(key: "audioPids")]
        getter audio_pids : Array(Int32)?

        # Manually specify the difference in PTS offset that will be applied to the audio track, in seconds or
        # milliseconds, when you set PTS offset to Seconds or Milliseconds. Enter an integer from -10000 to
        # 10000. Leave blank to keep the default value 0.

        @[JSON::Field(key: "audioPtsOffsetDelta")]
        getter audio_pts_offset_delta : Int32?

        # If you select ALIGN_TO_VIDEO, MediaConvert writes captions and data packets with Presentation
        # Timestamp (PTS) values greater than or equal to the first video packet PTS (MediaConvert drops
        # captions and data packets with lesser PTS values). Keep the default value AUTO to allow all PTS
        # values.

        @[JSON::Field(key: "dataPTSControl")]
        getter data_pts_control : String?

        # Specify the maximum time, in milliseconds, between Program Clock References (PCRs) inserted into the
        # transport stream.

        @[JSON::Field(key: "maxPcrInterval")]
        getter max_pcr_interval : Int32?

        # If INSERT, Nielsen inaudible tones for media tracking will be detected in the input audio and an
        # equivalent ID3 tag will be inserted in the output.

        @[JSON::Field(key: "nielsenId3")]
        getter nielsen_id3 : String?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "patInterval")]
        getter pat_interval : Int32?

        # When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted for every Packetized
        # Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the
        # video or audio elementary stream.

        @[JSON::Field(key: "pcrControl")]
        getter pcr_control : String?

        # Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value
        # is given, the encoder will assign the same value as the Video PID.

        @[JSON::Field(key: "pcrPid")]
        getter pcr_pid : Int32?

        # The number of milliseconds between instances of this table in the output transport stream.

        @[JSON::Field(key: "pmtInterval")]
        getter pmt_interval : Int32?

        # Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream.

        @[JSON::Field(key: "pmtPid")]
        getter pmt_pid : Int32?

        # Packet Identifier (PID) of the private metadata stream in the transport stream.

        @[JSON::Field(key: "privateMetadataPid")]
        getter private_metadata_pid : Int32?

        # The value of the program number field in the Program Map Table.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32?

        # Manually specify the initial PTS offset, in seconds, when you set PTS offset to Seconds. Enter an
        # integer from 0 to 3600. Leave blank to keep the default value 2.

        @[JSON::Field(key: "ptsOffset")]
        getter pts_offset : Int32?

        # Specify the initial presentation timestamp (PTS) offset for your transport stream output. To let
        # MediaConvert automatically determine the initial PTS offset: Keep the default value, Auto. We
        # recommend that you choose Auto for the widest player compatibility. The initial PTS will be at least
        # two seconds and vary depending on your output's bitrate, HRD buffer size and HRD buffer initial fill
        # percentage. To manually specify an initial PTS offset: Choose Seconds or Milliseconds. Then specify
        # the number of seconds or milliseconds with PTS offset.

        @[JSON::Field(key: "ptsOffsetMode")]
        getter pts_offset_mode : String?

        # Packet Identifier (PID) of the SCTE-35 stream in the transport stream.

        @[JSON::Field(key: "scte35Pid")]
        getter scte35_pid : Int32?

        # For SCTE-35 markers from your input-- Choose Passthrough if you want SCTE-35 markers that appear in
        # your input to also appear in this output. Choose None if you don't want SCTE-35 markers in this
        # output. For SCTE-35 markers from an ESAM XML document-- Choose None if you don't want manifest
        # conditioning. Choose Passthrough and choose Ad markers if you do want manifest conditioning. In both
        # cases, also provide the ESAM XML as a string in the setting Signal processing notification XML.

        @[JSON::Field(key: "scte35Source")]
        getter scte35_source : String?

        # Set ID3 metadata to Passthrough to include ID3 metadata in this output. This includes ID3 metadata
        # from the following features: ID3 timestamp period, and Custom ID3 metadata inserter. To exclude this
        # ID3 metadata in this output: set ID3 metadata to None or leave blank.

        @[JSON::Field(key: "timedMetadata")]
        getter timed_metadata : String?

        # Packet Identifier (PID) of the ID3 metadata stream in the transport stream.

        @[JSON::Field(key: "timedMetadataPid")]
        getter timed_metadata_pid : Int32?

        # The value of the transport stream ID field in the Program Map Table.

        @[JSON::Field(key: "transportStreamId")]
        getter transport_stream_id : Int32?

        # Packet Identifier (PID) of the elementary video stream in the transport stream.

        @[JSON::Field(key: "videoPid")]
        getter video_pid : Int32?

        def initialize(
          @audio_duration : String? = nil,
          @audio_frames_per_pes : Int32? = nil,
          @audio_pids : Array(Int32)? = nil,
          @audio_pts_offset_delta : Int32? = nil,
          @data_pts_control : String? = nil,
          @max_pcr_interval : Int32? = nil,
          @nielsen_id3 : String? = nil,
          @pat_interval : Int32? = nil,
          @pcr_control : String? = nil,
          @pcr_pid : Int32? = nil,
          @pmt_interval : Int32? = nil,
          @pmt_pid : Int32? = nil,
          @private_metadata_pid : Int32? = nil,
          @program_number : Int32? = nil,
          @pts_offset : Int32? = nil,
          @pts_offset_mode : String? = nil,
          @scte35_pid : Int32? = nil,
          @scte35_source : String? = nil,
          @timed_metadata : String? = nil,
          @timed_metadata_pid : Int32? = nil,
          @transport_stream_id : Int32? = nil,
          @video_pid : Int32? = nil
        )
        end
      end

      # Metadata and other file information.

      struct Metadata
        include JSON::Serializable

        # The entity tag (ETag) of the file.

        @[JSON::Field(key: "eTag")]
        getter e_tag : String?

        # The size of the media file, in bytes.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int64?

        # The last modification timestamp of the media file, in Unix time.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?

        # The MIME type of the media file.

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String?

        def initialize(
          @e_tag : String? = nil,
          @file_size : Int64? = nil,
          @last_modified : Time? = nil,
          @mime_type : String? = nil
        )
        end
      end

      # Use Min bottom rendition size to specify a minimum size for the lowest resolution in your ABR stack.
      # * The lowest resolution in your ABR stack will be equal to or greater than the value that you enter.
      # For example: If you specify 640x360 the lowest resolution in your ABR stack will be equal to or
      # greater than to 640x360. * If you specify a Min top rendition size rule, the value that you specify
      # for Min bottom rendition size must be less than, or equal to, Min top rendition size.

      struct MinBottomRenditionSize
        include JSON::Serializable

        # Use Height to define the video resolution height, in pixels, for this rule.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Use Width to define the video resolution width, in pixels, for this rule.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @height : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Use Min top rendition size to specify a minimum size for the highest resolution in your ABR stack. *
      # The highest resolution in your ABR stack will be equal to or greater than the value that you enter.
      # For example: If you specify 1280x720 the highest resolution in your ABR stack will be equal to or
      # greater than 1280x720. * If you specify a value for Max resolution, the value that you specify for
      # Min top rendition size must be less than, or equal to, Max resolution.

      struct MinTopRenditionSize
        include JSON::Serializable

        # Use Height to define the video resolution height, in pixels, for this rule.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Use Width to define the video resolution width, in pixels, for this rule.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @height : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Overlay motion graphics on top of your video. The motion graphics that you specify here appear on
      # all outputs in all output groups. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/motion-graphic-overlay.html.

      struct MotionImageInserter
        include JSON::Serializable

        # If your motion graphic asset is a .mov file, keep this setting unspecified. If your motion graphic
        # asset is a series of .png files, specify the frame rate of the overlay in frames per second, as a
        # fraction. For example, specify 24 fps as 24/1. Make sure that the number of images in your series
        # matches the frame rate and your intended overlay duration. For example, if you want a 30-second
        # overlay at 30 fps, you should have 900 .png images. This overlay frame rate doesn't need to match
        # the frame rate of the underlying video.

        @[JSON::Field(key: "framerate")]
        getter framerate : Types::MotionImageInsertionFramerate?

        # Specify the .mov file or series of .png files that you want to overlay on your video. For .png
        # files, provide the file name of the first file in the series. Make sure that the names of the .png
        # files end with sequential numbers that specify the order that they are played in. For example,
        # overlay_000.png, overlay_001.png, overlay_002.png, and so on. The sequence must start at zero, and
        # each image file name must have the same number of digits. Pad your initial file names with enough
        # zeros to complete the sequence. For example, if the first image is overlay_0.png, there can be only
        # 10 images in the sequence, with the last image being overlay_9.png. But if the first image is
        # overlay_00.png, there can be 100 images in the sequence.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Choose the type of motion graphic asset that you are providing for your overlay. You can choose
        # either a .mov file or a series of .png files.

        @[JSON::Field(key: "insertionMode")]
        getter insertion_mode : String?

        # Use Offset to specify the placement of your motion graphic overlay on the video frame. Specify in
        # pixels, from the upper-left corner of the frame. If you don't specify an offset, the service scales
        # your overlay to the full size of the frame. Otherwise, the service inserts the overlay at its native
        # resolution and scales the size up or down with any video scaling.

        @[JSON::Field(key: "offset")]
        getter offset : Types::MotionImageInsertionOffset?

        # Specify whether your motion graphic overlay repeats on a loop or plays only once.

        @[JSON::Field(key: "playback")]
        getter playback : String?

        # Specify when the motion overlay begins. Use timecode format (HH:MM:SS:FF or HH:MM:SS;FF). Make sure
        # that the timecode you provide here takes into account how you have set up your timecode
        # configuration under both job settings and input settings. The simplest way to do that is to set both
        # to start at 0. If you need to set up your job to follow timecodes embedded in your source that don't
        # start at zero, make sure that you specify a start time that is after the first embedded timecode.
        # For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/setting-up-timecode.html

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        def initialize(
          @framerate : Types::MotionImageInsertionFramerate? = nil,
          @input : String? = nil,
          @insertion_mode : String? = nil,
          @offset : Types::MotionImageInsertionOffset? = nil,
          @playback : String? = nil,
          @start_time : String? = nil
        )
        end
      end

      # For motion overlays that don't have a built-in frame rate, specify the frame rate of the overlay in
      # frames per second, as a fraction. For example, specify 24 fps as 24/1. The overlay frame rate
      # doesn't need to match the frame rate of the underlying video.

      struct MotionImageInsertionFramerate
        include JSON::Serializable

        # The bottom of the fraction that expresses your overlay frame rate. For example, if your frame rate
        # is 24 fps, set this value to 1.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # The top of the fraction that expresses your overlay frame rate. For example, if your frame rate is
        # 24 fps, set this value to 24.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        def initialize(
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil
        )
        end
      end

      # Specify the offset between the upper-left corner of the video frame and the top left corner of the
      # overlay.

      struct MotionImageInsertionOffset
        include JSON::Serializable

        # Set the distance, in pixels, between the overlay and the left edge of the video frame.

        @[JSON::Field(key: "imageX")]
        getter image_x : Int32?

        # Set the distance, in pixels, between the overlay and the top edge of the video frame.

        @[JSON::Field(key: "imageY")]
        getter image_y : Int32?

        def initialize(
          @image_x : Int32? = nil,
          @image_y : Int32? = nil
        )
        end
      end

      # These settings relate to your QuickTime MOV output container.

      struct MovSettings
        include JSON::Serializable

        # When enabled, include 'clap' atom if appropriate for the video output settings.

        @[JSON::Field(key: "clapAtom")]
        getter clap_atom : String?

        # When enabled, file composition times will start at zero, composition times in the 'ctts'
        # (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift
        # least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple
        # players and tools.

        @[JSON::Field(key: "cslgAtom")]
        getter cslg_atom : String?

        # When set to XDCAM, writes MPEG2 video streams into the QuickTime file using XDCAM fourcc codes. This
        # increases compatibility with Apple editors and players, but may decrease compatibility with other
        # players. Only applicable when the video codec is MPEG2.

        @[JSON::Field(key: "mpeg2FourCCControl")]
        getter mpeg2_four_cc_control : String?

        # Unless you need Omneon compatibility: Keep the default value, None. To make this output compatible
        # with Omneon: Choose Omneon. When you do, MediaConvert increases the length of the 'elst' edit list
        # atom. Note that this might cause file rejections when a recipient of the output file doesn't expect
        # this extra padding.

        @[JSON::Field(key: "paddingControl")]
        getter padding_control : String?

        # Always keep the default value (SELF_CONTAINED) for this setting.

        @[JSON::Field(key: "reference")]
        getter reference : String?

        def initialize(
          @clap_atom : String? = nil,
          @cslg_atom : String? = nil,
          @mpeg2_four_cc_control : String? = nil,
          @padding_control : String? = nil,
          @reference : String? = nil
        )
        end
      end

      # Required when you set Codec to the value MP2.

      struct Mp2Settings
        include JSON::Serializable

        # Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio + audio description (AD) as
        # a stereo pair. The value for AudioType will be set to 3, which signals to downstream systems that
        # this stream contains "broadcaster mixed AD". Note that the input received by the encoder must
        # contain pre-mixed audio; the encoder does not perform the mixing. When you choose
        # BROADCASTER_MIXED_AD, the encoder ignores any values you provide in AudioType and
        # FollowInputAudioType. Choose NONE when the input does not contain pre-mixed audio + audio
        # description (AD). In this case, the encoder will use any values you provide for AudioType and
        # FollowInputAudioType.

        @[JSON::Field(key: "audioDescriptionMix")]
        getter audio_description_mix : String?

        # Specify the average bitrate in bits per second.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Set Channels to specify the number of channels in this output audio track. Choosing Mono in will
        # give you 1 output channel; choosing Stereo will give you 2. In the API, valid values are 1 and 2.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @audio_description_mix : String? = nil,
          @bitrate : Int32? = nil,
          @channels : Int32? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value MP3.

      struct Mp3Settings
        include JSON::Serializable

        # Specify the average bitrate in bits per second.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the number of channels in this output audio track. Choosing Mono gives you 1 output channel;
        # choosing Stereo gives you 2. In the API, valid values are 1 and 2.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Specify whether the service encodes this MP3 audio output with a constant bitrate (CBR) or a
        # variable bitrate (VBR).

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Required when you set Bitrate control mode to VBR. Specify the audio quality of this MP3 output from
        # 0 (highest quality) to 9 (lowest quality).

        @[JSON::Field(key: "vbrQuality")]
        getter vbr_quality : Int32?

        def initialize(
          @bitrate : Int32? = nil,
          @channels : Int32? = nil,
          @rate_control_mode : String? = nil,
          @sample_rate : Int32? = nil,
          @vbr_quality : Int32? = nil
        )
        end
      end

      # These settings relate to your MP4 output container. You can create audio only outputs with this
      # container. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/supported-codecs-containers-audio-only.html#output-codecs-and-containers-supported-for-audio-only.

      struct Mp4Settings
        include JSON::Serializable

        # Specify this setting only when your output will be consumed by a downstream repackaging workflow
        # that is sensitive to very small duration differences between video and audio. For this situation,
        # choose Match video duration. In all other cases, keep the default value, Default codec duration.
        # When you choose Match video duration, MediaConvert pads the output audio streams with silence or
        # trims them to ensure that the total duration of each audio stream is at least as long as the total
        # duration of the video stream. After padding or trimming, the audio stream duration is no more than
        # one frame longer than the video stream. MediaConvert applies audio padding or trimming only to the
        # end of the last segment of the output. For unsegmented outputs, MediaConvert adds padding only to
        # the end of the file. When you keep the default value, any minor discrepancies between audio and
        # video duration will depend on your output audio codec.

        @[JSON::Field(key: "audioDuration")]
        getter audio_duration : String?

        # When enabled, a C2PA compliant manifest will be generated, signed and embeded in the output. For
        # more information on C2PA, see https://c2pa.org/specifications/specifications/2.1/index.html

        @[JSON::Field(key: "c2paManifest")]
        getter c2pa_manifest : String?

        # Specify the name or ARN of the AWS Secrets Manager secret that contains your C2PA public certificate
        # chain in PEM format. Provide a valid secret name or ARN. Note that your MediaConvert service role
        # must allow access to this secret. The public certificate chain is added to the COSE header (x5chain)
        # for signature validation. Include the signer's certificate and all intermediate certificates. Do not
        # include the root certificate. For details on COSE, see:
        # https://opensource.contentauthenticity.org/docs/manifest/signing-manifests

        @[JSON::Field(key: "certificateSecret")]
        getter certificate_secret : String?

        # When enabled, file composition times will start at zero, composition times in the 'ctts'
        # (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift
        # least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple
        # players and tools.

        @[JSON::Field(key: "cslgAtom")]
        getter cslg_atom : String?

        # Ignore this setting unless compliance to the CTTS box version specification matters in your
        # workflow. Specify a value of 1 to set your CTTS box version to 1 and make your output compliant with
        # the specification. When you specify a value of 1, you must also set CSLG atom to the value INCLUDE.
        # Keep the default value 0 to set your CTTS box version to 0. This can provide backward compatibility
        # for some players and packagers.

        @[JSON::Field(key: "cttsVersion")]
        getter ctts_version : Int32?

        # Inserts a free-space box immediately after the moov box.

        @[JSON::Field(key: "freeSpaceBox")]
        getter free_space_box : String?

        # To place the MOOV atom at the beginning of your output, which is useful for progressive downloading:
        # Leave blank or choose Progressive download. To place the MOOV at the end of your output: Choose
        # Normal.

        @[JSON::Field(key: "moovPlacement")]
        getter moov_placement : String?

        # Overrides the "Major Brand" field in the output file. Usually not necessary to specify.

        @[JSON::Field(key: "mp4MajorBrand")]
        getter mp4_major_brand : String?

        # Specify the ID or ARN of the AWS KMS key used to sign the C2PA manifest in your MP4 output. Provide
        # a valid KMS key ARN. Note that your MediaConvert service role must allow access to this key.

        @[JSON::Field(key: "signingKmsKey")]
        getter signing_kms_key : String?

        def initialize(
          @audio_duration : String? = nil,
          @c2pa_manifest : String? = nil,
          @certificate_secret : String? = nil,
          @cslg_atom : String? = nil,
          @ctts_version : Int32? = nil,
          @free_space_box : String? = nil,
          @moov_placement : String? = nil,
          @mp4_major_brand : String? = nil,
          @signing_kms_key : String? = nil
        )
        end
      end

      # These settings relate to the fragmented MP4 container for the segments in your DASH outputs.

      struct MpdSettings
        include JSON::Serializable

        # Optional. Choose Include to have MediaConvert mark up your DASH manifest with elements for embedded
        # 608 captions. This markup isn't generally required, but some video players require it to discover
        # and play embedded 608 captions. Keep the default value, Exclude, to leave these elements out. When
        # you enable this setting, this is the markup that MediaConvert includes in your manifest:

        @[JSON::Field(key: "accessibilityCaptionHints")]
        getter accessibility_caption_hints : String?

        # Specify this setting only when your output will be consumed by a downstream repackaging workflow
        # that is sensitive to very small duration differences between video and audio. For this situation,
        # choose Match video duration. In all other cases, keep the default value, Default codec duration.
        # When you choose Match video duration, MediaConvert pads the output audio streams with silence or
        # trims them to ensure that the total duration of each audio stream is at least as long as the total
        # duration of the video stream. After padding or trimming, the audio stream duration is no more than
        # one frame longer than the video stream. MediaConvert applies audio padding or trimming only to the
        # end of the last segment of the output. For unsegmented outputs, MediaConvert adds padding only to
        # the end of the file. When you keep the default value, any minor discrepancies between audio and
        # video duration will depend on your output audio codec.

        @[JSON::Field(key: "audioDuration")]
        getter audio_duration : String?

        # When enabled, a C2PA compliant manifest will be generated, signed and embeded in the output. For
        # more information on C2PA, see https://c2pa.org/specifications/specifications/2.1/index.html

        @[JSON::Field(key: "c2paManifest")]
        getter c2pa_manifest : String?

        # Use this setting only in DASH output groups that include sidecar TTML, IMSC or WEBVTT captions. You
        # specify sidecar captions in a separate output from your audio and video. Choose Raw for captions in
        # a single XML file in a raw container. Choose Fragmented MPEG-4 for captions in XML format contained
        # within fragmented MP4 files. This set of fragmented MP4 files is separate from your video and audio
        # fragmented MP4 files.

        @[JSON::Field(key: "captionContainerType")]
        getter caption_container_type : String?

        # Specify the name or ARN of the AWS Secrets Manager secret that contains your C2PA public certificate
        # chain in PEM format. Provide a valid secret name or ARN. Note that your MediaConvert service role
        # must allow access to this secret. The public certificate chain is added to the COSE header (x5chain)
        # for signature validation. Include the signer's certificate and all intermediate certificates. Do not
        # include the root certificate. For details on COSE, see:
        # https://opensource.contentauthenticity.org/docs/manifest/signing-manifests

        @[JSON::Field(key: "certificateSecret")]
        getter certificate_secret : String?

        # To include key-length-value metadata in this output: Set KLV metadata insertion to Passthrough.
        # MediaConvert reads KLV metadata present in your input and writes each instance to a separate event
        # message box in the output, according to MISB ST1910.1. To exclude this KLV metadata: Set KLV
        # metadata insertion to None or leave blank.

        @[JSON::Field(key: "klvMetadata")]
        getter klv_metadata : String?

        # To add an InbandEventStream element in your output MPD manifest for each type of event message, set
        # Manifest metadata signaling to Enabled. For ID3 event messages, the InbandEventStream element
        # schemeIdUri will be same value that you specify for ID3 metadata scheme ID URI. For SCTE35 event
        # messages, the InbandEventStream element schemeIdUri will be "urn:scte:scte35:2013:bin". To leave
        # these elements out of your output MPD manifest, set Manifest metadata signaling to Disabled. To
        # enable Manifest metadata signaling, you must also set SCTE-35 source to Passthrough, ESAM SCTE-35 to
        # insert, or ID3 metadata to Passthrough.

        @[JSON::Field(key: "manifestMetadataSignaling")]
        getter manifest_metadata_signaling : String?

        # Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35
        # markers in this output at the insertion points that you specify in an ESAM XML document. Provide the
        # document in the setting SCC XML.

        @[JSON::Field(key: "scte35Esam")]
        getter scte35_esam : String?

        # Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough if
        # you want SCTE-35 markers that appear in your input to also appear in this output. Choose None if you
        # don't want those SCTE-35 markers in this output.

        @[JSON::Field(key: "scte35Source")]
        getter scte35_source : String?

        # Specify the ID or ARN of the AWS KMS key used to sign the C2PA manifest in your MP4 output. Provide
        # a valid KMS key ARN. Note that your MediaConvert service role must allow access to this key.

        @[JSON::Field(key: "signingKmsKey")]
        getter signing_kms_key : String?

        # To include ID3 metadata in this output: Set ID3 metadata to Passthrough. Specify this ID3 metadata
        # in Custom ID3 metadata inserter. MediaConvert writes each instance of ID3 metadata in a separate
        # Event Message (eMSG) box. To exclude this ID3 metadata: Set ID3 metadata to None or leave blank.

        @[JSON::Field(key: "timedMetadata")]
        getter timed_metadata : String?

        # Specify the event message box (eMSG) version for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.3 Syntax. Leave blank to use the default
        # value Version 0. When you specify Version 1, you must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataBoxVersion")]
        getter timed_metadata_box_version : String?

        # Specify the event message box (eMSG) scheme ID URI for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.4 Semantics. Leave blank to use the default
        # value: https://aomedia.org/emsg/ID3 When you specify a value for ID3 metadata scheme ID URI, you
        # must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataSchemeIdUri")]
        getter timed_metadata_scheme_id_uri : String?

        # Specify the event message box (eMSG) value for ID3 timed metadata in your output. For more
        # information, see ISO/IEC 23009-1:2022 section 5.10.3.3.4 Semantics. When you specify a value for ID3
        # Metadata Value, you must also set ID3 metadata to Passthrough.

        @[JSON::Field(key: "timedMetadataValue")]
        getter timed_metadata_value : String?

        def initialize(
          @accessibility_caption_hints : String? = nil,
          @audio_duration : String? = nil,
          @c2pa_manifest : String? = nil,
          @caption_container_type : String? = nil,
          @certificate_secret : String? = nil,
          @klv_metadata : String? = nil,
          @manifest_metadata_signaling : String? = nil,
          @scte35_esam : String? = nil,
          @scte35_source : String? = nil,
          @signing_kms_key : String? = nil,
          @timed_metadata : String? = nil,
          @timed_metadata_box_version : String? = nil,
          @timed_metadata_scheme_id_uri : String? = nil,
          @timed_metadata_value : String? = nil
        )
        end
      end

      # Required when you set Codec to the value MPEG2.

      struct Mpeg2Settings
        include JSON::Serializable

        # Specify the strength of any adaptive quantization filters that you enable. The value that you choose
        # here applies to the following settings: Spatial adaptive quantization, and Temporal adaptive
        # quantization.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs,
        # bitrates must be unique when rounded down to the nearest multiple of 1000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Use Level to set the MPEG-2 level for the video output.

        @[JSON::Field(key: "codecLevel")]
        getter codec_level : String?

        # Use Profile to set the MPEG-2 profile for the video output.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # Choose Adaptive to improve subjective video quality for high-motion content. This will cause the
        # service to use fewer B-frames (which infer information based on other frames) for high-motion
        # portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is
        # limited by the value you provide for the setting B frames between reference frames.

        @[JSON::Field(key: "dynamicSubGop")]
        getter dynamic_sub_gop : String?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Specify the relative frequency of open to closed GOPs in this output. For example, if you want to
        # allow four open GOPs and then require a closed GOP, set this value to 5. When you create a streaming
        # output, we recommend that you keep the default value, 1, so that players starting mid-stream receive
        # an IDR frame as quickly as possible. Don't set this value to 0; that would break output segmenting.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Specify the interval between keyframes, in seconds or frames, for this output. Default: 12 Related
        # settings: When you specify the GOP size in seconds, set GOP mode control to Specified, seconds. The
        # default value for GOP mode control is Frames.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Specify the units for GOP size. If you don't specify a value here, by default the encoder measures
        # GOP size in frames.

        @[JSON::Field(key: "gopSizeUnits")]
        getter gop_size_units : String?

        # If your downstream systems have strict buffer requirements: Specify the minimum percentage of the
        # HRD buffer that's available at the end of each encoded video segment. For the best video quality:
        # Set to 0 or leave blank to automatically determine the final buffer fill percentage.

        @[JSON::Field(key: "hrdBufferFinalFillPercentage")]
        getter hrd_buffer_final_fill_percentage : Int32?

        # Percentage of the buffer that should initially be filled (HRD buffer model).

        @[JSON::Field(key: "hrdBufferInitialFillPercentage")]
        getter hrd_buffer_initial_fill_percentage : Int32?

        # Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Use Intra DC precision to set quantization precision for intra-block DC coefficients. If you choose
        # the value auto, the service will automatically select the precision based on the per-frame
        # compression ratio.

        @[JSON::Field(key: "intraDcPrecision")]
        getter intra_dc_precision : String?

        # Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Specify the minimum number of frames allowed between two IDR-frames in your output. This includes
        # frames created at the start of a GOP or a scene change. Use Min I-Interval to improve video
        # compression by varying GOP size when two IDR-frames would be created near each other. For example,
        # if a regular cadence-driven IDR-frame would fall within 5 frames of a scene-change IDR-frame, and
        # you set Min I-interval to 5, then the encoder would only write an IDR-frame for the scene-change. In
        # this way, one GOP is shortened or extended. If a cadence-driven IDR-frame would be further than 5
        # frames from a scene-change IDR-frame, then the encoder leaves all IDR-frames in place. To manually
        # specify an interval: Enter a value from 1 to 30. Use when your downstream systems have specific GOP
        # size requirements. To disable GOP size variance: Enter 0. MediaConvert will only create IDR-frames
        # at the start of your output's cadence-driven GOP. Use when your downstream systems require a regular
        # GOP size.

        @[JSON::Field(key: "minIInterval")]
        getter min_i_interval : Int32?

        # Specify the number of B-frames that MediaConvert puts between reference frames in this output. Valid
        # values are whole numbers from 0 through 7. When you don't specify a value, MediaConvert defaults to
        # 2.

        @[JSON::Field(key: "numberBFramesBetweenReferenceFrames")]
        getter number_b_frames_between_reference_frames : Int32?

        # Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The
        # default behavior, Follow source, uses the PAR from your input video for your output. To specify a
        # different PAR in the console, choose any value other than Follow source. When you choose SPECIFIED
        # for this setting, you must also specify values for the parNumerator and parDenominator settings.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, single-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # Use Rate control mode to specify whether the bitrate is variable (vbr) or constant (cbr).

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Enable this setting to insert I-frames at scene changes that the service automatically detects. This
        # improves video quality and is enabled by default.

        @[JSON::Field(key: "sceneChangeDetect")]
        getter scene_change_detect : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output. When you enable slow PAL, MediaConvert relabels the video frames
        # to 25 fps and resamples your audio to keep it synchronized with the video. Note that enabling this
        # setting will slightly reduce the duration of your video. Required settings: You must also set
        # Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # Ignore this setting unless you need to comply with a specification that requires a specific value.
        # If you don't have a specification requirement, we recommend that you adjust the softness of your
        # output by using a lower value for the setting Sharpness or by enabling a noise reducer filter. The
        # Softness setting specifies the quantization matrices that the encoder uses. Keep the default value,
        # 0, to use the AWS Elemental default matrices. Choose a value from 17 to 128 to use planar
        # interpolation. Increasing values from 17 to 128 result in increasing reduction of high-frequency
        # data. The value 128 results in the softest video.

        @[JSON::Field(key: "softness")]
        getter softness : Int32?

        # Keep the default value, Enabled, to adjust quantization within each frame based on spatial variation
        # of content complexity. When you enable this feature, the encoder uses fewer bits on areas that can
        # sustain more distortion with no noticeable visual degradation and uses more bits on areas where any
        # small distortion will be noticeable. For example, complex textured blocks are encoded with fewer
        # bits and smooth textured blocks are encoded with more bits. Enabling this feature will almost always
        # improve your video quality. Note, though, that this feature doesn't take into account where the
        # viewer's attention is likely to be. If viewers are likely to be focusing their attention on a part
        # of the screen with a lot of complex texture, you might choose to disable this feature. Related
        # setting: When you enable spatial adaptive quantization, set the value for Adaptive quantization
        # depending on your content. For homogeneous content, such as cartoons and video games, set it to Low.
        # For content with a wider variety of textures, set it to High or Higher.

        @[JSON::Field(key: "spatialAdaptiveQuantization")]
        getter spatial_adaptive_quantization : String?

        # Specify whether this output's video uses the D10 syntax. Keep the default value to not use the
        # syntax. Related settings: When you choose D10 for your MXF profile, you must also set this value to
        # D10.

        @[JSON::Field(key: "syntax")]
        getter syntax : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard or soft telecine to create a smoother
        # picture. Hard telecine produces a 29.97i output. Soft telecine produces an output with a 23.976
        # output that signals to the video player device to do the conversion during play back. When you keep
        # the default value, None, MediaConvert does a standard frame rate conversion to 29.97 without doing
        # anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        # Keep the default value, Enabled, to adjust quantization within each frame based on temporal
        # variation of content complexity. When you enable this feature, the encoder uses fewer bits on areas
        # of the frame that aren't moving and uses more bits on complex objects with sharp edges that move a
        # lot. For example, this feature improves the readability of text tickers on newscasts and scoreboards
        # on sports matches. Enabling this feature will almost always improve your video quality. Note,
        # though, that this feature doesn't take into account where the viewer's attention is likely to be. If
        # viewers are likely to be focusing their attention on a part of the screen that doesn't have moving
        # objects with sharp edges, such as sports athletes' faces, you might choose to disable this feature.
        # Related setting: When you enable temporal quantization, adjust the strength of the filter with the
        # setting Adaptive quantization.

        @[JSON::Field(key: "temporalAdaptiveQuantization")]
        getter temporal_adaptive_quantization : String?

        def initialize(
          @adaptive_quantization : String? = nil,
          @bitrate : Int32? = nil,
          @codec_level : String? = nil,
          @codec_profile : String? = nil,
          @dynamic_sub_gop : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_closed_cadence : Int32? = nil,
          @gop_size : Float64? = nil,
          @gop_size_units : String? = nil,
          @hrd_buffer_final_fill_percentage : Int32? = nil,
          @hrd_buffer_initial_fill_percentage : Int32? = nil,
          @hrd_buffer_size : Int32? = nil,
          @interlace_mode : String? = nil,
          @intra_dc_precision : String? = nil,
          @max_bitrate : Int32? = nil,
          @min_i_interval : Int32? = nil,
          @number_b_frames_between_reference_frames : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @quality_tuning_level : String? = nil,
          @rate_control_mode : String? = nil,
          @scan_type_conversion_mode : String? = nil,
          @scene_change_detect : String? = nil,
          @slow_pal : String? = nil,
          @softness : Int32? = nil,
          @spatial_adaptive_quantization : String? = nil,
          @syntax : String? = nil,
          @telecine : String? = nil,
          @temporal_adaptive_quantization : String? = nil
        )
        end
      end

      # Specify the details for each additional Microsoft Smooth Streaming manifest that you want the
      # service to generate for this output group. Each manifest can reference a different subset of outputs
      # in the group.

      struct MsSmoothAdditionalManifest
        include JSON::Serializable

        # Specify a name modifier that the service adds to the name of this manifest to make it different from
        # the file names of the other main manifests in the output group. For example, say that the default
        # main manifest for your Microsoft Smooth group is film-name.ismv. If you enter "-no-premium" for this
        # setting, then the file name the service generates for this top-level manifest is
        # film-name-no-premium.ismv.

        @[JSON::Field(key: "manifestNameModifier")]
        getter manifest_name_modifier : String?

        # Specify the outputs that you want this additional top-level manifest to reference.

        @[JSON::Field(key: "selectedOutputs")]
        getter selected_outputs : Array(String)?

        def initialize(
          @manifest_name_modifier : String? = nil,
          @selected_outputs : Array(String)? = nil
        )
        end
      end

      # If you are using DRM, set DRM System to specify the value SpekeKeyProvider.

      struct MsSmoothEncryptionSettings
        include JSON::Serializable

        # If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM
        # encryption with a SPEKE-compliant key provider. If your output group type is CMAF, use the
        # SpekeKeyProviderCmaf settings instead.

        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider?

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider? = nil
        )
        end
      end

      # Settings related to your Microsoft Smooth Streaming output package. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

      struct MsSmoothGroupSettings
        include JSON::Serializable

        # By default, the service creates one .ism Microsoft Smooth Streaming manifest for each Microsoft
        # Smooth Streaming output group in your job. This default manifest references every output in the
        # output group. To create additional manifests that reference a subset of the outputs in the output
        # group, specify a list of them here.

        @[JSON::Field(key: "additionalManifests")]
        getter additional_manifests : Array(Types::MsSmoothAdditionalManifest)?

        # COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across a Microsoft Smooth
        # output group into a single audio stream.

        @[JSON::Field(key: "audioDeduplication")]
        getter audio_deduplication : String?

        # Use Destination to specify the S3 output location and the output filename base. Destination accepts
        # format identifiers. If you do not specify the base filename in the URI, the service will use the
        # filename of the input file. If your job has multiple inputs, the service uses the filename of the
        # first input file.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # Settings associated with the destination. Will vary based on the type of destination

        @[JSON::Field(key: "destinationSettings")]
        getter destination_settings : Types::DestinationSettings?

        # If you are using DRM, set DRM System to specify the value SpekeKeyProvider.

        @[JSON::Field(key: "encryption")]
        getter encryption : Types::MsSmoothEncryptionSettings?

        # Specify how you want MediaConvert to determine the fragment length. Choose Exact to have the encoder
        # use the exact length that you specify with the setting Fragment length. This might result in extra
        # I-frames. Choose Multiple of GOP to have the encoder round up the segment lengths to match the next
        # GOP boundary.

        @[JSON::Field(key: "fragmentLength")]
        getter fragment_length : Int32?

        # Specify how you want MediaConvert to determine the fragment length. Choose Exact to have the encoder
        # use the exact length that you specify with the setting Fragment length. This might result in extra
        # I-frames. Choose Multiple of GOP to have the encoder round up the segment lengths to match the next
        # GOP boundary.

        @[JSON::Field(key: "fragmentLengthControl")]
        getter fragment_length_control : String?

        # Use Manifest encoding to specify the encoding format for the server and client manifest. Valid
        # options are utf8 and utf16.

        @[JSON::Field(key: "manifestEncoding")]
        getter manifest_encoding : String?

        def initialize(
          @additional_manifests : Array(Types::MsSmoothAdditionalManifest)? = nil,
          @audio_deduplication : String? = nil,
          @destination : String? = nil,
          @destination_settings : Types::DestinationSettings? = nil,
          @encryption : Types::MsSmoothEncryptionSettings? = nil,
          @fragment_length : Int32? = nil,
          @fragment_length_control : String? = nil,
          @manifest_encoding : String? = nil
        )
        end
      end

      # These settings relate to your MXF output container.

      struct MxfSettings
        include JSON::Serializable

        # Optional. When you have AFD signaling set up in your output video stream, use this setting to choose
        # whether to also include it in the MXF wrapper. Choose Don't copy to exclude AFD signaling from the
        # MXF wrapper. Choose Copy from video stream to copy the AFD values from the video stream for this
        # output to the MXF wrapper. Regardless of which option you choose, the AFD values remain in the video
        # stream. Related settings: To set up your output to include or exclude AFD values, see AfdSignaling,
        # under VideoDescription. On the console, find AFD signaling under the output's video encoding
        # settings.

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # Specify the MXF profile, also called shim, for this output. To automatically select a profile
        # according to your output video codec and resolution, leave blank. For a list of codecs supported
        # with each MXF profile, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/codecs-supported-with-each-mxf-profile.html. For
        # more information about the automatic selection behavior, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/default-automatic-selection-of-mxf-profiles.html.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Specify the XAVC profile settings for MXF outputs when you set your MXF profile to XAVC.

        @[JSON::Field(key: "xavcProfileSettings")]
        getter xavc_profile_settings : Types::MxfXavcProfileSettings?

        def initialize(
          @afd_signaling : String? = nil,
          @profile : String? = nil,
          @xavc_profile_settings : Types::MxfXavcProfileSettings? = nil
        )
        end
      end

      # Specify the XAVC profile settings for MXF outputs when you set your MXF profile to XAVC.

      struct MxfXavcProfileSettings
        include JSON::Serializable

        # To create an output that complies with the XAVC file format guidelines for interoperability, keep
        # the default value, Drop frames for compliance. To include all frames from your input in this output,
        # keep the default setting, Allow any duration. The number of frames that MediaConvert excludes when
        # you set this to Drop frames for compliance depends on the output frame rate and duration.

        @[JSON::Field(key: "durationMode")]
        getter duration_mode : String?

        # Specify a value for this setting only for outputs that you set up with one of these two XAVC
        # profiles: XAVC HD Intra CBG or XAVC 4K Intra CBG. Specify the amount of space in each frame that the
        # service reserves for ancillary data, such as teletext captions. The default value for this setting
        # is 1492 bytes per frame. This should be sufficient to prevent overflow unless you have multiple
        # pages of teletext captions data. If you have a large amount of teletext data, specify a larger
        # number.

        @[JSON::Field(key: "maxAncDataSize")]
        getter max_anc_data_size : Int32?

        def initialize(
          @duration_mode : String? = nil,
          @max_anc_data_size : Int32? = nil
        )
        end
      end

      # For forensic video watermarking, MediaConvert supports Nagra NexGuard File Marker watermarking.
      # MediaConvert supports both PreRelease Content (NGPR/G2) and OTT Streaming workflows.

      struct NexGuardFileMarkerSettings
        include JSON::Serializable

        # Use the base64 license string that Nagra provides you. Enter it directly in your JSON job
        # specification or in the console. Required when you include Nagra NexGuard File Marker watermarking
        # in your job.

        @[JSON::Field(key: "license")]
        getter license : String?

        # Specify the payload ID that you want associated with this output. Valid values vary depending on
        # your Nagra NexGuard forensic watermarking workflow. Required when you include Nagra NexGuard File
        # Marker watermarking in your job. For PreRelease Content (NGPR/G2), specify an integer from 1 through
        # 4,194,303. You must generate a unique ID for each asset you watermark, and keep a record of which ID
        # you have assigned to each asset. Neither Nagra nor MediaConvert keep track of the relationship
        # between output files and your IDs. For OTT Streaming, create two adaptive bitrate (ABR) stacks for
        # each asset. Do this by setting up two output groups. For one output group, set the value of Payload
        # ID to 0 in every output. For the other output group, set Payload ID to 1 in every output.

        @[JSON::Field(key: "payload")]
        getter payload : Int32?

        # Enter one of the watermarking preset strings that Nagra provides you. Required when you include
        # Nagra NexGuard File Marker watermarking in your job.

        @[JSON::Field(key: "preset")]
        getter preset : String?

        # Optional. Ignore this setting unless Nagra support directs you to specify a value. When you don't
        # specify a value here, the Nagra NexGuard library uses its default value.

        @[JSON::Field(key: "strength")]
        getter strength : String?

        def initialize(
          @license : String? = nil,
          @payload : Int32? = nil,
          @preset : String? = nil,
          @strength : String? = nil
        )
        end
      end

      # Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore
      # these settings. When you enable Nielsen configuration, MediaConvert enables PCM to ID3 tagging for
      # all outputs in the job.

      struct NielsenConfiguration
        include JSON::Serializable

        # Nielsen has discontinued the use of breakout code functionality. If you must include this property,
        # set the value to zero.

        @[JSON::Field(key: "breakoutCode")]
        getter breakout_code : Int32?

        # Use Distributor ID to specify the distributor ID that is assigned to your organization by Nielsen.

        @[JSON::Field(key: "distributorId")]
        getter distributor_id : String?

        def initialize(
          @breakout_code : Int32? = nil,
          @distributor_id : String? = nil
        )
        end
      end

      # Ignore these settings unless you are using Nielsen non-linear watermarking. Specify the values that
      # MediaConvert uses to generate and place Nielsen watermarks in your output audio. In addition to
      # specifying these values, you also need to set up your cloud TIC server. These settings apply to
      # every output in your job. The MediaConvert implementation is currently with the following Nielsen
      # versions: Nielsen Watermark SDK Version 6.0.13 Nielsen NLM Watermark Engine Version 1.3.3 Nielsen
      # Watermark Authenticator [SID_TIC] Version [7.0.0]

      struct NielsenNonLinearWatermarkSettings
        include JSON::Serializable

        # Choose the type of Nielsen watermarks that you want in your outputs. When you choose NAES 2 and NW,
        # you must provide a value for the setting SID. When you choose CBET, you must provide a value for the
        # setting CSID. When you choose NAES 2, NW, and CBET, you must provide values for both of these
        # settings.

        @[JSON::Field(key: "activeWatermarkProcess")]
        getter active_watermark_process : String?

        # Optional. Use this setting when you want the service to include an ADI file in the Nielsen metadata
        # .zip file. To provide an ADI file, store it in Amazon S3 and provide a URL to it here. The URL
        # should be in the following format: S3://bucket/path/ADI-file. For more information about the
        # metadata .zip file, see the setting Metadata destination.

        @[JSON::Field(key: "adiFilename")]
        getter adi_filename : String?

        # Use the asset ID that you provide to Nielsen to uniquely identify this asset. Required for all
        # Nielsen non-linear watermarking.

        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # Use the asset name that you provide to Nielsen for this asset. Required for all Nielsen non-linear
        # watermarking.

        @[JSON::Field(key: "assetName")]
        getter asset_name : String?

        # Use the CSID that Nielsen provides to you. This CBET source ID should be unique to your Nielsen
        # account but common to all of your output assets that have CBET watermarking. Required when you
        # choose a value for the setting Watermark types that includes CBET.

        @[JSON::Field(key: "cbetSourceId")]
        getter cbet_source_id : String?

        # Optional. If this asset uses an episode ID with Nielsen, provide it here.

        @[JSON::Field(key: "episodeId")]
        getter episode_id : String?

        # Specify the Amazon S3 location where you want MediaConvert to save your Nielsen non-linear metadata
        # .zip file. This Amazon S3 bucket must be in the same Region as the one where you do your
        # MediaConvert transcoding. If you want to include an ADI file in this .zip file, use the setting ADI
        # file to specify it. MediaConvert delivers the Nielsen metadata .zip files only to your metadata
        # destination Amazon S3 bucket. It doesn't deliver the .zip files to Nielsen. You are responsible for
        # delivering the metadata .zip files to Nielsen.

        @[JSON::Field(key: "metadataDestination")]
        getter metadata_destination : String?

        # Use the SID that Nielsen provides to you. This source ID should be unique to your Nielsen account
        # but common to all of your output assets. Required for all Nielsen non-linear watermarking. This ID
        # should be unique to your Nielsen account but common to all of your output assets. Required for all
        # Nielsen non-linear watermarking.

        @[JSON::Field(key: "sourceId")]
        getter source_id : Int32?

        # Required. Specify whether your source content already contains Nielsen non-linear watermarks. When
        # you set this value to Watermarked, the service fails the job. Nielsen requires that you add
        # non-linear watermarking to only clean content that doesn't already have non-linear Nielsen
        # watermarks.

        @[JSON::Field(key: "sourceWatermarkStatus")]
        getter source_watermark_status : String?

        # Specify the endpoint for the TIC server that you have deployed and configured in the AWS Cloud.
        # Required for all Nielsen non-linear watermarking. MediaConvert can't connect directly to a TIC
        # server. Instead, you must use API Gateway to provide a RESTful interface between MediaConvert and a
        # TIC server that you deploy in your AWS account. For more information on deploying a TIC server in
        # your AWS account and the required API Gateway, contact Nielsen support.

        @[JSON::Field(key: "ticServerUrl")]
        getter tic_server_url : String?

        # To create assets that have the same TIC values in each audio track, keep the default value Share
        # TICs. To create assets that have unique TIC values for each audio track, choose Use unique TICs.

        @[JSON::Field(key: "uniqueTicPerAudioTrack")]
        getter unique_tic_per_audio_track : String?

        def initialize(
          @active_watermark_process : String? = nil,
          @adi_filename : String? = nil,
          @asset_id : String? = nil,
          @asset_name : String? = nil,
          @cbet_source_id : String? = nil,
          @episode_id : String? = nil,
          @metadata_destination : String? = nil,
          @source_id : Int32? = nil,
          @source_watermark_status : String? = nil,
          @tic_server_url : String? = nil,
          @unique_tic_per_audio_track : String? = nil
        )
        end
      end

      # Enable the Noise reducer feature to remove noise from your video output if necessary. Enable or
      # disable this feature for each output individually. This setting is disabled by default. When you
      # enable Noise reducer, you must also select a value for Noise reducer filter. For AVC outputs, when
      # you include Noise reducer, you cannot include the Bandwidth reduction filter.

      struct NoiseReducer
        include JSON::Serializable

        # Use Noise reducer filter to select one of the following spatial image filtering functions. To use
        # this setting, you must also enable Noise reducer. * Bilateral preserves edges while reducing noise.
        # * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do convolution filtering. * Conserve
        # does min/max noise reduction. * Spatial does frequency-domain filtering based on JND principles. *
        # Temporal optimizes video quality for complex motion.

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # Settings for a noise reducer filter

        @[JSON::Field(key: "filterSettings")]
        getter filter_settings : Types::NoiseReducerFilterSettings?

        # Noise reducer filter settings for spatial filter.

        @[JSON::Field(key: "spatialFilterSettings")]
        getter spatial_filter_settings : Types::NoiseReducerSpatialFilterSettings?

        # Noise reducer filter settings for temporal filter.

        @[JSON::Field(key: "temporalFilterSettings")]
        getter temporal_filter_settings : Types::NoiseReducerTemporalFilterSettings?

        def initialize(
          @filter : String? = nil,
          @filter_settings : Types::NoiseReducerFilterSettings? = nil,
          @spatial_filter_settings : Types::NoiseReducerSpatialFilterSettings? = nil,
          @temporal_filter_settings : Types::NoiseReducerTemporalFilterSettings? = nil
        )
        end
      end

      # Settings for a noise reducer filter

      struct NoiseReducerFilterSettings
        include JSON::Serializable

        # Relative strength of noise reducing filter. Higher values produce stronger filtering.

        @[JSON::Field(key: "strength")]
        getter strength : Int32?

        def initialize(
          @strength : Int32? = nil
        )
        end
      end

      # Noise reducer filter settings for spatial filter.

      struct NoiseReducerSpatialFilterSettings
        include JSON::Serializable

        # Specify strength of post noise reduction sharpening filter, with 0 disabling the filter and 3
        # enabling it at maximum strength.

        @[JSON::Field(key: "postFilterSharpenStrength")]
        getter post_filter_sharpen_strength : Int32?

        # The speed of the filter, from -2 (lower speed) to 3 (higher speed), with 0 being the nominal value.

        @[JSON::Field(key: "speed")]
        getter speed : Int32?

        # Relative strength of noise reducing filter. Higher values produce stronger filtering.

        @[JSON::Field(key: "strength")]
        getter strength : Int32?

        def initialize(
          @post_filter_sharpen_strength : Int32? = nil,
          @speed : Int32? = nil,
          @strength : Int32? = nil
        )
        end
      end

      # Noise reducer filter settings for temporal filter.

      struct NoiseReducerTemporalFilterSettings
        include JSON::Serializable

        # Use Aggressive mode for content that has complex motion. Higher values produce stronger temporal
        # filtering. This filters highly complex scenes more aggressively and creates better VQ for low
        # bitrate outputs.

        @[JSON::Field(key: "aggressiveMode")]
        getter aggressive_mode : Int32?

        # When you set Noise reducer to Temporal, the bandwidth and sharpness of your output is reduced. You
        # can optionally use Post temporal sharpening to apply sharpening to the edges of your output. Note
        # that Post temporal sharpening will also make the bandwidth reduction from the Noise reducer smaller.
        # The default behavior, Auto, allows the transcoder to determine whether to apply sharpening,
        # depending on your input type and quality. When you set Post temporal sharpening to Enabled, specify
        # how much sharpening is applied using Post temporal sharpening strength. Set Post temporal sharpening
        # to Disabled to not apply sharpening.

        @[JSON::Field(key: "postTemporalSharpening")]
        getter post_temporal_sharpening : String?

        # Use Post temporal sharpening strength to define the amount of sharpening the transcoder applies to
        # your output. Set Post temporal sharpening strength to Low, Medium, or High to indicate the amount of
        # sharpening.

        @[JSON::Field(key: "postTemporalSharpeningStrength")]
        getter post_temporal_sharpening_strength : String?

        # The speed of the filter (higher number is faster). Low setting reduces bit rate at the cost of
        # transcode time, high setting improves transcode time at the cost of bit rate.

        @[JSON::Field(key: "speed")]
        getter speed : Int32?

        # Specify the strength of the noise reducing filter on this output. Higher values produce stronger
        # filtering. We recommend the following value ranges, depending on the result that you want: * 0-2 for
        # complexity reduction with minimal sharpness loss * 2-8 for complexity reduction with image
        # preservation * 8-16 for a high level of complexity reduction

        @[JSON::Field(key: "strength")]
        getter strength : Int32?

        def initialize(
          @aggressive_mode : Int32? = nil,
          @post_temporal_sharpening : String? = nil,
          @post_temporal_sharpening_strength : String? = nil,
          @speed : Int32? = nil,
          @strength : Int32? = nil
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

      # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value OPUS.

      struct OpusSettings
        include JSON::Serializable

        # Optional. Specify the average bitrate in bits per second. Valid values are multiples of 8000, from
        # 32000 through 192000. The default value is 96000, which we recommend for quality and bandwidth.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Specify the number of channels in this output audio track. Choosing Mono on gives you 1 output
        # channel; choosing Stereo gives you 2. In the API, valid values are 1 and 2.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Optional. Sample rate in Hz. Valid values are 16000, 24000, and 48000. The default value is 48000.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bitrate : Int32? = nil,
          @channels : Int32? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Each output in your job is a collection of settings that describes how you want MediaConvert to
      # encode a single output file or stream. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/create-outputs.html.

      struct Output
        include JSON::Serializable

        # Contains groups of audio encoding settings organized by audio codec. Include one instance of per
        # output. Can contain multiple groups of encoding settings.

        @[JSON::Field(key: "audioDescriptions")]
        getter audio_descriptions : Array(Types::AudioDescription)?

        # Contains groups of captions settings. For each output that has captions, include one instance of
        # CaptionDescriptions. Can contain multiple groups of captions settings.

        @[JSON::Field(key: "captionDescriptions")]
        getter caption_descriptions : Array(Types::CaptionDescription)?

        # Container specific settings.

        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::ContainerSettings?

        # Use Extension to specify the file extension for outputs in File output groups. If you do not specify
        # a value, the service will use default extensions by container type as follows * MPEG-2 transport
        # stream, m2ts * Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * WebM container, webm *
        # Animated GIF container, gif * No Container, the service will use codec extensions (e.g. AAC, H265,
        # H265, AC3)

        @[JSON::Field(key: "extension")]
        getter extension : String?

        # Use Name modifier to have the service add a string to the end of each output filename. You specify
        # the base filename as part of your destination URI. When you create multiple outputs in the same
        # output group, Name modifier is required. Name modifier also accepts format identifiers. For DASH ISO
        # outputs, if you use the format identifiers $Number$ or $Time$ in one output, you must use them in
        # the same way in all outputs of the output group.

        @[JSON::Field(key: "nameModifier")]
        getter name_modifier : String?

        # Specific settings for this type of output.

        @[JSON::Field(key: "outputSettings")]
        getter output_settings : Types::OutputSettings?

        # Use Preset to specify a preset for your transcoding settings. Provide the system or custom preset
        # name. You can specify either Preset or Container settings, but not both.

        @[JSON::Field(key: "preset")]
        getter preset : String?

        # VideoDescription contains a group of video encoding settings. The specific video settings depend on
        # the video codec that you choose for the property codec. Include one instance of VideoDescription per
        # output.

        @[JSON::Field(key: "videoDescription")]
        getter video_description : Types::VideoDescription?

        def initialize(
          @audio_descriptions : Array(Types::AudioDescription)? = nil,
          @caption_descriptions : Array(Types::CaptionDescription)? = nil,
          @container_settings : Types::ContainerSettings? = nil,
          @extension : String? = nil,
          @name_modifier : String? = nil,
          @output_settings : Types::OutputSettings? = nil,
          @preset : String? = nil,
          @video_description : Types::VideoDescription? = nil
        )
        end
      end

      # OutputChannel mapping settings.

      struct OutputChannelMapping
        include JSON::Serializable

        # Use this setting to specify your remix values when they are integers, such as -10, 0, or 4.

        @[JSON::Field(key: "inputChannels")]
        getter input_channels : Array(Int32)?

        # Use this setting to specify your remix values when they have a decimal component, such as -10.312,
        # 0.08, or 4.9. MediaConvert rounds your remixing values to the nearest thousandth.

        @[JSON::Field(key: "inputChannelsFineTune")]
        getter input_channels_fine_tune : Array(Float64)?

        def initialize(
          @input_channels : Array(Int32)? = nil,
          @input_channels_fine_tune : Array(Float64)? = nil
        )
        end
      end

      # Details regarding output

      struct OutputDetail
        include JSON::Serializable

        # Duration in milliseconds

        @[JSON::Field(key: "durationInMs")]
        getter duration_in_ms : Int32?

        # Contains details about the output's video stream

        @[JSON::Field(key: "videoDetails")]
        getter video_details : Types::VideoDetail?

        def initialize(
          @duration_in_ms : Int32? = nil,
          @video_details : Types::VideoDetail? = nil
        )
        end
      end

      # Group of outputs

      struct OutputGroup
        include JSON::Serializable

        # Use automated encoding to have MediaConvert choose your encoding settings for you, based on
        # characteristics of your input video.

        @[JSON::Field(key: "automatedEncodingSettings")]
        getter automated_encoding_settings : Types::AutomatedEncodingSettings?

        # Use Custom Group Name to specify a name for the output group. This value is displayed on the console
        # and can make your job settings JSON more human-readable. It does not affect your outputs. Use up to
        # twelve characters that are either letters, numbers, spaces, or underscores.

        @[JSON::Field(key: "customName")]
        getter custom_name : String?

        # Name of the output group

        @[JSON::Field(key: "name")]
        getter name : String?

        # Output Group settings, including type

        @[JSON::Field(key: "outputGroupSettings")]
        getter output_group_settings : Types::OutputGroupSettings?

        # This object holds groups of encoding settings, one group of settings per output.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::Output)?

        def initialize(
          @automated_encoding_settings : Types::AutomatedEncodingSettings? = nil,
          @custom_name : String? = nil,
          @name : String? = nil,
          @output_group_settings : Types::OutputGroupSettings? = nil,
          @outputs : Array(Types::Output)? = nil
        )
        end
      end

      # Contains details about the output groups specified in the job settings.

      struct OutputGroupDetail
        include JSON::Serializable

        # Details about the output

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Array(Types::OutputDetail)?

        def initialize(
          @output_details : Array(Types::OutputDetail)? = nil
        )
        end
      end

      # Output Group settings, including type

      struct OutputGroupSettings
        include JSON::Serializable

        # Settings related to your CMAF output package. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

        @[JSON::Field(key: "cmafGroupSettings")]
        getter cmaf_group_settings : Types::CmafGroupSettings?

        # Settings related to your DASH output package. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

        @[JSON::Field(key: "dashIsoGroupSettings")]
        getter dash_iso_group_settings : Types::DashIsoGroupSettings?

        # Settings related to your File output group. MediaConvert uses this group of settings to generate a
        # single standalone file, rather than a streaming package.

        @[JSON::Field(key: "fileGroupSettings")]
        getter file_group_settings : Types::FileGroupSettings?

        # Settings related to your HLS output package. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

        @[JSON::Field(key: "hlsGroupSettings")]
        getter hls_group_settings : Types::HlsGroupSettings?

        # Settings related to your Microsoft Smooth Streaming output package. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/outputs-file-ABR.html.

        @[JSON::Field(key: "msSmoothGroupSettings")]
        getter ms_smooth_group_settings : Types::MsSmoothGroupSettings?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth Streaming, CMAF)

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @cmaf_group_settings : Types::CmafGroupSettings? = nil,
          @dash_iso_group_settings : Types::DashIsoGroupSettings? = nil,
          @file_group_settings : Types::FileGroupSettings? = nil,
          @hls_group_settings : Types::HlsGroupSettings? = nil,
          @ms_smooth_group_settings : Types::MsSmoothGroupSettings? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Specific settings for this type of output.

      struct OutputSettings
        include JSON::Serializable

        # Settings for HLS output groups

        @[JSON::Field(key: "hlsSettings")]
        getter hls_settings : Types::HlsSettings?

        def initialize(
          @hls_settings : Types::HlsSettings? = nil
        )
        end
      end

      # If you work with a third party video watermarking partner, use the group of settings that correspond
      # with your watermarking partner to include watermarks in your output.

      struct PartnerWatermarking
        include JSON::Serializable

        # For forensic video watermarking, MediaConvert supports Nagra NexGuard File Marker watermarking.
        # MediaConvert supports both PreRelease Content (NGPR/G2) and OTT Streaming workflows.

        @[JSON::Field(key: "nexguardFileMarkerSettings")]
        getter nexguard_file_marker_settings : Types::NexGuardFileMarkerSettings?

        def initialize(
          @nexguard_file_marker_settings : Types::NexGuardFileMarkerSettings? = nil
        )
        end
      end

      # Optional settings when you set Codec to the value Passthrough.

      struct PassthroughSettings
        include JSON::Serializable

        # Choose how MediaConvert handles start and end times for input clipping with video passthrough. Your
        # input video codec must be H.264 or H.265 to use IFRAME. To clip at the nearest IDR-frame: Choose
        # Nearest IDR. If an IDR-frame is not found at the frame that you specify, MediaConvert uses the next
        # compatible IDR-frame. Note that your output may be shorter than your input clip duration. To clip at
        # the nearest I-frame: Choose Nearest I-frame. If an I-frame is not found at the frame that you
        # specify, MediaConvert uses the next compatible I-frame. Note that your output may be shorter than
        # your input clip duration. We only recommend this setting for special workflows, and when you choose
        # this setting your output may not be compatible with most players.

        @[JSON::Field(key: "frameControl")]
        getter frame_control : String?

        # AUTO will select the highest bitrate input in the video selector source. REMUX_ALL will passthrough
        # all the selected streams in the video selector source. When selecting streams from multiple
        # renditions (i.e. using Stream video selector type): REMUX_ALL will only remux all streams selected,
        # and AUTO will use the highest bitrate video stream among the selected streams as source.

        @[JSON::Field(key: "videoSelectorMode")]
        getter video_selector_mode : String?

        def initialize(
          @frame_control : String? = nil,
          @video_selector_mode : String? = nil
        )
        end
      end

      # A policy configures behavior that you allow or disallow for your account. For information about
      # MediaConvert policies, see the user guide at
      # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

      struct Policy
        include JSON::Serializable

        # Allow or disallow jobs that specify HTTP inputs.

        @[JSON::Field(key: "httpInputs")]
        getter http_inputs : String?

        # Allow or disallow jobs that specify HTTPS inputs.

        @[JSON::Field(key: "httpsInputs")]
        getter https_inputs : String?

        # Allow or disallow jobs that specify Amazon S3 inputs.

        @[JSON::Field(key: "s3Inputs")]
        getter s3_inputs : String?

        def initialize(
          @http_inputs : String? = nil,
          @https_inputs : String? = nil,
          @s3_inputs : String? = nil
        )
        end
      end

      # A preset is a collection of preconfigured media conversion settings that you want MediaConvert to
      # apply to the output during the conversion process.

      struct Preset
        include JSON::Serializable

        # A name you create for each preset. Each name must be unique within your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # Settings for preset

        @[JSON::Field(key: "settings")]
        getter settings : Types::PresetSettings

        # An identifier for this resource that is unique within all of AWS.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An optional category you create to organize your presets.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The timestamp in epoch seconds for preset creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # An optional description you create for each preset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp in epoch seconds when the preset was last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # A preset can be of two types: system or custom. System or built-in preset can't be modified or
        # deleted by the user.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @settings : Types::PresetSettings,
          @arn : String? = nil,
          @category : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # Settings for preset

      struct PresetSettings
        include JSON::Serializable

        # Contains groups of audio encoding settings organized by audio codec. Include one instance of per
        # output. Can contain multiple groups of encoding settings.

        @[JSON::Field(key: "audioDescriptions")]
        getter audio_descriptions : Array(Types::AudioDescription)?

        # This object holds groups of settings related to captions for one output. For each output that has
        # captions, include one instance of CaptionDescriptions.

        @[JSON::Field(key: "captionDescriptions")]
        getter caption_descriptions : Array(Types::CaptionDescriptionPreset)?

        # Container specific settings.

        @[JSON::Field(key: "containerSettings")]
        getter container_settings : Types::ContainerSettings?

        # VideoDescription contains a group of video encoding settings. The specific video settings depend on
        # the video codec that you choose for the property codec. Include one instance of VideoDescription per
        # output.

        @[JSON::Field(key: "videoDescription")]
        getter video_description : Types::VideoDescription?

        def initialize(
          @audio_descriptions : Array(Types::AudioDescription)? = nil,
          @caption_descriptions : Array(Types::CaptionDescriptionPreset)? = nil,
          @container_settings : Types::ContainerSettings? = nil,
          @video_description : Types::VideoDescription? = nil
        )
        end
      end

      # The input file that needs to be analyzed.

      struct ProbeInputFile
        include JSON::Serializable

        # Specify the S3, HTTP, or HTTPS URL for your media file.

        @[JSON::Field(key: "fileUrl")]
        getter file_url : String?

        def initialize(
          @file_url : String? = nil
        )
        end
      end

      # The request to probe one or more media files and retrieve metadata about them.

      struct ProbeRequest
        include JSON::Serializable

        # Specify a media file to probe.

        @[JSON::Field(key: "inputFiles")]
        getter input_files : Array(Types::ProbeInputFile)?

        def initialize(
          @input_files : Array(Types::ProbeInputFile)? = nil
        )
        end
      end

      # The response from a MediaConvert Probe operation, in JSON form, with detailed information about your
      # input media.

      struct ProbeResponse
        include JSON::Serializable

        # Probe results for your media file.

        @[JSON::Field(key: "probeResults")]
        getter probe_results : Array(Types::ProbeResult)?

        def initialize(
          @probe_results : Array(Types::ProbeResult)? = nil
        )
        end
      end

      # Probe results for your media file.

      struct ProbeResult
        include JSON::Serializable

        # The container of your media file. This information helps you understand the overall structure and
        # details of your media, including format, duration, and track layout.

        @[JSON::Field(key: "container")]
        getter container : Types::Container?

        # Metadata and other file information.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # An array containing track mapping information.

        @[JSON::Field(key: "trackMappings")]
        getter track_mappings : Array(Types::TrackMapping)?

        def initialize(
          @container : Types::Container? = nil,
          @metadata : Types::Metadata? = nil,
          @track_mappings : Array(Types::TrackMapping)? = nil
        )
        end
      end

      # Required when you set Codec to the value PRORES.

      struct ProresSettings
        include JSON::Serializable

        # This setting applies only to ProRes 4444 and ProRes 4444 XQ outputs that you create from inputs that
        # use 4:4:4 chroma sampling. Set Preserve 4:4:4 sampling to allow outputs to also use 4:4:4 chroma
        # sampling. You must specify a value for this setting when your output codec profile supports 4:4:4
        # chroma sampling. Related Settings: For Apple ProRes outputs with 4:4:4 chroma sampling: Choose
        # Preserve 4:4:4 sampling. Use when your input has 4:4:4 chroma sampling and your output codec Profile
        # is Apple ProRes 4444 or 4444 XQ. Note that when you choose Preserve 4:4:4 sampling, you cannot
        # include any of the following Preprocessors: Dolby Vision, HDR10+, or Noise reducer.

        @[JSON::Field(key: "chromaSampling")]
        getter chroma_sampling : String?

        # Use Profile to specify the type of Apple ProRes codec to use for this output.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The
        # default behavior, Follow source, uses the PAR from your input video for your output. To specify a
        # different PAR, choose any value other than Follow source. When you choose SPECIFIED for this
        # setting, you must also specify values for the parNumerator and parDenominator settings.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output. When you enable slow PAL, MediaConvert relabels the video frames
        # to 25 fps and resamples your audio to keep it synchronized with the video. Note that enabling this
        # setting will slightly reduce the duration of your video. Required settings: You must also set
        # Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard telecine to create a smoother picture. When
        # you keep the default value, None, MediaConvert does a standard frame rate conversion to 29.97
        # without doing anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        def initialize(
          @chroma_sampling : String? = nil,
          @codec_profile : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @interlace_mode : String? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @scan_type_conversion_mode : String? = nil,
          @slow_pal : String? = nil,
          @telecine : String? = nil
        )
        end
      end

      # Create or change a policy by sending a request that includes your policy in JSON.

      struct PutPolicyRequest
        include JSON::Serializable

        # A policy configures behavior that you allow or disallow for your account. For information about
        # MediaConvert policies, see the user guide at
        # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "policy")]
        getter policy : Types::Policy

        def initialize(
          @policy : Types::Policy
        )
        end
      end

      # Successful PUT policy requests will return your policy.

      struct PutPolicyResponse
        include JSON::Serializable

        # A policy configures behavior that you allow or disallow for your account. For information about
        # MediaConvert policies, see the user guide at
        # http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

        @[JSON::Field(key: "policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end

      # You can use queues to manage the resources that are available to your AWS account for running
      # multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs
      # through the default queue. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.

      struct Queue
        include JSON::Serializable

        # A name that you create for each queue. Each name must be unique within your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # An identifier for this resource that is unique within all of AWS.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The maximum number of jobs your queue can process concurrently.

        @[JSON::Field(key: "concurrentJobs")]
        getter concurrent_jobs : Int32?

        # The timestamp in epoch seconds for when you created the queue.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # An optional description that you create for each queue.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp in epoch seconds for when you most recently updated the queue.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # Specifies whether the pricing plan for the queue is on-demand or reserved. For on-demand, you pay
        # per minute, billed in increments of .01 minute. For reserved, you pay for the transcoding capacity
        # of the entire queue, regardless of how much or how little you use it. Reserved pricing requires a
        # 12-month commitment.

        @[JSON::Field(key: "pricingPlan")]
        getter pricing_plan : String?

        # The estimated number of jobs with a PROGRESSING status.

        @[JSON::Field(key: "progressingJobsCount")]
        getter progressing_jobs_count : Int32?

        # Details about the pricing plan for your reserved queue. Required for reserved queues and not
        # applicable to on-demand queues.

        @[JSON::Field(key: "reservationPlan")]
        getter reservation_plan : Types::ReservationPlan?

        # A list of any service overrides applied by MediaConvert to the settings that you have configured. If
        # you see any overrides, we recommend that you contact AWS Support.

        @[JSON::Field(key: "serviceOverrides")]
        getter service_overrides : Array(Types::ServiceOverride)?

        # Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't begin processing jobs in
        # that queue. Jobs that are running when you pause the queue continue to run until they finish or
        # result in an error.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The estimated number of jobs with a SUBMITTED status.

        @[JSON::Field(key: "submittedJobsCount")]
        getter submitted_jobs_count : Int32?

        # Specifies whether this on-demand queue is system or custom. System queues are built in. You can't
        # modify or delete system queues. You can create and modify custom queues.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @arn : String? = nil,
          @concurrent_jobs : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated : Time? = nil,
          @pricing_plan : String? = nil,
          @progressing_jobs_count : Int32? = nil,
          @reservation_plan : Types::ReservationPlan? = nil,
          @service_overrides : Array(Types::ServiceOverride)? = nil,
          @status : String? = nil,
          @submitted_jobs_count : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Description of the source and destination queues between which the job has moved, along with the
      # timestamp of the move

      struct QueueTransition
        include JSON::Serializable

        # The queue that the job was on after the transition.

        @[JSON::Field(key: "destinationQueue")]
        getter destination_queue : String?

        # The queue that the job was on before the transition.

        @[JSON::Field(key: "sourceQueue")]
        getter source_queue : String?

        # The time, in Unix epoch format, that the job moved from the source queue to the destination queue.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @destination_queue : String? = nil,
          @source_queue : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Use Rectangle to identify a specific area of the video frame.

      struct Rectangle
        include JSON::Serializable

        # Height of rectangle in pixels. Specify only even numbers.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Width of rectangle in pixels. Specify only even numbers.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        # The distance, in pixels, between the rectangle and the left edge of the video frame. Specify only
        # even numbers.

        @[JSON::Field(key: "x")]
        getter x : Int32?

        # The distance, in pixels, between the rectangle and the top edge of the video frame. Specify only
        # even numbers.

        @[JSON::Field(key: "y")]
        getter y : Int32?

        def initialize(
          @height : Int32? = nil,
          @width : Int32? = nil,
          @x : Int32? = nil,
          @y : Int32? = nil
        )
        end
      end

      # Use Manual audio remixing to adjust audio levels for each audio channel in each output of your job.
      # With audio remixing, you can output more or fewer audio channels than your input audio source
      # provides.

      struct RemixSettings
        include JSON::Serializable

        # Optionally specify the channel in your input that contains your audio description audio signal.
        # MediaConvert mixes your audio signal across all output channels, while reducing their volume
        # according to your data stream. When you specify an audio description audio channel, you must also
        # specify an audio description data channel. For more information about audio description signals, see
        # the BBC WHP 198 and 051 white papers.

        @[JSON::Field(key: "audioDescriptionAudioChannel")]
        getter audio_description_audio_channel : Int32?

        # Optionally specify the channel in your input that contains your audio description data stream.
        # MediaConvert mixes your audio signal across all output channels, while reducing their volume
        # according to your data stream. When you specify an audio description data channel, you must also
        # specify an audio description audio channel. For more information about audio description signals,
        # see the BBC WHP 198 and 051 white papers.

        @[JSON::Field(key: "audioDescriptionDataChannel")]
        getter audio_description_data_channel : Int32?

        # Channel mapping contains the group of fields that hold the remixing value for each channel, in dB.
        # Specify remix values to indicate how much of the content from your input audio channel you want in
        # your output audio channels. Each instance of the InputChannels or InputChannelsFineTune array
        # specifies these values for one output channel. Use one instance of this array for each output
        # channel. In the console, each array corresponds to a column in the graphical depiction of the
        # mapping matrix. The rows of the graphical matrix correspond to input channels. Valid values are
        # within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the
        # output channel (no attenuation or amplification). Use InputChannels or InputChannelsFineTune to
        # specify your remix values. Don't use both.

        @[JSON::Field(key: "channelMapping")]
        getter channel_mapping : Types::ChannelMapping?

        # Specify the number of audio channels from your input that you want to use in your output. With
        # remixing, you might combine or split the data in these channels, so the number of channels in your
        # final output might be different. If you are doing both input channel mapping and output channel
        # mapping, the number of output channels in your input mapping must be the same as the number of input
        # channels in your output mapping.

        @[JSON::Field(key: "channelsIn")]
        getter channels_in : Int32?

        # Specify the number of channels in this output after remixing. Valid values: 1, 2, 4, 6, 8... 64. (1
        # and even numbers to 64.) If you are doing both input channel mapping and output channel mapping, the
        # number of output channels in your input mapping must be the same as the number of input channels in
        # your output mapping.

        @[JSON::Field(key: "channelsOut")]
        getter channels_out : Int32?

        def initialize(
          @audio_description_audio_channel : Int32? = nil,
          @audio_description_data_channel : Int32? = nil,
          @channel_mapping : Types::ChannelMapping? = nil,
          @channels_in : Int32? = nil,
          @channels_out : Int32? = nil
        )
        end
      end

      # Details about the pricing plan for your reserved queue. Required for reserved queues and not
      # applicable to on-demand queues.

      struct ReservationPlan
        include JSON::Serializable

        # The length of the term of your reserved queue pricing plan commitment.

        @[JSON::Field(key: "commitment")]
        getter commitment : String?

        # The timestamp in epoch seconds for when the current pricing plan term for this reserved queue
        # expires.

        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time?

        # The timestamp in epoch seconds for when you set up the current pricing plan for this reserved queue.

        @[JSON::Field(key: "purchasedAt")]
        getter purchased_at : Time?

        # Specifies whether the term of your reserved queue pricing plan is automatically extended
        # (AUTO_RENEW) or expires (EXPIRE) at the end of the term.

        @[JSON::Field(key: "renewalType")]
        getter renewal_type : String?

        # Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines
        # how many jobs the queue can process in parallel; each RTS can process one job at a time. When you
        # increase this number, you extend your existing commitment with a new 12-month commitment for a
        # larger number of RTS. The new commitment begins when you purchase the additional capacity. You can't
        # decrease the number of RTS in your reserved queue.

        @[JSON::Field(key: "reservedSlots")]
        getter reserved_slots : Int32?

        # Specifies whether the pricing plan for your reserved queue is ACTIVE or EXPIRED.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @commitment : String? = nil,
          @expires_at : Time? = nil,
          @purchased_at : Time? = nil,
          @renewal_type : String? = nil,
          @reserved_slots : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about the pricing plan for your reserved queue. Required for reserved queues and not
      # applicable to on-demand queues.

      struct ReservationPlanSettings
        include JSON::Serializable

        # The length of the term of your reserved queue pricing plan commitment.

        @[JSON::Field(key: "commitment")]
        getter commitment : String

        # Specifies whether the term of your reserved queue pricing plan is automatically extended
        # (AUTO_RENEW) or expires (EXPIRE) at the end of the term. When your term is auto renewed, you extend
        # your commitment by 12 months from the auto renew date. You can cancel this commitment.

        @[JSON::Field(key: "renewalType")]
        getter renewal_type : String

        # Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines
        # how many jobs the queue can process in parallel; each RTS can process one job at a time. You can't
        # decrease the number of RTS in your reserved queue. You can increase the number of RTS by extending
        # your existing commitment with a new 12-month commitment for the larger number. The new commitment
        # begins when you purchase the additional capacity. You can't cancel your commitment or revert to your
        # original commitment after you increase the capacity.

        @[JSON::Field(key: "reservedSlots")]
        getter reserved_slots : Int32

        def initialize(
          @commitment : String,
          @renewal_type : String,
          @reserved_slots : Int32
        )
        end
      end

      # The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.

      struct ResourceTags
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Optional. Have MediaConvert automatically apply Amazon S3 access control for the outputs in this
      # output group. When you don't use this setting, S3 automatically applies the default access control
      # list PRIVATE.

      struct S3DestinationAccessControl
        include JSON::Serializable

        # Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.

        @[JSON::Field(key: "cannedAcl")]
        getter canned_acl : String?

        def initialize(
          @canned_acl : String? = nil
        )
        end
      end

      # Settings associated with S3 destination

      struct S3DestinationSettings
        include JSON::Serializable

        # Optional. Have MediaConvert automatically apply Amazon S3 access control for the outputs in this
        # output group. When you don't use this setting, S3 automatically applies the default access control
        # list PRIVATE.

        @[JSON::Field(key: "accessControl")]
        getter access_control : Types::S3DestinationAccessControl?

        # Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.

        @[JSON::Field(key: "encryption")]
        getter encryption : Types::S3EncryptionSettings?

        # Specify the S3 storage class to use for this output. To use your destination's default storage
        # class: Keep the default value, Not set. For more information about S3 storage classes, see
        # https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html

        @[JSON::Field(key: "storageClass")]
        getter storage_class : String?

        def initialize(
          @access_control : Types::S3DestinationAccessControl? = nil,
          @encryption : Types::S3EncryptionSettings? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.

      struct S3EncryptionSettings
        include JSON::Serializable

        # Specify how you want your data keys managed. AWS uses data keys to encrypt your content. AWS also
        # encrypts the data keys themselves, using a customer master key (CMK), and then stores the encrypted
        # data keys alongside your encrypted content. Use this setting to specify which AWS service manages
        # the CMK. For simplest set up, choose Amazon S3. If you want your master key to be managed by AWS Key
        # Management Service (KMS), choose AWS KMS. By default, when you choose AWS KMS, KMS uses the AWS
        # managed customer master key (CMK) associated with Amazon S3 to encrypt your data keys. You can
        # optionally choose to specify a different, customer managed CMK. Do so by specifying the Amazon
        # Resource Name (ARN) of the key for the setting KMS ARN.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?

        # Optionally, specify the encryption context that you want to use alongside your KMS key. AWS KMS uses
        # this encryption context as additional authenticated data (AAD) to support authenticated encryption.
        # This value must be a base64-encoded UTF-8 string holding JSON which represents a string-string map.
        # To use this setting, you must also set Server-side encryption to AWS KMS. For more information about
        # encryption context, see:
        # https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context.

        @[JSON::Field(key: "kmsEncryptionContext")]
        getter kms_encryption_context : String?

        # Optionally, specify the customer master key (CMK) that you want to use to encrypt the data key that
        # AWS uses to encrypt your output content. Enter the Amazon Resource Name (ARN) of the CMK. To use
        # this setting, you must also set Server-side encryption to AWS KMS. If you set Server-side encryption
        # to AWS KMS but don't specify a CMK here, AWS uses the AWS managed CMK associated with Amazon S3.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_type : String? = nil,
          @kms_encryption_context : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Settings related to SCC captions. SCC is a sidecar format that holds captions in a file that is
      # separate from the video container. Set up sidecar captions in the same output group, but different
      # output from your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/scc-srt-output-captions.html.

      struct SccDestinationSettings
        include JSON::Serializable

        # Set Framerate to make sure that the captions and the video are synchronized in the output. Specify a
        # frame rate that matches the frame rate of the associated video. If the video frame rate is 29.97,
        # choose 29.97 dropframe only if the video has video_insertion=true and drop_frame_timecode=true;
        # otherwise, choose 29.97 non-dropframe.

        @[JSON::Field(key: "framerate")]
        getter framerate : String?

        def initialize(
          @framerate : String? = nil
        )
        end
      end

      # Retrieve a JSON array that includes job details for up to twenty of your most recent jobs.
      # Optionally filter results further according to input file, queue, or status. To retrieve the twenty
      # next most recent jobs, use the nextToken string returned with the array.

      struct SearchJobsRequest
        include JSON::Serializable

        # Optional. Provide your input file URL or your partial input file name. The maximum length for an
        # input file is 300 characters.

        @[JSON::Field(key: "inputFile")]
        getter input_file : String?

        # Optional. Number of jobs, up to twenty, that will be returned at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Optional. Use this string, provided with the response to a previous request, to request the next
        # batch of jobs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        # Optional. Provide a queue name, or a queue ARN, to return only jobs from that queue.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # Optional. A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @input_file : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil,
          @queue : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Successful search jobs requests return a JSON array of jobs. If you don't specify how they are
      # ordered, you will receive the most recently created first.

      struct SearchJobsResponse
        include JSON::Serializable

        # List of jobs.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::Job)?

        # Use this string to request the next batch of jobs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::Job)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A service override applied by MediaConvert to the settings that you have configured. If you see any
      # overrides, we recommend that you contact AWS Support.

      struct ServiceOverride
        include JSON::Serializable

        # Details about the service override that MediaConvert has applied.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the setting that MediaConvert has applied an override to.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current value of the service override that MediaConvert has applied.

        @[JSON::Field(key: "overrideValue")]
        getter override_value : String?

        # The value of the setting that you configured, prior to any overrides that MediaConvert has applied.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @message : String? = nil,
          @name : String? = nil,
          @override_value : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM
      # encryption with a SPEKE-compliant key provider. If your output group type is CMAF, use the
      # SpekeKeyProviderCmaf settings instead.

      struct SpekeKeyProvider
        include JSON::Serializable

        # If you want your key provider to encrypt the content keys that it provides to MediaConvert, set up a
        # certificate with a master key using AWS Certificate Manager. Specify the certificate's Amazon
        # Resource Name (ARN) here.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # Specify the SPEKE version, either v1.0 or v2.0, that MediaConvert uses when encrypting your output.
        # For more information, see:
        # https://docs.aws.amazon.com/speke/latest/documentation/speke-api-specification.html To use SPEKE
        # v1.0: Leave blank. To use SPEKE v2.0: Specify a SPEKE v2.0 video preset and a SPEKE v2.0 audio
        # preset.

        @[JSON::Field(key: "encryptionContractConfiguration")]
        getter encryption_contract_configuration : Types::EncryptionContractConfiguration?

        # Specify the resource ID that your SPEKE-compliant key provider uses to identify this content.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Relates to SPEKE implementation. DRM system identifiers. DASH output groups support a max of two
        # system ids. HLS output groups support a max of 3 system ids. Other group types support one system
        # id. See https://dashif.org/identifiers/content_protection/ for more details.

        @[JSON::Field(key: "systemIds")]
        getter system_ids : Array(String)?

        # Specify the URL to the key server that your SPEKE-compliant DRM key provider uses to provide keys
        # for encrypting your content.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @certificate_arn : String? = nil,
          @encryption_contract_configuration : Types::EncryptionContractConfiguration? = nil,
          @resource_id : String? = nil,
          @system_ids : Array(String)? = nil,
          @url : String? = nil
        )
        end
      end

      # If your output group type is CMAF, use these settings when doing DRM encryption with a
      # SPEKE-compliant key provider. If your output group type is HLS, DASH, or Microsoft Smooth, use the
      # SpekeKeyProvider settings instead.

      struct SpekeKeyProviderCmaf
        include JSON::Serializable

        # If you want your key provider to encrypt the content keys that it provides to MediaConvert, set up a
        # certificate with a master key using AWS Certificate Manager. Specify the certificate's Amazon
        # Resource Name (ARN) here.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # Specify the DRM system IDs that you want signaled in the DASH manifest that MediaConvert creates as
        # part of this CMAF package. The DASH manifest can currently signal up to three system IDs. For more
        # information, see https://dashif.org/identifiers/content_protection/.

        @[JSON::Field(key: "dashSignaledSystemIds")]
        getter dash_signaled_system_ids : Array(String)?

        # Specify the SPEKE version, either v1.0 or v2.0, that MediaConvert uses when encrypting your output.
        # For more information, see:
        # https://docs.aws.amazon.com/speke/latest/documentation/speke-api-specification.html To use SPEKE
        # v1.0: Leave blank. To use SPEKE v2.0: Specify a SPEKE v2.0 video preset and a SPEKE v2.0 audio
        # preset.

        @[JSON::Field(key: "encryptionContractConfiguration")]
        getter encryption_contract_configuration : Types::EncryptionContractConfiguration?

        # Specify up to 3 DRM system IDs that you want signaled in the HLS manifest that MediaConvert creates
        # as part of this CMAF package. For more information, see
        # https://dashif.org/identifiers/content_protection/.

        @[JSON::Field(key: "hlsSignaledSystemIds")]
        getter hls_signaled_system_ids : Array(String)?

        # Specify the resource ID that your SPEKE-compliant key provider uses to identify this content.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Specify the URL to the key server that your SPEKE-compliant DRM key provider uses to provide keys
        # for encrypting your content.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @certificate_arn : String? = nil,
          @dash_signaled_system_ids : Array(String)? = nil,
          @encryption_contract_configuration : Types::EncryptionContractConfiguration? = nil,
          @hls_signaled_system_ids : Array(String)? = nil,
          @resource_id : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Settings related to SRT captions. SRT is a sidecar format that holds captions in a file that is
      # separate from the video container. Set up sidecar captions in the same output group, but different
      # output from your video.

      struct SrtDestinationSettings
        include JSON::Serializable

        # Set Style passthrough to ENABLED to use the available style, color, and position information from
        # your input captions. MediaConvert uses default settings for any missing style and position
        # information in your input captions. Set Style passthrough to DISABLED, or leave blank, to ignore the
        # style and position information from your input captions and use simplified output captions.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        def initialize(
          @style_passthrough : String? = nil
        )
        end
      end

      # Start an asynchronous jobs query using the provided filters. To receive the list of jobs that match
      # your query, call the GetJobsQueryResults API using the query ID returned by this API.

      struct StartJobsQueryRequest
        include JSON::Serializable

        # Optional. Provide an array of JobsQueryFilters for your StartJobsQuery request.

        @[JSON::Field(key: "filterList")]
        getter filter_list : Array(Types::JobsQueryFilter)?

        # Optional. Number of jobs, up to twenty, that will be included in the jobs query.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use this string to request the next batch of jobs matched by a jobs query.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING
        # or DESCENDING order. Default varies by resource.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @filter_list : Array(Types::JobsQueryFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil
        )
        end
      end

      # Successful requests return an ID that corresponds to an asynchronous jobs query.

      struct StartJobsQueryResponse
        include JSON::Serializable

        # The ID of the jobs query.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Use these settings to set up encryption with a static key provider.

      struct StaticKeyProvider
        include JSON::Serializable

        # Relates to DRM implementation. Sets the value of the KEYFORMAT attribute. Must be 'identity' or a
        # reverse DNS string. May be omitted to indicate an implicit value of 'identity'.

        @[JSON::Field(key: "keyFormat")]
        getter key_format : String?

        # Relates to DRM implementation. Either a single positive integer version value or a slash delimited
        # list of version values (1/2/3).

        @[JSON::Field(key: "keyFormatVersions")]
        getter key_format_versions : String?

        # Relates to DRM implementation. Use a 32-character hexidecimal string to specify Key Value.

        @[JSON::Field(key: "staticKeyValue")]
        getter static_key_value : String?

        # Relates to DRM implementation. The location of the license server used for protecting content.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @key_format : String? = nil,
          @key_format_versions : String? = nil,
          @static_key_value : String? = nil,
          @url : String? = nil
        )
        end
      end

      # To add tags to a queue, preset, or job template, send a request with the Amazon Resource Name (ARN)
      # of the resource and the tags that you want to add.

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag. To get the ARN, send a GET
        # request with the resource name.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The tags that you want to add to the resource. You can tag resources with a key-value pair or with
        # only a key.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # A successful request to add tags to a resource returns an OK message.

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Settings related to teletext captions. Set up teletext captions in the same output as your video.
      # For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/teletext-output-captions.html.

      struct TeletextDestinationSettings
        include JSON::Serializable

        # Set pageNumber to the Teletext page number for the destination captions for this output. This value
        # must be a three-digit hexadecimal string; strings ending in -FF are invalid. If you are passing
        # through the entire set of Teletext data, do not use this field.

        @[JSON::Field(key: "pageNumber")]
        getter page_number : String?

        # Specify the page types for this Teletext page. If you don't specify a value here, the service sets
        # the page type to the default value Subtitle. If you pass through the entire set of Teletext data,
        # don't use this field. When you pass through a set of Teletext pages, your output has the same page
        # types as your input.

        @[JSON::Field(key: "pageTypes")]
        getter page_types : Array(String)?

        def initialize(
          @page_number : String? = nil,
          @page_types : Array(String)? = nil
        )
        end
      end

      # Settings specific to Teletext caption sources, including Page number.

      struct TeletextSourceSettings
        include JSON::Serializable

        # Use Page Number to specify the three-digit hexadecimal page number that will be used for Teletext
        # captions. Do not use this setting if you are passing through teletext from the input source to
        # output.

        @[JSON::Field(key: "pageNumber")]
        getter page_number : String?

        def initialize(
          @page_number : String? = nil
        )
        end
      end

      # Settings for burning the output timecode and specified prefix into the output.

      struct TimecodeBurnin
        include JSON::Serializable

        # Use Font size to set the font size of any burned-in timecode. Valid values are 10, 16, 32, 48.

        @[JSON::Field(key: "fontSize")]
        getter font_size : Int32?

        # Use Position under Timecode burn-in to specify the location the burned-in timecode on output video.

        @[JSON::Field(key: "position")]
        getter position : String?

        # Use Prefix to place ASCII characters before any burned-in timecode. For example, a prefix of "EZ-"
        # will result in the timecode "EZ-00:00:00:00". Provide either the characters themselves or the ASCII
        # code equivalents. The supported range of characters is 0x20 through 0x7e. This includes letters,
        # numbers, and all special characters represented on a standard English keyboard.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @font_size : Int32? = nil,
          @position : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # These settings control how the service handles timecodes throughout the job. These settings don't
      # affect input clipping.

      struct TimecodeConfig
        include JSON::Serializable

        # If you use an editing platform that relies on an anchor timecode, use Anchor Timecode to specify a
        # timecode that will match the input video frame to the output video frame. Use 24-hour format with
        # frame number, (HH:MM:SS:FF) or (HH:MM:SS;FF). This setting ignores frame rate conversion. System
        # behavior for Anchor Timecode varies depending on your setting for Source. * If Source is set to
        # Specified Start, the first input frame is the specified value in Start Timecode. Anchor Timecode and
        # Start Timecode are used calculate output timecode. * If Source is set to Start at 0 the first frame
        # is 00:00:00:00. * If Source is set to Embedded, the first frame is the timecode value on the first
        # input frame of the input.

        @[JSON::Field(key: "anchor")]
        getter anchor : String?

        # Use Source to set how timecodes are handled within this job. To make sure that your video, audio,
        # captions, and markers are synchronized and that time-based features, such as image inserter, work
        # correctly, choose the Timecode source option that matches your assets. All timecodes are in a
        # 24-hour format with frame number (HH:MM:SS:FF). * Embedded - Use the timecode that is in the input
        # video. If no embedded timecode is in the source, the service will use Start at 0 instead. * Start at
        # 0 - Set the timecode of the initial frame to 00:00:00:00. * Specified Start - Set the timecode of
        # the initial frame to a value other than zero. You use Start timecode to provide this value.

        @[JSON::Field(key: "source")]
        getter source : String?

        # Only use when you set Source to Specified start. Use Start timecode to specify the timecode for the
        # initial frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or (HH:MM:SS;FF).

        @[JSON::Field(key: "start")]
        getter start : String?

        # Only applies to outputs that support program-date-time stamp. Use Timestamp offset to overwrite the
        # timecode date without affecting the time and frame number. Provide the new date as a string in the
        # format "yyyy-mm-dd". To use Timestamp offset, you must also enable Insert program-date-time in the
        # output settings. For example, if the date part of your timecodes is 2002-1-25 and you want to change
        # it to one year later, set Timestamp offset to 2003-1-25.

        @[JSON::Field(key: "timestampOffset")]
        getter timestamp_offset : String?

        def initialize(
          @anchor : String? = nil,
          @source : String? = nil,
          @start : String? = nil,
          @timestamp_offset : String? = nil
        )
        end
      end

      # Insert user-defined custom ID3 metadata at timecodes that you specify. In each output that you want
      # to include this metadata, you must set ID3 metadata to Passthrough.

      struct TimedMetadataInsertion
        include JSON::Serializable

        # Id3Insertions contains the array of Id3Insertion instances.

        @[JSON::Field(key: "id3Insertions")]
        getter id3_insertions : Array(Types::Id3Insertion)?

        def initialize(
          @id3_insertions : Array(Types::Id3Insertion)? = nil
        )
        end
      end

      # Information about when jobs are submitted, started, and finished is specified in Unix epoch format
      # in seconds.

      struct Timing
        include JSON::Serializable

        # The time, in Unix epoch format, that the transcoding job finished

        @[JSON::Field(key: "finishTime")]
        getter finish_time : Time?

        # The time, in Unix epoch format, that transcoding for the job began.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The time, in Unix epoch format, that you submitted the job.

        @[JSON::Field(key: "submitTime")]
        getter submit_time : Time?

        def initialize(
          @finish_time : Time? = nil,
          @start_time : Time? = nil,
          @submit_time : Time? = nil
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

      # Details about each track (video, audio, or data) in the media file.

      struct Track
        include JSON::Serializable

        # Details about the media file's audio track.

        @[JSON::Field(key: "audioProperties")]
        getter audio_properties : Types::AudioProperties?

        # The codec of the audio or video track, or caption format of the data track.

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Details about the media file's data track.

        @[JSON::Field(key: "dataProperties")]
        getter data_properties : Types::DataProperties?

        # The duration of the track, in seconds.

        @[JSON::Field(key: "duration")]
        getter duration : Float64?

        # The unique index number of the track, starting at 1.

        @[JSON::Field(key: "index")]
        getter index : Int32?

        # The type of track: video, audio, or data.

        @[JSON::Field(key: "trackType")]
        getter track_type : String?

        # Details about the media file's video track.

        @[JSON::Field(key: "videoProperties")]
        getter video_properties : Types::VideoProperties?

        def initialize(
          @audio_properties : Types::AudioProperties? = nil,
          @codec : String? = nil,
          @data_properties : Types::DataProperties? = nil,
          @duration : Float64? = nil,
          @index : Int32? = nil,
          @track_type : String? = nil,
          @video_properties : Types::VideoProperties? = nil
        )
        end
      end

      # An array containing track mapping information.

      struct TrackMapping
        include JSON::Serializable

        # The index numbers of the audio tracks in your media file.

        @[JSON::Field(key: "audioTrackIndexes")]
        getter audio_track_indexes : Array(Int32)?

        # The index numbers of the data tracks in your media file.

        @[JSON::Field(key: "dataTrackIndexes")]
        getter data_track_indexes : Array(Int32)?

        # The index numbers of the video tracks in your media file.

        @[JSON::Field(key: "videoTrackIndexes")]
        getter video_track_indexes : Array(Int32)?

        def initialize(
          @audio_track_indexes : Array(Int32)? = nil,
          @data_track_indexes : Array(Int32)? = nil,
          @video_track_indexes : Array(Int32)? = nil
        )
        end
      end

      # Settings specific to caption sources that are specified by track number. Currently, this is only
      # IMSC captions in an IMF package. If your caption source is IMSC 1.1 in a separate xml file, use
      # FileSourceSettings instead of TrackSourceSettings.

      struct TrackSourceSettings
        include JSON::Serializable

        # Use this setting to select a single captions track from a source. Stream numbers include all tracks
        # in the source file, regardless of type, and correspond to either the order of tracks in the file, or
        # if applicable, the stream number metadata of the track. Although all tracks count toward these
        # stream numbers, in this caption selector context, only the stream number of a track containing
        # caption data may be used. To include more than one captions track in your job outputs, create
        # multiple input captions selectors. Specify one stream per selector. If your source file contains a
        # track which is not recognized by the service, then the corresponding stream number will still be
        # reserved for future use. If more types of caption data get recognized in the future, these
        # numberings will not shift.

        @[JSON::Field(key: "streamNumber")]
        getter stream_number : Int32?

        # Use this setting to select a single captions track from a source. Track numbers correspond to the
        # order in the captions source file. For IMF sources, track numbering is based on the order that the
        # captions appear in the CPL. For example, use 1 to select the captions asset that is listed first in
        # the CPL. To include more than one captions track in your job outputs, create multiple input captions
        # selectors. Specify one track per selector. If more types of caption data get recognized in the
        # future, these numberings may shift, but the numberings used for streamNumber will not.

        @[JSON::Field(key: "trackNumber")]
        getter track_number : Int32?

        def initialize(
          @stream_number : Int32? = nil,
          @track_number : Int32? = nil
        )
        end
      end

      # Settings related to TTML captions. TTML is a sidecar format that holds captions in a file that is
      # separate from the video container. Set up sidecar captions in the same output group, but different
      # output from your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

      struct TtmlDestinationSettings
        include JSON::Serializable

        # Pass through style and position information from a TTML-like input source (TTML, IMSC, SMPTE-TT) to
        # the TTML output.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        def initialize(
          @style_passthrough : String? = nil
        )
        end
      end

      # Required when you set Codec, under VideoDescription>CodecSettings to the value UNCOMPRESSED.

      struct UncompressedSettings
        include JSON::Serializable

        # The four character code for the uncompressed video.

        @[JSON::Field(key: "fourcc")]
        getter fourcc : String?

        # Use the Framerate setting to specify the frame rate for this output. If you want to keep the same
        # frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose
        # a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are
        # decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Optional. Choose the scan line type for this output. If you don't specify a value, MediaConvert will
        # create a progressive output.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output by relabeling the video frames and resampling your audio. Note
        # that enabling this setting will slightly reduce the duration of your video. Related settings: You
        # must also set Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard telecine to create a smoother picture. When
        # you keep the default value, None, MediaConvert does a standard frame rate conversion to 29.97
        # without doing anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        def initialize(
          @fourcc : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @interlace_mode : String? = nil,
          @scan_type_conversion_mode : String? = nil,
          @slow_pal : String? = nil,
          @telecine : String? = nil
        )
        end
      end

      # To remove tags from a resource, send a request with the Amazon Resource Name (ARN) of the resource
      # and the keys of the tags that you want to remove.

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from. To get the ARN,
        # send a GET request with the resource name.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The keys of the tags that you want to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)?

        def initialize(
          @arn : String,
          @tag_keys : Array(String)? = nil
        )
        end
      end

      # A successful request to remove tags from a resource returns an OK message.

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Modify a job template by sending a request with the job template name and any of the following that
      # you wish to change: description, category, and queue.

      struct UpdateJobTemplateRequest
        include JSON::Serializable

        # The name of the job template you are modifying

        @[JSON::Field(key: "name")]
        getter name : String

        # Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs
        # that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS
        # Elemental MediaConvert User Guide.

        @[JSON::Field(key: "accelerationSettings")]
        getter acceleration_settings : Types::AccelerationSettings?

        # The new category for the job template, if you are changing it.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The new description for the job template, if you are changing it.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional list of hop destinations.

        @[JSON::Field(key: "hopDestinations")]
        getter hop_destinations : Array(Types::HopDestination)?

        # Specify the relative priority for this job. In any given queue, the service begins processing the
        # job with the highest value first. When more than one job has the same priority, the service begins
        # processing the job that you submitted first. If you don't specify a priority, the service uses the
        # default value 0.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The new queue for the job template, if you are changing it.

        @[JSON::Field(key: "queue")]
        getter queue : String?

        # JobTemplateSettings contains all the transcode settings saved in the template that will be applied
        # to jobs created from it.

        @[JSON::Field(key: "settings")]
        getter settings : Types::JobTemplateSettings?

        # Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the
        # interval, in seconds, between status updates. MediaConvert sends an update at this interval from the
        # time the service begins processing your job to the time it completes the transcode or encounters an
        # error.

        @[JSON::Field(key: "statusUpdateInterval")]
        getter status_update_interval : String?

        def initialize(
          @name : String,
          @acceleration_settings : Types::AccelerationSettings? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @hop_destinations : Array(Types::HopDestination)? = nil,
          @priority : Int32? = nil,
          @queue : String? = nil,
          @settings : Types::JobTemplateSettings? = nil,
          @status_update_interval : String? = nil
        )
        end
      end

      # Successful update job template requests will return the new job template JSON.

      struct UpdateJobTemplateResponse
        include JSON::Serializable

        # A job template is a pre-made set of encoding instructions that you can use to quickly create a job.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : Types::JobTemplate?

        def initialize(
          @job_template : Types::JobTemplate? = nil
        )
        end
      end

      # Modify a preset by sending a request with the preset name and any of the following that you wish to
      # change: description, category, and transcoding settings.

      struct UpdatePresetRequest
        include JSON::Serializable

        # The name of the preset you are modifying.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new category for the preset, if you are changing it.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The new description for the preset, if you are changing it.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Settings for preset

        @[JSON::Field(key: "settings")]
        getter settings : Types::PresetSettings?

        def initialize(
          @name : String,
          @category : String? = nil,
          @description : String? = nil,
          @settings : Types::PresetSettings? = nil
        )
        end
      end

      # Successful update preset requests will return the new preset JSON.

      struct UpdatePresetResponse
        include JSON::Serializable

        # A preset is a collection of preconfigured media conversion settings that you want MediaConvert to
        # apply to the output during the conversion process.

        @[JSON::Field(key: "preset")]
        getter preset : Types::Preset?

        def initialize(
          @preset : Types::Preset? = nil
        )
        end
      end

      # Modify a queue by sending a request with the queue name and any changes to the queue.

      struct UpdateQueueRequest
        include JSON::Serializable

        # The name of the queue that you are modifying.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify the maximum number of jobs your queue can process concurrently. For on-demand queues, the
        # value you enter is constrained by your service quotas for Maximum concurrent jobs, per on-demand
        # queue and Maximum concurrent jobs, per account. For reserved queues, update your reservation plan
        # instead in order to increase your yearly commitment.

        @[JSON::Field(key: "concurrentJobs")]
        getter concurrent_jobs : Int32?

        # The new description for the queue, if you are changing it.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new details of your pricing plan for your reserved queue. When you set up a new pricing plan to
        # replace an expired one, you enter into another 12-month commitment. When you add capacity to your
        # queue by increasing the number of RTS, you extend the term of your commitment to 12 months from when
        # you add capacity. After you make these commitments, you can't cancel them.

        @[JSON::Field(key: "reservationPlanSettings")]
        getter reservation_plan_settings : Types::ReservationPlanSettings?

        # Pause or activate a queue by changing its status between ACTIVE and PAUSED. If you pause a queue,
        # jobs in that queue won't begin. Jobs that are running when you pause the queue continue to run until
        # they finish or result in an error.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String,
          @concurrent_jobs : Int32? = nil,
          @description : String? = nil,
          @reservation_plan_settings : Types::ReservationPlanSettings? = nil,
          @status : String? = nil
        )
        end
      end

      # Successful update queue requests return the new queue information in JSON format.

      struct UpdateQueueResponse
        include JSON::Serializable

        # You can use queues to manage the resources that are available to your AWS account for running
        # multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs
        # through the default queue. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.

        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # Required when you set Codec to the value VC3

      struct Vc3Settings
        include JSON::Serializable

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Optional. Choose the scan line type for this output. If you don't specify a value, MediaConvert will
        # create a progressive output.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Use this setting for interlaced outputs, when your output frame rate is half of your input frame
        # rate. In this situation, choose Optimized interlacing to create a better quality interlaced output.
        # In this case, each progressive frame from the input corresponds to an interlaced field in the
        # output. Keep the default value, Basic interlacing, for all other output frame rates. With basic
        # interlacing, MediaConvert performs any frame rate conversion first and then interlaces the frames.
        # When you choose Optimized interlacing and you set your output frame rate to a value that isn't
        # suitable for optimized interlacing, MediaConvert automatically falls back to basic interlacing.
        # Required settings: To use optimized interlacing, you must set Telecine to None or Soft. You can't
        # use optimized interlacing for hard telecine outputs. You must also set Interlace mode to a value
        # other than Progressive.

        @[JSON::Field(key: "scanTypeConversionMode")]
        getter scan_type_conversion_mode : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output by relabeling the video frames and resampling your audio. Note
        # that enabling this setting will slightly reduce the duration of your video. Related settings: You
        # must also set Framerate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # When you do frame rate conversion from 23.976 frames per second (fps) to 29.97 fps, and your output
        # scan type is interlaced, you can optionally enable hard telecine to create a smoother picture. When
        # you keep the default value, None, MediaConvert does a standard frame rate conversion to 29.97
        # without doing anything with the field polarity to create a smoother picture.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        # Specify the VC3 class to choose the quality characteristics for this output. VC3 class, together
        # with the settings Framerate (framerateNumerator and framerateDenominator) and Resolution (height and
        # width), determine your output bitrate. For example, say that your video resolution is 1920x1080 and
        # your framerate is 29.97. Then Class 145 gives you an output with a bitrate of approximately 145 Mbps
        # and Class 220 gives you and output with a bitrate of approximately 220 Mbps. VC3 class also
        # specifies the color bit depth of your output.

        @[JSON::Field(key: "vc3Class")]
        getter vc3_class : String?

        def initialize(
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @interlace_mode : String? = nil,
          @scan_type_conversion_mode : String? = nil,
          @slow_pal : String? = nil,
          @telecine : String? = nil,
          @vc3_class : String? = nil
        )
        end
      end

      # Video codec settings contains the group of settings related to video encoding. The settings in this
      # group vary depending on the value that you choose for Video codec. For each codec enum that you
      # choose, define the corresponding settings object. The following lists the codec enum, settings
      # object pairs. * AV1, Av1Settings * AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings
      # * GIF, GifSettings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
      # ProresSettings * UNCOMPRESSED, UncompressedSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9,
      # Vp9Settings * XAVC, XavcSettings

      struct VideoCodecSettings
        include JSON::Serializable

        # Required when you set Codec, under VideoDescription>CodecSettings to the value AV1.

        @[JSON::Field(key: "av1Settings")]
        getter av1_settings : Types::Av1Settings?

        # Required when you choose AVC-Intra for your output video codec. For more information about the
        # AVC-Intra settings, see the relevant specification. For detailed information about SD and HD in
        # AVC-Intra, see https://ieeexplore.ieee.org/document/7290936. For information about 4K/2K in
        # AVC-Intra, see https://pro-av.panasonic.net/en/avc-ultra/AVC-ULTRAoverview.pdf.

        @[JSON::Field(key: "avcIntraSettings")]
        getter avc_intra_settings : Types::AvcIntraSettings?

        # Specifies the video codec. This must be equal to one of the enum values defined by the object
        # VideoCodec. To passthrough the video stream of your input without any video encoding: Choose
        # Passthrough. More information about passthrough codec support and job settings requirements, see:
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/video-passthrough-feature-restrictions.html

        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Required when you set Codec to the value FRAME_CAPTURE.

        @[JSON::Field(key: "frameCaptureSettings")]
        getter frame_capture_settings : Types::FrameCaptureSettings?

        # Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value GIF

        @[JSON::Field(key: "gifSettings")]
        getter gif_settings : Types::GifSettings?

        # Required when you set Codec to the value H_264.

        @[JSON::Field(key: "h264Settings")]
        getter h264_settings : Types::H264Settings?

        # Settings for H265 codec

        @[JSON::Field(key: "h265Settings")]
        getter h265_settings : Types::H265Settings?

        # Required when you set Codec to the value MPEG2.

        @[JSON::Field(key: "mpeg2Settings")]
        getter mpeg2_settings : Types::Mpeg2Settings?

        # Optional settings when you set Codec to the value Passthrough.

        @[JSON::Field(key: "passthroughSettings")]
        getter passthrough_settings : Types::PassthroughSettings?

        # Required when you set Codec to the value PRORES.

        @[JSON::Field(key: "proresSettings")]
        getter prores_settings : Types::ProresSettings?

        # Required when you set Codec, under VideoDescription>CodecSettings to the value UNCOMPRESSED.

        @[JSON::Field(key: "uncompressedSettings")]
        getter uncompressed_settings : Types::UncompressedSettings?

        # Required when you set Codec to the value VC3

        @[JSON::Field(key: "vc3Settings")]
        getter vc3_settings : Types::Vc3Settings?

        # Required when you set Codec to the value VP8.

        @[JSON::Field(key: "vp8Settings")]
        getter vp8_settings : Types::Vp8Settings?

        # Required when you set Codec to the value VP9.

        @[JSON::Field(key: "vp9Settings")]
        getter vp9_settings : Types::Vp9Settings?

        # Required when you set Codec to the value XAVC.

        @[JSON::Field(key: "xavcSettings")]
        getter xavc_settings : Types::XavcSettings?

        def initialize(
          @av1_settings : Types::Av1Settings? = nil,
          @avc_intra_settings : Types::AvcIntraSettings? = nil,
          @codec : String? = nil,
          @frame_capture_settings : Types::FrameCaptureSettings? = nil,
          @gif_settings : Types::GifSettings? = nil,
          @h264_settings : Types::H264Settings? = nil,
          @h265_settings : Types::H265Settings? = nil,
          @mpeg2_settings : Types::Mpeg2Settings? = nil,
          @passthrough_settings : Types::PassthroughSettings? = nil,
          @prores_settings : Types::ProresSettings? = nil,
          @uncompressed_settings : Types::UncompressedSettings? = nil,
          @vc3_settings : Types::Vc3Settings? = nil,
          @vp8_settings : Types::Vp8Settings? = nil,
          @vp9_settings : Types::Vp9Settings? = nil,
          @xavc_settings : Types::XavcSettings? = nil
        )
        end
      end

      # Settings related to video encoding of your output. The specific video settings depend on the video
      # codec that you choose.

      struct VideoDescription
        include JSON::Serializable

        # This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD signaling to specify
        # whether the service includes AFD values in the output video data and what those values are. * Choose
        # None to remove all AFD values from this output. * Choose Fixed to ignore input AFD values and
        # instead encode the value specified in the job. * Choose Auto to calculate output AFD values based on
        # the input AFD scaler data.

        @[JSON::Field(key: "afdSignaling")]
        getter afd_signaling : String?

        # The anti-alias filter is automatically applied to all outputs. The service no longer accepts the
        # value DISABLED for AntiAlias. If you specify that in your job, the service will ignore the setting.

        @[JSON::Field(key: "antiAlias")]
        getter anti_alias : String?

        # Specify the chroma sample positioning metadata for your H.264 or H.265 output. To have MediaConvert
        # automatically determine chroma positioning: We recommend that you keep the default value, Auto. To
        # specify center positioning: Choose Force center. To specify top left positioning: Choose Force top
        # left.

        @[JSON::Field(key: "chromaPositionMode")]
        getter chroma_position_mode : String?

        # Video codec settings contains the group of settings related to video encoding. The settings in this
        # group vary depending on the value that you choose for Video codec. For each codec enum that you
        # choose, define the corresponding settings object. The following lists the codec enum, settings
        # object pairs. * AV1, Av1Settings * AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings
        # * GIF, GifSettings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
        # ProresSettings * UNCOMPRESSED, UncompressedSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9,
        # Vp9Settings * XAVC, XavcSettings

        @[JSON::Field(key: "codecSettings")]
        getter codec_settings : Types::VideoCodecSettings?

        # Choose Insert for this setting to include color metadata in this output. Choose Ignore to exclude
        # color metadata from this output. If you don't specify a value, the service sets this to Insert by
        # default.

        @[JSON::Field(key: "colorMetadata")]
        getter color_metadata : String?

        # Use Cropping selection to specify the video area that the service will include in the output video
        # frame.

        @[JSON::Field(key: "crop")]
        getter crop : Types::Rectangle?

        # Applies only to 29.97 fps outputs. When this feature is enabled, the service will use drop-frame
        # timecode on outputs. If it is not possible to use drop-frame timecode, the system will fall back to
        # non-drop-frame. This setting is enabled by default when Timecode insertion or Timecode track is
        # enabled.

        @[JSON::Field(key: "dropFrameTimecode")]
        getter drop_frame_timecode : String?

        # Applies only if you set AFD Signaling to Fixed. Use Fixed to specify a four-bit AFD value which the
        # service will write on all frames of this video output.

        @[JSON::Field(key: "fixedAfd")]
        getter fixed_afd : Int32?

        # Use Height to define the video resolution height, in pixels, for this output. To use the same
        # resolution as your input: Leave both Width and Height blank. To evenly scale from your input
        # resolution: Leave Height blank and enter a value for Width. For example, if your input is 1920x1080
        # and you set Width to 1280, your output will be 1280x720.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Use Selection placement to define the video area in your output frame. The area outside of the
        # rectangle that you specify here is black.

        @[JSON::Field(key: "position")]
        getter position : Types::Rectangle?

        # Use Respond to AFD to specify how the service changes the video itself in response to AFD values in
        # the input. * Choose Respond to clip the input video frame according to the AFD value, input display
        # aspect ratio, and output display aspect ratio. * Choose Passthrough to include the input AFD values.
        # Do not choose this when AfdSignaling is set to NONE. A preferred implementation of this workflow is
        # to set RespondToAfd to and set AfdSignaling to AUTO. * Choose None to remove all input AFD values
        # from this output.

        @[JSON::Field(key: "respondToAfd")]
        getter respond_to_afd : String?

        # Specify the video Scaling behavior when your output has a different resolution than your input. For
        # more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/video-scaling.html

        @[JSON::Field(key: "scalingBehavior")]
        getter scaling_behavior : String?

        # Use Sharpness setting to specify the strength of anti-aliasing. This setting changes the width of
        # the anti-alias filter kernel used for scaling. Sharpness only applies if your output resolution is
        # different from your input resolution. 0 is the softest setting, 100 the sharpest, and 50 recommended
        # for most content.

        @[JSON::Field(key: "sharpness")]
        getter sharpness : Int32?

        # Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable Timecode insertion when the
        # input frame rate is identical to the output frame rate. To include timecodes in this output, set
        # Timecode insertion to PIC_TIMING_SEI. To leave them out, set it to DISABLED. Default is DISABLED.
        # When the service inserts timecodes in an output, by default, it uses any embedded timecodes from the
        # input. If none are present, the service will set the timecode for the first output frame to zero. To
        # change this default behavior, adjust the settings under Timecode configuration. In the console,
        # these settings are located under Job > Job settings > Timecode configuration. Note - Timecode source
        # under input settings does not affect the timecodes that are inserted in the output. Source under Job
        # settings > Timecode configuration does.

        @[JSON::Field(key: "timecodeInsertion")]
        getter timecode_insertion : String?

        # To include a timecode track in your MP4 output: Choose Enabled. MediaConvert writes the timecode
        # track in the Null Media Header box (NMHD), without any timecode text formatting information. You can
        # also specify dropframe or non-dropframe timecode under the Drop Frame Timecode setting. To not
        # include a timecode track: Keep the default value, Disabled.

        @[JSON::Field(key: "timecodeTrack")]
        getter timecode_track : String?

        # Find additional transcoding features under Preprocessors. Enable the features at each output
        # individually. These features are disabled by default.

        @[JSON::Field(key: "videoPreprocessors")]
        getter video_preprocessors : Types::VideoPreprocessor?

        # Use Width to define the video resolution width, in pixels, for this output. To use the same
        # resolution as your input: Leave both Width and Height blank. To evenly scale from your input
        # resolution: Leave Width blank and enter a value for Height. For example, if your input is 1920x1080
        # and you set Height to 720, your output will be 1280x720.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @afd_signaling : String? = nil,
          @anti_alias : String? = nil,
          @chroma_position_mode : String? = nil,
          @codec_settings : Types::VideoCodecSettings? = nil,
          @color_metadata : String? = nil,
          @crop : Types::Rectangle? = nil,
          @drop_frame_timecode : String? = nil,
          @fixed_afd : Int32? = nil,
          @height : Int32? = nil,
          @position : Types::Rectangle? = nil,
          @respond_to_afd : String? = nil,
          @scaling_behavior : String? = nil,
          @sharpness : Int32? = nil,
          @timecode_insertion : String? = nil,
          @timecode_track : String? = nil,
          @video_preprocessors : Types::VideoPreprocessor? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Contains details about the output's video stream

      struct VideoDetail
        include JSON::Serializable

        # Height in pixels for the output

        @[JSON::Field(key: "heightInPx")]
        getter height_in_px : Int32?

        # Width in pixels for the output

        @[JSON::Field(key: "widthInPx")]
        getter width_in_px : Int32?

        def initialize(
          @height_in_px : Int32? = nil,
          @width_in_px : Int32? = nil
        )
        end
      end

      # Overlay one or more videos on top of your input video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/video-overlays.html

      struct VideoOverlay
        include JSON::Serializable

        # Specify a rectangle of content to crop and use from your video overlay's input video. When you do,
        # MediaConvert uses the cropped dimensions that you specify under X offset, Y offset, Width, and
        # Height.

        @[JSON::Field(key: "crop")]
        getter crop : Types::VideoOverlayCrop?

        # Enter the end timecode in the base input video for this overlay. Your overlay will be active through
        # this frame. To display your video overlay for the duration of the base input video: Leave blank. Use
        # the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS isthe second, and
        # FF is the frame number. When entering this value, take into account your choice for the base input
        # video's timecode source. For example, if you have embedded timecodes that start at 01:00:00:00 and
        # you want your overlay to end ten minutes into the video, enter 01:10:00:00.

        @[JSON::Field(key: "endTimecode")]
        getter end_timecode : String?

        # Specify the Initial position of your video overlay. To specify the Initial position of your video
        # overlay, including distance from the left or top edge of the base input video's frame, or size:
        # Enter a value for X position, Y position, Width, or Height. To use the full frame of the base input
        # video: Leave blank.

        @[JSON::Field(key: "initialPosition")]
        getter initial_position : Types::VideoOverlayPosition?

        # Input settings for Video overlay. You can include one or more video overlays in sequence at
        # different times that you specify.

        @[JSON::Field(key: "input")]
        getter input : Types::VideoOverlayInput?

        # Specify whether your video overlay repeats or plays only once. To repeat your video overlay on a
        # loop: Keep the default value, Repeat. Your overlay will repeat for the duration of the base input
        # video. To playback your video overlay only once: Choose Once. With either option, you can end
        # playback at a time that you specify by entering a value for End timecode.

        @[JSON::Field(key: "playback")]
        getter playback : String?

        # Enter the start timecode in the base input video for this overlay. Your overlay will be active
        # starting with this frame. To display your video overlay starting at the beginning of the base input
        # video: Leave blank. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the
        # minute, SS is the second, and FF is the frame number. When entering this value, take into account
        # your choice for the base input video's timecode source. For example, if you have embedded timecodes
        # that start at 01:00:00:00 and you want your overlay to begin five minutes into the video, enter
        # 01:05:00:00.

        @[JSON::Field(key: "startTimecode")]
        getter start_timecode : String?

        # Specify one or more transitions for your video overlay. Use Transitions to reposition or resize your
        # overlay over time. To use the same position and size for the duration of your video overlay: Leave
        # blank. To specify a Transition: Enter a value for Start timecode, End Timecode, X Position, Y
        # Position, Width, or Height.

        @[JSON::Field(key: "transitions")]
        getter transitions : Array(Types::VideoOverlayTransition)?

        def initialize(
          @crop : Types::VideoOverlayCrop? = nil,
          @end_timecode : String? = nil,
          @initial_position : Types::VideoOverlayPosition? = nil,
          @input : Types::VideoOverlayInput? = nil,
          @playback : String? = nil,
          @start_timecode : String? = nil,
          @transitions : Array(Types::VideoOverlayTransition)? = nil
        )
        end
      end

      # Specify a rectangle of content to crop and use from your video overlay's input video. When you do,
      # MediaConvert uses the cropped dimensions that you specify under X offset, Y offset, Width, and
      # Height.

      struct VideoOverlayCrop
        include JSON::Serializable

        # Specify the height of the video overlay cropping rectangle. To use the same height as your overlay
        # input video: Keep blank, or enter 0. To specify a different height for the cropping rectangle: Enter
        # an integer representing the Unit type that you choose, either Pixels or Percentage. For example,
        # when you enter 100 and choose Pixels, the cropping rectangle will be 100 pixels high. When you enter
        # 10, choose Percentage, and your overlay input video is 1920x1080, the cropping rectangle will be 108
        # pixels high.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Specify the Unit type to use when you enter a value for X position, Y position, Width, or Height.
        # You can choose Pixels or Percentage. Leave blank to use the default value, Pixels.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # Specify the width of the video overlay cropping rectangle. To use the same width as your overlay
        # input video: Keep blank, or enter 0. To specify a different width for the cropping rectangle: Enter
        # an integer representing the Unit type that you choose, either Pixels or Percentage. For example,
        # when you enter 100 and choose Pixels, the cropping rectangle will be 100 pixels wide. When you enter
        # 10, choose Percentage, and your overlay input video is 1920x1080, the cropping rectangle will be 192
        # pixels wide.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        # Specify the distance between the cropping rectangle and the left edge of your overlay video's frame.
        # To position the cropping rectangle along the left edge: Keep blank, or enter 0. To position the
        # cropping rectangle to the right, relative to the left edge of your overlay video's frame: Enter an
        # integer representing the Unit type that you choose, either Pixels or Percentage. For example, when
        # you enter 10 and choose Pixels, the cropping rectangle will be positioned 10 pixels from the left
        # edge of the overlay video's frame. When you enter 10, choose Percentage, and your overlay input
        # video is 1920x1080, the cropping rectangle will be positioned 192 pixels from the left edge of the
        # overlay video's frame.

        @[JSON::Field(key: "x")]
        getter x : Int32?

        # Specify the distance between the cropping rectangle and the top edge of your overlay video's frame.
        # To position the cropping rectangle along the top edge: Keep blank, or enter 0. To position the
        # cropping rectangle down, relative to the top edge of your overlay video's frame: Enter an integer
        # representing the Unit type that you choose, either Pixels or Percentage. For example, when you enter
        # 10 and choose Pixels, the cropping rectangle will be positioned 10 pixels from the top edge of the
        # overlay video's frame. When you enter 10, choose Percentage, and your overlay input video is
        # 1920x1080, the cropping rectangle will be positioned 108 pixels from the top edge of the overlay
        # video's frame.

        @[JSON::Field(key: "y")]
        getter y : Int32?

        def initialize(
          @height : Int32? = nil,
          @unit : String? = nil,
          @width : Int32? = nil,
          @x : Int32? = nil,
          @y : Int32? = nil
        )
        end
      end

      # Input settings for Video overlay. You can include one or more video overlays in sequence at
      # different times that you specify.

      struct VideoOverlayInput
        include JSON::Serializable

        # Use Audio selectors to specify audio to use during your Video overlay. You can use multiple Audio
        # selectors per Video overlay. When you include an Audio selector within a Video overlay, MediaConvert
        # mutes any Audio selectors with the same name from the underlying input. For example, if your
        # underlying input has Audio selector 1 and Audio selector 2, and your Video overlay only has Audio
        # selector 1, then MediaConvert replaces all audio for Audio selector 1 during the Video overlay. To
        # replace all audio for all Audio selectors from the underlying input by using a single Audio selector
        # in your overlay, set DefaultSelection to DEFAULT (Check \"Use as default\" in the MediaConvert
        # console).

        @[JSON::Field(key: "audioSelectors")]
        getter audio_selectors : Hash(String, Types::AudioSelector)?

        # Specify the input file S3, HTTP, or HTTPS URL for your video overlay. To specify one or more
        # Transitions for your base input video instead: Leave blank.

        @[JSON::Field(key: "fileInput")]
        getter file_input : String?

        # Specify one or more clips to use from your video overlay. When you include an input clip, you must
        # also specify its start timecode, end timecode, or both start and end timecode.

        @[JSON::Field(key: "inputClippings")]
        getter input_clippings : Array(Types::VideoOverlayInputClipping)?

        # Specify the timecode source for your video overlay input clips. To use the timecode present in your
        # video overlay: Choose Embedded. To use a zerobased timecode: Choose Start at 0. To choose a
        # timecode: Choose Specified start. When you do, enter the starting timecode in Start timecode. If you
        # don't specify a value for Timecode source, MediaConvert uses Embedded by default.

        @[JSON::Field(key: "timecodeSource")]
        getter timecode_source : String?

        # Specify the starting timecode for this video overlay. To use this setting, you must set Timecode
        # source to Specified start.

        @[JSON::Field(key: "timecodeStart")]
        getter timecode_start : String?

        def initialize(
          @audio_selectors : Hash(String, Types::AudioSelector)? = nil,
          @file_input : String? = nil,
          @input_clippings : Array(Types::VideoOverlayInputClipping)? = nil,
          @timecode_source : String? = nil,
          @timecode_start : String? = nil
        )
        end
      end

      # To transcode only portions of your video overlay, include one input clip for each part of your video
      # overlay that you want in your output.

      struct VideoOverlayInputClipping
        include JSON::Serializable

        # Specify the timecode of the last frame to include in your video overlay's clip. Use the format
        # HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS is the second, and FF is the
        # frame number. When entering this value, take into account your choice for Timecode source.

        @[JSON::Field(key: "endTimecode")]
        getter end_timecode : String?

        # Specify the timecode of the first frame to include in your video overlay's clip. Use the format
        # HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS is the second, and FF is the
        # frame number. When entering this value, take into account your choice for Timecode source.

        @[JSON::Field(key: "startTimecode")]
        getter start_timecode : String?

        def initialize(
          @end_timecode : String? = nil,
          @start_timecode : String? = nil
        )
        end
      end

      # position of video overlay

      struct VideoOverlayPosition
        include JSON::Serializable

        # To scale your video overlay to the same height as the base input video: Leave blank. To scale the
        # height of your video overlay to a different height: Enter an integer representing the Unit type that
        # you choose, either Pixels or Percentage. For example, when you enter 360 and choose Pixels, your
        # video overlay will be rendered with a height of 360. When you enter 50, choose Percentage, and your
        # overlay's source has a height of 1080, your video overlay will be rendered with a height of 540. To
        # scale your overlay to a specific height while automatically maintaining its original aspect ratio,
        # enter a value for Height and leave Width blank.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Use Opacity to specify how much of the underlying video shows through the overlay video. 0 is
        # transparent and 100 is fully opaque. Default is 100.

        @[JSON::Field(key: "opacity")]
        getter opacity : Int32?

        # Specify the Unit type to use when you enter a value for X position, Y position, Width, or Height.
        # You can choose Pixels or Percentage. Leave blank to use the default value, Pixels.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # To scale your video overlay to the same width as the base input video: Leave blank. To scale the
        # width of your video overlay to a different width: Enter an integer representing the Unit type that
        # you choose, either Pixels or Percentage. For example, when you enter 640 and choose Pixels, your
        # video overlay will scale to a height of 640 pixels. When you enter 50, choose Percentage, and your
        # overlay's source has a width of 1920, your video overlay will scale to a width of 960. To scale your
        # overlay to a specific width while automatically maintaining its original aspect ratio, enter a value
        # for Width and leave Height blank.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        # To position the left edge of your video overlay along the left edge of the base input video's frame:
        # Keep blank, or enter 0. To position the left edge of your video overlay to the right, relative to
        # the left edge of the base input video's frame: Enter an integer representing the Unit type that you
        # choose, either Pixels or Percentage. For example, when you enter 10 and choose Pixels, your video
        # overlay will be positioned 10 pixels from the left edge of the base input video's frame. When you
        # enter 10, choose Percentage, and your base input video is 1920x1080, your video overlay will be
        # positioned 192 pixels from the left edge of the base input video's frame.

        @[JSON::Field(key: "xPosition")]
        getter x_position : Int32?

        # To position the top edge of your video overlay along the top edge of the base input video's frame:
        # Keep blank, or enter 0. To position the top edge of your video overlay down, relative to the top
        # edge of the base input video's frame: Enter an integer representing the Unit type that you choose,
        # either Pixels or Percentage. For example, when you enter 10 and choose Pixels, your video overlay
        # will be positioned 10 pixels from the top edge of the base input video's frame. When you enter 10,
        # choose Percentage, and your underlying video is 1920x1080, your video overlay will be positioned 108
        # pixels from the top edge of the base input video's frame.

        @[JSON::Field(key: "yPosition")]
        getter y_position : Int32?

        def initialize(
          @height : Int32? = nil,
          @opacity : Int32? = nil,
          @unit : String? = nil,
          @width : Int32? = nil,
          @x_position : Int32? = nil,
          @y_position : Int32? = nil
        )
        end
      end

      # Specify one or more Transitions for your video overlay. Use Transitions to reposition or resize your
      # overlay over time. To use the same position and size for the duration of your video overlay: Leave
      # blank. To specify a Transition: Enter a value for Start timecode, End Timecode, X Position, Y
      # Position, Width, Height, or Opacity

      struct VideoOverlayTransition
        include JSON::Serializable

        # Specify the ending position for this transition, relative to the base input video's frame. Your
        # video overlay will move smoothly to this position, beginning at this transition's Start timecode and
        # ending at this transition's End timecode.

        @[JSON::Field(key: "endPosition")]
        getter end_position : Types::VideoOverlayPosition?

        # Specify the timecode for when this transition ends. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where
        # HH is the hour, MM is the minute, SS is the second, and FF is the frame number. When entering this
        # value, take into account your choice for Timecode source.

        @[JSON::Field(key: "endTimecode")]
        getter end_timecode : String?

        # Specify the timecode for when this transition begins. Use the format HH:MM:SS:FF or HH:MM:SS;FF,
        # where HH is the hour, MM is the minute, SS is the second, and FF is the frame number. When entering
        # this value, take into account your choice for Timecode source.

        @[JSON::Field(key: "startTimecode")]
        getter start_timecode : String?

        def initialize(
          @end_position : Types::VideoOverlayPosition? = nil,
          @end_timecode : String? = nil,
          @start_timecode : String? = nil
        )
        end
      end

      # Find additional transcoding features under Preprocessors. Enable the features at each output
      # individually. These features are disabled by default.

      struct VideoPreprocessor
        include JSON::Serializable

        # Use these settings to convert the color space or to modify properties such as hue and contrast for
        # this output. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/converting-the-color-space.html.

        @[JSON::Field(key: "colorCorrector")]
        getter color_corrector : Types::ColorCorrector?

        # Use the deinterlacer to produce smoother motion and a clearer picture. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-scan-type.html.

        @[JSON::Field(key: "deinterlacer")]
        getter deinterlacer : Types::Deinterlacer?

        # Enable Dolby Vision feature to produce Dolby Vision compatible video output.

        @[JSON::Field(key: "dolbyVision")]
        getter dolby_vision : Types::DolbyVision?

        # Enable HDR10+ analysis and metadata injection. Compatible with HEVC only.

        @[JSON::Field(key: "hdr10Plus")]
        getter hdr10_plus : Types::Hdr10Plus?

        # Enable the Image inserter feature to include a graphic overlay on your video. Enable or disable this
        # feature for each output individually. This setting is disabled by default.

        @[JSON::Field(key: "imageInserter")]
        getter image_inserter : Types::ImageInserter?

        # Enable the Noise reducer feature to remove noise from your video output if necessary. Enable or
        # disable this feature for each output individually. This setting is disabled by default. When you
        # enable Noise reducer, you must also select a value for Noise reducer filter. For AVC outputs, when
        # you include Noise reducer, you cannot include the Bandwidth reduction filter.

        @[JSON::Field(key: "noiseReducer")]
        getter noise_reducer : Types::NoiseReducer?

        # If you work with a third party video watermarking partner, use the group of settings that correspond
        # with your watermarking partner to include watermarks in your output.

        @[JSON::Field(key: "partnerWatermarking")]
        getter partner_watermarking : Types::PartnerWatermarking?

        # Settings for burning the output timecode and specified prefix into the output.

        @[JSON::Field(key: "timecodeBurnin")]
        getter timecode_burnin : Types::TimecodeBurnin?

        def initialize(
          @color_corrector : Types::ColorCorrector? = nil,
          @deinterlacer : Types::Deinterlacer? = nil,
          @dolby_vision : Types::DolbyVision? = nil,
          @hdr10_plus : Types::Hdr10Plus? = nil,
          @image_inserter : Types::ImageInserter? = nil,
          @noise_reducer : Types::NoiseReducer? = nil,
          @partner_watermarking : Types::PartnerWatermarking? = nil,
          @timecode_burnin : Types::TimecodeBurnin? = nil
        )
        end
      end

      # Details about the media file's video track.

      struct VideoProperties
        include JSON::Serializable

        # The number of bits used per color component such as 8, 10, or 12 bits. Standard range (SDR) video
        # typically uses 8-bit, while 10-bit is common for high dynamic range (HDR).

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # The bit rate of the video track, in bits per second.

        @[JSON::Field(key: "bitRate")]
        getter bit_rate : Int64?

        # Codec-specific parameters parsed from the video essence headers. This information provides detailed
        # technical specifications about how the video was encoded, including profile settings, resolution
        # details, and color space information that can help you understand the source video characteristics
        # and make informed encoding decisions.

        @[JSON::Field(key: "codecMetadata")]
        getter codec_metadata : Types::CodecMetadata?

        # The color space primaries of the video track, defining the red, green, and blue color coordinates
        # used for the video. This information helps ensure accurate color reproduction during playback and
        # transcoding.

        @[JSON::Field(key: "colorPrimaries")]
        getter color_primaries : String?

        # The frame rate of the video or audio track, expressed as a fraction with numerator and denominator
        # values.

        @[JSON::Field(key: "frameRate")]
        getter frame_rate : Types::FrameRate?

        # The height of the video track, in pixels.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # The color space matrix coefficients of the video track, defining how RGB color values are converted
        # to and from YUV color space. This affects color accuracy during encoding and decoding processes.

        @[JSON::Field(key: "matrixCoefficients")]
        getter matrix_coefficients : String?

        # The color space transfer characteristics of the video track, defining the relationship between
        # linear light values and the encoded signal values. This affects brightness and contrast
        # reproduction.

        @[JSON::Field(key: "transferCharacteristics")]
        getter transfer_characteristics : String?

        # The width of the video track, in pixels.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @bit_rate : Int64? = nil,
          @codec_metadata : Types::CodecMetadata? = nil,
          @color_primaries : String? = nil,
          @frame_rate : Types::FrameRate? = nil,
          @height : Int32? = nil,
          @matrix_coefficients : String? = nil,
          @transfer_characteristics : String? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Input video selectors contain the video settings for the input. Each of your inputs can have up to
      # one video selector.

      struct VideoSelector
        include JSON::Serializable

        # Ignore this setting unless this input is a QuickTime animation with an alpha channel. Use this
        # setting to create separate Key and Fill outputs. In each output, specify which part of the input
        # MediaConvert uses. Leave this setting at the default value DISCARD to delete the alpha channel and
        # preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the alpha channel to the
        # luma channel of your outputs.

        @[JSON::Field(key: "alphaBehavior")]
        getter alpha_behavior : String?

        # If your input video has accurate color space metadata, or if you don't know about color space: Keep
        # the default value, Follow. MediaConvert will automatically detect your input color space. If your
        # input video has metadata indicating the wrong color space, or has missing metadata: Specify the
        # accurate color space here. If your input video is HDR 10 and the SMPTE ST 2086 Mastering Display
        # Color Volume static metadata isn't present in your video stream, or if that metadata is present but
        # not accurate: Choose Force HDR 10. Specify correct values in the input HDR 10 metadata settings. For
        # more information about HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr. When you
        # specify an input color space, MediaConvert uses the following color space metadata, which includes
        # color primaries, transfer characteristics, and matrix coefficients: * HDR 10: BT.2020, PQ, BT.2020
        # non-constant * HLG 2020: BT.2020, HLG, BT.2020 non-constant * P3DCI (Theater): DCIP3, SMPTE 428M,
        # BT.709 * P3D65 (SDR): Display P3, sRGB, BT.709 * P3D65 (HDR): Display P3, PQ, BT.709

        @[JSON::Field(key: "colorSpace")]
        getter color_space : String?

        # There are two sources for color metadata, the input file and the job input settings Color space and
        # HDR master display information settings. The Color space usage setting determines which takes
        # precedence. Choose Force to use color metadata from the input job settings. If you don't specify
        # values for those settings, the service defaults to using metadata from your input. FALLBACK - Choose
        # Fallback to use color metadata from the source when it is present. If there's no color metadata in
        # your input file, the service defaults to using values you specify in the input settings.

        @[JSON::Field(key: "colorSpaceUsage")]
        getter color_space_usage : String?

        # Set Embedded timecode override to Use MDPM when your AVCHD input contains timecode tag data in the
        # Modified Digital Video Pack Metadata. When you do, we recommend you also set Timecode source to
        # Embedded. Leave Embedded timecode override blank, or set to None, when your input does not contain
        # MDPM timecode.

        @[JSON::Field(key: "embeddedTimecodeOverride")]
        getter embedded_timecode_override : String?

        # Use these settings to provide HDR 10 metadata that is missing or inaccurate in your input video.
        # Appropriate values vary depending on the input video and must be provided by a color grader. The
        # color grader generates these values during the HDR 10 mastering process. The valid range for each of
        # these settings is 0 to 50,000. Each increment represents 0.00002 in CIE1931 color coordinate.
        # Related settings - When you specify these values, you must also set Color space to HDR 10. To
        # specify whether the the values you specify here take precedence over the values in the metadata of
        # your input file, set Color space usage. To specify whether color metadata is included in an output,
        # set Color metadata. For more information about MediaConvert HDR jobs, see
        # https://docs.aws.amazon.com/console/mediaconvert/hdr.

        @[JSON::Field(key: "hdr10Metadata")]
        getter hdr10_metadata : Types::Hdr10Metadata?

        # Specify the maximum mastering display luminance. Enter an integer from 0 to 2147483647, in units of
        # 0.0001 nits. For example, enter 10000000 for 1000 nits.

        @[JSON::Field(key: "maxLuminance")]
        getter max_luminance : Int32?

        # Use this setting if your input has video and audio durations that don't align, and your output or
        # player has strict alignment requirements. Examples: Input audio track has a delayed start. Input
        # video track ends before audio ends. When you set Pad video to Black, MediaConvert generates black
        # video frames so that output video and audio durations match. Black video frames are added at the
        # beginning or end, depending on your input. To keep the default behavior and not generate black
        # video, set Pad video to Disabled or leave blank.

        @[JSON::Field(key: "padVideo")]
        getter pad_video : String?

        # Use PID to select specific video data from an input file. Specify this value as an integer; the
        # system automatically converts it to the hexidecimal value. For example, 257 selects PID 0x101. A
        # PID, or packet identifier, is an identifier for a set of data in an MPEG-2 transport stream
        # container.

        @[JSON::Field(key: "pid")]
        getter pid : Int32?

        # Selects a specific program from within a multi-program transport stream. Note that Quad 4K is not
        # currently supported.

        @[JSON::Field(key: "programNumber")]
        getter program_number : Int32?

        # Use Rotate to specify how the service rotates your video. You can choose automatic rotation or
        # specify a rotation. You can specify a clockwise rotation of 0, 90, 180, or 270 degrees. If your
        # input video container is .mov or .mp4 and your input has rotation metadata, you can choose Automatic
        # to have the service rotate your video according to the rotation specified in the metadata. The
        # rotation must be within one degree of 90, 180, or 270 degrees. If the rotation metadata specifies
        # any other rotation, the service will default to no rotation. By default, the service does no
        # rotation, even if your input video has rotation metadata. The service doesn't pass through rotation
        # metadata.

        @[JSON::Field(key: "rotate")]
        getter rotate : String?

        # If the sample range metadata in your input video is accurate, or if you don't know about sample
        # range, keep the default value, Follow, for this setting. When you do, the service automatically
        # detects your input sample range. If your input video has metadata indicating the wrong sample range,
        # specify the accurate sample range here. When you do, MediaConvert ignores any sample range
        # information in the input metadata. Regardless of whether MediaConvert uses the input sample range or
        # the sample range that you specify, MediaConvert uses the sample range for transcoding and also
        # writes it to the output metadata.

        @[JSON::Field(key: "sampleRange")]
        getter sample_range : String?

        # Choose the video selector type for your HLS input. Use to specify which video rendition MediaConvert
        # uses from your HLS input. To have MediaConvert automatically use the highest bitrate rendition from
        # your HLS input: Keep the default value, Auto. To manually specify a rendition: Choose Stream. Then
        # enter the unique stream number in the Streams array, starting at 1, corresponding to the stream
        # order in the manifest.

        @[JSON::Field(key: "selectorType")]
        getter selector_type : String?

        # Specify one or more video streams for MediaConvert to use from your HLS input. Enter an integer
        # corresponding to the stream number, with the first stream in your HLS multivariant playlist starting
        # at 1.For re-encoding workflows, MediaConvert uses the video stream that you select with the highest
        # bitrate as the input.For video passthrough workflows, you specify whether to passthrough a single
        # video stream or multiple video streams under Video selector source in the output video encoding
        # settings.

        @[JSON::Field(key: "streams")]
        getter streams : Array(Int32)?

        def initialize(
          @alpha_behavior : String? = nil,
          @color_space : String? = nil,
          @color_space_usage : String? = nil,
          @embedded_timecode_override : String? = nil,
          @hdr10_metadata : Types::Hdr10Metadata? = nil,
          @max_luminance : Int32? = nil,
          @pad_video : String? = nil,
          @pid : Int32? = nil,
          @program_number : Int32? = nil,
          @rotate : String? = nil,
          @sample_range : String? = nil,
          @selector_type : String? = nil,
          @streams : Array(Int32)? = nil
        )
        end
      end

      # Required when you set Codec, under AudioDescriptions>CodecSettings, to the value Vorbis.

      struct VorbisSettings
        include JSON::Serializable

        # Optional. Specify the number of channels in this output audio track. Choosing Mono on the console
        # gives you 1 output channel; choosing Stereo gives you 2. In the API, valid values are 1 and 2. The
        # default value is 2.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Optional. Specify the audio sample rate in Hz. Valid values are 22050, 32000, 44100, and 48000. The
        # default value is 48000.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        # Optional. Specify the variable audio quality of this Vorbis output from -1 (lowest quality, ~45
        # kbit/s) to 10 (highest quality, ~500 kbit/s). The default value is 4 (~128 kbit/s). Values 5 and 6
        # are approximately 160 and 192 kbit/s, respectively.

        @[JSON::Field(key: "vbrQuality")]
        getter vbr_quality : Int32?

        def initialize(
          @channels : Int32? = nil,
          @sample_rate : Int32? = nil,
          @vbr_quality : Int32? = nil
        )
        end
      end

      # Required when you set Codec to the value VP8.

      struct Vp8Settings
        include JSON::Serializable

        # Target bitrate in bits/second. For example, enter five megabits per second as 5000000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # GOP Length (keyframe interval) in frames. Must be greater than zero.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Optional. Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Ignore this setting unless you set qualityTuningLevel to MULTI_PASS. Optional. Specify the maximum
        # bitrate in bits/second. For example, enter five megabits per second as 5000000. The default behavior
        # uses twice the target bitrate as the maximum bitrate.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The
        # default behavior, Follow source, uses the PAR from your input video for your output. To specify a
        # different PAR in the console, choose any value other than Follow source. When you choose SPECIFIED
        # for this setting, you must also specify values for the parNumerator and parDenominator settings.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, multi-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # With the VP8 codec, you can use only the variable bitrate (VBR) rate control mode.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        def initialize(
          @bitrate : Int32? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_size : Float64? = nil,
          @hrd_buffer_size : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @quality_tuning_level : String? = nil,
          @rate_control_mode : String? = nil
        )
        end
      end

      # Required when you set Codec to the value VP9.

      struct Vp9Settings
        include JSON::Serializable

        # Target bitrate in bits/second. For example, enter five megabits per second as 5000000.

        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # If you are using the console, use the Framerate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates
        # shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify
        # your frame rate as a fraction.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # GOP Length (keyframe interval) in frames. Must be greater than zero.

        @[JSON::Field(key: "gopSize")]
        getter gop_size : Float64?

        # Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Ignore this setting unless you set qualityTuningLevel to MULTI_PASS. Optional. Specify the maximum
        # bitrate in bits/second. For example, enter five megabits per second as 5000000. The default behavior
        # uses twice the target bitrate as the maximum bitrate.

        @[JSON::Field(key: "maxBitrate")]
        getter max_bitrate : Int32?

        # Optional. Specify how the service determines the pixel aspect ratio for this output. The default
        # behavior is to use the same pixel aspect ratio as your input video.

        @[JSON::Field(key: "parControl")]
        getter par_control : String?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parDenominator is 33.

        @[JSON::Field(key: "parDenominator")]
        getter par_denominator : Int32?

        # Required when you set Pixel aspect ratio to SPECIFIED. On the console, this corresponds to any value
        # other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from
        # your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen,
        # you would specify the ratio 40:33. In this example, the value for parNumerator is 40.

        @[JSON::Field(key: "parNumerator")]
        getter par_numerator : Int32?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, multi-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # With the VP9 codec, you can use only the variable bitrate (VBR) rate control mode.

        @[JSON::Field(key: "rateControlMode")]
        getter rate_control_mode : String?

        def initialize(
          @bitrate : Int32? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @gop_size : Float64? = nil,
          @hrd_buffer_size : Int32? = nil,
          @max_bitrate : Int32? = nil,
          @par_control : String? = nil,
          @par_denominator : Int32? = nil,
          @par_numerator : Int32? = nil,
          @quality_tuning_level : String? = nil,
          @rate_control_mode : String? = nil
        )
        end
      end

      # Contains any warning codes and their count for the job.

      struct WarningGroup
        include JSON::Serializable

        # Warning code that identifies a specific warning in the job. For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/warning_codes.html

        @[JSON::Field(key: "code")]
        getter code : Int32

        # The number of times this warning occurred in the job.

        @[JSON::Field(key: "count")]
        getter count : Int32

        def initialize(
          @code : Int32,
          @count : Int32
        )
        end
      end

      # Required when you set Codec to the value WAV.

      struct WavSettings
        include JSON::Serializable

        # Specify Bit depth, in bits per sample, to choose the encoding quality for this audio track.

        @[JSON::Field(key: "bitDepth")]
        getter bit_depth : Int32?

        # Specify the number of channels in this output audio track. Valid values are 1 and even numbers up to
        # 64. For example, 1, 2, 4, 6, and so on, up to 64.

        @[JSON::Field(key: "channels")]
        getter channels : Int32?

        # Specify the file format for your wave audio output. To use a RIFF wave format: Keep the default
        # value, RIFF. If your output audio is likely to exceed 4GB in file size, or if you otherwise need the
        # extended support of the RF64 format: Choose RF64. If your player only supports the extensible wave
        # format: Choose Extensible.

        @[JSON::Field(key: "format")]
        getter format : String?

        # Sample rate in Hz.

        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int32?

        def initialize(
          @bit_depth : Int32? = nil,
          @channels : Int32? = nil,
          @format : String? = nil,
          @sample_rate : Int32? = nil
        )
        end
      end

      # Settings related to WebVTT captions. WebVTT is a sidecar format that holds captions in a file that
      # is separate from the video container. Set up sidecar captions in the same output group, but
      # different output from your video. For more information, see
      # https://docs.aws.amazon.com/mediaconvert/latest/ug/ttml-and-webvtt-output-captions.html.

      struct WebvttDestinationSettings
        include JSON::Serializable

        # If the WebVTT captions track is intended to provide accessibility for people who are deaf or hard of
        # hearing: Set Accessibility subtitles to Enabled. When you do, MediaConvert adds accessibility
        # attributes to your output HLS or DASH manifest. For HLS manifests, MediaConvert adds the following
        # accessibility attributes under EXT-X-MEDIA for this track:
        # CHARACTERISTICS="public.accessibility.transcribes-spoken-dialog,public.accessibility.describes-music-and-sound"
        # and AUTOSELECT="YES". For DASH manifests, MediaConvert adds the following in the adaptation set for
        # this track: . If the captions track is not intended to provide such accessibility: Keep the default
        # value, Disabled. When you do, for DASH manifests, MediaConvert instead adds the following in the
        # adaptation set for this track: .

        @[JSON::Field(key: "accessibility")]
        getter accessibility : String?

        # Specify how MediaConvert writes style information in your output WebVTT captions. To use the
        # available style, color, and position information from your input captions: Choose Enabled.
        # MediaConvert uses default settings when style and position information is missing from your input
        # captions. To recreate the input captions exactly: Choose Strict. MediaConvert automatically applies
        # timing adjustments, including adjustments for frame rate conversion, ad avails, and input clipping.
        # Your input captions format must be WebVTT. To ignore the style and position information from your
        # input captions and use simplified output captions: Keep the default value, Disabled. Or leave blank.
        # To use the available style, color, and position information from your input captions, while merging
        # cues with identical time ranges: Choose merge. This setting can help prevent positioning overlaps
        # for certain players that expect a single single cue for any given time range.

        @[JSON::Field(key: "stylePassthrough")]
        getter style_passthrough : String?

        def initialize(
          @accessibility : String? = nil,
          @style_passthrough : String? = nil
        )
        end
      end

      # Settings specific to WebVTT sources in HLS alternative rendition group. Specify the properties
      # (renditionGroupId, renditionName or renditionLanguageCode) to identify the unique subtitle track
      # among the alternative rendition groups present in the HLS manifest. If no unique track is found, or
      # multiple tracks match the specified properties, the job fails. If there is only one subtitle track
      # in the rendition group, the settings can be left empty and the default subtitle track will be
      # chosen. If your caption source is a sidecar file, use FileSourceSettings instead of
      # WebvttHlsSourceSettings.

      struct WebvttHlsSourceSettings
        include JSON::Serializable

        # Optional. Specify alternative group ID

        @[JSON::Field(key: "renditionGroupId")]
        getter rendition_group_id : String?

        # Optionally specify the language, using an ISO 639-2 or ISO 639-3 three-letter code in all capital
        # letters. You can find a list of codes at: https://www.loc.gov/standards/iso639-2/php/code_list.php

        @[JSON::Field(key: "renditionLanguageCode")]
        getter rendition_language_code : String?

        # Optional. Specify media name

        @[JSON::Field(key: "renditionName")]
        getter rendition_name : String?

        def initialize(
          @rendition_group_id : String? = nil,
          @rendition_language_code : String? = nil,
          @rendition_name : String? = nil
        )
        end
      end

      # Required when you set Profile to the value XAVC_4K_INTRA_CBG.

      struct Xavc4kIntraCbgProfileSettings
        include JSON::Serializable

        # Specify the XAVC Intra 4k (CBG) Class to set the bitrate of your output. Outputs of the same class
        # have similar image quality over the operating points that are valid for that class.

        @[JSON::Field(key: "xavcClass")]
        getter xavc_class : String?

        def initialize(
          @xavc_class : String? = nil
        )
        end
      end

      # Required when you set Profile to the value XAVC_4K_INTRA_VBR.

      struct Xavc4kIntraVbrProfileSettings
        include JSON::Serializable

        # Specify the XAVC Intra 4k (VBR) Class to set the bitrate of your output. Outputs of the same class
        # have similar image quality over the operating points that are valid for that class.

        @[JSON::Field(key: "xavcClass")]
        getter xavc_class : String?

        def initialize(
          @xavc_class : String? = nil
        )
        end
      end

      # Required when you set Profile to the value XAVC_4K.

      struct Xavc4kProfileSettings
        include JSON::Serializable

        # Specify the XAVC 4k (Long GOP) Bitrate Class to set the bitrate of your output. Outputs of the same
        # class have similar image quality over the operating points that are valid for that class.

        @[JSON::Field(key: "bitrateClass")]
        getter bitrate_class : String?

        # Specify the codec profile for this output. Choose High, 8-bit, 4:2:0 (HIGH) or High, 10-bit, 4:2:2
        # (HIGH_422). These profiles are specified in ITU-T H.264.

        @[JSON::Field(key: "codecProfile")]
        getter codec_profile : String?

        # The best way to set up adaptive quantization is to keep the default value, Auto, for the setting
        # Adaptive quantization. When you do so, MediaConvert automatically applies the best types of
        # quantization for your video content. Include this setting in your JSON job specification only when
        # you choose to change the default value for Adaptive quantization. Enable this setting to have the
        # encoder reduce I-frame pop. I-frame pop appears as a visual flicker that can arise when the encoder
        # saves bits by copying some macroblocks many times from frame to frame, and then refreshes them at
        # the I-frame. When you enable this setting, the encoder updates these macroblocks slightly more often
        # to smooth out the flicker. This setting is disabled by default. Related setting: In addition to
        # enabling this setting, you must also set Adaptive quantization to a value other than Off or Auto.
        # Use Adaptive quantization to adjust the degree of smoothing that Flicker adaptive quantization
        # provides.

        @[JSON::Field(key: "flickerAdaptiveQuantization")]
        getter flicker_adaptive_quantization : String?

        # Specify whether the encoder uses B-frames as reference frames for other pictures in the same GOP.
        # Choose Allow to allow the encoder to use B-frames as reference frames. Choose Don't allow to prevent
        # the encoder from using B-frames as reference frames.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a
        # decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0
        # will break output segmenting.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Specify the size of the buffer that MediaConvert uses in the HRD buffer model for this output.
        # Specify this value in bits; for example, enter five megabits as 5000000. When you don't set this
        # value, or you set it to zero, MediaConvert calculates the default by doubling the bitrate of this
        # output point.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, single-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        def initialize(
          @bitrate_class : String? = nil,
          @codec_profile : String? = nil,
          @flicker_adaptive_quantization : String? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @hrd_buffer_size : Int32? = nil,
          @quality_tuning_level : String? = nil,
          @slices : Int32? = nil
        )
        end
      end

      # Required when you set Profile to the value XAVC_HD_INTRA_CBG.

      struct XavcHdIntraCbgProfileSettings
        include JSON::Serializable

        # Specify the XAVC Intra HD (CBG) Class to set the bitrate of your output. Outputs of the same class
        # have similar image quality over the operating points that are valid for that class.

        @[JSON::Field(key: "xavcClass")]
        getter xavc_class : String?

        def initialize(
          @xavc_class : String? = nil
        )
        end
      end

      # Required when you set Profile to the value XAVC_HD.

      struct XavcHdProfileSettings
        include JSON::Serializable

        # Specify the XAVC HD (Long GOP) Bitrate Class to set the bitrate of your output. Outputs of the same
        # class have similar image quality over the operating points that are valid for that class.

        @[JSON::Field(key: "bitrateClass")]
        getter bitrate_class : String?

        # The best way to set up adaptive quantization is to keep the default value, Auto, for the setting
        # Adaptive quantization. When you do so, MediaConvert automatically applies the best types of
        # quantization for your video content. Include this setting in your JSON job specification only when
        # you choose to change the default value for Adaptive quantization. Enable this setting to have the
        # encoder reduce I-frame pop. I-frame pop appears as a visual flicker that can arise when the encoder
        # saves bits by copying some macroblocks many times from frame to frame, and then refreshes them at
        # the I-frame. When you enable this setting, the encoder updates these macroblocks slightly more often
        # to smooth out the flicker. This setting is disabled by default. Related setting: In addition to
        # enabling this setting, you must also set Adaptive quantization to a value other than Off or Auto.
        # Use Adaptive quantization to adjust the degree of smoothing that Flicker adaptive quantization
        # provides.

        @[JSON::Field(key: "flickerAdaptiveQuantization")]
        getter flicker_adaptive_quantization : String?

        # Specify whether the encoder uses B-frames as reference frames for other pictures in the same GOP.
        # Choose Allow to allow the encoder to use B-frames as reference frames. Choose Don't allow to prevent
        # the encoder from using B-frames as reference frames.

        @[JSON::Field(key: "gopBReference")]
        getter gop_b_reference : String?

        # Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a
        # decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0
        # will break output segmenting.

        @[JSON::Field(key: "gopClosedCadence")]
        getter gop_closed_cadence : Int32?

        # Specify the size of the buffer that MediaConvert uses in the HRD buffer model for this output.
        # Specify this value in bits; for example, enter five megabits as 5000000. When you don't set this
        # value, or you set it to zero, MediaConvert calculates the default by doubling the bitrate of this
        # output point.

        @[JSON::Field(key: "hrdBufferSize")]
        getter hrd_buffer_size : Int32?

        # Choose the scan line type for the output. Keep the default value, Progressive to create a
        # progressive output, regardless of the scan type of your input. Use Top field first or Bottom field
        # first to create an output that's interlaced with the same field polarity throughout. Use Follow,
        # default top or Follow, default bottom to produce outputs with the same field polarity as the source.
        # For jobs that have multiple inputs, the output field polarity might change over the course of the
        # output. Follow behavior depends on the input scan type. If the source is interlaced, the output will
        # be interlaced with the same polarity as the source. If the source is progressive, the output will be
        # interlaced with top field bottom field first, depending on which of the Follow options you choose.

        @[JSON::Field(key: "interlaceMode")]
        getter interlace_mode : String?

        # Optional. Use Quality tuning level to choose how you want to trade off encoding speed for output
        # video quality. The default behavior is faster, lower quality, single-pass encoding.

        @[JSON::Field(key: "qualityTuningLevel")]
        getter quality_tuning_level : String?

        # Number of slices per picture. Must be less than or equal to the number of macroblock rows for
        # progressive pictures, and less than or equal to half the number of macroblock rows for interlaced
        # pictures.

        @[JSON::Field(key: "slices")]
        getter slices : Int32?

        # Ignore this setting unless you set Frame rate (framerateNumerator divided by framerateDenominator)
        # to 29.970. If your input framerate is 23.976, choose Hard. Otherwise, keep the default value None.
        # For more information, see
        # https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-telecine-and-inverse-telecine.html.

        @[JSON::Field(key: "telecine")]
        getter telecine : String?

        def initialize(
          @bitrate_class : String? = nil,
          @flicker_adaptive_quantization : String? = nil,
          @gop_b_reference : String? = nil,
          @gop_closed_cadence : Int32? = nil,
          @hrd_buffer_size : Int32? = nil,
          @interlace_mode : String? = nil,
          @quality_tuning_level : String? = nil,
          @slices : Int32? = nil,
          @telecine : String? = nil
        )
        end
      end

      # Required when you set Codec to the value XAVC.

      struct XavcSettings
        include JSON::Serializable

        # Keep the default value, Auto, for this setting to have MediaConvert automatically apply the best
        # types of quantization for your video content. When you want to apply your quantization settings
        # manually, you must set Adaptive quantization to a value other than Auto. Use this setting to specify
        # the strength of any adaptive quantization filters that you enable. If you don't want MediaConvert to
        # do any adaptive quantization in this transcode, set Adaptive quantization to Off. Related settings:
        # The value that you choose here applies to the following settings: Flicker adaptive quantization
        # (flickerAdaptiveQuantization), Spatial adaptive quantization, and Temporal adaptive quantization.

        @[JSON::Field(key: "adaptiveQuantization")]
        getter adaptive_quantization : String?

        # Optional. Choose a specific entropy encoding mode only when you want to override XAVC
        # recommendations. If you choose the value auto, MediaConvert uses the mode that the XAVC file format
        # specifies given this output's operating point.

        @[JSON::Field(key: "entropyEncoding")]
        getter entropy_encoding : String?

        # If you are using the console, use the Frame rate setting to specify the frame rate for this output.
        # If you want to keep the same frame rate as the input video, choose Follow source. If you want to do
        # frame rate conversion, choose a frame rate from the dropdown list. The framerates shown in the
        # dropdown list are decimal approximations of fractions.

        @[JSON::Field(key: "framerateControl")]
        getter framerate_control : String?

        # Choose the method that you want MediaConvert to use when increasing or decreasing your video's frame
        # rate. For numerically simple conversions, such as 60 fps to 30 fps: We recommend that you keep the
        # default value, Drop duplicate. For numerically complex conversions, to avoid stutter: Choose
        # Interpolate. This results in a smooth picture, but might introduce undesirable video artifacts. For
        # complex frame rate conversions, especially if your source video has already been converted from its
        # original cadence: Choose FrameFormer to do motion-compensated interpolation. FrameFormer uses the
        # best conversion method frame by frame. Note that using FrameFormer increases the transcoding time
        # and incurs a significant add-on cost. When you choose FrameFormer, your input video resolution must
        # be at least 128x96. To create an output with the same number of frames as your input: Choose
        # Maintain frame count. When you do, MediaConvert will not drop, interpolate, add, or otherwise change
        # the frame count from your input to your output. Note that since the frame count is maintained, the
        # duration of your output will become shorter at higher frame rates and longer at lower frame rates.

        @[JSON::Field(key: "framerateConversionAlgorithm")]
        getter framerate_conversion_algorithm : String?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the
        # denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When
        # you use the console for transcode jobs that use frame rate conversion, provide the value as a
        # decimal number for Frame rate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateDenominator")]
        getter framerate_denominator : Int32?

        # When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a
        # fraction. For example, 24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of
        # this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the
        # console for transcode jobs that use frame rate conversion, provide the value as a decimal number for
        # Framerate. In this example, specify 23.976.

        @[JSON::Field(key: "framerateNumerator")]
        getter framerate_numerator : Int32?

        # Optionally choose one or more per frame metric reports to generate along with your output. You can
        # use these metrics to analyze your video output according to one or more commonly used image quality
        # metrics. You can specify per frame metrics for output groups or for individual outputs. When you do,
        # MediaConvert writes a CSV (Comma-Separated Values) file to your S3 output destination, named after
        # the output name and metric type. For example: videofile_PSNR.csv Jobs that generate per frame
        # metrics will take longer to complete, depending on the resolution and complexity of your output. For
        # example, some 4K jobs might take up to twice as long to complete. Note that when analyzing the video
        # quality of your output, or when comparing the video quality of multiple different outputs, we
        # generally also recommend a detailed visual review in a controlled environment. You can choose from
        # the following per frame metrics: * PSNR: Peak Signal-to-Noise Ratio * SSIM: Structural Similarity
        # Index Measure * MS_SSIM: Multi-Scale Similarity Index Measure * PSNR_HVS: Peak Signal-to-Noise
        # Ratio, Human Visual System * VMAF: Video Multi-Method Assessment Fusion * QVBR: Quality-Defined
        # Variable Bitrate. This option is only available when your output uses the QVBR rate control mode. *
        # SHOT_CHANGE: Shot Changes

        @[JSON::Field(key: "perFrameMetrics")]
        getter per_frame_metrics : Array(String)?

        # Specify the XAVC profile for this output. For more information, see the Sony documentation at
        # https://www.xavc-info.org/. Note that MediaConvert doesn't support the interlaced video XAVC
        # operating points for XAVC_HD_INTRA_CBG. To create an interlaced XAVC output, choose the profile
        # XAVC_HD.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Ignore this setting unless your input frame rate is 23.976 or 24 frames per second (fps). Enable
        # slow PAL to create a 25 fps output by relabeling the video frames and resampling your audio. Note
        # that enabling this setting will slightly reduce the duration of your video. Related settings: You
        # must also set Frame rate to 25.

        @[JSON::Field(key: "slowPal")]
        getter slow_pal : String?

        # Ignore this setting unless your downstream workflow requires that you specify it explicitly.
        # Otherwise, we recommend that you adjust the softness of your output by using a lower value for the
        # setting Sharpness or by enabling a noise reducer filter. The Softness setting specifies the
        # quantization matrices that the encoder uses. Keep the default value, 0, for flat quantization.
        # Choose the value 1 or 16 to use the default JVT softening quantization matricies from the H.264
        # specification. Choose a value from 17 to 128 to use planar interpolation. Increasing values from 17
        # to 128 result in increasing reduction of high-frequency data. The value 128 results in the softest
        # video.

        @[JSON::Field(key: "softness")]
        getter softness : Int32?

        # The best way to set up adaptive quantization is to keep the default value, Auto, for the setting
        # Adaptive quantization. When you do so, MediaConvert automatically applies the best types of
        # quantization for your video content. Include this setting in your JSON job specification only when
        # you choose to change the default value for Adaptive quantization. For this setting, keep the default
        # value, Enabled, to adjust quantization within each frame based on spatial variation of content
        # complexity. When you enable this feature, the encoder uses fewer bits on areas that can sustain more
        # distortion with no noticeable visual degradation and uses more bits on areas where any small
        # distortion will be noticeable. For example, complex textured blocks are encoded with fewer bits and
        # smooth textured blocks are encoded with more bits. Enabling this feature will almost always improve
        # your video quality. Note, though, that this feature doesn't take into account where the viewer's
        # attention is likely to be. If viewers are likely to be focusing their attention on a part of the
        # screen with a lot of complex texture, you might choose to disable this feature. Related setting:
        # When you enable spatial adaptive quantization, set the value for Adaptive quantization depending on
        # your content. For homogeneous content, such as cartoons and video games, set it to Low. For content
        # with a wider variety of textures, set it to High or Higher.

        @[JSON::Field(key: "spatialAdaptiveQuantization")]
        getter spatial_adaptive_quantization : String?

        # The best way to set up adaptive quantization is to keep the default value, Auto, for the setting
        # Adaptive quantization. When you do so, MediaConvert automatically applies the best types of
        # quantization for your video content. Include this setting in your JSON job specification only when
        # you choose to change the default value for Adaptive quantization. For this setting, keep the default
        # value, Enabled, to adjust quantization within each frame based on temporal variation of content
        # complexity. When you enable this feature, the encoder uses fewer bits on areas of the frame that
        # aren't moving and uses more bits on complex objects with sharp edges that move a lot. For example,
        # this feature improves the readability of text tickers on newscasts and scoreboards on sports
        # matches. Enabling this feature will almost always improve your video quality. Note, though, that
        # this feature doesn't take into account where the viewer's attention is likely to be. If viewers are
        # likely to be focusing their attention on a part of the screen that doesn't have moving objects with
        # sharp edges, such as sports athletes' faces, you might choose to disable this feature. Related
        # setting: When you enable temporal adaptive quantization, adjust the strength of the filter with the
        # setting Adaptive quantization.

        @[JSON::Field(key: "temporalAdaptiveQuantization")]
        getter temporal_adaptive_quantization : String?

        # Required when you set Profile to the value XAVC_4K_INTRA_CBG.

        @[JSON::Field(key: "xavc4kIntraCbgProfileSettings")]
        getter xavc4k_intra_cbg_profile_settings : Types::Xavc4kIntraCbgProfileSettings?

        # Required when you set Profile to the value XAVC_4K_INTRA_VBR.

        @[JSON::Field(key: "xavc4kIntraVbrProfileSettings")]
        getter xavc4k_intra_vbr_profile_settings : Types::Xavc4kIntraVbrProfileSettings?

        # Required when you set Profile to the value XAVC_4K.

        @[JSON::Field(key: "xavc4kProfileSettings")]
        getter xavc4k_profile_settings : Types::Xavc4kProfileSettings?

        # Required when you set Profile to the value XAVC_HD_INTRA_CBG.

        @[JSON::Field(key: "xavcHdIntraCbgProfileSettings")]
        getter xavc_hd_intra_cbg_profile_settings : Types::XavcHdIntraCbgProfileSettings?

        # Required when you set Profile to the value XAVC_HD.

        @[JSON::Field(key: "xavcHdProfileSettings")]
        getter xavc_hd_profile_settings : Types::XavcHdProfileSettings?

        def initialize(
          @adaptive_quantization : String? = nil,
          @entropy_encoding : String? = nil,
          @framerate_control : String? = nil,
          @framerate_conversion_algorithm : String? = nil,
          @framerate_denominator : Int32? = nil,
          @framerate_numerator : Int32? = nil,
          @per_frame_metrics : Array(String)? = nil,
          @profile : String? = nil,
          @slow_pal : String? = nil,
          @softness : Int32? = nil,
          @spatial_adaptive_quantization : String? = nil,
          @temporal_adaptive_quantization : String? = nil,
          @xavc4k_intra_cbg_profile_settings : Types::Xavc4kIntraCbgProfileSettings? = nil,
          @xavc4k_intra_vbr_profile_settings : Types::Xavc4kIntraVbrProfileSettings? = nil,
          @xavc4k_profile_settings : Types::Xavc4kProfileSettings? = nil,
          @xavc_hd_intra_cbg_profile_settings : Types::XavcHdIntraCbgProfileSettings? = nil,
          @xavc_hd_profile_settings : Types::XavcHdProfileSettings? = nil
        )
        end
      end
    end
  end
end
