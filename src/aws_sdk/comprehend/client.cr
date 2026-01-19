module AwsSdk
  module Comprehend
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

      # Determines the dominant language of the input text for a batch of documents. For a list of languages
      # that Amazon Comprehend can detect, see Amazon Comprehend Supported Languages .
      def batch_detect_dominant_language(
        text_list : Array(String)
      ) : Types::BatchDetectDominantLanguageResponse
        input = Types::BatchDetectDominantLanguageRequest.new(text_list: text_list)
        batch_detect_dominant_language(input)
      end
      def batch_detect_dominant_language(input : Types::BatchDetectDominantLanguageRequest) : Types::BatchDetectDominantLanguageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_DOMINANT_LANGUAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectDominantLanguageResponse, "BatchDetectDominantLanguage")
      end

      # Inspects the text of a batch of documents for named entities and returns information about them. For
      # more information about named entities, see Entities in the Comprehend Developer Guide.
      def batch_detect_entities(
        language_code : String,
        text_list : Array(String)
      ) : Types::BatchDetectEntitiesResponse
        input = Types::BatchDetectEntitiesRequest.new(language_code: language_code, text_list: text_list)
        batch_detect_entities(input)
      end
      def batch_detect_entities(input : Types::BatchDetectEntitiesRequest) : Types::BatchDetectEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectEntitiesResponse, "BatchDetectEntities")
      end

      # Detects the key noun phrases found in a batch of documents.
      def batch_detect_key_phrases(
        language_code : String,
        text_list : Array(String)
      ) : Types::BatchDetectKeyPhrasesResponse
        input = Types::BatchDetectKeyPhrasesRequest.new(language_code: language_code, text_list: text_list)
        batch_detect_key_phrases(input)
      end
      def batch_detect_key_phrases(input : Types::BatchDetectKeyPhrasesRequest) : Types::BatchDetectKeyPhrasesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_KEY_PHRASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectKeyPhrasesResponse, "BatchDetectKeyPhrases")
      end

      # Inspects a batch of documents and returns an inference of the prevailing sentiment, POSITIVE ,
      # NEUTRAL , MIXED , or NEGATIVE , in each one.
      def batch_detect_sentiment(
        language_code : String,
        text_list : Array(String)
      ) : Types::BatchDetectSentimentResponse
        input = Types::BatchDetectSentimentRequest.new(language_code: language_code, text_list: text_list)
        batch_detect_sentiment(input)
      end
      def batch_detect_sentiment(input : Types::BatchDetectSentimentRequest) : Types::BatchDetectSentimentResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_SENTIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectSentimentResponse, "BatchDetectSentiment")
      end

      # Inspects the text of a batch of documents for the syntax and part of speech of the words in the
      # document and returns information about them. For more information, see Syntax in the Comprehend
      # Developer Guide.
      def batch_detect_syntax(
        language_code : String,
        text_list : Array(String)
      ) : Types::BatchDetectSyntaxResponse
        input = Types::BatchDetectSyntaxRequest.new(language_code: language_code, text_list: text_list)
        batch_detect_syntax(input)
      end
      def batch_detect_syntax(input : Types::BatchDetectSyntaxRequest) : Types::BatchDetectSyntaxResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_SYNTAX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectSyntaxResponse, "BatchDetectSyntax")
      end

      # Inspects a batch of documents and returns a sentiment analysis for each entity identified in the
      # documents. For more information about targeted sentiment, see Targeted sentiment in the Amazon
      # Comprehend Developer Guide .
      def batch_detect_targeted_sentiment(
        language_code : String,
        text_list : Array(String)
      ) : Types::BatchDetectTargetedSentimentResponse
        input = Types::BatchDetectTargetedSentimentRequest.new(language_code: language_code, text_list: text_list)
        batch_detect_targeted_sentiment(input)
      end
      def batch_detect_targeted_sentiment(input : Types::BatchDetectTargetedSentimentRequest) : Types::BatchDetectTargetedSentimentResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DETECT_TARGETED_SENTIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDetectTargetedSentimentResponse, "BatchDetectTargetedSentiment")
      end

      # Creates a classification request to analyze a single document in real-time. ClassifyDocument
      # supports the following model types: Custom classifier - a custom model that you have created and
      # trained. For input, you can provide plain text, a single-page document (PDF, Word, or image), or
      # Amazon Textract API output. For more information, see Custom classification in the Amazon Comprehend
      # Developer Guide . Prompt safety classifier - Amazon Comprehend provides a pre-trained model for
      # classifying input prompts for generative AI applications. For input, you provide English plain text
      # input. For prompt safety classification, the response includes only the Classes field. For more
      # information about prompt safety classifiers, see Prompt safety classification in the Amazon
      # Comprehend Developer Guide . If the system detects errors while processing a page in the input
      # document, the API response includes an Errors field that describes the errors. If the system detects
      # a document-level error in your input document, the API returns an InvalidRequestException error
      # response. For details about this exception, see Errors in semi-structured documents in the
      # Comprehend Developer Guide.
      def classify_document(
        endpoint_arn : String,
        bytes : Bytes? = nil,
        document_reader_config : Types::DocumentReaderConfig? = nil,
        text : String? = nil
      ) : Types::ClassifyDocumentResponse
        input = Types::ClassifyDocumentRequest.new(endpoint_arn: endpoint_arn, bytes: bytes, document_reader_config: document_reader_config, text: text)
        classify_document(input)
      end
      def classify_document(input : Types::ClassifyDocumentRequest) : Types::ClassifyDocumentResponse
        request = Protocol::JsonRpc.build_request(Model::CLASSIFY_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ClassifyDocumentResponse, "ClassifyDocument")
      end

      # Analyzes input text for the presence of personally identifiable information (PII) and returns the
      # labels of identified PII entity types such as name, address, bank account number, or phone number.
      def contains_pii_entities(
        language_code : String,
        text : String
      ) : Types::ContainsPiiEntitiesResponse
        input = Types::ContainsPiiEntitiesRequest.new(language_code: language_code, text: text)
        contains_pii_entities(input)
      end
      def contains_pii_entities(input : Types::ContainsPiiEntitiesRequest) : Types::ContainsPiiEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::CONTAINS_PII_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ContainsPiiEntitiesResponse, "ContainsPiiEntities")
      end

      # Creates a dataset to upload training or test data for a model associated with a flywheel. For more
      # information about datasets, see Flywheel overview in the Amazon Comprehend Developer Guide .
      def create_dataset(
        dataset_name : String,
        flywheel_arn : String,
        input_data_config : Types::DatasetInputDataConfig,
        client_request_token : String? = nil,
        dataset_type : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatasetResponse
        input = Types::CreateDatasetRequest.new(dataset_name: dataset_name, flywheel_arn: flywheel_arn, input_data_config: input_data_config, client_request_token: client_request_token, dataset_type: dataset_type, description: description, tags: tags)
        create_dataset(input)
      end
      def create_dataset(input : Types::CreateDatasetRequest) : Types::CreateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetResponse, "CreateDataset")
      end

      # Creates a new document classifier that you can use to categorize documents. To create a classifier,
      # you provide a set of training documents that are labeled with the categories that you want to use.
      # For more information, see Training classifier models in the Comprehend Developer Guide.
      def create_document_classifier(
        data_access_role_arn : String,
        document_classifier_name : String,
        input_data_config : Types::DocumentClassifierInputDataConfig,
        language_code : String,
        client_request_token : String? = nil,
        mode : String? = nil,
        model_kms_key_id : String? = nil,
        model_policy : String? = nil,
        output_data_config : Types::DocumentClassifierOutputDataConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        version_name : String? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateDocumentClassifierResponse
        input = Types::CreateDocumentClassifierRequest.new(data_access_role_arn: data_access_role_arn, document_classifier_name: document_classifier_name, input_data_config: input_data_config, language_code: language_code, client_request_token: client_request_token, mode: mode, model_kms_key_id: model_kms_key_id, model_policy: model_policy, output_data_config: output_data_config, tags: tags, version_name: version_name, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        create_document_classifier(input)
      end
      def create_document_classifier(input : Types::CreateDocumentClassifierRequest) : Types::CreateDocumentClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOCUMENT_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDocumentClassifierResponse, "CreateDocumentClassifier")
      end

      # Creates a model-specific endpoint for synchronous inference for a previously trained custom model
      # For information about endpoints, see Managing endpoints .
      def create_endpoint(
        desired_inference_units : Int32,
        endpoint_name : String,
        client_request_token : String? = nil,
        data_access_role_arn : String? = nil,
        flywheel_arn : String? = nil,
        model_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEndpointResponse
        input = Types::CreateEndpointRequest.new(desired_inference_units: desired_inference_units, endpoint_name: endpoint_name, client_request_token: client_request_token, data_access_role_arn: data_access_role_arn, flywheel_arn: flywheel_arn, model_arn: model_arn, tags: tags)
        create_endpoint(input)
      end
      def create_endpoint(input : Types::CreateEndpointRequest) : Types::CreateEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointResponse, "CreateEndpoint")
      end

      # Creates an entity recognizer using submitted files. After your CreateEntityRecognizer request is
      # submitted, you can check job status using the DescribeEntityRecognizer API.
      def create_entity_recognizer(
        data_access_role_arn : String,
        input_data_config : Types::EntityRecognizerInputDataConfig,
        language_code : String,
        recognizer_name : String,
        client_request_token : String? = nil,
        model_kms_key_id : String? = nil,
        model_policy : String? = nil,
        tags : Array(Types::Tag)? = nil,
        version_name : String? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateEntityRecognizerResponse
        input = Types::CreateEntityRecognizerRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, recognizer_name: recognizer_name, client_request_token: client_request_token, model_kms_key_id: model_kms_key_id, model_policy: model_policy, tags: tags, version_name: version_name, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        create_entity_recognizer(input)
      end
      def create_entity_recognizer(input : Types::CreateEntityRecognizerRequest) : Types::CreateEntityRecognizerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENTITY_RECOGNIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEntityRecognizerResponse, "CreateEntityRecognizer")
      end

      # A flywheel is an Amazon Web Services resource that orchestrates the ongoing training of a model for
      # custom classification or custom entity recognition. You can create a flywheel to start with an
      # existing trained model, or Comprehend can create and train a new model. When you create the
      # flywheel, Comprehend creates a data lake in your account. The data lake holds the training data and
      # test data for all versions of the model. To use a flywheel with an existing trained model, you
      # specify the active model version. Comprehend copies the model's training data and test data into the
      # flywheel's data lake. To use the flywheel with a new model, you need to provide a dataset for
      # training data (and optional test data) when you create the flywheel. For more information about
      # flywheels, see Flywheel overview in the Amazon Comprehend Developer Guide .
      def create_flywheel(
        data_access_role_arn : String,
        data_lake_s3_uri : String,
        flywheel_name : String,
        active_model_arn : String? = nil,
        client_request_token : String? = nil,
        data_security_config : Types::DataSecurityConfig? = nil,
        model_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        task_config : Types::TaskConfig? = nil
      ) : Types::CreateFlywheelResponse
        input = Types::CreateFlywheelRequest.new(data_access_role_arn: data_access_role_arn, data_lake_s3_uri: data_lake_s3_uri, flywheel_name: flywheel_name, active_model_arn: active_model_arn, client_request_token: client_request_token, data_security_config: data_security_config, model_type: model_type, tags: tags, task_config: task_config)
        create_flywheel(input)
      end
      def create_flywheel(input : Types::CreateFlywheelRequest) : Types::CreateFlywheelResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLYWHEEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFlywheelResponse, "CreateFlywheel")
      end

      # Deletes a previously created document classifier Only those classifiers that are in terminated
      # states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a
      # ResourceInUseException will be returned. This is an asynchronous action that puts the classifier
      # into a DELETING state, and it is then removed by a background job. Once removed, the classifier
      # disappears from your account and is no longer available for use.
      def delete_document_classifier(
        document_classifier_arn : String
      ) : Types::DeleteDocumentClassifierResponse
        input = Types::DeleteDocumentClassifierRequest.new(document_classifier_arn: document_classifier_arn)
        delete_document_classifier(input)
      end
      def delete_document_classifier(input : Types::DeleteDocumentClassifierRequest) : Types::DeleteDocumentClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOCUMENT_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDocumentClassifierResponse, "DeleteDocumentClassifier")
      end

      # Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be
      # deleted in order for the model to be deleted. For information about endpoints, see Managing
      # endpoints .
      def delete_endpoint(
        endpoint_arn : String
      ) : Types::DeleteEndpointResponse
        input = Types::DeleteEndpointRequest.new(endpoint_arn: endpoint_arn)
        delete_endpoint(input)
      end
      def delete_endpoint(input : Types::DeleteEndpointRequest) : Types::DeleteEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEndpointResponse, "DeleteEndpoint")
      end

      # Deletes an entity recognizer. Only those recognizers that are in terminated states (IN_ERROR,
      # TRAINED) will be deleted. If an active inference job is using the model, a ResourceInUseException
      # will be returned. This is an asynchronous action that puts the recognizer into a DELETING state, and
      # it is then removed by a background job. Once removed, the recognizer disappears from your account
      # and is no longer available for use.
      def delete_entity_recognizer(
        entity_recognizer_arn : String
      ) : Types::DeleteEntityRecognizerResponse
        input = Types::DeleteEntityRecognizerRequest.new(entity_recognizer_arn: entity_recognizer_arn)
        delete_entity_recognizer(input)
      end
      def delete_entity_recognizer(input : Types::DeleteEntityRecognizerRequest) : Types::DeleteEntityRecognizerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENTITY_RECOGNIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEntityRecognizerResponse, "DeleteEntityRecognizer")
      end

      # Deletes a flywheel. When you delete the flywheel, Amazon Comprehend does not delete the data lake or
      # the model associated with the flywheel. For more information about flywheels, see Flywheel overview
      # in the Amazon Comprehend Developer Guide .
      def delete_flywheel(
        flywheel_arn : String
      ) : Types::DeleteFlywheelResponse
        input = Types::DeleteFlywheelRequest.new(flywheel_arn: flywheel_arn)
        delete_flywheel(input)
      end
      def delete_flywheel(input : Types::DeleteFlywheelRequest) : Types::DeleteFlywheelResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLYWHEEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFlywheelResponse, "DeleteFlywheel")
      end

      # Deletes a resource-based policy that is attached to a custom model.
      def delete_resource_policy(
        resource_arn : String,
        policy_revision_id : String? = nil
      ) : Types::DeleteResourcePolicyResponse
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn, policy_revision_id: policy_revision_id)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Returns information about the dataset that you specify. For more information about datasets, see
      # Flywheel overview in the Amazon Comprehend Developer Guide .
      def describe_dataset(
        dataset_arn : String
      ) : Types::DescribeDatasetResponse
        input = Types::DescribeDatasetRequest.new(dataset_arn: dataset_arn)
        describe_dataset(input)
      end
      def describe_dataset(input : Types::DescribeDatasetRequest) : Types::DescribeDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetResponse, "DescribeDataset")
      end

      # Gets the properties associated with a document classification job. Use this operation to get the
      # status of a classification job.
      def describe_document_classification_job(
        job_id : String
      ) : Types::DescribeDocumentClassificationJobResponse
        input = Types::DescribeDocumentClassificationJobRequest.new(job_id: job_id)
        describe_document_classification_job(input)
      end
      def describe_document_classification_job(input : Types::DescribeDocumentClassificationJobRequest) : Types::DescribeDocumentClassificationJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOCUMENT_CLASSIFICATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDocumentClassificationJobResponse, "DescribeDocumentClassificationJob")
      end

      # Gets the properties associated with a document classifier.
      def describe_document_classifier(
        document_classifier_arn : String
      ) : Types::DescribeDocumentClassifierResponse
        input = Types::DescribeDocumentClassifierRequest.new(document_classifier_arn: document_classifier_arn)
        describe_document_classifier(input)
      end
      def describe_document_classifier(input : Types::DescribeDocumentClassifierRequest) : Types::DescribeDocumentClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOCUMENT_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDocumentClassifierResponse, "DescribeDocumentClassifier")
      end

      # Gets the properties associated with a dominant language detection job. Use this operation to get the
      # status of a detection job.
      def describe_dominant_language_detection_job(
        job_id : String
      ) : Types::DescribeDominantLanguageDetectionJobResponse
        input = Types::DescribeDominantLanguageDetectionJobRequest.new(job_id: job_id)
        describe_dominant_language_detection_job(input)
      end
      def describe_dominant_language_detection_job(input : Types::DescribeDominantLanguageDetectionJobRequest) : Types::DescribeDominantLanguageDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOMINANT_LANGUAGE_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDominantLanguageDetectionJobResponse, "DescribeDominantLanguageDetectionJob")
      end

      # Gets the properties associated with a specific endpoint. Use this operation to get the status of an
      # endpoint. For information about endpoints, see Managing endpoints .
      def describe_endpoint(
        endpoint_arn : String
      ) : Types::DescribeEndpointResponse
        input = Types::DescribeEndpointRequest.new(endpoint_arn: endpoint_arn)
        describe_endpoint(input)
      end
      def describe_endpoint(input : Types::DescribeEndpointRequest) : Types::DescribeEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointResponse, "DescribeEndpoint")
      end

      # Gets the properties associated with an entities detection job. Use this operation to get the status
      # of a detection job.
      def describe_entities_detection_job(
        job_id : String
      ) : Types::DescribeEntitiesDetectionJobResponse
        input = Types::DescribeEntitiesDetectionJobRequest.new(job_id: job_id)
        describe_entities_detection_job(input)
      end
      def describe_entities_detection_job(input : Types::DescribeEntitiesDetectionJobRequest) : Types::DescribeEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntitiesDetectionJobResponse, "DescribeEntitiesDetectionJob")
      end

      # Provides details about an entity recognizer including status, S3 buckets containing training data,
      # recognizer metadata, metrics, and so on.
      def describe_entity_recognizer(
        entity_recognizer_arn : String
      ) : Types::DescribeEntityRecognizerResponse
        input = Types::DescribeEntityRecognizerRequest.new(entity_recognizer_arn: entity_recognizer_arn)
        describe_entity_recognizer(input)
      end
      def describe_entity_recognizer(input : Types::DescribeEntityRecognizerRequest) : Types::DescribeEntityRecognizerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITY_RECOGNIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntityRecognizerResponse, "DescribeEntityRecognizer")
      end

      # Gets the status and details of an events detection job.
      def describe_events_detection_job(
        job_id : String
      ) : Types::DescribeEventsDetectionJobResponse
        input = Types::DescribeEventsDetectionJobRequest.new(job_id: job_id)
        describe_events_detection_job(input)
      end
      def describe_events_detection_job(input : Types::DescribeEventsDetectionJobRequest) : Types::DescribeEventsDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENTS_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventsDetectionJobResponse, "DescribeEventsDetectionJob")
      end

      # Provides configuration information about the flywheel. For more information about flywheels, see
      # Flywheel overview in the Amazon Comprehend Developer Guide .
      def describe_flywheel(
        flywheel_arn : String
      ) : Types::DescribeFlywheelResponse
        input = Types::DescribeFlywheelRequest.new(flywheel_arn: flywheel_arn)
        describe_flywheel(input)
      end
      def describe_flywheel(input : Types::DescribeFlywheelRequest) : Types::DescribeFlywheelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLYWHEEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFlywheelResponse, "DescribeFlywheel")
      end

      # Retrieve the configuration properties of a flywheel iteration. For more information about flywheels,
      # see Flywheel overview in the Amazon Comprehend Developer Guide .
      def describe_flywheel_iteration(
        flywheel_arn : String,
        flywheel_iteration_id : String
      ) : Types::DescribeFlywheelIterationResponse
        input = Types::DescribeFlywheelIterationRequest.new(flywheel_arn: flywheel_arn, flywheel_iteration_id: flywheel_iteration_id)
        describe_flywheel_iteration(input)
      end
      def describe_flywheel_iteration(input : Types::DescribeFlywheelIterationRequest) : Types::DescribeFlywheelIterationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLYWHEEL_ITERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFlywheelIterationResponse, "DescribeFlywheelIteration")
      end

      # Gets the properties associated with a key phrases detection job. Use this operation to get the
      # status of a detection job.
      def describe_key_phrases_detection_job(
        job_id : String
      ) : Types::DescribeKeyPhrasesDetectionJobResponse
        input = Types::DescribeKeyPhrasesDetectionJobRequest.new(job_id: job_id)
        describe_key_phrases_detection_job(input)
      end
      def describe_key_phrases_detection_job(input : Types::DescribeKeyPhrasesDetectionJobRequest) : Types::DescribeKeyPhrasesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_KEY_PHRASES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeKeyPhrasesDetectionJobResponse, "DescribeKeyPhrasesDetectionJob")
      end

      # Gets the properties associated with a PII entities detection job. For example, you can use this
      # operation to get the job status.
      def describe_pii_entities_detection_job(
        job_id : String
      ) : Types::DescribePiiEntitiesDetectionJobResponse
        input = Types::DescribePiiEntitiesDetectionJobRequest.new(job_id: job_id)
        describe_pii_entities_detection_job(input)
      end
      def describe_pii_entities_detection_job(input : Types::DescribePiiEntitiesDetectionJobRequest) : Types::DescribePiiEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PII_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePiiEntitiesDetectionJobResponse, "DescribePiiEntitiesDetectionJob")
      end

      # Gets the details of a resource-based policy that is attached to a custom model, including the JSON
      # body of the policy.
      def describe_resource_policy(
        resource_arn : String
      ) : Types::DescribeResourcePolicyResponse
        input = Types::DescribeResourcePolicyRequest.new(resource_arn: resource_arn)
        describe_resource_policy(input)
      end
      def describe_resource_policy(input : Types::DescribeResourcePolicyRequest) : Types::DescribeResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourcePolicyResponse, "DescribeResourcePolicy")
      end

      # Gets the properties associated with a sentiment detection job. Use this operation to get the status
      # of a detection job.
      def describe_sentiment_detection_job(
        job_id : String
      ) : Types::DescribeSentimentDetectionJobResponse
        input = Types::DescribeSentimentDetectionJobRequest.new(job_id: job_id)
        describe_sentiment_detection_job(input)
      end
      def describe_sentiment_detection_job(input : Types::DescribeSentimentDetectionJobRequest) : Types::DescribeSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSentimentDetectionJobResponse, "DescribeSentimentDetectionJob")
      end

      # Gets the properties associated with a targeted sentiment detection job. Use this operation to get
      # the status of the job.
      def describe_targeted_sentiment_detection_job(
        job_id : String
      ) : Types::DescribeTargetedSentimentDetectionJobResponse
        input = Types::DescribeTargetedSentimentDetectionJobRequest.new(job_id: job_id)
        describe_targeted_sentiment_detection_job(input)
      end
      def describe_targeted_sentiment_detection_job(input : Types::DescribeTargetedSentimentDetectionJobRequest) : Types::DescribeTargetedSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TARGETED_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTargetedSentimentDetectionJobResponse, "DescribeTargetedSentimentDetectionJob")
      end

      # Gets the properties associated with a topic detection job. Use this operation to get the status of a
      # detection job.
      def describe_topics_detection_job(
        job_id : String
      ) : Types::DescribeTopicsDetectionJobResponse
        input = Types::DescribeTopicsDetectionJobRequest.new(job_id: job_id)
        describe_topics_detection_job(input)
      end
      def describe_topics_detection_job(input : Types::DescribeTopicsDetectionJobRequest) : Types::DescribeTopicsDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TOPICS_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTopicsDetectionJobResponse, "DescribeTopicsDetectionJob")
      end

      # Determines the dominant language of the input text. For a list of languages that Amazon Comprehend
      # can detect, see Amazon Comprehend Supported Languages .
      def detect_dominant_language(
        text : String
      ) : Types::DetectDominantLanguageResponse
        input = Types::DetectDominantLanguageRequest.new(text: text)
        detect_dominant_language(input)
      end
      def detect_dominant_language(input : Types::DetectDominantLanguageRequest) : Types::DetectDominantLanguageResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_DOMINANT_LANGUAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectDominantLanguageResponse, "DetectDominantLanguage")
      end

      # Detects named entities in input text when you use the pre-trained model. Detects custom entities if
      # you have a custom entity recognition model. When detecting named entities using the pre-trained
      # model, use plain text as the input. For more information about named entities, see Entities in the
      # Comprehend Developer Guide. When you use a custom entity recognition model, you can input plain text
      # or you can upload a single-page input document (text, PDF, Word, or image). If the system detects
      # errors while processing a page in the input document, the API response includes an entry in Errors
      # for each error. If the system detects a document-level error in your input document, the API returns
      # an InvalidRequestException error response. For details about this exception, see Errors in
      # semi-structured documents in the Comprehend Developer Guide.
      def detect_entities(
        bytes : Bytes? = nil,
        document_reader_config : Types::DocumentReaderConfig? = nil,
        endpoint_arn : String? = nil,
        language_code : String? = nil,
        text : String? = nil
      ) : Types::DetectEntitiesResponse
        input = Types::DetectEntitiesRequest.new(bytes: bytes, document_reader_config: document_reader_config, endpoint_arn: endpoint_arn, language_code: language_code, text: text)
        detect_entities(input)
      end
      def detect_entities(input : Types::DetectEntitiesRequest) : Types::DetectEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectEntitiesResponse, "DetectEntities")
      end

      # Detects the key noun phrases found in the text.
      def detect_key_phrases(
        language_code : String,
        text : String
      ) : Types::DetectKeyPhrasesResponse
        input = Types::DetectKeyPhrasesRequest.new(language_code: language_code, text: text)
        detect_key_phrases(input)
      end
      def detect_key_phrases(input : Types::DetectKeyPhrasesRequest) : Types::DetectKeyPhrasesResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_KEY_PHRASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectKeyPhrasesResponse, "DetectKeyPhrases")
      end

      # Inspects the input text for entities that contain personally identifiable information (PII) and
      # returns information about them.
      def detect_pii_entities(
        language_code : String,
        text : String
      ) : Types::DetectPiiEntitiesResponse
        input = Types::DetectPiiEntitiesRequest.new(language_code: language_code, text: text)
        detect_pii_entities(input)
      end
      def detect_pii_entities(input : Types::DetectPiiEntitiesRequest) : Types::DetectPiiEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_PII_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectPiiEntitiesResponse, "DetectPiiEntities")
      end

      # Inspects text and returns an inference of the prevailing sentiment ( POSITIVE , NEUTRAL , MIXED , or
      # NEGATIVE ).
      def detect_sentiment(
        language_code : String,
        text : String
      ) : Types::DetectSentimentResponse
        input = Types::DetectSentimentRequest.new(language_code: language_code, text: text)
        detect_sentiment(input)
      end
      def detect_sentiment(input : Types::DetectSentimentRequest) : Types::DetectSentimentResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_SENTIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectSentimentResponse, "DetectSentiment")
      end

      # Inspects text for syntax and the part of speech of words in the document. For more information, see
      # Syntax in the Comprehend Developer Guide.
      def detect_syntax(
        language_code : String,
        text : String
      ) : Types::DetectSyntaxResponse
        input = Types::DetectSyntaxRequest.new(language_code: language_code, text: text)
        detect_syntax(input)
      end
      def detect_syntax(input : Types::DetectSyntaxRequest) : Types::DetectSyntaxResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_SYNTAX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectSyntaxResponse, "DetectSyntax")
      end

      # Inspects the input text and returns a sentiment analysis for each entity identified in the text. For
      # more information about targeted sentiment, see Targeted sentiment in the Amazon Comprehend Developer
      # Guide .
      def detect_targeted_sentiment(
        language_code : String,
        text : String
      ) : Types::DetectTargetedSentimentResponse
        input = Types::DetectTargetedSentimentRequest.new(language_code: language_code, text: text)
        detect_targeted_sentiment(input)
      end
      def detect_targeted_sentiment(input : Types::DetectTargetedSentimentRequest) : Types::DetectTargetedSentimentResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_TARGETED_SENTIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectTargetedSentimentResponse, "DetectTargetedSentiment")
      end

      # Performs toxicity analysis on the list of text strings that you provide as input. The API response
      # contains a results list that matches the size of the input list. For more information about toxicity
      # detection, see Toxicity detection in the Amazon Comprehend Developer Guide .
      def detect_toxic_content(
        language_code : String,
        text_segments : Array(Types::TextSegment)
      ) : Types::DetectToxicContentResponse
        input = Types::DetectToxicContentRequest.new(language_code: language_code, text_segments: text_segments)
        detect_toxic_content(input)
      end
      def detect_toxic_content(input : Types::DetectToxicContentRequest) : Types::DetectToxicContentResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_TOXIC_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectToxicContentResponse, "DetectToxicContent")
      end

      # Creates a new custom model that replicates a source custom model that you import. The source model
      # can be in your Amazon Web Services account or another one. If the source model is in another Amazon
      # Web Services account, then it must have a resource-based policy that authorizes you to import it.
      # The source model must be in the same Amazon Web Services Region that you're using when you import.
      # You can't import a model that's in a different Region.
      def import_model(
        source_model_arn : String,
        data_access_role_arn : String? = nil,
        model_kms_key_id : String? = nil,
        model_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        version_name : String? = nil
      ) : Types::ImportModelResponse
        input = Types::ImportModelRequest.new(source_model_arn: source_model_arn, data_access_role_arn: data_access_role_arn, model_kms_key_id: model_kms_key_id, model_name: model_name, tags: tags, version_name: version_name)
        import_model(input)
      end
      def import_model(input : Types::ImportModelRequest) : Types::ImportModelResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportModelResponse, "ImportModel")
      end

      # List the datasets that you have configured in this Region. For more information about datasets, see
      # Flywheel overview in the Amazon Comprehend Developer Guide .
      def list_datasets(
        filter : Types::DatasetFilter? = nil,
        flywheel_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetsResponse
        input = Types::ListDatasetsRequest.new(filter: filter, flywheel_arn: flywheel_arn, max_results: max_results, next_token: next_token)
        list_datasets(input)
      end
      def list_datasets(input : Types::ListDatasetsRequest) : Types::ListDatasetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetsResponse, "ListDatasets")
      end

      # Gets a list of the documentation classification jobs that you have submitted.
      def list_document_classification_jobs(
        filter : Types::DocumentClassificationJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentClassificationJobsResponse
        input = Types::ListDocumentClassificationJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_document_classification_jobs(input)
      end
      def list_document_classification_jobs(input : Types::ListDocumentClassificationJobsRequest) : Types::ListDocumentClassificationJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENT_CLASSIFICATION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentClassificationJobsResponse, "ListDocumentClassificationJobs")
      end

      # Gets a list of summaries of the document classifiers that you have created
      def list_document_classifier_summaries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentClassifierSummariesResponse
        input = Types::ListDocumentClassifierSummariesRequest.new(max_results: max_results, next_token: next_token)
        list_document_classifier_summaries(input)
      end
      def list_document_classifier_summaries(input : Types::ListDocumentClassifierSummariesRequest) : Types::ListDocumentClassifierSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENT_CLASSIFIER_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentClassifierSummariesResponse, "ListDocumentClassifierSummaries")
      end

      # Gets a list of the document classifiers that you have created.
      def list_document_classifiers(
        filter : Types::DocumentClassifierFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentClassifiersResponse
        input = Types::ListDocumentClassifiersRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_document_classifiers(input)
      end
      def list_document_classifiers(input : Types::ListDocumentClassifiersRequest) : Types::ListDocumentClassifiersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENT_CLASSIFIERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentClassifiersResponse, "ListDocumentClassifiers")
      end

      # Gets a list of the dominant language detection jobs that you have submitted.
      def list_dominant_language_detection_jobs(
        filter : Types::DominantLanguageDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDominantLanguageDetectionJobsResponse
        input = Types::ListDominantLanguageDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_dominant_language_detection_jobs(input)
      end
      def list_dominant_language_detection_jobs(input : Types::ListDominantLanguageDetectionJobsRequest) : Types::ListDominantLanguageDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOMINANT_LANGUAGE_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDominantLanguageDetectionJobsResponse, "ListDominantLanguageDetectionJobs")
      end

      # Gets a list of all existing endpoints that you've created. For information about endpoints, see
      # Managing endpoints .
      def list_endpoints(
        filter : Types::EndpointFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEndpointsResponse
        input = Types::ListEndpointsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_endpoints(input)
      end
      def list_endpoints(input : Types::ListEndpointsRequest) : Types::ListEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEndpointsResponse, "ListEndpoints")
      end

      # Gets a list of the entity detection jobs that you have submitted.
      def list_entities_detection_jobs(
        filter : Types::EntitiesDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntitiesDetectionJobsResponse
        input = Types::ListEntitiesDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_entities_detection_jobs(input)
      end
      def list_entities_detection_jobs(input : Types::ListEntitiesDetectionJobsRequest) : Types::ListEntitiesDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITIES_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntitiesDetectionJobsResponse, "ListEntitiesDetectionJobs")
      end

      # Gets a list of summaries for the entity recognizers that you have created.
      def list_entity_recognizer_summaries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntityRecognizerSummariesResponse
        input = Types::ListEntityRecognizerSummariesRequest.new(max_results: max_results, next_token: next_token)
        list_entity_recognizer_summaries(input)
      end
      def list_entity_recognizer_summaries(input : Types::ListEntityRecognizerSummariesRequest) : Types::ListEntityRecognizerSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITY_RECOGNIZER_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntityRecognizerSummariesResponse, "ListEntityRecognizerSummaries")
      end

      # Gets a list of the properties of all entity recognizers that you created, including recognizers
      # currently in training. Allows you to filter the list of recognizers based on criteria such as status
      # and submission time. This call returns up to 500 entity recognizers in the list, with a default
      # number of 100 recognizers in the list. The results of this list are not in any particular order.
      # Please get the list and sort locally if needed.
      def list_entity_recognizers(
        filter : Types::EntityRecognizerFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntityRecognizersResponse
        input = Types::ListEntityRecognizersRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_entity_recognizers(input)
      end
      def list_entity_recognizers(input : Types::ListEntityRecognizersRequest) : Types::ListEntityRecognizersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITY_RECOGNIZERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntityRecognizersResponse, "ListEntityRecognizers")
      end

      # Gets a list of the events detection jobs that you have submitted.
      def list_events_detection_jobs(
        filter : Types::EventsDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEventsDetectionJobsResponse
        input = Types::ListEventsDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_events_detection_jobs(input)
      end
      def list_events_detection_jobs(input : Types::ListEventsDetectionJobsRequest) : Types::ListEventsDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENTS_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventsDetectionJobsResponse, "ListEventsDetectionJobs")
      end

      # Information about the history of a flywheel iteration. For more information about flywheels, see
      # Flywheel overview in the Amazon Comprehend Developer Guide .
      def list_flywheel_iteration_history(
        flywheel_arn : String,
        filter : Types::FlywheelIterationFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFlywheelIterationHistoryResponse
        input = Types::ListFlywheelIterationHistoryRequest.new(flywheel_arn: flywheel_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_flywheel_iteration_history(input)
      end
      def list_flywheel_iteration_history(input : Types::ListFlywheelIterationHistoryRequest) : Types::ListFlywheelIterationHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLYWHEEL_ITERATION_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlywheelIterationHistoryResponse, "ListFlywheelIterationHistory")
      end

      # Gets a list of the flywheels that you have created.
      def list_flywheels(
        filter : Types::FlywheelFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFlywheelsResponse
        input = Types::ListFlywheelsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_flywheels(input)
      end
      def list_flywheels(input : Types::ListFlywheelsRequest) : Types::ListFlywheelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLYWHEELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlywheelsResponse, "ListFlywheels")
      end

      # Get a list of key phrase detection jobs that you have submitted.
      def list_key_phrases_detection_jobs(
        filter : Types::KeyPhrasesDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListKeyPhrasesDetectionJobsResponse
        input = Types::ListKeyPhrasesDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_key_phrases_detection_jobs(input)
      end
      def list_key_phrases_detection_jobs(input : Types::ListKeyPhrasesDetectionJobsRequest) : Types::ListKeyPhrasesDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_KEY_PHRASES_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListKeyPhrasesDetectionJobsResponse, "ListKeyPhrasesDetectionJobs")
      end

      # Gets a list of the PII entity detection jobs that you have submitted.
      def list_pii_entities_detection_jobs(
        filter : Types::PiiEntitiesDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPiiEntitiesDetectionJobsResponse
        input = Types::ListPiiEntitiesDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_pii_entities_detection_jobs(input)
      end
      def list_pii_entities_detection_jobs(input : Types::ListPiiEntitiesDetectionJobsRequest) : Types::ListPiiEntitiesDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PII_ENTITIES_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPiiEntitiesDetectionJobsResponse, "ListPiiEntitiesDetectionJobs")
      end

      # Gets a list of sentiment detection jobs that you have submitted.
      def list_sentiment_detection_jobs(
        filter : Types::SentimentDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSentimentDetectionJobsResponse
        input = Types::ListSentimentDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_sentiment_detection_jobs(input)
      end
      def list_sentiment_detection_jobs(input : Types::ListSentimentDetectionJobsRequest) : Types::ListSentimentDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SENTIMENT_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSentimentDetectionJobsResponse, "ListSentimentDetectionJobs")
      end

      # Lists all tags associated with a given Amazon Comprehend resource.
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

      # Gets a list of targeted sentiment detection jobs that you have submitted.
      def list_targeted_sentiment_detection_jobs(
        filter : Types::TargetedSentimentDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTargetedSentimentDetectionJobsResponse
        input = Types::ListTargetedSentimentDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_targeted_sentiment_detection_jobs(input)
      end
      def list_targeted_sentiment_detection_jobs(input : Types::ListTargetedSentimentDetectionJobsRequest) : Types::ListTargetedSentimentDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TARGETED_SENTIMENT_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTargetedSentimentDetectionJobsResponse, "ListTargetedSentimentDetectionJobs")
      end

      # Gets a list of the topic detection jobs that you have submitted.
      def list_topics_detection_jobs(
        filter : Types::TopicsDetectionJobFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTopicsDetectionJobsResponse
        input = Types::ListTopicsDetectionJobsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_topics_detection_jobs(input)
      end
      def list_topics_detection_jobs(input : Types::ListTopicsDetectionJobsRequest) : Types::ListTopicsDetectionJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TOPICS_DETECTION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTopicsDetectionJobsResponse, "ListTopicsDetectionJobs")
      end

      # Attaches a resource-based policy to a custom model. You can use this policy to authorize an entity
      # in another Amazon Web Services account to import the custom model, which replicates it in Amazon
      # Comprehend in their account.
      def put_resource_policy(
        resource_arn : String,
        resource_policy : String,
        policy_revision_id : String? = nil
      ) : Types::PutResourcePolicyResponse
        input = Types::PutResourcePolicyRequest.new(resource_arn: resource_arn, resource_policy: resource_policy, policy_revision_id: policy_revision_id)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Starts an asynchronous document classification job using a custom classification model. Use the
      # DescribeDocumentClassificationJob operation to track the progress of the job.
      def start_document_classification_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        document_classifier_arn : String? = nil,
        flywheel_arn : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartDocumentClassificationJobResponse
        input = Types::StartDocumentClassificationJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, output_data_config: output_data_config, client_request_token: client_request_token, document_classifier_arn: document_classifier_arn, flywheel_arn: flywheel_arn, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_document_classification_job(input)
      end
      def start_document_classification_job(input : Types::StartDocumentClassificationJobRequest) : Types::StartDocumentClassificationJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_DOCUMENT_CLASSIFICATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDocumentClassificationJobResponse, "StartDocumentClassificationJob")
      end

      # Starts an asynchronous dominant language detection job for a collection of documents. Use the
      # operation to track the status of a job.
      def start_dominant_language_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartDominantLanguageDetectionJobResponse
        input = Types::StartDominantLanguageDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_dominant_language_detection_job(input)
      end
      def start_dominant_language_detection_job(input : Types::StartDominantLanguageDetectionJobRequest) : Types::StartDominantLanguageDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_DOMINANT_LANGUAGE_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDominantLanguageDetectionJobResponse, "StartDominantLanguageDetectionJob")
      end

      # Starts an asynchronous entity detection job for a collection of documents. Use the operation to
      # track the status of a job. This API can be used for either standard entity detection or custom
      # entity recognition. In order to be used for custom entity recognition, the optional
      # EntityRecognizerArn must be used in order to provide access to the recognizer being used to detect
      # the custom entity.
      def start_entities_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        entity_recognizer_arn : String? = nil,
        flywheel_arn : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartEntitiesDetectionJobResponse
        input = Types::StartEntitiesDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, entity_recognizer_arn: entity_recognizer_arn, flywheel_arn: flywheel_arn, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_entities_detection_job(input)
      end
      def start_entities_detection_job(input : Types::StartEntitiesDetectionJobRequest) : Types::StartEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEntitiesDetectionJobResponse, "StartEntitiesDetectionJob")
      end

      # Starts an asynchronous event detection job for a collection of documents.
      def start_events_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        target_event_types : Array(String),
        client_request_token : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartEventsDetectionJobResponse
        input = Types::StartEventsDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, target_event_types: target_event_types, client_request_token: client_request_token, job_name: job_name, tags: tags)
        start_events_detection_job(input)
      end
      def start_events_detection_job(input : Types::StartEventsDetectionJobRequest) : Types::StartEventsDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_EVENTS_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEventsDetectionJobResponse, "StartEventsDetectionJob")
      end

      # Start the flywheel iteration.This operation uses any new datasets to train a new model version. For
      # more information about flywheels, see Flywheel overview in the Amazon Comprehend Developer Guide .
      def start_flywheel_iteration(
        flywheel_arn : String,
        client_request_token : String? = nil
      ) : Types::StartFlywheelIterationResponse
        input = Types::StartFlywheelIterationRequest.new(flywheel_arn: flywheel_arn, client_request_token: client_request_token)
        start_flywheel_iteration(input)
      end
      def start_flywheel_iteration(input : Types::StartFlywheelIterationRequest) : Types::StartFlywheelIterationResponse
        request = Protocol::JsonRpc.build_request(Model::START_FLYWHEEL_ITERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFlywheelIterationResponse, "StartFlywheelIteration")
      end

      # Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to
      # track the status of a job.
      def start_key_phrases_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartKeyPhrasesDetectionJobResponse
        input = Types::StartKeyPhrasesDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_key_phrases_detection_job(input)
      end
      def start_key_phrases_detection_job(input : Types::StartKeyPhrasesDetectionJobRequest) : Types::StartKeyPhrasesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_KEY_PHRASES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartKeyPhrasesDetectionJobResponse, "StartKeyPhrasesDetectionJob")
      end

      # Starts an asynchronous PII entity detection job for a collection of documents.
      def start_pii_entities_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        mode : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        redaction_config : Types::RedactionConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartPiiEntitiesDetectionJobResponse
        input = Types::StartPiiEntitiesDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, mode: mode, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, redaction_config: redaction_config, tags: tags)
        start_pii_entities_detection_job(input)
      end
      def start_pii_entities_detection_job(input : Types::StartPiiEntitiesDetectionJobRequest) : Types::StartPiiEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_PII_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartPiiEntitiesDetectionJobResponse, "StartPiiEntitiesDetectionJob")
      end

      # Starts an asynchronous sentiment detection job for a collection of documents. Use the operation to
      # track the status of a job.
      def start_sentiment_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartSentimentDetectionJobResponse
        input = Types::StartSentimentDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_sentiment_detection_job(input)
      end
      def start_sentiment_detection_job(input : Types::StartSentimentDetectionJobRequest) : Types::StartSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSentimentDetectionJobResponse, "StartSentimentDetectionJob")
      end

      # Starts an asynchronous targeted sentiment detection job for a collection of documents. Use the
      # DescribeTargetedSentimentDetectionJob operation to track the status of a job.
      def start_targeted_sentiment_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        language_code : String,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartTargetedSentimentDetectionJobResponse
        input = Types::StartTargetedSentimentDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, language_code: language_code, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_targeted_sentiment_detection_job(input)
      end
      def start_targeted_sentiment_detection_job(input : Types::StartTargetedSentimentDetectionJobRequest) : Types::StartTargetedSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_TARGETED_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTargetedSentimentDetectionJobResponse, "StartTargetedSentimentDetectionJob")
      end

      # Starts an asynchronous topic detection job. Use the DescribeTopicDetectionJob operation to track the
      # status of a job.
      def start_topics_detection_job(
        data_access_role_arn : String,
        input_data_config : Types::InputDataConfig,
        output_data_config : Types::OutputDataConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        number_of_topics : Int32? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_kms_key_id : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::StartTopicsDetectionJobResponse
        input = Types::StartTopicsDetectionJobRequest.new(data_access_role_arn: data_access_role_arn, input_data_config: input_data_config, output_data_config: output_data_config, client_request_token: client_request_token, job_name: job_name, number_of_topics: number_of_topics, tags: tags, volume_kms_key_id: volume_kms_key_id, vpc_config: vpc_config)
        start_topics_detection_job(input)
      end
      def start_topics_detection_job(input : Types::StartTopicsDetectionJobRequest) : Types::StartTopicsDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_TOPICS_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTopicsDetectionJobResponse, "StartTopicsDetectionJob")
      end

      # Stops a dominant language detection job in progress. If the job state is IN_PROGRESS the job is
      # marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be
      # stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED
      # state. If the job is in the COMPLETED or FAILED state when you call the
      # StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.
      # When a job is stopped, any documents already processed are written to the output location.
      def stop_dominant_language_detection_job(
        job_id : String
      ) : Types::StopDominantLanguageDetectionJobResponse
        input = Types::StopDominantLanguageDetectionJobRequest.new(job_id: job_id)
        stop_dominant_language_detection_job(input)
      end
      def stop_dominant_language_detection_job(input : Types::StopDominantLanguageDetectionJobRequest) : Types::StopDominantLanguageDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_DOMINANT_LANGUAGE_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopDominantLanguageDetectionJobResponse, "StopDominantLanguageDetectionJob")
      end

      # Stops an entities detection job in progress. If the job state is IN_PROGRESS the job is marked for
      # termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it
      # is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the
      # job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob
      # operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any
      # documents already processed are written to the output location.
      def stop_entities_detection_job(
        job_id : String
      ) : Types::StopEntitiesDetectionJobResponse
        input = Types::StopEntitiesDetectionJobRequest.new(job_id: job_id)
        stop_entities_detection_job(input)
      end
      def stop_entities_detection_job(input : Types::StopEntitiesDetectionJobRequest) : Types::StopEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopEntitiesDetectionJobResponse, "StopEntitiesDetectionJob")
      end

      # Stops an events detection job in progress.
      def stop_events_detection_job(
        job_id : String
      ) : Types::StopEventsDetectionJobResponse
        input = Types::StopEventsDetectionJobRequest.new(job_id: job_id)
        stop_events_detection_job(input)
      end
      def stop_events_detection_job(input : Types::StopEventsDetectionJobRequest) : Types::StopEventsDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_EVENTS_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopEventsDetectionJobResponse, "StopEventsDetectionJob")
      end

      # Stops a key phrases detection job in progress. If the job state is IN_PROGRESS the job is marked for
      # termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it
      # is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the
      # job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob
      # operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any
      # documents already processed are written to the output location.
      def stop_key_phrases_detection_job(
        job_id : String
      ) : Types::StopKeyPhrasesDetectionJobResponse
        input = Types::StopKeyPhrasesDetectionJobRequest.new(job_id: job_id)
        stop_key_phrases_detection_job(input)
      end
      def stop_key_phrases_detection_job(input : Types::StopKeyPhrasesDetectionJobRequest) : Types::StopKeyPhrasesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_KEY_PHRASES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopKeyPhrasesDetectionJobResponse, "StopKeyPhrasesDetectionJob")
      end

      # Stops a PII entities detection job in progress.
      def stop_pii_entities_detection_job(
        job_id : String
      ) : Types::StopPiiEntitiesDetectionJobResponse
        input = Types::StopPiiEntitiesDetectionJobRequest.new(job_id: job_id)
        stop_pii_entities_detection_job(input)
      end
      def stop_pii_entities_detection_job(input : Types::StopPiiEntitiesDetectionJobRequest) : Types::StopPiiEntitiesDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_PII_ENTITIES_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopPiiEntitiesDetectionJobResponse, "StopPiiEntitiesDetectionJob")
      end

      # Stops a sentiment detection job in progress. If the job state is IN_PROGRESS , the job is marked for
      # termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it
      # is put into the COMPLETED state; otherwise the job is be stopped and put into the STOPPED state. If
      # the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob
      # operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any
      # documents already processed are written to the output location.
      def stop_sentiment_detection_job(
        job_id : String
      ) : Types::StopSentimentDetectionJobResponse
        input = Types::StopSentimentDetectionJobRequest.new(job_id: job_id)
        stop_sentiment_detection_job(input)
      end
      def stop_sentiment_detection_job(input : Types::StopSentimentDetectionJobRequest) : Types::StopSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopSentimentDetectionJobResponse, "StopSentimentDetectionJob")
      end

      # Stops a targeted sentiment detection job in progress. If the job state is IN_PROGRESS , the job is
      # marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be
      # stopped, it is put into the COMPLETED state; otherwise the job is be stopped and put into the
      # STOPPED state. If the job is in the COMPLETED or FAILED state when you call the
      # StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.
      # When a job is stopped, any documents already processed are written to the output location.
      def stop_targeted_sentiment_detection_job(
        job_id : String
      ) : Types::StopTargetedSentimentDetectionJobResponse
        input = Types::StopTargetedSentimentDetectionJobRequest.new(job_id: job_id)
        stop_targeted_sentiment_detection_job(input)
      end
      def stop_targeted_sentiment_detection_job(input : Types::StopTargetedSentimentDetectionJobRequest) : Types::StopTargetedSentimentDetectionJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TARGETED_SENTIMENT_DETECTION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTargetedSentimentDetectionJobResponse, "StopTargetedSentimentDetectionJob")
      end

      # Stops a document classifier training job while in progress. If the training job state is TRAINING ,
      # the job is marked for termination and put into the STOP_REQUESTED state. If the training job
      # completes before it can be stopped, it is put into the TRAINED ; otherwise the training job is
      # stopped and put into the STOPPED state and the service sends back an HTTP 200 response with an empty
      # HTTP body.
      def stop_training_document_classifier(
        document_classifier_arn : String
      ) : Types::StopTrainingDocumentClassifierResponse
        input = Types::StopTrainingDocumentClassifierRequest.new(document_classifier_arn: document_classifier_arn)
        stop_training_document_classifier(input)
      end
      def stop_training_document_classifier(input : Types::StopTrainingDocumentClassifierRequest) : Types::StopTrainingDocumentClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TRAINING_DOCUMENT_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTrainingDocumentClassifierResponse, "StopTrainingDocumentClassifier")
      end

      # Stops an entity recognizer training job while in progress. If the training job state is TRAINING ,
      # the job is marked for termination and put into the STOP_REQUESTED state. If the training job
      # completes before it can be stopped, it is put into the TRAINED ; otherwise the training job is
      # stopped and putted into the STOPPED state and the service sends back an HTTP 200 response with an
      # empty HTTP body.
      def stop_training_entity_recognizer(
        entity_recognizer_arn : String
      ) : Types::StopTrainingEntityRecognizerResponse
        input = Types::StopTrainingEntityRecognizerRequest.new(entity_recognizer_arn: entity_recognizer_arn)
        stop_training_entity_recognizer(input)
      end
      def stop_training_entity_recognizer(input : Types::StopTrainingEntityRecognizerRequest) : Types::StopTrainingEntityRecognizerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TRAINING_ENTITY_RECOGNIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTrainingEntityRecognizerResponse, "StopTrainingEntityRecognizer")
      end

      # Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as
      # a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might
      # be added to a resource to indicate its use by the sales department.
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

      # Removes a specific tag associated with an Amazon Comprehend resource.
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

      # Updates information about the specified endpoint. For information about endpoints, see Managing
      # endpoints .
      def update_endpoint(
        endpoint_arn : String,
        desired_data_access_role_arn : String? = nil,
        desired_inference_units : Int32? = nil,
        desired_model_arn : String? = nil,
        flywheel_arn : String? = nil
      ) : Types::UpdateEndpointResponse
        input = Types::UpdateEndpointRequest.new(endpoint_arn: endpoint_arn, desired_data_access_role_arn: desired_data_access_role_arn, desired_inference_units: desired_inference_units, desired_model_arn: desired_model_arn, flywheel_arn: flywheel_arn)
        update_endpoint(input)
      end
      def update_endpoint(input : Types::UpdateEndpointRequest) : Types::UpdateEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEndpointResponse, "UpdateEndpoint")
      end

      # Update the configuration information for an existing flywheel.
      def update_flywheel(
        flywheel_arn : String,
        active_model_arn : String? = nil,
        data_access_role_arn : String? = nil,
        data_security_config : Types::UpdateDataSecurityConfig? = nil
      ) : Types::UpdateFlywheelResponse
        input = Types::UpdateFlywheelRequest.new(flywheel_arn: flywheel_arn, active_model_arn: active_model_arn, data_access_role_arn: data_access_role_arn, data_security_config: data_security_config)
        update_flywheel(input)
      end
      def update_flywheel(input : Types::UpdateFlywheelRequest) : Types::UpdateFlywheelResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLYWHEEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFlywheelResponse, "UpdateFlywheel")
      end
    end
  end
end
