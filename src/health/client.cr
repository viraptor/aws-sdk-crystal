module Aws
  module Health
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

      # Returns a list of accounts in the organization from Organizations that are affected by the provided
      # event. For more information about the different types of Health events, see Event . Before you can
      # call this operation, you must first enable Health to work with Organizations. To do this, call the
      # EnableHealthServiceAccessForOrganization operation from your organization's management account. This
      # API operation uses pagination. Specify the nextToken parameter in the next request to return more
      # results.

      def describe_affected_accounts_for_organization(
        event_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAffectedAccountsForOrganizationResponse

        input = Types::DescribeAffectedAccountsForOrganizationRequest.new(event_arn: event_arn, max_results: max_results, next_token: next_token)
        describe_affected_accounts_for_organization(input)
      end

      def describe_affected_accounts_for_organization(input : Types::DescribeAffectedAccountsForOrganizationRequest) : Types::DescribeAffectedAccountsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AFFECTED_ACCOUNTS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAffectedAccountsForOrganizationResponse, "DescribeAffectedAccountsForOrganization")
      end

      # Returns a list of entities that have been affected by the specified events, based on the specified
      # filter criteria. Entities can refer to individual customer resources, groups of customer resources,
      # or any other construct, depending on the Amazon Web Services service. Events that have impact beyond
      # that of the affected entities, or where the extent of impact is unknown, include at least one entity
      # indicating this. At least one event ARN is required. This API operation uses pagination. Specify the
      # nextToken parameter in the next request to return more results. This operation supports
      # resource-level permissions. You can use this operation to allow or deny access to specific Health
      # events. For more information, see Resource- and action-based conditions in the Health User Guide .

      def describe_affected_entities(
        filter : Types::EntityFilter,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAffectedEntitiesResponse

        input = Types::DescribeAffectedEntitiesRequest.new(filter: filter, locale: locale, max_results: max_results, next_token: next_token)
        describe_affected_entities(input)
      end

      def describe_affected_entities(input : Types::DescribeAffectedEntitiesRequest) : Types::DescribeAffectedEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AFFECTED_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAffectedEntitiesResponse, "DescribeAffectedEntities")
      end

      # Returns a list of entities that have been affected by one or more events for one or more accounts in
      # your organization in Organizations, based on the filter criteria. Entities can refer to individual
      # customer resources, groups of customer resources, or any other construct, depending on the Amazon
      # Web Services service. At least one event Amazon Resource Name (ARN) and account ID are required.
      # Before you can call this operation, you must first enable Health to work with Organizations. To do
      # this, call the EnableHealthServiceAccessForOrganization operation from your organization's
      # management account. This API operation uses pagination. Specify the nextToken parameter in the next
      # request to return more results. This operation doesn't support resource-level permissions. You can't
      # use this operation to allow or deny access to specific Health events. For more information, see
      # Resource- and action-based conditions in the Health User Guide .

      def describe_affected_entities_for_organization(
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organization_entity_account_filters : Array(Types::EntityAccountFilter)? = nil,
        organization_entity_filters : Array(Types::EventAccountFilter)? = nil
      ) : Types::DescribeAffectedEntitiesForOrganizationResponse

        input = Types::DescribeAffectedEntitiesForOrganizationRequest.new(locale: locale, max_results: max_results, next_token: next_token, organization_entity_account_filters: organization_entity_account_filters, organization_entity_filters: organization_entity_filters)
        describe_affected_entities_for_organization(input)
      end

      def describe_affected_entities_for_organization(input : Types::DescribeAffectedEntitiesForOrganizationRequest) : Types::DescribeAffectedEntitiesForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AFFECTED_ENTITIES_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAffectedEntitiesForOrganizationResponse, "DescribeAffectedEntitiesForOrganization")
      end

      # Returns the number of entities that are affected by each of the specified events.

      def describe_entity_aggregates(
        event_arns : Array(String)? = nil
      ) : Types::DescribeEntityAggregatesResponse

        input = Types::DescribeEntityAggregatesRequest.new(event_arns: event_arns)
        describe_entity_aggregates(input)
      end

      def describe_entity_aggregates(input : Types::DescribeEntityAggregatesRequest) : Types::DescribeEntityAggregatesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITY_AGGREGATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntityAggregatesResponse, "DescribeEntityAggregates")
      end

      # Returns a list of entity aggregates for your Organizations that are affected by each of the
      # specified events.

      def describe_entity_aggregates_for_organization(
        event_arns : Array(String),
        aws_account_ids : Array(String)? = nil
      ) : Types::DescribeEntityAggregatesForOrganizationResponse

        input = Types::DescribeEntityAggregatesForOrganizationRequest.new(event_arns: event_arns, aws_account_ids: aws_account_ids)
        describe_entity_aggregates_for_organization(input)
      end

      def describe_entity_aggregates_for_organization(input : Types::DescribeEntityAggregatesForOrganizationRequest) : Types::DescribeEntityAggregatesForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITY_AGGREGATES_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntityAggregatesForOrganizationResponse, "DescribeEntityAggregatesForOrganization")
      end

      # Returns the number of events of each event type (issue, scheduled change, and account notification).
      # If no filter is specified, the counts of all events in each category are returned. This API
      # operation uses pagination. Specify the nextToken parameter in the next request to return more
      # results.

      def describe_event_aggregates(
        aggregate_field : String,
        filter : Types::EventFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEventAggregatesResponse

        input = Types::DescribeEventAggregatesRequest.new(aggregate_field: aggregate_field, filter: filter, max_results: max_results, next_token: next_token)
        describe_event_aggregates(input)
      end

      def describe_event_aggregates(input : Types::DescribeEventAggregatesRequest) : Types::DescribeEventAggregatesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_AGGREGATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventAggregatesResponse, "DescribeEventAggregates")
      end

      # Returns detailed information about one or more specified events. Information includes standard event
      # data (Amazon Web Services Region, service, and so on, as returned by DescribeEvents ), a detailed
      # event description, and possible additional metadata that depends upon the nature of the event.
      # Affected entities are not included. To retrieve the entities, use the DescribeAffectedEntities
      # operation. If a specified event can't be retrieved, an error message is returned for that event.
      # This operation supports resource-level permissions. You can use this operation to allow or deny
      # access to specific Health events. For more information, see Resource- and action-based conditions in
      # the Health User Guide .

      def describe_event_details(
        event_arns : Array(String),
        locale : String? = nil
      ) : Types::DescribeEventDetailsResponse

        input = Types::DescribeEventDetailsRequest.new(event_arns: event_arns, locale: locale)
        describe_event_details(input)
      end

      def describe_event_details(input : Types::DescribeEventDetailsRequest) : Types::DescribeEventDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventDetailsResponse, "DescribeEventDetails")
      end

      # Returns detailed information about one or more specified events for one or more Amazon Web Services
      # accounts in your organization. This information includes standard event data (such as the Amazon Web
      # Services Region and service), an event description, and (depending on the event) possible metadata.
      # This operation doesn't return affected entities, such as the resources related to the event. To
      # return affected entities, use the DescribeAffectedEntitiesForOrganization operation. Before you can
      # call this operation, you must first enable Health to work with Organizations. To do this, call the
      # EnableHealthServiceAccessForOrganization operation from your organization's management account. When
      # you call the DescribeEventDetailsForOrganization operation, specify the
      # organizationEventDetailFilters object in the request. Depending on the Health event type, note the
      # following differences: To return event details for a public event, you must specify a null value for
      # the awsAccountId parameter. If you specify an account ID for a public event, Health returns an error
      # message because public events aren't specific to an account. To return event details for an event
      # that is specific to an account in your organization, you must specify the awsAccountId parameter in
      # the request. If you don't specify an account ID, Health returns an error message because the event
      # is specific to an account in your organization. For more information, see Event . This operation
      # doesn't support resource-level permissions. You can't use this operation to allow or deny access to
      # specific Health events. For more information, see Resource- and action-based conditions in the
      # Health User Guide .

      def describe_event_details_for_organization(
        organization_event_detail_filters : Array(Types::EventAccountFilter),
        locale : String? = nil
      ) : Types::DescribeEventDetailsForOrganizationResponse

        input = Types::DescribeEventDetailsForOrganizationRequest.new(organization_event_detail_filters: organization_event_detail_filters, locale: locale)
        describe_event_details_for_organization(input)
      end

      def describe_event_details_for_organization(input : Types::DescribeEventDetailsForOrganizationRequest) : Types::DescribeEventDetailsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_DETAILS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventDetailsForOrganizationResponse, "DescribeEventDetailsForOrganization")
      end

      # Returns the event types that meet the specified filter criteria. You can use this API operation to
      # find information about the Health event, such as the category, Amazon Web Services service, and
      # event code. The metadata for each event appears in the EventType object. If you don't specify a
      # filter criteria, the API operation returns all event types, in no particular order. This API
      # operation uses pagination. Specify the nextToken parameter in the next request to return more
      # results.

      def describe_event_types(
        filter : Types::EventTypeFilter? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEventTypesResponse

        input = Types::DescribeEventTypesRequest.new(filter: filter, locale: locale, max_results: max_results, next_token: next_token)
        describe_event_types(input)
      end

      def describe_event_types(input : Types::DescribeEventTypesRequest) : Types::DescribeEventTypesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventTypesResponse, "DescribeEventTypes")
      end

      # Returns information about events that meet the specified filter criteria. Events are returned in a
      # summary form and do not include the detailed description, any additional metadata that depends on
      # the event type, or any affected resources. To retrieve that information, use the
      # DescribeEventDetails and DescribeAffectedEntities operations. If no filter criteria are specified,
      # all events are returned. Results are sorted by lastModifiedTime , starting with the most recent
      # event. When you call the DescribeEvents operation and specify an entity for the entityValues
      # parameter, Health might return public events that aren't specific to that resource. For example, if
      # you call DescribeEvents and specify an ID for an Amazon Elastic Compute Cloud (Amazon EC2) instance,
      # Health might return events that aren't specific to that resource or service. To get events that are
      # specific to a service, use the services parameter in the filter object. For more information, see
      # Event . This API operation uses pagination. Specify the nextToken parameter in the next request to
      # return more results.

      def describe_events(
        filter : Types::EventFilter? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEventsResponse

        input = Types::DescribeEventsRequest.new(filter: filter, locale: locale, max_results: max_results, next_token: next_token)
        describe_events(input)
      end

      def describe_events(input : Types::DescribeEventsRequest) : Types::DescribeEventsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventsResponse, "DescribeEvents")
      end

      # Returns information about events across your organization in Organizations. You can use the filters
      # parameter to specify the events that you want to return. Events are returned in a summary form and
      # don't include the affected accounts, detailed description, any additional metadata that depends on
      # the event type, or any affected resources. To retrieve that information, use the following
      # operations: DescribeAffectedAccountsForOrganization DescribeEventDetailsForOrganization
      # DescribeAffectedEntitiesForOrganization If you don't specify a filter , the
      # DescribeEventsForOrganizations returns all events across your organization. Results are sorted by
      # lastModifiedTime , starting with the most recent event. For more information about the different
      # types of Health events, see Event . Before you can call this operation, you must first enable Health
      # to work with Organizations. To do this, call the EnableHealthServiceAccessForOrganization operation
      # from your organization's management account. This API operation uses pagination. Specify the
      # nextToken parameter in the next request to return more results.

      def describe_events_for_organization(
        filter : Types::OrganizationEventFilter? = nil,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEventsForOrganizationResponse

        input = Types::DescribeEventsForOrganizationRequest.new(filter: filter, locale: locale, max_results: max_results, next_token: next_token)
        describe_events_for_organization(input)
      end

      def describe_events_for_organization(input : Types::DescribeEventsForOrganizationRequest) : Types::DescribeEventsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENTS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventsForOrganizationResponse, "DescribeEventsForOrganization")
      end

      # This operation provides status information on enabling or disabling Health to work with your
      # organization. To call this operation, you must use the organization's management account.


      def describe_health_service_status_for_organization : Types::DescribeHealthServiceStatusForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HEALTH_SERVICE_STATUS_FOR_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHealthServiceStatusForOrganizationResponse, "DescribeHealthServiceStatusForOrganization")
      end

      # Disables Health from working with Organizations. To call this operation, you must sign in to the
      # organization's management account. For more information, see Aggregating Health events in the Health
      # User Guide . This operation doesn't remove the service-linked role from the management account in
      # your organization. You must use the IAM console, API, or Command Line Interface (CLI) to remove the
      # service-linked role. For more information, see Deleting a Service-Linked Role in the IAM User Guide
      # . You can also disable the organizational feature by using the Organizations DisableAWSServiceAccess
      # API operation. After you call this operation, Health stops aggregating events for all other Amazon
      # Web Services accounts in your organization. If you call the Health API operations for organizational
      # view, Health returns an error. Health continues to aggregate health events for your Amazon Web
      # Services account.


      def disable_health_service_access_for_organization : Nil
        request = Protocol::JsonRpc.build_request(Model::DISABLE_HEALTH_SERVICE_ACCESS_FOR_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables Health to work with Organizations. You can use the organizational view feature to aggregate
      # events from all Amazon Web Services accounts in your organization in a centralized location. This
      # operation also creates a service-linked role for the management account in the organization. To call
      # this operation, you must meet the following requirements: You must have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan from Amazon Web Services Support to use the Health API. If you
      # call the Health API from an Amazon Web Services account that doesn't have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan, you receive a SubscriptionRequiredException error. You must
      # have permission to call this operation from the organization's management account. For example IAM
      # policies, see Health identity-based policy examples . If you don't have the required support plan,
      # you can instead use the Health console to enable the organizational view feature. For more
      # information, see Aggregating Health events in the Health User Guide .


      def enable_health_service_access_for_organization : Nil
        request = Protocol::JsonRpc.build_request(Model::ENABLE_HEALTH_SERVICE_ACCESS_FOR_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
