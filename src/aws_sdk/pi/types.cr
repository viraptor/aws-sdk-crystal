require "json"
require "time"

module AwsSdk
  module PI
    module Types

      # Retrieves the summary of the performance analysis report created for a time period.

      struct AnalysisReport
        include JSON::Serializable

        # The name of the analysis report.

        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String

        # The time you created the analysis report.

        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The analysis end time in the report.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The unique identifier of the analysis report.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # The list of identified insights in the analysis report.

        @[JSON::Field(key: "Insights")]
        getter insights : Array(Types::Insight)?

        # List the tags for the Amazon Web Services service for which Performance Insights returns metrics.
        # Valid values are as follows: RDS DOCDB

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String?

        # The analysis start time in the report.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the created analysis report.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @analysis_report_id : String,
          @create_time : Time? = nil,
          @end_time : Time? = nil,
          @identifier : String? = nil,
          @insights : Array(Types::Insight)? = nil,
          @service_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Retrieves the details of the performance analysis report.

      struct AnalysisReportSummary
        include JSON::Serializable

        # The name of the analysis report.

        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String?

        # The time you created the analysis report.

        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The end time of the analysis in the report.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The start time of the analysis in the report.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the analysis report.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # List of all the tags added to the analysis report.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @analysis_report_id : String? = nil,
          @create_time : Time? = nil,
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePerformanceAnalysisReportRequest
        include JSON::Serializable

        # The end time defined for the analysis report.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # An immutable, Amazon Web Services Region-unique identifier for a data source. Performance Insights
        # gathers metrics from this data source. To use an Amazon RDS instance as a data source, you specify
        # its DbiResourceId value. For example, specify db-ADECBTYHKTSAUMUZQYPDS2GW4A .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights will return metrics. Valid value is
        # RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The start time defined for the analysis report.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The metadata assigned to the analysis report consisting of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @end_time : Time,
          @identifier : String,
          @service_type : String,
          @start_time : Time,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePerformanceAnalysisReportResponse
        include JSON::Serializable

        # A unique identifier for the created analysis report.

        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String?

        def initialize(
          @analysis_report_id : String? = nil
        )
        end
      end

      # List of data objects which provide details about source metrics. This field can be used to determine
      # the PI metric to render for the insight. This data type also includes static values for the metrics
      # for the Insight that were calculated and included in text and annotations on the DB load chart.

      struct Data
        include JSON::Serializable

        # This field determines the Performance Insights metric to render for the insight. The name field
        # refers to a Performance Insights metric.

        @[JSON::Field(key: "PerformanceInsightsMetric")]
        getter performance_insights_metric : Types::PerformanceInsightsMetric?

        def initialize(
          @performance_insights_metric : Types::PerformanceInsightsMetric? = nil
        )
        end
      end

      # A timestamp, and a single numerical value, which together represent a measurement at a particular
      # point in time.

      struct DataPoint
        include JSON::Serializable

        # The time, in epoch format, associated with a particular Value .

        @[JSON::Field(key: "Timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time

        # The actual value associated with a particular Timestamp .

        @[JSON::Field(key: "Value")]
        getter value : Float64

        def initialize(
          @timestamp : Time,
          @value : Float64
        )
        end
      end


      struct DeletePerformanceAnalysisReportRequest
        include JSON::Serializable

        # The unique identifier of the analysis report for deletion.

        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. In the console, the identifier is shown
        # as ResourceID . When you call DescribeDBInstances , the identifier is returned as DbiResourceId . To
        # use a DB instance as a data source, specify its DbiResourceId value. For example, specify
        # db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights will return metrics. Valid value is
        # RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        def initialize(
          @analysis_report_id : String,
          @identifier : String,
          @service_type : String
        )
        end
      end


      struct DeletePerformanceAnalysisReportResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeDimensionKeysRequest
        include JSON::Serializable

        # The date and time specifying the end of the requested time series data. The value specified is
        # exclusive , which means that data points less than (but not equal to) EndTime are returned. The
        # value for EndTime must be later than the value for StartTime .

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # A specification for how to aggregate the data points from a query result. You must specify a valid
        # dimension group. Performance Insights returns all dimensions within this group, unless you provide
        # the names of specific dimensions within this group. You can also request that Performance Insights
        # return a limited number of values for a dimension.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Types::DimensionGroup

        # An immutable, Amazon Web Services Region-unique identifier for a data source. Performance Insights
        # gathers metrics from this data source. To use an Amazon RDS instance as a data source, you specify
        # its DbiResourceId value. For example, specify db-FAIHNTYBKTGAUSUZQYPDS2GW4A .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The name of a Performance Insights metric to be measured. Valid values for Metric are: db.load.avg -
        # A scaled representation of the number of active sessions for the database engine. db.sampledload.avg
        # - The raw number of active sessions for the database engine. If the number of active sessions is
        # less than an internal Performance Insights threshold, db.load.avg and db.sampledload.avg are the
        # same value. If the number of active sessions is greater than the internal threshold, Performance
        # Insights samples the active sessions, with db.load.avg showing the scaled values, db.sampledload.avg
        # showing the raw values, and db.sampledload.avg less than db.load.avg . For most use cases, you can
        # query db.load.avg only.

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # The Amazon Web Services service for which Performance Insights will return metrics. Valid values are
        # as follows: RDS DOCDB

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The date and time specifying the beginning of the requested time series data. You must specify a
        # StartTime within the past 7 days. The value specified is inclusive , which means that data points
        # equal to or greater than StartTime are returned. The value for StartTime must be earlier than the
        # value for EndTime .

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # Additional metrics for the top N dimension keys. If the specified dimension group in the GroupBy
        # parameter is db.sql_tokenized , you can specify per-SQL metrics to get the values for the top N SQL
        # digests. The response syntax is as follows: "AdditionalMetrics" : { " string " : " string " } . The
        # only supported statistic function is .avg .

        @[JSON::Field(key: "AdditionalMetrics")]
        getter additional_metrics : Array(String)?

        # One or more filters to apply in the request. Restrictions: Any number of filters by the same
        # dimension, as specified in the GroupBy or Partition parameters. A single filter for any other
        # dimension in this dimension group. The db.sql.db_id filter isn't available for RDS for SQL Server DB
        # instances.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # The maximum number of items to return in the response. If more items exist than the specified
        # MaxRecords value, a pagination token is included in the response so that the remaining results can
        # be retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # For each dimension specified in GroupBy , specify a secondary dimension to further subdivide the
        # partition keys in the response.

        @[JSON::Field(key: "PartitionBy")]
        getter partition_by : Types::DimensionGroup?

        # The granularity, in seconds, of the data points returned from Performance Insights. A period can be
        # as short as one second, or as long as one day (86400 seconds). Valid values are: 1 (one second) 60
        # (one minute) 300 (five minutes) 3600 (one hour) 86400 (twenty-four hours) If you don't specify
        # PeriodInSeconds , then Performance Insights chooses a value for you, with a goal of returning
        # roughly 100-200 data points in the response.

        @[JSON::Field(key: "PeriodInSeconds")]
        getter period_in_seconds : Int32?

        def initialize(
          @end_time : Time,
          @group_by : Types::DimensionGroup,
          @identifier : String,
          @metric : String,
          @service_type : String,
          @start_time : Time,
          @additional_metrics : Array(String)? = nil,
          @filter : Hash(String, String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @partition_by : Types::DimensionGroup? = nil,
          @period_in_seconds : Int32? = nil
        )
        end
      end


      struct DescribeDimensionKeysResponse
        include JSON::Serializable

        # The end time for the returned dimension keys, after alignment to a granular boundary (as specified
        # by PeriodInSeconds ). AlignedEndTime will be greater than or equal to the value of the
        # user-specified Endtime .

        @[JSON::Field(key: "AlignedEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter aligned_end_time : Time?

        # The start time for the returned dimension keys, after alignment to a granular boundary (as specified
        # by PeriodInSeconds ). AlignedStartTime will be less than or equal to the value of the user-specified
        # StartTime .

        @[JSON::Field(key: "AlignedStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter aligned_start_time : Time?

        # The dimension keys that were requested.

        @[JSON::Field(key: "Keys")]
        getter keys : Array(Types::DimensionKeyDescription)?

        # A pagination token that indicates the response didn’t return all available records because
        # MaxRecords was specified in the previous request. To get the remaining records, specify NextToken in
        # a separate request with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If PartitionBy was present in the request, PartitionKeys contains the breakdown of dimension keys by
        # the specified partitions.

        @[JSON::Field(key: "PartitionKeys")]
        getter partition_keys : Array(Types::ResponsePartitionKey)?

        def initialize(
          @aligned_end_time : Time? = nil,
          @aligned_start_time : Time? = nil,
          @keys : Array(Types::DimensionKeyDescription)? = nil,
          @next_token : String? = nil,
          @partition_keys : Array(Types::ResponsePartitionKey)? = nil
        )
        end
      end

      # The information about a dimension.

      struct DimensionDetail
        include JSON::Serializable

        # The identifier of a dimension.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        def initialize(
          @identifier : String? = nil
        )
        end
      end

      # A logical grouping of Performance Insights metrics for a related subject area. For example, the
      # db.sql dimension group consists of the following dimensions: db.sql.id - The hash of a running SQL
      # statement, generated by Performance Insights. db.sql.db_id - Either the SQL ID generated by the
      # database engine, or a value generated by Performance Insights that begins with pi- .
      # db.sql.statement - The full text of the SQL statement that is running, for example, SELECT * FROM
      # employees . db.sql_tokenized.id - The hash of the SQL digest generated by Performance Insights. Each
      # response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only
      # the first 500 bytes are returned.

      struct DimensionGroup
        include JSON::Serializable

        # The name of the dimension group. Valid values are as follows: db - The name of the database to which
        # the client is connected. The following values are permitted: Aurora PostgreSQL Amazon RDS PostgreSQL
        # Aurora MySQL Amazon RDS MySQL Amazon RDS MariaDB Amazon DocumentDB db.application - The name of the
        # application that is connected to the database. The following values are permitted: Aurora PostgreSQL
        # Amazon RDS PostgreSQL Amazon DocumentDB db.blocking_sql - The SQL queries blocking the most DB load.
        # db.blocking_session - The sessions blocking the most DB load. db.blocking_object - The object
        # resources acquired by other sessions that are blocking the most DB load. db.host - The host name of
        # the connected client (all engines). db.plans - The execution plans for the query (only Aurora
        # PostgreSQL). db.query - The query that is currently running (only Amazon DocumentDB).
        # db.query_tokenized - The digest query (only Amazon DocumentDB). db.session_type - The type of the
        # current session (only Aurora PostgreSQL and RDS PostgreSQL). db.sql - The text of the SQL statement
        # that is currently running (all engines except Amazon DocumentDB). db.sql_tokenized - The SQL digest
        # (all engines except Amazon DocumentDB). db.user - The user logged in to the database (all engines
        # except Amazon DocumentDB). db.wait_event - The event for which the database backend is waiting (all
        # engines except Amazon DocumentDB). db.wait_event_type - The type of event for which the database
        # backend is waiting (all engines except Amazon DocumentDB). db.wait_state - The event for which the
        # database backend is waiting (only Amazon DocumentDB).

        @[JSON::Field(key: "Group")]
        getter group : String

        # A list of specific dimensions from a dimension group. If this parameter is not present, then it
        # signifies that all of the dimensions in the group were requested, or are present in the response.
        # Valid values for elements in the Dimensions array are: db.application.name - The name of the
        # application that is connected to the database. Valid values are as follows: Aurora PostgreSQL Amazon
        # RDS PostgreSQL Amazon DocumentDB db.blocking_sql.id - The ID for each of the SQL queries blocking
        # the most DB load. db.blocking_sql.sql - The SQL text for each of the SQL queries blocking the most
        # DB load. db.blocking_session.id - The ID for each of the sessions blocking the most DB load.
        # db.blocking_object.id - The ID for each of the object resources acquired by other sessions that are
        # blocking the most DB load. db.blocking_object.type - The object type for each of the object
        # resources acquired by other sessions that are blocking the most DB load. db.blocking_object.value -
        # The value for each of the object resources acquired by other sessions that are blocking the most DB
        # load. db.host.id - The host ID of the connected client (all engines). db.host.name - The host name
        # of the connected client (all engines). db.name - The name of the database to which the client is
        # connected. Valid values are as follows: Aurora PostgreSQL Amazon RDS PostgreSQL Aurora MySQL Amazon
        # RDS MySQL Amazon RDS MariaDB Amazon DocumentDB db.query.id - The query ID generated by Performance
        # Insights (only Amazon DocumentDB). db.query.db_id - The query ID generated by the database (only
        # Amazon DocumentDB). db.query.statement - The text of the query that is being run (only Amazon
        # DocumentDB). db.query.tokenized_id db.query.tokenized.id - The query digest ID generated by
        # Performance Insights (only Amazon DocumentDB). db.query.tokenized.db_id - The query digest ID
        # generated by Performance Insights (only Amazon DocumentDB). db.query.tokenized.statement - The text
        # of the query digest (only Amazon DocumentDB). db.session_type.name - The type of the current session
        # (only Amazon DocumentDB). db.sql.id - The hash of the full, non-tokenized SQL statement generated by
        # Performance Insights (all engines except Amazon DocumentDB). db.sql.db_id - Either the SQL ID
        # generated by the database engine, or a value generated by Performance Insights that begins with pi-
        # (all engines except Amazon DocumentDB). db.sql.statement - The full text of the SQL statement that
        # is running, as in SELECT * FROM employees (all engines except Amazon DocumentDB) db.sql.tokenized_id
        # - The hash of the SQL digest generated by Performance Insights (all engines except Amazon
        # DocumentDB). The db.sql.tokenized_id dimension fetches the value of the db.sql_tokenized.id
        # dimension. Amazon RDS returns db.sql.tokenized_id from the db.sql dimension group.
        # db.sql_tokenized.id - The hash of the SQL digest generated by Performance Insights (all engines
        # except Amazon DocumentDB). In the console, db.sql_tokenized.id is called the Support ID because
        # Amazon Web Services Support can look at this data to help you troubleshoot database issues.
        # db.sql_tokenized.db_id - Either the native database ID used to refer to the SQL statement, or a
        # synthetic ID such as pi-2372568224 that Performance Insights generates if the native database ID
        # isn't available (all engines except Amazon DocumentDB). db.sql_tokenized.statement - The text of the
        # SQL digest, as in SELECT * FROM employees WHERE employee_id = ? (all engines except Amazon
        # DocumentDB) db.user.id - The ID of the user logged in to the database (all engines except Amazon
        # DocumentDB). db.user.name - The name of the user logged in to the database (all engines except
        # Amazon DocumentDB). db.wait_event.name - The event for which the backend is waiting (all engines
        # except Amazon DocumentDB). db.wait_event.type - The type of event for which the backend is waiting
        # (all engines except Amazon DocumentDB). db.wait_event_type.name - The name of the event type for
        # which the backend is waiting (all engines except Amazon DocumentDB). db.wait_state.name - The event
        # for which the backend is waiting (only Amazon DocumentDB).

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(String)?

        # The maximum number of items to fetch for this dimension group.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @group : String,
          @dimensions : Array(String)? = nil,
          @limit : Int32? = nil
        )
        end
      end

      # Information about dimensions within a dimension group.

      struct DimensionGroupDetail
        include JSON::Serializable

        # The dimensions within a dimension group.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::DimensionDetail)?

        # The name of the dimension group.

        @[JSON::Field(key: "Group")]
        getter group : String?

        def initialize(
          @dimensions : Array(Types::DimensionDetail)? = nil,
          @group : String? = nil
        )
        end
      end

      # An object that includes the requested dimension key values and aggregated metric values within a
      # dimension group.

      struct DimensionKeyDescription
        include JSON::Serializable

        # A map that contains the value for each additional metric.

        @[JSON::Field(key: "AdditionalMetrics")]
        getter additional_metrics : Hash(String, Float64)?

        # A map of name-value pairs for the dimensions in the group.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)?

        # If PartitionBy was specified, PartitionKeys contains the dimensions that were.

        @[JSON::Field(key: "Partitions")]
        getter partitions : Array(Float64)?

        # The aggregated metric value for the dimensions, over the requested time range.

        @[JSON::Field(key: "Total")]
        getter total : Float64?

        def initialize(
          @additional_metrics : Hash(String, Float64)? = nil,
          @dimensions : Hash(String, String)? = nil,
          @partitions : Array(Float64)? = nil,
          @total : Float64? = nil
        )
        end
      end

      # An object that describes the details for a specified dimension.

      struct DimensionKeyDetail
        include JSON::Serializable

        # The full name of the dimension. The full name includes the group name and key name. The following
        # values are valid: db.query.statement (Amazon DocumentDB) db.sql.statement (Amazon RDS and Aurora)

        @[JSON::Field(key: "Dimension")]
        getter dimension : String?

        # The status of the dimension detail data. Possible values include the following: AVAILABLE - The
        # dimension detail data is ready to be retrieved. PROCESSING - The dimension detail data isn't ready
        # to be retrieved because more processing time is required. If the requested detail data has the
        # status PROCESSING , Performance Insights returns the truncated query. UNAVAILABLE - The dimension
        # detail data could not be collected successfully.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The value of the dimension detail data. Depending on the return status, this value is either the
        # full or truncated SQL query for the following dimensions: db.query.statement (Amazon DocumentDB)
        # db.sql.statement (Amazon RDS and Aurora)

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @dimension : String? = nil,
          @status : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The metadata for a feature. For example, the metadata might indicate that a feature is turned on or
      # off on a specific DB instance.

      struct FeatureMetadata
        include JSON::Serializable

        # The status of the feature on the DB instance. Possible values include the following: ENABLED - The
        # feature is enabled on the instance. DISABLED - The feature is disabled on the instance. UNSUPPORTED
        # - The feature isn't supported on the instance. ENABLED_PENDING_REBOOT - The feature is enabled on
        # the instance but requires a reboot to take effect. DISABLED_PENDING_REBOOT - The feature is disabled
        # on the instance but requires a reboot to take effect. UNKNOWN - The feature status couldn't be
        # determined.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct GetDimensionKeyDetailsRequest
        include JSON::Serializable

        # The name of the dimension group. Performance Insights searches the specified group for the dimension
        # group ID. The following group name values are valid: db.execution_plan (Amazon RDS and Aurora only)
        # db.lock_snapshot (Aurora only) db.query (Amazon DocumentDB only) db.sql (Amazon RDS and Aurora only)

        @[JSON::Field(key: "Group")]
        getter group : String

        # The ID of the dimension group from which to retrieve dimension details. For dimension group db.sql ,
        # the group ID is db.sql.id . The following group ID values are valid: db.execution_plan.id for
        # dimension group db.execution_plan (Aurora and RDS only) db.sql.id for dimension group db.sql (Aurora
        # and RDS only) db.query.id for dimension group db.query (DocumentDB only) For the dimension group
        # db.lock_snapshot , the GroupIdentifier is the epoch timestamp when Performance Insights captured the
        # snapshot, in seconds. You can retrieve this value with the GetResourceMetrics operation for a 1
        # second period.

        @[JSON::Field(key: "GroupIdentifier")]
        getter group_identifier : String

        # The ID for a data source from which to gather dimension data. This ID must be immutable and unique
        # within an Amazon Web Services Region. When a DB instance is the data source, specify its
        # DbiResourceId value. For example, specify db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights returns data. The only valid value is
        # RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # A list of dimensions to retrieve the detail data for within the given dimension group. If you don't
        # specify this parameter, Performance Insights returns all dimension data within the specified
        # dimension group. Specify dimension names for the following dimension groups: db.execution_plan -
        # Specify the dimension name db.execution_plan.raw_plan or the short dimension name raw_plan (Amazon
        # RDS and Aurora only) db.lock_snapshot - Specify the dimension name db.lock_snapshot.lock_trees or
        # the short dimension name lock_trees . (Aurora only) db.sql - Specify either the full dimension name
        # db.sql.statement or the short dimension name statement (Aurora and RDS only). db.query - Specify
        # either the full dimension name db.query.statement or the short dimension name statement (DocumentDB
        # only).

        @[JSON::Field(key: "RequestedDimensions")]
        getter requested_dimensions : Array(String)?

        def initialize(
          @group : String,
          @group_identifier : String,
          @identifier : String,
          @service_type : String,
          @requested_dimensions : Array(String)? = nil
        )
        end
      end


      struct GetDimensionKeyDetailsResponse
        include JSON::Serializable

        # The details for the requested dimensions.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::DimensionKeyDetail)?

        def initialize(
          @dimensions : Array(Types::DimensionKeyDetail)? = nil
        )
        end
      end


      struct GetPerformanceAnalysisReportRequest
        include JSON::Serializable

        # A unique identifier of the created analysis report. For example, report-12345678901234567

        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. In the console, the identifier is shown
        # as ResourceID . When you call DescribeDBInstances , the identifier is returned as DbiResourceId . To
        # use a DB instance as a data source, specify its DbiResourceId value. For example, specify
        # db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights will return metrics. Valid value is
        # RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The text language in the report. The default language is EN_US (English).

        @[JSON::Field(key: "AcceptLanguage")]
        getter accept_language : String?

        # Indicates the text format in the report. The options are PLAIN_TEXT or MARKDOWN . The default value
        # is plain text .

        @[JSON::Field(key: "TextFormat")]
        getter text_format : String?

        def initialize(
          @analysis_report_id : String,
          @identifier : String,
          @service_type : String,
          @accept_language : String? = nil,
          @text_format : String? = nil
        )
        end
      end


      struct GetPerformanceAnalysisReportResponse
        include JSON::Serializable

        # The summary of the performance analysis report created for a time period.

        @[JSON::Field(key: "AnalysisReport")]
        getter analysis_report : Types::AnalysisReport?

        def initialize(
          @analysis_report : Types::AnalysisReport? = nil
        )
        end
      end


      struct GetResourceMetadataRequest
        include JSON::Serializable

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. To use a DB instance as a data source,
        # specify its DbiResourceId value. For example, specify db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights returns metrics.

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        def initialize(
          @identifier : String,
          @service_type : String
        )
        end
      end


      struct GetResourceMetadataResponse
        include JSON::Serializable

        # The metadata for different features. For example, the metadata might indicate that a feature is
        # turned on or off on a specific DB instance.

        @[JSON::Field(key: "Features")]
        getter features : Hash(String, Types::FeatureMetadata)?

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. To use a DB instance as a data source,
        # specify its DbiResourceId value. For example, specify db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        def initialize(
          @features : Hash(String, Types::FeatureMetadata)? = nil,
          @identifier : String? = nil
        )
        end
      end


      struct GetResourceMetricsRequest
        include JSON::Serializable

        # The date and time specifying the end of the requested time series query range. The value specified
        # is exclusive . Thus, the command returns data points less than (but not equal to) EndTime . The
        # value for EndTime must be later than the value for StartTime .

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. In the console, the identifier is shown
        # as ResourceID . When you call DescribeDBInstances , the identifier is returned as DbiResourceId . To
        # use a DB instance as a data source, specify its DbiResourceId value. For example, specify
        # db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # An array of one or more queries to perform. Each query must specify a Performance Insights metric
        # and specify an aggregate function, and you can provide filtering criteria. You must append the
        # aggregate function to the metric. For example, to find the average for the metric db.load you must
        # use db.load.avg . Valid values for aggregate functions include .avg , .min , .max , and .sum .

        @[JSON::Field(key: "MetricQueries")]
        getter metric_queries : Array(Types::MetricQuery)

        # The Amazon Web Services service for which Performance Insights returns metrics. Valid values are as
        # follows: RDS DOCDB

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The date and time specifying the beginning of the requested time series query range. You can't
        # specify a StartTime that is earlier than 7 days ago. By default, Performance Insights has 7 days of
        # retention, but you can extend this range up to 2 years. The value specified is inclusive . Thus, the
        # command returns data points equal to or greater than StartTime . The value for StartTime must be
        # earlier than the value for EndTime .

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The maximum number of items to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The returned timestamp which is the start or end time of the time periods. The default value is
        # END_TIME .

        @[JSON::Field(key: "PeriodAlignment")]
        getter period_alignment : String?

        # The granularity, in seconds, of the data points returned from Performance Insights. A period can be
        # as short as one second, or as long as one day (86400 seconds). Valid values are: 1 (one second) 60
        # (one minute) 300 (five minutes) 3600 (one hour) 86400 (twenty-four hours) If you don't specify
        # PeriodInSeconds , then Performance Insights will choose a value for you, with a goal of returning
        # roughly 100-200 data points in the response.

        @[JSON::Field(key: "PeriodInSeconds")]
        getter period_in_seconds : Int32?

        def initialize(
          @end_time : Time,
          @identifier : String,
          @metric_queries : Array(Types::MetricQuery),
          @service_type : String,
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @period_alignment : String? = nil,
          @period_in_seconds : Int32? = nil
        )
        end
      end


      struct GetResourceMetricsResponse
        include JSON::Serializable

        # The end time for the returned metrics, after alignment to a granular boundary (as specified by
        # PeriodInSeconds ). AlignedEndTime will be greater than or equal to the value of the user-specified
        # Endtime .

        @[JSON::Field(key: "AlignedEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter aligned_end_time : Time?

        # The start time for the returned metrics, after alignment to a granular boundary (as specified by
        # PeriodInSeconds ). AlignedStartTime will be less than or equal to the value of the user-specified
        # StartTime .

        @[JSON::Field(key: "AlignedStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter aligned_start_time : Time?

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. In the console, the identifier is shown
        # as ResourceID . When you call DescribeDBInstances , the identifier is returned as DbiResourceId .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # An array of metric results, where each array element contains all of the data points for a
        # particular dimension.

        @[JSON::Field(key: "MetricList")]
        getter metric_list : Array(Types::MetricKeyDataPoints)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aligned_end_time : Time? = nil,
          @aligned_start_time : Time? = nil,
          @identifier : String? = nil,
          @metric_list : Array(Types::MetricKeyDataPoints)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Retrieves the list of performance issues which are identified.

      struct Insight
        include JSON::Serializable

        # The unique identifier for the insight. For example, insight-12345678901234567 .

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # Metric names and values from the timeframe used as baseline to generate the insight.

        @[JSON::Field(key: "BaselineData")]
        getter baseline_data : Array(Types::Data)?

        # Indicates if the insight is causal or correlated insight.

        @[JSON::Field(key: "Context")]
        getter context : String?

        # Description of the insight. For example: A high severity Insight found between 02:00 to 02:30, where
        # there was an unusually high DB load 600x above baseline. Likely performance impact .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The end time of the insight. For example, 2018-10-30T00:00:00Z .

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # List of data objects containing metrics and references from the time range while generating the
        # insight.

        @[JSON::Field(key: "InsightData")]
        getter insight_data : Array(Types::Data)?

        # The type of insight. For example, HighDBLoad , HighCPU , or DominatingSQLs .

        @[JSON::Field(key: "InsightType")]
        getter insight_type : String?

        # List of recommendations for the insight. For example, Investigate the following SQLs that
        # contributed to 100% of the total DBLoad during that time period: sql-id .

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        # The severity of the insight. The values are: Low , Medium , or High .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The start time of the insight. For example, 2018-10-30T00:00:00Z .

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # List of supporting insights that provide additional factors for the insight.

        @[JSON::Field(key: "SupportingInsights")]
        getter supporting_insights : Array(Types::Insight)?

        def initialize(
          @insight_id : String,
          @baseline_data : Array(Types::Data)? = nil,
          @context : String? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @insight_data : Array(Types::Data)? = nil,
          @insight_type : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil,
          @severity : String? = nil,
          @start_time : Time? = nil,
          @supporting_insights : Array(Types::Insight)? = nil
        )
        end
      end

      # The request failed due to an unknown error.

      struct InternalServiceError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One of the arguments provided is invalid for this request.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAvailableResourceDimensionsRequest
        include JSON::Serializable

        # An immutable identifier for a data source that is unique within an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. To use an Amazon RDS DB instance as a
        # data source, specify its DbiResourceId value. For example, specify db-ABCDEFGHIJKLMNOPQRSTU1VWZ .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The types of metrics for which to retrieve dimensions. Valid values include db.load .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)

        # The Amazon Web Services service for which Performance Insights returns metrics.

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The actions to discover the dimensions you are authorized to access. If you specify multiple
        # actions, then the response will contain the dimensions common for all the actions. When you don't
        # specify this request parameter or provide an empty list, the response contains all the available
        # dimensions for the target database engine whether or not you are authorized to access them.

        @[JSON::Field(key: "AuthorizedActions")]
        getter authorized_actions : Array(String)?

        # The maximum number of items to return in the response. If more items exist than the specified
        # MaxRecords value, a pagination token is included in the response so that the remaining results can
        # be retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @metrics : Array(String),
          @service_type : String,
          @authorized_actions : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailableResourceDimensionsResponse
        include JSON::Serializable

        # The dimension information returned for requested metric types.

        @[JSON::Field(key: "MetricDimensions")]
        getter metric_dimensions : Array(Types::MetricDimensionGroups)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @metric_dimensions : Array(Types::MetricDimensionGroups)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailableResourceMetricsRequest
        include JSON::Serializable

        # An immutable identifier for a data source that is unique within an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. To use an Amazon RDS DB instance as a
        # data source, specify its DbiResourceId value. For example, specify db-ABCDEFGHIJKLMNOPQRSTU1VWZ .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The types of metrics to return in the response. Valid values in the array include the following: os
        # (OS counter metrics) - All engines db (DB load metrics) - All engines except for Amazon DocumentDB
        # db.sql.stats (per-SQL metrics) - All engines except for Amazon DocumentDB db.sql_tokenized.stats
        # (per-SQL digest metrics) - All engines except for Amazon DocumentDB

        @[JSON::Field(key: "MetricTypes")]
        getter metric_types : Array(String)

        # The Amazon Web Services service for which Performance Insights returns metrics.

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The maximum number of items to return. If the MaxRecords value is less than the number of existing
        # items, the response includes a pagination token.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxRecords .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @metric_types : Array(String),
          @service_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailableResourceMetricsResponse
        include JSON::Serializable

        # An array of metrics available to query. Each array element contains the full name, description, and
        # unit of the metric.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::ResponseResourceMetric)?

        # A pagination token that indicates the response didn’t return all available records because
        # MaxRecords was specified in the previous request. To get the remaining records, specify NextToken in
        # a separate request with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @metrics : Array(Types::ResponseResourceMetric)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPerformanceAnalysisReportsRequest
        include JSON::Serializable

        # An immutable identifier for a data source that is unique for an Amazon Web Services Region.
        # Performance Insights gathers metrics from this data source. In the console, the identifier is shown
        # as ResourceID . When you call DescribeDBInstances , the identifier is returned as DbiResourceId . To
        # use a DB instance as a data source, specify its DbiResourceId value. For example, specify
        # db-ABCDEFGHIJKLMNOPQRSTU1VW2X .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The Amazon Web Services service for which Performance Insights returns metrics. Valid value is RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # Specifies whether or not to include the list of tags in the response.

        @[JSON::Field(key: "ListTags")]
        getter list_tags : Bool?

        # The maximum number of items to return in the response. If more items exist than the specified
        # MaxResults value, a pagination token is included in the response so that the remaining results can
        # be retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @service_type : String,
          @list_tags : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPerformanceAnalysisReportsResponse
        include JSON::Serializable

        # List of reports including the report identifier, start and end time, creation time, and status.

        @[JSON::Field(key: "AnalysisReports")]
        getter analysis_reports : Array(Types::AnalysisReportSummary)?

        # An optional pagination token provided by a previous request. If this parameter is specified, the
        # response includes only records beyond the token, up to the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @analysis_reports : Array(Types::AnalysisReportSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Lists all the tags for the Amazon RDS Performance Insights resource. This value is an Amazon
        # Resource Name (ARN). For information about creating an ARN, see Constructing an RDS Amazon Resource
        # Name (ARN) .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # List the tags for the Amazon Web Services service for which Performance Insights returns metrics.
        # Valid value is RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        def initialize(
          @resource_arn : String,
          @service_type : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The metadata assigned to an Amazon RDS resource consisting of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The available dimension information for a metric type.

      struct MetricDimensionGroups
        include JSON::Serializable

        # The available dimension groups for a metric type.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::DimensionGroupDetail)?

        # The metric type to which the dimension information belongs.

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        def initialize(
          @groups : Array(Types::DimensionGroupDetail)? = nil,
          @metric : String? = nil
        )
        end
      end

      # A time-ordered series of data points, corresponding to a dimension of a Performance Insights metric.

      struct MetricKeyDataPoints
        include JSON::Serializable

        # An array of timestamp-value pairs, representing measurements over a period of time.

        @[JSON::Field(key: "DataPoints")]
        getter data_points : Array(Types::DataPoint)?

        # The dimensions to which the data points apply.

        @[JSON::Field(key: "Key")]
        getter key : Types::ResponseResourceMetricKey?

        def initialize(
          @data_points : Array(Types::DataPoint)? = nil,
          @key : Types::ResponseResourceMetricKey? = nil
        )
        end
      end

      # A single query to be processed. You must provide the metric to query and append an aggregate
      # function to the metric. For example, to find the average for the metric db.load you must use
      # db.load.avg . Valid values for aggregate functions include .avg , .min , .max , and .sum . If no
      # other parameters are specified, Performance Insights returns all data points for the specified
      # metric. Optionally, you can request that the data points be aggregated by dimension group ( GroupBy
      # ), and return only those data points that match your criteria ( Filter ).

      struct MetricQuery
        include JSON::Serializable

        # The name of a Performance Insights metric to be measured. Valid values for Metric are: db.load.avg -
        # A scaled representation of the number of active sessions for the database engine. db.sampledload.avg
        # - The raw number of active sessions for the database engine. The counter metrics listed in
        # Performance Insights operating system counters in the Amazon Aurora User Guide . The counter metrics
        # listed in Performance Insights operating system counters in the Amazon RDS User Guide . If the
        # number of active sessions is less than an internal Performance Insights threshold, db.load.avg and
        # db.sampledload.avg are the same value. If the number of active sessions is greater than the internal
        # threshold, Performance Insights samples the active sessions, with db.load.avg showing the scaled
        # values, db.sampledload.avg showing the raw values, and db.sampledload.avg less than db.load.avg .
        # For most use cases, you can query db.load.avg only.

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # One or more filters to apply in the request. Restrictions: Any number of filters by the same
        # dimension, as specified in the GroupBy parameter. A single filter for any other dimension in this
        # dimension group. The db.sql.db_id filter isn't available for RDS for SQL Server DB instances.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # A specification for how to aggregate the data points from a query result. You must specify a valid
        # dimension group. Performance Insights will return all of the dimensions within that group, unless
        # you provide the names of specific dimensions within that group. You can also request that
        # Performance Insights return a limited number of values for a dimension.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Types::DimensionGroup?

        def initialize(
          @metric : String,
          @filter : Hash(String, String)? = nil,
          @group_by : Types::DimensionGroup? = nil
        )
        end
      end

      # The user is not authorized to perform this request.

      struct NotAuthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This data type helps to determine Performance Insights metric to render for the insight.

      struct PerformanceInsightsMetric
        include JSON::Serializable

        # A dimension map that contains the dimensions for this partition.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)?

        # The Performance Insights metric name.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The filter for the Performance Insights metric.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # The Performance Insights metric.

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        # The value of the metric. For example, 9 for db.load.avg .

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @dimensions : Hash(String, String)? = nil,
          @display_name : String? = nil,
          @filter : Hash(String, String)? = nil,
          @metric : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The list of recommendations for the insight.

      struct Recommendation
        include JSON::Serializable

        # The recommendation details to help resolve the performance issue. For example, Investigate the
        # following SQLs that contributed to 100% of the total DBLoad during that time period: sql-id

        @[JSON::Field(key: "RecommendationDescription")]
        getter recommendation_description : String?

        # The unique identifier for the recommendation.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @recommendation_description : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # If PartitionBy was specified in a DescribeDimensionKeys request, the dimensions are returned in an
      # array. Each element in the array specifies one dimension.

      struct ResponsePartitionKey
        include JSON::Serializable

        # A dimension map that contains the dimensions for this partition.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)

        def initialize(
          @dimensions : Hash(String, String)
        )
        end
      end

      # An object that contains the full name, description, and unit of a metric.

      struct ResponseResourceMetric
        include JSON::Serializable

        # The description of the metric.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The full name of the metric.

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        # The unit of the metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @description : String? = nil,
          @metric : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # An object describing a Performance Insights metric and one or more dimensions for that metric.

      struct ResponseResourceMetricKey
        include JSON::Serializable

        # The name of a Performance Insights metric to be measured. Valid values for Metric are: db.load.avg -
        # A scaled representation of the number of active sessions for the database engine. db.sampledload.avg
        # - The raw number of active sessions for the database engine. The counter metrics listed in
        # Performance Insights operating system counters in the Amazon Aurora User Guide . The counter metrics
        # listed in Performance Insights operating system counters in the Amazon RDS User Guide . If the
        # number of active sessions is less than an internal Performance Insights threshold, db.load.avg and
        # db.sampledload.avg are the same value. If the number of active sessions is greater than the internal
        # threshold, Performance Insights samples the active sessions, with db.load.avg showing the scaled
        # values, db.sampledload.avg showing the raw values, and db.sampledload.avg less than db.load.avg .
        # For most use cases, you can query db.load.avg only.

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # The valid dimensions for the metric.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)?

        def initialize(
          @metric : String,
          @dimensions : Hash(String, String)? = nil
        )
        end
      end

      # Metadata assigned to an Amazon RDS resource consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # A key is the required name of the tag. The string value can be from 1 to 128 Unicode characters in
        # length and can't be prefixed with aws: or rds: . The string can only contain only the set of Unicode
        # letters, digits, white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$" ).

        @[JSON::Field(key: "Key")]
        getter key : String

        # A value is the optional value of the tag. The string value can be from 1 to 256 Unicode characters
        # in length and can't be prefixed with aws: or rds: . The string can only contain only the set of
        # Unicode letters, digits, white-space, '_', '.', ':', '/', '=', '+', '-', '@' (Java regex:
        # "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$").

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

        # The Amazon RDS Performance Insights resource that the tags are added to. This value is an Amazon
        # Resource Name (ARN). For information about creating an ARN, see Constructing an RDS Amazon Resource
        # Name (ARN) .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The Amazon Web Services service for which Performance Insights returns metrics. Valid value is RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The metadata assigned to an Amazon RDS resource consisting of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @service_type : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon RDS Performance Insights resource that the tags are added to. This value is an Amazon
        # Resource Name (ARN). For information about creating an ARN, see Constructing an RDS Amazon Resource
        # Name (ARN) .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # List the tags for the Amazon Web Services service for which Performance Insights returns metrics.
        # Valid value is RDS .

        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # The metadata assigned to an Amazon RDS Performance Insights resource consisting of a key-value pair.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @service_type : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
