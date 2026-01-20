module Aws
  module CloudWatchEvents
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

      # Activates a partner event source that has been deactivated. Once activated, your matching event bus
      # will start receiving events from the event source.

      def activate_event_source(
        name : String
      ) : Nil

        input = Types::ActivateEventSourceRequest.new(name: name)
        activate_event_source(input)
      end

      def activate_event_source(input : Types::ActivateEventSourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ACTIVATE_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Cancels the specified replay.

      def cancel_replay(
        replay_name : String
      ) : Types::CancelReplayResponse

        input = Types::CancelReplayRequest.new(replay_name: replay_name)
        cancel_replay(input)
      end

      def cancel_replay(input : Types::CancelReplayRequest) : Types::CancelReplayResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_REPLAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelReplayResponse, "CancelReplay")
      end

      # Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.

      def create_api_destination(
        connection_arn : String,
        http_method : String,
        invocation_endpoint : String,
        name : String,
        description : String? = nil,
        invocation_rate_limit_per_second : Int32? = nil
      ) : Types::CreateApiDestinationResponse

        input = Types::CreateApiDestinationRequest.new(connection_arn: connection_arn, http_method: http_method, invocation_endpoint: invocation_endpoint, name: name, description: description, invocation_rate_limit_per_second: invocation_rate_limit_per_second)
        create_api_destination(input)
      end

      def create_api_destination(input : Types::CreateApiDestinationRequest) : Types::CreateApiDestinationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_API_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApiDestinationResponse, "CreateApiDestination")
      end

      # Creates an archive of events with the specified settings. When you create an archive, incoming
      # events might not immediately start being sent to the archive. Allow a short period of time for
      # changes to take effect. If you do not specify a pattern to filter events sent to the archive, all
      # events are sent to the archive except replayed events. Replayed events are not sent to an archive.

      def create_archive(
        archive_name : String,
        event_source_arn : String,
        description : String? = nil,
        event_pattern : String? = nil,
        retention_days : Int32? = nil
      ) : Types::CreateArchiveResponse

        input = Types::CreateArchiveRequest.new(archive_name: archive_name, event_source_arn: event_source_arn, description: description, event_pattern: event_pattern, retention_days: retention_days)
        create_archive(input)
      end

      def create_archive(input : Types::CreateArchiveRequest) : Types::CreateArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateArchiveResponse, "CreateArchive")
      end

      # Creates a connection. A connection defines the authorization type and credentials to use for
      # authorization with an API destination HTTP endpoint.

      def create_connection(
        auth_parameters : Types::CreateConnectionAuthRequestParameters,
        authorization_type : String,
        name : String,
        description : String? = nil
      ) : Types::CreateConnectionResponse

        input = Types::CreateConnectionRequest.new(auth_parameters: auth_parameters, authorization_type: authorization_type, name: name, description: description)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionRequest) : Types::CreateConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionResponse, "CreateConnection")
      end

      # Creates a new event bus within your account. This can be a custom event bus which you can use to
      # receive events from your custom applications and services, or it can be a partner event bus which
      # can be matched to a partner event source.

      def create_event_bus(
        name : String,
        event_source_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEventBusResponse

        input = Types::CreateEventBusRequest.new(name: name, event_source_name: event_source_name, tags: tags)
        create_event_bus(input)
      end

      def create_event_bus(input : Types::CreateEventBusRequest) : Types::CreateEventBusResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVENT_BUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEventBusResponse, "CreateEventBus")
      end

      # Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web
      # Services customers. Each partner event source can be used by one Amazon Web Services account to
      # create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create
      # one partner event source for each Amazon Web Services account that wants to receive those event
      # types. A partner event source creates events based on resources within the SaaS partner's service or
      # application. An Amazon Web Services account that creates a partner event bus that matches the
      # partner event source can use that event bus to receive events from the partner, and then process
      # them using Amazon Web Services Events rules and targets. Partner event source names follow this
      # format: partner_name / event_namespace / event_name partner_name is determined during partner
      # registration and identifies the partner to Amazon Web Services customers. event_namespace is
      # determined by the partner and is a way for the partner to categorize their events. event_name is
      # determined by the partner, and should uniquely identify an event-generating resource within the
      # partner system. The combination of event_namespace and event_name should help Amazon Web Services
      # customers decide whether to create an event bus to receive these events.

      def create_partner_event_source(
        account : String,
        name : String
      ) : Types::CreatePartnerEventSourceResponse

        input = Types::CreatePartnerEventSourceRequest.new(account: account, name: name)
        create_partner_event_source(input)
      end

      def create_partner_event_source(input : Types::CreatePartnerEventSourceRequest) : Types::CreatePartnerEventSourceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTNER_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartnerEventSourceResponse, "CreatePartnerEventSource")
      end

      # You can use this operation to temporarily stop receiving events from the specified partner event
      # source. The matching event bus is not deleted. When you deactivate a partner event source, the
      # source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is
      # deleted. To activate a deactivated partner event source, use ActivateEventSource .

      def deactivate_event_source(
        name : String
      ) : Nil

        input = Types::DeactivateEventSourceRequest.new(name: name)
        deactivate_event_source(input)
      end

      def deactivate_event_source(input : Types::DeactivateEventSourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEACTIVATE_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes all authorization parameters from the connection. This lets you remove the secret from the
      # connection so you can reuse it without having to create a new connection.

      def deauthorize_connection(
        name : String
      ) : Types::DeauthorizeConnectionResponse

        input = Types::DeauthorizeConnectionRequest.new(name: name)
        deauthorize_connection(input)
      end

      def deauthorize_connection(input : Types::DeauthorizeConnectionRequest) : Types::DeauthorizeConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DEAUTHORIZE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeauthorizeConnectionResponse, "DeauthorizeConnection")
      end

      # Deletes the specified API destination.

      def delete_api_destination(
        name : String
      ) : Types::DeleteApiDestinationResponse

        input = Types::DeleteApiDestinationRequest.new(name: name)
        delete_api_destination(input)
      end

      def delete_api_destination(input : Types::DeleteApiDestinationRequest) : Types::DeleteApiDestinationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_API_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApiDestinationResponse, "DeleteApiDestination")
      end

      # Deletes the specified archive.

      def delete_archive(
        archive_name : String
      ) : Types::DeleteArchiveResponse

        input = Types::DeleteArchiveRequest.new(archive_name: archive_name)
        delete_archive(input)
      end

      def delete_archive(input : Types::DeleteArchiveRequest) : Types::DeleteArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteArchiveResponse, "DeleteArchive")
      end

      # Deletes a connection.

      def delete_connection(
        name : String
      ) : Types::DeleteConnectionResponse

        input = Types::DeleteConnectionRequest.new(name: name)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Types::DeleteConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionResponse, "DeleteConnection")
      end

      # Deletes the specified custom event bus or partner event bus. All rules associated with this event
      # bus need to be deleted. You can't delete your account's default event bus.

      def delete_event_bus(
        name : String
      ) : Nil

        input = Types::DeleteEventBusRequest.new(name: name)
        delete_event_bus(input)
      end

      def delete_event_bus(input : Types::DeleteEventBusRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_BUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is used by SaaS partners to delete a partner event source. This operation is not used
      # by Amazon Web Services customers. When you delete an event source, the status of the corresponding
      # partner event bus in the Amazon Web Services customer account becomes DELETED.

      def delete_partner_event_source(
        account : String,
        name : String
      ) : Nil

        input = Types::DeletePartnerEventSourceRequest.new(account: account, name: name)
        delete_partner_event_source(input)
      end

      def delete_partner_event_source(input : Types::DeletePartnerEventSourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARTNER_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified rule. Before you can delete the rule, you must remove all targets, using
      # RemoveTargets . When you delete a rule, incoming events might continue to match to the deleted rule.
      # Allow a short period of time for changes to take effect. If you call delete rule multiple times for
      # the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus,
      # ResourceNotFoundException is returned. Managed rules are rules created and managed by another Amazon
      # Web Services service on your behalf. These rules are created by those other Amazon Web Services
      # services to support functionality in those services. You can delete these rules using the Force
      # option, but you should do so only if you are sure the other service is not still using that rule.

      def delete_rule(
        name : String,
        event_bus_name : String? = nil,
        force : Bool? = nil
      ) : Nil

        input = Types::DeleteRuleRequest.new(name: name, event_bus_name: event_bus_name, force: force)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves details about an API destination.

      def describe_api_destination(
        name : String
      ) : Types::DescribeApiDestinationResponse

        input = Types::DescribeApiDestinationRequest.new(name: name)
        describe_api_destination(input)
      end

      def describe_api_destination(input : Types::DescribeApiDestinationRequest) : Types::DescribeApiDestinationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_API_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApiDestinationResponse, "DescribeApiDestination")
      end

      # Retrieves details about an archive.

      def describe_archive(
        archive_name : String
      ) : Types::DescribeArchiveResponse

        input = Types::DescribeArchiveRequest.new(archive_name: archive_name)
        describe_archive(input)
      end

      def describe_archive(input : Types::DescribeArchiveRequest) : Types::DescribeArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeArchiveResponse, "DescribeArchive")
      end

      # Retrieves details about a connection.

      def describe_connection(
        name : String
      ) : Types::DescribeConnectionResponse

        input = Types::DescribeConnectionRequest.new(name: name)
        describe_connection(input)
      end

      def describe_connection(input : Types::DescribeConnectionRequest) : Types::DescribeConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionResponse, "DescribeConnection")
      end

      # Displays details about an event bus in your account. This can include the external Amazon Web
      # Services accounts that are permitted to write events to your default event bus, and the associated
      # policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state,
      # and creation time. To enable your account to receive events from other accounts on its default event
      # bus, use PutPermission . For more information about partner event buses, see CreateEventBus .

      def describe_event_bus(
        name : String? = nil
      ) : Types::DescribeEventBusResponse

        input = Types::DescribeEventBusRequest.new(name: name)
        describe_event_bus(input)
      end

      def describe_event_bus(input : Types::DescribeEventBusRequest) : Types::DescribeEventBusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_BUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventBusResponse, "DescribeEventBus")
      end

      # This operation lists details about a partner event source that is shared with your account.

      def describe_event_source(
        name : String
      ) : Types::DescribeEventSourceResponse

        input = Types::DescribeEventSourceRequest.new(name: name)
        describe_event_source(input)
      end

      def describe_event_source(input : Types::DescribeEventSourceRequest) : Types::DescribeEventSourceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventSourceResponse, "DescribeEventSource")
      end

      # An SaaS partner can use this operation to list details about a partner event source that they have
      # created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services
      # customers can use DescribeEventSource to see details about a partner event source that is shared
      # with them.

      def describe_partner_event_source(
        name : String
      ) : Types::DescribePartnerEventSourceResponse

        input = Types::DescribePartnerEventSourceRequest.new(name: name)
        describe_partner_event_source(input)
      end

      def describe_partner_event_source(input : Types::DescribePartnerEventSourceRequest) : Types::DescribePartnerEventSourceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARTNER_EVENT_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePartnerEventSourceResponse, "DescribePartnerEventSource")
      end

      # Retrieves details about a replay. Use DescribeReplay to determine the progress of a running replay.
      # A replay processes events to replay based on the time in the event, and replays them using 1 minute
      # intervals. If you use StartReplay and specify an EventStartTime and an EventEndTime that covers a 20
      # minute time range, the events are replayed from the first minute of that 20 minute range first. Then
      # the events from the second minute are replayed. You can use DescribeReplay to determine the progress
      # of a replay. The value returned for EventLastReplayedTime indicates the time within the specified
      # time range associated with the last event replayed.

      def describe_replay(
        replay_name : String
      ) : Types::DescribeReplayResponse

        input = Types::DescribeReplayRequest.new(replay_name: replay_name)
        describe_replay(input)
      end

      def describe_replay(input : Types::DescribeReplayRequest) : Types::DescribeReplayResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplayResponse, "DescribeReplay")
      end

      # Describes the specified rule. DescribeRule does not list the targets of a rule. To see the targets
      # associated with a rule, use ListTargetsByRule .

      def describe_rule(
        name : String,
        event_bus_name : String? = nil
      ) : Types::DescribeRuleResponse

        input = Types::DescribeRuleRequest.new(name: name, event_bus_name: event_bus_name)
        describe_rule(input)
      end

      def describe_rule(input : Types::DescribeRuleRequest) : Types::DescribeRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRuleResponse, "DescribeRule")
      end

      # Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it
      # has a schedule expression. When you disable a rule, incoming events might continue to match to the
      # disabled rule. Allow a short period of time for changes to take effect.

      def disable_rule(
        name : String,
        event_bus_name : String? = nil
      ) : Nil

        input = Types::DisableRuleRequest.new(name: name, event_bus_name: event_bus_name)
        disable_rule(input)
      end

      def disable_rule(input : Types::DisableRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISABLE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables the specified rule. If the rule does not exist, the operation fails. When you enable a rule,
      # incoming events might not immediately start matching to a newly enabled rule. Allow a short period
      # of time for changes to take effect.

      def enable_rule(
        name : String,
        event_bus_name : String? = nil
      ) : Nil

        input = Types::EnableRuleRequest.new(name: name, event_bus_name: event_bus_name)
        enable_rule(input)
      end

      def enable_rule(input : Types::EnableRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ENABLE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves a list of API destination in the account in the current Region.

      def list_api_destinations(
        connection_arn : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Types::ListApiDestinationsResponse

        input = Types::ListApiDestinationsRequest.new(connection_arn: connection_arn, limit: limit, name_prefix: name_prefix, next_token: next_token)
        list_api_destinations(input)
      end

      def list_api_destinations(input : Types::ListApiDestinationsRequest) : Types::ListApiDestinationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_API_DESTINATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApiDestinationsResponse, "ListApiDestinations")
      end

      # Lists your archives. You can either list all the archives or you can provide a prefix to match to
      # the archive names. Filter parameters are exclusive.

      def list_archives(
        event_source_arn : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Types::ListArchivesResponse

        input = Types::ListArchivesRequest.new(event_source_arn: event_source_arn, limit: limit, name_prefix: name_prefix, next_token: next_token, state: state)
        list_archives(input)
      end

      def list_archives(input : Types::ListArchivesRequest) : Types::ListArchivesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ARCHIVES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArchivesResponse, "ListArchives")
      end

      # Retrieves a list of connections from the account.

      def list_connections(
        connection_state : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Types::ListConnectionsResponse

        input = Types::ListConnectionsRequest.new(connection_state: connection_state, limit: limit, name_prefix: name_prefix, next_token: next_token)
        list_connections(input)
      end

      def list_connections(input : Types::ListConnectionsRequest) : Types::ListConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionsResponse, "ListConnections")
      end

      # Lists all the event buses in your account, including the default event bus, custom event buses, and
      # partner event buses.

      def list_event_buses(
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Types::ListEventBusesResponse

        input = Types::ListEventBusesRequest.new(limit: limit, name_prefix: name_prefix, next_token: next_token)
        list_event_buses(input)
      end

      def list_event_buses(input : Types::ListEventBusesRequest) : Types::ListEventBusesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENT_BUSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventBusesResponse, "ListEventBuses")
      end

      # You can use this to see all the partner event sources that have been shared with your Amazon Web
      # Services account. For more information about partner event sources, see CreateEventBus .

      def list_event_sources(
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Types::ListEventSourcesResponse

        input = Types::ListEventSourcesRequest.new(limit: limit, name_prefix: name_prefix, next_token: next_token)
        list_event_sources(input)
      end

      def list_event_sources(input : Types::ListEventSourcesRequest) : Types::ListEventSourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EVENT_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEventSourcesResponse, "ListEventSources")
      end

      # An SaaS partner can use this operation to display the Amazon Web Services account ID that a
      # particular partner event source name is associated with. This operation is not used by Amazon Web
      # Services customers.

      def list_partner_event_source_accounts(
        event_source_name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPartnerEventSourceAccountsResponse

        input = Types::ListPartnerEventSourceAccountsRequest.new(event_source_name: event_source_name, limit: limit, next_token: next_token)
        list_partner_event_source_accounts(input)
      end

      def list_partner_event_source_accounts(input : Types::ListPartnerEventSourceAccountsRequest) : Types::ListPartnerEventSourceAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARTNER_EVENT_SOURCE_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPartnerEventSourceAccountsResponse, "ListPartnerEventSourceAccounts")
      end

      # An SaaS partner can use this operation to list all the partner event source names that they have
      # created. This operation is not used by Amazon Web Services customers.

      def list_partner_event_sources(
        name_prefix : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPartnerEventSourcesResponse

        input = Types::ListPartnerEventSourcesRequest.new(name_prefix: name_prefix, limit: limit, next_token: next_token)
        list_partner_event_sources(input)
      end

      def list_partner_event_sources(input : Types::ListPartnerEventSourcesRequest) : Types::ListPartnerEventSourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARTNER_EVENT_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPartnerEventSourcesResponse, "ListPartnerEventSources")
      end

      # Lists your replays. You can either list all the replays or you can provide a prefix to match to the
      # replay names. Filter parameters are exclusive.

      def list_replays(
        event_source_arn : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Types::ListReplaysResponse

        input = Types::ListReplaysRequest.new(event_source_arn: event_source_arn, limit: limit, name_prefix: name_prefix, next_token: next_token, state: state)
        list_replays(input)
      end

      def list_replays(input : Types::ListReplaysRequest) : Types::ListReplaysResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REPLAYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReplaysResponse, "ListReplays")
      end

      # Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can
      # invoke a specific target in your account.

      def list_rule_names_by_target(
        target_arn : String,
        event_bus_name : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRuleNamesByTargetResponse

        input = Types::ListRuleNamesByTargetRequest.new(target_arn: target_arn, event_bus_name: event_bus_name, limit: limit, next_token: next_token)
        list_rule_names_by_target(input)
      end

      def list_rule_names_by_target(input : Types::ListRuleNamesByTargetRequest) : Types::ListRuleNamesByTargetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_NAMES_BY_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleNamesByTargetResponse, "ListRuleNamesByTarget")
      end

      # Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix
      # to match to the rule names. ListRules does not list the targets of a rule. To see the targets
      # associated with a rule, use ListTargetsByRule .

      def list_rules(
        event_bus_name : String? = nil,
        limit : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Types::ListRulesResponse

        input = Types::ListRulesRequest.new(event_bus_name: event_bus_name, limit: limit, name_prefix: name_prefix, next_token: next_token)
        list_rules(input)
      end

      def list_rules(input : Types::ListRulesRequest) : Types::ListRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRulesResponse, "ListRules")
      end

      # Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can
      # be tagged.

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

      # Lists the targets assigned to the specified rule.

      def list_targets_by_rule(
        rule : String,
        event_bus_name : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTargetsByRuleResponse

        input = Types::ListTargetsByRuleRequest.new(rule: rule, event_bus_name: event_bus_name, limit: limit, next_token: next_token)
        list_targets_by_rule(input)
      end

      def list_targets_by_rule(input : Types::ListTargetsByRuleRequest) : Types::ListTargetsByRuleResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TARGETS_BY_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTargetsByRuleResponse, "ListTargetsByRule")
      end

      # Sends custom events to Amazon EventBridge so that they can be matched to rules.

      def put_events(
        entries : Array(Types::PutEventsRequestEntry)
      ) : Types::PutEventsResponse

        input = Types::PutEventsRequest.new(entries: entries)
        put_events(input)
      end

      def put_events(input : Types::PutEventsRequest) : Types::PutEventsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEventsResponse, "PutEvents")
      end

      # This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services
      # customers do not use this operation.

      def put_partner_events(
        entries : Array(Types::PutPartnerEventsRequestEntry)
      ) : Types::PutPartnerEventsResponse

        input = Types::PutPartnerEventsRequest.new(entries: entries)
        put_partner_events(input)
      end

      def put_partner_events(input : Types::PutPartnerEventsRequest) : Types::PutPartnerEventsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PARTNER_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPartnerEventsResponse, "PutPartnerEvents")
      end

      # Running PutPermission permits the specified Amazon Web Services account or Amazon Web Services
      # organization to put events to the specified event bus . Amazon EventBridge (CloudWatch Events) rules
      # in your account are triggered by these events arriving to an event bus in your account. For another
      # account to send events to your account, that external account must have an EventBridge rule with
      # your account's event bus as a target. To enable multiple Amazon Web Services accounts to put events
      # to your event bus, run PutPermission once for each of these accounts. Or, if all the accounts are
      # members of the same Amazon Web Services organization, you can run PutPermission once specifying
      # Principal as "*" and specifying the Amazon Web Services organization ID in Condition , to grant
      # permissions to all accounts in that organization. If you grant permissions using an organization,
      # then accounts in that organization must specify a RoleArn with proper permissions when they use
      # PutTarget to add your account's event bus as a target. For more information, see Sending and
      # Receiving Events Between Amazon Web Services Accounts in the Amazon EventBridge User Guide . The
      # permission policy on the event bus cannot exceed 10 KB in size.

      def put_permission(
        action : String? = nil,
        condition : Types::Condition? = nil,
        event_bus_name : String? = nil,
        policy : String? = nil,
        principal : String? = nil,
        statement_id : String? = nil
      ) : Nil

        input = Types::PutPermissionRequest.new(action: action, condition: condition, event_bus_name: event_bus_name, policy: policy, principal: principal, statement_id: statement_id)
        put_permission(input)
      end

      def put_permission(input : Types::PutPermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates the specified rule. Rules are enabled by default, or based on value of the state.
      # You can disable a rule using DisableRule . A single rule watches for events from a single event bus.
      # Events generated by Amazon Web Services services go to your account's default event bus. Events
      # generated by SaaS partner services or applications go to the matching partner event bus. If you have
      # custom applications or services, you can specify whether their events go to your default event bus
      # or a custom event bus that you have created. For more information, see CreateEventBus . If you are
      # updating an existing rule, the rule is replaced with what you specify in this PutRule command. If
      # you omit arguments in PutRule , the old values for those arguments are not kept. Instead, they are
      # replaced with null values. When you create or update a rule, incoming events might not immediately
      # start matching to new or updated rules. Allow a short period of time for changes to take effect. A
      # rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are
      # triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on
      # the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the
      # rule triggers on matching events as well as on a schedule. When you initially create a rule, you can
      # optionally assign one or more tags to the rule. Tags can help you organize and categorize your
      # resources. You can also use them to scope user permissions, by granting a user permission to access
      # or change only rules with certain tag values. To use the PutRule operation and assign tags, you must
      # have both the events:PutRule and events:TagResource permissions. If you are updating an existing
      # rule, any tags you specify in the PutRule operation are ignored. To update the tags of an existing
      # rule, use TagResource and UntagResource . Most services in Amazon Web Services treat : or / as the
      # same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event
      # patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that
      # they match the ARN syntax in the event you want to match. In EventBridge, it is possible to create
      # rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might
      # detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired
      # state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again,
      # creating an infinite loop. To prevent this, write the rules so that the triggered actions do not
      # re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad
      # state, instead of after any change. An infinite loop can quickly cause higher than expected charges.
      # We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For
      # more information, see Managing Your Costs with Budgets .

      def put_rule(
        name : String,
        description : String? = nil,
        event_bus_name : String? = nil,
        event_pattern : String? = nil,
        role_arn : String? = nil,
        schedule_expression : String? = nil,
        state : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutRuleResponse

        input = Types::PutRuleRequest.new(name: name, description: description, event_bus_name: event_bus_name, event_pattern: event_pattern, role_arn: role_arn, schedule_expression: schedule_expression, state: state, tags: tags)
        put_rule(input)
      end

      def put_rule(input : Types::PutRuleRequest) : Types::PutRuleResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRuleResponse, "PutRule")
      end

      # Adds the specified targets to the specified rule, or updates the targets if they are already
      # associated with the rule. Targets are the resources that are invoked when a rule is triggered. You
      # can configure the following as targets for Events: API destination Amazon API Gateway REST API
      # endpoints API Gateway Batch job queue CloudWatch Logs group CodeBuild project CodePipeline Amazon
      # EC2 CreateSnapshot API call Amazon EC2 RebootInstances API call Amazon EC2 StopInstances API call
      # Amazon EC2 TerminateInstances API call Amazon ECS tasks Event bus in a different Amazon Web Services
      # account or Region. You can use an event bus in the US East (N. Virginia) us-east-1, US West (Oregon)
      # us-west-2, or Europe (Ireland) eu-west-1 Regions as a target for a rule. Firehose delivery stream
      # (Firehose) Inspector assessment template (Amazon Inspector) Kinesis stream (Kinesis Data Stream)
      # Lambda function Redshift clusters (Data API statement execution) Amazon SNS topic Amazon SQS queues
      # (includes FIFO queues SSM Automation SSM OpsItem SSM Run Command Step Functions state machines
      # Creating rules with built-in targets is supported only in the Amazon Web Services Management
      # Console. The built-in targets are EC2 CreateSnapshot API call , EC2 RebootInstances API call , EC2
      # StopInstances API call , and EC2 TerminateInstances API call . For some target types, PutTargets
      # provides target-specific parameters. If the target is a Kinesis data stream, you can optionally
      # specify which shard the event goes to by using the KinesisParameters argument. To invoke a command
      # on multiple EC2 instances with one rule, you can use the RunCommandParameters field. To be able to
      # make API calls against the resources that you own, Amazon EventBridge needs the appropriate
      # permissions. For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies. For
      # EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway REST APIs,
      # EventBridge relies on IAM roles that you specify in the RoleARN argument in PutTargets . For more
      # information, see Authentication and Access Control in the Amazon EventBridge User Guide . If another
      # Amazon Web Services account is in the same region and has granted you permission (using
      # PutPermission ), you can send events to that account. Set that account's event bus as a target of
      # the rules in your account. To send the matched events to the other account, specify that account's
      # event bus as the Arn value when you run PutTargets . If your account sends events to another
      # account, your account is charged for each sent event. Each event sent to another account is charged
      # as a custom event. The account receiving the event is not charged. For more information, see Amazon
      # EventBridge Pricing . Input , InputPath , and InputTransformer are not available with PutTarget if
      # the target is an event bus of a different Amazon Web Services account. If you are setting the event
      # bus of another account as the target, and that account granted permission to your account through an
      # organization instead of directly by the account ID, then you must specify a RoleArn with proper
      # permissions in the Target structure. For more information, see Sending and Receiving Events Between
      # Amazon Web Services Accounts in the Amazon EventBridge User Guide . For more information about
      # enabling cross-account events, see PutPermission . Input , InputPath , and InputTransformer are
      # mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched
      # event: If none of the following arguments are specified for a target, then the entire event is
      # passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task,
      # in which case nothing from the event is passed to the target). If Input is specified in the form of
      # valid JSON, then the matched event is overridden with this constant. If InputPath is specified in
      # the form of JSONPath (for example, $.detail ), then only the part of the event specified in the path
      # is passed to the target (for example, only the detail part of the event is passed). If
      # InputTransformer is specified, then one or more specified JSONPaths are extracted from the event and
      # used as values in a template that you specify as the input to the target. When you specify InputPath
      # or InputTransformer , you must use JSON dot notation, not bracket notation. When you add targets to
      # a rule and the associated rule triggers soon after, new or updated targets might not be immediately
      # invoked. Allow a short period of time for changes to take effect. This action can partially fail if
      # too many requests are made at the same time. If that happens, FailedEntryCount is non-zero in the
      # response and each entry in FailedEntries provides the ID of the failed target and the error code.

      def put_targets(
        rule : String,
        targets : Array(Types::Target),
        event_bus_name : String? = nil
      ) : Types::PutTargetsResponse

        input = Types::PutTargetsRequest.new(rule: rule, targets: targets, event_bus_name: event_bus_name)
        put_targets(input)
      end

      def put_targets(input : Types::PutTargetsRequest) : Types::PutTargetsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutTargetsResponse, "PutTargets")
      end

      # Revokes the permission of another Amazon Web Services account to be able to put events to the
      # specified event bus. Specify the account to revoke by the StatementId value that you associated with
      # the account when you granted it permission with PutPermission . You can find the StatementId by
      # using DescribeEventBus .

      def remove_permission(
        event_bus_name : String? = nil,
        remove_all_permissions : Bool? = nil,
        statement_id : String? = nil
      ) : Nil

        input = Types::RemovePermissionRequest.new(event_bus_name: event_bus_name, remove_all_permissions: remove_all_permissions, statement_id: statement_id)
        remove_permission(input)
      end

      def remove_permission(input : Types::RemovePermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified targets from the specified rule. When the rule is triggered, those targets are
      # no longer be invoked. When you remove a target, when the associated rule triggers, removed targets
      # might continue to be invoked. Allow a short period of time for changes to take effect. This action
      # can partially fail if too many requests are made at the same time. If that happens, FailedEntryCount
      # is non-zero in the response and each entry in FailedEntries provides the ID of the failed target and
      # the error code.

      def remove_targets(
        ids : Array(String),
        rule : String,
        event_bus_name : String? = nil,
        force : Bool? = nil
      ) : Types::RemoveTargetsResponse

        input = Types::RemoveTargetsRequest.new(ids: ids, rule: rule, event_bus_name: event_bus_name, force: force)
        remove_targets(input)
      end

      def remove_targets(input : Types::RemoveTargetsRequest) : Types::RemoveTargetsResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTargetsResponse, "RemoveTargets")
      end

      # Starts the specified replay. Events are not necessarily replayed in the exact same order that they
      # were added to the archive. A replay processes events to replay based on the time in the event, and
      # replays them using 1 minute intervals. If you specify an EventStartTime and an EventEndTime that
      # covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range
      # first. Then the events from the second minute are replayed. You can use DescribeReplay to determine
      # the progress of a replay. The value returned for EventLastReplayedTime indicates the time within the
      # specified time range associated with the last event replayed.

      def start_replay(
        destination : Types::ReplayDestination,
        event_end_time : Time,
        event_source_arn : String,
        event_start_time : Time,
        replay_name : String,
        description : String? = nil
      ) : Types::StartReplayResponse

        input = Types::StartReplayRequest.new(destination: destination, event_end_time: event_end_time, event_source_arn: event_source_arn, event_start_time: event_start_time, replay_name: replay_name, description: description)
        start_replay(input)
      end

      def start_replay(input : Types::StartReplayRequest) : Types::StartReplayResponse
        request = Protocol::JsonRpc.build_request(Model::START_REPLAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReplayResponse, "StartReplay")
      end

      # Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you
      # organize and categorize your resources. You can also use them to scope user permissions by granting
      # a user permission to access or change only resources with certain tag values. In EventBridge, rules
      # and event buses can be tagged. Tags don't have any semantic meaning to Amazon Web Services and are
      # interpreted strictly as strings of characters. You can use the TagResource action with a resource
      # that already has tags. If you specify a new tag key, this tag is appended to the list of tags
      # associated with the resource. If you specify a tag key that is already associated with the resource,
      # the new tag value that you specify replaces the previous value for that tag. You can associate as
      # many as 50 tags with a resource.

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

      # Tests whether the specified event pattern matches the provided event. Most services in Amazon Web
      # Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge
      # uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when
      # creating event patterns so that they match the ARN syntax in the event you want to match.

      def test_event_pattern(
        event : String,
        event_pattern : String
      ) : Types::TestEventPatternResponse

        input = Types::TestEventPatternRequest.new(event: event, event_pattern: event_pattern)
        test_event_pattern(input)
      end

      def test_event_pattern(input : Types::TestEventPatternRequest) : Types::TestEventPatternResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_EVENT_PATTERN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestEventPatternResponse, "TestEventPattern")
      end

      # Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge (CloudWatch
      # Events), rules and event buses can be tagged.

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

      # Updates an API destination.

      def update_api_destination(
        name : String,
        connection_arn : String? = nil,
        description : String? = nil,
        http_method : String? = nil,
        invocation_endpoint : String? = nil,
        invocation_rate_limit_per_second : Int32? = nil
      ) : Types::UpdateApiDestinationResponse

        input = Types::UpdateApiDestinationRequest.new(name: name, connection_arn: connection_arn, description: description, http_method: http_method, invocation_endpoint: invocation_endpoint, invocation_rate_limit_per_second: invocation_rate_limit_per_second)
        update_api_destination(input)
      end

      def update_api_destination(input : Types::UpdateApiDestinationRequest) : Types::UpdateApiDestinationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_API_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApiDestinationResponse, "UpdateApiDestination")
      end

      # Updates the specified archive.

      def update_archive(
        archive_name : String,
        description : String? = nil,
        event_pattern : String? = nil,
        retention_days : Int32? = nil
      ) : Types::UpdateArchiveResponse

        input = Types::UpdateArchiveRequest.new(archive_name: archive_name, description: description, event_pattern: event_pattern, retention_days: retention_days)
        update_archive(input)
      end

      def update_archive(input : Types::UpdateArchiveRequest) : Types::UpdateArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateArchiveResponse, "UpdateArchive")
      end

      # Updates settings for a connection.

      def update_connection(
        name : String,
        auth_parameters : Types::UpdateConnectionAuthRequestParameters? = nil,
        authorization_type : String? = nil,
        description : String? = nil
      ) : Types::UpdateConnectionResponse

        input = Types::UpdateConnectionRequest.new(name: name, auth_parameters: auth_parameters, authorization_type: authorization_type, description: description)
        update_connection(input)
      end

      def update_connection(input : Types::UpdateConnectionRequest) : Types::UpdateConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectionResponse, "UpdateConnection")
      end
    end
  end
end
