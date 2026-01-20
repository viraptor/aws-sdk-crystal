module AwsSdk
  module RUM
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

      # Specifies the extended metrics and custom metrics that you want a CloudWatch RUM app monitor to send
      # to a destination. Valid destinations include CloudWatch and Evidently. By default, RUM app monitors
      # send some metrics to CloudWatch. These default metrics are listed in CloudWatch metrics that you can
      # collect with CloudWatch RUM . In addition to these default metrics, you can choose to send extended
      # metrics, custom metrics, or both. Extended metrics let you send metrics with additional dimensions
      # that aren't included in the default metrics. You can also send extended metrics to both Evidently
      # and CloudWatch. The valid dimension names for the additional dimensions for extended metrics are
      # BrowserName , CountryCode , DeviceType , FileType , OSName , and PageId . For more information, see
      # Extended metrics that you can send to CloudWatch and CloudWatch Evidently . Custom metrics are
      # metrics that you define. You can send custom metrics to CloudWatch. CloudWatch Evidently, or both.
      # With custom metrics, you can use any metric name and namespace. To derive the metrics, you can use
      # any custom events, built-in events, custom attributes, or default attributes. You can't send custom
      # metrics to the AWS/RUM namespace. You must send custom metrics to a custom namespace that you
      # define. The namespace that you use can't start with AWS/ . CloudWatch RUM prepends
      # RUM/CustomMetrics/ to the custom namespace that you define, so the final namespace for your metrics
      # in CloudWatch is RUM/CustomMetrics/ your-custom-namespace . The maximum number of metric definitions
      # that you can specify in one BatchCreateRumMetricDefinitions operation is 200. The maximum number of
      # metric definitions that one destination can contain is 2000. Extended metrics sent to CloudWatch and
      # RUM custom metrics are charged as CloudWatch custom metrics. Each combination of additional
      # dimension name and dimension value counts as a custom metric. For more information, see Amazon
      # CloudWatch Pricing . You must have already created a destination for the metrics before you send
      # them. For more information, see PutRumMetricsDestination . If some metric definitions specified in a
      # BatchCreateRumMetricDefinitions operations are not valid, those metric definitions fail and return
      # errors, but all valid metric definitions in the same operation still succeed.

      def batch_create_rum_metric_definitions(
        app_monitor_name : String,
        destination : String,
        metric_definitions : Array(Types::MetricDefinitionRequest),
        destination_arn : String? = nil
      ) : Protocol::Request
        input = Types::BatchCreateRumMetricDefinitionsRequest.new(app_monitor_name: app_monitor_name, destination: destination, metric_definitions: metric_definitions, destination_arn: destination_arn)
        batch_create_rum_metric_definitions(input)
      end

      def batch_create_rum_metric_definitions(input : Types::BatchCreateRumMetricDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_RUM_METRIC_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified metrics from being sent to an extended metrics destination. If some metric
      # definition IDs specified in a BatchDeleteRumMetricDefinitions operations are not valid, those metric
      # definitions fail and return errors, but all valid metric definition IDs in the same operation are
      # still deleted. The maximum number of metric definitions that you can specify in one
      # BatchDeleteRumMetricDefinitions operation is 200.

      def batch_delete_rum_metric_definitions(
        app_monitor_name : String,
        destination : String,
        metric_definition_ids : Array(String),
        destination_arn : String? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteRumMetricDefinitionsRequest.new(app_monitor_name: app_monitor_name, destination: destination, metric_definition_ids: metric_definition_ids, destination_arn: destination_arn)
        batch_delete_rum_metric_definitions(input)
      end

      def batch_delete_rum_metric_definitions(input : Types::BatchDeleteRumMetricDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_RUM_METRIC_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of metrics and dimensions that a RUM app monitor is sending to a single
      # destination.

      def batch_get_rum_metric_definitions(
        app_monitor_name : String,
        destination : String,
        destination_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetRumMetricDefinitionsRequest.new(app_monitor_name: app_monitor_name, destination: destination, destination_arn: destination_arn, max_results: max_results, next_token: next_token)
        batch_get_rum_metric_definitions(input)
      end

      def batch_get_rum_metric_definitions(input : Types::BatchGetRumMetricDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_RUM_METRIC_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Amazon CloudWatch RUM app monitor, which collects telemetry data from your application and
      # sends that data to RUM. The data includes performance and reliability information such as page load
      # time, client-side errors, and user behavior. You use this operation only to create a new app
      # monitor. To update an existing app monitor, use UpdateAppMonitor instead. After you create an app
      # monitor, sign in to the CloudWatch RUM console to get the JavaScript code snippet to add to your web
      # application. For more information, see How do I find a code snippet that I've already generated?

      def create_app_monitor(
        name : String,
        app_monitor_configuration : Types::AppMonitorConfiguration? = nil,
        custom_events : Types::CustomEvents? = nil,
        cw_log_enabled : Bool? = nil,
        deobfuscation_configuration : Types::DeobfuscationConfiguration? = nil,
        domain : String? = nil,
        domain_list : Array(String)? = nil,
        platform : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAppMonitorRequest.new(name: name, app_monitor_configuration: app_monitor_configuration, custom_events: custom_events, cw_log_enabled: cw_log_enabled, deobfuscation_configuration: deobfuscation_configuration, domain: domain, domain_list: domain_list, platform: platform, tags: tags)
        create_app_monitor(input)
      end

      def create_app_monitor(input : Types::CreateAppMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing app monitor. This immediately stops the collection of data.

      def delete_app_monitor(
        name : String
      ) : Protocol::Request
        input = Types::DeleteAppMonitorRequest.new(name: name)
        delete_app_monitor(input)
      end

      def delete_app_monitor(input : Types::DeleteAppMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association of a resource-based policy from an app monitor.

      def delete_resource_policy(
        name : String,
        policy_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(name: name, policy_revision_id: policy_revision_id)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a destination for CloudWatch RUM extended metrics, so that the specified app monitor stops
      # sending extended metrics to that destination.

      def delete_rum_metrics_destination(
        app_monitor_name : String,
        destination : String,
        destination_arn : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRumMetricsDestinationRequest.new(app_monitor_name: app_monitor_name, destination: destination, destination_arn: destination_arn)
        delete_rum_metrics_destination(input)
      end

      def delete_rum_metrics_destination(input : Types::DeleteRumMetricsDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RUM_METRICS_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the complete configuration information for one app monitor.

      def get_app_monitor(
        name : String
      ) : Protocol::Request
        input = Types::GetAppMonitorRequest.new(name: name)
        get_app_monitor(input)
      end

      def get_app_monitor(input : Types::GetAppMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the raw performance events that RUM has collected from your web application, so that you
      # can do your own processing or analysis of this data.

      def get_app_monitor_data(
        name : String,
        time_range : Types::TimeRange,
        filters : Array(Types::QueryFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetAppMonitorDataRequest.new(name: name, time_range: time_range, filters: filters, max_results: max_results, next_token: next_token)
        get_app_monitor_data(input)
      end

      def get_app_monitor_data(input : Types::GetAppMonitorDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APP_MONITOR_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to retrieve information about a resource-based policy that is attached to an app
      # monitor.

      def get_resource_policy(
        name : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(name: name)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the Amazon CloudWatch RUM app monitors in the account.

      def list_app_monitors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppMonitorsRequest.new(max_results: max_results, next_token: next_token)
        list_app_monitors(input)
      end

      def list_app_monitors(input : Types::ListAppMonitorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_MONITORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of destinations that you have created to receive RUM extended metrics, for the
      # specified app monitor. For more information about extended metrics, see AddRumMetrics .

      def list_rum_metrics_destinations(
        app_monitor_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRumMetricsDestinationsRequest.new(app_monitor_name: app_monitor_name, max_results: max_results, next_token: next_token)
        list_rum_metrics_destinations(input)
      end

      def list_rum_metrics_destinations(input : Types::ListRumMetricsDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RUM_METRICS_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a CloudWatch RUM resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to assign a resource-based policy to a CloudWatch RUM app monitor to control
      # access to it. Each app monitor can have one resource-based policy. The maximum size of the policy is
      # 4 KB. To learn more about using resource policies with RUM, see Using resource-based policies with
      # CloudWatch RUM .

      def put_resource_policy(
        name : String,
        policy_document : String,
        policy_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(name: name, policy_document: policy_document, policy_revision_id: policy_revision_id)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends telemetry events about your application performance and user behavior to CloudWatch RUM. The
      # code snippet that RUM generates for you to add to your application includes PutRumEvents operations
      # to send this data to RUM. Each PutRumEvents operation can send a batch of events from one user
      # session.

      def put_rum_events(
        app_monitor_details : Types::AppMonitorDetails,
        batch_id : String,
        id : String,
        rum_events : Array(Types::RumEvent),
        user_details : Types::UserDetails,
        alias_ : String? = nil
      ) : Protocol::Request
        input = Types::PutRumEventsRequest.new(app_monitor_details: app_monitor_details, batch_id: batch_id, id: id, rum_events: rum_events, user_details: user_details, alias_: alias_)
        put_rum_events(input)
      end

      def put_rum_events(input : Types::PutRumEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RUM_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates a destination to receive extended metrics from CloudWatch RUM. You can send
      # extended metrics to CloudWatch or to a CloudWatch Evidently experiment. For more information about
      # extended metrics, see BatchCreateRumMetricDefinitions .

      def put_rum_metrics_destination(
        app_monitor_name : String,
        destination : String,
        destination_arn : String? = nil,
        iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutRumMetricsDestinationRequest.new(app_monitor_name: app_monitor_name, destination: destination, destination_arn: destination_arn, iam_role_arn: iam_role_arn)
        put_rum_metrics_destination(input)
      end

      def put_rum_metrics_destination(input : Types::PutRumMetricsDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RUM_METRICS_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified CloudWatch RUM resource. Currently, the
      # only resources that can be tagged app monitors. Tags can help you organize and categorize your
      # resources. You can also use them to scope user permissions by granting a user permission to access
      # or change only resources with certain tag values. Tags don't have any semantic meaning to Amazon Web
      # Services and are interpreted strictly as strings of characters. You can use the TagResource action
      # with a resource that already has tags. If you specify a new tag key for the resource, this tag is
      # appended to the list of tags associated with the alarm. If you specify a tag key that is already
      # associated with the resource, the new tag value that you specify replaces the previous value for
      # that tag. You can associate as many as 50 tags with a resource. For more information, see Tagging
      # Amazon Web Services resources .

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing app monitor. When you use this operation, only the parts of
      # the app monitor configuration that you specify in this operation are changed. For any parameters
      # that you omit, the existing values are kept. You can't use this operation to change the tags of an
      # existing app monitor. To change the tags of an existing app monitor, use TagResource . To create a
      # new app monitor, use CreateAppMonitor . After you update an app monitor, sign in to the CloudWatch
      # RUM console to get the updated JavaScript code snippet to add to your web application. For more
      # information, see How do I find a code snippet that I've already generated?

      def update_app_monitor(
        name : String,
        app_monitor_configuration : Types::AppMonitorConfiguration? = nil,
        custom_events : Types::CustomEvents? = nil,
        cw_log_enabled : Bool? = nil,
        deobfuscation_configuration : Types::DeobfuscationConfiguration? = nil,
        domain : String? = nil,
        domain_list : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateAppMonitorRequest.new(name: name, app_monitor_configuration: app_monitor_configuration, custom_events: custom_events, cw_log_enabled: cw_log_enabled, deobfuscation_configuration: deobfuscation_configuration, domain: domain, domain_list: domain_list)
        update_app_monitor(input)
      end

      def update_app_monitor(input : Types::UpdateAppMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies one existing metric definition for CloudWatch RUM extended metrics. For more information
      # about extended metrics, see BatchCreateRumMetricsDefinitions .

      def update_rum_metric_definition(
        app_monitor_name : String,
        destination : String,
        metric_definition : Types::MetricDefinitionRequest,
        metric_definition_id : String,
        destination_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRumMetricDefinitionRequest.new(app_monitor_name: app_monitor_name, destination: destination, metric_definition: metric_definition, metric_definition_id: metric_definition_id, destination_arn: destination_arn)
        update_rum_metric_definition(input)
      end

      def update_rum_metric_definition(input : Types::UpdateRumMetricDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RUM_METRIC_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
