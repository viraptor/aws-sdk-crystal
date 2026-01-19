module AwsSdk
  module Notifications
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

      # Associates a delivery Channel with a particular NotificationConfiguration . Supported Channels
      # include Amazon Q Developer in chat applications, the Console Mobile Application, and emails
      # (notifications-contacts).
      def associate_channel(
        arn : String,
        notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::AssociateChannelRequest.new(arn: arn, notification_configuration_arn: notification_configuration_arn)
        associate_channel(input)
      end
      def associate_channel(input : Types::AssociateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an Account Contact with a particular ManagedNotificationConfiguration .
      def associate_managed_notification_account_contact(
        contact_identifier : String,
        managed_notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::AssociateManagedNotificationAccountContactRequest.new(contact_identifier: contact_identifier, managed_notification_configuration_arn: managed_notification_configuration_arn)
        associate_managed_notification_account_contact(input)
      end
      def associate_managed_notification_account_contact(input : Types::AssociateManagedNotificationAccountContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MANAGED_NOTIFICATION_ACCOUNT_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an additional Channel with a particular ManagedNotificationConfiguration . Supported
      # Channels include Amazon Q Developer in chat applications, the Console Mobile Application, and emails
      # (notifications-contacts).
      def associate_managed_notification_additional_channel(
        channel_arn : String,
        managed_notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::AssociateManagedNotificationAdditionalChannelRequest.new(channel_arn: channel_arn, managed_notification_configuration_arn: managed_notification_configuration_arn)
        associate_managed_notification_additional_channel(input)
      end
      def associate_managed_notification_additional_channel(input : Types::AssociateManagedNotificationAdditionalChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MANAGED_NOTIFICATION_ADDITIONAL_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an organizational unit with a notification configuration.
      def associate_organizational_unit(
        notification_configuration_arn : String,
        organizational_unit_id : String
      ) : Protocol::Request
        input = Types::AssociateOrganizationalUnitRequest.new(notification_configuration_arn: notification_configuration_arn, organizational_unit_id: organizational_unit_id)
        associate_organizational_unit(input)
      end
      def associate_organizational_unit(input : Types::AssociateOrganizationalUnitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ORGANIZATIONAL_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an EventRule that is associated with a specified NotificationConfiguration .
      def create_event_rule(
        event_type : String,
        notification_configuration_arn : String,
        regions : Array(String),
        source : String,
        event_pattern : String? = nil
      ) : Protocol::Request
        input = Types::CreateEventRuleRequest.new(event_type: event_type, notification_configuration_arn: notification_configuration_arn, regions: regions, source: source, event_pattern: event_pattern)
        create_event_rule(input)
      end
      def create_event_rule(input : Types::CreateEventRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new NotificationConfiguration .
      def create_notification_configuration(
        description : String,
        name : String,
        aggregation_duration : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNotificationConfigurationRequest.new(description: description, name: name, aggregation_duration: aggregation_duration, tags: tags)
        create_notification_configuration(input)
      end
      def create_notification_configuration(input : Types::CreateNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an EventRule .
      def delete_event_rule(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteEventRuleRequest.new(arn: arn)
        delete_event_rule(input)
      end
      def delete_event_rule(input : Types::DeleteEventRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a NotificationConfiguration .
      def delete_notification_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteNotificationConfigurationRequest.new(arn: arn)
        delete_notification_configuration(input)
      end
      def delete_notification_configuration(input : Types::DeleteNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters a NotificationConfiguration in the specified Region. You can't deregister the last
      # NotificationHub in the account. NotificationEvents stored in the deregistered
      # NotificationConfiguration are no longer be visible. Recreating a new NotificationConfiguration in
      # the same Region restores access to those NotificationEvents .
      def deregister_notification_hub(
        notification_hub_region : String
      ) : Protocol::Request
        input = Types::DeregisterNotificationHubRequest.new(notification_hub_region: notification_hub_region)
        deregister_notification_hub(input)
      end
      def deregister_notification_hub(input : Types::DeregisterNotificationHubRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_NOTIFICATION_HUB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables service trust between User Notifications and Amazon Web Services Organizations.
      def disable_notifications_access_for_organization : Protocol::Request
        input = Types::DisableNotificationsAccessForOrganizationRequest.new
        disable_notifications_access_for_organization(input)
      end
      def disable_notifications_access_for_organization(input : Types::DisableNotificationsAccessForOrganizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a Channel from a specified NotificationConfiguration . Supported Channels include
      # Amazon Q Developer in chat applications, the Console Mobile Application, and emails
      # (notifications-contacts).
      def disassociate_channel(
        arn : String,
        notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::DisassociateChannelRequest.new(arn: arn, notification_configuration_arn: notification_configuration_arn)
        disassociate_channel(input)
      end
      def disassociate_channel(input : Types::DisassociateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an Account Contact with a particular ManagedNotificationConfiguration .
      def disassociate_managed_notification_account_contact(
        contact_identifier : String,
        managed_notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::DisassociateManagedNotificationAccountContactRequest.new(contact_identifier: contact_identifier, managed_notification_configuration_arn: managed_notification_configuration_arn)
        disassociate_managed_notification_account_contact(input)
      end
      def disassociate_managed_notification_account_contact(input : Types::DisassociateManagedNotificationAccountContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MANAGED_NOTIFICATION_ACCOUNT_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an additional Channel from a particular ManagedNotificationConfiguration . Supported
      # Channels include Amazon Q Developer in chat applications, the Console Mobile Application, and emails
      # (notifications-contacts).
      def disassociate_managed_notification_additional_channel(
        channel_arn : String,
        managed_notification_configuration_arn : String
      ) : Protocol::Request
        input = Types::DisassociateManagedNotificationAdditionalChannelRequest.new(channel_arn: channel_arn, managed_notification_configuration_arn: managed_notification_configuration_arn)
        disassociate_managed_notification_additional_channel(input)
      end
      def disassociate_managed_notification_additional_channel(input : Types::DisassociateManagedNotificationAdditionalChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MANAGED_NOTIFICATION_ADDITIONAL_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between an organizational unit and a notification configuration.
      def disassociate_organizational_unit(
        notification_configuration_arn : String,
        organizational_unit_id : String
      ) : Protocol::Request
        input = Types::DisassociateOrganizationalUnitRequest.new(notification_configuration_arn: notification_configuration_arn, organizational_unit_id: organizational_unit_id)
        disassociate_organizational_unit(input)
      end
      def disassociate_organizational_unit(input : Types::DisassociateOrganizationalUnitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ORGANIZATIONAL_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables service trust between User Notifications and Amazon Web Services Organizations.
      def enable_notifications_access_for_organization : Protocol::Request
        input = Types::EnableNotificationsAccessForOrganizationRequest.new
        enable_notifications_access_for_organization(input)
      end
      def enable_notifications_access_for_organization(input : Types::EnableNotificationsAccessForOrganizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a specified EventRule .
      def get_event_rule(
        arn : String
      ) : Protocol::Request
        input = Types::GetEventRuleRequest.new(arn: arn)
        get_event_rule(input)
      end
      def get_event_rule(input : Types::GetEventRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the child event of a specific given ManagedNotificationEvent .
      def get_managed_notification_child_event(
        arn : String,
        locale : String? = nil
      ) : Protocol::Request
        input = Types::GetManagedNotificationChildEventRequest.new(arn: arn, locale: locale)
        get_managed_notification_child_event(input)
      end
      def get_managed_notification_child_event(input : Types::GetManagedNotificationChildEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_NOTIFICATION_CHILD_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a specified ManagedNotificationConfiguration .
      def get_managed_notification_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetManagedNotificationConfigurationRequest.new(arn: arn)
        get_managed_notification_configuration(input)
      end
      def get_managed_notification_configuration(input : Types::GetManagedNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a specified ManagedNotificationEvent .
      def get_managed_notification_event(
        arn : String,
        locale : String? = nil
      ) : Protocol::Request
        input = Types::GetManagedNotificationEventRequest.new(arn: arn, locale: locale)
        get_managed_notification_event(input)
      end
      def get_managed_notification_event(input : Types::GetManagedNotificationEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_NOTIFICATION_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a specified NotificationConfiguration .
      def get_notification_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetNotificationConfigurationRequest.new(arn: arn)
        get_notification_configuration(input)
      end
      def get_notification_configuration(input : Types::GetNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a specified NotificationEvent . User Notifications stores notifications in the individual
      # Regions you register as notification hubs and the Region of the source event rule.
      # GetNotificationEvent only returns notifications stored in the same Region in which the action is
      # called. User Notifications doesn't backfill notifications to new Regions selected as notification
      # hubs. For this reason, we recommend that you make calls in your oldest registered notification hub.
      # For more information, see Notification hubs in the Amazon Web Services User Notifications User Guide
      # .
      def get_notification_event(
        arn : String,
        locale : String? = nil
      ) : Protocol::Request
        input = Types::GetNotificationEventRequest.new(arn: arn, locale: locale)
        get_notification_event(input)
      end
      def get_notification_event(input : Types::GetNotificationEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NOTIFICATION_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the AccessStatus of Service Trust Enablement for User Notifications and Amazon Web Services
      # Organizations.
      def get_notifications_access_for_organization : Protocol::Request
        input = Types::GetNotificationsAccessForOrganizationRequest.new
        get_notifications_access_for_organization(input)
      end
      def get_notifications_access_for_organization(input : Types::GetNotificationsAccessForOrganizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Channels for a NotificationConfiguration .
      def list_channels(
        notification_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(notification_configuration_arn: notification_configuration_arn, max_results: max_results, next_token: next_token)
        list_channels(input)
      end
      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of EventRules according to specified filters, in reverse chronological order (newest
      # first).
      def list_event_rules(
        notification_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventRulesRequest.new(notification_configuration_arn: notification_configuration_arn, max_results: max_results, next_token: next_token)
        list_event_rules(input)
      end
      def list_event_rules(input : Types::ListEventRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Account contacts and Channels associated with a ManagedNotificationConfiguration ,
      # in paginated format.
      def list_managed_notification_channel_associations(
        managed_notification_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedNotificationChannelAssociationsRequest.new(managed_notification_configuration_arn: managed_notification_configuration_arn, max_results: max_results, next_token: next_token)
        list_managed_notification_channel_associations(input)
      end
      def list_managed_notification_channel_associations(input : Types::ListManagedNotificationChannelAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_NOTIFICATION_CHANNEL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of ManagedNotificationChildEvents for a specified aggregate ManagedNotificationEvent
      # , ordered by creation time in reverse chronological order (newest first).
      def list_managed_notification_child_events(
        aggregate_managed_notification_event_arn : String,
        end_time : Time? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organizational_unit_id : String? = nil,
        related_account : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListManagedNotificationChildEventsRequest.new(aggregate_managed_notification_event_arn: aggregate_managed_notification_event_arn, end_time: end_time, locale: locale, max_results: max_results, next_token: next_token, organizational_unit_id: organizational_unit_id, related_account: related_account, start_time: start_time)
        list_managed_notification_child_events(input)
      end
      def list_managed_notification_child_events(input : Types::ListManagedNotificationChildEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_NOTIFICATION_CHILD_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Managed Notification Configurations according to specified filters, ordered by
      # creation time in reverse chronological order (newest first).
      def list_managed_notification_configurations(
        channel_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedNotificationConfigurationsRequest.new(channel_identifier: channel_identifier, max_results: max_results, next_token: next_token)
        list_managed_notification_configurations(input)
      end
      def list_managed_notification_configurations(input : Types::ListManagedNotificationConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_NOTIFICATION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Managed Notification Events according to specified filters, ordered by creation
      # time in reverse chronological order (newest first).
      def list_managed_notification_events(
        end_time : Time? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organizational_unit_id : String? = nil,
        related_account : String? = nil,
        source : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListManagedNotificationEventsRequest.new(end_time: end_time, locale: locale, max_results: max_results, next_token: next_token, organizational_unit_id: organizational_unit_id, related_account: related_account, source: source, start_time: start_time)
        list_managed_notification_events(input)
      end
      def list_managed_notification_events(input : Types::ListManagedNotificationEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_NOTIFICATION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of member accounts associated with a notification configuration.
      def list_member_accounts(
        notification_configuration_arn : String,
        max_results : Int32? = nil,
        member_account : String? = nil,
        next_token : String? = nil,
        organizational_unit_id : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListMemberAccountsRequest.new(notification_configuration_arn: notification_configuration_arn, max_results: max_results, member_account: member_account, next_token: next_token, organizational_unit_id: organizational_unit_id, status: status)
        list_member_accounts(input)
      end
      def list_member_accounts(input : Types::ListMemberAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBER_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of abbreviated NotificationConfigurations according to specified filters, in reverse
      # chronological order (newest first).
      def list_notification_configurations(
        channel_arn : String? = nil,
        event_rule_source : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        subtype : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationConfigurationsRequest.new(channel_arn: channel_arn, event_rule_source: event_rule_source, max_results: max_results, next_token: next_token, status: status, subtype: subtype)
        list_notification_configurations(input)
      end
      def list_notification_configurations(input : Types::ListNotificationConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of NotificationEvents according to specified filters, in reverse chronological order
      # (newest first). User Notifications stores notifications in the individual Regions you register as
      # notification hubs and the Region of the source event rule. ListNotificationEvents only returns
      # notifications stored in the same Region in which the action is called. User Notifications doesn't
      # backfill notifications to new Regions selected as notification hubs. For this reason, we recommend
      # that you make calls in your oldest registered notification hub. For more information, see
      # Notification hubs in the Amazon Web Services User Notifications User Guide .
      def list_notification_events(
        aggregate_notification_event_arn : String? = nil,
        end_time : Time? = nil,
        include_child_events : Bool? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organizational_unit_id : String? = nil,
        source : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListNotificationEventsRequest.new(aggregate_notification_event_arn: aggregate_notification_event_arn, end_time: end_time, include_child_events: include_child_events, locale: locale, max_results: max_results, next_token: next_token, organizational_unit_id: organizational_unit_id, source: source, start_time: start_time)
        list_notification_events(input)
      end
      def list_notification_events(input : Types::ListNotificationEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of NotificationHubs .
      def list_notification_hubs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationHubsRequest.new(max_results: max_results, next_token: next_token)
        list_notification_hubs(input)
      end
      def list_notification_hubs(input : Types::ListNotificationHubsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_HUBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of organizational units associated with a notification configuration.
      def list_organizational_units(
        notification_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationalUnitsRequest.new(notification_configuration_arn: notification_configuration_arn, max_results: max_results, next_token: next_token)
        list_organizational_units(input)
      end
      def list_organizational_units(input : Types::ListOrganizationalUnitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATIONAL_UNITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a specified Amazon Resource Name (ARN). For more information, see Tagging
      # your Amazon Web Services resources in the Tagging Amazon Web Services Resources User Guide . This is
      # only supported for NotificationConfigurations .
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

      # Registers a NotificationConfiguration in the specified Region. There is a maximum of one
      # NotificationConfiguration per Region. You can have a maximum of 3 NotificationHub resources at a
      # time.
      def register_notification_hub(
        notification_hub_region : String
      ) : Protocol::Request
        input = Types::RegisterNotificationHubRequest.new(notification_hub_region: notification_hub_region)
        register_notification_hub(input)
      end
      def register_notification_hub(input : Types::RegisterNotificationHubRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_NOTIFICATION_HUB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags the resource with a tag key and value. For more information, see Tagging your Amazon Web
      # Services resources in the Tagging Amazon Web Services Resources User Guide . This is only supported
      # for NotificationConfigurations .
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

      # Untags a resource with a specified Amazon Resource Name (ARN). For more information, see Tagging
      # your Amazon Web Services resources in the Tagging Amazon Web Services Resources User Guide .
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

      # Updates an existing EventRule .
      def update_event_rule(
        arn : String,
        event_pattern : String? = nil,
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateEventRuleRequest.new(arn: arn, event_pattern: event_pattern, regions: regions)
        update_event_rule(input)
      end
      def update_event_rule(input : Types::UpdateEventRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a NotificationConfiguration .
      def update_notification_configuration(
        arn : String,
        aggregation_duration : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNotificationConfigurationRequest.new(arn: arn, aggregation_duration: aggregation_duration, description: description, name: name)
        update_notification_configuration(input)
      end
      def update_notification_configuration(input : Types::UpdateNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
