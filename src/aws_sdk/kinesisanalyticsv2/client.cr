module AwsSdk
  module KinesisAnalyticsV2
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

      # Adds an Amazon CloudWatch log stream to monitor application configuration errors.

      def add_application_cloud_watch_logging_option(
        application_name : String,
        cloud_watch_logging_option : Types::CloudWatchLoggingOption,
        conditional_token : String? = nil,
        current_application_version_id : Int64? = nil
      ) : Types::AddApplicationCloudWatchLoggingOptionResponse

        input = Types::AddApplicationCloudWatchLoggingOptionRequest.new(application_name: application_name, cloud_watch_logging_option: cloud_watch_logging_option, conditional_token: conditional_token, current_application_version_id: current_application_version_id)
        add_application_cloud_watch_logging_option(input)
      end

      def add_application_cloud_watch_logging_option(input : Types::AddApplicationCloudWatchLoggingOptionRequest) : Types::AddApplicationCloudWatchLoggingOptionResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_CLOUD_WATCH_LOGGING_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationCloudWatchLoggingOptionResponse, "AddApplicationCloudWatchLoggingOption")
      end

      # Adds a streaming source to your SQL-based Kinesis Data Analytics application. You can add a
      # streaming source when you create an application, or you can use this operation to add a streaming
      # source after you create an application. For more information, see CreateApplication . Any
      # configuration update, including adding a streaming source using this operation, results in a new
      # version of the application. You can use the DescribeApplication operation to find the current
      # application version.

      def add_application_input(
        application_name : String,
        current_application_version_id : Int64,
        input : Types::Input
      ) : Types::AddApplicationInputResponse

        input = Types::AddApplicationInputRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, input: input)
        add_application_input(input)
      end

      def add_application_input(input : Types::AddApplicationInputRequest) : Types::AddApplicationInputResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_INPUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationInputResponse, "AddApplicationInput")
      end

      # Adds an InputProcessingConfiguration to a SQL-based Kinesis Data Analytics application. An input
      # processor pre-processes records on the input stream before the application's SQL code executes.
      # Currently, the only input processor available is Amazon Lambda .

      def add_application_input_processing_configuration(
        application_name : String,
        current_application_version_id : Int64,
        input_id : String,
        input_processing_configuration : Types::InputProcessingConfiguration
      ) : Types::AddApplicationInputProcessingConfigurationResponse

        input = Types::AddApplicationInputProcessingConfigurationRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, input_id: input_id, input_processing_configuration: input_processing_configuration)
        add_application_input_processing_configuration(input)
      end

      def add_application_input_processing_configuration(input : Types::AddApplicationInputProcessingConfigurationRequest) : Types::AddApplicationInputProcessingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_INPUT_PROCESSING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationInputProcessingConfigurationResponse, "AddApplicationInputProcessingConfiguration")
      end

      # Adds an external destination to your SQL-based Kinesis Data Analytics application. If you want
      # Kinesis Data Analytics to deliver data from an in-application stream within your application to an
      # external destination (such as an Kinesis data stream, a Kinesis Data Firehose delivery stream, or an
      # Amazon Lambda function), you add the relevant configuration to your application using this
      # operation. You can configure one or more outputs for your application. Each output configuration
      # maps an in-application stream and an external destination. You can use one of the output
      # configurations to deliver data from your in-application error stream to an external destination so
      # that you can analyze the errors. Any configuration update, including adding a streaming source using
      # this operation, results in a new version of the application. You can use the DescribeApplication
      # operation to find the current application version.

      def add_application_output(
        application_name : String,
        current_application_version_id : Int64,
        output : Types::Output
      ) : Types::AddApplicationOutputResponse

        input = Types::AddApplicationOutputRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, output: output)
        add_application_output(input)
      end

      def add_application_output(input : Types::AddApplicationOutputRequest) : Types::AddApplicationOutputResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_OUTPUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationOutputResponse, "AddApplicationOutput")
      end

      # Adds a reference data source to an existing SQL-based Kinesis Data Analytics application. Kinesis
      # Data Analytics reads reference data (that is, an Amazon S3 object) and creates an in-application
      # table within your application. In the request, you provide the source (S3 bucket name and object key
      # name), name of the in-application table to create, and the necessary mapping information that
      # describes how data in an Amazon S3 object maps to columns in the resulting in-application table.

      def add_application_reference_data_source(
        application_name : String,
        current_application_version_id : Int64,
        reference_data_source : Types::ReferenceDataSource
      ) : Types::AddApplicationReferenceDataSourceResponse

        input = Types::AddApplicationReferenceDataSourceRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, reference_data_source: reference_data_source)
        add_application_reference_data_source(input)
      end

      def add_application_reference_data_source(input : Types::AddApplicationReferenceDataSourceRequest) : Types::AddApplicationReferenceDataSourceResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_REFERENCE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationReferenceDataSourceResponse, "AddApplicationReferenceDataSource")
      end

      # Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs to
      # store and access resources securely. Note the following about VPC configurations for Managed Service
      # for Apache Flink applications: VPC configurations are not supported for SQL applications. When a VPC
      # is added to a Managed Service for Apache Flink application, the application can no longer be
      # accessed from the Internet directly. To enable Internet access to the application, add an Internet
      # gateway to your VPC.

      def add_application_vpc_configuration(
        application_name : String,
        vpc_configuration : Types::VpcConfiguration,
        conditional_token : String? = nil,
        current_application_version_id : Int64? = nil
      ) : Types::AddApplicationVpcConfigurationResponse

        input = Types::AddApplicationVpcConfigurationRequest.new(application_name: application_name, vpc_configuration: vpc_configuration, conditional_token: conditional_token, current_application_version_id: current_application_version_id)
        add_application_vpc_configuration(input)
      end

      def add_application_vpc_configuration(input : Types::AddApplicationVpcConfigurationRequest) : Types::AddApplicationVpcConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_VPC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationVpcConfigurationResponse, "AddApplicationVpcConfiguration")
      end

      # Creates a Managed Service for Apache Flink application. For information about creating a Managed
      # Service for Apache Flink application, see Creating an Application .

      def create_application(
        application_name : String,
        runtime_environment : String,
        service_execution_role : String,
        application_configuration : Types::ApplicationConfiguration? = nil,
        application_description : String? = nil,
        application_mode : String? = nil,
        cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateApplicationResponse

        input = Types::CreateApplicationRequest.new(application_name: application_name, runtime_environment: runtime_environment, service_execution_role: service_execution_role, application_configuration: application_configuration, application_description: application_description, application_mode: application_mode, cloud_watch_logging_options: cloud_watch_logging_options, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResponse, "CreateApplication")
      end

      # Creates and returns a URL that you can use to connect to an application's extension. The IAM role or
      # user used to call this API defines the permissions to access the extension. After the presigned URL
      # is created, no additional permission is required to access this URL. IAM authorization policies for
      # this API are also enforced for every HTTP request that attempts to connect to the extension. You
      # control the amount of time that the URL will be valid using the SessionExpirationDurationInSeconds
      # parameter. If you do not provide this parameter, the returned URL is valid for twelve hours. The URL
      # that you get from a call to CreateApplicationPresignedUrl must be used within 3 minutes to be valid.
      # If you first try to use the URL after the 3-minute limit expires, the service returns an HTTP 403
      # Forbidden error.

      def create_application_presigned_url(
        application_name : String,
        url_type : String,
        session_expiration_duration_in_seconds : Int64? = nil
      ) : Types::CreateApplicationPresignedUrlResponse

        input = Types::CreateApplicationPresignedUrlRequest.new(application_name: application_name, url_type: url_type, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds)
        create_application_presigned_url(input)
      end

      def create_application_presigned_url(input : Types::CreateApplicationPresignedUrlRequest) : Types::CreateApplicationPresignedUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION_PRESIGNED_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationPresignedUrlResponse, "CreateApplicationPresignedUrl")
      end

      # Creates a snapshot of the application's state data.

      def create_application_snapshot(
        application_name : String,
        snapshot_name : String
      ) : Types::CreateApplicationSnapshotResponse

        input = Types::CreateApplicationSnapshotRequest.new(application_name: application_name, snapshot_name: snapshot_name)
        create_application_snapshot(input)
      end

      def create_application_snapshot(input : Types::CreateApplicationSnapshotRequest) : Types::CreateApplicationSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationSnapshotResponse, "CreateApplicationSnapshot")
      end

      # Deletes the specified application. Managed Service for Apache Flink halts application execution and
      # deletes the application.

      def delete_application(
        application_name : String,
        create_timestamp : Time
      ) : Types::DeleteApplicationResponse

        input = Types::DeleteApplicationRequest.new(application_name: application_name, create_timestamp: create_timestamp)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Types::DeleteApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationResponse, "DeleteApplication")
      end

      # Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data Analytics application.

      def delete_application_cloud_watch_logging_option(
        application_name : String,
        cloud_watch_logging_option_id : String,
        conditional_token : String? = nil,
        current_application_version_id : Int64? = nil
      ) : Types::DeleteApplicationCloudWatchLoggingOptionResponse

        input = Types::DeleteApplicationCloudWatchLoggingOptionRequest.new(application_name: application_name, cloud_watch_logging_option_id: cloud_watch_logging_option_id, conditional_token: conditional_token, current_application_version_id: current_application_version_id)
        delete_application_cloud_watch_logging_option(input)
      end

      def delete_application_cloud_watch_logging_option(input : Types::DeleteApplicationCloudWatchLoggingOptionRequest) : Types::DeleteApplicationCloudWatchLoggingOptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_CLOUD_WATCH_LOGGING_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationCloudWatchLoggingOptionResponse, "DeleteApplicationCloudWatchLoggingOption")
      end

      # Deletes an InputProcessingConfiguration from an input.

      def delete_application_input_processing_configuration(
        application_name : String,
        current_application_version_id : Int64,
        input_id : String
      ) : Types::DeleteApplicationInputProcessingConfigurationResponse

        input = Types::DeleteApplicationInputProcessingConfigurationRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, input_id: input_id)
        delete_application_input_processing_configuration(input)
      end

      def delete_application_input_processing_configuration(input : Types::DeleteApplicationInputProcessingConfigurationRequest) : Types::DeleteApplicationInputProcessingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_INPUT_PROCESSING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationInputProcessingConfigurationResponse, "DeleteApplicationInputProcessingConfiguration")
      end

      # Deletes the output destination configuration from your SQL-based Kinesis Data Analytics
      # application's configuration. Kinesis Data Analytics will no longer write data from the corresponding
      # in-application stream to the external output destination.

      def delete_application_output(
        application_name : String,
        current_application_version_id : Int64,
        output_id : String
      ) : Types::DeleteApplicationOutputResponse

        input = Types::DeleteApplicationOutputRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, output_id: output_id)
        delete_application_output(input)
      end

      def delete_application_output(input : Types::DeleteApplicationOutputRequest) : Types::DeleteApplicationOutputResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_OUTPUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationOutputResponse, "DeleteApplicationOutput")
      end

      # Deletes a reference data source configuration from the specified SQL-based Kinesis Data Analytics
      # application's configuration. If the application is running, Kinesis Data Analytics immediately
      # removes the in-application table that you created using the AddApplicationReferenceDataSource
      # operation.

      def delete_application_reference_data_source(
        application_name : String,
        current_application_version_id : Int64,
        reference_id : String
      ) : Types::DeleteApplicationReferenceDataSourceResponse

        input = Types::DeleteApplicationReferenceDataSourceRequest.new(application_name: application_name, current_application_version_id: current_application_version_id, reference_id: reference_id)
        delete_application_reference_data_source(input)
      end

      def delete_application_reference_data_source(input : Types::DeleteApplicationReferenceDataSourceRequest) : Types::DeleteApplicationReferenceDataSourceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_REFERENCE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationReferenceDataSourceResponse, "DeleteApplicationReferenceDataSource")
      end

      # Deletes a snapshot of application state.

      def delete_application_snapshot(
        application_name : String,
        snapshot_creation_timestamp : Time,
        snapshot_name : String
      ) : Types::DeleteApplicationSnapshotResponse

        input = Types::DeleteApplicationSnapshotRequest.new(application_name: application_name, snapshot_creation_timestamp: snapshot_creation_timestamp, snapshot_name: snapshot_name)
        delete_application_snapshot(input)
      end

      def delete_application_snapshot(input : Types::DeleteApplicationSnapshotRequest) : Types::DeleteApplicationSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationSnapshotResponse, "DeleteApplicationSnapshot")
      end

      # Removes a VPC configuration from a Managed Service for Apache Flink application.

      def delete_application_vpc_configuration(
        application_name : String,
        vpc_configuration_id : String,
        conditional_token : String? = nil,
        current_application_version_id : Int64? = nil
      ) : Types::DeleteApplicationVpcConfigurationResponse

        input = Types::DeleteApplicationVpcConfigurationRequest.new(application_name: application_name, vpc_configuration_id: vpc_configuration_id, conditional_token: conditional_token, current_application_version_id: current_application_version_id)
        delete_application_vpc_configuration(input)
      end

      def delete_application_vpc_configuration(input : Types::DeleteApplicationVpcConfigurationRequest) : Types::DeleteApplicationVpcConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_VPC_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationVpcConfigurationResponse, "DeleteApplicationVpcConfiguration")
      end

      # Returns information about a specific Managed Service for Apache Flink application. If you want to
      # retrieve a list of all applications in your account, use the ListApplications operation.

      def describe_application(
        application_name : String,
        include_additional_details : Bool? = nil
      ) : Types::DescribeApplicationResponse

        input = Types::DescribeApplicationRequest.new(application_name: application_name, include_additional_details: include_additional_details)
        describe_application(input)
      end

      def describe_application(input : Types::DescribeApplicationRequest) : Types::DescribeApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationResponse, "DescribeApplication")
      end

      # Provides a detailed description of a specified application operation. To see a list of all the
      # operations of an application, invoke the ListApplicationOperations operation. This operation is
      # supported only for Managed Service for Apache Flink.

      def describe_application_operation(
        application_name : String,
        operation_id : String
      ) : Types::DescribeApplicationOperationResponse

        input = Types::DescribeApplicationOperationRequest.new(application_name: application_name, operation_id: operation_id)
        describe_application_operation(input)
      end

      def describe_application_operation(input : Types::DescribeApplicationOperationRequest) : Types::DescribeApplicationOperationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationOperationResponse, "DescribeApplicationOperation")
      end

      # Returns information about a snapshot of application state data.

      def describe_application_snapshot(
        application_name : String,
        snapshot_name : String
      ) : Types::DescribeApplicationSnapshotResponse

        input = Types::DescribeApplicationSnapshotRequest.new(application_name: application_name, snapshot_name: snapshot_name)
        describe_application_snapshot(input)
      end

      def describe_application_snapshot(input : Types::DescribeApplicationSnapshotRequest) : Types::DescribeApplicationSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationSnapshotResponse, "DescribeApplicationSnapshot")
      end

      # Provides a detailed description of a specified version of the application. To see a list of all the
      # versions of an application, invoke the ListApplicationVersions operation. This operation is
      # supported only for Managed Service for Apache Flink.

      def describe_application_version(
        application_name : String,
        application_version_id : Int64
      ) : Types::DescribeApplicationVersionResponse

        input = Types::DescribeApplicationVersionRequest.new(application_name: application_name, application_version_id: application_version_id)
        describe_application_version(input)
      end

      def describe_application_version(input : Types::DescribeApplicationVersionRequest) : Types::DescribeApplicationVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationVersionResponse, "DescribeApplicationVersion")
      end

      # Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating sample records on
      # the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery stream) or
      # Amazon S3 object. In the response, the operation returns the inferred schema and also the sample
      # records that the operation used to infer the schema. You can use the inferred schema when
      # configuring a streaming source for your application. When you create an application using the
      # Kinesis Data Analytics console, the console uses this operation to infer a schema and show it in the
      # console user interface.

      def discover_input_schema(
        service_execution_role : String,
        input_processing_configuration : Types::InputProcessingConfiguration? = nil,
        input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
        resource_arn : String? = nil,
        s3_configuration : Types::S3Configuration? = nil
      ) : Types::DiscoverInputSchemaResponse

        input = Types::DiscoverInputSchemaRequest.new(service_execution_role: service_execution_role, input_processing_configuration: input_processing_configuration, input_starting_position_configuration: input_starting_position_configuration, resource_arn: resource_arn, s3_configuration: s3_configuration)
        discover_input_schema(input)
      end

      def discover_input_schema(input : Types::DiscoverInputSchemaRequest) : Types::DiscoverInputSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::DISCOVER_INPUT_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscoverInputSchemaResponse, "DiscoverInputSchema")
      end

      # Lists all the operations performed for the specified application such as UpdateApplication,
      # StartApplication etc. The response also includes a summary of the operation. To get the complete
      # description of a specific operation, invoke the DescribeApplicationOperation operation. This
      # operation is supported only for Managed Service for Apache Flink.

      def list_application_operations(
        application_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        operation : String? = nil,
        operation_status : String? = nil
      ) : Types::ListApplicationOperationsResponse

        input = Types::ListApplicationOperationsRequest.new(application_name: application_name, limit: limit, next_token: next_token, operation: operation, operation_status: operation_status)
        list_application_operations(input)
      end

      def list_application_operations(input : Types::ListApplicationOperationsRequest) : Types::ListApplicationOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationOperationsResponse, "ListApplicationOperations")
      end

      # Lists information about the current application snapshots.

      def list_application_snapshots(
        application_name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationSnapshotsResponse

        input = Types::ListApplicationSnapshotsRequest.new(application_name: application_name, limit: limit, next_token: next_token)
        list_application_snapshots(input)
      end

      def list_application_snapshots(input : Types::ListApplicationSnapshotsRequest) : Types::ListApplicationSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationSnapshotsResponse, "ListApplicationSnapshots")
      end

      # Lists all the versions for the specified application, including versions that were rolled back. The
      # response also includes a summary of the configuration associated with each version. To get the
      # complete description of a specific application version, invoke the DescribeApplicationVersion
      # operation. This operation is supported only for Managed Service for Apache Flink.

      def list_application_versions(
        application_name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationVersionsResponse

        input = Types::ListApplicationVersionsRequest.new(application_name: application_name, limit: limit, next_token: next_token)
        list_application_versions(input)
      end

      def list_application_versions(input : Types::ListApplicationVersionsRequest) : Types::ListApplicationVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationVersionsResponse, "ListApplicationVersions")
      end

      # Returns a list of Managed Service for Apache Flink applications in your account. For each
      # application, the response includes the application name, Amazon Resource Name (ARN), and status. If
      # you want detailed information about a specific application, use DescribeApplication .

      def list_applications(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationsResponse

        input = Types::ListApplicationsRequest.new(limit: limit, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Types::ListApplicationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationsResponse, "ListApplications")
      end

      # Retrieves the list of key-value tags assigned to the application. For more information, see Using
      # Tagging .

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

      # Reverts the application to the previous running version. You can roll back an application if you
      # suspect it is stuck in a transient status or in the running status. You can roll back an application
      # only if it is in the UPDATING , AUTOSCALING , or RUNNING statuses. When you rollback an application,
      # it loads state data from the last successful snapshot. If the application has no snapshots, Managed
      # Service for Apache Flink rejects the rollback request.

      def rollback_application(
        application_name : String,
        current_application_version_id : Int64
      ) : Types::RollbackApplicationResponse

        input = Types::RollbackApplicationRequest.new(application_name: application_name, current_application_version_id: current_application_version_id)
        rollback_application(input)
      end

      def rollback_application(input : Types::RollbackApplicationRequest) : Types::RollbackApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::ROLLBACK_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RollbackApplicationResponse, "RollbackApplication")
      end

      # Starts the specified Managed Service for Apache Flink application. After creating an application,
      # you must exclusively call this operation to start your application.

      def start_application(
        application_name : String,
        run_configuration : Types::RunConfiguration? = nil
      ) : Types::StartApplicationResponse

        input = Types::StartApplicationRequest.new(application_name: application_name, run_configuration: run_configuration)
        start_application(input)
      end

      def start_application(input : Types::StartApplicationRequest) : Types::StartApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::START_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartApplicationResponse, "StartApplication")
      end

      # Stops the application from processing data. You can stop an application only if it is in the running
      # status, unless you set the Force parameter to true . You can use the DescribeApplication operation
      # to find the application status. Managed Service for Apache Flink takes a snapshot when the
      # application is stopped, unless Force is set to true .

      def stop_application(
        application_name : String,
        force : Bool? = nil
      ) : Types::StopApplicationResponse

        input = Types::StopApplicationRequest.new(application_name: application_name, force: force)
        stop_application(input)
      end

      def stop_application(input : Types::StopApplicationRequest) : Types::StopApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopApplicationResponse, "StopApplication")
      end

      # Adds one or more key-value tags to a Managed Service for Apache Flink application. Note that the
      # maximum number of application tags includes system tags. The maximum number of user-defined
      # application tags is 50. For more information, see Using Tagging .

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

      # Removes one or more tags from a Managed Service for Apache Flink application. For more information,
      # see Using Tagging .

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

      # Updates an existing Managed Service for Apache Flink application. Using this operation, you can
      # update application code, input configuration, and output configuration. Managed Service for Apache
      # Flink updates the ApplicationVersionId each time you update your application.

      def update_application(
        application_name : String,
        application_configuration_update : Types::ApplicationConfigurationUpdate? = nil,
        cloud_watch_logging_option_updates : Array(Types::CloudWatchLoggingOptionUpdate)? = nil,
        conditional_token : String? = nil,
        current_application_version_id : Int64? = nil,
        run_configuration_update : Types::RunConfigurationUpdate? = nil,
        runtime_environment_update : String? = nil,
        service_execution_role_update : String? = nil
      ) : Types::UpdateApplicationResponse

        input = Types::UpdateApplicationRequest.new(application_name: application_name, application_configuration_update: application_configuration_update, cloud_watch_logging_option_updates: cloud_watch_logging_option_updates, conditional_token: conditional_token, current_application_version_id: current_application_version_id, run_configuration_update: run_configuration_update, runtime_environment_update: runtime_environment_update, service_execution_role_update: service_execution_role_update)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Types::UpdateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationResponse, "UpdateApplication")
      end

      # Updates the maintenance configuration of the Managed Service for Apache Flink application. You can
      # invoke this operation on an application that is in one of the two following states: READY or RUNNING
      # . If you invoke it when the application is in a state other than these two states, it throws a
      # ResourceInUseException . The service makes use of the updated configuration the next time it
      # schedules maintenance for the application. If you invoke this operation after the service schedules
      # maintenance, the service will apply the configuration update the next time it schedules maintenance
      # for the application. This means that you might not see the maintenance configuration update applied
      # to the maintenance process that follows a successful invocation of this operation, but to the
      # following maintenance process instead. To see the current maintenance configuration of your
      # application, invoke the DescribeApplication operation. For information about application
      # maintenance, see Managed Service for Apache Flink for Apache Flink Maintenance . This operation is
      # supported only for Managed Service for Apache Flink.

      def update_application_maintenance_configuration(
        application_maintenance_configuration_update : Types::ApplicationMaintenanceConfigurationUpdate,
        application_name : String
      ) : Types::UpdateApplicationMaintenanceConfigurationResponse

        input = Types::UpdateApplicationMaintenanceConfigurationRequest.new(application_maintenance_configuration_update: application_maintenance_configuration_update, application_name: application_name)
        update_application_maintenance_configuration(input)
      end

      def update_application_maintenance_configuration(input : Types::UpdateApplicationMaintenanceConfigurationRequest) : Types::UpdateApplicationMaintenanceConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION_MAINTENANCE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationMaintenanceConfigurationResponse, "UpdateApplicationMaintenanceConfiguration")
      end
    end
  end
end
