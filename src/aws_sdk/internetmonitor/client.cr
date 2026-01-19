module AwsSdk
  module InternetMonitor
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a monitor in Amazon CloudWatch Internet Monitor. A monitor is built based on information
      # from the application resources that you add: VPCs, Network Load Balancers (NLBs), Amazon CloudFront
      # distributions, and Amazon WorkSpaces directories. Internet Monitor then publishes internet
      # measurements from Amazon Web Services that are specific to the city-networks . That is, the
      # locations and ASNs (typically internet service providers or ISPs), where clients access your
      # application. For more information, see Using Amazon CloudWatch Internet Monitor in the Amazon
      # CloudWatch User Guide . When you create a monitor, you choose the percentage of traffic that you
      # want to monitor. You can also set a maximum limit for the number of city-networks where client
      # traffic is monitored, that caps the total traffic that Internet Monitor monitors. A city-network
      # maximum is the limit of city-networks, but you only pay for the number of city-networks that are
      # actually monitored. You can update your monitor at any time to change the percentage of traffic to
      # monitor or the city-networks maximum. For more information, see Choosing a city-network maximum
      # value in the Amazon CloudWatch User Guide .
      def create_monitor(
        monitor_name : String,
        client_token : String? = nil,
        health_events_config : Types::HealthEventsConfig? = nil,
        internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery? = nil,
        max_city_networks_to_monitor : Int32? = nil,
        resources : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        traffic_percentage_to_monitor : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateMonitorInput.new(monitor_name: monitor_name, client_token: client_token, health_events_config: health_events_config, internet_measurements_log_delivery: internet_measurements_log_delivery, max_city_networks_to_monitor: max_city_networks_to_monitor, resources: resources, tags: tags, traffic_percentage_to_monitor: traffic_percentage_to_monitor)
        create_monitor(input)
      end
      def create_monitor(input : Types::CreateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a monitor in Amazon CloudWatch Internet Monitor.
      def delete_monitor(
        monitor_name : String
      ) : Protocol::Request
        input = Types::DeleteMonitorInput.new(monitor_name: monitor_name)
        delete_monitor(input)
      end
      def delete_monitor(input : Types::DeleteMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information that Amazon CloudWatch Internet Monitor has created and stored about a health event
      # for a specified monitor. This information includes the impacted locations, and all the information
      # related to the event, by location. The information returned includes the impact on performance,
      # availability, and round-trip time, information about the network providers (ASNs), the event type,
      # and so on. Information rolled up at the global traffic level is also returned, including the impact
      # type and total traffic impact.
      def get_health_event(
        event_id : String,
        monitor_name : String,
        linked_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetHealthEventInput.new(event_id: event_id, monitor_name: monitor_name, linked_account_id: linked_account_id)
        get_health_event(input)
      end
      def get_health_event(input : Types::GetHealthEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_HEALTH_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information that Amazon CloudWatch Internet Monitor has generated about an internet event.
      # Internet Monitor displays information about recent global health events, called internet events, on
      # a global outages map that is available to all Amazon Web Services customers. The information
      # returned here includes the impacted location, when the event started and (if the event is over)
      # ended, the type of event ( PERFORMANCE or AVAILABILITY ), and the status ( ACTIVE or RESOLVED ).
      def get_internet_event(
        event_id : String
      ) : Protocol::Request
        input = Types::GetInternetEventInput.new(event_id: event_id)
        get_internet_event(input)
      end
      def get_internet_event(input : Types::GetInternetEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTERNET_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a monitor in Amazon CloudWatch Internet Monitor based on a monitor name. The
      # information returned includes the Amazon Resource Name (ARN), create time, modified time, resources
      # included in the monitor, and status information.
      def get_monitor(
        monitor_name : String,
        linked_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetMonitorInput.new(monitor_name: monitor_name, linked_account_id: linked_account_id)
        get_monitor(input)
      end
      def get_monitor(input : Types::GetMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return the data for a query with the Amazon CloudWatch Internet Monitor query interface. Specify the
      # query that you want to return results for by providing a QueryId and a monitor name. For more
      # information about using the query interface, including examples, see Using the Amazon CloudWatch
      # Internet Monitor query interface in the Amazon CloudWatch Internet Monitor User Guide.
      def get_query_results(
        monitor_name : String,
        query_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetQueryResultsInput.new(monitor_name: monitor_name, query_id: query_id, max_results: max_results, next_token: next_token)
        get_query_results(input)
      end
      def get_query_results(input : Types::GetQueryResultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current status of a query for the Amazon CloudWatch Internet Monitor query interface,
      # for a specified query ID and monitor. When you run a query, check the status to make sure that the
      # query has SUCCEEDED before you review the results. QUEUED : The query is scheduled to run. RUNNING :
      # The query is in progress but not complete. SUCCEEDED : The query completed sucessfully. FAILED : The
      # query failed due to an error. CANCELED : The query was canceled.
      def get_query_status(
        monitor_name : String,
        query_id : String
      ) : Protocol::Request
        input = Types::GetQueryStatusInput.new(monitor_name: monitor_name, query_id: query_id)
        get_query_status(input)
      end
      def get_query_status(input : Types::GetQueryStatusInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all health events for a monitor in Amazon CloudWatch Internet Monitor. Returns information for
      # health events including the event start and end times, and the status. Health events that have start
      # times during the time frame that is requested are not included in the list of health events.
      def list_health_events(
        monitor_name : String,
        end_time : Time? = nil,
        event_status : String? = nil,
        linked_account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListHealthEventsInput.new(monitor_name: monitor_name, end_time: end_time, event_status: event_status, linked_account_id: linked_account_id, max_results: max_results, next_token: next_token, start_time: start_time)
        list_health_events(input)
      end
      def list_health_events(input : Types::ListHealthEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HEALTH_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists internet events that cause performance or availability issues for client locations. Amazon
      # CloudWatch Internet Monitor displays information about recent global health events, called internet
      # events, on a global outages map that is available to all Amazon Web Services customers. You can
      # constrain the list of internet events returned by providing a start time and end time to define a
      # total time frame for events you want to list. Both start time and end time specify the time when an
      # event started. End time is optional. If you don't include it, the default end time is the current
      # time. You can also limit the events returned to a specific status ( ACTIVE or RESOLVED ) or type (
      # PERFORMANCE or AVAILABILITY ).
      def list_internet_events(
        end_time : Time? = nil,
        event_status : String? = nil,
        event_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListInternetEventsInput.new(end_time: end_time, event_status: event_status, event_type: event_type, max_results: max_results, next_token: next_token, start_time: start_time)
        list_internet_events(input)
      end
      def list_internet_events(input : Types::ListInternetEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTERNET_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of your monitors for Amazon CloudWatch Internet Monitor and their statuses, along with the
      # Amazon Resource Name (ARN) and name of each monitor.
      def list_monitors(
        include_linked_accounts : Bool? = nil,
        max_results : Int32? = nil,
        monitor_status : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMonitorsInput.new(include_linked_accounts: include_linked_accounts, max_results: max_results, monitor_status: monitor_status, next_token: next_token)
        list_monitors(input)
      end
      def list_monitors(input : Types::ListMonitorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MONITORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for a resource. Tags are supported only for monitors in Amazon CloudWatch Internet
      # Monitor.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start a query to return data for a specific query type for the Amazon CloudWatch Internet Monitor
      # query interface. Specify a time period for the data that you want returned by using StartTime and
      # EndTime . You filter the query results to return by providing parameters that you specify with
      # FilterParameters . For more information about using the query interface, including examples, see
      # Using the Amazon CloudWatch Internet Monitor query interface in the Amazon CloudWatch Internet
      # Monitor User Guide.
      def start_query(
        end_time : Time,
        monitor_name : String,
        query_type : String,
        start_time : Time,
        filter_parameters : Array(Types::FilterParameter)? = nil,
        linked_account_id : String? = nil
      ) : Protocol::Request
        input = Types::StartQueryInput.new(end_time: end_time, monitor_name: monitor_name, query_type: query_type, start_time: start_time, filter_parameters: filter_parameters, linked_account_id: linked_account_id)
        start_query(input)
      end
      def start_query(input : Types::StartQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop a query that is progress for a specific monitor.
      def stop_query(
        monitor_name : String,
        query_id : String
      ) : Protocol::Request
        input = Types::StopQueryInput.new(monitor_name: monitor_name, query_id: query_id)
        stop_query(input)
      end
      def stop_query(input : Types::StopQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a resource. Tags are supported only for monitors in Amazon CloudWatch Internet
      # Monitor. You can add a maximum of 50 tags in Internet Monitor. A minimum of one tag is required for
      # this call. It returns an error if you use the TagResource request with 0 tags.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a monitor. You can update a monitor to change the percentage of traffic to monitor or the
      # maximum number of city-networks (locations and ASNs), to add or remove resources, or to change the
      # status of the monitor. Note that you can't change the name of a monitor. The city-network maximum
      # that you choose is the limit, but you only pay for the number of city-networks that are actually
      # monitored. For more information, see Choosing a city-network maximum value in the Amazon CloudWatch
      # User Guide .
      def update_monitor(
        monitor_name : String,
        client_token : String? = nil,
        health_events_config : Types::HealthEventsConfig? = nil,
        internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery? = nil,
        max_city_networks_to_monitor : Int32? = nil,
        resources_to_add : Array(String)? = nil,
        resources_to_remove : Array(String)? = nil,
        status : String? = nil,
        traffic_percentage_to_monitor : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateMonitorInput.new(monitor_name: monitor_name, client_token: client_token, health_events_config: health_events_config, internet_measurements_log_delivery: internet_measurements_log_delivery, max_city_networks_to_monitor: max_city_networks_to_monitor, resources_to_add: resources_to_add, resources_to_remove: resources_to_remove, status: status, traffic_percentage_to_monitor: traffic_percentage_to_monitor)
        update_monitor(input)
      end
      def update_monitor(input : Types::UpdateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
