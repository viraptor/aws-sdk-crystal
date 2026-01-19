module AwsSdk
  module ComputeOptimizerAutomation
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

      # Associates one or more member accounts with your organization's management account, enabling
      # centralized implementation of optimization actions across those accounts. Once associated, the
      # management account (or a delegated administrator) can apply recommended actions to the member
      # account. When you associate a member account, its organization rule mode is automatically set to
      # "Any allowed," which permits the management account to create Automation rules that automatically
      # apply actions to that account. If the member account has not previously enabled the Automation
      # feature, the association process automatically enables it. Only the management account or a
      # delegated administrator can perform this action.
      def associate_accounts(
        account_ids : Array(String),
        client_token : String? = nil
      ) : Types::AssociateAccountsResponse
        input = Types::AssociateAccountsRequest.new(account_ids: account_ids, client_token: client_token)
        associate_accounts(input)
      end
      def associate_accounts(input : Types::AssociateAccountsRequest) : Types::AssociateAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateAccountsResponse, "AssociateAccounts")
      end

      # Creates a new automation rule to apply recommended actions to resources based on specified criteria.
      def create_automation_rule(
        name : String,
        recommended_action_types : Array(String),
        rule_type : String,
        schedule : Types::Schedule,
        status : String,
        client_token : String? = nil,
        criteria : Types::Criteria? = nil,
        description : String? = nil,
        organization_configuration : Types::OrganizationConfiguration? = nil,
        priority : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAutomationRuleResponse
        input = Types::CreateAutomationRuleRequest.new(name: name, recommended_action_types: recommended_action_types, rule_type: rule_type, schedule: schedule, status: status, client_token: client_token, criteria: criteria, description: description, organization_configuration: organization_configuration, priority: priority, tags: tags)
        create_automation_rule(input)
      end
      def create_automation_rule(input : Types::CreateAutomationRuleRequest) : Types::CreateAutomationRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AUTOMATION_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAutomationRuleResponse, "CreateAutomationRule")
      end

      # Deletes an existing automation rule.
      def delete_automation_rule(
        rule_arn : String,
        rule_revision : Int64,
        client_token : String? = nil
      ) : Types::DeleteAutomationRuleResponse
        input = Types::DeleteAutomationRuleRequest.new(rule_arn: rule_arn, rule_revision: rule_revision, client_token: client_token)
        delete_automation_rule(input)
      end
      def delete_automation_rule(input : Types::DeleteAutomationRuleRequest) : Types::DeleteAutomationRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_AUTOMATION_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAutomationRuleResponse, "DeleteAutomationRule")
      end

      # Disassociates member accounts from your organization's management account, removing centralized
      # automation capabilities. Once disassociated, organization rules no longer apply to the member
      # account, and the management account (or delegated administrator) cannot create Automation rules for
      # that account. Only the management account or a delegated administrator can perform this action.
      def disassociate_accounts(
        account_ids : Array(String),
        client_token : String? = nil
      ) : Types::DisassociateAccountsResponse
        input = Types::DisassociateAccountsRequest.new(account_ids: account_ids, client_token: client_token)
        disassociate_accounts(input)
      end
      def disassociate_accounts(input : Types::DisassociateAccountsRequest) : Types::DisassociateAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateAccountsResponse, "DisassociateAccounts")
      end

      # Retrieves details about a specific automation event.
      def get_automation_event(
        event_id : String
      ) : Types::GetAutomationEventResponse
        input = Types::GetAutomationEventRequest.new(event_id: event_id)
        get_automation_event(input)
      end
      def get_automation_event(input : Types::GetAutomationEventRequest) : Types::GetAutomationEventResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTOMATION_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutomationEventResponse, "GetAutomationEvent")
      end

      # Retrieves details about a specific automation rule.
      def get_automation_rule(
        rule_arn : String
      ) : Types::GetAutomationRuleResponse
        input = Types::GetAutomationRuleRequest.new(rule_arn: rule_arn)
        get_automation_rule(input)
      end
      def get_automation_rule(input : Types::GetAutomationRuleRequest) : Types::GetAutomationRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTOMATION_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutomationRuleResponse, "GetAutomationRule")
      end

      # Retrieves the current enrollment configuration for Compute Optimizer Automation.
      def get_enrollment_configuration : Types::GetEnrollmentConfigurationResponse
        input = Types::GetEnrollmentConfigurationRequest.new
        get_enrollment_configuration(input)
      end
      def get_enrollment_configuration(input : Types::GetEnrollmentConfigurationRequest) : Types::GetEnrollmentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENROLLMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnrollmentConfigurationResponse, "GetEnrollmentConfiguration")
      end

      # Lists the accounts in your organization that are enrolled in Compute Optimizer and whether they have
      # enabled Automation. Only the management account or a delegated administrator can perform this
      # action.
      def list_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountsResponse
        input = Types::ListAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_accounts(input)
      end
      def list_accounts(input : Types::ListAccountsRequest) : Types::ListAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountsResponse, "ListAccounts")
      end

      # Lists the steps for a specific automation event. You can only list steps for events created within
      # the past year.
      def list_automation_event_steps(
        event_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAutomationEventStepsResponse
        input = Types::ListAutomationEventStepsRequest.new(event_id: event_id, max_results: max_results, next_token: next_token)
        list_automation_event_steps(input)
      end
      def list_automation_event_steps(input : Types::ListAutomationEventStepsRequest) : Types::ListAutomationEventStepsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_EVENT_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationEventStepsResponse, "ListAutomationEventSteps")
      end

      # Provides a summary of automation events based on specified filters. Only events created within the
      # past year will be included in the summary.
      def list_automation_event_summaries(
        end_date_exclusive : String? = nil,
        filters : Array(Types::AutomationEventFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_date_inclusive : String? = nil
      ) : Types::ListAutomationEventSummariesResponse
        input = Types::ListAutomationEventSummariesRequest.new(end_date_exclusive: end_date_exclusive, filters: filters, max_results: max_results, next_token: next_token, start_date_inclusive: start_date_inclusive)
        list_automation_event_summaries(input)
      end
      def list_automation_event_summaries(input : Types::ListAutomationEventSummariesRequest) : Types::ListAutomationEventSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_EVENT_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationEventSummariesResponse, "ListAutomationEventSummaries")
      end

      # Lists automation events based on specified filters. You can retrieve events that were created within
      # the past year.
      def list_automation_events(
        end_time_exclusive : Time? = nil,
        filters : Array(Types::AutomationEventFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time_inclusive : Time? = nil
      ) : Types::ListAutomationEventsResponse
        input = Types::ListAutomationEventsRequest.new(end_time_exclusive: end_time_exclusive, filters: filters, max_results: max_results, next_token: next_token, start_time_inclusive: start_time_inclusive)
        list_automation_events(input)
      end
      def list_automation_events(input : Types::ListAutomationEventsRequest) : Types::ListAutomationEventsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationEventsResponse, "ListAutomationEvents")
      end

      # Returns a preview of the recommended actions that match your Automation rule's configuration and
      # criteria.
      def list_automation_rule_preview(
        recommended_action_types : Array(String),
        rule_type : String,
        criteria : Types::Criteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organization_scope : Types::OrganizationScope? = nil
      ) : Types::ListAutomationRulePreviewResponse
        input = Types::ListAutomationRulePreviewRequest.new(recommended_action_types: recommended_action_types, rule_type: rule_type, criteria: criteria, max_results: max_results, next_token: next_token, organization_scope: organization_scope)
        list_automation_rule_preview(input)
      end
      def list_automation_rule_preview(input : Types::ListAutomationRulePreviewRequest) : Types::ListAutomationRulePreviewResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_RULE_PREVIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationRulePreviewResponse, "ListAutomationRulePreview")
      end

      # Returns a summary of the recommended actions that match your rule preview configuration and
      # criteria.
      def list_automation_rule_preview_summaries(
        recommended_action_types : Array(String),
        rule_type : String,
        criteria : Types::Criteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organization_scope : Types::OrganizationScope? = nil
      ) : Types::ListAutomationRulePreviewSummariesResponse
        input = Types::ListAutomationRulePreviewSummariesRequest.new(recommended_action_types: recommended_action_types, rule_type: rule_type, criteria: criteria, max_results: max_results, next_token: next_token, organization_scope: organization_scope)
        list_automation_rule_preview_summaries(input)
      end
      def list_automation_rule_preview_summaries(input : Types::ListAutomationRulePreviewSummariesRequest) : Types::ListAutomationRulePreviewSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_RULE_PREVIEW_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationRulePreviewSummariesResponse, "ListAutomationRulePreviewSummaries")
      end

      # Lists the automation rules that match specified filters.
      def list_automation_rules(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAutomationRulesResponse
        input = Types::ListAutomationRulesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_automation_rules(input)
      end
      def list_automation_rules(input : Types::ListAutomationRulesRequest) : Types::ListAutomationRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTOMATION_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutomationRulesResponse, "ListAutomationRules")
      end

      # Provides a summary of recommended actions based on specified filters. Management accounts and
      # delegated administrators can retrieve recommended actions that include associated member accounts.
      # You can associate a member account using AssociateAccounts .
      def list_recommended_action_summaries(
        filters : Array(Types::RecommendedActionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRecommendedActionSummariesResponse
        input = Types::ListRecommendedActionSummariesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_recommended_action_summaries(input)
      end
      def list_recommended_action_summaries(input : Types::ListRecommendedActionSummariesRequest) : Types::ListRecommendedActionSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDED_ACTION_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendedActionSummariesResponse, "ListRecommendedActionSummaries")
      end

      # Lists the recommended actions based that match specified filters. Management accounts and delegated
      # administrators can retrieve recommended actions that include associated member accounts. You can
      # associate a member account using AssociateAccounts .
      def list_recommended_actions(
        filters : Array(Types::RecommendedActionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRecommendedActionsResponse
        input = Types::ListRecommendedActionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_recommended_actions(input)
      end
      def list_recommended_actions(input : Types::ListRecommendedActionsRequest) : Types::ListRecommendedActionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendedActionsResponse, "ListRecommendedActions")
      end

      # Lists the tags for a specified resource.
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

      # Initiates a rollback for a completed automation event. Management accounts and delegated
      # administrators can only initiate a rollback for events belonging to associated member accounts. You
      # can associate a member account using AssociateAccounts .
      def rollback_automation_event(
        event_id : String,
        client_token : String? = nil
      ) : Types::RollbackAutomationEventResponse
        input = Types::RollbackAutomationEventRequest.new(event_id: event_id, client_token: client_token)
        rollback_automation_event(input)
      end
      def rollback_automation_event(input : Types::RollbackAutomationEventRequest) : Types::RollbackAutomationEventResponse
        request = Protocol::JsonRpc.build_request(Model::ROLLBACK_AUTOMATION_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RollbackAutomationEventResponse, "RollbackAutomationEvent")
      end

      # Initiates a one-time, on-demand automation for the specified recommended action. Management accounts
      # and delegated administrators can only initiate recommended actions for associated member accounts.
      # You can associate a member account using AssociateAccounts .
      def start_automation_event(
        recommended_action_id : String,
        client_token : String? = nil
      ) : Types::StartAutomationEventResponse
        input = Types::StartAutomationEventRequest.new(recommended_action_id: recommended_action_id, client_token: client_token)
        start_automation_event(input)
      end
      def start_automation_event(input : Types::StartAutomationEventRequest) : Types::StartAutomationEventResponse
        request = Protocol::JsonRpc.build_request(Model::START_AUTOMATION_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAutomationEventResponse, "StartAutomationEvent")
      end

      # Adds tags to the specified resource.
      def tag_resource(
        resource_arn : String,
        rule_revision : Int64,
        tags : Array(Types::Tag),
        client_token : String? = nil
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, rule_revision: rule_revision, tags: tags, client_token: client_token)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from the specified resource.
      def untag_resource(
        resource_arn : String,
        rule_revision : Int64,
        tag_keys : Array(String),
        client_token : String? = nil
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, rule_revision: rule_revision, tag_keys: tag_keys, client_token: client_token)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing automation rule.
      def update_automation_rule(
        rule_arn : String,
        rule_revision : Int64,
        client_token : String? = nil,
        criteria : Types::Criteria? = nil,
        description : String? = nil,
        name : String? = nil,
        organization_configuration : Types::OrganizationConfiguration? = nil,
        priority : String? = nil,
        recommended_action_types : Array(String)? = nil,
        rule_type : String? = nil,
        schedule : Types::Schedule? = nil,
        status : String? = nil
      ) : Types::UpdateAutomationRuleResponse
        input = Types::UpdateAutomationRuleRequest.new(rule_arn: rule_arn, rule_revision: rule_revision, client_token: client_token, criteria: criteria, description: description, name: name, organization_configuration: organization_configuration, priority: priority, recommended_action_types: recommended_action_types, rule_type: rule_type, schedule: schedule, status: status)
        update_automation_rule(input)
      end
      def update_automation_rule(input : Types::UpdateAutomationRuleRequest) : Types::UpdateAutomationRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AUTOMATION_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAutomationRuleResponse, "UpdateAutomationRule")
      end

      # Updates your account’s Compute Optimizer Automation enrollment configuration.
      def update_enrollment_configuration(
        status : String,
        client_token : String? = nil
      ) : Types::UpdateEnrollmentConfigurationResponse
        input = Types::UpdateEnrollmentConfigurationRequest.new(status: status, client_token: client_token)
        update_enrollment_configuration(input)
      end
      def update_enrollment_configuration(input : Types::UpdateEnrollmentConfigurationRequest) : Types::UpdateEnrollmentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENROLLMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnrollmentConfigurationResponse, "UpdateEnrollmentConfiguration")
      end
    end
  end
end
