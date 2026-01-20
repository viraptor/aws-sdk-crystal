module AwsSdk
  module CloudTrail
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

      # Adds one or more tags to a trail, event data store, dashboard, or channel, up to a limit of 50.
      # Overwrites an existing tag's value when a new value is specified for an existing tag key. Tag key
      # names must be unique; you cannot have two keys with the same name but different values. If you
      # specify a key without a value, the tag will be created with the specified key and a value of null.
      # You can tag a trail or event data store that applies to all Amazon Web Services Regions only from
      # the Region in which the trail or event data store was created (also known as its home Region).

      def add_tags(
        resource_id : String,
        tags_list : Array(Types::Tag)
      ) : Types::AddTagsResponse

        input = Types::AddTagsRequest.new(resource_id: resource_id, tags_list: tags_list)
        add_tags(input)
      end

      def add_tags(input : Types::AddTagsRequest) : Types::AddTagsResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsResponse, "AddTags")
      end

      # Cancels a query if the query is not in a terminated state, such as CANCELLED , FAILED , TIMED_OUT ,
      # or FINISHED . You must specify an ARN value for EventDataStore . The ID of the query that you want
      # to cancel is also required. When you run CancelQuery , the query status might show as CANCELLED even
      # if the operation is not yet finished.

      def cancel_query(
        query_id : String,
        event_data_store : String? = nil,
        event_data_store_owner_account_id : String? = nil
      ) : Types::CancelQueryResponse

        input = Types::CancelQueryRequest.new(query_id: query_id, event_data_store: event_data_store, event_data_store_owner_account_id: event_data_store_owner_account_id)
        cancel_query(input)
      end

      def cancel_query(input : Types::CancelQueryRequest) : Types::CancelQueryResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelQueryResponse, "CancelQuery")
      end

      # Creates a channel for CloudTrail to ingest events from a partner or external source. After you
      # create a channel, a CloudTrail Lake event data store can log events from the partner or source that
      # you specify.

      def create_channel(
        destinations : Array(Types::Destination),
        name : String,
        source : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateChannelResponse

        input = Types::CreateChannelRequest.new(destinations: destinations, name: name, source: source, tags: tags)
        create_channel(input)
      end

      def create_channel(input : Types::CreateChannelRequest) : Types::CreateChannelResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateChannelResponse, "CreateChannel")
      end

      # Creates a custom dashboard or the Highlights dashboard. Custom dashboards - Custom dashboards allow
      # you to query events in any event data store type. You can add up to 10 widgets to a custom
      # dashboard. You can manually refresh a custom dashboard, or you can set a refresh schedule.
      # Highlights dashboard - You can create the Highlights dashboard to see a summary of key user
      # activities and API usage across all your event data stores. CloudTrail Lake manages the Highlights
      # dashboard and refreshes the dashboard every 6 hours. To create the Highlights dashboard, you must
      # set and enable a refresh schedule. CloudTrail runs queries to populate the dashboard's widgets
      # during a manual or scheduled refresh. CloudTrail must be granted permissions to run the StartQuery
      # operation on your behalf. To provide permissions, run the PutResourcePolicy operation to attach a
      # resource-based policy to each event data store. For more information, see Example: Allow CloudTrail
      # to run queries to populate a dashboard in the CloudTrail User Guide . To set a refresh schedule,
      # CloudTrail must be granted permissions to run the StartDashboardRefresh operation to refresh the
      # dashboard on your behalf. To provide permissions, run the PutResourcePolicy operation to attach a
      # resource-based policy to the dashboard. For more information, see Resource-based policy example for
      # a dashboard in the CloudTrail User Guide . For more information about dashboards, see CloudTrail
      # Lake dashboards in the CloudTrail User Guide .

      def create_dashboard(
        name : String,
        refresh_schedule : Types::RefreshSchedule? = nil,
        tags_list : Array(Types::Tag)? = nil,
        termination_protection_enabled : Bool? = nil,
        widgets : Array(Types::RequestWidget)? = nil
      ) : Types::CreateDashboardResponse

        input = Types::CreateDashboardRequest.new(name: name, refresh_schedule: refresh_schedule, tags_list: tags_list, termination_protection_enabled: termination_protection_enabled, widgets: widgets)
        create_dashboard(input)
      end

      def create_dashboard(input : Types::CreateDashboardRequest) : Types::CreateDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDashboardResponse, "CreateDashboard")
      end

      # Creates a new event data store.

      def create_event_data_store(
        name : String,
        advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
        billing_mode : String? = nil,
        kms_key_id : String? = nil,
        multi_region_enabled : Bool? = nil,
        organization_enabled : Bool? = nil,
        retention_period : Int32? = nil,
        start_ingestion : Bool? = nil,
        tags_list : Array(Types::Tag)? = nil,
        termination_protection_enabled : Bool? = nil
      ) : Types::CreateEventDataStoreResponse

        input = Types::CreateEventDataStoreRequest.new(name: name, advanced_event_selectors: advanced_event_selectors, billing_mode: billing_mode, kms_key_id: kms_key_id, multi_region_enabled: multi_region_enabled, organization_enabled: organization_enabled, retention_period: retention_period, start_ingestion: start_ingestion, tags_list: tags_list, termination_protection_enabled: termination_protection_enabled)
        create_event_data_store(input)
      end

      def create_event_data_store(input : Types::CreateEventDataStoreRequest) : Types::CreateEventDataStoreResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVENT_DATA_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEventDataStoreResponse, "CreateEventDataStore")
      end

      # Creates a trail that specifies the settings for delivery of log data to an Amazon S3 bucket.

      def create_trail(
        name : String,
        s3_bucket_name : String,
        cloud_watch_logs_log_group_arn : String? = nil,
        cloud_watch_logs_role_arn : String? = nil,
        enable_log_file_validation : Bool? = nil,
        include_global_service_events : Bool? = nil,
        is_multi_region_trail : Bool? = nil,
        is_organization_trail : Bool? = nil,
        kms_key_id : String? = nil,
        s3_key_prefix : String? = nil,
        sns_topic_name : String? = nil,
        tags_list : Array(Types::Tag)? = nil
      ) : Types::CreateTrailResponse

        input = Types::CreateTrailRequest.new(name: name, s3_bucket_name: s3_bucket_name, cloud_watch_logs_log_group_arn: cloud_watch_logs_log_group_arn, cloud_watch_logs_role_arn: cloud_watch_logs_role_arn, enable_log_file_validation: enable_log_file_validation, include_global_service_events: include_global_service_events, is_multi_region_trail: is_multi_region_trail, is_organization_trail: is_organization_trail, kms_key_id: kms_key_id, s3_key_prefix: s3_key_prefix, sns_topic_name: sns_topic_name, tags_list: tags_list)
        create_trail(input)
      end

      def create_trail(input : Types::CreateTrailRequest) : Types::CreateTrailResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrailResponse, "CreateTrail")
      end

      # Deletes a channel.

      def delete_channel(
        channel : String
      ) : Types::DeleteChannelResponse

        input = Types::DeleteChannelRequest.new(channel: channel)
        delete_channel(input)
      end

      def delete_channel(input : Types::DeleteChannelRequest) : Types::DeleteChannelResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteChannelResponse, "DeleteChannel")
      end

      # Deletes the specified dashboard. You cannot delete a dashboard that has termination protection
      # enabled.

      def delete_dashboard(
        dashboard_id : String
      ) : Types::DeleteDashboardResponse

        input = Types::DeleteDashboardRequest.new(dashboard_id: dashboard_id)
        delete_dashboard(input)
      end

      def delete_dashboard(input : Types::DeleteDashboardRequest) : Types::DeleteDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDashboardResponse, "DeleteDashboard")
      end

      # Disables the event data store specified by EventDataStore , which accepts an event data store ARN.
      # After you run DeleteEventDataStore , the event data store enters a PENDING_DELETION state, and is
      # automatically deleted after a wait period of seven days. TerminationProtectionEnabled must be set to
      # False on the event data store and the FederationStatus must be DISABLED . You cannot delete an event
      # data store if TerminationProtectionEnabled is True or the FederationStatus is ENABLED . After you
      # run DeleteEventDataStore on an event data store, you cannot run ListQueries , DescribeQuery , or
      # GetQueryResults on queries that are using an event data store in a PENDING_DELETION state. An event
      # data store in the PENDING_DELETION state does not incur costs.

      def delete_event_data_store(
        event_data_store : String
      ) : Types::DeleteEventDataStoreResponse

        input = Types::DeleteEventDataStoreRequest.new(event_data_store: event_data_store)
        delete_event_data_store(input)
      end

      def delete_event_data_store(input : Types::DeleteEventDataStoreRequest) : Types::DeleteEventDataStoreResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_DATA_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventDataStoreResponse, "DeleteEventDataStore")
      end

      # Deletes the resource-based policy attached to the CloudTrail event data store, dashboard, or
      # channel.

      def delete_resource_policy(
        resource_arn : String
      ) : Types::DeleteResourcePolicyResponse

        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Deletes a trail. This operation must be called from the Region in which the trail was created.
      # DeleteTrail cannot be called on the shadow trails (replicated trails in other Regions) of a trail
      # that is enabled in all Regions. While deleting a CloudTrail trail is an irreversible action,
      # CloudTrail does not delete log files in the Amazon S3 bucket for that trail, the Amazon S3 bucket
      # itself, or the CloudWatchlog group to which the trail delivers events. Deleting a multi-Region trail
      # will stop logging of events in all Amazon Web Services Regions enabled in your Amazon Web Services
      # account. Deleting a single-Region trail will stop logging of events in that Region only. It will not
      # stop logging of events in other Regions even if the trails in those other Regions have identical
      # names to the deleted trail. For information about account closure and deletion of CloudTrail trails,
      # see https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-account-closure.html .

      def delete_trail(
        name : String
      ) : Types::DeleteTrailResponse

        input = Types::DeleteTrailRequest.new(name: name)
        delete_trail(input)
      end

      def delete_trail(input : Types::DeleteTrailRequest) : Types::DeleteTrailResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrailResponse, "DeleteTrail")
      end

      # Removes CloudTrail delegated administrator permissions from a member account in an organization.

      def deregister_organization_delegated_admin(
        delegated_admin_account_id : String
      ) : Types::DeregisterOrganizationDelegatedAdminResponse

        input = Types::DeregisterOrganizationDelegatedAdminRequest.new(delegated_admin_account_id: delegated_admin_account_id)
        deregister_organization_delegated_admin(input)
      end

      def deregister_organization_delegated_admin(input : Types::DeregisterOrganizationDelegatedAdminRequest) : Types::DeregisterOrganizationDelegatedAdminResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_ORGANIZATION_DELEGATED_ADMIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterOrganizationDelegatedAdminResponse, "DeregisterOrganizationDelegatedAdmin")
      end

      # Returns metadata about a query, including query run time in milliseconds, number of events scanned
      # and matched, and query status. If the query results were delivered to an S3 bucket, the response
      # also provides the S3 URI and the delivery status. You must specify either QueryId or QueryAlias .
      # Specifying the QueryAlias parameter returns information about the last query run for the alias. You
      # can provide RefreshId along with QueryAlias to view the query results of a dashboard query for the
      # specified RefreshId .

      def describe_query(
        event_data_store : String? = nil,
        event_data_store_owner_account_id : String? = nil,
        query_alias : String? = nil,
        query_id : String? = nil,
        refresh_id : String? = nil
      ) : Types::DescribeQueryResponse

        input = Types::DescribeQueryRequest.new(event_data_store: event_data_store, event_data_store_owner_account_id: event_data_store_owner_account_id, query_alias: query_alias, query_id: query_id, refresh_id: refresh_id)
        describe_query(input)
      end

      def describe_query(input : Types::DescribeQueryRequest) : Types::DescribeQueryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeQueryResponse, "DescribeQuery")
      end

      # Retrieves settings for one or more trails associated with the current Region for your account.

      def describe_trails(
        include_shadow_trails : Bool? = nil,
        trail_name_list : Array(String)? = nil
      ) : Types::DescribeTrailsResponse

        input = Types::DescribeTrailsRequest.new(include_shadow_trails: include_shadow_trails, trail_name_list: trail_name_list)
        describe_trails(input)
      end

      def describe_trails(input : Types::DescribeTrailsRequest) : Types::DescribeTrailsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrailsResponse, "DescribeTrails")
      end

      # Disables Lake query federation on the specified event data store. When you disable federation,
      # CloudTrail disables the integration with Glue, Lake Formation, and Amazon Athena. After disabling
      # Lake query federation, you can no longer query your event data in Amazon Athena. No CloudTrail Lake
      # data is deleted when you disable federation and you can continue to run queries in CloudTrail Lake.

      def disable_federation(
        event_data_store : String
      ) : Types::DisableFederationResponse

        input = Types::DisableFederationRequest.new(event_data_store: event_data_store)
        disable_federation(input)
      end

      def disable_federation(input : Types::DisableFederationRequest) : Types::DisableFederationResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_FEDERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableFederationResponse, "DisableFederation")
      end

      # Enables Lake query federation on the specified event data store. Federating an event data store lets
      # you view the metadata associated with the event data store in the Glue Data Catalog and run SQL
      # queries against your event data using Amazon Athena. The table metadata stored in the Glue Data
      # Catalog lets the Athena query engine know how to find, read, and process the data that you want to
      # query. When you enable Lake query federation, CloudTrail creates a managed database named
      # aws:cloudtrail (if the database doesn't already exist) and a managed federated table in the Glue
      # Data Catalog. The event data store ID is used for the table name. CloudTrail registers the role ARN
      # and event data store in Lake Formation , the service responsible for allowing fine-grained access
      # control of the federated resources in the Glue Data Catalog. For more information about Lake query
      # federation, see Federate an event data store .

      def enable_federation(
        event_data_store : String,
        federation_role_arn : String
      ) : Types::EnableFederationResponse

        input = Types::EnableFederationRequest.new(event_data_store: event_data_store, federation_role_arn: federation_role_arn)
        enable_federation(input)
      end

      def enable_federation(input : Types::EnableFederationRequest) : Types::EnableFederationResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_FEDERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableFederationResponse, "EnableFederation")
      end

      # Generates a query from a natural language prompt. This operation uses generative artificial
      # intelligence (generative AI) to produce a ready-to-use SQL query from the prompt. The prompt can be
      # a question or a statement about the event data in your event data store. For example, you can enter
      # prompts like "What are my top errors in the past month?" and “Give me a list of users that used
      # SNS.” The prompt must be in English. For information about limitations, permissions, and supported
      # Regions, see Create CloudTrail Lake queries from natural language prompts in the CloudTrail user
      # guide. Do not include any personally identifying, confidential, or sensitive information in your
      # prompts. This feature uses generative AI large language models (LLMs); we recommend double-checking
      # the LLM response.

      def generate_query(
        event_data_stores : Array(String),
        prompt : String
      ) : Types::GenerateQueryResponse

        input = Types::GenerateQueryRequest.new(event_data_stores: event_data_stores, prompt: prompt)
        generate_query(input)
      end

      def generate_query(input : Types::GenerateQueryRequest) : Types::GenerateQueryResponse
        request = Protocol::JsonRpc.build_request(Model::GENERATE_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GenerateQueryResponse, "GenerateQuery")
      end

      # Returns information about a specific channel.

      def get_channel(
        channel : String
      ) : Types::GetChannelResponse

        input = Types::GetChannelRequest.new(channel: channel)
        get_channel(input)
      end

      def get_channel(input : Types::GetChannelRequest) : Types::GetChannelResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetChannelResponse, "GetChannel")
      end

      # Returns the specified dashboard.

      def get_dashboard(
        dashboard_id : String
      ) : Types::GetDashboardResponse

        input = Types::GetDashboardRequest.new(dashboard_id: dashboard_id)
        get_dashboard(input)
      end

      def get_dashboard(input : Types::GetDashboardRequest) : Types::GetDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDashboardResponse, "GetDashboard")
      end

      # Retrieves the current event configuration settings for the specified event data store or trail. The
      # response includes maximum event size configuration, the context key selectors configured for the
      # event data store, and any aggregation settings configured for the trail.

      def get_event_configuration(
        event_data_store : String? = nil,
        trail_name : String? = nil
      ) : Types::GetEventConfigurationResponse

        input = Types::GetEventConfigurationRequest.new(event_data_store: event_data_store, trail_name: trail_name)
        get_event_configuration(input)
      end

      def get_event_configuration(input : Types::GetEventConfigurationRequest) : Types::GetEventConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventConfigurationResponse, "GetEventConfiguration")
      end

      # Returns information about an event data store specified as either an ARN or the ID portion of the
      # ARN.

      def get_event_data_store(
        event_data_store : String
      ) : Types::GetEventDataStoreResponse

        input = Types::GetEventDataStoreRequest.new(event_data_store: event_data_store)
        get_event_data_store(input)
      end

      def get_event_data_store(input : Types::GetEventDataStoreRequest) : Types::GetEventDataStoreResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_DATA_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventDataStoreResponse, "GetEventDataStore")
      end

      # Describes the settings for the event selectors that you configured for your trail. The information
      # returned for your event selectors includes the following: If your event selector includes read-only
      # events, write-only events, or all events. This applies to management events, data events, and
      # network activity events. If your event selector includes management events. If your event selector
      # includes network activity events, the event sources for which you are logging network activity
      # events. If your event selector includes data events, the resources on which you are logging data
      # events. For more information about logging management, data, and network activity events, see the
      # following topics in the CloudTrail User Guide : Logging management events Logging data events
      # Logging network activity events

      def get_event_selectors(
        trail_name : String
      ) : Types::GetEventSelectorsResponse

        input = Types::GetEventSelectorsRequest.new(trail_name: trail_name)
        get_event_selectors(input)
      end

      def get_event_selectors(input : Types::GetEventSelectorsRequest) : Types::GetEventSelectorsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EVENT_SELECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEventSelectorsResponse, "GetEventSelectors")
      end

      # Returns information about a specific import.

      def get_import(
        import_id : String
      ) : Types::GetImportResponse

        input = Types::GetImportRequest.new(import_id: import_id)
        get_import(input)
      end

      def get_import(input : Types::GetImportRequest) : Types::GetImportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetImportResponse, "GetImport")
      end

      # Describes the settings for the Insights event selectors that you configured for your trail or event
      # data store. GetInsightSelectors shows if CloudTrail Insights logging is enabled and which Insights
      # types are configured with corresponding event categories. If you run GetInsightSelectors on a trail
      # or event data store that does not have Insights events enabled, the operation throws the exception
      # InsightNotEnabledException Specify either the EventDataStore parameter to get Insights event
      # selectors for an event data store, or the TrailName parameter to the get Insights event selectors
      # for a trail. You cannot specify these parameters together. For more information, see Working with
      # CloudTrail Insights in the CloudTrail User Guide .

      def get_insight_selectors(
        event_data_store : String? = nil,
        trail_name : String? = nil
      ) : Types::GetInsightSelectorsResponse

        input = Types::GetInsightSelectorsRequest.new(event_data_store: event_data_store, trail_name: trail_name)
        get_insight_selectors(input)
      end

      def get_insight_selectors(input : Types::GetInsightSelectorsRequest) : Types::GetInsightSelectorsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INSIGHT_SELECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInsightSelectorsResponse, "GetInsightSelectors")
      end

      # Gets event data results of a query. You must specify the QueryID value returned by the StartQuery
      # operation.

      def get_query_results(
        query_id : String,
        event_data_store : String? = nil,
        event_data_store_owner_account_id : String? = nil,
        max_query_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetQueryResultsResponse

        input = Types::GetQueryResultsRequest.new(query_id: query_id, event_data_store: event_data_store, event_data_store_owner_account_id: event_data_store_owner_account_id, max_query_results: max_query_results, next_token: next_token)
        get_query_results(input)
      end

      def get_query_results(input : Types::GetQueryResultsRequest) : Types::GetQueryResultsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUERY_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueryResultsResponse, "GetQueryResults")
      end

      # Retrieves the JSON text of the resource-based policy document attached to the CloudTrail event data
      # store, dashboard, or channel.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Returns settings information for a specified trail.

      def get_trail(
        name : String
      ) : Types::GetTrailResponse

        input = Types::GetTrailRequest.new(name: name)
        get_trail(input)
      end

      def get_trail(input : Types::GetTrailRequest) : Types::GetTrailResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTrailResponse, "GetTrail")
      end

      # Returns a JSON-formatted list of information about the specified trail. Fields include information
      # on delivery errors, Amazon SNS and Amazon S3 errors, and start and stop logging times for each
      # trail. This operation returns trail status from a single Region. To return trail status from all
      # Regions, you must call the operation on each Region.

      def get_trail_status(
        name : String
      ) : Types::GetTrailStatusResponse

        input = Types::GetTrailStatusRequest.new(name: name)
        get_trail_status(input)
      end

      def get_trail_status(input : Types::GetTrailStatusRequest) : Types::GetTrailStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRAIL_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTrailStatusResponse, "GetTrailStatus")
      end

      # Lists the channels in the current account, and their source names.

      def list_channels(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListChannelsResponse

        input = Types::ListChannelsRequest.new(max_results: max_results, next_token: next_token)
        list_channels(input)
      end

      def list_channels(input : Types::ListChannelsRequest) : Types::ListChannelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CHANNELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListChannelsResponse, "ListChannels")
      end

      # Returns information about all dashboards in the account, in the current Region.

      def list_dashboards(
        max_results : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListDashboardsResponse

        input = Types::ListDashboardsRequest.new(max_results: max_results, name_prefix: name_prefix, next_token: next_token, type: type)
        list_dashboards(input)
      end

      def list_dashboards(input : Types::ListDashboardsRequest) : Types::ListDashboardsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DASHBOARDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDashboardsResponse, "ListDashboards")
      end

      # Returns information about all event data stores in the account, in the current Region.

      def list_event_data_stores(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEventDataStoresResponse

        input = Types::ListEventDataStoresRequest.new(max_results: max_results, next_token: next_token)
        list_event_data_stores(input)
      end

      def list_event_data_stores(input : Types::ListEventDataStoresRequest) : Types::ListEventDataStoresResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENT_DATA_STORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventDataStoresResponse, "ListEventDataStores")
      end

      # Returns a list of failures for the specified import.

      def list_import_failures(
        import_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListImportFailuresResponse

        input = Types::ListImportFailuresRequest.new(import_id: import_id, max_results: max_results, next_token: next_token)
        list_import_failures(input)
      end

      def list_import_failures(input : Types::ListImportFailuresRequest) : Types::ListImportFailuresResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMPORT_FAILURES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImportFailuresResponse, "ListImportFailures")
      end

      # Returns information on all imports, or a select set of imports by ImportStatus or Destination .

      def list_imports(
        destination : String? = nil,
        import_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListImportsResponse

        input = Types::ListImportsRequest.new(destination: destination, import_status: import_status, max_results: max_results, next_token: next_token)
        list_imports(input)
      end

      def list_imports(input : Types::ListImportsRequest) : Types::ListImportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImportsResponse, "ListImports")
      end

      # Returns Insights events generated on a trail that logs data events. You can list Insights events
      # that occurred in a Region within the last 90 days. ListInsightsData supports the following
      # Dimensions for Insights events: Event ID Event name Event source All dimensions are optional. The
      # default number of results returned is 50, with a maximum of 50 possible. The response includes a
      # token that you can use to get the next page of results. The rate of ListInsightsData requests is
      # limited to two per second, per account, per Region. If this limit is exceeded, a throttling error
      # occurs.

      def list_insights_data(
        data_type : String,
        insight_source : String,
        dimensions : Hash(String, String)? = nil,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::ListInsightsDataResponse

        input = Types::ListInsightsDataRequest.new(data_type: data_type, insight_source: insight_source, dimensions: dimensions, end_time: end_time, max_results: max_results, next_token: next_token, start_time: start_time)
        list_insights_data(input)
      end

      def list_insights_data(input : Types::ListInsightsDataRequest) : Types::ListInsightsDataResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INSIGHTS_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInsightsDataResponse, "ListInsightsData")
      end

      # Returns Insights metrics data for trails that have enabled Insights. The request must include the
      # EventSource , EventName , and InsightType parameters. If the InsightType is set to
      # ApiErrorRateInsight , the request must also include the ErrorCode parameter. The following are the
      # available time periods for ListInsightsMetricData . Each cutoff is inclusive. Data points with a
      # period of 60 seconds (1-minute) are available for 15 days. Data points with a period of 300 seconds
      # (5-minute) are available for 63 days. Data points with a period of 3600 seconds (1 hour) are
      # available for 90 days. To use ListInsightsMetricData operation, you must have the following
      # permissions: If ListInsightsMetricData is invoked with TrailName parameter, access to the
      # ListInsightsMetricData API operation is linked to the cloudtrail:LookupEvents action and
      # cloudtrail:ListInsightsData . To use this operation, you must have permissions to perform the
      # cloudtrail:LookupEvents and cloudtrail:ListInsightsData action on the specific trail. If
      # ListInsightsMetricData is invoked without TrailName parameter, access to the ListInsightsMetricData
      # API operation is linked to the cloudtrail:LookupEvents action only. To use this operation, you must
      # have permissions to perform the cloudtrail:LookupEvents action.

      def list_insights_metric_data(
        event_name : String,
        event_source : String,
        insight_type : String,
        data_type : String? = nil,
        end_time : Time? = nil,
        error_code : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        period : Int32? = nil,
        start_time : Time? = nil,
        trail_name : String? = nil
      ) : Types::ListInsightsMetricDataResponse

        input = Types::ListInsightsMetricDataRequest.new(event_name: event_name, event_source: event_source, insight_type: insight_type, data_type: data_type, end_time: end_time, error_code: error_code, max_results: max_results, next_token: next_token, period: period, start_time: start_time, trail_name: trail_name)
        list_insights_metric_data(input)
      end

      def list_insights_metric_data(input : Types::ListInsightsMetricDataRequest) : Types::ListInsightsMetricDataResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INSIGHTS_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInsightsMetricDataResponse, "ListInsightsMetricData")
      end

      # Returns all public keys whose private keys were used to sign the digest files within the specified
      # time range. The public key is needed to validate digest files that were signed with its
      # corresponding private key. CloudTrail uses different private and public key pairs per Region. Each
      # digest file is signed with a private key unique to its Region. When you validate a digest file from
      # a specific Region, you must look in the same Region for its corresponding public key.

      def list_public_keys(
        end_time : Time? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::ListPublicKeysResponse

        input = Types::ListPublicKeysRequest.new(end_time: end_time, next_token: next_token, start_time: start_time)
        list_public_keys(input)
      end

      def list_public_keys(input : Types::ListPublicKeysRequest) : Types::ListPublicKeysResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PUBLIC_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPublicKeysResponse, "ListPublicKeys")
      end

      # Returns a list of queries and query statuses for the past seven days. You must specify an ARN value
      # for EventDataStore . Optionally, to shorten the list of results, you can specify a time range,
      # formatted as timestamps, by adding StartTime and EndTime parameters, and a QueryStatus value. Valid
      # values for QueryStatus include QUEUED , RUNNING , FINISHED , FAILED , TIMED_OUT , or CANCELLED .

      def list_queries(
        event_data_store : String,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_status : String? = nil,
        start_time : Time? = nil
      ) : Types::ListQueriesResponse

        input = Types::ListQueriesRequest.new(event_data_store: event_data_store, end_time: end_time, max_results: max_results, next_token: next_token, query_status: query_status, start_time: start_time)
        list_queries(input)
      end

      def list_queries(input : Types::ListQueriesRequest) : Types::ListQueriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_QUERIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQueriesResponse, "ListQueries")
      end

      # Lists the tags for the specified trails, event data stores, dashboards, or channels in the current
      # Region.

      def list_tags(
        resource_id_list : Array(String),
        next_token : String? = nil
      ) : Types::ListTagsResponse

        input = Types::ListTagsRequest.new(resource_id_list: resource_id_list, next_token: next_token)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsRequest) : Types::ListTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsResponse, "ListTags")
      end

      # Lists trails that are in the current account.

      def list_trails(
        next_token : String? = nil
      ) : Types::ListTrailsResponse

        input = Types::ListTrailsRequest.new(next_token: next_token)
        list_trails(input)
      end

      def list_trails(input : Types::ListTrailsRequest) : Types::ListTrailsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrailsResponse, "ListTrails")
      end

      # Looks up management events or CloudTrail Insights events that are captured by CloudTrail. You can
      # look up events that occurred in a Region within the last 90 days. LookupEvents returns recent
      # Insights events for trails that enable Insights. To view Insights events for an event data store,
      # you can run queries on your Insights event data store, and you can also view the Lake dashboard for
      # Insights. Lookup supports the following attributes for management events: Amazon Web Services access
      # key Event ID Event name Event source Read only Resource name Resource type User name Lookup supports
      # the following attributes for Insights events: Event ID Event name Event source All attributes are
      # optional. The default number of results returned is 50, with a maximum of 50 possible. The response
      # includes a token that you can use to get the next page of results. The rate of lookup requests is
      # limited to two per second, per account, per Region. If this limit is exceeded, a throttling error
      # occurs.

      def lookup_events(
        end_time : Time? = nil,
        event_category : String? = nil,
        lookup_attributes : Array(Types::LookupAttribute)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::LookupEventsResponse

        input = Types::LookupEventsRequest.new(end_time: end_time, event_category: event_category, lookup_attributes: lookup_attributes, max_results: max_results, next_token: next_token, start_time: start_time)
        lookup_events(input)
      end

      def lookup_events(input : Types::LookupEventsRequest) : Types::LookupEventsResponse
        request = Protocol::JsonRpc.build_request(Model::LOOKUP_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::LookupEventsResponse, "LookupEvents")
      end

      # Updates the event configuration settings for the specified event data store or trail. This operation
      # supports updating the maximum event size, adding or modifying context key selectors for event data
      # store, and configuring aggregation settings for the trail.

      def put_event_configuration(
        aggregation_configurations : Array(Types::AggregationConfiguration)? = nil,
        context_key_selectors : Array(Types::ContextKeySelector)? = nil,
        event_data_store : String? = nil,
        max_event_size : String? = nil,
        trail_name : String? = nil
      ) : Types::PutEventConfigurationResponse

        input = Types::PutEventConfigurationRequest.new(aggregation_configurations: aggregation_configurations, context_key_selectors: context_key_selectors, event_data_store: event_data_store, max_event_size: max_event_size, trail_name: trail_name)
        put_event_configuration(input)
      end

      def put_event_configuration(input : Types::PutEventConfigurationRequest) : Types::PutEventConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EVENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEventConfigurationResponse, "PutEventConfiguration")
      end

      # Configures event selectors (also referred to as basic event selectors ) or advanced event selectors
      # for your trail. You can use either AdvancedEventSelectors or EventSelectors , but not both. If you
      # apply AdvancedEventSelectors to a trail, any existing EventSelectors are overwritten. You can use
      # AdvancedEventSelectors to log management events, data events for all resource types, and network
      # activity events. You can use EventSelectors to log management events and data events for the
      # following resource types: AWS::DynamoDB::Table AWS::Lambda::Function AWS::S3::Object You can't use
      # EventSelectors to log network activity events. If you want your trail to log Insights events, be
      # sure the event selector or advanced event selector enables logging of the Insights event types you
      # want configured for your trail. For more information about logging Insights events, see Working with
      # CloudTrail Insights in the CloudTrail User Guide . By default, trails created without specific event
      # selectors are configured to log all read and write management events, and no data events or network
      # activity events. When an event occurs in your account, CloudTrail evaluates the event selectors or
      # advanced event selectors in all trails. For each trail, if the event matches any event selector, the
      # trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't
      # log the event. Example You create an event selector for a trail and specify that you want to log
      # write-only events. The EC2 GetConsoleOutput and RunInstances API operations occur in your account.
      # CloudTrail evaluates whether the events match your event selectors. The RunInstances is a write-only
      # event and it matches your event selector. The trail logs the event. The GetConsoleOutput is a
      # read-only event that doesn't match your event selector. The trail doesn't log the event. The
      # PutEventSelectors operation must be called from the Region in which the trail was created;
      # otherwise, an InvalidHomeRegionException exception is thrown. You can configure up to five event
      # selectors for each trail. You can add advanced event selectors, and conditions for your advanced
      # event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. For more
      # information, see Logging management events , Logging data events , Logging network activity events ,
      # and Quotas in CloudTrail in the CloudTrail User Guide .

      def put_event_selectors(
        trail_name : String,
        advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
        event_selectors : Array(Types::EventSelector)? = nil
      ) : Types::PutEventSelectorsResponse

        input = Types::PutEventSelectorsRequest.new(trail_name: trail_name, advanced_event_selectors: advanced_event_selectors, event_selectors: event_selectors)
        put_event_selectors(input)
      end

      def put_event_selectors(input : Types::PutEventSelectorsRequest) : Types::PutEventSelectorsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EVENT_SELECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEventSelectorsResponse, "PutEventSelectors")
      end

      # Lets you enable Insights event logging on specific event categories by specifying the Insights
      # selectors that you want to enable on an existing trail or event data store. You also use
      # PutInsightSelectors to turn off Insights event logging, by passing an empty list of Insights types.
      # The valid Insights event types are ApiErrorRateInsight and ApiCallRateInsight , and valid
      # EventCategories are Management and Data . Insights on data events are not supported on event data
      # stores. For event data stores, you can only enable Insights on management events. To enable Insights
      # on an event data store, you must specify the ARNs (or ID suffix of the ARNs) for the source event
      # data store ( EventDataStore ) and the destination event data store ( InsightsDestination ). The
      # source event data store logs management events and enables Insights. The destination event data
      # store logs Insights events based upon the management event activity of the source event data store.
      # The source and destination event data stores must belong to the same Amazon Web Services account. To
      # log Insights events for a trail, you must specify the name ( TrailName ) of the CloudTrail trail for
      # which you want to change or add Insights selectors. For Management events Insights: To log
      # CloudTrail Insights on the API call rate, the trail or event data store must log write management
      # events. To log CloudTrail Insights on the API error rate, the trail or event data store must log
      # read or write management events. For Data events Insights: To log CloudTrail Insights on the API
      # call rate or API error rate, the trail must log read or write data events. Data events Insights are
      # not supported on event data store. To log CloudTrail Insights events on API call volume, the trail
      # or event data store must log write management events. To log CloudTrail Insights events on API error
      # rate, the trail or event data store must log read or write management events. You can call
      # GetEventSelectors on a trail to check whether the trail logs management events. You can call
      # GetEventDataStore on an event data store to check whether the event data store logs management
      # events. For more information, see Working with CloudTrail Insights in the CloudTrail User Guide .

      def put_insight_selectors(
        insight_selectors : Array(Types::InsightSelector),
        event_data_store : String? = nil,
        insights_destination : String? = nil,
        trail_name : String? = nil
      ) : Types::PutInsightSelectorsResponse

        input = Types::PutInsightSelectorsRequest.new(insight_selectors: insight_selectors, event_data_store: event_data_store, insights_destination: insights_destination, trail_name: trail_name)
        put_insight_selectors(input)
      end

      def put_insight_selectors(input : Types::PutInsightSelectorsRequest) : Types::PutInsightSelectorsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_INSIGHT_SELECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutInsightSelectorsResponse, "PutInsightSelectors")
      end

      # Attaches a resource-based permission policy to a CloudTrail event data store, dashboard, or channel.
      # For more information about resource-based policies, see CloudTrail resource-based policy examples in
      # the CloudTrail User Guide .

      def put_resource_policy(
        resource_arn : String,
        resource_policy : String
      ) : Types::PutResourcePolicyResponse

        input = Types::PutResourcePolicyRequest.new(resource_arn: resource_arn, resource_policy: resource_policy)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Registers an organization’s member account as the CloudTrail delegated administrator .

      def register_organization_delegated_admin(
        member_account_id : String
      ) : Types::RegisterOrganizationDelegatedAdminResponse

        input = Types::RegisterOrganizationDelegatedAdminRequest.new(member_account_id: member_account_id)
        register_organization_delegated_admin(input)
      end

      def register_organization_delegated_admin(input : Types::RegisterOrganizationDelegatedAdminRequest) : Types::RegisterOrganizationDelegatedAdminResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_ORGANIZATION_DELEGATED_ADMIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterOrganizationDelegatedAdminResponse, "RegisterOrganizationDelegatedAdmin")
      end

      # Removes the specified tags from a trail, event data store, dashboard, or channel.

      def remove_tags(
        resource_id : String,
        tags_list : Array(Types::Tag)
      ) : Types::RemoveTagsResponse

        input = Types::RemoveTagsRequest.new(resource_id: resource_id, tags_list: tags_list)
        remove_tags(input)
      end

      def remove_tags(input : Types::RemoveTagsRequest) : Types::RemoveTagsResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsResponse, "RemoveTags")
      end

      # Restores a deleted event data store specified by EventDataStore , which accepts an event data store
      # ARN. You can only restore a deleted event data store within the seven-day wait period after
      # deletion. Restoring an event data store can take several minutes, depending on the size of the event
      # data store.

      def restore_event_data_store(
        event_data_store : String
      ) : Types::RestoreEventDataStoreResponse

        input = Types::RestoreEventDataStoreRequest.new(event_data_store: event_data_store)
        restore_event_data_store(input)
      end

      def restore_event_data_store(input : Types::RestoreEventDataStoreRequest) : Types::RestoreEventDataStoreResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_EVENT_DATA_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreEventDataStoreResponse, "RestoreEventDataStore")
      end

      # Searches sample queries and returns a list of sample queries that are sorted by relevance. To search
      # for sample queries, provide a natural language SearchPhrase in English.

      def search_sample_queries(
        search_phrase : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::SearchSampleQueriesResponse

        input = Types::SearchSampleQueriesRequest.new(search_phrase: search_phrase, max_results: max_results, next_token: next_token)
        search_sample_queries(input)
      end

      def search_sample_queries(input : Types::SearchSampleQueriesRequest) : Types::SearchSampleQueriesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_SAMPLE_QUERIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchSampleQueriesResponse, "SearchSampleQueries")
      end

      # Starts a refresh of the specified dashboard. Each time a dashboard is refreshed, CloudTrail runs
      # queries to populate the dashboard's widgets. CloudTrail must be granted permissions to run the
      # StartQuery operation on your behalf. To provide permissions, run the PutResourcePolicy operation to
      # attach a resource-based policy to each event data store. For more information, see Example: Allow
      # CloudTrail to run queries to populate a dashboard in the CloudTrail User Guide .

      def start_dashboard_refresh(
        dashboard_id : String,
        query_parameter_values : Hash(String, String)? = nil
      ) : Types::StartDashboardRefreshResponse

        input = Types::StartDashboardRefreshRequest.new(dashboard_id: dashboard_id, query_parameter_values: query_parameter_values)
        start_dashboard_refresh(input)
      end

      def start_dashboard_refresh(input : Types::StartDashboardRefreshRequest) : Types::StartDashboardRefreshResponse
        request = Protocol::JsonRpc.build_request(Model::START_DASHBOARD_REFRESH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDashboardRefreshResponse, "StartDashboardRefresh")
      end

      # Starts the ingestion of live events on an event data store specified as either an ARN or the ID
      # portion of the ARN. To start ingestion, the event data store Status must be STOPPED_INGESTION and
      # the eventCategory must be Management , Data , NetworkActivity , or ConfigurationItem .

      def start_event_data_store_ingestion(
        event_data_store : String
      ) : Types::StartEventDataStoreIngestionResponse

        input = Types::StartEventDataStoreIngestionRequest.new(event_data_store: event_data_store)
        start_event_data_store_ingestion(input)
      end

      def start_event_data_store_ingestion(input : Types::StartEventDataStoreIngestionRequest) : Types::StartEventDataStoreIngestionResponse
        request = Protocol::JsonRpc.build_request(Model::START_EVENT_DATA_STORE_INGESTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEventDataStoreIngestionResponse, "StartEventDataStoreIngestion")
      end

      # Starts an import of logged trail events from a source S3 bucket to a destination event data store.
      # By default, CloudTrail only imports events contained in the S3 bucket's CloudTrail prefix and the
      # prefixes inside the CloudTrail prefix, and does not check prefixes for other Amazon Web Services
      # services. If you want to import CloudTrail events contained in another prefix, you must include the
      # prefix in the S3LocationUri . For more considerations about importing trail events, see
      # Considerations for copying trail events in the CloudTrail User Guide . When you start a new import,
      # the Destinations and ImportSource parameters are required. Before starting a new import, disable any
      # access control lists (ACLs) attached to the source S3 bucket. For more information about disabling
      # ACLs, see Controlling ownership of objects and disabling ACLs for your bucket . When you retry an
      # import, the ImportID parameter is required. If the destination event data store is for an
      # organization, you must use the management account to import trail events. You cannot use the
      # delegated administrator account for the organization.

      def start_import(
        destinations : Array(String)? = nil,
        end_event_time : Time? = nil,
        import_id : String? = nil,
        import_source : Types::ImportSource? = nil,
        start_event_time : Time? = nil
      ) : Types::StartImportResponse

        input = Types::StartImportRequest.new(destinations: destinations, end_event_time: end_event_time, import_id: import_id, import_source: import_source, start_event_time: start_event_time)
        start_import(input)
      end

      def start_import(input : Types::StartImportRequest) : Types::StartImportResponse
        request = Protocol::JsonRpc.build_request(Model::START_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartImportResponse, "StartImport")
      end

      # Starts the recording of Amazon Web Services API calls and log file delivery for a trail. For a trail
      # that is enabled in all Regions, this operation must be called from the Region in which the trail was
      # created. This operation cannot be called on the shadow trails (replicated trails in other Regions)
      # of a trail that is enabled in all Regions.

      def start_logging(
        name : String
      ) : Types::StartLoggingResponse

        input = Types::StartLoggingRequest.new(name: name)
        start_logging(input)
      end

      def start_logging(input : Types::StartLoggingRequest) : Types::StartLoggingResponse
        request = Protocol::JsonRpc.build_request(Model::START_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartLoggingResponse, "StartLogging")
      end

      # Starts a CloudTrail Lake query. Use the QueryStatement parameter to provide your SQL query, enclosed
      # in single quotation marks. Use the optional DeliveryS3Uri parameter to deliver the query results to
      # an S3 bucket. StartQuery requires you specify either the QueryStatement parameter, or a QueryAlias
      # and any QueryParameters . In the current release, the QueryAlias and QueryParameters parameters are
      # used only for the queries that populate the CloudTrail Lake dashboards.

      def start_query(
        delivery_s3_uri : String? = nil,
        event_data_store_owner_account_id : String? = nil,
        query_alias : String? = nil,
        query_parameters : Array(String)? = nil,
        query_statement : String? = nil
      ) : Types::StartQueryResponse

        input = Types::StartQueryRequest.new(delivery_s3_uri: delivery_s3_uri, event_data_store_owner_account_id: event_data_store_owner_account_id, query_alias: query_alias, query_parameters: query_parameters, query_statement: query_statement)
        start_query(input)
      end

      def start_query(input : Types::StartQueryRequest) : Types::StartQueryResponse
        request = Protocol::JsonRpc.build_request(Model::START_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartQueryResponse, "StartQuery")
      end

      # Stops the ingestion of live events on an event data store specified as either an ARN or the ID
      # portion of the ARN. To stop ingestion, the event data store Status must be ENABLED and the
      # eventCategory must be Management , Data , NetworkActivity , or ConfigurationItem .

      def stop_event_data_store_ingestion(
        event_data_store : String
      ) : Types::StopEventDataStoreIngestionResponse

        input = Types::StopEventDataStoreIngestionRequest.new(event_data_store: event_data_store)
        stop_event_data_store_ingestion(input)
      end

      def stop_event_data_store_ingestion(input : Types::StopEventDataStoreIngestionRequest) : Types::StopEventDataStoreIngestionResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_EVENT_DATA_STORE_INGESTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopEventDataStoreIngestionResponse, "StopEventDataStoreIngestion")
      end

      # Stops a specified import.

      def stop_import(
        import_id : String
      ) : Types::StopImportResponse

        input = Types::StopImportRequest.new(import_id: import_id)
        stop_import(input)
      end

      def stop_import(input : Types::StopImportRequest) : Types::StopImportResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopImportResponse, "StopImport")
      end

      # Suspends the recording of Amazon Web Services API calls and log file delivery for the specified
      # trail. Under most circumstances, there is no need to use this action. You can update a trail without
      # stopping it first. This action is the only way to stop recording. For a trail enabled in all
      # Regions, this operation must be called from the Region in which the trail was created, or an
      # InvalidHomeRegionException will occur. This operation cannot be called on the shadow trails
      # (replicated trails in other Regions) of a trail enabled in all Regions.

      def stop_logging(
        name : String
      ) : Types::StopLoggingResponse

        input = Types::StopLoggingRequest.new(name: name)
        stop_logging(input)
      end

      def stop_logging(input : Types::StopLoggingRequest) : Types::StopLoggingResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopLoggingResponse, "StopLogging")
      end

      # Updates a channel specified by a required channel ARN or UUID.

      def update_channel(
        channel : String,
        destinations : Array(Types::Destination)? = nil,
        name : String? = nil
      ) : Types::UpdateChannelResponse

        input = Types::UpdateChannelRequest.new(channel: channel, destinations: destinations, name: name)
        update_channel(input)
      end

      def update_channel(input : Types::UpdateChannelRequest) : Types::UpdateChannelResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateChannelResponse, "UpdateChannel")
      end

      # Updates the specified dashboard. To set a refresh schedule, CloudTrail must be granted permissions
      # to run the StartDashboardRefresh operation to refresh the dashboard on your behalf. To provide
      # permissions, run the PutResourcePolicy operation to attach a resource-based policy to the dashboard.
      # For more information, see Resource-based policy example for a dashboard in the CloudTrail User Guide
      # . CloudTrail runs queries to populate the dashboard's widgets during a manual or scheduled refresh.
      # CloudTrail must be granted permissions to run the StartQuery operation on your behalf. To provide
      # permissions, run the PutResourcePolicy operation to attach a resource-based policy to each event
      # data store. For more information, see Example: Allow CloudTrail to run queries to populate a
      # dashboard in the CloudTrail User Guide .

      def update_dashboard(
        dashboard_id : String,
        refresh_schedule : Types::RefreshSchedule? = nil,
        termination_protection_enabled : Bool? = nil,
        widgets : Array(Types::RequestWidget)? = nil
      ) : Types::UpdateDashboardResponse

        input = Types::UpdateDashboardRequest.new(dashboard_id: dashboard_id, refresh_schedule: refresh_schedule, termination_protection_enabled: termination_protection_enabled, widgets: widgets)
        update_dashboard(input)
      end

      def update_dashboard(input : Types::UpdateDashboardRequest) : Types::UpdateDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDashboardResponse, "UpdateDashboard")
      end

      # Updates an event data store. The required EventDataStore value is an ARN or the ID portion of the
      # ARN. Other parameters are optional, but at least one optional parameter must be specified, or
      # CloudTrail throws an error. RetentionPeriod is in days, and valid values are integers between 7 and
      # 3653 if the BillingMode is set to EXTENDABLE_RETENTION_PRICING , or between 7 and 2557 if
      # BillingMode is set to FIXED_RETENTION_PRICING . By default, TerminationProtection is enabled. For
      # event data stores for CloudTrail events, AdvancedEventSelectors includes or excludes management,
      # data, or network activity events in your event data store. For more information about
      # AdvancedEventSelectors , see AdvancedEventSelectors . For event data stores for CloudTrail Insights
      # events, Config configuration items, Audit Manager evidence, or non-Amazon Web Services events,
      # AdvancedEventSelectors includes events of that type in your event data store.

      def update_event_data_store(
        event_data_store : String,
        advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
        billing_mode : String? = nil,
        kms_key_id : String? = nil,
        multi_region_enabled : Bool? = nil,
        name : String? = nil,
        organization_enabled : Bool? = nil,
        retention_period : Int32? = nil,
        termination_protection_enabled : Bool? = nil
      ) : Types::UpdateEventDataStoreResponse

        input = Types::UpdateEventDataStoreRequest.new(event_data_store: event_data_store, advanced_event_selectors: advanced_event_selectors, billing_mode: billing_mode, kms_key_id: kms_key_id, multi_region_enabled: multi_region_enabled, name: name, organization_enabled: organization_enabled, retention_period: retention_period, termination_protection_enabled: termination_protection_enabled)
        update_event_data_store(input)
      end

      def update_event_data_store(input : Types::UpdateEventDataStoreRequest) : Types::UpdateEventDataStoreResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EVENT_DATA_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEventDataStoreResponse, "UpdateEventDataStore")
      end

      # Updates trail settings that control what events you are logging, and how to handle log files.
      # Changes to a trail do not require stopping the CloudTrail service. Use this action to designate an
      # existing bucket for log delivery. If the existing bucket has previously been a target for CloudTrail
      # log files, an IAM policy exists for the bucket. UpdateTrail must be called from the Region in which
      # the trail was created; otherwise, an InvalidHomeRegionException is thrown.

      def update_trail(
        name : String,
        cloud_watch_logs_log_group_arn : String? = nil,
        cloud_watch_logs_role_arn : String? = nil,
        enable_log_file_validation : Bool? = nil,
        include_global_service_events : Bool? = nil,
        is_multi_region_trail : Bool? = nil,
        is_organization_trail : Bool? = nil,
        kms_key_id : String? = nil,
        s3_bucket_name : String? = nil,
        s3_key_prefix : String? = nil,
        sns_topic_name : String? = nil
      ) : Types::UpdateTrailResponse

        input = Types::UpdateTrailRequest.new(name: name, cloud_watch_logs_log_group_arn: cloud_watch_logs_log_group_arn, cloud_watch_logs_role_arn: cloud_watch_logs_role_arn, enable_log_file_validation: enable_log_file_validation, include_global_service_events: include_global_service_events, is_multi_region_trail: is_multi_region_trail, is_organization_trail: is_organization_trail, kms_key_id: kms_key_id, s3_bucket_name: s3_bucket_name, s3_key_prefix: s3_key_prefix, sns_topic_name: sns_topic_name)
        update_trail(input)
      end

      def update_trail(input : Types::UpdateTrailRequest) : Types::UpdateTrailResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrailResponse, "UpdateTrail")
      end
    end
  end
end
