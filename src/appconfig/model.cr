module Aws
  module AppConfig
    module Model
      API_VERSION = "2019-10-09"
      TARGET_PREFIX = ""
      SIGNING_NAME = "appconfig"
      ENDPOINT_PREFIX = "appconfig"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appconfig-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://appconfig.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://appconfig.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://appconfig-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appconfig.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://appconfig.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/applications"
      )

      CREATE_CONFIGURATION_PROFILE = OperationModel.new(
        name: "CreateConfigurationProfile",
        http_method: "POST",
        request_uri: "/applications/{ApplicationId}/configurationprofiles"
      )

      CREATE_DEPLOYMENT_STRATEGY = OperationModel.new(
        name: "CreateDeploymentStrategy",
        http_method: "POST",
        request_uri: "/deploymentstrategies"
      )

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/applications/{ApplicationId}/environments"
      )

      CREATE_EXTENSION = OperationModel.new(
        name: "CreateExtension",
        http_method: "POST",
        request_uri: "/extensions"
      )

      CREATE_EXTENSION_ASSOCIATION = OperationModel.new(
        name: "CreateExtensionAssociation",
        http_method: "POST",
        request_uri: "/extensionassociations"
      )

      CREATE_HOSTED_CONFIGURATION_VERSION = OperationModel.new(
        name: "CreateHostedConfigurationVersion",
        http_method: "POST",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/applications/{ApplicationId}"
      )

      DELETE_CONFIGURATION_PROFILE = OperationModel.new(
        name: "DeleteConfigurationProfile",
        http_method: "DELETE",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
      )

      DELETE_DEPLOYMENT_STRATEGY = OperationModel.new(
        name: "DeleteDeploymentStrategy",
        http_method: "DELETE",
        request_uri: "/deployementstrategies/{DeploymentStrategyId}"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "DELETE",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}"
      )

      DELETE_EXTENSION = OperationModel.new(
        name: "DeleteExtension",
        http_method: "DELETE",
        request_uri: "/extensions/{ExtensionIdentifier}"
      )

      DELETE_EXTENSION_ASSOCIATION = OperationModel.new(
        name: "DeleteExtensionAssociation",
        http_method: "DELETE",
        request_uri: "/extensionassociations/{ExtensionAssociationId}"
      )

      DELETE_HOSTED_CONFIGURATION_VERSION = OperationModel.new(
        name: "DeleteHostedConfigurationVersion",
        http_method: "DELETE",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "GET",
        request_uri: "/settings"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}"
      )

      GET_CONFIGURATION = OperationModel.new(
        name: "GetConfiguration",
        http_method: "GET",
        request_uri: "/applications/{Application}/environments/{Environment}/configurations/{Configuration}"
      )

      GET_CONFIGURATION_PROFILE = OperationModel.new(
        name: "GetConfigurationProfile",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
      )

      GET_DEPLOYMENT_STRATEGY = OperationModel.new(
        name: "GetDeploymentStrategy",
        http_method: "GET",
        request_uri: "/deploymentstrategies/{DeploymentStrategyId}"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}"
      )

      GET_EXTENSION = OperationModel.new(
        name: "GetExtension",
        http_method: "GET",
        request_uri: "/extensions/{ExtensionIdentifier}"
      )

      GET_EXTENSION_ASSOCIATION = OperationModel.new(
        name: "GetExtensionAssociation",
        http_method: "GET",
        request_uri: "/extensionassociations/{ExtensionAssociationId}"
      )

      GET_HOSTED_CONFIGURATION_VERSION = OperationModel.new(
        name: "GetHostedConfigurationVersion",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/applications"
      )

      LIST_CONFIGURATION_PROFILES = OperationModel.new(
        name: "ListConfigurationProfiles",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/configurationprofiles"
      )

      LIST_DEPLOYMENT_STRATEGIES = OperationModel.new(
        name: "ListDeploymentStrategies",
        http_method: "GET",
        request_uri: "/deploymentstrategies"
      )

      LIST_DEPLOYMENTS = OperationModel.new(
        name: "ListDeployments",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/environments"
      )

      LIST_EXTENSION_ASSOCIATIONS = OperationModel.new(
        name: "ListExtensionAssociations",
        http_method: "GET",
        request_uri: "/extensionassociations"
      )

      LIST_EXTENSIONS = OperationModel.new(
        name: "ListExtensions",
        http_method: "GET",
        request_uri: "/extensions"
      )

      LIST_HOSTED_CONFIGURATION_VERSIONS = OperationModel.new(
        name: "ListHostedConfigurationVersions",
        http_method: "GET",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      START_DEPLOYMENT = OperationModel.new(
        name: "StartDeployment",
        http_method: "POST",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
      )

      STOP_DEPLOYMENT = OperationModel.new(
        name: "StopDeployment",
        http_method: "DELETE",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
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

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "PATCH",
        request_uri: "/settings"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PATCH",
        request_uri: "/applications/{ApplicationId}"
      )

      UPDATE_CONFIGURATION_PROFILE = OperationModel.new(
        name: "UpdateConfigurationProfile",
        http_method: "PATCH",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
      )

      UPDATE_DEPLOYMENT_STRATEGY = OperationModel.new(
        name: "UpdateDeploymentStrategy",
        http_method: "PATCH",
        request_uri: "/deploymentstrategies/{DeploymentStrategyId}"
      )

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "PATCH",
        request_uri: "/applications/{ApplicationId}/environments/{EnvironmentId}"
      )

      UPDATE_EXTENSION = OperationModel.new(
        name: "UpdateExtension",
        http_method: "PATCH",
        request_uri: "/extensions/{ExtensionIdentifier}"
      )

      UPDATE_EXTENSION_ASSOCIATION = OperationModel.new(
        name: "UpdateExtensionAssociation",
        http_method: "PATCH",
        request_uri: "/extensionassociations/{ExtensionAssociationId}"
      )

      VALIDATE_CONFIGURATION = OperationModel.new(
        name: "ValidateConfiguration",
        http_method: "POST",
        request_uri: "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators"
      )
    end
  end
end
