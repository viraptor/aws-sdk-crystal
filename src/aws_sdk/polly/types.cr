require "json"
require "time"

module AwsSdk
  module Polly
    module Types


      struct DeleteLexiconInput
        include JSON::Serializable

        # The name of the lexicon to delete. Must be an existing lexicon in the region.

        @[JSON::Field(key: "LexiconName")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteLexiconOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeVoicesInput
        include JSON::Serializable

        # Specifies the engine ( standard , neural , long-form or generative ) used by Amazon Polly when
        # processing input text for speech synthesis.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Boolean value indicating whether to return any bilingual voices that use the specified language as
        # an additional language. For instance, if you request all languages that use US English (es-US), and
        # there is an Italian voice that speaks both Italian (it-IT) and US English, that voice will be
        # included if you specify yes but not if you specify no .

        @[JSON::Field(key: "IncludeAdditionalLanguageCodes")]
        getter include_additional_language_codes : Bool?

        # The language identification tag (ISO 639 code for the language name-ISO 3166 country code) for
        # filtering the list of voices returned. If you don't specify this optional parameter, all available
        # voices are returned.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # An opaque pagination token returned from the previous DescribeVoices operation. If present, this
        # indicates where to continue the listing.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engine : String? = nil,
          @include_additional_language_codes : Bool? = nil,
          @language_code : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeVoicesOutput
        include JSON::Serializable

        # The pagination token to use in the next request to continue the listing of voices. NextToken is
        # returned only if the response is truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of voices with their properties.

        @[JSON::Field(key: "Voices")]
        getter voices : Array(Types::Voice)?

        def initialize(
          @next_token : String? = nil,
          @voices : Array(Types::Voice)? = nil
        )
        end
      end

      # This engine is not compatible with the voice that you have designated. Choose a new voice that is
      # compatible with the engine or change the engine and restart the operation.

      struct EngineNotSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetLexiconInput
        include JSON::Serializable

        # Name of the lexicon.

        @[JSON::Field(key: "LexiconName")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetLexiconOutput
        include JSON::Serializable

        # Lexicon object that provides name and the string content of the lexicon.

        @[JSON::Field(key: "Lexicon")]
        getter lexicon : Types::Lexicon?

        # Metadata of the lexicon, including phonetic alphabetic used, language code, lexicon ARN, number of
        # lexemes defined in the lexicon, and size of lexicon in bytes.

        @[JSON::Field(key: "LexiconAttributes")]
        getter lexicon_attributes : Types::LexiconAttributes?

        def initialize(
          @lexicon : Types::Lexicon? = nil,
          @lexicon_attributes : Types::LexiconAttributes? = nil
        )
        end
      end


      struct GetSpeechSynthesisTaskInput
        include JSON::Serializable

        # The Amazon Polly generated identifier for a speech synthesis task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct GetSpeechSynthesisTaskOutput
        include JSON::Serializable

        # SynthesisTask object that provides information from the requested task, including output format,
        # creation time, task status, and so on.

        @[JSON::Field(key: "SynthesisTask")]
        getter synthesis_task : Types::SynthesisTask?

        def initialize(
          @synthesis_task : Types::SynthesisTask? = nil
        )
        end
      end

      # Amazon Polly can't find the specified lexicon. Verify that the lexicon's name is spelled correctly,
      # and then try again.

      struct InvalidLexiconException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The NextToken is invalid. Verify that it's spelled correctly, and then try again.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided Amazon S3 bucket name is invalid. Please check your input with S3 bucket naming
      # requirements and try again.

      struct InvalidS3BucketException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided Amazon S3 key prefix is invalid. Please provide a valid S3 object key name.

      struct InvalidS3KeyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified sample rate is not valid.

      struct InvalidSampleRateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided SNS topic ARN is invalid. Please provide a valid SNS topic ARN and try again.

      struct InvalidSnsTopicArnException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The SSML you provided is invalid. Verify the SSML syntax, spelling of tags and values, and then try
      # again.

      struct InvalidSsmlException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided Task ID is not valid. Please provide a valid Task ID and try again.

      struct InvalidTaskIdException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The language specified is not currently supported by Amazon Polly in this capacity.

      struct LanguageNotSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides lexicon name and lexicon content in string format. For more information, see Pronunciation
      # Lexicon Specification (PLS) Version 1.0 .

      struct Lexicon
        include JSON::Serializable

        # Lexicon content in string format. The content of a lexicon must be in PLS format.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # Name of the lexicon.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @content : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains metadata describing the lexicon such as the number of lexemes, language code, and so on.
      # For more information, see Managing Lexicons .

      struct LexiconAttributes
        include JSON::Serializable

        # Phonetic alphabet used in the lexicon. Valid values are ipa and x-sampa .

        @[JSON::Field(key: "Alphabet")]
        getter alphabet : String?

        # Language code that the lexicon applies to. A lexicon with a language code such as "en" would be
        # applied to all English languages (en-GB, en-US, en-AUS, en-WLS, and so on.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # Date lexicon was last modified (a timestamp value).

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # Number of lexemes in the lexicon.

        @[JSON::Field(key: "LexemesCount")]
        getter lexemes_count : Int32?

        # Amazon Resource Name (ARN) of the lexicon.

        @[JSON::Field(key: "LexiconArn")]
        getter lexicon_arn : String?

        # Total size of the lexicon, in characters.

        @[JSON::Field(key: "Size")]
        getter size : Int32?

        def initialize(
          @alphabet : String? = nil,
          @language_code : String? = nil,
          @last_modified : Time? = nil,
          @lexemes_count : Int32? = nil,
          @lexicon_arn : String? = nil,
          @size : Int32? = nil
        )
        end
      end

      # Describes the content of the lexicon.

      struct LexiconDescription
        include JSON::Serializable

        # Provides lexicon metadata.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Types::LexiconAttributes?

        # Name of the lexicon.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @attributes : Types::LexiconAttributes? = nil,
          @name : String? = nil
        )
        end
      end

      # Amazon Polly can't find the specified lexicon. This could be caused by a lexicon that is missing,
      # its name is misspelled or specifying a lexicon that is in a different region. Verify that the
      # lexicon exists, is in the region (see ListLexicons ) and that you spelled its name is spelled
      # correctly. Then try again.

      struct LexiconNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum size of the specified lexicon would be exceeded by this operation.

      struct LexiconSizeExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListLexiconsInput
        include JSON::Serializable

        # An opaque pagination token returned from previous ListLexicons operation. If present, indicates
        # where to continue the list of lexicons.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListLexiconsOutput
        include JSON::Serializable

        # A list of lexicon names and attributes.

        @[JSON::Field(key: "Lexicons")]
        getter lexicons : Array(Types::LexiconDescription)?

        # The pagination token to use in the next request to continue the listing of lexicons. NextToken is
        # returned only if the response is truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lexicons : Array(Types::LexiconDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpeechSynthesisTasksInput
        include JSON::Serializable

        # Maximum number of speech synthesis tasks returned in a List operation.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use in the next request to continue the listing of speech synthesis tasks.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Status of the speech synthesis tasks returned in a List operation

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListSpeechSynthesisTasksOutput
        include JSON::Serializable

        # An opaque pagination token returned from the previous List operation in this request. If present,
        # this indicates where to continue the listing.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of SynthesisTask objects that provides information from the specified task in the list request,
        # including output format, creation time, task status, and so on.

        @[JSON::Field(key: "SynthesisTasks")]
        getter synthesis_tasks : Array(Types::SynthesisTask)?

        def initialize(
          @next_token : String? = nil,
          @synthesis_tasks : Array(Types::SynthesisTask)? = nil
        )
        end
      end

      # Speech marks are not supported for the OutputFormat selected. Speech marks are only available for
      # content in json format.

      struct MarksNotSupportedForFormatException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum size of the lexeme would be exceeded by this operation.

      struct MaxLexemeLengthExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of lexicons would be exceeded by this operation.

      struct MaxLexiconsNumberExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutLexiconInput
        include JSON::Serializable

        # Content of the PLS lexicon as string data.

        @[JSON::Field(key: "Content")]
        getter content : String

        # Name of the lexicon. The name must follow the regular express format [0-9A-Za-z]{1,20}. That is, the
        # name is a case-sensitive alphanumeric string up to 20 characters long.

        @[JSON::Field(key: "LexiconName")]
        getter name : String

        def initialize(
          @content : String,
          @name : String
        )
        end
      end


      struct PutLexiconOutput
        include JSON::Serializable

        def initialize
        end
      end

      # An unknown condition has caused a service failure.

      struct ServiceFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # SSML speech marks are not supported for plain text-type input.

      struct SsmlMarksNotSupportedForTextTypeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartSpeechSynthesisTaskInput
        include JSON::Serializable

        # The format in which the returned output will be encoded. For audio stream, this will be mp3,
        # ogg_vorbis, or pcm. For speech marks, this will be json.

        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String

        # Amazon S3 bucket name to which the output file will be saved.

        @[JSON::Field(key: "OutputS3BucketName")]
        getter output_s3_bucket_name : String

        # The input text to synthesize. If you specify ssml as the TextType, follow the SSML format for the
        # input text.

        @[JSON::Field(key: "Text")]
        getter text : String

        # Voice ID to use for the synthesis.

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String

        # Specifies the engine ( standard , neural , long-form or generative ) for Amazon Polly to use when
        # processing input text for speech synthesis. Using a voice that is not supported for the engine
        # selected will result in an error.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Optional language code for the Speech Synthesis request. This is only necessary if using a bilingual
        # voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). If a
        # bilingual voice is used and no language code is specified, Amazon Polly uses the default language of
        # the bilingual voice. The default language for any voice is the one returned by the DescribeVoices
        # operation for the LanguageCode parameter. For example, if no language code is specified, Aditi will
        # use Indian English rather than Hindi.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # List of one or more pronunciation lexicon names you want the service to apply during synthesis.
        # Lexicons are applied only if the language of the lexicon is the same as the language of the voice.

        @[JSON::Field(key: "LexiconNames")]
        getter lexicon_names : Array(String)?

        # The Amazon S3 key prefix for the output speech file.

        @[JSON::Field(key: "OutputS3KeyPrefix")]
        getter output_s3_key_prefix : String?

        # The audio frequency specified in Hz. The valid values for mp3 and ogg_vorbis are "8000", "16000",
        # "22050", and "24000". The default value for standard voices is "22050". The default value for neural
        # voices is "24000". The default value for long-form voices is "24000". The default value for
        # generative voices is "24000". Valid values for pcm are "8000" and "16000" The default value is
        # "16000".

        @[JSON::Field(key: "SampleRate")]
        getter sample_rate : String?

        # ARN for the SNS topic optionally used for providing status notification for a speech synthesis task.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The type of speech marks returned for the input text.

        @[JSON::Field(key: "SpeechMarkTypes")]
        getter speech_mark_types : Array(String)?

        # Specifies whether the input text is plain text or SSML. The default value is plain text.

        @[JSON::Field(key: "TextType")]
        getter text_type : String?

        def initialize(
          @output_format : String,
          @output_s3_bucket_name : String,
          @text : String,
          @voice_id : String,
          @engine : String? = nil,
          @language_code : String? = nil,
          @lexicon_names : Array(String)? = nil,
          @output_s3_key_prefix : String? = nil,
          @sample_rate : String? = nil,
          @sns_topic_arn : String? = nil,
          @speech_mark_types : Array(String)? = nil,
          @text_type : String? = nil
        )
        end
      end


      struct StartSpeechSynthesisTaskOutput
        include JSON::Serializable

        # SynthesisTask object that provides information and attributes about a newly submitted speech
        # synthesis task.

        @[JSON::Field(key: "SynthesisTask")]
        getter synthesis_task : Types::SynthesisTask?

        def initialize(
          @synthesis_task : Types::SynthesisTask? = nil
        )
        end
      end

      # SynthesisTask object that provides information about a speech synthesis task.

      struct SynthesisTask
        include JSON::Serializable

        # Timestamp for the time the synthesis task was started.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Specifies the engine ( standard , neural , long-form or generative ) for Amazon Polly to use when
        # processing input text for speech synthesis. Using a voice that is not supported for the engine
        # selected will result in an error.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Optional language code for a synthesis task. This is only necessary if using a bilingual voice, such
        # as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). If a bilingual voice
        # is used and no language code is specified, Amazon Polly uses the default language of the bilingual
        # voice. The default language for any voice is the one returned by the DescribeVoices operation for
        # the LanguageCode parameter. For example, if no language code is specified, Aditi will use Indian
        # English rather than Hindi.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # List of one or more pronunciation lexicon names you want the service to apply during synthesis.
        # Lexicons are applied only if the language of the lexicon is the same as the language of the voice.

        @[JSON::Field(key: "LexiconNames")]
        getter lexicon_names : Array(String)?

        # The format in which the returned output will be encoded. For audio stream, this will be mp3,
        # ogg_vorbis, or pcm. For speech marks, this will be json.

        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String?

        # Pathway for the output speech file.

        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String?

        # Number of billable characters synthesized.

        @[JSON::Field(key: "RequestCharacters")]
        getter request_characters : Int32?

        # The audio frequency specified in Hz. The valid values for mp3 and ogg_vorbis are "8000", "16000",
        # "22050", and "24000". The default value for standard voices is "22050". The default value for neural
        # voices is "24000". The default value for long-form voices is "24000". The default value for
        # generative voices is "24000". Valid values for pcm are "8000" and "16000" The default value is
        # "16000".

        @[JSON::Field(key: "SampleRate")]
        getter sample_rate : String?

        # ARN for the SNS topic optionally used for providing status notification for a speech synthesis task.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The type of speech marks returned for the input text.

        @[JSON::Field(key: "SpeechMarkTypes")]
        getter speech_mark_types : Array(String)?

        # The Amazon Polly generated identifier for a speech synthesis task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Current status of the individual speech synthesis task.

        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        # Reason for the current status of a specific speech synthesis task, including errors if the task has
        # failed.

        @[JSON::Field(key: "TaskStatusReason")]
        getter task_status_reason : String?

        # Specifies whether the input text is plain text or SSML. The default value is plain text.

        @[JSON::Field(key: "TextType")]
        getter text_type : String?

        # Voice ID to use for the synthesis.

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @engine : String? = nil,
          @language_code : String? = nil,
          @lexicon_names : Array(String)? = nil,
          @output_format : String? = nil,
          @output_uri : String? = nil,
          @request_characters : Int32? = nil,
          @sample_rate : String? = nil,
          @sns_topic_arn : String? = nil,
          @speech_mark_types : Array(String)? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil,
          @task_status_reason : String? = nil,
          @text_type : String? = nil,
          @voice_id : String? = nil
        )
        end
      end

      # The Speech Synthesis task with requested Task ID cannot be found.

      struct SynthesisTaskNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SynthesizeSpeechInput
        include JSON::Serializable

        # The format in which the returned output will be encoded. For audio stream, this will be mp3,
        # ogg_vorbis, or pcm. For speech marks, this will be json. When pcm is used, the content returned is
        # audio/pcm in a signed 16-bit, 1 channel (mono), little-endian format.

        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String

        # Input text to synthesize. If you specify ssml as the TextType , follow the SSML format for the input
        # text.

        @[JSON::Field(key: "Text")]
        getter text : String

        # Voice ID to use for the synthesis. You can get a list of available voice IDs by calling the
        # DescribeVoices operation.

        @[JSON::Field(key: "VoiceId")]
        getter voice_id : String

        # Specifies the engine ( standard , neural , long-form , or generative ) for Amazon Polly to use when
        # processing input text for speech synthesis. Provide an engine that is supported by the voice you
        # select. If you don't provide an engine, the standard engine is selected by default. If a chosen
        # voice isn't supported by the standard engine, this will result in an error. For information on
        # Amazon Polly voices and which voices are available for each engine, see Available Voices .

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Optional language code for the Synthesize Speech request. This is only necessary if using a
        # bilingual voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi
        # (hi-IN). If a bilingual voice is used and no language code is specified, Amazon Polly uses the
        # default language of the bilingual voice. The default language for any voice is the one returned by
        # the DescribeVoices operation for the LanguageCode parameter. For example, if no language code is
        # specified, Aditi will use Indian English rather than Hindi.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # List of one or more pronunciation lexicon names you want the service to apply during synthesis.
        # Lexicons are applied only if the language of the lexicon is the same as the language of the voice.
        # For information about storing lexicons, see PutLexicon .

        @[JSON::Field(key: "LexiconNames")]
        getter lexicon_names : Array(String)?

        # The audio frequency specified in Hz. The valid values for mp3 and ogg_vorbis are "8000", "16000",
        # "22050", "24000", "44100" and "48000". The default value for standard voices is "22050". The default
        # value for neural voices is "24000". The default value for long-form voices is "24000". The default
        # value for generative voices is "24000". Valid values for pcm are "8000" and "16000" The default
        # value is "16000".

        @[JSON::Field(key: "SampleRate")]
        getter sample_rate : String?

        # The type of speech marks returned for the input text.

        @[JSON::Field(key: "SpeechMarkTypes")]
        getter speech_mark_types : Array(String)?

        # Specifies whether the input text is plain text or SSML. The default value is plain text. For more
        # information, see Using SSML .

        @[JSON::Field(key: "TextType")]
        getter text_type : String?

        def initialize(
          @output_format : String,
          @text : String,
          @voice_id : String,
          @engine : String? = nil,
          @language_code : String? = nil,
          @lexicon_names : Array(String)? = nil,
          @sample_rate : String? = nil,
          @speech_mark_types : Array(String)? = nil,
          @text_type : String? = nil
        )
        end
      end


      struct SynthesizeSpeechOutput
        include JSON::Serializable

        # Stream containing the synthesized speech.

        @[JSON::Field(key: "AudioStream")]
        getter audio_stream : Bytes?

        # Specifies the type audio stream. This should reflect the OutputFormat parameter in your request. If
        # you request mp3 as the OutputFormat , the ContentType returned is audio/mpeg. If you request
        # ogg_vorbis as the OutputFormat , the ContentType returned is audio/ogg. If you request pcm as the
        # OutputFormat , the ContentType returned is audio/pcm in a signed 16-bit, 1 channel (mono),
        # little-endian format. If you request json as the OutputFormat , the ContentType returned is
        # application/x-json-stream.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Number of characters synthesized.

        @[JSON::Field(key: "x-amzn-RequestCharacters")]
        getter request_characters : Int32?

        def initialize(
          @audio_stream : Bytes? = nil,
          @content_type : String? = nil,
          @request_characters : Int32? = nil
        )
        end
      end

      # The value of the "Text" parameter is longer than the accepted limits. For the SynthesizeSpeech API,
      # the limit for input text is a maximum of 6000 characters total, of which no more than 3000 can be
      # billed characters. For the StartSpeechSynthesisTask API, the maximum is 200,000 characters, of which
      # no more than 100,000 can be billed characters. SSML tags are not counted as billed characters.

      struct TextLengthExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The alphabet specified by the lexicon is not a supported alphabet. Valid values are x-sampa and ipa
      # .

      struct UnsupportedPlsAlphabetException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The language specified in the lexicon is unsupported. For a list of supported languages, see Lexicon
      # Attributes .

      struct UnsupportedPlsLanguageException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Description of the voice.

      struct Voice
        include JSON::Serializable

        # Additional codes for languages available for the specified voice in addition to its default
        # language. For example, the default language for Aditi is Indian English (en-IN) because it was first
        # used for that language. Since Aditi is bilingual and fluent in both Indian English and Hindi, this
        # parameter would show the code hi-IN .

        @[JSON::Field(key: "AdditionalLanguageCodes")]
        getter additional_language_codes : Array(String)?

        # Gender of the voice.

        @[JSON::Field(key: "Gender")]
        getter gender : String?

        # Amazon Polly assigned voice ID. This is the ID that you specify when calling the SynthesizeSpeech
        # operation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Language code of the voice.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # Human readable name of the language in English.

        @[JSON::Field(key: "LanguageName")]
        getter language_name : String?

        # Name of the voice (for example, Salli, Kendra, etc.). This provides a human readable voice name that
        # you might display in your application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies which engines ( standard , neural , long-form or generative ) are supported by a given
        # voice.

        @[JSON::Field(key: "SupportedEngines")]
        getter supported_engines : Array(String)?

        def initialize(
          @additional_language_codes : Array(String)? = nil,
          @gender : String? = nil,
          @id : String? = nil,
          @language_code : String? = nil,
          @language_name : String? = nil,
          @name : String? = nil,
          @supported_engines : Array(String)? = nil
        )
        end
      end
    end
  end
end
