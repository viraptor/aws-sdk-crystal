module Aws
  module NetworkManager
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

      # Accepts a core network attachment request. Once the attachment request is accepted by a core network
      # owner, the attachment is created and connected to a core network.

      def accept_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::AcceptAttachmentRequest.new(attachment_id: attachment_id)
        accept_attachment(input)
      end

      def accept_attachment(input : Types::AcceptAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a core network Connect peer with a device and optionally, with a link. If you specify a
      # link, it must be associated with the specified device. You can only associate core network Connect
      # peers that have been created on a core network Connect attachment on a core network.

      def associate_connect_peer(
        connect_peer_id : String,
        device_id : String,
        global_network_id : String,
        link_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateConnectPeerRequest.new(connect_peer_id: connect_peer_id, device_id: device_id, global_network_id: global_network_id, link_id: link_id)
        associate_connect_peer(input)
      end

      def associate_connect_peer(input : Types::AssociateConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a customer gateway with a device and optionally, with a link. If you specify a link, it
      # must be associated with the specified device. You can only associate customer gateways that are
      # connected to a VPN attachment on a transit gateway or core network registered in your global
      # network. When you register a transit gateway or core network, customer gateways that are connected
      # to the transit gateway are automatically included in the global network. To list customer gateways
      # that are connected to a transit gateway, use the DescribeVpnConnections EC2 API and filter by
      # transit-gateway-id . You cannot associate a customer gateway with more than one device and link.

      def associate_customer_gateway(
        customer_gateway_arn : String,
        device_id : String,
        global_network_id : String,
        link_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateCustomerGatewayRequest.new(customer_gateway_arn: customer_gateway_arn, device_id: device_id, global_network_id: global_network_id, link_id: link_id)
        associate_customer_gateway(input)
      end

      def associate_customer_gateway(input : Types::AssociateCustomerGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CUSTOMER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a link to a device. A device can be associated to multiple links and a link can be
      # associated to multiple devices. The device and link must be in the same global network and the same
      # site.

      def associate_link(
        device_id : String,
        global_network_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::AssociateLinkRequest.new(device_id: device_id, global_network_id: global_network_id, link_id: link_id)
        associate_link(input)
      end

      def associate_link(input : Types::AssociateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a transit gateway Connect peer with a device, and optionally, with a link. If you specify
      # a link, it must be associated with the specified device. You can only associate transit gateway
      # Connect peers that have been created on a transit gateway that's registered in your global network.
      # You cannot associate a transit gateway Connect peer with more than one device and link.

      def associate_transit_gateway_connect_peer(
        device_id : String,
        global_network_id : String,
        transit_gateway_connect_peer_arn : String,
        link_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateTransitGatewayConnectPeerRequest.new(device_id: device_id, global_network_id: global_network_id, transit_gateway_connect_peer_arn: transit_gateway_connect_peer_arn, link_id: link_id)
        associate_transit_gateway_connect_peer(input)
      end

      def associate_transit_gateway_connect_peer(input : Types::AssociateTransitGatewayConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TRANSIT_GATEWAY_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a core network Connect attachment from a specified core network attachment. A core network
      # Connect attachment is a GRE-based tunnel attachment that you can use to establish a connection
      # between a core network and an appliance. A core network Connect attachment uses an existing VPC
      # attachment as the underlying transport mechanism.

      def create_connect_attachment(
        core_network_id : String,
        edge_location : String,
        options : Types::ConnectAttachmentOptions,
        transport_attachment_id : String,
        client_token : String? = nil,
        routing_policy_label : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectAttachmentRequest.new(core_network_id: core_network_id, edge_location: edge_location, options: options, transport_attachment_id: transport_attachment_id, client_token: client_token, routing_policy_label: routing_policy_label, tags: tags)
        create_connect_attachment(input)
      end

      def create_connect_attachment(input : Types::CreateConnectAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECT_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a core network Connect peer for a specified core network connect attachment between a core
      # network and an appliance. The peer address and transit gateway address must be the same IP address
      # family (IPv4 or IPv6).

      def create_connect_peer(
        connect_attachment_id : String,
        peer_address : String,
        bgp_options : Types::BgpOptions? = nil,
        client_token : String? = nil,
        core_network_address : String? = nil,
        inside_cidr_blocks : Array(String)? = nil,
        subnet_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectPeerRequest.new(connect_attachment_id: connect_attachment_id, peer_address: peer_address, bgp_options: bgp_options, client_token: client_token, core_network_address: core_network_address, inside_cidr_blocks: inside_cidr_blocks, subnet_arn: subnet_arn, tags: tags)
        create_connect_peer(input)
      end

      def create_connect_peer(input : Types::CreateConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a connection between two devices. The devices can be a physical or virtual appliance that
      # connects to a third-party appliance in a VPC, or a physical appliance that connects to another
      # physical appliance in an on-premises network.

      def create_connection(
        connected_device_id : String,
        device_id : String,
        global_network_id : String,
        connected_link_id : String? = nil,
        description : String? = nil,
        link_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectionRequest.new(connected_device_id: connected_device_id, device_id: device_id, global_network_id: global_network_id, connected_link_id: connected_link_id, description: description, link_id: link_id, tags: tags)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a core network as part of your global network, and optionally, with a core network policy.

      def create_core_network(
        global_network_id : String,
        client_token : String? = nil,
        description : String? = nil,
        policy_document : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCoreNetworkRequest.new(global_network_id: global_network_id, client_token: client_token, description: description, policy_document: policy_document, tags: tags)
        create_core_network(input)
      end

      def create_core_network(input : Types::CreateCoreNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CORE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between a core network and a prefix list for routing control.

      def create_core_network_prefix_list_association(
        core_network_id : String,
        prefix_list_alias : String,
        prefix_list_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateCoreNetworkPrefixListAssociationRequest.new(core_network_id: core_network_id, prefix_list_alias: prefix_list_alias, prefix_list_arn: prefix_list_arn, client_token: client_token)
        create_core_network_prefix_list_association(input)
      end

      def create_core_network_prefix_list_association(input : Types::CreateCoreNetworkPrefixListAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CORE_NETWORK_PREFIX_LIST_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new device in a global network. If you specify both a site ID and a location, the location
      # of the site is used for visualization in the Network Manager console.

      def create_device(
        global_network_id : String,
        aws_location : Types::AWSLocation? = nil,
        description : String? = nil,
        location : Types::Location? = nil,
        model : String? = nil,
        serial_number : String? = nil,
        site_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil,
        vendor : String? = nil
      ) : Protocol::Request
        input = Types::CreateDeviceRequest.new(global_network_id: global_network_id, aws_location: aws_location, description: description, location: location, model: model, serial_number: serial_number, site_id: site_id, tags: tags, type: type, vendor: vendor)
        create_device(input)
      end

      def create_device(input : Types::CreateDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services Direct Connect gateway attachment

      def create_direct_connect_gateway_attachment(
        core_network_id : String,
        direct_connect_gateway_arn : String,
        edge_locations : Array(String),
        client_token : String? = nil,
        routing_policy_label : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDirectConnectGatewayAttachmentRequest.new(core_network_id: core_network_id, direct_connect_gateway_arn: direct_connect_gateway_arn, edge_locations: edge_locations, client_token: client_token, routing_policy_label: routing_policy_label, tags: tags)
        create_direct_connect_gateway_attachment(input)
      end

      def create_direct_connect_gateway_attachment(input : Types::CreateDirectConnectGatewayAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DIRECT_CONNECT_GATEWAY_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new, empty global network.

      def create_global_network(
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateGlobalNetworkRequest.new(description: description, tags: tags)
        create_global_network(input)
      end

      def create_global_network(input : Types::CreateGlobalNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GLOBAL_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new link for a specified site.

      def create_link(
        bandwidth : Types::Bandwidth,
        global_network_id : String,
        site_id : String,
        description : String? = nil,
        provider : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateLinkRequest.new(bandwidth: bandwidth, global_network_id: global_network_id, site_id: site_id, description: description, provider: provider, tags: tags, type: type)
        create_link(input)
      end

      def create_link(input : Types::CreateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new site in a global network.

      def create_site(
        global_network_id : String,
        description : String? = nil,
        location : Types::Location? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSiteRequest.new(global_network_id: global_network_id, description: description, location: location, tags: tags)
        create_site(input)
      end

      def create_site(input : Types::CreateSiteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services site-to-site VPN attachment on an edge location of a core network.

      def create_site_to_site_vpn_attachment(
        core_network_id : String,
        vpn_connection_arn : String,
        client_token : String? = nil,
        routing_policy_label : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSiteToSiteVpnAttachmentRequest.new(core_network_id: core_network_id, vpn_connection_arn: vpn_connection_arn, client_token: client_token, routing_policy_label: routing_policy_label, tags: tags)
        create_site_to_site_vpn_attachment(input)
      end

      def create_site_to_site_vpn_attachment(input : Types::CreateSiteToSiteVpnAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SITE_TO_SITE_VPN_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a transit gateway peering connection.

      def create_transit_gateway_peering(
        core_network_id : String,
        transit_gateway_arn : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTransitGatewayPeeringRequest.new(core_network_id: core_network_id, transit_gateway_arn: transit_gateway_arn, client_token: client_token, tags: tags)
        create_transit_gateway_peering(input)
      end

      def create_transit_gateway_peering(input : Types::CreateTransitGatewayPeeringRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRANSIT_GATEWAY_PEERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a transit gateway route table attachment.

      def create_transit_gateway_route_table_attachment(
        peering_id : String,
        transit_gateway_route_table_arn : String,
        client_token : String? = nil,
        routing_policy_label : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTransitGatewayRouteTableAttachmentRequest.new(peering_id: peering_id, transit_gateway_route_table_arn: transit_gateway_route_table_arn, client_token: client_token, routing_policy_label: routing_policy_label, tags: tags)
        create_transit_gateway_route_table_attachment(input)
      end

      def create_transit_gateway_route_table_attachment(input : Types::CreateTransitGatewayRouteTableAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRANSIT_GATEWAY_ROUTE_TABLE_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a VPC attachment on an edge location of a core network.

      def create_vpc_attachment(
        core_network_id : String,
        subnet_arns : Array(String),
        vpc_arn : String,
        client_token : String? = nil,
        options : Types::VpcOptions? = nil,
        routing_policy_label : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateVpcAttachmentRequest.new(core_network_id: core_network_id, subnet_arns: subnet_arns, vpc_arn: vpc_arn, client_token: client_token, options: options, routing_policy_label: routing_policy_label, tags: tags)
        create_vpc_attachment(input)
      end

      def create_vpc_attachment(input : Types::CreateVpcAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attachment. Supports all attachment types.

      def delete_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::DeleteAttachmentRequest.new(attachment_id: attachment_id)
        delete_attachment(input)
      end

      def delete_attachment(input : Types::DeleteAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Connect peer.

      def delete_connect_peer(
        connect_peer_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectPeerRequest.new(connect_peer_id: connect_peer_id)
        delete_connect_peer(input)
      end

      def delete_connect_peer(input : Types::DeleteConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified connection in your global network.

      def delete_connection(
        connection_id : String,
        global_network_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectionRequest.new(connection_id: connection_id, global_network_id: global_network_id)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a core network along with all core network policies. This can only be done if there are no
      # attachments on a core network.

      def delete_core_network(
        core_network_id : String
      ) : Protocol::Request
        input = Types::DeleteCoreNetworkRequest.new(core_network_id: core_network_id)
        delete_core_network(input)
      end

      def delete_core_network(input : Types::DeleteCoreNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a policy version from a core network. You can't delete the current LIVE policy.

      def delete_core_network_policy_version(
        core_network_id : String,
        policy_version_id : Int32
      ) : Protocol::Request
        input = Types::DeleteCoreNetworkPolicyVersionRequest.new(core_network_id: core_network_id, policy_version_id: policy_version_id)
        delete_core_network_policy_version(input)
      end

      def delete_core_network_policy_version(input : Types::DeleteCoreNetworkPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORE_NETWORK_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an association between a core network and a prefix list.

      def delete_core_network_prefix_list_association(
        core_network_id : String,
        prefix_list_arn : String
      ) : Protocol::Request
        input = Types::DeleteCoreNetworkPrefixListAssociationRequest.new(core_network_id: core_network_id, prefix_list_arn: prefix_list_arn)
        delete_core_network_prefix_list_association(input)
      end

      def delete_core_network_prefix_list_association(input : Types::DeleteCoreNetworkPrefixListAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORE_NETWORK_PREFIX_LIST_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing device. You must first disassociate the device from any links and customer
      # gateways.

      def delete_device(
        device_id : String,
        global_network_id : String
      ) : Protocol::Request
        input = Types::DeleteDeviceRequest.new(device_id: device_id, global_network_id: global_network_id)
        delete_device(input)
      end

      def delete_device(input : Types::DeleteDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing global network. You must first delete all global network objects (devices,
      # links, and sites), deregister all transit gateways, and delete any core networks.

      def delete_global_network(
        global_network_id : String
      ) : Protocol::Request
        input = Types::DeleteGlobalNetworkRequest.new(global_network_id: global_network_id)
        delete_global_network(input)
      end

      def delete_global_network(input : Types::DeleteGlobalNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GLOBAL_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing link. You must first disassociate the link from any devices and customer
      # gateways.

      def delete_link(
        global_network_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::DeleteLinkRequest.new(global_network_id: global_network_id, link_id: link_id)
        delete_link(input)
      end

      def delete_link(input : Types::DeleteLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing peering connection.

      def delete_peering(
        peering_id : String
      ) : Protocol::Request
        input = Types::DeletePeeringRequest.new(peering_id: peering_id)
        delete_peering(input)
      end

      def delete_peering(input : Types::DeletePeeringRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PEERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource policy for the specified resource. This revokes the access of the principals
      # specified in the resource policy.

      def delete_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing site. The site cannot be associated with any device or link.

      def delete_site(
        global_network_id : String,
        site_id : String
      ) : Protocol::Request
        input = Types::DeleteSiteRequest.new(global_network_id: global_network_id, site_id: site_id)
        delete_site(input)
      end

      def delete_site(input : Types::DeleteSiteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters a transit gateway from your global network. This action does not delete your transit
      # gateway, or modify any of its attachments. This action removes any customer gateway associations.

      def deregister_transit_gateway(
        global_network_id : String,
        transit_gateway_arn : String
      ) : Protocol::Request
        input = Types::DeregisterTransitGatewayRequest.new(global_network_id: global_network_id, transit_gateway_arn: transit_gateway_arn)
        deregister_transit_gateway(input)
      end

      def deregister_transit_gateway(input : Types::DeregisterTransitGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_TRANSIT_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more global networks. By default, all global networks are described. To describe
      # the objects in your global network, you must use the appropriate Get* action. For example, to list
      # the transit gateways in your global network, use GetTransitGatewayRegistrations .

      def describe_global_networks(
        global_network_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeGlobalNetworksRequest.new(global_network_ids: global_network_ids, max_results: max_results, next_token: next_token)
        describe_global_networks(input)
      end

      def describe_global_networks(input : Types::DescribeGlobalNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GLOBAL_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a core network Connect peer from a device and a link.

      def disassociate_connect_peer(
        connect_peer_id : String,
        global_network_id : String
      ) : Protocol::Request
        input = Types::DisassociateConnectPeerRequest.new(connect_peer_id: connect_peer_id, global_network_id: global_network_id)
        disassociate_connect_peer(input)
      end

      def disassociate_connect_peer(input : Types::DisassociateConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a customer gateway from a device and a link.

      def disassociate_customer_gateway(
        customer_gateway_arn : String,
        global_network_id : String
      ) : Protocol::Request
        input = Types::DisassociateCustomerGatewayRequest.new(customer_gateway_arn: customer_gateway_arn, global_network_id: global_network_id)
        disassociate_customer_gateway(input)
      end

      def disassociate_customer_gateway(input : Types::DisassociateCustomerGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_CUSTOMER_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an existing device from a link. You must first disassociate any customer gateways that
      # are associated with the link.

      def disassociate_link(
        device_id : String,
        global_network_id : String,
        link_id : String
      ) : Protocol::Request
        input = Types::DisassociateLinkRequest.new(device_id: device_id, global_network_id: global_network_id, link_id: link_id)
        disassociate_link(input)
      end

      def disassociate_link(input : Types::DisassociateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a transit gateway Connect peer from a device and link.

      def disassociate_transit_gateway_connect_peer(
        global_network_id : String,
        transit_gateway_connect_peer_arn : String
      ) : Protocol::Request
        input = Types::DisassociateTransitGatewayConnectPeerRequest.new(global_network_id: global_network_id, transit_gateway_connect_peer_arn: transit_gateway_connect_peer_arn)
        disassociate_transit_gateway_connect_peer(input)
      end

      def disassociate_transit_gateway_connect_peer(input : Types::DisassociateTransitGatewayConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_TRANSIT_GATEWAY_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes a change set on your core network. Deploys changes globally based on the policy submitted..

      def execute_core_network_change_set(
        core_network_id : String,
        policy_version_id : Int32
      ) : Protocol::Request
        input = Types::ExecuteCoreNetworkChangeSetRequest.new(core_network_id: core_network_id, policy_version_id: policy_version_id)
        execute_core_network_change_set(input)
      end

      def execute_core_network_change_set(input : Types::ExecuteCoreNetworkChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_CORE_NETWORK_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a core network Connect attachment.

      def get_connect_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::GetConnectAttachmentRequest.new(attachment_id: attachment_id)
        get_connect_attachment(input)
      end

      def get_connect_attachment(input : Types::GetConnectAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECT_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a core network Connect peer.

      def get_connect_peer(
        connect_peer_id : String
      ) : Protocol::Request
        input = Types::GetConnectPeerRequest.new(connect_peer_id: connect_peer_id)
        get_connect_peer(input)
      end

      def get_connect_peer(input : Types::GetConnectPeerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECT_PEER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a core network Connect peer associations.

      def get_connect_peer_associations(
        global_network_id : String,
        connect_peer_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetConnectPeerAssociationsRequest.new(global_network_id: global_network_id, connect_peer_ids: connect_peer_ids, max_results: max_results, next_token: next_token)
        get_connect_peer_associations(input)
      end

      def get_connect_peer_associations(input : Types::GetConnectPeerAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECT_PEER_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more of your connections in a global network.

      def get_connections(
        global_network_id : String,
        connection_ids : Array(String)? = nil,
        device_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetConnectionsRequest.new(global_network_id: global_network_id, connection_ids: connection_ids, device_id: device_id, max_results: max_results, next_token: next_token)
        get_connections(input)
      end

      def get_connections(input : Types::GetConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the LIVE policy for a core network.

      def get_core_network(
        core_network_id : String
      ) : Protocol::Request
        input = Types::GetCoreNetworkRequest.new(core_network_id: core_network_id)
        get_core_network(input)
      end

      def get_core_network(input : Types::GetCoreNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a core network change event.

      def get_core_network_change_events(
        core_network_id : String,
        policy_version_id : Int32,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCoreNetworkChangeEventsRequest.new(core_network_id: core_network_id, policy_version_id: policy_version_id, max_results: max_results, next_token: next_token)
        get_core_network_change_events(input)
      end

      def get_core_network_change_events(input : Types::GetCoreNetworkChangeEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_NETWORK_CHANGE_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a change set between the LIVE core network policy and a submitted policy.

      def get_core_network_change_set(
        core_network_id : String,
        policy_version_id : Int32,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCoreNetworkChangeSetRequest.new(core_network_id: core_network_id, policy_version_id: policy_version_id, max_results: max_results, next_token: next_token)
        get_core_network_change_set(input)
      end

      def get_core_network_change_set(input : Types::GetCoreNetworkChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_NETWORK_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a core network policy. You can get details about your current live policy or
      # any previous policy version.

      def get_core_network_policy(
        core_network_id : String,
        alias_ : String? = nil,
        policy_version_id : Int32? = nil
      ) : Protocol::Request
        input = Types::GetCoreNetworkPolicyRequest.new(core_network_id: core_network_id, alias_: alias_, policy_version_id: policy_version_id)
        get_core_network_policy(input)
      end

      def get_core_network_policy(input : Types::GetCoreNetworkPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_NETWORK_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the association information for customer gateways that are associated with devices and links in
      # your global network.

      def get_customer_gateway_associations(
        global_network_id : String,
        customer_gateway_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCustomerGatewayAssociationsRequest.new(global_network_id: global_network_id, customer_gateway_arns: customer_gateway_arns, max_results: max_results, next_token: next_token)
        get_customer_gateway_associations(input)
      end

      def get_customer_gateway_associations(input : Types::GetCustomerGatewayAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOMER_GATEWAY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more of your devices in a global network.

      def get_devices(
        global_network_id : String,
        device_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        site_id : String? = nil
      ) : Protocol::Request
        input = Types::GetDevicesRequest.new(global_network_id: global_network_id, device_ids: device_ids, max_results: max_results, next_token: next_token, site_id: site_id)
        get_devices(input)
      end

      def get_devices(input : Types::GetDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific Amazon Web Services Direct Connect gateway attachment.

      def get_direct_connect_gateway_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::GetDirectConnectGatewayAttachmentRequest.new(attachment_id: attachment_id)
        get_direct_connect_gateway_attachment(input)
      end

      def get_direct_connect_gateway_attachment(input : Types::GetDirectConnectGatewayAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DIRECT_CONNECT_GATEWAY_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the link associations for a device or a link. Either the device ID or the link ID must be
      # specified.

      def get_link_associations(
        global_network_id : String,
        device_id : String? = nil,
        link_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetLinkAssociationsRequest.new(global_network_id: global_network_id, device_id: device_id, link_id: link_id, max_results: max_results, next_token: next_token)
        get_link_associations(input)
      end

      def get_link_associations(input : Types::GetLinkAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINK_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more links in a specified global network. If you specify the site ID,
      # you cannot specify the type or provider in the same request. You can specify the type and provider
      # in the same request.

      def get_links(
        global_network_id : String,
        link_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provider : String? = nil,
        site_id : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::GetLinksRequest.new(global_network_id: global_network_id, link_ids: link_ids, max_results: max_results, next_token: next_token, provider: provider, site_id: site_id, type: type)
        get_links(input)
      end

      def get_links(input : Types::GetLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the count of network resources, by resource type, for the specified global network.

      def get_network_resource_counts(
        global_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::GetNetworkResourceCountsRequest.new(global_network_id: global_network_id, max_results: max_results, next_token: next_token, resource_type: resource_type)
        get_network_resource_counts(input)
      end

      def get_network_resource_counts(input : Types::GetNetworkResourceCountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_RESOURCE_COUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the network resource relationships for the specified global network.

      def get_network_resource_relationships(
        global_network_id : String,
        account_id : String? = nil,
        aws_region : String? = nil,
        core_network_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registered_gateway_arn : String? = nil,
        resource_arn : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::GetNetworkResourceRelationshipsRequest.new(global_network_id: global_network_id, account_id: account_id, aws_region: aws_region, core_network_id: core_network_id, max_results: max_results, next_token: next_token, registered_gateway_arn: registered_gateway_arn, resource_arn: resource_arn, resource_type: resource_type)
        get_network_resource_relationships(input)
      end

      def get_network_resource_relationships(input : Types::GetNetworkResourceRelationshipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_RESOURCE_RELATIONSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the network resources for the specified global network. The results include information
      # from the corresponding Describe call for the resource, minus any sensitive information such as
      # pre-shared keys.

      def get_network_resources(
        global_network_id : String,
        account_id : String? = nil,
        aws_region : String? = nil,
        core_network_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registered_gateway_arn : String? = nil,
        resource_arn : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::GetNetworkResourcesRequest.new(global_network_id: global_network_id, account_id: account_id, aws_region: aws_region, core_network_id: core_network_id, max_results: max_results, next_token: next_token, registered_gateway_arn: registered_gateway_arn, resource_arn: resource_arn, resource_type: resource_type)
        get_network_resources(input)
      end

      def get_network_resources(input : Types::GetNetworkResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the network routes of the specified global network.

      def get_network_routes(
        global_network_id : String,
        route_table_identifier : Types::RouteTableIdentifier,
        destination_filters : Hash(String, Array(String))? = nil,
        exact_cidr_matches : Array(String)? = nil,
        longest_prefix_matches : Array(String)? = nil,
        prefix_list_ids : Array(String)? = nil,
        states : Array(String)? = nil,
        subnet_of_matches : Array(String)? = nil,
        supernet_of_matches : Array(String)? = nil,
        types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetNetworkRoutesRequest.new(global_network_id: global_network_id, route_table_identifier: route_table_identifier, destination_filters: destination_filters, exact_cidr_matches: exact_cidr_matches, longest_prefix_matches: longest_prefix_matches, prefix_list_ids: prefix_list_ids, states: states, subnet_of_matches: subnet_of_matches, supernet_of_matches: supernet_of_matches, types: types)
        get_network_routes(input)
      end

      def get_network_routes(input : Types::GetNetworkRoutesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the network telemetry of the specified global network.

      def get_network_telemetry(
        global_network_id : String,
        account_id : String? = nil,
        aws_region : String? = nil,
        core_network_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registered_gateway_arn : String? = nil,
        resource_arn : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::GetNetworkTelemetryRequest.new(global_network_id: global_network_id, account_id: account_id, aws_region: aws_region, core_network_id: core_network_id, max_results: max_results, next_token: next_token, registered_gateway_arn: registered_gateway_arn, resource_arn: resource_arn, resource_type: resource_type)
        get_network_telemetry(input)
      end

      def get_network_telemetry(input : Types::GetNetworkTelemetryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_TELEMETRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a resource policy.

      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified route analysis.

      def get_route_analysis(
        global_network_id : String,
        route_analysis_id : String
      ) : Protocol::Request
        input = Types::GetRouteAnalysisRequest.new(global_network_id: global_network_id, route_analysis_id: route_analysis_id)
        get_route_analysis(input)
      end

      def get_route_analysis(input : Types::GetRouteAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a site-to-site VPN attachment.

      def get_site_to_site_vpn_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::GetSiteToSiteVpnAttachmentRequest.new(attachment_id: attachment_id)
        get_site_to_site_vpn_attachment(input)
      end

      def get_site_to_site_vpn_attachment(input : Types::GetSiteToSiteVpnAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SITE_TO_SITE_VPN_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more of your sites in a global network.

      def get_sites(
        global_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        site_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetSitesRequest.new(global_network_id: global_network_id, max_results: max_results, next_token: next_token, site_ids: site_ids)
        get_sites(input)
      end

      def get_sites(input : Types::GetSitesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more of your transit gateway Connect peer associations in a global
      # network.

      def get_transit_gateway_connect_peer_associations(
        global_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        transit_gateway_connect_peer_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetTransitGatewayConnectPeerAssociationsRequest.new(global_network_id: global_network_id, max_results: max_results, next_token: next_token, transit_gateway_connect_peer_arns: transit_gateway_connect_peer_arns)
        get_transit_gateway_connect_peer_associations(input)
      end

      def get_transit_gateway_connect_peer_associations(input : Types::GetTransitGatewayConnectPeerAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSIT_GATEWAY_CONNECT_PEER_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a transit gateway peer.

      def get_transit_gateway_peering(
        peering_id : String
      ) : Protocol::Request
        input = Types::GetTransitGatewayPeeringRequest.new(peering_id: peering_id)
        get_transit_gateway_peering(input)
      end

      def get_transit_gateway_peering(input : Types::GetTransitGatewayPeeringRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSIT_GATEWAY_PEERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the transit gateway registrations in a specified global network.

      def get_transit_gateway_registrations(
        global_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        transit_gateway_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetTransitGatewayRegistrationsRequest.new(global_network_id: global_network_id, max_results: max_results, next_token: next_token, transit_gateway_arns: transit_gateway_arns)
        get_transit_gateway_registrations(input)
      end

      def get_transit_gateway_registrations(input : Types::GetTransitGatewayRegistrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSIT_GATEWAY_REGISTRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a transit gateway route table attachment.

      def get_transit_gateway_route_table_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::GetTransitGatewayRouteTableAttachmentRequest.new(attachment_id: attachment_id)
        get_transit_gateway_route_table_attachment(input)
      end

      def get_transit_gateway_route_table_attachment(input : Types::GetTransitGatewayRouteTableAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSIT_GATEWAY_ROUTE_TABLE_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a VPC attachment.

      def get_vpc_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::GetVpcAttachmentRequest.new(attachment_id: attachment_id)
        get_vpc_attachment(input)
      end

      def get_vpc_attachment(input : Types::GetVpcAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VPC_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the routing policy associations for attachments in a core network.

      def list_attachment_routing_policy_associations(
        core_network_id : String,
        attachment_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttachmentRoutingPolicyAssociationsRequest.new(core_network_id: core_network_id, attachment_id: attachment_id, max_results: max_results, next_token: next_token)
        list_attachment_routing_policy_associations(input)
      end

      def list_attachment_routing_policy_associations(input : Types::ListAttachmentRoutingPolicyAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHMENT_ROUTING_POLICY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of core network attachments.

      def list_attachments(
        attachment_type : String? = nil,
        core_network_id : String? = nil,
        edge_location : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListAttachmentsRequest.new(attachment_type: attachment_type, core_network_id: core_network_id, edge_location: edge_location, max_results: max_results, next_token: next_token, state: state)
        list_attachments(input)
      end

      def list_attachments(input : Types::ListAttachmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of core network Connect peers.

      def list_connect_peers(
        connect_attachment_id : String? = nil,
        core_network_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectPeersRequest.new(connect_attachment_id: connect_attachment_id, core_network_id: core_network_id, max_results: max_results, next_token: next_token)
        list_connect_peers(input)
      end

      def list_connect_peers(input : Types::ListConnectPeersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECT_PEERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of core network policy versions.

      def list_core_network_policy_versions(
        core_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreNetworkPolicyVersionsRequest.new(core_network_id: core_network_id, max_results: max_results, next_token: next_token)
        list_core_network_policy_versions(input)
      end

      def list_core_network_policy_versions(input : Types::ListCoreNetworkPolicyVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_NETWORK_POLICY_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the prefix list associations for a core network.

      def list_core_network_prefix_list_associations(
        core_network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefix_list_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreNetworkPrefixListAssociationsRequest.new(core_network_id: core_network_id, max_results: max_results, next_token: next_token, prefix_list_arn: prefix_list_arn)
        list_core_network_prefix_list_associations(input)
      end

      def list_core_network_prefix_list_associations(input : Types::ListCoreNetworkPrefixListAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_NETWORK_PREFIX_LIST_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists routing information for a core network, including routes and their attributes.

      def list_core_network_routing_information(
        core_network_id : String,
        edge_location : String,
        segment_name : String,
        community_matches : Array(String)? = nil,
        exact_as_path_matches : Array(String)? = nil,
        local_preference_matches : Array(String)? = nil,
        max_results : Int32? = nil,
        med_matches : Array(String)? = nil,
        next_hop_filters : Hash(String, Array(String))? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreNetworkRoutingInformationRequest.new(core_network_id: core_network_id, edge_location: edge_location, segment_name: segment_name, community_matches: community_matches, exact_as_path_matches: exact_as_path_matches, local_preference_matches: local_preference_matches, max_results: max_results, med_matches: med_matches, next_hop_filters: next_hop_filters, next_token: next_token)
        list_core_network_routing_information(input)
      end

      def list_core_network_routing_information(input : Types::ListCoreNetworkRoutingInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_NETWORK_ROUTING_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of owned and shared core networks.

      def list_core_networks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreNetworksRequest.new(max_results: max_results, next_token: next_token)
        list_core_networks(input)
      end

      def list_core_networks(input : Types::ListCoreNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of the Service Linked Role (SLR) deployment for the accounts in a given Amazon Web
      # Services Organization.

      def list_organization_service_access_status(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationServiceAccessStatusRequest.new(max_results: max_results, next_token: next_token)
        list_organization_service_access_status(input)
      end

      def list_organization_service_access_status(input : Types::ListOrganizationServiceAccessStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_SERVICE_ACCESS_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the peerings for a core network.

      def list_peerings(
        core_network_id : String? = nil,
        edge_location : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        peering_type : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListPeeringsRequest.new(core_network_id: core_network_id, edge_location: edge_location, max_results: max_results, next_token: next_token, peering_type: peering_type, state: state)
        list_peerings(input)
      end

      def list_peerings(input : Types::ListPeeringsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PEERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for a specified resource.

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

      # Applies a routing policy label to an attachment for traffic routing decisions.

      def put_attachment_routing_policy_label(
        attachment_id : String,
        core_network_id : String,
        routing_policy_label : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PutAttachmentRoutingPolicyLabelRequest.new(attachment_id: attachment_id, core_network_id: core_network_id, routing_policy_label: routing_policy_label, client_token: client_token)
        put_attachment_routing_policy_label(input)
      end

      def put_attachment_routing_policy_label(input : Types::PutAttachmentRoutingPolicyLabelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ATTACHMENT_ROUTING_POLICY_LABEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new, immutable version of a core network policy. A subsequent change set is created
      # showing the differences between the LIVE policy and the submitted policy.

      def put_core_network_policy(
        core_network_id : String,
        policy_document : String,
        client_token : String? = nil,
        description : String? = nil,
        latest_version_id : Int32? = nil
      ) : Protocol::Request
        input = Types::PutCoreNetworkPolicyRequest.new(core_network_id: core_network_id, policy_document: policy_document, client_token: client_token, description: description, latest_version_id: latest_version_id)
        put_core_network_policy(input)
      end

      def put_core_network_policy(input : Types::PutCoreNetworkPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CORE_NETWORK_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates a resource policy.

      def put_resource_policy(
        policy_document : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy_document: policy_document, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a transit gateway in your global network. Not all Regions support transit gateways for
      # global networks. For a list of the supported Regions, see Region Availability in the Amazon Web
      # Services Transit Gateways for Global Networks User Guide . The transit gateway can be in any of the
      # supported Amazon Web Services Regions, but it must be owned by the same Amazon Web Services account
      # that owns the global network. You cannot register a transit gateway in more than one global network.

      def register_transit_gateway(
        global_network_id : String,
        transit_gateway_arn : String
      ) : Protocol::Request
        input = Types::RegisterTransitGatewayRequest.new(global_network_id: global_network_id, transit_gateway_arn: transit_gateway_arn)
        register_transit_gateway(input)
      end

      def register_transit_gateway(input : Types::RegisterTransitGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_TRANSIT_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects a core network attachment request.

      def reject_attachment(
        attachment_id : String
      ) : Protocol::Request
        input = Types::RejectAttachmentRequest.new(attachment_id: attachment_id)
        reject_attachment(input)
      end

      def reject_attachment(input : Types::RejectAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a routing policy label from an attachment.

      def remove_attachment_routing_policy_label(
        attachment_id : String,
        core_network_id : String
      ) : Protocol::Request
        input = Types::RemoveAttachmentRoutingPolicyLabelRequest.new(attachment_id: attachment_id, core_network_id: core_network_id)
        remove_attachment_routing_policy_label(input)
      end

      def remove_attachment_routing_policy_label(input : Types::RemoveAttachmentRoutingPolicyLabelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ATTACHMENT_ROUTING_POLICY_LABEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restores a previous policy version as a new, immutable version of a core network policy. A
      # subsequent change set is created showing the differences between the LIVE policy and restored
      # policy.

      def restore_core_network_policy_version(
        core_network_id : String,
        policy_version_id : Int32
      ) : Protocol::Request
        input = Types::RestoreCoreNetworkPolicyVersionRequest.new(core_network_id: core_network_id, policy_version_id: policy_version_id)
        restore_core_network_policy_version(input)
      end

      def restore_core_network_policy_version(input : Types::RestoreCoreNetworkPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_CORE_NETWORK_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the Network Manager service for an Amazon Web Services Organization. This can only be called
      # by a management account within the organization.

      def start_organization_service_access_update(
        action : String
      ) : Protocol::Request
        input = Types::StartOrganizationServiceAccessUpdateRequest.new(action: action)
        start_organization_service_access_update(input)
      end

      def start_organization_service_access_update(input : Types::StartOrganizationServiceAccessUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ORGANIZATION_SERVICE_ACCESS_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts analyzing the routing path between the specified source and destination. For more
      # information, see Route Analyzer .

      def start_route_analysis(
        destination : Types::RouteAnalysisEndpointOptionsSpecification,
        global_network_id : String,
        source : Types::RouteAnalysisEndpointOptionsSpecification,
        include_return_path : Bool? = nil,
        use_middleboxes : Bool? = nil
      ) : Protocol::Request
        input = Types::StartRouteAnalysisRequest.new(destination: destination, global_network_id: global_network_id, source: source, include_return_path: include_return_path, use_middleboxes: use_middleboxes)
        start_route_analysis(input)
      end

      def start_route_analysis(input : Types::StartRouteAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ROUTE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a specified resource.

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

      # Updates the information for an existing connection. To remove information for any of the parameters,
      # specify an empty string.

      def update_connection(
        connection_id : String,
        global_network_id : String,
        connected_link_id : String? = nil,
        description : String? = nil,
        link_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectionRequest.new(connection_id: connection_id, global_network_id: global_network_id, connected_link_id: connected_link_id, description: description, link_id: link_id)
        update_connection(input)
      end

      def update_connection(input : Types::UpdateConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description of a core network.

      def update_core_network(
        core_network_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCoreNetworkRequest.new(core_network_id: core_network_id, description: description)
        update_core_network(input)
      end

      def update_core_network(input : Types::UpdateCoreNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CORE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details for an existing device. To remove information for any of the parameters, specify
      # an empty string.

      def update_device(
        device_id : String,
        global_network_id : String,
        aws_location : Types::AWSLocation? = nil,
        description : String? = nil,
        location : Types::Location? = nil,
        model : String? = nil,
        serial_number : String? = nil,
        site_id : String? = nil,
        type : String? = nil,
        vendor : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeviceRequest.new(device_id: device_id, global_network_id: global_network_id, aws_location: aws_location, description: description, location: location, model: model, serial_number: serial_number, site_id: site_id, type: type, vendor: vendor)
        update_device(input)
      end

      def update_device(input : Types::UpdateDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the edge locations associated with an Amazon Web Services Direct Connect gateway attachment.

      def update_direct_connect_gateway_attachment(
        attachment_id : String,
        edge_locations : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateDirectConnectGatewayAttachmentRequest.new(attachment_id: attachment_id, edge_locations: edge_locations)
        update_direct_connect_gateway_attachment(input)
      end

      def update_direct_connect_gateway_attachment(input : Types::UpdateDirectConnectGatewayAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DIRECT_CONNECT_GATEWAY_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing global network. To remove information for any of the parameters, specify an
      # empty string.

      def update_global_network(
        global_network_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalNetworkRequest.new(global_network_id: global_network_id, description: description)
        update_global_network(input)
      end

      def update_global_network(input : Types::UpdateGlobalNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details for an existing link. To remove information for any of the parameters, specify
      # an empty string.

      def update_link(
        global_network_id : String,
        link_id : String,
        bandwidth : Types::Bandwidth? = nil,
        description : String? = nil,
        provider : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLinkRequest.new(global_network_id: global_network_id, link_id: link_id, bandwidth: bandwidth, description: description, provider: provider, type: type)
        update_link(input)
      end

      def update_link(input : Types::UpdateLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resource metadata for the specified global network.

      def update_network_resource_metadata(
        global_network_id : String,
        metadata : Hash(String, String),
        resource_arn : String
      ) : Protocol::Request
        input = Types::UpdateNetworkResourceMetadataRequest.new(global_network_id: global_network_id, metadata: metadata, resource_arn: resource_arn)
        update_network_resource_metadata(input)
      end

      def update_network_resource_metadata(input : Types::UpdateNetworkResourceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK_RESOURCE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the information for an existing site. To remove information for any of the parameters,
      # specify an empty string.

      def update_site(
        global_network_id : String,
        site_id : String,
        description : String? = nil,
        location : Types::Location? = nil
      ) : Protocol::Request
        input = Types::UpdateSiteRequest.new(global_network_id: global_network_id, site_id: site_id, description: description, location: location)
        update_site(input)
      end

      def update_site(input : Types::UpdateSiteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a VPC attachment.

      def update_vpc_attachment(
        attachment_id : String,
        add_subnet_arns : Array(String)? = nil,
        options : Types::VpcOptions? = nil,
        remove_subnet_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateVpcAttachmentRequest.new(attachment_id: attachment_id, add_subnet_arns: add_subnet_arns, options: options, remove_subnet_arns: remove_subnet_arns)
        update_vpc_attachment(input)
      end

      def update_vpc_attachment(input : Types::UpdateVpcAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VPC_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
