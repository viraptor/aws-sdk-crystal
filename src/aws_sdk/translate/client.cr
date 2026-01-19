module AwsSdk
  module Translate
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a parallel data resource in Amazon Translate by importing an input file from Amazon S3.
      # Parallel data files contain examples that show how you want segments of text to be translated. By
      # adding parallel data, you can influence the style, tone, and word choice in your translation output.
      def create_parallel_data(
        client_token : String,
        name : String,
        parallel_data_config : Types::ParallelDataConfig,
        description : String? = nil,
        encryption_key : Types::EncryptionKey? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateParallelDataResponse
        input = Types::CreateParallelDataRequest.new(client_token: client_token, name: name, parallel_data_config: parallel_data_config, description: description, encryption_key: encryption_key, tags: tags)
        create_parallel_data(input)
      end
      def create_parallel_data(input : Types::CreateParallelDataRequest) : Types::CreateParallelDataResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARALLEL_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateParallelDataResponse, "CreateParallelData")
      end

      # Deletes a parallel data resource in Amazon Translate.
      def delete_parallel_data(
        name : String
      ) : Types::DeleteParallelDataResponse
        input = Types::DeleteParallelDataRequest.new(name: name)
        delete_parallel_data(input)
      end
      def delete_parallel_data(input : Types::DeleteParallelDataRequest) : Types::DeleteParallelDataResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARALLEL_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteParallelDataResponse, "DeleteParallelData")
      end

      # A synchronous action that deletes a custom terminology.
      def delete_terminology(
        name : String
      ) : Nil
        input = Types::DeleteTerminologyRequest.new(name: name)
        delete_terminology(input)
      end
      def delete_terminology(input : Types::DeleteTerminologyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TERMINOLOGY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets the properties associated with an asynchronous batch translation job including name, ID,
      # status, source and target languages, input/output S3 buckets, and so on.
      def describe_text_translation_job(
        job_id : String
      ) : Types::DescribeTextTranslationJobResponse
        input = Types::DescribeTextTranslationJobRequest.new(job_id: job_id)
        describe_text_translation_job(input)
      end
      def describe_text_translation_job(input : Types::DescribeTextTranslationJobRequest) : Types::DescribeTextTranslationJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TEXT_TRANSLATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTextTranslationJobResponse, "DescribeTextTranslationJob")
      end

      # Provides information about a parallel data resource.
      def get_parallel_data(
        name : String
      ) : Types::GetParallelDataResponse
        input = Types::GetParallelDataRequest.new(name: name)
        get_parallel_data(input)
      end
      def get_parallel_data(input : Types::GetParallelDataRequest) : Types::GetParallelDataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARALLEL_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParallelDataResponse, "GetParallelData")
      end

      # Retrieves a custom terminology.
      def get_terminology(
        name : String,
        terminology_data_format : String? = nil
      ) : Types::GetTerminologyResponse
        input = Types::GetTerminologyRequest.new(name: name, terminology_data_format: terminology_data_format)
        get_terminology(input)
      end
      def get_terminology(input : Types::GetTerminologyRequest) : Types::GetTerminologyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TERMINOLOGY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTerminologyResponse, "GetTerminology")
      end

      # Creates or updates a custom terminology, depending on whether one already exists for the given
      # terminology name. Importing a terminology with the same name as an existing one will merge the
      # terminologies based on the chosen merge strategy. The only supported merge strategy is OVERWRITE,
      # where the imported terminology overwrites the existing terminology of the same name. If you import a
      # terminology that overwrites an existing one, the new terminology takes up to 10 minutes to fully
      # propagate. After that, translations have access to the new terminology.
      def import_terminology(
        merge_strategy : String,
        name : String,
        terminology_data : Types::TerminologyData,
        description : String? = nil,
        encryption_key : Types::EncryptionKey? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportTerminologyResponse
        input = Types::ImportTerminologyRequest.new(merge_strategy: merge_strategy, name: name, terminology_data: terminology_data, description: description, encryption_key: encryption_key, tags: tags)
        import_terminology(input)
      end
      def import_terminology(input : Types::ImportTerminologyRequest) : Types::ImportTerminologyResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_TERMINOLOGY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportTerminologyResponse, "ImportTerminology")
      end

      # Provides a list of languages (RFC-5646 codes and names) that Amazon Translate supports.
      def list_languages(
        display_language_code : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLanguagesResponse
        input = Types::ListLanguagesRequest.new(display_language_code: display_language_code, max_results: max_results, next_token: next_token)
        list_languages(input)
      end
      def list_languages(input : Types::ListLanguagesRequest) : Types::ListLanguagesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LANGUAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLanguagesResponse, "ListLanguages")
      end

      # Provides a list of your parallel data resources in Amazon Translate.
      def list_parallel_data(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListParallelDataResponse
        input = Types::ListParallelDataRequest.new(max_results: max_results, next_token: next_token)
        list_parallel_data(input)
      end
      def list_parallel_data(input : Types::ListParallelDataRequest) : Types::ListParallelDataResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARALLEL_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListParallelDataResponse, "ListParallelData")
      end

      # Lists all tags associated with a given Amazon Translate resource. For more information, see Tagging
      # your resources .
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

      # Provides a list of custom terminologies associated with your account.
      def list_terminologies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTerminologiesResponse
        input = Types::ListTerminologiesRequest.new(max_results: max_results, next_token: next_token)
        list_terminologies(input)
      end
      def list_terminologies(input : Types::ListTerminologiesRequest) : Types::ListTerminologiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TERMINOLOGIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTerminologiesResponse, "ListTerminologies")
      end

      # Gets a list of the batch translation jobs that you have submitted.
      def list_text_translation_jobs(
        filter : Types::TextTranslationJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTextTranslationJobsResponse
        input = Types::ListTextTranslationJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_text_translation_jobs(input)
      end
      def list_text_translation_jobs(input : Types::ListTextTranslationJobsRequest) : Types::ListTextTranslationJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TEXT_TRANSLATION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTextTranslationJobsResponse, "ListTextTranslationJobs")
      end

      # Starts an asynchronous batch translation job. Use batch translation jobs to translate large volumes
      # of text across multiple documents at once. For batch translation, you can input documents with
      # different source languages (specify auto as the source language). You can specify one or more target
      # languages. Batch translation translates each input document into each of the target languages. For
      # more information, see Asynchronous batch processing . Batch translation jobs can be described with
      # the DescribeTextTranslationJob operation, listed with the ListTextTranslationJobs operation, and
      # stopped with the StopTextTranslationJob operation.
      def start_text_translation_job(
        client_token : String,
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        source_language_code : String,
        target_language_codes : Array(String),
        job_name : String? = nil,
        parallel_data_names : Array(String)? = nil,
        settings : Types::TranslationSettings? = nil,
        terminology_names : Array(String)? = nil
      ) : Types::StartTextTranslationJobResponse
        input = Types::StartTextTranslationJobRequest.new(client_token: client_token, data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, output_data_config: output_data_config, source_language_code: source_language_code, target_language_codes: target_language_codes, job_name: job_name, parallel_data_names: parallel_data_names, settings: settings, terminology_names: terminology_names)
        start_text_translation_job(input)
      end
      def start_text_translation_job(input : Types::StartTextTranslationJobRequest) : Types::StartTextTranslationJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_TEXT_TRANSLATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTextTranslationJobResponse, "StartTextTranslationJob")
      end

      # Stops an asynchronous batch translation job that is in progress. If the job's state is IN_PROGRESS ,
      # the job will be marked for termination and put into the STOP_REQUESTED state. If the job completes
      # before it can be stopped, it is put into the COMPLETED state. Otherwise, the job is put into the
      # STOPPED state. Asynchronous batch translation jobs are started with the StartTextTranslationJob
      # operation. You can use the DescribeTextTranslationJob or ListTextTranslationJobs operations to get a
      # batch translation job's JobId .
      def stop_text_translation_job(
        job_id : String
      ) : Types::StopTextTranslationJobResponse
        input = Types::StopTextTranslationJobRequest.new(job_id: job_id)
        stop_text_translation_job(input)
      end
      def stop_text_translation_job(input : Types::StopTextTranslationJobRequest) : Types::StopTextTranslationJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TEXT_TRANSLATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTextTranslationJobResponse, "StopTextTranslationJob")
      end

      # Associates a specific tag with a resource. A tag is a key-value pair that adds as a metadata to a
      # resource. For more information, see Tagging your resources .
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

      # Translates the input document from the source language to the target language. This synchronous
      # operation supports text, HTML, or Word documents as the input document. TranslateDocument supports
      # translations from English to any supported language, and from any supported language to English.
      # Therefore, specify either the source language code or the target language code as “en” (English). If
      # you set the Formality parameter, the request will fail if the target language does not support
      # formality. For a list of target languages that support formality, see Setting formality .
      def translate_document(
        document : Types::Document,
        source_language_code : String,
        target_language_code : String,
        settings : Types::TranslationSettings? = nil,
        terminology_names : Array(String)? = nil
      ) : Types::TranslateDocumentResponse
        input = Types::TranslateDocumentRequest.new(document: document, source_language_code: source_language_code, target_language_code: target_language_code, settings: settings, terminology_names: terminology_names)
        translate_document(input)
      end
      def translate_document(input : Types::TranslateDocumentRequest) : Types::TranslateDocumentResponse
        request = Protocol::JsonRpc.build_request(Model::TRANSLATE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TranslateDocumentResponse, "TranslateDocument")
      end

      # Translates input text from the source language to the target language. For a list of available
      # languages and language codes, see Supported languages .
      def translate_text(
        source_language_code : String,
        target_language_code : String,
        text : String,
        settings : Types::TranslationSettings? = nil,
        terminology_names : Array(String)? = nil
      ) : Types::TranslateTextResponse
        input = Types::TranslateTextRequest.new(source_language_code: source_language_code, target_language_code: target_language_code, text: text, settings: settings, terminology_names: terminology_names)
        translate_text(input)
      end
      def translate_text(input : Types::TranslateTextRequest) : Types::TranslateTextResponse
        request = Protocol::JsonRpc.build_request(Model::TRANSLATE_TEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TranslateTextResponse, "TranslateText")
      end

      # Removes a specific tag associated with an Amazon Translate resource. For more information, see
      # Tagging your resources .
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

      # Updates a previously created parallel data resource by importing a new input file from Amazon S3.
      def update_parallel_data(
        client_token : String,
        name : String,
        parallel_data_config : Types::ParallelDataConfig,
        description : String? = nil
      ) : Types::UpdateParallelDataResponse
        input = Types::UpdateParallelDataRequest.new(client_token: client_token, name: name, parallel_data_config: parallel_data_config, description: description)
        update_parallel_data(input)
      end
      def update_parallel_data(input : Types::UpdateParallelDataRequest) : Types::UpdateParallelDataResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PARALLEL_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateParallelDataResponse, "UpdateParallelData")
      end
    end
  end
end
