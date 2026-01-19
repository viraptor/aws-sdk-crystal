module AwsSdk
  module Notifications
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "notifications"
      ENDPOINT_PREFIX = "notifications"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://notifications-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://notifications.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CHANNEL = OperationModel.new(
        name: "AssociateChannel",
        http_method: "POST",
        request_uri: "/channels/associate/{arn}"
      )

      ASSOCIATE_MANAGED_NOTIFICATION_ACCOUNT_CONTACT = OperationModel.new(
        name: "AssociateManagedNotificationAccountContact",
        http_method: "PUT",
        request_uri: "/contacts/associate-managed-notification/{contactIdentifier}"
      )

      ASSOCIATE_MANAGED_NOTIFICATION_ADDITIONAL_CHANNEL = OperationModel.new(
        name: "AssociateManagedNotificationAdditionalChannel",
        http_method: "PUT",
        request_uri: "/channels/associate-managed-notification/{channelArn}"
      )

      ASSOCIATE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "AssociateOrganizationalUnit",
        http_method: "POST",
        request_uri: "/organizational-units/associate/{organizationalUnitId}"
      )

      CREATE_EVENT_RULE = OperationModel.new(
        name: "CreateEventRule",
        http_method: "POST",
        request_uri: "/event-rules"
      )

      CREATE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "CreateNotificationConfiguration",
        http_method: "POST",
        request_uri: "/notification-configurations"
      )

      DELETE_EVENT_RULE = OperationModel.new(
        name: "DeleteEventRule",
        http_method: "DELETE",
        request_uri: "/event-rules/{arn}"
      )

      DELETE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "DeleteNotificationConfiguration",
        http_method: "DELETE",
        request_uri: "/notification-configurations/{arn}"
      )

      DEREGISTER_NOTIFICATION_HUB = OperationModel.new(
        name: "DeregisterNotificationHub",
        http_method: "DELETE",
        request_uri: "/notification-hubs/{notificationHubRegion}"
      )

      DISABLE_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "DisableNotificationsAccessForOrganization",
        http_method: "DELETE",
        request_uri: "/organization/access"
      )

      DISASSOCIATE_CHANNEL = OperationModel.new(
        name: "DisassociateChannel",
        http_method: "POST",
        request_uri: "/channels/disassociate/{arn}"
      )

      DISASSOCIATE_MANAGED_NOTIFICATION_ACCOUNT_CONTACT = OperationModel.new(
        name: "DisassociateManagedNotificationAccountContact",
        http_method: "PUT",
        request_uri: "/contacts/disassociate-managed-notification/{contactIdentifier}"
      )

      DISASSOCIATE_MANAGED_NOTIFICATION_ADDITIONAL_CHANNEL = OperationModel.new(
        name: "DisassociateManagedNotificationAdditionalChannel",
        http_method: "PUT",
        request_uri: "/channels/disassociate-managed-notification/{channelArn}"
      )

      DISASSOCIATE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "DisassociateOrganizationalUnit",
        http_method: "POST",
        request_uri: "/organizational-units/disassociate/{organizationalUnitId}"
      )

      ENABLE_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "EnableNotificationsAccessForOrganization",
        http_method: "POST",
        request_uri: "/organization/access"
      )

      GET_EVENT_RULE = OperationModel.new(
        name: "GetEventRule",
        http_method: "GET",
        request_uri: "/event-rules/{arn}"
      )

      GET_MANAGED_NOTIFICATION_CHILD_EVENT = OperationModel.new(
        name: "GetManagedNotificationChildEvent",
        http_method: "GET",
        request_uri: "/managed-notification-child-events/{arn}"
      )

      GET_MANAGED_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "GetManagedNotificationConfiguration",
        http_method: "GET",
        request_uri: "/managed-notification-configurations/{arn}"
      )

      GET_MANAGED_NOTIFICATION_EVENT = OperationModel.new(
        name: "GetManagedNotificationEvent",
        http_method: "GET",
        request_uri: "/managed-notification-events/{arn}"
      )

      GET_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "GetNotificationConfiguration",
        http_method: "GET",
        request_uri: "/notification-configurations/{arn}"
      )

      GET_NOTIFICATION_EVENT = OperationModel.new(
        name: "GetNotificationEvent",
        http_method: "GET",
        request_uri: "/notification-events/{arn}"
      )

      GET_NOTIFICATIONS_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "GetNotificationsAccessForOrganization",
        http_method: "GET",
        request_uri: "/organization/access"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channels"
      )

      LIST_EVENT_RULES = OperationModel.new(
        name: "ListEventRules",
        http_method: "GET",
        request_uri: "/event-rules"
      )

      LIST_MANAGED_NOTIFICATION_CHANNEL_ASSOCIATIONS = OperationModel.new(
        name: "ListManagedNotificationChannelAssociations",
        http_method: "GET",
        request_uri: "/channels/list-managed-notification-channel-associations"
      )

      LIST_MANAGED_NOTIFICATION_CHILD_EVENTS = OperationModel.new(
        name: "ListManagedNotificationChildEvents",
        http_method: "GET",
        request_uri: "/list-managed-notification-child-events/{aggregateManagedNotificationEventArn}"
      )

      LIST_MANAGED_NOTIFICATION_CONFIGURATIONS = OperationModel.new(
        name: "ListManagedNotificationConfigurations",
        http_method: "GET",
        request_uri: "/managed-notification-configurations"
      )

      LIST_MANAGED_NOTIFICATION_EVENTS = OperationModel.new(
        name: "ListManagedNotificationEvents",
        http_method: "GET",
        request_uri: "/managed-notification-events"
      )

      LIST_MEMBER_ACCOUNTS = OperationModel.new(
        name: "ListMemberAccounts",
        http_method: "GET",
        request_uri: "/list-member-accounts"
      )

      LIST_NOTIFICATION_CONFIGURATIONS = OperationModel.new(
        name: "ListNotificationConfigurations",
        http_method: "GET",
        request_uri: "/notification-configurations"
      )

      LIST_NOTIFICATION_EVENTS = OperationModel.new(
        name: "ListNotificationEvents",
        http_method: "GET",
        request_uri: "/notification-events"
      )

      LIST_NOTIFICATION_HUBS = OperationModel.new(
        name: "ListNotificationHubs",
        http_method: "GET",
        request_uri: "/notification-hubs"
      )

      LIST_ORGANIZATIONAL_UNITS = OperationModel.new(
        name: "ListOrganizationalUnits",
        http_method: "GET",
        request_uri: "/organizational-units"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{arn}"
      )

      REGISTER_NOTIFICATION_HUB = OperationModel.new(
        name: "RegisterNotificationHub",
        http_method: "POST",
        request_uri: "/notification-hubs"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{arn}"
      )

      UPDATE_EVENT_RULE = OperationModel.new(
        name: "UpdateEventRule",
        http_method: "PUT",
        request_uri: "/event-rules/{arn}"
      )

      UPDATE_NOTIFICATION_CONFIGURATION = OperationModel.new(
        name: "UpdateNotificationConfiguration",
        http_method: "PUT",
        request_uri: "/notification-configurations/{arn}"
      )
    end
  end
end
