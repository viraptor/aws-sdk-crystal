module Aws
  module SSMGuiConnect
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

      # Deletes the preferences for recording RDP connections.

      def delete_connection_recording_preferences(
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteConnectionRecordingPreferencesRequest.new(client_token: client_token)
        delete_connection_recording_preferences(input)
      end

      def delete_connection_recording_preferences(input : Types::DeleteConnectionRecordingPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTION_RECORDING_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the preferences specified for recording RDP connections in the requesting Amazon Web
      # Services account and Amazon Web Services Region.


      def get_connection_recording_preferences : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTION_RECORDING_PREFERENCES, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the preferences for recording RDP connections.

      def update_connection_recording_preferences(
        connection_recording_preferences : Types::ConnectionRecordingPreferences,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectionRecordingPreferencesRequest.new(connection_recording_preferences: connection_recording_preferences, client_token: client_token)
        update_connection_recording_preferences(input)
      end

      def update_connection_recording_preferences(input : Types::UpdateConnectionRecordingPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTION_RECORDING_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
