module AwsSdk
  module MediaLive
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

      # Accept an incoming input device transfer. The ownership of the device will transfer to your AWS
      # account.
      def accept_input_device_transfer(
        input_device_id : String
      ) : Protocol::Request
        input = Types::AcceptInputDeviceTransferRequest.new(input_device_id: input_device_id)
        accept_input_device_transfer(input)
      end
      def accept_input_device_transfer(input : Types::AcceptInputDeviceTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INPUT_DEVICE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts delete of resources.
      def batch_delete(
        channel_ids : Array(String)? = nil,
        input_ids : Array(String)? = nil,
        input_security_group_ids : Array(String)? = nil,
        multiplex_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteRequest.new(channel_ids: channel_ids, input_ids: input_ids, input_security_group_ids: input_security_group_ids, multiplex_ids: multiplex_ids)
        batch_delete(input)
      end
      def batch_delete(input : Types::BatchDeleteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts existing resources
      def batch_start(
        channel_ids : Array(String)? = nil,
        multiplex_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchStartRequest.new(channel_ids: channel_ids, multiplex_ids: multiplex_ids)
        batch_start(input)
      end
      def batch_start(input : Types::BatchStartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_START, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops running resources
      def batch_stop(
        channel_ids : Array(String)? = nil,
        multiplex_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchStopRequest.new(channel_ids: channel_ids, multiplex_ids: multiplex_ids)
        batch_stop(input)
      end
      def batch_stop(input : Types::BatchStopRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_STOP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a channel schedule
      def batch_update_schedule(
        channel_id : String,
        creates : Types::BatchScheduleActionCreateRequest? = nil,
        deletes : Types::BatchScheduleActionDeleteRequest? = nil
      ) : Protocol::Request
        input = Types::BatchUpdateScheduleRequest.new(channel_id: channel_id, creates: creates, deletes: deletes)
        batch_update_schedule(input)
      end
      def batch_update_schedule(input : Types::BatchUpdateScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancel an input device transfer that you have requested.
      def cancel_input_device_transfer(
        input_device_id : String
      ) : Protocol::Request
        input = Types::CancelInputDeviceTransferRequest.new(input_device_id: input_device_id)
        cancel_input_device_transfer(input)
      end
      def cancel_input_device_transfer(input : Types::CancelInputDeviceTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_INPUT_DEVICE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send a request to claim an AWS Elemental device that you have purchased from a third-party vendor.
      # After the request succeeds, you will own the device.
      def claim_device(
        id : String? = nil
      ) : Protocol::Request
        input = Types::ClaimDeviceRequest.new(id: id)
        claim_device(input)
      end
      def claim_device(input : Types::ClaimDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CLAIM_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new channel
      def create_channel(
        anywhere_settings : Types::AnywhereSettings? = nil,
        cdi_input_specification : Types::CdiInputSpecification? = nil,
        channel_class : String? = nil,
        channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
        destinations : Array(Types::OutputDestination)? = nil,
        dry_run : Bool? = nil,
        encoder_settings : Types::EncoderSettings? = nil,
        input_attachments : Array(Types::InputAttachment)? = nil,
        input_specification : Types::InputSpecification? = nil,
        linked_channel_settings : Types::LinkedChannelSettings? = nil,
        log_level : String? = nil,
        maintenance : Types::MaintenanceCreateSettings? = nil,
        name : String? = nil,
        request_id : String? = nil,
        reserved : String? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        vpc : Types::VpcOutputSettings? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(anywhere_settings: anywhere_settings, cdi_input_specification: cdi_input_specification, channel_class: channel_class, channel_engine_version: channel_engine_version, destinations: destinations, dry_run: dry_run, encoder_settings: encoder_settings, input_attachments: input_attachments, input_specification: input_specification, linked_channel_settings: linked_channel_settings, log_level: log_level, maintenance: maintenance, name: name, request_id: request_id, reserved: reserved, role_arn: role_arn, tags: tags, vpc: vpc)
        create_channel(input)
      end
      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a ChannelPlacementGroup in the specified Cluster. As part of the create operation, you
      # specify the Nodes to attach the group to.After you create a ChannelPlacementGroup, you add Channels
      # to the group (you do this by modifying the Channels to add them to a specific group). You now have
      # an association of Channels to ChannelPlacementGroup, and ChannelPlacementGroup to Nodes. This
      # association means that all the Channels in the group are able to run on any of the Nodes associated
      # with the group.
      def create_channel_placement_group(
        cluster_id : String,
        name : String? = nil,
        nodes : Array(String)? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelPlacementGroupRequest.new(cluster_id: cluster_id, name: name, nodes: nodes, request_id: request_id, tags: tags)
        create_channel_placement_group(input)
      end
      def create_channel_placement_group(input : Types::CreateChannelPlacementGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_PLACEMENT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a cloudwatch alarm template to dynamically generate cloudwatch metric alarms on targeted
      # resource types.
      def create_cloud_watch_alarm_template(
        comparison_operator : String,
        evaluation_periods : Int32,
        group_identifier : String,
        metric_name : String,
        name : String,
        period : Int32,
        statistic : String,
        target_resource_type : String,
        threshold : Float64,
        treat_missing_data : String,
        datapoints_to_alarm : Int32? = nil,
        description : String? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCloudWatchAlarmTemplateRequest.new(comparison_operator: comparison_operator, evaluation_periods: evaluation_periods, group_identifier: group_identifier, metric_name: metric_name, name: name, period: period, statistic: statistic, target_resource_type: target_resource_type, threshold: threshold, treat_missing_data: treat_missing_data, datapoints_to_alarm: datapoints_to_alarm, description: description, request_id: request_id, tags: tags)
        create_cloud_watch_alarm_template(input)
      end
      def create_cloud_watch_alarm_template(input : Types::CreateCloudWatchAlarmTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLOUD_WATCH_ALARM_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a cloudwatch alarm template group to group your cloudwatch alarm templates and to attach to
      # signal maps for dynamically creating alarms.
      def create_cloud_watch_alarm_template_group(
        name : String,
        description : String? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCloudWatchAlarmTemplateGroupRequest.new(name: name, description: description, request_id: request_id, tags: tags)
        create_cloud_watch_alarm_template_group(input)
      end
      def create_cloud_watch_alarm_template_group(input : Types::CreateCloudWatchAlarmTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new Cluster.
      def create_cluster(
        cluster_type : String? = nil,
        instance_role_arn : String? = nil,
        name : String? = nil,
        network_settings : Types::ClusterNetworkSettingsCreateRequest? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterRequest.new(cluster_type: cluster_type, instance_role_arn: instance_role_arn, name: name, network_settings: network_settings, request_id: request_id, tags: tags)
        create_cluster(input)
      end
      def create_cluster(input : Types::CreateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an eventbridge rule template to monitor events and send notifications to your targeted
      # resources.
      def create_event_bridge_rule_template(
        event_type : String,
        group_identifier : String,
        name : String,
        description : String? = nil,
        event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventBridgeRuleTemplateRequest.new(event_type: event_type, group_identifier: group_identifier, name: name, description: description, event_targets: event_targets, request_id: request_id, tags: tags)
        create_event_bridge_rule_template(input)
      end
      def create_event_bridge_rule_template(input : Types::CreateEventBridgeRuleTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_BRIDGE_RULE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an eventbridge rule template group to group your eventbridge rule templates and to attach to
      # signal maps for dynamically creating notification rules.
      def create_event_bridge_rule_template_group(
        name : String,
        description : String? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventBridgeRuleTemplateGroupRequest.new(name: name, description: description, request_id: request_id, tags: tags)
        create_event_bridge_rule_template_group(input)
      end
      def create_event_bridge_rule_template_group(input : Types::CreateEventBridgeRuleTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an input
      def create_input(
        destinations : Array(Types::InputDestinationRequest)? = nil,
        input_devices : Array(Types::InputDeviceSettings)? = nil,
        input_network_location : String? = nil,
        input_security_groups : Array(String)? = nil,
        media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
        multicast_settings : Types::MulticastSettingsCreateRequest? = nil,
        name : String? = nil,
        request_id : String? = nil,
        role_arn : String? = nil,
        router_settings : Types::RouterSettings? = nil,
        sdi_sources : Array(String)? = nil,
        smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
        sources : Array(Types::InputSourceRequest)? = nil,
        srt_settings : Types::SrtSettingsRequest? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil,
        vpc : Types::InputVpcRequest? = nil
      ) : Protocol::Request
        input = Types::CreateInputRequest.new(destinations: destinations, input_devices: input_devices, input_network_location: input_network_location, input_security_groups: input_security_groups, media_connect_flows: media_connect_flows, multicast_settings: multicast_settings, name: name, request_id: request_id, role_arn: role_arn, router_settings: router_settings, sdi_sources: sdi_sources, smpte2110_receiver_group_settings: smpte2110_receiver_group_settings, sources: sources, srt_settings: srt_settings, tags: tags, type: type, vpc: vpc)
        create_input(input)
      end
      def create_input(input : Types::CreateInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Input Security Group
      def create_input_security_group(
        tags : Hash(String, String)? = nil,
        whitelist_rules : Array(Types::InputWhitelistRuleCidr)? = nil
      ) : Protocol::Request
        input = Types::CreateInputSecurityGroupRequest.new(tags: tags, whitelist_rules: whitelist_rules)
        create_input_security_group(input)
      end
      def create_input_security_group(input : Types::CreateInputSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INPUT_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new multiplex.
      def create_multiplex(
        availability_zones : Array(String),
        multiplex_settings : Types::MultiplexSettings,
        name : String,
        request_id : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMultiplexRequest.new(availability_zones: availability_zones, multiplex_settings: multiplex_settings, name: name, request_id: request_id, tags: tags)
        create_multiplex(input)
      end
      def create_multiplex(input : Types::CreateMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new program in the multiplex.
      def create_multiplex_program(
        multiplex_id : String,
        multiplex_program_settings : Types::MultiplexProgramSettings,
        program_name : String,
        request_id : String
      ) : Protocol::Request
        input = Types::CreateMultiplexProgramRequest.new(multiplex_id: multiplex_id, multiplex_program_settings: multiplex_program_settings, program_name: program_name, request_id: request_id)
        create_multiplex_program(input)
      end
      def create_multiplex_program(input : Types::CreateMultiplexProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MULTIPLEX_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create as many Networks as you need. You will associate one or more Clusters with each Network.Each
      # Network provides MediaLive Anywhere with required information about the network in your organization
      # that you are using for video encoding using MediaLive.
      def create_network(
        ip_pools : Array(Types::IpPoolCreateRequest)? = nil,
        name : String? = nil,
        request_id : String? = nil,
        routes : Array(Types::RouteCreateRequest)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNetworkRequest.new(ip_pools: ip_pools, name: name, request_id: request_id, routes: routes, tags: tags)
        create_network(input)
      end
      def create_network(input : Types::CreateNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a Node in the specified Cluster. You can also create Nodes using the
      # CreateNodeRegistrationScript. Note that you can't move a Node to another Cluster.
      def create_node(
        cluster_id : String,
        name : String? = nil,
        node_interface_mappings : Array(Types::NodeInterfaceMappingCreateRequest)? = nil,
        request_id : String? = nil,
        role : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNodeRequest.new(cluster_id: cluster_id, name: name, node_interface_mappings: node_interface_mappings, request_id: request_id, role: role, tags: tags)
        create_node(input)
      end
      def create_node(input : Types::CreateNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create the Register Node script for all the nodes intended for a specific Cluster. You will then run
      # the script on each hardware unit that is intended for that Cluster. The script creates a Node in the
      # specified Cluster. It then binds the Node to this hardware unit, and activates the node hardware for
      # use with MediaLive Anywhere.
      def create_node_registration_script(
        cluster_id : String,
        id : String? = nil,
        name : String? = nil,
        node_interface_mappings : Array(Types::NodeInterfaceMapping)? = nil,
        request_id : String? = nil,
        role : String? = nil
      ) : Protocol::Request
        input = Types::CreateNodeRegistrationScriptRequest.new(cluster_id: cluster_id, id: id, name: name, node_interface_mappings: node_interface_mappings, request_id: request_id, role: role)
        create_node_registration_script(input)
      end
      def create_node_registration_script(input : Types::CreateNodeRegistrationScriptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NODE_REGISTRATION_SCRIPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a partner input
      def create_partner_input(
        input_id : String,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePartnerInputRequest.new(input_id: input_id, request_id: request_id, tags: tags)
        create_partner_input(input)
      end
      def create_partner_input(input : Types::CreatePartnerInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PARTNER_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an SdiSource for each video source that uses the SDI protocol. You will reference the
      # SdiSource when you create an SDI input in MediaLive. You will also reference it in an
      # SdiSourceMapping, in order to create a connection between the logical SdiSource and the physical SDI
      # card and port that the physical SDI source uses.
      def create_sdi_source(
        mode : String? = nil,
        name : String? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateSdiSourceRequest.new(mode: mode, name: name, request_id: request_id, tags: tags, type: type)
        create_sdi_source(input)
      end
      def create_sdi_source(input : Types::CreateSdiSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SDI_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates the creation of a new signal map. Will discover a new mediaResourceMap based on the
      # provided discoveryEntryPointArn.
      def create_signal_map(
        discovery_entry_point_arn : String,
        name : String,
        cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
        description : String? = nil,
        event_bridge_rule_template_group_identifiers : Array(String)? = nil,
        request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSignalMapRequest.new(discovery_entry_point_arn: discovery_entry_point_arn, name: name, cloud_watch_alarm_template_group_identifiers: cloud_watch_alarm_template_group_identifiers, description: description, event_bridge_rule_template_group_identifiers: event_bridge_rule_template_group_identifiers, request_id: request_id, tags: tags)
        create_signal_map(input)
      end
      def create_signal_map(input : Types::CreateSignalMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SIGNAL_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create tags for a resource
      def create_tags(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTagsRequest.new(resource_arn: resource_arn, tags: tags)
        create_tags(input)
      end
      def create_tags(input : Types::CreateTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts deletion of channel. The associated outputs are also deleted.
      def delete_channel(
        channel_id : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(channel_id: channel_id)
        delete_channel(input)
      end
      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the specified ChannelPlacementGroup that exists in the specified Cluster.
      def delete_channel_placement_group(
        channel_placement_group_id : String,
        cluster_id : String
      ) : Protocol::Request
        input = Types::DeleteChannelPlacementGroupRequest.new(channel_placement_group_id: channel_placement_group_id, cluster_id: cluster_id)
        delete_channel_placement_group(input)
      end
      def delete_channel_placement_group(input : Types::DeleteChannelPlacementGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_PLACEMENT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a cloudwatch alarm template.
      def delete_cloud_watch_alarm_template(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteCloudWatchAlarmTemplateRequest.new(identifier: identifier)
        delete_cloud_watch_alarm_template(input)
      end
      def delete_cloud_watch_alarm_template(input : Types::DeleteCloudWatchAlarmTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLOUD_WATCH_ALARM_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a cloudwatch alarm template group. You must detach this group from all signal maps and
      # ensure its existing templates are moved to another group or deleted.
      def delete_cloud_watch_alarm_template_group(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteCloudWatchAlarmTemplateGroupRequest.new(identifier: identifier)
        delete_cloud_watch_alarm_template_group(input)
      end
      def delete_cloud_watch_alarm_template_group(input : Types::DeleteCloudWatchAlarmTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a Cluster. The Cluster must be idle.
      def delete_cluster(
        cluster_id : String
      ) : Protocol::Request
        input = Types::DeleteClusterRequest.new(cluster_id: cluster_id)
        delete_cluster(input)
      end
      def delete_cluster(input : Types::DeleteClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an eventbridge rule template.
      def delete_event_bridge_rule_template(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEventBridgeRuleTemplateRequest.new(identifier: identifier)
        delete_event_bridge_rule_template(input)
      end
      def delete_event_bridge_rule_template(input : Types::DeleteEventBridgeRuleTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_BRIDGE_RULE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an eventbridge rule template group. You must detach this group from all signal maps and
      # ensure its existing templates are moved to another group or deleted.
      def delete_event_bridge_rule_template_group(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEventBridgeRuleTemplateGroupRequest.new(identifier: identifier)
        delete_event_bridge_rule_template_group(input)
      end
      def delete_event_bridge_rule_template_group(input : Types::DeleteEventBridgeRuleTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the input end point
      def delete_input(
        input_id : String
      ) : Protocol::Request
        input = Types::DeleteInputRequest.new(input_id: input_id)
        delete_input(input)
      end
      def delete_input(input : Types::DeleteInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Input Security Group
      def delete_input_security_group(
        input_security_group_id : String
      ) : Protocol::Request
        input = Types::DeleteInputSecurityGroupRequest.new(input_security_group_id: input_security_group_id)
        delete_input_security_group(input)
      end
      def delete_input_security_group(input : Types::DeleteInputSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INPUT_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a multiplex. The multiplex must be idle.
      def delete_multiplex(
        multiplex_id : String
      ) : Protocol::Request
        input = Types::DeleteMultiplexRequest.new(multiplex_id: multiplex_id)
        delete_multiplex(input)
      end
      def delete_multiplex(input : Types::DeleteMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a program from a multiplex.
      def delete_multiplex_program(
        multiplex_id : String,
        program_name : String
      ) : Protocol::Request
        input = Types::DeleteMultiplexProgramRequest.new(multiplex_id: multiplex_id, program_name: program_name)
        delete_multiplex_program(input)
      end
      def delete_multiplex_program(input : Types::DeleteMultiplexProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MULTIPLEX_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a Network. The Network must have no resources associated with it.
      def delete_network(
        network_id : String
      ) : Protocol::Request
        input = Types::DeleteNetworkRequest.new(network_id: network_id)
        delete_network(input)
      end
      def delete_network(input : Types::DeleteNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a Node. The Node must be IDLE.
      def delete_node(
        cluster_id : String,
        node_id : String
      ) : Protocol::Request
        input = Types::DeleteNodeRequest.new(cluster_id: cluster_id, node_id: node_id)
        delete_node(input)
      end
      def delete_node(input : Types::DeleteNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an expired reservation.
      def delete_reservation(
        reservation_id : String
      ) : Protocol::Request
        input = Types::DeleteReservationRequest.new(reservation_id: reservation_id)
        delete_reservation(input)
      end
      def delete_reservation(input : Types::DeleteReservationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESERVATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete all schedule actions on a channel.
      def delete_schedule(
        channel_id : String
      ) : Protocol::Request
        input = Types::DeleteScheduleRequest.new(channel_id: channel_id)
        delete_schedule(input)
      end
      def delete_schedule(input : Types::DeleteScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an SdiSource. The SdiSource must not be part of any SidSourceMapping and must not be attached
      # to any input.
      def delete_sdi_source(
        sdi_source_id : String
      ) : Protocol::Request
        input = Types::DeleteSdiSourceRequest.new(sdi_source_id: sdi_source_id)
        delete_sdi_source(input)
      end
      def delete_sdi_source(input : Types::DeleteSdiSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SDI_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified signal map.
      def delete_signal_map(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteSignalMapRequest.new(identifier: identifier)
        delete_signal_map(input)
      end
      def delete_signal_map(input : Types::DeleteSignalMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SIGNAL_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags for a resource
      def delete_tags(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::DeleteTagsRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        delete_tags(input)
      end
      def delete_tags(input : Types::DeleteTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe account configuration
      def describe_account_configuration : Protocol::Request
        input = Types::DescribeAccountConfigurationRequest.new
        describe_account_configuration(input)
      end
      def describe_account_configuration(input : Types::DescribeAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a channel
      def describe_channel(
        channel_id : String
      ) : Protocol::Request
        input = Types::DescribeChannelRequest.new(channel_id: channel_id)
        describe_channel(input)
      end
      def describe_channel(input : Types::DescribeChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details about a ChannelPlacementGroup.
      def describe_channel_placement_group(
        channel_placement_group_id : String,
        cluster_id : String
      ) : Protocol::Request
        input = Types::DescribeChannelPlacementGroupRequest.new(channel_placement_group_id: channel_placement_group_id, cluster_id: cluster_id)
        describe_channel_placement_group(input)
      end
      def describe_channel_placement_group(input : Types::DescribeChannelPlacementGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL_PLACEMENT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details about a Cluster.
      def describe_cluster(
        cluster_id : String
      ) : Protocol::Request
        input = Types::DescribeClusterRequest.new(cluster_id: cluster_id)
        describe_cluster(input)
      end
      def describe_cluster(input : Types::DescribeClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces details about an input
      def describe_input(
        input_id : String
      ) : Protocol::Request
        input = Types::DescribeInputRequest.new(input_id: input_id)
        describe_input(input)
      end
      def describe_input(input : Types::DescribeInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details for the input device
      def describe_input_device(
        input_device_id : String
      ) : Protocol::Request
        input = Types::DescribeInputDeviceRequest.new(input_device_id: input_device_id)
        describe_input_device(input)
      end
      def describe_input_device(input : Types::DescribeInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the latest thumbnail data for the input device.
      def describe_input_device_thumbnail(
        accept : String,
        input_device_id : String
      ) : Protocol::Request
        input = Types::DescribeInputDeviceThumbnailRequest.new(accept: accept, input_device_id: input_device_id)
        describe_input_device_thumbnail(input)
      end
      def describe_input_device_thumbnail(input : Types::DescribeInputDeviceThumbnailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INPUT_DEVICE_THUMBNAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces a summary of an Input Security Group
      def describe_input_security_group(
        input_security_group_id : String
      ) : Protocol::Request
        input = Types::DescribeInputSecurityGroupRequest.new(input_security_group_id: input_security_group_id)
        describe_input_security_group(input)
      end
      def describe_input_security_group(input : Types::DescribeInputSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INPUT_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a multiplex.
      def describe_multiplex(
        multiplex_id : String
      ) : Protocol::Request
        input = Types::DescribeMultiplexRequest.new(multiplex_id: multiplex_id)
        describe_multiplex(input)
      end
      def describe_multiplex(input : Types::DescribeMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the details for a program in a multiplex.
      def describe_multiplex_program(
        multiplex_id : String,
        program_name : String
      ) : Protocol::Request
        input = Types::DescribeMultiplexProgramRequest.new(multiplex_id: multiplex_id, program_name: program_name)
        describe_multiplex_program(input)
      end
      def describe_multiplex_program(input : Types::DescribeMultiplexProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MULTIPLEX_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details about a Network.
      def describe_network(
        network_id : String
      ) : Protocol::Request
        input = Types::DescribeNetworkRequest.new(network_id: network_id)
        describe_network(input)
      end
      def describe_network(input : Types::DescribeNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details about a Node in the specified Cluster.
      def describe_node(
        cluster_id : String,
        node_id : String
      ) : Protocol::Request
        input = Types::DescribeNodeRequest.new(cluster_id: cluster_id, node_id: node_id)
        describe_node(input)
      end
      def describe_node(input : Types::DescribeNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details for an offering.
      def describe_offering(
        offering_id : String
      ) : Protocol::Request
        input = Types::DescribeOfferingRequest.new(offering_id: offering_id)
        describe_offering(input)
      end
      def describe_offering(input : Types::DescribeOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details for a reservation.
      def describe_reservation(
        reservation_id : String
      ) : Protocol::Request
        input = Types::DescribeReservationRequest.new(reservation_id: reservation_id)
        describe_reservation(input)
      end
      def describe_reservation(input : Types::DescribeReservationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESERVATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a channel schedule
      def describe_schedule(
        channel_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeScheduleRequest.new(channel_id: channel_id, max_results: max_results, next_token: next_token)
        describe_schedule(input)
      end
      def describe_schedule(input : Types::DescribeScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a SdiSource.
      def describe_sdi_source(
        sdi_source_id : String
      ) : Protocol::Request
        input = Types::DescribeSdiSourceRequest.new(sdi_source_id: sdi_source_id)
        describe_sdi_source(input)
      end
      def describe_sdi_source(input : Types::DescribeSdiSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SDI_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe the latest thumbnails data.
      def describe_thumbnails(
        channel_id : String,
        pipeline_id : String,
        thumbnail_type : String
      ) : Protocol::Request
        input = Types::DescribeThumbnailsRequest.new(channel_id: channel_id, pipeline_id: pipeline_id, thumbnail_type: thumbnail_type)
        describe_thumbnails(input)
      end
      def describe_thumbnails(input : Types::DescribeThumbnailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THUMBNAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified cloudwatch alarm template.
      def get_cloud_watch_alarm_template(
        identifier : String
      ) : Protocol::Request
        input = Types::GetCloudWatchAlarmTemplateRequest.new(identifier: identifier)
        get_cloud_watch_alarm_template(input)
      end
      def get_cloud_watch_alarm_template(input : Types::GetCloudWatchAlarmTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLOUD_WATCH_ALARM_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified cloudwatch alarm template group.
      def get_cloud_watch_alarm_template_group(
        identifier : String
      ) : Protocol::Request
        input = Types::GetCloudWatchAlarmTemplateGroupRequest.new(identifier: identifier)
        get_cloud_watch_alarm_template_group(input)
      end
      def get_cloud_watch_alarm_template_group(input : Types::GetCloudWatchAlarmTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLOUD_WATCH_ALARM_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified eventbridge rule template.
      def get_event_bridge_rule_template(
        identifier : String
      ) : Protocol::Request
        input = Types::GetEventBridgeRuleTemplateRequest.new(identifier: identifier)
        get_event_bridge_rule_template(input)
      end
      def get_event_bridge_rule_template(input : Types::GetEventBridgeRuleTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_BRIDGE_RULE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified eventbridge rule template group.
      def get_event_bridge_rule_template_group(
        identifier : String
      ) : Protocol::Request
        input = Types::GetEventBridgeRuleTemplateGroupRequest.new(identifier: identifier)
        get_event_bridge_rule_template_group(input)
      end
      def get_event_bridge_rule_template_group(input : Types::GetEventBridgeRuleTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_BRIDGE_RULE_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified signal map.
      def get_signal_map(
        identifier : String
      ) : Protocol::Request
        input = Types::GetSignalMapRequest.new(identifier: identifier)
        get_signal_map(input)
      end
      def get_signal_map(input : Types::GetSignalMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIGNAL_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the alerts for a channel with optional filtering based on alert state.
      def list_alerts(
        channel_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListAlertsRequest.new(channel_id: channel_id, max_results: max_results, next_token: next_token, state_filter: state_filter)
        list_alerts(input)
      end
      def list_alerts(input : Types::ListAlertsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALERTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the list of ChannelPlacementGroups in the specified Cluster.
      def list_channel_placement_groups(
        cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelPlacementGroupsRequest.new(cluster_id: cluster_id, max_results: max_results, next_token: next_token)
        list_channel_placement_groups(input)
      end
      def list_channel_placement_groups(input : Types::ListChannelPlacementGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_PLACEMENT_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces list of channels that have been created
      def list_channels(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(max_results: max_results, next_token: next_token)
        list_channels(input)
      end
      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists cloudwatch alarm template groups.
      def list_cloud_watch_alarm_template_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        scope : String? = nil,
        signal_map_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListCloudWatchAlarmTemplateGroupsRequest.new(max_results: max_results, next_token: next_token, scope: scope, signal_map_identifier: signal_map_identifier)
        list_cloud_watch_alarm_template_groups(input)
      end
      def list_cloud_watch_alarm_template_groups(input : Types::ListCloudWatchAlarmTemplateGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLOUD_WATCH_ALARM_TEMPLATE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists cloudwatch alarm templates.
      def list_cloud_watch_alarm_templates(
        group_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scope : String? = nil,
        signal_map_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListCloudWatchAlarmTemplatesRequest.new(group_identifier: group_identifier, max_results: max_results, next_token: next_token, scope: scope, signal_map_identifier: signal_map_identifier)
        list_cloud_watch_alarm_templates(input)
      end
      def list_cloud_watch_alarm_templates(input : Types::ListCloudWatchAlarmTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLOUD_WATCH_ALARM_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the alerts for a cluster with optional filtering based on alert state.
      def list_cluster_alerts(
        cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListClusterAlertsRequest.new(cluster_id: cluster_id, max_results: max_results, next_token: next_token, state_filter: state_filter)
        list_cluster_alerts(input)
      end
      def list_cluster_alerts(input : Types::ListClusterAlertsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTER_ALERTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the list of Clusters.
      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersRequest.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end
      def list_clusters(input : Types::ListClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists eventbridge rule template groups.
      def list_event_bridge_rule_template_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        signal_map_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListEventBridgeRuleTemplateGroupsRequest.new(max_results: max_results, next_token: next_token, signal_map_identifier: signal_map_identifier)
        list_event_bridge_rule_template_groups(input)
      end
      def list_event_bridge_rule_template_groups(input : Types::ListEventBridgeRuleTemplateGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_BRIDGE_RULE_TEMPLATE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists eventbridge rule templates.
      def list_event_bridge_rule_templates(
        group_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        signal_map_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListEventBridgeRuleTemplatesRequest.new(group_identifier: group_identifier, max_results: max_results, next_token: next_token, signal_map_identifier: signal_map_identifier)
        list_event_bridge_rule_templates(input)
      end
      def list_event_bridge_rule_templates(input : Types::ListEventBridgeRuleTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_BRIDGE_RULE_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List input devices that are currently being transferred. List input devices that you are
      # transferring from your AWS account or input devices that another AWS account is transferring to you.
      def list_input_device_transfers(
        transfer_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputDeviceTransfersRequest.new(transfer_type: transfer_type, max_results: max_results, next_token: next_token)
        list_input_device_transfers(input)
      end
      def list_input_device_transfers(input : Types::ListInputDeviceTransfersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUT_DEVICE_TRANSFERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List input devices
      def list_input_devices(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputDevicesRequest.new(max_results: max_results, next_token: next_token)
        list_input_devices(input)
      end
      def list_input_devices(input : Types::ListInputDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUT_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces a list of Input Security Groups for an account
      def list_input_security_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputSecurityGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_input_security_groups(input)
      end
      def list_input_security_groups(input : Types::ListInputSecurityGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUT_SECURITY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces list of inputs that have been created
      def list_inputs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInputsRequest.new(max_results: max_results, next_token: next_token)
        list_inputs(input)
      end
      def list_inputs(input : Types::ListInputsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INPUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the alerts for a multiplex with optional filtering based on alert state.
      def list_multiplex_alerts(
        multiplex_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListMultiplexAlertsRequest.new(multiplex_id: multiplex_id, max_results: max_results, next_token: next_token, state_filter: state_filter)
        list_multiplex_alerts(input)
      end
      def list_multiplex_alerts(input : Types::ListMultiplexAlertsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTIPLEX_ALERTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the programs that currently exist for a specific multiplex.
      def list_multiplex_programs(
        multiplex_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMultiplexProgramsRequest.new(multiplex_id: multiplex_id, max_results: max_results, next_token: next_token)
        list_multiplex_programs(input)
      end
      def list_multiplex_programs(input : Types::ListMultiplexProgramsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTIPLEX_PROGRAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of the existing multiplexes.
      def list_multiplexes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMultiplexesRequest.new(max_results: max_results, next_token: next_token)
        list_multiplexes(input)
      end
      def list_multiplexes(input : Types::ListMultiplexesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTIPLEXES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the list of Networks.
      def list_networks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNetworksRequest.new(max_results: max_results, next_token: next_token)
        list_networks(input)
      end
      def list_networks(input : Types::ListNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the list of Nodes.
      def list_nodes(
        cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNodesRequest.new(cluster_id: cluster_id, max_results: max_results, next_token: next_token)
        list_nodes(input)
      end
      def list_nodes(input : Types::ListNodesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List offerings available for purchase.
      def list_offerings(
        channel_class : String? = nil,
        channel_configuration : String? = nil,
        codec : String? = nil,
        duration : String? = nil,
        max_results : Int32? = nil,
        maximum_bitrate : String? = nil,
        maximum_framerate : String? = nil,
        next_token : String? = nil,
        resolution : String? = nil,
        resource_type : String? = nil,
        special_feature : String? = nil,
        video_quality : String? = nil
      ) : Protocol::Request
        input = Types::ListOfferingsRequest.new(channel_class: channel_class, channel_configuration: channel_configuration, codec: codec, duration: duration, max_results: max_results, maximum_bitrate: maximum_bitrate, maximum_framerate: maximum_framerate, next_token: next_token, resolution: resolution, resource_type: resource_type, special_feature: special_feature, video_quality: video_quality)
        list_offerings(input)
      end
      def list_offerings(input : Types::ListOfferingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OFFERINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List purchased reservations.
      def list_reservations(
        channel_class : String? = nil,
        codec : String? = nil,
        max_results : Int32? = nil,
        maximum_bitrate : String? = nil,
        maximum_framerate : String? = nil,
        next_token : String? = nil,
        resolution : String? = nil,
        resource_type : String? = nil,
        special_feature : String? = nil,
        video_quality : String? = nil
      ) : Protocol::Request
        input = Types::ListReservationsRequest.new(channel_class: channel_class, codec: codec, max_results: max_results, maximum_bitrate: maximum_bitrate, maximum_framerate: maximum_framerate, next_token: next_token, resolution: resolution, resource_type: resource_type, special_feature: special_feature, video_quality: video_quality)
        list_reservations(input)
      end
      def list_reservations(input : Types::ListReservationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESERVATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the SdiSources in the AWS account.
      def list_sdi_sources(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSdiSourcesRequest.new(max_results: max_results, next_token: next_token)
        list_sdi_sources(input)
      end
      def list_sdi_sources(input : Types::ListSdiSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SDI_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists signal maps.
      def list_signal_maps(
        cloud_watch_alarm_template_group_identifier : String? = nil,
        event_bridge_rule_template_group_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSignalMapsRequest.new(cloud_watch_alarm_template_group_identifier: cloud_watch_alarm_template_group_identifier, event_bridge_rule_template_group_identifier: event_bridge_rule_template_group_identifier, max_results: max_results, next_token: next_token)
        list_signal_maps(input)
      end
      def list_signal_maps(input : Types::ListSignalMapsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIGNAL_MAPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Produces list of tags that have been created for a resource
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

      # Retrieves an array of all the encoder engine versions that are available in this AWS account.
      def list_versions : Protocol::Request
        input = Types::ListVersionsRequest.new
        list_versions(input)
      end
      def list_versions(input : Types::ListVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Purchase an offering and create a reservation.
      def purchase_offering(
        count : Int32,
        offering_id : String,
        name : String? = nil,
        renewal_settings : Types::RenewalSettings? = nil,
        request_id : String? = nil,
        start : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PurchaseOfferingRequest.new(count: count, offering_id: offering_id, name: name, renewal_settings: renewal_settings, request_id: request_id, start: start, tags: tags)
        purchase_offering(input)
      end
      def purchase_offering(input : Types::PurchaseOfferingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PURCHASE_OFFERING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send a reboot command to the specified input device. The device will begin rebooting within a few
      # seconds of sending the command. When the reboot is complete, the device’s connection status will
      # change to connected.
      def reboot_input_device(
        input_device_id : String,
        force : String? = nil
      ) : Protocol::Request
        input = Types::RebootInputDeviceRequest.new(input_device_id: input_device_id, force: force)
        reboot_input_device(input)
      end
      def reboot_input_device(input : Types::RebootInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REBOOT_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reject the transfer of the specified input device to your AWS account.
      def reject_input_device_transfer(
        input_device_id : String
      ) : Protocol::Request
        input = Types::RejectInputDeviceTransferRequest.new(input_device_id: input_device_id)
        reject_input_device_transfer(input)
      end
      def reject_input_device_transfer(input : Types::RejectInputDeviceTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_INPUT_DEVICE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restart pipelines in one channel that is currently running.
      def restart_channel_pipelines(
        channel_id : String,
        pipeline_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RestartChannelPipelinesRequest.new(channel_id: channel_id, pipeline_ids: pipeline_ids)
        restart_channel_pipelines(input)
      end
      def restart_channel_pipelines(input : Types::RestartChannelPipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTART_CHANNEL_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an existing channel
      def start_channel(
        channel_id : String
      ) : Protocol::Request
        input = Types::StartChannelRequest.new(channel_id: channel_id)
        start_channel(input)
      end
      def start_channel(input : Types::StartChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a deployment to delete the monitor of the specified signal map.
      def start_delete_monitor_deployment(
        identifier : String
      ) : Protocol::Request
        input = Types::StartDeleteMonitorDeploymentRequest.new(identifier: identifier)
        start_delete_monitor_deployment(input)
      end
      def start_delete_monitor_deployment(input : Types::StartDeleteMonitorDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DELETE_MONITOR_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start an input device that is attached to a MediaConnect flow. (There is no need to start a device
      # that is attached to a MediaLive input; MediaLive starts the device when the channel starts.)
      def start_input_device(
        input_device_id : String
      ) : Protocol::Request
        input = Types::StartInputDeviceRequest.new(input_device_id: input_device_id)
        start_input_device(input)
      end
      def start_input_device(input : Types::StartInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start a maintenance window for the specified input device. Starting a maintenance window will give
      # the device up to two hours to install software. If the device was streaming prior to the
      # maintenance, it will resume streaming when the software is fully installed. Devices automatically
      # install updates while they are powered on and their MediaLive channels are stopped. A maintenance
      # window allows you to update a device without having to stop MediaLive channels that use the device.
      # The device must remain powered on and connected to the internet for the duration of the maintenance.
      def start_input_device_maintenance_window(
        input_device_id : String
      ) : Protocol::Request
        input = Types::StartInputDeviceMaintenanceWindowRequest.new(input_device_id: input_device_id)
        start_input_device_maintenance_window(input)
      end
      def start_input_device_maintenance_window(input : Types::StartInputDeviceMaintenanceWindowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INPUT_DEVICE_MAINTENANCE_WINDOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a deployment to deploy the latest monitor of the specified signal map.
      def start_monitor_deployment(
        identifier : String,
        dry_run : Bool? = nil
      ) : Protocol::Request
        input = Types::StartMonitorDeploymentRequest.new(identifier: identifier, dry_run: dry_run)
        start_monitor_deployment(input)
      end
      def start_monitor_deployment(input : Types::StartMonitorDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MONITOR_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly
      # start each channel.
      def start_multiplex(
        multiplex_id : String
      ) : Protocol::Request
        input = Types::StartMultiplexRequest.new(multiplex_id: multiplex_id)
        start_multiplex(input)
      end
      def start_multiplex(input : Types::StartMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates an update for the specified signal map. Will discover a new signal map if a changed
      # discoveryEntryPointArn is provided.
      def start_update_signal_map(
        identifier : String,
        cloud_watch_alarm_template_group_identifiers : Array(String)? = nil,
        description : String? = nil,
        discovery_entry_point_arn : String? = nil,
        event_bridge_rule_template_group_identifiers : Array(String)? = nil,
        force_rediscovery : Bool? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::StartUpdateSignalMapRequest.new(identifier: identifier, cloud_watch_alarm_template_group_identifiers: cloud_watch_alarm_template_group_identifiers, description: description, discovery_entry_point_arn: discovery_entry_point_arn, event_bridge_rule_template_group_identifiers: event_bridge_rule_template_group_identifiers, force_rediscovery: force_rediscovery, name: name)
        start_update_signal_map(input)
      end
      def start_update_signal_map(input : Types::StartUpdateSignalMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_UPDATE_SIGNAL_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a running channel
      def stop_channel(
        channel_id : String
      ) : Protocol::Request
        input = Types::StopChannelRequest.new(channel_id: channel_id)
        stop_channel(input)
      end
      def stop_channel(input : Types::StopChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stop an input device that is attached to a MediaConnect flow. (There is no need to stop a device
      # that is attached to a MediaLive input; MediaLive automatically stops the device when the channel
      # stops.)
      def stop_input_device(
        input_device_id : String
      ) : Protocol::Request
        input = Types::StopInputDeviceRequest.new(input_device_id: input_device_id)
        stop_input_device(input)
      end
      def stop_input_device(input : Types::StopInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a running multiplex. If the multiplex isn't running, this action has no effect.
      def stop_multiplex(
        multiplex_id : String
      ) : Protocol::Request
        input = Types::StopMultiplexRequest.new(multiplex_id: multiplex_id)
        stop_multiplex(input)
      end
      def stop_multiplex(input : Types::StopMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start an input device transfer to another AWS account. After you make the request, the other account
      # must accept or reject the transfer.
      def transfer_input_device(
        input_device_id : String,
        target_customer_id : String? = nil,
        target_region : String? = nil,
        transfer_message : String? = nil
      ) : Protocol::Request
        input = Types::TransferInputDeviceRequest.new(input_device_id: input_device_id, target_customer_id: target_customer_id, target_region: target_region, transfer_message: transfer_message)
        transfer_input_device(input)
      end
      def transfer_input_device(input : Types::TransferInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TRANSFER_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update account configuration
      def update_account_configuration(
        account_configuration : Types::AccountConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountConfigurationRequest.new(account_configuration: account_configuration)
        update_account_configuration(input)
      end
      def update_account_configuration(input : Types::UpdateAccountConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a channel.
      def update_channel(
        channel_id : String,
        anywhere_settings : Types::AnywhereSettings? = nil,
        cdi_input_specification : Types::CdiInputSpecification? = nil,
        channel_engine_version : Types::ChannelEngineVersionRequest? = nil,
        destinations : Array(Types::OutputDestination)? = nil,
        dry_run : Bool? = nil,
        encoder_settings : Types::EncoderSettings? = nil,
        input_attachments : Array(Types::InputAttachment)? = nil,
        input_specification : Types::InputSpecification? = nil,
        linked_channel_settings : Types::LinkedChannelSettings? = nil,
        log_level : String? = nil,
        maintenance : Types::MaintenanceUpdateSettings? = nil,
        name : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(channel_id: channel_id, anywhere_settings: anywhere_settings, cdi_input_specification: cdi_input_specification, channel_engine_version: channel_engine_version, destinations: destinations, dry_run: dry_run, encoder_settings: encoder_settings, input_attachments: input_attachments, input_specification: input_specification, linked_channel_settings: linked_channel_settings, log_level: log_level, maintenance: maintenance, name: name, role_arn: role_arn)
        update_channel(input)
      end
      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the class of the channel.
      def update_channel_class(
        channel_class : String,
        channel_id : String,
        destinations : Array(Types::OutputDestination)? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelClassRequest.new(channel_class: channel_class, channel_id: channel_id, destinations: destinations)
        update_channel_class(input)
      end
      def update_channel_class(input : Types::UpdateChannelClassRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_CLASS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change the settings for a ChannelPlacementGroup.
      def update_channel_placement_group(
        channel_placement_group_id : String,
        cluster_id : String,
        name : String? = nil,
        nodes : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelPlacementGroupRequest.new(channel_placement_group_id: channel_placement_group_id, cluster_id: cluster_id, name: name, nodes: nodes)
        update_channel_placement_group(input)
      end
      def update_channel_placement_group(input : Types::UpdateChannelPlacementGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_PLACEMENT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified cloudwatch alarm template.
      def update_cloud_watch_alarm_template(
        identifier : String,
        comparison_operator : String? = nil,
        datapoints_to_alarm : Int32? = nil,
        description : String? = nil,
        evaluation_periods : Int32? = nil,
        group_identifier : String? = nil,
        metric_name : String? = nil,
        name : String? = nil,
        period : Int32? = nil,
        statistic : String? = nil,
        target_resource_type : String? = nil,
        threshold : Float64? = nil,
        treat_missing_data : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCloudWatchAlarmTemplateRequest.new(identifier: identifier, comparison_operator: comparison_operator, datapoints_to_alarm: datapoints_to_alarm, description: description, evaluation_periods: evaluation_periods, group_identifier: group_identifier, metric_name: metric_name, name: name, period: period, statistic: statistic, target_resource_type: target_resource_type, threshold: threshold, treat_missing_data: treat_missing_data)
        update_cloud_watch_alarm_template(input)
      end
      def update_cloud_watch_alarm_template(input : Types::UpdateCloudWatchAlarmTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLOUD_WATCH_ALARM_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified cloudwatch alarm template group.
      def update_cloud_watch_alarm_template_group(
        identifier : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCloudWatchAlarmTemplateGroupRequest.new(identifier: identifier, description: description)
        update_cloud_watch_alarm_template_group(input)
      end
      def update_cloud_watch_alarm_template_group(input : Types::UpdateCloudWatchAlarmTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change the settings for a Cluster.
      def update_cluster(
        cluster_id : String,
        name : String? = nil,
        network_settings : Types::ClusterNetworkSettingsUpdateRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterRequest.new(cluster_id: cluster_id, name: name, network_settings: network_settings)
        update_cluster(input)
      end
      def update_cluster(input : Types::UpdateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified eventbridge rule template.
      def update_event_bridge_rule_template(
        identifier : String,
        description : String? = nil,
        event_targets : Array(Types::EventBridgeRuleTemplateTarget)? = nil,
        event_type : String? = nil,
        group_identifier : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEventBridgeRuleTemplateRequest.new(identifier: identifier, description: description, event_targets: event_targets, event_type: event_type, group_identifier: group_identifier, name: name)
        update_event_bridge_rule_template(input)
      end
      def update_event_bridge_rule_template(input : Types::UpdateEventBridgeRuleTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_BRIDGE_RULE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified eventbridge rule template group.
      def update_event_bridge_rule_template_group(
        identifier : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEventBridgeRuleTemplateGroupRequest.new(identifier: identifier, description: description)
        update_event_bridge_rule_template_group(input)
      end
      def update_event_bridge_rule_template_group(input : Types::UpdateEventBridgeRuleTemplateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an input.
      def update_input(
        input_id : String,
        destinations : Array(Types::InputDestinationRequest)? = nil,
        input_devices : Array(Types::InputDeviceRequest)? = nil,
        input_security_groups : Array(String)? = nil,
        media_connect_flows : Array(Types::MediaConnectFlowRequest)? = nil,
        multicast_settings : Types::MulticastSettingsUpdateRequest? = nil,
        name : String? = nil,
        role_arn : String? = nil,
        sdi_sources : Array(String)? = nil,
        smpte2110_receiver_group_settings : Types::Smpte2110ReceiverGroupSettings? = nil,
        sources : Array(Types::InputSourceRequest)? = nil,
        special_router_settings : Types::SpecialRouterSettings? = nil,
        srt_settings : Types::SrtSettingsRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateInputRequest.new(input_id: input_id, destinations: destinations, input_devices: input_devices, input_security_groups: input_security_groups, media_connect_flows: media_connect_flows, multicast_settings: multicast_settings, name: name, role_arn: role_arn, sdi_sources: sdi_sources, smpte2110_receiver_group_settings: smpte2110_receiver_group_settings, sources: sources, special_router_settings: special_router_settings, srt_settings: srt_settings)
        update_input(input)
      end
      def update_input(input : Types::UpdateInputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the parameters for the input device.
      def update_input_device(
        input_device_id : String,
        availability_zone : String? = nil,
        hd_device_settings : Types::InputDeviceConfigurableSettings? = nil,
        name : String? = nil,
        uhd_device_settings : Types::InputDeviceConfigurableSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateInputDeviceRequest.new(input_device_id: input_device_id, availability_zone: availability_zone, hd_device_settings: hd_device_settings, name: name, uhd_device_settings: uhd_device_settings)
        update_input_device(input)
      end
      def update_input_device(input : Types::UpdateInputDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INPUT_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an Input Security Group's Whilelists.
      def update_input_security_group(
        input_security_group_id : String,
        tags : Hash(String, String)? = nil,
        whitelist_rules : Array(Types::InputWhitelistRuleCidr)? = nil
      ) : Protocol::Request
        input = Types::UpdateInputSecurityGroupRequest.new(input_security_group_id: input_security_group_id, tags: tags, whitelist_rules: whitelist_rules)
        update_input_security_group(input)
      end
      def update_input_security_group(input : Types::UpdateInputSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INPUT_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a multiplex.
      def update_multiplex(
        multiplex_id : String,
        multiplex_settings : Types::MultiplexSettings? = nil,
        name : String? = nil,
        packet_identifiers_mapping : Hash(String, Types::MultiplexProgramPacketIdentifiersMap)? = nil
      ) : Protocol::Request
        input = Types::UpdateMultiplexRequest.new(multiplex_id: multiplex_id, multiplex_settings: multiplex_settings, name: name, packet_identifiers_mapping: packet_identifiers_mapping)
        update_multiplex(input)
      end
      def update_multiplex(input : Types::UpdateMultiplexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MULTIPLEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a program in a multiplex.
      def update_multiplex_program(
        multiplex_id : String,
        program_name : String,
        multiplex_program_settings : Types::MultiplexProgramSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateMultiplexProgramRequest.new(multiplex_id: multiplex_id, program_name: program_name, multiplex_program_settings: multiplex_program_settings)
        update_multiplex_program(input)
      end
      def update_multiplex_program(input : Types::UpdateMultiplexProgramRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MULTIPLEX_PROGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change the settings for a Network.
      def update_network(
        network_id : String,
        ip_pools : Array(Types::IpPoolUpdateRequest)? = nil,
        name : String? = nil,
        routes : Array(Types::RouteUpdateRequest)? = nil
      ) : Protocol::Request
        input = Types::UpdateNetworkRequest.new(network_id: network_id, ip_pools: ip_pools, name: name, routes: routes)
        update_network(input)
      end
      def update_network(input : Types::UpdateNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change the settings for a Node.
      def update_node(
        cluster_id : String,
        node_id : String,
        name : String? = nil,
        role : String? = nil,
        sdi_source_mappings : Array(Types::SdiSourceMappingUpdateRequest)? = nil
      ) : Protocol::Request
        input = Types::UpdateNodeRequest.new(cluster_id: cluster_id, node_id: node_id, name: name, role: role, sdi_source_mappings: sdi_source_mappings)
        update_node(input)
      end
      def update_node(input : Types::UpdateNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the state of a node.
      def update_node_state(
        cluster_id : String,
        node_id : String,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNodeStateRequest.new(cluster_id: cluster_id, node_id: node_id, state: state)
        update_node_state(input)
      end
      def update_node_state(input : Types::UpdateNodeStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NODE_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update reservation.
      def update_reservation(
        reservation_id : String,
        name : String? = nil,
        renewal_settings : Types::RenewalSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateReservationRequest.new(reservation_id: reservation_id, name: name, renewal_settings: renewal_settings)
        update_reservation(input)
      end
      def update_reservation(input : Types::UpdateReservationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESERVATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change some of the settings in an SdiSource.
      def update_sdi_source(
        sdi_source_id : String,
        mode : String? = nil,
        name : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSdiSourceRequest.new(sdi_source_id: sdi_source_id, mode: mode, name: name, type: type)
        update_sdi_source(input)
      end
      def update_sdi_source(input : Types::UpdateSdiSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SDI_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
