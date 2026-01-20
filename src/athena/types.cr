require "json"
require "time"

module Aws
  module Athena
    module Types

      # Indicates that an Amazon S3 canned ACL should be set to control ownership of stored query results,
      # including data files inserted by Athena as the result of statements like CTAS or INSERT INTO. When
      # Athena stores query results in Amazon S3, the canned ACL is set with the x-amz-acl request header.
      # For more information about S3 Object Ownership, see Object Ownership settings in the Amazon S3 User
      # Guide .

      struct AclConfiguration
        include JSON::Serializable

        # The Amazon S3 canned ACL that Athena should specify when storing query results, including data files
        # inserted by Athena as the result of statements like CTAS or INSERT INTO. Currently the only
        # supported canned ACL is BUCKET_OWNER_FULL_CONTROL . If a query runs in a workgroup and the workgroup
        # overrides client-side settings, then the Amazon S3 canned ACL specified in the workgroup's settings
        # is used for all queries that run in the workgroup. For more information about Amazon S3 canned ACLs,
        # see Canned ACL in the Amazon S3 User Guide .

        @[JSON::Field(key: "S3AclOption")]
        getter s3_acl_option : String

        def initialize(
          @s3_acl_option : String
        )
        end
      end

      # Contains the application runtime IDs and their supported DPU sizes.

      struct ApplicationDPUSizes
        include JSON::Serializable

        # The name of the supported application runtime (for example, Athena notebook version 1 ).

        @[JSON::Field(key: "ApplicationRuntimeId")]
        getter application_runtime_id : String?

        # A list of the supported DPU sizes that the application runtime supports.

        @[JSON::Field(key: "SupportedDPUSizes")]
        getter supported_dpu_sizes : Array(Int32)?

        def initialize(
          @application_runtime_id : String? = nil,
          @supported_dpu_sizes : Array(Int32)? = nil
        )
        end
      end

      # Provides information about an Athena query error. The AthenaError feature provides standardized
      # error information to help you understand failed queries and take steps after a query failure occurs.
      # AthenaError includes an ErrorCategory field that specifies whether the cause of the failed query is
      # due to system error, user error, or other error.

      struct AthenaError
        include JSON::Serializable

        # An integer value that specifies the category of a query failure error. The following list shows the
        # category for each integer value. 1 - System 2 - User 3 - Other

        @[JSON::Field(key: "ErrorCategory")]
        getter error_category : Int32?

        # Contains a short description of the error that occurred.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # An integer value that provides specific information about an Athena query error. For the meaning of
        # specific values, see the Error Type Reference in the Amazon Athena User Guide .

        @[JSON::Field(key: "ErrorType")]
        getter error_type : Int32?

        # True if the query might succeed if resubmitted.

        @[JSON::Field(key: "Retryable")]
        getter retryable : Bool?

        def initialize(
          @error_category : Int32? = nil,
          @error_message : String? = nil,
          @error_type : Int32? = nil,
          @retryable : Bool? = nil
        )
        end
      end

      # Contains an array of named query IDs.

      struct BatchGetNamedQueryInput
        include JSON::Serializable

        # An array of query IDs.

        @[JSON::Field(key: "NamedQueryIds")]
        getter named_query_ids : Array(String)

        def initialize(
          @named_query_ids : Array(String)
        )
        end
      end


      struct BatchGetNamedQueryOutput
        include JSON::Serializable

        # Information about the named query IDs submitted.

        @[JSON::Field(key: "NamedQueries")]
        getter named_queries : Array(Types::NamedQuery)?

        # Information about provided query IDs.

        @[JSON::Field(key: "UnprocessedNamedQueryIds")]
        getter unprocessed_named_query_ids : Array(Types::UnprocessedNamedQueryId)?

        def initialize(
          @named_queries : Array(Types::NamedQuery)? = nil,
          @unprocessed_named_query_ids : Array(Types::UnprocessedNamedQueryId)? = nil
        )
        end
      end


      struct BatchGetPreparedStatementInput
        include JSON::Serializable

        # A list of prepared statement names to return.

        @[JSON::Field(key: "PreparedStatementNames")]
        getter prepared_statement_names : Array(String)

        # The name of the workgroup to which the prepared statements belong.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        def initialize(
          @prepared_statement_names : Array(String),
          @work_group : String
        )
        end
      end


      struct BatchGetPreparedStatementOutput
        include JSON::Serializable

        # The list of prepared statements returned.

        @[JSON::Field(key: "PreparedStatements")]
        getter prepared_statements : Array(Types::PreparedStatement)?

        # A list of one or more prepared statements that were requested but could not be returned.

        @[JSON::Field(key: "UnprocessedPreparedStatementNames")]
        getter unprocessed_prepared_statement_names : Array(Types::UnprocessedPreparedStatementName)?

        def initialize(
          @prepared_statements : Array(Types::PreparedStatement)? = nil,
          @unprocessed_prepared_statement_names : Array(Types::UnprocessedPreparedStatementName)? = nil
        )
        end
      end

      # Contains an array of query execution IDs.

      struct BatchGetQueryExecutionInput
        include JSON::Serializable

        # An array of query execution IDs.

        @[JSON::Field(key: "QueryExecutionIds")]
        getter query_execution_ids : Array(String)

        def initialize(
          @query_execution_ids : Array(String)
        )
        end
      end


      struct BatchGetQueryExecutionOutput
        include JSON::Serializable

        # Information about a query execution.

        @[JSON::Field(key: "QueryExecutions")]
        getter query_executions : Array(Types::QueryExecution)?

        # Information about the query executions that failed to run.

        @[JSON::Field(key: "UnprocessedQueryExecutionIds")]
        getter unprocessed_query_execution_ids : Array(Types::UnprocessedQueryExecutionId)?

        def initialize(
          @query_executions : Array(Types::QueryExecution)? = nil,
          @unprocessed_query_execution_ids : Array(Types::UnprocessedQueryExecutionId)? = nil
        )
        end
      end

      # Contains configuration information for the calculation.

      struct CalculationConfiguration
        include JSON::Serializable

        # A string that contains the code for the calculation.

        @[JSON::Field(key: "CodeBlock")]
        getter code_block : String?

        def initialize(
          @code_block : String? = nil
        )
        end
      end

      # Contains information about an application-specific calculation result.

      struct CalculationResult
        include JSON::Serializable

        # The Amazon S3 location of the folder for the calculation results.

        @[JSON::Field(key: "ResultS3Uri")]
        getter result_s3_uri : String?

        # The data format of the calculation result.

        @[JSON::Field(key: "ResultType")]
        getter result_type : String?

        # The Amazon S3 location of the stderr error messages file for the calculation.

        @[JSON::Field(key: "StdErrorS3Uri")]
        getter std_error_s3_uri : String?

        # The Amazon S3 location of the stdout file for the calculation.

        @[JSON::Field(key: "StdOutS3Uri")]
        getter std_out_s3_uri : String?

        def initialize(
          @result_s3_uri : String? = nil,
          @result_type : String? = nil,
          @std_error_s3_uri : String? = nil,
          @std_out_s3_uri : String? = nil
        )
        end
      end

      # Contains statistics for a notebook calculation.

      struct CalculationStatistics
        include JSON::Serializable

        # The data processing unit execution time in milliseconds for the calculation.

        @[JSON::Field(key: "DpuExecutionInMillis")]
        getter dpu_execution_in_millis : Int64?

        # The progress of the calculation.

        @[JSON::Field(key: "Progress")]
        getter progress : String?

        def initialize(
          @dpu_execution_in_millis : Int64? = nil,
          @progress : String? = nil
        )
        end
      end

      # Contains information about the status of a notebook calculation.

      struct CalculationStatus
        include JSON::Serializable

        # The date and time the calculation completed processing.

        @[JSON::Field(key: "CompletionDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completion_date_time : Time?

        # The state of the calculation execution. A description of each state follows. CREATING - The
        # calculation is in the process of being created. CREATED - The calculation has been created and is
        # ready to run. QUEUED - The calculation has been queued for processing. RUNNING - The calculation is
        # running. CANCELING - A request to cancel the calculation has been received and the system is working
        # to stop it. CANCELED - The calculation is no longer running as the result of a cancel request.
        # COMPLETED - The calculation has completed without error. FAILED - The calculation failed and is no
        # longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the calculation state change (for example, the calculation was canceled because the
        # session was terminated).

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : String?

        # The date and time the calculation was submitted for processing.

        @[JSON::Field(key: "SubmissionDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submission_date_time : Time?

        def initialize(
          @completion_date_time : Time? = nil,
          @state : String? = nil,
          @state_change_reason : String? = nil,
          @submission_date_time : Time? = nil
        )
        end
      end

      # Summary information for a notebook calculation.

      struct CalculationSummary
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String?

        # A description of the calculation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Contains information about the status of the calculation.

        @[JSON::Field(key: "Status")]
        getter status : Types::CalculationStatus?

        def initialize(
          @calculation_execution_id : String? = nil,
          @description : String? = nil,
          @status : Types::CalculationStatus? = nil
        )
        end
      end


      struct CancelCapacityReservationInput
        include JSON::Serializable

        # The name of the capacity reservation to cancel.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CancelCapacityReservationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the submission time of a single allocation request for a capacity reservation and the most
      # recent status of the attempted allocation.

      struct CapacityAllocation
        include JSON::Serializable

        # The time when the capacity allocation was requested.

        @[JSON::Field(key: "RequestTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter request_time : Time

        # The status of the capacity allocation.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The time when the capacity allocation request was completed.

        @[JSON::Field(key: "RequestCompletionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter request_completion_time : Time?

        # The status message of the capacity allocation.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @request_time : Time,
          @status : String,
          @request_completion_time : Time? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A mapping between one or more workgroups and a capacity reservation.

      struct CapacityAssignment
        include JSON::Serializable

        # The list of workgroup names for the capacity assignment.

        @[JSON::Field(key: "WorkGroupNames")]
        getter work_group_names : Array(String)?

        def initialize(
          @work_group_names : Array(String)? = nil
        )
        end
      end

      # Assigns Athena workgroups (and hence their queries) to capacity reservations. A capacity reservation
      # can have only one capacity assignment configuration, but the capacity assignment configuration can
      # be made up of multiple individual assignments. Each assignment specifies how Athena queries can
      # consume capacity from the capacity reservation that their workgroup is mapped to.

      struct CapacityAssignmentConfiguration
        include JSON::Serializable

        # The list of assignments that make up the capacity assignment configuration.

        @[JSON::Field(key: "CapacityAssignments")]
        getter capacity_assignments : Array(Types::CapacityAssignment)?

        # The name of the reservation that the capacity assignment configuration is for.

        @[JSON::Field(key: "CapacityReservationName")]
        getter capacity_reservation_name : String?

        def initialize(
          @capacity_assignments : Array(Types::CapacityAssignment)? = nil,
          @capacity_reservation_name : String? = nil
        )
        end
      end

      # A reservation for a specified number of data processing units (DPUs). When a reservation is
      # initially created, it has no DPUs. Athena allocates DPUs until the allocated amount equals the
      # requested amount.

      struct CapacityReservation
        include JSON::Serializable

        # The number of data processing units currently allocated.

        @[JSON::Field(key: "AllocatedDpus")]
        getter allocated_dpus : Int32

        # The time in UTC epoch millis when the capacity reservation was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The name of the capacity reservation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the capacity reservation.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The number of data processing units requested.

        @[JSON::Field(key: "TargetDpus")]
        getter target_dpus : Int32


        @[JSON::Field(key: "LastAllocation")]
        getter last_allocation : Types::CapacityAllocation?

        # The time of the most recent capacity allocation that succeeded.

        @[JSON::Field(key: "LastSuccessfulAllocationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_successful_allocation_time : Time?

        def initialize(
          @allocated_dpus : Int32,
          @creation_time : Time,
          @name : String,
          @status : String,
          @target_dpus : Int32,
          @last_allocation : Types::CapacityAllocation? = nil,
          @last_successful_allocation_time : Time? = nil
        )
        end
      end

      # A classification refers to a set of specific configurations.

      struct Classification
        include JSON::Serializable

        # The name of the configuration classification.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A set of properties specified within a configuration classification.

        @[JSON::Field(key: "Properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @name : String? = nil,
          @properties : Hash(String, String)? = nil
        )
        end
      end

      # Configuration settings for delivering logs to Amazon CloudWatch log groups.

      struct CloudWatchLoggingConfiguration
        include JSON::Serializable

        # Enables CloudWatch logging.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The name of the log group in Amazon CloudWatch Logs where you want to publish your logs.

        @[JSON::Field(key: "LogGroup")]
        getter log_group : String?

        # Prefix for the CloudWatch log stream name.

        @[JSON::Field(key: "LogStreamNamePrefix")]
        getter log_stream_name_prefix : String?

        # The types of logs that you want to publish to CloudWatch.

        @[JSON::Field(key: "LogTypes")]
        getter log_types : Hash(String, Array(String))?

        def initialize(
          @enabled : Bool,
          @log_group : String? = nil,
          @log_stream_name_prefix : String? = nil,
          @log_types : Hash(String, Array(String))? = nil
        )
        end
      end

      # Contains metadata for a column in a table.

      struct Column
        include JSON::Serializable

        # The name of the column.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Optional information about the column.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The data type of the column.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String,
          @comment : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the columns in a query execution result.

      struct ColumnInfo
        include JSON::Serializable

        # The name of the column.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The data type of the column.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Indicates whether values in the column are case-sensitive.

        @[JSON::Field(key: "CaseSensitive")]
        getter case_sensitive : Bool?

        # The catalog to which the query results belong.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String?

        # A column label.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # Unsupported constraint. This value always shows as UNKNOWN .

        @[JSON::Field(key: "Nullable")]
        getter nullable : String?

        # For DECIMAL data types, specifies the total number of digits, up to 38. For performance reasons, we
        # recommend up to 18 digits.

        @[JSON::Field(key: "Precision")]
        getter precision : Int32?

        # For DECIMAL data types, specifies the total number of digits in the fractional part of the value.
        # Defaults to 0.

        @[JSON::Field(key: "Scale")]
        getter scale : Int32?

        # The schema name (database name) to which the query results belong.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The table name for the query results.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @name : String,
          @type : String,
          @case_sensitive : Bool? = nil,
          @catalog_name : String? = nil,
          @label : String? = nil,
          @nullable : String? = nil,
          @precision : Int32? = nil,
          @scale : Int32? = nil,
          @schema_name : String? = nil,
          @table_name : String? = nil
        )
        end
      end


      struct CreateCapacityReservationInput
        include JSON::Serializable

        # The name of the capacity reservation to create.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The number of requested data processing units.

        @[JSON::Field(key: "TargetDpus")]
        getter target_dpus : Int32

        # The tags for the capacity reservation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @target_dpus : Int32,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCapacityReservationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateDataCatalogInput
        include JSON::Serializable

        # The name of the data catalog to create. The catalog name must be unique for the Amazon Web Services
        # account and can use a maximum of 127 alphanumeric, underscore, at sign, or hyphen characters. The
        # remainder of the length constraint of 256 is reserved for use by Athena. For FEDERATED type the
        # catalog name has following considerations and limits: The catalog name allows special characters
        # such as _ , @ , \ , - . These characters are replaced with a hyphen (-) when creating the CFN Stack
        # Name and with an underscore (_) when creating the Lambda Function and Glue Connection Name. The
        # catalog name has a theoretical limit of 128 characters. However, since we use it to create other
        # resources that allow less characters and we prepend a prefix to it, the actual catalog name limit
        # for FEDERATED catalog is 64 - 23 = 41 characters.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of data catalog to create: LAMBDA for a federated catalog, GLUE for an Glue Data Catalog,
        # and HIVE for an external Apache Hive metastore. FEDERATED is a federated catalog for which Athena
        # creates the connection and the Lambda function for you based on the parameters that you pass. For
        # FEDERATED type, we do not support IAM identity center.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A description of the data catalog to be created.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the Lambda function or functions to use for creating the data catalog. This is a mapping
        # whose values depend on the catalog type. For the HIVE data catalog type, use the following syntax.
        # The metadata-function parameter is required. The sdk-version parameter is optional and defaults to
        # the currently supported version. metadata-function= lambda_arn , sdk-version= version_number For the
        # LAMBDA data catalog type, use one of the following sets of required parameters, but not both. If you
        # have one Lambda function that processes metadata and another for reading the actual data, use the
        # following syntax. Both parameters are required. metadata-function= lambda_arn , record-function=
        # lambda_arn If you have a composite Lambda function that processes both metadata and data, use the
        # following syntax to specify your Lambda function. function= lambda_arn The GLUE type takes a catalog
        # ID parameter and is required. The catalog_id is the account ID of the Amazon Web Services account to
        # which the Glue Data Catalog belongs. catalog-id= catalog_id The GLUE data catalog type also applies
        # to the default AwsDataCatalog that already exists in your account, of which you can have only one
        # and cannot modify. The FEDERATED data catalog type uses one of the following parameters, but not
        # both. Use connection-arn for an existing Glue connection. Use connection-type and
        # connection-properties to specify the configuration setting for a new connection. connection-arn:
        # &lt;glue_connection_arn_to_reuse&gt; lambda-role-arn (optional): The execution role to use for the
        # Lambda function. If not provided, one is created. connection-type:MYSQL|REDSHIFT|....,
        # connection-properties:" &lt;json_string&gt; " For &lt;json_string&gt; , use escaped JSON text, as in
        # the following example.
        # "{\"spill_bucket\":\"my_spill\",\"spill_prefix\":\"athena-spill\",\"host\":\"abc12345.snowflakecomputing.com\",\"port\":\"1234\",\"warehouse\":\"DEV_WH\",\"database\":\"TEST\",\"schema\":\"PUBLIC\",\"SecretArn\":\"arn:aws:secretsmanager:ap-south-1:111122223333:secret:snowflake-XHb67j\"}"

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # A list of comma separated tags to add to the data catalog that is created. All the resources that
        # are created by the CreateDataCatalog API operation with FEDERATED type will have the tag
        # federated_athena_datacatalog="true" . This includes the CFN Stack, Glue Connection, Athena
        # DataCatalog, and all the resources created as part of the CFN Stack (Lambda Function, IAM
        # policies/roles).

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @type : String,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDataCatalogOutput
        include JSON::Serializable


        @[JSON::Field(key: "DataCatalog")]
        getter data_catalog : Types::DataCatalog?

        def initialize(
          @data_catalog : Types::DataCatalog? = nil
        )
        end
      end


      struct CreateNamedQueryInput
        include JSON::Serializable

        # The database to which the query belongs.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The query name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The contents of the query with all query statements.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # A unique case-sensitive string used to ensure the request to create the query is idempotent
        # (executes only once). If another CreateNamedQuery request is received, the same response is returned
        # and another query is not created. If a parameter has changed, for example, the QueryString , an
        # error is returned. This token is listed as not required because Amazon Web Services SDKs (for
        # example the Amazon Web Services SDK for Java) auto-generate the token for users. If you are not
        # using the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token or the
        # action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The query description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the workgroup in which the named query is being created.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @database : String,
          @name : String,
          @query_string : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct CreateNamedQueryOutput
        include JSON::Serializable

        # The unique ID of the query.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String?

        def initialize(
          @named_query_id : String? = nil
        )
        end
      end


      struct CreateNotebookInput
        include JSON::Serializable

        # The name of the ipynb file to be created in the Spark workgroup, without the .ipynb extension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the Spark enabled workgroup in which the notebook will be created.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # A unique case-sensitive string used to ensure the request to create the notebook is idempotent
        # (executes only once). This token is listed as not required because Amazon Web Services SDKs (for
        # example the Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using
        # the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token or the
        # action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @name : String,
          @work_group : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct CreateNotebookOutput
        include JSON::Serializable

        # A unique identifier for the notebook.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String?

        def initialize(
          @notebook_id : String? = nil
        )
        end
      end


      struct CreatePreparedStatementInput
        include JSON::Serializable

        # The query string for the prepared statement.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String

        # The name of the prepared statement.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String

        # The name of the workgroup to which the prepared statement belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # The description of the prepared statement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @query_statement : String,
          @statement_name : String,
          @work_group : String,
          @description : String? = nil
        )
        end
      end


      struct CreatePreparedStatementOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct CreatePresignedNotebookUrlRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct CreatePresignedNotebookUrlResponse
        include JSON::Serializable

        # The authentication token for the notebook.

        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String

        # The UTC epoch time when the authentication token expires.

        @[JSON::Field(key: "AuthTokenExpirationTime")]
        getter auth_token_expiration_time : Int64

        # The URL of the notebook. The URL includes the authentication token and notebook file name and points
        # directly to the opened notebook.

        @[JSON::Field(key: "NotebookUrl")]
        getter notebook_url : String

        def initialize(
          @auth_token : String,
          @auth_token_expiration_time : Int64,
          @notebook_url : String
        )
        end
      end


      struct CreateWorkGroupInput
        include JSON::Serializable

        # The workgroup name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Contains configuration information for creating an Athena SQL workgroup or Spark enabled Athena
        # workgroup. Athena SQL workgroup configuration includes the location in Amazon S3 where query and
        # calculation results are stored, the encryption configuration, if any, used for encrypting query
        # results, whether the Amazon CloudWatch Metrics are enabled for the workgroup, the limit for the
        # amount of bytes scanned (cutoff) per query, if it is specified, and whether workgroup's settings
        # (specified with EnforceWorkGroupConfiguration ) in the WorkGroupConfiguration override client-side
        # settings. See WorkGroupConfiguration$EnforceWorkGroupConfiguration .

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::WorkGroupConfiguration?

        # The workgroup description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of comma separated tags to add to the workgroup that is created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @configuration : Types::WorkGroupConfiguration? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWorkGroupOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the customer managed KMS key that is used to encrypt the user's data stores in Athena.
      # When an Amazon Web Services managed key is used, this value is null. This setting does not apply to
      # Athena SQL workgroups.

      struct CustomerContentEncryptionConfiguration
        include JSON::Serializable

        # The customer managed KMS key that is used to encrypt the user's data stores in Athena.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String

        def initialize(
          @kms_key : String
        )
        end
      end

      # Contains information about a data catalog in an Amazon Web Services account. In the Athena console,
      # data catalogs are listed as "data sources" on the Data sources page under the Data source name
      # column.

      struct DataCatalog
        include JSON::Serializable

        # The name of the data catalog. The catalog name must be unique for the Amazon Web Services account
        # and can use a maximum of 127 alphanumeric, underscore, at sign, or hyphen characters. The remainder
        # of the length constraint of 256 is reserved for use by Athena.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of data catalog to create: LAMBDA for a federated catalog, GLUE for an Glue Data Catalog,
        # and HIVE for an external Apache Hive metastore. FEDERATED is a federated catalog for which Athena
        # creates the connection and the Lambda function for you based on the parameters that you pass.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The type of connection for a FEDERATED data catalog (for example, REDSHIFT , MYSQL , or SQLSERVER ).
        # For information about individual connectors, see Available data source connectors .

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String?

        # An optional description of the data catalog.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Text of the error that occurred during data catalog creation or deletion.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # Specifies the Lambda function or functions to use for the data catalog. This is a mapping whose
        # values depend on the catalog type. For the HIVE data catalog type, use the following syntax. The
        # metadata-function parameter is required. The sdk-version parameter is optional and defaults to the
        # currently supported version. metadata-function= lambda_arn , sdk-version= version_number For the
        # LAMBDA data catalog type, use one of the following sets of required parameters, but not both. If you
        # have one Lambda function that processes metadata and another for reading the actual data, use the
        # following syntax. Both parameters are required. metadata-function= lambda_arn , record-function=
        # lambda_arn If you have a composite Lambda function that processes both metadata and data, use the
        # following syntax to specify your Lambda function. function= lambda_arn The GLUE type takes a catalog
        # ID parameter and is required. The catalog_id is the account ID of the Amazon Web Services account to
        # which the Glue catalog belongs. catalog-id= catalog_id The GLUE data catalog type also applies to
        # the default AwsDataCatalog that already exists in your account, of which you can have only one and
        # cannot modify. The FEDERATED data catalog type uses one of the following parameters, but not both.
        # Use connection-arn for an existing Glue connection. Use connection-type and connection-properties to
        # specify the configuration setting for a new connection. connection-arn:
        # &lt;glue_connection_arn_to_reuse&gt; connection-type:MYSQL|REDSHIFT|...., connection-properties:"
        # &lt;json_string&gt; " For &lt;json_string&gt; , use escaped JSON text, as in the following example.
        # "{\"spill_bucket\":\"my_spill\",\"spill_prefix\":\"athena-spill\",\"host\":\"abc12345.snowflakecomputing.com\",\"port\":\"1234\",\"warehouse\":\"DEV_WH\",\"database\":\"TEST\",\"schema\":\"PUBLIC\",\"SecretArn\":\"arn:aws:secretsmanager:ap-south-1:111122223333:secret:snowflake-XHb67j\"}"

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The status of the creation or deletion of the data catalog. The LAMBDA , GLUE , and HIVE data
        # catalog types are created synchronously. Their status is either CREATE_COMPLETE or CREATE_FAILED .
        # The FEDERATED data catalog type is created asynchronously. Data catalog creation status:
        # CREATE_IN_PROGRESS : Federated data catalog creation in progress. CREATE_COMPLETE : Data catalog
        # creation complete. CREATE_FAILED : Data catalog could not be created.
        # CREATE_FAILED_CLEANUP_IN_PROGRESS : Federated data catalog creation failed and is being removed.
        # CREATE_FAILED_CLEANUP_COMPLETE : Federated data catalog creation failed and was removed.
        # CREATE_FAILED_CLEANUP_FAILED : Federated data catalog creation failed but could not be removed. Data
        # catalog deletion status: DELETE_IN_PROGRESS : Federated data catalog deletion in progress.
        # DELETE_COMPLETE : Federated data catalog deleted. DELETE_FAILED : Federated data catalog could not
        # be deleted.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @name : String,
          @type : String,
          @connection_type : String? = nil,
          @description : String? = nil,
          @error : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The summary information for the data catalog, which includes its name and type.

      struct DataCatalogSummary
        include JSON::Serializable

        # The name of the data catalog. The catalog name is unique for the Amazon Web Services account and can
        # use a maximum of 127 alphanumeric, underscore, at sign, or hyphen characters. The remainder of the
        # length constraint of 256 is reserved for use by Athena.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String?

        # The type of connection for a FEDERATED data catalog (for example, REDSHIFT , MYSQL , or SQLSERVER ).
        # For information about individual connectors, see Available data source connectors .

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String?

        # Text of the error that occurred during data catalog creation or deletion.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The status of the creation or deletion of the data catalog. The LAMBDA , GLUE , and HIVE data
        # catalog types are created synchronously. Their status is either CREATE_COMPLETE or CREATE_FAILED .
        # The FEDERATED data catalog type is created asynchronously. Data catalog creation status:
        # CREATE_IN_PROGRESS : Federated data catalog creation in progress. CREATE_COMPLETE : Data catalog
        # creation complete. CREATE_FAILED : Data catalog could not be created.
        # CREATE_FAILED_CLEANUP_IN_PROGRESS : Federated data catalog creation failed and is being removed.
        # CREATE_FAILED_CLEANUP_COMPLETE : Federated data catalog creation failed and was removed.
        # CREATE_FAILED_CLEANUP_FAILED : Federated data catalog creation failed but could not be removed. Data
        # catalog deletion status: DELETE_IN_PROGRESS : Federated data catalog deletion in progress.
        # DELETE_COMPLETE : Federated data catalog deleted. DELETE_FAILED : Federated data catalog could not
        # be deleted.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The data catalog type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @catalog_name : String? = nil,
          @connection_type : String? = nil,
          @error : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains metadata information for a database in a data catalog.

      struct Database
        include JSON::Serializable

        # The name of the database.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An optional description of the database.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of custom key/value pairs.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # A piece of data (a field in the table).

      struct Datum
        include JSON::Serializable

        # The value of the datum.

        @[JSON::Field(key: "VarCharValue")]
        getter var_char_value : String?

        def initialize(
          @var_char_value : String? = nil
        )
        end
      end


      struct DeleteCapacityReservationInput
        include JSON::Serializable

        # The name of the capacity reservation to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteCapacityReservationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataCatalogInput
        include JSON::Serializable

        # The name of the data catalog to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Deletes the Athena Data Catalog. You can only use this with the FEDERATED catalogs. You usually
        # perform this before registering the connector with Glue Data Catalog. After deletion, you will have
        # to manage the Glue Connection and Lambda function.

        @[JSON::Field(key: "DeleteCatalogOnly")]
        getter delete_catalog_only : Bool?

        def initialize(
          @name : String,
          @delete_catalog_only : Bool? = nil
        )
        end
      end


      struct DeleteDataCatalogOutput
        include JSON::Serializable


        @[JSON::Field(key: "DataCatalog")]
        getter data_catalog : Types::DataCatalog?

        def initialize(
          @data_catalog : Types::DataCatalog? = nil
        )
        end
      end


      struct DeleteNamedQueryInput
        include JSON::Serializable

        # The unique ID of the query to delete.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String

        def initialize(
          @named_query_id : String
        )
        end
      end


      struct DeleteNamedQueryOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteNotebookInput
        include JSON::Serializable

        # The ID of the notebook to delete.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        def initialize(
          @notebook_id : String
        )
        end
      end


      struct DeleteNotebookOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePreparedStatementInput
        include JSON::Serializable

        # The name of the prepared statement to delete.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String

        # The workgroup to which the statement to be deleted belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        def initialize(
          @statement_name : String,
          @work_group : String
        )
        end
      end


      struct DeletePreparedStatementOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkGroupInput
        include JSON::Serializable

        # The unique name of the workgroup to delete.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # The option to delete the workgroup and its contents even if the workgroup contains any named
        # queries, query executions, or notebooks.

        @[JSON::Field(key: "RecursiveDeleteOption")]
        getter recursive_delete_option : Bool?

        def initialize(
          @work_group : String,
          @recursive_delete_option : Bool? = nil
        )
        end
      end


      struct DeleteWorkGroupOutput
        include JSON::Serializable

        def initialize
        end
      end

      # If query and calculation results are encrypted in Amazon S3, indicates the encryption option used
      # (for example, SSE_KMS or CSE_KMS ) and key information.

      struct EncryptionConfiguration
        include JSON::Serializable

        # Indicates whether Amazon S3 server-side encryption with Amazon S3-managed keys ( SSE_S3 ),
        # server-side encryption with KMS-managed keys ( SSE_KMS ), or client-side encryption with KMS-managed
        # keys ( CSE_KMS ) is used. If a query runs in a workgroup and the workgroup overrides client-side
        # settings, then the workgroup's setting for encryption is used. It specifies whether query results
        # must be encrypted, for all queries that run in this workgroup.

        @[JSON::Field(key: "EncryptionOption")]
        getter encryption_option : String

        # For SSE_KMS and CSE_KMS , this is the KMS key ARN or ID.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        def initialize(
          @encryption_option : String,
          @kms_key : String? = nil
        )
        end
      end

      # Contains data processing unit (DPU) configuration settings and parameter mappings for a notebook
      # engine.

      struct EngineConfiguration
        include JSON::Serializable

        # Contains additional notebook engine MAP&lt;string, string&gt; parameter mappings in the form of
        # key-value pairs. To specify an Athena notebook that the Jupyter server will download and serve,
        # specify a value for the StartSessionRequest$NotebookVersion field, and then add a key named
        # NotebookId to AdditionalConfigs that has the value of the Athena notebook ID.

        @[JSON::Field(key: "AdditionalConfigs")]
        getter additional_configs : Hash(String, String)?

        # The configuration classifications that can be specified for the engine.

        @[JSON::Field(key: "Classifications")]
        getter classifications : Array(Types::Classification)?

        # The number of DPUs to use for the coordinator. A coordinator is a special executor that orchestrates
        # processing work and manages other executors in a notebook session. The default is 1.

        @[JSON::Field(key: "CoordinatorDpuSize")]
        getter coordinator_dpu_size : Int32?

        # The default number of DPUs to use for executors. An executor is the smallest unit of compute that a
        # notebook session can request from Athena. The default is 1.

        @[JSON::Field(key: "DefaultExecutorDpuSize")]
        getter default_executor_dpu_size : Int32?

        # The maximum number of DPUs that can run concurrently.

        @[JSON::Field(key: "MaxConcurrentDpus")]
        getter max_concurrent_dpus : Int32?

        # Specifies custom jar files and Spark properties for use cases like cluster encryption, table
        # formats, and general Spark tuning.

        @[JSON::Field(key: "SparkProperties")]
        getter spark_properties : Hash(String, String)?

        def initialize(
          @additional_configs : Hash(String, String)? = nil,
          @classifications : Array(Types::Classification)? = nil,
          @coordinator_dpu_size : Int32? = nil,
          @default_executor_dpu_size : Int32? = nil,
          @max_concurrent_dpus : Int32? = nil,
          @spark_properties : Hash(String, String)? = nil
        )
        end
      end

      # The Athena engine version for running queries, or the PySpark engine version for running sessions.

      struct EngineVersion
        include JSON::Serializable

        # Read only. The engine version on which the query runs. If the user requests a valid engine version
        # other than Auto, the effective engine version is the same as the engine version that the user
        # requested. If the user requests Auto, the effective engine version is chosen by Athena. When a
        # request to update the engine version is made by a CreateWorkGroup or UpdateWorkGroup operation, the
        # EffectiveEngineVersion field is ignored.

        @[JSON::Field(key: "EffectiveEngineVersion")]
        getter effective_engine_version : String?

        # The engine version requested by the user. Possible values are determined by the output of
        # ListEngineVersions , including AUTO. The default is AUTO.

        @[JSON::Field(key: "SelectedEngineVersion")]
        getter selected_engine_version : String?

        def initialize(
          @effective_engine_version : String? = nil,
          @selected_engine_version : String? = nil
        )
        end
      end

      # Contains summary information about an executor.

      struct ExecutorsSummary
        include JSON::Serializable

        # The UUID of the executor.

        @[JSON::Field(key: "ExecutorId")]
        getter executor_id : String

        # The smallest unit of compute that a session can request from Athena. Size is measured in data
        # processing unit (DPU) values, a relative measure of processing power.

        @[JSON::Field(key: "ExecutorSize")]
        getter executor_size : Int64?

        # The processing state of the executor. A description of each state follows. CREATING - The executor
        # is being started, including acquiring resources. CREATED - The executor has been started. REGISTERED
        # - The executor has been registered. TERMINATING - The executor is in the process of shutting down.
        # TERMINATED - The executor is no longer running. FAILED - Due to a failure, the executor is no longer
        # running.

        @[JSON::Field(key: "ExecutorState")]
        getter executor_state : String?

        # The type of executor used for the application ( COORDINATOR , GATEWAY , or WORKER ).

        @[JSON::Field(key: "ExecutorType")]
        getter executor_type : String?

        # The date and time that the executor started.

        @[JSON::Field(key: "StartDateTime")]
        getter start_date_time : Int64?

        # The date and time that the executor was terminated.

        @[JSON::Field(key: "TerminationDateTime")]
        getter termination_date_time : Int64?

        def initialize(
          @executor_id : String,
          @executor_size : Int64? = nil,
          @executor_state : String? = nil,
          @executor_type : String? = nil,
          @start_date_time : Int64? = nil,
          @termination_date_time : Int64? = nil
        )
        end
      end


      struct ExportNotebookInput
        include JSON::Serializable

        # The ID of the notebook to export.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        def initialize(
          @notebook_id : String
        )
        end
      end


      struct ExportNotebookOutput
        include JSON::Serializable

        # The notebook metadata, including notebook ID, notebook name, and workgroup name.

        @[JSON::Field(key: "NotebookMetadata")]
        getter notebook_metadata : Types::NotebookMetadata?

        # The content of the exported notebook.

        @[JSON::Field(key: "Payload")]
        getter payload : String?

        def initialize(
          @notebook_metadata : Types::NotebookMetadata? = nil,
          @payload : String? = nil
        )
        end
      end

      # A string for searching notebook names.

      struct FilterDefinition
        include JSON::Serializable

        # The name of the notebook to search for.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct GetCalculationExecutionCodeRequest
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String

        def initialize(
          @calculation_execution_id : String
        )
        end
      end


      struct GetCalculationExecutionCodeResponse
        include JSON::Serializable

        # The unencrypted code that was executed for the calculation.

        @[JSON::Field(key: "CodeBlock")]
        getter code_block : String?

        def initialize(
          @code_block : String? = nil
        )
        end
      end


      struct GetCalculationExecutionRequest
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String

        def initialize(
          @calculation_execution_id : String
        )
        end
      end


      struct GetCalculationExecutionResponse
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String?

        # The description of the calculation execution.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Contains result information. This field is populated only if the calculation is completed.

        @[JSON::Field(key: "Result")]
        getter result : Types::CalculationResult?

        # The session ID that the calculation ran in.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # Contains information about the data processing unit (DPU) execution time and progress. This field is
        # populated only when statistics are available.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::CalculationStatistics?

        # Contains information about the status of the calculation.

        @[JSON::Field(key: "Status")]
        getter status : Types::CalculationStatus?

        # The Amazon S3 location in which calculation results are stored.

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @calculation_execution_id : String? = nil,
          @description : String? = nil,
          @result : Types::CalculationResult? = nil,
          @session_id : String? = nil,
          @statistics : Types::CalculationStatistics? = nil,
          @status : Types::CalculationStatus? = nil,
          @working_directory : String? = nil
        )
        end
      end


      struct GetCalculationExecutionStatusRequest
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String

        def initialize(
          @calculation_execution_id : String
        )
        end
      end


      struct GetCalculationExecutionStatusResponse
        include JSON::Serializable

        # Contains information about the DPU execution time and progress.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::CalculationStatistics?

        # Contains information about the calculation execution status.

        @[JSON::Field(key: "Status")]
        getter status : Types::CalculationStatus?

        def initialize(
          @statistics : Types::CalculationStatistics? = nil,
          @status : Types::CalculationStatus? = nil
        )
        end
      end


      struct GetCapacityAssignmentConfigurationInput
        include JSON::Serializable

        # The name of the capacity reservation to retrieve the capacity assignment configuration for.

        @[JSON::Field(key: "CapacityReservationName")]
        getter capacity_reservation_name : String

        def initialize(
          @capacity_reservation_name : String
        )
        end
      end


      struct GetCapacityAssignmentConfigurationOutput
        include JSON::Serializable

        # The requested capacity assignment configuration for the specified capacity reservation.

        @[JSON::Field(key: "CapacityAssignmentConfiguration")]
        getter capacity_assignment_configuration : Types::CapacityAssignmentConfiguration

        def initialize(
          @capacity_assignment_configuration : Types::CapacityAssignmentConfiguration
        )
        end
      end


      struct GetCapacityReservationInput
        include JSON::Serializable

        # The name of the capacity reservation.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetCapacityReservationOutput
        include JSON::Serializable

        # The requested capacity reservation structure.

        @[JSON::Field(key: "CapacityReservation")]
        getter capacity_reservation : Types::CapacityReservation

        def initialize(
          @capacity_reservation : Types::CapacityReservation
        )
        end
      end


      struct GetDataCatalogInput
        include JSON::Serializable

        # The name of the data catalog to return.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the workgroup. Required if making an IAM Identity Center request.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @name : String,
          @work_group : String? = nil
        )
        end
      end


      struct GetDataCatalogOutput
        include JSON::Serializable

        # The data catalog returned.

        @[JSON::Field(key: "DataCatalog")]
        getter data_catalog : Types::DataCatalog?

        def initialize(
          @data_catalog : Types::DataCatalog? = nil
        )
        end
      end


      struct GetDatabaseInput
        include JSON::Serializable

        # The name of the data catalog that contains the database to return.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String

        # The name of the database to return.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the workgroup for which the metadata is being fetched. Required if requesting an IAM
        # Identity Center enabled Glue Data Catalog.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @catalog_name : String,
          @database_name : String,
          @work_group : String? = nil
        )
        end
      end


      struct GetDatabaseOutput
        include JSON::Serializable

        # The database returned.

        @[JSON::Field(key: "Database")]
        getter database : Types::Database?

        def initialize(
          @database : Types::Database? = nil
        )
        end
      end


      struct GetNamedQueryInput
        include JSON::Serializable

        # The unique ID of the query. Use ListNamedQueries to get query IDs.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String

        def initialize(
          @named_query_id : String
        )
        end
      end


      struct GetNamedQueryOutput
        include JSON::Serializable

        # Information about the query.

        @[JSON::Field(key: "NamedQuery")]
        getter named_query : Types::NamedQuery?

        def initialize(
          @named_query : Types::NamedQuery? = nil
        )
        end
      end


      struct GetNotebookMetadataInput
        include JSON::Serializable

        # The ID of the notebook whose metadata is to be retrieved.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        def initialize(
          @notebook_id : String
        )
        end
      end


      struct GetNotebookMetadataOutput
        include JSON::Serializable

        # The metadata that is returned for the specified notebook ID.

        @[JSON::Field(key: "NotebookMetadata")]
        getter notebook_metadata : Types::NotebookMetadata?

        def initialize(
          @notebook_metadata : Types::NotebookMetadata? = nil
        )
        end
      end


      struct GetPreparedStatementInput
        include JSON::Serializable

        # The name of the prepared statement to retrieve.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String

        # The workgroup to which the statement to be retrieved belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        def initialize(
          @statement_name : String,
          @work_group : String
        )
        end
      end


      struct GetPreparedStatementOutput
        include JSON::Serializable

        # The name of the prepared statement that was retrieved.

        @[JSON::Field(key: "PreparedStatement")]
        getter prepared_statement : Types::PreparedStatement?

        def initialize(
          @prepared_statement : Types::PreparedStatement? = nil
        )
        end
      end


      struct GetQueryExecutionInput
        include JSON::Serializable

        # The unique ID of the query execution.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String

        def initialize(
          @query_execution_id : String
        )
        end
      end


      struct GetQueryExecutionOutput
        include JSON::Serializable

        # Information about the query execution.

        @[JSON::Field(key: "QueryExecution")]
        getter query_execution : Types::QueryExecution?

        def initialize(
          @query_execution : Types::QueryExecution? = nil
        )
        end
      end


      struct GetQueryResultsInput
        include JSON::Serializable

        # The unique ID of the query execution.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String

        # The maximum number of results (rows) to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # When you set this to DATA_ROWS or empty, GetQueryResults returns the query results in rows. If set
        # to DATA_MANIFEST , it returns the manifest file in rows. Only the query types CREATE TABLE AS SELECT
        # , UNLOAD , and INSERT can generate a manifest file. If you use DATA_MANIFEST for other query types,
        # the query will fail.

        @[JSON::Field(key: "QueryResultType")]
        getter query_result_type : String?

        def initialize(
          @query_execution_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @query_result_type : String? = nil
        )
        end
      end


      struct GetQueryResultsOutput
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The results of the query execution.

        @[JSON::Field(key: "ResultSet")]
        getter result_set : Types::ResultSet?

        # The number of rows inserted with a CREATE TABLE AS SELECT , INSERT INTO , or UPDATE statement.

        @[JSON::Field(key: "UpdateCount")]
        getter update_count : Int64?

        def initialize(
          @next_token : String? = nil,
          @result_set : Types::ResultSet? = nil,
          @update_count : Int64? = nil
        )
        end
      end


      struct GetQueryRuntimeStatisticsInput
        include JSON::Serializable

        # The unique ID of the query execution.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String

        def initialize(
          @query_execution_id : String
        )
        end
      end


      struct GetQueryRuntimeStatisticsOutput
        include JSON::Serializable

        # Runtime statistics about the query execution.

        @[JSON::Field(key: "QueryRuntimeStatistics")]
        getter query_runtime_statistics : Types::QueryRuntimeStatistics?

        def initialize(
          @query_runtime_statistics : Types::QueryRuntimeStatistics? = nil
        )
        end
      end


      struct GetResourceDashboardRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) for a session.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourceDashboardResponse
        include JSON::Serializable

        # The Live UI/Persistence UI url for a session.

        @[JSON::Field(key: "Url")]
        getter url : String

        def initialize(
          @url : String
        )
        end
      end


      struct GetSessionEndpointRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct GetSessionEndpointResponse
        include JSON::Serializable

        # Authentication token for the connection

        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String

        # Expiration time of the auth token.

        @[JSON::Field(key: "AuthTokenExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter auth_token_expiration_time : Time

        # The endpoint for connecting to the session.

        @[JSON::Field(key: "EndpointUrl")]
        getter endpoint_url : String

        def initialize(
          @auth_token : String,
          @auth_token_expiration_time : Time,
          @endpoint_url : String
        )
        end
      end


      struct GetSessionRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct GetSessionResponse
        include JSON::Serializable

        # The session description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Contains engine configuration information like DPU usage.

        @[JSON::Field(key: "EngineConfiguration")]
        getter engine_configuration : Types::EngineConfiguration?

        # The engine version used by the session (for example, PySpark engine version 3 ). You can get a list
        # of engine versions by calling ListEngineVersions .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?


        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # The notebook version.

        @[JSON::Field(key: "NotebookVersion")]
        getter notebook_version : String?

        # Contains the workgroup configuration information used by the session.

        @[JSON::Field(key: "SessionConfiguration")]
        getter session_configuration : Types::SessionConfiguration?

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # Contains the DPU execution time.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::SessionStatistics?

        # Contains information about the status of the session.

        @[JSON::Field(key: "Status")]
        getter status : Types::SessionStatus?

        # The workgroup to which the session belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @description : String? = nil,
          @engine_configuration : Types::EngineConfiguration? = nil,
          @engine_version : String? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @notebook_version : String? = nil,
          @session_configuration : Types::SessionConfiguration? = nil,
          @session_id : String? = nil,
          @statistics : Types::SessionStatistics? = nil,
          @status : Types::SessionStatus? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct GetSessionStatusRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct GetSessionStatusResponse
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # Contains information about the status of the session.

        @[JSON::Field(key: "Status")]
        getter status : Types::SessionStatus?

        def initialize(
          @session_id : String? = nil,
          @status : Types::SessionStatus? = nil
        )
        end
      end


      struct GetTableMetadataInput
        include JSON::Serializable

        # The name of the data catalog that contains the database and table metadata to return.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String

        # The name of the database that contains the table metadata to return.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the table for which metadata is returned.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The name of the workgroup for which the metadata is being fetched. Required if requesting an IAM
        # Identity Center enabled Glue Data Catalog.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @catalog_name : String,
          @database_name : String,
          @table_name : String,
          @work_group : String? = nil
        )
        end
      end


      struct GetTableMetadataOutput
        include JSON::Serializable

        # An object that contains table metadata.

        @[JSON::Field(key: "TableMetadata")]
        getter table_metadata : Types::TableMetadata?

        def initialize(
          @table_metadata : Types::TableMetadata? = nil
        )
        end
      end


      struct GetWorkGroupInput
        include JSON::Serializable

        # The name of the workgroup.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        def initialize(
          @work_group : String
        )
        end
      end


      struct GetWorkGroupOutput
        include JSON::Serializable

        # Information about the workgroup.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : Types::WorkGroup?

        def initialize(
          @work_group : Types::WorkGroup? = nil
        )
        end
      end

      # Specifies whether the workgroup is IAM Identity Center supported.

      struct IdentityCenterConfiguration
        include JSON::Serializable

        # Specifies whether the workgroup is IAM Identity Center supported.

        @[JSON::Field(key: "EnableIdentityCenter")]
        getter enable_identity_center : Bool?

        # The IAM Identity Center instance ARN that the workgroup associates to.

        @[JSON::Field(key: "IdentityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        def initialize(
          @enable_identity_center : Bool? = nil,
          @identity_center_instance_arn : String? = nil
        )
        end
      end


      struct ImportNotebookInput
        include JSON::Serializable

        # The name of the notebook to import.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The notebook content type. Currently, the only valid type is IPYNB .

        @[JSON::Field(key: "Type")]
        getter type : String

        # The name of the Spark enabled workgroup to import the notebook to.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # A unique case-sensitive string used to ensure the request to import the notebook is idempotent
        # (executes only once). This token is listed as not required because Amazon Web Services SDKs (for
        # example the Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using
        # the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token or the
        # action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A URI that specifies the Amazon S3 location of a notebook file in ipynb format.

        @[JSON::Field(key: "NotebookS3LocationUri")]
        getter notebook_s3_location_uri : String?

        # The notebook content to be imported. The payload must be in ipynb format.

        @[JSON::Field(key: "Payload")]
        getter payload : String?

        def initialize(
          @name : String,
          @type : String,
          @work_group : String,
          @client_request_token : String? = nil,
          @notebook_s3_location_uri : String? = nil,
          @payload : String? = nil
        )
        end
      end


      struct ImportNotebookOutput
        include JSON::Serializable

        # The ID assigned to the imported notebook.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String?

        def initialize(
          @notebook_id : String? = nil
        )
        end
      end

      # Indicates a platform issue, which may be due to a transient condition or outage.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that something is wrong with the input to the request. For example, a required parameter
      # may be missing or out of range.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "AthenaErrorCode")]
        getter athena_error_code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @athena_error_code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct ListApplicationDPUSizesInput
        include JSON::Serializable

        # Specifies the maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationDPUSizesOutput
        include JSON::Serializable

        # A list of the supported DPU sizes that the application runtime supports.

        @[JSON::Field(key: "ApplicationDPUSizes")]
        getter application_dpu_sizes : Array(Types::ApplicationDPUSizes)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_dpu_sizes : Array(Types::ApplicationDPUSizes)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCalculationExecutionsRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # The maximum number of calculation executions to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A filter for a specific calculation execution state. A description of each state follows. CREATING -
        # The calculation is in the process of being created. CREATED - The calculation has been created and
        # is ready to run. QUEUED - The calculation has been queued for processing. RUNNING - The calculation
        # is running. CANCELING - A request to cancel the calculation has been received and the system is
        # working to stop it. CANCELED - The calculation is no longer running as the result of a cancel
        # request. COMPLETED - The calculation has completed without error. FAILED - The calculation failed
        # and is no longer running.

        @[JSON::Field(key: "StateFilter")]
        getter state_filter : String?

        def initialize(
          @session_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_filter : String? = nil
        )
        end
      end


      struct ListCalculationExecutionsResponse
        include JSON::Serializable

        # A list of CalculationSummary objects.

        @[JSON::Field(key: "Calculations")]
        getter calculations : Array(Types::CalculationSummary)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @calculations : Array(Types::CalculationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCapacityReservationsInput
        include JSON::Serializable

        # Specifies the maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCapacityReservationsOutput
        include JSON::Serializable

        # The capacity reservations for the current account.

        @[JSON::Field(key: "CapacityReservations")]
        getter capacity_reservations : Array(Types::CapacityReservation)

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @capacity_reservations : Array(Types::CapacityReservation),
          @next_token : String? = nil
        )
        end
      end


      struct ListDataCatalogsInput
        include JSON::Serializable

        # Specifies the maximum number of data catalogs to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the workgroup. Required if making an IAM Identity Center request.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct ListDataCatalogsOutput
        include JSON::Serializable

        # A summary list of data catalogs.

        @[JSON::Field(key: "DataCatalogsSummary")]
        getter data_catalogs_summary : Array(Types::DataCatalogSummary)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_catalogs_summary : Array(Types::DataCatalogSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatabasesInput
        include JSON::Serializable

        # The name of the data catalog that contains the databases to return.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String

        # Specifies the maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the workgroup for which the metadata is being fetched. Required if requesting an IAM
        # Identity Center enabled Glue Data Catalog.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @catalog_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct ListDatabasesOutput
        include JSON::Serializable

        # A list of databases from a data catalog.

        @[JSON::Field(key: "DatabaseList")]
        getter database_list : Array(Types::Database)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @database_list : Array(Types::Database)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEngineVersionsInput
        include JSON::Serializable

        # The maximum number of engine versions to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEngineVersionsOutput
        include JSON::Serializable

        # A list of engine versions that are available to choose from.

        @[JSON::Field(key: "EngineVersions")]
        getter engine_versions : Array(Types::EngineVersion)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engine_versions : Array(Types::EngineVersion)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutorsRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # A filter for a specific executor state. A description of each state follows. CREATING - The executor
        # is being started, including acquiring resources. CREATED - The executor has been started. REGISTERED
        # - The executor has been registered. TERMINATING - The executor is in the process of shutting down.
        # TERMINATED - The executor is no longer running. FAILED - Due to a failure, the executor is no longer
        # running.

        @[JSON::Field(key: "ExecutorStateFilter")]
        getter executor_state_filter : String?

        # The maximum number of executors to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @session_id : String,
          @executor_state_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutorsResponse
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # Contains summary information about the executor.

        @[JSON::Field(key: "ExecutorsSummary")]
        getter executors_summary : Array(Types::ExecutorsSummary)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @session_id : String,
          @executors_summary : Array(Types::ExecutorsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNamedQueriesInput
        include JSON::Serializable

        # The maximum number of queries to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the workgroup from which the named queries are being returned. If a workgroup is not
        # specified, the saved queries for the primary workgroup are returned.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct ListNamedQueriesOutput
        include JSON::Serializable

        # The list of unique query IDs.

        @[JSON::Field(key: "NamedQueryIds")]
        getter named_query_ids : Array(String)?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @named_query_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotebookMetadataInput
        include JSON::Serializable

        # The name of the Spark enabled workgroup to retrieve notebook metadata for.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # Search filter string.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::FilterDefinition?

        # Specifies the maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @work_group : String,
          @filters : Types::FilterDefinition? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotebookMetadataOutput
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of notebook metadata for the specified workgroup.

        @[JSON::Field(key: "NotebookMetadataList")]
        getter notebook_metadata_list : Array(Types::NotebookMetadata)?

        def initialize(
          @next_token : String? = nil,
          @notebook_metadata_list : Array(Types::NotebookMetadata)? = nil
        )
        end
      end


      struct ListNotebookSessionsRequest
        include JSON::Serializable

        # The ID of the notebook to list sessions for.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        # The maximum number of notebook sessions to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @notebook_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotebookSessionsResponse
        include JSON::Serializable

        # A list of the sessions belonging to the notebook.

        @[JSON::Field(key: "NotebookSessionsList")]
        getter notebook_sessions_list : Array(Types::NotebookSessionSummary)

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @notebook_sessions_list : Array(Types::NotebookSessionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPreparedStatementsInput
        include JSON::Serializable

        # The workgroup to list the prepared statements for.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # The maximum number of results to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @work_group : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPreparedStatementsOutput
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of prepared statements for the workgroup.

        @[JSON::Field(key: "PreparedStatements")]
        getter prepared_statements : Array(Types::PreparedStatementSummary)?

        def initialize(
          @next_token : String? = nil,
          @prepared_statements : Array(Types::PreparedStatementSummary)? = nil
        )
        end
      end


      struct ListQueryExecutionsInput
        include JSON::Serializable

        # The maximum number of query executions to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the workgroup from which queries are being returned. If a workgroup is not specified, a
        # list of available query execution IDs for the queries in the primary workgroup is returned.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct ListQueryExecutionsOutput
        include JSON::Serializable

        # A token to be used by the next request if this request is truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique IDs of each query execution as an array of strings.

        @[JSON::Field(key: "QueryExecutionIds")]
        getter query_execution_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @query_execution_ids : Array(String)? = nil
        )
        end
      end


      struct ListSessionsRequest
        include JSON::Serializable

        # The workgroup to which the session belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # The maximum number of sessions to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A filter for a specific session state. A description of each state follows. CREATING - The session
        # is being started, including acquiring resources. CREATED - The session has been started. IDLE - The
        # session is able to accept a calculation. BUSY - The session is processing another task and is unable
        # to accept a calculation. TERMINATING - The session is in the process of shutting down. TERMINATED -
        # The session and its resources are no longer running. DEGRADED - The session has no healthy
        # coordinators. FAILED - Due to a failure, the session and its resources are no longer running.

        @[JSON::Field(key: "StateFilter")]
        getter state_filter : String?

        def initialize(
          @work_group : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state_filter : String? = nil
        )
        end
      end


      struct ListSessionsResponse
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of sessions.

        @[JSON::Field(key: "Sessions")]
        getter sessions : Array(Types::SessionSummary)?

        def initialize(
          @next_token : String? = nil,
          @sessions : Array(Types::SessionSummary)? = nil
        )
        end
      end


      struct ListTableMetadataInput
        include JSON::Serializable

        # The name of the data catalog for which table metadata should be returned.

        @[JSON::Field(key: "CatalogName")]
        getter catalog_name : String

        # The name of the database for which table metadata should be returned.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # A regex filter that pattern-matches table names. If no expression is supplied, metadata for all
        # tables are listed.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # Specifies the maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the workgroup for which the metadata is being fetched. Required if requesting an IAM
        # Identity Center enabled Glue Data Catalog.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @catalog_name : String,
          @database_name : String,
          @expression : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct ListTableMetadataOutput
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of table metadata.

        @[JSON::Field(key: "TableMetadataList")]
        getter table_metadata_list : Array(Types::TableMetadata)?

        def initialize(
          @next_token : String? = nil,
          @table_metadata_list : Array(Types::TableMetadata)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # Lists the tags for the resource with the specified ARN.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The maximum number of results to be returned per request that lists the tags for the resource.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null if there are no additional results for this request,
        # where the request lists the tags for the resource with the specified ARN.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A token to be used by the next request if this request is truncated.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of tags associated with the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWorkGroupsInput
        include JSON::Serializable

        # The maximum number of workgroups to return in this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkGroupsOutput
        include JSON::Serializable

        # A token generated by the Athena service that specifies where to continue pagination if a previous
        # request was truncated. To obtain the next set of pages, pass in the NextToken from the response
        # object of the previous page call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of WorkGroupSummary objects that include the names, descriptions, creation times, and states
        # for each workgroup.

        @[JSON::Field(key: "WorkGroups")]
        getter work_groups : Array(Types::WorkGroupSummary)?

        def initialize(
          @next_token : String? = nil,
          @work_groups : Array(Types::WorkGroupSummary)? = nil
        )
        end
      end

      # Configuration settings for delivering logs to Amazon S3 buckets.

      struct ManagedLoggingConfiguration
        include JSON::Serializable

        # Enables mamanged log persistence.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The KMS key ARN to encrypt the logs stored in managed log persistence.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        def initialize(
          @enabled : Bool,
          @kms_key : String? = nil
        )
        end
      end

      # The configuration for storing results in Athena owned storage, which includes whether this feature
      # is enabled; whether encryption configuration, if any, is used for encrypting query results.

      struct ManagedQueryResultsConfiguration
        include JSON::Serializable

        # If set to true, allows you to store query results in Athena owned storage. If set to false,
        # workgroup member stores query results in location specified under ResultConfiguration$OutputLocation
        # . The default is false. A workgroup cannot have the ResultConfiguration$OutputLocation parameter
        # when you set this field to true.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # If you encrypt query and calculation results in Athena owned storage, this field indicates the
        # encryption option (for example, SSE_KMS or CSE_KMS) and key information.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::ManagedQueryResultsEncryptionConfiguration?

        def initialize(
          @enabled : Bool,
          @encryption_configuration : Types::ManagedQueryResultsEncryptionConfiguration? = nil
        )
        end
      end

      # Updates the configuration for managed query results.

      struct ManagedQueryResultsConfigurationUpdates
        include JSON::Serializable

        # If set to true, specifies that Athena manages query results in Athena owned storage.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # If you encrypt query and calculation results in Athena owned storage, this field indicates the
        # encryption option (for example, SSE_KMS or CSE_KMS) and key information.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::ManagedQueryResultsEncryptionConfiguration?

        # If set to true, it removes workgroup from Athena owned storage. The existing query results are
        # cleaned up after 24hrs. You must provide query results in location specified under
        # ResultConfiguration$OutputLocation .

        @[JSON::Field(key: "RemoveEncryptionConfiguration")]
        getter remove_encryption_configuration : Bool?

        def initialize(
          @enabled : Bool? = nil,
          @encryption_configuration : Types::ManagedQueryResultsEncryptionConfiguration? = nil,
          @remove_encryption_configuration : Bool? = nil
        )
        end
      end

      # If you encrypt query and calculation results in Athena owned storage, this field indicates the
      # encryption option (for example, SSE_KMS or CSE_KMS) and key information.

      struct ManagedQueryResultsEncryptionConfiguration
        include JSON::Serializable

        # The ARN of an KMS key for encrypting managed query results.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String

        def initialize(
          @kms_key : String
        )
        end
      end

      # An exception that Athena received when it called a custom metastore. Occurs if the error is not
      # caused by user input ( InvalidRequestException ) or from the Athena platform (
      # InternalServerException ). For example, if a user-created Lambda function is missing permissions,
      # the Lambda 4XX exception is returned in a MetadataException .

      struct MetadataException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the configuration settings for managed log persistence, delivering logs to Amazon S3
      # buckets, Amazon CloudWatch log groups etc.

      struct MonitoringConfiguration
        include JSON::Serializable

        # Configuration settings for delivering logs to Amazon CloudWatch log groups.

        @[JSON::Field(key: "CloudWatchLoggingConfiguration")]
        getter cloud_watch_logging_configuration : Types::CloudWatchLoggingConfiguration?

        # Configuration settings for managed log persistence.

        @[JSON::Field(key: "ManagedLoggingConfiguration")]
        getter managed_logging_configuration : Types::ManagedLoggingConfiguration?

        # Configuration settings for delivering logs to Amazon S3 buckets.

        @[JSON::Field(key: "S3LoggingConfiguration")]
        getter s3_logging_configuration : Types::S3LoggingConfiguration?

        def initialize(
          @cloud_watch_logging_configuration : Types::CloudWatchLoggingConfiguration? = nil,
          @managed_logging_configuration : Types::ManagedLoggingConfiguration? = nil,
          @s3_logging_configuration : Types::S3LoggingConfiguration? = nil
        )
        end
      end

      # A query, where QueryString contains the SQL statements that make up the query.

      struct NamedQuery
        include JSON::Serializable

        # The database to which the query belongs.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The query name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The SQL statements that make up the query.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # The query description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the query.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String?

        # The name of the workgroup that contains the named query.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @database : String,
          @name : String,
          @query_string : String,
          @description : String? = nil,
          @named_query_id : String? = nil,
          @work_group : String? = nil
        )
        end
      end

      # Contains metadata for notebook, including the notebook name, ID, workgroup, and time created.

      struct NotebookMetadata
        include JSON::Serializable

        # The time when the notebook was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The time when the notebook was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the notebook.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The notebook ID.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String?

        # The type of notebook. Currently, the only valid type is IPYNB .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the Spark enabled workgroup to which the notebook belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @notebook_id : String? = nil,
          @type : String? = nil,
          @work_group : String? = nil
        )
        end
      end

      # Contains the notebook session ID and notebook session creation time.

      struct NotebookSessionSummary
        include JSON::Serializable

        # The time when the notebook session was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The notebook session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        def initialize(
          @creation_time : Time? = nil,
          @session_id : String? = nil
        )
        end
      end

      # A prepared SQL statement for use with Athena.

      struct PreparedStatement
        include JSON::Serializable

        # The description of the prepared statement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The last modified time of the prepared statement.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The query string for the prepared statement.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String?

        # The name of the prepared statement.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # The name of the workgroup to which the prepared statement belongs.

        @[JSON::Field(key: "WorkGroupName")]
        getter work_group_name : String?

        def initialize(
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @query_statement : String? = nil,
          @statement_name : String? = nil,
          @work_group_name : String? = nil
        )
        end
      end

      # The name and last modified time of the prepared statement.

      struct PreparedStatementSummary
        include JSON::Serializable

        # The last modified time of the prepared statement.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the prepared statement.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        def initialize(
          @last_modified_time : Time? = nil,
          @statement_name : String? = nil
        )
        end
      end


      struct PutCapacityAssignmentConfigurationInput
        include JSON::Serializable

        # The list of assignments for the capacity assignment configuration.

        @[JSON::Field(key: "CapacityAssignments")]
        getter capacity_assignments : Array(Types::CapacityAssignment)

        # The name of the capacity reservation to put a capacity assignment configuration for.

        @[JSON::Field(key: "CapacityReservationName")]
        getter capacity_reservation_name : String

        def initialize(
          @capacity_assignments : Array(Types::CapacityAssignment),
          @capacity_reservation_name : String
        )
        end
      end


      struct PutCapacityAssignmentConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a single instance of a query execution.

      struct QueryExecution
        include JSON::Serializable

        # The engine version that executed the query.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::EngineVersion?

        # A list of values for the parameters in a query. The values are applied sequentially to the
        # parameters in the query in the order in which the parameters occur. The list of parameters is not
        # returned in the response.

        @[JSON::Field(key: "ExecutionParameters")]
        getter execution_parameters : Array(String)?

        # The configuration for storing results in Athena owned storage, which includes whether this feature
        # is enabled; whether encryption configuration, if any, is used for encrypting query results.

        @[JSON::Field(key: "ManagedQueryResultsConfiguration")]
        getter managed_query_results_configuration : Types::ManagedQueryResultsConfiguration?

        # The SQL query statements which the query execution ran.

        @[JSON::Field(key: "Query")]
        getter query : String?

        # The database in which the query execution occurred.

        @[JSON::Field(key: "QueryExecutionContext")]
        getter query_execution_context : Types::QueryExecutionContext?

        # The unique identifier for each query execution.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String?

        # Specifies whether Amazon S3 access grants are enabled for query results.

        @[JSON::Field(key: "QueryResultsS3AccessGrantsConfiguration")]
        getter query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration?

        # The location in Amazon S3 where query and calculation results are stored and the encryption option,
        # if any, used for query results. These are known as "client-side settings". If workgroup settings
        # override client-side settings, then the query uses the location for the query results and the
        # encryption configuration that are specified for the workgroup.

        @[JSON::Field(key: "ResultConfiguration")]
        getter result_configuration : Types::ResultConfiguration?

        # Specifies the query result reuse behavior that was used for the query.

        @[JSON::Field(key: "ResultReuseConfiguration")]
        getter result_reuse_configuration : Types::ResultReuseConfiguration?

        # The type of query statement that was run. DDL indicates DDL query statements. DML indicates DML
        # (Data Manipulation Language) query statements, such as CREATE TABLE AS SELECT . UTILITY indicates
        # query statements other than DDL and DML, such as SHOW CREATE TABLE , EXPLAIN , DESCRIBE , or SHOW
        # TABLES .

        @[JSON::Field(key: "StatementType")]
        getter statement_type : String?

        # Query execution statistics, such as the amount of data scanned, the amount of time that the query
        # took to process, and the type of statement that was run.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::QueryExecutionStatistics?

        # The completion date, current state, submission time, and state change reason (if applicable) for the
        # query execution.

        @[JSON::Field(key: "Status")]
        getter status : Types::QueryExecutionStatus?

        # The kind of query statement that was run.

        @[JSON::Field(key: "SubstatementType")]
        getter substatement_type : String?

        # The name of the workgroup in which the query ran.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @engine_version : Types::EngineVersion? = nil,
          @execution_parameters : Array(String)? = nil,
          @managed_query_results_configuration : Types::ManagedQueryResultsConfiguration? = nil,
          @query : String? = nil,
          @query_execution_context : Types::QueryExecutionContext? = nil,
          @query_execution_id : String? = nil,
          @query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration? = nil,
          @result_configuration : Types::ResultConfiguration? = nil,
          @result_reuse_configuration : Types::ResultReuseConfiguration? = nil,
          @statement_type : String? = nil,
          @statistics : Types::QueryExecutionStatistics? = nil,
          @status : Types::QueryExecutionStatus? = nil,
          @substatement_type : String? = nil,
          @work_group : String? = nil
        )
        end
      end

      # The database and data catalog context in which the query execution occurs.

      struct QueryExecutionContext
        include JSON::Serializable

        # The name of the data catalog used in the query execution.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # The name of the database used in the query execution. The database must exist in the catalog.

        @[JSON::Field(key: "Database")]
        getter database : String?

        def initialize(
          @catalog : String? = nil,
          @database : String? = nil
        )
        end
      end

      # The amount of data scanned during the query execution and the amount of time that it took to
      # execute, and the type of statement that was run.

      struct QueryExecutionStatistics
        include JSON::Serializable

        # The location and file name of a data manifest file. The manifest file is saved to the Athena query
        # results location in Amazon S3. The manifest file tracks files that the query wrote to Amazon S3. If
        # the query fails, the manifest file also tracks files that the query intended to write. The manifest
        # is useful for identifying orphaned files resulting from a failed query. For more information, see
        # Working with Query Results, Output Files, and Query History in the Amazon Athena User Guide .

        @[JSON::Field(key: "DataManifestLocation")]
        getter data_manifest_location : String?

        # The number of bytes in the data that was queried.

        @[JSON::Field(key: "DataScannedInBytes")]
        getter data_scanned_in_bytes : Int64?

        # The number of Data Processing Units (DPUs) that Athena used to run the query.

        @[JSON::Field(key: "DpuCount")]
        getter dpu_count : Float64?

        # The number of milliseconds that the query took to execute.

        @[JSON::Field(key: "EngineExecutionTimeInMillis")]
        getter engine_execution_time_in_millis : Int64?

        # The number of milliseconds that Athena took to plan the query processing flow. This includes the
        # time spent retrieving table partitions from the data source. Note that because the query engine
        # performs the query planning, query planning time is a subset of engine processing time.

        @[JSON::Field(key: "QueryPlanningTimeInMillis")]
        getter query_planning_time_in_millis : Int64?

        # The number of milliseconds that the query was in your query queue waiting for resources. Note that
        # if transient errors occur, Athena might automatically add the query back to the queue.

        @[JSON::Field(key: "QueryQueueTimeInMillis")]
        getter query_queue_time_in_millis : Int64?

        # Contains information about whether previous query results were reused for the query.

        @[JSON::Field(key: "ResultReuseInformation")]
        getter result_reuse_information : Types::ResultReuseInformation?

        # The number of milliseconds that Athena took to preprocess the query before submitting the query to
        # the query engine.

        @[JSON::Field(key: "ServicePreProcessingTimeInMillis")]
        getter service_pre_processing_time_in_millis : Int64?

        # The number of milliseconds that Athena took to finalize and publish the query results after the
        # query engine finished running the query.

        @[JSON::Field(key: "ServiceProcessingTimeInMillis")]
        getter service_processing_time_in_millis : Int64?

        # The number of milliseconds that Athena took to run the query.

        @[JSON::Field(key: "TotalExecutionTimeInMillis")]
        getter total_execution_time_in_millis : Int64?

        def initialize(
          @data_manifest_location : String? = nil,
          @data_scanned_in_bytes : Int64? = nil,
          @dpu_count : Float64? = nil,
          @engine_execution_time_in_millis : Int64? = nil,
          @query_planning_time_in_millis : Int64? = nil,
          @query_queue_time_in_millis : Int64? = nil,
          @result_reuse_information : Types::ResultReuseInformation? = nil,
          @service_pre_processing_time_in_millis : Int64? = nil,
          @service_processing_time_in_millis : Int64? = nil,
          @total_execution_time_in_millis : Int64? = nil
        )
        end
      end

      # The completion date, current state, submission time, and state change reason (if applicable) for the
      # query execution.

      struct QueryExecutionStatus
        include JSON::Serializable

        # Provides information about an Athena query error.

        @[JSON::Field(key: "AthenaError")]
        getter athena_error : Types::AthenaError?

        # The date and time that the query completed.

        @[JSON::Field(key: "CompletionDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completion_date_time : Time?

        # The state of query execution. QUEUED indicates that the query has been submitted to the service, and
        # Athena will execute the query as soon as resources are available. RUNNING indicates that the query
        # is in execution phase. SUCCEEDED indicates that the query completed without errors. FAILED indicates
        # that the query experienced an error and did not complete processing. CANCELLED indicates that a user
        # input interrupted query execution. For queries that experience certain transient errors, the state
        # transitions from RUNNING back to QUEUED . The FAILED state is always terminal with no automatic
        # retry.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Further detail about the status of the query.

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : String?

        # The date and time that the query was submitted.

        @[JSON::Field(key: "SubmissionDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submission_date_time : Time?

        def initialize(
          @athena_error : Types::AthenaError? = nil,
          @completion_date_time : Time? = nil,
          @state : String? = nil,
          @state_change_reason : String? = nil,
          @submission_date_time : Time? = nil
        )
        end
      end

      # Specifies whether Amazon S3 access grants are enabled for query results.

      struct QueryResultsS3AccessGrantsConfiguration
        include JSON::Serializable

        # The authentication type used for Amazon S3 access grants. Currently, only DIRECTORY_IDENTITY is
        # supported.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String

        # Specifies whether Amazon S3 access grants are enabled for query results.

        @[JSON::Field(key: "EnableS3AccessGrants")]
        getter enable_s3_access_grants : Bool

        # When enabled, appends the user ID as an Amazon S3 path prefix to the query result output location.

        @[JSON::Field(key: "CreateUserLevelPrefix")]
        getter create_user_level_prefix : Bool?

        def initialize(
          @authentication_type : String,
          @enable_s3_access_grants : Bool,
          @create_user_level_prefix : Bool? = nil
        )
        end
      end

      # The query execution timeline, statistics on input and output rows and bytes, and the different query
      # stages that form the query execution plan.

      struct QueryRuntimeStatistics
        include JSON::Serializable

        # Stage statistics such as input and output rows and bytes, execution time, and stage state. This
        # information also includes substages and the query stage plan.

        @[JSON::Field(key: "OutputStage")]
        getter output_stage : Types::QueryStage?


        @[JSON::Field(key: "Rows")]
        getter rows : Types::QueryRuntimeStatisticsRows?


        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::QueryRuntimeStatisticsTimeline?

        def initialize(
          @output_stage : Types::QueryStage? = nil,
          @rows : Types::QueryRuntimeStatisticsRows? = nil,
          @timeline : Types::QueryRuntimeStatisticsTimeline? = nil
        )
        end
      end

      # Statistics such as input rows and bytes read by the query, rows and bytes output by the query, and
      # the number of rows written by the query.

      struct QueryRuntimeStatisticsRows
        include JSON::Serializable

        # The number of bytes read to execute the query.

        @[JSON::Field(key: "InputBytes")]
        getter input_bytes : Int64?

        # The number of rows read to execute the query.

        @[JSON::Field(key: "InputRows")]
        getter input_rows : Int64?

        # The number of bytes returned by the query.

        @[JSON::Field(key: "OutputBytes")]
        getter output_bytes : Int64?

        # The number of rows returned by the query.

        @[JSON::Field(key: "OutputRows")]
        getter output_rows : Int64?

        def initialize(
          @input_bytes : Int64? = nil,
          @input_rows : Int64? = nil,
          @output_bytes : Int64? = nil,
          @output_rows : Int64? = nil
        )
        end
      end

      # Timeline statistics such as query queue time, planning time, execution time, service processing
      # time, and total execution time.

      struct QueryRuntimeStatisticsTimeline
        include JSON::Serializable

        # The number of milliseconds that the query took to execute.

        @[JSON::Field(key: "EngineExecutionTimeInMillis")]
        getter engine_execution_time_in_millis : Int64?

        # The number of milliseconds that Athena took to plan the query processing flow. This includes the
        # time spent retrieving table partitions from the data source. Note that because the query engine
        # performs the query planning, query planning time is a subset of engine processing time.

        @[JSON::Field(key: "QueryPlanningTimeInMillis")]
        getter query_planning_time_in_millis : Int64?

        # The number of milliseconds that the query was in your query queue waiting for resources. Note that
        # if transient errors occur, Athena might automatically add the query back to the queue.

        @[JSON::Field(key: "QueryQueueTimeInMillis")]
        getter query_queue_time_in_millis : Int64?

        # The number of milliseconds that Athena spends on preprocessing before it submits the query to the
        # engine.

        @[JSON::Field(key: "ServicePreProcessingTimeInMillis")]
        getter service_pre_processing_time_in_millis : Int64?

        # The number of milliseconds that Athena took to finalize and publish the query results after the
        # query engine finished running the query.

        @[JSON::Field(key: "ServiceProcessingTimeInMillis")]
        getter service_processing_time_in_millis : Int64?

        # The number of milliseconds that Athena took to run the query.

        @[JSON::Field(key: "TotalExecutionTimeInMillis")]
        getter total_execution_time_in_millis : Int64?

        def initialize(
          @engine_execution_time_in_millis : Int64? = nil,
          @query_planning_time_in_millis : Int64? = nil,
          @query_queue_time_in_millis : Int64? = nil,
          @service_pre_processing_time_in_millis : Int64? = nil,
          @service_processing_time_in_millis : Int64? = nil,
          @total_execution_time_in_millis : Int64? = nil
        )
        end
      end

      # Stage statistics such as input and output rows and bytes, execution time and stage state. This
      # information also includes substages and the query stage plan.

      struct QueryStage
        include JSON::Serializable

        # Time taken to execute this stage.

        @[JSON::Field(key: "ExecutionTime")]
        getter execution_time : Int64?

        # The number of bytes input into the stage for execution.

        @[JSON::Field(key: "InputBytes")]
        getter input_bytes : Int64?

        # The number of rows input into the stage for execution.

        @[JSON::Field(key: "InputRows")]
        getter input_rows : Int64?

        # The number of bytes output from the stage after execution.

        @[JSON::Field(key: "OutputBytes")]
        getter output_bytes : Int64?

        # The number of rows output from the stage after execution.

        @[JSON::Field(key: "OutputRows")]
        getter output_rows : Int64?

        # Stage plan information such as name, identifier, sub plans, and source stages.

        @[JSON::Field(key: "QueryStagePlan")]
        getter query_stage_plan : Types::QueryStagePlanNode?

        # The identifier for a stage.

        @[JSON::Field(key: "StageId")]
        getter stage_id : Int64?

        # State of the stage after query execution.

        @[JSON::Field(key: "State")]
        getter state : String?

        # List of sub query stages that form this stage execution plan.

        @[JSON::Field(key: "SubStages")]
        getter sub_stages : Array(Types::QueryStage)?

        def initialize(
          @execution_time : Int64? = nil,
          @input_bytes : Int64? = nil,
          @input_rows : Int64? = nil,
          @output_bytes : Int64? = nil,
          @output_rows : Int64? = nil,
          @query_stage_plan : Types::QueryStagePlanNode? = nil,
          @stage_id : Int64? = nil,
          @state : String? = nil,
          @sub_stages : Array(Types::QueryStage)? = nil
        )
        end
      end

      # Stage plan information such as name, identifier, sub plans, and remote sources.

      struct QueryStagePlanNode
        include JSON::Serializable

        # Stage plan information such as name, identifier, sub plans, and remote sources of child plan nodes/

        @[JSON::Field(key: "Children")]
        getter children : Array(Types::QueryStagePlanNode)?

        # Information about the operation this query stage plan node is performing.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Name of the query stage plan that describes the operation this stage is performing as part of query
        # execution.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Source plan node IDs.

        @[JSON::Field(key: "RemoteSources")]
        getter remote_sources : Array(String)?

        def initialize(
          @children : Array(Types::QueryStagePlanNode)? = nil,
          @identifier : String? = nil,
          @name : String? = nil,
          @remote_sources : Array(String)? = nil
        )
        end
      end

      # A resource, such as a workgroup, was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the Amazon resource.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The location in Amazon S3 where query and calculation results are stored and the encryption option,
      # if any, used for query and calculation results. These are known as "client-side settings". If
      # workgroup settings override client-side settings, then the query uses the workgroup settings.

      struct ResultConfiguration
        include JSON::Serializable

        # Indicates that an Amazon S3 canned ACL should be set to control ownership of stored query results.
        # Currently the only supported canned ACL is BUCKET_OWNER_FULL_CONTROL . This is a client-side
        # setting. If workgroup settings override client-side settings, then the query uses the ACL
        # configuration that is specified for the workgroup, and also uses the location for storing query
        # results specified in the workgroup. For more information, see
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration and Workgroup Settings Override Client-Side
        # Settings .

        @[JSON::Field(key: "AclConfiguration")]
        getter acl_configuration : Types::AclConfiguration?

        # If query and calculation results are encrypted in Amazon S3, indicates the encryption option used
        # (for example, SSE_KMS or CSE_KMS ) and key information. This is a client-side setting. If workgroup
        # settings override client-side settings, then the query uses the encryption configuration that is
        # specified for the workgroup, and also uses the location for storing query results specified in the
        # workgroup. See WorkGroupConfiguration$EnforceWorkGroupConfiguration and Workgroup Settings Override
        # Client-Side Settings .

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Web Services account ID that you expect to be the owner of the Amazon S3 bucket specified
        # by ResultConfiguration$OutputLocation . If set, Athena uses the value for ExpectedBucketOwner when
        # it makes Amazon S3 calls to your specified output location. If the ExpectedBucketOwner Amazon Web
        # Services account ID does not match the actual owner of the Amazon S3 bucket, the call fails with a
        # permissions error. This is a client-side setting. If workgroup settings override client-side
        # settings, then the query uses the ExpectedBucketOwner setting that is specified for the workgroup,
        # and also uses the location for storing query results specified in the workgroup. See
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration and Workgroup Settings Override Client-Side
        # Settings .

        @[JSON::Field(key: "ExpectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The location in Amazon S3 where your query and calculation results are stored, such as
        # s3://path/to/query/bucket/ . To run the query, you must specify the query results location using one
        # of the ways: either for individual queries using either this setting (client-side), or in the
        # workgroup, using WorkGroupConfiguration . If none of them is set, Athena issues an error that no
        # output location is provided. If workgroup settings override client-side settings, then the query
        # uses the settings specified for the workgroup. See
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration .

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : String?

        def initialize(
          @acl_configuration : Types::AclConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @expected_bucket_owner : String? = nil,
          @output_location : String? = nil
        )
        end
      end

      # The information about the updates in the query results, such as output location and encryption
      # configuration for the query results.

      struct ResultConfigurationUpdates
        include JSON::Serializable

        # The ACL configuration for the query results.

        @[JSON::Field(key: "AclConfiguration")]
        getter acl_configuration : Types::AclConfiguration?

        # The encryption configuration for query and calculation results.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Web Services account ID that you expect to be the owner of the Amazon S3 bucket specified
        # by ResultConfiguration$OutputLocation . If set, Athena uses the value for ExpectedBucketOwner when
        # it makes Amazon S3 calls to your specified output location. If the ExpectedBucketOwner Amazon Web
        # Services account ID does not match the actual owner of the Amazon S3 bucket, the call fails with a
        # permissions error. If workgroup settings override client-side settings, then the query uses the
        # ExpectedBucketOwner setting that is specified for the workgroup, and also uses the location for
        # storing query results specified in the workgroup. See
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration and Workgroup Settings Override Client-Side
        # Settings .

        @[JSON::Field(key: "ExpectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The location in Amazon S3 where your query and calculation results are stored, such as
        # s3://path/to/query/bucket/ . If workgroup settings override client-side settings, then the query
        # uses the location for the query results and the encryption configuration that are specified for the
        # workgroup. The "workgroup settings override" is specified in EnforceWorkGroupConfiguration
        # (true/false) in the WorkGroupConfiguration . See
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration .

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : String?

        # If set to true , indicates that the previously-specified ACL configuration for queries in this
        # workgroup should be ignored and set to null. If set to false or not set, and a value is present in
        # the AclConfiguration of ResultConfigurationUpdates , the AclConfiguration in the workgroup's
        # ResultConfiguration is updated with the new value. For more information, see Workgroup Settings
        # Override Client-Side Settings .

        @[JSON::Field(key: "RemoveAclConfiguration")]
        getter remove_acl_configuration : Bool?

        # If set to "true", indicates that the previously-specified encryption configuration (also known as
        # the client-side setting) for queries in this workgroup should be ignored and set to null. If set to
        # "false" or not set, and a value is present in the EncryptionConfiguration in
        # ResultConfigurationUpdates (the client-side setting), the EncryptionConfiguration in the workgroup's
        # ResultConfiguration will be updated with the new value. For more information, see Workgroup Settings
        # Override Client-Side Settings .

        @[JSON::Field(key: "RemoveEncryptionConfiguration")]
        getter remove_encryption_configuration : Bool?

        # If set to "true", removes the Amazon Web Services account ID previously specified for
        # ResultConfiguration$ExpectedBucketOwner . If set to "false" or not set, and a value is present in
        # the ExpectedBucketOwner in ResultConfigurationUpdates (the client-side setting), the
        # ExpectedBucketOwner in the workgroup's ResultConfiguration is updated with the new value. For more
        # information, see Workgroup Settings Override Client-Side Settings .

        @[JSON::Field(key: "RemoveExpectedBucketOwner")]
        getter remove_expected_bucket_owner : Bool?

        # If set to "true", indicates that the previously-specified query results location (also known as a
        # client-side setting) for queries in this workgroup should be ignored and set to null. If set to
        # "false" or not set, and a value is present in the OutputLocation in ResultConfigurationUpdates (the
        # client-side setting), the OutputLocation in the workgroup's ResultConfiguration will be updated with
        # the new value. For more information, see Workgroup Settings Override Client-Side Settings .

        @[JSON::Field(key: "RemoveOutputLocation")]
        getter remove_output_location : Bool?

        def initialize(
          @acl_configuration : Types::AclConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @expected_bucket_owner : String? = nil,
          @output_location : String? = nil,
          @remove_acl_configuration : Bool? = nil,
          @remove_encryption_configuration : Bool? = nil,
          @remove_expected_bucket_owner : Bool? = nil,
          @remove_output_location : Bool? = nil
        )
        end
      end

      # Specifies whether previous query results are reused, and if so, their maximum age.

      struct ResultReuseByAgeConfiguration
        include JSON::Serializable

        # True if previous query results can be reused when the query is run; otherwise, false. The default is
        # false.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Specifies, in minutes, the maximum age of a previous query result that Athena should consider for
        # reuse. The default is 60.

        @[JSON::Field(key: "MaxAgeInMinutes")]
        getter max_age_in_minutes : Int32?

        def initialize(
          @enabled : Bool,
          @max_age_in_minutes : Int32? = nil
        )
        end
      end

      # Specifies the query result reuse behavior for the query.

      struct ResultReuseConfiguration
        include JSON::Serializable

        # Specifies whether previous query results are reused, and if so, their maximum age.

        @[JSON::Field(key: "ResultReuseByAgeConfiguration")]
        getter result_reuse_by_age_configuration : Types::ResultReuseByAgeConfiguration?

        def initialize(
          @result_reuse_by_age_configuration : Types::ResultReuseByAgeConfiguration? = nil
        )
        end
      end

      # Contains information about whether the result of a previous query was reused.

      struct ResultReuseInformation
        include JSON::Serializable

        # True if a previous query result was reused; false if the result was generated from a new run of the
        # query.

        @[JSON::Field(key: "ReusedPreviousResult")]
        getter reused_previous_result : Bool

        def initialize(
          @reused_previous_result : Bool
        )
        end
      end

      # The metadata and rows that make up a query result set. The metadata describes the column structure
      # and data types. To return a ResultSet object, use GetQueryResults .

      struct ResultSet
        include JSON::Serializable

        # The metadata that describes the column structure and data types of a table of query results.

        @[JSON::Field(key: "ResultSetMetadata")]
        getter result_set_metadata : Types::ResultSetMetadata?

        # The rows in the table.

        @[JSON::Field(key: "Rows")]
        getter rows : Array(Types::Row)?

        def initialize(
          @result_set_metadata : Types::ResultSetMetadata? = nil,
          @rows : Array(Types::Row)? = nil
        )
        end
      end

      # The metadata that describes the column structure and data types of a table of query results. To
      # return a ResultSetMetadata object, use GetQueryResults .

      struct ResultSetMetadata
        include JSON::Serializable

        # Information about the columns returned in a query result metadata.

        @[JSON::Field(key: "ColumnInfo")]
        getter column_info : Array(Types::ColumnInfo)?

        def initialize(
          @column_info : Array(Types::ColumnInfo)? = nil
        )
        end
      end

      # The rows that make up a query result table.

      struct Row
        include JSON::Serializable

        # The data that populates a row in a query result table.

        @[JSON::Field(key: "Data")]
        getter data : Array(Types::Datum)?

        def initialize(
          @data : Array(Types::Datum)? = nil
        )
        end
      end

      # Configuration settings for delivering logs to Amazon S3 buckets.

      struct S3LoggingConfiguration
        include JSON::Serializable

        # Enables S3 log delivery.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        # The Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "LogLocation")]
        getter log_location : String?

        def initialize(
          @enabled : Bool,
          @kms_key : String? = nil,
          @log_location : String? = nil
        )
        end
      end

      # The specified session already exists.

      struct SessionAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains session configuration information.

      struct SessionConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The ARN of the execution role used to access user resources for Spark sessions and Identity Center
        # enabled workgroups. This property applies only to Spark enabled workgroups and Identity Center
        # enabled workgroups.

        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String?

        # The idle timeout in seconds for the session.

        @[JSON::Field(key: "IdleTimeoutSeconds")]
        getter idle_timeout_seconds : Int64?

        # The idle timeout in seconds for the session.

        @[JSON::Field(key: "SessionIdleTimeoutInMinutes")]
        getter session_idle_timeout_in_minutes : Int32?

        # The Amazon S3 location that stores information for the notebook.

        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @execution_role : String? = nil,
          @idle_timeout_seconds : Int64? = nil,
          @session_idle_timeout_in_minutes : Int32? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # Contains statistics for a session.

      struct SessionStatistics
        include JSON::Serializable

        # The data processing unit execution time for a session in milliseconds.

        @[JSON::Field(key: "DpuExecutionInMillis")]
        getter dpu_execution_in_millis : Int64?

        def initialize(
          @dpu_execution_in_millis : Int64? = nil
        )
        end
      end

      # Contains information about the status of a session.

      struct SessionStatus
        include JSON::Serializable

        # The date and time that the session ended.

        @[JSON::Field(key: "EndDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The date and time starting at which the session became idle. Can be empty if the session is not
        # currently idle.

        @[JSON::Field(key: "IdleSinceDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter idle_since_date_time : Time?

        # The most recent date and time that the session was modified.

        @[JSON::Field(key: "LastModifiedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date_time : Time?

        # The date and time that the session started.

        @[JSON::Field(key: "StartDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        # The state of the session. A description of each state follows. CREATING - The session is being
        # started, including acquiring resources. CREATED - The session has been started. IDLE - The session
        # is able to accept a calculation. BUSY - The session is processing another task and is unable to
        # accept a calculation. TERMINATING - The session is in the process of shutting down. TERMINATED - The
        # session and its resources are no longer running. DEGRADED - The session has no healthy coordinators.
        # FAILED - Due to a failure, the session and its resources are no longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the session state change (for example, canceled because the session was terminated).

        @[JSON::Field(key: "StateChangeReason")]
        getter state_change_reason : String?

        def initialize(
          @end_date_time : Time? = nil,
          @idle_since_date_time : Time? = nil,
          @last_modified_date_time : Time? = nil,
          @start_date_time : Time? = nil,
          @state : String? = nil,
          @state_change_reason : String? = nil
        )
        end
      end

      # Contains summary information about a session.

      struct SessionSummary
        include JSON::Serializable

        # The session description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The engine version used by the session (for example, PySpark engine version 3 ).

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::EngineVersion?

        # The notebook version.

        @[JSON::Field(key: "NotebookVersion")]
        getter notebook_version : String?

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # Contains information about the session status.

        @[JSON::Field(key: "Status")]
        getter status : Types::SessionStatus?

        def initialize(
          @description : String? = nil,
          @engine_version : Types::EngineVersion? = nil,
          @notebook_version : String? = nil,
          @session_id : String? = nil,
          @status : Types::SessionStatus? = nil
        )
        end
      end


      struct StartCalculationExecutionRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # Contains configuration information for the calculation.

        @[JSON::Field(key: "CalculationConfiguration")]
        getter calculation_configuration : Types::CalculationConfiguration?

        # A unique case-sensitive string used to ensure the request to create the calculation is idempotent
        # (executes only once). If another StartCalculationExecutionRequest is received, the same response is
        # returned and another calculation is not created. If a parameter has changed, an error is returned.
        # This token is listed as not required because Amazon Web Services SDKs (for example the Amazon Web
        # Services SDK for Java) auto-generate the token for users. If you are not using the Amazon Web
        # Services SDK or the Amazon Web Services CLI, you must provide this token or the action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A string that contains the code of the calculation. Use this parameter instead of
        # CalculationConfiguration$CodeBlock , which is deprecated.

        @[JSON::Field(key: "CodeBlock")]
        getter code_block : String?

        # A description of the calculation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @session_id : String,
          @calculation_configuration : Types::CalculationConfiguration? = nil,
          @client_request_token : String? = nil,
          @code_block : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct StartCalculationExecutionResponse
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String?

        # CREATING - The calculation is in the process of being created. CREATED - The calculation has been
        # created and is ready to run. QUEUED - The calculation has been queued for processing. RUNNING - The
        # calculation is running. CANCELING - A request to cancel the calculation has been received and the
        # system is working to stop it. CANCELED - The calculation is no longer running as the result of a
        # cancel request. COMPLETED - The calculation has completed without error. FAILED - The calculation
        # failed and is no longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @calculation_execution_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct StartQueryExecutionInput
        include JSON::Serializable

        # The SQL query statements to be executed.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # A unique case-sensitive string used to ensure the request to create the query is idempotent
        # (executes only once). If another StartQueryExecution request is received, the same response is
        # returned and another query is not created. An error is returned if a parameter, such as QueryString
        # , has changed. A call to StartQueryExecution that uses a previous client request token returns the
        # same QueryExecutionId even if the requester doesn't have permission on the tables specified in
        # QueryString . This token is listed as not required because Amazon Web Services SDKs (for example the
        # Amazon Web Services SDK for Java) auto-generate the token for users. If you are not using the Amazon
        # Web Services SDK or the Amazon Web Services CLI, you must provide this token or the action will
        # fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?


        @[JSON::Field(key: "EngineConfiguration")]
        getter engine_configuration : Types::EngineConfiguration?

        # A list of values for the parameters in a query. The values are applied sequentially to the
        # parameters in the query in the order in which the parameters occur.

        @[JSON::Field(key: "ExecutionParameters")]
        getter execution_parameters : Array(String)?

        # The database within which the query executes.

        @[JSON::Field(key: "QueryExecutionContext")]
        getter query_execution_context : Types::QueryExecutionContext?

        # Specifies information about where and how to save the results of the query execution. If the query
        # runs in a workgroup, then workgroup's settings may override query settings. This affects the query
        # results location. The workgroup settings override is specified in EnforceWorkGroupConfiguration
        # (true/false) in the WorkGroupConfiguration. See WorkGroupConfiguration$EnforceWorkGroupConfiguration
        # .

        @[JSON::Field(key: "ResultConfiguration")]
        getter result_configuration : Types::ResultConfiguration?

        # Specifies the query result reuse behavior for the query.

        @[JSON::Field(key: "ResultReuseConfiguration")]
        getter result_reuse_configuration : Types::ResultReuseConfiguration?

        # The name of the workgroup in which the query is being started.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String?

        def initialize(
          @query_string : String,
          @client_request_token : String? = nil,
          @engine_configuration : Types::EngineConfiguration? = nil,
          @execution_parameters : Array(String)? = nil,
          @query_execution_context : Types::QueryExecutionContext? = nil,
          @result_configuration : Types::ResultConfiguration? = nil,
          @result_reuse_configuration : Types::ResultReuseConfiguration? = nil,
          @work_group : String? = nil
        )
        end
      end


      struct StartQueryExecutionOutput
        include JSON::Serializable

        # The unique ID of the query that ran as a result of this request.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String?

        def initialize(
          @query_execution_id : String? = nil
        )
        end
      end


      struct StartSessionRequest
        include JSON::Serializable

        # Contains engine data processing unit (DPU) configuration settings and parameter mappings.

        @[JSON::Field(key: "EngineConfiguration")]
        getter engine_configuration : Types::EngineConfiguration

        # The workgroup to which the session belongs.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # A unique case-sensitive string used to ensure the request to create the session is idempotent
        # (executes only once). If another StartSessionRequest is received, the same response is returned and
        # another session is not created. If a parameter has changed, an error is returned. This token is
        # listed as not required because Amazon Web Services SDKs (for example the Amazon Web Services SDK for
        # Java) auto-generate the token for users. If you are not using the Amazon Web Services SDK or the
        # Amazon Web Services CLI, you must provide this token or the action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Copies the tags from the Workgroup to the Session when.

        @[JSON::Field(key: "CopyWorkGroupTags")]
        getter copy_work_group_tags : Bool?

        # The session description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the execution role used to access user resources for Spark sessions and Identity Center
        # enabled workgroups. This property applies only to Spark enabled workgroups and Identity Center
        # enabled workgroups.

        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String?

        # Contains the configuration settings for managed log persistence, delivering logs to Amazon S3
        # buckets, Amazon CloudWatch log groups etc.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # The notebook version. This value is supplied automatically for notebook sessions in the Athena
        # console and is not required for programmatic session access. The only valid notebook version is
        # Athena notebook version 1 . If you specify a value for NotebookVersion , you must also specify a
        # value for NotebookId . See EngineConfiguration$AdditionalConfigs .

        @[JSON::Field(key: "NotebookVersion")]
        getter notebook_version : String?

        # The idle timeout in minutes for the session.

        @[JSON::Field(key: "SessionIdleTimeoutInMinutes")]
        getter session_idle_timeout_in_minutes : Int32?

        # A list of comma separated tags to add to the session that is created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @engine_configuration : Types::EngineConfiguration,
          @work_group : String,
          @client_request_token : String? = nil,
          @copy_work_group_tags : Bool? = nil,
          @description : String? = nil,
          @execution_role : String? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @notebook_version : String? = nil,
          @session_idle_timeout_in_minutes : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartSessionResponse
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The state of the session. A description of each state follows. CREATING - The session is being
        # started, including acquiring resources. CREATED - The session has been started. IDLE - The session
        # is able to accept a calculation. BUSY - The session is processing another task and is unable to
        # accept a calculation. TERMINATING - The session is in the process of shutting down. TERMINATED - The
        # session and its resources are no longer running. DEGRADED - The session has no healthy coordinators.
        # FAILED - Due to a failure, the session and its resources are no longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @session_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct StopCalculationExecutionRequest
        include JSON::Serializable

        # The calculation execution UUID.

        @[JSON::Field(key: "CalculationExecutionId")]
        getter calculation_execution_id : String

        def initialize(
          @calculation_execution_id : String
        )
        end
      end


      struct StopCalculationExecutionResponse
        include JSON::Serializable

        # CREATING - The calculation is in the process of being created. CREATED - The calculation has been
        # created and is ready to run. QUEUED - The calculation has been queued for processing. RUNNING - The
        # calculation is running. CANCELING - A request to cancel the calculation has been received and the
        # system is working to stop it. CANCELED - The calculation is no longer running as the result of a
        # cancel request. COMPLETED - The calculation has completed without error. FAILED - The calculation
        # failed and is no longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end


      struct StopQueryExecutionInput
        include JSON::Serializable

        # The unique ID of the query execution to stop.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String

        def initialize(
          @query_execution_id : String
        )
        end
      end


      struct StopQueryExecutionOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains metadata for a table.

      struct TableMetadata
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the columns in the table.

        @[JSON::Field(key: "Columns")]
        getter columns : Array(Types::Column)?

        # The time that the table was created.

        @[JSON::Field(key: "CreateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The last time the table was accessed.

        @[JSON::Field(key: "LastAccessTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_access_time : Time?

        # A set of custom key/value pairs for table properties.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # A list of the partition keys in the table.

        @[JSON::Field(key: "PartitionKeys")]
        getter partition_keys : Array(Types::Column)?

        # The type of table. In Athena, only EXTERNAL_TABLE is supported.

        @[JSON::Field(key: "TableType")]
        getter table_type : String?

        def initialize(
          @name : String,
          @columns : Array(Types::Column)? = nil,
          @create_time : Time? = nil,
          @last_access_time : Time? = nil,
          @parameters : Hash(String, String)? = nil,
          @partition_keys : Array(Types::Column)? = nil,
          @table_type : String? = nil
        )
        end
      end

      # A label that you assign to a resource. Athena resources include workgroups, data catalogs, and
      # capacity reservations. Each tag consists of a key and an optional value, both of which you define.
      # For example, you can use tags to categorize Athena resources by purpose, owner, or environment. Use
      # a consistent set of tag keys to make it easier to search and filter the resources in your account.
      # For best practices, see Tagging Best Practices . Tag keys can be from 1 to 128 UTF-8 Unicode
      # characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and
      # numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
      # are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate
      # them by commas.

      struct Tag
        include JSON::Serializable

        # A tag key. The tag key length is from 1 to 128 Unicode characters in UTF-8. You can use letters and
        # numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys are
        # case-sensitive and must be unique per resource.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # A tag value. The tag value length is from 0 to 256 Unicode characters in UTF-8. You can use letters
        # and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag values are
        # case-sensitive.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # Specifies the ARN of the Athena resource to which tags are to be added.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A collection of one or more tags, separated by commas, to be added to an Athena resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct TerminateSessionRequest
        include JSON::Serializable

        # The session ID.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct TerminateSessionResponse
        include JSON::Serializable

        # The state of the session. A description of each state follows. CREATING - The session is being
        # started, including acquiring resources. CREATED - The session has been started. IDLE - The session
        # is able to accept a calculation. BUSY - The session is processing another task and is unable to
        # accept a calculation. TERMINATING - The session is in the process of shutting down. TERMINATED - The
        # session and its resources are no longer running. DEGRADED - The session has no healthy coordinators.
        # FAILED - Due to a failure, the session and its resources are no longer running.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # Indicates that the request was throttled.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Information about a named query ID that could not be processed.

      struct UnprocessedNamedQueryId
        include JSON::Serializable

        # The error code returned when the processing request for the named query failed, if applicable.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message returned when the processing request for the named query failed, if applicable.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The unique identifier of the named query.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @named_query_id : String? = nil
        )
        end
      end

      # The name of a prepared statement that could not be returned.

      struct UnprocessedPreparedStatementName
        include JSON::Serializable

        # The error code returned when the request for the prepared statement failed.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message containing the reason why the prepared statement could not be returned. The
        # following error messages are possible: INVALID_INPUT - The name of the prepared statement that was
        # provided is not valid (for example, the name is too long). STATEMENT_NOT_FOUND - A prepared
        # statement with the name provided could not be found. UNAUTHORIZED - The requester does not have
        # permission to access the workgroup that contains the prepared statement.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The name of a prepared statement that could not be returned due to an error.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @statement_name : String? = nil
        )
        end
      end

      # Describes a query execution that failed to process.

      struct UnprocessedQueryExecutionId
        include JSON::Serializable

        # The error code returned when the query execution failed to process, if applicable.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message returned when the query execution failed to process, if applicable.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The unique identifier of the query execution.

        @[JSON::Field(key: "QueryExecutionId")]
        getter query_execution_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @query_execution_id : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # Specifies the ARN of the resource from which tags are to be removed.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A comma-separated list of one or more tag keys whose tags are to be removed from the specified
        # resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateCapacityReservationInput
        include JSON::Serializable

        # The name of the capacity reservation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The new number of requested data processing units.

        @[JSON::Field(key: "TargetDpus")]
        getter target_dpus : Int32

        def initialize(
          @name : String,
          @target_dpus : Int32
        )
        end
      end


      struct UpdateCapacityReservationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDataCatalogInput
        include JSON::Serializable

        # The name of the data catalog to update. The catalog name must be unique for the Amazon Web Services
        # account and can use a maximum of 127 alphanumeric, underscore, at sign, or hyphen characters. The
        # remainder of the length constraint of 256 is reserved for use by Athena.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the type of data catalog to update. Specify LAMBDA for a federated catalog, HIVE for an
        # external hive metastore, or GLUE for an Glue Data Catalog.

        @[JSON::Field(key: "Type")]
        getter type : String

        # New or modified text that describes the data catalog.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the Lambda function or functions to use for updating the data catalog. This is a mapping
        # whose values depend on the catalog type. For the HIVE data catalog type, use the following syntax.
        # The metadata-function parameter is required. The sdk-version parameter is optional and defaults to
        # the currently supported version. metadata-function= lambda_arn , sdk-version= version_number For the
        # LAMBDA data catalog type, use one of the following sets of required parameters, but not both. If you
        # have one Lambda function that processes metadata and another for reading the actual data, use the
        # following syntax. Both parameters are required. metadata-function= lambda_arn , record-function=
        # lambda_arn If you have a composite Lambda function that processes both metadata and data, use the
        # following syntax to specify your Lambda function. function= lambda_arn

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateDataCatalogOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateNamedQueryInput
        include JSON::Serializable

        # The name of the query.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The unique identifier (UUID) of the query.

        @[JSON::Field(key: "NamedQueryId")]
        getter named_query_id : String

        # The contents of the query with all query statements.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # The query description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @named_query_id : String,
          @query_string : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateNamedQueryOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateNotebookInput
        include JSON::Serializable

        # The ID of the notebook to update.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        # The updated content for the notebook.

        @[JSON::Field(key: "Payload")]
        getter payload : String

        # The notebook content type. Currently, the only valid type is IPYNB .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A unique case-sensitive string used to ensure the request to create the notebook is idempotent
        # (executes only once). This token is listed as not required because Amazon Web Services SDKs (for
        # example the Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using
        # the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token or the
        # action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The active notebook session ID. Required if the notebook has an active session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        def initialize(
          @notebook_id : String,
          @payload : String,
          @type : String,
          @client_request_token : String? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct UpdateNotebookMetadataInput
        include JSON::Serializable

        # The name to update the notebook to.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the notebook to update the metadata for.

        @[JSON::Field(key: "NotebookId")]
        getter notebook_id : String

        # A unique case-sensitive string used to ensure the request to create the notebook is idempotent
        # (executes only once). This token is listed as not required because Amazon Web Services SDKs (for
        # example the Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using
        # the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token or the
        # action will fail.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @name : String,
          @notebook_id : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct UpdateNotebookMetadataOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateNotebookOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePreparedStatementInput
        include JSON::Serializable

        # The query string for the prepared statement.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String

        # The name of the prepared statement.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String

        # The workgroup for the prepared statement.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # The description of the prepared statement.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @query_statement : String,
          @statement_name : String,
          @work_group : String,
          @description : String? = nil
        )
        end
      end


      struct UpdatePreparedStatementOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkGroupInput
        include JSON::Serializable

        # The specified workgroup that will be updated.

        @[JSON::Field(key: "WorkGroup")]
        getter work_group : String

        # Contains configuration updates for an Athena SQL workgroup.

        @[JSON::Field(key: "ConfigurationUpdates")]
        getter configuration_updates : Types::WorkGroupConfigurationUpdates?

        # The workgroup description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The workgroup state that will be updated for the given workgroup.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @work_group : String,
          @configuration_updates : Types::WorkGroupConfigurationUpdates? = nil,
          @description : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateWorkGroupOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A workgroup, which contains a name, description, creation time, state, and other configuration,
      # listed under WorkGroup$Configuration . Each workgroup enables you to isolate queries for you or your
      # group of users from other queries in the same account, to configure the query results location and
      # the encryption configuration (known as workgroup settings), to enable sending query metrics to
      # Amazon CloudWatch, and to establish per-query data usage control limits for all queries in a
      # workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration
      # (true/false) in the WorkGroupConfiguration . See
      # WorkGroupConfiguration$EnforceWorkGroupConfiguration .

      struct WorkGroup
        include JSON::Serializable

        # The workgroup name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The configuration of the workgroup, which includes the location in Amazon S3 where query and
        # calculation results are stored, the encryption configuration, if any, used for query and calculation
        # results; whether the Amazon CloudWatch Metrics are enabled for the workgroup; whether workgroup
        # settings override client-side settings; and the data usage limits for the amount of data scanned per
        # query or per workgroup. The workgroup settings override is specified in
        # EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration . See
        # WorkGroupConfiguration$EnforceWorkGroupConfiguration .

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::WorkGroupConfiguration?

        # The date and time the workgroup was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The workgroup description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the IAM Identity Center enabled application associated with the workgroup.

        @[JSON::Field(key: "IdentityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # The state of the workgroup: ENABLED or DISABLED.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @name : String,
          @configuration : Types::WorkGroupConfiguration? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @identity_center_application_arn : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The configuration of the workgroup, which includes the location in Amazon S3 where query and
      # calculation results are stored, the encryption option, if any, used for query and calculation
      # results, whether the Amazon CloudWatch Metrics are enabled for the workgroup and whether workgroup
      # settings override query settings, and the data usage limits for the amount of data scanned per query
      # or per workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration
      # (true/false) in the WorkGroupConfiguration . See
      # WorkGroupConfiguration$EnforceWorkGroupConfiguration .

      struct WorkGroupConfiguration
        include JSON::Serializable

        # Specifies a user defined JSON string that is passed to the notebook engine.

        @[JSON::Field(key: "AdditionalConfiguration")]
        getter additional_configuration : String?

        # The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed
        # to scan.

        @[JSON::Field(key: "BytesScannedCutoffPerQuery")]
        getter bytes_scanned_cutoff_per_query : Int64?

        # Specifies the KMS key that is used to encrypt the user's data stores in Athena. This setting does
        # not apply to Athena SQL workgroups.

        @[JSON::Field(key: "CustomerContentEncryptionConfiguration")]
        getter customer_content_encryption_configuration : Types::CustomerContentEncryptionConfiguration?

        # Enforces a minimal level of encryption for the workgroup for query and calculation results that are
        # written to Amazon S3. When enabled, workgroup users can set encryption only to the minimum level set
        # by the administrator or higher when they submit queries. The EnforceWorkGroupConfiguration setting
        # takes precedence over the EnableMinimumEncryptionConfiguration flag. This means that if
        # EnforceWorkGroupConfiguration is true, the EnableMinimumEncryptionConfiguration flag is ignored, and
        # the workgroup configuration for encryption is used.

        @[JSON::Field(key: "EnableMinimumEncryptionConfiguration")]
        getter enable_minimum_encryption_configuration : Bool?

        # If set to "true", the settings for the workgroup override client-side settings. If set to "false",
        # client-side settings are used. This property is not required for Apache Spark enabled workgroups.
        # For more information, see Workgroup Settings Override Client-Side Settings .

        @[JSON::Field(key: "EnforceWorkGroupConfiguration")]
        getter enforce_work_group_configuration : Bool?


        @[JSON::Field(key: "EngineConfiguration")]
        getter engine_configuration : Types::EngineConfiguration?

        # The engine version that all queries running on the workgroup use. Queries on the
        # AmazonAthenaPreviewFunctionality workgroup run on the preview engine regardless of this setting.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::EngineVersion?

        # The ARN of the execution role used to access user resources for Spark sessions and IAM Identity
        # Center enabled workgroups. This property applies only to Spark enabled workgroups and IAM Identity
        # Center enabled workgroups. The property is required for IAM Identity Center enabled workgroups.

        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String?

        # Specifies whether the workgroup is IAM Identity Center supported.

        @[JSON::Field(key: "IdentityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfiguration?

        # The configuration for storing results in Athena owned storage, which includes whether this feature
        # is enabled; whether encryption configuration, if any, is used for encrypting query results.

        @[JSON::Field(key: "ManagedQueryResultsConfiguration")]
        getter managed_query_results_configuration : Types::ManagedQueryResultsConfiguration?

        # Contains the configuration settings for managed log persistence, delivering logs to Amazon S3
        # buckets, Amazon CloudWatch log groups etc.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.

        @[JSON::Field(key: "PublishCloudWatchMetricsEnabled")]
        getter publish_cloud_watch_metrics_enabled : Bool?

        # Specifies whether Amazon S3 access grants are enabled for query results.

        @[JSON::Field(key: "QueryResultsS3AccessGrantsConfiguration")]
        getter query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration?

        # If set to true , allows members assigned to a workgroup to reference Amazon S3 Requester Pays
        # buckets in queries. If set to false , workgroup members cannot query data from Requester Pays
        # buckets, and queries that retrieve data from Requester Pays buckets cause an error. The default is
        # false . For more information about Requester Pays buckets, see Requester Pays Buckets in the Amazon
        # Simple Storage Service Developer Guide .

        @[JSON::Field(key: "RequesterPaysEnabled")]
        getter requester_pays_enabled : Bool?

        # The configuration for the workgroup, which includes the location in Amazon S3 where query and
        # calculation results are stored and the encryption option, if any, used for query and calculation
        # results. To run the query, you must specify the query results location using one of the ways: either
        # in the workgroup using this setting, or for individual queries (client-side), using
        # ResultConfiguration$OutputLocation . If none of them is set, Athena issues an error that no output
        # location is provided.

        @[JSON::Field(key: "ResultConfiguration")]
        getter result_configuration : Types::ResultConfiguration?

        def initialize(
          @additional_configuration : String? = nil,
          @bytes_scanned_cutoff_per_query : Int64? = nil,
          @customer_content_encryption_configuration : Types::CustomerContentEncryptionConfiguration? = nil,
          @enable_minimum_encryption_configuration : Bool? = nil,
          @enforce_work_group_configuration : Bool? = nil,
          @engine_configuration : Types::EngineConfiguration? = nil,
          @engine_version : Types::EngineVersion? = nil,
          @execution_role : String? = nil,
          @identity_center_configuration : Types::IdentityCenterConfiguration? = nil,
          @managed_query_results_configuration : Types::ManagedQueryResultsConfiguration? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @publish_cloud_watch_metrics_enabled : Bool? = nil,
          @query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration? = nil,
          @requester_pays_enabled : Bool? = nil,
          @result_configuration : Types::ResultConfiguration? = nil
        )
        end
      end

      # The configuration information that will be updated for this workgroup, which includes the location
      # in Amazon S3 where query and calculation results are stored, the encryption option, if any, used for
      # query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup, whether the
      # workgroup settings override the client-side settings, and the data usage limit for the amount of
      # bytes scanned per query, if it is specified.

      struct WorkGroupConfigurationUpdates
        include JSON::Serializable

        # Contains a user defined string in JSON format for a Spark-enabled workgroup.

        @[JSON::Field(key: "AdditionalConfiguration")]
        getter additional_configuration : String?

        # The upper limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan.

        @[JSON::Field(key: "BytesScannedCutoffPerQuery")]
        getter bytes_scanned_cutoff_per_query : Int64?


        @[JSON::Field(key: "CustomerContentEncryptionConfiguration")]
        getter customer_content_encryption_configuration : Types::CustomerContentEncryptionConfiguration?

        # Enforces a minimal level of encryption for the workgroup for query and calculation results that are
        # written to Amazon S3. When enabled, workgroup users can set encryption only to the minimum level set
        # by the administrator or higher when they submit queries. This setting does not apply to
        # Spark-enabled workgroups. The EnforceWorkGroupConfiguration setting takes precedence over the
        # EnableMinimumEncryptionConfiguration flag. This means that if EnforceWorkGroupConfiguration is true,
        # the EnableMinimumEncryptionConfiguration flag is ignored, and the workgroup configuration for
        # encryption is used.

        @[JSON::Field(key: "EnableMinimumEncryptionConfiguration")]
        getter enable_minimum_encryption_configuration : Bool?

        # If set to "true", the settings for the workgroup override client-side settings. If set to "false"
        # client-side settings are used. For more information, see Workgroup Settings Override Client-Side
        # Settings .

        @[JSON::Field(key: "EnforceWorkGroupConfiguration")]
        getter enforce_work_group_configuration : Bool?


        @[JSON::Field(key: "EngineConfiguration")]
        getter engine_configuration : Types::EngineConfiguration?

        # The engine version requested when a workgroup is updated. After the update, all queries on the
        # workgroup run on the requested engine version. If no value was previously set, the default is Auto.
        # Queries on the AmazonAthenaPreviewFunctionality workgroup run on the preview engine regardless of
        # this setting.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::EngineVersion?

        # The ARN of the execution role used to access user resources for Spark sessions and Identity Center
        # enabled workgroups. This property applies only to Spark enabled workgroups and Identity Center
        # enabled workgroups.

        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String?

        # Updates configuration information for managed query results in the workgroup.

        @[JSON::Field(key: "ManagedQueryResultsConfigurationUpdates")]
        getter managed_query_results_configuration_updates : Types::ManagedQueryResultsConfigurationUpdates?

        # Contains the configuration settings for managed log persistence, delivering logs to Amazon S3
        # buckets, Amazon CloudWatch log groups etc.

        @[JSON::Field(key: "MonitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # Indicates whether this workgroup enables publishing metrics to Amazon CloudWatch.

        @[JSON::Field(key: "PublishCloudWatchMetricsEnabled")]
        getter publish_cloud_watch_metrics_enabled : Bool?

        # Specifies whether Amazon S3 access grants are enabled for query results.

        @[JSON::Field(key: "QueryResultsS3AccessGrantsConfiguration")]
        getter query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration?

        # Indicates that the data usage control limit per query is removed.
        # WorkGroupConfiguration$BytesScannedCutoffPerQuery

        @[JSON::Field(key: "RemoveBytesScannedCutoffPerQuery")]
        getter remove_bytes_scanned_cutoff_per_query : Bool?

        # Removes content encryption configuration from an Apache Spark-enabled Athena workgroup.

        @[JSON::Field(key: "RemoveCustomerContentEncryptionConfiguration")]
        getter remove_customer_content_encryption_configuration : Bool?

        # If set to true , allows members assigned to a workgroup to specify Amazon S3 Requester Pays buckets
        # in queries. If set to false , workgroup members cannot query data from Requester Pays buckets, and
        # queries that retrieve data from Requester Pays buckets cause an error. The default is false . For
        # more information about Requester Pays buckets, see Requester Pays Buckets in the Amazon Simple
        # Storage Service Developer Guide .

        @[JSON::Field(key: "RequesterPaysEnabled")]
        getter requester_pays_enabled : Bool?

        # The result configuration information about the queries in this workgroup that will be updated.
        # Includes the updated results location and an updated option for encrypting query results.

        @[JSON::Field(key: "ResultConfigurationUpdates")]
        getter result_configuration_updates : Types::ResultConfigurationUpdates?

        def initialize(
          @additional_configuration : String? = nil,
          @bytes_scanned_cutoff_per_query : Int64? = nil,
          @customer_content_encryption_configuration : Types::CustomerContentEncryptionConfiguration? = nil,
          @enable_minimum_encryption_configuration : Bool? = nil,
          @enforce_work_group_configuration : Bool? = nil,
          @engine_configuration : Types::EngineConfiguration? = nil,
          @engine_version : Types::EngineVersion? = nil,
          @execution_role : String? = nil,
          @managed_query_results_configuration_updates : Types::ManagedQueryResultsConfigurationUpdates? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @publish_cloud_watch_metrics_enabled : Bool? = nil,
          @query_results_s3_access_grants_configuration : Types::QueryResultsS3AccessGrantsConfiguration? = nil,
          @remove_bytes_scanned_cutoff_per_query : Bool? = nil,
          @remove_customer_content_encryption_configuration : Bool? = nil,
          @requester_pays_enabled : Bool? = nil,
          @result_configuration_updates : Types::ResultConfigurationUpdates? = nil
        )
        end
      end

      # The summary information for the workgroup, which includes its name, state, description, and the date
      # and time it was created.

      struct WorkGroupSummary
        include JSON::Serializable

        # The workgroup creation date and time.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The workgroup description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The engine version setting for all queries on the workgroup. Queries on the
        # AmazonAthenaPreviewFunctionality workgroup run on the preview engine regardless of this setting.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::EngineVersion?

        # The ARN of the IAM Identity Center enabled application associated with the workgroup.

        @[JSON::Field(key: "IdentityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # The name of the workgroup.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the workgroup.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @engine_version : Types::EngineVersion? = nil,
          @identity_center_application_arn : String? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end
    end
  end
end
