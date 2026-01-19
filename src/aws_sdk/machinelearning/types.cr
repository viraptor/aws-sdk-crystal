require "json"
require "time"

module AwsSdk
  module MachineLearning
    module Types

      struct AddTagsInput
        include JSON::Serializable

        # The ID of the ML object to tag. For example, exampleModelId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the ML object to tag.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The key-value pairs to use to create tags. If you specify a key without specifying a value, Amazon
        # ML creates a tag with the specified key and a value of null.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Amazon ML returns the following elements.
      struct AddTagsOutput
        include JSON::Serializable

        # The ID of the ML object that was tagged.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the ML object that was tagged.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Represents the output of a GetBatchPrediction operation. The content consists of the detailed
      # metadata, the status, and the data file information of a Batch Prediction .
      struct BatchPrediction
        include JSON::Serializable

        # The ID of the DataSource that points to the group of observations to predict.
        @[JSON::Field(key: "BatchPredictionDataSourceId")]
        getter batch_prediction_data_source_id : String?

        # The ID assigned to the BatchPrediction at creation. This value should be identical to the value of
        # the BatchPredictionID in the request.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String?

        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the BatchPrediction was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account that invoked the BatchPrediction . The account type can be either an AWS root
        # account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        @[JSON::Field(key: "InvalidRecordCount")]
        getter invalid_record_count : Int64?

        # The time of the most recent edit to the BatchPrediction . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The ID of the MLModel that generated predictions for the BatchPrediction request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # A description of the most recent details about processing the batch prediction request.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the BatchPrediction .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The location of an Amazon S3 bucket or directory to receive the operation results. The following
        # substrings are not allowed in the s3 key portion of the outputURI field: ':', '//', '/./', '/../'.
        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String?

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The status of the BatchPrediction . This element can have one of the following values: PENDING -
        # Amazon Machine Learning (Amazon ML) submitted a request to generate predictions for a batch of
        # observations. INPROGRESS - The process is underway. FAILED - The request to perform a batch
        # prediction did not run to completion. It is not usable. COMPLETED - The batch prediction process
        # completed successfully. DELETED - The BatchPrediction is marked as deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        @[JSON::Field(key: "TotalRecordCount")]
        getter total_record_count : Int64?

        def initialize(
          @batch_prediction_data_source_id : String? = nil,
          @batch_prediction_id : String? = nil,
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @invalid_record_count : Int64? = nil,
          @last_updated_at : Time? = nil,
          @ml_model_id : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @output_uri : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @total_record_count : Int64? = nil
        )
        end
      end

      struct CreateBatchPredictionInput
        include JSON::Serializable

        # The ID of the DataSource that points to the group of observations to predict.
        @[JSON::Field(key: "BatchPredictionDataSourceId")]
        getter batch_prediction_data_source_id : String

        # A user-supplied ID that uniquely identifies the BatchPrediction .
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String

        # The ID of the MLModel that will generate predictions for the group of observations.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        # The location of an Amazon Simple Storage Service (Amazon S3) bucket or directory to store the batch
        # prediction results. The following substrings are not allowed in the s3 key portion of the outputURI
        # field: ':', '//', '/./', '/../'. Amazon ML needs permissions to store and retrieve the logs on your
        # behalf. For information about how to set permissions, see the Amazon Machine Learning Developer
        # Guide .
        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String

        # A user-supplied name or description of the BatchPrediction . BatchPredictionName can only use the
        # UTF-8 character set.
        @[JSON::Field(key: "BatchPredictionName")]
        getter batch_prediction_name : String?

        def initialize(
          @batch_prediction_data_source_id : String,
          @batch_prediction_id : String,
          @ml_model_id : String,
          @output_uri : String,
          @batch_prediction_name : String? = nil
        )
        end
      end

      # Represents the output of a CreateBatchPrediction operation, and is an acknowledgement that Amazon ML
      # received the request. The CreateBatchPrediction operation is asynchronous. You can poll for status
      # updates by using the &gt;GetBatchPrediction operation and checking the Status parameter of the
      # result.
      struct CreateBatchPredictionOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the BatchPrediction . This value is identical to the
        # value of the BatchPredictionId in the request.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String?

        def initialize(
          @batch_prediction_id : String? = nil
        )
        end
      end

      struct CreateDataSourceFromRDSInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the DataSource . Typically, an Amazon Resource Number
        # (ARN) becomes the ID for a DataSource .
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # The data specification of an Amazon RDS DataSource : DatabaseInformation - DatabaseName - The name
        # of the Amazon RDS database. InstanceIdentifier - A unique identifier for the Amazon RDS database
        # instance. DatabaseCredentials - AWS Identity and Access Management (IAM) credentials that are used
        # to connect to the Amazon RDS database. ResourceRole - A role (DataPipelineDefaultResourceRole)
        # assumed by an EC2 instance to carry out the copy task from Amazon RDS to Amazon Simple Storage
        # Service (Amazon S3). For more information, see Role templates for data pipelines. ServiceRole - A
        # role (DataPipelineDefaultRole) assumed by the AWS Data Pipeline service to monitor the progress of
        # the copy task from Amazon RDS to Amazon S3. For more information, see Role templates for data
        # pipelines. SecurityInfo - The security information to use to access an RDS DB instance. You need to
        # set up appropriate ingress rules for the security entity IDs provided to allow access to the Amazon
        # RDS instance. Specify a [ SubnetId , SecurityGroupIds ] pair for a VPC-based RDS DB instance.
        # SelectSqlQuery - A query that is used to retrieve the observation data for the Datasource .
        # S3StagingLocation - The Amazon S3 location for staging Amazon RDS data. The data retrieved from
        # Amazon RDS using SelectSqlQuery is stored in this location. DataSchemaUri - The Amazon S3 location
        # of the DataSchema . DataSchema - A JSON string representing the schema. This is not required if
        # DataSchemaUri is specified. DataRearrangement - A JSON string that represents the splitting and
        # rearrangement requirements for the Datasource . Sample -
        # "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"
        @[JSON::Field(key: "RDSData")]
        getter rds_data : Types::RDSDataSpec

        # The role that Amazon ML assumes on behalf of the user to create and activate a data pipeline in the
        # user's account and copy data using the SelectSqlQuery query from Amazon RDS to Amazon S3.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The compute statistics for a DataSource . The statistics are generated from the observation data
        # referenced by a DataSource . Amazon ML uses the statistics internally during MLModel training. This
        # parameter must be set to true if the DataSource needs to be used for MLModel training.
        @[JSON::Field(key: "ComputeStatistics")]
        getter compute_statistics : Bool?

        # A user-supplied name or description of the DataSource .
        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String?

        def initialize(
          @data_source_id : String,
          @rds_data : Types::RDSDataSpec,
          @role_arn : String,
          @compute_statistics : Bool? = nil,
          @data_source_name : String? = nil
        )
        end
      end

      # Represents the output of a CreateDataSourceFromRDS operation, and is an acknowledgement that Amazon
      # ML received the request. The CreateDataSourceFromRDS &gt; operation is asynchronous. You can poll
      # for updates by using the GetBatchPrediction operation and checking the Status parameter. You can
      # inspect the Message when Status shows up as FAILED . You can also check the progress of the copy
      # operation by going to the DataPipeline console and looking up the pipeline using the pipelineId from
      # the describe call.
      struct CreateDataSourceFromRDSOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the datasource. This value should be identical to the
        # value of the DataSourceID in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_id : String? = nil
        )
        end
      end

      struct CreateDataSourceFromRedshiftInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the DataSource .
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # The data specification of an Amazon Redshift DataSource : DatabaseInformation - DatabaseName - The
        # name of the Amazon Redshift database. ClusterIdentifier - The unique ID for the Amazon Redshift
        # cluster. DatabaseCredentials - The AWS Identity and Access Management (IAM) credentials that are
        # used to connect to the Amazon Redshift database. SelectSqlQuery - The query that is used to retrieve
        # the observation data for the Datasource . S3StagingLocation - The Amazon Simple Storage Service
        # (Amazon S3) location for staging Amazon Redshift data. The data retrieved from Amazon Redshift using
        # the SelectSqlQuery query is stored in this location. DataSchemaUri - The Amazon S3 location of the
        # DataSchema . DataSchema - A JSON string representing the schema. This is not required if
        # DataSchemaUri is specified. DataRearrangement - A JSON string that represents the splitting and
        # rearrangement requirements for the DataSource . Sample -
        # "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"
        @[JSON::Field(key: "DataSpec")]
        getter data_spec : Types::RedshiftDataSpec

        # A fully specified role Amazon Resource Name (ARN). Amazon ML assumes the role on behalf of the user
        # to create the following: A security group to allow Amazon ML to execute the SelectSqlQuery query on
        # an Amazon Redshift cluster An Amazon S3 bucket policy to grant Amazon ML read/write permissions on
        # the S3StagingLocation
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The compute statistics for a DataSource . The statistics are generated from the observation data
        # referenced by a DataSource . Amazon ML uses the statistics internally during MLModel training. This
        # parameter must be set to true if the DataSource needs to be used for MLModel training.
        @[JSON::Field(key: "ComputeStatistics")]
        getter compute_statistics : Bool?

        # A user-supplied name or description of the DataSource .
        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String?

        def initialize(
          @data_source_id : String,
          @data_spec : Types::RedshiftDataSpec,
          @role_arn : String,
          @compute_statistics : Bool? = nil,
          @data_source_name : String? = nil
        )
        end
      end

      # Represents the output of a CreateDataSourceFromRedshift operation, and is an acknowledgement that
      # Amazon ML received the request. The CreateDataSourceFromRedshift operation is asynchronous. You can
      # poll for updates by using the GetBatchPrediction operation and checking the Status parameter.
      struct CreateDataSourceFromRedshiftOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the datasource. This value should be identical to the
        # value of the DataSourceID in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_id : String? = nil
        )
        end
      end

      struct CreateDataSourceFromS3Input
        include JSON::Serializable

        # A user-supplied identifier that uniquely identifies the DataSource .
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # The data specification of a DataSource : DataLocationS3 - The Amazon S3 location of the observation
        # data. DataSchemaLocationS3 - The Amazon S3 location of the DataSchema . DataSchema - A JSON string
        # representing the schema. This is not required if DataSchemaUri is specified. DataRearrangement - A
        # JSON string that represents the splitting and rearrangement requirements for the Datasource . Sample
        # - "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"
        @[JSON::Field(key: "DataSpec")]
        getter data_spec : Types::S3DataSpec

        # The compute statistics for a DataSource . The statistics are generated from the observation data
        # referenced by a DataSource . Amazon ML uses the statistics internally during MLModel training. This
        # parameter must be set to true if the DataSource needs to be used for MLModel training.
        @[JSON::Field(key: "ComputeStatistics")]
        getter compute_statistics : Bool?

        # A user-supplied name or description of the DataSource .
        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String?

        def initialize(
          @data_source_id : String,
          @data_spec : Types::S3DataSpec,
          @compute_statistics : Bool? = nil,
          @data_source_name : String? = nil
        )
        end
      end

      # Represents the output of a CreateDataSourceFromS3 operation, and is an acknowledgement that Amazon
      # ML received the request. The CreateDataSourceFromS3 operation is asynchronous. You can poll for
      # updates by using the GetBatchPrediction operation and checking the Status parameter.
      struct CreateDataSourceFromS3Output
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the DataSource . This value should be identical to the
        # value of the DataSourceID in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_id : String? = nil
        )
        end
      end

      struct CreateEvaluationInput
        include JSON::Serializable

        # The ID of the DataSource for the evaluation. The schema of the DataSource must match the schema used
        # to create the MLModel .
        @[JSON::Field(key: "EvaluationDataSourceId")]
        getter evaluation_data_source_id : String

        # A user-supplied ID that uniquely identifies the Evaluation .
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String

        # The ID of the MLModel to evaluate. The schema used in creating the MLModel must match the schema of
        # the DataSource used in the Evaluation .
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        # A user-supplied name or description of the Evaluation .
        @[JSON::Field(key: "EvaluationName")]
        getter evaluation_name : String?

        def initialize(
          @evaluation_data_source_id : String,
          @evaluation_id : String,
          @ml_model_id : String,
          @evaluation_name : String? = nil
        )
        end
      end

      # Represents the output of a CreateEvaluation operation, and is an acknowledgement that Amazon ML
      # received the request. CreateEvaluation operation is asynchronous. You can poll for status updates by
      # using the GetEvcaluation operation and checking the Status parameter.
      struct CreateEvaluationOutput
        include JSON::Serializable

        # The user-supplied ID that uniquely identifies the Evaluation . This value should be identical to the
        # value of the EvaluationId in the request.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String?

        def initialize(
          @evaluation_id : String? = nil
        )
        end
      end

      struct CreateMLModelInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel .
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        # The category of supervised learning that this MLModel will address. Choose from the following types:
        # Choose REGRESSION if the MLModel will be used to predict a numeric value. Choose BINARY if the
        # MLModel result has two possible values. Choose MULTICLASS if the MLModel result has a limited number
        # of values. For more information, see the Amazon Machine Learning Developer Guide .
        @[JSON::Field(key: "MLModelType")]
        getter ml_model_type : String

        # The DataSource that points to the training data.
        @[JSON::Field(key: "TrainingDataSourceId")]
        getter training_data_source_id : String

        # A user-supplied name or description of the MLModel .
        @[JSON::Field(key: "MLModelName")]
        getter ml_model_name : String?

        # A list of the training parameters in the MLModel . The list is implemented as a map of key-value
        # pairs. The following is the current set of training parameters: sgd.maxMLModelSizeInBytes - The
        # maximum allowed size of the model. Depending on the input data, the size of the model might affect
        # its performance. The value is an integer that ranges from 100000 to 2147483648 . The default value
        # is 33554432 . sgd.maxPasses - The number of times that the training process traverses the
        # observations to build the MLModel . The value is an integer that ranges from 1 to 10000 . The
        # default value is 10 . sgd.shuffleType - Whether Amazon ML shuffles the training data. Shuffling the
        # data improves a model's ability to find the optimal solution for a variety of data types. The valid
        # values are auto and none . The default value is none . We strongly recommend that you shuffle your
        # data. sgd.l1RegularizationAmount - The coefficient regularization L1 norm. It controls overfitting
        # the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a
        # sparse feature set. If you use this parameter, start by specifying a small value, such as 1.0E-08 .
        # The value is a double that ranges from 0 to MAX_DOUBLE . The default is to not use L1 normalization.
        # This parameter can't be used when L2 is specified. Use this parameter sparingly.
        # sgd.l2RegularizationAmount - The coefficient regularization L2 norm. It controls overfitting the
        # data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If
        # you use this parameter, start by specifying a small value, such as 1.0E-08 . The value is a double
        # that ranges from 0 to MAX_DOUBLE . The default is to not use L2 normalization. This parameter can't
        # be used when L1 is specified. Use this parameter sparingly.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The data recipe for creating the MLModel . You must specify either the recipe or its URI. If you
        # don't specify a recipe or its URI, Amazon ML creates a default.
        @[JSON::Field(key: "Recipe")]
        getter recipe : String?

        # The Amazon Simple Storage Service (Amazon S3) location and file name that contains the MLModel
        # recipe. You must specify either the recipe or its URI. If you don't specify a recipe or its URI,
        # Amazon ML creates a default.
        @[JSON::Field(key: "RecipeUri")]
        getter recipe_uri : String?

        def initialize(
          @ml_model_id : String,
          @ml_model_type : String,
          @training_data_source_id : String,
          @ml_model_name : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @recipe : String? = nil,
          @recipe_uri : String? = nil
        )
        end
      end

      # Represents the output of a CreateMLModel operation, and is an acknowledgement that Amazon ML
      # received the request. The CreateMLModel operation is asynchronous. You can poll for status updates
      # by using the GetMLModel operation and checking the Status parameter.
      struct CreateMLModelOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel . This value should be identical to the
        # value of the MLModelId in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        def initialize(
          @ml_model_id : String? = nil
        )
        end
      end

      struct CreateRealtimeEndpointInput
        include JSON::Serializable

        # The ID assigned to the MLModel during creation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        def initialize(
          @ml_model_id : String
        )
        end
      end

      # Represents the output of an CreateRealtimeEndpoint operation. The result contains the MLModelId and
      # the endpoint information for the MLModel . Note: The endpoint information includes the URI of the
      # MLModel ; that is, the location to send online prediction requests for the specified MLModel .
      struct CreateRealtimeEndpointOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel . This value should be identical to the
        # value of the MLModelId in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # The endpoint information of the MLModel
        @[JSON::Field(key: "RealtimeEndpointInfo")]
        getter realtime_endpoint_info : Types::RealtimeEndpointInfo?

        def initialize(
          @ml_model_id : String? = nil,
          @realtime_endpoint_info : Types::RealtimeEndpointInfo? = nil
        )
        end
      end

      # Represents the output of the GetDataSource operation. The content consists of the detailed metadata
      # and data file information and the current status of the DataSource .
      struct DataSource
        include JSON::Serializable

        # The parameter is true if statistics need to be generated from the observation data.
        @[JSON::Field(key: "ComputeStatistics")]
        getter compute_statistics : Bool?

        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the DataSource was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account from which the DataSource was created. The account type can be either an AWS
        # root account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The location and name of the data in Amazon Simple Storage Service (Amazon S3) that is used by a
        # DataSource .
        @[JSON::Field(key: "DataLocationS3")]
        getter data_location_s3 : String?

        # A JSON string that represents the splitting and rearrangement requirement used when this DataSource
        # was created.
        @[JSON::Field(key: "DataRearrangement")]
        getter data_rearrangement : String?

        # The total number of observations contained in the data files that the DataSource references.
        @[JSON::Field(key: "DataSizeInBytes")]
        getter data_size_in_bytes : Int64?

        # The ID that is assigned to the DataSource during creation.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The time of the most recent edit to the BatchPrediction . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A description of the most recent details about creating the DataSource .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the DataSource .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The number of data files referenced by the DataSource .
        @[JSON::Field(key: "NumberOfFiles")]
        getter number_of_files : Int64?

        @[JSON::Field(key: "RDSMetadata")]
        getter rds_metadata : Types::RDSMetadata?

        @[JSON::Field(key: "RedshiftMetadata")]
        getter redshift_metadata : Types::RedshiftMetadata?

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of the DataSource . This element can have one of the following values: PENDING -
        # Amazon Machine Learning (Amazon ML) submitted a request to create a DataSource . INPROGRESS - The
        # creation process is underway. FAILED - The request to create a DataSource did not run to completion.
        # It is not usable. COMPLETED - The creation process completed successfully. DELETED - The DataSource
        # is marked as deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @compute_statistics : Bool? = nil,
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @data_location_s3 : String? = nil,
          @data_rearrangement : String? = nil,
          @data_size_in_bytes : Int64? = nil,
          @data_source_id : String? = nil,
          @finished_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @number_of_files : Int64? = nil,
          @rds_metadata : Types::RDSMetadata? = nil,
          @redshift_metadata : Types::RedshiftMetadata? = nil,
          @role_arn : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteBatchPredictionInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the BatchPrediction .
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String

        def initialize(
          @batch_prediction_id : String
        )
        end
      end

      # Represents the output of a DeleteBatchPrediction operation. You can use the GetBatchPrediction
      # operation and check the value of the Status parameter to see whether a BatchPrediction is marked as
      # DELETED .
      struct DeleteBatchPredictionOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the BatchPrediction . This value should be identical to
        # the value of the BatchPredictionID in the request.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String?

        def initialize(
          @batch_prediction_id : String? = nil
        )
        end
      end

      struct DeleteDataSourceInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the DataSource .
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        def initialize(
          @data_source_id : String
        )
        end
      end

      # Represents the output of a DeleteDataSource operation.
      struct DeleteDataSourceOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the DataSource . This value should be identical to the
        # value of the DataSourceID in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_id : String? = nil
        )
        end
      end

      struct DeleteEvaluationInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the Evaluation to delete.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String

        def initialize(
          @evaluation_id : String
        )
        end
      end

      # Represents the output of a DeleteEvaluation operation. The output indicates that Amazon Machine
      # Learning (Amazon ML) received the request. You can use the GetEvaluation operation and check the
      # value of the Status parameter to see whether an Evaluation is marked as DELETED .
      struct DeleteEvaluationOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the Evaluation . This value should be identical to the
        # value of the EvaluationId in the request.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String?

        def initialize(
          @evaluation_id : String? = nil
        )
        end
      end

      struct DeleteMLModelInput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel .
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        def initialize(
          @ml_model_id : String
        )
        end
      end

      # Represents the output of a DeleteMLModel operation. You can use the GetMLModel operation and check
      # the value of the Status parameter to see whether an MLModel is marked as DELETED .
      struct DeleteMLModelOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel . This value should be identical to the
        # value of the MLModelID in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        def initialize(
          @ml_model_id : String? = nil
        )
        end
      end

      struct DeleteRealtimeEndpointInput
        include JSON::Serializable

        # The ID assigned to the MLModel during creation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        def initialize(
          @ml_model_id : String
        )
        end
      end

      # Represents the output of an DeleteRealtimeEndpoint operation. The result contains the MLModelId and
      # the endpoint information for the MLModel .
      struct DeleteRealtimeEndpointOutput
        include JSON::Serializable

        # A user-supplied ID that uniquely identifies the MLModel . This value should be identical to the
        # value of the MLModelId in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # The endpoint information of the MLModel
        @[JSON::Field(key: "RealtimeEndpointInfo")]
        getter realtime_endpoint_info : Types::RealtimeEndpointInfo?

        def initialize(
          @ml_model_id : String? = nil,
          @realtime_endpoint_info : Types::RealtimeEndpointInfo? = nil
        )
        end
      end

      struct DeleteTagsInput
        include JSON::Serializable

        # The ID of the tagged ML object. For example, exampleModelId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the tagged ML object.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # One or more tags to delete.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Amazon ML returns the following elements.
      struct DeleteTagsOutput
        include JSON::Serializable

        # The ID of the ML object from which tags were deleted.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the ML object from which tags were deleted.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct DescribeBatchPredictionsInput
        include JSON::Serializable

        # The equal to operator. The BatchPrediction results will have FilterVariable values that exactly
        # match the value specified with EQ .
        @[JSON::Field(key: "EQ")]
        getter eq : String?

        # Use one of the following variables to filter a list of BatchPrediction : CreatedAt - Sets the search
        # criteria to the BatchPrediction creation date. Status - Sets the search criteria to the
        # BatchPrediction status. Name - Sets the search criteria to the contents of the BatchPrediction Name
        # . IAMUser - Sets the search criteria to the user account that invoked the BatchPrediction creation.
        # MLModelId - Sets the search criteria to the MLModel used in the BatchPrediction . DataSourceId -
        # Sets the search criteria to the DataSource used in the BatchPrediction . DataURI - Sets the search
        # criteria to the data file(s) used in the BatchPrediction . The URL can identify either a file or an
        # Amazon Simple Storage Solution (Amazon S3) bucket or directory.
        @[JSON::Field(key: "FilterVariable")]
        getter filter_variable : String?

        # The greater than or equal to operator. The BatchPrediction results will have FilterVariable values
        # that are greater than or equal to the value specified with GE .
        @[JSON::Field(key: "GE")]
        getter ge : String?

        # The greater than operator. The BatchPrediction results will have FilterVariable values that are
        # greater than the value specified with GT .
        @[JSON::Field(key: "GT")]
        getter gt : String?

        # The less than or equal to operator. The BatchPrediction results will have FilterVariable values that
        # are less than or equal to the value specified with LE .
        @[JSON::Field(key: "LE")]
        getter le : String?

        # The less than operator. The BatchPrediction results will have FilterVariable values that are less
        # than the value specified with LT .
        @[JSON::Field(key: "LT")]
        getter lt : String?

        # The number of pages of information to include in the result. The range of acceptable values is 1
        # through 100 . The default value is 100 .
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The not equal to operator. The BatchPrediction results will have FilterVariable values not equal to
        # the value specified with NE .
        @[JSON::Field(key: "NE")]
        getter ne : String?

        # An ID of the page in the paginated results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string that is found at the beginning of a variable, such as Name or Id . For example, a Batch
        # Prediction operation could have the Name 2014-09-09-HolidayGiftMailer . To search for this
        # BatchPrediction , select Name for the FilterVariable and any of the following strings for the Prefix
        # : 2014-09 2014-09-09 2014-09-09-Holiday
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A two-value parameter that determines the sequence of the resulting list of MLModel s. asc -
        # Arranges the list in ascending order (A-Z, 0-9). dsc - Arranges the list in descending order (Z-A,
        # 9-0). Results are sorted by FilterVariable .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @eq : String? = nil,
          @filter_variable : String? = nil,
          @ge : String? = nil,
          @gt : String? = nil,
          @le : String? = nil,
          @lt : String? = nil,
          @limit : Int32? = nil,
          @ne : String? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Represents the output of a DescribeBatchPredictions operation. The content is essentially a list of
      # BatchPrediction s.
      struct DescribeBatchPredictionsOutput
        include JSON::Serializable

        # The ID of the next page in the paginated results that indicates at least one more page follows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of BatchPrediction objects that meet the search criteria.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::BatchPrediction)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::BatchPrediction)? = nil
        )
        end
      end

      struct DescribeDataSourcesInput
        include JSON::Serializable

        # The equal to operator. The DataSource results will have FilterVariable values that exactly match the
        # value specified with EQ .
        @[JSON::Field(key: "EQ")]
        getter eq : String?

        # Use one of the following variables to filter a list of DataSource : CreatedAt - Sets the search
        # criteria to DataSource creation dates. Status - Sets the search criteria to DataSource statuses.
        # Name - Sets the search criteria to the contents of DataSource Name . DataUri - Sets the search
        # criteria to the URI of data files used to create the DataSource . The URI can identify either a file
        # or an Amazon Simple Storage Service (Amazon S3) bucket or directory. IAMUser - Sets the search
        # criteria to the user account that invoked the DataSource creation.
        @[JSON::Field(key: "FilterVariable")]
        getter filter_variable : String?

        # The greater than or equal to operator. The DataSource results will have FilterVariable values that
        # are greater than or equal to the value specified with GE .
        @[JSON::Field(key: "GE")]
        getter ge : String?

        # The greater than operator. The DataSource results will have FilterVariable values that are greater
        # than the value specified with GT .
        @[JSON::Field(key: "GT")]
        getter gt : String?

        # The less than or equal to operator. The DataSource results will have FilterVariable values that are
        # less than or equal to the value specified with LE .
        @[JSON::Field(key: "LE")]
        getter le : String?

        # The less than operator. The DataSource results will have FilterVariable values that are less than
        # the value specified with LT .
        @[JSON::Field(key: "LT")]
        getter lt : String?

        # The maximum number of DataSource to include in the result.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The not equal to operator. The DataSource results will have FilterVariable values not equal to the
        # value specified with NE .
        @[JSON::Field(key: "NE")]
        getter ne : String?

        # The ID of the page in the paginated results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string that is found at the beginning of a variable, such as Name or Id . For example, a
        # DataSource could have the Name 2014-09-09-HolidayGiftMailer . To search for this DataSource , select
        # Name for the FilterVariable and any of the following strings for the Prefix : 2014-09 2014-09-09
        # 2014-09-09-Holiday
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A two-value parameter that determines the sequence of the resulting list of DataSource . asc -
        # Arranges the list in ascending order (A-Z, 0-9). dsc - Arranges the list in descending order (Z-A,
        # 9-0). Results are sorted by FilterVariable .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @eq : String? = nil,
          @filter_variable : String? = nil,
          @ge : String? = nil,
          @gt : String? = nil,
          @le : String? = nil,
          @lt : String? = nil,
          @limit : Int32? = nil,
          @ne : String? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Represents the query results from a DescribeDataSources operation. The content is essentially a list
      # of DataSource .
      struct DescribeDataSourcesOutput
        include JSON::Serializable

        # An ID of the next page in the paginated results that indicates at least one more page follows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of DataSource that meet the search criteria.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::DataSource)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::DataSource)? = nil
        )
        end
      end

      struct DescribeEvaluationsInput
        include JSON::Serializable

        # The equal to operator. The Evaluation results will have FilterVariable values that exactly match the
        # value specified with EQ .
        @[JSON::Field(key: "EQ")]
        getter eq : String?

        # Use one of the following variable to filter a list of Evaluation objects: CreatedAt - Sets the
        # search criteria to the Evaluation creation date. Status - Sets the search criteria to the Evaluation
        # status. Name - Sets the search criteria to the contents of Evaluation Name . IAMUser - Sets the
        # search criteria to the user account that invoked an Evaluation . MLModelId - Sets the search
        # criteria to the MLModel that was evaluated. DataSourceId - Sets the search criteria to the
        # DataSource used in Evaluation . DataUri - Sets the search criteria to the data file(s) used in
        # Evaluation . The URL can identify either a file or an Amazon Simple Storage Solution (Amazon S3)
        # bucket or directory.
        @[JSON::Field(key: "FilterVariable")]
        getter filter_variable : String?

        # The greater than or equal to operator. The Evaluation results will have FilterVariable values that
        # are greater than or equal to the value specified with GE .
        @[JSON::Field(key: "GE")]
        getter ge : String?

        # The greater than operator. The Evaluation results will have FilterVariable values that are greater
        # than the value specified with GT .
        @[JSON::Field(key: "GT")]
        getter gt : String?

        # The less than or equal to operator. The Evaluation results will have FilterVariable values that are
        # less than or equal to the value specified with LE .
        @[JSON::Field(key: "LE")]
        getter le : String?

        # The less than operator. The Evaluation results will have FilterVariable values that are less than
        # the value specified with LT .
        @[JSON::Field(key: "LT")]
        getter lt : String?

        # The maximum number of Evaluation to include in the result.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The not equal to operator. The Evaluation results will have FilterVariable values not equal to the
        # value specified with NE .
        @[JSON::Field(key: "NE")]
        getter ne : String?

        # The ID of the page in the paginated results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string that is found at the beginning of a variable, such as Name or Id . For example, an
        # Evaluation could have the Name 2014-09-09-HolidayGiftMailer . To search for this Evaluation , select
        # Name for the FilterVariable and any of the following strings for the Prefix : 2014-09 2014-09-09
        # 2014-09-09-Holiday
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A two-value parameter that determines the sequence of the resulting list of Evaluation . asc -
        # Arranges the list in ascending order (A-Z, 0-9). dsc - Arranges the list in descending order (Z-A,
        # 9-0). Results are sorted by FilterVariable .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @eq : String? = nil,
          @filter_variable : String? = nil,
          @ge : String? = nil,
          @gt : String? = nil,
          @le : String? = nil,
          @lt : String? = nil,
          @limit : Int32? = nil,
          @ne : String? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Represents the query results from a DescribeEvaluations operation. The content is essentially a list
      # of Evaluation .
      struct DescribeEvaluationsOutput
        include JSON::Serializable

        # The ID of the next page in the paginated results that indicates at least one more page follows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Evaluation that meet the search criteria.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::Evaluation)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::Evaluation)? = nil
        )
        end
      end

      struct DescribeMLModelsInput
        include JSON::Serializable

        # The equal to operator. The MLModel results will have FilterVariable values that exactly match the
        # value specified with EQ .
        @[JSON::Field(key: "EQ")]
        getter eq : String?

        # Use one of the following variables to filter a list of MLModel : CreatedAt - Sets the search
        # criteria to MLModel creation date. Status - Sets the search criteria to MLModel status. Name - Sets
        # the search criteria to the contents of MLModel Name . IAMUser - Sets the search criteria to the user
        # account that invoked the MLModel creation. TrainingDataSourceId - Sets the search criteria to the
        # DataSource used to train one or more MLModel . RealtimeEndpointStatus - Sets the search criteria to
        # the MLModel real-time endpoint status. MLModelType - Sets the search criteria to MLModel type:
        # binary, regression, or multi-class. Algorithm - Sets the search criteria to the algorithm that the
        # MLModel uses. TrainingDataURI - Sets the search criteria to the data file(s) used in training a
        # MLModel . The URL can identify either a file or an Amazon Simple Storage Service (Amazon S3) bucket
        # or directory.
        @[JSON::Field(key: "FilterVariable")]
        getter filter_variable : String?

        # The greater than or equal to operator. The MLModel results will have FilterVariable values that are
        # greater than or equal to the value specified with GE .
        @[JSON::Field(key: "GE")]
        getter ge : String?

        # The greater than operator. The MLModel results will have FilterVariable values that are greater than
        # the value specified with GT .
        @[JSON::Field(key: "GT")]
        getter gt : String?

        # The less than or equal to operator. The MLModel results will have FilterVariable values that are
        # less than or equal to the value specified with LE .
        @[JSON::Field(key: "LE")]
        getter le : String?

        # The less than operator. The MLModel results will have FilterVariable values that are less than the
        # value specified with LT .
        @[JSON::Field(key: "LT")]
        getter lt : String?

        # The number of pages of information to include in the result. The range of acceptable values is 1
        # through 100 . The default value is 100 .
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The not equal to operator. The MLModel results will have FilterVariable values not equal to the
        # value specified with NE .
        @[JSON::Field(key: "NE")]
        getter ne : String?

        # The ID of the page in the paginated results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string that is found at the beginning of a variable, such as Name or Id . For example, an MLModel
        # could have the Name 2014-09-09-HolidayGiftMailer . To search for this MLModel , select Name for the
        # FilterVariable and any of the following strings for the Prefix : 2014-09 2014-09-09
        # 2014-09-09-Holiday
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A two-value parameter that determines the sequence of the resulting list of MLModel . asc - Arranges
        # the list in ascending order (A-Z, 0-9). dsc - Arranges the list in descending order (Z-A, 9-0).
        # Results are sorted by FilterVariable .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @eq : String? = nil,
          @filter_variable : String? = nil,
          @ge : String? = nil,
          @gt : String? = nil,
          @le : String? = nil,
          @lt : String? = nil,
          @limit : Int32? = nil,
          @ne : String? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Represents the output of a DescribeMLModels operation. The content is essentially a list of MLModel
      # .
      struct DescribeMLModelsOutput
        include JSON::Serializable

        # The ID of the next page in the paginated results that indicates at least one more page follows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of MLModel that meet the search criteria.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::MLModel)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::MLModel)? = nil
        )
        end
      end

      struct DescribeTagsInput
        include JSON::Serializable

        # The ID of the ML object. For example, exampleModelId .
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the ML object.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Amazon ML returns the following elements.
      struct DescribeTagsOutput
        include JSON::Serializable

        # The ID of the tagged ML object.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the tagged ML object.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # A list of tags associated with the ML object.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the output of GetEvaluation operation. The content consists of the detailed metadata and
      # data file information and the current status of the Evaluation .
      struct Evaluation
        include JSON::Serializable

        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the Evaluation was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account that invoked the evaluation. The account type can be either an AWS root account
        # or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The ID of the DataSource that is used to evaluate the MLModel .
        @[JSON::Field(key: "EvaluationDataSourceId")]
        getter evaluation_data_source_id : String?

        # The ID that is assigned to the Evaluation at creation.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String?

        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location and name of the data in Amazon Simple Storage Server (Amazon S3) that is used in the
        # evaluation.
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        # The time of the most recent edit to the Evaluation . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The ID of the MLModel that is the focus of the evaluation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # A description of the most recent details about evaluating the MLModel .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the Evaluation .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Measurements of how well the MLModel performed, using observations referenced by the DataSource .
        # One of the following metrics is returned, based on the type of the MLModel : BinaryAUC: A binary
        # MLModel uses the Area Under the Curve (AUC) technique to measure performance. RegressionRMSE: A
        # regression MLModel uses the Root Mean Square Error (RMSE) technique to measure performance. RMSE
        # measures the difference between predicted and actual values for a single variable.
        # MulticlassAvgFScore: A multiclass MLModel uses the F1 score technique to measure performance. For
        # more information about performance metrics, please see the Amazon Machine Learning Developer Guide .
        @[JSON::Field(key: "PerformanceMetrics")]
        getter performance_metrics : Types::PerformanceMetrics?

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The status of the evaluation. This element can have one of the following values: PENDING - Amazon
        # Machine Learning (Amazon ML) submitted a request to evaluate an MLModel . INPROGRESS - The
        # evaluation is underway. FAILED - The request to evaluate an MLModel did not run to completion. It is
        # not usable. COMPLETED - The evaluation process completed successfully. DELETED - The Evaluation is
        # marked as deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @evaluation_data_source_id : String? = nil,
          @evaluation_id : String? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @last_updated_at : Time? = nil,
          @ml_model_id : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @performance_metrics : Types::PerformanceMetrics? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetBatchPredictionInput
        include JSON::Serializable

        # An ID assigned to the BatchPrediction at creation.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String

        def initialize(
          @batch_prediction_id : String
        )
        end
      end

      # Represents the output of a GetBatchPrediction operation and describes a BatchPrediction .
      struct GetBatchPredictionOutput
        include JSON::Serializable

        # The ID of the DataSource that was used to create the BatchPrediction .
        @[JSON::Field(key: "BatchPredictionDataSourceId")]
        getter batch_prediction_data_source_id : String?

        # An ID assigned to the BatchPrediction at creation. This value should be identical to the value of
        # the BatchPredictionID in the request.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String?

        # The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the
        # BatchPrediction , normalized and scaled on computation resources. ComputeTime is only available if
        # the BatchPrediction is in the COMPLETED state.
        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time when the BatchPrediction was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account that invoked the BatchPrediction . The account type can be either an AWS root
        # account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The epoch time when Amazon Machine Learning marked the BatchPrediction as COMPLETED or FAILED .
        # FinishedAt is only available when the BatchPrediction is in the COMPLETED or FAILED state.
        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        # The number of invalid records that Amazon Machine Learning saw while processing the BatchPrediction
        # .
        @[JSON::Field(key: "InvalidRecordCount")]
        getter invalid_record_count : Int64?

        # The time of the most recent edit to BatchPrediction . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A link to the file that contains logs of the CreateBatchPrediction operation.
        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The ID of the MLModel that generated predictions for the BatchPrediction request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # A description of the most recent details about processing the batch prediction request.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the BatchPrediction .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The location of an Amazon S3 bucket or directory to receive the operation results.
        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String?

        # The epoch time when Amazon Machine Learning marked the BatchPrediction as INPROGRESS . StartedAt
        # isn't available if the BatchPrediction is in the PENDING state.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The status of the BatchPrediction , which can be one of the following values: PENDING - Amazon
        # Machine Learning (Amazon ML) submitted a request to generate batch predictions. INPROGRESS - The
        # batch predictions are in progress. FAILED - The request to perform a batch prediction did not run to
        # completion. It is not usable. COMPLETED - The batch prediction process completed successfully.
        # DELETED - The BatchPrediction is marked as deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The number of total records that Amazon Machine Learning saw while processing the BatchPrediction .
        @[JSON::Field(key: "TotalRecordCount")]
        getter total_record_count : Int64?

        def initialize(
          @batch_prediction_data_source_id : String? = nil,
          @batch_prediction_id : String? = nil,
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @invalid_record_count : Int64? = nil,
          @last_updated_at : Time? = nil,
          @log_uri : String? = nil,
          @ml_model_id : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @output_uri : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @total_record_count : Int64? = nil
        )
        end
      end

      struct GetDataSourceInput
        include JSON::Serializable

        # The ID assigned to the DataSource at creation.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # Specifies whether the GetDataSource operation should return DataSourceSchema . If true,
        # DataSourceSchema is returned. If false, DataSourceSchema is not returned.
        @[JSON::Field(key: "Verbose")]
        getter verbose : Bool?

        def initialize(
          @data_source_id : String,
          @verbose : Bool? = nil
        )
        end
      end

      # Represents the output of a GetDataSource operation and describes a DataSource .
      struct GetDataSourceOutput
        include JSON::Serializable

        # The parameter is true if statistics need to be generated from the observation data.
        @[JSON::Field(key: "ComputeStatistics")]
        getter compute_statistics : Bool?

        # The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the
        # DataSource , normalized and scaled on computation resources. ComputeTime is only available if the
        # DataSource is in the COMPLETED state and the ComputeStatistics is set to true.
        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the DataSource was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account from which the DataSource was created. The account type can be either an AWS
        # root account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "DataLocationS3")]
        getter data_location_s3 : String?

        # A JSON string that represents the splitting and rearrangement requirement used when this DataSource
        # was created.
        @[JSON::Field(key: "DataRearrangement")]
        getter data_rearrangement : String?

        # The total size of observations in the data files.
        @[JSON::Field(key: "DataSizeInBytes")]
        getter data_size_in_bytes : Int64?

        # The ID assigned to the DataSource at creation. This value should be identical to the value of the
        # DataSourceId in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The schema used by all of the data files of this DataSource . Note: This parameter is provided as
        # part of the verbose format.
        @[JSON::Field(key: "DataSourceSchema")]
        getter data_source_schema : String?

        # The epoch time when Amazon Machine Learning marked the DataSource as COMPLETED or FAILED .
        # FinishedAt is only available when the DataSource is in the COMPLETED or FAILED state.
        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The time of the most recent edit to the DataSource . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A link to the file containing logs of CreateDataSourceFrom* operations.
        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The user-supplied description of the most recent details about creating the DataSource .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the DataSource .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The number of data files referenced by the DataSource .
        @[JSON::Field(key: "NumberOfFiles")]
        getter number_of_files : Int64?

        @[JSON::Field(key: "RDSMetadata")]
        getter rds_metadata : Types::RDSMetadata?

        @[JSON::Field(key: "RedshiftMetadata")]
        getter redshift_metadata : Types::RedshiftMetadata?

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The epoch time when Amazon Machine Learning marked the DataSource as INPROGRESS . StartedAt isn't
        # available if the DataSource is in the PENDING state.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of the DataSource . This element can have one of the following values: PENDING -
        # Amazon ML submitted a request to create a DataSource . INPROGRESS - The creation process is
        # underway. FAILED - The request to create a DataSource did not run to completion. It is not usable.
        # COMPLETED - The creation process completed successfully. DELETED - The DataSource is marked as
        # deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @compute_statistics : Bool? = nil,
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @data_location_s3 : String? = nil,
          @data_rearrangement : String? = nil,
          @data_size_in_bytes : Int64? = nil,
          @data_source_id : String? = nil,
          @data_source_schema : String? = nil,
          @finished_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @log_uri : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @number_of_files : Int64? = nil,
          @rds_metadata : Types::RDSMetadata? = nil,
          @redshift_metadata : Types::RedshiftMetadata? = nil,
          @role_arn : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetEvaluationInput
        include JSON::Serializable

        # The ID of the Evaluation to retrieve. The evaluation of each MLModel is recorded and cataloged. The
        # ID provides the means to access the information.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String

        def initialize(
          @evaluation_id : String
        )
        end
      end

      # Represents the output of a GetEvaluation operation and describes an Evaluation .
      struct GetEvaluationOutput
        include JSON::Serializable

        # The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the
        # Evaluation , normalized and scaled on computation resources. ComputeTime is only available if the
        # Evaluation is in the COMPLETED state.
        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the Evaluation was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account that invoked the evaluation. The account type can be either an AWS root account
        # or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The DataSource used for this evaluation.
        @[JSON::Field(key: "EvaluationDataSourceId")]
        getter evaluation_data_source_id : String?

        # The evaluation ID which is same as the EvaluationId in the request.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String?

        # The epoch time when Amazon Machine Learning marked the Evaluation as COMPLETED or FAILED .
        # FinishedAt is only available when the Evaluation is in the COMPLETED or FAILED state.
        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        # The time of the most recent edit to the Evaluation . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A link to the file that contains logs of the CreateEvaluation operation.
        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The ID of the MLModel that was the focus of the evaluation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # A description of the most recent details about evaluating the MLModel .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the Evaluation .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Measurements of how well the MLModel performed using observations referenced by the DataSource . One
        # of the following metric is returned based on the type of the MLModel : BinaryAUC: A binary MLModel
        # uses the Area Under the Curve (AUC) technique to measure performance. RegressionRMSE: A regression
        # MLModel uses the Root Mean Square Error (RMSE) technique to measure performance. RMSE measures the
        # difference between predicted and actual values for a single variable. MulticlassAvgFScore: A
        # multiclass MLModel uses the F1 score technique to measure performance. For more information about
        # performance metrics, please see the Amazon Machine Learning Developer Guide .
        @[JSON::Field(key: "PerformanceMetrics")]
        getter performance_metrics : Types::PerformanceMetrics?

        # The epoch time when Amazon Machine Learning marked the Evaluation as INPROGRESS . StartedAt isn't
        # available if the Evaluation is in the PENDING state.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The status of the evaluation. This element can have one of the following values: PENDING - Amazon
        # Machine Language (Amazon ML) submitted a request to evaluate an MLModel . INPROGRESS - The
        # evaluation is underway. FAILED - The request to evaluate an MLModel did not run to completion. It is
        # not usable. COMPLETED - The evaluation process completed successfully. DELETED - The Evaluation is
        # marked as deleted. It is not usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @evaluation_data_source_id : String? = nil,
          @evaluation_id : String? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @last_updated_at : Time? = nil,
          @log_uri : String? = nil,
          @ml_model_id : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @performance_metrics : Types::PerformanceMetrics? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetMLModelInput
        include JSON::Serializable

        # The ID assigned to the MLModel at creation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        # Specifies whether the GetMLModel operation should return Recipe . If true, Recipe is returned. If
        # false, Recipe is not returned.
        @[JSON::Field(key: "Verbose")]
        getter verbose : Bool?

        def initialize(
          @ml_model_id : String,
          @verbose : Bool? = nil
        )
        end
      end

      # Represents the output of a GetMLModel operation, and provides detailed information about a MLModel .
      struct GetMLModelOutput
        include JSON::Serializable

        # The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the MLModel ,
        # normalized and scaled on computation resources. ComputeTime is only available if the MLModel is in
        # the COMPLETED state.
        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the MLModel was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account from which the MLModel was created. The account type can be either an AWS root
        # account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The current endpoint of the MLModel
        @[JSON::Field(key: "EndpointInfo")]
        getter endpoint_info : Types::RealtimeEndpointInfo?

        # The epoch time when Amazon Machine Learning marked the MLModel as COMPLETED or FAILED . FinishedAt
        # is only available when the MLModel is in the COMPLETED or FAILED state.
        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        # The time of the most recent edit to the MLModel . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A link to the file that contains logs of the CreateMLModel operation.
        @[JSON::Field(key: "LogUri")]
        getter log_uri : String?

        # The MLModel ID, which is same as the MLModelId in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # Identifies the MLModel category. The following are the available types: REGRESSION -- Produces a
        # numeric result. For example, "What price should a house be listed at?" BINARY -- Produces one of two
        # possible results. For example, "Is this an e-commerce website?" MULTICLASS -- Produces one of
        # several possible results. For example, "Is this a HIGH, LOW or MEDIUM risk trade?"
        @[JSON::Field(key: "MLModelType")]
        getter ml_model_type : String?

        # A description of the most recent details about accessing the MLModel .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the MLModel .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The recipe to use when training the MLModel . The Recipe provides detailed information about the
        # observation data to use during training, and manipulations to perform on the observation data during
        # training. Note: This parameter is provided as part of the verbose format.
        @[JSON::Field(key: "Recipe")]
        getter recipe : String?

        # The schema used by all of the data files referenced by the DataSource . Note: This parameter is
        # provided as part of the verbose format.
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # The scoring threshold is used in binary classification MLModel models. It marks the boundary between
        # a positive prediction and a negative prediction. Output values greater than or equal to the
        # threshold receive a positive result from the MLModel, such as true . Output values less than the
        # threshold receive a negative response from the MLModel, such as false .
        @[JSON::Field(key: "ScoreThreshold")]
        getter score_threshold : Float64?

        # The time of the most recent edit to the ScoreThreshold . The time is expressed in epoch time.
        @[JSON::Field(key: "ScoreThresholdLastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter score_threshold_last_updated_at : Time?

        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        # The epoch time when Amazon Machine Learning marked the MLModel as INPROGRESS . StartedAt isn't
        # available if the MLModel is in the PENDING state.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of the MLModel . This element can have one of the following values: PENDING -
        # Amazon Machine Learning (Amazon ML) submitted a request to describe a MLModel . INPROGRESS - The
        # request is processing. FAILED - The request did not run to completion. The ML model isn't usable.
        # COMPLETED - The request completed successfully. DELETED - The MLModel is marked as deleted. It isn't
        # usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the training DataSource .
        @[JSON::Field(key: "TrainingDataSourceId")]
        getter training_data_source_id : String?

        # A list of the training parameters in the MLModel . The list is implemented as a map of key-value
        # pairs. The following is the current set of training parameters: sgd.maxMLModelSizeInBytes - The
        # maximum allowed size of the model. Depending on the input data, the size of the model might affect
        # its performance. The value is an integer that ranges from 100000 to 2147483648 . The default value
        # is 33554432 . sgd.maxPasses - The number of times that the training process traverses the
        # observations to build the MLModel . The value is an integer that ranges from 1 to 10000 . The
        # default value is 10 . sgd.shuffleType - Whether Amazon ML shuffles the training data. Shuffling data
        # improves a model's ability to find the optimal solution for a variety of data types. The valid
        # values are auto and none . The default value is none . We strongly recommend that you shuffle your
        # data. sgd.l1RegularizationAmount - The coefficient regularization L1 norm. It controls overfitting
        # the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a
        # sparse feature set. If you use this parameter, start by specifying a small value, such as 1.0E-08 .
        # The value is a double that ranges from 0 to MAX_DOUBLE . The default is to not use L1 normalization.
        # This parameter can't be used when L2 is specified. Use this parameter sparingly.
        # sgd.l2RegularizationAmount - The coefficient regularization L2 norm. It controls overfitting the
        # data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If
        # you use this parameter, start by specifying a small value, such as 1.0E-08 . The value is a double
        # that ranges from 0 to MAX_DOUBLE . The default is to not use L2 normalization. This parameter can't
        # be used when L1 is specified. Use this parameter sparingly.
        @[JSON::Field(key: "TrainingParameters")]
        getter training_parameters : Hash(String, String)?

        def initialize(
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @endpoint_info : Types::RealtimeEndpointInfo? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @last_updated_at : Time? = nil,
          @log_uri : String? = nil,
          @ml_model_id : String? = nil,
          @ml_model_type : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @recipe : String? = nil,
          @schema : String? = nil,
          @score_threshold : Float64? = nil,
          @score_threshold_last_updated_at : Time? = nil,
          @size_in_bytes : Int64? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @training_data_source_id : String? = nil,
          @training_parameters : Hash(String, String)? = nil
        )
        end
      end

      # A second request to use or change an object was not allowed. This can result from retrying a request
      # using a parameter that was not present in the original request.
      struct IdempotentParameterMismatchException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : Int32?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      # An error on the server occurred when trying to process a request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : Int32?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      # An error on the client occurred. Typically, the cause is an invalid input value.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : Int32?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      struct InvalidTagException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The subscriber exceeded the maximum number of operations. This exception can occur when listing
      # objects such as DataSource .
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : Int32?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      # Represents the output of a GetMLModel operation. The content consists of the detailed metadata and
      # the current status of the MLModel .
      struct MLModel
        include JSON::Serializable

        # The algorithm used to train the MLModel . The following algorithm is supported: SGD -- Stochastic
        # gradient descent. The goal of SGD is to minimize the gradient of the loss function.
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String?

        @[JSON::Field(key: "ComputeTime")]
        getter compute_time : Int64?

        # The time that the MLModel was created. The time is expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The AWS user account from which the MLModel was created. The account type can be either an AWS root
        # account or an AWS Identity and Access Management (IAM) user account.
        @[JSON::Field(key: "CreatedByIamUser")]
        getter created_by_iam_user : String?

        # The current endpoint of the MLModel .
        @[JSON::Field(key: "EndpointInfo")]
        getter endpoint_info : Types::RealtimeEndpointInfo?

        @[JSON::Field(key: "FinishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).
        @[JSON::Field(key: "InputDataLocationS3")]
        getter input_data_location_s3 : String?

        # The time of the most recent edit to the MLModel . The time is expressed in epoch time.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The ID assigned to the MLModel at creation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        # Identifies the MLModel category. The following are the available types: REGRESSION - Produces a
        # numeric result. For example, "What price should a house be listed at?" BINARY - Produces one of two
        # possible results. For example, "Is this a child-friendly web site?". MULTICLASS - Produces one of
        # several possible results. For example, "Is this a HIGH-, LOW-, or MEDIUM-risk trade?".
        @[JSON::Field(key: "MLModelType")]
        getter ml_model_type : String?

        # A description of the most recent details about accessing the MLModel .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A user-supplied name or description of the MLModel .
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "ScoreThreshold")]
        getter score_threshold : Float64?

        # The time of the most recent edit to the ScoreThreshold . The time is expressed in epoch time.
        @[JSON::Field(key: "ScoreThresholdLastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter score_threshold_last_updated_at : Time?

        @[JSON::Field(key: "SizeInBytes")]
        getter size_in_bytes : Int64?

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of an MLModel . This element can have one of the following values: PENDING -
        # Amazon Machine Learning (Amazon ML) submitted a request to create an MLModel . INPROGRESS - The
        # creation process is underway. FAILED - The request to create an MLModel didn't run to completion.
        # The model isn't usable. COMPLETED - The creation process completed successfully. DELETED - The
        # MLModel is marked as deleted. It isn't usable.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the training DataSource . The CreateMLModel operation uses the TrainingDataSourceId .
        @[JSON::Field(key: "TrainingDataSourceId")]
        getter training_data_source_id : String?

        # A list of the training parameters in the MLModel . The list is implemented as a map of key-value
        # pairs. The following is the current set of training parameters: sgd.maxMLModelSizeInBytes - The
        # maximum allowed size of the model. Depending on the input data, the size of the model might affect
        # its performance. The value is an integer that ranges from 100000 to 2147483648 . The default value
        # is 33554432 . sgd.maxPasses - The number of times that the training process traverses the
        # observations to build the MLModel . The value is an integer that ranges from 1 to 10000 . The
        # default value is 10 . sgd.shuffleType - Whether Amazon ML shuffles the training data. Shuffling the
        # data improves a model's ability to find the optimal solution for a variety of data types. The valid
        # values are auto and none . The default value is none . sgd.l1RegularizationAmount - The coefficient
        # regularization L1 norm, which controls overfitting the data by penalizing large coefficients. This
        # parameter tends to drive coefficients to zero, resulting in sparse feature set. If you use this
        # parameter, start by specifying a small value, such as 1.0E-08 . The value is a double that ranges
        # from 0 to MAX_DOUBLE . The default is to not use L1 normalization. This parameter can't be used when
        # L2 is specified. Use this parameter sparingly. sgd.l2RegularizationAmount - The coefficient
        # regularization L2 norm, which controls overfitting the data by penalizing large coefficients. This
        # tends to drive coefficients to small, nonzero values. If you use this parameter, start by specifying
        # a small value, such as 1.0E-08 . The value is a double that ranges from 0 to MAX_DOUBLE . The
        # default is to not use L2 normalization. This parameter can't be used when L1 is specified. Use this
        # parameter sparingly.
        @[JSON::Field(key: "TrainingParameters")]
        getter training_parameters : Hash(String, String)?

        def initialize(
          @algorithm : String? = nil,
          @compute_time : Int64? = nil,
          @created_at : Time? = nil,
          @created_by_iam_user : String? = nil,
          @endpoint_info : Types::RealtimeEndpointInfo? = nil,
          @finished_at : Time? = nil,
          @input_data_location_s3 : String? = nil,
          @last_updated_at : Time? = nil,
          @ml_model_id : String? = nil,
          @ml_model_type : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @score_threshold : Float64? = nil,
          @score_threshold_last_updated_at : Time? = nil,
          @size_in_bytes : Int64? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @training_data_source_id : String? = nil,
          @training_parameters : Hash(String, String)? = nil
        )
        end
      end

      # Measurements of how well the MLModel performed on known observations. One of the following metrics
      # is returned, based on the type of the MLModel : BinaryAUC: The binary MLModel uses the Area Under
      # the Curve (AUC) technique to measure performance. RegressionRMSE: The regression MLModel uses the
      # Root Mean Square Error (RMSE) technique to measure performance. RMSE measures the difference between
      # predicted and actual values for a single variable. MulticlassAvgFScore: The multiclass MLModel uses
      # the F1 score technique to measure performance. For more information about performance metrics,
      # please see the Amazon Machine Learning Developer Guide .
      struct PerformanceMetrics
        include JSON::Serializable

        @[JSON::Field(key: "Properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @properties : Hash(String, String)? = nil
        )
        end
      end

      struct PredictInput
        include JSON::Serializable

        # A unique identifier of the MLModel .
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        @[JSON::Field(key: "PredictEndpoint")]
        getter predict_endpoint : String

        @[JSON::Field(key: "Record")]
        getter record : Hash(String, String)

        def initialize(
          @ml_model_id : String,
          @predict_endpoint : String,
          @record : Hash(String, String)
        )
        end
      end

      struct PredictOutput
        include JSON::Serializable

        @[JSON::Field(key: "Prediction")]
        getter prediction : Types::Prediction?

        def initialize(
          @prediction : Types::Prediction? = nil
        )
        end
      end

      # The output from a Predict operation: Details - Contains the following attributes:
      # DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS
      # DetailsAttributes.ALGORITHM - SGD PredictedLabel - Present for either a BINARY or MULTICLASS MLModel
      # request. PredictedScores - Contains the raw classification score corresponding to each label.
      # PredictedValue - Present for a REGRESSION MLModel request.
      struct Prediction
        include JSON::Serializable

        @[JSON::Field(key: "details")]
        getter details : Hash(String, String)?

        # The prediction label for either a BINARY or MULTICLASS MLModel .
        @[JSON::Field(key: "predictedLabel")]
        getter predicted_label : String?

        @[JSON::Field(key: "predictedScores")]
        getter predicted_scores : Hash(String, Float64)?

        # The prediction value for REGRESSION MLModel .
        @[JSON::Field(key: "predictedValue")]
        getter predicted_value : Float64?

        def initialize(
          @details : Hash(String, String)? = nil,
          @predicted_label : String? = nil,
          @predicted_scores : Hash(String, Float64)? = nil,
          @predicted_value : Float64? = nil
        )
        end
      end

      # The exception is thrown when a predict request is made to an unmounted MLModel .
      struct PredictorNotMountedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The data specification of an Amazon Relational Database Service (Amazon RDS) DataSource .
      struct RDSDataSpec
        include JSON::Serializable

        # The AWS Identity and Access Management (IAM) credentials that are used connect to the Amazon RDS
        # database.
        @[JSON::Field(key: "DatabaseCredentials")]
        getter database_credentials : Types::RDSDatabaseCredentials

        # Describes the DatabaseName and InstanceIdentifier of an Amazon RDS database.
        @[JSON::Field(key: "DatabaseInformation")]
        getter database_information : Types::RDSDatabase

        # The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic Compute Cloud (Amazon EC2)
        # instance to carry out the copy operation from Amazon RDS to an Amazon S3 task. For more information,
        # see Role templates for data pipelines.
        @[JSON::Field(key: "ResourceRole")]
        getter resource_role : String

        # The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS using
        # SelectSqlQuery is stored in this location.
        @[JSON::Field(key: "S3StagingLocation")]
        getter s3_staging_location : String

        # The security group IDs to be used to access a VPC-based RDS DB instance. Ensure that there are
        # appropriate ingress rules set up to allow access to the RDS DB instance. This attribute is used by
        # Data Pipeline to carry out the copy operation from Amazon RDS to an Amazon S3 task.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The query that is used to retrieve the observation data for the DataSource .
        @[JSON::Field(key: "SelectSqlQuery")]
        getter select_sql_query : String

        # The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service to monitor the progress of
        # the copy task from Amazon RDS to Amazon S3. For more information, see Role templates for data
        # pipelines.
        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String

        # The subnet ID to be used to access a VPC-based RDS DB instance. This attribute is used by Data
        # Pipeline to carry out the copy task from Amazon RDS to Amazon S3.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # A JSON string that represents the splitting and rearrangement processing to be applied to a
        # DataSource . If the DataRearrangement parameter is not provided, all of the input data is used to
        # create the Datasource . There are multiple parameters that control what data is used to create a
        # datasource: percentBegin Use percentBegin to indicate the beginning of the range of the data used to
        # create the Datasource. If you do not include percentBegin and percentEnd , Amazon ML includes all of
        # the data when creating the datasource. percentEnd Use percentEnd to indicate the end of the range of
        # the data used to create the Datasource. If you do not include percentBegin and percentEnd , Amazon
        # ML includes all of the data when creating the datasource. complement The complement parameter
        # instructs Amazon ML to use the data that is not included in the range of percentBegin to percentEnd
        # to create a datasource. The complement parameter is useful if you need to create complementary
        # datasources for training and evaluation. To create a complementary datasource, use the same values
        # for percentBegin and percentEnd , along with the complement parameter. For example, the following
        # two datasources do not share any data, and can be used to train and evaluate a model. The first
        # datasource has 25 percent of the data, and the second one has 75 percent of the data. Datasource for
        # evaluation: {"splitting":{"percentBegin":0, "percentEnd":25}} Datasource for training:
        # {"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}} strategy To change how Amazon
        # ML splits the data for a datasource, use the strategy parameter. The default value for the strategy
        # parameter is sequential , meaning that Amazon ML takes all of the data records between the
        # percentBegin and percentEnd parameters for the datasource, in the order that the records appear in
        # the input data. The following two DataRearrangement lines are examples of sequentially ordered
        # training and evaluation datasources: Datasource for evaluation: {"splitting":{"percentBegin":70,
        # "percentEnd":100, "strategy":"sequential"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}} To
        # randomly split the input data into the proportions indicated by the percentBegin and percentEnd
        # parameters, set the strategy parameter to random and provide a string that is used as the seed value
        # for the random data splitting (for example, you can use the S3 path to your data as the random seed
        # string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random
        # number between 0 and 100, and then selects the rows that have an assigned number between
        # percentBegin and percentEnd . Pseudo-random numbers are assigned using both the input seed string
        # value and the byte offset as a seed, so changing the data results in a different split. Any existing
        # ordering is preserved. The random splitting strategy ensures that variables in the training and
        # evaluation data are distributed similarly. It is useful in the cases where the input data may have
        # an implicit sort order, which would otherwise result in training and evaluation datasources
        # containing non-similar data records. The following two DataRearrangement lines are examples of
        # non-sequentially ordered training and evaluation datasources: Datasource for evaluation:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}
        @[JSON::Field(key: "DataRearrangement")]
        getter data_rearrangement : String?

        # A JSON string that represents the schema for an Amazon RDS DataSource . The DataSchema defines the
        # structure of the observation data in the data file(s) referenced in the DataSource . A DataSchema is
        # not required if you specify a DataSchemaUri Define your DataSchema as a series of key-value pairs.
        # attributes and excludedVariableNames have an array of key-value pairs for their value. Use the
        # following format to define your DataSchema . { "version": "1.0", "recordAnnotationFieldName": "F1",
        # "recordWeightFieldName": "F2", "targetFieldName": "F3", "dataFormat": "CSV",
        # "dataFileContainsHeader": true, "attributes": [ { "fieldName": "F1", "fieldType": "TEXT" }, {
        # "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, {
        # "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, {
        # "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE"
        # }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ], "excludedVariableNames": [ "F6"
        # ] }
        @[JSON::Field(key: "DataSchema")]
        getter data_schema : String?

        # The Amazon S3 location of the DataSchema .
        @[JSON::Field(key: "DataSchemaUri")]
        getter data_schema_uri : String?

        def initialize(
          @database_credentials : Types::RDSDatabaseCredentials,
          @database_information : Types::RDSDatabase,
          @resource_role : String,
          @s3_staging_location : String,
          @security_group_ids : Array(String),
          @select_sql_query : String,
          @service_role : String,
          @subnet_id : String,
          @data_rearrangement : String? = nil,
          @data_schema : String? = nil,
          @data_schema_uri : String? = nil
        )
        end
      end

      # The database details of an Amazon RDS database.
      struct RDSDatabase
        include JSON::Serializable

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The ID of an RDS DB instance.
        @[JSON::Field(key: "InstanceIdentifier")]
        getter instance_identifier : String

        def initialize(
          @database_name : String,
          @instance_identifier : String
        )
        end
      end

      # The database credentials to connect to a database on an RDS DB instance.
      struct RDSDatabaseCredentials
        include JSON::Serializable

        @[JSON::Field(key: "Password")]
        getter password : String

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # The datasource details that are specific to Amazon RDS.
      struct RDSMetadata
        include JSON::Serializable

        # The ID of the Data Pipeline instance that is used to carry to copy data from Amazon RDS to Amazon
        # S3. You can use the ID to find details about the instance in the Data Pipeline console.
        @[JSON::Field(key: "DataPipelineId")]
        getter data_pipeline_id : String?

        # The database details required to connect to an Amazon RDS.
        @[JSON::Field(key: "Database")]
        getter database : Types::RDSDatabase?

        @[JSON::Field(key: "DatabaseUserName")]
        getter database_user_name : String?

        # The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2 instance to carry out the copy
        # task from Amazon RDS to Amazon S3. For more information, see Role templates for data pipelines.
        @[JSON::Field(key: "ResourceRole")]
        getter resource_role : String?

        # The SQL query that is supplied during CreateDataSourceFromRDS . Returns only if Verbose is true in
        # GetDataSourceInput .
        @[JSON::Field(key: "SelectSqlQuery")]
        getter select_sql_query : String?

        # The role (DataPipelineDefaultRole) assumed by the Data Pipeline service to monitor the progress of
        # the copy task from Amazon RDS to Amazon S3. For more information, see Role templates for data
        # pipelines.
        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        def initialize(
          @data_pipeline_id : String? = nil,
          @database : Types::RDSDatabase? = nil,
          @database_user_name : String? = nil,
          @resource_role : String? = nil,
          @select_sql_query : String? = nil,
          @service_role : String? = nil
        )
        end
      end

      # Describes the real-time endpoint information for an MLModel .
      struct RealtimeEndpointInfo
        include JSON::Serializable

        # The time that the request to create the real-time endpoint for the MLModel was received. The time is
        # expressed in epoch time.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The current status of the real-time endpoint for the MLModel . This element can have one of the
        # following values: NONE - Endpoint does not exist or was previously deleted. READY - Endpoint is
        # ready to be used for real-time predictions. UPDATING - Updating/creating the endpoint.
        @[JSON::Field(key: "EndpointStatus")]
        getter endpoint_status : String?

        # The URI that specifies where to send real-time prediction requests for the MLModel . Note: The
        # application must wait until the real-time endpoint is ready before using this URI.
        @[JSON::Field(key: "EndpointUrl")]
        getter endpoint_url : String?

        # The maximum processing rate for the real-time endpoint for MLModel , measured in incoming requests
        # per second.
        @[JSON::Field(key: "PeakRequestsPerSecond")]
        getter peak_requests_per_second : Int32?

        def initialize(
          @created_at : Time? = nil,
          @endpoint_status : String? = nil,
          @endpoint_url : String? = nil,
          @peak_requests_per_second : Int32? = nil
        )
        end
      end

      # Describes the data specification of an Amazon Redshift DataSource .
      struct RedshiftDataSpec
        include JSON::Serializable

        # Describes AWS Identity and Access Management (IAM) credentials that are used connect to the Amazon
        # Redshift database.
        @[JSON::Field(key: "DatabaseCredentials")]
        getter database_credentials : Types::RedshiftDatabaseCredentials

        # Describes the DatabaseName and ClusterIdentifier for an Amazon Redshift DataSource .
        @[JSON::Field(key: "DatabaseInformation")]
        getter database_information : Types::RedshiftDatabase

        # Describes an Amazon S3 location to store the result set of the SelectSqlQuery query.
        @[JSON::Field(key: "S3StagingLocation")]
        getter s3_staging_location : String

        # Describes the SQL Query to execute on an Amazon Redshift database for an Amazon Redshift DataSource
        # .
        @[JSON::Field(key: "SelectSqlQuery")]
        getter select_sql_query : String

        # A JSON string that represents the splitting and rearrangement processing to be applied to a
        # DataSource . If the DataRearrangement parameter is not provided, all of the input data is used to
        # create the Datasource . There are multiple parameters that control what data is used to create a
        # datasource: percentBegin Use percentBegin to indicate the beginning of the range of the data used to
        # create the Datasource. If you do not include percentBegin and percentEnd , Amazon ML includes all of
        # the data when creating the datasource. percentEnd Use percentEnd to indicate the end of the range of
        # the data used to create the Datasource. If you do not include percentBegin and percentEnd , Amazon
        # ML includes all of the data when creating the datasource. complement The complement parameter
        # instructs Amazon ML to use the data that is not included in the range of percentBegin to percentEnd
        # to create a datasource. The complement parameter is useful if you need to create complementary
        # datasources for training and evaluation. To create a complementary datasource, use the same values
        # for percentBegin and percentEnd , along with the complement parameter. For example, the following
        # two datasources do not share any data, and can be used to train and evaluate a model. The first
        # datasource has 25 percent of the data, and the second one has 75 percent of the data. Datasource for
        # evaluation: {"splitting":{"percentBegin":0, "percentEnd":25}} Datasource for training:
        # {"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}} strategy To change how Amazon
        # ML splits the data for a datasource, use the strategy parameter. The default value for the strategy
        # parameter is sequential , meaning that Amazon ML takes all of the data records between the
        # percentBegin and percentEnd parameters for the datasource, in the order that the records appear in
        # the input data. The following two DataRearrangement lines are examples of sequentially ordered
        # training and evaluation datasources: Datasource for evaluation: {"splitting":{"percentBegin":70,
        # "percentEnd":100, "strategy":"sequential"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}} To
        # randomly split the input data into the proportions indicated by the percentBegin and percentEnd
        # parameters, set the strategy parameter to random and provide a string that is used as the seed value
        # for the random data splitting (for example, you can use the S3 path to your data as the random seed
        # string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random
        # number between 0 and 100, and then selects the rows that have an assigned number between
        # percentBegin and percentEnd . Pseudo-random numbers are assigned using both the input seed string
        # value and the byte offset as a seed, so changing the data results in a different split. Any existing
        # ordering is preserved. The random splitting strategy ensures that variables in the training and
        # evaluation data are distributed similarly. It is useful in the cases where the input data may have
        # an implicit sort order, which would otherwise result in training and evaluation datasources
        # containing non-similar data records. The following two DataRearrangement lines are examples of
        # non-sequentially ordered training and evaluation datasources: Datasource for evaluation:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}
        @[JSON::Field(key: "DataRearrangement")]
        getter data_rearrangement : String?

        # A JSON string that represents the schema for an Amazon Redshift DataSource . The DataSchema defines
        # the structure of the observation data in the data file(s) referenced in the DataSource . A
        # DataSchema is not required if you specify a DataSchemaUri . Define your DataSchema as a series of
        # key-value pairs. attributes and excludedVariableNames have an array of key-value pairs for their
        # value. Use the following format to define your DataSchema . { "version": "1.0",
        # "recordAnnotationFieldName": "F1", "recordWeightFieldName": "F2", "targetFieldName": "F3",
        # "dataFormat": "CSV", "dataFileContainsHeader": true, "attributes": [ { "fieldName": "F1",
        # "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3",
        # "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5",
        # "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7",
        # "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE"
        # } ], "excludedVariableNames": [ "F6" ] }
        @[JSON::Field(key: "DataSchema")]
        getter data_schema : String?

        # Describes the schema location for an Amazon Redshift DataSource .
        @[JSON::Field(key: "DataSchemaUri")]
        getter data_schema_uri : String?

        def initialize(
          @database_credentials : Types::RedshiftDatabaseCredentials,
          @database_information : Types::RedshiftDatabase,
          @s3_staging_location : String,
          @select_sql_query : String,
          @data_rearrangement : String? = nil,
          @data_schema : String? = nil,
          @data_schema_uri : String? = nil
        )
        end
      end

      # Describes the database details required to connect to an Amazon Redshift database.
      struct RedshiftDatabase
        include JSON::Serializable

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        def initialize(
          @cluster_identifier : String,
          @database_name : String
        )
        end
      end

      # Describes the database credentials for connecting to a database on an Amazon Redshift cluster.
      struct RedshiftDatabaseCredentials
        include JSON::Serializable

        @[JSON::Field(key: "Password")]
        getter password : String

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # Describes the DataSource details specific to Amazon Redshift.
      struct RedshiftMetadata
        include JSON::Serializable

        @[JSON::Field(key: "DatabaseUserName")]
        getter database_user_name : String?

        @[JSON::Field(key: "RedshiftDatabase")]
        getter redshift_database : Types::RedshiftDatabase?

        # The SQL query that is specified during CreateDataSourceFromRedshift . Returns only if Verbose is
        # true in GetDataSourceInput.
        @[JSON::Field(key: "SelectSqlQuery")]
        getter select_sql_query : String?

        def initialize(
          @database_user_name : String? = nil,
          @redshift_database : Types::RedshiftDatabase? = nil,
          @select_sql_query : String? = nil
        )
        end
      end

      # A specified resource cannot be located.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : Int32?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes the data specification of a DataSource .
      struct S3DataSpec
        include JSON::Serializable

        # The location of the data file(s) used by a DataSource . The URI specifies a data file or an Amazon
        # Simple Storage Service (Amazon S3) directory or bucket containing data files.
        @[JSON::Field(key: "DataLocationS3")]
        getter data_location_s3 : String

        # A JSON string that represents the splitting and rearrangement processing to be applied to a
        # DataSource . If the DataRearrangement parameter is not provided, all of the input data is used to
        # create the Datasource . There are multiple parameters that control what data is used to create a
        # datasource: percentBegin Use percentBegin to indicate the beginning of the range of the data used to
        # create the Datasource. If you do not include percentBegin and percentEnd , Amazon ML includes all of
        # the data when creating the datasource. percentEnd Use percentEnd to indicate the end of the range of
        # the data used to create the Datasource. If you do not include percentBegin and percentEnd , Amazon
        # ML includes all of the data when creating the datasource. complement The complement parameter
        # instructs Amazon ML to use the data that is not included in the range of percentBegin to percentEnd
        # to create a datasource. The complement parameter is useful if you need to create complementary
        # datasources for training and evaluation. To create a complementary datasource, use the same values
        # for percentBegin and percentEnd , along with the complement parameter. For example, the following
        # two datasources do not share any data, and can be used to train and evaluate a model. The first
        # datasource has 25 percent of the data, and the second one has 75 percent of the data. Datasource for
        # evaluation: {"splitting":{"percentBegin":0, "percentEnd":25}} Datasource for training:
        # {"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}} strategy To change how Amazon
        # ML splits the data for a datasource, use the strategy parameter. The default value for the strategy
        # parameter is sequential , meaning that Amazon ML takes all of the data records between the
        # percentBegin and percentEnd parameters for the datasource, in the order that the records appear in
        # the input data. The following two DataRearrangement lines are examples of sequentially ordered
        # training and evaluation datasources: Datasource for evaluation: {"splitting":{"percentBegin":70,
        # "percentEnd":100, "strategy":"sequential"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}} To
        # randomly split the input data into the proportions indicated by the percentBegin and percentEnd
        # parameters, set the strategy parameter to random and provide a string that is used as the seed value
        # for the random data splitting (for example, you can use the S3 path to your data as the random seed
        # string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random
        # number between 0 and 100, and then selects the rows that have an assigned number between
        # percentBegin and percentEnd . Pseudo-random numbers are assigned using both the input seed string
        # value and the byte offset as a seed, so changing the data results in a different split. Any existing
        # ordering is preserved. The random splitting strategy ensures that variables in the training and
        # evaluation data are distributed similarly. It is useful in the cases where the input data may have
        # an implicit sort order, which would otherwise result in training and evaluation datasources
        # containing non-similar data records. The following two DataRearrangement lines are examples of
        # non-sequentially ordered training and evaluation datasources: Datasource for evaluation:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv"}} Datasource for training:
        # {"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random",
        # "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}
        @[JSON::Field(key: "DataRearrangement")]
        getter data_rearrangement : String?

        # A JSON string that represents the schema for an Amazon S3 DataSource . The DataSchema defines the
        # structure of the observation data in the data file(s) referenced in the DataSource . You must
        # provide either the DataSchema or the DataSchemaLocationS3 . Define your DataSchema as a series of
        # key-value pairs. attributes and excludedVariableNames have an array of key-value pairs for their
        # value. Use the following format to define your DataSchema . { "version": "1.0",
        # "recordAnnotationFieldName": "F1", "recordWeightFieldName": "F2", "targetFieldName": "F3",
        # "dataFormat": "CSV", "dataFileContainsHeader": true, "attributes": [ { "fieldName": "F1",
        # "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3",
        # "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5",
        # "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7",
        # "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE"
        # } ], "excludedVariableNames": [ "F6" ] }
        @[JSON::Field(key: "DataSchema")]
        getter data_schema : String?

        # Describes the schema location in Amazon S3. You must provide either the DataSchema or the
        # DataSchemaLocationS3 .
        @[JSON::Field(key: "DataSchemaLocationS3")]
        getter data_schema_location_s3 : String?

        def initialize(
          @data_location_s3 : String,
          @data_rearrangement : String? = nil,
          @data_schema : String? = nil,
          @data_schema_location_s3 : String? = nil
        )
        end
      end

      # A custom key-value pair associated with an ML object, such as an ML model.
      struct Tag
        include JSON::Serializable

        # A unique identifier for the tag. Valid characters include Unicode letters, digits, white space, _,
        # ., /, =, +, -, %, and @.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # An optional string, typically used to describe or define the tag. Valid characters include Unicode
        # letters, digits, white space, _, ., /, =, +, -, %, and @.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateBatchPredictionInput
        include JSON::Serializable

        # The ID assigned to the BatchPrediction during creation.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String

        # A new user-supplied name or description of the BatchPrediction .
        @[JSON::Field(key: "BatchPredictionName")]
        getter batch_prediction_name : String

        def initialize(
          @batch_prediction_id : String,
          @batch_prediction_name : String
        )
        end
      end

      # Represents the output of an UpdateBatchPrediction operation. You can see the updated content by
      # using the GetBatchPrediction operation.
      struct UpdateBatchPredictionOutput
        include JSON::Serializable

        # The ID assigned to the BatchPrediction during creation. This value should be identical to the value
        # of the BatchPredictionId in the request.
        @[JSON::Field(key: "BatchPredictionId")]
        getter batch_prediction_id : String?

        def initialize(
          @batch_prediction_id : String? = nil
        )
        end
      end

      struct UpdateDataSourceInput
        include JSON::Serializable

        # The ID assigned to the DataSource during creation.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # A new user-supplied name or description of the DataSource that will replace the current description.
        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String

        def initialize(
          @data_source_id : String,
          @data_source_name : String
        )
        end
      end

      # Represents the output of an UpdateDataSource operation. You can see the updated content by using the
      # GetBatchPrediction operation.
      struct UpdateDataSourceOutput
        include JSON::Serializable

        # The ID assigned to the DataSource during creation. This value should be identical to the value of
        # the DataSourceID in the request.
        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_id : String? = nil
        )
        end
      end

      struct UpdateEvaluationInput
        include JSON::Serializable

        # The ID assigned to the Evaluation during creation.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String

        # A new user-supplied name or description of the Evaluation that will replace the current content.
        @[JSON::Field(key: "EvaluationName")]
        getter evaluation_name : String

        def initialize(
          @evaluation_id : String,
          @evaluation_name : String
        )
        end
      end

      # Represents the output of an UpdateEvaluation operation. You can see the updated content by using the
      # GetEvaluation operation.
      struct UpdateEvaluationOutput
        include JSON::Serializable

        # The ID assigned to the Evaluation during creation. This value should be identical to the value of
        # the Evaluation in the request.
        @[JSON::Field(key: "EvaluationId")]
        getter evaluation_id : String?

        def initialize(
          @evaluation_id : String? = nil
        )
        end
      end

      struct UpdateMLModelInput
        include JSON::Serializable

        # The ID assigned to the MLModel during creation.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String

        # A user-supplied name or description of the MLModel .
        @[JSON::Field(key: "MLModelName")]
        getter ml_model_name : String?

        # The ScoreThreshold used in binary classification MLModel that marks the boundary between a positive
        # prediction and a negative prediction. Output values greater than or equal to the ScoreThreshold
        # receive a positive result from the MLModel , such as true . Output values less than the
        # ScoreThreshold receive a negative response from the MLModel , such as false .
        @[JSON::Field(key: "ScoreThreshold")]
        getter score_threshold : Float64?

        def initialize(
          @ml_model_id : String,
          @ml_model_name : String? = nil,
          @score_threshold : Float64? = nil
        )
        end
      end

      # Represents the output of an UpdateMLModel operation. You can see the updated content by using the
      # GetMLModel operation.
      struct UpdateMLModelOutput
        include JSON::Serializable

        # The ID assigned to the MLModel during creation. This value should be identical to the value of the
        # MLModelID in the request.
        @[JSON::Field(key: "MLModelId")]
        getter ml_model_id : String?

        def initialize(
          @ml_model_id : String? = nil
        )
        end
      end
    end
  end
end
