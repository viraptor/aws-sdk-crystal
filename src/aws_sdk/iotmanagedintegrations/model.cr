module AwsSdk
  module IoTManagedIntegrations
    module Model
      API_VERSION = "2025-03-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotmanagedintegrations"
      ENDPOINT_PREFIX = "api.iotmanagedintegrations"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://api.iotmanagedintegrations-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://api.iotmanagedintegrations.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "CreateAccountAssociation",
        http_method: "POST",
        request_uri: "/account-associations"
      )

      CREATE_CLOUD_CONNECTOR = OperationModel.new(
        name: "CreateCloudConnector",
        http_method: "POST",
        request_uri: "/cloud-connectors"
      )

      CREATE_CONNECTOR_DESTINATION = OperationModel.new(
        name: "CreateConnectorDestination",
        http_method: "POST",
        request_uri: "/connector-destinations"
      )

      CREATE_CREDENTIAL_LOCKER = OperationModel.new(
        name: "CreateCredentialLocker",
        http_method: "POST",
        request_uri: "/credential-lockers"
      )

      CREATE_DESTINATION = OperationModel.new(
        name: "CreateDestination",
        http_method: "POST",
        request_uri: "/destinations"
      )

      CREATE_EVENT_LOG_CONFIGURATION = OperationModel.new(
        name: "CreateEventLogConfiguration",
        http_method: "POST",
        request_uri: "/event-log-configurations"
      )

      CREATE_MANAGED_THING = OperationModel.new(
        name: "CreateManagedThing",
        http_method: "POST",
        request_uri: "/managed-things"
      )

      CREATE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "CreateNotificationConfiguration",
        http_method: "POST",
        request_uri: "/notification-configurations"
      )

      CREATE_OTA_TASK = OperationModel.new(
        name: "CreateOtaTask",
        http_method: "POST",
        request_uri: "/ota-tasks"
      )

      CREATE_OTA_TASK_CONFIGURATION = OperationModel.new(
        name: "CreateOtaTaskConfiguration",
        http_method: "POST",
        request_uri: "/ota-task-configurations"
      )

      CREATE_PROVISIONING_PROFILE = OperationModel.new(
        name: "CreateProvisioningProfile",
        http_method: "POST",
        request_uri: "/provisioning-profiles"
      )

      DELETE_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "DeleteAccountAssociation",
        http_method: "DELETE",
        request_uri: "/account-associations/{AccountAssociationId}"
      )

      DELETE_CLOUD_CONNECTOR = OperationModel.new(
        name: "DeleteCloudConnector",
        http_method: "DELETE",
        request_uri: "/cloud-connectors/{Identifier}"
      )

      DELETE_CONNECTOR_DESTINATION = OperationModel.new(
        name: "DeleteConnectorDestination",
        http_method: "DELETE",
        request_uri: "/connector-destinations/{Identifier}"
      )

      DELETE_CREDENTIAL_LOCKER = OperationModel.new(
        name: "DeleteCredentialLocker",
        http_method: "DELETE",
        request_uri: "/credential-lockers/{Identifier}"
      )

      DELETE_DESTINATION = OperationModel.new(
        name: "DeleteDestination",
        http_method: "DELETE",
        request_uri: "/destinations/{Name}"
      )

      DELETE_EVENT_LOG_CONFIGURATION = OperationModel.new(
        name: "DeleteEventLogConfiguration",
        http_method: "DELETE",
        request_uri: "/event-log-configurations/{Id}"
      )

      DELETE_MANAGED_THING = OperationModel.new(
        name: "DeleteManagedThing",
        http_method: "DELETE",
        request_uri: "/managed-things/{Identifier}"
      )

      DELETE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "DeleteNotificationConfiguration",
        http_method: "DELETE",
        request_uri: "/notification-configurations/{EventType}"
      )

      DELETE_OTA_TASK = OperationModel.new(
        name: "DeleteOtaTask",
        http_method: "DELETE",
        request_uri: "/ota-tasks/{Identifier}"
      )

      DELETE_OTA_TASK_CONFIGURATION = OperationModel.new(
        name: "DeleteOtaTaskConfiguration",
        http_method: "DELETE",
        request_uri: "/ota-task-configurations/{Identifier}"
      )

      DELETE_PROVISIONING_PROFILE = OperationModel.new(
        name: "DeleteProvisioningProfile",
        http_method: "DELETE",
        request_uri: "/provisioning-profiles/{Identifier}"
      )

      DEREGISTER_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "DeregisterAccountAssociation",
        http_method: "PUT",
        request_uri: "/managed-thing-associations/deregister"
      )

      GET_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "GetAccountAssociation",
        http_method: "GET",
        request_uri: "/account-associations/{AccountAssociationId}"
      )

      GET_CLOUD_CONNECTOR = OperationModel.new(
        name: "GetCloudConnector",
        http_method: "GET",
        request_uri: "/cloud-connectors/{Identifier}"
      )

      GET_CONNECTOR_DESTINATION = OperationModel.new(
        name: "GetConnectorDestination",
        http_method: "GET",
        request_uri: "/connector-destinations/{Identifier}"
      )

      GET_CREDENTIAL_LOCKER = OperationModel.new(
        name: "GetCredentialLocker",
        http_method: "GET",
        request_uri: "/credential-lockers/{Identifier}"
      )

      GET_CUSTOM_ENDPOINT = OperationModel.new(
        name: "GetCustomEndpoint",
        http_method: "GET",
        request_uri: "/custom-endpoint"
      )

      GET_DEFAULT_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "GetDefaultEncryptionConfiguration",
        http_method: "GET",
        request_uri: "/configuration/account/encryption"
      )

      GET_DESTINATION = OperationModel.new(
        name: "GetDestination",
        http_method: "GET",
        request_uri: "/destinations/{Name}"
      )

      GET_DEVICE_DISCOVERY = OperationModel.new(
        name: "GetDeviceDiscovery",
        http_method: "GET",
        request_uri: "/device-discoveries/{Identifier}"
      )

      GET_EVENT_LOG_CONFIGURATION = OperationModel.new(
        name: "GetEventLogConfiguration",
        http_method: "GET",
        request_uri: "/event-log-configurations/{Id}"
      )

      GET_HUB_CONFIGURATION = OperationModel.new(
        name: "GetHubConfiguration",
        http_method: "GET",
        request_uri: "/hub-configuration"
      )

      GET_MANAGED_THING = OperationModel.new(
        name: "GetManagedThing",
        http_method: "GET",
        request_uri: "/managed-things/{Identifier}"
      )

      GET_MANAGED_THING_CAPABILITIES = OperationModel.new(
        name: "GetManagedThingCapabilities",
        http_method: "GET",
        request_uri: "/managed-things-capabilities/{Identifier}"
      )

      GET_MANAGED_THING_CERTIFICATE = OperationModel.new(
        name: "GetManagedThingCertificate",
        http_method: "GET",
        request_uri: "/managed-things-certificate/{Identifier}"
      )

      GET_MANAGED_THING_CONNECTIVITY_DATA = OperationModel.new(
        name: "GetManagedThingConnectivityData",
        http_method: "POST",
        request_uri: "/managed-things-connectivity-data/{Identifier}"
      )

      GET_MANAGED_THING_META_DATA = OperationModel.new(
        name: "GetManagedThingMetaData",
        http_method: "GET",
        request_uri: "/managed-things-metadata/{Identifier}"
      )

      GET_MANAGED_THING_STATE = OperationModel.new(
        name: "GetManagedThingState",
        http_method: "GET",
        request_uri: "/managed-thing-states/{ManagedThingId}"
      )

      GET_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "GetNotificationConfiguration",
        http_method: "GET",
        request_uri: "/notification-configurations/{EventType}"
      )

      GET_OTA_TASK = OperationModel.new(
        name: "GetOtaTask",
        http_method: "GET",
        request_uri: "/ota-tasks/{Identifier}"
      )

      GET_OTA_TASK_CONFIGURATION = OperationModel.new(
        name: "GetOtaTaskConfiguration",
        http_method: "GET",
        request_uri: "/ota-task-configurations/{Identifier}"
      )

      GET_PROVISIONING_PROFILE = OperationModel.new(
        name: "GetProvisioningProfile",
        http_method: "GET",
        request_uri: "/provisioning-profiles/{Identifier}"
      )

      GET_RUNTIME_LOG_CONFIGURATION = OperationModel.new(
        name: "GetRuntimeLogConfiguration",
        http_method: "GET",
        request_uri: "/runtime-log-configurations/{ManagedThingId}"
      )

      GET_SCHEMA_VERSION = OperationModel.new(
        name: "GetSchemaVersion",
        http_method: "GET",
        request_uri: "/schema-versions/{Type}/{SchemaVersionedId}"
      )

      LIST_ACCOUNT_ASSOCIATIONS = OperationModel.new(
        name: "ListAccountAssociations",
        http_method: "GET",
        request_uri: "/account-associations"
      )

      LIST_CLOUD_CONNECTORS = OperationModel.new(
        name: "ListCloudConnectors",
        http_method: "GET",
        request_uri: "/cloud-connectors"
      )

      LIST_CONNECTOR_DESTINATIONS = OperationModel.new(
        name: "ListConnectorDestinations",
        http_method: "GET",
        request_uri: "/connector-destinations"
      )

      LIST_CREDENTIAL_LOCKERS = OperationModel.new(
        name: "ListCredentialLockers",
        http_method: "GET",
        request_uri: "/credential-lockers"
      )

      LIST_DESTINATIONS = OperationModel.new(
        name: "ListDestinations",
        http_method: "GET",
        request_uri: "/destinations"
      )

      LIST_DEVICE_DISCOVERIES = OperationModel.new(
        name: "ListDeviceDiscoveries",
        http_method: "GET",
        request_uri: "/device-discoveries"
      )

      LIST_DISCOVERED_DEVICES = OperationModel.new(
        name: "ListDiscoveredDevices",
        http_method: "GET",
        request_uri: "/device-discoveries/{Identifier}/devices"
      )

      LIST_EVENT_LOG_CONFIGURATIONS = OperationModel.new(
        name: "ListEventLogConfigurations",
        http_method: "GET",
        request_uri: "/event-log-configurations"
      )

      LIST_MANAGED_THING_ACCOUNT_ASSOCIATIONS = OperationModel.new(
        name: "ListManagedThingAccountAssociations",
        http_method: "GET",
        request_uri: "/managed-thing-associations"
      )

      LIST_MANAGED_THING_SCHEMAS = OperationModel.new(
        name: "ListManagedThingSchemas",
        http_method: "GET",
        request_uri: "/managed-thing-schemas/{Identifier}"
      )

      LIST_MANAGED_THINGS = OperationModel.new(
        name: "ListManagedThings",
        http_method: "GET",
        request_uri: "/managed-things"
      )

      LIST_NOTIFICATION_CONFIGURATIONS = OperationModel.new(
        name: "ListNotificationConfigurations",
        http_method: "GET",
        request_uri: "/notification-configurations"
      )

      LIST_OTA_TASK_CONFIGURATIONS = OperationModel.new(
        name: "ListOtaTaskConfigurations",
        http_method: "GET",
        request_uri: "/ota-task-configurations"
      )

      LIST_OTA_TASK_EXECUTIONS = OperationModel.new(
        name: "ListOtaTaskExecutions",
        http_method: "GET",
        request_uri: "/ota-tasks/{Identifier}/devices"
      )

      LIST_OTA_TASKS = OperationModel.new(
        name: "ListOtaTasks",
        http_method: "GET",
        request_uri: "/ota-tasks"
      )

      LIST_PROVISIONING_PROFILES = OperationModel.new(
        name: "ListProvisioningProfiles",
        http_method: "GET",
        request_uri: "/provisioning-profiles"
      )

      LIST_SCHEMA_VERSIONS = OperationModel.new(
        name: "ListSchemaVersions",
        http_method: "GET",
        request_uri: "/schema-versions/{Type}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PUT_DEFAULT_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "PutDefaultEncryptionConfiguration",
        http_method: "POST",
        request_uri: "/configuration/account/encryption"
      )

      PUT_HUB_CONFIGURATION = OperationModel.new(
        name: "PutHubConfiguration",
        http_method: "PUT",
        request_uri: "/hub-configuration"
      )

      PUT_RUNTIME_LOG_CONFIGURATION = OperationModel.new(
        name: "PutRuntimeLogConfiguration",
        http_method: "PUT",
        request_uri: "/runtime-log-configurations/{ManagedThingId}"
      )

      REGISTER_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "RegisterAccountAssociation",
        http_method: "PUT",
        request_uri: "/managed-thing-associations/register"
      )

      REGISTER_CUSTOM_ENDPOINT = OperationModel.new(
        name: "RegisterCustomEndpoint",
        http_method: "POST",
        request_uri: "/custom-endpoint"
      )

      RESET_RUNTIME_LOG_CONFIGURATION = OperationModel.new(
        name: "ResetRuntimeLogConfiguration",
        http_method: "DELETE",
        request_uri: "/runtime-log-configurations/{ManagedThingId}"
      )

      SEND_CONNECTOR_EVENT = OperationModel.new(
        name: "SendConnectorEvent",
        http_method: "POST",
        request_uri: "/connector-event/{ConnectorId}"
      )

      SEND_MANAGED_THING_COMMAND = OperationModel.new(
        name: "SendManagedThingCommand",
        http_method: "POST",
        request_uri: "/managed-things-command/{ManagedThingId}"
      )

      START_ACCOUNT_ASSOCIATION_REFRESH = OperationModel.new(
        name: "StartAccountAssociationRefresh",
        http_method: "POST",
        request_uri: "/account-associations/{AccountAssociationId}/refresh"
      )

      START_DEVICE_DISCOVERY = OperationModel.new(
        name: "StartDeviceDiscovery",
        http_method: "POST",
        request_uri: "/device-discoveries"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_ACCOUNT_ASSOCIATION = OperationModel.new(
        name: "UpdateAccountAssociation",
        http_method: "PUT",
        request_uri: "/account-associations/{AccountAssociationId}"
      )

      UPDATE_CLOUD_CONNECTOR = OperationModel.new(
        name: "UpdateCloudConnector",
        http_method: "PUT",
        request_uri: "/cloud-connectors/{Identifier}"
      )

      UPDATE_CONNECTOR_DESTINATION = OperationModel.new(
        name: "UpdateConnectorDestination",
        http_method: "PUT",
        request_uri: "/connector-destinations/{Identifier}"
      )

      UPDATE_DESTINATION = OperationModel.new(
        name: "UpdateDestination",
        http_method: "PUT",
        request_uri: "/destinations/{Name}"
      )

      UPDATE_EVENT_LOG_CONFIGURATION = OperationModel.new(
        name: "UpdateEventLogConfiguration",
        http_method: "PATCH",
        request_uri: "/event-log-configurations/{Id}"
      )

      UPDATE_MANAGED_THING = OperationModel.new(
        name: "UpdateManagedThing",
        http_method: "PUT",
        request_uri: "/managed-things/{Identifier}"
      )

      UPDATE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "UpdateNotificationConfiguration",
        http_method: "PUT",
        request_uri: "/notification-configurations/{EventType}"
      )

      UPDATE_OTA_TASK = OperationModel.new(
        name: "UpdateOtaTask",
        http_method: "PUT",
        request_uri: "/ota-tasks/{Identifier}"
      )
    end
  end
end
