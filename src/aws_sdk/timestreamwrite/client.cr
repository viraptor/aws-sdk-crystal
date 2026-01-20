module AwsSdk
  module TimestreamWrite
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

      # Creates a new Timestream batch load task. A batch load task processes data from a CSV source in an
      # S3 location and writes to a Timestream table. A mapping from source to target is defined in a batch
      # load task. Errors and events are written to a report at an S3 location. For the report, if the KMS
      # key is not specified, the report will be encrypted with an S3 managed key when SSE_S3 is the option.
      # Otherwise an error is thrown. For more information, see Amazon Web Services managed keys . Service
      # quotas apply . For details, see code sample .

      def create_batch_load_task(
        data_source_configuration : Types::DataSourceConfiguration,
        report_configuration : Types::ReportConfiguration,
        target_database_name : String,
        target_table_name : String,
        client_token : String? = nil,
        data_model_configuration : Types::DataModelConfiguration? = nil,
        record_version : Int64? = nil
      ) : Types::CreateBatchLoadTaskResponse

        input = Types::CreateBatchLoadTaskRequest.new(data_source_configuration: data_source_configuration, report_configuration: report_configuration, target_database_name: target_database_name, target_table_name: target_table_name, client_token: client_token, data_model_configuration: data_model_configuration, record_version: record_version)
        create_batch_load_task(input)
      end

      def create_batch_load_task(input : Types::CreateBatchLoadTaskRequest) : Types::CreateBatchLoadTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BATCH_LOAD_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBatchLoadTaskResponse, "CreateBatchLoadTask")
      end

      # Creates a new Timestream database. If the KMS key is not specified, the database will be encrypted
      # with a Timestream managed KMS key located in your account. For more information, see Amazon Web
      # Services managed keys . Service quotas apply . For details, see code sample .

      def create_database(
        database_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDatabaseResponse

        input = Types::CreateDatabaseRequest.new(database_name: database_name, kms_key_id: kms_key_id, tags: tags)
        create_database(input)
      end

      def create_database(input : Types::CreateDatabaseRequest) : Types::CreateDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatabaseResponse, "CreateDatabase")
      end

      # Adds a new table to an existing database in your account. In an Amazon Web Services account, table
      # names must be at least unique within each Region if they are in the same database. You might have
      # identical table names in the same Region if the tables are in separate databases. While creating the
      # table, you must specify the table name, database name, and the retention properties. Service quotas
      # apply . See code sample for details.

      def create_table(
        database_name : String,
        table_name : String,
        magnetic_store_write_properties : Types::MagneticStoreWriteProperties? = nil,
        retention_properties : Types::RetentionProperties? = nil,
        schema : Types::Schema? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTableResponse

        input = Types::CreateTableRequest.new(database_name: database_name, table_name: table_name, magnetic_store_write_properties: magnetic_store_write_properties, retention_properties: retention_properties, schema: schema, tags: tags)
        create_table(input)
      end

      def create_table(input : Types::CreateTableRequest) : Types::CreateTableResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTableResponse, "CreateTable")
      end

      # Deletes a given Timestream database. This is an irreversible operation. After a database is deleted,
      # the time-series data from its tables cannot be recovered. All tables in the database must be deleted
      # first, or a ValidationException error will be thrown. Due to the nature of distributed retries, the
      # operation can return either success or a ResourceNotFoundException. Clients should consider them
      # equivalent. See code sample for details.

      def delete_database(
        database_name : String
      ) : Nil

        input = Types::DeleteDatabaseRequest.new(database_name: database_name)
        delete_database(input)
      end

      def delete_database(input : Types::DeleteDatabaseRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a given Timestream table. This is an irreversible operation. After a Timestream database
      # table is deleted, the time-series data stored in the table cannot be recovered. Due to the nature of
      # distributed retries, the operation can return either success or a ResourceNotFoundException. Clients
      # should consider them equivalent. See code sample for details.

      def delete_table(
        database_name : String,
        table_name : String
      ) : Nil

        input = Types::DeleteTableRequest.new(database_name: database_name, table_name: table_name)
        delete_table(input)
      end

      def delete_table(input : Types::DeleteTableRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns information about the batch load task, including configurations, mappings, progress, and
      # other details. Service quotas apply . See code sample for details.

      def describe_batch_load_task(
        task_id : String
      ) : Types::DescribeBatchLoadTaskResponse

        input = Types::DescribeBatchLoadTaskRequest.new(task_id: task_id)
        describe_batch_load_task(input)
      end

      def describe_batch_load_task(input : Types::DescribeBatchLoadTaskRequest) : Types::DescribeBatchLoadTaskResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BATCH_LOAD_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBatchLoadTaskResponse, "DescribeBatchLoadTask")
      end

      # Returns information about the database, including the database name, time that the database was
      # created, and the total number of tables found within the database. Service quotas apply . See code
      # sample for details.

      def describe_database(
        database_name : String
      ) : Types::DescribeDatabaseResponse

        input = Types::DescribeDatabaseRequest.new(database_name: database_name)
        describe_database(input)
      end

      def describe_database(input : Types::DescribeDatabaseRequest) : Types::DescribeDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatabaseResponse, "DescribeDatabase")
      end

      # Returns a list of available endpoints to make Timestream API calls against. This API operation is
      # available through both the Write and Query APIs. Because the Timestream SDKs are designed to
      # transparently work with the service’s architecture, including the management and mapping of the
      # service endpoints, we don't recommend that you use this API operation unless : You are using VPC
      # endpoints (Amazon Web Services PrivateLink) with Timestream Your application uses a programming
      # language that does not yet have SDK support You require better control over the client-side
      # implementation For detailed information on how and when to use and implement DescribeEndpoints, see
      # The Endpoint Discovery Pattern .

      def describe_endpoints : Types::DescribeEndpointsResponse
        input = Types::DescribeEndpointsRequest.new
        describe_endpoints(input)
      end

      def describe_endpoints(input : Types::DescribeEndpointsRequest) : Types::DescribeEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointsResponse, "DescribeEndpoints")
      end

      # Returns information about the table, including the table name, database name, retention duration of
      # the memory store and the magnetic store. Service quotas apply . See code sample for details.

      def describe_table(
        database_name : String,
        table_name : String
      ) : Types::DescribeTableResponse

        input = Types::DescribeTableRequest.new(database_name: database_name, table_name: table_name)
        describe_table(input)
      end

      def describe_table(input : Types::DescribeTableRequest) : Types::DescribeTableResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTableResponse, "DescribeTable")
      end

      # Provides a list of batch load tasks, along with the name, status, when the task is resumable until,
      # and other details. See code sample for details.

      def list_batch_load_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_status : String? = nil
      ) : Types::ListBatchLoadTasksResponse

        input = Types::ListBatchLoadTasksRequest.new(max_results: max_results, next_token: next_token, task_status: task_status)
        list_batch_load_tasks(input)
      end

      def list_batch_load_tasks(input : Types::ListBatchLoadTasksRequest) : Types::ListBatchLoadTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BATCH_LOAD_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBatchLoadTasksResponse, "ListBatchLoadTasks")
      end

      # Returns a list of your Timestream databases. Service quotas apply . See code sample for details.

      def list_databases(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatabasesResponse

        input = Types::ListDatabasesRequest.new(max_results: max_results, next_token: next_token)
        list_databases(input)
      end

      def list_databases(input : Types::ListDatabasesRequest) : Types::ListDatabasesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatabasesResponse, "ListDatabases")
      end

      # Provides a list of tables, along with the name, status, and retention properties of each table. See
      # code sample for details.

      def list_tables(
        database_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTablesResponse

        input = Types::ListTablesRequest.new(database_name: database_name, max_results: max_results, next_token: next_token)
        list_tables(input)
      end

      def list_tables(input : Types::ListTablesRequest) : Types::ListTablesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTablesResponse, "ListTables")
      end

      # Lists all tags on a Timestream resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end


      def resume_batch_load_task(
        task_id : String
      ) : Types::ResumeBatchLoadTaskResponse

        input = Types::ResumeBatchLoadTaskRequest.new(task_id: task_id)
        resume_batch_load_task(input)
      end

      def resume_batch_load_task(input : Types::ResumeBatchLoadTaskRequest) : Types::ResumeBatchLoadTaskResponse
        request = Protocol::JsonRpc.build_request(Model::RESUME_BATCH_LOAD_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResumeBatchLoadTaskResponse, "ResumeBatchLoadTask")
      end

      # Associates a set of tags with a Timestream resource. You can then activate these user-defined tags
      # so that they appear on the Billing and Cost Management console for cost allocation tracking.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the association of tags from a Timestream resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Modifies the KMS key for an existing database. While updating the database, you must specify the
      # database name and the identifier of the new KMS key to be used ( KmsKeyId ). If there are any
      # concurrent UpdateDatabase requests, first writer wins. See code sample for details.

      def update_database(
        database_name : String,
        kms_key_id : String
      ) : Types::UpdateDatabaseResponse

        input = Types::UpdateDatabaseRequest.new(database_name: database_name, kms_key_id: kms_key_id)
        update_database(input)
      end

      def update_database(input : Types::UpdateDatabaseRequest) : Types::UpdateDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDatabaseResponse, "UpdateDatabase")
      end

      # Modifies the retention duration of the memory store and magnetic store for your Timestream table.
      # Note that the change in retention duration takes effect immediately. For example, if the retention
      # period of the memory store was initially set to 2 hours and then changed to 24 hours, the memory
      # store will be capable of holding 24 hours of data, but will be populated with 24 hours of data 22
      # hours after this change was made. Timestream does not retrieve data from the magnetic store to
      # populate the memory store. See code sample for details.

      def update_table(
        database_name : String,
        table_name : String,
        magnetic_store_write_properties : Types::MagneticStoreWriteProperties? = nil,
        retention_properties : Types::RetentionProperties? = nil,
        schema : Types::Schema? = nil
      ) : Types::UpdateTableResponse

        input = Types::UpdateTableRequest.new(database_name: database_name, table_name: table_name, magnetic_store_write_properties: magnetic_store_write_properties, retention_properties: retention_properties, schema: schema)
        update_table(input)
      end

      def update_table(input : Types::UpdateTableRequest) : Types::UpdateTableResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTableResponse, "UpdateTable")
      end

      # Enables you to write your time-series data into Timestream. You can specify a single data point or a
      # batch of data points to be inserted into the system. Timestream offers you a flexible schema that
      # auto detects the column names and data types for your Timestream tables based on the dimension names
      # and data types of the data points you specify when invoking writes into the database. Timestream
      # supports eventual consistency read semantics. This means that when you query data immediately after
      # writing a batch of data into Timestream, the query results might not reflect the results of a
      # recently completed write operation. The results may also include some stale data. If you repeat the
      # query request after a short time, the results should return the latest data. Service quotas apply .
      # See code sample for details. Upserts You can use the Version parameter in a WriteRecords request to
      # update data points. Timestream tracks a version number with each record. Version defaults to 1 when
      # it's not specified for the record in the request. Timestream updates an existing record’s measure
      # value along with its Version when it receives a write request with a higher Version number for that
      # record. When it receives an update request where the measure value is the same as that of the
      # existing record, Timestream still updates Version , if it is greater than the existing value of
      # Version . You can update a data point as many times as desired, as long as the value of Version
      # continuously increases. For example, suppose you write a new record without indicating Version in
      # the request. Timestream stores this record, and set Version to 1 . Now, suppose you try to update
      # this record with a WriteRecords request of the same record with a different measure value but, like
      # before, do not provide Version . In this case, Timestream will reject this update with a
      # RejectedRecordsException since the updated record’s version is not greater than the existing value
      # of Version. However, if you were to resend the update request with Version set to 2 , Timestream
      # would then succeed in updating the record’s value, and the Version would be set to 2 . Next, suppose
      # you sent a WriteRecords request with this same record and an identical measure value, but with
      # Version set to 3 . In this case, Timestream would only update Version to 3 . Any further updates
      # would need to send a version number greater than 3 , or the update requests would receive a
      # RejectedRecordsException .

      def write_records(
        database_name : String,
        records : Array(Types::Record),
        table_name : String,
        common_attributes : Types::Record? = nil
      ) : Types::WriteRecordsResponse

        input = Types::WriteRecordsRequest.new(database_name: database_name, records: records, table_name: table_name, common_attributes: common_attributes)
        write_records(input)
      end

      def write_records(input : Types::WriteRecordsRequest) : Types::WriteRecordsResponse
        request = Protocol::JsonRpc.build_request(Model::WRITE_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WriteRecordsResponse, "WriteRecords")
      end
    end
  end
end
