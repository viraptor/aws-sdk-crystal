require "json"

module Aws
  module RDSData
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains an array.

      struct ArrayValue
        include JSON::Serializable

        # An array of arrays.

        @[JSON::Field(key: "arrayValues")]
        getter array_values : Array(Types::ArrayValue)?

        # An array of Boolean values.

        @[JSON::Field(key: "booleanValues")]
        getter boolean_values : Array(Bool)?

        # An array of floating-point numbers.

        @[JSON::Field(key: "doubleValues")]
        getter double_values : Array(Float64)?

        # An array of integers.

        @[JSON::Field(key: "longValues")]
        getter long_values : Array(Int64)?

        # An array of strings.

        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)?

        def initialize(
          @array_values : Array(Types::ArrayValue)? = nil,
          @boolean_values : Array(Bool)? = nil,
          @double_values : Array(Float64)? = nil,
          @long_values : Array(Int64)? = nil,
          @string_values : Array(String)? = nil
        )
        end
      end

      # There is an error in the call or in a SQL statement. (This error only appears in calls from Aurora
      # Serverless v1 databases.)

      struct BadRequestException
        include JSON::Serializable

        # The error message returned by this BadRequestException error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request parameters represent the input of a SQL statement over an array of data.

      struct BatchExecuteStatementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ARN of the secret that enables access to the DB cluster. Enter the database user name and
        # password for the credentials in the secret. For information about creating the secret, see Create a
        # database secret .

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The SQL statement to run. Don't include a semicolon (;) at the end of the SQL statement.

        @[JSON::Field(key: "sql")]
        getter sql : String

        # The name of the database.

        @[JSON::Field(key: "database")]
        getter database : String?

        # The parameter set for the batch operation. The SQL statement is executed as many times as the number
        # of parameter sets provided. To execute a SQL statement with no parameters, use one of the following
        # options: Specify one or more empty parameter sets. Use the ExecuteStatement operation instead of the
        # BatchExecuteStatement operation. Array parameters are not supported.

        @[JSON::Field(key: "parameterSets")]
        getter parameter_sets : Array(Array(Types::SqlParameter))?

        # The name of the database schema. Currently, the schema parameter isn't supported.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # The identifier of a transaction that was started by using the BeginTransaction operation. Specify
        # the transaction ID of the transaction that you want to include the SQL statement in. If the SQL
        # statement is not part of a transaction, don't set this parameter.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @resource_arn : String,
          @secret_arn : String,
          @sql : String,
          @database : String? = nil,
          @parameter_sets : Array(Array(Types::SqlParameter))? = nil,
          @schema : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end

      # The response elements represent the output of a SQL statement over an array of data.

      struct BatchExecuteStatementResponse
        include JSON::Serializable

        # The execution results of each batch entry.

        @[JSON::Field(key: "updateResults")]
        getter update_results : Array(Types::UpdateResult)?

        def initialize(
          @update_results : Array(Types::UpdateResult)? = nil
        )
        end
      end

      # The request parameters represent the input of a request to start a SQL transaction.

      struct BeginTransactionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name or ARN of the secret that enables access to the DB cluster.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The name of the database.

        @[JSON::Field(key: "database")]
        getter database : String?

        # The name of the database schema.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @resource_arn : String,
          @secret_arn : String,
          @database : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # The response elements represent the output of a request to start a SQL transaction.

      struct BeginTransactionResponse
        include JSON::Serializable

        # The transaction ID of the transaction started by the call.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @transaction_id : String? = nil
        )
        end
      end

      # Contains the metadata for a column.

      struct ColumnMetadata
        include JSON::Serializable

        # The type of the column.

        @[JSON::Field(key: "arrayBaseColumnType")]
        getter array_base_column_type : Int32?

        # A value that indicates whether the column increments automatically.

        @[JSON::Field(key: "isAutoIncrement")]
        getter is_auto_increment : Bool?

        # A value that indicates whether the column is case-sensitive.

        @[JSON::Field(key: "isCaseSensitive")]
        getter is_case_sensitive : Bool?

        # A value that indicates whether the column contains currency values.

        @[JSON::Field(key: "isCurrency")]
        getter is_currency : Bool?

        # A value that indicates whether an integer column is signed.

        @[JSON::Field(key: "isSigned")]
        getter is_signed : Bool?

        # The label for the column.

        @[JSON::Field(key: "label")]
        getter label : String?

        # The name of the column.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A value that indicates whether the column is nullable.

        @[JSON::Field(key: "nullable")]
        getter nullable : Int32?

        # The precision value of a decimal number column.

        @[JSON::Field(key: "precision")]
        getter precision : Int32?

        # The scale value of a decimal number column.

        @[JSON::Field(key: "scale")]
        getter scale : Int32?

        # The name of the schema that owns the table that includes the column.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        # The name of the table that includes the column.

        @[JSON::Field(key: "tableName")]
        getter table_name : String?

        # The type of the column.

        @[JSON::Field(key: "type")]
        getter type : Int32?

        # The database-specific data type of the column.

        @[JSON::Field(key: "typeName")]
        getter type_name : String?

        def initialize(
          @array_base_column_type : Int32? = nil,
          @is_auto_increment : Bool? = nil,
          @is_case_sensitive : Bool? = nil,
          @is_currency : Bool? = nil,
          @is_signed : Bool? = nil,
          @label : String? = nil,
          @name : String? = nil,
          @nullable : Int32? = nil,
          @precision : Int32? = nil,
          @scale : Int32? = nil,
          @schema_name : String? = nil,
          @table_name : String? = nil,
          @type : Int32? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The request parameters represent the input of a commit transaction request.

      struct CommitTransactionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name or ARN of the secret that enables access to the DB cluster.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The identifier of the transaction to end and commit.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String

        def initialize(
          @resource_arn : String,
          @secret_arn : String,
          @transaction_id : String
        )
        end
      end

      # The response elements represent the output of a commit transaction request.

      struct CommitTransactionResponse
        include JSON::Serializable

        # The status of the commit operation.

        @[JSON::Field(key: "transactionStatus")]
        getter transaction_status : String?

        def initialize(
          @transaction_status : String? = nil
        )
        end
      end

      # There was an error in processing the SQL statement.

      struct DatabaseErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The DB cluster doesn't have a DB instance.

      struct DatabaseNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A request was cancelled because the Aurora Serverless v2 DB instance was paused. The Data API
      # request automatically resumes the DB instance. Wait a few seconds and try again.

      struct DatabaseResumingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The writer instance in the DB cluster isn't available.

      struct DatabaseUnavailableException
        include JSON::Serializable

        def initialize
        end
      end

      # The request parameters represent the input of a request to run one or more SQL statements.

      struct ExecuteSqlRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret that enables access to the DB cluster. Enter the
        # database user name and password for the credentials in the secret. For information about creating
        # the secret, see Create a database secret .

        @[JSON::Field(key: "awsSecretStoreArn")]
        getter aws_secret_store_arn : String

        # The ARN of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "dbClusterOrInstanceArn")]
        getter db_cluster_or_instance_arn : String

        # One or more SQL statements to run on the DB cluster. You can separate SQL statements from each other
        # with a semicolon (;). Any valid SQL statement is permitted, including data definition, data
        # manipulation, and commit statements.

        @[JSON::Field(key: "sqlStatements")]
        getter sql_statements : String

        # The name of the database.

        @[JSON::Field(key: "database")]
        getter database : String?

        # The name of the database schema.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @aws_secret_store_arn : String,
          @db_cluster_or_instance_arn : String,
          @sql_statements : String,
          @database : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # The response elements represent the output of a request to run one or more SQL statements.

      struct ExecuteSqlResponse
        include JSON::Serializable

        # The results of the SQL statement or statements.

        @[JSON::Field(key: "sqlStatementResults")]
        getter sql_statement_results : Array(Types::SqlStatementResult)?

        def initialize(
          @sql_statement_results : Array(Types::SqlStatementResult)? = nil
        )
        end
      end

      # The request parameters represent the input of a request to run a SQL statement against a database.

      struct ExecuteStatementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ARN of the secret that enables access to the DB cluster. Enter the database user name and
        # password for the credentials in the secret. For information about creating the secret, see Create a
        # database secret .

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The SQL statement to run.

        @[JSON::Field(key: "sql")]
        getter sql : String

        # A value that indicates whether to continue running the statement after the call times out. By
        # default, the statement stops running when the call times out. For DDL statements, we recommend
        # continuing to run the statement after the call times out. When a DDL statement terminates before it
        # is finished running, it can result in errors and possibly corrupted data structures.

        @[JSON::Field(key: "continueAfterTimeout")]
        getter continue_after_timeout : Bool?

        # The name of the database.

        @[JSON::Field(key: "database")]
        getter database : String?

        # A value that indicates whether to format the result set as a single JSON string. This parameter only
        # applies to SELECT statements and is ignored for other types of statements. Allowed values are NONE
        # and JSON . The default value is NONE . The result is returned in the formattedRecords field. For
        # usage information about the JSON format for result sets, see Using the Data API in the Amazon Aurora
        # User Guide .

        @[JSON::Field(key: "formatRecordsAs")]
        getter format_records_as : String?

        # A value that indicates whether to include metadata in the results.

        @[JSON::Field(key: "includeResultMetadata")]
        getter include_result_metadata : Bool?

        # The parameters for the SQL statement. Array parameters are not supported.

        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::SqlParameter)?

        # Options that control how the result set is returned.

        @[JSON::Field(key: "resultSetOptions")]
        getter result_set_options : Types::ResultSetOptions?

        # The name of the database schema. Currently, the schema parameter isn't supported.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # The identifier of a transaction that was started by using the BeginTransaction operation. Specify
        # the transaction ID of the transaction that you want to include the SQL statement in. If the SQL
        # statement is not part of a transaction, don't set this parameter.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @resource_arn : String,
          @secret_arn : String,
          @sql : String,
          @continue_after_timeout : Bool? = nil,
          @database : String? = nil,
          @format_records_as : String? = nil,
          @include_result_metadata : Bool? = nil,
          @parameters : Array(Types::SqlParameter)? = nil,
          @result_set_options : Types::ResultSetOptions? = nil,
          @schema : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end

      # The response elements represent the output of a request to run a SQL statement against a database.

      struct ExecuteStatementResponse
        include JSON::Serializable

        # Metadata for the columns included in the results. This field is blank if the formatRecordsAs
        # parameter is set to JSON .

        @[JSON::Field(key: "columnMetadata")]
        getter column_metadata : Array(Types::ColumnMetadata)?

        # A string value that represents the result set of a SELECT statement in JSON format. This value is
        # only present when the formatRecordsAs parameter is set to JSON . The size limit for this field is
        # currently 10 MB. If the JSON-formatted string representing the result set requires more than 10 MB,
        # the call returns an error.

        @[JSON::Field(key: "formattedRecords")]
        getter formatted_records : String?

        # Values for fields generated during a DML request. The generatedFields data isn't supported by Aurora
        # PostgreSQL. To get the values of generated fields, use the RETURNING clause. For more information,
        # see Returning Data From Modified Rows in the PostgreSQL documentation.

        @[JSON::Field(key: "generatedFields")]
        getter generated_fields : Array(Types::Field)?

        # The number of records updated by the request.

        @[JSON::Field(key: "numberOfRecordsUpdated")]
        getter number_of_records_updated : Int64?

        # The records returned by the SQL statement. This field is blank if the formatRecordsAs parameter is
        # set to JSON .

        @[JSON::Field(key: "records")]
        getter records : Array(Array(Types::Field))?

        def initialize(
          @column_metadata : Array(Types::ColumnMetadata)? = nil,
          @formatted_records : String? = nil,
          @generated_fields : Array(Types::Field)? = nil,
          @number_of_records_updated : Int64? = nil,
          @records : Array(Array(Types::Field))? = nil
        )
        end
      end

      # Contains a value.

      struct Field
        include JSON::Serializable

        # An array of values.

        @[JSON::Field(key: "arrayValue")]
        getter array_value : Types::ArrayValue?

        # A value of BLOB data type.

        @[JSON::Field(key: "blobValue")]
        getter blob_value : Bytes?

        # A value of Boolean data type.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # A value of double data type.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # A NULL value.

        @[JSON::Field(key: "isNull")]
        getter is_null : Bool?

        # A value of long data type.

        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # A value of string data type.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @array_value : Types::ArrayValue? = nil,
          @blob_value : Bytes? = nil,
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @is_null : Bool? = nil,
          @long_value : Int64? = nil,
          @string_value : String? = nil
        )
        end
      end

      # There are insufficient privileges to make the call.

      struct ForbiddenException
        include JSON::Serializable

        # The error message returned by this ForbiddenException error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The HTTP endpoint for using RDS Data API isn't enabled for the DB cluster.

      struct HttpEndpointNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An internal error occurred.

      struct InternalServerErrorException
        include JSON::Serializable

        def initialize
        end
      end

      # The resource is in an invalid state.

      struct InvalidResourceStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Secrets Manager secret used with the request isn't valid.

      struct InvalidSecretException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resourceArn , secretArn , or transactionId value can't be found.

      struct NotFoundException
        include JSON::Serializable

        # The error message returned by this NotFoundException error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A record returned by a call. This data structure is only used with the deprecated ExecuteSql
      # operation. Use the BatchExecuteStatement or ExecuteStatement operation instead.

      struct Record
        include JSON::Serializable

        # The values returned in the record.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::Value)?

        def initialize(
          @values : Array(Types::Value)? = nil
        )
        end
      end

      # The result set returned by a SQL statement. This data structure is only used with the deprecated
      # ExecuteSql operation. Use the BatchExecuteStatement or ExecuteStatement operation instead.

      struct ResultFrame
        include JSON::Serializable

        # The records in the result set.

        @[JSON::Field(key: "records")]
        getter records : Array(Types::Record)?

        # The result-set metadata in the result set.

        @[JSON::Field(key: "resultSetMetadata")]
        getter result_set_metadata : Types::ResultSetMetadata?

        def initialize(
          @records : Array(Types::Record)? = nil,
          @result_set_metadata : Types::ResultSetMetadata? = nil
        )
        end
      end

      # The metadata of the result set returned by a SQL statement.

      struct ResultSetMetadata
        include JSON::Serializable

        # The number of columns in the result set.

        @[JSON::Field(key: "columnCount")]
        getter column_count : Int64?

        # The metadata of the columns in the result set.

        @[JSON::Field(key: "columnMetadata")]
        getter column_metadata : Array(Types::ColumnMetadata)?

        def initialize(
          @column_count : Int64? = nil,
          @column_metadata : Array(Types::ColumnMetadata)? = nil
        )
        end
      end

      # Options that control how the result set is returned.

      struct ResultSetOptions
        include JSON::Serializable

        # A value that indicates how a field of DECIMAL type is represented in the response. The value of
        # STRING , the default, specifies that it is converted to a String value. The value of DOUBLE_OR_LONG
        # specifies that it is converted to a Long value if its scale is 0, or to a Double value otherwise.
        # Conversion to Double or Long can result in roundoff errors due to precision loss. We recommend
        # converting to String, especially when working with currency values.

        @[JSON::Field(key: "decimalReturnType")]
        getter decimal_return_type : String?

        # A value that indicates how a field of LONG type is represented. Allowed values are LONG and STRING .
        # The default is LONG . Specify STRING if the length or precision of numeric values might cause
        # truncation or rounding errors.

        @[JSON::Field(key: "longReturnType")]
        getter long_return_type : String?

        def initialize(
          @decimal_return_type : String? = nil,
          @long_return_type : String? = nil
        )
        end
      end

      # The request parameters represent the input of a request to perform a rollback of a transaction.

      struct RollbackTransactionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Aurora Serverless DB cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name or ARN of the secret that enables access to the DB cluster.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The identifier of the transaction to roll back.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String

        def initialize(
          @resource_arn : String,
          @secret_arn : String,
          @transaction_id : String
        )
        end
      end

      # The response elements represent the output of a request to perform a rollback of a transaction.

      struct RollbackTransactionResponse
        include JSON::Serializable

        # The status of the rollback operation.

        @[JSON::Field(key: "transactionStatus")]
        getter transaction_status : String?

        def initialize(
          @transaction_status : String? = nil
        )
        end
      end

      # There was a problem with the Secrets Manager secret used with the request, caused by one of the
      # following conditions: RDS Data API timed out retrieving the secret. The secret provided wasn't
      # found. The secret couldn't be decrypted.

      struct SecretsErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service specified by the resourceArn parameter isn't available.

      struct ServiceUnavailableError
        include JSON::Serializable

        def initialize
        end
      end

      # A parameter used in a SQL statement.

      struct SqlParameter
        include JSON::Serializable

        # The name of the parameter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A hint that specifies the correct object type for data type mapping. Possible values are as follows:
        # DATE - The corresponding String parameter value is sent as an object of DATE type to the database.
        # The accepted format is YYYY-MM-DD . DECIMAL - The corresponding String parameter value is sent as an
        # object of DECIMAL type to the database. JSON - The corresponding String parameter value is sent as
        # an object of JSON type to the database. TIME - The corresponding String parameter value is sent as
        # an object of TIME type to the database. The accepted format is HH:MM:SS[.FFF] . TIMESTAMP - The
        # corresponding String parameter value is sent as an object of TIMESTAMP type to the database. The
        # accepted format is YYYY-MM-DD HH:MM:SS[.FFF] . UUID - The corresponding String parameter value is
        # sent as an object of UUID type to the database.

        @[JSON::Field(key: "typeHint")]
        getter type_hint : String?

        # The value of the parameter.

        @[JSON::Field(key: "value")]
        getter value : Types::Field?

        def initialize(
          @name : String? = nil,
          @type_hint : String? = nil,
          @value : Types::Field? = nil
        )
        end
      end

      # The result of a SQL statement. This data structure is only used with the deprecated ExecuteSql
      # operation. Use the BatchExecuteStatement or ExecuteStatement operation instead.

      struct SqlStatementResult
        include JSON::Serializable

        # The number of records updated by a SQL statement.

        @[JSON::Field(key: "numberOfRecordsUpdated")]
        getter number_of_records_updated : Int64?

        # The result set of the SQL statement.

        @[JSON::Field(key: "resultFrame")]
        getter result_frame : Types::ResultFrame?

        def initialize(
          @number_of_records_updated : Int64? = nil,
          @result_frame : Types::ResultFrame? = nil
        )
        end
      end

      # The execution of the SQL statement timed out.

      struct StatementTimeoutException
        include JSON::Serializable

        # The database connection ID that executed the SQL statement.

        @[JSON::Field(key: "dbConnectionId")]
        getter db_connection_id : Int64?

        # The error message returned by this StatementTimeoutException error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @db_connection_id : Int64? = nil,
          @message : String? = nil
        )
        end
      end

      # A structure value returned by a call. This data structure is only used with the deprecated
      # ExecuteSql operation. Use the BatchExecuteStatement or ExecuteStatement operation instead.

      struct StructValue
        include JSON::Serializable

        # The attributes returned in the record.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Value)?

        def initialize(
          @attributes : Array(Types::Value)? = nil
        )
        end
      end

      # The transaction ID wasn't found.

      struct TransactionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was a problem with the result because of one of the following conditions: It contained an
      # unsupported data type. It contained a multidimensional array. The size was too large.

      struct UnsupportedResultException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The response elements represent the results of an update.

      struct UpdateResult
        include JSON::Serializable

        # Values for fields generated during the request.

        @[JSON::Field(key: "generatedFields")]
        getter generated_fields : Array(Types::Field)?

        def initialize(
          @generated_fields : Array(Types::Field)? = nil
        )
        end
      end

      # Contains the value of a column. This data structure is only used with the deprecated ExecuteSql
      # operation. Use the BatchExecuteStatement or ExecuteStatement operation instead.

      struct Value
        include JSON::Serializable

        # An array of column values.

        @[JSON::Field(key: "arrayValues")]
        getter array_values : Array(Types::Value)?

        # A value for a column of big integer data type.

        @[JSON::Field(key: "bigIntValue")]
        getter big_int_value : Int64?

        # A value for a column of BIT data type.

        @[JSON::Field(key: "bitValue")]
        getter bit_value : Bool?

        # A value for a column of BLOB data type.

        @[JSON::Field(key: "blobValue")]
        getter blob_value : Bytes?

        # A value for a column of double data type.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # A value for a column of integer data type.

        @[JSON::Field(key: "intValue")]
        getter int_value : Int32?

        # A NULL value.

        @[JSON::Field(key: "isNull")]
        getter is_null : Bool?

        # A value for a column of real data type.

        @[JSON::Field(key: "realValue")]
        getter real_value : Float64?

        # A value for a column of string data type.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        # A value for a column of STRUCT data type.

        @[JSON::Field(key: "structValue")]
        getter struct_value : Types::StructValue?

        def initialize(
          @array_values : Array(Types::Value)? = nil,
          @big_int_value : Int64? = nil,
          @bit_value : Bool? = nil,
          @blob_value : Bytes? = nil,
          @double_value : Float64? = nil,
          @int_value : Int32? = nil,
          @is_null : Bool? = nil,
          @real_value : Float64? = nil,
          @string_value : String? = nil,
          @struct_value : Types::StructValue? = nil
        )
        end
      end
    end
  end
end
