module Aws
  module ChimeSDKMessaging
    module Model
      API_VERSION = "2021-05-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "messaging-chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://messaging-chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://messaging-chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://messaging-chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://messaging-chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CHANNEL_FLOW = OperationModel.new(
        name: "AssociateChannelFlow",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}/channel-flow"
      )

      BATCH_CREATE_CHANNEL_MEMBERSHIP = OperationModel.new(
        name: "BatchCreateChannelMembership",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/memberships?operation=batch-create"
      )

      CHANNEL_FLOW_CALLBACK = OperationModel.new(
        name: "ChannelFlowCallback",
        http_method: "POST",
        request_uri: "/channels/{channelArn}?operation=channel-flow-callback"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/channels"
      )

      CREATE_CHANNEL_BAN = OperationModel.new(
        name: "CreateChannelBan",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/bans"
      )

      CREATE_CHANNEL_FLOW = OperationModel.new(
        name: "CreateChannelFlow",
        http_method: "POST",
        request_uri: "/channel-flows"
      )

      CREATE_CHANNEL_MEMBERSHIP = OperationModel.new(
        name: "CreateChannelMembership",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/memberships"
      )

      CREATE_CHANNEL_MODERATOR = OperationModel.new(
        name: "CreateChannelModerator",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/moderators"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}"
      )

      DELETE_CHANNEL_BAN = OperationModel.new(
        name: "DeleteChannelBan",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}/bans/{memberArn}"
      )

      DELETE_CHANNEL_FLOW = OperationModel.new(
        name: "DeleteChannelFlow",
        http_method: "DELETE",
        request_uri: "/channel-flows/{channelFlowArn}"
      )

      DELETE_CHANNEL_MEMBERSHIP = OperationModel.new(
        name: "DeleteChannelMembership",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}/memberships/{memberArn}"
      )

      DELETE_CHANNEL_MESSAGE = OperationModel.new(
        name: "DeleteChannelMessage",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}/messages/{messageId}"
      )

      DELETE_CHANNEL_MODERATOR = OperationModel.new(
        name: "DeleteChannelModerator",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}/moderators/{channelModeratorArn}"
      )

      DELETE_MESSAGING_STREAMING_CONFIGURATIONS = OperationModel.new(
        name: "DeleteMessagingStreamingConfigurations",
        http_method: "DELETE",
        request_uri: "/app-instances/{appInstanceArn}/streaming-configurations"
      )

      DESCRIBE_CHANNEL = OperationModel.new(
        name: "DescribeChannel",
        http_method: "GET",
        request_uri: "/channels/{channelArn}"
      )

      DESCRIBE_CHANNEL_BAN = OperationModel.new(
        name: "DescribeChannelBan",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/bans/{memberArn}"
      )

      DESCRIBE_CHANNEL_FLOW = OperationModel.new(
        name: "DescribeChannelFlow",
        http_method: "GET",
        request_uri: "/channel-flows/{channelFlowArn}"
      )

      DESCRIBE_CHANNEL_MEMBERSHIP = OperationModel.new(
        name: "DescribeChannelMembership",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/memberships/{memberArn}"
      )

      DESCRIBE_CHANNEL_MEMBERSHIP_FOR_APP_INSTANCE_USER = OperationModel.new(
        name: "DescribeChannelMembershipForAppInstanceUser",
        http_method: "GET",
        request_uri: "/channels/{channelArn}?scope=app-instance-user-membership"
      )

      DESCRIBE_CHANNEL_MODERATED_BY_APP_INSTANCE_USER = OperationModel.new(
        name: "DescribeChannelModeratedByAppInstanceUser",
        http_method: "GET",
        request_uri: "/channels/{channelArn}?scope=app-instance-user-moderated-channel"
      )

      DESCRIBE_CHANNEL_MODERATOR = OperationModel.new(
        name: "DescribeChannelModerator",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/moderators/{channelModeratorArn}"
      )

      DISASSOCIATE_CHANNEL_FLOW = OperationModel.new(
        name: "DisassociateChannelFlow",
        http_method: "DELETE",
        request_uri: "/channels/{channelArn}/channel-flow/{channelFlowArn}"
      )

      GET_CHANNEL_MEMBERSHIP_PREFERENCES = OperationModel.new(
        name: "GetChannelMembershipPreferences",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/memberships/{memberArn}/preferences"
      )

      GET_CHANNEL_MESSAGE = OperationModel.new(
        name: "GetChannelMessage",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/messages/{messageId}"
      )

      GET_CHANNEL_MESSAGE_STATUS = OperationModel.new(
        name: "GetChannelMessageStatus",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/messages/{messageId}?scope=message-status"
      )

      GET_MESSAGING_SESSION_ENDPOINT = OperationModel.new(
        name: "GetMessagingSessionEndpoint",
        http_method: "GET",
        request_uri: "/endpoints/messaging-session"
      )

      GET_MESSAGING_STREAMING_CONFIGURATIONS = OperationModel.new(
        name: "GetMessagingStreamingConfigurations",
        http_method: "GET",
        request_uri: "/app-instances/{appInstanceArn}/streaming-configurations"
      )

      LIST_CHANNEL_BANS = OperationModel.new(
        name: "ListChannelBans",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/bans"
      )

      LIST_CHANNEL_FLOWS = OperationModel.new(
        name: "ListChannelFlows",
        http_method: "GET",
        request_uri: "/channel-flows"
      )

      LIST_CHANNEL_MEMBERSHIPS = OperationModel.new(
        name: "ListChannelMemberships",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/memberships"
      )

      LIST_CHANNEL_MEMBERSHIPS_FOR_APP_INSTANCE_USER = OperationModel.new(
        name: "ListChannelMembershipsForAppInstanceUser",
        http_method: "GET",
        request_uri: "/channels?scope=app-instance-user-memberships"
      )

      LIST_CHANNEL_MESSAGES = OperationModel.new(
        name: "ListChannelMessages",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/messages"
      )

      LIST_CHANNEL_MODERATORS = OperationModel.new(
        name: "ListChannelModerators",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/moderators"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channels"
      )

      LIST_CHANNELS_ASSOCIATED_WITH_CHANNEL_FLOW = OperationModel.new(
        name: "ListChannelsAssociatedWithChannelFlow",
        http_method: "GET",
        request_uri: "/channels?scope=channel-flow-associations"
      )

      LIST_CHANNELS_MODERATED_BY_APP_INSTANCE_USER = OperationModel.new(
        name: "ListChannelsModeratedByAppInstanceUser",
        http_method: "GET",
        request_uri: "/channels?scope=app-instance-user-moderated-channels"
      )

      LIST_SUB_CHANNELS = OperationModel.new(
        name: "ListSubChannels",
        http_method: "GET",
        request_uri: "/channels/{channelArn}/subchannels"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      PUT_CHANNEL_EXPIRATION_SETTINGS = OperationModel.new(
        name: "PutChannelExpirationSettings",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}/expiration-settings"
      )

      PUT_CHANNEL_MEMBERSHIP_PREFERENCES = OperationModel.new(
        name: "PutChannelMembershipPreferences",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}/memberships/{memberArn}/preferences"
      )

      PUT_MESSAGING_STREAMING_CONFIGURATIONS = OperationModel.new(
        name: "PutMessagingStreamingConfigurations",
        http_method: "PUT",
        request_uri: "/app-instances/{appInstanceArn}/streaming-configurations"
      )

      REDACT_CHANNEL_MESSAGE = OperationModel.new(
        name: "RedactChannelMessage",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/messages/{messageId}?operation=redact"
      )

      SEARCH_CHANNELS = OperationModel.new(
        name: "SearchChannels",
        http_method: "POST",
        request_uri: "/channels?operation=search"
      )

      SEND_CHANNEL_MESSAGE = OperationModel.new(
        name: "SendChannelMessage",
        http_method: "POST",
        request_uri: "/channels/{channelArn}/messages"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags?operation=tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/tags?operation=untag-resource"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}"
      )

      UPDATE_CHANNEL_FLOW = OperationModel.new(
        name: "UpdateChannelFlow",
        http_method: "PUT",
        request_uri: "/channel-flows/{channelFlowArn}"
      )

      UPDATE_CHANNEL_MESSAGE = OperationModel.new(
        name: "UpdateChannelMessage",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}/messages/{messageId}"
      )

      UPDATE_CHANNEL_READ_MARKER = OperationModel.new(
        name: "UpdateChannelReadMarker",
        http_method: "PUT",
        request_uri: "/channels/{channelArn}/readMarker"
      )
    end
  end
end
