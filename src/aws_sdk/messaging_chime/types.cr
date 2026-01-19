require "json"
require "time"

module AwsSdk
  module ChimeSDKMessaging
    module Types

      # Summary of the membership details of an AppInstanceUser .
      struct AppInstanceUserMembershipSummary
        include JSON::Serializable

        # The time at which an AppInstanceUser last marked a channel as read.
        @[JSON::Field(key: "ReadMarkerTimestamp")]
        getter read_marker_timestamp : Time?

        # The ID of the SubChannel that the AppInstanceUser is a member of.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The type of ChannelMembership .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @read_marker_timestamp : Time? = nil,
          @sub_channel_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct AssociateChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String

        # The AppInstanceUserArn of the user making the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @channel_flow_arn : String,
          @chime_bearer : String
        )
        end
      end

      # The input parameters don't match the service's restrictions.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The membership information, including member ARNs, the channel ARN, and membership types.
      struct BatchChannelMemberships
        include JSON::Serializable

        # The ARN of the channel to which you're adding members.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The identifier of the member who invited another member.
        @[JSON::Field(key: "InvitedBy")]
        getter invited_by : Types::Identity?

        # The users successfully added to the request.
        @[JSON::Field(key: "Members")]
        getter members : Array(Types::Identity)?

        # The ID of the SubChannel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The membership types set for the channel members.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @channel_arn : String? = nil,
          @invited_by : Types::Identity? = nil,
          @members : Array(Types::Identity)? = nil,
          @sub_channel_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A list of failed member ARNs, error codes, and error messages.
      struct BatchCreateChannelMembershipError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The AppInstanceUserArn of the member that the service couldn't add.
        @[JSON::Field(key: "MemberArn")]
        getter member_arn : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @member_arn : String? = nil
        )
        end
      end

      struct BatchCreateChannelMembershipRequest
        include JSON::Serializable

        # The ARN of the channel to which you're adding users or bots.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ARNs of the members you want to add to the channel. Only AppInstanceUsers and AppInstanceBots
        # can be added as a channel member.
        @[JSON::Field(key: "MemberArns")]
        getter member_arns : Array(String)

        # The ID of the SubChannel in the request. Only required when creating membership in a SubChannel for
        # a moderator in an elastic channel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The membership type of a user, DEFAULT or HIDDEN . Default members are always returned as part of
        # ListChannelMemberships . Hidden members are only returned if the type filter in
        # ListChannelMemberships equals HIDDEN . Otherwise hidden members are not returned. This is only
        # supported by moderators.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arns : Array(String),
          @sub_channel_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct BatchCreateChannelMembershipResponse
        include JSON::Serializable

        # The list of channel memberships in the response.
        @[JSON::Field(key: "BatchChannelMemberships")]
        getter batch_channel_memberships : Types::BatchChannelMemberships?

        # If the action fails for one or more of the memberships in the request, a list of the memberships is
        # returned, along with error codes and error messages.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchCreateChannelMembershipError)?

        def initialize(
          @batch_channel_memberships : Types::BatchChannelMemberships? = nil,
          @errors : Array(Types::BatchCreateChannelMembershipError)? = nil
        )
        end
      end

      # The details of a channel.
      struct Channel
        include JSON::Serializable

        # The ARN of a channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String?

        # The AppInstanceUser who created the channel.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::Identity?

        # The time at which the AppInstanceUser created the channel.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The attributes required to configure and create an elastic channel. An elastic channel can support a
        # maximum of 1-million members.
        @[JSON::Field(key: "ElasticChannelConfiguration")]
        getter elastic_channel_configuration : Types::ElasticChannelConfiguration?

        # Settings that control when a channel expires.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        # The time at which a member sent the last message in the channel.
        @[JSON::Field(key: "LastMessageTimestamp")]
        getter last_message_timestamp : Time?

        # The time at which a channel was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The channel's metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The mode of the channel.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The name of a channel.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The channel's privacy setting.
        @[JSON::Field(key: "Privacy")]
        getter privacy : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_flow_arn : String? = nil,
          @created_by : Types::Identity? = nil,
          @created_timestamp : Time? = nil,
          @elastic_channel_configuration : Types::ElasticChannelConfiguration? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil,
          @last_message_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @metadata : String? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @privacy : String? = nil
        )
        end
      end

      # Summary of details of a channel associated with channel flow.
      struct ChannelAssociatedWithFlowSummary
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The channel's metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The mode of the channel.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The channel's privacy setting.
        @[JSON::Field(key: "Privacy")]
        getter privacy : String?

        def initialize(
          @channel_arn : String? = nil,
          @metadata : String? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @privacy : String? = nil
        )
        end
      end

      # The details of a channel ban.
      struct ChannelBan
        include JSON::Serializable

        # The ARN of the channel from which a member is being banned.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The AppInstanceUser who created the ban.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::Identity?

        # The time at which the ban was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The member being banned from the channel.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        def initialize(
          @channel_arn : String? = nil,
          @created_by : Types::Identity? = nil,
          @created_timestamp : Time? = nil,
          @member : Types::Identity? = nil
        )
        end
      end

      # Summary of the details of a ChannelBan .
      struct ChannelBanSummary
        include JSON::Serializable

        # The member being banned from a channel.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        def initialize(
          @member : Types::Identity? = nil
        )
        end
      end

      # The details of a channel flow.
      struct ChannelFlow
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String?

        # The time at which the channel flow was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a channel flow was updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the processor Lambda functions.
        @[JSON::Field(key: "Processors")]
        getter processors : Array(Types::Processor)?

        def initialize(
          @channel_flow_arn : String? = nil,
          @created_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @name : String? = nil,
          @processors : Array(Types::Processor)? = nil
        )
        end
      end

      struct ChannelFlowCallbackRequest
        include JSON::Serializable

        # The identifier passed to the processor by the service when invoked. Use the identifier to call back
        # the service.
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Stores information about the processed message.
        @[JSON::Field(key: "ChannelMessage")]
        getter channel_message : Types::ChannelMessageCallback

        # When a processor determines that a message needs to be DENIED , pass this parameter with a value of
        # true.
        @[JSON::Field(key: "DeleteResource")]
        getter delete_resource : Bool?

        def initialize(
          @callback_id : String,
          @channel_arn : String,
          @channel_message : Types::ChannelMessageCallback,
          @delete_resource : Bool? = nil
        )
        end
      end

      struct ChannelFlowCallbackResponse
        include JSON::Serializable

        # The call back ID passed in the request.
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String?

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        def initialize(
          @callback_id : String? = nil,
          @channel_arn : String? = nil
        )
        end
      end

      # Summary of details of a channel flow.
      struct ChannelFlowSummary
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String?

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Information about the processor Lambda functions.
        @[JSON::Field(key: "Processors")]
        getter processors : Array(Types::Processor)?

        def initialize(
          @channel_flow_arn : String? = nil,
          @name : String? = nil,
          @processors : Array(Types::Processor)? = nil
        )
        end
      end

      # The details of a channel member.
      struct ChannelMembership
        include JSON::Serializable

        # The ARN of the member's channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The time at which the channel membership was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The identifier of the member who invited another member.
        @[JSON::Field(key: "InvitedBy")]
        getter invited_by : Types::Identity?

        # The time at which a channel membership was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The data of the channel member.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        # The ID of the SubChannel that a user belongs to.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The membership type set for the channel member.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @channel_arn : String? = nil,
          @created_timestamp : Time? = nil,
          @invited_by : Types::Identity? = nil,
          @last_updated_timestamp : Time? = nil,
          @member : Types::Identity? = nil,
          @sub_channel_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary of the channel membership details of an AppInstanceUser .
      struct ChannelMembershipForAppInstanceUserSummary
        include JSON::Serializable

        # Returns the channel membership data for an AppInstance .
        @[JSON::Field(key: "AppInstanceUserMembershipSummary")]
        getter app_instance_user_membership_summary : Types::AppInstanceUserMembershipSummary?

        # Returns the channel data for an AppInstance .
        @[JSON::Field(key: "ChannelSummary")]
        getter channel_summary : Types::ChannelSummary?

        def initialize(
          @app_instance_user_membership_summary : Types::AppInstanceUserMembershipSummary? = nil,
          @channel_summary : Types::ChannelSummary? = nil
        )
        end
      end

      # The channel membership preferences for an AppInstanceUser .
      struct ChannelMembershipPreferences
        include JSON::Serializable

        # The push notification configuration of a message.
        @[JSON::Field(key: "PushNotifications")]
        getter push_notifications : Types::PushNotificationPreferences?

        def initialize(
          @push_notifications : Types::PushNotificationPreferences? = nil
        )
        end
      end

      # Summary of the details of a ChannelMembership .
      struct ChannelMembershipSummary
        include JSON::Serializable

        # A member's summary data.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        def initialize(
          @member : Types::Identity? = nil
        )
        end
      end

      # The details of a message in a channel.
      struct ChannelMessage
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The content of the channel message. For Amazon Lex V2 bot responses, this field holds a list of
        # messages originating from the bot. For more information, refer to Processing responses from an
        # AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "Content")]
        getter content : String?

        # The content type of the channel message. For Amazon Lex V2 bot responses, the content type is
        # application/amz-chime-lex-msgs for success responses and application/amz-chime-lex-error for failure
        # responses. For more information, refer to Processing responses from an AppInstanceBot in the Amazon
        # Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The time at which the message was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a message was edited.
        @[JSON::Field(key: "LastEditedTimestamp")]
        getter last_edited_timestamp : Time?

        # The time at which a message was updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped
        # to specific fields from the bot. For more information, refer to Processing responses from an
        # AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # The ID of a message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The message metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The persistence setting for a channel message.
        @[JSON::Field(key: "Persistence")]
        getter persistence : String?

        # Hides the content of a message.
        @[JSON::Field(key: "Redacted")]
        getter redacted : Bool?

        # The message sender.
        @[JSON::Field(key: "Sender")]
        getter sender : Types::Identity?

        # The status of the channel message.
        @[JSON::Field(key: "Status")]
        getter status : Types::ChannelMessageStatusStructure?

        # The ID of the SubChannel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The target of a message, a sender, a user, or a bot. Only the target and the sender can view
        # targeted messages. Only users who can see targeted messages can take actions on them. However,
        # administrators can delete targeted messages that they can’t see.
        @[JSON::Field(key: "Target")]
        getter target : Array(Types::Target)?

        # The message type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @channel_arn : String? = nil,
          @content : String? = nil,
          @content_type : String? = nil,
          @created_timestamp : Time? = nil,
          @last_edited_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_id : String? = nil,
          @metadata : String? = nil,
          @persistence : String? = nil,
          @redacted : Bool? = nil,
          @sender : Types::Identity? = nil,
          @status : Types::ChannelMessageStatusStructure? = nil,
          @sub_channel_id : String? = nil,
          @target : Array(Types::Target)? = nil,
          @type : String? = nil
        )
        end
      end

      # Stores information about a callback.
      struct ChannelMessageCallback
        include JSON::Serializable

        # The message ID.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        # The message content. For Amazon Lex V2 bot responses, this field holds a list of messages
        # originating from the bot. For more information, refer to Processing responses from an AppInstanceBot
        # in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "Content")]
        getter content : String?

        # The content type of the call-back message. For Amazon Lex V2 bot responses, the content type is
        # application/amz-chime-lex-msgs for success responses and application/amz-chime-lex-error for failure
        # responses. For more information, refer to Processing responses from an AppInstanceBot in the Amazon
        # Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped
        # to specific fields from the bot. For more information, refer to Processing responses from an
        # AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # The message metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The push notification configuration of the message.
        @[JSON::Field(key: "PushNotification")]
        getter push_notification : Types::PushNotificationConfiguration?

        # The ID of the SubChannel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @message_id : String,
          @content : String? = nil,
          @content_type : String? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @metadata : String? = nil,
          @push_notification : Types::PushNotificationConfiguration? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      # Stores information about a message status.
      struct ChannelMessageStatusStructure
        include JSON::Serializable

        # Contains more details about the message status.
        @[JSON::Field(key: "Detail")]
        getter detail : String?

        # The message status value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @detail : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Summary of the messages in a Channel .
      struct ChannelMessageSummary
        include JSON::Serializable

        # The content of the channel message. For Amazon Lex V2 bot responses, this field holds a list of
        # messages originating from the bot. For more information, refer to Processing responses from an
        # AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "Content")]
        getter content : String?

        # The content type of the channel message listed in the summary. For Amazon Lex V2 bot responses, the
        # content type is application/amz-chime-lex-msgs for success responses and
        # application/amz-chime-lex-error for failure responses. For more information, refer to Processing
        # responses from an AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The time at which the message summary was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a message was last edited.
        @[JSON::Field(key: "LastEditedTimestamp")]
        getter last_edited_timestamp : Time?

        # The time at which a message was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The attributes for the channel message. For Amazon Lex V2 bot responses, the attributes are mapped
        # to specific fields from the bot. For more information, refer to Processing responses from an
        # AppInstanceBot in the Amazon Chime SDK Messaging Developer Guide .
        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # The ID of the message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The metadata of the message.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # Indicates whether a message was redacted.
        @[JSON::Field(key: "Redacted")]
        getter redacted : Bool?

        # The message sender.
        @[JSON::Field(key: "Sender")]
        getter sender : Types::Identity?

        # The message status. The status value is SENT for messages sent to a channel without a channel flow.
        # For channels associated with channel flow, the value determines the processing stage.
        @[JSON::Field(key: "Status")]
        getter status : Types::ChannelMessageStatusStructure?

        # The target of a message, a sender, a user, or a bot. Only the target and the sender can view
        # targeted messages. Only users who can see targeted messages can take actions on them. However,
        # administrators can delete targeted messages that they can’t see.
        @[JSON::Field(key: "Target")]
        getter target : Array(Types::Target)?

        # The type of message.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @content_type : String? = nil,
          @created_timestamp : Time? = nil,
          @last_edited_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_id : String? = nil,
          @metadata : String? = nil,
          @redacted : Bool? = nil,
          @sender : Types::Identity? = nil,
          @status : Types::ChannelMessageStatusStructure? = nil,
          @target : Array(Types::Target)? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary of the details of a moderated channel.
      struct ChannelModeratedByAppInstanceUserSummary
        include JSON::Serializable

        # Summary of the details of a Channel .
        @[JSON::Field(key: "ChannelSummary")]
        getter channel_summary : Types::ChannelSummary?

        def initialize(
          @channel_summary : Types::ChannelSummary? = nil
        )
        end
      end

      # The details of a channel moderator.
      struct ChannelModerator
        include JSON::Serializable

        # The ARN of the moderator's channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The AppInstanceUser who created the moderator.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::Identity?

        # The time at which the moderator was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The moderator's data.
        @[JSON::Field(key: "Moderator")]
        getter moderator : Types::Identity?

        def initialize(
          @channel_arn : String? = nil,
          @created_by : Types::Identity? = nil,
          @created_timestamp : Time? = nil,
          @moderator : Types::Identity? = nil
        )
        end
      end

      # Summary of the details of a ChannelModerator .
      struct ChannelModeratorSummary
        include JSON::Serializable

        # The data for a moderator.
        @[JSON::Field(key: "Moderator")]
        getter moderator : Types::Identity?

        def initialize(
          @moderator : Types::Identity? = nil
        )
        end
      end

      # Summary of the details of a Channel .
      struct ChannelSummary
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The time at which the last persistent message visible to the caller in a channel was sent.
        @[JSON::Field(key: "LastMessageTimestamp")]
        getter last_message_timestamp : Time?

        # The metadata of the channel.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The mode of the channel.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The name of the channel.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The privacy setting of the channel.
        @[JSON::Field(key: "Privacy")]
        getter privacy : String?

        def initialize(
          @channel_arn : String? = nil,
          @last_message_timestamp : Time? = nil,
          @metadata : String? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @privacy : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct CreateChannelBanRequest
        include JSON::Serializable

        # The ARN of the ban request.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member being banned.
        @[JSON::Field(key: "MemberArn")]
        getter member_arn : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String
        )
        end
      end

      struct CreateChannelBanResponse
        include JSON::Serializable

        # The ARN of the response to the ban request.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ChannelArn and BannedIdentity of the member in the ban response.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        def initialize(
          @channel_arn : String? = nil,
          @member : Types::Identity? = nil
        )
        end
      end

      struct CreateChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel flow request.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String

        # The client token for the request. An Idempotency token.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Information about the processor Lambda functions.
        @[JSON::Field(key: "Processors")]
        getter processors : Array(Types::Processor)

        # The tags for the creation request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app_instance_arn : String,
          @client_request_token : String,
          @name : String,
          @processors : Array(Types::Processor),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateChannelFlowResponse
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String?

        def initialize(
          @channel_flow_arn : String? = nil
        )
        end
      end

      struct CreateChannelMembershipRequest
        include JSON::Serializable

        # The ARN of the channel to which you're adding users.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member you want to add to the channel.
        @[JSON::Field(key: "MemberArn")]
        getter member_arn : String

        # The membership type of a user, DEFAULT or HIDDEN . Default members are always returned as part of
        # ListChannelMemberships . Hidden members are only returned if the type filter in
        # ListChannelMemberships equals HIDDEN . Otherwise hidden members are not returned. This is only
        # supported by moderators.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The ID of the SubChannel in the request. Only required when creating membership in a SubChannel for
        # a moderator in an elastic channel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String,
          @type : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct CreateChannelMembershipResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ARN and metadata of the member being added.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        # The ID of the SubChannel in the response.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String? = nil,
          @member : Types::Identity? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct CreateChannelModeratorRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The AppInstanceUserArn of the moderator.
        @[JSON::Field(key: "ChannelModeratorArn")]
        getter channel_moderator_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @channel_moderator_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct CreateChannelModeratorResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ARNs of the channel and the moderator.
        @[JSON::Field(key: "ChannelModerator")]
        getter channel_moderator : Types::Identity?

        def initialize(
          @channel_arn : String? = nil,
          @channel_moderator : Types::Identity? = nil
        )
        end
      end

      struct CreateChannelRequest
        include JSON::Serializable

        # The ARN of the channel request.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The client token for the request. An Idempotency token.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The name of the channel.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An ID for the channel being created. If you do not specify an ID, a UUID will be created for the
        # channel.
        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String?

        # The attributes required to configure and create an elastic channel. An elastic channel can support a
        # maximum of 1-million users, excluding moderators.
        @[JSON::Field(key: "ElasticChannelConfiguration")]
        getter elastic_channel_configuration : Types::ElasticChannelConfiguration?

        # Settings that control the interval after which the channel is automatically deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        # The ARNs of the channel members in the request.
        @[JSON::Field(key: "MemberArns")]
        getter member_arns : Array(String)?

        # The metadata of the creation request. Limited to 1KB and UTF-8.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The channel mode: UNRESTRICTED or RESTRICTED . Administrators, moderators, and channel members can
        # add themselves and other members to unrestricted channels. Only administrators and moderators can
        # add members to restricted channels.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The ARNs of the channel moderators in the request.
        @[JSON::Field(key: "ModeratorArns")]
        getter moderator_arns : Array(String)?

        # The channel's privacy level: PUBLIC or PRIVATE . Private channels aren't discoverable by users
        # outside the channel. Public channels are discoverable by anyone in the AppInstance .
        @[JSON::Field(key: "Privacy")]
        getter privacy : String?

        # The tags for the creation request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app_instance_arn : String,
          @chime_bearer : String,
          @client_request_token : String,
          @name : String,
          @channel_id : String? = nil,
          @elastic_channel_configuration : Types::ElasticChannelConfiguration? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil,
          @member_arns : Array(String)? = nil,
          @metadata : String? = nil,
          @mode : String? = nil,
          @moderator_arns : Array(String)? = nil,
          @privacy : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateChannelResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        def initialize(
          @channel_arn : String? = nil
        )
        end
      end

      struct DeleteChannelBanRequest
        include JSON::Serializable

        # The ARN of the channel from which the AppInstanceUser was banned.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ARN of the AppInstanceUser that you want to reinstate.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String
        )
        end
      end

      struct DeleteChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "channelFlowArn")]
        getter channel_flow_arn : String

        def initialize(
          @channel_flow_arn : String
        )
        end
      end

      struct DeleteChannelMembershipRequest
        include JSON::Serializable

        # The ARN of the channel from which you want to remove the user.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member that you're removing from the channel.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        # The ID of the SubChannel in the request. Only for use by moderators.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct DeleteChannelMessageRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ID of the message being deleted.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The ID of the SubChannel in the request. Only required when deleting messages in a SubChannel that
        # the user belongs to.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @message_id : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct DeleteChannelModeratorRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The AppInstanceUserArn of the moderator being deleted.
        @[JSON::Field(key: "channelModeratorArn")]
        getter channel_moderator_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @channel_moderator_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DeleteChannelRequest
        include JSON::Serializable

        # The ARN of the channel being deleted.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DeleteMessagingStreamingConfigurationsRequest
        include JSON::Serializable

        # The ARN of the streaming configurations being deleted.
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_arn : String
        )
        end
      end

      struct DescribeChannelBanRequest
        include JSON::Serializable

        # The ARN of the channel from which the user is banned.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member being banned.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String
        )
        end
      end

      struct DescribeChannelBanResponse
        include JSON::Serializable

        # The details of the ban.
        @[JSON::Field(key: "ChannelBan")]
        getter channel_ban : Types::ChannelBan?

        def initialize(
          @channel_ban : Types::ChannelBan? = nil
        )
        end
      end

      struct DescribeChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "channelFlowArn")]
        getter channel_flow_arn : String

        def initialize(
          @channel_flow_arn : String
        )
        end
      end

      struct DescribeChannelFlowResponse
        include JSON::Serializable

        # The channel flow details.
        @[JSON::Field(key: "ChannelFlow")]
        getter channel_flow : Types::ChannelFlow?

        def initialize(
          @channel_flow : Types::ChannelFlow? = nil
        )
        end
      end

      struct DescribeChannelMembershipForAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the user or bot in a channel.
        @[JSON::Field(key: "app-instance-user-arn")]
        getter app_instance_user_arn : String

        # The ARN of the channel to which the user belongs.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @app_instance_user_arn : String,
          @channel_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DescribeChannelMembershipForAppInstanceUserResponse
        include JSON::Serializable

        # The channel to which a user belongs.
        @[JSON::Field(key: "ChannelMembership")]
        getter channel_membership : Types::ChannelMembershipForAppInstanceUserSummary?

        def initialize(
          @channel_membership : Types::ChannelMembershipForAppInstanceUserSummary? = nil
        )
        end
      end

      struct DescribeChannelMembershipRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        # The ID of the SubChannel in the request. The response contains an ElasticChannelConfiguration
        # object. Only required to get a user’s SubChannel membership details.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct DescribeChannelMembershipResponse
        include JSON::Serializable

        # The details of the membership.
        @[JSON::Field(key: "ChannelMembership")]
        getter channel_membership : Types::ChannelMembership?

        def initialize(
          @channel_membership : Types::ChannelMembership? = nil
        )
        end
      end

      struct DescribeChannelModeratedByAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the user or bot in the moderated channel.
        @[JSON::Field(key: "app-instance-user-arn")]
        getter app_instance_user_arn : String

        # The ARN of the moderated channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @app_instance_user_arn : String,
          @channel_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DescribeChannelModeratedByAppInstanceUserResponse
        include JSON::Serializable

        # The moderated channel.
        @[JSON::Field(key: "Channel")]
        getter channel : Types::ChannelModeratedByAppInstanceUserSummary?

        def initialize(
          @channel : Types::ChannelModeratedByAppInstanceUserSummary? = nil
        )
        end
      end

      struct DescribeChannelModeratorRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The AppInstanceUserArn of the channel moderator.
        @[JSON::Field(key: "channelModeratorArn")]
        getter channel_moderator_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @channel_moderator_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DescribeChannelModeratorResponse
        include JSON::Serializable

        # The details of the channel moderator.
        @[JSON::Field(key: "ChannelModerator")]
        getter channel_moderator : Types::ChannelModerator?

        def initialize(
          @channel_moderator : Types::ChannelModerator? = nil
        )
        end
      end

      struct DescribeChannelRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct DescribeChannelResponse
        include JSON::Serializable

        # The channel details.
        @[JSON::Field(key: "Channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end

      struct DisassociateChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the channel flow.
        @[JSON::Field(key: "channelFlowArn")]
        getter channel_flow_arn : String

        # The AppInstanceUserArn of the user making the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @channel_flow_arn : String,
          @chime_bearer : String
        )
        end
      end

      # The attributes required to configure and create an elastic channel. An elastic channel can support a
      # maximum of 1-million members.
      struct ElasticChannelConfiguration
        include JSON::Serializable

        # The maximum number of SubChannels that you want to allow in the elastic channel.
        @[JSON::Field(key: "MaximumSubChannels")]
        getter maximum_sub_channels : Int32

        # The minimum allowed percentage of TargetMembershipsPerSubChannel users. Ceil of the calculated value
        # is used in balancing members among SubChannels of the elastic channel.
        @[JSON::Field(key: "MinimumMembershipPercentage")]
        getter minimum_membership_percentage : Int32

        # The maximum number of members allowed in a SubChannel.
        @[JSON::Field(key: "TargetMembershipsPerSubChannel")]
        getter target_memberships_per_sub_channel : Int32

        def initialize(
          @maximum_sub_channels : Int32,
          @minimum_membership_percentage : Int32,
          @target_memberships_per_sub_channel : Int32
        )
        end
      end

      # Settings that control the interval after which a channel is deleted.
      struct ExpirationSettings
        include JSON::Serializable

        # The conditions that must be met for a channel to expire.
        @[JSON::Field(key: "ExpirationCriterion")]
        getter expiration_criterion : String

        # The period in days after which the system automatically deletes a channel.
        @[JSON::Field(key: "ExpirationDays")]
        getter expiration_days : Int32

        def initialize(
          @expiration_criterion : String,
          @expiration_days : Int32
        )
        end
      end

      # The client is permanently forbidden from making the request.
      struct ForbiddenException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct GetChannelMembershipPreferencesRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The AppInstanceUserArn of the member retrieving the preferences.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String
        )
        end
      end

      struct GetChannelMembershipPreferencesResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The details of a user.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        # The channel membership preferences for an AppInstanceUser .
        @[JSON::Field(key: "Preferences")]
        getter preferences : Types::ChannelMembershipPreferences?

        def initialize(
          @channel_arn : String? = nil,
          @member : Types::Identity? = nil,
          @preferences : Types::ChannelMembershipPreferences? = nil
        )
        end
      end

      struct GetChannelMessageRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ID of the message.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The ID of the SubChannel in the request. Only required when getting messages in a SubChannel that
        # the user belongs to.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @message_id : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct GetChannelMessageResponse
        include JSON::Serializable

        # The details of and content in the message.
        @[JSON::Field(key: "ChannelMessage")]
        getter channel_message : Types::ChannelMessage?

        def initialize(
          @channel_message : Types::ChannelMessage? = nil
        )
        end
      end

      struct GetChannelMessageStatusRequest
        include JSON::Serializable

        # The ARN of the channel
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The AppInstanceUserArn of the user making the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ID of the message.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The ID of the SubChannel in the request. Only required when getting message status in a SubChannel
        # that the user belongs to.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @message_id : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct GetChannelMessageStatusResponse
        include JSON::Serializable

        # The message status and details.
        @[JSON::Field(key: "Status")]
        getter status : Types::ChannelMessageStatusStructure?

        def initialize(
          @status : Types::ChannelMessageStatusStructure? = nil
        )
        end
      end

      struct GetMessagingSessionEndpointRequest
        include JSON::Serializable

        # The type of network for the messaging session endpoint. Either IPv4 only or dual-stack (IPv4 and
        # IPv6).
        @[JSON::Field(key: "network-type")]
        getter network_type : String?

        def initialize(
          @network_type : String? = nil
        )
        end
      end

      struct GetMessagingSessionEndpointResponse
        include JSON::Serializable

        # The endpoint returned in the response.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::MessagingSessionEndpoint?

        def initialize(
          @endpoint : Types::MessagingSessionEndpoint? = nil
        )
        end
      end

      struct GetMessagingStreamingConfigurationsRequest
        include JSON::Serializable

        # The ARN of the streaming configurations.
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_arn : String
        )
        end
      end

      struct GetMessagingStreamingConfigurationsResponse
        include JSON::Serializable

        # The streaming settings.
        @[JSON::Field(key: "StreamingConfigurations")]
        getter streaming_configurations : Array(Types::StreamingConfiguration)?

        def initialize(
          @streaming_configurations : Array(Types::StreamingConfiguration)? = nil
        )
        end
      end

      # The details of a user or bot.
      struct Identity
        include JSON::Serializable

        # The ARN in an Identity.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name in an Identity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Stores metadata about a Lambda processor.
      struct LambdaConfiguration
        include JSON::Serializable

        # Controls how the Lambda function is invoked.
        @[JSON::Field(key: "InvocationType")]
        getter invocation_type : String

        # The ARN of the Lambda message processing function.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @invocation_type : String,
          @resource_arn : String
        )
        end
      end

      struct ListChannelBansRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of bans that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested bans are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelBansResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The information for each requested ban.
        @[JSON::Field(key: "ChannelBans")]
        getter channel_bans : Array(Types::ChannelBanSummary)?

        # The token passed by previous API calls until all requested bans are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_bans : Array(Types::ChannelBanSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelFlowsRequest
        include JSON::Serializable

        # The ARN of the app instance.
        @[JSON::Field(key: "app-instance-arn")]
        getter app_instance_arn : String

        # The maximum number of channel flows that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested channel flows are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelFlowsResponse
        include JSON::Serializable

        # The information about each channel flow.
        @[JSON::Field(key: "ChannelFlows")]
        getter channel_flows : Array(Types::ChannelFlowSummary)?

        # The token passed by previous API calls until all requested channels are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_flows : Array(Types::ChannelFlowSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelMembershipsForAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ARN of the user or bot.
        @[JSON::Field(key: "app-instance-user-arn")]
        getter app_instance_user_arn : String?

        # The maximum number of users that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token returned from previous API requests until the number of channel memberships is reached.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @chime_bearer : String,
          @app_instance_user_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelMembershipsForAppInstanceUserResponse
        include JSON::Serializable

        # The information for the requested channel memberships.
        @[JSON::Field(key: "ChannelMemberships")]
        getter channel_memberships : Array(Types::ChannelMembershipForAppInstanceUserSummary)?

        # The token passed by previous API calls until all requested users are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_memberships : Array(Types::ChannelMembershipForAppInstanceUserSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelMembershipsRequest
        include JSON::Serializable

        # The maximum number of channel memberships that you want returned.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of channel memberships that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested channel memberships are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The ID of the SubChannel in the request. Only required when listing a user's memberships in a
        # particular sub-channel of an elastic channel.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        # The membership type of a user, DEFAULT or HIDDEN . Default members are returned as part of
        # ListChannelMemberships if no type is specified. Hidden members are only returned if the type filter
        # in ListChannelMemberships equals HIDDEN .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sub_channel_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListChannelMembershipsResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The information for the requested channel memberships.
        @[JSON::Field(key: "ChannelMemberships")]
        getter channel_memberships : Array(Types::ChannelMembershipSummary)?

        # The token passed by previous API calls until all requested channel memberships are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_memberships : Array(Types::ChannelMembershipSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelMessagesRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of messages that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested messages are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The final or ending time stamp for your requested messages.
        @[JSON::Field(key: "not-after")]
        getter not_after : Time?

        # The initial or starting time stamp for your requested messages.
        @[JSON::Field(key: "not-before")]
        getter not_before : Time?

        # The order in which you want messages sorted. Default is Descending, based on time created.
        @[JSON::Field(key: "sort-order")]
        getter sort_order : String?

        # The ID of the SubChannel in the request. Only required when listing the messages in a SubChannel
        # that the user belongs to.
        @[JSON::Field(key: "sub-channel-id")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @sort_order : String? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct ListChannelMessagesResponse
        include JSON::Serializable

        # The ARN of the channel containing the requested messages.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The information about, and content of, each requested message.
        @[JSON::Field(key: "ChannelMessages")]
        getter channel_messages : Array(Types::ChannelMessageSummary)?

        # The token passed by previous API calls until all requested messages are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the SubChannel in the response.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_messages : Array(Types::ChannelMessageSummary)? = nil,
          @next_token : String? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct ListChannelModeratorsRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of moderators that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested moderators are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelModeratorsResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The information about and names of each moderator.
        @[JSON::Field(key: "ChannelModerators")]
        getter channel_moderators : Array(Types::ChannelModeratorSummary)?

        # The token passed by previous API calls until all requested moderators are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channel_arn : String? = nil,
          @channel_moderators : Array(Types::ChannelModeratorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsAssociatedWithChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "channel-flow-arn")]
        getter channel_flow_arn : String

        # The maximum number of channels that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested channels are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @channel_flow_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsAssociatedWithChannelFlowResponse
        include JSON::Serializable

        # The information about each channel.
        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::ChannelAssociatedWithFlowSummary)?

        # The token passed by previous API calls until all requested channels are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelAssociatedWithFlowSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsModeratedByAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ARN of the user or bot in the moderated channel.
        @[JSON::Field(key: "app-instance-user-arn")]
        getter app_instance_user_arn : String?

        # The maximum number of channels in the request.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token returned from previous API requests until the number of channels moderated by the user is
        # reached.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @chime_bearer : String,
          @app_instance_user_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsModeratedByAppInstanceUserResponse
        include JSON::Serializable

        # The moderated channels in the request.
        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::ChannelModeratedByAppInstanceUserSummary)?

        # The token returned from previous API requests until the number of channels moderated by the user is
        # reached.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelModeratedByAppInstanceUserSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "app-instance-arn")]
        getter app_instance_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of channels that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested channels are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The privacy setting. PUBLIC retrieves all the public channels. PRIVATE retrieves private channels.
        # Only an AppInstanceAdmin can retrieve private channels.
        @[JSON::Field(key: "privacy")]
        getter privacy : String?

        def initialize(
          @app_instance_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @privacy : String? = nil
        )
        end
      end

      struct ListChannelsResponse
        include JSON::Serializable

        # The information about each channel.
        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::ChannelSummary)?

        # The token returned from previous API requests until the number of channels is reached.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSubChannelsRequest
        include JSON::Serializable

        # The ARN of elastic channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The AppInstanceUserArn of the user making the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The maximum number of sub-channels that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested sub-channels are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSubChannelsResponse
        include JSON::Serializable

        # The ARN of elastic channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The token passed by previous API calls until all requested sub-channels are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The information about each sub-channel.
        @[JSON::Field(key: "SubChannels")]
        getter sub_channels : Array(Types::SubChannelSummary)?

        def initialize(
          @channel_arn : String? = nil,
          @next_token : String? = nil,
          @sub_channels : Array(Types::SubChannelSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tag key-value pairs.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A list of message attribute values.
      struct MessageAttributeValue
        include JSON::Serializable

        # The strings in a message attribute value.
        @[JSON::Field(key: "StringValues")]
        getter string_values : Array(String)?

        def initialize(
          @string_values : Array(String)? = nil
        )
        end
      end

      # The websocket endpoint used to connect to Amazon Chime SDK messaging.
      struct MessagingSessionEndpoint
        include JSON::Serializable

        # The endpoint to which you establish a websocket connection.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # One or more of the resources in the request does not exist in the system.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The information about a processor in a channel flow.
      struct Processor
        include JSON::Serializable

        # The information about the type of processor and its identifier.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ProcessorConfiguration

        # The sequence in which processors run. If you have multiple processors in a channel flow, message
        # processing goes through each processor in the sequence. The value determines the sequence. At this
        # point, we support only 1 processor within a flow.
        @[JSON::Field(key: "ExecutionOrder")]
        getter execution_order : Int32

        # Determines whether to continue with message processing or stop it in cases where communication with
        # a processor fails. If a processor has a fallback action of ABORT and communication with it fails,
        # the processor sets the message status to FAILED and does not send the message to any recipients.
        # Note that if the last processor in the channel flow sequence has a fallback action of CONTINUE and
        # communication with the processor fails, then the message is considered processed and sent to
        # recipients of the channel.
        @[JSON::Field(key: "FallbackAction")]
        getter fallback_action : String

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @configuration : Types::ProcessorConfiguration,
          @execution_order : Int32,
          @fallback_action : String,
          @name : String
        )
        end
      end

      # A processor's metadata.
      struct ProcessorConfiguration
        include JSON::Serializable

        # Indicates that the processor is of type Lambda.
        @[JSON::Field(key: "Lambda")]
        getter lambda : Types::LambdaConfiguration

        def initialize(
          @lambda : Types::LambdaConfiguration
        )
        end
      end

      # The push notification configuration of the message.
      struct PushNotificationConfiguration
        include JSON::Serializable

        # The body of the push notification.
        @[JSON::Field(key: "Body")]
        getter body : String?

        # The title of the push notification.
        @[JSON::Field(key: "Title")]
        getter title : String?

        # Enum value that indicates the type of the push notification for a message. DEFAULT : Normal mobile
        # push notification. VOIP : VOIP mobile push notification.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @body : String? = nil,
          @title : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The channel membership preferences for push notification.
      struct PushNotificationPreferences
        include JSON::Serializable

        # Enum value that indicates which push notifications to send to the requested member of a channel. ALL
        # sends all push notifications, NONE sends no push notifications, FILTERED sends only filtered push
        # notifications.
        @[JSON::Field(key: "AllowNotifications")]
        getter allow_notifications : String

        # The simple JSON object used to send a subset of a push notification to the requested member.
        @[JSON::Field(key: "FilterRule")]
        getter filter_rule : String?

        def initialize(
          @allow_notifications : String,
          @filter_rule : String? = nil
        )
        end
      end

      struct PutChannelExpirationSettingsRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String?

        # Settings that control the interval after which a channel is deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil
        )
        end
      end

      struct PutChannelExpirationSettingsResponse
        include JSON::Serializable

        # The channel ARN.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # Settings that control the interval after which a channel is deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        def initialize(
          @channel_arn : String? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil
        )
        end
      end

      struct PutChannelMembershipPreferencesRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ARN of the member setting the preferences.
        @[JSON::Field(key: "memberArn")]
        getter member_arn : String

        # The channel membership preferences of an AppInstanceUser .
        @[JSON::Field(key: "Preferences")]
        getter preferences : Types::ChannelMembershipPreferences

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @member_arn : String,
          @preferences : Types::ChannelMembershipPreferences
        )
        end
      end

      struct PutChannelMembershipPreferencesResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The details of a user.
        @[JSON::Field(key: "Member")]
        getter member : Types::Identity?

        # The ARN and metadata of the member being added.
        @[JSON::Field(key: "Preferences")]
        getter preferences : Types::ChannelMembershipPreferences?

        def initialize(
          @channel_arn : String? = nil,
          @member : Types::Identity? = nil,
          @preferences : Types::ChannelMembershipPreferences? = nil
        )
        end
      end

      struct PutMessagingStreamingConfigurationsRequest
        include JSON::Serializable

        # The ARN of the streaming configuration.
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        # The streaming configurations.
        @[JSON::Field(key: "StreamingConfigurations")]
        getter streaming_configurations : Array(Types::StreamingConfiguration)

        def initialize(
          @app_instance_arn : String,
          @streaming_configurations : Array(Types::StreamingConfiguration)
        )
        end
      end

      struct PutMessagingStreamingConfigurationsResponse
        include JSON::Serializable

        # The requested streaming configurations.
        @[JSON::Field(key: "StreamingConfigurations")]
        getter streaming_configurations : Array(Types::StreamingConfiguration)?

        def initialize(
          @streaming_configurations : Array(Types::StreamingConfiguration)? = nil
        )
        end
      end

      struct RedactChannelMessageRequest
        include JSON::Serializable

        # The ARN of the channel containing the messages that you want to redact.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The ID of the message being redacted.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The ID of the SubChannel in the request.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @message_id : String,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct RedactChannelMessageResponse
        include JSON::Serializable

        # The ARN of the channel containing the messages that you want to redact.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ID of the message being redacted.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The ID of the SubChannel in the response. Only required when redacting messages in a SubChannel that
        # the user belongs to.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String? = nil,
          @message_id : String? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      # The request exceeds the resource limit.
      struct ResourceLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct SearchChannelsRequest
        include JSON::Serializable

        # A list of the Field objects in the channel being searched.
        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::SearchField)

        # The AppInstanceUserArn of the user making the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String?

        # The maximum number of channels that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token returned from previous API requests until the number of channels is reached.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @fields : Array(Types::SearchField),
          @chime_bearer : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchChannelsResponse
        include JSON::Serializable

        # A list of the channels in the request.
        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::ChannelSummary)?

        # The token returned from previous API responses until the number of channels is reached.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A Field of the channel that you want to search. This operation isn't supported for AppInstanceUsers
      # with a large number of memberships.
      struct SearchField
        include JSON::Serializable

        # An enum value that indicates the key to search the channel on. MEMBERS allows you to search channels
        # based on memberships. You can use it with the EQUALS operator to get channels whose memberships are
        # equal to the specified values, and with the INCLUDES operator to get channels whose memberships
        # include the specified values.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The operator used to compare field values, currently EQUALS or INCLUDES . Use the EQUALS operator to
        # find channels whose memberships equal the specified values. Use the INCLUDES operator to find
        # channels whose memberships include the specified values.
        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values that you want to search for, a list of strings. The values must be AppInstanceUserArns
        # specified as a list of strings. This operation isn't supported for AppInstanceUsers with a large
        # number of memberships.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      struct SendChannelMessageRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The Idempotency token for each client request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The content of the channel message.
        @[JSON::Field(key: "Content")]
        getter content : String

        # Boolean that controls whether the message is persisted on the back end. Required.
        @[JSON::Field(key: "Persistence")]
        getter persistence : String

        # The type of message, STANDARD or CONTROL . STANDARD messages can be up to 4KB in size and contain
        # metadata. Metadata is arbitrary, and you can use it in a variety of ways, such as containing a link
        # to an attachment. CONTROL messages are limited to 30 bytes and do not contain metadata.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The content type of the channel message.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The attributes for the message, used for message filtering along with a FilterRule defined in the
        # PushNotificationPreferences .
        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # The optional metadata for each message.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The push notification configuration of the message.
        @[JSON::Field(key: "PushNotification")]
        getter push_notification : Types::PushNotificationConfiguration?

        # The ID of the SubChannel in the request.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        # The target of a message. Must be a member of the channel, such as another user, a bot, or the
        # sender. Only the target and the sender can view targeted messages. Only users who can see targeted
        # messages can take actions on them. However, administrators can delete targeted messages that they
        # can’t see.
        @[JSON::Field(key: "Target")]
        getter target : Array(Types::Target)?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @client_request_token : String,
          @content : String,
          @persistence : String,
          @type : String,
          @content_type : String? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @metadata : String? = nil,
          @push_notification : Types::PushNotificationConfiguration? = nil,
          @sub_channel_id : String? = nil,
          @target : Array(Types::Target)? = nil
        )
        end
      end

      struct SendChannelMessageResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ID string assigned to each message.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status of the channel message.
        @[JSON::Field(key: "Status")]
        getter status : Types::ChannelMessageStatusStructure?

        # The ID of the SubChannel in the response.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String? = nil,
          @message_id : String? = nil,
          @status : Types::ChannelMessageStatusStructure? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      # The service encountered an unexpected error.
      struct ServiceFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The service is currently unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The configuration for connecting a messaging stream to Amazon Kinesis.
      struct StreamingConfiguration
        include JSON::Serializable

        # The data type of the configuration.
        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # The ARN of the resource in the configuration.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @data_type : String,
          @resource_arn : String
        )
        end
      end

      # Summary of the sub-channels associated with the elastic channel.
      struct SubChannelSummary
        include JSON::Serializable

        # The number of members in a SubChannel.
        @[JSON::Field(key: "MembershipCount")]
        getter membership_count : Int32?

        # The unique ID of a SubChannel.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @membership_count : Int32? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      # A tag object containing a key-value pair.
      struct Tag
        include JSON::Serializable

        # The key in a tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value in a tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The resource ARN.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag key-value pairs.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # The target of a message, a sender, a user, or a bot. Only the target and the sender can view
      # targeted messages. Only users who can see targeted messages can take actions on them. However,
      # administrators can delete targeted messages that they can’t see.
      struct Target
        include JSON::Serializable

        # The ARN of the target channel member.
        @[JSON::Field(key: "MemberArn")]
        getter member_arn : String?

        def initialize(
          @member_arn : String? = nil
        )
        end
      end

      # The client exceeded its request rate limit.
      struct ThrottledClientException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The client is not currently authorized to make the request.
      struct UnauthorizedClientException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The resource ARN.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag keys.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateChannelFlowRequest
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "channelFlowArn")]
        getter channel_flow_arn : String

        # The name of the channel flow.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Information about the processor Lambda functions
        @[JSON::Field(key: "Processors")]
        getter processors : Array(Types::Processor)

        def initialize(
          @channel_flow_arn : String,
          @name : String,
          @processors : Array(Types::Processor)
        )
        end
      end

      struct UpdateChannelFlowResponse
        include JSON::Serializable

        # The ARN of the channel flow.
        @[JSON::Field(key: "ChannelFlowArn")]
        getter channel_flow_arn : String?

        def initialize(
          @channel_flow_arn : String? = nil
        )
        end
      end

      struct UpdateChannelMessageRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The content of the channel message.
        @[JSON::Field(key: "Content")]
        getter content : String

        # The ID string of the message being updated.
        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The content type of the channel message.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The metadata of the message being updated.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The ID of the SubChannel in the request. Only required when updating messages in a SubChannel that
        # the user belongs to.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @content : String,
          @message_id : String,
          @content_type : String? = nil,
          @metadata : String? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct UpdateChannelMessageResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The ID string of the message being updated.
        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status of the message update.
        @[JSON::Field(key: "Status")]
        getter status : Types::ChannelMessageStatusStructure?

        # The ID of the SubChannel in the response.
        @[JSON::Field(key: "SubChannelId")]
        getter sub_channel_id : String?

        def initialize(
          @channel_arn : String? = nil,
          @message_id : String? = nil,
          @status : Types::ChannelMessageStatusStructure? = nil,
          @sub_channel_id : String? = nil
        )
        end
      end

      struct UpdateChannelReadMarkerRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        def initialize(
          @channel_arn : String,
          @chime_bearer : String
        )
        end
      end

      struct UpdateChannelReadMarkerResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        def initialize(
          @channel_arn : String? = nil
        )
        end
      end

      struct UpdateChannelRequest
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ARN of the AppInstanceUser or AppInstanceBot that makes the API call.
        @[JSON::Field(key: "x-amz-chime-bearer")]
        getter chime_bearer : String

        # The metadata for the update request.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The mode of the update request.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The name of the channel.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @channel_arn : String,
          @chime_bearer : String,
          @metadata : String? = nil,
          @mode : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateChannelResponse
        include JSON::Serializable

        # The ARN of the channel.
        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        def initialize(
          @channel_arn : String? = nil
        )
        end
      end
    end
  end
end
