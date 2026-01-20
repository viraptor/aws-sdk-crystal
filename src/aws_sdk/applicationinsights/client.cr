module AwsSdk
  module ApplicationInsights
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

      # Adds a workload to a component. Each component can have at most five workloads.

      def add_workload(
        component_name : String,
        resource_group_name : String,
        workload_configuration : Types::WorkloadConfiguration
      ) : Types::AddWorkloadResponse

        input = Types::AddWorkloadRequest.new(component_name: component_name, resource_group_name: resource_group_name, workload_configuration: workload_configuration)
        add_workload(input)
      end

      def add_workload(input : Types::AddWorkloadRequest) : Types::AddWorkloadResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_WORKLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddWorkloadResponse, "AddWorkload")
      end

      # Adds an application that is created from a resource group.

      def create_application(
        attach_missing_permission : Bool? = nil,
        auto_config_enabled : Bool? = nil,
        auto_create : Bool? = nil,
        cwe_monitor_enabled : Bool? = nil,
        grouping_type : String? = nil,
        ops_center_enabled : Bool? = nil,
        ops_item_sns_topic_arn : String? = nil,
        resource_group_name : String? = nil,
        sns_notification_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateApplicationResponse

        input = Types::CreateApplicationRequest.new(attach_missing_permission: attach_missing_permission, auto_config_enabled: auto_config_enabled, auto_create: auto_create, cwe_monitor_enabled: cwe_monitor_enabled, grouping_type: grouping_type, ops_center_enabled: ops_center_enabled, ops_item_sns_topic_arn: ops_item_sns_topic_arn, resource_group_name: resource_group_name, sns_notification_arn: sns_notification_arn, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResponse, "CreateApplication")
      end

      # Creates a custom component by grouping similar standalone instances to monitor.

      def create_component(
        component_name : String,
        resource_group_name : String,
        resource_list : Array(String)
      ) : Types::CreateComponentResponse

        input = Types::CreateComponentRequest.new(component_name: component_name, resource_group_name: resource_group_name, resource_list: resource_list)
        create_component(input)
      end

      def create_component(input : Types::CreateComponentRequest) : Types::CreateComponentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateComponentResponse, "CreateComponent")
      end

      # Adds an log pattern to a LogPatternSet .

      def create_log_pattern(
        pattern : String,
        pattern_name : String,
        pattern_set_name : String,
        rank : Int32,
        resource_group_name : String
      ) : Types::CreateLogPatternResponse

        input = Types::CreateLogPatternRequest.new(pattern: pattern, pattern_name: pattern_name, pattern_set_name: pattern_set_name, rank: rank, resource_group_name: resource_group_name)
        create_log_pattern(input)
      end

      def create_log_pattern(input : Types::CreateLogPatternRequest) : Types::CreateLogPatternResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOG_PATTERN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLogPatternResponse, "CreateLogPattern")
      end

      # Removes the specified application from monitoring. Does not delete the application.

      def delete_application(
        resource_group_name : String
      ) : Types::DeleteApplicationResponse

        input = Types::DeleteApplicationRequest.new(resource_group_name: resource_group_name)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Types::DeleteApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationResponse, "DeleteApplication")
      end

      # Ungroups a custom component. When you ungroup custom components, all applicable monitors that are
      # set up for the component are removed and the instances revert to their standalone status.

      def delete_component(
        component_name : String,
        resource_group_name : String
      ) : Types::DeleteComponentResponse

        input = Types::DeleteComponentRequest.new(component_name: component_name, resource_group_name: resource_group_name)
        delete_component(input)
      end

      def delete_component(input : Types::DeleteComponentRequest) : Types::DeleteComponentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteComponentResponse, "DeleteComponent")
      end

      # Removes the specified log pattern from a LogPatternSet .

      def delete_log_pattern(
        pattern_name : String,
        pattern_set_name : String,
        resource_group_name : String
      ) : Types::DeleteLogPatternResponse

        input = Types::DeleteLogPatternRequest.new(pattern_name: pattern_name, pattern_set_name: pattern_set_name, resource_group_name: resource_group_name)
        delete_log_pattern(input)
      end

      def delete_log_pattern(input : Types::DeleteLogPatternRequest) : Types::DeleteLogPatternResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOG_PATTERN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLogPatternResponse, "DeleteLogPattern")
      end

      # Describes the application.

      def describe_application(
        resource_group_name : String,
        account_id : String? = nil
      ) : Types::DescribeApplicationResponse

        input = Types::DescribeApplicationRequest.new(resource_group_name: resource_group_name, account_id: account_id)
        describe_application(input)
      end

      def describe_application(input : Types::DescribeApplicationRequest) : Types::DescribeApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationResponse, "DescribeApplication")
      end

      # Describes a component and lists the resources that are grouped together in a component.

      def describe_component(
        component_name : String,
        resource_group_name : String,
        account_id : String? = nil
      ) : Types::DescribeComponentResponse

        input = Types::DescribeComponentRequest.new(component_name: component_name, resource_group_name: resource_group_name, account_id: account_id)
        describe_component(input)
      end

      def describe_component(input : Types::DescribeComponentRequest) : Types::DescribeComponentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComponentResponse, "DescribeComponent")
      end

      # Describes the monitoring configuration of the component.

      def describe_component_configuration(
        component_name : String,
        resource_group_name : String,
        account_id : String? = nil
      ) : Types::DescribeComponentConfigurationResponse

        input = Types::DescribeComponentConfigurationRequest.new(component_name: component_name, resource_group_name: resource_group_name, account_id: account_id)
        describe_component_configuration(input)
      end

      def describe_component_configuration(input : Types::DescribeComponentConfigurationRequest) : Types::DescribeComponentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPONENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComponentConfigurationResponse, "DescribeComponentConfiguration")
      end

      # Describes the recommended monitoring configuration of the component.

      def describe_component_configuration_recommendation(
        component_name : String,
        resource_group_name : String,
        tier : String,
        recommendation_type : String? = nil,
        workload_name : String? = nil
      ) : Types::DescribeComponentConfigurationRecommendationResponse

        input = Types::DescribeComponentConfigurationRecommendationRequest.new(component_name: component_name, resource_group_name: resource_group_name, tier: tier, recommendation_type: recommendation_type, workload_name: workload_name)
        describe_component_configuration_recommendation(input)
      end

      def describe_component_configuration_recommendation(input : Types::DescribeComponentConfigurationRecommendationRequest) : Types::DescribeComponentConfigurationRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPONENT_CONFIGURATION_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComponentConfigurationRecommendationResponse, "DescribeComponentConfigurationRecommendation")
      end

      # Describe a specific log pattern from a LogPatternSet .

      def describe_log_pattern(
        pattern_name : String,
        pattern_set_name : String,
        resource_group_name : String,
        account_id : String? = nil
      ) : Types::DescribeLogPatternResponse

        input = Types::DescribeLogPatternRequest.new(pattern_name: pattern_name, pattern_set_name: pattern_set_name, resource_group_name: resource_group_name, account_id: account_id)
        describe_log_pattern(input)
      end

      def describe_log_pattern(input : Types::DescribeLogPatternRequest) : Types::DescribeLogPatternResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOG_PATTERN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLogPatternResponse, "DescribeLogPattern")
      end

      # Describes an anomaly or error with the application.

      def describe_observation(
        observation_id : String,
        account_id : String? = nil
      ) : Types::DescribeObservationResponse

        input = Types::DescribeObservationRequest.new(observation_id: observation_id, account_id: account_id)
        describe_observation(input)
      end

      def describe_observation(input : Types::DescribeObservationRequest) : Types::DescribeObservationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OBSERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeObservationResponse, "DescribeObservation")
      end

      # Describes an application problem.

      def describe_problem(
        problem_id : String,
        account_id : String? = nil
      ) : Types::DescribeProblemResponse

        input = Types::DescribeProblemRequest.new(problem_id: problem_id, account_id: account_id)
        describe_problem(input)
      end

      def describe_problem(input : Types::DescribeProblemRequest) : Types::DescribeProblemResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROBLEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProblemResponse, "DescribeProblem")
      end

      # Describes the anomalies or errors associated with the problem.

      def describe_problem_observations(
        problem_id : String,
        account_id : String? = nil
      ) : Types::DescribeProblemObservationsResponse

        input = Types::DescribeProblemObservationsRequest.new(problem_id: problem_id, account_id: account_id)
        describe_problem_observations(input)
      end

      def describe_problem_observations(input : Types::DescribeProblemObservationsRequest) : Types::DescribeProblemObservationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROBLEM_OBSERVATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProblemObservationsResponse, "DescribeProblemObservations")
      end

      # Describes a workload and its configuration.

      def describe_workload(
        component_name : String,
        resource_group_name : String,
        workload_id : String,
        account_id : String? = nil
      ) : Types::DescribeWorkloadResponse

        input = Types::DescribeWorkloadRequest.new(component_name: component_name, resource_group_name: resource_group_name, workload_id: workload_id, account_id: account_id)
        describe_workload(input)
      end

      def describe_workload(input : Types::DescribeWorkloadRequest) : Types::DescribeWorkloadResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkloadResponse, "DescribeWorkload")
      end

      # Lists the IDs of the applications that you are monitoring.

      def list_applications(
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationsResponse

        input = Types::ListApplicationsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Types::ListApplicationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationsResponse, "ListApplications")
      end

      # Lists the auto-grouped, standalone, and custom components of the application.

      def list_components(
        resource_group_name : String,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListComponentsResponse

        input = Types::ListComponentsRequest.new(resource_group_name: resource_group_name, account_id: account_id, max_results: max_results, next_token: next_token)
        list_components(input)
      end

      def list_components(input : Types::ListComponentsRequest) : Types::ListComponentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPONENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComponentsResponse, "ListComponents")
      end

      # Lists the INFO, WARN, and ERROR events for periodic configuration updates performed by Application
      # Insights. Examples of events represented are: INFO: creating a new alarm or updating an alarm
      # threshold. WARN: alarm not created due to insufficient data points used to predict thresholds.
      # ERROR: alarm not created due to permission errors or exceeding quotas.

      def list_configuration_history(
        account_id : String? = nil,
        end_time : Time? = nil,
        event_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_group_name : String? = nil,
        start_time : Time? = nil
      ) : Types::ListConfigurationHistoryResponse

        input = Types::ListConfigurationHistoryRequest.new(account_id: account_id, end_time: end_time, event_status: event_status, max_results: max_results, next_token: next_token, resource_group_name: resource_group_name, start_time: start_time)
        list_configuration_history(input)
      end

      def list_configuration_history(input : Types::ListConfigurationHistoryRequest) : Types::ListConfigurationHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONFIGURATION_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConfigurationHistoryResponse, "ListConfigurationHistory")
      end

      # Lists the log pattern sets in the specific application.

      def list_log_pattern_sets(
        resource_group_name : String,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLogPatternSetsResponse

        input = Types::ListLogPatternSetsRequest.new(resource_group_name: resource_group_name, account_id: account_id, max_results: max_results, next_token: next_token)
        list_log_pattern_sets(input)
      end

      def list_log_pattern_sets(input : Types::ListLogPatternSetsRequest) : Types::ListLogPatternSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LOG_PATTERN_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLogPatternSetsResponse, "ListLogPatternSets")
      end

      # Lists the log patterns in the specific log LogPatternSet .

      def list_log_patterns(
        resource_group_name : String,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pattern_set_name : String? = nil
      ) : Types::ListLogPatternsResponse

        input = Types::ListLogPatternsRequest.new(resource_group_name: resource_group_name, account_id: account_id, max_results: max_results, next_token: next_token, pattern_set_name: pattern_set_name)
        list_log_patterns(input)
      end

      def list_log_patterns(input : Types::ListLogPatternsRequest) : Types::ListLogPatternsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LOG_PATTERNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLogPatternsResponse, "ListLogPatterns")
      end

      # Lists the problems with your application.

      def list_problems(
        account_id : String? = nil,
        component_name : String? = nil,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_group_name : String? = nil,
        start_time : Time? = nil,
        visibility : String? = nil
      ) : Types::ListProblemsResponse

        input = Types::ListProblemsRequest.new(account_id: account_id, component_name: component_name, end_time: end_time, max_results: max_results, next_token: next_token, resource_group_name: resource_group_name, start_time: start_time, visibility: visibility)
        list_problems(input)
      end

      def list_problems(input : Types::ListProblemsRequest) : Types::ListProblemsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROBLEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProblemsResponse, "ListProblems")
      end

      # Retrieve a list of the tags (keys and values) that are associated with a specified application. A
      # tag is a label that you optionally define and associate with an application. Each tag consists of a
      # required tag key and an optional associated tag value . A tag key is a general label that acts as a
      # category for more specific tag values. A tag value acts as a descriptor within a tag key.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists the workloads that are configured on a given component.

      def list_workloads(
        component_name : String,
        resource_group_name : String,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkloadsResponse

        input = Types::ListWorkloadsRequest.new(component_name: component_name, resource_group_name: resource_group_name, account_id: account_id, max_results: max_results, next_token: next_token)
        list_workloads(input)
      end

      def list_workloads(input : Types::ListWorkloadsRequest) : Types::ListWorkloadsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKLOADS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkloadsResponse, "ListWorkloads")
      end

      # Remove workload from a component.

      def remove_workload(
        component_name : String,
        resource_group_name : String,
        workload_id : String
      ) : Types::RemoveWorkloadResponse

        input = Types::RemoveWorkloadRequest.new(component_name: component_name, resource_group_name: resource_group_name, workload_id: workload_id)
        remove_workload(input)
      end

      def remove_workload(input : Types::RemoveWorkloadRequest) : Types::RemoveWorkloadResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_WORKLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveWorkloadResponse, "RemoveWorkload")
      end

      # Add one or more tags (keys and values) to a specified application. A tag is a label that you
      # optionally define and associate with an application. Tags can help you categorize and manage
      # application in different ways, such as by purpose, owner, environment, or other criteria. Each tag
      # consists of a required tag key and an associated tag value , both of which you define. A tag key is
      # a general label that acts as a category for more specific tag values. A tag value acts as a
      # descriptor within a tag key.

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

      # Remove one or more tags (keys and values) from a specified application.

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

      # Updates the application.

      def update_application(
        resource_group_name : String,
        attach_missing_permission : Bool? = nil,
        auto_config_enabled : Bool? = nil,
        cwe_monitor_enabled : Bool? = nil,
        ops_center_enabled : Bool? = nil,
        ops_item_sns_topic_arn : String? = nil,
        remove_sns_topic : Bool? = nil,
        sns_notification_arn : String? = nil
      ) : Types::UpdateApplicationResponse

        input = Types::UpdateApplicationRequest.new(resource_group_name: resource_group_name, attach_missing_permission: attach_missing_permission, auto_config_enabled: auto_config_enabled, cwe_monitor_enabled: cwe_monitor_enabled, ops_center_enabled: ops_center_enabled, ops_item_sns_topic_arn: ops_item_sns_topic_arn, remove_sns_topic: remove_sns_topic, sns_notification_arn: sns_notification_arn)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Types::UpdateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationResponse, "UpdateApplication")
      end

      # Updates the custom component name and/or the list of resources that make up the component.

      def update_component(
        component_name : String,
        resource_group_name : String,
        new_component_name : String? = nil,
        resource_list : Array(String)? = nil
      ) : Types::UpdateComponentResponse

        input = Types::UpdateComponentRequest.new(component_name: component_name, resource_group_name: resource_group_name, new_component_name: new_component_name, resource_list: resource_list)
        update_component(input)
      end

      def update_component(input : Types::UpdateComponentRequest) : Types::UpdateComponentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateComponentResponse, "UpdateComponent")
      end

      # Updates the monitoring configurations for the component. The configuration input parameter is an
      # escaped JSON of the configuration and should match the schema of what is returned by
      # DescribeComponentConfigurationRecommendation .

      def update_component_configuration(
        component_name : String,
        resource_group_name : String,
        auto_config_enabled : Bool? = nil,
        component_configuration : String? = nil,
        monitor : Bool? = nil,
        tier : String? = nil
      ) : Types::UpdateComponentConfigurationResponse

        input = Types::UpdateComponentConfigurationRequest.new(component_name: component_name, resource_group_name: resource_group_name, auto_config_enabled: auto_config_enabled, component_configuration: component_configuration, monitor: monitor, tier: tier)
        update_component_configuration(input)
      end

      def update_component_configuration(input : Types::UpdateComponentConfigurationRequest) : Types::UpdateComponentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMPONENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateComponentConfigurationResponse, "UpdateComponentConfiguration")
      end

      # Adds a log pattern to a LogPatternSet .

      def update_log_pattern(
        pattern_name : String,
        pattern_set_name : String,
        resource_group_name : String,
        pattern : String? = nil,
        rank : Int32? = nil
      ) : Types::UpdateLogPatternResponse

        input = Types::UpdateLogPatternRequest.new(pattern_name: pattern_name, pattern_set_name: pattern_set_name, resource_group_name: resource_group_name, pattern: pattern, rank: rank)
        update_log_pattern(input)
      end

      def update_log_pattern(input : Types::UpdateLogPatternRequest) : Types::UpdateLogPatternResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOG_PATTERN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLogPatternResponse, "UpdateLogPattern")
      end

      # Updates the visibility of the problem or specifies the problem as RESOLVED .

      def update_problem(
        problem_id : String,
        update_status : String? = nil,
        visibility : String? = nil
      ) : Types::UpdateProblemResponse

        input = Types::UpdateProblemRequest.new(problem_id: problem_id, update_status: update_status, visibility: visibility)
        update_problem(input)
      end

      def update_problem(input : Types::UpdateProblemRequest) : Types::UpdateProblemResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROBLEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProblemResponse, "UpdateProblem")
      end

      # Adds a workload to a component. Each component can have at most five workloads.

      def update_workload(
        component_name : String,
        resource_group_name : String,
        workload_configuration : Types::WorkloadConfiguration,
        workload_id : String? = nil
      ) : Types::UpdateWorkloadResponse

        input = Types::UpdateWorkloadRequest.new(component_name: component_name, resource_group_name: resource_group_name, workload_configuration: workload_configuration, workload_id: workload_id)
        update_workload(input)
      end

      def update_workload(input : Types::UpdateWorkloadRequest) : Types::UpdateWorkloadResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkloadResponse, "UpdateWorkload")
      end
    end
  end
end
