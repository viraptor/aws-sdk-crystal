require "json"
require "time"

module AwsSdk
  module ChimeSDKIdentity
    module Types

      # The details of an AppInstance , an instance of an Amazon Chime SDK messaging application.
      struct AppInstance
        include JSON::Serializable

        # The ARN of the messaging instance.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The time at which an AppInstance was created. In epoch milliseconds.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time an AppInstance was last updated. In epoch milliseconds.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The metadata of an AppInstance .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of an AppInstance .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_arn : String? = nil,
          @created_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @metadata : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The name and ARN of the admin for the AppInstance .
      struct AppInstanceAdmin
        include JSON::Serializable

        # The AppInstanceAdmin data.
        @[JSON::Field(key: "Admin")]
        getter admin : Types::Identity?

        # The ARN of the AppInstance for which the user is an administrator.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The time at which an administrator was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        def initialize(
          @admin : Types::Identity? = nil,
          @app_instance_arn : String? = nil,
          @created_timestamp : Time? = nil
        )
        end
      end

      # Summary of the details of an AppInstanceAdmin .
      struct AppInstanceAdminSummary
        include JSON::Serializable

        # The details of the AppInstanceAdmin .
        @[JSON::Field(key: "Admin")]
        getter admin : Types::Identity?

        def initialize(
          @admin : Types::Identity? = nil
        )
        end
      end

      # An Amazon Lex V2 chat bot created under an AppInstance .
      struct AppInstanceBot
        include JSON::Serializable

        # The ARN of the AppInstanceBot.
        @[JSON::Field(key: "AppInstanceBotArn")]
        getter app_instance_bot_arn : String?

        # The data processing instructions for an AppInstanceBot.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::Configuration?

        # The time at which the AppInstanceBot was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which the AppInstanceBot was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The metadata for an AppInstanceBot.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of the AppInstanceBot.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_bot_arn : String? = nil,
          @configuration : Types::Configuration? = nil,
          @created_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @metadata : String? = nil,
          @name : String? = nil
        )
        end
      end

      # High-level information about an AppInstanceBot.
      struct AppInstanceBotSummary
        include JSON::Serializable

        # The ARN of the AppInstanceBot.
        @[JSON::Field(key: "AppInstanceBotArn")]
        getter app_instance_bot_arn : String?

        # The metadata of the AppInstanceBot.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of the AppInstanceBox.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_bot_arn : String? = nil,
          @metadata : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The details of the data-retention settings for an AppInstance .
      struct AppInstanceRetentionSettings
        include JSON::Serializable

        # The length of time in days to retain the messages in a channel.
        @[JSON::Field(key: "ChannelRetentionSettings")]
        getter channel_retention_settings : Types::ChannelRetentionSettings?

        def initialize(
          @channel_retention_settings : Types::ChannelRetentionSettings? = nil
        )
        end
      end

      # Summary of the data for an AppInstance .
      struct AppInstanceSummary
        include JSON::Serializable

        # The AppInstance ARN.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The metadata of the AppInstance .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of the AppInstance .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_arn : String? = nil,
          @metadata : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The details of an AppInstanceUser .
      struct AppInstanceUser
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The time at which the AppInstanceUser was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The interval after which an AppInstanceUser is automatically deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        # The time at which the AppInstanceUser was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The metadata of the AppInstanceUser .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of the AppInstanceUser .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_user_arn : String? = nil,
          @created_timestamp : Time? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil,
          @last_updated_timestamp : Time? = nil,
          @metadata : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An endpoint under an Amazon Chime AppInstanceUser that receives messages for a user. For push
      # notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.
      struct AppInstanceUserEndpoint
        include JSON::Serializable

        # Boolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. ALL
        # indicates the endpoint will receive all messages. NONE indicates the endpoint will receive no
        # messages.
        @[JSON::Field(key: "AllowMessages")]
        getter allow_messages : String?

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The time at which an AppInstanceUserEndpoint was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The attributes of an Endpoint .
        @[JSON::Field(key: "EndpointAttributes")]
        getter endpoint_attributes : Types::EndpointAttributes?

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # A read-only field that represents the state of an AppInstanceUserEndpoint . Supported values: ACTIVE
        # : The AppInstanceUserEndpoint is active and able to receive messages. When ACTIVE , the
        # EndpointStatusReason remains empty. INACTIVE : The AppInstanceUserEndpoint is inactive and can't
        # receive message. When INACTIVE , the corresponding reason will be conveyed through
        # EndpointStatusReason . INVALID_DEVICE_TOKEN indicates that an AppInstanceUserEndpoint is INACTIVE
        # due to invalid device token INVALID_PINPOINT_ARN indicates that an AppInstanceUserEndpoint is
        # INACTIVE due to an invalid pinpoint ARN that was input through the ResourceArn field.
        @[JSON::Field(key: "EndpointState")]
        getter endpoint_state : Types::EndpointState?

        # The time at which an AppInstanceUserEndpoint was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The name of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the resource to which the endpoint belongs.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The type of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @allow_messages : String? = nil,
          @app_instance_user_arn : String? = nil,
          @created_timestamp : Time? = nil,
          @endpoint_attributes : Types::EndpointAttributes? = nil,
          @endpoint_id : String? = nil,
          @endpoint_state : Types::EndpointState? = nil,
          @last_updated_timestamp : Time? = nil,
          @name : String? = nil,
          @resource_arn : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary of the details of an AppInstanceUserEndpoint .
      struct AppInstanceUserEndpointSummary
        include JSON::Serializable

        # BBoolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. ALL
        # indicates the endpoint will receive all messages. NONE indicates the endpoint will receive no
        # messages.
        @[JSON::Field(key: "AllowMessages")]
        getter allow_messages : String?

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # A read-only field that represent the state of an AppInstanceUserEndpoint .
        @[JSON::Field(key: "EndpointState")]
        getter endpoint_state : Types::EndpointState?

        # The name of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @allow_messages : String? = nil,
          @app_instance_user_arn : String? = nil,
          @endpoint_id : String? = nil,
          @endpoint_state : Types::EndpointState? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary of the details of an AppInstanceUser .
      struct AppInstanceUserSummary
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The metadata of the AppInstanceUser .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The name of an AppInstanceUser .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_user_arn : String? = nil,
          @metadata : String? = nil,
          @name : String? = nil
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

      # The details of the retention settings for a channel.
      struct ChannelRetentionSettings
        include JSON::Serializable

        # The time in days to retain the messages in a channel.
        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        def initialize(
          @retention_days : Int32? = nil
        )
        end
      end

      # A structure that contains configuration data.
      struct Configuration
        include JSON::Serializable

        # The configuration for an Amazon Lex V2 bot.
        @[JSON::Field(key: "Lex")]
        getter lex : Types::LexConfiguration

        def initialize(
          @lex : Types::LexConfiguration
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

      struct CreateAppInstanceAdminRequest
        include JSON::Serializable

        # The ARN of the administrator of the current AppInstance .
        @[JSON::Field(key: "AppInstanceAdminArn")]
        getter app_instance_admin_arn : String

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_admin_arn : String,
          @app_instance_arn : String
        )
        end
      end

      struct CreateAppInstanceAdminResponse
        include JSON::Serializable

        # The ARN and name of the administrator, the ARN of the AppInstance , and the created and last-updated
        # timestamps. All timestamps use epoch milliseconds.
        @[JSON::Field(key: "AppInstanceAdmin")]
        getter app_instance_admin : Types::Identity?

        # The ARN of the of the admin for the AppInstance .
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        def initialize(
          @app_instance_admin : Types::Identity? = nil,
          @app_instance_arn : String? = nil
        )
        end
      end

      struct CreateAppInstanceBotRequest
        include JSON::Serializable

        # The ARN of the AppInstance request.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String

        # The unique ID for the client making the request. Use different tokens for different AppInstanceBots
        # .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # Configuration information about the Amazon Lex V2 V2 bot.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::Configuration

        # The request metadata. Limited to a 1KB string in UTF-8.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The user's name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags assigned to the AppInstanceBot .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app_instance_arn : String,
          @client_request_token : String,
          @configuration : Types::Configuration,
          @metadata : String? = nil,
          @name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAppInstanceBotResponse
        include JSON::Serializable

        # The ARN of the AppinstanceBot .
        @[JSON::Field(key: "AppInstanceBotArn")]
        getter app_instance_bot_arn : String?

        def initialize(
          @app_instance_bot_arn : String? = nil
        )
        end
      end

      struct CreateAppInstanceRequest
        include JSON::Serializable

        # The unique ID of the request. Use different tokens to create different AppInstances .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The name of the AppInstance .
        @[JSON::Field(key: "Name")]
        getter name : String

        # The metadata of the AppInstance . Limited to a 1KB string in UTF-8.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # Tags assigned to the AppInstance .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_request_token : String,
          @name : String,
          @metadata : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAppInstanceResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the AppInstance .
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        def initialize(
          @app_instance_arn : String? = nil
        )
        end
      end

      struct CreateAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the AppInstance request.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String

        # The user ID of the AppInstance .
        @[JSON::Field(key: "AppInstanceUserId")]
        getter app_instance_user_id : String

        # The unique ID of the request. Use different tokens to request additional AppInstances .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The user's name.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Settings that control the interval after which the AppInstanceUser is automatically deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        # The request's metadata. Limited to a 1KB string in UTF-8.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # Tags assigned to the AppInstanceUser .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app_instance_arn : String,
          @app_instance_user_id : String,
          @client_request_token : String,
          @name : String,
          @expiration_settings : Types::ExpirationSettings? = nil,
          @metadata : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAppInstanceUserResponse
        include JSON::Serializable

        # The user's ARN.
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        def initialize(
          @app_instance_user_arn : String? = nil
        )
        end
      end

      struct DeleteAppInstanceAdminRequest
        include JSON::Serializable

        # The ARN of the AppInstance 's administrator.
        @[JSON::Field(key: "appInstanceAdminArn")]
        getter app_instance_admin_arn : String

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_admin_arn : String,
          @app_instance_arn : String
        )
        end
      end

      struct DeleteAppInstanceBotRequest
        include JSON::Serializable

        # The ARN of the AppInstanceBot being deleted.
        @[JSON::Field(key: "appInstanceBotArn")]
        getter app_instance_bot_arn : String

        def initialize(
          @app_instance_bot_arn : String
        )
        end
      end

      struct DeleteAppInstanceRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_arn : String
        )
        end
      end

      struct DeleteAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the user request being deleted.
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        def initialize(
          @app_instance_user_arn : String
        )
        end
      end

      struct DeregisterAppInstanceUserEndpointRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        def initialize(
          @app_instance_user_arn : String,
          @endpoint_id : String
        )
        end
      end

      struct DescribeAppInstanceAdminRequest
        include JSON::Serializable

        # The ARN of the AppInstanceAdmin .
        @[JSON::Field(key: "appInstanceAdminArn")]
        getter app_instance_admin_arn : String

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_admin_arn : String,
          @app_instance_arn : String
        )
        end
      end

      struct DescribeAppInstanceAdminResponse
        include JSON::Serializable

        # The ARN and name of the AppInstanceUser , the ARN of the AppInstance , and the created and
        # last-updated timestamps. All timestamps use epoch milliseconds.
        @[JSON::Field(key: "AppInstanceAdmin")]
        getter app_instance_admin : Types::AppInstanceAdmin?

        def initialize(
          @app_instance_admin : Types::AppInstanceAdmin? = nil
        )
        end
      end

      struct DescribeAppInstanceBotRequest
        include JSON::Serializable

        # The ARN of the AppInstanceBot .
        @[JSON::Field(key: "appInstanceBotArn")]
        getter app_instance_bot_arn : String

        def initialize(
          @app_instance_bot_arn : String
        )
        end
      end

      struct DescribeAppInstanceBotResponse
        include JSON::Serializable

        # The detials of the AppInstanceBot .
        @[JSON::Field(key: "AppInstanceBot")]
        getter app_instance_bot : Types::AppInstanceBot?

        def initialize(
          @app_instance_bot : Types::AppInstanceBot? = nil
        )
        end
      end

      struct DescribeAppInstanceRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_arn : String
        )
        end
      end

      struct DescribeAppInstanceResponse
        include JSON::Serializable

        # The ARN, metadata, created and last-updated timestamps, and the name of the AppInstance . All
        # timestamps use epoch milliseconds.
        @[JSON::Field(key: "AppInstance")]
        getter app_instance : Types::AppInstance?

        def initialize(
          @app_instance : Types::AppInstance? = nil
        )
        end
      end

      struct DescribeAppInstanceUserEndpointRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        def initialize(
          @app_instance_user_arn : String,
          @endpoint_id : String
        )
        end
      end

      struct DescribeAppInstanceUserEndpointResponse
        include JSON::Serializable

        # The full details of an AppInstanceUserEndpoint : the AppInstanceUserArn , ID, name, type, resource
        # ARN, attributes, allow messages, state, and created and last updated timestamps. All timestamps use
        # epoch milliseconds.
        @[JSON::Field(key: "AppInstanceUserEndpoint")]
        getter app_instance_user_endpoint : Types::AppInstanceUserEndpoint?

        def initialize(
          @app_instance_user_endpoint : Types::AppInstanceUserEndpoint? = nil
        )
        end
      end

      struct DescribeAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        def initialize(
          @app_instance_user_arn : String
        )
        end
      end

      struct DescribeAppInstanceUserResponse
        include JSON::Serializable

        # The name of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUser")]
        getter app_instance_user : Types::AppInstanceUser?

        def initialize(
          @app_instance_user : Types::AppInstanceUser? = nil
        )
        end
      end

      # The attributes of an Endpoint .
      struct EndpointAttributes
        include JSON::Serializable

        # The device token for the GCM, APNS, and APNS_SANDBOX endpoint types.
        @[JSON::Field(key: "DeviceToken")]
        getter device_token : String

        # The VOIP device token for the APNS and APNS_SANDBOX endpoint types.
        @[JSON::Field(key: "VoipDeviceToken")]
        getter voip_device_token : String?

        def initialize(
          @device_token : String,
          @voip_device_token : String? = nil
        )
        end
      end

      # A read-only field that represents the state of an AppInstanceUserEndpoint . Supported values: ACTIVE
      # : The AppInstanceUserEndpoint is active and able to receive messages. When ACTIVE , the
      # EndpointStatusReason remains empty. INACTIVE : The AppInstanceUserEndpoint is inactive and can't
      # receive message. When INACTIVE, the corresponding reason will be conveyed through
      # EndpointStatusReason. INVALID_DEVICE_TOKEN indicates that an AppInstanceUserEndpoint is INACTIVE due
      # to invalid device token INVALID_PINPOINT_ARN indicates that an AppInstanceUserEndpoint is INACTIVE
      # due to an invalid pinpoint ARN that was input through the ResourceArn field.
      struct EndpointState
        include JSON::Serializable

        # Enum that indicates the Status of an AppInstanceUserEndpoint .
        @[JSON::Field(key: "Status")]
        getter status : String

        # The reason for the EndpointStatus .
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @status_reason : String? = nil
        )
        end
      end

      # Determines the interval after which an AppInstanceUser is automatically deleted.
      struct ExpirationSettings
        include JSON::Serializable

        # Specifies the conditions under which an AppInstanceUser will expire.
        @[JSON::Field(key: "ExpirationCriterion")]
        getter expiration_criterion : String

        # The period in days after which an AppInstanceUser will be automatically deleted.
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

      struct GetAppInstanceRetentionSettingsRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        def initialize(
          @app_instance_arn : String
        )
        end
      end

      struct GetAppInstanceRetentionSettingsResponse
        include JSON::Serializable

        # The retention settings for the AppInstance .
        @[JSON::Field(key: "AppInstanceRetentionSettings")]
        getter app_instance_retention_settings : Types::AppInstanceRetentionSettings?

        # The timestamp representing the time at which the specified items are retained, in Epoch Seconds.
        @[JSON::Field(key: "InitiateDeletionTimestamp")]
        getter initiate_deletion_timestamp : Time?

        def initialize(
          @app_instance_retention_settings : Types::AppInstanceRetentionSettings? = nil,
          @initiate_deletion_timestamp : Time? = nil
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

      # Specifies the type of message that triggers a bot.
      struct InvokedBy
        include JSON::Serializable

        # Sets standard messages as the bot trigger. For standard messages: ALL : The bot processes all
        # standard messages. AUTO : The bot responds to ALL messages when the channel has one other non-hidden
        # member, and responds to MENTIONS when the channel has more than one other non-hidden member.
        # MENTIONS : The bot processes all standard messages that have a message attribute with CHIME.mentions
        # and a value of the bot ARN. NONE : The bot processes no standard messages.
        @[JSON::Field(key: "StandardMessages")]
        getter standard_messages : String

        # Sets targeted messages as the bot trigger. For targeted messages: ALL : The bot processes all
        # TargetedMessages sent to it. The bot then responds with a targeted message back to the sender. NONE
        # : The bot processes no targeted messages.
        @[JSON::Field(key: "TargetedMessages")]
        getter targeted_messages : String

        def initialize(
          @standard_messages : String,
          @targeted_messages : String
        )
        end
      end

      # The configuration for an Amazon Lex V2 bot.
      struct LexConfiguration
        include JSON::Serializable

        # The ARN of the Amazon Lex V2 bot's alias. The ARN uses this format:
        # arn:aws:lex:REGION:ACCOUNT:bot-alias/MYBOTID/MYBOTALIAS
        @[JSON::Field(key: "LexBotAliasArn")]
        getter lex_bot_alias_arn : String

        # Identifies the Amazon Lex V2 bot's language and locale. The string must match one of the supported
        # locales in Amazon Lex V2. All of the intents, slot types, and slots used in the bot must have the
        # same locale. For more information, see Supported languages in the Amazon Lex V2 Developer Guide .
        @[JSON::Field(key: "LocaleId")]
        getter locale_id : String

        # Specifies the type of message that triggers a bot.
        @[JSON::Field(key: "InvokedBy")]
        getter invoked_by : Types::InvokedBy?

        # Deprecated . Use InvokedBy instead. Determines whether the Amazon Lex V2 bot responds to all
        # standard messages. Control messages are not supported.
        @[JSON::Field(key: "RespondsTo")]
        getter responds_to : String?

        # The name of the welcome intent configured in the Amazon Lex V2 bot.
        @[JSON::Field(key: "WelcomeIntent")]
        getter welcome_intent : String?

        def initialize(
          @lex_bot_alias_arn : String,
          @locale_id : String,
          @invoked_by : Types::InvokedBy? = nil,
          @responds_to : String? = nil,
          @welcome_intent : String? = nil
        )
        end
      end

      struct ListAppInstanceAdminsRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        # The maximum number of administrators that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token returned from previous API requests until the number of administrators is reached.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceAdminsResponse
        include JSON::Serializable

        # The information for each administrator.
        @[JSON::Field(key: "AppInstanceAdmins")]
        getter app_instance_admins : Array(Types::AppInstanceAdminSummary)?

        # The ARN of the AppInstance .
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The token returned from previous API requests until the number of administrators is reached.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_instance_admins : Array(Types::AppInstanceAdminSummary)? = nil,
          @app_instance_arn : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceBotsRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "app-instance-arn")]
        getter app_instance_arn : String

        # The maximum number of requests to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested bots are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceBotsResponse
        include JSON::Serializable

        # The ARN of the AppInstance.
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The information for each requested AppInstanceBot .
        @[JSON::Field(key: "AppInstanceBots")]
        getter app_instance_bots : Array(Types::AppInstanceBotSummary)?

        # The token passed by previous API calls until all requested bots are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String? = nil,
          @app_instance_bots : Array(Types::AppInstanceBotSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceUserEndpointsRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The maximum number of endpoints that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested endpoints are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @app_instance_user_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceUserEndpointsResponse
        include JSON::Serializable

        # The information for each requested AppInstanceUserEndpoint .
        @[JSON::Field(key: "AppInstanceUserEndpoints")]
        getter app_instance_user_endpoints : Array(Types::AppInstanceUserEndpointSummary)?

        # The token passed by previous API calls until all requested endpoints are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_instance_user_endpoints : Array(Types::AppInstanceUserEndpointSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceUsersRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "app-instance-arn")]
        getter app_instance_arn : String

        # The maximum number of requests that you want returned.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API calls until all requested users are returned.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstanceUsersResponse
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        # The information for each requested AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUsers")]
        getter app_instance_users : Array(Types::AppInstanceUserSummary)?

        # The token passed by previous API calls until all requested users are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_instance_arn : String? = nil,
          @app_instance_users : Array(Types::AppInstanceUserSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstancesRequest
        include JSON::Serializable

        # The maximum number of AppInstance s that you want to return.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token passed by previous API requests until you reach the maximum number of AppInstances .
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppInstancesResponse
        include JSON::Serializable

        # The information for each AppInstance .
        @[JSON::Field(key: "AppInstances")]
        getter app_instances : Array(Types::AppInstanceSummary)?

        # The token passed by previous API requests until the maximum number of AppInstance s is reached.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_instances : Array(Types::AppInstanceSummary)? = nil,
          @next_token : String? = nil
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

      struct PutAppInstanceRetentionSettingsRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        # The time in days to retain data. Data type: number.
        @[JSON::Field(key: "AppInstanceRetentionSettings")]
        getter app_instance_retention_settings : Types::AppInstanceRetentionSettings

        def initialize(
          @app_instance_arn : String,
          @app_instance_retention_settings : Types::AppInstanceRetentionSettings
        )
        end
      end

      struct PutAppInstanceRetentionSettingsResponse
        include JSON::Serializable

        # The time in days to retain data. Data type: number.
        @[JSON::Field(key: "AppInstanceRetentionSettings")]
        getter app_instance_retention_settings : Types::AppInstanceRetentionSettings?

        # The time at which the API deletes data.
        @[JSON::Field(key: "InitiateDeletionTimestamp")]
        getter initiate_deletion_timestamp : Time?

        def initialize(
          @app_instance_retention_settings : Types::AppInstanceRetentionSettings? = nil,
          @initiate_deletion_timestamp : Time? = nil
        )
        end
      end

      struct PutAppInstanceUserExpirationSettingsRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # Settings that control the interval after which an AppInstanceUser is automatically deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        def initialize(
          @app_instance_user_arn : String,
          @expiration_settings : Types::ExpirationSettings? = nil
        )
        end
      end

      struct PutAppInstanceUserExpirationSettingsResponse
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # Settings that control the interval after which an AppInstanceUser is automatically deleted.
        @[JSON::Field(key: "ExpirationSettings")]
        getter expiration_settings : Types::ExpirationSettings?

        def initialize(
          @app_instance_user_arn : String? = nil,
          @expiration_settings : Types::ExpirationSettings? = nil
        )
        end
      end

      struct RegisterAppInstanceUserEndpointRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The unique ID assigned to the request. Use different tokens to register other endpoints.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The attributes of an Endpoint .
        @[JSON::Field(key: "EndpointAttributes")]
        getter endpoint_attributes : Types::EndpointAttributes

        # The ARN of the resource to which the endpoint belongs.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The type of the AppInstanceUserEndpoint . Supported types: APNS : The mobile notification service
        # for an Apple device. APNS_SANDBOX : The sandbox environment of the mobile notification service for
        # an Apple device. GCM : The mobile notification service for an Android device. Populate the
        # ResourceArn value of each type as PinpointAppArn .
        @[JSON::Field(key: "Type")]
        getter type : String

        # Boolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. ALL
        # indicates the endpoint receives all messages. NONE indicates the endpoint receives no messages.
        @[JSON::Field(key: "AllowMessages")]
        getter allow_messages : String?

        # The name of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_user_arn : String,
          @client_request_token : String,
          @endpoint_attributes : Types::EndpointAttributes,
          @resource_arn : String,
          @type : String,
          @allow_messages : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct RegisterAppInstanceUserEndpointResponse
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @app_instance_user_arn : String? = nil,
          @endpoint_id : String? = nil
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

      struct UpdateAppInstanceBotRequest
        include JSON::Serializable

        # The ARN of the AppInstanceBot .
        @[JSON::Field(key: "appInstanceBotArn")]
        getter app_instance_bot_arn : String

        # The metadata of the AppInstanceBot .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String

        # The name of the AppInstanceBot .
        @[JSON::Field(key: "Name")]
        getter name : String

        # The configuration for the bot update.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::Configuration?

        def initialize(
          @app_instance_bot_arn : String,
          @metadata : String,
          @name : String,
          @configuration : Types::Configuration? = nil
        )
        end
      end

      struct UpdateAppInstanceBotResponse
        include JSON::Serializable

        # The ARN of the AppInstanceBot .
        @[JSON::Field(key: "AppInstanceBotArn")]
        getter app_instance_bot_arn : String?

        def initialize(
          @app_instance_bot_arn : String? = nil
        )
        end
      end

      struct UpdateAppInstanceRequest
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "appInstanceArn")]
        getter app_instance_arn : String

        # The metadata that you want to change.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String

        # The name that you want to change.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @app_instance_arn : String,
          @metadata : String,
          @name : String
        )
        end
      end

      struct UpdateAppInstanceResponse
        include JSON::Serializable

        # The ARN of the AppInstance .
        @[JSON::Field(key: "AppInstanceArn")]
        getter app_instance_arn : String?

        def initialize(
          @app_instance_arn : String? = nil
        )
        end
      end

      struct UpdateAppInstanceUserEndpointRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        # Boolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. ALL
        # indicates the endpoint will receive all messages. NONE indicates the endpoint will receive no
        # messages.
        @[JSON::Field(key: "AllowMessages")]
        getter allow_messages : String?

        # The name of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @app_instance_user_arn : String,
          @endpoint_id : String,
          @allow_messages : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateAppInstanceUserEndpointResponse
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        # The unique identifier of the AppInstanceUserEndpoint .
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @app_instance_user_arn : String? = nil,
          @endpoint_id : String? = nil
        )
        end
      end

      struct UpdateAppInstanceUserRequest
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "appInstanceUserArn")]
        getter app_instance_user_arn : String

        # The metadata of the AppInstanceUser .
        @[JSON::Field(key: "Metadata")]
        getter metadata : String

        # The name of the AppInstanceUser .
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @app_instance_user_arn : String,
          @metadata : String,
          @name : String
        )
        end
      end

      struct UpdateAppInstanceUserResponse
        include JSON::Serializable

        # The ARN of the AppInstanceUser .
        @[JSON::Field(key: "AppInstanceUserArn")]
        getter app_instance_user_arn : String?

        def initialize(
          @app_instance_user_arn : String? = nil
        )
        end
      end
    end
  end
end
