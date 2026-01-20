module AwsSdk
  module IoTDataPlane
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

      # Disconnects a connected MQTT client from Amazon Web Services IoT Core. When you disconnect a client,
      # Amazon Web Services IoT Core closes the client's network connection and optionally cleans the
      # session state.

      def delete_connection(
        client_id : String,
        clean_session : Bool? = nil,
        prevent_will_message : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteConnectionRequest.new(client_id: client_id, clean_session: clean_session, prevent_will_message: prevent_will_message)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the shadow for the specified thing. Requires permission to access the DeleteThingShadow
      # action. For more information, see DeleteThingShadow in the IoT Developer Guide.

      def delete_thing_shadow(
        thing_name : String,
        shadow_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteThingShadowRequest.new(thing_name: thing_name, shadow_name: shadow_name)
        delete_thing_shadow(input)
      end

      def delete_thing_shadow(input : Types::DeleteThingShadowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THING_SHADOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a single retained message for the specified topic. This action returns the
      # message payload of the retained message, which can incur messaging costs. To list only the topic
      # names of the retained messages, call ListRetainedMessages . Requires permission to access the
      # GetRetainedMessage action. For more information about messaging costs, see Amazon Web Services IoT
      # Core pricing - Messaging .

      def get_retained_message(
        topic : String
      ) : Protocol::Request
        input = Types::GetRetainedMessageRequest.new(topic: topic)
        get_retained_message(input)
      end

      def get_retained_message(input : Types::GetRetainedMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RETAINED_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the shadow for the specified thing. Requires permission to access the GetThingShadow action.
      # For more information, see GetThingShadow in the IoT Developer Guide.

      def get_thing_shadow(
        thing_name : String,
        shadow_name : String? = nil
      ) : Protocol::Request
        input = Types::GetThingShadowRequest.new(thing_name: thing_name, shadow_name: shadow_name)
        get_thing_shadow(input)
      end

      def get_thing_shadow(input : Types::GetThingShadowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THING_SHADOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the shadows for the specified thing. Requires permission to access the
      # ListNamedShadowsForThing action.

      def list_named_shadows_for_thing(
        thing_name : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListNamedShadowsForThingRequest.new(thing_name: thing_name, next_token: next_token, page_size: page_size)
        list_named_shadows_for_thing(input)
      end

      def list_named_shadows_for_thing(input : Types::ListNamedShadowsForThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NAMED_SHADOWS_FOR_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists summary information about the retained messages stored for the account. This action returns
      # only the topic names of the retained messages. It doesn't return any message payloads. Although this
      # action doesn't return a message payload, it can still incur messaging costs. To get the message
      # payload of a retained message, call GetRetainedMessage with the topic name of the retained message.
      # Requires permission to access the ListRetainedMessages action. For more information about messaging
      # costs, see Amazon Web Services IoT Core pricing - Messaging .

      def list_retained_messages(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRetainedMessagesRequest.new(max_results: max_results, next_token: next_token)
        list_retained_messages(input)
      end

      def list_retained_messages(input : Types::ListRetainedMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RETAINED_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes an MQTT message. Requires permission to access the Publish action. For more information
      # about MQTT messages, see MQTT Protocol in the IoT Developer Guide. For more information about
      # messaging costs, see Amazon Web Services IoT Core pricing - Messaging .

      def publish(
        topic : String,
        content_type : String? = nil,
        correlation_data : String? = nil,
        message_expiry : Int64? = nil,
        payload : Bytes? = nil,
        payload_format_indicator : String? = nil,
        qos : Int32? = nil,
        response_topic : String? = nil,
        retain : Bool? = nil,
        user_properties : String? = nil
      ) : Protocol::Request
        input = Types::PublishRequest.new(topic: topic, content_type: content_type, correlation_data: correlation_data, message_expiry: message_expiry, payload: payload, payload_format_indicator: payload_format_indicator, qos: qos, response_topic: response_topic, retain: retain, user_properties: user_properties)
        publish(input)
      end

      def publish(input : Types::PublishRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the shadow for the specified thing. Requires permission to access the UpdateThingShadow
      # action. For more information, see UpdateThingShadow in the IoT Developer Guide.

      def update_thing_shadow(
        payload : Bytes,
        thing_name : String,
        shadow_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThingShadowRequest.new(payload: payload, thing_name: thing_name, shadow_name: shadow_name)
        update_thing_shadow(input)
      end

      def update_thing_shadow(input : Types::UpdateThingShadowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING_SHADOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
