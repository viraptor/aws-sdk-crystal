module AwsSdk
  module MachineLearning
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

      # Adds one or more tags to an object, up to a limit of 10. Each tag consists of a key and an optional
      # value. If you add a tag using a key that is already associated with the ML object, AddTags updates
      # the tag's value.
      def add_tags(
        resource_id : String,
        resource_type : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput
        input = Types::AddTagsInput.new(resource_id: resource_id, resource_type: resource_type, tags: tags)
        add_tags(input)
      end
      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Generates predictions for a group of observations. The observations to process exist in one or more
      # data files referenced by a DataSource . This operation creates a new BatchPrediction , and uses an
      # MLModel and the data files referenced by the DataSource as information sources.
      # CreateBatchPrediction is an asynchronous operation. In response to CreateBatchPrediction , Amazon
      # Machine Learning (Amazon ML) immediately returns and sets the BatchPrediction status to PENDING .
      # After the BatchPrediction completes, Amazon ML sets the status to COMPLETED . You can poll for
      # status updates by using the GetBatchPrediction operation and checking the Status parameter of the
      # result. After the COMPLETED status appears, the results are available in the location specified by
      # the OutputUri parameter.
      def create_batch_prediction(
        batch_prediction_data_source_id : String,
        batch_prediction_id : String,
        ml_model_id : String,
        output_uri : String,
        batch_prediction_name : String? = nil
      ) : Types::CreateBatchPredictionOutput
        input = Types::CreateBatchPredictionInput.new(batch_prediction_data_source_id: batch_prediction_data_source_id, batch_prediction_id: batch_prediction_id, ml_model_id: ml_model_id, output_uri: output_uri, batch_prediction_name: batch_prediction_name)
        create_batch_prediction(input)
      end
      def create_batch_prediction(input : Types::CreateBatchPredictionInput) : Types::CreateBatchPredictionOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_PREDICTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchPredictionOutput, "CreateBatchPrediction")
      end

      # Creates a DataSource object from an Amazon Relational Database Service (Amazon RDS). A DataSource
      # references data that can be used to perform CreateMLModel , CreateEvaluation , or
      # CreateBatchPrediction operations. CreateDataSourceFromRDS is an asynchronous operation. In response
      # to CreateDataSourceFromRDS , Amazon Machine Learning (Amazon ML) immediately returns and sets the
      # DataSource status to PENDING . After the DataSource is created and ready for use, Amazon ML sets the
      # Status parameter to COMPLETED . DataSource in the COMPLETED or PENDING state can be used only to
      # perform &gt;CreateMLModel &gt;, CreateEvaluation , or CreateBatchPrediction operations. If Amazon ML
      # cannot accept the input source, it sets the Status parameter to FAILED and includes an error message
      # in the Message attribute of the GetDataSource operation response.
      def create_data_source_from_rds(
        data_source_id : String,
        rds_data : Types::RDSDataSpec,
        role_arn : String,
        compute_statistics : Bool? = nil,
        data_source_name : String? = nil
      ) : Types::CreateDataSourceFromRDSOutput
        input = Types::CreateDataSourceFromRDSInput.new(data_source_id: data_source_id, rds_data: rds_data, role_arn: role_arn, compute_statistics: compute_statistics, data_source_name: data_source_name)
        create_data_source_from_rds(input)
      end
      def create_data_source_from_rds(input : Types::CreateDataSourceFromRDSInput) : Types::CreateDataSourceFromRDSOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_SOURCE_FROM_RDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataSourceFromRDSOutput, "CreateDataSourceFromRDS")
      end

      # Creates a DataSource from a database hosted on an Amazon Redshift cluster. A DataSource references
      # data that can be used to perform either CreateMLModel , CreateEvaluation , or CreateBatchPrediction
      # operations. CreateDataSourceFromRedshift is an asynchronous operation. In response to
      # CreateDataSourceFromRedshift , Amazon Machine Learning (Amazon ML) immediately returns and sets the
      # DataSource status to PENDING . After the DataSource is created and ready for use, Amazon ML sets the
      # Status parameter to COMPLETED . DataSource in COMPLETED or PENDING states can be used to perform
      # only CreateMLModel , CreateEvaluation , or CreateBatchPrediction operations. If Amazon ML can't
      # accept the input source, it sets the Status parameter to FAILED and includes an error message in the
      # Message attribute of the GetDataSource operation response. The observations should be contained in
      # the database hosted on an Amazon Redshift cluster and should be specified by a SelectSqlQuery query.
      # Amazon ML executes an Unload command in Amazon Redshift to transfer the result set of the
      # SelectSqlQuery query to S3StagingLocation . After the DataSource has been created, it's ready for
      # use in evaluations and batch predictions. If you plan to use the DataSource to train an MLModel ,
      # the DataSource also requires a recipe. A recipe describes how each input variable will be used in
      # training an MLModel . Will the variable be included or excluded from training? Will the variable be
      # manipulated; for example, will it be combined with another variable or will it be split apart into
      # word combinations? The recipe provides answers to these questions. You can't change an existing
      # datasource, but you can copy and modify the settings from an existing Amazon Redshift datasource to
      # create a new datasource. To do so, call GetDataSource for an existing datasource and copy the values
      # to a CreateDataSource call. Change the settings that you want to change and make sure that all
      # required fields have the appropriate values.
      def create_data_source_from_redshift(
        data_source_id : String,
        data_spec : Types::RedshiftDataSpec,
        role_arn : String,
        compute_statistics : Bool? = nil,
        data_source_name : String? = nil
      ) : Types::CreateDataSourceFromRedshiftOutput
        input = Types::CreateDataSourceFromRedshiftInput.new(data_source_id: data_source_id, data_spec: data_spec, role_arn: role_arn, compute_statistics: compute_statistics, data_source_name: data_source_name)
        create_data_source_from_redshift(input)
      end
      def create_data_source_from_redshift(input : Types::CreateDataSourceFromRedshiftInput) : Types::CreateDataSourceFromRedshiftOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_SOURCE_FROM_REDSHIFT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataSourceFromRedshiftOutput, "CreateDataSourceFromRedshift")
      end

      # Creates a DataSource object. A DataSource references data that can be used to perform CreateMLModel
      # , CreateEvaluation , or CreateBatchPrediction operations. CreateDataSourceFromS3 is an asynchronous
      # operation. In response to CreateDataSourceFromS3 , Amazon Machine Learning (Amazon ML) immediately
      # returns and sets the DataSource status to PENDING . After the DataSource has been created and is
      # ready for use, Amazon ML sets the Status parameter to COMPLETED . DataSource in the COMPLETED or
      # PENDING state can be used to perform only CreateMLModel , CreateEvaluation or CreateBatchPrediction
      # operations. If Amazon ML can't accept the input source, it sets the Status parameter to FAILED and
      # includes an error message in the Message attribute of the GetDataSource operation response. The
      # observation data used in a DataSource should be ready to use; that is, it should have a consistent
      # structure, and missing data values should be kept to a minimum. The observation data must reside in
      # one or more .csv files in an Amazon Simple Storage Service (Amazon S3) location, along with a schema
      # that describes the data items by name and type. The same schema must be used for all of the data
      # files referenced by the DataSource . After the DataSource has been created, it's ready to use in
      # evaluations and batch predictions. If you plan to use the DataSource to train an MLModel , the
      # DataSource also needs a recipe. A recipe describes how each input variable will be used in training
      # an MLModel . Will the variable be included or excluded from training? Will the variable be
      # manipulated; for example, will it be combined with another variable or will it be split apart into
      # word combinations? The recipe provides answers to these questions.
      def create_data_source_from_s3(
        data_source_id : String,
        data_spec : Types::S3DataSpec,
        compute_statistics : Bool? = nil,
        data_source_name : String? = nil
      ) : Types::CreateDataSourceFromS3Output
        input = Types::CreateDataSourceFromS3Input.new(data_source_id: data_source_id, data_spec: data_spec, compute_statistics: compute_statistics, data_source_name: data_source_name)
        create_data_source_from_s3(input)
      end
      def create_data_source_from_s3(input : Types::CreateDataSourceFromS3Input) : Types::CreateDataSourceFromS3Output
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_SOURCE_FROM_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataSourceFromS3Output, "CreateDataSourceFromS3")
      end

      # Creates a new Evaluation of an MLModel . An MLModel is evaluated on a set of observations associated
      # to a DataSource . Like a DataSource for an MLModel , the DataSource for an Evaluation contains
      # values for the Target Variable . The Evaluation compares the predicted result for each observation
      # to the actual outcome and provides a summary so that you know how effective the MLModel functions on
      # the test data. Evaluation generates a relevant performance metric, such as BinaryAUC, RegressionRMSE
      # or MulticlassAvgFScore based on the corresponding MLModelType : BINARY , REGRESSION or MULTICLASS .
      # CreateEvaluation is an asynchronous operation. In response to CreateEvaluation , Amazon Machine
      # Learning (Amazon ML) immediately returns and sets the evaluation status to PENDING . After the
      # Evaluation is created and ready for use, Amazon ML sets the status to COMPLETED . You can use the
      # GetEvaluation operation to check progress of the evaluation during the creation operation.
      def create_evaluation(
        evaluation_data_source_id : String,
        evaluation_id : String,
        ml_model_id : String,
        evaluation_name : String? = nil
      ) : Types::CreateEvaluationOutput
        input = Types::CreateEvaluationInput.new(evaluation_data_source_id: evaluation_data_source_id, evaluation_id: evaluation_id, ml_model_id: ml_model_id, evaluation_name: evaluation_name)
        create_evaluation(input)
      end
      def create_evaluation(input : Types::CreateEvaluationInput) : Types::CreateEvaluationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEvaluationOutput, "CreateEvaluation")
      end

      # Creates a new MLModel using the DataSource and the recipe as information sources. An MLModel is
      # nearly immutable. Users can update only the MLModelName and the ScoreThreshold in an MLModel without
      # creating a new MLModel . CreateMLModel is an asynchronous operation. In response to CreateMLModel ,
      # Amazon Machine Learning (Amazon ML) immediately returns and sets the MLModel status to PENDING .
      # After the MLModel has been created and ready is for use, Amazon ML sets the status to COMPLETED .
      # You can use the GetMLModel operation to check the progress of the MLModel during the creation
      # operation. CreateMLModel requires a DataSource with computed statistics, which can be created by
      # setting ComputeStatistics to true in CreateDataSourceFromRDS , CreateDataSourceFromS3 , or
      # CreateDataSourceFromRedshift operations.
      def create_ml_model(
        ml_model_id : String,
        ml_model_type : String,
        training_data_source_id : String,
        ml_model_name : String? = nil,
        parameters : Hash(String, String)? = nil,
        recipe : String? = nil,
        recipe_uri : String? = nil
      ) : Types::CreateMLModelOutput
        input = Types::CreateMLModelInput.new(ml_model_id: ml_model_id, ml_model_type: ml_model_type, training_data_source_id: training_data_source_id, ml_model_name: ml_model_name, parameters: parameters, recipe: recipe, recipe_uri: recipe_uri)
        create_ml_model(input)
      end
      def create_ml_model(input : Types::CreateMLModelInput) : Types::CreateMLModelOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ML_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMLModelOutput, "CreateMLModel")
      end

      # Creates a real-time endpoint for the MLModel . The endpoint contains the URI of the MLModel ; that
      # is, the location to send real-time prediction requests for the specified MLModel .
      def create_realtime_endpoint(
        ml_model_id : String
      ) : Types::CreateRealtimeEndpointOutput
        input = Types::CreateRealtimeEndpointInput.new(ml_model_id: ml_model_id)
        create_realtime_endpoint(input)
      end
      def create_realtime_endpoint(input : Types::CreateRealtimeEndpointInput) : Types::CreateRealtimeEndpointOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_REALTIME_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRealtimeEndpointOutput, "CreateRealtimeEndpoint")
      end

      # Assigns the DELETED status to a BatchPrediction , rendering it unusable. After using the
      # DeleteBatchPrediction operation, you can use the GetBatchPrediction operation to verify that the
      # status of the BatchPrediction changed to DELETED. Caution: The result of the DeleteBatchPrediction
      # operation is irreversible.
      def delete_batch_prediction(
        batch_prediction_id : String
      ) : Types::DeleteBatchPredictionOutput
        input = Types::DeleteBatchPredictionInput.new(batch_prediction_id: batch_prediction_id)
        delete_batch_prediction(input)
      end
      def delete_batch_prediction(input : Types::DeleteBatchPredictionInput) : Types::DeleteBatchPredictionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_BATCH_PREDICTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBatchPredictionOutput, "DeleteBatchPrediction")
      end

      # Assigns the DELETED status to a DataSource , rendering it unusable. After using the DeleteDataSource
      # operation, you can use the GetDataSource operation to verify that the status of the DataSource
      # changed to DELETED. Caution: The results of the DeleteDataSource operation are irreversible.
      def delete_data_source(
        data_source_id : String
      ) : Types::DeleteDataSourceOutput
        input = Types::DeleteDataSourceInput.new(data_source_id: data_source_id)
        delete_data_source(input)
      end
      def delete_data_source(input : Types::DeleteDataSourceInput) : Types::DeleteDataSourceOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataSourceOutput, "DeleteDataSource")
      end

      # Assigns the DELETED status to an Evaluation , rendering it unusable. After invoking the
      # DeleteEvaluation operation, you can use the GetEvaluation operation to verify that the status of the
      # Evaluation changed to DELETED . Caution: The results of the DeleteEvaluation operation are
      # irreversible.
      def delete_evaluation(
        evaluation_id : String
      ) : Types::DeleteEvaluationOutput
        input = Types::DeleteEvaluationInput.new(evaluation_id: evaluation_id)
        delete_evaluation(input)
      end
      def delete_evaluation(input : Types::DeleteEvaluationInput) : Types::DeleteEvaluationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEvaluationOutput, "DeleteEvaluation")
      end

      # Assigns the DELETED status to an MLModel , rendering it unusable. After using the DeleteMLModel
      # operation, you can use the GetMLModel operation to verify that the status of the MLModel changed to
      # DELETED. Caution: The result of the DeleteMLModel operation is irreversible.
      def delete_ml_model(
        ml_model_id : String
      ) : Types::DeleteMLModelOutput
        input = Types::DeleteMLModelInput.new(ml_model_id: ml_model_id)
        delete_ml_model(input)
      end
      def delete_ml_model(input : Types::DeleteMLModelInput) : Types::DeleteMLModelOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ML_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMLModelOutput, "DeleteMLModel")
      end

      # Deletes a real time endpoint of an MLModel .
      def delete_realtime_endpoint(
        ml_model_id : String
      ) : Types::DeleteRealtimeEndpointOutput
        input = Types::DeleteRealtimeEndpointInput.new(ml_model_id: ml_model_id)
        delete_realtime_endpoint(input)
      end
      def delete_realtime_endpoint(input : Types::DeleteRealtimeEndpointInput) : Types::DeleteRealtimeEndpointOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REALTIME_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRealtimeEndpointOutput, "DeleteRealtimeEndpoint")
      end

      # Deletes the specified tags associated with an ML object. After this operation is complete, you can't
      # recover deleted tags. If you specify a tag that doesn't exist, Amazon ML ignores it.
      def delete_tags(
        resource_id : String,
        resource_type : String,
        tag_keys : Array(String)
      ) : Types::DeleteTagsOutput
        input = Types::DeleteTagsInput.new(resource_id: resource_id, resource_type: resource_type, tag_keys: tag_keys)
        delete_tags(input)
      end
      def delete_tags(input : Types::DeleteTagsInput) : Types::DeleteTagsOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagsOutput, "DeleteTags")
      end

      # Returns a list of BatchPrediction operations that match the search criteria in the request.
      def describe_batch_predictions(
        eq : String? = nil,
        filter_variable : String? = nil,
        ge : String? = nil,
        gt : String? = nil,
        le : String? = nil,
        lt : String? = nil,
        limit : Int32? = nil,
        ne : String? = nil,
        next_token : String? = nil,
        prefix : String? = nil,
        sort_order : String? = nil
      ) : Types::DescribeBatchPredictionsOutput
        input = Types::DescribeBatchPredictionsInput.new(eq: eq, filter_variable: filter_variable, ge: ge, gt: gt, le: le, lt: lt, limit: limit, ne: ne, next_token: next_token, prefix: prefix, sort_order: sort_order)
        describe_batch_predictions(input)
      end
      def describe_batch_predictions(input : Types::DescribeBatchPredictionsInput) : Types::DescribeBatchPredictionsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BATCH_PREDICTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBatchPredictionsOutput, "DescribeBatchPredictions")
      end

      # Returns a list of DataSource that match the search criteria in the request.
      def describe_data_sources(
        eq : String? = nil,
        filter_variable : String? = nil,
        ge : String? = nil,
        gt : String? = nil,
        le : String? = nil,
        lt : String? = nil,
        limit : Int32? = nil,
        ne : String? = nil,
        next_token : String? = nil,
        prefix : String? = nil,
        sort_order : String? = nil
      ) : Types::DescribeDataSourcesOutput
        input = Types::DescribeDataSourcesInput.new(eq: eq, filter_variable: filter_variable, ge: ge, gt: gt, le: le, lt: lt, limit: limit, ne: ne, next_token: next_token, prefix: prefix, sort_order: sort_order)
        describe_data_sources(input)
      end
      def describe_data_sources(input : Types::DescribeDataSourcesInput) : Types::DescribeDataSourcesOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataSourcesOutput, "DescribeDataSources")
      end

      # Returns a list of DescribeEvaluations that match the search criteria in the request.
      def describe_evaluations(
        eq : String? = nil,
        filter_variable : String? = nil,
        ge : String? = nil,
        gt : String? = nil,
        le : String? = nil,
        lt : String? = nil,
        limit : Int32? = nil,
        ne : String? = nil,
        next_token : String? = nil,
        prefix : String? = nil,
        sort_order : String? = nil
      ) : Types::DescribeEvaluationsOutput
        input = Types::DescribeEvaluationsInput.new(eq: eq, filter_variable: filter_variable, ge: ge, gt: gt, le: le, lt: lt, limit: limit, ne: ne, next_token: next_token, prefix: prefix, sort_order: sort_order)
        describe_evaluations(input)
      end
      def describe_evaluations(input : Types::DescribeEvaluationsInput) : Types::DescribeEvaluationsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVALUATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEvaluationsOutput, "DescribeEvaluations")
      end

      # Returns a list of MLModel that match the search criteria in the request.
      def describe_ml_models(
        eq : String? = nil,
        filter_variable : String? = nil,
        ge : String? = nil,
        gt : String? = nil,
        le : String? = nil,
        lt : String? = nil,
        limit : Int32? = nil,
        ne : String? = nil,
        next_token : String? = nil,
        prefix : String? = nil,
        sort_order : String? = nil
      ) : Types::DescribeMLModelsOutput
        input = Types::DescribeMLModelsInput.new(eq: eq, filter_variable: filter_variable, ge: ge, gt: gt, le: le, lt: lt, limit: limit, ne: ne, next_token: next_token, prefix: prefix, sort_order: sort_order)
        describe_ml_models(input)
      end
      def describe_ml_models(input : Types::DescribeMLModelsInput) : Types::DescribeMLModelsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ML_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMLModelsOutput, "DescribeMLModels")
      end

      # Describes one or more of the tags for your Amazon ML object.
      def describe_tags(
        resource_id : String,
        resource_type : String
      ) : Types::DescribeTagsOutput
        input = Types::DescribeTagsInput.new(resource_id: resource_id, resource_type: resource_type)
        describe_tags(input)
      end
      def describe_tags(input : Types::DescribeTagsInput) : Types::DescribeTagsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTagsOutput, "DescribeTags")
      end

      # Returns a BatchPrediction that includes detailed metadata, status, and data file information for a
      # Batch Prediction request.
      def get_batch_prediction(
        batch_prediction_id : String
      ) : Types::GetBatchPredictionOutput
        input = Types::GetBatchPredictionInput.new(batch_prediction_id: batch_prediction_id)
        get_batch_prediction(input)
      end
      def get_batch_prediction(input : Types::GetBatchPredictionInput) : Types::GetBatchPredictionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BATCH_PREDICTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBatchPredictionOutput, "GetBatchPrediction")
      end

      # Returns a DataSource that includes metadata and data file information, as well as the current status
      # of the DataSource . GetDataSource provides results in normal or verbose format. The verbose format
      # adds the schema description and the list of files pointed to by the DataSource to the normal format.
      def get_data_source(
        data_source_id : String,
        verbose : Bool? = nil
      ) : Types::GetDataSourceOutput
        input = Types::GetDataSourceInput.new(data_source_id: data_source_id, verbose: verbose)
        get_data_source(input)
      end
      def get_data_source(input : Types::GetDataSourceInput) : Types::GetDataSourceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataSourceOutput, "GetDataSource")
      end

      # Returns an Evaluation that includes metadata as well as the current status of the Evaluation .
      def get_evaluation(
        evaluation_id : String
      ) : Types::GetEvaluationOutput
        input = Types::GetEvaluationInput.new(evaluation_id: evaluation_id)
        get_evaluation(input)
      end
      def get_evaluation(input : Types::GetEvaluationInput) : Types::GetEvaluationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEvaluationOutput, "GetEvaluation")
      end

      # Returns an MLModel that includes detailed metadata, data source information, and the current status
      # of the MLModel . GetMLModel provides results in normal or verbose format.
      def get_ml_model(
        ml_model_id : String,
        verbose : Bool? = nil
      ) : Types::GetMLModelOutput
        input = Types::GetMLModelInput.new(ml_model_id: ml_model_id, verbose: verbose)
        get_ml_model(input)
      end
      def get_ml_model(input : Types::GetMLModelInput) : Types::GetMLModelOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ML_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMLModelOutput, "GetMLModel")
      end

      # Generates a prediction for the observation using the specified ML Model . Note: Not all response
      # parameters will be populated. Whether a response parameter is populated depends on the type of model
      # requested.
      def predict(
        ml_model_id : String,
        predict_endpoint : String,
        record : Hash(String, String)
      ) : Types::PredictOutput
        input = Types::PredictInput.new(ml_model_id: ml_model_id, predict_endpoint: predict_endpoint, record: record)
        predict(input)
      end
      def predict(input : Types::PredictInput) : Types::PredictOutput
        request = Protocol::JsonRpc.build_request(Model::PREDICT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PredictOutput, "Predict")
      end

      # Updates the BatchPredictionName of a BatchPrediction . You can use the GetBatchPrediction operation
      # to view the contents of the updated data element.
      def update_batch_prediction(
        batch_prediction_id : String,
        batch_prediction_name : String
      ) : Types::UpdateBatchPredictionOutput
        input = Types::UpdateBatchPredictionInput.new(batch_prediction_id: batch_prediction_id, batch_prediction_name: batch_prediction_name)
        update_batch_prediction(input)
      end
      def update_batch_prediction(input : Types::UpdateBatchPredictionInput) : Types::UpdateBatchPredictionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BATCH_PREDICTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBatchPredictionOutput, "UpdateBatchPrediction")
      end

      # Updates the DataSourceName of a DataSource . You can use the GetDataSource operation to view the
      # contents of the updated data element.
      def update_data_source(
        data_source_id : String,
        data_source_name : String
      ) : Types::UpdateDataSourceOutput
        input = Types::UpdateDataSourceInput.new(data_source_id: data_source_id, data_source_name: data_source_name)
        update_data_source(input)
      end
      def update_data_source(input : Types::UpdateDataSourceInput) : Types::UpdateDataSourceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDataSourceOutput, "UpdateDataSource")
      end

      # Updates the EvaluationName of an Evaluation . You can use the GetEvaluation operation to view the
      # contents of the updated data element.
      def update_evaluation(
        evaluation_id : String,
        evaluation_name : String
      ) : Types::UpdateEvaluationOutput
        input = Types::UpdateEvaluationInput.new(evaluation_id: evaluation_id, evaluation_name: evaluation_name)
        update_evaluation(input)
      end
      def update_evaluation(input : Types::UpdateEvaluationInput) : Types::UpdateEvaluationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEvaluationOutput, "UpdateEvaluation")
      end

      # Updates the MLModelName and the ScoreThreshold of an MLModel . You can use the GetMLModel operation
      # to view the contents of the updated data element.
      def update_ml_model(
        ml_model_id : String,
        ml_model_name : String? = nil,
        score_threshold : Float64? = nil
      ) : Types::UpdateMLModelOutput
        input = Types::UpdateMLModelInput.new(ml_model_id: ml_model_id, ml_model_name: ml_model_name, score_threshold: score_threshold)
        update_ml_model(input)
      end
      def update_ml_model(input : Types::UpdateMLModelInput) : Types::UpdateMLModelOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ML_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMLModelOutput, "UpdateMLModel")
      end
    end
  end
end
