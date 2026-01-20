module Aws
  module Ivschat
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates an encrypted token that is used by a chat participant to establish an individual WebSocket
      # chat connection to a room. When the token is used to connect to chat, the connection is valid for
      # the session duration specified in the request. The token becomes invalid at the token-expiration
      # timestamp included in the response. Use the capabilities field to permit an end user to send
      # messages or moderate a room. The attributes field securely attaches structured data to the chat
      # session; the data is included within each message sent by the end user and received by other
      # participants in the room. Common use cases for attributes include passing end-user profile data like
      # an icon, display name, colors, badges, and other display features. Encryption keys are owned by
      # Amazon IVS Chat and never used directly by your application.

      def create_chat_token(
        room_identifier : String,
        user_id : String,
        attributes : Hash(String, String)? = nil,
        capabilities : Array(String)? = nil,
        session_duration_in_minutes : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateChatTokenRequest.new(room_identifier: room_identifier, user_id: user_id, attributes: attributes, capabilities: capabilities, session_duration_in_minutes: session_duration_in_minutes)
        create_chat_token(input)
      end

      def create_chat_token(input : Types::CreateChatTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHAT_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a logging configuration that allows clients to store and record sent messages.

      def create_logging_configuration(
        destination_configuration : Types::DestinationConfiguration,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLoggingConfigurationRequest.new(destination_configuration: destination_configuration, name: name, tags: tags)
        create_logging_configuration(input)
      end

      def create_logging_configuration(input : Types::CreateLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a room that allows clients to connect and pass messages.

      def create_room(
        logging_configuration_identifiers : Array(String)? = nil,
        maximum_message_length : Int32? = nil,
        maximum_message_rate_per_second : Int32? = nil,
        message_review_handler : Types::MessageReviewHandler? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRoomRequest.new(logging_configuration_identifiers: logging_configuration_identifiers, maximum_message_length: maximum_message_length, maximum_message_rate_per_second: maximum_message_rate_per_second, message_review_handler: message_review_handler, name: name, tags: tags)
        create_room(input)
      end

      def create_room(input : Types::CreateRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified logging configuration.

      def delete_logging_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteLoggingConfigurationRequest.new(identifier: identifier)
        delete_logging_configuration(input)
      end

      def delete_logging_configuration(input : Types::DeleteLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an event to a specific room which directs clients to delete a specific message; that is,
      # unrender it from view and delete it from the client’s chat history. This event’s EventName is
      # aws:DELETE_MESSAGE . This replicates the DeleteMessage WebSocket operation in the Amazon IVS Chat
      # Messaging API.

      def delete_message(
        id : String,
        room_identifier : String,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::DeleteMessageRequest.new(id: id, room_identifier: room_identifier, reason: reason)
        delete_message(input)
      end

      def delete_message(input : Types::DeleteMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified room.

      def delete_room(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteRoomRequest.new(identifier: identifier)
        delete_room(input)
      end

      def delete_room(input : Types::DeleteRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects all connections using a specified user ID from a room. This replicates the
      # DisconnectUser WebSocket operation in the Amazon IVS Chat Messaging API.

      def disconnect_user(
        room_identifier : String,
        user_id : String,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::DisconnectUserRequest.new(room_identifier: room_identifier, user_id: user_id, reason: reason)
        disconnect_user(input)
      end

      def disconnect_user(input : Types::DisconnectUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified logging configuration.

      def get_logging_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::GetLoggingConfigurationRequest.new(identifier: identifier)
        get_logging_configuration(input)
      end

      def get_logging_configuration(input : Types::GetLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified room.

      def get_room(
        identifier : String
      ) : Protocol::Request
        input = Types::GetRoomRequest.new(identifier: identifier)
        get_room(input)
      end

      def get_room(input : Types::GetRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all your logging configurations in the AWS region where the API
      # request is processed.

      def list_logging_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLoggingConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_logging_configurations(input)
      end

      def list_logging_configurations(input : Types::ListLoggingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LOGGING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all your rooms in the AWS region where the API request is processed.
      # Results are sorted in descending order of updateTime .

      def list_rooms(
        logging_configuration_identifier : String? = nil,
        max_results : Int32? = nil,
        message_review_handler_uri : String? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoomsRequest.new(logging_configuration_identifier: logging_configuration_identifier, max_results: max_results, message_review_handler_uri: message_review_handler_uri, name: name, next_token: next_token)
        list_rooms(input)
      end

      def list_rooms(input : Types::ListRoomsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROOMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about AWS tags for the specified ARN.

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

      # Sends an event to a room. Use this within your application’s business logic to send events to
      # clients of a room; e.g., to notify clients to change the way the chat UI is rendered.

      def send_event(
        event_name : String,
        room_identifier : String,
        attributes : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::SendEventRequest.new(event_name: event_name, room_identifier: room_identifier, attributes: attributes)
        send_event(input)
      end

      def send_event(input : Types::SendEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tags for the AWS resource with the specified ARN.

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

      # Removes tags from the resource with the specified ARN.

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

      # Updates a specified logging configuration.

      def update_logging_configuration(
        identifier : String,
        destination_configuration : Types::DestinationConfiguration? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLoggingConfigurationRequest.new(identifier: identifier, destination_configuration: destination_configuration, name: name)
        update_logging_configuration(input)
      end

      def update_logging_configuration(input : Types::UpdateLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a room’s configuration.

      def update_room(
        identifier : String,
        logging_configuration_identifiers : Array(String)? = nil,
        maximum_message_length : Int32? = nil,
        maximum_message_rate_per_second : Int32? = nil,
        message_review_handler : Types::MessageReviewHandler? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRoomRequest.new(identifier: identifier, logging_configuration_identifiers: logging_configuration_identifiers, maximum_message_length: maximum_message_length, maximum_message_rate_per_second: maximum_message_rate_per_second, message_review_handler: message_review_handler, name: name)
        update_room(input)
      end

      def update_room(input : Types::UpdateRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
