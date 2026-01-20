module AwsSdk
  module RDSData
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

      # Runs a batch SQL statement over an array of data. You can run bulk update and insert operations for
      # multiple records using a DML statement with different parameter sets. Bulk operations can provide a
      # significant performance improvement over individual insert and update operations. If a call isn't
      # part of a transaction because it doesn't include the transactionID parameter, changes that result
      # from the call are committed automatically. There isn't a fixed upper limit on the number of
      # parameter sets. However, the maximum size of the HTTP request submitted through the Data API is 4
      # MiB. If the request exceeds this limit, the Data API returns an error and doesn't process the
      # request. This 4-MiB limit includes the size of the HTTP headers and the JSON notation in the
      # request. Thus, the number of parameter sets that you can include depends on a combination of
      # factors, such as the size of the SQL statement and the size of each parameter set. The response size
      # limit is 1 MiB. If the call returns more than 1 MiB of response data, the call is terminated.

      def batch_execute_statement(
        resource_arn : String,
        secret_arn : String,
        sql : String,
        database : String? = nil,
        parameter_sets : Array(Array(Types::SqlParameter))? = nil,
        schema : String? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchExecuteStatementRequest.new(resource_arn: resource_arn, secret_arn: secret_arn, sql: sql, database: database, parameter_sets: parameter_sets, schema: schema, transaction_id: transaction_id)
        batch_execute_statement(input)
      end

      def batch_execute_statement(input : Types::BatchExecuteStatementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_EXECUTE_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a SQL transaction. A transaction can run for a maximum of 24 hours. A transaction is
      # terminated and rolled back automatically after 24 hours. A transaction times out if no calls use its
      # transaction ID in three minutes. If a transaction times out before it's committed, it's rolled back
      # automatically. For Aurora MySQL, DDL statements inside a transaction cause an implicit commit. We
      # recommend that you run each MySQL DDL statement in a separate ExecuteStatement call with
      # continueAfterTimeout enabled.

      def begin_transaction(
        resource_arn : String,
        secret_arn : String,
        database : String? = nil,
        schema : String? = nil
      ) : Protocol::Request
        input = Types::BeginTransactionRequest.new(resource_arn: resource_arn, secret_arn: secret_arn, database: database, schema: schema)
        begin_transaction(input)
      end

      def begin_transaction(input : Types::BeginTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BEGIN_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ends a SQL transaction started with the BeginTransaction operation and commits the changes.

      def commit_transaction(
        resource_arn : String,
        secret_arn : String,
        transaction_id : String
      ) : Protocol::Request
        input = Types::CommitTransactionRequest.new(resource_arn: resource_arn, secret_arn: secret_arn, transaction_id: transaction_id)
        commit_transaction(input)
      end

      def commit_transaction(input : Types::CommitTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMMIT_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Runs one or more SQL statements. This operation isn't supported for Aurora Serverless v2 and
      # provisioned DB clusters. For Aurora Serverless v1 DB clusters, the operation is deprecated. Use the
      # BatchExecuteStatement or ExecuteStatement operation.

      def execute_sql(
        aws_secret_store_arn : String,
        db_cluster_or_instance_arn : String,
        sql_statements : String,
        database : String? = nil,
        schema : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteSqlRequest.new(aws_secret_store_arn: aws_secret_store_arn, db_cluster_or_instance_arn: db_cluster_or_instance_arn, sql_statements: sql_statements, database: database, schema: schema)
        execute_sql(input)
      end

      def execute_sql(input : Types::ExecuteSqlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_SQL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Runs a SQL statement against a database. If a call isn't part of a transaction because it doesn't
      # include the transactionID parameter, changes that result from the call are committed automatically.
      # If the binary response data from the database is more than 1 MB, the call is terminated.

      def execute_statement(
        resource_arn : String,
        secret_arn : String,
        sql : String,
        continue_after_timeout : Bool? = nil,
        database : String? = nil,
        format_records_as : String? = nil,
        include_result_metadata : Bool? = nil,
        parameters : Array(Types::SqlParameter)? = nil,
        result_set_options : Types::ResultSetOptions? = nil,
        schema : String? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteStatementRequest.new(resource_arn: resource_arn, secret_arn: secret_arn, sql: sql, continue_after_timeout: continue_after_timeout, database: database, format_records_as: format_records_as, include_result_metadata: include_result_metadata, parameters: parameters, result_set_options: result_set_options, schema: schema, transaction_id: transaction_id)
        execute_statement(input)
      end

      def execute_statement(input : Types::ExecuteStatementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_STATEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs a rollback of a transaction. Rolling back a transaction cancels its changes.

      def rollback_transaction(
        resource_arn : String,
        secret_arn : String,
        transaction_id : String
      ) : Protocol::Request
        input = Types::RollbackTransactionRequest.new(resource_arn: resource_arn, secret_arn: secret_arn, transaction_id: transaction_id)
        rollback_transaction(input)
      end

      def rollback_transaction(input : Types::RollbackTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ROLLBACK_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
