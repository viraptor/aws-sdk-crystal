module AwsSdk
  module WorkSpaces
    module Model
      API_VERSION = "2015-04-08"
      TARGET_PREFIX = "WorkspacesService"
      SIGNING_NAME = "workspaces"
      ENDPOINT_PREFIX = "workspaces"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://workspaces.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ACCOUNT_LINK_INVITATION = OperationModel.new(
        name: "AcceptAccountLinkInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_CONNECTION_ALIAS = OperationModel.new(
        name: "AssociateConnectionAlias",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_IP_GROUPS = OperationModel.new(
        name: "AssociateIpGroups",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_WORKSPACE_APPLICATION = OperationModel.new(
        name: "AssociateWorkspaceApplication",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_IP_RULES = OperationModel.new(
        name: "AuthorizeIpRules",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_WORKSPACE_IMAGE = OperationModel.new(
        name: "CopyWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCOUNT_LINK_INVITATION = OperationModel.new(
        name: "CreateAccountLinkInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECT_CLIENT_ADD_IN = OperationModel.new(
        name: "CreateConnectClientAddIn",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION_ALIAS = OperationModel.new(
        name: "CreateConnectionAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IP_GROUP = OperationModel.new(
        name: "CreateIpGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STANDBY_WORKSPACES = OperationModel.new(
        name: "CreateStandbyWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_UPDATED_WORKSPACE_IMAGE = OperationModel.new(
        name: "CreateUpdatedWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKSPACE_BUNDLE = OperationModel.new(
        name: "CreateWorkspaceBundle",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKSPACE_IMAGE = OperationModel.new(
        name: "CreateWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKSPACES = OperationModel.new(
        name: "CreateWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKSPACES_POOL = OperationModel.new(
        name: "CreateWorkspacesPool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_LINK_INVITATION = OperationModel.new(
        name: "DeleteAccountLinkInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLIENT_BRANDING = OperationModel.new(
        name: "DeleteClientBranding",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECT_CLIENT_ADD_IN = OperationModel.new(
        name: "DeleteConnectClientAddIn",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION_ALIAS = OperationModel.new(
        name: "DeleteConnectionAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IP_GROUP = OperationModel.new(
        name: "DeleteIpGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKSPACE_BUNDLE = OperationModel.new(
        name: "DeleteWorkspaceBundle",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKSPACE_IMAGE = OperationModel.new(
        name: "DeleteWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      DEPLOY_WORKSPACE_APPLICATIONS = OperationModel.new(
        name: "DeployWorkspaceApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_WORKSPACE_DIRECTORY = OperationModel.new(
        name: "DeregisterWorkspaceDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT = OperationModel.new(
        name: "DescribeAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_MODIFICATIONS = OperationModel.new(
        name: "DescribeAccountModifications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_ASSOCIATIONS = OperationModel.new(
        name: "DescribeApplicationAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATIONS = OperationModel.new(
        name: "DescribeApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUNDLE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeBundleAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_BRANDING = OperationModel.new(
        name: "DescribeClientBranding",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_PROPERTIES = OperationModel.new(
        name: "DescribeClientProperties",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECT_CLIENT_ADD_INS = OperationModel.new(
        name: "DescribeConnectClientAddIns",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTION_ALIAS_PERMISSIONS = OperationModel.new(
        name: "DescribeConnectionAliasPermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTION_ALIASES = OperationModel.new(
        name: "DescribeConnectionAliases",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_WORKSPACE_IMAGE_IMPORT = OperationModel.new(
        name: "DescribeCustomWorkspaceImageImport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeImageAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IP_GROUPS = OperationModel.new(
        name: "DescribeIpGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeWorkspaceAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_BUNDLES = OperationModel.new(
        name: "DescribeWorkspaceBundles",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_DIRECTORIES = OperationModel.new(
        name: "DescribeWorkspaceDirectories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_IMAGE_PERMISSIONS = OperationModel.new(
        name: "DescribeWorkspaceImagePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_IMAGES = OperationModel.new(
        name: "DescribeWorkspaceImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACE_SNAPSHOTS = OperationModel.new(
        name: "DescribeWorkspaceSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACES = OperationModel.new(
        name: "DescribeWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACES_CONNECTION_STATUS = OperationModel.new(
        name: "DescribeWorkspacesConnectionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACES_POOL_SESSIONS = OperationModel.new(
        name: "DescribeWorkspacesPoolSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKSPACES_POOLS = OperationModel.new(
        name: "DescribeWorkspacesPools",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CONNECTION_ALIAS = OperationModel.new(
        name: "DisassociateConnectionAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_IP_GROUPS = OperationModel.new(
        name: "DisassociateIpGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_WORKSPACE_APPLICATION = OperationModel.new(
        name: "DisassociateWorkspaceApplication",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_LINK = OperationModel.new(
        name: "GetAccountLink",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CLIENT_BRANDING = OperationModel.new(
        name: "ImportClientBranding",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CUSTOM_WORKSPACE_IMAGE = OperationModel.new(
        name: "ImportCustomWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_WORKSPACE_IMAGE = OperationModel.new(
        name: "ImportWorkspaceImage",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_LINKS = OperationModel.new(
        name: "ListAccountLinks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABLE_MANAGEMENT_CIDR_RANGES = OperationModel.new(
        name: "ListAvailableManagementCidrRanges",
        http_method: "POST",
        request_uri: "/"
      )

      MIGRATE_WORKSPACE = OperationModel.new(
        name: "MigrateWorkspace",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ACCOUNT = OperationModel.new(
        name: "ModifyAccount",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CERTIFICATE_BASED_AUTH_PROPERTIES = OperationModel.new(
        name: "ModifyCertificateBasedAuthProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLIENT_PROPERTIES = OperationModel.new(
        name: "ModifyClientProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ENDPOINT_ENCRYPTION_MODE = OperationModel.new(
        name: "ModifyEndpointEncryptionMode",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SAML_PROPERTIES = OperationModel.new(
        name: "ModifySamlProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SELFSERVICE_PERMISSIONS = OperationModel.new(
        name: "ModifySelfservicePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_STREAMING_PROPERTIES = OperationModel.new(
        name: "ModifyStreamingProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_WORKSPACE_ACCESS_PROPERTIES = OperationModel.new(
        name: "ModifyWorkspaceAccessProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_WORKSPACE_CREATION_PROPERTIES = OperationModel.new(
        name: "ModifyWorkspaceCreationProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_WORKSPACE_PROPERTIES = OperationModel.new(
        name: "ModifyWorkspaceProperties",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_WORKSPACE_STATE = OperationModel.new(
        name: "ModifyWorkspaceState",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_WORKSPACES = OperationModel.new(
        name: "RebootWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      REBUILD_WORKSPACES = OperationModel.new(
        name: "RebuildWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_WORKSPACE_DIRECTORY = OperationModel.new(
        name: "RegisterWorkspaceDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_ACCOUNT_LINK_INVITATION = OperationModel.new(
        name: "RejectAccountLinkInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_WORKSPACE = OperationModel.new(
        name: "RestoreWorkspace",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_IP_RULES = OperationModel.new(
        name: "RevokeIpRules",
        http_method: "POST",
        request_uri: "/"
      )

      START_WORKSPACES = OperationModel.new(
        name: "StartWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      START_WORKSPACES_POOL = OperationModel.new(
        name: "StartWorkspacesPool",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_WORKSPACES = OperationModel.new(
        name: "StopWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_WORKSPACES_POOL = OperationModel.new(
        name: "StopWorkspacesPool",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_WORKSPACES = OperationModel.new(
        name: "TerminateWorkspaces",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_WORKSPACES_POOL = OperationModel.new(
        name: "TerminateWorkspacesPool",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_WORKSPACES_POOL_SESSION = OperationModel.new(
        name: "TerminateWorkspacesPoolSession",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECT_CLIENT_ADD_IN = OperationModel.new(
        name: "UpdateConnectClientAddIn",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECTION_ALIAS_PERMISSION = OperationModel.new(
        name: "UpdateConnectionAliasPermission",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULES_OF_IP_GROUP = OperationModel.new(
        name: "UpdateRulesOfIpGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKSPACE_BUNDLE = OperationModel.new(
        name: "UpdateWorkspaceBundle",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKSPACE_IMAGE_PERMISSION = OperationModel.new(
        name: "UpdateWorkspaceImagePermission",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKSPACES_POOL = OperationModel.new(
        name: "UpdateWorkspacesPool",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
