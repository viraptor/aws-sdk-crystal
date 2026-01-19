module AwsSdk
  module IoTWireless
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

      # Associates a partner account with your AWS account.
      def associate_aws_account_with_partner_account(
        sidewalk : Types::SidewalkAccountInfo,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::AssociateAwsAccountWithPartnerAccountRequest.new(sidewalk: sidewalk, client_request_token: client_request_token, tags: tags)
        associate_aws_account_with_partner_account(input)
      end
      def associate_aws_account_with_partner_account(input : Types::AssociateAwsAccountWithPartnerAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_AWS_ACCOUNT_WITH_PARTNER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a multicast group with a FUOTA task.
      def associate_multicast_group_with_fuota_task(
        id : String,
        multicast_group_id : String
      ) : Protocol::Request
        input = Types::AssociateMulticastGroupWithFuotaTaskRequest.new(id: id, multicast_group_id: multicast_group_id)
        associate_multicast_group_with_fuota_task(input)
      end
      def associate_multicast_group_with_fuota_task(input : Types::AssociateMulticastGroupWithFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MULTICAST_GROUP_WITH_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a wireless device with a FUOTA task.
      def associate_wireless_device_with_fuota_task(
        id : String,
        wireless_device_id : String
      ) : Protocol::Request
        input = Types::AssociateWirelessDeviceWithFuotaTaskRequest.new(id: id, wireless_device_id: wireless_device_id)
        associate_wireless_device_with_fuota_task(input)
      end
      def associate_wireless_device_with_fuota_task(input : Types::AssociateWirelessDeviceWithFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WIRELESS_DEVICE_WITH_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a wireless device with a multicast group.
      def associate_wireless_device_with_multicast_group(
        id : String,
        wireless_device_id : String
      ) : Protocol::Request
        input = Types::AssociateWirelessDeviceWithMulticastGroupRequest.new(id: id, wireless_device_id: wireless_device_id)
        associate_wireless_device_with_multicast_group(input)
      end
      def associate_wireless_device_with_multicast_group(input : Types::AssociateWirelessDeviceWithMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WIRELESS_DEVICE_WITH_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a wireless device with a thing.
      def associate_wireless_device_with_thing(
        id : String,
        thing_arn : String
      ) : Protocol::Request
        input = Types::AssociateWirelessDeviceWithThingRequest.new(id: id, thing_arn: thing_arn)
        associate_wireless_device_with_thing(input)
      end
      def associate_wireless_device_with_thing(input : Types::AssociateWirelessDeviceWithThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WIRELESS_DEVICE_WITH_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a wireless gateway with a certificate.
      def associate_wireless_gateway_with_certificate(
        id : String,
        iot_certificate_id : String
      ) : Protocol::Request
        input = Types::AssociateWirelessGatewayWithCertificateRequest.new(id: id, iot_certificate_id: iot_certificate_id)
        associate_wireless_gateway_with_certificate(input)
      end
      def associate_wireless_gateway_with_certificate(input : Types::AssociateWirelessGatewayWithCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WIRELESS_GATEWAY_WITH_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a wireless gateway with a thing.
      def associate_wireless_gateway_with_thing(
        id : String,
        thing_arn : String
      ) : Protocol::Request
        input = Types::AssociateWirelessGatewayWithThingRequest.new(id: id, thing_arn: thing_arn)
        associate_wireless_gateway_with_thing(input)
      end
      def associate_wireless_gateway_with_thing(input : Types::AssociateWirelessGatewayWithThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WIRELESS_GATEWAY_WITH_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an existing multicast group session.
      def cancel_multicast_group_session(
        id : String
      ) : Protocol::Request
        input = Types::CancelMulticastGroupSessionRequest.new(id: id)
        cancel_multicast_group_session(input)
      end
      def cancel_multicast_group_session(input : Types::CancelMulticastGroupSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_MULTICAST_GROUP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new destination that maps a device message to an AWS IoT rule.
      def create_destination(
        expression : String,
        expression_type : String,
        name : String,
        role_arn : String,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDestinationRequest.new(expression: expression, expression_type: expression_type, name: name, role_arn: role_arn, client_request_token: client_request_token, description: description, tags: tags)
        create_destination(input)
      end
      def create_destination(input : Types::CreateDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new device profile.
      def create_device_profile(
        client_request_token : String? = nil,
        lo_ra_wan : Types::LoRaWANDeviceProfile? = nil,
        name : String? = nil,
        sidewalk : Types::SidewalkCreateDeviceProfile? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDeviceProfileRequest.new(client_request_token: client_request_token, lo_ra_wan: lo_ra_wan, name: name, sidewalk: sidewalk, tags: tags)
        create_device_profile(input)
      end
      def create_device_profile(input : Types::CreateDeviceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a FUOTA task.
      def create_fuota_task(
        firmware_update_image : String,
        firmware_update_role : String,
        client_request_token : String? = nil,
        description : String? = nil,
        descriptor : String? = nil,
        fragment_interval_ms : Int32? = nil,
        fragment_size_bytes : Int32? = nil,
        lo_ra_wan : Types::LoRaWANFuotaTask? = nil,
        name : String? = nil,
        redundancy_percent : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateFuotaTaskRequest.new(firmware_update_image: firmware_update_image, firmware_update_role: firmware_update_role, client_request_token: client_request_token, description: description, descriptor: descriptor, fragment_interval_ms: fragment_interval_ms, fragment_size_bytes: fragment_size_bytes, lo_ra_wan: lo_ra_wan, name: name, redundancy_percent: redundancy_percent, tags: tags)
        create_fuota_task(input)
      end
      def create_fuota_task(input : Types::CreateFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a multicast group.
      def create_multicast_group(
        lo_ra_wan : Types::LoRaWANMulticast,
        client_request_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMulticastGroupRequest.new(lo_ra_wan: lo_ra_wan, client_request_token: client_request_token, description: description, name: name, tags: tags)
        create_multicast_group(input)
      end
      def create_multicast_group(input : Types::CreateMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new network analyzer configuration.
      def create_network_analyzer_configuration(
        name : String,
        client_request_token : String? = nil,
        description : String? = nil,
        multicast_groups : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        trace_content : Types::TraceContent? = nil,
        wireless_devices : Array(String)? = nil,
        wireless_gateways : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateNetworkAnalyzerConfigurationRequest.new(name: name, client_request_token: client_request_token, description: description, multicast_groups: multicast_groups, tags: tags, trace_content: trace_content, wireless_devices: wireless_devices, wireless_gateways: wireless_gateways)
        create_network_analyzer_configuration(input)
      end
      def create_network_analyzer_configuration(input : Types::CreateNetworkAnalyzerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NETWORK_ANALYZER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new service profile.
      def create_service_profile(
        client_request_token : String? = nil,
        lo_ra_wan : Types::LoRaWANServiceProfile? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceProfileRequest.new(client_request_token: client_request_token, lo_ra_wan: lo_ra_wan, name: name, tags: tags)
        create_service_profile(input)
      end
      def create_service_profile(input : Types::CreateServiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provisions a wireless device.
      def create_wireless_device(
        destination_name : String,
        type : String,
        client_request_token : String? = nil,
        description : String? = nil,
        lo_ra_wan : Types::LoRaWANDevice? = nil,
        name : String? = nil,
        positioning : String? = nil,
        sidewalk : Types::SidewalkCreateWirelessDevice? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateWirelessDeviceRequest.new(destination_name: destination_name, type: type, client_request_token: client_request_token, description: description, lo_ra_wan: lo_ra_wan, name: name, positioning: positioning, sidewalk: sidewalk, tags: tags)
        create_wireless_device(input)
      end
      def create_wireless_device(input : Types::CreateWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provisions a wireless gateway. When provisioning a wireless gateway, you might run into duplication
      # errors for the following reasons. If you specify a GatewayEui value that already exists. If you used
      # a ClientRequestToken with the same parameters within the last 10 minutes. To avoid this error, make
      # sure that you use unique identifiers and parameters for each request within the specified time
      # period.
      def create_wireless_gateway(
        lo_ra_wan : Types::LoRaWANGateway,
        client_request_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateWirelessGatewayRequest.new(lo_ra_wan: lo_ra_wan, client_request_token: client_request_token, description: description, name: name, tags: tags)
        create_wireless_gateway(input)
      end
      def create_wireless_gateway(input : Types::CreateWirelessGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WIRELESS_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a task for a wireless gateway.
      def create_wireless_gateway_task(
        id : String,
        wireless_gateway_task_definition_id : String
      ) : Protocol::Request
        input = Types::CreateWirelessGatewayTaskRequest.new(id: id, wireless_gateway_task_definition_id: wireless_gateway_task_definition_id)
        create_wireless_gateway_task(input)
      end
      def create_wireless_gateway_task(input : Types::CreateWirelessGatewayTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WIRELESS_GATEWAY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a gateway task definition.
      def create_wireless_gateway_task_definition(
        auto_create_tasks : Bool,
        client_request_token : String? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        update : Types::UpdateWirelessGatewayTaskCreate? = nil
      ) : Protocol::Request
        input = Types::CreateWirelessGatewayTaskDefinitionRequest.new(auto_create_tasks: auto_create_tasks, client_request_token: client_request_token, name: name, tags: tags, update: update)
        create_wireless_gateway_task_definition(input)
      end
      def create_wireless_gateway_task_definition(input : Types::CreateWirelessGatewayTaskDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WIRELESS_GATEWAY_TASK_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a destination.
      def delete_destination(
        name : String
      ) : Protocol::Request
        input = Types::DeleteDestinationRequest.new(name: name)
        delete_destination(input)
      end
      def delete_destination(input : Types::DeleteDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a device profile.
      def delete_device_profile(
        id : String
      ) : Protocol::Request
        input = Types::DeleteDeviceProfileRequest.new(id: id)
        delete_device_profile(input)
      end
      def delete_device_profile(input : Types::DeleteDeviceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a FUOTA task.
      def delete_fuota_task(
        id : String
      ) : Protocol::Request
        input = Types::DeleteFuotaTaskRequest.new(id: id)
        delete_fuota_task(input)
      end
      def delete_fuota_task(input : Types::DeleteFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a multicast group if it is not in use by a FUOTA task.
      def delete_multicast_group(
        id : String
      ) : Protocol::Request
        input = Types::DeleteMulticastGroupRequest.new(id: id)
        delete_multicast_group(input)
      end
      def delete_multicast_group(input : Types::DeleteMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a network analyzer configuration.
      def delete_network_analyzer_configuration(
        configuration_name : String
      ) : Protocol::Request
        input = Types::DeleteNetworkAnalyzerConfigurationRequest.new(configuration_name: configuration_name)
        delete_network_analyzer_configuration(input)
      end
      def delete_network_analyzer_configuration(input : Types::DeleteNetworkAnalyzerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NETWORK_ANALYZER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove queued messages from the downlink queue.
      def delete_queued_messages(
        id : String,
        message_id : String,
        wireless_device_type : String? = nil
      ) : Protocol::Request
        input = Types::DeleteQueuedMessagesRequest.new(id: id, message_id: message_id, wireless_device_type: wireless_device_type)
        delete_queued_messages(input)
      end
      def delete_queued_messages(input : Types::DeleteQueuedMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUED_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a service profile.
      def delete_service_profile(
        id : String
      ) : Protocol::Request
        input = Types::DeleteServiceProfileRequest.new(id: id)
        delete_service_profile(input)
      end
      def delete_service_profile(input : Types::DeleteServiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a wireless device.
      def delete_wireless_device(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWirelessDeviceRequest.new(id: id)
        delete_wireless_device(input)
      end
      def delete_wireless_device(input : Types::DeleteWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an import task.
      def delete_wireless_device_import_task(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWirelessDeviceImportTaskRequest.new(id: id)
        delete_wireless_device_import_task(input)
      end
      def delete_wireless_device_import_task(input : Types::DeleteWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a wireless gateway. When deleting a wireless gateway, you might run into duplication errors
      # for the following reasons. If you specify a GatewayEui value that already exists. If you used a
      # ClientRequestToken with the same parameters within the last 10 minutes. To avoid this error, make
      # sure that you use unique identifiers and parameters for each request within the specified time
      # period.
      def delete_wireless_gateway(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWirelessGatewayRequest.new(id: id)
        delete_wireless_gateway(input)
      end
      def delete_wireless_gateway(input : Types::DeleteWirelessGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WIRELESS_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a wireless gateway task.
      def delete_wireless_gateway_task(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWirelessGatewayTaskRequest.new(id: id)
        delete_wireless_gateway_task(input)
      end
      def delete_wireless_gateway_task(input : Types::DeleteWirelessGatewayTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WIRELESS_GATEWAY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a wireless gateway task definition. Deleting this task definition does not affect tasks that
      # are currently in progress.
      def delete_wireless_gateway_task_definition(
        id : String
      ) : Protocol::Request
        input = Types::DeleteWirelessGatewayTaskDefinitionRequest.new(id: id)
        delete_wireless_gateway_task_definition(input)
      end
      def delete_wireless_gateway_task_definition(input : Types::DeleteWirelessGatewayTaskDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WIRELESS_GATEWAY_TASK_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregister a wireless device from AWS IoT Wireless.
      def deregister_wireless_device(
        identifier : String,
        wireless_device_type : String? = nil
      ) : Protocol::Request
        input = Types::DeregisterWirelessDeviceRequest.new(identifier: identifier, wireless_device_type: wireless_device_type)
        deregister_wireless_device(input)
      end
      def deregister_wireless_device(input : Types::DeregisterWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates your AWS account from a partner account. If PartnerAccountId and PartnerType are null
      # , disassociates your AWS account from all partner accounts.
      def disassociate_aws_account_from_partner_account(
        partner_account_id : String,
        partner_type : String
      ) : Protocol::Request
        input = Types::DisassociateAwsAccountFromPartnerAccountRequest.new(partner_account_id: partner_account_id, partner_type: partner_type)
        disassociate_aws_account_from_partner_account(input)
      end
      def disassociate_aws_account_from_partner_account(input : Types::DisassociateAwsAccountFromPartnerAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_AWS_ACCOUNT_FROM_PARTNER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a multicast group from a FUOTA task.
      def disassociate_multicast_group_from_fuota_task(
        id : String,
        multicast_group_id : String
      ) : Protocol::Request
        input = Types::DisassociateMulticastGroupFromFuotaTaskRequest.new(id: id, multicast_group_id: multicast_group_id)
        disassociate_multicast_group_from_fuota_task(input)
      end
      def disassociate_multicast_group_from_fuota_task(input : Types::DisassociateMulticastGroupFromFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MULTICAST_GROUP_FROM_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a wireless device from a FUOTA task.
      def disassociate_wireless_device_from_fuota_task(
        id : String,
        wireless_device_id : String
      ) : Protocol::Request
        input = Types::DisassociateWirelessDeviceFromFuotaTaskRequest.new(id: id, wireless_device_id: wireless_device_id)
        disassociate_wireless_device_from_fuota_task(input)
      end
      def disassociate_wireless_device_from_fuota_task(input : Types::DisassociateWirelessDeviceFromFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WIRELESS_DEVICE_FROM_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a wireless device from a multicast group.
      def disassociate_wireless_device_from_multicast_group(
        id : String,
        wireless_device_id : String
      ) : Protocol::Request
        input = Types::DisassociateWirelessDeviceFromMulticastGroupRequest.new(id: id, wireless_device_id: wireless_device_id)
        disassociate_wireless_device_from_multicast_group(input)
      end
      def disassociate_wireless_device_from_multicast_group(input : Types::DisassociateWirelessDeviceFromMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WIRELESS_DEVICE_FROM_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a wireless device from its currently associated thing.
      def disassociate_wireless_device_from_thing(
        id : String
      ) : Protocol::Request
        input = Types::DisassociateWirelessDeviceFromThingRequest.new(id: id)
        disassociate_wireless_device_from_thing(input)
      end
      def disassociate_wireless_device_from_thing(input : Types::DisassociateWirelessDeviceFromThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WIRELESS_DEVICE_FROM_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a wireless gateway from its currently associated certificate.
      def disassociate_wireless_gateway_from_certificate(
        id : String
      ) : Protocol::Request
        input = Types::DisassociateWirelessGatewayFromCertificateRequest.new(id: id)
        disassociate_wireless_gateway_from_certificate(input)
      end
      def disassociate_wireless_gateway_from_certificate(input : Types::DisassociateWirelessGatewayFromCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WIRELESS_GATEWAY_FROM_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a wireless gateway from its currently associated thing.
      def disassociate_wireless_gateway_from_thing(
        id : String
      ) : Protocol::Request
        input = Types::DisassociateWirelessGatewayFromThingRequest.new(id: id)
        disassociate_wireless_gateway_from_thing(input)
      end
      def disassociate_wireless_gateway_from_thing(input : Types::DisassociateWirelessGatewayFromThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WIRELESS_GATEWAY_FROM_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a destination.
      def get_destination(
        name : String
      ) : Protocol::Request
        input = Types::GetDestinationRequest.new(name: name)
        get_destination(input)
      end
      def get_destination(input : Types::GetDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a device profile.
      def get_device_profile(
        id : String
      ) : Protocol::Request
        input = Types::GetDeviceProfileRequest.new(id: id)
        get_device_profile(input)
      end
      def get_device_profile(input : Types::GetDeviceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the event configuration based on resource types.
      def get_event_configuration_by_resource_types : Protocol::Request
        input = Types::GetEventConfigurationByResourceTypesRequest.new
        get_event_configuration_by_resource_types(input)
      end
      def get_event_configuration_by_resource_types(input : Types::GetEventConfigurationByResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_CONFIGURATION_BY_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a FUOTA task.
      def get_fuota_task(
        id : String
      ) : Protocol::Request
        input = Types::GetFuotaTaskRequest.new(id: id)
        get_fuota_task(input)
      end
      def get_fuota_task(input : Types::GetFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns current default log levels or log levels by resource types. Based on the resource type, log
      # levels can be returned for wireless device, wireless gateway, or FUOTA task log options.
      def get_log_levels_by_resource_types : Protocol::Request
        input = Types::GetLogLevelsByResourceTypesRequest.new
        get_log_levels_by_resource_types(input)
      end
      def get_log_levels_by_resource_types(input : Types::GetLogLevelsByResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOG_LEVELS_BY_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the metric configuration status for this AWS account.
      def get_metric_configuration : Protocol::Request
        input = Types::GetMetricConfigurationRequest.new
        get_metric_configuration(input)
      end
      def get_metric_configuration(input : Types::GetMetricConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METRIC_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the summary metrics for this AWS account.
      def get_metrics(
        summary_metric_queries : Array(Types::SummaryMetricQuery)? = nil
      ) : Protocol::Request
        input = Types::GetMetricsRequest.new(summary_metric_queries: summary_metric_queries)
        get_metrics(input)
      end
      def get_metrics(input : Types::GetMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a multicast group.
      def get_multicast_group(
        id : String
      ) : Protocol::Request
        input = Types::GetMulticastGroupRequest.new(id: id)
        get_multicast_group(input)
      end
      def get_multicast_group(input : Types::GetMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a multicast group session.
      def get_multicast_group_session(
        id : String
      ) : Protocol::Request
        input = Types::GetMulticastGroupSessionRequest.new(id: id)
        get_multicast_group_session(input)
      end
      def get_multicast_group_session(input : Types::GetMulticastGroupSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MULTICAST_GROUP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get network analyzer configuration.
      def get_network_analyzer_configuration(
        configuration_name : String
      ) : Protocol::Request
        input = Types::GetNetworkAnalyzerConfigurationRequest.new(configuration_name: configuration_name)
        get_network_analyzer_configuration(input)
      end
      def get_network_analyzer_configuration(input : Types::GetNetworkAnalyzerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_ANALYZER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a partner account. If PartnerAccountId and PartnerType are null , returns all
      # partner accounts.
      def get_partner_account(
        partner_account_id : String,
        partner_type : String
      ) : Protocol::Request
        input = Types::GetPartnerAccountRequest.new(partner_account_id: partner_account_id, partner_type: partner_type)
        get_partner_account(input)
      end
      def get_partner_account(input : Types::GetPartnerAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PARTNER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the position information for a given resource. This action is no longer supported. Calls to
      # retrieve the position information should use the GetResourcePosition API operation instead.
      def get_position(
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::GetPositionRequest.new(resource_identifier: resource_identifier, resource_type: resource_type)
        get_position(input)
      end
      def get_position(input : Types::GetPositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get position configuration for a given resource. This action is no longer supported. Calls to
      # retrieve the position configuration should use the GetResourcePosition API operation instead.
      def get_position_configuration(
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::GetPositionConfigurationRequest.new(resource_identifier: resource_identifier, resource_type: resource_type)
        get_position_configuration(input)
      end
      def get_position_configuration(input : Types::GetPositionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POSITION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get estimated position information as a payload in GeoJSON format. The payload measurement data is
      # resolved using solvers that are provided by third-party vendors.
      def get_position_estimate(
        cell_towers : Types::CellTowers? = nil,
        gnss : Types::Gnss? = nil,
        ip : Types::Ip? = nil,
        timestamp : Time? = nil,
        wi_fi_access_points : Array(Types::WiFiAccessPoint)? = nil
      ) : Protocol::Request
        input = Types::GetPositionEstimateRequest.new(cell_towers: cell_towers, gnss: gnss, ip: ip, timestamp: timestamp, wi_fi_access_points: wi_fi_access_points)
        get_position_estimate(input)
      end
      def get_position_estimate(input : Types::GetPositionEstimateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POSITION_ESTIMATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the event configuration for a particular resource identifier.
      def get_resource_event_configuration(
        identifier : String,
        identifier_type : String,
        partner_type : String? = nil
      ) : Protocol::Request
        input = Types::GetResourceEventConfigurationRequest.new(identifier: identifier, identifier_type: identifier_type, partner_type: partner_type)
        get_resource_event_configuration(input)
      end
      def get_resource_event_configuration(input : Types::GetResourceEventConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_EVENT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetches the log-level override, if any, for a given resource ID and resource type..
      def get_resource_log_level(
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::GetResourceLogLevelRequest.new(resource_identifier: resource_identifier, resource_type: resource_type)
        get_resource_log_level(input)
      end
      def get_resource_log_level(input : Types::GetResourceLogLevelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_LOG_LEVEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the position information for a given wireless device or a wireless gateway resource. The
      # position information uses the World Geodetic System (WGS84) .
      def get_resource_position(
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::GetResourcePositionRequest.new(resource_identifier: resource_identifier, resource_type: resource_type)
        get_resource_position(input)
      end
      def get_resource_position(input : Types::GetResourcePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the account-specific endpoint for Configuration and Update Server (CUPS) protocol or LoRaWAN
      # Network Server (LNS) connections.
      def get_service_endpoint(
        service_type : String? = nil
      ) : Protocol::Request
        input = Types::GetServiceEndpointRequest.new(service_type: service_type)
        get_service_endpoint(input)
      end
      def get_service_endpoint(input : Types::GetServiceEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a service profile.
      def get_service_profile(
        id : String
      ) : Protocol::Request
        input = Types::GetServiceProfileRequest.new(id: id)
        get_service_profile(input)
      end
      def get_service_profile(input : Types::GetServiceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a wireless device.
      def get_wireless_device(
        identifier : String,
        identifier_type : String
      ) : Protocol::Request
        input = Types::GetWirelessDeviceRequest.new(identifier: identifier, identifier_type: identifier_type)
        get_wireless_device(input)
      end
      def get_wireless_device(input : Types::GetWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about an import task and count of device onboarding summary information for the
      # import task.
      def get_wireless_device_import_task(
        id : String
      ) : Protocol::Request
        input = Types::GetWirelessDeviceImportTaskRequest.new(id: id)
        get_wireless_device_import_task(input)
      end
      def get_wireless_device_import_task(input : Types::GetWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets operating information about a wireless device.
      def get_wireless_device_statistics(
        wireless_device_id : String
      ) : Protocol::Request
        input = Types::GetWirelessDeviceStatisticsRequest.new(wireless_device_id: wireless_device_id)
        get_wireless_device_statistics(input)
      end
      def get_wireless_device_statistics(input : Types::GetWirelessDeviceStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_DEVICE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a wireless gateway.
      def get_wireless_gateway(
        identifier : String,
        identifier_type : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayRequest.new(identifier: identifier, identifier_type: identifier_type)
        get_wireless_gateway(input)
      end
      def get_wireless_gateway(input : Types::GetWirelessGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the ID of the certificate that is currently associated with a wireless gateway.
      def get_wireless_gateway_certificate(
        id : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayCertificateRequest.new(id: id)
        get_wireless_gateway_certificate(input)
      end
      def get_wireless_gateway_certificate(input : Types::GetWirelessGatewayCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the firmware version and other information about a wireless gateway.
      def get_wireless_gateway_firmware_information(
        id : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayFirmwareInformationRequest.new(id: id)
        get_wireless_gateway_firmware_information(input)
      end
      def get_wireless_gateway_firmware_information(input : Types::GetWirelessGatewayFirmwareInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY_FIRMWARE_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets operating information about a wireless gateway.
      def get_wireless_gateway_statistics(
        wireless_gateway_id : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayStatisticsRequest.new(wireless_gateway_id: wireless_gateway_id)
        get_wireless_gateway_statistics(input)
      end
      def get_wireless_gateway_statistics(input : Types::GetWirelessGatewayStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a wireless gateway task.
      def get_wireless_gateway_task(
        id : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayTaskRequest.new(id: id)
        get_wireless_gateway_task(input)
      end
      def get_wireless_gateway_task(input : Types::GetWirelessGatewayTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a wireless gateway task definition.
      def get_wireless_gateway_task_definition(
        id : String
      ) : Protocol::Request
        input = Types::GetWirelessGatewayTaskDefinitionRequest.new(id: id)
        get_wireless_gateway_task_definition(input)
      end
      def get_wireless_gateway_task_definition(input : Types::GetWirelessGatewayTaskDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WIRELESS_GATEWAY_TASK_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the destinations registered to your AWS account.
      def list_destinations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDestinationsRequest.new(max_results: max_results, next_token: next_token)
        list_destinations(input)
      end
      def list_destinations(input : Types::ListDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the device profiles registered to your AWS account.
      def list_device_profiles(
        device_profile_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeviceProfilesRequest.new(device_profile_type: device_profile_type, max_results: max_results, next_token: next_token)
        list_device_profiles(input)
      end
      def list_device_profiles(input : Types::ListDeviceProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the Sidewalk devices in an import task and their onboarding status.
      def list_devices_for_wireless_device_import_task(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesForWirelessDeviceImportTaskRequest.new(id: id, max_results: max_results, next_token: next_token, status: status)
        list_devices_for_wireless_device_import_task(input)
      end
      def list_devices_for_wireless_device_import_task(input : Types::ListDevicesForWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES_FOR_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List event configurations where at least one event topic has been enabled.
      def list_event_configurations(
        resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventConfigurationsRequest.new(resource_type: resource_type, max_results: max_results, next_token: next_token)
        list_event_configurations(input)
      end
      def list_event_configurations(input : Types::ListEventConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the FUOTA tasks registered to your AWS account.
      def list_fuota_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFuotaTasksRequest.new(max_results: max_results, next_token: next_token)
        list_fuota_tasks(input)
      end
      def list_fuota_tasks(input : Types::ListFuotaTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUOTA_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the multicast groups registered to your AWS account.
      def list_multicast_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMulticastGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_multicast_groups(input)
      end
      def list_multicast_groups(input : Types::ListMulticastGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTICAST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all multicast groups associated with a FUOTA task.
      def list_multicast_groups_by_fuota_task(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMulticastGroupsByFuotaTaskRequest.new(id: id, max_results: max_results, next_token: next_token)
        list_multicast_groups_by_fuota_task(input)
      end
      def list_multicast_groups_by_fuota_task(input : Types::ListMulticastGroupsByFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTICAST_GROUPS_BY_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the network analyzer configurations.
      def list_network_analyzer_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNetworkAnalyzerConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_network_analyzer_configurations(input)
      end
      def list_network_analyzer_configurations(input : Types::ListNetworkAnalyzerConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NETWORK_ANALYZER_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the partner accounts associated with your AWS account.
      def list_partner_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPartnerAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_partner_accounts(input)
      end
      def list_partner_accounts(input : Types::ListPartnerAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PARTNER_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List position configurations for a given resource, such as positioning solvers. This action is no
      # longer supported. Calls to retrieve position information should use the GetResourcePosition API
      # operation instead.
      def list_position_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPositionConfigurationsRequest.new(max_results: max_results, next_token: next_token, resource_type: resource_type)
        list_position_configurations(input)
      end
      def list_position_configurations(input : Types::ListPositionConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POSITION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List queued messages in the downlink queue.
      def list_queued_messages(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        wireless_device_type : String? = nil
      ) : Protocol::Request
        input = Types::ListQueuedMessagesRequest.new(id: id, max_results: max_results, next_token: next_token, wireless_device_type: wireless_device_type)
        list_queued_messages(input)
      end
      def list_queued_messages(input : Types::ListQueuedMessagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUED_MESSAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the service profiles registered to your AWS account.
      def list_service_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_service_profiles(input)
      end
      def list_service_profiles(input : Types::ListServiceProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags (metadata) you have assigned to the resource.
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

      # List of import tasks and summary information of onboarding status of devices in each import task.
      def list_wireless_device_import_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWirelessDeviceImportTasksRequest.new(max_results: max_results, next_token: next_token)
        list_wireless_device_import_tasks(input)
      end
      def list_wireless_device_import_tasks(input : Types::ListWirelessDeviceImportTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WIRELESS_DEVICE_IMPORT_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the wireless devices registered to your AWS account.
      def list_wireless_devices(
        destination_name : String? = nil,
        device_profile_id : String? = nil,
        fuota_task_id : String? = nil,
        max_results : Int32? = nil,
        multicast_group_id : String? = nil,
        next_token : String? = nil,
        service_profile_id : String? = nil,
        wireless_device_type : String? = nil
      ) : Protocol::Request
        input = Types::ListWirelessDevicesRequest.new(destination_name: destination_name, device_profile_id: device_profile_id, fuota_task_id: fuota_task_id, max_results: max_results, multicast_group_id: multicast_group_id, next_token: next_token, service_profile_id: service_profile_id, wireless_device_type: wireless_device_type)
        list_wireless_devices(input)
      end
      def list_wireless_devices(input : Types::ListWirelessDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WIRELESS_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the wireless gateway tasks definitions registered to your AWS account.
      def list_wireless_gateway_task_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_definition_type : String? = nil
      ) : Protocol::Request
        input = Types::ListWirelessGatewayTaskDefinitionsRequest.new(max_results: max_results, next_token: next_token, task_definition_type: task_definition_type)
        list_wireless_gateway_task_definitions(input)
      end
      def list_wireless_gateway_task_definitions(input : Types::ListWirelessGatewayTaskDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WIRELESS_GATEWAY_TASK_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the wireless gateways registered to your AWS account.
      def list_wireless_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWirelessGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_wireless_gateways(input)
      end
      def list_wireless_gateways(input : Types::ListWirelessGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WIRELESS_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put position configuration for a given resource. This action is no longer supported. Calls to update
      # the position configuration should use the UpdateResourcePosition API operation instead.
      def put_position_configuration(
        resource_identifier : String,
        resource_type : String,
        destination : String? = nil,
        solvers : Types::PositionSolverConfigurations? = nil
      ) : Protocol::Request
        input = Types::PutPositionConfigurationRequest.new(resource_identifier: resource_identifier, resource_type: resource_type, destination: destination, solvers: solvers)
        put_position_configuration(input)
      end
      def put_position_configuration(input : Types::PutPositionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_POSITION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the log-level override for a resource ID and resource type. A limit of 200 log level override
      # can be set per account.
      def put_resource_log_level(
        log_level : String,
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::PutResourceLogLevelRequest.new(log_level: log_level, resource_identifier: resource_identifier, resource_type: resource_type)
        put_resource_log_level(input)
      end
      def put_resource_log_level(input : Types::PutResourceLogLevelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_LOG_LEVEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the log-level overrides for all resources; wireless devices, wireless gateways, and FUOTA
      # tasks.
      def reset_all_resource_log_levels : Protocol::Request
        input = Types::ResetAllResourceLogLevelsRequest.new
        reset_all_resource_log_levels(input)
      end
      def reset_all_resource_log_levels(input : Types::ResetAllResourceLogLevelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_ALL_RESOURCE_LOG_LEVELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the log-level override, if any, for a specific resource ID and resource type. It can be used
      # for a wireless device, a wireless gateway, or a FUOTA task.
      def reset_resource_log_level(
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::ResetResourceLogLevelRequest.new(resource_identifier: resource_identifier, resource_type: resource_type)
        reset_resource_log_level(input)
      end
      def reset_resource_log_level(input : Types::ResetResourceLogLevelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_RESOURCE_LOG_LEVEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends the specified data to a multicast group.
      def send_data_to_multicast_group(
        id : String,
        payload_data : String,
        wireless_metadata : Types::MulticastWirelessMetadata
      ) : Protocol::Request
        input = Types::SendDataToMulticastGroupRequest.new(id: id, payload_data: payload_data, wireless_metadata: wireless_metadata)
        send_data_to_multicast_group(input)
      end
      def send_data_to_multicast_group(input : Types::SendDataToMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DATA_TO_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a decrypted application data frame to a device.
      def send_data_to_wireless_device(
        id : String,
        payload_data : String,
        transmit_mode : Int32,
        wireless_metadata : Types::WirelessMetadata? = nil
      ) : Protocol::Request
        input = Types::SendDataToWirelessDeviceRequest.new(id: id, payload_data: payload_data, transmit_mode: transmit_mode, wireless_metadata: wireless_metadata)
        send_data_to_wireless_device(input)
      end
      def send_data_to_wireless_device(input : Types::SendDataToWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DATA_TO_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bulk association of all qualifying wireless devices with a multicast group.
      def start_bulk_associate_wireless_device_with_multicast_group(
        id : String,
        query_string : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartBulkAssociateWirelessDeviceWithMulticastGroupRequest.new(id: id, query_string: query_string, tags: tags)
        start_bulk_associate_wireless_device_with_multicast_group(input)
      end
      def start_bulk_associate_wireless_device_with_multicast_group(input : Types::StartBulkAssociateWirelessDeviceWithMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BULK_ASSOCIATE_WIRELESS_DEVICE_WITH_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a bulk disassociatin of all qualifying wireless devices from a multicast group.
      def start_bulk_disassociate_wireless_device_from_multicast_group(
        id : String,
        query_string : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartBulkDisassociateWirelessDeviceFromMulticastGroupRequest.new(id: id, query_string: query_string, tags: tags)
        start_bulk_disassociate_wireless_device_from_multicast_group(input)
      end
      def start_bulk_disassociate_wireless_device_from_multicast_group(input : Types::StartBulkDisassociateWirelessDeviceFromMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BULK_DISASSOCIATE_WIRELESS_DEVICE_FROM_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a FUOTA task.
      def start_fuota_task(
        id : String,
        lo_ra_wan : Types::LoRaWANStartFuotaTask? = nil
      ) : Protocol::Request
        input = Types::StartFuotaTaskRequest.new(id: id, lo_ra_wan: lo_ra_wan)
        start_fuota_task(input)
      end
      def start_fuota_task(input : Types::StartFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a multicast group session.
      def start_multicast_group_session(
        id : String,
        lo_ra_wan : Types::LoRaWANMulticastSession
      ) : Protocol::Request
        input = Types::StartMulticastGroupSessionRequest.new(id: id, lo_ra_wan: lo_ra_wan)
        start_multicast_group_session(input)
      end
      def start_multicast_group_session(input : Types::StartMulticastGroupSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MULTICAST_GROUP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start import task for a single wireless device.
      def start_single_wireless_device_import_task(
        destination_name : String,
        sidewalk : Types::SidewalkSingleStartImportInfo,
        client_request_token : String? = nil,
        device_name : String? = nil,
        positioning : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartSingleWirelessDeviceImportTaskRequest.new(destination_name: destination_name, sidewalk: sidewalk, client_request_token: client_request_token, device_name: device_name, positioning: positioning, tags: tags)
        start_single_wireless_device_import_task(input)
      end
      def start_single_wireless_device_import_task(input : Types::StartSingleWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SINGLE_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start import task for provisioning Sidewalk devices in bulk using an S3 CSV file.
      def start_wireless_device_import_task(
        destination_name : String,
        sidewalk : Types::SidewalkStartImportInfo,
        client_request_token : String? = nil,
        positioning : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::StartWirelessDeviceImportTaskRequest.new(destination_name: destination_name, sidewalk: sidewalk, client_request_token: client_request_token, positioning: positioning, tags: tags)
        start_wireless_device_import_task(input)
      end
      def start_wireless_device_import_task(input : Types::StartWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a resource.
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

      # Simulates a provisioned device by sending an uplink data payload of Hello .
      def test_wireless_device(
        id : String
      ) : Protocol::Request
        input = Types::TestWirelessDeviceRequest.new(id: id)
        test_wireless_device(input)
      end
      def test_wireless_device(input : Types::TestWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from a resource.
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

      # Updates properties of a destination.
      def update_destination(
        name : String,
        description : String? = nil,
        expression : String? = nil,
        expression_type : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDestinationRequest.new(name: name, description: description, expression: expression, expression_type: expression_type, role_arn: role_arn)
        update_destination(input)
      end
      def update_destination(input : Types::UpdateDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the event configuration based on resource types.
      def update_event_configuration_by_resource_types(
        connection_status : Types::ConnectionStatusResourceTypeEventConfiguration? = nil,
        device_registration_state : Types::DeviceRegistrationStateResourceTypeEventConfiguration? = nil,
        join : Types::JoinResourceTypeEventConfiguration? = nil,
        message_delivery_status : Types::MessageDeliveryStatusResourceTypeEventConfiguration? = nil,
        proximity : Types::ProximityResourceTypeEventConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateEventConfigurationByResourceTypesRequest.new(connection_status: connection_status, device_registration_state: device_registration_state, join: join, message_delivery_status: message_delivery_status, proximity: proximity)
        update_event_configuration_by_resource_types(input)
      end
      def update_event_configuration_by_resource_types(input : Types::UpdateEventConfigurationByResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_CONFIGURATION_BY_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates properties of a FUOTA task.
      def update_fuota_task(
        id : String,
        description : String? = nil,
        descriptor : String? = nil,
        firmware_update_image : String? = nil,
        firmware_update_role : String? = nil,
        fragment_interval_ms : Int32? = nil,
        fragment_size_bytes : Int32? = nil,
        lo_ra_wan : Types::LoRaWANFuotaTask? = nil,
        name : String? = nil,
        redundancy_percent : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateFuotaTaskRequest.new(id: id, description: description, descriptor: descriptor, firmware_update_image: firmware_update_image, firmware_update_role: firmware_update_role, fragment_interval_ms: fragment_interval_ms, fragment_size_bytes: fragment_size_bytes, lo_ra_wan: lo_ra_wan, name: name, redundancy_percent: redundancy_percent)
        update_fuota_task(input)
      end
      def update_fuota_task(input : Types::UpdateFuotaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUOTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Set default log level, or log levels by resource types. This can be for wireless device, wireless
      # gateway, or FUOTA task log options, and is used to control the log messages that'll be displayed in
      # CloudWatch.
      def update_log_levels_by_resource_types(
        default_log_level : String? = nil,
        fuota_task_log_options : Array(Types::FuotaTaskLogOption)? = nil,
        wireless_device_log_options : Array(Types::WirelessDeviceLogOption)? = nil,
        wireless_gateway_log_options : Array(Types::WirelessGatewayLogOption)? = nil
      ) : Protocol::Request
        input = Types::UpdateLogLevelsByResourceTypesRequest.new(default_log_level: default_log_level, fuota_task_log_options: fuota_task_log_options, wireless_device_log_options: wireless_device_log_options, wireless_gateway_log_options: wireless_gateway_log_options)
        update_log_levels_by_resource_types(input)
      end
      def update_log_levels_by_resource_types(input : Types::UpdateLogLevelsByResourceTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LOG_LEVELS_BY_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the summary metric configuration.
      def update_metric_configuration(
        summary_metric : Types::SummaryMetricConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateMetricConfigurationRequest.new(summary_metric: summary_metric)
        update_metric_configuration(input)
      end
      def update_metric_configuration(input : Types::UpdateMetricConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_METRIC_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates properties of a multicast group session.
      def update_multicast_group(
        id : String,
        description : String? = nil,
        lo_ra_wan : Types::LoRaWANMulticast? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMulticastGroupRequest.new(id: id, description: description, lo_ra_wan: lo_ra_wan, name: name)
        update_multicast_group(input)
      end
      def update_multicast_group(input : Types::UpdateMulticastGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MULTICAST_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update network analyzer configuration.
      def update_network_analyzer_configuration(
        configuration_name : String,
        description : String? = nil,
        multicast_groups_to_add : Array(String)? = nil,
        multicast_groups_to_remove : Array(String)? = nil,
        trace_content : Types::TraceContent? = nil,
        wireless_devices_to_add : Array(String)? = nil,
        wireless_devices_to_remove : Array(String)? = nil,
        wireless_gateways_to_add : Array(String)? = nil,
        wireless_gateways_to_remove : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateNetworkAnalyzerConfigurationRequest.new(configuration_name: configuration_name, description: description, multicast_groups_to_add: multicast_groups_to_add, multicast_groups_to_remove: multicast_groups_to_remove, trace_content: trace_content, wireless_devices_to_add: wireless_devices_to_add, wireless_devices_to_remove: wireless_devices_to_remove, wireless_gateways_to_add: wireless_gateways_to_add, wireless_gateways_to_remove: wireless_gateways_to_remove)
        update_network_analyzer_configuration(input)
      end
      def update_network_analyzer_configuration(input : Types::UpdateNetworkAnalyzerConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK_ANALYZER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates properties of a partner account.
      def update_partner_account(
        partner_account_id : String,
        partner_type : String,
        sidewalk : Types::SidewalkUpdateAccount
      ) : Protocol::Request
        input = Types::UpdatePartnerAccountRequest.new(partner_account_id: partner_account_id, partner_type: partner_type, sidewalk: sidewalk)
        update_partner_account(input)
      end
      def update_partner_account(input : Types::UpdatePartnerAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PARTNER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the position information of a resource. This action is no longer supported. Calls to update
      # the position information should use the UpdateResourcePosition API operation instead.
      def update_position(
        position : Array(Float64),
        resource_identifier : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::UpdatePositionRequest.new(position: position, resource_identifier: resource_identifier, resource_type: resource_type)
        update_position(input)
      end
      def update_position(input : Types::UpdatePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the event configuration for a particular resource identifier.
      def update_resource_event_configuration(
        identifier : String,
        identifier_type : String,
        connection_status : Types::ConnectionStatusEventConfiguration? = nil,
        device_registration_state : Types::DeviceRegistrationStateEventConfiguration? = nil,
        join : Types::JoinEventConfiguration? = nil,
        message_delivery_status : Types::MessageDeliveryStatusEventConfiguration? = nil,
        partner_type : String? = nil,
        proximity : Types::ProximityEventConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceEventConfigurationRequest.new(identifier: identifier, identifier_type: identifier_type, connection_status: connection_status, device_registration_state: device_registration_state, join: join, message_delivery_status: message_delivery_status, partner_type: partner_type, proximity: proximity)
        update_resource_event_configuration(input)
      end
      def update_resource_event_configuration(input : Types::UpdateResourceEventConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_EVENT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the position information of a given wireless device or a wireless gateway resource. The
      # position coordinates are based on the World Geodetic System (WGS84) .
      def update_resource_position(
        resource_identifier : String,
        resource_type : String,
        geo_json_payload : Bytes? = nil
      ) : Protocol::Request
        input = Types::UpdateResourcePositionRequest.new(resource_identifier: resource_identifier, resource_type: resource_type, geo_json_payload: geo_json_payload)
        update_resource_position(input)
      end
      def update_resource_position(input : Types::UpdateResourcePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates properties of a wireless device.
      def update_wireless_device(
        id : String,
        description : String? = nil,
        destination_name : String? = nil,
        lo_ra_wan : Types::LoRaWANUpdateDevice? = nil,
        name : String? = nil,
        positioning : String? = nil,
        sidewalk : Types::SidewalkUpdateWirelessDevice? = nil
      ) : Protocol::Request
        input = Types::UpdateWirelessDeviceRequest.new(id: id, description: description, destination_name: destination_name, lo_ra_wan: lo_ra_wan, name: name, positioning: positioning, sidewalk: sidewalk)
        update_wireless_device(input)
      end
      def update_wireless_device(input : Types::UpdateWirelessDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WIRELESS_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an import task to add more devices to the task.
      def update_wireless_device_import_task(
        id : String,
        sidewalk : Types::SidewalkUpdateImportInfo
      ) : Protocol::Request
        input = Types::UpdateWirelessDeviceImportTaskRequest.new(id: id, sidewalk: sidewalk)
        update_wireless_device_import_task(input)
      end
      def update_wireless_device_import_task(input : Types::UpdateWirelessDeviceImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WIRELESS_DEVICE_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates properties of a wireless gateway.
      def update_wireless_gateway(
        id : String,
        description : String? = nil,
        join_eui_filters : Array(Array(String))? = nil,
        max_eirp : Float64? = nil,
        name : String? = nil,
        net_id_filters : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateWirelessGatewayRequest.new(id: id, description: description, join_eui_filters: join_eui_filters, max_eirp: max_eirp, name: name, net_id_filters: net_id_filters)
        update_wireless_gateway(input)
      end
      def update_wireless_gateway(input : Types::UpdateWirelessGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WIRELESS_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
