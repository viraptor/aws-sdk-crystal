module AwsSdk
  module RedshiftData
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

      # Runs one or more SQL statements, which can be data manipulation language (DML) or data definition
      # language (DDL). Depending on the authorization method, use one of the following combinations of
      # request parameters: Secrets Manager - when connecting to a cluster, provide the secret-arn of a
      # secret stored in Secrets Manager which has username and password . The specified secret contains
      # credentials to connect to the database you specify. When you are connecting to a cluster, you also
      # supply the database name, If you provide a cluster identifier ( dbClusterIdentifier ), it must match
      # the cluster identifier stored in the secret. When you are connecting to a serverless workgroup, you
      # also supply the database name. Temporary credentials - when connecting to your data warehouse,
      # choose one of the following options: When connecting to a serverless workgroup, specify the
      # workgroup name and database name. The database user name is derived from the IAM identity. For
      # example, arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to
      # call the redshift-serverless:GetCredentials operation is required. When connecting to a cluster as
      # an IAM identity, specify the cluster identifier and the database name. The database user name is
      # derived from the IAM identity. For example, arn:iam::123456789012:user:foo has the database user
      # name IAM:foo . Also, permission to call the redshift:GetClusterCredentialsWithIAM operation is
      # required. When connecting to a cluster as a database user, specify the cluster identifier, the
      # database name, and the database user name. Also, permission to call the
      # redshift:GetClusterCredentials operation is required. For more information about the Amazon Redshift
      # Data API and CLI usage examples, see Using the Amazon Redshift Data API in the Amazon Redshift
      # Management Guide .
      def batch_execute_statement(
        sqls : Array(String),
        client_token : String? = nil,
        cluster_identifier : String? = nil,
        database : String? = nil,
        db_user : String? = nil,
        result_format : String? = nil,
        secret_arn : String? = nil,
        session_id : String? = nil,
        session_keep_alive_seconds : Int32? = nil,
        statement_name : String? = nil,
        with_event : Bool? = nil,
        workgroup_name : String? = nil
      ) : Types::BatchExecuteStatementOutput
        input = Types::BatchExecuteStatementInput.new(sqls: sqls, client_token: client_token, cluster_identifier: cluster_identifier, database: database, db_user: db_user, result_format: result_format, secret_arn: secret_arn, session_id: session_id, session_keep_alive_seconds: session_keep_alive_seconds, statement_name: statement_name, with_event: with_event, workgroup_name: workgroup_name)
        batch_execute_statement(input)
      end
      def batch_execute_statement(input : Types::BatchExecuteStatementInput) : Types::BatchExecuteStatementOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_EXECUTE_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchExecuteStatementOutput, "BatchExecuteStatement")
      end

      # Cancels a running query. To be canceled, a query must be running. For more information about the
      # Amazon Redshift Data API and CLI usage examples, see Using the Amazon Redshift Data API in the
      # Amazon Redshift Management Guide .
      def cancel_statement(
        id : String
      ) : Types::CancelStatementResponse
        input = Types::CancelStatementRequest.new(id: id)
        cancel_statement(input)
      end
      def cancel_statement(input : Types::CancelStatementRequest) : Types::CancelStatementResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelStatementResponse, "CancelStatement")
      end

      # Describes the details about a specific instance when a query was run by the Amazon Redshift Data
      # API. The information includes when the query started, when it finished, the query status, the number
      # of rows returned, and the SQL statement. For more information about the Amazon Redshift Data API and
      # CLI usage examples, see Using the Amazon Redshift Data API in the Amazon Redshift Management Guide .
      def describe_statement(
        id : String
      ) : Types::DescribeStatementResponse
        input = Types::DescribeStatementRequest.new(id: id)
        describe_statement(input)
      end
      def describe_statement(input : Types::DescribeStatementRequest) : Types::DescribeStatementResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStatementResponse, "DescribeStatement")
      end

      # Describes the detailed information about a table from metadata in the cluster. The information
      # includes its columns. A token is returned to page through the column list. Depending on the
      # authorization method, use one of the following combinations of request parameters: Secrets Manager -
      # when connecting to a cluster, provide the secret-arn of a secret stored in Secrets Manager which has
      # username and password . The specified secret contains credentials to connect to the database you
      # specify. When you are connecting to a cluster, you also supply the database name, If you provide a
      # cluster identifier ( dbClusterIdentifier ), it must match the cluster identifier stored in the
      # secret. When you are connecting to a serverless workgroup, you also supply the database name.
      # Temporary credentials - when connecting to your data warehouse, choose one of the following options:
      # When connecting to a serverless workgroup, specify the workgroup name and database name. The
      # database user name is derived from the IAM identity. For example, arn:iam::123456789012:user:foo has
      # the database user name IAM:foo . Also, permission to call the redshift-serverless:GetCredentials
      # operation is required. When connecting to a cluster as an IAM identity, specify the cluster
      # identifier and the database name. The database user name is derived from the IAM identity. For
      # example, arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to
      # call the redshift:GetClusterCredentialsWithIAM operation is required. When connecting to a cluster
      # as a database user, specify the cluster identifier, the database name, and the database user name.
      # Also, permission to call the redshift:GetClusterCredentials operation is required. For more
      # information about the Amazon Redshift Data API and CLI usage examples, see Using the Amazon Redshift
      # Data API in the Amazon Redshift Management Guide .
      def describe_table(
        database : String,
        cluster_identifier : String? = nil,
        connected_database : String? = nil,
        db_user : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema : String? = nil,
        secret_arn : String? = nil,
        table : String? = nil,
        workgroup_name : String? = nil
      ) : Types::DescribeTableResponse
        input = Types::DescribeTableRequest.new(database: database, cluster_identifier: cluster_identifier, connected_database: connected_database, db_user: db_user, max_results: max_results, next_token: next_token, schema: schema, secret_arn: secret_arn, table: table, workgroup_name: workgroup_name)
        describe_table(input)
      end
      def describe_table(input : Types::DescribeTableRequest) : Types::DescribeTableResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTableResponse, "DescribeTable")
      end

      # Runs an SQL statement, which can be data manipulation language (DML) or data definition language
      # (DDL). This statement must be a single SQL statement. Depending on the authorization method, use one
      # of the following combinations of request parameters: Secrets Manager - when connecting to a cluster,
      # provide the secret-arn of a secret stored in Secrets Manager which has username and password . The
      # specified secret contains credentials to connect to the database you specify. When you are
      # connecting to a cluster, you also supply the database name, If you provide a cluster identifier (
      # dbClusterIdentifier ), it must match the cluster identifier stored in the secret. When you are
      # connecting to a serverless workgroup, you also supply the database name. Temporary credentials -
      # when connecting to your data warehouse, choose one of the following options: When connecting to a
      # serverless workgroup, specify the workgroup name and database name. The database user name is
      # derived from the IAM identity. For example, arn:iam::123456789012:user:foo has the database user
      # name IAM:foo . Also, permission to call the redshift-serverless:GetCredentials operation is
      # required. When connecting to a cluster as an IAM identity, specify the cluster identifier and the
      # database name. The database user name is derived from the IAM identity. For example,
      # arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to call the
      # redshift:GetClusterCredentialsWithIAM operation is required. When connecting to a cluster as a
      # database user, specify the cluster identifier, the database name, and the database user name. Also,
      # permission to call the redshift:GetClusterCredentials operation is required. For more information
      # about the Amazon Redshift Data API and CLI usage examples, see Using the Amazon Redshift Data API in
      # the Amazon Redshift Management Guide .
      def execute_statement(
        sql : String,
        client_token : String? = nil,
        cluster_identifier : String? = nil,
        database : String? = nil,
        db_user : String? = nil,
        parameters : Array(Types::SqlParameter)? = nil,
        result_format : String? = nil,
        secret_arn : String? = nil,
        session_id : String? = nil,
        session_keep_alive_seconds : Int32? = nil,
        statement_name : String? = nil,
        with_event : Bool? = nil,
        workgroup_name : String? = nil
      ) : Types::ExecuteStatementOutput
        input = Types::ExecuteStatementInput.new(sql: sql, client_token: client_token, cluster_identifier: cluster_identifier, database: database, db_user: db_user, parameters: parameters, result_format: result_format, secret_arn: secret_arn, session_id: session_id, session_keep_alive_seconds: session_keep_alive_seconds, statement_name: statement_name, with_event: with_event, workgroup_name: workgroup_name)
        execute_statement(input)
      end
      def execute_statement(input : Types::ExecuteStatementInput) : Types::ExecuteStatementOutput
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExecuteStatementOutput, "ExecuteStatement")
      end

      # Fetches the temporarily cached result of an SQL statement in JSON format. The ExecuteStatement or
      # BatchExecuteStatement operation that ran the SQL statement must have specified ResultFormat as JSON
      # , or let the format default to JSON. A token is returned to page through the statement results. For
      # more information about the Amazon Redshift Data API and CLI usage examples, see Using the Amazon
      # Redshift Data API in the Amazon Redshift Management Guide .
      def get_statement_result(
        id : String,
        next_token : String? = nil
      ) : Types::GetStatementResultResponse
        input = Types::GetStatementResultRequest.new(id: id, next_token: next_token)
        get_statement_result(input)
      end
      def get_statement_result(input : Types::GetStatementResultRequest) : Types::GetStatementResultResponse
        request = Protocol::JsonRpc.build_request(Model::GET_STATEMENT_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStatementResultResponse, "GetStatementResult")
      end

      # Fetches the temporarily cached result of an SQL statement in CSV format. The ExecuteStatement or
      # BatchExecuteStatement operation that ran the SQL statement must have specified ResultFormat as CSV .
      # A token is returned to page through the statement results. For more information about the Amazon
      # Redshift Data API and CLI usage examples, see Using the Amazon Redshift Data API in the Amazon
      # Redshift Management Guide .
      def get_statement_result_v2(
        id : String,
        next_token : String? = nil
      ) : Types::GetStatementResultV2Response
        input = Types::GetStatementResultV2Request.new(id: id, next_token: next_token)
        get_statement_result_v2(input)
      end
      def get_statement_result_v2(input : Types::GetStatementResultV2Request) : Types::GetStatementResultV2Response
        request = Protocol::JsonRpc.build_request(Model::GET_STATEMENT_RESULT_V2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStatementResultV2Response, "GetStatementResultV2")
      end

      # List the databases in a cluster. A token is returned to page through the database list. Depending on
      # the authorization method, use one of the following combinations of request parameters: Secrets
      # Manager - when connecting to a cluster, provide the secret-arn of a secret stored in Secrets Manager
      # which has username and password . The specified secret contains credentials to connect to the
      # database you specify. When you are connecting to a cluster, you also supply the database name, If
      # you provide a cluster identifier ( dbClusterIdentifier ), it must match the cluster identifier
      # stored in the secret. When you are connecting to a serverless workgroup, you also supply the
      # database name. Temporary credentials - when connecting to your data warehouse, choose one of the
      # following options: When connecting to a serverless workgroup, specify the workgroup name and
      # database name. The database user name is derived from the IAM identity. For example,
      # arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to call the
      # redshift-serverless:GetCredentials operation is required. When connecting to a cluster as an IAM
      # identity, specify the cluster identifier and the database name. The database user name is derived
      # from the IAM identity. For example, arn:iam::123456789012:user:foo has the database user name
      # IAM:foo . Also, permission to call the redshift:GetClusterCredentialsWithIAM operation is required.
      # When connecting to a cluster as a database user, specify the cluster identifier, the database name,
      # and the database user name. Also, permission to call the redshift:GetClusterCredentials operation is
      # required. For more information about the Amazon Redshift Data API and CLI usage examples, see Using
      # the Amazon Redshift Data API in the Amazon Redshift Management Guide .
      def list_databases(
        database : String,
        cluster_identifier : String? = nil,
        db_user : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        secret_arn : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListDatabasesResponse
        input = Types::ListDatabasesRequest.new(database: database, cluster_identifier: cluster_identifier, db_user: db_user, max_results: max_results, next_token: next_token, secret_arn: secret_arn, workgroup_name: workgroup_name)
        list_databases(input)
      end
      def list_databases(input : Types::ListDatabasesRequest) : Types::ListDatabasesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatabasesResponse, "ListDatabases")
      end

      # Lists the schemas in a database. A token is returned to page through the schema list. Depending on
      # the authorization method, use one of the following combinations of request parameters: Secrets
      # Manager - when connecting to a cluster, provide the secret-arn of a secret stored in Secrets Manager
      # which has username and password . The specified secret contains credentials to connect to the
      # database you specify. When you are connecting to a cluster, you also supply the database name, If
      # you provide a cluster identifier ( dbClusterIdentifier ), it must match the cluster identifier
      # stored in the secret. When you are connecting to a serverless workgroup, you also supply the
      # database name. Temporary credentials - when connecting to your data warehouse, choose one of the
      # following options: When connecting to a serverless workgroup, specify the workgroup name and
      # database name. The database user name is derived from the IAM identity. For example,
      # arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to call the
      # redshift-serverless:GetCredentials operation is required. When connecting to a cluster as an IAM
      # identity, specify the cluster identifier and the database name. The database user name is derived
      # from the IAM identity. For example, arn:iam::123456789012:user:foo has the database user name
      # IAM:foo . Also, permission to call the redshift:GetClusterCredentialsWithIAM operation is required.
      # When connecting to a cluster as a database user, specify the cluster identifier, the database name,
      # and the database user name. Also, permission to call the redshift:GetClusterCredentials operation is
      # required. For more information about the Amazon Redshift Data API and CLI usage examples, see Using
      # the Amazon Redshift Data API in the Amazon Redshift Management Guide .
      def list_schemas(
        database : String,
        cluster_identifier : String? = nil,
        connected_database : String? = nil,
        db_user : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_pattern : String? = nil,
        secret_arn : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListSchemasResponse
        input = Types::ListSchemasRequest.new(database: database, cluster_identifier: cluster_identifier, connected_database: connected_database, db_user: db_user, max_results: max_results, next_token: next_token, schema_pattern: schema_pattern, secret_arn: secret_arn, workgroup_name: workgroup_name)
        list_schemas(input)
      end
      def list_schemas(input : Types::ListSchemasRequest) : Types::ListSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSchemasResponse, "ListSchemas")
      end

      # List of SQL statements. By default, only finished statements are shown. A token is returned to page
      # through the statement list. When you use identity-enhanced role sessions to list statements, you
      # must provide either the cluster-identifier or workgroup-name parameter. This ensures that the IdC
      # user can only access the Amazon Redshift IdC applications they are assigned. For more information,
      # see Trusted identity propagation overview . For more information about the Amazon Redshift Data API
      # and CLI usage examples, see Using the Amazon Redshift Data API in the Amazon Redshift Management
      # Guide .
      def list_statements(
        cluster_identifier : String? = nil,
        database : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        role_level : Bool? = nil,
        statement_name : String? = nil,
        status : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListStatementsResponse
        input = Types::ListStatementsRequest.new(cluster_identifier: cluster_identifier, database: database, max_results: max_results, next_token: next_token, role_level: role_level, statement_name: statement_name, status: status, workgroup_name: workgroup_name)
        list_statements(input)
      end
      def list_statements(input : Types::ListStatementsRequest) : Types::ListStatementsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STATEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStatementsResponse, "ListStatements")
      end

      # List the tables in a database. If neither SchemaPattern nor TablePattern are specified, then all
      # tables in the database are returned. A token is returned to page through the table list. Depending
      # on the authorization method, use one of the following combinations of request parameters: Secrets
      # Manager - when connecting to a cluster, provide the secret-arn of a secret stored in Secrets Manager
      # which has username and password . The specified secret contains credentials to connect to the
      # database you specify. When you are connecting to a cluster, you also supply the database name, If
      # you provide a cluster identifier ( dbClusterIdentifier ), it must match the cluster identifier
      # stored in the secret. When you are connecting to a serverless workgroup, you also supply the
      # database name. Temporary credentials - when connecting to your data warehouse, choose one of the
      # following options: When connecting to a serverless workgroup, specify the workgroup name and
      # database name. The database user name is derived from the IAM identity. For example,
      # arn:iam::123456789012:user:foo has the database user name IAM:foo . Also, permission to call the
      # redshift-serverless:GetCredentials operation is required. When connecting to a cluster as an IAM
      # identity, specify the cluster identifier and the database name. The database user name is derived
      # from the IAM identity. For example, arn:iam::123456789012:user:foo has the database user name
      # IAM:foo . Also, permission to call the redshift:GetClusterCredentialsWithIAM operation is required.
      # When connecting to a cluster as a database user, specify the cluster identifier, the database name,
      # and the database user name. Also, permission to call the redshift:GetClusterCredentials operation is
      # required. For more information about the Amazon Redshift Data API and CLI usage examples, see Using
      # the Amazon Redshift Data API in the Amazon Redshift Management Guide .
      def list_tables(
        database : String,
        cluster_identifier : String? = nil,
        connected_database : String? = nil,
        db_user : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_pattern : String? = nil,
        secret_arn : String? = nil,
        table_pattern : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListTablesResponse
        input = Types::ListTablesRequest.new(database: database, cluster_identifier: cluster_identifier, connected_database: connected_database, db_user: db_user, max_results: max_results, next_token: next_token, schema_pattern: schema_pattern, secret_arn: secret_arn, table_pattern: table_pattern, workgroup_name: workgroup_name)
        list_tables(input)
      end
      def list_tables(input : Types::ListTablesRequest) : Types::ListTablesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTablesResponse, "ListTables")
      end
    end
  end
end
