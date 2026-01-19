module AwsSdk
  module ApplicationSignals
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

      # Use this operation to retrieve one or more service level objective (SLO) budget reports . An error
      # budget is the amount of time or requests in an unhealthy state that your service can accumulate
      # during an interval before your overall SLO budget health is breached and the SLO is considered to be
      # unmet. For example, an SLO with a threshold of 99.95% and a monthly interval translates to an error
      # budget of 21.9 minutes of downtime in a 30-day month. Budget reports include a health indicator, the
      # attainment value, and remaining budget. For more information about SLO error budgets, see SLO
      # concepts .
      def batch_get_service_level_objective_budget_report(
        slo_ids : Array(String),
        timestamp : Time
      ) : Protocol::Request
        input = Types::BatchGetServiceLevelObjectiveBudgetReportInput.new(slo_ids: slo_ids, timestamp: timestamp)
        batch_get_service_level_objective_budget_report(input)
      end
      def batch_get_service_level_objective_budget_report(input : Types::BatchGetServiceLevelObjectiveBudgetReportInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_SERVICE_LEVEL_OBJECTIVE_BUDGET_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add or remove time window exclusions for one or more Service Level Objectives (SLOs).
      def batch_update_exclusion_windows(
        slo_ids : Array(String),
        add_exclusion_windows : Array(Types::ExclusionWindow)? = nil,
        remove_exclusion_windows : Array(Types::ExclusionWindow)? = nil
      ) : Protocol::Request
        input = Types::BatchUpdateExclusionWindowsInput.new(slo_ids: slo_ids, add_exclusion_windows: add_exclusion_windows, remove_exclusion_windows: remove_exclusion_windows)
        batch_update_exclusion_windows(input)
      end
      def batch_update_exclusion_windows(input : Types::BatchUpdateExclusionWindowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_EXCLUSION_WINDOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service level objective (SLO), which can help you ensure that your critical business
      # operations are meeting customer expectations. Use SLOs to set and track specific target levels for
      # the reliability and availability of your applications and services. SLOs use service level
      # indicators (SLIs) to calculate whether the application is performing at the level that you want.
      # Create an SLO to set a target for a service or operation’s availability or latency. CloudWatch
      # measures this target frequently you can find whether it has been breached. The target performance
      # quality that is defined for an SLO is the attainment goal . You can set SLO targets for your
      # applications that are discovered by Application Signals, using critical metrics such as latency and
      # availability. You can also set SLOs against any CloudWatch metric or math expression that produces a
      # time series. You can't create an SLO for a service operation that was discovered by Application
      # Signals until after that operation has reported standard metrics to Application Signals. When you
      # create an SLO, you specify whether it is a period-based SLO or a request-based SLO . Each type of
      # SLO has a different way of evaluating your application's performance against its attainment goal. A
      # period-based SLO uses defined periods of time within a specified total time interval. For each
      # period of time, Application Signals determines whether the application met its goal. The attainment
      # rate is calculated as the number of good periods/number of total periods . For example, for a
      # period-based SLO, meeting an attainment goal of 99.9% means that within your interval, your
      # application must meet its performance goal during at least 99.9% of the time periods. A
      # request-based SLO doesn't use pre-defined periods of time. Instead, the SLO measures number of good
      # requests/number of total requests during the interval. At any time, you can find the ratio of good
      # requests to total requests for the interval up to the time stamp that you specify, and measure that
      # ratio against the goal set in your SLO. After you have created an SLO, you can retrieve error budget
      # reports for it. An error budget is the amount of time or amount of requests that your application
      # can be non-compliant with the SLO's goal, and still have your application meet the goal. For a
      # period-based SLO, the error budget starts at a number defined by the highest number of periods that
      # can fail to meet the threshold, while still meeting the overall goal. The remaining error budget
      # decreases with every failed period that is recorded. The error budget within one interval can never
      # increase. For example, an SLO with a threshold that 99.95% of requests must be completed under
      # 2000ms every month translates to an error budget of 21.9 minutes of downtime per month. For a
      # request-based SLO, the remaining error budget is dynamic and can increase or decrease, depending on
      # the ratio of good requests to total requests. For more information about SLOs, see Service level
      # objectives (SLOs) . When you perform a CreateServiceLevelObjective operation, Application Signals
      # creates the AWSServiceRoleForCloudWatchApplicationSignals service-linked role, if it doesn't already
      # exist in your account. This service- linked role has the following permissions: xray:GetServiceGraph
      # logs:StartQuery logs:GetQueryResults cloudwatch:GetMetricData cloudwatch:ListMetrics
      # tag:GetResources autoscaling:DescribeAutoScalingGroups
      def create_service_level_objective(
        name : String,
        burn_rate_configurations : Array(Types::BurnRateConfiguration)? = nil,
        description : String? = nil,
        goal : Types::Goal? = nil,
        request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig? = nil,
        sli_config : Types::ServiceLevelIndicatorConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceLevelObjectiveInput.new(name: name, burn_rate_configurations: burn_rate_configurations, description: description, goal: goal, request_based_sli_config: request_based_sli_config, sli_config: sli_config, tags: tags)
        create_service_level_objective(input)
      end
      def create_service_level_objective(input : Types::CreateServiceLevelObjectiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_LEVEL_OBJECTIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the grouping configuration for this account. This removes all custom grouping attribute
      # definitions that were previously configured.
      def delete_grouping_configuration : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUPING_CONFIGURATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified service level objective.
      def delete_service_level_objective(
        id : String
      ) : Protocol::Request
        input = Types::DeleteServiceLevelObjectiveInput.new(id: id)
        delete_service_level_objective(input)
      end
      def delete_service_level_objective(input : Types::DeleteServiceLevelObjectiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_LEVEL_OBJECTIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a service discovered by Application Signals.
      def get_service(
        end_time : Time,
        key_attributes : Hash(String, String),
        start_time : Time
      ) : Protocol::Request
        input = Types::GetServiceInput.new(end_time: end_time, key_attributes: key_attributes, start_time: start_time)
        get_service(input)
      end
      def get_service(input : Types::GetServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about one SLO created in the account.
      def get_service_level_objective(
        id : String
      ) : Protocol::Request
        input = Types::GetServiceLevelObjectiveInput.new(id: id)
        get_service_level_objective(input)
      end
      def get_service_level_objective(input : Types::GetServiceLevelObjectiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_LEVEL_OBJECTIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of audit findings that provide automated analysis of service behavior and root cause
      # analysis. These findings help identify the most significant observations about your services,
      # including performance issues, anomalies, and potential problems. The findings are generated using
      # heuristic algorithms based on established troubleshooting patterns.
      def list_audit_findings(
        audit_targets : Array(Types::AuditTarget),
        end_time : Time,
        start_time : Time,
        auditors : Array(String)? = nil,
        detail_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAuditFindingsInput.new(audit_targets: audit_targets, end_time: end_time, start_time: start_time, auditors: auditors, detail_level: detail_level, max_results: max_results, next_token: next_token)
        list_audit_findings(input)
      end
      def list_audit_findings(input : Types::ListAuditFindingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of change events for a specific entity, such as deployments, configuration changes,
      # or other state-changing activities. This operation helps track the history of changes that may have
      # affected service performance.
      def list_entity_events(
        end_time : Time,
        entity : Hash(String, String),
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEntityEventsInput.new(end_time: end_time, entity: entity, start_time: start_time, max_results: max_results, next_token: next_token)
        list_entity_events(input)
      end
      def list_entity_events(input : Types::ListEntityEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITY_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current grouping configuration for this account, including all custom grouping attribute
      # definitions that have been configured. These definitions determine how services are logically
      # grouped based on telemetry attributes, Amazon Web Services tags, or predefined mappings.
      def list_grouping_attribute_definitions(
        aws_account_id : String? = nil,
        include_linked_accounts : Bool? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupingAttributeDefinitionsInput.new(aws_account_id: aws_account_id, include_linked_accounts: include_linked_accounts, next_token: next_token)
        list_grouping_attribute_definitions(input)
      end
      def list_grouping_attribute_definitions(input : Types::ListGroupingAttributeDefinitionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPING_ATTRIBUTE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of service dependencies of the service that you specify. A dependency is an
      # infrastructure component that an operation of this service connects with. Dependencies can include
      # Amazon Web Services services, Amazon Web Services resources, and third-party services.
      def list_service_dependencies(
        end_time : Time,
        key_attributes : Hash(String, String),
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceDependenciesInput.new(end_time: end_time, key_attributes: key_attributes, start_time: start_time, max_results: max_results, next_token: next_token)
        list_service_dependencies(input)
      end
      def list_service_dependencies(input : Types::ListServiceDependenciesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_DEPENDENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of dependents that invoked the specified service during the provided time range.
      # Dependents include other services, CloudWatch Synthetics canaries, and clients that are instrumented
      # with CloudWatch RUM app monitors.
      def list_service_dependents(
        end_time : Time,
        key_attributes : Hash(String, String),
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceDependentsInput.new(end_time: end_time, key_attributes: key_attributes, start_time: start_time, max_results: max_results, next_token: next_token)
        list_service_dependents(input)
      end
      def list_service_dependents(input : Types::ListServiceDependentsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_DEPENDENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all exclusion windows configured for a specific SLO.
      def list_service_level_objective_exclusion_windows(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceLevelObjectiveExclusionWindowsInput.new(id: id, max_results: max_results, next_token: next_token)
        list_service_level_objective_exclusion_windows(input)
      end
      def list_service_level_objective_exclusion_windows(input : Types::ListServiceLevelObjectiveExclusionWindowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_LEVEL_OBJECTIVE_EXCLUSION_WINDOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of SLOs created in this account.
      def list_service_level_objectives(
        dependency_config : Types::DependencyConfig? = nil,
        include_linked_accounts : Bool? = nil,
        key_attributes : Hash(String, String)? = nil,
        max_results : Int32? = nil,
        metric_source_types : Array(String)? = nil,
        next_token : String? = nil,
        operation_name : String? = nil,
        slo_owner_aws_account_id : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceLevelObjectivesInput.new(dependency_config: dependency_config, include_linked_accounts: include_linked_accounts, key_attributes: key_attributes, max_results: max_results, metric_source_types: metric_source_types, next_token: next_token, operation_name: operation_name, slo_owner_aws_account_id: slo_owner_aws_account_id)
        list_service_level_objectives(input)
      end
      def list_service_level_objectives(input : Types::ListServiceLevelObjectivesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_LEVEL_OBJECTIVES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the operations of this service that have been discovered by Application Signals.
      # Only the operations that were invoked during the specified time range are returned.
      def list_service_operations(
        end_time : Time,
        key_attributes : Hash(String, String),
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceOperationsInput.new(end_time: end_time, key_attributes: key_attributes, start_time: start_time, max_results: max_results, next_token: next_token)
        list_service_operations(input)
      end
      def list_service_operations(input : Types::ListServiceOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the last deployment and other change states of services. This API provides
      # visibility into recent changes that may have affected service performance, helping with
      # troubleshooting and change correlation.
      def list_service_states(
        end_time : Time,
        start_time : Time,
        attribute_filters : Array(Types::AttributeFilter)? = nil,
        aws_account_id : String? = nil,
        include_linked_accounts : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceStatesInput.new(end_time: end_time, start_time: start_time, attribute_filters: attribute_filters, aws_account_id: aws_account_id, include_linked_accounts: include_linked_accounts, max_results: max_results, next_token: next_token)
        list_service_states(input)
      end
      def list_service_states(input : Types::ListServiceStatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_STATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of services that have been discovered by Application Signals. A service represents a
      # minimum logical and transactional unit that completes a business function. Services are discovered
      # through Application Signals instrumentation.
      def list_services(
        end_time : Time,
        start_time : Time,
        aws_account_id : String? = nil,
        include_linked_accounts : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServicesInput.new(end_time: end_time, start_time: start_time, aws_account_id: aws_account_id, include_linked_accounts: include_linked_accounts, max_results: max_results, next_token: next_token)
        list_services(input)
      end
      def list_services(input : Types::ListServicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a CloudWatch resource. Tags can be assigned to service level
      # objectives.
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

      # Creates or updates the grouping configuration for this account. This operation allows you to define
      # custom grouping attributes that determine how services are logically grouped based on telemetry
      # attributes, Amazon Web Services tags, or predefined mappings. These grouping attributes can then be
      # used to organize and filter services in the Application Signals console and APIs.
      def put_grouping_configuration(
        grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition)
      ) : Protocol::Request
        input = Types::PutGroupingConfigurationInput.new(grouping_attribute_definitions: grouping_attribute_definitions)
        put_grouping_configuration(input)
      end
      def put_grouping_configuration(input : Types::PutGroupingConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GROUPING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables this Amazon Web Services account to be able to use CloudWatch Application Signals by
      # creating the AWSServiceRoleForCloudWatchApplicationSignals service-linked role. This service- linked
      # role has the following permissions: xray:GetServiceGraph logs:StartQuery logs:GetQueryResults
      # cloudwatch:GetMetricData cloudwatch:ListMetrics tag:GetResources
      # autoscaling:DescribeAutoScalingGroups A service-linked CloudTrail event channel is created to
      # process CloudTrail events and return change event information. This includes last deployment time,
      # userName, eventName, and other event metadata. After completing this step, you still need to
      # instrument your Java and Python applications to send data to Application Signals. For more
      # information, see Enabling Application Signals .
      def start_discovery : Protocol::Request
        input = Types::StartDiscoveryInput.new
        start_discovery(input)
      end
      def start_discovery(input : Types::StartDiscoveryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DISCOVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified CloudWatch resource, such as a service
      # level objective. Tags can help you organize and categorize your resources. You can also use them to
      # scope user permissions by granting a user permission to access or change only resources with certain
      # tag values. Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly
      # as strings of characters. You can use the TagResource action with an alarm that already has tags. If
      # you specify a new tag key for the alarm, this tag is appended to the list of tags associated with
      # the alarm. If you specify a tag key that is already associated with the alarm, the new tag value
      # that you specify replaces the previous value for that tag. You can associate as many as 50 tags with
      # a CloudWatch resource.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
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

      # Updates an existing service level objective (SLO). If you omit parameters, the previous values of
      # those parameters are retained. You cannot change from a period-based SLO to a request-based SLO, or
      # change from a request-based SLO to a period-based SLO.
      def update_service_level_objective(
        id : String,
        burn_rate_configurations : Array(Types::BurnRateConfiguration)? = nil,
        description : String? = nil,
        goal : Types::Goal? = nil,
        request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig? = nil,
        sli_config : Types::ServiceLevelIndicatorConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateServiceLevelObjectiveInput.new(id: id, burn_rate_configurations: burn_rate_configurations, description: description, goal: goal, request_based_sli_config: request_based_sli_config, sli_config: sli_config)
        update_service_level_objective(input)
      end
      def update_service_level_objective(input : Types::UpdateServiceLevelObjectiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_LEVEL_OBJECTIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
