module Aws
  module MediaConnect
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

      # Adds outputs to an existing bridge.

      def add_bridge_outputs(
        bridge_arn : String,
        outputs : Array(Types::AddBridgeOutputRequest)
      ) : Protocol::Request
        input = Types::AddBridgeOutputsRequest.new(bridge_arn: bridge_arn, outputs: outputs)
        add_bridge_outputs(input)
      end

      def add_bridge_outputs(input : Types::AddBridgeOutputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_BRIDGE_OUTPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds sources to an existing bridge.

      def add_bridge_sources(
        bridge_arn : String,
        sources : Array(Types::AddBridgeSourceRequest)
      ) : Protocol::Request
        input = Types::AddBridgeSourcesRequest.new(bridge_arn: bridge_arn, sources: sources)
        add_bridge_sources(input)
      end

      def add_bridge_sources(input : Types::AddBridgeSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_BRIDGE_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds media streams to an existing flow. After you add a media stream to a flow, you can associate it
      # with a source and/or an output that uses the ST 2110 JPEG XS or CDI protocol.

      def add_flow_media_streams(
        flow_arn : String,
        media_streams : Array(Types::AddMediaStreamRequest)
      ) : Protocol::Request
        input = Types::AddFlowMediaStreamsRequest.new(flow_arn: flow_arn, media_streams: media_streams)
        add_flow_media_streams(input)
      end

      def add_flow_media_streams(input : Types::AddFlowMediaStreamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_FLOW_MEDIA_STREAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds outputs to an existing flow. You can create up to 50 outputs per flow.

      def add_flow_outputs(
        flow_arn : String,
        outputs : Array(Types::AddOutputRequest)
      ) : Protocol::Request
        input = Types::AddFlowOutputsRequest.new(flow_arn: flow_arn, outputs: outputs)
        add_flow_outputs(input)
      end

      def add_flow_outputs(input : Types::AddFlowOutputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_FLOW_OUTPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds sources to a flow.

      def add_flow_sources(
        flow_arn : String,
        sources : Array(Types::SetSourceRequest)
      ) : Protocol::Request
        input = Types::AddFlowSourcesRequest.new(flow_arn: flow_arn, sources: sources)
        add_flow_sources(input)
      end

      def add_flow_sources(input : Types::AddFlowSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_FLOW_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds VPC interfaces to a flow.

      def add_flow_vpc_interfaces(
        flow_arn : String,
        vpc_interfaces : Array(Types::VpcInterfaceRequest)
      ) : Protocol::Request
        input = Types::AddFlowVpcInterfacesRequest.new(flow_arn: flow_arn, vpc_interfaces: vpc_interfaces)
        add_flow_vpc_interfaces(input)
      end

      def add_flow_vpc_interfaces(input : Types::AddFlowVpcInterfacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_FLOW_VPC_INTERFACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about multiple router inputs in AWS Elemental MediaConnect.

      def batch_get_router_input(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetRouterInputRequest.new(arns: arns)
        batch_get_router_input(input)
      end

      def batch_get_router_input(input : Types::BatchGetRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about multiple router network interfaces in AWS Elemental MediaConnect.

      def batch_get_router_network_interface(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetRouterNetworkInterfaceRequest.new(arns: arns)
        batch_get_router_network_interface(input)
      end

      def batch_get_router_network_interface(input : Types::BatchGetRouterNetworkInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ROUTER_NETWORK_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about multiple router outputs in AWS Elemental MediaConnect.

      def batch_get_router_output(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetRouterOutputRequest.new(arns: arns)
        batch_get_router_output(input)
      end

      def batch_get_router_output(input : Types::BatchGetRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new bridge. The request must include one source.

      def create_bridge(
        name : String,
        placement_arn : String,
        sources : Array(Types::AddBridgeSourceRequest),
        egress_gateway_bridge : Types::AddEgressGatewayBridgeRequest? = nil,
        ingress_gateway_bridge : Types::AddIngressGatewayBridgeRequest? = nil,
        outputs : Array(Types::AddBridgeOutputRequest)? = nil,
        source_failover_config : Types::FailoverConfig? = nil
      ) : Protocol::Request
        input = Types::CreateBridgeRequest.new(name: name, placement_arn: placement_arn, sources: sources, egress_gateway_bridge: egress_gateway_bridge, ingress_gateway_bridge: ingress_gateway_bridge, outputs: outputs, source_failover_config: source_failover_config)
        create_bridge(input)
      end

      def create_bridge(input : Types::CreateBridgeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BRIDGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new flow. The request must include one source. The request optionally can include outputs
      # (up to 50) and entitlements (up to 50).

      def create_flow(
        name : String,
        availability_zone : String? = nil,
        entitlements : Array(Types::GrantEntitlementRequest)? = nil,
        flow_size : String? = nil,
        flow_tags : Hash(String, String)? = nil,
        maintenance : Types::AddMaintenance? = nil,
        media_streams : Array(Types::AddMediaStreamRequest)? = nil,
        ndi_config : Types::NdiConfig? = nil,
        outputs : Array(Types::AddOutputRequest)? = nil,
        source : Types::SetSourceRequest? = nil,
        source_failover_config : Types::FailoverConfig? = nil,
        source_monitoring_config : Types::MonitoringConfig? = nil,
        sources : Array(Types::SetSourceRequest)? = nil,
        vpc_interfaces : Array(Types::VpcInterfaceRequest)? = nil
      ) : Protocol::Request
        input = Types::CreateFlowRequest.new(name: name, availability_zone: availability_zone, entitlements: entitlements, flow_size: flow_size, flow_tags: flow_tags, maintenance: maintenance, media_streams: media_streams, ndi_config: ndi_config, outputs: outputs, source: source, source_failover_config: source_failover_config, source_monitoring_config: source_monitoring_config, sources: sources, vpc_interfaces: vpc_interfaces)
        create_flow(input)
      end

      def create_flow(input : Types::CreateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new gateway. The request must include at least one network (up to four).

      def create_gateway(
        egress_cidr_blocks : Array(String),
        name : String,
        networks : Array(Types::GatewayNetwork)
      ) : Protocol::Request
        input = Types::CreateGatewayRequest.new(egress_cidr_blocks: egress_cidr_blocks, name: name, networks: networks)
        create_gateway(input)
      end

      def create_gateway(input : Types::CreateGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new router input in AWS Elemental MediaConnect.

      def create_router_input(
        configuration : Types::RouterInputConfiguration,
        maximum_bitrate : Int64,
        name : String,
        routing_scope : String,
        tier : String,
        availability_zone : String? = nil,
        client_token : String? = nil,
        maintenance_configuration : Types::MaintenanceConfiguration? = nil,
        region_name : String? = nil,
        tags : Hash(String, String)? = nil,
        transit_encryption : Types::RouterInputTransitEncryption? = nil
      ) : Protocol::Request
        input = Types::CreateRouterInputRequest.new(configuration: configuration, maximum_bitrate: maximum_bitrate, name: name, routing_scope: routing_scope, tier: tier, availability_zone: availability_zone, client_token: client_token, maintenance_configuration: maintenance_configuration, region_name: region_name, tags: tags, transit_encryption: transit_encryption)
        create_router_input(input)
      end

      def create_router_input(input : Types::CreateRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new router network interface in AWS Elemental MediaConnect.

      def create_router_network_interface(
        configuration : Types::RouterNetworkInterfaceConfiguration,
        name : String,
        client_token : String? = nil,
        region_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRouterNetworkInterfaceRequest.new(configuration: configuration, name: name, client_token: client_token, region_name: region_name, tags: tags)
        create_router_network_interface(input)
      end

      def create_router_network_interface(input : Types::CreateRouterNetworkInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTER_NETWORK_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new router output in AWS Elemental MediaConnect.

      def create_router_output(
        configuration : Types::RouterOutputConfiguration,
        maximum_bitrate : Int64,
        name : String,
        routing_scope : String,
        tier : String,
        availability_zone : String? = nil,
        client_token : String? = nil,
        maintenance_configuration : Types::MaintenanceConfiguration? = nil,
        region_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRouterOutputRequest.new(configuration: configuration, maximum_bitrate: maximum_bitrate, name: name, routing_scope: routing_scope, tier: tier, availability_zone: availability_zone, client_token: client_token, maintenance_configuration: maintenance_configuration, region_name: region_name, tags: tags)
        create_router_output(input)
      end

      def create_router_output(input : Types::CreateRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a bridge. Before you can delete a bridge, you must stop the bridge.

      def delete_bridge(
        bridge_arn : String
      ) : Protocol::Request
        input = Types::DeleteBridgeRequest.new(bridge_arn: bridge_arn)
        delete_bridge(input)
      end

      def delete_bridge(input : Types::DeleteBridgeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BRIDGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a flow. Before you can delete a flow, you must stop the flow.

      def delete_flow(
        flow_arn : String
      ) : Protocol::Request
        input = Types::DeleteFlowRequest.new(flow_arn: flow_arn)
        delete_flow(input)
      end

      def delete_flow(input : Types::DeleteFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a gateway. Before you can delete a gateway, you must deregister its instances and delete its
      # bridges.

      def delete_gateway(
        gateway_arn : String
      ) : Protocol::Request
        input = Types::DeleteGatewayRequest.new(gateway_arn: gateway_arn)
        delete_gateway(input)
      end

      def delete_gateway(input : Types::DeleteGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a router input from AWS Elemental MediaConnect.

      def delete_router_input(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteRouterInputRequest.new(arn: arn)
        delete_router_input(input)
      end

      def delete_router_input(input : Types::DeleteRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a router network interface from AWS Elemental MediaConnect.

      def delete_router_network_interface(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteRouterNetworkInterfaceRequest.new(arn: arn)
        delete_router_network_interface(input)
      end

      def delete_router_network_interface(input : Types::DeleteRouterNetworkInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTER_NETWORK_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a router output from AWS Elemental MediaConnect.

      def delete_router_output(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteRouterOutputRequest.new(arn: arn)
        delete_router_output(input)
      end

      def delete_router_output(input : Types::DeleteRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters an instance. Before you deregister an instance, all bridges running on the instance must
      # be stopped. If you want to deregister an instance without stopping the bridges, you must use the
      # --force option.

      def deregister_gateway_instance(
        gateway_instance_arn : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeregisterGatewayInstanceRequest.new(gateway_instance_arn: gateway_instance_arn, force: force)
        deregister_gateway_instance(input)
      end

      def deregister_gateway_instance(input : Types::DeregisterGatewayInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_GATEWAY_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of a bridge.

      def describe_bridge(
        bridge_arn : String
      ) : Protocol::Request
        input = Types::DescribeBridgeRequest.new(bridge_arn: bridge_arn)
        describe_bridge(input)
      end

      def describe_bridge(input : Types::DescribeBridgeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BRIDGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of a flow. The response includes the flow Amazon Resource Name (ARN), name, and
      # Availability Zone, as well as details about the source, outputs, and entitlements.

      def describe_flow(
        flow_arn : String
      ) : Protocol::Request
        input = Types::DescribeFlowRequest.new(flow_arn: flow_arn)
        describe_flow(input)
      end

      def describe_flow(input : Types::DescribeFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The DescribeFlowSourceMetadata API is used to view information about the flow's source transport
      # stream and programs. This API displays status messages about the flow's source as well as details
      # about the program's video, audio, and other data.

      def describe_flow_source_metadata(
        flow_arn : String
      ) : Protocol::Request
        input = Types::DescribeFlowSourceMetadataRequest.new(flow_arn: flow_arn)
        describe_flow_source_metadata(input)
      end

      def describe_flow_source_metadata(input : Types::DescribeFlowSourceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLOW_SOURCE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the thumbnail for the flow source.

      def describe_flow_source_thumbnail(
        flow_arn : String
      ) : Protocol::Request
        input = Types::DescribeFlowSourceThumbnailRequest.new(flow_arn: flow_arn)
        describe_flow_source_thumbnail(input)
      end

      def describe_flow_source_thumbnail(input : Types::DescribeFlowSourceThumbnailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLOW_SOURCE_THUMBNAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of a gateway. The response includes the gateway Amazon Resource Name (ARN),
      # name, and CIDR blocks, as well as details about the networks.

      def describe_gateway(
        gateway_arn : String
      ) : Protocol::Request
        input = Types::DescribeGatewayRequest.new(gateway_arn: gateway_arn)
        describe_gateway(input)
      end

      def describe_gateway(input : Types::DescribeGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of an instance.

      def describe_gateway_instance(
        gateway_instance_arn : String
      ) : Protocol::Request
        input = Types::DescribeGatewayInstanceRequest.new(gateway_instance_arn: gateway_instance_arn)
        describe_gateway_instance(input)
      end

      def describe_gateway_instance(input : Types::DescribeGatewayInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GATEWAY_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of an offering. The response includes the offering description, duration,
      # outbound bandwidth, price, and Amazon Resource Name (ARN).

      def describe_offering(
        offering_arn : String
      ) : Protocol::Request
        input = Types::DescribeOfferingRequest.new(offering_arn: offering_arn)
        describe_offering(input)
      end

      def describe_offering(input : Types::DescribeOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details of a reservation. The response includes the reservation name, state, start date
      # and time, and the details of the offering that make up the rest of the reservation (such as price,
      # duration, and outbound bandwidth).

      def describe_reservation(
        reservation_arn : String
      ) : Protocol::Request
        input = Types::DescribeReservationRequest.new(reservation_arn: reservation_arn)
        describe_reservation(input)
      end

      def describe_reservation(input : Types::DescribeReservationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific router input in AWS Elemental MediaConnect.

      def get_router_input(
        arn : String
      ) : Protocol::Request
        input = Types::GetRouterInputRequest.new(arn: arn)
        get_router_input(input)
      end

      def get_router_input(input : Types::GetRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed metadata information about a specific router input source, including stream
      # details and connection state.

      def get_router_input_source_metadata(
        arn : String
      ) : Protocol::Request
        input = Types::GetRouterInputSourceMetadataRequest.new(arn: arn)
        get_router_input_source_metadata(input)
      end

      def get_router_input_source_metadata(input : Types::GetRouterInputSourceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTER_INPUT_SOURCE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the thumbnail for a router input in AWS Elemental MediaConnect.

      def get_router_input_thumbnail(
        arn : String
      ) : Protocol::Request
        input = Types::GetRouterInputThumbnailRequest.new(arn: arn)
        get_router_input_thumbnail(input)
      end

      def get_router_input_thumbnail(input : Types::GetRouterInputThumbnailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTER_INPUT_THUMBNAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific router network interface in AWS Elemental MediaConnect.

      def get_router_network_interface(
        arn : String
      ) : Protocol::Request
        input = Types::GetRouterNetworkInterfaceRequest.new(arn: arn)
        get_router_network_interface(input)
      end

      def get_router_network_interface(input : Types::GetRouterNetworkInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTER_NETWORK_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific router output in AWS Elemental MediaConnect.

      def get_router_output(
        arn : String
      ) : Protocol::Request
        input = Types::GetRouterOutputRequest.new(arn: arn)
        get_router_output(input)
      end

      def get_router_output(input : Types::GetRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants entitlements to an existing flow.

      def grant_flow_entitlements(
        entitlements : Array(Types::GrantEntitlementRequest),
        flow_arn : String
      ) : Protocol::Request
        input = Types::GrantFlowEntitlementsRequest.new(entitlements: entitlements, flow_arn: flow_arn)
        grant_flow_entitlements(input)
      end

      def grant_flow_entitlements(input : Types::GrantFlowEntitlementsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GRANT_FLOW_ENTITLEMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of bridges that are associated with this account and an optionally specified Amazon
      # Resource Name (ARN). This request returns a paginated result.

      def list_bridges(
        filter_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBridgesRequest.new(filter_arn: filter_arn, max_results: max_results, next_token: next_token)
        list_bridges(input)
      end

      def list_bridges(input : Types::ListBridgesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BRIDGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of all entitlements that have been granted to this account. This request returns 20
      # results per page.

      def list_entitlements(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEntitlementsRequest.new(max_results: max_results, next_token: next_token)
        list_entitlements(input)
      end

      def list_entitlements(input : Types::ListEntitlementsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITLEMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of flows that are associated with this account. This request returns a paginated
      # result.

      def list_flows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowsRequest.new(max_results: max_results, next_token: next_token)
        list_flows(input)
      end

      def list_flows(input : Types::ListFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of instances associated with the Amazon Web Services account. This request returns a
      # paginated result. You can use the filterArn property to display only the instances associated with
      # the selected Gateway Amazon Resource Name (ARN).

      def list_gateway_instances(
        filter_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewayInstancesRequest.new(filter_arn: filter_arn, max_results: max_results, next_token: next_token)
        list_gateway_instances(input)
      end

      def list_gateway_instances(input : Types::ListGatewayInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAY_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of gateways that are associated with this account. This request returns a paginated
      # result.

      def list_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_gateways(input)
      end

      def list_gateways(input : Types::ListGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of all offerings that are available to this account in the current Amazon Web
      # Services Region. If you have an active reservation (which means you've purchased an offering that
      # has already started and hasn't expired yet), your account isn't eligible for other offerings.

      def list_offerings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOfferingsRequest.new(max_results: max_results, next_token: next_token)
        list_offerings(input)
      end

      def list_offerings(input : Types::ListOfferingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OFFERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a list of all reservations that have been purchased by this account in the current Amazon
      # Web Services Region. This list includes all reservations in all states (such as active and expired).

      def list_reservations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReservationsRequest.new(max_results: max_results, next_token: next_token)
        list_reservations(input)
      end

      def list_reservations(input : Types::ListReservationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESERVATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of router inputs in AWS Elemental MediaConnect.

      def list_router_inputs(
        filters : Array(Types::RouterInputFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRouterInputsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_router_inputs(input)
      end

      def list_router_inputs(input : Types::ListRouterInputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTER_INPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of router network interfaces in AWS Elemental MediaConnect.

      def list_router_network_interfaces(
        filters : Array(Types::RouterNetworkInterfaceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRouterNetworkInterfacesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_router_network_interfaces(input)
      end

      def list_router_network_interfaces(input : Types::ListRouterNetworkInterfacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTER_NETWORK_INTERFACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of router outputs in AWS Elemental MediaConnect.

      def list_router_outputs(
        filters : Array(Types::RouterOutputFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRouterOutputsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_router_outputs(input)
      end

      def list_router_outputs(input : Types::ListRouterOutputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTER_OUTPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with a global resource in AWS Elemental MediaConnect. The API supports the
      # following global resources: router inputs, router outputs and router network interfaces.

      def list_tags_for_global_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForGlobalResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_global_resource(input)
      end

      def list_tags_for_global_resource(input : Types::ListTagsForGlobalResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_GLOBAL_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tags on a MediaConnect resource in the current region.

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

      # Submits a request to purchase an offering. If you already have an active reservation, you can't
      # purchase another offering.

      def purchase_offering(
        offering_arn : String,
        reservation_name : String,
        start : String
      ) : Protocol::Request
        input = Types::PurchaseOfferingRequest.new(offering_arn: offering_arn, reservation_name: reservation_name, start: start)
        purchase_offering(input)
      end

      def purchase_offering(input : Types::PurchaseOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PURCHASE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an output from a bridge.

      def remove_bridge_output(
        bridge_arn : String,
        output_name : String
      ) : Protocol::Request
        input = Types::RemoveBridgeOutputRequest.new(bridge_arn: bridge_arn, output_name: output_name)
        remove_bridge_output(input)
      end

      def remove_bridge_output(input : Types::RemoveBridgeOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_BRIDGE_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a source from a bridge.

      def remove_bridge_source(
        bridge_arn : String,
        source_name : String
      ) : Protocol::Request
        input = Types::RemoveBridgeSourceRequest.new(bridge_arn: bridge_arn, source_name: source_name)
        remove_bridge_source(input)
      end

      def remove_bridge_source(input : Types::RemoveBridgeSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_BRIDGE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a media stream from a flow. This action is only available if the media stream is not
      # associated with a source or output.

      def remove_flow_media_stream(
        flow_arn : String,
        media_stream_name : String
      ) : Protocol::Request
        input = Types::RemoveFlowMediaStreamRequest.new(flow_arn: flow_arn, media_stream_name: media_stream_name)
        remove_flow_media_stream(input)
      end

      def remove_flow_media_stream(input : Types::RemoveFlowMediaStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_FLOW_MEDIA_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an output from an existing flow. This request can be made only on an output that does not
      # have an entitlement associated with it. If the output has an entitlement, you must revoke the
      # entitlement instead. When an entitlement is revoked from a flow, the service automatically removes
      # the associated output.

      def remove_flow_output(
        flow_arn : String,
        output_arn : String
      ) : Protocol::Request
        input = Types::RemoveFlowOutputRequest.new(flow_arn: flow_arn, output_arn: output_arn)
        remove_flow_output(input)
      end

      def remove_flow_output(input : Types::RemoveFlowOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_FLOW_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a source from an existing flow. This request can be made only if there is more than one
      # source on the flow.

      def remove_flow_source(
        flow_arn : String,
        source_arn : String
      ) : Protocol::Request
        input = Types::RemoveFlowSourceRequest.new(flow_arn: flow_arn, source_arn: source_arn)
        remove_flow_source(input)
      end

      def remove_flow_source(input : Types::RemoveFlowSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_FLOW_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a VPC Interface from an existing flow. This request can be made only on a VPC interface that
      # does not have a Source or Output associated with it. If the VPC interface is referenced by a Source
      # or Output, you must first delete or update the Source or Output to no longer reference the VPC
      # interface.

      def remove_flow_vpc_interface(
        flow_arn : String,
        vpc_interface_name : String
      ) : Protocol::Request
        input = Types::RemoveFlowVpcInterfaceRequest.new(flow_arn: flow_arn, vpc_interface_name: vpc_interface_name)
        remove_flow_vpc_interface(input)
      end

      def remove_flow_vpc_interface(input : Types::RemoveFlowVpcInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_FLOW_VPC_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restarts a router input. This operation can be used to recover from errors or refresh the input
      # state.

      def restart_router_input(
        arn : String
      ) : Protocol::Request
        input = Types::RestartRouterInputRequest.new(arn: arn)
        restart_router_input(input)
      end

      def restart_router_input(input : Types::RestartRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTART_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restarts a router output. This operation can be used to recover from errors or refresh the output
      # state.

      def restart_router_output(
        arn : String
      ) : Protocol::Request
        input = Types::RestartRouterOutputRequest.new(arn: arn)
        restart_router_output(input)
      end

      def restart_router_output(input : Types::RestartRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTART_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes an entitlement from a flow. Once an entitlement is revoked, the content becomes unavailable
      # to the subscriber and the associated output is removed.

      def revoke_flow_entitlement(
        entitlement_arn : String,
        flow_arn : String
      ) : Protocol::Request
        input = Types::RevokeFlowEntitlementRequest.new(entitlement_arn: entitlement_arn, flow_arn: flow_arn)
        revoke_flow_entitlement(input)
      end

      def revoke_flow_entitlement(input : Types::RevokeFlowEntitlementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_FLOW_ENTITLEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a flow.

      def start_flow(
        flow_arn : String
      ) : Protocol::Request
        input = Types::StartFlowRequest.new(flow_arn: flow_arn)
        start_flow(input)
      end

      def start_flow(input : Types::StartFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a router input in AWS Elemental MediaConnect.

      def start_router_input(
        arn : String
      ) : Protocol::Request
        input = Types::StartRouterInputRequest.new(arn: arn)
        start_router_input(input)
      end

      def start_router_input(input : Types::StartRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a router output in AWS Elemental MediaConnect.

      def start_router_output(
        arn : String
      ) : Protocol::Request
        input = Types::StartRouterOutputRequest.new(arn: arn)
        start_router_output(input)
      end

      def start_router_output(input : Types::StartRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a flow.

      def stop_flow(
        flow_arn : String
      ) : Protocol::Request
        input = Types::StopFlowRequest.new(flow_arn: flow_arn)
        stop_flow(input)
      end

      def stop_flow(input : Types::StopFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a router input in AWS Elemental MediaConnect.

      def stop_router_input(
        arn : String
      ) : Protocol::Request
        input = Types::StopRouterInputRequest.new(arn: arn)
        stop_router_input(input)
      end

      def stop_router_input(input : Types::StopRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a router output in AWS Elemental MediaConnect.

      def stop_router_output(
        arn : String
      ) : Protocol::Request
        input = Types::StopRouterOutputRequest.new(arn: arn)
        stop_router_output(input)
      end

      def stop_router_output(input : Types::StopRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a global resource in AWS Elemental MediaConnect. The API supports the following global
      # resources: router inputs, router outputs and router network interfaces.

      def tag_global_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagGlobalResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_global_resource(input)
      end

      def tag_global_resource(input : Types::TagGlobalResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_GLOBAL_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to a resource with the specified resourceArn in the current region. If
      # existing tags on a resource are not specified in the request parameters, they are not changed. When
      # a resource is deleted, the tags associated with that resource are deleted as well.

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

      # Associates a router input with a router output in AWS Elemental MediaConnect.

      def take_router_input(
        router_output_arn : String,
        router_input_arn : String? = nil
      ) : Protocol::Request
        input = Types::TakeRouterInputRequest.new(router_output_arn: router_output_arn, router_input_arn: router_input_arn)
        take_router_input(input)
      end

      def take_router_input(input : Types::TakeRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAKE_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a global resource in AWS Elemental MediaConnect. The API supports the following
      # global resources: router inputs, router outputs and router network interfaces.

      def untag_global_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagGlobalResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_global_resource(input)
      end

      def untag_global_resource(input : Types::UntagGlobalResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_GLOBAL_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes specified tags from a resource in the current region.

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

      # Updates the bridge.

      def update_bridge(
        bridge_arn : String,
        egress_gateway_bridge : Types::UpdateEgressGatewayBridgeRequest? = nil,
        ingress_gateway_bridge : Types::UpdateIngressGatewayBridgeRequest? = nil,
        source_failover_config : Types::UpdateFailoverConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateBridgeRequest.new(bridge_arn: bridge_arn, egress_gateway_bridge: egress_gateway_bridge, ingress_gateway_bridge: ingress_gateway_bridge, source_failover_config: source_failover_config)
        update_bridge(input)
      end

      def update_bridge(input : Types::UpdateBridgeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRIDGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing bridge output.

      def update_bridge_output(
        bridge_arn : String,
        output_name : String,
        network_output : Types::UpdateBridgeNetworkOutputRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateBridgeOutputRequest.new(bridge_arn: bridge_arn, output_name: output_name, network_output: network_output)
        update_bridge_output(input)
      end

      def update_bridge_output(input : Types::UpdateBridgeOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRIDGE_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing bridge source.

      def update_bridge_source(
        bridge_arn : String,
        source_name : String,
        flow_source : Types::UpdateBridgeFlowSourceRequest? = nil,
        network_source : Types::UpdateBridgeNetworkSourceRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateBridgeSourceRequest.new(bridge_arn: bridge_arn, source_name: source_name, flow_source: flow_source, network_source: network_source)
        update_bridge_source(input)
      end

      def update_bridge_source(input : Types::UpdateBridgeSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRIDGE_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the bridge state.

      def update_bridge_state(
        bridge_arn : String,
        desired_state : String
      ) : Protocol::Request
        input = Types::UpdateBridgeStateRequest.new(bridge_arn: bridge_arn, desired_state: desired_state)
        update_bridge_state(input)
      end

      def update_bridge_state(input : Types::UpdateBridgeStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRIDGE_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing flow.

      def update_flow(
        flow_arn : String,
        flow_size : String? = nil,
        maintenance : Types::UpdateMaintenance? = nil,
        ndi_config : Types::NdiConfig? = nil,
        source_failover_config : Types::UpdateFailoverConfig? = nil,
        source_monitoring_config : Types::MonitoringConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowRequest.new(flow_arn: flow_arn, flow_size: flow_size, maintenance: maintenance, ndi_config: ndi_config, source_failover_config: source_failover_config, source_monitoring_config: source_monitoring_config)
        update_flow(input)
      end

      def update_flow(input : Types::UpdateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an entitlement. You can change an entitlement's description, subscribers, and encryption. If
      # you change the subscribers, the service will remove the outputs that are are used by the subscribers
      # that are removed.

      def update_flow_entitlement(
        entitlement_arn : String,
        flow_arn : String,
        description : String? = nil,
        encryption : Types::UpdateEncryption? = nil,
        entitlement_status : String? = nil,
        subscribers : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowEntitlementRequest.new(entitlement_arn: entitlement_arn, flow_arn: flow_arn, description: description, encryption: encryption, entitlement_status: entitlement_status, subscribers: subscribers)
        update_flow_entitlement(input)
      end

      def update_flow_entitlement(input : Types::UpdateFlowEntitlementRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_ENTITLEMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing media stream.

      def update_flow_media_stream(
        flow_arn : String,
        media_stream_name : String,
        attributes : Types::MediaStreamAttributesRequest? = nil,
        clock_rate : Int32? = nil,
        description : String? = nil,
        media_stream_type : String? = nil,
        video_format : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowMediaStreamRequest.new(flow_arn: flow_arn, media_stream_name: media_stream_name, attributes: attributes, clock_rate: clock_rate, description: description, media_stream_type: media_stream_type, video_format: video_format)
        update_flow_media_stream(input)
      end

      def update_flow_media_stream(input : Types::UpdateFlowMediaStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_MEDIA_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing flow output.

      def update_flow_output(
        flow_arn : String,
        output_arn : String,
        cidr_allow_list : Array(String)? = nil,
        description : String? = nil,
        destination : String? = nil,
        encryption : Types::UpdateEncryption? = nil,
        max_latency : Int32? = nil,
        media_stream_output_configurations : Array(Types::MediaStreamOutputConfigurationRequest)? = nil,
        min_latency : Int32? = nil,
        ndi_program_name : String? = nil,
        ndi_speed_hq_quality : Int32? = nil,
        output_status : String? = nil,
        port : Int32? = nil,
        protocol : String? = nil,
        remote_id : String? = nil,
        router_integration_state : String? = nil,
        router_integration_transit_encryption : Types::FlowTransitEncryption? = nil,
        sender_control_port : Int32? = nil,
        sender_ip_address : String? = nil,
        smoothing_latency : Int32? = nil,
        stream_id : String? = nil,
        vpc_interface_attachment : Types::VpcInterfaceAttachment? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowOutputRequest.new(flow_arn: flow_arn, output_arn: output_arn, cidr_allow_list: cidr_allow_list, description: description, destination: destination, encryption: encryption, max_latency: max_latency, media_stream_output_configurations: media_stream_output_configurations, min_latency: min_latency, ndi_program_name: ndi_program_name, ndi_speed_hq_quality: ndi_speed_hq_quality, output_status: output_status, port: port, protocol: protocol, remote_id: remote_id, router_integration_state: router_integration_state, router_integration_transit_encryption: router_integration_transit_encryption, sender_control_port: sender_control_port, sender_ip_address: sender_ip_address, smoothing_latency: smoothing_latency, stream_id: stream_id, vpc_interface_attachment: vpc_interface_attachment)
        update_flow_output(input)
      end

      def update_flow_output(input : Types::UpdateFlowOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the source of a flow.

      def update_flow_source(
        flow_arn : String,
        source_arn : String,
        decryption : Types::UpdateEncryption? = nil,
        description : String? = nil,
        entitlement_arn : String? = nil,
        gateway_bridge_source : Types::UpdateGatewayBridgeSourceRequest? = nil,
        ingest_port : Int32? = nil,
        max_bitrate : Int32? = nil,
        max_latency : Int32? = nil,
        max_sync_buffer : Int32? = nil,
        media_stream_source_configurations : Array(Types::MediaStreamSourceConfigurationRequest)? = nil,
        min_latency : Int32? = nil,
        protocol : String? = nil,
        router_integration_state : String? = nil,
        router_integration_transit_decryption : Types::FlowTransitEncryption? = nil,
        sender_control_port : Int32? = nil,
        sender_ip_address : String? = nil,
        source_listener_address : String? = nil,
        source_listener_port : Int32? = nil,
        stream_id : String? = nil,
        vpc_interface_name : String? = nil,
        whitelist_cidr : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowSourceRequest.new(flow_arn: flow_arn, source_arn: source_arn, decryption: decryption, description: description, entitlement_arn: entitlement_arn, gateway_bridge_source: gateway_bridge_source, ingest_port: ingest_port, max_bitrate: max_bitrate, max_latency: max_latency, max_sync_buffer: max_sync_buffer, media_stream_source_configurations: media_stream_source_configurations, min_latency: min_latency, protocol: protocol, router_integration_state: router_integration_state, router_integration_transit_decryption: router_integration_transit_decryption, sender_control_port: sender_control_port, sender_ip_address: sender_ip_address, source_listener_address: source_listener_address, source_listener_port: source_listener_port, stream_id: stream_id, vpc_interface_name: vpc_interface_name, whitelist_cidr: whitelist_cidr)
        update_flow_source(input)
      end

      def update_flow_source(input : Types::UpdateFlowSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing gateway instance.

      def update_gateway_instance(
        gateway_instance_arn : String,
        bridge_placement : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGatewayInstanceRequest.new(gateway_instance_arn: gateway_instance_arn, bridge_placement: bridge_placement)
        update_gateway_instance(input)
      end

      def update_gateway_instance(input : Types::UpdateGatewayInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing router input in AWS Elemental MediaConnect.

      def update_router_input(
        arn : String,
        configuration : Types::RouterInputConfiguration? = nil,
        maintenance_configuration : Types::MaintenanceConfiguration? = nil,
        maximum_bitrate : Int64? = nil,
        name : String? = nil,
        routing_scope : String? = nil,
        tier : String? = nil,
        transit_encryption : Types::RouterInputTransitEncryption? = nil
      ) : Protocol::Request
        input = Types::UpdateRouterInputRequest.new(arn: arn, configuration: configuration, maintenance_configuration: maintenance_configuration, maximum_bitrate: maximum_bitrate, name: name, routing_scope: routing_scope, tier: tier, transit_encryption: transit_encryption)
        update_router_input(input)
      end

      def update_router_input(input : Types::UpdateRouterInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing router network interface in AWS Elemental MediaConnect.

      def update_router_network_interface(
        arn : String,
        configuration : Types::RouterNetworkInterfaceConfiguration? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouterNetworkInterfaceRequest.new(arn: arn, configuration: configuration, name: name)
        update_router_network_interface(input)
      end

      def update_router_network_interface(input : Types::UpdateRouterNetworkInterfaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTER_NETWORK_INTERFACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing router output in AWS Elemental MediaConnect.

      def update_router_output(
        arn : String,
        configuration : Types::RouterOutputConfiguration? = nil,
        maintenance_configuration : Types::MaintenanceConfiguration? = nil,
        maximum_bitrate : Int64? = nil,
        name : String? = nil,
        routing_scope : String? = nil,
        tier : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouterOutputRequest.new(arn: arn, configuration: configuration, maintenance_configuration: maintenance_configuration, maximum_bitrate: maximum_bitrate, name: name, routing_scope: routing_scope, tier: tier)
        update_router_output(input)
      end

      def update_router_output(input : Types::UpdateRouterOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTER_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
