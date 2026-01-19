module AwsSdk
  module Wickr
    module Model
      API_VERSION = "2024-02-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "wickr"
      ENDPOINT_PREFIX = "admin.wickr"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://admin.wickr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://admin.wickr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://admin.wickr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://admin.wickr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_USER = OperationModel.new(
        name: "BatchCreateUser",
        http_method: "POST",
        request_uri: "/networks/{networkId}/users"
      )

      BATCH_DELETE_USER = OperationModel.new(
        name: "BatchDeleteUser",
        http_method: "POST",
        request_uri: "/networks/{networkId}/users/batch-delete"
      )

      BATCH_LOOKUP_USER_UNAME = OperationModel.new(
        name: "BatchLookupUserUname",
        http_method: "POST",
        request_uri: "/networks/{networkId}/users/uname-lookup"
      )

      BATCH_REINVITE_USER = OperationModel.new(
        name: "BatchReinviteUser",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/users/re-invite"
      )

      BATCH_RESET_DEVICES_FOR_USER = OperationModel.new(
        name: "BatchResetDevicesForUser",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/users/{userId}/devices"
      )

      BATCH_TOGGLE_USER_SUSPEND_STATUS = OperationModel.new(
        name: "BatchToggleUserSuspendStatus",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/users/toggleSuspend"
      )

      CREATE_BOT = OperationModel.new(
        name: "CreateBot",
        http_method: "POST",
        request_uri: "/networks/{networkId}/bots"
      )

      CREATE_DATA_RETENTION_BOT = OperationModel.new(
        name: "CreateDataRetentionBot",
        http_method: "POST",
        request_uri: "/networks/{networkId}/data-retention-bots"
      )

      CREATE_DATA_RETENTION_BOT_CHALLENGE = OperationModel.new(
        name: "CreateDataRetentionBotChallenge",
        http_method: "POST",
        request_uri: "/networks/{networkId}/data-retention-bots/challenge"
      )

      CREATE_NETWORK = OperationModel.new(
        name: "CreateNetwork",
        http_method: "POST",
        request_uri: "/networks"
      )

      CREATE_SECURITY_GROUP = OperationModel.new(
        name: "CreateSecurityGroup",
        http_method: "POST",
        request_uri: "/networks/{networkId}/security-groups"
      )

      DELETE_BOT = OperationModel.new(
        name: "DeleteBot",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}/bots/{botId}"
      )

      DELETE_DATA_RETENTION_BOT = OperationModel.new(
        name: "DeleteDataRetentionBot",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}/data-retention-bots"
      )

      DELETE_NETWORK = OperationModel.new(
        name: "DeleteNetwork",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}"
      )

      DELETE_SECURITY_GROUP = OperationModel.new(
        name: "DeleteSecurityGroup",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}/security-groups/{groupId}"
      )

      GET_BOT = OperationModel.new(
        name: "GetBot",
        http_method: "GET",
        request_uri: "/networks/{networkId}/bots/{botId}"
      )

      GET_BOTS_COUNT = OperationModel.new(
        name: "GetBotsCount",
        http_method: "GET",
        request_uri: "/networks/{networkId}/bots/count"
      )

      GET_DATA_RETENTION_BOT = OperationModel.new(
        name: "GetDataRetentionBot",
        http_method: "GET",
        request_uri: "/networks/{networkId}/data-retention-bots"
      )

      GET_GUEST_USER_HISTORY_COUNT = OperationModel.new(
        name: "GetGuestUserHistoryCount",
        http_method: "GET",
        request_uri: "/networks/{networkId}/guest-users/count"
      )

      GET_NETWORK = OperationModel.new(
        name: "GetNetwork",
        http_method: "GET",
        request_uri: "/networks/{networkId}"
      )

      GET_NETWORK_SETTINGS = OperationModel.new(
        name: "GetNetworkSettings",
        http_method: "GET",
        request_uri: "/networks/{networkId}/settings"
      )

      GET_OIDC_INFO = OperationModel.new(
        name: "GetOidcInfo",
        http_method: "GET",
        request_uri: "/networks/{networkId}/oidc"
      )

      GET_SECURITY_GROUP = OperationModel.new(
        name: "GetSecurityGroup",
        http_method: "GET",
        request_uri: "/networks/{networkId}/security-groups/{groupId}"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "GET",
        request_uri: "/networks/{networkId}/users/{userId}"
      )

      GET_USERS_COUNT = OperationModel.new(
        name: "GetUsersCount",
        http_method: "GET",
        request_uri: "/networks/{networkId}/users/count"
      )

      LIST_BLOCKED_GUEST_USERS = OperationModel.new(
        name: "ListBlockedGuestUsers",
        http_method: "GET",
        request_uri: "/networks/{networkId}/guest-users/blocklist"
      )

      LIST_BOTS = OperationModel.new(
        name: "ListBots",
        http_method: "GET",
        request_uri: "/networks/{networkId}/bots"
      )

      LIST_DEVICES_FOR_USER = OperationModel.new(
        name: "ListDevicesForUser",
        http_method: "GET",
        request_uri: "/networks/{networkId}/users/{userId}/devices"
      )

      LIST_GUEST_USERS = OperationModel.new(
        name: "ListGuestUsers",
        http_method: "GET",
        request_uri: "/networks/{networkId}/guest-users"
      )

      LIST_NETWORKS = OperationModel.new(
        name: "ListNetworks",
        http_method: "GET",
        request_uri: "/networks"
      )

      LIST_SECURITY_GROUP_USERS = OperationModel.new(
        name: "ListSecurityGroupUsers",
        http_method: "GET",
        request_uri: "/networks/{networkId}/security-groups/{groupId}/users"
      )

      LIST_SECURITY_GROUPS = OperationModel.new(
        name: "ListSecurityGroups",
        http_method: "GET",
        request_uri: "/networks/{networkId}/security-groups"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/networks/{networkId}/users"
      )

      REGISTER_OIDC_CONFIG = OperationModel.new(
        name: "RegisterOidcConfig",
        http_method: "POST",
        request_uri: "/networks/{networkId}/oidc/save"
      )

      REGISTER_OIDC_CONFIG_TEST = OperationModel.new(
        name: "RegisterOidcConfigTest",
        http_method: "POST",
        request_uri: "/networks/{networkId}/oidc/test"
      )

      UPDATE_BOT = OperationModel.new(
        name: "UpdateBot",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/bots/{botId}"
      )

      UPDATE_DATA_RETENTION = OperationModel.new(
        name: "UpdateDataRetention",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/data-retention-bots"
      )

      UPDATE_GUEST_USER = OperationModel.new(
        name: "UpdateGuestUser",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/guest-users/{usernameHash}"
      )

      UPDATE_NETWORK = OperationModel.new(
        name: "UpdateNetwork",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}"
      )

      UPDATE_NETWORK_SETTINGS = OperationModel.new(
        name: "UpdateNetworkSettings",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/settings"
      )

      UPDATE_SECURITY_GROUP = OperationModel.new(
        name: "UpdateSecurityGroup",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/security-groups/{groupId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/users"
      )
    end
  end
end
