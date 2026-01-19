require "json"
require "time"

module AwsSdk
  module Transcribe
    module Types

      # A time range, in milliseconds, between two points in your media file. You can use StartTime and
      # EndTime to search a custom segment. For example, setting StartTime to 10000 and EndTime to 50000
      # only searches for your specified criteria in the audio contained between the 10,000 millisecond mark
      # and the 50,000 millisecond mark of your media file. You must use StartTime and EndTime as a set;
      # that is, if you include one, you must include both. You can use also First to search from the start
      # of the audio until the time that you specify, or Last to search from the time that you specify until
      # the end of the audio. For example, setting First to 50000 only searches for your specified criteria
      # in the audio contained between the start of the media file to the 50,000 millisecond mark. You can
      # use First and Last independently of each other. If you prefer to use percentage instead of
      # milliseconds, see .
      struct AbsoluteTimeRange
        include JSON::Serializable

        # The time, in milliseconds, when Amazon Transcribe stops searching for the specified criteria in your
        # audio. If you include EndTime in your request, you must also include StartTime .
        @[JSON::Field(key: "EndTime")]
        getter end_time : Int64?

        # The time, in milliseconds, from the start of your media file until the specified value. Amazon
        # Transcribe searches for your specified criteria in this time segment.
        @[JSON::Field(key: "First")]
        getter first : Int64?

        # The time, in milliseconds, from the specified value until the end of your media file. Amazon
        # Transcribe searches for your specified criteria in this time segment.
        @[JSON::Field(key: "Last")]
        getter last : Int64?

        # The time, in milliseconds, when Amazon Transcribe starts searching for the specified criteria in
        # your audio. If you include StartTime in your request, you must also include EndTime .
        @[JSON::Field(key: "StartTime")]
        getter start_time : Int64?

        def initialize(
          @end_time : Int64? = nil,
          @first : Int64? = nil,
          @last : Int64? = nil,
          @start_time : Int64? = nil
        )
        end
      end

      # Your request didn't pass one or more validation tests. This can occur when the entity you're trying
      # to delete doesn't exist or if it's in a non-terminal state (such as IN PROGRESS ). See the exception
      # message field for more information.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides detailed information about a Call Analytics job. To view the job's status, refer to
      # CallAnalyticsJobStatus . If the status is COMPLETED , the job is finished. You can find your
      # completed transcript at the URI specified in TranscriptFileUri . If the status is FAILED ,
      # FailureReason provides details on why your transcription job failed. If you enabled personally
      # identifiable information (PII) redaction, the redacted transcript appears at the location specified
      # in RedactedTranscriptFileUri . If you chose to redact the audio in your media file, you can find
      # your redacted media file at the location specified in the RedactedMediaFileUri field of your
      # response.
      struct CallAnalyticsJob
        include JSON::Serializable

        # Provides detailed information about a call analytics job, including information about skipped
        # analytics features.
        @[JSON::Field(key: "CallAnalyticsJobDetails")]
        getter call_analytics_job_details : Types::CallAnalyticsJobDetails?

        # The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "CallAnalyticsJobName")]
        getter call_analytics_job_name : String?

        # Provides the status of the specified Call Analytics job. If the status is COMPLETED , the job is
        # finished and you can find the results at the location specified in TranscriptFileUri (or
        # RedactedTranscriptFileUri , if you requested transcript redaction). If the status is FAILED ,
        # FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "CallAnalyticsJobStatus")]
        getter call_analytics_job_status : String?

        # Indicates which speaker is on which channel.
        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::ChannelDefinition)?

        # The date and time the specified Call Analytics job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # The date and time the specified Call Analytics job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) you included in your request.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # If CallAnalyticsJobStatus is FAILED , FailureReason contains information about why the Call
        # Analytics job request failed. The FailureReason field contains one of the following values:
        # Unsupported media format . The media format specified in MediaFormat isn't valid. Refer to refer to
        # the MediaFormat parameter for a list of supported formats. The media format provided does not match
        # the detected media format . The media format specified in MediaFormat doesn't match the format of
        # the input file. Check the media format of your media file and correct the specified value. Invalid
        # sample rate for audio file . The sample rate specified in MediaSampleRateHertz isn't valid. The
        # sample rate must be between 8,000 and 48,000 hertz. The sample rate provided does not match the
        # detected sample rate . The sample rate specified in MediaSampleRateHertz doesn't match the sample
        # rate detected in your input media file. Check the sample rate of your media file and correct the
        # specified value. Invalid file size: file size too large . The size of your media file is larger than
        # what Amazon Transcribe can process. For more information, refer to Service quotas . Invalid number
        # of channels: number of channels too large . Your audio contains more channels than Amazon Transcribe
        # is able to process. For more information, refer to Service quotas .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The confidence score associated with the language identified in your media file. Confidence scores
        # are values between 0 and 1; a larger value indicates a higher probability that the identified
        # language correctly matches the language spoken in your media.
        @[JSON::Field(key: "IdentifiedLanguageScore")]
        getter identified_language_score : Float64?

        # The language code used to create your Call Analytics job. For a list of supported languages and
        # their associated language codes, refer to the Supported languages table. If you do not know the
        # language spoken in your media file, you can omit this field and let Amazon Transcribe automatically
        # identify the language of your media. To improve the accuracy of language identification, you can
        # include several language codes and Amazon Transcribe chooses the closest match for your
        # transcription.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # Provides the Amazon S3 location of the media file you used in your Call Analytics request.
        @[JSON::Field(key: "Media")]
        getter media : Types::Media?

        # The format of the input media file.
        @[JSON::Field(key: "MediaFormat")]
        getter media_format : String?

        # The sample rate, in hertz, of the audio track in your input media file.
        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # Provides information on any additional settings that were included in your request. Additional
        # settings include content redaction and language identification settings.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::CallAnalyticsJobSettings?

        # The date and time the specified Call Analytics job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The tags, each in the form of a key:value pair, assigned to the specified call analytics job.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::Transcript?

        def initialize(
          @call_analytics_job_details : Types::CallAnalyticsJobDetails? = nil,
          @call_analytics_job_name : String? = nil,
          @call_analytics_job_status : String? = nil,
          @channel_definitions : Array(Types::ChannelDefinition)? = nil,
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @data_access_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @identified_language_score : Float64? = nil,
          @language_code : String? = nil,
          @media : Types::Media? = nil,
          @media_format : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @settings : Types::CallAnalyticsJobSettings? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transcript : Types::Transcript? = nil
        )
        end
      end

      # Contains details about a call analytics job, including information about skipped analytics features.
      struct CallAnalyticsJobDetails
        include JSON::Serializable

        # Contains information about any skipped analytics features during the analysis of a call analytics
        # job. This array lists all the analytics features that were skipped, along with their corresponding
        # reason code and message.
        @[JSON::Field(key: "Skipped")]
        getter skipped : Array(Types::CallAnalyticsSkippedFeature)?

        def initialize(
          @skipped : Array(Types::CallAnalyticsSkippedFeature)? = nil
        )
        end
      end

      # Provides additional optional settings for your request, including content redaction, automatic
      # language identification; allows you to apply custom language models, custom vocabulary filters, and
      # custom vocabularies.
      struct CallAnalyticsJobSettings
        include JSON::Serializable

        @[JSON::Field(key: "ContentRedaction")]
        getter content_redaction : Types::ContentRedaction?

        # If using automatic language identification in your request and you want to apply a custom language
        # model, a custom vocabulary, or a custom vocabulary filter, include LanguageIdSettings with the
        # relevant sub-parameters ( VocabularyName , LanguageModelName , and VocabularyFilterName ).
        # LanguageIdSettings supports two to five language codes. Each language code you include can have an
        # associated custom language model, custom vocabulary, and custom vocabulary filter. The language
        # codes that you specify must match the languages of the associated custom language models, custom
        # vocabularies, and custom vocabulary filters. It's recommended that you include LanguageOptions when
        # using LanguageIdSettings to ensure that the correct language dialect is identified. For example, if
        # you specify a custom vocabulary that is in en-US but Amazon Transcribe determines that the language
        # spoken in your media is en-AU , your custom vocabulary is not applied to your transcription. If you
        # include LanguageOptions and include en-US as the only English language dialect, your custom
        # vocabulary is applied to your transcription. If you want to include a custom language model, custom
        # vocabulary, or custom vocabulary filter with your request but do not want to use automatic language
        # identification, use instead the parameter with the LanguageModelName , VocabularyName , or
        # VocabularyFilterName sub-parameters. For a list of languages supported with Call Analytics, refer to
        # Supported languages and language-specific features .
        @[JSON::Field(key: "LanguageIdSettings")]
        getter language_id_settings : Hash(String, Types::LanguageIdSettings)?

        # The name of the custom language model you want to use when processing your Call Analytics job. Note
        # that custom language model names are case sensitive. The language of the specified custom language
        # model must match the language code that you specify in your transcription request. If the languages
        # do not match, the custom language model isn't applied. There are no errors or warnings associated
        # with a language mismatch.
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        # You can specify two or more language codes that represent the languages you think may be present in
        # your media. Including more than five is not recommended. If you're unsure what languages are
        # present, do not include this parameter. Including language options can improve the accuracy of
        # language identification. For a list of languages supported with Call Analytics, refer to the
        # Supported languages table. To transcribe speech in Modern Standard Arabic ( ar-SA ) in Amazon Web
        # Services GovCloud (US) (US-West, us-gov-west-1), Amazon Web Services GovCloud (US) (US-East,
        # us-gov-east-1), Canada (Calgary) ca-west-1 and Africa (Cape Town) af-south-1, your media file must
        # be encoded at a sample rate of 16,000 Hz or higher.
        @[JSON::Field(key: "LanguageOptions")]
        getter language_options : Array(String)?

        # Contains GenerateAbstractiveSummary , which is a required parameter if you want to enable Generative
        # call summarization in your Call Analytics request.
        @[JSON::Field(key: "Summarization")]
        getter summarization : Types::Summarization?

        # Specify how you want your custom vocabulary filter applied to your transcript. To replace words with
        # *** , choose mask . To delete words, choose remove . To flag words without changing them, choose tag
        # .
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # The name of the custom vocabulary filter you want to include in your Call Analytics transcription
        # request. Custom vocabulary filter names are case sensitive. Note that if you include
        # VocabularyFilterName in your request, you must also include VocabularyFilterMethod .
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The name of the custom vocabulary you want to include in your Call Analytics transcription request.
        # Custom vocabulary names are case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @content_redaction : Types::ContentRedaction? = nil,
          @language_id_settings : Hash(String, Types::LanguageIdSettings)? = nil,
          @language_model_name : String? = nil,
          @language_options : Array(String)? = nil,
          @summarization : Types::Summarization? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # Provides detailed information about a specific Call Analytics job.
      struct CallAnalyticsJobSummary
        include JSON::Serializable

        # Provides detailed information about a call analytics job, including information about skipped
        # analytics features.
        @[JSON::Field(key: "CallAnalyticsJobDetails")]
        getter call_analytics_job_details : Types::CallAnalyticsJobDetails?

        # The name of the Call Analytics job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "CallAnalyticsJobName")]
        getter call_analytics_job_name : String?

        # Provides the status of your Call Analytics job. If the status is COMPLETED , the job is finished and
        # you can find the results at the location specified in TranscriptFileUri (or
        # RedactedTranscriptFileUri , if you requested transcript redaction). If the status is FAILED ,
        # FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "CallAnalyticsJobStatus")]
        getter call_analytics_job_status : String?

        # The date and time the specified Call Analytics job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # The date and time the specified Call Analytics job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If CallAnalyticsJobStatus is FAILED , FailureReason contains information about why the Call
        # Analytics job failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code used to create your Call Analytics transcription.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time your Call Analytics job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @call_analytics_job_details : Types::CallAnalyticsJobDetails? = nil,
          @call_analytics_job_name : String? = nil,
          @call_analytics_job_status : String? = nil,
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Represents a skipped analytics feature during the analysis of a call analytics job. The Feature
      # field indicates the type of analytics feature that was skipped. The Message field contains
      # additional information or a message explaining why the analytics feature was skipped. The ReasonCode
      # field provides a code indicating the reason why the analytics feature was skipped.
      struct CallAnalyticsSkippedFeature
        include JSON::Serializable

        # Indicates the type of analytics feature that was skipped during the analysis of a call analytics
        # job.
        @[JSON::Field(key: "Feature")]
        getter feature : String?

        # Contains additional information or a message explaining why a specific analytics feature was skipped
        # during the analysis of a call analytics job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Provides a code indicating the reason why a specific analytics feature was skipped during the
        # analysis of a call analytics job.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        def initialize(
          @feature : String? = nil,
          @message : String? = nil,
          @reason_code : String? = nil
        )
        end
      end

      # Provides you with the properties of the Call Analytics category you specified in your request. This
      # includes the list of rules that define the specified category.
      struct CategoryProperties
        include JSON::Serializable

        # The name of the Call Analytics category. Category names are case sensitive and must be unique within
        # an Amazon Web Services account.
        @[JSON::Field(key: "CategoryName")]
        getter category_name : String?

        # The date and time the specified Call Analytics category was created. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The input type associated with the specified category. POST_CALL refers to a category that is
        # applied to batch transcriptions; REAL_TIME refers to a category that is applied to streaming
        # transcriptions.
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # The date and time the specified Call Analytics category was last updated. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-05T12:45:32.691000-07:00 represents
        # 12:45 PM UTC-7 on May 5, 2022.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The rules used to define a Call Analytics category. Each category can have between 1 and 20 rules.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # The tags, each in the form of a key:value pair, assigned to the specified call analytics category.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @category_name : String? = nil,
          @create_time : Time? = nil,
          @input_type : String? = nil,
          @last_update_time : Time? = nil,
          @rules : Array(Types::Rule)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Makes it possible to specify which speaker is on which channel. For example, if your agent is the
      # first participant to speak, you would set ChannelId to 0 (to indicate the first channel) and
      # ParticipantRole to AGENT (to indicate that it's the agent speaking).
      struct ChannelDefinition
        include JSON::Serializable

        # Specify the audio channel you want to define.
        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32?

        # Specify the speaker you want to define. Omitting this parameter is equivalent to specifying both
        # participants.
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        def initialize(
          @channel_id : Int32? = nil,
          @participant_role : String? = nil
        )
        end
      end

      # The output configuration for clinical note generation.
      struct ClinicalNoteGenerationSettings
        include JSON::Serializable

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
          @note_template : String? = nil
        )
        end
      end

      # A resource already exists with this name. Resource names must be unique within an Amazon Web
      # Services account.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Makes it possible to redact or flag specified personally identifiable information (PII) in your
      # transcript. If you use ContentRedaction , you must also include the sub-parameters: RedactionOutput
      # and RedactionType . You can optionally include PiiEntityTypes to choose which types of PII you want
      # to redact.
      struct ContentRedaction
        include JSON::Serializable

        # Specify if you want only a redacted transcript, or if you want a redacted and an unredacted
        # transcript. When you choose redacted Amazon Transcribe creates only a redacted transcript. When you
        # choose redacted_and_unredacted Amazon Transcribe creates a redacted and an unredacted transcript (as
        # two separate files).
        @[JSON::Field(key: "RedactionOutput")]
        getter redaction_output : String

        # Specify the category of information you want to redact; PII (personally identifiable information) is
        # the only valid value. You can use PiiEntityTypes to choose which types of PII you want to redact. If
        # you do not include PiiEntityTypes in your request, all PII is redacted.
        @[JSON::Field(key: "RedactionType")]
        getter redaction_type : String

        # Specify which types of personally identifiable information (PII) you want to redact in your
        # transcript. You can include as many types as you'd like, or you can select ALL . If you do not
        # include PiiEntityTypes in your request, all PII is redacted.
        @[JSON::Field(key: "PiiEntityTypes")]
        getter pii_entity_types : Array(String)?

        def initialize(
          @redaction_output : String,
          @redaction_type : String,
          @pii_entity_types : Array(String)? = nil
        )
        end
      end

      struct CreateCallAnalyticsCategoryRequest
        include JSON::Serializable

        # A unique name, chosen by you, for your Call Analytics category. It's helpful to use a detailed
        # naming system that will make sense to you in the future. For example, it's better to use
        # sentiment-positive-last30seconds for a category over a generic name like test-category . Category
        # names are case sensitive.
        @[JSON::Field(key: "CategoryName")]
        getter category_name : String

        # Rules define a Call Analytics category. When creating a new category, you must create between 1 and
        # 20 rules for that category. For each rule, you specify a filter you want applied to the attributes
        # of a call. For example, you can choose a sentiment filter that detects if a customer's sentiment was
        # positive during the last 30 seconds of the call.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # Choose whether you want to create a real-time or a post-call category for your Call Analytics
        # transcription. Specifying POST_CALL assigns your category to post-call transcriptions; categories
        # with this input type cannot be applied to streaming (real-time) transcriptions. Specifying REAL_TIME
        # assigns your category to streaming transcriptions; categories with this input type cannot be applied
        # to post-call transcriptions. If you do not include InputType , your category is created as a
        # post-call category by default.
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new call analytics category
        # at the time you start this new job. To learn more about using tags with Amazon Transcribe, refer to
        # Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @category_name : String,
          @rules : Array(Types::Rule),
          @input_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCallAnalyticsCategoryResponse
        include JSON::Serializable

        # Provides you with the properties of your new category, including its associated rules.
        @[JSON::Field(key: "CategoryProperties")]
        getter category_properties : Types::CategoryProperties?

        def initialize(
          @category_properties : Types::CategoryProperties? = nil
        )
        end
      end

      struct CreateLanguageModelRequest
        include JSON::Serializable

        # The Amazon Transcribe standard language model, or base model, used to create your custom language
        # model. Amazon Transcribe offers two options for base models: Wideband and Narrowband. If the audio
        # you want to transcribe has a sample rate of 16,000 Hz or greater, choose WideBand . To transcribe
        # audio with a sample rate less than 16,000 Hz, choose NarrowBand .
        @[JSON::Field(key: "BaseModelName")]
        getter base_model_name : String

        # Contains the Amazon S3 location of the training data you want to use to create a new custom language
        # model, and permissions to access this location. When using InputDataConfig , you must include these
        # sub-parameters: S3Uri , which is the Amazon S3 location of your training data, and DataAccessRoleArn
        # , which is the Amazon Resource Name (ARN) of the role that has permission to access your specified
        # Amazon S3 location. You can optionally include TuningDataS3Uri , which is the Amazon S3 location of
        # your tuning data. If you specify different Amazon S3 locations for training and tuning data, the ARN
        # you use must have permissions to access both locations.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language code that represents the language of your model. Each custom language model must
        # contain terms in only one language, and the language you select for your custom language model must
        # match the language of your training and tuning data. For a list of supported languages and their
        # associated language codes, refer to the Supported languages table. Note that US English ( en-US ) is
        # the only language supported with Amazon Transcribe Medical. A custom language model can only be used
        # to transcribe files in the same language as the model. For example, if you create a custom language
        # model using US English ( en-US ), you can only apply this model to files that contain English audio.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A unique name, chosen by you, for your custom language model. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new
        # custom language model with the same name as an existing custom language model, you get a
        # ConflictException error.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        # Adds one or more custom tags, each in the form of a key:value pair, to a new custom language model
        # at the time you create this new model. To learn more about using tags with Amazon Transcribe, refer
        # to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @base_model_name : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @model_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateLanguageModelResponse
        include JSON::Serializable

        # The Amazon Transcribe standard language model, or base model, you specified when creating your
        # custom language model.
        @[JSON::Field(key: "BaseModelName")]
        getter base_model_name : String?

        # Lists your data access role ARN (Amazon Resource Name) and the Amazon S3 locations you provided for
        # your training ( S3Uri ) and tuning ( TuningDataS3Uri ) data.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The language code you selected for your custom language model.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name of your custom language model.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The status of your custom language model. When the status displays as COMPLETED , your model is
        # ready to use.
        @[JSON::Field(key: "ModelStatus")]
        getter model_status : String?

        def initialize(
          @base_model_name : String? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @language_code : String? = nil,
          @model_name : String? = nil,
          @model_status : String? = nil
        )
        end
      end

      struct CreateMedicalVocabularyRequest
        include JSON::Serializable

        # The language code that represents the language of the entries in your custom vocabulary. US English
        # ( en-US ) is the only language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The Amazon S3 location (URI) of the text file that contains your custom medical vocabulary. The URI
        # must be in the same Amazon Web Services Region as the resource you're calling. Here's an example URI
        # path: s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt
        @[JSON::Field(key: "VocabularyFileUri")]
        getter vocabulary_file_uri : String

        # A unique name, chosen by you, for your new custom medical vocabulary. This name is case sensitive,
        # cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to
        # create a new custom medical vocabulary with the same name as an existing custom medical vocabulary,
        # you get a ConflictException error.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        # Adds one or more custom tags, each in the form of a key:value pair, to a new custom medical
        # vocabulary at the time you create this new custom vocabulary. To learn more about using tags with
        # Amazon Transcribe, refer to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @language_code : String,
          @vocabulary_file_uri : String,
          @vocabulary_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMedicalVocabularyResponse
        include JSON::Serializable

        # If VocabularyState is FAILED , FailureReason contains information about why the medical
        # transcription job request failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code you selected for your custom medical vocabulary. US English ( en-US ) is the only
        # language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time you created your custom medical vocabulary. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name you chose for your custom medical vocabulary.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom medical vocabulary. If the state is READY , you can use the
        # custom vocabulary in a StartMedicalTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      struct CreateVocabularyFilterRequest
        include JSON::Serializable

        # The language code that represents the language of the entries in your vocabulary filter. Each custom
        # vocabulary filter must contain terms in only one language. A custom vocabulary filter can only be
        # used to transcribe files in the same language as the filter. For example, if you create a custom
        # vocabulary filter using US English ( en-US ), you can only apply this filter to files that contain
        # English audio. For a list of supported languages and their associated language codes, refer to the
        # Supported languages table.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A unique name, chosen by you, for your new custom vocabulary filter. This name is case sensitive,
        # cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to
        # create a new custom vocabulary filter with the same name as an existing custom vocabulary filter,
        # you get a ConflictException error.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files (in this case, your custom vocabulary filter). If the role that you
        # specify doesn’t have the appropriate permissions to access the specified Amazon S3 location, your
        # request fails. IAM role ARNs have the format arn:partition:iam::account:role/role-name-with-path .
        # For example: arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary
        # filter at the time you create this new vocabulary filter. To learn more about using tags with Amazon
        # Transcribe, refer to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI
        # must be located in the same Amazon Web Services Region as the resource you're calling. Here's an
        # example URI path: s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt Note that if you include
        # VocabularyFilterFileUri in your request, you cannot use Words ; you must choose one or the other.
        @[JSON::Field(key: "VocabularyFilterFileUri")]
        getter vocabulary_filter_file_uri : String?

        # Use this parameter if you want to create your custom vocabulary filter by including all desired
        # terms, as comma-separated values, within your request. The other option for creating your vocabulary
        # filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify
        # the location of your file using the VocabularyFilterFileUri parameter. Note that if you include
        # Words in your request, you cannot use VocabularyFilterFileUri ; you must choose one or the other.
        # Each language has a character set that contains all allowed characters for that specific language.
        # If you use unsupported characters, your custom vocabulary filter request fails. Refer to Character
        # Sets for Custom Vocabularies to get the character set for your language.
        @[JSON::Field(key: "Words")]
        getter words : Array(String)?

        def initialize(
          @language_code : String,
          @vocabulary_filter_name : String,
          @data_access_role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vocabulary_filter_file_uri : String? = nil,
          @words : Array(String)? = nil
        )
        end
      end

      struct CreateVocabularyFilterResponse
        include JSON::Serializable

        # The language code you selected for your custom vocabulary filter.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time you created your custom vocabulary filter. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name you chose for your custom vocabulary filter.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_filter_name : String? = nil
        )
        end
      end

      struct CreateVocabularyRequest
        include JSON::Serializable

        # The language code that represents the language of the entries in your custom vocabulary. Each custom
        # vocabulary must contain terms in only one language. A custom vocabulary can only be used to
        # transcribe files in the same language as the custom vocabulary. For example, if you create a custom
        # vocabulary using US English ( en-US ), you can only apply this custom vocabulary to files that
        # contain English audio. For a list of supported languages and their associated language codes, refer
        # to the Supported languages table.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A unique name, chosen by you, for your new custom vocabulary. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new
        # custom vocabulary with the same name as an existing custom vocabulary, you get a ConflictException
        # error.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files (in this case, your custom vocabulary). If the role that you specify
        # doesn’t have the appropriate permissions to access the specified Amazon S3 location, your request
        # fails. IAM role ARNs have the format arn:partition:iam::account:role/role-name-with-path . For
        # example: arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Use this parameter if you want to create your custom vocabulary by including all desired terms, as
        # comma-separated values, within your request. The other option for creating your custom vocabulary is
        # to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the
        # location of your file using the VocabularyFileUri parameter. Note that if you include Phrases in
        # your request, you cannot use VocabularyFileUri ; you must choose one or the other. Each language has
        # a character set that contains all allowed characters for that specific language. If you use
        # unsupported characters, your custom vocabulary filter request fails. Refer to Character Sets for
        # Custom Vocabularies to get the character set for your language.
        @[JSON::Field(key: "Phrases")]
        getter phrases : Array(String)?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new custom vocabulary at
        # the time you create this new custom vocabulary. To learn more about using tags with Amazon
        # Transcribe, refer to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be
        # located in the same Amazon Web Services Region as the resource you're calling. Here's an example URI
        # path: s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt Note that if you include VocabularyFileUri in your
        # request, you cannot use the Phrases flag; you must choose one or the other.
        @[JSON::Field(key: "VocabularyFileUri")]
        getter vocabulary_file_uri : String?

        def initialize(
          @language_code : String,
          @vocabulary_name : String,
          @data_access_role_arn : String? = nil,
          @phrases : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vocabulary_file_uri : String? = nil
        )
        end
      end

      struct CreateVocabularyResponse
        include JSON::Serializable

        # If VocabularyState is FAILED , FailureReason contains information about why the custom vocabulary
        # request failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code you selected for your custom vocabulary.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time you created your custom vocabulary. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name you chose for your custom vocabulary.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom vocabulary. If the state is READY , you can use the custom
        # vocabulary in a StartTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      struct DeleteCallAnalyticsCategoryRequest
        include JSON::Serializable

        # The name of the Call Analytics category you want to delete. Category names are case sensitive.
        @[JSON::Field(key: "CategoryName")]
        getter category_name : String

        def initialize(
          @category_name : String
        )
        end
      end

      struct DeleteCallAnalyticsCategoryResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteCallAnalyticsJobRequest
        include JSON::Serializable

        # The name of the Call Analytics job you want to delete. Job names are case sensitive.
        @[JSON::Field(key: "CallAnalyticsJobName")]
        getter call_analytics_job_name : String

        def initialize(
          @call_analytics_job_name : String
        )
        end
      end

      struct DeleteCallAnalyticsJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteLanguageModelRequest
        include JSON::Serializable

        # The name of the custom language model you want to delete. Model names are case sensitive.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DeleteMedicalScribeJobRequest
        include JSON::Serializable

        # The name of the Medical Scribe job you want to delete. Job names are case sensitive.
        @[JSON::Field(key: "MedicalScribeJobName")]
        getter medical_scribe_job_name : String

        def initialize(
          @medical_scribe_job_name : String
        )
        end
      end

      struct DeleteMedicalTranscriptionJobRequest
        include JSON::Serializable

        # The name of the medical transcription job you want to delete. Job names are case sensitive.
        @[JSON::Field(key: "MedicalTranscriptionJobName")]
        getter medical_transcription_job_name : String

        def initialize(
          @medical_transcription_job_name : String
        )
        end
      end

      struct DeleteMedicalVocabularyRequest
        include JSON::Serializable

        # The name of the custom medical vocabulary you want to delete. Custom medical vocabulary names are
        # case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        def initialize(
          @vocabulary_name : String
        )
        end
      end

      struct DeleteTranscriptionJobRequest
        include JSON::Serializable

        # The name of the transcription job you want to delete. Job names are case sensitive.
        @[JSON::Field(key: "TranscriptionJobName")]
        getter transcription_job_name : String

        def initialize(
          @transcription_job_name : String
        )
        end
      end

      struct DeleteVocabularyFilterRequest
        include JSON::Serializable

        # The name of the custom vocabulary filter you want to delete. Custom vocabulary filter names are case
        # sensitive.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String

        def initialize(
          @vocabulary_filter_name : String
        )
        end
      end

      struct DeleteVocabularyRequest
        include JSON::Serializable

        # The name of the custom vocabulary you want to delete. Custom vocabulary names are case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        def initialize(
          @vocabulary_name : String
        )
        end
      end

      struct DescribeLanguageModelRequest
        include JSON::Serializable

        # The name of the custom language model you want information about. Model names are case sensitive.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String

        def initialize(
          @model_name : String
        )
        end
      end

      struct DescribeLanguageModelResponse
        include JSON::Serializable

        # Provides information about the specified custom language model. This parameter also shows if the
        # base language model you used to create your custom language model has been updated. If Amazon
        # Transcribe has updated the base model, you can create a new custom language model using the updated
        # base model. If you tried to create a new custom language model and the request wasn't successful,
        # you can use this DescribeLanguageModel to help identify the reason for this failure.
        @[JSON::Field(key: "LanguageModel")]
        getter language_model : Types::LanguageModel?

        def initialize(
          @language_model : Types::LanguageModel? = nil
        )
        end
      end

      struct GetCallAnalyticsCategoryRequest
        include JSON::Serializable

        # The name of the Call Analytics category you want information about. Category names are case
        # sensitive.
        @[JSON::Field(key: "CategoryName")]
        getter category_name : String

        def initialize(
          @category_name : String
        )
        end
      end

      struct GetCallAnalyticsCategoryResponse
        include JSON::Serializable

        # Provides you with the properties of the Call Analytics category you specified in your
        # GetCallAnalyticsCategory request.
        @[JSON::Field(key: "CategoryProperties")]
        getter category_properties : Types::CategoryProperties?

        def initialize(
          @category_properties : Types::CategoryProperties? = nil
        )
        end
      end

      struct GetCallAnalyticsJobRequest
        include JSON::Serializable

        # The name of the Call Analytics job you want information about. Job names are case sensitive.
        @[JSON::Field(key: "CallAnalyticsJobName")]
        getter call_analytics_job_name : String

        def initialize(
          @call_analytics_job_name : String
        )
        end
      end

      struct GetCallAnalyticsJobResponse
        include JSON::Serializable

        # Provides detailed information about the specified Call Analytics job, including job status and, if
        # applicable, failure reason.
        @[JSON::Field(key: "CallAnalyticsJob")]
        getter call_analytics_job : Types::CallAnalyticsJob?

        def initialize(
          @call_analytics_job : Types::CallAnalyticsJob? = nil
        )
        end
      end

      struct GetMedicalScribeJobRequest
        include JSON::Serializable

        # The name of the Medical Scribe job you want information about. Job names are case sensitive.
        @[JSON::Field(key: "MedicalScribeJobName")]
        getter medical_scribe_job_name : String

        def initialize(
          @medical_scribe_job_name : String
        )
        end
      end

      struct GetMedicalScribeJobResponse
        include JSON::Serializable

        # Provides detailed information about the specified Medical Scribe job, including job status and, if
        # applicable, failure reason
        @[JSON::Field(key: "MedicalScribeJob")]
        getter medical_scribe_job : Types::MedicalScribeJob?

        def initialize(
          @medical_scribe_job : Types::MedicalScribeJob? = nil
        )
        end
      end

      struct GetMedicalTranscriptionJobRequest
        include JSON::Serializable

        # The name of the medical transcription job you want information about. Job names are case sensitive.
        @[JSON::Field(key: "MedicalTranscriptionJobName")]
        getter medical_transcription_job_name : String

        def initialize(
          @medical_transcription_job_name : String
        )
        end
      end

      struct GetMedicalTranscriptionJobResponse
        include JSON::Serializable

        # Provides detailed information about the specified medical transcription job, including job status
        # and, if applicable, failure reason.
        @[JSON::Field(key: "MedicalTranscriptionJob")]
        getter medical_transcription_job : Types::MedicalTranscriptionJob?

        def initialize(
          @medical_transcription_job : Types::MedicalTranscriptionJob? = nil
        )
        end
      end

      struct GetMedicalVocabularyRequest
        include JSON::Serializable

        # The name of the custom medical vocabulary you want information about. Custom medical vocabulary
        # names are case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        def initialize(
          @vocabulary_name : String
        )
        end
      end

      struct GetMedicalVocabularyResponse
        include JSON::Serializable

        # The Amazon S3 location where the specified custom medical vocabulary is stored; use this URI to view
        # or download the custom vocabulary.
        @[JSON::Field(key: "DownloadUri")]
        getter download_uri : String?

        # If VocabularyState is FAILED , FailureReason contains information about why the custom medical
        # vocabulary request failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code you selected for your custom medical vocabulary. US English ( en-US ) is the only
        # language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom medical vocabulary was last modified. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the custom medical vocabulary you requested information about.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom medical vocabulary. If the state is READY , you can use the
        # custom vocabulary in a StartMedicalTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @download_uri : String? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      struct GetTranscriptionJobRequest
        include JSON::Serializable

        # The name of the transcription job you want information about. Job names are case sensitive.
        @[JSON::Field(key: "TranscriptionJobName")]
        getter transcription_job_name : String

        def initialize(
          @transcription_job_name : String
        )
        end
      end

      struct GetTranscriptionJobResponse
        include JSON::Serializable

        # Provides detailed information about the specified transcription job, including job status and, if
        # applicable, failure reason.
        @[JSON::Field(key: "TranscriptionJob")]
        getter transcription_job : Types::TranscriptionJob?

        def initialize(
          @transcription_job : Types::TranscriptionJob? = nil
        )
        end
      end

      struct GetVocabularyFilterRequest
        include JSON::Serializable

        # The name of the custom vocabulary filter you want information about. Custom vocabulary filter names
        # are case sensitive.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String

        def initialize(
          @vocabulary_filter_name : String
        )
        end
      end

      struct GetVocabularyFilterResponse
        include JSON::Serializable

        # The Amazon S3 location where the custom vocabulary filter is stored; use this URI to view or
        # download the custom vocabulary filter.
        @[JSON::Field(key: "DownloadUri")]
        getter download_uri : String?

        # The language code you selected for your custom vocabulary filter.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary filter was last modified. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the custom vocabulary filter you requested information about.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        def initialize(
          @download_uri : String? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_filter_name : String? = nil
        )
        end
      end

      struct GetVocabularyRequest
        include JSON::Serializable

        # The name of the custom vocabulary you want information about. Custom vocabulary names are case
        # sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        def initialize(
          @vocabulary_name : String
        )
        end
      end

      struct GetVocabularyResponse
        include JSON::Serializable

        # The Amazon S3 location where the custom vocabulary is stored; use this URI to view or download the
        # custom vocabulary.
        @[JSON::Field(key: "DownloadUri")]
        getter download_uri : String?

        # If VocabularyState is FAILED , FailureReason contains information about why the custom vocabulary
        # request failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code you selected for your custom vocabulary.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary was last modified. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the custom vocabulary you requested information about.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom vocabulary. If the state is READY , you can use the custom
        # vocabulary in a StartTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @download_uri : String? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      # Contains the Amazon S3 location of the training data you want to use to create a new custom language
      # model, and permissions to access this location. When using InputDataConfig , you must include these
      # sub-parameters: S3Uri and DataAccessRoleArn . You can optionally include TuningDataS3Uri .
      struct InputDataConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files. If the role that you specify doesn’t have the appropriate
        # permissions to access the specified Amazon S3 location, your request fails. IAM role ARNs have the
        # format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The Amazon S3 location (URI) of the text files you want to use to train your custom language model.
        # Here's an example URI path: s3://DOC-EXAMPLE-BUCKET/my-model-training-data/
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The Amazon S3 location (URI) of the text files you want to use to tune your custom language model.
        # Here's an example URI path: s3://DOC-EXAMPLE-BUCKET/my-model-tuning-data/
        @[JSON::Field(key: "TuningDataS3Uri")]
        getter tuning_data_s3_uri : String?

        def initialize(
          @data_access_role_arn : String,
          @s3_uri : String,
          @tuning_data_s3_uri : String? = nil
        )
        end
      end

      # There was an internal error. Check the error message, correct the issue, and try your request again.
      struct InternalFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Flag the presence or absence of interruptions in your Call Analytics transcription output. Rules
      # using InterruptionFilter are designed to match: Instances where an agent interrupts a customer
      # Instances where a customer interrupts an agent Either participant interrupting the other A lack of
      # interruptions See Rule criteria for post-call categories for usage examples.
      struct InterruptionFilter
        include JSON::Serializable

        # Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to
        # search for an interruption. See for more detail.
        @[JSON::Field(key: "AbsoluteTimeRange")]
        getter absolute_time_range : Types::AbsoluteTimeRange?

        # Set to TRUE to flag speech that does not contain interruptions. Set to FALSE to flag speech that
        # contains interruptions.
        @[JSON::Field(key: "Negate")]
        getter negate : Bool?

        # Specify the interrupter that you want to flag. Omitting this parameter is equivalent to specifying
        # both participants.
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        # Makes it possible to specify a time range (in percentage) in your media file, during which you want
        # to search for an interruption. See for more detail.
        @[JSON::Field(key: "RelativeTimeRange")]
        getter relative_time_range : Types::RelativeTimeRange?

        # Specify the duration of the interruptions in milliseconds. For example, you can flag speech that
        # contains more than 10,000 milliseconds of interruptions.
        @[JSON::Field(key: "Threshold")]
        getter threshold : Int64?

        def initialize(
          @absolute_time_range : Types::AbsoluteTimeRange? = nil,
          @negate : Bool? = nil,
          @participant_role : String? = nil,
          @relative_time_range : Types::RelativeTimeRange? = nil,
          @threshold : Int64? = nil
        )
        end
      end

      # Makes it possible to control how your transcription job is processed. Currently, the only
      # JobExecutionSettings modification you can choose is enabling job queueing using the
      # AllowDeferredExecution sub-parameter. If you include JobExecutionSettings in your request, you must
      # also include the sub-parameters: AllowDeferredExecution and DataAccessRoleArn .
      struct JobExecutionSettings
        include JSON::Serializable

        # Makes it possible to enable job queuing when your concurrent request limit is exceeded. When
        # AllowDeferredExecution is set to true , transcription job requests are placed in a queue until the
        # number of jobs falls below the concurrent request limit. If AllowDeferredExecution is set to false
        # and the number of transcription job requests exceed the concurrent request limit, you get a
        # LimitExceededException error. If you include AllowDeferredExecution in your request, you must also
        # include DataAccessRoleArn .
        @[JSON::Field(key: "AllowDeferredExecution")]
        getter allow_deferred_execution : Bool?

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files. If the role that you specify doesn’t have the appropriate
        # permissions to access the specified Amazon S3 location, your request fails. IAM role ARNs have the
        # format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs . Note that if you include
        # DataAccessRoleArn in your request, you must also include AllowDeferredExecution .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        def initialize(
          @allow_deferred_execution : Bool? = nil,
          @data_access_role_arn : String? = nil
        )
        end
      end

      # Provides information on the speech contained in a discreet utterance when multi-language
      # identification is enabled in your request. This utterance represents a block of speech consisting of
      # one language, preceded or followed by a block of speech in a different language.
      struct LanguageCodeItem
        include JSON::Serializable

        # Provides the total time, in seconds, each identified language is spoken in your media.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Float64?

        # Provides the language code for each language identified in your media.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        def initialize(
          @duration_in_seconds : Float64? = nil,
          @language_code : String? = nil
        )
        end
      end

      # If using automatic language identification in your request and you want to apply a custom language
      # model, a custom vocabulary, or a custom vocabulary filter, include LanguageIdSettings with the
      # relevant sub-parameters ( VocabularyName , LanguageModelName , and VocabularyFilterName ). Note that
      # multi-language identification ( IdentifyMultipleLanguages ) doesn't support custom language models.
      # LanguageIdSettings supports two to five language codes. Each language code you include can have an
      # associated custom language model, custom vocabulary, and custom vocabulary filter. The language
      # codes that you specify must match the languages of the associated custom language models, custom
      # vocabularies, and custom vocabulary filters. It's recommended that you include LanguageOptions when
      # using LanguageIdSettings to ensure that the correct language dialect is identified. For example, if
      # you specify a custom vocabulary that is in en-US but Amazon Transcribe determines that the language
      # spoken in your media is en-AU , your custom vocabulary is not applied to your transcription. If you
      # include LanguageOptions and include en-US as the only English language dialect, your custom
      # vocabulary is applied to your transcription. If you want to include a custom language model with
      # your request but do not want to use automatic language identification, use instead the parameter
      # with the LanguageModelName sub-parameter. If you want to include a custom vocabulary or a custom
      # vocabulary filter (or both) with your request but do not want to use automatic language
      # identification, use instead the parameter with the VocabularyName or VocabularyFilterName (or both)
      # sub-parameter.
      struct LanguageIdSettings
        include JSON::Serializable

        # The name of the custom language model you want to use when processing your transcription job. Note
        # that custom language model names are case sensitive. The language of the specified custom language
        # model must match the language code that you specify in your transcription request. If the languages
        # do not match, the custom language model isn't applied. There are no errors or warnings associated
        # with a language mismatch.
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        # The name of the custom vocabulary filter you want to use when processing your transcription job.
        # Custom vocabulary filter names are case sensitive. The language of the specified custom vocabulary
        # filter must match the language code that you specify in your transcription request. If the languages
        # do not match, the custom vocabulary filter isn't applied. There are no errors or warnings associated
        # with a language mismatch. Note that if you include VocabularyFilterName in your request, you must
        # also include VocabularyFilterMethod .
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The name of the custom vocabulary you want to use when processing your transcription job. Custom
        # vocabulary names are case sensitive. The language of the specified custom vocabulary must match the
        # language code that you specify in your transcription request. If the languages do not match, the
        # custom vocabulary isn't applied. There are no errors or warnings associated with a language
        # mismatch.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @language_model_name : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # Provides information about a custom language model, including: The base model name When the model
      # was created The location of the files used to train the model When the model was last modified The
      # name you chose for the model The model's language The model's processing state Any available
      # upgrades for the base model
      struct LanguageModel
        include JSON::Serializable

        # The Amazon Transcribe standard language model, or base model, used to create your custom language
        # model.
        @[JSON::Field(key: "BaseModelName")]
        getter base_model_name : String?

        # The date and time the specified custom language model was created. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # If ModelStatus is FAILED , FailureReason contains information about why the custom language model
        # request failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The Amazon S3 location of the input files used to train and tune your custom language model, in
        # addition to the data access role ARN (Amazon Resource Name) that has permissions to access these
        # data.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The language code used to create your custom language model. Each custom language model must contain
        # terms in only one language, and the language you select for your custom language model must match
        # the language of your training and tuning data. For a list of supported languages and their
        # associated language codes, refer to the Supported languages table. Note that US English ( en-US ) is
        # the only language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom language model was last modified. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # A unique name, chosen by you, for your custom language model. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # The status of the specified custom language model. When the status displays as COMPLETED the model
        # is ready for use.
        @[JSON::Field(key: "ModelStatus")]
        getter model_status : String?

        # Shows if a more current base model is available for use with the specified custom language model. If
        # false , your custom language model is using the most up-to-date base model. If true , there is a
        # newer base model available than the one your language model is using. Note that to update a base
        # model, you must recreate the custom language model using the new base model. Base model upgrades for
        # existing custom language models are not supported.
        @[JSON::Field(key: "UpgradeAvailability")]
        getter upgrade_availability : Bool?

        def initialize(
          @base_model_name : String? = nil,
          @create_time : Time? = nil,
          @failure_reason : String? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @model_name : String? = nil,
          @model_status : String? = nil,
          @upgrade_availability : Bool? = nil
        )
        end
      end

      # You've either sent too many requests or your input file is too long. Wait before retrying your
      # request, or use a smaller file and try your request again.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListCallAnalyticsCategoriesRequest
        include JSON::Serializable

        # The maximum number of Call Analytics categories to return in each page of results. If there are
        # fewer results than the value that you specify, only the actual results are returned. If you do not
        # specify a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your ListCallAnalyticsCategories request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCallAnalyticsCategoriesResponse
        include JSON::Serializable

        # Provides detailed information about your Call Analytics categories, including all the rules
        # associated with each category.
        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::CategoryProperties)?

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @categories : Array(Types::CategoryProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCallAnalyticsJobsRequest
        include JSON::Serializable

        # Returns only the Call Analytics jobs that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "JobNameContains")]
        getter job_name_contains : String?

        # The maximum number of Call Analytics jobs to return in each page of results. If there are fewer
        # results than the value that you specify, only the actual results are returned. If you do not specify
        # a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your ListCallAnalyticsJobs request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only Call Analytics jobs with the specified status. Jobs are ordered by creation date, with
        # the newest job first. If you do not include Status , all Call Analytics jobs are returned.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @job_name_contains : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListCallAnalyticsJobsResponse
        include JSON::Serializable

        # Provides a summary of information about each result.
        @[JSON::Field(key: "CallAnalyticsJobSummaries")]
        getter call_analytics_job_summaries : Array(Types::CallAnalyticsJobSummary)?

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all Call Analytics jobs that have the status specified in your request. Jobs are ordered by
        # creation date, with the newest job first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @call_analytics_job_summaries : Array(Types::CallAnalyticsJobSummary)? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListLanguageModelsRequest
        include JSON::Serializable

        # The maximum number of custom language models to return in each page of results. If there are fewer
        # results than the value that you specify, only the actual results are returned. If you do not specify
        # a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returns only the custom language models that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "NameContains")]
        getter name_contains : String?

        # If your ListLanguageModels request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only custom language models with the specified status. Language models are ordered by
        # creation date, with the newest model first. If you do not include StatusEquals , all custom language
        # models are returned.
        @[JSON::Field(key: "StatusEquals")]
        getter status_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @status_equals : String? = nil
        )
        end
      end

      struct ListLanguageModelsResponse
        include JSON::Serializable

        # Provides information about the custom language models that match the criteria specified in your
        # request.
        @[JSON::Field(key: "Models")]
        getter models : Array(Types::LanguageModel)?

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @models : Array(Types::LanguageModel)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMedicalScribeJobsRequest
        include JSON::Serializable

        # Returns only the Medical Scribe jobs that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "JobNameContains")]
        getter job_name_contains : String?

        # The maximum number of Medical Scribe jobs to return in each page of results. If there are fewer
        # results than the value that you specify, only the actual results are returned. If you do not specify
        # a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your ListMedicalScribeJobs request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only Medical Scribe jobs with the specified status. Jobs are ordered by creation date, with
        # the newest job first. If you do not include Status , all Medical Scribe jobs are returned.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @job_name_contains : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListMedicalScribeJobsResponse
        include JSON::Serializable

        # Provides a summary of information about each result.
        @[JSON::Field(key: "MedicalScribeJobSummaries")]
        getter medical_scribe_job_summaries : Array(Types::MedicalScribeJobSummary)?

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all Medical Scribe jobs that have the status specified in your request. Jobs are ordered by
        # creation date, with the newest job first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @medical_scribe_job_summaries : Array(Types::MedicalScribeJobSummary)? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListMedicalTranscriptionJobsRequest
        include JSON::Serializable

        # Returns only the medical transcription jobs that contain the specified string. The search is not
        # case sensitive.
        @[JSON::Field(key: "JobNameContains")]
        getter job_name_contains : String?

        # The maximum number of medical transcription jobs to return in each page of results. If there are
        # fewer results than the value that you specify, only the actual results are returned. If you do not
        # specify a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your ListMedicalTranscriptionJobs request returns more results than can be displayed, NextToken
        # is displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only medical transcription jobs with the specified status. Jobs are ordered by creation
        # date, with the newest job first. If you do not include Status , all medical transcription jobs are
        # returned.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @job_name_contains : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListMedicalTranscriptionJobsResponse
        include JSON::Serializable

        # Provides a summary of information about each result.
        @[JSON::Field(key: "MedicalTranscriptionJobSummaries")]
        getter medical_transcription_job_summaries : Array(Types::MedicalTranscriptionJobSummary)?

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all medical transcription jobs that have the status specified in your request. Jobs are
        # ordered by creation date, with the newest job first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @medical_transcription_job_summaries : Array(Types::MedicalTranscriptionJobSummary)? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListMedicalVocabulariesRequest
        include JSON::Serializable

        # The maximum number of custom medical vocabularies to return in each page of results. If there are
        # fewer results than the value that you specify, only the actual results are returned. If you do not
        # specify a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returns only the custom medical vocabularies that contain the specified string. The search is not
        # case sensitive.
        @[JSON::Field(key: "NameContains")]
        getter name_contains : String?

        # If your ListMedicalVocabularies request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only custom medical vocabularies with the specified state. Custom vocabularies are ordered
        # by creation date, with the newest vocabulary first. If you do not include StateEquals , all custom
        # medical vocabularies are returned.
        @[JSON::Field(key: "StateEquals")]
        getter state_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @state_equals : String? = nil
        )
        end
      end

      struct ListMedicalVocabulariesResponse
        include JSON::Serializable

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all custom medical vocabularies that have the status specified in your request. Custom
        # vocabularies are ordered by creation date, with the newest vocabulary first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides information about the custom medical vocabularies that match the criteria specified in your
        # request.
        @[JSON::Field(key: "Vocabularies")]
        getter vocabularies : Array(Types::VocabularyInfo)?

        def initialize(
          @next_token : String? = nil,
          @status : String? = nil,
          @vocabularies : Array(Types::VocabularyInfo)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Returns a list of all tags associated with the specified Amazon Resource Name (ARN). ARNs have the
        # format arn:partition:service:region:account-id:resource-type/resource-id . For example,
        # arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name . Valid values
        # for resource-type are: transcription-job , medical-transcription-job , vocabulary ,
        # medical-vocabulary , vocabulary-filter , and language-model .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) specified in your request.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Lists all tags associated with the given transcription job, vocabulary, model, or resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTranscriptionJobsRequest
        include JSON::Serializable

        # Returns only the transcription jobs that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "JobNameContains")]
        getter job_name_contains : String?

        # The maximum number of transcription jobs to return in each page of results. If there are fewer
        # results than the value that you specify, only the actual results are returned. If you do not specify
        # a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your ListTranscriptionJobs request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only transcription jobs with the specified status. Jobs are ordered by creation date, with
        # the newest job first. If you do not include Status , all transcription jobs are returned.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @job_name_contains : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListTranscriptionJobsResponse
        include JSON::Serializable

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all transcription jobs that have the status specified in your request. Jobs are ordered by
        # creation date, with the newest job first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides a summary of information about each result.
        @[JSON::Field(key: "TranscriptionJobSummaries")]
        getter transcription_job_summaries : Array(Types::TranscriptionJobSummary)?

        def initialize(
          @next_token : String? = nil,
          @status : String? = nil,
          @transcription_job_summaries : Array(Types::TranscriptionJobSummary)? = nil
        )
        end
      end

      struct ListVocabulariesRequest
        include JSON::Serializable

        # The maximum number of custom vocabularies to return in each page of results. If there are fewer
        # results than the value that you specify, only the actual results are returned. If you do not specify
        # a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returns only the custom vocabularies that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "NameContains")]
        getter name_contains : String?

        # If your ListVocabularies request returns more results than can be displayed, NextToken is displayed
        # in the response with an associated string. To get the next page of results, copy this string and
        # repeat your request, including NextToken with the value of the copied string. Repeat as needed to
        # view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns only custom vocabularies with the specified state. Vocabularies are ordered by creation
        # date, with the newest vocabulary first. If you do not include StateEquals , all custom medical
        # vocabularies are returned.
        @[JSON::Field(key: "StateEquals")]
        getter state_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @state_equals : String? = nil
        )
        end
      end

      struct ListVocabulariesResponse
        include JSON::Serializable

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all custom vocabularies that have the status specified in your request. Vocabularies are
        # ordered by creation date, with the newest vocabulary first.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Provides information about the custom vocabularies that match the criteria specified in your
        # request.
        @[JSON::Field(key: "Vocabularies")]
        getter vocabularies : Array(Types::VocabularyInfo)?

        def initialize(
          @next_token : String? = nil,
          @status : String? = nil,
          @vocabularies : Array(Types::VocabularyInfo)? = nil
        )
        end
      end

      struct ListVocabularyFiltersRequest
        include JSON::Serializable

        # The maximum number of custom vocabulary filters to return in each page of results. If there are
        # fewer results than the value that you specify, only the actual results are returned. If you do not
        # specify a value, a default of 5 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returns only the custom vocabulary filters that contain the specified string. The search is not case
        # sensitive.
        @[JSON::Field(key: "NameContains")]
        getter name_contains : String?

        # If your ListVocabularyFilters request returns more results than can be displayed, NextToken is
        # displayed in the response with an associated string. To get the next page of results, copy this
        # string and repeat your request, including NextToken with the value of the copied string. Repeat as
        # needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVocabularyFiltersResponse
        include JSON::Serializable

        # If NextToken is present in your response, it indicates that not all results are displayed. To view
        # the next set of results, copy the string associated with the NextToken parameter in your results
        # output, then run your request again including NextToken with the value of the copied string. Repeat
        # as needed to view all your results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Provides information about the custom vocabulary filters that match the criteria specified in your
        # request.
        @[JSON::Field(key: "VocabularyFilters")]
        getter vocabulary_filters : Array(Types::VocabularyFilterInfo)?

        def initialize(
          @next_token : String? = nil,
          @vocabulary_filters : Array(Types::VocabularyFilterInfo)? = nil
        )
        end
      end

      # Describes the Amazon S3 location of the media file you want to use in your request. For information
      # on supported media formats, refer to the MediaFormat parameter or the Media formats section in the
      # Amazon S3 Developer Guide.
      struct Media
        include JSON::Serializable

        # The Amazon S3 location of the media file you want to transcribe. For example:
        # s3://DOC-EXAMPLE-BUCKET/my-media-file.flac s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac
        # Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web
        # Services Region where you're making your transcription request.
        @[JSON::Field(key: "MediaFileUri")]
        getter media_file_uri : String?

        # The Amazon S3 location of the media file you want to redact. For example:
        # s3://DOC-EXAMPLE-BUCKET/my-media-file.flac s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac
        # Note that the Amazon S3 bucket that contains your input media must be located in the same Amazon Web
        # Services Region where you're making your transcription request. RedactedMediaFileUri produces a
        # redacted audio file in addition to a redacted transcript. It is only supported for Call Analytics (
        # StartCallAnalyticsJob ) transcription requests.
        @[JSON::Field(key: "RedactedMediaFileUri")]
        getter redacted_media_file_uri : String?

        def initialize(
          @media_file_uri : String? = nil,
          @redacted_media_file_uri : String? = nil
        )
        end
      end

      # Indicates which speaker is on which channel. The options are CLINICIAN and PATIENT
      struct MedicalScribeChannelDefinition
        include JSON::Serializable

        # Specify the audio channel you want to define.
        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32

        # Specify the participant that you want to flag. The options are CLINICIAN and PATIENT
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String

        def initialize(
          @channel_id : Int32,
          @participant_role : String
        )
        end
      end

      # The MedicalScribeContext object that contains contextual information used to generate customized
      # clinical notes.
      struct MedicalScribeContext
        include JSON::Serializable

        # Contains patient-specific information.
        @[JSON::Field(key: "PatientContext")]
        getter patient_context : Types::MedicalScribePatientContext?

        def initialize(
          @patient_context : Types::MedicalScribePatientContext? = nil
        )
        end
      end

      # Provides detailed information about a Medical Scribe job. To view the status of the specified
      # Medical Scribe job, check the MedicalScribeJobStatus field. If the status is COMPLETED , the job is
      # finished and you can find the results at the locations specified in MedicalScribeOutput . If the
      # status is FAILED , FailureReason provides details on why your Medical Scribe job failed.
      struct MedicalScribeJob
        include JSON::Serializable

        # Makes it possible to specify which speaker is on which channel. For example, if the clinician is the
        # first participant to speak, you would set ChannelId of the first ChannelDefinition in the list to 0
        # (to indicate the first channel) and ParticipantRole to CLINICIAN (to indicate that it's the
        # clinician speaking). Then you would set the ChannelId of the second ChannelDefinition in the list to
        # 1 (to indicate the second channel) and ParticipantRole to PATIENT (to indicate that it's the patient
        # speaking).
        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::MedicalScribeChannelDefinition)?

        # The date and time the specified Medical Scribe job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # The date and time the specified Medical Scribe job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files, write to the output bucket, and use your KMS key if supplied. If the
        # role that you specify doesn’t have the appropriate permissions your request fails. IAM role ARNs
        # have the format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # If MedicalScribeJobStatus is FAILED , FailureReason contains information about why the transcription
        # job failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code used to create your Medical Scribe job. US English ( en-US ) is the only supported
        # language for Medical Scribe jobs.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        @[JSON::Field(key: "Media")]
        getter media : Types::Media?

        # Indicates whether the MedicalScribeContext object was provided when the Medical Scribe job was
        # started.
        @[JSON::Field(key: "MedicalScribeContextProvided")]
        getter medical_scribe_context_provided : Bool?

        # The name of the Medical Scribe job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "MedicalScribeJobName")]
        getter medical_scribe_job_name : String?

        # Provides the status of the specified Medical Scribe job. If the status is COMPLETED , the job is
        # finished and you can find the results at the location specified in MedicalScribeOutput If the status
        # is FAILED , FailureReason provides details on why your Medical Scribe job failed.
        @[JSON::Field(key: "MedicalScribeJobStatus")]
        getter medical_scribe_job_status : String?

        # The location of the output of your Medical Scribe job. ClinicalDocumentUri holds the Amazon S3 URI
        # for the Clinical Document and TranscriptFileUri holds the Amazon S3 URI for the Transcript.
        @[JSON::Field(key: "MedicalScribeOutput")]
        getter medical_scribe_output : Types::MedicalScribeOutput?

        # Makes it possible to control how your Medical Scribe job is processed using a MedicalScribeSettings
        # object. Specify ChannelIdentification if ChannelDefinitions are set. Enabled ShowSpeakerLabels if
        # ChannelIdentification and ChannelDefinitions are not set. One and only one of ChannelIdentification
        # and ShowSpeakerLabels must be set. If ShowSpeakerLabels is set, MaxSpeakerLabels must also be set.
        # Use Settings to specify a vocabulary or vocabulary filter or both using VocabularyName ,
        # VocabularyFilterName . VocabularyFilterMethod must be specified if VocabularyFilterName is set.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::MedicalScribeSettings?

        # The date and time your Medical Scribe job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Adds one or more custom tags, each in the form of a key:value pair, to the Medical Scribe job. To
        # learn more about using tags with Amazon Transcribe, refer to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @channel_definitions : Array(Types::MedicalScribeChannelDefinition)? = nil,
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @data_access_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @media : Types::Media? = nil,
          @medical_scribe_context_provided : Bool? = nil,
          @medical_scribe_job_name : String? = nil,
          @medical_scribe_job_status : String? = nil,
          @medical_scribe_output : Types::MedicalScribeOutput? = nil,
          @settings : Types::MedicalScribeSettings? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Provides detailed information about a specific Medical Scribe job.
      struct MedicalScribeJobSummary
        include JSON::Serializable

        # The date and time the specified Medical Scribe job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # The date and time the specified Medical Scribe job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If MedicalScribeJobStatus is FAILED , FailureReason contains information about why the transcription
        # job failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code used to create your Medical Scribe job. US English ( en-US ) is the only supported
        # language for Medical Scribe jobs.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name of the Medical Scribe job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "MedicalScribeJobName")]
        getter medical_scribe_job_name : String?

        # Provides the status of the specified Medical Scribe job. If the status is COMPLETED , the job is
        # finished and you can find the results at the location specified in MedicalScribeOutput If the status
        # is FAILED , FailureReason provides details on why your Medical Scribe job failed.
        @[JSON::Field(key: "MedicalScribeJobStatus")]
        getter medical_scribe_job_status : String?

        # The date and time your Medical Scribe job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @medical_scribe_job_name : String? = nil,
          @medical_scribe_job_status : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The location of the output of your Medical Scribe job. ClinicalDocumentUri holds the Amazon S3 URI
      # for the Clinical Document and TranscriptFileUri holds the Amazon S3 URI for the Transcript.
      struct MedicalScribeOutput
        include JSON::Serializable

        # Holds the Amazon S3 URI for the Clinical Document.
        @[JSON::Field(key: "ClinicalDocumentUri")]
        getter clinical_document_uri : String

        # Holds the Amazon S3 URI for the Transcript.
        @[JSON::Field(key: "TranscriptFileUri")]
        getter transcript_file_uri : String

        def initialize(
          @clinical_document_uri : String,
          @transcript_file_uri : String
        )
        end
      end

      # Contains patient-specific information used to customize the clinical note generation.
      struct MedicalScribePatientContext
        include JSON::Serializable

        # The patient's preferred pronouns that the user wants to provide as a context for clinical note
        # generation.
        @[JSON::Field(key: "Pronouns")]
        getter pronouns : String?

        def initialize(
          @pronouns : String? = nil
        )
        end
      end

      # Makes it possible to control how your Medical Scribe job is processed using a MedicalScribeSettings
      # object. Specify ChannelIdentification if ChannelDefinitions are set. Enabled ShowSpeakerLabels if
      # ChannelIdentification and ChannelDefinitions are not set. One and only one of ChannelIdentification
      # and ShowSpeakerLabels must be set. If ShowSpeakerLabels is set, MaxSpeakerLabels must also be set.
      # Use Settings to specify a vocabulary or vocabulary filter or both using VocabularyName ,
      # VocabularyFilterName . VocabularyFilterMethod must be specified if VocabularyFilterName is set.
      struct MedicalScribeSettings
        include JSON::Serializable

        # Enables channel identification in multi-channel audio. Channel identification transcribes the audio
        # on each channel independently, then appends the output for each channel into one transcript. For
        # more information, see Transcribing multi-channel audio .
        @[JSON::Field(key: "ChannelIdentification")]
        getter channel_identification : Bool?

        # Specify settings for the clinical note generation.
        @[JSON::Field(key: "ClinicalNoteGenerationSettings")]
        getter clinical_note_generation_settings : Types::ClinicalNoteGenerationSettings?

        # Specify the maximum number of speakers you want to partition in your media. Note that if your media
        # contains more speakers than the specified number, multiple speakers are treated as a single speaker.
        # If you specify the MaxSpeakerLabels field, you must set the ShowSpeakerLabels field to true.
        @[JSON::Field(key: "MaxSpeakerLabels")]
        getter max_speaker_labels : Int32?

        # Enables speaker partitioning (diarization) in your Medical Scribe output. Speaker partitioning
        # labels the speech from individual speakers in your media file. If you enable ShowSpeakerLabels in
        # your request, you must also include MaxSpeakerLabels . For more information, see Partitioning
        # speakers (diarization) .
        @[JSON::Field(key: "ShowSpeakerLabels")]
        getter show_speaker_labels : Bool?

        # Specify how you want your custom vocabulary filter applied to your transcript. To replace words with
        # *** , choose mask . To delete words, choose remove . To flag words without changing them, choose tag
        # .
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # The name of the custom vocabulary filter you want to include in your Medical Scribe request. Custom
        # vocabulary filter names are case sensitive. Note that if you include VocabularyFilterName in your
        # request, you must also include VocabularyFilterMethod .
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The name of the custom vocabulary you want to include in your Medical Scribe request. Custom
        # vocabulary names are case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @channel_identification : Bool? = nil,
          @clinical_note_generation_settings : Types::ClinicalNoteGenerationSettings? = nil,
          @max_speaker_labels : Int32? = nil,
          @show_speaker_labels : Bool? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # Provides you with the Amazon S3 URI you can use to access your transcript.
      struct MedicalTranscript
        include JSON::Serializable

        # The Amazon S3 location of your transcript. You can use this URI to access or download your
        # transcript. Note that this is the Amazon S3 location you specified in your request using the
        # OutputBucketName parameter.
        @[JSON::Field(key: "TranscriptFileUri")]
        getter transcript_file_uri : String?

        def initialize(
          @transcript_file_uri : String? = nil
        )
        end
      end

      # Provides detailed information about a medical transcription job. To view the status of the specified
      # medical transcription job, check the TranscriptionJobStatus field. If the status is COMPLETED , the
      # job is finished and you can find the results at the location specified in TranscriptFileUri . If the
      # status is FAILED , FailureReason provides details on why your transcription job failed.
      struct MedicalTranscriptionJob
        include JSON::Serializable

        # The date and time the specified medical transcription job finished processing. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # Indicates whether content identification was enabled for your transcription request.
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # The date and time the specified medical transcription job request was made. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If TranscriptionJobStatus is FAILED , FailureReason contains information about why the transcription
        # job request failed. The FailureReason field contains one of the following values: Unsupported media
        # format . The media format specified in MediaFormat isn't valid. Refer to refer to the MediaFormat
        # parameter for a list of supported formats. The media format provided does not match the detected
        # media format . The media format specified in MediaFormat doesn't match the format of the input file.
        # Check the media format of your media file and correct the specified value. Invalid sample rate for
        # audio file . The sample rate specified in MediaSampleRateHertz isn't valid. The sample rate must be
        # between 16,000 and 48,000 hertz. The sample rate provided does not match the detected sample rate .
        # The sample rate specified in MediaSampleRateHertz doesn't match the sample rate detected in your
        # input media file. Check the sample rate of your media file and correct the specified value. Invalid
        # file size: file size too large . The size of your media file is larger than what Amazon Transcribe
        # can process. For more information, refer to Service quotas . Invalid number of channels: number of
        # channels too large . Your audio contains more channels than Amazon Transcribe is able to process.
        # For more information, refer to Service quotas .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code used to create your medical transcription job. US English ( en-US ) is the only
        # supported language for medical transcriptions.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        @[JSON::Field(key: "Media")]
        getter media : Types::Media?

        # The format of the input media file.
        @[JSON::Field(key: "MediaFormat")]
        getter media_format : String?

        # The sample rate, in hertz, of the audio track in your input media file.
        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # The name of the medical transcription job. Job names are case sensitive and must be unique within an
        # Amazon Web Services account.
        @[JSON::Field(key: "MedicalTranscriptionJobName")]
        getter medical_transcription_job_name : String?

        # Provides information on any additional settings that were included in your request. Additional
        # settings include channel identification, alternative transcriptions, speaker partitioning, custom
        # vocabularies, and custom vocabulary filters.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::MedicalTranscriptionSetting?

        # Describes the medical specialty represented in your media.
        @[JSON::Field(key: "Specialty")]
        getter specialty : String?

        # The date and time the specified medical transcription job began processing. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The tags, each in the form of a key:value pair, assigned to the specified medical transcription job.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Provides you with the Amazon S3 URI you can use to access your transcript.
        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::MedicalTranscript?

        # Provides the status of the specified medical transcription job. If the status is COMPLETED , the job
        # is finished and you can find the results at the location specified in TranscriptFileUri . If the
        # status is FAILED , FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "TranscriptionJobStatus")]
        getter transcription_job_status : String?

        # Indicates whether the input media is a dictation or a conversation, as specified in the
        # StartMedicalTranscriptionJob request.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @completion_time : Time? = nil,
          @content_identification_type : String? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @media : Types::Media? = nil,
          @media_format : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @medical_transcription_job_name : String? = nil,
          @settings : Types::MedicalTranscriptionSetting? = nil,
          @specialty : String? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transcript : Types::MedicalTranscript? = nil,
          @transcription_job_status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides detailed information about a specific medical transcription job.
      struct MedicalTranscriptionJobSummary
        include JSON::Serializable

        # The date and time the specified medical transcription job finished processing. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # Labels all personal health information (PHI) identified in your transcript. For more information,
        # see Identifying personal health information (PHI) in a transcription .
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # The date and time the specified medical transcription job request was made. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If TranscriptionJobStatus is FAILED , FailureReason contains information about why the transcription
        # job failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The language code used to create your medical transcription. US English ( en-US ) is the only
        # supported language for medical transcriptions.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name of the medical transcription job. Job names are case sensitive and must be unique within an
        # Amazon Web Services account.
        @[JSON::Field(key: "MedicalTranscriptionJobName")]
        getter medical_transcription_job_name : String?

        # Indicates where the specified medical transcription output is stored. If the value is
        # CUSTOMER_BUCKET , the location is the Amazon S3 bucket you specified using the OutputBucketName
        # parameter in your request. If you also included OutputKey in your request, your output is located in
        # the path you specified in your request. If the value is SERVICE_BUCKET , the location is a
        # service-managed Amazon S3 bucket. To access a transcript stored in a service-managed bucket, use the
        # URI shown in the TranscriptFileUri field.
        @[JSON::Field(key: "OutputLocationType")]
        getter output_location_type : String?

        # Provides the medical specialty represented in your media.
        @[JSON::Field(key: "Specialty")]
        getter specialty : String?

        # The date and time your medical transcription job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Provides the status of your medical transcription job. If the status is COMPLETED , the job is
        # finished and you can find the results at the location specified in TranscriptFileUri . If the status
        # is FAILED , FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "TranscriptionJobStatus")]
        getter transcription_job_status : String?

        # Indicates whether the input media is a dictation or a conversation, as specified in the
        # StartMedicalTranscriptionJob request.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @completion_time : Time? = nil,
          @content_identification_type : String? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @language_code : String? = nil,
          @medical_transcription_job_name : String? = nil,
          @output_location_type : String? = nil,
          @specialty : String? = nil,
          @start_time : Time? = nil,
          @transcription_job_status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Allows additional optional settings in your request, including channel identification, alternative
      # transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your
      # medical transcription job.
      struct MedicalTranscriptionSetting
        include JSON::Serializable

        # Enables channel identification in multi-channel audio. Channel identification transcribes the audio
        # on each channel independently, then appends the output for each channel into one transcript. If you
        # have multi-channel audio and do not enable channel identification, your audio is transcribed in a
        # continuous manner and your transcript does not separate the speech by channel. For more information,
        # see Transcribing multi-channel audio .
        @[JSON::Field(key: "ChannelIdentification")]
        getter channel_identification : Bool?

        # Indicate the maximum number of alternative transcriptions you want Amazon Transcribe Medical to
        # include in your transcript. If you select a number greater than the number of alternative
        # transcriptions generated by Amazon Transcribe Medical, only the actual number of alternative
        # transcriptions are included. If you include MaxAlternatives in your request, you must also include
        # ShowAlternatives with a value of true . For more information, see Alternative transcriptions .
        @[JSON::Field(key: "MaxAlternatives")]
        getter max_alternatives : Int32?

        # Specify the maximum number of speakers you want to partition in your media. Note that if your media
        # contains more speakers than the specified number, multiple speakers are treated as a single speaker.
        # If you specify the MaxSpeakerLabels field, you must set the ShowSpeakerLabels field to true.
        @[JSON::Field(key: "MaxSpeakerLabels")]
        getter max_speaker_labels : Int32?

        # To include alternative transcriptions within your transcription output, include ShowAlternatives in
        # your transcription request. If you include ShowAlternatives , you must also include MaxAlternatives
        # , which is the maximum number of alternative transcriptions you want Amazon Transcribe Medical to
        # generate. For more information, see Alternative transcriptions .
        @[JSON::Field(key: "ShowAlternatives")]
        getter show_alternatives : Bool?

        # Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels
        # the speech from individual speakers in your media file. If you enable ShowSpeakerLabels in your
        # request, you must also include MaxSpeakerLabels . For more information, see Partitioning speakers
        # (diarization) .
        @[JSON::Field(key: "ShowSpeakerLabels")]
        getter show_speaker_labels : Bool?

        # The name of the custom vocabulary you want to use when processing your medical transcription job.
        # Custom vocabulary names are case sensitive. The language of the specified custom vocabulary must
        # match the language code that you specify in your transcription request. If the languages do not
        # match, the custom vocabulary isn't applied. There are no errors or warnings associated with a
        # language mismatch. US English ( en-US ) is the only valid language for Amazon Transcribe Medical.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @channel_identification : Bool? = nil,
          @max_alternatives : Int32? = nil,
          @max_speaker_labels : Int32? = nil,
          @show_alternatives : Bool? = nil,
          @show_speaker_labels : Bool? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # Provides the name of the custom language model that was included in the specified transcription job.
      # Only use ModelSettings with the LanguageModelName sub-parameter if you're not using automatic
      # language identification ( ). If using LanguageIdSettings in your request, this parameter contains a
      # LanguageModelName sub-parameter.
      struct ModelSettings
        include JSON::Serializable

        # The name of the custom language model you want to use when processing your transcription job. Note
        # that custom language model names are case sensitive. The language of the specified custom language
        # model must match the language code that you specify in your transcription request. If the languages
        # do not match, the custom language model isn't applied. There are no errors or warnings associated
        # with a language mismatch.
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        def initialize(
          @language_model_name : String? = nil
        )
        end
      end

      # Flag the presence or absence of periods of silence in your Call Analytics transcription output.
      # Rules using NonTalkTimeFilter are designed to match: The presence of silence at specified periods
      # throughout the call The presence of speech at specified periods throughout the call See Rule
      # criteria for post-call categories for usage examples.
      struct NonTalkTimeFilter
        include JSON::Serializable

        # Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to
        # search for a period of silence. See for more detail.
        @[JSON::Field(key: "AbsoluteTimeRange")]
        getter absolute_time_range : Types::AbsoluteTimeRange?

        # Set to TRUE to flag periods of speech. Set to FALSE to flag periods of silence
        @[JSON::Field(key: "Negate")]
        getter negate : Bool?

        # Makes it possible to specify a time range (in percentage) in your media file, during which you want
        # to search for a period of silence. See for more detail.
        @[JSON::Field(key: "RelativeTimeRange")]
        getter relative_time_range : Types::RelativeTimeRange?

        # Specify the duration, in milliseconds, of the period of silence that you want to flag. For example,
        # you can flag a silent period that lasts 30,000 milliseconds.
        @[JSON::Field(key: "Threshold")]
        getter threshold : Int64?

        def initialize(
          @absolute_time_range : Types::AbsoluteTimeRange? = nil,
          @negate : Bool? = nil,
          @relative_time_range : Types::RelativeTimeRange? = nil,
          @threshold : Int64? = nil
        )
        end
      end

      # We can't find the requested resource. Check that the specified name is correct and try your request
      # again.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A time range, in percentage, between two points in your media file. You can use StartPercentage and
      # EndPercentage to search a custom segment. For example, setting StartPercentage to 10 and
      # EndPercentage to 50 only searches for your specified criteria in the audio contained between the 10
      # percent mark and the 50 percent mark of your media file. You can use also First to search from the
      # start of the media file until the time that you specify. Or use Last to search from the time that
      # you specify until the end of the media file. For example, setting First to 10 only searches for your
      # specified criteria in the audio contained in the first 10 percent of the media file. If you prefer
      # to use milliseconds instead of percentage, see .
      struct RelativeTimeRange
        include JSON::Serializable

        # The time, in percentage, when Amazon Transcribe stops searching for the specified criteria in your
        # media file. If you include EndPercentage in your request, you must also include StartPercentage .
        @[JSON::Field(key: "EndPercentage")]
        getter end_percentage : Int32?

        # The time, in percentage, from the start of your media file until the specified value. Amazon
        # Transcribe searches for your specified criteria in this time segment.
        @[JSON::Field(key: "First")]
        getter first : Int32?

        # The time, in percentage, from the specified value until the end of your media file. Amazon
        # Transcribe searches for your specified criteria in this time segment.
        @[JSON::Field(key: "Last")]
        getter last : Int32?

        # The time, in percentage, when Amazon Transcribe starts searching for the specified criteria in your
        # media file. If you include StartPercentage in your request, you must also include EndPercentage .
        @[JSON::Field(key: "StartPercentage")]
        getter start_percentage : Int32?

        def initialize(
          @end_percentage : Int32? = nil,
          @first : Int32? = nil,
          @last : Int32? = nil,
          @start_percentage : Int32? = nil
        )
        end
      end

      # A rule is a set of criteria that you can specify to flag an attribute in your Call Analytics output.
      # Rules define a Call Analytics category. Rules can include these parameters: , , , and . To learn
      # more about Call Analytics rules and categories, see Creating categories for post-call transcriptions
      # and Creating categories for real-time transcriptions . To learn more about Call Analytics, see
      # Analyzing call center audio with Call Analytics .
      struct Rule
        include JSON::Serializable

        # Flag the presence or absence of interruptions in your Call Analytics transcription output. Refer to
        # for more detail.
        @[JSON::Field(key: "InterruptionFilter")]
        getter interruption_filter : Types::InterruptionFilter?

        # Flag the presence or absence of periods of silence in your Call Analytics transcription output.
        # Refer to for more detail.
        @[JSON::Field(key: "NonTalkTimeFilter")]
        getter non_talk_time_filter : Types::NonTalkTimeFilter?

        # Flag the presence or absence of specific sentiments in your Call Analytics transcription output.
        # Refer to for more detail.
        @[JSON::Field(key: "SentimentFilter")]
        getter sentiment_filter : Types::SentimentFilter?

        # Flag the presence or absence of specific words or phrases in your Call Analytics transcription
        # output. Refer to for more detail.
        @[JSON::Field(key: "TranscriptFilter")]
        getter transcript_filter : Types::TranscriptFilter?

        def initialize(
          @interruption_filter : Types::InterruptionFilter? = nil,
          @non_talk_time_filter : Types::NonTalkTimeFilter? = nil,
          @sentiment_filter : Types::SentimentFilter? = nil,
          @transcript_filter : Types::TranscriptFilter? = nil
        )
        end
      end

      # Flag the presence or absence of specific sentiments detected in your Call Analytics transcription
      # output. Rules using SentimentFilter are designed to match: The presence or absence of a positive
      # sentiment felt by the customer, agent, or both at specified points in the call The presence or
      # absence of a negative sentiment felt by the customer, agent, or both at specified points in the call
      # The presence or absence of a neutral sentiment felt by the customer, agent, or both at specified
      # points in the call The presence or absence of a mixed sentiment felt by the customer, the agent, or
      # both at specified points in the call See Rule criteria for post-call categories for usage examples.
      struct SentimentFilter
        include JSON::Serializable

        # Specify the sentiments that you want to flag.
        @[JSON::Field(key: "Sentiments")]
        getter sentiments : Array(String)

        # Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to
        # search for the specified sentiments. See for more detail.
        @[JSON::Field(key: "AbsoluteTimeRange")]
        getter absolute_time_range : Types::AbsoluteTimeRange?

        # Set to TRUE to flag the sentiments that you didn't include in your request. Set to FALSE to flag the
        # sentiments that you specified in your request.
        @[JSON::Field(key: "Negate")]
        getter negate : Bool?

        # Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying
        # both participants.
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        # Makes it possible to specify a time range (in percentage) in your media file, during which you want
        # to search for the specified sentiments. See for more detail.
        @[JSON::Field(key: "RelativeTimeRange")]
        getter relative_time_range : Types::RelativeTimeRange?

        def initialize(
          @sentiments : Array(String),
          @absolute_time_range : Types::AbsoluteTimeRange? = nil,
          @negate : Bool? = nil,
          @participant_role : String? = nil,
          @relative_time_range : Types::RelativeTimeRange? = nil
        )
        end
      end

      # Allows additional optional settings in your request, including channel identification, alternative
      # transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your
      # transcription job.
      struct Settings
        include JSON::Serializable

        # Enables channel identification in multi-channel audio. Channel identification transcribes the audio
        # on each channel independently, then appends the output for each channel into one transcript. For
        # more information, see Transcribing multi-channel audio .
        @[JSON::Field(key: "ChannelIdentification")]
        getter channel_identification : Bool?

        # Indicate the maximum number of alternative transcriptions you want Amazon Transcribe to include in
        # your transcript. If you select a number greater than the number of alternative transcriptions
        # generated by Amazon Transcribe, only the actual number of alternative transcriptions are included.
        # If you include MaxAlternatives in your request, you must also include ShowAlternatives with a value
        # of true . For more information, see Alternative transcriptions .
        @[JSON::Field(key: "MaxAlternatives")]
        getter max_alternatives : Int32?

        # Specify the maximum number of speakers you want to partition in your media. Note that if your media
        # contains more speakers than the specified number, multiple speakers are treated as a single speaker.
        # If you specify the MaxSpeakerLabels field, you must set the ShowSpeakerLabels field to true.
        @[JSON::Field(key: "MaxSpeakerLabels")]
        getter max_speaker_labels : Int32?

        # To include alternative transcriptions within your transcription output, include ShowAlternatives in
        # your transcription request. If you have multi-channel audio and do not enable channel
        # identification, your audio is transcribed in a continuous manner and your transcript does not
        # separate the speech by channel. If you include ShowAlternatives , you must also include
        # MaxAlternatives , which is the maximum number of alternative transcriptions you want Amazon
        # Transcribe to generate. For more information, see Alternative transcriptions .
        @[JSON::Field(key: "ShowAlternatives")]
        getter show_alternatives : Bool?

        # Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels
        # the speech from individual speakers in your media file. If you enable ShowSpeakerLabels in your
        # request, you must also include MaxSpeakerLabels . For more information, see Partitioning speakers
        # (diarization) .
        @[JSON::Field(key: "ShowSpeakerLabels")]
        getter show_speaker_labels : Bool?

        # Specify how you want your custom vocabulary filter applied to your transcript. To replace words with
        # *** , choose mask . To delete words, choose remove . To flag words without changing them, choose tag
        # .
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # The name of the custom vocabulary filter you want to use in your transcription job request. This
        # name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services
        # account. Note that if you include VocabularyFilterName in your request, you must also include
        # VocabularyFilterMethod .
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The name of the custom vocabulary you want to use in your transcription job request. This name is
        # case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @channel_identification : Bool? = nil,
          @max_alternatives : Int32? = nil,
          @max_speaker_labels : Int32? = nil,
          @show_alternatives : Bool? = nil,
          @show_speaker_labels : Bool? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      struct StartCallAnalyticsJobRequest
        include JSON::Serializable

        # A unique name, chosen by you, for your Call Analytics job. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new
        # job with the same name as an existing job, you get a ConflictException error.
        @[JSON::Field(key: "CallAnalyticsJobName")]
        getter call_analytics_job_name : String

        # Describes the Amazon S3 location of the media file you want to use in your Call Analytics request.
        @[JSON::Field(key: "Media")]
        getter media : Types::Media

        # Makes it possible to specify which speaker is on which channel. For example, if your agent is the
        # first participant to speak, you would set ChannelId to 0 (to indicate the first channel) and
        # ParticipantRole to AGENT (to indicate that it's the agent speaking).
        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::ChannelDefinition)?

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files. If the role that you specify doesn’t have the appropriate
        # permissions to access the specified Amazon S3 location, your request fails. IAM role ARNs have the
        # format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The Amazon Resource Name (ARN) of a KMS key that you want to use to encrypt your Call Analytics
        # output. KMS key ARNs have the format arn:partition:kms:region:account:key/key-id . For example:
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . For more information,
        # see KMS key ARNs . If you do not specify an encryption key, your output is encrypted with the
        # default Amazon S3 key (SSE-S3). Note that the role making the request and the role specified in the
        # DataAccessRoleArn request parameter (if present) must have permission to use the specified KMS key.
        @[JSON::Field(key: "OutputEncryptionKMSKeyId")]
        getter output_encryption_kms_key_id : String?

        # The Amazon S3 location where you want your Call Analytics transcription output stored. You can use
        # any of the following formats to specify the output location: s3://DOC-EXAMPLE-BUCKET
        # s3://DOC-EXAMPLE-BUCKET/my-output-folder/
        # s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json Unless you specify a file name
        # (option 3), the name of your output file has a default value that matches the name you specified for
        # your transcription job using the CallAnalyticsJobName parameter. You can specify a KMS key to
        # encrypt your output using the OutputEncryptionKMSKeyId parameter. If you do not specify a KMS key,
        # Amazon Transcribe uses the default Amazon S3 key for server-side encryption. If you do not specify
        # OutputLocation , your transcript is placed in a service-managed Amazon S3 bucket and you are
        # provided with a URI to access your transcript.
        @[JSON::Field(key: "OutputLocation")]
        getter output_location : String?

        # Specify additional optional settings in your request, including content redaction; allows you to
        # apply custom language models, vocabulary filters, and custom vocabularies to your Call Analytics
        # job.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::CallAnalyticsJobSettings?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new call analytics job at
        # the time you start this new job. To learn more about using tags with Amazon Transcribe, refer to
        # Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @call_analytics_job_name : String,
          @media : Types::Media,
          @channel_definitions : Array(Types::ChannelDefinition)? = nil,
          @data_access_role_arn : String? = nil,
          @output_encryption_kms_key_id : String? = nil,
          @output_location : String? = nil,
          @settings : Types::CallAnalyticsJobSettings? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartCallAnalyticsJobResponse
        include JSON::Serializable

        # Provides detailed information about the current Call Analytics job, including job status and, if
        # applicable, failure reason.
        @[JSON::Field(key: "CallAnalyticsJob")]
        getter call_analytics_job : Types::CallAnalyticsJob?

        def initialize(
          @call_analytics_job : Types::CallAnalyticsJob? = nil
        )
        end
      end

      struct StartMedicalScribeJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files, write to the output bucket, and use your KMS key if supplied. If the
        # role that you specify doesn’t have the appropriate permissions your request fails. IAM role ARNs
        # have the format arn:partition:iam::account:role/role-name-with-path . For example:
        # arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        @[JSON::Field(key: "Media")]
        getter media : Types::Media

        # A unique name, chosen by you, for your Medical Scribe job. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new
        # job with the same name as an existing job, you get a ConflictException error.
        @[JSON::Field(key: "MedicalScribeJobName")]
        getter medical_scribe_job_name : String

        # The name of the Amazon S3 bucket where you want your Medical Scribe output stored. Do not include
        # the S3:// prefix of the specified bucket. Note that the role specified in the DataAccessRoleArn
        # request parameter must have permission to use the specified location. You can change Amazon S3
        # permissions using the Amazon Web Services Management Console . See also Permissions Required for IAM
        # User Roles .
        @[JSON::Field(key: "OutputBucketName")]
        getter output_bucket_name : String

        # Makes it possible to control how your Medical Scribe job is processed using a MedicalScribeSettings
        # object. Specify ChannelIdentification if ChannelDefinitions are set. Enabled ShowSpeakerLabels if
        # ChannelIdentification and ChannelDefinitions are not set. One and only one of ChannelIdentification
        # and ShowSpeakerLabels must be set. If ShowSpeakerLabels is set, MaxSpeakerLabels must also be set.
        # Use Settings to specify a vocabulary or vocabulary filter or both using VocabularyName ,
        # VocabularyFilterName . VocabularyFilterMethod must be specified if VocabularyFilterName is set.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::MedicalScribeSettings

        # Makes it possible to specify which speaker is on which channel. For example, if the clinician is the
        # first participant to speak, you would set ChannelId of the first ChannelDefinition in the list to 0
        # (to indicate the first channel) and ParticipantRole to CLINICIAN (to indicate that it's the
        # clinician speaking). Then you would set the ChannelId of the second ChannelDefinition in the list to
        # 1 (to indicate the second channel) and ParticipantRole to PATIENT (to indicate that it's the patient
        # speaking).
        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::MedicalScribeChannelDefinition)?

        # A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an
        # added layer of security for your data. For more information, see KMS encryption context and
        # Asymmetric keys in KMS .
        @[JSON::Field(key: "KMSEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        # The MedicalScribeContext object that contains contextual information which is used during clinical
        # note generation to add relevant context to the note.
        @[JSON::Field(key: "MedicalScribeContext")]
        getter medical_scribe_context : Types::MedicalScribeContext?

        # The Amazon Resource Name (ARN) of a KMS key that you want to use to encrypt your Medical Scribe
        # output. KMS key ARNs have the format arn:partition:kms:region:account:key/key-id . For example:
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . For more information,
        # see KMS key ARNs . If you do not specify an encryption key, your output is encrypted with the
        # default Amazon S3 key (SSE-S3). Note that the role making the request and the role specified in the
        # DataAccessRoleArn request parameter (if present) must have permission to use the specified KMS key.
        @[JSON::Field(key: "OutputEncryptionKMSKeyId")]
        getter output_encryption_kms_key_id : String?

        # Adds one or more custom tags, each in the form of a key:value pair, to the Medical Scribe job. To
        # learn more about using tags with Amazon Transcribe, refer to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_access_role_arn : String,
          @media : Types::Media,
          @medical_scribe_job_name : String,
          @output_bucket_name : String,
          @settings : Types::MedicalScribeSettings,
          @channel_definitions : Array(Types::MedicalScribeChannelDefinition)? = nil,
          @kms_encryption_context : Hash(String, String)? = nil,
          @medical_scribe_context : Types::MedicalScribeContext? = nil,
          @output_encryption_kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartMedicalScribeJobResponse
        include JSON::Serializable

        # Provides detailed information about the current Medical Scribe job, including job status and, if
        # applicable, failure reason.
        @[JSON::Field(key: "MedicalScribeJob")]
        getter medical_scribe_job : Types::MedicalScribeJob?

        def initialize(
          @medical_scribe_job : Types::MedicalScribeJob? = nil
        )
        end
      end

      struct StartMedicalTranscriptionJobRequest
        include JSON::Serializable

        # The language code that represents the language spoken in the input media file. US English ( en-US )
        # is the only valid value for medical transcription jobs. Any other value you enter for language code
        # results in a BadRequestException error.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        @[JSON::Field(key: "Media")]
        getter media : Types::Media

        # A unique name, chosen by you, for your medical transcription job. The name that you specify is also
        # used as the default name of your transcription output file. If you want to specify a different name
        # for your transcription output, use the OutputKey parameter. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account. If you try to create a new
        # job with the same name as an existing job, you get a ConflictException error.
        @[JSON::Field(key: "MedicalTranscriptionJobName")]
        getter medical_transcription_job_name : String

        # The name of the Amazon S3 bucket where you want your medical transcription output stored. Do not
        # include the S3:// prefix of the specified bucket. If you want your output to go to a sub-folder of
        # this bucket, specify it using the OutputKey parameter; OutputBucketName only accepts the name of a
        # bucket. For example, if you want your output stored in S3://DOC-EXAMPLE-BUCKET , set
        # OutputBucketName to DOC-EXAMPLE-BUCKET . However, if you want your output stored in
        # S3://DOC-EXAMPLE-BUCKET/test-files/ , set OutputBucketName to DOC-EXAMPLE-BUCKET and OutputKey to
        # test-files/ . Note that Amazon Transcribe must have permission to use the specified location. You
        # can change Amazon S3 permissions using the Amazon Web Services Management Console . See also
        # Permissions Required for IAM User Roles .
        @[JSON::Field(key: "OutputBucketName")]
        getter output_bucket_name : String

        # Specify the predominant medical specialty represented in your media. For batch transcriptions,
        # PRIMARYCARE is the only valid value. If you require additional specialties, refer to .
        @[JSON::Field(key: "Specialty")]
        getter specialty : String

        # Specify whether your input media contains only one person ( DICTATION ) or contains a conversation
        # between two people ( CONVERSATION ). For example, DICTATION could be used for a medical professional
        # wanting to transcribe voice memos; CONVERSATION could be used for transcribing the doctor-patient
        # dialogue during the patient's office visit.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Labels all personal health information (PHI) identified in your transcript. For more information,
        # see Identifying personal health information (PHI) in a transcription .
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an
        # added layer of security for your data. For more information, see KMS encryption context and
        # Asymmetric keys in KMS .
        @[JSON::Field(key: "KMSEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        # Specify the format of your input media file.
        @[JSON::Field(key: "MediaFormat")]
        getter media_format : String?

        # The sample rate, in hertz, of the audio track in your input media file. If you do not specify the
        # media sample rate, Amazon Transcribe Medical determines it for you. If you specify the sample rate,
        # it must match the rate detected by Amazon Transcribe Medical; if there's a mismatch between the
        # value that you specify and the value detected, your job fails. Therefore, in most cases, it's
        # advised to omit MediaSampleRateHertz and let Amazon Transcribe Medical determine the sample rate.
        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # The Amazon Resource Name (ARN) of a KMS key that you want to use to encrypt your medical
        # transcription output. KMS key ARNs have the format arn:partition:kms:region:account:key/key-id . For
        # example: arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . For more
        # information, see KMS key ARNs . If you do not specify an encryption key, your output is encrypted
        # with the default Amazon S3 key (SSE-S3). Note that the role making the request and the role
        # specified in the DataAccessRoleArn request parameter (if present) must have permission to use the
        # specified KMS key.
        @[JSON::Field(key: "OutputEncryptionKMSKeyId")]
        getter output_encryption_kms_key_id : String?

        # Use in combination with OutputBucketName to specify the output location of your transcript and,
        # optionally, a unique name for your output file. The default name for your transcription output is
        # the same as the name you specified for your medical transcription job ( MedicalTranscriptionJobName
        # ). Here are some examples of how you can use OutputKey : If you specify 'DOC-EXAMPLE-BUCKET' as the
        # OutputBucketName and 'my-transcript.json' as the OutputKey , your transcription output path is
        # s3://DOC-EXAMPLE-BUCKET/my-transcript.json . If you specify 'my-first-transcription' as the
        # MedicalTranscriptionJobName , 'DOC-EXAMPLE-BUCKET' as the OutputBucketName , and 'my-transcript' as
        # the OutputKey , your transcription output path is
        # s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json . If you specify
        # 'DOC-EXAMPLE-BUCKET' as the OutputBucketName and 'test-files/my-transcript.json' as the OutputKey ,
        # your transcription output path is s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json . If you
        # specify 'my-first-transcription' as the MedicalTranscriptionJobName , 'DOC-EXAMPLE-BUCKET' as the
        # OutputBucketName , and 'test-files/my-transcript' as the OutputKey , your transcription output path
        # is s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json . If you specify the
        # name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.
        @[JSON::Field(key: "OutputKey")]
        getter output_key : String?

        # Specify additional optional settings in your request, including channel identification, alternative
        # transcriptions, and speaker partitioning. You can use that to apply custom vocabularies to your
        # transcription job.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::MedicalTranscriptionSetting?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new medical transcription
        # job at the time you start this new job. To learn more about using tags with Amazon Transcribe, refer
        # to Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @language_code : String,
          @media : Types::Media,
          @medical_transcription_job_name : String,
          @output_bucket_name : String,
          @specialty : String,
          @type : String,
          @content_identification_type : String? = nil,
          @kms_encryption_context : Hash(String, String)? = nil,
          @media_format : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @output_encryption_kms_key_id : String? = nil,
          @output_key : String? = nil,
          @settings : Types::MedicalTranscriptionSetting? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartMedicalTranscriptionJobResponse
        include JSON::Serializable

        # Provides detailed information about the current medical transcription job, including job status and,
        # if applicable, failure reason.
        @[JSON::Field(key: "MedicalTranscriptionJob")]
        getter medical_transcription_job : Types::MedicalTranscriptionJob?

        def initialize(
          @medical_transcription_job : Types::MedicalTranscriptionJob? = nil
        )
        end
      end

      struct StartTranscriptionJobRequest
        include JSON::Serializable

        # Describes the Amazon S3 location of the media file you want to use in your request.
        @[JSON::Field(key: "Media")]
        getter media : Types::Media

        # A unique name, chosen by you, for your transcription job. The name that you specify is also used as
        # the default name of your transcription output file. If you want to specify a different name for your
        # transcription output, use the OutputKey parameter. This name is case sensitive, cannot contain
        # spaces, and must be unique within an Amazon Web Services account. If you try to create a new job
        # with the same name as an existing job, you get a ConflictException error.
        @[JSON::Field(key: "TranscriptionJobName")]
        getter transcription_job_name : String

        # Makes it possible to redact or flag specified personally identifiable information (PII) in your
        # transcript. If you use ContentRedaction , you must also include the sub-parameters: RedactionOutput
        # and RedactionType . You can optionally include PiiEntityTypes to choose which types of PII you want
        # to redact. If you do not include PiiEntityTypes in your request, all PII is redacted.
        @[JSON::Field(key: "ContentRedaction")]
        getter content_redaction : Types::ContentRedaction?

        # Enables automatic language identification in your transcription job request. Use this parameter if
        # your media file contains only one language. If your media contains multiple languages, use
        # IdentifyMultipleLanguages instead. If you include IdentifyLanguage , you can optionally include a
        # list of language codes, using LanguageOptions , that you think may be present in your media file.
        # Including LanguageOptions restricts IdentifyLanguage to only the language options that you specify,
        # which can improve transcription accuracy. If you want to apply a custom language model, a custom
        # vocabulary, or a custom vocabulary filter to your automatic language identification request, include
        # LanguageIdSettings with the relevant sub-parameters ( VocabularyName , LanguageModelName , and
        # VocabularyFilterName ). If you include LanguageIdSettings , also include LanguageOptions . Note that
        # you must include one of LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages in your
        # request. If you include more than one of these parameters, your transcription job fails.
        @[JSON::Field(key: "IdentifyLanguage")]
        getter identify_language : Bool?

        # Enables automatic multi-language identification in your transcription job request. Use this
        # parameter if your media file contains more than one language. If your media contains only one
        # language, use IdentifyLanguage instead. If you include IdentifyMultipleLanguages , you can
        # optionally include a list of language codes, using LanguageOptions , that you think may be present
        # in your media file. Including LanguageOptions restricts IdentifyLanguage to only the language
        # options that you specify, which can improve transcription accuracy. If you want to apply a custom
        # vocabulary or a custom vocabulary filter to your automatic language identification request, include
        # LanguageIdSettings with the relevant sub-parameters ( VocabularyName and VocabularyFilterName ). If
        # you include LanguageIdSettings , also include LanguageOptions . Note that you must include one of
        # LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages in your request. If you include more
        # than one of these parameters, your transcription job fails.
        @[JSON::Field(key: "IdentifyMultipleLanguages")]
        getter identify_multiple_languages : Bool?

        # Makes it possible to control how your transcription job is processed. Currently, the only
        # JobExecutionSettings modification you can choose is enabling job queueing using the
        # AllowDeferredExecution sub-parameter. If you include JobExecutionSettings in your request, you must
        # also include the sub-parameters: AllowDeferredExecution and DataAccessRoleArn .
        @[JSON::Field(key: "JobExecutionSettings")]
        getter job_execution_settings : Types::JobExecutionSettings?

        # A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an
        # added layer of security for your data. For more information, see KMS encryption context and
        # Asymmetric keys in KMS .
        @[JSON::Field(key: "KMSEncryptionContext")]
        getter kms_encryption_context : Hash(String, String)?

        # The language code that represents the language spoken in the input media file. If you're unsure of
        # the language spoken in your media file, consider using IdentifyLanguage or IdentifyMultipleLanguages
        # to enable automatic language identification. Note that you must include one of LanguageCode ,
        # IdentifyLanguage , or IdentifyMultipleLanguages in your request. If you include more than one of
        # these parameters, your transcription job fails. For a list of supported languages and their
        # associated language codes, refer to the Supported languages table. To transcribe speech in Modern
        # Standard Arabic ( ar-SA ) in Amazon Web Services GovCloud (US) (US-West, us-gov-west-1), Amazon Web
        # Services GovCloud (US) (US-East, us-gov-east-1), Canada (Calgary, ca-west-1) and Africa (Cape Town,
        # af-south-1), your media file must be encoded at a sample rate of 16,000 Hz or higher.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # If using automatic language identification in your request and you want to apply a custom language
        # model, a custom vocabulary, or a custom vocabulary filter, include LanguageIdSettings with the
        # relevant sub-parameters ( VocabularyName , LanguageModelName , and VocabularyFilterName ). Note that
        # multi-language identification ( IdentifyMultipleLanguages ) doesn't support custom language models.
        # LanguageIdSettings supports two to five language codes. Each language code you include can have an
        # associated custom language model, custom vocabulary, and custom vocabulary filter. The language
        # codes that you specify must match the languages of the associated custom language models, custom
        # vocabularies, and custom vocabulary filters. It's recommended that you include LanguageOptions when
        # using LanguageIdSettings to ensure that the correct language dialect is identified. For example, if
        # you specify a custom vocabulary that is in en-US but Amazon Transcribe determines that the language
        # spoken in your media is en-AU , your custom vocabulary is not applied to your transcription. If you
        # include LanguageOptions and include en-US as the only English language dialect, your custom
        # vocabulary is applied to your transcription. If you want to include a custom language model with
        # your request but do not want to use automatic language identification, use instead the parameter
        # with the LanguageModelName sub-parameter. If you want to include a custom vocabulary or a custom
        # vocabulary filter (or both) with your request but do not want to use automatic language
        # identification, use instead the parameter with the VocabularyName or VocabularyFilterName (or both)
        # sub-parameter.
        @[JSON::Field(key: "LanguageIdSettings")]
        getter language_id_settings : Hash(String, Types::LanguageIdSettings)?

        # You can specify two or more language codes that represent the languages you think may be present in
        # your media. Including more than five is not recommended. If you're unsure what languages are
        # present, do not include this parameter. If you include LanguageOptions in your request, you must
        # also include IdentifyLanguage . For more information, refer to Supported languages . To transcribe
        # speech in Modern Standard Arabic ( ar-SA )in Amazon Web Services GovCloud (US) (US-West,
        # us-gov-west-1), Amazon Web Services GovCloud (US) (US-East, us-gov-east-1), in Canada (Calgary)
        # ca-west-1 and Africa (Cape Town) af-south-1, your media file must be encoded at a sample rate of
        # 16,000 Hz or higher.
        @[JSON::Field(key: "LanguageOptions")]
        getter language_options : Array(String)?

        # Specify the format of your input media file.
        @[JSON::Field(key: "MediaFormat")]
        getter media_format : String?

        # The sample rate, in hertz, of the audio track in your input media file. If you do not specify the
        # media sample rate, Amazon Transcribe determines it for you. If you specify the sample rate, it must
        # match the rate detected by Amazon Transcribe. If there's a mismatch between the value that you
        # specify and the value detected, your job fails. In most cases, you can omit MediaSampleRateHertz and
        # let Amazon Transcribe determine the sample rate.
        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # Specify the custom language model you want to include with your transcription job. If you include
        # ModelSettings in your request, you must include the LanguageModelName sub-parameter. For more
        # information, see Custom language models .
        @[JSON::Field(key: "ModelSettings")]
        getter model_settings : Types::ModelSettings?

        # The name of the Amazon S3 bucket where you want your transcription output stored. Do not include the
        # S3:// prefix of the specified bucket. If you want your output to go to a sub-folder of this bucket,
        # specify it using the OutputKey parameter; OutputBucketName only accepts the name of a bucket. For
        # example, if you want your output stored in S3://DOC-EXAMPLE-BUCKET , set OutputBucketName to
        # DOC-EXAMPLE-BUCKET . However, if you want your output stored in S3://DOC-EXAMPLE-BUCKET/test-files/
        # , set OutputBucketName to DOC-EXAMPLE-BUCKET and OutputKey to test-files/ . Note that Amazon
        # Transcribe must have permission to use the specified location. You can change Amazon S3 permissions
        # using the Amazon Web Services Management Console . See also Permissions Required for IAM User Roles
        # . If you do not specify OutputBucketName , your transcript is placed in a service-managed Amazon S3
        # bucket and you are provided with a URI to access your transcript.
        @[JSON::Field(key: "OutputBucketName")]
        getter output_bucket_name : String?

        # The Amazon Resource Name (ARN) of a KMS key that you want to use to encrypt your transcription
        # output. KMS key ARNs have the format arn:partition:kms:region:account:key/key-id . For example:
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . For more information,
        # see KMS key ARNs . If you do not specify an encryption key, your output is encrypted with the
        # default Amazon S3 key (SSE-S3). Note that the role making the request and the role specified in the
        # DataAccessRoleArn request parameter (if present) must have permission to use the specified KMS key.
        @[JSON::Field(key: "OutputEncryptionKMSKeyId")]
        getter output_encryption_kms_key_id : String?

        # Use in combination with OutputBucketName to specify the output location of your transcript and,
        # optionally, a unique name for your output file. The default name for your transcription output is
        # the same as the name you specified for your transcription job ( TranscriptionJobName ). Here are
        # some examples of how you can use OutputKey : If you specify 'DOC-EXAMPLE-BUCKET' as the
        # OutputBucketName and 'my-transcript.json' as the OutputKey , your transcription output path is
        # s3://DOC-EXAMPLE-BUCKET/my-transcript.json . If you specify 'my-first-transcription' as the
        # TranscriptionJobName , 'DOC-EXAMPLE-BUCKET' as the OutputBucketName , and 'my-transcript' as the
        # OutputKey , your transcription output path is
        # s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json . If you specify
        # 'DOC-EXAMPLE-BUCKET' as the OutputBucketName and 'test-files/my-transcript.json' as the OutputKey ,
        # your transcription output path is s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json . If you
        # specify 'my-first-transcription' as the TranscriptionJobName , 'DOC-EXAMPLE-BUCKET' as the
        # OutputBucketName , and 'test-files/my-transcript' as the OutputKey , your transcription output path
        # is s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json . If you specify the
        # name of an Amazon S3 bucket sub-folder that doesn't exist, one is created for you.
        @[JSON::Field(key: "OutputKey")]
        getter output_key : String?

        # Specify additional optional settings in your request, including channel identification, alternative
        # transcriptions, speaker partitioning. You can use that to apply custom vocabularies and vocabulary
        # filters. If you want to include a custom vocabulary or a custom vocabulary filter (or both) with
        # your request but do not want to use automatic language identification, use Settings with the
        # VocabularyName or VocabularyFilterName (or both) sub-parameter. If you're using automatic language
        # identification with your request and want to include a custom language model, a custom vocabulary,
        # or a custom vocabulary filter, use instead the parameter with the LanguageModelName , VocabularyName
        # or VocabularyFilterName sub-parameters.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::Settings?

        # Produces subtitle files for your input media. You can specify WebVTT (*.vtt) and SubRip (*.srt)
        # formats.
        @[JSON::Field(key: "Subtitles")]
        getter subtitles : Types::Subtitles?

        # Adds one or more custom tags, each in the form of a key:value pair, to a new transcription job at
        # the time you start this new job. To learn more about using tags with Amazon Transcribe, refer to
        # Tagging resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Enables toxic speech detection in your transcript. If you include ToxicityDetection in your request,
        # you must also include ToxicityCategories . For information on the types of toxic speech Amazon
        # Transcribe can detect, see Detecting toxic speech .
        @[JSON::Field(key: "ToxicityDetection")]
        getter toxicity_detection : Array(Types::ToxicityDetectionSettings)?

        def initialize(
          @media : Types::Media,
          @transcription_job_name : String,
          @content_redaction : Types::ContentRedaction? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @job_execution_settings : Types::JobExecutionSettings? = nil,
          @kms_encryption_context : Hash(String, String)? = nil,
          @language_code : String? = nil,
          @language_id_settings : Hash(String, Types::LanguageIdSettings)? = nil,
          @language_options : Array(String)? = nil,
          @media_format : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @model_settings : Types::ModelSettings? = nil,
          @output_bucket_name : String? = nil,
          @output_encryption_kms_key_id : String? = nil,
          @output_key : String? = nil,
          @settings : Types::Settings? = nil,
          @subtitles : Types::Subtitles? = nil,
          @tags : Array(Types::Tag)? = nil,
          @toxicity_detection : Array(Types::ToxicityDetectionSettings)? = nil
        )
        end
      end

      struct StartTranscriptionJobResponse
        include JSON::Serializable

        # Provides detailed information about the current transcription job, including job status and, if
        # applicable, failure reason.
        @[JSON::Field(key: "TranscriptionJob")]
        getter transcription_job : Types::TranscriptionJob?

        def initialize(
          @transcription_job : Types::TranscriptionJob? = nil
        )
        end
      end

      # Generate subtitles for your media file with your transcription request. You can choose a start index
      # of 0 or 1, and you can specify either WebVTT or SubRip (or both) as your output format. Note that
      # your subtitle files are placed in the same location as your transcription output.
      struct Subtitles
        include JSON::Serializable

        # Specify the output format for your subtitle file; if you select both WebVTT ( vtt ) and SubRip ( srt
        # ) formats, two output files are generated.
        @[JSON::Field(key: "Formats")]
        getter formats : Array(String)?

        # Specify the starting value that is assigned to the first subtitle segment. The default start index
        # for Amazon Transcribe is 0 , which differs from the more widely used standard of 1 . If you're
        # uncertain which value to use, we recommend choosing 1 , as this may improve compatibility with other
        # services.
        @[JSON::Field(key: "OutputStartIndex")]
        getter output_start_index : Int32?

        def initialize(
          @formats : Array(String)? = nil,
          @output_start_index : Int32? = nil
        )
        end
      end

      # Provides information about your subtitle file, including format, start index, and Amazon S3
      # location.
      struct SubtitlesOutput
        include JSON::Serializable

        # Provides the format of your subtitle files. If your request included both WebVTT ( vtt ) and SubRip
        # ( srt ) formats, both formats are shown.
        @[JSON::Field(key: "Formats")]
        getter formats : Array(String)?

        # Provides the start index value for your subtitle files. If you did not specify a value in your
        # request, the default value of 0 is used.
        @[JSON::Field(key: "OutputStartIndex")]
        getter output_start_index : Int32?

        # The Amazon S3 location of your transcript. You can use this URI to access or download your subtitle
        # file. Your subtitle file is stored in the same location as your transcript. If you specified both
        # WebVTT and SubRip subtitle formats, two URIs are provided. If you included OutputBucketName in your
        # transcription job request, this is the URI of that bucket. If you also included OutputKey in your
        # request, your output is located in the path you specified in your request. If you didn't include
        # OutputBucketName in your transcription job request, your subtitle file is stored in a
        # service-managed bucket, and TranscriptFileUri provides you with a temporary URI you can use for
        # secure access to your subtitle file. Temporary URIs for service-managed Amazon S3 buckets are only
        # valid for 15 minutes. If you get an AccesDenied error, you can get a new temporary URI by running a
        # GetTranscriptionJob or ListTranscriptionJob request.
        @[JSON::Field(key: "SubtitleFileUris")]
        getter subtitle_file_uris : Array(String)?

        def initialize(
          @formats : Array(String)? = nil,
          @output_start_index : Int32? = nil,
          @subtitle_file_uris : Array(String)? = nil
        )
        end
      end

      # Contains GenerateAbstractiveSummary , which is a required parameter if you want to enable Generative
      # call summarization in your Call Analytics request.
      struct Summarization
        include JSON::Serializable

        # Enables Generative call summarization in your Call Analytics request Generative call summarization
        # provides a summary of the transcript including important components discussed in the conversation.
        # For more information, see Enabling generative call summarization .
        @[JSON::Field(key: "GenerateAbstractiveSummary")]
        getter generate_abstractive_summary : Bool

        def initialize(
          @generate_abstractive_summary : Bool
        )
        end
      end

      # Adds metadata, in the form of a key:value pair, to the specified resource. For example, you could
      # add the tag Department:Sales to a resource to indicate that it pertains to your organization's sales
      # department. You can also use tags for tag-based access control. To learn more about tagging, see
      # Tagging resources .
      struct Tag
        include JSON::Serializable

        # The first part of a key:value pair that forms a tag associated with a given resource. For example,
        # in the tag Department:Sales , the key is 'Department'.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The second part of a key:value pair that forms a tag associated with a given resource. For example,
        # in the tag Department:Sales , the value is 'Sales'. Note that you can set the value of a tag to an
        # empty string, but you can't set the value of a tag to null. Omitting the tag value is the same as
        # using an empty string.
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

        # The Amazon Resource Name (ARN) of the resource you want to tag. ARNs have the format
        # arn:partition:service:region:account-id:resource-type/resource-id . For example,
        # arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name . Valid values
        # for resource-type are: transcription-job , medical-transcription-job , vocabulary ,
        # medical-vocabulary , vocabulary-filter , and language-model .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Adds one or more custom tags, each in the form of a key:value pair, to the specified resource. To
        # learn more about using tags with Amazon Transcribe, refer to Tagging resources .
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

      # Contains ToxicityCategories , which is a required parameter if you want to enable toxicity detection
      # ( ToxicityDetection ) in your transcription request.
      struct ToxicityDetectionSettings
        include JSON::Serializable

        # If you include ToxicityDetection in your transcription request, you must also include
        # ToxicityCategories . The only accepted value for this parameter is ALL .
        @[JSON::Field(key: "ToxicityCategories")]
        getter toxicity_categories : Array(String)

        def initialize(
          @toxicity_categories : Array(String)
        )
        end
      end

      # Provides you with the Amazon S3 URI you can use to access your transcript.
      struct Transcript
        include JSON::Serializable

        # The Amazon S3 location of your redacted transcript. You can use this URI to access or download your
        # transcript. If you included OutputBucketName in your transcription job request, this is the URI of
        # that bucket. If you also included OutputKey in your request, your output is located in the path you
        # specified in your request. If you didn't include OutputBucketName in your transcription job request,
        # your transcript is stored in a service-managed bucket, and RedactedTranscriptFileUri provides you
        # with a temporary URI you can use for secure access to your transcript. Temporary URIs for
        # service-managed Amazon S3 buckets are only valid for 15 minutes. If you get an AccesDenied error,
        # you can get a new temporary URI by running a GetTranscriptionJob or ListTranscriptionJob request.
        @[JSON::Field(key: "RedactedTranscriptFileUri")]
        getter redacted_transcript_file_uri : String?

        # The Amazon S3 location of your transcript. You can use this URI to access or download your
        # transcript. If you included OutputBucketName in your transcription job request, this is the URI of
        # that bucket. If you also included OutputKey in your request, your output is located in the path you
        # specified in your request. If you didn't include OutputBucketName in your transcription job request,
        # your transcript is stored in a service-managed bucket, and TranscriptFileUri provides you with a
        # temporary URI you can use for secure access to your transcript. Temporary URIs for service-managed
        # Amazon S3 buckets are only valid for 15 minutes. If you get an AccesDenied error, you can get a new
        # temporary URI by running a GetTranscriptionJob or ListTranscriptionJob request.
        @[JSON::Field(key: "TranscriptFileUri")]
        getter transcript_file_uri : String?

        def initialize(
          @redacted_transcript_file_uri : String? = nil,
          @transcript_file_uri : String? = nil
        )
        end
      end

      # Flag the presence or absence of specific words or phrases detected in your Call Analytics
      # transcription output. Rules using TranscriptFilter are designed to match: Custom words or phrases
      # spoken by the agent, the customer, or both Custom words or phrases not spoken by the agent, the
      # customer, or either Custom words or phrases that occur at a specific time frame See Rule criteria
      # for post-call categories and Rule criteria for streaming categories for usage examples.
      struct TranscriptFilter
        include JSON::Serializable

        # Specify the phrases that you want to flag.
        @[JSON::Field(key: "Targets")]
        getter targets : Array(String)

        # Flag the presence or absence of an exact match to the phrases that you specify. For example, if you
        # specify the phrase "speak to a manager" as your Targets value, only that exact phrase is flagged.
        # Note that semantic matching is not supported. For example, if your customer says "speak to the
        # manager", instead of "speak to a manager", your content is not flagged.
        @[JSON::Field(key: "TranscriptFilterType")]
        getter transcript_filter_type : String

        # Makes it possible to specify a time range (in milliseconds) in your audio, during which you want to
        # search for the specified key words or phrases. See for more detail.
        @[JSON::Field(key: "AbsoluteTimeRange")]
        getter absolute_time_range : Types::AbsoluteTimeRange?

        # Set to TRUE to flag the absence of the phrase that you specified in your request. Set to FALSE to
        # flag the presence of the phrase that you specified in your request.
        @[JSON::Field(key: "Negate")]
        getter negate : Bool?

        # Specify the participant that you want to flag. Omitting this parameter is equivalent to specifying
        # both participants.
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        # Makes it possible to specify a time range (in percentage) in your media file, during which you want
        # to search for the specified key words or phrases. See for more detail.
        @[JSON::Field(key: "RelativeTimeRange")]
        getter relative_time_range : Types::RelativeTimeRange?

        def initialize(
          @targets : Array(String),
          @transcript_filter_type : String,
          @absolute_time_range : Types::AbsoluteTimeRange? = nil,
          @negate : Bool? = nil,
          @participant_role : String? = nil,
          @relative_time_range : Types::RelativeTimeRange? = nil
        )
        end
      end

      # Provides detailed information about a transcription job. To view the status of the specified
      # transcription job, check the TranscriptionJobStatus field. If the status is COMPLETED , the job is
      # finished and you can find the results at the location specified in TranscriptFileUri . If the status
      # is FAILED , FailureReason provides details on why your transcription job failed. If you enabled
      # content redaction, the redacted transcript can be found at the location specified in
      # RedactedTranscriptFileUri .
      struct TranscriptionJob
        include JSON::Serializable

        # The date and time the specified transcription job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # Indicates whether redaction was enabled in your transcript.
        @[JSON::Field(key: "ContentRedaction")]
        getter content_redaction : Types::ContentRedaction?

        # The date and time the specified transcription job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If TranscriptionJobStatus is FAILED , FailureReason contains information about why the transcription
        # job request failed. The FailureReason field contains one of the following values: Unsupported media
        # format . The media format specified in MediaFormat isn't valid. Refer to refer to the MediaFormat
        # parameter for a list of supported formats. The media format provided does not match the detected
        # media format . The media format specified in MediaFormat doesn't match the format of the input file.
        # Check the media format of your media file and correct the specified value. Invalid sample rate for
        # audio file . The sample rate specified in MediaSampleRateHertz isn't valid. The sample rate must be
        # between 8,000 and 48,000 hertz. The sample rate provided does not match the detected sample rate .
        # The sample rate specified in MediaSampleRateHertz doesn't match the sample rate detected in your
        # input media file. Check the sample rate of your media file and correct the specified value. Invalid
        # file size: file size too large . The size of your media file is larger than what Amazon Transcribe
        # can process. For more information, refer to Service quotas . Invalid number of channels: number of
        # channels too large . Your audio contains more channels than Amazon Transcribe is able to process.
        # For more information, refer to Service quotas .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The confidence score associated with the language identified in your media file. Confidence scores
        # are values between 0 and 1; a larger value indicates a higher probability that the identified
        # language correctly matches the language spoken in your media.
        @[JSON::Field(key: "IdentifiedLanguageScore")]
        getter identified_language_score : Float64?

        # Indicates whether automatic language identification was enabled ( TRUE ) for the specified
        # transcription job.
        @[JSON::Field(key: "IdentifyLanguage")]
        getter identify_language : Bool?

        # Indicates whether automatic multi-language identification was enabled ( TRUE ) for the specified
        # transcription job.
        @[JSON::Field(key: "IdentifyMultipleLanguages")]
        getter identify_multiple_languages : Bool?

        # Provides information about how your transcription job was processed. This parameter shows if your
        # request was queued and what data access role was used.
        @[JSON::Field(key: "JobExecutionSettings")]
        getter job_execution_settings : Types::JobExecutionSettings?

        # The language code used to create your transcription job. This parameter is used with single-language
        # identification. For multi-language identification requests, refer to the plural version of this
        # parameter, LanguageCodes .
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The language codes used to create your transcription job. This parameter is used with multi-language
        # identification. For single-language identification requests, refer to the singular version of this
        # parameter, LanguageCode .
        @[JSON::Field(key: "LanguageCodes")]
        getter language_codes : Array(Types::LanguageCodeItem)?

        # Provides the name and language of all custom language models, custom vocabularies, and custom
        # vocabulary filters that you included in your request.
        @[JSON::Field(key: "LanguageIdSettings")]
        getter language_id_settings : Hash(String, Types::LanguageIdSettings)?

        # Provides the language codes you specified in your request.
        @[JSON::Field(key: "LanguageOptions")]
        getter language_options : Array(String)?

        # Provides the Amazon S3 location of the media file you used in your request.
        @[JSON::Field(key: "Media")]
        getter media : Types::Media?

        # The format of the input media file.
        @[JSON::Field(key: "MediaFormat")]
        getter media_format : String?

        # The sample rate, in hertz, of the audio track in your input media file.
        @[JSON::Field(key: "MediaSampleRateHertz")]
        getter media_sample_rate_hertz : Int32?

        # Provides information on the custom language model you included in your request.
        @[JSON::Field(key: "ModelSettings")]
        getter model_settings : Types::ModelSettings?

        # Provides information on any additional settings that were included in your request. Additional
        # settings include channel identification, alternative transcriptions, speaker partitioning, custom
        # vocabularies, and custom vocabulary filters.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::Settings?

        # The date and time the specified transcription job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Indicates whether subtitles were generated with your transcription.
        @[JSON::Field(key: "Subtitles")]
        getter subtitles : Types::SubtitlesOutput?

        # The tags, each in the form of a key:value pair, assigned to the specified transcription job.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Provides information about the toxicity detection settings applied to your transcription.
        @[JSON::Field(key: "ToxicityDetection")]
        getter toxicity_detection : Array(Types::ToxicityDetectionSettings)?

        # Provides you with the Amazon S3 URI you can use to access your transcript.
        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::Transcript?

        # The name of the transcription job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "TranscriptionJobName")]
        getter transcription_job_name : String?

        # Provides the status of the specified transcription job. If the status is COMPLETED , the job is
        # finished and you can find the results at the location specified in TranscriptFileUri (or
        # RedactedTranscriptFileUri , if you requested transcript redaction). If the status is FAILED ,
        # FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "TranscriptionJobStatus")]
        getter transcription_job_status : String?

        def initialize(
          @completion_time : Time? = nil,
          @content_redaction : Types::ContentRedaction? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @identified_language_score : Float64? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @job_execution_settings : Types::JobExecutionSettings? = nil,
          @language_code : String? = nil,
          @language_codes : Array(Types::LanguageCodeItem)? = nil,
          @language_id_settings : Hash(String, Types::LanguageIdSettings)? = nil,
          @language_options : Array(String)? = nil,
          @media : Types::Media? = nil,
          @media_format : String? = nil,
          @media_sample_rate_hertz : Int32? = nil,
          @model_settings : Types::ModelSettings? = nil,
          @settings : Types::Settings? = nil,
          @start_time : Time? = nil,
          @subtitles : Types::SubtitlesOutput? = nil,
          @tags : Array(Types::Tag)? = nil,
          @toxicity_detection : Array(Types::ToxicityDetectionSettings)? = nil,
          @transcript : Types::Transcript? = nil,
          @transcription_job_name : String? = nil,
          @transcription_job_status : String? = nil
        )
        end
      end

      # Provides detailed information about a specific transcription job.
      struct TranscriptionJobSummary
        include JSON::Serializable

        # The date and time the specified transcription job finished processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:33:13.922000-07:00 represents a
        # transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CompletionTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_time : Time?

        # The content redaction settings of the transcription job.
        @[JSON::Field(key: "ContentRedaction")]
        getter content_redaction : Types::ContentRedaction?

        # The date and time the specified transcription job request was made. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # If TranscriptionJobStatus is FAILED , FailureReason contains information about why the transcription
        # job failed. See also: Common Errors .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The confidence score associated with the language identified in your media file. Confidence scores
        # are values between 0 and 1; a larger value indicates a higher probability that the identified
        # language correctly matches the language spoken in your media.
        @[JSON::Field(key: "IdentifiedLanguageScore")]
        getter identified_language_score : Float64?

        # Indicates whether automatic language identification was enabled ( TRUE ) for the specified
        # transcription job.
        @[JSON::Field(key: "IdentifyLanguage")]
        getter identify_language : Bool?

        # Indicates whether automatic multi-language identification was enabled ( TRUE ) for the specified
        # transcription job.
        @[JSON::Field(key: "IdentifyMultipleLanguages")]
        getter identify_multiple_languages : Bool?

        # The language code used to create your transcription.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The language codes used to create your transcription job. This parameter is used with multi-language
        # identification. For single-language identification, the singular version of this parameter,
        # LanguageCode , is present.
        @[JSON::Field(key: "LanguageCodes")]
        getter language_codes : Array(Types::LanguageCodeItem)?

        @[JSON::Field(key: "ModelSettings")]
        getter model_settings : Types::ModelSettings?

        # Indicates where the specified transcription output is stored. If the value is CUSTOMER_BUCKET , the
        # location is the Amazon S3 bucket you specified using the OutputBucketName parameter in your request.
        # If you also included OutputKey in your request, your output is located in the path you specified in
        # your request. If the value is SERVICE_BUCKET , the location is a service-managed Amazon S3 bucket.
        # To access a transcript stored in a service-managed bucket, use the URI shown in the
        # TranscriptFileUri or RedactedTranscriptFileUri field.
        @[JSON::Field(key: "OutputLocationType")]
        getter output_location_type : String?

        # The date and time your transcription job began processing. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.789000-07:00 represents a
        # transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Indicates whether toxicity detection was enabled for the specified transcription job.
        @[JSON::Field(key: "ToxicityDetection")]
        getter toxicity_detection : Array(Types::ToxicityDetectionSettings)?

        # The name of the transcription job. Job names are case sensitive and must be unique within an Amazon
        # Web Services account.
        @[JSON::Field(key: "TranscriptionJobName")]
        getter transcription_job_name : String?

        # Provides the status of your transcription job. If the status is COMPLETED , the job is finished and
        # you can find the results at the location specified in TranscriptFileUri (or
        # RedactedTranscriptFileUri , if you requested transcript redaction). If the status is FAILED ,
        # FailureReason provides details on why your transcription job failed.
        @[JSON::Field(key: "TranscriptionJobStatus")]
        getter transcription_job_status : String?

        def initialize(
          @completion_time : Time? = nil,
          @content_redaction : Types::ContentRedaction? = nil,
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @identified_language_score : Float64? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @language_code : String? = nil,
          @language_codes : Array(Types::LanguageCodeItem)? = nil,
          @model_settings : Types::ModelSettings? = nil,
          @output_location_type : String? = nil,
          @start_time : Time? = nil,
          @toxicity_detection : Array(Types::ToxicityDetectionSettings)? = nil,
          @transcription_job_name : String? = nil,
          @transcription_job_status : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to remove tags from. ARNs
        # have the format arn:partition:service:region:account-id:resource-type/resource-id . For example,
        # arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name . Valid values
        # for resource-type are: transcription-job , medical-transcription-job , vocabulary ,
        # medical-vocabulary , vocabulary-filter , and language-model .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Removes the specified tag keys from the specified Amazon Transcribe resource.
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

      struct UpdateCallAnalyticsCategoryRequest
        include JSON::Serializable

        # The name of the Call Analytics category you want to update. Category names are case sensitive.
        @[JSON::Field(key: "CategoryName")]
        getter category_name : String

        # The rules used for the updated Call Analytics category. The rules you provide in this field replace
        # the ones that are currently being used in the specified category.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # Choose whether you want to update a real-time or a post-call category. The input type you specify
        # must match the input type specified when the category was created. For example, if you created a
        # category with the POST_CALL input type, you must use POST_CALL as the input type when updating this
        # category.
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        def initialize(
          @category_name : String,
          @rules : Array(Types::Rule),
          @input_type : String? = nil
        )
        end
      end

      struct UpdateCallAnalyticsCategoryResponse
        include JSON::Serializable

        # Provides you with the properties of the Call Analytics category you specified in your
        # UpdateCallAnalyticsCategory request.
        @[JSON::Field(key: "CategoryProperties")]
        getter category_properties : Types::CategoryProperties?

        def initialize(
          @category_properties : Types::CategoryProperties? = nil
        )
        end
      end

      struct UpdateMedicalVocabularyRequest
        include JSON::Serializable

        # The language code that represents the language of the entries in the custom vocabulary you want to
        # update. US English ( en-US ) is the only language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The Amazon S3 location of the text file that contains your custom medical vocabulary. The URI must
        # be located in the same Amazon Web Services Region as the resource you're calling. Here's an example
        # URI path: s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt
        @[JSON::Field(key: "VocabularyFileUri")]
        getter vocabulary_file_uri : String

        # The name of the custom medical vocabulary you want to update. Custom medical vocabulary names are
        # case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        def initialize(
          @language_code : String,
          @vocabulary_file_uri : String,
          @vocabulary_name : String
        )
        end
      end

      struct UpdateMedicalVocabularyResponse
        include JSON::Serializable

        # The language code you selected for your custom medical vocabulary. US English ( en-US ) is the only
        # language supported with Amazon Transcribe Medical.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom medical vocabulary was last updated. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the updated custom medical vocabulary.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom medical vocabulary. If the state is READY , you can use the
        # custom vocabulary in a StartMedicalTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      struct UpdateVocabularyFilterRequest
        include JSON::Serializable

        # The name of the custom vocabulary filter you want to update. Custom vocabulary filter names are case
        # sensitive.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files (in this case, your custom vocabulary filter). If the role that you
        # specify doesn’t have the appropriate permissions to access the specified Amazon S3 location, your
        # request fails. IAM role ARNs have the format arn:partition:iam::account:role/role-name-with-path .
        # For example: arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The Amazon S3 location of the text file that contains your custom vocabulary filter terms. The URI
        # must be located in the same Amazon Web Services Region as the resource you're calling. Here's an
        # example URI path: s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt Note that if you include
        # VocabularyFilterFileUri in your request, you cannot use Words ; you must choose one or the other.
        @[JSON::Field(key: "VocabularyFilterFileUri")]
        getter vocabulary_filter_file_uri : String?

        # Use this parameter if you want to update your custom vocabulary filter by including all desired
        # terms, as comma-separated values, within your request. The other option for updating your vocabulary
        # filter is to save your entries in a text file and upload them to an Amazon S3 bucket, then specify
        # the location of your file using the VocabularyFilterFileUri parameter. Note that if you include
        # Words in your request, you cannot use VocabularyFilterFileUri ; you must choose one or the other.
        # Each language has a character set that contains all allowed characters for that specific language.
        # If you use unsupported characters, your custom vocabulary filter request fails. Refer to Character
        # Sets for Custom Vocabularies to get the character set for your language.
        @[JSON::Field(key: "Words")]
        getter words : Array(String)?

        def initialize(
          @vocabulary_filter_name : String,
          @data_access_role_arn : String? = nil,
          @vocabulary_filter_file_uri : String? = nil,
          @words : Array(String)? = nil
        )
        end
      end

      struct UpdateVocabularyFilterResponse
        include JSON::Serializable

        # The language code you selected for your custom vocabulary filter.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary filter was last updated. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the updated custom vocabulary filter.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_filter_name : String? = nil
        )
        end
      end

      struct UpdateVocabularyRequest
        include JSON::Serializable

        # The language code that represents the language of the entries in the custom vocabulary you want to
        # update. Each custom vocabulary must contain terms in only one language. A custom vocabulary can only
        # be used to transcribe files in the same language as the custom vocabulary. For example, if you
        # create a custom vocabulary using US English ( en-US ), you can only apply this custom vocabulary to
        # files that contain English audio. For a list of supported languages and their associated language
        # codes, refer to the Supported languages table.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The name of the custom vocabulary you want to update. Custom vocabulary names are case sensitive.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String

        # The Amazon Resource Name (ARN) of an IAM role that has permissions to access the Amazon S3 bucket
        # that contains your input files (in this case, your custom vocabulary). If the role that you specify
        # doesn’t have the appropriate permissions to access the specified Amazon S3 location, your request
        # fails. IAM role ARNs have the format arn:partition:iam::account:role/role-name-with-path . For
        # example: arn:aws:iam::111122223333:role/Admin . For more information, see IAM ARNs .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Use this parameter if you want to update your custom vocabulary by including all desired terms, as
        # comma-separated values, within your request. The other option for updating your custom vocabulary is
        # to save your entries in a text file and upload them to an Amazon S3 bucket, then specify the
        # location of your file using the VocabularyFileUri parameter. Note that if you include Phrases in
        # your request, you cannot use VocabularyFileUri ; you must choose one or the other. Each language has
        # a character set that contains all allowed characters for that specific language. If you use
        # unsupported characters, your custom vocabulary filter request fails. Refer to Character Sets for
        # Custom Vocabularies to get the character set for your language.
        @[JSON::Field(key: "Phrases")]
        getter phrases : Array(String)?

        # The Amazon S3 location of the text file that contains your custom vocabulary. The URI must be
        # located in the same Amazon Web Services Region as the resource you're calling. Here's an example URI
        # path: s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt Note that if you include VocabularyFileUri in your
        # request, you cannot use the Phrases flag; you must choose one or the other.
        @[JSON::Field(key: "VocabularyFileUri")]
        getter vocabulary_file_uri : String?

        def initialize(
          @language_code : String,
          @vocabulary_name : String,
          @data_access_role_arn : String? = nil,
          @phrases : Array(String)? = nil,
          @vocabulary_file_uri : String? = nil
        )
        end
      end

      struct UpdateVocabularyResponse
        include JSON::Serializable

        # The language code you selected for your custom vocabulary.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary was last updated. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the updated custom vocabulary.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom vocabulary. If the state is READY , you can use the custom
        # vocabulary in a StartTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end

      # Provides information about a custom vocabulary filter, including the language of the filter, when it
      # was last modified, and its name.
      struct VocabularyFilterInfo
        include JSON::Serializable

        # The language code that represents the language of the entries in your vocabulary filter. Each custom
        # vocabulary filter must contain terms in only one language. A custom vocabulary filter can only be
        # used to transcribe files in the same language as the filter. For example, if you create a custom
        # vocabulary filter using US English ( en-US ), you can only apply this filter to files that contain
        # English audio. For a list of supported languages and their associated language codes, refer to the
        # Supported languages table.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary filter was last modified. Timestamps are in the
        # format YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents
        # 12:32 PM UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # A unique name, chosen by you, for your custom vocabulary filter. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_filter_name : String? = nil
        )
        end
      end

      # Provides information about a custom vocabulary, including the language of the custom vocabulary,
      # when it was last modified, its name, and the processing state.
      struct VocabularyInfo
        include JSON::Serializable

        # The language code used to create your custom vocabulary. Each custom vocabulary must contain terms
        # in only one language. A custom vocabulary can only be used to transcribe files in the same language
        # as the custom vocabulary. For example, if you create a custom vocabulary using US English ( en-US ),
        # you can only apply this custom vocabulary to files that contain English audio.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The date and time the specified custom vocabulary was last modified. Timestamps are in the format
        # YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC . For example, 2022-05-04T12:32:58.761000-07:00 represents 12:32 PM
        # UTC-7 on May 4, 2022.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # A unique name, chosen by you, for your custom vocabulary. This name is case sensitive, cannot
        # contain spaces, and must be unique within an Amazon Web Services account.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The processing state of your custom vocabulary. If the state is READY , you can use the custom
        # vocabulary in a StartTranscriptionJob request.
        @[JSON::Field(key: "VocabularyState")]
        getter vocabulary_state : String?

        def initialize(
          @language_code : String? = nil,
          @last_modified_time : Time? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_state : String? = nil
        )
        end
      end
    end
  end
end
