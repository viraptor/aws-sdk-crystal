module AwsSdk
  module Proton
    module Model
      API_VERSION = "2020-07-20"
      TARGET_PREFIX = "AwsProton20200720"
      SIGNING_NAME = "proton"
      ENDPOINT_PREFIX = "proton"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://proton-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://proton-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://proton.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://proton.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "AcceptEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_COMPONENT_DEPLOYMENT = OperationModel.new(
        name: "CancelComponentDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_ENVIRONMENT_DEPLOYMENT = OperationModel.new(
        name: "CancelEnvironmentDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_SERVICE_INSTANCE_DEPLOYMENT = OperationModel.new(
        name: "CancelServiceInstanceDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_SERVICE_PIPELINE_DEPLOYMENT = OperationModel.new(
        name: "CancelServicePipelineDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMPONENT = OperationModel.new(
        name: "CreateComponent",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "CreateEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENVIRONMENT_TEMPLATE = OperationModel.new(
        name: "CreateEnvironmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENVIRONMENT_TEMPLATE_VERSION = OperationModel.new(
        name: "CreateEnvironmentTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY = OperationModel.new(
        name: "CreateRepository",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_INSTANCE = OperationModel.new(
        name: "CreateServiceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_SYNC_CONFIG = OperationModel.new(
        name: "CreateServiceSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_TEMPLATE = OperationModel.new(
        name: "CreateServiceTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_TEMPLATE_VERSION = OperationModel.new(
        name: "CreateServiceTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TEMPLATE_SYNC_CONFIG = OperationModel.new(
        name: "CreateTemplateSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COMPONENT = OperationModel.new(
        name: "DeleteComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEPLOYMENT = OperationModel.new(
        name: "DeleteDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "DeleteEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENVIRONMENT_TEMPLATE = OperationModel.new(
        name: "DeleteEnvironmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENVIRONMENT_TEMPLATE_VERSION = OperationModel.new(
        name: "DeleteEnvironmentTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY = OperationModel.new(
        name: "DeleteRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_SYNC_CONFIG = OperationModel.new(
        name: "DeleteServiceSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_TEMPLATE = OperationModel.new(
        name: "DeleteServiceTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_TEMPLATE_VERSION = OperationModel.new(
        name: "DeleteServiceTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TEMPLATE_SYNC_CONFIG = OperationModel.new(
        name: "DeleteTemplateSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPONENT = OperationModel.new(
        name: "GetComponent",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "GetEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENVIRONMENT_TEMPLATE = OperationModel.new(
        name: "GetEnvironmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENVIRONMENT_TEMPLATE_VERSION = OperationModel.new(
        name: "GetEnvironmentTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY = OperationModel.new(
        name: "GetRepository",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_SYNC_STATUS = OperationModel.new(
        name: "GetRepositorySyncStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCES_SUMMARY = OperationModel.new(
        name: "GetResourcesSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE = OperationModel.new(
        name: "GetService",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_INSTANCE = OperationModel.new(
        name: "GetServiceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_INSTANCE_SYNC_STATUS = OperationModel.new(
        name: "GetServiceInstanceSyncStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_SYNC_BLOCKER_SUMMARY = OperationModel.new(
        name: "GetServiceSyncBlockerSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_SYNC_CONFIG = OperationModel.new(
        name: "GetServiceSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_TEMPLATE = OperationModel.new(
        name: "GetServiceTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_TEMPLATE_VERSION = OperationModel.new(
        name: "GetServiceTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEMPLATE_SYNC_CONFIG = OperationModel.new(
        name: "GetTemplateSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEMPLATE_SYNC_STATUS = OperationModel.new(
        name: "GetTemplateSyncStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPONENT_OUTPUTS = OperationModel.new(
        name: "ListComponentOutputs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPONENT_PROVISIONED_RESOURCES = OperationModel.new(
        name: "ListComponentProvisionedResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENTS = OperationModel.new(
        name: "ListDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENT_ACCOUNT_CONNECTIONS = OperationModel.new(
        name: "ListEnvironmentAccountConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENT_OUTPUTS = OperationModel.new(
        name: "ListEnvironmentOutputs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENT_PROVISIONED_RESOURCES = OperationModel.new(
        name: "ListEnvironmentProvisionedResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENT_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListEnvironmentTemplateVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENT_TEMPLATES = OperationModel.new(
        name: "ListEnvironmentTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORIES = OperationModel.new(
        name: "ListRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORY_SYNC_DEFINITIONS = OperationModel.new(
        name: "ListRepositorySyncDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_INSTANCE_OUTPUTS = OperationModel.new(
        name: "ListServiceInstanceOutputs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_INSTANCE_PROVISIONED_RESOURCES = OperationModel.new(
        name: "ListServiceInstanceProvisionedResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_INSTANCES = OperationModel.new(
        name: "ListServiceInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_PIPELINE_OUTPUTS = OperationModel.new(
        name: "ListServicePipelineOutputs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_PIPELINE_PROVISIONED_RESOURCES = OperationModel.new(
        name: "ListServicePipelineProvisionedResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListServiceTemplateVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_TEMPLATES = OperationModel.new(
        name: "ListServiceTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_RESOURCE_DEPLOYMENT_STATUS_CHANGE = OperationModel.new(
        name: "NotifyResourceDeploymentStatusChange",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "RejectEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COMPONENT = OperationModel.new(
        name: "UpdateComponent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENVIRONMENT_ACCOUNT_CONNECTION = OperationModel.new(
        name: "UpdateEnvironmentAccountConnection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENVIRONMENT_TEMPLATE = OperationModel.new(
        name: "UpdateEnvironmentTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENVIRONMENT_TEMPLATE_VERSION = OperationModel.new(
        name: "UpdateEnvironmentTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE = OperationModel.new(
        name: "UpdateService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_INSTANCE = OperationModel.new(
        name: "UpdateServiceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_PIPELINE = OperationModel.new(
        name: "UpdateServicePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_SYNC_BLOCKER = OperationModel.new(
        name: "UpdateServiceSyncBlocker",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_SYNC_CONFIG = OperationModel.new(
        name: "UpdateServiceSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_TEMPLATE = OperationModel.new(
        name: "UpdateServiceTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_TEMPLATE_VERSION = OperationModel.new(
        name: "UpdateServiceTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TEMPLATE_SYNC_CONFIG = OperationModel.new(
        name: "UpdateTemplateSyncConfig",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
