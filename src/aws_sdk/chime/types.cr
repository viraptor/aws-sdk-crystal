require "json"
require "time"

module AwsSdk
  module Chime
    module Types

      # You don't have permissions to perform the requested operation.

      struct AccessDeniedException
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

      # The Amazon Chime account details. An AWS account can have multiple Amazon Chime accounts.

      struct Account
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The AWS account ID.

        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # The Amazon Chime account name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the account.

        @[JSON::Field(key: "AccountStatus")]
        getter account_status : String?

        # The Amazon Chime account type. For more information about different account types, see Managing Your
        # Amazon Chime Accounts in the Amazon Chime Administration Guide .

        @[JSON::Field(key: "AccountType")]
        getter account_type : String?

        # The Amazon Chime account creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The default license for the Amazon Chime account.

        @[JSON::Field(key: "DefaultLicense")]
        getter default_license : String?

        # The sign-in delegate groups associated with the account.

        @[JSON::Field(key: "SigninDelegateGroups")]
        getter signin_delegate_groups : Array(Types::SigninDelegateGroup)?

        # Supported licenses for the Amazon Chime account.

        @[JSON::Field(key: "SupportedLicenses")]
        getter supported_licenses : Array(String)?

        def initialize(
          @account_id : String,
          @aws_account_id : String,
          @name : String,
          @account_status : String? = nil,
          @account_type : String? = nil,
          @created_timestamp : Time? = nil,
          @default_license : String? = nil,
          @signin_delegate_groups : Array(Types::SigninDelegateGroup)? = nil,
          @supported_licenses : Array(String)? = nil
        )
        end
      end

      # Settings related to the Amazon Chime account. This includes settings that start or stop remote
      # control of shared screens, or start or stop the dial-out option in the Amazon Chime web application.
      # For more information about these settings, see Use the Policies Page in the Amazon Chime
      # Administration Guide .

      struct AccountSettings
        include JSON::Serializable

        # Setting that stops or starts remote control of shared screens during meetings.

        @[JSON::Field(key: "DisableRemoteControl")]
        getter disable_remote_control : Bool?

        # Setting that allows meeting participants to choose the Call me at a phone number option. For more
        # information, see Join a Meeting without the Amazon Chime App .

        @[JSON::Field(key: "EnableDialOut")]
        getter enable_dial_out : Bool?

        def initialize(
          @disable_remote_control : Bool? = nil,
          @enable_dial_out : Bool? = nil
        )
        end
      end

      # The Alexa for Business metadata associated with an Amazon Chime user, used to integrate Alexa for
      # Business with a device.

      struct AlexaForBusinessMetadata
        include JSON::Serializable

        # The ARN of the room resource.

        @[JSON::Field(key: "AlexaForBusinessRoomArn")]
        getter alexa_for_business_room_arn : String?

        # Starts or stops Alexa for Business.

        @[JSON::Field(key: "IsAlexaForBusinessEnabled")]
        getter is_alexa_for_business_enabled : Bool?

        def initialize(
          @alexa_for_business_room_arn : String? = nil,
          @is_alexa_for_business_enabled : Bool? = nil
        )
        end
      end


      struct AssociatePhoneNumberWithUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The phone number, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @e164_phone_number : String,
          @user_id : String
        )
        end
      end


      struct AssociatePhoneNumberWithUserResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateSigninDelegateGroupsWithAccountRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The sign-in delegate groups.

        @[JSON::Field(key: "SigninDelegateGroups")]
        getter signin_delegate_groups : Array(Types::SigninDelegateGroup)

        def initialize(
          @account_id : String,
          @signin_delegate_groups : Array(Types::SigninDelegateGroup)
        )
        end
      end


      struct AssociateSigninDelegateGroupsWithAccountResponse
        include JSON::Serializable

        def initialize
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


      struct BatchCreateRoomMembershipRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The list of membership items.

        @[JSON::Field(key: "MembershipItemList")]
        getter membership_item_list : Array(Types::MembershipItem)

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        def initialize(
          @account_id : String,
          @membership_item_list : Array(Types::MembershipItem),
          @room_id : String
        )
        end
      end


      struct BatchCreateRoomMembershipResponse
        include JSON::Serializable

        # If the action fails for one or more of the member IDs in the request, a list of the member IDs is
        # returned, along with error codes and error messages.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::MemberError)?

        def initialize(
          @errors : Array(Types::MemberError)? = nil
        )
        end
      end


      struct BatchDeletePhoneNumberRequest
        include JSON::Serializable

        # List of phone number IDs.

        @[JSON::Field(key: "PhoneNumberIds")]
        getter phone_number_ids : Array(String)

        def initialize(
          @phone_number_ids : Array(String)
        )
        end
      end


      struct BatchDeletePhoneNumberResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end


      struct BatchSuspendUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The request containing the user IDs to suspend.

        @[JSON::Field(key: "UserIdList")]
        getter user_id_list : Array(String)

        def initialize(
          @account_id : String,
          @user_id_list : Array(String)
        )
        end
      end


      struct BatchSuspendUserResponse
        include JSON::Serializable

        # If the BatchSuspendUser action fails for one or more of the user IDs in the request, a list of the
        # user IDs is returned, along with error codes and error messages.

        @[JSON::Field(key: "UserErrors")]
        getter user_errors : Array(Types::UserError)?

        def initialize(
          @user_errors : Array(Types::UserError)? = nil
        )
        end
      end


      struct BatchUnsuspendUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The request containing the user IDs to unsuspend.

        @[JSON::Field(key: "UserIdList")]
        getter user_id_list : Array(String)

        def initialize(
          @account_id : String,
          @user_id_list : Array(String)
        )
        end
      end


      struct BatchUnsuspendUserResponse
        include JSON::Serializable

        # If the BatchUnsuspendUser action fails for one or more of the user IDs in the request, a list of the
        # user IDs is returned, along with error codes and error messages.

        @[JSON::Field(key: "UserErrors")]
        getter user_errors : Array(Types::UserError)?

        def initialize(
          @user_errors : Array(Types::UserError)? = nil
        )
        end
      end


      struct BatchUpdatePhoneNumberRequest
        include JSON::Serializable

        # The request containing the phone number IDs and product types or calling names to update.

        @[JSON::Field(key: "UpdatePhoneNumberRequestItems")]
        getter update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)

        def initialize(
          @update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)
        )
        end
      end


      struct BatchUpdatePhoneNumberResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end


      struct BatchUpdateUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The request containing the user IDs and details to update.

        @[JSON::Field(key: "UpdateUserRequestItems")]
        getter update_user_request_items : Array(Types::UpdateUserRequestItem)

        def initialize(
          @account_id : String,
          @update_user_request_items : Array(Types::UpdateUserRequestItem)
        )
        end
      end


      struct BatchUpdateUserResponse
        include JSON::Serializable

        # If the BatchUpdateUser action fails for one or more of the user IDs in the request, a list of the
        # user IDs is returned, along with error codes and error messages.

        @[JSON::Field(key: "UserErrors")]
        getter user_errors : Array(Types::UserError)?

        def initialize(
          @user_errors : Array(Types::UserError)? = nil
        )
        end
      end

      # A resource that allows Enterprise account administrators to configure an interface to receive events
      # from Amazon Chime.

      struct Bot
        include JSON::Serializable

        # The bot email address.

        @[JSON::Field(key: "BotEmail")]
        getter bot_email : String?

        # The bot ID.

        @[JSON::Field(key: "BotId")]
        getter bot_id : String?

        # The bot type.

        @[JSON::Field(key: "BotType")]
        getter bot_type : String?

        # The bot creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # When true, the bot is stopped from running in your account.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The bot display name.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The security token used to authenticate Amazon Chime with the outgoing event endpoint.

        @[JSON::Field(key: "SecurityToken")]
        getter security_token : String?

        # The updated bot timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The unique ID for the bot user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @bot_email : String? = nil,
          @bot_id : String? = nil,
          @bot_type : String? = nil,
          @created_timestamp : Time? = nil,
          @disabled : Bool? = nil,
          @display_name : String? = nil,
          @security_token : String? = nil,
          @updated_timestamp : Time? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The Amazon Chime Business Calling settings for the administrator's AWS account. Includes any Amazon
      # S3 buckets designated for storing call detail records.

      struct BusinessCallingSettings
        include JSON::Serializable

        # The Amazon S3 bucket designated for call detail record storage.

        @[JSON::Field(key: "CdrBucket")]
        getter cdr_bucket : String?

        def initialize(
          @cdr_bucket : String? = nil
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

      # The retention settings that determine how long to retain conversation messages for an Amazon Chime
      # Enterprise account.

      struct ConversationRetentionSettings
        include JSON::Serializable

        # The number of days for which to retain conversation messages.

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        def initialize(
          @retention_days : Int32? = nil
        )
        end
      end


      struct CreateAccountRequest
        include JSON::Serializable

        # The name of the Amazon Chime account.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CreateAccountResponse
        include JSON::Serializable

        # The Amazon Chime account details.

        @[JSON::Field(key: "Account")]
        getter account : Types::Account?

        def initialize(
          @account : Types::Account? = nil
        )
        end
      end


      struct CreateBotRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot display name.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The domain of the Amazon Chime Enterprise account.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        def initialize(
          @account_id : String,
          @display_name : String,
          @domain : String? = nil
        )
        end
      end


      struct CreateBotResponse
        include JSON::Serializable

        # The bot details.

        @[JSON::Field(key: "Bot")]
        getter bot : Types::Bot?

        def initialize(
          @bot : Types::Bot? = nil
        )
        end
      end


      struct CreateMeetingDialOutRequest
        include JSON::Serializable

        # Phone number used as the caller ID when the remote party receives a call.

        @[JSON::Field(key: "FromPhoneNumber")]
        getter from_phone_number : String

        # Token used by the Amazon Chime SDK attendee. Call the CreateAttendee action to get a join token.

        @[JSON::Field(key: "JoinToken")]
        getter join_token : String

        # The Amazon Chime SDK meeting ID.

        @[JSON::Field(key: "meetingId")]
        getter meeting_id : String

        # Phone number called when inviting someone to a meeting.

        @[JSON::Field(key: "ToPhoneNumber")]
        getter to_phone_number : String

        def initialize(
          @from_phone_number : String,
          @join_token : String,
          @meeting_id : String,
          @to_phone_number : String
        )
        end
      end


      struct CreateMeetingDialOutResponse
        include JSON::Serializable

        # Unique ID that tracks API calls.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @transaction_id : String? = nil
        )
        end
      end


      struct CreatePhoneNumberOrderRequest
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The phone number product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String

        def initialize(
          @e164_phone_numbers : Array(String),
          @product_type : String
        )
        end
      end


      struct CreatePhoneNumberOrderResponse
        include JSON::Serializable

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrder")]
        getter phone_number_order : Types::PhoneNumberOrder?

        def initialize(
          @phone_number_order : Types::PhoneNumberOrder? = nil
        )
        end
      end


      struct CreateRoomMembershipRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The Amazon Chime member ID (user ID or bot ID).

        @[JSON::Field(key: "MemberId")]
        getter member_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        # The role of the member.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @account_id : String,
          @member_id : String,
          @room_id : String,
          @role : String? = nil
        )
        end
      end


      struct CreateRoomMembershipResponse
        include JSON::Serializable

        # The room membership details.

        @[JSON::Field(key: "RoomMembership")]
        getter room_membership : Types::RoomMembership?

        def initialize(
          @room_membership : Types::RoomMembership? = nil
        )
        end
      end


      struct CreateRoomRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The room name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The idempotency token for the request.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @account_id : String,
          @name : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct CreateRoomResponse
        include JSON::Serializable

        # The room details.

        @[JSON::Field(key: "Room")]
        getter room : Types::Room?

        def initialize(
          @room : Types::Room? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user's email address.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The user type.

        @[JSON::Field(key: "UserType")]
        getter user_type : String?

        # The user name.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @account_id : String,
          @email : String? = nil,
          @user_type : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct CreateUserResponse
        include JSON::Serializable

        # The user on the Amazon Chime account.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end


      struct DeleteAccountRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DeleteAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventsConfigurationRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @account_id : String,
          @bot_id : String
        )
        end
      end


      struct DeletePhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct DeleteRoomMembershipRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The member ID (user ID or bot ID).

        @[JSON::Field(key: "memberId")]
        getter member_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        def initialize(
          @account_id : String,
          @member_id : String,
          @room_id : String
        )
        end
      end


      struct DeleteRoomRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The chat room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        def initialize(
          @account_id : String,
          @room_id : String
        )
        end
      end


      struct DisassociatePhoneNumberFromUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @user_id : String
        )
        end
      end


      struct DisassociatePhoneNumberFromUserResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateSigninDelegateGroupsFromAccountRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The sign-in delegate group names.

        @[JSON::Field(key: "GroupNames")]
        getter group_names : Array(String)

        def initialize(
          @account_id : String,
          @group_names : Array(String)
        )
        end
      end


      struct DisassociateSigninDelegateGroupsFromAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration that allows a bot to receive outgoing events. Can be either an HTTPS endpoint or a
      # Lambda function ARN.

      struct EventsConfiguration
        include JSON::Serializable

        # The bot ID.

        @[JSON::Field(key: "BotId")]
        getter bot_id : String?

        # Lambda function ARN that allows a bot to receive outgoing events.

        @[JSON::Field(key: "LambdaFunctionArn")]
        getter lambda_function_arn : String?

        # HTTPS endpoint that allows a bot to receive outgoing events.

        @[JSON::Field(key: "OutboundEventsHTTPSEndpoint")]
        getter outbound_events_https_endpoint : String?

        def initialize(
          @bot_id : String? = nil,
          @lambda_function_arn : String? = nil,
          @outbound_events_https_endpoint : String? = nil
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


      struct GetAccountRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetAccountResponse
        include JSON::Serializable

        # The Amazon Chime account details.

        @[JSON::Field(key: "Account")]
        getter account : Types::Account?

        def initialize(
          @account : Types::Account? = nil
        )
        end
      end


      struct GetAccountSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetAccountSettingsResponse
        include JSON::Serializable

        # The Amazon Chime account settings.

        @[JSON::Field(key: "AccountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end


      struct GetBotRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @account_id : String,
          @bot_id : String
        )
        end
      end


      struct GetBotResponse
        include JSON::Serializable

        # The chat bot details.

        @[JSON::Field(key: "Bot")]
        getter bot : Types::Bot?

        def initialize(
          @bot : Types::Bot? = nil
        )
        end
      end


      struct GetEventsConfigurationRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @account_id : String,
          @bot_id : String
        )
        end
      end


      struct GetEventsConfigurationResponse
        include JSON::Serializable

        # The events configuration details.

        @[JSON::Field(key: "EventsConfiguration")]
        getter events_configuration : Types::EventsConfiguration?

        def initialize(
          @events_configuration : Types::EventsConfiguration? = nil
        )
        end
      end


      struct GetGlobalSettingsResponse
        include JSON::Serializable

        # The Amazon Chime Business Calling settings.

        @[JSON::Field(key: "BusinessCalling")]
        getter business_calling : Types::BusinessCallingSettings?

        # The Amazon Chime Voice Connector settings.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnectorSettings?

        def initialize(
          @business_calling : Types::BusinessCallingSettings? = nil,
          @voice_connector : Types::VoiceConnectorSettings? = nil
        )
        end
      end


      struct GetPhoneNumberOrderRequest
        include JSON::Serializable

        # The ID for the phone number order.

        @[JSON::Field(key: "phoneNumberOrderId")]
        getter phone_number_order_id : String

        def initialize(
          @phone_number_order_id : String
        )
        end
      end


      struct GetPhoneNumberOrderResponse
        include JSON::Serializable

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrder")]
        getter phone_number_order : Types::PhoneNumberOrder?

        def initialize(
          @phone_number_order : Types::PhoneNumberOrder? = nil
        )
        end
      end


      struct GetPhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct GetPhoneNumberResponse
        include JSON::Serializable

        # The phone number details.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end


      struct GetPhoneNumberSettingsResponse
        include JSON::Serializable

        # The default outbound calling name for the account.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The updated outbound calling name timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CallingNameUpdatedTimestamp")]
        getter calling_name_updated_timestamp : Time?

        def initialize(
          @calling_name : String? = nil,
          @calling_name_updated_timestamp : Time? = nil
        )
        end
      end


      struct GetRetentionSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetRetentionSettingsResponse
        include JSON::Serializable

        # The timestamp representing the time at which the specified items are permanently deleted, in ISO
        # 8601 format.

        @[JSON::Field(key: "InitiateDeletionTimestamp")]
        getter initiate_deletion_timestamp : Time?

        # The retention settings.

        @[JSON::Field(key: "RetentionSettings")]
        getter retention_settings : Types::RetentionSettings?

        def initialize(
          @initiate_deletion_timestamp : Time? = nil,
          @retention_settings : Types::RetentionSettings? = nil
        )
        end
      end


      struct GetRoomRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        def initialize(
          @account_id : String,
          @room_id : String
        )
        end
      end


      struct GetRoomResponse
        include JSON::Serializable

        # The room details.

        @[JSON::Field(key: "Room")]
        getter room : Types::Room?

        def initialize(
          @room : Types::Room? = nil
        )
        end
      end


      struct GetUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @user_id : String
        )
        end
      end


      struct GetUserResponse
        include JSON::Serializable

        # The user details.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end


      struct GetUserSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @user_id : String
        )
        end
      end


      struct GetUserSettingsResponse
        include JSON::Serializable

        # The user settings.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Types::UserSettings?

        def initialize(
          @user_settings : Types::UserSettings? = nil
        )
        end
      end

      # Invitation object returned after emailing users to invite them to join the Amazon Chime Team
      # account.

      struct Invite
        include JSON::Serializable

        # The email address to which the invite is sent.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The status of the invite email.

        @[JSON::Field(key: "EmailStatus")]
        getter email_status : String?

        # The invite ID.

        @[JSON::Field(key: "InviteId")]
        getter invite_id : String?

        # The status of the invite.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @email_address : String? = nil,
          @email_status : String? = nil,
          @invite_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct InviteUsersRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user email addresses to which to send the email invitation.

        @[JSON::Field(key: "UserEmailList")]
        getter user_email_list : Array(String)

        # The user type.

        @[JSON::Field(key: "UserType")]
        getter user_type : String?

        def initialize(
          @account_id : String,
          @user_email_list : Array(String),
          @user_type : String? = nil
        )
        end
      end


      struct InviteUsersResponse
        include JSON::Serializable

        # The email invitation details.

        @[JSON::Field(key: "Invites")]
        getter invites : Array(Types::Invite)?

        def initialize(
          @invites : Array(Types::Invite)? = nil
        )
        end
      end


      struct ListAccountsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. Defaults to 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # Amazon Chime account name prefix with which to filter results.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # User email address with which to filter results.

        @[JSON::Field(key: "user-email")]
        getter user_email : String?

        def initialize(
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @user_email : String? = nil
        )
        end
      end


      struct ListAccountsResponse
        include JSON::Serializable

        # List of Amazon Chime accounts and account details.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(Types::Account)?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(Types::Account)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The maximum number of results to return in a single call. The default is 10.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBotsResponse
        include JSON::Serializable

        # List of bots and bot details.

        @[JSON::Field(key: "Bots")]
        getter bots : Array(Types::Bot)?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @bots : Array(Types::Bot)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPhoneNumberOrdersRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPhoneNumberOrdersResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrders")]
        getter phone_number_orders : Array(Types::PhoneNumberOrder)?

        def initialize(
          @next_token : String? = nil,
          @phone_number_orders : Array(Types::PhoneNumberOrder)? = nil
        )
        end
      end


      struct ListPhoneNumbersRequest
        include JSON::Serializable

        # The filter to use to limit the number of results.

        @[JSON::Field(key: "filter-name")]
        getter filter_name : String?

        # The value to use for the filter.

        @[JSON::Field(key: "filter-value")]
        getter filter_value : String?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The phone number product type.

        @[JSON::Field(key: "product-type")]
        getter product_type : String?

        # The phone number status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @filter_name : String? = nil,
          @filter_value : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListPhoneNumbersResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The phone number details.

        @[JSON::Field(key: "PhoneNumbers")]
        getter phone_numbers : Array(Types::PhoneNumber)?

        def initialize(
          @next_token : String? = nil,
          @phone_numbers : Array(Types::PhoneNumber)? = nil
        )
        end
      end


      struct ListRoomMembershipsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @room_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoomMembershipsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The room membership details.

        @[JSON::Field(key: "RoomMemberships")]
        getter room_memberships : Array(Types::RoomMembership)?

        def initialize(
          @next_token : String? = nil,
          @room_memberships : Array(Types::RoomMembership)? = nil
        )
        end
      end


      struct ListRoomsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The member ID (user ID or bot ID).

        @[JSON::Field(key: "member-id")]
        getter member_id : String?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @member_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoomsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The room details.

        @[JSON::Field(key: "Rooms")]
        getter rooms : Array(Types::Room)?

        def initialize(
          @next_token : String? = nil,
          @rooms : Array(Types::Room)? = nil
        )
        end
      end


      struct ListSupportedPhoneNumberCountriesRequest
        include JSON::Serializable

        # The phone number product type.

        @[JSON::Field(key: "product-type")]
        getter product_type : String

        def initialize(
          @product_type : String
        )
        end
      end


      struct ListSupportedPhoneNumberCountriesResponse
        include JSON::Serializable

        # The supported phone number countries.

        @[JSON::Field(key: "PhoneNumberCountries")]
        getter phone_number_countries : Array(Types::PhoneNumberCountry)?

        def initialize(
          @phone_number_countries : Array(Types::PhoneNumberCountry)? = nil
        )
        end
      end


      struct ListUsersRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The maximum number of results to return in a single call. Defaults to 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # Optional. The user email address used to filter results. Maximum 1.

        @[JSON::Field(key: "user-email")]
        getter user_email : String?

        # The user type.

        @[JSON::Field(key: "user-type")]
        getter user_type : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_email : String? = nil,
          @user_type : String? = nil
        )
        end
      end


      struct ListUsersResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of users and user details.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end


      struct LogoutUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @user_id : String
        )
        end
      end


      struct LogoutUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The member details, such as email address, name, member ID, and member type.

      struct Member
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The member email address.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The member name.

        @[JSON::Field(key: "FullName")]
        getter full_name : String?

        # The member ID (user ID or bot ID).

        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # The member type.

        @[JSON::Field(key: "MemberType")]
        getter member_type : String?

        def initialize(
          @account_id : String? = nil,
          @email : String? = nil,
          @full_name : String? = nil,
          @member_id : String? = nil,
          @member_type : String? = nil
        )
        end
      end

      # The list of errors returned when a member action results in an error.

      struct MemberError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The member ID.

        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @member_id : String? = nil
        )
        end
      end

      # Membership details, such as member ID and member role.

      struct MembershipItem
        include JSON::Serializable

        # The member ID.

        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # The member role.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @member_id : String? = nil,
          @role : String? = nil
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

      # A phone number for which an order has been placed.

      struct OrderedPhoneNumber
        include JSON::Serializable

        # The phone number, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String?

        # The phone number status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @e164_phone_number : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A phone number used for Amazon Chime Business Calling or an Amazon Chime Voice Connector.

      struct PhoneNumber
        include JSON::Serializable

        # The phone number associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::PhoneNumberAssociation)?

        # The outbound calling name associated with the phone number.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The outbound calling name status.

        @[JSON::Field(key: "CallingNameStatus")]
        getter calling_name_status : String?

        # The phone number capabilities.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::PhoneNumberCapabilities?

        # The phone number country. Format: ISO 3166-1 alpha-2.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The phone number creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The deleted phone number timestamp, in ISO 8601 format.

        @[JSON::Field(key: "DeletionTimestamp")]
        getter deletion_timestamp : Time?

        # The phone number, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String?

        # The phone number ID.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The phone number product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        # The phone number status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The phone number type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The updated phone number timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @associations : Array(Types::PhoneNumberAssociation)? = nil,
          @calling_name : String? = nil,
          @calling_name_status : String? = nil,
          @capabilities : Types::PhoneNumberCapabilities? = nil,
          @country : String? = nil,
          @created_timestamp : Time? = nil,
          @deletion_timestamp : Time? = nil,
          @e164_phone_number : String? = nil,
          @phone_number_id : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The phone number associations, such as Amazon Chime account ID, Amazon Chime user ID, Amazon Chime
      # Voice Connector ID, or Amazon Chime Voice Connector group ID.

      struct PhoneNumberAssociation
        include JSON::Serializable

        # The timestamp of the phone number association, in ISO 8601 format.

        @[JSON::Field(key: "AssociatedTimestamp")]
        getter associated_timestamp : Time?

        # Defines the association with an Amazon Chime account ID, user ID, Amazon Chime Voice Connector ID,
        # or Amazon Chime Voice Connector group ID.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Contains the ID for the entity specified in Name.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @associated_timestamp : Time? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The phone number capabilities for Amazon Chime Business Calling phone numbers, such as enabled
      # inbound and outbound calling and text messaging.

      struct PhoneNumberCapabilities
        include JSON::Serializable

        # Allows or denies inbound calling for the specified phone number.

        @[JSON::Field(key: "InboundCall")]
        getter inbound_call : Bool?

        # Allows or denies inbound MMS messaging for the specified phone number.

        @[JSON::Field(key: "InboundMMS")]
        getter inbound_mms : Bool?

        # Allows or denies inbound SMS messaging for the specified phone number.

        @[JSON::Field(key: "InboundSMS")]
        getter inbound_sms : Bool?

        # Allows or denies outbound calling for the specified phone number.

        @[JSON::Field(key: "OutboundCall")]
        getter outbound_call : Bool?

        # Allows or denies outbound MMS messaging for the specified phone number.

        @[JSON::Field(key: "OutboundMMS")]
        getter outbound_mms : Bool?

        # Allows or denies outbound SMS messaging for the specified phone number.

        @[JSON::Field(key: "OutboundSMS")]
        getter outbound_sms : Bool?

        def initialize(
          @inbound_call : Bool? = nil,
          @inbound_mms : Bool? = nil,
          @inbound_sms : Bool? = nil,
          @outbound_call : Bool? = nil,
          @outbound_mms : Bool? = nil,
          @outbound_sms : Bool? = nil
        )
        end
      end

      # The phone number country.

      struct PhoneNumberCountry
        include JSON::Serializable

        # The phone number country code. Format: ISO 3166-1 alpha-2.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # The supported phone number types.

        @[JSON::Field(key: "SupportedPhoneNumberTypes")]
        getter supported_phone_number_types : Array(String)?

        def initialize(
          @country_code : String? = nil,
          @supported_phone_number_types : Array(String)? = nil
        )
        end
      end

      # If the phone number action fails for one or more of the phone numbers in the request, a list of the
      # phone numbers is returned, along with error codes and error messages.

      struct PhoneNumberError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The phone number ID for which the action failed.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @phone_number_id : String? = nil
        )
        end
      end

      # The details of a phone number order created for Amazon Chime.

      struct PhoneNumberOrder
        include JSON::Serializable

        # The phone number order creation time stamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ordered phone number details, such as the phone number in E.164 format and the phone number
        # status.

        @[JSON::Field(key: "OrderedPhoneNumbers")]
        getter ordered_phone_numbers : Array(Types::OrderedPhoneNumber)?

        # The phone number order ID.

        @[JSON::Field(key: "PhoneNumberOrderId")]
        getter phone_number_order_id : String?

        # The phone number order product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        # The status of the phone number order.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The updated phone number order time stamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @ordered_phone_numbers : Array(Types::OrderedPhoneNumber)? = nil,
          @phone_number_order_id : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end


      struct PutEventsConfigurationRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # Lambda function ARN that allows the bot to receive outgoing events.

        @[JSON::Field(key: "LambdaFunctionArn")]
        getter lambda_function_arn : String?

        # HTTPS endpoint that allows the bot to receive outgoing events.

        @[JSON::Field(key: "OutboundEventsHTTPSEndpoint")]
        getter outbound_events_https_endpoint : String?

        def initialize(
          @account_id : String,
          @bot_id : String,
          @lambda_function_arn : String? = nil,
          @outbound_events_https_endpoint : String? = nil
        )
        end
      end


      struct PutEventsConfigurationResponse
        include JSON::Serializable

        # The configuration that allows a bot to receive outgoing events. Can be an HTTPS endpoint or an AWS
        # Lambda function ARN.

        @[JSON::Field(key: "EventsConfiguration")]
        getter events_configuration : Types::EventsConfiguration?

        def initialize(
          @events_configuration : Types::EventsConfiguration? = nil
        )
        end
      end


      struct PutRetentionSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The retention settings.

        @[JSON::Field(key: "RetentionSettings")]
        getter retention_settings : Types::RetentionSettings

        def initialize(
          @account_id : String,
          @retention_settings : Types::RetentionSettings
        )
        end
      end


      struct PutRetentionSettingsResponse
        include JSON::Serializable

        # The timestamp representing the time at which the specified items are permanently deleted, in ISO
        # 8601 format.

        @[JSON::Field(key: "InitiateDeletionTimestamp")]
        getter initiate_deletion_timestamp : Time?

        # The retention settings.

        @[JSON::Field(key: "RetentionSettings")]
        getter retention_settings : Types::RetentionSettings?

        def initialize(
          @initiate_deletion_timestamp : Time? = nil,
          @retention_settings : Types::RetentionSettings? = nil
        )
        end
      end


      struct RedactConversationMessageRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The conversation ID.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The message ID.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        def initialize(
          @account_id : String,
          @conversation_id : String,
          @message_id : String
        )
        end
      end


      struct RedactConversationMessageResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RedactRoomMessageRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The message ID.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        def initialize(
          @account_id : String,
          @message_id : String,
          @room_id : String
        )
        end
      end


      struct RedactRoomMessageResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RegenerateSecurityTokenRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        def initialize(
          @account_id : String,
          @bot_id : String
        )
        end
      end


      struct RegenerateSecurityTokenResponse
        include JSON::Serializable

        # A resource that allows Enterprise account administrators to configure an interface that receives
        # events from Amazon Chime.

        @[JSON::Field(key: "Bot")]
        getter bot : Types::Bot?

        def initialize(
          @bot : Types::Bot? = nil
        )
        end
      end


      struct ResetPersonalPINRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @account_id : String,
          @user_id : String
        )
        end
      end


      struct ResetPersonalPINResponse
        include JSON::Serializable

        # The user details and new personal meeting PIN.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
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


      struct RestorePhoneNumberRequest
        include JSON::Serializable

        # The phone number.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct RestorePhoneNumberResponse
        include JSON::Serializable

        # The phone number details.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end

      # The retention settings for an Amazon Chime Enterprise account that determine how long to retain
      # items such as chat-room messages and chat-conversation messages.

      struct RetentionSettings
        include JSON::Serializable

        # The chat conversation retention settings.

        @[JSON::Field(key: "ConversationRetentionSettings")]
        getter conversation_retention_settings : Types::ConversationRetentionSettings?

        # The chat room retention settings.

        @[JSON::Field(key: "RoomRetentionSettings")]
        getter room_retention_settings : Types::RoomRetentionSettings?

        def initialize(
          @conversation_retention_settings : Types::ConversationRetentionSettings? = nil,
          @room_retention_settings : Types::RoomRetentionSettings? = nil
        )
        end
      end

      # The Amazon Chime chat room details.

      struct Room
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The identifier of the room creator.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The room creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The room name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The room ID.

        @[JSON::Field(key: "RoomId")]
        getter room_id : String?

        # The room update timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @account_id : String? = nil,
          @created_by : String? = nil,
          @created_timestamp : Time? = nil,
          @name : String? = nil,
          @room_id : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The room membership details.

      struct RoomMembership
        include JSON::Serializable

        # The identifier of the user that invited the room member.

        @[JSON::Field(key: "InvitedBy")]
        getter invited_by : String?

        # The member details, such as email address, name, member ID, and member type.

        @[JSON::Field(key: "Member")]
        getter member : Types::Member?

        # The membership role.

        @[JSON::Field(key: "Role")]
        getter role : String?

        # The room ID.

        @[JSON::Field(key: "RoomId")]
        getter room_id : String?

        # The room membership update timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @invited_by : String? = nil,
          @member : Types::Member? = nil,
          @role : String? = nil,
          @room_id : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The retention settings that determine how long to retain chat-room messages for an Amazon Chime
      # Enterprise account.

      struct RoomRetentionSettings
        include JSON::Serializable

        # The number of days for which to retain chat-room messages.

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        def initialize(
          @retention_days : Int32? = nil
        )
        end
      end


      struct SearchAvailablePhoneNumbersRequest
        include JSON::Serializable

        # The area code used to filter results. Only applies to the US.

        @[JSON::Field(key: "area-code")]
        getter area_code : String?

        # The city used to filter results. Only applies to the US.

        @[JSON::Field(key: "city")]
        getter city : String?

        # The country used to filter results. Defaults to the US Format: ISO 3166-1 alpha-2.

        @[JSON::Field(key: "country")]
        getter country : String?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The phone number type used to filter results. Required for non-US numbers.

        @[JSON::Field(key: "phone-number-type")]
        getter phone_number_type : String?

        # The state used to filter results. Required only if you provide City . Only applies to the US.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The toll-free prefix that you use to filter results. Only applies to the US.

        @[JSON::Field(key: "toll-free-prefix")]
        getter toll_free_prefix : String?

        def initialize(
          @area_code : String? = nil,
          @city : String? = nil,
          @country : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @phone_number_type : String? = nil,
          @state : String? = nil,
          @toll_free_prefix : String? = nil
        )
        end
      end


      struct SearchAvailablePhoneNumbersResponse
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)?

        # The token used to retrieve the next page of search results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @e164_phone_numbers : Array(String)? = nil,
          @next_token : String? = nil
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

      # An Active Directory (AD) group whose members are granted permission to act as delegates.

      struct SigninDelegateGroup
        include JSON::Serializable

        # The group name.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_name : String? = nil
        )
        end
      end

      # Settings that allow management of telephony permissions for an Amazon Chime user, such as inbound
      # and outbound calling and text messaging.

      struct TelephonySettings
        include JSON::Serializable

        # Allows or denies inbound calling.

        @[JSON::Field(key: "InboundCalling")]
        getter inbound_calling : Bool

        # Allows or denies outbound calling.

        @[JSON::Field(key: "OutboundCalling")]
        getter outbound_calling : Bool

        # Allows or denies SMS messaging.

        @[JSON::Field(key: "SMS")]
        getter sms : Bool

        def initialize(
          @inbound_calling : Bool,
          @outbound_calling : Bool,
          @sms : Bool
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

      # The request was well-formed but was unable to be followed due to semantic errors.

      struct UnprocessableEntityException
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


      struct UpdateAccountRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The default license applied when you add users to an Amazon Chime account.

        @[JSON::Field(key: "DefaultLicense")]
        getter default_license : String?

        # The new name for the specified Amazon Chime account.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @account_id : String,
          @default_license : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAccountResponse
        include JSON::Serializable

        # The updated Amazon Chime account details.

        @[JSON::Field(key: "Account")]
        getter account : Types::Account?

        def initialize(
          @account : Types::Account? = nil
        )
        end
      end


      struct UpdateAccountSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The Amazon Chime account settings to update.

        @[JSON::Field(key: "AccountSettings")]
        getter account_settings : Types::AccountSettings

        def initialize(
          @account_id : String,
          @account_settings : Types::AccountSettings
        )
        end
      end


      struct UpdateAccountSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateBotRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The bot ID.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # When true, stops the specified bot from running in your account.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        def initialize(
          @account_id : String,
          @bot_id : String,
          @disabled : Bool? = nil
        )
        end
      end


      struct UpdateBotResponse
        include JSON::Serializable

        # The updated bot details.

        @[JSON::Field(key: "Bot")]
        getter bot : Types::Bot?

        def initialize(
          @bot : Types::Bot? = nil
        )
        end
      end


      struct UpdateGlobalSettingsRequest
        include JSON::Serializable

        # The Amazon Chime Business Calling settings.

        @[JSON::Field(key: "BusinessCalling")]
        getter business_calling : Types::BusinessCallingSettings?

        # The Amazon Chime Voice Connector settings.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnectorSettings?

        def initialize(
          @business_calling : Types::BusinessCallingSettings? = nil,
          @voice_connector : Types::VoiceConnectorSettings? = nil
        )
        end
      end


      struct UpdatePhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        # The outbound calling name associated with the phone number.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        def initialize(
          @phone_number_id : String,
          @calling_name : String? = nil,
          @product_type : String? = nil
        )
        end
      end

      # The phone number ID, product type, or calling name fields to update, used with the
      # BatchUpdatePhoneNumber and UpdatePhoneNumber actions.

      struct UpdatePhoneNumberRequestItem
        include JSON::Serializable

        # The phone number ID to update.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String

        # The outbound calling name to update.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The product type to update.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        def initialize(
          @phone_number_id : String,
          @calling_name : String? = nil,
          @product_type : String? = nil
        )
        end
      end


      struct UpdatePhoneNumberResponse
        include JSON::Serializable

        # The updated phone number details.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end


      struct UpdatePhoneNumberSettingsRequest
        include JSON::Serializable

        # The default outbound calling name for the account.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String

        def initialize(
          @calling_name : String
        )
        end
      end


      struct UpdateRoomMembershipRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The member ID.

        @[JSON::Field(key: "memberId")]
        getter member_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        # The role of the member.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @account_id : String,
          @member_id : String,
          @room_id : String,
          @role : String? = nil
        )
        end
      end


      struct UpdateRoomMembershipResponse
        include JSON::Serializable

        # The room membership details.

        @[JSON::Field(key: "RoomMembership")]
        getter room_membership : Types::RoomMembership?

        def initialize(
          @room_membership : Types::RoomMembership? = nil
        )
        end
      end


      struct UpdateRoomRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The room ID.

        @[JSON::Field(key: "roomId")]
        getter room_id : String

        # The room name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @account_id : String,
          @room_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateRoomResponse
        include JSON::Serializable

        # The room details.

        @[JSON::Field(key: "Room")]
        getter room : Types::Room?

        def initialize(
          @room : Types::Room? = nil
        )
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The Alexa for Business metadata.

        @[JSON::Field(key: "AlexaForBusinessMetadata")]
        getter alexa_for_business_metadata : Types::AlexaForBusinessMetadata?

        # The user license type to update. This must be a supported license type for the Amazon Chime account
        # that the user belongs to.

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String?

        # The user type.

        @[JSON::Field(key: "UserType")]
        getter user_type : String?

        def initialize(
          @account_id : String,
          @user_id : String,
          @alexa_for_business_metadata : Types::AlexaForBusinessMetadata? = nil,
          @license_type : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      # The user ID and user fields to update, used with the BatchUpdateUser action.

      struct UpdateUserRequestItem
        include JSON::Serializable

        # The user ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The Alexa for Business metadata.

        @[JSON::Field(key: "AlexaForBusinessMetadata")]
        getter alexa_for_business_metadata : Types::AlexaForBusinessMetadata?

        # The user license type.

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String?

        # The user type.

        @[JSON::Field(key: "UserType")]
        getter user_type : String?

        def initialize(
          @user_id : String,
          @alexa_for_business_metadata : Types::AlexaForBusinessMetadata? = nil,
          @license_type : String? = nil,
          @user_type : String? = nil
        )
        end
      end


      struct UpdateUserResponse
        include JSON::Serializable

        # The updated user details.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end


      struct UpdateUserSettingsRequest
        include JSON::Serializable

        # The Amazon Chime account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The user ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The user settings to update.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Types::UserSettings

        def initialize(
          @account_id : String,
          @user_id : String,
          @user_settings : Types::UserSettings
        )
        end
      end

      # The user on the Amazon Chime account.

      struct User
        include JSON::Serializable

        # The user ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The Amazon Chime account ID.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Alexa for Business metadata.

        @[JSON::Field(key: "AlexaForBusinessMetadata")]
        getter alexa_for_business_metadata : Types::AlexaForBusinessMetadata?

        # The display name of the user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Date and time when the user is invited to the Amazon Chime account, in ISO 8601 format.

        @[JSON::Field(key: "InvitedOn")]
        getter invited_on : Time?

        # The license type for the user.

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String?

        # The user's personal meeting PIN.

        @[JSON::Field(key: "PersonalPIN")]
        getter personal_pin : String?

        # The primary email address of the user.

        @[JSON::Field(key: "PrimaryEmail")]
        getter primary_email : String?

        # The primary phone number associated with the user.

        @[JSON::Field(key: "PrimaryProvisionedNumber")]
        getter primary_provisioned_number : String?

        # Date and time when the user is registered, in ISO 8601 format.

        @[JSON::Field(key: "RegisteredOn")]
        getter registered_on : Time?

        # The user invite status.

        @[JSON::Field(key: "UserInvitationStatus")]
        getter user_invitation_status : String?

        # The user registration status.

        @[JSON::Field(key: "UserRegistrationStatus")]
        getter user_registration_status : String?

        # The user type.

        @[JSON::Field(key: "UserType")]
        getter user_type : String?

        def initialize(
          @user_id : String,
          @account_id : String? = nil,
          @alexa_for_business_metadata : Types::AlexaForBusinessMetadata? = nil,
          @display_name : String? = nil,
          @invited_on : Time? = nil,
          @license_type : String? = nil,
          @personal_pin : String? = nil,
          @primary_email : String? = nil,
          @primary_provisioned_number : String? = nil,
          @registered_on : Time? = nil,
          @user_invitation_status : String? = nil,
          @user_registration_status : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      # The list of errors returned when errors are encountered during the BatchSuspendUser ,
      # BatchUnsuspendUser , or BatchUpdateUser actions. This includes user IDs, error codes, and error
      # messages.

      struct UserError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The user ID for which the action failed.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Settings associated with an Amazon Chime user, including inbound and outbound calling and text
      # messaging.

      struct UserSettings
        include JSON::Serializable

        # The telephony settings associated with the user.

        @[JSON::Field(key: "Telephony")]
        getter telephony : Types::TelephonySettings

        def initialize(
          @telephony : Types::TelephonySettings
        )
        end
      end

      # The Amazon Chime Voice Connector settings. Includes any Amazon S3 buckets designated for storing
      # call detail records.

      struct VoiceConnectorSettings
        include JSON::Serializable

        # The Amazon S3 bucket designated for call detail record storage.

        @[JSON::Field(key: "CdrBucket")]
        getter cdr_bucket : String?

        def initialize(
          @cdr_bucket : String? = nil
        )
        end
      end
    end
  end
end
