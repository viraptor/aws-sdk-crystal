module Aws
  module IoTWireless
    module Model
      API_VERSION = "2020-11-22"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotwireless"
      ENDPOINT_PREFIX = "api.iotwireless"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotwireless-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotwireless-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotwireless.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.iotwireless.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_AWS_ACCOUNT_WITH_PARTNER_ACCOUNT = OperationModel.new(
        name: "AssociateAwsAccountWithPartnerAccount",
        http_method: "POST",
        request_uri: "/partner-accounts"
      )

      ASSOCIATE_MULTICAST_GROUP_WITH_FUOTA_TASK = OperationModel.new(
        name: "AssociateMulticastGroupWithFuotaTask",
        http_method: "PUT",
        request_uri: "/fuota-tasks/{Id}/multicast-group"
      )

      ASSOCIATE_WIRELESS_DEVICE_WITH_FUOTA_TASK = OperationModel.new(
        name: "AssociateWirelessDeviceWithFuotaTask",
        http_method: "PUT",
        request_uri: "/fuota-tasks/{Id}/wireless-device"
      )

      ASSOCIATE_WIRELESS_DEVICE_WITH_MULTICAST_GROUP = OperationModel.new(
        name: "AssociateWirelessDeviceWithMulticastGroup",
        http_method: "PUT",
        request_uri: "/multicast-groups/{Id}/wireless-device"
      )

      ASSOCIATE_WIRELESS_DEVICE_WITH_THING = OperationModel.new(
        name: "AssociateWirelessDeviceWithThing",
        http_method: "PUT",
        request_uri: "/wireless-devices/{Id}/thing"
      )

      ASSOCIATE_WIRELESS_GATEWAY_WITH_CERTIFICATE = OperationModel.new(
        name: "AssociateWirelessGatewayWithCertificate",
        http_method: "PUT",
        request_uri: "/wireless-gateways/{Id}/certificate"
      )

      ASSOCIATE_WIRELESS_GATEWAY_WITH_THING = OperationModel.new(
        name: "AssociateWirelessGatewayWithThing",
        http_method: "PUT",
        request_uri: "/wireless-gateways/{Id}/thing"
      )

      CANCEL_MULTICAST_GROUP_SESSION = OperationModel.new(
        name: "CancelMulticastGroupSession",
        http_method: "DELETE",
        request_uri: "/multicast-groups/{Id}/session"
      )

      CREATE_DESTINATION = OperationModel.new(
        name: "CreateDestination",
        http_method: "POST",
        request_uri: "/destinations"
      )

      CREATE_DEVICE_PROFILE = OperationModel.new(
        name: "CreateDeviceProfile",
        http_method: "POST",
        request_uri: "/device-profiles"
      )

      CREATE_FUOTA_TASK = OperationModel.new(
        name: "CreateFuotaTask",
        http_method: "POST",
        request_uri: "/fuota-tasks"
      )

      CREATE_MULTICAST_GROUP = OperationModel.new(
        name: "CreateMulticastGroup",
        http_method: "POST",
        request_uri: "/multicast-groups"
      )

      CREATE_NETWORK_ANALYZER_CONFIGURATION = OperationModel.new(
        name: "CreateNetworkAnalyzerConfiguration",
        http_method: "POST",
        request_uri: "/network-analyzer-configurations"
      )

      CREATE_SERVICE_PROFILE = OperationModel.new(
        name: "CreateServiceProfile",
        http_method: "POST",
        request_uri: "/service-profiles"
      )

      CREATE_WIRELESS_DEVICE = OperationModel.new(
        name: "CreateWirelessDevice",
        http_method: "POST",
        request_uri: "/wireless-devices"
      )

      CREATE_WIRELESS_GATEWAY = OperationModel.new(
        name: "CreateWirelessGateway",
        http_method: "POST",
        request_uri: "/wireless-gateways"
      )

      CREATE_WIRELESS_GATEWAY_TASK = OperationModel.new(
        name: "CreateWirelessGatewayTask",
        http_method: "POST",
        request_uri: "/wireless-gateways/{Id}/tasks"
      )

      CREATE_WIRELESS_GATEWAY_TASK_DEFINITION = OperationModel.new(
        name: "CreateWirelessGatewayTaskDefinition",
        http_method: "POST",
        request_uri: "/wireless-gateway-task-definitions"
      )

      DELETE_DESTINATION = OperationModel.new(
        name: "DeleteDestination",
        http_method: "DELETE",
        request_uri: "/destinations/{Name}"
      )

      DELETE_DEVICE_PROFILE = OperationModel.new(
        name: "DeleteDeviceProfile",
        http_method: "DELETE",
        request_uri: "/device-profiles/{Id}"
      )

      DELETE_FUOTA_TASK = OperationModel.new(
        name: "DeleteFuotaTask",
        http_method: "DELETE",
        request_uri: "/fuota-tasks/{Id}"
      )

      DELETE_MULTICAST_GROUP = OperationModel.new(
        name: "DeleteMulticastGroup",
        http_method: "DELETE",
        request_uri: "/multicast-groups/{Id}"
      )

      DELETE_NETWORK_ANALYZER_CONFIGURATION = OperationModel.new(
        name: "DeleteNetworkAnalyzerConfiguration",
        http_method: "DELETE",
        request_uri: "/network-analyzer-configurations/{ConfigurationName}"
      )

      DELETE_QUEUED_MESSAGES = OperationModel.new(
        name: "DeleteQueuedMessages",
        http_method: "DELETE",
        request_uri: "/wireless-devices/{Id}/data"
      )

      DELETE_SERVICE_PROFILE = OperationModel.new(
        name: "DeleteServiceProfile",
        http_method: "DELETE",
        request_uri: "/service-profiles/{Id}"
      )

      DELETE_WIRELESS_DEVICE = OperationModel.new(
        name: "DeleteWirelessDevice",
        http_method: "DELETE",
        request_uri: "/wireless-devices/{Id}"
      )

      DELETE_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "DeleteWirelessDeviceImportTask",
        http_method: "DELETE",
        request_uri: "/wireless_device_import_task/{Id}"
      )

      DELETE_WIRELESS_GATEWAY = OperationModel.new(
        name: "DeleteWirelessGateway",
        http_method: "DELETE",
        request_uri: "/wireless-gateways/{Id}"
      )

      DELETE_WIRELESS_GATEWAY_TASK = OperationModel.new(
        name: "DeleteWirelessGatewayTask",
        http_method: "DELETE",
        request_uri: "/wireless-gateways/{Id}/tasks"
      )

      DELETE_WIRELESS_GATEWAY_TASK_DEFINITION = OperationModel.new(
        name: "DeleteWirelessGatewayTaskDefinition",
        http_method: "DELETE",
        request_uri: "/wireless-gateway-task-definitions/{Id}"
      )

      DEREGISTER_WIRELESS_DEVICE = OperationModel.new(
        name: "DeregisterWirelessDevice",
        http_method: "PATCH",
        request_uri: "/wireless-devices/{Identifier}/deregister"
      )

      DISASSOCIATE_AWS_ACCOUNT_FROM_PARTNER_ACCOUNT = OperationModel.new(
        name: "DisassociateAwsAccountFromPartnerAccount",
        http_method: "DELETE",
        request_uri: "/partner-accounts/{PartnerAccountId}"
      )

      DISASSOCIATE_MULTICAST_GROUP_FROM_FUOTA_TASK = OperationModel.new(
        name: "DisassociateMulticastGroupFromFuotaTask",
        http_method: "DELETE",
        request_uri: "/fuota-tasks/{Id}/multicast-groups/{MulticastGroupId}"
      )

      DISASSOCIATE_WIRELESS_DEVICE_FROM_FUOTA_TASK = OperationModel.new(
        name: "DisassociateWirelessDeviceFromFuotaTask",
        http_method: "DELETE",
        request_uri: "/fuota-tasks/{Id}/wireless-devices/{WirelessDeviceId}"
      )

      DISASSOCIATE_WIRELESS_DEVICE_FROM_MULTICAST_GROUP = OperationModel.new(
        name: "DisassociateWirelessDeviceFromMulticastGroup",
        http_method: "DELETE",
        request_uri: "/multicast-groups/{Id}/wireless-devices/{WirelessDeviceId}"
      )

      DISASSOCIATE_WIRELESS_DEVICE_FROM_THING = OperationModel.new(
        name: "DisassociateWirelessDeviceFromThing",
        http_method: "DELETE",
        request_uri: "/wireless-devices/{Id}/thing"
      )

      DISASSOCIATE_WIRELESS_GATEWAY_FROM_CERTIFICATE = OperationModel.new(
        name: "DisassociateWirelessGatewayFromCertificate",
        http_method: "DELETE",
        request_uri: "/wireless-gateways/{Id}/certificate"
      )

      DISASSOCIATE_WIRELESS_GATEWAY_FROM_THING = OperationModel.new(
        name: "DisassociateWirelessGatewayFromThing",
        http_method: "DELETE",
        request_uri: "/wireless-gateways/{Id}/thing"
      )

      GET_DESTINATION = OperationModel.new(
        name: "GetDestination",
        http_method: "GET",
        request_uri: "/destinations/{Name}"
      )

      GET_DEVICE_PROFILE = OperationModel.new(
        name: "GetDeviceProfile",
        http_method: "GET",
        request_uri: "/device-profiles/{Id}"
      )

      GET_EVENT_CONFIGURATION_BY_RESOURCE_TYPES = OperationModel.new(
        name: "GetEventConfigurationByResourceTypes",
        http_method: "GET",
        request_uri: "/event-configurations-resource-types"
      )

      GET_FUOTA_TASK = OperationModel.new(
        name: "GetFuotaTask",
        http_method: "GET",
        request_uri: "/fuota-tasks/{Id}"
      )

      GET_LOG_LEVELS_BY_RESOURCE_TYPES = OperationModel.new(
        name: "GetLogLevelsByResourceTypes",
        http_method: "GET",
        request_uri: "/log-levels"
      )

      GET_METRIC_CONFIGURATION = OperationModel.new(
        name: "GetMetricConfiguration",
        http_method: "GET",
        request_uri: "/metric-configuration"
      )

      GET_METRICS = OperationModel.new(
        name: "GetMetrics",
        http_method: "POST",
        request_uri: "/metrics"
      )

      GET_MULTICAST_GROUP = OperationModel.new(
        name: "GetMulticastGroup",
        http_method: "GET",
        request_uri: "/multicast-groups/{Id}"
      )

      GET_MULTICAST_GROUP_SESSION = OperationModel.new(
        name: "GetMulticastGroupSession",
        http_method: "GET",
        request_uri: "/multicast-groups/{Id}/session"
      )

      GET_NETWORK_ANALYZER_CONFIGURATION = OperationModel.new(
        name: "GetNetworkAnalyzerConfiguration",
        http_method: "GET",
        request_uri: "/network-analyzer-configurations/{ConfigurationName}"
      )

      GET_PARTNER_ACCOUNT = OperationModel.new(
        name: "GetPartnerAccount",
        http_method: "GET",
        request_uri: "/partner-accounts/{PartnerAccountId}"
      )

      GET_POSITION = OperationModel.new(
        name: "GetPosition",
        http_method: "GET",
        request_uri: "/positions/{ResourceIdentifier}"
      )

      GET_POSITION_CONFIGURATION = OperationModel.new(
        name: "GetPositionConfiguration",
        http_method: "GET",
        request_uri: "/position-configurations/{ResourceIdentifier}"
      )

      GET_POSITION_ESTIMATE = OperationModel.new(
        name: "GetPositionEstimate",
        http_method: "POST",
        request_uri: "/position-estimate"
      )

      GET_RESOURCE_EVENT_CONFIGURATION = OperationModel.new(
        name: "GetResourceEventConfiguration",
        http_method: "GET",
        request_uri: "/event-configurations/{Identifier}"
      )

      GET_RESOURCE_LOG_LEVEL = OperationModel.new(
        name: "GetResourceLogLevel",
        http_method: "GET",
        request_uri: "/log-levels/{ResourceIdentifier}"
      )

      GET_RESOURCE_POSITION = OperationModel.new(
        name: "GetResourcePosition",
        http_method: "GET",
        request_uri: "/resource-positions/{ResourceIdentifier}"
      )

      GET_SERVICE_ENDPOINT = OperationModel.new(
        name: "GetServiceEndpoint",
        http_method: "GET",
        request_uri: "/service-endpoint"
      )

      GET_SERVICE_PROFILE = OperationModel.new(
        name: "GetServiceProfile",
        http_method: "GET",
        request_uri: "/service-profiles/{Id}"
      )

      GET_WIRELESS_DEVICE = OperationModel.new(
        name: "GetWirelessDevice",
        http_method: "GET",
        request_uri: "/wireless-devices/{Identifier}"
      )

      GET_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "GetWirelessDeviceImportTask",
        http_method: "GET",
        request_uri: "/wireless_device_import_task/{Id}"
      )

      GET_WIRELESS_DEVICE_STATISTICS = OperationModel.new(
        name: "GetWirelessDeviceStatistics",
        http_method: "GET",
        request_uri: "/wireless-devices/{Id}/statistics"
      )

      GET_WIRELESS_GATEWAY = OperationModel.new(
        name: "GetWirelessGateway",
        http_method: "GET",
        request_uri: "/wireless-gateways/{Identifier}"
      )

      GET_WIRELESS_GATEWAY_CERTIFICATE = OperationModel.new(
        name: "GetWirelessGatewayCertificate",
        http_method: "GET",
        request_uri: "/wireless-gateways/{Id}/certificate"
      )

      GET_WIRELESS_GATEWAY_FIRMWARE_INFORMATION = OperationModel.new(
        name: "GetWirelessGatewayFirmwareInformation",
        http_method: "GET",
        request_uri: "/wireless-gateways/{Id}/firmware-information"
      )

      GET_WIRELESS_GATEWAY_STATISTICS = OperationModel.new(
        name: "GetWirelessGatewayStatistics",
        http_method: "GET",
        request_uri: "/wireless-gateways/{Id}/statistics"
      )

      GET_WIRELESS_GATEWAY_TASK = OperationModel.new(
        name: "GetWirelessGatewayTask",
        http_method: "GET",
        request_uri: "/wireless-gateways/{Id}/tasks"
      )

      GET_WIRELESS_GATEWAY_TASK_DEFINITION = OperationModel.new(
        name: "GetWirelessGatewayTaskDefinition",
        http_method: "GET",
        request_uri: "/wireless-gateway-task-definitions/{Id}"
      )

      LIST_DESTINATIONS = OperationModel.new(
        name: "ListDestinations",
        http_method: "GET",
        request_uri: "/destinations"
      )

      LIST_DEVICE_PROFILES = OperationModel.new(
        name: "ListDeviceProfiles",
        http_method: "GET",
        request_uri: "/device-profiles"
      )

      LIST_DEVICES_FOR_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "ListDevicesForWirelessDeviceImportTask",
        http_method: "GET",
        request_uri: "/wireless_device_import_task"
      )

      LIST_EVENT_CONFIGURATIONS = OperationModel.new(
        name: "ListEventConfigurations",
        http_method: "GET",
        request_uri: "/event-configurations"
      )

      LIST_FUOTA_TASKS = OperationModel.new(
        name: "ListFuotaTasks",
        http_method: "GET",
        request_uri: "/fuota-tasks"
      )

      LIST_MULTICAST_GROUPS = OperationModel.new(
        name: "ListMulticastGroups",
        http_method: "GET",
        request_uri: "/multicast-groups"
      )

      LIST_MULTICAST_GROUPS_BY_FUOTA_TASK = OperationModel.new(
        name: "ListMulticastGroupsByFuotaTask",
        http_method: "GET",
        request_uri: "/fuota-tasks/{Id}/multicast-groups"
      )

      LIST_NETWORK_ANALYZER_CONFIGURATIONS = OperationModel.new(
        name: "ListNetworkAnalyzerConfigurations",
        http_method: "GET",
        request_uri: "/network-analyzer-configurations"
      )

      LIST_PARTNER_ACCOUNTS = OperationModel.new(
        name: "ListPartnerAccounts",
        http_method: "GET",
        request_uri: "/partner-accounts"
      )

      LIST_POSITION_CONFIGURATIONS = OperationModel.new(
        name: "ListPositionConfigurations",
        http_method: "GET",
        request_uri: "/position-configurations"
      )

      LIST_QUEUED_MESSAGES = OperationModel.new(
        name: "ListQueuedMessages",
        http_method: "GET",
        request_uri: "/wireless-devices/{Id}/data"
      )

      LIST_SERVICE_PROFILES = OperationModel.new(
        name: "ListServiceProfiles",
        http_method: "GET",
        request_uri: "/service-profiles"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      LIST_WIRELESS_DEVICE_IMPORT_TASKS = OperationModel.new(
        name: "ListWirelessDeviceImportTasks",
        http_method: "GET",
        request_uri: "/wireless_device_import_tasks"
      )

      LIST_WIRELESS_DEVICES = OperationModel.new(
        name: "ListWirelessDevices",
        http_method: "GET",
        request_uri: "/wireless-devices"
      )

      LIST_WIRELESS_GATEWAY_TASK_DEFINITIONS = OperationModel.new(
        name: "ListWirelessGatewayTaskDefinitions",
        http_method: "GET",
        request_uri: "/wireless-gateway-task-definitions"
      )

      LIST_WIRELESS_GATEWAYS = OperationModel.new(
        name: "ListWirelessGateways",
        http_method: "GET",
        request_uri: "/wireless-gateways"
      )

      PUT_POSITION_CONFIGURATION = OperationModel.new(
        name: "PutPositionConfiguration",
        http_method: "PUT",
        request_uri: "/position-configurations/{ResourceIdentifier}"
      )

      PUT_RESOURCE_LOG_LEVEL = OperationModel.new(
        name: "PutResourceLogLevel",
        http_method: "PUT",
        request_uri: "/log-levels/{ResourceIdentifier}"
      )

      RESET_ALL_RESOURCE_LOG_LEVELS = OperationModel.new(
        name: "ResetAllResourceLogLevels",
        http_method: "DELETE",
        request_uri: "/log-levels"
      )

      RESET_RESOURCE_LOG_LEVEL = OperationModel.new(
        name: "ResetResourceLogLevel",
        http_method: "DELETE",
        request_uri: "/log-levels/{ResourceIdentifier}"
      )

      SEND_DATA_TO_MULTICAST_GROUP = OperationModel.new(
        name: "SendDataToMulticastGroup",
        http_method: "POST",
        request_uri: "/multicast-groups/{Id}/data"
      )

      SEND_DATA_TO_WIRELESS_DEVICE = OperationModel.new(
        name: "SendDataToWirelessDevice",
        http_method: "POST",
        request_uri: "/wireless-devices/{Id}/data"
      )

      START_BULK_ASSOCIATE_WIRELESS_DEVICE_WITH_MULTICAST_GROUP = OperationModel.new(
        name: "StartBulkAssociateWirelessDeviceWithMulticastGroup",
        http_method: "PATCH",
        request_uri: "/multicast-groups/{Id}/bulk"
      )

      START_BULK_DISASSOCIATE_WIRELESS_DEVICE_FROM_MULTICAST_GROUP = OperationModel.new(
        name: "StartBulkDisassociateWirelessDeviceFromMulticastGroup",
        http_method: "POST",
        request_uri: "/multicast-groups/{Id}/bulk"
      )

      START_FUOTA_TASK = OperationModel.new(
        name: "StartFuotaTask",
        http_method: "PUT",
        request_uri: "/fuota-tasks/{Id}"
      )

      START_MULTICAST_GROUP_SESSION = OperationModel.new(
        name: "StartMulticastGroupSession",
        http_method: "PUT",
        request_uri: "/multicast-groups/{Id}/session"
      )

      START_SINGLE_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "StartSingleWirelessDeviceImportTask",
        http_method: "POST",
        request_uri: "/wireless_single_device_import_task"
      )

      START_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "StartWirelessDeviceImportTask",
        http_method: "POST",
        request_uri: "/wireless_device_import_task"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags"
      )

      TEST_WIRELESS_DEVICE = OperationModel.new(
        name: "TestWirelessDevice",
        http_method: "POST",
        request_uri: "/wireless-devices/{Id}/test"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags"
      )

      UPDATE_DESTINATION = OperationModel.new(
        name: "UpdateDestination",
        http_method: "PATCH",
        request_uri: "/destinations/{Name}"
      )

      UPDATE_EVENT_CONFIGURATION_BY_RESOURCE_TYPES = OperationModel.new(
        name: "UpdateEventConfigurationByResourceTypes",
        http_method: "PATCH",
        request_uri: "/event-configurations-resource-types"
      )

      UPDATE_FUOTA_TASK = OperationModel.new(
        name: "UpdateFuotaTask",
        http_method: "PATCH",
        request_uri: "/fuota-tasks/{Id}"
      )

      UPDATE_LOG_LEVELS_BY_RESOURCE_TYPES = OperationModel.new(
        name: "UpdateLogLevelsByResourceTypes",
        http_method: "POST",
        request_uri: "/log-levels"
      )

      UPDATE_METRIC_CONFIGURATION = OperationModel.new(
        name: "UpdateMetricConfiguration",
        http_method: "PUT",
        request_uri: "/metric-configuration"
      )

      UPDATE_MULTICAST_GROUP = OperationModel.new(
        name: "UpdateMulticastGroup",
        http_method: "PATCH",
        request_uri: "/multicast-groups/{Id}"
      )

      UPDATE_NETWORK_ANALYZER_CONFIGURATION = OperationModel.new(
        name: "UpdateNetworkAnalyzerConfiguration",
        http_method: "PATCH",
        request_uri: "/network-analyzer-configurations/{ConfigurationName}"
      )

      UPDATE_PARTNER_ACCOUNT = OperationModel.new(
        name: "UpdatePartnerAccount",
        http_method: "PATCH",
        request_uri: "/partner-accounts/{PartnerAccountId}"
      )

      UPDATE_POSITION = OperationModel.new(
        name: "UpdatePosition",
        http_method: "PATCH",
        request_uri: "/positions/{ResourceIdentifier}"
      )

      UPDATE_RESOURCE_EVENT_CONFIGURATION = OperationModel.new(
        name: "UpdateResourceEventConfiguration",
        http_method: "PATCH",
        request_uri: "/event-configurations/{Identifier}"
      )

      UPDATE_RESOURCE_POSITION = OperationModel.new(
        name: "UpdateResourcePosition",
        http_method: "PATCH",
        request_uri: "/resource-positions/{ResourceIdentifier}"
      )

      UPDATE_WIRELESS_DEVICE = OperationModel.new(
        name: "UpdateWirelessDevice",
        http_method: "PATCH",
        request_uri: "/wireless-devices/{Id}"
      )

      UPDATE_WIRELESS_DEVICE_IMPORT_TASK = OperationModel.new(
        name: "UpdateWirelessDeviceImportTask",
        http_method: "PATCH",
        request_uri: "/wireless_device_import_task/{Id}"
      )

      UPDATE_WIRELESS_GATEWAY = OperationModel.new(
        name: "UpdateWirelessGateway",
        http_method: "PATCH",
        request_uri: "/wireless-gateways/{Id}"
      )
    end
  end
end
