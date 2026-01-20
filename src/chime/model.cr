module Aws
  module Chime
    module Model
      API_VERSION = "2018-05-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://chime.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"chime","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_PHONE_NUMBER_WITH_USER = OperationModel.new(
        name: "AssociatePhoneNumberWithUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users/{userId}?operation=associate-phone-number"
      )

      ASSOCIATE_SIGNIN_DELEGATE_GROUPS_WITH_ACCOUNT = OperationModel.new(
        name: "AssociateSigninDelegateGroupsWithAccount",
        http_method: "POST",
        request_uri: "/accounts/{accountId}?operation=associate-signin-delegate-groups"
      )

      BATCH_CREATE_ROOM_MEMBERSHIP = OperationModel.new(
        name: "BatchCreateRoomMembership",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/memberships?operation=batch-create"
      )

      BATCH_DELETE_PHONE_NUMBER = OperationModel.new(
        name: "BatchDeletePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers?operation=batch-delete"
      )

      BATCH_SUSPEND_USER = OperationModel.new(
        name: "BatchSuspendUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users?operation=suspend"
      )

      BATCH_UNSUSPEND_USER = OperationModel.new(
        name: "BatchUnsuspendUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users?operation=unsuspend"
      )

      BATCH_UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "BatchUpdatePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers?operation=batch-update"
      )

      BATCH_UPDATE_USER = OperationModel.new(
        name: "BatchUpdateUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users"
      )

      CREATE_ACCOUNT = OperationModel.new(
        name: "CreateAccount",
        http_method: "POST",
        request_uri: "/accounts"
      )

      CREATE_BOT = OperationModel.new(
        name: "CreateBot",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/bots"
      )

      CREATE_MEETING_DIAL_OUT = OperationModel.new(
        name: "CreateMeetingDialOut",
        http_method: "POST",
        request_uri: "/meetings/{meetingId}/dial-outs"
      )

      CREATE_PHONE_NUMBER_ORDER = OperationModel.new(
        name: "CreatePhoneNumberOrder",
        http_method: "POST",
        request_uri: "/phone-number-orders"
      )

      CREATE_ROOM = OperationModel.new(
        name: "CreateRoom",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms"
      )

      CREATE_ROOM_MEMBERSHIP = OperationModel.new(
        name: "CreateRoomMembership",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/memberships"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users?operation=create"
      )

      DELETE_ACCOUNT = OperationModel.new(
        name: "DeleteAccount",
        http_method: "DELETE",
        request_uri: "/accounts/{accountId}"
      )

      DELETE_EVENTS_CONFIGURATION = OperationModel.new(
        name: "DeleteEventsConfiguration",
        http_method: "DELETE",
        request_uri: "/accounts/{accountId}/bots/{botId}/events-configuration"
      )

      DELETE_PHONE_NUMBER = OperationModel.new(
        name: "DeletePhoneNumber",
        http_method: "DELETE",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      DELETE_ROOM = OperationModel.new(
        name: "DeleteRoom",
        http_method: "DELETE",
        request_uri: "/accounts/{accountId}/rooms/{roomId}"
      )

      DELETE_ROOM_MEMBERSHIP = OperationModel.new(
        name: "DeleteRoomMembership",
        http_method: "DELETE",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/memberships/{memberId}"
      )

      DISASSOCIATE_PHONE_NUMBER_FROM_USER = OperationModel.new(
        name: "DisassociatePhoneNumberFromUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users/{userId}?operation=disassociate-phone-number"
      )

      DISASSOCIATE_SIGNIN_DELEGATE_GROUPS_FROM_ACCOUNT = OperationModel.new(
        name: "DisassociateSigninDelegateGroupsFromAccount",
        http_method: "POST",
        request_uri: "/accounts/{accountId}?operation=disassociate-signin-delegate-groups"
      )

      GET_ACCOUNT = OperationModel.new(
        name: "GetAccount",
        http_method: "GET",
        request_uri: "/accounts/{accountId}"
      )

      GET_ACCOUNT_SETTINGS = OperationModel.new(
        name: "GetAccountSettings",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/settings"
      )

      GET_BOT = OperationModel.new(
        name: "GetBot",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/bots/{botId}"
      )

      GET_EVENTS_CONFIGURATION = OperationModel.new(
        name: "GetEventsConfiguration",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/bots/{botId}/events-configuration"
      )

      GET_GLOBAL_SETTINGS = OperationModel.new(
        name: "GetGlobalSettings",
        http_method: "GET",
        request_uri: "/settings"
      )

      GET_PHONE_NUMBER = OperationModel.new(
        name: "GetPhoneNumber",
        http_method: "GET",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      GET_PHONE_NUMBER_ORDER = OperationModel.new(
        name: "GetPhoneNumberOrder",
        http_method: "GET",
        request_uri: "/phone-number-orders/{phoneNumberOrderId}"
      )

      GET_PHONE_NUMBER_SETTINGS = OperationModel.new(
        name: "GetPhoneNumberSettings",
        http_method: "GET",
        request_uri: "/settings/phone-number"
      )

      GET_RETENTION_SETTINGS = OperationModel.new(
        name: "GetRetentionSettings",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/retention-settings"
      )

      GET_ROOM = OperationModel.new(
        name: "GetRoom",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/rooms/{roomId}"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/users/{userId}"
      )

      GET_USER_SETTINGS = OperationModel.new(
        name: "GetUserSettings",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/users/{userId}/settings"
      )

      INVITE_USERS = OperationModel.new(
        name: "InviteUsers",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users?operation=add"
      )

      LIST_ACCOUNTS = OperationModel.new(
        name: "ListAccounts",
        http_method: "GET",
        request_uri: "/accounts"
      )

      LIST_BOTS = OperationModel.new(
        name: "ListBots",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/bots"
      )

      LIST_PHONE_NUMBER_ORDERS = OperationModel.new(
        name: "ListPhoneNumberOrders",
        http_method: "GET",
        request_uri: "/phone-number-orders"
      )

      LIST_PHONE_NUMBERS = OperationModel.new(
        name: "ListPhoneNumbers",
        http_method: "GET",
        request_uri: "/phone-numbers"
      )

      LIST_ROOM_MEMBERSHIPS = OperationModel.new(
        name: "ListRoomMemberships",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/memberships"
      )

      LIST_ROOMS = OperationModel.new(
        name: "ListRooms",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/rooms"
      )

      LIST_SUPPORTED_PHONE_NUMBER_COUNTRIES = OperationModel.new(
        name: "ListSupportedPhoneNumberCountries",
        http_method: "GET",
        request_uri: "/phone-number-countries"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/accounts/{accountId}/users"
      )

      LOGOUT_USER = OperationModel.new(
        name: "LogoutUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users/{userId}?operation=logout"
      )

      PUT_EVENTS_CONFIGURATION = OperationModel.new(
        name: "PutEventsConfiguration",
        http_method: "PUT",
        request_uri: "/accounts/{accountId}/bots/{botId}/events-configuration"
      )

      PUT_RETENTION_SETTINGS = OperationModel.new(
        name: "PutRetentionSettings",
        http_method: "PUT",
        request_uri: "/accounts/{accountId}/retention-settings"
      )

      REDACT_CONVERSATION_MESSAGE = OperationModel.new(
        name: "RedactConversationMessage",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/conversations/{conversationId}/messages/{messageId}?operation=redact"
      )

      REDACT_ROOM_MESSAGE = OperationModel.new(
        name: "RedactRoomMessage",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/messages/{messageId}?operation=redact"
      )

      REGENERATE_SECURITY_TOKEN = OperationModel.new(
        name: "RegenerateSecurityToken",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/bots/{botId}?operation=regenerate-security-token"
      )

      RESET_PERSONAL_PIN = OperationModel.new(
        name: "ResetPersonalPIN",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users/{userId}?operation=reset-personal-pin"
      )

      RESTORE_PHONE_NUMBER = OperationModel.new(
        name: "RestorePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers/{phoneNumberId}?operation=restore"
      )

      SEARCH_AVAILABLE_PHONE_NUMBERS = OperationModel.new(
        name: "SearchAvailablePhoneNumbers",
        http_method: "GET",
        request_uri: "/search?type=phone-numbers"
      )

      UPDATE_ACCOUNT = OperationModel.new(
        name: "UpdateAccount",
        http_method: "POST",
        request_uri: "/accounts/{accountId}"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "PUT",
        request_uri: "/accounts/{accountId}/settings"
      )

      UPDATE_BOT = OperationModel.new(
        name: "UpdateBot",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/bots/{botId}"
      )

      UPDATE_GLOBAL_SETTINGS = OperationModel.new(
        name: "UpdateGlobalSettings",
        http_method: "PUT",
        request_uri: "/settings"
      )

      UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "UpdatePhoneNumber",
        http_method: "POST",
        request_uri: "/phone-numbers/{phoneNumberId}"
      )

      UPDATE_PHONE_NUMBER_SETTINGS = OperationModel.new(
        name: "UpdatePhoneNumberSettings",
        http_method: "PUT",
        request_uri: "/settings/phone-number"
      )

      UPDATE_ROOM = OperationModel.new(
        name: "UpdateRoom",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms/{roomId}"
      )

      UPDATE_ROOM_MEMBERSHIP = OperationModel.new(
        name: "UpdateRoomMembership",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/rooms/{roomId}/memberships/{memberId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/accounts/{accountId}/users/{userId}"
      )

      UPDATE_USER_SETTINGS = OperationModel.new(
        name: "UpdateUserSettings",
        http_method: "PUT",
        request_uri: "/accounts/{accountId}/users/{userId}/settings"
      )
    end
  end
end
