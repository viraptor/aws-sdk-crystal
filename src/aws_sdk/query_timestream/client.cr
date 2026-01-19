module AwsSdk
  module TimestreamQuery
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

      # Cancels a query that has been issued. Cancellation is provided only if the query has not completed
      # running before the cancellation request was issued. Because cancellation is an idempotent operation,
      # subsequent cancellation requests will return a CancellationMessage , indicating that the query has
      # already been canceled. See code sample for details.
      def cancel_query(
        query_id : String
      ) : Types::CancelQueryResponse
        input = Types::CancelQueryRequest.new(query_id: query_id)
        cancel_query(input)
      end
      def cancel_query(input : Types::CancelQueryRequest) : Types::CancelQueryResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelQueryResponse, "CancelQuery")
      end

      # Create a scheduled query that will be run on your behalf at the configured schedule. Timestream
      # assumes the execution role provided as part of the ScheduledQueryExecutionRoleArn parameter to run
      # the query. You can use the NotificationConfiguration parameter to configure notification for your
      # scheduled query operations.
      def create_scheduled_query(
        error_report_configuration : Types::ErrorReportConfiguration,
        name : String,
        notification_configuration : Types::NotificationConfiguration,
        query_string : String,
        schedule_configuration : Types::ScheduleConfiguration,
        scheduled_query_execution_role_arn : String,
        client_token : String? = nil,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_configuration : Types::TargetConfiguration? = nil
      ) : Types::CreateScheduledQueryResponse
        input = Types::CreateScheduledQueryRequest.new(error_report_configuration: error_report_configuration, name: name, notification_configuration: notification_configuration, query_string: query_string, schedule_configuration: schedule_configuration, scheduled_query_execution_role_arn: scheduled_query_execution_role_arn, client_token: client_token, kms_key_id: kms_key_id, tags: tags, target_configuration: target_configuration)
        create_scheduled_query(input)
      end
      def create_scheduled_query(input : Types::CreateScheduledQueryRequest) : Types::CreateScheduledQueryResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCHEDULED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateScheduledQueryResponse, "CreateScheduledQuery")
      end

      # Deletes a given scheduled query. This is an irreversible operation.
      def delete_scheduled_query(
        scheduled_query_arn : String
      ) : Nil
        input = Types::DeleteScheduledQueryRequest.new(scheduled_query_arn: scheduled_query_arn)
        delete_scheduled_query(input)
      end
      def delete_scheduled_query(input : Types::DeleteScheduledQueryRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEDULED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes the settings for your account that include the query pricing model and the configured
      # maximum TCUs the service can use for your query workload. You're charged only for the duration of
      # compute units used for your workloads.
      def describe_account_settings : Types::DescribeAccountSettingsResponse
        input = Types::DescribeAccountSettingsRequest.new
        describe_account_settings(input)
      end
      def describe_account_settings(input : Types::DescribeAccountSettingsRequest) : Types::DescribeAccountSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountSettingsResponse, "DescribeAccountSettings")
      end

      # DescribeEndpoints returns a list of available endpoints to make Timestream API calls against. This
      # API is available through both Write and Query. Because the Timestream SDKs are designed to
      # transparently work with the service’s architecture, including the management and mapping of the
      # service endpoints, it is not recommended that you use this API unless : You are using VPC endpoints
      # (Amazon Web Services PrivateLink) with Timestream Your application uses a programming language that
      # does not yet have SDK support You require better control over the client-side implementation For
      # detailed information on how and when to use and implement DescribeEndpoints, see The Endpoint
      # Discovery Pattern .
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

      # Provides detailed information about a scheduled query.
      def describe_scheduled_query(
        scheduled_query_arn : String
      ) : Types::DescribeScheduledQueryResponse
        input = Types::DescribeScheduledQueryRequest.new(scheduled_query_arn: scheduled_query_arn)
        describe_scheduled_query(input)
      end
      def describe_scheduled_query(input : Types::DescribeScheduledQueryRequest) : Types::DescribeScheduledQueryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCHEDULED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScheduledQueryResponse, "DescribeScheduledQuery")
      end

      # You can use this API to run a scheduled query manually. If you enabled QueryInsights , this API also
      # returns insights and metrics related to the query that you executed as part of an Amazon SNS
      # notification. QueryInsights helps with performance tuning of your query. For more information about
      # QueryInsights , see Using query insights to optimize queries in Amazon Timestream .
      def execute_scheduled_query(
        invocation_time : Time,
        scheduled_query_arn : String,
        client_token : String? = nil,
        query_insights : Types::ScheduledQueryInsights? = nil
      ) : Nil
        input = Types::ExecuteScheduledQueryRequest.new(invocation_time: invocation_time, scheduled_query_arn: scheduled_query_arn, client_token: client_token, query_insights: query_insights)
        execute_scheduled_query(input)
      end
      def execute_scheduled_query(input : Types::ExecuteScheduledQueryRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_SCHEDULED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets a list of all scheduled queries in the caller's Amazon account and Region. ListScheduledQueries
      # is eventually consistent.
      def list_scheduled_queries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListScheduledQueriesResponse
        input = Types::ListScheduledQueriesRequest.new(max_results: max_results, next_token: next_token)
        list_scheduled_queries(input)
      end
      def list_scheduled_queries(input : Types::ListScheduledQueriesRequest) : Types::ListScheduledQueriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEDULED_QUERIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListScheduledQueriesResponse, "ListScheduledQueries")
      end

      # List all tags on a Timestream query resource.
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

      # A synchronous operation that allows you to submit a query with parameters to be stored by Timestream
      # for later running. Timestream only supports using this operation with ValidateOnly set to true .
      def prepare_query(
        query_string : String,
        validate_only : Bool? = nil
      ) : Types::PrepareQueryResponse
        input = Types::PrepareQueryRequest.new(query_string: query_string, validate_only: validate_only)
        prepare_query(input)
      end
      def prepare_query(input : Types::PrepareQueryRequest) : Types::PrepareQueryResponse
        request = Protocol::JsonRpc.build_request(Model::PREPARE_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PrepareQueryResponse, "PrepareQuery")
      end

      # Query is a synchronous operation that enables you to run a query against your Amazon Timestream
      # data. If you enabled QueryInsights , this API also returns insights and metrics related to the query
      # that you executed. QueryInsights helps with performance tuning of your query. For more information
      # about QueryInsights , see Using query insights to optimize queries in Amazon Timestream . The
      # maximum number of Query API requests you're allowed to make with QueryInsights enabled is 1 query
      # per second (QPS). If you exceed this query rate, it might result in throttling. Query will time out
      # after 60 seconds. You must update the default timeout in the SDK to support a timeout of 60 seconds.
      # See the code sample for details. Your query request will fail in the following cases: If you submit
      # a Query request with the same client token outside of the 5-minute idempotency window. If you submit
      # a Query request with the same client token, but change other parameters, within the 5-minute
      # idempotency window. If the size of the row (including the query metadata) exceeds 1 MB, then the
      # query will fail with the following error message: Query aborted as max page response size has been
      # exceeded by the output result row If the IAM principal of the query initiator and the result reader
      # are not the same and/or the query initiator and the result reader do not have the same query string
      # in the query requests, the query will fail with an Invalid pagination token error.
      def query(
        query_string : String,
        client_token : String? = nil,
        max_rows : Int32? = nil,
        next_token : String? = nil,
        query_insights : Types::QueryInsights? = nil
      ) : Types::QueryResponse
        input = Types::QueryRequest.new(query_string: query_string, client_token: client_token, max_rows: max_rows, next_token: next_token, query_insights: query_insights)
        query(input)
      end
      def query(input : Types::QueryRequest) : Types::QueryResponse
        request = Protocol::JsonRpc.build_request(Model::QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::QueryResponse, "Query")
      end

      # Associate a set of tags with a Timestream resource. You can then activate these user-defined tags so
      # that they appear on the Billing and Cost Management console for cost allocation tracking.
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

      # Removes the association of tags from a Timestream query resource.
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

      # Transitions your account to use TCUs for query pricing and modifies the maximum query compute units
      # that you've configured. If you reduce the value of MaxQueryTCU to a desired configuration, the new
      # value can take up to 24 hours to be effective. After you've transitioned your account to use TCUs
      # for query pricing, you can't transition to using bytes scanned for query pricing.
      def update_account_settings(
        max_query_tcu : Int32? = nil,
        query_compute : Types::QueryComputeRequest? = nil,
        query_pricing_model : String? = nil
      ) : Types::UpdateAccountSettingsResponse
        input = Types::UpdateAccountSettingsRequest.new(max_query_tcu: max_query_tcu, query_compute: query_compute, query_pricing_model: query_pricing_model)
        update_account_settings(input)
      end
      def update_account_settings(input : Types::UpdateAccountSettingsRequest) : Types::UpdateAccountSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccountSettingsResponse, "UpdateAccountSettings")
      end

      # Update a scheduled query.
      def update_scheduled_query(
        scheduled_query_arn : String,
        state : String
      ) : Nil
        input = Types::UpdateScheduledQueryRequest.new(scheduled_query_arn: scheduled_query_arn, state: state)
        update_scheduled_query(input)
      end
      def update_scheduled_query(input : Types::UpdateScheduledQueryRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SCHEDULED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
