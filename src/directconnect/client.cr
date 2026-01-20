module Aws
  module DirectConnect
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

      # Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct
      # Connect gateway.

      def accept_direct_connect_gateway_association_proposal(
        associated_gateway_owner_account : String,
        direct_connect_gateway_id : String,
        proposal_id : String,
        override_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
      ) : Types::AcceptDirectConnectGatewayAssociationProposalResult

        input = Types::AcceptDirectConnectGatewayAssociationProposalRequest.new(associated_gateway_owner_account: associated_gateway_owner_account, direct_connect_gateway_id: direct_connect_gateway_id, proposal_id: proposal_id, override_allowed_prefixes_to_direct_connect_gateway: override_allowed_prefixes_to_direct_connect_gateway)
        accept_direct_connect_gateway_association_proposal(input)
      end

      def accept_direct_connect_gateway_association_proposal(input : Types::AcceptDirectConnectGatewayAssociationProposalRequest) : Types::AcceptDirectConnectGatewayAssociationProposalResult
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptDirectConnectGatewayAssociationProposalResult, "AcceptDirectConnectGatewayAssociationProposal")
      end

      # Deprecated. Use AllocateHostedConnection instead. Creates a hosted connection on an interconnect.
      # Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection on the
      # specified interconnect. Intended for use by Direct Connect Partners only.

      def allocate_connection_on_interconnect(
        bandwidth : String,
        connection_name : String,
        interconnect_id : String,
        owner_account : String,
        vlan : Int32
      ) : Types::Connection

        input = Types::AllocateConnectionOnInterconnectRequest.new(bandwidth: bandwidth, connection_name: connection_name, interconnect_id: interconnect_id, owner_account: owner_account, vlan: vlan)
        allocate_connection_on_interconnect(input)
      end

      def allocate_connection_on_interconnect(input : Types::AllocateConnectionOnInterconnectRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_CONNECTION_ON_INTERCONNECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "AllocateConnectionOnInterconnect")
      end

      # Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of
      # interconnects. Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a
      # hosted connection on the specified interconnect or LAG of interconnects. Amazon Web Services polices
      # the hosted connection for the specified capacity and the Direct Connect Partner must also police the
      # hosted connection for the specified capacity. Intended for use by Direct Connect Partners only.

      def allocate_hosted_connection(
        bandwidth : String,
        connection_id : String,
        connection_name : String,
        owner_account : String,
        vlan : Int32,
        tags : Array(Types::Tag)? = nil
      ) : Types::Connection

        input = Types::AllocateHostedConnectionRequest.new(bandwidth: bandwidth, connection_id: connection_id, connection_name: connection_name, owner_account: owner_account, vlan: vlan, tags: tags)
        allocate_hosted_connection(input)
      end

      def allocate_hosted_connection(input : Types::AllocateHostedConnectionRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_HOSTED_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "AllocateHostedConnection")
      end

      # Provisions a private virtual interface to be owned by the specified Amazon Web Services account.
      # Virtual interfaces created using this action must be confirmed by the owner using
      # ConfirmPrivateVirtualInterface . Until then, the virtual interface is in the Confirming state and is
      # not available to handle traffic.

      def allocate_private_virtual_interface(
        connection_id : String,
        new_private_virtual_interface_allocation : Types::NewPrivateVirtualInterfaceAllocation,
        owner_account : String
      ) : Types::VirtualInterface

        input = Types::AllocatePrivateVirtualInterfaceRequest.new(connection_id: connection_id, new_private_virtual_interface_allocation: new_private_virtual_interface_allocation, owner_account: owner_account)
        allocate_private_virtual_interface(input)
      end

      def allocate_private_virtual_interface(input : Types::AllocatePrivateVirtualInterfaceRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_PRIVATE_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "AllocatePrivateVirtualInterface")
      end

      # Provisions a public virtual interface to be owned by the specified Amazon Web Services account. The
      # owner of a connection calls this function to provision a public virtual interface to be owned by the
      # specified Amazon Web Services account. Virtual interfaces created using this function must be
      # confirmed by the owner using ConfirmPublicVirtualInterface . Until this step has been completed, the
      # virtual interface is in the confirming state and is not available to handle traffic. When creating
      # an IPv6 public virtual interface, omit the Amazon address and customer address. IPv6 addresses are
      # automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6
      # addresses.

      def allocate_public_virtual_interface(
        connection_id : String,
        new_public_virtual_interface_allocation : Types::NewPublicVirtualInterfaceAllocation,
        owner_account : String
      ) : Types::VirtualInterface

        input = Types::AllocatePublicVirtualInterfaceRequest.new(connection_id: connection_id, new_public_virtual_interface_allocation: new_public_virtual_interface_allocation, owner_account: owner_account)
        allocate_public_virtual_interface(input)
      end

      def allocate_public_virtual_interface(input : Types::AllocatePublicVirtualInterfaceRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_PUBLIC_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "AllocatePublicVirtualInterface")
      end

      # Provisions a transit virtual interface to be owned by the specified Amazon Web Services account. Use
      # this type of interface to connect a transit gateway to your Direct Connect gateway. The owner of a
      # connection provisions a transit virtual interface to be owned by the specified Amazon Web Services
      # account. After you create a transit virtual interface, it must be confirmed by the owner using
      # ConfirmTransitVirtualInterface . Until this step has been completed, the transit virtual interface
      # is in the requested state and is not available to handle traffic.

      def allocate_transit_virtual_interface(
        connection_id : String,
        new_transit_virtual_interface_allocation : Types::NewTransitVirtualInterfaceAllocation,
        owner_account : String
      ) : Types::AllocateTransitVirtualInterfaceResult

        input = Types::AllocateTransitVirtualInterfaceRequest.new(connection_id: connection_id, new_transit_virtual_interface_allocation: new_transit_virtual_interface_allocation, owner_account: owner_account)
        allocate_transit_virtual_interface(input)
      end

      def allocate_transit_virtual_interface(input : Types::AllocateTransitVirtualInterfaceRequest) : Types::AllocateTransitVirtualInterfaceResult
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_TRANSIT_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AllocateTransitVirtualInterfaceResult, "AllocateTransitVirtualInterface")
      end

      # Associates an existing connection with a link aggregation group (LAG). The connection is interrupted
      # and re-established as a member of the LAG (connectivity to Amazon Web Services is interrupted). The
      # connection must be hosted on the same Direct Connect endpoint as the LAG, and its bandwidth must
      # match the bandwidth for the LAG. You can re-associate a connection that's currently associated with
      # a different LAG; however, if removing the connection would cause the original LAG to fall below its
      # setting for minimum number of operational connections, the request fails. Any virtual interfaces
      # that are directly associated with the connection are automatically re-associated with the LAG. If
      # the connection was originally associated with a different LAG, the virtual interfaces remain
      # associated with the original LAG. For interconnects, any hosted connections are automatically
      # re-associated with the LAG. If the interconnect was originally associated with a different LAG, the
      # hosted connections remain associated with the original LAG.

      def associate_connection_with_lag(
        connection_id : String,
        lag_id : String
      ) : Types::Connection

        input = Types::AssociateConnectionWithLagRequest.new(connection_id: connection_id, lag_id: lag_id)
        associate_connection_with_lag(input)
      end

      def associate_connection_with_lag(input : Types::AssociateConnectionWithLagRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_CONNECTION_WITH_LAG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "AssociateConnectionWithLag")
      end

      # Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) or
      # interconnect. If the target interconnect or LAG has an existing hosted connection with a conflicting
      # VLAN number or IP address, the operation fails. This action temporarily interrupts the hosted
      # connection's connectivity to Amazon Web Services as it is being migrated. Intended for use by Direct
      # Connect Partners only.

      def associate_hosted_connection(
        connection_id : String,
        parent_connection_id : String
      ) : Types::Connection

        input = Types::AssociateHostedConnectionRequest.new(connection_id: connection_id, parent_connection_id: parent_connection_id)
        associate_hosted_connection(input)
      end

      def associate_hosted_connection(input : Types::AssociateHostedConnectionRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_HOSTED_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "AssociateHostedConnection")
      end

      # Associates a MAC Security (MACsec) Connection Key Name (CKN)/ Connectivity Association Key (CAK)
      # pair with a Direct Connect connection. You must supply either the secretARN, or the CKN/CAK ( ckn
      # and cak ) pair in the request. For information about MAC Security (MACsec) key considerations, see
      # MACsec pre-shared CKN/CAK key considerations in the Direct Connect User Guide .

      def associate_mac_sec_key(
        connection_id : String,
        cak : String? = nil,
        ckn : String? = nil,
        secret_arn : String? = nil
      ) : Types::AssociateMacSecKeyResponse

        input = Types::AssociateMacSecKeyRequest.new(connection_id: connection_id, cak: cak, ckn: ckn, secret_arn: secret_arn)
        associate_mac_sec_key(input)
      end

      def associate_mac_sec_key(input : Types::AssociateMacSecKeyRequest) : Types::AssociateMacSecKeyResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_MAC_SEC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateMacSecKeyResponse, "AssociateMacSecKey")
      end

      # Associates a virtual interface with a specified link aggregation group (LAG) or connection.
      # Connectivity to Amazon Web Services is temporarily interrupted as the virtual interface is being
      # migrated. If the target connection or LAG has an associated virtual interface with a conflicting
      # VLAN number or a conflicting IP address, the operation fails. Virtual interfaces associated with a
      # hosted connection cannot be associated with a LAG; hosted connections must be migrated along with
      # their virtual interfaces using AssociateHostedConnection . To reassociate a virtual interface to a
      # new connection or LAG, the requester must own either the virtual interface itself or the connection
      # to which the virtual interface is currently associated. Additionally, the requester must own the
      # connection or LAG for the association.

      def associate_virtual_interface(
        connection_id : String,
        virtual_interface_id : String
      ) : Types::VirtualInterface

        input = Types::AssociateVirtualInterfaceRequest.new(connection_id: connection_id, virtual_interface_id: virtual_interface_id)
        associate_virtual_interface(input)
      end

      def associate_virtual_interface(input : Types::AssociateVirtualInterfaceRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "AssociateVirtualInterface")
      end

      # Confirms the creation of the specified hosted connection on an interconnect. Upon creation, the
      # hosted connection is initially in the Ordering state, and remains in this state until the owner
      # confirms creation of the hosted connection.

      def confirm_connection(
        connection_id : String
      ) : Types::ConfirmConnectionResponse

        input = Types::ConfirmConnectionRequest.new(connection_id: connection_id)
        confirm_connection(input)
      end

      def confirm_connection(input : Types::ConfirmConnectionRequest) : Types::ConfirmConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmConnectionResponse, "ConfirmConnection")
      end

      # The confirmation of the terms of agreement when creating the connection/link aggregation group
      # (LAG).

      def confirm_customer_agreement(
        agreement_name : String? = nil
      ) : Types::ConfirmCustomerAgreementResponse

        input = Types::ConfirmCustomerAgreementRequest.new(agreement_name: agreement_name)
        confirm_customer_agreement(input)
      end

      def confirm_customer_agreement(input : Types::ConfirmCustomerAgreementRequest) : Types::ConfirmCustomerAgreementResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_CUSTOMER_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmCustomerAgreementResponse, "ConfirmCustomerAgreement")
      end

      # Accepts ownership of a private virtual interface created by another Amazon Web Services account.
      # After the virtual interface owner makes this call, the virtual interface is created and attached to
      # the specified virtual private gateway or Direct Connect gateway, and is made available to handle
      # traffic.

      def confirm_private_virtual_interface(
        virtual_interface_id : String,
        direct_connect_gateway_id : String? = nil,
        virtual_gateway_id : String? = nil
      ) : Types::ConfirmPrivateVirtualInterfaceResponse

        input = Types::ConfirmPrivateVirtualInterfaceRequest.new(virtual_interface_id: virtual_interface_id, direct_connect_gateway_id: direct_connect_gateway_id, virtual_gateway_id: virtual_gateway_id)
        confirm_private_virtual_interface(input)
      end

      def confirm_private_virtual_interface(input : Types::ConfirmPrivateVirtualInterfaceRequest) : Types::ConfirmPrivateVirtualInterfaceResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_PRIVATE_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmPrivateVirtualInterfaceResponse, "ConfirmPrivateVirtualInterface")
      end

      # Accepts ownership of a public virtual interface created by another Amazon Web Services account.
      # After the virtual interface owner makes this call, the specified virtual interface is created and
      # made available to handle traffic.

      def confirm_public_virtual_interface(
        virtual_interface_id : String
      ) : Types::ConfirmPublicVirtualInterfaceResponse

        input = Types::ConfirmPublicVirtualInterfaceRequest.new(virtual_interface_id: virtual_interface_id)
        confirm_public_virtual_interface(input)
      end

      def confirm_public_virtual_interface(input : Types::ConfirmPublicVirtualInterfaceRequest) : Types::ConfirmPublicVirtualInterfaceResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_PUBLIC_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmPublicVirtualInterfaceResponse, "ConfirmPublicVirtualInterface")
      end

      # Accepts ownership of a transit virtual interface created by another Amazon Web Services account.
      # After the owner of the transit virtual interface makes this call, the specified transit virtual
      # interface is created and made available to handle traffic.

      def confirm_transit_virtual_interface(
        direct_connect_gateway_id : String,
        virtual_interface_id : String
      ) : Types::ConfirmTransitVirtualInterfaceResponse

        input = Types::ConfirmTransitVirtualInterfaceRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, virtual_interface_id: virtual_interface_id)
        confirm_transit_virtual_interface(input)
      end

      def confirm_transit_virtual_interface(input : Types::ConfirmTransitVirtualInterfaceRequest) : Types::ConfirmTransitVirtualInterfaceResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_TRANSIT_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmTransitVirtualInterfaceResponse, "ConfirmTransitVirtualInterface")
      end

      # Creates a BGP peer on the specified virtual interface. You must create a BGP peer for the
      # corresponding address family (IPv4/IPv6) in order to access Amazon Web Services resources that also
      # use that address family. If logical redundancy is not supported by the connection, interconnect, or
      # LAG, the BGP peer cannot be in the same address family as an existing BGP peer on the virtual
      # interface. When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6
      # addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify
      # custom IPv6 addresses. If you let Amazon Web Services auto-assign IPv4 addresses, a /30 CIDR will be
      # allocated from 169.254.0.0/16. Amazon Web Services does not recommend this option if you intend to
      # use the customer router peer IP address as the source and destination for traffic. Instead you
      # should use RFC 1918 or other addressing, and specify the address yourself. For more information
      # about RFC 1918 see Address Allocation for Private Internets . For a public virtual interface, the
      # Autonomous System Number (ASN) must be private or already on the allow list for the virtual
      # interface.

      def create_bgp_peer(
        new_bgp_peer : Types::NewBGPPeer? = nil,
        virtual_interface_id : String? = nil
      ) : Types::CreateBGPPeerResponse

        input = Types::CreateBGPPeerRequest.new(new_bgp_peer: new_bgp_peer, virtual_interface_id: virtual_interface_id)
        create_bgp_peer(input)
      end

      def create_bgp_peer(input : Types::CreateBGPPeerRequest) : Types::CreateBGPPeerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BGP_PEER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBGPPeerResponse, "CreateBGPPeer")
      end

      # Creates a connection between a customer network and a specific Direct Connect location. A connection
      # links your internal network to an Direct Connect location over a standard Ethernet fiber-optic
      # cable. One end of the cable is connected to your router, the other to an Direct Connect router. To
      # find the locations for your Region, use DescribeLocations . You can automatically add the new
      # connection to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures
      # that the new connection is allocated on the same Direct Connect endpoint that hosts the specified
      # LAG. If there are no available ports on the endpoint, the request fails and no connection is
      # created.

      def create_connection(
        bandwidth : String,
        connection_name : String,
        location : String,
        lag_id : String? = nil,
        provider_name : String? = nil,
        request_mac_sec : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::Connection

        input = Types::CreateConnectionRequest.new(bandwidth: bandwidth, connection_name: connection_name, location: location, lag_id: lag_id, provider_name: provider_name, request_mac_sec: request_mac_sec, tags: tags)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "CreateConnection")
      end

      # Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a set
      # of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and visible
      # in any Amazon Web Services Region after it is created. The virtual interfaces and virtual private
      # gateways that are connected through a Direct Connect gateway can be in different Amazon Web Services
      # Regions. This enables you to connect to a VPC in any Region, regardless of the Region in which the
      # virtual interfaces are located, and pass traffic between them.

      def create_direct_connect_gateway(
        direct_connect_gateway_name : String,
        amazon_side_asn : Int64? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDirectConnectGatewayResult

        input = Types::CreateDirectConnectGatewayRequest.new(direct_connect_gateway_name: direct_connect_gateway_name, amazon_side_asn: amazon_side_asn, tags: tags)
        create_direct_connect_gateway(input)
      end

      def create_direct_connect_gateway(input : Types::CreateDirectConnectGatewayRequest) : Types::CreateDirectConnectGatewayResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DIRECT_CONNECT_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDirectConnectGatewayResult, "CreateDirectConnectGateway")
      end

      # Creates an association between a Direct Connect gateway and a virtual private gateway. The virtual
      # private gateway must be attached to a VPC and must not be associated with another Direct Connect
      # gateway.

      def create_direct_connect_gateway_association(
        direct_connect_gateway_id : String,
        add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
        gateway_id : String? = nil,
        virtual_gateway_id : String? = nil
      ) : Types::CreateDirectConnectGatewayAssociationResult

        input = Types::CreateDirectConnectGatewayAssociationRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, add_allowed_prefixes_to_direct_connect_gateway: add_allowed_prefixes_to_direct_connect_gateway, gateway_id: gateway_id, virtual_gateway_id: virtual_gateway_id)
        create_direct_connect_gateway_association(input)
      end

      def create_direct_connect_gateway_association(input : Types::CreateDirectConnectGatewayAssociationRequest) : Types::CreateDirectConnectGatewayAssociationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDirectConnectGatewayAssociationResult, "CreateDirectConnectGatewayAssociation")
      end

      # Creates a proposal to associate the specified virtual private gateway or transit gateway with the
      # specified Direct Connect gateway. You can associate a Direct Connect gateway and virtual private
      # gateway or transit gateway that is owned by any Amazon Web Services account.

      def create_direct_connect_gateway_association_proposal(
        direct_connect_gateway_id : String,
        direct_connect_gateway_owner_account : String,
        gateway_id : String,
        add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
        remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
      ) : Types::CreateDirectConnectGatewayAssociationProposalResult

        input = Types::CreateDirectConnectGatewayAssociationProposalRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, direct_connect_gateway_owner_account: direct_connect_gateway_owner_account, gateway_id: gateway_id, add_allowed_prefixes_to_direct_connect_gateway: add_allowed_prefixes_to_direct_connect_gateway, remove_allowed_prefixes_to_direct_connect_gateway: remove_allowed_prefixes_to_direct_connect_gateway)
        create_direct_connect_gateway_association_proposal(input)
      end

      def create_direct_connect_gateway_association_proposal(input : Types::CreateDirectConnectGatewayAssociationProposalRequest) : Types::CreateDirectConnectGatewayAssociationProposalResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDirectConnectGatewayAssociationProposalResult, "CreateDirectConnectGatewayAssociationProposal")
      end

      # Creates an interconnect between an Direct Connect Partner's network and a specific Direct Connect
      # location. An interconnect is a connection that is capable of hosting other connections. The Direct
      # Connect Partner can use an interconnect to provide Direct Connect hosted connections to customers
      # through their own network services. Like a standard connection, an interconnect links the partner's
      # network to an Direct Connect location over a standard Ethernet fiber-optic cable. One end is
      # connected to the partner's router, the other to an Direct Connect router. You can automatically add
      # the new interconnect to a link aggregation group (LAG) by specifying a LAG ID in the request. This
      # ensures that the new interconnect is allocated on the same Direct Connect endpoint that hosts the
      # specified LAG. If there are no available ports on the endpoint, the request fails and no
      # interconnect is created. For each end customer, the Direct Connect Partner provisions a connection
      # on their interconnect by calling AllocateHostedConnection . The end customer can then connect to
      # Amazon Web Services resources by creating a virtual interface on their connection, using the VLAN
      # assigned to them by the Direct Connect Partner. Intended for use by Direct Connect Partners only.

      def create_interconnect(
        bandwidth : String,
        interconnect_name : String,
        location : String,
        lag_id : String? = nil,
        provider_name : String? = nil,
        request_mac_sec : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::Interconnect

        input = Types::CreateInterconnectRequest.new(bandwidth: bandwidth, interconnect_name: interconnect_name, location: location, lag_id: lag_id, provider_name: provider_name, request_mac_sec: request_mac_sec, tags: tags)
        create_interconnect(input)
      end

      def create_interconnect(input : Types::CreateInterconnectRequest) : Types::Interconnect
        request = Protocol::JsonRpc.build_request(Model::CREATE_INTERCONNECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Interconnect, "CreateInterconnect")
      end

      # Creates a link aggregation group (LAG) with the specified number of bundled physical dedicated
      # connections between the customer network and a specific Direct Connect location. A LAG is a logical
      # interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple interfaces,
      # enabling you to treat them as a single interface. All connections in a LAG must use the same
      # bandwidth (either 1Gbps, 10Gbps, 100Gbps, or 400Gbps) and must terminate at the same Direct Connect
      # endpoint. You can have up to 10 dedicated connections per location. Regardless of this limit, if you
      # request more connections for the LAG than Direct Connect can allocate on a single endpoint, no LAG
      # is created.. You can specify an existing physical dedicated connection or interconnect to include in
      # the LAG (which counts towards the total number of connections). Doing so interrupts the current
      # physical dedicated connection, and re-establishes them as a member of the LAG. The LAG will be
      # created on the same Direct Connect endpoint to which the dedicated connection terminates. Any
      # virtual interfaces associated with the dedicated connection are automatically disassociated and
      # re-associated with the LAG. The connection ID does not change. If the Amazon Web Services account
      # used to create a LAG is a registered Direct Connect Partner, the LAG is automatically enabled to
      # host sub-connections. For a LAG owned by a partner, any associated virtual interfaces cannot be
      # directly configured.

      def create_lag(
        connections_bandwidth : String,
        lag_name : String,
        location : String,
        number_of_connections : Int32,
        child_connection_tags : Array(Types::Tag)? = nil,
        connection_id : String? = nil,
        provider_name : String? = nil,
        request_mac_sec : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::Lag

        input = Types::CreateLagRequest.new(connections_bandwidth: connections_bandwidth, lag_name: lag_name, location: location, number_of_connections: number_of_connections, child_connection_tags: child_connection_tags, connection_id: connection_id, provider_name: provider_name, request_mac_sec: request_mac_sec, tags: tags)
        create_lag(input)
      end

      def create_lag(input : Types::CreateLagRequest) : Types::Lag
        request = Protocol::JsonRpc.build_request(Model::CREATE_LAG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Lag, "CreateLag")
      end

      # Creates a private virtual interface. A virtual interface is the VLAN that transports Direct Connect
      # traffic. A private virtual interface can be connected to either a Direct Connect gateway or a
      # Virtual Private Gateway (VGW). Connecting the private virtual interface to a Direct Connect gateway
      # enables the possibility for connecting to multiple VPCs, including VPCs in different Amazon Web
      # Services Regions. Connecting the private virtual interface to a VGW only provides access to a single
      # VPC within the same Region. Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause
      # an update to the underlying physical connection if it wasn't updated to support jumbo frames.
      # Updating the connection disrupts network connectivity for all virtual interfaces associated with the
      # connection for up to 30 seconds. To check whether your connection supports jumbo frames, call
      # DescribeConnections . To check whether your virtual interface supports jumbo frames, call
      # DescribeVirtualInterfaces .

      def create_private_virtual_interface(
        connection_id : String,
        new_private_virtual_interface : Types::NewPrivateVirtualInterface
      ) : Types::VirtualInterface

        input = Types::CreatePrivateVirtualInterfaceRequest.new(connection_id: connection_id, new_private_virtual_interface: new_private_virtual_interface)
        create_private_virtual_interface(input)
      end

      def create_private_virtual_interface(input : Types::CreatePrivateVirtualInterfaceRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRIVATE_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "CreatePrivateVirtualInterface")
      end

      # Creates a public virtual interface. A virtual interface is the VLAN that transports Direct Connect
      # traffic. A public virtual interface supports sending traffic to public services of Amazon Web
      # Services such as Amazon S3. When creating an IPv6 public virtual interface ( addressFamily is ipv6
      # ), leave the customer and amazon address fields blank to use auto-assigned IPv6 space. Custom IPv6
      # addresses are not supported.

      def create_public_virtual_interface(
        connection_id : String,
        new_public_virtual_interface : Types::NewPublicVirtualInterface
      ) : Types::VirtualInterface

        input = Types::CreatePublicVirtualInterfaceRequest.new(connection_id: connection_id, new_public_virtual_interface: new_public_virtual_interface)
        create_public_virtual_interface(input)
      end

      def create_public_virtual_interface(input : Types::CreatePublicVirtualInterfaceRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::CREATE_PUBLIC_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "CreatePublicVirtualInterface")
      end

      # Creates a transit virtual interface. A transit virtual interface should be used to access one or
      # more transit gateways associated with Direct Connect gateways. A transit virtual interface enables
      # the connection of multiple VPCs attached to a transit gateway to a Direct Connect gateway. If you
      # associate your transit gateway with one or more Direct Connect gateways, the Autonomous System
      # Number (ASN) used by the transit gateway and the Direct Connect gateway must be different. For
      # example, if you use the default ASN 64512 for both your the transit gateway and Direct Connect
      # gateway, the association request fails. A jumbo MTU value must be either 1500 or 8500. No other
      # values will be accepted. Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an
      # update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating
      # the connection disrupts network connectivity for all virtual interfaces associated with the
      # connection for up to 30 seconds. To check whether your connection supports jumbo frames, call
      # DescribeConnections . To check whether your virtual interface supports jumbo frames, call
      # DescribeVirtualInterfaces .

      def create_transit_virtual_interface(
        connection_id : String,
        new_transit_virtual_interface : Types::NewTransitVirtualInterface
      ) : Types::CreateTransitVirtualInterfaceResult

        input = Types::CreateTransitVirtualInterfaceRequest.new(connection_id: connection_id, new_transit_virtual_interface: new_transit_virtual_interface)
        create_transit_virtual_interface(input)
      end

      def create_transit_virtual_interface(input : Types::CreateTransitVirtualInterfaceRequest) : Types::CreateTransitVirtualInterfaceResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRANSIT_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTransitVirtualInterfaceResult, "CreateTransitVirtualInterface")
      end

      # Deletes the specified BGP peer on the specified virtual interface with the specified customer
      # address and ASN. You cannot delete the last BGP peer from a virtual interface.

      def delete_bgp_peer(
        asn : Int32? = nil,
        asn_long : Int64? = nil,
        bgp_peer_id : String? = nil,
        customer_address : String? = nil,
        virtual_interface_id : String? = nil
      ) : Types::DeleteBGPPeerResponse

        input = Types::DeleteBGPPeerRequest.new(asn: asn, asn_long: asn_long, bgp_peer_id: bgp_peer_id, customer_address: customer_address, virtual_interface_id: virtual_interface_id)
        delete_bgp_peer(input)
      end

      def delete_bgp_peer(input : Types::DeleteBGPPeerRequest) : Types::DeleteBGPPeerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BGP_PEER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBGPPeerResponse, "DeleteBGPPeer")
      end

      # Deletes the specified connection. Deleting a connection only stops the Direct Connect port hour and
      # data transfer charges. If you are partnering with any third parties to connect with the Direct
      # Connect location, you must cancel your service with them separately.

      def delete_connection(
        connection_id : String
      ) : Types::Connection

        input = Types::DeleteConnectionRequest.new(connection_id: connection_id)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "DeleteConnection")
      end

      # Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that are
      # attached to the Direct Connect gateway and disassociate all virtual private gateways associated with
      # the Direct Connect gateway.

      def delete_direct_connect_gateway(
        direct_connect_gateway_id : String
      ) : Types::DeleteDirectConnectGatewayResult

        input = Types::DeleteDirectConnectGatewayRequest.new(direct_connect_gateway_id: direct_connect_gateway_id)
        delete_direct_connect_gateway(input)
      end

      def delete_direct_connect_gateway(input : Types::DeleteDirectConnectGatewayRequest) : Types::DeleteDirectConnectGatewayResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DIRECT_CONNECT_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDirectConnectGatewayResult, "DeleteDirectConnectGateway")
      end

      # Deletes the association between the specified Direct Connect gateway and virtual private gateway. We
      # recommend that you specify the associationID to delete the association. Alternatively, if you own
      # virtual gateway and a Direct Connect gateway association, you can specify the virtualGatewayId and
      # directConnectGatewayId to delete an association.

      def delete_direct_connect_gateway_association(
        association_id : String? = nil,
        direct_connect_gateway_id : String? = nil,
        virtual_gateway_id : String? = nil
      ) : Types::DeleteDirectConnectGatewayAssociationResult

        input = Types::DeleteDirectConnectGatewayAssociationRequest.new(association_id: association_id, direct_connect_gateway_id: direct_connect_gateway_id, virtual_gateway_id: virtual_gateway_id)
        delete_direct_connect_gateway_association(input)
      end

      def delete_direct_connect_gateway_association(input : Types::DeleteDirectConnectGatewayAssociationRequest) : Types::DeleteDirectConnectGatewayAssociationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DIRECT_CONNECT_GATEWAY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDirectConnectGatewayAssociationResult, "DeleteDirectConnectGatewayAssociation")
      end

      # Deletes the association proposal request between the specified Direct Connect gateway and virtual
      # private gateway or transit gateway.

      def delete_direct_connect_gateway_association_proposal(
        proposal_id : String
      ) : Types::DeleteDirectConnectGatewayAssociationProposalResult

        input = Types::DeleteDirectConnectGatewayAssociationProposalRequest.new(proposal_id: proposal_id)
        delete_direct_connect_gateway_association_proposal(input)
      end

      def delete_direct_connect_gateway_association_proposal(input : Types::DeleteDirectConnectGatewayAssociationProposalRequest) : Types::DeleteDirectConnectGatewayAssociationProposalResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDirectConnectGatewayAssociationProposalResult, "DeleteDirectConnectGatewayAssociationProposal")
      end

      # Deletes the specified interconnect. Intended for use by Direct Connect Partners only.

      def delete_interconnect(
        interconnect_id : String
      ) : Types::DeleteInterconnectResponse

        input = Types::DeleteInterconnectRequest.new(interconnect_id: interconnect_id)
        delete_interconnect(input)
      end

      def delete_interconnect(input : Types::DeleteInterconnectRequest) : Types::DeleteInterconnectResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INTERCONNECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInterconnectResponse, "DeleteInterconnect")
      end

      # Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active virtual
      # interfaces or hosted connections.

      def delete_lag(
        lag_id : String
      ) : Types::Lag

        input = Types::DeleteLagRequest.new(lag_id: lag_id)
        delete_lag(input)
      end

      def delete_lag(input : Types::DeleteLagRequest) : Types::Lag
        request = Protocol::JsonRpc.build_request(Model::DELETE_LAG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Lag, "DeleteLag")
      end

      # Deletes a virtual interface.

      def delete_virtual_interface(
        virtual_interface_id : String
      ) : Types::DeleteVirtualInterfaceResponse

        input = Types::DeleteVirtualInterfaceRequest.new(virtual_interface_id: virtual_interface_id)
        delete_virtual_interface(input)
      end

      def delete_virtual_interface(input : Types::DeleteVirtualInterfaceRequest) : Types::DeleteVirtualInterfaceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VIRTUAL_INTERFACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVirtualInterfaceResponse, "DeleteVirtualInterface")
      end

      # Deprecated. Use DescribeLoa instead. Gets the LOA-CFA for a connection. The Letter of Authorization
      # - Connecting Facility Assignment (LOA-CFA) is a document that your APN partner or service provider
      # uses when establishing your cross connect to Amazon Web Services at the colocation facility. For
      # more information, see Requesting Cross Connects at Direct Connect Locations in the Direct Connect
      # User Guide .

      def describe_connection_loa(
        connection_id : String,
        loa_content_type : String? = nil,
        provider_name : String? = nil
      ) : Types::DescribeConnectionLoaResponse

        input = Types::DescribeConnectionLoaRequest.new(connection_id: connection_id, loa_content_type: loa_content_type, provider_name: provider_name)
        describe_connection_loa(input)
      end

      def describe_connection_loa(input : Types::DescribeConnectionLoaRequest) : Types::DescribeConnectionLoaResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTION_LOA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionLoaResponse, "DescribeConnectionLoa")
      end

      # Displays the specified connection or all connections in this Region.

      def describe_connections(
        connection_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::Connections

        input = Types::DescribeConnectionsRequest.new(connection_id: connection_id, max_results: max_results, next_token: next_token)
        describe_connections(input)
      end

      def describe_connections(input : Types::DescribeConnectionsRequest) : Types::Connections
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connections, "DescribeConnections")
      end

      # Deprecated. Use DescribeHostedConnections instead. Lists the connections that have been provisioned
      # on the specified interconnect. Intended for use by Direct Connect Partners only.

      def describe_connections_on_interconnect(
        interconnect_id : String
      ) : Types::Connections

        input = Types::DescribeConnectionsOnInterconnectRequest.new(interconnect_id: interconnect_id)
        describe_connections_on_interconnect(input)
      end

      def describe_connections_on_interconnect(input : Types::DescribeConnectionsOnInterconnectRequest) : Types::Connections
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTIONS_ON_INTERCONNECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connections, "DescribeConnectionsOnInterconnect")
      end

      # Get and view a list of customer agreements, along with their signed status and whether the customer
      # is an NNIPartner, NNIPartnerV2, or a nonPartner.


      def describe_customer_metadata : Types::DescribeCustomerMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOMER_METADATA, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomerMetadataResponse, "DescribeCustomerMetadata")
      end

      # Describes one or more association proposals for connection between a virtual private gateway or
      # transit gateway and a Direct Connect gateway.

      def describe_direct_connect_gateway_association_proposals(
        associated_gateway_id : String? = nil,
        direct_connect_gateway_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        proposal_id : String? = nil
      ) : Types::DescribeDirectConnectGatewayAssociationProposalsResult

        input = Types::DescribeDirectConnectGatewayAssociationProposalsRequest.new(associated_gateway_id: associated_gateway_id, direct_connect_gateway_id: direct_connect_gateway_id, max_results: max_results, next_token: next_token, proposal_id: proposal_id)
        describe_direct_connect_gateway_association_proposals(input)
      end

      def describe_direct_connect_gateway_association_proposals(input : Types::DescribeDirectConnectGatewayAssociationProposalsRequest) : Types::DescribeDirectConnectGatewayAssociationProposalsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectConnectGatewayAssociationProposalsResult, "DescribeDirectConnectGatewayAssociationProposals")
      end

      # Lists the associations between your Direct Connect gateways and virtual private gateways and transit
      # gateways. You must specify one of the following: A Direct Connect gateway The response contains all
      # virtual private gateways and transit gateways associated with the Direct Connect gateway. A virtual
      # private gateway The response contains the Direct Connect gateway. A transit gateway The response
      # contains the Direct Connect gateway. A Direct Connect gateway and a virtual private gateway The
      # response contains the association between the Direct Connect gateway and virtual private gateway. A
      # Direct Connect gateway and a transit gateway The response contains the association between the
      # Direct Connect gateway and transit gateway. A Direct Connect gateway and a virtual private gateway
      # The response contains the association between the Direct Connect gateway and virtual private
      # gateway. A Direct Connect gateway association to a Cloud WAN core network The response contains the
      # Cloud WAN core network ID that the Direct Connect gateway is associated to.

      def describe_direct_connect_gateway_associations(
        associated_gateway_id : String? = nil,
        association_id : String? = nil,
        direct_connect_gateway_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        virtual_gateway_id : String? = nil
      ) : Types::DescribeDirectConnectGatewayAssociationsResult

        input = Types::DescribeDirectConnectGatewayAssociationsRequest.new(associated_gateway_id: associated_gateway_id, association_id: association_id, direct_connect_gateway_id: direct_connect_gateway_id, max_results: max_results, next_token: next_token, virtual_gateway_id: virtual_gateway_id)
        describe_direct_connect_gateway_associations(input)
      end

      def describe_direct_connect_gateway_associations(input : Types::DescribeDirectConnectGatewayAssociationsRequest) : Types::DescribeDirectConnectGatewayAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECT_CONNECT_GATEWAY_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectConnectGatewayAssociationsResult, "DescribeDirectConnectGatewayAssociations")
      end

      # Lists the attachments between your Direct Connect gateways and virtual interfaces. You must specify
      # a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect gateway, the
      # response contains all virtual interfaces attached to the Direct Connect gateway. If you specify a
      # virtual interface, the response contains all Direct Connect gateways attached to the virtual
      # interface. If you specify both, the response contains the attachment between the Direct Connect
      # gateway and the virtual interface.

      def describe_direct_connect_gateway_attachments(
        direct_connect_gateway_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        virtual_interface_id : String? = nil
      ) : Types::DescribeDirectConnectGatewayAttachmentsResult

        input = Types::DescribeDirectConnectGatewayAttachmentsRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, max_results: max_results, next_token: next_token, virtual_interface_id: virtual_interface_id)
        describe_direct_connect_gateway_attachments(input)
      end

      def describe_direct_connect_gateway_attachments(input : Types::DescribeDirectConnectGatewayAttachmentsRequest) : Types::DescribeDirectConnectGatewayAttachmentsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECT_CONNECT_GATEWAY_ATTACHMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectConnectGatewayAttachmentsResult, "DescribeDirectConnectGatewayAttachments")
      end

      # Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted Direct
      # Connect gateways are not returned.

      def describe_direct_connect_gateways(
        direct_connect_gateway_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDirectConnectGatewaysResult

        input = Types::DescribeDirectConnectGatewaysRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, max_results: max_results, next_token: next_token)
        describe_direct_connect_gateways(input)
      end

      def describe_direct_connect_gateways(input : Types::DescribeDirectConnectGatewaysRequest) : Types::DescribeDirectConnectGatewaysResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECT_CONNECT_GATEWAYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectConnectGatewaysResult, "DescribeDirectConnectGateways")
      end

      # Lists the hosted connections that have been provisioned on the specified interconnect or link
      # aggregation group (LAG). Intended for use by Direct Connect Partners only.

      def describe_hosted_connections(
        connection_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::Connections

        input = Types::DescribeHostedConnectionsRequest.new(connection_id: connection_id, max_results: max_results, next_token: next_token)
        describe_hosted_connections(input)
      end

      def describe_hosted_connections(input : Types::DescribeHostedConnectionsRequest) : Types::Connections
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HOSTED_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connections, "DescribeHostedConnections")
      end

      # Deprecated. Use DescribeLoa instead. Gets the LOA-CFA for the specified interconnect. The Letter of
      # Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when
      # establishing your cross connect to Amazon Web Services at the colocation facility. For more
      # information, see Requesting Cross Connects at Direct Connect Locations in the Direct Connect User
      # Guide .

      def describe_interconnect_loa(
        interconnect_id : String,
        loa_content_type : String? = nil,
        provider_name : String? = nil
      ) : Types::DescribeInterconnectLoaResponse

        input = Types::DescribeInterconnectLoaRequest.new(interconnect_id: interconnect_id, loa_content_type: loa_content_type, provider_name: provider_name)
        describe_interconnect_loa(input)
      end

      def describe_interconnect_loa(input : Types::DescribeInterconnectLoaRequest) : Types::DescribeInterconnectLoaResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INTERCONNECT_LOA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInterconnectLoaResponse, "DescribeInterconnectLoa")
      end

      # Lists the interconnects owned by the Amazon Web Services account or only the specified interconnect.

      def describe_interconnects(
        interconnect_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::Interconnects

        input = Types::DescribeInterconnectsRequest.new(interconnect_id: interconnect_id, max_results: max_results, next_token: next_token)
        describe_interconnects(input)
      end

      def describe_interconnects(input : Types::DescribeInterconnectsRequest) : Types::Interconnects
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INTERCONNECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Interconnects, "DescribeInterconnects")
      end

      # Describes all your link aggregation groups (LAG) or the specified LAG.

      def describe_lags(
        lag_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::Lags

        input = Types::DescribeLagsRequest.new(lag_id: lag_id, max_results: max_results, next_token: next_token)
        describe_lags(input)
      end

      def describe_lags(input : Types::DescribeLagsRequest) : Types::Lags
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Lags, "DescribeLags")
      end

      # Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG). The Letter of
      # Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when
      # establishing your cross connect to Amazon Web Services at the colocation facility. For more
      # information, see Requesting Cross Connects at Direct Connect Locations in the Direct Connect User
      # Guide .

      def describe_loa(
        connection_id : String,
        loa_content_type : String? = nil,
        provider_name : String? = nil
      ) : Types::Loa

        input = Types::DescribeLoaRequest.new(connection_id: connection_id, loa_content_type: loa_content_type, provider_name: provider_name)
        describe_loa(input)
      end

      def describe_loa(input : Types::DescribeLoaRequest) : Types::Loa
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Loa, "DescribeLoa")
      end

      # Lists the Direct Connect locations in the current Amazon Web Services Region. These are the
      # locations that can be selected when calling CreateConnection or CreateInterconnect .


      def describe_locations : Types::Locations
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATIONS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Locations, "DescribeLocations")
      end

      # Details about the router.

      def describe_router_configuration(
        virtual_interface_id : String,
        router_type_identifier : String? = nil
      ) : Types::DescribeRouterConfigurationResponse

        input = Types::DescribeRouterConfigurationRequest.new(virtual_interface_id: virtual_interface_id, router_type_identifier: router_type_identifier)
        describe_router_configuration(input)
      end

      def describe_router_configuration(input : Types::DescribeRouterConfigurationRequest) : Types::DescribeRouterConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ROUTER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRouterConfigurationResponse, "DescribeRouterConfiguration")
      end

      # Describes the tags associated with the specified Direct Connect resources.

      def describe_tags(
        resource_arns : Array(String)
      ) : Types::DescribeTagsResponse

        input = Types::DescribeTagsRequest.new(resource_arns: resource_arns)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsRequest) : Types::DescribeTagsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTagsResponse, "DescribeTags")
      end

      # Deprecated. Use DescribeVpnGateways instead. See DescribeVPNGateways in the Amazon Elastic Compute
      # Cloud API Reference . Lists the virtual private gateways owned by the Amazon Web Services account.
      # You can create one or more Direct Connect private virtual interfaces linked to a virtual private
      # gateway.


      def describe_virtual_gateways : Types::VirtualGateways
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VIRTUAL_GATEWAYS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualGateways, "DescribeVirtualGateways")
      end

      # Displays all virtual interfaces for an Amazon Web Services account. Virtual interfaces deleted fewer
      # than 15 minutes before you make the request are also returned. If you specify a connection ID, only
      # the virtual interfaces associated with the connection are returned. If you specify a virtual
      # interface ID, then only a single virtual interface is returned. A virtual interface (VLAN) transmits
      # the traffic between the Direct Connect location and the customer network. If you're using an asn ,
      # the response includes ASN value in both the asn and asnLong fields. If you're using asnLong , the
      # response returns a value of 0 (zero) for the asn attribute because it exceeds the highest ASN value
      # of 2,147,483,647 that it can support

      def describe_virtual_interfaces(
        connection_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        virtual_interface_id : String? = nil
      ) : Types::VirtualInterfaces

        input = Types::DescribeVirtualInterfacesRequest.new(connection_id: connection_id, max_results: max_results, next_token: next_token, virtual_interface_id: virtual_interface_id)
        describe_virtual_interfaces(input)
      end

      def describe_virtual_interfaces(input : Types::DescribeVirtualInterfacesRequest) : Types::VirtualInterfaces
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VIRTUAL_INTERFACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterfaces, "DescribeVirtualInterfaces")
      end

      # Disassociates a connection from a link aggregation group (LAG). The connection is interrupted and
      # re-established as a standalone connection (the connection is not deleted; to delete the connection,
      # use the DeleteConnection request). If the LAG has associated virtual interfaces or hosted
      # connections, they remain associated with the LAG. A disassociated connection owned by an Direct
      # Connect Partner is automatically converted to an interconnect. If disassociating the connection
      # would cause the LAG to fall below its setting for minimum number of operational connections, the
      # request fails, except when it's the last member of the LAG. If all connections are disassociated,
      # the LAG continues to exist as an empty LAG with no physical connections.

      def disassociate_connection_from_lag(
        connection_id : String,
        lag_id : String
      ) : Types::Connection

        input = Types::DisassociateConnectionFromLagRequest.new(connection_id: connection_id, lag_id: lag_id)
        disassociate_connection_from_lag(input)
      end

      def disassociate_connection_from_lag(input : Types::DisassociateConnectionFromLagRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_CONNECTION_FROM_LAG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "DisassociateConnectionFromLag")
      end

      # Removes the association between a MAC Security (MACsec) security key and a Direct Connect
      # connection.

      def disassociate_mac_sec_key(
        connection_id : String,
        secret_arn : String
      ) : Types::DisassociateMacSecKeyResponse

        input = Types::DisassociateMacSecKeyRequest.new(connection_id: connection_id, secret_arn: secret_arn)
        disassociate_mac_sec_key(input)
      end

      def disassociate_mac_sec_key(input : Types::DisassociateMacSecKeyRequest) : Types::DisassociateMacSecKeyResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_MAC_SEC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateMacSecKeyResponse, "DisassociateMacSecKey")
      end

      # Lists the virtual interface failover test history.

      def list_virtual_interface_test_history(
        bgp_peers : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        test_id : String? = nil,
        virtual_interface_id : String? = nil
      ) : Types::ListVirtualInterfaceTestHistoryResponse

        input = Types::ListVirtualInterfaceTestHistoryRequest.new(bgp_peers: bgp_peers, max_results: max_results, next_token: next_token, status: status, test_id: test_id, virtual_interface_id: virtual_interface_id)
        list_virtual_interface_test_history(input)
      end

      def list_virtual_interface_test_history(input : Types::ListVirtualInterfaceTestHistoryRequest) : Types::ListVirtualInterfaceTestHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VIRTUAL_INTERFACE_TEST_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVirtualInterfaceTestHistoryResponse, "ListVirtualInterfaceTestHistory")
      end

      # Starts the virtual interface failover test that verifies your configuration meets your resiliency
      # requirements by placing the BGP peering session in the DOWN state. You can then send traffic to
      # verify that there are no outages. You can run the test on public, private, transit, and hosted
      # virtual interfaces. You can use ListVirtualInterfaceTestHistory to view the virtual interface test
      # history. If you need to stop the test before the test interval completes, use StopBgpFailoverTest .

      def start_bgp_failover_test(
        virtual_interface_id : String,
        bgp_peers : Array(String)? = nil,
        test_duration_in_minutes : Int32? = nil
      ) : Types::StartBgpFailoverTestResponse

        input = Types::StartBgpFailoverTestRequest.new(virtual_interface_id: virtual_interface_id, bgp_peers: bgp_peers, test_duration_in_minutes: test_duration_in_minutes)
        start_bgp_failover_test(input)
      end

      def start_bgp_failover_test(input : Types::StartBgpFailoverTestRequest) : Types::StartBgpFailoverTestResponse
        request = Protocol::JsonRpc.build_request(Model::START_BGP_FAILOVER_TEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartBgpFailoverTestResponse, "StartBgpFailoverTest")
      end

      # Stops the virtual interface failover test.

      def stop_bgp_failover_test(
        virtual_interface_id : String
      ) : Types::StopBgpFailoverTestResponse

        input = Types::StopBgpFailoverTestRequest.new(virtual_interface_id: virtual_interface_id)
        stop_bgp_failover_test(input)
      end

      def stop_bgp_failover_test(input : Types::StopBgpFailoverTestRequest) : Types::StopBgpFailoverTestResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_BGP_FAILOVER_TEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopBgpFailoverTestResponse, "StopBgpFailoverTest")
      end

      # Adds the specified tags to the specified Direct Connect resource. Each resource can have a maximum
      # of 50 tags. Each tag consists of a key and an optional value. If a tag with the same key is already
      # associated with the resource, this action updates its value.

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

      # Removes one or more tags from the specified Direct Connect resource.

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

      # Updates the Direct Connect connection configuration. You can update the following parameters for a
      # connection: The connection name The connection's MAC Security (MACsec) encryption mode.

      def update_connection(
        connection_id : String,
        connection_name : String? = nil,
        encryption_mode : String? = nil
      ) : Types::Connection

        input = Types::UpdateConnectionRequest.new(connection_id: connection_id, connection_name: connection_name, encryption_mode: encryption_mode)
        update_connection(input)
      end

      def update_connection(input : Types::UpdateConnectionRequest) : Types::Connection
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Connection, "UpdateConnection")
      end

      # Updates the name of a current Direct Connect gateway.

      def update_direct_connect_gateway(
        direct_connect_gateway_id : String,
        new_direct_connect_gateway_name : String
      ) : Types::UpdateDirectConnectGatewayResponse

        input = Types::UpdateDirectConnectGatewayRequest.new(direct_connect_gateway_id: direct_connect_gateway_id, new_direct_connect_gateway_name: new_direct_connect_gateway_name)
        update_direct_connect_gateway(input)
      end

      def update_direct_connect_gateway(input : Types::UpdateDirectConnectGatewayRequest) : Types::UpdateDirectConnectGatewayResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DIRECT_CONNECT_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDirectConnectGatewayResponse, "UpdateDirectConnectGateway")
      end

      # Updates the specified attributes of the Direct Connect gateway association. Add or remove prefixes
      # from the association.

      def update_direct_connect_gateway_association(
        add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
        association_id : String? = nil,
        remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
      ) : Types::UpdateDirectConnectGatewayAssociationResult

        input = Types::UpdateDirectConnectGatewayAssociationRequest.new(add_allowed_prefixes_to_direct_connect_gateway: add_allowed_prefixes_to_direct_connect_gateway, association_id: association_id, remove_allowed_prefixes_to_direct_connect_gateway: remove_allowed_prefixes_to_direct_connect_gateway)
        update_direct_connect_gateway_association(input)
      end

      def update_direct_connect_gateway_association(input : Types::UpdateDirectConnectGatewayAssociationRequest) : Types::UpdateDirectConnectGatewayAssociationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDirectConnectGatewayAssociationResult, "UpdateDirectConnectGatewayAssociation")
      end

      # Updates the attributes of the specified link aggregation group (LAG). You can update the following
      # LAG attributes: The name of the LAG. The value for the minimum number of connections that must be
      # operational for the LAG itself to be operational. The LAG's MACsec encryption mode. Amazon Web
      # Services assigns this value to each connection which is part of the LAG. The tags If you adjust the
      # threshold value for the minimum number of operational connections, ensure that the new value does
      # not cause the LAG to fall below the threshold and become non-operational.

      def update_lag(
        lag_id : String,
        encryption_mode : String? = nil,
        lag_name : String? = nil,
        minimum_links : Int32? = nil
      ) : Types::Lag

        input = Types::UpdateLagRequest.new(lag_id: lag_id, encryption_mode: encryption_mode, lag_name: lag_name, minimum_links: minimum_links)
        update_lag(input)
      end

      def update_lag(input : Types::UpdateLagRequest) : Types::Lag
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LAG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Lag, "UpdateLag")
      end

      # Updates the specified attributes of the specified virtual private interface. Setting the MTU of a
      # virtual interface to 8500 (jumbo frames) can cause an update to the underlying physical connection
      # if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity
      # for all virtual interfaces associated with the connection for up to 30 seconds. To check whether
      # your connection supports jumbo frames, call DescribeConnections . To check whether your virtual
      # interface supports jumbo frames, call DescribeVirtualInterfaces .

      def update_virtual_interface_attributes(
        virtual_interface_id : String,
        enable_site_link : Bool? = nil,
        mtu : Int32? = nil,
        virtual_interface_name : String? = nil
      ) : Types::VirtualInterface

        input = Types::UpdateVirtualInterfaceAttributesRequest.new(virtual_interface_id: virtual_interface_id, enable_site_link: enable_site_link, mtu: mtu, virtual_interface_name: virtual_interface_name)
        update_virtual_interface_attributes(input)
      end

      def update_virtual_interface_attributes(input : Types::UpdateVirtualInterfaceAttributesRequest) : Types::VirtualInterface
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VIRTUAL_INTERFACE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VirtualInterface, "UpdateVirtualInterfaceAttributes")
      end
    end
  end
end
