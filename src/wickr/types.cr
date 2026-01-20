require "json"
require "time"

module Aws
  module Wickr
    module Types

      # The request was invalid or malformed. This error occurs when the request parameters do not meet the
      # API requirements, such as invalid field values, missing required parameters, or improperly formatted
      # data.

      struct BadRequestError
        include JSON::Serializable

        # A detailed message explaining what was wrong with the request and how to correct it.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a device where a user has logged into Wickr, containing information about the device's
      # type, status, and login history.

      struct BasicDeviceObject
        include JSON::Serializable

        # The unique application ID for the Wickr app on this device.

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        # The timestamp when the device first appeared in the Wickr database.

        @[JSON::Field(key: "created")]
        getter created : String?

        # The timestamp when the device last successfully logged into Wickr. This is also used to determine
        # SSO idle time.

        @[JSON::Field(key: "lastLogin")]
        getter last_login : String?

        # The current status of the device, either 'Active' or 'Reset' depending on whether the device is
        # currently active or has been marked for reset.

        @[JSON::Field(key: "statusText")]
        getter status_text : String?

        # Indicates whether the device is suspended.

        @[JSON::Field(key: "suspend")]
        getter suspend : Bool?

        # The operating system of the device (e.g., 'MacOSX', 'Windows', 'iOS', 'Android').

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @app_id : String? = nil,
          @created : String? = nil,
          @last_login : String? = nil,
          @status_text : String? = nil,
          @suspend : Bool? = nil,
          @type : String? = nil
        )
        end
      end


      struct BatchCreateUserRequest
        include JSON::Serializable

        # The ID of the Wickr network where users will be created.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A list of user objects containing the details for each user to be created, including username, name,
        # security groups, and optional invite codes. Maximum 50 users per batch request.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::BatchCreateUserRequestItem)

        # A unique identifier for this request to ensure idempotency. If you retry a request with the same
        # client token, the service will return the same response without creating duplicate users.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @users : Array(Types::BatchCreateUserRequestItem),
          @client_token : String? = nil
        )
        end
      end

      # Contains the details for a single user to be created in a batch user creation request. A user can
      # only be assigned to a single security group. Attempting to add a user to multiple security groups is
      # not supported and will result in an error. codeValidation , inviteCode , and inviteCodeTtl are
      # restricted to networks under preview only.

      struct BatchCreateUserRequestItem
        include JSON::Serializable

        # A list of security group IDs to which the user should be assigned.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The email address or username for the user. Must be unique within the network.

        @[JSON::Field(key: "username")]
        getter username : String

        # Indicates whether the user can be verified through a custom invite code.

        @[JSON::Field(key: "codeValidation")]
        getter code_validation : Bool?

        # The first name of the user.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # A custom invite code for the user. If not provided, one will be generated automatically.

        @[JSON::Field(key: "inviteCode")]
        getter invite_code : String?

        # The time-to-live for the invite code in days. After this period, the invite code will expire.

        @[JSON::Field(key: "inviteCodeTtl")]
        getter invite_code_ttl : Int32?

        # The last name of the user.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        def initialize(
          @security_group_ids : Array(String),
          @username : String,
          @code_validation : Bool? = nil,
          @first_name : String? = nil,
          @invite_code : String? = nil,
          @invite_code_ttl : Int32? = nil,
          @last_name : String? = nil
        )
        end
      end


      struct BatchCreateUserResponse
        include JSON::Serializable

        # A list of user creation attempts that failed, including error details explaining why each user could
        # not be created.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchUserErrorResponseItem)?

        # A message indicating the overall result of the batch operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of user objects that were successfully created, including their assigned user IDs and invite
        # codes.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::User)?

        def initialize(
          @failed : Array(Types::BatchUserErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::User)? = nil
        )
        end
      end


      struct BatchDeleteUserRequest
        include JSON::Serializable

        # The ID of the Wickr network from which users will be deleted.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A list of user IDs identifying the users to be deleted from the network. Maximum 50 users per batch
        # request.

        @[JSON::Field(key: "userIds")]
        getter user_ids : Array(String)

        # A unique identifier for this request to ensure idempotency. If you retry a request with the same
        # client token, the service will return the same response without attempting to delete users again.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @user_ids : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct BatchDeleteUserResponse
        include JSON::Serializable

        # A list of user deletion attempts that failed, including error details explaining why each user could
        # not be deleted.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchUserErrorResponseItem)?

        # A message indicating the overall result of the batch deletion operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of user IDs that were successfully deleted from the network.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchUserSuccessResponseItem)?

        def initialize(
          @failed : Array(Types::BatchUserErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::BatchUserSuccessResponseItem)? = nil
        )
        end
      end

      # Contains error information for a device operation that failed in a batch device request.

      struct BatchDeviceErrorResponseItem
        include JSON::Serializable

        # The application ID of the device that failed to be processed.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The field that caused the error.

        @[JSON::Field(key: "field")]
        getter field : String?

        # A description of why the device operation failed.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @app_id : String,
          @field : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about a device that was successfully processed in a batch device operation.

      struct BatchDeviceSuccessResponseItem
        include JSON::Serializable

        # The application ID of the device that was successfully processed.

        @[JSON::Field(key: "appId")]
        getter app_id : String

        def initialize(
          @app_id : String
        )
        end
      end


      struct BatchLookupUserUnameRequest
        include JSON::Serializable

        # The ID of the Wickr network where the users will be looked up.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A list of username hashes (unames) to look up. Each uname is a unique identifier for a user's
        # username. Maximum 50 unames per batch request.

        @[JSON::Field(key: "unames")]
        getter unames : Array(String)

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @unames : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct BatchLookupUserUnameResponse
        include JSON::Serializable

        # A list of username hash lookup attempts that failed, including error details explaining why each
        # lookup failed.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchUnameErrorResponseItem)?

        # A message indicating the overall result of the batch lookup operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of successfully resolved username hashes with their corresponding email addresses.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchUnameSuccessResponseItem)?

        def initialize(
          @failed : Array(Types::BatchUnameErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::BatchUnameSuccessResponseItem)? = nil
        )
        end
      end


      struct BatchReinviteUserRequest
        include JSON::Serializable

        # The ID of the Wickr network where users will be reinvited.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A list of user IDs identifying the users to be reinvited to the network. Maximum 50 users per batch
        # request.

        @[JSON::Field(key: "userIds")]
        getter user_ids : Array(String)

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @user_ids : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct BatchReinviteUserResponse
        include JSON::Serializable

        # A list of reinvitation attempts that failed, including error details explaining why each user could
        # not be reinvited.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchUserErrorResponseItem)?

        # A message indicating the overall result of the batch reinvitation operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of user IDs that were successfully reinvited.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchUserSuccessResponseItem)?

        def initialize(
          @failed : Array(Types::BatchUserErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::BatchUserSuccessResponseItem)? = nil
        )
        end
      end


      struct BatchResetDevicesForUserRequest
        include JSON::Serializable

        # A list of application IDs identifying the specific devices to be reset for the user. Maximum 50
        # devices per batch request.

        @[JSON::Field(key: "appIds")]
        getter app_ids : Array(String)

        # The ID of the Wickr network containing the user whose devices will be reset.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The ID of the user whose devices will be reset.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @app_ids : Array(String),
          @network_id : String,
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct BatchResetDevicesForUserResponse
        include JSON::Serializable

        # A list of device reset attempts that failed, including error details explaining why each device
        # could not be reset.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchDeviceErrorResponseItem)?

        # A message indicating the overall result of the batch device reset operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of application IDs that were successfully reset.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchDeviceSuccessResponseItem)?

        def initialize(
          @failed : Array(Types::BatchDeviceErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::BatchDeviceSuccessResponseItem)? = nil
        )
        end
      end


      struct BatchToggleUserSuspendStatusRequest
        include JSON::Serializable

        # The ID of the Wickr network where users will be suspended or unsuspended.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A boolean value indicating whether to suspend (true) or unsuspend (false) the specified users.

        @[JSON::Field(key: "suspend")]
        getter suspend : Bool

        # A list of user IDs identifying the users whose suspend status will be toggled. Maximum 50 users per
        # batch request.

        @[JSON::Field(key: "userIds")]
        getter user_ids : Array(String)

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @suspend : Bool,
          @user_ids : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct BatchToggleUserSuspendStatusResponse
        include JSON::Serializable

        # A list of suspend status toggle attempts that failed, including error details explaining why each
        # user's status could not be changed.

        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::BatchUserErrorResponseItem)?

        # A message indicating the overall result of the batch suspend status toggle operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of user IDs whose suspend status was successfully toggled.

        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::BatchUserSuccessResponseItem)?

        def initialize(
          @failed : Array(Types::BatchUserErrorResponseItem)? = nil,
          @message : String? = nil,
          @successful : Array(Types::BatchUserSuccessResponseItem)? = nil
        )
        end
      end

      # Contains error information for a username hash lookup that failed in a batch uname lookup request.

      struct BatchUnameErrorResponseItem
        include JSON::Serializable

        # The username hash that failed to be looked up.

        @[JSON::Field(key: "uname")]
        getter uname : String

        # The field that caused the error.

        @[JSON::Field(key: "field")]
        getter field : String?

        # A description of why the username hash lookup failed.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @uname : String,
          @field : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about a username hash that was successfully resolved in a batch uname lookup
      # operation.

      struct BatchUnameSuccessResponseItem
        include JSON::Serializable

        # The username hash that was successfully resolved.

        @[JSON::Field(key: "uname")]
        getter uname : String

        # The email address or username corresponding to the username hash.

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @uname : String,
          @username : String
        )
        end
      end

      # Contains error information for a user operation that failed in a batch user request.

      struct BatchUserErrorResponseItem
        include JSON::Serializable

        # The user ID associated with the failed operation.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The field that caused the error.

        @[JSON::Field(key: "field")]
        getter field : String?

        # A description of why the user operation failed.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @user_id : String,
          @field : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about a user that was successfully processed in a batch user operation.

      struct BatchUserSuccessResponseItem
        include JSON::Serializable

        # The user ID that was successfully processed.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @user_id : String
        )
        end
      end

      # Represents a guest user who has been blocked from accessing a Wickr network.

      struct BlockedGuestUser
        include JSON::Serializable

        # The username of the administrator who blocked this guest user.

        @[JSON::Field(key: "admin")]
        getter admin : String

        # The timestamp when the guest user was blocked or last modified.

        @[JSON::Field(key: "modified")]
        getter modified : String

        # The username of the blocked guest user.

        @[JSON::Field(key: "username")]
        getter username : String

        # The unique username hash identifier for the blocked guest user.

        @[JSON::Field(key: "usernameHash")]
        getter username_hash : String

        def initialize(
          @admin : String,
          @modified : String,
          @username : String,
          @username_hash : String
        )
        end
      end

      # Represents a bot account in a Wickr network with all its informational fields.

      struct Bot
        include JSON::Serializable

        # The unique identifier of the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The display name of the bot that is visible to users.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The ID of the security group to which the bot belongs.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # Indicates whether the bot has a password set.

        @[JSON::Field(key: "hasChallenge")]
        getter has_challenge : Bool?

        # The timestamp of the bot's last login.

        @[JSON::Field(key: "lastLogin")]
        getter last_login : String?

        # The public key of the bot used for encryption.

        @[JSON::Field(key: "pubkey")]
        getter pubkey : String?

        # The current status of the bot (1 for pending, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Indicates whether the bot is currently suspended.

        @[JSON::Field(key: "suspended")]
        getter suspended : Bool?

        # The unique username hash identifier for the bot.

        @[JSON::Field(key: "uname")]
        getter uname : String?

        # The username of the bot.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @bot_id : String? = nil,
          @display_name : String? = nil,
          @group_id : String? = nil,
          @has_challenge : Bool? = nil,
          @last_login : String? = nil,
          @pubkey : String? = nil,
          @status : Int32? = nil,
          @suspended : Bool? = nil,
          @uname : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Defines the calling feature permissions and settings for users in a security group, controlling what
      # types of calls users can initiate and participate in.

      struct CallingSettings
        include JSON::Serializable

        # Specifies whether users can start one-to-one calls.

        @[JSON::Field(key: "canStart11Call")]
        getter can_start11_call : Bool?

        # Specifies whether users can make video calls (as opposed to audio-only calls). Valid only when audio
        # call(canStart11Call) is enabled.

        @[JSON::Field(key: "canVideoCall")]
        getter can_video_call : Bool?

        # When enabled, forces all calls to use TCP protocol instead of UDP for network traversal.

        @[JSON::Field(key: "forceTcpCall")]
        getter force_tcp_call : Bool?

        def initialize(
          @can_start11_call : Bool? = nil,
          @can_video_call : Bool? = nil,
          @force_tcp_call : Bool? = nil
        )
        end
      end


      struct CreateBotRequest
        include JSON::Serializable

        # The password for the bot account.

        @[JSON::Field(key: "challenge")]
        getter challenge : String

        # The ID of the security group to which the bot will be assigned.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # The ID of the Wickr network where the bot will be created.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The username for the bot. This must be unique within the network and follow the network's naming
        # conventions.

        @[JSON::Field(key: "username")]
        getter username : String

        # The display name for the bot that will be visible to users in the network.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @challenge : String,
          @group_id : String,
          @network_id : String,
          @username : String,
          @display_name : String? = nil
        )
        end
      end


      struct CreateBotResponse
        include JSON::Serializable

        # The unique identifier assigned to the newly created bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The display name of the newly created bot.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The ID of the security group to which the bot was assigned.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # A message indicating the result of the bot creation operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the network where the bot was created.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        # The username of the newly created bot.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @bot_id : String,
          @display_name : String? = nil,
          @group_id : String? = nil,
          @message : String? = nil,
          @network_id : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct CreateDataRetentionBotChallengeRequest
        include JSON::Serializable

        # The ID of the Wickr network containing the data retention bot.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct CreateDataRetentionBotChallengeResponse
        include JSON::Serializable

        # The newly generated challenge password for the data retention bot.

        @[JSON::Field(key: "challenge")]
        getter challenge : String

        def initialize(
          @challenge : String
        )
        end
      end


      struct CreateDataRetentionBotRequest
        include JSON::Serializable

        # The ID of the Wickr network where the data retention bot will be created.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct CreateDataRetentionBotResponse
        include JSON::Serializable

        # A message indicating that the data retention bot was successfully provisioned.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateNetworkRequest
        include JSON::Serializable

        # The access level for the network. Valid values are STANDARD or PREMIUM, which determine the features
        # and capabilities available to network members.

        @[JSON::Field(key: "accessLevel")]
        getter access_level : String

        # The name for the new network. Must be between 1 and 20 characters.

        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # Specifies whether to enable a premium free trial for the network. It is optional and has a default
        # value as false. When set to true, the network starts with premium features for a limited trial
        # period.

        @[JSON::Field(key: "enablePremiumFreeTrial")]
        getter enable_premium_free_trial : Bool?

        # The ARN of the Amazon Web Services KMS customer managed key to use for encrypting sensitive data in
        # the network.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @access_level : String,
          @network_name : String,
          @enable_premium_free_trial : Bool? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end


      struct CreateNetworkResponse
        include JSON::Serializable

        # The ARN of the KMS key being used to encrypt sensitive data in the network.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The unique identifier assigned to the newly created network.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        # The name of the newly created network.

        @[JSON::Field(key: "networkName")]
        getter network_name : String?

        def initialize(
          @encryption_key_arn : String? = nil,
          @network_id : String? = nil,
          @network_name : String? = nil
        )
        end
      end


      struct CreateSecurityGroupRequest
        include JSON::Serializable

        # The name for the new security group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Wickr network where the security group will be created.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The configuration settings for the security group, including permissions, federation settings, and
        # feature controls.

        @[JSON::Field(key: "securityGroupSettings")]
        getter security_group_settings : Types::SecurityGroupSettingsRequest

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @name : String,
          @network_id : String,
          @security_group_settings : Types::SecurityGroupSettingsRequest,
          @client_token : String? = nil
        )
        end
      end


      struct CreateSecurityGroupResponse
        include JSON::Serializable

        # The details of the newly created security group, including its ID, name, and settings.

        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::SecurityGroup

        def initialize(
          @security_group : Types::SecurityGroup
        )
        end
      end


      struct DeleteBotRequest
        include JSON::Serializable

        # The unique identifier of the bot to be deleted.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The ID of the Wickr network from which the bot will be deleted.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @bot_id : String,
          @network_id : String
        )
        end
      end


      struct DeleteBotResponse
        include JSON::Serializable

        # A message indicating the result of the bot deletion operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteDataRetentionBotRequest
        include JSON::Serializable

        # The ID of the Wickr network from which the data retention bot will be deleted.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct DeleteDataRetentionBotResponse
        include JSON::Serializable

        # A message indicating that the data retention bot and all associated data were successfully deleted.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteNetworkRequest
        include JSON::Serializable

        # The ID of the Wickr network to delete.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A unique identifier for this request to ensure idempotency. If you retry a request with the same
        # client token, the service will return the same response without attempting to delete the network
        # again.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        def initialize(
          @network_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteNetworkResponse
        include JSON::Serializable

        # A message indicating that the network deletion has been initiated successfully.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteSecurityGroupRequest
        include JSON::Serializable

        # The unique identifier of the security group to delete.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # The ID of the Wickr network from which the security group will be deleted.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @group_id : String,
          @network_id : String
        )
        end
      end


      struct DeleteSecurityGroupResponse
        include JSON::Serializable

        # The ID of the security group that was deleted.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # A message indicating the result of the security group deletion operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the network from which the security group was deleted.

        @[JSON::Field(key: "networkId")]
        getter network_id : String?

        def initialize(
          @group_id : String? = nil,
          @message : String? = nil,
          @network_id : String? = nil
        )
        end
      end

      # Contains detailed error information explaining why an operation failed, including which field caused
      # the error and the reason for the failure.

      struct ErrorDetail
        include JSON::Serializable

        # The name of the field that contains an error or warning.

        @[JSON::Field(key: "field")]
        getter field : String?

        # A detailed description of the error or warning.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Access to the requested resource is forbidden. This error occurs when the authenticated user does
      # not have the necessary permissions to perform the requested operation, even though they are
      # authenticated.

      struct ForbiddenError
        include JSON::Serializable

        # A message explaining why access was denied and what permissions are required.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetBotRequest
        include JSON::Serializable

        # The unique identifier of the bot to retrieve.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The ID of the Wickr network containing the bot.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @bot_id : String,
          @network_id : String
        )
        end
      end


      struct GetBotResponse
        include JSON::Serializable

        # The unique identifier of the bot.

        @[JSON::Field(key: "botId")]
        getter bot_id : String?

        # The display name of the bot that is visible to users.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The ID of the security group to which the bot belongs.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # Indicates whether the bot has a password set.

        @[JSON::Field(key: "hasChallenge")]
        getter has_challenge : Bool?

        # The timestamp of the bot's last login.

        @[JSON::Field(key: "lastLogin")]
        getter last_login : String?

        # The public key of the bot used for encryption.

        @[JSON::Field(key: "pubkey")]
        getter pubkey : String?

        # The current status of the bot (1 for pending, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Indicates whether the bot is currently suspended.

        @[JSON::Field(key: "suspended")]
        getter suspended : Bool?

        # The unique username hash identifier for the bot.

        @[JSON::Field(key: "uname")]
        getter uname : String?

        # The username of the bot.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @bot_id : String? = nil,
          @display_name : String? = nil,
          @group_id : String? = nil,
          @has_challenge : Bool? = nil,
          @last_login : String? = nil,
          @pubkey : String? = nil,
          @status : Int32? = nil,
          @suspended : Bool? = nil,
          @uname : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct GetBotsCountRequest
        include JSON::Serializable

        # The ID of the Wickr network for which to retrieve bot counts.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetBotsCountResponse
        include JSON::Serializable

        # The number of bots with active status.

        @[JSON::Field(key: "active")]
        getter active : Int32

        # The number of bots with pending status (invited but not yet activated).

        @[JSON::Field(key: "pending")]
        getter pending : Int32

        # The total number of bots in the network (active and pending).

        @[JSON::Field(key: "total")]
        getter total : Int32

        def initialize(
          @active : Int32,
          @pending : Int32,
          @total : Int32
        )
        end
      end


      struct GetDataRetentionBotRequest
        include JSON::Serializable

        # The ID of the Wickr network containing the data retention bot.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetDataRetentionBotResponse
        include JSON::Serializable

        # Indicates whether a data retention bot exists in the network.

        @[JSON::Field(key: "botExists")]
        getter bot_exists : Bool?

        # The name of the data retention bot.

        @[JSON::Field(key: "botName")]
        getter bot_name : String?

        # Indicates whether the data retention bot is active and operational.

        @[JSON::Field(key: "isBotActive")]
        getter is_bot_active : Bool?

        # Indicates whether the data retention bot has been registered with the network.

        @[JSON::Field(key: "isDataRetentionBotRegistered")]
        getter is_data_retention_bot_registered : Bool?

        # Indicates whether the data retention service is enabled for the network.

        @[JSON::Field(key: "isDataRetentionServiceEnabled")]
        getter is_data_retention_service_enabled : Bool?

        # Indicates whether the public key message has been acknowledged by the bot.

        @[JSON::Field(key: "isPubkeyMsgAcked")]
        getter is_pubkey_msg_acked : Bool?

        def initialize(
          @bot_exists : Bool? = nil,
          @bot_name : String? = nil,
          @is_bot_active : Bool? = nil,
          @is_data_retention_bot_registered : Bool? = nil,
          @is_data_retention_service_enabled : Bool? = nil,
          @is_pubkey_msg_acked : Bool? = nil
        )
        end
      end


      struct GetGuestUserHistoryCountRequest
        include JSON::Serializable

        # The ID of the Wickr network for which to retrieve guest user history.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetGuestUserHistoryCountResponse
        include JSON::Serializable

        # A list of historical guest user counts, organized by month and billing period.

        @[JSON::Field(key: "history")]
        getter history : Array(Types::GuestUserHistoryCount)

        def initialize(
          @history : Array(Types::GuestUserHistoryCount)
        )
        end
      end


      struct GetNetworkRequest
        include JSON::Serializable

        # The ID of the Wickr network to retrieve.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetNetworkResponse
        include JSON::Serializable

        # The access level of the network (STANDARD or PREMIUM), which determines available features and
        # capabilities.

        @[JSON::Field(key: "accessLevel")]
        getter access_level : String

        # The Amazon Web Services account ID that owns the network.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The Amazon Resource Name (ARN) of the network.

        @[JSON::Field(key: "networkArn")]
        getter network_arn : String

        # The unique identifier of the network.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The name of the network.

        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The ARN of the Amazon Web Services KMS customer managed key used for encrypting sensitive data in
        # the network.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The expiration date and time for the network's free trial period, if applicable.

        @[JSON::Field(key: "freeTrialExpiration")]
        getter free_trial_expiration : String?

        # The SSO redirect URI migration state, managed by the SSO redirect migration wizard. Values: 0 (not
        # started), 1 (in progress), or 2 (completed).

        @[JSON::Field(key: "migrationState")]
        getter migration_state : Int32?

        # The current standing or status of the network.

        @[JSON::Field(key: "standing")]
        getter standing : Int32?

        def initialize(
          @access_level : String,
          @aws_account_id : String,
          @network_arn : String,
          @network_id : String,
          @network_name : String,
          @encryption_key_arn : String? = nil,
          @free_trial_expiration : String? = nil,
          @migration_state : Int32? = nil,
          @standing : Int32? = nil
        )
        end
      end


      struct GetNetworkSettingsRequest
        include JSON::Serializable

        # The ID of the Wickr network whose settings will be retrieved.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetNetworkSettingsResponse
        include JSON::Serializable

        # A list of network settings, where each setting includes a name, value, and type.

        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::Setting)

        def initialize(
          @settings : Array(Types::Setting)
        )
        end
      end


      struct GetOidcInfoRequest
        include JSON::Serializable

        # The ID of the Wickr network whose OIDC configuration will be retrieved.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The CA certificate for secure communication with the OIDC provider (optional).

        @[JSON::Field(key: "certificate")]
        getter certificate : String?

        # The OAuth client ID for retrieving access tokens (optional).

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The OAuth client secret for retrieving access tokens (optional).

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String?

        # The authorization code for retrieving access tokens (optional).

        @[JSON::Field(key: "code")]
        getter code : String?

        # The PKCE code verifier for enhanced security in the OAuth flow (optional).

        @[JSON::Field(key: "codeVerifier")]
        getter code_verifier : String?

        # The OAuth grant type for retrieving access tokens (optional).

        @[JSON::Field(key: "grantType")]
        getter grant_type : String?

        # The redirect URI for the OAuth flow (optional).

        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String?

        # The URL for the OIDC provider (optional).

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @network_id : String,
          @certificate : String? = nil,
          @client_id : String? = nil,
          @client_secret : String? = nil,
          @code : String? = nil,
          @code_verifier : String? = nil,
          @grant_type : String? = nil,
          @redirect_uri : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct GetOidcInfoResponse
        include JSON::Serializable

        # The OpenID Connect configuration information for the network, including issuer, client ID, scopes,
        # and other SSO settings.

        @[JSON::Field(key: "openidConnectInfo")]
        getter openid_connect_info : Types::OidcConfigInfo?

        # OAuth token information including access token, refresh token, and expiration details (only present
        # if token parameters were provided in the request).

        @[JSON::Field(key: "tokenInfo")]
        getter token_info : Types::OidcTokenInfo?

        def initialize(
          @openid_connect_info : Types::OidcConfigInfo? = nil,
          @token_info : Types::OidcTokenInfo? = nil
        )
        end
      end


      struct GetSecurityGroupRequest
        include JSON::Serializable

        # The unique identifier of the security group to retrieve.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # The ID of the Wickr network containing the security group.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @group_id : String,
          @network_id : String
        )
        end
      end


      struct GetSecurityGroupResponse
        include JSON::Serializable

        # The detailed information about the security group, including all its settings and member counts.

        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::SecurityGroup

        def initialize(
          @security_group : Types::SecurityGroup
        )
        end
      end


      struct GetUserRequest
        include JSON::Serializable

        # The ID of the Wickr network containing the user.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the user to retrieve.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The end time for filtering the user's last activity. Only activity before this timestamp will be
        # considered. Time is specified in epoch seconds.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The start time for filtering the user's last activity. Only activity after this timestamp will be
        # considered. Time is specified in epoch seconds.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @network_id : String,
          @user_id : String,
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetUserResponse
        include JSON::Serializable

        # The unique identifier of the user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The first name of the user.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # Indicates whether the user has administrator privileges in the network.

        @[JSON::Field(key: "isAdmin")]
        getter is_admin : Bool?

        # The timestamp of the user's last activity in the network, specified in epoch seconds.

        @[JSON::Field(key: "lastActivity")]
        getter last_activity : Int32?

        # The timestamp of the user's last login to the network, specified in epoch seconds.

        @[JSON::Field(key: "lastLogin")]
        getter last_login : Int32?

        # The last name of the user.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # A list of security group IDs to which the user belongs.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The current status of the user (1 for pending, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Indicates whether the user is currently suspended.

        @[JSON::Field(key: "suspended")]
        getter suspended : Bool?

        # The email address or username of the user.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @user_id : String,
          @first_name : String? = nil,
          @is_admin : Bool? = nil,
          @last_activity : Int32? = nil,
          @last_login : Int32? = nil,
          @last_name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : Int32? = nil,
          @suspended : Bool? = nil,
          @username : String? = nil
        )
        end
      end


      struct GetUsersCountRequest
        include JSON::Serializable

        # The ID of the Wickr network for which to retrieve user counts.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end


      struct GetUsersCountResponse
        include JSON::Serializable

        # The number of users with active status in the network.

        @[JSON::Field(key: "active")]
        getter active : Int32

        # The number of users with pending status (invited but not yet accepted).

        @[JSON::Field(key: "pending")]
        getter pending : Int32

        # The number of users who have rejected network invitations.

        @[JSON::Field(key: "rejected")]
        getter rejected : Int32

        # The number of additional users that can be added to the network while maintaining premium free trial
        # eligibility.

        @[JSON::Field(key: "remaining")]
        getter remaining : Int32

        # The total number of users in the network (active and pending combined).

        @[JSON::Field(key: "total")]
        getter total : Int32

        def initialize(
          @active : Int32,
          @pending : Int32,
          @rejected : Int32,
          @remaining : Int32,
          @total : Int32
        )
        end
      end

      # Represents a guest user who has accessed the network from a federated Wickr network.

      struct GuestUser
        include JSON::Serializable

        # The billing period when this guest user accessed the network (e.g., '2024-01').

        @[JSON::Field(key: "billingPeriod")]
        getter billing_period : String

        # The username of the guest user.

        @[JSON::Field(key: "username")]
        getter username : String

        # The unique username hash identifier for the guest user.

        @[JSON::Field(key: "usernameHash")]
        getter username_hash : String

        def initialize(
          @billing_period : String,
          @username : String,
          @username_hash : String
        )
        end
      end

      # Contains the count of guest users for a specific billing period, used for tracking historical guest
      # user activity.

      struct GuestUserHistoryCount
        include JSON::Serializable

        # The number of guest users who have communicated with your Wickr network during this billing period.

        @[JSON::Field(key: "count")]
        getter count : String

        # The month and billing period in YYYY_MM format (e.g., '2024_01').

        @[JSON::Field(key: "month")]
        getter month : String

        def initialize(
          @count : String,
          @month : String
        )
        end
      end

      # An unexpected error occurred on the server while processing the request. This indicates a problem
      # with the Wickr service itself rather than with the request. If this error persists, contact Amazon
      # Web Services Support.

      struct InternalServerError
        include JSON::Serializable

        # A message describing the internal server error that occurred.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListBlockedGuestUsersRequest
        include JSON::Serializable

        # The ID of the Wickr network from which to list blocked guest users.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Filter results to only include blocked guest users that were blocked by this administrator.

        @[JSON::Field(key: "admin")]
        getter admin : String?

        # The maximum number of blocked guest users to return in a single page. Valid range is 1-100. Default
        # is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The field to sort blocked guest users by. Accepted values include 'username', 'admin', and
        # 'modified'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        # Filter results to only include blocked guest users with usernames matching this value.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @network_id : String,
          @admin : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct ListBlockedGuestUsersResponse
        include JSON::Serializable

        # A list of blocked guest user objects within the current page.

        @[JSON::Field(key: "blocklist")]
        getter blocklist : Array(Types::BlockedGuestUser)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @blocklist : Array(Types::BlockedGuestUser),
          @next_token : String? = nil
        )
        end
      end


      struct ListBotsRequest
        include JSON::Serializable

        # The ID of the Wickr network from which to list bots.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Filter results to only include bots with display names matching this value.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Filter results to only include bots belonging to this security group.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The maximum number of bots to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The fields to sort bots by. Multiple fields can be specified by separating them with '+'. Accepted
        # values include 'username', 'firstName', 'displayName', 'status', and 'groupId'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        # Filter results to only include bots with this status (1 for pending, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Filter results to only include bots with usernames matching this value.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @network_id : String,
          @display_name : String? = nil,
          @group_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil,
          @status : Int32? = nil,
          @username : String? = nil
        )
        end
      end


      struct ListBotsResponse
        include JSON::Serializable

        # A list of bot objects matching the specified filters and within the current page.

        @[JSON::Field(key: "bots")]
        getter bots : Array(Types::Bot)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bots : Array(Types::Bot),
          @next_token : String? = nil
        )
        end
      end


      struct ListDevicesForUserRequest
        include JSON::Serializable

        # The ID of the Wickr network containing the user.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the user whose devices will be listed.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The maximum number of devices to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The fields to sort devices by. Multiple fields can be specified by separating them with '+'.
        # Accepted values include 'lastlogin', 'type', 'suspend', and 'created'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        def initialize(
          @network_id : String,
          @user_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil
        )
        end
      end


      struct ListDevicesForUserResponse
        include JSON::Serializable

        # A list of device objects associated with the user within the current page.

        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::BasicDeviceObject)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::BasicDeviceObject),
          @next_token : String? = nil
        )
        end
      end


      struct ListGuestUsersRequest
        include JSON::Serializable

        # The ID of the Wickr network from which to list guest users.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Filter results to only include guest users from this billing period (e.g., '2024-01').

        @[JSON::Field(key: "billingPeriod")]
        getter billing_period : String?

        # The maximum number of guest users to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The field to sort guest users by. Accepted values include 'username' and 'billingPeriod'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        # Filter results to only include guest users with usernames matching this value.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @network_id : String,
          @billing_period : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct ListGuestUsersResponse
        include JSON::Serializable

        # A list of guest user objects within the current page.

        @[JSON::Field(key: "guestlist")]
        getter guestlist : Array(Types::GuestUser)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @guestlist : Array(Types::GuestUser),
          @next_token : String? = nil
        )
        end
      end


      struct ListNetworksRequest
        include JSON::Serializable

        # The maximum number of networks to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The field to sort networks by. Accepted values are 'networkId' and 'networkName'. Default is
        # 'networkId'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil
        )
        end
      end


      struct ListNetworksResponse
        include JSON::Serializable

        # A list of network objects for the Amazon Web Services account.

        @[JSON::Field(key: "networks")]
        getter networks : Array(Types::Network)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @networks : Array(Types::Network),
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityGroupUsersRequest
        include JSON::Serializable

        # The unique identifier of the security group whose users will be listed.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # The ID of the Wickr network containing the security group.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The maximum number of users to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The field to sort users by. Multiple fields can be specified by separating them with '+'. Accepted
        # values include 'username', 'firstName', and 'lastName'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        def initialize(
          @group_id : String,
          @network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil
        )
        end
      end


      struct ListSecurityGroupUsersResponse
        include JSON::Serializable

        # A list of user objects belonging to the security group within the current page.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @users : Array(Types::User),
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityGroupsRequest
        include JSON::Serializable

        # The ID of the Wickr network from which to list security groups.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The maximum number of security groups to return in a single page. Valid range is 1-100. Default is
        # 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The field to sort security groups by. Accepted values include 'id' and 'name'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        def initialize(
          @network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil
        )
        end
      end


      struct ListSecurityGroupsResponse
        include JSON::Serializable

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of security group objects in the current page.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroup)?

        def initialize(
          @next_token : String? = nil,
          @security_groups : Array(Types::SecurityGroup)? = nil
        )
        end
      end


      struct ListUsersRequest
        include JSON::Serializable

        # The ID of the Wickr network from which to list users.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Filter results to only include users with first names matching this value.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # Filter results to only include users belonging to this security group.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # Filter results to only include users with last names matching this value.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The maximum number of users to return in a single page. Valid range is 1-100. Default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results. This is returned from a previous request when
        # there are more results available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The direction to sort results. Valid values are 'ASC' (ascending) or 'DESC' (descending). Default is
        # 'DESC'.

        @[JSON::Field(key: "sortDirection")]
        getter sort_direction : String?

        # The fields to sort users by. Multiple fields can be specified by separating them with '+'. Accepted
        # values include 'username', 'firstName', 'lastName', 'status', and 'groupId'.

        @[JSON::Field(key: "sortFields")]
        getter sort_fields : String?

        # Filter results to only include users with this status (1 for pending, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Filter results to only include users with usernames matching this value.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @network_id : String,
          @first_name : String? = nil,
          @group_id : String? = nil,
          @last_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_direction : String? = nil,
          @sort_fields : String? = nil,
          @status : Int32? = nil,
          @username : String? = nil
        )
        end
      end


      struct ListUsersResponse
        include JSON::Serializable

        # The token to use for retrieving the next page of results. If this is not present, there are no more
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of user objects matching the specified filters and within the current page.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # Represents a Wickr network with all its configuration and status information.

      struct Network
        include JSON::Serializable

        # The access level of the network (STANDARD or PREMIUM), which determines available features and
        # capabilities.

        @[JSON::Field(key: "accessLevel")]
        getter access_level : String

        # The Amazon Web Services account ID that owns the network.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The Amazon Resource Name (ARN) of the network.

        @[JSON::Field(key: "networkArn")]
        getter network_arn : String

        # The unique identifier of the network.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The name of the network.

        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # The ARN of the Amazon Web Services KMS customer managed key used for encrypting sensitive data in
        # the network.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The expiration date and time for the network's free trial period, if applicable.

        @[JSON::Field(key: "freeTrialExpiration")]
        getter free_trial_expiration : String?

        # The SSO redirect URI migration state, managed by the SSO redirect migration wizard. Values: 0 (not
        # started), 1 (in progress), or 2 (completed).

        @[JSON::Field(key: "migrationState")]
        getter migration_state : Int32?

        # The current standing or status of the network.

        @[JSON::Field(key: "standing")]
        getter standing : Int32?

        def initialize(
          @access_level : String,
          @aws_account_id : String,
          @network_arn : String,
          @network_id : String,
          @network_name : String,
          @encryption_key_arn : String? = nil,
          @free_trial_expiration : String? = nil,
          @migration_state : Int32? = nil,
          @standing : Int32? = nil
        )
        end
      end

      # Contains network-level configuration settings that apply to all users and security groups within a
      # Wickr network.

      struct NetworkSettings
        include JSON::Serializable

        # Indicates whether the data retention feature is enabled for the network. When true, messages are
        # captured by the data retention bot for compliance and archiving purposes.

        @[JSON::Field(key: "dataRetention")]
        getter data_retention : Bool?

        # Allows Wickr clients to send anonymized performance and usage metrics to the Wickr backend server
        # for service improvement and troubleshooting.

        @[JSON::Field(key: "enableClientMetrics")]
        getter enable_client_metrics : Bool?

        # Configuration for read receipts at the network level, controlling the default behavior for whether
        # senders can see when their messages have been read.

        @[JSON::Field(key: "readReceiptConfig")]
        getter read_receipt_config : Types::ReadReceiptConfig?

        def initialize(
          @data_retention : Bool? = nil,
          @enable_client_metrics : Bool? = nil,
          @read_receipt_config : Types::ReadReceiptConfig? = nil
        )
        end
      end

      # Contains the OpenID Connect (OIDC) configuration information for Single Sign-On (SSO)
      # authentication, including identity provider settings and client credentials.

      struct OidcConfigInfo
        include JSON::Serializable

        # Custom identifier your end users will use to sign in with SSO.

        @[JSON::Field(key: "companyId")]
        getter company_id : String

        # The issuer URL of the identity provider, which serves as the base URL for OIDC endpoints and
        # configuration discovery.

        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The OAuth scopes requested from the identity provider, which determine what user information is
        # accessible (e.g., 'openid profile email').

        @[JSON::Field(key: "scopes")]
        getter scopes : String

        # The unique identifier for the registered OIDC application. Valid range is 1-10.

        @[JSON::Field(key: "applicationId")]
        getter application_id : Int32?

        # The name of the OIDC application as registered with the identity provider.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # The X.509 CA certificate for validating SSL/TLS connections to the identity provider when using
        # self-signed or enterprise certificates.

        @[JSON::Field(key: "caCertificate")]
        getter ca_certificate : String?

        # The OAuth client ID assigned by the identity provider for authentication requests.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The OAuth client secret used to authenticate the application with the identity provider.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String?

        # A custom field mapping to extract the username from the OIDC token when the standard username claim
        # is insufficient.

        @[JSON::Field(key: "customUsername")]
        getter custom_username : String?

        # Additional authentication parameters to include in the OIDC authorization request as a query string.
        # Useful for provider-specific extensions.

        @[JSON::Field(key: "extraAuthParams")]
        getter extra_auth_params : String?

        # The callback URL where the identity provider redirects users after successful authentication. This
        # URL must be registered with the identity provider.

        @[JSON::Field(key: "redirectUrl")]
        getter redirect_url : String?

        # An additional secret credential used by the identity provider for authentication.

        @[JSON::Field(key: "secret")]
        getter secret : String?

        # The grace period in minutes before the SSO token expires when the system should proactively refresh
        # the token to maintain seamless user access.

        @[JSON::Field(key: "ssoTokenBufferMinutes")]
        getter sso_token_buffer_minutes : Int32?

        # The claim field from the OIDC token to use as the unique user identifier (e.g., 'email', 'sub', or a
        # custom claim).

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @company_id : String,
          @issuer : String,
          @scopes : String,
          @application_id : Int32? = nil,
          @application_name : String? = nil,
          @ca_certificate : String? = nil,
          @client_id : String? = nil,
          @client_secret : String? = nil,
          @custom_username : String? = nil,
          @extra_auth_params : String? = nil,
          @redirect_url : String? = nil,
          @secret : String? = nil,
          @sso_token_buffer_minutes : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Contains OAuth token information returned from the identity provider, including access tokens, ID
      # tokens, and PKCE parameters used for secure authentication.

      struct OidcTokenInfo
        include JSON::Serializable

        # The OAuth access token that can be used to access protected resources on behalf of the authenticated
        # user.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The PKCE code challenge, a transformed version of the code verifier sent during the authorization
        # request for verification.

        @[JSON::Field(key: "codeChallenge")]
        getter code_challenge : String?

        # The PKCE (Proof Key for Code Exchange) code verifier, a cryptographically random string used to
        # enhance security in the OAuth flow.

        @[JSON::Field(key: "codeVerifier")]
        getter code_verifier : String?

        # The lifetime of the access token in seconds, indicating when the token will expire and need to be
        # refreshed.

        @[JSON::Field(key: "expiresIn")]
        getter expires_in : Int64?

        # The OpenID Connect ID token containing user identity information and authentication context as a
        # signed JWT.

        @[JSON::Field(key: "idToken")]
        getter id_token : String?

        # The OAuth refresh token that can be used to obtain new access tokens without requiring the user to
        # re-authenticate.

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        # The type of access token issued, typically 'Bearer', which indicates how the token should be used in
        # API requests.

        @[JSON::Field(key: "tokenType")]
        getter token_type : String?

        def initialize(
          @access_token : String? = nil,
          @code_challenge : String? = nil,
          @code_verifier : String? = nil,
          @expires_in : Int64? = nil,
          @id_token : String? = nil,
          @refresh_token : String? = nil,
          @token_type : String? = nil
        )
        end
      end

      # Defines password complexity requirements for users in a security group, including minimum length and
      # character type requirements.

      struct PasswordRequirements
        include JSON::Serializable

        # The minimum number of lowercase letters required in passwords.

        @[JSON::Field(key: "lowercase")]
        getter lowercase : Int32?

        # The minimum password length in characters.

        @[JSON::Field(key: "minLength")]
        getter min_length : Int32?

        # The minimum number of numeric characters required in passwords.

        @[JSON::Field(key: "numbers")]
        getter numbers : Int32?

        # The minimum number of special symbol characters required in passwords.

        @[JSON::Field(key: "symbols")]
        getter symbols : Int32?

        # The minimum number of uppercase letters required in passwords.

        @[JSON::Field(key: "uppercase")]
        getter uppercase : Int32?

        def initialize(
          @lowercase : Int32? = nil,
          @min_length : Int32? = nil,
          @numbers : Int32? = nil,
          @symbols : Int32? = nil,
          @uppercase : Int32? = nil
        )
        end
      end

      # Identifies a Wickr enterprise network that is permitted for global federation, allowing users to
      # communicate with members of the specified network.

      struct PermittedWickrEnterpriseNetwork
        include JSON::Serializable

        # The domain identifier for the permitted Wickr enterprise network.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The network ID of the permitted Wickr enterprise network.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @domain : String,
          @network_id : String
        )
        end
      end

      # The request was throttled because too many requests were sent in a short period of time. Wait a
      # moment and retry the request. Consider implementing exponential backoff in your application.

      struct RateLimitError
        include JSON::Serializable

        # A message indicating that the rate limit was exceeded and suggesting when to retry.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration for read receipts at the network level, controlling whether senders can see when their
      # messages have been read.

      struct ReadReceiptConfig
        include JSON::Serializable

        # The read receipt status mode for the network.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct RegisterOidcConfigRequest
        include JSON::Serializable

        # Custom identifier your end users will use to sign in with SSO.

        @[JSON::Field(key: "companyId")]
        getter company_id : String

        # The issuer URL of the OIDC provider (e.g., 'https://login.example.com').

        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The ID of the Wickr network for which OIDC will be configured.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The OAuth scopes to request from the OIDC provider (e.g., 'openid profile email').

        @[JSON::Field(key: "scopes")]
        getter scopes : String

        # A custom field mapping to extract the username from the OIDC token (optional). The customUsername is
        # only required if you use something other than email as the username field.

        @[JSON::Field(key: "customUsername")]
        getter custom_username : String?

        # Additional authentication parameters to include in the OIDC flow (optional).

        @[JSON::Field(key: "extraAuthParams")]
        getter extra_auth_params : String?

        # The client secret for authenticating with the OIDC provider (optional).

        @[JSON::Field(key: "secret")]
        getter secret : String?

        # The buffer time in minutes before the SSO token expires to refresh it (optional).

        @[JSON::Field(key: "ssoTokenBufferMinutes")]
        getter sso_token_buffer_minutes : Int32?

        # Unique identifier provided by your identity provider to authenticate the access request. Also
        # referred to as clientID.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @company_id : String,
          @issuer : String,
          @network_id : String,
          @scopes : String,
          @custom_username : String? = nil,
          @extra_auth_params : String? = nil,
          @secret : String? = nil,
          @sso_token_buffer_minutes : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct RegisterOidcConfigResponse
        include JSON::Serializable

        # Custom identifier your end users will use to sign in with SSO.

        @[JSON::Field(key: "companyId")]
        getter company_id : String

        # The issuer URL of the OIDC provider.

        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The OAuth scopes configured for the application.

        @[JSON::Field(key: "scopes")]
        getter scopes : String

        # The unique identifier for the registered OIDC application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : Int32?

        # The name of the registered OIDC application.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # The CA certificate used for secure communication with the OIDC provider.

        @[JSON::Field(key: "caCertificate")]
        getter ca_certificate : String?

        # The OAuth client ID assigned to the application.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The OAuth client secret for the application.

        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String?

        # The custom field mapping used for extracting the username.

        @[JSON::Field(key: "customUsername")]
        getter custom_username : String?

        # The additional authentication parameters configured for the OIDC flow.

        @[JSON::Field(key: "extraAuthParams")]
        getter extra_auth_params : String?

        # The redirect URL configured for the OAuth flow.

        @[JSON::Field(key: "redirectUrl")]
        getter redirect_url : String?

        # The client secret for authenticating with the OIDC provider.

        @[JSON::Field(key: "secret")]
        getter secret : String?

        # The buffer time in minutes before the SSO token expires.

        @[JSON::Field(key: "ssoTokenBufferMinutes")]
        getter sso_token_buffer_minutes : Int32?

        # The claim field being used as the user identifier.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @company_id : String,
          @issuer : String,
          @scopes : String,
          @application_id : Int32? = nil,
          @application_name : String? = nil,
          @ca_certificate : String? = nil,
          @client_id : String? = nil,
          @client_secret : String? = nil,
          @custom_username : String? = nil,
          @extra_auth_params : String? = nil,
          @redirect_url : String? = nil,
          @secret : String? = nil,
          @sso_token_buffer_minutes : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct RegisterOidcConfigTestRequest
        include JSON::Serializable

        # The issuer URL of the OIDC provider to test.

        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The ID of the Wickr network for which the OIDC configuration will be tested.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The OAuth scopes to test with the OIDC provider.

        @[JSON::Field(key: "scopes")]
        getter scopes : String

        # The CA certificate for secure communication with the OIDC provider (optional).

        @[JSON::Field(key: "certificate")]
        getter certificate : String?

        # Additional authentication parameters to include in the test (optional).

        @[JSON::Field(key: "extraAuthParams")]
        getter extra_auth_params : String?

        def initialize(
          @issuer : String,
          @network_id : String,
          @scopes : String,
          @certificate : String? = nil,
          @extra_auth_params : String? = nil
        )
        end
      end


      struct RegisterOidcConfigTestResponse
        include JSON::Serializable

        # The authorization endpoint URL discovered from the OIDC provider.

        @[JSON::Field(key: "authorizationEndpoint")]
        getter authorization_endpoint : String?

        # The end session endpoint URL for logging out users from the OIDC provider.

        @[JSON::Field(key: "endSessionEndpoint")]
        getter end_session_endpoint : String?

        # The OAuth grant types supported by the OIDC provider.

        @[JSON::Field(key: "grantTypesSupported")]
        getter grant_types_supported : Array(String)?

        # The issuer URL confirmed by the OIDC provider.

        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # The logout endpoint URL for terminating user sessions.

        @[JSON::Field(key: "logoutEndpoint")]
        getter logout_endpoint : String?

        # Indicates whether the provider supports Microsoft multi-refresh tokens.

        @[JSON::Field(key: "microsoftMultiRefreshToken")]
        getter microsoft_multi_refresh_token : Bool?

        # The OAuth response types supported by the OIDC provider.

        @[JSON::Field(key: "responseTypesSupported")]
        getter response_types_supported : Array(String)?

        # The token revocation endpoint URL for invalidating tokens.

        @[JSON::Field(key: "revocationEndpoint")]
        getter revocation_endpoint : String?

        # The OAuth scopes supported by the OIDC provider.

        @[JSON::Field(key: "scopesSupported")]
        getter scopes_supported : Array(String)?

        # The token endpoint URL discovered from the OIDC provider.

        @[JSON::Field(key: "tokenEndpoint")]
        getter token_endpoint : String?

        # The authentication methods supported by the token endpoint.

        @[JSON::Field(key: "tokenEndpointAuthMethodsSupported")]
        getter token_endpoint_auth_methods_supported : Array(String)?

        # The user info endpoint URL discovered from the OIDC provider.

        @[JSON::Field(key: "userinfoEndpoint")]
        getter userinfo_endpoint : String?

        def initialize(
          @authorization_endpoint : String? = nil,
          @end_session_endpoint : String? = nil,
          @grant_types_supported : Array(String)? = nil,
          @issuer : String? = nil,
          @logout_endpoint : String? = nil,
          @microsoft_multi_refresh_token : Bool? = nil,
          @response_types_supported : Array(String)? = nil,
          @revocation_endpoint : String? = nil,
          @scopes_supported : Array(String)? = nil,
          @token_endpoint : String? = nil,
          @token_endpoint_auth_methods_supported : Array(String)? = nil,
          @userinfo_endpoint : String? = nil
        )
        end
      end

      # The requested resource could not be found. This error occurs when you try to access or modify a
      # network, user, bot, security group, or other resource that doesn't exist or has been deleted.

      struct ResourceNotFoundError
        include JSON::Serializable

        # A message identifying which resource was not found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a security group in a Wickr network, containing membership statistics, configuration, and
      # all permission settings that apply to its members.

      struct SecurityGroup
        include JSON::Serializable

        # The number of active user members currently in the security group.

        @[JSON::Field(key: "activeMembers")]
        getter active_members : Int32

        # The number of bot members currently in the security group.

        @[JSON::Field(key: "botMembers")]
        getter bot_members : Int32

        # The unique identifier of the security group.

        @[JSON::Field(key: "id")]
        getter id : String

        # Indicates whether this is the default security group for the network. Each network has only one
        # default group.

        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool

        # The timestamp when the security group was last modified, specified in epoch seconds.

        @[JSON::Field(key: "modified")]
        getter modified : Int32

        # The human-readable name of the security group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The comprehensive configuration settings that define capabilities and restrictions for members of
        # this security group.

        @[JSON::Field(key: "securityGroupSettings")]
        getter security_group_settings : Types::SecurityGroupSettings

        # The GUID of the Active Directory group associated with this security group, if synchronized with
        # LDAP.

        @[JSON::Field(key: "activeDirectoryGuid")]
        getter active_directory_guid : String?

        def initialize(
          @active_members : Int32,
          @bot_members : Int32,
          @id : String,
          @is_default : Bool,
          @modified : Int32,
          @name : String,
          @security_group_settings : Types::SecurityGroupSettings,
          @active_directory_guid : String? = nil
        )
        end
      end

      # Comprehensive configuration settings that define all user capabilities, restrictions, and features
      # for members of a security group. These settings control everything from calling permissions to
      # federation settings to security policies.

      struct SecurityGroupSettings
        include JSON::Serializable

        # Requires users to reauthenticate every time they return to the application, providing an additional
        # layer of security.

        @[JSON::Field(key: "alwaysReauthenticate")]
        getter always_reauthenticate : Bool?

        # Configuration values for ATAK (Android Team Awareness Kit) package integration, when ATAK is
        # enabled.

        @[JSON::Field(key: "atakPackageValues")]
        getter atak_package_values : Array(String)?

        # The calling feature permissions and settings that control what types of calls users can initiate and
        # participate in.

        @[JSON::Field(key: "calling")]
        getter calling : Types::CallingSettings?

        # Enables automatic checking for Wickr client updates to ensure users stay current with the latest
        # version.

        @[JSON::Field(key: "checkForUpdates")]
        getter check_for_updates : Bool?

        # Enables ATAK (Android Team Awareness Kit) integration for tactical communication and situational
        # awareness.

        @[JSON::Field(key: "enableAtak")]
        getter enable_atak : Bool?

        # Allow users to report crashes.

        @[JSON::Field(key: "enableCrashReports")]
        getter enable_crash_reports : Bool?

        # Specifies whether users can download files from messages to their devices.

        @[JSON::Field(key: "enableFileDownload")]
        getter enable_file_download : Bool?

        # Allows users to communicate with guest users from other Wickr networks and federated external
        # networks.

        @[JSON::Field(key: "enableGuestFederation")]
        getter enable_guest_federation : Bool?

        # Enables message preview text in push notifications, allowing users to see message content before
        # opening the app.

        @[JSON::Field(key: "enableNotificationPreview")]
        getter enable_notification_preview : Bool?

        # Allow users to avoid censorship when they are geo-blocked or have network limitations.

        @[JSON::Field(key: "enableOpenAccessOption")]
        getter enable_open_access_option : Bool?

        # Enables restricted global federation, limiting external communication to only specified permitted
        # networks.

        @[JSON::Field(key: "enableRestrictedGlobalFederation")]
        getter enable_restricted_global_federation : Bool?

        # The local federation mode controlling how users can communicate with other networks. Values: 0
        # (none), 1 (federated), 2 (restricted).

        @[JSON::Field(key: "federationMode")]
        getter federation_mode : Int32?

        # Enables file sharing capabilities, allowing users to send and receive files in conversations.

        @[JSON::Field(key: "filesEnabled")]
        getter files_enabled : Bool?

        # Defines the number of failed login attempts before data stored on the device is reset. Should be
        # less than lockoutThreshold.

        @[JSON::Field(key: "forceDeviceLockout")]
        getter force_device_lockout : Int32?

        # Automatically enable and enforce Wickr open access on all devices. Valid only if
        # enableOpenAccessOption settings is enabled.

        @[JSON::Field(key: "forceOpenAccess")]
        getter force_open_access : Bool?

        # Allow user approved bots to read messages in rooms without using a slash command.

        @[JSON::Field(key: "forceReadReceipts")]
        getter force_read_receipts : Bool?

        # Allows users to communicate with users on other Wickr instances (Wickr Enterprise) outside the
        # current network.

        @[JSON::Field(key: "globalFederation")]
        getter global_federation : Bool?

        # Enforces a two-factor authentication when a user adds a new device to their account.

        @[JSON::Field(key: "isAtoEnabled")]
        getter is_ato_enabled : Bool?

        # Enables automatic preview of links shared in messages, showing webpage thumbnails and descriptions.

        @[JSON::Field(key: "isLinkPreviewEnabled")]
        getter is_link_preview_enabled : Bool?

        # Allows map integration in location sharing, enabling users to view shared locations on interactive
        # maps. Only allowed when location setting is enabled.

        @[JSON::Field(key: "locationAllowMaps")]
        getter location_allow_maps : Bool?

        # Enables location sharing features, allowing users to share their current location with others.

        @[JSON::Field(key: "locationEnabled")]
        getter location_enabled : Bool?

        # The number of failed password attempts before a user account is locked out.

        @[JSON::Field(key: "lockoutThreshold")]
        getter lockout_threshold : Int32?

        # The maximum file size in bytes that will be automatically downloaded without user confirmation. Only
        # allowed if fileDownload is enabled. Valid Values [512000 (low_quality), 7340032 (high_quality) ]

        @[JSON::Field(key: "maxAutoDownloadSize")]
        getter max_auto_download_size : Int64?

        # The maximum burn-on-read (BOR) time in seconds, which determines how long messages remain visible
        # before auto-deletion after being read.

        @[JSON::Field(key: "maxBor")]
        getter max_bor : Int32?

        # The maximum time-to-live (TTL) in seconds for messages, after which they will be automatically
        # deleted from all devices.

        @[JSON::Field(key: "maxTtl")]
        getter max_ttl : Int64?

        # Enables message forwarding, allowing users to forward messages from one conversation to another.

        @[JSON::Field(key: "messageForwardingEnabled")]
        getter message_forwarding_enabled : Bool?

        # The password complexity requirements that users must follow when creating or changing passwords.

        @[JSON::Field(key: "passwordRequirements")]
        getter password_requirements : Types::PasswordRequirements?

        # A list of network IDs that are permitted for local federation when federation mode is set to
        # restricted.

        @[JSON::Field(key: "permittedNetworks")]
        getter permitted_networks : Array(String)?

        # A list of permitted Wickr networks for global federation, restricting communication to specific
        # approved networks.

        @[JSON::Field(key: "permittedWickrAwsNetworks")]
        getter permitted_wickr_aws_networks : Array(Types::WickrAwsNetworks)?

        # A list of permitted Wickr Enterprise networks for global federation, restricting communication to
        # specific approved networks.

        @[JSON::Field(key: "permittedWickrEnterpriseNetworks")]
        getter permitted_wickr_enterprise_networks : Array(Types::PermittedWickrEnterpriseNetwork)?

        # Enables presence indicators that show whether users are online, away, or offline.

        @[JSON::Field(key: "presenceEnabled")]
        getter presence_enabled : Bool?

        # A list of pre-defined quick response message templates that users can send with a single tap.

        @[JSON::Field(key: "quickResponses")]
        getter quick_responses : Array(String)?

        # Users will get a master recovery key that can be used to securely sign in to their Wickr account
        # without having access to their primary device for authentication. Available in SSO enabled network.

        @[JSON::Field(key: "showMasterRecoveryKey")]
        getter show_master_recovery_key : Bool?

        # The message shredder configuration that controls secure deletion of messages and files from devices.

        @[JSON::Field(key: "shredder")]
        getter shredder : Types::ShredderSettings?

        # The duration for which users SSO session remains inactive before automatically logging them out for
        # security. Available in SSO enabled network.

        @[JSON::Field(key: "ssoMaxIdleMinutes")]
        getter sso_max_idle_minutes : Int32?

        def initialize(
          @always_reauthenticate : Bool? = nil,
          @atak_package_values : Array(String)? = nil,
          @calling : Types::CallingSettings? = nil,
          @check_for_updates : Bool? = nil,
          @enable_atak : Bool? = nil,
          @enable_crash_reports : Bool? = nil,
          @enable_file_download : Bool? = nil,
          @enable_guest_federation : Bool? = nil,
          @enable_notification_preview : Bool? = nil,
          @enable_open_access_option : Bool? = nil,
          @enable_restricted_global_federation : Bool? = nil,
          @federation_mode : Int32? = nil,
          @files_enabled : Bool? = nil,
          @force_device_lockout : Int32? = nil,
          @force_open_access : Bool? = nil,
          @force_read_receipts : Bool? = nil,
          @global_federation : Bool? = nil,
          @is_ato_enabled : Bool? = nil,
          @is_link_preview_enabled : Bool? = nil,
          @location_allow_maps : Bool? = nil,
          @location_enabled : Bool? = nil,
          @lockout_threshold : Int32? = nil,
          @max_auto_download_size : Int64? = nil,
          @max_bor : Int32? = nil,
          @max_ttl : Int64? = nil,
          @message_forwarding_enabled : Bool? = nil,
          @password_requirements : Types::PasswordRequirements? = nil,
          @permitted_networks : Array(String)? = nil,
          @permitted_wickr_aws_networks : Array(Types::WickrAwsNetworks)? = nil,
          @permitted_wickr_enterprise_networks : Array(Types::PermittedWickrEnterpriseNetwork)? = nil,
          @presence_enabled : Bool? = nil,
          @quick_responses : Array(String)? = nil,
          @show_master_recovery_key : Bool? = nil,
          @shredder : Types::ShredderSettings? = nil,
          @sso_max_idle_minutes : Int32? = nil
        )
        end
      end

      # Contains the security group configuration settings that can be specified when creating or updating a
      # security group. This is a subset of SecurityGroupSettings containing only the modifiable federation
      # and security settings.

      struct SecurityGroupSettingsRequest
        include JSON::Serializable

        # Guest users let you work with people outside your organization that only have limited access to
        # Wickr. Only valid when federationMode is set to Global.

        @[JSON::Field(key: "enableGuestFederation")]
        getter enable_guest_federation : Bool?

        # Enables restricted global federation to limit communication to specific permitted networks only.
        # Requires globalFederation to be enabled.

        @[JSON::Field(key: "enableRestrictedGlobalFederation")]
        getter enable_restricted_global_federation : Bool?

        # The local federation mode. Values: 0 (none), 1 (federated - all networks), 2 (restricted - only
        # permitted networks).

        @[JSON::Field(key: "federationMode")]
        getter federation_mode : Int32?

        # Allow users to securely federate with all Amazon Web Services Wickr networks and Amazon Web Services
        # Enterprise networks.

        @[JSON::Field(key: "globalFederation")]
        getter global_federation : Bool?

        # The number of failed password attempts before a user account is locked out.

        @[JSON::Field(key: "lockoutThreshold")]
        getter lockout_threshold : Int32?

        # A list of network IDs that are permitted for local federation when federation mode is set to
        # restricted.

        @[JSON::Field(key: "permittedNetworks")]
        getter permitted_networks : Array(String)?

        # A list of permitted Amazon Web Services Wickr networks for restricted global federation.

        @[JSON::Field(key: "permittedWickrAwsNetworks")]
        getter permitted_wickr_aws_networks : Array(Types::WickrAwsNetworks)?

        # A list of permitted Wickr Enterprise networks for restricted global federation.

        @[JSON::Field(key: "permittedWickrEnterpriseNetworks")]
        getter permitted_wickr_enterprise_networks : Array(Types::PermittedWickrEnterpriseNetwork)?

        def initialize(
          @enable_guest_federation : Bool? = nil,
          @enable_restricted_global_federation : Bool? = nil,
          @federation_mode : Int32? = nil,
          @global_federation : Bool? = nil,
          @lockout_threshold : Int32? = nil,
          @permitted_networks : Array(String)? = nil,
          @permitted_wickr_aws_networks : Array(Types::WickrAwsNetworks)? = nil,
          @permitted_wickr_enterprise_networks : Array(Types::PermittedWickrEnterpriseNetwork)? = nil
        )
        end
      end

      # Represents a single network-level configuration setting with its name, value, and data type.
      # Settings control network-wide behaviors and features.

      struct Setting
        include JSON::Serializable

        # The name of the network setting (e.g., 'enableClientMetrics', 'dataRetention').

        @[JSON::Field(key: "optionName")]
        getter option_name : String

        # The data type of the setting value (e.g., 'boolean', 'string', 'number').

        @[JSON::Field(key: "type")]
        getter type : String

        # The current value of the setting as a string. Boolean values are represented as 'true' or 'false'.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @option_name : String,
          @type : String,
          @value : String
        )
        end
      end

      # Configuration for the message shredder feature, which securely deletes messages and files from
      # devices to prevent data recovery.

      struct ShredderSettings
        include JSON::Serializable

        # Specifies whether users can manually trigger the shredder to delete content.

        @[JSON::Field(key: "canProcessManually")]
        getter can_process_manually : Bool?

        # Prevents Wickr data from being recovered by overwriting deleted Wickr data. Valid Values: Must be
        # one of [0, 20, 60, 100]

        @[JSON::Field(key: "intensity")]
        getter intensity : Int32?

        def initialize(
          @can_process_manually : Bool? = nil,
          @intensity : Int32? = nil
        )
        end
      end

      # The request was not authenticated or the authentication credentials were invalid. This error occurs
      # when the request lacks valid authentication credentials or the credentials have expired.

      struct UnauthorizedError
        include JSON::Serializable

        # A message explaining why the authentication failed.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateBotRequest
        include JSON::Serializable

        # The unique identifier of the bot to update.

        @[JSON::Field(key: "botId")]
        getter bot_id : String

        # The ID of the Wickr network containing the bot to update.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The new password for the bot account.

        @[JSON::Field(key: "challenge")]
        getter challenge : String?

        # The new display name for the bot.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The ID of the new security group to assign the bot to.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # Set to true to suspend the bot or false to unsuspend it. Omit this field for standard updates that
        # don't affect suspension status.

        @[JSON::Field(key: "suspend")]
        getter suspend : Bool?

        def initialize(
          @bot_id : String,
          @network_id : String,
          @challenge : String? = nil,
          @display_name : String? = nil,
          @group_id : String? = nil,
          @suspend : Bool? = nil
        )
        end
      end


      struct UpdateBotResponse
        include JSON::Serializable

        # A message indicating the result of the bot update operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateDataRetentionRequest
        include JSON::Serializable

        # The action to perform. Valid values are 'ENABLE' (to enable the data retention service), 'DISABLE'
        # (to disable the service), or 'PUBKEY_MSG_ACK' (to acknowledge the public key message).

        @[JSON::Field(key: "actionType")]
        getter action_type : String

        # The ID of the Wickr network containing the data retention bot.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @action_type : String,
          @network_id : String
        )
        end
      end


      struct UpdateDataRetentionResponse
        include JSON::Serializable

        # A message indicating the result of the update operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateGuestUserRequest
        include JSON::Serializable

        # Set to true to block the guest user or false to unblock them.

        @[JSON::Field(key: "block")]
        getter block : Bool

        # The ID of the Wickr network where the guest user's status will be updated.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The username hash (unique identifier) of the guest user to update.

        @[JSON::Field(key: "usernameHash")]
        getter username_hash : String

        def initialize(
          @block : Bool,
          @network_id : String,
          @username_hash : String
        )
        end
      end


      struct UpdateGuestUserResponse
        include JSON::Serializable

        # A message indicating the result of the update operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateNetworkRequest
        include JSON::Serializable

        # The ID of the Wickr network to update.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The new name for the network. Must be between 1 and 20 characters.

        @[JSON::Field(key: "networkName")]
        getter network_name : String

        # A unique identifier for this request to ensure idempotency.

        @[JSON::Field(key: "X-Client-Token")]
        getter client_token : String?

        # The ARN of the Amazon Web Services KMS customer managed key to use for encrypting sensitive data in
        # the network.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @network_id : String,
          @network_name : String,
          @client_token : String? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end


      struct UpdateNetworkResponse
        include JSON::Serializable

        # A message indicating that the network was updated successfully.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateNetworkSettingsRequest
        include JSON::Serializable

        # The ID of the Wickr network whose settings will be updated.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A map of setting names to their new values. Each setting should be provided with its appropriate
        # type (boolean, string, number, etc.).

        @[JSON::Field(key: "settings")]
        getter settings : Types::NetworkSettings

        def initialize(
          @network_id : String,
          @settings : Types::NetworkSettings
        )
        end
      end


      struct UpdateNetworkSettingsResponse
        include JSON::Serializable

        # A list of the updated network settings, showing the new values for each modified setting.

        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::Setting)

        def initialize(
          @settings : Array(Types::Setting)
        )
        end
      end


      struct UpdateSecurityGroupRequest
        include JSON::Serializable

        # The unique identifier of the security group to update.

        @[JSON::Field(key: "groupId")]
        getter group_id : String

        # The ID of the Wickr network containing the security group to update.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The new name for the security group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The updated configuration settings for the security group. Federation mode - 0 (Local federation), 1
        # (Restricted federation), 2 (Global federation)

        @[JSON::Field(key: "securityGroupSettings")]
        getter security_group_settings : Types::SecurityGroupSettings?

        def initialize(
          @group_id : String,
          @network_id : String,
          @name : String? = nil,
          @security_group_settings : Types::SecurityGroupSettings? = nil
        )
        end
      end


      struct UpdateSecurityGroupResponse
        include JSON::Serializable

        # The updated security group details, including the new settings.

        @[JSON::Field(key: "securityGroup")]
        getter security_group : Types::SecurityGroup

        def initialize(
          @security_group : Types::SecurityGroup
        )
        end
      end

      # Contains the modifiable details for updating an existing user, including name, password, security
      # group membership, and invitation settings. A user can only be assigned to a single security group.
      # Attempting to add a user to multiple security groups is not supported and will result in an error.

      struct UpdateUserDetails
        include JSON::Serializable

        # Indicates whether the user can be verified through a custom invite code.

        @[JSON::Field(key: "codeValidation")]
        getter code_validation : Bool?

        # The new first name for the user.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # A new custom invite code for the user.

        @[JSON::Field(key: "inviteCode")]
        getter invite_code : String?

        # The new time-to-live for the invite code in days.

        @[JSON::Field(key: "inviteCodeTtl")]
        getter invite_code_ttl : Int32?

        # The new last name for the user.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The updated list of security group IDs to which the user should belong.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The new username or email address for the user.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @code_validation : Bool? = nil,
          @first_name : String? = nil,
          @invite_code : String? = nil,
          @invite_code_ttl : Int32? = nil,
          @last_name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @username : String? = nil
        )
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The ID of the Wickr network containing the user to update.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the user to update.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # An object containing the user details to be updated, such as name, password, security groups, and
        # invite code settings.

        @[JSON::Field(key: "userDetails")]
        getter user_details : Types::UpdateUserDetails?

        def initialize(
          @network_id : String,
          @user_id : String,
          @user_details : Types::UpdateUserDetails? = nil
        )
        end
      end


      struct UpdateUserResponse
        include JSON::Serializable

        # The ID of the network where the user was updated.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Indicates whether the user is suspended after the update.

        @[JSON::Field(key: "suspended")]
        getter suspended : Bool

        # The unique identifier of the updated user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # Indicates whether the user can be verified through a custom invite code.

        @[JSON::Field(key: "codeValidation")]
        getter code_validation : Bool?

        # The updated first name of the user.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The updated invite code for the user, if applicable.

        @[JSON::Field(key: "inviteCode")]
        getter invite_code : String?

        # The expiration time of the user's invite code, specified in epoch seconds.

        @[JSON::Field(key: "inviteExpiration")]
        getter invite_expiration : Int32?

        # The updated last name of the user.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The middle name of the user (currently not used).

        @[JSON::Field(key: "middleName")]
        getter middle_name : String?

        # The timestamp when the user was last modified, specified in epoch seconds.

        @[JSON::Field(key: "modified")]
        getter modified : Int32?

        # The list of security group IDs to which the user now belongs after the update.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The user's status after the update.

        @[JSON::Field(key: "status")]
        getter status : Int32?

        def initialize(
          @network_id : String,
          @suspended : Bool,
          @user_id : String,
          @code_validation : Bool? = nil,
          @first_name : String? = nil,
          @invite_code : String? = nil,
          @invite_expiration : Int32? = nil,
          @last_name : String? = nil,
          @middle_name : String? = nil,
          @modified : Int32? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : Int32? = nil
        )
        end
      end

      # Represents a user account in a Wickr network with detailed profile information, status, security
      # settings, and authentication details. codeValidation, inviteCode and inviteCodeTtl are restricted to
      # networks under preview only.

      struct User
        include JSON::Serializable

        # The phone number minus country code, used for cloud deployments.

        @[JSON::Field(key: "cell")]
        getter cell : String?

        # The number of failed password attempts for enterprise deployments, used for account lockout
        # policies.

        @[JSON::Field(key: "challengeFailures")]
        getter challenge_failures : Int32?

        # Indicates whether the user can be verified through a custom invite code.

        @[JSON::Field(key: "codeValidation")]
        getter code_validation : Bool?

        # The country code for the user's phone number, used for cloud deployments.

        @[JSON::Field(key: "countryCode")]
        getter country_code : String?

        # The first name of the user.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The invitation code for this user, used during registration to join the network.

        @[JSON::Field(key: "inviteCode")]
        getter invite_code : String?

        # Indicates whether the user has administrator privileges in the network.

        @[JSON::Field(key: "isAdmin")]
        getter is_admin : Bool?

        # Indicates whether the user's email invitation code has expired, applicable to cloud deployments.

        @[JSON::Field(key: "isInviteExpired")]
        getter is_invite_expired : Bool?

        # Indicates whether this account is a user (as opposed to a bot or other account type).

        @[JSON::Field(key: "isUser")]
        getter is_user : Bool?

        # The last name of the user.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # Indicates whether one-time password (OTP) authentication is enabled for the user.

        @[JSON::Field(key: "otpEnabled")]
        getter otp_enabled : Bool?

        # The SCIM (System for Cross-domain Identity Management) identifier for the user, used for identity
        # synchronization. Currently not used.

        @[JSON::Field(key: "scimId")]
        getter scim_id : String?

        # A list of security group IDs to which the user is assigned, determining their permissions and
        # feature access.

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The current status of the user (1 for pending invitation, 2 for active).

        @[JSON::Field(key: "status")]
        getter status : Int32?

        # Indicates whether the user is currently suspended and unable to access the network.

        @[JSON::Field(key: "suspended")]
        getter suspended : Bool?

        # The descriptive type of the user account (e.g., 'user').

        @[JSON::Field(key: "type")]
        getter type : String?

        # The unique identifier for the user.

        @[JSON::Field(key: "uname")]
        getter uname : String?

        # The unique identifier for the user within the network.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # The email address or username of the user. For bots, this must end in 'bot'.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @cell : String? = nil,
          @challenge_failures : Int32? = nil,
          @code_validation : Bool? = nil,
          @country_code : String? = nil,
          @first_name : String? = nil,
          @invite_code : String? = nil,
          @is_admin : Bool? = nil,
          @is_invite_expired : Bool? = nil,
          @is_user : Bool? = nil,
          @last_name : String? = nil,
          @otp_enabled : Bool? = nil,
          @scim_id : String? = nil,
          @security_groups : Array(String)? = nil,
          @status : Int32? = nil,
          @suspended : Bool? = nil,
          @type : String? = nil,
          @uname : String? = nil,
          @user_id : String? = nil,
          @username : String? = nil
        )
        end
      end

      # One or more fields in the request failed validation. This error provides detailed information about
      # which fields were invalid and why, allowing you to correct the request and retry.

      struct ValidationError
        include JSON::Serializable

        # A list of validation error details, where each item identifies a specific field that failed
        # validation and explains the reason for the failure.

        @[JSON::Field(key: "reasons")]
        getter reasons : Array(Types::ErrorDetail)?

        def initialize(
          @reasons : Array(Types::ErrorDetail)? = nil
        )
        end
      end

      # Identifies a Amazon Web Services Wickr network by region and network ID, used for configuring
      # permitted networks for global federation.

      struct WickrAwsNetworks
        include JSON::Serializable

        # The network ID of the Wickr Amazon Web Services network.

        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The Amazon Web Services region identifier where the network is hosted (e.g., 'us-east-1').

        @[JSON::Field(key: "region")]
        getter region : String

        def initialize(
          @network_id : String,
          @region : String
        )
        end
      end
    end
  end
end
