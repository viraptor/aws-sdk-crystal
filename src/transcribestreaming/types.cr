require "json"
require "time"

module Aws
  module TranscribeStreaming
    module Types

      # A list of possible alternative transcriptions for the input audio. Each alternative may contain one
      # or more of Items , Entities , or Transcript .

      struct Alternative
        include JSON::Serializable

        # Contains entities identified as personally identifiable information (PII) in your transcription
        # output.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)?

        # Contains words, phrases, or punctuation marks in your transcription output.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Item)?

        # Contains transcribed text.

        @[JSON::Field(key: "Transcript")]
        getter transcript : String?

        def initialize(
          @entities : Array(Types::Entity)? = nil,
          @items : Array(Types::Item)? = nil,
          @transcript : String? = nil
        )
        end
      end

      # A wrapper for your audio chunks. Your audio stream consists of one or more audio events, which
      # consist of one or more audio chunks. For more information, see Event stream encoding .

      struct AudioEvent
        include JSON::Serializable

        # An audio blob containing the next segment of audio from your application, with a maximum duration of
        # 1 second. The maximum size in bytes varies based on audio properties. Find recommended size in
        # Transcribing streaming best practices . Size calculation: Duration (s) * Sample Rate (Hz) * Number
        # of Channels * 2 (Bytes per Sample) For example, a 1-second chunk of 16 kHz, 2-channel, 16-bit audio
        # would be 1 * 16000 * 2 * 2 = 64000 bytes . For 8 kHz, 1-channel, 16-bit audio, a 1-second chunk
        # would be 1 * 8000 * 1 * 2 = 16000 bytes .

        @[JSON::Field(key: "AudioChunk")]
        getter audio_chunk : Bytes?

        def initialize(
          @audio_chunk : Bytes? = nil
        )
        end
      end

      # An encoded stream of audio blobs. Audio streams are encoded as either HTTP/2 or WebSocket data
      # frames. For more information, see Transcribing streaming audio .

      struct AudioStream
        include JSON::Serializable

        # A blob of audio from your application. Your audio stream consists of one or more audio events. For
        # more information, see Event stream encoding .

        @[JSON::Field(key: "AudioEvent")]
        getter audio_event : Types::AudioEvent?

        # Contains audio channel definitions and post-call analytics settings.

        @[JSON::Field(key: "ConfigurationEvent")]
        getter configuration_event : Types::ConfigurationEvent?

        def initialize(
          @audio_event : Types::AudioEvent? = nil,
          @configuration_event : Types::ConfigurationEvent? = nil
        )
        end
      end

      # One or more arguments to the StartStreamTranscription , StartMedicalStreamTranscription , or
      # StartCallAnalyticsStreamTranscription operation was not valid. For example, MediaEncoding or
      # LanguageCode used unsupported values. Check the specified parameters and try your request again.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains entities identified as personally identifiable information (PII) in your transcription
      # output, along with various associated attributes. Examples include category, confidence score,
      # content, type, and start and end times.

      struct CallAnalyticsEntity
        include JSON::Serializable

        # The time, in milliseconds, from the beginning of the audio stream to the start of the identified
        # entity.

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int64?

        # The category of information identified. For example, PII .

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The confidence score associated with the identification of an entity in your transcript. Confidence
        # scores are values between 0 and 1. A larger value indicates a higher probability that the identified
        # entity correctly matches the entity spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or words that represent the identified entity.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The time, in milliseconds, from the beginning of the audio stream to the end of the identified
        # entity.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int64?

        # The type of PII identified. For example, NAME or CREDIT_DEBIT_NUMBER .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset_millis : Int64? = nil,
          @category : String? = nil,
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_offset_millis : Int64? = nil,
          @type : String? = nil
        )
        end
      end

      # A word, phrase, or punctuation mark in your Call Analytics transcription output, along with various
      # associated attributes, such as confidence score, type, and start and end times.

      struct CallAnalyticsItem
        include JSON::Serializable

        # The time, in milliseconds, from the beginning of the audio stream to the start of the identified
        # item.

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int64?

        # The confidence score associated with a word or phrase in your transcript. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified item
        # correctly matches the item spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or punctuation that was transcribed.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The time, in milliseconds, from the beginning of the audio stream to the end of the identified item.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int64?

        # If partial result stabilization is enabled, Stable indicates whether the specified item is stable (
        # true ) or if it may change when the segment is complete ( false ).

        @[JSON::Field(key: "Stable")]
        getter stable : Bool?

        # The type of item identified. Options are: PRONUNCIATION (spoken words) and PUNCTUATION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Indicates whether the specified item matches a word in the vocabulary filter included in your Call
        # Analytics request. If true , there is a vocabulary filter match.

        @[JSON::Field(key: "VocabularyFilterMatch")]
        getter vocabulary_filter_match : Bool?

        def initialize(
          @begin_offset_millis : Int64? = nil,
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_offset_millis : Int64? = nil,
          @stable : Bool? = nil,
          @type : String? = nil,
          @vocabulary_filter_match : Bool? = nil
        )
        end
      end

      # The language code that represents the language identified in your audio, including the associated
      # confidence score.

      struct CallAnalyticsLanguageWithScore
        include JSON::Serializable

        # The language code of the identified language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The confidence score associated with the identified language code. Confidence scores are values
        # between zero and one; larger values indicate a higher confidence in the identified language.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @language_code : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Contains detailed information about your real-time Call Analytics session. These details are
      # provided in the UtteranceEvent and CategoryEvent objects.

      struct CallAnalyticsTranscriptResultStream
        include JSON::Serializable


        @[JSON::Field(key: "BadRequestException")]
        getter bad_request_exception : Types::BadRequestException?

        # Provides information on matched categories that were used to generate real-time supervisor alerts.

        @[JSON::Field(key: "CategoryEvent")]
        getter category_event : Types::CategoryEvent?


        @[JSON::Field(key: "ConflictException")]
        getter conflict_exception : Types::ConflictException?


        @[JSON::Field(key: "InternalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?


        @[JSON::Field(key: "LimitExceededException")]
        getter limit_exceeded_exception : Types::LimitExceededException?


        @[JSON::Field(key: "ServiceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # Contains set of transcription results from one or more audio segments, along with additional
        # information per your request parameters. This can include information relating to channel
        # definitions, partial result stabilization, sentiment, issue detection, and other
        # transcription-related data.

        @[JSON::Field(key: "UtteranceEvent")]
        getter utterance_event : Types::UtteranceEvent?

        def initialize(
          @bad_request_exception : Types::BadRequestException? = nil,
          @category_event : Types::CategoryEvent? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @limit_exceeded_exception : Types::LimitExceededException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @utterance_event : Types::UtteranceEvent? = nil
        )
        end
      end

      # Provides information on any TranscriptFilterType categories that matched your transcription output.
      # Matches are identified for each segment upon completion of that segment.

      struct CategoryEvent
        include JSON::Serializable

        # Lists the categories that were matched in your audio segment.

        @[JSON::Field(key: "MatchedCategories")]
        getter matched_categories : Array(String)?

        # Contains information about the matched categories, including category names and timestamps.

        @[JSON::Field(key: "MatchedDetails")]
        getter matched_details : Hash(String, Types::PointsOfInterest)?

        def initialize(
          @matched_categories : Array(String)? = nil,
          @matched_details : Hash(String, Types::PointsOfInterest)? = nil
        )
        end
      end

      # Makes it possible to specify which speaker is on which audio channel. For example, if your agent is
      # the first participant to speak, you would set ChannelId to 0 (to indicate the first channel) and
      # ParticipantRole to AGENT (to indicate that it's the agent speaking).

      struct ChannelDefinition
        include JSON::Serializable

        # Specify the audio channel you want to define.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32

        # Specify the speaker you want to define. Omitting this parameter is equivalent to specifying both
        # participants.

        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String

        def initialize(
          @channel_id : Int32,
          @participant_role : String
        )
        end
      end

      # Provides the location, using character count, in your transcript where a match is identified. For
      # example, the location of an issue or a category match within a segment.

      struct CharacterOffsets
        include JSON::Serializable

        # Provides the character count of the first character where a match is identified. For example, the
        # first character associated with an issue or a category match in a segment transcript.

        @[JSON::Field(key: "Begin")]
        getter begin : Int32?

        # Provides the character count of the last character where a match is identified. For example, the
        # last character associated with an issue or a category match in a segment transcript.

        @[JSON::Field(key: "End")]
        getter end : Int32?

        def initialize(
          @begin : Int32? = nil,
          @end : Int32? = nil
        )
        end
      end

      # The details for clinical note generation, including status, and output locations for clinical note
      # and aggregated transcript if the analytics completed, or failure reason if the analytics failed.

      struct ClinicalNoteGenerationResult
        include JSON::Serializable

        # Holds the Amazon S3 URI for the output Clinical Note.

        @[JSON::Field(key: "ClinicalNoteOutputLocation")]
        getter clinical_note_output_location : String?

        # If ClinicalNoteGenerationResult is FAILED , information about why it failed.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The status of the clinical note generation. Possible Values: IN_PROGRESS FAILED COMPLETED After
        # audio streaming finishes, and you send a MedicalScribeSessionControlEvent event (with END_OF_SESSION
        # as the Type), the status is set to IN_PROGRESS . If the status is COMPLETED , the analytics
        # completed successfully, and you can find the results at the locations specified in
        # ClinicalNoteOutputLocation and TranscriptOutputLocation . If the status is FAILED , FailureReason
        # provides details about the failure.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Holds the Amazon S3 URI for the output Transcript.

        @[JSON::Field(key: "TranscriptOutputLocation")]
        getter transcript_output_location : String?

        def initialize(
          @clinical_note_output_location : String? = nil,
          @failure_reason : String? = nil,
          @status : String? = nil,
          @transcript_output_location : String? = nil
        )
        end
      end

      # The output configuration for aggregated transcript and clinical note generation.

      struct ClinicalNoteGenerationSettings
        include JSON::Serializable

        # The name of the Amazon S3 bucket where you want the output of Amazon Web Services HealthScribe
        # post-stream analytics stored. Don't include the S3:// prefix of the specified bucket. HealthScribe
        # outputs transcript and clinical note files under the prefix:
        # S3://$output-bucket-name/healthscribe-streaming/session-id/post-stream-analytics/clinical-notes The
        # role ResourceAccessRoleArn specified in the MedicalScribeConfigurationEvent must have permission to
        # use the specified location. You can change Amazon S3 permissions using the Amazon Web Services
        # Management Console . See also Permissions Required for IAM User Roles .

        @[JSON::Field(key: "OutputBucketName")]
        getter output_bucket_name : String

        # Specify one of the following templates to use for the clinical note summary. The default is
        # HISTORY_AND_PHYSICAL . HISTORY_AND_PHYSICAL: Provides summaries for key sections of the clinical
        # documentation. Examples of sections include Chief Complaint, History of Present Illness, Review of
        # Systems, Past Medical History, Assessment, and Plan. GIRPP: Provides summaries based on the patients
        # progress toward goals. Examples of sections include Goal, Intervention, Response, Progress, and
        # Plan. BIRP: Focuses on the patient's behavioral patterns and responses. Examples of sections include
        # Behavior, Intervention, Response, and Plan. SIRP: Emphasizes the situational context of therapy.
        # Examples of sections include Situation, Intervention, Response, and Plan. DAP: Provides a simplified
        # format for clinical documentation. Examples of sections include Data, Assessment, and Plan.
        # BEHAVIORAL_SOAP: Behavioral health focused documentation format. Examples of sections include
        # Subjective, Objective, Assessment, and Plan. PHYSICAL_SOAP: Physical health focused documentation
        # format. Examples of sections include Subjective, Objective, Assessment, and Plan.

        @[JSON::Field(key: "NoteTemplate")]
        getter note_template : String?

        def initialize(
          @output_bucket_name : String,
          @note_template : String? = nil
        )
        end
      end

      # Allows you to set audio channel definitions and post-call analytics settings.

      struct ConfigurationEvent
        include JSON::Serializable

        # Indicates which speaker is on which audio channel.

        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::ChannelDefinition)?

        # Provides additional optional settings for your Call Analytics post-call request, including
        # encryption and output locations for your redacted transcript. PostCallAnalyticsSettings provides you
        # with the same insights as a Call Analytics post-call transcription. Refer to Post-call analytics for
        # more information on this feature.

        @[JSON::Field(key: "PostCallAnalyticsSettings")]
        getter post_call_analytics_settings : Types::PostCallAnalyticsSettings?

        def initialize(
          @channel_definitions : Array(Types::ChannelDefinition)? = nil,
          @post_call_analytics_settings : Types::PostCallAnalyticsSettings? = nil
        )
        end
      end

      # A new stream started with the same session ID. The current stream has been terminated.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains entities identified as personally identifiable information (PII) in your transcription
      # output, along with various associated attributes. Examples include category, confidence score, type,
      # stability score, and start and end times.

      struct Entity
        include JSON::Serializable

        # The category of information identified. The only category is PII .

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The confidence score associated with the identified PII entity in your audio. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified entity
        # correctly matches the entity spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or words identified as PII.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time of the utterance that was identified as PII in seconds, with millisecond precision
        # (e.g., 1.056)

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # The start time of the utterance that was identified as PII in seconds, with millisecond precision
        # (e.g., 1.056)

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        # The type of PII identified. For example, NAME or CREDIT_DEBIT_NUMBER .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @category : String? = nil,
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_time : Float64? = nil,
          @start_time : Float64? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetMedicalScribeStreamRequest
        include JSON::Serializable

        # The identifier of the HealthScribe streaming session you want information about.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct GetMedicalScribeStreamResponse
        include JSON::Serializable

        # Provides details about a HealthScribe streaming session.

        @[JSON::Field(key: "MedicalScribeStreamDetails")]
        getter medical_scribe_stream_details : Types::MedicalScribeStreamDetails?

        def initialize(
          @medical_scribe_stream_details : Types::MedicalScribeStreamDetails? = nil
        )
        end
      end

      # A problem occurred while processing the audio. Amazon Transcribe terminated processing.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Lists the issues that were identified in your audio segment.

      struct IssueDetected
        include JSON::Serializable

        # Provides the timestamps that identify when in an audio segment the specified issue occurs.

        @[JSON::Field(key: "CharacterOffsets")]
        getter character_offsets : Types::CharacterOffsets?

        def initialize(
          @character_offsets : Types::CharacterOffsets? = nil
        )
        end
      end

      # A word, phrase, or punctuation mark in your transcription output, along with various associated
      # attributes, such as confidence score, type, and start and end times.

      struct Item
        include JSON::Serializable

        # The confidence score associated with a word or phrase in your transcript. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified item
        # correctly matches the item spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or punctuation that was transcribed.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time of the transcribed item in seconds, with millisecond precision (e.g., 1.056)

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # If speaker partitioning is enabled, Speaker labels the speaker of the specified item.

        @[JSON::Field(key: "Speaker")]
        getter speaker : String?

        # If partial result stabilization is enabled, Stable indicates whether the specified item is stable (
        # true ) or if it may change when the segment is complete ( false ).

        @[JSON::Field(key: "Stable")]
        getter stable : Bool?

        # The start time of the transcribed item in seconds, with millisecond precision (e.g., 1.056)

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        # The type of item identified. Options are: PRONUNCIATION (spoken words) and PUNCTUATION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Indicates whether the specified item matches a word in the vocabulary filter included in your
        # request. If true , there is a vocabulary filter match.

        @[JSON::Field(key: "VocabularyFilterMatch")]
        getter vocabulary_filter_match : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_time : Float64? = nil,
          @speaker : String? = nil,
          @stable : Bool? = nil,
          @start_time : Float64? = nil,
          @type : String? = nil,
          @vocabulary_filter_match : Bool? = nil
        )
        end
      end

      # The language code that represents the language identified in your audio, including the associated
      # confidence score. If you enabled channel identification in your request and each channel contained a
      # different language, you will have more than one LanguageWithScore result.

      struct LanguageWithScore
        include JSON::Serializable

        # The language code of the identified language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The confidence score associated with the identified language code. Confidence scores are values
        # between zero and one; larger values indicate a higher confidence in the identified language.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @language_code : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Your client has exceeded one of the Amazon Transcribe limits. This is typically the audio length
      # limit. Break your audio stream into smaller chunks and try your request again.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of possible alternative transcriptions for the input audio. Each alternative may contain one
      # or more of Items , Entities , or Transcript .

      struct MedicalAlternative
        include JSON::Serializable

        # Contains entities identified as personal health information (PHI) in your transcription output.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::MedicalEntity)?

        # Contains words, phrases, or punctuation marks in your transcription output.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::MedicalItem)?

        # Contains transcribed text.

        @[JSON::Field(key: "Transcript")]
        getter transcript : String?

        def initialize(
          @entities : Array(Types::MedicalEntity)? = nil,
          @items : Array(Types::MedicalItem)? = nil,
          @transcript : String? = nil
        )
        end
      end

      # Contains entities identified as personal health information (PHI) in your transcription output,
      # along with various associated attributes. Examples include category, confidence score, type,
      # stability score, and start and end times.

      struct MedicalEntity
        include JSON::Serializable

        # The category of information identified. The only category is PHI .

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The confidence score associated with the identified PHI entity in your audio. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified entity
        # correctly matches the entity spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or words identified as PHI.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time, in seconds, of the utterance that was identified as PHI.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # The start time, in seconds, of the utterance that was identified as PHI.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        def initialize(
          @category : String? = nil,
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_time : Float64? = nil,
          @start_time : Float64? = nil
        )
        end
      end

      # A word, phrase, or punctuation mark in your transcription output, along with various associated
      # attributes, such as confidence score, type, and start and end times.

      struct MedicalItem
        include JSON::Serializable

        # The confidence score associated with a word or phrase in your transcript. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified item
        # correctly matches the item spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or punctuation that was transcribed.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time, in seconds, of the transcribed item.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # If speaker partitioning is enabled, Speaker labels the speaker of the specified item.

        @[JSON::Field(key: "Speaker")]
        getter speaker : String?

        # The start time, in seconds, of the transcribed item.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        # The type of item identified. Options are: PRONUNCIATION (spoken words) and PUNCTUATION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_time : Float64? = nil,
          @speaker : String? = nil,
          @start_time : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # The Result associated with a . Contains a set of transcription results from one or more audio
      # segments, along with additional information per your request parameters. This can include
      # information relating to alternative transcriptions, channel identification, partial result
      # stabilization, language identification, and other transcription-related data.

      struct MedicalResult
        include JSON::Serializable

        # A list of possible alternative transcriptions for the input audio. Each alternative may contain one
        # or more of Items , Entities , or Transcript .

        @[JSON::Field(key: "Alternatives")]
        getter alternatives : Array(Types::MedicalAlternative)?

        # Indicates the channel identified for the Result .

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String?

        # The end time, in seconds, of the Result .

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # Indicates if the segment is complete. If IsPartial is true , the segment is not complete. If
        # IsPartial is false , the segment is complete.

        @[JSON::Field(key: "IsPartial")]
        getter is_partial : Bool?

        # Provides a unique identifier for the Result .

        @[JSON::Field(key: "ResultId")]
        getter result_id : String?

        # The start time, in seconds, of the Result .

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        def initialize(
          @alternatives : Array(Types::MedicalAlternative)? = nil,
          @channel_id : String? = nil,
          @end_time : Float64? = nil,
          @is_partial : Bool? = nil,
          @result_id : String? = nil,
          @start_time : Float64? = nil
        )
        end
      end

      # A wrapper for your audio chunks For more information, see Event stream encoding .

      struct MedicalScribeAudioEvent
        include JSON::Serializable

        # An audio blob containing the next segment of audio from your application, with a maximum duration of
        # 1 second. The maximum size in bytes varies based on audio properties. Find recommended size in
        # Transcribing streaming best practices . Size calculation: Duration (s) * Sample Rate (Hz) * Number
        # of Channels * 2 (Bytes per Sample) For example, a 1-second chunk of 16 kHz, 2-channel, 16-bit audio
        # would be 1 * 16000 * 2 * 2 = 64000 bytes . For 8 kHz, 1-channel, 16-bit audio, a 1-second chunk
        # would be 1 * 8000 * 1 * 2 = 16000 bytes .

        @[JSON::Field(key: "AudioChunk")]
        getter audio_chunk : Bytes

        def initialize(
          @audio_chunk : Bytes
        )
        end
      end

      # Makes it possible to specify which speaker is on which channel. For example, if the clinician is the
      # first participant to speak, you would set the ChannelId of the first ChannelDefinition in the list
      # to 0 (to indicate the first channel) and ParticipantRole to CLINICIAN (to indicate that it's the
      # clinician speaking). Then you would set the ChannelId of the second ChannelDefinition in the list to
      # 1 (to indicate the second channel) and ParticipantRole to PATIENT (to indicate that it's the patient
      # speaking). If you don't specify a channel definition, HealthScribe will diarize the transcription
      # and identify speaker roles for each speaker.

      struct MedicalScribeChannelDefinition
        include JSON::Serializable

        # Specify the audio channel you want to define.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32

        # Specify the participant that you want to flag. The allowed options are CLINICIAN and PATIENT .

        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String

        def initialize(
          @channel_id : Int32,
          @participant_role : String
        )
        end
      end

      # Specify details to configure the streaming session, including channel definitions, encryption
      # settings, post-stream analytics settings, resource access role ARN and vocabulary settings. Whether
      # you are starting a new session or resuming an existing session, your first event must be a
      # MedicalScribeConfigurationEvent . If you are resuming a session, then this event must have the same
      # configurations that you provided to start the session.

      struct MedicalScribeConfigurationEvent
        include JSON::Serializable

        # Specify settings for post-stream analytics.

        @[JSON::Field(key: "PostStreamAnalyticsSettings")]
        getter post_stream_analytics_settings : Types::MedicalScribePostStreamAnalyticsSettings

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 output
        # bucket you specified, and use your KMS key if supplied. If the role that you specify doesn’t have
        # the appropriate permissions, your request fails. IAM role ARNs have the format
        # arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see Amazon Web Services HealthScribe .

        @[JSON::Field(key: "ResourceAccessRoleArn")]
        getter resource_access_role_arn : String

        # Specify which speaker is on which audio channel.

        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::MedicalScribeChannelDefinition)?

        # Specify the encryption settings for your streaming session.

        @[JSON::Field(key: "EncryptionSettings")]
        getter encryption_settings : Types::MedicalScribeEncryptionSettings?

        # The MedicalScribeContext object that contains contextual information used to generate customized
        # clinical notes.

        @[JSON::Field(key: "MedicalScribeContext")]
        getter medical_scribe_context : Types::MedicalScribeContext?

        # Specify how you want your custom vocabulary filter applied to the streaming session. To replace
        # words with *** , specify mask . To delete words, specify remove . To flag words without changing
        # them, specify tag .

        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # Specify the name of the custom vocabulary filter you want to include in your streaming session.
        # Custom vocabulary filter names are case-sensitive. If you include VocabularyFilterName in the
        # MedicalScribeConfigurationEvent , you must also include VocabularyFilterMethod .

        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # Specify the name of the custom vocabulary you want to use for your streaming session. Custom
        # vocabulary names are case-sensitive.

        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @post_stream_analytics_settings : Types::MedicalScribePostStreamAnalyticsSettings,
          @resource_access_role_arn : String,
          @channel_definitions : Array(Types::MedicalScribeChannelDefinition)? = nil,
          @encryption_settings : Types::MedicalScribeEncryptionSettings? = nil,
          @medical_scribe_context : Types::MedicalScribeContext? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # The MedicalScribeContext object that contains contextual information which is used during clinical
      # note generation to add relevant context to the note.

      struct MedicalScribeContext
        include JSON::Serializable

        # Contains patient-specific information used to customize the clinical note generation.

        @[JSON::Field(key: "PatientContext")]
        getter patient_context : Types::MedicalScribePatientContext?

        def initialize(
          @patient_context : Types::MedicalScribePatientContext? = nil
        )
        end
      end

      # Contains encryption related settings to be used for data encryption with Key Management Service,
      # including KmsEncryptionContext and KmsKeyId. The KmsKeyId is required, while KmsEncryptionContext is
      # optional for additional layer of security. By default, Amazon Web Services HealthScribe provides
      # encryption at rest to protect sensitive customer data using Amazon S3-managed keys. HealthScribe
      # uses the KMS key you specify as a second layer of encryption. Your ResourceAccessRoleArn must
      # permission to use your KMS key. For more information, see Data Encryption at rest for Amazon Web
      # Services HealthScribe .

      struct MedicalScribeEncryptionSettings
        include JSON::Serializable

        # The ID of the KMS key you want to use for your streaming session. You can specify its KMS key ID,
        # key Amazon Resource Name (ARN), alias name, or alias ARN. When using an alias name, prefix it with
        # "alias/" . To specify a KMS key in a different Amazon Web Services account, you must use the key ARN
        # or alias ARN. For example: Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab Key ARN:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab Alias name:
        # alias/ExampleAlias Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias To get the key
        # ID and key ARN for a KMS key, use the ListKeys or DescribeKey KMS API operations. To get the alias
        # name and alias ARN, use ListKeys API operation.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String

        # A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an
        # added layer of security for your data. For more information, see KMSencryption context and
        # Asymmetric keys in KMS .

        @[JSON::Field(key: "KmsEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        def initialize(
          @kms_key_id : String,
          @kms_encryption_context : Hash(String, String)? = nil
        )
        end
      end

      # An encoded stream of events. The stream is encoded as HTTP/2 data frames. An input stream consists
      # of the following types of events. The first element of the input stream must be the
      # MedicalScribeConfigurationEvent event type. MedicalScribeConfigurationEvent MedicalScribeAudioEvent
      # MedicalScribeSessionControlEvent

      struct MedicalScribeInputStream
        include JSON::Serializable


        @[JSON::Field(key: "AudioEvent")]
        getter audio_event : Types::MedicalScribeAudioEvent?

        # Specify additional streaming session configurations beyond those provided in your initial start
        # request headers. For example, specify channel definitions, encryption settings, and post-stream
        # analytics settings. Whether you are starting a new session or resuming an existing session, your
        # first event must be a MedicalScribeConfigurationEvent .

        @[JSON::Field(key: "ConfigurationEvent")]
        getter configuration_event : Types::MedicalScribeConfigurationEvent?

        # Specify the lifecycle of your streaming session, such as ending the session.

        @[JSON::Field(key: "SessionControlEvent")]
        getter session_control_event : Types::MedicalScribeSessionControlEvent?

        def initialize(
          @audio_event : Types::MedicalScribeAudioEvent? = nil,
          @configuration_event : Types::MedicalScribeConfigurationEvent? = nil,
          @session_control_event : Types::MedicalScribeSessionControlEvent? = nil
        )
        end
      end

      # Contains patient-specific information.

      struct MedicalScribePatientContext
        include JSON::Serializable

        # The patient's preferred pronouns that the user wants to provide as a context for clinical note
        # generation .

        @[JSON::Field(key: "Pronouns")]
        getter pronouns : String?

        def initialize(
          @pronouns : String? = nil
        )
        end
      end

      # Contains details for the result of post-stream analytics.

      struct MedicalScribePostStreamAnalyticsResult
        include JSON::Serializable

        # Provides the Clinical Note Generation result for post-stream analytics.

        @[JSON::Field(key: "ClinicalNoteGenerationResult")]
        getter clinical_note_generation_result : Types::ClinicalNoteGenerationResult?

        def initialize(
          @clinical_note_generation_result : Types::ClinicalNoteGenerationResult? = nil
        )
        end
      end

      # The settings for post-stream analytics.

      struct MedicalScribePostStreamAnalyticsSettings
        include JSON::Serializable

        # Specify settings for the post-stream clinical note generation.

        @[JSON::Field(key: "ClinicalNoteGenerationSettings")]
        getter clinical_note_generation_settings : Types::ClinicalNoteGenerationSettings

        def initialize(
          @clinical_note_generation_settings : Types::ClinicalNoteGenerationSettings
        )
        end
      end

      # Result stream where you will receive the output events. The details are provided in the
      # MedicalScribeTranscriptEvent object.

      struct MedicalScribeResultStream
        include JSON::Serializable


        @[JSON::Field(key: "BadRequestException")]
        getter bad_request_exception : Types::BadRequestException?


        @[JSON::Field(key: "ConflictException")]
        getter conflict_exception : Types::ConflictException?


        @[JSON::Field(key: "InternalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?


        @[JSON::Field(key: "LimitExceededException")]
        getter limit_exceeded_exception : Types::LimitExceededException?


        @[JSON::Field(key: "ServiceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # The transcript event that contains real-time transcription results.

        @[JSON::Field(key: "TranscriptEvent")]
        getter transcript_event : Types::MedicalScribeTranscriptEvent?

        def initialize(
          @bad_request_exception : Types::BadRequestException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @limit_exceeded_exception : Types::LimitExceededException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @transcript_event : Types::MedicalScribeTranscriptEvent? = nil
        )
        end
      end

      # Specify the lifecycle of your streaming session.

      struct MedicalScribeSessionControlEvent
        include JSON::Serializable

        # The type of MedicalScribeSessionControlEvent . Possible Values: END_OF_SESSION - Indicates the audio
        # streaming is complete. After you send an END_OF_SESSION event, Amazon Web Services HealthScribe
        # starts the post-stream analytics. The session can't be resumed after this event is sent. After
        # Amazon Web Services HealthScribe processes the event, the real-time StreamStatus is COMPLETED . You
        # get the StreamStatus and other stream details with the GetMedicalScribeStream API operation. For
        # more information about different streaming statuses, see the StreamStatus description in the
        # MedicalScribeStreamDetails .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Contains details about a Amazon Web Services HealthScribe streaming session.

      struct MedicalScribeStreamDetails
        include JSON::Serializable

        # The Channel Definitions of the HealthScribe streaming session.

        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::MedicalScribeChannelDefinition)?

        # The Encryption Settings of the HealthScribe streaming session.

        @[JSON::Field(key: "EncryptionSettings")]
        getter encryption_settings : Types::MedicalScribeEncryptionSettings?

        # The Language Code of the HealthScribe streaming session.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The Media Encoding of the HealthScribe streaming session.

        @[JSON::Field(key: "MediaEncoding")]
        getter media_encoding : String?

        # The sample rate (in hertz) of the HealthScribe streaming session.

        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # Indicates whether the MedicalScribeContext object was provided when the stream was started.

        @[JSON::Field(key: "MedicalScribeContextProvided")]
        getter medical_scribe_context_provided : Bool?

        # The result of post-stream analytics for the HealthScribe streaming session.

        @[JSON::Field(key: "PostStreamAnalyticsResult")]
        getter post_stream_analytics_result : Types::MedicalScribePostStreamAnalyticsResult?

        # The post-stream analytics settings of the HealthScribe streaming session.

        @[JSON::Field(key: "PostStreamAnalyticsSettings")]
        getter post_stream_analytics_settings : Types::MedicalScribePostStreamAnalyticsSettings?

        # The Amazon Resource Name (ARN) of the role used in the HealthScribe streaming session.

        @[JSON::Field(key: "ResourceAccessRoleArn")]
        getter resource_access_role_arn : String?

        # The identifier of the HealthScribe streaming session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The date and time when the HealthScribe streaming session was created.

        @[JSON::Field(key: "StreamCreatedAt")]
        getter stream_created_at : Time?

        # The date and time when the HealthScribe streaming session was ended.

        @[JSON::Field(key: "StreamEndedAt")]
        getter stream_ended_at : Time?

        # The streaming status of the HealthScribe streaming session. Possible Values: IN_PROGRESS PAUSED
        # FAILED COMPLETED This status is specific to real-time streaming. A COMPLETED status doesn't mean
        # that the post-stream analytics is complete. To get status of an analytics result, check the Status
        # field for the analytics result within the MedicalScribePostStreamAnalyticsResult . For example, you
        # can view the status of the ClinicalNoteGenerationResult .

        @[JSON::Field(key: "StreamStatus")]
        getter stream_status : String?

        # The method of the vocabulary filter for the HealthScribe streaming session.

        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # The name of the vocabulary filter used for the HealthScribe streaming session .

        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The vocabulary name of the HealthScribe streaming session.

        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @channel_definitions : Array(Types::MedicalScribeChannelDefinition)? = nil,
          @encryption_settings : Types::MedicalScribeEncryptionSettings? = nil,
          @language_code : String? = nil,
          @media_encoding : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @medical_scribe_context_provided : Bool? = nil,
          @post_stream_analytics_result : Types::MedicalScribePostStreamAnalyticsResult? = nil,
          @post_stream_analytics_settings : Types::MedicalScribePostStreamAnalyticsSettings? = nil,
          @resource_access_role_arn : String? = nil,
          @session_id : String? = nil,
          @stream_created_at : Time? = nil,
          @stream_ended_at : Time? = nil,
          @stream_status : String? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # The event associated with MedicalScribeResultStream . Contains MedicalScribeTranscriptSegment ,
      # which contains segment related information.

      struct MedicalScribeTranscriptEvent
        include JSON::Serializable

        # The TranscriptSegment associated with a MedicalScribeTranscriptEvent .

        @[JSON::Field(key: "TranscriptSegment")]
        getter transcript_segment : Types::MedicalScribeTranscriptSegment?

        def initialize(
          @transcript_segment : Types::MedicalScribeTranscriptSegment? = nil
        )
        end
      end

      # A word, phrase, or punctuation mark in your transcription output, along with various associated
      # attributes, such as confidence score, type, and start and end times.

      struct MedicalScribeTranscriptItem
        include JSON::Serializable

        # The start time, in milliseconds, of the transcribed item.

        @[JSON::Field(key: "BeginAudioTime")]
        getter begin_audio_time : Float64?

        # The confidence score associated with a word or phrase in your transcript. Confidence scores are
        # values between 0 and 1. A larger value indicates a higher probability that the identified item
        # correctly matches the item spoken in your media.

        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word, phrase or punctuation mark that was transcribed.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time, in milliseconds, of the transcribed item.

        @[JSON::Field(key: "EndAudioTime")]
        getter end_audio_time : Float64?

        # The type of item identified. Options are: PRONUNCIATION (spoken words) and PUNCTUATION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Indicates whether the specified item matches a word in the vocabulary filter included in your
        # configuration event. If true , there is a vocabulary filter match.

        @[JSON::Field(key: "VocabularyFilterMatch")]
        getter vocabulary_filter_match : Bool?

        def initialize(
          @begin_audio_time : Float64? = nil,
          @confidence : Float64? = nil,
          @content : String? = nil,
          @end_audio_time : Float64? = nil,
          @type : String? = nil,
          @vocabulary_filter_match : Bool? = nil
        )
        end
      end

      # Contains a set of transcription results, along with additional information of the segment.

      struct MedicalScribeTranscriptSegment
        include JSON::Serializable

        # The start time, in milliseconds, of the segment.

        @[JSON::Field(key: "BeginAudioTime")]
        getter begin_audio_time : Float64?

        # Indicates which audio channel is associated with the MedicalScribeTranscriptSegment . If
        # MedicalScribeChannelDefinition is not provided in the MedicalScribeConfigurationEvent , then this
        # field will not be included.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String?

        # Contains transcribed text of the segment.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The end time, in milliseconds, of the segment.

        @[JSON::Field(key: "EndAudioTime")]
        getter end_audio_time : Float64?

        # Indicates if the segment is complete. If IsPartial is true , the segment is not complete. If
        # IsPartial is false , the segment is complete.

        @[JSON::Field(key: "IsPartial")]
        getter is_partial : Bool?

        # Contains words, phrases, or punctuation marks in your segment.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::MedicalScribeTranscriptItem)?

        # The identifier of the segment.

        @[JSON::Field(key: "SegmentId")]
        getter segment_id : String?

        def initialize(
          @begin_audio_time : Float64? = nil,
          @channel_id : String? = nil,
          @content : String? = nil,
          @end_audio_time : Float64? = nil,
          @is_partial : Bool? = nil,
          @items : Array(Types::MedicalScribeTranscriptItem)? = nil,
          @segment_id : String? = nil
        )
        end
      end

      # The MedicalTranscript associated with a . MedicalTranscript contains Results , which contains a set
      # of transcription results from one or more audio segments, along with additional information per your
      # request parameters.

      struct MedicalTranscript
        include JSON::Serializable

        # Contains a set of transcription results from one or more audio segments, along with additional
        # information per your request parameters. This can include information relating to alternative
        # transcriptions, channel identification, partial result stabilization, language identification, and
        # other transcription-related data.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::MedicalResult)?

        def initialize(
          @results : Array(Types::MedicalResult)? = nil
        )
        end
      end

      # The MedicalTranscriptEvent associated with a MedicalTranscriptResultStream . Contains a set of
      # transcription results from one or more audio segments, along with additional information per your
      # request parameters.

      struct MedicalTranscriptEvent
        include JSON::Serializable

        # Contains Results , which contains a set of transcription results from one or more audio segments,
        # along with additional information per your request parameters. This can include information relating
        # to alternative transcriptions, channel identification, partial result stabilization, language
        # identification, and other transcription-related data.

        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::MedicalTranscript?

        def initialize(
          @transcript : Types::MedicalTranscript? = nil
        )
        end
      end

      # Contains detailed information about your streaming session.

      struct MedicalTranscriptResultStream
        include JSON::Serializable


        @[JSON::Field(key: "BadRequestException")]
        getter bad_request_exception : Types::BadRequestException?


        @[JSON::Field(key: "ConflictException")]
        getter conflict_exception : Types::ConflictException?


        @[JSON::Field(key: "InternalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?


        @[JSON::Field(key: "LimitExceededException")]
        getter limit_exceeded_exception : Types::LimitExceededException?


        @[JSON::Field(key: "ServiceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # The MedicalTranscriptEvent associated with a MedicalTranscriptResultStream . Contains a set of
        # transcription results from one or more audio segments, along with additional information per your
        # request parameters. This can include information relating to alternative transcriptions, channel
        # identification, partial result stabilization, language identification, and other
        # transcription-related data.

        @[JSON::Field(key: "TranscriptEvent")]
        getter transcript_event : Types::MedicalTranscriptEvent?

        def initialize(
          @bad_request_exception : Types::BadRequestException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @limit_exceeded_exception : Types::LimitExceededException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @transcript_event : Types::MedicalTranscriptEvent? = nil
        )
        end
      end

      # Contains the timestamps of matched categories.

      struct PointsOfInterest
        include JSON::Serializable

        # Contains the timestamp ranges (start time through end time) of matched categories and rules.

        @[JSON::Field(key: "TimestampRanges")]
        getter timestamp_ranges : Array(Types::TimestampRange)?

        def initialize(
          @timestamp_ranges : Array(Types::TimestampRange)? = nil
        )
        end
      end

      # Allows you to specify additional settings for your Call Analytics post-call request, including
      # output locations for your redacted transcript, which IAM role to use, and which encryption key to
      # use. DataAccessRoleArn and OutputLocation are required fields. PostCallAnalyticsSettings provides
      # you with the same insights as a Call Analytics post-call transcription. Refer to Post-call analytics
      # for more information on this feature.

      struct PostCallAnalyticsSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files. If the role that you specify doesn’t have the appropriate
        # permissions to access the specified Amazon S3 location, your request fails. IAM role ARNs have the
        # format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The Amazon S3 location where you want your Call Analytics post-call transcription output stored. You
        # can use any of the following formats to specify the output location: s3://DOC-EXAMPLE-BUCKET
        # s3://DOC-EXAMPLE-BUCKET/my-output-folder/
        # s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : String

        # Specify whether you want only a redacted transcript or both a redacted and an unredacted transcript.
        # If you choose redacted and unredacted, two JSON files are generated and stored in the Amazon S3
        # output location you specify. Note that to include ContentRedactionOutput in your request, you must
        # enable content redaction ( ContentRedactionType ).

        @[JSON::Field(key: "ContentRedactionOutput")]
        getter content_redaction_output : String?

        # The KMS key you want to use to encrypt your Call Analytics post-call output. If using a key located
        # in the current Amazon Web Services account, you can specify your KMS key in one of four ways: Use
        # the KMS key ID itself. For example, 1234abcd-12ab-34cd-56ef-1234567890ab . Use an alias for the KMS
        # key ID. For example, alias/ExampleAlias . Use the Amazon Resource Name (ARN) for the KMS key ID. For
        # example, arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab . Use the ARN for
        # the KMS key alias. For example, arn:aws:kms:region:account-ID:alias/ExampleAlias . If using a key
        # located in a different Amazon Web Services account than the current Amazon Web Services account, you
        # can specify your KMS key in one of two ways: Use the ARN for the KMS key ID. For example,
        # arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab . Use the ARN for the KMS key
        # alias. For example, arn:aws:kms:region:account-ID:alias/ExampleAlias . Note that the role making the
        # request must have permission to use the specified KMS key.

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

      # The request references a resource which doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Result associated with a . Contains a set of transcription results from one or more audio
      # segments, along with additional information per your request parameters. This can include
      # information relating to alternative transcriptions, channel identification, partial result
      # stabilization, language identification, and other transcription-related data.

      struct Result
        include JSON::Serializable

        # A list of possible alternative transcriptions for the input audio. Each alternative may contain one
        # or more of Items , Entities , or Transcript .

        @[JSON::Field(key: "Alternatives")]
        getter alternatives : Array(Types::Alternative)?

        # Indicates which audio channel is associated with the Result .

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String?

        # The end time of the Result in seconds, with millisecond precision (e.g., 1.056).

        @[JSON::Field(key: "EndTime")]
        getter end_time : Float64?

        # Indicates if the segment is complete. If IsPartial is true , the segment is not complete. If
        # IsPartial is false , the segment is complete.

        @[JSON::Field(key: "IsPartial")]
        getter is_partial : Bool?

        # The language code that represents the language spoken in your audio stream.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The language code of the dominant language identified in your stream. If you enabled channel
        # identification and each channel of your audio contains a different language, you may have more than
        # one result.

        @[JSON::Field(key: "LanguageIdentification")]
        getter language_identification : Array(Types::LanguageWithScore)?

        # Provides a unique identifier for the Result .

        @[JSON::Field(key: "ResultId")]
        getter result_id : String?

        # The start time of the Result in seconds, with millisecond precision (e.g., 1.056).

        @[JSON::Field(key: "StartTime")]
        getter start_time : Float64?

        def initialize(
          @alternatives : Array(Types::Alternative)? = nil,
          @channel_id : String? = nil,
          @end_time : Float64? = nil,
          @is_partial : Bool? = nil,
          @language_code : String? = nil,
          @language_identification : Array(Types::LanguageWithScore)? = nil,
          @result_id : String? = nil,
          @start_time : Float64? = nil
        )
        end
      end

      # The service is currently unavailable. Try your request later.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartCallAnalyticsStreamTranscriptionRequest
        include JSON::Serializable

        # An encoded stream of audio blobs. Audio streams are encoded as either HTTP/2 or WebSocket data
        # frames. For more information, see Transcribing streaming audio .

        @[JSON::Field(key: "AudioStream")]
        getter audio_stream : Types::AudioStream

        # Specify the encoding of your input audio. Supported formats are: FLAC OPUS-encoded audio in an Ogg
        # container PCM (only signed 16-bit little-endian audio formats, which does not include WAV) For more
        # information, see Media formats .

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String

        # The sample rate of the input audio (in hertz). Low-quality audio, such as telephone audio, is
        # typically around 8,000 Hz. High-quality audio typically ranges from 16,000 Hz to 48,000 Hz. Note
        # that the sample rate you specify must match that of your audio.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32

        # Labels all personally identifiable information (PII) identified in your transcript. Content
        # identification is performed at the segment level; PII specified in PiiEntityTypes is flagged upon
        # complete transcription of an audio segment. If you don't include PiiEntityTypes in your request, all
        # PII is identified. You can’t set ContentIdentificationType and ContentRedactionType in the same
        # request. If you set both, your request returns a BadRequestException . For more information, see
        # Redacting or identifying personally identifiable information .

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Redacts all personally identifiable information (PII) identified in your transcript. Content
        # redaction is performed at the segment level; PII specified in PiiEntityTypes is redacted upon
        # complete transcription of an audio segment. If you don't include PiiEntityTypes in your request, all
        # PII is redacted. You can’t set ContentRedactionType and ContentIdentificationType in the same
        # request. If you set both, your request returns a BadRequestException . For more information, see
        # Redacting or identifying personally identifiable information .

        @[JSON::Field(key: "x-amzn-transcribe-content-redaction-type")]
        getter content_redaction_type : String?

        # Enables partial result stabilization for your transcription. Partial result stabilization can reduce
        # latency in your output, but may impact accuracy. For more information, see Partial-result
        # stabilization .

        @[JSON::Field(key: "x-amzn-transcribe-enable-partial-results-stabilization")]
        getter enable_partial_results_stabilization : Bool?

        # Enables automatic language identification for your Call Analytics transcription. If you include
        # IdentifyLanguage , you must include a list of language codes, using LanguageOptions , that you think
        # may be present in your audio stream. You must provide a minimum of two language selections. You can
        # also include a preferred language using PreferredLanguage . Adding a preferred language can help
        # Amazon Transcribe identify the language faster than if you omit this parameter. Note that you must
        # include either LanguageCode or IdentifyLanguage in your request. If you include both parameters,
        # your transcription job fails.

        @[JSON::Field(key: "x-amzn-transcribe-identify-language")]
        getter identify_language : Bool?

        # Specify the language code that represents the language spoken in your audio. For a list of languages
        # supported with real-time Call Analytics, refer to the Supported languages table.

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # Specify the name of the custom language model that you want to use when processing your
        # transcription. Note that language model names are case sensitive. The language of the specified
        # language model must match the language code you specify in your transcription request. If the
        # languages don't match, the custom language model isn't applied. There are no errors or warnings
        # associated with a language mismatch. For more information, see Custom language models .

        @[JSON::Field(key: "x-amzn-transcribe-language-model-name")]
        getter language_model_name : String?

        # Specify two or more language codes that represent the languages you think may be present in your
        # media. Including language options can improve the accuracy of language identification. If you
        # include LanguageOptions in your request, you must also include IdentifyLanguage . For a list of
        # languages supported with Call Analytics streaming, refer to the Supported languages table. You can
        # only include one language dialect per language per stream. For example, you cannot include en-US and
        # en-AU in the same request.

        @[JSON::Field(key: "x-amzn-transcribe-language-options")]
        getter language_options : String?

        # Specify the level of stability to use when you enable partial results stabilization (
        # EnablePartialResultsStabilization ). Low stability provides the highest accuracy. High stability
        # transcribes faster, but with slightly lower accuracy. For more information, see Partial-result
        # stabilization .

        @[JSON::Field(key: "x-amzn-transcribe-partial-results-stability")]
        getter partial_results_stability : String?

        # Specify which types of personally identifiable information (PII) you want to redact in your
        # transcript. You can include as many types as you'd like, or you can select ALL . Values must be
        # comma-separated and can include: ADDRESS , BANK_ACCOUNT_NUMBER , BANK_ROUTING , CREDIT_DEBIT_CVV ,
        # CREDIT_DEBIT_EXPIRY , CREDIT_DEBIT_NUMBER , EMAIL , NAME , PHONE , PIN , SSN , or ALL . Note that if
        # you include PiiEntityTypes in your request, you must also include ContentIdentificationType or
        # ContentRedactionType . If you include ContentRedactionType or ContentIdentificationType in your
        # request, but do not include PiiEntityTypes , all PII is redacted or identified.

        @[JSON::Field(key: "x-amzn-transcribe-pii-entity-types")]
        getter pii_entity_types : String?

        # Specify a preferred language from the subset of languages codes you specified in LanguageOptions .
        # You can only use this parameter if you've included IdentifyLanguage and LanguageOptions in your
        # request.

        @[JSON::Field(key: "x-amzn-transcribe-preferred-language")]
        getter preferred_language : String?

        # Specify a name for your Call Analytics transcription session. If you don't include this parameter in
        # your request, Amazon Transcribe generates an ID and returns it in the response.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Specify how you want your vocabulary filter applied to your transcript. To replace words with *** ,
        # choose mask . To delete words, choose remove . To flag words without changing them, choose tag .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-method")]
        getter vocabulary_filter_method : String?

        # Specify the name of the custom vocabulary filter that you want to use when processing your
        # transcription. Note that vocabulary filter names are case sensitive. If the language of the
        # specified custom vocabulary filter doesn't match the language identified in your media, the
        # vocabulary filter is not applied to your transcription. For more information, see Using vocabulary
        # filtering with unwanted words .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-name")]
        getter vocabulary_filter_name : String?

        # Specify the names of the custom vocabulary filters that you want to use when processing your Call
        # Analytics transcription. Note that vocabulary filter names are case sensitive. These filters serve
        # to customize the transcript output. This parameter is only intended for use with the
        # IdentifyLanguage parameter. If you're not including IdentifyLanguage in your request and want to use
        # a custom vocabulary filter with your transcription, use the VocabularyFilterName parameter instead.
        # For more information, see Using vocabulary filtering with unwanted words .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-names")]
        getter vocabulary_filter_names : String?

        # Specify the name of the custom vocabulary that you want to use when processing your transcription.
        # Note that vocabulary names are case sensitive. If the language of the specified custom vocabulary
        # doesn't match the language identified in your media, the custom vocabulary is not applied to your
        # transcription. For more information, see Custom vocabularies .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        # Specify the names of the custom vocabularies that you want to use when processing your Call
        # Analytics transcription. Note that vocabulary names are case sensitive. If the custom vocabulary's
        # language doesn't match the identified media language, it won't be applied to the transcription. This
        # parameter is only intended for use with the IdentifyLanguage parameter. If you're not including
        # IdentifyLanguage in your request and want to use a custom vocabulary with your transcription, use
        # the VocabularyName parameter instead. For more information, see Custom vocabularies .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-names")]
        getter vocabulary_names : String?

        def initialize(
          @audio_stream : Types::AudioStream,
          @media_encoding : String,
          @media_sample_rate_hertz : Int32,
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @identify_language : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @session_id : String? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end


      struct StartCallAnalyticsStreamTranscriptionResponse
        include JSON::Serializable

        # Provides detailed information about your real-time Call Analytics session.

        @[JSON::Field(key: "CallAnalyticsTranscriptResultStream")]
        getter call_analytics_transcript_result_stream : Types::CallAnalyticsTranscriptResultStream?

        # Shows whether content identification was enabled for your Call Analytics transcription.

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Shows whether content redaction was enabled for your Call Analytics transcription.

        @[JSON::Field(key: "x-amzn-transcribe-content-redaction-type")]
        getter content_redaction_type : String?

        # Shows whether partial results stabilization was enabled for your Call Analytics transcription.

        @[JSON::Field(key: "x-amzn-transcribe-enable-partial-results-stabilization")]
        getter enable_partial_results_stabilization : Bool?

        # Shows whether automatic language identification was enabled for your Call Analytics transcription.

        @[JSON::Field(key: "x-amzn-transcribe-identify-language")]
        getter identify_language : Bool?

        # Provides the language code that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # Provides the name of the custom language model that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-language-model-name")]
        getter language_model_name : String?

        # Provides the language codes that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-language-options")]
        getter language_options : String?

        # Provides the media encoding you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String?

        # Provides the sample rate that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32?

        # Provides the stabilization level used for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-partial-results-stability")]
        getter partial_results_stability : String?

        # Lists the PII entity types you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-pii-entity-types")]
        getter pii_entity_types : String?

        # Provides the preferred language that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-preferred-language")]
        getter preferred_language : String?

        # Provides the identifier for your real-time Call Analytics request.

        @[JSON::Field(key: "x-amzn-request-id")]
        getter request_id : String?

        # Provides the identifier for your Call Analytics transcription session.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Provides the vocabulary filtering method used in your Call Analytics transcription.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-method")]
        getter vocabulary_filter_method : String?

        # Provides the name of the custom vocabulary filter that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-name")]
        getter vocabulary_filter_name : String?

        # Provides the names of the custom vocabulary filters that you specified in your Call Analytics
        # request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-names")]
        getter vocabulary_filter_names : String?

        # Provides the name of the custom vocabulary that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        # Provides the names of the custom vocabularies that you specified in your Call Analytics request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-names")]
        getter vocabulary_names : String?

        def initialize(
          @call_analytics_transcript_result_stream : Types::CallAnalyticsTranscriptResultStream? = nil,
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @identify_language : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @media_encoding : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @request_id : String? = nil,
          @session_id : String? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end


      struct StartMedicalScribeStreamRequest
        include JSON::Serializable

        # Specify the input stream where you will send events in real time. The first element of the input
        # stream must be a MedicalScribeConfigurationEvent .

        @[JSON::Field(key: "InputStream")]
        getter input_stream : Types::MedicalScribeInputStream

        # Specify the language code for your HealthScribe streaming session.

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String

        # Specify the encoding used for the input audio. Supported formats are: FLAC OPUS-encoded audio in an
        # Ogg container PCM (only signed 16-bit little-endian audio formats, which does not include WAV) For
        # more information, see Media formats .

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String

        # Specify the sample rate of the input audio (in hertz). Amazon Web Services HealthScribe supports a
        # range from 16,000 Hz to 48,000 Hz. The sample rate you specify must match that of your audio.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32

        # Specify an identifier for your streaming session (in UUID format). If you don't include a SessionId
        # in your request, Amazon Web Services HealthScribe generates an ID and returns it in the response.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        def initialize(
          @input_stream : Types::MedicalScribeInputStream,
          @language_code : String,
          @media_encoding : String,
          @media_sample_rate_hertz : Int32,
          @session_id : String? = nil
        )
        end
      end


      struct StartMedicalScribeStreamResponse
        include JSON::Serializable

        # The Language Code that you specified in your request. Same as provided in the
        # StartMedicalScribeStreamRequest .

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # The Media Encoding you specified in your request. Same as provided in the
        # StartMedicalScribeStreamRequest

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String?

        # The sample rate (in hertz) that you specified in your request. Same as provided in the
        # StartMedicalScribeStreamRequest

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32?

        # The unique identifier for your streaming request.

        @[JSON::Field(key: "x-amzn-request-id")]
        getter request_id : String?

        # The result stream where you will receive the output events.

        @[JSON::Field(key: "ResultStream")]
        getter result_stream : Types::MedicalScribeResultStream?

        # The identifier (in UUID format) for your streaming session. If you already started streaming, this
        # is same ID as the one you specified in your initial StartMedicalScribeStreamRequest .

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        def initialize(
          @language_code : String? = nil,
          @media_encoding : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @request_id : String? = nil,
          @result_stream : Types::MedicalScribeResultStream? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct StartMedicalStreamTranscriptionRequest
        include JSON::Serializable


        @[JSON::Field(key: "AudioStream")]
        getter audio_stream : Types::AudioStream

        # Specify the language code that represents the language spoken in your audio. Amazon Transcribe
        # Medical only supports US English ( en-US ).

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String

        # Specify the encoding used for the input audio. Supported formats are: FLAC OPUS-encoded audio in an
        # Ogg container PCM (only signed 16-bit little-endian audio formats, which does not include WAV) For
        # more information, see Media formats .

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String

        # The sample rate of the input audio (in hertz). Amazon Transcribe Medical supports a range from
        # 16,000 Hz to 48,000 Hz. Note that the sample rate you specify must match that of your audio.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32

        # Specify the medical specialty contained in your audio.

        @[JSON::Field(key: "x-amzn-transcribe-specialty")]
        getter specialty : String

        # Specify the type of input audio. For example, choose DICTATION for a provider dictating patient
        # notes and CONVERSATION for a dialogue between a patient and a medical professional.

        @[JSON::Field(key: "x-amzn-transcribe-type")]
        getter type : String

        # Labels all personal health information (PHI) identified in your transcript. Content identification
        # is performed at the segment level; PHI is flagged upon complete transcription of an audio segment.
        # For more information, see Identifying personal health information (PHI) in a transcription .

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Enables channel identification in multi-channel audio. Channel identification transcribes the audio
        # on each channel independently, then appends the output for each channel into one transcript. If you
        # have multi-channel audio and do not enable channel identification, your audio is transcribed in a
        # continuous manner and your transcript is not separated by channel. If you include
        # EnableChannelIdentification in your request, you must also include NumberOfChannels . For more
        # information, see Transcribing multi-channel audio .

        @[JSON::Field(key: "x-amzn-transcribe-enable-channel-identification")]
        getter enable_channel_identification : Bool?

        # Specify the number of channels in your audio stream. This value must be 2 , as only two channels are
        # supported. If your audio doesn't contain multiple channels, do not include this parameter in your
        # request. If you include NumberOfChannels in your request, you must also include
        # EnableChannelIdentification .

        @[JSON::Field(key: "x-amzn-transcribe-number-of-channels")]
        getter number_of_channels : Int32?

        # Specify a name for your transcription session. If you don't include this parameter in your request,
        # Amazon Transcribe Medical generates an ID and returns it in the response.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels
        # the speech from individual speakers in your media file. For more information, see Partitioning
        # speakers (diarization) .

        @[JSON::Field(key: "x-amzn-transcribe-show-speaker-label")]
        getter show_speaker_label : Bool?

        # Specify the name of the custom vocabulary that you want to use when processing your transcription.
        # Note that vocabulary names are case sensitive.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        def initialize(
          @audio_stream : Types::AudioStream,
          @language_code : String,
          @media_encoding : String,
          @media_sample_rate_hertz : Int32,
          @specialty : String,
          @type : String,
          @content_identification_type : String? = nil,
          @enable_channel_identification : Bool? = nil,
          @number_of_channels : Int32? = nil,
          @session_id : String? = nil,
          @show_speaker_label : Bool? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end


      struct StartMedicalStreamTranscriptionResponse
        include JSON::Serializable

        # Shows whether content identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Shows whether channel identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-enable-channel-identification")]
        getter enable_channel_identification : Bool?

        # Provides the language code that you specified in your request. This must be en-US .

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # Provides the media encoding you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String?

        # Provides the sample rate that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32?

        # Provides the number of channels that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-number-of-channels")]
        getter number_of_channels : Int32?

        # Provides the identifier for your streaming request.

        @[JSON::Field(key: "x-amzn-request-id")]
        getter request_id : String?

        # Provides the identifier for your transcription session.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Shows whether speaker partitioning was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-show-speaker-label")]
        getter show_speaker_label : Bool?

        # Provides the medical specialty that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-specialty")]
        getter specialty : String?

        # Provides detailed information about your streaming session.

        @[JSON::Field(key: "TranscriptResultStream")]
        getter transcript_result_stream : Types::MedicalTranscriptResultStream?

        # Provides the type of audio you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-type")]
        getter type : String?

        # Provides the name of the custom vocabulary that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        def initialize(
          @content_identification_type : String? = nil,
          @enable_channel_identification : Bool? = nil,
          @language_code : String? = nil,
          @media_encoding : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @number_of_channels : Int32? = nil,
          @request_id : String? = nil,
          @session_id : String? = nil,
          @show_speaker_label : Bool? = nil,
          @specialty : String? = nil,
          @transcript_result_stream : Types::MedicalTranscriptResultStream? = nil,
          @type : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end


      struct StartStreamTranscriptionRequest
        include JSON::Serializable

        # An encoded stream of audio blobs. Audio streams are encoded as either HTTP/2 or WebSocket data
        # frames. For more information, see Transcribing streaming audio .

        @[JSON::Field(key: "AudioStream")]
        getter audio_stream : Types::AudioStream

        # Specify the encoding of your input audio. Supported formats are: FLAC OPUS-encoded audio in an Ogg
        # container PCM (only signed 16-bit little-endian audio formats, which does not include WAV) For more
        # information, see Media formats .

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String

        # The sample rate of the input audio (in hertz). Low-quality audio, such as telephone audio, is
        # typically around 8,000 Hz. High-quality audio typically ranges from 16,000 Hz to 48,000 Hz. Note
        # that the sample rate you specify must match that of your audio.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32

        # Labels all personally identifiable information (PII) identified in your transcript. Content
        # identification is performed at the segment level; PII specified in PiiEntityTypes is flagged upon
        # complete transcription of an audio segment. If you don't include PiiEntityTypes in your request, all
        # PII is identified. You can’t set ContentIdentificationType and ContentRedactionType in the same
        # request. If you set both, your request returns a BadRequestException . For more information, see
        # Redacting or identifying personally identifiable information .

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Redacts all personally identifiable information (PII) identified in your transcript. Content
        # redaction is performed at the segment level; PII specified in PiiEntityTypes is redacted upon
        # complete transcription of an audio segment. If you don't include PiiEntityTypes in your request, all
        # PII is redacted. You can’t set ContentRedactionType and ContentIdentificationType in the same
        # request. If you set both, your request returns a BadRequestException . For more information, see
        # Redacting or identifying personally identifiable information .

        @[JSON::Field(key: "x-amzn-transcribe-content-redaction-type")]
        getter content_redaction_type : String?

        # Enables channel identification in multi-channel audio. Channel identification transcribes the audio
        # on each channel independently, then appends the output for each channel into one transcript. If you
        # have multi-channel audio and do not enable channel identification, your audio is transcribed in a
        # continuous manner and your transcript is not separated by channel. If you include
        # EnableChannelIdentification in your request, you must also include NumberOfChannels . For more
        # information, see Transcribing multi-channel audio .

        @[JSON::Field(key: "x-amzn-transcribe-enable-channel-identification")]
        getter enable_channel_identification : Bool?

        # Enables partial result stabilization for your transcription. Partial result stabilization can reduce
        # latency in your output, but may impact accuracy. For more information, see Partial-result
        # stabilization .

        @[JSON::Field(key: "x-amzn-transcribe-enable-partial-results-stabilization")]
        getter enable_partial_results_stabilization : Bool?

        # Enables automatic language identification for your transcription. If you include IdentifyLanguage ,
        # you must include a list of language codes, using LanguageOptions , that you think may be present in
        # your audio stream. You can also include a preferred language using PreferredLanguage . Adding a
        # preferred language can help Amazon Transcribe identify the language faster than if you omit this
        # parameter. If you have multi-channel audio that contains different languages on each channel, and
        # you've enabled channel identification, automatic language identification identifies the dominant
        # language on each audio channel. Note that you must include either LanguageCode or IdentifyLanguage
        # or IdentifyMultipleLanguages in your request. If you include more than one of these parameters, your
        # transcription job fails. Streaming language identification can't be combined with custom language
        # models or redaction.

        @[JSON::Field(key: "x-amzn-transcribe-identify-language")]
        getter identify_language : Bool?

        # Enables automatic multi-language identification in your transcription job request. Use this
        # parameter if your stream contains more than one language. If your stream contains only one language,
        # use IdentifyLanguage instead. If you include IdentifyMultipleLanguages , you must include a list of
        # language codes, using LanguageOptions , that you think may be present in your stream. If you want to
        # apply a custom vocabulary or a custom vocabulary filter to your automatic multiple language
        # identification request, include VocabularyNames or VocabularyFilterNames . Note that you must
        # include one of LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages in your request. If
        # you include more than one of these parameters, your transcription job fails.

        @[JSON::Field(key: "x-amzn-transcribe-identify-multiple-languages")]
        getter identify_multiple_languages : Bool?

        # Specify the language code that represents the language spoken in your audio. If you're unsure of the
        # language spoken in your audio, consider using IdentifyLanguage to enable automatic language
        # identification. For a list of languages supported with Amazon Transcribe streaming, refer to the
        # Supported languages table.

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # Specify the name of the custom language model that you want to use when processing your
        # transcription. Note that language model names are case sensitive. The language of the specified
        # language model must match the language code you specify in your transcription request. If the
        # languages don't match, the custom language model isn't applied. There are no errors or warnings
        # associated with a language mismatch. For more information, see Custom language models .

        @[JSON::Field(key: "x-amzn-transcribe-language-model-name")]
        getter language_model_name : String?

        # Specify two or more language codes that represent the languages you think may be present in your
        # media; including more than five is not recommended. Including language options can improve the
        # accuracy of language identification. If you include LanguageOptions in your request, you must also
        # include IdentifyLanguage or IdentifyMultipleLanguages . For a list of languages supported with
        # Amazon Transcribe streaming, refer to the Supported languages table. You can only include one
        # language dialect per language per stream. For example, you cannot include en-US and en-AU in the
        # same request.

        @[JSON::Field(key: "x-amzn-transcribe-language-options")]
        getter language_options : String?

        # Specify the number of channels in your audio stream. This value must be 2 , as only two channels are
        # supported. If your audio doesn't contain multiple channels, do not include this parameter in your
        # request. If you include NumberOfChannels in your request, you must also include
        # EnableChannelIdentification .

        @[JSON::Field(key: "x-amzn-transcribe-number-of-channels")]
        getter number_of_channels : Int32?

        # Specify the level of stability to use when you enable partial results stabilization (
        # EnablePartialResultsStabilization ). Low stability provides the highest accuracy. High stability
        # transcribes faster, but with slightly lower accuracy. For more information, see Partial-result
        # stabilization .

        @[JSON::Field(key: "x-amzn-transcribe-partial-results-stability")]
        getter partial_results_stability : String?

        # Specify which types of personally identifiable information (PII) you want to redact in your
        # transcript. You can include as many types as you'd like, or you can select ALL . Values must be
        # comma-separated and can include: ADDRESS , BANK_ACCOUNT_NUMBER , BANK_ROUTING , CREDIT_DEBIT_CVV ,
        # CREDIT_DEBIT_EXPIRY , CREDIT_DEBIT_NUMBER , EMAIL , NAME , PHONE , PIN , SSN , or ALL . Note that if
        # you include PiiEntityTypes in your request, you must also include ContentIdentificationType or
        # ContentRedactionType . If you include ContentRedactionType or ContentIdentificationType in your
        # request, but do not include PiiEntityTypes , all PII is redacted or identified.

        @[JSON::Field(key: "x-amzn-transcribe-pii-entity-types")]
        getter pii_entity_types : String?

        # Specify a preferred language from the subset of languages codes you specified in LanguageOptions .
        # You can only use this parameter if you've included IdentifyLanguage and LanguageOptions in your
        # request.

        @[JSON::Field(key: "x-amzn-transcribe-preferred-language")]
        getter preferred_language : String?

        # Specify a name for your transcription session. If you don't include this parameter in your request,
        # Amazon Transcribe generates an ID and returns it in the response.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels
        # the speech from individual speakers in your media file. For more information, see Partitioning
        # speakers (diarization) .

        @[JSON::Field(key: "x-amzn-transcribe-show-speaker-label")]
        getter show_speaker_label : Bool?

        # Specify how you want your vocabulary filter applied to your transcript. To replace words with *** ,
        # choose mask . To delete words, choose remove . To flag words without changing them, choose tag .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-method")]
        getter vocabulary_filter_method : String?

        # Specify the name of the custom vocabulary filter that you want to use when processing your
        # transcription. Note that vocabulary filter names are case sensitive. If the language of the
        # specified custom vocabulary filter doesn't match the language identified in your media, the
        # vocabulary filter is not applied to your transcription. This parameter is not intended for use with
        # the IdentifyLanguage parameter. If you're including IdentifyLanguage in your request and want to use
        # one or more vocabulary filters with your transcription, use the VocabularyFilterNames parameter
        # instead. For more information, see Using vocabulary filtering with unwanted words .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-name")]
        getter vocabulary_filter_name : String?

        # Specify the names of the custom vocabulary filters that you want to use when processing your
        # transcription. Note that vocabulary filter names are case sensitive. If none of the languages of the
        # specified custom vocabulary filters match the language identified in your media, your job fails.
        # This parameter is only intended for use with the IdentifyLanguage parameter. If you're not including
        # IdentifyLanguage in your request and want to use a custom vocabulary filter with your transcription,
        # use the VocabularyFilterName parameter instead. For more information, see Using vocabulary filtering
        # with unwanted words .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-names")]
        getter vocabulary_filter_names : String?

        # Specify the name of the custom vocabulary that you want to use when processing your transcription.
        # Note that vocabulary names are case sensitive. If the language of the specified custom vocabulary
        # doesn't match the language identified in your media, the custom vocabulary is not applied to your
        # transcription. This parameter is not intended for use with the IdentifyLanguage parameter. If you're
        # including IdentifyLanguage in your request and want to use one or more custom vocabularies with your
        # transcription, use the VocabularyNames parameter instead. For more information, see Custom
        # vocabularies .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        # Specify the names of the custom vocabularies that you want to use when processing your
        # transcription. Note that vocabulary names are case sensitive. If none of the languages of the
        # specified custom vocabularies match the language identified in your media, your job fails. This
        # parameter is only intended for use with the IdentifyLanguage parameter. If you're not including
        # IdentifyLanguage in your request and want to use a custom vocabulary with your transcription, use
        # the VocabularyName parameter instead. For more information, see Custom vocabularies .

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-names")]
        getter vocabulary_names : String?

        def initialize(
          @audio_stream : Types::AudioStream,
          @media_encoding : String,
          @media_sample_rate_hertz : Int32,
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_channel_identification : Bool? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @number_of_channels : Int32? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @session_id : String? = nil,
          @show_speaker_label : Bool? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end


      struct StartStreamTranscriptionResponse
        include JSON::Serializable

        # Shows whether content identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-content-identification-type")]
        getter content_identification_type : String?

        # Shows whether content redaction was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-content-redaction-type")]
        getter content_redaction_type : String?

        # Shows whether channel identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-enable-channel-identification")]
        getter enable_channel_identification : Bool?

        # Shows whether partial results stabilization was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-enable-partial-results-stabilization")]
        getter enable_partial_results_stabilization : Bool?

        # Shows whether automatic language identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-identify-language")]
        getter identify_language : Bool?

        # Shows whether automatic multi-language identification was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-identify-multiple-languages")]
        getter identify_multiple_languages : Bool?

        # Provides the language code that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-language-code")]
        getter language_code : String?

        # Provides the name of the custom language model that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-language-model-name")]
        getter language_model_name : String?

        # Provides the language codes that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-language-options")]
        getter language_options : String?

        # Provides the media encoding you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-media-encoding")]
        getter media_encoding : String?

        # Provides the sample rate that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-sample-rate")]
        getter media_sample_rate_hertz : Int32?

        # Provides the number of channels that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-number-of-channels")]
        getter number_of_channels : Int32?

        # Provides the stabilization level used for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-partial-results-stability")]
        getter partial_results_stability : String?

        # Lists the PII entity types you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-pii-entity-types")]
        getter pii_entity_types : String?

        # Provides the preferred language that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-preferred-language")]
        getter preferred_language : String?

        # Provides the identifier for your streaming request.

        @[JSON::Field(key: "x-amzn-request-id")]
        getter request_id : String?

        # Provides the identifier for your transcription session.

        @[JSON::Field(key: "x-amzn-transcribe-session-id")]
        getter session_id : String?

        # Shows whether speaker partitioning was enabled for your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-show-speaker-label")]
        getter show_speaker_label : Bool?

        # Provides detailed information about your streaming session.

        @[JSON::Field(key: "TranscriptResultStream")]
        getter transcript_result_stream : Types::TranscriptResultStream?

        # Provides the vocabulary filtering method used in your transcription.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-method")]
        getter vocabulary_filter_method : String?

        # Provides the name of the custom vocabulary filter that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-name")]
        getter vocabulary_filter_name : String?

        # Provides the names of the custom vocabulary filters that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-filter-names")]
        getter vocabulary_filter_names : String?

        # Provides the name of the custom vocabulary that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-name")]
        getter vocabulary_name : String?

        # Provides the names of the custom vocabularies that you specified in your request.

        @[JSON::Field(key: "x-amzn-transcribe-vocabulary-names")]
        getter vocabulary_names : String?

        def initialize(
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_channel_identification : Bool? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @media_encoding : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @number_of_channels : Int32? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @request_id : String? = nil,
          @session_id : String? = nil,
          @show_speaker_label : Bool? = nil,
          @transcript_result_stream : Types::TranscriptResultStream? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end

      # Contains the timestamp range (start time through end time) of a matched category.

      struct TimestampRange
        include JSON::Serializable

        # The time, in milliseconds, from the beginning of the audio stream to the start of the category
        # match.

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int64?

        # The time, in milliseconds, from the beginning of the audio stream to the end of the category match.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int64?

        def initialize(
          @begin_offset_millis : Int64? = nil,
          @end_offset_millis : Int64? = nil
        )
        end
      end

      # The Transcript associated with a . Transcript contains Results , which contains a set of
      # transcription results from one or more audio segments, along with additional information per your
      # request parameters.

      struct Transcript
        include JSON::Serializable

        # Contains a set of transcription results from one or more audio segments, along with additional
        # information per your request parameters. This can include information relating to alternative
        # transcriptions, channel identification, partial result stabilization, language identification, and
        # other transcription-related data.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::Result)?

        def initialize(
          @results : Array(Types::Result)? = nil
        )
        end
      end

      # The TranscriptEvent associated with a TranscriptResultStream . Contains a set of transcription
      # results from one or more audio segments, along with additional information per your request
      # parameters.

      struct TranscriptEvent
        include JSON::Serializable

        # Contains Results , which contains a set of transcription results from one or more audio segments,
        # along with additional information per your request parameters. This can include information relating
        # to alternative transcriptions, channel identification, partial result stabilization, language
        # identification, and other transcription-related data.

        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::Transcript?

        def initialize(
          @transcript : Types::Transcript? = nil
        )
        end
      end

      # Contains detailed information about your streaming session.

      struct TranscriptResultStream
        include JSON::Serializable

        # A client error occurred when the stream was created. Check the parameters of the request and try
        # your request again.

        @[JSON::Field(key: "BadRequestException")]
        getter bad_request_exception : Types::BadRequestException?

        # A new stream started with the same session ID. The current stream has been terminated.

        @[JSON::Field(key: "ConflictException")]
        getter conflict_exception : Types::ConflictException?

        # A problem occurred while processing the audio. Amazon Transcribe terminated processing.

        @[JSON::Field(key: "InternalFailureException")]
        getter internal_failure_exception : Types::InternalFailureException?

        # Your client has exceeded one of the Amazon Transcribe limits. This is typically the audio length
        # limit. Break your audio stream into smaller chunks and try your request again.

        @[JSON::Field(key: "LimitExceededException")]
        getter limit_exceeded_exception : Types::LimitExceededException?

        # The service is currently unavailable. Try your request later.

        @[JSON::Field(key: "ServiceUnavailableException")]
        getter service_unavailable_exception : Types::ServiceUnavailableException?

        # Contains Transcript , which contains Results . The object contains a set of transcription results
        # from one or more audio segments, along with additional information per your request parameters.

        @[JSON::Field(key: "TranscriptEvent")]
        getter transcript_event : Types::TranscriptEvent?

        def initialize(
          @bad_request_exception : Types::BadRequestException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @internal_failure_exception : Types::InternalFailureException? = nil,
          @limit_exceeded_exception : Types::LimitExceededException? = nil,
          @service_unavailable_exception : Types::ServiceUnavailableException? = nil,
          @transcript_event : Types::TranscriptEvent? = nil
        )
        end
      end

      # Contains set of transcription results from one or more audio segments, along with additional
      # information about the parameters included in your request. For example, channel definitions, partial
      # result stabilization, sentiment, and issue detection.

      struct UtteranceEvent
        include JSON::Serializable

        # The time, in milliseconds, from the beginning of the audio stream to the start of the UtteranceEvent
        # .

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int64?

        # The time, in milliseconds, from the beginning of the audio stream to the start of the UtteranceEvent
        # .

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int64?

        # Contains entities identified as personally identifiable information (PII) in your transcription
        # output.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::CallAnalyticsEntity)?

        # Indicates whether the segment in the UtteranceEvent is complete ( FALSE ) or partial ( TRUE ).

        @[JSON::Field(key: "IsPartial")]
        getter is_partial : Bool?

        # Provides the issue that was detected in the specified segment.

        @[JSON::Field(key: "IssuesDetected")]
        getter issues_detected : Array(Types::IssueDetected)?

        # Contains words, phrases, or punctuation marks that are associated with the specified UtteranceEvent
        # .

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CallAnalyticsItem)?

        # The language code that represents the language spoken in your audio stream.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The language code of the dominant language identified in your stream.

        @[JSON::Field(key: "LanguageIdentification")]
        getter language_identification : Array(Types::CallAnalyticsLanguageWithScore)?

        # Provides the role of the speaker for each audio channel, either CUSTOMER or AGENT .

        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        # Provides the sentiment that was detected in the specified segment.

        @[JSON::Field(key: "Sentiment")]
        getter sentiment : String?

        # Contains transcribed text.

        @[JSON::Field(key: "Transcript")]
        getter transcript : String?

        # The unique identifier that is associated with the specified UtteranceEvent .

        @[JSON::Field(key: "UtteranceId")]
        getter utterance_id : String?

        def initialize(
          @begin_offset_millis : Int64? = nil,
          @end_offset_millis : Int64? = nil,
          @entities : Array(Types::CallAnalyticsEntity)? = nil,
          @is_partial : Bool? = nil,
          @issues_detected : Array(Types::IssueDetected)? = nil,
          @items : Array(Types::CallAnalyticsItem)? = nil,
          @language_code : String? = nil,
          @language_identification : Array(Types::CallAnalyticsLanguageWithScore)? = nil,
          @participant_role : String? = nil,
          @sentiment : String? = nil,
          @transcript : String? = nil,
          @utterance_id : String? = nil
        )
        end
      end
    end
  end
end
