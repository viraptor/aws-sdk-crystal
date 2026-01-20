require "json"
require "time"

module AwsSdk
  module DirectConnect
    module Types


      struct AcceptDirectConnectGatewayAssociationProposalRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account that owns the virtual private gateway or transit gateway.

        @[JSON::Field(key: "associatedGatewayOwnerAccount")]
        getter associated_gateway_owner_account : String

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        # The ID of the request proposal.

        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String

        # Overrides the Amazon VPC prefixes advertised to the Direct Connect gateway. For information about
        # how to set the prefixes, see Allowed Prefixes in the Direct Connect User Guide .

        @[JSON::Field(key: "overrideAllowedPrefixesToDirectConnectGateway")]
        getter override_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        def initialize(
          @associated_gateway_owner_account : String,
          @direct_connect_gateway_id : String,
          @proposal_id : String,
          @override_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
        )
        end
      end


      struct AcceptDirectConnectGatewayAssociationProposalResult
        include JSON::Serializable

        # Information about an association between a Direct Connect gateway and a virtual gateway or transit
        # gateway.

        @[JSON::Field(key: "directConnectGatewayAssociation")]
        getter direct_connect_gateway_association : Types::DirectConnectGatewayAssociation?

        def initialize(
          @direct_connect_gateway_association : Types::DirectConnectGatewayAssociation? = nil
        )
        end
      end


      struct AllocateConnectionOnInterconnectRequest
        include JSON::Serializable

        # The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps,
        # 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note that only those Direct Connect Partners who have met
        # specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted connection.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String

        # The name of the provisioned connection.

        @[JSON::Field(key: "connectionName")]
        getter connection_name : String

        # The ID of the interconnect on which the connection will be provisioned.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String

        # The ID of the Amazon Web Services account of the customer for whom the connection will be
        # provisioned.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String

        # The dedicated VLAN provisioned to the connection.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        def initialize(
          @bandwidth : String,
          @connection_name : String,
          @interconnect_id : String,
          @owner_account : String,
          @vlan : Int32
        )
        end
      end


      struct AllocateHostedConnectionRequest
        include JSON::Serializable

        # The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps,
        # 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps, and 25Gbps. Note that only those Direct Connect Partners who
        # have met specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps, 10Gbps, or 25Gbps hosted
        # connection.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String

        # The ID of the interconnect or LAG.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The name of the hosted connection.

        @[JSON::Field(key: "connectionName")]
        getter connection_name : String

        # The ID of the Amazon Web Services account ID of the customer for the connection.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String

        # The dedicated VLAN provisioned to the hosted connection.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        # The tags associated with the connection.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bandwidth : String,
          @connection_id : String,
          @connection_name : String,
          @owner_account : String,
          @vlan : Int32,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct AllocatePrivateVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection on which the private virtual interface is provisioned.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the private virtual interface.

        @[JSON::Field(key: "newPrivateVirtualInterfaceAllocation")]
        getter new_private_virtual_interface_allocation : Types::NewPrivateVirtualInterfaceAllocation

        # The ID of the Amazon Web Services account that owns the virtual private interface.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String

        def initialize(
          @connection_id : String,
          @new_private_virtual_interface_allocation : Types::NewPrivateVirtualInterfaceAllocation,
          @owner_account : String
        )
        end
      end


      struct AllocatePublicVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection on which the public virtual interface is provisioned.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the public virtual interface.

        @[JSON::Field(key: "newPublicVirtualInterfaceAllocation")]
        getter new_public_virtual_interface_allocation : Types::NewPublicVirtualInterfaceAllocation

        # The ID of the Amazon Web Services account that owns the public virtual interface.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String

        def initialize(
          @connection_id : String,
          @new_public_virtual_interface_allocation : Types::NewPublicVirtualInterfaceAllocation,
          @owner_account : String
        )
        end
      end


      struct AllocateTransitVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection on which the transit virtual interface is provisioned.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the transit virtual interface.

        @[JSON::Field(key: "newTransitVirtualInterfaceAllocation")]
        getter new_transit_virtual_interface_allocation : Types::NewTransitVirtualInterfaceAllocation

        # The ID of the Amazon Web Services account that owns the transit virtual interface.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String

        def initialize(
          @connection_id : String,
          @new_transit_virtual_interface_allocation : Types::NewTransitVirtualInterfaceAllocation,
          @owner_account : String
        )
        end
      end


      struct AllocateTransitVirtualInterfaceResult
        include JSON::Serializable

        # Information about the transit virtual interface.

        @[JSON::Field(key: "virtualInterface")]
        getter virtual_interface : Types::VirtualInterface?

        def initialize(
          @virtual_interface : Types::VirtualInterface? = nil
        )
        end
      end


      struct AssociateConnectionWithLagRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the LAG with which to associate the connection.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String

        def initialize(
          @connection_id : String,
          @lag_id : String
        )
        end
      end


      struct AssociateHostedConnectionRequest
        include JSON::Serializable

        # The ID of the hosted connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the interconnect or the LAG.

        @[JSON::Field(key: "parentConnectionId")]
        getter parent_connection_id : String

        def initialize(
          @connection_id : String,
          @parent_connection_id : String
        )
        end
      end


      struct AssociateMacSecKeyRequest
        include JSON::Serializable

        # The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG (dxlag-xxxx). You
        # can use DescribeConnections , DescribeInterconnects , or DescribeLags to retrieve connection ID.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The MAC Security (MACsec) CAK to associate with the connection. You can create the CKN/CAK pair
        # using an industry standard tool. The valid values are 64 hexadecimal characters (0-9, A-E). If you
        # use this request parameter, you must use the ckn request parameter and not use the secretARN request
        # parameter.

        @[JSON::Field(key: "cak")]
        getter cak : String?

        # The MAC Security (MACsec) CKN to associate with the connection. You can create the CKN/CAK pair
        # using an industry standard tool. The valid values are 64 hexadecimal characters (0-9, A-E). If you
        # use this request parameter, you must use the cak request parameter and not use the secretARN request
        # parameter.

        @[JSON::Field(key: "ckn")]
        getter ckn : String?

        # The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key to associate with the
        # connection. You can use DescribeConnections or DescribeLags to retrieve the MAC Security (MACsec)
        # secret key. If you use this request parameter, you do not use the ckn and cak request parameters.

        @[JSON::Field(key: "secretARN")]
        getter secret_arn : String?

        def initialize(
          @connection_id : String,
          @cak : String? = nil,
          @ckn : String? = nil,
          @secret_arn : String? = nil
        )
        end
      end


      struct AssociateMacSecKeyResponse
        include JSON::Serializable

        # The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG (dxlag-xxxx).

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The MAC Security (MACsec) security keys associated with the connection.

        @[JSON::Field(key: "macSecKeys")]
        getter mac_sec_keys : Array(Types::MacSecKey)?

        def initialize(
          @connection_id : String? = nil,
          @mac_sec_keys : Array(Types::MacSecKey)? = nil
        )
        end
      end


      struct AssociateVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the LAG or connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        def initialize(
          @connection_id : String,
          @virtual_interface_id : String
        )
        end
      end

      # The Amazon Web Services Cloud WAN core network that the Direct Connect gateway is associated to.
      # This is only returned when a Direct Connect gateway is associated to a Cloud WAN core network.

      struct AssociatedCoreNetwork
        include JSON::Serializable

        # the ID of the Direct Connect gateway attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The ID of the Cloud WAN core network that the Direct Connect gateway is associated to.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The account owner of the Cloud WAN core network.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        def initialize(
          @attachment_id : String? = nil,
          @id : String? = nil,
          @owner_account : String? = nil
        )
        end
      end

      # Information about the associated gateway.

      struct AssociatedGateway
        include JSON::Serializable

        # The ID of the associated gateway.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ID of the Amazon Web Services account that owns the associated virtual private gateway or
        # transit gateway.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The Region where the associated gateway is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The type of associated gateway.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @owner_account : String? = nil,
          @region : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a BGP peer.

      struct BGPPeer
        include JSON::Serializable

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong .

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for the BGP peer. The valid range is from 1 to 4294967294 for BGP configuration. You
        # can use asnLong or asn , but not both. We recommend using asnLong as it supports a greater pool of
        # numbers. The asnLong attribute accepts both ASN and long ASN ranges. If you provide a value in the
        # same API call for both asn and asnLong , the API will only accept the value for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The Direct Connect endpoint that terminates the BGP peer.

        @[JSON::Field(key: "awsDeviceV2")]
        getter aws_device_v2 : String?

        # The Direct Connect endpoint that terminates the logical connection. This device might be different
        # than the device that terminates the physical connection.

        @[JSON::Field(key: "awsLogicalDeviceId")]
        getter aws_logical_device_id : String?

        # The ID of the BGP peer.

        @[JSON::Field(key: "bgpPeerId")]
        getter bgp_peer_id : String?

        # The state of the BGP peer. The following are the possible values: verifying : The BGP peering
        # addresses or ASN require validation before the BGP peer can be created. This state applies only to
        # public virtual interfaces. pending : The BGP peer is created, and remains in this state until it is
        # ready to be established. available : The BGP peer is ready to be established. deleting : The BGP
        # peer is being deleted. deleted : The BGP peer is deleted and cannot be established.

        @[JSON::Field(key: "bgpPeerState")]
        getter bgp_peer_state : String?

        # The status of the BGP peer. The following are the possible values: up : The BGP peer is established.
        # This state does not indicate the state of the routing function. Ensure that you are receiving routes
        # over the BGP session. down : The BGP peer is down. unknown : The BGP peer status is not available.

        @[JSON::Field(key: "bgpStatus")]
        getter bgp_status : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        def initialize(
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @aws_device_v2 : String? = nil,
          @aws_logical_device_id : String? = nil,
          @bgp_peer_id : String? = nil,
          @bgp_peer_state : String? = nil,
          @bgp_status : String? = nil,
          @customer_address : String? = nil
        )
        end
      end


      struct ConfirmConnectionRequest
        include JSON::Serializable

        # The ID of the hosted connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end


      struct ConfirmConnectionResponse
        include JSON::Serializable

        # The state of the connection. The following are the possible values: ordering : The initial state of
        # a hosted connection provisioned on an interconnect. The connection stays in the ordering state until
        # the owner of the hosted connection confirms or declines the connection order. requested : The
        # initial state of a standard connection. The connection stays in the requested state until the Letter
        # of Authorization (LOA) is sent to the customer. pending : The connection has been approved and is
        # being initialized. available : The network link is up and the connection is ready for use. down :
        # The network link is down. deleting : The connection is being deleted. deleted : The connection has
        # been deleted. rejected : A hosted connection in the ordering state enters the rejected state if it
        # is deleted by the customer. unknown : The state of the connection is not available.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        def initialize(
          @connection_state : String? = nil
        )
        end
      end


      struct ConfirmCustomerAgreementRequest
        include JSON::Serializable

        # The name of the customer agreement.

        @[JSON::Field(key: "agreementName")]
        getter agreement_name : String?

        def initialize(
          @agreement_name : String? = nil
        )
        end
      end


      struct ConfirmCustomerAgreementResponse
        include JSON::Serializable

        # The status of the customer agreement when the connection was created. This will be either signed or
        # unsigned .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct ConfirmPrivateVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The ID of the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        def initialize(
          @virtual_interface_id : String,
          @direct_connect_gateway_id : String? = nil,
          @virtual_gateway_id : String? = nil
        )
        end
      end


      struct ConfirmPrivateVirtualInterfaceResponse
        include JSON::Serializable

        # The state of the virtual interface. The following are the possible values: confirming : The creation
        # of the virtual interface is pending confirmation from the virtual interface owner. If the owner of
        # the virtual interface is different from the owner of the connection on which it is provisioned, then
        # the virtual interface will remain in this state until it is confirmed by the virtual interface
        # owner. verifying : This state only applies to public virtual interfaces. Each public virtual
        # interface needs validation before the virtual interface can be created. pending : A virtual
        # interface is in this state from the time that it is created until the virtual interface is ready to
        # forward traffic. available : A virtual interface that is able to forward traffic. down : A virtual
        # interface that is BGP down. testing : A virtual interface is in this state immediately after calling
        # StartBgpFailoverTest and remains in this state during the duration of the test. deleting : A virtual
        # interface is in this state immediately after calling DeleteVirtualInterface until it can no longer
        # forward traffic. deleted : A virtual interface that cannot forward traffic. rejected : The virtual
        # interface owner has declined creation of the virtual interface. If a virtual interface in the
        # Confirming state is deleted by the virtual interface owner, the virtual interface enters the
        # Rejected state. unknown : The state of the virtual interface is not available.

        @[JSON::Field(key: "virtualInterfaceState")]
        getter virtual_interface_state : String?

        def initialize(
          @virtual_interface_state : String? = nil
        )
        end
      end


      struct ConfirmPublicVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        def initialize(
          @virtual_interface_id : String
        )
        end
      end


      struct ConfirmPublicVirtualInterfaceResponse
        include JSON::Serializable

        # The state of the virtual interface. The following are the possible values: confirming : The creation
        # of the virtual interface is pending confirmation from the virtual interface owner. If the owner of
        # the virtual interface is different from the owner of the connection on which it is provisioned, then
        # the virtual interface will remain in this state until it is confirmed by the virtual interface
        # owner. verifying : This state only applies to public virtual interfaces. Each public virtual
        # interface needs validation before the virtual interface can be created. pending : A virtual
        # interface is in this state from the time that it is created until the virtual interface is ready to
        # forward traffic. available : A virtual interface that is able to forward traffic. down : A virtual
        # interface that is BGP down. testing : A virtual interface is in this state immediately after calling
        # StartBgpFailoverTest and remains in this state during the duration of the test. deleting : A virtual
        # interface is in this state immediately after calling DeleteVirtualInterface until it can no longer
        # forward traffic. deleted : A virtual interface that cannot forward traffic. rejected : The virtual
        # interface owner has declined creation of the virtual interface. If a virtual interface in the
        # Confirming state is deleted by the virtual interface owner, the virtual interface enters the
        # Rejected state. unknown : The state of the virtual interface is not available.

        @[JSON::Field(key: "virtualInterfaceState")]
        getter virtual_interface_state : String?

        def initialize(
          @virtual_interface_state : String? = nil
        )
        end
      end


      struct ConfirmTransitVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        def initialize(
          @direct_connect_gateway_id : String,
          @virtual_interface_id : String
        )
        end
      end


      struct ConfirmTransitVirtualInterfaceResponse
        include JSON::Serializable

        # The state of the virtual interface. The following are the possible values: confirming : The creation
        # of the virtual interface is pending confirmation from the virtual interface owner. If the owner of
        # the virtual interface is different from the owner of the connection on which it is provisioned, then
        # the virtual interface will remain in this state until it is confirmed by the virtual interface
        # owner. verifying : This state only applies to public virtual interfaces. Each public virtual
        # interface needs validation before the virtual interface can be created. pending : A virtual
        # interface is in this state from the time that it is created until the virtual interface is ready to
        # forward traffic. available : A virtual interface that is able to forward traffic. down : A virtual
        # interface that is BGP down. testing : A virtual interface is in this state immediately after calling
        # StartBgpFailoverTest and remains in this state during the duration of the test. deleting : A virtual
        # interface is in this state immediately after calling DeleteVirtualInterface until it can no longer
        # forward traffic. deleted : A virtual interface that cannot forward traffic. rejected : The virtual
        # interface owner has declined creation of the virtual interface. If a virtual interface in the
        # Confirming state is deleted by the virtual interface owner, the virtual interface enters the
        # Rejected state. unknown : The state of the virtual interface is not available.

        @[JSON::Field(key: "virtualInterfaceState")]
        getter virtual_interface_state : String?

        def initialize(
          @virtual_interface_state : String? = nil
        )
        end
      end

      # Information about an Direct Connect connection.

      struct Connection
        include JSON::Serializable

        # The Direct Connect endpoint on which the physical connection terminates.

        @[JSON::Field(key: "awsDevice")]
        getter aws_device : String?

        # The Direct Connect endpoint that terminates the physical connection.

        @[JSON::Field(key: "awsDeviceV2")]
        getter aws_device_v2 : String?

        # The Direct Connect endpoint that terminates the logical connection. This device might be different
        # than the device that terminates the physical connection.

        @[JSON::Field(key: "awsLogicalDeviceId")]
        getter aws_logical_device_id : String?

        # The bandwidth of the connection.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String?

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The name of the connection.

        @[JSON::Field(key: "connectionName")]
        getter connection_name : String?

        # The state of the connection. The following are the possible values: ordering : The initial state of
        # a hosted connection provisioned on an interconnect. The connection stays in the ordering state until
        # the owner of the hosted connection confirms or declines the connection order. requested : The
        # initial state of a standard connection. The connection stays in the requested state until the Letter
        # of Authorization (LOA) is sent to the customer. pending : The connection has been approved and is
        # being initialized. available : The network link is up and the connection is ready for use. down :
        # The network link is down. deleting : The connection is being deleted. deleted : The connection has
        # been deleted. rejected : A hosted connection in the ordering state enters the rejected state if it
        # is deleted by the customer. unknown : The state of the connection is not available.

        @[JSON::Field(key: "connectionState")]
        getter connection_state : String?

        # The MAC Security (MACsec) connection encryption mode. The valid values are no_encrypt ,
        # should_encrypt , and must_encrypt .

        @[JSON::Field(key: "encryptionMode")]
        getter encryption_mode : String?

        # Indicates whether the connection supports a secondary BGP peer in the same address family
        # (IPv4/IPv6).

        @[JSON::Field(key: "hasLogicalRedundancy")]
        getter has_logical_redundancy : String?

        # Indicates whether jumbo frames are supported.

        @[JSON::Field(key: "jumboFrameCapable")]
        getter jumbo_frame_capable : Bool?

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The time of the most recent call to DescribeLoa for this connection.

        @[JSON::Field(key: "loaIssueTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter loa_issue_time : Time?

        # The location of the connection.

        @[JSON::Field(key: "location")]
        getter location : String?

        # Indicates whether the connection supports MAC Security (MACsec).

        @[JSON::Field(key: "macSecCapable")]
        getter mac_sec_capable : Bool?

        # The MAC Security (MACsec) security keys associated with the connection.

        @[JSON::Field(key: "macSecKeys")]
        getter mac_sec_keys : Array(Types::MacSecKey)?

        # The ID of the Amazon Web Services account that owns the connection.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # Indicates whether the interconnect hosting this connection supports MAC Security (MACsec).

        @[JSON::Field(key: "partnerInterconnectMacSecCapable")]
        getter partner_interconnect_mac_sec_capable : Bool?

        # The name of the Direct Connect service provider associated with the connection.

        @[JSON::Field(key: "partnerName")]
        getter partner_name : String?

        # The MAC Security (MACsec) port link status of the connection. The valid values are Encryption Up ,
        # which means that there is an active Connection Key Name, or Encryption Down .

        @[JSON::Field(key: "portEncryptionStatus")]
        getter port_encryption_status : String?

        # The name of the service provider associated with the connection.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # The Amazon Web Services Region where the connection is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The tags associated with the connection.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32?

        def initialize(
          @aws_device : String? = nil,
          @aws_device_v2 : String? = nil,
          @aws_logical_device_id : String? = nil,
          @bandwidth : String? = nil,
          @connection_id : String? = nil,
          @connection_name : String? = nil,
          @connection_state : String? = nil,
          @encryption_mode : String? = nil,
          @has_logical_redundancy : String? = nil,
          @jumbo_frame_capable : Bool? = nil,
          @lag_id : String? = nil,
          @loa_issue_time : Time? = nil,
          @location : String? = nil,
          @mac_sec_capable : Bool? = nil,
          @mac_sec_keys : Array(Types::MacSecKey)? = nil,
          @owner_account : String? = nil,
          @partner_interconnect_mac_sec_capable : Bool? = nil,
          @partner_name : String? = nil,
          @port_encryption_status : String? = nil,
          @provider_name : String? = nil,
          @region : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vlan : Int32? = nil
        )
        end
      end


      struct Connections
        include JSON::Serializable

        # The connections.

        @[JSON::Field(key: "connections")]
        getter connections : Array(Types::Connection)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::Connection)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct CreateBGPPeerRequest
        include JSON::Serializable

        # Information about the BGP peer.

        @[JSON::Field(key: "newBGPPeer")]
        getter new_bgp_peer : Types::NewBGPPeer?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @new_bgp_peer : Types::NewBGPPeer? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end


      struct CreateBGPPeerResponse
        include JSON::Serializable

        # The virtual interface.

        @[JSON::Field(key: "virtualInterface")]
        getter virtual_interface : Types::VirtualInterface?

        def initialize(
          @virtual_interface : Types::VirtualInterface? = nil
        )
        end
      end


      struct CreateConnectionRequest
        include JSON::Serializable

        # The bandwidth of the connection.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String

        # The name of the connection.

        @[JSON::Field(key: "connectionName")]
        getter connection_name : String

        # The location of the connection.

        @[JSON::Field(key: "location")]
        getter location : String

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The name of the service provider associated with the requested connection.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Indicates whether you want the connection to support MAC Security (MACsec). MAC Security (MACsec) is
        # unavailable on hosted connections. For information about MAC Security (MACsec) prerequisites, see
        # MAC Security in Direct Connect in the Direct Connect User Guide .

        @[JSON::Field(key: "requestMACSec")]
        getter request_mac_sec : Bool?

        # The tags to associate with the lag.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bandwidth : String,
          @connection_name : String,
          @location : String,
          @lag_id : String? = nil,
          @provider_name : String? = nil,
          @request_mac_sec : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayAssociationProposalRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        # The ID of the Amazon Web Services account that owns the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayOwnerAccount")]
        getter direct_connect_gateway_owner_account : String

        # The ID of the virtual private gateway or transit gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The Amazon VPC prefixes to advertise to the Direct Connect gateway.

        @[JSON::Field(key: "addAllowedPrefixesToDirectConnectGateway")]
        getter add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        # The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.

        @[JSON::Field(key: "removeAllowedPrefixesToDirectConnectGateway")]
        getter remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        def initialize(
          @direct_connect_gateway_id : String,
          @direct_connect_gateway_owner_account : String,
          @gateway_id : String,
          @add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
          @remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayAssociationProposalResult
        include JSON::Serializable

        # Information about the Direct Connect gateway proposal.

        @[JSON::Field(key: "directConnectGatewayAssociationProposal")]
        getter direct_connect_gateway_association_proposal : Types::DirectConnectGatewayAssociationProposal?

        def initialize(
          @direct_connect_gateway_association_proposal : Types::DirectConnectGatewayAssociationProposal? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayAssociationRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        # The Amazon VPC prefixes to advertise to the Direct Connect gateway This parameter is required when
        # you create an association to a transit gateway. For information about how to set the prefixes, see
        # Allowed Prefixes in the Direct Connect User Guide .

        @[JSON::Field(key: "addAllowedPrefixesToDirectConnectGateway")]
        getter add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        # The ID of the virtual private gateway or transit gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String?

        # The ID of the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        def initialize(
          @direct_connect_gateway_id : String,
          @add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
          @gateway_id : String? = nil,
          @virtual_gateway_id : String? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayAssociationResult
        include JSON::Serializable

        # The association to be created.

        @[JSON::Field(key: "directConnectGatewayAssociation")]
        getter direct_connect_gateway_association : Types::DirectConnectGatewayAssociation?

        def initialize(
          @direct_connect_gateway_association : Types::DirectConnectGatewayAssociation? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayRequest
        include JSON::Serializable

        # The name of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayName")]
        getter direct_connect_gateway_name : String

        # The autonomous system number (ASN) for Border Gateway Protocol (BGP) to be configured on the Amazon
        # side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to
        # 4,294,967,294. The default is 64512.

        @[JSON::Field(key: "amazonSideAsn")]
        getter amazon_side_asn : Int64?

        # The key-value pair tags associated with the request.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @direct_connect_gateway_name : String,
          @amazon_side_asn : Int64? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDirectConnectGatewayResult
        include JSON::Serializable

        # The Direct Connect gateway.

        @[JSON::Field(key: "directConnectGateway")]
        getter direct_connect_gateway : Types::DirectConnectGateway?

        def initialize(
          @direct_connect_gateway : Types::DirectConnectGateway? = nil
        )
        end
      end


      struct CreateInterconnectRequest
        include JSON::Serializable

        # The port bandwidth, in Gbps. The possible values are 1, 10, and 100.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String

        # The name of the interconnect.

        @[JSON::Field(key: "interconnectName")]
        getter interconnect_name : String

        # The location of the interconnect.

        @[JSON::Field(key: "location")]
        getter location : String

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The name of the service provider associated with the interconnect.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Indicates whether you want the interconnect to support MAC Security (MACsec).

        @[JSON::Field(key: "requestMACSec")]
        getter request_mac_sec : Bool?

        # The tags to associate with the interconnect.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bandwidth : String,
          @interconnect_name : String,
          @location : String,
          @lag_id : String? = nil,
          @provider_name : String? = nil,
          @request_mac_sec : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateLagRequest
        include JSON::Serializable

        # The bandwidth of the individual physical dedicated connections bundled by the LAG. The possible
        # values are 1Gbps,10Gbps, 100Gbps, and 400Gbps.

        @[JSON::Field(key: "connectionsBandwidth")]
        getter connections_bandwidth : String

        # The name of the LAG.

        @[JSON::Field(key: "lagName")]
        getter lag_name : String

        # The location for the LAG.

        @[JSON::Field(key: "location")]
        getter location : String

        # The number of physical dedicated connections initially provisioned and bundled by the LAG. You can
        # have a maximum of four connections when the port speed is 1Gbps or 10Gbps, or two when the port
        # speed is 100Gbps or 400Gbps.

        @[JSON::Field(key: "numberOfConnections")]
        getter number_of_connections : Int32

        # The tags to associate with the automtically created LAGs.

        @[JSON::Field(key: "childConnectionTags")]
        getter child_connection_tags : Array(Types::Tag)?

        # The ID of an existing dedicated connection to migrate to the LAG.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The name of the service provider associated with the LAG.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Indicates whether the connection will support MAC Security (MACsec). All connections in the LAG must
        # be capable of supporting MAC Security (MACsec). For information about MAC Security (MACsec)
        # prerequisties, see MACsec prerequisties in the Direct Connect User Guide .

        @[JSON::Field(key: "requestMACSec")]
        getter request_mac_sec : Bool?

        # The tags to associate with the LAG.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connections_bandwidth : String,
          @lag_name : String,
          @location : String,
          @number_of_connections : Int32,
          @child_connection_tags : Array(Types::Tag)? = nil,
          @connection_id : String? = nil,
          @provider_name : String? = nil,
          @request_mac_sec : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePrivateVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the private virtual interface.

        @[JSON::Field(key: "newPrivateVirtualInterface")]
        getter new_private_virtual_interface : Types::NewPrivateVirtualInterface

        def initialize(
          @connection_id : String,
          @new_private_virtual_interface : Types::NewPrivateVirtualInterface
        )
        end
      end


      struct CreatePublicVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the public virtual interface.

        @[JSON::Field(key: "newPublicVirtualInterface")]
        getter new_public_virtual_interface : Types::NewPublicVirtualInterface

        def initialize(
          @connection_id : String,
          @new_public_virtual_interface : Types::NewPublicVirtualInterface
        )
        end
      end


      struct CreateTransitVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # Information about the transit virtual interface.

        @[JSON::Field(key: "newTransitVirtualInterface")]
        getter new_transit_virtual_interface : Types::NewTransitVirtualInterface

        def initialize(
          @connection_id : String,
          @new_transit_virtual_interface : Types::NewTransitVirtualInterface
        )
        end
      end


      struct CreateTransitVirtualInterfaceResult
        include JSON::Serializable

        # Information about a virtual interface.

        @[JSON::Field(key: "virtualInterface")]
        getter virtual_interface : Types::VirtualInterface?

        def initialize(
          @virtual_interface : Types::VirtualInterface? = nil
        )
        end
      end

      # The name and status of a customer agreement.

      struct CustomerAgreement
        include JSON::Serializable

        # The name of the agreement.

        @[JSON::Field(key: "agreementName")]
        getter agreement_name : String?

        # The status of the customer agreement. This will be either signed or unsigned

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @agreement_name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteBGPPeerRequest
        include JSON::Serializable

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong .

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for the BGP peer to be deleted from a Direct Connect virtual interface. The valid range
        # is from 1 to 4294967294 for BGP configuration. You can use asnLong or asn , but not both. We
        # recommend using asnLong as it supports a greater pool of numbers. The asnLong attribute accepts both
        # ASN and long ASN ranges. If you provide a value in the same API call for both asn and asnLong , the
        # API will only accept the value for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The ID of the BGP peer.

        @[JSON::Field(key: "bgpPeerId")]
        getter bgp_peer_id : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @bgp_peer_id : String? = nil,
          @customer_address : String? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end


      struct DeleteBGPPeerResponse
        include JSON::Serializable

        # The virtual interface.

        @[JSON::Field(key: "virtualInterface")]
        getter virtual_interface : Types::VirtualInterface?

        def initialize(
          @virtual_interface : Types::VirtualInterface? = nil
        )
        end
      end


      struct DeleteConnectionRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end


      struct DeleteDirectConnectGatewayAssociationProposalRequest
        include JSON::Serializable

        # The ID of the proposal.

        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String

        def initialize(
          @proposal_id : String
        )
        end
      end


      struct DeleteDirectConnectGatewayAssociationProposalResult
        include JSON::Serializable

        # The ID of the associated gateway.

        @[JSON::Field(key: "directConnectGatewayAssociationProposal")]
        getter direct_connect_gateway_association_proposal : Types::DirectConnectGatewayAssociationProposal?

        def initialize(
          @direct_connect_gateway_association_proposal : Types::DirectConnectGatewayAssociationProposal? = nil
        )
        end
      end


      struct DeleteDirectConnectGatewayAssociationRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The ID of the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        def initialize(
          @association_id : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @virtual_gateway_id : String? = nil
        )
        end
      end


      struct DeleteDirectConnectGatewayAssociationResult
        include JSON::Serializable

        # Information about the deleted association.

        @[JSON::Field(key: "directConnectGatewayAssociation")]
        getter direct_connect_gateway_association : Types::DirectConnectGatewayAssociation?

        def initialize(
          @direct_connect_gateway_association : Types::DirectConnectGatewayAssociation? = nil
        )
        end
      end


      struct DeleteDirectConnectGatewayRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        def initialize(
          @direct_connect_gateway_id : String
        )
        end
      end


      struct DeleteDirectConnectGatewayResult
        include JSON::Serializable

        # The Direct Connect gateway.

        @[JSON::Field(key: "directConnectGateway")]
        getter direct_connect_gateway : Types::DirectConnectGateway?

        def initialize(
          @direct_connect_gateway : Types::DirectConnectGateway? = nil
        )
        end
      end


      struct DeleteInterconnectRequest
        include JSON::Serializable

        # The ID of the interconnect.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String

        def initialize(
          @interconnect_id : String
        )
        end
      end


      struct DeleteInterconnectResponse
        include JSON::Serializable

        # The state of the interconnect. The following are the possible values: requested : The initial state
        # of an interconnect. The interconnect stays in the requested state until the Letter of Authorization
        # (LOA) is sent to the customer. pending : The interconnect is approved, and is being initialized.
        # available : The network link is up, and the interconnect is ready for use. down : The network link
        # is down. deleting : The interconnect is being deleted. deleted : The interconnect is deleted.
        # unknown : The state of the interconnect is not available.

        @[JSON::Field(key: "interconnectState")]
        getter interconnect_state : String?

        def initialize(
          @interconnect_state : String? = nil
        )
        end
      end


      struct DeleteLagRequest
        include JSON::Serializable

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String

        def initialize(
          @lag_id : String
        )
        end
      end


      struct DeleteVirtualInterfaceRequest
        include JSON::Serializable

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        def initialize(
          @virtual_interface_id : String
        )
        end
      end


      struct DeleteVirtualInterfaceResponse
        include JSON::Serializable

        # The state of the virtual interface. The following are the possible values: confirming : The creation
        # of the virtual interface is pending confirmation from the virtual interface owner. If the owner of
        # the virtual interface is different from the owner of the connection on which it is provisioned, then
        # the virtual interface will remain in this state until it is confirmed by the virtual interface
        # owner. verifying : This state only applies to public virtual interfaces. Each public virtual
        # interface needs validation before the virtual interface can be created. pending : A virtual
        # interface is in this state from the time that it is created until the virtual interface is ready to
        # forward traffic. available : A virtual interface that is able to forward traffic. down : A virtual
        # interface that is BGP down. testing : A virtual interface is in this state immediately after calling
        # StartBgpFailoverTest and remains in this state during the duration of the test. deleting : A virtual
        # interface is in this state immediately after calling DeleteVirtualInterface until it can no longer
        # forward traffic. deleted : A virtual interface that cannot forward traffic. rejected : The virtual
        # interface owner has declined creation of the virtual interface. If a virtual interface in the
        # Confirming state is deleted by the virtual interface owner, the virtual interface enters the
        # Rejected state. unknown : The state of the virtual interface is not available.

        @[JSON::Field(key: "virtualInterfaceState")]
        getter virtual_interface_state : String?

        def initialize(
          @virtual_interface_state : String? = nil
        )
        end
      end


      struct DescribeConnectionLoaRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The standard media type for the LOA-CFA document. The only supported value is application/pdf.

        @[JSON::Field(key: "loaContentType")]
        getter loa_content_type : String?

        # The name of the APN partner or service provider who establishes connectivity on your behalf. If you
        # specify this parameter, the LOA-CFA lists the provider name alongside your company name as the
        # requester of the cross connect.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        def initialize(
          @connection_id : String,
          @loa_content_type : String? = nil,
          @provider_name : String? = nil
        )
        end
      end


      struct DescribeConnectionLoaResponse
        include JSON::Serializable

        # The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).

        @[JSON::Field(key: "loa")]
        getter loa : Types::Loa?

        def initialize(
          @loa : Types::Loa? = nil
        )
        end
      end


      struct DescribeConnectionsOnInterconnectRequest
        include JSON::Serializable

        # The ID of the interconnect.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String

        def initialize(
          @interconnect_id : String
        )
        end
      end


      struct DescribeConnectionsRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connection_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCustomerMetadataResponse
        include JSON::Serializable

        # The list of customer agreements.

        @[JSON::Field(key: "agreements")]
        getter agreements : Array(Types::CustomerAgreement)?

        # The type of network-to-network interface (NNI) partner. The partner type will be one of the
        # following: V1: This partner can only allocate 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, or 500Mbps
        # subgigabit connections. V2: This partner can only allocate 1GB, 2GB, 5GB, or 10GB hosted
        # connections. nonPartner: The customer is not a partner.

        @[JSON::Field(key: "nniPartnerType")]
        getter nni_partner_type : String?

        def initialize(
          @agreements : Array(Types::CustomerAgreement)? = nil,
          @nni_partner_type : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAssociationProposalsRequest
        include JSON::Serializable

        # The ID of the associated gateway.

        @[JSON::Field(key: "associatedGatewayId")]
        getter associated_gateway_id : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the proposal.

        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String?

        def initialize(
          @associated_gateway_id : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @proposal_id : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAssociationProposalsResult
        include JSON::Serializable

        # Describes the Direct Connect gateway association proposals.

        @[JSON::Field(key: "directConnectGatewayAssociationProposals")]
        getter direct_connect_gateway_association_proposals : Array(Types::DirectConnectGatewayAssociationProposal)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @direct_connect_gateway_association_proposals : Array(Types::DirectConnectGatewayAssociationProposal)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAssociationsRequest
        include JSON::Serializable

        # The ID of the associated gateway.

        @[JSON::Field(key: "associatedGatewayId")]
        getter associated_gateway_id : String?

        # The ID of the Direct Connect gateway association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token provided in the previous call to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the virtual private gateway or transit gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        def initialize(
          @associated_gateway_id : String? = nil,
          @association_id : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @virtual_gateway_id : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAssociationsResult
        include JSON::Serializable

        # Information about the associations.

        @[JSON::Field(key: "directConnectGatewayAssociations")]
        getter direct_connect_gateway_associations : Array(Types::DirectConnectGatewayAssociation)?

        # The token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @direct_connect_gateway_associations : Array(Types::DirectConnectGatewayAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAttachmentsRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token provided in the previous call to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @direct_connect_gateway_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewayAttachmentsResult
        include JSON::Serializable

        # The attachments.

        @[JSON::Field(key: "directConnectGatewayAttachments")]
        getter direct_connect_gateway_attachments : Array(Types::DirectConnectGatewayAttachment)?

        # The token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @direct_connect_gateway_attachments : Array(Types::DirectConnectGatewayAttachment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewaysRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token provided in the previous call to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @direct_connect_gateway_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectConnectGatewaysResult
        include JSON::Serializable

        # The Direct Connect gateways.

        @[JSON::Field(key: "directConnectGateways")]
        getter direct_connect_gateways : Array(Types::DirectConnectGateway)?

        # The token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @direct_connect_gateways : Array(Types::DirectConnectGateway)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeHostedConnectionsRequest
        include JSON::Serializable

        # The ID of the interconnect or LAG.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connection_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeInterconnectLoaRequest
        include JSON::Serializable

        # The ID of the interconnect.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String

        # The standard media type for the LOA-CFA document. The only supported value is application/pdf.

        @[JSON::Field(key: "loaContentType")]
        getter loa_content_type : String?

        # The name of the service provider who establishes connectivity on your behalf. If you supply this
        # parameter, the LOA-CFA lists the provider name alongside your company name as the requester of the
        # cross connect.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        def initialize(
          @interconnect_id : String,
          @loa_content_type : String? = nil,
          @provider_name : String? = nil
        )
        end
      end


      struct DescribeInterconnectLoaResponse
        include JSON::Serializable

        # The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).

        @[JSON::Field(key: "loa")]
        getter loa : Types::Loa?

        def initialize(
          @loa : Types::Loa? = nil
        )
        end
      end


      struct DescribeInterconnectsRequest
        include JSON::Serializable

        # The ID of the interconnect.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @interconnect_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLagsRequest
        include JSON::Serializable

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lag_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLoaRequest
        include JSON::Serializable

        # The ID of a connection, LAG, or interconnect.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The standard media type for the LOA-CFA document. The only supported value is application/pdf.

        @[JSON::Field(key: "loaContentType")]
        getter loa_content_type : String?

        # The name of the service provider who establishes connectivity on your behalf. If you specify this
        # parameter, the LOA-CFA lists the provider name alongside your company name as the requester of the
        # cross connect.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        def initialize(
          @connection_id : String,
          @loa_content_type : String? = nil,
          @provider_name : String? = nil
        )
        end
      end

      # Provides the details about a virtual interface's router.

      struct DescribeRouterConfigurationRequest
        include JSON::Serializable

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        # Identifies the router by a combination of vendor, platform, and software version. For example,
        # CiscoSystemsInc-2900SeriesRouters-IOS124 .

        @[JSON::Field(key: "routerTypeIdentifier")]
        getter router_type_identifier : String?

        def initialize(
          @virtual_interface_id : String,
          @router_type_identifier : String? = nil
        )
        end
      end


      struct DescribeRouterConfigurationResponse
        include JSON::Serializable

        # The customer router configuration.

        @[JSON::Field(key: "customerRouterConfig")]
        getter customer_router_config : String?

        # The details about the router.

        @[JSON::Field(key: "router")]
        getter router : Types::RouterType?

        # The ID assigned to the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        # Provides the details about a virtual interface's router.

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String?

        def initialize(
          @customer_router_config : String? = nil,
          @router : Types::RouterType? = nil,
          @virtual_interface_id : String? = nil,
          @virtual_interface_name : String? = nil
        )
        end
      end


      struct DescribeTagsRequest
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the resources.

        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)

        def initialize(
          @resource_arns : Array(String)
        )
        end
      end


      struct DescribeTagsResponse
        include JSON::Serializable

        # Information about the tags.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct DescribeVirtualInterfacesRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @connection_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end

      # One or more parameters are not valid.

      struct DirectConnectClientException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a Direct Connect gateway, which enables you to connect virtual interfaces and
      # virtual private gateway or transit gateways.

      struct DirectConnectGateway
        include JSON::Serializable

        # The autonomous system number (AS) for the Amazon side of the connection.

        @[JSON::Field(key: "amazonSideAsn")]
        getter amazon_side_asn : Int64?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The name of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayName")]
        getter direct_connect_gateway_name : String?

        # The state of the Direct Connect gateway. The following are the possible values: pending : The
        # initial state after calling CreateDirectConnectGateway . available : The Direct Connect gateway is
        # ready for use. deleting : The initial state after calling DeleteDirectConnectGateway . deleted : The
        # Direct Connect gateway is deleted and cannot pass traffic.

        @[JSON::Field(key: "directConnectGatewayState")]
        getter direct_connect_gateway_state : String?

        # The ID of the Amazon Web Services account that owns the Direct Connect gateway.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The error message if the state of an object failed to advance.

        @[JSON::Field(key: "stateChangeError")]
        getter state_change_error : String?

        # Information about a tag.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @amazon_side_asn : Int64? = nil,
          @direct_connect_gateway_id : String? = nil,
          @direct_connect_gateway_name : String? = nil,
          @direct_connect_gateway_state : String? = nil,
          @owner_account : String? = nil,
          @state_change_error : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about an association between a Direct Connect gateway and a virtual private gateway or
      # transit gateway.

      struct DirectConnectGatewayAssociation
        include JSON::Serializable

        # The Amazon VPC prefixes to advertise to the Direct Connect gateway.

        @[JSON::Field(key: "allowedPrefixesToDirectConnectGateway")]
        getter allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        # The ID of the Cloud WAN core network associated with the Direct Connect gateway attachment.

        @[JSON::Field(key: "associatedCoreNetwork")]
        getter associated_core_network : Types::AssociatedCoreNetwork?

        # Information about the associated gateway.

        @[JSON::Field(key: "associatedGateway")]
        getter associated_gateway : Types::AssociatedGateway?

        # The ID of the Direct Connect gateway association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The state of the association. The following are the possible values: associating : The initial state
        # after calling CreateDirectConnectGatewayAssociation . associated : The Direct Connect gateway and
        # virtual private gateway or transit gateway are successfully associated and ready to pass traffic.
        # disassociating : The initial state after calling DeleteDirectConnectGatewayAssociation .
        # disassociated : The virtual private gateway or transit gateway is disassociated from the Direct
        # Connect gateway. Traffic flow between the Direct Connect gateway and virtual private gateway or
        # transit gateway is stopped. updating : The CIDR blocks for the virtual private gateway or transit
        # gateway are currently being updated. This could be new CIDR blocks added or current CIDR blocks
        # removed.

        @[JSON::Field(key: "associationState")]
        getter association_state : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The ID of the Amazon Web Services account that owns the associated gateway.

        @[JSON::Field(key: "directConnectGatewayOwnerAccount")]
        getter direct_connect_gateway_owner_account : String?

        # The error message if the state of an object failed to advance.

        @[JSON::Field(key: "stateChangeError")]
        getter state_change_error : String?

        # The ID of the virtual private gateway. Applies only to private virtual interfaces.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        # The ID of the Amazon Web Services account that owns the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayOwnerAccount")]
        getter virtual_gateway_owner_account : String?

        # The Amazon Web Services Region where the virtual private gateway is located.

        @[JSON::Field(key: "virtualGatewayRegion")]
        getter virtual_gateway_region : String?

        def initialize(
          @allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
          @associated_core_network : Types::AssociatedCoreNetwork? = nil,
          @associated_gateway : Types::AssociatedGateway? = nil,
          @association_id : String? = nil,
          @association_state : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @direct_connect_gateway_owner_account : String? = nil,
          @state_change_error : String? = nil,
          @virtual_gateway_id : String? = nil,
          @virtual_gateway_owner_account : String? = nil,
          @virtual_gateway_region : String? = nil
        )
        end
      end

      # Information about the proposal request to attach a virtual private gateway to a Direct Connect
      # gateway.

      struct DirectConnectGatewayAssociationProposal
        include JSON::Serializable

        # Information about the associated gateway.

        @[JSON::Field(key: "associatedGateway")]
        getter associated_gateway : Types::AssociatedGateway?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The ID of the Amazon Web Services account that owns the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayOwnerAccount")]
        getter direct_connect_gateway_owner_account : String?

        # The existing Amazon VPC prefixes advertised to the Direct Connect gateway.

        @[JSON::Field(key: "existingAllowedPrefixesToDirectConnectGateway")]
        getter existing_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        # The ID of the association proposal.

        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String?

        # The state of the proposal. The following are possible values: accepted : The proposal has been
        # accepted. The Direct Connect gateway association is available to use in this state. deleted : The
        # proposal has been deleted by the owner that made the proposal. The Direct Connect gateway
        # association cannot be used in this state. requested : The proposal has been requested. The Direct
        # Connect gateway association cannot be used in this state.

        @[JSON::Field(key: "proposalState")]
        getter proposal_state : String?

        # The Amazon VPC prefixes to advertise to the Direct Connect gateway.

        @[JSON::Field(key: "requestedAllowedPrefixesToDirectConnectGateway")]
        getter requested_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        def initialize(
          @associated_gateway : Types::AssociatedGateway? = nil,
          @direct_connect_gateway_id : String? = nil,
          @direct_connect_gateway_owner_account : String? = nil,
          @existing_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
          @proposal_id : String? = nil,
          @proposal_state : String? = nil,
          @requested_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
        )
        end
      end

      # Information about an attachment between a Direct Connect gateway and a virtual interface.

      struct DirectConnectGatewayAttachment
        include JSON::Serializable

        # The state of the attachment. The following are the possible values: attaching : The initial state
        # after a virtual interface is created using the Direct Connect gateway. attached : The Direct Connect
        # gateway and virtual interface are attached and ready to pass traffic. detaching : The initial state
        # after calling DeleteVirtualInterface . detached : The virtual interface is detached from the Direct
        # Connect gateway. Traffic flow between the Direct Connect gateway and virtual interface is stopped.

        @[JSON::Field(key: "attachmentState")]
        getter attachment_state : String?

        # The type of attachment.

        @[JSON::Field(key: "attachmentType")]
        getter attachment_type : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # The error message if the state of an object failed to advance.

        @[JSON::Field(key: "stateChangeError")]
        getter state_change_error : String?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        # The ID of the Amazon Web Services account that owns the virtual interface.

        @[JSON::Field(key: "virtualInterfaceOwnerAccount")]
        getter virtual_interface_owner_account : String?

        # The Amazon Web Services Region where the virtual interface is located.

        @[JSON::Field(key: "virtualInterfaceRegion")]
        getter virtual_interface_region : String?

        def initialize(
          @attachment_state : String? = nil,
          @attachment_type : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @state_change_error : String? = nil,
          @virtual_interface_id : String? = nil,
          @virtual_interface_owner_account : String? = nil,
          @virtual_interface_region : String? = nil
        )
        end
      end

      # A server-side error occurred.

      struct DirectConnectServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DisassociateConnectionFromLagRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String

        def initialize(
          @connection_id : String,
          @lag_id : String
        )
        end
      end


      struct DisassociateMacSecKeyRequest
        include JSON::Serializable

        # The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG (dxlag-xxxx). You
        # can use DescribeConnections , DescribeInterconnects , or DescribeLags to retrieve connection ID.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key. You can use
        # DescribeConnections to retrieve the ARN of the MAC Security (MACsec) secret key.

        @[JSON::Field(key: "secretARN")]
        getter secret_arn : String

        def initialize(
          @connection_id : String,
          @secret_arn : String
        )
        end
      end


      struct DisassociateMacSecKeyResponse
        include JSON::Serializable

        # The ID of the dedicated connection (dxcon-xxxx), interconnect (dxcon-xxxx), or LAG (dxlag-xxxx).

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The MAC Security (MACsec) security keys no longer associated with the connection.

        @[JSON::Field(key: "macSecKeys")]
        getter mac_sec_keys : Array(Types::MacSecKey)?

        def initialize(
          @connection_id : String? = nil,
          @mac_sec_keys : Array(Types::MacSecKey)? = nil
        )
        end
      end

      # A tag key was specified more than once.

      struct DuplicateTagKeysException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an interconnect.

      struct Interconnect
        include JSON::Serializable

        # The Direct Connect endpoint on which the physical connection terminates.

        @[JSON::Field(key: "awsDevice")]
        getter aws_device : String?

        # The Direct Connect endpoint that terminates the physical connection.

        @[JSON::Field(key: "awsDeviceV2")]
        getter aws_device_v2 : String?

        # The Direct Connect endpoint that terminates the logical connection. This device might be different
        # than the device that terminates the physical connection.

        @[JSON::Field(key: "awsLogicalDeviceId")]
        getter aws_logical_device_id : String?

        # The bandwidth of the connection.

        @[JSON::Field(key: "bandwidth")]
        getter bandwidth : String?

        # The MAC Security (MACsec) encryption mode. The valid values are no_encrypt , should_encrypt , and
        # must_encrypt .

        @[JSON::Field(key: "encryptionMode")]
        getter encryption_mode : String?

        # Indicates whether the interconnect supports a secondary BGP in the same address family (IPv4/IPv6).

        @[JSON::Field(key: "hasLogicalRedundancy")]
        getter has_logical_redundancy : String?

        # The ID of the interconnect.

        @[JSON::Field(key: "interconnectId")]
        getter interconnect_id : String?

        # The name of the interconnect.

        @[JSON::Field(key: "interconnectName")]
        getter interconnect_name : String?

        # The state of the interconnect. The following are the possible values: requested : The initial state
        # of an interconnect. The interconnect stays in the requested state until the Letter of Authorization
        # (LOA) is sent to the customer. pending : The interconnect is approved, and is being initialized.
        # available : The network link is up, and the interconnect is ready for use. down : The network link
        # is down. deleting : The interconnect is being deleted. deleted : The interconnect is deleted.
        # unknown : The state of the interconnect is not available.

        @[JSON::Field(key: "interconnectState")]
        getter interconnect_state : String?

        # Indicates whether jumbo frames are supported.

        @[JSON::Field(key: "jumboFrameCapable")]
        getter jumbo_frame_capable : Bool?

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The time of the most recent call to DescribeLoa for this connection.

        @[JSON::Field(key: "loaIssueTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter loa_issue_time : Time?

        # The location of the connection.

        @[JSON::Field(key: "location")]
        getter location : String?

        # Indicates whether the interconnect supports MAC Security (MACsec).

        @[JSON::Field(key: "macSecCapable")]
        getter mac_sec_capable : Bool?

        # The MAC Security (MACsec) security keys.

        @[JSON::Field(key: "macSecKeys")]
        getter mac_sec_keys : Array(Types::MacSecKey)?

        # The MAC Security (MACsec) port link status. The valid values are Encryption Up , which means that
        # there is an active Connection Key Name, or Encryption Down .

        @[JSON::Field(key: "portEncryptionStatus")]
        getter port_encryption_status : String?

        # The name of the service provider associated with the interconnect.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # The Amazon Web Services Region where the connection is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The tags associated with the interconnect.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @aws_device : String? = nil,
          @aws_device_v2 : String? = nil,
          @aws_logical_device_id : String? = nil,
          @bandwidth : String? = nil,
          @encryption_mode : String? = nil,
          @has_logical_redundancy : String? = nil,
          @interconnect_id : String? = nil,
          @interconnect_name : String? = nil,
          @interconnect_state : String? = nil,
          @jumbo_frame_capable : Bool? = nil,
          @lag_id : String? = nil,
          @loa_issue_time : Time? = nil,
          @location : String? = nil,
          @mac_sec_capable : Bool? = nil,
          @mac_sec_keys : Array(Types::MacSecKey)? = nil,
          @port_encryption_status : String? = nil,
          @provider_name : String? = nil,
          @region : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct Interconnects
        include JSON::Serializable

        # The interconnects.

        @[JSON::Field(key: "interconnects")]
        getter interconnects : Array(Types::Interconnect)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @interconnects : Array(Types::Interconnect)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about a link aggregation group (LAG).

      struct Lag
        include JSON::Serializable

        # Indicates whether the LAG can host other connections.

        @[JSON::Field(key: "allowsHostedConnections")]
        getter allows_hosted_connections : Bool?

        # The Direct Connect endpoint that hosts the LAG.

        @[JSON::Field(key: "awsDevice")]
        getter aws_device : String?

        # The Direct Connect endpoint that hosts the LAG.

        @[JSON::Field(key: "awsDeviceV2")]
        getter aws_device_v2 : String?

        # The Direct Connect endpoint that terminates the logical connection. This device might be different
        # than the device that terminates the physical connection.

        @[JSON::Field(key: "awsLogicalDeviceId")]
        getter aws_logical_device_id : String?

        # The connections bundled by the LAG.

        @[JSON::Field(key: "connections")]
        getter connections : Array(Types::Connection)?

        # The individual bandwidth of the physical connections bundled by the LAG. The possible values are
        # 1Gbps, 10Gbps, 100Gbps, or 400 Gbps..

        @[JSON::Field(key: "connectionsBandwidth")]
        getter connections_bandwidth : String?

        # The LAG MAC Security (MACsec) encryption mode. The valid values are no_encrypt , should_encrypt ,
        # and must_encrypt .

        @[JSON::Field(key: "encryptionMode")]
        getter encryption_mode : String?

        # Indicates whether the LAG supports a secondary BGP peer in the same address family (IPv4/IPv6).

        @[JSON::Field(key: "hasLogicalRedundancy")]
        getter has_logical_redundancy : String?

        # Indicates whether jumbo frames are supported.

        @[JSON::Field(key: "jumboFrameCapable")]
        getter jumbo_frame_capable : Bool?

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String?

        # The name of the LAG.

        @[JSON::Field(key: "lagName")]
        getter lag_name : String?

        # The state of the LAG. The following are the possible values: requested : The initial state of a LAG.
        # The LAG stays in the requested state until the Letter of Authorization (LOA) is available. pending :
        # The LAG has been approved and is being initialized. available : The network link is established and
        # the LAG is ready for use. down : The network link is down. deleting : The LAG is being deleted.
        # deleted : The LAG is deleted. unknown : The state of the LAG is not available.

        @[JSON::Field(key: "lagState")]
        getter lag_state : String?

        # The location of the LAG.

        @[JSON::Field(key: "location")]
        getter location : String?

        # Indicates whether the LAG supports MAC Security (MACsec).

        @[JSON::Field(key: "macSecCapable")]
        getter mac_sec_capable : Bool?

        # The MAC Security (MACsec) security keys associated with the LAG.

        @[JSON::Field(key: "macSecKeys")]
        getter mac_sec_keys : Array(Types::MacSecKey)?

        # The minimum number of physical dedicated connections that must be operational for the LAG itself to
        # be operational.

        @[JSON::Field(key: "minimumLinks")]
        getter minimum_links : Int32?

        # The number of physical dedicated connections initially provisioned and bundled by the LAG. You can
        # have a maximum of four connections when the port speed is 1 Gbps or 10 Gbps, or two when the port
        # speed is 100 Gbps or 400 Gbps.

        @[JSON::Field(key: "numberOfConnections")]
        getter number_of_connections : Int32?

        # The ID of the Amazon Web Services account that owns the LAG.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The name of the service provider associated with the LAG.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # The Amazon Web Services Region where the connection is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The tags associated with the LAG.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @allows_hosted_connections : Bool? = nil,
          @aws_device : String? = nil,
          @aws_device_v2 : String? = nil,
          @aws_logical_device_id : String? = nil,
          @connections : Array(Types::Connection)? = nil,
          @connections_bandwidth : String? = nil,
          @encryption_mode : String? = nil,
          @has_logical_redundancy : String? = nil,
          @jumbo_frame_capable : Bool? = nil,
          @lag_id : String? = nil,
          @lag_name : String? = nil,
          @lag_state : String? = nil,
          @location : String? = nil,
          @mac_sec_capable : Bool? = nil,
          @mac_sec_keys : Array(Types::MacSecKey)? = nil,
          @minimum_links : Int32? = nil,
          @number_of_connections : Int32? = nil,
          @owner_account : String? = nil,
          @provider_name : String? = nil,
          @region : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct Lags
        include JSON::Serializable

        # The LAGs.

        @[JSON::Field(key: "lags")]
        getter lags : Array(Types::Lag)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lags : Array(Types::Lag)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualInterfaceTestHistoryRequest
        include JSON::Serializable

        # The BGP peers that were placed in the DOWN state during the virtual interface failover test.

        @[JSON::Field(key: "bgpPeers")]
        getter bgp_peers : Array(String)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the virtual interface failover test.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the virtual interface failover test.

        @[JSON::Field(key: "testId")]
        getter test_id : String?

        # The ID of the virtual interface that was tested.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @bgp_peers : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @test_id : String? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end


      struct ListVirtualInterfaceTestHistoryResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the tested virtual interface.

        @[JSON::Field(key: "virtualInterfaceTestHistory")]
        getter virtual_interface_test_history : Array(Types::VirtualInterfaceTestHistory)?

        def initialize(
          @next_token : String? = nil,
          @virtual_interface_test_history : Array(Types::VirtualInterfaceTestHistory)? = nil
        )
        end
      end

      # Information about a Letter of Authorization - Connecting Facility Assignment (LOA-CFA) for a
      # connection.

      struct Loa
        include JSON::Serializable

        # The binary contents of the LOA-CFA document.

        @[JSON::Field(key: "loaContent")]
        getter loa_content : Bytes?

        # The standard media type for the LOA-CFA document. The only supported value is application/pdf.

        @[JSON::Field(key: "loaContentType")]
        getter loa_content_type : String?

        def initialize(
          @loa_content : Bytes? = nil,
          @loa_content_type : String? = nil
        )
        end
      end

      # Information about an Direct Connect location.

      struct Location
        include JSON::Serializable

        # The available MAC Security (MACsec) port speeds for the location.

        @[JSON::Field(key: "availableMacSecPortSpeeds")]
        getter available_mac_sec_port_speeds : Array(String)?

        # The available port speeds for the location.

        @[JSON::Field(key: "availablePortSpeeds")]
        getter available_port_speeds : Array(String)?

        # The name of the service provider for the location.

        @[JSON::Field(key: "availableProviders")]
        getter available_providers : Array(String)?

        # The code for the location.

        @[JSON::Field(key: "locationCode")]
        getter location_code : String?

        # The name of the location. This includes the name of the colocation partner and the physical site of
        # the building.

        @[JSON::Field(key: "locationName")]
        getter location_name : String?

        # The Amazon Web Services Region for the location.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @available_mac_sec_port_speeds : Array(String)? = nil,
          @available_port_speeds : Array(String)? = nil,
          @available_providers : Array(String)? = nil,
          @location_code : String? = nil,
          @location_name : String? = nil,
          @region : String? = nil
        )
        end
      end


      struct Locations
        include JSON::Serializable

        # The locations.

        @[JSON::Field(key: "locations")]
        getter locations : Array(Types::Location)?

        def initialize(
          @locations : Array(Types::Location)? = nil
        )
        end
      end

      # Information about the MAC Security (MACsec) secret key.

      struct MacSecKey
        include JSON::Serializable

        # The Connection Key Name (CKN) for the MAC Security secret key.

        @[JSON::Field(key: "ckn")]
        getter ckn : String?

        # The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.

        @[JSON::Field(key: "secretARN")]
        getter secret_arn : String?

        # The date that the MAC Security (MACsec) secret key takes effect. The value is displayed in UTC
        # format.

        @[JSON::Field(key: "startOn")]
        getter start_on : String?

        # The state of the MAC Security (MACsec) secret key. The possible values are: associating : The MAC
        # Security (MACsec) secret key is being validated and not yet associated with the connection or LAG.
        # associated : The MAC Security (MACsec) secret key is validated and associated with the connection or
        # LAG. disassociating : The MAC Security (MACsec) secret key is being disassociated from the
        # connection or LAG disassociated : The MAC Security (MACsec) secret key is no longer associated with
        # the connection or LAG.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @ckn : String? = nil,
          @secret_arn : String? = nil,
          @start_on : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Information about a new BGP peer.

      struct NewBGPPeer
        include JSON::Serializable

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead.

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for a new BGP peer. The valid range is from 1 to 4294967294.

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        def initialize(
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil
        )
        end
      end

      # Information about a private virtual interface.

      struct NewPrivateVirtualInterface
        include JSON::Serializable

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong . The valid values are 1-2147483646.

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for a new private virtual interface. The valid range is from 1 to 4294967294 for BGP
        # configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it supports
        # a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If you
        # provide a value in the same API call for both asn and asnLong , the API will only accept the value
        # for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # Indicates whether to enable or disable SiteLink.

        @[JSON::Field(key: "enableSiteLink")]
        getter enable_site_link : Bool?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The tags associated with the private virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The ID of the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        def initialize(
          @virtual_interface_name : String,
          @vlan : Int32,
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @enable_site_link : Bool? = nil,
          @mtu : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @virtual_gateway_id : String? = nil
        )
        end
      end

      # Information about a private virtual interface to be provisioned on a connection.

      struct NewPrivateVirtualInterfaceAllocation
        include JSON::Serializable

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong . The valid values are 1-2147483646.

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The ASN when allocating a new private virtual interface. The valid range is from 1 to 4294967294 for
        # BGP configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it
        # supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If
        # you provide a value in the same API call for both asn and asnLong , the API will only accept the
        # value for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The tags associated with the private virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @virtual_interface_name : String,
          @vlan : Int32,
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @mtu : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a public virtual interface.

      struct NewPublicVirtualInterface
        include JSON::Serializable

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong .

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for a new public virtual interface. The valid range is from 1 to 4294967294 for BGP
        # configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it supports
        # a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If you
        # provide a value in the same API call for both asn and asnLong , the API will only accept the value
        # for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The routes to be advertised to the Amazon Web Services network in this Region. Applies to public
        # virtual interfaces.

        @[JSON::Field(key: "routeFilterPrefixes")]
        getter route_filter_prefixes : Array(Types::RouteFilterPrefix)?

        # The tags associated with the public virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @virtual_interface_name : String,
          @vlan : Int32,
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @route_filter_prefixes : Array(Types::RouteFilterPrefix)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a public virtual interface to be provisioned on a connection.

      struct NewPublicVirtualInterfaceAllocation
        include JSON::Serializable

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong . The valid values are 1-2147483646.

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The ASN when allocating a new public virtual interface. The valid range is from 1 to 4294967294 for
        # BGP configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it
        # supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If
        # you provide a value in the same API call for both asn and asnLong , the API will only accept the
        # value for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The routes to be advertised to the Amazon Web Services network in this Region. Applies to public
        # virtual interfaces.

        @[JSON::Field(key: "routeFilterPrefixes")]
        getter route_filter_prefixes : Array(Types::RouteFilterPrefix)?

        # The tags associated with the public virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @virtual_interface_name : String,
          @vlan : Int32,
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @route_filter_prefixes : Array(Types::RouteFilterPrefix)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a transit virtual interface.

      struct NewTransitVirtualInterface
        include JSON::Serializable

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong .

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for a new transit virtual interface.The valid range is from 1 to 4294967294 for BGP
        # configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it supports
        # a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If you
        # provide a value in the same API call for both asn and asnLong , the API will only accept the value
        # for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # Indicates whether to enable or disable SiteLink.

        @[JSON::Field(key: "enableSiteLink")]
        getter enable_site_link : Bool?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The tags associated with the transitive virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String?

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32?

        def initialize(
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @enable_site_link : Bool? = nil,
          @mtu : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @virtual_interface_name : String? = nil,
          @vlan : Int32? = nil
        )
        end
      end

      # Information about a transit virtual interface to be provisioned on a connection.

      struct NewTransitVirtualInterfaceAllocation
        include JSON::Serializable

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong . The valid values are 1-2147483646.

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The ASN when allocating a new transit virtual interface. The valid range is from 1 to 4294967294 for
        # BGP configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it
        # supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If
        # you provide a value in the same API call for both asn and asnLong , the API will only accept the
        # value for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The tags associated with the transitive virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String?

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32?

        def initialize(
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @customer_address : String? = nil,
          @mtu : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @virtual_interface_name : String? = nil,
          @vlan : Int32? = nil
        )
        end
      end

      # Information about a tag associated with an Direct Connect resource.

      struct ResourceTag
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a route filter prefix that a customer can advertise through Border Gateway
      # Protocol (BGP) over a public virtual interface.

      struct RouteFilterPrefix
        include JSON::Serializable

        # The CIDR block for the advertised route. Separate multiple routes using commas. An IPv6 CIDR must
        # use /64 or shorter.

        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        def initialize(
          @cidr : String? = nil
        )
        end
      end

      # Information about the virtual router.

      struct RouterType
        include JSON::Serializable

        # The virtual interface router platform.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # Identifies the router by a combination of vendor, platform, and software version. For example,
        # CiscoSystemsInc-2900SeriesRouters-IOS124 .

        @[JSON::Field(key: "routerTypeIdentifier")]
        getter router_type_identifier : String?

        # The router software.

        @[JSON::Field(key: "software")]
        getter software : String?

        # The vendor for the virtual interface's router.

        @[JSON::Field(key: "vendor")]
        getter vendor : String?

        # The template for the virtual interface's router.

        @[JSON::Field(key: "xsltTemplateName")]
        getter xslt_template_name : String?

        # The MAC Security (MACsec) template for the virtual interface's router.

        @[JSON::Field(key: "xsltTemplateNameForMacSec")]
        getter xslt_template_name_for_mac_sec : String?

        def initialize(
          @platform : String? = nil,
          @router_type_identifier : String? = nil,
          @software : String? = nil,
          @vendor : String? = nil,
          @xslt_template_name : String? = nil,
          @xslt_template_name_for_mac_sec : String? = nil
        )
        end
      end


      struct StartBgpFailoverTestRequest
        include JSON::Serializable

        # The ID of the virtual interface you want to test.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        # The BGP peers to place in the DOWN state.

        @[JSON::Field(key: "bgpPeers")]
        getter bgp_peers : Array(String)?

        # The time in minutes that the virtual interface failover test will last. Maximum value: 4,320 minutes
        # (72 hours). Default: 180 minutes (3 hours).

        @[JSON::Field(key: "testDurationInMinutes")]
        getter test_duration_in_minutes : Int32?

        def initialize(
          @virtual_interface_id : String,
          @bgp_peers : Array(String)? = nil,
          @test_duration_in_minutes : Int32? = nil
        )
        end
      end


      struct StartBgpFailoverTestResponse
        include JSON::Serializable

        # Information about the virtual interface failover test.

        @[JSON::Field(key: "virtualInterfaceTest")]
        getter virtual_interface_test : Types::VirtualInterfaceTestHistory?

        def initialize(
          @virtual_interface_test : Types::VirtualInterfaceTestHistory? = nil
        )
        end
      end


      struct StopBgpFailoverTestRequest
        include JSON::Serializable

        # The ID of the virtual interface you no longer want to test.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        def initialize(
          @virtual_interface_id : String
        )
        end
      end


      struct StopBgpFailoverTestResponse
        include JSON::Serializable

        # Information about the virtual interface failover test.

        @[JSON::Field(key: "virtualInterfaceTest")]
        getter virtual_interface_test : Types::VirtualInterfaceTestHistory?

        def initialize(
          @virtual_interface_test : Types::VirtualInterfaceTestHistory? = nil
        )
        end
      end

      # Information about a tag.

      struct Tag
        include JSON::Serializable

        # The key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the limit on the number of tags that can be assigned.

      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys of the tags to remove.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateConnectionRequest
        include JSON::Serializable

        # The ID of the connection. You can use DescribeConnections to retrieve the connection ID.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The name of the connection.

        @[JSON::Field(key: "connectionName")]
        getter connection_name : String?

        # The connection MAC Security (MACsec) encryption mode. The valid values are no_encrypt ,
        # should_encrypt , and must_encrypt .

        @[JSON::Field(key: "encryptionMode")]
        getter encryption_mode : String?

        def initialize(
          @connection_id : String,
          @connection_name : String? = nil,
          @encryption_mode : String? = nil
        )
        end
      end


      struct UpdateDirectConnectGatewayAssociationRequest
        include JSON::Serializable

        # The Amazon VPC prefixes to advertise to the Direct Connect gateway.

        @[JSON::Field(key: "addAllowedPrefixesToDirectConnectGateway")]
        getter add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        # The ID of the Direct Connect gateway association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.

        @[JSON::Field(key: "removeAllowedPrefixesToDirectConnectGateway")]
        getter remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)?

        def initialize(
          @add_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil,
          @association_id : String? = nil,
          @remove_allowed_prefixes_to_direct_connect_gateway : Array(Types::RouteFilterPrefix)? = nil
        )
        end
      end


      struct UpdateDirectConnectGatewayAssociationResult
        include JSON::Serializable

        # Information about an association between a Direct Connect gateway and a virtual private gateway or
        # transit gateway.

        @[JSON::Field(key: "directConnectGatewayAssociation")]
        getter direct_connect_gateway_association : Types::DirectConnectGatewayAssociation?

        def initialize(
          @direct_connect_gateway_association : Types::DirectConnectGatewayAssociation? = nil
        )
        end
      end


      struct UpdateDirectConnectGatewayRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway to update.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String

        # The new name for the Direct Connect gateway.

        @[JSON::Field(key: "newDirectConnectGatewayName")]
        getter new_direct_connect_gateway_name : String

        def initialize(
          @direct_connect_gateway_id : String,
          @new_direct_connect_gateway_name : String
        )
        end
      end


      struct UpdateDirectConnectGatewayResponse
        include JSON::Serializable

        # Informaiton about a Direct Connect gateway, which enables you to connect virtual interfaces and
        # virtual private gateways or transit gateways.

        @[JSON::Field(key: "directConnectGateway")]
        getter direct_connect_gateway : Types::DirectConnectGateway?

        def initialize(
          @direct_connect_gateway : Types::DirectConnectGateway? = nil
        )
        end
      end


      struct UpdateLagRequest
        include JSON::Serializable

        # The ID of the LAG.

        @[JSON::Field(key: "lagId")]
        getter lag_id : String

        # The LAG MAC Security (MACsec) encryption mode. Amazon Web Services applies the value to all
        # connections which are part of the LAG.

        @[JSON::Field(key: "encryptionMode")]
        getter encryption_mode : String?

        # The name of the LAG.

        @[JSON::Field(key: "lagName")]
        getter lag_name : String?

        # The minimum number of physical connections that must be operational for the LAG itself to be
        # operational.

        @[JSON::Field(key: "minimumLinks")]
        getter minimum_links : Int32?

        def initialize(
          @lag_id : String,
          @encryption_mode : String? = nil,
          @lag_name : String? = nil,
          @minimum_links : Int32? = nil
        )
        end
      end


      struct UpdateVirtualInterfaceAttributesRequest
        include JSON::Serializable

        # The ID of the virtual private interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String

        # Indicates whether to enable or disable SiteLink.

        @[JSON::Field(key: "enableSiteLink")]
        getter enable_site_link : Bool?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500.

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The name of the virtual private interface.

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String?

        def initialize(
          @virtual_interface_id : String,
          @enable_site_link : Bool? = nil,
          @mtu : Int32? = nil,
          @virtual_interface_name : String? = nil
        )
        end
      end

      # Information about a virtual private gateway for a private virtual interface.

      struct VirtualGateway
        include JSON::Serializable

        # The ID of the virtual private gateway.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        # The state of the virtual private gateway. The following are the possible values: pending : Initial
        # state after creating the virtual private gateway. available : Ready for use by a private virtual
        # interface. deleting : Initial state after deleting the virtual private gateway. deleted : The
        # virtual private gateway is deleted. The private virtual interface is unable to send traffic over
        # this gateway.

        @[JSON::Field(key: "virtualGatewayState")]
        getter virtual_gateway_state : String?

        def initialize(
          @virtual_gateway_id : String? = nil,
          @virtual_gateway_state : String? = nil
        )
        end
      end


      struct VirtualGateways
        include JSON::Serializable

        # The virtual private gateways.

        @[JSON::Field(key: "virtualGateways")]
        getter virtual_gateways : Array(Types::VirtualGateway)?

        def initialize(
          @virtual_gateways : Array(Types::VirtualGateway)? = nil
        )
        end
      end

      # Information about a virtual interface.

      struct VirtualInterface
        include JSON::Serializable

        # The address family for the BGP peer.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The IP address assigned to the Amazon interface.

        @[JSON::Field(key: "amazonAddress")]
        getter amazon_address : String?

        # The autonomous system number (AS) for the Amazon side of the connection.

        @[JSON::Field(key: "amazonSideAsn")]
        getter amazon_side_asn : Int64?

        # The autonomous system number (ASN). The valid range is from 1 to 2147483646 for Border Gateway
        # Protocol (BGP) configuration. If you provide a number greater than the maximum, an error is
        # returned. Use asnLong instead. You can use asnLong or asn , but not both. We recommend using asnLong
        # as it supports a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN
        # ranges. If you provide a value in the same API call for both asn and asnLong , the API will only
        # accept the value for asnLong .

        @[JSON::Field(key: "asn")]
        getter asn : Int32?

        # The long ASN for the virtual interface. The valid range is from 1 to 4294967294 for BGP
        # configuration. You can use asnLong or asn , but not both. We recommend using asnLong as it supports
        # a greater pool of numbers. The asnLong attribute accepts both ASN and long ASN ranges. If you
        # provide a value in the same API call for both asn and asnLong , the API will only accept the value
        # for asnLong .

        @[JSON::Field(key: "asnLong")]
        getter asn_long : Int64?

        # The authentication key for BGP configuration. This string has a minimum length of 6 characters and
        # and a maximun lenth of 80 characters.

        @[JSON::Field(key: "authKey")]
        getter auth_key : String?

        # The Direct Connect endpoint that terminates the physical connection.

        @[JSON::Field(key: "awsDeviceV2")]
        getter aws_device_v2 : String?

        # The Direct Connect endpoint that terminates the logical connection. This device might be different
        # than the device that terminates the physical connection.

        @[JSON::Field(key: "awsLogicalDeviceId")]
        getter aws_logical_device_id : String?

        # The BGP peers configured on this virtual interface.

        @[JSON::Field(key: "bgpPeers")]
        getter bgp_peers : Array(Types::BGPPeer)?

        # The ID of the connection.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The IP address assigned to the customer interface.

        @[JSON::Field(key: "customerAddress")]
        getter customer_address : String?

        # The customer router configuration.

        @[JSON::Field(key: "customerRouterConfig")]
        getter customer_router_config : String?

        # The ID of the Direct Connect gateway.

        @[JSON::Field(key: "directConnectGatewayId")]
        getter direct_connect_gateway_id : String?

        # Indicates whether jumbo frames are supported.

        @[JSON::Field(key: "jumboFrameCapable")]
        getter jumbo_frame_capable : Bool?

        # The location of the connection.

        @[JSON::Field(key: "location")]
        getter location : String?

        # The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 8500. The default
        # value is 1500

        @[JSON::Field(key: "mtu")]
        getter mtu : Int32?

        # The ID of the Amazon Web Services account that owns the virtual interface.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The Amazon Web Services Region where the virtual interface is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The routes to be advertised to the Amazon Web Services network in this Region. Applies to public
        # virtual interfaces.

        @[JSON::Field(key: "routeFilterPrefixes")]
        getter route_filter_prefixes : Array(Types::RouteFilterPrefix)?

        # Indicates whether SiteLink is enabled.

        @[JSON::Field(key: "siteLinkEnabled")]
        getter site_link_enabled : Bool?

        # The tags associated with the virtual interface.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The ID of the virtual private gateway. Applies only to private virtual interfaces.

        @[JSON::Field(key: "virtualGatewayId")]
        getter virtual_gateway_id : String?

        # The ID of the virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        # The name of the virtual interface assigned by the customer network. The name has a maximum of 100
        # characters. The following are valid characters: a-z, 0-9 and a hyphen (-).

        @[JSON::Field(key: "virtualInterfaceName")]
        getter virtual_interface_name : String?

        # The state of the virtual interface. The following are the possible values: confirming : The creation
        # of the virtual interface is pending confirmation from the virtual interface owner. If the owner of
        # the virtual interface is different from the owner of the connection on which it is provisioned, then
        # the virtual interface will remain in this state until it is confirmed by the virtual interface
        # owner. verifying : This state only applies to public virtual interfaces. Each public virtual
        # interface needs validation before the virtual interface can be created. pending : A virtual
        # interface is in this state from the time that it is created until the virtual interface is ready to
        # forward traffic. available : A virtual interface that is able to forward traffic. down : A virtual
        # interface that is BGP down. testing : A virtual interface is in this state immediately after calling
        # StartBgpFailoverTest and remains in this state during the duration of the test. deleting : A virtual
        # interface is in this state immediately after calling DeleteVirtualInterface until it can no longer
        # forward traffic. deleted : A virtual interface that cannot forward traffic. rejected : The virtual
        # interface owner has declined creation of the virtual interface. If a virtual interface in the
        # Confirming state is deleted by the virtual interface owner, the virtual interface enters the
        # Rejected state. unknown : The state of the virtual interface is not available.

        @[JSON::Field(key: "virtualInterfaceState")]
        getter virtual_interface_state : String?

        # The type of virtual interface. The possible values are private , public and transit .

        @[JSON::Field(key: "virtualInterfaceType")]
        getter virtual_interface_type : String?

        # The ID of the VLAN.

        @[JSON::Field(key: "vlan")]
        getter vlan : Int32?

        def initialize(
          @address_family : String? = nil,
          @amazon_address : String? = nil,
          @amazon_side_asn : Int64? = nil,
          @asn : Int32? = nil,
          @asn_long : Int64? = nil,
          @auth_key : String? = nil,
          @aws_device_v2 : String? = nil,
          @aws_logical_device_id : String? = nil,
          @bgp_peers : Array(Types::BGPPeer)? = nil,
          @connection_id : String? = nil,
          @customer_address : String? = nil,
          @customer_router_config : String? = nil,
          @direct_connect_gateway_id : String? = nil,
          @jumbo_frame_capable : Bool? = nil,
          @location : String? = nil,
          @mtu : Int32? = nil,
          @owner_account : String? = nil,
          @region : String? = nil,
          @route_filter_prefixes : Array(Types::RouteFilterPrefix)? = nil,
          @site_link_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @virtual_gateway_id : String? = nil,
          @virtual_interface_id : String? = nil,
          @virtual_interface_name : String? = nil,
          @virtual_interface_state : String? = nil,
          @virtual_interface_type : String? = nil,
          @vlan : Int32? = nil
        )
        end
      end

      # Information about the virtual interface failover test.

      struct VirtualInterfaceTestHistory
        include JSON::Serializable

        # The BGP peers that were put in the DOWN state as part of the virtual interface failover test.

        @[JSON::Field(key: "bgpPeers")]
        getter bgp_peers : Array(String)?

        # The time that the virtual interface moves out of the DOWN state.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The owner ID of the tested virtual interface.

        @[JSON::Field(key: "ownerAccount")]
        getter owner_account : String?

        # The time that the virtual interface moves to the DOWN state.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the virtual interface failover test.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The time that the virtual interface failover test ran in minutes.

        @[JSON::Field(key: "testDurationInMinutes")]
        getter test_duration_in_minutes : Int32?

        # The ID of the virtual interface failover test.

        @[JSON::Field(key: "testId")]
        getter test_id : String?

        # The ID of the tested virtual interface.

        @[JSON::Field(key: "virtualInterfaceId")]
        getter virtual_interface_id : String?

        def initialize(
          @bgp_peers : Array(String)? = nil,
          @end_time : Time? = nil,
          @owner_account : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @test_duration_in_minutes : Int32? = nil,
          @test_id : String? = nil,
          @virtual_interface_id : String? = nil
        )
        end
      end


      struct VirtualInterfaces
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The virtual interfaces

        @[JSON::Field(key: "virtualInterfaces")]
        getter virtual_interfaces : Array(Types::VirtualInterface)?

        def initialize(
          @next_token : String? = nil,
          @virtual_interfaces : Array(Types::VirtualInterface)? = nil
        )
        end
      end
    end
  end
end
