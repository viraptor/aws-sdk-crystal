module AwsSdk
  module NetworkFlowMonitor
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

      # Create a monitor for specific network flows between local and remote resources, so that you can
      # monitor network performance for one or several of your workloads. For each monitor, Network Flow
      # Monitor publishes detailed end-to-end performance metrics and a network health indicator (NHI) that
      # informs you whether there were Amazon Web Services network issues for one or more of the network
      # flows tracked by a monitor, during a time period that you choose.
      def create_monitor(
        local_resources : Array(Types::MonitorLocalResource),
        monitor_name : String,
        scope_arn : String,
        client_token : String? = nil,
        remote_resources : Array(Types::MonitorRemoteResource)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMonitorInput.new(local_resources: local_resources, monitor_name: monitor_name, scope_arn: scope_arn, client_token: client_token, remote_resources: remote_resources, tags: tags)
        create_monitor(input)
      end
      def create_monitor(input : Types::CreateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # In Network Flow Monitor, you specify a scope for the service to generate metrics for. By using the
      # scope, Network Flow Monitor can generate a topology of all the resources to measure performance
      # metrics for. When you create a scope, you enable permissions for Network Flow Monitor. A scope is a
      # Region-account pair or multiple Region-account pairs. Network Flow Monitor uses your scope to
      # determine all the resources (the topology) where Network Flow Monitor will gather network flow
      # performance metrics for you. To provide performance metrics, Network Flow Monitor uses the data that
      # is sent by the Network Flow Monitor agents you install on the resources. To define the
      # Region-account pairs for your scope, the Network Flow Monitor API uses the following constucts,
      # which allow for future flexibility in defining scopes: Targets , which are arrays of
      # targetResources. Target resources , which are Region-targetIdentifier pairs. Target identifiers ,
      # made up of a targetID (currently always an account ID) and a targetType (currently always an
      # account).
      def create_scope(
        targets : Array(Types::TargetResource),
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateScopeInput.new(targets: targets, client_token: client_token, tags: tags)
        create_scope(input)
      end
      def create_scope(input : Types::CreateScopeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a monitor in Network Flow Monitor.
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

      # Deletes a scope that has been defined.
      def delete_scope(
        scope_id : String
      ) : Protocol::Request
        input = Types::DeleteScopeInput.new(scope_id: scope_id)
        delete_scope(input)
      end
      def delete_scope(input : Types::DeleteScopeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a monitor in Network Flow Monitor based on a monitor name. The information
      # returned includes the Amazon Resource Name (ARN), create time, modified time, resources included in
      # the monitor, and status information.
      def get_monitor(
        monitor_name : String
      ) : Protocol::Request
        input = Types::GetMonitorInput.new(monitor_name: monitor_name)
        get_monitor(input)
      end
      def get_monitor(input : Types::GetMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return the data for a query with the Network Flow Monitor query interface. You specify the query
      # that you want to return results for by providing a query ID and a monitor name. This query returns
      # the top contributors for a specific monitor. Create a query ID for this call by calling the
      # corresponding API call to start the query, StartQueryMonitorTopContributors . Use the scope ID that
      # was returned for your account by CreateScope . Top contributors in Network Flow Monitor are network
      # flows with the highest values for a specific metric type. Top contributors can be across all
      # workload insights, for a given scope, or for a specific monitor. Use the applicable call for the top
      # contributors that you want to be returned.
      def get_query_results_monitor_top_contributors(
        monitor_name : String,
        query_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetQueryResultsMonitorTopContributorsInput.new(monitor_name: monitor_name, query_id: query_id, max_results: max_results, next_token: next_token)
        get_query_results_monitor_top_contributors(input)
      end
      def get_query_results_monitor_top_contributors(input : Types::GetQueryResultsMonitorTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_RESULTS_MONITOR_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return the data for a query with the Network Flow Monitor query interface. You specify the query
      # that you want to return results for by providing a query ID and a monitor name. This query returns
      # the top contributors for a scope for workload insights. Workload insights provide a high level view
      # of network flow performance data collected by agents. To return the data for the top contributors,
      # see GetQueryResultsWorkloadInsightsTopContributorsData . Create a query ID for this call by calling
      # the corresponding API call to start the query, StartQueryWorkloadInsightsTopContributors . Use the
      # scope ID that was returned for your account by CreateScope . Top contributors in Network Flow
      # Monitor are network flows with the highest values for a specific metric type. Top contributors can
      # be across all workload insights, for a given scope, or for a specific monitor. Use the applicable
      # call for the top contributors that you want to be returned.
      def get_query_results_workload_insights_top_contributors(
        query_id : String,
        scope_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetQueryResultsWorkloadInsightsTopContributorsInput.new(query_id: query_id, scope_id: scope_id, max_results: max_results, next_token: next_token)
        get_query_results_workload_insights_top_contributors(input)
      end
      def get_query_results_workload_insights_top_contributors(input : Types::GetQueryResultsWorkloadInsightsTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_RESULTS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return the data for a query with the Network Flow Monitor query interface. Specify the query that
      # you want to return results for by providing a query ID and a scope ID. This query returns the data
      # for top contributors for workload insights for a specific scope. Workload insights provide a high
      # level view of network flow performance data collected by agents for a scope. To return just the top
      # contributors, see GetQueryResultsWorkloadInsightsTopContributors . Create a query ID for this call
      # by calling the corresponding API call to start the query,
      # StartQueryWorkloadInsightsTopContributorsData . Use the scope ID that was returned for your account
      # by CreateScope . Top contributors in Network Flow Monitor are network flows with the highest values
      # for a specific metric type. Top contributors can be across all workload insights, for a given scope,
      # or for a specific monitor. Use the applicable call for the top contributors that you want to be
      # returned. The top contributor network flows overall are for a specific metric type, for example, the
      # number of retransmissions.
      def get_query_results_workload_insights_top_contributors_data(
        query_id : String,
        scope_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetQueryResultsWorkloadInsightsTopContributorsDataInput.new(query_id: query_id, scope_id: scope_id, max_results: max_results, next_token: next_token)
        get_query_results_workload_insights_top_contributors_data(input)
      end
      def get_query_results_workload_insights_top_contributors_data(input : Types::GetQueryResultsWorkloadInsightsTopContributorsDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_RESULTS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current status of a query for the Network Flow Monitor query interface, for a specified
      # query ID and monitor. This call returns the query status for the top contributors for a monitor.
      # When you create a query, use this call to check the status of the query to make sure that it has has
      # SUCCEEDED before you review the results. Use the same query ID that you used for the corresponding
      # API call to start (create) the query, StartQueryMonitorTopContributors . When you run a query, use
      # this call to check the status of the query to make sure that the query has SUCCEEDED before you
      # review the results.
      def get_query_status_monitor_top_contributors(
        monitor_name : String,
        query_id : String
      ) : Protocol::Request
        input = Types::GetQueryStatusMonitorTopContributorsInput.new(monitor_name: monitor_name, query_id: query_id)
        get_query_status_monitor_top_contributors(input)
      end
      def get_query_status_monitor_top_contributors(input : Types::GetQueryStatusMonitorTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATUS_MONITOR_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return the data for a query with the Network Flow Monitor query interface. Specify the query that
      # you want to return results for by providing a query ID and a monitor name. This query returns the
      # top contributors for workload insights. When you start a query, use this call to check the status of
      # the query to make sure that it has has SUCCEEDED before you review the results. Use the same query
      # ID that you used for the corresponding API call to start the query,
      # StartQueryWorkloadInsightsTopContributors . Top contributors in Network Flow Monitor are network
      # flows with the highest values for a specific metric type. Top contributors can be across all
      # workload insights, for a given scope, or for a specific monitor. Use the applicable call for the top
      # contributors that you want to be returned.
      def get_query_status_workload_insights_top_contributors(
        query_id : String,
        scope_id : String
      ) : Protocol::Request
        input = Types::GetQueryStatusWorkloadInsightsTopContributorsInput.new(query_id: query_id, scope_id: scope_id)
        get_query_status_workload_insights_top_contributors(input)
      end
      def get_query_status_workload_insights_top_contributors(input : Types::GetQueryStatusWorkloadInsightsTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATUS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current status of a query for the Network Flow Monitor query interface, for a specified
      # query ID and monitor. This call returns the query status for the top contributors data for workload
      # insights. When you start a query, use this call to check the status of the query to make sure that
      # it has has SUCCEEDED before you review the results. Use the same query ID that you used for the
      # corresponding API call to start the query, StartQueryWorkloadInsightsTopContributorsData . Top
      # contributors in Network Flow Monitor are network flows with the highest values for a specific metric
      # type. Top contributors can be across all workload insights, for a given scope, or for a specific
      # monitor. Use the applicable call for the top contributors that you want to be returned. The top
      # contributor network flows overall are for a specific metric type, for example, the number of
      # retransmissions.
      def get_query_status_workload_insights_top_contributors_data(
        query_id : String,
        scope_id : String
      ) : Protocol::Request
        input = Types::GetQueryStatusWorkloadInsightsTopContributorsDataInput.new(query_id: query_id, scope_id: scope_id)
        get_query_status_workload_insights_top_contributors_data(input)
      end
      def get_query_status_workload_insights_top_contributors_data(input : Types::GetQueryStatusWorkloadInsightsTopContributorsDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATUS_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a scope, including the name, status, tags, and target details. The scope in
      # Network Flow Monitor is an account.
      def get_scope(
        scope_id : String
      ) : Protocol::Request
        input = Types::GetScopeInput.new(scope_id: scope_id)
        get_scope(input)
      end
      def get_scope(input : Types::GetScopeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all monitors in an account. Optionally, you can list only monitors that have a specific status,
      # by using the STATUS parameter.
      def list_monitors(
        max_results : Int32? = nil,
        monitor_status : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMonitorsInput.new(max_results: max_results, monitor_status: monitor_status, next_token: next_token)
        list_monitors(input)
      end
      def list_monitors(input : Types::ListMonitorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MONITORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the scopes for an account.
      def list_scopes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScopesInput.new(max_results: max_results, next_token: next_token)
        list_scopes(input)
      end
      def list_scopes(input : Types::ListScopesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCOPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all the tags for a resource.
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

      # Create a query that you can use with the Network Flow Monitor query interface to return the top
      # contributors for a monitor. Specify the monitor that you want to create the query for. The call
      # returns a query ID that you can use with GetQueryResultsMonitorTopContributors to run the query and
      # return the top contributors for a specific monitor. Top contributors in Network Flow Monitor are
      # network flows with the highest values for a specific metric type. Top contributors can be across all
      # workload insights, for a given scope, or for a specific monitor. Use the applicable APIs for the top
      # contributors that you want to be returned.
      def start_query_monitor_top_contributors(
        destination_category : String,
        end_time : Time,
        metric_name : String,
        monitor_name : String,
        start_time : Time,
        limit : Int32? = nil
      ) : Protocol::Request
        input = Types::StartQueryMonitorTopContributorsInput.new(destination_category: destination_category, end_time: end_time, metric_name: metric_name, monitor_name: monitor_name, start_time: start_time, limit: limit)
        start_query_monitor_top_contributors(input)
      end
      def start_query_monitor_top_contributors(input : Types::StartQueryMonitorTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_QUERY_MONITOR_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a query with the Network Flow Monitor query interface that you can run to return workload
      # insights top contributors. Specify the scope that you want to create a query for. The call returns a
      # query ID that you can use with GetQueryResultsWorkloadInsightsTopContributors to run the query and
      # return the top contributors for the workload insights for a scope. Top contributors in Network Flow
      # Monitor are network flows with the highest values for a specific metric type. Top contributors can
      # be across all workload insights, for a given scope, or for a specific monitor. Use the applicable
      # APIs for the top contributors that you want to be returned.
      def start_query_workload_insights_top_contributors(
        destination_category : String,
        end_time : Time,
        metric_name : String,
        scope_id : String,
        start_time : Time,
        limit : Int32? = nil
      ) : Protocol::Request
        input = Types::StartQueryWorkloadInsightsTopContributorsInput.new(destination_category: destination_category, end_time: end_time, metric_name: metric_name, scope_id: scope_id, start_time: start_time, limit: limit)
        start_query_workload_insights_top_contributors(input)
      end
      def start_query_workload_insights_top_contributors(input : Types::StartQueryWorkloadInsightsTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a query with the Network Flow Monitor query interface that you can run to return data for
      # workload insights top contributors. Specify the scope that you want to create a query for. The call
      # returns a query ID that you can use with GetQueryResultsWorkloadInsightsTopContributorsData to run
      # the query and return the data for the top contributors for the workload insights for a scope. Top
      # contributors in Network Flow Monitor are network flows with the highest values for a specific metric
      # type. Top contributors can be across all workload insights, for a given scope, or for a specific
      # monitor. Use the applicable call for the top contributors that you want to be returned.
      def start_query_workload_insights_top_contributors_data(
        destination_category : String,
        end_time : Time,
        metric_name : String,
        scope_id : String,
        start_time : Time
      ) : Protocol::Request
        input = Types::StartQueryWorkloadInsightsTopContributorsDataInput.new(destination_category: destination_category, end_time: end_time, metric_name: metric_name, scope_id: scope_id, start_time: start_time)
        start_query_workload_insights_top_contributors_data(input)
      end
      def start_query_workload_insights_top_contributors_data(input : Types::StartQueryWorkloadInsightsTopContributorsDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop a top contributors query for a monitor. Specify the query that you want to stop by providing a
      # query ID and a monitor name. Top contributors in Network Flow Monitor are network flows with the
      # highest values for a specific metric type. Top contributors can be across all workload insights, for
      # a given scope, or for a specific monitor. Use the applicable call for the top contributors that you
      # want to be returned.
      def stop_query_monitor_top_contributors(
        monitor_name : String,
        query_id : String
      ) : Protocol::Request
        input = Types::StopQueryMonitorTopContributorsInput.new(monitor_name: monitor_name, query_id: query_id)
        stop_query_monitor_top_contributors(input)
      end
      def stop_query_monitor_top_contributors(input : Types::StopQueryMonitorTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_QUERY_MONITOR_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop a top contributors query for workload insights. Specify the query that you want to stop by
      # providing a query ID and a scope ID. Top contributors in Network Flow Monitor are network flows with
      # the highest values for a specific metric type. Top contributors can be across all workload insights,
      # for a given scope, or for a specific monitor. Use the applicable call for the top contributors that
      # you want to be returned.
      def stop_query_workload_insights_top_contributors(
        query_id : String,
        scope_id : String
      ) : Protocol::Request
        input = Types::StopQueryWorkloadInsightsTopContributorsInput.new(query_id: query_id, scope_id: scope_id)
        stop_query_workload_insights_top_contributors(input)
      end
      def stop_query_workload_insights_top_contributors(input : Types::StopQueryWorkloadInsightsTopContributorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop a top contributors data query for workload insights. Specify the query that you want to stop by
      # providing a query ID and a scope ID. Top contributors in Network Flow Monitor are network flows with
      # the highest values for a specific metric type. Top contributors can be across all workload insights,
      # for a given scope, or for a specific monitor. Use the applicable call for the top contributors that
      # you want to be returned.
      def stop_query_workload_insights_top_contributors_data(
        query_id : String,
        scope_id : String
      ) : Protocol::Request
        input = Types::StopQueryWorkloadInsightsTopContributorsDataInput.new(query_id: query_id, scope_id: scope_id)
        stop_query_workload_insights_top_contributors_data(input)
      end
      def stop_query_workload_insights_top_contributors_data(input : Types::StopQueryWorkloadInsightsTopContributorsDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_QUERY_WORKLOAD_INSIGHTS_TOP_CONTRIBUTORS_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a resource.
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

      # Update a monitor to add or remove local or remote resources.
      def update_monitor(
        monitor_name : String,
        client_token : String? = nil,
        local_resources_to_add : Array(Types::MonitorLocalResource)? = nil,
        local_resources_to_remove : Array(Types::MonitorLocalResource)? = nil,
        remote_resources_to_add : Array(Types::MonitorRemoteResource)? = nil,
        remote_resources_to_remove : Array(Types::MonitorRemoteResource)? = nil
      ) : Protocol::Request
        input = Types::UpdateMonitorInput.new(monitor_name: monitor_name, client_token: client_token, local_resources_to_add: local_resources_to_add, local_resources_to_remove: local_resources_to_remove, remote_resources_to_add: remote_resources_to_add, remote_resources_to_remove: remote_resources_to_remove)
        update_monitor(input)
      end
      def update_monitor(input : Types::UpdateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a scope to add or remove resources that you want to be available for Network Flow Monitor to
      # generate metrics for, when you have active agents on those resources sending metrics reports to the
      # Network Flow Monitor backend.
      def update_scope(
        scope_id : String,
        resources_to_add : Array(Types::TargetResource)? = nil,
        resources_to_delete : Array(Types::TargetResource)? = nil
      ) : Protocol::Request
        input = Types::UpdateScopeInput.new(scope_id: scope_id, resources_to_add: resources_to_add, resources_to_delete: resources_to_delete)
        update_scope(input)
      end
      def update_scope(input : Types::UpdateScopeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
