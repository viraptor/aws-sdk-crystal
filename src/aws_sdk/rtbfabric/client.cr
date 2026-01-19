module AwsSdk
  module RTBFabric
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

      # Accepts a link request between gateways. When a requester gateway requests to link with a responder
      # gateway, the responder can use this operation to accept the link request and establish the
      # connection.
      def accept_link(
        gateway_id : String,
        link_id : String,
        log_settings : Types::LinkLogSettings,
        attributes : Types::LinkAttributes? = nil
      ) : Protocol::Request
        input = Types::AcceptLinkRequest.new(gateway_id: gateway_id, link_id: link_id, log_settings: log_settings, attributes: attributes)
        accept_link(input)
      end
      def accept_link(input : Types::AcceptLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an inbound external link.
      def create_inbound_external_link(
        client_token : String,
        gateway_id : String,
        log_settings : Types::LinkLogSettings,
        attributes : Types::LinkAttributes? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateInboundExternalLinkRequest.new(client_token: client_token, gateway_id: gateway_id, log_settings: log_settings, attributes: attributes, tags: tags)
        create_inbound_external_link(input)
      end
      def create_inbound_external_link(input : Types::CreateInboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new link between gateways. Establishes a connection that allows gateways to communicate
      # and exchange bid requests and responses.
      def create_link(
        gateway_id : String,
        log_settings : Types::LinkLogSettings,
        peer_gateway_id : String,
        attributes : Types::LinkAttributes? = nil,
        http_responder_allowed : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLinkRequest.new(gateway_id: gateway_id, log_settings: log_settings, peer_gateway_id: peer_gateway_id, attributes: attributes, http_responder_allowed: http_responder_allowed, tags: tags)
        create_link(input)
      end
      def create_link(input : Types::CreateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an outbound external link.
      def create_outbound_external_link(
        client_token : String,
        gateway_id : String,
        log_settings : Types::LinkLogSettings,
        public_endpoint : String,
        attributes : Types::LinkAttributes? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateOutboundExternalLinkRequest.new(client_token: client_token, gateway_id: gateway_id, log_settings: log_settings, public_endpoint: public_endpoint, attributes: attributes, tags: tags)
        create_outbound_external_link(input)
      end
      def create_outbound_external_link(input : Types::CreateOutboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OUTBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a requester gateway.
      def create_requester_gateway(
        client_token : String,
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_id : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRequesterGatewayRequest.new(client_token: client_token, security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_id: vpc_id, description: description, tags: tags)
        create_requester_gateway(input)
      end
      def create_requester_gateway(input : Types::CreateRequesterGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REQUESTER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a responder gateway. A domain name or managed endpoint is required.
      def create_responder_gateway(
        client_token : String,
        port : Int32,
        protocol : String,
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_id : String,
        description : String? = nil,
        domain_name : String? = nil,
        managed_endpoint_configuration : Types::ManagedEndpointConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        trust_store_configuration : Types::TrustStoreConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateResponderGatewayRequest.new(client_token: client_token, port: port, protocol: protocol, security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_id: vpc_id, description: description, domain_name: domain_name, managed_endpoint_configuration: managed_endpoint_configuration, tags: tags, trust_store_configuration: trust_store_configuration)
        create_responder_gateway(input)
      end
      def create_responder_gateway(input : Types::CreateResponderGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESPONDER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an inbound external link.
      def delete_inbound_external_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::DeleteInboundExternalLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        delete_inbound_external_link(input)
      end
      def delete_inbound_external_link(input : Types::DeleteInboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a link between gateways. Permanently removes the connection between gateways. This action
      # cannot be undone.
      def delete_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::DeleteLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        delete_link(input)
      end
      def delete_link(input : Types::DeleteLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an outbound external link.
      def delete_outbound_external_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::DeleteOutboundExternalLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        delete_outbound_external_link(input)
      end
      def delete_outbound_external_link(input : Types::DeleteOutboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OUTBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a requester gateway.
      def delete_requester_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::DeleteRequesterGatewayRequest.new(gateway_id: gateway_id)
        delete_requester_gateway(input)
      end
      def delete_requester_gateway(input : Types::DeleteRequesterGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REQUESTER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a responder gateway.
      def delete_responder_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::DeleteResponderGatewayRequest.new(gateway_id: gateway_id)
        delete_responder_gateway(input)
      end
      def delete_responder_gateway(input : Types::DeleteResponderGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESPONDER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an inbound external link.
      def get_inbound_external_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::GetInboundExternalLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        get_inbound_external_link(input)
      end
      def get_inbound_external_link(input : Types::GetInboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a link between gateways. Returns detailed information about the link
      # configuration, status, and associated gateways.
      def get_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::GetLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        get_link(input)
      end
      def get_link(input : Types::GetLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an outbound external link.
      def get_outbound_external_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::GetOutboundExternalLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        get_outbound_external_link(input)
      end
      def get_outbound_external_link(input : Types::GetOutboundExternalLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OUTBOUND_EXTERNAL_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a requester gateway.
      def get_requester_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::GetRequesterGatewayRequest.new(gateway_id: gateway_id)
        get_requester_gateway(input)
      end
      def get_requester_gateway(input : Types::GetRequesterGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REQUESTER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a responder gateway.
      def get_responder_gateway(
        gateway_id : String
      ) : Protocol::Request
        input = Types::GetResponderGatewayRequest.new(gateway_id: gateway_id)
        get_responder_gateway(input)
      end
      def get_responder_gateway(input : Types::GetResponderGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESPONDER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists links associated with gateways. Returns a list of all links for the specified gateways,
      # including their status and configuration details.
      def list_links(
        gateway_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLinksRequest.new(gateway_id: gateway_id, max_results: max_results, next_token: next_token)
        list_links(input)
      end
      def list_links(input : Types::ListLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists requester gateways.
      def list_requester_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRequesterGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_requester_gateways(input)
      end
      def list_requester_gateways(input : Types::ListRequesterGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REQUESTER_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists reponder gateways.
      def list_responder_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResponderGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_responder_gateways(input)
      end
      def list_responder_gateways(input : Types::ListResponderGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESPONDER_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for a resource.
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

      # Rejects a link request between gateways. When a requester gateway requests to link with a responder
      # gateway, the responder can use this operation to decline the link request.
      def reject_link(
        gateway_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::RejectLinkRequest.new(gateway_id: gateway_id, link_id: link_id)
        reject_link(input)
      end
      def reject_link(input : Types::RejectLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified resource.
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

      # Removes a tag or tags from a resource.
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

      # Updates the configuration of a link between gateways. Allows you to modify settings and parameters
      # for an existing link.
      def update_link(
        gateway_id : String,
        link_id : String,
        log_settings : Types::LinkLogSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateLinkRequest.new(gateway_id: gateway_id, link_id: link_id, log_settings: log_settings)
        update_link(input)
      end
      def update_link(input : Types::UpdateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a link module flow.
      def update_link_module_flow(
        client_token : String,
        gateway_id : String,
        link_id : String,
        modules : Array(Types::ModuleConfiguration)
      ) : Protocol::Request
        input = Types::UpdateLinkModuleFlowRequest.new(client_token: client_token, gateway_id: gateway_id, link_id: link_id, modules: modules)
        update_link_module_flow(input)
      end
      def update_link_module_flow(input : Types::UpdateLinkModuleFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LINK_MODULE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a requester gateway.
      def update_requester_gateway(
        client_token : String,
        gateway_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRequesterGatewayRequest.new(client_token: client_token, gateway_id: gateway_id, description: description)
        update_requester_gateway(input)
      end
      def update_requester_gateway(input : Types::UpdateRequesterGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REQUESTER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a responder gateway.
      def update_responder_gateway(
        client_token : String,
        gateway_id : String,
        port : Int32,
        protocol : String,
        description : String? = nil,
        domain_name : String? = nil,
        managed_endpoint_configuration : Types::ManagedEndpointConfiguration? = nil,
        trust_store_configuration : Types::TrustStoreConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateResponderGatewayRequest.new(client_token: client_token, gateway_id: gateway_id, port: port, protocol: protocol, description: description, domain_name: domain_name, managed_endpoint_configuration: managed_endpoint_configuration, trust_store_configuration: trust_store_configuration)
        update_responder_gateway(input)
      end
      def update_responder_gateway(input : Types::UpdateResponderGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESPONDER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
