require "json"
require "time"

module AwsSdk
  module NetworkManager
    module Types

      # Specifies a location in Amazon Web Services.
      struct AWSLocation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the subnet that the device is located in.
        @[JSON::Field(key: "SubnetArn")]
        getter subnet_arn : String?

        # The Zone that the device is located in. Specify the ID of an Availability Zone, Local Zone,
        # Wavelength Zone, or an Outpost.
        @[JSON::Field(key: "Zone")]
        getter zone : String?

        def initialize(
          @subnet_arn : String? = nil,
          @zone : String? = nil
        )
        end
      end

      struct AcceptAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct AcceptAttachmentResponse
        include JSON::Serializable

        # The response to the attachment request.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        def initialize(
          @attachment : Types::Attachment? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the current status of an account within an Amazon Web Services Organization, including
      # service-linked roles (SLRs).
      struct AccountStatus
        include JSON::Serializable

        # The ID of an account within the Amazon Web Services Organization.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The status of SLR deployment for the account.
        @[JSON::Field(key: "SLRDeploymentStatus")]
        getter slr_deployment_status : String?

        def initialize(
          @account_id : String? = nil,
          @slr_deployment_status : String? = nil
        )
        end
      end

      struct AssociateConnectPeerRequest
        include JSON::Serializable

        # The ID of the Connect peer.
        @[JSON::Field(key: "ConnectPeerId")]
        getter connect_peer_id : String

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The ID of your global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        def initialize(
          @connect_peer_id : String,
          @device_id : String,
          @global_network_id : String,
          @link_id : String? = nil
        )
        end
      end

      struct AssociateConnectPeerResponse
        include JSON::Serializable

        # The response to the Connect peer request.
        @[JSON::Field(key: "ConnectPeerAssociation")]
        getter connect_peer_association : Types::ConnectPeerAssociation?

        def initialize(
          @connect_peer_association : Types::ConnectPeerAssociation? = nil
        )
        end
      end

      struct AssociateCustomerGatewayRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer gateway.
        @[JSON::Field(key: "CustomerGatewayArn")]
        getter customer_gateway_arn : String

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        def initialize(
          @customer_gateway_arn : String,
          @device_id : String,
          @global_network_id : String,
          @link_id : String? = nil
        )
        end
      end

      struct AssociateCustomerGatewayResponse
        include JSON::Serializable

        # The customer gateway association.
        @[JSON::Field(key: "CustomerGatewayAssociation")]
        getter customer_gateway_association : Types::CustomerGatewayAssociation?

        def initialize(
          @customer_gateway_association : Types::CustomerGatewayAssociation? = nil
        )
        end
      end

      struct AssociateLinkRequest
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String

        def initialize(
          @device_id : String,
          @global_network_id : String,
          @link_id : String
        )
        end
      end

      struct AssociateLinkResponse
        include JSON::Serializable

        # The link association.
        @[JSON::Field(key: "LinkAssociation")]
        getter link_association : Types::LinkAssociation?

        def initialize(
          @link_association : Types::LinkAssociation? = nil
        )
        end
      end

      struct AssociateTransitGatewayConnectPeerRequest
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Resource Name (ARN) of the Connect peer.
        @[JSON::Field(key: "TransitGatewayConnectPeerArn")]
        getter transit_gateway_connect_peer_arn : String

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        def initialize(
          @device_id : String,
          @global_network_id : String,
          @transit_gateway_connect_peer_arn : String,
          @link_id : String? = nil
        )
        end
      end

      struct AssociateTransitGatewayConnectPeerResponse
        include JSON::Serializable

        # The transit gateway Connect peer association.
        @[JSON::Field(key: "TransitGatewayConnectPeerAssociation")]
        getter transit_gateway_connect_peer_association : Types::TransitGatewayConnectPeerAssociation?

        def initialize(
          @transit_gateway_connect_peer_association : Types::TransitGatewayConnectPeerAssociation? = nil
        )
        end
      end

      # Describes a core network attachment.
      struct Attachment
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The policy rule number associated with the attachment.
        @[JSON::Field(key: "AttachmentPolicyRuleNumber")]
        getter attachment_policy_rule_number : Int32?

        # The type of attachment.
        @[JSON::Field(key: "AttachmentType")]
        getter attachment_type : String?

        # The ARN of a core network.
        @[JSON::Field(key: "CoreNetworkArn")]
        getter core_network_arn : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when the attachment was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Region where the edge is located. This is returned for all attachment types except a Direct
        # Connect gateway attachment, which instead returns EdgeLocations .
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The edge locations that the Direct Connect gateway is associated with. This is returned only for
        # Direct Connect gateway attachments. All other attachment types retrun EdgeLocation .
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)?

        # Describes the error associated with the attachment request.
        @[JSON::Field(key: "LastModificationErrors")]
        getter last_modification_errors : Array(Types::AttachmentError)?

        # The name of the network function group.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        # The ID of the attachment account owner.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Describes a proposed change to a network function group associated with the attachment.
        @[JSON::Field(key: "ProposedNetworkFunctionGroupChange")]
        getter proposed_network_function_group_change : Types::ProposedNetworkFunctionGroupChange?

        # The attachment to move from one segment to another.
        @[JSON::Field(key: "ProposedSegmentChange")]
        getter proposed_segment_change : Types::ProposedSegmentChange?

        # The attachment resource ARN.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The name of the segment attachment.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        # The state of the attachment.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags associated with the attachment.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The timestamp when the attachment was last updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @attachment_id : String? = nil,
          @attachment_policy_rule_number : Int32? = nil,
          @attachment_type : String? = nil,
          @core_network_arn : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @edge_location : String? = nil,
          @edge_locations : Array(String)? = nil,
          @last_modification_errors : Array(Types::AttachmentError)? = nil,
          @network_function_group_name : String? = nil,
          @owner_account_id : String? = nil,
          @proposed_network_function_group_change : Types::ProposedNetworkFunctionGroupChange? = nil,
          @proposed_segment_change : Types::ProposedSegmentChange? = nil,
          @resource_arn : String? = nil,
          @segment_name : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Describes the error associated with an attachment request.
      struct AttachmentError
        include JSON::Serializable

        # The error code for the attachment request.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message associated with the error code .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the attachment request.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The ARN of the requested attachment resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Summary information about routing policy associations for an attachment.
      struct AttachmentRoutingPolicyAssociationSummary
        include JSON::Serializable

        # The list of routing policies currently associated with the attachment.
        @[JSON::Field(key: "AssociatedRoutingPolicies")]
        getter associated_routing_policies : Array(String)?

        # The ID of the attachment associated with the routing policy.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The list of routing policies that are pending association with the attachment.
        @[JSON::Field(key: "PendingRoutingPolicies")]
        getter pending_routing_policies : Array(String)?

        # The routing policy label associated with the attachment.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        def initialize(
          @associated_routing_policies : Array(String)? = nil,
          @attachment_id : String? = nil,
          @pending_routing_policies : Array(String)? = nil,
          @routing_policy_label : String? = nil
        )
        end
      end

      # Describes bandwidth information.
      struct Bandwidth
        include JSON::Serializable

        # Download speed in Mbps.
        @[JSON::Field(key: "DownloadSpeed")]
        getter download_speed : Int32?

        # Upload speed in Mbps.
        @[JSON::Field(key: "UploadSpeed")]
        getter upload_speed : Int32?

        def initialize(
          @download_speed : Int32? = nil,
          @upload_speed : Int32? = nil
        )
        end
      end

      # Describes the BGP options.
      struct BgpOptions
        include JSON::Serializable

        # The Peer ASN of the BGP.
        @[JSON::Field(key: "PeerAsn")]
        getter peer_asn : Int64?

        def initialize(
          @peer_asn : Int64? = nil
        )
        end
      end

      # There was a conflict processing the request. Updating or deleting the resource can cause an
      # inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Describes a core network Connect attachment.
      struct ConnectAttachment
        include JSON::Serializable

        # The attachment details.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # Options for connecting an attachment.
        @[JSON::Field(key: "Options")]
        getter options : Types::ConnectAttachmentOptions?

        # The ID of the transport attachment.
        @[JSON::Field(key: "TransportAttachmentId")]
        getter transport_attachment_id : String?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @options : Types::ConnectAttachmentOptions? = nil,
          @transport_attachment_id : String? = nil
        )
        end
      end

      # Describes a core network Connect attachment options.
      struct ConnectAttachmentOptions
        include JSON::Serializable

        # The protocol used for the attachment connection.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @protocol : String? = nil
        )
        end
      end

      # Describes a core network Connect peer.
      struct ConnectPeer
        include JSON::Serializable

        # The configuration of the Connect peer.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ConnectPeerConfiguration?

        # The ID of the attachment to connect.
        @[JSON::Field(key: "ConnectAttachmentId")]
        getter connect_attachment_id : String?

        # The ID of the Connect peer.
        @[JSON::Field(key: "ConnectPeerId")]
        getter connect_peer_id : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when the Connect peer was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Connect peer Regions where edges are located.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # Describes the error associated with the attachment request.
        @[JSON::Field(key: "LastModificationErrors")]
        getter last_modification_errors : Array(Types::ConnectPeerError)?

        # The state of the Connect peer.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The subnet ARN for the Connect peer. This only applies only when the protocol is NO_ENCAP.
        @[JSON::Field(key: "SubnetArn")]
        getter subnet_arn : String?

        # The list of key-value tags associated with the Connect peer.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration : Types::ConnectPeerConfiguration? = nil,
          @connect_attachment_id : String? = nil,
          @connect_peer_id : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @edge_location : String? = nil,
          @last_modification_errors : Array(Types::ConnectPeerError)? = nil,
          @state : String? = nil,
          @subnet_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a core network Connect peer association.
      struct ConnectPeerAssociation
        include JSON::Serializable

        # The ID of the Connect peer.
        @[JSON::Field(key: "ConnectPeerId")]
        getter connect_peer_id : String?

        # The ID of the device to connect to.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The state of the Connect peer association.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @connect_peer_id : String? = nil,
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @link_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes a core network BGP configuration.
      struct ConnectPeerBgpConfiguration
        include JSON::Serializable

        # The address of a core network.
        @[JSON::Field(key: "CoreNetworkAddress")]
        getter core_network_address : String?

        # The ASN of the Coret Network.
        @[JSON::Field(key: "CoreNetworkAsn")]
        getter core_network_asn : Int64?

        # The address of a core network Connect peer.
        @[JSON::Field(key: "PeerAddress")]
        getter peer_address : String?

        # The ASN of the Connect peer.
        @[JSON::Field(key: "PeerAsn")]
        getter peer_asn : Int64?

        def initialize(
          @core_network_address : String? = nil,
          @core_network_asn : Int64? = nil,
          @peer_address : String? = nil,
          @peer_asn : Int64? = nil
        )
        end
      end

      # Describes a core network Connect peer configuration.
      struct ConnectPeerConfiguration
        include JSON::Serializable

        # The Connect peer BGP configurations.
        @[JSON::Field(key: "BgpConfigurations")]
        getter bgp_configurations : Array(Types::ConnectPeerBgpConfiguration)?

        # The IP address of a core network.
        @[JSON::Field(key: "CoreNetworkAddress")]
        getter core_network_address : String?

        # The inside IP addresses used for a Connect peer configuration.
        @[JSON::Field(key: "InsideCidrBlocks")]
        getter inside_cidr_blocks : Array(String)?

        # The IP address of the Connect peer.
        @[JSON::Field(key: "PeerAddress")]
        getter peer_address : String?

        # The protocol used for a Connect peer configuration.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @bgp_configurations : Array(Types::ConnectPeerBgpConfiguration)? = nil,
          @core_network_address : String? = nil,
          @inside_cidr_blocks : Array(String)? = nil,
          @peer_address : String? = nil,
          @protocol : String? = nil
        )
        end
      end

      # Describes an error associated with a Connect peer request
      struct ConnectPeerError
        include JSON::Serializable

        # The error code for the Connect peer request.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message associated with the error code .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the Connect peer request.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The ARN of the requested Connect peer resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Summary description of a Connect peer.
      struct ConnectPeerSummary
        include JSON::Serializable

        # The ID of a Connect peer attachment.
        @[JSON::Field(key: "ConnectAttachmentId")]
        getter connect_attachment_id : String?

        # The ID of a Connect peer.
        @[JSON::Field(key: "ConnectPeerId")]
        getter connect_peer_id : String?

        # The state of a Connect peer.
        @[JSON::Field(key: "ConnectPeerState")]
        getter connect_peer_state : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when a Connect peer was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Region where the edge is located.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The subnet ARN for the Connect peer summary.
        @[JSON::Field(key: "SubnetArn")]
        getter subnet_arn : String?

        # The list of key-value tags associated with the Connect peer summary.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connect_attachment_id : String? = nil,
          @connect_peer_id : String? = nil,
          @connect_peer_state : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @edge_location : String? = nil,
          @subnet_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a connection.
      struct Connection
        include JSON::Serializable

        # The ID of the second device in the connection.
        @[JSON::Field(key: "ConnectedDeviceId")]
        getter connected_device_id : String?

        # The ID of the link for the second device in the connection.
        @[JSON::Field(key: "ConnectedLinkId")]
        getter connected_link_id : String?

        # The Amazon Resource Name (ARN) of the connection.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The ID of the connection.
        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The date and time that the connection was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the connection.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the first device in the connection.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The ID of the link for the first device in the connection.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The state of the connection.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags for the connection.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connected_device_id : String? = nil,
          @connected_link_id : String? = nil,
          @connection_arn : String? = nil,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @link_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes connection health.
      struct ConnectionHealth
        include JSON::Serializable

        # The connection status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time the status was last updated.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # The connection type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @status : String? = nil,
          @timestamp : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes a core network.
      struct CoreNetwork
        include JSON::Serializable

        # The ARN of a core network.
        @[JSON::Field(key: "CoreNetworkArn")]
        getter core_network_arn : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when a core network was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of a core network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The edges within a core network.
        @[JSON::Field(key: "Edges")]
        getter edges : Array(Types::CoreNetworkEdge)?

        # The ID of the global network that your core network is a part of.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The network function groups associated with a core network.
        @[JSON::Field(key: "NetworkFunctionGroups")]
        getter network_function_groups : Array(Types::CoreNetworkNetworkFunctionGroup)?

        # The segments within a core network.
        @[JSON::Field(key: "Segments")]
        getter segments : Array(Types::CoreNetworkSegment)?

        # The current state of a core network.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The list of key-value tags associated with a core network.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_arn : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @edges : Array(Types::CoreNetworkEdge)? = nil,
          @global_network_id : String? = nil,
          @network_function_groups : Array(Types::CoreNetworkNetworkFunctionGroup)? = nil,
          @segments : Array(Types::CoreNetworkSegment)? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Details describing a core network change.
      struct CoreNetworkChange
        include JSON::Serializable

        # The action to take for a core network.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # The resource identifier.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Uniquely identifies the path for a change within the changeset. For example, the IdentifierPath for
        # a core network segment change might be "CORE_NETWORK_SEGMENT/us-east-1/devsegment" .
        @[JSON::Field(key: "IdentifierPath")]
        getter identifier_path : String?

        # The new value for a core network
        @[JSON::Field(key: "NewValues")]
        getter new_values : Types::CoreNetworkChangeValues?

        # The previous values for a core network.
        @[JSON::Field(key: "PreviousValues")]
        getter previous_values : Types::CoreNetworkChangeValues?

        # The type of change.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @action : String? = nil,
          @identifier : String? = nil,
          @identifier_path : String? = nil,
          @new_values : Types::CoreNetworkChangeValues? = nil,
          @previous_values : Types::CoreNetworkChangeValues? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes a core network change event. This can be a change to a segment, attachment, route, etc.
      struct CoreNetworkChangeEvent
        include JSON::Serializable

        # The action taken for the change event.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # The timestamp for an event change in status.
        @[JSON::Field(key: "EventTime")]
        getter event_time : Time?

        # Uniquely identifies the path for a change within the changeset. For example, the IdentifierPath for
        # a core network segment change might be "CORE_NETWORK_SEGMENT/us-east-1/devsegment" .
        @[JSON::Field(key: "IdentifierPath")]
        getter identifier_path : String?

        # The status of the core network change event.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Describes the type of change event.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Details of the change event.
        @[JSON::Field(key: "Values")]
        getter values : Types::CoreNetworkChangeEventValues?

        def initialize(
          @action : String? = nil,
          @event_time : Time? = nil,
          @identifier_path : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @values : Types::CoreNetworkChangeEventValues? = nil
        )
        end
      end

      # Describes a core network change event.
      struct CoreNetworkChangeEventValues
        include JSON::Serializable

        # The ID of the attachment if the change event is associated with an attachment.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # For a STATIC_ROUTE event, this is the IP address.
        @[JSON::Field(key: "Cidr")]
        getter cidr : String?

        # The edge location for the core network change event.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The changed network function group name.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        # The edge location of the peer in a core network change event.
        @[JSON::Field(key: "PeerEdgeLocation")]
        getter peer_edge_location : String?

        # The names of the routing policies and other association details in the core network change values.
        @[JSON::Field(key: "RoutingPolicyAssociationDetails")]
        getter routing_policy_association_details : Array(Types::RoutingPolicyAssociationDetail)?

        # The routing policy direction (inbound/outbound) in a core network change event.
        @[JSON::Field(key: "RoutingPolicyDirection")]
        getter routing_policy_direction : String?

        # The segment name if the change event is associated with a segment.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        def initialize(
          @attachment_id : String? = nil,
          @cidr : String? = nil,
          @edge_location : String? = nil,
          @network_function_group_name : String? = nil,
          @peer_edge_location : String? = nil,
          @routing_policy_association_details : Array(Types::RoutingPolicyAssociationDetail)? = nil,
          @routing_policy_direction : String? = nil,
          @segment_name : String? = nil
        )
        end
      end

      # Describes a core network change.
      struct CoreNetworkChangeValues
        include JSON::Serializable

        # The ASN of a core network.
        @[JSON::Field(key: "Asn")]
        getter asn : Int64?

        # The attachment identifier in the core network change values.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The IP addresses used for a core network.
        @[JSON::Field(key: "Cidr")]
        getter cidr : String?

        # The ID of the destination.
        @[JSON::Field(key: "DestinationIdentifier")]
        getter destination_identifier : String?

        # Indicates whether public DNS support is supported. The default is true .
        @[JSON::Field(key: "DnsSupport")]
        getter dns_support : Bool?

        # The Regions where edges are located in a core network.
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)?

        # The inside IP addresses used for core network change values.
        @[JSON::Field(key: "InsideCidrBlocks")]
        getter inside_cidr_blocks : Array(String)?

        # The network function group name if the change event is associated with a network function group.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        # The edge locations of peers in the core network change values.
        @[JSON::Field(key: "PeerEdgeLocations")]
        getter peer_edge_locations : Array(String)?

        # The routing policy configuration in the core network change values.
        @[JSON::Field(key: "RoutingPolicy")]
        getter routing_policy : String?

        # The names of the routing policies and other association details in the core network change values.
        @[JSON::Field(key: "RoutingPolicyAssociationDetails")]
        getter routing_policy_association_details : Array(Types::RoutingPolicyAssociationDetail)?

        # The routing policy direction (inbound/outbound) in a core network change event.
        @[JSON::Field(key: "RoutingPolicyDirection")]
        getter routing_policy_direction : String?

        # Indicates whether security group referencing is enabled for the core network.
        @[JSON::Field(key: "SecurityGroupReferencingSupport")]
        getter security_group_referencing_support : Bool?

        # The names of the segments in a core network.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        # Describes the service insertion action.
        @[JSON::Field(key: "ServiceInsertionActions")]
        getter service_insertion_actions : Array(Types::ServiceInsertionAction)?

        # The shared segments for a core network change value.
        @[JSON::Field(key: "SharedSegments")]
        getter shared_segments : Array(String)?

        # Indicates whether Equal Cost Multipath (ECMP) is enabled for the core network.
        @[JSON::Field(key: "VpnEcmpSupport")]
        getter vpn_ecmp_support : Bool?

        def initialize(
          @asn : Int64? = nil,
          @attachment_id : String? = nil,
          @cidr : String? = nil,
          @destination_identifier : String? = nil,
          @dns_support : Bool? = nil,
          @edge_locations : Array(String)? = nil,
          @inside_cidr_blocks : Array(String)? = nil,
          @network_function_group_name : String? = nil,
          @peer_edge_locations : Array(String)? = nil,
          @routing_policy : String? = nil,
          @routing_policy_association_details : Array(Types::RoutingPolicyAssociationDetail)? = nil,
          @routing_policy_direction : String? = nil,
          @security_group_referencing_support : Bool? = nil,
          @segment_name : String? = nil,
          @service_insertion_actions : Array(Types::ServiceInsertionAction)? = nil,
          @shared_segments : Array(String)? = nil,
          @vpn_ecmp_support : Bool? = nil
        )
        end
      end

      # Describes a core network edge.
      struct CoreNetworkEdge
        include JSON::Serializable

        # The ASN of a core network edge.
        @[JSON::Field(key: "Asn")]
        getter asn : Int64?

        # The Region where a core network edge is located.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The inside IP addresses used for core network edges.
        @[JSON::Field(key: "InsideCidrBlocks")]
        getter inside_cidr_blocks : Array(String)?

        def initialize(
          @asn : Int64? = nil,
          @edge_location : String? = nil,
          @inside_cidr_blocks : Array(String)? = nil
        )
        end
      end

      # Describes a network function group.
      struct CoreNetworkNetworkFunctionGroup
        include JSON::Serializable

        # The core network edge locations.
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)?

        # The name of the network function group.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The segments associated with the network function group.
        @[JSON::Field(key: "Segments")]
        getter segments : Types::ServiceInsertionSegments?

        def initialize(
          @edge_locations : Array(String)? = nil,
          @name : String? = nil,
          @segments : Types::ServiceInsertionSegments? = nil
        )
        end
      end

      # Describes a core network
      struct CoreNetworkNetworkFunctionGroupIdentifier
        include JSON::Serializable

        # The ID of the core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The location for the core network edge.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The network function group name.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        def initialize(
          @core_network_id : String? = nil,
          @edge_location : String? = nil,
          @network_function_group_name : String? = nil
        )
        end
      end

      # Describes a core network policy. You can have only one LIVE Core Policy.
      struct CoreNetworkPolicy
        include JSON::Serializable

        # Whether a core network policy is the current LIVE policy or the most recently submitted policy.
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The state of a core network policy.
        @[JSON::Field(key: "ChangeSetState")]
        getter change_set_state : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when a core network policy was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of a core network policy.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Describes a core network policy.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # Describes any errors in a core network policy.
        @[JSON::Field(key: "PolicyErrors")]
        getter policy_errors : Array(Types::CoreNetworkPolicyError)?

        # The ID of the policy version.
        @[JSON::Field(key: "PolicyVersionId")]
        getter policy_version_id : Int32?

        def initialize(
          @alias : String? = nil,
          @change_set_state : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @policy_document : String? = nil,
          @policy_errors : Array(Types::CoreNetworkPolicyError)? = nil,
          @policy_version_id : Int32? = nil
        )
        end
      end

      # Provides details about an error in a core network policy.
      struct CoreNetworkPolicyError
        include JSON::Serializable

        # The error code associated with a core network policy error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The message associated with a core network policy error code.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The JSON path where the error was discovered in the policy document.
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @error_code : String,
          @message : String,
          @path : String? = nil
        )
        end
      end

      # Describes a core network policy exception.
      struct CoreNetworkPolicyException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Describes a core network policy exception.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::CoreNetworkPolicyError)?

        def initialize(
          @message : String,
          @errors : Array(Types::CoreNetworkPolicyError)? = nil
        )
        end
      end

      # Describes a core network policy version.
      struct CoreNetworkPolicyVersion
        include JSON::Serializable

        # Whether a core network policy is the current policy or the most recently submitted policy.
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The status of the policy version change set.
        @[JSON::Field(key: "ChangeSetState")]
        getter change_set_state : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when a core network policy version was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of a core network policy version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the policy version.
        @[JSON::Field(key: "PolicyVersionId")]
        getter policy_version_id : Int32?

        def initialize(
          @alias : String? = nil,
          @change_set_state : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @policy_version_id : Int32? = nil
        )
        end
      end

      # Routing information for a core network, including route details and BGP attributes.
      struct CoreNetworkRoutingInformation
        include JSON::Serializable

        # The BGP AS path for the route.
        @[JSON::Field(key: "AsPath")]
        getter as_path : Array(String)?

        # The BGP community values for the route.
        @[JSON::Field(key: "Communities")]
        getter communities : Array(String)?

        # The BGP local preference value for the route.
        @[JSON::Field(key: "LocalPreference")]
        getter local_preference : String?

        # The BGP Multi-Exit Discriminator (MED) value for the route.
        @[JSON::Field(key: "Med")]
        getter med : String?

        # The next hop information for the route.
        @[JSON::Field(key: "NextHop")]
        getter next_hop : Types::RoutingInformationNextHop?

        # The IP prefix for the route.
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @as_path : Array(String)? = nil,
          @communities : Array(String)? = nil,
          @local_preference : String? = nil,
          @med : String? = nil,
          @next_hop : Types::RoutingInformationNextHop? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes a core network segment, which are dedicated routes. Only attachments within this segment
      # can communicate with each other.
      struct CoreNetworkSegment
        include JSON::Serializable

        # The Regions where the edges are located.
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)?

        # The name of a core network segment.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The shared segments of a core network.
        @[JSON::Field(key: "SharedSegments")]
        getter shared_segments : Array(String)?

        def initialize(
          @edge_locations : Array(String)? = nil,
          @name : String? = nil,
          @shared_segments : Array(String)? = nil
        )
        end
      end

      # Returns details about a core network edge.
      struct CoreNetworkSegmentEdgeIdentifier
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The Region where the segment edge is located.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The name of the segment edge.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        def initialize(
          @core_network_id : String? = nil,
          @edge_location : String? = nil,
          @segment_name : String? = nil
        )
        end
      end

      # Returns summary information about a core network.
      struct CoreNetworkSummary
        include JSON::Serializable

        # a core network ARN.
        @[JSON::Field(key: "CoreNetworkArn")]
        getter core_network_arn : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The description of a core network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The global network ID.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The ID of the account owner.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The state of a core network.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The key-value tags associated with a core network summary.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_arn : String? = nil,
          @core_network_id : String? = nil,
          @description : String? = nil,
          @global_network_id : String? = nil,
          @owner_account_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectAttachmentRequest
        include JSON::Serializable

        # The ID of a core network where you want to create the attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The Region where the edge is located.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String

        # Options for creating an attachment.
        @[JSON::Field(key: "Options")]
        getter options : Types::ConnectAttachmentOptions

        # The ID of the attachment between the two connections.
        @[JSON::Field(key: "TransportAttachmentId")]
        getter transport_attachment_id : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The routing policy label to apply to the Connect attachment for traffic routing decisions.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        # The list of key-value tags associated with the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_id : String,
          @edge_location : String,
          @options : Types::ConnectAttachmentOptions,
          @transport_attachment_id : String,
          @client_token : String? = nil,
          @routing_policy_label : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectAttachmentResponse
        include JSON::Serializable

        # The response to a Connect attachment request.
        @[JSON::Field(key: "ConnectAttachment")]
        getter connect_attachment : Types::ConnectAttachment?

        def initialize(
          @connect_attachment : Types::ConnectAttachment? = nil
        )
        end
      end

      struct CreateConnectPeerRequest
        include JSON::Serializable

        # The ID of the connection attachment.
        @[JSON::Field(key: "ConnectAttachmentId")]
        getter connect_attachment_id : String

        # The Connect peer address.
        @[JSON::Field(key: "PeerAddress")]
        getter peer_address : String

        # The Connect peer BGP options. This only applies only when the protocol is GRE .
        @[JSON::Field(key: "BgpOptions")]
        getter bgp_options : Types::BgpOptions?

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A Connect peer core network address. This only applies only when the protocol is GRE .
        @[JSON::Field(key: "CoreNetworkAddress")]
        getter core_network_address : String?

        # The inside IP addresses used for BGP peering.
        @[JSON::Field(key: "InsideCidrBlocks")]
        getter inside_cidr_blocks : Array(String)?

        # The subnet ARN for the Connect peer. This only applies only when the protocol is NO_ENCAP.
        @[JSON::Field(key: "SubnetArn")]
        getter subnet_arn : String?

        # The tags associated with the peer request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connect_attachment_id : String,
          @peer_address : String,
          @bgp_options : Types::BgpOptions? = nil,
          @client_token : String? = nil,
          @core_network_address : String? = nil,
          @inside_cidr_blocks : Array(String)? = nil,
          @subnet_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectPeerResponse
        include JSON::Serializable

        # The response to the request.
        @[JSON::Field(key: "ConnectPeer")]
        getter connect_peer : Types::ConnectPeer?

        def initialize(
          @connect_peer : Types::ConnectPeer? = nil
        )
        end
      end

      struct CreateConnectionRequest
        include JSON::Serializable

        # The ID of the second device in the connection.
        @[JSON::Field(key: "ConnectedDeviceId")]
        getter connected_device_id : String

        # The ID of the first device in the connection.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link for the second device.
        @[JSON::Field(key: "ConnectedLinkId")]
        getter connected_link_id : String?

        # A description of the connection. Length Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the link for the first device.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The tags to apply to the resource during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connected_device_id : String,
          @device_id : String,
          @global_network_id : String,
          @connected_link_id : String? = nil,
          @description : String? = nil,
          @link_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectionResponse
        include JSON::Serializable

        # Information about the connection.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      struct CreateCoreNetworkPrefixListAssociationRequest
        include JSON::Serializable

        # The ID of the core network to associate with the prefix list.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # An optional alias for the prefix list association.
        @[JSON::Field(key: "PrefixListAlias")]
        getter prefix_list_alias : String

        # The ARN of the prefix list to associate with the core network.
        @[JSON::Field(key: "PrefixListArn")]
        getter prefix_list_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @core_network_id : String,
          @prefix_list_alias : String,
          @prefix_list_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateCoreNetworkPrefixListAssociationResponse
        include JSON::Serializable

        # The ID of the core network associated with the prefix list.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The alias of the prefix list association, if provided.
        @[JSON::Field(key: "PrefixListAlias")]
        getter prefix_list_alias : String?

        # The ARN of the prefix list that was associated with the core network.
        @[JSON::Field(key: "PrefixListArn")]
        getter prefix_list_arn : String?

        def initialize(
          @core_network_id : String? = nil,
          @prefix_list_alias : String? = nil,
          @prefix_list_arn : String? = nil
        )
        end
      end

      struct CreateCoreNetworkRequest
        include JSON::Serializable

        # The ID of the global network that a core network will be a part of.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String

        # The client token associated with a core network request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of a core network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The policy document for creating a core network.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # Key-value tags associated with a core network request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @global_network_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @policy_document : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCoreNetworkResponse
        include JSON::Serializable

        # Returns details about a core network.
        @[JSON::Field(key: "CoreNetwork")]
        getter core_network : Types::CoreNetwork?

        def initialize(
          @core_network : Types::CoreNetwork? = nil
        )
        end
      end

      struct CreateDeviceRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Web Services location of the device, if applicable. For an on-premises device, you can
        # omit this parameter.
        @[JSON::Field(key: "AWSLocation")]
        getter aws_location : Types::AWSLocation?

        # A description of the device. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The location of the device.
        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        # The model of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Model")]
        getter model : String?

        # The serial number of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The ID of the site.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The tags to apply to the resource during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The type of the device.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The vendor of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Vendor")]
        getter vendor : String?

        def initialize(
          @global_network_id : String,
          @aws_location : Types::AWSLocation? = nil,
          @description : String? = nil,
          @location : Types::Location? = nil,
          @model : String? = nil,
          @serial_number : String? = nil,
          @site_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @vendor : String? = nil
        )
        end
      end

      struct CreateDeviceResponse
        include JSON::Serializable

        # Information about the device.
        @[JSON::Field(key: "Device")]
        getter device : Types::Device?

        def initialize(
          @device : Types::Device? = nil
        )
        end
      end

      struct CreateDirectConnectGatewayAttachmentRequest
        include JSON::Serializable

        # The ID of the Cloud WAN core network that the Direct Connect gateway attachment should be attached
        # to.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The ARN of the Direct Connect gateway attachment.
        @[JSON::Field(key: "DirectConnectGatewayArn")]
        getter direct_connect_gateway_arn : String

        # One or more core network edge locations that the Direct Connect gateway attachment is associated
        # with.
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)

        # client token
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The routing policy label to apply to the Direct Connect Gateway attachment for traffic routing
        # decisions.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        # The key value tags to apply to the Direct Connect gateway attachment during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_id : String,
          @direct_connect_gateway_arn : String,
          @edge_locations : Array(String),
          @client_token : String? = nil,
          @routing_policy_label : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDirectConnectGatewayAttachmentResponse
        include JSON::Serializable

        # Describes the details of a CreateDirectConnectGatewayAttachment request.
        @[JSON::Field(key: "DirectConnectGatewayAttachment")]
        getter direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment?

        def initialize(
          @direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment? = nil
        )
        end
      end

      struct CreateGlobalNetworkRequest
        include JSON::Serializable

        # A description of the global network. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags to apply to the resource during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateGlobalNetworkResponse
        include JSON::Serializable

        # Information about the global network object.
        @[JSON::Field(key: "GlobalNetwork")]
        getter global_network : Types::GlobalNetwork?

        def initialize(
          @global_network : Types::GlobalNetwork? = nil
        )
        end
      end

      struct CreateLinkRequest
        include JSON::Serializable

        # The upload speed and download speed in Mbps.
        @[JSON::Field(key: "Bandwidth")]
        getter bandwidth : Types::Bandwidth

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the site.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        # A description of the link. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The provider of the link. Constraints: Maximum length of 128 characters. Cannot include the
        # following characters: | \ ^
        @[JSON::Field(key: "Provider")]
        getter provider : String?

        # The tags to apply to the resource during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The type of the link. Constraints: Maximum length of 128 characters. Cannot include the following
        # characters: | \ ^
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @bandwidth : Types::Bandwidth,
          @global_network_id : String,
          @site_id : String,
          @description : String? = nil,
          @provider : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      struct CreateLinkResponse
        include JSON::Serializable

        # Information about the link.
        @[JSON::Field(key: "Link")]
        getter link : Types::Link?

        def initialize(
          @link : Types::Link? = nil
        )
        end
      end

      struct CreateSiteRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # A description of your site. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The site location. This information is used for visualization in the Network Manager console. If you
        # specify the address, the latitude and longitude are automatically calculated. Address : The physical
        # address of the site. Latitude : The latitude of the site. Longitude : The longitude of the site.
        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        # The tags to apply to the resource during creation.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @global_network_id : String,
          @description : String? = nil,
          @location : Types::Location? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSiteResponse
        include JSON::Serializable

        # Information about the site.
        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end

      struct CreateSiteToSiteVpnAttachmentRequest
        include JSON::Serializable

        # The ID of a core network where you're creating a site-to-site VPN attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The ARN identifying the VPN attachment.
        @[JSON::Field(key: "VpnConnectionArn")]
        getter vpn_connection_arn : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The routing policy label to apply to the Site-to-Site VPN attachment for traffic routing decisions.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        # The tags associated with the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_id : String,
          @vpn_connection_arn : String,
          @client_token : String? = nil,
          @routing_policy_label : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSiteToSiteVpnAttachmentResponse
        include JSON::Serializable

        # Details about a site-to-site VPN attachment.
        @[JSON::Field(key: "SiteToSiteVpnAttachment")]
        getter site_to_site_vpn_attachment : Types::SiteToSiteVpnAttachment?

        def initialize(
          @site_to_site_vpn_attachment : Types::SiteToSiteVpnAttachment? = nil
        )
        end
      end

      struct CreateTransitGatewayPeeringRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The ARN of the transit gateway for the peering request.
        @[JSON::Field(key: "TransitGatewayArn")]
        getter transit_gateway_arn : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The list of key-value tags associated with the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_id : String,
          @transit_gateway_arn : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTransitGatewayPeeringResponse
        include JSON::Serializable

        # Returns information about the transit gateway peering connection request.
        @[JSON::Field(key: "TransitGatewayPeering")]
        getter transit_gateway_peering : Types::TransitGatewayPeering?

        def initialize(
          @transit_gateway_peering : Types::TransitGatewayPeering? = nil
        )
        end
      end

      struct CreateTransitGatewayRouteTableAttachmentRequest
        include JSON::Serializable

        # The ID of the peer for the
        @[JSON::Field(key: "PeeringId")]
        getter peering_id : String

        # The ARN of the transit gateway route table for the attachment request. For example,
        # "TransitGatewayRouteTableArn":
        # "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456" .
        @[JSON::Field(key: "TransitGatewayRouteTableArn")]
        getter transit_gateway_route_table_arn : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The routing policy label to apply to the Transit Gateway route table attachment for traffic routing
        # decisions.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        # The list of key-value tags associated with the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @peering_id : String,
          @transit_gateway_route_table_arn : String,
          @client_token : String? = nil,
          @routing_policy_label : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTransitGatewayRouteTableAttachmentResponse
        include JSON::Serializable

        # The route table associated with the create transit gateway route table attachment request.
        @[JSON::Field(key: "TransitGatewayRouteTableAttachment")]
        getter transit_gateway_route_table_attachment : Types::TransitGatewayRouteTableAttachment?

        def initialize(
          @transit_gateway_route_table_attachment : Types::TransitGatewayRouteTableAttachment? = nil
        )
        end
      end

      struct CreateVpcAttachmentRequest
        include JSON::Serializable

        # The ID of a core network for the VPC attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The subnet ARN of the VPC attachment.
        @[JSON::Field(key: "SubnetArns")]
        getter subnet_arns : Array(String)

        # The ARN of the VPC.
        @[JSON::Field(key: "VpcArn")]
        getter vpc_arn : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Options for the VPC attachment.
        @[JSON::Field(key: "Options")]
        getter options : Types::VpcOptions?

        # The routing policy label to apply to the VPC attachment for traffic routing decisions.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        # The key-value tags associated with the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_id : String,
          @subnet_arns : Array(String),
          @vpc_arn : String,
          @client_token : String? = nil,
          @options : Types::VpcOptions? = nil,
          @routing_policy_label : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVpcAttachmentResponse
        include JSON::Serializable

        # Provides details about the VPC attachment.
        @[JSON::Field(key: "VpcAttachment")]
        getter vpc_attachment : Types::VpcAttachment?

        def initialize(
          @vpc_attachment : Types::VpcAttachment? = nil
        )
        end
      end

      # Describes the association between a customer gateway, a device, and a link.
      struct CustomerGatewayAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer gateway.
        @[JSON::Field(key: "CustomerGatewayArn")]
        getter customer_gateway_arn : String?

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The association state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @customer_gateway_arn : String? = nil,
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @link_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct DeleteAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment to delete.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct DeleteAttachmentResponse
        include JSON::Serializable

        # Information about the deleted attachment.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        def initialize(
          @attachment : Types::Attachment? = nil
        )
        end
      end

      struct DeleteConnectPeerRequest
        include JSON::Serializable

        # The ID of the deleted Connect peer.
        @[JSON::Field(key: "connectPeerId")]
        getter connect_peer_id : String

        def initialize(
          @connect_peer_id : String
        )
        end
      end

      struct DeleteConnectPeerResponse
        include JSON::Serializable

        # Information about the deleted Connect peer.
        @[JSON::Field(key: "ConnectPeer")]
        getter connect_peer : Types::ConnectPeer?

        def initialize(
          @connect_peer : Types::ConnectPeer? = nil
        )
        end
      end

      struct DeleteConnectionRequest
        include JSON::Serializable

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        def initialize(
          @connection_id : String,
          @global_network_id : String
        )
        end
      end

      struct DeleteConnectionResponse
        include JSON::Serializable

        # Information about the connection.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      struct DeleteCoreNetworkPolicyVersionRequest
        include JSON::Serializable

        # The ID of a core network for the deleted policy.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The version ID of the deleted policy.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32

        def initialize(
          @core_network_id : String,
          @policy_version_id : Int32
        )
        end
      end

      struct DeleteCoreNetworkPolicyVersionResponse
        include JSON::Serializable

        # Returns information about the deleted policy version.
        @[JSON::Field(key: "CoreNetworkPolicy")]
        getter core_network_policy : Types::CoreNetworkPolicy?

        def initialize(
          @core_network_policy : Types::CoreNetworkPolicy? = nil
        )
        end
      end

      struct DeleteCoreNetworkPrefixListAssociationRequest
        include JSON::Serializable

        # The ID of the core network from which to delete the prefix list association.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ARN of the prefix list to disassociate from the core network.
        @[JSON::Field(key: "prefixListArn")]
        getter prefix_list_arn : String

        def initialize(
          @core_network_id : String,
          @prefix_list_arn : String
        )
        end
      end

      struct DeleteCoreNetworkPrefixListAssociationResponse
        include JSON::Serializable

        # The ID of the core network from which the prefix list association was deleted.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The ARN of the prefix list that was disassociated from the core network.
        @[JSON::Field(key: "PrefixListArn")]
        getter prefix_list_arn : String?

        def initialize(
          @core_network_id : String? = nil,
          @prefix_list_arn : String? = nil
        )
        end
      end

      struct DeleteCoreNetworkRequest
        include JSON::Serializable

        # The network ID of the deleted core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        def initialize(
          @core_network_id : String
        )
        end
      end

      struct DeleteCoreNetworkResponse
        include JSON::Serializable

        # Information about the deleted core network.
        @[JSON::Field(key: "CoreNetwork")]
        getter core_network : Types::CoreNetwork?

        def initialize(
          @core_network : Types::CoreNetwork? = nil
        )
        end
      end

      struct DeleteDeviceRequest
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        def initialize(
          @device_id : String,
          @global_network_id : String
        )
        end
      end

      struct DeleteDeviceResponse
        include JSON::Serializable

        # Information about the device.
        @[JSON::Field(key: "Device")]
        getter device : Types::Device?

        def initialize(
          @device : Types::Device? = nil
        )
        end
      end

      struct DeleteGlobalNetworkRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        def initialize(
          @global_network_id : String
        )
        end
      end

      struct DeleteGlobalNetworkResponse
        include JSON::Serializable

        # Information about the global network.
        @[JSON::Field(key: "GlobalNetwork")]
        getter global_network : Types::GlobalNetwork?

        def initialize(
          @global_network : Types::GlobalNetwork? = nil
        )
        end
      end

      struct DeleteLinkRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @global_network_id : String,
          @link_id : String
        )
        end
      end

      struct DeleteLinkResponse
        include JSON::Serializable

        # Information about the link.
        @[JSON::Field(key: "Link")]
        getter link : Types::Link?

        def initialize(
          @link : Types::Link? = nil
        )
        end
      end

      struct DeletePeeringRequest
        include JSON::Serializable

        # The ID of the peering connection to delete.
        @[JSON::Field(key: "peeringId")]
        getter peering_id : String

        def initialize(
          @peering_id : String
        )
        end
      end

      struct DeletePeeringResponse
        include JSON::Serializable

        # Information about a deleted peering connection.
        @[JSON::Field(key: "Peering")]
        getter peering : Types::Peering?

        def initialize(
          @peering : Types::Peering? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The ARN of the policy to delete.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSiteRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the site.
        @[JSON::Field(key: "siteId")]
        getter site_id : String

        def initialize(
          @global_network_id : String,
          @site_id : String
        )
        end
      end

      struct DeleteSiteResponse
        include JSON::Serializable

        # Information about the site.
        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end

      struct DeregisterTransitGatewayRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Resource Name (ARN) of the transit gateway.
        @[JSON::Field(key: "transitGatewayArn")]
        getter transit_gateway_arn : String

        def initialize(
          @global_network_id : String,
          @transit_gateway_arn : String
        )
        end
      end

      struct DeregisterTransitGatewayResponse
        include JSON::Serializable

        # The transit gateway registration information.
        @[JSON::Field(key: "TransitGatewayRegistration")]
        getter transit_gateway_registration : Types::TransitGatewayRegistration?

        def initialize(
          @transit_gateway_registration : Types::TransitGatewayRegistration? = nil
        )
        end
      end

      struct DescribeGlobalNetworksRequest
        include JSON::Serializable

        # The IDs of one or more global networks. The maximum is 10.
        @[JSON::Field(key: "globalNetworkIds")]
        getter global_network_ids : Array(String)?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_network_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeGlobalNetworksResponse
        include JSON::Serializable

        # Information about the global networks.
        @[JSON::Field(key: "GlobalNetworks")]
        getter global_networks : Array(Types::GlobalNetwork)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @global_networks : Array(Types::GlobalNetwork)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes a device.
      struct Device
        include JSON::Serializable

        # The Amazon Web Services location of the device.
        @[JSON::Field(key: "AWSLocation")]
        getter aws_location : Types::AWSLocation?

        # The date and time that the site was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the device.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the device.
        @[JSON::Field(key: "DeviceArn")]
        getter device_arn : String?

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The site location.
        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        # The device model.
        @[JSON::Field(key: "Model")]
        getter model : String?

        # The device serial number.
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The site ID.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The device state.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags for the device.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The device type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The device vendor.
        @[JSON::Field(key: "Vendor")]
        getter vendor : String?

        def initialize(
          @aws_location : Types::AWSLocation? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @device_arn : String? = nil,
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @location : Types::Location? = nil,
          @model : String? = nil,
          @serial_number : String? = nil,
          @site_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @vendor : String? = nil
        )
        end
      end

      # Describes a Direct Connect gateway attachment.
      struct DirectConnectGatewayAttachment
        include JSON::Serializable

        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # The Direct Connect gateway attachment ARN.
        @[JSON::Field(key: "DirectConnectGatewayArn")]
        getter direct_connect_gateway_arn : String?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @direct_connect_gateway_arn : String? = nil
        )
        end
      end

      struct DisassociateConnectPeerRequest
        include JSON::Serializable

        # The ID of the Connect peer to disassociate from a device.
        @[JSON::Field(key: "connectPeerId")]
        getter connect_peer_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        def initialize(
          @connect_peer_id : String,
          @global_network_id : String
        )
        end
      end

      struct DisassociateConnectPeerResponse
        include JSON::Serializable

        # Describes the Connect peer association.
        @[JSON::Field(key: "ConnectPeerAssociation")]
        getter connect_peer_association : Types::ConnectPeerAssociation?

        def initialize(
          @connect_peer_association : Types::ConnectPeerAssociation? = nil
        )
        end
      end

      struct DisassociateCustomerGatewayRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer gateway.
        @[JSON::Field(key: "customerGatewayArn")]
        getter customer_gateway_arn : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        def initialize(
          @customer_gateway_arn : String,
          @global_network_id : String
        )
        end
      end

      struct DisassociateCustomerGatewayResponse
        include JSON::Serializable

        # Information about the customer gateway association.
        @[JSON::Field(key: "CustomerGatewayAssociation")]
        getter customer_gateway_association : Types::CustomerGatewayAssociation?

        def initialize(
          @customer_gateway_association : Types::CustomerGatewayAssociation? = nil
        )
        end
      end

      struct DisassociateLinkRequest
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @device_id : String,
          @global_network_id : String,
          @link_id : String
        )
        end
      end

      struct DisassociateLinkResponse
        include JSON::Serializable

        # Information about the link association.
        @[JSON::Field(key: "LinkAssociation")]
        getter link_association : Types::LinkAssociation?

        def initialize(
          @link_association : Types::LinkAssociation? = nil
        )
        end
      end

      struct DisassociateTransitGatewayConnectPeerRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Resource Name (ARN) of the transit gateway Connect peer.
        @[JSON::Field(key: "transitGatewayConnectPeerArn")]
        getter transit_gateway_connect_peer_arn : String

        def initialize(
          @global_network_id : String,
          @transit_gateway_connect_peer_arn : String
        )
        end
      end

      struct DisassociateTransitGatewayConnectPeerResponse
        include JSON::Serializable

        # The transit gateway Connect peer association.
        @[JSON::Field(key: "TransitGatewayConnectPeerAssociation")]
        getter transit_gateway_connect_peer_association : Types::TransitGatewayConnectPeerAssociation?

        def initialize(
          @transit_gateway_connect_peer_association : Types::TransitGatewayConnectPeerAssociation? = nil
        )
        end
      end

      # Describes the edge that's used for the override.
      struct EdgeOverride
        include JSON::Serializable

        # The list of edge locations.
        @[JSON::Field(key: "EdgeSets")]
        getter edge_sets : Array(Array(String))?

        # The edge that should be used when overriding the current edge order.
        @[JSON::Field(key: "UseEdge")]
        getter use_edge : String?

        def initialize(
          @edge_sets : Array(Array(String))? = nil,
          @use_edge : String? = nil
        )
        end
      end

      struct ExecuteCoreNetworkChangeSetRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ID of the policy version.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32

        def initialize(
          @core_network_id : String,
          @policy_version_id : Int32
        )
        end
      end

      struct ExecuteCoreNetworkChangeSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct GetConnectAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct GetConnectAttachmentResponse
        include JSON::Serializable

        # Details about the Connect attachment.
        @[JSON::Field(key: "ConnectAttachment")]
        getter connect_attachment : Types::ConnectAttachment?

        def initialize(
          @connect_attachment : Types::ConnectAttachment? = nil
        )
        end
      end

      struct GetConnectPeerAssociationsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The IDs of the Connect peers.
        @[JSON::Field(key: "connectPeerIds")]
        getter connect_peer_ids : Array(String)?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_network_id : String,
          @connect_peer_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConnectPeerAssociationsResponse
        include JSON::Serializable

        # Displays a list of Connect peer associations.
        @[JSON::Field(key: "ConnectPeerAssociations")]
        getter connect_peer_associations : Array(Types::ConnectPeerAssociation)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connect_peer_associations : Array(Types::ConnectPeerAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConnectPeerRequest
        include JSON::Serializable

        # The ID of the Connect peer.
        @[JSON::Field(key: "connectPeerId")]
        getter connect_peer_id : String

        def initialize(
          @connect_peer_id : String
        )
        end
      end

      struct GetConnectPeerResponse
        include JSON::Serializable

        # Returns information about a core network Connect peer.
        @[JSON::Field(key: "ConnectPeer")]
        getter connect_peer : Types::ConnectPeer?

        def initialize(
          @connect_peer : Types::ConnectPeer? = nil
        )
        end
      end

      struct GetConnectionsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # One or more connection IDs.
        @[JSON::Field(key: "connectionIds")]
        getter connection_ids : Array(String)?

        # The ID of the device.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_network_id : String,
          @connection_ids : Array(String)? = nil,
          @device_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetConnectionsResponse
        include JSON::Serializable

        # Information about the connections.
        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::Connection)?

        # The token to use for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::Connection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCoreNetworkChangeEventsRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ID of the policy version.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_network_id : String,
          @policy_version_id : Int32,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCoreNetworkChangeEventsResponse
        include JSON::Serializable

        # The response to GetCoreNetworkChangeEventsRequest .
        @[JSON::Field(key: "CoreNetworkChangeEvents")]
        getter core_network_change_events : Array(Types::CoreNetworkChangeEvent)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_network_change_events : Array(Types::CoreNetworkChangeEvent)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCoreNetworkChangeSetRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ID of the policy version.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_network_id : String,
          @policy_version_id : Int32,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCoreNetworkChangeSetResponse
        include JSON::Serializable

        # Describes a core network changes.
        @[JSON::Field(key: "CoreNetworkChanges")]
        getter core_network_changes : Array(Types::CoreNetworkChange)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_network_changes : Array(Types::CoreNetworkChange)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCoreNetworkPolicyRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The alias of a core network policy
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The ID of a core network policy version.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32?

        def initialize(
          @core_network_id : String,
          @alias : String? = nil,
          @policy_version_id : Int32? = nil
        )
        end
      end

      struct GetCoreNetworkPolicyResponse
        include JSON::Serializable

        # The details about a core network policy.
        @[JSON::Field(key: "CoreNetworkPolicy")]
        getter core_network_policy : Types::CoreNetworkPolicy?

        def initialize(
          @core_network_policy : Types::CoreNetworkPolicy? = nil
        )
        end
      end

      struct GetCoreNetworkRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        def initialize(
          @core_network_id : String
        )
        end
      end

      struct GetCoreNetworkResponse
        include JSON::Serializable

        # Details about a core network.
        @[JSON::Field(key: "CoreNetwork")]
        getter core_network : Types::CoreNetwork?

        def initialize(
          @core_network : Types::CoreNetwork? = nil
        )
        end
      end

      struct GetCustomerGatewayAssociationsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # One or more customer gateway Amazon Resource Names (ARNs). The maximum is 10.
        @[JSON::Field(key: "customerGatewayArns")]
        getter customer_gateway_arns : Array(String)?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_network_id : String,
          @customer_gateway_arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetCustomerGatewayAssociationsResponse
        include JSON::Serializable

        # The customer gateway associations.
        @[JSON::Field(key: "CustomerGatewayAssociations")]
        getter customer_gateway_associations : Array(Types::CustomerGatewayAssociation)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @customer_gateway_associations : Array(Types::CustomerGatewayAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetDevicesRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # One or more device IDs. The maximum is 10.
        @[JSON::Field(key: "deviceIds")]
        getter device_ids : Array(String)?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the site.
        @[JSON::Field(key: "siteId")]
        getter site_id : String?

        def initialize(
          @global_network_id : String,
          @device_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @site_id : String? = nil
        )
        end
      end

      struct GetDevicesResponse
        include JSON::Serializable

        # The devices.
        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::Device)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::Device)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetDirectConnectGatewayAttachmentRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway attachment that you want to see details about.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct GetDirectConnectGatewayAttachmentResponse
        include JSON::Serializable

        # Shows details about the Direct Connect gateway attachment.
        @[JSON::Field(key: "DirectConnectGatewayAttachment")]
        getter direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment?

        def initialize(
          @direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment? = nil
        )
        end
      end

      struct GetLinkAssociationsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the device.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String?

        # The ID of the link.
        @[JSON::Field(key: "linkId")]
        getter link_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_network_id : String,
          @device_id : String? = nil,
          @link_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLinkAssociationsResponse
        include JSON::Serializable

        # The link associations.
        @[JSON::Field(key: "LinkAssociations")]
        getter link_associations : Array(Types::LinkAssociation)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @link_associations : Array(Types::LinkAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLinksRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # One or more link IDs. The maximum is 10.
        @[JSON::Field(key: "linkIds")]
        getter link_ids : Array(String)?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The link provider.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        # The ID of the site.
        @[JSON::Field(key: "siteId")]
        getter site_id : String?

        # The link type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @global_network_id : String,
          @link_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provider : String? = nil,
          @site_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct GetLinksResponse
        include JSON::Serializable

        # The links.
        @[JSON::Field(key: "Links")]
        getter links : Array(Types::Link)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @links : Array(Types::Link)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetNetworkResourceCountsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The resource type. The following are the supported resource types for Direct Connect: dxcon
        # dx-gateway dx-vif The following are the supported resource types for Network Manager: attachment
        # connect-peer connection core-network device link peering site The following are the supported
        # resource types for Amazon VPC: customer-gateway transit-gateway transit-gateway-attachment
        # transit-gateway-connect-peer transit-gateway-route-table vpn-connection
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @global_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetNetworkResourceCountsResponse
        include JSON::Serializable

        # The count of resources.
        @[JSON::Field(key: "NetworkResourceCounts")]
        getter network_resource_counts : Array(Types::NetworkResourceCount)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @network_resource_counts : Array(Types::NetworkResourceCount)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetNetworkResourceRelationshipsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the registered gateway.
        @[JSON::Field(key: "registeredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the gateway.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The resource type. The following are the supported resource types for Direct Connect: dxcon
        # dx-gateway dx-vif The following are the supported resource types for Network Manager: attachment
        # connect-peer connection core-network device link peering site The following are the supported
        # resource types for Amazon VPC: customer-gateway transit-gateway transit-gateway-attachment
        # transit-gateway-connect-peer transit-gateway-route-table vpn-connection
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @global_network_id : String,
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @core_network_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetNetworkResourceRelationshipsResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The resource relationships.
        @[JSON::Field(key: "Relationships")]
        getter relationships : Array(Types::Relationship)?

        def initialize(
          @next_token : String? = nil,
          @relationships : Array(Types::Relationship)? = nil
        )
        end
      end

      struct GetNetworkResourcesRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the gateway.
        @[JSON::Field(key: "registeredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The resource type. The following are the supported resource types for Direct Connect: dxcon
        # dx-gateway dx-vif The following are the supported resource types for Network Manager: attachment
        # connect-peer connection core-network device link peering site The following are the supported
        # resource types for Amazon VPC: customer-gateway transit-gateway transit-gateway-attachment
        # transit-gateway-connect-peer transit-gateway-route-table vpn-connection
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @global_network_id : String,
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @core_network_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetNetworkResourcesResponse
        include JSON::Serializable

        # The network resources.
        @[JSON::Field(key: "NetworkResources")]
        getter network_resources : Array(Types::NetworkResource)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @network_resources : Array(Types::NetworkResource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetNetworkRoutesRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the route table.
        @[JSON::Field(key: "RouteTableIdentifier")]
        getter route_table_identifier : Types::RouteTableIdentifier

        # Filter by route table destination. Possible Values: TRANSIT_GATEWAY_ATTACHMENT_ID, RESOURCE_ID, or
        # RESOURCE_TYPE.
        @[JSON::Field(key: "DestinationFilters")]
        getter destination_filters : Hash(String, Array(String))?

        # An exact CIDR block.
        @[JSON::Field(key: "ExactCidrMatches")]
        getter exact_cidr_matches : Array(String)?

        # The most specific route that matches the traffic (longest prefix match).
        @[JSON::Field(key: "LongestPrefixMatches")]
        getter longest_prefix_matches : Array(String)?

        # The IDs of the prefix lists.
        @[JSON::Field(key: "PrefixListIds")]
        getter prefix_list_ids : Array(String)?

        # The route states.
        @[JSON::Field(key: "States")]
        getter states : Array(String)?

        # The routes with a subnet that match the specified CIDR filter.
        @[JSON::Field(key: "SubnetOfMatches")]
        getter subnet_of_matches : Array(String)?

        # The routes with a CIDR that encompasses the CIDR filter. Example: If you specify 10.0.1.0/30, then
        # the result returns 10.0.1.0/29.
        @[JSON::Field(key: "SupernetOfMatches")]
        getter supernet_of_matches : Array(String)?

        # The route types.
        @[JSON::Field(key: "Types")]
        getter types : Array(String)?

        def initialize(
          @global_network_id : String,
          @route_table_identifier : Types::RouteTableIdentifier,
          @destination_filters : Hash(String, Array(String))? = nil,
          @exact_cidr_matches : Array(String)? = nil,
          @longest_prefix_matches : Array(String)? = nil,
          @prefix_list_ids : Array(String)? = nil,
          @states : Array(String)? = nil,
          @subnet_of_matches : Array(String)? = nil,
          @supernet_of_matches : Array(String)? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      struct GetNetworkRoutesResponse
        include JSON::Serializable

        # Describes a core network segment edge.
        @[JSON::Field(key: "CoreNetworkSegmentEdge")]
        getter core_network_segment_edge : Types::CoreNetworkSegmentEdgeIdentifier?

        # The network routes.
        @[JSON::Field(key: "NetworkRoutes")]
        getter network_routes : Array(Types::NetworkRoute)?

        # The ARN of the route table.
        @[JSON::Field(key: "RouteTableArn")]
        getter route_table_arn : String?

        # The route table creation time.
        @[JSON::Field(key: "RouteTableTimestamp")]
        getter route_table_timestamp : Time?

        # The route table type.
        @[JSON::Field(key: "RouteTableType")]
        getter route_table_type : String?

        def initialize(
          @core_network_segment_edge : Types::CoreNetworkSegmentEdgeIdentifier? = nil,
          @network_routes : Array(Types::NetworkRoute)? = nil,
          @route_table_arn : String? = nil,
          @route_table_timestamp : Time? = nil,
          @route_table_type : String? = nil
        )
        end
      end

      struct GetNetworkTelemetryRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the gateway.
        @[JSON::Field(key: "registeredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The resource type. The following are the supported resource types: connect-peer
        # transit-gateway-connect-peer vpn-connection
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @global_network_id : String,
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @core_network_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetNetworkTelemetryResponse
        include JSON::Serializable

        # The network telemetry.
        @[JSON::Field(key: "NetworkTelemetry")]
        getter network_telemetry : Array(Types::NetworkTelemetry)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @network_telemetry : Array(Types::NetworkTelemetry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The resource policy document.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        def initialize(
          @policy_document : String? = nil
        )
        end
      end

      struct GetRouteAnalysisRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the route analysis.
        @[JSON::Field(key: "routeAnalysisId")]
        getter route_analysis_id : String

        def initialize(
          @global_network_id : String,
          @route_analysis_id : String
        )
        end
      end

      struct GetRouteAnalysisResponse
        include JSON::Serializable

        # The route analysis.
        @[JSON::Field(key: "RouteAnalysis")]
        getter route_analysis : Types::RouteAnalysis?

        def initialize(
          @route_analysis : Types::RouteAnalysis? = nil
        )
        end
      end

      struct GetSiteToSiteVpnAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct GetSiteToSiteVpnAttachmentResponse
        include JSON::Serializable

        # Describes the site-to-site attachment.
        @[JSON::Field(key: "SiteToSiteVpnAttachment")]
        getter site_to_site_vpn_attachment : Types::SiteToSiteVpnAttachment?

        def initialize(
          @site_to_site_vpn_attachment : Types::SiteToSiteVpnAttachment? = nil
        )
        end
      end

      struct GetSitesRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # One or more site IDs. The maximum is 10.
        @[JSON::Field(key: "siteIds")]
        getter site_ids : Array(String)?

        def initialize(
          @global_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @site_ids : Array(String)? = nil
        )
        end
      end

      struct GetSitesResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The sites.
        @[JSON::Field(key: "Sites")]
        getter sites : Array(Types::Site)?

        def initialize(
          @next_token : String? = nil,
          @sites : Array(Types::Site)? = nil
        )
        end
      end

      struct GetTransitGatewayConnectPeerAssociationsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # One or more transit gateway Connect peer Amazon Resource Names (ARNs).
        @[JSON::Field(key: "transitGatewayConnectPeerArns")]
        getter transit_gateway_connect_peer_arns : Array(String)?

        def initialize(
          @global_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @transit_gateway_connect_peer_arns : Array(String)? = nil
        )
        end
      end

      struct GetTransitGatewayConnectPeerAssociationsResponse
        include JSON::Serializable

        # The token to use for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the transit gateway Connect peer associations.
        @[JSON::Field(key: "TransitGatewayConnectPeerAssociations")]
        getter transit_gateway_connect_peer_associations : Array(Types::TransitGatewayConnectPeerAssociation)?

        def initialize(
          @next_token : String? = nil,
          @transit_gateway_connect_peer_associations : Array(Types::TransitGatewayConnectPeerAssociation)? = nil
        )
        end
      end

      struct GetTransitGatewayPeeringRequest
        include JSON::Serializable

        # The ID of the peering request.
        @[JSON::Field(key: "peeringId")]
        getter peering_id : String

        def initialize(
          @peering_id : String
        )
        end
      end

      struct GetTransitGatewayPeeringResponse
        include JSON::Serializable

        # Returns information about a transit gateway peering.
        @[JSON::Field(key: "TransitGatewayPeering")]
        getter transit_gateway_peering : Types::TransitGatewayPeering?

        def initialize(
          @transit_gateway_peering : Types::TransitGatewayPeering? = nil
        )
        end
      end

      struct GetTransitGatewayRegistrationsRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Names (ARNs) of one or more transit gateways. The maximum is 10.
        @[JSON::Field(key: "transitGatewayArns")]
        getter transit_gateway_arns : Array(String)?

        def initialize(
          @global_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @transit_gateway_arns : Array(String)? = nil
        )
        end
      end

      struct GetTransitGatewayRegistrationsResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The transit gateway registrations.
        @[JSON::Field(key: "TransitGatewayRegistrations")]
        getter transit_gateway_registrations : Array(Types::TransitGatewayRegistration)?

        def initialize(
          @next_token : String? = nil,
          @transit_gateway_registrations : Array(Types::TransitGatewayRegistration)? = nil
        )
        end
      end

      struct GetTransitGatewayRouteTableAttachmentRequest
        include JSON::Serializable

        # The ID of the transit gateway route table attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct GetTransitGatewayRouteTableAttachmentResponse
        include JSON::Serializable

        # Returns information about the transit gateway route table attachment.
        @[JSON::Field(key: "TransitGatewayRouteTableAttachment")]
        getter transit_gateway_route_table_attachment : Types::TransitGatewayRouteTableAttachment?

        def initialize(
          @transit_gateway_route_table_attachment : Types::TransitGatewayRouteTableAttachment? = nil
        )
        end
      end

      struct GetVpcAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct GetVpcAttachmentResponse
        include JSON::Serializable

        # Returns details about a VPC attachment.
        @[JSON::Field(key: "VpcAttachment")]
        getter vpc_attachment : Types::VpcAttachment?

        def initialize(
          @vpc_attachment : Types::VpcAttachment? = nil
        )
        end
      end

      # Describes a global network. This is a single private network acting as a high-level container for
      # your network objects, including an Amazon Web Services-managed Core Network.
      struct GlobalNetwork
        include JSON::Serializable

        # The date and time that the global network was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the global network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the global network.
        @[JSON::Field(key: "GlobalNetworkArn")]
        getter global_network_arn : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The state of the global network.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags for the global network.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @global_network_arn : String? = nil,
          @global_network_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The request has failed due to an internal error.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Indicates when to retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Describes a link.
      struct Link
        include JSON::Serializable

        # The bandwidth for the link.
        @[JSON::Field(key: "Bandwidth")]
        getter bandwidth : Types::Bandwidth?

        # The date and time that the link was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the link.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The Amazon Resource Name (ARN) of the link.
        @[JSON::Field(key: "LinkArn")]
        getter link_arn : String?

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The provider of the link.
        @[JSON::Field(key: "Provider")]
        getter provider : String?

        # The ID of the site.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The state of the link.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags for the link.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The type of the link.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @bandwidth : Types::Bandwidth? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @global_network_id : String? = nil,
          @link_arn : String? = nil,
          @link_id : String? = nil,
          @provider : String? = nil,
          @site_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the association between a device and a link.
      struct LinkAssociation
        include JSON::Serializable

        # The device ID for the link association.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The state of the association.
        @[JSON::Field(key: "LinkAssociationState")]
        getter link_association_state : String?

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        def initialize(
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @link_association_state : String? = nil,
          @link_id : String? = nil
        )
        end
      end

      struct ListAttachmentRoutingPolicyAssociationsRequest
        include JSON::Serializable

        # The ID of the core network to list attachment routing policy associations for.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ID of a specific attachment to filter the routing policy associations.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The maximum number of results to return in a single page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_network_id : String,
          @attachment_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAttachmentRoutingPolicyAssociationsResponse
        include JSON::Serializable

        # The list of attachment routing policy associations.
        @[JSON::Field(key: "AttachmentRoutingPolicyAssociations")]
        getter attachment_routing_policy_associations : Array(Types::AttachmentRoutingPolicyAssociationSummary)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attachment_routing_policy_associations : Array(Types::AttachmentRoutingPolicyAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAttachmentsRequest
        include JSON::Serializable

        # The type of attachment.
        @[JSON::Field(key: "attachmentType")]
        getter attachment_type : String?

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # The Region where the edge is located.
        @[JSON::Field(key: "edgeLocation")]
        getter edge_location : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The state of the attachment.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @attachment_type : String? = nil,
          @core_network_id : String? = nil,
          @edge_location : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListAttachmentsResponse
        include JSON::Serializable

        # Describes the list of attachments.
        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::Attachment)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attachments : Array(Types::Attachment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectPeersRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "connectAttachmentId")]
        getter connect_attachment_id : String?

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connect_attachment_id : String? = nil,
          @core_network_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectPeersResponse
        include JSON::Serializable

        # Describes the Connect peers.
        @[JSON::Field(key: "ConnectPeers")]
        getter connect_peers : Array(Types::ConnectPeerSummary)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connect_peers : Array(Types::ConnectPeerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworkPolicyVersionsRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworkPolicyVersionsResponse
        include JSON::Serializable

        # Describes core network policy versions.
        @[JSON::Field(key: "CoreNetworkPolicyVersions")]
        getter core_network_policy_versions : Array(Types::CoreNetworkPolicyVersion)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_network_policy_versions : Array(Types::CoreNetworkPolicyVersion)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworkPrefixListAssociationsRequest
        include JSON::Serializable

        # The ID of the core network to list prefix list associations for.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The maximum number of results to return in a single page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of a specific prefix list to filter the associations.
        @[JSON::Field(key: "prefixListArn")]
        getter prefix_list_arn : String?

        def initialize(
          @core_network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefix_list_arn : String? = nil
        )
        end
      end

      struct ListCoreNetworkPrefixListAssociationsResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of prefix list associations for the core network.
        @[JSON::Field(key: "PrefixListAssociations")]
        getter prefix_list_associations : Array(Types::PrefixListAssociation)?

        def initialize(
          @next_token : String? = nil,
          @prefix_list_associations : Array(Types::PrefixListAssociation)? = nil
        )
        end
      end

      struct ListCoreNetworkRoutingInformationRequest
        include JSON::Serializable

        # The ID of the core network to retrieve routing information for.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The edge location to filter routing information by.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String

        # The name of the segment to filter routing information by.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String

        # BGP community values to match when filtering routing information.
        @[JSON::Field(key: "CommunityMatches")]
        getter community_matches : Array(String)?

        # Exact AS path values to match when filtering routing information.
        @[JSON::Field(key: "ExactAsPathMatches")]
        getter exact_as_path_matches : Array(String)?

        # Local preference values to match when filtering routing information.
        @[JSON::Field(key: "LocalPreferenceMatches")]
        getter local_preference_matches : Array(String)?

        # The maximum number of routing information entries to return in a single page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Multi-Exit Discriminator (MED) values to match when filtering routing information.
        @[JSON::Field(key: "MedMatches")]
        getter med_matches : Array(String)?

        # Filters to apply based on next hop information.
        @[JSON::Field(key: "NextHopFilters")]
        getter next_hop_filters : Hash(String, Array(String))?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @core_network_id : String,
          @edge_location : String,
          @segment_name : String,
          @community_matches : Array(String)? = nil,
          @exact_as_path_matches : Array(String)? = nil,
          @local_preference_matches : Array(String)? = nil,
          @max_results : Int32? = nil,
          @med_matches : Array(String)? = nil,
          @next_hop_filters : Hash(String, Array(String))? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworkRoutingInformationResponse
        include JSON::Serializable

        # The list of routing information for the core network.
        @[JSON::Field(key: "CoreNetworkRoutingInformation")]
        getter core_network_routing_information : Array(Types::CoreNetworkRoutingInformation)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_network_routing_information : Array(Types::CoreNetworkRoutingInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworksRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCoreNetworksResponse
        include JSON::Serializable

        # Describes the list of core networks.
        @[JSON::Field(key: "CoreNetworks")]
        getter core_networks : Array(Types::CoreNetworkSummary)?

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @core_networks : Array(Types::CoreNetworkSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationServiceAccessStatusRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationServiceAccessStatusResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Displays the status of an Amazon Web Services Organization.
        @[JSON::Field(key: "OrganizationStatus")]
        getter organization_status : Types::OrganizationStatus?

        def initialize(
          @next_token : String? = nil,
          @organization_status : Types::OrganizationStatus? = nil
        )
        end
      end

      struct ListPeeringsRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String?

        # Returns a list edge locations for the
        @[JSON::Field(key: "edgeLocation")]
        getter edge_location : String?

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Returns a list of a peering requests.
        @[JSON::Field(key: "peeringType")]
        getter peering_type : String?

        # Returns a list of the peering request states.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @core_network_id : String? = nil,
          @edge_location : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @peering_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListPeeringsResponse
        include JSON::Serializable

        # The token for the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists the transit gateway peerings for the ListPeerings request.
        @[JSON::Field(key: "Peerings")]
        getter peerings : Array(Types::Peering)?

        def initialize(
          @next_token : String? = nil,
          @peerings : Array(Types::Peering)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a location.
      struct Location
        include JSON::Serializable

        # The physical address.
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The latitude.
        @[JSON::Field(key: "Latitude")]
        getter latitude : String?

        # The longitude.
        @[JSON::Field(key: "Longitude")]
        getter longitude : String?

        def initialize(
          @address : String? = nil,
          @latitude : String? = nil,
          @longitude : String? = nil
        )
        end
      end

      # Describes a network function group for service insertion.
      struct NetworkFunctionGroup
        include JSON::Serializable

        # The name of the network function group.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Describes a network resource.
      struct NetworkResource
        include JSON::Serializable

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # Information about the resource, in JSON format. Network Manager gets this information by describing
        # the resource using its Describe API call.
        @[JSON::Field(key: "Definition")]
        getter definition : String?

        # The time that the resource definition was retrieved.
        @[JSON::Field(key: "DefinitionTimestamp")]
        getter definition_timestamp : Time?

        # The resource metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # The ARN of the gateway.
        @[JSON::Field(key: "RegisteredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type. The following are the supported resource types for Direct Connect: dxcon
        # dx-gateway dx-vif The following are the supported resource types for Network Manager: attachment
        # connect-peer connection core-network device link peering site The following are the supported
        # resource types for Amazon VPC: customer-gateway transit-gateway transit-gateway-attachment
        # transit-gateway-connect-peer transit-gateway-route-table vpn-connection
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String? = nil,
          @aws_region : String? = nil,
          @core_network_id : String? = nil,
          @definition : String? = nil,
          @definition_timestamp : Time? = nil,
          @metadata : Hash(String, String)? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a resource count.
      struct NetworkResourceCount
        include JSON::Serializable

        # The resource count.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @count : Int32? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a network resource.
      struct NetworkResourceSummary
        include JSON::Serializable

        # Information about the resource, in JSON format. Network Manager gets this information by describing
        # the resource using its Describe API call.
        @[JSON::Field(key: "Definition")]
        getter definition : String?

        # Indicates whether this is a middlebox appliance.
        @[JSON::Field(key: "IsMiddlebox")]
        getter is_middlebox : Bool?

        # The value for the Name tag.
        @[JSON::Field(key: "NameTag")]
        getter name_tag : String?

        # The ARN of the gateway.
        @[JSON::Field(key: "RegisteredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @definition : String? = nil,
          @is_middlebox : Bool? = nil,
          @name_tag : String? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a network route.
      struct NetworkRoute
        include JSON::Serializable

        # A unique identifier for the route, such as a CIDR block.
        @[JSON::Field(key: "DestinationCidrBlock")]
        getter destination_cidr_block : String?

        # The destinations.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::NetworkRouteDestination)?

        # The ID of the prefix list.
        @[JSON::Field(key: "PrefixListId")]
        getter prefix_list_id : String?

        # The route state. The possible values are active and blackhole .
        @[JSON::Field(key: "State")]
        getter state : String?

        # The route type. The possible values are propagated and static .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @destination_cidr_block : String? = nil,
          @destinations : Array(Types::NetworkRouteDestination)? = nil,
          @prefix_list_id : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the destination of a network route.
      struct NetworkRouteDestination
        include JSON::Serializable

        # The ID of a core network attachment.
        @[JSON::Field(key: "CoreNetworkAttachmentId")]
        getter core_network_attachment_id : String?

        # The edge location for the network destination.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The network function group name associated with the destination.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The name of the segment.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        # The ID of the transit gateway attachment.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String?

        def initialize(
          @core_network_attachment_id : String? = nil,
          @edge_location : String? = nil,
          @network_function_group_name : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @segment_name : String? = nil,
          @transit_gateway_attachment_id : String? = nil
        )
        end
      end

      # Describes the telemetry information for a resource.
      struct NetworkTelemetry
        include JSON::Serializable

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The address.
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The ID of a core network.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The connection health.
        @[JSON::Field(key: "Health")]
        getter health : Types::ConnectionHealth?

        # The ARN of the gateway.
        @[JSON::Field(key: "RegisteredGatewayArn")]
        getter registered_gateway_arn : String?

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @account_id : String? = nil,
          @address : String? = nil,
          @aws_region : String? = nil,
          @core_network_id : String? = nil,
          @health : Types::ConnectionHealth? = nil,
          @registered_gateway_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The status of an Amazon Web Services Organization and the accounts within that organization.
      struct OrganizationStatus
        include JSON::Serializable

        # The current service-linked role (SLR) deployment status for an Amazon Web Services Organization's
        # accounts. This will be either SUCCEEDED or IN_PROGRESS .
        @[JSON::Field(key: "AccountStatusList")]
        getter account_status_list : Array(Types::AccountStatus)?

        # The status of the organization's AWS service access. This will be ENABLED or DISABLED .
        @[JSON::Field(key: "OrganizationAwsServiceAccessStatus")]
        getter organization_aws_service_access_status : String?

        # The ID of an Amazon Web Services Organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The status of the SLR deployment for the account. This will be either SUCCEEDED or IN_PROGRESS .
        @[JSON::Field(key: "SLRDeploymentStatus")]
        getter slr_deployment_status : String?

        def initialize(
          @account_status_list : Array(Types::AccountStatus)? = nil,
          @organization_aws_service_access_status : String? = nil,
          @organization_id : String? = nil,
          @slr_deployment_status : String? = nil
        )
        end
      end

      # Describes a path component.
      struct PathComponent
        include JSON::Serializable

        # The destination CIDR block in the route table.
        @[JSON::Field(key: "DestinationCidrBlock")]
        getter destination_cidr_block : String?

        # The resource.
        @[JSON::Field(key: "Resource")]
        getter resource : Types::NetworkResourceSummary?

        # The sequence number in the path. The destination is 0.
        @[JSON::Field(key: "Sequence")]
        getter sequence : Int32?

        def initialize(
          @destination_cidr_block : String? = nil,
          @resource : Types::NetworkResourceSummary? = nil,
          @sequence : Int32? = nil
        )
        end
      end

      # Describes a peering connection.
      struct Peering
        include JSON::Serializable

        # The ARN of a core network.
        @[JSON::Field(key: "CoreNetworkArn")]
        getter core_network_arn : String?

        # The ID of the core network for the peering request.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The timestamp when the attachment peer was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The edge location for the peer.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # Describes the error associated with the Connect peer request.
        @[JSON::Field(key: "LastModificationErrors")]
        getter last_modification_errors : Array(Types::PeeringError)?

        # The ID of the account owner.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The ID of the peering attachment.
        @[JSON::Field(key: "PeeringId")]
        getter peering_id : String?

        # The type of peering. This will be TRANSIT_GATEWAY .
        @[JSON::Field(key: "PeeringType")]
        getter peering_type : String?

        # The resource ARN of the peer.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The current state of the peering connection.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The list of key-value tags associated with the peering.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @core_network_arn : String? = nil,
          @core_network_id : String? = nil,
          @created_at : Time? = nil,
          @edge_location : String? = nil,
          @last_modification_errors : Array(Types::PeeringError)? = nil,
          @owner_account_id : String? = nil,
          @peering_id : String? = nil,
          @peering_type : String? = nil,
          @resource_arn : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an error associated with a peering request.
      struct PeeringError
        include JSON::Serializable

        # The error code for the peering request.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message associated with the error code .
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Provides additional information about missing permissions for the peering error.
        @[JSON::Field(key: "MissingPermissionsContext")]
        getter missing_permissions_context : Types::PermissionsErrorContext?

        # The ID of the Peering request.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The ARN of the requested peering resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @missing_permissions_context : Types::PermissionsErrorContext? = nil,
          @request_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Describes additional information about missing permissions.
      struct PermissionsErrorContext
        include JSON::Serializable

        # The missing permissions.
        @[JSON::Field(key: "MissingPermission")]
        getter missing_permission : String?

        def initialize(
          @missing_permission : String? = nil
        )
        end
      end

      # Information about a prefix list association with a core network.
      struct PrefixListAssociation
        include JSON::Serializable

        # The core network id in the association.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The alias of the prefix list in the association.
        @[JSON::Field(key: "PrefixListAlias")]
        getter prefix_list_alias : String?

        # The ARN of the prefix list in the association.
        @[JSON::Field(key: "PrefixListArn")]
        getter prefix_list_arn : String?

        def initialize(
          @core_network_id : String? = nil,
          @prefix_list_alias : String? = nil,
          @prefix_list_arn : String? = nil
        )
        end
      end

      # Describes proposed changes to a network function group.
      struct ProposedNetworkFunctionGroupChange
        include JSON::Serializable

        # The proposed new attachment policy rule number for the network function group.
        @[JSON::Field(key: "AttachmentPolicyRuleNumber")]
        getter attachment_policy_rule_number : Int32?

        # The proposed name change for the network function group name.
        @[JSON::Field(key: "NetworkFunctionGroupName")]
        getter network_function_group_name : String?

        # The list of proposed changes to the key-value tags associated with the network function group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @attachment_policy_rule_number : Int32? = nil,
          @network_function_group_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a proposed segment change. In some cases, the segment change must first be evaluated and
      # accepted.
      struct ProposedSegmentChange
        include JSON::Serializable

        # The rule number in the policy document that applies to this change.
        @[JSON::Field(key: "AttachmentPolicyRuleNumber")]
        getter attachment_policy_rule_number : Int32?

        # The name of the segment to change.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        # The list of key-value tags that changed for the segment.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @attachment_policy_rule_number : Int32? = nil,
          @segment_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutAttachmentRoutingPolicyLabelRequest
        include JSON::Serializable

        # The ID of the attachment to apply the routing policy label to.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String

        # The ID of the core network containing the attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String

        # The routing policy label to apply to the attachment.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @attachment_id : String,
          @core_network_id : String,
          @routing_policy_label : String,
          @client_token : String? = nil
        )
        end
      end

      struct PutAttachmentRoutingPolicyLabelResponse
        include JSON::Serializable

        # The ID of the attachment that received the routing policy label.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The ID of the core network containing the attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The routing policy label that was applied to the attachment.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        def initialize(
          @attachment_id : String? = nil,
          @core_network_id : String? = nil,
          @routing_policy_label : String? = nil
        )
        end
      end

      struct PutCoreNetworkPolicyRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The policy document.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The client token associated with the request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # a core network policy description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of a core network policy.
        @[JSON::Field(key: "LatestVersionId")]
        getter latest_version_id : Int32?

        def initialize(
          @core_network_id : String,
          @policy_document : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @latest_version_id : Int32? = nil
        )
        end
      end

      struct PutCoreNetworkPolicyResponse
        include JSON::Serializable

        # Describes the changed core network policy.
        @[JSON::Field(key: "CoreNetworkPolicy")]
        getter core_network_policy : Types::CoreNetworkPolicy?

        def initialize(
          @core_network_policy : Types::CoreNetworkPolicy? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The JSON resource policy document.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The ARN of the resource policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_document : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct RegisterTransitGatewayRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Resource Name (ARN) of the transit gateway.
        @[JSON::Field(key: "TransitGatewayArn")]
        getter transit_gateway_arn : String

        def initialize(
          @global_network_id : String,
          @transit_gateway_arn : String
        )
        end
      end

      struct RegisterTransitGatewayResponse
        include JSON::Serializable

        # Information about the transit gateway registration.
        @[JSON::Field(key: "TransitGatewayRegistration")]
        getter transit_gateway_registration : Types::TransitGatewayRegistration?

        def initialize(
          @transit_gateway_registration : Types::TransitGatewayRegistration? = nil
        )
        end
      end

      struct RejectAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      struct RejectAttachmentResponse
        include JSON::Serializable

        # Describes the rejected attachment request.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        def initialize(
          @attachment : Types::Attachment? = nil
        )
        end
      end

      # Describes a resource relationship.
      struct Relationship
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "From")]
        getter from : String?

        # The ARN of the resource.
        @[JSON::Field(key: "To")]
        getter to : String?

        def initialize(
          @from : String? = nil,
          @to : String? = nil
        )
        end
      end

      struct RemoveAttachmentRoutingPolicyLabelRequest
        include JSON::Serializable

        # The ID of the attachment to remove the routing policy label from.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # The ID of the core network containing the attachment.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        def initialize(
          @attachment_id : String,
          @core_network_id : String
        )
        end
      end

      struct RemoveAttachmentRoutingPolicyLabelResponse
        include JSON::Serializable

        # The ID of the attachment from which the routing policy label was removed.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The ID of the core network containing the attachment.
        @[JSON::Field(key: "CoreNetworkId")]
        getter core_network_id : String?

        # The routing policy label that was removed from the attachment.
        @[JSON::Field(key: "RoutingPolicyLabel")]
        getter routing_policy_label : String?

        def initialize(
          @attachment_id : String? = nil,
          @core_network_id : String? = nil,
          @routing_policy_label : String? = nil
        )
        end
      end

      # The specified resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The specified resource could not be found.
        @[JSON::Field(key: "Context")]
        getter context : Hash(String, String)?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @context : Hash(String, String)? = nil
        )
        end
      end

      struct RestoreCoreNetworkPolicyVersionRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The ID of the policy version to restore.
        @[JSON::Field(key: "policyVersionId")]
        getter policy_version_id : Int32

        def initialize(
          @core_network_id : String,
          @policy_version_id : Int32
        )
        end
      end

      struct RestoreCoreNetworkPolicyVersionResponse
        include JSON::Serializable

        # Describes the restored core network policy.
        @[JSON::Field(key: "CoreNetworkPolicy")]
        getter core_network_policy : Types::CoreNetworkPolicy?

        def initialize(
          @core_network_policy : Types::CoreNetworkPolicy? = nil
        )
        end
      end

      # Describes a route analysis.
      struct RouteAnalysis
        include JSON::Serializable

        # The destination.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::RouteAnalysisEndpointOptions?

        # The forward path.
        @[JSON::Field(key: "ForwardPath")]
        getter forward_path : Types::RouteAnalysisPath?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # Indicates whether to analyze the return path. The return path is not analyzed if the forward path
        # analysis does not succeed.
        @[JSON::Field(key: "IncludeReturnPath")]
        getter include_return_path : Bool?

        # The ID of the AWS account that created the route analysis.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The return path.
        @[JSON::Field(key: "ReturnPath")]
        getter return_path : Types::RouteAnalysisPath?

        # The ID of the route analysis.
        @[JSON::Field(key: "RouteAnalysisId")]
        getter route_analysis_id : String?

        # The source.
        @[JSON::Field(key: "Source")]
        getter source : Types::RouteAnalysisEndpointOptions?

        # The time that the analysis started.
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        # The status of the route analysis.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates whether to include the location of middlebox appliances in the route analysis.
        @[JSON::Field(key: "UseMiddleboxes")]
        getter use_middleboxes : Bool?

        def initialize(
          @destination : Types::RouteAnalysisEndpointOptions? = nil,
          @forward_path : Types::RouteAnalysisPath? = nil,
          @global_network_id : String? = nil,
          @include_return_path : Bool? = nil,
          @owner_account_id : String? = nil,
          @return_path : Types::RouteAnalysisPath? = nil,
          @route_analysis_id : String? = nil,
          @source : Types::RouteAnalysisEndpointOptions? = nil,
          @start_timestamp : Time? = nil,
          @status : String? = nil,
          @use_middleboxes : Bool? = nil
        )
        end
      end

      # Describes the status of an analysis at completion.
      struct RouteAnalysisCompletion
        include JSON::Serializable

        # The reason code. Available only if a connection is not found. BLACKHOLE_ROUTE_FOR_DESTINATION_FOUND
        # - Found a black hole route with the destination CIDR block. CYCLIC_PATH_DETECTED - Found the same
        # resource multiple times while traversing the path. INACTIVE_ROUTE_FOR_DESTINATION_FOUND - Found an
        # inactive route with the destination CIDR block. MAX_HOPS_EXCEEDED - Analysis exceeded 64 hops
        # without finding the destination. ROUTE_NOT_FOUND - Cannot find a route table with the destination
        # CIDR block. TGW_ATTACH_ARN_NO_MATCH - Found an attachment, but not with the correct destination ARN.
        # TGW_ATTACH_NOT_FOUND - Cannot find an attachment. TGW_ATTACH_NOT_IN_TGW - Found an attachment, but
        # not to the correct transit gateway. TGW_ATTACH_STABLE_ROUTE_TABLE_NOT_FOUND - The state of the route
        # table association is not associated.
        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # Additional information about the path. Available only if a connection is not found.
        @[JSON::Field(key: "ReasonContext")]
        getter reason_context : Hash(String, String)?

        # The result of the analysis. If the status is NOT_CONNECTED , check the reason code.
        @[JSON::Field(key: "ResultCode")]
        getter result_code : String?

        def initialize(
          @reason_code : String? = nil,
          @reason_context : Hash(String, String)? = nil,
          @result_code : String? = nil
        )
        end
      end

      # Describes a source or a destination.
      struct RouteAnalysisEndpointOptions
        include JSON::Serializable

        # The IP address.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The ARN of the transit gateway.
        @[JSON::Field(key: "TransitGatewayArn")]
        getter transit_gateway_arn : String?

        # The ARN of the transit gateway attachment.
        @[JSON::Field(key: "TransitGatewayAttachmentArn")]
        getter transit_gateway_attachment_arn : String?

        def initialize(
          @ip_address : String? = nil,
          @transit_gateway_arn : String? = nil,
          @transit_gateway_attachment_arn : String? = nil
        )
        end
      end

      # Describes a source or a destination.
      struct RouteAnalysisEndpointOptionsSpecification
        include JSON::Serializable

        # The IP address.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The ARN of the transit gateway attachment.
        @[JSON::Field(key: "TransitGatewayAttachmentArn")]
        getter transit_gateway_attachment_arn : String?

        def initialize(
          @ip_address : String? = nil,
          @transit_gateway_attachment_arn : String? = nil
        )
        end
      end

      # Describes a route analysis path.
      struct RouteAnalysisPath
        include JSON::Serializable

        # The status of the analysis at completion.
        @[JSON::Field(key: "CompletionStatus")]
        getter completion_status : Types::RouteAnalysisCompletion?

        # The route analysis path.
        @[JSON::Field(key: "Path")]
        getter path : Array(Types::PathComponent)?

        def initialize(
          @completion_status : Types::RouteAnalysisCompletion? = nil,
          @path : Array(Types::PathComponent)? = nil
        )
        end
      end

      # Describes a route table.
      struct RouteTableIdentifier
        include JSON::Serializable

        # The route table identifier associated with the network function group.
        @[JSON::Field(key: "CoreNetworkNetworkFunctionGroup")]
        getter core_network_network_function_group : Types::CoreNetworkNetworkFunctionGroupIdentifier?

        # The segment edge in a core network.
        @[JSON::Field(key: "CoreNetworkSegmentEdge")]
        getter core_network_segment_edge : Types::CoreNetworkSegmentEdgeIdentifier?

        # The ARN of the transit gateway route table for the attachment request. For example,
        # "TransitGatewayRouteTableArn":
        # "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456" .
        @[JSON::Field(key: "TransitGatewayRouteTableArn")]
        getter transit_gateway_route_table_arn : String?

        def initialize(
          @core_network_network_function_group : Types::CoreNetworkNetworkFunctionGroupIdentifier? = nil,
          @core_network_segment_edge : Types::CoreNetworkSegmentEdgeIdentifier? = nil,
          @transit_gateway_route_table_arn : String? = nil
        )
        end
      end

      # Information about the next hop for a route in the core network.
      struct RoutingInformationNextHop
        include JSON::Serializable

        # The ID of the core network attachment for the next hop.
        @[JSON::Field(key: "CoreNetworkAttachmentId")]
        getter core_network_attachment_id : String?

        # The edge location for the next hop.
        @[JSON::Field(key: "EdgeLocation")]
        getter edge_location : String?

        # The IP address of the next hop.
        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The ID of the resource for the next hop.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of resource for the next hop.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The name of the segment for the next hop.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        def initialize(
          @core_network_attachment_id : String? = nil,
          @edge_location : String? = nil,
          @ip_address : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @segment_name : String? = nil
        )
        end
      end

      # Information about a routing policy association.
      struct RoutingPolicyAssociationDetail
        include JSON::Serializable

        # The names of the routing policies in the association.
        @[JSON::Field(key: "RoutingPolicyNames")]
        getter routing_policy_names : Array(String)?

        # The names of the segments that are shared with each other in the association.
        @[JSON::Field(key: "SharedSegments")]
        getter shared_segments : Array(String)?

        def initialize(
          @routing_policy_names : Array(String)? = nil,
          @shared_segments : Array(String)? = nil
        )
        end
      end

      # Describes the action that the service insertion will take for any segments associated with it.
      struct ServiceInsertionAction
        include JSON::Serializable

        # The action the service insertion takes for traffic. send-via sends east-west traffic between
        # attachments. send-to sends north-south traffic to the security appliance, and then from that to
        # either the Internet or to an on-premesis location.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Describes the mode packets take for the send-via action. This is not used when the action is send-to
        # . dual-hop packets traverse attachments in both the source to the destination core network edges.
        # This mode requires that an inspection attachment must be present in all Regions of the service
        # insertion-enabled segments. For single-hop , packets traverse a single intermediate inserted
        # attachment. You can use EdgeOverride to specify a specific edge to use.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The list of network function groups and any edge overrides for the chosen service insertion action.
        # Used for both send-to or send-via .
        @[JSON::Field(key: "Via")]
        getter via : Types::Via?

        # The list of destination segments if the service insertion action is send-via .
        @[JSON::Field(key: "WhenSentTo")]
        getter when_sent_to : Types::WhenSentTo?

        def initialize(
          @action : String? = nil,
          @mode : String? = nil,
          @via : Types::Via? = nil,
          @when_sent_to : Types::WhenSentTo? = nil
        )
        end
      end

      # Describes the segments associated with the service insertion action.
      struct ServiceInsertionSegments
        include JSON::Serializable

        # The list of segments associated with the send-to action.
        @[JSON::Field(key: "SendTo")]
        getter send_to : Array(String)?

        # The list of segments associated with the send-via action.
        @[JSON::Field(key: "SendVia")]
        getter send_via : Array(String)?

        def initialize(
          @send_to : Array(String)? = nil,
          @send_via : Array(String)? = nil
        )
        end
      end

      # A service limit was exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The limit code.
        @[JSON::Field(key: "LimitCode")]
        getter limit_code : String

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The service code.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @limit_code : String,
          @message : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a site.
      struct Site
        include JSON::Serializable

        # The date and time that the site was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The description of the site.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The location of the site.
        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        # The Amazon Resource Name (ARN) of the site.
        @[JSON::Field(key: "SiteArn")]
        getter site_arn : String?

        # The ID of the site.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The state of the site.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags for the site.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @global_network_id : String? = nil,
          @location : Types::Location? = nil,
          @site_arn : String? = nil,
          @site_id : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Creates a site-to-site VPN attachment.
      struct SiteToSiteVpnAttachment
        include JSON::Serializable

        # Provides details about a site-to-site VPN attachment.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # The ARN of the site-to-site VPN attachment.
        @[JSON::Field(key: "VpnConnectionArn")]
        getter vpn_connection_arn : String?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @vpn_connection_arn : String? = nil
        )
        end
      end

      struct StartOrganizationServiceAccessUpdateRequest
        include JSON::Serializable

        # The action to take for the update request. This can be either ENABLE or DISABLE .
        @[JSON::Field(key: "Action")]
        getter action : String

        def initialize(
          @action : String
        )
        end
      end

      struct StartOrganizationServiceAccessUpdateResponse
        include JSON::Serializable

        # The status of the service access update request for an Amazon Web Services Organization.
        @[JSON::Field(key: "OrganizationStatus")]
        getter organization_status : Types::OrganizationStatus?

        def initialize(
          @organization_status : Types::OrganizationStatus? = nil
        )
        end
      end

      struct StartRouteAnalysisRequest
        include JSON::Serializable

        # The destination.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::RouteAnalysisEndpointOptionsSpecification

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The source from which traffic originates.
        @[JSON::Field(key: "Source")]
        getter source : Types::RouteAnalysisEndpointOptionsSpecification

        # Indicates whether to analyze the return path. The default is false .
        @[JSON::Field(key: "IncludeReturnPath")]
        getter include_return_path : Bool?

        # Indicates whether to include the location of middlebox appliances in the route analysis. The default
        # is false .
        @[JSON::Field(key: "UseMiddleboxes")]
        getter use_middleboxes : Bool?

        def initialize(
          @destination : Types::RouteAnalysisEndpointOptionsSpecification,
          @global_network_id : String,
          @source : Types::RouteAnalysisEndpointOptionsSpecification,
          @include_return_path : Bool? = nil,
          @use_middleboxes : Bool? = nil
        )
        end
      end

      struct StartRouteAnalysisResponse
        include JSON::Serializable

        # The route analysis.
        @[JSON::Field(key: "RouteAnalysis")]
        getter route_analysis : Types::RouteAnalysis?

        def initialize(
          @route_analysis : Types::RouteAnalysis? = nil
        )
        end
      end

      # Describes a tag.
      struct Tag
        include JSON::Serializable

        # The tag key. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag value. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to apply to the specified resource.
        @[JSON::Field(key: "Tags")]
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Indicates when to retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Describes a transit gateway Connect peer association.
      struct TransitGatewayConnectPeerAssociation
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The ID of the link.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The state of the association.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The Amazon Resource Name (ARN) of the transit gateway Connect peer.
        @[JSON::Field(key: "TransitGatewayConnectPeerArn")]
        getter transit_gateway_connect_peer_arn : String?

        def initialize(
          @device_id : String? = nil,
          @global_network_id : String? = nil,
          @link_id : String? = nil,
          @state : String? = nil,
          @transit_gateway_connect_peer_arn : String? = nil
        )
        end
      end

      # Describes a transit gateway peering attachment.
      struct TransitGatewayPeering
        include JSON::Serializable

        # Describes a transit gateway peer connection.
        @[JSON::Field(key: "Peering")]
        getter peering : Types::Peering?

        # The ARN of the transit gateway.
        @[JSON::Field(key: "TransitGatewayArn")]
        getter transit_gateway_arn : String?

        # The ID of the transit gateway peering attachment.
        @[JSON::Field(key: "TransitGatewayPeeringAttachmentId")]
        getter transit_gateway_peering_attachment_id : String?

        def initialize(
          @peering : Types::Peering? = nil,
          @transit_gateway_arn : String? = nil,
          @transit_gateway_peering_attachment_id : String? = nil
        )
        end
      end

      # Describes the registration of a transit gateway to a global network.
      struct TransitGatewayRegistration
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "GlobalNetworkId")]
        getter global_network_id : String?

        # The state of the transit gateway registration.
        @[JSON::Field(key: "State")]
        getter state : Types::TransitGatewayRegistrationStateReason?

        # The Amazon Resource Name (ARN) of the transit gateway.
        @[JSON::Field(key: "TransitGatewayArn")]
        getter transit_gateway_arn : String?

        def initialize(
          @global_network_id : String? = nil,
          @state : Types::TransitGatewayRegistrationStateReason? = nil,
          @transit_gateway_arn : String? = nil
        )
        end
      end

      # Describes the status of a transit gateway registration.
      struct TransitGatewayRegistrationStateReason
        include JSON::Serializable

        # The code for the state reason.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message for the state reason.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes a transit gateway route table attachment.
      struct TransitGatewayRouteTableAttachment
        include JSON::Serializable

        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # The ID of the peering attachment.
        @[JSON::Field(key: "PeeringId")]
        getter peering_id : String?

        # The ARN of the transit gateway attachment route table. For example, "TransitGatewayRouteTableArn":
        # "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456" .
        @[JSON::Field(key: "TransitGatewayRouteTableArn")]
        getter transit_gateway_route_table_arn : String?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @peering_id : String? = nil,
          @transit_gateway_route_table_arn : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to remove from the specified resource.
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

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link for the second device in the connection.
        @[JSON::Field(key: "ConnectedLinkId")]
        getter connected_link_id : String?

        # A description of the connection. Length Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the link for the first device in the connection.
        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        def initialize(
          @connection_id : String,
          @global_network_id : String,
          @connected_link_id : String? = nil,
          @description : String? = nil,
          @link_id : String? = nil
        )
        end
      end

      struct UpdateConnectionResponse
        include JSON::Serializable

        # Information about the connection.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      struct UpdateCoreNetworkRequest
        include JSON::Serializable

        # The ID of a core network.
        @[JSON::Field(key: "coreNetworkId")]
        getter core_network_id : String

        # The description of the update.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @core_network_id : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateCoreNetworkResponse
        include JSON::Serializable

        # Returns information about a core network update.
        @[JSON::Field(key: "CoreNetwork")]
        getter core_network : Types::CoreNetwork?

        def initialize(
          @core_network : Types::CoreNetwork? = nil
        )
        end
      end

      struct UpdateDeviceRequest
        include JSON::Serializable

        # The ID of the device.
        @[JSON::Field(key: "deviceId")]
        getter device_id : String

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The Amazon Web Services location of the device, if applicable. For an on-premises device, you can
        # omit this parameter.
        @[JSON::Field(key: "AWSLocation")]
        getter aws_location : Types::AWSLocation?

        # A description of the device. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        # The model of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Model")]
        getter model : String?

        # The serial number of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The ID of the site.
        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The type of the device.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The vendor of the device. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Vendor")]
        getter vendor : String?

        def initialize(
          @device_id : String,
          @global_network_id : String,
          @aws_location : Types::AWSLocation? = nil,
          @description : String? = nil,
          @location : Types::Location? = nil,
          @model : String? = nil,
          @serial_number : String? = nil,
          @site_id : String? = nil,
          @type : String? = nil,
          @vendor : String? = nil
        )
        end
      end

      struct UpdateDeviceResponse
        include JSON::Serializable

        # Information about the device.
        @[JSON::Field(key: "Device")]
        getter device : Types::Device?

        def initialize(
          @device : Types::Device? = nil
        )
        end
      end

      struct UpdateDirectConnectGatewayAttachmentRequest
        include JSON::Serializable

        # The ID of the Direct Connect gateway attachment for the updated edge locations.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # One or more edge locations to update for the Direct Connect gateway attachment. The updated array of
        # edge locations overwrites the previous array of locations. EdgeLocations is only used for Direct
        # Connect gateway attachments.
        @[JSON::Field(key: "EdgeLocations")]
        getter edge_locations : Array(String)?

        def initialize(
          @attachment_id : String,
          @edge_locations : Array(String)? = nil
        )
        end
      end

      struct UpdateDirectConnectGatewayAttachmentResponse
        include JSON::Serializable

        # Returns details of the Direct Connect gateway attachment with the updated edge locations.
        @[JSON::Field(key: "DirectConnectGatewayAttachment")]
        getter direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment?

        def initialize(
          @direct_connect_gateway_attachment : Types::DirectConnectGatewayAttachment? = nil
        )
        end
      end

      struct UpdateGlobalNetworkRequest
        include JSON::Serializable

        # The ID of your global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # A description of the global network. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @global_network_id : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateGlobalNetworkResponse
        include JSON::Serializable

        # Information about the global network object.
        @[JSON::Field(key: "GlobalNetwork")]
        getter global_network : Types::GlobalNetwork?

        def initialize(
          @global_network : Types::GlobalNetwork? = nil
        )
        end
      end

      struct UpdateLinkRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of the link.
        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The upload and download speed in Mbps.
        @[JSON::Field(key: "Bandwidth")]
        getter bandwidth : Types::Bandwidth?

        # A description of the link. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The provider of the link. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Provider")]
        getter provider : String?

        # The type of the link. Constraints: Maximum length of 128 characters.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @global_network_id : String,
          @link_id : String,
          @bandwidth : Types::Bandwidth? = nil,
          @description : String? = nil,
          @provider : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateLinkResponse
        include JSON::Serializable

        # Information about the link.
        @[JSON::Field(key: "Link")]
        getter link : Types::Link?

        def initialize(
          @link : Types::Link? = nil
        )
        end
      end

      struct UpdateNetworkResourceMetadataRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The resource metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)

        # The ARN of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @global_network_id : String,
          @metadata : Hash(String, String),
          @resource_arn : String
        )
        end
      end

      struct UpdateNetworkResourceMetadataResponse
        include JSON::Serializable

        # The updated resource metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @metadata : Hash(String, String)? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct UpdateSiteRequest
        include JSON::Serializable

        # The ID of the global network.
        @[JSON::Field(key: "globalNetworkId")]
        getter global_network_id : String

        # The ID of your site.
        @[JSON::Field(key: "siteId")]
        getter site_id : String

        # A description of your site. Constraints: Maximum length of 256 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The site location: Address : The physical address of the site. Latitude : The latitude of the site.
        # Longitude : The longitude of the site.
        @[JSON::Field(key: "Location")]
        getter location : Types::Location?

        def initialize(
          @global_network_id : String,
          @site_id : String,
          @description : String? = nil,
          @location : Types::Location? = nil
        )
        end
      end

      struct UpdateSiteResponse
        include JSON::Serializable

        # Information about the site.
        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end

      struct UpdateVpcAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # Adds a subnet ARN to the VPC attachment.
        @[JSON::Field(key: "AddSubnetArns")]
        getter add_subnet_arns : Array(String)?

        # Additional options for updating the VPC attachment.
        @[JSON::Field(key: "Options")]
        getter options : Types::VpcOptions?

        # Removes a subnet ARN from the attachment.
        @[JSON::Field(key: "RemoveSubnetArns")]
        getter remove_subnet_arns : Array(String)?

        def initialize(
          @attachment_id : String,
          @add_subnet_arns : Array(String)? = nil,
          @options : Types::VpcOptions? = nil,
          @remove_subnet_arns : Array(String)? = nil
        )
        end
      end

      struct UpdateVpcAttachmentResponse
        include JSON::Serializable

        # Describes the updated VPC attachment.
        @[JSON::Field(key: "VpcAttachment")]
        getter vpc_attachment : Types::VpcAttachment?

        def initialize(
          @vpc_attachment : Types::VpcAttachment? = nil
        )
        end
      end

      # The input fails to satisfy the constraints.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The fields that caused the error, if applicable.
        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason for the error.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Describes a validation exception for a field.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message for the field.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The list of network function groups and edge overrides for the service insertion action. Used for
      # both the send-to and send-via actions.
      struct Via
        include JSON::Serializable

        # The list of network function groups associated with the service insertion action.
        @[JSON::Field(key: "NetworkFunctionGroups")]
        getter network_function_groups : Array(Types::NetworkFunctionGroup)?

        # Describes any edge overrides. An edge override is a specific edge to be used for traffic.
        @[JSON::Field(key: "WithEdgeOverrides")]
        getter with_edge_overrides : Array(Types::EdgeOverride)?

        def initialize(
          @network_function_groups : Array(Types::NetworkFunctionGroup)? = nil,
          @with_edge_overrides : Array(Types::EdgeOverride)? = nil
        )
        end
      end

      # Describes a VPC attachment.
      struct VpcAttachment
        include JSON::Serializable

        # Provides details about the VPC attachment.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # Provides details about the VPC attachment.
        @[JSON::Field(key: "Options")]
        getter options : Types::VpcOptions?

        # The subnet ARNs.
        @[JSON::Field(key: "SubnetArns")]
        getter subnet_arns : Array(String)?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @options : Types::VpcOptions? = nil,
          @subnet_arns : Array(String)? = nil
        )
        end
      end

      # Describes the VPC options.
      struct VpcOptions
        include JSON::Serializable

        # Indicates whether appliance mode is supported. If enabled, traffic flow between a source and
        # destination use the same Availability Zone for the VPC attachment for the lifetime of that flow. The
        # default value is false .
        @[JSON::Field(key: "ApplianceModeSupport")]
        getter appliance_mode_support : Bool?

        # Indicates whether DNS is supported.
        @[JSON::Field(key: "DnsSupport")]
        getter dns_support : Bool?

        # Indicates whether IPv6 is supported.
        @[JSON::Field(key: "Ipv6Support")]
        getter ipv6_support : Bool?

        # Indicates whether security group referencing is enabled for this VPC attachment. The default is true
        # . However, at the core network policy-level the default is set to false .
        @[JSON::Field(key: "SecurityGroupReferencingSupport")]
        getter security_group_referencing_support : Bool?

        def initialize(
          @appliance_mode_support : Bool? = nil,
          @dns_support : Bool? = nil,
          @ipv6_support : Bool? = nil,
          @security_group_referencing_support : Bool? = nil
        )
        end
      end

      # Displays a list of the destination segments. Used only when the service insertion action is send-to
      # .
      struct WhenSentTo
        include JSON::Serializable

        # The list of destination segments when the service insertion action is send-to .
        @[JSON::Field(key: "WhenSentToSegmentsList")]
        getter when_sent_to_segments_list : Array(String)?

        def initialize(
          @when_sent_to_segments_list : Array(String)? = nil
        )
        end
      end
    end
  end
end
