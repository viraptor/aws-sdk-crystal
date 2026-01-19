module AwsSdk
  module BackupGateway
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

      # Associates a backup gateway with your server. After you complete the association process, you can
      # back up and restore your VMs through the gateway.
      def associate_gateway_to_server(
        gateway_arn : String,
        server_arn : String
      ) : Types::AssociateGatewayToServerOutput
        input = Types::AssociateGatewayToServerInput.new(gateway_arn: gateway_arn, server_arn: server_arn)
        associate_gateway_to_server(input)
      end
      def associate_gateway_to_server(input : Types::AssociateGatewayToServerInput) : Types::AssociateGatewayToServerOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_GATEWAY_TO_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateGatewayToServerOutput, "AssociateGatewayToServer")
      end

      # Creates a backup gateway. After you create a gateway, you can associate it with a server using the
      # AssociateGatewayToServer operation.
      def create_gateway(
        activation_key : String,
        gateway_display_name : String,
        gateway_type : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateGatewayOutput
        input = Types::CreateGatewayInput.new(activation_key: activation_key, gateway_display_name: gateway_display_name, gateway_type: gateway_type, tags: tags)
        create_gateway(input)
      end
      def create_gateway(input : Types::CreateGatewayInput) : Types::CreateGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGatewayOutput, "CreateGateway")
      end

      # Deletes a backup gateway.
      def delete_gateway(
        gateway_arn : String
      ) : Types::DeleteGatewayOutput
        input = Types::DeleteGatewayInput.new(gateway_arn: gateway_arn)
        delete_gateway(input)
      end
      def delete_gateway(input : Types::DeleteGatewayInput) : Types::DeleteGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGatewayOutput, "DeleteGateway")
      end

      # Deletes a hypervisor.
      def delete_hypervisor(
        hypervisor_arn : String
      ) : Types::DeleteHypervisorOutput
        input = Types::DeleteHypervisorInput.new(hypervisor_arn: hypervisor_arn)
        delete_hypervisor(input)
      end
      def delete_hypervisor(input : Types::DeleteHypervisorInput) : Types::DeleteHypervisorOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_HYPERVISOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHypervisorOutput, "DeleteHypervisor")
      end

      # Disassociates a backup gateway from the specified server. After the disassociation process finishes,
      # the gateway can no longer access the virtual machines on the server.
      def disassociate_gateway_from_server(
        gateway_arn : String
      ) : Types::DisassociateGatewayFromServerOutput
        input = Types::DisassociateGatewayFromServerInput.new(gateway_arn: gateway_arn)
        disassociate_gateway_from_server(input)
      end
      def disassociate_gateway_from_server(input : Types::DisassociateGatewayFromServerInput) : Types::DisassociateGatewayFromServerOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_GATEWAY_FROM_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateGatewayFromServerOutput, "DisassociateGatewayFromServer")
      end

      # Retrieves the bandwidth rate limit schedule for a specified gateway. By default, gateways do not
      # have bandwidth rate limit schedules, which means no bandwidth rate limiting is in effect. Use this
      # to get a gateway's bandwidth rate limit schedule.
      def get_bandwidth_rate_limit_schedule(
        gateway_arn : String
      ) : Types::GetBandwidthRateLimitScheduleOutput
        input = Types::GetBandwidthRateLimitScheduleInput.new(gateway_arn: gateway_arn)
        get_bandwidth_rate_limit_schedule(input)
      end
      def get_bandwidth_rate_limit_schedule(input : Types::GetBandwidthRateLimitScheduleInput) : Types::GetBandwidthRateLimitScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BANDWIDTH_RATE_LIMIT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBandwidthRateLimitScheduleOutput, "GetBandwidthRateLimitSchedule")
      end

      # By providing the ARN (Amazon Resource Name), this API returns the gateway.
      def get_gateway(
        gateway_arn : String
      ) : Types::GetGatewayOutput
        input = Types::GetGatewayInput.new(gateway_arn: gateway_arn)
        get_gateway(input)
      end
      def get_gateway(input : Types::GetGatewayInput) : Types::GetGatewayOutput
        request = Protocol::JsonRpc.build_request(Model::GET_GATEWAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGatewayOutput, "GetGateway")
      end

      # This action requests information about the specified hypervisor to which the gateway will connect. A
      # hypervisor is hardware, software, or firmware that creates and manages virtual machines, and
      # allocates resources to them.
      def get_hypervisor(
        hypervisor_arn : String
      ) : Types::GetHypervisorOutput
        input = Types::GetHypervisorInput.new(hypervisor_arn: hypervisor_arn)
        get_hypervisor(input)
      end
      def get_hypervisor(input : Types::GetHypervisorInput) : Types::GetHypervisorOutput
        request = Protocol::JsonRpc.build_request(Model::GET_HYPERVISOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetHypervisorOutput, "GetHypervisor")
      end

      # This action retrieves the property mappings for the specified hypervisor. A hypervisor property
      # mapping displays the relationship of entity properties available from the on-premises hypervisor to
      # the properties available in Amazon Web Services.
      def get_hypervisor_property_mappings(
        hypervisor_arn : String
      ) : Types::GetHypervisorPropertyMappingsOutput
        input = Types::GetHypervisorPropertyMappingsInput.new(hypervisor_arn: hypervisor_arn)
        get_hypervisor_property_mappings(input)
      end
      def get_hypervisor_property_mappings(input : Types::GetHypervisorPropertyMappingsInput) : Types::GetHypervisorPropertyMappingsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_HYPERVISOR_PROPERTY_MAPPINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetHypervisorPropertyMappingsOutput, "GetHypervisorPropertyMappings")
      end

      # By providing the ARN (Amazon Resource Name), this API returns the virtual machine.
      def get_virtual_machine(
        resource_arn : String
      ) : Types::GetVirtualMachineOutput
        input = Types::GetVirtualMachineInput.new(resource_arn: resource_arn)
        get_virtual_machine(input)
      end
      def get_virtual_machine(input : Types::GetVirtualMachineInput) : Types::GetVirtualMachineOutput
        request = Protocol::JsonRpc.build_request(Model::GET_VIRTUAL_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVirtualMachineOutput, "GetVirtualMachine")
      end

      # Connect to a hypervisor by importing its configuration.
      def import_hypervisor_configuration(
        host : String,
        name : String,
        kms_key_arn : String? = nil,
        password : String? = nil,
        tags : Array(Types::Tag)? = nil,
        username : String? = nil
      ) : Types::ImportHypervisorConfigurationOutput
        input = Types::ImportHypervisorConfigurationInput.new(host: host, name: name, kms_key_arn: kms_key_arn, password: password, tags: tags, username: username)
        import_hypervisor_configuration(input)
      end
      def import_hypervisor_configuration(input : Types::ImportHypervisorConfigurationInput) : Types::ImportHypervisorConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::IMPORT_HYPERVISOR_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportHypervisorConfigurationOutput, "ImportHypervisorConfiguration")
      end

      # Lists backup gateways owned by an Amazon Web Services account in an Amazon Web Services Region. The
      # returned list is ordered by gateway Amazon Resource Name (ARN).
      def list_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGatewaysOutput
        input = Types::ListGatewaysInput.new(max_results: max_results, next_token: next_token)
        list_gateways(input)
      end
      def list_gateways(input : Types::ListGatewaysInput) : Types::ListGatewaysOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_GATEWAYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGatewaysOutput, "ListGateways")
      end

      # Lists your hypervisors.
      def list_hypervisors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHypervisorsOutput
        input = Types::ListHypervisorsInput.new(max_results: max_results, next_token: next_token)
        list_hypervisors(input)
      end
      def list_hypervisors(input : Types::ListHypervisorsInput) : Types::ListHypervisorsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_HYPERVISORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHypervisorsOutput, "ListHypervisors")
      end

      # Lists the tags applied to the resource identified by its Amazon Resource Name (ARN).
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Lists your virtual machines.
      def list_virtual_machines(
        hypervisor_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVirtualMachinesOutput
        input = Types::ListVirtualMachinesInput.new(hypervisor_arn: hypervisor_arn, max_results: max_results, next_token: next_token)
        list_virtual_machines(input)
      end
      def list_virtual_machines(input : Types::ListVirtualMachinesInput) : Types::ListVirtualMachinesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_VIRTUAL_MACHINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVirtualMachinesOutput, "ListVirtualMachines")
      end

      # This action sets the bandwidth rate limit schedule for a specified gateway. By default, gateways do
      # not have a bandwidth rate limit schedule, which means no bandwidth rate limiting is in effect. Use
      # this to initiate a gateway's bandwidth rate limit schedule.
      def put_bandwidth_rate_limit_schedule(
        bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval),
        gateway_arn : String
      ) : Types::PutBandwidthRateLimitScheduleOutput
        input = Types::PutBandwidthRateLimitScheduleInput.new(bandwidth_rate_limit_intervals: bandwidth_rate_limit_intervals, gateway_arn: gateway_arn)
        put_bandwidth_rate_limit_schedule(input)
      end
      def put_bandwidth_rate_limit_schedule(input : Types::PutBandwidthRateLimitScheduleInput) : Types::PutBandwidthRateLimitScheduleOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_BANDWIDTH_RATE_LIMIT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutBandwidthRateLimitScheduleOutput, "PutBandwidthRateLimitSchedule")
      end

      # This action sets the property mappings for the specified hypervisor. A hypervisor property mapping
      # displays the relationship of entity properties available from the on-premises hypervisor to the
      # properties available in Amazon Web Services.
      def put_hypervisor_property_mappings(
        hypervisor_arn : String,
        iam_role_arn : String,
        vmware_to_aws_tag_mappings : Array(Types::VmwareToAwsTagMapping)
      ) : Types::PutHypervisorPropertyMappingsOutput
        input = Types::PutHypervisorPropertyMappingsInput.new(hypervisor_arn: hypervisor_arn, iam_role_arn: iam_role_arn, vmware_to_aws_tag_mappings: vmware_to_aws_tag_mappings)
        put_hypervisor_property_mappings(input)
      end
      def put_hypervisor_property_mappings(input : Types::PutHypervisorPropertyMappingsInput) : Types::PutHypervisorPropertyMappingsOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_HYPERVISOR_PROPERTY_MAPPINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutHypervisorPropertyMappingsOutput, "PutHypervisorPropertyMappings")
      end

      # Set the maintenance start time for a gateway.
      def put_maintenance_start_time(
        gateway_arn : String,
        hour_of_day : Int32,
        minute_of_hour : Int32,
        day_of_month : Int32? = nil,
        day_of_week : Int32? = nil
      ) : Types::PutMaintenanceStartTimeOutput
        input = Types::PutMaintenanceStartTimeInput.new(gateway_arn: gateway_arn, hour_of_day: hour_of_day, minute_of_hour: minute_of_hour, day_of_month: day_of_month, day_of_week: day_of_week)
        put_maintenance_start_time(input)
      end
      def put_maintenance_start_time(input : Types::PutMaintenanceStartTimeInput) : Types::PutMaintenanceStartTimeOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_MAINTENANCE_START_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutMaintenanceStartTimeOutput, "PutMaintenanceStartTime")
      end

      # This action sends a request to sync metadata across the specified virtual machines.
      def start_virtual_machines_metadata_sync(
        hypervisor_arn : String
      ) : Types::StartVirtualMachinesMetadataSyncOutput
        input = Types::StartVirtualMachinesMetadataSyncInput.new(hypervisor_arn: hypervisor_arn)
        start_virtual_machines_metadata_sync(input)
      end
      def start_virtual_machines_metadata_sync(input : Types::StartVirtualMachinesMetadataSyncInput) : Types::StartVirtualMachinesMetadataSyncOutput
        request = Protocol::JsonRpc.build_request(Model::START_VIRTUAL_MACHINES_METADATA_SYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartVirtualMachinesMetadataSyncOutput, "StartVirtualMachinesMetadataSync")
      end

      # Tag the resource.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Tests your hypervisor configuration to validate that backup gateway can connect with the hypervisor
      # and its resources.
      def test_hypervisor_configuration(
        gateway_arn : String,
        host : String,
        password : String? = nil,
        username : String? = nil
      ) : Types::TestHypervisorConfigurationOutput
        input = Types::TestHypervisorConfigurationInput.new(gateway_arn: gateway_arn, host: host, password: password, username: username)
        test_hypervisor_configuration(input)
      end
      def test_hypervisor_configuration(input : Types::TestHypervisorConfigurationInput) : Types::TestHypervisorConfigurationOutput
        request = Protocol::JsonRpc.build_request(Model::TEST_HYPERVISOR_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestHypervisorConfigurationOutput, "TestHypervisorConfiguration")
      end

      # Removes tags from the resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates a gateway's name. Specify which gateway to update using the Amazon Resource Name (ARN) of
      # the gateway in your request.
      def update_gateway_information(
        gateway_arn : String,
        gateway_display_name : String? = nil
      ) : Types::UpdateGatewayInformationOutput
        input = Types::UpdateGatewayInformationInput.new(gateway_arn: gateway_arn, gateway_display_name: gateway_display_name)
        update_gateway_information(input)
      end
      def update_gateway_information(input : Types::UpdateGatewayInformationInput) : Types::UpdateGatewayInformationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GATEWAY_INFORMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGatewayInformationOutput, "UpdateGatewayInformation")
      end

      # Updates the gateway virtual machine (VM) software. The request immediately triggers the software
      # update. When you make this request, you get a 200 OK success response immediately. However, it might
      # take some time for the update to complete.
      def update_gateway_software_now(
        gateway_arn : String
      ) : Types::UpdateGatewaySoftwareNowOutput
        input = Types::UpdateGatewaySoftwareNowInput.new(gateway_arn: gateway_arn)
        update_gateway_software_now(input)
      end
      def update_gateway_software_now(input : Types::UpdateGatewaySoftwareNowInput) : Types::UpdateGatewaySoftwareNowOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GATEWAY_SOFTWARE_NOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGatewaySoftwareNowOutput, "UpdateGatewaySoftwareNow")
      end

      # Updates a hypervisor metadata, including its host, username, and password. Specify which hypervisor
      # to update using the Amazon Resource Name (ARN) of the hypervisor in your request.
      def update_hypervisor(
        hypervisor_arn : String,
        host : String? = nil,
        log_group_arn : String? = nil,
        name : String? = nil,
        password : String? = nil,
        username : String? = nil
      ) : Types::UpdateHypervisorOutput
        input = Types::UpdateHypervisorInput.new(hypervisor_arn: hypervisor_arn, host: host, log_group_arn: log_group_arn, name: name, password: password, username: username)
        update_hypervisor(input)
      end
      def update_hypervisor(input : Types::UpdateHypervisorInput) : Types::UpdateHypervisorOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HYPERVISOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHypervisorOutput, "UpdateHypervisor")
      end
    end
  end
end
