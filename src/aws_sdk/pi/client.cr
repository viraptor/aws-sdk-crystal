module AwsSdk
  module PI
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

      # Creates a new performance analysis report for a specific time period for the DB instance.

      def create_performance_analysis_report(
        end_time : Time,
        identifier : String,
        service_type : String,
        start_time : Time,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePerformanceAnalysisReportResponse

        input = Types::CreatePerformanceAnalysisReportRequest.new(end_time: end_time, identifier: identifier, service_type: service_type, start_time: start_time, tags: tags)
        create_performance_analysis_report(input)
      end

      def create_performance_analysis_report(input : Types::CreatePerformanceAnalysisReportRequest) : Types::CreatePerformanceAnalysisReportResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PERFORMANCE_ANALYSIS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePerformanceAnalysisReportResponse, "CreatePerformanceAnalysisReport")
      end

      # Deletes a performance analysis report.

      def delete_performance_analysis_report(
        analysis_report_id : String,
        identifier : String,
        service_type : String
      ) : Types::DeletePerformanceAnalysisReportResponse

        input = Types::DeletePerformanceAnalysisReportRequest.new(analysis_report_id: analysis_report_id, identifier: identifier, service_type: service_type)
        delete_performance_analysis_report(input)
      end

      def delete_performance_analysis_report(input : Types::DeletePerformanceAnalysisReportRequest) : Types::DeletePerformanceAnalysisReportResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERFORMANCE_ANALYSIS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePerformanceAnalysisReportResponse, "DeletePerformanceAnalysisReport")
      end

      # For a specific time period, retrieve the top N dimension keys for a metric. Each response element
      # returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500
      # bytes are returned.

      def describe_dimension_keys(
        end_time : Time,
        group_by : Types::DimensionGroup,
        identifier : String,
        metric : String,
        service_type : String,
        start_time : Time,
        additional_metrics : Array(String)? = nil,
        filter : Hash(String, String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        partition_by : Types::DimensionGroup? = nil,
        period_in_seconds : Int32? = nil
      ) : Types::DescribeDimensionKeysResponse

        input = Types::DescribeDimensionKeysRequest.new(end_time: end_time, group_by: group_by, identifier: identifier, metric: metric, service_type: service_type, start_time: start_time, additional_metrics: additional_metrics, filter: filter, max_results: max_results, next_token: next_token, partition_by: partition_by, period_in_seconds: period_in_seconds)
        describe_dimension_keys(input)
      end

      def describe_dimension_keys(input : Types::DescribeDimensionKeysRequest) : Types::DescribeDimensionKeysResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIMENSION_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDimensionKeysResponse, "DescribeDimensionKeys")
      end

      # Get the attributes of the specified dimension group for a DB instance or data source. For example,
      # if you specify a SQL ID, GetDimensionKeyDetails retrieves the full text of the dimension
      # db.sql.statement associated with this ID. This operation is useful because GetResourceMetrics and
      # DescribeDimensionKeys don't support retrieval of large SQL statement text, lock snapshots, and
      # execution plans.

      def get_dimension_key_details(
        group : String,
        group_identifier : String,
        identifier : String,
        service_type : String,
        requested_dimensions : Array(String)? = nil
      ) : Types::GetDimensionKeyDetailsResponse

        input = Types::GetDimensionKeyDetailsRequest.new(group: group, group_identifier: group_identifier, identifier: identifier, service_type: service_type, requested_dimensions: requested_dimensions)
        get_dimension_key_details(input)
      end

      def get_dimension_key_details(input : Types::GetDimensionKeyDetailsRequest) : Types::GetDimensionKeyDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DIMENSION_KEY_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDimensionKeyDetailsResponse, "GetDimensionKeyDetails")
      end

      # Retrieves the report including the report ID, status, time details, and the insights with
      # recommendations. The report status can be RUNNING , SUCCEEDED , or FAILED . The insights include the
      # description and recommendation fields.

      def get_performance_analysis_report(
        analysis_report_id : String,
        identifier : String,
        service_type : String,
        accept_language : String? = nil,
        text_format : String? = nil
      ) : Types::GetPerformanceAnalysisReportResponse

        input = Types::GetPerformanceAnalysisReportRequest.new(analysis_report_id: analysis_report_id, identifier: identifier, service_type: service_type, accept_language: accept_language, text_format: text_format)
        get_performance_analysis_report(input)
      end

      def get_performance_analysis_report(input : Types::GetPerformanceAnalysisReportRequest) : Types::GetPerformanceAnalysisReportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERFORMANCE_ANALYSIS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPerformanceAnalysisReportResponse, "GetPerformanceAnalysisReport")
      end

      # Retrieve the metadata for different features. For example, the metadata might indicate that a
      # feature is turned on or off on a specific DB instance.

      def get_resource_metadata(
        identifier : String,
        service_type : String
      ) : Types::GetResourceMetadataResponse

        input = Types::GetResourceMetadataRequest.new(identifier: identifier, service_type: service_type)
        get_resource_metadata(input)
      end

      def get_resource_metadata(input : Types::GetResourceMetadataRequest) : Types::GetResourceMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceMetadataResponse, "GetResourceMetadata")
      end

      # Retrieve Performance Insights metrics for a set of data sources over a time period. You can provide
      # specific dimension groups and dimensions, and provide filtering criteria for each group. You must
      # specify an aggregate function for each metric. Each response element returns a maximum of 500 bytes.
      # For larger elements, such as SQL statements, only the first 500 bytes are returned.

      def get_resource_metrics(
        end_time : Time,
        identifier : String,
        metric_queries : Array(Types::MetricQuery),
        service_type : String,
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil,
        period_alignment : String? = nil,
        period_in_seconds : Int32? = nil
      ) : Types::GetResourceMetricsResponse

        input = Types::GetResourceMetricsRequest.new(end_time: end_time, identifier: identifier, metric_queries: metric_queries, service_type: service_type, start_time: start_time, max_results: max_results, next_token: next_token, period_alignment: period_alignment, period_in_seconds: period_in_seconds)
        get_resource_metrics(input)
      end

      def get_resource_metrics(input : Types::GetResourceMetricsRequest) : Types::GetResourceMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceMetricsResponse, "GetResourceMetrics")
      end

      # Retrieve the dimensions that can be queried for each specified metric type on a specified DB
      # instance.

      def list_available_resource_dimensions(
        identifier : String,
        metrics : Array(String),
        service_type : String,
        authorized_actions : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAvailableResourceDimensionsResponse

        input = Types::ListAvailableResourceDimensionsRequest.new(identifier: identifier, metrics: metrics, service_type: service_type, authorized_actions: authorized_actions, max_results: max_results, next_token: next_token)
        list_available_resource_dimensions(input)
      end

      def list_available_resource_dimensions(input : Types::ListAvailableResourceDimensionsRequest) : Types::ListAvailableResourceDimensionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_RESOURCE_DIMENSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableResourceDimensionsResponse, "ListAvailableResourceDimensions")
      end

      # Retrieve metrics of the specified types that can be queried for a specified DB instance.

      def list_available_resource_metrics(
        identifier : String,
        metric_types : Array(String),
        service_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAvailableResourceMetricsResponse

        input = Types::ListAvailableResourceMetricsRequest.new(identifier: identifier, metric_types: metric_types, service_type: service_type, max_results: max_results, next_token: next_token)
        list_available_resource_metrics(input)
      end

      def list_available_resource_metrics(input : Types::ListAvailableResourceMetricsRequest) : Types::ListAvailableResourceMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_RESOURCE_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableResourceMetricsResponse, "ListAvailableResourceMetrics")
      end

      # Lists all the analysis reports created for the DB instance. The reports are sorted based on the
      # start time of each report.

      def list_performance_analysis_reports(
        identifier : String,
        service_type : String,
        list_tags : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPerformanceAnalysisReportsResponse

        input = Types::ListPerformanceAnalysisReportsRequest.new(identifier: identifier, service_type: service_type, list_tags: list_tags, max_results: max_results, next_token: next_token)
        list_performance_analysis_reports(input)
      end

      def list_performance_analysis_reports(input : Types::ListPerformanceAnalysisReportsRequest) : Types::ListPerformanceAnalysisReportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERFORMANCE_ANALYSIS_REPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPerformanceAnalysisReportsResponse, "ListPerformanceAnalysisReports")
      end

      # Retrieves all the metadata tags associated with Amazon RDS Performance Insights resource.

      def list_tags_for_resource(
        resource_arn : String,
        service_type : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, service_type: service_type)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Adds metadata tags to the Amazon RDS Performance Insights resource.

      def tag_resource(
        resource_arn : String,
        service_type : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, service_type: service_type, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes the metadata tags from the Amazon RDS Performance Insights resource.

      def untag_resource(
        resource_arn : String,
        service_type : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, service_type: service_type, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
