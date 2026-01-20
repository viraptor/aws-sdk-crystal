require "json"
require "time"

module AwsSdk
  module KinesisAnalytics
    module Types


      struct AddApplicationCloudWatchLoggingOptionRequest
        include JSON::Serializable

        # The Kinesis Analytics application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Provides the CloudWatch log stream Amazon Resource Name (ARN) and the IAM role ARN. Note: To write
        # application messages to CloudWatch, the IAM role that is used must have the PutLogEvents policy
        # action enabled.

        @[JSON::Field(key: "CloudWatchLoggingOption")]
        getter cloud_watch_logging_option : Types::CloudWatchLoggingOption

        # The version ID of the Kinesis Analytics application.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        def initialize(
          @application_name : String,
          @cloud_watch_logging_option : Types::CloudWatchLoggingOption,
          @current_application_version_id : Int64
        )
        end
      end


      struct AddApplicationCloudWatchLoggingOptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AddApplicationInputProcessingConfigurationRequest
        include JSON::Serializable

        # Name of the application to which you want to add the input processing configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Version of the application to which you want to add the input processing configuration. You can use
        # the DescribeApplication operation to get the current application version. If the version specified
        # is not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the input configuration to add the input processing configuration to. You can get a list
        # of the input IDs for an application using the DescribeApplication operation.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        # The InputProcessingConfiguration to add to the application.

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input_id : String,
          @input_processing_configuration : Types::InputProcessingConfiguration
        )
        end
      end


      struct AddApplicationInputProcessingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AddApplicationInputRequest
        include JSON::Serializable

        # Name of your existing Amazon Kinesis Analytics application to which you want to add the streaming
        # source.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Current version of your Amazon Kinesis Analytics application. You can use the DescribeApplication
        # operation to find the current application version.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The Input to add.

        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input : Types::Input
        )
        end
      end


      struct AddApplicationInputResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AddApplicationOutputRequest
        include JSON::Serializable

        # Name of the application to which you want to add the output configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Version of the application to which you want to add the output configuration. You can use the
        # DescribeApplication operation to get the current application version. If the version specified is
        # not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # An array of objects, each describing one output configuration. In the output configuration, you
        # specify the name of an in-application stream, a destination (that is, an Amazon Kinesis stream, an
        # Amazon Kinesis Firehose delivery stream, or an AWS Lambda function), and record the formation to use
        # when writing to the destination.

        @[JSON::Field(key: "Output")]
        getter output : Types::Output

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @output : Types::Output
        )
        end
      end


      struct AddApplicationOutputResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AddApplicationReferenceDataSourceRequest
        include JSON::Serializable

        # Name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Version of the application for which you are adding the reference data source. You can use the
        # DescribeApplication operation to get the current application version. If the version specified is
        # not the current version, the ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The reference data source can be an object in your Amazon S3 bucket. Amazon Kinesis Analytics reads
        # the object and copies the data into the in-application table that is created. You provide an S3
        # bucket, object key name, and the resulting in-application table that is created. You must also
        # provide an IAM role with the necessary permissions that Amazon Kinesis Analytics can assume to read
        # the object from your S3 bucket on your behalf.

        @[JSON::Field(key: "ReferenceDataSource")]
        getter reference_data_source : Types::ReferenceDataSource

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @reference_data_source : Types::ReferenceDataSource
        )
        end
      end


      struct AddApplicationReferenceDataSourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Provides a description of
      # the application, including the application Amazon Resource Name (ARN), status, latest version, and
      # input and output configuration.

      struct ApplicationDetail
        include JSON::Serializable

        # ARN of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String

        # Name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Status of the application.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String

        # Provides the current application version.

        @[JSON::Field(key: "ApplicationVersionId")]
        getter application_version_id : Int64

        # Returns the application code that you provided to perform data analysis on any of the in-application
        # streams in your application.

        @[JSON::Field(key: "ApplicationCode")]
        getter application_code : String?

        # Description of the application.

        @[JSON::Field(key: "ApplicationDescription")]
        getter application_description : String?

        # Describes the CloudWatch log streams that are configured to receive application messages. For more
        # information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see
        # Working with Amazon CloudWatch Logs .

        @[JSON::Field(key: "CloudWatchLoggingOptionDescriptions")]
        getter cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)?

        # Time stamp when the application version was created.

        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # Describes the application input configuration. For more information, see Configuring Application
        # Input .

        @[JSON::Field(key: "InputDescriptions")]
        getter input_descriptions : Array(Types::InputDescription)?

        # Time stamp when the application was last updated.

        @[JSON::Field(key: "LastUpdateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # Describes the application output configuration. For more information, see Configuring Application
        # Output .

        @[JSON::Field(key: "OutputDescriptions")]
        getter output_descriptions : Array(Types::OutputDescription)?

        # Describes reference data sources configured for the application. For more information, see
        # Configuring Application Input .

        @[JSON::Field(key: "ReferenceDataSourceDescriptions")]
        getter reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)?

        def initialize(
          @application_arn : String,
          @application_name : String,
          @application_status : String,
          @application_version_id : Int64,
          @application_code : String? = nil,
          @application_description : String? = nil,
          @cloud_watch_logging_option_descriptions : Array(Types::CloudWatchLoggingOptionDescription)? = nil,
          @create_timestamp : Time? = nil,
          @input_descriptions : Array(Types::InputDescription)? = nil,
          @last_update_timestamp : Time? = nil,
          @output_descriptions : Array(Types::OutputDescription)? = nil,
          @reference_data_source_descriptions : Array(Types::ReferenceDataSourceDescription)? = nil
        )
        end
      end

      # This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only supports
      # SQL applications. Version 2 of the API supports SQL and Java applications. For more information
      # about version 2, see Amazon Kinesis Data Analytics API V2 Documentation . Provides application
      # summary information, including the application Amazon Resource Name (ARN), name, and status.

      struct ApplicationSummary
        include JSON::Serializable

        # ARN of the application.

        @[JSON::Field(key: "ApplicationARN")]
        getter application_arn : String

        # Name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Status of the application.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String

        def initialize(
          @application_arn : String,
          @application_name : String,
          @application_status : String
        )
        end
      end

      # Describes updates to apply to an existing Amazon Kinesis Analytics application.

      struct ApplicationUpdate
        include JSON::Serializable

        # Describes application code updates.

        @[JSON::Field(key: "ApplicationCodeUpdate")]
        getter application_code_update : String?

        # Describes application CloudWatch logging option updates.

        @[JSON::Field(key: "CloudWatchLoggingOptionUpdates")]
        getter cloud_watch_logging_option_updates : Array(Types::CloudWatchLoggingOptionUpdate)?

        # Describes application input configuration updates.

        @[JSON::Field(key: "InputUpdates")]
        getter input_updates : Array(Types::InputUpdate)?

        # Describes application output configuration updates.

        @[JSON::Field(key: "OutputUpdates")]
        getter output_updates : Array(Types::OutputUpdate)?

        # Describes application reference data source updates.

        @[JSON::Field(key: "ReferenceDataSourceUpdates")]
        getter reference_data_source_updates : Array(Types::ReferenceDataSourceUpdate)?

        def initialize(
          @application_code_update : String? = nil,
          @cloud_watch_logging_option_updates : Array(Types::CloudWatchLoggingOptionUpdate)? = nil,
          @input_updates : Array(Types::InputUpdate)? = nil,
          @output_updates : Array(Types::OutputUpdate)? = nil,
          @reference_data_source_updates : Array(Types::ReferenceDataSourceUpdate)? = nil
        )
        end
      end

      # Provides additional mapping information when the record format uses delimiters, such as CSV. For
      # example, the following sample records use CSV format, where the records use the '\n' as the row
      # delimiter and a comma (",") as the column delimiter: "name1", "address1" "name2", "address2"

      struct CSVMappingParameters
        include JSON::Serializable

        # Column delimiter. For example, in a CSV format, a comma (",") is the typical column delimiter.

        @[JSON::Field(key: "RecordColumnDelimiter")]
        getter record_column_delimiter : String

        # Row delimiter. For example, in a CSV format, '\n' is the typical row delimiter.

        @[JSON::Field(key: "RecordRowDelimiter")]
        getter record_row_delimiter : String

        def initialize(
          @record_column_delimiter : String,
          @record_row_delimiter : String
        )
        end
      end

      # Provides a description of CloudWatch logging options, including the log stream Amazon Resource Name
      # (ARN) and the role ARN.

      struct CloudWatchLoggingOption
        include JSON::Serializable

        # ARN of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARN")]
        getter log_stream_arn : String

        # IAM ARN of the role to use to send application messages. Note: To write application messages to
        # CloudWatch, the IAM role that is used must have the PutLogEvents policy action enabled.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @log_stream_arn : String,
          @role_arn : String
        )
        end
      end

      # Description of the CloudWatch logging option.

      struct CloudWatchLoggingOptionDescription
        include JSON::Serializable

        # ARN of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARN")]
        getter log_stream_arn : String

        # IAM ARN of the role to use to send application messages. Note: To write application messages to
        # CloudWatch, the IAM role used must have the PutLogEvents policy action enabled.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # ID of the CloudWatch logging option description.

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String?

        def initialize(
          @log_stream_arn : String,
          @role_arn : String,
          @cloud_watch_logging_option_id : String? = nil
        )
        end
      end

      # Describes CloudWatch logging option updates.

      struct CloudWatchLoggingOptionUpdate
        include JSON::Serializable

        # ID of the CloudWatch logging option to update

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String

        # ARN of the CloudWatch log to receive application messages.

        @[JSON::Field(key: "LogStreamARNUpdate")]
        getter log_stream_arn_update : String?

        # IAM ARN of the role to use to send application messages. Note: To write application messages to
        # CloudWatch, the IAM role used must have the PutLogEvents policy action enabled.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @cloud_watch_logging_option_id : String,
          @log_stream_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # User-provided application code (query) is invalid. This can be a simple syntax error.

      struct CodeValidationException
        include JSON::Serializable

        # Test

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception thrown as a result of concurrent modification to an application. For example, two
      # individuals attempting to edit the same application at the same time.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # TBD

      struct CreateApplicationRequest
        include JSON::Serializable

        # Name of your Amazon Kinesis Analytics application (for example, sample-app ).

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # One or more SQL statements that read input data, transform it, and generate output. For example, you
        # can write a SQL statement that reads data from one in-application stream, generates a running
        # average of the number of advertisement clicks by vendor, and insert resulting rows in another
        # in-application stream using pumps. For more information about the typical pattern, see Application
        # Code . You can provide such series of SQL statements, where output of one statement can be used as
        # the input for the next statement. You store intermediate results by creating in-application streams
        # and pumps. Note that the application code must create the streams with names specified in the
        # Outputs . For example, if your Outputs defines output streams named ExampleOutputStream1 and
        # ExampleOutputStream2 , then your application code must create these streams.

        @[JSON::Field(key: "ApplicationCode")]
        getter application_code : String?

        # Summary description of the application.

        @[JSON::Field(key: "ApplicationDescription")]
        getter application_description : String?

        # Use this parameter to configure a CloudWatch log stream to monitor application configuration errors.
        # For more information, see Working with Amazon CloudWatch Logs .

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)?

        # Use this parameter to configure the application input. You can configure your application to receive
        # input from a single streaming source. In this configuration, you map this streaming source to an
        # in-application stream that is created. Your application code can then query the in-application
        # stream like a table (you can think of it as a constantly updating table). For the streaming source,
        # you provide its Amazon Resource Name (ARN) and format of data on the stream (for example, JSON, CSV,
        # etc.). You also must provide an IAM role that Amazon Kinesis Analytics can assume to read this
        # stream on your behalf. To create the in-application stream, you need to specify a schema to
        # transform your data into a schematized version used in SQL. In the schema, you provide the necessary
        # mapping of the data elements in the streaming source to record columns in the in-app stream.

        @[JSON::Field(key: "Inputs")]
        getter inputs : Array(Types::Input)?

        # You can configure application output to write data from any of the in-application streams to up to
        # three destinations. These destinations can be Amazon Kinesis streams, Amazon Kinesis Firehose
        # delivery streams, AWS Lambda destinations, or any combination of the three. In the configuration,
        # you specify the in-application stream name, the destination stream or Lambda function Amazon
        # Resource Name (ARN), and the format to use when writing data. You must also provide an IAM role that
        # Amazon Kinesis Analytics can assume to write to the destination stream or Lambda function on your
        # behalf. In the output configuration, you also provide the output stream or Lambda function ARN. For
        # stream destinations, you provide the format of data in the stream (for example, JSON, CSV). You also
        # must provide an IAM role that Amazon Kinesis Analytics can assume to write to the stream or Lambda
        # function on your behalf.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # A list of one or more tags to assign to the application. A tag is a key-value pair that identifies
        # an application. Note that the maximum number of application tags includes system tags. The maximum
        # number of user-defined application tags is 50. For more information, see Using Tagging .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @application_code : String? = nil,
          @application_description : String? = nil,
          @cloud_watch_logging_options : Array(Types::CloudWatchLoggingOption)? = nil,
          @inputs : Array(Types::Input)? = nil,
          @outputs : Array(Types::Output)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # TBD

      struct CreateApplicationResponse
        include JSON::Serializable

        # In response to your CreateApplication request, Amazon Kinesis Analytics returns a response with a
        # summary of the application it created, including the application Amazon Resource Name (ARN), name,
        # and status.

        @[JSON::Field(key: "ApplicationSummary")]
        getter application_summary : Types::ApplicationSummary

        def initialize(
          @application_summary : Types::ApplicationSummary
        )
        end
      end


      struct DeleteApplicationCloudWatchLoggingOptionRequest
        include JSON::Serializable

        # The Kinesis Analytics application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The CloudWatchLoggingOptionId of the CloudWatch logging option to delete. You can get the
        # CloudWatchLoggingOptionId by using the DescribeApplication operation.

        @[JSON::Field(key: "CloudWatchLoggingOptionId")]
        getter cloud_watch_logging_option_id : String

        # The version ID of the Kinesis Analytics application.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        def initialize(
          @application_name : String,
          @cloud_watch_logging_option_id : String,
          @current_application_version_id : Int64
        )
        end
      end


      struct DeleteApplicationCloudWatchLoggingOptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationInputProcessingConfigurationRequest
        include JSON::Serializable

        # The Kinesis Analytics application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The version ID of the Kinesis Analytics application.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the input configuration from which to delete the input processing configuration. You can
        # get a list of the input IDs for an application by using the DescribeApplication operation.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @input_id : String
        )
        end
      end


      struct DeleteApplicationInputProcessingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationOutputRequest
        include JSON::Serializable

        # Amazon Kinesis Analytics application name.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Amazon Kinesis Analytics application version. You can use the DescribeApplication operation to get
        # the current application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # The ID of the configuration to delete. Each output configuration that is added to the application,
        # either when the application is created or later using the AddApplicationOutput operation, has a
        # unique ID. You need to provide the ID to uniquely identify the output configuration that you want to
        # delete from the application configuration. You can use the DescribeApplication operation to get the
        # specific OutputId .

        @[JSON::Field(key: "OutputId")]
        getter output_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @output_id : String
        )
        end
      end


      struct DeleteApplicationOutputResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationReferenceDataSourceRequest
        include JSON::Serializable

        # Name of an existing application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Version of the application. You can use the DescribeApplication operation to get the current
        # application version. If the version specified is not the current version, the
        # ConcurrentModificationException is returned.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        # ID of the reference data source. When you add a reference data source to your application using the
        # AddApplicationReferenceDataSource , Amazon Kinesis Analytics assigns an ID. You can use the
        # DescribeApplication operation to get the reference ID.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        def initialize(
          @application_name : String,
          @current_application_version_id : Int64,
          @reference_id : String
        )
        end
      end


      struct DeleteApplicationReferenceDataSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # Name of the Amazon Kinesis Analytics application to delete.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # You can use the DescribeApplication operation to get this value.

        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time

        def initialize(
          @application_name : String,
          @create_timestamp : Time
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeApplicationRequest
        include JSON::Serializable

        # Name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        def initialize(
          @application_name : String
        )
        end
      end


      struct DescribeApplicationResponse
        include JSON::Serializable

        # Provides a description of the application, such as the application Amazon Resource Name (ARN),
        # status, latest version, and input and output configuration details.

        @[JSON::Field(key: "ApplicationDetail")]
        getter application_detail : Types::ApplicationDetail

        def initialize(
          @application_detail : Types::ApplicationDetail
        )
        end
      end

      # Describes the data format when records are written to the destination. For more information, see
      # Configuring Application Output .

      struct DestinationSchema
        include JSON::Serializable

        # Specifies the format of the records on the output stream.

        @[JSON::Field(key: "RecordFormatType")]
        getter record_format_type : String

        def initialize(
          @record_format_type : String
        )
        end
      end


      struct DiscoverInputSchemaRequest
        include JSON::Serializable

        # The InputProcessingConfiguration to use to preprocess the records before discovering the schema of
        # the records.

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration?

        # Point at which you want Amazon Kinesis Analytics to start reading records from the specified
        # streaming source discovery purposes.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration?

        # Amazon Resource Name (ARN) of the streaming source.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Specify this parameter to discover a schema from data in an Amazon S3 object.

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3Configuration?

        def initialize(
          @input_processing_configuration : Types::InputProcessingConfiguration? = nil,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @s3_configuration : Types::S3Configuration? = nil
        )
        end
      end


      struct DiscoverInputSchemaResponse
        include JSON::Serializable

        # Schema inferred from the streaming source. It identifies the format of the data in the streaming
        # source and how each data element maps to corresponding columns in the in-application stream that you
        # can create.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema?

        # An array of elements, where each element corresponds to a row in a stream record (a stream record
        # can have more than one row).

        @[JSON::Field(key: "ParsedInputRecords")]
        getter parsed_input_records : Array(Array(String))?

        # Stream data that was modified by the processor specified in the InputProcessingConfiguration
        # parameter.

        @[JSON::Field(key: "ProcessedInputRecords")]
        getter processed_input_records : Array(String)?

        # Raw stream data that was sampled to infer the schema.

        @[JSON::Field(key: "RawInputRecords")]
        getter raw_input_records : Array(String)?

        def initialize(
          @input_schema : Types::SourceSchema? = nil,
          @parsed_input_records : Array(Array(String))? = nil,
          @processed_input_records : Array(String)? = nil,
          @raw_input_records : Array(String)? = nil
        )
        end
      end

      # When you configure the application input, you specify the streaming source, the in-application
      # stream name that is created, and the mapping between the two. For more information, see Configuring
      # Application Input .

      struct Input
        include JSON::Serializable

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns in the in-application stream that is being created. Also used to describe the
        # format of the reference data source.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema

        # Name prefix to use when creating an in-application stream. Suppose that you specify a prefix
        # "MyInApplicationStream." Amazon Kinesis Analytics then creates one or more (as per the
        # InputParallelism count you specified) in-application streams with names "MyInApplicationStream_001,"
        # "MyInApplicationStream_002," and so on.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String

        # Describes the number of in-application streams to create. Data from your source is routed to these
        # in-application input streams. (see Configuring Application Input .

        @[JSON::Field(key: "InputParallelism")]
        getter input_parallelism : Types::InputParallelism?

        # The InputProcessingConfiguration for the input. An input processor transforms records as they are
        # received from the stream, before the application's SQL code executes. Currently, the only input
        # processing configuration available is InputLambdaProcessor .

        @[JSON::Field(key: "InputProcessingConfiguration")]
        getter input_processing_configuration : Types::InputProcessingConfiguration?

        # If the streaming source is an Amazon Kinesis Firehose delivery stream, identifies the delivery
        # stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on your
        # behalf. Note: Either KinesisStreamsInput or KinesisFirehoseInput is required.

        @[JSON::Field(key: "KinesisFirehoseInput")]
        getter kinesis_firehose_input : Types::KinesisFirehoseInput?

        # If the streaming source is an Amazon Kinesis stream, identifies the stream's Amazon Resource Name
        # (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the stream on your behalf.
        # Note: Either KinesisStreamsInput or KinesisFirehoseInput is required.

        @[JSON::Field(key: "KinesisStreamsInput")]
        getter kinesis_streams_input : Types::KinesisStreamsInput?

        def initialize(
          @input_schema : Types::SourceSchema,
          @name_prefix : String,
          @input_parallelism : Types::InputParallelism? = nil,
          @input_processing_configuration : Types::InputProcessingConfiguration? = nil,
          @kinesis_firehose_input : Types::KinesisFirehoseInput? = nil,
          @kinesis_streams_input : Types::KinesisStreamsInput? = nil
        )
        end
      end

      # When you start your application, you provide this configuration, which identifies the input source
      # and the point in the input source at which you want the application to start processing records.

      struct InputConfiguration
        include JSON::Serializable

        # Input source ID. You can get this ID by calling the DescribeApplication operation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Point at which you want the application to start processing records from the streaming source.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration

        def initialize(
          @id : String,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration
        )
        end
      end

      # Describes the application input configuration. For more information, see Configuring Application
      # Input .

      struct InputDescription
        include JSON::Serializable

        # Returns the in-application stream names that are mapped to the stream source.

        @[JSON::Field(key: "InAppStreamNames")]
        getter in_app_stream_names : Array(String)?

        # Input ID associated with the application input. This is the ID that Amazon Kinesis Analytics assigns
        # to each input configuration you add to your application.

        @[JSON::Field(key: "InputId")]
        getter input_id : String?

        # Describes the configured parallelism (number of in-application streams mapped to the streaming
        # source).

        @[JSON::Field(key: "InputParallelism")]
        getter input_parallelism : Types::InputParallelism?

        # The description of the preprocessor that executes on records in this input before the application's
        # code is run.

        @[JSON::Field(key: "InputProcessingConfigurationDescription")]
        getter input_processing_configuration_description : Types::InputProcessingConfigurationDescription?

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns in the in-application stream that is being created.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : Types::SourceSchema?

        # Point at which the application is configured to read from the input stream.

        @[JSON::Field(key: "InputStartingPositionConfiguration")]
        getter input_starting_position_configuration : Types::InputStartingPositionConfiguration?

        # If an Amazon Kinesis Firehose delivery stream is configured as a streaming source, provides the
        # delivery stream's ARN and an IAM role that enables Amazon Kinesis Analytics to access the stream on
        # your behalf.

        @[JSON::Field(key: "KinesisFirehoseInputDescription")]
        getter kinesis_firehose_input_description : Types::KinesisFirehoseInputDescription?

        # If an Amazon Kinesis stream is configured as streaming source, provides Amazon Kinesis stream's
        # Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to access the
        # stream on your behalf.

        @[JSON::Field(key: "KinesisStreamsInputDescription")]
        getter kinesis_streams_input_description : Types::KinesisStreamsInputDescription?

        # In-application name prefix.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        def initialize(
          @in_app_stream_names : Array(String)? = nil,
          @input_id : String? = nil,
          @input_parallelism : Types::InputParallelism? = nil,
          @input_processing_configuration_description : Types::InputProcessingConfigurationDescription? = nil,
          @input_schema : Types::SourceSchema? = nil,
          @input_starting_position_configuration : Types::InputStartingPositionConfiguration? = nil,
          @kinesis_firehose_input_description : Types::KinesisFirehoseInputDescription? = nil,
          @kinesis_streams_input_description : Types::KinesisStreamsInputDescription? = nil,
          @name_prefix : String? = nil
        )
        end
      end

      # An object that contains the Amazon Resource Name (ARN) of the AWS Lambda function that is used to
      # preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda
      # function.

      struct InputLambdaProcessor
        include JSON::Serializable

        # The ARN of the AWS Lambda function that operates on records in the stream. To specify an earlier
        # version of the Lambda function than the latest, include the Lambda function version in the Lambda
        # function ARN. For more information about Lambda ARNs, see Example ARNs: AWS Lambda

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The ARN of the IAM role that is used to access the AWS Lambda function.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # An object that contains the Amazon Resource Name (ARN) of the AWS Lambda function that is used to
      # preprocess records in the stream, and the ARN of the IAM role that is used to access the AWS Lambda
      # expression.

      struct InputLambdaProcessorDescription
        include JSON::Serializable

        # The ARN of the AWS Lambda function that is used to preprocess the records in the stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The ARN of the IAM role that is used to access the AWS Lambda function.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Represents an update to the InputLambdaProcessor that is used to preprocess the records in the
      # stream.

      struct InputLambdaProcessorUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new AWS Lambda function that is used to preprocess the records
        # in the stream. To specify an earlier version of the Lambda function than the latest, include the
        # Lambda function version in the Lambda function ARN. For more information about Lambda ARNs, see
        # Example ARNs: AWS Lambda

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # The ARN of the new IAM role that is used to access the AWS Lambda function.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # Describes the number of in-application streams to create for a given streaming source. For
      # information about parallelism, see Configuring Application Input .

      struct InputParallelism
        include JSON::Serializable

        # Number of in-application streams to create. For more information, see Limits .

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        def initialize(
          @count : Int32? = nil
        )
        end
      end

      # Provides updates to the parallelism count.

      struct InputParallelismUpdate
        include JSON::Serializable

        # Number of in-application streams to create for the specified streaming source.

        @[JSON::Field(key: "CountUpdate")]
        getter count_update : Int32?

        def initialize(
          @count_update : Int32? = nil
        )
        end
      end

      # Provides a description of a processor that is used to preprocess the records in the stream before
      # being processed by your application code. Currently, the only input processor available is AWS
      # Lambda .

      struct InputProcessingConfiguration
        include JSON::Serializable

        # The InputLambdaProcessor that is used to preprocess the records in the stream before being processed
        # by your application code.

        @[JSON::Field(key: "InputLambdaProcessor")]
        getter input_lambda_processor : Types::InputLambdaProcessor

        def initialize(
          @input_lambda_processor : Types::InputLambdaProcessor
        )
        end
      end

      # Provides configuration information about an input processor. Currently, the only input processor
      # available is AWS Lambda .

      struct InputProcessingConfigurationDescription
        include JSON::Serializable

        # Provides configuration information about the associated InputLambdaProcessorDescription .

        @[JSON::Field(key: "InputLambdaProcessorDescription")]
        getter input_lambda_processor_description : Types::InputLambdaProcessorDescription?

        def initialize(
          @input_lambda_processor_description : Types::InputLambdaProcessorDescription? = nil
        )
        end
      end

      # Describes updates to an InputProcessingConfiguration .

      struct InputProcessingConfigurationUpdate
        include JSON::Serializable

        # Provides update information for an InputLambdaProcessor .

        @[JSON::Field(key: "InputLambdaProcessorUpdate")]
        getter input_lambda_processor_update : Types::InputLambdaProcessorUpdate

        def initialize(
          @input_lambda_processor_update : Types::InputLambdaProcessorUpdate
        )
        end
      end

      # Describes updates for the application's input schema.

      struct InputSchemaUpdate
        include JSON::Serializable

        # A list of RecordColumn objects. Each object describes the mapping of the streaming source element to
        # the corresponding column in the in-application stream.

        @[JSON::Field(key: "RecordColumnUpdates")]
        getter record_column_updates : Array(Types::RecordColumn)?

        # Specifies the encoding of the records in the streaming source. For example, UTF-8.

        @[JSON::Field(key: "RecordEncodingUpdate")]
        getter record_encoding_update : String?

        # Specifies the format of the records on the streaming source.

        @[JSON::Field(key: "RecordFormatUpdate")]
        getter record_format_update : Types::RecordFormat?

        def initialize(
          @record_column_updates : Array(Types::RecordColumn)? = nil,
          @record_encoding_update : String? = nil,
          @record_format_update : Types::RecordFormat? = nil
        )
        end
      end

      # Describes the point at which the application reads from the streaming source.

      struct InputStartingPositionConfiguration
        include JSON::Serializable

        # The starting position on the stream. NOW - Start reading just after the most recent record in the
        # stream, start at the request time stamp that the customer issued. TRIM_HORIZON - Start reading at
        # the last untrimmed record in the stream, which is the oldest record available in the stream. This
        # option is not available for an Amazon Kinesis Firehose delivery stream. LAST_STOPPED_POINT - Resume
        # reading from where the application last stopped reading.

        @[JSON::Field(key: "InputStartingPosition")]
        getter input_starting_position : String?

        def initialize(
          @input_starting_position : String? = nil
        )
        end
      end

      # Describes updates to a specific input configuration (identified by the InputId of an application).

      struct InputUpdate
        include JSON::Serializable

        # Input ID of the application input to be updated.

        @[JSON::Field(key: "InputId")]
        getter input_id : String

        # Describes the parallelism updates (the number in-application streams Amazon Kinesis Analytics
        # creates for the specific streaming source).

        @[JSON::Field(key: "InputParallelismUpdate")]
        getter input_parallelism_update : Types::InputParallelismUpdate?

        # Describes updates for an input processing configuration.

        @[JSON::Field(key: "InputProcessingConfigurationUpdate")]
        getter input_processing_configuration_update : Types::InputProcessingConfigurationUpdate?

        # Describes the data format on the streaming source, and how record elements on the streaming source
        # map to columns of the in-application stream that is created.

        @[JSON::Field(key: "InputSchemaUpdate")]
        getter input_schema_update : Types::InputSchemaUpdate?

        # If an Amazon Kinesis Firehose delivery stream is the streaming source to be updated, provides an
        # updated stream ARN and IAM role ARN.

        @[JSON::Field(key: "KinesisFirehoseInputUpdate")]
        getter kinesis_firehose_input_update : Types::KinesisFirehoseInputUpdate?

        # If an Amazon Kinesis stream is the streaming source to be updated, provides an updated stream Amazon
        # Resource Name (ARN) and IAM role ARN.

        @[JSON::Field(key: "KinesisStreamsInputUpdate")]
        getter kinesis_streams_input_update : Types::KinesisStreamsInputUpdate?

        # Name prefix for in-application streams that Amazon Kinesis Analytics creates for the specific
        # streaming source.

        @[JSON::Field(key: "NamePrefixUpdate")]
        getter name_prefix_update : String?

        def initialize(
          @input_id : String,
          @input_parallelism_update : Types::InputParallelismUpdate? = nil,
          @input_processing_configuration_update : Types::InputProcessingConfigurationUpdate? = nil,
          @input_schema_update : Types::InputSchemaUpdate? = nil,
          @kinesis_firehose_input_update : Types::KinesisFirehoseInputUpdate? = nil,
          @kinesis_streams_input_update : Types::KinesisStreamsInputUpdate? = nil,
          @name_prefix_update : String? = nil
        )
        end
      end

      # User-provided application configuration is not valid.

      struct InvalidApplicationConfigurationException
        include JSON::Serializable

        # test

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specified input parameter value is invalid.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides additional mapping information when JSON is the record format on the streaming source.

      struct JSONMappingParameters
        include JSON::Serializable

        # Path to the top-level parent that contains the records.

        @[JSON::Field(key: "RecordRowPath")]
        getter record_row_path : String

        def initialize(
          @record_row_path : String
        )
        end
      end

      # Identifies an Amazon Kinesis Firehose delivery stream as the streaming source. You provide the
      # delivery stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis
      # Analytics to access the stream on your behalf.

      struct KinesisFirehoseInput
        include JSON::Serializable

        # ARN of the input delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to make sure that the role has the necessary permissions to access the stream.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # Describes the Amazon Kinesis Firehose delivery stream that is configured as the streaming source in
      # the application input configuration.

      struct KinesisFirehoseInputDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics assumes to access the stream.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # When updating application input configuration, provides information about an Amazon Kinesis Firehose
      # delivery stream as the streaming source.

      struct KinesisFirehoseInputUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery stream to read.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # When configuring application output, identifies an Amazon Kinesis Firehose delivery stream as the
      # destination. You provide the stream Amazon Resource Name (ARN) and an IAM role that enables Amazon
      # Kinesis Analytics to write to the stream on your behalf.

      struct KinesisFirehoseOutput
        include JSON::Serializable

        # ARN of the destination Amazon Kinesis Firehose delivery stream to write to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on
        # your behalf. You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # For an application output, describes the Amazon Kinesis Firehose delivery stream configured as its
      # destination.

      struct KinesisFirehoseOutputDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # When updating an output configuration using the UpdateApplication operation, provides information
      # about an Amazon Kinesis Firehose delivery stream configured as the destination.

      struct KinesisFirehoseOutputUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream to write to.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # Identifies an Amazon Kinesis stream as the streaming source. You provide the stream's Amazon
      # Resource Name (ARN) and an IAM role ARN that enables Amazon Kinesis Analytics to access the stream
      # on your behalf.

      struct KinesisStreamsInput
        include JSON::Serializable

        # ARN of the input Amazon Kinesis stream to read.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # Describes the Amazon Kinesis stream that is configured as the streaming source in the application
      # input configuration.

      struct KinesisStreamsInputDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # When updating application input configuration, provides information about an Amazon Kinesis stream
      # as the streaming source.

      struct KinesisStreamsInputUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # When configuring application output, identifies an Amazon Kinesis stream as the destination. You
      # provide the stream Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis Analytics
      # can use to write to the stream on your behalf.

      struct KinesisStreamsOutput
        include JSON::Serializable

        # ARN of the destination Amazon Kinesis stream to write to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination stream on
        # your behalf. You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # For an application output, describes the Amazon Kinesis stream configured as its destination.

      struct KinesisStreamsOutputDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis stream.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # When updating an output configuration using the UpdateApplication operation, provides information
      # about an Amazon Kinesis stream configured as the destination.

      struct KinesisStreamsOutputUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to write the output.

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to access the stream on your behalf.
        # You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # When configuring application output, identifies an AWS Lambda function as the destination. You
      # provide the function Amazon Resource Name (ARN) and also an IAM role ARN that Amazon Kinesis
      # Analytics can use to write to the function on your behalf.

      struct LambdaOutput
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the destination Lambda function to write to. To specify an earlier
        # version of the Lambda function than the latest, include the Lambda function version in the Lambda
        # function ARN. For more information about Lambda ARNs, see Example ARNs: AWS Lambda

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on
        # your behalf. You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @resource_arn : String,
          @role_arn : String
        )
        end
      end

      # For an application output, describes the AWS Lambda function configured as its destination.

      struct LambdaOutputDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the destination Lambda function.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @resource_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # When updating an output configuration using the UpdateApplication operation, provides information
      # about an AWS Lambda function configured as the destination.

      struct LambdaOutputUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the destination Lambda function. To specify an earlier version of the
        # Lambda function than the latest, include the Lambda function version in the Lambda function ARN. For
        # more information about Lambda ARNs, see Example ARNs: AWS Lambda

        @[JSON::Field(key: "ResourceARNUpdate")]
        getter resource_arn_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the destination function on
        # your behalf. You need to grant the necessary permissions to this role.

        @[JSON::Field(key: "RoleARNUpdate")]
        getter role_arn_update : String?

        def initialize(
          @resource_arn_update : String? = nil,
          @role_arn_update : String? = nil
        )
        end
      end

      # Exceeded the number of applications allowed.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # Name of the application to start the list with. When using pagination to retrieve the list, you
        # don't need to specify this parameter in the first request. However, in subsequent requests, you add
        # the last application name from the previous response to get the next page of applications.

        @[JSON::Field(key: "ExclusiveStartApplicationName")]
        getter exclusive_start_application_name : String?

        # Maximum number of applications to list.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @exclusive_start_application_name : String? = nil,
          @limit : Int32? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # List of ApplicationSummary objects.

        @[JSON::Field(key: "ApplicationSummaries")]
        getter application_summaries : Array(Types::ApplicationSummary)

        # Returns true if there are more applications to retrieve.

        @[JSON::Field(key: "HasMoreApplications")]
        getter has_more_applications : Bool

        def initialize(
          @application_summaries : Array(Types::ApplicationSummary),
          @has_more_applications : Bool
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the application for which to retrieve tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The key-value tags assigned to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # When configuring application input at the time of creating or updating an application, provides
      # additional mapping information specific to the record format (such as JSON, CSV, or record fields
      # delimited by some delimiter) on the streaming source.

      struct MappingParameters
        include JSON::Serializable

        # Provides additional mapping information when the record format uses delimiters (for example, CSV).

        @[JSON::Field(key: "CSVMappingParameters")]
        getter csv_mapping_parameters : Types::CSVMappingParameters?

        # Provides additional mapping information when JSON is the record format on the streaming source.

        @[JSON::Field(key: "JSONMappingParameters")]
        getter json_mapping_parameters : Types::JSONMappingParameters?

        def initialize(
          @csv_mapping_parameters : Types::CSVMappingParameters? = nil,
          @json_mapping_parameters : Types::JSONMappingParameters? = nil
        )
        end
      end

      # Describes application output configuration in which you identify an in-application stream and a
      # destination where you want the in-application stream data to be written. The destination can be an
      # Amazon Kinesis stream or an Amazon Kinesis Firehose delivery stream. For limits on how many
      # destinations an application can write and other limitations, see Limits .

      struct Output
        include JSON::Serializable

        # Describes the data format when records are written to the destination. For more information, see
        # Configuring Application Output .

        @[JSON::Field(key: "DestinationSchema")]
        getter destination_schema : Types::DestinationSchema

        # Name of the in-application stream.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Identifies an Amazon Kinesis Firehose delivery stream as the destination.

        @[JSON::Field(key: "KinesisFirehoseOutput")]
        getter kinesis_firehose_output : Types::KinesisFirehoseOutput?

        # Identifies an Amazon Kinesis stream as the destination.

        @[JSON::Field(key: "KinesisStreamsOutput")]
        getter kinesis_streams_output : Types::KinesisStreamsOutput?

        # Identifies an AWS Lambda function as the destination.

        @[JSON::Field(key: "LambdaOutput")]
        getter lambda_output : Types::LambdaOutput?

        def initialize(
          @destination_schema : Types::DestinationSchema,
          @name : String,
          @kinesis_firehose_output : Types::KinesisFirehoseOutput? = nil,
          @kinesis_streams_output : Types::KinesisStreamsOutput? = nil,
          @lambda_output : Types::LambdaOutput? = nil
        )
        end
      end

      # Describes the application output configuration, which includes the in-application stream name and
      # the destination where the stream data is written. The destination can be an Amazon Kinesis stream or
      # an Amazon Kinesis Firehose delivery stream.

      struct OutputDescription
        include JSON::Serializable

        # Data format used for writing data to the destination.

        @[JSON::Field(key: "DestinationSchema")]
        getter destination_schema : Types::DestinationSchema?

        # Describes the Amazon Kinesis Firehose delivery stream configured as the destination where output is
        # written.

        @[JSON::Field(key: "KinesisFirehoseOutputDescription")]
        getter kinesis_firehose_output_description : Types::KinesisFirehoseOutputDescription?

        # Describes Amazon Kinesis stream configured as the destination where output is written.

        @[JSON::Field(key: "KinesisStreamsOutputDescription")]
        getter kinesis_streams_output_description : Types::KinesisStreamsOutputDescription?

        # Describes the AWS Lambda function configured as the destination where output is written.

        @[JSON::Field(key: "LambdaOutputDescription")]
        getter lambda_output_description : Types::LambdaOutputDescription?

        # Name of the in-application stream configured as output.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A unique identifier for the output configuration.

        @[JSON::Field(key: "OutputId")]
        getter output_id : String?

        def initialize(
          @destination_schema : Types::DestinationSchema? = nil,
          @kinesis_firehose_output_description : Types::KinesisFirehoseOutputDescription? = nil,
          @kinesis_streams_output_description : Types::KinesisStreamsOutputDescription? = nil,
          @lambda_output_description : Types::LambdaOutputDescription? = nil,
          @name : String? = nil,
          @output_id : String? = nil
        )
        end
      end

      # Describes updates to the output configuration identified by the OutputId .

      struct OutputUpdate
        include JSON::Serializable

        # Identifies the specific output configuration that you want to update.

        @[JSON::Field(key: "OutputId")]
        getter output_id : String

        # Describes the data format when records are written to the destination. For more information, see
        # Configuring Application Output .

        @[JSON::Field(key: "DestinationSchemaUpdate")]
        getter destination_schema_update : Types::DestinationSchema?

        # Describes an Amazon Kinesis Firehose delivery stream as the destination for the output.

        @[JSON::Field(key: "KinesisFirehoseOutputUpdate")]
        getter kinesis_firehose_output_update : Types::KinesisFirehoseOutputUpdate?

        # Describes an Amazon Kinesis stream as the destination for the output.

        @[JSON::Field(key: "KinesisStreamsOutputUpdate")]
        getter kinesis_streams_output_update : Types::KinesisStreamsOutputUpdate?

        # Describes an AWS Lambda function as the destination for the output.

        @[JSON::Field(key: "LambdaOutputUpdate")]
        getter lambda_output_update : Types::LambdaOutputUpdate?

        # If you want to specify a different in-application stream for this output configuration, use this
        # field to specify the new in-application stream name.

        @[JSON::Field(key: "NameUpdate")]
        getter name_update : String?

        def initialize(
          @output_id : String,
          @destination_schema_update : Types::DestinationSchema? = nil,
          @kinesis_firehose_output_update : Types::KinesisFirehoseOutputUpdate? = nil,
          @kinesis_streams_output_update : Types::KinesisStreamsOutputUpdate? = nil,
          @lambda_output_update : Types::LambdaOutputUpdate? = nil,
          @name_update : String? = nil
        )
        end
      end

      # Describes the mapping of each data element in the streaming source to the corresponding column in
      # the in-application stream. Also used to describe the format of the reference data source.

      struct RecordColumn
        include JSON::Serializable

        # Name of the column created in the in-application input stream or reference table.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Type of column created in the in-application input stream or reference table.

        @[JSON::Field(key: "SqlType")]
        getter sql_type : String

        # Reference to the data element in the streaming input or the reference data source. This element is
        # required if the RecordFormatType is JSON .

        @[JSON::Field(key: "Mapping")]
        getter mapping : String?

        def initialize(
          @name : String,
          @sql_type : String,
          @mapping : String? = nil
        )
        end
      end

      # Describes the record format and relevant mapping information that should be applied to schematize
      # the records on the stream.

      struct RecordFormat
        include JSON::Serializable

        # The type of record format.

        @[JSON::Field(key: "RecordFormatType")]
        getter record_format_type : String

        # When configuring application input at the time of creating or updating an application, provides
        # additional mapping information specific to the record format (such as JSON, CSV, or record fields
        # delimited by some delimiter) on the streaming source.

        @[JSON::Field(key: "MappingParameters")]
        getter mapping_parameters : Types::MappingParameters?

        def initialize(
          @record_format_type : String,
          @mapping_parameters : Types::MappingParameters? = nil
        )
        end
      end

      # Describes the reference data source by providing the source information (S3 bucket name and object
      # key name), the resulting in-application table name that is created, and the necessary schema to map
      # the data elements in the Amazon S3 object to the in-application table.

      struct ReferenceDataSource
        include JSON::Serializable

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchema")]
        getter reference_schema : Types::SourceSchema

        # Name of the in-application table to create.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role
        # Amazon Kinesis Analytics can assume to read this object on your behalf. An Amazon Kinesis Analytics
        # application loads reference data only once. If the data changes, you call the UpdateApplication
        # operation to trigger reloading of data into your application.

        @[JSON::Field(key: "S3ReferenceDataSource")]
        getter s3_reference_data_source : Types::S3ReferenceDataSource?

        def initialize(
          @reference_schema : Types::SourceSchema,
          @table_name : String,
          @s3_reference_data_source : Types::S3ReferenceDataSource? = nil
        )
        end
      end

      # Describes the reference data source configured for an application.

      struct ReferenceDataSourceDescription
        include JSON::Serializable

        # ID of the reference data source. This is the ID that Amazon Kinesis Analytics assigns when you add
        # the reference data source to your application using the AddApplicationReferenceDataSource operation.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        # Provides the S3 bucket name, the object key name that contains the reference data. It also provides
        # the Amazon Resource Name (ARN) of the IAM role that Amazon Kinesis Analytics can assume to read the
        # Amazon S3 object and populate the in-application reference table.

        @[JSON::Field(key: "S3ReferenceDataSourceDescription")]
        getter s3_reference_data_source_description : Types::S3ReferenceDataSourceDescription

        # The in-application table name created by the specific reference data source configuration.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchema")]
        getter reference_schema : Types::SourceSchema?

        def initialize(
          @reference_id : String,
          @s3_reference_data_source_description : Types::S3ReferenceDataSourceDescription,
          @table_name : String,
          @reference_schema : Types::SourceSchema? = nil
        )
        end
      end

      # When you update a reference data source configuration for an application, this object provides all
      # the updated values (such as the source bucket name and object key name), the in-application table
      # name that is created, and updated mapping information that maps the data in the Amazon S3 object to
      # the in-application reference table that is created.

      struct ReferenceDataSourceUpdate
        include JSON::Serializable

        # ID of the reference data source being updated. You can use the DescribeApplication operation to get
        # this value.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String

        # Describes the format of the data in the streaming source, and how each data element maps to
        # corresponding columns created in the in-application stream.

        @[JSON::Field(key: "ReferenceSchemaUpdate")]
        getter reference_schema_update : Types::SourceSchema?

        # Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume
        # to read the Amazon S3 object on your behalf and populate the in-application reference table.

        @[JSON::Field(key: "S3ReferenceDataSourceUpdate")]
        getter s3_reference_data_source_update : Types::S3ReferenceDataSourceUpdate?

        # In-application table name that is created by this update.

        @[JSON::Field(key: "TableNameUpdate")]
        getter table_name_update : String?

        def initialize(
          @reference_id : String,
          @reference_schema_update : Types::SourceSchema? = nil,
          @s3_reference_data_source_update : Types::S3ReferenceDataSourceUpdate? = nil,
          @table_name_update : String? = nil
        )
        end
      end

      # Application is not available for this operation.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specified application can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Discovery failed to get a record from the streaming source because of the Amazon Kinesis Streams
      # ProvisionedThroughputExceededException. For more information, see GetRecords in the Amazon Kinesis
      # Streams API Reference.

      struct ResourceProvisionedThroughputExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides a description of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the
      # S3 bucket, the ARN of the IAM role that is used to access the bucket, and the name of the Amazon S3
      # object that contains the data.

      struct S3Configuration
        include JSON::Serializable

        # ARN of the S3 bucket that contains the data.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The name of the object that contains the data.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # IAM ARN of the role used to access the data.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @role_arn : String
        )
        end
      end

      # Identifies the S3 bucket and object that contains the reference data. Also identifies the IAM role
      # Amazon Kinesis Analytics can assume to read this object on your behalf. An Amazon Kinesis Analytics
      # application loads reference data only once. If the data changes, you call the UpdateApplication
      # operation to trigger reloading of data into your application.

      struct S3ReferenceDataSource
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # Object key name containing reference data.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # ARN of the IAM role that the service can assume to read data on your behalf. This role must have
        # permission for the s3:GetObject action on the object and trust policy that allows Amazon Kinesis
        # Analytics service principal to assume this role.

        @[JSON::Field(key: "ReferenceRoleARN")]
        getter reference_role_arn : String

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @reference_role_arn : String
        )
        end
      end

      # Provides the bucket name and object key name that stores the reference data.

      struct S3ReferenceDataSourceDescription
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # Amazon S3 object key name.

        @[JSON::Field(key: "FileKey")]
        getter file_key : String

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object on your
        # behalf to populate the in-application reference table.

        @[JSON::Field(key: "ReferenceRoleARN")]
        getter reference_role_arn : String

        def initialize(
          @bucket_arn : String,
          @file_key : String,
          @reference_role_arn : String
        )
        end
      end

      # Describes the S3 bucket name, object key name, and IAM role that Amazon Kinesis Analytics can assume
      # to read the Amazon S3 object on your behalf and populate the in-application reference table.

      struct S3ReferenceDataSourceUpdate
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the S3 bucket.

        @[JSON::Field(key: "BucketARNUpdate")]
        getter bucket_arn_update : String?

        # Object key name.

        @[JSON::Field(key: "FileKeyUpdate")]
        getter file_key_update : String?

        # ARN of the IAM role that Amazon Kinesis Analytics can assume to read the Amazon S3 object and
        # populate the in-application.

        @[JSON::Field(key: "ReferenceRoleARNUpdate")]
        getter reference_role_arn_update : String?

        def initialize(
          @bucket_arn_update : String? = nil,
          @file_key_update : String? = nil,
          @reference_role_arn_update : String? = nil
        )
        end
      end

      # The service is unavailable. Back off and retry the operation.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the format of the data in the streaming source, and how each data element maps to
      # corresponding columns created in the in-application stream.

      struct SourceSchema
        include JSON::Serializable

        # A list of RecordColumn objects.

        @[JSON::Field(key: "RecordColumns")]
        getter record_columns : Array(Types::RecordColumn)

        # Specifies the format of the records on the streaming source.

        @[JSON::Field(key: "RecordFormat")]
        getter record_format : Types::RecordFormat

        # Specifies the encoding of the records in the streaming source. For example, UTF-8.

        @[JSON::Field(key: "RecordEncoding")]
        getter record_encoding : String?

        def initialize(
          @record_columns : Array(Types::RecordColumn),
          @record_format : Types::RecordFormat,
          @record_encoding : String? = nil
        )
        end
      end


      struct StartApplicationRequest
        include JSON::Serializable

        # Name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Identifies the specific input, by ID, that the application starts consuming. Amazon Kinesis
        # Analytics starts reading the streaming source associated with the input. You can also specify where
        # in the streaming source you want Amazon Kinesis Analytics to start reading.

        @[JSON::Field(key: "InputConfigurations")]
        getter input_configurations : Array(Types::InputConfiguration)

        def initialize(
          @application_name : String,
          @input_configurations : Array(Types::InputConfiguration)
        )
        end
      end


      struct StartApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopApplicationRequest
        include JSON::Serializable

        # Name of the running application to stop.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        def initialize(
          @application_name : String
        )
        end
      end


      struct StopApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A key-value pair (the value is optional) that you can define and assign to AWS resources. If you
      # specify a tag that already exists, the tag value is replaced with the value that you specify in the
      # request. Note that the maximum number of application tags includes system tags. The maximum number
      # of user-defined application tags is 50. For more information, see Using Tagging .

      struct Tag
        include JSON::Serializable

        # The key of the key-value tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key-value tag. The value is optional.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the application to assign the tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key-value tags to assign to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Application created with too many tags, or too many tags added to an application. Note that the
      # maximum number of application tags includes system tags. The maximum number of user-defined
      # application tags is 50.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Data format is not valid. Amazon Kinesis Analytics is not able to detect schema for the given
      # streaming source.

      struct UnableToDetectSchemaException
        include JSON::Serializable


        @[JSON::Field(key: "ProcessedInputRecords")]
        getter processed_input_records : Array(String)?


        @[JSON::Field(key: "RawInputRecords")]
        getter raw_input_records : Array(String)?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @processed_input_records : Array(String)? = nil,
          @raw_input_records : Array(String)? = nil,
          @message : String? = nil
        )
        end
      end

      # The request was rejected because a specified parameter is not supported or a specified resource is
      # not valid for this operation.

      struct UnsupportedOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the Kinesis Analytics application from which to remove the tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of keys of tags to remove from the specified application.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # Name of the Amazon Kinesis Analytics application to update.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Describes application updates.

        @[JSON::Field(key: "ApplicationUpdate")]
        getter application_update : Types::ApplicationUpdate

        # The current application version ID. You can use the DescribeApplication operation to get this value.

        @[JSON::Field(key: "CurrentApplicationVersionId")]
        getter current_application_version_id : Int64

        def initialize(
          @application_name : String,
          @application_update : Types::ApplicationUpdate,
          @current_application_version_id : Int64
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
