module Aws
  module WorkSpacesWeb
    module Model
      API_VERSION = "2020-07-08"
      TARGET_PREFIX = ""
      SIGNING_NAME = "workspaces-web"
      ENDPOINT_PREFIX = "workspaces-web"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces-web-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces-web-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workspaces-web.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://workspaces-web.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_BROWSER_SETTINGS = OperationModel.new(
        name: "AssociateBrowserSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/browserSettings"
      )

      ASSOCIATE_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "AssociateDataProtectionSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/dataProtectionSettings"
      )

      ASSOCIATE_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "AssociateIpAccessSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/ipAccessSettings"
      )

      ASSOCIATE_NETWORK_SETTINGS = OperationModel.new(
        name: "AssociateNetworkSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/networkSettings"
      )

      ASSOCIATE_SESSION_LOGGER = OperationModel.new(
        name: "AssociateSessionLogger",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/sessionLogger"
      )

      ASSOCIATE_TRUST_STORE = OperationModel.new(
        name: "AssociateTrustStore",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/trustStores"
      )

      ASSOCIATE_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "AssociateUserAccessLoggingSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/userAccessLoggingSettings"
      )

      ASSOCIATE_USER_SETTINGS = OperationModel.new(
        name: "AssociateUserSettings",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}/userSettings"
      )

      CREATE_BROWSER_SETTINGS = OperationModel.new(
        name: "CreateBrowserSettings",
        http_method: "POST",
        request_uri: "/browserSettings"
      )

      CREATE_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "CreateDataProtectionSettings",
        http_method: "POST",
        request_uri: "/dataProtectionSettings"
      )

      CREATE_IDENTITY_PROVIDER = OperationModel.new(
        name: "CreateIdentityProvider",
        http_method: "POST",
        request_uri: "/identityProviders"
      )

      CREATE_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "CreateIpAccessSettings",
        http_method: "POST",
        request_uri: "/ipAccessSettings"
      )

      CREATE_NETWORK_SETTINGS = OperationModel.new(
        name: "CreateNetworkSettings",
        http_method: "POST",
        request_uri: "/networkSettings"
      )

      CREATE_PORTAL = OperationModel.new(
        name: "CreatePortal",
        http_method: "POST",
        request_uri: "/portals"
      )

      CREATE_SESSION_LOGGER = OperationModel.new(
        name: "CreateSessionLogger",
        http_method: "POST",
        request_uri: "/sessionLoggers"
      )

      CREATE_TRUST_STORE = OperationModel.new(
        name: "CreateTrustStore",
        http_method: "POST",
        request_uri: "/trustStores"
      )

      CREATE_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "CreateUserAccessLoggingSettings",
        http_method: "POST",
        request_uri: "/userAccessLoggingSettings"
      )

      CREATE_USER_SETTINGS = OperationModel.new(
        name: "CreateUserSettings",
        http_method: "POST",
        request_uri: "/userSettings"
      )

      DELETE_BROWSER_SETTINGS = OperationModel.new(
        name: "DeleteBrowserSettings",
        http_method: "DELETE",
        request_uri: "/browserSettings/{browserSettingsArn+}"
      )

      DELETE_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "DeleteDataProtectionSettings",
        http_method: "DELETE",
        request_uri: "/dataProtectionSettings/{dataProtectionSettingsArn+}"
      )

      DELETE_IDENTITY_PROVIDER = OperationModel.new(
        name: "DeleteIdentityProvider",
        http_method: "DELETE",
        request_uri: "/identityProviders/{identityProviderArn+}"
      )

      DELETE_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "DeleteIpAccessSettings",
        http_method: "DELETE",
        request_uri: "/ipAccessSettings/{ipAccessSettingsArn+}"
      )

      DELETE_NETWORK_SETTINGS = OperationModel.new(
        name: "DeleteNetworkSettings",
        http_method: "DELETE",
        request_uri: "/networkSettings/{networkSettingsArn+}"
      )

      DELETE_PORTAL = OperationModel.new(
        name: "DeletePortal",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}"
      )

      DELETE_SESSION_LOGGER = OperationModel.new(
        name: "DeleteSessionLogger",
        http_method: "DELETE",
        request_uri: "/sessionLoggers/{sessionLoggerArn+}"
      )

      DELETE_TRUST_STORE = OperationModel.new(
        name: "DeleteTrustStore",
        http_method: "DELETE",
        request_uri: "/trustStores/{trustStoreArn+}"
      )

      DELETE_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "DeleteUserAccessLoggingSettings",
        http_method: "DELETE",
        request_uri: "/userAccessLoggingSettings/{userAccessLoggingSettingsArn+}"
      )

      DELETE_USER_SETTINGS = OperationModel.new(
        name: "DeleteUserSettings",
        http_method: "DELETE",
        request_uri: "/userSettings/{userSettingsArn+}"
      )

      DISASSOCIATE_BROWSER_SETTINGS = OperationModel.new(
        name: "DisassociateBrowserSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/browserSettings"
      )

      DISASSOCIATE_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "DisassociateDataProtectionSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/dataProtectionSettings"
      )

      DISASSOCIATE_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "DisassociateIpAccessSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/ipAccessSettings"
      )

      DISASSOCIATE_NETWORK_SETTINGS = OperationModel.new(
        name: "DisassociateNetworkSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/networkSettings"
      )

      DISASSOCIATE_SESSION_LOGGER = OperationModel.new(
        name: "DisassociateSessionLogger",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/sessionLogger"
      )

      DISASSOCIATE_TRUST_STORE = OperationModel.new(
        name: "DisassociateTrustStore",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/trustStores"
      )

      DISASSOCIATE_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "DisassociateUserAccessLoggingSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/userAccessLoggingSettings"
      )

      DISASSOCIATE_USER_SETTINGS = OperationModel.new(
        name: "DisassociateUserSettings",
        http_method: "DELETE",
        request_uri: "/portals/{portalArn+}/userSettings"
      )

      EXPIRE_SESSION = OperationModel.new(
        name: "ExpireSession",
        http_method: "DELETE",
        request_uri: "/portals/{portalId}/sessions/{sessionId}"
      )

      GET_BROWSER_SETTINGS = OperationModel.new(
        name: "GetBrowserSettings",
        http_method: "GET",
        request_uri: "/browserSettings/{browserSettingsArn+}"
      )

      GET_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "GetDataProtectionSettings",
        http_method: "GET",
        request_uri: "/dataProtectionSettings/{dataProtectionSettingsArn+}"
      )

      GET_IDENTITY_PROVIDER = OperationModel.new(
        name: "GetIdentityProvider",
        http_method: "GET",
        request_uri: "/identityProviders/{identityProviderArn+}"
      )

      GET_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "GetIpAccessSettings",
        http_method: "GET",
        request_uri: "/ipAccessSettings/{ipAccessSettingsArn+}"
      )

      GET_NETWORK_SETTINGS = OperationModel.new(
        name: "GetNetworkSettings",
        http_method: "GET",
        request_uri: "/networkSettings/{networkSettingsArn+}"
      )

      GET_PORTAL = OperationModel.new(
        name: "GetPortal",
        http_method: "GET",
        request_uri: "/portals/{portalArn+}"
      )

      GET_PORTAL_SERVICE_PROVIDER_METADATA = OperationModel.new(
        name: "GetPortalServiceProviderMetadata",
        http_method: "GET",
        request_uri: "/portalIdp/{portalArn+}"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "GET",
        request_uri: "/portals/{portalId}/sessions/{sessionId}"
      )

      GET_SESSION_LOGGER = OperationModel.new(
        name: "GetSessionLogger",
        http_method: "GET",
        request_uri: "/sessionLoggers/{sessionLoggerArn+}"
      )

      GET_TRUST_STORE = OperationModel.new(
        name: "GetTrustStore",
        http_method: "GET",
        request_uri: "/trustStores/{trustStoreArn+}"
      )

      GET_TRUST_STORE_CERTIFICATE = OperationModel.new(
        name: "GetTrustStoreCertificate",
        http_method: "GET",
        request_uri: "/trustStores/{trustStoreArn+}/certificate"
      )

      GET_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "GetUserAccessLoggingSettings",
        http_method: "GET",
        request_uri: "/userAccessLoggingSettings/{userAccessLoggingSettingsArn+}"
      )

      GET_USER_SETTINGS = OperationModel.new(
        name: "GetUserSettings",
        http_method: "GET",
        request_uri: "/userSettings/{userSettingsArn+}"
      )

      LIST_BROWSER_SETTINGS = OperationModel.new(
        name: "ListBrowserSettings",
        http_method: "GET",
        request_uri: "/browserSettings"
      )

      LIST_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "ListDataProtectionSettings",
        http_method: "GET",
        request_uri: "/dataProtectionSettings"
      )

      LIST_IDENTITY_PROVIDERS = OperationModel.new(
        name: "ListIdentityProviders",
        http_method: "GET",
        request_uri: "/portals/{portalArn+}/identityProviders"
      )

      LIST_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "ListIpAccessSettings",
        http_method: "GET",
        request_uri: "/ipAccessSettings"
      )

      LIST_NETWORK_SETTINGS = OperationModel.new(
        name: "ListNetworkSettings",
        http_method: "GET",
        request_uri: "/networkSettings"
      )

      LIST_PORTALS = OperationModel.new(
        name: "ListPortals",
        http_method: "GET",
        request_uri: "/portals"
      )

      LIST_SESSION_LOGGERS = OperationModel.new(
        name: "ListSessionLoggers",
        http_method: "GET",
        request_uri: "/sessionLoggers"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "GET",
        request_uri: "/portals/{portalId}/sessions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn+}"
      )

      LIST_TRUST_STORE_CERTIFICATES = OperationModel.new(
        name: "ListTrustStoreCertificates",
        http_method: "GET",
        request_uri: "/trustStores/{trustStoreArn+}/certificates"
      )

      LIST_TRUST_STORES = OperationModel.new(
        name: "ListTrustStores",
        http_method: "GET",
        request_uri: "/trustStores"
      )

      LIST_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "ListUserAccessLoggingSettings",
        http_method: "GET",
        request_uri: "/userAccessLoggingSettings"
      )

      LIST_USER_SETTINGS = OperationModel.new(
        name: "ListUserSettings",
        http_method: "GET",
        request_uri: "/userSettings"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn+}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn+}"
      )

      UPDATE_BROWSER_SETTINGS = OperationModel.new(
        name: "UpdateBrowserSettings",
        http_method: "PATCH",
        request_uri: "/browserSettings/{browserSettingsArn+}"
      )

      UPDATE_DATA_PROTECTION_SETTINGS = OperationModel.new(
        name: "UpdateDataProtectionSettings",
        http_method: "PATCH",
        request_uri: "/dataProtectionSettings/{dataProtectionSettingsArn+}"
      )

      UPDATE_IDENTITY_PROVIDER = OperationModel.new(
        name: "UpdateIdentityProvider",
        http_method: "PATCH",
        request_uri: "/identityProviders/{identityProviderArn+}"
      )

      UPDATE_IP_ACCESS_SETTINGS = OperationModel.new(
        name: "UpdateIpAccessSettings",
        http_method: "PATCH",
        request_uri: "/ipAccessSettings/{ipAccessSettingsArn+}"
      )

      UPDATE_NETWORK_SETTINGS = OperationModel.new(
        name: "UpdateNetworkSettings",
        http_method: "PATCH",
        request_uri: "/networkSettings/{networkSettingsArn+}"
      )

      UPDATE_PORTAL = OperationModel.new(
        name: "UpdatePortal",
        http_method: "PUT",
        request_uri: "/portals/{portalArn+}"
      )

      UPDATE_SESSION_LOGGER = OperationModel.new(
        name: "UpdateSessionLogger",
        http_method: "POST",
        request_uri: "/sessionLoggers/{sessionLoggerArn+}"
      )

      UPDATE_TRUST_STORE = OperationModel.new(
        name: "UpdateTrustStore",
        http_method: "PATCH",
        request_uri: "/trustStores/{trustStoreArn+}"
      )

      UPDATE_USER_ACCESS_LOGGING_SETTINGS = OperationModel.new(
        name: "UpdateUserAccessLoggingSettings",
        http_method: "PATCH",
        request_uri: "/userAccessLoggingSettings/{userAccessLoggingSettingsArn+}"
      )

      UPDATE_USER_SETTINGS = OperationModel.new(
        name: "UpdateUserSettings",
        http_method: "PATCH",
        request_uri: "/userSettings/{userSettingsArn+}"
      )
    end
  end
end
