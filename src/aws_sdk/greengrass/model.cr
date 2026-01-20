module AwsSdk
  module Greengrass
    module Model
      API_VERSION = "2017-06-07"
      TARGET_PREFIX = ""
      SIGNING_NAME = "greengrass"
      ENDPOINT_PREFIX = "greengrass"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://greengrass-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://greengrass.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://greengrass.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://greengrass-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://greengrass.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"dataplane-us-gov-east-1"]}],"endpoint":{"url":"https://greengrass-ats.iot.us-gov-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"greengrass","signingRegion":"us-gov-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"dataplane-us-gov-west-1"]}],"endpoint":{"url":"https://greengrass-ats.iot.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"greengrass","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://greengrass.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ROLE_TO_GROUP = OperationModel.new(
        name: "AssociateRoleToGroup",
        http_method: "PUT",
        request_uri: "/greengrass/groups/{GroupId}/role"
      )

      ASSOCIATE_SERVICE_ROLE_TO_ACCOUNT = OperationModel.new(
        name: "AssociateServiceRoleToAccount",
        http_method: "PUT",
        request_uri: "/greengrass/servicerole"
      )

      CREATE_CONNECTOR_DEFINITION = OperationModel.new(
        name: "CreateConnectorDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/connectors"
      )

      CREATE_CONNECTOR_DEFINITION_VERSION = OperationModel.new(
        name: "CreateConnectorDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}/versions"
      )

      CREATE_CORE_DEFINITION = OperationModel.new(
        name: "CreateCoreDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/cores"
      )

      CREATE_CORE_DEFINITION_VERSION = OperationModel.new(
        name: "CreateCoreDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}/versions"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/greengrass/groups/{GroupId}/deployments"
      )

      CREATE_DEVICE_DEFINITION = OperationModel.new(
        name: "CreateDeviceDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/devices"
      )

      CREATE_DEVICE_DEFINITION_VERSION = OperationModel.new(
        name: "CreateDeviceDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}/versions"
      )

      CREATE_FUNCTION_DEFINITION = OperationModel.new(
        name: "CreateFunctionDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/functions"
      )

      CREATE_FUNCTION_DEFINITION_VERSION = OperationModel.new(
        name: "CreateFunctionDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}/versions"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/greengrass/groups"
      )

      CREATE_GROUP_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "CreateGroupCertificateAuthority",
        http_method: "POST",
        request_uri: "/greengrass/groups/{GroupId}/certificateauthorities"
      )

      CREATE_GROUP_VERSION = OperationModel.new(
        name: "CreateGroupVersion",
        http_method: "POST",
        request_uri: "/greengrass/groups/{GroupId}/versions"
      )

      CREATE_LOGGER_DEFINITION = OperationModel.new(
        name: "CreateLoggerDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/loggers"
      )

      CREATE_LOGGER_DEFINITION_VERSION = OperationModel.new(
        name: "CreateLoggerDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}/versions"
      )

      CREATE_RESOURCE_DEFINITION = OperationModel.new(
        name: "CreateResourceDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/resources"
      )

      CREATE_RESOURCE_DEFINITION_VERSION = OperationModel.new(
        name: "CreateResourceDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}/versions"
      )

      CREATE_SOFTWARE_UPDATE_JOB = OperationModel.new(
        name: "CreateSoftwareUpdateJob",
        http_method: "POST",
        request_uri: "/greengrass/updates"
      )

      CREATE_SUBSCRIPTION_DEFINITION = OperationModel.new(
        name: "CreateSubscriptionDefinition",
        http_method: "POST",
        request_uri: "/greengrass/definition/subscriptions"
      )

      CREATE_SUBSCRIPTION_DEFINITION_VERSION = OperationModel.new(
        name: "CreateSubscriptionDefinitionVersion",
        http_method: "POST",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}/versions"
      )

      DELETE_CONNECTOR_DEFINITION = OperationModel.new(
        name: "DeleteConnectorDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}"
      )

      DELETE_CORE_DEFINITION = OperationModel.new(
        name: "DeleteCoreDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}"
      )

      DELETE_DEVICE_DEFINITION = OperationModel.new(
        name: "DeleteDeviceDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}"
      )

      DELETE_FUNCTION_DEFINITION = OperationModel.new(
        name: "DeleteFunctionDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "DELETE",
        request_uri: "/greengrass/groups/{GroupId}"
      )

      DELETE_LOGGER_DEFINITION = OperationModel.new(
        name: "DeleteLoggerDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}"
      )

      DELETE_RESOURCE_DEFINITION = OperationModel.new(
        name: "DeleteResourceDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}"
      )

      DELETE_SUBSCRIPTION_DEFINITION = OperationModel.new(
        name: "DeleteSubscriptionDefinition",
        http_method: "DELETE",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}"
      )

      DISASSOCIATE_ROLE_FROM_GROUP = OperationModel.new(
        name: "DisassociateRoleFromGroup",
        http_method: "DELETE",
        request_uri: "/greengrass/groups/{GroupId}/role"
      )

      DISASSOCIATE_SERVICE_ROLE_FROM_ACCOUNT = OperationModel.new(
        name: "DisassociateServiceRoleFromAccount",
        http_method: "DELETE",
        request_uri: "/greengrass/servicerole"
      )

      GET_ASSOCIATED_ROLE = OperationModel.new(
        name: "GetAssociatedRole",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/role"
      )

      GET_BULK_DEPLOYMENT_STATUS = OperationModel.new(
        name: "GetBulkDeploymentStatus",
        http_method: "GET",
        request_uri: "/greengrass/bulk/deployments/{BulkDeploymentId}/status"
      )

      GET_CONNECTIVITY_INFO = OperationModel.new(
        name: "GetConnectivityInfo",
        http_method: "GET",
        request_uri: "/greengrass/things/{ThingName}/connectivityInfo"
      )

      GET_CONNECTOR_DEFINITION = OperationModel.new(
        name: "GetConnectorDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}"
      )

      GET_CONNECTOR_DEFINITION_VERSION = OperationModel.new(
        name: "GetConnectorDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}/versions/{ConnectorDefinitionVersionId}"
      )

      GET_CORE_DEFINITION = OperationModel.new(
        name: "GetCoreDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}"
      )

      GET_CORE_DEFINITION_VERSION = OperationModel.new(
        name: "GetCoreDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}/versions/{CoreDefinitionVersionId}"
      )

      GET_DEPLOYMENT_STATUS = OperationModel.new(
        name: "GetDeploymentStatus",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/deployments/{DeploymentId}/status"
      )

      GET_DEVICE_DEFINITION = OperationModel.new(
        name: "GetDeviceDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}"
      )

      GET_DEVICE_DEFINITION_VERSION = OperationModel.new(
        name: "GetDeviceDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}/versions/{DeviceDefinitionVersionId}"
      )

      GET_FUNCTION_DEFINITION = OperationModel.new(
        name: "GetFunctionDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}"
      )

      GET_FUNCTION_DEFINITION_VERSION = OperationModel.new(
        name: "GetFunctionDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}/versions/{FunctionDefinitionVersionId}"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}"
      )

      GET_GROUP_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "GetGroupCertificateAuthority",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/certificateauthorities/{CertificateAuthorityId}"
      )

      GET_GROUP_CERTIFICATE_CONFIGURATION = OperationModel.new(
        name: "GetGroupCertificateConfiguration",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/certificateauthorities/configuration/expiry"
      )

      GET_GROUP_VERSION = OperationModel.new(
        name: "GetGroupVersion",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/versions/{GroupVersionId}"
      )

      GET_LOGGER_DEFINITION = OperationModel.new(
        name: "GetLoggerDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}"
      )

      GET_LOGGER_DEFINITION_VERSION = OperationModel.new(
        name: "GetLoggerDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}/versions/{LoggerDefinitionVersionId}"
      )

      GET_RESOURCE_DEFINITION = OperationModel.new(
        name: "GetResourceDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}"
      )

      GET_RESOURCE_DEFINITION_VERSION = OperationModel.new(
        name: "GetResourceDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}/versions/{ResourceDefinitionVersionId}"
      )

      GET_SERVICE_ROLE_FOR_ACCOUNT = OperationModel.new(
        name: "GetServiceRoleForAccount",
        http_method: "GET",
        request_uri: "/greengrass/servicerole"
      )

      GET_SUBSCRIPTION_DEFINITION = OperationModel.new(
        name: "GetSubscriptionDefinition",
        http_method: "GET",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}"
      )

      GET_SUBSCRIPTION_DEFINITION_VERSION = OperationModel.new(
        name: "GetSubscriptionDefinitionVersion",
        http_method: "GET",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}/versions/{SubscriptionDefinitionVersionId}"
      )

      GET_THING_RUNTIME_CONFIGURATION = OperationModel.new(
        name: "GetThingRuntimeConfiguration",
        http_method: "GET",
        request_uri: "/greengrass/things/{ThingName}/runtimeconfig"
      )

      LIST_BULK_DEPLOYMENT_DETAILED_REPORTS = OperationModel.new(
        name: "ListBulkDeploymentDetailedReports",
        http_method: "GET",
        request_uri: "/greengrass/bulk/deployments/{BulkDeploymentId}/detailed-reports"
      )

      LIST_BULK_DEPLOYMENTS = OperationModel.new(
        name: "ListBulkDeployments",
        http_method: "GET",
        request_uri: "/greengrass/bulk/deployments"
      )

      LIST_CONNECTOR_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListConnectorDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}/versions"
      )

      LIST_CONNECTOR_DEFINITIONS = OperationModel.new(
        name: "ListConnectorDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/connectors"
      )

      LIST_CORE_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListCoreDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}/versions"
      )

      LIST_CORE_DEFINITIONS = OperationModel.new(
        name: "ListCoreDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/cores"
      )

      LIST_DEPLOYMENTS = OperationModel.new(
        name: "ListDeployments",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/deployments"
      )

      LIST_DEVICE_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListDeviceDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}/versions"
      )

      LIST_DEVICE_DEFINITIONS = OperationModel.new(
        name: "ListDeviceDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/devices"
      )

      LIST_FUNCTION_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListFunctionDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}/versions"
      )

      LIST_FUNCTION_DEFINITIONS = OperationModel.new(
        name: "ListFunctionDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/functions"
      )

      LIST_GROUP_CERTIFICATE_AUTHORITIES = OperationModel.new(
        name: "ListGroupCertificateAuthorities",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/certificateauthorities"
      )

      LIST_GROUP_VERSIONS = OperationModel.new(
        name: "ListGroupVersions",
        http_method: "GET",
        request_uri: "/greengrass/groups/{GroupId}/versions"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "GET",
        request_uri: "/greengrass/groups"
      )

      LIST_LOGGER_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListLoggerDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}/versions"
      )

      LIST_LOGGER_DEFINITIONS = OperationModel.new(
        name: "ListLoggerDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/loggers"
      )

      LIST_RESOURCE_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListResourceDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}/versions"
      )

      LIST_RESOURCE_DEFINITIONS = OperationModel.new(
        name: "ListResourceDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/resources"
      )

      LIST_SUBSCRIPTION_DEFINITION_VERSIONS = OperationModel.new(
        name: "ListSubscriptionDefinitionVersions",
        http_method: "GET",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}/versions"
      )

      LIST_SUBSCRIPTION_DEFINITIONS = OperationModel.new(
        name: "ListSubscriptionDefinitions",
        http_method: "GET",
        request_uri: "/greengrass/definition/subscriptions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resource-arn}"
      )

      RESET_DEPLOYMENTS = OperationModel.new(
        name: "ResetDeployments",
        http_method: "POST",
        request_uri: "/greengrass/groups/{GroupId}/deployments/$reset"
      )

      START_BULK_DEPLOYMENT = OperationModel.new(
        name: "StartBulkDeployment",
        http_method: "POST",
        request_uri: "/greengrass/bulk/deployments"
      )

      STOP_BULK_DEPLOYMENT = OperationModel.new(
        name: "StopBulkDeployment",
        http_method: "PUT",
        request_uri: "/greengrass/bulk/deployments/{BulkDeploymentId}/$stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource-arn}"
      )

      UPDATE_CONNECTIVITY_INFO = OperationModel.new(
        name: "UpdateConnectivityInfo",
        http_method: "PUT",
        request_uri: "/greengrass/things/{ThingName}/connectivityInfo"
      )

      UPDATE_CONNECTOR_DEFINITION = OperationModel.new(
        name: "UpdateConnectorDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/connectors/{ConnectorDefinitionId}"
      )

      UPDATE_CORE_DEFINITION = OperationModel.new(
        name: "UpdateCoreDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/cores/{CoreDefinitionId}"
      )

      UPDATE_DEVICE_DEFINITION = OperationModel.new(
        name: "UpdateDeviceDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/devices/{DeviceDefinitionId}"
      )

      UPDATE_FUNCTION_DEFINITION = OperationModel.new(
        name: "UpdateFunctionDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/functions/{FunctionDefinitionId}"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "PUT",
        request_uri: "/greengrass/groups/{GroupId}"
      )

      UPDATE_GROUP_CERTIFICATE_CONFIGURATION = OperationModel.new(
        name: "UpdateGroupCertificateConfiguration",
        http_method: "PUT",
        request_uri: "/greengrass/groups/{GroupId}/certificateauthorities/configuration/expiry"
      )

      UPDATE_LOGGER_DEFINITION = OperationModel.new(
        name: "UpdateLoggerDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/loggers/{LoggerDefinitionId}"
      )

      UPDATE_RESOURCE_DEFINITION = OperationModel.new(
        name: "UpdateResourceDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/resources/{ResourceDefinitionId}"
      )

      UPDATE_SUBSCRIPTION_DEFINITION = OperationModel.new(
        name: "UpdateSubscriptionDefinition",
        http_method: "PUT",
        request_uri: "/greengrass/definition/subscriptions/{SubscriptionDefinitionId}"
      )

      UPDATE_THING_RUNTIME_CONFIGURATION = OperationModel.new(
        name: "UpdateThingRuntimeConfiguration",
        http_method: "PUT",
        request_uri: "/greengrass/things/{ThingName}/runtimeconfig"
      )
    end
  end
end
