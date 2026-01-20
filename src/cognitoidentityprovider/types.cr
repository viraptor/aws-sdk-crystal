require "json"
require "time"

module Aws
  module CognitoIdentityProvider
    module Types

      # The settings for user message delivery in forgot-password operations. Contains preference for email
      # or SMS message delivery of password reset codes, or for admin-only password reset.

      struct AccountRecoverySettingType
        include JSON::Serializable

        # The list of options and priorities for user message delivery in forgot-password operations. Sets or
        # displays user pool preferences for email or SMS message priority, whether users should fall back to
        # a second delivery method, and whether passwords should only be reset by administrators.

        @[JSON::Field(key: "RecoveryMechanisms")]
        getter recovery_mechanisms : Array(Types::RecoveryOptionType)?

        def initialize(
          @recovery_mechanisms : Array(Types::RecoveryOptionType)? = nil
        )
        end
      end

      # The automated response to a risk level for adaptive authentication in full-function, or ENFORCED ,
      # mode. You can assign an action to each risk level that threat protection evaluates.

      struct AccountTakeoverActionType
        include JSON::Serializable

        # The action to take for the attempted account takeover action for the associated risk level. Valid
        # values are as follows: BLOCK : Block the request. MFA_IF_CONFIGURED : Present an MFA challenge if
        # possible. MFA is possible if the user pool has active MFA methods that the user can set up. For
        # example, if the user pool only supports SMS message MFA but the user doesn't have a phone number
        # attribute, MFA setup isn't possible. If MFA setup isn't possible, allow the request. MFA_REQUIRED :
        # Present an MFA challenge if possible. Block the request if a user hasn't set up MFA. To sign in with
        # required MFA, users must have an email address or phone number attribute, or a registered TOTP
        # factor. NO_ACTION : Take no action. Permit sign-in.

        @[JSON::Field(key: "EventAction")]
        getter event_action : String

        # Determines whether Amazon Cognito sends a user a notification message when your user pools assesses
        # a user's session at the associated risk level.

        @[JSON::Field(key: "Notify")]
        getter notify : Bool

        def initialize(
          @event_action : String,
          @notify : Bool
        )
        end
      end

      # A list of account-takeover actions for each level of risk that Amazon Cognito might assess with
      # threat protection features.

      struct AccountTakeoverActionsType
        include JSON::Serializable

        # The action that you assign to a high-risk assessment by threat protection.

        @[JSON::Field(key: "HighAction")]
        getter high_action : Types::AccountTakeoverActionType?

        # The action that you assign to a low-risk assessment by threat protection.

        @[JSON::Field(key: "LowAction")]
        getter low_action : Types::AccountTakeoverActionType?

        # The action that you assign to a medium-risk assessment by threat protection.

        @[JSON::Field(key: "MediumAction")]
        getter medium_action : Types::AccountTakeoverActionType?

        def initialize(
          @high_action : Types::AccountTakeoverActionType? = nil,
          @low_action : Types::AccountTakeoverActionType? = nil,
          @medium_action : Types::AccountTakeoverActionType? = nil
        )
        end
      end

      # The settings for automated responses and notification templates for adaptive authentication with
      # threat protection features.

      struct AccountTakeoverRiskConfigurationType
        include JSON::Serializable

        # A list of account-takeover actions for each level of risk that Amazon Cognito might assess with
        # threat protection.

        @[JSON::Field(key: "Actions")]
        getter actions : Types::AccountTakeoverActionsType

        # The settings for composing and sending an email message when threat protection assesses a risk level
        # with adaptive authentication. When you choose to notify users in AccountTakeoverRiskConfiguration ,
        # Amazon Cognito sends an email message using the method and template that you set with this data
        # type.

        @[JSON::Field(key: "NotifyConfiguration")]
        getter notify_configuration : Types::NotifyConfigurationType?

        def initialize(
          @actions : Types::AccountTakeoverActionsType,
          @notify_configuration : Types::NotifyConfigurationType? = nil
        )
        end
      end

      # Represents the request to add custom attributes.

      struct AddCustomAttributesRequest
        include JSON::Serializable

        # An array of custom attribute names and other properties. Sets the following characteristics:
        # AttributeDataType The expected data type. Can be a string, a number, a date and time, or a boolean.
        # Mutable If true, you can grant app clients write access to the attribute value. If false, the
        # attribute value can only be set up on sign-up or administrator creation of users. Name The attribute
        # name. For an attribute like custom:myAttribute , enter myAttribute for this field. Required When
        # true, users who sign up or are created must set a value for the attribute.
        # NumberAttributeConstraints The minimum and maximum length of accepted values for a Number -type
        # attribute. StringAttributeConstraints The minimum and maximum length of accepted values for a String
        # -type attribute. DeveloperOnlyAttribute This legacy option creates an attribute with a dev: prefix.
        # You can only set the value of a developer-only attribute with administrative IAM credentials.

        @[JSON::Field(key: "CustomAttributes")]
        getter custom_attributes : Array(Types::SchemaAttributeType)

        # The ID of the user pool where you want to add custom attributes.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @custom_attributes : Array(Types::SchemaAttributeType),
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server for the request to add custom attributes.

      struct AddCustomAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AdminAddUserToGroupRequest
        include JSON::Serializable

        # The name of the group that you want to add your user to.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool that contains the group that you want to add the user to.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @group_name : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Confirm a user's registration as a user pool administrator.

      struct AdminConfirmSignUpRequest
        include JSON::Serializable

        # The ID of the user pool where you want to confirm a user's sign-up request.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. If your user pool configuration includes triggers, the AdminConfirmSignUp API
        # action invokes the Lambda function that is specified for the post confirmation trigger. When Amazon
        # Cognito invokes this function, it passes a JSON payload, which the function receives as input. In
        # this payload, the clientMetadata attribute provides the data that you assigned to the ClientMetadata
        # parameter in your AdminConfirmSignUp request. In your function code in Lambda, you can process the
        # ClientMetadata value to enhance your workflow for your specific needs. For more information, see
        # Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata
        # parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata value. This
        # data is available only to Lambda triggers that are assigned to a user pool to support custom
        # workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter
        # serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send
        # sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @client_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response from the server for the request to confirm registration.

      struct AdminConfirmSignUpResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The settings for administrator creation of users in a user pool. Contains settings for allowing user
      # sign-up, customizing invitation messages to new users, and the amount of time before temporary
      # passwords expire.

      struct AdminCreateUserConfigType
        include JSON::Serializable

        # The setting for allowing self-service sign-up. When true , only administrators can create new user
        # profiles. When false , users can register themselves and create a new user profile with the SignUp
        # operation.

        @[JSON::Field(key: "AllowAdminCreateUserOnly")]
        getter allow_admin_create_user_only : Bool?

        # The template for the welcome message to new users. This template must include the {####} temporary
        # password placeholder if you are creating users with passwords. If your users don't have passwords,
        # you can omit the placeholder. See also Customizing User Invitation Messages .

        @[JSON::Field(key: "InviteMessageTemplate")]
        getter invite_message_template : Types::MessageTemplateType?

        # This parameter is no longer in use. The password expiration limit in days for administrator-created
        # users. When this time expires, the user can't sign in with their temporary password. To reset the
        # account after that time limit, you must call AdminCreateUser again, specifying RESEND for the
        # MessageAction parameter. The default value for this parameter is 7.

        @[JSON::Field(key: "UnusedAccountValidityDays")]
        getter unused_account_validity_days : Int32?

        def initialize(
          @allow_admin_create_user_only : Bool? = nil,
          @invite_message_template : Types::MessageTemplateType? = nil,
          @unused_account_validity_days : Int32? = nil
        )
        end
      end

      # Creates a new user in the specified user pool.

      struct AdminCreateUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to create a user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The value that you want to set as the username sign-in attribute. The following conditions apply to
        # the username parameter. The username can't be a duplicate of another username in the same user pool.
        # You can't change the value of a username after you create it. You can only provide a value if
        # usernames are a valid sign-in attribute for your user pool. If your user pool only supports phone
        # numbers or email addresses as sign-in attributes, Amazon Cognito automatically generates a username
        # value. For more information, see Customizing sign-in attributes .

        @[JSON::Field(key: "Username")]
        getter username : String

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the AdminCreateUser API action, Amazon Cognito invokes the function that is assigned to
        # the pre sign-up trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which
        # the function receives as input. This payload contains a ClientMetadata attribute, which provides the
        # data that you assigned to the ClientMetadata parameter in your AdminCreateUser request. In your
        # function code in Lambda, you can process the clientMetadata value to enhance your workflow for your
        # specific needs. For more information, see Using Lambda triggers in the Amazon Cognito Developer
        # Guide . When you use the ClientMetadata parameter, note that Amazon Cognito won't do the following:
        # Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to
        # a user pool to support custom workflows. If your user pool configuration doesn't include triggers,
        # the ClientMetadata parameter serves no purpose. Validate the ClientMetadata value. Encrypt the
        # ClientMetadata value. Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # Specify EMAIL if email will be used to send the welcome message. Specify SMS if the phone number
        # will be used. The default value is SMS . You can specify more than one value.

        @[JSON::Field(key: "DesiredDeliveryMediums")]
        getter desired_delivery_mediums : Array(String)?

        # This parameter is used only if the phone_number_verified or email_verified attribute is set to True
        # . Otherwise, it is ignored. If this parameter is set to True and the phone number or email address
        # specified in the UserAttributes parameter already exists as an alias with a different user, this
        # request migrates the alias from the previous user to the newly-created user. The previous user will
        # no longer be able to log in using that alias. If this parameter is set to False , the API throws an
        # AliasExistsException error if the alias already exists. The default value is False .

        @[JSON::Field(key: "ForceAliasCreation")]
        getter force_alias_creation : Bool?

        # Set to RESEND to resend the invitation message to a user that already exists, and to reset the
        # temporary-password duration with a new temporary password. Set to SUPPRESS to suppress sending the
        # message. You can specify only one value.

        @[JSON::Field(key: "MessageAction")]
        getter message_action : String?

        # The user's temporary password. This password must conform to the password policy that you specified
        # when you created the user pool. The exception to the requirement for a password is when your user
        # pool supports passwordless sign-in with email or SMS OTPs. To create a user with no password, omit
        # this parameter or submit a blank value. You can only create a passwordless user when passwordless
        # sign-in is available. The temporary password is valid only once. To complete the Admin Create User
        # flow, the user must enter the temporary password in the sign-in page, along with a new password to
        # be used in all future sign-ins. If you don't specify a value, Amazon Cognito generates one for you
        # unless you have passwordless options active for your user pool. The temporary password can only be
        # used until the user account expiration limit that you set for your user pool. To reset the account
        # after that time limit, you must call AdminCreateUser again and specify RESEND for the MessageAction
        # parameter.

        @[JSON::Field(key: "TemporaryPassword")]
        getter temporary_password : String?

        # An array of name-value pairs that contain user attributes and attribute values to be set for the
        # user to be created. You can create a user without specifying any attributes other than Username .
        # However, any attributes that you specify as required (when creating a user pool or in the Attributes
        # tab of the console) either you should supply (in your call to AdminCreateUser ) or the user should
        # supply (when they sign up in response to your welcome message). For custom attributes, you must
        # prepend the custom: prefix to the attribute name. To send a message inviting the user to sign up,
        # you must specify the user's email address or phone number. You can do this in your call to
        # AdminCreateUser or in the Users tab of the Amazon Cognito console for managing your user pools. You
        # must also provide an email address or phone number when you expect the user to do passwordless
        # sign-in with an email or SMS OTP. These attributes must be provided when passwordless options are
        # the only available, or when you don't submit a TemporaryPassword . In your AdminCreateUser request,
        # you can set the email_verified and phone_number_verified attributes to true . The following
        # conditions apply: email The email address where you want the user to receive their confirmation code
        # and username. You must provide a value for email when you want to set email_verified to true , or if
        # you set EMAIL in the DesiredDeliveryMediums parameter. phone_number The phone number where you want
        # the user to receive their confirmation code and username. You must provide a value for phone_number
        # when you want to set phone_number_verified to true , or if you set SMS in the DesiredDeliveryMediums
        # parameter.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)?

        # Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda trigger. This
        # set of key-value pairs are for custom validation of information that you collect from your users but
        # don't need to retain. Your Lambda function can analyze this additional data and act on it. Your
        # function can automatically confirm and verify select users or perform external API operations like
        # logging user attributes and validation data to Amazon CloudWatch Logs. For more information about
        # the pre sign-up Lambda trigger, see Pre sign-up Lambda trigger .

        @[JSON::Field(key: "ValidationData")]
        getter validation_data : Array(Types::AttributeType)?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @client_metadata : Hash(String, String)? = nil,
          @desired_delivery_mediums : Array(String)? = nil,
          @force_alias_creation : Bool? = nil,
          @message_action : String? = nil,
          @temporary_password : String? = nil,
          @user_attributes : Array(Types::AttributeType)? = nil,
          @validation_data : Array(Types::AttributeType)? = nil
        )
        end
      end

      # Represents the response from the server to the request to create the user.

      struct AdminCreateUserResponse
        include JSON::Serializable

        # The new user's profile details.

        @[JSON::Field(key: "User")]
        getter user : Types::UserType?

        def initialize(
          @user : Types::UserType? = nil
        )
        end
      end

      # Represents the request to delete user attributes as an administrator.

      struct AdminDeleteUserAttributesRequest
        include JSON::Serializable

        # An array of strings representing the user attribute names you want to delete. For custom attributes,
        # you must prepend the custom: prefix to the attribute name.

        @[JSON::Field(key: "UserAttributeNames")]
        getter user_attribute_names : Array(String)

        # The ID of the user pool where you want to delete user attributes.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_attribute_names : Array(String),
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the response received from the server for a request to delete user attributes.

      struct AdminDeleteUserAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to delete a user as an administrator.

      struct AdminDeleteUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to delete the user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_pool_id : String,
          @username : String
        )
        end
      end


      struct AdminDisableProviderForUserRequest
        include JSON::Serializable

        # The user profile that you want to delete a linked identity from.

        @[JSON::Field(key: "User")]
        getter user : Types::ProviderUserIdentifierType

        # The ID of the user pool where you want to delete the user's linked identities.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user : Types::ProviderUserIdentifierType,
          @user_pool_id : String
        )
        end
      end


      struct AdminDisableProviderForUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to disable the user as an administrator.

      struct AdminDisableUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to disable the user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the response received from the server to disable the user as an administrator.

      struct AdminDisableUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request that enables the user as an administrator.

      struct AdminEnableUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to activate sign-in for the user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the response from the server for the request to enable a user as an administrator.

      struct AdminEnableUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Sends the forgot device request, as an administrator.

      struct AdminForgetDeviceRequest
        include JSON::Serializable

        # The key ID of the device that you want to delete.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # The ID of the user pool where the device owner is a user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @device_key : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the request to get the device, as an administrator.

      struct AdminGetDeviceRequest
        include JSON::Serializable

        # The key of the device that you want to delete.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # The ID of the user pool where the device owner is a user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @device_key : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Gets the device response, as an administrator.

      struct AdminGetDeviceResponse
        include JSON::Serializable

        # Details of the requested device. Includes device information, last-accessed and created dates, and
        # the device key.

        @[JSON::Field(key: "Device")]
        getter device : Types::DeviceType

        def initialize(
          @device : Types::DeviceType
        )
        end
      end

      # Represents the request to get the specified user as an administrator.

      struct AdminGetUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to get information about the user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the response from the server from the request to get the specified user as an
      # administrator.

      struct AdminGetUserResponse
        include JSON::Serializable

        # The username of the user that you requested.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Indicates whether the user is activated for sign-in.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # This response parameter is no longer supported. It provides information only about SMS MFA
        # configurations. It doesn't provide information about time-based one-time password (TOTP) software
        # token MFA configurations. To look up information about either type of MFA configuration, use
        # UserMFASettingList instead.

        @[JSON::Field(key: "MFAOptions")]
        getter mfa_options : Array(Types::MFAOptionType)?

        # The user's preferred MFA. Users can prefer SMS message, email message, or TOTP MFA.

        @[JSON::Field(key: "PreferredMfaSetting")]
        getter preferred_mfa_setting : String?

        # An array of name-value pairs of user attributes and their values, for example "email":
        # "testuser@example.com" .

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "UserCreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter user_create_date : Time?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "UserLastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter user_last_modified_date : Time?

        # The MFA options that are activated for the user. The possible values in this list are SMS_MFA ,
        # EMAIL_OTP , and SOFTWARE_TOKEN_MFA .

        @[JSON::Field(key: "UserMFASettingList")]
        getter user_mfa_setting_list : Array(String)?

        # The user's status. Can be one of the following: UNCONFIRMED - User has been created but not
        # confirmed. CONFIRMED - User has been confirmed. UNKNOWN - User status isn't known. RESET_REQUIRED -
        # User is confirmed, but the user must request a code and reset their password before they can sign
        # in. FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a temporary
        # password, but on first sign-in, the user must change their password to a new value before doing
        # anything else. EXTERNAL_PROVIDER - The user signed in with a third-party identity provider.

        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        def initialize(
          @username : String,
          @enabled : Bool? = nil,
          @mfa_options : Array(Types::MFAOptionType)? = nil,
          @preferred_mfa_setting : String? = nil,
          @user_attributes : Array(Types::AttributeType)? = nil,
          @user_create_date : Time? = nil,
          @user_last_modified_date : Time? = nil,
          @user_mfa_setting_list : Array(String)? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Initiates the authorization request, as an administrator.

      struct AdminInitiateAuthRequest
        include JSON::Serializable

        # The authentication flow that you want to initiate. Each AuthFlow has linked AuthParameters that you
        # must submit. The following are some example flows. USER_AUTH The entry point for choice-based
        # authentication with passwords, one-time passwords, and WebAuthn authenticators. Request a preferred
        # authentication type or review available authentication types. From the offered authentication types,
        # select one in a challenge response and then authenticate with that method in an additional challenge
        # response. To activate this setting, your user pool must be in the Essentials tier or higher.
        # USER_SRP_AUTH Username-password authentication with the Secure Remote Password (SRP) protocol. For
        # more information, see Use SRP password verification in custom authentication flow .
        # REFRESH_TOKEN_AUTH and REFRESH_TOKEN Receive new ID and access tokens when you pass a REFRESH_TOKEN
        # parameter with a valid refresh token as the value. For more information, see Using the refresh token
        # . CUSTOM_AUTH Custom authentication with Lambda triggers. For more information, see Custom
        # authentication challenge Lambda triggers . ADMIN_USER_PASSWORD_AUTH Server-side username-password
        # authentication with the password sent directly in the request. For more information about
        # client-side and server-side authentication, see SDK authorization models .

        @[JSON::Field(key: "AuthFlow")]
        getter auth_flow : String

        # The ID of the app client where the user wants to sign in.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool where the user wants to sign in.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # The authentication parameters. These are inputs corresponding to the AuthFlow that you're invoking.
        # The following are some authentication flows and their parameters. Add a SECRET_HASH parameter if
        # your app client has a client secret. Add DEVICE_KEY if you want to bypass multi-factor
        # authentication with a remembered device. USER_AUTH USERNAME (required) PREFERRED_CHALLENGE . If you
        # don't provide a value for PREFERRED_CHALLENGE , Amazon Cognito responds with the AvailableChallenges
        # parameter that specifies the available sign-in methods. USER_SRP_AUTH USERNAME (required) SRP_A
        # (required) ADMIN_USER_PASSWORD_AUTH USERNAME (required) PASSWORD (required)
        # REFRESH_TOKEN_AUTH/REFRESH_TOKEN REFRESH_TOKEN (required) CUSTOM_AUTH USERNAME (required)
        # ChallengeName: SRP_A (when preceding custom authentication with SRP authentication) SRP_A: (An SRP_A
        # value) (when preceding custom authentication with SRP authentication) For more information about
        # SECRET_HASH , see Computing secret hash values . For information about DEVICE_KEY , see Working with
        # user devices in your user pool .

        @[JSON::Field(key: "AuthParameters")]
        getter auth_parameters : Hash(String, String)?

        # A map of custom key-value pairs that you can provide as input for certain custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the AdminInitiateAuth API action, Amazon Cognito invokes the Lambda functions that are
        # specified for various triggers. The ClientMetadata value is passed as input to the functions for
        # only the following triggers: Pre signup Pre authentication User migration When Amazon Cognito
        # invokes the functions for these triggers, it passes a JSON payload, which the function receives as
        # input. This payload contains a validationData attribute, which provides the data that you assigned
        # to the ClientMetadata parameter in your AdminInitiateAuth request. In your function code in Lambda,
        # you can process the validationData value to enhance your workflow for your specific needs. When you
        # use the AdminInitiateAuth API action, Amazon Cognito also invokes the functions for the following
        # triggers, but it doesn't provide the ClientMetadata value as input: Post authentication Custom
        # message Pre token generation Create auth challenge Define auth challenge Custom email sender Custom
        # SMS sender For more information, see Using Lambda triggers in the Amazon Cognito Developer Guide .
        # When you use the ClientMetadata parameter, note that Amazon Cognito won't do the following: Store
        # the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user
        # pool to support custom workflows. If your user pool configuration doesn't include triggers, the
        # ClientMetadata parameter serves no purpose. Validate the ClientMetadata value. Encrypt the
        # ClientMetadata value. Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "ContextData")]
        getter context_data : Types::ContextDataType?

        # The optional session ID from a ConfirmSignUp API request. You can sign in a user directly from the
        # sign-up process with an AuthFlow of USER_AUTH and AuthParameters of EMAIL_OTP or SMS_OTP , depending
        # on how your user pool sent the confirmation-code message.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @auth_flow : String,
          @client_id : String,
          @user_pool_id : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @auth_parameters : Hash(String, String)? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @context_data : Types::ContextDataType? = nil,
          @session : String? = nil
        )
        end
      end

      # Initiates the authentication response, as an administrator.

      struct AdminInitiateAuthResponse
        include JSON::Serializable

        # The outcome of successful authentication. This is only returned if the user pool has no additional
        # challenges to return. If Amazon Cognito returns another challenge, the response includes
        # ChallengeName , ChallengeParameters , and Session so that your user can answer the challenge.

        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResultType?

        # This response parameter lists the available authentication challenges that users can select from in
        # choice-based authentication . For example, they might be able to choose between passkey
        # authentication, a one-time password from an SMS message, and a traditional password.

        @[JSON::Field(key: "AvailableChallenges")]
        getter available_challenges : Array(String)?

        # The name of the challenge that you're responding to with this call. This is returned in the
        # AdminInitiateAuth response if you must pass another challenge. Possible challenges include the
        # following: All of the following challenges require USERNAME and, when the app client has a client
        # secret, SECRET_HASH in the parameters. Include a DEVICE_KEY for device authentication. WEB_AUTHN :
        # Respond to the challenge with the results of a successful authentication with a WebAuthn
        # authenticator, or passkey, as CREDENTIAL . Examples of WebAuthn authenticators include biometric
        # devices and security keys. PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP :
        # Respond with the initial SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection
        # as ANSWER . It must be one of the challenge types in the AvailableChallenges response parameter. Add
        # the parameters of the selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with
        # the code that your user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with
        # the code that your user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond
        # with the code that your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP :
        # Respond with the code that your user pool delivered in an SMS message, as SMS_OTP_CODE .
        # PASSWORD_VERIFIER : Respond with the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE ,
        # PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom
        # authentication flow determines that the user should pass another challenge before tokens are issued.
        # The parameters of the challenge are determined by your Lambda function and issued in the
        # ChallengeParameters of a challenge response. DEVICE_SRP_AUTH : Respond with the initial parameters
        # of device SRP authentication. For more information, see Signing in with a device .
        # DEVICE_PASSWORD_VERIFIER : Respond with PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP after client-side SRP calculations. For more information, see Signing in with a device .
        # NEW_PASSWORD_REQUIRED : For users who are required to change their passwords after successful first
        # login. Respond to this challenge with NEW_PASSWORD and any required attributes that Amazon Cognito
        # returned in the requiredAttributes parameter. You can also set values for attributes that aren't
        # required by your user pool and that your app client can write. Amazon Cognito only returns this
        # challenge for users who have temporary passwords. When you create passwordless users, you must
        # provide values for all required attributes. In a NEW_PASSWORD_REQUIRED challenge response, you can't
        # modify a required attribute that already has a value. In AdminRespondToAuthChallenge or
        # RespondToAuthChallenge , set a value for any keys that Amazon Cognito returned in the
        # requiredAttributes parameter, then use the AdminUpdateUserAttributes or UpdateUserAttributes API
        # operation to modify the value of any additional attributes. MFA_SETUP : For users who are required
        # to setup an MFA factor before they can sign in. The MFA types activated for the user pool will be
        # listed in the challenge parameters MFAS_CAN_SETUP value. To set up time-based one-time password
        # (TOTP) MFA, use the session returned in this challenge from InitiateAuth or AdminInitiateAuth as an
        # input to AssociateSoftwareToken . Then, use the session returned by VerifySoftwareToken as an input
        # to RespondToAuthChallenge or AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete
        # sign-in. To set up SMS or email MFA, collect a phone_number or email attribute for the user. Then
        # restart the authentication flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String?

        # The parameters of an authentication challenge. Amazon Cognito returns challenge parameters as a
        # guide to the responses your user or application must provide for the returned ChallengeName .
        # Calculate responses to the challenge parameters and pass them in the ChallengeParameters of
        # AdminRespondToAuthChallenge . All challenges require USERNAME and, when the app client has a client
        # secret, SECRET_HASH . In SRP challenges, Amazon Cognito returns the username attribute in
        # USER_ID_FOR_SRP instead of any email address, preferred username, or phone number alias that you
        # might have specified in your AdminInitiateAuth request. You must use the username and not an alias
        # in the ChallengeResponses of your challenge response.

        @[JSON::Field(key: "ChallengeParameters")]
        getter challenge_parameters : Hash(String, String)?

        # The session that must be passed to challenge-response requests. If an AdminInitiateAuth or
        # AdminRespondToAuthChallenge API request results in another authentication challenge, Amazon Cognito
        # returns a session ID and the parameters of the next challenge. Pass this session ID in the Session
        # parameter of AdminRespondToAuthChallenge .

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @authentication_result : Types::AuthenticationResultType? = nil,
          @available_challenges : Array(String)? = nil,
          @challenge_name : String? = nil,
          @challenge_parameters : Hash(String, String)? = nil,
          @session : String? = nil
        )
        end
      end


      struct AdminLinkProviderForUserRequest
        include JSON::Serializable

        # The existing user in the user pool that you want to assign to the external IdP user account. This
        # user can be a local (Username + Password) Amazon Cognito user pools user or a federated user (for
        # example, a SAML or Facebook user). If the user doesn't exist, Amazon Cognito generates an exception.
        # Amazon Cognito returns this user when the new user (with the linked IdP attribute) signs in. For a
        # native username + password user, the ProviderAttributeValue for the DestinationUser should be the
        # username in the user pool. For a federated user, it should be the provider-specific user_id . The
        # ProviderAttributeName of the DestinationUser is ignored. The ProviderName should be set to Cognito
        # for users in Cognito user pools. All attributes in the DestinationUser profile must be mutable. If
        # you have assigned the user any immutable custom attributes, the operation won't succeed.

        @[JSON::Field(key: "DestinationUser")]
        getter destination_user : Types::ProviderUserIdentifierType

        # An external IdP account for a user who doesn't exist yet in the user pool. This user must be a
        # federated user (for example, a SAML or Facebook user), not another native user. If the SourceUser is
        # using a federated social IdP, such as Facebook, Google, or Login with Amazon, you must set the
        # ProviderAttributeName to Cognito_Subject . For social IdPs, the ProviderName will be Facebook ,
        # Google , or LoginWithAmazon , and Amazon Cognito will automatically parse the Facebook, Google, and
        # Login with Amazon tokens for id , sub , and user_id , respectively. The ProviderAttributeValue for
        # the user must be the same value as the id , sub , or user_id value found in the social IdP token.
        # For OIDC, the ProviderAttributeName can be any mapped value from a claim in the ID token, or that
        # your app retrieves from the userInfo endpoint. For SAML, the ProviderAttributeName can be any mapped
        # value from a claim in the SAML assertion. The following additional considerations apply to
        # SourceUser for OIDC and SAML providers. You must map the claim to a user pool attribute in your IdP
        # configuration, and set the user pool attribute name as the value of ProviderAttributeName in your
        # AdminLinkProviderForUser request. For example, email . When you set ProviderAttributeName to
        # Cognito_Subject , Amazon Cognito will automatically parse the default unique identifier found in the
        # subject from the IdP token.

        @[JSON::Field(key: "SourceUser")]
        getter source_user : Types::ProviderUserIdentifierType

        # The ID of the user pool where you want to link a federated identity.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @destination_user : Types::ProviderUserIdentifierType,
          @source_user : Types::ProviderUserIdentifierType,
          @user_pool_id : String
        )
        end
      end


      struct AdminLinkProviderForUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to list devices, as an administrator.

      struct AdminListDevicesRequest
        include JSON::Serializable

        # The ID of the user pool where the device owner is a user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The maximum number of devices that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @limit : Int32? = nil,
          @pagination_token : String? = nil
        )
        end
      end

      # Lists the device's response, as an administrator.

      struct AdminListDevicesResponse
        include JSON::Serializable

        # An array of devices and their information. Each entry that's returned includes device information,
        # last-accessed and created dates, and the device key.

        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::DeviceType)?

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @devices : Array(Types::DeviceType)? = nil,
          @pagination_token : String? = nil
        )
        end
      end


      struct AdminListGroupsForUserRequest
        include JSON::Serializable

        # The ID of the user pool where you want to view a user's groups.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The maximum number of groups that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct AdminListGroupsForUserResponse
        include JSON::Serializable

        # An array of groups and information about them.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupType)?

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct AdminListUserAuthEventsRequest
        include JSON::Serializable

        # The Id of the user pool that contains the user profile with the logged events.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The maximum number of authentication events to return. Returns 60 events if you set MaxResults to 0,
        # or if you don't include a MaxResults parameter.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct AdminListUserAuthEventsResponse
        include JSON::Serializable

        # The response object. It includes the EventID , EventType , CreationDate , EventRisk , and
        # EventResponse .

        @[JSON::Field(key: "AuthEvents")]
        getter auth_events : Array(Types::AuthEventType)?

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auth_events : Array(Types::AuthEventType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct AdminRemoveUserFromGroupRequest
        include JSON::Serializable

        # The name of the group that you want to remove the user from, for example MyTestGroup .

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool that contains the group and the user that you want to remove.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @group_name : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the request to reset a user's password as an administrator.

      struct AdminResetUserPasswordRequest
        include JSON::Serializable

        # The ID of the user pool where you want to reset the user's password.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # The AdminResetUserPassword API operation invokes the function that is assigned to the custom message
        # trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function
        # receives as input. This payload contains a clientMetadata attribute, which provides the data that
        # you assigned to the ClientMetadata parameter in your AdminResetUserPassword request. In your
        # function code in Lambda, you can process the clientMetadata value to enhance your workflow for your
        # specific needs. For more information, see Using Lambda triggers in the Amazon Cognito Developer
        # Guide . When you use the ClientMetadata parameter, note that Amazon Cognito won't do the following:
        # Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to
        # a user pool to support custom workflows. If your user pool configuration doesn't include triggers,
        # the ClientMetadata parameter serves no purpose. Validate the ClientMetadata value. Encrypt the
        # ClientMetadata value. Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @client_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response from the server to reset a user password as an administrator.

      struct AdminResetUserPasswordResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to respond to the authentication challenge, as an administrator.

      struct AdminRespondToAuthChallengeRequest
        include JSON::Serializable

        # The name of the challenge that you are responding to. Possible challenges include the following: All
        # of the following challenges require USERNAME and, when the app client has a client secret,
        # SECRET_HASH in the parameters. Include a DEVICE_KEY for device authentication. WEB_AUTHN : Respond
        # to the challenge with the results of a successful authentication with a WebAuthn authenticator, or
        # passkey, as CREDENTIAL . Examples of WebAuthn authenticators include biometric devices and security
        # keys. PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP : Respond with the
        # initial SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection as ANSWER . It
        # must be one of the challenge types in the AvailableChallenges response parameter. Add the parameters
        # of the selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with the code that
        # your user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with the code that
        # your user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond with the code
        # that your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP : Respond with the
        # code that your user pool delivered in an SMS message, as SMS_OTP_CODE . PASSWORD_VERIFIER : Respond
        # with the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom authentication flow determines that
        # the user should pass another challenge before tokens are issued. The parameters of the challenge are
        # determined by your Lambda function and issued in the ChallengeParameters of a challenge response.
        # DEVICE_SRP_AUTH : Respond with the initial parameters of device SRP authentication. For more
        # information, see Signing in with a device . DEVICE_PASSWORD_VERIFIER : Respond with
        # PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP after client-side SRP
        # calculations. For more information, see Signing in with a device . NEW_PASSWORD_REQUIRED : For users
        # who are required to change their passwords after successful first login. Respond to this challenge
        # with NEW_PASSWORD and any required attributes that Amazon Cognito returned in the requiredAttributes
        # parameter. You can also set values for attributes that aren't required by your user pool and that
        # your app client can write. Amazon Cognito only returns this challenge for users who have temporary
        # passwords. When you create passwordless users, you must provide values for all required attributes.
        # In a NEW_PASSWORD_REQUIRED challenge response, you can't modify a required attribute that already
        # has a value. In AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys
        # that Amazon Cognito returned in the requiredAttributes parameter, then use the
        # AdminUpdateUserAttributes or UpdateUserAttributes API operation to modify the value of any
        # additional attributes. MFA_SETUP : For users who are required to setup an MFA factor before they can
        # sign in. The MFA types activated for the user pool will be listed in the challenge parameters
        # MFAS_CAN_SETUP value. To set up time-based one-time password (TOTP) MFA, use the session returned in
        # this challenge from InitiateAuth or AdminInitiateAuth as an input to AssociateSoftwareToken . Then,
        # use the session returned by VerifySoftwareToken as an input to RespondToAuthChallenge or
        # AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete sign-in. To set up SMS or
        # email MFA, collect a phone_number or email attribute for the user. Then restart the authentication
        # flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String

        # The ID of the app client where you initiated sign-in.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool where you want to respond to an authentication challenge.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # The responses to the challenge that you received in the previous request. Each challenge has its own
        # required response parameters. The following examples are partial JSON request bodies that highlight
        # challenge-response parameters. You must provide a SECRET_HASH parameter in all challenge responses
        # to an app client that has a client secret. Include a DEVICE_KEY for device authentication.
        # SELECT_CHALLENGE "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "USERNAME":
        # "[username]", "ANSWER": "[Challenge name]"} Available challenges are PASSWORD , PASSWORD_SRP ,
        # EMAIL_OTP , SMS_OTP , and WEB_AUTHN . Complete authentication in the SELECT_CHALLENGE response for
        # PASSWORD , PASSWORD_SRP , and WEB_AUTHN : "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses":
        # { "ANSWER": "WEB_AUTHN", "USERNAME": "[username]", "CREDENTIAL": "[AuthenticationResponseJSON]"} See
        # AuthenticationResponseJSON . "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER":
        # "PASSWORD", "USERNAME": "[username]", "PASSWORD": "[password]"} "ChallengeName": "SELECT_CHALLENGE",
        # "ChallengeResponses": { "ANSWER": "PASSWORD_SRP", "USERNAME": "[username]", "SRP_A": "[SRP_A]"} For
        # SMS_OTP and EMAIL_OTP , respond with the username and answer. Your user pool will send a code for
        # the user to submit in the next challenge response. "ChallengeName": "SELECT_CHALLENGE",
        # "ChallengeResponses": { "ANSWER": "SMS_OTP", "USERNAME": "[username]"} "ChallengeName":
        # "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER": "EMAIL_OTP", "USERNAME": "[username]"}
        # WEB_AUTHN "ChallengeName": "WEB_AUTHN", "ChallengeResponses": { "USERNAME": "[username]",
        # "CREDENTIAL": "[AuthenticationResponseJSON]"} See AuthenticationResponseJSON . PASSWORD
        # "ChallengeName": "PASSWORD", "ChallengeResponses": { "USERNAME": "[username]", "PASSWORD":
        # "[password]"} PASSWORD_SRP "ChallengeName": "PASSWORD_SRP", "ChallengeResponses": { "USERNAME":
        # "[username]", "SRP_A": "[SRP_A]"} SMS_OTP "ChallengeName": "SMS_OTP", "ChallengeResponses":
        # {"SMS_OTP_CODE": "[code]", "USERNAME": "[username]"} EMAIL_OTP "ChallengeName": "EMAIL_OTP",
        # "ChallengeResponses": {"EMAIL_OTP_CODE": "[code]", "USERNAME": "[username]"} SMS_MFA
        # "ChallengeName": "SMS_MFA", "ChallengeResponses": {"SMS_MFA_CODE": "[code]", "USERNAME":
        # "[username]"} PASSWORD_VERIFIER This challenge response is part of the SRP flow. Amazon Cognito
        # requires that your application respond to this challenge within a few seconds. When the response
        # time exceeds this period, your user pool returns a NotAuthorizedException error. "ChallengeName":
        # "PASSWORD_VERIFIER", "ChallengeResponses": {"PASSWORD_CLAIM_SIGNATURE": "[claim_signature]",
        # "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}
        # CUSTOM_CHALLENGE "ChallengeName": "CUSTOM_CHALLENGE", "ChallengeResponses": {"USERNAME":
        # "[username]", "ANSWER": "[challenge_answer]"} NEW_PASSWORD_REQUIRED "ChallengeName":
        # "NEW_PASSWORD_REQUIRED", "ChallengeResponses": {"NEW_PASSWORD": "[new_password]", "USERNAME":
        # "[username]"} To set any required attributes that InitiateAuth returned in an requiredAttributes
        # parameter, add "userAttributes.[attribute_name]": "[attribute_value]" . This parameter can also set
        # values for writable attributes that aren't required by your user pool. In a NEW_PASSWORD_REQUIRED
        # challenge response, you can't modify a required attribute that already has a value. In
        # AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys that Amazon Cognito
        # returned in the requiredAttributes parameter, then use the AdminUpdateUserAttributes or
        # UpdateUserAttributes API operation to modify the value of any additional attributes.
        # SOFTWARE_TOKEN_MFA "ChallengeName": "SOFTWARE_TOKEN_MFA", "ChallengeResponses": {"USERNAME":
        # "[username]", "SOFTWARE_TOKEN_MFA_CODE": [authenticator_code]} DEVICE_SRP_AUTH "ChallengeName":
        # "DEVICE_SRP_AUTH", "ChallengeResponses": {"USERNAME": "[username]", "DEVICE_KEY": "[device_key]",
        # "SRP_A": "[srp_a]"} DEVICE_PASSWORD_VERIFIER "ChallengeName": "DEVICE_PASSWORD_VERIFIER",
        # "ChallengeResponses": {"DEVICE_KEY": "[device_key]", "PASSWORD_CLAIM_SIGNATURE":
        # "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp],
        # "USERNAME": "[username]"} MFA_SETUP "ChallengeName": "MFA_SETUP", "ChallengeResponses": {"USERNAME":
        # "[username]"}, "SESSION": "[Session ID from VerifySoftwareToken]" SELECT_MFA_TYPE "ChallengeName":
        # "SELECT_MFA_TYPE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER":
        # "[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA]"} For more information about SECRET_HASH , see Computing
        # secret hash values . For information about DEVICE_KEY , see Working with user devices in your user
        # pool .

        @[JSON::Field(key: "ChallengeResponses")]
        getter challenge_responses : Hash(String, String)?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the AdminRespondToAuthChallenge API action, Amazon Cognito invokes any functions that
        # you have assigned to the following triggers: Pre sign-up custom message Post authentication User
        # migration Pre token generation Define auth challenge Create auth challenge Verify auth challenge
        # response When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the
        # function receives as input. This payload contains a clientMetadata attribute that provides the data
        # that you assigned to the ClientMetadata parameter in your AdminRespondToAuthChallenge request. In
        # your function code in Lambda, you can process the clientMetadata value to enhance your workflow for
        # your specific needs. For more information, see Using Lambda triggers in the Amazon Cognito Developer
        # Guide . When you use the ClientMetadata parameter, note that Amazon Cognito won't do the following:
        # Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to
        # a user pool to support custom workflows. If your user pool configuration doesn't include triggers,
        # the ClientMetadata parameter serves no purpose. Validate the ClientMetadata value. Encrypt the
        # ClientMetadata value. Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "ContextData")]
        getter context_data : Types::ContextDataType?

        # The session identifier that maintains the state of authentication requests and challenge responses.
        # If an AdminInitiateAuth or AdminRespondToAuthChallenge API request results in a determination that
        # your application must pass another challenge, Amazon Cognito returns a session with other challenge
        # parameters. Send this session identifier, unmodified, to the next AdminRespondToAuthChallenge
        # request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @challenge_name : String,
          @client_id : String,
          @user_pool_id : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @challenge_responses : Hash(String, String)? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @context_data : Types::ContextDataType? = nil,
          @session : String? = nil
        )
        end
      end

      # Responds to the authentication challenge, as an administrator.

      struct AdminRespondToAuthChallengeResponse
        include JSON::Serializable

        # The outcome of a successful authentication process. After your application has passed all
        # challenges, Amazon Cognito returns an AuthenticationResult with the JSON web tokens (JWTs) that
        # indicate successful sign-in.

        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResultType?

        # The name of the next challenge that you must respond to. Possible challenges include the following:
        # All of the following challenges require USERNAME and, when the app client has a client secret,
        # SECRET_HASH in the parameters. Include a DEVICE_KEY for device authentication. WEB_AUTHN : Respond
        # to the challenge with the results of a successful authentication with a WebAuthn authenticator, or
        # passkey, as CREDENTIAL . Examples of WebAuthn authenticators include biometric devices and security
        # keys. PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP : Respond with the
        # initial SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection as ANSWER . It
        # must be one of the challenge types in the AvailableChallenges response parameter. Add the parameters
        # of the selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with the code that
        # your user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with the code that
        # your user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond with the code
        # that your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP : Respond with the
        # code that your user pool delivered in an SMS message, as SMS_OTP_CODE . PASSWORD_VERIFIER : Respond
        # with the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom authentication flow determines that
        # the user should pass another challenge before tokens are issued. The parameters of the challenge are
        # determined by your Lambda function and issued in the ChallengeParameters of a challenge response.
        # DEVICE_SRP_AUTH : Respond with the initial parameters of device SRP authentication. For more
        # information, see Signing in with a device . DEVICE_PASSWORD_VERIFIER : Respond with
        # PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP after client-side SRP
        # calculations. For more information, see Signing in with a device . NEW_PASSWORD_REQUIRED : For users
        # who are required to change their passwords after successful first login. Respond to this challenge
        # with NEW_PASSWORD and any required attributes that Amazon Cognito returned in the requiredAttributes
        # parameter. You can also set values for attributes that aren't required by your user pool and that
        # your app client can write. Amazon Cognito only returns this challenge for users who have temporary
        # passwords. When you create passwordless users, you must provide values for all required attributes.
        # In a NEW_PASSWORD_REQUIRED challenge response, you can't modify a required attribute that already
        # has a value. In AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys
        # that Amazon Cognito returned in the requiredAttributes parameter, then use the
        # AdminUpdateUserAttributes or UpdateUserAttributes API operation to modify the value of any
        # additional attributes. MFA_SETUP : For users who are required to setup an MFA factor before they can
        # sign in. The MFA types activated for the user pool will be listed in the challenge parameters
        # MFAS_CAN_SETUP value. To set up time-based one-time password (TOTP) MFA, use the session returned in
        # this challenge from InitiateAuth or AdminInitiateAuth as an input to AssociateSoftwareToken . Then,
        # use the session returned by VerifySoftwareToken as an input to RespondToAuthChallenge or
        # AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete sign-in. To set up SMS or
        # email MFA, collect a phone_number or email attribute for the user. Then restart the authentication
        # flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String?

        # The parameters that define your response to the next challenge.

        @[JSON::Field(key: "ChallengeParameters")]
        getter challenge_parameters : Hash(String, String)?

        # The session identifier that maintains the state of authentication requests and challenge responses.
        # If an AdminInitiateAuth or AdminRespondToAuthChallenge API request results in a determination that
        # your application must pass another challenge, Amazon Cognito returns a session with other challenge
        # parameters. Send this session identifier, unmodified, to the next AdminRespondToAuthChallenge
        # request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @authentication_result : Types::AuthenticationResultType? = nil,
          @challenge_name : String? = nil,
          @challenge_parameters : Hash(String, String)? = nil,
          @session : String? = nil
        )
        end
      end


      struct AdminSetUserMFAPreferenceRequest
        include JSON::Serializable

        # The ID of the user pool where you want to set a user's MFA preferences.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # User preferences for email message MFA. Activates or deactivates email MFA and sets it as the
        # preferred MFA method when multiple methods are available. To activate this setting, your user pool
        # must be in the Essentials tier or higher.

        @[JSON::Field(key: "EmailMfaSettings")]
        getter email_mfa_settings : Types::EmailMfaSettingsType?

        # User preferences for SMS message MFA. Activates or deactivates SMS MFA and sets it as the preferred
        # MFA method when multiple methods are available.

        @[JSON::Field(key: "SMSMfaSettings")]
        getter sms_mfa_settings : Types::SMSMfaSettingsType?

        # User preferences for time-based one-time password (TOTP) MFA. Activates or deactivates TOTP MFA and
        # sets it as the preferred MFA method when multiple methods are available. This operation can set TOTP
        # as a user's preferred MFA method before they register a TOTP authenticator.

        @[JSON::Field(key: "SoftwareTokenMfaSettings")]
        getter software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType?

        def initialize(
          @user_pool_id : String,
          @username : String,
          @email_mfa_settings : Types::EmailMfaSettingsType? = nil,
          @sms_mfa_settings : Types::SMSMfaSettingsType? = nil,
          @software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType? = nil
        )
        end
      end


      struct AdminSetUserMFAPreferenceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AdminSetUserPasswordRequest
        include JSON::Serializable

        # The new temporary or permanent password that you want to set for the user. You can't remove the
        # password for a user who already has a password so that they can only sign in with passwordless
        # methods. In this scenario, you must create a new user without a password.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The ID of the user pool where you want to set the user's password.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Set to true to set a password that the user can immediately sign in with. Set to false to set a
        # temporary password that the user must change on their next sign-in.

        @[JSON::Field(key: "Permanent")]
        getter permanent : Bool?

        def initialize(
          @password : String,
          @user_pool_id : String,
          @username : String,
          @permanent : Bool? = nil
        )
        end
      end


      struct AdminSetUserPasswordResponse
        include JSON::Serializable

        def initialize
        end
      end

      # You can use this parameter to set an MFA configuration that uses the SMS delivery medium.

      struct AdminSetUserSettingsRequest
        include JSON::Serializable

        # You can use this parameter only to set an SMS configuration that uses SMS for delivery.

        @[JSON::Field(key: "MFAOptions")]
        getter mfa_options : Array(Types::MFAOptionType)

        # The ID of the user pool that contains the user whose options you're setting.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @mfa_options : Array(Types::MFAOptionType),
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # Represents the response from the server to set user settings as an administrator.

      struct AdminSetUserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AdminUpdateAuthEventFeedbackRequest
        include JSON::Serializable

        # The ID of the threat protection authentication event that you want to update.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # Your feedback to the authentication event. When you provide a FeedbackValue value of valid , you
        # tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of
        # risk. When you provide a FeedbackValue value of invalid , you tell Amazon Cognito that you don't
        # trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.

        @[JSON::Field(key: "FeedbackValue")]
        getter feedback_value : String

        # The ID of the user pool where you want to submit authentication-event feedback.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @event_id : String,
          @feedback_value : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end


      struct AdminUpdateAuthEventFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to update the device status, as an administrator.

      struct AdminUpdateDeviceStatusRequest
        include JSON::Serializable

        # The unique identifier, or device key, of the device that you want to update the status for.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # The ID of the user pool where you want to change a user's device status.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # To enable device authentication with the specified device, set to remembered .To disable, set to
        # not_remembered .

        @[JSON::Field(key: "DeviceRememberedStatus")]
        getter device_remembered_status : String?

        def initialize(
          @device_key : String,
          @user_pool_id : String,
          @username : String,
          @device_remembered_status : String? = nil
        )
        end
      end

      # The status response to the request to update the device, as an administrator.

      struct AdminUpdateDeviceStatusResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to update the user's attributes as an administrator.

      struct AdminUpdateUserAttributesRequest
        include JSON::Serializable

        # An array of name-value pairs representing user attributes. For custom attributes, you must prepend
        # the custom: prefix to the attribute name. If your user pool requires verification before Amazon
        # Cognito updates an attribute value that you specify in this request, Amazon Cognito doesn’t
        # immediately update the value of that attribute. After your user receives and responds to a
        # verification message to verify the new value, Amazon Cognito updates the attribute value. Your user
        # can sign in and receive messages with the original attribute value until they verify the new value.
        # To skip the verification message and update the value of an attribute that requires verification in
        # the same API request, include the email_verified or phone_number_verified attribute, with a value of
        # true . If you set the email_verified or phone_number_verified value for an email or phone_number
        # attribute that requires verification to true , Amazon Cognito doesn’t send a verification message to
        # your user.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)

        # The ID of the user pool where you want to update user attributes.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the AdminUpdateUserAttributes API action, Amazon Cognito invokes the function that is
        # assigned to the custom message trigger. When Amazon Cognito invokes this function, it passes a JSON
        # payload, which the function receives as input. This payload contains a clientMetadata attribute,
        # which provides the data that you assigned to the ClientMetadata parameter in your
        # AdminUpdateUserAttributes request. In your function code in Lambda, you can process the
        # clientMetadata value to enhance your workflow for your specific needs. For more information, see
        # Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata
        # parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata value. This
        # data is available only to Lambda triggers that are assigned to a user pool to support custom
        # workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter
        # serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send
        # sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        def initialize(
          @user_attributes : Array(Types::AttributeType),
          @user_pool_id : String,
          @username : String,
          @client_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response from the server for the request to update user attributes as an
      # administrator.

      struct AdminUpdateUserAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to sign out of all devices, as an administrator.

      struct AdminUserGlobalSignOutRequest
        include JSON::Serializable

        # The ID of the user pool where you want to sign out a user.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @user_pool_id : String,
          @username : String
        )
        end
      end

      # The global sign-out response, as an administrator.

      struct AdminUserGlobalSignOutResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Threat protection configuration options for additional authentication types in your user pool,
      # including custom authentication.

      struct AdvancedSecurityAdditionalFlowsType
        include JSON::Serializable

        # The operating mode of threat protection in custom authentication with Custom authentication
        # challenge Lambda triggers .

        @[JSON::Field(key: "CustomAuthMode")]
        getter custom_auth_mode : String?

        def initialize(
          @custom_auth_mode : String? = nil
        )
        end
      end

      # This exception is thrown when a user tries to confirm the account with an email address or phone
      # number that has already been supplied as an alias for a different user profile. This exception
      # indicates that an account with this email address or phone already exists in a user pool that you've
      # configured to use email address or phone number as a sign-in alias.

      struct AliasExistsException
        include JSON::Serializable

        # The message that Amazon Cognito sends to the user when the value of an alias attribute is already
        # linked to another user profile.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The settings for Amazon Pinpoint analytics configuration. With an analytics configuration, your
      # application can collect user-activity metrics for user notifications with a Amazon Pinpoint
      # campaign. Amazon Pinpoint isn't available in all Amazon Web Services Regions. For a list of
      # available Regions, see Amazon Cognito and Amazon Pinpoint Region availability .

      struct AnalyticsConfigurationType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Pinpoint project that you want to connect to your user
        # pool app client. Amazon Cognito publishes events to the Amazon Pinpoint project that ApplicationArn
        # declares. You can also configure your application to pass an endpoint ID in the AnalyticsMetadata
        # parameter of sign-in operations. The endpoint ID is information about the destination for push
        # notifications

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # Your Amazon Pinpoint project ID.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The external ID of the role that Amazon Cognito assumes to send analytics data to Amazon Pinpoint.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The ARN of an Identity and Access Management role that has the permissions required for Amazon
        # Cognito to publish events to Amazon Pinpoint analytics.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # If UserDataShared is true , Amazon Cognito includes user data in the events that it publishes to
        # Amazon Pinpoint analytics.

        @[JSON::Field(key: "UserDataShared")]
        getter user_data_shared : Bool?

        def initialize(
          @application_arn : String? = nil,
          @application_id : String? = nil,
          @external_id : String? = nil,
          @role_arn : String? = nil,
          @user_data_shared : Bool? = nil
        )
        end
      end

      # Information that your application adds to authentication requests. Applies an endpoint ID to the
      # analytics data that your user pool sends to Amazon Pinpoint. An endpoint ID uniquely identifies a
      # mobile device, email address or phone number that can receive messages from Amazon Pinpoint
      # analytics. For more information about Amazon Web Services Regions that can contain Amazon Pinpoint
      # resources for use with Amazon Cognito user pools, see Using Amazon Pinpoint analytics with Amazon
      # Cognito user pools .

      struct AnalyticsMetadataType
        include JSON::Serializable

        # The endpoint ID. Information that you want to pass to Amazon Pinpoint about where to send
        # notifications.

        @[JSON::Field(key: "AnalyticsEndpointId")]
        getter analytics_endpoint_id : String?

        def initialize(
          @analytics_endpoint_id : String? = nil
        )
        end
      end

      # An image file from a managed login branding style in a user pool.

      struct AssetType
        include JSON::Serializable

        # The category that the image corresponds to in your managed login configuration. Managed login has
        # asset categories for different types of logos, backgrounds, and icons.

        @[JSON::Field(key: "Category")]
        getter category : String

        # The display-mode target of the asset: light, dark, or browser-adaptive. For example, Amazon Cognito
        # displays a dark-mode image only when the browser or application is in dark mode, but displays a
        # browser-adaptive file in all contexts.

        @[JSON::Field(key: "ColorMode")]
        getter color_mode : String

        # The file type of the image file.

        @[JSON::Field(key: "Extension")]
        getter extension : String

        # The image file, in Base64-encoded binary.

        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # The ID of the asset.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @category : String,
          @color_mode : String,
          @extension : String,
          @bytes : Bytes? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct AssociateSoftwareTokenRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin . You can provide either an access token or a session
        # ID in the request.

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        # The session identifier that maintains the state of authentication requests and challenge responses.
        # In AssociateSoftwareToken , this is the session ID from a successful sign-in. You can provide either
        # an access token or a session ID in the request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @access_token : String? = nil,
          @session : String? = nil
        )
        end
      end


      struct AssociateSoftwareTokenResponse
        include JSON::Serializable

        # A unique generated shared secret code that is used by the TOTP algorithm to generate a one-time
        # code.

        @[JSON::Field(key: "SecretCode")]
        getter secret_code : String?

        # The session identifier that maintains the state of authentication requests and challenge responses.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @secret_code : String? = nil,
          @session : String? = nil
        )
        end
      end

      # The name and value of a user attribute.

      struct AttributeType
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String,
          @value : String? = nil
        )
        end
      end

      # One authentication event that Amazon Cognito logged in a user pool with threat protection active.
      # Contains user and device metadata and a risk assessment from your user pool.

      struct AuthEventType
        include JSON::Serializable

        # A list of the challenges that the user was requested to answer, for example Password , and the
        # result, for example Success .

        @[JSON::Field(key: "ChallengeResponses")]
        getter challenge_responses : Array(Types::ChallengeResponseType)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The user context data captured at the time of an event request. This value provides additional
        # information about the client from which event the request is received.

        @[JSON::Field(key: "EventContextData")]
        getter event_context_data : Types::EventContextDataType?

        # The UpdateAuthEventFeedback or AdminUpdateAuthEventFeedback feedback that you or your user provided
        # in response to the event. A value of Valid indicates that you disagreed with the level of risk that
        # your user pool assigned, and evaluated a session to be valid, or likely safe. A value of Invalid
        # indicates that you agreed with the user pool risk level and evaluated a session to be invalid, or
        # likely malicious.

        @[JSON::Field(key: "EventFeedback")]
        getter event_feedback : Types::EventFeedbackType?

        # The event ID.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The event response.

        @[JSON::Field(key: "EventResponse")]
        getter event_response : String?

        # The threat evaluation from your user pool about an event. Contains information about whether your
        # user pool detected compromised credentials, whether the event triggered an automated response, and
        # the level of risk.

        @[JSON::Field(key: "EventRisk")]
        getter event_risk : Types::EventRiskType?

        # The type of authentication event.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        def initialize(
          @challenge_responses : Array(Types::ChallengeResponseType)? = nil,
          @creation_date : Time? = nil,
          @event_context_data : Types::EventContextDataType? = nil,
          @event_feedback : Types::EventFeedbackType? = nil,
          @event_id : String? = nil,
          @event_response : String? = nil,
          @event_risk : Types::EventRiskType? = nil,
          @event_type : String? = nil
        )
        end
      end

      # The object that your application receives after authentication. Contains tokens and information for
      # device authentication.

      struct AuthenticationResultType
        include JSON::Serializable

        # Your user's access token.

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        # The expiration period of the authentication result in seconds.

        @[JSON::Field(key: "ExpiresIn")]
        getter expires_in : Int32?

        # Your user's ID token.

        @[JSON::Field(key: "IdToken")]
        getter id_token : String?

        # The new device metadata from an authentication result.

        @[JSON::Field(key: "NewDeviceMetadata")]
        getter new_device_metadata : Types::NewDeviceMetadataType?

        # Your user's refresh token.

        @[JSON::Field(key: "RefreshToken")]
        getter refresh_token : String?

        # The intended use of the token, for example Bearer .

        @[JSON::Field(key: "TokenType")]
        getter token_type : String?

        def initialize(
          @access_token : String? = nil,
          @expires_in : Int32? = nil,
          @id_token : String? = nil,
          @new_device_metadata : Types::NewDeviceMetadataType? = nil,
          @refresh_token : String? = nil,
          @token_type : String? = nil
        )
        end
      end

      # The responses to the challenge that you received in the previous request. Each challenge has its own
      # required response parameters. The following examples are partial JSON request bodies that highlight
      # challenge-response parameters. You must provide a SECRET_HASH parameter in all challenge responses
      # to an app client that has a client secret. Include a DEVICE_KEY for device authentication.
      # SELECT_CHALLENGE "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "USERNAME":
      # "[username]", "ANSWER": "[Challenge name]"} Available challenges are PASSWORD , PASSWORD_SRP ,
      # EMAIL_OTP , SMS_OTP , and WEB_AUTHN . Complete authentication in the SELECT_CHALLENGE response for
      # PASSWORD , PASSWORD_SRP , and WEB_AUTHN : "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses":
      # { "ANSWER": "WEB_AUTHN", "USERNAME": "[username]", "CREDENTIAL": "[AuthenticationResponseJSON]"} See
      # AuthenticationResponseJSON . "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER":
      # "PASSWORD", "USERNAME": "[username]", "PASSWORD": "[password]"} "ChallengeName": "SELECT_CHALLENGE",
      # "ChallengeResponses": { "ANSWER": "PASSWORD_SRP", "USERNAME": "[username]", "SRP_A": "[SRP_A]"} For
      # SMS_OTP and EMAIL_OTP , respond with the username and answer. Your user pool will send a code for
      # the user to submit in the next challenge response. "ChallengeName": "SELECT_CHALLENGE",
      # "ChallengeResponses": { "ANSWER": "SMS_OTP", "USERNAME": "[username]"} "ChallengeName":
      # "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER": "EMAIL_OTP", "USERNAME": "[username]"}
      # WEB_AUTHN "ChallengeName": "WEB_AUTHN", "ChallengeResponses": { "USERNAME": "[username]",
      # "CREDENTIAL": "[AuthenticationResponseJSON]"} See AuthenticationResponseJSON . PASSWORD
      # "ChallengeName": "PASSWORD", "ChallengeResponses": { "USERNAME": "[username]", "PASSWORD":
      # "[password]"} PASSWORD_SRP "ChallengeName": "PASSWORD_SRP", "ChallengeResponses": { "USERNAME":
      # "[username]", "SRP_A": "[SRP_A]"} SMS_OTP "ChallengeName": "SMS_OTP", "ChallengeResponses":
      # {"SMS_OTP_CODE": "[code]", "USERNAME": "[username]"} EMAIL_OTP "ChallengeName": "EMAIL_OTP",
      # "ChallengeResponses": {"EMAIL_OTP_CODE": "[code]", "USERNAME": "[username]"} SMS_MFA
      # "ChallengeName": "SMS_MFA", "ChallengeResponses": {"SMS_MFA_CODE": "[code]", "USERNAME":
      # "[username]"} PASSWORD_VERIFIER This challenge response is part of the SRP flow. Amazon Cognito
      # requires that your application respond to this challenge within a few seconds. When the response
      # time exceeds this period, your user pool returns a NotAuthorizedException error. "ChallengeName":
      # "PASSWORD_VERIFIER", "ChallengeResponses": {"PASSWORD_CLAIM_SIGNATURE": "[claim_signature]",
      # "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}
      # CUSTOM_CHALLENGE "ChallengeName": "CUSTOM_CHALLENGE", "ChallengeResponses": {"USERNAME":
      # "[username]", "ANSWER": "[challenge_answer]"} NEW_PASSWORD_REQUIRED "ChallengeName":
      # "NEW_PASSWORD_REQUIRED", "ChallengeResponses": {"NEW_PASSWORD": "[new_password]", "USERNAME":
      # "[username]"} To set any required attributes that InitiateAuth returned in an requiredAttributes
      # parameter, add "userAttributes.[attribute_name]": "[attribute_value]" . This parameter can also set
      # values for writable attributes that aren't required by your user pool. In a NEW_PASSWORD_REQUIRED
      # challenge response, you can't modify a required attribute that already has a value. In
      # AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys that Amazon Cognito
      # returned in the requiredAttributes parameter, then use the AdminUpdateUserAttributes or
      # UpdateUserAttributes API operation to modify the value of any additional attributes.
      # SOFTWARE_TOKEN_MFA "ChallengeName": "SOFTWARE_TOKEN_MFA", "ChallengeResponses": {"USERNAME":
      # "[username]", "SOFTWARE_TOKEN_MFA_CODE": [authenticator_code]} DEVICE_SRP_AUTH "ChallengeName":
      # "DEVICE_SRP_AUTH", "ChallengeResponses": {"USERNAME": "[username]", "DEVICE_KEY": "[device_key]",
      # "SRP_A": "[srp_a]"} DEVICE_PASSWORD_VERIFIER "ChallengeName": "DEVICE_PASSWORD_VERIFIER",
      # "ChallengeResponses": {"DEVICE_KEY": "[device_key]", "PASSWORD_CLAIM_SIGNATURE":
      # "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp],
      # "USERNAME": "[username]"} MFA_SETUP "ChallengeName": "MFA_SETUP", "ChallengeResponses": {"USERNAME":
      # "[username]"}, "SESSION": "[Session ID from VerifySoftwareToken]" SELECT_MFA_TYPE "ChallengeName":
      # "SELECT_MFA_TYPE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER":
      # "[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA]"} For more information about SECRET_HASH , see Computing
      # secret hash values . For information about DEVICE_KEY , see Working with user devices in your user
      # pool .

      struct ChallengeResponseType
        include JSON::Serializable

        # The type of challenge that your previous authentication request returned in the parameter
        # ChallengeName , for example SMS_MFA .

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String?

        # The set of key-value pairs that provides a response to the requested challenge.

        @[JSON::Field(key: "ChallengeResponse")]
        getter challenge_response : String?

        def initialize(
          @challenge_name : String? = nil,
          @challenge_response : String? = nil
        )
        end
      end

      # Represents the request to change a user password.

      struct ChangePasswordRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the user whose password you want to change.

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # A new password that you prompted the user to enter in your application.

        @[JSON::Field(key: "ProposedPassword")]
        getter proposed_password : String

        # The user's previous password. Required if the user has a password. If the user has no password and
        # only signs in with passwordless authentication options, you can omit this parameter.

        @[JSON::Field(key: "PreviousPassword")]
        getter previous_password : String?

        def initialize(
          @access_token : String,
          @proposed_password : String,
          @previous_password : String? = nil
        )
        end
      end

      # The response from the server to the change password request.

      struct ChangePasswordResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for the CloudWatch log group destination of user pool detailed activity logging, or of
      # user activity log export with threat protection.

      struct CloudWatchLogsConfigurationType
        include JSON::Serializable

        # The Amazon Resource Name (arn) of a CloudWatch Logs log group where your user pool sends logs. The
        # log group must not be encrypted with Key Management Service and must be in the same Amazon Web
        # Services account as your user pool. To send logs to log groups with a resource policy of a size
        # greater than 5120 characters, configure a log group with a path that starts with /aws/vendedlogs .
        # For more information, see Enabling logging from certain Amazon Web Services services .

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end

      # The delivery details for an email or SMS message that Amazon Cognito sent for authentication or
      # verification.

      struct CodeDeliveryDetailsType
        include JSON::Serializable

        # The name of the attribute that Amazon Cognito verifies with the code.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The method that Amazon Cognito used to send the code.

        @[JSON::Field(key: "DeliveryMedium")]
        getter delivery_medium : String?

        # The email address or phone number destination where Amazon Cognito sent the code.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @attribute_name : String? = nil,
          @delivery_medium : String? = nil,
          @destination : String? = nil
        )
        end
      end

      # This exception is thrown when a verification code fails to deliver successfully.

      struct CodeDeliveryFailureException
        include JSON::Serializable

        # The message sent when a verification code fails to deliver successfully.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown if the provided code doesn't match what the server was expecting.

      struct CodeMismatchException
        include JSON::Serializable

        # The message provided when the code mismatch exception is thrown.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CompleteWebAuthnRegistrationRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # A RegistrationResponseJSON public-key credential response from the user's passkey provider.

        @[JSON::Field(key: "Credential")]
        getter credential : Types::Document

        def initialize(
          @access_token : String,
          @credential : Types::Document
        )
        end
      end


      struct CompleteWebAuthnRegistrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Settings for user pool actions when Amazon Cognito detects compromised credentials with threat
      # protection in full-function ENFORCED mode.

      struct CompromisedCredentialsActionsType
        include JSON::Serializable

        # The action that Amazon Cognito takes when it detects compromised credentials.

        @[JSON::Field(key: "EventAction")]
        getter event_action : String

        def initialize(
          @event_action : String
        )
        end
      end

      # Settings for compromised-credentials actions and authentication-event sources with threat protection
      # in full-function ENFORCED mode.

      struct CompromisedCredentialsRiskConfigurationType
        include JSON::Serializable

        # Settings for the actions that you want your user pool to take when Amazon Cognito detects
        # compromised credentials.

        @[JSON::Field(key: "Actions")]
        getter actions : Types::CompromisedCredentialsActionsType

        # Settings for the sign-in activity where you want to configure compromised-credentials actions.
        # Defaults to all events.

        @[JSON::Field(key: "EventFilter")]
        getter event_filter : Array(String)?

        def initialize(
          @actions : Types::CompromisedCredentialsActionsType,
          @event_filter : Array(String)? = nil
        )
        end
      end

      # This exception is thrown if two or more modifications are happening concurrently.

      struct ConcurrentModificationException
        include JSON::Serializable

        # The message provided when the concurrent exception is thrown.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The confirm-device request.

      struct ConfirmDeviceRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The unique identifier, or device key, of the device that you want to update the status for.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # A friendly name for the device, for example MyMobilePhone .

        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The configuration of the device secret verifier.

        @[JSON::Field(key: "DeviceSecretVerifierConfig")]
        getter device_secret_verifier_config : Types::DeviceSecretVerifierConfigType?

        def initialize(
          @access_token : String,
          @device_key : String,
          @device_name : String? = nil,
          @device_secret_verifier_config : Types::DeviceSecretVerifierConfigType? = nil
        )
        end
      end

      # The confirm-device response.

      struct ConfirmDeviceResponse
        include JSON::Serializable

        # When true , your user must confirm that they want to remember the device. Prompt the user for an
        # answer. When false , immediately sets the device as remembered and eligible for device
        # authentication. You can configure your user pool to always remember devices, in which case this
        # response is false , or to allow users to opt in, in which case this response is true . Configure
        # this option under Device tracking in the Sign-in menu of your user pool.

        @[JSON::Field(key: "UserConfirmationNecessary")]
        getter user_confirmation_necessary : Bool?

        def initialize(
          @user_confirmation_necessary : Bool? = nil
        )
        end
      end

      # The request representing the confirmation for a password reset.

      struct ConfirmForgotPasswordRequest
        include JSON::Serializable

        # The ID of the app client where the user wants to reset their password. This parameter is an
        # identifier of the client application that users are resetting their password from, but this
        # operation resets users' irrespective of the app clients they sign in to.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The confirmation code that your user pool delivered when your user requested to reset their
        # password.

        @[JSON::Field(key: "ConfirmationCode")]
        getter confirmation_code : String

        # The new password that your user wants to set.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the ConfirmForgotPassword API action, Amazon Cognito invokes the function that is
        # assigned to the post confirmation trigger. When Amazon Cognito invokes this function, it passes a
        # JSON payload, which the function receives as input. This payload contains a clientMetadata
        # attribute, which provides the data that you assigned to the ClientMetadata parameter in your
        # ConfirmForgotPassword request. In your function code in Lambda, you can process the clientMetadata
        # value to enhance your workflow for your specific needs. For more information, see Using Lambda
        # triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata parameter, note
        # that Amazon Cognito won't do the following: Store the ClientMetadata value. This data is available
        # only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user
        # pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.
        # Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send sensitive
        # information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool
        # client and username plus the client ID in the message. For more information about SecretHash , see
        # Computing secret hash values .

        @[JSON::Field(key: "SecretHash")]
        getter secret_hash : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @client_id : String,
          @confirmation_code : String,
          @password : String,
          @username : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @secret_hash : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # The response from the server that results from a user's request to retrieve a forgotten password.

      struct ConfirmForgotPasswordResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to confirm registration of a user.

      struct ConfirmSignUpRequest
        include JSON::Serializable

        # The ID of the app client associated with the user pool.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The confirmation code that your user pool sent in response to the SignUp request.

        @[JSON::Field(key: "ConfirmationCode")]
        getter confirmation_code : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the ConfirmSignUp API action, Amazon Cognito invokes the function that is assigned to
        # the post confirmation trigger. When Amazon Cognito invokes this function, it passes a JSON payload,
        # which the function receives as input. This payload contains a clientMetadata attribute, which
        # provides the data that you assigned to the ClientMetadata parameter in your ConfirmSignUp request.
        # In your function code in Lambda, you can process the clientMetadata value to enhance your workflow
        # for your specific needs. For more information, see Using Lambda triggers in the Amazon Cognito
        # Developer Guide . When you use the ClientMetadata parameter, note that Amazon Cognito won't do the
        # following: Store the ClientMetadata value. This data is available only to Lambda triggers that are
        # assigned to a user pool to support custom workflows. If your user pool configuration doesn't include
        # triggers, the ClientMetadata parameter serves no purpose. Validate the ClientMetadata value. Encrypt
        # the ClientMetadata value. Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # When true , forces user confirmation despite any existing aliases. Defaults to false . A value of
        # true migrates the alias from an existing user to the new user if an existing user already has the
        # phone number or email address as an alias. Say, for example, that an existing user has an email
        # attribute of bob@example.com and email is an alias in your user pool. If the new user also has an
        # email of bob@example.com and your ConfirmSignUp response sets ForceAliasCreation to true , the new
        # user can sign in with a username of bob@example.com and the existing user can no longer do so. If
        # false and an attribute belongs to an existing alias, this request returns an AliasExistsException
        # error. For more information about sign-in aliases, see Customizing sign-in attributes .

        @[JSON::Field(key: "ForceAliasCreation")]
        getter force_alias_creation : Bool?

        # A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool
        # client and username plus the client ID in the message. For more information about SecretHash , see
        # Computing secret hash values .

        @[JSON::Field(key: "SecretHash")]
        getter secret_hash : String?

        # The optional session ID from a SignUp API request. You can sign in a user directly from the sign-up
        # process with the USER_AUTH authentication flow.

        @[JSON::Field(key: "Session")]
        getter session : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @client_id : String,
          @confirmation_code : String,
          @username : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @force_alias_creation : Bool? = nil,
          @secret_hash : String? = nil,
          @session : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # Represents the response from the server for the registration confirmation.

      struct ConfirmSignUpResponse
        include JSON::Serializable

        # A session identifier that you can use to immediately sign in the confirmed user. You can
        # automatically sign users in with the one-time password that they provided in a successful
        # ConfirmSignUp request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @session : String? = nil
        )
        end
      end

      # Contextual user data used for evaluating the risk of an authentication event by user pool threat
      # protection.

      struct ContextDataType
        include JSON::Serializable

        # The HTTP headers from your user's authentication request.

        @[JSON::Field(key: "HttpHeaders")]
        getter http_headers : Array(Types::HttpHeader)

        # The source IP address of your user's device.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String

        # The name of your application's service endpoint.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String

        # The path of your application's service endpoint.

        @[JSON::Field(key: "ServerPath")]
        getter server_path : String

        # Encoded device-fingerprint details that your app collected with the Amazon Cognito context data
        # collection library. For more information, see Adding user device and session data to API requests .

        @[JSON::Field(key: "EncodedData")]
        getter encoded_data : String?

        def initialize(
          @http_headers : Array(Types::HttpHeader),
          @ip_address : String,
          @server_name : String,
          @server_path : String,
          @encoded_data : String? = nil
        )
        end
      end


      struct CreateGroupRequest
        include JSON::Serializable

        # A name for the group. This name must be unique in your user pool.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool where you want to create a user group.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A description of the group that you're creating.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A non-negative integer value that specifies the precedence of this group relative to the other
        # groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with
        # lower Precedence values take precedence over groups with higher or null Precedence values. If a user
        # belongs to two or more groups, it is the group with the lowest precedence value whose role ARN is
        # given in the user's tokens for the cognito:roles and cognito:preferred_role claims. Two groups can
        # have the same Precedence value. If this happens, neither group takes precedence over the other. If
        # two groups with the same Precedence have the same role ARN, that role is used in the
        # cognito:preferred_role claim in tokens for users in each group. If the two groups have different
        # role ARNs, the cognito:preferred_role claim isn't set in users' tokens. The default Precedence value
        # is null. The maximum Precedence value is 2^31-1 .

        @[JSON::Field(key: "Precedence")]
        getter precedence : Int32?

        # The Amazon Resource Name (ARN) for the IAM role that you want to associate with the group. A group
        # role primarily declares a preferred role for the credentials that you get from an identity pool.
        # Amazon Cognito ID tokens have a cognito:preferred_role claim that presents the highest-precedence
        # group that a user belongs to. Both ID and access tokens also contain a cognito:groups claim that
        # list all the groups that a user is a member of.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @group_name : String,
          @user_pool_id : String,
          @description : String? = nil,
          @precedence : Int32? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateGroupResponse
        include JSON::Serializable

        # The response object for a created group.

        @[JSON::Field(key: "Group")]
        getter group : Types::GroupType?

        def initialize(
          @group : Types::GroupType? = nil
        )
        end
      end


      struct CreateIdentityProviderRequest
        include JSON::Serializable

        # The scopes, URLs, and identifiers for your external identity provider. The following examples
        # describe the provider detail keys for each IdP type. These values and their schema are subject to
        # change. Social IdP authorize_scopes values must match the values listed here. OpenID Connect (OIDC)
        # Amazon Cognito accepts the following elements when it can't discover endpoint URLs from oidc_issuer
        # : attributes_url , authorize_url , jwks_uri , token_url . Create or update request:
        # "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url":
        # "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json",
        # "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" } Describe
        # response: "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes":
        # "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id":
        # "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri":
        # "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com",
        # "token_url": "https://example.com/token" } SAML Create or update request with Metadata URL:
        # "ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256"
        # } Create or update request with Metadata file: "ProviderDetails": { "IDPInit": "true", "IDPSignout":
        # "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm":
        # "rsa-sha256" } The value of MetadataFile must be the plaintext metadata document with all quote (")
        # characters escaped by backslashes. Describe response: "ProviderDetails": { "IDPInit": "true",
        # "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm":
        # "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI":
        # "https://auth.example.com/sso/saml" } LoginWithAmazon Create or update request: "ProviderDetails": {
        # "authorize_scopes": "profile postal_code", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"
        # Describe response: "ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile",
        # "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code",
        # "authorize_url": "https://www.amazon.com/ap/oa", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret",
        # "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" } Google Create
        # or update request: "ProviderDetails": { "authorize_scopes": "email profile openid", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }
        # Describe response: "ProviderDetails": { "attributes_url":
        # "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true",
        # "authorize_scopes": "email profile openid", "authorize_url":
        # "https://accounts.google.com/o/oauth2/v2/auth", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret",
        # "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url":
        # "https://www.googleapis.com/oauth2/v4/token" } SignInWithApple Create or update request:
        # "ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito",
        # "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" } Describe response:
        # "ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name",
        # "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito",
        # "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE",
        # "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" } Facebook
        # Create or update request: "ProviderDetails": { "api_version": "v17.0", "authorize_scopes":
        # "public_profile, email", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret" } Describe response: "ProviderDetails": { "api_version": "v17.0",
        # "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes":
        # "true", "authorize_scopes": "public_profile, email", "authorize_url":
        # "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "token_request_method": "GET", "token_url":
        # "https://graph.facebook.com/v17.0/oauth/access_token" }

        @[JSON::Field(key: "ProviderDetails")]
        getter provider_details : Hash(String, String)

        # The name that you want to assign to the IdP. You can pass the identity provider name in the
        # identity_provider query parameter of requests to the Authorize endpoint to silently redirect to
        # sign-in with the associated IdP.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String

        # The type of IdP that you want to add. Amazon Cognito supports OIDC, SAML 2.0, Login With Amazon,
        # Sign In With Apple, Google, and Facebook IdPs.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # The Id of the user pool where you want to create an IdP.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A mapping of IdP attributes to standard and custom user pool attributes. Specify a user pool
        # attribute as the key of the key-value pair, and the IdP attribute claim name as the value.

        @[JSON::Field(key: "AttributeMapping")]
        getter attribute_mapping : Hash(String, String)?

        # An array of IdP identifiers, for example "IdPIdentifiers": [ "MyIdP", "MyIdP2" ] . Identifiers are
        # friendly names that you can pass in the idp_identifier query parameter of requests to the Authorize
        # endpoint to silently redirect to sign-in with the associated IdP. Identifiers in a domain format
        # also enable the use of email-address matching with SAML providers .

        @[JSON::Field(key: "IdpIdentifiers")]
        getter idp_identifiers : Array(String)?

        def initialize(
          @provider_details : Hash(String, String),
          @provider_name : String,
          @provider_type : String,
          @user_pool_id : String,
          @attribute_mapping : Hash(String, String)? = nil,
          @idp_identifiers : Array(String)? = nil
        )
        end
      end


      struct CreateIdentityProviderResponse
        include JSON::Serializable

        # The details of the new user pool IdP.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProviderType

        def initialize(
          @identity_provider : Types::IdentityProviderType
        )
        end
      end


      struct CreateManagedLoginBrandingRequest
        include JSON::Serializable

        # The app client that you want to create the branding style for. Each style is linked to an app client
        # until you delete it.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool where you want to create a new branding style.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # An array of image files that you want to apply to functions like backgrounds, logos, and icons. Each
        # object must also indicate whether it is for dark mode, light mode, or browser-adaptive mode.

        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::AssetType)?

        # A JSON file, encoded as a Document type, with the the settings that you want to apply to your style.
        # The following components are not currently implemented and reserved for future use: signUp
        # instructions sessionTimerDisplay languageSelector (for localization, see Managed login localization)

        @[JSON::Field(key: "Settings")]
        getter settings : Types::Document?

        # When true, applies the default branding style options. These default options are managed by Amazon
        # Cognito. You can modify them later in the branding editor. When you specify true for this option,
        # you must also omit values for Settings and Assets in the request.

        @[JSON::Field(key: "UseCognitoProvidedValues")]
        getter use_cognito_provided_values : Bool?

        def initialize(
          @client_id : String,
          @user_pool_id : String,
          @assets : Array(Types::AssetType)? = nil,
          @settings : Types::Document? = nil,
          @use_cognito_provided_values : Bool? = nil
        )
        end
      end


      struct CreateManagedLoginBrandingResponse
        include JSON::Serializable

        # The details of the branding style that you created.

        @[JSON::Field(key: "ManagedLoginBranding")]
        getter managed_login_branding : Types::ManagedLoginBrandingType?

        def initialize(
          @managed_login_branding : Types::ManagedLoginBrandingType? = nil
        )
        end
      end


      struct CreateResourceServerRequest
        include JSON::Serializable

        # A unique resource server identifier for the resource server. The identifier can be an API friendly
        # name like solar-system-data . You can also set an API URL like
        # https://solar-system-data-api.example.com as your identifier. Amazon Cognito represents scopes in
        # the access token in the format $resource-server-identifier/$scope . Longer scope-identifier strings
        # increase the size of your access tokens.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A friendly name for the resource server.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the user pool where you want to create a resource server.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A list of custom scopes. Each scope is a key-value map with the keys ScopeName and ScopeDescription
        # . The name of a custom scope is a combination of ScopeName and the resource server Name in this
        # request, for example MyResourceServerName/MyScopeName .

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(Types::ResourceServerScopeType)?

        def initialize(
          @identifier : String,
          @name : String,
          @user_pool_id : String,
          @scopes : Array(Types::ResourceServerScopeType)? = nil
        )
        end
      end


      struct CreateResourceServerResponse
        include JSON::Serializable

        # The details of the new resource server.

        @[JSON::Field(key: "ResourceServer")]
        getter resource_server : Types::ResourceServerType

        def initialize(
          @resource_server : Types::ResourceServerType
        )
        end
      end


      struct CreateTermsRequest
        include JSON::Serializable

        # The ID of the app client where you want to create terms documents. Must be an app client in the
        # requested user pool.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # This parameter is reserved for future use and currently accepts only one value.

        @[JSON::Field(key: "Enforcement")]
        getter enforcement : String

        # A friendly name for the document that you want to create in the current request. Must begin with
        # terms-of-use or privacy-policy as identification of the document type. Provide URLs for both
        # terms-of-use and privacy-policy in separate requests.

        @[JSON::Field(key: "TermsName")]
        getter terms_name : String

        # This parameter is reserved for future use and currently accepts only one value.

        @[JSON::Field(key: "TermsSource")]
        getter terms_source : String

        # The ID of the user pool where you want to create terms documents.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A map of URLs to languages. For each localized language that will view the requested TermsName ,
        # assign a URL. A selection of cognito:default displays for all languages that don't have a
        # language-specific URL. For example, "cognito:default": "https://terms.example.com",
        # "cognito:spanish": "https://terms.example.com/es" .

        @[JSON::Field(key: "Links")]
        getter links : Hash(String, String)?

        def initialize(
          @client_id : String,
          @enforcement : String,
          @terms_name : String,
          @terms_source : String,
          @user_pool_id : String,
          @links : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTermsResponse
        include JSON::Serializable

        # A summary of your terms documents. Includes a unique identifier for later changes to the terms
        # documents.

        @[JSON::Field(key: "Terms")]
        getter terms : Types::TermsType?

        def initialize(
          @terms : Types::TermsType? = nil
        )
        end
      end

      # Represents the request to create the user import job.

      struct CreateUserImportJobRequest
        include JSON::Serializable

        # You must specify an IAM role that has permission to log import-job results to Amazon CloudWatch
        # Logs. This parameter is the ARN of that role.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String

        # A friendly name for the user import job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String

        # The ID of the user pool that you want to import users into.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @cloud_watch_logs_role_arn : String,
          @job_name : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server to the request to create the user import job.

      struct CreateUserImportJobResponse
        include JSON::Serializable

        # The details of the user import job. Includes logging destination, status, and the Amazon S3
        # pre-signed URL for CSV upload.

        @[JSON::Field(key: "UserImportJob")]
        getter user_import_job : Types::UserImportJobType?

        def initialize(
          @user_import_job : Types::UserImportJobType? = nil
        )
        end
      end

      # Represents the request to create a user pool client.

      struct CreateUserPoolClientRequest
        include JSON::Serializable

        # A friendly name for the app client that you want to create.

        @[JSON::Field(key: "ClientName")]
        getter client_name : String

        # The ID of the user pool where you want to create an app client.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The access token time limit. After this limit expires, your user can't use their access token. To
        # specify the time unit for AccessTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set AccessTokenValidity to 10
        # and TokenValidityUnits to hours , your user can authorize access with their access token for 10
        # hours. The default time unit for AccessTokenValidity in an API request is hours. Valid range is
        # displayed below in seconds. If you don't specify otherwise in the configuration of your app client,
        # your access tokens are valid for one hour.

        @[JSON::Field(key: "AccessTokenValidity")]
        getter access_token_validity : Int32?

        # The OAuth grant types that you want your app client to generate for clients in managed login
        # authentication. To create an app client that generates client credentials grants, you must add
        # client_credentials as the only allowed OAuth flow. code Use a code grant flow, which provides an
        # authorization code as the response. This code can be exchanged for access tokens with the
        # /oauth2/token endpoint. implicit Issue the access token, and the ID token when scopes like openid
        # and profile are requested, directly to your user. client_credentials Issue the access token from the
        # /oauth2/token endpoint directly to a non-person user, authorized by a combination of the client ID
        # and client secret.

        @[JSON::Field(key: "AllowedOAuthFlows")]
        getter allowed_o_auth_flows : Array(String)?

        # Set to true to use OAuth 2.0 authorization server features in your app client. This parameter must
        # have a value of true before you can configure the following features in your app client.
        # CallBackURLs : Callback URLs. LogoutURLs : Sign-out redirect URLs. AllowedOAuthScopes : OAuth 2.0
        # scopes. AllowedOAuthFlows : Support for authorization code, implicit, and client credentials OAuth
        # 2.0 grants. To use authorization server features, configure one of these features in the Amazon
        # Cognito console or set AllowedOAuthFlowsUserPoolClient to true in a CreateUserPoolClient or
        # UpdateUserPoolClient API request. If you don't set a value for AllowedOAuthFlowsUserPoolClient in a
        # request with the CLI or SDKs, it defaults to false . When false , only SDK-based API sign-in is
        # permitted.

        @[JSON::Field(key: "AllowedOAuthFlowsUserPoolClient")]
        getter allowed_o_auth_flows_user_pool_client : Bool?

        # The OAuth, OpenID Connect (OIDC), and custom scopes that you want to permit your app client to
        # authorize access with. Scopes govern access control to user pool self-service API operations, user
        # data from the userInfo endpoint, and third-party APIs. Scope values include phone , email , openid ,
        # and profile . The aws.cognito.signin.user.admin scope authorizes user self-service operations.
        # Custom scopes with resource servers authorize access to external APIs.

        @[JSON::Field(key: "AllowedOAuthScopes")]
        getter allowed_o_auth_scopes : Array(String)?

        # The user pool analytics configuration for collecting metrics and sending them to your Amazon
        # Pinpoint campaign. In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools
        # might not have access to analytics or might be configurable with campaigns in the US East (N.
        # Virginia) Region. For more information, see Using Amazon Pinpoint analytics .

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration : Types::AnalyticsConfigurationType?

        # Amazon Cognito creates a session token for each API request in an authentication flow.
        # AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user
        # must respond to each authentication challenge before the session expires.

        @[JSON::Field(key: "AuthSessionValidity")]
        getter auth_session_validity : Int32?

        # A list of allowed redirect, or callback, URLs for managed login authentication. These URLs are the
        # paths where you want to send your users' browsers after they complete authentication with managed
        # login or a third-party IdP. Typically, callback URLs are the home of an application that uses OAuth
        # or OIDC libraries to process authentication outcomes. A redirect URI must meet the following
        # requirements: Be an absolute URI. Be registered with the authorization server. Amazon Cognito
        # doesn't accept authorization requests with redirect_uri values that aren't in the list of
        # CallbackURLs that you provide in this parameter. Not include a fragment component. See OAuth 2.0 -
        # Redirection Endpoint . Amazon Cognito requires HTTPS over HTTP except for http://localhost for
        # testing purposes only. App callback URLs such as myapp://example are also supported.

        @[JSON::Field(key: "CallbackURLs")]
        getter callback_ur_ls : Array(String)?

        # The default redirect URI. In app clients with one assigned IdP, replaces redirect_uri in
        # authentication requests. Must be in the CallbackURLs list.

        @[JSON::Field(key: "DefaultRedirectURI")]
        getter default_redirect_uri : String?

        # When true , your application can include additional UserContextData in authentication requests. This
        # data includes the IP address, and contributes to analysis by threat protection features. For more
        # information about propagation of user context data, see Adding session data to API requests . If you
        # don’t include this parameter, you can't send the source IP address to Amazon Cognito threat
        # protection features. You can only activate EnablePropagateAdditionalUserContextData in an app client
        # that has a client secret.

        @[JSON::Field(key: "EnablePropagateAdditionalUserContextData")]
        getter enable_propagate_additional_user_context_data : Bool?

        # Activates or deactivates token revocation in the target app client. If you don't include this
        # parameter, token revocation is automatically activated for the new user pool client.

        @[JSON::Field(key: "EnableTokenRevocation")]
        getter enable_token_revocation : Bool?

        # The authentication flows that you want your user pool client to support. For each app client in your
        # user pool, you can sign in your users with any combination of one or more flows, including with a
        # user name and Secure Remote Password (SRP), a user name and password, or a custom authentication
        # process that you define with Lambda functions. If you don't specify a value for ExplicitAuthFlows ,
        # your app client supports ALLOW_REFRESH_TOKEN_AUTH , ALLOW_USER_SRP_AUTH , and ALLOW_CUSTOM_AUTH .
        # The values for authentication flow options include the following. ALLOW_USER_AUTH : Enable
        # selection-based sign-in with USER_AUTH . This setting covers username-password, secure remote
        # password (SRP), passwordless, and passkey authentication. This authentiation flow can do
        # username-password and SRP authentication without other ExplicitAuthFlows permitting them. For
        # example users can complete an SRP challenge through USER_AUTH without the flow USER_SRP_AUTH being
        # active for the app client. This flow doesn't include CUSTOM_AUTH . To activate this setting, your
        # user pool must be in the Essentials tier or higher. ALLOW_ADMIN_USER_PASSWORD_AUTH : Enable admin
        # based user password authentication flow ADMIN_USER_PASSWORD_AUTH . This setting replaces the
        # ADMIN_NO_SRP_AUTH setting. With this authentication flow, your app passes a user name and password
        # to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to
        # securely transmit the password. ALLOW_CUSTOM_AUTH : Enable Lambda trigger based authentication.
        # ALLOW_USER_PASSWORD_AUTH : Enable user password-based authentication. In this flow, Amazon Cognito
        # receives the password in the request instead of using the SRP protocol to verify passwords.
        # ALLOW_USER_SRP_AUTH : Enable SRP-based authentication. ALLOW_REFRESH_TOKEN_AUTH : Enable authflow to
        # refresh tokens. In some environments, you will see the values ADMIN_NO_SRP_AUTH ,
        # CUSTOM_AUTH_FLOW_ONLY , or USER_PASSWORD_AUTH . You can't assign these legacy ExplicitAuthFlows
        # values to user pool clients at the same time as values that begin with ALLOW_ , like
        # ALLOW_USER_SRP_AUTH .

        @[JSON::Field(key: "ExplicitAuthFlows")]
        getter explicit_auth_flows : Array(String)?

        # When true , generates a client secret for the app client. Client secrets are used with server-side
        # and machine-to-machine applications. Client secrets are automatically generated; you can't specify a
        # secret value. For more information, see App client types .

        @[JSON::Field(key: "GenerateSecret")]
        getter generate_secret : Bool?

        # The ID token time limit. After this limit expires, your user can't use their ID token. To specify
        # the time unit for IdTokenValidity as seconds , minutes , hours , or days , set a TokenValidityUnits
        # value in your API request. For example, when you set IdTokenValidity as 10 and TokenValidityUnits as
        # hours , your user can authenticate their session with their ID token for 10 hours. The default time
        # unit for IdTokenValidity in an API request is hours. Valid range is displayed below in seconds. If
        # you don't specify otherwise in the configuration of your app client, your ID tokens are valid for
        # one hour.

        @[JSON::Field(key: "IdTokenValidity")]
        getter id_token_validity : Int32?

        # A list of allowed logout URLs for managed login authentication. When you pass logout_uri and
        # client_id parameters to /logout , Amazon Cognito signs out your user and redirects them to the
        # logout URL. This parameter describes the URLs that you want to be the permitted targets of
        # logout_uri . A typical use of these URLs is when a user selects "Sign out" and you redirect them to
        # your public homepage. For more information, see Logout endpoint .

        @[JSON::Field(key: "LogoutURLs")]
        getter logout_ur_ls : Array(String)?

        # When ENABLED , suppresses messages that might indicate a valid user exists when someone attempts
        # sign-in. This parameters sets your preference for the errors and responses that you want Amazon
        # Cognito APIs to return during authentication, account confirmation, and password recovery when the
        # user doesn't exist in the user pool. When set to ENABLED and the user doesn't exist, authentication
        # returns an error indicating either the username or password was incorrect. Account confirmation and
        # password recovery return a response indicating a code was sent to a simulated destination. When set
        # to LEGACY , those APIs return a UserNotFoundException exception if the user doesn't exist in the
        # user pool. Defaults to LEGACY .

        @[JSON::Field(key: "PreventUserExistenceErrors")]
        getter prevent_user_existence_errors : String?

        # The list of user attributes that you want your app client to have read access to. After your user
        # authenticates in your app, their access token authorizes them to read their own attribute value for
        # any attribute in this list. When you don't specify the ReadAttributes for your app client, your app
        # can read the values of email_verified , phone_number_verified , and the standard attributes of your
        # user pool. When your user pool app client has read access to these default attributes,
        # ReadAttributes doesn't return any information. Amazon Cognito only populates ReadAttributes in the
        # API response if you have specified your own custom set of read attributes.

        @[JSON::Field(key: "ReadAttributes")]
        getter read_attributes : Array(String)?

        # The configuration of your app client for refresh token rotation. When enabled, your app client
        # issues new ID, access, and refresh tokens when users renew their sessions with refresh tokens. When
        # disabled, token refresh issues only ID and access tokens.

        @[JSON::Field(key: "RefreshTokenRotation")]
        getter refresh_token_rotation : Types::RefreshTokenRotationType?

        # The refresh token time limit. After this limit expires, your user can't use their refresh token. To
        # specify the time unit for RefreshTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set RefreshTokenValidity as 10
        # and TokenValidityUnits as days , your user can refresh their session and retrieve new access and ID
        # tokens for 10 days. The default time unit for RefreshTokenValidity in an API request is days. You
        # can't set RefreshTokenValidity to 0. If you do, Amazon Cognito overrides the value with the default
        # value of 30 days. Valid range is displayed below in seconds. If you don't specify otherwise in the
        # configuration of your app client, your refresh tokens are valid for 30 days.

        @[JSON::Field(key: "RefreshTokenValidity")]
        getter refresh_token_validity : Int32?

        # A list of provider names for the identity providers (IdPs) that are supported on this client. The
        # following are supported: COGNITO , Facebook , Google , SignInWithApple , and LoginWithAmazon . You
        # can also specify the names that you configured for the SAML and OIDC IdPs in your user pool, for
        # example MySAMLIdP or MyOIDCIdP . This parameter sets the IdPs that managed login will display on the
        # login page for your app client. The removal of COGNITO from this list doesn't prevent authentication
        # operations for local users with the user pools API in an Amazon Web Services SDK. The only way to
        # prevent SDK-based authentication is to block access with a WAF rule .

        @[JSON::Field(key: "SupportedIdentityProviders")]
        getter supported_identity_providers : Array(String)?

        # The units that validity times are represented in. The default unit for refresh tokens is days, and
        # the default for ID and access tokens are hours.

        @[JSON::Field(key: "TokenValidityUnits")]
        getter token_validity_units : Types::TokenValidityUnitsType?

        # The list of user attributes that you want your app client to have write access to. After your user
        # authenticates in your app, their access token authorizes them to set or modify their own attribute
        # value for any attribute in this list. When you don't specify the WriteAttributes for your app
        # client, your app can write the values of the Standard attributes of your user pool. When your user
        # pool has write access to these default attributes, WriteAttributes doesn't return any information.
        # Amazon Cognito only populates WriteAttributes in the API response if you have specified your own
        # custom set of write attributes. If your app client allows users to sign in through an IdP, this
        # array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates
        # mapped attributes when users sign in to your application through an IdP. If your app client does not
        # have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the
        # attribute. For more information, see Specifying IdP Attribute Mappings for Your user pool .

        @[JSON::Field(key: "WriteAttributes")]
        getter write_attributes : Array(String)?

        def initialize(
          @client_name : String,
          @user_pool_id : String,
          @access_token_validity : Int32? = nil,
          @allowed_o_auth_flows : Array(String)? = nil,
          @allowed_o_auth_flows_user_pool_client : Bool? = nil,
          @allowed_o_auth_scopes : Array(String)? = nil,
          @analytics_configuration : Types::AnalyticsConfigurationType? = nil,
          @auth_session_validity : Int32? = nil,
          @callback_ur_ls : Array(String)? = nil,
          @default_redirect_uri : String? = nil,
          @enable_propagate_additional_user_context_data : Bool? = nil,
          @enable_token_revocation : Bool? = nil,
          @explicit_auth_flows : Array(String)? = nil,
          @generate_secret : Bool? = nil,
          @id_token_validity : Int32? = nil,
          @logout_ur_ls : Array(String)? = nil,
          @prevent_user_existence_errors : String? = nil,
          @read_attributes : Array(String)? = nil,
          @refresh_token_rotation : Types::RefreshTokenRotationType? = nil,
          @refresh_token_validity : Int32? = nil,
          @supported_identity_providers : Array(String)? = nil,
          @token_validity_units : Types::TokenValidityUnitsType? = nil,
          @write_attributes : Array(String)? = nil
        )
        end
      end

      # Represents the response from the server to create a user pool client.

      struct CreateUserPoolClientResponse
        include JSON::Serializable

        # The details of the new app client.

        @[JSON::Field(key: "UserPoolClient")]
        getter user_pool_client : Types::UserPoolClientType?

        def initialize(
          @user_pool_client : Types::UserPoolClientType? = nil
        )
        end
      end


      struct CreateUserPoolDomainRequest
        include JSON::Serializable

        # The domain string. For custom domains, this is the fully-qualified domain name, such as
        # auth.example.com . For prefix domains, this is the prefix alone, such as myprefix . A prefix value
        # of myprefix for a user pool in the us-east-1 Region results in a domain of
        # myprefix.auth.us-east-1.amazoncognito.com .

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The ID of the user pool where you want to add a domain.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The configuration for a custom domain. Configures your domain with an Certificate Manager
        # certificate in the us-east-1 Region. Provide this parameter only if you want to use a custom domain
        # for your user pool. Otherwise, you can omit this parameter and use a prefix domain instead. When you
        # create a custom domain, the passkey RP ID defaults to the custom domain. If you had a prefix domain
        # active, this will cause passkey integration for your prefix domain to stop working due to a mismatch
        # in RP ID. To keep the prefix domain passkey integration working, you can explicitly set RP ID to the
        # prefix domain.

        @[JSON::Field(key: "CustomDomainConfig")]
        getter custom_domain_config : Types::CustomDomainConfigType?

        # The version of managed login branding that you want to apply to your domain. A value of 1 indicates
        # hosted UI (classic) and a version of 2 indicates managed login. Managed login requires that your
        # user pool be configured for any feature plan other than Lite .

        @[JSON::Field(key: "ManagedLoginVersion")]
        getter managed_login_version : Int32?

        def initialize(
          @domain : String,
          @user_pool_id : String,
          @custom_domain_config : Types::CustomDomainConfigType? = nil,
          @managed_login_version : Int32? = nil
        )
        end
      end


      struct CreateUserPoolDomainResponse
        include JSON::Serializable

        # The fully-qualified domain name (FQDN) of the Amazon CloudFront distribution that hosts your managed
        # login or classic hosted UI pages. Your domain-name authority must have an alias record that points
        # requests for your custom domain to this FQDN. Amazon Cognito returns this value if you set a custom
        # domain with CustomDomainConfig . If you set an Amazon Cognito prefix domain, this parameter returns
        # null.

        @[JSON::Field(key: "CloudFrontDomain")]
        getter cloud_front_domain : String?

        # The version of managed login branding applied your domain. A value of 1 indicates hosted UI
        # (classic) and a version of 2 indicates managed login.

        @[JSON::Field(key: "ManagedLoginVersion")]
        getter managed_login_version : Int32?

        def initialize(
          @cloud_front_domain : String? = nil,
          @managed_login_version : Int32? = nil
        )
        end
      end

      # Represents the request to create a user pool.

      struct CreateUserPoolRequest
        include JSON::Serializable

        # A friendly name for your user pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The available verified method a user can use to recover their password when they call ForgotPassword
        # . You can use this setting to define a preferred method when a user has more than one method
        # available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the
        # user also has SMS multi-factor authentication (MFA) activated. Email MFA is also disqualifying for
        # account recovery with email. In the absence of this setting, Amazon Cognito uses the legacy behavior
        # to determine the recovery method where SMS is preferred over email. As a best practice, configure
        # both verified_email and verified_phone_number , with one having a higher priority than the other.

        @[JSON::Field(key: "AccountRecoverySetting")]
        getter account_recovery_setting : Types::AccountRecoverySettingType?

        # The configuration for administrative creation of users. Includes the template for the invitation
        # message for new users, the duration of temporary passwords, and permitting self-service sign-up.

        @[JSON::Field(key: "AdminCreateUserConfig")]
        getter admin_create_user_config : Types::AdminCreateUserConfigType?

        # Attributes supported as an alias for this user pool. For more information about alias attributes,
        # see Customizing sign-in attributes .

        @[JSON::Field(key: "AliasAttributes")]
        getter alias_attributes : Array(String)?

        # The attributes that you want your user pool to automatically verify. For more information, see
        # Verifying contact information at sign-up .

        @[JSON::Field(key: "AutoVerifiedAttributes")]
        getter auto_verified_attributes : Array(String)?

        # When active, DeletionProtection prevents accidental deletion of your user pool. Before you can
        # delete a user pool that you have protected against deletion, you must deactivate this feature. When
        # you try to delete a protected user pool in a DeleteUserPool API request, Amazon Cognito returns an
        # InvalidParameterException error. To delete a protected user pool, send a new DeleteUserPool request
        # after you deactivate deletion protection in an UpdateUserPool API request.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : String?

        # The device-remembering configuration for a user pool. Device remembering or device tracking is a
        # "Remember me on this device" option for user pools that perform authentication with the device key
        # of a trusted device in the back end, instead of a user-provided MFA code. For more information about
        # device authentication, see Working with user devices in your user pool . A null value indicates that
        # you have deactivated device remembering in your user pool. When you provide a value for any
        # DeviceConfiguration field, you activate the Amazon Cognito device-remembering feature. For more
        # information, see Working with devices .

        @[JSON::Field(key: "DeviceConfiguration")]
        getter device_configuration : Types::DeviceConfigurationType?

        # The email configuration of your user pool. The email configuration type sets your preferred sending
        # method, Amazon Web Services Region, and sender for messages from your user pool.

        @[JSON::Field(key: "EmailConfiguration")]
        getter email_configuration : Types::EmailConfigurationType?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationMessage")]
        getter email_verification_message : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationSubject")]
        getter email_verification_subject : String?

        # A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible
        # stages of authentication operations. Triggers can modify the outcome of the operations that invoked
        # them.

        @[JSON::Field(key: "LambdaConfig")]
        getter lambda_config : Types::LambdaConfigType?

        # Sets multi-factor authentication (MFA) to be on, off, or optional. When ON , all users must set up
        # MFA before they can sign in. When OPTIONAL , your application must make a client-side determination
        # of whether a user wants to register an MFA device. For user pools with adaptive authentication with
        # threat protection, choose OPTIONAL . When MfaConfiguration is OPTIONAL , managed login doesn't
        # automatically prompt users to set up MFA. Amazon Cognito generates MFA prompts in API responses and
        # in managed login for users who have chosen and configured a preferred MFA factor.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # The password policy and sign-in policy in the user pool. The password policy sets options like
        # password complexity requirements and password history. The sign-in policy sets the options available
        # to applications in choice-based authentication .

        @[JSON::Field(key: "Policies")]
        getter policies : Types::UserPoolPolicyType?

        # An array of attributes for the new user pool. You can add custom attributes and modify the
        # properties of default attributes. The specifications in this parameter set the required attributes
        # in your user pool. For more information, see Working with user attributes .

        @[JSON::Field(key: "Schema")]
        getter schema : Array(Types::SchemaAttributeType)?

        # The contents of the SMS message that your user pool sends to users in SMS OTP and MFA
        # authentication.

        @[JSON::Field(key: "SmsAuthenticationMessage")]
        getter sms_authentication_message : String?

        # The settings for your Amazon Cognito user pool to send SMS messages with Amazon Simple Notification
        # Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the
        # Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web
        # Services account. For more information see SMS message settings .

        @[JSON::Field(key: "SmsConfiguration")]
        getter sms_configuration : Types::SmsConfigurationType?

        # This parameter is no longer used.

        @[JSON::Field(key: "SmsVerificationMessage")]
        getter sms_verification_message : String?

        # The settings for updates to user attributes. These settings include the property
        # AttributesRequireVerificationBeforeUpdate , a user-pool setting that tells Amazon Cognito how to
        # handle changes to the value of your users' email address and phone number attributes. For more
        # information, see Verifying updates to email addresses and phone numbers .

        @[JSON::Field(key: "UserAttributeUpdateSettings")]
        getter user_attribute_update_settings : Types::UserAttributeUpdateSettingsType?

        # Contains settings for activation of threat protection, including the operating mode and additional
        # authentication types. To log user security information but take no action, set to AUDIT . To
        # configure automatic security responses to potentially unwanted traffic to your user pool, set to
        # ENFORCED . For more information, see Adding advanced security to a user pool . To activate this
        # setting, your user pool must be on the Plus tier .

        @[JSON::Field(key: "UserPoolAddOns")]
        getter user_pool_add_ons : Types::UserPoolAddOnsType?

        # The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize
        # and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.

        @[JSON::Field(key: "UserPoolTags")]
        getter user_pool_tags : Hash(String, String)?

        # The user pool feature plan , or tier. This parameter determines the eligibility of the user pool for
        # features like managed login, access-token customization, and threat protection. Defaults to
        # ESSENTIALS .

        @[JSON::Field(key: "UserPoolTier")]
        getter user_pool_tier : String?

        # Specifies whether a user can use an email address or phone number as a username when they sign up.
        # For more information, see Customizing sign-in attributes .

        @[JSON::Field(key: "UsernameAttributes")]
        getter username_attributes : Array(String)?

        # Sets the case sensitivity option for sign-in usernames. When CaseSensitive is false (case
        # insensitive), users can sign in with any combination of capital and lowercase letters. For example,
        # username , USERNAME , or UserName , or for email, email@example.com or EMaiL@eXamplE.Com . For most
        # use cases, set case sensitivity to false as a best practice. When usernames and email addresses are
        # case insensitive, Amazon Cognito treats any variation in case as the same user, and prevents a case
        # variation from being assigned to the same attribute for a different user. When CaseSensitive is true
        # (case sensitive), Amazon Cognito interprets USERNAME and UserName as distinct users. This
        # configuration is immutable after you set it.

        @[JSON::Field(key: "UsernameConfiguration")]
        getter username_configuration : Types::UsernameConfigurationType?

        # The template for the verification message that your user pool delivers to users who set an email
        # address or phone number attribute. Set the email message type that corresponds to your
        # DefaultEmailOption selection. For CONFIRM_WITH_LINK , specify an EmailMessageByLink and leave
        # EmailMessage blank. For CONFIRM_WITH_CODE , specify an EmailMessage and leave EmailMessageByLink
        # blank. When you supply both parameters with either choice, Amazon Cognito returns an error.

        @[JSON::Field(key: "VerificationMessageTemplate")]
        getter verification_message_template : Types::VerificationMessageTemplateType?

        def initialize(
          @pool_name : String,
          @account_recovery_setting : Types::AccountRecoverySettingType? = nil,
          @admin_create_user_config : Types::AdminCreateUserConfigType? = nil,
          @alias_attributes : Array(String)? = nil,
          @auto_verified_attributes : Array(String)? = nil,
          @deletion_protection : String? = nil,
          @device_configuration : Types::DeviceConfigurationType? = nil,
          @email_configuration : Types::EmailConfigurationType? = nil,
          @email_verification_message : String? = nil,
          @email_verification_subject : String? = nil,
          @lambda_config : Types::LambdaConfigType? = nil,
          @mfa_configuration : String? = nil,
          @policies : Types::UserPoolPolicyType? = nil,
          @schema : Array(Types::SchemaAttributeType)? = nil,
          @sms_authentication_message : String? = nil,
          @sms_configuration : Types::SmsConfigurationType? = nil,
          @sms_verification_message : String? = nil,
          @user_attribute_update_settings : Types::UserAttributeUpdateSettingsType? = nil,
          @user_pool_add_ons : Types::UserPoolAddOnsType? = nil,
          @user_pool_tags : Hash(String, String)? = nil,
          @user_pool_tier : String? = nil,
          @username_attributes : Array(String)? = nil,
          @username_configuration : Types::UsernameConfigurationType? = nil,
          @verification_message_template : Types::VerificationMessageTemplateType? = nil
        )
        end
      end

      # Represents the response from the server for the request to create a user pool.

      struct CreateUserPoolResponse
        include JSON::Serializable

        # The details of the created user pool.

        @[JSON::Field(key: "UserPool")]
        getter user_pool : Types::UserPoolType?

        def initialize(
          @user_pool : Types::UserPoolType? = nil
        )
        end
      end

      # The configuration for a hosted UI custom domain.

      struct CustomDomainConfigType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Certificate Manager SSL certificate. You use this certificate
        # for the subdomain of your custom domain.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      # The properties of a custom email sender Lambda trigger.

      struct CustomEmailLambdaVersionConfigType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String

        # The user pool trigger version of the request that Amazon Cognito sends to your Lambda function.
        # Higher-numbered versions add fields that support new features. You must use a LambdaVersion of V1_0
        # with a custom sender function.

        @[JSON::Field(key: "LambdaVersion")]
        getter lambda_version : String

        def initialize(
          @lambda_arn : String,
          @lambda_version : String
        )
        end
      end

      # The properties of a custom SMS sender Lambda trigger.

      struct CustomSMSLambdaVersionConfigType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String

        # The user pool trigger version of the request that Amazon Cognito sends to your Lambda function.
        # Higher-numbered versions add fields that support new features. You must use a LambdaVersion of V1_0
        # with a custom sender function.

        @[JSON::Field(key: "LambdaVersion")]
        getter lambda_version : String

        def initialize(
          @lambda_arn : String,
          @lambda_version : String
        )
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable

        # The name of the group that you want to delete.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool where you want to delete the group.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @group_name : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteIdentityProviderRequest
        include JSON::Serializable

        # The name of the IdP that you want to delete.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String

        # The ID of the user pool where you want to delete the identity provider.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @provider_name : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteManagedLoginBrandingRequest
        include JSON::Serializable

        # The ID of the managed login branding style that you want to delete.

        @[JSON::Field(key: "ManagedLoginBrandingId")]
        getter managed_login_branding_id : String

        # The ID of the user pool that contains the managed login branding style that you want to delete.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @managed_login_branding_id : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteResourceServerRequest
        include JSON::Serializable

        # The identifier of the resource server that you want to delete.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The ID of the user pool where you want to delete the resource server.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @identifier : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteTermsRequest
        include JSON::Serializable

        # The ID of the terms documents that you want to delete.

        @[JSON::Field(key: "TermsId")]
        getter terms_id : String

        # The ID of the user pool that contains the terms documents that you want to delete.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @terms_id : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the request to delete user attributes.

      struct DeleteUserAttributesRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # An array of strings representing the user attribute names you want to delete. For custom attributes,
        # you must prepend the custom: prefix to the attribute name, for example custom:department .

        @[JSON::Field(key: "UserAttributeNames")]
        getter user_attribute_names : Array(String)

        def initialize(
          @access_token : String,
          @user_attribute_names : Array(String)
        )
        end
      end

      # Represents the response from the server to delete user attributes.

      struct DeleteUserAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to delete a user pool client.

      struct DeleteUserPoolClientRequest
        include JSON::Serializable

        # The ID of the user pool app client that you want to delete.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool where you want to delete the client.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @client_id : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteUserPoolDomainRequest
        include JSON::Serializable

        # The domain that you want to delete. For custom domains, this is the fully-qualified domain name like
        # auth.example.com . For Amazon Cognito prefix domains, this is the prefix alone, like myprefix .

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The ID of the user pool where you want to delete the domain.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @domain : String,
          @user_pool_id : String
        )
        end
      end


      struct DeleteUserPoolDomainResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to delete a user pool.

      struct DeleteUserPoolRequest
        include JSON::Serializable

        # The ID of the user pool that you want to delete.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end

      # Represents the request to delete a user.

      struct DeleteUserRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end


      struct DeleteWebAuthnCredentialRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The unique identifier of the passkey that you want to delete.

        @[JSON::Field(key: "CredentialId")]
        getter credential_id : String

        def initialize(
          @access_token : String,
          @credential_id : String
        )
        end
      end


      struct DeleteWebAuthnCredentialResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeIdentityProviderRequest
        include JSON::Serializable

        # The name of the IdP that you want to describe.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String

        # The ID of the user pool that has the IdP that you want to describe..

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @provider_name : String,
          @user_pool_id : String
        )
        end
      end


      struct DescribeIdentityProviderResponse
        include JSON::Serializable

        # The details of the requested IdP.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProviderType

        def initialize(
          @identity_provider : Types::IdentityProviderType
        )
        end
      end


      struct DescribeManagedLoginBrandingByClientRequest
        include JSON::Serializable

        # The app client that's assigned to the branding style that you want more information about.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool that contains the app client where you want more information about the
        # managed login branding style.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # When true , returns values for branding options that are unchanged from Amazon Cognito defaults.
        # When false or when you omit this parameter, returns only values that you customized in your branding
        # style.

        @[JSON::Field(key: "ReturnMergedResources")]
        getter return_merged_resources : Bool?

        def initialize(
          @client_id : String,
          @user_pool_id : String,
          @return_merged_resources : Bool? = nil
        )
        end
      end


      struct DescribeManagedLoginBrandingByClientResponse
        include JSON::Serializable

        # The details of the requested branding style.

        @[JSON::Field(key: "ManagedLoginBranding")]
        getter managed_login_branding : Types::ManagedLoginBrandingType?

        def initialize(
          @managed_login_branding : Types::ManagedLoginBrandingType? = nil
        )
        end
      end


      struct DescribeManagedLoginBrandingRequest
        include JSON::Serializable

        # The ID of the managed login branding style that you want to get more information about.

        @[JSON::Field(key: "ManagedLoginBrandingId")]
        getter managed_login_branding_id : String

        # The ID of the user pool that contains the managed login branding style that you want to get
        # information about.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # When true , returns values for branding options that are unchanged from Amazon Cognito defaults.
        # When false or when you omit this parameter, returns only values that you customized in your branding
        # style.

        @[JSON::Field(key: "ReturnMergedResources")]
        getter return_merged_resources : Bool?

        def initialize(
          @managed_login_branding_id : String,
          @user_pool_id : String,
          @return_merged_resources : Bool? = nil
        )
        end
      end


      struct DescribeManagedLoginBrandingResponse
        include JSON::Serializable

        # The details of the requested branding style.

        @[JSON::Field(key: "ManagedLoginBranding")]
        getter managed_login_branding : Types::ManagedLoginBrandingType?

        def initialize(
          @managed_login_branding : Types::ManagedLoginBrandingType? = nil
        )
        end
      end


      struct DescribeResourceServerRequest
        include JSON::Serializable

        # A unique resource server identifier for the resource server. The identifier can be an API friendly
        # name like solar-system-data . You can also set an API URL like
        # https://solar-system-data-api.example.com as your identifier. Amazon Cognito represents scopes in
        # the access token in the format $resource-server-identifier/$scope . Longer scope-identifier strings
        # increase the size of your access tokens.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The ID of the user pool that hosts the resource server.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @identifier : String,
          @user_pool_id : String
        )
        end
      end


      struct DescribeResourceServerResponse
        include JSON::Serializable

        # The details of the requested resource server.

        @[JSON::Field(key: "ResourceServer")]
        getter resource_server : Types::ResourceServerType

        def initialize(
          @resource_server : Types::ResourceServerType
        )
        end
      end


      struct DescribeRiskConfigurationRequest
        include JSON::Serializable

        # The ID of the user pool with the risk configuration that you want to inspect. You can apply default
        # risk configuration at the user pool level and further customize it from user pool defaults at the
        # app-client level. Specify ClientId to inspect client-level configuration, or UserPoolId to inspect
        # pool-level configuration.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The ID of the app client with the risk configuration that you want to inspect. You can apply default
        # risk configuration at the user pool level and further customize it from user pool defaults at the
        # app-client level. Specify ClientId to inspect client-level configuration, or UserPoolId to inspect
        # pool-level configuration.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        def initialize(
          @user_pool_id : String,
          @client_id : String? = nil
        )
        end
      end


      struct DescribeRiskConfigurationResponse
        include JSON::Serializable

        # The details of the requested risk configuration.

        @[JSON::Field(key: "RiskConfiguration")]
        getter risk_configuration : Types::RiskConfigurationType

        def initialize(
          @risk_configuration : Types::RiskConfigurationType
        )
        end
      end


      struct DescribeTermsRequest
        include JSON::Serializable

        # The ID of the terms documents that you want to describe.

        @[JSON::Field(key: "TermsId")]
        getter terms_id : String

        # The ID of the user pool that contains the terms documents that you want to describe.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @terms_id : String,
          @user_pool_id : String
        )
        end
      end


      struct DescribeTermsResponse
        include JSON::Serializable

        # A summary of the requested terms documents. Includes a unique identifier for later changes to the
        # terms documents.

        @[JSON::Field(key: "Terms")]
        getter terms : Types::TermsType?

        def initialize(
          @terms : Types::TermsType? = nil
        )
        end
      end

      # Represents the request to describe the user import job.

      struct DescribeUserImportJobRequest
        include JSON::Serializable

        # The Id of the user import job that you want to describe.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The ID of the user pool that's associated with the import job.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @job_id : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server to the request to describe the user import job.

      struct DescribeUserImportJobResponse
        include JSON::Serializable

        # The details of the user import job. Includes logging destination, status, and the Amazon S3
        # pre-signed URL for CSV upload.

        @[JSON::Field(key: "UserImportJob")]
        getter user_import_job : Types::UserImportJobType?

        def initialize(
          @user_import_job : Types::UserImportJobType? = nil
        )
        end
      end

      # Represents the request to describe a user pool client.

      struct DescribeUserPoolClientRequest
        include JSON::Serializable

        # The ID of the app client that you want to describe.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool that contains the app client you want to describe.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @client_id : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server from a request to describe the user pool client.

      struct DescribeUserPoolClientResponse
        include JSON::Serializable

        # The details of the request app client.

        @[JSON::Field(key: "UserPoolClient")]
        getter user_pool_client : Types::UserPoolClientType?

        def initialize(
          @user_pool_client : Types::UserPoolClientType? = nil
        )
        end
      end


      struct DescribeUserPoolDomainRequest
        include JSON::Serializable

        # The domain that you want to describe. For custom domains, this is the fully-qualified domain name,
        # such as auth.example.com . For Amazon Cognito prefix domains, this is the prefix alone, such as auth
        # .

        @[JSON::Field(key: "Domain")]
        getter domain : String

        def initialize(
          @domain : String
        )
        end
      end


      struct DescribeUserPoolDomainResponse
        include JSON::Serializable

        # The details of the requested user pool domain.

        @[JSON::Field(key: "DomainDescription")]
        getter domain_description : Types::DomainDescriptionType?

        def initialize(
          @domain_description : Types::DomainDescriptionType? = nil
        )
        end
      end

      # Represents the request to describe the user pool.

      struct DescribeUserPoolRequest
        include JSON::Serializable

        # The ID of the user pool you want to describe.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end

      # Represents the response to describe the user pool.

      struct DescribeUserPoolResponse
        include JSON::Serializable

        # The details of the requested user pool.

        @[JSON::Field(key: "UserPool")]
        getter user_pool : Types::UserPoolType?

        def initialize(
          @user_pool : Types::UserPoolType? = nil
        )
        end
      end

      # The device-remembering configuration for a user pool. When you provide a value for any property of
      # DeviceConfiguration , you activate the device remembering for the user pool.

      struct DeviceConfigurationType
        include JSON::Serializable

        # When true, a remembered device can sign in with device authentication instead of SMS and time-based
        # one-time password (TOTP) factors for multi-factor authentication (MFA). Whether or not
        # ChallengeRequiredOnNewDevice is true, users who sign in with devices that have not been confirmed or
        # remembered must still provide a second factor in a user pool that requires MFA.

        @[JSON::Field(key: "ChallengeRequiredOnNewDevice")]
        getter challenge_required_on_new_device : Bool?

        # When true, Amazon Cognito doesn't automatically remember a user's device when your app sends a
        # ConfirmDevice API request. In your app, create a prompt for your user to choose whether they want to
        # remember their device. Return the user's choice in an UpdateDeviceStatus API request. When
        # DeviceOnlyRememberedOnUserPrompt is false , Amazon Cognito immediately remembers devices that you
        # register in a ConfirmDevice API request.

        @[JSON::Field(key: "DeviceOnlyRememberedOnUserPrompt")]
        getter device_only_remembered_on_user_prompt : Bool?

        def initialize(
          @challenge_required_on_new_device : Bool? = nil,
          @device_only_remembered_on_user_prompt : Bool? = nil
        )
        end
      end

      # This exception is thrown when a user attempts to confirm a device with a device key that already
      # exists.

      struct DeviceKeyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A Secure Remote Password (SRP) value that your application generates when you register a user's
      # device. For more information, see Getting a device key .

      struct DeviceSecretVerifierConfigType
        include JSON::Serializable

        # A password verifier for a user's device. Used in SRP authentication.

        @[JSON::Field(key: "PasswordVerifier")]
        getter password_verifier : String?

        # The salt that you want to use in SRP authentication with the user's device.

        @[JSON::Field(key: "Salt")]
        getter salt : String?

        def initialize(
          @password_verifier : String? = nil,
          @salt : String? = nil
        )
        end
      end

      # Information about a user's device that they've registered for device SRP authentication in your
      # application. For more information, see Working with user devices in your user pool .

      struct DeviceType
        include JSON::Serializable

        # Metadata about a user's device, like name and last-access source IP.

        @[JSON::Field(key: "DeviceAttributes")]
        getter device_attributes : Array(Types::AttributeType)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "DeviceCreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter device_create_date : Time?

        # The device key, for example us-west-2_EXAMPLE-a1b2c3d4-5678-90ab-cdef-EXAMPLE22222 .

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String?

        # The date when the user last signed in with the device.

        @[JSON::Field(key: "DeviceLastAuthenticatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter device_last_authenticated_date : Time?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "DeviceLastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter device_last_modified_date : Time?

        def initialize(
          @device_attributes : Array(Types::AttributeType)? = nil,
          @device_create_date : Time? = nil,
          @device_key : String? = nil,
          @device_last_authenticated_date : Time? = nil,
          @device_last_modified_date : Time? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # A container for information about the user pool domain associated with the hosted UI and OAuth
      # endpoints.

      struct DomainDescriptionType
        include JSON::Serializable

        # The Amazon Web Services account that you created the user pool in.

        @[JSON::Field(key: "AWSAccountId")]
        getter aws_account_id : String?

        # The Amazon CloudFront endpoint that hosts your custom domain.

        @[JSON::Field(key: "CloudFrontDistribution")]
        getter cloud_front_distribution : String?

        # The configuration for a custom domain that hosts the sign-up and sign-in webpages for your
        # application.

        @[JSON::Field(key: "CustomDomainConfig")]
        getter custom_domain_config : Types::CustomDomainConfigType?

        # The domain string. For custom domains, this is the fully-qualified domain name, such as
        # auth.example.com . For Amazon Cognito prefix domains, this is the prefix alone, such as auth .

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The version of managed login branding that you want to apply to your domain. A value of 1 indicates
        # hosted UI (classic) branding and a version of 2 indicates managed login branding. Managed login
        # requires that your user pool be configured for any feature plan other than Lite .

        @[JSON::Field(key: "ManagedLoginVersion")]
        getter managed_login_version : Int32?

        # The Amazon S3 bucket where the static files for this domain are stored.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The domain status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the user pool that the domain is attached to.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        # The app version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @aws_account_id : String? = nil,
          @cloud_front_distribution : String? = nil,
          @custom_domain_config : Types::CustomDomainConfigType? = nil,
          @domain : String? = nil,
          @managed_login_version : Int32? = nil,
          @s3_bucket : String? = nil,
          @status : String? = nil,
          @user_pool_id : String? = nil,
          @version : String? = nil
        )
        end
      end

      # This exception is thrown when the provider is already supported by the user pool.

      struct DuplicateProviderException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The email configuration of your user pool. The email configuration type sets your preferred sending
      # method, Amazon Web Services Region, and sender for messages from your user pool. Amazon Cognito can
      # send email messages with Amazon Simple Email Service resources in the Amazon Web Services Region
      # where you created your user pool, and in alternate Regions in some cases. For more information on
      # the supported Regions, see Email settings for Amazon Cognito user pools .

      struct EmailConfigurationType
        include JSON::Serializable

        # The set of configuration rules that can be applied to emails sent using Amazon Simple Email Service.
        # A configuration set is applied to an email by including a reference to the configuration set in the
        # headers of the email. Once applied, all of the rules in that configuration set are applied to the
        # email. Configuration sets can be used to apply the following types of rules to emails: Event
        # publishing Amazon Simple Email Service can track the number of send, delivery, open, click, bounce,
        # and complaint events for each email sent. Use event publishing to send information about these
        # events to other Amazon Web Services services such as and Amazon CloudWatch IP pool management When
        # leasing dedicated IP addresses with Amazon Simple Email Service, you can create groups of IP
        # addresses, called dedicated IP pools. You can then associate the dedicated IP pools with
        # configuration sets.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : String?

        # Specifies whether Amazon Cognito uses its built-in functionality to send your users email messages,
        # or uses your Amazon Simple Email Service email configuration. Specify one of the following values:
        # COGNITO_DEFAULT When Amazon Cognito emails your users, it uses its built-in email functionality.
        # When you use the default option, Amazon Cognito allows only a limited number of emails each day for
        # your user pool. For typical production environments, the default email limit is less than the
        # required delivery volume. To achieve a higher delivery volume, specify DEVELOPER to use your Amazon
        # SES email configuration. To look up the email delivery limit for the default option, see Limits in
        # the Amazon Cognito Developer Guide . The default FROM address is no-reply@verificationemail.com . To
        # customize the FROM address, provide the Amazon Resource Name (ARN) of an Amazon SES verified email
        # address for the SourceArn parameter. DEVELOPER When Amazon Cognito emails your users, it uses your
        # Amazon SES configuration. Amazon Cognito calls Amazon SES on your behalf to send email from your
        # verified email address. When you use this option, the email delivery limits are the same limits that
        # apply to your Amazon SES verified email address in your Amazon Web Services account. If you use this
        # option, provide the ARN of an Amazon SES verified email address for the SourceArn parameter. Before
        # Amazon Cognito can email your users, it requires additional permissions to call Amazon SES on your
        # behalf. When you update your user pool with this option, Amazon Cognito creates a service-linked
        # role , which is a type of role in your Amazon Web Services account. This role contains the
        # permissions that allow you to access Amazon SES and send email messages from your email address. For
        # more information about the service-linked role that Amazon Cognito creates, see Using Service-Linked
        # Roles for Amazon Cognito in the Amazon Cognito Developer Guide .

        @[JSON::Field(key: "EmailSendingAccount")]
        getter email_sending_account : String?

        # Either the sender’s email address or the sender’s name with their email address. For example,
        # testuser@example.com or Test User &lt;testuser@example.com&gt; . This address appears before the
        # body of the email.

        @[JSON::Field(key: "From")]
        getter from : String?

        # The destination to which the receiver of the email should reply.

        @[JSON::Field(key: "ReplyToEmailAddress")]
        getter reply_to_email_address : String?

        # The ARN of a verified email address or an address from a verified domain in Amazon SES. You can set
        # a SourceArn email from a verified domain only with an API request. You can set a verified email
        # address, but not an address in a verified domain, in the Amazon Cognito console. Amazon Cognito uses
        # the email address that you provide in one of the following ways, depending on the value that you
        # specify for the EmailSendingAccount parameter: If you specify COGNITO_DEFAULT , Amazon Cognito uses
        # this address as the custom FROM address when it emails your users using its built-in email account.
        # If you specify DEVELOPER , Amazon Cognito emails your users with this address by calling Amazon SES
        # on your behalf. The Region value of the SourceArn parameter must indicate a supported Amazon Web
        # Services Region of your user pool. Typically, the Region in the SourceArn and the user pool Region
        # are the same. For more information, see Amazon SES email configuration regions in the Amazon Cognito
        # Developer Guide .

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        def initialize(
          @configuration_set : String? = nil,
          @email_sending_account : String? = nil,
          @from : String? = nil,
          @reply_to_email_address : String? = nil,
          @source_arn : String? = nil
        )
        end
      end

      # Sets or shows configuration for user pool email message MFA and sign-in with one-time passwords
      # (OTPs). Includes the subject and body of the email message template for sign-in and MFA messages. To
      # activate this setting, your user pool must be in the Essentials tier or higher.

      struct EmailMfaConfigType
        include JSON::Serializable

        # The template for the email messages that your user pool sends to users with codes for MFA and
        # sign-in with email OTPs. The message must contain the {####} placeholder. In the message, Amazon
        # Cognito replaces this placeholder with the code. If you don't provide this parameter, Amazon Cognito
        # sends messages in the default format.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The subject of the email messages that your user pool sends to users with codes for MFA and email
        # OTP sign-in.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @message : String? = nil,
          @subject : String? = nil
        )
        end
      end

      # User preferences for multi-factor authentication with email messages. Activates or deactivates email
      # MFA and sets it as the preferred MFA method when multiple methods are available. To activate this
      # setting, your user pool must be in the Essentials tier or higher.

      struct EmailMfaSettingsType
        include JSON::Serializable

        # Specifies whether email message MFA is active for a user. When the value of this parameter is
        # Enabled , the user will be prompted for MFA during all sign-in attempts, unless device tracking is
        # turned on and the device has been trusted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies whether email message MFA is the user's preferred method.

        @[JSON::Field(key: "PreferredMfa")]
        getter preferred_mfa : Bool?

        def initialize(
          @enabled : Bool? = nil,
          @preferred_mfa : Bool? = nil
        )
        end
      end

      # This exception is thrown when there is a code mismatch and the service fails to configure the
      # software token TOTP multi-factor authentication (MFA).

      struct EnableSoftwareTokenMFAException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The context data that your application submitted in an authentication request with threat
      # protection, as displayed in an AdminListUserAuthEvents response.

      struct EventContextDataType
        include JSON::Serializable

        # The user's city.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The user's country.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The user's device name.

        @[JSON::Field(key: "DeviceName")]
        getter device_name : String?

        # The source IP address of your user's device.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The user's time zone.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @city : String? = nil,
          @country : String? = nil,
          @device_name : String? = nil,
          @ip_address : String? = nil,
          @timezone : String? = nil
        )
        end
      end

      # The feedback that your application submitted to a threat protection event log, as displayed in an
      # AdminListUserAuthEvents response.

      struct EventFeedbackType
        include JSON::Serializable

        # Your feedback to the authentication event. When you provide a FeedbackValue value of valid , you
        # tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of
        # risk. When you provide a FeedbackValue value of invalid , you tell Amazon Cognito that you don't
        # trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.

        @[JSON::Field(key: "FeedbackValue")]
        getter feedback_value : String

        # The submitter of the event feedback. For example, if you submit event feedback in the Amazon Cognito
        # console, this value is Admin .

        @[JSON::Field(key: "Provider")]
        getter provider : String

        # The date that you or your user submitted the feedback.

        @[JSON::Field(key: "FeedbackDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter feedback_date : Time?

        def initialize(
          @feedback_value : String,
          @provider : String,
          @feedback_date : Time? = nil
        )
        end
      end

      # The risk evaluation by adaptive authentication, as displayed in an AdminListUserAuthEvents response.
      # Contains evaluations of compromised-credentials detection and assessed risk level and action taken
      # by adaptive authentication.

      struct EventRiskType
        include JSON::Serializable

        # Indicates whether compromised credentials were detected during an authentication event.

        @[JSON::Field(key: "CompromisedCredentialsDetected")]
        getter compromised_credentials_detected : Bool?

        # The action taken by adaptive authentication. If NoRisk , your user pool took no action. If
        # AccountTakeover , your user pool applied the adaptive authentication automated response that you
        # configured. If Block , your user pool prevented the attempt.

        @[JSON::Field(key: "RiskDecision")]
        getter risk_decision : String?

        # The risk level that adaptive authentication assessed for the authentication event.

        @[JSON::Field(key: "RiskLevel")]
        getter risk_level : String?

        def initialize(
          @compromised_credentials_detected : Bool? = nil,
          @risk_decision : String? = nil,
          @risk_level : String? = nil
        )
        end
      end

      # This exception is thrown if a code has expired.

      struct ExpiredCodeException
        include JSON::Serializable

        # The message returned when the expired code exception is thrown.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a feature you attempted to configure isn't available in your current
      # feature plan.

      struct FeatureUnavailableInTierException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration for the Amazon Data Firehose stream destination of user activity log export with
      # threat protection.

      struct FirehoseConfigurationType
        include JSON::Serializable

        # The ARN of an Amazon Data Firehose stream that's the destination for threat protection log export.

        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        def initialize(
          @stream_arn : String? = nil
        )
        end
      end

      # This exception is thrown when WAF doesn't allow your request based on a web ACL that's associated
      # with your user pool.

      struct ForbiddenException
        include JSON::Serializable

        # The message returned when WAF doesn't allow your request based on a web ACL that's associated with
        # your user pool.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the request to forget the device.

      struct ForgetDeviceRequest
        include JSON::Serializable

        # The unique identifier, or device key, of the device that the user wants to forget.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        def initialize(
          @device_key : String,
          @access_token : String? = nil
        )
        end
      end

      # Represents the request to reset a user's password.

      struct ForgotPasswordRequest
        include JSON::Serializable

        # The ID of the user pool app client associated with the current signed-in user.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the ForgotPassword API action, Amazon Cognito invokes any functions that are assigned
        # to the following triggers: pre sign-up , custom message , and user migration . When Amazon Cognito
        # invokes any of these functions, it passes a JSON payload, which the function receives as input. This
        # payload contains a clientMetadata attribute, which provides the data that you assigned to the
        # ClientMetadata parameter in your ForgotPassword request. In your function code in Lambda, you can
        # process the clientMetadata value to enhance your workflow for your specific needs. For more
        # information, see Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the
        # ClientMetadata parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata
        # value. This data is available only to Lambda triggers that are assigned to a user pool to support
        # custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata
        # parameter serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value.
        # Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool
        # client and username plus the client ID in the message. For more information about SecretHash , see
        # Computing secret hash values .

        @[JSON::Field(key: "SecretHash")]
        getter secret_hash : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @client_id : String,
          @username : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @secret_hash : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # The response from Amazon Cognito to a request to reset a password.

      struct ForgotPasswordResponse
        include JSON::Serializable

        # Information about the phone number or email address that Amazon Cognito sent the password-recovery
        # code to.

        @[JSON::Field(key: "CodeDeliveryDetails")]
        getter code_delivery_details : Types::CodeDeliveryDetailsType?

        def initialize(
          @code_delivery_details : Types::CodeDeliveryDetailsType? = nil
        )
        end
      end

      # Represents the request to get the header information of the CSV file for the user import job.

      struct GetCSVHeaderRequest
        include JSON::Serializable

        # The ID of the user pool that you want to import users into.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server to the request to get the header information of the CSV file
      # for the user import job.

      struct GetCSVHeaderResponse
        include JSON::Serializable

        # A comma-separated list of attributes from your user pool. Save this output to a .csv file and
        # populate it with the attributes of the users that you want to import.

        @[JSON::Field(key: "CSVHeader")]
        getter csv_header : Array(String)?

        # The ID of the requested user pool.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @csv_header : Array(String)? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # Represents the request to get the device.

      struct GetDeviceRequest
        include JSON::Serializable

        # The key of the device that you want to get information about.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        def initialize(
          @device_key : String,
          @access_token : String? = nil
        )
        end
      end

      # Gets the device response.

      struct GetDeviceResponse
        include JSON::Serializable

        # Details of the requested device. Includes device information, last-accessed and created dates, and
        # the device key.

        @[JSON::Field(key: "Device")]
        getter device : Types::DeviceType

        def initialize(
          @device : Types::DeviceType
        )
        end
      end


      struct GetGroupRequest
        include JSON::Serializable

        # The name of the group that you want to get information about.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool that contains the group that you want to query.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @group_name : String,
          @user_pool_id : String
        )
        end
      end


      struct GetGroupResponse
        include JSON::Serializable

        # A container for the requested group. Includes description, precedence, and IAM role values.

        @[JSON::Field(key: "Group")]
        getter group : Types::GroupType?

        def initialize(
          @group : Types::GroupType? = nil
        )
        end
      end


      struct GetIdentityProviderByIdentifierRequest
        include JSON::Serializable

        # The identifier that you assigned to your user pool. The identifier is an alternative name for an IdP
        # that is distinct from the IdP name. For example, an IdP with a name of MyIdP might have an
        # identifier of the email domain example.com .

        @[JSON::Field(key: "IdpIdentifier")]
        getter idp_identifier : String

        # The ID of the user pool where you want to get information about the IdP.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @idp_identifier : String,
          @user_pool_id : String
        )
        end
      end


      struct GetIdentityProviderByIdentifierResponse
        include JSON::Serializable

        # The configuration of the IdP in your user pool. Includes additional identifiers, the IdP name and
        # type, and trust-relationship details like the issuer URL.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProviderType

        def initialize(
          @identity_provider : Types::IdentityProviderType
        )
        end
      end


      struct GetLogDeliveryConfigurationRequest
        include JSON::Serializable

        # The ID of the user pool that has the logging configuration that you want to view.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end


      struct GetLogDeliveryConfigurationResponse
        include JSON::Serializable

        # The logging configuration of the requested user pool. Includes types of logs configured and their
        # destinations.

        @[JSON::Field(key: "LogDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfigurationType?

        def initialize(
          @log_delivery_configuration : Types::LogDeliveryConfigurationType? = nil
        )
        end
      end

      # Request to get a signing certificate from Amazon Cognito.

      struct GetSigningCertificateRequest
        include JSON::Serializable

        # The ID of the user pool where you want to view the signing certificate.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end

      # Response from Amazon Cognito for a signing certificate request.

      struct GetSigningCertificateResponse
        include JSON::Serializable

        # The x.509 certificate that signs SAML 2.0 authentication requests for your user pool.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        def initialize(
          @certificate : String? = nil
        )
        end
      end


      struct GetTokensFromRefreshTokenRequest
        include JSON::Serializable

        # The app client that issued the refresh token to the user who wants to request new tokens.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # A valid refresh token that can authorize the request for new tokens. When refresh token rotation is
        # active in the requested app client, this token is invalidated after the request is complete and
        # after an optional grace period.

        @[JSON::Field(key: "RefreshToken")]
        getter refresh_token : String

        # A map of custom key-value pairs that you can provide as input for certain custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the GetTokensFromRefreshToken API action, Amazon Cognito invokes the Lambda function
        # the pre token generation trigger. For more information, see Using Lambda triggers in the Amazon
        # Cognito Developer Guide . When you use the ClientMetadata parameter, note that Amazon Cognito won't
        # do the following: Store the ClientMetadata value. This data is available only to Lambda triggers
        # that are assigned to a user pool to support custom workflows. If your user pool configuration
        # doesn't include triggers, the ClientMetadata parameter serves no purpose. Validate the
        # ClientMetadata value. Encrypt the ClientMetadata value. Don't send sensitive information in this
        # parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # The client secret of the requested app client, if the client has a secret.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String?

        # When you enable device remembering, Amazon Cognito issues a device key that you can use for device
        # authentication that bypasses multi-factor authentication (MFA). To implement
        # GetTokensFromRefreshToken in a user pool with device remembering, you must capture the device key
        # from the initial authentication request. If your application doesn't provide the key of a registered
        # device, Amazon Cognito issues a new one. You must provide the confirmed device key in this request
        # if device remembering is enabled in your user pool. For more information about device remembering,
        # see Working with devices .

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String?

        def initialize(
          @client_id : String,
          @refresh_token : String,
          @client_metadata : Hash(String, String)? = nil,
          @client_secret : String? = nil,
          @device_key : String? = nil
        )
        end
      end


      struct GetTokensFromRefreshTokenResponse
        include JSON::Serializable


        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResultType?

        def initialize(
          @authentication_result : Types::AuthenticationResultType? = nil
        )
        end
      end


      struct GetUICustomizationRequest
        include JSON::Serializable

        # The ID of the user pool that you want to query for branding settings.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The ID of the app client that you want to query for branding settings.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        def initialize(
          @user_pool_id : String,
          @client_id : String? = nil
        )
        end
      end


      struct GetUICustomizationResponse
        include JSON::Serializable

        # Information about the classic hosted UI custom CSS and logo-image branding that you applied to the
        # user pool or app client.

        @[JSON::Field(key: "UICustomization")]
        getter ui_customization : Types::UICustomizationType

        def initialize(
          @ui_customization : Types::UICustomizationType
        )
        end
      end

      # Represents the request to get user attribute verification.

      struct GetUserAttributeVerificationCodeRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The name of the attribute that the user wants to verify, for example email .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the GetUserAttributeVerificationCode API action, Amazon Cognito invokes the function
        # that is assigned to the custom message trigger. When Amazon Cognito invokes this function, it passes
        # a JSON payload, which the function receives as input. This payload contains a clientMetadata
        # attribute, which provides the data that you assigned to the ClientMetadata parameter in your
        # GetUserAttributeVerificationCode request. In your function code in Lambda, you can process the
        # clientMetadata value to enhance your workflow for your specific needs. For more information, see
        # Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata
        # parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata value. This
        # data is available only to Lambda triggers that are assigned to a user pool to support custom
        # workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter
        # serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send
        # sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        def initialize(
          @access_token : String,
          @attribute_name : String,
          @client_metadata : Hash(String, String)? = nil
        )
        end
      end

      # The verification code response returned by the server response to get the user attribute
      # verification code.

      struct GetUserAttributeVerificationCodeResponse
        include JSON::Serializable

        # Information about the delivery destination of the user attribute verification code.

        @[JSON::Field(key: "CodeDeliveryDetails")]
        getter code_delivery_details : Types::CodeDeliveryDetailsType?

        def initialize(
          @code_delivery_details : Types::CodeDeliveryDetailsType? = nil
        )
        end
      end


      struct GetUserAuthFactorsRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end


      struct GetUserAuthFactorsResponse
        include JSON::Serializable

        # The name of the user who is eligible for the authentication factors in the response.

        @[JSON::Field(key: "Username")]
        getter username : String

        # The authentication types that are available to the user with USER_AUTH sign-in, for example
        # ["PASSWORD", "WEB_AUTHN"] .

        @[JSON::Field(key: "ConfiguredUserAuthFactors")]
        getter configured_user_auth_factors : Array(String)?

        # The challenge method that Amazon Cognito returns to the user in response to sign-in requests. Users
        # can prefer SMS message, email message, or TOTP MFA.

        @[JSON::Field(key: "PreferredMfaSetting")]
        getter preferred_mfa_setting : String?

        # The MFA options that are activated for the user. The possible values in this list are SMS_MFA ,
        # EMAIL_OTP , and SOFTWARE_TOKEN_MFA .

        @[JSON::Field(key: "UserMFASettingList")]
        getter user_mfa_setting_list : Array(String)?

        def initialize(
          @username : String,
          @configured_user_auth_factors : Array(String)? = nil,
          @preferred_mfa_setting : String? = nil,
          @user_mfa_setting_list : Array(String)? = nil
        )
        end
      end


      struct GetUserPoolMfaConfigRequest
        include JSON::Serializable

        # The ID of the user pool where you want to query WebAuthn and MFA configuration.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @user_pool_id : String
        )
        end
      end


      struct GetUserPoolMfaConfigResponse
        include JSON::Serializable

        # Shows configuration for user pool email message MFA and sign-in with one-time passwords (OTPs).
        # Includes the subject and body of the email message template for sign-in and MFA messages. To
        # activate this setting, your user pool must be in the Essentials tier or higher.

        @[JSON::Field(key: "EmailMfaConfiguration")]
        getter email_mfa_configuration : Types::EmailMfaConfigType?

        # Displays the state of multi-factor authentication (MFA) as on, off, or optional. When ON , all users
        # must set up MFA before they can sign in. When OPTIONAL , your application must make a client-side
        # determination of whether a user wants to register an MFA device. For user pools with adaptive
        # authentication with threat protection, choose OPTIONAL . When MfaConfiguration is OPTIONAL , managed
        # login doesn't automatically prompt users to set up MFA. Amazon Cognito generates MFA prompts in API
        # responses and in managed login for users who have chosen and configured a preferred MFA factor.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # Shows user pool configuration for SMS message MFA. Includes the message template and the SMS message
        # sending configuration for Amazon SNS.

        @[JSON::Field(key: "SmsMfaConfiguration")]
        getter sms_mfa_configuration : Types::SmsMfaConfigType?

        # Shows user pool configuration for time-based one-time password (TOTP) MFA. Includes TOTP enabled or
        # disabled state.

        @[JSON::Field(key: "SoftwareTokenMfaConfiguration")]
        getter software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType?

        # Shows user pool configuration for sign-in with passkey authenticators like biometric devices and
        # security keys. Passkeys are not eligible MFA factors. They are instead an eligible primary sign-in
        # factor for choice-based authentication , or the USER_AUTH flow.

        @[JSON::Field(key: "WebAuthnConfiguration")]
        getter web_authn_configuration : Types::WebAuthnConfigurationType?

        def initialize(
          @email_mfa_configuration : Types::EmailMfaConfigType? = nil,
          @mfa_configuration : String? = nil,
          @sms_mfa_configuration : Types::SmsMfaConfigType? = nil,
          @software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType? = nil,
          @web_authn_configuration : Types::WebAuthnConfigurationType? = nil
        )
        end
      end

      # Represents the request to get information about the user.

      struct GetUserRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end

      # Represents the response from the server from the request to get information about the user.

      struct GetUserResponse
        include JSON::Serializable

        # An array of name-value pairs representing user attributes. Custom attributes are prepended with the
        # custom: prefix.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)

        # The name of the user that you requested.

        @[JSON::Field(key: "Username")]
        getter username : String

        # This response parameter is no longer supported. It provides information only about SMS MFA
        # configurations. It doesn't provide information about time-based one-time password (TOTP) software
        # token MFA configurations. To look up information about either type of MFA configuration, use
        # UserMFASettingList instead.

        @[JSON::Field(key: "MFAOptions")]
        getter mfa_options : Array(Types::MFAOptionType)?

        # The user's preferred MFA. Users can prefer SMS message, email message, or TOTP MFA.

        @[JSON::Field(key: "PreferredMfaSetting")]
        getter preferred_mfa_setting : String?

        # The MFA options that are activated for the user. The possible values in this list are SMS_MFA ,
        # EMAIL_OTP , and SOFTWARE_TOKEN_MFA .

        @[JSON::Field(key: "UserMFASettingList")]
        getter user_mfa_setting_list : Array(String)?

        def initialize(
          @user_attributes : Array(Types::AttributeType),
          @username : String,
          @mfa_options : Array(Types::MFAOptionType)? = nil,
          @preferred_mfa_setting : String? = nil,
          @user_mfa_setting_list : Array(String)? = nil
        )
        end
      end

      # Represents the request to sign out all devices.

      struct GlobalSignOutRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end

      # The response to the request to sign out all devices.

      struct GlobalSignOutResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when Amazon Cognito encounters a group that already exists in the user
      # pool.

      struct GroupExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A user pool group. Contains details about the group and the way that it contributes to IAM role
      # decisions with identity pools. Identity pools can make decisions about the IAM role to assign based
      # on groups: users get credentials for the role associated with their highest-priority group.

      struct GroupType
        include JSON::Serializable

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A friendly description of the group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # A non-negative integer value that specifies the precedence of this group relative to the other
        # groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with
        # lower Precedence values take precedence over groups with higher ornull Precedence values. If a user
        # belongs to two or more groups, it is the group with the lowest precedence value whose role ARN is
        # given in the user's tokens for the cognito:roles and cognito:preferred_role claims. Two groups can
        # have the same Precedence value. If this happens, neither group takes precedence over the other. If
        # two groups with the same Precedence have the same role ARN, that role is used in the
        # cognito:preferred_role claim in tokens for users in each group. If the two groups have different
        # role ARNs, the cognito:preferred_role claim isn't set in users' tokens. The default Precedence value
        # is null .

        @[JSON::Field(key: "Precedence")]
        getter precedence : Int32?

        # The ARN of the IAM role associated with the group. If a group has the highest priority of a user's
        # groups, users who authenticate with an identity pool get credentials for the RoleArn that's
        # associated with the group.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The ID of the user pool that contains the group.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @creation_date : Time? = nil,
          @description : String? = nil,
          @group_name : String? = nil,
          @last_modified_date : Time? = nil,
          @precedence : Int32? = nil,
          @role_arn : String? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # The HTTP header in the ContextData parameter.

      struct HttpHeader
        include JSON::Serializable

        # The header name.

        @[JSON::Field(key: "headerName")]
        getter header_name : String?

        # The header value.

        @[JSON::Field(key: "headerValue")]
        getter header_value : String?

        def initialize(
          @header_name : String? = nil,
          @header_value : String? = nil
        )
        end
      end

      # A user pool identity provider (IdP). Contains information about a third-party IdP to a user pool,
      # the attributes that it populates to user profiles, and the trust relationship between the IdP and
      # your user pool.

      struct IdentityProviderType
        include JSON::Serializable

        # A mapping of IdP attributes to standard and custom user pool attributes.

        @[JSON::Field(key: "AttributeMapping")]
        getter attribute_mapping : Hash(String, String)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A list of IdP identifiers. IdP identifiers are strings that represent friendly names or domain names
        # of IdPs, for example MyIdP or auth.example.com . You can choose to route user authorization requests
        # to the right IdP with either IdP identifiers or IdP names. For more information, see
        # identity_provider and idp_identifier at Authorize endpoint .

        @[JSON::Field(key: "IdpIdentifiers")]
        getter idp_identifiers : Array(String)?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The scopes, URLs, and identifiers for your external identity provider. The following examples
        # describe the provider detail keys for each IdP type. These values and their schema are subject to
        # change. Social IdP authorize_scopes values must match the values listed here. OpenID Connect (OIDC)
        # Amazon Cognito accepts the following elements when it can't discover endpoint URLs from oidc_issuer
        # : attributes_url , authorize_url , jwks_uri , token_url . Create or update request:
        # "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url":
        # "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json",
        # "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" } Describe
        # response: "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes":
        # "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id":
        # "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri":
        # "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com",
        # "token_url": "https://example.com/token" } SAML Create or update request with Metadata URL:
        # "ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256"
        # } Create or update request with Metadata file: "ProviderDetails": { "IDPInit": "true", "IDPSignout":
        # "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm":
        # "rsa-sha256" } The value of MetadataFile must be the plaintext metadata document with all quote (")
        # characters escaped by backslashes. Describe response: "ProviderDetails": { "IDPInit": "true",
        # "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm":
        # "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI":
        # "https://auth.example.com/sso/saml" } LoginWithAmazon Create or update request: "ProviderDetails": {
        # "authorize_scopes": "profile postal_code", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"
        # Describe response: "ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile",
        # "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code",
        # "authorize_url": "https://www.amazon.com/ap/oa", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret",
        # "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" } Google Create
        # or update request: "ProviderDetails": { "authorize_scopes": "email profile openid", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }
        # Describe response: "ProviderDetails": { "attributes_url":
        # "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true",
        # "authorize_scopes": "email profile openid", "authorize_url":
        # "https://accounts.google.com/o/oauth2/v2/auth", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret",
        # "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url":
        # "https://www.googleapis.com/oauth2/v4/token" } SignInWithApple Create or update request:
        # "ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito",
        # "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" } Describe response:
        # "ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name",
        # "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito",
        # "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE",
        # "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" } Facebook
        # Create or update request: "ProviderDetails": { "api_version": "v17.0", "authorize_scopes":
        # "public_profile, email", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret" } Describe response: "ProviderDetails": { "api_version": "v17.0",
        # "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes":
        # "true", "authorize_scopes": "public_profile, email", "authorize_url":
        # "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "token_request_method": "GET", "token_url":
        # "https://graph.facebook.com/v17.0/oauth/access_token" }

        @[JSON::Field(key: "ProviderDetails")]
        getter provider_details : Hash(String, String)?

        # A friendly name for the IdP.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        # The type of IdP. Either SAML, OIDC, or a named social identity provider.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The ID of the user pool associated with the IdP.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @attribute_mapping : Hash(String, String)? = nil,
          @creation_date : Time? = nil,
          @idp_identifiers : Array(String)? = nil,
          @last_modified_date : Time? = nil,
          @provider_details : Hash(String, String)? = nil,
          @provider_name : String? = nil,
          @provider_type : String? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # Initiates the authentication request.

      struct InitiateAuthRequest
        include JSON::Serializable

        # The authentication flow that you want to initiate. Each AuthFlow has linked AuthParameters that you
        # must submit. The following are some example flows. USER_AUTH The entry point for choice-based
        # authentication with passwords, one-time passwords, and WebAuthn authenticators. Request a preferred
        # authentication type or review available authentication types. From the offered authentication types,
        # select one in a challenge response and then authenticate with that method in an additional challenge
        # response. To activate this setting, your user pool must be in the Essentials tier or higher.
        # USER_SRP_AUTH Username-password authentication with the Secure Remote Password (SRP) protocol. For
        # more information, see Use SRP password verification in custom authentication flow .
        # REFRESH_TOKEN_AUTH and REFRESH_TOKEN Receive new ID and access tokens when you pass a REFRESH_TOKEN
        # parameter with a valid refresh token as the value. For more information, see Using the refresh token
        # . CUSTOM_AUTH Custom authentication with Lambda triggers. For more information, see Custom
        # authentication challenge Lambda triggers . USER_PASSWORD_AUTH Client-side username-password
        # authentication with the password sent directly in the request. For more information about
        # client-side and server-side authentication, see SDK authorization models . ADMIN_USER_PASSWORD_AUTH
        # is a flow type of AdminInitiateAuth and isn't valid for InitiateAuth. ADMIN_NO_SRP_AUTH is a legacy
        # server-side username-password flow and isn't valid for InitiateAuth.

        @[JSON::Field(key: "AuthFlow")]
        getter auth_flow : String

        # The ID of the app client that your user wants to sign in to.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # The authentication parameters. These are inputs corresponding to the AuthFlow that you're invoking.
        # The following are some authentication flows and their parameters. Add a SECRET_HASH parameter if
        # your app client has a client secret. Add DEVICE_KEY if you want to bypass multi-factor
        # authentication with a remembered device. USER_AUTH USERNAME (required) PREFERRED_CHALLENGE . If you
        # don't provide a value for PREFERRED_CHALLENGE , Amazon Cognito responds with the AvailableChallenges
        # parameter that specifies the available sign-in methods. USER_SRP_AUTH USERNAME (required) SRP_A
        # (required) USER_PASSWORD_AUTH USERNAME (required) PASSWORD (required)
        # REFRESH_TOKEN_AUTH/REFRESH_TOKEN REFRESH_TOKEN (required) CUSTOM_AUTH USERNAME (required)
        # ChallengeName: SRP_A (when doing SRP authentication before custom challenges) SRP_A: (An SRP_A
        # value) (when doing SRP authentication before custom challenges) For more information about
        # SECRET_HASH , see Computing secret hash values . For information about DEVICE_KEY , see Working with
        # user devices in your user pool .

        @[JSON::Field(key: "AuthParameters")]
        getter auth_parameters : Hash(String, String)?

        # A map of custom key-value pairs that you can provide as input for certain custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you send an InitiateAuth request, Amazon Cognito invokes the Lambda functions that are
        # specified for various triggers. The ClientMetadata value is passed as input to the functions for
        # only the following triggers. Pre sign-up Pre authentication User migration When Amazon Cognito
        # invokes the functions for these triggers, it passes a JSON payload as input to the function. This
        # payload contains a validationData attribute with the data that you assigned to the ClientMetadata
        # parameter in your InitiateAuth request. In your function, validationData can contribute to
        # operations that require data that isn't in the default payload. InitiateAuth requests invokes the
        # following triggers without ClientMetadata as input. Post authentication Custom message Pre token
        # generation Create auth challenge Define auth challenge Custom email sender Custom SMS sender For
        # more information, see Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the
        # ClientMetadata parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata
        # value. This data is available only to Lambda triggers that are assigned to a user pool to support
        # custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata
        # parameter serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value.
        # Don't send sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # The optional session ID from a ConfirmSignUp API request. You can sign in a user directly from the
        # sign-up process with the USER_AUTH authentication flow. When you pass the session ID to InitiateAuth
        # , Amazon Cognito assumes the SMS or email message one-time verification password from ConfirmSignUp
        # as the primary authentication factor. You're not required to submit this code a second time. This
        # option is only valid for users who have confirmed their sign-up and are signing in for the first
        # time within the authentication flow session duration of the session ID.

        @[JSON::Field(key: "Session")]
        getter session : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @auth_flow : String,
          @client_id : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @auth_parameters : Hash(String, String)? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @session : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # Initiates the authentication response.

      struct InitiateAuthResponse
        include JSON::Serializable

        # The result of a successful and complete authentication request. This result is only returned if the
        # user doesn't need to pass another challenge. If they must pass another challenge before they get
        # tokens, Amazon Cognito returns a challenge in ChallengeName , ChallengeParameters , and Session
        # response parameters.

        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResultType?

        # This response parameter lists the available authentication challenges that users can select from in
        # choice-based authentication . For example, they might be able to choose between passkey
        # authentication, a one-time password from an SMS message, and a traditional password.

        @[JSON::Field(key: "AvailableChallenges")]
        getter available_challenges : Array(String)?

        # The name of an additional authentication challenge that you must respond to. Possible challenges
        # include the following: All of the following challenges require USERNAME and, when the app client has
        # a client secret, SECRET_HASH in the parameters. Include a DEVICE_KEY for device authentication.
        # WEB_AUTHN : Respond to the challenge with the results of a successful authentication with a WebAuthn
        # authenticator, or passkey, as CREDENTIAL . Examples of WebAuthn authenticators include biometric
        # devices and security keys. PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP :
        # Respond with the initial SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection
        # as ANSWER . It must be one of the challenge types in the AvailableChallenges response parameter. Add
        # the parameters of the selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with
        # the code that your user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with
        # the code that your user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond
        # with the code that your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP :
        # Respond with the code that your user pool delivered in an SMS message, as SMS_OTP_CODE .
        # PASSWORD_VERIFIER : Respond with the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE ,
        # PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom
        # authentication flow determines that the user should pass another challenge before tokens are issued.
        # The parameters of the challenge are determined by your Lambda function and issued in the
        # ChallengeParameters of a challenge response. DEVICE_SRP_AUTH : Respond with the initial parameters
        # of device SRP authentication. For more information, see Signing in with a device .
        # DEVICE_PASSWORD_VERIFIER : Respond with PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP after client-side SRP calculations. For more information, see Signing in with a device .
        # NEW_PASSWORD_REQUIRED : For users who are required to change their passwords after successful first
        # login. Respond to this challenge with NEW_PASSWORD and any required attributes that Amazon Cognito
        # returned in the requiredAttributes parameter. You can also set values for attributes that aren't
        # required by your user pool and that your app client can write. Amazon Cognito only returns this
        # challenge for users who have temporary passwords. When you create passwordless users, you must
        # provide values for all required attributes. In a NEW_PASSWORD_REQUIRED challenge response, you can't
        # modify a required attribute that already has a value. In AdminRespondToAuthChallenge or
        # RespondToAuthChallenge , set a value for any keys that Amazon Cognito returned in the
        # requiredAttributes parameter, then use the AdminUpdateUserAttributes or UpdateUserAttributes API
        # operation to modify the value of any additional attributes. MFA_SETUP : For users who are required
        # to setup an MFA factor before they can sign in. The MFA types activated for the user pool will be
        # listed in the challenge parameters MFAS_CAN_SETUP value. To set up time-based one-time password
        # (TOTP) MFA, use the session returned in this challenge from InitiateAuth or AdminInitiateAuth as an
        # input to AssociateSoftwareToken . Then, use the session returned by VerifySoftwareToken as an input
        # to RespondToAuthChallenge or AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete
        # sign-in. To set up SMS or email MFA, collect a phone_number or email attribute for the user. Then
        # restart the authentication flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String?

        # The required parameters of the ChallengeName challenge. All challenges require USERNAME . They also
        # require SECRET_HASH if your app client has a client secret.

        @[JSON::Field(key: "ChallengeParameters")]
        getter challenge_parameters : Hash(String, String)?

        # The session identifier that links a challenge response to the initial authentication request. If the
        # user must pass another challenge, Amazon Cognito returns a session ID and challenge parameters.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @authentication_result : Types::AuthenticationResultType? = nil,
          @available_challenges : Array(String)? = nil,
          @challenge_name : String? = nil,
          @challenge_parameters : Hash(String, String)? = nil,
          @session : String? = nil
        )
        end
      end

      # This exception is thrown when Amazon Cognito encounters an internal error.

      struct InternalErrorException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws an internal error exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when Amazon Cognito isn't allowed to use your email identity. HTTP status
      # code: 400.

      struct InvalidEmailRoleAccessPolicyException
        include JSON::Serializable

        # The message returned when you have an unverified email address or the identity policy isn't set on
        # an email address that Amazon Cognito can access.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when Amazon Cognito encounters an invalid Lambda response.

      struct InvalidLambdaResponseException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws an invalid Lambda response exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the specified OAuth flow is not valid.

      struct InvalidOAuthFlowException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the Amazon Cognito service encounters an invalid parameter.

      struct InvalidParameterException
        include JSON::Serializable

        # The message returned when the Amazon Cognito service throws an invalid parameter exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason code of the exception.

        @[JSON::Field(key: "reasonCode")]
        getter reason_code : String?

        def initialize(
          @message : String? = nil,
          @reason_code : String? = nil
        )
        end
      end

      # This exception is thrown when Amazon Cognito encounters an invalid password.

      struct InvalidPasswordException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws an invalid user password exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is returned when the role provided for SMS configuration doesn't have permission to
      # publish using Amazon SNS.

      struct InvalidSmsRoleAccessPolicyException
        include JSON::Serializable

        # The message returned when the invalid SMS role access policy exception is thrown.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the trust relationship is not valid for the role provided for SMS
      # configuration. This can happen if you don't trust cognito-idp.amazonaws.com or the external ID
      # provided in the role does not match what is provided in the SMS configuration for the user pool.

      struct InvalidSmsRoleTrustRelationshipException
        include JSON::Serializable

        # The message returned when the role trust relationship for the SMS message is not valid.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the user pool configuration is not valid.

      struct InvalidUserPoolConfigurationException
        include JSON::Serializable

        # The message returned when the user pool configuration is not valid.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible
      # stages of user pool operations. Triggers can modify the outcome of the operations that invoked them.

      struct LambdaConfigType
        include JSON::Serializable

        # The configuration of a create auth challenge Lambda trigger, one of three triggers in the sequence
        # of the custom authentication challenge triggers .

        @[JSON::Field(key: "CreateAuthChallenge")]
        getter create_auth_challenge : String?

        # The configuration of a custom email sender Lambda trigger. This trigger routes all email
        # notifications from a user pool to a Lambda function that delivers the message using custom logic.

        @[JSON::Field(key: "CustomEmailSender")]
        getter custom_email_sender : Types::CustomEmailLambdaVersionConfigType?

        # A custom message Lambda trigger. This trigger is an opportunity to customize all SMS and email
        # messages from your user pool. When a custom message trigger is active, your user pool routes all
        # messages to a Lambda function that returns a runtime-customized message subject and body for your
        # user pool to deliver to a user.

        @[JSON::Field(key: "CustomMessage")]
        getter custom_message : String?

        # The configuration of a custom SMS sender Lambda trigger. This trigger routes all SMS notifications
        # from a user pool to a Lambda function that delivers the message using custom logic.

        @[JSON::Field(key: "CustomSMSSender")]
        getter custom_sms_sender : Types::CustomSMSLambdaVersionConfigType?

        # The configuration of a define auth challenge Lambda trigger, one of three triggers in the sequence
        # of the custom authentication challenge triggers .

        @[JSON::Field(key: "DefineAuthChallenge")]
        getter define_auth_challenge : String?

        # The ARN of an KMS key . Amazon Cognito uses the key to encrypt codes and temporary passwords sent to
        # custom sender Lambda triggers.

        @[JSON::Field(key: "KMSKeyID")]
        getter kms_key_id : String?

        # The configuration of a post authentication Lambda trigger in a user pool. This trigger can take
        # custom actions after a user signs in.

        @[JSON::Field(key: "PostAuthentication")]
        getter post_authentication : String?

        # The configuration of a post confirmation Lambda trigger in a user pool. This trigger can take custom
        # actions after a user confirms their user account and their email address or phone number.

        @[JSON::Field(key: "PostConfirmation")]
        getter post_confirmation : String?

        # The configuration of a pre authentication trigger in a user pool. This trigger can evaluate and
        # modify user sign-in events.

        @[JSON::Field(key: "PreAuthentication")]
        getter pre_authentication : String?

        # The configuration of a pre sign-up Lambda trigger in a user pool. This trigger evaluates new users
        # and can bypass confirmation, link a federated user profile , or block sign-up requests.

        @[JSON::Field(key: "PreSignUp")]
        getter pre_sign_up : String?

        # The legacy configuration of a pre token generation Lambda trigger in a user pool. Set this parameter
        # for legacy purposes. If you also set an ARN in PreTokenGenerationConfig , its value must be
        # identical to PreTokenGeneration . For new instances of pre token generation triggers, set the
        # LambdaArn of PreTokenGenerationConfig .

        @[JSON::Field(key: "PreTokenGeneration")]
        getter pre_token_generation : String?

        # The detailed configuration of a pre token generation Lambda trigger in a user pool. If you also set
        # an ARN in PreTokenGeneration , its value must be identical to PreTokenGenerationConfig .

        @[JSON::Field(key: "PreTokenGenerationConfig")]
        getter pre_token_generation_config : Types::PreTokenGenerationVersionConfigType?

        # The configuration of a migrate user Lambda trigger in a user pool. This trigger can create user
        # profiles when users sign in or attempt to reset their password with credentials that don't exist
        # yet.

        @[JSON::Field(key: "UserMigration")]
        getter user_migration : String?

        # The configuration of a verify auth challenge Lambda trigger, one of three triggers in the sequence
        # of the custom authentication challenge triggers .

        @[JSON::Field(key: "VerifyAuthChallengeResponse")]
        getter verify_auth_challenge_response : String?

        def initialize(
          @create_auth_challenge : String? = nil,
          @custom_email_sender : Types::CustomEmailLambdaVersionConfigType? = nil,
          @custom_message : String? = nil,
          @custom_sms_sender : Types::CustomSMSLambdaVersionConfigType? = nil,
          @define_auth_challenge : String? = nil,
          @kms_key_id : String? = nil,
          @post_authentication : String? = nil,
          @post_confirmation : String? = nil,
          @pre_authentication : String? = nil,
          @pre_sign_up : String? = nil,
          @pre_token_generation : String? = nil,
          @pre_token_generation_config : Types::PreTokenGenerationVersionConfigType? = nil,
          @user_migration : String? = nil,
          @verify_auth_challenge_response : String? = nil
        )
        end
      end

      # This exception is thrown when a user exceeds the limit for a requested Amazon Web Services resource.

      struct LimitExceededException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws a limit exceeded exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the request to list the devices.

      struct ListDevicesRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The maximum number of devices that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @access_token : String,
          @limit : Int32? = nil,
          @pagination_token : String? = nil
        )
        end
      end

      # Represents the response to list devices.

      struct ListDevicesResponse
        include JSON::Serializable

        # An array of devices and their details. Each entry that's returned includes device information,
        # last-accessed and created dates, and the device key.

        @[JSON::Field(key: "Devices")]
        getter devices : Array(Types::DeviceType)?

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @devices : Array(Types::DeviceType)? = nil,
          @pagination_token : String? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable

        # The ID of the user pool where you want to list user groups.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of groups that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsResponse
        include JSON::Serializable

        # An array of groups and their details. Each entry that's returned includes description, precedence,
        # and IAM role values.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupType)?

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityProvidersRequest
        include JSON::Serializable

        # The ID of the user pool where you want to list IdPs.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of IdPs that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityProvidersResponse
        include JSON::Serializable

        # An array of the IdPs in your user pool. For each, the response includes identifiers, the IdP name
        # and type, and trust-relationship details like the issuer URL.

        @[JSON::Field(key: "Providers")]
        getter providers : Array(Types::ProviderDescription)

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @providers : Array(Types::ProviderDescription),
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceServersRequest
        include JSON::Serializable

        # The ID of the user pool where you want to list resource servers.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of resource servers that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceServersResponse
        include JSON::Serializable

        # An array of resource servers and the details of their configuration. For each, the response includes
        # names, identifiers, and custom scopes.

        @[JSON::Field(key: "ResourceServers")]
        getter resource_servers : Array(Types::ResourceServerType)

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_servers : Array(Types::ResourceServerType),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags that are assigned to the user pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTermsRequest
        include JSON::Serializable

        # The ID of the user pool where you want to list terms documents.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of terms documents that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTermsResponse
        include JSON::Serializable

        # A summary of the requested terms documents. Includes unique identifiers for later changes to the
        # terms documents.

        @[JSON::Field(key: "Terms")]
        getter terms : Array(Types::TermsDescriptionType)

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @terms : Array(Types::TermsDescriptionType),
          @next_token : String? = nil
        )
        end
      end

      # Represents the request to list the user import jobs.

      struct ListUserImportJobsRequest
        include JSON::Serializable

        # The maximum number of import jobs that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # The ID of the user pool where you want to list import jobs.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @max_results : Int32,
          @user_pool_id : String,
          @pagination_token : String? = nil
        )
        end
      end

      # Represents the response from the server to the request to list the user import jobs.

      struct ListUserImportJobsResponse
        include JSON::Serializable

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # An array of user import jobs from the requested user pool. For each, the response includes logging
        # destination, status, and the Amazon S3 pre-signed URL for CSV upload.

        @[JSON::Field(key: "UserImportJobs")]
        getter user_import_jobs : Array(Types::UserImportJobType)?

        def initialize(
          @pagination_token : String? = nil,
          @user_import_jobs : Array(Types::UserImportJobType)? = nil
        )
        end
      end

      # Represents the request to list the user pool clients.

      struct ListUserPoolClientsRequest
        include JSON::Serializable

        # The ID of the user pool where you want to list user pool clients.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of app clients that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @user_pool_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the response from the server that lists user pool clients.

      struct ListUserPoolClientsResponse
        include JSON::Serializable

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of app clients and their details. Includes app client ID and name.

        @[JSON::Field(key: "UserPoolClients")]
        getter user_pool_clients : Array(Types::UserPoolClientDescription)?

        def initialize(
          @next_token : String? = nil,
          @user_pool_clients : Array(Types::UserPoolClientDescription)? = nil
        )
        end
      end

      # Represents the request to list user pools.

      struct ListUserPoolsRequest
        include JSON::Serializable

        # The maximum number of user pools that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @next_token : String? = nil
        )
        end
      end

      # Represents the response to list user pools.

      struct ListUserPoolsResponse
        include JSON::Serializable

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of user pools and their configuration details.

        @[JSON::Field(key: "UserPools")]
        getter user_pools : Array(Types::UserPoolDescriptionType)?

        def initialize(
          @next_token : String? = nil,
          @user_pools : Array(Types::UserPoolDescriptionType)? = nil
        )
        end
      end


      struct ListUsersInGroupRequest
        include JSON::Serializable

        # The name of the group that you want to query for user membership.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool where you want to view the membership of the requested group.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The maximum number of groups that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_name : String,
          @user_pool_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUsersInGroupResponse
        include JSON::Serializable

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of users who are members in the group, and their attributes.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::UserType)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::UserType)? = nil
        )
        end
      end

      # Represents the request to list users.

      struct ListUsersRequest
        include JSON::Serializable

        # The ID of the user pool where you want to display or search for users.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A JSON array of user attribute names, for example given_name , that you want Amazon Cognito to
        # include in the response for each user. When you don't provide an AttributesToGet parameter, Amazon
        # Cognito returns all attributes for each user. Use AttributesToGet with required attributes in your
        # user pool, or in conjunction with Filter . Amazon Cognito returns an error if not all users in the
        # results have set a value for the attribute you request. Attributes that you can't filter on,
        # including custom attributes, must have a value set in every user profile before an AttributesToGet
        # parameter returns results.

        @[JSON::Field(key: "AttributesToGet")]
        getter attributes_to_get : Array(String)?

        # A filter string of the form "AttributeName Filter-Type "AttributeValue" . Quotation marks within the
        # filter string must be escaped using the backslash ( \ ) character. For example, "family_name =
        # \"Reddy\"" . AttributeName : The name of the attribute to search for. You can only search for one
        # attribute at a time. Filter-Type : For an exact match, use = , for example, " given_name = \"Jon\"
        # ". For a prefix ("starts with") match, use ^= , for example, " given_name ^= \"Jon\" ".
        # AttributeValue : The attribute value that must be matched for each user. If the filter string is
        # empty, ListUsers returns all users in the user pool. You can only search for the following standard
        # attributes: username (case-sensitive) email phone_number name given_name family_name
        # preferred_username cognito:user_status (called Status in the Console) (case-insensitive) status
        # (called Enabled in the Console) (case-sensitive) sub Custom attributes aren't searchable. You can
        # also list users with a client-side filter. The server-side filter matches no more than one
        # attribute. For an advanced search, use a client-side filter with the --query parameter of the
        # list-users action in the CLI. When you use a client-side filter, ListUsers returns a paginated list
        # of zero or more users. You can receive multiple pages in a row with zero results. Repeat the query
        # with each pagination token that is returned until you receive a null pagination token value, and
        # then review the combined result. For more information about server-side and client-side filtering,
        # see FilteringCLI output in the Command Line Interface User Guide . For more information, see
        # Searching for Users Using the ListUsers API and Examples of Using the ListUsers API in the Amazon
        # Cognito Developer Guide .

        @[JSON::Field(key: "Filter")]
        getter filter : String?

        # The maximum number of users that you want Amazon Cognito to return in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @user_pool_id : String,
          @attributes_to_get : Array(String)? = nil,
          @filter : String? = nil,
          @limit : Int32? = nil,
          @pagination_token : String? = nil
        )
        end
      end

      # The response from the request to list users.

      struct ListUsersResponse
        include JSON::Serializable

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # An array of user pool users who match your query, and their attributes.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::UserType)?

        def initialize(
          @pagination_token : String? = nil,
          @users : Array(Types::UserType)? = nil
        )
        end
      end


      struct ListWebAuthnCredentialsRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The maximum number of the user's passkey credentials that you want to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This API operation returns a limited number of results. The pagination token is an identifier that
        # you can present in an additional API request with the same parameters. When you include the
        # pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent
        # requests return a new pagination token. By use of this token, you can paginate through the full list
        # of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_token : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWebAuthnCredentialsResponse
        include JSON::Serializable

        # A list of registered passkeys for a user.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Array(Types::WebAuthnCredentialDescription)

        # The identifier that Amazon Cognito returned with the previous request to this operation. When you
        # include a pagination token in your request, Amazon Cognito returns the next set of items in the
        # list. By use of this token, you can paginate through the full list of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @credentials : Array(Types::WebAuthnCredentialDescription),
          @next_token : String? = nil
        )
        end
      end

      # The configuration of user event logs to an external Amazon Web Services service like Amazon Data
      # Firehose, Amazon S3, or Amazon CloudWatch Logs.

      struct LogConfigurationType
        include JSON::Serializable

        # The source of events that your user pool sends for logging. To send error-level logs about user
        # notification activity, set to userNotification . To send info-level logs about threat-protection
        # user activity in user pools with the Plus feature plan, set to userAuthEvents .

        @[JSON::Field(key: "EventSource")]
        getter event_source : String

        # The errorlevel selection of logs that a user pool sends for detailed activity logging. To send
        # userNotification activity with information about message delivery , choose ERROR with
        # CloudWatchLogsConfiguration . To send userAuthEvents activity with user logs from threat protection
        # with the Plus feature plan, choose INFO with one of CloudWatchLogsConfiguration ,
        # FirehoseConfiguration , or S3Configuration .

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        # The CloudWatch log group destination of user pool detailed activity logs, or of user activity log
        # export with threat protection.

        @[JSON::Field(key: "CloudWatchLogsConfiguration")]
        getter cloud_watch_logs_configuration : Types::CloudWatchLogsConfigurationType?

        # The Amazon Data Firehose stream destination of user activity log export with threat protection. To
        # activate this setting, your user pool must be on the Plus tier .

        @[JSON::Field(key: "FirehoseConfiguration")]
        getter firehose_configuration : Types::FirehoseConfigurationType?

        # The Amazon S3 bucket destination of user activity log export with threat protection. To activate
        # this setting, your user pool must be on the Plus tier .

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3ConfigurationType?

        def initialize(
          @event_source : String,
          @log_level : String,
          @cloud_watch_logs_configuration : Types::CloudWatchLogsConfigurationType? = nil,
          @firehose_configuration : Types::FirehoseConfigurationType? = nil,
          @s3_configuration : Types::S3ConfigurationType? = nil
        )
        end
      end

      # The logging parameters of a user pool, as returned in the response to a GetLogDeliveryConfiguration
      # request.

      struct LogDeliveryConfigurationType
        include JSON::Serializable

        # A logging destination of a user pool. User pools can have multiple logging destinations for
        # message-delivery and user-activity logs.

        @[JSON::Field(key: "LogConfigurations")]
        getter log_configurations : Array(Types::LogConfigurationType)

        # The ID of the user pool where you configured logging.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @log_configurations : Array(Types::LogConfigurationType),
          @user_pool_id : String
        )
        end
      end

      # This exception is thrown when Amazon Cognito can't find a multi-factor authentication (MFA) method.

      struct MFAMethodNotFoundException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws an MFA method not found exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This data type is no longer supported. Applies only to SMS multi-factor authentication (MFA)
      # configurations. Does not apply to time-based one-time password (TOTP) software token MFA
      # configurations.

      struct MFAOptionType
        include JSON::Serializable

        # The attribute name of the MFA option type. The only valid value is phone_number .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The delivery medium to send the MFA code. You can use this parameter to set only the SMS delivery
        # medium value.

        @[JSON::Field(key: "DeliveryMedium")]
        getter delivery_medium : String?

        def initialize(
          @attribute_name : String? = nil,
          @delivery_medium : String? = nil
        )
        end
      end

      # This exception is thrown when you attempt to apply a managed login branding style to an app client
      # that already has an assigned style.

      struct ManagedLoginBrandingExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A managed login branding style that's assigned to a user pool app client.

      struct ManagedLoginBrandingType
        include JSON::Serializable

        # An array of image files that you want to apply to roles like backgrounds, logos, and icons. Each
        # object must also indicate whether it is for dark mode, light mode, or browser-adaptive mode.

        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::AssetType)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The ID of the managed login branding style.

        @[JSON::Field(key: "ManagedLoginBrandingId")]
        getter managed_login_branding_id : String?

        # A JSON file, encoded as a Document type, with the the settings that you want to apply to your style.
        # The following components are not currently implemented and reserved for future use: signUp
        # instructions sessionTimerDisplay languageSelector (for localization, see Managed login localization)

        @[JSON::Field(key: "Settings")]
        getter settings : Types::Document?

        # When true, applies the default branding style options. This option reverts to default style options
        # that are managed by Amazon Cognito. You can modify them later in the branding editor. When you
        # specify true for this option, you must also omit values for Settings and Assets in the request.

        @[JSON::Field(key: "UseCognitoProvidedValues")]
        getter use_cognito_provided_values : Bool?

        # The user pool where the branding style is assigned.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @assets : Array(Types::AssetType)? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @managed_login_branding_id : String? = nil,
          @settings : Types::Document? = nil,
          @use_cognito_provided_values : Bool? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # The message template structure.

      struct MessageTemplateType
        include JSON::Serializable

        # The message template for email messages. EmailMessage is allowed only if EmailSendingAccount is
        # DEVELOPER.

        @[JSON::Field(key: "EmailMessage")]
        getter email_message : String?

        # The subject line for email messages. EmailSubject is allowed only if EmailSendingAccount is
        # DEVELOPER.

        @[JSON::Field(key: "EmailSubject")]
        getter email_subject : String?

        # The message template for SMS messages.

        @[JSON::Field(key: "SMSMessage")]
        getter sms_message : String?

        def initialize(
          @email_message : String? = nil,
          @email_subject : String? = nil,
          @sms_message : String? = nil
        )
        end
      end

      # Information that your user pool responds with in AuthenticationResult when you configure it to
      # remember devices and a user signs in with an unrecognized device. Amazon Cognito presents a new
      # device key that you can use to set up device authentication in a "Remember me on this device"
      # authentication model.

      struct NewDeviceMetadataType
        include JSON::Serializable

        # The device group key, an identifier used in generating the DEVICE_PASSWORD_VERIFIER for device SRP
        # authentication.

        @[JSON::Field(key: "DeviceGroupKey")]
        getter device_group_key : String?

        # The device key, an identifier used in generating the DEVICE_PASSWORD_VERIFIER for device SRP
        # authentication.

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String?

        def initialize(
          @device_group_key : String? = nil,
          @device_key : String? = nil
        )
        end
      end

      # This exception is thrown when a user isn't authorized.

      struct NotAuthorizedException
        include JSON::Serializable

        # The message returned when the Amazon Cognito service returns a not authorized exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for Amazon SES email messages that threat protection sends to a user when your
      # adaptive authentication automated response has a Notify action.

      struct NotifyConfigurationType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the identity that is associated with the sending authorization
        # policy. This identity permits Amazon Cognito to send for the email address specified in the From
        # parameter.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The template for the email message that your user pool sends when a detected risk event is blocked.

        @[JSON::Field(key: "BlockEmail")]
        getter block_email : Types::NotifyEmailType?

        # The email address that sends the email message. The address must be either individually verified
        # with Amazon Simple Email Service, or from a domain that has been verified with Amazon SES.

        @[JSON::Field(key: "From")]
        getter from : String?

        # The template for the email message that your user pool sends when MFA is challenged in response to a
        # detected risk.

        @[JSON::Field(key: "MfaEmail")]
        getter mfa_email : Types::NotifyEmailType?

        # The template for the email message that your user pool sends when no action is taken in response to
        # a detected risk.

        @[JSON::Field(key: "NoActionEmail")]
        getter no_action_email : Types::NotifyEmailType?

        # The reply-to email address of an email template.

        @[JSON::Field(key: "ReplyTo")]
        getter reply_to : String?

        def initialize(
          @source_arn : String,
          @block_email : Types::NotifyEmailType? = nil,
          @from : String? = nil,
          @mfa_email : Types::NotifyEmailType? = nil,
          @no_action_email : Types::NotifyEmailType? = nil,
          @reply_to : String? = nil
        )
        end
      end

      # The template for email messages that threat protection sends to a user when your threat protection
      # automated response has a Notify action.

      struct NotifyEmailType
        include JSON::Serializable

        # The subject of the threat protection email notification.

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # The body of an email notification formatted in HTML. Choose an HtmlBody or a TextBody to send an
        # HTML-formatted or plaintext message, respectively.

        @[JSON::Field(key: "HtmlBody")]
        getter html_body : String?

        # The body of an email notification formatted in plaintext. Choose an HtmlBody or a TextBody to send
        # an HTML-formatted or plaintext message, respectively.

        @[JSON::Field(key: "TextBody")]
        getter text_body : String?

        def initialize(
          @subject : String,
          @html_body : String? = nil,
          @text_body : String? = nil
        )
        end
      end

      # The minimum and maximum values of an attribute that is of the number type, for example custom:age .

      struct NumberAttributeConstraintsType
        include JSON::Serializable

        # The maximum length of a number attribute value. Must be a number less than or equal to 2^1023 ,
        # represented as a string with a length of 131072 characters or fewer.

        @[JSON::Field(key: "MaxValue")]
        getter max_value : String?

        # The minimum value of an attribute that is of the number data type.

        @[JSON::Field(key: "MinValue")]
        getter min_value : String?

        def initialize(
          @max_value : String? = nil,
          @min_value : String? = nil
        )
        end
      end

      # The message returned when a user's new password matches a previous password and doesn't comply with
      # the password-history policy.

      struct PasswordHistoryPolicyViolationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The password policy settings for a user pool, including complexity, history, and length
      # requirements.

      struct PasswordPolicyType
        include JSON::Serializable

        # The minimum length of the password in the policy that you have set. This value can't be less than 6.

        @[JSON::Field(key: "MinimumLength")]
        getter minimum_length : Int32?

        # The number of previous passwords that you want Amazon Cognito to restrict each user from reusing.
        # Users can't set a password that matches any of n previous passwords, where n is the value of
        # PasswordHistorySize .

        @[JSON::Field(key: "PasswordHistorySize")]
        getter password_history_size : Int32?

        # The requirement in a password policy that users must include at least one lowercase letter in their
        # password.

        @[JSON::Field(key: "RequireLowercase")]
        getter require_lowercase : Bool?

        # The requirement in a password policy that users must include at least one number in their password.

        @[JSON::Field(key: "RequireNumbers")]
        getter require_numbers : Bool?

        # The requirement in a password policy that users must include at least one symbol in their password.

        @[JSON::Field(key: "RequireSymbols")]
        getter require_symbols : Bool?

        # The requirement in a password policy that users must include at least one uppercase letter in their
        # password.

        @[JSON::Field(key: "RequireUppercase")]
        getter require_uppercase : Bool?

        # The number of days a temporary password is valid in the password policy. If the user doesn't sign in
        # during this time, an administrator must reset their password. Defaults to 7 . If you submit a value
        # of 0 , Amazon Cognito treats it as a null value and sets TemporaryPasswordValidityDays to its
        # default value. When you set TemporaryPasswordValidityDays for a user pool, you can no longer set a
        # value for the legacy UnusedAccountValidityDays parameter in that user pool.

        @[JSON::Field(key: "TemporaryPasswordValidityDays")]
        getter temporary_password_validity_days : Int32?

        def initialize(
          @minimum_length : Int32? = nil,
          @password_history_size : Int32? = nil,
          @require_lowercase : Bool? = nil,
          @require_numbers : Bool? = nil,
          @require_symbols : Bool? = nil,
          @require_uppercase : Bool? = nil,
          @temporary_password_validity_days : Int32? = nil
        )
        end
      end

      # This exception is thrown when a password reset is required.

      struct PasswordResetRequiredException
        include JSON::Serializable

        # The message returned when a password reset is required.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The properties of a pre token generation Lambda trigger.

      struct PreTokenGenerationVersionConfigType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger. This
        # parameter and the PreTokenGeneration property of LambdaConfig have the same value. For new instances
        # of pre token generation triggers, set LambdaArn .

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String

        # The user pool trigger version of the request that Amazon Cognito sends to your Lambda function.
        # Higher-numbered versions add fields that support new features.

        @[JSON::Field(key: "LambdaVersion")]
        getter lambda_version : String

        def initialize(
          @lambda_arn : String,
          @lambda_version : String
        )
        end
      end

      # This exception is thrown when a precondition is not met.

      struct PreconditionNotMetException
        include JSON::Serializable

        # The message returned when a precondition is not met.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of a user pool identity provider (IdP), including name and type.

      struct ProviderDescription
        include JSON::Serializable

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The name of the IdP, for example MySAMLProvider .

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        # The type of the provider, for example SAML . Amazon Cognito supports SAML 2.0, OIDC, and social
        # IdPs. User pools list supported social IdPs by name in this response parameter: Facebook, Google,
        # Login with Amazon, and Sign in with Apple.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @provider_name : String? = nil,
          @provider_type : String? = nil
        )
        end
      end

      # The characteristics of a source or destination user for linking a federated user profile to a local
      # user profile.

      struct ProviderUserIdentifierType
        include JSON::Serializable

        # The name of the provider attribute to link to, such as NameID .

        @[JSON::Field(key: "ProviderAttributeName")]
        getter provider_attribute_name : String?

        # The value of the provider attribute to link to, such as xxxxx_account .

        @[JSON::Field(key: "ProviderAttributeValue")]
        getter provider_attribute_value : String?

        # The name of the provider, such as Facebook, Google, or Login with Amazon.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        def initialize(
          @provider_attribute_name : String? = nil,
          @provider_attribute_value : String? = nil,
          @provider_name : String? = nil
        )
        end
      end

      # A recovery option for a user. The AccountRecoverySettingType data type is an array of this object.
      # Each RecoveryOptionType has a priority property that determines whether it is a primary or secondary
      # option. For example, if verified_email has a priority of 1 and verified_phone_number has a priority
      # of 2 , your user pool sends account-recovery messages to a verified email address but falls back to
      # an SMS message if the user has a verified phone number. The admin_only option prevents self-service
      # account recovery.

      struct RecoveryOptionType
        include JSON::Serializable

        # The recovery method that this object sets a recovery option for.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Your priority preference for using the specified attribute in account recovery. The highest priority
        # is 1 .

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        def initialize(
          @name : String,
          @priority : Int32
        )
        end
      end

      # This exception is throw when your application requests token refresh with a refresh token that has
      # been invalidated by refresh-token rotation.

      struct RefreshTokenReuseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of your app client for refresh token rotation. When enabled, your app client
      # issues new ID, access, and refresh tokens when users renew their sessions with refresh tokens. When
      # disabled, token refresh issues only ID and access tokens.

      struct RefreshTokenRotationType
        include JSON::Serializable

        # The state of refresh token rotation for the current app client.

        @[JSON::Field(key: "Feature")]
        getter feature : String

        # When you request a token refresh with GetTokensFromRefreshToken , the original refresh token that
        # you're rotating out can remain valid for a period of time of up to 60 seconds. This allows for
        # client-side retries. When RetryGracePeriodSeconds is 0 , the grace period is disabled and a
        # successful request immediately invalidates the submitted refresh token.

        @[JSON::Field(key: "RetryGracePeriodSeconds")]
        getter retry_grace_period_seconds : Int32?

        def initialize(
          @feature : String,
          @retry_grace_period_seconds : Int32? = nil
        )
        end
      end

      # Represents the request to resend the confirmation code.

      struct ResendConfirmationCodeRequest
        include JSON::Serializable

        # The ID of the user pool app client where the user signed up.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the ResendConfirmationCode API action, Amazon Cognito invokes the function that is
        # assigned to the custom message trigger. When Amazon Cognito invokes this function, it passes a JSON
        # payload, which the function receives as input. This payload contains a clientMetadata attribute,
        # which provides the data that you assigned to the ClientMetadata parameter in your
        # ResendConfirmationCode request. In your function code in Lambda, you can process the clientMetadata
        # value to enhance your workflow for your specific needs. For more information, see Using Lambda
        # triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata parameter, note
        # that Amazon Cognito won't do the following: Store the ClientMetadata value. This data is available
        # only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user
        # pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.
        # Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send sensitive
        # information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool
        # client and username plus the client ID in the message. For more information about SecretHash , see
        # Computing secret hash values .

        @[JSON::Field(key: "SecretHash")]
        getter secret_hash : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @client_id : String,
          @username : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @secret_hash : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # The response from the server when Amazon Cognito makes the request to resend a confirmation code.

      struct ResendConfirmationCodeResponse
        include JSON::Serializable

        # Information about the phone number or email address that Amazon Cognito sent the confirmation code
        # to.

        @[JSON::Field(key: "CodeDeliveryDetails")]
        getter code_delivery_details : Types::CodeDeliveryDetailsType?

        def initialize(
          @code_delivery_details : Types::CodeDeliveryDetailsType? = nil
        )
        end
      end

      # This exception is thrown when the Amazon Cognito service can't find the requested resource.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The message returned when the Amazon Cognito service returns a resource not found exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One custom scope associated with a user pool resource server. This data type is a member of
      # ResourceServerScopeType . For more information, see Scopes, M2M, and API authorization with resource
      # servers .

      struct ResourceServerScopeType
        include JSON::Serializable

        # A friendly description of a custom scope.

        @[JSON::Field(key: "ScopeDescription")]
        getter scope_description : String

        # The name of the scope. Amazon Cognito renders custom scopes in the format
        # resourceServerIdentifier/ScopeName . For example, if this parameter is exampleScope in the resource
        # server with the identifier exampleResourceServer , you request and receive the scope
        # exampleResourceServer/exampleScope .

        @[JSON::Field(key: "ScopeName")]
        getter scope_name : String

        def initialize(
          @scope_description : String,
          @scope_name : String
        )
        end
      end

      # The details of a resource server configuration and associated custom scopes in a user pool.

      struct ResourceServerType
        include JSON::Serializable

        # A unique resource server identifier for the resource server. The identifier can be an API friendly
        # name like solar-system-data . You can also set an API URL like
        # https://solar-system-data-api.example.com as your identifier. Amazon Cognito represents scopes in
        # the access token in the format $resource-server-identifier/$scope . Longer scope-identifier strings
        # increase the size of your access tokens.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # The name of the resource server.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of scopes that are defined for the resource server.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(Types::ResourceServerScopeType)?

        # The ID of the user pool that contains the resource server configuration.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @identifier : String? = nil,
          @name : String? = nil,
          @scopes : Array(Types::ResourceServerScopeType)? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # The request to respond to an authentication challenge.

      struct RespondToAuthChallengeRequest
        include JSON::Serializable

        # The name of the challenge that you are responding to. You can't respond to an ADMIN_NO_SRP_AUTH
        # challenge with this operation. Possible challenges include the following: All of the following
        # challenges require USERNAME and, when the app client has a client secret, SECRET_HASH in the
        # parameters. Include a DEVICE_KEY for device authentication. WEB_AUTHN : Respond to the challenge
        # with the results of a successful authentication with a WebAuthn authenticator, or passkey, as
        # CREDENTIAL . Examples of WebAuthn authenticators include biometric devices and security keys.
        # PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP : Respond with the initial
        # SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection as ANSWER . It must be
        # one of the challenge types in the AvailableChallenges response parameter. Add the parameters of the
        # selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with the code that your
        # user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with the code that your
        # user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond with the code that
        # your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP : Respond with the code
        # that your user pool delivered in an SMS message, as SMS_OTP_CODE . PASSWORD_VERIFIER : Respond with
        # the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom authentication flow determines that
        # the user should pass another challenge before tokens are issued. The parameters of the challenge are
        # determined by your Lambda function and issued in the ChallengeParameters of a challenge response.
        # DEVICE_SRP_AUTH : Respond with the initial parameters of device SRP authentication. For more
        # information, see Signing in with a device . DEVICE_PASSWORD_VERIFIER : Respond with
        # PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP after client-side SRP
        # calculations. For more information, see Signing in with a device . NEW_PASSWORD_REQUIRED : For users
        # who are required to change their passwords after successful first login. Respond to this challenge
        # with NEW_PASSWORD and any required attributes that Amazon Cognito returned in the requiredAttributes
        # parameter. You can also set values for attributes that aren't required by your user pool and that
        # your app client can write. Amazon Cognito only returns this challenge for users who have temporary
        # passwords. When you create passwordless users, you must provide values for all required attributes.
        # In a NEW_PASSWORD_REQUIRED challenge response, you can't modify a required attribute that already
        # has a value. In AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys
        # that Amazon Cognito returned in the requiredAttributes parameter, then use the
        # AdminUpdateUserAttributes or UpdateUserAttributes API operation to modify the value of any
        # additional attributes. MFA_SETUP : For users who are required to setup an MFA factor before they can
        # sign in. The MFA types activated for the user pool will be listed in the challenge parameters
        # MFAS_CAN_SETUP value. To set up time-based one-time password (TOTP) MFA, use the session returned in
        # this challenge from InitiateAuth or AdminInitiateAuth as an input to AssociateSoftwareToken . Then,
        # use the session returned by VerifySoftwareToken as an input to RespondToAuthChallenge or
        # AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete sign-in. To set up SMS or
        # email MFA, collect a phone_number or email attribute for the user. Then restart the authentication
        # flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String

        # The ID of the app client where the user is signing in.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # The responses to the challenge that you received in the previous request. Each challenge has its own
        # required response parameters. The following examples are partial JSON request bodies that highlight
        # challenge-response parameters. You must provide a SECRET_HASH parameter in all challenge responses
        # to an app client that has a client secret. Include a DEVICE_KEY for device authentication.
        # SELECT_CHALLENGE "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "USERNAME":
        # "[username]", "ANSWER": "[Challenge name]"} Available challenges are PASSWORD , PASSWORD_SRP ,
        # EMAIL_OTP , SMS_OTP , and WEB_AUTHN . Complete authentication in the SELECT_CHALLENGE response for
        # PASSWORD , PASSWORD_SRP , and WEB_AUTHN : "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses":
        # { "ANSWER": "WEB_AUTHN", "USERNAME": "[username]", "CREDENTIAL": "[AuthenticationResponseJSON]"} See
        # AuthenticationResponseJSON . "ChallengeName": "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER":
        # "PASSWORD", "USERNAME": "[username]", "PASSWORD": "[password]"} "ChallengeName": "SELECT_CHALLENGE",
        # "ChallengeResponses": { "ANSWER": "PASSWORD_SRP", "USERNAME": "[username]", "SRP_A": "[SRP_A]"} For
        # SMS_OTP and EMAIL_OTP , respond with the username and answer. Your user pool will send a code for
        # the user to submit in the next challenge response. "ChallengeName": "SELECT_CHALLENGE",
        # "ChallengeResponses": { "ANSWER": "SMS_OTP", "USERNAME": "[username]"} "ChallengeName":
        # "SELECT_CHALLENGE", "ChallengeResponses": { "ANSWER": "EMAIL_OTP", "USERNAME": "[username]"}
        # WEB_AUTHN "ChallengeName": "WEB_AUTHN", "ChallengeResponses": { "USERNAME": "[username]",
        # "CREDENTIAL": "[AuthenticationResponseJSON]"} See AuthenticationResponseJSON . PASSWORD
        # "ChallengeName": "PASSWORD", "ChallengeResponses": { "USERNAME": "[username]", "PASSWORD":
        # "[password]"} PASSWORD_SRP "ChallengeName": "PASSWORD_SRP", "ChallengeResponses": { "USERNAME":
        # "[username]", "SRP_A": "[SRP_A]"} SMS_OTP "ChallengeName": "SMS_OTP", "ChallengeResponses":
        # {"SMS_OTP_CODE": "[code]", "USERNAME": "[username]"} EMAIL_OTP "ChallengeName": "EMAIL_OTP",
        # "ChallengeResponses": {"EMAIL_OTP_CODE": "[code]", "USERNAME": "[username]"} SMS_MFA
        # "ChallengeName": "SMS_MFA", "ChallengeResponses": {"SMS_MFA_CODE": "[code]", "USERNAME":
        # "[username]"} PASSWORD_VERIFIER This challenge response is part of the SRP flow. Amazon Cognito
        # requires that your application respond to this challenge within a few seconds. When the response
        # time exceeds this period, your user pool returns a NotAuthorizedException error. "ChallengeName":
        # "PASSWORD_VERIFIER", "ChallengeResponses": {"PASSWORD_CLAIM_SIGNATURE": "[claim_signature]",
        # "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}
        # CUSTOM_CHALLENGE "ChallengeName": "CUSTOM_CHALLENGE", "ChallengeResponses": {"USERNAME":
        # "[username]", "ANSWER": "[challenge_answer]"} NEW_PASSWORD_REQUIRED "ChallengeName":
        # "NEW_PASSWORD_REQUIRED", "ChallengeResponses": {"NEW_PASSWORD": "[new_password]", "USERNAME":
        # "[username]"} To set any required attributes that InitiateAuth returned in an requiredAttributes
        # parameter, add "userAttributes.[attribute_name]": "[attribute_value]" . This parameter can also set
        # values for writable attributes that aren't required by your user pool. In a NEW_PASSWORD_REQUIRED
        # challenge response, you can't modify a required attribute that already has a value. In
        # AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys that Amazon Cognito
        # returned in the requiredAttributes parameter, then use the AdminUpdateUserAttributes or
        # UpdateUserAttributes API operation to modify the value of any additional attributes.
        # SOFTWARE_TOKEN_MFA "ChallengeName": "SOFTWARE_TOKEN_MFA", "ChallengeResponses": {"USERNAME":
        # "[username]", "SOFTWARE_TOKEN_MFA_CODE": [authenticator_code]} DEVICE_SRP_AUTH "ChallengeName":
        # "DEVICE_SRP_AUTH", "ChallengeResponses": {"USERNAME": "[username]", "DEVICE_KEY": "[device_key]",
        # "SRP_A": "[srp_a]"} DEVICE_PASSWORD_VERIFIER "ChallengeName": "DEVICE_PASSWORD_VERIFIER",
        # "ChallengeResponses": {"DEVICE_KEY": "[device_key]", "PASSWORD_CLAIM_SIGNATURE":
        # "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp],
        # "USERNAME": "[username]"} MFA_SETUP "ChallengeName": "MFA_SETUP", "ChallengeResponses": {"USERNAME":
        # "[username]"}, "SESSION": "[Session ID from VerifySoftwareToken]" SELECT_MFA_TYPE "ChallengeName":
        # "SELECT_MFA_TYPE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER":
        # "[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA]"} For more information about SECRET_HASH , see Computing
        # secret hash values . For information about DEVICE_KEY , see Working with user devices in your user
        # pool .

        @[JSON::Field(key: "ChallengeResponses")]
        getter challenge_responses : Hash(String, String)?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the RespondToAuthChallenge API action, Amazon Cognito invokes any functions that are
        # assigned to the following triggers: post authentication , pre token generation , define auth
        # challenge , create auth challenge , and verify auth challenge . When Amazon Cognito invokes any of
        # these functions, it passes a JSON payload, which the function receives as input. This payload
        # contains a clientMetadata attribute, which provides the data that you assigned to the ClientMetadata
        # parameter in your RespondToAuthChallenge request. In your function code in Lambda, you can process
        # the clientMetadata value to enhance your workflow for your specific needs. For more information, see
        # Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata
        # parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata value. This
        # data is available only to Lambda triggers that are assigned to a user pool to support custom
        # workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter
        # serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send
        # sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # The session identifier that maintains the state of authentication requests and challenge responses.
        # If an AdminInitiateAuth or AdminRespondToAuthChallenge API request results in a determination that
        # your application must pass another challenge, Amazon Cognito returns a session with other challenge
        # parameters. Send this session identifier, unmodified, to the next AdminRespondToAuthChallenge
        # request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        def initialize(
          @challenge_name : String,
          @client_id : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @challenge_responses : Hash(String, String)? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @session : String? = nil,
          @user_context_data : Types::UserContextDataType? = nil
        )
        end
      end

      # The response to respond to the authentication challenge.

      struct RespondToAuthChallengeResponse
        include JSON::Serializable

        # The outcome of a successful authentication process. After your application has passed all
        # challenges, Amazon Cognito returns an AuthenticationResult with the JSON web tokens (JWTs) that
        # indicate successful sign-in.

        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResultType?

        # The name of the next challenge that you must respond to. Possible challenges include the following:
        # All of the following challenges require USERNAME and, when the app client has a client secret,
        # SECRET_HASH in the parameters. Include a DEVICE_KEY for device authentication. WEB_AUTHN : Respond
        # to the challenge with the results of a successful authentication with a WebAuthn authenticator, or
        # passkey, as CREDENTIAL . Examples of WebAuthn authenticators include biometric devices and security
        # keys. PASSWORD : Respond with the user's password as PASSWORD . PASSWORD_SRP : Respond with the
        # initial SRP secret as SRP_A . SELECT_CHALLENGE : Respond with a challenge selection as ANSWER . It
        # must be one of the challenge types in the AvailableChallenges response parameter. Add the parameters
        # of the selected challenge, for example USERNAME and SMS_OTP . SMS_MFA : Respond with the code that
        # your user pool delivered in an SMS message, as SMS_MFA_CODE EMAIL_MFA : Respond with the code that
        # your user pool delivered in an email message, as EMAIL_MFA_CODE EMAIL_OTP : Respond with the code
        # that your user pool delivered in an email message, as EMAIL_OTP_CODE . SMS_OTP : Respond with the
        # code that your user pool delivered in an SMS message, as SMS_OTP_CODE . PASSWORD_VERIFIER : Respond
        # with the second stage of SRP secrets as PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and
        # TIMESTAMP . CUSTOM_CHALLENGE : This is returned if your custom authentication flow determines that
        # the user should pass another challenge before tokens are issued. The parameters of the challenge are
        # determined by your Lambda function and issued in the ChallengeParameters of a challenge response.
        # DEVICE_SRP_AUTH : Respond with the initial parameters of device SRP authentication. For more
        # information, see Signing in with a device . DEVICE_PASSWORD_VERIFIER : Respond with
        # PASSWORD_CLAIM_SIGNATURE , PASSWORD_CLAIM_SECRET_BLOCK , and TIMESTAMP after client-side SRP
        # calculations. For more information, see Signing in with a device . NEW_PASSWORD_REQUIRED : For users
        # who are required to change their passwords after successful first login. Respond to this challenge
        # with NEW_PASSWORD and any required attributes that Amazon Cognito returned in the requiredAttributes
        # parameter. You can also set values for attributes that aren't required by your user pool and that
        # your app client can write. Amazon Cognito only returns this challenge for users who have temporary
        # passwords. When you create passwordless users, you must provide values for all required attributes.
        # In a NEW_PASSWORD_REQUIRED challenge response, you can't modify a required attribute that already
        # has a value. In AdminRespondToAuthChallenge or RespondToAuthChallenge , set a value for any keys
        # that Amazon Cognito returned in the requiredAttributes parameter, then use the
        # AdminUpdateUserAttributes or UpdateUserAttributes API operation to modify the value of any
        # additional attributes. MFA_SETUP : For users who are required to setup an MFA factor before they can
        # sign in. The MFA types activated for the user pool will be listed in the challenge parameters
        # MFAS_CAN_SETUP value. To set up time-based one-time password (TOTP) MFA, use the session returned in
        # this challenge from InitiateAuth or AdminInitiateAuth as an input to AssociateSoftwareToken . Then,
        # use the session returned by VerifySoftwareToken as an input to RespondToAuthChallenge or
        # AdminRespondToAuthChallenge with challenge name MFA_SETUP to complete sign-in. To set up SMS or
        # email MFA, collect a phone_number or email attribute for the user. Then restart the authentication
        # flow with an InitiateAuth or AdminInitiateAuth request.

        @[JSON::Field(key: "ChallengeName")]
        getter challenge_name : String?

        # The parameters that define your response to the next challenge.

        @[JSON::Field(key: "ChallengeParameters")]
        getter challenge_parameters : Hash(String, String)?

        # The session identifier that maintains the state of authentication requests and challenge responses.
        # If an InitiateAuth or RespondToAuthChallenge API request results in a determination that your
        # application must pass another challenge, Amazon Cognito returns a session with other challenge
        # parameters. Send this session identifier, unmodified, to the next RespondToAuthChallenge request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @authentication_result : Types::AuthenticationResultType? = nil,
          @challenge_name : String? = nil,
          @challenge_parameters : Hash(String, String)? = nil,
          @session : String? = nil
        )
        end
      end


      struct RevokeTokenRequest
        include JSON::Serializable

        # The ID of the app client where the token that you want to revoke was issued.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The refresh token that you want to revoke.

        @[JSON::Field(key: "Token")]
        getter token : String

        # The client secret of the requested app client, if the client has a secret.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String?

        def initialize(
          @client_id : String,
          @token : String,
          @client_secret : String? = nil
        )
        end
      end


      struct RevokeTokenResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The settings of risk configuration for threat protection with threat protection in a user pool.

      struct RiskConfigurationType
        include JSON::Serializable

        # The settings for automated responses and notification templates for adaptive authentication with
        # threat protection.

        @[JSON::Field(key: "AccountTakeoverRiskConfiguration")]
        getter account_takeover_risk_configuration : Types::AccountTakeoverRiskConfigurationType?

        # The app client where this configuration is applied. When this parameter isn't present, the risk
        # configuration applies to all user pool app clients that don't have client-level settings.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # Settings for compromised-credentials actions and authentication types with threat protection in
        # full-function ENFORCED mode.

        @[JSON::Field(key: "CompromisedCredentialsRiskConfiguration")]
        getter compromised_credentials_risk_configuration : Types::CompromisedCredentialsRiskConfigurationType?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # Exceptions to the risk evaluation configuration, including always-allow and always-block IP address
        # ranges.

        @[JSON::Field(key: "RiskExceptionConfiguration")]
        getter risk_exception_configuration : Types::RiskExceptionConfigurationType?

        # The ID of the user pool that has the risk configuration applied.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @account_takeover_risk_configuration : Types::AccountTakeoverRiskConfigurationType? = nil,
          @client_id : String? = nil,
          @compromised_credentials_risk_configuration : Types::CompromisedCredentialsRiskConfigurationType? = nil,
          @last_modified_date : Time? = nil,
          @risk_exception_configuration : Types::RiskExceptionConfigurationType? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # Exceptions to the risk evaluation configuration, including always-allow and always-block IP address
      # ranges.

      struct RiskExceptionConfigurationType
        include JSON::Serializable

        # An always-block IP address list. Overrides the risk decision and always blocks authentication
        # requests. This parameter is displayed and set in CIDR notation.

        @[JSON::Field(key: "BlockedIPRangeList")]
        getter blocked_ip_range_list : Array(String)?

        # An always-allow IP address list. Risk detection isn't performed on the IP addresses in this range
        # list. This parameter is displayed and set in CIDR notation.

        @[JSON::Field(key: "SkippedIPRangeList")]
        getter skipped_ip_range_list : Array(String)?

        def initialize(
          @blocked_ip_range_list : Array(String)? = nil,
          @skipped_ip_range_list : Array(String)? = nil
        )
        end
      end

      # Configuration for the Amazon S3 bucket destination of user activity log export with threat
      # protection.

      struct S3ConfigurationType
        include JSON::Serializable

        # The ARN of an Amazon S3 bucket that's the destination for threat protection log export.

        @[JSON::Field(key: "BucketArn")]
        getter bucket_arn : String?

        def initialize(
          @bucket_arn : String? = nil
        )
        end
      end

      # A user's preference for using SMS message multi-factor authentication (MFA). Turns SMS MFA on and
      # off, and can set SMS as preferred when other MFA options are available. You can't turn off SMS MFA
      # for any of your users when MFA is required in your user pool; you can only set the type that your
      # user prefers.

      struct SMSMfaSettingsType
        include JSON::Serializable

        # Specifies whether SMS message MFA is activated. If an MFA type is activated for a user, the user
        # will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the
        # device has been trusted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies whether SMS is the preferred MFA method. If true, your user pool prompts the specified
        # user for a code delivered by SMS message after username-password sign-in succeeds.

        @[JSON::Field(key: "PreferredMfa")]
        getter preferred_mfa : Bool?

        def initialize(
          @enabled : Bool? = nil,
          @preferred_mfa : Bool? = nil
        )
        end
      end

      # A list of the user attributes and their properties in your user pool. The attribute schema contains
      # standard attributes, custom attributes with a custom: prefix, and developer attributes with a dev:
      # prefix. For more information, see User pool attributes . Developer-only dev: attributes are a legacy
      # feature of user pools, and are read-only to all app clients. You can create and update
      # developer-only attributes only with IAM-authenticated API operations. Use app client read/write
      # permissions instead.

      struct SchemaAttributeType
        include JSON::Serializable

        # The data format of the values for your attribute. When you choose an AttributeDataType , Amazon
        # Cognito validates the input against the data type. A custom attribute value in your user's ID token
        # is always a string, for example "custom:isMember" : "true" or "custom:YearsAsMember" : "12" .

        @[JSON::Field(key: "AttributeDataType")]
        getter attribute_data_type : String?

        # You should use WriteAttributes in the user pool client to control how attributes can be mutated for
        # new use cases instead of using DeveloperOnlyAttribute . Specifies whether the attribute type is
        # developer only. This attribute can only be modified by an administrator. Users won't be able to
        # modify this attribute using their access token. For example, DeveloperOnlyAttribute can be modified
        # using AdminUpdateUserAttributes but can't be updated using UpdateUserAttributes.

        @[JSON::Field(key: "DeveloperOnlyAttribute")]
        getter developer_only_attribute : Bool?

        # Specifies whether the value of the attribute can be changed. Any user pool attribute whose value you
        # map from an IdP attribute must be mutable, with a parameter value of true . Amazon Cognito updates
        # mapped attributes when users sign in to your application through an IdP. If an attribute is
        # immutable, Amazon Cognito throws an error when it attempts to update the attribute. For more
        # information, see Specifying Identity Provider Attribute Mappings for Your User Pool .

        @[JSON::Field(key: "Mutable")]
        getter mutable : Bool?

        # The name of your user pool attribute. When you create or update a user pool, adding a schema
        # attribute creates a custom or developer-only attribute. When you add an attribute with a Name value
        # of MyAttribute , Amazon Cognito creates the custom attribute custom:MyAttribute . When
        # DeveloperOnlyAttribute is true , Amazon Cognito creates your attribute as dev:MyAttribute . In an
        # operation that describes a user pool, Amazon Cognito returns this value as value for standard
        # attributes, custom:value for custom attributes, and dev:value for developer-only attributes..

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the constraints for an attribute of the number type.

        @[JSON::Field(key: "NumberAttributeConstraints")]
        getter number_attribute_constraints : Types::NumberAttributeConstraintsType?

        # Specifies whether a user pool attribute is required. If the attribute is required and the user
        # doesn't provide a value, registration or sign-in will fail.

        @[JSON::Field(key: "Required")]
        getter required : Bool?

        # Specifies the constraints for an attribute of the string type.

        @[JSON::Field(key: "StringAttributeConstraints")]
        getter string_attribute_constraints : Types::StringAttributeConstraintsType?

        def initialize(
          @attribute_data_type : String? = nil,
          @developer_only_attribute : Bool? = nil,
          @mutable : Bool? = nil,
          @name : String? = nil,
          @number_attribute_constraints : Types::NumberAttributeConstraintsType? = nil,
          @required : Bool? = nil,
          @string_attribute_constraints : Types::StringAttributeConstraintsType? = nil
        )
        end
      end

      # This exception is thrown when the specified scope doesn't exist.

      struct ScopeDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SetLogDeliveryConfigurationRequest
        include JSON::Serializable

        # A collection of the logging configurations for a user pool.

        @[JSON::Field(key: "LogConfigurations")]
        getter log_configurations : Array(Types::LogConfigurationType)

        # The ID of the user pool where you want to configure logging.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @log_configurations : Array(Types::LogConfigurationType),
          @user_pool_id : String
        )
        end
      end


      struct SetLogDeliveryConfigurationResponse
        include JSON::Serializable

        # The logging configuration that you applied to the requested user pool.

        @[JSON::Field(key: "LogDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfigurationType?

        def initialize(
          @log_delivery_configuration : Types::LogDeliveryConfigurationType? = nil
        )
        end
      end


      struct SetRiskConfigurationRequest
        include JSON::Serializable

        # The ID of the user pool where you want to set a risk configuration. If you include UserPoolId in
        # your request, don't include ClientId . When the client ID is null, the same risk configuration is
        # applied to all the clients in the userPool. When you include both ClientId and UserPoolId , Amazon
        # Cognito maps the configuration to the app client only.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The settings for automated responses and notification templates for adaptive authentication with
        # threat protection.

        @[JSON::Field(key: "AccountTakeoverRiskConfiguration")]
        getter account_takeover_risk_configuration : Types::AccountTakeoverRiskConfigurationType?

        # The ID of the app client where you want to set a risk configuration. If ClientId is null, then the
        # risk configuration is mapped to UserPoolId . When the client ID is null, the same risk configuration
        # is applied to all the clients in the userPool. When you include a ClientId parameter, Amazon Cognito
        # maps the configuration to the app client. When you include both ClientId and UserPoolId , Amazon
        # Cognito maps the configuration to the app client only.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The configuration of automated reactions to detected compromised credentials. Includes settings for
        # blocking future sign-in requests and for the types of password-submission events you want to
        # monitor.

        @[JSON::Field(key: "CompromisedCredentialsRiskConfiguration")]
        getter compromised_credentials_risk_configuration : Types::CompromisedCredentialsRiskConfigurationType?

        # A set of IP-address overrides to threat protection. You can set up IP-address always-block and
        # always-allow lists.

        @[JSON::Field(key: "RiskExceptionConfiguration")]
        getter risk_exception_configuration : Types::RiskExceptionConfigurationType?

        def initialize(
          @user_pool_id : String,
          @account_takeover_risk_configuration : Types::AccountTakeoverRiskConfigurationType? = nil,
          @client_id : String? = nil,
          @compromised_credentials_risk_configuration : Types::CompromisedCredentialsRiskConfigurationType? = nil,
          @risk_exception_configuration : Types::RiskExceptionConfigurationType? = nil
        )
        end
      end


      struct SetRiskConfigurationResponse
        include JSON::Serializable

        # The API response that contains the risk configuration that you set and the timestamp of the most
        # recent change.

        @[JSON::Field(key: "RiskConfiguration")]
        getter risk_configuration : Types::RiskConfigurationType

        def initialize(
          @risk_configuration : Types::RiskConfigurationType
        )
        end
      end


      struct SetUICustomizationRequest
        include JSON::Serializable

        # The ID of the user pool where you want to apply branding to the classic hosted UI.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A plaintext CSS file that contains the custom fields that you want to apply to your user pool or app
        # client. To download a template, go to the Amazon Cognito console. Navigate to your user pool App
        # clients tab, select Login pages , edit Hosted UI (classic) style , and select the link to CSS
        # template.css .

        @[JSON::Field(key: "CSS")]
        getter css : String?

        # The ID of the app client that you want to customize. To apply a default style to all app clients not
        # configured with client-level branding, set this parameter value to ALL .

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The image that you want to set as your login in the classic hosted UI, as a Base64-formatted binary
        # object.

        @[JSON::Field(key: "ImageFile")]
        getter image_file : Bytes?

        def initialize(
          @user_pool_id : String,
          @css : String? = nil,
          @client_id : String? = nil,
          @image_file : Bytes? = nil
        )
        end
      end


      struct SetUICustomizationResponse
        include JSON::Serializable

        # Information about the hosted UI branding that you applied.

        @[JSON::Field(key: "UICustomization")]
        getter ui_customization : Types::UICustomizationType

        def initialize(
          @ui_customization : Types::UICustomizationType
        )
        end
      end


      struct SetUserMFAPreferenceRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # User preferences for email message MFA. Activates or deactivates email MFA and sets it as the
        # preferred MFA method when multiple methods are available. To activate this setting, your user pool
        # must be in the Essentials tier or higher.

        @[JSON::Field(key: "EmailMfaSettings")]
        getter email_mfa_settings : Types::EmailMfaSettingsType?

        # User preferences for SMS message MFA. Activates or deactivates SMS MFA and sets it as the preferred
        # MFA method when multiple methods are available.

        @[JSON::Field(key: "SMSMfaSettings")]
        getter sms_mfa_settings : Types::SMSMfaSettingsType?

        # User preferences for time-based one-time password (TOTP) MFA. Activates or deactivates TOTP MFA and
        # sets it as the preferred MFA method when multiple methods are available. Users must register a TOTP
        # authenticator before they set this as their preferred MFA method.

        @[JSON::Field(key: "SoftwareTokenMfaSettings")]
        getter software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType?

        def initialize(
          @access_token : String,
          @email_mfa_settings : Types::EmailMfaSettingsType? = nil,
          @sms_mfa_settings : Types::SMSMfaSettingsType? = nil,
          @software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType? = nil
        )
        end
      end


      struct SetUserMFAPreferenceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct SetUserPoolMfaConfigRequest
        include JSON::Serializable

        # The user pool ID.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # Sets configuration for user pool email message MFA and sign-in with one-time passwords (OTPs).
        # Includes the subject and body of the email message template for sign-in and MFA messages. To
        # activate this setting, your user pool must be in the Essentials tier or higher.

        @[JSON::Field(key: "EmailMfaConfiguration")]
        getter email_mfa_configuration : Types::EmailMfaConfigType?

        # Sets multi-factor authentication (MFA) to be on, off, or optional. When ON , all users must set up
        # MFA before they can sign in. When OPTIONAL , your application must make a client-side determination
        # of whether a user wants to register an MFA device. For user pools with adaptive authentication with
        # threat protection, choose OPTIONAL . When MfaConfiguration is OPTIONAL , managed login doesn't
        # automatically prompt users to set up MFA. Amazon Cognito generates MFA prompts in API responses and
        # in managed login for users who have chosen and configured a preferred MFA factor.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # Configures user pool SMS messages for MFA. Sets the message template and the SMS message sending
        # configuration for Amazon SNS.

        @[JSON::Field(key: "SmsMfaConfiguration")]
        getter sms_mfa_configuration : Types::SmsMfaConfigType?

        # Configures a user pool for time-based one-time password (TOTP) MFA. Enables or disables TOTP.

        @[JSON::Field(key: "SoftwareTokenMfaConfiguration")]
        getter software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType?

        # The configuration of your user pool for passkey, or WebAuthn, authentication and registration. You
        # can set this configuration independent of the MFA configuration options in this operation.

        @[JSON::Field(key: "WebAuthnConfiguration")]
        getter web_authn_configuration : Types::WebAuthnConfigurationType?

        def initialize(
          @user_pool_id : String,
          @email_mfa_configuration : Types::EmailMfaConfigType? = nil,
          @mfa_configuration : String? = nil,
          @sms_mfa_configuration : Types::SmsMfaConfigType? = nil,
          @software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType? = nil,
          @web_authn_configuration : Types::WebAuthnConfigurationType? = nil
        )
        end
      end


      struct SetUserPoolMfaConfigResponse
        include JSON::Serializable

        # Shows configuration for user pool email message MFA and sign-in with one-time passwords (OTPs).
        # Includes the subject and body of the email message template for sign-in and MFA messages. To
        # activate this setting, your user pool must be in the Essentials tier or higher.

        @[JSON::Field(key: "EmailMfaConfiguration")]
        getter email_mfa_configuration : Types::EmailMfaConfigType?

        # Displays multi-factor authentication (MFA) as on, off, or optional. When ON , all users must set up
        # MFA before they can sign in. When OPTIONAL , your application must make a client-side determination
        # of whether a user wants to register an MFA device. For user pools with adaptive authentication with
        # threat protection, choose OPTIONAL . When MfaConfiguration is OPTIONAL , managed login doesn't
        # automatically prompt users to set up MFA. Amazon Cognito generates MFA prompts in API responses and
        # in managed login for users who have chosen and configured a preferred MFA factor.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # Shows user pool SMS message configuration for MFA and sign-in with SMS-message OTPs. Includes the
        # message template and the SMS message sending configuration for Amazon SNS.

        @[JSON::Field(key: "SmsMfaConfiguration")]
        getter sms_mfa_configuration : Types::SmsMfaConfigType?

        # Shows user pool configuration for time-based one-time password (TOTP) MFA. Includes TOTP enabled or
        # disabled state.

        @[JSON::Field(key: "SoftwareTokenMfaConfiguration")]
        getter software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType?

        # The configuration of your user pool for passkey, or WebAuthn, sign-in with authenticators like
        # biometric and security-key devices. Includes relying-party configuration and settings for
        # user-verification requirements.

        @[JSON::Field(key: "WebAuthnConfiguration")]
        getter web_authn_configuration : Types::WebAuthnConfigurationType?

        def initialize(
          @email_mfa_configuration : Types::EmailMfaConfigType? = nil,
          @mfa_configuration : String? = nil,
          @sms_mfa_configuration : Types::SmsMfaConfigType? = nil,
          @software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType? = nil,
          @web_authn_configuration : Types::WebAuthnConfigurationType? = nil
        )
        end
      end

      # Represents the request to set user settings.

      struct SetUserSettingsRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # You can use this parameter only to set an SMS configuration that uses SMS for delivery.

        @[JSON::Field(key: "MFAOptions")]
        getter mfa_options : Array(Types::MFAOptionType)

        def initialize(
          @access_token : String,
          @mfa_options : Array(Types::MFAOptionType)
        )
        end
      end

      # The response from the server for a set user settings request.

      struct SetUserSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The policy for allowed types of authentication in a user pool. To activate this setting, your user
      # pool must be in the Essentials tier or higher.

      struct SignInPolicyType
        include JSON::Serializable

        # The sign-in methods that a user pool supports as the first factor. You can permit users to start
        # authentication with a standard username and password, or with other one-time password and hardware
        # factors.

        @[JSON::Field(key: "AllowedFirstAuthFactors")]
        getter allowed_first_auth_factors : Array(String)?

        def initialize(
          @allowed_first_auth_factors : Array(String)? = nil
        )
        end
      end

      # Represents the request to register a user.

      struct SignUpRequest
        include JSON::Serializable

        # The ID of the app client where the user wants to sign up.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The username of the user that you want to sign up. The value of this parameter is typically a
        # username, but can be any alias attribute in your user pool.

        @[JSON::Field(key: "Username")]
        getter username : String

        # Information that supports analytics outcomes with Amazon Pinpoint, including the user's endpoint ID.
        # The endpoint ID is a destination for Amazon Pinpoint push notifications, for example a device
        # identifier, email address, or phone number.

        @[JSON::Field(key: "AnalyticsMetadata")]
        getter analytics_metadata : Types::AnalyticsMetadataType?

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action triggers. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the SignUp API action, Amazon Cognito invokes any functions that are assigned to the
        # following triggers: pre sign-up , custom message , and post confirmation . When Amazon Cognito
        # invokes any of these functions, it passes a JSON payload, which the function receives as input. This
        # payload contains a clientMetadata attribute, which provides the data that you assigned to the
        # ClientMetadata parameter in your SignUp request. In your function code in Lambda, you can process
        # the clientMetadata value to enhance your workflow for your specific needs. For more information, see
        # Using Lambda triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata
        # parameter, note that Amazon Cognito won't do the following: Store the ClientMetadata value. This
        # data is available only to Lambda triggers that are assigned to a user pool to support custom
        # workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter
        # serves no purpose. Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send
        # sensitive information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        # The user's proposed password. The password must comply with the password requirements of your user
        # pool. Users can sign up without a password when your user pool supports passwordless sign-in with
        # email or SMS OTPs. To create a user with no password, omit this parameter or submit a blank value.
        # You can only create a passwordless user when passwordless sign-in is available.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool
        # client and username plus the client ID in the message. For more information about SecretHash , see
        # Computing secret hash values .

        @[JSON::Field(key: "SecretHash")]
        getter secret_hash : String?

        # An array of name-value pairs representing user attributes. For custom attributes, include a custom:
        # prefix in the attribute name, for example custom:department .

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)?

        # Contextual data about your user session like the device fingerprint, IP address, or location. Amazon
        # Cognito threat protection evaluates the risk of an authentication event based on the context that
        # your app generates and passes to Amazon Cognito when it makes API requests. For more information,
        # see Collecting data for threat protection in applications .

        @[JSON::Field(key: "UserContextData")]
        getter user_context_data : Types::UserContextDataType?

        # Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda trigger. This
        # set of key-value pairs are for custom validation of information that you collect from your users but
        # don't need to retain. Your Lambda function can analyze this additional data and act on it. Your
        # function can automatically confirm and verify select users or perform external API operations like
        # logging user attributes and validation data to Amazon CloudWatch Logs. For more information about
        # the pre sign-up Lambda trigger, see Pre sign-up Lambda trigger .

        @[JSON::Field(key: "ValidationData")]
        getter validation_data : Array(Types::AttributeType)?

        def initialize(
          @client_id : String,
          @username : String,
          @analytics_metadata : Types::AnalyticsMetadataType? = nil,
          @client_metadata : Hash(String, String)? = nil,
          @password : String? = nil,
          @secret_hash : String? = nil,
          @user_attributes : Array(Types::AttributeType)? = nil,
          @user_context_data : Types::UserContextDataType? = nil,
          @validation_data : Array(Types::AttributeType)? = nil
        )
        end
      end

      # The response from the server for a registration request.

      struct SignUpResponse
        include JSON::Serializable

        # Indicates whether the user was automatically confirmed. You can auto-confirm users with a pre
        # sign-up Lambda trigger .

        @[JSON::Field(key: "UserConfirmed")]
        getter user_confirmed : Bool

        # The unique identifier of the new user, for example a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 .

        @[JSON::Field(key: "UserSub")]
        getter user_sub : String

        # In user pools that automatically verify and confirm new users, Amazon Cognito sends users a message
        # with a code or link that confirms ownership of the phone number or email address that they entered.
        # The CodeDeliveryDetails object is information about the delivery destination for that link or code.

        @[JSON::Field(key: "CodeDeliveryDetails")]
        getter code_delivery_details : Types::CodeDeliveryDetailsType?

        # A session Id that you can pass to ConfirmSignUp when you want to immediately sign in your user with
        # the USER_AUTH flow after they complete sign-up.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @user_confirmed : Bool,
          @user_sub : String,
          @code_delivery_details : Types::CodeDeliveryDetailsType? = nil,
          @session : String? = nil
        )
        end
      end

      # User pool configuration for delivery of SMS messages with Amazon Simple Notification Service. To
      # send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon
      # Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services
      # account.

      struct SmsConfigurationType
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS caller. This is the ARN of the IAM role in your
        # Amazon Web Services account that Amazon Cognito will use to send SMS messages. SMS messages are
        # subject to a spending limit .

        @[JSON::Field(key: "SnsCallerArn")]
        getter sns_caller_arn : String

        # The external ID provides additional security for your IAM role. You can use an ExternalId with the
        # IAM role that you use with Amazon SNS to send SMS messages for your user pool. If you provide an
        # ExternalId , your Amazon Cognito user pool includes it in the request to assume your IAM role. You
        # can configure the role trust policy to require that Amazon Cognito, and any principal, provide the
        # ExternalID . If you use the Amazon Cognito Management Console to create a role for SMS multi-factor
        # authentication (MFA), Amazon Cognito creates a role with the required permissions and a trust policy
        # that demonstrates use of the ExternalId . For more information about the ExternalId of a role, see
        # How to use an external ID when granting access to your Amazon Web Services resources to a third
        # party .

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The Amazon Web Services Region to use with Amazon SNS integration. You can choose the same Region as
        # your user pool, or a supported Legacy Amazon SNS alternate Region . Amazon Cognito resources in the
        # Asia Pacific (Seoul) Amazon Web Services Region must use your Amazon SNS configuration in the Asia
        # Pacific (Tokyo) Region. For more information, see SMS message settings for Amazon Cognito user pools
        # .

        @[JSON::Field(key: "SnsRegion")]
        getter sns_region : String?

        def initialize(
          @sns_caller_arn : String,
          @external_id : String? = nil,
          @sns_region : String? = nil
        )
        end
      end

      # The configuration of multi-factor authentication (MFA) with SMS messages in a user pool.

      struct SmsMfaConfigType
        include JSON::Serializable

        # The SMS authentication message that will be sent to users with the code they must sign in with. The
        # message must contain the {####} placeholder. Your user pool replaces the placeholder with the MFA
        # code. If this parameter isn't provided, your user pool sends a default message.

        @[JSON::Field(key: "SmsAuthenticationMessage")]
        getter sms_authentication_message : String?

        # User pool configuration for delivery of SMS messages with Amazon Simple Notification Service. To
        # send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon
        # Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services
        # account. You can set SmsConfiguration in CreateUserPool and UpdateUserPool , or in
        # SetUserPoolMfaConfig .

        @[JSON::Field(key: "SmsConfiguration")]
        getter sms_configuration : Types::SmsConfigurationType?

        def initialize(
          @sms_authentication_message : String? = nil,
          @sms_configuration : Types::SmsConfigurationType? = nil
        )
        end
      end

      # This exception is thrown when the software token time-based one-time password (TOTP) multi-factor
      # authentication (MFA) isn't activated for the user pool.

      struct SoftwareTokenMFANotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Settings for time-based one-time password (TOTP) multi-factor authentication (MFA) in a user pool.
      # Enables and disables availability of this feature.

      struct SoftwareTokenMfaConfigType
        include JSON::Serializable

        # The activation state of TOTP MFA.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # A user's preference for using time-based one-time password (TOTP) multi-factor authentication (MFA).
      # Turns TOTP MFA on and off, and can set TOTP as preferred when other MFA options are available. You
      # can't turn off TOTP MFA for any of your users when MFA is required in your user pool; you can only
      # set the type that your user prefers.

      struct SoftwareTokenMfaSettingsType
        include JSON::Serializable

        # Specifies whether software token MFA is activated. If an MFA type is activated for a user, the user
        # will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the
        # device has been trusted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies whether software token MFA is the preferred MFA method.

        @[JSON::Field(key: "PreferredMfa")]
        getter preferred_mfa : Bool?

        def initialize(
          @enabled : Bool? = nil,
          @preferred_mfa : Bool? = nil
        )
        end
      end

      # Represents the request to start the user import job.

      struct StartUserImportJobRequest
        include JSON::Serializable

        # The ID of a user import job that you previously created.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The ID of the user pool that you want to start importing users into.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @job_id : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server to the request to start the user import job.

      struct StartUserImportJobResponse
        include JSON::Serializable

        # The details of the user import job. Includes logging destination, status, and the Amazon S3
        # pre-signed URL for CSV upload.

        @[JSON::Field(key: "UserImportJob")]
        getter user_import_job : Types::UserImportJobType?

        def initialize(
          @user_import_job : Types::UserImportJobType? = nil
        )
        end
      end


      struct StartWebAuthnRegistrationRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        def initialize(
          @access_token : String
        )
        end
      end


      struct StartWebAuthnRegistrationResponse
        include JSON::Serializable

        # The information that a user can provide in their request to register with their passkey provider.

        @[JSON::Field(key: "CredentialCreationOptions")]
        getter credential_creation_options : Types::Document

        def initialize(
          @credential_creation_options : Types::Document
        )
        end
      end

      # Represents the request to stop the user import job.

      struct StopUserImportJobRequest
        include JSON::Serializable

        # The ID of a running user import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The ID of the user pool that you want to stop.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @job_id : String,
          @user_pool_id : String
        )
        end
      end

      # Represents the response from the server to the request to stop the user import job.

      struct StopUserImportJobResponse
        include JSON::Serializable

        # The details of the user import job. Includes logging destination, status, and the Amazon S3
        # pre-signed URL for CSV upload.

        @[JSON::Field(key: "UserImportJob")]
        getter user_import_job : Types::UserImportJobType?

        def initialize(
          @user_import_job : Types::UserImportJobType? = nil
        )
        end
      end

      # The minimum and maximum length values of an attribute that is of the string type, for example
      # custom:department .

      struct StringAttributeConstraintsType
        include JSON::Serializable

        # The maximum length of a string attribute value. Must be a number less than or equal to 2^1023 ,
        # represented as a string with a length of 131072 characters or fewer.

        @[JSON::Field(key: "MaxLength")]
        getter max_length : String?

        # The minimum length of a string attribute value.

        @[JSON::Field(key: "MinLength")]
        getter min_length : String?

        def initialize(
          @max_length : String? = nil,
          @min_length : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user pool to assign the tags to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An array of tag keys and values that you want to assign to the user pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The details of a set of terms documents. For more information, see Terms documents .

      struct TermsDescriptionType
        include JSON::Serializable

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # This parameter is reserved for future use and currently accepts one value.

        @[JSON::Field(key: "Enforcement")]
        getter enforcement : String

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time

        # The ID of the requested terms documents.

        @[JSON::Field(key: "TermsId")]
        getter terms_id : String

        # The type and friendly name of the requested terms documents.

        @[JSON::Field(key: "TermsName")]
        getter terms_name : String

        def initialize(
          @creation_date : Time,
          @enforcement : String,
          @last_modified_date : Time,
          @terms_id : String,
          @terms_name : String
        )
        end
      end

      # Terms document names must be unique to the app client. This exception is thrown when you attempt to
      # create terms documents with a duplicate TermsName .

      struct TermsExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of a set of terms documents. For more information, see Terms documents .

      struct TermsType
        include JSON::Serializable

        # The ID of the app client that the terms documents are assigned to.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # This parameter is reserved for future use and currently accepts one value.

        @[JSON::Field(key: "Enforcement")]
        getter enforcement : String

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time

        # A map of URLs to languages. For each localized language that will view the requested TermsName ,
        # assign a URL. A selection of cognito:default displays for all languages that don't have a
        # language-specific URL. For example, "cognito:default": "https://terms.example.com",
        # "cognito:spanish": "https://terms.example.com/es" .

        @[JSON::Field(key: "Links")]
        getter links : Hash(String, String)

        # The ID of the terms documents.

        @[JSON::Field(key: "TermsId")]
        getter terms_id : String

        # The type and friendly name of the terms documents.

        @[JSON::Field(key: "TermsName")]
        getter terms_name : String

        # This parameter is reserved for future use and currently accepts one value.

        @[JSON::Field(key: "TermsSource")]
        getter terms_source : String

        # The ID of the user pool that contains the terms documents.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        def initialize(
          @client_id : String,
          @creation_date : Time,
          @enforcement : String,
          @last_modified_date : Time,
          @links : Hash(String, String),
          @terms_id : String,
          @terms_name : String,
          @terms_source : String,
          @user_pool_id : String
        )
        end
      end

      # This exception is thrown when you've attempted to change your feature plan but the operation isn't
      # permitted.

      struct TierChangeNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The time units that, with IdTokenValidity , AccessTokenValidity , and RefreshTokenValidity , set and
      # display the duration of ID, access, and refresh tokens for an app client. You can assign a separate
      # token validity unit to each type of token.

      struct TokenValidityUnitsType
        include JSON::Serializable

        # A time unit for the value that you set in the AccessTokenValidity parameter. The default
        # AccessTokenValidity time unit is hours . AccessTokenValidity duration can range from five minutes to
        # one day.

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        # A time unit for the value that you set in the IdTokenValidity parameter. The default IdTokenValidity
        # time unit is hours . IdTokenValidity duration can range from five minutes to one day.

        @[JSON::Field(key: "IdToken")]
        getter id_token : String?

        # A time unit for the value that you set in the RefreshTokenValidity parameter. The default
        # RefreshTokenValidity time unit is days . RefreshTokenValidity duration can range from 60 minutes to
        # 10 years.

        @[JSON::Field(key: "RefreshToken")]
        getter refresh_token : String?

        def initialize(
          @access_token : String? = nil,
          @id_token : String? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # This exception is thrown when the user has made too many failed attempts for a given action, such as
      # sign-in.

      struct TooManyFailedAttemptsException
        include JSON::Serializable

        # The message returned when Amazon Cognito returns a TooManyFailedAttempts exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the user has made too many requests for a given operation.

      struct TooManyRequestsException
        include JSON::Serializable

        # The message returned when the Amazon Cognito service returns a too many requests exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A container for the UI customization information for the hosted UI in a user pool.

      struct UICustomizationType
        include JSON::Serializable

        # The CSS values in the UI customization.

        @[JSON::Field(key: "CSS")]
        getter css : String?

        # The CSS version number.

        @[JSON::Field(key: "CSSVersion")]
        getter css_version : String?

        # The app client ID for your UI customization. When this value isn't present, the customization
        # applies to all user pool app clients that don't have client-level settings..

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A URL path to the hosted logo image of your UI customization.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The ID of the user pool with hosted UI customizations.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @css : String? = nil,
          @css_version : String? = nil,
          @client_id : String? = nil,
          @creation_date : Time? = nil,
          @image_url : String? = nil,
          @last_modified_date : Time? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # Exception that is thrown when the request isn't authorized. This can happen due to an invalid access
      # token in the request.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when Amazon Cognito encounters an unexpected exception with Lambda.

      struct UnexpectedLambdaException
        include JSON::Serializable

        # The message returned when Amazon Cognito returns an unexpected Lambda exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the specified identifier isn't supported.

      struct UnsupportedIdentityProviderException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that is thrown when you attempt to perform an operation that isn't enabled for the user
      # pool client.

      struct UnsupportedOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that is thrown when an unsupported token is passed to an operation.

      struct UnsupportedTokenTypeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because the user is in an unsupported state.

      struct UnsupportedUserStateException
        include JSON::Serializable

        # The message returned when the user is in an unsupported state.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An array of tag keys that you want to remove from the user pool.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAuthEventFeedbackRequest
        include JSON::Serializable

        # The ID of the authentication event that you want to submit feedback for.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The feedback token, an encrypted object generated by Amazon Cognito and passed to your user in the
        # notification email message from the event.

        @[JSON::Field(key: "FeedbackToken")]
        getter feedback_token : String

        # Your feedback to the authentication event. When you provide a FeedbackValue value of valid , you
        # tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of
        # risk. When you provide a FeedbackValue value of invalid , you tell Amazon Cognito that you don't
        # trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.

        @[JSON::Field(key: "FeedbackValue")]
        getter feedback_value : String

        # The ID of the user pool where you want to update auth event feedback.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The name of the user that you want to query or modify. The value of this parameter is typically your
        # user's username, but it can be any of their alias attributes. If username isn't an alias attribute
        # in your user pool, this value must be the sub of a local user or the username of a user from a
        # third-party IdP.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @event_id : String,
          @feedback_token : String,
          @feedback_value : String,
          @user_pool_id : String,
          @username : String
        )
        end
      end


      struct UpdateAuthEventFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the request to update the device status.

      struct UpdateDeviceStatusRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The device key of the device you want to update, for example
        # us-west-2_a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 .

        @[JSON::Field(key: "DeviceKey")]
        getter device_key : String

        # To enable device authentication with the specified device, set to remembered .To disable, set to
        # not_remembered .

        @[JSON::Field(key: "DeviceRememberedStatus")]
        getter device_remembered_status : String?

        def initialize(
          @access_token : String,
          @device_key : String,
          @device_remembered_status : String? = nil
        )
        end
      end

      # The response to the request to update the device status.

      struct UpdateDeviceStatusResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateGroupRequest
        include JSON::Serializable

        # The name of the group that you want to update.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The ID of the user pool that contains the group you want to update.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A new description of the existing group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A non-negative integer value that specifies the precedence of this group relative to the other
        # groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with
        # lower Precedence values take precedence over groups with higher or null Precedence values. If a user
        # belongs to two or more groups, it is the group with the lowest precedence value whose role ARN is
        # given in the user's tokens for the cognito:roles and cognito:preferred_role claims. Two groups can
        # have the same Precedence value. If this happens, neither group takes precedence over the other. If
        # two groups with the same Precedence have the same role ARN, that role is used in the
        # cognito:preferred_role claim in tokens for users in each group. If the two groups have different
        # role ARNs, the cognito:preferred_role claim isn't set in users' tokens. The default Precedence value
        # is null. The maximum Precedence value is 2^31-1 .

        @[JSON::Field(key: "Precedence")]
        getter precedence : Int32?

        # The Amazon Resource Name (ARN) of an IAM role that you want to associate with the group. The role
        # assignment contributes to the cognito:roles and cognito:preferred_role claims in group members'
        # tokens.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @group_name : String,
          @user_pool_id : String,
          @description : String? = nil,
          @precedence : Int32? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateGroupResponse
        include JSON::Serializable

        # Contains the updated details of the group, including precedence, IAM role, and description.

        @[JSON::Field(key: "Group")]
        getter group : Types::GroupType?

        def initialize(
          @group : Types::GroupType? = nil
        )
        end
      end


      struct UpdateIdentityProviderRequest
        include JSON::Serializable

        # The name of the IdP that you want to update. You can pass the identity provider name in the
        # identity_provider query parameter of requests to the Authorize endpoint to silently redirect to
        # sign-in with the associated IdP.

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String

        # The Id of the user pool where you want to update your IdP.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # A mapping of IdP attributes to standard and custom user pool attributes. Specify a user pool
        # attribute as the key of the key-value pair, and the IdP attribute claim name as the value.

        @[JSON::Field(key: "AttributeMapping")]
        getter attribute_mapping : Hash(String, String)?

        # An array of IdP identifiers, for example "IdPIdentifiers": [ "MyIdP", "MyIdP2" ] . Identifiers are
        # friendly names that you can pass in the idp_identifier query parameter of requests to the Authorize
        # endpoint to silently redirect to sign-in with the associated IdP. Identifiers in a domain format
        # also enable the use of email-address matching with SAML providers .

        @[JSON::Field(key: "IdpIdentifiers")]
        getter idp_identifiers : Array(String)?

        # The scopes, URLs, and identifiers for your external identity provider. The following examples
        # describe the provider detail keys for each IdP type. These values and their schema are subject to
        # change. Social IdP authorize_scopes values must match the values listed here. OpenID Connect (OIDC)
        # Amazon Cognito accepts the following elements when it can't discover endpoint URLs from oidc_issuer
        # : attributes_url , authorize_url , jwks_uri , token_url . Create or update request:
        # "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url":
        # "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json",
        # "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" } Describe
        # response: "ProviderDetails": { "attributes_request_method": "GET", "attributes_url":
        # "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes":
        # "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id":
        # "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri":
        # "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com",
        # "token_url": "https://example.com/token" } SAML Create or update request with Metadata URL:
        # "ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256"
        # } Create or update request with Metadata file: "ProviderDetails": { "IDPInit": "true", "IDPSignout":
        # "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm":
        # "rsa-sha256" } The value of MetadataFile must be the plaintext metadata document with all quote (")
        # characters escaped by backslashes. Describe response: "ProviderDetails": { "IDPInit": "true",
        # "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]",
        # "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm":
        # "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI":
        # "https://auth.example.com/sso/saml" } LoginWithAmazon Create or update request: "ProviderDetails": {
        # "authorize_scopes": "profile postal_code", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"
        # Describe response: "ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile",
        # "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code",
        # "authorize_url": "https://www.amazon.com/ap/oa", "client_id":
        # "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret",
        # "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" } Google Create
        # or update request: "ProviderDetails": { "authorize_scopes": "email profile openid", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }
        # Describe response: "ProviderDetails": { "attributes_url":
        # "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true",
        # "authorize_scopes": "email profile openid", "authorize_url":
        # "https://accounts.google.com/o/oauth2/v2/auth", "client_id":
        # "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret",
        # "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url":
        # "https://www.googleapis.com/oauth2/v4/token" } SignInWithApple Create or update request:
        # "ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito",
        # "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" } Describe response:
        # "ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name",
        # "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito",
        # "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE",
        # "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" } Facebook
        # Create or update request: "ProviderDetails": { "api_version": "v17.0", "authorize_scopes":
        # "public_profile, email", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret" } Describe response: "ProviderDetails": { "api_version": "v17.0",
        # "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes":
        # "true", "authorize_scopes": "public_profile, email", "authorize_url":
        # "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret":
        # "provider-app-client-secret", "token_request_method": "GET", "token_url":
        # "https://graph.facebook.com/v17.0/oauth/access_token" }

        @[JSON::Field(key: "ProviderDetails")]
        getter provider_details : Hash(String, String)?

        def initialize(
          @provider_name : String,
          @user_pool_id : String,
          @attribute_mapping : Hash(String, String)? = nil,
          @idp_identifiers : Array(String)? = nil,
          @provider_details : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateIdentityProviderResponse
        include JSON::Serializable

        # The identity provider details.

        @[JSON::Field(key: "IdentityProvider")]
        getter identity_provider : Types::IdentityProviderType

        def initialize(
          @identity_provider : Types::IdentityProviderType
        )
        end
      end


      struct UpdateManagedLoginBrandingRequest
        include JSON::Serializable

        # An array of image files that you want to apply to roles like backgrounds, logos, and icons. Each
        # object must also indicate whether it is for dark mode, light mode, or browser-adaptive mode.

        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::AssetType)?

        # The ID of the managed login branding style that you want to update.

        @[JSON::Field(key: "ManagedLoginBrandingId")]
        getter managed_login_branding_id : String?

        # A JSON file, encoded as a Document type, with the the settings that you want to apply to your style.
        # The following components are not currently implemented and reserved for future use: signUp
        # instructions sessionTimerDisplay languageSelector (for localization, see Managed login localization)

        @[JSON::Field(key: "Settings")]
        getter settings : Types::Document?

        # When true , applies the default branding style options. This option reverts to default style options
        # that are managed by Amazon Cognito. You can modify them later in the branding editor. When you
        # specify true for this option, you must also omit values for Settings and Assets in the request.

        @[JSON::Field(key: "UseCognitoProvidedValues")]
        getter use_cognito_provided_values : Bool?

        # The ID of the user pool that contains the managed login branding style that you want to update.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @assets : Array(Types::AssetType)? = nil,
          @managed_login_branding_id : String? = nil,
          @settings : Types::Document? = nil,
          @use_cognito_provided_values : Bool? = nil,
          @user_pool_id : String? = nil
        )
        end
      end


      struct UpdateManagedLoginBrandingResponse
        include JSON::Serializable

        # The details of the branding style that you updated.

        @[JSON::Field(key: "ManagedLoginBranding")]
        getter managed_login_branding : Types::ManagedLoginBrandingType?

        def initialize(
          @managed_login_branding : Types::ManagedLoginBrandingType? = nil
        )
        end
      end


      struct UpdateResourceServerRequest
        include JSON::Serializable

        # A unique resource server identifier for the resource server. The identifier can be an API friendly
        # name like solar-system-data . You can also set an API URL like
        # https://solar-system-data-api.example.com as your identifier. Amazon Cognito represents scopes in
        # the access token in the format $resource-server-identifier/$scope . Longer scope-identifier strings
        # increase the size of your access tokens.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The updated name of the resource server.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the user pool that contains the resource server that you want to update.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # An array of updated custom scope names and descriptions that you want to associate with your
        # resource server.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(Types::ResourceServerScopeType)?

        def initialize(
          @identifier : String,
          @name : String,
          @user_pool_id : String,
          @scopes : Array(Types::ResourceServerScopeType)? = nil
        )
        end
      end


      struct UpdateResourceServerResponse
        include JSON::Serializable

        # The updated details of the requested resource server.

        @[JSON::Field(key: "ResourceServer")]
        getter resource_server : Types::ResourceServerType

        def initialize(
          @resource_server : Types::ResourceServerType
        )
        end
      end


      struct UpdateTermsRequest
        include JSON::Serializable

        # The ID of the terms document that you want to update.

        @[JSON::Field(key: "TermsId")]
        getter terms_id : String

        # The ID of the user pool that contains the terms that you want to update.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # This parameter is reserved for future use and currently accepts only one value.

        @[JSON::Field(key: "Enforcement")]
        getter enforcement : String?

        # A map of URLs to languages. For each localized language that will view the requested TermsName ,
        # assign a URL. A selection of cognito:default displays for all languages that don't have a
        # language-specific URL. For example, "cognito:default": "https://terms.example.com",
        # "cognito:spanish": "https://terms.example.com/es" .

        @[JSON::Field(key: "Links")]
        getter links : Hash(String, String)?

        # The new name that you want to apply to the requested terms documents.

        @[JSON::Field(key: "TermsName")]
        getter terms_name : String?

        # This parameter is reserved for future use and currently accepts only one value.

        @[JSON::Field(key: "TermsSource")]
        getter terms_source : String?

        def initialize(
          @terms_id : String,
          @user_pool_id : String,
          @enforcement : String? = nil,
          @links : Hash(String, String)? = nil,
          @terms_name : String? = nil,
          @terms_source : String? = nil
        )
        end
      end


      struct UpdateTermsResponse
        include JSON::Serializable

        # A summary of the updates to your terms documents.

        @[JSON::Field(key: "Terms")]
        getter terms : Types::TermsType?

        def initialize(
          @terms : Types::TermsType? = nil
        )
        end
      end

      # Represents the request to update user attributes.

      struct UpdateUserAttributesRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # An array of name-value pairs representing user attributes. For custom attributes, you must add a
        # custom: prefix to the attribute name. If you have set an attribute to require verification before
        # Amazon Cognito updates its value, this request doesn’t immediately update the value of that
        # attribute. After your user receives and responds to a verification message to verify the new value,
        # Amazon Cognito updates the attribute value. Your user can sign in and receive messages with the
        # original attribute value until they verify the new value.

        @[JSON::Field(key: "UserAttributes")]
        getter user_attributes : Array(Types::AttributeType)

        # A map of custom key-value pairs that you can provide as input for any custom workflows that this
        # action initiates. You create custom workflows by assigning Lambda functions to user pool triggers.
        # When you use the UpdateUserAttributes API action, Amazon Cognito invokes the function that is
        # assigned to the custom message trigger. When Amazon Cognito invokes this function, it passes a JSON
        # payload, which the function receives as input. This payload contains a clientMetadata attribute,
        # which provides the data that you assigned to the ClientMetadata parameter in your
        # UpdateUserAttributes request. In your function code in Lambda, you can process the clientMetadata
        # value to enhance your workflow for your specific needs. For more information, see Using Lambda
        # triggers in the Amazon Cognito Developer Guide . When you use the ClientMetadata parameter, note
        # that Amazon Cognito won't do the following: Store the ClientMetadata value. This data is available
        # only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user
        # pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.
        # Validate the ClientMetadata value. Encrypt the ClientMetadata value. Don't send sensitive
        # information in this parameter.

        @[JSON::Field(key: "ClientMetadata")]
        getter client_metadata : Hash(String, String)?

        def initialize(
          @access_token : String,
          @user_attributes : Array(Types::AttributeType),
          @client_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response from the server for the request to update user attributes.

      struct UpdateUserAttributesResponse
        include JSON::Serializable

        # When the attribute-update request includes an email address or phone number attribute, Amazon
        # Cognito sends a message to users with a code that confirms ownership of the new value that they
        # entered. The CodeDeliveryDetails object is information about the delivery destination for that link
        # or code. This behavior happens in user pools configured to automatically verify changes to those
        # attributes. For more information, see Verifying when users change their email or phone number .

        @[JSON::Field(key: "CodeDeliveryDetailsList")]
        getter code_delivery_details_list : Array(Types::CodeDeliveryDetailsType)?

        def initialize(
          @code_delivery_details_list : Array(Types::CodeDeliveryDetailsType)? = nil
        )
        end
      end

      # Represents the request to update the user pool client.

      struct UpdateUserPoolClientRequest
        include JSON::Serializable

        # The ID of the app client that you want to update.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The ID of the user pool where you want to update the app client.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The access token time limit. After this limit expires, your user can't use their access token. To
        # specify the time unit for AccessTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set AccessTokenValidity to 10
        # and TokenValidityUnits to hours , your user can authorize access with their access token for 10
        # hours. The default time unit for AccessTokenValidity in an API request is hours. Valid range is
        # displayed below in seconds. If you don't specify otherwise in the configuration of your app client,
        # your access tokens are valid for one hour.

        @[JSON::Field(key: "AccessTokenValidity")]
        getter access_token_validity : Int32?

        # The OAuth grant types that you want your app client to generate. To create an app client that
        # generates client credentials grants, you must add client_credentials as the only allowed OAuth flow.
        # code Use a code grant flow, which provides an authorization code as the response. This code can be
        # exchanged for access tokens with the /oauth2/token endpoint. implicit Issue the access token (and,
        # optionally, ID token, based on scopes) directly to your user. client_credentials Issue the access
        # token from the /oauth2/token endpoint directly to a non-person user using a combination of the
        # client ID and client secret.

        @[JSON::Field(key: "AllowedOAuthFlows")]
        getter allowed_o_auth_flows : Array(String)?

        # Set to true to use OAuth 2.0 authorization server features in your app client. This parameter must
        # have a value of true before you can configure the following features in your app client.
        # CallBackURLs : Callback URLs. LogoutURLs : Sign-out redirect URLs. AllowedOAuthScopes : OAuth 2.0
        # scopes. AllowedOAuthFlows : Support for authorization code, implicit, and client credentials OAuth
        # 2.0 grants. To use authorization server features, configure one of these features in the Amazon
        # Cognito console or set AllowedOAuthFlowsUserPoolClient to true in a CreateUserPoolClient or
        # UpdateUserPoolClient API request. If you don't set a value for AllowedOAuthFlowsUserPoolClient in a
        # request with the CLI or SDKs, it defaults to false . When false , only SDK-based API sign-in is
        # permitted.

        @[JSON::Field(key: "AllowedOAuthFlowsUserPoolClient")]
        getter allowed_o_auth_flows_user_pool_client : Bool?

        # The OAuth, OpenID Connect (OIDC), and custom scopes that you want to permit your app client to
        # authorize access with. Scopes govern access control to user pool self-service API operations, user
        # data from the userInfo endpoint, and third-party APIs. Scope values include phone , email , openid ,
        # and profile . The aws.cognito.signin.user.admin scope authorizes user self-service operations.
        # Custom scopes with resource servers authorize access to external APIs.

        @[JSON::Field(key: "AllowedOAuthScopes")]
        getter allowed_o_auth_scopes : Array(String)?

        # The user pool analytics configuration for collecting metrics and sending them to your Amazon
        # Pinpoint campaign. In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools
        # might not have access to analytics or might be configurable with campaigns in the US East (N.
        # Virginia) Region. For more information, see Using Amazon Pinpoint analytics .

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration : Types::AnalyticsConfigurationType?

        # Amazon Cognito creates a session token for each API request in an authentication flow.
        # AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user
        # must respond to each authentication challenge before the session expires.

        @[JSON::Field(key: "AuthSessionValidity")]
        getter auth_session_validity : Int32?

        # A list of allowed redirect, or callback, URLs for managed login authentication. These URLs are the
        # paths where you want to send your users' browsers after they complete authentication with managed
        # login or a third-party IdP. Typically, callback URLs are the home of an application that uses OAuth
        # or OIDC libraries to process authentication outcomes. A redirect URI must meet the following
        # requirements: Be an absolute URI. Be registered with the authorization server. Amazon Cognito
        # doesn't accept authorization requests with redirect_uri values that aren't in the list of
        # CallbackURLs that you provide in this parameter. Not include a fragment component. See OAuth 2.0 -
        # Redirection Endpoint . Amazon Cognito requires HTTPS over HTTP except for http://localhost for
        # testing purposes only. App callback URLs such as myapp://example are also supported.

        @[JSON::Field(key: "CallbackURLs")]
        getter callback_ur_ls : Array(String)?

        # A friendly name for the app client.

        @[JSON::Field(key: "ClientName")]
        getter client_name : String?

        # The default redirect URI. In app clients with one assigned IdP, replaces redirect_uri in
        # authentication requests. Must be in the CallbackURLs list.

        @[JSON::Field(key: "DefaultRedirectURI")]
        getter default_redirect_uri : String?

        # When true , your application can include additional UserContextData in authentication requests. This
        # data includes the IP address, and contributes to analysis by threat protection features. For more
        # information about propagation of user context data, see Adding session data to API requests . If you
        # don’t include this parameter, you can't send the source IP address to Amazon Cognito threat
        # protection features. You can only activate EnablePropagateAdditionalUserContextData in an app client
        # that has a client secret.

        @[JSON::Field(key: "EnablePropagateAdditionalUserContextData")]
        getter enable_propagate_additional_user_context_data : Bool?

        # Activates or deactivates token revocation in the target app client.

        @[JSON::Field(key: "EnableTokenRevocation")]
        getter enable_token_revocation : Bool?

        # The authentication flows that you want your user pool client to support. For each app client in your
        # user pool, you can sign in your users with any combination of one or more flows, including with a
        # user name and Secure Remote Password (SRP), a user name and password, or a custom authentication
        # process that you define with Lambda functions. If you don't specify a value for ExplicitAuthFlows ,
        # your app client supports ALLOW_REFRESH_TOKEN_AUTH , ALLOW_USER_SRP_AUTH , and ALLOW_CUSTOM_AUTH .
        # The values for authentication flow options include the following. ALLOW_USER_AUTH : Enable
        # selection-based sign-in with USER_AUTH . This setting covers username-password, secure remote
        # password (SRP), passwordless, and passkey authentication. This authentiation flow can do
        # username-password and SRP authentication without other ExplicitAuthFlows permitting them. For
        # example users can complete an SRP challenge through USER_AUTH without the flow USER_SRP_AUTH being
        # active for the app client. This flow doesn't include CUSTOM_AUTH . To activate this setting, your
        # user pool must be in the Essentials tier or higher. ALLOW_ADMIN_USER_PASSWORD_AUTH : Enable admin
        # based user password authentication flow ADMIN_USER_PASSWORD_AUTH . This setting replaces the
        # ADMIN_NO_SRP_AUTH setting. With this authentication flow, your app passes a user name and password
        # to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to
        # securely transmit the password. ALLOW_CUSTOM_AUTH : Enable Lambda trigger based authentication.
        # ALLOW_USER_PASSWORD_AUTH : Enable user password-based authentication. In this flow, Amazon Cognito
        # receives the password in the request instead of using the SRP protocol to verify passwords.
        # ALLOW_USER_SRP_AUTH : Enable SRP-based authentication. ALLOW_REFRESH_TOKEN_AUTH : Enable authflow to
        # refresh tokens. In some environments, you will see the values ADMIN_NO_SRP_AUTH ,
        # CUSTOM_AUTH_FLOW_ONLY , or USER_PASSWORD_AUTH . You can't assign these legacy ExplicitAuthFlows
        # values to user pool clients at the same time as values that begin with ALLOW_ , like
        # ALLOW_USER_SRP_AUTH .

        @[JSON::Field(key: "ExplicitAuthFlows")]
        getter explicit_auth_flows : Array(String)?

        # The ID token time limit. After this limit expires, your user can't use their ID token. To specify
        # the time unit for IdTokenValidity as seconds , minutes , hours , or days , set a TokenValidityUnits
        # value in your API request. For example, when you set IdTokenValidity as 10 and TokenValidityUnits as
        # hours , your user can authenticate their session with their ID token for 10 hours. The default time
        # unit for IdTokenValidity in an API request is hours. Valid range is displayed below in seconds. If
        # you don't specify otherwise in the configuration of your app client, your ID tokens are valid for
        # one hour.

        @[JSON::Field(key: "IdTokenValidity")]
        getter id_token_validity : Int32?

        # A list of allowed logout URLs for managed login authentication. When you pass logout_uri and
        # client_id parameters to /logout , Amazon Cognito signs out your user and redirects them to the
        # logout URL. This parameter describes the URLs that you want to be the permitted targets of
        # logout_uri . A typical use of these URLs is when a user selects "Sign out" and you redirect them to
        # your public homepage. For more information, see Logout endpoint .

        @[JSON::Field(key: "LogoutURLs")]
        getter logout_ur_ls : Array(String)?

        # When ENABLED , suppresses messages that might indicate a valid user exists when someone attempts
        # sign-in. This parameters sets your preference for the errors and responses that you want Amazon
        # Cognito APIs to return during authentication, account confirmation, and password recovery when the
        # user doesn't exist in the user pool. When set to ENABLED and the user doesn't exist, authentication
        # returns an error indicating either the username or password was incorrect. Account confirmation and
        # password recovery return a response indicating a code was sent to a simulated destination. When set
        # to LEGACY , those APIs return a UserNotFoundException exception if the user doesn't exist in the
        # user pool. Defaults to LEGACY .

        @[JSON::Field(key: "PreventUserExistenceErrors")]
        getter prevent_user_existence_errors : String?

        # The list of user attributes that you want your app client to have read access to. After your user
        # authenticates in your app, their access token authorizes them to read their own attribute value for
        # any attribute in this list. When you don't specify the ReadAttributes for your app client, your app
        # can read the values of email_verified , phone_number_verified , and the standard attributes of your
        # user pool. When your user pool app client has read access to these default attributes,
        # ReadAttributes doesn't return any information. Amazon Cognito only populates ReadAttributes in the
        # API response if you have specified your own custom set of read attributes.

        @[JSON::Field(key: "ReadAttributes")]
        getter read_attributes : Array(String)?

        # The configuration of your app client for refresh token rotation. When enabled, your app client
        # issues new ID, access, and refresh tokens when users renew their sessions with refresh tokens. When
        # disabled, token refresh issues only ID and access tokens.

        @[JSON::Field(key: "RefreshTokenRotation")]
        getter refresh_token_rotation : Types::RefreshTokenRotationType?

        # The refresh token time limit. After this limit expires, your user can't use their refresh token. To
        # specify the time unit for RefreshTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set RefreshTokenValidity as 10
        # and TokenValidityUnits as days , your user can refresh their session and retrieve new access and ID
        # tokens for 10 days. The default time unit for RefreshTokenValidity in an API request is days. You
        # can't set RefreshTokenValidity to 0. If you do, Amazon Cognito overrides the value with the default
        # value of 30 days. Valid range is displayed below in seconds. If you don't specify otherwise in the
        # configuration of your app client, your refresh tokens are valid for 30 days.

        @[JSON::Field(key: "RefreshTokenValidity")]
        getter refresh_token_validity : Int32?

        # A list of provider names for the identity providers (IdPs) that are supported on this client. The
        # following are supported: COGNITO , Facebook , Google , SignInWithApple , and LoginWithAmazon . You
        # can also specify the names that you configured for the SAML and OIDC IdPs in your user pool, for
        # example MySAMLIdP or MyOIDCIdP . This parameter sets the IdPs that managed login will display on the
        # login page for your app client. The removal of COGNITO from this list doesn't prevent authentication
        # operations for local users with the user pools API in an Amazon Web Services SDK. The only way to
        # prevent SDK-based authentication is to block access with a WAF rule .

        @[JSON::Field(key: "SupportedIdentityProviders")]
        getter supported_identity_providers : Array(String)?

        # The units that validity times are represented in. The default unit for refresh tokens is days, and
        # the default for ID and access tokens are hours.

        @[JSON::Field(key: "TokenValidityUnits")]
        getter token_validity_units : Types::TokenValidityUnitsType?

        # The list of user attributes that you want your app client to have write access to. After your user
        # authenticates in your app, their access token authorizes them to set or modify their own attribute
        # value for any attribute in this list. When you don't specify the WriteAttributes for your app
        # client, your app can write the values of the Standard attributes of your user pool. When your user
        # pool has write access to these default attributes, WriteAttributes doesn't return any information.
        # Amazon Cognito only populates WriteAttributes in the API response if you have specified your own
        # custom set of write attributes. If your app client allows users to sign in through an IdP, this
        # array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates
        # mapped attributes when users sign in to your application through an IdP. If your app client does not
        # have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the
        # attribute. For more information, see Specifying IdP Attribute Mappings for Your user pool .

        @[JSON::Field(key: "WriteAttributes")]
        getter write_attributes : Array(String)?

        def initialize(
          @client_id : String,
          @user_pool_id : String,
          @access_token_validity : Int32? = nil,
          @allowed_o_auth_flows : Array(String)? = nil,
          @allowed_o_auth_flows_user_pool_client : Bool? = nil,
          @allowed_o_auth_scopes : Array(String)? = nil,
          @analytics_configuration : Types::AnalyticsConfigurationType? = nil,
          @auth_session_validity : Int32? = nil,
          @callback_ur_ls : Array(String)? = nil,
          @client_name : String? = nil,
          @default_redirect_uri : String? = nil,
          @enable_propagate_additional_user_context_data : Bool? = nil,
          @enable_token_revocation : Bool? = nil,
          @explicit_auth_flows : Array(String)? = nil,
          @id_token_validity : Int32? = nil,
          @logout_ur_ls : Array(String)? = nil,
          @prevent_user_existence_errors : String? = nil,
          @read_attributes : Array(String)? = nil,
          @refresh_token_rotation : Types::RefreshTokenRotationType? = nil,
          @refresh_token_validity : Int32? = nil,
          @supported_identity_providers : Array(String)? = nil,
          @token_validity_units : Types::TokenValidityUnitsType? = nil,
          @write_attributes : Array(String)? = nil
        )
        end
      end

      # Represents the response from the server to the request to update the user pool client.

      struct UpdateUserPoolClientResponse
        include JSON::Serializable

        # The updated details of your app client.

        @[JSON::Field(key: "UserPoolClient")]
        getter user_pool_client : Types::UserPoolClientType?

        def initialize(
          @user_pool_client : Types::UserPoolClientType? = nil
        )
        end
      end

      # The UpdateUserPoolDomain request input.

      struct UpdateUserPoolDomainRequest
        include JSON::Serializable

        # The name of the domain that you want to update. For custom domains, this is the fully-qualified
        # domain name, for example auth.example.com . For prefix domains, this is the prefix alone, such as
        # myprefix .

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The ID of the user pool that is associated with the domain you're updating.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The configuration for a custom domain that hosts managed login for your application. In an
        # UpdateUserPoolDomain request, this parameter specifies an SSL certificate for the managed login
        # hosted webserver. The certificate must be an ACM ARN in us-east-1 . When you create a custom domain,
        # the passkey RP ID defaults to the custom domain. If you had a prefix domain active, this will cause
        # passkey integration for your prefix domain to stop working due to a mismatch in RP ID. To keep the
        # prefix domain passkey integration working, you can explicitly set RP ID to the prefix domain.

        @[JSON::Field(key: "CustomDomainConfig")]
        getter custom_domain_config : Types::CustomDomainConfigType?

        # A version number that indicates the state of managed login for your domain. Version 1 is hosted UI
        # (classic). Version 2 is the newer managed login with the branding editor. For more information, see
        # Managed login .

        @[JSON::Field(key: "ManagedLoginVersion")]
        getter managed_login_version : Int32?

        def initialize(
          @domain : String,
          @user_pool_id : String,
          @custom_domain_config : Types::CustomDomainConfigType? = nil,
          @managed_login_version : Int32? = nil
        )
        end
      end

      # The UpdateUserPoolDomain response output.

      struct UpdateUserPoolDomainResponse
        include JSON::Serializable

        # The fully-qualified domain name (FQDN) of the Amazon CloudFront distribution that hosts your managed
        # login or classic hosted UI pages. You domain-name authority must have an alias record that points
        # requests for your custom domain to this FQDN. Amazon Cognito returns this value if you set a custom
        # domain with CustomDomainConfig . If you set an Amazon Cognito prefix domain, this operation returns
        # a blank response.

        @[JSON::Field(key: "CloudFrontDomain")]
        getter cloud_front_domain : String?

        # A version number that indicates the state of managed login for your domain. Version 1 is hosted UI
        # (classic). Version 2 is the newer managed login with the branding editor. For more information, see
        # Managed login .

        @[JSON::Field(key: "ManagedLoginVersion")]
        getter managed_login_version : Int32?

        def initialize(
          @cloud_front_domain : String? = nil,
          @managed_login_version : Int32? = nil
        )
        end
      end

      # Represents the request to update the user pool.

      struct UpdateUserPoolRequest
        include JSON::Serializable

        # The ID of the user pool you want to update.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String

        # The available verified method a user can use to recover their password when they call ForgotPassword
        # . You can use this setting to define a preferred method when a user has more than one method
        # available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the
        # user also has SMS multi-factor authentication (MFA) activated. In the absence of this setting,
        # Amazon Cognito uses the legacy behavior to determine the recovery method where SMS is preferred
        # through email.

        @[JSON::Field(key: "AccountRecoverySetting")]
        getter account_recovery_setting : Types::AccountRecoverySettingType?

        # The configuration for administrative creation of users. Includes the template for the invitation
        # message for new users, the duration of temporary passwords, and permitting self-service sign-up.

        @[JSON::Field(key: "AdminCreateUserConfig")]
        getter admin_create_user_config : Types::AdminCreateUserConfigType?

        # The attributes that you want your user pool to automatically verify. Possible values: email ,
        # phone_number . For more information see Verifying contact information at sign-up .

        @[JSON::Field(key: "AutoVerifiedAttributes")]
        getter auto_verified_attributes : Array(String)?

        # When active, DeletionProtection prevents accidental deletion of your user pool. Before you can
        # delete a user pool that you have protected against deletion, you must deactivate this feature. When
        # you try to delete a protected user pool in a DeleteUserPool API request, Amazon Cognito returns an
        # InvalidParameterException error. To delete a protected user pool, send a new DeleteUserPool request
        # after you deactivate deletion protection in an UpdateUserPool API request.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : String?

        # The device-remembering configuration for a user pool. Device remembering or device tracking is a
        # "Remember me on this device" option for user pools that perform authentication with the device key
        # of a trusted device in the back end, instead of a user-provided MFA code. For more information about
        # device authentication, see Working with user devices in your user pool . A null value indicates that
        # you have deactivated device remembering in your user pool. When you provide a value for any
        # DeviceConfiguration field, you activate the Amazon Cognito device-remembering feature. For more
        # information, see Working with devices .

        @[JSON::Field(key: "DeviceConfiguration")]
        getter device_configuration : Types::DeviceConfigurationType?

        # The email configuration of your user pool. The email configuration type sets your preferred sending
        # method, Amazon Web Services Region, and sender for email invitation and verification messages from
        # your user pool.

        @[JSON::Field(key: "EmailConfiguration")]
        getter email_configuration : Types::EmailConfigurationType?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationMessage")]
        getter email_verification_message : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationSubject")]
        getter email_verification_subject : String?

        # A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible
        # stages of authentication operations. Triggers can modify the outcome of the operations that invoked
        # them.

        @[JSON::Field(key: "LambdaConfig")]
        getter lambda_config : Types::LambdaConfigType?

        # Sets multi-factor authentication (MFA) to be on, off, or optional. When ON , all users must set up
        # MFA before they can sign in. When OPTIONAL , your application must make a client-side determination
        # of whether a user wants to register an MFA device. For user pools with adaptive authentication with
        # threat protection, choose OPTIONAL . When MfaConfiguration is OPTIONAL , managed login doesn't
        # automatically prompt users to set up MFA. Amazon Cognito generates MFA prompts in API responses and
        # in managed login for users who have chosen and configured a preferred MFA factor.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # The password policy and sign-in policy in the user pool. The password policy sets options like
        # password complexity requirements and password history. The sign-in policy sets the options available
        # to applications in choice-based authentication .

        @[JSON::Field(key: "Policies")]
        getter policies : Types::UserPoolPolicyType?

        # The updated name of your user pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        # The contents of the SMS message that your user pool sends to users in SMS authentication.

        @[JSON::Field(key: "SmsAuthenticationMessage")]
        getter sms_authentication_message : String?

        # The SMS configuration with the settings for your Amazon Cognito user pool to send SMS message with
        # Amazon Simple Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services
        # Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role
        # in your Amazon Web Services account. For more information see SMS message settings .

        @[JSON::Field(key: "SmsConfiguration")]
        getter sms_configuration : Types::SmsConfigurationType?

        # This parameter is no longer used.

        @[JSON::Field(key: "SmsVerificationMessage")]
        getter sms_verification_message : String?

        # The settings for updates to user attributes. These settings include the property
        # AttributesRequireVerificationBeforeUpdate , a user-pool setting that tells Amazon Cognito how to
        # handle changes to the value of your users' email address and phone number attributes. For more
        # information, see Verifying updates to email addresses and phone numbers .

        @[JSON::Field(key: "UserAttributeUpdateSettings")]
        getter user_attribute_update_settings : Types::UserAttributeUpdateSettingsType?

        # Contains settings for activation of threat protection, including the operating mode and additional
        # authentication types. To log user security information but take no action, set to AUDIT . To
        # configure automatic security responses to potentially unwanted traffic to your user pool, set to
        # ENFORCED . For more information, see Adding advanced security to a user pool . To activate this
        # setting, your user pool must be on the Plus tier .

        @[JSON::Field(key: "UserPoolAddOns")]
        getter user_pool_add_ons : Types::UserPoolAddOnsType?

        # The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize
        # and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.

        @[JSON::Field(key: "UserPoolTags")]
        getter user_pool_tags : Hash(String, String)?

        # The user pool feature plan , or tier. This parameter determines the eligibility of the user pool for
        # features like managed login, access-token customization, and threat protection. Defaults to
        # ESSENTIALS .

        @[JSON::Field(key: "UserPoolTier")]
        getter user_pool_tier : String?

        # The template for the verification message that your user pool delivers to users who set an email
        # address or phone number attribute. Set the email message type that corresponds to your
        # DefaultEmailOption selection. For CONFIRM_WITH_LINK , specify an EmailMessageByLink and leave
        # EmailMessage blank. For CONFIRM_WITH_CODE , specify an EmailMessage and leave EmailMessageByLink
        # blank. When you supply both parameters with either choice, Amazon Cognito returns an error.

        @[JSON::Field(key: "VerificationMessageTemplate")]
        getter verification_message_template : Types::VerificationMessageTemplateType?

        def initialize(
          @user_pool_id : String,
          @account_recovery_setting : Types::AccountRecoverySettingType? = nil,
          @admin_create_user_config : Types::AdminCreateUserConfigType? = nil,
          @auto_verified_attributes : Array(String)? = nil,
          @deletion_protection : String? = nil,
          @device_configuration : Types::DeviceConfigurationType? = nil,
          @email_configuration : Types::EmailConfigurationType? = nil,
          @email_verification_message : String? = nil,
          @email_verification_subject : String? = nil,
          @lambda_config : Types::LambdaConfigType? = nil,
          @mfa_configuration : String? = nil,
          @policies : Types::UserPoolPolicyType? = nil,
          @pool_name : String? = nil,
          @sms_authentication_message : String? = nil,
          @sms_configuration : Types::SmsConfigurationType? = nil,
          @sms_verification_message : String? = nil,
          @user_attribute_update_settings : Types::UserAttributeUpdateSettingsType? = nil,
          @user_pool_add_ons : Types::UserPoolAddOnsType? = nil,
          @user_pool_tags : Hash(String, String)? = nil,
          @user_pool_tier : String? = nil,
          @verification_message_template : Types::VerificationMessageTemplateType? = nil
        )
        end
      end

      # Represents the response from the server when you make a request to update the user pool.

      struct UpdateUserPoolResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The settings for updates to user attributes. These settings include the property
      # AttributesRequireVerificationBeforeUpdate , a user-pool setting that tells Amazon Cognito how to
      # handle changes to the value of your users' email address and phone number attributes. For more
      # information, see Verifying updates to email addresses and phone numbers .

      struct UserAttributeUpdateSettingsType
        include JSON::Serializable

        # Requires that your user verifies their email address, phone number, or both before Amazon Cognito
        # updates the value of that attribute. When you update a user attribute that has this option
        # activated, Amazon Cognito sends a verification message to the new phone number or email address.
        # Amazon Cognito doesn’t change the value of the attribute until your user responds to the
        # verification message and confirms the new value. When AttributesRequireVerificationBeforeUpdate is
        # false, your user pool doesn't require that your users verify attribute changes before Amazon Cognito
        # updates them. In a user pool where AttributesRequireVerificationBeforeUpdate is false, API
        # operations that change attribute values can immediately update a user’s email or phone_number
        # attribute.

        @[JSON::Field(key: "AttributesRequireVerificationBeforeUpdate")]
        getter attributes_require_verification_before_update : Array(String)?

        def initialize(
          @attributes_require_verification_before_update : Array(String)? = nil
        )
        end
      end

      # Contextual data, such as the user's device fingerprint, IP address, or location, used for evaluating
      # the risk of an unexpected event by Amazon Cognito threat protection.

      struct UserContextDataType
        include JSON::Serializable

        # Encoded device-fingerprint details that your app collected with the Amazon Cognito context data
        # collection library. For more information, see Adding user device and session data to API requests .

        @[JSON::Field(key: "EncodedData")]
        getter encoded_data : String?

        # The source IP address of your user's device.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        def initialize(
          @encoded_data : String? = nil,
          @ip_address : String? = nil
        )
        end
      end

      # This exception is thrown when you're trying to modify a user pool while a user import job is in
      # progress for that pool.

      struct UserImportInProgressException
        include JSON::Serializable

        # The message returned when the user pool has an import job running.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A user import job in a user pool. Describes the status of user import with a CSV file. For more
      # information, see Importing users into user pools from a CSV file .

      struct UserImportJobType
        include JSON::Serializable

        # The role Amazon Resource Name (ARN) for the Amazon CloudWatch Logging role for the user import job.
        # For more information, see "Creating the CloudWatch Logs IAM Role" in the Amazon Cognito Developer
        # Guide.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # The date when the user import job was completed.

        @[JSON::Field(key: "CompletionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completion_date : Time?

        # The message returned when the user import job is completed.

        @[JSON::Field(key: "CompletionMessage")]
        getter completion_message : String?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The number of users that couldn't be imported.

        @[JSON::Field(key: "FailedUsers")]
        getter failed_users : Int64?

        # The number of users that were successfully imported.

        @[JSON::Field(key: "ImportedUsers")]
        getter imported_users : Int64?

        # The ID of the user import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The friendly name of the user import job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The pre-signed URL target for uploading the CSV file.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String?

        # The number of users that were skipped.

        @[JSON::Field(key: "SkippedUsers")]
        getter skipped_users : Int64?

        # The date when the user import job was started.

        @[JSON::Field(key: "StartDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The status of the user import job. One of the following: Created - The job was created but not
        # started. Pending - A transition state. You have started the job, but it has not begun importing
        # users yet. InProgress - The job has started, and users are being imported. Stopping - You have
        # stopped the job, but the job has not stopped importing users yet. Stopped - You have stopped the
        # job, and the job has stopped importing users. Succeeded - The job has completed successfully. Failed
        # - The job has stopped due to an error. Expired - You created a job, but did not start the job within
        # 24-48 hours. All data associated with the job was deleted, and the job can't be started.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the user pool that the users are being imported into.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @cloud_watch_logs_role_arn : String? = nil,
          @completion_date : Time? = nil,
          @completion_message : String? = nil,
          @creation_date : Time? = nil,
          @failed_users : Int64? = nil,
          @imported_users : Int64? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @pre_signed_url : String? = nil,
          @skipped_users : Int64? = nil,
          @start_date : Time? = nil,
          @status : String? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # This exception is thrown when the Amazon Cognito service encounters a user validation exception with
      # the Lambda service.

      struct UserLambdaValidationException
        include JSON::Serializable

        # The message returned when the Amazon Cognito service returns a user validation exception with the
        # Lambda service.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a user isn't confirmed successfully.

      struct UserNotConfirmedException
        include JSON::Serializable

        # The message returned when a user isn't confirmed successfully.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a user isn't found.

      struct UserNotFoundException
        include JSON::Serializable

        # The message returned when a user isn't found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when user pool add-ons aren't enabled.

      struct UserPoolAddOnNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains settings for activation of threat protection, including the operating mode and additional
      # authentication types. To log user security information but take no action, set to AUDIT . To
      # configure automatic security responses to potentially unwanted traffic to your user pool, set to
      # ENFORCED . For more information, see Adding advanced security to a user pool . To activate this
      # setting, your user pool must be on the Plus tier .

      struct UserPoolAddOnsType
        include JSON::Serializable

        # The operating mode of threat protection for standard authentication types in your user pool,
        # including username-password and secure remote password (SRP) authentication.

        @[JSON::Field(key: "AdvancedSecurityMode")]
        getter advanced_security_mode : String

        # Threat protection configuration options for additional authentication types in your user pool,
        # including custom authentication.

        @[JSON::Field(key: "AdvancedSecurityAdditionalFlows")]
        getter advanced_security_additional_flows : Types::AdvancedSecurityAdditionalFlowsType?

        def initialize(
          @advanced_security_mode : String,
          @advanced_security_additional_flows : Types::AdvancedSecurityAdditionalFlowsType? = nil
        )
        end
      end

      # A short description of a user pool app client.

      struct UserPoolClientDescription
        include JSON::Serializable

        # The app client ID.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The app client name.

        @[JSON::Field(key: "ClientName")]
        getter client_name : String?

        # The ID of the user pool that's associated with the app client.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @client_id : String? = nil,
          @client_name : String? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # The configuration of a user pool client.

      struct UserPoolClientType
        include JSON::Serializable

        # The access token time limit. After this limit expires, your user can't use their access token. To
        # specify the time unit for AccessTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set AccessTokenValidity to 10
        # and TokenValidityUnits to hours , your user can authorize access with their access token for 10
        # hours. The default time unit for AccessTokenValidity in an API request is hours. Valid range is
        # displayed below in seconds. If you don't specify otherwise in the configuration of your app client,
        # your access tokens are valid for one hour.

        @[JSON::Field(key: "AccessTokenValidity")]
        getter access_token_validity : Int32?

        # The OAuth grant types that you want your app client to generate. To create an app client that
        # generates client credentials grants, you must add client_credentials as the only allowed OAuth flow.
        # code Use a code grant flow, which provides an authorization code as the response. This code can be
        # exchanged for access tokens with the /oauth2/token endpoint. implicit Issue the access token (and,
        # optionally, ID token, based on scopes) directly to your user. client_credentials Issue the access
        # token from the /oauth2/token endpoint directly to a non-person user using a combination of the
        # client ID and client secret.

        @[JSON::Field(key: "AllowedOAuthFlows")]
        getter allowed_o_auth_flows : Array(String)?

        # Set to true to use OAuth 2.0 authorization server features in your app client. This parameter must
        # have a value of true before you can configure the following features in your app client.
        # CallBackURLs : Callback URLs. LogoutURLs : Sign-out redirect URLs. AllowedOAuthScopes : OAuth 2.0
        # scopes. AllowedOAuthFlows : Support for authorization code, implicit, and client credentials OAuth
        # 2.0 grants. To use authorization server features, configure one of these features in the Amazon
        # Cognito console or set AllowedOAuthFlowsUserPoolClient to true in a CreateUserPoolClient or
        # UpdateUserPoolClient API request. If you don't set a value for AllowedOAuthFlowsUserPoolClient in a
        # request with the CLI or SDKs, it defaults to false . When false , only SDK-based API sign-in is
        # permitted.

        @[JSON::Field(key: "AllowedOAuthFlowsUserPoolClient")]
        getter allowed_o_auth_flows_user_pool_client : Bool?

        # The OAuth 2.0 scopes that you want your app client to support. Can include standard OAuth scopes
        # like phone , email , openid , and profile . Can also include the aws.cognito.signin.user.admin scope
        # that authorizes user profile self-service operations and custom scopes from resource servers.

        @[JSON::Field(key: "AllowedOAuthScopes")]
        getter allowed_o_auth_scopes : Array(String)?

        # The user pool analytics configuration for collecting metrics and sending them to your Amazon
        # Pinpoint campaign. In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools
        # only support sending events to Amazon Pinpoint projects in Amazon Web Services Region us-east-1. In
        # Regions where Amazon Pinpoint is available, user pools support sending events to Amazon Pinpoint
        # projects within that same Region.

        @[JSON::Field(key: "AnalyticsConfiguration")]
        getter analytics_configuration : Types::AnalyticsConfigurationType?

        # Amazon Cognito creates a session token for each API request in an authentication flow.
        # AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user
        # must respond to each authentication challenge before the session expires.

        @[JSON::Field(key: "AuthSessionValidity")]
        getter auth_session_validity : Int32?

        # A list of allowed redirect (callback) URLs for the IdPs. A redirect URI must: Be an absolute URI. Be
        # registered with the authorization server. Not include a fragment component. See OAuth 2.0 -
        # Redirection Endpoint . Amazon Cognito requires HTTPS over HTTP except for http://localhost for
        # testing purposes only. App callback URLs such as myapp://example are also supported.

        @[JSON::Field(key: "CallbackURLs")]
        getter callback_ur_ls : Array(String)?

        # The ID of the app client.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The name of the app client.

        @[JSON::Field(key: "ClientName")]
        getter client_name : String?

        # The app client secret.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The default redirect URI. Must be in the CallbackURLs list. A redirect URI must: Be an absolute URI.
        # Be registered with the authorization server. Not include a fragment component. See OAuth 2.0 -
        # Redirection Endpoint . Amazon Cognito requires HTTPS over HTTP except for http://localhost for
        # testing purposes only. App callback URLs such as myapp://example are also supported.

        @[JSON::Field(key: "DefaultRedirectURI")]
        getter default_redirect_uri : String?

        # When EnablePropagateAdditionalUserContextData is true, Amazon Cognito accepts an IpAddress value
        # that you send in the UserContextData parameter. The UserContextData parameter sends information to
        # Amazon Cognito threat protection for risk analysis. You can send UserContextData when you sign in
        # Amazon Cognito native users with the InitiateAuth and RespondToAuthChallenge API operations. When
        # EnablePropagateAdditionalUserContextData is false, you can't send your user's source IP address to
        # Amazon Cognito threat protection with unauthenticated API operations.
        # EnablePropagateAdditionalUserContextData doesn't affect whether you can send a source IP address in
        # a ContextData parameter with the authenticated API operations AdminInitiateAuth and
        # AdminRespondToAuthChallenge . You can only activate EnablePropagateAdditionalUserContextData in an
        # app client that has a client secret. For more information about propagation of user context data,
        # see Adding user device and session data to API requests .

        @[JSON::Field(key: "EnablePropagateAdditionalUserContextData")]
        getter enable_propagate_additional_user_context_data : Bool?

        # Indicates whether token revocation is activated for the user pool client. When you create a new user
        # pool client, token revocation is activated by default.

        @[JSON::Field(key: "EnableTokenRevocation")]
        getter enable_token_revocation : Bool?

        # The authentication flows that you want your user pool client to support. For each app client in your
        # user pool, you can sign in your users with any combination of one or more flows, including with a
        # user name and Secure Remote Password (SRP), a user name and password, or a custom authentication
        # process that you define with Lambda functions. If you don't specify a value for ExplicitAuthFlows ,
        # your app client supports ALLOW_REFRESH_TOKEN_AUTH , ALLOW_USER_SRP_AUTH , and ALLOW_CUSTOM_AUTH .
        # The values for authentication flow options include the following. ALLOW_USER_AUTH : Enable
        # selection-based sign-in with USER_AUTH . This setting covers username-password, secure remote
        # password (SRP), passwordless, and passkey authentication. This authentiation flow can do
        # username-password and SRP authentication without other ExplicitAuthFlows permitting them. For
        # example users can complete an SRP challenge through USER_AUTH without the flow USER_SRP_AUTH being
        # active for the app client. This flow doesn't include CUSTOM_AUTH . To activate this setting, your
        # user pool must be in the Essentials tier or higher. ALLOW_ADMIN_USER_PASSWORD_AUTH : Enable admin
        # based user password authentication flow ADMIN_USER_PASSWORD_AUTH . This setting replaces the
        # ADMIN_NO_SRP_AUTH setting. With this authentication flow, your app passes a user name and password
        # to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to
        # securely transmit the password. ALLOW_CUSTOM_AUTH : Enable Lambda trigger based authentication.
        # ALLOW_USER_PASSWORD_AUTH : Enable user password-based authentication. In this flow, Amazon Cognito
        # receives the password in the request instead of using the SRP protocol to verify passwords.
        # ALLOW_USER_SRP_AUTH : Enable SRP-based authentication. ALLOW_REFRESH_TOKEN_AUTH : Enable authflow to
        # refresh tokens. In some environments, you will see the values ADMIN_NO_SRP_AUTH ,
        # CUSTOM_AUTH_FLOW_ONLY , or USER_PASSWORD_AUTH . You can't assign these legacy ExplicitAuthFlows
        # values to user pool clients at the same time as values that begin with ALLOW_ , like
        # ALLOW_USER_SRP_AUTH .

        @[JSON::Field(key: "ExplicitAuthFlows")]
        getter explicit_auth_flows : Array(String)?

        # The ID token time limit. After this limit expires, your user can't use their ID token. To specify
        # the time unit for IdTokenValidity as seconds , minutes , hours , or days , set a TokenValidityUnits
        # value in your API request. For example, when you set IdTokenValidity as 10 and TokenValidityUnits as
        # hours , your user can authenticate their session with their ID token for 10 hours. The default time
        # unit for IdTokenValidity in an API request is hours. Valid range is displayed below in seconds. If
        # you don't specify otherwise in the configuration of your app client, your ID tokens are valid for
        # one hour.

        @[JSON::Field(key: "IdTokenValidity")]
        getter id_token_validity : Int32?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # A list of allowed logout URLs for the IdPs.

        @[JSON::Field(key: "LogoutURLs")]
        getter logout_ur_ls : Array(String)?

        # When ENABLED , suppresses messages that might indicate a valid user exists when someone attempts
        # sign-in. This parameters sets your preference for the errors and responses that you want Amazon
        # Cognito APIs to return during authentication, account confirmation, and password recovery when the
        # user doesn't exist in the user pool. When set to ENABLED and the user doesn't exist, authentication
        # returns an error indicating either the username or password was incorrect. Account confirmation and
        # password recovery return a response indicating a code was sent to a simulated destination. When set
        # to LEGACY , those APIs return a UserNotFoundException exception if the user doesn't exist in the
        # user pool. Defaults to LEGACY .

        @[JSON::Field(key: "PreventUserExistenceErrors")]
        getter prevent_user_existence_errors : String?

        # The list of user attributes that you want your app client to have read access to. After your user
        # authenticates in your app, their access token authorizes them to read their own attribute value for
        # any attribute in this list. When you don't specify the ReadAttributes for your app client, your app
        # can read the values of email_verified , phone_number_verified , and the standard attributes of your
        # user pool. When your user pool app client has read access to these default attributes,
        # ReadAttributes doesn't return any information. Amazon Cognito only populates ReadAttributes in the
        # API response if you have specified your own custom set of read attributes.

        @[JSON::Field(key: "ReadAttributes")]
        getter read_attributes : Array(String)?

        # The configuration of your app client for refresh token rotation. When enabled, your app client
        # issues new ID, access, and refresh tokens when users renew their sessions with refresh tokens. When
        # disabled, token refresh issues only ID and access tokens.

        @[JSON::Field(key: "RefreshTokenRotation")]
        getter refresh_token_rotation : Types::RefreshTokenRotationType?

        # The refresh token time limit. After this limit expires, your user can't use their refresh token. To
        # specify the time unit for RefreshTokenValidity as seconds , minutes , hours , or days , set a
        # TokenValidityUnits value in your API request. For example, when you set RefreshTokenValidity as 10
        # and TokenValidityUnits as days , your user can refresh their session and retrieve new access and ID
        # tokens for 10 days. The default time unit for RefreshTokenValidity in an API request is days. You
        # can't set RefreshTokenValidity to 0. If you do, Amazon Cognito overrides the value with the default
        # value of 30 days. Valid range is displayed below in seconds. If you don't specify otherwise in the
        # configuration of your app client, your refresh tokens are valid for 30 days.

        @[JSON::Field(key: "RefreshTokenValidity")]
        getter refresh_token_validity : Int32?

        # A list of provider names for the identity providers (IdPs) that are supported on this client. The
        # following are supported: COGNITO , Facebook , Google , SignInWithApple , and LoginWithAmazon . You
        # can also specify the names that you configured for the SAML and OIDC IdPs in your user pool, for
        # example MySAMLIdP or MyOIDCIdP . This parameter sets the IdPs that managed login will display on the
        # login page for your app client. The removal of COGNITO from this list doesn't prevent authentication
        # operations for local users with the user pools API in an Amazon Web Services SDK. The only way to
        # prevent SDK-based authentication is to block access with a WAF rule .

        @[JSON::Field(key: "SupportedIdentityProviders")]
        getter supported_identity_providers : Array(String)?

        # The time units that, with IdTokenValidity , AccessTokenValidity , and RefreshTokenValidity , set and
        # display the duration of ID, access, and refresh tokens for an app client. You can assign a separate
        # token validity unit to each type of token.

        @[JSON::Field(key: "TokenValidityUnits")]
        getter token_validity_units : Types::TokenValidityUnitsType?

        # The ID of the user pool associated with the app client.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        # The list of user attributes that you want your app client to have write access to. After your user
        # authenticates in your app, their access token authorizes them to set or modify their own attribute
        # value for any attribute in this list. When you don't specify the WriteAttributes for your app
        # client, your app can write the values of the Standard attributes of your user pool. When your user
        # pool has write access to these default attributes, WriteAttributes doesn't return any information.
        # Amazon Cognito only populates WriteAttributes in the API response if you have specified your own
        # custom set of write attributes. If your app client allows users to sign in through an IdP, this
        # array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates
        # mapped attributes when users sign in to your application through an IdP. If your app client does not
        # have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the
        # attribute. For more information, see Specifying IdP Attribute Mappings for Your user pool .

        @[JSON::Field(key: "WriteAttributes")]
        getter write_attributes : Array(String)?

        def initialize(
          @access_token_validity : Int32? = nil,
          @allowed_o_auth_flows : Array(String)? = nil,
          @allowed_o_auth_flows_user_pool_client : Bool? = nil,
          @allowed_o_auth_scopes : Array(String)? = nil,
          @analytics_configuration : Types::AnalyticsConfigurationType? = nil,
          @auth_session_validity : Int32? = nil,
          @callback_ur_ls : Array(String)? = nil,
          @client_id : String? = nil,
          @client_name : String? = nil,
          @client_secret : String? = nil,
          @creation_date : Time? = nil,
          @default_redirect_uri : String? = nil,
          @enable_propagate_additional_user_context_data : Bool? = nil,
          @enable_token_revocation : Bool? = nil,
          @explicit_auth_flows : Array(String)? = nil,
          @id_token_validity : Int32? = nil,
          @last_modified_date : Time? = nil,
          @logout_ur_ls : Array(String)? = nil,
          @prevent_user_existence_errors : String? = nil,
          @read_attributes : Array(String)? = nil,
          @refresh_token_rotation : Types::RefreshTokenRotationType? = nil,
          @refresh_token_validity : Int32? = nil,
          @supported_identity_providers : Array(String)? = nil,
          @token_validity_units : Types::TokenValidityUnitsType? = nil,
          @user_pool_id : String? = nil,
          @write_attributes : Array(String)? = nil
        )
        end
      end

      # A short description of a user pool.

      struct UserPoolDescriptionType
        include JSON::Serializable

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The user pool ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible
        # stages of user pool operations. Triggers can modify the outcome of the operations that invoked them.

        @[JSON::Field(key: "LambdaConfig")]
        getter lambda_config : Types::LambdaConfigType?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The user pool name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The user pool status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_date : Time? = nil,
          @id : String? = nil,
          @lambda_config : Types::LambdaConfigType? = nil,
          @last_modified_date : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A list of user pool policies. Contains the policy that sets password-complexity requirements.

      struct UserPoolPolicyType
        include JSON::Serializable

        # The password policy settings for a user pool, including complexity, history, and length
        # requirements.

        @[JSON::Field(key: "PasswordPolicy")]
        getter password_policy : Types::PasswordPolicyType?

        # The policy for allowed types of authentication in a user pool.

        @[JSON::Field(key: "SignInPolicy")]
        getter sign_in_policy : Types::SignInPolicyType?

        def initialize(
          @password_policy : Types::PasswordPolicyType? = nil,
          @sign_in_policy : Types::SignInPolicyType? = nil
        )
        end
      end

      # This exception is thrown when a user pool tag can't be set or updated.

      struct UserPoolTaggingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of a user pool.

      struct UserPoolType
        include JSON::Serializable

        # The available verified method a user can use to recover their password when they call ForgotPassword
        # . You can use this setting to define a preferred method when a user has more than one method
        # available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the
        # user also has SMS multi-factor authentication (MFA) activated. In the absence of this setting,
        # Amazon Cognito uses the legacy behavior to determine the recovery method where SMS is preferred
        # through email.

        @[JSON::Field(key: "AccountRecoverySetting")]
        getter account_recovery_setting : Types::AccountRecoverySettingType?

        # The configuration for AdminCreateUser requests.

        @[JSON::Field(key: "AdminCreateUserConfig")]
        getter admin_create_user_config : Types::AdminCreateUserConfigType?

        # Attributes supported as an alias for this user pool. An alias is an attribute that users can enter
        # as an alternative username. Possible values: phone_number , email , or preferred_username .

        @[JSON::Field(key: "AliasAttributes")]
        getter alias_attributes : Array(String)?

        # The Amazon Resource Name (ARN) of the user pool.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The attributes that are auto-verified in a user pool.

        @[JSON::Field(key: "AutoVerifiedAttributes")]
        getter auto_verified_attributes : Array(String)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A custom domain name that you provide to Amazon Cognito. This parameter applies only if you use a
        # custom domain to host the sign-up and sign-in pages for your application. An example of a custom
        # domain name might be auth.example.com . For more information about adding a custom domain to your
        # user pool, see Using Your Own Domain for the Hosted UI .

        @[JSON::Field(key: "CustomDomain")]
        getter custom_domain : String?

        # When active, DeletionProtection prevents accidental deletion of your user pool. Before you can
        # delete a user pool that you have protected against deletion, you must deactivate this feature. When
        # you try to delete a protected user pool in a DeleteUserPool API request, Amazon Cognito returns an
        # InvalidParameterException error. To delete a protected user pool, send a new DeleteUserPool request
        # after you deactivate deletion protection in an UpdateUserPool API request.

        @[JSON::Field(key: "DeletionProtection")]
        getter deletion_protection : String?

        # The device-remembering configuration for a user pool. A null value indicates that you have
        # deactivated device remembering in your user pool. When you provide a value for any
        # DeviceConfiguration field, you activate the Amazon Cognito device-remembering feature.

        @[JSON::Field(key: "DeviceConfiguration")]
        getter device_configuration : Types::DeviceConfigurationType?

        # The domain prefix, if the user pool has a domain associated with it.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The email configuration of your user pool. The email configuration type sets your preferred sending
        # method, Amazon Web Services Region, and sender for messages from your user pool.

        @[JSON::Field(key: "EmailConfiguration")]
        getter email_configuration : Types::EmailConfigurationType?

        # Deprecated. Review error codes from API requests with EventSource:cognito-idp.amazonaws.com in
        # CloudTrail for information about problems with user pool email configuration.

        @[JSON::Field(key: "EmailConfigurationFailure")]
        getter email_configuration_failure : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationMessage")]
        getter email_verification_message : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "EmailVerificationSubject")]
        getter email_verification_subject : String?

        # A number estimating the size of the user pool.

        @[JSON::Field(key: "EstimatedNumberOfUsers")]
        getter estimated_number_of_users : Int32?

        # The ID of the user pool.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible
        # stages of user pool operations. Triggers can modify the outcome of the operations that invoked them.

        @[JSON::Field(key: "LambdaConfig")]
        getter lambda_config : Types::LambdaConfigType?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "LastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # Can be one of the following values: OFF - MFA tokens aren't required and can't be specified during
        # user registration. ON - MFA tokens are required for all user registrations. You can only specify
        # required when you're initially creating a user pool. OPTIONAL - Users have the option when
        # registering to create an MFA token.

        @[JSON::Field(key: "MfaConfiguration")]
        getter mfa_configuration : String?

        # The name of the user pool.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of user pool policies. Contains the policy that sets password-complexity requirements.

        @[JSON::Field(key: "Policies")]
        getter policies : Types::UserPoolPolicyType?

        # A list of the user attributes and their properties in your user pool. The attribute schema contains
        # standard attributes, custom attributes with a custom: prefix, and developer attributes with a dev:
        # prefix. For more information, see User pool attributes . Developer-only attributes are a legacy
        # feature of user pools, and are read-only to all app clients. You can create and update
        # developer-only attributes only with IAM-authenticated API operations. Use app client read/write
        # permissions instead.

        @[JSON::Field(key: "SchemaAttributes")]
        getter schema_attributes : Array(Types::SchemaAttributeType)?

        # The contents of the SMS authentication message.

        @[JSON::Field(key: "SmsAuthenticationMessage")]
        getter sms_authentication_message : String?

        # User pool configuration for delivery of SMS messages with Amazon Simple Notification Service. To
        # send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon
        # Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services
        # account.

        @[JSON::Field(key: "SmsConfiguration")]
        getter sms_configuration : Types::SmsConfigurationType?

        # The reason why the SMS configuration can't send the messages to your users. This message might
        # include comma-separated values to describe why your SMS configuration can't send messages to user
        # pool end users. InvalidSmsRoleAccessPolicyException The Identity and Access Management role that
        # Amazon Cognito uses to send SMS messages isn't properly configured. For more information, see
        # SmsConfigurationType . SNSSandbox The Amazon Web Services account is in the SNS SMS Sandbox and
        # messages will only reach verified end users. This parameter won’t get populated with SNSSandbox if
        # the user creating the user pool doesn’t have SNS permissions. To learn how to move your Amazon Web
        # Services account out of the sandbox, see Moving out of the SMS sandbox .

        @[JSON::Field(key: "SmsConfigurationFailure")]
        getter sms_configuration_failure : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "SmsVerificationMessage")]
        getter sms_verification_message : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The settings for updates to user attributes. These settings include the property
        # AttributesRequireVerificationBeforeUpdate , a user-pool setting that tells Amazon Cognito how to
        # handle changes to the value of your users' email address and phone number attributes. For more
        # information, see Verifying updates to email addresses and phone numbers .

        @[JSON::Field(key: "UserAttributeUpdateSettings")]
        getter user_attribute_update_settings : Types::UserAttributeUpdateSettingsType?

        # Contains settings for activation of threat protection, including the operating mode and additional
        # authentication types. To log user security information but take no action, set to AUDIT . To
        # configure automatic security responses to potentially unwanted traffic to your user pool, set to
        # ENFORCED . For more information, see Adding advanced security to a user pool . To activate this
        # setting, your user pool must be on the Plus tier .

        @[JSON::Field(key: "UserPoolAddOns")]
        getter user_pool_add_ons : Types::UserPoolAddOnsType?

        # The tags that are assigned to the user pool. A tag is a label that you can apply to user pools to
        # categorize and manage them in different ways, such as by purpose, owner, environment, or other
        # criteria.

        @[JSON::Field(key: "UserPoolTags")]
        getter user_pool_tags : Hash(String, String)?

        # The user pool feature plan , or tier. This parameter determines the eligibility of the user pool for
        # features like managed login, access-token customization, and threat protection. Defaults to
        # ESSENTIALS .

        @[JSON::Field(key: "UserPoolTier")]
        getter user_pool_tier : String?

        # Specifies whether a user can use an email address or phone number as a username when they sign up.

        @[JSON::Field(key: "UsernameAttributes")]
        getter username_attributes : Array(String)?

        # Case sensitivity of the username input for the selected sign-in option. When case sensitivity is set
        # to False (case insensitive), users can sign in with any combination of capital and lowercase
        # letters. For example, username , USERNAME , or UserName , or for email, email@example.com or
        # EMaiL@eXamplE.Com . For most use cases, set case sensitivity to False (case insensitive) as a best
        # practice. When usernames and email addresses are case insensitive, Amazon Cognito treats any
        # variation in case as the same user, and prevents a case variation from being assigned to the same
        # attribute for a different user.

        @[JSON::Field(key: "UsernameConfiguration")]
        getter username_configuration : Types::UsernameConfigurationType?

        # The template for the verification message that your user pool delivers to users who set an email
        # address or phone number attribute.

        @[JSON::Field(key: "VerificationMessageTemplate")]
        getter verification_message_template : Types::VerificationMessageTemplateType?

        def initialize(
          @account_recovery_setting : Types::AccountRecoverySettingType? = nil,
          @admin_create_user_config : Types::AdminCreateUserConfigType? = nil,
          @alias_attributes : Array(String)? = nil,
          @arn : String? = nil,
          @auto_verified_attributes : Array(String)? = nil,
          @creation_date : Time? = nil,
          @custom_domain : String? = nil,
          @deletion_protection : String? = nil,
          @device_configuration : Types::DeviceConfigurationType? = nil,
          @domain : String? = nil,
          @email_configuration : Types::EmailConfigurationType? = nil,
          @email_configuration_failure : String? = nil,
          @email_verification_message : String? = nil,
          @email_verification_subject : String? = nil,
          @estimated_number_of_users : Int32? = nil,
          @id : String? = nil,
          @lambda_config : Types::LambdaConfigType? = nil,
          @last_modified_date : Time? = nil,
          @mfa_configuration : String? = nil,
          @name : String? = nil,
          @policies : Types::UserPoolPolicyType? = nil,
          @schema_attributes : Array(Types::SchemaAttributeType)? = nil,
          @sms_authentication_message : String? = nil,
          @sms_configuration : Types::SmsConfigurationType? = nil,
          @sms_configuration_failure : String? = nil,
          @sms_verification_message : String? = nil,
          @status : String? = nil,
          @user_attribute_update_settings : Types::UserAttributeUpdateSettingsType? = nil,
          @user_pool_add_ons : Types::UserPoolAddOnsType? = nil,
          @user_pool_tags : Hash(String, String)? = nil,
          @user_pool_tier : String? = nil,
          @username_attributes : Array(String)? = nil,
          @username_configuration : Types::UsernameConfigurationType? = nil,
          @verification_message_template : Types::VerificationMessageTemplateType? = nil
        )
        end
      end

      # A user profile in a Amazon Cognito user pool.

      struct UserType
        include JSON::Serializable

        # Names and values of a user's attributes, for example email .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeType)?

        # Indicates whether the user's account is enabled or disabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The user's MFA configuration.

        @[JSON::Field(key: "MFAOptions")]
        getter mfa_options : Array(Types::MFAOptionType)?

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "UserCreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter user_create_date : Time?

        # The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "UserLastModifiedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter user_last_modified_date : Time?

        # The user status. This can be one of the following: UNCONFIRMED : User has been created but not
        # confirmed. CONFIRMED : User has been confirmed. EXTERNAL_PROVIDER : User signed in with a
        # third-party IdP. RESET_REQUIRED : User is confirmed, but the user must request a code and reset
        # their password before they can sign in. FORCE_CHANGE_PASSWORD : The user is confirmed and the user
        # can sign in using a temporary password, but on first sign-in, the user must change their password to
        # a new value before doing anything else. The statuses ARCHIVED , UNKNOWN , and COMPROMISED are no
        # longer used.

        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        # The user's username.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @attributes : Array(Types::AttributeType)? = nil,
          @enabled : Bool? = nil,
          @mfa_options : Array(Types::MFAOptionType)? = nil,
          @user_create_date : Time? = nil,
          @user_last_modified_date : Time? = nil,
          @user_status : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The configuration of a user pool for username case sensitivity.

      struct UsernameConfigurationType
        include JSON::Serializable

        # Specifies whether user name case sensitivity will be applied for all users in the user pool through
        # Amazon Cognito APIs. For most use cases, set case sensitivity to False (case insensitive) as a best
        # practice. When usernames and email addresses are case insensitive, users can sign in as the same
        # user when they enter a different capitalization of their user name. Valid values include: true
        # Enables case sensitivity for all username input. When this option is set to true , users must sign
        # in using the exact capitalization of their given username, such as “UserName”. This is the default
        # value. false Enables case insensitivity for all username input. For example, when this option is set
        # to false , users can sign in using username , USERNAME , or UserName . This option also enables both
        # preferred_username and email alias to be case insensitive, in addition to the username attribute.

        @[JSON::Field(key: "CaseSensitive")]
        getter case_sensitive : Bool

        def initialize(
          @case_sensitive : Bool
        )
        end
      end

      # This exception is thrown when Amazon Cognito encounters a user name that already exists in the user
      # pool.

      struct UsernameExistsException
        include JSON::Serializable

        # The message returned when Amazon Cognito throws a user name exists exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The template for the verification message that your user pool delivers to users who set an email
      # address or phone number attribute.

      struct VerificationMessageTemplateType
        include JSON::Serializable

        # The configuration of verification emails to contain a clickable link or a verification code. For
        # link, your template body must contain link text in the format {##Click here##} . "Click here" in the
        # example is a customizable string. For code, your template body must contain a code placeholder in
        # the format {####} .

        @[JSON::Field(key: "DefaultEmailOption")]
        getter default_email_option : String?

        # The template for email messages that Amazon Cognito sends to your users. You can set an EmailMessage
        # template only if the value of EmailSendingAccount is DEVELOPER . When your EmailSendingAccount is
        # DEVELOPER , your user pool sends email messages with your own Amazon SES configuration.

        @[JSON::Field(key: "EmailMessage")]
        getter email_message : String?

        # The email message template for sending a confirmation link to the user. You can set an
        # EmailMessageByLink template only if the value of EmailSendingAccount is DEVELOPER . When your
        # EmailSendingAccount is DEVELOPER , your user pool sends email messages with your own Amazon SES
        # configuration.

        @[JSON::Field(key: "EmailMessageByLink")]
        getter email_message_by_link : String?

        # The subject line for the email message template. You can set an EmailSubject template only if the
        # value of EmailSendingAccount is DEVELOPER . When your EmailSendingAccount is DEVELOPER , your user
        # pool sends email messages with your own Amazon SES configuration.

        @[JSON::Field(key: "EmailSubject")]
        getter email_subject : String?

        # The subject line for the email message template for sending a confirmation link to the user. You can
        # set an EmailSubjectByLink template only if the value of EmailSendingAccount is DEVELOPER . When your
        # EmailSendingAccount is DEVELOPER , your user pool sends email messages with your own Amazon SES
        # configuration.

        @[JSON::Field(key: "EmailSubjectByLink")]
        getter email_subject_by_link : String?

        # The template for SMS messages that Amazon Cognito sends to your users.

        @[JSON::Field(key: "SmsMessage")]
        getter sms_message : String?

        def initialize(
          @default_email_option : String? = nil,
          @email_message : String? = nil,
          @email_message_by_link : String? = nil,
          @email_subject : String? = nil,
          @email_subject_by_link : String? = nil,
          @sms_message : String? = nil
        )
        end
      end


      struct VerifySoftwareTokenRequest
        include JSON::Serializable

        # A TOTP that the user generated in their configured authenticator app.

        @[JSON::Field(key: "UserCode")]
        getter user_code : String

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String?

        # A friendly name for the device that's running the TOTP authenticator.

        @[JSON::Field(key: "FriendlyDeviceName")]
        getter friendly_device_name : String?

        # The session ID from an AssociateSoftwareToken request.

        @[JSON::Field(key: "Session")]
        getter session : String?

        def initialize(
          @user_code : String,
          @access_token : String? = nil,
          @friendly_device_name : String? = nil,
          @session : String? = nil
        )
        end
      end


      struct VerifySoftwareTokenResponse
        include JSON::Serializable

        # This session ID satisfies an MFA_SETUP challenge. Supply the session ID in your challenge response.

        @[JSON::Field(key: "Session")]
        getter session : String?

        # Amazon Cognito can accept or reject the code that you provide. This response parameter indicates the
        # success of TOTP verification. Some reasons that this operation might return an error are clock skew
        # on the user's device and excessive retries.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @session : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents the request to verify user attributes.

      struct VerifyUserAttributeRequest
        include JSON::Serializable

        # A valid access token that Amazon Cognito issued to the currently signed-in user. Must include a
        # scope claim for aws.cognito.signin.user.admin .

        @[JSON::Field(key: "AccessToken")]
        getter access_token : String

        # The name of the attribute that you want to verify.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The verification code that your user pool sent to the added or changed attribute, for example the
        # user's email address.

        @[JSON::Field(key: "Code")]
        getter code : String

        def initialize(
          @access_token : String,
          @attribute_name : String,
          @code : String
        )
        end
      end

      # A container representing the response from the server from the request to verify user attributes.

      struct VerifyUserAttributeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the challenge from StartWebAuthn registration has expired.

      struct WebAuthnChallengeNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the access token is for a different client than the one in the
      # original StartWebAuthnRegistration request.

      struct WebAuthnClientMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a user pool doesn't have a configured relying party id or a user pool
      # domain.

      struct WebAuthnConfigurationMissingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Settings for authentication (MFA) with passkey, or webauthN, biometric and security-key devices in a
      # user pool. Configures the following: Configuration for requiring user-verification support in
      # passkeys. The user pool relying-party ID. This is the domain, typically your user pool domain, that
      # user's passkey providers should trust as a receiver of passkey authentication. The providers that
      # you want to allow as origins for passkey authentication.

      struct WebAuthnConfigurationType
        include JSON::Serializable

        # Sets or displays the authentication domain, typically your user pool domain, that passkey providers
        # must use as a relying party (RP) in their configuration. Under the following conditions, the passkey
        # relying party ID must be the fully-qualified domain name of your custom domain: The user pool is
        # configured for passkey authentication. The user pool has a custom domain, whether or not it also has
        # a prefix domain. Your application performs authentication with managed login or the classic hosted
        # UI.

        @[JSON::Field(key: "RelyingPartyId")]
        getter relying_party_id : String?

        # When required , users can only register and sign in users with passkeys that are capable of user
        # verification . When preferred , your user pool doesn't require the use of authenticators with user
        # verification but encourages it.

        @[JSON::Field(key: "UserVerification")]
        getter user_verification : String?

        def initialize(
          @relying_party_id : String? = nil,
          @user_verification : String? = nil
        )
        end
      end

      # The details of a passkey, or webauthN, biometric or security-key authentication factor for a user.

      struct WebAuthnCredentialDescription
        include JSON::Serializable

        # Information about the transport methods of the passkey credential, for example USB or Bluetooth Low
        # Energy.

        @[JSON::Field(key: "AuthenticatorTransports")]
        getter authenticator_transports : Array(String)

        # The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch
        # time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java
        # Date object.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the passkey credential.

        @[JSON::Field(key: "CredentialId")]
        getter credential_id : String

        # An automatically-generated friendly name for the passkey credential.

        @[JSON::Field(key: "FriendlyCredentialName")]
        getter friendly_credential_name : String

        # The relying-party ID of the provider for the passkey credential.

        @[JSON::Field(key: "RelyingPartyId")]
        getter relying_party_id : String

        # The general category of the passkey authenticator. Can be a platform, or on-device authenticator
        # like a built-in fingerprint scanner, or a cross-platform device that's not attached to the device
        # like a Bluetooth security key.

        @[JSON::Field(key: "AuthenticatorAttachment")]
        getter authenticator_attachment : String?

        def initialize(
          @authenticator_transports : Array(String),
          @created_at : Time,
          @credential_id : String,
          @friendly_credential_name : String,
          @relying_party_id : String,
          @authenticator_attachment : String? = nil
        )
        end
      end

      # This exception is thrown when a user presents passkey credentials from an unsupported device or
      # provider.

      struct WebAuthnCredentialNotSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the passkey feature isn't enabled for the user pool.

      struct WebAuthnNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the passkey credential's registration origin does not align with the
      # user pool relying party id.

      struct WebAuthnOriginNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the given passkey credential is associated with a different relying
      # party ID than the user pool relying party ID.

      struct WebAuthnRelyingPartyMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
