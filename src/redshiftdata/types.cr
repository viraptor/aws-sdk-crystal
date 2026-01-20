require "json"
require "time"

module Aws
  module RedshiftData
    module Types

      # The Amazon Redshift Data API operation failed because the maximum number of active sessions
      # exceeded.

      struct ActiveSessionsExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of active statements exceeds the limit.

      struct ActiveStatementsExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An SQL statement encountered an environmental error while running.

      struct BatchExecuteStatementException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Statement identifier of the exception.

        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        def initialize(
          @message : String,
          @statement_id : String
        )
        end
      end


      struct BatchExecuteStatementInput
        include JSON::Serializable

        # One or more SQL statements to run. The SQL statements are run as a single transaction. They run
        # serially in the order of the array. Subsequent SQL statements don't start until the previous
        # statement in the array completes. If any SQL statement fails, then because they are run as one
        # transaction, all work is rolled back.

        @[JSON::Field(key: "Sqls")]
        getter sqls : Array(String)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The name of the database. This parameter is required when authenticating using either Secrets
        # Manager or temporary credentials.

        @[JSON::Field(key: "Database")]
        getter database : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The data format of the result of the SQL statement. If no format is specified, the default is JSON.

        @[JSON::Field(key: "ResultFormat")]
        getter result_format : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The number of seconds to keep the session alive after the query finishes. The maximum time a session
        # can keep alive is 24 hours. After 24 hours, the session is forced closed and the query is
        # terminated.

        @[JSON::Field(key: "SessionKeepAliveSeconds")]
        getter session_keep_alive_seconds : Int32?

        # The name of the SQL statements. You can name the SQL statements when you create them to identify the
        # query.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # A value that indicates whether to send an event to the Amazon EventBridge event bus after the SQL
        # statements run.

        @[JSON::Field(key: "WithEvent")]
        getter with_event : Bool?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @sqls : Array(String),
          @client_token : String? = nil,
          @cluster_identifier : String? = nil,
          @database : String? = nil,
          @db_user : String? = nil,
          @result_format : String? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @session_keep_alive_seconds : Int32? = nil,
          @statement_name : String? = nil,
          @with_event : Bool? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct BatchExecuteStatementOutput
        include JSON::Serializable

        # The cluster identifier. This element is not returned when connecting to a serverless workgroup.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The date and time (UTC) the statement was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The name of the database.

        @[JSON::Field(key: "Database")]
        getter database : String?

        # A list of colon (:) separated names of database groups.

        @[JSON::Field(key: "DbGroups")]
        getter db_groups : Array(String)?

        # The database user name.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The identifier of the SQL statement whose results are to be fetched. This value is a universally
        # unique identifier (UUID) generated by Amazon Redshift Data API. This identifier is returned by
        # BatchExecuteStatment .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name or ARN of the secret that enables access to the database.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This element is not returned when
        # connecting to a provisioned cluster.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @created_at : Time? = nil,
          @database : String? = nil,
          @db_groups : Array(String)? = nil,
          @db_user : String? = nil,
          @id : String? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct CancelStatementRequest
        include JSON::Serializable

        # The identifier of the SQL statement to cancel. This value is a universally unique identifier (UUID)
        # generated by Amazon Redshift Data API. This identifier is returned by BatchExecuteStatment ,
        # ExecuteStatment , and ListStatements .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct CancelStatementResponse
        include JSON::Serializable

        # A value that indicates whether the cancel statement succeeded (true).

        @[JSON::Field(key: "Status")]
        getter status : Bool?

        def initialize(
          @status : Bool? = nil
        )
        end
      end

      # The properties (metadata) of a column.

      struct ColumnMetadata
        include JSON::Serializable

        # The default value of the column.

        @[JSON::Field(key: "columnDefault")]
        getter column_default : String?

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

        # The length of the column.

        @[JSON::Field(key: "length")]
        getter length : Int32?

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

        # The name of the schema that contains the table that includes the column.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        # The name of the table that includes the column.

        @[JSON::Field(key: "tableName")]
        getter table_name : String?

        # The database-specific data type of the column.

        @[JSON::Field(key: "typeName")]
        getter type_name : String?

        def initialize(
          @column_default : String? = nil,
          @is_case_sensitive : Bool? = nil,
          @is_currency : Bool? = nil,
          @is_signed : Bool? = nil,
          @label : String? = nil,
          @length : Int32? = nil,
          @name : String? = nil,
          @nullable : Int32? = nil,
          @precision : Int32? = nil,
          @scale : Int32? = nil,
          @schema_name : String? = nil,
          @table_name : String? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Connection to a database failed.

      struct DatabaseConnectionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DescribeStatementRequest
        include JSON::Serializable

        # The identifier of the SQL statement to describe. This value is a universally unique identifier
        # (UUID) generated by Amazon Redshift Data API. A suffix indicates the number of the SQL statement.
        # For example, d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2 that indicates the second SQL
        # statement of a batch query. This identifier is returned by BatchExecuteStatment , ExecuteStatement ,
        # and ListStatements .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeStatementResponse
        include JSON::Serializable

        # The identifier of the SQL statement described. This value is a universally unique identifier (UUID)
        # generated by Amazon Redshift Data API.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The cluster identifier.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The date and time (UTC) when the SQL statement was submitted to run.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The name of the database.

        @[JSON::Field(key: "Database")]
        getter database : String?

        # The database user name.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The amount of time in nanoseconds that the statement ran.

        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # The error message from the cluster if the SQL statement encountered an error while running.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # A value that indicates whether the statement has a result set. The result set can be empty. The
        # value is true for an empty result set. The value is true if any substatement returns a result set.

        @[JSON::Field(key: "HasResultSet")]
        getter has_result_set : Bool?

        # The parameters for the SQL statement.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Array(Types::SqlParameter)?

        # The SQL statement text.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        # The process identifier from Amazon Redshift.

        @[JSON::Field(key: "RedshiftPid")]
        getter redshift_pid : Int64?

        # The identifier of the query generated by Amazon Redshift. These identifiers are also available in
        # the query column of the STL_QUERY system view.

        @[JSON::Field(key: "RedshiftQueryId")]
        getter redshift_query_id : Int64?

        # The data format of the result of the SQL statement.

        @[JSON::Field(key: "ResultFormat")]
        getter result_format : String?

        # Either the number of rows returned from the SQL statement or the number of rows affected. If result
        # size is greater than zero, the result rows can be the number of rows affected by SQL statements such
        # as INSERT, UPDATE, DELETE, COPY, and others. A -1 indicates the value is null.

        @[JSON::Field(key: "ResultRows")]
        getter result_rows : Int64?

        # The size in bytes of the returned results. A -1 indicates the value is null.

        @[JSON::Field(key: "ResultSize")]
        getter result_size : Int64?

        # The name or Amazon Resource Name (ARN) of the secret that enables access to the database.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The status of the SQL statement being described. Status values are defined as follows: ABORTED - The
        # query run was stopped by the user. ALL - A status value that includes all query statuses. This value
        # can be used to filter results. FAILED - The query run failed. FINISHED - The query has finished
        # running. PICKED - The query has been chosen to be run. STARTED - The query run has started.
        # SUBMITTED - The query was submitted, but not yet processed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The SQL statements from a multiple statement run.

        @[JSON::Field(key: "SubStatements")]
        getter sub_statements : Array(Types::SubStatementData)?

        # The date and time (UTC) that the metadata for the SQL statement was last updated. An example is the
        # time the status last changed.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The serverless workgroup name or Amazon Resource Name (ARN).

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @id : String,
          @cluster_identifier : String? = nil,
          @created_at : Time? = nil,
          @database : String? = nil,
          @db_user : String? = nil,
          @duration : Int64? = nil,
          @error : String? = nil,
          @has_result_set : Bool? = nil,
          @query_parameters : Array(Types::SqlParameter)? = nil,
          @query_string : String? = nil,
          @redshift_pid : Int64? = nil,
          @redshift_query_id : Int64? = nil,
          @result_format : String? = nil,
          @result_rows : Int64? = nil,
          @result_size : Int64? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @status : String? = nil,
          @sub_statements : Array(Types::SubStatementData)? = nil,
          @updated_at : Time? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct DescribeTableRequest
        include JSON::Serializable

        # The name of the database that contains the tables to be described. If ConnectedDatabase is not
        # specified, this is also the database to connect to with your authentication credentials.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A database name. The connected database is specified when you connect with your authentication
        # credentials.

        @[JSON::Field(key: "ConnectedDatabase")]
        getter connected_database : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The maximum number of tables to return in the response. If more tables exist than fit in one
        # response, then NextToken is returned to page through the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The schema that contains the table. If no schema is specified, then matching tables for all schemas
        # are returned.

        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The table name. If no table is specified, then all tables for all matching schemas are returned. If
        # no table and no schema is specified, then all tables for all schemas in the database are returned

        @[JSON::Field(key: "Table")]
        getter table : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @database : String,
          @cluster_identifier : String? = nil,
          @connected_database : String? = nil,
          @db_user : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema : String? = nil,
          @secret_arn : String? = nil,
          @table : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct DescribeTableResponse
        include JSON::Serializable

        # A list of columns in the table.

        @[JSON::Field(key: "ColumnList")]
        getter column_list : Array(Types::ColumnMetadata)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The table name.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @column_list : Array(Types::ColumnMetadata)? = nil,
          @next_token : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # The SQL statement encountered an environmental error while running.

      struct ExecuteStatementException
        include JSON::Serializable

        # The exception message.

        @[JSON::Field(key: "Message")]
        getter message : String

        # Statement identifier of the exception.

        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        def initialize(
          @message : String,
          @statement_id : String
        )
        end
      end


      struct ExecuteStatementInput
        include JSON::Serializable

        # The SQL statement text to run.

        @[JSON::Field(key: "Sql")]
        getter sql : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The name of the database. This parameter is required when authenticating using either Secrets
        # Manager or temporary credentials.

        @[JSON::Field(key: "Database")]
        getter database : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The parameters for the SQL statement.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::SqlParameter)?

        # The data format of the result of the SQL statement. If no format is specified, the default is JSON.

        @[JSON::Field(key: "ResultFormat")]
        getter result_format : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The number of seconds to keep the session alive after the query finishes. The maximum time a session
        # can keep alive is 24 hours. After 24 hours, the session is forced closed and the query is
        # terminated.

        @[JSON::Field(key: "SessionKeepAliveSeconds")]
        getter session_keep_alive_seconds : Int32?

        # The name of the SQL statement. You can name the SQL statement when you create it to identify the
        # query.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # A value that indicates whether to send an event to the Amazon EventBridge event bus after the SQL
        # statement runs.

        @[JSON::Field(key: "WithEvent")]
        getter with_event : Bool?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @sql : String,
          @client_token : String? = nil,
          @cluster_identifier : String? = nil,
          @database : String? = nil,
          @db_user : String? = nil,
          @parameters : Array(Types::SqlParameter)? = nil,
          @result_format : String? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @session_keep_alive_seconds : Int32? = nil,
          @statement_name : String? = nil,
          @with_event : Bool? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct ExecuteStatementOutput
        include JSON::Serializable

        # The cluster identifier. This element is not returned when connecting to a serverless workgroup.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The date and time (UTC) the statement was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The name of the database.

        @[JSON::Field(key: "Database")]
        getter database : String?

        # A list of colon (:) separated names of database groups.

        @[JSON::Field(key: "DbGroups")]
        getter db_groups : Array(String)?

        # The database user name.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The identifier of the SQL statement whose results are to be fetched. This value is a universally
        # unique identifier (UUID) generated by Amazon Redshift Data API.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name or ARN of the secret that enables access to the database.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This element is not returned when
        # connecting to a provisioned cluster.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @created_at : Time? = nil,
          @database : String? = nil,
          @db_groups : Array(String)? = nil,
          @db_user : String? = nil,
          @id : String? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # A data value in a column.

      struct Field
        include JSON::Serializable

        # A value of the BLOB data type.

        @[JSON::Field(key: "blobValue")]
        getter blob_value : Bytes?

        # A value of the Boolean data type.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # A value of the double data type.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # A value that indicates whether the data is NULL.

        @[JSON::Field(key: "isNull")]
        getter is_null : Bool?

        # A value of the long data type.

        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # A value of the string data type.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @blob_value : Bytes? = nil,
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @is_null : Bool? = nil,
          @long_value : Int64? = nil,
          @string_value : String? = nil
        )
        end
      end


      struct GetStatementResultRequest
        include JSON::Serializable

        # The identifier of the SQL statement whose results are to be fetched. This value is a universally
        # unique identifier (UUID) generated by Amazon Redshift Data API. A suffix indicates then number of
        # the SQL statement. For example, d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2 that
        # indicates the second SQL statement of a batch query. This identifier is returned by
        # BatchExecuteStatment , ExecuteStatment , and ListStatements .

        @[JSON::Field(key: "Id")]
        getter id : String

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @next_token : String? = nil
        )
        end
      end


      struct GetStatementResultResponse
        include JSON::Serializable

        # The results of the SQL statement in JSON format.

        @[JSON::Field(key: "Records")]
        getter records : Array(Array(Types::Field))

        # The properties (metadata) of a column.

        @[JSON::Field(key: "ColumnMetadata")]
        getter column_metadata : Array(Types::ColumnMetadata)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The total number of rows in the result set returned from a query. You can use this number to
        # estimate the number of calls to the GetStatementResult operation needed to page through the results.

        @[JSON::Field(key: "TotalNumRows")]
        getter total_num_rows : Int64?

        def initialize(
          @records : Array(Array(Types::Field)),
          @column_metadata : Array(Types::ColumnMetadata)? = nil,
          @next_token : String? = nil,
          @total_num_rows : Int64? = nil
        )
        end
      end


      struct GetStatementResultV2Request
        include JSON::Serializable

        # The identifier of the SQL statement whose results are to be fetched. This value is a universally
        # unique identifier (UUID) generated by Amazon Redshift Data API. A suffix indicates then number of
        # the SQL statement. For example, d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2 that
        # indicates the second SQL statement of a batch query. This identifier is returned by
        # BatchExecuteStatment , ExecuteStatment , and ListStatements .

        @[JSON::Field(key: "Id")]
        getter id : String

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @next_token : String? = nil
        )
        end
      end


      struct GetStatementResultV2Response
        include JSON::Serializable

        # The results of the SQL statement in CSV format.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::QueryRecords)

        # The properties (metadata) of a column.

        @[JSON::Field(key: "ColumnMetadata")]
        getter column_metadata : Array(Types::ColumnMetadata)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The data format of the result of the SQL statement.

        @[JSON::Field(key: "ResultFormat")]
        getter result_format : String?

        # The total number of rows in the result set returned from a query. You can use this number to
        # estimate the number of calls to the GetStatementResultV2 operation needed to page through the
        # results.

        @[JSON::Field(key: "TotalNumRows")]
        getter total_num_rows : Int64?

        def initialize(
          @records : Array(Types::QueryRecords),
          @column_metadata : Array(Types::ColumnMetadata)? = nil,
          @next_token : String? = nil,
          @result_format : String? = nil,
          @total_num_rows : Int64? = nil
        )
        end
      end

      # The Amazon Redshift Data API operation failed due to invalid input.

      struct InternalServerException
        include JSON::Serializable

        # The exception message.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListDatabasesRequest
        include JSON::Serializable

        # The name of the database. This parameter is required when authenticating using either Secrets
        # Manager or temporary credentials.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The maximum number of databases to return in the response. If more databases exist than fit in one
        # response, then NextToken is returned to page through the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @database : String,
          @cluster_identifier : String? = nil,
          @db_user : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @secret_arn : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct ListDatabasesResponse
        include JSON::Serializable

        # The names of databases.

        @[JSON::Field(key: "Databases")]
        getter databases : Array(String)?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @databases : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemasRequest
        include JSON::Serializable

        # The name of the database that contains the schemas to list. If ConnectedDatabase is not specified,
        # this is also the database to connect to with your authentication credentials.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A database name. The connected database is specified when you connect with your authentication
        # credentials.

        @[JSON::Field(key: "ConnectedDatabase")]
        getter connected_database : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The maximum number of schemas to return in the response. If more schemas exist than fit in one
        # response, then NextToken is returned to page through the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A pattern to filter results by schema name. Within a schema pattern, "%" means match any substring
        # of 0 or more characters and "_" means match any one character. Only schema name entries matching the
        # search pattern are returned.

        @[JSON::Field(key: "SchemaPattern")]
        getter schema_pattern : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @database : String,
          @cluster_identifier : String? = nil,
          @connected_database : String? = nil,
          @db_user : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_pattern : String? = nil,
          @secret_arn : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct ListSchemasResponse
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The schemas that match the request pattern.

        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(String)? = nil
        )
        end
      end


      struct ListStatementsRequest
        include JSON::Serializable

        # The cluster identifier. Only statements that ran on this cluster are returned. When providing
        # ClusterIdentifier , then WorkgroupName can't be specified.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # The name of the database when listing statements run against a ClusterIdentifier or WorkgroupName .

        @[JSON::Field(key: "Database")]
        getter database : String?

        # The maximum number of SQL statements to return in the response. If more SQL statements exist than
        # fit in one response, then NextToken is returned to page through the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A value that filters which statements to return in the response. If true, all statements run by the
        # caller's IAM role are returned. If false, only statements run by the caller's IAM role in the
        # current IAM session are returned. The default is true.

        @[JSON::Field(key: "RoleLevel")]
        getter role_level : Bool?

        # The name of the SQL statement specified as input to BatchExecuteStatement or ExecuteStatement to
        # identify the query. You can list multiple statements by providing a prefix that matches the
        # beginning of the statement name. For example, to list myStatement1, myStatement2, myStatement3, and
        # so on, then provide the a value of myStatement . Data API does a case-sensitive match of SQL
        # statement names to the prefix value you provide.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # The status of the SQL statement to list. Status values are defined as follows: ABORTED - The query
        # run was stopped by the user. ALL - A status value that includes all query statuses. This value can
        # be used to filter results. FAILED - The query run failed. FINISHED - The query has finished running.
        # PICKED - The query has been chosen to be run. STARTED - The query run has started. SUBMITTED - The
        # query was submitted, but not yet processed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). Only statements that ran on this
        # workgroup are returned. When providing WorkgroupName , then ClusterIdentifier can't be specified.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @cluster_identifier : String? = nil,
          @database : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @role_level : Bool? = nil,
          @statement_name : String? = nil,
          @status : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct ListStatementsResponse
        include JSON::Serializable

        # The SQL statements.

        @[JSON::Field(key: "Statements")]
        getter statements : Array(Types::StatementData)

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @statements : Array(Types::StatementData),
          @next_token : String? = nil
        )
        end
      end


      struct ListTablesRequest
        include JSON::Serializable

        # The name of the database that contains the tables to list. If ConnectedDatabase is not specified,
        # this is also the database to connect to with your authentication credentials.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The cluster identifier. This parameter is required when connecting to a cluster and authenticating
        # using either Secrets Manager or temporary credentials.

        @[JSON::Field(key: "ClusterIdentifier")]
        getter cluster_identifier : String?

        # A database name. The connected database is specified when you connect with your authentication
        # credentials.

        @[JSON::Field(key: "ConnectedDatabase")]
        getter connected_database : String?

        # The database user name. This parameter is required when connecting to a cluster as a database user
        # and authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The maximum number of tables to return in the response. If more tables exist than fit in one
        # response, then NextToken is returned to page through the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A pattern to filter results by schema name. Within a schema pattern, "%" means match any substring
        # of 0 or more characters and "_" means match any one character. Only schema name entries matching the
        # search pattern are returned. If SchemaPattern is not specified, then all tables that match
        # TablePattern are returned. If neither SchemaPattern or TablePattern are specified, then all tables
        # are returned.

        @[JSON::Field(key: "SchemaPattern")]
        getter schema_pattern : String?

        # The name or ARN of the secret that enables access to the database. This parameter is required when
        # authenticating using Secrets Manager.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # A pattern to filter results by table name. Within a table pattern, "%" means match any substring of
        # 0 or more characters and "_" means match any one character. Only table name entries matching the
        # search pattern are returned. If TablePattern is not specified, then all tables that match
        # SchemaPattern are returned. If neither SchemaPattern or TablePattern are specified, then all tables
        # are returned.

        @[JSON::Field(key: "TablePattern")]
        getter table_pattern : String?

        # The serverless workgroup name or Amazon Resource Name (ARN). This parameter is required when
        # connecting to a serverless workgroup and authenticating using either Secrets Manager or temporary
        # credentials.

        @[JSON::Field(key: "WorkgroupName")]
        getter workgroup_name : String?

        def initialize(
          @database : String,
          @cluster_identifier : String? = nil,
          @connected_database : String? = nil,
          @db_user : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_pattern : String? = nil,
          @secret_arn : String? = nil,
          @table_pattern : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end


      struct ListTablesResponse
        include JSON::Serializable

        # A value that indicates the starting point for the next set of response records in a subsequent
        # request. If a value is returned in a response, you can retrieve the next set of records by providing
        # this returned NextToken value in the next NextToken parameter and retrying the command. If the
        # NextToken field is empty, all response records have been retrieved for the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tables that match the request pattern.

        @[JSON::Field(key: "Tables")]
        getter tables : Array(Types::TableMember)?

        def initialize(
          @next_token : String? = nil,
          @tables : Array(Types::TableMember)? = nil
        )
        end
      end

      # The results of the SQL statement.

      struct QueryRecords
        include JSON::Serializable

        # The results of the SQL statement in CSV format.

        @[JSON::Field(key: "CSVRecords")]
        getter csv_records : String?

        def initialize(
          @csv_records : String? = nil
        )
        end
      end

      # The Amazon Redshift Data API operation failed due to timeout.

      struct QueryTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon Redshift Data API operation failed due to a missing resource.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The exception message.

        @[JSON::Field(key: "Message")]
        getter message : String

        # Resource identifier associated with the exception.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end

      # A parameter used in a SQL statement.

      struct SqlParameter
        include JSON::Serializable

        # The name of the parameter.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the parameter. Amazon Redshift implicitly converts to the proper data type. For more
        # information, see Data types in the Amazon Redshift Database Developer Guide .

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The SQL statement to run.

      struct StatementData
        include JSON::Serializable

        # The SQL statement identifier. This value is a universally unique identifier (UUID) generated by
        # Amazon Redshift Data API.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time (UTC) the statement was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A value that indicates whether the statement is a batch query request.

        @[JSON::Field(key: "IsBatchStatement")]
        getter is_batch_statement : Bool?

        # The parameters used in a SQL statement.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Array(Types::SqlParameter)?

        # The SQL statement.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        # One or more SQL statements. Each query string in the array corresponds to one of the queries in a
        # batch query request.

        @[JSON::Field(key: "QueryStrings")]
        getter query_strings : Array(String)?

        # The data format of the result of the SQL statement.

        @[JSON::Field(key: "ResultFormat")]
        getter result_format : String?

        # The name or Amazon Resource Name (ARN) of the secret that enables access to the database.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The session identifier of the query.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The name of the SQL statement.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # The status of the SQL statement. An example is the that the SQL statement finished.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time (UTC) that the statement metadata was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @id : String,
          @created_at : Time? = nil,
          @is_batch_statement : Bool? = nil,
          @query_parameters : Array(Types::SqlParameter)? = nil,
          @query_string : String? = nil,
          @query_strings : Array(String)? = nil,
          @result_format : String? = nil,
          @secret_arn : String? = nil,
          @session_id : String? = nil,
          @statement_name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about an SQL statement.

      struct SubStatementData
        include JSON::Serializable

        # The identifier of the SQL statement. This value is a universally unique identifier (UUID) generated
        # by Amazon Redshift Data API. A suffix indicates the number of the SQL statement. For example,
        # d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2 that indicates the second SQL statement of
        # a batch query.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time (UTC) the statement was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The amount of time in nanoseconds that the statement ran.

        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # The error message from the cluster if the SQL statement encountered an error while running.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # A value that indicates whether the statement has a result set. The result set can be empty. The
        # value is true for an empty result set.

        @[JSON::Field(key: "HasResultSet")]
        getter has_result_set : Bool?

        # The SQL statement text.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        # The SQL statement identifier. This value is a universally unique identifier (UUID) generated by
        # Amazon Redshift Data API.

        @[JSON::Field(key: "RedshiftQueryId")]
        getter redshift_query_id : Int64?

        # Either the number of rows returned from the SQL statement or the number of rows affected. If result
        # size is greater than zero, the result rows can be the number of rows affected by SQL statements such
        # as INSERT, UPDATE, DELETE, COPY, and others. A -1 indicates the value is null.

        @[JSON::Field(key: "ResultRows")]
        getter result_rows : Int64?

        # The size in bytes of the returned results. A -1 indicates the value is null.

        @[JSON::Field(key: "ResultSize")]
        getter result_size : Int64?

        # The status of the SQL statement. An example is the that the SQL statement finished.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time (UTC) that the statement metadata was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @id : String,
          @created_at : Time? = nil,
          @duration : Int64? = nil,
          @error : String? = nil,
          @has_result_set : Bool? = nil,
          @query_string : String? = nil,
          @redshift_query_id : Int64? = nil,
          @result_rows : Int64? = nil,
          @result_size : Int64? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The properties of a table.

      struct TableMember
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The schema containing the table.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        # The type of the table. Possible values include TABLE, VIEW, SYSTEM TABLE, GLOBAL TEMPORARY, LOCAL
        # TEMPORARY, ALIAS, and SYNONYM.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @schema : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Amazon Redshift Data API operation failed due to invalid input.

      struct ValidationException
        include JSON::Serializable

        # The exception message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
