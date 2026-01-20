module AwsSdk
  module PcaConnectorAd
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "pca-connector-ad"
      ENDPOINT_PREFIX = "pca-connector-ad"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://pca-connector-ad-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://pca-connector-ad-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://pca-connector-ad.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://pca-connector-ad.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CONNECTOR = OperationModel.new(
        name: "CreateConnector",
        http_method: "POST",
        request_uri: "/connectors"
      )

      CREATE_DIRECTORY_REGISTRATION = OperationModel.new(
        name: "CreateDirectoryRegistration",
        http_method: "POST",
        request_uri: "/directoryRegistrations"
      )

      CREATE_SERVICE_PRINCIPAL_NAME = OperationModel.new(
        name: "CreateServicePrincipalName",
        http_method: "POST",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}/servicePrincipalNames/{ConnectorArn}"
      )

      CREATE_TEMPLATE = OperationModel.new(
        name: "CreateTemplate",
        http_method: "POST",
        request_uri: "/templates"
      )

      CREATE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY = OperationModel.new(
        name: "CreateTemplateGroupAccessControlEntry",
        http_method: "POST",
        request_uri: "/templates/{TemplateArn}/accessControlEntries"
      )

      DELETE_CONNECTOR = OperationModel.new(
        name: "DeleteConnector",
        http_method: "DELETE",
        request_uri: "/connectors/{ConnectorArn}"
      )

      DELETE_DIRECTORY_REGISTRATION = OperationModel.new(
        name: "DeleteDirectoryRegistration",
        http_method: "DELETE",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}"
      )

      DELETE_SERVICE_PRINCIPAL_NAME = OperationModel.new(
        name: "DeleteServicePrincipalName",
        http_method: "DELETE",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}/servicePrincipalNames/{ConnectorArn}"
      )

      DELETE_TEMPLATE = OperationModel.new(
        name: "DeleteTemplate",
        http_method: "DELETE",
        request_uri: "/templates/{TemplateArn}"
      )

      DELETE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY = OperationModel.new(
        name: "DeleteTemplateGroupAccessControlEntry",
        http_method: "DELETE",
        request_uri: "/templates/{TemplateArn}/accessControlEntries/{GroupSecurityIdentifier}"
      )

      GET_CONNECTOR = OperationModel.new(
        name: "GetConnector",
        http_method: "GET",
        request_uri: "/connectors/{ConnectorArn}"
      )

      GET_DIRECTORY_REGISTRATION = OperationModel.new(
        name: "GetDirectoryRegistration",
        http_method: "GET",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}"
      )

      GET_SERVICE_PRINCIPAL_NAME = OperationModel.new(
        name: "GetServicePrincipalName",
        http_method: "GET",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}/servicePrincipalNames/{ConnectorArn}"
      )

      GET_TEMPLATE = OperationModel.new(
        name: "GetTemplate",
        http_method: "GET",
        request_uri: "/templates/{TemplateArn}"
      )

      GET_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY = OperationModel.new(
        name: "GetTemplateGroupAccessControlEntry",
        http_method: "GET",
        request_uri: "/templates/{TemplateArn}/accessControlEntries/{GroupSecurityIdentifier}"
      )

      LIST_CONNECTORS = OperationModel.new(
        name: "ListConnectors",
        http_method: "GET",
        request_uri: "/connectors"
      )

      LIST_DIRECTORY_REGISTRATIONS = OperationModel.new(
        name: "ListDirectoryRegistrations",
        http_method: "GET",
        request_uri: "/directoryRegistrations"
      )

      LIST_SERVICE_PRINCIPAL_NAMES = OperationModel.new(
        name: "ListServicePrincipalNames",
        http_method: "GET",
        request_uri: "/directoryRegistrations/{DirectoryRegistrationArn}/servicePrincipalNames"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      LIST_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRIES = OperationModel.new(
        name: "ListTemplateGroupAccessControlEntries",
        http_method: "GET",
        request_uri: "/templates/{TemplateArn}/accessControlEntries"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "GET",
        request_uri: "/templates"
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

      UPDATE_TEMPLATE = OperationModel.new(
        name: "UpdateTemplate",
        http_method: "PATCH",
        request_uri: "/templates/{TemplateArn}"
      )

      UPDATE_TEMPLATE_GROUP_ACCESS_CONTROL_ENTRY = OperationModel.new(
        name: "UpdateTemplateGroupAccessControlEntry",
        http_method: "PATCH",
        request_uri: "/templates/{TemplateArn}/accessControlEntries/{GroupSecurityIdentifier}"
      )
    end
  end
end
