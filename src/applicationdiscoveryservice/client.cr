module Aws
  module ApplicationDiscoveryService
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

      # Associates one or more configuration items with an application.

      def associate_configuration_items_to_application(
        application_configuration_id : String,
        configuration_ids : Array(String)
      ) : Types::AssociateConfigurationItemsToApplicationResponse

        input = Types::AssociateConfigurationItemsToApplicationRequest.new(application_configuration_id: application_configuration_id, configuration_ids: configuration_ids)
        associate_configuration_items_to_application(input)
      end

      def associate_configuration_items_to_application(input : Types::AssociateConfigurationItemsToApplicationRequest) : Types::AssociateConfigurationItemsToApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_CONFIGURATION_ITEMS_TO_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateConfigurationItemsToApplicationResponse, "AssociateConfigurationItemsToApplication")
      end

      # Deletes one or more agents or collectors as specified by ID. Deleting an agent or collector does not
      # delete the previously discovered data. To delete the data collected, use
      # StartBatchDeleteConfigurationTask .

      def batch_delete_agents(
        delete_agents : Array(Types::DeleteAgent)
      ) : Types::BatchDeleteAgentsResponse

        input = Types::BatchDeleteAgentsRequest.new(delete_agents: delete_agents)
        batch_delete_agents(input)
      end

      def batch_delete_agents(input : Types::BatchDeleteAgentsRequest) : Types::BatchDeleteAgentsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_AGENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteAgentsResponse, "BatchDeleteAgents")
      end

      # Deletes one or more import tasks, each identified by their import ID. Each import task has a number
      # of records that can identify servers or applications. Amazon Web Services Application Discovery
      # Service has built-in matching logic that will identify when discovered servers match existing
      # entries that you've previously discovered, the information for the already-existing discovered
      # server is updated. When you delete an import task that contains records that were used to match, the
      # information in those matched records that comes from the deleted records will also be deleted.

      def batch_delete_import_data(
        import_task_ids : Array(String),
        delete_history : Bool? = nil
      ) : Types::BatchDeleteImportDataResponse

        input = Types::BatchDeleteImportDataRequest.new(import_task_ids: import_task_ids, delete_history: delete_history)
        batch_delete_import_data(input)
      end

      def batch_delete_import_data(input : Types::BatchDeleteImportDataRequest) : Types::BatchDeleteImportDataResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_IMPORT_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteImportDataResponse, "BatchDeleteImportData")
      end

      # Creates an application with the given name and description.

      def create_application(
        name : String,
        description : String? = nil,
        wave : String? = nil
      ) : Types::CreateApplicationResponse

        input = Types::CreateApplicationRequest.new(name: name, description: description, wave: wave)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResponse, "CreateApplication")
      end

      # Creates one or more tags for configuration items. Tags are metadata that help you categorize IT
      # assets. This API accepts a list of multiple configuration items. Do not store sensitive information
      # (like personal data) in tags.

      def create_tags(
        configuration_ids : Array(String),
        tags : Array(Types::Tag)
      ) : Types::CreateTagsResponse

        input = Types::CreateTagsRequest.new(configuration_ids: configuration_ids, tags: tags)
        create_tags(input)
      end

      def create_tags(input : Types::CreateTagsRequest) : Types::CreateTagsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTagsResponse, "CreateTags")
      end

      # Deletes a list of applications and their associations with configuration items.

      def delete_applications(
        configuration_ids : Array(String)
      ) : Types::DeleteApplicationsResponse

        input = Types::DeleteApplicationsRequest.new(configuration_ids: configuration_ids)
        delete_applications(input)
      end

      def delete_applications(input : Types::DeleteApplicationsRequest) : Types::DeleteApplicationsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationsResponse, "DeleteApplications")
      end

      # Deletes the association between configuration items and one or more tags. This API accepts a list of
      # multiple configuration items.

      def delete_tags(
        configuration_ids : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::DeleteTagsResponse

        input = Types::DeleteTagsRequest.new(configuration_ids: configuration_ids, tags: tags)
        delete_tags(input)
      end

      def delete_tags(input : Types::DeleteTagsRequest) : Types::DeleteTagsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagsResponse, "DeleteTags")
      end

      # Lists agents or collectors as specified by ID or other filters. All agents/collectors associated
      # with your user can be listed if you call DescribeAgents as is without passing any parameters.

      def describe_agents(
        agent_ids : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAgentsResponse

        input = Types::DescribeAgentsRequest.new(agent_ids: agent_ids, filters: filters, max_results: max_results, next_token: next_token)
        describe_agents(input)
      end

      def describe_agents(input : Types::DescribeAgentsRequest) : Types::DescribeAgentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAgentsResponse, "DescribeAgents")
      end

      # Takes a unique deletion task identifier as input and returns metadata about a configuration deletion
      # task.

      def describe_batch_delete_configuration_task(
        task_id : String
      ) : Types::DescribeBatchDeleteConfigurationTaskResponse

        input = Types::DescribeBatchDeleteConfigurationTaskRequest.new(task_id: task_id)
        describe_batch_delete_configuration_task(input)
      end

      def describe_batch_delete_configuration_task(input : Types::DescribeBatchDeleteConfigurationTaskRequest) : Types::DescribeBatchDeleteConfigurationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BATCH_DELETE_CONFIGURATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBatchDeleteConfigurationTaskResponse, "DescribeBatchDeleteConfigurationTask")
      end

      # Retrieves attributes for a list of configuration item IDs. All of the supplied IDs must be for the
      # same asset type from one of the following: server application process connection Output fields are
      # specific to the asset type specified. For example, the output for a server configuration item
      # includes a list of attributes about the server, such as host name, operating system, number of
      # network cards, etc. For a complete list of outputs for each asset type, see Using the
      # DescribeConfigurations Action in the Amazon Web Services Application Discovery Service User Guide .

      def describe_configurations(
        configuration_ids : Array(String)
      ) : Types::DescribeConfigurationsResponse

        input = Types::DescribeConfigurationsRequest.new(configuration_ids: configuration_ids)
        describe_configurations(input)
      end

      def describe_configurations(input : Types::DescribeConfigurationsRequest) : Types::DescribeConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationsResponse, "DescribeConfigurations")
      end

      # Lists exports as specified by ID. All continuous exports associated with your user can be listed if
      # you call DescribeContinuousExports as is without passing any parameters.

      def describe_continuous_exports(
        export_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeContinuousExportsResponse

        input = Types::DescribeContinuousExportsRequest.new(export_ids: export_ids, max_results: max_results, next_token: next_token)
        describe_continuous_exports(input)
      end

      def describe_continuous_exports(input : Types::DescribeContinuousExportsRequest) : Types::DescribeContinuousExportsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTINUOUS_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContinuousExportsResponse, "DescribeContinuousExports")
      end

      # DescribeExportConfigurations is deprecated. Use DescribeExportTasks , instead.

      def describe_export_configurations(
        export_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeExportConfigurationsResponse

        input = Types::DescribeExportConfigurationsRequest.new(export_ids: export_ids, max_results: max_results, next_token: next_token)
        describe_export_configurations(input)
      end

      def describe_export_configurations(input : Types::DescribeExportConfigurationsRequest) : Types::DescribeExportConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPORT_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExportConfigurationsResponse, "DescribeExportConfigurations")
      end

      # Retrieve status of one or more export tasks. You can retrieve the status of up to 100 export tasks.

      def describe_export_tasks(
        export_ids : Array(String)? = nil,
        filters : Array(Types::ExportFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeExportTasksResponse

        input = Types::DescribeExportTasksRequest.new(export_ids: export_ids, filters: filters, max_results: max_results, next_token: next_token)
        describe_export_tasks(input)
      end

      def describe_export_tasks(input : Types::DescribeExportTasksRequest) : Types::DescribeExportTasksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPORT_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExportTasksResponse, "DescribeExportTasks")
      end

      # Returns an array of import tasks for your account, including status information, times, IDs, the
      # Amazon S3 Object URL for the import file, and more.

      def describe_import_tasks(
        filters : Array(Types::ImportTaskFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeImportTasksResponse

        input = Types::DescribeImportTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_import_tasks(input)
      end

      def describe_import_tasks(input : Types::DescribeImportTasksRequest) : Types::DescribeImportTasksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMPORT_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImportTasksResponse, "DescribeImportTasks")
      end

      # Retrieves a list of configuration items that have tags as specified by the key-value pairs, name and
      # value, passed to the optional parameter filters . There are three valid tag filter names: tagKey
      # tagValue configurationId Also, all configuration items associated with your user that have tags can
      # be listed if you call DescribeTags as is without passing any parameters.

      def describe_tags(
        filters : Array(Types::TagFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeTagsResponse

        input = Types::DescribeTagsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsRequest) : Types::DescribeTagsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTagsResponse, "DescribeTags")
      end

      # Disassociates one or more configuration items from an application.

      def disassociate_configuration_items_from_application(
        application_configuration_id : String,
        configuration_ids : Array(String)
      ) : Types::DisassociateConfigurationItemsFromApplicationResponse

        input = Types::DisassociateConfigurationItemsFromApplicationRequest.new(application_configuration_id: application_configuration_id, configuration_ids: configuration_ids)
        disassociate_configuration_items_from_application(input)
      end

      def disassociate_configuration_items_from_application(input : Types::DisassociateConfigurationItemsFromApplicationRequest) : Types::DisassociateConfigurationItemsFromApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_CONFIGURATION_ITEMS_FROM_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateConfigurationItemsFromApplicationResponse, "DisassociateConfigurationItemsFromApplication")
      end

      # Deprecated. Use StartExportTask instead. Exports all discovered configuration data to an Amazon S3
      # bucket or an application that enables you to view and evaluate the data. Data includes tags and tag
      # associations, processes, connections, servers, and system performance. This API returns an export ID
      # that you can query using the DescribeExportConfigurations API. The system imposes a limit of two
      # configuration exports in six hours.


      def export_configurations : Types::ExportConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_CONFIGURATIONS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportConfigurationsResponse, "ExportConfigurations")
      end

      # Retrieves a short summary of discovered assets. This API operation takes no request parameters and
      # is called as is at the command prompt as shown in the example.

      def get_discovery_summary : Types::GetDiscoverySummaryResponse
        input = Types::GetDiscoverySummaryRequest.new
        get_discovery_summary(input)
      end

      def get_discovery_summary(input : Types::GetDiscoverySummaryRequest) : Types::GetDiscoverySummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DISCOVERY_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDiscoverySummaryResponse, "GetDiscoverySummary")
      end

      # Retrieves a list of configuration items as specified by the value passed to the required parameter
      # configurationType . Optional filtering may be applied to refine search results.

      def list_configurations(
        configuration_type : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by : Array(Types::OrderByElement)? = nil
      ) : Types::ListConfigurationsResponse

        input = Types::ListConfigurationsRequest.new(configuration_type: configuration_type, filters: filters, max_results: max_results, next_token: next_token, order_by: order_by)
        list_configurations(input)
      end

      def list_configurations(input : Types::ListConfigurationsRequest) : Types::ListConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConfigurationsResponse, "ListConfigurations")
      end

      # Retrieves a list of servers that are one network hop away from a specified server.

      def list_server_neighbors(
        configuration_id : String,
        max_results : Int32? = nil,
        neighbor_configuration_ids : Array(String)? = nil,
        next_token : String? = nil,
        port_information_needed : Bool? = nil
      ) : Types::ListServerNeighborsResponse

        input = Types::ListServerNeighborsRequest.new(configuration_id: configuration_id, max_results: max_results, neighbor_configuration_ids: neighbor_configuration_ids, next_token: next_token, port_information_needed: port_information_needed)
        list_server_neighbors(input)
      end

      def list_server_neighbors(input : Types::ListServerNeighborsRequest) : Types::ListServerNeighborsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVER_NEIGHBORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServerNeighborsResponse, "ListServerNeighbors")
      end

      # Takes a list of configurationId as input and starts an asynchronous deletion task to remove the
      # configurationItems. Returns a unique deletion task identifier.

      def start_batch_delete_configuration_task(
        configuration_ids : Array(String),
        configuration_type : String
      ) : Types::StartBatchDeleteConfigurationTaskResponse

        input = Types::StartBatchDeleteConfigurationTaskRequest.new(configuration_ids: configuration_ids, configuration_type: configuration_type)
        start_batch_delete_configuration_task(input)
      end

      def start_batch_delete_configuration_task(input : Types::StartBatchDeleteConfigurationTaskRequest) : Types::StartBatchDeleteConfigurationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_BATCH_DELETE_CONFIGURATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartBatchDeleteConfigurationTaskResponse, "StartBatchDeleteConfigurationTask")
      end

      # Start the continuous flow of agent's discovered data into Amazon Athena.

      def start_continuous_export : Types::StartContinuousExportResponse
        input = Types::StartContinuousExportRequest.new
        start_continuous_export(input)
      end

      def start_continuous_export(input : Types::StartContinuousExportRequest) : Types::StartContinuousExportResponse
        request = Protocol::JsonRpc.build_request(Model::START_CONTINUOUS_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartContinuousExportResponse, "StartContinuousExport")
      end

      # Instructs the specified agents to start collecting data.

      def start_data_collection_by_agent_ids(
        agent_ids : Array(String)
      ) : Types::StartDataCollectionByAgentIdsResponse

        input = Types::StartDataCollectionByAgentIdsRequest.new(agent_ids: agent_ids)
        start_data_collection_by_agent_ids(input)
      end

      def start_data_collection_by_agent_ids(input : Types::StartDataCollectionByAgentIdsRequest) : Types::StartDataCollectionByAgentIdsResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_COLLECTION_BY_AGENT_IDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataCollectionByAgentIdsResponse, "StartDataCollectionByAgentIds")
      end

      # Begins the export of a discovered data report to an Amazon S3 bucket managed by Amazon Web Services.
      # Exports might provide an estimate of fees and savings based on certain information that you provide.
      # Fee estimates do not include any taxes that might apply. Your actual fees and savings depend on a
      # variety of factors, including your actual usage of Amazon Web Services services, which might vary
      # from the estimates provided in this report. If you do not specify preferences or agentIds in the
      # filter, a summary of all servers, applications, tags, and performance is generated. This data is an
      # aggregation of all server data collected through on-premises tooling, file import, application
      # grouping and applying tags. If you specify agentIds in a filter, the task exports up to 72 hours of
      # detailed data collected by the identified Application Discovery Agent, including network, process,
      # and performance details. A time range for exported agent data may be set by using startTime and
      # endTime . Export of detailed agent data is limited to five concurrently running exports. Export of
      # detailed agent data is limited to two exports per day. If you enable ec2RecommendationsPreferences
      # in preferences , an Amazon EC2 instance matching the characteristics of each server in Application
      # Discovery Service is generated. Changing the attributes of the ec2RecommendationsPreferences changes
      # the criteria of the recommendation.

      def start_export_task(
        end_time : Time? = nil,
        export_data_format : Array(String)? = nil,
        filters : Array(Types::ExportFilter)? = nil,
        preferences : Types::ExportPreferences? = nil,
        start_time : Time? = nil
      ) : Types::StartExportTaskResponse

        input = Types::StartExportTaskRequest.new(end_time: end_time, export_data_format: export_data_format, filters: filters, preferences: preferences, start_time: start_time)
        start_export_task(input)
      end

      def start_export_task(input : Types::StartExportTaskRequest) : Types::StartExportTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_EXPORT_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExportTaskResponse, "StartExportTask")
      end

      # Starts an import task, which allows you to import details of your on-premises environment directly
      # into Amazon Web Services Migration Hub without having to use the Amazon Web Services Application
      # Discovery Service (Application Discovery Service) tools such as the Amazon Web Services Application
      # Discovery Service Agentless Collector or Application Discovery Agent. This gives you the option to
      # perform migration assessment and planning directly from your imported data, including the ability to
      # group your devices as applications and track their migration status. To start an import request, do
      # this: Download the specially formatted comma separated value (CSV) import template, which you can
      # find here:
      # https://s3.us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv
      # . Fill out the template with your server and application data. Upload your import file to an Amazon
      # S3 bucket, and make a note of it's Object URL. Your import file must be in the CSV format. Use the
      # console or the StartImportTask command with the Amazon Web Services CLI or one of the Amazon Web
      # Services SDKs to import the records from your file. For more information, including step-by-step
      # procedures, see Migration Hub Import in the Amazon Web Services Application Discovery Service User
      # Guide . There are limits to the number of import tasks you can create (and delete) in an Amazon Web
      # Services account. For more information, see Amazon Web Services Application Discovery Service Limits
      # in the Amazon Web Services Application Discovery Service User Guide .

      def start_import_task(
        import_url : String,
        name : String,
        client_request_token : String? = nil
      ) : Types::StartImportTaskResponse

        input = Types::StartImportTaskRequest.new(import_url: import_url, name: name, client_request_token: client_request_token)
        start_import_task(input)
      end

      def start_import_task(input : Types::StartImportTaskRequest) : Types::StartImportTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_IMPORT_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartImportTaskResponse, "StartImportTask")
      end

      # Stop the continuous flow of agent's discovered data into Amazon Athena.

      def stop_continuous_export(
        export_id : String
      ) : Types::StopContinuousExportResponse

        input = Types::StopContinuousExportRequest.new(export_id: export_id)
        stop_continuous_export(input)
      end

      def stop_continuous_export(input : Types::StopContinuousExportRequest) : Types::StopContinuousExportResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_CONTINUOUS_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopContinuousExportResponse, "StopContinuousExport")
      end

      # Instructs the specified agents to stop collecting data.

      def stop_data_collection_by_agent_ids(
        agent_ids : Array(String)
      ) : Types::StopDataCollectionByAgentIdsResponse

        input = Types::StopDataCollectionByAgentIdsRequest.new(agent_ids: agent_ids)
        stop_data_collection_by_agent_ids(input)
      end

      def stop_data_collection_by_agent_ids(input : Types::StopDataCollectionByAgentIdsRequest) : Types::StopDataCollectionByAgentIdsResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_DATA_COLLECTION_BY_AGENT_IDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopDataCollectionByAgentIdsResponse, "StopDataCollectionByAgentIds")
      end

      # Updates metadata about an application.

      def update_application(
        configuration_id : String,
        description : String? = nil,
        name : String? = nil,
        wave : String? = nil
      ) : Types::UpdateApplicationResponse

        input = Types::UpdateApplicationRequest.new(configuration_id: configuration_id, description: description, name: name, wave: wave)
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
