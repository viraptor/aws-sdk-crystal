module AwsSdk
  module Polly
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Deletes the specified pronunciation lexicon stored in an Amazon Web Services Region. A lexicon which
      # has been deleted is not available for speech synthesis, nor is it possible to retrieve it using
      # either the GetLexicon or ListLexicon APIs. For more information, see Managing Lexicons .

      def delete_lexicon(
        name : String
      ) : Protocol::Request
        input = Types::DeleteLexiconInput.new(name: name)
        delete_lexicon(input)
      end

      def delete_lexicon(input : Types::DeleteLexiconInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LEXICON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of voices that are available for use when requesting speech synthesis. Each voice
      # speaks a specified language, is either male or female, and is identified by an ID, which is the
      # ASCII version of the voice name. When synthesizing speech ( SynthesizeSpeech ), you provide the
      # voice ID for the voice you want from the list of voices returned by DescribeVoices . For example,
      # you want your news reader application to read news in a specific language, but giving a user the
      # option to choose the voice. Using the DescribeVoices operation you can provide the user with a list
      # of available voices to select from. You can optionally specify a language code to filter the
      # available voices. For example, if you specify en-US , the operation returns a list of all available
      # US English voices. This operation requires permissions to perform the polly:DescribeVoices action.

      def describe_voices(
        engine : String? = nil,
        include_additional_language_codes : Bool? = nil,
        language_code : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVoicesInput.new(engine: engine, include_additional_language_codes: include_additional_language_codes, language_code: language_code, next_token: next_token)
        describe_voices(input)
      end

      def describe_voices(input : Types::DescribeVoicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VOICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the content of the specified pronunciation lexicon stored in an Amazon Web Services Region.
      # For more information, see Managing Lexicons .

      def get_lexicon(
        name : String
      ) : Protocol::Request
        input = Types::GetLexiconInput.new(name: name)
        get_lexicon(input)
      end

      def get_lexicon(input : Types::GetLexiconInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LEXICON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specific SpeechSynthesisTask object based on its TaskID. This object contains
      # information about the given speech synthesis task, including the status of the task, and a link to
      # the S3 bucket containing the output of the task.

      def get_speech_synthesis_task(
        task_id : String
      ) : Protocol::Request
        input = Types::GetSpeechSynthesisTaskInput.new(task_id: task_id)
        get_speech_synthesis_task(input)
      end

      def get_speech_synthesis_task(input : Types::GetSpeechSynthesisTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPEECH_SYNTHESIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of pronunciation lexicons stored in an Amazon Web Services Region. For more
      # information, see Managing Lexicons .

      def list_lexicons(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLexiconsInput.new(next_token: next_token)
        list_lexicons(input)
      end

      def list_lexicons(input : Types::ListLexiconsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LEXICONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of SpeechSynthesisTask objects ordered by their creation date. This operation can
      # filter the tasks by their status, for example, allowing users to list only tasks that are completed.

      def list_speech_synthesis_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListSpeechSynthesisTasksInput.new(max_results: max_results, next_token: next_token, status: status)
        list_speech_synthesis_tasks(input)
      end

      def list_speech_synthesis_tasks(input : Types::ListSpeechSynthesisTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SPEECH_SYNTHESIS_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stores a pronunciation lexicon in an Amazon Web Services Region. If a lexicon with the same name
      # already exists in the region, it is overwritten by the new lexicon. Lexicon operations have eventual
      # consistency, therefore, it might take some time before the lexicon is available to the
      # SynthesizeSpeech operation. For more information, see Managing Lexicons .

      def put_lexicon(
        content : String,
        name : String
      ) : Protocol::Request
        input = Types::PutLexiconInput.new(content: content, name: name)
        put_lexicon(input)
      end

      def put_lexicon(input : Types::PutLexiconInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_LEXICON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the creation of an asynchronous synthesis task, by starting a new SpeechSynthesisTask . This
      # operation requires all the standard information needed for speech synthesis, plus the name of an
      # Amazon S3 bucket for the service to store the output of the synthesis task and two optional
      # parameters ( OutputS3KeyPrefix and SnsTopicArn ). Once the synthesis task is created, this operation
      # will return a SpeechSynthesisTask object, which will include an identifier of this task as well as
      # the current status. The SpeechSynthesisTask object is available for 72 hours after starting the
      # asynchronous synthesis task.

      def start_speech_synthesis_task(
        output_format : String,
        output_s3_bucket_name : String,
        text : String,
        voice_id : String,
        engine : String? = nil,
        language_code : String? = nil,
        lexicon_names : Array(String)? = nil,
        output_s3_key_prefix : String? = nil,
        sample_rate : String? = nil,
        sns_topic_arn : String? = nil,
        speech_mark_types : Array(String)? = nil,
        text_type : String? = nil
      ) : Protocol::Request
        input = Types::StartSpeechSynthesisTaskInput.new(output_format: output_format, output_s3_bucket_name: output_s3_bucket_name, text: text, voice_id: voice_id, engine: engine, language_code: language_code, lexicon_names: lexicon_names, output_s3_key_prefix: output_s3_key_prefix, sample_rate: sample_rate, sns_topic_arn: sns_topic_arn, speech_mark_types: speech_mark_types, text_type: text_type)
        start_speech_synthesis_task(input)
      end

      def start_speech_synthesis_task(input : Types::StartSpeechSynthesisTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SPEECH_SYNTHESIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML input must be valid,
      # well-formed SSML. Some alphabets might not be available with all the voices (for example, Cyrillic
      # might not be read at all by English voices) unless phoneme mapping is used. For more information,
      # see How it Works .

      def synthesize_speech(
        output_format : String,
        text : String,
        voice_id : String,
        engine : String? = nil,
        language_code : String? = nil,
        lexicon_names : Array(String)? = nil,
        sample_rate : String? = nil,
        speech_mark_types : Array(String)? = nil,
        text_type : String? = nil
      ) : Protocol::Request
        input = Types::SynthesizeSpeechInput.new(output_format: output_format, text: text, voice_id: voice_id, engine: engine, language_code: language_code, lexicon_names: lexicon_names, sample_rate: sample_rate, speech_mark_types: speech_mark_types, text_type: text_type)
        synthesize_speech(input)
      end

      def synthesize_speech(input : Types::SynthesizeSpeechInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SYNTHESIZE_SPEECH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
