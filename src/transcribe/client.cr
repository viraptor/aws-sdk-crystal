module Aws
  module Transcribe
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a new Call Analytics category. All categories are automatically applied to your Call
      # Analytics transcriptions. Note that in order to apply categories to your transcriptions, you must
      # create them before submitting your transcription request, as categories cannot be applied
      # retroactively. When creating a new category, you can use the InputType parameter to label the
      # category as a POST_CALL or a REAL_TIME category. POST_CALL categories can only be applied to
      # post-call transcriptions and REAL_TIME categories can only be applied to real-time transcriptions.
      # If you do not include InputType , your category is created as a POST_CALL category by default. Call
      # Analytics categories are composed of rules. For each category, you must create between 1 and 20
      # rules. Rules can include these parameters: , , , and . To update an existing category, see . To
      # learn more about Call Analytics categories, see Creating categories for post-call transcriptions and
      # Creating categories for real-time transcriptions .

      def create_call_analytics_category(
        category_name : String,
        rules : Array(Types::Rule),
        input_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCallAnalyticsCategoryResponse

        input = Types::CreateCallAnalyticsCategoryRequest.new(category_name: category_name, rules: rules, input_type: input_type, tags: tags)
        create_call_analytics_category(input)
      end

      def create_call_analytics_category(input : Types::CreateCallAnalyticsCategoryRequest) : Types::CreateCallAnalyticsCategoryResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CALL_ANALYTICS_CATEGORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCallAnalyticsCategoryResponse, "CreateCallAnalyticsCategory")
      end

      # Creates a new custom language model. When creating a new custom language model, you must specify: If
      # you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under
      # 16,000 Hz) base model The location of your training and tuning files (this must be an Amazon S3 URI)
      # The language of your model A unique name for your model

      def create_language_model(
        base_model_name : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        model_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLanguageModelResponse

        input = Types::CreateLanguageModelRequest.new(base_model_name: base_model_name, input_data_config: input_data_config, language_code: language_code, model_name: model_name, tags: tags)
        create_language_model(input)
      end

      def create_language_model(input : Types::CreateLanguageModelRequest) : Types::CreateLanguageModelResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LANGUAGE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLanguageModelResponse, "CreateLanguageModel")
      end

      # Creates a new custom medical vocabulary. Before creating a new custom medical vocabulary, you must
      # first upload a text file that contains your vocabulary table into an Amazon S3 bucket. Note that
      # this differs from , where you can include a list of terms within your request using the Phrases
      # flag; CreateMedicalVocabulary does not support the Phrases flag and only accepts vocabularies in
      # table format. Each language has a character set that contains all allowed characters for that
      # specific language. If you use unsupported characters, your custom vocabulary request fails. Refer to
      # Character Sets for Custom Vocabularies to get the character set for your language. For more
      # information, see Custom vocabularies .

      def create_medical_vocabulary(
        language_code : String,
        vocabulary_file_uri : String,
        vocabulary_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMedicalVocabularyResponse

        input = Types::CreateMedicalVocabularyRequest.new(language_code: language_code, vocabulary_file_uri: vocabulary_file_uri, vocabulary_name: vocabulary_name, tags: tags)
        create_medical_vocabulary(input)
      end

      def create_medical_vocabulary(input : Types::CreateMedicalVocabularyRequest) : Types::CreateMedicalVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MEDICAL_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMedicalVocabularyResponse, "CreateMedicalVocabulary")
      end

      # Creates a new custom vocabulary. When creating a new custom vocabulary, you can either upload a text
      # file that contains your new entries, phrases, and terms into an Amazon S3 bucket and include the URI
      # in your request. Or you can include a list of terms directly in your request using the Phrases flag.
      # Each language has a character set that contains all allowed characters for that specific language.
      # If you use unsupported characters, your custom vocabulary request fails. Refer to Character Sets for
      # Custom Vocabularies to get the character set for your language. For more information, see Custom
      # vocabularies .

      def create_vocabulary(
        language_code : String,
        vocabulary_name : String,
        data_access_role_arn : String? = nil,
        phrases : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        vocabulary_file_uri : String? = nil
      ) : Types::CreateVocabularyResponse

        input = Types::CreateVocabularyRequest.new(language_code: language_code, vocabulary_name: vocabulary_name, data_access_role_arn: data_access_role_arn, phrases: phrases, tags: tags, vocabulary_file_uri: vocabulary_file_uri)
        create_vocabulary(input)
      end

      def create_vocabulary(input : Types::CreateVocabularyRequest) : Types::CreateVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVocabularyResponse, "CreateVocabulary")
      end

      # Creates a new custom vocabulary filter. You can use custom vocabulary filters to mask, delete, or
      # flag specific words from your transcript. Custom vocabulary filters are commonly used to mask
      # profanity in transcripts. Each language has a character set that contains all allowed characters for
      # that specific language. If you use unsupported characters, your custom vocabulary filter request
      # fails. Refer to Character Sets for Custom Vocabularies to get the character set for your language.
      # For more information, see Vocabulary filtering .

      def create_vocabulary_filter(
        language_code : String,
        vocabulary_filter_name : String,
        data_access_role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vocabulary_filter_file_uri : String? = nil,
        words : Array(String)? = nil
      ) : Types::CreateVocabularyFilterResponse

        input = Types::CreateVocabularyFilterRequest.new(language_code: language_code, vocabulary_filter_name: vocabulary_filter_name, data_access_role_arn: data_access_role_arn, tags: tags, vocabulary_filter_file_uri: vocabulary_filter_file_uri, words: words)
        create_vocabulary_filter(input)
      end

      def create_vocabulary_filter(input : Types::CreateVocabularyFilterRequest) : Types::CreateVocabularyFilterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VOCABULARY_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVocabularyFilterResponse, "CreateVocabularyFilter")
      end

      # Deletes a Call Analytics category. To use this operation, specify the name of the category you want
      # to delete using CategoryName . Category names are case sensitive.

      def delete_call_analytics_category(
        category_name : String
      ) : Types::DeleteCallAnalyticsCategoryResponse

        input = Types::DeleteCallAnalyticsCategoryRequest.new(category_name: category_name)
        delete_call_analytics_category(input)
      end

      def delete_call_analytics_category(input : Types::DeleteCallAnalyticsCategoryRequest) : Types::DeleteCallAnalyticsCategoryResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CALL_ANALYTICS_CATEGORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCallAnalyticsCategoryResponse, "DeleteCallAnalyticsCategory")
      end

      # Deletes a Call Analytics job. To use this operation, specify the name of the job you want to delete
      # using CallAnalyticsJobName . Job names are case sensitive.

      def delete_call_analytics_job(
        call_analytics_job_name : String
      ) : Types::DeleteCallAnalyticsJobResponse

        input = Types::DeleteCallAnalyticsJobRequest.new(call_analytics_job_name: call_analytics_job_name)
        delete_call_analytics_job(input)
      end

      def delete_call_analytics_job(input : Types::DeleteCallAnalyticsJobRequest) : Types::DeleteCallAnalyticsJobResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CALL_ANALYTICS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCallAnalyticsJobResponse, "DeleteCallAnalyticsJob")
      end

      # Deletes a custom language model. To use this operation, specify the name of the language model you
      # want to delete using ModelName . custom language model names are case sensitive.

      def delete_language_model(
        model_name : String
      ) : Nil

        input = Types::DeleteLanguageModelRequest.new(model_name: model_name)
        delete_language_model(input)
      end

      def delete_language_model(input : Types::DeleteLanguageModelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_LANGUAGE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a Medical Scribe job. To use this operation, specify the name of the job you want to delete
      # using MedicalScribeJobName . Job names are case sensitive.

      def delete_medical_scribe_job(
        medical_scribe_job_name : String
      ) : Nil

        input = Types::DeleteMedicalScribeJobRequest.new(medical_scribe_job_name: medical_scribe_job_name)
        delete_medical_scribe_job(input)
      end

      def delete_medical_scribe_job(input : Types::DeleteMedicalScribeJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MEDICAL_SCRIBE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a medical transcription job. To use this operation, specify the name of the job you want to
      # delete using MedicalTranscriptionJobName . Job names are case sensitive.

      def delete_medical_transcription_job(
        medical_transcription_job_name : String
      ) : Nil

        input = Types::DeleteMedicalTranscriptionJobRequest.new(medical_transcription_job_name: medical_transcription_job_name)
        delete_medical_transcription_job(input)
      end

      def delete_medical_transcription_job(input : Types::DeleteMedicalTranscriptionJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MEDICAL_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a custom medical vocabulary. To use this operation, specify the name of the custom
      # vocabulary you want to delete using VocabularyName . Custom vocabulary names are case sensitive.

      def delete_medical_vocabulary(
        vocabulary_name : String
      ) : Nil

        input = Types::DeleteMedicalVocabularyRequest.new(vocabulary_name: vocabulary_name)
        delete_medical_vocabulary(input)
      end

      def delete_medical_vocabulary(input : Types::DeleteMedicalVocabularyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MEDICAL_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a transcription job. To use this operation, specify the name of the job you want to delete
      # using TranscriptionJobName . Job names are case sensitive.

      def delete_transcription_job(
        transcription_job_name : String
      ) : Nil

        input = Types::DeleteTranscriptionJobRequest.new(transcription_job_name: transcription_job_name)
        delete_transcription_job(input)
      end

      def delete_transcription_job(input : Types::DeleteTranscriptionJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a custom vocabulary. To use this operation, specify the name of the custom vocabulary you
      # want to delete using VocabularyName . Custom vocabulary names are case sensitive.

      def delete_vocabulary(
        vocabulary_name : String
      ) : Nil

        input = Types::DeleteVocabularyRequest.new(vocabulary_name: vocabulary_name)
        delete_vocabulary(input)
      end

      def delete_vocabulary(input : Types::DeleteVocabularyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a custom vocabulary filter. To use this operation, specify the name of the custom vocabulary
      # filter you want to delete using VocabularyFilterName . Custom vocabulary filter names are case
      # sensitive.

      def delete_vocabulary_filter(
        vocabulary_filter_name : String
      ) : Nil

        input = Types::DeleteVocabularyFilterRequest.new(vocabulary_filter_name: vocabulary_filter_name)
        delete_vocabulary_filter(input)
      end

      def delete_vocabulary_filter(input : Types::DeleteVocabularyFilterRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOCABULARY_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Provides information about the specified custom language model. This operation also shows if the
      # base language model that you used to create your custom language model has been updated. If Amazon
      # Transcribe has updated the base model, you can create a new custom language model using the updated
      # base model. If you tried to create a new custom language model and the request wasn't successful,
      # you can use DescribeLanguageModel to help identify the reason for this failure.

      def describe_language_model(
        model_name : String
      ) : Types::DescribeLanguageModelResponse

        input = Types::DescribeLanguageModelRequest.new(model_name: model_name)
        describe_language_model(input)
      end

      def describe_language_model(input : Types::DescribeLanguageModelRequest) : Types::DescribeLanguageModelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LANGUAGE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLanguageModelResponse, "DescribeLanguageModel")
      end

      # Provides information about the specified Call Analytics category. To get a list of your Call
      # Analytics categories, use the operation.

      def get_call_analytics_category(
        category_name : String
      ) : Types::GetCallAnalyticsCategoryResponse

        input = Types::GetCallAnalyticsCategoryRequest.new(category_name: category_name)
        get_call_analytics_category(input)
      end

      def get_call_analytics_category(input : Types::GetCallAnalyticsCategoryRequest) : Types::GetCallAnalyticsCategoryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALL_ANALYTICS_CATEGORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCallAnalyticsCategoryResponse, "GetCallAnalyticsCategory")
      end

      # Provides information about the specified Call Analytics job. To view the job's status, refer to
      # CallAnalyticsJobStatus . If the status is COMPLETED , the job is finished. You can find your
      # completed transcript at the URI specified in TranscriptFileUri . If the status is FAILED ,
      # FailureReason provides details on why your transcription job failed. If you enabled personally
      # identifiable information (PII) redaction, the redacted transcript appears at the location specified
      # in RedactedTranscriptFileUri . If you chose to redact the audio in your media file, you can find
      # your redacted media file at the location specified in RedactedMediaFileUri . To get a list of your
      # Call Analytics jobs, use the operation.

      def get_call_analytics_job(
        call_analytics_job_name : String
      ) : Types::GetCallAnalyticsJobResponse

        input = Types::GetCallAnalyticsJobRequest.new(call_analytics_job_name: call_analytics_job_name)
        get_call_analytics_job(input)
      end

      def get_call_analytics_job(input : Types::GetCallAnalyticsJobRequest) : Types::GetCallAnalyticsJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALL_ANALYTICS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCallAnalyticsJobResponse, "GetCallAnalyticsJob")
      end

      # Provides information about the specified Medical Scribe job. To view the status of the specified
      # medical transcription job, check the MedicalScribeJobStatus field. If the status is COMPLETED , the
      # job is finished. You can find the results at the location specified in MedicalScribeOutput . If the
      # status is FAILED , FailureReason provides details on why your Medical Scribe job failed. To get a
      # list of your Medical Scribe jobs, use the operation.

      def get_medical_scribe_job(
        medical_scribe_job_name : String
      ) : Types::GetMedicalScribeJobResponse

        input = Types::GetMedicalScribeJobRequest.new(medical_scribe_job_name: medical_scribe_job_name)
        get_medical_scribe_job(input)
      end

      def get_medical_scribe_job(input : Types::GetMedicalScribeJobRequest) : Types::GetMedicalScribeJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MEDICAL_SCRIBE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMedicalScribeJobResponse, "GetMedicalScribeJob")
      end

      # Provides information about the specified medical transcription job. To view the status of the
      # specified medical transcription job, check the TranscriptionJobStatus field. If the status is
      # COMPLETED , the job is finished. You can find the results at the location specified in
      # TranscriptFileUri . If the status is FAILED , FailureReason provides details on why your
      # transcription job failed. To get a list of your medical transcription jobs, use the operation.

      def get_medical_transcription_job(
        medical_transcription_job_name : String
      ) : Types::GetMedicalTranscriptionJobResponse

        input = Types::GetMedicalTranscriptionJobRequest.new(medical_transcription_job_name: medical_transcription_job_name)
        get_medical_transcription_job(input)
      end

      def get_medical_transcription_job(input : Types::GetMedicalTranscriptionJobRequest) : Types::GetMedicalTranscriptionJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MEDICAL_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMedicalTranscriptionJobResponse, "GetMedicalTranscriptionJob")
      end

      # Provides information about the specified custom medical vocabulary. To view the status of the
      # specified custom medical vocabulary, check the VocabularyState field. If the status is READY , your
      # custom vocabulary is available to use. If the status is FAILED , FailureReason provides details on
      # why your vocabulary failed. To get a list of your custom medical vocabularies, use the operation.

      def get_medical_vocabulary(
        vocabulary_name : String
      ) : Types::GetMedicalVocabularyResponse

        input = Types::GetMedicalVocabularyRequest.new(vocabulary_name: vocabulary_name)
        get_medical_vocabulary(input)
      end

      def get_medical_vocabulary(input : Types::GetMedicalVocabularyRequest) : Types::GetMedicalVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MEDICAL_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMedicalVocabularyResponse, "GetMedicalVocabulary")
      end

      # Provides information about the specified transcription job. To view the status of the specified
      # transcription job, check the TranscriptionJobStatus field. If the status is COMPLETED , the job is
      # finished. You can find the results at the location specified in TranscriptFileUri . If the status is
      # FAILED , FailureReason provides details on why your transcription job failed. If you enabled content
      # redaction, the redacted transcript can be found at the location specified in
      # RedactedTranscriptFileUri . To get a list of your transcription jobs, use the operation.

      def get_transcription_job(
        transcription_job_name : String
      ) : Types::GetTranscriptionJobResponse

        input = Types::GetTranscriptionJobRequest.new(transcription_job_name: transcription_job_name)
        get_transcription_job(input)
      end

      def get_transcription_job(input : Types::GetTranscriptionJobRequest) : Types::GetTranscriptionJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTranscriptionJobResponse, "GetTranscriptionJob")
      end

      # Provides information about the specified custom vocabulary. To view the status of the specified
      # custom vocabulary, check the VocabularyState field. If the status is READY , your custom vocabulary
      # is available to use. If the status is FAILED , FailureReason provides details on why your custom
      # vocabulary failed. To get a list of your custom vocabularies, use the operation.

      def get_vocabulary(
        vocabulary_name : String
      ) : Types::GetVocabularyResponse

        input = Types::GetVocabularyRequest.new(vocabulary_name: vocabulary_name)
        get_vocabulary(input)
      end

      def get_vocabulary(input : Types::GetVocabularyRequest) : Types::GetVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVocabularyResponse, "GetVocabulary")
      end

      # Provides information about the specified custom vocabulary filter. To get a list of your custom
      # vocabulary filters, use the operation.

      def get_vocabulary_filter(
        vocabulary_filter_name : String
      ) : Types::GetVocabularyFilterResponse

        input = Types::GetVocabularyFilterRequest.new(vocabulary_filter_name: vocabulary_filter_name)
        get_vocabulary_filter(input)
      end

      def get_vocabulary_filter(input : Types::GetVocabularyFilterRequest) : Types::GetVocabularyFilterResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VOCABULARY_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVocabularyFilterResponse, "GetVocabularyFilter")
      end

      # Provides a list of Call Analytics categories, including all rules that make up each category. To get
      # detailed information about a specific Call Analytics category, use the operation.

      def list_call_analytics_categories(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCallAnalyticsCategoriesResponse

        input = Types::ListCallAnalyticsCategoriesRequest.new(max_results: max_results, next_token: next_token)
        list_call_analytics_categories(input)
      end

      def list_call_analytics_categories(input : Types::ListCallAnalyticsCategoriesRequest) : Types::ListCallAnalyticsCategoriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CALL_ANALYTICS_CATEGORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCallAnalyticsCategoriesResponse, "ListCallAnalyticsCategories")
      end

      # Provides a list of Call Analytics jobs that match the specified criteria. If no criteria are
      # specified, all Call Analytics jobs are returned. To get detailed information about a specific Call
      # Analytics job, use the operation.

      def list_call_analytics_jobs(
        job_name_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListCallAnalyticsJobsResponse

        input = Types::ListCallAnalyticsJobsRequest.new(job_name_contains: job_name_contains, max_results: max_results, next_token: next_token, status: status)
        list_call_analytics_jobs(input)
      end

      def list_call_analytics_jobs(input : Types::ListCallAnalyticsJobsRequest) : Types::ListCallAnalyticsJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CALL_ANALYTICS_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCallAnalyticsJobsResponse, "ListCallAnalyticsJobs")
      end

      # Provides a list of custom language models that match the specified criteria. If no criteria are
      # specified, all custom language models are returned. To get detailed information about a specific
      # custom language model, use the operation.

      def list_language_models(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        status_equals : String? = nil
      ) : Types::ListLanguageModelsResponse

        input = Types::ListLanguageModelsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, status_equals: status_equals)
        list_language_models(input)
      end

      def list_language_models(input : Types::ListLanguageModelsRequest) : Types::ListLanguageModelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LANGUAGE_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLanguageModelsResponse, "ListLanguageModels")
      end

      # Provides a list of Medical Scribe jobs that match the specified criteria. If no criteria are
      # specified, all Medical Scribe jobs are returned. To get detailed information about a specific
      # Medical Scribe job, use the operation.

      def list_medical_scribe_jobs(
        job_name_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListMedicalScribeJobsResponse

        input = Types::ListMedicalScribeJobsRequest.new(job_name_contains: job_name_contains, max_results: max_results, next_token: next_token, status: status)
        list_medical_scribe_jobs(input)
      end

      def list_medical_scribe_jobs(input : Types::ListMedicalScribeJobsRequest) : Types::ListMedicalScribeJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEDICAL_SCRIBE_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMedicalScribeJobsResponse, "ListMedicalScribeJobs")
      end

      # Provides a list of medical transcription jobs that match the specified criteria. If no criteria are
      # specified, all medical transcription jobs are returned. To get detailed information about a specific
      # medical transcription job, use the operation.

      def list_medical_transcription_jobs(
        job_name_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListMedicalTranscriptionJobsResponse

        input = Types::ListMedicalTranscriptionJobsRequest.new(job_name_contains: job_name_contains, max_results: max_results, next_token: next_token, status: status)
        list_medical_transcription_jobs(input)
      end

      def list_medical_transcription_jobs(input : Types::ListMedicalTranscriptionJobsRequest) : Types::ListMedicalTranscriptionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEDICAL_TRANSCRIPTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMedicalTranscriptionJobsResponse, "ListMedicalTranscriptionJobs")
      end

      # Provides a list of custom medical vocabularies that match the specified criteria. If no criteria are
      # specified, all custom medical vocabularies are returned. To get detailed information about a
      # specific custom medical vocabulary, use the operation.

      def list_medical_vocabularies(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        state_equals : String? = nil
      ) : Types::ListMedicalVocabulariesResponse

        input = Types::ListMedicalVocabulariesRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, state_equals: state_equals)
        list_medical_vocabularies(input)
      end

      def list_medical_vocabularies(input : Types::ListMedicalVocabulariesRequest) : Types::ListMedicalVocabulariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEDICAL_VOCABULARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMedicalVocabulariesResponse, "ListMedicalVocabularies")
      end

      # Lists all tags associated with the specified transcription job, vocabulary, model, or resource. To
      # learn more about using tags with Amazon Transcribe, refer to Tagging resources .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Provides a list of transcription jobs that match the specified criteria. If no criteria are
      # specified, all transcription jobs are returned. To get detailed information about a specific
      # transcription job, use the operation.

      def list_transcription_jobs(
        job_name_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListTranscriptionJobsResponse

        input = Types::ListTranscriptionJobsRequest.new(job_name_contains: job_name_contains, max_results: max_results, next_token: next_token, status: status)
        list_transcription_jobs(input)
      end

      def list_transcription_jobs(input : Types::ListTranscriptionJobsRequest) : Types::ListTranscriptionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRANSCRIPTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTranscriptionJobsResponse, "ListTranscriptionJobs")
      end

      # Provides a list of custom vocabularies that match the specified criteria. If no criteria are
      # specified, all custom vocabularies are returned. To get detailed information about a specific custom
      # vocabulary, use the operation.

      def list_vocabularies(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        state_equals : String? = nil
      ) : Types::ListVocabulariesResponse

        input = Types::ListVocabulariesRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, state_equals: state_equals)
        list_vocabularies(input)
      end

      def list_vocabularies(input : Types::ListVocabulariesRequest) : Types::ListVocabulariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VOCABULARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVocabulariesResponse, "ListVocabularies")
      end

      # Provides a list of custom vocabulary filters that match the specified criteria. If no criteria are
      # specified, all custom vocabularies are returned. To get detailed information about a specific custom
      # vocabulary filter, use the operation.

      def list_vocabulary_filters(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Types::ListVocabularyFiltersResponse

        input = Types::ListVocabularyFiltersRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token)
        list_vocabulary_filters(input)
      end

      def list_vocabulary_filters(input : Types::ListVocabularyFiltersRequest) : Types::ListVocabularyFiltersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VOCABULARY_FILTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVocabularyFiltersResponse, "ListVocabularyFilters")
      end

      # Transcribes the audio from a customer service call and applies any additional Request Parameters you
      # choose to include in your request. In addition to many standard transcription features, Call
      # Analytics provides you with call characteristics, call summarization, speaker sentiment, and
      # optional redaction of your text transcript and your audio file. You can also apply custom categories
      # to flag specified conditions. To learn more about these features and insights, refer to Analyzing
      # call center audio with Call Analytics . If you want to apply categories to your Call Analytics job,
      # you must create them before submitting your job request. Categories cannot be retroactively applied
      # to a job. To create a new category, use the operation. To learn more about Call Analytics
      # categories, see Creating categories for post-call transcriptions and Creating categories for
      # real-time transcriptions . To make a StartCallAnalyticsJob request, you must first upload your media
      # file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the
      # Media parameter. Job queuing is available for Call Analytics jobs. If you pass a DataAccessRoleArn
      # in your request and you exceed your Concurrent Job Limit, your job will automatically be added to a
      # queue to be processed once your concurrent job count is below the limit. You must include the
      # following parameters in your StartCallAnalyticsJob request: region : The Amazon Web Services Region
      # where you are making your request. For a list of Amazon Web Services Regions supported with Amazon
      # Transcribe, refer to Amazon Transcribe endpoints and quotas . CallAnalyticsJobName : A custom name
      # that you create for your transcription job that's unique within your Amazon Web Services account.
      # Media ( MediaFileUri or RedactedMediaFileUri ): The Amazon S3 location of your media file. With Call
      # Analytics, you can redact the audio contained in your media file by including RedactedMediaFileUri ,
      # instead of MediaFileUri , to specify the location of your input audio. If you choose to redact your
      # audio, you can find your redacted media at the location specified in the RedactedMediaFileUri field
      # of your response.

      def start_call_analytics_job(
        call_analytics_job_name : String,
        media : Types::Media,
        channel_definitions : Array(Types::ChannelDefinition)? = nil,
        data_access_role_arn : String? = nil,
        output_encryption_kms_key_id : String? = nil,
        output_location : String? = nil,
        settings : Types::CallAnalyticsJobSettings? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartCallAnalyticsJobResponse

        input = Types::StartCallAnalyticsJobRequest.new(call_analytics_job_name: call_analytics_job_name, media: media, channel_definitions: channel_definitions, data_access_role_arn: data_access_role_arn, output_encryption_kms_key_id: output_encryption_kms_key_id, output_location: output_location, settings: settings, tags: tags)
        start_call_analytics_job(input)
      end

      def start_call_analytics_job(input : Types::StartCallAnalyticsJobRequest) : Types::StartCallAnalyticsJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_CALL_ANALYTICS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCallAnalyticsJobResponse, "StartCallAnalyticsJob")
      end

      # Transcribes patient-clinician conversations and generates clinical notes. Amazon Web Services
      # HealthScribe automatically provides rich conversation transcripts, identifies speaker roles,
      # classifies dialogues, extracts medical terms, and generates preliminary clinical notes. To learn
      # more about these features, refer to Amazon Web Services HealthScribe . To make a
      # StartMedicalScribeJob request, you must first upload your media file into an Amazon S3 bucket; you
      # can then specify the Amazon S3 location of the file using the Media parameter. You must include the
      # following parameters in your StartMedicalTranscriptionJob request: DataAccessRoleArn : The ARN of an
      # IAM role with the these minimum permissions: read permission on input file Amazon S3 bucket
      # specified in Media , write permission on the Amazon S3 bucket specified in OutputBucketName , and
      # full permissions on the KMS key specified in OutputEncryptionKMSKeyId (if set). The role should also
      # allow transcribe.amazonaws.com to assume it. Media ( MediaFileUri ): The Amazon S3 location of your
      # media file. MedicalScribeJobName : A custom name you create for your MedicalScribe job that is
      # unique within your Amazon Web Services account. OutputBucketName : The Amazon S3 bucket where you
      # want your output files stored. Settings : A MedicalScribeSettings object that must set exactly one
      # of ShowSpeakerLabels or ChannelIdentification to true. If ShowSpeakerLabels is true,
      # MaxSpeakerLabels must also be set. ChannelDefinitions : A MedicalScribeChannelDefinitions array
      # should be set if and only if the ChannelIdentification value of Settings is set to true.

      def start_medical_scribe_job(
        data_access_role_arn : String,
        media : Types::Media,
        medical_scribe_job_name : String,
        output_bucket_name : String,
        settings : Types::MedicalScribeSettings,
        channel_definitions : Array(Types::MedicalScribeChannelDefinition)? = nil,
        kms_encryption_context : Hash(String, String)? = nil,
        medical_scribe_context : Types::MedicalScribeContext? = nil,
        output_encryption_kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartMedicalScribeJobResponse

        input = Types::StartMedicalScribeJobRequest.new(data_access_role_arn: data_access_role_arn, media: media, medical_scribe_job_name: medical_scribe_job_name, output_bucket_name: output_bucket_name, settings: settings, channel_definitions: channel_definitions, kms_encryption_context: kms_encryption_context, medical_scribe_context: medical_scribe_context, output_encryption_kms_key_id: output_encryption_kms_key_id, tags: tags)
        start_medical_scribe_job(input)
      end

      def start_medical_scribe_job(input : Types::StartMedicalScribeJobRequest) : Types::StartMedicalScribeJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_MEDICAL_SCRIBE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMedicalScribeJobResponse, "StartMedicalScribeJob")
      end

      # Transcribes the audio from a medical dictation or conversation and applies any additional Request
      # Parameters you choose to include in your request. In addition to many standard transcription
      # features, Amazon Transcribe Medical provides you with a robust medical vocabulary and, optionally,
      # content identification, which adds flags to personal health information (PHI). To learn more about
      # these features, refer to How Amazon Transcribe Medical works . To make a
      # StartMedicalTranscriptionJob request, you must first upload your media file into an Amazon S3
      # bucket; you can then specify the Amazon S3 location of the file using the Media parameter. You must
      # include the following parameters in your StartMedicalTranscriptionJob request: region : The Amazon
      # Web Services Region where you are making your request. For a list of Amazon Web Services Regions
      # supported with Amazon Transcribe, refer to Amazon Transcribe endpoints and quotas .
      # MedicalTranscriptionJobName : A custom name you create for your transcription job that is unique
      # within your Amazon Web Services account. Media ( MediaFileUri ): The Amazon S3 location of your
      # media file. LanguageCode : This must be en-US . OutputBucketName : The Amazon S3 bucket where you
      # want your transcript stored. If you want your output stored in a sub-folder of this bucket, you must
      # also include OutputKey . Specialty : This must be PRIMARYCARE . Type : Choose whether your audio is
      # a conversation or a dictation.

      def start_medical_transcription_job(
        language_code : String,
        media : Types::Media,
        medical_transcription_job_name : String,
        output_bucket_name : String,
        specialty : String,
        type : String,
        content_identification_type : String? = nil,
        kms_encryption_context : Hash(String, String)? = nil,
        media_format : String? = nil,
        media_sample_rate_hertz : Int32? = nil,
        output_encryption_kms_key_id : String? = nil,
        output_key : String? = nil,
        settings : Types::MedicalTranscriptionSetting? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartMedicalTranscriptionJobResponse

        input = Types::StartMedicalTranscriptionJobRequest.new(language_code: language_code, media: media, medical_transcription_job_name: medical_transcription_job_name, output_bucket_name: output_bucket_name, specialty: specialty, type: type, content_identification_type: content_identification_type, kms_encryption_context: kms_encryption_context, media_format: media_format, media_sample_rate_hertz: media_sample_rate_hertz, output_encryption_kms_key_id: output_encryption_kms_key_id, output_key: output_key, settings: settings, tags: tags)
        start_medical_transcription_job(input)
      end

      def start_medical_transcription_job(input : Types::StartMedicalTranscriptionJobRequest) : Types::StartMedicalTranscriptionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_MEDICAL_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMedicalTranscriptionJobResponse, "StartMedicalTranscriptionJob")
      end

      # Transcribes the audio from a media file and applies any additional Request Parameters you choose to
      # include in your request. To make a StartTranscriptionJob request, you must first upload your media
      # file into an Amazon S3 bucket; you can then specify the Amazon S3 location of the file using the
      # Media parameter. You must include the following parameters in your StartTranscriptionJob request:
      # region : The Amazon Web Services Region where you are making your request. For a list of Amazon Web
      # Services Regions supported with Amazon Transcribe, refer to Amazon Transcribe endpoints and quotas .
      # TranscriptionJobName : A custom name you create for your transcription job that is unique within
      # your Amazon Web Services account. Media ( MediaFileUri ): The Amazon S3 location of your media file.
      # One of LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages : If you know the language of
      # your media file, specify it using the LanguageCode parameter; you can find all valid language codes
      # in the Supported languages table. If you do not know the languages spoken in your media, use either
      # IdentifyLanguage or IdentifyMultipleLanguages and let Amazon Transcribe identify the languages for
      # you.

      def start_transcription_job(
        media : Types::Media,
        transcription_job_name : String,
        content_redaction : Types::ContentRedaction? = nil,
        identify_language : Bool? = nil,
        identify_multiple_languages : Bool? = nil,
        job_execution_settings : Types::JobExecutionSettings? = nil,
        kms_encryption_context : Hash(String, String)? = nil,
        language_code : String? = nil,
        language_id_settings : Hash(String, Types::LanguageIdSettings)? = nil,
        language_options : Array(String)? = nil,
        media_format : String? = nil,
        media_sample_rate_hertz : Int32? = nil,
        model_settings : Types::ModelSettings? = nil,
        output_bucket_name : String? = nil,
        output_encryption_kms_key_id : String? = nil,
        output_key : String? = nil,
        settings : Types::Settings? = nil,
        subtitles : Types::Subtitles? = nil,
        tags : Array(Types::Tag)? = nil,
        toxicity_detection : Array(Types::ToxicityDetectionSettings)? = nil
      ) : Types::StartTranscriptionJobResponse

        input = Types::StartTranscriptionJobRequest.new(media: media, transcription_job_name: transcription_job_name, content_redaction: content_redaction, identify_language: identify_language, identify_multiple_languages: identify_multiple_languages, job_execution_settings: job_execution_settings, kms_encryption_context: kms_encryption_context, language_code: language_code, language_id_settings: language_id_settings, language_options: language_options, media_format: media_format, media_sample_rate_hertz: media_sample_rate_hertz, model_settings: model_settings, output_bucket_name: output_bucket_name, output_encryption_kms_key_id: output_encryption_kms_key_id, output_key: output_key, settings: settings, subtitles: subtitles, tags: tags, toxicity_detection: toxicity_detection)
        start_transcription_job(input)
      end

      def start_transcription_job(input : Types::StartTranscriptionJobRequest) : Types::StartTranscriptionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_TRANSCRIPTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTranscriptionJobResponse, "StartTranscriptionJob")
      end

      # Adds one or more custom tags, each in the form of a key:value pair, to the specified resource. To
      # learn more about using tags with Amazon Transcribe, refer to Tagging resources .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the specified tags from the specified Amazon Transcribe resource. If you include
      # UntagResource in your request, you must also include ResourceArn and TagKeys .

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the specified Call Analytics category with new rules. Note that the
      # UpdateCallAnalyticsCategory operation overwrites all existing rules contained in the specified
      # category. You cannot append additional rules onto an existing category. To create a new category,
      # see .

      def update_call_analytics_category(
        category_name : String,
        rules : Array(Types::Rule),
        input_type : String? = nil
      ) : Types::UpdateCallAnalyticsCategoryResponse

        input = Types::UpdateCallAnalyticsCategoryRequest.new(category_name: category_name, rules: rules, input_type: input_type)
        update_call_analytics_category(input)
      end

      def update_call_analytics_category(input : Types::UpdateCallAnalyticsCategoryRequest) : Types::UpdateCallAnalyticsCategoryResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CALL_ANALYTICS_CATEGORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCallAnalyticsCategoryResponse, "UpdateCallAnalyticsCategory")
      end

      # Updates an existing custom medical vocabulary with new values. This operation overwrites all
      # existing information with your new values; you cannot append new terms onto an existing custom
      # vocabulary.

      def update_medical_vocabulary(
        language_code : String,
        vocabulary_file_uri : String,
        vocabulary_name : String
      ) : Types::UpdateMedicalVocabularyResponse

        input = Types::UpdateMedicalVocabularyRequest.new(language_code: language_code, vocabulary_file_uri: vocabulary_file_uri, vocabulary_name: vocabulary_name)
        update_medical_vocabulary(input)
      end

      def update_medical_vocabulary(input : Types::UpdateMedicalVocabularyRequest) : Types::UpdateMedicalVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MEDICAL_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMedicalVocabularyResponse, "UpdateMedicalVocabulary")
      end

      # Updates an existing custom vocabulary with new values. This operation overwrites all existing
      # information with your new values; you cannot append new terms onto an existing custom vocabulary.

      def update_vocabulary(
        language_code : String,
        vocabulary_name : String,
        data_access_role_arn : String? = nil,
        phrases : Array(String)? = nil,
        vocabulary_file_uri : String? = nil
      ) : Types::UpdateVocabularyResponse

        input = Types::UpdateVocabularyRequest.new(language_code: language_code, vocabulary_name: vocabulary_name, data_access_role_arn: data_access_role_arn, phrases: phrases, vocabulary_file_uri: vocabulary_file_uri)
        update_vocabulary(input)
      end

      def update_vocabulary(input : Types::UpdateVocabularyRequest) : Types::UpdateVocabularyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VOCABULARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVocabularyResponse, "UpdateVocabulary")
      end

      # Updates an existing custom vocabulary filter with a new list of words. The new list you provide
      # overwrites all previous entries; you cannot append new terms onto an existing custom vocabulary
      # filter.

      def update_vocabulary_filter(
        vocabulary_filter_name : String,
        data_access_role_arn : String? = nil,
        vocabulary_filter_file_uri : String? = nil,
        words : Array(String)? = nil
      ) : Types::UpdateVocabularyFilterResponse

        input = Types::UpdateVocabularyFilterRequest.new(vocabulary_filter_name: vocabulary_filter_name, data_access_role_arn: data_access_role_arn, vocabulary_filter_file_uri: vocabulary_filter_file_uri, words: words)
        update_vocabulary_filter(input)
      end

      def update_vocabulary_filter(input : Types::UpdateVocabularyFilterRequest) : Types::UpdateVocabularyFilterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VOCABULARY_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVocabularyFilterResponse, "UpdateVocabularyFilter")
      end
    end
  end
end
