module AwsSdk
  module IoTSecureTunneling
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

      # Closes a tunnel identified by the unique tunnel id. When a CloseTunnel request is received, we close
      # the WebSocket connections between the client and proxy server so no data can be transmitted.
      # Requires permission to access the CloseTunnel action.
      def close_tunnel(
        tunnel_id : String,
        delete : Bool? = nil
      ) : Types::CloseTunnelResponse
        input = Types::CloseTunnelRequest.new(tunnel_id: tunnel_id, delete: delete)
        close_tunnel(input)
      end
      def close_tunnel(input : Types::CloseTunnelRequest) : Types::CloseTunnelResponse
        request = Protocol::JsonRpc.build_request(Model::CLOSE_TUNNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CloseTunnelResponse, "CloseTunnel")
      end

      # Gets information about a tunnel identified by the unique tunnel id. Requires permission to access
      # the DescribeTunnel action.
      def describe_tunnel(
        tunnel_id : String
      ) : Types::DescribeTunnelResponse
        input = Types::DescribeTunnelRequest.new(tunnel_id: tunnel_id)
        describe_tunnel(input)
      end
      def describe_tunnel(input : Types::DescribeTunnelRequest) : Types::DescribeTunnelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TUNNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTunnelResponse, "DescribeTunnel")
      end

      # Lists the tags for the specified resource.
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

      # List all tunnels for an Amazon Web Services account. Tunnels are listed by creation time in
      # descending order, newer tunnels will be listed before older tunnels. Requires permission to access
      # the ListTunnels action.
      def list_tunnels(
        max_results : Int32? = nil,
        next_token : String? = nil,
        thing_name : String? = nil
      ) : Types::ListTunnelsResponse
        input = Types::ListTunnelsRequest.new(max_results: max_results, next_token: next_token, thing_name: thing_name)
        list_tunnels(input)
      end
      def list_tunnels(input : Types::ListTunnelsRequest) : Types::ListTunnelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TUNNELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTunnelsResponse, "ListTunnels")
      end

      # Creates a new tunnel, and returns two client access tokens for clients to use to connect to the IoT
      # Secure Tunneling proxy server. Requires permission to access the OpenTunnel action.
      def open_tunnel(
        description : String? = nil,
        destination_config : Types::DestinationConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_config : Types::TimeoutConfig? = nil
      ) : Types::OpenTunnelResponse
        input = Types::OpenTunnelRequest.new(description: description, destination_config: destination_config, tags: tags, timeout_config: timeout_config)
        open_tunnel(input)
      end
      def open_tunnel(input : Types::OpenTunnelRequest) : Types::OpenTunnelResponse
        request = Protocol::JsonRpc.build_request(Model::OPEN_TUNNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::OpenTunnelResponse, "OpenTunnel")
      end

      # Revokes the current client access token (CAT) and returns new CAT for clients to use when
      # reconnecting to secure tunneling to access the same tunnel. Requires permission to access the
      # RotateTunnelAccessToken action. Rotating the CAT doesn't extend the tunnel duration. For example,
      # say the tunnel duration is 12 hours and the tunnel has already been open for 4 hours. When you
      # rotate the access tokens, the new tokens that are generated can only be used for the remaining 8
      # hours.
      def rotate_tunnel_access_token(
        client_mode : String,
        tunnel_id : String,
        destination_config : Types::DestinationConfig? = nil
      ) : Types::RotateTunnelAccessTokenResponse
        input = Types::RotateTunnelAccessTokenRequest.new(client_mode: client_mode, tunnel_id: tunnel_id, destination_config: destination_config)
        rotate_tunnel_access_token(input)
      end
      def rotate_tunnel_access_token(input : Types::RotateTunnelAccessTokenRequest) : Types::RotateTunnelAccessTokenResponse
        request = Protocol::JsonRpc.build_request(Model::ROTATE_TUNNEL_ACCESS_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RotateTunnelAccessTokenResponse, "RotateTunnelAccessToken")
      end

      # A resource tag.
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

      # Removes a tag from a resource.
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
    end
  end
end
