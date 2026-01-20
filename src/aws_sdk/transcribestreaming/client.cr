module AwsSdk
  module TranscribeStreaming
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

      # Provides details about the specified Amazon Web Services HealthScribe streaming session. To view the
      # status of the streaming session, check the StreamStatus field in the response. To get the details of
      # post-stream analytics, including its status, check the PostStreamAnalyticsResult field in the
      # response.

      def get_medical_scribe_stream(
        session_id : String
      ) : Protocol::Request
        input = Types::GetMedicalScribeStreamRequest.new(session_id: session_id)
        get_medical_scribe_stream(input)
      end

      def get_medical_scribe_stream(input : Types::GetMedicalScribeStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDICAL_SCRIBE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe and
      # the transcription results are streamed to your application. Use this operation for Call Analytics
      # transcriptions. The following parameters are required: language-code or identify-language
      # media-encoding sample-rate For more information on streaming with Amazon Transcribe, see
      # Transcribing streaming audio .

      def start_call_analytics_stream_transcription(
        audio_stream : Types::AudioStream,
        media_encoding : String,
        media_sample_rate_hertz : Int32,
        content_identification_type : String? = nil,
        content_redaction_type : String? = nil,
        enable_partial_results_stabilization : Bool? = nil,
        identify_language : Bool? = nil,
        language_code : String? = nil,
        language_model_name : String? = nil,
        language_options : String? = nil,
        partial_results_stability : String? = nil,
        pii_entity_types : String? = nil,
        preferred_language : String? = nil,
        session_id : String? = nil,
        vocabulary_filter_method : String? = nil,
        vocabulary_filter_name : String? = nil,
        vocabulary_filter_names : String? = nil,
        vocabulary_name : String? = nil,
        vocabulary_names : String? = nil
      ) : Protocol::Request
        input = Types::StartCallAnalyticsStreamTranscriptionRequest.new(audio_stream: audio_stream, media_encoding: media_encoding, media_sample_rate_hertz: media_sample_rate_hertz, content_identification_type: content_identification_type, content_redaction_type: content_redaction_type, enable_partial_results_stabilization: enable_partial_results_stabilization, identify_language: identify_language, language_code: language_code, language_model_name: language_model_name, language_options: language_options, partial_results_stability: partial_results_stability, pii_entity_types: pii_entity_types, preferred_language: preferred_language, session_id: session_id, vocabulary_filter_method: vocabulary_filter_method, vocabulary_filter_name: vocabulary_filter_name, vocabulary_filter_names: vocabulary_filter_names, vocabulary_name: vocabulary_name, vocabulary_names: vocabulary_names)
        start_call_analytics_stream_transcription(input)
      end

      def start_call_analytics_stream_transcription(input : Types::StartCallAnalyticsStreamTranscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CALL_ANALYTICS_STREAM_TRANSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bidirectional HTTP/2 stream, where audio is streamed to Amazon Web Services HealthScribe
      # and the transcription results are streamed to your application. When you start a stream, you first
      # specify the stream configuration in a MedicalScribeConfigurationEvent . This event includes channel
      # definitions, encryption settings, medical scribe context, and post-stream analytics settings, such
      # as the output configuration for aggregated transcript and clinical note generation. These are
      # additional streaming session configurations beyond those provided in your initial start request
      # headers. Whether you are starting a new session or resuming an existing session, your first event
      # must be a MedicalScribeConfigurationEvent . After you send a MedicalScribeConfigurationEvent , you
      # start AudioEvents and Amazon Web Services HealthScribe responds with real-time transcription
      # results. When you are finished, to start processing the results with the post-stream analytics, send
      # a MedicalScribeSessionControlEvent with a Type of END_OF_SESSION and Amazon Web Services
      # HealthScribe starts the analytics. You can pause or resume streaming. To pause streaming, complete
      # the input stream without sending the MedicalScribeSessionControlEvent . To resume streaming, call
      # the StartMedicalScribeStream and specify the same SessionId you used to start the stream. The
      # following parameters are required: language-code media-encoding media-sample-rate-hertz For more
      # information on streaming with Amazon Web Services HealthScribe, see Amazon Web Services HealthScribe
      # .

      def start_medical_scribe_stream(
        input_stream : Types::MedicalScribeInputStream,
        language_code : String,
        media_encoding : String,
        media_sample_rate_hertz : Int32,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::StartMedicalScribeStreamRequest.new(input_stream: input_stream, language_code: language_code, media_encoding: media_encoding, media_sample_rate_hertz: media_sample_rate_hertz, session_id: session_id)
        start_medical_scribe_stream(input)
      end

      def start_medical_scribe_stream(input : Types::StartMedicalScribeStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MEDICAL_SCRIBE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe
      # Medical and the transcription results are streamed to your application. The following parameters are
      # required: language-code media-encoding sample-rate For more information on streaming with Amazon
      # Transcribe Medical, see Transcribing streaming audio .

      def start_medical_stream_transcription(
        audio_stream : Types::AudioStream,
        language_code : String,
        media_encoding : String,
        media_sample_rate_hertz : Int32,
        specialty : String,
        type : String,
        content_identification_type : String? = nil,
        enable_channel_identification : Bool? = nil,
        number_of_channels : Int32? = nil,
        session_id : String? = nil,
        show_speaker_label : Bool? = nil,
        vocabulary_name : String? = nil
      ) : Protocol::Request
        input = Types::StartMedicalStreamTranscriptionRequest.new(audio_stream: audio_stream, language_code: language_code, media_encoding: media_encoding, media_sample_rate_hertz: media_sample_rate_hertz, specialty: specialty, type: type, content_identification_type: content_identification_type, enable_channel_identification: enable_channel_identification, number_of_channels: number_of_channels, session_id: session_id, show_speaker_label: show_speaker_label, vocabulary_name: vocabulary_name)
        start_medical_stream_transcription(input)
      end

      def start_medical_stream_transcription(input : Types::StartMedicalStreamTranscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MEDICAL_STREAM_TRANSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed to Amazon Transcribe and
      # the transcription results are streamed to your application. The following parameters are required:
      # language-code or identify-language or identify-multiple-language media-encoding sample-rate For more
      # information on streaming with Amazon Transcribe, see Transcribing streaming audio .

      def start_stream_transcription(
        audio_stream : Types::AudioStream,
        media_encoding : String,
        media_sample_rate_hertz : Int32,
        content_identification_type : String? = nil,
        content_redaction_type : String? = nil,
        enable_channel_identification : Bool? = nil,
        enable_partial_results_stabilization : Bool? = nil,
        identify_language : Bool? = nil,
        identify_multiple_languages : Bool? = nil,
        language_code : String? = nil,
        language_model_name : String? = nil,
        language_options : String? = nil,
        number_of_channels : Int32? = nil,
        partial_results_stability : String? = nil,
        pii_entity_types : String? = nil,
        preferred_language : String? = nil,
        session_id : String? = nil,
        show_speaker_label : Bool? = nil,
        vocabulary_filter_method : String? = nil,
        vocabulary_filter_name : String? = nil,
        vocabulary_filter_names : String? = nil,
        vocabulary_name : String? = nil,
        vocabulary_names : String? = nil
      ) : Protocol::Request
        input = Types::StartStreamTranscriptionRequest.new(audio_stream: audio_stream, media_encoding: media_encoding, media_sample_rate_hertz: media_sample_rate_hertz, content_identification_type: content_identification_type, content_redaction_type: content_redaction_type, enable_channel_identification: enable_channel_identification, enable_partial_results_stabilization: enable_partial_results_stabilization, identify_language: identify_language, identify_multiple_languages: identify_multiple_languages, language_code: language_code, language_model_name: language_model_name, language_options: language_options, number_of_channels: number_of_channels, partial_results_stability: partial_results_stability, pii_entity_types: pii_entity_types, preferred_language: preferred_language, session_id: session_id, show_speaker_label: show_speaker_label, vocabulary_filter_method: vocabulary_filter_method, vocabulary_filter_name: vocabulary_filter_name, vocabulary_filter_names: vocabulary_filter_names, vocabulary_name: vocabulary_name, vocabulary_names: vocabulary_names)
        start_stream_transcription(input)
      end

      def start_stream_transcription(input : Types::StartStreamTranscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_STREAM_TRANSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
