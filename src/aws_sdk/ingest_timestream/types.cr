require "json"
require "time"

module AwsSdk
  module TimestreamWrite
    module Types

      # You are not authorized to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Details about the progress of a batch load task.
      struct BatchLoadProgressReport
        include JSON::Serializable

        @[JSON::Field(key: "BytesMetered")]
        getter bytes_metered : Int64?

        @[JSON::Field(key: "FileFailures")]
        getter file_failures : Int64?

        @[JSON::Field(key: "ParseFailures")]
        getter parse_failures : Int64?

        @[JSON::Field(key: "RecordIngestionFailures")]
        getter record_ingestion_failures : Int64?

        @[JSON::Field(key: "RecordsIngested")]
        getter records_ingested : Int64?

        @[JSON::Field(key: "RecordsProcessed")]
        getter records_processed : Int64?

        def initialize(
          @bytes_metered : Int64? = nil,
          @file_failures : Int64? = nil,
          @parse_failures : Int64? = nil,
          @record_ingestion_failures : Int64? = nil,
          @records_ingested : Int64? = nil,
          @records_processed : Int64? = nil
        )
        end
      end

      # Details about a batch load task.
      struct BatchLoadTask
        include JSON::Serializable

        # The time when the Timestream batch load task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Database name for the database into which a batch load task loads data.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The time when the Timestream batch load task was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        @[JSON::Field(key: "ResumableUntil", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resumable_until : Time?

        # Table name for the table into which a batch load task loads data.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The ID of the batch load task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Status of the batch load task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @database_name : String? = nil,
          @last_updated_time : Time? = nil,
          @resumable_until : Time? = nil,
          @table_name : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      # Details about a batch load task.
      struct BatchLoadTaskDescription
        include JSON::Serializable

        # The time when the Timestream batch load task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Data model configuration for a batch load task. This contains details about where a data model for a
        # batch load task is stored.
        @[JSON::Field(key: "DataModelConfiguration")]
        getter data_model_configuration : Types::DataModelConfiguration?

        # Configuration details about the data source for a batch load task.
        @[JSON::Field(key: "DataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration?

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The time when the Timestream batch load task was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        @[JSON::Field(key: "ProgressReport")]
        getter progress_report : Types::BatchLoadProgressReport?

        @[JSON::Field(key: "RecordVersion")]
        getter record_version : Int64?

        # Report configuration for a batch load task. This contains details about where error reports are
        # stored.
        @[JSON::Field(key: "ReportConfiguration")]
        getter report_configuration : Types::ReportConfiguration?

        @[JSON::Field(key: "ResumableUntil", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resumable_until : Time?

        @[JSON::Field(key: "TargetDatabaseName")]
        getter target_database_name : String?

        @[JSON::Field(key: "TargetTableName")]
        getter target_table_name : String?

        # The ID of the batch load task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # Status of the batch load task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_model_configuration : Types::DataModelConfiguration? = nil,
          @data_source_configuration : Types::DataSourceConfiguration? = nil,
          @error_message : String? = nil,
          @last_updated_time : Time? = nil,
          @progress_report : Types::BatchLoadProgressReport? = nil,
          @record_version : Int64? = nil,
          @report_configuration : Types::ReportConfiguration? = nil,
          @resumable_until : Time? = nil,
          @target_database_name : String? = nil,
          @target_table_name : String? = nil,
          @task_id : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      # Timestream was unable to process this request because it contains resource that already exists.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateBatchLoadTaskRequest
        include JSON::Serializable

        # Defines configuration details about the data source for a batch load task.
        @[JSON::Field(key: "DataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration

        @[JSON::Field(key: "ReportConfiguration")]
        getter report_configuration : Types::ReportConfiguration

        # Target Timestream database for a batch load task.
        @[JSON::Field(key: "TargetDatabaseName")]
        getter target_database_name : String

        # Target Timestream table for a batch load task.
        @[JSON::Field(key: "TargetTableName")]
        getter target_table_name : String

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        @[JSON::Field(key: "DataModelConfiguration")]
        getter data_model_configuration : Types::DataModelConfiguration?

        @[JSON::Field(key: "RecordVersion")]
        getter record_version : Int64?

        def initialize(
          @data_source_configuration : Types::DataSourceConfiguration,
          @report_configuration : Types::ReportConfiguration,
          @target_database_name : String,
          @target_table_name : String,
          @client_token : String? = nil,
          @data_model_configuration : Types::DataModelConfiguration? = nil,
          @record_version : Int64? = nil
        )
        end
      end

      struct CreateBatchLoadTaskResponse
        include JSON::Serializable

        # The ID of the batch load task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct CreateDatabaseRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The KMS key for the database. If the KMS key is not specified, the database will be encrypted with a
        # Timestream managed KMS key located in your account. For more information, see Amazon Web Services
        # managed keys .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of key-value pairs to label the table.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @database_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatabaseResponse
        include JSON::Serializable

        # The newly created Timestream database.
        @[JSON::Field(key: "Database")]
        getter database : Types::Database?

        def initialize(
          @database : Types::Database? = nil
        )
        end
      end

      struct CreateTableRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the Timestream table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Contains properties to set on the table when enabling magnetic store writes.
        @[JSON::Field(key: "MagneticStoreWriteProperties")]
        getter magnetic_store_write_properties : Types::MagneticStoreWriteProperties?

        # The duration for which your time-series data must be stored in the memory store and the magnetic
        # store.
        @[JSON::Field(key: "RetentionProperties")]
        getter retention_properties : Types::RetentionProperties?

        # The schema of the table.
        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        # A list of key-value pairs to label the table.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @database_name : String,
          @table_name : String,
          @magnetic_store_write_properties : Types::MagneticStoreWriteProperties? = nil,
          @retention_properties : Types::RetentionProperties? = nil,
          @schema : Types::Schema? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTableResponse
        include JSON::Serializable

        # The newly created Timestream table.
        @[JSON::Field(key: "Table")]
        getter table : Types::Table?

        def initialize(
          @table : Types::Table? = nil
        )
        end
      end

      # A delimited data format where the column separator can be a comma and the record separator is a
      # newline character.
      struct CsvConfiguration
        include JSON::Serializable

        # Column separator can be one of comma (','), pipe ('|), semicolon (';'), tab('/t'), or blank space ('
        # ').
        @[JSON::Field(key: "ColumnSeparator")]
        getter column_separator : String?

        # Escape character can be one of
        @[JSON::Field(key: "EscapeChar")]
        getter escape_char : String?

        # Can be blank space (' ').
        @[JSON::Field(key: "NullValue")]
        getter null_value : String?

        # Can be single quote (') or double quote (").
        @[JSON::Field(key: "QuoteChar")]
        getter quote_char : String?

        # Specifies to trim leading and trailing white space.
        @[JSON::Field(key: "TrimWhiteSpace")]
        getter trim_white_space : Bool?

        def initialize(
          @column_separator : String? = nil,
          @escape_char : String? = nil,
          @null_value : String? = nil,
          @quote_char : String? = nil,
          @trim_white_space : Bool? = nil
        )
        end
      end

      # Data model for a batch load task.
      struct DataModel
        include JSON::Serializable

        # Source to target mappings for dimensions.
        @[JSON::Field(key: "DimensionMappings")]
        getter dimension_mappings : Array(Types::DimensionMapping)

        @[JSON::Field(key: "MeasureNameColumn")]
        getter measure_name_column : String?

        # Source to target mappings for measures.
        @[JSON::Field(key: "MixedMeasureMappings")]
        getter mixed_measure_mappings : Array(Types::MixedMeasureMapping)?

        # Source to target mappings for multi-measure records.
        @[JSON::Field(key: "MultiMeasureMappings")]
        getter multi_measure_mappings : Types::MultiMeasureMappings?

        # Source column to be mapped to time.
        @[JSON::Field(key: "TimeColumn")]
        getter time_column : String?

        # The granularity of the timestamp unit. It indicates if the time value is in seconds, milliseconds,
        # nanoseconds, or other supported values. Default is MILLISECONDS .
        @[JSON::Field(key: "TimeUnit")]
        getter time_unit : String?

        def initialize(
          @dimension_mappings : Array(Types::DimensionMapping),
          @measure_name_column : String? = nil,
          @mixed_measure_mappings : Array(Types::MixedMeasureMapping)? = nil,
          @multi_measure_mappings : Types::MultiMeasureMappings? = nil,
          @time_column : String? = nil,
          @time_unit : String? = nil
        )
        end
      end

      struct DataModelConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "DataModel")]
        getter data_model : Types::DataModel?

        @[JSON::Field(key: "DataModelS3Configuration")]
        getter data_model_s3_configuration : Types::DataModelS3Configuration?

        def initialize(
          @data_model : Types::DataModel? = nil,
          @data_model_s3_configuration : Types::DataModelS3Configuration? = nil
        )
        end
      end

      struct DataModelS3Configuration
        include JSON::Serializable

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String?

        def initialize(
          @bucket_name : String? = nil,
          @object_key : String? = nil
        )
        end
      end

      # Defines configuration details about the data source.
      struct DataSourceConfiguration
        include JSON::Serializable

        # This is currently CSV.
        @[JSON::Field(key: "DataFormat")]
        getter data_format : String

        # Configuration of an S3 location for a file which contains data to load.
        @[JSON::Field(key: "DataSourceS3Configuration")]
        getter data_source_s3_configuration : Types::DataSourceS3Configuration

        @[JSON::Field(key: "CsvConfiguration")]
        getter csv_configuration : Types::CsvConfiguration?

        def initialize(
          @data_format : String,
          @data_source_s3_configuration : Types::DataSourceS3Configuration,
          @csv_configuration : Types::CsvConfiguration? = nil
        )
        end
      end

      struct DataSourceS3Configuration
        include JSON::Serializable

        # The bucket name of the customer S3 bucket.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        def initialize(
          @bucket_name : String,
          @object_key_prefix : String? = nil
        )
        end
      end

      # A top-level container for a table. Databases and tables are the fundamental management concepts in
      # Amazon Timestream. All tables in a database are encrypted with the same KMS key.
      struct Database
        include JSON::Serializable

        # The Amazon Resource Name that uniquely identifies this database.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the database was created, calculated from the Unix epoch time.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The identifier of the KMS key used to encrypt the data stored in the database.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The last time that this database was updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The total number of tables found within a Timestream database.
        @[JSON::Field(key: "TableCount")]
        getter table_count : Int64?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @database_name : String? = nil,
          @kms_key_id : String? = nil,
          @last_updated_time : Time? = nil,
          @table_count : Int64? = nil
        )
        end
      end

      struct DeleteDatabaseRequest
        include JSON::Serializable

        # The name of the Timestream database to be deleted.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        def initialize(
          @database_name : String
        )
        end
      end

      struct DeleteTableRequest
        include JSON::Serializable

        # The name of the database where the Timestream database is to be deleted.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the Timestream table to be deleted.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @database_name : String,
          @table_name : String
        )
        end
      end

      struct DescribeBatchLoadTaskRequest
        include JSON::Serializable

        # The ID of the batch load task.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct DescribeBatchLoadTaskResponse
        include JSON::Serializable

        # Description of the batch load task.
        @[JSON::Field(key: "BatchLoadTaskDescription")]
        getter batch_load_task_description : Types::BatchLoadTaskDescription

        def initialize(
          @batch_load_task_description : Types::BatchLoadTaskDescription
        )
        end
      end

      struct DescribeDatabaseRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        def initialize(
          @database_name : String
        )
        end
      end

      struct DescribeDatabaseResponse
        include JSON::Serializable

        # The name of the Timestream table.
        @[JSON::Field(key: "Database")]
        getter database : Types::Database?

        def initialize(
          @database : Types::Database? = nil
        )
        end
      end

      struct DescribeEndpointsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeEndpointsResponse
        include JSON::Serializable

        # An Endpoints object is returned when a DescribeEndpoints request is made.
        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)

        def initialize(
          @endpoints : Array(Types::Endpoint)
        )
        end
      end

      struct DescribeTableRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the Timestream table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @database_name : String,
          @table_name : String
        )
        end
      end

      struct DescribeTableResponse
        include JSON::Serializable

        # The Timestream table.
        @[JSON::Field(key: "Table")]
        getter table : Types::Table?

        def initialize(
          @table : Types::Table? = nil
        )
        end
      end

      # Represents the metadata attributes of the time series. For example, the name and Availability Zone
      # of an EC2 instance or the name of the manufacturer of a wind turbine are dimensions.
      struct Dimension
        include JSON::Serializable

        # Dimension represents the metadata attributes of the time series. For example, the name and
        # Availability Zone of an EC2 instance or the name of the manufacturer of a wind turbine are
        # dimensions. For constraints on dimension names, see Naming Constraints .
        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension.
        @[JSON::Field(key: "Value")]
        getter value : String

        # The data type of the dimension for the time-series data point.
        @[JSON::Field(key: "DimensionValueType")]
        getter dimension_value_type : String?

        def initialize(
          @name : String,
          @value : String,
          @dimension_value_type : String? = nil
        )
        end
      end

      struct DimensionMapping
        include JSON::Serializable

        @[JSON::Field(key: "DestinationColumn")]
        getter destination_column : String?

        @[JSON::Field(key: "SourceColumn")]
        getter source_column : String?

        def initialize(
          @destination_column : String? = nil,
          @source_column : String? = nil
        )
        end
      end

      # Represents an available endpoint against which to make API calls against, as well as the TTL for
      # that endpoint.
      struct Endpoint
        include JSON::Serializable

        # An endpoint address.
        @[JSON::Field(key: "Address")]
        getter address : String

        # The TTL for the endpoint, in minutes.
        @[JSON::Field(key: "CachePeriodInMinutes")]
        getter cache_period_in_minutes : Int64

        def initialize(
          @address : String,
          @cache_period_in_minutes : Int64
        )
        end
      end

      # Timestream was unable to fully process this request because of an internal server error.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The requested endpoint was not valid.
      struct InvalidEndpointException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListBatchLoadTasksRequest
        include JSON::Serializable

        # The total number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as argument of a subsequent API invocation.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Status of the batch load task.
        @[JSON::Field(key: "TaskStatus")]
        getter task_status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListBatchLoadTasksResponse
        include JSON::Serializable

        # A list of batch load task details.
        @[JSON::Field(key: "BatchLoadTasks")]
        getter batch_load_tasks : Array(Types::BatchLoadTask)?

        # A token to specify where to start paginating. Provide the next ListBatchLoadTasksRequest.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @batch_load_tasks : Array(Types::BatchLoadTask)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatabasesRequest
        include JSON::Serializable

        # The total number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as argument of a subsequent API invocation.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as argument of a subsequent
        # API invocation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatabasesResponse
        include JSON::Serializable

        # A list of database names.
        @[JSON::Field(key: "Databases")]
        getter databases : Array(Types::Database)?

        # The pagination token. This parameter is returned when the response is truncated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @databases : Array(Types::Database)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTablesRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The total number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as argument of a subsequent API invocation.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as argument of a subsequent
        # API invocation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @database_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTablesResponse
        include JSON::Serializable

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tables.
        @[JSON::Field(key: "Tables")]
        getter tables : Array(Types::Table)?

        def initialize(
          @next_token : String? = nil,
          @tables : Array(Types::Table)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Timestream resource with tags to be listed. This value is an Amazon Resource Name (ARN).
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags currently associated with the Timestream resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The location to write error reports for records rejected, asynchronously, during magnetic store
      # writes.
      struct MagneticStoreRejectedDataLocation
        include JSON::Serializable

        # Configuration of an S3 location to write error reports for records rejected, asynchronously, during
        # magnetic store writes.
        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3Configuration?

        def initialize(
          @s3_configuration : Types::S3Configuration? = nil
        )
        end
      end

      # The set of properties on a table for configuring magnetic store writes.
      struct MagneticStoreWriteProperties
        include JSON::Serializable

        # A flag to enable magnetic store writes.
        @[JSON::Field(key: "EnableMagneticStoreWrites")]
        getter enable_magnetic_store_writes : Bool

        # The location to write error reports for records rejected asynchronously during magnetic store
        # writes.
        @[JSON::Field(key: "MagneticStoreRejectedDataLocation")]
        getter magnetic_store_rejected_data_location : Types::MagneticStoreRejectedDataLocation?

        def initialize(
          @enable_magnetic_store_writes : Bool,
          @magnetic_store_rejected_data_location : Types::MagneticStoreRejectedDataLocation? = nil
        )
        end
      end

      # Represents the data attribute of the time series. For example, the CPU utilization of an EC2
      # instance or the RPM of a wind turbine are measures. MeasureValue has both name and value.
      # MeasureValue is only allowed for type MULTI . Using MULTI type, you can pass multiple data
      # attributes associated with the same time series in a single record
      struct MeasureValue
        include JSON::Serializable

        # The name of the MeasureValue. For constraints on MeasureValue names, see Naming Constraints in the
        # Amazon Timestream Developer Guide.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Contains the data type of the MeasureValue for the time-series data point.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The value for the MeasureValue. For information, see Data types .
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @type : String,
          @value : String
        )
        end
      end

      struct MixedMeasureMapping
        include JSON::Serializable

        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String

        @[JSON::Field(key: "MeasureName")]
        getter measure_name : String?

        @[JSON::Field(key: "MultiMeasureAttributeMappings")]
        getter multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)?

        @[JSON::Field(key: "SourceColumn")]
        getter source_column : String?

        @[JSON::Field(key: "TargetMeasureName")]
        getter target_measure_name : String?

        def initialize(
          @measure_value_type : String,
          @measure_name : String? = nil,
          @multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)? = nil,
          @source_column : String? = nil,
          @target_measure_name : String? = nil
        )
        end
      end

      struct MultiMeasureAttributeMapping
        include JSON::Serializable

        @[JSON::Field(key: "SourceColumn")]
        getter source_column : String

        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String?

        @[JSON::Field(key: "TargetMultiMeasureAttributeName")]
        getter target_multi_measure_attribute_name : String?

        def initialize(
          @source_column : String,
          @measure_value_type : String? = nil,
          @target_multi_measure_attribute_name : String? = nil
        )
        end
      end

      struct MultiMeasureMappings
        include JSON::Serializable

        @[JSON::Field(key: "MultiMeasureAttributeMappings")]
        getter multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)

        @[JSON::Field(key: "TargetMultiMeasureName")]
        getter target_multi_measure_name : String?

        def initialize(
          @multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping),
          @target_multi_measure_name : String? = nil
        )
        end
      end

      # An attribute used in partitioning data in a table. A dimension key partitions data using the values
      # of the dimension specified by the dimension-name as partition key, while a measure key partitions
      # data using measure names (values of the 'measure_name' column).
      struct PartitionKey
        include JSON::Serializable

        # The type of the partition key. Options are DIMENSION (dimension key) and MEASURE (measure key).
        @[JSON::Field(key: "Type")]
        getter type : String

        # The level of enforcement for the specification of a dimension key in ingested records. Options are
        # REQUIRED (dimension key must be specified) and OPTIONAL (dimension key does not have to be
        # specified).
        @[JSON::Field(key: "EnforcementInRecord")]
        getter enforcement_in_record : String?

        # The name of the attribute used for a dimension key.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @type : String,
          @enforcement_in_record : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents a time-series data point being written into Timestream. Each record contains an array of
      # dimensions. Dimensions represent the metadata attributes of a time-series data point, such as the
      # instance name or Availability Zone of an EC2 instance. A record also contains the measure name,
      # which is the name of the measure being collected (for example, the CPU utilization of an EC2
      # instance). Additionally, a record contains the measure value and the value type, which is the data
      # type of the measure value. Also, the record contains the timestamp of when the measure was collected
      # and the timestamp unit, which represents the granularity of the timestamp. Records have a Version
      # field, which is a 64-bit long that you can use for updating data points. Writes of a duplicate
      # record with the same dimension, timestamp, and measure name but different measure value will only
      # succeed if the Version attribute of the record in the write request is higher than that of the
      # existing record. Timestream defaults to a Version of 1 for records without the Version field.
      struct Record
        include JSON::Serializable

        # Contains the list of dimensions for time-series data points.
        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # Measure represents the data attribute of the time series. For example, the CPU utilization of an EC2
        # instance or the RPM of a wind turbine are measures.
        @[JSON::Field(key: "MeasureName")]
        getter measure_name : String?

        # Contains the measure value for the time-series data point.
        @[JSON::Field(key: "MeasureValue")]
        getter measure_value : String?

        # Contains the data type of the measure value for the time-series data point. Default type is DOUBLE .
        # For more information, see Data types .
        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String?

        # Contains the list of MeasureValue for time-series data points. This is only allowed for type MULTI .
        # For scalar values, use MeasureValue attribute of the record directly.
        @[JSON::Field(key: "MeasureValues")]
        getter measure_values : Array(Types::MeasureValue)?

        # Contains the time at which the measure value for the data point was collected. The time value plus
        # the unit provides the time elapsed since the epoch. For example, if the time value is 12345 and the
        # unit is ms , then 12345 ms have elapsed since the epoch.
        @[JSON::Field(key: "Time")]
        getter time : String?

        # The granularity of the timestamp unit. It indicates if the time value is in seconds, milliseconds,
        # nanoseconds, or other supported values. Default is MILLISECONDS .
        @[JSON::Field(key: "TimeUnit")]
        getter time_unit : String?

        # 64-bit attribute used for record updates. Write requests for duplicate data with a higher version
        # number will update the existing measure value and version. In cases where the measure value is the
        # same, Version will still be updated. Default value is 1 . Version must be 1 or greater, or you will
        # receive a ValidationException error.
        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @dimensions : Array(Types::Dimension)? = nil,
          @measure_name : String? = nil,
          @measure_value : String? = nil,
          @measure_value_type : String? = nil,
          @measure_values : Array(Types::MeasureValue)? = nil,
          @time : String? = nil,
          @time_unit : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Information on the records ingested by this request.
      struct RecordsIngested
        include JSON::Serializable

        # Count of records ingested into the magnetic store.
        @[JSON::Field(key: "MagneticStore")]
        getter magnetic_store : Int32?

        # Count of records ingested into the memory store.
        @[JSON::Field(key: "MemoryStore")]
        getter memory_store : Int32?

        # Total count of successfully ingested records.
        @[JSON::Field(key: "Total")]
        getter total : Int32?

        def initialize(
          @magnetic_store : Int32? = nil,
          @memory_store : Int32? = nil,
          @total : Int32? = nil
        )
        end
      end

      # Represents records that were not successfully inserted into Timestream due to data validation issues
      # that must be resolved before reinserting time-series data into the system.
      struct RejectedRecord
        include JSON::Serializable

        # The existing version of the record. This value is populated in scenarios where an identical record
        # exists with a higher version than the version in the write request.
        @[JSON::Field(key: "ExistingVersion")]
        getter existing_version : Int64?

        # The reason why a record was not successfully inserted into Timestream. Possible causes of failure
        # include: Records with duplicate data where there are multiple records with the same dimensions,
        # timestamps, and measure names but: Measure values are different Version is not present in the
        # request, or the value of version in the new record is equal to or lower than the existing value If
        # Timestream rejects data for this case, the ExistingVersion field in the RejectedRecords response
        # will indicate the current record’s version. To force an update, you can resend the request with a
        # version for the record set to a value greater than the ExistingVersion . Records with timestamps
        # that lie outside the retention duration of the memory store. When the retention window is updated,
        # you will receive a RejectedRecords exception if you immediately try to ingest data within the new
        # window. To avoid a RejectedRecords exception, wait until the duration of the new window to ingest
        # new data. For further information, see Best Practices for Configuring Timestream and the explanation
        # of how storage works in Timestream . Records with dimensions or measures that exceed the Timestream
        # defined limits. For more information, see Access Management in the Timestream Developer Guide.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The index of the record in the input request for WriteRecords. Indexes begin with 0.
        @[JSON::Field(key: "RecordIndex")]
        getter record_index : Int32?

        def initialize(
          @existing_version : Int64? = nil,
          @reason : String? = nil,
          @record_index : Int32? = nil
        )
        end
      end

      # WriteRecords would throw this exception in the following cases: Records with duplicate data where
      # there are multiple records with the same dimensions, timestamps, and measure names but: Measure
      # values are different Version is not present in the request or the value of version in the new record
      # is equal to or lower than the existing value In this case, if Timestream rejects data, the
      # ExistingVersion field in the RejectedRecords response will indicate the current record’s version. To
      # force an update, you can resend the request with a version for the record set to a value greater
      # than the ExistingVersion . Records with timestamps that lie outside the retention duration of the
      # memory store. Records with dimensions or measures that exceed the Timestream defined limits. For
      # more information, see Quotas in the Amazon Timestream Developer Guide.
      struct RejectedRecordsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "RejectedRecords")]
        getter rejected_records : Array(Types::RejectedRecord)?

        def initialize(
          @message : String? = nil,
          @rejected_records : Array(Types::RejectedRecord)? = nil
        )
        end
      end

      # Report configuration for a batch load task. This contains details about where error reports are
      # stored.
      struct ReportConfiguration
        include JSON::Serializable

        # Configuration of an S3 location to write error reports and events for a batch load.
        @[JSON::Field(key: "ReportS3Configuration")]
        getter report_s3_configuration : Types::ReportS3Configuration?

        def initialize(
          @report_s3_configuration : Types::ReportS3Configuration? = nil
        )
        end
      end

      struct ReportS3Configuration
        include JSON::Serializable

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        @[JSON::Field(key: "EncryptionOption")]
        getter encryption_option : String?

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        def initialize(
          @bucket_name : String,
          @encryption_option : String? = nil,
          @kms_key_id : String? = nil,
          @object_key_prefix : String? = nil
        )
        end
      end

      # The operation tried to access a nonexistent resource. The resource might not be specified correctly,
      # or its status might not be ACTIVE.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ResumeBatchLoadTaskRequest
        include JSON::Serializable

        # The ID of the batch load task to resume.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end

      struct ResumeBatchLoadTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Retention properties contain the duration for which your time-series data must be stored in the
      # magnetic store and the memory store.
      struct RetentionProperties
        include JSON::Serializable

        # The duration for which data must be stored in the magnetic store.
        @[JSON::Field(key: "MagneticStoreRetentionPeriodInDays")]
        getter magnetic_store_retention_period_in_days : Int64

        # The duration for which data must be stored in the memory store.
        @[JSON::Field(key: "MemoryStoreRetentionPeriodInHours")]
        getter memory_store_retention_period_in_hours : Int64

        def initialize(
          @magnetic_store_retention_period_in_days : Int64,
          @memory_store_retention_period_in_hours : Int64
        )
        end
      end

      # The configuration that specifies an S3 location.
      struct S3Configuration
        include JSON::Serializable

        # The bucket name of the customer S3 bucket.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The encryption option for the customer S3 location. Options are S3 server-side encryption with an S3
        # managed key or Amazon Web Services managed key.
        @[JSON::Field(key: "EncryptionOption")]
        getter encryption_option : String?

        # The KMS key ID for the customer S3 location when encrypting with an Amazon Web Services managed key.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The object key preview for the customer S3 location.
        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @encryption_option : String? = nil,
          @kms_key_id : String? = nil,
          @object_key_prefix : String? = nil
        )
        end
      end

      # A Schema specifies the expected data model of the table.
      struct Schema
        include JSON::Serializable

        # A non-empty list of partition keys defining the attributes used to partition the table data. The
        # order of the list determines the partition hierarchy. The name and type of each partition key as
        # well as the partition key order cannot be changed after the table is created. However, the
        # enforcement level of each partition key can be changed.
        @[JSON::Field(key: "CompositePartitionKey")]
        getter composite_partition_key : Array(Types::PartitionKey)?

        def initialize(
          @composite_partition_key : Array(Types::PartitionKey)? = nil
        )
        end
      end

      # The instance quota of resource exceeded for this account.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a database table in Timestream. Tables contain one or more related time series. You can
      # modify the retention duration of the memory store and the magnetic store for a table.
      struct Table
        include JSON::Serializable

        # The Amazon Resource Name that uniquely identifies this table.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the Timestream table was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The name of the Timestream database that contains this table.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The time when the Timestream table was last updated.
        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # Contains properties to set on the table when enabling magnetic store writes.
        @[JSON::Field(key: "MagneticStoreWriteProperties")]
        getter magnetic_store_write_properties : Types::MagneticStoreWriteProperties?

        # The retention duration for the memory store and magnetic store.
        @[JSON::Field(key: "RetentionProperties")]
        getter retention_properties : Types::RetentionProperties?

        # The schema of the table.
        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        # The name of the Timestream table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The current state of the table: DELETING - The table is being deleted. ACTIVE - The table is ready
        # for use.
        @[JSON::Field(key: "TableStatus")]
        getter table_status : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @database_name : String? = nil,
          @last_updated_time : Time? = nil,
          @magnetic_store_write_properties : Types::MagneticStoreWriteProperties? = nil,
          @retention_properties : Types::RetentionProperties? = nil,
          @schema : Types::Schema? = nil,
          @table_name : String? = nil,
          @table_status : String? = nil
        )
        end
      end

      # A tag is a label that you assign to a Timestream database and/or table. Each tag consists of a key
      # and an optional value, both of which you define. With tags, you can categorize databases and/or
      # tables, for example, by purpose, owner, or environment.
      struct Tag
        include JSON::Serializable

        # The key of the tag. Tag keys are case sensitive.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag. Tag values are case-sensitive and can be null.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # Identifies the Timestream resource to which tags should be added. This value is an Amazon Resource
        # Name (ARN).
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags to be assigned to the Timestream resource.
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

      # Too many requests were made by a user and they exceeded the service quotas. The request was
      # throttled.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Timestream resource that the tags will be removed from. This value is an Amazon Resource Name
        # (ARN).
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags keys. Existing tags of the resource whose keys are members of this list will be
        # removed from the Timestream resource.
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

      struct UpdateDatabaseRequest
        include JSON::Serializable

        # The name of the database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The identifier of the new KMS key ( KmsKeyId ) to be used to encrypt the data stored in the
        # database. If the KmsKeyId currently registered with the database is the same as the KmsKeyId in the
        # request, there will not be any update. You can specify the KmsKeyId using any of the following: Key
        # ID: 1234abcd-12ab-34cd-56ef-1234567890ab Key ARN:
        # arn:aws:kms:us-east-1:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab Alias name:
        # alias/ExampleAlias Alias ARN: arn:aws:kms:us-east-1:111122223333:alias/ExampleAlias
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String

        def initialize(
          @database_name : String,
          @kms_key_id : String
        )
        end
      end

      struct UpdateDatabaseResponse
        include JSON::Serializable

        @[JSON::Field(key: "Database")]
        getter database : Types::Database?

        def initialize(
          @database : Types::Database? = nil
        )
        end
      end

      struct UpdateTableRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the Timestream table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Contains properties to set on the table when enabling magnetic store writes.
        @[JSON::Field(key: "MagneticStoreWriteProperties")]
        getter magnetic_store_write_properties : Types::MagneticStoreWriteProperties?

        # The retention duration of the memory store and the magnetic store.
        @[JSON::Field(key: "RetentionProperties")]
        getter retention_properties : Types::RetentionProperties?

        # The schema of the table.
        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        def initialize(
          @database_name : String,
          @table_name : String,
          @magnetic_store_write_properties : Types::MagneticStoreWriteProperties? = nil,
          @retention_properties : Types::RetentionProperties? = nil,
          @schema : Types::Schema? = nil
        )
        end
      end

      struct UpdateTableResponse
        include JSON::Serializable

        # The updated Timestream table.
        @[JSON::Field(key: "Table")]
        getter table : Types::Table?

        def initialize(
          @table : Types::Table? = nil
        )
        end
      end

      # An invalid or malformed request.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct WriteRecordsRequest
        include JSON::Serializable

        # The name of the Timestream database.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # An array of records that contain the unique measure, dimension, time, and version attributes for
        # each time-series data point.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)

        # The name of the Timestream table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A record that contains the common measure, dimension, time, and version attributes shared across all
        # the records in the request. The measure and dimension attributes specified will be merged with the
        # measure and dimension attributes in the records object when the data is written into Timestream.
        # Dimensions may not overlap, or a ValidationException will be thrown. In other words, a record must
        # contain dimensions with unique names.
        @[JSON::Field(key: "CommonAttributes")]
        getter common_attributes : Types::Record?

        def initialize(
          @database_name : String,
          @records : Array(Types::Record),
          @table_name : String,
          @common_attributes : Types::Record? = nil
        )
        end
      end

      struct WriteRecordsResponse
        include JSON::Serializable

        # Information on the records ingested by this request.
        @[JSON::Field(key: "RecordsIngested")]
        getter records_ingested : Types::RecordsIngested?

        def initialize(
          @records_ingested : Types::RecordsIngested? = nil
        )
        end
      end
    end
  end
end
