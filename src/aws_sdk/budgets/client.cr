module AwsSdk
  module Budgets
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

      # Creates a budget and, if included, notifications and subscribers. Only one of BudgetLimit or
      # PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your use
      # case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits , see the
      # Examples section. Similarly, only one set of filter and metric selections can be present in the
      # syntax at one time. Either FilterExpression and Metrics or CostFilters and CostTypes , not both or a
      # different combination. We recommend using FilterExpression and Metrics as they provide more flexible
      # and powerful filtering capabilities. The Request Syntax section shows the FilterExpression / Metrics
      # syntax.

      def create_budget(
        account_id : String,
        budget : Types::Budget,
        notifications_with_subscribers : Array(Types::NotificationWithSubscribers)? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateBudgetResponse

        input = Types::CreateBudgetRequest.new(account_id: account_id, budget: budget, notifications_with_subscribers: notifications_with_subscribers, resource_tags: resource_tags)
        create_budget(input)
      end

      def create_budget(input : Types::CreateBudgetRequest) : Types::CreateBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBudgetResponse, "CreateBudget")
      end

      # Creates a budget action.

      def create_budget_action(
        account_id : String,
        action_threshold : Types::ActionThreshold,
        action_type : String,
        approval_model : String,
        budget_name : String,
        definition : Types::Definition,
        execution_role_arn : String,
        notification_type : String,
        subscribers : Array(Types::Subscriber),
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateBudgetActionResponse

        input = Types::CreateBudgetActionRequest.new(account_id: account_id, action_threshold: action_threshold, action_type: action_type, approval_model: approval_model, budget_name: budget_name, definition: definition, execution_role_arn: execution_role_arn, notification_type: notification_type, subscribers: subscribers, resource_tags: resource_tags)
        create_budget_action(input)
      end

      def create_budget_action(input : Types::CreateBudgetActionRequest) : Types::CreateBudgetActionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BUDGET_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBudgetActionResponse, "CreateBudgetAction")
      end

      # Creates a notification. You must create the budget before you create the associated notification.

      def create_notification(
        account_id : String,
        budget_name : String,
        notification : Types::Notification,
        subscribers : Array(Types::Subscriber)
      ) : Types::CreateNotificationResponse

        input = Types::CreateNotificationRequest.new(account_id: account_id, budget_name: budget_name, notification: notification, subscribers: subscribers)
        create_notification(input)
      end

      def create_notification(input : Types::CreateNotificationRequest) : Types::CreateNotificationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNotificationResponse, "CreateNotification")
      end

      # Creates a subscriber. You must create the associated budget and notification before you create the
      # subscriber.

      def create_subscriber(
        account_id : String,
        budget_name : String,
        notification : Types::Notification,
        subscriber : Types::Subscriber
      ) : Types::CreateSubscriberResponse

        input = Types::CreateSubscriberRequest.new(account_id: account_id, budget_name: budget_name, notification: notification, subscriber: subscriber)
        create_subscriber(input)
      end

      def create_subscriber(input : Types::CreateSubscriberRequest) : Types::CreateSubscriberResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SUBSCRIBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSubscriberResponse, "CreateSubscriber")
      end

      # Deletes a budget. You can delete your budget at any time. Deleting a budget also deletes the
      # notifications and subscribers that are associated with that budget.

      def delete_budget(
        account_id : String,
        budget_name : String
      ) : Types::DeleteBudgetResponse

        input = Types::DeleteBudgetRequest.new(account_id: account_id, budget_name: budget_name)
        delete_budget(input)
      end

      def delete_budget(input : Types::DeleteBudgetRequest) : Types::DeleteBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBudgetResponse, "DeleteBudget")
      end

      # Deletes a budget action.

      def delete_budget_action(
        account_id : String,
        action_id : String,
        budget_name : String
      ) : Types::DeleteBudgetActionResponse

        input = Types::DeleteBudgetActionRequest.new(account_id: account_id, action_id: action_id, budget_name: budget_name)
        delete_budget_action(input)
      end

      def delete_budget_action(input : Types::DeleteBudgetActionRequest) : Types::DeleteBudgetActionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUDGET_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBudgetActionResponse, "DeleteBudgetAction")
      end

      # Deletes a notification. Deleting a notification also deletes the subscribers that are associated
      # with the notification.

      def delete_notification(
        account_id : String,
        budget_name : String,
        notification : Types::Notification
      ) : Types::DeleteNotificationResponse

        input = Types::DeleteNotificationRequest.new(account_id: account_id, budget_name: budget_name, notification: notification)
        delete_notification(input)
      end

      def delete_notification(input : Types::DeleteNotificationRequest) : Types::DeleteNotificationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNotificationResponse, "DeleteNotification")
      end

      # Deletes a subscriber. Deleting the last subscriber to a notification also deletes the notification.

      def delete_subscriber(
        account_id : String,
        budget_name : String,
        notification : Types::Notification,
        subscriber : Types::Subscriber
      ) : Types::DeleteSubscriberResponse

        input = Types::DeleteSubscriberRequest.new(account_id: account_id, budget_name: budget_name, notification: notification, subscriber: subscriber)
        delete_subscriber(input)
      end

      def delete_subscriber(input : Types::DeleteSubscriberRequest) : Types::DeleteSubscriberResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SUBSCRIBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSubscriberResponse, "DeleteSubscriber")
      end

      # Describes a budget. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits
      # , see the Examples section.

      def describe_budget(
        account_id : String,
        budget_name : String,
        show_filter_expression : Bool? = nil
      ) : Types::DescribeBudgetResponse

        input = Types::DescribeBudgetRequest.new(account_id: account_id, budget_name: budget_name, show_filter_expression: show_filter_expression)
        describe_budget(input)
      end

      def describe_budget(input : Types::DescribeBudgetRequest) : Types::DescribeBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetResponse, "DescribeBudget")
      end

      # Describes a budget action detail.

      def describe_budget_action(
        account_id : String,
        action_id : String,
        budget_name : String
      ) : Types::DescribeBudgetActionResponse

        input = Types::DescribeBudgetActionRequest.new(account_id: account_id, action_id: action_id, budget_name: budget_name)
        describe_budget_action(input)
      end

      def describe_budget_action(input : Types::DescribeBudgetActionRequest) : Types::DescribeBudgetActionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetActionResponse, "DescribeBudgetAction")
      end

      # Describes a budget action history detail.

      def describe_budget_action_histories(
        account_id : String,
        action_id : String,
        budget_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        time_period : Types::TimePeriod? = nil
      ) : Types::DescribeBudgetActionHistoriesResponse

        input = Types::DescribeBudgetActionHistoriesRequest.new(account_id: account_id, action_id: action_id, budget_name: budget_name, max_results: max_results, next_token: next_token, time_period: time_period)
        describe_budget_action_histories(input)
      end

      def describe_budget_action_histories(input : Types::DescribeBudgetActionHistoriesRequest) : Types::DescribeBudgetActionHistoriesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_ACTION_HISTORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetActionHistoriesResponse, "DescribeBudgetActionHistories")
      end

      # Describes all of the budget actions for an account.

      def describe_budget_actions_for_account(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeBudgetActionsForAccountResponse

        input = Types::DescribeBudgetActionsForAccountRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        describe_budget_actions_for_account(input)
      end

      def describe_budget_actions_for_account(input : Types::DescribeBudgetActionsForAccountRequest) : Types::DescribeBudgetActionsForAccountResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_ACTIONS_FOR_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetActionsForAccountResponse, "DescribeBudgetActionsForAccount")
      end

      # Describes all of the budget actions for a budget.

      def describe_budget_actions_for_budget(
        account_id : String,
        budget_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeBudgetActionsForBudgetResponse

        input = Types::DescribeBudgetActionsForBudgetRequest.new(account_id: account_id, budget_name: budget_name, max_results: max_results, next_token: next_token)
        describe_budget_actions_for_budget(input)
      end

      def describe_budget_actions_for_budget(input : Types::DescribeBudgetActionsForBudgetRequest) : Types::DescribeBudgetActionsForBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_ACTIONS_FOR_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetActionsForBudgetResponse, "DescribeBudgetActionsForBudget")
      end

      # Lists the budget names and notifications that are associated with an account.

      def describe_budget_notifications_for_account(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeBudgetNotificationsForAccountResponse

        input = Types::DescribeBudgetNotificationsForAccountRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        describe_budget_notifications_for_account(input)
      end

      def describe_budget_notifications_for_account(input : Types::DescribeBudgetNotificationsForAccountRequest) : Types::DescribeBudgetNotificationsForAccountResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_NOTIFICATIONS_FOR_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetNotificationsForAccountResponse, "DescribeBudgetNotificationsForAccount")
      end

      # Describes the history for DAILY , MONTHLY , and QUARTERLY budgets. Budget history isn't available
      # for ANNUAL budgets.

      def describe_budget_performance_history(
        account_id : String,
        budget_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        time_period : Types::TimePeriod? = nil
      ) : Types::DescribeBudgetPerformanceHistoryResponse

        input = Types::DescribeBudgetPerformanceHistoryRequest.new(account_id: account_id, budget_name: budget_name, max_results: max_results, next_token: next_token, time_period: time_period)
        describe_budget_performance_history(input)
      end

      def describe_budget_performance_history(input : Types::DescribeBudgetPerformanceHistoryRequest) : Types::DescribeBudgetPerformanceHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGET_PERFORMANCE_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetPerformanceHistoryResponse, "DescribeBudgetPerformanceHistory")
      end

      # Lists the budgets that are associated with an account. The Request Syntax section shows the
      # BudgetLimit syntax. For PlannedBudgetLimits , see the Examples section.

      def describe_budgets(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        show_filter_expression : Bool? = nil
      ) : Types::DescribeBudgetsResponse

        input = Types::DescribeBudgetsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token, show_filter_expression: show_filter_expression)
        describe_budgets(input)
      end

      def describe_budgets(input : Types::DescribeBudgetsRequest) : Types::DescribeBudgetsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUDGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBudgetsResponse, "DescribeBudgets")
      end

      # Lists the notifications that are associated with a budget.

      def describe_notifications_for_budget(
        account_id : String,
        budget_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeNotificationsForBudgetResponse

        input = Types::DescribeNotificationsForBudgetRequest.new(account_id: account_id, budget_name: budget_name, max_results: max_results, next_token: next_token)
        describe_notifications_for_budget(input)
      end

      def describe_notifications_for_budget(input : Types::DescribeNotificationsForBudgetRequest) : Types::DescribeNotificationsForBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NOTIFICATIONS_FOR_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNotificationsForBudgetResponse, "DescribeNotificationsForBudget")
      end

      # Lists the subscribers that are associated with a notification.

      def describe_subscribers_for_notification(
        account_id : String,
        budget_name : String,
        notification : Types::Notification,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeSubscribersForNotificationResponse

        input = Types::DescribeSubscribersForNotificationRequest.new(account_id: account_id, budget_name: budget_name, notification: notification, max_results: max_results, next_token: next_token)
        describe_subscribers_for_notification(input)
      end

      def describe_subscribers_for_notification(input : Types::DescribeSubscribersForNotificationRequest) : Types::DescribeSubscribersForNotificationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUBSCRIBERS_FOR_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSubscribersForNotificationResponse, "DescribeSubscribersForNotification")
      end

      # Executes a budget action.

      def execute_budget_action(
        account_id : String,
        action_id : String,
        budget_name : String,
        execution_type : String
      ) : Types::ExecuteBudgetActionResponse

        input = Types::ExecuteBudgetActionRequest.new(account_id: account_id, action_id: action_id, budget_name: budget_name, execution_type: execution_type)
        execute_budget_action(input)
      end

      def execute_budget_action(input : Types::ExecuteBudgetActionRequest) : Types::ExecuteBudgetActionResponse
        request = Protocol::JsonRpc.build_request(Model::EXECUTE_BUDGET_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExecuteBudgetActionResponse, "ExecuteBudgetAction")
      end

      # Lists tags associated with a budget or budget action resource.

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

      # Creates tags for a budget or budget action resource.

      def tag_resource(
        resource_arn : String,
        resource_tags : Array(Types::ResourceTag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, resource_tags: resource_tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes tags associated with a budget or budget action resource.

      def untag_resource(
        resource_arn : String,
        resource_tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, resource_tag_keys: resource_tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates a budget. You can change every part of a budget except for the budgetName and the
      # calculatedSpend . When you modify a budget, the calculatedSpend drops to zero until Amazon Web
      # Services has new usage data to use for forecasting. Only one of BudgetLimit or PlannedBudgetLimits
      # can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax
      # section shows the BudgetLimit syntax. For PlannedBudgetLimits , see the Examples section. Similarly,
      # only one set of filter and metric selections can be present in the syntax at one time. Either
      # FilterExpression and Metrics or CostFilters and CostTypes , not both or a different combination. We
      # recommend using FilterExpression and Metrics as they provide more flexible and powerful filtering
      # capabilities. The Request Syntax section shows the FilterExpression / Metrics syntax.

      def update_budget(
        account_id : String,
        new_budget : Types::Budget
      ) : Types::UpdateBudgetResponse

        input = Types::UpdateBudgetRequest.new(account_id: account_id, new_budget: new_budget)
        update_budget(input)
      end

      def update_budget(input : Types::UpdateBudgetRequest) : Types::UpdateBudgetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BUDGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBudgetResponse, "UpdateBudget")
      end

      # Updates a budget action.

      def update_budget_action(
        account_id : String,
        action_id : String,
        budget_name : String,
        action_threshold : Types::ActionThreshold? = nil,
        approval_model : String? = nil,
        definition : Types::Definition? = nil,
        execution_role_arn : String? = nil,
        notification_type : String? = nil,
        subscribers : Array(Types::Subscriber)? = nil
      ) : Types::UpdateBudgetActionResponse

        input = Types::UpdateBudgetActionRequest.new(account_id: account_id, action_id: action_id, budget_name: budget_name, action_threshold: action_threshold, approval_model: approval_model, definition: definition, execution_role_arn: execution_role_arn, notification_type: notification_type, subscribers: subscribers)
        update_budget_action(input)
      end

      def update_budget_action(input : Types::UpdateBudgetActionRequest) : Types::UpdateBudgetActionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BUDGET_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBudgetActionResponse, "UpdateBudgetAction")
      end

      # Updates a notification.

      def update_notification(
        account_id : String,
        budget_name : String,
        new_notification : Types::Notification,
        old_notification : Types::Notification
      ) : Types::UpdateNotificationResponse

        input = Types::UpdateNotificationRequest.new(account_id: account_id, budget_name: budget_name, new_notification: new_notification, old_notification: old_notification)
        update_notification(input)
      end

      def update_notification(input : Types::UpdateNotificationRequest) : Types::UpdateNotificationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotificationResponse, "UpdateNotification")
      end

      # Updates a subscriber.

      def update_subscriber(
        account_id : String,
        budget_name : String,
        new_subscriber : Types::Subscriber,
        notification : Types::Notification,
        old_subscriber : Types::Subscriber
      ) : Types::UpdateSubscriberResponse

        input = Types::UpdateSubscriberRequest.new(account_id: account_id, budget_name: budget_name, new_subscriber: new_subscriber, notification: notification, old_subscriber: old_subscriber)
        update_subscriber(input)
      end

      def update_subscriber(input : Types::UpdateSubscriberRequest) : Types::UpdateSubscriberResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SUBSCRIBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSubscriberResponse, "UpdateSubscriber")
      end
    end
  end
end
