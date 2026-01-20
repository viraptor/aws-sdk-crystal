module Aws
  module PinpointSMSVoice
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

      # Create a new configuration set. After you create the configuration set, you can add one or more
      # event destinations to it.

      def create_configuration_set(
        configuration_set_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        create_configuration_set(input)
      end

      def create_configuration_set(input : Types::CreateConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new event destination in a configuration set.

      def create_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestinationDefinition? = nil,
        event_destination_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination, event_destination_name: event_destination_name)
        create_configuration_set_event_destination(input)
      end

      def create_configuration_set_event_destination(input : Types::CreateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing configuration set.

      def delete_configuration_set(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set(input)
      end

      def delete_configuration_set(input : Types::DeleteConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an event destination in a configuration set.

      def delete_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name)
        delete_configuration_set_event_destination(input)
      end

      def delete_configuration_set_event_destination(input : Types::DeleteConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtain information about an event destination, including the types of events it reports, the Amazon
      # Resource Name (ARN) of the destination, and the name of the event destination.

      def get_configuration_set_event_destinations(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::GetConfigurationSetEventDestinationsRequest.new(configuration_set_name: configuration_set_name)
        get_configuration_set_event_destinations(input)
      end

      def get_configuration_set_event_destinations(input : Types::GetConfigurationSetEventDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_SET_EVENT_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the configuration sets associated with your Amazon Pinpoint account in the current
      # region.

      def list_configuration_sets(
        next_token : String? = nil,
        page_size : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationSetsRequest.new(next_token: next_token, page_size: page_size)
        list_configuration_sets(input)
      end

      def list_configuration_sets(input : Types::ListConfigurationSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new voice message and send it to a recipient's phone number.

      def send_voice_message(
        caller_id : String? = nil,
        configuration_set_name : String? = nil,
        content : Types::VoiceMessageContent? = nil,
        destination_phone_number : String? = nil,
        origination_phone_number : String? = nil
      ) : Protocol::Request
        input = Types::SendVoiceMessageRequest.new(caller_id: caller_id, configuration_set_name: configuration_set_name, content: content, destination_phone_number: destination_phone_number, origination_phone_number: origination_phone_number)
        send_voice_message(input)
      end

      def send_voice_message(input : Types::SendVoiceMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_VOICE_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an event destination in a configuration set. An event destination is a location that you
      # publish information about your voice calls to. For example, you can log an event to an Amazon
      # CloudWatch destination when a call fails.

      def update_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination_name : String,
        event_destination : Types::EventDestinationDefinition? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name, event_destination: event_destination)
        update_configuration_set_event_destination(input)
      end

      def update_configuration_set_event_destination(input : Types::UpdateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
