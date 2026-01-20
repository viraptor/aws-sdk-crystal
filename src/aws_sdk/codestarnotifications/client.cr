module AwsSdk
  module CodestarNotifications
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

      # Creates a notification rule for a resource. The rule specifies the events you want notifications
      # about and the targets (such as Amazon Q Developer in chat applications topics or Amazon Q Developer
      # in chat applications clients configured for Slack) where you want to receive them.

      def create_notification_rule(
        detail_type : String,
        event_type_ids : Array(String),
        name : String,
        resource : String,
        targets : Array(Types::Target),
        client_request_token : String? = nil,
        status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNotificationRuleRequest.new(detail_type: detail_type, event_type_ids: event_type_ids, name: name, resource: resource, targets: targets, client_request_token: client_request_token, status: status, tags: tags)
        create_notification_rule(input)
      end

      def create_notification_rule(input : Types::CreateNotificationRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NOTIFICATION_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a notification rule for a resource.

      def delete_notification_rule(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteNotificationRuleRequest.new(arn: arn)
        delete_notification_rule(input)
      end

      def delete_notification_rule(input : Types::DeleteNotificationRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NOTIFICATION_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified target for notifications.

      def delete_target(
        target_address : String,
        force_unsubscribe_all : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteTargetRequest.new(target_address: target_address, force_unsubscribe_all: force_unsubscribe_all)
        delete_target(input)
      end

      def delete_target(input : Types::DeleteTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified notification rule.

      def describe_notification_rule(
        arn : String
      ) : Protocol::Request
        input = Types::DescribeNotificationRuleRequest.new(arn: arn)
        describe_notification_rule(input)
      end

      def describe_notification_rule(input : Types::DescribeNotificationRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NOTIFICATION_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the event types available for configuring notifications.

      def list_event_types(
        filters : Array(Types::ListEventTypesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventTypesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_event_types(input)
      end

      def list_event_types(input : Types::ListEventTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the notification rules for an Amazon Web Services account.

      def list_notification_rules(
        filters : Array(Types::ListNotificationRulesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationRulesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_notification_rules(input)
      end

      def list_notification_rules(input : Types::ListNotificationRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags associated with a notification rule.

      def list_tags_for_resource(
        arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(arn: arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the notification rule targets for an Amazon Web Services account.

      def list_targets(
        filters : Array(Types::ListTargetsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTargetsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_targets(input)
      end

      def list_targets(input : Types::ListTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between a notification rule and an Amazon Q Developer in chat applications
      # topic or Amazon Q Developer in chat applications client so that the associated target can receive
      # notifications when the events described in the rule are triggered.

      def subscribe(
        arn : String,
        target : Types::Target,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::SubscribeRequest.new(arn: arn, target: target, client_request_token: client_request_token)
        subscribe(input)
      end

      def subscribe(input : Types::SubscribeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBSCRIBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a set of provided tags with a notification rule.

      def tag_resource(
        arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an association between a notification rule and an Amazon Q Developer in chat applications
      # topic so that subscribers to that topic stop receiving notifications when the events described in
      # the rule are triggered.

      def unsubscribe(
        arn : String,
        target_address : String
      ) : Protocol::Request
        input = Types::UnsubscribeRequest.new(arn: arn, target_address: target_address)
        unsubscribe(input)
      end

      def unsubscribe(input : Types::UnsubscribeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNSUBSCRIBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between one or more provided tags and a notification rule.

      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a notification rule for a resource. You can change the events that trigger the notification
      # rule, the status of the rule, and the targets that receive the notifications. To add or remove tags
      # for a notification rule, you must use TagResource and UntagResource .

      def update_notification_rule(
        arn : String,
        detail_type : String? = nil,
        event_type_ids : Array(String)? = nil,
        name : String? = nil,
        status : String? = nil,
        targets : Array(Types::Target)? = nil
      ) : Protocol::Request
        input = Types::UpdateNotificationRuleRequest.new(arn: arn, detail_type: detail_type, event_type_ids: event_type_ids, name: name, status: status, targets: targets)
        update_notification_rule(input)
      end

      def update_notification_rule(input : Types::UpdateNotificationRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NOTIFICATION_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
