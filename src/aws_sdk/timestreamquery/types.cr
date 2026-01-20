require "json"
require "time"

module AwsSdk
  module TimestreamQuery
    module Types

      # You do not have the necessary permissions to access the account settings.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration settings for notifications related to account settings.

      struct AccountSettingsNotificationConfiguration
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that grants Timestream permission to publish notifications. This field
        # is only visible if SNS Topic is provided when updating the account settings.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String


        @[JSON::Field(key: "SnsConfiguration")]
        getter sns_configuration : Types::SnsConfiguration?

        def initialize(
          @role_arn : String,
          @sns_configuration : Types::SnsConfiguration? = nil
        )
        end
      end


      struct CancelQueryRequest
        include JSON::Serializable

        # The ID of the query that needs to be cancelled. QueryID is returned as part of the query result.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct CancelQueryResponse
        include JSON::Serializable

        # A CancellationMessage is returned when a CancelQuery request for the query specified by QueryId has
        # already been issued.

        @[JSON::Field(key: "CancellationMessage")]
        getter cancellation_message : String?

        def initialize(
          @cancellation_message : String? = nil
        )
        end
      end

      # Contains the metadata for query results such as the column names, data types, and other attributes.

      struct ColumnInfo
        include JSON::Serializable

        # The data type of the result set column. The data type can be a scalar or complex. Scalar data types
        # are integers, strings, doubles, Booleans, and others. Complex data types are types such as arrays,
        # rows, and others.

        @[JSON::Field(key: "Type")]
        getter type : Types::Type

        # The name of the result set column. The name of the result set is available for columns of all data
        # types except for arrays.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @type : Types::Type,
          @name : String? = nil
        )
        end
      end

      # Unable to poll results for a cancelled query.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateScheduledQueryRequest
        include JSON::Serializable

        # Configuration for error reporting. Error reports will be generated when a problem is encountered
        # when writing the query results.

        @[JSON::Field(key: "ErrorReportConfiguration")]
        getter error_report_configuration : Types::ErrorReportConfiguration

        # Name of the scheduled query.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Notification configuration for the scheduled query. A notification is sent by Timestream when a
        # query run finishes, when the state is updated or when you delete it.

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration

        # The query string to run. Parameter names can be specified in the query string @ character followed
        # by an identifier. The named Parameter @scheduled_runtime is reserved and can be used in the query to
        # get the time at which the query is scheduled to run. The timestamp calculated according to the
        # ScheduleConfiguration parameter, will be the value of @scheduled_runtime paramater for each query
        # run. For example, consider an instance of a scheduled query executing on 2021-12-01 00:00:00. For
        # this instance, the @scheduled_runtime parameter is initialized to the timestamp 2021-12-01 00:00:00
        # when invoking the query.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # The schedule configuration for the query.

        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration

        # The ARN for the IAM role that Timestream will assume when running the scheduled query.

        @[JSON::Field(key: "ScheduledQueryExecutionRoleArn")]
        getter scheduled_query_execution_role_arn : String

        # Using a ClientToken makes the call to CreateScheduledQuery idempotent, in other words, making the
        # same request repeatedly will produce the same result. Making multiple identical CreateScheduledQuery
        # requests has the same effect as making a single request. If CreateScheduledQuery is called without a
        # ClientToken , the Query SDK generates a ClientToken on your behalf. After 8 hours, any request with
        # the same ClientToken is treated as a new request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon KMS key used to encrypt the scheduled query resource, at-rest. If the Amazon KMS key is
        # not specified, the scheduled query resource will be encrypted with a Timestream owned Amazon KMS
        # key. To specify a KMS key, use the key ID, key ARN, alias name, or alias ARN. When using an alias
        # name, prefix the name with alias/ If ErrorReportConfiguration uses SSE_KMS as encryption type, the
        # same KmsKeyId is used to encrypt the error report at rest.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of key-value pairs to label the scheduled query.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Configuration used for writing the result of a query.

        @[JSON::Field(key: "TargetConfiguration")]
        getter target_configuration : Types::TargetConfiguration?

        def initialize(
          @error_report_configuration : Types::ErrorReportConfiguration,
          @name : String,
          @notification_configuration : Types::NotificationConfiguration,
          @query_string : String,
          @schedule_configuration : Types::ScheduleConfiguration,
          @scheduled_query_execution_role_arn : String,
          @client_token : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_configuration : Types::TargetConfiguration? = nil
        )
        end
      end


      struct CreateScheduledQueryResponse
        include JSON::Serializable

        # ARN for the created scheduled query.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Datum represents a single data point in a query result.

      struct Datum
        include JSON::Serializable

        # Indicates if the data point is an array.

        @[JSON::Field(key: "ArrayValue")]
        getter array_value : Array(Types::Datum)?

        # Indicates if the data point is null.

        @[JSON::Field(key: "NullValue")]
        getter null_value : Bool?

        # Indicates if the data point is a row.

        @[JSON::Field(key: "RowValue")]
        getter row_value : Types::Row?

        # Indicates if the data point is a scalar value such as integer, string, double, or Boolean.

        @[JSON::Field(key: "ScalarValue")]
        getter scalar_value : String?

        # Indicates if the data point is a timeseries data type.

        @[JSON::Field(key: "TimeSeriesValue")]
        getter time_series_value : Array(Types::TimeSeriesDataPoint)?

        def initialize(
          @array_value : Array(Types::Datum)? = nil,
          @null_value : Bool? = nil,
          @row_value : Types::Row? = nil,
          @scalar_value : String? = nil,
          @time_series_value : Array(Types::TimeSeriesDataPoint)? = nil
        )
        end
      end


      struct DeleteScheduledQueryRequest
        include JSON::Serializable

        # The ARN of the scheduled query.

        @[JSON::Field(key: "ScheduledQueryArn")]
        getter scheduled_query_arn : String

        def initialize(
          @scheduled_query_arn : String
        )
        end
      end


      struct DescribeAccountSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountSettingsResponse
        include JSON::Serializable

        # The maximum number of Timestream compute units (TCUs) the service will use at any point in time to
        # serve your queries. To run queries, you must set a minimum capacity of 4 TCU. You can set the
        # maximum number of TCU in multiples of 4, for example, 4, 8, 16, 32, and so on. This configuration is
        # applicable only for on-demand usage of (TCUs).

        @[JSON::Field(key: "MaxQueryTCU")]
        getter max_query_tcu : Int32?

        # An object that contains the usage settings for Timestream Compute Units (TCUs) in your account for
        # the query workload.

        @[JSON::Field(key: "QueryCompute")]
        getter query_compute : Types::QueryComputeResponse?

        # The pricing model for queries in your account. The QueryPricingModel parameter is used by several
        # Timestream operations; however, the UpdateAccountSettings API operation doesn't recognize any values
        # other than COMPUTE_UNITS .

        @[JSON::Field(key: "QueryPricingModel")]
        getter query_pricing_model : String?

        def initialize(
          @max_query_tcu : Int32? = nil,
          @query_compute : Types::QueryComputeResponse? = nil,
          @query_pricing_model : String? = nil
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


      struct DescribeScheduledQueryRequest
        include JSON::Serializable

        # The ARN of the scheduled query.

        @[JSON::Field(key: "ScheduledQueryArn")]
        getter scheduled_query_arn : String

        def initialize(
          @scheduled_query_arn : String
        )
        end
      end


      struct DescribeScheduledQueryResponse
        include JSON::Serializable

        # The scheduled query.

        @[JSON::Field(key: "ScheduledQuery")]
        getter scheduled_query : Types::ScheduledQueryDescription

        def initialize(
          @scheduled_query : Types::ScheduledQueryDescription
        )
        end
      end

      # This type is used to map column(s) from the query result to a dimension in the destination table.

      struct DimensionMapping
        include JSON::Serializable

        # Type for the dimension.

        @[JSON::Field(key: "DimensionValueType")]
        getter dimension_value_type : String

        # Column name from query result.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @dimension_value_type : String,
          @name : String
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

      # Configuration required for error reporting.

      struct ErrorReportConfiguration
        include JSON::Serializable

        # The S3 configuration for the error reports.

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3Configuration

        def initialize(
          @s3_configuration : Types::S3Configuration
        )
        end
      end

      # This contains the location of the error report for a single scheduled query call.

      struct ErrorReportLocation
        include JSON::Serializable

        # The S3 location where error reports are written.

        @[JSON::Field(key: "S3ReportLocation")]
        getter s3_report_location : Types::S3ReportLocation?

        def initialize(
          @s3_report_location : Types::S3ReportLocation? = nil
        )
        end
      end


      struct ExecuteScheduledQueryRequest
        include JSON::Serializable

        # The timestamp in UTC. Query will be run as if it was invoked at this timestamp.

        @[JSON::Field(key: "InvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter invocation_time : Time

        # ARN of the scheduled query.

        @[JSON::Field(key: "ScheduledQueryArn")]
        getter scheduled_query_arn : String

        # Not used.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Encapsulates settings for enabling QueryInsights . Enabling QueryInsights returns insights and
        # metrics as a part of the Amazon SNS notification for the query that you executed. You can use
        # QueryInsights to tune your query performance and cost.

        @[JSON::Field(key: "QueryInsights")]
        getter query_insights : Types::ScheduledQueryInsights?

        def initialize(
          @invocation_time : Time,
          @scheduled_query_arn : String,
          @client_token : String? = nil,
          @query_insights : Types::ScheduledQueryInsights? = nil
        )
        end
      end

      # Statistics for a single scheduled query run.

      struct ExecutionStats
        include JSON::Serializable

        # Bytes metered for a single scheduled query run.

        @[JSON::Field(key: "BytesMetered")]
        getter bytes_metered : Int64?

        # Bytes scanned for a single scheduled query run.

        @[JSON::Field(key: "CumulativeBytesScanned")]
        getter cumulative_bytes_scanned : Int64?

        # Data writes metered for records ingested in a single scheduled query run.

        @[JSON::Field(key: "DataWrites")]
        getter data_writes : Int64?

        # Total time, measured in milliseconds, that was needed for the scheduled query run to complete.

        @[JSON::Field(key: "ExecutionTimeInMillis")]
        getter execution_time_in_millis : Int64?

        # Number of rows present in the output from running a query before ingestion to destination data
        # source.

        @[JSON::Field(key: "QueryResultRows")]
        getter query_result_rows : Int64?

        # The number of records ingested for a single scheduled query run.

        @[JSON::Field(key: "RecordsIngested")]
        getter records_ingested : Int64?

        def initialize(
          @bytes_metered : Int64? = nil,
          @cumulative_bytes_scanned : Int64? = nil,
          @data_writes : Int64? = nil,
          @execution_time_in_millis : Int64? = nil,
          @query_result_rows : Int64? = nil,
          @records_ingested : Int64? = nil
        )
        end
      end

      # An internal server error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested endpoint is invalid.

      struct InvalidEndpointException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration object that contains the most recent account settings update, visible only if settings
      # have been updated previously.

      struct LastUpdate
        include JSON::Serializable

        # The status of the last update. Can be either PENDING , FAILED , or SUCCEEDED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Error message describing the last account settings update status, visible only if an error occurred.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The number of TimeStream Compute Units (TCUs) requested in the last account settings update.

        @[JSON::Field(key: "TargetQueryTCU")]
        getter target_query_tcu : Int32?

        def initialize(
          @status : String? = nil,
          @status_message : String? = nil,
          @target_query_tcu : Int32? = nil
        )
        end
      end


      struct ListScheduledQueriesRequest
        include JSON::Serializable

        # The maximum number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as the argument to the subsequent call to ListScheduledQueriesRequest .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token to resume pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScheduledQueriesResponse
        include JSON::Serializable

        # A list of scheduled queries.

        @[JSON::Field(key: "ScheduledQueries")]
        getter scheduled_queries : Array(Types::ScheduledQuery)

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @scheduled_queries : Array(Types::ScheduledQuery),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Timestream resource with tags to be listed. This value is an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The maximum number of tags to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token to resume pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags currently associated with the Timestream resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A pagination token to resume pagination with a subsequent call to ListTagsForResourceResponse .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @tags : Array(Types::Tag),
          @next_token : String? = nil
        )
        end
      end

      # MixedMeasureMappings are mappings that can be used to ingest data into a mixture of narrow and multi
      # measures in the derived table.

      struct MixedMeasureMapping
        include JSON::Serializable

        # Type of the value that is to be read from sourceColumn. If the mapping is for MULTI, use
        # MeasureValueType.MULTI.

        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String

        # Refers to the value of measure_name in a result row. This field is required if MeasureNameColumn is
        # provided.

        @[JSON::Field(key: "MeasureName")]
        getter measure_name : String?

        # Required when measureValueType is MULTI. Attribute mappings for MULTI value measures.

        @[JSON::Field(key: "MultiMeasureAttributeMappings")]
        getter multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)?

        # This field refers to the source column from which measure-value is to be read for result
        # materialization.

        @[JSON::Field(key: "SourceColumn")]
        getter source_column : String?

        # Target measure name to be used. If not provided, the target measure name by default would be
        # measure-name if provided, or sourceColumn otherwise.

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

      # Attribute mapping for MULTI value measures.

      struct MultiMeasureAttributeMapping
        include JSON::Serializable

        # Type of the attribute to be read from the source column.

        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String

        # Source column from where the attribute value is to be read.

        @[JSON::Field(key: "SourceColumn")]
        getter source_column : String

        # Custom name to be used for attribute name in derived table. If not provided, source column name
        # would be used.

        @[JSON::Field(key: "TargetMultiMeasureAttributeName")]
        getter target_multi_measure_attribute_name : String?

        def initialize(
          @measure_value_type : String,
          @source_column : String,
          @target_multi_measure_attribute_name : String? = nil
        )
        end
      end

      # Only one of MixedMeasureMappings or MultiMeasureMappings is to be provided. MultiMeasureMappings can
      # be used to ingest data as multi measures in the derived table.

      struct MultiMeasureMappings
        include JSON::Serializable

        # Required. Attribute mappings to be used for mapping query results to ingest data for multi-measure
        # attributes.

        @[JSON::Field(key: "MultiMeasureAttributeMappings")]
        getter multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)

        # The name of the target multi-measure name in the derived table. This input is required when
        # measureNameColumn is not provided. If MeasureNameColumn is provided, then value from that column
        # will be used as multi-measure name.

        @[JSON::Field(key: "TargetMultiMeasureName")]
        getter target_multi_measure_name : String?

        def initialize(
          @multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping),
          @target_multi_measure_name : String? = nil
        )
        end
      end

      # Notification configuration for a scheduled query. A notification is sent by Timestream when a
      # scheduled query is created, its state is updated or when it is deleted.

      struct NotificationConfiguration
        include JSON::Serializable

        # Details about the Amazon Simple Notification Service (SNS) configuration. This field is visible only
        # when SNS Topic is provided when updating the account settings.

        @[JSON::Field(key: "SnsConfiguration")]
        getter sns_configuration : Types::SnsConfiguration

        def initialize(
          @sns_configuration : Types::SnsConfiguration
        )
        end
      end

      # Mapping for named parameters.

      struct ParameterMapping
        include JSON::Serializable

        # Parameter name.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Type")]
        getter type : Types::Type

        def initialize(
          @name : String,
          @type : Types::Type
        )
        end
      end


      struct PrepareQueryRequest
        include JSON::Serializable

        # The Timestream query string that you want to use as a prepared statement. Parameter names can be
        # specified in the query string @ character followed by an identifier.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # By setting this value to true , Timestream will only validate that the query string is a valid
        # Timestream query, and not store the prepared query for later use.

        @[JSON::Field(key: "ValidateOnly")]
        getter validate_only : Bool?

        def initialize(
          @query_string : String,
          @validate_only : Bool? = nil
        )
        end
      end


      struct PrepareQueryResponse
        include JSON::Serializable

        # A list of SELECT clause columns of the submitted query string.

        @[JSON::Field(key: "Columns")]
        getter columns : Array(Types::SelectColumn)

        # A list of parameters used in the submitted query string.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ParameterMapping)

        # The query string that you want prepare.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        def initialize(
          @columns : Array(Types::SelectColumn),
          @parameters : Array(Types::ParameterMapping),
          @query_string : String
        )
        end
      end

      # A request to update the provisioned capacity settings for querying data.

      struct ProvisionedCapacityRequest
        include JSON::Serializable

        # The target compute capacity for querying data, specified in Timestream Compute Units (TCUs).

        @[JSON::Field(key: "TargetQueryTCU")]
        getter target_query_tcu : Int32

        # Configuration settings for notifications related to the provisioned capacity update.

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::AccountSettingsNotificationConfiguration?

        def initialize(
          @target_query_tcu : Int32,
          @notification_configuration : Types::AccountSettingsNotificationConfiguration? = nil
        )
        end
      end

      # The response to a request to update the provisioned capacity settings for querying data.

      struct ProvisionedCapacityResponse
        include JSON::Serializable

        # The number of Timestream Compute Units (TCUs) provisioned in the account. This field is only visible
        # when the compute mode is PROVISIONED .

        @[JSON::Field(key: "ActiveQueryTCU")]
        getter active_query_tcu : Int32?

        # Information about the last update to the provisioned capacity settings.

        @[JSON::Field(key: "LastUpdate")]
        getter last_update : Types::LastUpdate?

        # An object that contains settings for notifications that are sent whenever the provisioned capacity
        # settings are modified. This field is only visible when the compute mode is PROVISIONED .

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::AccountSettingsNotificationConfiguration?

        def initialize(
          @active_query_tcu : Int32? = nil,
          @last_update : Types::LastUpdate? = nil,
          @notification_configuration : Types::AccountSettingsNotificationConfiguration? = nil
        )
        end
      end

      # A request to retrieve or update the compute capacity settings for querying data.

      struct QueryComputeRequest
        include JSON::Serializable

        # The mode in which Timestream Compute Units (TCUs) are allocated and utilized within an account. Note
        # that in the Asia Pacific (Mumbai) region, the API operation only recognizes the value PROVISIONED .

        @[JSON::Field(key: "ComputeMode")]
        getter compute_mode : String?

        # Configuration object that contains settings for provisioned Timestream Compute Units (TCUs) in your
        # account.

        @[JSON::Field(key: "ProvisionedCapacity")]
        getter provisioned_capacity : Types::ProvisionedCapacityRequest?

        def initialize(
          @compute_mode : String? = nil,
          @provisioned_capacity : Types::ProvisionedCapacityRequest? = nil
        )
        end
      end

      # The response to a request to retrieve or update the compute capacity settings for querying data.

      struct QueryComputeResponse
        include JSON::Serializable

        # The mode in which Timestream Compute Units (TCUs) are allocated and utilized within an account. Note
        # that in the Asia Pacific (Mumbai) region, the API operation only recognizes the value PROVISIONED .

        @[JSON::Field(key: "ComputeMode")]
        getter compute_mode : String?

        # Configuration object that contains settings for provisioned Timestream Compute Units (TCUs) in your
        # account.

        @[JSON::Field(key: "ProvisionedCapacity")]
        getter provisioned_capacity : Types::ProvisionedCapacityResponse?

        def initialize(
          @compute_mode : String? = nil,
          @provisioned_capacity : Types::ProvisionedCapacityResponse? = nil
        )
        end
      end

      # Timestream was unable to run the query successfully.

      struct QueryExecutionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # QueryInsights is a performance tuning feature that helps you optimize your queries, reducing costs
      # and improving performance. With QueryInsights , you can assess the pruning efficiency of your
      # queries and identify areas for improvement to enhance query performance. With QueryInsights , you
      # can also analyze the effectiveness of your queries in terms of temporal and spatial pruning, and
      # identify opportunities to improve performance. Specifically, you can evaluate how well your queries
      # use time-based and partition key-based indexing strategies to optimize data retrieval. To optimize
      # query performance, it's essential that you fine-tune both the temporal and spatial parameters that
      # govern query execution. The key metrics provided by QueryInsights are QuerySpatialCoverage and
      # QueryTemporalRange . QuerySpatialCoverage indicates how much of the spatial axis the query scans,
      # with lower values being more efficient. QueryTemporalRange shows the time range scanned, with
      # narrower ranges being more performant. Benefits of QueryInsights The following are the key benefits
      # of using QueryInsights : Identifying inefficient queries – QueryInsights provides information on the
      # time-based and attribute-based pruning of the tables accessed by the query. This information helps
      # you identify the tables that are sub-optimally accessed. Optimizing your data model and partitioning
      # – You can use the QueryInsights information to access and fine-tune your data model and partitioning
      # strategy. Tuning queries – QueryInsights highlights opportunities to use indexes more effectively.
      # The maximum number of Query API requests you're allowed to make with QueryInsights enabled is 1
      # query per second (QPS). If you exceed this query rate, it might result in throttling.

      struct QueryInsights
        include JSON::Serializable

        # Provides the following modes to enable QueryInsights : ENABLED_WITH_RATE_CONTROL – Enables
        # QueryInsights for the queries being processed. This mode also includes a rate control mechanism,
        # which limits the QueryInsights feature to 1 query per second (QPS). DISABLED – Disables
        # QueryInsights .

        @[JSON::Field(key: "Mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # Provides various insights and metrics related to the query that you executed.

      struct QueryInsightsResponse
        include JSON::Serializable

        # Indicates the size of query result set in bytes. You can use this data to validate if the result set
        # has changed as part of the query tuning exercise.

        @[JSON::Field(key: "OutputBytes")]
        getter output_bytes : Int64?

        # Indicates the total number of rows returned as part of the query result set. You can use this data
        # to validate if the number of rows in the result set have changed as part of the query tuning
        # exercise.

        @[JSON::Field(key: "OutputRows")]
        getter output_rows : Int64?

        # Provides insights into the spatial coverage of the query, including the table with sub-optimal (max)
        # spatial pruning. This information can help you identify areas for improvement in your partitioning
        # strategy to enhance spatial pruning.

        @[JSON::Field(key: "QuerySpatialCoverage")]
        getter query_spatial_coverage : Types::QuerySpatialCoverage?

        # Indicates the number of tables in the query.

        @[JSON::Field(key: "QueryTableCount")]
        getter query_table_count : Int64?

        # Provides insights into the temporal range of the query, including the table with the largest (max)
        # time range. Following are some of the potential options for optimizing time-based pruning: Add
        # missing time-predicates. Remove functions around the time predicates. Add time predicates to all the
        # sub-queries.

        @[JSON::Field(key: "QueryTemporalRange")]
        getter query_temporal_range : Types::QueryTemporalRange?

        # Indicates the partitions created by the Unload operation.

        @[JSON::Field(key: "UnloadPartitionCount")]
        getter unload_partition_count : Int64?

        # Indicates the size, in bytes, written by the Unload operation.

        @[JSON::Field(key: "UnloadWrittenBytes")]
        getter unload_written_bytes : Int64?

        # Indicates the rows written by the Unload query.

        @[JSON::Field(key: "UnloadWrittenRows")]
        getter unload_written_rows : Int64?

        def initialize(
          @output_bytes : Int64? = nil,
          @output_rows : Int64? = nil,
          @query_spatial_coverage : Types::QuerySpatialCoverage? = nil,
          @query_table_count : Int64? = nil,
          @query_temporal_range : Types::QueryTemporalRange? = nil,
          @unload_partition_count : Int64? = nil,
          @unload_written_bytes : Int64? = nil,
          @unload_written_rows : Int64? = nil
        )
        end
      end


      struct QueryRequest
        include JSON::Serializable

        # The query to be run by Timestream.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # Unique, case-sensitive string of up to 64 ASCII characters specified when a Query request is made.
        # Providing a ClientToken makes the call to Query idempotent . This means that running the same query
        # repeatedly will produce the same result. In other words, making multiple identical Query requests
        # has the same effect as making a single request. When using ClientToken in a query, note the
        # following: If the Query API is instantiated without a ClientToken , the Query SDK generates a
        # ClientToken on your behalf. If the Query invocation only contains the ClientToken but does not
        # include a NextToken , that invocation of Query is assumed to be a new query run. If the invocation
        # contains NextToken , that particular invocation is assumed to be a subsequent invocation of a prior
        # call to the Query API, and a result set is returned. After 4 hours, any request with the same
        # ClientToken is treated as a new request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The total number of rows to be returned in the Query output. The initial run of Query with a MaxRows
        # value specified will return the result set of the query in two cases: The size of the result is less
        # than 1MB . The number of rows in the result set is less than the value of maxRows . Otherwise, the
        # initial invocation of Query only returns a NextToken , which can then be used in subsequent calls to
        # fetch the result set. To resume pagination, provide the NextToken value in the subsequent command.
        # If the row size is large (e.g. a row has many columns), Timestream may return fewer rows to keep the
        # response size from exceeding the 1 MB limit. If MaxRows is not provided, Timestream will send the
        # necessary number of rows to meet the 1 MB limit.

        @[JSON::Field(key: "MaxRows")]
        getter max_rows : Int32?

        # A pagination token used to return a set of results. When the Query API is invoked using NextToken ,
        # that particular invocation is assumed to be a subsequent invocation of a prior call to Query , and a
        # result set is returned. However, if the Query invocation only contains the ClientToken , that
        # invocation of Query is assumed to be a new query run. Note the following when using NextToken in a
        # query: A pagination token can be used for up to five Query invocations, OR for a duration of up to 1
        # hour – whichever comes first. Using the same NextToken will return the same set of records. To keep
        # paginating through the result set, you must to use the most recent nextToken . Suppose a Query
        # invocation returns two NextToken values, TokenA and TokenB . If TokenB is used in a subsequent Query
        # invocation, then TokenA is invalidated and cannot be reused. To request a previous result set from a
        # query after pagination has begun, you must re-invoke the Query API. The latest NextToken should be
        # used to paginate until null is returned, at which point a new NextToken should be used. If the IAM
        # principal of the query initiator and the result reader are not the same and/or the query initiator
        # and the result reader do not have the same query string in the query requests, the query will fail
        # with an Invalid pagination token error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Encapsulates settings for enabling QueryInsights . Enabling QueryInsights returns insights and
        # metrics in addition to query results for the query that you executed. You can use QueryInsights to
        # tune your query performance.

        @[JSON::Field(key: "QueryInsights")]
        getter query_insights : Types::QueryInsights?

        def initialize(
          @query_string : String,
          @client_token : String? = nil,
          @max_rows : Int32? = nil,
          @next_token : String? = nil,
          @query_insights : Types::QueryInsights? = nil
        )
        end
      end


      struct QueryResponse
        include JSON::Serializable

        # The column data types of the returned result set.

        @[JSON::Field(key: "ColumnInfo")]
        getter column_info : Array(Types::ColumnInfo)

        # A unique ID for the given query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The result set rows returned by the query.

        @[JSON::Field(key: "Rows")]
        getter rows : Array(Types::Row)

        # A pagination token that can be used again on a Query call to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Encapsulates QueryInsights containing insights and metrics related to the query that you executed.

        @[JSON::Field(key: "QueryInsightsResponse")]
        getter query_insights_response : Types::QueryInsightsResponse?

        # Information about the status of the query, including progress and bytes scanned.

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : Types::QueryStatus?

        def initialize(
          @column_info : Array(Types::ColumnInfo),
          @query_id : String,
          @rows : Array(Types::Row),
          @next_token : String? = nil,
          @query_insights_response : Types::QueryInsightsResponse? = nil,
          @query_status : Types::QueryStatus? = nil
        )
        end
      end

      # Provides insights into the spatial coverage of the query, including the table with sub-optimal (max)
      # spatial pruning. This information can help you identify areas for improvement in your partitioning
      # strategy to enhance spatial pruning For example, you can do the following with the
      # QuerySpatialCoverage information: Add measure_name or use customer-defined partition key (CDPK)
      # predicates. If you've already done the preceding action, remove functions around them or clauses,
      # such as LIKE .

      struct QuerySpatialCoverage
        include JSON::Serializable

        # Provides insights into the spatial coverage of the executed query and the table with the most
        # inefficient spatial pruning. Value – The maximum ratio of spatial coverage. TableArn – The Amazon
        # Resource Name (ARN) of the table with sub-optimal spatial pruning. PartitionKey – The partition key
        # used for partitioning, which can be a default measure_name or a CDPK.

        @[JSON::Field(key: "Max")]
        getter max : Types::QuerySpatialCoverageMax?

        def initialize(
          @max : Types::QuerySpatialCoverageMax? = nil
        )
        end
      end

      # Provides insights into the table with the most sub-optimal spatial range scanned by your query.

      struct QuerySpatialCoverageMax
        include JSON::Serializable

        # The partition key used for partitioning, which can be a default measure_name or a customer defined
        # partition key .

        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : Array(String)?

        # The Amazon Resource Name (ARN) of the table with the most sub-optimal spatial pruning.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # The maximum ratio of spatial coverage.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @partition_key : Array(String)? = nil,
          @table_arn : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Information about the status of the query, including progress and bytes scanned.

      struct QueryStatus
        include JSON::Serializable

        # The amount of data scanned by the query in bytes that you will be charged for. This is a cumulative
        # sum and represents the total amount of data that you will be charged for since the query was
        # started. The charge is applied only once and is either applied when the query completes running or
        # when the query is cancelled.

        @[JSON::Field(key: "CumulativeBytesMetered")]
        getter cumulative_bytes_metered : Int64?

        # The amount of data scanned by the query in bytes. This is a cumulative sum and represents the total
        # amount of bytes scanned since the query was started.

        @[JSON::Field(key: "CumulativeBytesScanned")]
        getter cumulative_bytes_scanned : Int64?

        # The progress of the query, expressed as a percentage.

        @[JSON::Field(key: "ProgressPercentage")]
        getter progress_percentage : Float64?

        def initialize(
          @cumulative_bytes_metered : Int64? = nil,
          @cumulative_bytes_scanned : Int64? = nil,
          @progress_percentage : Float64? = nil
        )
        end
      end

      # Provides insights into the temporal range of the query, including the table with the largest (max)
      # time range.

      struct QueryTemporalRange
        include JSON::Serializable

        # Encapsulates the following properties that provide insights into the most sub-optimal performing
        # table on the temporal axis: Value – The maximum duration in nanoseconds between the start and end of
        # the query. TableArn – The Amazon Resource Name (ARN) of the table which is queried with the largest
        # time range.

        @[JSON::Field(key: "Max")]
        getter max : Types::QueryTemporalRangeMax?

        def initialize(
          @max : Types::QueryTemporalRangeMax? = nil
        )
        end
      end

      # Provides insights into the table with the most sub-optimal temporal pruning scanned by your query.

      struct QueryTemporalRangeMax
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the table which is queried with the largest time range.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # The maximum duration in nanoseconds between the start and end of the query.

        @[JSON::Field(key: "Value")]
        getter value : Int64?

        def initialize(
          @table_arn : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # The requested resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the scheduled query.

        @[JSON::Field(key: "ScheduledQueryArn")]
        getter scheduled_query_arn : String?

        def initialize(
          @message : String? = nil,
          @scheduled_query_arn : String? = nil
        )
        end
      end

      # Represents a single row in the query results.

      struct Row
        include JSON::Serializable

        # List of data points in a single row of the result set.

        @[JSON::Field(key: "Data")]
        getter data : Array(Types::Datum)

        def initialize(
          @data : Array(Types::Datum)
        )
        end
      end

      # Details on S3 location for error reports that result from running a query.

      struct S3Configuration
        include JSON::Serializable

        # Name of the S3 bucket under which error reports will be created.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # Encryption at rest options for the error reports. If no encryption option is specified, Timestream
        # will choose SSE_S3 as default.

        @[JSON::Field(key: "EncryptionOption")]
        getter encryption_option : String?

        # Prefix for the error report key. Timestream by default adds the following prefix to the error report
        # path.

        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        def initialize(
          @bucket_name : String,
          @encryption_option : String? = nil,
          @object_key_prefix : String? = nil
        )
        end
      end

      # S3 report location for the scheduled query run.

      struct S3ReportLocation
        include JSON::Serializable

        # S3 bucket name.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # S3 key.

        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String?

        def initialize(
          @bucket_name : String? = nil,
          @object_key : String? = nil
        )
        end
      end

      # Configuration of the schedule of the query.

      struct ScheduleConfiguration
        include JSON::Serializable

        # An expression that denotes when to trigger the scheduled query run. This can be a cron expression or
        # a rate expression.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        def initialize(
          @schedule_expression : String
        )
        end
      end

      # Scheduled Query

      struct ScheduledQuery
        include JSON::Serializable

        # The Amazon Resource Name.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the scheduled query.

        @[JSON::Field(key: "Name")]
        getter name : String

        # State of scheduled query.

        @[JSON::Field(key: "State")]
        getter state : String

        # The creation time of the scheduled query.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Configuration for scheduled query error reporting.

        @[JSON::Field(key: "ErrorReportConfiguration")]
        getter error_report_configuration : Types::ErrorReportConfiguration?

        # Status of the last scheduled query run.

        @[JSON::Field(key: "LastRunStatus")]
        getter last_run_status : String?

        # The next time the scheduled query is to be run.

        @[JSON::Field(key: "NextInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_invocation_time : Time?

        # The last time the scheduled query was run.

        @[JSON::Field(key: "PreviousInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter previous_invocation_time : Time?

        # Target data source where final scheduled query result will be written.

        @[JSON::Field(key: "TargetDestination")]
        getter target_destination : Types::TargetDestination?

        def initialize(
          @arn : String,
          @name : String,
          @state : String,
          @creation_time : Time? = nil,
          @error_report_configuration : Types::ErrorReportConfiguration? = nil,
          @last_run_status : String? = nil,
          @next_invocation_time : Time? = nil,
          @previous_invocation_time : Time? = nil,
          @target_destination : Types::TargetDestination? = nil
        )
        end
      end

      # Structure that describes scheduled query.

      struct ScheduledQueryDescription
        include JSON::Serializable

        # Scheduled query ARN.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Name of the scheduled query.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Notification configuration.

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration

        # The query to be run.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # Schedule configuration.

        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration

        # State of the scheduled query.

        @[JSON::Field(key: "State")]
        getter state : String

        # Creation time of the scheduled query.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Error-reporting configuration for the scheduled query.

        @[JSON::Field(key: "ErrorReportConfiguration")]
        getter error_report_configuration : Types::ErrorReportConfiguration?

        # A customer provided KMS key used to encrypt the scheduled query resource.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Runtime summary for the last scheduled query run.

        @[JSON::Field(key: "LastRunSummary")]
        getter last_run_summary : Types::ScheduledQueryRunSummary?

        # The next time the scheduled query is scheduled to run.

        @[JSON::Field(key: "NextInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_invocation_time : Time?

        # Last time the query was run.

        @[JSON::Field(key: "PreviousInvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter previous_invocation_time : Time?

        # Runtime summary for the last five failed scheduled query runs.

        @[JSON::Field(key: "RecentlyFailedRuns")]
        getter recently_failed_runs : Array(Types::ScheduledQueryRunSummary)?

        # IAM role that Timestream uses to run the schedule query.

        @[JSON::Field(key: "ScheduledQueryExecutionRoleArn")]
        getter scheduled_query_execution_role_arn : String?

        # Scheduled query target store configuration.

        @[JSON::Field(key: "TargetConfiguration")]
        getter target_configuration : Types::TargetConfiguration?

        def initialize(
          @arn : String,
          @name : String,
          @notification_configuration : Types::NotificationConfiguration,
          @query_string : String,
          @schedule_configuration : Types::ScheduleConfiguration,
          @state : String,
          @creation_time : Time? = nil,
          @error_report_configuration : Types::ErrorReportConfiguration? = nil,
          @kms_key_id : String? = nil,
          @last_run_summary : Types::ScheduledQueryRunSummary? = nil,
          @next_invocation_time : Time? = nil,
          @previous_invocation_time : Time? = nil,
          @recently_failed_runs : Array(Types::ScheduledQueryRunSummary)? = nil,
          @scheduled_query_execution_role_arn : String? = nil,
          @target_configuration : Types::TargetConfiguration? = nil
        )
        end
      end

      # Encapsulates settings for enabling QueryInsights on an ExecuteScheduledQueryRequest .

      struct ScheduledQueryInsights
        include JSON::Serializable

        # Provides the following modes to enable ScheduledQueryInsights : ENABLED_WITH_RATE_CONTROL – Enables
        # ScheduledQueryInsights for the queries being processed. This mode also includes a rate control
        # mechanism, which limits the QueryInsights feature to 1 query per second (QPS). DISABLED – Disables
        # ScheduledQueryInsights .

        @[JSON::Field(key: "Mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # Provides various insights and metrics related to the ExecuteScheduledQueryRequest that was executed.

      struct ScheduledQueryInsightsResponse
        include JSON::Serializable

        # Indicates the size of query result set in bytes. You can use this data to validate if the result set
        # has changed as part of the query tuning exercise.

        @[JSON::Field(key: "OutputBytes")]
        getter output_bytes : Int64?

        # Indicates the total number of rows returned as part of the query result set. You can use this data
        # to validate if the number of rows in the result set have changed as part of the query tuning
        # exercise.

        @[JSON::Field(key: "OutputRows")]
        getter output_rows : Int64?

        # Provides insights into the spatial coverage of the query, including the table with sub-optimal (max)
        # spatial pruning. This information can help you identify areas for improvement in your partitioning
        # strategy to enhance spatial pruning.

        @[JSON::Field(key: "QuerySpatialCoverage")]
        getter query_spatial_coverage : Types::QuerySpatialCoverage?

        # Indicates the number of tables in the query.

        @[JSON::Field(key: "QueryTableCount")]
        getter query_table_count : Int64?

        # Provides insights into the temporal range of the query, including the table with the largest (max)
        # time range. Following are some of the potential options for optimizing time-based pruning: Add
        # missing time-predicates. Remove functions around the time predicates. Add time predicates to all the
        # sub-queries.

        @[JSON::Field(key: "QueryTemporalRange")]
        getter query_temporal_range : Types::QueryTemporalRange?

        def initialize(
          @output_bytes : Int64? = nil,
          @output_rows : Int64? = nil,
          @query_spatial_coverage : Types::QuerySpatialCoverage? = nil,
          @query_table_count : Int64? = nil,
          @query_temporal_range : Types::QueryTemporalRange? = nil
        )
        end
      end

      # Run summary for the scheduled query

      struct ScheduledQueryRunSummary
        include JSON::Serializable

        # S3 location for error report.

        @[JSON::Field(key: "ErrorReportLocation")]
        getter error_report_location : Types::ErrorReportLocation?

        # Runtime statistics for a scheduled run.

        @[JSON::Field(key: "ExecutionStats")]
        getter execution_stats : Types::ExecutionStats?

        # Error message for the scheduled query in case of failure. You might have to look at the error report
        # to get more detailed error reasons.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # InvocationTime for this run. This is the time at which the query is scheduled to run. Parameter
        # @scheduled_runtime can be used in the query to get the value.

        @[JSON::Field(key: "InvocationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter invocation_time : Time?

        # Provides various insights and metrics related to the run summary of the scheduled query.

        @[JSON::Field(key: "QueryInsightsResponse")]
        getter query_insights_response : Types::ScheduledQueryInsightsResponse?

        # The status of a scheduled query run.

        @[JSON::Field(key: "RunStatus")]
        getter run_status : String?

        # The actual time when the query was run.

        @[JSON::Field(key: "TriggerTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter trigger_time : Time?

        def initialize(
          @error_report_location : Types::ErrorReportLocation? = nil,
          @execution_stats : Types::ExecutionStats? = nil,
          @failure_reason : String? = nil,
          @invocation_time : Time? = nil,
          @query_insights_response : Types::ScheduledQueryInsightsResponse? = nil,
          @run_status : String? = nil,
          @trigger_time : Time? = nil
        )
        end
      end

      # Details of the column that is returned by the query.

      struct SelectColumn
        include JSON::Serializable

        # True, if the column name was aliased by the query. False otherwise.

        @[JSON::Field(key: "Aliased")]
        getter aliased : Bool?

        # Database that has this column.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Name of the column.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Table within the database that has this column.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?


        @[JSON::Field(key: "Type")]
        getter type : Types::Type?

        def initialize(
          @aliased : Bool? = nil,
          @database_name : String? = nil,
          @name : String? = nil,
          @table_name : String? = nil,
          @type : Types::Type? = nil
        )
        end
      end

      # You have exceeded the service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details on SNS that are required to send the notification.

      struct SnsConfiguration
        include JSON::Serializable

        # SNS topic ARN that the scheduled query status notifications will be sent to.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # A tag is a label that you assign to a Timestream database and/or table. Each tag consists of a key
      # and an optional value, both of which you define. Tags enable you to categorize databases and/or
      # tables, for example, by purpose, owner, or environment.

      struct Tag
        include JSON::Serializable

        # The key of the tag. Tag keys are case sensitive.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag. Tag values are case sensitive and can be null.

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

      # Configuration used for writing the output of a query.

      struct TargetConfiguration
        include JSON::Serializable

        # Configuration needed to write data into the Timestream database and table.

        @[JSON::Field(key: "TimestreamConfiguration")]
        getter timestream_configuration : Types::TimestreamConfiguration

        def initialize(
          @timestream_configuration : Types::TimestreamConfiguration
        )
        end
      end

      # Destination details to write data for a target data source. Current supported data source is
      # Timestream.

      struct TargetDestination
        include JSON::Serializable

        # Query result destination details for Timestream data source.

        @[JSON::Field(key: "TimestreamDestination")]
        getter timestream_destination : Types::TimestreamDestination?

        def initialize(
          @timestream_destination : Types::TimestreamDestination? = nil
        )
        end
      end

      # The request was throttled due to excessive requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The timeseries data type represents the values of a measure over time. A time series is an array of
      # rows of timestamps and measure values, with rows sorted in ascending order of time. A
      # TimeSeriesDataPoint is a single data point in the time series. It represents a tuple of (time,
      # measure value) in a time series.

      struct TimeSeriesDataPoint
        include JSON::Serializable

        # The timestamp when the measure value was collected.

        @[JSON::Field(key: "Time")]
        getter time : String

        # The measure value for the data point.

        @[JSON::Field(key: "Value")]
        getter value : Types::Datum

        def initialize(
          @time : String,
          @value : Types::Datum
        )
        end
      end

      # Configuration to write data into Timestream database and table. This configuration allows the user
      # to map the query result select columns into the destination table columns.

      struct TimestreamConfiguration
        include JSON::Serializable

        # Name of Timestream database to which the query result will be written.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # This is to allow mapping column(s) from the query result to the dimension in the destination table.

        @[JSON::Field(key: "DimensionMappings")]
        getter dimension_mappings : Array(Types::DimensionMapping)

        # Name of Timestream table that the query result will be written to. The table should be within the
        # same database that is provided in Timestream configuration.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Column from query result that should be used as the time column in destination table. Column type
        # for this should be TIMESTAMP.

        @[JSON::Field(key: "TimeColumn")]
        getter time_column : String

        # Name of the measure column.

        @[JSON::Field(key: "MeasureNameColumn")]
        getter measure_name_column : String?

        # Specifies how to map measures to multi-measure records.

        @[JSON::Field(key: "MixedMeasureMappings")]
        getter mixed_measure_mappings : Array(Types::MixedMeasureMapping)?

        # Multi-measure mappings.

        @[JSON::Field(key: "MultiMeasureMappings")]
        getter multi_measure_mappings : Types::MultiMeasureMappings?

        def initialize(
          @database_name : String,
          @dimension_mappings : Array(Types::DimensionMapping),
          @table_name : String,
          @time_column : String,
          @measure_name_column : String? = nil,
          @mixed_measure_mappings : Array(Types::MixedMeasureMapping)? = nil,
          @multi_measure_mappings : Types::MultiMeasureMappings? = nil
        )
        end
      end

      # Destination for scheduled query.

      struct TimestreamDestination
        include JSON::Serializable

        # Timestream database name.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Timestream table name.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @database_name : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Contains the data type of a column in a query result set. The data type can be scalar or complex.
      # The supported scalar data types are integers, Boolean, string, double, timestamp, date, time, and
      # intervals. The supported complex data types are arrays, rows, and timeseries.

      struct Type
        include JSON::Serializable

        # Indicates if the column is an array.

        @[JSON::Field(key: "ArrayColumnInfo")]
        getter array_column_info : Types::ColumnInfo?

        # Indicates if the column is a row.

        @[JSON::Field(key: "RowColumnInfo")]
        getter row_column_info : Array(Types::ColumnInfo)?

        # Indicates if the column is of type string, integer, Boolean, double, timestamp, date, time. For more
        # information, see Supported data types .

        @[JSON::Field(key: "ScalarType")]
        getter scalar_type : String?

        # Indicates if the column is a timeseries data type.

        @[JSON::Field(key: "TimeSeriesMeasureValueColumnInfo")]
        getter time_series_measure_value_column_info : Types::ColumnInfo?

        def initialize(
          @array_column_info : Types::ColumnInfo? = nil,
          @row_column_info : Array(Types::ColumnInfo)? = nil,
          @scalar_type : String? = nil,
          @time_series_measure_value_column_info : Types::ColumnInfo? = nil
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


      struct UpdateAccountSettingsRequest
        include JSON::Serializable

        # The maximum number of compute units the service will use at any point in time to serve your queries.
        # To run queries, you must set a minimum capacity of 4 TCU. You can set the maximum number of TCU in
        # multiples of 4, for example, 4, 8, 16, 32, and so on. The maximum value supported for MaxQueryTCU is
        # 1000. To request an increase to this soft limit, contact Amazon Web Services Support. For
        # information about the default quota for maxQueryTCU, see Default quotas. This configuration is
        # applicable only for on-demand usage of Timestream Compute Units (TCUs). The maximum value supported
        # for MaxQueryTCU is 1000. To request an increase to this soft limit, contact Amazon Web Services
        # Support. For information about the default quota for maxQueryTCU , see Default quotas .

        @[JSON::Field(key: "MaxQueryTCU")]
        getter max_query_tcu : Int32?

        # Modifies the query compute settings configured in your account, including the query pricing model
        # and provisioned Timestream Compute Units (TCUs) in your account. This API is idempotent, meaning
        # that making the same request multiple times will have the same effect as making the request once.

        @[JSON::Field(key: "QueryCompute")]
        getter query_compute : Types::QueryComputeRequest?

        # The pricing model for queries in an account. The QueryPricingModel parameter is used by several
        # Timestream operations; however, the UpdateAccountSettings API operation doesn't recognize any values
        # other than COMPUTE_UNITS .

        @[JSON::Field(key: "QueryPricingModel")]
        getter query_pricing_model : String?

        def initialize(
          @max_query_tcu : Int32? = nil,
          @query_compute : Types::QueryComputeRequest? = nil,
          @query_pricing_model : String? = nil
        )
        end
      end


      struct UpdateAccountSettingsResponse
        include JSON::Serializable

        # The configured maximum number of compute units the service will use at any point in time to serve
        # your queries.

        @[JSON::Field(key: "MaxQueryTCU")]
        getter max_query_tcu : Int32?

        # Confirms the updated account settings for querying data in your account.

        @[JSON::Field(key: "QueryCompute")]
        getter query_compute : Types::QueryComputeResponse?

        # The pricing model for an account.

        @[JSON::Field(key: "QueryPricingModel")]
        getter query_pricing_model : String?

        def initialize(
          @max_query_tcu : Int32? = nil,
          @query_compute : Types::QueryComputeResponse? = nil,
          @query_pricing_model : String? = nil
        )
        end
      end


      struct UpdateScheduledQueryRequest
        include JSON::Serializable

        # ARN of the scheuled query.

        @[JSON::Field(key: "ScheduledQueryArn")]
        getter scheduled_query_arn : String

        # State of the scheduled query.

        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @scheduled_query_arn : String,
          @state : String
        )
        end
      end

      # Invalid or malformed request.

      struct ValidationException
        include JSON::Serializable


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
