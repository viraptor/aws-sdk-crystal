module AwsSdk
  module Athena
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

      # Returns the details of a single named query or a list of up to 50 queries, which you provide as an
      # array of query ID strings. Requires you to have access to the workgroup in which the queries were
      # saved. Use ListNamedQueriesInput to get the list of named query IDs in the specified workgroup. If
      # information could not be retrieved for a submitted query ID, information about the query ID
      # submitted is listed under UnprocessedNamedQueryId . Named queries differ from executed queries. Use
      # BatchGetQueryExecutionInput to get details about each unique query execution, and
      # ListQueryExecutionsInput to get a list of query execution IDs.

      def batch_get_named_query(
        named_query_ids : Array(String)
      ) : Types::BatchGetNamedQueryOutput

        input = Types::BatchGetNamedQueryInput.new(named_query_ids: named_query_ids)
        batch_get_named_query(input)
      end

      def batch_get_named_query(input : Types::BatchGetNamedQueryInput) : Types::BatchGetNamedQueryOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_NAMED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetNamedQueryOutput, "BatchGetNamedQuery")
      end

      # Returns the details of a single prepared statement or a list of up to 256 prepared statements for
      # the array of prepared statement names that you provide. Requires you to have access to the workgroup
      # to which the prepared statements belong. If a prepared statement cannot be retrieved for the name
      # specified, the statement is listed in UnprocessedPreparedStatementNames .

      def batch_get_prepared_statement(
        prepared_statement_names : Array(String),
        work_group : String
      ) : Types::BatchGetPreparedStatementOutput

        input = Types::BatchGetPreparedStatementInput.new(prepared_statement_names: prepared_statement_names, work_group: work_group)
        batch_get_prepared_statement(input)
      end

      def batch_get_prepared_statement(input : Types::BatchGetPreparedStatementInput) : Types::BatchGetPreparedStatementOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_PREPARED_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetPreparedStatementOutput, "BatchGetPreparedStatement")
      end

      # Returns the details of a single query execution or a list of up to 50 query executions, which you
      # provide as an array of query execution ID strings. Requires you to have access to the workgroup in
      # which the queries ran. To get a list of query execution IDs, use ListQueryExecutionsInput$WorkGroup
      # . Query executions differ from named (saved) queries. Use BatchGetNamedQueryInput to get details
      # about named queries.

      def batch_get_query_execution(
        query_execution_ids : Array(String)
      ) : Types::BatchGetQueryExecutionOutput

        input = Types::BatchGetQueryExecutionInput.new(query_execution_ids: query_execution_ids)
        batch_get_query_execution(input)
      end

      def batch_get_query_execution(input : Types::BatchGetQueryExecutionInput) : Types::BatchGetQueryExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_QUERY_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetQueryExecutionOutput, "BatchGetQueryExecution")
      end

      # Cancels the capacity reservation with the specified name. Cancelled reservations remain in your
      # account and will be deleted 45 days after cancellation. During the 45 days, you cannot re-purpose or
      # reuse a reservation that has been cancelled, but you can refer to its tags and view it for
      # historical reference.

      def cancel_capacity_reservation(
        name : String
      ) : Types::CancelCapacityReservationOutput

        input = Types::CancelCapacityReservationInput.new(name: name)
        cancel_capacity_reservation(input)
      end

      def cancel_capacity_reservation(input : Types::CancelCapacityReservationInput) : Types::CancelCapacityReservationOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelCapacityReservationOutput, "CancelCapacityReservation")
      end

      # Creates a capacity reservation with the specified name and number of requested data processing
      # units.

      def create_capacity_reservation(
        name : String,
        target_dpus : Int32,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCapacityReservationOutput

        input = Types::CreateCapacityReservationInput.new(name: name, target_dpus: target_dpus, tags: tags)
        create_capacity_reservation(input)
      end

      def create_capacity_reservation(input : Types::CreateCapacityReservationInput) : Types::CreateCapacityReservationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCapacityReservationOutput, "CreateCapacityReservation")
      end

      # Creates (registers) a data catalog with the specified name and properties. Catalogs created are
      # visible to all users of the same Amazon Web Services account. For a FEDERATED catalog, this API
      # operation creates the following resources. CFN Stack Name with a maximum length of 128 characters
      # and prefix athenafederatedcatalog-CATALOG_NAME_SANITIZED with length 23 characters. Lambda Function
      # Name with a maximum length of 64 characters and prefix athenafederatedcatalog_CATALOG_NAME_SANITIZED
      # with length 23 characters. Glue Connection Name with a maximum length of 255 characters and a prefix
      # athenafederatedcatalog_CATALOG_NAME_SANITIZED with length 23 characters.

      def create_data_catalog(
        name : String,
        type : String,
        description : String? = nil,
        parameters : Hash(String, String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDataCatalogOutput

        input = Types::CreateDataCatalogInput.new(name: name, type: type, description: description, parameters: parameters, tags: tags)
        create_data_catalog(input)
      end

      def create_data_catalog(input : Types::CreateDataCatalogInput) : Types::CreateDataCatalogOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataCatalogOutput, "CreateDataCatalog")
      end

      # Creates a named query in the specified workgroup. Requires that you have access to the workgroup.

      def create_named_query(
        database : String,
        name : String,
        query_string : String,
        client_request_token : String? = nil,
        description : String? = nil,
        work_group : String? = nil
      ) : Types::CreateNamedQueryOutput

        input = Types::CreateNamedQueryInput.new(database: database, name: name, query_string: query_string, client_request_token: client_request_token, description: description, work_group: work_group)
        create_named_query(input)
      end

      def create_named_query(input : Types::CreateNamedQueryInput) : Types::CreateNamedQueryOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_NAMED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNamedQueryOutput, "CreateNamedQuery")
      end

      # Creates an empty ipynb file in the specified Apache Spark enabled workgroup. Throws an error if a
      # file in the workgroup with the same name already exists.

      def create_notebook(
        name : String,
        work_group : String,
        client_request_token : String? = nil
      ) : Types::CreateNotebookOutput

        input = Types::CreateNotebookInput.new(name: name, work_group: work_group, client_request_token: client_request_token)
        create_notebook(input)
      end

      def create_notebook(input : Types::CreateNotebookInput) : Types::CreateNotebookOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_NOTEBOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNotebookOutput, "CreateNotebook")
      end

      # Creates a prepared statement for use with SQL queries in Athena.

      def create_prepared_statement(
        query_statement : String,
        statement_name : String,
        work_group : String,
        description : String? = nil
      ) : Types::CreatePreparedStatementOutput

        input = Types::CreatePreparedStatementInput.new(query_statement: query_statement, statement_name: statement_name, work_group: work_group, description: description)
        create_prepared_statement(input)
      end

      def create_prepared_statement(input : Types::CreatePreparedStatementInput) : Types::CreatePreparedStatementOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PREPARED_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePreparedStatementOutput, "CreatePreparedStatement")
      end

      # Gets an authentication token and the URL at which the notebook can be accessed. During programmatic
      # access, CreatePresignedNotebookUrl must be called every 10 minutes to refresh the authentication
      # token. For information about granting programmatic access, see Grant programmatic access .

      def create_presigned_notebook_url(
        session_id : String
      ) : Types::CreatePresignedNotebookUrlResponse

        input = Types::CreatePresignedNotebookUrlRequest.new(session_id: session_id)
        create_presigned_notebook_url(input)
      end

      def create_presigned_notebook_url(input : Types::CreatePresignedNotebookUrlRequest) : Types::CreatePresignedNotebookUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRESIGNED_NOTEBOOK_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePresignedNotebookUrlResponse, "CreatePresignedNotebookUrl")
      end

      # Creates a workgroup with the specified name. A workgroup can be an Apache Spark enabled workgroup or
      # an Athena SQL workgroup.

      def create_work_group(
        name : String,
        configuration : Types::WorkGroupConfiguration? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWorkGroupOutput

        input = Types::CreateWorkGroupInput.new(name: name, configuration: configuration, description: description, tags: tags)
        create_work_group(input)
      end

      def create_work_group(input : Types::CreateWorkGroupInput) : Types::CreateWorkGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORK_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkGroupOutput, "CreateWorkGroup")
      end

      # Deletes a cancelled capacity reservation. A reservation must be cancelled before it can be deleted.
      # A deleted reservation is immediately removed from your account and can no longer be referenced,
      # including by its ARN. A deleted reservation cannot be called by GetCapacityReservation , and deleted
      # reservations do not appear in the output of ListCapacityReservations .

      def delete_capacity_reservation(
        name : String
      ) : Types::DeleteCapacityReservationOutput

        input = Types::DeleteCapacityReservationInput.new(name: name)
        delete_capacity_reservation(input)
      end

      def delete_capacity_reservation(input : Types::DeleteCapacityReservationInput) : Types::DeleteCapacityReservationOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCapacityReservationOutput, "DeleteCapacityReservation")
      end

      # Deletes a data catalog.

      def delete_data_catalog(
        name : String,
        delete_catalog_only : Bool? = nil
      ) : Types::DeleteDataCatalogOutput

        input = Types::DeleteDataCatalogInput.new(name: name, delete_catalog_only: delete_catalog_only)
        delete_data_catalog(input)
      end

      def delete_data_catalog(input : Types::DeleteDataCatalogInput) : Types::DeleteDataCatalogOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataCatalogOutput, "DeleteDataCatalog")
      end

      # Deletes the named query if you have access to the workgroup in which the query was saved.

      def delete_named_query(
        named_query_id : String
      ) : Types::DeleteNamedQueryOutput

        input = Types::DeleteNamedQueryInput.new(named_query_id: named_query_id)
        delete_named_query(input)
      end

      def delete_named_query(input : Types::DeleteNamedQueryInput) : Types::DeleteNamedQueryOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_NAMED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNamedQueryOutput, "DeleteNamedQuery")
      end

      # Deletes the specified notebook.

      def delete_notebook(
        notebook_id : String
      ) : Types::DeleteNotebookOutput

        input = Types::DeleteNotebookInput.new(notebook_id: notebook_id)
        delete_notebook(input)
      end

      def delete_notebook(input : Types::DeleteNotebookInput) : Types::DeleteNotebookOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_NOTEBOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNotebookOutput, "DeleteNotebook")
      end

      # Deletes the prepared statement with the specified name from the specified workgroup.

      def delete_prepared_statement(
        statement_name : String,
        work_group : String
      ) : Types::DeletePreparedStatementOutput

        input = Types::DeletePreparedStatementInput.new(statement_name: statement_name, work_group: work_group)
        delete_prepared_statement(input)
      end

      def delete_prepared_statement(input : Types::DeletePreparedStatementInput) : Types::DeletePreparedStatementOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PREPARED_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePreparedStatementOutput, "DeletePreparedStatement")
      end

      # Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.

      def delete_work_group(
        work_group : String,
        recursive_delete_option : Bool? = nil
      ) : Types::DeleteWorkGroupOutput

        input = Types::DeleteWorkGroupInput.new(work_group: work_group, recursive_delete_option: recursive_delete_option)
        delete_work_group(input)
      end

      def delete_work_group(input : Types::DeleteWorkGroupInput) : Types::DeleteWorkGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORK_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkGroupOutput, "DeleteWorkGroup")
      end

      # Exports the specified notebook and its metadata.

      def export_notebook(
        notebook_id : String
      ) : Types::ExportNotebookOutput

        input = Types::ExportNotebookInput.new(notebook_id: notebook_id)
        export_notebook(input)
      end

      def export_notebook(input : Types::ExportNotebookInput) : Types::ExportNotebookOutput
        request = Protocol::JsonRpc.build_request(Model::EXPORT_NOTEBOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportNotebookOutput, "ExportNotebook")
      end

      # Describes a previously submitted calculation execution.

      def get_calculation_execution(
        calculation_execution_id : String
      ) : Types::GetCalculationExecutionResponse

        input = Types::GetCalculationExecutionRequest.new(calculation_execution_id: calculation_execution_id)
        get_calculation_execution(input)
      end

      def get_calculation_execution(input : Types::GetCalculationExecutionRequest) : Types::GetCalculationExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALCULATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCalculationExecutionResponse, "GetCalculationExecution")
      end

      # Retrieves the unencrypted code that was executed for the calculation.

      def get_calculation_execution_code(
        calculation_execution_id : String
      ) : Types::GetCalculationExecutionCodeResponse

        input = Types::GetCalculationExecutionCodeRequest.new(calculation_execution_id: calculation_execution_id)
        get_calculation_execution_code(input)
      end

      def get_calculation_execution_code(input : Types::GetCalculationExecutionCodeRequest) : Types::GetCalculationExecutionCodeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALCULATION_EXECUTION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCalculationExecutionCodeResponse, "GetCalculationExecutionCode")
      end

      # Gets the status of a current calculation.

      def get_calculation_execution_status(
        calculation_execution_id : String
      ) : Types::GetCalculationExecutionStatusResponse

        input = Types::GetCalculationExecutionStatusRequest.new(calculation_execution_id: calculation_execution_id)
        get_calculation_execution_status(input)
      end

      def get_calculation_execution_status(input : Types::GetCalculationExecutionStatusRequest) : Types::GetCalculationExecutionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALCULATION_EXECUTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCalculationExecutionStatusResponse, "GetCalculationExecutionStatus")
      end

      # Gets the capacity assignment configuration for a capacity reservation, if one exists.

      def get_capacity_assignment_configuration(
        capacity_reservation_name : String
      ) : Types::GetCapacityAssignmentConfigurationOutput

        input = Types::GetCapacityAssignmentConfigurationInput.new(capacity_reservation_name: capacity_reservation_name)
        get_capacity_assignment_configuration(input)
      end

      def get_capacity_assignment_configuration(input : Types::GetCapacityAssignmentConfigurationInput) : Types::GetCapacityAssignmentConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CAPACITY_ASSIGNMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCapacityAssignmentConfigurationOutput, "GetCapacityAssignmentConfiguration")
      end

      # Returns information about the capacity reservation with the specified name.

      def get_capacity_reservation(
        name : String
      ) : Types::GetCapacityReservationOutput

        input = Types::GetCapacityReservationInput.new(name: name)
        get_capacity_reservation(input)
      end

      def get_capacity_reservation(input : Types::GetCapacityReservationInput) : Types::GetCapacityReservationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCapacityReservationOutput, "GetCapacityReservation")
      end

      # Returns the specified data catalog.

      def get_data_catalog(
        name : String,
        work_group : String? = nil
      ) : Types::GetDataCatalogOutput

        input = Types::GetDataCatalogInput.new(name: name, work_group: work_group)
        get_data_catalog(input)
      end

      def get_data_catalog(input : Types::GetDataCatalogInput) : Types::GetDataCatalogOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataCatalogOutput, "GetDataCatalog")
      end

      # Returns a database object for the specified database and data catalog.

      def get_database(
        catalog_name : String,
        database_name : String,
        work_group : String? = nil
      ) : Types::GetDatabaseOutput

        input = Types::GetDatabaseInput.new(catalog_name: catalog_name, database_name: database_name, work_group: work_group)
        get_database(input)
      end

      def get_database(input : Types::GetDatabaseInput) : Types::GetDatabaseOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDatabaseOutput, "GetDatabase")
      end

      # Returns information about a single query. Requires that you have access to the workgroup in which
      # the query was saved.

      def get_named_query(
        named_query_id : String
      ) : Types::GetNamedQueryOutput

        input = Types::GetNamedQueryInput.new(named_query_id: named_query_id)
        get_named_query(input)
      end

      def get_named_query(input : Types::GetNamedQueryInput) : Types::GetNamedQueryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_NAMED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNamedQueryOutput, "GetNamedQuery")
      end

      # Retrieves notebook metadata for the specified notebook ID.

      def get_notebook_metadata(
        notebook_id : String
      ) : Types::GetNotebookMetadataOutput

        input = Types::GetNotebookMetadataInput.new(notebook_id: notebook_id)
        get_notebook_metadata(input)
      end

      def get_notebook_metadata(input : Types::GetNotebookMetadataInput) : Types::GetNotebookMetadataOutput
        request = Protocol::JsonRpc.build_request(Model::GET_NOTEBOOK_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNotebookMetadataOutput, "GetNotebookMetadata")
      end

      # Retrieves the prepared statement with the specified name from the specified workgroup.

      def get_prepared_statement(
        statement_name : String,
        work_group : String
      ) : Types::GetPreparedStatementOutput

        input = Types::GetPreparedStatementInput.new(statement_name: statement_name, work_group: work_group)
        get_prepared_statement(input)
      end

      def get_prepared_statement(input : Types::GetPreparedStatementInput) : Types::GetPreparedStatementOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PREPARED_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPreparedStatementOutput, "GetPreparedStatement")
      end

      # Returns information about a single execution of a query if you have access to the workgroup in which
      # the query ran. Each time a query executes, information about the query execution is saved with a
      # unique ID.

      def get_query_execution(
        query_execution_id : String
      ) : Types::GetQueryExecutionOutput

        input = Types::GetQueryExecutionInput.new(query_execution_id: query_execution_id)
        get_query_execution(input)
      end

      def get_query_execution(input : Types::GetQueryExecutionInput) : Types::GetQueryExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::GET_QUERY_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueryExecutionOutput, "GetQueryExecution")
      end

      # Streams the results of a single query execution specified by QueryExecutionId from the Athena query
      # results location in Amazon S3. For more information, see Working with query results, recent queries,
      # and output files in the Amazon Athena User Guide . This request does not execute the query but
      # returns results. Use StartQueryExecution to run a query. To stream query results successfully, the
      # IAM principal with permission to call GetQueryResults also must have permissions to the Amazon S3
      # GetObject action for the Athena query results location. IAM principals with permission to the Amazon
      # S3 GetObject action for the query results location are able to retrieve query results from Amazon S3
      # even if permission to the GetQueryResults action is denied. To restrict user or role access, ensure
      # that Amazon S3 permissions to the Athena query location are denied.

      def get_query_results(
        query_execution_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_result_type : String? = nil
      ) : Types::GetQueryResultsOutput

        input = Types::GetQueryResultsInput.new(query_execution_id: query_execution_id, max_results: max_results, next_token: next_token, query_result_type: query_result_type)
        get_query_results(input)
      end

      def get_query_results(input : Types::GetQueryResultsInput) : Types::GetQueryResultsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_QUERY_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueryResultsOutput, "GetQueryResults")
      end

      # Returns query execution runtime statistics related to a single execution of a query if you have
      # access to the workgroup in which the query ran. Statistics from the Timeline section of the response
      # object are available as soon as QueryExecutionStatus$State is in a SUCCEEDED or FAILED state. The
      # remaining non-timeline statistics in the response (like stage-level input and output row count and
      # data size) are updated asynchronously and may not be available immediately after a query completes
      # or, in some cases, may not be returned. The non-timeline statistics are also not included when a
      # query has row-level filters defined in Lake Formation.

      def get_query_runtime_statistics(
        query_execution_id : String
      ) : Types::GetQueryRuntimeStatisticsOutput

        input = Types::GetQueryRuntimeStatisticsInput.new(query_execution_id: query_execution_id)
        get_query_runtime_statistics(input)
      end

      def get_query_runtime_statistics(input : Types::GetQueryRuntimeStatisticsInput) : Types::GetQueryRuntimeStatisticsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_QUERY_RUNTIME_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueryRuntimeStatisticsOutput, "GetQueryRuntimeStatistics")
      end

      # Gets the Live UI/Persistence UI for a session.

      def get_resource_dashboard(
        resource_arn : String
      ) : Types::GetResourceDashboardResponse

        input = Types::GetResourceDashboardRequest.new(resource_arn: resource_arn)
        get_resource_dashboard(input)
      end

      def get_resource_dashboard(input : Types::GetResourceDashboardRequest) : Types::GetResourceDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceDashboardResponse, "GetResourceDashboard")
      end

      # Gets the full details of a previously created session, including the session status and
      # configuration.

      def get_session(
        session_id : String
      ) : Types::GetSessionResponse

        input = Types::GetSessionRequest.new(session_id: session_id)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Types::GetSessionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSessionResponse, "GetSession")
      end

      # Gets a connection endpoint and authentication token for a given session Id.

      def get_session_endpoint(
        session_id : String
      ) : Types::GetSessionEndpointResponse

        input = Types::GetSessionEndpointRequest.new(session_id: session_id)
        get_session_endpoint(input)
      end

      def get_session_endpoint(input : Types::GetSessionEndpointRequest) : Types::GetSessionEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SESSION_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSessionEndpointResponse, "GetSessionEndpoint")
      end

      # Gets the current status of a session.

      def get_session_status(
        session_id : String
      ) : Types::GetSessionStatusResponse

        input = Types::GetSessionStatusRequest.new(session_id: session_id)
        get_session_status(input)
      end

      def get_session_status(input : Types::GetSessionStatusRequest) : Types::GetSessionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SESSION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSessionStatusResponse, "GetSessionStatus")
      end

      # Returns table metadata for the specified catalog, database, and table.

      def get_table_metadata(
        catalog_name : String,
        database_name : String,
        table_name : String,
        work_group : String? = nil
      ) : Types::GetTableMetadataOutput

        input = Types::GetTableMetadataInput.new(catalog_name: catalog_name, database_name: database_name, table_name: table_name, work_group: work_group)
        get_table_metadata(input)
      end

      def get_table_metadata(input : Types::GetTableMetadataInput) : Types::GetTableMetadataOutput
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableMetadataOutput, "GetTableMetadata")
      end

      # Returns information about the workgroup with the specified name.

      def get_work_group(
        work_group : String
      ) : Types::GetWorkGroupOutput

        input = Types::GetWorkGroupInput.new(work_group: work_group)
        get_work_group(input)
      end

      def get_work_group(input : Types::GetWorkGroupInput) : Types::GetWorkGroupOutput
        request = Protocol::JsonRpc.build_request(Model::GET_WORK_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkGroupOutput, "GetWorkGroup")
      end

      # Imports a single ipynb file to a Spark enabled workgroup. To import the notebook, the request must
      # specify a value for either Payload or NoteBookS3LocationUri . If neither is specified or both are
      # specified, an InvalidRequestException occurs. The maximum file size that can be imported is 10
      # megabytes. If an ipynb file with the same name already exists in the workgroup, throws an error.

      def import_notebook(
        name : String,
        type : String,
        work_group : String,
        client_request_token : String? = nil,
        notebook_s3_location_uri : String? = nil,
        payload : String? = nil
      ) : Types::ImportNotebookOutput

        input = Types::ImportNotebookInput.new(name: name, type: type, work_group: work_group, client_request_token: client_request_token, notebook_s3_location_uri: notebook_s3_location_uri, payload: payload)
        import_notebook(input)
      end

      def import_notebook(input : Types::ImportNotebookInput) : Types::ImportNotebookOutput
        request = Protocol::JsonRpc.build_request(Model::IMPORT_NOTEBOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportNotebookOutput, "ImportNotebook")
      end

      # Returns the supported DPU sizes for the supported application runtimes (for example, Athena notebook
      # version 1 ).

      def list_application_dpu_sizes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationDPUSizesOutput

        input = Types::ListApplicationDPUSizesInput.new(max_results: max_results, next_token: next_token)
        list_application_dpu_sizes(input)
      end

      def list_application_dpu_sizes(input : Types::ListApplicationDPUSizesInput) : Types::ListApplicationDPUSizesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_DPU_SIZES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationDPUSizesOutput, "ListApplicationDPUSizes")
      end

      # Lists the calculations that have been submitted to a session in descending order. Newer calculations
      # are listed first; older calculations are listed later.

      def list_calculation_executions(
        session_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_filter : String? = nil
      ) : Types::ListCalculationExecutionsResponse

        input = Types::ListCalculationExecutionsRequest.new(session_id: session_id, max_results: max_results, next_token: next_token, state_filter: state_filter)
        list_calculation_executions(input)
      end

      def list_calculation_executions(input : Types::ListCalculationExecutionsRequest) : Types::ListCalculationExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CALCULATION_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCalculationExecutionsResponse, "ListCalculationExecutions")
      end

      # Lists the capacity reservations for the current account.

      def list_capacity_reservations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCapacityReservationsOutput

        input = Types::ListCapacityReservationsInput.new(max_results: max_results, next_token: next_token)
        list_capacity_reservations(input)
      end

      def list_capacity_reservations(input : Types::ListCapacityReservationsInput) : Types::ListCapacityReservationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CAPACITY_RESERVATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCapacityReservationsOutput, "ListCapacityReservations")
      end

      # Lists the data catalogs in the current Amazon Web Services account. In the Athena console, data
      # catalogs are listed as "data sources" on the Data sources page under the Data source name column.

      def list_data_catalogs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        work_group : String? = nil
      ) : Types::ListDataCatalogsOutput

        input = Types::ListDataCatalogsInput.new(max_results: max_results, next_token: next_token, work_group: work_group)
        list_data_catalogs(input)
      end

      def list_data_catalogs(input : Types::ListDataCatalogsInput) : Types::ListDataCatalogsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_CATALOGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataCatalogsOutput, "ListDataCatalogs")
      end

      # Lists the databases in the specified data catalog.

      def list_databases(
        catalog_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        work_group : String? = nil
      ) : Types::ListDatabasesOutput

        input = Types::ListDatabasesInput.new(catalog_name: catalog_name, max_results: max_results, next_token: next_token, work_group: work_group)
        list_databases(input)
      end

      def list_databases(input : Types::ListDatabasesInput) : Types::ListDatabasesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatabasesOutput, "ListDatabases")
      end

      # Returns a list of engine versions that are available to choose from, including the Auto option.

      def list_engine_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEngineVersionsOutput

        input = Types::ListEngineVersionsInput.new(max_results: max_results, next_token: next_token)
        list_engine_versions(input)
      end

      def list_engine_versions(input : Types::ListEngineVersionsInput) : Types::ListEngineVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngineVersionsOutput, "ListEngineVersions")
      end

      # Lists, in descending order, the executors that joined a session. Newer executors are listed first;
      # older executors are listed later. The result can be optionally filtered by state.

      def list_executors(
        session_id : String,
        executor_state_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExecutorsResponse

        input = Types::ListExecutorsRequest.new(session_id: session_id, executor_state_filter: executor_state_filter, max_results: max_results, next_token: next_token)
        list_executors(input)
      end

      def list_executors(input : Types::ListExecutorsRequest) : Types::ListExecutorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXECUTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExecutorsResponse, "ListExecutors")
      end

      # Provides a list of available query IDs only for queries saved in the specified workgroup. Requires
      # that you have access to the specified workgroup. If a workgroup is not specified, lists the saved
      # queries for the primary workgroup.

      def list_named_queries(
        max_results : Int32? = nil,
        next_token : String? = nil,
        work_group : String? = nil
      ) : Types::ListNamedQueriesOutput

        input = Types::ListNamedQueriesInput.new(max_results: max_results, next_token: next_token, work_group: work_group)
        list_named_queries(input)
      end

      def list_named_queries(input : Types::ListNamedQueriesInput) : Types::ListNamedQueriesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_NAMED_QUERIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNamedQueriesOutput, "ListNamedQueries")
      end

      # Displays the notebook files for the specified workgroup in paginated format.

      def list_notebook_metadata(
        work_group : String,
        filters : Types::FilterDefinition? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListNotebookMetadataOutput

        input = Types::ListNotebookMetadataInput.new(work_group: work_group, filters: filters, max_results: max_results, next_token: next_token)
        list_notebook_metadata(input)
      end

      def list_notebook_metadata(input : Types::ListNotebookMetadataInput) : Types::ListNotebookMetadataOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_NOTEBOOK_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNotebookMetadataOutput, "ListNotebookMetadata")
      end

      # Lists, in descending order, the sessions that have been created in a notebook that are in an active
      # state like CREATING , CREATED , IDLE or BUSY . Newer sessions are listed first; older sessions are
      # listed later.

      def list_notebook_sessions(
        notebook_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListNotebookSessionsResponse

        input = Types::ListNotebookSessionsRequest.new(notebook_id: notebook_id, max_results: max_results, next_token: next_token)
        list_notebook_sessions(input)
      end

      def list_notebook_sessions(input : Types::ListNotebookSessionsRequest) : Types::ListNotebookSessionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_NOTEBOOK_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNotebookSessionsResponse, "ListNotebookSessions")
      end

      # Lists the prepared statements in the specified workgroup.

      def list_prepared_statements(
        work_group : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPreparedStatementsOutput

        input = Types::ListPreparedStatementsInput.new(work_group: work_group, max_results: max_results, next_token: next_token)
        list_prepared_statements(input)
      end

      def list_prepared_statements(input : Types::ListPreparedStatementsInput) : Types::ListPreparedStatementsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PREPARED_STATEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPreparedStatementsOutput, "ListPreparedStatements")
      end

      # Provides a list of available query execution IDs for the queries in the specified workgroup. Athena
      # keeps a query history for 45 days. If a workgroup is not specified, returns a list of query
      # execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the
      # queries ran.

      def list_query_executions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        work_group : String? = nil
      ) : Types::ListQueryExecutionsOutput

        input = Types::ListQueryExecutionsInput.new(max_results: max_results, next_token: next_token, work_group: work_group)
        list_query_executions(input)
      end

      def list_query_executions(input : Types::ListQueryExecutionsInput) : Types::ListQueryExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_QUERY_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQueryExecutionsOutput, "ListQueryExecutions")
      end

      # Lists the sessions in a workgroup that are in an active state like CREATING , CREATED , IDLE , or
      # BUSY . Newer sessions are listed first; older sessions are listed later.

      def list_sessions(
        work_group : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_filter : String? = nil
      ) : Types::ListSessionsResponse

        input = Types::ListSessionsRequest.new(work_group: work_group, max_results: max_results, next_token: next_token, state_filter: state_filter)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsRequest) : Types::ListSessionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSessionsResponse, "ListSessions")
      end

      # Lists the metadata for the tables in the specified data catalog database.

      def list_table_metadata(
        catalog_name : String,
        database_name : String,
        expression : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        work_group : String? = nil
      ) : Types::ListTableMetadataOutput

        input = Types::ListTableMetadataInput.new(catalog_name: catalog_name, database_name: database_name, expression: expression, max_results: max_results, next_token: next_token, work_group: work_group)
        list_table_metadata(input)
      end

      def list_table_metadata(input : Types::ListTableMetadataInput) : Types::ListTableMetadataOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTableMetadataOutput, "ListTableMetadata")
      end

      # Lists the tags associated with an Athena resource.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceOutput

        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Lists available workgroups for the account.

      def list_work_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkGroupsOutput

        input = Types::ListWorkGroupsInput.new(max_results: max_results, next_token: next_token)
        list_work_groups(input)
      end

      def list_work_groups(input : Types::ListWorkGroupsInput) : Types::ListWorkGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_WORK_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkGroupsOutput, "ListWorkGroups")
      end

      # Puts a new capacity assignment configuration for a specified capacity reservation. If a capacity
      # assignment configuration already exists for the capacity reservation, replaces the existing capacity
      # assignment configuration.

      def put_capacity_assignment_configuration(
        capacity_assignments : Array(Types::CapacityAssignment),
        capacity_reservation_name : String
      ) : Types::PutCapacityAssignmentConfigurationOutput

        input = Types::PutCapacityAssignmentConfigurationInput.new(capacity_assignments: capacity_assignments, capacity_reservation_name: capacity_reservation_name)
        put_capacity_assignment_configuration(input)
      end

      def put_capacity_assignment_configuration(input : Types::PutCapacityAssignmentConfigurationInput) : Types::PutCapacityAssignmentConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_CAPACITY_ASSIGNMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutCapacityAssignmentConfigurationOutput, "PutCapacityAssignmentConfiguration")
      end

      # Submits calculations for execution within a session. You can supply the code to run as an inline
      # code block within the request. The request syntax requires the
      # StartCalculationExecutionRequest$CodeBlock parameter or the CalculationConfiguration$CodeBlock
      # parameter, but not both. Because CalculationConfiguration$CodeBlock is deprecated, use the
      # StartCalculationExecutionRequest$CodeBlock parameter instead.

      def start_calculation_execution(
        session_id : String,
        calculation_configuration : Types::CalculationConfiguration? = nil,
        client_request_token : String? = nil,
        code_block : String? = nil,
        description : String? = nil
      ) : Types::StartCalculationExecutionResponse

        input = Types::StartCalculationExecutionRequest.new(session_id: session_id, calculation_configuration: calculation_configuration, client_request_token: client_request_token, code_block: code_block, description: description)
        start_calculation_execution(input)
      end

      def start_calculation_execution(input : Types::StartCalculationExecutionRequest) : Types::StartCalculationExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::START_CALCULATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCalculationExecutionResponse, "StartCalculationExecution")
      end

      # Runs the SQL query statements contained in the Query . Requires you to have access to the workgroup
      # in which the query ran. Running queries against an external catalog requires GetDataCatalog
      # permission to the catalog. For code samples using the Amazon Web Services SDK for Java, see Examples
      # and Code Samples in the Amazon Athena User Guide .

      def start_query_execution(
        query_string : String,
        client_request_token : String? = nil,
        engine_configuration : Types::EngineConfiguration? = nil,
        execution_parameters : Array(String)? = nil,
        query_execution_context : Types::QueryExecutionContext? = nil,
        result_configuration : Types::ResultConfiguration? = nil,
        result_reuse_configuration : Types::ResultReuseConfiguration? = nil,
        work_group : String? = nil
      ) : Types::StartQueryExecutionOutput

        input = Types::StartQueryExecutionInput.new(query_string: query_string, client_request_token: client_request_token, engine_configuration: engine_configuration, execution_parameters: execution_parameters, query_execution_context: query_execution_context, result_configuration: result_configuration, result_reuse_configuration: result_reuse_configuration, work_group: work_group)
        start_query_execution(input)
      end

      def start_query_execution(input : Types::StartQueryExecutionInput) : Types::StartQueryExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_QUERY_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartQueryExecutionOutput, "StartQueryExecution")
      end

      # Creates a session for running calculations within a workgroup. The session is ready when it reaches
      # an IDLE state.

      def start_session(
        engine_configuration : Types::EngineConfiguration,
        work_group : String,
        client_request_token : String? = nil,
        copy_work_group_tags : Bool? = nil,
        description : String? = nil,
        execution_role : String? = nil,
        monitoring_configuration : Types::MonitoringConfiguration? = nil,
        notebook_version : String? = nil,
        session_idle_timeout_in_minutes : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartSessionResponse

        input = Types::StartSessionRequest.new(engine_configuration: engine_configuration, work_group: work_group, client_request_token: client_request_token, copy_work_group_tags: copy_work_group_tags, description: description, execution_role: execution_role, monitoring_configuration: monitoring_configuration, notebook_version: notebook_version, session_idle_timeout_in_minutes: session_idle_timeout_in_minutes, tags: tags)
        start_session(input)
      end

      def start_session(input : Types::StartSessionRequest) : Types::StartSessionResponse
        request = Protocol::JsonRpc.build_request(Model::START_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSessionResponse, "StartSession")
      end

      # Requests the cancellation of a calculation. A StopCalculationExecution call on a calculation that is
      # already in a terminal state (for example, STOPPED , FAILED , or COMPLETED ) succeeds but has no
      # effect. Cancelling a calculation is done on a best effort basis. If a calculation cannot be
      # cancelled, you can be charged for its completion. If you are concerned about being charged for a
      # calculation that cannot be cancelled, consider terminating the session in which the calculation is
      # running.

      def stop_calculation_execution(
        calculation_execution_id : String
      ) : Types::StopCalculationExecutionResponse

        input = Types::StopCalculationExecutionRequest.new(calculation_execution_id: calculation_execution_id)
        stop_calculation_execution(input)
      end

      def stop_calculation_execution(input : Types::StopCalculationExecutionRequest) : Types::StopCalculationExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_CALCULATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopCalculationExecutionResponse, "StopCalculationExecution")
      end

      # Stops a query execution. Requires you to have access to the workgroup in which the query ran.

      def stop_query_execution(
        query_execution_id : String
      ) : Types::StopQueryExecutionOutput

        input = Types::StopQueryExecutionInput.new(query_execution_id: query_execution_id)
        stop_query_execution(input)
      end

      def stop_query_execution(input : Types::StopQueryExecutionInput) : Types::StopQueryExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_QUERY_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopQueryExecutionOutput, "StopQueryExecution")
      end

      # Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. Each
      # tag consists of a key and an optional value, both of which you define. For example, you can use tags
      # to categorize Athena workgroups, data catalogs, or capacity reservations by purpose, owner, or
      # environment. Use a consistent set of tag keys to make it easier to search and filter the resources
      # in your account. For best practices, see Tagging Best Practices . Tag keys can be from 1 to 128
      # UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use
      # letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys
      # and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one
      # tag, separate them by commas.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput

        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Terminates an active session. A TerminateSession call on a session that is already inactive (for
      # example, in a FAILED , TERMINATED or TERMINATING state) succeeds but has no effect. Calculations
      # running in the session when TerminateSession is called are forcefully stopped, but may display as
      # FAILED instead of STOPPED .

      def terminate_session(
        session_id : String
      ) : Types::TerminateSessionResponse

        input = Types::TerminateSessionRequest.new(session_id: session_id)
        terminate_session(input)
      end

      def terminate_session(input : Types::TerminateSessionRequest) : Types::TerminateSessionResponse
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateSessionResponse, "TerminateSession")
      end

      # Removes one or more tags from an Athena resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput

        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates the number of requested data processing units for the capacity reservation with the
      # specified name.

      def update_capacity_reservation(
        name : String,
        target_dpus : Int32
      ) : Types::UpdateCapacityReservationOutput

        input = Types::UpdateCapacityReservationInput.new(name: name, target_dpus: target_dpus)
        update_capacity_reservation(input)
      end

      def update_capacity_reservation(input : Types::UpdateCapacityReservationInput) : Types::UpdateCapacityReservationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCapacityReservationOutput, "UpdateCapacityReservation")
      end

      # Updates the data catalog that has the specified name.

      def update_data_catalog(
        name : String,
        type : String,
        description : String? = nil,
        parameters : Hash(String, String)? = nil
      ) : Types::UpdateDataCatalogOutput

        input = Types::UpdateDataCatalogInput.new(name: name, type: type, description: description, parameters: parameters)
        update_data_catalog(input)
      end

      def update_data_catalog(input : Types::UpdateDataCatalogInput) : Types::UpdateDataCatalogOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATA_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDataCatalogOutput, "UpdateDataCatalog")
      end

      # Updates a NamedQuery object. The database or workgroup cannot be updated.

      def update_named_query(
        name : String,
        named_query_id : String,
        query_string : String,
        description : String? = nil
      ) : Types::UpdateNamedQueryOutput

        input = Types::UpdateNamedQueryInput.new(name: name, named_query_id: named_query_id, query_string: query_string, description: description)
        update_named_query(input)
      end

      def update_named_query(input : Types::UpdateNamedQueryInput) : Types::UpdateNamedQueryOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NAMED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNamedQueryOutput, "UpdateNamedQuery")
      end

      # Updates the contents of a Spark notebook.

      def update_notebook(
        notebook_id : String,
        payload : String,
        type : String,
        client_request_token : String? = nil,
        session_id : String? = nil
      ) : Types::UpdateNotebookOutput

        input = Types::UpdateNotebookInput.new(notebook_id: notebook_id, payload: payload, type: type, client_request_token: client_request_token, session_id: session_id)
        update_notebook(input)
      end

      def update_notebook(input : Types::UpdateNotebookInput) : Types::UpdateNotebookOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTEBOOK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotebookOutput, "UpdateNotebook")
      end

      # Updates the metadata for a notebook.

      def update_notebook_metadata(
        name : String,
        notebook_id : String,
        client_request_token : String? = nil
      ) : Types::UpdateNotebookMetadataOutput

        input = Types::UpdateNotebookMetadataInput.new(name: name, notebook_id: notebook_id, client_request_token: client_request_token)
        update_notebook_metadata(input)
      end

      def update_notebook_metadata(input : Types::UpdateNotebookMetadataInput) : Types::UpdateNotebookMetadataOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTEBOOK_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotebookMetadataOutput, "UpdateNotebookMetadata")
      end

      # Updates a prepared statement.

      def update_prepared_statement(
        query_statement : String,
        statement_name : String,
        work_group : String,
        description : String? = nil
      ) : Types::UpdatePreparedStatementOutput

        input = Types::UpdatePreparedStatementInput.new(query_statement: query_statement, statement_name: statement_name, work_group: work_group, description: description)
        update_prepared_statement(input)
      end

      def update_prepared_statement(input : Types::UpdatePreparedStatementInput) : Types::UpdatePreparedStatementOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PREPARED_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePreparedStatementOutput, "UpdatePreparedStatement")
      end

      # Updates the workgroup with the specified name. The workgroup's name cannot be changed. Only
      # ConfigurationUpdates can be specified.

      def update_work_group(
        work_group : String,
        configuration_updates : Types::WorkGroupConfigurationUpdates? = nil,
        description : String? = nil,
        state : String? = nil
      ) : Types::UpdateWorkGroupOutput

        input = Types::UpdateWorkGroupInput.new(work_group: work_group, configuration_updates: configuration_updates, description: description, state: state)
        update_work_group(input)
      end

      def update_work_group(input : Types::UpdateWorkGroupInput) : Types::UpdateWorkGroupOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORK_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkGroupOutput, "UpdateWorkGroup")
      end
    end
  end
end
