require "json"
require "time"

module Aws
  module Neptunedata
    module Types

      # Raised in case of an authentication or authorization failure.

      struct AccessDeniedException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a request is submitted that cannot be processed.

      struct BadRequestException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the bad request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a specified bulk-load job ID cannot be found.

      struct BulkLoadIdNotFoundException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The bulk-load job ID that could not be found.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end


      struct CancelGremlinQueryInput
        include JSON::Serializable

        # The unique identifier that identifies the query to be canceled.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct CancelGremlinQueryOutput
        include JSON::Serializable

        # The status of the cancelation

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct CancelLoaderJobInput
        include JSON::Serializable

        # The ID of the load job to be deleted.

        @[JSON::Field(key: "loadId")]
        getter load_id : String

        def initialize(
          @load_id : String
        )
        end
      end


      struct CancelLoaderJobOutput
        include JSON::Serializable

        # The cancellation status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct CancelMLDataProcessingJobInput
        include JSON::Serializable

        # The unique identifier of the data-processing job.

        @[JSON::Field(key: "id")]
        getter id : String

        # If set to TRUE , this flag specifies that all Neptune ML S3 artifacts should be deleted when the job
        # is stopped. The default is FALSE .

        @[JSON::Field(key: "clean")]
        getter clean : Bool?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @clean : Bool? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct CancelMLDataProcessingJobOutput
        include JSON::Serializable

        # The status of the cancellation request.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct CancelMLModelTrainingJobInput
        include JSON::Serializable

        # The unique identifier of the model-training job to be canceled.

        @[JSON::Field(key: "id")]
        getter id : String

        # If set to TRUE , this flag specifies that all Amazon S3 artifacts should be deleted when the job is
        # stopped. The default is FALSE .

        @[JSON::Field(key: "clean")]
        getter clean : Bool?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @clean : Bool? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct CancelMLModelTrainingJobOutput
        include JSON::Serializable

        # The status of the cancellation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct CancelMLModelTransformJobInput
        include JSON::Serializable

        # The unique ID of the model transform job to be canceled.

        @[JSON::Field(key: "id")]
        getter id : String

        # If this flag is set to TRUE , all Neptune ML S3 artifacts should be deleted when the job is stopped.
        # The default is FALSE .

        @[JSON::Field(key: "clean")]
        getter clean : Bool?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @clean : Bool? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct CancelMLModelTransformJobOutput
        include JSON::Serializable

        # the status of the cancelation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct CancelOpenCypherQueryInput
        include JSON::Serializable

        # The unique ID of the openCypher query to cancel.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # If set to TRUE , causes the cancelation of the openCypher query to happen silently.

        @[JSON::Field(key: "silent")]
        getter silent : Bool?

        def initialize(
          @query_id : String,
          @silent : Bool? = nil
        )
        end
      end


      struct CancelOpenCypherQueryOutput
        include JSON::Serializable

        # The cancelation payload for the openCypher query.

        @[JSON::Field(key: "payload")]
        getter payload : Bool?

        # The cancellation status of the openCypher query.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @payload : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # Raised when a user cancelled a request.

      struct CancelledByUserException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a request timed out in the client.

      struct ClientTimeoutException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a request attempts to modify data that is concurrently being modified by another
      # process.

      struct ConcurrentModificationException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a value in a request field did not satisfy required constraints.

      struct ConstraintViolationException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end


      struct CreateMLEndpointInput
        include JSON::Serializable

        # A unique identifier for the new inference endpoint. The default is an autogenerated timestamped
        # name.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The minimum number of Amazon EC2 instances to deploy to an endpoint for prediction. The default is 1

        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        # The type of Neptune ML instance to use for online servicing. The default is ml.m5.xlarge . Choosing
        # the ML instance for an inference endpoint depends on the task type, the graph size, and your budget.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The job Id of the completed model-training job that has created the model that the inference
        # endpoint will point to. You must supply either the mlModelTrainingJobId or the mlModelTransformJobId
        # .

        @[JSON::Field(key: "mlModelTrainingJobId")]
        getter ml_model_training_job_id : String?

        # The job Id of the completed model-transform job. You must supply either the mlModelTrainingJobId or
        # the mlModelTransformJobId .

        @[JSON::Field(key: "mlModelTransformJobId")]
        getter ml_model_transform_job_id : String?

        # Model type for training. By default the Neptune ML model is automatically based on the modelType
        # used in data processing, but you can specify a different model type here. The default is rgcn for
        # heterogeneous graphs and kge for knowledge graphs. The only valid value for heterogeneous graphs is
        # rgcn . Valid values for knowledge graphs are: kge , transe , distmult , and rotate .

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        # The ARN of an IAM role providing Neptune access to SageMaker and Amazon S3 resources. This must be
        # listed in your DB cluster parameter group or an error will be thrown.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        # If set to true , update indicates that this is an update request. The default is false . You must
        # supply either the mlModelTrainingJobId or the mlModelTransformJobId .

        @[JSON::Field(key: "update")]
        getter update : Bool?

        # The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to encrypt data on the
        # storage volume attached to the ML compute instances that run the training job. The default is None.

        @[JSON::Field(key: "volumeEncryptionKMSKey")]
        getter volume_encryption_kms_key : String?

        def initialize(
          @id : String? = nil,
          @instance_count : Int32? = nil,
          @instance_type : String? = nil,
          @ml_model_training_job_id : String? = nil,
          @ml_model_transform_job_id : String? = nil,
          @model_name : String? = nil,
          @neptune_iam_role_arn : String? = nil,
          @update : Bool? = nil,
          @volume_encryption_kms_key : String? = nil
        )
        end
      end


      struct CreateMLEndpointOutput
        include JSON::Serializable

        # The ARN for the new inference endpoint.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The endpoint creation time, in milliseconds.

        @[JSON::Field(key: "creationTimeInMillis")]
        getter creation_time_in_millis : Int64?

        # The unique ID of the new inference endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time_in_millis : Int64? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains custom model training parameters. See Custom models in Neptune ML .

      struct CustomModelTrainingParameters
        include JSON::Serializable

        # The path to the Amazon S3 location where the Python module implementing your model is located. This
        # must point to a valid existing Amazon S3 location that contains, at a minimum, a training script, a
        # transform script, and a model-hpo-configuration.json file.

        @[JSON::Field(key: "sourceS3DirectoryPath")]
        getter source_s3_directory_path : String

        # The name of the entry point in your module of a script that performs model training and takes
        # hyperparameters as command-line arguments, including fixed hyperparameters. The default is
        # training.py .

        @[JSON::Field(key: "trainingEntryPointScript")]
        getter training_entry_point_script : String?

        # The name of the entry point in your module of a script that should be run after the best model from
        # the hyperparameter search has been identified, to compute the model artifacts necessary for model
        # deployment. It should be able to run with no command-line arguments.The default is transform.py .

        @[JSON::Field(key: "transformEntryPointScript")]
        getter transform_entry_point_script : String?

        def initialize(
          @source_s3_directory_path : String,
          @training_entry_point_script : String? = nil,
          @transform_entry_point_script : String? = nil
        )
        end
      end

      # Contains custom model transform parameters. See Use a trained model to generate new model artifacts
      # .

      struct CustomModelTransformParameters
        include JSON::Serializable

        # The path to the Amazon S3 location where the Python module implementing your model is located. This
        # must point to a valid existing Amazon S3 location that contains, at a minimum, a training script, a
        # transform script, and a model-hpo-configuration.json file.

        @[JSON::Field(key: "sourceS3DirectoryPath")]
        getter source_s3_directory_path : String

        # The name of the entry point in your module of a script that should be run after the best model from
        # the hyperparameter search has been identified, to compute the model artifacts necessary for model
        # deployment. It should be able to run with no command-line arguments. The default is transform.py .

        @[JSON::Field(key: "transformEntryPointScript")]
        getter transform_entry_point_script : String?

        def initialize(
          @source_s3_directory_path : String,
          @transform_entry_point_script : String? = nil
        )
        end
      end


      struct DeleteMLEndpointInput
        include JSON::Serializable

        # The unique identifier of the inference endpoint.

        @[JSON::Field(key: "id")]
        getter id : String

        # If this flag is set to TRUE , all Neptune ML S3 artifacts should be deleted when the job is stopped.
        # The default is FALSE .

        @[JSON::Field(key: "clean")]
        getter clean : Bool?

        # The ARN of an IAM role providing Neptune access to SageMaker and Amazon S3 resources. This must be
        # listed in your DB cluster parameter group or an error will be thrown.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @clean : Bool? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct DeleteMLEndpointOutput
        include JSON::Serializable

        # The status of the cancellation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct DeletePropertygraphStatisticsOutput
        include JSON::Serializable

        # The deletion payload.

        @[JSON::Field(key: "payload")]
        getter payload : Types::DeleteStatisticsValueMap?

        # The cancel status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The HTTP response code: 200 if the delete was successful, or 204 if there were no statistics to
        # delete.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @payload : Types::DeleteStatisticsValueMap? = nil,
          @status : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct DeleteSparqlStatisticsOutput
        include JSON::Serializable

        # The deletion payload.

        @[JSON::Field(key: "payload")]
        getter payload : Types::DeleteStatisticsValueMap?

        # The cancel status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The HTTP response code: 200 if the delete was successful, or 204 if there were no statistics to
        # delete.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @payload : Types::DeleteStatisticsValueMap? = nil,
          @status : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # The payload for DeleteStatistics.

      struct DeleteStatisticsValueMap
        include JSON::Serializable

        # The current status of the statistics.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # The ID of the statistics generation run that is currently occurring.

        @[JSON::Field(key: "statisticsId")]
        getter statistics_id : String?

        def initialize(
          @active : Bool? = nil,
          @statistics_id : String? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # An edge structure.

      struct EdgeStructure
        include JSON::Serializable

        # The number of edges that have this specific structure.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # A list of edge properties present in this specific structure.

        @[JSON::Field(key: "edgeProperties")]
        getter edge_properties : Array(String)?

        def initialize(
          @count : Int64? = nil,
          @edge_properties : Array(String)? = nil
        )
        end
      end


      struct ExecuteFastResetInput
        include JSON::Serializable

        # The fast reset action. One of the following values: initiateDatabaseReset – This action generates a
        # unique token needed to actually perform the fast reset. performDatabaseReset – This action uses the
        # token generated by the initiateDatabaseReset action to actually perform the fast reset.

        @[JSON::Field(key: "action")]
        getter action : String

        # The fast-reset token to initiate the reset.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @action : String,
          @token : String? = nil
        )
        end
      end


      struct ExecuteFastResetOutput
        include JSON::Serializable

        # The status is only returned for the performDatabaseReset action, and indicates whether or not the
        # fast reset rquest is accepted.

        @[JSON::Field(key: "status")]
        getter status : String

        # The payload is only returned by the initiateDatabaseReset action, and contains the unique token to
        # use with the performDatabaseReset action to make the reset occur.

        @[JSON::Field(key: "payload")]
        getter payload : Types::FastResetToken?

        def initialize(
          @status : String,
          @payload : Types::FastResetToken? = nil
        )
        end
      end


      struct ExecuteGremlinExplainQueryInput
        include JSON::Serializable

        # The Gremlin explain query string.

        @[JSON::Field(key: "gremlin")]
        getter gremlin_query : String

        def initialize(
          @gremlin_query : String
        )
        end
      end


      struct ExecuteGremlinExplainQueryOutput
        include JSON::Serializable

        # A text blob containing the Gremlin explain result, as described in Tuning Gremlin queries .

        @[JSON::Field(key: "output")]
        getter output : Bytes?

        def initialize(
          @output : Bytes? = nil
        )
        end
      end


      struct ExecuteGremlinProfileQueryInput
        include JSON::Serializable

        # The Gremlin query string to profile.

        @[JSON::Field(key: "gremlin")]
        getter gremlin_query : String

        # If non-zero, causes the results string to be truncated at that number of characters. If set to zero,
        # the string contains all the results.

        @[JSON::Field(key: "profile.chop")]
        getter chop : Int32?

        # If this flag is set to TRUE , the results include a detailed report of all index operations that
        # took place during query execution and serialization.

        @[JSON::Field(key: "profile.indexOps")]
        getter index_ops : Bool?

        # If this flag is set to TRUE , the query results are gathered and displayed as part of the profile
        # report. If FALSE , only the result count is displayed.

        @[JSON::Field(key: "profile.results")]
        getter results : Bool?

        # If non-null, the gathered results are returned in a serialized response message in the format
        # specified by this parameter. See Gremlin profile API in Neptune for more information.

        @[JSON::Field(key: "profile.serializer")]
        getter serializer : String?

        def initialize(
          @gremlin_query : String,
          @chop : Int32? = nil,
          @index_ops : Bool? = nil,
          @results : Bool? = nil,
          @serializer : String? = nil
        )
        end
      end


      struct ExecuteGremlinProfileQueryOutput
        include JSON::Serializable

        # A text blob containing the Gremlin Profile result. See Gremlin profile API in Neptune for details.

        @[JSON::Field(key: "output")]
        getter output : Bytes?

        def initialize(
          @output : Bytes? = nil
        )
        end
      end


      struct ExecuteGremlinQueryInput
        include JSON::Serializable

        # Using this API, you can run Gremlin queries in string format much as you can using the HTTP
        # endpoint. The interface is compatible with whatever Gremlin version your DB cluster is using (see
        # the Tinkerpop client section to determine which Gremlin releases your engine version supports).

        @[JSON::Field(key: "gremlin")]
        getter gremlin_query : String

        # If non-null, the query results are returned in a serialized response message in the format specified
        # by this parameter. See the GraphSON section in the TinkerPop documentation for a list of the formats
        # that are currently supported.

        @[JSON::Field(key: "accept")]
        getter serializer : String?

        def initialize(
          @gremlin_query : String,
          @serializer : String? = nil
        )
        end
      end


      struct ExecuteGremlinQueryOutput
        include JSON::Serializable

        # Metadata about the Gremlin query.

        @[JSON::Field(key: "meta")]
        getter meta : Types::Document?

        # The unique identifier of the Gremlin query.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The Gremlin query output from the server.

        @[JSON::Field(key: "result")]
        getter result : Types::Document?

        # The status of the Gremlin query.

        @[JSON::Field(key: "status")]
        getter status : Types::GremlinQueryStatusAttributes?

        def initialize(
          @meta : Types::Document? = nil,
          @request_id : String? = nil,
          @result : Types::Document? = nil,
          @status : Types::GremlinQueryStatusAttributes? = nil
        )
        end
      end


      struct ExecuteOpenCypherExplainQueryInput
        include JSON::Serializable

        # The openCypher explain mode. Can be one of: static , dynamic , or details .

        @[JSON::Field(key: "explain")]
        getter explain_mode : String

        # The openCypher query string.

        @[JSON::Field(key: "query")]
        getter open_cypher_query : String

        # The openCypher query parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : String?

        def initialize(
          @explain_mode : String,
          @open_cypher_query : String,
          @parameters : String? = nil
        )
        end
      end


      struct ExecuteOpenCypherExplainQueryOutput
        include JSON::Serializable

        # A text blob containing the openCypher explain results.

        @[JSON::Field(key: "results")]
        getter results : Bytes

        def initialize(
          @results : Bytes
        )
        end
      end


      struct ExecuteOpenCypherQueryInput
        include JSON::Serializable

        # The openCypher query string to be executed.

        @[JSON::Field(key: "query")]
        getter open_cypher_query : String

        # The openCypher query parameters for query execution. See Examples of openCypher parameterized
        # queries for more information.

        @[JSON::Field(key: "parameters")]
        getter parameters : String?

        def initialize(
          @open_cypher_query : String,
          @parameters : String? = nil
        )
        end
      end


      struct ExecuteOpenCypherQueryOutput
        include JSON::Serializable

        # The openCypherquery results.

        @[JSON::Field(key: "results")]
        getter results : Types::Document

        def initialize(
          @results : Types::Document
        )
        end
      end

      # Raised when a request attempts to access an stream that has expired.

      struct ExpiredStreamException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a request fails.

      struct FailureByQueryException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # A structure containing the fast reset token used to initiate a fast reset.

      struct FastResetToken
        include JSON::Serializable

        # A UUID generated by the database in the initiateDatabaseReset action, and then consumed by the
        # performDatabaseReset to reset the database.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @token : String? = nil
        )
        end
      end


      struct GetEngineStatusOutput
        include JSON::Serializable

        # Set to the Neptune engine version running on your DB cluster. If this engine version has been
        # manually patched since it was released, the version number is prefixed by Patch- .

        @[JSON::Field(key: "dbEngineVersion")]
        getter db_engine_version : String?

        # Set to enabled if the DFE engine is fully enabled, or to viaQueryHint (the default) if the DFE
        # engine is only used with queries that have the useDFE query hint set to true .

        @[JSON::Field(key: "dfeQueryEngine")]
        getter dfe_query_engine : String?

        # Contains status information about the features enabled on your DB cluster.

        @[JSON::Field(key: "features")]
        getter features : Hash(String, Types::Document)?

        # Contains information about the Gremlin query language available on your cluster. Specifically, it
        # contains a version field that specifies the current TinkerPop version being used by the engine.

        @[JSON::Field(key: "gremlin")]
        getter gremlin : Types::QueryLanguageVersion?

        # Contains Lab Mode settings being used by the engine.

        @[JSON::Field(key: "labMode")]
        getter lab_mode : Hash(String, String)?

        # Contains information about the openCypher query language available on your cluster. Specifically, it
        # contains a version field that specifies the current operCypher version being used by the engine.

        @[JSON::Field(key: "opencypher")]
        getter opencypher : Types::QueryLanguageVersion?

        # Set to reader if the instance is a read-replica, or to writer if the instance is the primary
        # instance.

        @[JSON::Field(key: "role")]
        getter role : String?

        # If there are transactions being rolled back, this field is set to the number of such transactions.
        # If there are none, the field doesn't appear at all.

        @[JSON::Field(key: "rollingBackTrxCount")]
        getter rolling_back_trx_count : Int32?

        # Set to the start time of the earliest transaction being rolled back. If no transactions are being
        # rolled back, the field doesn't appear at all.

        @[JSON::Field(key: "rollingBackTrxEarliestStartTime")]
        getter rolling_back_trx_earliest_start_time : String?

        # Contains information about the current settings on your DB cluster. For example, contains the
        # current cluster query timeout setting ( clusterQueryTimeoutInMs ).

        @[JSON::Field(key: "settings")]
        getter settings : Hash(String, String)?

        # Contains information about the SPARQL query language available on your cluster. Specifically, it
        # contains a version field that specifies the current SPARQL version being used by the engine.

        @[JSON::Field(key: "sparql")]
        getter sparql : Types::QueryLanguageVersion?

        # Set to the UTC time at which the current server process started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # Set to healthy if the instance is not experiencing problems. If the instance is recovering from a
        # crash or from being rebooted and there are active transactions running from the latest server
        # shutdown, status is set to recovery .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @db_engine_version : String? = nil,
          @dfe_query_engine : String? = nil,
          @features : Hash(String, Types::Document)? = nil,
          @gremlin : Types::QueryLanguageVersion? = nil,
          @lab_mode : Hash(String, String)? = nil,
          @opencypher : Types::QueryLanguageVersion? = nil,
          @role : String? = nil,
          @rolling_back_trx_count : Int32? = nil,
          @rolling_back_trx_earliest_start_time : String? = nil,
          @settings : Hash(String, String)? = nil,
          @sparql : Types::QueryLanguageVersion? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetGremlinQueryStatusInput
        include JSON::Serializable

        # The unique identifier that identifies the Gremlin query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct GetGremlinQueryStatusOutput
        include JSON::Serializable

        # The evaluation status of the Gremlin query.

        @[JSON::Field(key: "queryEvalStats")]
        getter query_eval_stats : Types::QueryEvalStats?

        # The ID of the query for which status is being returned.

        @[JSON::Field(key: "queryId")]
        getter query_id : String?

        # The Gremlin query string.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @query_eval_stats : Types::QueryEvalStats? = nil,
          @query_id : String? = nil,
          @query_string : String? = nil
        )
        end
      end


      struct GetLoaderJobStatusInput
        include JSON::Serializable

        # The load ID of the load job to get the status of.

        @[JSON::Field(key: "loadId")]
        getter load_id : String

        # Flag indicating whether or not to include details beyond the overall status ( TRUE or FALSE ; the
        # default is FALSE ).

        @[JSON::Field(key: "details")]
        getter details : Bool?

        # Flag indicating whether or not to include a list of errors encountered ( TRUE or FALSE ; the default
        # is FALSE ). The list of errors is paged. The page and errorsPerPage parameters allow you to page
        # through all the errors.

        @[JSON::Field(key: "errors")]
        getter errors : Bool?

        # The number of errors returned in each page (a positive integer; the default is 10 ). Only valid when
        # the errors parameter set to TRUE .

        @[JSON::Field(key: "errorsPerPage")]
        getter errors_per_page : Int32?

        # The error page number (a positive integer; the default is 1 ). Only valid when the errors parameter
        # is set to TRUE .

        @[JSON::Field(key: "page")]
        getter page : Int32?

        def initialize(
          @load_id : String,
          @details : Bool? = nil,
          @errors : Bool? = nil,
          @errors_per_page : Int32? = nil,
          @page : Int32? = nil
        )
        end
      end


      struct GetLoaderJobStatusOutput
        include JSON::Serializable

        # Status information about the load job, in a layout that could look like this:

        @[JSON::Field(key: "payload")]
        getter payload : Types::Document

        # The HTTP response code for the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @payload : Types::Document,
          @status : String
        )
        end
      end


      struct GetMLDataProcessingJobInput
        include JSON::Serializable

        # The unique identifier of the data-processing job to be retrieved.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct GetMLDataProcessingJobOutput
        include JSON::Serializable

        # The unique identifier of this data-processing job.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Definition of the data processing job.

        @[JSON::Field(key: "processingJob")]
        getter processing_job : Types::MlResourceDefinition?

        # Status of the data processing job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @processing_job : Types::MlResourceDefinition? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMLEndpointInput
        include JSON::Serializable

        # The unique identifier of the inference endpoint.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct GetMLEndpointOutput
        include JSON::Serializable

        # The endpoint definition.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::MlResourceDefinition?

        # The endpoint configuration

        @[JSON::Field(key: "endpointConfig")]
        getter endpoint_config : Types::MlConfigDefinition?

        # The unique identifier of the inference endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the inference endpoint.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @endpoint : Types::MlResourceDefinition? = nil,
          @endpoint_config : Types::MlConfigDefinition? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMLModelTrainingJobInput
        include JSON::Serializable

        # The unique identifier of the model-training job to retrieve.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct GetMLModelTrainingJobOutput
        include JSON::Serializable

        # The HPO job.

        @[JSON::Field(key: "hpoJob")]
        getter hpo_job : Types::MlResourceDefinition?

        # The unique identifier of this model-training job.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A list of the configurations of the ML models being used.

        @[JSON::Field(key: "mlModels")]
        getter ml_models : Array(Types::MlConfigDefinition)?

        # The model transform job.

        @[JSON::Field(key: "modelTransformJob")]
        getter model_transform_job : Types::MlResourceDefinition?

        # The data processing job.

        @[JSON::Field(key: "processingJob")]
        getter processing_job : Types::MlResourceDefinition?

        # The status of the model training job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @hpo_job : Types::MlResourceDefinition? = nil,
          @id : String? = nil,
          @ml_models : Array(Types::MlConfigDefinition)? = nil,
          @model_transform_job : Types::MlResourceDefinition? = nil,
          @processing_job : Types::MlResourceDefinition? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMLModelTransformJobInput
        include JSON::Serializable

        # The unique identifier of the model-transform job to be reetrieved.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @id : String,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct GetMLModelTransformJobOutput
        include JSON::Serializable

        # The base data processing job.

        @[JSON::Field(key: "baseProcessingJob")]
        getter base_processing_job : Types::MlResourceDefinition?

        # The unique identifier of the model-transform job to be retrieved.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A list of the configuration information for the models being used.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::MlConfigDefinition)?

        # The remote model transform job.

        @[JSON::Field(key: "remoteModelTransformJob")]
        getter remote_model_transform_job : Types::MlResourceDefinition?

        # The status of the model-transform job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @base_processing_job : Types::MlResourceDefinition? = nil,
          @id : String? = nil,
          @models : Array(Types::MlConfigDefinition)? = nil,
          @remote_model_transform_job : Types::MlResourceDefinition? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetOpenCypherQueryStatusInput
        include JSON::Serializable

        # The unique ID of the openCypher query for which to retrieve the query status.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct GetOpenCypherQueryStatusOutput
        include JSON::Serializable

        # The openCypher query evaluation status.

        @[JSON::Field(key: "queryEvalStats")]
        getter query_eval_stats : Types::QueryEvalStats?

        # The unique ID of the query for which status is being returned.

        @[JSON::Field(key: "queryId")]
        getter query_id : String?

        # The openCypher query string.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @query_eval_stats : Types::QueryEvalStats? = nil,
          @query_id : String? = nil,
          @query_string : String? = nil
        )
        end
      end


      struct GetPropertygraphStatisticsOutput
        include JSON::Serializable

        # Statistics for property-graph data.

        @[JSON::Field(key: "payload")]
        getter payload : Types::Statistics

        # The HTTP return code of the request. If the request succeeded, the code is 200. See Common error
        # codes for DFE statistics request for a list of common errors.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @payload : Types::Statistics,
          @status : String
        )
        end
      end


      struct GetPropertygraphStreamInput
        include JSON::Serializable

        # The commit number of the starting record to read from the change-log stream. This parameter is
        # required when iteratorType is AT_SEQUENCE_NUMBER or AFTER_SEQUENCE_NUMBER , and ignored when
        # iteratorType is TRIM_HORIZON or LATEST .

        @[JSON::Field(key: "commitNum")]
        getter commit_num : Int64?

        # If set to TRUE, Neptune compresses the response using gzip encoding.

        @[JSON::Field(key: "Accept-Encoding")]
        getter encoding : String?

        # Can be one of: AT_SEQUENCE_NUMBER – Indicates that reading should start from the event sequence
        # number specified jointly by the commitNum and opNum parameters. AFTER_SEQUENCE_NUMBER – Indicates
        # that reading should start right after the event sequence number specified jointly by the commitNum
        # and opNum parameters. TRIM_HORIZON – Indicates that reading should start at the last untrimmed
        # record in the system, which is the oldest unexpired (not yet deleted) record in the change-log
        # stream. LATEST – Indicates that reading should start at the most recent record in the system, which
        # is the latest unexpired (not yet deleted) record in the change-log stream.

        @[JSON::Field(key: "iteratorType")]
        getter iterator_type : String?

        # Specifies the maximum number of records to return. There is also a size limit of 10 MB on the
        # response that can't be modified and that takes precedence over the number of records specified in
        # the limit parameter. The response does include a threshold-breaching record if the 10 MB limit was
        # reached. The range for limit is 1 to 100,000, with a default of 10.

        @[JSON::Field(key: "limit")]
        getter limit : Int64?

        # The operation sequence number within the specified commit to start reading from in the change-log
        # stream data. The default is 1 .

        @[JSON::Field(key: "opNum")]
        getter op_num : Int64?

        def initialize(
          @commit_num : Int64? = nil,
          @encoding : String? = nil,
          @iterator_type : String? = nil,
          @limit : Int64? = nil,
          @op_num : Int64? = nil
        )
        end
      end


      struct GetPropertygraphStreamOutput
        include JSON::Serializable

        # Serialization format for the change records being returned. Currently, the only supported value is
        # PG_JSON .

        @[JSON::Field(key: "format")]
        getter format : String

        # Sequence identifier of the last change in the stream response. An event ID is composed of two
        # fields: a commitNum , which identifies a transaction that changed the graph, and an opNum , which
        # identifies a specific operation within that transaction:

        @[JSON::Field(key: "lastEventId")]
        getter last_event_id : Hash(String, String)

        # The time at which the commit for the transaction was requested, in milliseconds from the Unix epoch.

        @[JSON::Field(key: "lastTrxTimestamp")]
        getter last_trx_timestamp_in_millis : Int64

        # An array of serialized change-log stream records included in the response.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::PropertygraphRecord)

        # The total number of records in the response.

        @[JSON::Field(key: "totalRecords")]
        getter total_records : Int32

        def initialize(
          @format : String,
          @last_event_id : Hash(String, String),
          @last_trx_timestamp_in_millis : Int64,
          @records : Array(Types::PropertygraphRecord),
          @total_records : Int32
        )
        end
      end


      struct GetPropertygraphSummaryInput
        include JSON::Serializable

        # Mode can take one of two values: BASIC (the default), and DETAILED .

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end


      struct GetPropertygraphSummaryOutput
        include JSON::Serializable

        # Payload containing the property graph summary response.

        @[JSON::Field(key: "payload")]
        getter payload : Types::PropertygraphSummaryValueMap?

        # The HTTP return code of the request. If the request succeeded, the code is 200.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @payload : Types::PropertygraphSummaryValueMap? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct GetRDFGraphSummaryInput
        include JSON::Serializable

        # Mode can take one of two values: BASIC (the default), and DETAILED .

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end


      struct GetRDFGraphSummaryOutput
        include JSON::Serializable

        # Payload for an RDF graph summary response

        @[JSON::Field(key: "payload")]
        getter payload : Types::RDFGraphSummaryValueMap?

        # The HTTP return code of the request. If the request succeeded, the code is 200.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @payload : Types::RDFGraphSummaryValueMap? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct GetSparqlStatisticsOutput
        include JSON::Serializable

        # Statistics for RDF data.

        @[JSON::Field(key: "payload")]
        getter payload : Types::Statistics

        # The HTTP return code of the request. If the request succeeded, the code is 200. See Common error
        # codes for DFE statistics request for a list of common errors. When invoking this operation in a
        # Neptune cluster that has IAM authentication enabled, the IAM user or role making the request must
        # have a policy attached that allows the neptune-db:GetStatisticsStatus IAM action in that cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @payload : Types::Statistics,
          @status : String
        )
        end
      end


      struct GetSparqlStreamInput
        include JSON::Serializable

        # The commit number of the starting record to read from the change-log stream. This parameter is
        # required when iteratorType is AT_SEQUENCE_NUMBER or AFTER_SEQUENCE_NUMBER , and ignored when
        # iteratorType is TRIM_HORIZON or LATEST .

        @[JSON::Field(key: "commitNum")]
        getter commit_num : Int64?

        # If set to TRUE, Neptune compresses the response using gzip encoding.

        @[JSON::Field(key: "Accept-Encoding")]
        getter encoding : String?

        # Can be one of: AT_SEQUENCE_NUMBER – Indicates that reading should start from the event sequence
        # number specified jointly by the commitNum and opNum parameters. AFTER_SEQUENCE_NUMBER – Indicates
        # that reading should start right after the event sequence number specified jointly by the commitNum
        # and opNum parameters. TRIM_HORIZON – Indicates that reading should start at the last untrimmed
        # record in the system, which is the oldest unexpired (not yet deleted) record in the change-log
        # stream. LATEST – Indicates that reading should start at the most recent record in the system, which
        # is the latest unexpired (not yet deleted) record in the change-log stream.

        @[JSON::Field(key: "iteratorType")]
        getter iterator_type : String?

        # Specifies the maximum number of records to return. There is also a size limit of 10 MB on the
        # response that can't be modified and that takes precedence over the number of records specified in
        # the limit parameter. The response does include a threshold-breaching record if the 10 MB limit was
        # reached. The range for limit is 1 to 100,000, with a default of 10.

        @[JSON::Field(key: "limit")]
        getter limit : Int64?

        # The operation sequence number within the specified commit to start reading from in the change-log
        # stream data. The default is 1 .

        @[JSON::Field(key: "opNum")]
        getter op_num : Int64?

        def initialize(
          @commit_num : Int64? = nil,
          @encoding : String? = nil,
          @iterator_type : String? = nil,
          @limit : Int64? = nil,
          @op_num : Int64? = nil
        )
        end
      end


      struct GetSparqlStreamOutput
        include JSON::Serializable

        # Serialization format for the change records being returned. Currently, the only supported value is
        # NQUADS .

        @[JSON::Field(key: "format")]
        getter format : String

        # Sequence identifier of the last change in the stream response. An event ID is composed of two
        # fields: a commitNum , which identifies a transaction that changed the graph, and an opNum , which
        # identifies a specific operation within that transaction:

        @[JSON::Field(key: "lastEventId")]
        getter last_event_id : Hash(String, String)

        # The time at which the commit for the transaction was requested, in milliseconds from the Unix epoch.

        @[JSON::Field(key: "lastTrxTimestamp")]
        getter last_trx_timestamp_in_millis : Int64

        # An array of serialized change-log stream records included in the response.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::SparqlRecord)

        # The total number of records in the response.

        @[JSON::Field(key: "totalRecords")]
        getter total_records : Int32

        def initialize(
          @format : String,
          @last_event_id : Hash(String, String),
          @last_trx_timestamp_in_millis : Int64,
          @records : Array(Types::SparqlRecord),
          @total_records : Int32
        )
        end
      end

      # Captures the status of a Gremlin query (see the Gremlin query status API page).

      struct GremlinQueryStatus
        include JSON::Serializable

        # The query statistics of the Gremlin query.

        @[JSON::Field(key: "queryEvalStats")]
        getter query_eval_stats : Types::QueryEvalStats?

        # The ID of the Gremlin query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String?

        # The query string of the Gremlin query.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @query_eval_stats : Types::QueryEvalStats? = nil,
          @query_id : String? = nil,
          @query_string : String? = nil
        )
        end
      end

      # Contains status components of a Gremlin query.

      struct GremlinQueryStatusAttributes
        include JSON::Serializable

        # Attributes of the Gremlin query status.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::Document?

        # The HTTP response code returned fro the Gremlin query request..

        @[JSON::Field(key: "code")]
        getter code : Int32?

        # The status message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @attributes : Types::Document? = nil,
          @code : Int32? = nil,
          @message : String? = nil
        )
        end
      end

      # Raised when an argument in a request is not supported.

      struct IllegalArgumentException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the processing of the request failed unexpectedly.

      struct InternalFailureException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when an argument in a request has an invalid value.

      struct InvalidArgumentException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when invalid numerical data is encountered when servicing a request.

      struct InvalidNumericDataException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a parameter value is not valid.

      struct InvalidParameterException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that includes an invalid parameter.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end


      struct ListGremlinQueriesInput
        include JSON::Serializable

        # If set to TRUE , the list returned includes waiting queries. The default is FALSE ;

        @[JSON::Field(key: "includeWaiting")]
        getter include_waiting : Bool?

        def initialize(
          @include_waiting : Bool? = nil
        )
        end
      end


      struct ListGremlinQueriesOutput
        include JSON::Serializable

        # The number of queries that have been accepted but not yet completed, including queries in the queue.

        @[JSON::Field(key: "acceptedQueryCount")]
        getter accepted_query_count : Int32?

        # A list of the current queries.

        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::GremlinQueryStatus)?

        # The number of Gremlin queries currently running.

        @[JSON::Field(key: "runningQueryCount")]
        getter running_query_count : Int32?

        def initialize(
          @accepted_query_count : Int32? = nil,
          @queries : Array(Types::GremlinQueryStatus)? = nil,
          @running_query_count : Int32? = nil
        )
        end
      end


      struct ListLoaderJobsInput
        include JSON::Serializable

        # An optional parameter that can be used to exclude the load IDs of queued load requests when
        # requesting a list of load IDs by setting the parameter to FALSE . The default value is TRUE .

        @[JSON::Field(key: "includeQueuedLoads")]
        getter include_queued_loads : Bool?

        # The number of load IDs to list. Must be a positive integer greater than zero and not more than 100
        # (which is the default).

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        def initialize(
          @include_queued_loads : Bool? = nil,
          @limit : Int32? = nil
        )
        end
      end


      struct ListLoaderJobsOutput
        include JSON::Serializable

        # The requested list of job IDs.

        @[JSON::Field(key: "payload")]
        getter payload : Types::LoaderIdResult

        # Returns the status of the job list request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @payload : Types::LoaderIdResult,
          @status : String
        )
        end
      end


      struct ListMLDataProcessingJobsInput
        include JSON::Serializable

        # The maximum number of items to return (from 1 to 1024; the default is 10).

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @max_items : Int32? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct ListMLDataProcessingJobsOutput
        include JSON::Serializable

        # A page listing data processing job IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        def initialize(
          @ids : Array(String)? = nil
        )
        end
      end


      struct ListMLEndpointsInput
        include JSON::Serializable

        # The maximum number of items to return (from 1 to 1024; the default is 10.

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @max_items : Int32? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct ListMLEndpointsOutput
        include JSON::Serializable

        # A page from the list of inference endpoint IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        def initialize(
          @ids : Array(String)? = nil
        )
        end
      end


      struct ListMLModelTrainingJobsInput
        include JSON::Serializable

        # The maximum number of items to return (from 1 to 1024; the default is 10).

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @max_items : Int32? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct ListMLModelTrainingJobsOutput
        include JSON::Serializable

        # A page of the list of model training job IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        def initialize(
          @ids : Array(String)? = nil
        )
        end
      end


      struct ListMLModelTransformJobsInput
        include JSON::Serializable

        # The maximum number of items to return (from 1 to 1024; the default is 10).

        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        def initialize(
          @max_items : Int32? = nil,
          @neptune_iam_role_arn : String? = nil
        )
        end
      end


      struct ListMLModelTransformJobsOutput
        include JSON::Serializable

        # A page from the list of model transform IDs.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        def initialize(
          @ids : Array(String)? = nil
        )
        end
      end


      struct ListOpenCypherQueriesInput
        include JSON::Serializable

        # When set to TRUE and other parameters are not present, causes status information to be returned for
        # waiting queries as well as for running queries.

        @[JSON::Field(key: "includeWaiting")]
        getter include_waiting : Bool?

        def initialize(
          @include_waiting : Bool? = nil
        )
        end
      end


      struct ListOpenCypherQueriesOutput
        include JSON::Serializable

        # The number of queries that have been accepted but not yet completed, including queries in the queue.

        @[JSON::Field(key: "acceptedQueryCount")]
        getter accepted_query_count : Int32?

        # A list of current openCypher queries.

        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::GremlinQueryStatus)?

        # The number of currently running openCypher queries.

        @[JSON::Field(key: "runningQueryCount")]
        getter running_query_count : Int32?

        def initialize(
          @accepted_query_count : Int32? = nil,
          @queries : Array(Types::GremlinQueryStatus)? = nil,
          @running_query_count : Int32? = nil
        )
        end
      end

      # Raised when access is denied to a specified load URL.

      struct LoadUrlAccessDeniedException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Contains a list of load IDs.

      struct LoaderIdResult
        include JSON::Serializable

        # A list of load IDs.

        @[JSON::Field(key: "loadIds")]
        getter load_ids : Array(String)?

        def initialize(
          @load_ids : Array(String)? = nil
        )
        end
      end

      # Raised when a specified machine-learning resource could not be found.

      struct MLResourceNotFoundException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a query is submitted that is syntactically incorrect or does not pass additional
      # validation.

      struct MalformedQueryException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the malformed query request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end


      struct ManagePropertygraphStatisticsInput
        include JSON::Serializable

        # The statistics generation mode. One of: DISABLE_AUTOCOMPUTE , ENABLE_AUTOCOMPUTE , or REFRESH , the
        # last of which manually triggers DFE statistics generation.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end


      struct ManagePropertygraphStatisticsOutput
        include JSON::Serializable

        # The HTTP return code of the request. If the request succeeded, the code is 200.

        @[JSON::Field(key: "status")]
        getter status : String

        # This is only returned for refresh mode.

        @[JSON::Field(key: "payload")]
        getter payload : Types::RefreshStatisticsIdMap?

        def initialize(
          @status : String,
          @payload : Types::RefreshStatisticsIdMap? = nil
        )
        end
      end


      struct ManageSparqlStatisticsInput
        include JSON::Serializable

        # The statistics generation mode. One of: DISABLE_AUTOCOMPUTE , ENABLE_AUTOCOMPUTE , or REFRESH , the
        # last of which manually triggers DFE statistics generation.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end


      struct ManageSparqlStatisticsOutput
        include JSON::Serializable

        # The HTTP return code of the request. If the request succeeded, the code is 200.

        @[JSON::Field(key: "status")]
        getter status : String

        # This is only returned for refresh mode.

        @[JSON::Field(key: "payload")]
        getter payload : Types::RefreshStatisticsIdMap?

        def initialize(
          @status : String,
          @payload : Types::RefreshStatisticsIdMap? = nil
        )
        end
      end

      # Raised when a request fails because of insufficient memory resources. The request can be retried.

      struct MemoryLimitExceededException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that failed.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the HTTP method used by a request is not supported by the endpoint being used.

      struct MethodNotAllowedException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a required parameter is missing.

      struct MissingParameterException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in which the parameter is missing.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Contains a Neptune ML configuration.

      struct MlConfigDefinition
        include JSON::Serializable

        # The ARN for the configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The configuration name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Defines a Neptune ML resource.

      struct MlResourceDefinition
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The CloudWatch log URL for the resource.

        @[JSON::Field(key: "cloudwatchLogUrl")]
        getter cloudwatch_log_url : String?

        # The failure reason, in case of a failure.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The resource name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The output location.

        @[JSON::Field(key: "outputLocation")]
        getter output_location : String?

        # The resource status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @cloudwatch_log_url : String? = nil,
          @failure_reason : String? = nil,
          @name : String? = nil,
          @output_location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A node structure.

      struct NodeStructure
        include JSON::Serializable

        # Number of nodes that have this specific structure.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # A list of distinct outgoing edge labels present in this specific structure.

        @[JSON::Field(key: "distinctOutgoingEdgeLabels")]
        getter distinct_outgoing_edge_labels : Array(String)?

        # A list of the node properties present in this specific structure.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Array(String)?

        def initialize(
          @count : Int64? = nil,
          @distinct_outgoing_edge_labels : Array(String)? = nil,
          @node_properties : Array(String)? = nil
        )
        end
      end

      # Raised when a parsing issue is encountered.

      struct ParsingException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a precondition for processing a request is not satisfied.

      struct PreconditionsFailedException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # A Gremlin or openCypher change record.

      struct PropertygraphData
        include JSON::Serializable

        # The ID of the Gremlin or openCypher element.

        @[JSON::Field(key: "id")]
        getter id : String

        # The property name. For element labels, this is label .

        @[JSON::Field(key: "key")]
        getter key : String

        # The type of this Gremlin or openCypher element. Must be one of: v1 - Vertex label for Gremlin, or
        # node label for openCypher. vp - Vertex properties for Gremlin, or node properties for openCypher. e
        # - Edge and edge label for Gremlin, or relationship and relationship type for openCypher. ep - Edge
        # properties for Gremlin, or relationship properties for openCypher.

        @[JSON::Field(key: "type")]
        getter type : String

        # This is a JSON object that contains a value field for the value itself, and a datatype field for the
        # JSON data type of that value:

        @[JSON::Field(key: "value")]
        getter value : Types::Document

        # If this is an edge (type = e ), the ID of the corresponding from vertex or source node.

        @[JSON::Field(key: "from")]
        getter from : String?

        # If this is an edge (type = e ), the ID of the corresponding to vertex or target node.

        @[JSON::Field(key: "to")]
        getter to : String?

        def initialize(
          @id : String,
          @key : String,
          @type : String,
          @value : Types::Document,
          @from : String? = nil,
          @to : String? = nil
        )
        end
      end

      # Structure of a property graph record.

      struct PropertygraphRecord
        include JSON::Serializable

        # The time at which the commit for the transaction was requested, in milliseconds from the Unix epoch.

        @[JSON::Field(key: "commitTimestamp")]
        getter commit_timestamp_in_millis : Int64

        # The serialized Gremlin or openCypher change record.

        @[JSON::Field(key: "data")]
        getter data : Types::PropertygraphData

        # The sequence identifier of the stream change record.

        @[JSON::Field(key: "eventId")]
        getter event_id : Hash(String, String)

        # The operation that created the change.

        @[JSON::Field(key: "op")]
        getter op : String

        # Only present if this operation is the last one in its transaction. If present, it is set to true. It
        # is useful for ensuring that an entire transaction is consumed.

        @[JSON::Field(key: "isLastOp")]
        getter is_last_op : Bool?

        def initialize(
          @commit_timestamp_in_millis : Int64,
          @data : Types::PropertygraphData,
          @event_id : Hash(String, String),
          @op : String,
          @is_last_op : Bool? = nil
        )
        end
      end

      # The graph summary API returns a read-only list of node and edge labels and property keys, along with
      # counts of nodes, edges, and properties. See Graph summary response for a property graph (PG) .

      struct PropertygraphSummary
        include JSON::Serializable

        # A list of the distinct edge labels in the graph.

        @[JSON::Field(key: "edgeLabels")]
        getter edge_labels : Array(String)?

        # A list of the distinct edge properties in the graph, along with the count of edges where each
        # property is used.

        @[JSON::Field(key: "edgeProperties")]
        getter edge_properties : Array(Hash(String, Int64))?

        # This field is only present when the requested mode is DETAILED . It contains a list of edge
        # structures.

        @[JSON::Field(key: "edgeStructures")]
        getter edge_structures : Array(Types::EdgeStructure)?

        # A list of the distinct node labels in the graph.

        @[JSON::Field(key: "nodeLabels")]
        getter node_labels : Array(String)?

        # The number of distinct node properties in the graph.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Array(Hash(String, Int64))?

        # This field is only present when the requested mode is DETAILED . It contains a list of node
        # structures.

        @[JSON::Field(key: "nodeStructures")]
        getter node_structures : Array(Types::NodeStructure)?

        # The number of distinct edge labels in the graph.

        @[JSON::Field(key: "numEdgeLabels")]
        getter num_edge_labels : Int64?

        # The number of distinct edge properties in the graph.

        @[JSON::Field(key: "numEdgeProperties")]
        getter num_edge_properties : Int64?

        # The number of edges in the graph.

        @[JSON::Field(key: "numEdges")]
        getter num_edges : Int64?

        # The number of distinct node labels in the graph.

        @[JSON::Field(key: "numNodeLabels")]
        getter num_node_labels : Int64?

        # A list of the distinct node properties in the graph, along with the count of nodes where each
        # property is used.

        @[JSON::Field(key: "numNodeProperties")]
        getter num_node_properties : Int64?

        # The number of nodes in the graph.

        @[JSON::Field(key: "numNodes")]
        getter num_nodes : Int64?

        # The total number of usages of all edge properties.

        @[JSON::Field(key: "totalEdgePropertyValues")]
        getter total_edge_property_values : Int64?

        # The total number of usages of all node properties.

        @[JSON::Field(key: "totalNodePropertyValues")]
        getter total_node_property_values : Int64?

        def initialize(
          @edge_labels : Array(String)? = nil,
          @edge_properties : Array(Hash(String, Int64))? = nil,
          @edge_structures : Array(Types::EdgeStructure)? = nil,
          @node_labels : Array(String)? = nil,
          @node_properties : Array(Hash(String, Int64))? = nil,
          @node_structures : Array(Types::NodeStructure)? = nil,
          @num_edge_labels : Int64? = nil,
          @num_edge_properties : Int64? = nil,
          @num_edges : Int64? = nil,
          @num_node_labels : Int64? = nil,
          @num_node_properties : Int64? = nil,
          @num_nodes : Int64? = nil,
          @total_edge_property_values : Int64? = nil,
          @total_node_property_values : Int64? = nil
        )
        end
      end

      # Payload for the property graph summary response.

      struct PropertygraphSummaryValueMap
        include JSON::Serializable

        # The graph summary.

        @[JSON::Field(key: "graphSummary")]
        getter graph_summary : Types::PropertygraphSummary?

        # The timestamp, in ISO 8601 format, of the time at which Neptune last computed statistics.

        @[JSON::Field(key: "lastStatisticsComputationTime")]
        getter last_statistics_computation_time : Time?

        # The version of this graph summary response.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @graph_summary : Types::PropertygraphSummary? = nil,
          @last_statistics_computation_time : Time? = nil,
          @version : String? = nil
        )
        end
      end

      # Structure to capture query statistics such as how many queries are running, accepted or waiting and
      # their details.

      struct QueryEvalStats
        include JSON::Serializable

        # Set to TRUE if the query was cancelled, or FALSE otherwise.

        @[JSON::Field(key: "cancelled")]
        getter cancelled : Bool?

        # The number of milliseconds the query has been running so far.

        @[JSON::Field(key: "elapsed")]
        getter elapsed : Int32?

        # The number of subqueries in this query.

        @[JSON::Field(key: "subqueries")]
        getter subqueries : Types::Document?

        # Indicates how long the query waited, in milliseconds.

        @[JSON::Field(key: "waited")]
        getter waited : Int32?

        def initialize(
          @cancelled : Bool? = nil,
          @elapsed : Int32? = nil,
          @subqueries : Types::Document? = nil,
          @waited : Int32? = nil
        )
        end
      end

      # Structure for expressing the query language version.

      struct QueryLanguageVersion
        include JSON::Serializable

        # The version of the query language.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @version : String
        )
        end
      end

      # Raised when the number of active queries exceeds what the server can process. The query in question
      # can be retried when the system is less busy.

      struct QueryLimitExceededException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request which exceeded the limit.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the size of a query exceeds the system limit.

      struct QueryLimitException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that exceeded the limit.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the body of a query is too large.

      struct QueryTooLargeException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that is too large.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # The RDF graph summary API returns a read-only list of classes and predicate keys, along with counts
      # of quads, subjects, and predicates.

      struct RDFGraphSummary
        include JSON::Serializable

        # A list of the classes in the graph.

        @[JSON::Field(key: "classes")]
        getter classes : Array(String)?

        # The number of classes in the graph.

        @[JSON::Field(key: "numClasses")]
        getter num_classes : Int64?

        # The number of distinct predicates in the graph.

        @[JSON::Field(key: "numDistinctPredicates")]
        getter num_distinct_predicates : Int64?

        # The number of distinct subjects in the graph.

        @[JSON::Field(key: "numDistinctSubjects")]
        getter num_distinct_subjects : Int64?

        # The number of quads in the graph.

        @[JSON::Field(key: "numQuads")]
        getter num_quads : Int64?

        # "A list of predicates in the graph, along with the predicate counts.

        @[JSON::Field(key: "predicates")]
        getter predicates : Array(Hash(String, Int64))?

        # This field is only present when the request mode is DETAILED . It contains a list of subject
        # structures.

        @[JSON::Field(key: "subjectStructures")]
        getter subject_structures : Array(Types::SubjectStructure)?

        def initialize(
          @classes : Array(String)? = nil,
          @num_classes : Int64? = nil,
          @num_distinct_predicates : Int64? = nil,
          @num_distinct_subjects : Int64? = nil,
          @num_quads : Int64? = nil,
          @predicates : Array(Hash(String, Int64))? = nil,
          @subject_structures : Array(Types::SubjectStructure)? = nil
        )
        end
      end

      # Payload for an RDF graph summary response.

      struct RDFGraphSummaryValueMap
        include JSON::Serializable

        # The graph summary of an RDF graph. See Graph summary response for an RDF graph .

        @[JSON::Field(key: "graphSummary")]
        getter graph_summary : Types::RDFGraphSummary?

        # The timestamp, in ISO 8601 format, of the time at which Neptune last computed statistics.

        @[JSON::Field(key: "lastStatisticsComputationTime")]
        getter last_statistics_computation_time : Time?

        # The version of this graph summary response.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @graph_summary : Types::RDFGraphSummary? = nil,
          @last_statistics_computation_time : Time? = nil,
          @version : String? = nil
        )
        end
      end

      # Raised when a request attempts to write to a read-only resource.

      struct ReadOnlyViolationException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in which the parameter is missing.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Statistics for REFRESH mode.

      struct RefreshStatisticsIdMap
        include JSON::Serializable

        # The ID of the statistics generation run that is currently occurring.

        @[JSON::Field(key: "statisticsId")]
        getter statistics_id : String?

        def initialize(
          @statistics_id : String? = nil
        )
        end
      end

      # Raised when there is a problem accessing Amazon S3.

      struct S3Exception
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the server shuts down while processing a request.

      struct ServerShutdownException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Neptune logs are converted to SPARQL quads in the graph using the Resource Description Framework
      # (RDF) N-QUADS language defined in the W3C RDF 1.1 N-Quads specification

      struct SparqlData
        include JSON::Serializable

        # Holds an N-QUADS statement expressing the changed quad.

        @[JSON::Field(key: "stmt")]
        getter stmt : String

        def initialize(
          @stmt : String
        )
        end
      end

      # A serialized SPARQL stream record capturing a change-log entry for the RDF graph.

      struct SparqlRecord
        include JSON::Serializable

        # The time at which the commit for the transaction was requested, in milliseconds from the Unix epoch.

        @[JSON::Field(key: "commitTimestamp")]
        getter commit_timestamp_in_millis : Int64

        # The serialized SPARQL change record. The serialization formats of each record are described in more
        # detail in Serialization Formats in Neptune Streams .

        @[JSON::Field(key: "data")]
        getter data : Types::SparqlData

        # The sequence identifier of the stream change record.

        @[JSON::Field(key: "eventId")]
        getter event_id : Hash(String, String)

        # The operation that created the change.

        @[JSON::Field(key: "op")]
        getter op : String

        # Only present if this operation is the last one in its transaction. If present, it is set to true. It
        # is useful for ensuring that an entire transaction is consumed.

        @[JSON::Field(key: "isLastOp")]
        getter is_last_op : Bool?

        def initialize(
          @commit_timestamp_in_millis : Int64,
          @data : Types::SparqlData,
          @event_id : Hash(String, String),
          @op : String,
          @is_last_op : Bool? = nil
        )
        end
      end


      struct StartLoaderJobInput
        include JSON::Serializable

        # The format of the data. For more information about data formats for the Neptune Loader command, see
        # Load Data Formats . Allowed values csv for the Gremlin CSV data format . opencypher for the
        # openCypher CSV data format . ntriples for the N-Triples RDF data format . nquads for the N-Quads RDF
        # data format . rdfxml for the RDF\XML RDF data format . turtle for the Turtle RDF data format .

        @[JSON::Field(key: "format")]
        getter format : String

        # The Amazon Resource Name (ARN) for an IAM role to be assumed by the Neptune DB instance for access
        # to the S3 bucket. The IAM role ARN provided here should be attached to the DB cluster (see Adding
        # the IAM Role to an Amazon Neptune Cluster .

        @[JSON::Field(key: "iamRoleArn")]
        getter iam_role_arn : String

        # The Amazon region of the S3 bucket. This must match the Amazon Region of the DB cluster.

        @[JSON::Field(key: "region")]
        getter s3_bucket_region : String

        # The source parameter accepts an S3 URI that identifies a single file, multiple files, a folder, or
        # multiple folders. Neptune loads every data file in any folder that is specified. The URI can be in
        # any of the following formats. s3://(bucket_name)/(object-key-name)
        # https://s3.amazonaws.com/(bucket_name)/(object-key-name)
        # https://s3.us-east-1.amazonaws.com/(bucket_name)/(object-key-name) The object-key-name element of
        # the URI is equivalent to the prefix parameter in an S3 ListObjects API call. It identifies all the
        # objects in the specified S3 bucket whose names begin with that prefix. That can be a single file or
        # folder, or multiple files and/or folders. The specified folder or folders can contain multiple
        # vertex files and multiple edge files.

        @[JSON::Field(key: "source")]
        getter source : String

        # This is an optional parameter that can make a queued load request contingent on the successful
        # completion of one or more previous jobs in the queue. Neptune can queue up as many as 64 load
        # requests at a time, if their queueRequest parameters are set to "TRUE" . The dependencies parameter
        # lets you make execution of such a queued request dependent on the successful completion of one or
        # more specified previous requests in the queue. For example, if load Job-A and Job-B are independent
        # of each other, but load Job-C needs Job-A and Job-B to be finished before it begins, proceed as
        # follows: Submit load-job-A and load-job-B one after another in any order, and save their load-ids.
        # Submit load-job-C with the load-ids of the two jobs in its dependencies field: Because of the
        # dependencies parameter, the bulk loader will not start Job-C until Job-A and Job-B have completed
        # successfully. If either one of them fails, Job-C will not be executed, and its status will be set to
        # LOAD_FAILED_BECAUSE_DEPENDENCY_NOT_SATISFIED . You can set up multiple levels of dependency in this
        # way, so that the failure of one job will cause all requests that are directly or indirectly
        # dependent on it to be cancelled.

        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)?

        # failOnError – A flag to toggle a complete stop on an error. Allowed values : "TRUE" , "FALSE" .
        # Default value : "TRUE" . When this parameter is set to "FALSE" , the loader tries to load all the
        # data in the location specified, skipping any entries with errors. When this parameter is set to
        # "TRUE" , the loader stops as soon as it encounters an error. Data loaded up to that point persists.

        @[JSON::Field(key: "failOnError")]
        getter fail_on_error : Bool?

        # The load job mode. Allowed values : RESUME , NEW , AUTO . Default value : AUTO . RESUME – In RESUME
        # mode, the loader looks for a previous load from this source, and if it finds one, resumes that load
        # job. If no previous load job is found, the loader stops. The loader avoids reloading files that were
        # successfully loaded in a previous job. It only tries to process failed files. If you dropped
        # previously loaded data from your Neptune cluster, that data is not reloaded in this mode. If a
        # previous load job loaded all files from the same source successfully, nothing is reloaded, and the
        # loader returns success. NEW – In NEW mode, the creates a new load request regardless of any previous
        # loads. You can use this mode to reload all the data from a source after dropping previously loaded
        # data from your Neptune cluster, or to load new data available at the same source. AUTO – In AUTO
        # mode, the loader looks for a previous load job from the same source, and if it finds one, resumes
        # that job, just as in RESUME mode. If the loader doesn't find a previous load job from the same
        # source, it loads all data from the source, just as in NEW mode.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The optional parallelism parameter can be set to reduce the number of threads used by the bulk load
        # process. Allowed values : LOW – The number of threads used is the number of available vCPUs divided
        # by 8. MEDIUM – The number of threads used is the number of available vCPUs divided by 2. HIGH – The
        # number of threads used is the same as the number of available vCPUs. OVERSUBSCRIBE – The number of
        # threads used is the number of available vCPUs multiplied by 2. If this value is used, the bulk
        # loader takes up all available resources. This does not mean, however, that the OVERSUBSCRIBE setting
        # results in 100% CPU utilization. Because the load operation is I/O bound, the highest CPU
        # utilization to expect is in the 60% to 70% range. Default value : HIGH The parallelism setting can
        # sometimes result in a deadlock between threads when loading openCypher data. When this happens,
        # Neptune returns the LOAD_DATA_DEADLOCK error. You can generally fix the issue by setting parallelism
        # to a lower setting and retrying the load command.

        @[JSON::Field(key: "parallelism")]
        getter parallelism : String?

        # parserConfiguration – An optional object with additional parser configuration values. Each of the
        # child parameters is also optional: namedGraphUri – The default graph for all RDF formats when no
        # graph is specified (for non-quads formats and NQUAD entries with no graph). The default is
        # https://aws.amazon.com/neptune/vocab/v01/DefaultNamedGraph . baseUri – The base URI for RDF/XML and
        # Turtle formats. The default is https://aws.amazon.com/neptune/default . allowEmptyStrings – Gremlin
        # users need to be able to pass empty string values("") as node and edge properties when loading CSV
        # data. If allowEmptyStrings is set to false (the default), such empty strings are treated as nulls
        # and are not loaded. If allowEmptyStrings is set to true , the loader treats empty strings as valid
        # property values and loads them accordingly.

        @[JSON::Field(key: "parserConfiguration")]
        getter parser_configuration : Hash(String, String)?

        # This is an optional flag parameter that indicates whether the load request can be queued up or not.
        # You don't have to wait for one load job to complete before issuing the next one, because Neptune can
        # queue up as many as 64 jobs at a time, provided that their queueRequest parameters are all set to
        # "TRUE" . The queue order of the jobs will be first-in-first-out (FIFO). If the queueRequest
        # parameter is omitted or set to "FALSE" , the load request will fail if another load job is already
        # running. Allowed values : "TRUE" , "FALSE" . Default value : "FALSE" .

        @[JSON::Field(key: "queueRequest")]
        getter queue_request : Bool?

        # updateSingleCardinalityProperties is an optional parameter that controls how the bulk loader treats
        # a new value for single-cardinality vertex or edge properties. This is not supported for loading
        # openCypher data. Allowed values : "TRUE" , "FALSE" . Default value : "FALSE" . By default, or when
        # updateSingleCardinalityProperties is explicitly set to "FALSE" , the loader treats a new value as an
        # error, because it violates single cardinality. When updateSingleCardinalityProperties is set to
        # "TRUE" , on the other hand, the bulk loader replaces the existing value with the new one. If
        # multiple edge or single-cardinality vertex property values are provided in the source file(s) being
        # loaded, the final value at the end of the bulk load could be any one of those new values. The loader
        # only guarantees that the existing value has been replaced by one of the new ones.

        @[JSON::Field(key: "updateSingleCardinalityProperties")]
        getter update_single_cardinality_properties : Bool?

        # This parameter is required only when loading openCypher data that contains relationship IDs. It must
        # be included and set to True when openCypher relationship IDs are explicitly provided in the load
        # data (recommended). When userProvidedEdgeIds is absent or set to True , an :ID column must be
        # present in every relationship file in the load. When userProvidedEdgeIds is present and set to False
        # , relationship files in the load must not contain an :ID column. Instead, the Neptune loader
        # automatically generates an ID for each relationship. It's useful to provide relationship IDs
        # explicitly so that the loader can resume loading after error in the CSV data have been fixed,
        # without having to reload any relationships that have already been loaded. If relationship IDs have
        # not been explicitly assigned, the loader cannot resume a failed load if any relationship file has
        # had to be corrected, and must instead reload all the relationships.

        @[JSON::Field(key: "userProvidedEdgeIds")]
        getter user_provided_edge_ids : Bool?

        def initialize(
          @format : String,
          @iam_role_arn : String,
          @s3_bucket_region : String,
          @source : String,
          @dependencies : Array(String)? = nil,
          @fail_on_error : Bool? = nil,
          @mode : String? = nil,
          @parallelism : String? = nil,
          @parser_configuration : Hash(String, String)? = nil,
          @queue_request : Bool? = nil,
          @update_single_cardinality_properties : Bool? = nil,
          @user_provided_edge_ids : Bool? = nil
        )
        end
      end


      struct StartLoaderJobOutput
        include JSON::Serializable

        # Contains a loadId name-value pair that provides an identifier for the load operation.

        @[JSON::Field(key: "payload")]
        getter payload : Hash(String, String)

        # The HTTP return code indicating the status of the load job.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @payload : Hash(String, String),
          @status : String
        )
        end
      end


      struct StartMLDataProcessingJobInput
        include JSON::Serializable

        # The URI of the Amazon S3 location where you want SageMaker to download the data needed to run the
        # data processing job.

        @[JSON::Field(key: "inputDataS3Location")]
        getter input_data_s3_location : String

        # The URI of the Amazon S3 location where you want SageMaker to save the results of a data processing
        # job.

        @[JSON::Field(key: "processedDataS3Location")]
        getter processed_data_s3_location : String

        # A data specification file that describes how to load the exported graph data for training. The file
        # is automatically generated by the Neptune export toolkit. The default is
        # training-data-configuration.json .

        @[JSON::Field(key: "configFileName")]
        getter config_file_name : String?

        # A unique identifier for the new job. The default is an autogenerated UUID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # One of the two model types that Neptune ML currently supports: heterogeneous graph models (
        # heterogeneous ), and knowledge graph ( kge ). The default is none. If not specified, Neptune ML
        # chooses the model type automatically based on the data.

        @[JSON::Field(key: "modelType")]
        getter model_type : String?

        # The Amazon Resource Name (ARN) of an IAM role that SageMaker can assume to perform tasks on your
        # behalf. This must be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        # The job ID of a completed data processing job run on an earlier version of the data.

        @[JSON::Field(key: "previousDataProcessingJobId")]
        getter previous_data_processing_job_id : String?

        # The type of ML instance used during data processing. Its memory should be large enough to hold the
        # processed dataset. The default is the smallest ml.r5 type whose memory is ten times larger than the
        # size of the exported graph data on disk.

        @[JSON::Field(key: "processingInstanceType")]
        getter processing_instance_type : String?

        # The disk volume size of the processing instance. Both input data and processed data are stored on
        # disk, so the volume size must be large enough to hold both data sets. The default is 0. If not
        # specified or 0, Neptune ML chooses the volume size automatically based on the data size.

        @[JSON::Field(key: "processingInstanceVolumeSizeInGB")]
        getter processing_instance_volume_size_in_gb : Int32?

        # Timeout in seconds for the data processing job. The default is 86,400 (1 day).

        @[JSON::Field(key: "processingTimeOutInSeconds")]
        getter processing_time_out_in_seconds : Int32?

        # The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to encrypt the output of the
        # processing job. The default is none.

        @[JSON::Field(key: "s3OutputEncryptionKMSKey")]
        getter s3_output_encryption_kms_key : String?

        # The ARN of an IAM role for SageMaker execution. This must be listed in your DB cluster parameter
        # group or an error will occur.

        @[JSON::Field(key: "sagemakerIamRoleArn")]
        getter sagemaker_iam_role_arn : String?

        # The VPC security group IDs. The default is None.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the subnets in the Neptune VPC. The default is None.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to encrypt data on the
        # storage volume attached to the ML compute instances that run the training job. The default is None.

        @[JSON::Field(key: "volumeEncryptionKMSKey")]
        getter volume_encryption_kms_key : String?

        def initialize(
          @input_data_s3_location : String,
          @processed_data_s3_location : String,
          @config_file_name : String? = nil,
          @id : String? = nil,
          @model_type : String? = nil,
          @neptune_iam_role_arn : String? = nil,
          @previous_data_processing_job_id : String? = nil,
          @processing_instance_type : String? = nil,
          @processing_instance_volume_size_in_gb : Int32? = nil,
          @processing_time_out_in_seconds : Int32? = nil,
          @s3_output_encryption_kms_key : String? = nil,
          @sagemaker_iam_role_arn : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @volume_encryption_kms_key : String? = nil
        )
        end
      end


      struct StartMLDataProcessingJobOutput
        include JSON::Serializable

        # The ARN of the data processing job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time it took to create the new processing job, in milliseconds.

        @[JSON::Field(key: "creationTimeInMillis")]
        getter creation_time_in_millis : Int64?

        # The unique ID of the new data processing job.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time_in_millis : Int64? = nil,
          @id : String? = nil
        )
        end
      end


      struct StartMLModelTrainingJobInput
        include JSON::Serializable

        # The job ID of the completed data-processing job that has created the data that the training will
        # work with.

        @[JSON::Field(key: "dataProcessingJobId")]
        getter data_processing_job_id : String

        # The location in Amazon S3 where the model artifacts are to be stored.

        @[JSON::Field(key: "trainModelS3Location")]
        getter train_model_s3_location : String

        # The type of ML instance used in preparing and managing training of ML models. This is a CPU instance
        # chosen based on memory requirements for processing the training data and model.

        @[JSON::Field(key: "baseProcessingInstanceType")]
        getter base_processing_instance_type : String?

        # The configuration for custom model training. This is a JSON object.

        @[JSON::Field(key: "customModelTrainingParameters")]
        getter custom_model_training_parameters : Types::CustomModelTrainingParameters?

        # Optimizes the cost of training machine-learning models by using Amazon Elastic Compute Cloud spot
        # instances. The default is False .

        @[JSON::Field(key: "enableManagedSpotTraining")]
        getter enable_managed_spot_training : Bool?

        # A unique identifier for the new job. The default is An autogenerated UUID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Maximum total number of training jobs to start for the hyperparameter tuning job. The default is 2.
        # Neptune ML automatically tunes the hyperparameters of the machine learning model. To obtain a model
        # that performs well, use at least 10 jobs (in other words, set maxHPONumberOfTrainingJobs to 10). In
        # general, the more tuning runs, the better the results.

        @[JSON::Field(key: "maxHPONumberOfTrainingJobs")]
        getter max_hpo_number_of_training_jobs : Int32?

        # Maximum number of parallel training jobs to start for the hyperparameter tuning job. The default is
        # 2. The number of parallel jobs you can run is limited by the available resources on your training
        # instance.

        @[JSON::Field(key: "maxHPOParallelTrainingJobs")]
        getter max_hpo_parallel_training_jobs : Int32?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        # The job ID of a completed model-training job that you want to update incrementally based on updated
        # data.

        @[JSON::Field(key: "previousModelTrainingJobId")]
        getter previous_model_training_job_id : String?

        # The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt the output of the
        # processing job. The default is none.

        @[JSON::Field(key: "s3OutputEncryptionKMSKey")]
        getter s3_output_encryption_kms_key : String?

        # The ARN of an IAM role for SageMaker execution.This must be listed in your DB cluster parameter
        # group or an error will occur.

        @[JSON::Field(key: "sagemakerIamRoleArn")]
        getter sagemaker_iam_role_arn : String?

        # The VPC security group IDs. The default is None.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the subnets in the Neptune VPC. The default is None.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # The type of ML instance used for model training. All Neptune ML models support CPU, GPU, and
        # multiGPU training. The default is ml.p3.2xlarge . Choosing the right instance type for training
        # depends on the task type, graph size, and your budget.

        @[JSON::Field(key: "trainingInstanceType")]
        getter training_instance_type : String?

        # The disk volume size of the training instance. Both input data and the output model are stored on
        # disk, so the volume size must be large enough to hold both data sets. The default is 0. If not
        # specified or 0, Neptune ML selects a disk volume size based on the recommendation generated in the
        # data processing step.

        @[JSON::Field(key: "trainingInstanceVolumeSizeInGB")]
        getter training_instance_volume_size_in_gb : Int32?

        # Timeout in seconds for the training job. The default is 86,400 (1 day).

        @[JSON::Field(key: "trainingTimeOutInSeconds")]
        getter training_time_out_in_seconds : Int32?

        # The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt data on the storage
        # volume attached to the ML compute instances that run the training job. The default is None.

        @[JSON::Field(key: "volumeEncryptionKMSKey")]
        getter volume_encryption_kms_key : String?

        def initialize(
          @data_processing_job_id : String,
          @train_model_s3_location : String,
          @base_processing_instance_type : String? = nil,
          @custom_model_training_parameters : Types::CustomModelTrainingParameters? = nil,
          @enable_managed_spot_training : Bool? = nil,
          @id : String? = nil,
          @max_hpo_number_of_training_jobs : Int32? = nil,
          @max_hpo_parallel_training_jobs : Int32? = nil,
          @neptune_iam_role_arn : String? = nil,
          @previous_model_training_job_id : String? = nil,
          @s3_output_encryption_kms_key : String? = nil,
          @sagemaker_iam_role_arn : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @training_instance_type : String? = nil,
          @training_instance_volume_size_in_gb : Int32? = nil,
          @training_time_out_in_seconds : Int32? = nil,
          @volume_encryption_kms_key : String? = nil
        )
        end
      end


      struct StartMLModelTrainingJobOutput
        include JSON::Serializable

        # The ARN of the new model training job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The model training job creation time, in milliseconds.

        @[JSON::Field(key: "creationTimeInMillis")]
        getter creation_time_in_millis : Int64?

        # The unique ID of the new model training job.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time_in_millis : Int64? = nil,
          @id : String? = nil
        )
        end
      end


      struct StartMLModelTransformJobInput
        include JSON::Serializable

        # The location in Amazon S3 where the model artifacts are to be stored.

        @[JSON::Field(key: "modelTransformOutputS3Location")]
        getter model_transform_output_s3_location : String

        # The type of ML instance used in preparing and managing training of ML models. This is an ML compute
        # instance chosen based on memory requirements for processing the training data and model.

        @[JSON::Field(key: "baseProcessingInstanceType")]
        getter base_processing_instance_type : String?

        # The disk volume size of the training instance in gigabytes. The default is 0. Both input data and
        # the output model are stored on disk, so the volume size must be large enough to hold both data sets.
        # If not specified or 0, Neptune ML selects a disk volume size based on the recommendation generated
        # in the data processing step.

        @[JSON::Field(key: "baseProcessingInstanceVolumeSizeInGB")]
        getter base_processing_instance_volume_size_in_gb : Int32?

        # Configuration information for a model transform using a custom model. The
        # customModelTransformParameters object contains the following fields, which must have values
        # compatible with the saved model parameters from the training job:

        @[JSON::Field(key: "customModelTransformParameters")]
        getter custom_model_transform_parameters : Types::CustomModelTransformParameters?

        # The job ID of a completed data-processing job. You must include either dataProcessingJobId and a
        # mlModelTrainingJobId , or a trainingJobName .

        @[JSON::Field(key: "dataProcessingJobId")]
        getter data_processing_job_id : String?

        # A unique identifier for the new job. The default is an autogenerated UUID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The job ID of a completed model-training job. You must include either dataProcessingJobId and a
        # mlModelTrainingJobId , or a trainingJobName .

        @[JSON::Field(key: "mlModelTrainingJobId")]
        getter ml_model_training_job_id : String?

        # The ARN of an IAM role that provides Neptune access to SageMaker and Amazon S3 resources. This must
        # be listed in your DB cluster parameter group or an error will occur.

        @[JSON::Field(key: "neptuneIamRoleArn")]
        getter neptune_iam_role_arn : String?

        # The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt the output of the
        # processing job. The default is none.

        @[JSON::Field(key: "s3OutputEncryptionKMSKey")]
        getter s3_output_encryption_kms_key : String?

        # The ARN of an IAM role for SageMaker execution. This must be listed in your DB cluster parameter
        # group or an error will occur.

        @[JSON::Field(key: "sagemakerIamRoleArn")]
        getter sagemaker_iam_role_arn : String?

        # The VPC security group IDs. The default is None.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the subnets in the Neptune VPC. The default is None.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # The name of a completed SageMaker training job. You must include either dataProcessingJobId and a
        # mlModelTrainingJobId , or a trainingJobName .

        @[JSON::Field(key: "trainingJobName")]
        getter training_job_name : String?

        # The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt data on the storage
        # volume attached to the ML compute instances that run the training job. The default is None.

        @[JSON::Field(key: "volumeEncryptionKMSKey")]
        getter volume_encryption_kms_key : String?

        def initialize(
          @model_transform_output_s3_location : String,
          @base_processing_instance_type : String? = nil,
          @base_processing_instance_volume_size_in_gb : Int32? = nil,
          @custom_model_transform_parameters : Types::CustomModelTransformParameters? = nil,
          @data_processing_job_id : String? = nil,
          @id : String? = nil,
          @ml_model_training_job_id : String? = nil,
          @neptune_iam_role_arn : String? = nil,
          @s3_output_encryption_kms_key : String? = nil,
          @sagemaker_iam_role_arn : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @training_job_name : String? = nil,
          @volume_encryption_kms_key : String? = nil
        )
        end
      end


      struct StartMLModelTransformJobOutput
        include JSON::Serializable

        # The ARN of the model transform job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The creation time of the model transform job, in milliseconds.

        @[JSON::Field(key: "creationTimeInMillis")]
        getter creation_time_in_millis : Int64?

        # The unique ID of the new model transform job.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time_in_millis : Int64? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains statistics information. The DFE engine uses information about the data in your Neptune
      # graph to make effective trade-offs when planning query execution. This information takes the form of
      # statistics that include so-called characteristic sets and predicate statistics that can guide query
      # planning. See Managing statistics for the Neptune DFE to use .

      struct Statistics
        include JSON::Serializable

        # Indicates whether or not DFE statistics generation is enabled at all.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Indicates whether or not automatic statistics generation is enabled.

        @[JSON::Field(key: "autoCompute")]
        getter auto_compute : Bool?

        # The UTC time at which DFE statistics have most recently been generated.

        @[JSON::Field(key: "date")]
        getter date : Time?

        # A note about problems in the case where statistics are invalid.

        @[JSON::Field(key: "note")]
        getter note : String?

        # A StatisticsSummary structure that contains: signatureCount - The total number of signatures across
        # all characteristic sets. instanceCount - The total number of characteristic-set instances.
        # predicateCount - The total number of unique predicates.

        @[JSON::Field(key: "signatureInfo")]
        getter signature_info : Types::StatisticsSummary?

        # Reports the ID of the current statistics generation run. A value of -1 indicates that no statistics
        # have been generated.

        @[JSON::Field(key: "statisticsId")]
        getter statistics_id : String?

        def initialize(
          @active : Bool? = nil,
          @auto_compute : Bool? = nil,
          @date : Time? = nil,
          @note : String? = nil,
          @signature_info : Types::StatisticsSummary? = nil,
          @statistics_id : String? = nil
        )
        end
      end

      # Raised when statistics needed to satisfy a request are not available.

      struct StatisticsNotAvailableException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Information about the characteristic sets generated in the statistics.

      struct StatisticsSummary
        include JSON::Serializable

        # The total number of characteristic-set instances.

        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        # The total number of unique predicates.

        @[JSON::Field(key: "predicateCount")]
        getter predicate_count : Int32?

        # The total number of signatures across all characteristic sets.

        @[JSON::Field(key: "signatureCount")]
        getter signature_count : Int32?

        def initialize(
          @instance_count : Int32? = nil,
          @predicate_count : Int32? = nil,
          @signature_count : Int32? = nil
        )
        end
      end

      # Raised when stream records requested by a query cannot be found.

      struct StreamRecordsNotFoundException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # A subject structure.

      struct SubjectStructure
        include JSON::Serializable

        # Number of occurrences of this specific structure.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # A list of predicates present in this specific structure.

        @[JSON::Field(key: "predicates")]
        getter predicates : Array(String)?

        def initialize(
          @count : Int64? = nil,
          @predicates : Array(String)? = nil
        )
        end
      end

      # Raised when the rate of requests exceeds the maximum throughput. Requests can be retried after
      # encountering this exception.

      struct ThrottlingException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that could not be processed for this reason.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the an operation exceeds the time limit allowed for it.

      struct TimeLimitExceededException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that could not be processed for this reason.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when the number of requests being processed exceeds the limit.

      struct TooManyRequestsException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request that could not be processed for this reason.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end

      # Raised when a request attempts to initiate an operation that is not supported.

      struct UnsupportedOperationException
        include JSON::Serializable

        # The HTTP status code returned with the exception.

        @[JSON::Field(key: "code")]
        getter code : String

        # A detailed message describing the problem.

        @[JSON::Field(key: "detailedMessage")]
        getter detailed_message : String

        # The ID of the request in question.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        def initialize(
          @code : String,
          @detailed_message : String,
          @request_id : String
        )
        end
      end
    end
  end
end
