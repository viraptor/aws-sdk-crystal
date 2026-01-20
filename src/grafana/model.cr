module Aws
  module Grafana
    module Model
      API_VERSION = "2020-08-18"
      TARGET_PREFIX = ""
      SIGNING_NAME = "grafana"
      ENDPOINT_PREFIX = "grafana"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://grafana-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://grafana-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://grafana.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://grafana.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_LICENSE = OperationModel.new(
        name: "AssociateLicense",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/licenses/{licenseType}"
      )

      CREATE_WORKSPACE = OperationModel.new(
        name: "CreateWorkspace",
        http_method: "POST",
        request_uri: "/workspaces"
      )

      CREATE_WORKSPACE_API_KEY = OperationModel.new(
        name: "CreateWorkspaceApiKey",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/apikeys"
      )

      CREATE_WORKSPACE_SERVICE_ACCOUNT = OperationModel.new(
        name: "CreateWorkspaceServiceAccount",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts"
      )

      CREATE_WORKSPACE_SERVICE_ACCOUNT_TOKEN = OperationModel.new(
        name: "CreateWorkspaceServiceAccountToken",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts/{serviceAccountId}/tokens"
      )

      DELETE_WORKSPACE = OperationModel.new(
        name: "DeleteWorkspace",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}"
      )

      DELETE_WORKSPACE_API_KEY = OperationModel.new(
        name: "DeleteWorkspaceApiKey",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/apikeys/{keyName}"
      )

      DELETE_WORKSPACE_SERVICE_ACCOUNT = OperationModel.new(
        name: "DeleteWorkspaceServiceAccount",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts/{serviceAccountId}"
      )

      DELETE_WORKSPACE_SERVICE_ACCOUNT_TOKEN = OperationModel.new(
        name: "DeleteWorkspaceServiceAccountToken",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts/{serviceAccountId}/tokens/{tokenId}"
      )

      DESCRIBE_WORKSPACE = OperationModel.new(
        name: "DescribeWorkspace",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}"
      )

      DESCRIBE_WORKSPACE_AUTHENTICATION = OperationModel.new(
        name: "DescribeWorkspaceAuthentication",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/authentication"
      )

      DESCRIBE_WORKSPACE_CONFIGURATION = OperationModel.new(
        name: "DescribeWorkspaceConfiguration",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/configuration"
      )

      DISASSOCIATE_LICENSE = OperationModel.new(
        name: "DisassociateLicense",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/licenses/{licenseType}"
      )

      LIST_PERMISSIONS = OperationModel.new(
        name: "ListPermissions",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/permissions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_VERSIONS = OperationModel.new(
        name: "ListVersions",
        http_method: "GET",
        request_uri: "/versions"
      )

      LIST_WORKSPACE_SERVICE_ACCOUNT_TOKENS = OperationModel.new(
        name: "ListWorkspaceServiceAccountTokens",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts/{serviceAccountId}/tokens"
      )

      LIST_WORKSPACE_SERVICE_ACCOUNTS = OperationModel.new(
        name: "ListWorkspaceServiceAccounts",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/serviceaccounts"
      )

      LIST_WORKSPACES = OperationModel.new(
        name: "ListWorkspaces",
        http_method: "GET",
        request_uri: "/workspaces"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_PERMISSIONS = OperationModel.new(
        name: "UpdatePermissions",
        http_method: "PATCH",
        request_uri: "/workspaces/{workspaceId}/permissions"
      )

      UPDATE_WORKSPACE = OperationModel.new(
        name: "UpdateWorkspace",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}"
      )

      UPDATE_WORKSPACE_AUTHENTICATION = OperationModel.new(
        name: "UpdateWorkspaceAuthentication",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/authentication"
      )

      UPDATE_WORKSPACE_CONFIGURATION = OperationModel.new(
        name: "UpdateWorkspaceConfiguration",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/configuration"
      )
    end
  end
end
