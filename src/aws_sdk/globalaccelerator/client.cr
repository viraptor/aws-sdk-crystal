module AwsSdk
  module GlobalAccelerator
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

      # Associate a virtual private cloud (VPC) subnet endpoint with your custom routing accelerator. The
      # listener port range must be large enough to support the number of IP addresses that can be specified
      # in your subnet. The number of ports required is: subnet size times the number of ports per
      # destination EC2 instances. For example, a subnet defined as /24 requires a listener port range of at
      # least 255 ports. Note: You must have enough remaining listener ports available to map to the subnet
      # ports, or the call will fail with a LimitExceededException. By default, all destinations in a subnet
      # in a custom routing accelerator cannot receive traffic. To enable all destinations to receive
      # traffic, or to specify individual port mappings that can receive traffic, see the
      # AllowCustomRoutingTraffic operation.

      def add_custom_routing_endpoints(
        endpoint_configurations : Array(Types::CustomRoutingEndpointConfiguration),
        endpoint_group_arn : String
      ) : Types::AddCustomRoutingEndpointsResponse

        input = Types::AddCustomRoutingEndpointsRequest.new(endpoint_configurations: endpoint_configurations, endpoint_group_arn: endpoint_group_arn)
        add_custom_routing_endpoints(input)
      end

      def add_custom_routing_endpoints(input : Types::AddCustomRoutingEndpointsRequest) : Types::AddCustomRoutingEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_CUSTOM_ROUTING_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddCustomRoutingEndpointsResponse, "AddCustomRoutingEndpoints")
      end

      # Add endpoints to an endpoint group. The AddEndpoints API operation is the recommended option for
      # adding endpoints. The alternative options are to add endpoints when you create an endpoint group
      # (with the CreateEndpointGroup API) or when you update an endpoint group (with the
      # UpdateEndpointGroup API). There are two advantages to using AddEndpoints to add endpoints in Global
      # Accelerator: It's faster, because Global Accelerator only has to resolve the new endpoints that
      # you're adding, rather than resolving new and existing endpoints. It's more convenient, because you
      # don't need to specify the current endpoints that are already in the endpoint group, in addition to
      # the new endpoints that you want to add. For information about endpoint types and requirements for
      # endpoints that you can add to Global Accelerator, see Endpoints for standard accelerators in the
      # Global Accelerator Developer Guide .

      def add_endpoints(
        endpoint_configurations : Array(Types::EndpointConfiguration),
        endpoint_group_arn : String
      ) : Types::AddEndpointsResponse

        input = Types::AddEndpointsRequest.new(endpoint_configurations: endpoint_configurations, endpoint_group_arn: endpoint_group_arn)
        add_endpoints(input)
      end

      def add_endpoints(input : Types::AddEndpointsRequest) : Types::AddEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddEndpointsResponse, "AddEndpoints")
      end

      # Advertises an IPv4 address range that is provisioned for use with your Amazon Web Services resources
      # through bring your own IP addresses (BYOIP). It can take a few minutes before traffic to the
      # specified addresses starts routing to Amazon Web Services because of propagation delays. To stop
      # advertising the BYOIP address range, use WithdrawByoipCidr . For more information, see Bring your
      # own IP addresses (BYOIP) in the Global Accelerator Developer Guide .

      def advertise_byoip_cidr(
        cidr : String
      ) : Types::AdvertiseByoipCidrResponse

        input = Types::AdvertiseByoipCidrRequest.new(cidr: cidr)
        advertise_byoip_cidr(input)
      end

      def advertise_byoip_cidr(input : Types::AdvertiseByoipCidrRequest) : Types::AdvertiseByoipCidrResponse
        request = Protocol::JsonRpc.build_request(Model::ADVERTISE_BYOIP_CIDR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdvertiseByoipCidrResponse, "AdvertiseByoipCidr")
      end

      # Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint that
      # can receive traffic for a custom routing accelerator. You can allow traffic to all destinations in
      # the subnet endpoint, or allow traffic to a specified list of destination IP addresses and ports in
      # the subnet. Note that you cannot specify IP addresses or ports outside of the range that you
      # configured for the endpoint group. After you make changes, you can verify that the updates are
      # complete by checking the status of your accelerator: the status changes from IN_PROGRESS to
      # DEPLOYED.

      def allow_custom_routing_traffic(
        endpoint_group_arn : String,
        endpoint_id : String,
        allow_all_traffic_to_endpoint : Bool? = nil,
        destination_addresses : Array(String)? = nil,
        destination_ports : Array(Int32)? = nil
      ) : Nil

        input = Types::AllowCustomRoutingTrafficRequest.new(endpoint_group_arn: endpoint_group_arn, endpoint_id: endpoint_id, allow_all_traffic_to_endpoint: allow_all_traffic_to_endpoint, destination_addresses: destination_addresses, destination_ports: destination_ports)
        allow_custom_routing_traffic(input)
      end

      def allow_custom_routing_traffic(input : Types::AllowCustomRoutingTrafficRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ALLOW_CUSTOM_ROUTING_TRAFFIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Create an accelerator. An accelerator includes one or more listeners that process inbound
      # connections and direct traffic to one or more endpoint groups, each of which includes endpoints,
      # such as Network Load Balancers. Global Accelerator is a global service that supports endpoints in
      # multiple Amazon Web Services Regions but you must specify the US West (Oregon) Region to create,
      # update, or otherwise work with accelerators. That is, for example, specify --region us-west-2 on
      # Amazon Web Services CLI commands.

      def create_accelerator(
        idempotency_token : String,
        name : String,
        enabled : Bool? = nil,
        ip_address_type : String? = nil,
        ip_addresses : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAcceleratorResponse

        input = Types::CreateAcceleratorRequest.new(idempotency_token: idempotency_token, name: name, enabled: enabled, ip_address_type: ip_address_type, ip_addresses: ip_addresses, tags: tags)
        create_accelerator(input)
      end

      def create_accelerator(input : Types::CreateAcceleratorRequest) : Types::CreateAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAcceleratorResponse, "CreateAccelerator")
      end

      # Create a cross-account attachment in Global Accelerator. You create a cross-account attachment to
      # specify the principals who have permission to work with resources in accelerators in their own
      # account. You specify, in the same attachment, the resources that are shared. A principal can be an
      # Amazon Web Services account number or the Amazon Resource Name (ARN) for an accelerator. For account
      # numbers that are listed as principals, to work with a resource listed in the attachment, you must
      # sign in to an account specified as a principal. Then, you can work with resources that are listed,
      # with any of your accelerators. If an accelerator ARN is listed in the cross-account attachment as a
      # principal, anyone with permission to make updates to the accelerator can work with resources that
      # are listed in the attachment. Specify each principal and resource separately. To specify two CIDR
      # address pools, list them individually under Resources , and so on. For a command line operation, for
      # example, you might use a statement like the following: "Resources": [{"Cidr":
      # "169.254.60.0/24"},{"Cidr": "169.254.59.0/24"}] For more information, see Working with cross-account
      # attachments and resources in Global Accelerator in the Global Accelerator Developer Guide .

      def create_cross_account_attachment(
        idempotency_token : String,
        name : String,
        principals : Array(String)? = nil,
        resources : Array(Types::Resource)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCrossAccountAttachmentResponse

        input = Types::CreateCrossAccountAttachmentRequest.new(idempotency_token: idempotency_token, name: name, principals: principals, resources: resources, tags: tags)
        create_cross_account_attachment(input)
      end

      def create_cross_account_attachment(input : Types::CreateCrossAccountAttachmentRequest) : Types::CreateCrossAccountAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CROSS_ACCOUNT_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCrossAccountAttachmentResponse, "CreateCrossAccountAttachment")
      end

      # Create a custom routing accelerator. A custom routing accelerator directs traffic to one of possibly
      # thousands of Amazon EC2 instance destinations running in a single or multiple virtual private clouds
      # (VPC) subnet endpoints. Be aware that, by default, all destination EC2 instances in a VPC subnet
      # endpoint cannot receive traffic. To enable all destinations to receive traffic, or to specify
      # individual port mappings that can receive traffic, see the AllowCustomRoutingTraffic operation.
      # Global Accelerator is a global service that supports endpoints in multiple Amazon Web Services
      # Regions but you must specify the US West (Oregon) Region to create, update, or otherwise work with
      # accelerators. That is, for example, specify --region us-west-2 on Amazon Web Services CLI commands.

      def create_custom_routing_accelerator(
        idempotency_token : String,
        name : String,
        enabled : Bool? = nil,
        ip_address_type : String? = nil,
        ip_addresses : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCustomRoutingAcceleratorResponse

        input = Types::CreateCustomRoutingAcceleratorRequest.new(idempotency_token: idempotency_token, name: name, enabled: enabled, ip_address_type: ip_address_type, ip_addresses: ip_addresses, tags: tags)
        create_custom_routing_accelerator(input)
      end

      def create_custom_routing_accelerator(input : Types::CreateCustomRoutingAcceleratorRequest) : Types::CreateCustomRoutingAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_ROUTING_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomRoutingAcceleratorResponse, "CreateCustomRoutingAccelerator")
      end

      # Create an endpoint group for the specified listener for a custom routing accelerator. An endpoint
      # group is a collection of endpoints in one Amazon Web Services Region.

      def create_custom_routing_endpoint_group(
        destination_configurations : Array(Types::CustomRoutingDestinationConfiguration),
        endpoint_group_region : String,
        idempotency_token : String,
        listener_arn : String
      ) : Types::CreateCustomRoutingEndpointGroupResponse

        input = Types::CreateCustomRoutingEndpointGroupRequest.new(destination_configurations: destination_configurations, endpoint_group_region: endpoint_group_region, idempotency_token: idempotency_token, listener_arn: listener_arn)
        create_custom_routing_endpoint_group(input)
      end

      def create_custom_routing_endpoint_group(input : Types::CreateCustomRoutingEndpointGroupRequest) : Types::CreateCustomRoutingEndpointGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_ROUTING_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomRoutingEndpointGroupResponse, "CreateCustomRoutingEndpointGroup")
      end

      # Create a listener to process inbound connections from clients to a custom routing accelerator.
      # Connections arrive to assigned static IP addresses on the port range that you specify.

      def create_custom_routing_listener(
        accelerator_arn : String,
        idempotency_token : String,
        port_ranges : Array(Types::PortRange)
      ) : Types::CreateCustomRoutingListenerResponse

        input = Types::CreateCustomRoutingListenerRequest.new(accelerator_arn: accelerator_arn, idempotency_token: idempotency_token, port_ranges: port_ranges)
        create_custom_routing_listener(input)
      end

      def create_custom_routing_listener(input : Types::CreateCustomRoutingListenerRequest) : Types::CreateCustomRoutingListenerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_ROUTING_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomRoutingListenerResponse, "CreateCustomRoutingListener")
      end

      # Create an endpoint group for the specified listener. An endpoint group is a collection of endpoints
      # in one Amazon Web Services Region. A resource must be valid and active when you add it as an
      # endpoint. For more information about endpoint types and requirements for endpoints that you can add
      # to Global Accelerator, see Endpoints for standard accelerators in the Global Accelerator Developer
      # Guide .

      def create_endpoint_group(
        endpoint_group_region : String,
        idempotency_token : String,
        listener_arn : String,
        endpoint_configurations : Array(Types::EndpointConfiguration)? = nil,
        health_check_interval_seconds : Int32? = nil,
        health_check_path : String? = nil,
        health_check_port : Int32? = nil,
        health_check_protocol : String? = nil,
        port_overrides : Array(Types::PortOverride)? = nil,
        threshold_count : Int32? = nil,
        traffic_dial_percentage : Float64? = nil
      ) : Types::CreateEndpointGroupResponse

        input = Types::CreateEndpointGroupRequest.new(endpoint_group_region: endpoint_group_region, idempotency_token: idempotency_token, listener_arn: listener_arn, endpoint_configurations: endpoint_configurations, health_check_interval_seconds: health_check_interval_seconds, health_check_path: health_check_path, health_check_port: health_check_port, health_check_protocol: health_check_protocol, port_overrides: port_overrides, threshold_count: threshold_count, traffic_dial_percentage: traffic_dial_percentage)
        create_endpoint_group(input)
      end

      def create_endpoint_group(input : Types::CreateEndpointGroupRequest) : Types::CreateEndpointGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointGroupResponse, "CreateEndpointGroup")
      end

      # Create a listener to process inbound connections from clients to an accelerator. Connections arrive
      # to assigned static IP addresses on a port, port range, or list of port ranges that you specify.

      def create_listener(
        accelerator_arn : String,
        idempotency_token : String,
        port_ranges : Array(Types::PortRange),
        protocol : String,
        client_affinity : String? = nil
      ) : Types::CreateListenerResponse

        input = Types::CreateListenerRequest.new(accelerator_arn: accelerator_arn, idempotency_token: idempotency_token, port_ranges: port_ranges, protocol: protocol, client_affinity: client_affinity)
        create_listener(input)
      end

      def create_listener(input : Types::CreateListenerRequest) : Types::CreateListenerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateListenerResponse, "CreateListener")
      end

      # Delete an accelerator. Before you can delete an accelerator, you must disable it and remove all
      # dependent resources (listeners and endpoint groups). To disable the accelerator, update the
      # accelerator to set Enabled to false. When you create an accelerator, by default, Global Accelerator
      # provides you with a set of two static IP addresses. Alternatively, you can bring your own IP address
      # ranges to Global Accelerator and assign IP addresses from those ranges. The IP addresses are
      # assigned to your accelerator for as long as it exists, even if you disable the accelerator and it no
      # longer accepts or routes traffic. However, when you delete an accelerator, you lose the static IP
      # addresses that are assigned to the accelerator, so you can no longer route traffic by using them. As
      # a best practice, ensure that you have permissions in place to avoid inadvertently deleting
      # accelerators. You can use IAM policies with Global Accelerator to limit the users who have
      # permissions to delete an accelerator. For more information, see Identity and access management in
      # the Global Accelerator Developer Guide .

      def delete_accelerator(
        accelerator_arn : String
      ) : Nil

        input = Types::DeleteAcceleratorRequest.new(accelerator_arn: accelerator_arn)
        delete_accelerator(input)
      end

      def delete_accelerator(input : Types::DeleteAcceleratorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a cross-account attachment. When you delete an attachment, Global Accelerator revokes the
      # permission to use the resources in the attachment from all principals in the list of principals.
      # Global Accelerator revokes the permission for specific resources. For more information, see Working
      # with cross-account attachments and resources in Global Accelerator in the Global Accelerator
      # Developer Guide .

      def delete_cross_account_attachment(
        attachment_arn : String
      ) : Nil

        input = Types::DeleteCrossAccountAttachmentRequest.new(attachment_arn: attachment_arn)
        delete_cross_account_attachment(input)
      end

      def delete_cross_account_attachment(input : Types::DeleteCrossAccountAttachmentRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CROSS_ACCOUNT_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a custom routing accelerator. Before you can delete an accelerator, you must disable it and
      # remove all dependent resources (listeners and endpoint groups). To disable the accelerator, update
      # the accelerator to set Enabled to false. When you create a custom routing accelerator, by default,
      # Global Accelerator provides you with a set of two static IP addresses. The IP addresses are assigned
      # to your accelerator for as long as it exists, even if you disable the accelerator and it no longer
      # accepts or routes traffic. However, when you delete an accelerator, you lose the static IP addresses
      # that are assigned to the accelerator, so you can no longer route traffic by using them. As a best
      # practice, ensure that you have permissions in place to avoid inadvertently deleting accelerators.
      # You can use IAM policies with Global Accelerator to limit the users who have permissions to delete
      # an accelerator. For more information, see Identity and access management in the Global Accelerator
      # Developer Guide .

      def delete_custom_routing_accelerator(
        accelerator_arn : String
      ) : Nil

        input = Types::DeleteCustomRoutingAcceleratorRequest.new(accelerator_arn: accelerator_arn)
        delete_custom_routing_accelerator(input)
      end

      def delete_custom_routing_accelerator(input : Types::DeleteCustomRoutingAcceleratorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_ROUTING_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete an endpoint group from a listener for a custom routing accelerator.

      def delete_custom_routing_endpoint_group(
        endpoint_group_arn : String
      ) : Nil

        input = Types::DeleteCustomRoutingEndpointGroupRequest.new(endpoint_group_arn: endpoint_group_arn)
        delete_custom_routing_endpoint_group(input)
      end

      def delete_custom_routing_endpoint_group(input : Types::DeleteCustomRoutingEndpointGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_ROUTING_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a listener for a custom routing accelerator.

      def delete_custom_routing_listener(
        listener_arn : String
      ) : Nil

        input = Types::DeleteCustomRoutingListenerRequest.new(listener_arn: listener_arn)
        delete_custom_routing_listener(input)
      end

      def delete_custom_routing_listener(input : Types::DeleteCustomRoutingListenerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_ROUTING_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete an endpoint group from a listener.

      def delete_endpoint_group(
        endpoint_group_arn : String
      ) : Nil

        input = Types::DeleteEndpointGroupRequest.new(endpoint_group_arn: endpoint_group_arn)
        delete_endpoint_group(input)
      end

      def delete_endpoint_group(input : Types::DeleteEndpointGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a listener from an accelerator.

      def delete_listener(
        listener_arn : String
      ) : Nil

        input = Types::DeleteListenerRequest.new(listener_arn: listener_arn)
        delete_listener(input)
      end

      def delete_listener(input : Types::DeleteListenerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint that
      # cannot receive traffic for a custom routing accelerator. You can deny traffic to all destinations in
      # the VPC endpoint, or deny traffic to a specified list of destination IP addresses and ports. Note
      # that you cannot specify IP addresses or ports outside of the range that you configured for the
      # endpoint group. After you make changes, you can verify that the updates are complete by checking the
      # status of your accelerator: the status changes from IN_PROGRESS to DEPLOYED.

      def deny_custom_routing_traffic(
        endpoint_group_arn : String,
        endpoint_id : String,
        deny_all_traffic_to_endpoint : Bool? = nil,
        destination_addresses : Array(String)? = nil,
        destination_ports : Array(Int32)? = nil
      ) : Nil

        input = Types::DenyCustomRoutingTrafficRequest.new(endpoint_group_arn: endpoint_group_arn, endpoint_id: endpoint_id, deny_all_traffic_to_endpoint: deny_all_traffic_to_endpoint, destination_addresses: destination_addresses, destination_ports: destination_ports)
        deny_custom_routing_traffic(input)
      end

      def deny_custom_routing_traffic(input : Types::DenyCustomRoutingTrafficRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DENY_CUSTOM_ROUTING_TRAFFIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Releases the specified address range that you provisioned to use with your Amazon Web Services
      # resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool.
      # Before you can release an address range, you must stop advertising it by using WithdrawByoipCidr and
      # you must not have any accelerators that are using static IP addresses allocated from its address
      # range. For more information, see Bring your own IP addresses (BYOIP) in the Global Accelerator
      # Developer Guide .

      def deprovision_byoip_cidr(
        cidr : String
      ) : Types::DeprovisionByoipCidrResponse

        input = Types::DeprovisionByoipCidrRequest.new(cidr: cidr)
        deprovision_byoip_cidr(input)
      end

      def deprovision_byoip_cidr(input : Types::DeprovisionByoipCidrRequest) : Types::DeprovisionByoipCidrResponse
        request = Protocol::JsonRpc.build_request(Model::DEPROVISION_BYOIP_CIDR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeprovisionByoipCidrResponse, "DeprovisionByoipCidr")
      end

      # Describe an accelerator.

      def describe_accelerator(
        accelerator_arn : String
      ) : Types::DescribeAcceleratorResponse

        input = Types::DescribeAcceleratorRequest.new(accelerator_arn: accelerator_arn)
        describe_accelerator(input)
      end

      def describe_accelerator(input : Types::DescribeAcceleratorRequest) : Types::DescribeAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAcceleratorResponse, "DescribeAccelerator")
      end

      # Describe the attributes of an accelerator.

      def describe_accelerator_attributes(
        accelerator_arn : String
      ) : Types::DescribeAcceleratorAttributesResponse

        input = Types::DescribeAcceleratorAttributesRequest.new(accelerator_arn: accelerator_arn)
        describe_accelerator_attributes(input)
      end

      def describe_accelerator_attributes(input : Types::DescribeAcceleratorAttributesRequest) : Types::DescribeAcceleratorAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCELERATOR_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAcceleratorAttributesResponse, "DescribeAcceleratorAttributes")
      end

      # Gets configuration information about a cross-account attachment.

      def describe_cross_account_attachment(
        attachment_arn : String
      ) : Types::DescribeCrossAccountAttachmentResponse

        input = Types::DescribeCrossAccountAttachmentRequest.new(attachment_arn: attachment_arn)
        describe_cross_account_attachment(input)
      end

      def describe_cross_account_attachment(input : Types::DescribeCrossAccountAttachmentRequest) : Types::DescribeCrossAccountAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CROSS_ACCOUNT_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCrossAccountAttachmentResponse, "DescribeCrossAccountAttachment")
      end

      # Describe a custom routing accelerator.

      def describe_custom_routing_accelerator(
        accelerator_arn : String
      ) : Types::DescribeCustomRoutingAcceleratorResponse

        input = Types::DescribeCustomRoutingAcceleratorRequest.new(accelerator_arn: accelerator_arn)
        describe_custom_routing_accelerator(input)
      end

      def describe_custom_routing_accelerator(input : Types::DescribeCustomRoutingAcceleratorRequest) : Types::DescribeCustomRoutingAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_ROUTING_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomRoutingAcceleratorResponse, "DescribeCustomRoutingAccelerator")
      end

      # Describe the attributes of a custom routing accelerator.

      def describe_custom_routing_accelerator_attributes(
        accelerator_arn : String
      ) : Types::DescribeCustomRoutingAcceleratorAttributesResponse

        input = Types::DescribeCustomRoutingAcceleratorAttributesRequest.new(accelerator_arn: accelerator_arn)
        describe_custom_routing_accelerator_attributes(input)
      end

      def describe_custom_routing_accelerator_attributes(input : Types::DescribeCustomRoutingAcceleratorAttributesRequest) : Types::DescribeCustomRoutingAcceleratorAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_ROUTING_ACCELERATOR_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomRoutingAcceleratorAttributesResponse, "DescribeCustomRoutingAcceleratorAttributes")
      end

      # Describe an endpoint group for a custom routing accelerator.

      def describe_custom_routing_endpoint_group(
        endpoint_group_arn : String
      ) : Types::DescribeCustomRoutingEndpointGroupResponse

        input = Types::DescribeCustomRoutingEndpointGroupRequest.new(endpoint_group_arn: endpoint_group_arn)
        describe_custom_routing_endpoint_group(input)
      end

      def describe_custom_routing_endpoint_group(input : Types::DescribeCustomRoutingEndpointGroupRequest) : Types::DescribeCustomRoutingEndpointGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_ROUTING_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomRoutingEndpointGroupResponse, "DescribeCustomRoutingEndpointGroup")
      end

      # The description of a listener for a custom routing accelerator.

      def describe_custom_routing_listener(
        listener_arn : String
      ) : Types::DescribeCustomRoutingListenerResponse

        input = Types::DescribeCustomRoutingListenerRequest.new(listener_arn: listener_arn)
        describe_custom_routing_listener(input)
      end

      def describe_custom_routing_listener(input : Types::DescribeCustomRoutingListenerRequest) : Types::DescribeCustomRoutingListenerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_ROUTING_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomRoutingListenerResponse, "DescribeCustomRoutingListener")
      end

      # Describe an endpoint group.

      def describe_endpoint_group(
        endpoint_group_arn : String
      ) : Types::DescribeEndpointGroupResponse

        input = Types::DescribeEndpointGroupRequest.new(endpoint_group_arn: endpoint_group_arn)
        describe_endpoint_group(input)
      end

      def describe_endpoint_group(input : Types::DescribeEndpointGroupRequest) : Types::DescribeEndpointGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointGroupResponse, "DescribeEndpointGroup")
      end

      # Describe a listener.

      def describe_listener(
        listener_arn : String
      ) : Types::DescribeListenerResponse

        input = Types::DescribeListenerRequest.new(listener_arn: listener_arn)
        describe_listener(input)
      end

      def describe_listener(input : Types::DescribeListenerRequest) : Types::DescribeListenerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeListenerResponse, "DescribeListener")
      end

      # List the accelerators for an Amazon Web Services account.

      def list_accelerators(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAcceleratorsResponse

        input = Types::ListAcceleratorsRequest.new(max_results: max_results, next_token: next_token)
        list_accelerators(input)
      end

      def list_accelerators(input : Types::ListAcceleratorsRequest) : Types::ListAcceleratorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCELERATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAcceleratorsResponse, "ListAccelerators")
      end

      # Lists the IP address ranges that were specified in calls to ProvisionByoipCidr , including the
      # current state and a history of state changes.

      def list_byoip_cidrs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListByoipCidrsResponse

        input = Types::ListByoipCidrsRequest.new(max_results: max_results, next_token: next_token)
        list_byoip_cidrs(input)
      end

      def list_byoip_cidrs(input : Types::ListByoipCidrsRequest) : Types::ListByoipCidrsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BYOIP_CIDRS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListByoipCidrsResponse, "ListByoipCidrs")
      end

      # List the cross-account attachments that have been created in Global Accelerator.

      def list_cross_account_attachments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCrossAccountAttachmentsResponse

        input = Types::ListCrossAccountAttachmentsRequest.new(max_results: max_results, next_token: next_token)
        list_cross_account_attachments(input)
      end

      def list_cross_account_attachments(input : Types::ListCrossAccountAttachmentsRequest) : Types::ListCrossAccountAttachmentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CROSS_ACCOUNT_ATTACHMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCrossAccountAttachmentsResponse, "ListCrossAccountAttachments")
      end

      # List the accounts that have cross-account resources. For more information, see Working with
      # cross-account attachments and resources in Global Accelerator in the Global Accelerator Developer
      # Guide .

      def list_cross_account_resource_accounts : Types::ListCrossAccountResourceAccountsResponse
        input = Types::ListCrossAccountResourceAccountsRequest.new
        list_cross_account_resource_accounts(input)
      end

      def list_cross_account_resource_accounts(input : Types::ListCrossAccountResourceAccountsRequest) : Types::ListCrossAccountResourceAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CROSS_ACCOUNT_RESOURCE_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCrossAccountResourceAccountsResponse, "ListCrossAccountResourceAccounts")
      end

      # List the cross-account resources available to work with.

      def list_cross_account_resources(
        resource_owner_aws_account_id : String,
        accelerator_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCrossAccountResourcesResponse

        input = Types::ListCrossAccountResourcesRequest.new(resource_owner_aws_account_id: resource_owner_aws_account_id, accelerator_arn: accelerator_arn, max_results: max_results, next_token: next_token)
        list_cross_account_resources(input)
      end

      def list_cross_account_resources(input : Types::ListCrossAccountResourcesRequest) : Types::ListCrossAccountResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CROSS_ACCOUNT_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCrossAccountResourcesResponse, "ListCrossAccountResources")
      end

      # List the custom routing accelerators for an Amazon Web Services account.

      def list_custom_routing_accelerators(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomRoutingAcceleratorsResponse

        input = Types::ListCustomRoutingAcceleratorsRequest.new(max_results: max_results, next_token: next_token)
        list_custom_routing_accelerators(input)
      end

      def list_custom_routing_accelerators(input : Types::ListCustomRoutingAcceleratorsRequest) : Types::ListCustomRoutingAcceleratorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ROUTING_ACCELERATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomRoutingAcceleratorsResponse, "ListCustomRoutingAccelerators")
      end

      # List the endpoint groups that are associated with a listener for a custom routing accelerator.

      def list_custom_routing_endpoint_groups(
        listener_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomRoutingEndpointGroupsResponse

        input = Types::ListCustomRoutingEndpointGroupsRequest.new(listener_arn: listener_arn, max_results: max_results, next_token: next_token)
        list_custom_routing_endpoint_groups(input)
      end

      def list_custom_routing_endpoint_groups(input : Types::ListCustomRoutingEndpointGroupsRequest) : Types::ListCustomRoutingEndpointGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ROUTING_ENDPOINT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomRoutingEndpointGroupsResponse, "ListCustomRoutingEndpointGroups")
      end

      # List the listeners for a custom routing accelerator.

      def list_custom_routing_listeners(
        accelerator_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomRoutingListenersResponse

        input = Types::ListCustomRoutingListenersRequest.new(accelerator_arn: accelerator_arn, max_results: max_results, next_token: next_token)
        list_custom_routing_listeners(input)
      end

      def list_custom_routing_listeners(input : Types::ListCustomRoutingListenersRequest) : Types::ListCustomRoutingListenersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ROUTING_LISTENERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomRoutingListenersResponse, "ListCustomRoutingListeners")
      end

      # Provides a complete mapping from the public accelerator IP address and port to destination EC2
      # instance IP addresses and ports in the virtual public cloud (VPC) subnet endpoint for a custom
      # routing accelerator. For each subnet endpoint that you add, Global Accelerator creates a new static
      # port mapping for the accelerator. The port mappings don't change after Global Accelerator generates
      # them, so you can retrieve and cache the full mapping on your servers. If you remove a subnet from
      # your accelerator, Global Accelerator removes (reclaims) the port mappings. If you add a subnet to
      # your accelerator, Global Accelerator creates new port mappings (the existing ones don't change). If
      # you add or remove EC2 instances in your subnet, the port mappings don't change, because the mappings
      # are created when you add the subnet to Global Accelerator. The mappings also include a flag for each
      # destination denoting which destination IP addresses and ports are allowed or denied traffic.

      def list_custom_routing_port_mappings(
        accelerator_arn : String,
        endpoint_group_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomRoutingPortMappingsResponse

        input = Types::ListCustomRoutingPortMappingsRequest.new(accelerator_arn: accelerator_arn, endpoint_group_arn: endpoint_group_arn, max_results: max_results, next_token: next_token)
        list_custom_routing_port_mappings(input)
      end

      def list_custom_routing_port_mappings(input : Types::ListCustomRoutingPortMappingsRequest) : Types::ListCustomRoutingPortMappingsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ROUTING_PORT_MAPPINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomRoutingPortMappingsResponse, "ListCustomRoutingPortMappings")
      end

      # List the port mappings for a specific EC2 instance (destination) in a VPC subnet endpoint. The
      # response is the mappings for one destination IP address. This is useful when your subnet endpoint
      # has mappings that span multiple custom routing accelerators in your account, or for scenarios where
      # you only want to list the port mappings for a specific destination instance.

      def list_custom_routing_port_mappings_by_destination(
        destination_address : String,
        endpoint_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomRoutingPortMappingsByDestinationResponse

        input = Types::ListCustomRoutingPortMappingsByDestinationRequest.new(destination_address: destination_address, endpoint_id: endpoint_id, max_results: max_results, next_token: next_token)
        list_custom_routing_port_mappings_by_destination(input)
      end

      def list_custom_routing_port_mappings_by_destination(input : Types::ListCustomRoutingPortMappingsByDestinationRequest) : Types::ListCustomRoutingPortMappingsByDestinationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ROUTING_PORT_MAPPINGS_BY_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomRoutingPortMappingsByDestinationResponse, "ListCustomRoutingPortMappingsByDestination")
      end

      # List the endpoint groups that are associated with a listener.

      def list_endpoint_groups(
        listener_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEndpointGroupsResponse

        input = Types::ListEndpointGroupsRequest.new(listener_arn: listener_arn, max_results: max_results, next_token: next_token)
        list_endpoint_groups(input)
      end

      def list_endpoint_groups(input : Types::ListEndpointGroupsRequest) : Types::ListEndpointGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENDPOINT_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEndpointGroupsResponse, "ListEndpointGroups")
      end

      # List the listeners for an accelerator.

      def list_listeners(
        accelerator_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListListenersResponse

        input = Types::ListListenersRequest.new(accelerator_arn: accelerator_arn, max_results: max_results, next_token: next_token)
        list_listeners(input)
      end

      def list_listeners(input : Types::ListListenersRequest) : Types::ListListenersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LISTENERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListListenersResponse, "ListListeners")
      end

      # List all tags for an accelerator. For more information, see Tagging in Global Accelerator in the
      # Global Accelerator Developer Guide .

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

      # Provisions an IP address range to use with your Amazon Web Services resources through bring your own
      # IP addresses (BYOIP) and creates a corresponding address pool. After the address range is
      # provisioned, it is ready to be advertised using AdvertiseByoipCidr . For more information, see Bring
      # your own IP addresses (BYOIP) in the Global Accelerator Developer Guide .

      def provision_byoip_cidr(
        cidr : String,
        cidr_authorization_context : Types::CidrAuthorizationContext
      ) : Types::ProvisionByoipCidrResponse

        input = Types::ProvisionByoipCidrRequest.new(cidr: cidr, cidr_authorization_context: cidr_authorization_context)
        provision_byoip_cidr(input)
      end

      def provision_byoip_cidr(input : Types::ProvisionByoipCidrRequest) : Types::ProvisionByoipCidrResponse
        request = Protocol::JsonRpc.build_request(Model::PROVISION_BYOIP_CIDR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ProvisionByoipCidrResponse, "ProvisionByoipCidr")
      end

      # Remove endpoints from a custom routing accelerator.

      def remove_custom_routing_endpoints(
        endpoint_group_arn : String,
        endpoint_ids : Array(String)
      ) : Nil

        input = Types::RemoveCustomRoutingEndpointsRequest.new(endpoint_group_arn: endpoint_group_arn, endpoint_ids: endpoint_ids)
        remove_custom_routing_endpoints(input)
      end

      def remove_custom_routing_endpoints(input : Types::RemoveCustomRoutingEndpointsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_CUSTOM_ROUTING_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Remove endpoints from an endpoint group. The RemoveEndpoints API operation is the recommended option
      # for removing endpoints. The alternative is to remove endpoints by updating an endpoint group by
      # using the UpdateEndpointGroup API operation. There are two advantages to using AddEndpoints to
      # remove endpoints instead: It's more convenient, because you only need to specify the endpoints that
      # you want to remove. With the UpdateEndpointGroup API operation, you must specify all of the
      # endpoints in the endpoint group except the ones that you want to remove from the group. It's faster,
      # because Global Accelerator doesn't need to resolve any endpoints. With the UpdateEndpointGroup API
      # operation, Global Accelerator must resolve all of the endpoints that remain in the group.

      def remove_endpoints(
        endpoint_group_arn : String,
        endpoint_identifiers : Array(Types::EndpointIdentifier)
      ) : Nil

        input = Types::RemoveEndpointsRequest.new(endpoint_group_arn: endpoint_group_arn, endpoint_identifiers: endpoint_identifiers)
        remove_endpoints(input)
      end

      def remove_endpoints(input : Types::RemoveEndpointsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Add tags to an accelerator resource. For more information, see Tagging in Global Accelerator in the
      # Global Accelerator Developer Guide .

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

      # Remove tags from a Global Accelerator resource. When you specify a tag key, the action removes both
      # that key and its associated value. The operation succeeds even if you attempt to remove tags from an
      # accelerator that was already removed. For more information, see Tagging in Global Accelerator in the
      # Global Accelerator Developer Guide .

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

      # Update an accelerator to make changes, such as the following: Change the name of the accelerator.
      # Disable the accelerator so that it no longer accepts or routes traffic, or so that you can delete
      # it. Enable the accelerator, if it is disabled. Change the IP address type to dual-stack if it is
      # IPv4, or change the IP address type to IPv4 if it's dual-stack. Be aware that static IP addresses
      # remain assigned to your accelerator for as long as it exists, even if you disable the accelerator
      # and it no longer accepts or routes traffic. However, when you delete the accelerator, you lose the
      # static IP addresses that are assigned to it, so you can no longer route traffic by using them.
      # Global Accelerator is a global service that supports endpoints in multiple Amazon Web Services
      # Regions but you must specify the US West (Oregon) Region to create, update, or otherwise work with
      # accelerators. That is, for example, specify --region us-west-2 on Amazon Web Services CLI commands.

      def update_accelerator(
        accelerator_arn : String,
        enabled : Bool? = nil,
        ip_address_type : String? = nil,
        ip_addresses : Array(String)? = nil,
        name : String? = nil
      ) : Types::UpdateAcceleratorResponse

        input = Types::UpdateAcceleratorRequest.new(accelerator_arn: accelerator_arn, enabled: enabled, ip_address_type: ip_address_type, ip_addresses: ip_addresses, name: name)
        update_accelerator(input)
      end

      def update_accelerator(input : Types::UpdateAcceleratorRequest) : Types::UpdateAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAcceleratorResponse, "UpdateAccelerator")
      end

      # Update the attributes for an accelerator.

      def update_accelerator_attributes(
        accelerator_arn : String,
        flow_logs_enabled : Bool? = nil,
        flow_logs_s3_bucket : String? = nil,
        flow_logs_s3_prefix : String? = nil
      ) : Types::UpdateAcceleratorAttributesResponse

        input = Types::UpdateAcceleratorAttributesRequest.new(accelerator_arn: accelerator_arn, flow_logs_enabled: flow_logs_enabled, flow_logs_s3_bucket: flow_logs_s3_bucket, flow_logs_s3_prefix: flow_logs_s3_prefix)
        update_accelerator_attributes(input)
      end

      def update_accelerator_attributes(input : Types::UpdateAcceleratorAttributesRequest) : Types::UpdateAcceleratorAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCELERATOR_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAcceleratorAttributesResponse, "UpdateAcceleratorAttributes")
      end

      # Update a cross-account attachment to add or remove principals or resources. When you update an
      # attachment to remove a principal (account ID or accelerator) or a resource, Global Accelerator
      # revokes the permission for specific resources. For more information, see Working with cross-account
      # attachments and resources in Global Accelerator in the Global Accelerator Developer Guide .

      def update_cross_account_attachment(
        attachment_arn : String,
        add_principals : Array(String)? = nil,
        add_resources : Array(Types::Resource)? = nil,
        name : String? = nil,
        remove_principals : Array(String)? = nil,
        remove_resources : Array(Types::Resource)? = nil
      ) : Types::UpdateCrossAccountAttachmentResponse

        input = Types::UpdateCrossAccountAttachmentRequest.new(attachment_arn: attachment_arn, add_principals: add_principals, add_resources: add_resources, name: name, remove_principals: remove_principals, remove_resources: remove_resources)
        update_cross_account_attachment(input)
      end

      def update_cross_account_attachment(input : Types::UpdateCrossAccountAttachmentRequest) : Types::UpdateCrossAccountAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CROSS_ACCOUNT_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCrossAccountAttachmentResponse, "UpdateCrossAccountAttachment")
      end

      # Update a custom routing accelerator.

      def update_custom_routing_accelerator(
        accelerator_arn : String,
        enabled : Bool? = nil,
        ip_address_type : String? = nil,
        ip_addresses : Array(String)? = nil,
        name : String? = nil
      ) : Types::UpdateCustomRoutingAcceleratorResponse

        input = Types::UpdateCustomRoutingAcceleratorRequest.new(accelerator_arn: accelerator_arn, enabled: enabled, ip_address_type: ip_address_type, ip_addresses: ip_addresses, name: name)
        update_custom_routing_accelerator(input)
      end

      def update_custom_routing_accelerator(input : Types::UpdateCustomRoutingAcceleratorRequest) : Types::UpdateCustomRoutingAcceleratorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CUSTOM_ROUTING_ACCELERATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCustomRoutingAcceleratorResponse, "UpdateCustomRoutingAccelerator")
      end

      # Update the attributes for a custom routing accelerator.

      def update_custom_routing_accelerator_attributes(
        accelerator_arn : String,
        flow_logs_enabled : Bool? = nil,
        flow_logs_s3_bucket : String? = nil,
        flow_logs_s3_prefix : String? = nil
      ) : Types::UpdateCustomRoutingAcceleratorAttributesResponse

        input = Types::UpdateCustomRoutingAcceleratorAttributesRequest.new(accelerator_arn: accelerator_arn, flow_logs_enabled: flow_logs_enabled, flow_logs_s3_bucket: flow_logs_s3_bucket, flow_logs_s3_prefix: flow_logs_s3_prefix)
        update_custom_routing_accelerator_attributes(input)
      end

      def update_custom_routing_accelerator_attributes(input : Types::UpdateCustomRoutingAcceleratorAttributesRequest) : Types::UpdateCustomRoutingAcceleratorAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CUSTOM_ROUTING_ACCELERATOR_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCustomRoutingAcceleratorAttributesResponse, "UpdateCustomRoutingAcceleratorAttributes")
      end

      # Update a listener for a custom routing accelerator.

      def update_custom_routing_listener(
        listener_arn : String,
        port_ranges : Array(Types::PortRange)
      ) : Types::UpdateCustomRoutingListenerResponse

        input = Types::UpdateCustomRoutingListenerRequest.new(listener_arn: listener_arn, port_ranges: port_ranges)
        update_custom_routing_listener(input)
      end

      def update_custom_routing_listener(input : Types::UpdateCustomRoutingListenerRequest) : Types::UpdateCustomRoutingListenerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CUSTOM_ROUTING_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCustomRoutingListenerResponse, "UpdateCustomRoutingListener")
      end

      # Update an endpoint group. A resource must be valid and active when you add it as an endpoint.

      def update_endpoint_group(
        endpoint_group_arn : String,
        endpoint_configurations : Array(Types::EndpointConfiguration)? = nil,
        health_check_interval_seconds : Int32? = nil,
        health_check_path : String? = nil,
        health_check_port : Int32? = nil,
        health_check_protocol : String? = nil,
        port_overrides : Array(Types::PortOverride)? = nil,
        threshold_count : Int32? = nil,
        traffic_dial_percentage : Float64? = nil
      ) : Types::UpdateEndpointGroupResponse

        input = Types::UpdateEndpointGroupRequest.new(endpoint_group_arn: endpoint_group_arn, endpoint_configurations: endpoint_configurations, health_check_interval_seconds: health_check_interval_seconds, health_check_path: health_check_path, health_check_port: health_check_port, health_check_protocol: health_check_protocol, port_overrides: port_overrides, threshold_count: threshold_count, traffic_dial_percentage: traffic_dial_percentage)
        update_endpoint_group(input)
      end

      def update_endpoint_group(input : Types::UpdateEndpointGroupRequest) : Types::UpdateEndpointGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENDPOINT_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEndpointGroupResponse, "UpdateEndpointGroup")
      end

      # Update a listener.

      def update_listener(
        listener_arn : String,
        client_affinity : String? = nil,
        port_ranges : Array(Types::PortRange)? = nil,
        protocol : String? = nil
      ) : Types::UpdateListenerResponse

        input = Types::UpdateListenerRequest.new(listener_arn: listener_arn, client_affinity: client_affinity, port_ranges: port_ranges, protocol: protocol)
        update_listener(input)
      end

      def update_listener(input : Types::UpdateListenerRequest) : Types::UpdateListenerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateListenerResponse, "UpdateListener")
      end

      # Stops advertising an address range that is provisioned as an address pool. You can perform this
      # operation at most once every 10 seconds, even if you specify different address ranges each time. It
      # can take a few minutes before traffic to the specified addresses stops routing to Amazon Web
      # Services because of propagation delays. For more information, see Bring your own IP addresses
      # (BYOIP) in the Global Accelerator Developer Guide .

      def withdraw_byoip_cidr(
        cidr : String
      ) : Types::WithdrawByoipCidrResponse

        input = Types::WithdrawByoipCidrRequest.new(cidr: cidr)
        withdraw_byoip_cidr(input)
      end

      def withdraw_byoip_cidr(input : Types::WithdrawByoipCidrRequest) : Types::WithdrawByoipCidrResponse
        request = Protocol::JsonRpc.build_request(Model::WITHDRAW_BYOIP_CIDR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WithdrawByoipCidrResponse, "WithdrawByoipCidr")
      end
    end
  end
end
