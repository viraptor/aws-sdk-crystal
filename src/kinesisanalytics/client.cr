module Aws
  module KinesisAnalytics
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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Adds a CloudWatch log
      # stream to monitor application configuration errors. For more information about using CloudWatch log
      # streams with Amazon Kinesis Analytics applications, see Working with Amazon CloudWatch Logs .

      def add_application_cloud_watch_logging_option(
        application_name : String,
        cloud_watch_logging_option : Types::CloudWatchLoggingOption,
        current_application_version_id : Int64
      ) : Types::AddApplicationCloudWatchLoggingOptionResponse

        input = Types::AddApplicationCloudWatchLoggingOptionRequest.new(application_name: application_name, cloud_watch_logging_option: cloud_watch_logging_option, current_application_version_id: current_application_version_id)
        add_application_cloud_watch_logging_option(input)
      end

      def add_application_cloud_watch_logging_option(input : Types::AddApplicationCloudWatchLoggingOptionRequest) : Types::AddApplicationCloudWatchLoggingOptionResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_APPLICATION_CLOUD_WATCH_LOGGING_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddApplicationCloudWatchLoggingOptionResponse, "AddApplicationCloudWatchLoggingOption")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Adds a streaming source to
      # your Amazon Kinesis application. For conceptual information, see Configuring Application Input . You
      # can add a streaming source either when you create an application or you can use this operation to
      # add a streaming source after you create an application. For more information, see CreateApplication
      # . Any configuration update, including adding a streaming source using this operation, results in a
      # new version of the application. You can use the DescribeApplication operation to find the current
      # application version. This operation requires permissions to perform the
      # kinesisanalytics:AddApplicationInput action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Adds an
      # InputProcessingConfiguration to an application. An input processor preprocesses records on the input
      # stream before the application's SQL code executes. Currently, the only input processor available is
      # AWS Lambda .

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Adds an external
      # destination to your Amazon Kinesis Analytics application. If you want Amazon Kinesis Analytics to
      # deliver data from an in-application stream within your application to an external destination (such
      # as an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery stream, or an AWS Lambda function),
      # you add the relevant configuration to your application using this operation. You can configure one
      # or more outputs for your application. Each output configuration maps an in-application stream and an
      # external destination. You can use one of the output configurations to deliver data from your
      # in-application error stream to an external destination so that you can analyze the errors. For more
      # information, see Understanding Application Output (Destination) . Any configuration update,
      # including adding a streaming source using this operation, results in a new version of the
      # application. You can use the DescribeApplication operation to find the current application version.
      # For the limits on the number of application inputs and outputs you can configure, see Limits . This
      # operation requires permissions to perform the kinesisanalytics:AddApplicationOutput action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Adds a reference data
      # source to an existing application. Amazon Kinesis Analytics reads reference data (that is, an Amazon
      # S3 object) and creates an in-application table within your application. In the request, you provide
      # the source (S3 bucket name and object key name), name of the in-application table to create, and the
      # necessary mapping information that describes how data in Amazon S3 object maps to columns in the
      # resulting in-application table. For conceptual information, see Configuring Application Input . For
      # the limits on data sources you can add to your application, see Limits . This operation requires
      # permissions to perform the kinesisanalytics:AddApplicationOutput action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Creates an Amazon Kinesis
      # Analytics application. You can configure each application with one streaming source as input,
      # application code to process the input, and up to three destinations where you want Amazon Kinesis
      # Analytics to write the output data from your application. For an overview, see How it Works . In the
      # input configuration, you map the streaming source to an in-application stream, which you can think
      # of as a constantly updating table. In the mapping, you must provide a schema for the in-application
      # stream and map each data column in the in-application stream to a data element in the streaming
      # source. Your application code is one or more SQL statements that read input data, transform it, and
      # generate output. Your application code can create one or more SQL artifacts like SQL streams or
      # pumps. In the output configuration, you can configure the application to write data from
      # in-application streams created in your applications to up to three destinations. To read data from
      # your source stream or write data to destination streams, Amazon Kinesis Analytics needs your
      # permissions. You grant these permissions by creating IAM roles. This operation requires permissions
      # to perform the kinesisanalytics:CreateApplication action. For introductory exercises to create an
      # Amazon Kinesis Analytics application, see Getting Started .

      def create_application(
        application_name : String,
        application_code : String? = nil,
        application_description : String? = nil,
        cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)? = nil,
        inputs : Array(Types::Input)? = nil,
        outputs : Array(Types::Output)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateApplicationResponse

        input = Types::CreateApplicationRequest.new(application_name: application_name, application_code: application_code, application_description: application_description, cloud_watch_logging_options: cloud_watch_logging_options, inputs: inputs, outputs: outputs, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResponse, "CreateApplication")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Deletes the specified
      # application. Amazon Kinesis Analytics halts application execution and deletes the application,
      # including any application artifacts (such as in-application streams, reference table, and
      # application code). This operation requires permissions to perform the
      # kinesisanalytics:DeleteApplication action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Deletes a CloudWatch log
      # stream from an application. For more information about using CloudWatch log streams with Amazon
      # Kinesis Analytics applications, see Working with Amazon CloudWatch Logs .

      def delete_application_cloud_watch_logging_option(
        application_name : String,
        cloud_watch_logging_option_id : String,
        current_application_version_id : Int64
      ) : Types::DeleteApplicationCloudWatchLoggingOptionResponse

        input = Types::DeleteApplicationCloudWatchLoggingOptionRequest.new(application_name: application_name, cloud_watch_logging_option_id: cloud_watch_logging_option_id, current_application_version_id: current_application_version_id)
        delete_application_cloud_watch_logging_option(input)
      end

      def delete_application_cloud_watch_logging_option(input : Types::DeleteApplicationCloudWatchLoggingOptionRequest) : Types::DeleteApplicationCloudWatchLoggingOptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_CLOUD_WATCH_LOGGING_OPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationCloudWatchLoggingOptionResponse, "DeleteApplicationCloudWatchLoggingOption")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Deletes an
      # InputProcessingConfiguration from an input.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Deletes output destination
      # configuration from your application configuration. Amazon Kinesis Analytics will no longer write
      # data from the corresponding in-application stream to the external output destination. This operation
      # requires permissions to perform the kinesisanalytics:DeleteApplicationOutput action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Deletes a reference data
      # source configuration from the specified application configuration. If the application is running,
      # Amazon Kinesis Analytics immediately removes the in-application table that you created using the
      # AddApplicationReferenceDataSource operation. This operation requires permissions to perform the
      # kinesisanalytics.DeleteApplicationReferenceDataSource action.

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Returns information about
      # a specific Amazon Kinesis Analytics application. If you want to retrieve a list of all applications
      # in your account, use the ListApplications operation. This operation requires permissions to perform
      # the kinesisanalytics:DescribeApplication action. You can use DescribeApplication to get the current
      # application versionId, which you need to call other operations such as Update .

      def describe_application(
        application_name : String
      ) : Types::DescribeApplicationResponse

        input = Types::DescribeApplicationRequest.new(application_name: application_name)
        describe_application(input)
      end

      def describe_application(input : Types::DescribeApplicationRequest) : Types::DescribeApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationResponse, "DescribeApplication")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Infers a schema by
      # evaluating sample records on the specified streaming source (Amazon Kinesis stream or Amazon Kinesis
      # Firehose delivery stream) or S3 object. In the response, the operation returns the inferred schema
      # and also the sample records that the operation used to infer the schema. You can use the inferred
      # schema when configuring a streaming source for your application. For conceptual information, see
      # Configuring Application Input . Note that when you create an application using the Amazon Kinesis
      # Analytics console, the console uses this operation to infer a schema and show it in the console user
      # interface. This operation requires permissions to perform the kinesisanalytics:DiscoverInputSchema
      # action.

      def discover_input_schema(
        input_processing_configuration : Types::InputProcessingConfiguration? = nil,
        input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
        resource_arn : String? = nil,
        role_arn : String? = nil,
        s3_configuration : Types::S3Configuration? = nil
      ) : Types::DiscoverInputSchemaResponse

        input = Types::DiscoverInputSchemaRequest.new(input_processing_configuration: input_processing_configuration, input_starting_position_configuration: input_starting_position_configuration, resource_arn: resource_arn, role_arn: role_arn, s3_configuration: s3_configuration)
        discover_input_schema(input)
      end

      def discover_input_schema(input : Types::DiscoverInputSchemaRequest) : Types::DiscoverInputSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::DISCOVER_INPUT_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscoverInputSchemaResponse, "DiscoverInputSchema")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Returns a list of Amazon
      # Kinesis Analytics applications in your account. For each application, the response includes the
      # application name, Amazon Resource Name (ARN), and status. If the response returns the
      # HasMoreApplications value as true, you can send another request by adding the
      # ExclusiveStartApplicationName in the request body, and set the value of this to the last application
      # name from the previous response. If you want detailed information about a specific application, use
      # DescribeApplication . This operation requires permissions to perform the
      # kinesisanalytics:ListApplications action.

      def list_applications(
        exclusive_start_application_name : String? = nil,
        limit : Int32? = nil
      ) : Types::ListApplicationsResponse

        input = Types::ListApplicationsRequest.new(exclusive_start_application_name: exclusive_start_application_name, limit: limit)
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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Starts the specified
      # Amazon Kinesis Analytics application. After creating an application, you must exclusively call this
      # operation to start your application. After the application starts, it begins consuming the input
      # data, processes it, and writes the output to the configured destination. The application status must
      # be READY for you to start an application. You can get the application status in the console or using
      # the DescribeApplication operation. After you start the application, you can stop the application
      # from processing the input by calling the StopApplication operation. This operation requires
      # permissions to perform the kinesisanalytics:StartApplication action.

      def start_application(
        application_name : String,
        input_configurations : Array(Types::InputConfiguration)
      ) : Types::StartApplicationResponse

        input = Types::StartApplicationRequest.new(application_name: application_name, input_configurations: input_configurations)
        start_application(input)
      end

      def start_application(input : Types::StartApplicationRequest) : Types::StartApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::START_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartApplicationResponse, "StartApplication")
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Stops the application from
      # processing input data. You can stop an application only if it is in the running state. You can use
      # the DescribeApplication operation to find the application state. After the application is stopped,
      # Amazon Kinesis Analytics stops reading data from the input, the application stops processing data,
      # and there is no output written to the destination. This operation requires permissions to perform
      # the kinesisanalytics:StopApplication action.

      def stop_application(
        application_name : String
      ) : Types::StopApplicationResponse

        input = Types::StopApplicationRequest.new(application_name: application_name)
        stop_application(input)
      end

      def stop_application(input : Types::StopApplicationRequest) : Types::StopApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopApplicationResponse, "StopApplication")
      end

      # Adds one or more key-value tags to a Kinesis Analytics application. Note that the maximum number of
      # application tags includes system tags. The maximum number of user-defined application tags is 50.
      # For more information, see Using Tagging .

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

      # Removes one or more tags from a Kinesis Analytics application. For more information, see Using
      # Tagging .

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

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Updates an existing Amazon
      # Kinesis Analytics application. Using this API, you can update application code, input configuration,
      # and output configuration. Note that Amazon Kinesis Analytics updates the CurrentApplicationVersionId
      # each time you update your application. This operation requires permission for the
      # kinesisanalytics:UpdateApplication action.

      def update_application(
        application_name : String,
        application_update : Types::ApplicationUpdate,
        current_application_version_id : Int64
      ) : Types::UpdateApplicationResponse

        input = Types::UpdateApplicationRequest.new(application_name: application_name, application_update: application_update, current_application_version_id: current_application_version_id)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Types::UpdateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationResponse, "UpdateApplication")
      end
    end
  end
end
