module Aws
  module BCMDataExports
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a data export and specifies the data query, the delivery preference, and any optional
      # resource tags. A DataQuery consists of both a QueryStatement and TableConfigurations . The
      # QueryStatement is an SQL statement. Data Exports only supports a limited subset of the SQL syntax.
      # For more information on the SQL syntax that is supported, see Data query . To view the available
      # tables and columns, see the Data Exports table dictionary . The TableConfigurations is a collection
      # of specified TableProperties for the table being queried in the QueryStatement . TableProperties are
      # additional configurations you can provide to change the data and schema of a table. Each table can
      # have different TableProperties. However, tables are not required to have any TableProperties. Each
      # table property has a default value that it assumes if not specified. For more information on table
      # configurations, see Data query . To view the table properties available for each table, see the Data
      # Exports table dictionary or use the ListTables API to get a response of all tables and their
      # available properties.

      def create_export(
        export : Types::Export,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateExportResponse

        input = Types::CreateExportRequest.new(export: export, resource_tags: resource_tags)
        create_export(input)
      end

      def create_export(input : Types::CreateExportRequest) : Types::CreateExportResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExportResponse, "CreateExport")
      end

      # Deletes an existing data export.

      def delete_export(
        export_arn : String
      ) : Types::DeleteExportResponse

        input = Types::DeleteExportRequest.new(export_arn: export_arn)
        delete_export(input)
      end

      def delete_export(input : Types::DeleteExportRequest) : Types::DeleteExportResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteExportResponse, "DeleteExport")
      end

      # Exports data based on the source data update.

      def get_execution(
        execution_id : String,
        export_arn : String
      ) : Types::GetExecutionResponse

        input = Types::GetExecutionRequest.new(execution_id: execution_id, export_arn: export_arn)
        get_execution(input)
      end

      def get_execution(input : Types::GetExecutionRequest) : Types::GetExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExecutionResponse, "GetExecution")
      end

      # Views the definition of an existing data export.

      def get_export(
        export_arn : String
      ) : Types::GetExportResponse

        input = Types::GetExportRequest.new(export_arn: export_arn)
        get_export(input)
      end

      def get_export(input : Types::GetExportRequest) : Types::GetExportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExportResponse, "GetExport")
      end

      # Returns the metadata for the specified table and table properties. This includes the list of columns
      # in the table schema, their data types, and column descriptions.

      def get_table(
        table_name : String,
        table_properties : Hash(String, String)? = nil
      ) : Types::GetTableResponse

        input = Types::GetTableRequest.new(table_name: table_name, table_properties: table_properties)
        get_table(input)
      end

      def get_table(input : Types::GetTableRequest) : Types::GetTableResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableResponse, "GetTable")
      end

      # Lists the historical executions for the export.

      def list_executions(
        export_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExecutionsResponse

        input = Types::ListExecutionsRequest.new(export_arn: export_arn, max_results: max_results, next_token: next_token)
        list_executions(input)
      end

      def list_executions(input : Types::ListExecutionsRequest) : Types::ListExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExecutionsResponse, "ListExecutions")
      end

      # Lists all data export definitions.

      def list_exports(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExportsResponse

        input = Types::ListExportsRequest.new(max_results: max_results, next_token: next_token)
        list_exports(input)
      end

      def list_exports(input : Types::ListExportsRequest) : Types::ListExportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExportsResponse, "ListExports")
      end

      # Lists all available tables in data exports.

      def list_tables(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTablesResponse

        input = Types::ListTablesRequest.new(max_results: max_results, next_token: next_token)
        list_tables(input)
      end

      def list_tables(input : Types::ListTablesRequest) : Types::ListTablesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTablesResponse, "ListTables")
      end

      # List tags associated with an existing data export.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Adds tags for an existing data export definition.

      def tag_resource(
        resource_arn : String,
        resource_tags : Array(Types::ResourceTag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, resource_tags: resource_tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes tags associated with an existing data export definition.

      def untag_resource(
        resource_arn : String,
        resource_tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, resource_tag_keys: resource_tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing data export by overwriting all export parameters. All export parameters must be
      # provided in the UpdateExport request.

      def update_export(
        export : Types::Export,
        export_arn : String
      ) : Types::UpdateExportResponse

        input = Types::UpdateExportRequest.new(export: export, export_arn: export_arn)
        update_export(input)
      end

      def update_export(input : Types::UpdateExportRequest) : Types::UpdateExportResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateExportResponse, "UpdateExport")
      end
    end
  end
end
