module AwsSdk
  module IoTManagedIntegrations
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

      # Creates a new account association via the destination id.

      def create_account_association(
        connector_destination_id : String,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccountAssociationRequest.new(connector_destination_id: connector_destination_id, client_token: client_token, description: description, name: name, tags: tags)
        create_account_association(input)
      end

      def create_account_association(input : Types::CreateAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a C2C (cloud-to-cloud) connector.

      def create_cloud_connector(
        endpoint_config : Types::EndpointConfig,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        endpoint_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateCloudConnectorRequest.new(endpoint_config: endpoint_config, name: name, client_token: client_token, description: description, endpoint_type: endpoint_type)
        create_cloud_connector(input)
      end

      def create_cloud_connector(input : Types::CreateCloudConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLOUD_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a connector destination for connecting a cloud-to-cloud (C2C) connector to the customer's
      # Amazon Web Services account.

      def create_connector_destination(
        auth_config : Types::AuthConfig,
        auth_type : String,
        cloud_connector_id : String,
        secrets_manager : Types::SecretsManager,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorDestinationRequest.new(auth_config: auth_config, auth_type: auth_type, cloud_connector_id: cloud_connector_id, secrets_manager: secrets_manager, client_token: client_token, description: description, name: name)
        create_connector_destination(input)
      end

      def create_connector_destination(input : Types::CreateConnectorDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a credential locker. This operation will not trigger the creation of all the manufacturing
      # resources.

      def create_credential_locker(
        client_token : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCredentialLockerRequest.new(client_token: client_token, name: name, tags: tags)
        create_credential_locker(input)
      end

      def create_credential_locker(input : Types::CreateCredentialLockerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CREDENTIAL_LOCKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a notification destination such as Kinesis Data Streams that receive events and notifications
      # from Managed integrations. Managed integrations uses the destination to determine where to deliver
      # notifications.

      def create_destination(
        delivery_destination_arn : String,
        delivery_destination_type : String,
        name : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDestinationRequest.new(delivery_destination_arn: delivery_destination_arn, delivery_destination_type: delivery_destination_type, name: name, role_arn: role_arn, client_token: client_token, description: description, tags: tags)
        create_destination(input)
      end

      def create_destination(input : Types::CreateDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Set the event log configuration for the account, resource type, or specific resource.

      def create_event_log_configuration(
        event_log_level : String,
        resource_type : String,
        client_token : String? = nil,
        resource_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateEventLogConfigurationRequest.new(event_log_level: event_log_level, resource_type: resource_type, client_token: client_token, resource_id: resource_id)
        create_event_log_configuration(input)
      end

      def create_event_log_configuration(input : Types::CreateEventLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a managed thing. A managed thing contains the device identifier, protocol supported, and
      # capabilities of the device in a data model format defined by Managed integrations.

      def create_managed_thing(
        authentication_material : String,
        authentication_material_type : String,
        role : String,
        brand : String? = nil,
        capabilities : String? = nil,
        capability_report : Types::CapabilityReport? = nil,
        capability_schemas : Array(Types::CapabilitySchemaItem)? = nil,
        classification : String? = nil,
        client_token : String? = nil,
        credential_locker_id : String? = nil,
        meta_data : Hash(String, String)? = nil,
        model : String? = nil,
        name : String? = nil,
        owner : String? = nil,
        serial_number : String? = nil,
        tags : Hash(String, String)? = nil,
        wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateManagedThingRequest.new(authentication_material: authentication_material, authentication_material_type: authentication_material_type, role: role, brand: brand, capabilities: capabilities, capability_report: capability_report, capability_schemas: capability_schemas, classification: classification, client_token: client_token, credential_locker_id: credential_locker_id, meta_data: meta_data, model: model, name: name, owner: owner, serial_number: serial_number, tags: tags, wi_fi_simple_setup_configuration: wi_fi_simple_setup_configuration)
        create_managed_thing(input)
      end

      def create_managed_thing(input : Types::CreateManagedThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MANAGED_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a notification configuration. A configuration is a connection between an event type and a
      # destination that you have already created.

      def create_notification_configuration(
        destination_name : String,
        event_type : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNotificationConfigurationRequest.new(destination_name: destination_name, event_type: event_type, client_token: client_token, tags: tags)
        create_notification_configuration(input)
      end

      def create_notification_configuration(input : Types::CreateNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an over-the-air (OTA) task to target a device.

      def create_ota_task(
        ota_type : String,
        s3_url : String,
        client_token : String? = nil,
        description : String? = nil,
        ota_mechanism : String? = nil,
        ota_scheduling_config : Types::OtaTaskSchedulingConfig? = nil,
        ota_target_query_string : String? = nil,
        ota_task_execution_retry_config : Types::OtaTaskExecutionRetryConfig? = nil,
        protocol : String? = nil,
        tags : Hash(String, String)? = nil,
        target : Array(String)? = nil,
        task_configuration_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateOtaTaskRequest.new(ota_type: ota_type, s3_url: s3_url, client_token: client_token, description: description, ota_mechanism: ota_mechanism, ota_scheduling_config: ota_scheduling_config, ota_target_query_string: ota_target_query_string, ota_task_execution_retry_config: ota_task_execution_retry_config, protocol: protocol, tags: tags, target: target, task_configuration_id: task_configuration_id)
        create_ota_task(input)
      end

      def create_ota_task(input : Types::CreateOtaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a configuraiton for the over-the-air (OTA) task.

      def create_ota_task_configuration(
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        push_config : Types::PushConfig? = nil
      ) : Protocol::Request
        input = Types::CreateOtaTaskConfigurationRequest.new(client_token: client_token, description: description, name: name, push_config: push_config)
        create_ota_task_configuration(input)
      end

      def create_ota_task_configuration(input : Types::CreateOtaTaskConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OTA_TASK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a provisioning profile for a device to execute the provisioning flows using a provisioning
      # template. The provisioning template is a document that defines the set of resources and policies
      # applied to a device during the provisioning process.

      def create_provisioning_profile(
        provisioning_type : String,
        ca_certificate : String? = nil,
        client_token : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProvisioningProfileRequest.new(provisioning_type: provisioning_type, ca_certificate: ca_certificate, client_token: client_token, name: name, tags: tags)
        create_provisioning_profile(input)
      end

      def create_provisioning_profile(input : Types::CreateProvisioningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROVISIONING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove a third-party account association for an end user. You must first call the
      # DeregisterAccountAssociation to remove the connection between the managed thing and the third-party
      # account before calling the DeleteAccountAssociation API.

      def delete_account_association(
        account_association_id : String
      ) : Protocol::Request
        input = Types::DeleteAccountAssociationRequest.new(account_association_id: account_association_id)
        delete_account_association(input)
      end

      def delete_account_association(input : Types::DeleteAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a cloud connector.

      def delete_cloud_connector(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteCloudConnectorRequest.new(identifier: identifier)
        delete_cloud_connector(input)
      end

      def delete_cloud_connector(input : Types::DeleteCloudConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLOUD_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a connector destination linked to a cloud-to-cloud (C2C) connector. Deletion can't be done if
      # the account association has used this connector destination.

      def delete_connector_destination(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteConnectorDestinationRequest.new(identifier: identifier)
        delete_connector_destination(input)
      end

      def delete_connector_destination(input : Types::DeleteConnectorDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a credential locker. This operation can't be undone and any existing device won't be able to
      # use IoT managed integrations.

      def delete_credential_locker(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteCredentialLockerRequest.new(identifier: identifier)
        delete_credential_locker(input)
      end

      def delete_credential_locker(input : Types::DeleteCredentialLockerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CREDENTIAL_LOCKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a notification destination specified by name.

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

      # Delete an event log configuration.

      def delete_event_log_configuration(
        id : String
      ) : Protocol::Request
        input = Types::DeleteEventLogConfigurationRequest.new(id: id)
        delete_event_log_configuration(input)
      end

      def delete_event_log_configuration(input : Types::DeleteEventLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a managed thing. For direct-connected and hub-connected devices connecting with Managed
      # integrations via a controller, all of the devices connected to it will have their status changed to
      # PENDING . It is not possible to remove a cloud-to-cloud device.

      def delete_managed_thing(
        identifier : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteManagedThingRequest.new(identifier: identifier, force: force)
        delete_managed_thing(input)
      end

      def delete_managed_thing(input : Types::DeleteManagedThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MANAGED_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a notification configuration.

      def delete_notification_configuration(
        event_type : String
      ) : Protocol::Request
        input = Types::DeleteNotificationConfigurationRequest.new(event_type: event_type)
        delete_notification_configuration(input)
      end

      def delete_notification_configuration(input : Types::DeleteNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the over-the-air (OTA) task.

      def delete_ota_task(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteOtaTaskRequest.new(identifier: identifier)
        delete_ota_task(input)
      end

      def delete_ota_task(input : Types::DeleteOtaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the over-the-air (OTA) task configuration.

      def delete_ota_task_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteOtaTaskConfigurationRequest.new(identifier: identifier)
        delete_ota_task_configuration(input)
      end

      def delete_ota_task_configuration(input : Types::DeleteOtaTaskConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OTA_TASK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a provisioning profile.

      def delete_provisioning_profile(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteProvisioningProfileRequest.new(identifier: identifier)
        delete_provisioning_profile(input)
      end

      def delete_provisioning_profile(input : Types::DeleteProvisioningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROVISIONING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregister an account association from a managed thing.

      def deregister_account_association(
        account_association_id : String,
        managed_thing_id : String
      ) : Protocol::Request
        input = Types::DeregisterAccountAssociationRequest.new(account_association_id: account_association_id, managed_thing_id: managed_thing_id)
        deregister_account_association(input)
      end

      def deregister_account_association(input : Types::DeregisterAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an account association for an Amazon Web Services account linked to a customer-managed
      # destination.

      def get_account_association(
        account_association_id : String
      ) : Protocol::Request
        input = Types::GetAccountAssociationRequest.new(account_association_id: account_association_id)
        get_account_association(input)
      end

      def get_account_association(input : Types::GetAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get configuration details for a cloud connector.

      def get_cloud_connector(
        identifier : String
      ) : Protocol::Request
        input = Types::GetCloudConnectorRequest.new(identifier: identifier)
        get_cloud_connector(input)
      end

      def get_cloud_connector(input : Types::GetCloudConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLOUD_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get connector destination details linked to a cloud-to-cloud (C2C) connector.

      def get_connector_destination(
        identifier : String
      ) : Protocol::Request
        input = Types::GetConnectorDestinationRequest.new(identifier: identifier)
        get_connector_destination(input)
      end

      def get_connector_destination(input : Types::GetConnectorDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information on an existing credential locker

      def get_credential_locker(
        identifier : String
      ) : Protocol::Request
        input = Types::GetCredentialLockerRequest.new(identifier: identifier)
        get_credential_locker(input)
      end

      def get_credential_locker(input : Types::GetCredentialLockerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CREDENTIAL_LOCKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the IoT managed integrations custom endpoint.

      def get_custom_endpoint : Protocol::Request
        input = Types::GetCustomEndpointRequest.new
        get_custom_endpoint(input)
      end

      def get_custom_endpoint(input : Types::GetCustomEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the default encryption configuration for the Amazon Web Services account
      # in the default or specified region. For more information, see Key management in the AWS IoT SiteWise
      # User Guide .

      def get_default_encryption_configuration : Protocol::Request
        input = Types::GetDefaultEncryptionConfigurationRequest.new
        get_default_encryption_configuration(input)
      end

      def get_default_encryption_configuration(input : Types::GetDefaultEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEFAULT_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a destination by name.

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

      # Get the current state of a device discovery.

      def get_device_discovery(
        identifier : String
      ) : Protocol::Request
        input = Types::GetDeviceDiscoveryRequest.new(identifier: identifier)
        get_device_discovery(input)
      end

      def get_device_discovery(input : Types::GetDeviceDiscoveryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_DISCOVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an event log configuration.

      def get_event_log_configuration(
        id : String
      ) : Protocol::Request
        input = Types::GetEventLogConfigurationRequest.new(id: id)
        get_event_log_configuration(input)
      end

      def get_event_log_configuration(input : Types::GetEventLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a hub configuration.

      def get_hub_configuration : Protocol::Request
        input = Types::GetHubConfigurationRequest.new
        get_hub_configuration(input)
      end

      def get_hub_configuration(input : Types::GetHubConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_HUB_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details of a managed thing including its attributes and capabilities.

      def get_managed_thing(
        identifier : String
      ) : Protocol::Request
        input = Types::GetManagedThingRequest.new(identifier: identifier)
        get_managed_thing(input)
      end

      def get_managed_thing(input : Types::GetManagedThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the capabilities for a managed thing using the device ID.

      def get_managed_thing_capabilities(
        identifier : String
      ) : Protocol::Request
        input = Types::GetManagedThingCapabilitiesRequest.new(identifier: identifier)
        get_managed_thing_capabilities(input)
      end

      def get_managed_thing_capabilities(input : Types::GetManagedThingCapabilitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING_CAPABILITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the certificate PEM for a managed IoT thing.

      def get_managed_thing_certificate(
        identifier : String
      ) : Protocol::Request
        input = Types::GetManagedThingCertificateRequest.new(identifier: identifier)
        get_managed_thing_certificate(input)
      end

      def get_managed_thing_certificate(input : Types::GetManagedThingCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the connectivity status of a managed thing.

      def get_managed_thing_connectivity_data(
        identifier : String
      ) : Protocol::Request
        input = Types::GetManagedThingConnectivityDataRequest.new(identifier: identifier)
        get_managed_thing_connectivity_data(input)
      end

      def get_managed_thing_connectivity_data(input : Types::GetManagedThingConnectivityDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING_CONNECTIVITY_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the metadata information for a managed thing. The managedThing metadata parameter is used for
      # associating attributes with a managedThing that can be used for grouping over-the-air (OTA) tasks.
      # Name value pairs in metadata can be used in the OtaTargetQueryString parameter for the CreateOtaTask
      # API operation.

      def get_managed_thing_meta_data(
        identifier : String
      ) : Protocol::Request
        input = Types::GetManagedThingMetaDataRequest.new(identifier: identifier)
        get_managed_thing_meta_data(input)
      end

      def get_managed_thing_meta_data(input : Types::GetManagedThingMetaDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING_META_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the managed thing state for the given device Id.

      def get_managed_thing_state(
        managed_thing_id : String
      ) : Protocol::Request
        input = Types::GetManagedThingStateRequest.new(managed_thing_id: managed_thing_id)
        get_managed_thing_state(input)
      end

      def get_managed_thing_state(input : Types::GetManagedThingStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_THING_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a notification configuration for a specified event type.

      def get_notification_configuration(
        event_type : String
      ) : Protocol::Request
        input = Types::GetNotificationConfigurationRequest.new(event_type: event_type)
        get_notification_configuration(input)
      end

      def get_notification_configuration(input : Types::GetNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details of the over-the-air (OTA) task by its task id.

      def get_ota_task(
        identifier : String
      ) : Protocol::Request
        input = Types::GetOtaTaskRequest.new(identifier: identifier)
        get_ota_task(input)
      end

      def get_ota_task(input : Types::GetOtaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a configuraiton for the over-the-air (OTA) task.

      def get_ota_task_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::GetOtaTaskConfigurationRequest.new(identifier: identifier)
        get_ota_task_configuration(input)
      end

      def get_ota_task_configuration(input : Types::GetOtaTaskConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OTA_TASK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a provisioning profile by template name.

      def get_provisioning_profile(
        identifier : String
      ) : Protocol::Request
        input = Types::GetProvisioningProfileRequest.new(identifier: identifier)
        get_provisioning_profile(input)
      end

      def get_provisioning_profile(input : Types::GetProvisioningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROVISIONING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the runtime log configuration for a specific managed thing.

      def get_runtime_log_configuration(
        managed_thing_id : String
      ) : Protocol::Request
        input = Types::GetRuntimeLogConfigurationRequest.new(managed_thing_id: managed_thing_id)
        get_runtime_log_configuration(input)
      end

      def get_runtime_log_configuration(input : Types::GetRuntimeLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUNTIME_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a schema version with the provided information.

      def get_schema_version(
        schema_versioned_id : String,
        type : String,
        format : String? = nil
      ) : Protocol::Request
        input = Types::GetSchemaVersionRequest.new(schema_versioned_id: schema_versioned_id, type: type, format: format)
        get_schema_version(input)
      end

      def get_schema_version(input : Types::GetSchemaVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all account associations, with optional filtering by connector destination ID.

      def list_account_associations(
        connector_destination_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountAssociationsRequest.new(connector_destination_id: connector_destination_id, max_results: max_results, next_token: next_token)
        list_account_associations(input)
      end

      def list_account_associations(input : Types::ListAccountAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of connectors filtered by its Lambda Amazon Resource Name (ARN) and type .

      def list_cloud_connectors(
        lambda_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListCloudConnectorsRequest.new(lambda_arn: lambda_arn, max_results: max_results, next_token: next_token, type: type)
        list_cloud_connectors(input)
      end

      def list_cloud_connectors(input : Types::ListCloudConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLOUD_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all connector destinations, with optional filtering by cloud connector ID.

      def list_connector_destinations(
        cloud_connector_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorDestinationsRequest.new(cloud_connector_id: cloud_connector_id, max_results: max_results, next_token: next_token)
        list_connector_destinations(input)
      end

      def list_connector_destinations(input : Types::ListConnectorDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTOR_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List information on an existing credential locker.

      def list_credential_lockers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCredentialLockersRequest.new(max_results: max_results, next_token: next_token)
        list_credential_lockers(input)
      end

      def list_credential_lockers(input : Types::ListCredentialLockersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CREDENTIAL_LOCKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all notification destinations.

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

      # Lists all device discovery tasks, with optional filtering by type and status.

      def list_device_discoveries(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status_filter : String? = nil,
        type_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListDeviceDiscoveriesRequest.new(max_results: max_results, next_token: next_token, status_filter: status_filter, type_filter: type_filter)
        list_device_discoveries(input)
      end

      def list_device_discoveries(input : Types::ListDeviceDiscoveriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_DISCOVERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all devices discovered during a specific device discovery task.

      def list_discovered_devices(
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDiscoveredDevicesRequest.new(identifier: identifier, max_results: max_results, next_token: next_token)
        list_discovered_devices(input)
      end

      def list_discovered_devices(input : Types::ListDiscoveredDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DISCOVERED_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all event log configurations for an account.

      def list_event_log_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventLogConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_event_log_configurations(input)
      end

      def list_event_log_configurations(input : Types::ListEventLogConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_LOG_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all account associations for a specific managed thing.

      def list_managed_thing_account_associations(
        account_association_id : String? = nil,
        managed_thing_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedThingAccountAssociationsRequest.new(account_association_id: account_association_id, managed_thing_id: managed_thing_id, max_results: max_results, next_token: next_token)
        list_managed_thing_account_associations(input)
      end

      def list_managed_thing_account_associations(input : Types::ListManagedThingAccountAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_THING_ACCOUNT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List schemas associated with a managed thing.

      def list_managed_thing_schemas(
        identifier : String,
        capability_id_filter : String? = nil,
        endpoint_id_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedThingSchemasRequest.new(identifier: identifier, capability_id_filter: capability_id_filter, endpoint_id_filter: endpoint_id_filter, max_results: max_results, next_token: next_token)
        list_managed_thing_schemas(input)
      end

      def list_managed_thing_schemas(input : Types::ListManagedThingSchemasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_THING_SCHEMAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Listing all managed things with provision for filters.

      def list_managed_things(
        connector_destination_id_filter : String? = nil,
        connector_device_id_filter : String? = nil,
        connector_policy_id_filter : String? = nil,
        credential_locker_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner_filter : String? = nil,
        parent_controller_identifier_filter : String? = nil,
        provisioning_status_filter : String? = nil,
        role_filter : String? = nil,
        serial_number_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedThingsRequest.new(connector_destination_id_filter: connector_destination_id_filter, connector_device_id_filter: connector_device_id_filter, connector_policy_id_filter: connector_policy_id_filter, credential_locker_filter: credential_locker_filter, max_results: max_results, next_token: next_token, owner_filter: owner_filter, parent_controller_identifier_filter: parent_controller_identifier_filter, provisioning_status_filter: provisioning_status_filter, role_filter: role_filter, serial_number_filter: serial_number_filter)
        list_managed_things(input)
      end

      def list_managed_things(input : Types::ListManagedThingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_THINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all notification configurations.

      def list_notification_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_notification_configurations(input)
      end

      def list_notification_configurations(input : Types::ListNotificationConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the over-the-air (OTA) task configurations.

      def list_ota_task_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOtaTaskConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_ota_task_configurations(input)
      end

      def list_ota_task_configurations(input : Types::ListOtaTaskConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OTA_TASK_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the over-the-air (OTA) task executions.

      def list_ota_task_executions(
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOtaTaskExecutionsRequest.new(identifier: identifier, max_results: max_results, next_token: next_token)
        list_ota_task_executions(input)
      end

      def list_ota_task_executions(input : Types::ListOtaTaskExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OTA_TASK_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the over-the-air (OTA) tasks.

      def list_ota_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOtaTasksRequest.new(max_results: max_results, next_token: next_token)
        list_ota_tasks(input)
      end

      def list_ota_tasks(input : Types::ListOtaTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OTA_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the provisioning profiles within the Amazon Web Services account.

      def list_provisioning_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProvisioningProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_provisioning_profiles(input)
      end

      def list_provisioning_profiles(input : Types::ListProvisioningProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONING_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists schema versions with the provided information.

      def list_schema_versions(
        type : String,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        schema_id : String? = nil,
        semantic_version : String? = nil,
        visibility : String? = nil
      ) : Protocol::Request
        input = Types::ListSchemaVersionsRequest.new(type: type, max_results: max_results, namespace: namespace, next_token: next_token, schema_id: schema_id, semantic_version: semantic_version, visibility: visibility)
        list_schema_versions(input)
      end

      def list_schema_versions(input : Types::ListSchemaVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEMA_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List tags for the specified resource.

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

      # Sets the default encryption configuration for the Amazon Web Services account. For more information,
      # see Key management in the AWS IoT SiteWise User Guide.

      def put_default_encryption_configuration(
        encryption_type : String,
        kms_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutDefaultEncryptionConfigurationRequest.new(encryption_type: encryption_type, kms_key_arn: kms_key_arn)
        put_default_encryption_configuration(input)
      end

      def put_default_encryption_configuration(input : Types::PutDefaultEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEFAULT_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a hub configuration.

      def put_hub_configuration(
        hub_token_timer_expiry_setting_in_seconds : Int64
      ) : Protocol::Request
        input = Types::PutHubConfigurationRequest.new(hub_token_timer_expiry_setting_in_seconds: hub_token_timer_expiry_setting_in_seconds)
        put_hub_configuration(input)
      end

      def put_hub_configuration(input : Types::PutHubConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_HUB_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Set the runtime log configuration for a specific managed thing.

      def put_runtime_log_configuration(
        managed_thing_id : String,
        runtime_log_configurations : Types::RuntimeLogConfigurations
      ) : Protocol::Request
        input = Types::PutRuntimeLogConfigurationRequest.new(managed_thing_id: managed_thing_id, runtime_log_configurations: runtime_log_configurations)
        put_runtime_log_configuration(input)
      end

      def put_runtime_log_configuration(input : Types::PutRuntimeLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RUNTIME_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers an account association with a managed thing, establishing a connection between a device
      # and a third-party account.

      def register_account_association(
        account_association_id : String,
        device_discovery_id : String,
        managed_thing_id : String
      ) : Protocol::Request
        input = Types::RegisterAccountAssociationRequest.new(account_association_id: account_association_id, device_discovery_id: device_discovery_id, managed_thing_id: managed_thing_id)
        register_account_association(input)
      end

      def register_account_association(input : Types::RegisterAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Customers can request IoT managed integrations to manage the server trust for them or bring their
      # own external server trusts for the custom domain. Returns an IoT managed integrations endpoint.

      def register_custom_endpoint : Protocol::Request
        input = Types::RegisterCustomEndpointRequest.new
        register_custom_endpoint(input)
      end

      def register_custom_endpoint(input : Types::RegisterCustomEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CUSTOM_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reset a runtime log configuration for a specific managed thing.

      def reset_runtime_log_configuration(
        managed_thing_id : String
      ) : Protocol::Request
        input = Types::ResetRuntimeLogConfigurationRequest.new(managed_thing_id: managed_thing_id)
        reset_runtime_log_configuration(input)
      end

      def reset_runtime_log_configuration(input : Types::ResetRuntimeLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_RUNTIME_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Relays third-party device events for a connector such as a new device or a device state change
      # event.

      def send_connector_event(
        connector_id : String,
        operation : String,
        connector_device_id : String? = nil,
        device_discovery_id : String? = nil,
        devices : Array(Types::Device)? = nil,
        matter_endpoint : Types::MatterEndpoint? = nil,
        message : String? = nil,
        operation_version : String? = nil,
        status_code : Int32? = nil,
        trace_id : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::SendConnectorEventRequest.new(connector_id: connector_id, operation: operation, connector_device_id: connector_device_id, device_discovery_id: device_discovery_id, devices: devices, matter_endpoint: matter_endpoint, message: message, operation_version: operation_version, status_code: status_code, trace_id: trace_id, user_id: user_id)
        send_connector_event(input)
      end

      def send_connector_event(input : Types::SendConnectorEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CONNECTOR_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send the command to the device represented by the managed thing.

      def send_managed_thing_command(
        endpoints : Array(Types::CommandEndpoint),
        managed_thing_id : String,
        account_association_id : String? = nil,
        connector_association_id : String? = nil
      ) : Protocol::Request
        input = Types::SendManagedThingCommandRequest.new(endpoints: endpoints, managed_thing_id: managed_thing_id, account_association_id: account_association_id, connector_association_id: connector_association_id)
        send_managed_thing_command(input)
      end

      def send_managed_thing_command(input : Types::SendManagedThingCommandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_MANAGED_THING_COMMAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a refresh of an existing account association to update its authorization and connection
      # status.

      def start_account_association_refresh(
        account_association_id : String
      ) : Protocol::Request
        input = Types::StartAccountAssociationRefreshRequest.new(account_association_id: account_association_id)
        start_account_association_refresh(input)
      end

      def start_account_association_refresh(input : Types::StartAccountAssociationRefreshRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ACCOUNT_ASSOCIATION_REFRESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is used to start device discovery for hub-connected and third-party-connected devices. The
      # authentication material (install code) is delivered as a message to the controller instructing it to
      # start the discovery.

      def start_device_discovery(
        discovery_type : String,
        account_association_id : String? = nil,
        authentication_material : String? = nil,
        authentication_material_type : String? = nil,
        client_token : String? = nil,
        connector_association_identifier : String? = nil,
        controller_identifier : String? = nil,
        custom_protocol_detail : Hash(String, String)? = nil,
        end_device_identifier : String? = nil,
        protocol : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartDeviceDiscoveryRequest.new(discovery_type: discovery_type, account_association_id: account_association_id, authentication_material: authentication_material, authentication_material_type: authentication_material_type, client_token: client_token, connector_association_identifier: connector_association_identifier, controller_identifier: controller_identifier, custom_protocol_detail: custom_protocol_detail, end_device_identifier: end_device_identifier, protocol: protocol, tags: tags)
        start_device_discovery(input)
      end

      def start_device_discovery(input : Types::StartDeviceDiscoveryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEVICE_DISCOVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add tags for the specified resource.

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

      # Remove tags for the specified resource.

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

      # Updates the properties of an existing account association.

      def update_account_association(
        account_association_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountAssociationRequest.new(account_association_id: account_association_id, description: description, name: name)
        update_account_association(input)
      end

      def update_account_association(input : Types::UpdateAccountAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an existing cloud connector.

      def update_cloud_connector(
        identifier : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCloudConnectorRequest.new(identifier: identifier, description: description, name: name)
        update_cloud_connector(input)
      end

      def update_cloud_connector(input : Types::UpdateCloudConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLOUD_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing connector destination.

      def update_connector_destination(
        identifier : String,
        auth_config : Types::AuthConfigUpdate? = nil,
        auth_type : String? = nil,
        description : String? = nil,
        name : String? = nil,
        secrets_manager : Types::SecretsManager? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorDestinationRequest.new(identifier: identifier, auth_config: auth_config, auth_type: auth_type, description: description, name: name, secrets_manager: secrets_manager)
        update_connector_destination(input)
      end

      def update_connector_destination(input : Types::UpdateConnectorDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a destination specified by name.

      def update_destination(
        name : String,
        delivery_destination_arn : String? = nil,
        delivery_destination_type : String? = nil,
        description : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDestinationRequest.new(name: name, delivery_destination_arn: delivery_destination_arn, delivery_destination_type: delivery_destination_type, description: description, role_arn: role_arn)
        update_destination(input)
      end

      def update_destination(input : Types::UpdateDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an event log configuration by log configuration ID.

      def update_event_log_configuration(
        event_log_level : String,
        id : String
      ) : Protocol::Request
        input = Types::UpdateEventLogConfigurationRequest.new(event_log_level: event_log_level, id: id)
        update_event_log_configuration(input)
      end

      def update_event_log_configuration(input : Types::UpdateEventLogConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_LOG_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the attributes and capabilities associated with a managed thing.

      def update_managed_thing(
        identifier : String,
        brand : String? = nil,
        capabilities : String? = nil,
        capability_report : Types::CapabilityReport? = nil,
        capability_schemas : Array(Types::CapabilitySchemaItem)? = nil,
        classification : String? = nil,
        credential_locker_id : String? = nil,
        hub_network_mode : String? = nil,
        meta_data : Hash(String, String)? = nil,
        model : String? = nil,
        name : String? = nil,
        owner : String? = nil,
        serial_number : String? = nil,
        wi_fi_simple_setup_configuration : Types::WiFiSimpleSetupConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateManagedThingRequest.new(identifier: identifier, brand: brand, capabilities: capabilities, capability_report: capability_report, capability_schemas: capability_schemas, classification: classification, credential_locker_id: credential_locker_id, hub_network_mode: hub_network_mode, meta_data: meta_data, model: model, name: name, owner: owner, serial_number: serial_number, wi_fi_simple_setup_configuration: wi_fi_simple_setup_configuration)
        update_managed_thing(input)
      end

      def update_managed_thing(input : Types::UpdateManagedThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MANAGED_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a notification configuration.

      def update_notification_configuration(
        destination_name : String,
        event_type : String
      ) : Protocol::Request
        input = Types::UpdateNotificationConfigurationRequest.new(destination_name: destination_name, event_type: event_type)
        update_notification_configuration(input)
      end

      def update_notification_configuration(input : Types::UpdateNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an over-the-air (OTA) task.

      def update_ota_task(
        identifier : String,
        description : String? = nil,
        task_configuration_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateOtaTaskRequest.new(identifier: identifier, description: description, task_configuration_id: task_configuration_id)
        update_ota_task(input)
      end

      def update_ota_task(input : Types::UpdateOtaTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_OTA_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
