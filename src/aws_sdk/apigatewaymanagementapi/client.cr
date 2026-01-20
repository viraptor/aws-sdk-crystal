module AwsSdk
  module ApiGatewayManagementApi
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

      # Delete the connection with the provided id.

      def delete_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectionRequest.new(connection_id: connection_id)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about the connection with the provided id.

      def get_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::GetConnectionRequest.new(connection_id: connection_id)
        get_connection(input)
      end

      def get_connection(input : Types::GetConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends the provided data to the specified connection.

      def post_to_connection(
        connection_id : String,
        data : Bytes
      ) : Protocol::Request
        input = Types::PostToConnectionRequest.new(connection_id: connection_id, data: data)
        post_to_connection(input)
      end

      def post_to_connection(input : Types::PostToConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_TO_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
