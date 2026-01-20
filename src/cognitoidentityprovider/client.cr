module Aws
  module CognitoIdentityProvider
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Adds additional user attributes to the user pool schema. Custom attributes can be mutable or
      # immutable and have a custom: or dev: prefix. For more information, see Custom attributes . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def add_custom_attributes(
        custom_attributes : Array(Types::SchemaAttributeType),
        user_pool_id : String
      ) : Types::AddCustomAttributesResponse

        input = Types::AddCustomAttributesRequest.new(custom_attributes: custom_attributes, user_pool_id: user_pool_id)
        add_custom_attributes(input)
      end

      def add_custom_attributes(input : Types::AddCustomAttributesRequest) : Types::AddCustomAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_CUSTOM_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddCustomAttributesResponse, "AddCustomAttributes")
      end

      # Adds a user to a group. A user who is in a group can present a preferred-role claim to an identity
      # pool, and populates a cognito:groups claim to their access and identity tokens. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_add_user_to_group(
        group_name : String,
        user_pool_id : String,
        username : String
      ) : Nil

        input = Types::AdminAddUserToGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id, username: username)
        admin_add_user_to_group(input)
      end

      def admin_add_user_to_group(input : Types::AdminAddUserToGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADMIN_ADD_USER_TO_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Confirms user sign-up as an administrator. This request sets a user account active in a user pool
      # that requires confirmation of new user accounts before they can sign in. You can configure your user
      # pool to not send confirmation codes to new users and instead confirm them with this API operation on
      # the back end. Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for
      # this API operation. For this operation, you must use IAM credentials to authorize requests, and you
      # must grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web
      # Services API Requests Using the Amazon Cognito user pools API and user pool endpoints To configure
      # your user pool to require administrative confirmation of users, set AllowAdminCreateUserOnly to true
      # in a CreateUserPool or UpdateUserPool request.

      def admin_confirm_sign_up(
        user_pool_id : String,
        username : String,
        client_metadata : Hash(String, String)? = nil
      ) : Types::AdminConfirmSignUpResponse

        input = Types::AdminConfirmSignUpRequest.new(user_pool_id: user_pool_id, username: username, client_metadata: client_metadata)
        admin_confirm_sign_up(input)
      end

      def admin_confirm_sign_up(input : Types::AdminConfirmSignUpRequest) : Types::AdminConfirmSignUpResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_CONFIRM_SIGN_UP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminConfirmSignUpResponse, "AdminConfirmSignUp")
      end

      # Creates a new user in the specified user pool. If MessageAction isn't set, the default is to send a
      # welcome message via email or phone (SMS). This message is based on a template that you configured in
      # your call to create or update a user pool. This template includes your custom sign-up instructions
      # and placeholders for user name and temporary password. Alternatively, you can call AdminCreateUser
      # with SUPPRESS for the MessageAction parameter, and Amazon Cognito won't send any email. In either
      # case, if the user has a password, they will be in the FORCE_CHANGE_PASSWORD state until they sign in
      # and set their password. Your invitation message template must have the {####} password placeholder
      # if your users have passwords. If your template doesn't have this placeholder, Amazon Cognito doesn't
      # deliver the invitation message. In this case, you must update your message template and resend the
      # password with a new AdminCreateUser request with a MessageAction value of RESEND . This action might
      # generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an
      # origination phone number before you can send SMS messages to US phone numbers. If you use SMS text
      # messages in Amazon Cognito, you must register a phone number with Amazon Pinpoint . Amazon Cognito
      # uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS
      # messages might not be able to sign up, activate their accounts, or sign in. If you have never used
      # SMS text messages with Amazon Cognito or any other Amazon Web Services service, Amazon Simple
      # Notification Service might place your account in the SMS sandbox. In sandbox mode , you can send
      # messages only to verified phone numbers. After you test your app while in the sandbox environment,
      # you can move out of the sandbox and into production. For more information, see SMS message settings
      # for Amazon Cognito user pools in the Amazon Cognito Developer Guide . Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_create_user(
        user_pool_id : String,
        username : String,
        client_metadata : Hash(String, String)? = nil,
        desired_delivery_mediums : Array(String)? = nil,
        force_alias_creation : Bool? = nil,
        message_action : String? = nil,
        temporary_password : String? = nil,
        user_attributes : Array(Types::AttributeType)? = nil,
        validation_data : Array(Types::AttributeType)? = nil
      ) : Types::AdminCreateUserResponse

        input = Types::AdminCreateUserRequest.new(user_pool_id: user_pool_id, username: username, client_metadata: client_metadata, desired_delivery_mediums: desired_delivery_mediums, force_alias_creation: force_alias_creation, message_action: message_action, temporary_password: temporary_password, user_attributes: user_attributes, validation_data: validation_data)
        admin_create_user(input)
      end

      def admin_create_user(input : Types::AdminCreateUserRequest) : Types::AdminCreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminCreateUserResponse, "AdminCreateUser")
      end

      # Deletes a user profile in your user pool. Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def admin_delete_user(
        user_pool_id : String,
        username : String
      ) : Nil

        input = Types::AdminDeleteUserRequest.new(user_pool_id: user_pool_id, username: username)
        admin_delete_user(input)
      end

      def admin_delete_user(input : Types::AdminDeleteUserRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADMIN_DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes attribute values from a user. This operation doesn't affect tokens for existing user
      # sessions. The next ID token that the user receives will no longer have the deleted attributes.
      # Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def admin_delete_user_attributes(
        user_attribute_names : Array(String),
        user_pool_id : String,
        username : String
      ) : Types::AdminDeleteUserAttributesResponse

        input = Types::AdminDeleteUserAttributesRequest.new(user_attribute_names: user_attribute_names, user_pool_id: user_pool_id, username: username)
        admin_delete_user_attributes(input)
      end

      def admin_delete_user_attributes(input : Types::AdminDeleteUserAttributesRequest) : Types::AdminDeleteUserAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_DELETE_USER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminDeleteUserAttributesResponse, "AdminDeleteUserAttributes")
      end

      # Prevents the user from signing in with the specified external (SAML or social) identity provider
      # (IdP). If the user that you want to deactivate is a Amazon Cognito user pools native username +
      # password user, they can't use their password to sign in. If the user to deactivate is a linked
      # external IdP user, any link between that user and an existing user is removed. When the external
      # user signs in again, and the user is no longer attached to the previously linked DestinationUser ,
      # the user must create a new user account. The value of ProviderName must match the name of a user
      # pool IdP. To deactivate a local user, set ProviderName to Cognito and the ProviderAttributeName to
      # Cognito_Subject . The ProviderAttributeValue must be user's local username. The
      # ProviderAttributeName must always be Cognito_Subject for social IdPs. The ProviderAttributeValue
      # must always be the exact subject that was used when the user was originally linked as a source user.
      # For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been
      # used to sign in, the ProviderAttributeName and ProviderAttributeValue must be the same values that
      # were used for the SourceUser when the identities were originally linked using
      # AdminLinkProviderForUser call. This is also true if the linking was done with ProviderAttributeName
      # set to Cognito_Subject . If the user has already signed in, the ProviderAttributeName must be
      # Cognito_Subject and ProviderAttributeValue must be the NameID from their SAML assertion. Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def admin_disable_provider_for_user(
        user : Types::ProviderUserIdentifierType,
        user_pool_id : String
      ) : Types::AdminDisableProviderForUserResponse

        input = Types::AdminDisableProviderForUserRequest.new(user: user, user_pool_id: user_pool_id)
        admin_disable_provider_for_user(input)
      end

      def admin_disable_provider_for_user(input : Types::AdminDisableProviderForUserRequest) : Types::AdminDisableProviderForUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_DISABLE_PROVIDER_FOR_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminDisableProviderForUserResponse, "AdminDisableProviderForUser")
      end

      # Deactivates a user profile and revokes all access tokens for the user. A deactivated user can't sign
      # in, but still appears in the responses to ListUsers API requests. Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def admin_disable_user(
        user_pool_id : String,
        username : String
      ) : Types::AdminDisableUserResponse

        input = Types::AdminDisableUserRequest.new(user_pool_id: user_pool_id, username: username)
        admin_disable_user(input)
      end

      def admin_disable_user(input : Types::AdminDisableUserRequest) : Types::AdminDisableUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_DISABLE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminDisableUserResponse, "AdminDisableUser")
      end

      # Activates sign-in for a user profile that previously had sign-in access disabled. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_enable_user(
        user_pool_id : String,
        username : String
      ) : Types::AdminEnableUserResponse

        input = Types::AdminEnableUserRequest.new(user_pool_id: user_pool_id, username: username)
        admin_enable_user(input)
      end

      def admin_enable_user(input : Types::AdminEnableUserRequest) : Types::AdminEnableUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_ENABLE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminEnableUserResponse, "AdminEnableUser")
      end

      # Forgets, or deletes, a remembered device from a user's profile. After you forget the device, the
      # user can no longer complete device authentication with that device and when applicable, must submit
      # MFA codes again. For more information, see Working with devices . Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def admin_forget_device(
        device_key : String,
        user_pool_id : String,
        username : String
      ) : Nil

        input = Types::AdminForgetDeviceRequest.new(device_key: device_key, user_pool_id: user_pool_id, username: username)
        admin_forget_device(input)
      end

      def admin_forget_device(input : Types::AdminForgetDeviceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADMIN_FORGET_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Given the device key, returns details for a user's device. For more information, see Working with
      # devices . Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for
      # this API operation. For this operation, you must use IAM credentials to authorize requests, and you
      # must grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web
      # Services API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def admin_get_device(
        device_key : String,
        user_pool_id : String,
        username : String
      ) : Types::AdminGetDeviceResponse

        input = Types::AdminGetDeviceRequest.new(device_key: device_key, user_pool_id: user_pool_id, username: username)
        admin_get_device(input)
      end

      def admin_get_device(input : Types::AdminGetDeviceRequest) : Types::AdminGetDeviceResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_GET_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminGetDeviceResponse, "AdminGetDevice")
      end

      # Given a username, returns details about a user profile in a user pool. You can specify alias
      # attributes in the Username request parameter. This operation contributes to your monthly active user
      # (MAU) count for the purpose of billing. Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def admin_get_user(
        user_pool_id : String,
        username : String
      ) : Types::AdminGetUserResponse

        input = Types::AdminGetUserRequest.new(user_pool_id: user_pool_id, username: username)
        admin_get_user(input)
      end

      def admin_get_user(input : Types::AdminGetUserRequest) : Types::AdminGetUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_GET_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminGetUserResponse, "AdminGetUser")
      end

      # Starts sign-in for applications with a server-side component, for example a traditional web
      # application. This operation specifies the authentication flow that you'd like to begin. The
      # authentication flow that you specify must be supported in your app client configuration. For more
      # information about authentication flows, see Authentication flows . This action might generate an SMS
      # text message. Starting June 1, 2021, US telecom carriers require you to register an origination
      # phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in
      # Amazon Cognito, you must register a phone number with Amazon Pinpoint . Amazon Cognito uses the
      # registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might
      # not be able to sign up, activate their accounts, or sign in. If you have never used SMS text
      # messages with Amazon Cognito or any other Amazon Web Services service, Amazon Simple Notification
      # Service might place your account in the SMS sandbox. In sandbox mode , you can send messages only to
      # verified phone numbers. After you test your app while in the sandbox environment, you can move out
      # of the sandbox and into production. For more information, see SMS message settings for Amazon
      # Cognito user pools in the Amazon Cognito Developer Guide . Amazon Cognito evaluates Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you must
      # use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def admin_initiate_auth(
        auth_flow : String,
        client_id : String,
        user_pool_id : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        auth_parameters : Hash(String, String)? = nil,
        client_metadata : Hash(String, String)? = nil,
        context_data : Types::ContextDataType? = nil,
        session : String? = nil
      ) : Types::AdminInitiateAuthResponse

        input = Types::AdminInitiateAuthRequest.new(auth_flow: auth_flow, client_id: client_id, user_pool_id: user_pool_id, analytics_metadata: analytics_metadata, auth_parameters: auth_parameters, client_metadata: client_metadata, context_data: context_data, session: session)
        admin_initiate_auth(input)
      end

      def admin_initiate_auth(input : Types::AdminInitiateAuthRequest) : Types::AdminInitiateAuthResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_INITIATE_AUTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminInitiateAuthResponse, "AdminInitiateAuth")
      end

      # Links an existing user account in a user pool, or DestinationUser , to an identity from an external
      # IdP, or SourceUser , based on a specified attribute name and value from the external IdP. This
      # operation connects a local user profile with a user identity who hasn't yet signed in from their
      # third-party IdP. When the user signs in with their IdP, they get access-control configuration from
      # the local user profile. Linked local users can also sign in with SDK-based API operations like
      # InitiateAuth after they sign in at least once through their IdP. For more information, see Linking
      # federated users . The maximum number of federated identities linked to a user is five. Because this
      # API allows a user with an external federated identity to sign in as a local user, it is critical
      # that it only be used with external IdPs and linked attributes that you trust. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_link_provider_for_user(
        destination_user : Types::ProviderUserIdentifierType,
        source_user : Types::ProviderUserIdentifierType,
        user_pool_id : String
      ) : Types::AdminLinkProviderForUserResponse

        input = Types::AdminLinkProviderForUserRequest.new(destination_user: destination_user, source_user: source_user, user_pool_id: user_pool_id)
        admin_link_provider_for_user(input)
      end

      def admin_link_provider_for_user(input : Types::AdminLinkProviderForUserRequest) : Types::AdminLinkProviderForUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_LINK_PROVIDER_FOR_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminLinkProviderForUserResponse, "AdminLinkProviderForUser")
      end

      # Lists a user's registered devices. Remembered devices are used in authentication services where you
      # offer a "Remember me" option for users who you want to permit to sign in without MFA from a trusted
      # device. Users can bypass MFA while your application performs device SRP authentication on the back
      # end. For more information, see Working with devices . Amazon Cognito evaluates Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you must use IAM
      # credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a
      # policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API
      # and user pool endpoints

      def admin_list_devices(
        user_pool_id : String,
        username : String,
        limit : Int32? = nil,
        pagination_token : String? = nil
      ) : Types::AdminListDevicesResponse

        input = Types::AdminListDevicesRequest.new(user_pool_id: user_pool_id, username: username, limit: limit, pagination_token: pagination_token)
        admin_list_devices(input)
      end

      def admin_list_devices(input : Types::AdminListDevicesRequest) : Types::AdminListDevicesResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_LIST_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminListDevicesResponse, "AdminListDevices")
      end

      # Lists the groups that a user belongs to. User pool groups are identifiers that you can reference
      # from the contents of ID and access tokens, and set preferred IAM roles for identity-pool
      # authentication. For more information, see Adding groups to a user pool . Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_list_groups_for_user(
        user_pool_id : String,
        username : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::AdminListGroupsForUserResponse

        input = Types::AdminListGroupsForUserRequest.new(user_pool_id: user_pool_id, username: username, limit: limit, next_token: next_token)
        admin_list_groups_for_user(input)
      end

      def admin_list_groups_for_user(input : Types::AdminListGroupsForUserRequest) : Types::AdminListGroupsForUserResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_LIST_GROUPS_FOR_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminListGroupsForUserResponse, "AdminListGroupsForUser")
      end

      # Requests a history of user activity and any risks detected as part of Amazon Cognito threat
      # protection. For more information, see Viewing user event history . Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def admin_list_user_auth_events(
        user_pool_id : String,
        username : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::AdminListUserAuthEventsResponse

        input = Types::AdminListUserAuthEventsRequest.new(user_pool_id: user_pool_id, username: username, max_results: max_results, next_token: next_token)
        admin_list_user_auth_events(input)
      end

      def admin_list_user_auth_events(input : Types::AdminListUserAuthEventsRequest) : Types::AdminListUserAuthEventsResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_LIST_USER_AUTH_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminListUserAuthEventsResponse, "AdminListUserAuthEvents")
      end

      # Given a username and a group name, removes them from the group. User pool groups are identifiers
      # that you can reference from the contents of ID and access tokens, and set preferred IAM roles for
      # identity-pool authentication. For more information, see Adding groups to a user pool . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def admin_remove_user_from_group(
        group_name : String,
        user_pool_id : String,
        username : String
      ) : Nil

        input = Types::AdminRemoveUserFromGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id, username: username)
        admin_remove_user_from_group(input)
      end

      def admin_remove_user_from_group(input : Types::AdminRemoveUserFromGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADMIN_REMOVE_USER_FROM_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Begins the password reset process. Sets the requested user’s account into a RESET_REQUIRED status,
      # and sends them a password-reset code. Your user pool also sends the user a notification with a reset
      # code and the information that their password has been reset. At sign-in, your application or the
      # managed login session receives a challenge to complete the reset by confirming the code and setting
      # a new password. To use this API operation, your user pool must have self-service account recovery
      # configured. This action might generate an SMS text message. Starting June 1, 2021, US telecom
      # carriers require you to register an origination phone number before you can send SMS messages to US
      # phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with
      # Amazon Pinpoint . Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito
      # users who must receive SMS messages might not be able to sign up, activate their accounts, or sign
      # in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Services
      # service, Amazon Simple Notification Service might place your account in the SMS sandbox. In sandbox
      # mode , you can send messages only to verified phone numbers. After you test your app while in the
      # sandbox environment, you can move out of the sandbox and into production. For more information, see
      # SMS message settings for Amazon Cognito user pools in the Amazon Cognito Developer Guide . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def admin_reset_user_password(
        user_pool_id : String,
        username : String,
        client_metadata : Hash(String, String)? = nil
      ) : Types::AdminResetUserPasswordResponse

        input = Types::AdminResetUserPasswordRequest.new(user_pool_id: user_pool_id, username: username, client_metadata: client_metadata)
        admin_reset_user_password(input)
      end

      def admin_reset_user_password(input : Types::AdminResetUserPasswordRequest) : Types::AdminResetUserPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_RESET_USER_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminResetUserPasswordResponse, "AdminResetUserPassword")
      end

      # Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device
      # authentication that bypasses MFA, or for a custom authentication challenge. An
      # AdminRespondToAuthChallenge API request provides the answer to that challenge, like a code or a
      # secure remote password (SRP). The parameters of a response to an authentication challenge vary with
      # the type of challenge. For more information about custom authentication challenges, see Custom
      # authentication challenge Lambda triggers . This action might generate an SMS text message. Starting
      # June 1, 2021, US telecom carriers require you to register an origination phone number before you can
      # send SMS messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must
      # register a phone number with Amazon Pinpoint . Amazon Cognito uses the registered number
      # automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be able to
      # sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon
      # Cognito or any other Amazon Web Services service, Amazon Simple Notification Service might place
      # your account in the SMS sandbox. In sandbox mode , you can send messages only to verified phone
      # numbers. After you test your app while in the sandbox environment, you can move out of the sandbox
      # and into production. For more information, see SMS message settings for Amazon Cognito user pools in
      # the Amazon Cognito Developer Guide . Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def admin_respond_to_auth_challenge(
        challenge_name : String,
        client_id : String,
        user_pool_id : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        challenge_responses : Hash(String, String)? = nil,
        client_metadata : Hash(String, String)? = nil,
        context_data : Types::ContextDataType? = nil,
        session : String? = nil
      ) : Types::AdminRespondToAuthChallengeResponse

        input = Types::AdminRespondToAuthChallengeRequest.new(challenge_name: challenge_name, client_id: client_id, user_pool_id: user_pool_id, analytics_metadata: analytics_metadata, challenge_responses: challenge_responses, client_metadata: client_metadata, context_data: context_data, session: session)
        admin_respond_to_auth_challenge(input)
      end

      def admin_respond_to_auth_challenge(input : Types::AdminRespondToAuthChallengeRequest) : Types::AdminRespondToAuthChallengeResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_RESPOND_TO_AUTH_CHALLENGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminRespondToAuthChallengeResponse, "AdminRespondToAuthChallenge")
      end

      # Sets the user's multi-factor authentication (MFA) preference, including which MFA options are
      # activated, and if any are preferred. Only one factor can be set as preferred. The preferred MFA
      # factor will be used to authenticate a user if multiple factors are activated. If multiple options
      # are activated and no preference is set, a challenge to choose an MFA option will be returned during
      # sign-in. Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this
      # API operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def admin_set_user_mfa_preference(
        user_pool_id : String,
        username : String,
        email_mfa_settings : Types::EmailMfaSettingsType? = nil,
        sms_mfa_settings : Types::SMSMfaSettingsType? = nil,
        software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType? = nil
      ) : Types::AdminSetUserMFAPreferenceResponse

        input = Types::AdminSetUserMFAPreferenceRequest.new(user_pool_id: user_pool_id, username: username, email_mfa_settings: email_mfa_settings, sms_mfa_settings: sms_mfa_settings, software_token_mfa_settings: software_token_mfa_settings)
        admin_set_user_mfa_preference(input)
      end

      def admin_set_user_mfa_preference(input : Types::AdminSetUserMFAPreferenceRequest) : Types::AdminSetUserMFAPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_SET_USER_MFA_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminSetUserMFAPreferenceResponse, "AdminSetUserMFAPreference")
      end

      # Sets the specified user's password in a user pool. This operation administratively sets a temporary
      # or permanent password for a user. With this operation, you can bypass self-service password changes
      # and permit immediate sign-in with the password that you set. To do this, set Permanent to true . You
      # can also set a new temporary password in this request, send it to a user, and require them to choose
      # a new password on their next sign-in. To do this, set Permanent to false . If the password is
      # temporary, the user's Status becomes FORCE_CHANGE_PASSWORD . When the user next tries to sign in,
      # the InitiateAuth or AdminInitiateAuth response includes the NEW_PASSWORD_REQUIRED challenge. If the
      # user doesn't sign in before the temporary password expires, they can no longer sign in and you must
      # repeat this operation to set a temporary or permanent password for them. After the user sets a new
      # password, or if you set a permanent password, their status becomes Confirmed . AdminSetUserPassword
      # can set a password for the user profile that Amazon Cognito creates for third-party federated users.
      # When you set a password, the federated user's status changes from EXTERNAL_PROVIDER to CONFIRMED . A
      # user in this state can sign in as a federated user, and initiate authentication flows in the API
      # like a linked native user. They can also modify their password and attributes in token-authenticated
      # API requests like ChangePassword and UpdateUserAttributes . As a best security practice and to keep
      # users in sync with your external IdP, don't set passwords on federated user profiles. To set up a
      # federated user for native sign-in with a linked native user, refer to Linking federated users to an
      # existing user profile . Amazon Cognito evaluates Identity and Access Management (IAM) policies in
      # requests for this API operation. For this operation, you must use IAM credentials to authorize
      # requests, and you must grant yourself the corresponding IAM permission in a policy. Learn more
      # Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def admin_set_user_password(
        password : String,
        user_pool_id : String,
        username : String,
        permanent : Bool? = nil
      ) : Types::AdminSetUserPasswordResponse

        input = Types::AdminSetUserPasswordRequest.new(password: password, user_pool_id: user_pool_id, username: username, permanent: permanent)
        admin_set_user_password(input)
      end

      def admin_set_user_password(input : Types::AdminSetUserPasswordRequest) : Types::AdminSetUserPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_SET_USER_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminSetUserPasswordResponse, "AdminSetUserPassword")
      end

      # This action is no longer supported. You can use it to configure only SMS MFA. You can't use it to
      # configure time-based one-time password (TOTP) software token MFA. Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def admin_set_user_settings(
        mfa_options : Array(Types::MFAOptionType),
        user_pool_id : String,
        username : String
      ) : Types::AdminSetUserSettingsResponse

        input = Types::AdminSetUserSettingsRequest.new(mfa_options: mfa_options, user_pool_id: user_pool_id, username: username)
        admin_set_user_settings(input)
      end

      def admin_set_user_settings(input : Types::AdminSetUserSettingsRequest) : Types::AdminSetUserSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_SET_USER_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminSetUserSettingsResponse, "AdminSetUserSettings")
      end

      # Provides the feedback for an authentication event generated by threat protection features. Your
      # response indicates that you think that the event either was from a valid user or was an unwanted
      # authentication attempt. This feedback improves the risk evaluation decision for the user pool as
      # part of Amazon Cognito threat protection. To activate this setting, your user pool must be on the
      # Plus tier . To train the threat-protection model to recognize trusted and untrusted sign-in
      # characteristics, configure threat protection in audit-only mode and provide a mechanism for users or
      # administrators to submit feedback. Your feedback can tell Amazon Cognito that a risk rating was
      # assigned at a level you don't agree with. Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def admin_update_auth_event_feedback(
        event_id : String,
        feedback_value : String,
        user_pool_id : String,
        username : String
      ) : Types::AdminUpdateAuthEventFeedbackResponse

        input = Types::AdminUpdateAuthEventFeedbackRequest.new(event_id: event_id, feedback_value: feedback_value, user_pool_id: user_pool_id, username: username)
        admin_update_auth_event_feedback(input)
      end

      def admin_update_auth_event_feedback(input : Types::AdminUpdateAuthEventFeedbackRequest) : Types::AdminUpdateAuthEventFeedbackResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_UPDATE_AUTH_EVENT_FEEDBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminUpdateAuthEventFeedbackResponse, "AdminUpdateAuthEventFeedback")
      end

      # Updates the status of a user's device so that it is marked as remembered or not remembered for the
      # purpose of device authentication. Device authentication is a "remember me" mechanism that silently
      # completes sign-in from trusted devices with a device key instead of a user-provided MFA code. This
      # operation changes the status of a device without deleting it, so you can enable it again later. For
      # more information about device authentication, see Working with devices . Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def admin_update_device_status(
        device_key : String,
        user_pool_id : String,
        username : String,
        device_remembered_status : String? = nil
      ) : Types::AdminUpdateDeviceStatusResponse

        input = Types::AdminUpdateDeviceStatusRequest.new(device_key: device_key, user_pool_id: user_pool_id, username: username, device_remembered_status: device_remembered_status)
        admin_update_device_status(input)
      end

      def admin_update_device_status(input : Types::AdminUpdateDeviceStatusRequest) : Types::AdminUpdateDeviceStatusResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_UPDATE_DEVICE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminUpdateDeviceStatusResponse, "AdminUpdateDeviceStatus")
      end

      # Updates the specified user's attributes. To delete an attribute from your user, submit the attribute
      # in your API request with a blank value. For custom attributes, you must add a custom: prefix to the
      # attribute name, for example custom:department . This operation can set a user's email address or
      # phone number as verified and permit immediate sign-in in user pools that require verification of
      # these attributes. To do this, set the email_verified or phone_number_verified attribute to true .
      # Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints This action might
      # generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to register an
      # origination phone number before you can send SMS messages to US phone numbers. If you use SMS text
      # messages in Amazon Cognito, you must register a phone number with Amazon Pinpoint . Amazon Cognito
      # uses the registered number automatically. Otherwise, Amazon Cognito users who must receive SMS
      # messages might not be able to sign up, activate their accounts, or sign in. If you have never used
      # SMS text messages with Amazon Cognito or any other Amazon Web Services service, Amazon Simple
      # Notification Service might place your account in the SMS sandbox. In sandbox mode , you can send
      # messages only to verified phone numbers. After you test your app while in the sandbox environment,
      # you can move out of the sandbox and into production. For more information, see SMS message settings
      # for Amazon Cognito user pools in the Amazon Cognito Developer Guide .

      def admin_update_user_attributes(
        user_attributes : Array(Types::AttributeType),
        user_pool_id : String,
        username : String,
        client_metadata : Hash(String, String)? = nil
      ) : Types::AdminUpdateUserAttributesResponse

        input = Types::AdminUpdateUserAttributesRequest.new(user_attributes: user_attributes, user_pool_id: user_pool_id, username: username, client_metadata: client_metadata)
        admin_update_user_attributes(input)
      end

      def admin_update_user_attributes(input : Types::AdminUpdateUserAttributesRequest) : Types::AdminUpdateUserAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_UPDATE_USER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminUpdateUserAttributesResponse, "AdminUpdateUserAttributes")
      end

      # Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this
      # operation with your administrative credentials when your user signs out of your app. This results in
      # the following behavior. Amazon Cognito no longer accepts token-authorized user operations that you
      # authorize with a signed-out user's access tokens. For more information, see Using the Amazon Cognito
      # user pools API and user pool endpoints . Amazon Cognito returns an Access Token has been revoked
      # error when your app attempts to authorize a user pools API request with a revoked access token that
      # contains the scope aws.cognito.signin.user.admin . Amazon Cognito no longer accepts a signed-out
      # user's ID token in a GetId request to an identity pool with ServerSideTokenCheck enabled for its
      # user pool IdP configuration in CognitoIdentityProvider . Amazon Cognito no longer accepts a
      # signed-out user's refresh tokens in refresh requests. Other requests might be valid until your
      # user's token expires. This operation doesn't clear the managed login session cookie. To clear the
      # session for a user who signed in with managed login or the classic hosted UI, direct their browser
      # session to the logout endpoint . Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def admin_user_global_sign_out(
        user_pool_id : String,
        username : String
      ) : Types::AdminUserGlobalSignOutResponse

        input = Types::AdminUserGlobalSignOutRequest.new(user_pool_id: user_pool_id, username: username)
        admin_user_global_sign_out(input)
      end

      def admin_user_global_sign_out(input : Types::AdminUserGlobalSignOutRequest) : Types::AdminUserGlobalSignOutResponse
        request = Protocol::JsonRpc.build_request(Model::ADMIN_USER_GLOBAL_SIGN_OUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AdminUserGlobalSignOutResponse, "AdminUserGlobalSignOut")
      end

      # Begins setup of time-based one-time password (TOTP) multi-factor authentication (MFA) for a user,
      # with a unique private key that Amazon Cognito generates and returns in the API response. You can
      # authorize an AssociateSoftwareToken request with either the user's access token, or a session string
      # from a challenge response that you received from Amazon Cognito. Amazon Cognito doesn't evaluate
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions
      # in policies. For more information about authorization models in Amazon Cognito, see Using the Amazon
      # Cognito user pools API and user pool endpoints . Authorize this action with a signed-in user's
      # access token. It must include the scope aws.cognito.signin.user.admin .

      def associate_software_token(
        access_token : String? = nil,
        session : String? = nil
      ) : Types::AssociateSoftwareTokenResponse

        input = Types::AssociateSoftwareTokenRequest.new(access_token: access_token, session: session)
        associate_software_token(input)
      end

      def associate_software_token(input : Types::AssociateSoftwareTokenRequest) : Types::AssociateSoftwareTokenResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SOFTWARE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateSoftwareTokenResponse, "AssociateSoftwareToken")
      end

      # Changes the password for the currently signed-in user. Authorize this action with a signed-in user's
      # access token. It must include the scope aws.cognito.signin.user.admin . Amazon Cognito doesn't
      # evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions
      # in policies. For more information about authorization models in Amazon Cognito, see Using the Amazon
      # Cognito user pools API and user pool endpoints .

      def change_password(
        access_token : String,
        proposed_password : String,
        previous_password : String? = nil
      ) : Types::ChangePasswordResponse

        input = Types::ChangePasswordRequest.new(access_token: access_token, proposed_password: proposed_password, previous_password: previous_password)
        change_password(input)
      end

      def change_password(input : Types::ChangePasswordRequest) : Types::ChangePasswordResponse
        request = Protocol::JsonRpc.build_request(Model::CHANGE_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ChangePasswordResponse, "ChangePassword")
      end

      # Completes registration of a passkey authenticator for the currently signed-in user. Authorize this
      # action with a signed-in user's access token. It must include the scope aws.cognito.signin.user.admin
      # .

      def complete_web_authn_registration(
        access_token : String,
        credential : Types::Document
      ) : Types::CompleteWebAuthnRegistrationResponse

        input = Types::CompleteWebAuthnRegistrationRequest.new(access_token: access_token, credential: credential)
        complete_web_authn_registration(input)
      end

      def complete_web_authn_registration(input : Types::CompleteWebAuthnRegistrationRequest) : Types::CompleteWebAuthnRegistrationResponse
        request = Protocol::JsonRpc.build_request(Model::COMPLETE_WEB_AUTHN_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CompleteWebAuthnRegistrationResponse, "CompleteWebAuthnRegistration")
      end

      # Confirms a device that a user wants to remember. A remembered device is a "Remember me on this
      # device" option for user pools that perform authentication with the device key of a trusted device in
      # the back end, instead of a user-provided MFA code. For more information about device authentication,
      # see Working with user devices in your user pool . Authorize this action with a signed-in user's
      # access token. It must include the scope aws.cognito.signin.user.admin . Amazon Cognito doesn't
      # evaluate Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions
      # in policies. For more information about authorization models in Amazon Cognito, see Using the Amazon
      # Cognito user pools API and user pool endpoints .

      def confirm_device(
        access_token : String,
        device_key : String,
        device_name : String? = nil,
        device_secret_verifier_config : Types::DeviceSecretVerifierConfigType? = nil
      ) : Types::ConfirmDeviceResponse

        input = Types::ConfirmDeviceRequest.new(access_token: access_token, device_key: device_key, device_name: device_name, device_secret_verifier_config: device_secret_verifier_config)
        confirm_device(input)
      end

      def confirm_device(input : Types::ConfirmDeviceRequest) : Types::ConfirmDeviceResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmDeviceResponse, "ConfirmDevice")
      end

      # This public API operation accepts a confirmation code that Amazon Cognito sent to a user and accepts
      # a new password for that user. Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def confirm_forgot_password(
        client_id : String,
        confirmation_code : String,
        password : String,
        username : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        client_metadata : Hash(String, String)? = nil,
        secret_hash : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::ConfirmForgotPasswordResponse

        input = Types::ConfirmForgotPasswordRequest.new(client_id: client_id, confirmation_code: confirmation_code, password: password, username: username, analytics_metadata: analytics_metadata, client_metadata: client_metadata, secret_hash: secret_hash, user_context_data: user_context_data)
        confirm_forgot_password(input)
      end

      def confirm_forgot_password(input : Types::ConfirmForgotPasswordRequest) : Types::ConfirmForgotPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_FORGOT_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmForgotPasswordResponse, "ConfirmForgotPassword")
      end

      # Confirms the account of a new user. This public API operation submits a code that Amazon Cognito
      # sent to your user when they signed up in your user pool. After your user enters their code, they
      # confirm ownership of the email address or phone number that they provided, and their user account
      # becomes active. Depending on your user pool configuration, your users will receive their
      # confirmation code in an email or SMS message. Local users who signed up in your user pool are the
      # only type of user who can confirm sign-up with a code. Users who federate through an external
      # identity provider (IdP) have already been confirmed by their IdP. Amazon Cognito doesn't evaluate
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions
      # in policies. For more information about authorization models in Amazon Cognito, see Using the Amazon
      # Cognito user pools API and user pool endpoints .

      def confirm_sign_up(
        client_id : String,
        confirmation_code : String,
        username : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        client_metadata : Hash(String, String)? = nil,
        force_alias_creation : Bool? = nil,
        secret_hash : String? = nil,
        session : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::ConfirmSignUpResponse

        input = Types::ConfirmSignUpRequest.new(client_id: client_id, confirmation_code: confirmation_code, username: username, analytics_metadata: analytics_metadata, client_metadata: client_metadata, force_alias_creation: force_alias_creation, secret_hash: secret_hash, session: session, user_context_data: user_context_data)
        confirm_sign_up(input)
      end

      def confirm_sign_up(input : Types::ConfirmSignUpRequest) : Types::ConfirmSignUpResponse
        request = Protocol::JsonRpc.build_request(Model::CONFIRM_SIGN_UP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConfirmSignUpResponse, "ConfirmSignUp")
      end

      # Creates a new group in the specified user pool. For more information about user pool groups, see
      # Adding groups to a user pool . Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def create_group(
        group_name : String,
        user_pool_id : String,
        description : String? = nil,
        precedence : Int32? = nil,
        role_arn : String? = nil
      ) : Types::CreateGroupResponse

        input = Types::CreateGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id, description: description, precedence: precedence, role_arn: role_arn)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Types::CreateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGroupResponse, "CreateGroup")
      end

      # Adds a configuration and trust relationship between a third-party identity provider (IdP) and a user
      # pool. Amazon Cognito accepts sign-in with third-party identity providers through managed login and
      # OIDC relying-party libraries. For more information, see Third-party IdP sign-in . Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def create_identity_provider(
        provider_details : Hash(String, String),
        provider_name : String,
        provider_type : String,
        user_pool_id : String,
        attribute_mapping : Hash(String, String)? = nil,
        idp_identifiers : Array(String)? = nil
      ) : Types::CreateIdentityProviderResponse

        input = Types::CreateIdentityProviderRequest.new(provider_details: provider_details, provider_name: provider_name, provider_type: provider_type, user_pool_id: user_pool_id, attribute_mapping: attribute_mapping, idp_identifiers: idp_identifiers)
        create_identity_provider(input)
      end

      def create_identity_provider(input : Types::CreateIdentityProviderRequest) : Types::CreateIdentityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IDENTITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIdentityProviderResponse, "CreateIdentityProvider")
      end

      # Creates a new set of branding settings for a user pool style and associates it with an app client.
      # This operation is the programmatic option for the creation of a new style in the branding editor.
      # Provides values for UI customization in a Settings JSON object and image files in an Assets array.
      # To send the JSON object Document type parameter in Settings , you might need to update to the most
      # recent version of your Amazon Web Services SDK. To create a new style with default settings, set
      # UseCognitoProvidedValues to true and don't provide values for any other options. This operation has
      # a 2-megabyte request-size limit and include the CSS settings and image assets for your app client.
      # Your branding settings might exceed 2MB in size. Amazon Cognito doesn't require that you pass all
      # parameters in one request and preserves existing style settings that you don't specify. If your
      # request is larger than 2MB, separate it into multiple requests, each with a size smaller than the
      # limit. Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this
      # API operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def create_managed_login_branding(
        client_id : String,
        user_pool_id : String,
        assets : Array(Types::AssetType)? = nil,
        settings : Types::Document? = nil,
        use_cognito_provided_values : Bool? = nil
      ) : Types::CreateManagedLoginBrandingResponse

        input = Types::CreateManagedLoginBrandingRequest.new(client_id: client_id, user_pool_id: user_pool_id, assets: assets, settings: settings, use_cognito_provided_values: use_cognito_provided_values)
        create_managed_login_branding(input)
      end

      def create_managed_login_branding(input : Types::CreateManagedLoginBrandingRequest) : Types::CreateManagedLoginBrandingResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MANAGED_LOGIN_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateManagedLoginBrandingResponse, "CreateManagedLoginBranding")
      end

      # Creates a new OAuth2.0 resource server and defines custom scopes within it. Resource servers are
      # associated with custom scopes and machine-to-machine (M2M) authorization. For more information, see
      # Access control with resource servers . Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def create_resource_server(
        identifier : String,
        name : String,
        user_pool_id : String,
        scopes : Array(Types::ResourceServerScopeType)? = nil
      ) : Types::CreateResourceServerResponse

        input = Types::CreateResourceServerRequest.new(identifier: identifier, name: name, user_pool_id: user_pool_id, scopes: scopes)
        create_resource_server(input)
      end

      def create_resource_server(input : Types::CreateResourceServerRequest) : Types::CreateResourceServerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceServerResponse, "CreateResourceServer")
      end

      # Creates terms documents for the requested app client. When Terms and conditions and Privacy policy
      # documents are configured, the app client displays links to them in the sign-up page of managed login
      # for the app client. You can provide URLs for terms documents in the languages that are supported by
      # managed login localization . Amazon Cognito directs users to the terms documents for their current
      # language, with fallback to default if no document exists for the language. Each request accepts one
      # type of terms document and a map of language-to-link for that document type. You must provide both
      # types of terms documents in at least one language before Amazon Cognito displays your terms
      # documents. Supply each type in separate requests. For more information, see Terms documents . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def create_terms(
        client_id : String,
        enforcement : String,
        terms_name : String,
        terms_source : String,
        user_pool_id : String,
        links : Hash(String, String)? = nil
      ) : Types::CreateTermsResponse

        input = Types::CreateTermsRequest.new(client_id: client_id, enforcement: enforcement, terms_name: terms_name, terms_source: terms_source, user_pool_id: user_pool_id, links: links)
        create_terms(input)
      end

      def create_terms(input : Types::CreateTermsRequest) : Types::CreateTermsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTermsResponse, "CreateTerms")
      end

      # Creates a user import job. You can import users into user pools from a comma-separated values (CSV)
      # file without adding Amazon Cognito MAU costs to your Amazon Web Services bill. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def create_user_import_job(
        cloud_watch_logs_role_arn : String,
        job_name : String,
        user_pool_id : String
      ) : Types::CreateUserImportJobResponse

        input = Types::CreateUserImportJobRequest.new(cloud_watch_logs_role_arn: cloud_watch_logs_role_arn, job_name: job_name, user_pool_id: user_pool_id)
        create_user_import_job(input)
      end

      def create_user_import_job(input : Types::CreateUserImportJobRequest) : Types::CreateUserImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserImportJobResponse, "CreateUserImportJob")
      end

      # Creates a new Amazon Cognito user pool. This operation sets basic and advanced configuration
      # options. If you don't provide a value for an attribute, Amazon Cognito sets it to its default value.
      # This action might generate an SMS text message. Starting June 1, 2021, US telecom carriers require
      # you to register an origination phone number before you can send SMS messages to US phone numbers. If
      # you use SMS text messages in Amazon Cognito, you must register a phone number with Amazon Pinpoint .
      # Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must
      # receive SMS messages might not be able to sign up, activate their accounts, or sign in. If you have
      # never used SMS text messages with Amazon Cognito or any other Amazon Web Services service, Amazon
      # Simple Notification Service might place your account in the SMS sandbox. In sandbox mode , you can
      # send messages only to verified phone numbers. After you test your app while in the sandbox
      # environment, you can move out of the sandbox and into production. For more information, see SMS
      # message settings for Amazon Cognito user pools in the Amazon Cognito Developer Guide . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def create_user_pool(
        pool_name : String,
        account_recovery_setting : Types::AccountRecoverySettingType? = nil,
        admin_create_user_config : Types::AdminCreateUserConfigType? = nil,
        alias_attributes : Array(String)? = nil,
        auto_verified_attributes : Array(String)? = nil,
        deletion_protection : String? = nil,
        device_configuration : Types::DeviceConfigurationType? = nil,
        email_configuration : Types::EmailConfigurationType? = nil,
        email_verification_message : String? = nil,
        email_verification_subject : String? = nil,
        lambda_config : Types::LambdaConfigType? = nil,
        mfa_configuration : String? = nil,
        policies : Types::UserPoolPolicyType? = nil,
        schema : Array(Types::SchemaAttributeType)? = nil,
        sms_authentication_message : String? = nil,
        sms_configuration : Types::SmsConfigurationType? = nil,
        sms_verification_message : String? = nil,
        user_attribute_update_settings : Types::UserAttributeUpdateSettingsType? = nil,
        user_pool_add_ons : Types::UserPoolAddOnsType? = nil,
        user_pool_tags : Hash(String, String)? = nil,
        user_pool_tier : String? = nil,
        username_attributes : Array(String)? = nil,
        username_configuration : Types::UsernameConfigurationType? = nil,
        verification_message_template : Types::VerificationMessageTemplateType? = nil
      ) : Types::CreateUserPoolResponse

        input = Types::CreateUserPoolRequest.new(pool_name: pool_name, account_recovery_setting: account_recovery_setting, admin_create_user_config: admin_create_user_config, alias_attributes: alias_attributes, auto_verified_attributes: auto_verified_attributes, deletion_protection: deletion_protection, device_configuration: device_configuration, email_configuration: email_configuration, email_verification_message: email_verification_message, email_verification_subject: email_verification_subject, lambda_config: lambda_config, mfa_configuration: mfa_configuration, policies: policies, schema: schema, sms_authentication_message: sms_authentication_message, sms_configuration: sms_configuration, sms_verification_message: sms_verification_message, user_attribute_update_settings: user_attribute_update_settings, user_pool_add_ons: user_pool_add_ons, user_pool_tags: user_pool_tags, user_pool_tier: user_pool_tier, username_attributes: username_attributes, username_configuration: username_configuration, verification_message_template: verification_message_template)
        create_user_pool(input)
      end

      def create_user_pool(input : Types::CreateUserPoolRequest) : Types::CreateUserPoolResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserPoolResponse, "CreateUserPool")
      end

      # Creates an app client in a user pool. This operation sets basic and advanced configuration options.
      # Unlike app clients created in the console, Amazon Cognito doesn't automatically assign a branding
      # style to app clients that you configure with this API operation. Managed login and classic hosted UI
      # pages aren't available for your client until after you apply a branding style. If you don't provide
      # a value for an attribute, Amazon Cognito sets it to its default value. Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def create_user_pool_client(
        client_name : String,
        user_pool_id : String,
        access_token_validity : Int32? = nil,
        allowed_o_auth_flows : Array(String)? = nil,
        allowed_o_auth_flows_user_pool_client : Bool? = nil,
        allowed_o_auth_scopes : Array(String)? = nil,
        analytics_configuration : Types::AnalyticsConfigurationType? = nil,
        auth_session_validity : Int32? = nil,
        callback_ur_ls : Array(String)? = nil,
        default_redirect_uri : String? = nil,
        enable_propagate_additional_user_context_data : Bool? = nil,
        enable_token_revocation : Bool? = nil,
        explicit_auth_flows : Array(String)? = nil,
        generate_secret : Bool? = nil,
        id_token_validity : Int32? = nil,
        logout_ur_ls : Array(String)? = nil,
        prevent_user_existence_errors : String? = nil,
        read_attributes : Array(String)? = nil,
        refresh_token_rotation : Types::RefreshTokenRotationType? = nil,
        refresh_token_validity : Int32? = nil,
        supported_identity_providers : Array(String)? = nil,
        token_validity_units : Types::TokenValidityUnitsType? = nil,
        write_attributes : Array(String)? = nil
      ) : Types::CreateUserPoolClientResponse

        input = Types::CreateUserPoolClientRequest.new(client_name: client_name, user_pool_id: user_pool_id, access_token_validity: access_token_validity, allowed_o_auth_flows: allowed_o_auth_flows, allowed_o_auth_flows_user_pool_client: allowed_o_auth_flows_user_pool_client, allowed_o_auth_scopes: allowed_o_auth_scopes, analytics_configuration: analytics_configuration, auth_session_validity: auth_session_validity, callback_ur_ls: callback_ur_ls, default_redirect_uri: default_redirect_uri, enable_propagate_additional_user_context_data: enable_propagate_additional_user_context_data, enable_token_revocation: enable_token_revocation, explicit_auth_flows: explicit_auth_flows, generate_secret: generate_secret, id_token_validity: id_token_validity, logout_ur_ls: logout_ur_ls, prevent_user_existence_errors: prevent_user_existence_errors, read_attributes: read_attributes, refresh_token_rotation: refresh_token_rotation, refresh_token_validity: refresh_token_validity, supported_identity_providers: supported_identity_providers, token_validity_units: token_validity_units, write_attributes: write_attributes)
        create_user_pool_client(input)
      end

      def create_user_pool_client(input : Types::CreateUserPoolClientRequest) : Types::CreateUserPoolClientResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_POOL_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserPoolClientResponse, "CreateUserPoolClient")
      end

      # A user pool domain hosts managed login, an authorization server and web server for authentication in
      # your application. This operation creates a new user pool prefix domain or custom domain and sets the
      # managed login branding version. Set the branding version to 1 for hosted UI (classic) or 2 for
      # managed login. When you choose a custom domain, you must provide an SSL certificate in the US East
      # (N. Virginia) Amazon Web Services Region in your request. Your prefix domain might take up to one
      # minute to take effect. Your custom domain is online within five minutes, but it can take up to one
      # hour to distribute your SSL certificate. For more information about adding a custom domain to your
      # user pool, see Configuring a user pool domain . Amazon Cognito evaluates Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you must use IAM
      # credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a
      # policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API
      # and user pool endpoints

      def create_user_pool_domain(
        domain : String,
        user_pool_id : String,
        custom_domain_config : Types::CustomDomainConfigType? = nil,
        managed_login_version : Int32? = nil
      ) : Types::CreateUserPoolDomainResponse

        input = Types::CreateUserPoolDomainRequest.new(domain: domain, user_pool_id: user_pool_id, custom_domain_config: custom_domain_config, managed_login_version: managed_login_version)
        create_user_pool_domain(input)
      end

      def create_user_pool_domain(input : Types::CreateUserPoolDomainRequest) : Types::CreateUserPoolDomainResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_POOL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserPoolDomainResponse, "CreateUserPoolDomain")
      end

      # Deletes a group from the specified user pool. When you delete a group, that group no longer
      # contributes to users' cognito:preferred_group or cognito:groups claims, and no longer influence
      # access-control decision that are based on group membership. For more information about user pool
      # groups, see Adding groups to a user pool . Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def delete_group(
        group_name : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a user pool identity provider (IdP). After you delete an IdP, users can no longer sign in to
      # your user pool through that IdP. For more information about user pool IdPs, see Third-party IdP
      # sign-in . Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for
      # this API operation. For this operation, you must use IAM credentials to authorize requests, and you
      # must grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web
      # Services API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def delete_identity_provider(
        provider_name : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteIdentityProviderRequest.new(provider_name: provider_name, user_pool_id: user_pool_id)
        delete_identity_provider(input)
      end

      def delete_identity_provider(input : Types::DeleteIdentityProviderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a managed login branding style. When you delete a style, you delete the branding association
      # for an app client. When an app client doesn't have a style assigned, your managed login pages for
      # that app client are nonfunctional until you create a new style or switch the domain branding
      # version. Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this
      # API operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def delete_managed_login_branding(
        managed_login_branding_id : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteManagedLoginBrandingRequest.new(managed_login_branding_id: managed_login_branding_id, user_pool_id: user_pool_id)
        delete_managed_login_branding(input)
      end

      def delete_managed_login_branding(input : Types::DeleteManagedLoginBrandingRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MANAGED_LOGIN_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a resource server. After you delete a resource server, users can no longer generate access
      # tokens with scopes that are associate with that resource server. Resource servers are associated
      # with custom scopes and machine-to-machine (M2M) authorization. For more information, see Access
      # control with resource servers . Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def delete_resource_server(
        identifier : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteResourceServerRequest.new(identifier: identifier, user_pool_id: user_pool_id)
        delete_resource_server(input)
      end

      def delete_resource_server(input : Types::DeleteResourceServerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the terms documents with the requested ID from your app client. Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def delete_terms(
        terms_id : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteTermsRequest.new(terms_id: terms_id, user_pool_id: user_pool_id)
        delete_terms(input)
      end

      def delete_terms(input : Types::DeleteTermsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the profile of the currently signed-in user. A deleted user profile can no longer be used to
      # sign in and can't be restored. Authorize this action with a signed-in user's access token. It must
      # include the scope aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you can't
      # use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more
      # information about authorization models in Amazon Cognito, see Using the Amazon Cognito user pools
      # API and user pool endpoints .

      def delete_user(
        access_token : String
      ) : Nil

        input = Types::DeleteUserRequest.new(access_token: access_token)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes attributes from the currently signed-in user. For example, your application can submit a
      # request to this operation when a user wants to remove their birthdate attribute value. Authorize
      # this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def delete_user_attributes(
        access_token : String,
        user_attribute_names : Array(String)
      ) : Types::DeleteUserAttributesResponse

        input = Types::DeleteUserAttributesRequest.new(access_token: access_token, user_attribute_names: user_attribute_names)
        delete_user_attributes(input)
      end

      def delete_user_attributes(input : Types::DeleteUserAttributesRequest) : Types::DeleteUserAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserAttributesResponse, "DeleteUserAttributes")
      end

      # Deletes a user pool. After you delete a user pool, users can no longer sign in to any associated
      # applications. When you delete a user pool, it's no longer visible or operational in your Amazon Web
      # Services account. Amazon Cognito retains deleted user pools in an inactive state for 14 days, then
      # begins a cleanup process that fully removes them from Amazon Web Services systems. In case of
      # accidental deletion, contact Amazon Web ServicesSupport within 14 days for restoration assistance.
      # Amazon Cognito begins full deletion of all resources from deleted user pools after 14 days. In the
      # case of large user pools, the cleanup process might take significant additional time before all user
      # data is permanently deleted.

      def delete_user_pool(
        user_pool_id : String
      ) : Nil

        input = Types::DeleteUserPoolRequest.new(user_pool_id: user_pool_id)
        delete_user_pool(input)
      end

      def delete_user_pool(input : Types::DeleteUserPoolRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a user pool app client. After you delete an app client, users can no longer sign in to the
      # associated application.

      def delete_user_pool_client(
        client_id : String,
        user_pool_id : String
      ) : Nil

        input = Types::DeleteUserPoolClientRequest.new(client_id: client_id, user_pool_id: user_pool_id)
        delete_user_pool_client(input)
      end

      def delete_user_pool_client(input : Types::DeleteUserPoolClientRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_POOL_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Given a user pool ID and domain identifier, deletes a user pool domain. After you delete a user pool
      # domain, your managed login pages and authorization server are no longer available.

      def delete_user_pool_domain(
        domain : String,
        user_pool_id : String
      ) : Types::DeleteUserPoolDomainResponse

        input = Types::DeleteUserPoolDomainRequest.new(domain: domain, user_pool_id: user_pool_id)
        delete_user_pool_domain(input)
      end

      def delete_user_pool_domain(input : Types::DeleteUserPoolDomainRequest) : Types::DeleteUserPoolDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_POOL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserPoolDomainResponse, "DeleteUserPoolDomain")
      end

      # Deletes a registered passkey, or WebAuthn, authenticator for the currently signed-in user. Authorize
      # this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def delete_web_authn_credential(
        access_token : String,
        credential_id : String
      ) : Types::DeleteWebAuthnCredentialResponse

        input = Types::DeleteWebAuthnCredentialRequest.new(access_token: access_token, credential_id: credential_id)
        delete_web_authn_credential(input)
      end

      def delete_web_authn_credential(input : Types::DeleteWebAuthnCredentialRequest) : Types::DeleteWebAuthnCredentialResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEB_AUTHN_CREDENTIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWebAuthnCredentialResponse, "DeleteWebAuthnCredential")
      end

      # Given a user pool ID and identity provider (IdP) name, returns details about the IdP.

      def describe_identity_provider(
        provider_name : String,
        user_pool_id : String
      ) : Types::DescribeIdentityProviderResponse

        input = Types::DescribeIdentityProviderRequest.new(provider_name: provider_name, user_pool_id: user_pool_id)
        describe_identity_provider(input)
      end

      def describe_identity_provider(input : Types::DescribeIdentityProviderRequest) : Types::DescribeIdentityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IDENTITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeIdentityProviderResponse, "DescribeIdentityProvider")
      end

      # Given the ID of a managed login branding style, returns detailed information about the style.

      def describe_managed_login_branding(
        managed_login_branding_id : String,
        user_pool_id : String,
        return_merged_resources : Bool? = nil
      ) : Types::DescribeManagedLoginBrandingResponse

        input = Types::DescribeManagedLoginBrandingRequest.new(managed_login_branding_id: managed_login_branding_id, user_pool_id: user_pool_id, return_merged_resources: return_merged_resources)
        describe_managed_login_branding(input)
      end

      def describe_managed_login_branding(input : Types::DescribeManagedLoginBrandingRequest) : Types::DescribeManagedLoginBrandingResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MANAGED_LOGIN_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeManagedLoginBrandingResponse, "DescribeManagedLoginBranding")
      end

      # Given the ID of a user pool app client, returns detailed information about the style assigned to the
      # app client.

      def describe_managed_login_branding_by_client(
        client_id : String,
        user_pool_id : String,
        return_merged_resources : Bool? = nil
      ) : Types::DescribeManagedLoginBrandingByClientResponse

        input = Types::DescribeManagedLoginBrandingByClientRequest.new(client_id: client_id, user_pool_id: user_pool_id, return_merged_resources: return_merged_resources)
        describe_managed_login_branding_by_client(input)
      end

      def describe_managed_login_branding_by_client(input : Types::DescribeManagedLoginBrandingByClientRequest) : Types::DescribeManagedLoginBrandingByClientResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MANAGED_LOGIN_BRANDING_BY_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeManagedLoginBrandingByClientResponse, "DescribeManagedLoginBrandingByClient")
      end

      # Describes a resource server. For more information about resource servers, see Access control with
      # resource servers .

      def describe_resource_server(
        identifier : String,
        user_pool_id : String
      ) : Types::DescribeResourceServerResponse

        input = Types::DescribeResourceServerRequest.new(identifier: identifier, user_pool_id: user_pool_id)
        describe_resource_server(input)
      end

      def describe_resource_server(input : Types::DescribeResourceServerRequest) : Types::DescribeResourceServerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourceServerResponse, "DescribeResourceServer")
      end

      # Given an app client or user pool ID where threat protection is configured, describes the risk
      # configuration. This operation returns details about adaptive authentication, compromised
      # credentials, and IP-address allow- and denylists. For more information about threat protection, see
      # Threat protection .

      def describe_risk_configuration(
        user_pool_id : String,
        client_id : String? = nil
      ) : Types::DescribeRiskConfigurationResponse

        input = Types::DescribeRiskConfigurationRequest.new(user_pool_id: user_pool_id, client_id: client_id)
        describe_risk_configuration(input)
      end

      def describe_risk_configuration(input : Types::DescribeRiskConfigurationRequest) : Types::DescribeRiskConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RISK_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRiskConfigurationResponse, "DescribeRiskConfiguration")
      end

      # Returns details for the requested terms documents ID. For more information, see Terms documents .
      # Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def describe_terms(
        terms_id : String,
        user_pool_id : String
      ) : Types::DescribeTermsResponse

        input = Types::DescribeTermsRequest.new(terms_id: terms_id, user_pool_id: user_pool_id)
        describe_terms(input)
      end

      def describe_terms(input : Types::DescribeTermsRequest) : Types::DescribeTermsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTermsResponse, "DescribeTerms")
      end

      # Describes a user import job. For more information about user CSV import, see Importing users from a
      # CSV file .

      def describe_user_import_job(
        job_id : String,
        user_pool_id : String
      ) : Types::DescribeUserImportJobResponse

        input = Types::DescribeUserImportJobRequest.new(job_id: job_id, user_pool_id: user_pool_id)
        describe_user_import_job(input)
      end

      def describe_user_import_job(input : Types::DescribeUserImportJobRequest) : Types::DescribeUserImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserImportJobResponse, "DescribeUserImportJob")
      end

      # Given a user pool ID, returns configuration information. This operation is useful when you want to
      # inspect an existing user pool and programmatically replicate the configuration to another user pool.
      # Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def describe_user_pool(
        user_pool_id : String
      ) : Types::DescribeUserPoolResponse

        input = Types::DescribeUserPoolRequest.new(user_pool_id: user_pool_id)
        describe_user_pool(input)
      end

      def describe_user_pool(input : Types::DescribeUserPoolRequest) : Types::DescribeUserPoolResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserPoolResponse, "DescribeUserPool")
      end

      # Given an app client ID, returns configuration information. This operation is useful when you want to
      # inspect an existing app client and programmatically replicate the configuration to another app
      # client. For more information about app clients, see App clients . Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def describe_user_pool_client(
        client_id : String,
        user_pool_id : String
      ) : Types::DescribeUserPoolClientResponse

        input = Types::DescribeUserPoolClientRequest.new(client_id: client_id, user_pool_id: user_pool_id)
        describe_user_pool_client(input)
      end

      def describe_user_pool_client(input : Types::DescribeUserPoolClientRequest) : Types::DescribeUserPoolClientResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_POOL_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserPoolClientResponse, "DescribeUserPoolClient")
      end

      # Given a user pool domain name, returns information about the domain configuration. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def describe_user_pool_domain(
        domain : String
      ) : Types::DescribeUserPoolDomainResponse

        input = Types::DescribeUserPoolDomainRequest.new(domain: domain)
        describe_user_pool_domain(input)
      end

      def describe_user_pool_domain(input : Types::DescribeUserPoolDomainRequest) : Types::DescribeUserPoolDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_POOL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserPoolDomainResponse, "DescribeUserPoolDomain")
      end

      # Given a device key, deletes a remembered device as the currently signed-in user. For more
      # information about device authentication, see Working with user devices in your user pool . Authorize
      # this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def forget_device(
        device_key : String,
        access_token : String? = nil
      ) : Nil

        input = Types::ForgetDeviceRequest.new(device_key: device_key, access_token: access_token)
        forget_device(input)
      end

      def forget_device(input : Types::ForgetDeviceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::FORGET_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Sends a password-reset confirmation code to the email address or phone number of the requested
      # username. The message delivery method is determined by the user's available attributes and the
      # AccountRecoverySetting configuration of the user pool. For the Username parameter, you can use the
      # username or an email, phone, or preferred username alias. If neither a verified phone number nor a
      # verified email exists, Amazon Cognito responds with an InvalidParameterException error . If your app
      # client has a client secret and you don't provide a SECRET_HASH parameter, this API returns
      # NotAuthorizedException . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints . This action might generate an SMS text message. Starting June 1, 2021, US telecom
      # carriers require you to register an origination phone number before you can send SMS messages to US
      # phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with
      # Amazon Pinpoint . Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito
      # users who must receive SMS messages might not be able to sign up, activate their accounts, or sign
      # in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Services
      # service, Amazon Simple Notification Service might place your account in the SMS sandbox. In sandbox
      # mode , you can send messages only to verified phone numbers. After you test your app while in the
      # sandbox environment, you can move out of the sandbox and into production. For more information, see
      # SMS message settings for Amazon Cognito user pools in the Amazon Cognito Developer Guide .

      def forgot_password(
        client_id : String,
        username : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        client_metadata : Hash(String, String)? = nil,
        secret_hash : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::ForgotPasswordResponse

        input = Types::ForgotPasswordRequest.new(client_id: client_id, username: username, analytics_metadata: analytics_metadata, client_metadata: client_metadata, secret_hash: secret_hash, user_context_data: user_context_data)
        forgot_password(input)
      end

      def forgot_password(input : Types::ForgotPasswordRequest) : Types::ForgotPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::FORGOT_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ForgotPasswordResponse, "ForgotPassword")
      end

      # Given a user pool ID, generates a comma-separated value (CSV) list populated with available user
      # attributes in the user pool. This list is the header for the CSV file that determines the users in a
      # user import job. Save the content of CSVHeader in the response as a .csv file and populate it with
      # the usernames and attributes of users that you want to import. For more information about CSV user
      # import, see Importing users from a CSV file . Amazon Cognito evaluates Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you must use IAM
      # credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a
      # policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API
      # and user pool endpoints

      def get_csv_header(
        user_pool_id : String
      ) : Types::GetCSVHeaderResponse

        input = Types::GetCSVHeaderRequest.new(user_pool_id: user_pool_id)
        get_csv_header(input)
      end

      def get_csv_header(input : Types::GetCSVHeaderRequest) : Types::GetCSVHeaderResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CSV_HEADER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCSVHeaderResponse, "GetCSVHeader")
      end

      # Given a device key, returns information about a remembered device for the current user. For more
      # information about device authentication, see Working with user devices in your user pool . Authorize
      # this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def get_device(
        device_key : String,
        access_token : String? = nil
      ) : Types::GetDeviceResponse

        input = Types::GetDeviceRequest.new(device_key: device_key, access_token: access_token)
        get_device(input)
      end

      def get_device(input : Types::GetDeviceRequest) : Types::GetDeviceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeviceResponse, "GetDevice")
      end

      # Given a user pool ID and a group name, returns information about the user group. For more
      # information about user pool groups, see Adding groups to a user pool . Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def get_group(
        group_name : String,
        user_pool_id : String
      ) : Types::GetGroupResponse

        input = Types::GetGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id)
        get_group(input)
      end

      def get_group(input : Types::GetGroupRequest) : Types::GetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGroupResponse, "GetGroup")
      end

      # Given the identifier of an identity provider (IdP), for example examplecorp , returns information
      # about the user pool configuration for that IdP. For more information about IdPs, see Third-party IdP
      # sign-in .

      def get_identity_provider_by_identifier(
        idp_identifier : String,
        user_pool_id : String
      ) : Types::GetIdentityProviderByIdentifierResponse

        input = Types::GetIdentityProviderByIdentifierRequest.new(idp_identifier: idp_identifier, user_pool_id: user_pool_id)
        get_identity_provider_by_identifier(input)
      end

      def get_identity_provider_by_identifier(input : Types::GetIdentityProviderByIdentifierRequest) : Types::GetIdentityProviderByIdentifierResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IDENTITY_PROVIDER_BY_IDENTIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdentityProviderByIdentifierResponse, "GetIdentityProviderByIdentifier")
      end

      # Given a user pool ID, returns the logging configuration. User pools can export message-delivery
      # error and threat-protection activity logs to external Amazon Web Services services. For more
      # information, see Exporting user pool logs . Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def get_log_delivery_configuration(
        user_pool_id : String
      ) : Types::GetLogDeliveryConfigurationResponse

        input = Types::GetLogDeliveryConfigurationRequest.new(user_pool_id: user_pool_id)
        get_log_delivery_configuration(input)
      end

      def get_log_delivery_configuration(input : Types::GetLogDeliveryConfigurationRequest) : Types::GetLogDeliveryConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LOG_DELIVERY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLogDeliveryConfigurationResponse, "GetLogDeliveryConfiguration")
      end

      # Given a user pool ID, returns the signing certificate for SAML 2.0 federation. Issued certificates
      # are valid for 10 years from the date of issue. Amazon Cognito issues and assigns a new signing
      # certificate annually. This renewal process returns a new value in the response to
      # GetSigningCertificate , but doesn't invalidate the original certificate. For more information, see
      # Signing SAML requests . Amazon Cognito evaluates Identity and Access Management (IAM) policies in
      # requests for this API operation. For this operation, you must use IAM credentials to authorize
      # requests, and you must grant yourself the corresponding IAM permission in a policy. Learn more
      # Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def get_signing_certificate(
        user_pool_id : String
      ) : Types::GetSigningCertificateResponse

        input = Types::GetSigningCertificateRequest.new(user_pool_id: user_pool_id)
        get_signing_certificate(input)
      end

      def get_signing_certificate(input : Types::GetSigningCertificateRequest) : Types::GetSigningCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SIGNING_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSigningCertificateResponse, "GetSigningCertificate")
      end

      # Given a refresh token, issues new ID, access, and optionally refresh tokens for the user who owns
      # the submitted token. This operation issues a new refresh token and invalidates the original refresh
      # token after an optional grace period when refresh token rotation is enabled. If refresh token
      # rotation is disabled, issues new ID and access tokens only.

      def get_tokens_from_refresh_token(
        client_id : String,
        refresh_token : String,
        client_metadata : Hash(String, String)? = nil,
        client_secret : String? = nil,
        device_key : String? = nil
      ) : Types::GetTokensFromRefreshTokenResponse

        input = Types::GetTokensFromRefreshTokenRequest.new(client_id: client_id, refresh_token: refresh_token, client_metadata: client_metadata, client_secret: client_secret, device_key: device_key)
        get_tokens_from_refresh_token(input)
      end

      def get_tokens_from_refresh_token(input : Types::GetTokensFromRefreshTokenRequest) : Types::GetTokensFromRefreshTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TOKENS_FROM_REFRESH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTokensFromRefreshTokenResponse, "GetTokensFromRefreshToken")
      end

      # Given a user pool ID or app client, returns information about classic hosted UI branding that you
      # applied, if any. Returns user-pool level branding information if no app client branding is applied,
      # or if you don't specify an app client ID. Returns an empty object if you haven't applied hosted UI
      # branding to either the client or the user pool. For more information, see Hosted UI (classic)
      # branding .

      def get_ui_customization(
        user_pool_id : String,
        client_id : String? = nil
      ) : Types::GetUICustomizationResponse

        input = Types::GetUICustomizationRequest.new(user_pool_id: user_pool_id, client_id: client_id)
        get_ui_customization(input)
      end

      def get_ui_customization(input : Types::GetUICustomizationRequest) : Types::GetUICustomizationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_UI_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUICustomizationResponse, "GetUICustomization")
      end

      # Gets user attributes and and MFA settings for the currently signed-in user. Authorize this action
      # with a signed-in user's access token. It must include the scope aws.cognito.signin.user.admin .
      # Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this
      # API operation. For this operation, you can't use IAM credentials to authorize requests, and you
      # can't grant IAM permissions in policies. For more information about authorization models in Amazon
      # Cognito, see Using the Amazon Cognito user pools API and user pool endpoints .

      def get_user(
        access_token : String
      ) : Types::GetUserResponse

        input = Types::GetUserRequest.new(access_token: access_token)
        get_user(input)
      end

      def get_user(input : Types::GetUserRequest) : Types::GetUserResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserResponse, "GetUser")
      end

      # Given an attribute name, sends a user attribute verification code for the specified attribute name
      # to the currently signed-in user. Authorize this action with a signed-in user's access token. It must
      # include the scope aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you can't
      # use IAM credentials to authorize requests, and you can't grant IAM permissions in policies. For more
      # information about authorization models in Amazon Cognito, see Using the Amazon Cognito user pools
      # API and user pool endpoints . This action might generate an SMS text message. Starting June 1, 2021,
      # US telecom carriers require you to register an origination phone number before you can send SMS
      # messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a
      # phone number with Amazon Pinpoint . Amazon Cognito uses the registered number automatically.
      # Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate
      # their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any
      # other Amazon Web Services service, Amazon Simple Notification Service might place your account in
      # the SMS sandbox. In sandbox mode , you can send messages only to verified phone numbers. After you
      # test your app while in the sandbox environment, you can move out of the sandbox and into production.
      # For more information, see SMS message settings for Amazon Cognito user pools in the Amazon Cognito
      # Developer Guide .

      def get_user_attribute_verification_code(
        access_token : String,
        attribute_name : String,
        client_metadata : Hash(String, String)? = nil
      ) : Types::GetUserAttributeVerificationCodeResponse

        input = Types::GetUserAttributeVerificationCodeRequest.new(access_token: access_token, attribute_name: attribute_name, client_metadata: client_metadata)
        get_user_attribute_verification_code(input)
      end

      def get_user_attribute_verification_code(input : Types::GetUserAttributeVerificationCodeRequest) : Types::GetUserAttributeVerificationCodeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_ATTRIBUTE_VERIFICATION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserAttributeVerificationCodeResponse, "GetUserAttributeVerificationCode")
      end

      # Lists the authentication options for the currently signed-in user. Returns the following: The user's
      # multi-factor authentication (MFA) preferences. The user's options for choice-based authentication
      # with the USER_AUTH flow. Authorize this action with a signed-in user's access token. It must include
      # the scope aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM
      # credentials to authorize requests, and you can't grant IAM permissions in policies. For more
      # information about authorization models in Amazon Cognito, see Using the Amazon Cognito user pools
      # API and user pool endpoints .

      def get_user_auth_factors(
        access_token : String
      ) : Types::GetUserAuthFactorsResponse

        input = Types::GetUserAuthFactorsRequest.new(access_token: access_token)
        get_user_auth_factors(input)
      end

      def get_user_auth_factors(input : Types::GetUserAuthFactorsRequest) : Types::GetUserAuthFactorsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_AUTH_FACTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserAuthFactorsResponse, "GetUserAuthFactors")
      end

      # Given a user pool ID, returns configuration for sign-in with WebAuthn authenticators and for
      # multi-factor authentication (MFA). This operation describes the following: The WebAuthn relying
      # party (RP) ID and user-verification settings. The required, optional, or disabled state of MFA for
      # all user pool users. The message templates for email and SMS MFA. The enabled or disabled state of
      # time-based one-time password (TOTP) MFA. Amazon Cognito evaluates Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you must use IAM credentials
      # to authorize requests, and you must grant yourself the corresponding IAM permission in a policy.
      # Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user
      # pool endpoints

      def get_user_pool_mfa_config(
        user_pool_id : String
      ) : Types::GetUserPoolMfaConfigResponse

        input = Types::GetUserPoolMfaConfigRequest.new(user_pool_id: user_pool_id)
        get_user_pool_mfa_config(input)
      end

      def get_user_pool_mfa_config(input : Types::GetUserPoolMfaConfigRequest) : Types::GetUserPoolMfaConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_POOL_MFA_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserPoolMfaConfigResponse, "GetUserPoolMfaConfig")
      end

      # Invalidates the identity, access, and refresh tokens that Amazon Cognito issued to a user. Call this
      # operation when your user signs out of your app. This results in the following behavior. Amazon
      # Cognito no longer accepts token-authorized user operations that you authorize with a signed-out
      # user's access tokens. For more information, see Using the Amazon Cognito user pools API and user
      # pool endpoints . Amazon Cognito returns an Access Token has been revoked error when your app
      # attempts to authorize a user pools API request with a revoked access token that contains the scope
      # aws.cognito.signin.user.admin . Amazon Cognito no longer accepts a signed-out user's ID token in a
      # GetId request to an identity pool with ServerSideTokenCheck enabled for its user pool IdP
      # configuration in CognitoIdentityProvider . Amazon Cognito no longer accepts a signed-out user's
      # refresh tokens in refresh requests. Other requests might be valid until your user's token expires.
      # This operation doesn't clear the managed login session cookie. To clear the session for a user who
      # signed in with managed login or the classic hosted UI, direct their browser session to the logout
      # endpoint . Authorize this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def global_sign_out(
        access_token : String
      ) : Types::GlobalSignOutResponse

        input = Types::GlobalSignOutRequest.new(access_token: access_token)
        global_sign_out(input)
      end

      def global_sign_out(input : Types::GlobalSignOutRequest) : Types::GlobalSignOutResponse
        request = Protocol::JsonRpc.build_request(Model::GLOBAL_SIGN_OUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GlobalSignOutResponse, "GlobalSignOut")
      end

      # Declares an authentication flow and initiates sign-in for a user in the Amazon Cognito user
      # directory. Amazon Cognito might respond with an additional challenge or an AuthenticationResult that
      # contains the outcome of a successful authentication. You can't sign in a user with a federated IdP
      # with InitiateAuth . For more information, see Authentication . Amazon Cognito doesn't evaluate
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you can't use IAM credentials to authorize requests, and you can't grant IAM permissions
      # in policies. For more information about authorization models in Amazon Cognito, see Using the Amazon
      # Cognito user pools API and user pool endpoints . This action might generate an SMS text message.
      # Starting June 1, 2021, US telecom carriers require you to register an origination phone number
      # before you can send SMS messages to US phone numbers. If you use SMS text messages in Amazon
      # Cognito, you must register a phone number with Amazon Pinpoint . Amazon Cognito uses the registered
      # number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might not be
      # able to sign up, activate their accounts, or sign in. If you have never used SMS text messages with
      # Amazon Cognito or any other Amazon Web Services service, Amazon Simple Notification Service might
      # place your account in the SMS sandbox. In sandbox mode , you can send messages only to verified
      # phone numbers. After you test your app while in the sandbox environment, you can move out of the
      # sandbox and into production. For more information, see SMS message settings for Amazon Cognito user
      # pools in the Amazon Cognito Developer Guide .

      def initiate_auth(
        auth_flow : String,
        client_id : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        auth_parameters : Hash(String, String)? = nil,
        client_metadata : Hash(String, String)? = nil,
        session : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::InitiateAuthResponse

        input = Types::InitiateAuthRequest.new(auth_flow: auth_flow, client_id: client_id, analytics_metadata: analytics_metadata, auth_parameters: auth_parameters, client_metadata: client_metadata, session: session, user_context_data: user_context_data)
        initiate_auth(input)
      end

      def initiate_auth(input : Types::InitiateAuthRequest) : Types::InitiateAuthResponse
        request = Protocol::JsonRpc.build_request(Model::INITIATE_AUTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InitiateAuthResponse, "InitiateAuth")
      end

      # Lists the devices that Amazon Cognito has registered to the currently signed-in user. For more
      # information about device authentication, see Working with user devices in your user pool . Authorize
      # this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def list_devices(
        access_token : String,
        limit : Int32? = nil,
        pagination_token : String? = nil
      ) : Types::ListDevicesResponse

        input = Types::ListDevicesRequest.new(access_token: access_token, limit: limit, pagination_token: pagination_token)
        list_devices(input)
      end

      def list_devices(input : Types::ListDevicesRequest) : Types::ListDevicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDevicesResponse, "ListDevices")
      end

      # Given a user pool ID, returns user pool groups and their details. Amazon Cognito evaluates Identity
      # and Access Management (IAM) policies in requests for this API operation. For this operation, you
      # must use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def list_groups(
        user_pool_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupsResponse

        input = Types::ListGroupsRequest.new(user_pool_id: user_pool_id, limit: limit, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Types::ListGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupsResponse, "ListGroups")
      end

      # Given a user pool ID, returns information about configured identity providers (IdPs). For more
      # information about IdPs, see Third-party IdP sign-in . Amazon Cognito evaluates Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you must use IAM
      # credentials to authorize requests, and you must grant yourself the corresponding IAM permission in a
      # policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API
      # and user pool endpoints

      def list_identity_providers(
        user_pool_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListIdentityProvidersResponse

        input = Types::ListIdentityProvidersRequest.new(user_pool_id: user_pool_id, max_results: max_results, next_token: next_token)
        list_identity_providers(input)
      end

      def list_identity_providers(input : Types::ListIdentityProvidersRequest) : Types::ListIdentityProvidersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IDENTITY_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIdentityProvidersResponse, "ListIdentityProviders")
      end

      # Given a user pool ID, returns all resource servers and their details. For more information about
      # resource servers, see Access control with resource servers . Amazon Cognito evaluates Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you must
      # use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def list_resource_servers(
        user_pool_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceServersResponse

        input = Types::ListResourceServersRequest.new(user_pool_id: user_pool_id, max_results: max_results, next_token: next_token)
        list_resource_servers(input)
      end

      def list_resource_servers(input : Types::ListResourceServersRequest) : Types::ListResourceServersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_SERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceServersResponse, "ListResourceServers")
      end

      # Lists the tags that are assigned to an Amazon Cognito user pool. For more information, see Tagging
      # resources .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns details about all terms documents for the requested user pool. Amazon Cognito evaluates
      # Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def list_terms(
        user_pool_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTermsResponse

        input = Types::ListTermsRequest.new(user_pool_id: user_pool_id, max_results: max_results, next_token: next_token)
        list_terms(input)
      end

      def list_terms(input : Types::ListTermsRequest) : Types::ListTermsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTermsResponse, "ListTerms")
      end

      # Given a user pool ID, returns user import jobs and their details. Import jobs are retained in user
      # pool configuration so that you can stage, stop, start, review, and delete them. For more information
      # about user import, see Importing users from a CSV file . Amazon Cognito evaluates Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you must
      # use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def list_user_import_jobs(
        max_results : Int32,
        user_pool_id : String,
        pagination_token : String? = nil
      ) : Types::ListUserImportJobsResponse

        input = Types::ListUserImportJobsRequest.new(max_results: max_results, user_pool_id: user_pool_id, pagination_token: pagination_token)
        list_user_import_jobs(input)
      end

      def list_user_import_jobs(input : Types::ListUserImportJobsRequest) : Types::ListUserImportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USER_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUserImportJobsResponse, "ListUserImportJobs")
      end

      # Given a user pool ID, lists app clients. App clients are sets of rules for the access that you want
      # a user pool to grant to one application. For more information, see App clients . Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def list_user_pool_clients(
        user_pool_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUserPoolClientsResponse

        input = Types::ListUserPoolClientsRequest.new(user_pool_id: user_pool_id, max_results: max_results, next_token: next_token)
        list_user_pool_clients(input)
      end

      def list_user_pool_clients(input : Types::ListUserPoolClientsRequest) : Types::ListUserPoolClientsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USER_POOL_CLIENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUserPoolClientsResponse, "ListUserPoolClients")
      end

      # Lists user pools and their details in the current Amazon Web Services account. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def list_user_pools(
        max_results : Int32,
        next_token : String? = nil
      ) : Types::ListUserPoolsResponse

        input = Types::ListUserPoolsRequest.new(max_results: max_results, next_token: next_token)
        list_user_pools(input)
      end

      def list_user_pools(input : Types::ListUserPoolsRequest) : Types::ListUserPoolsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USER_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUserPoolsResponse, "ListUserPools")
      end

      # Given a user pool ID, returns a list of users and their basic details in a user pool. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def list_users(
        user_pool_id : String,
        attributes_to_get : Array(String)? = nil,
        filter : String? = nil,
        limit : Int32? = nil,
        pagination_token : String? = nil
      ) : Types::ListUsersResponse

        input = Types::ListUsersRequest.new(user_pool_id: user_pool_id, attributes_to_get: attributes_to_get, filter: filter, limit: limit, pagination_token: pagination_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # Given a user pool ID and a group name, returns a list of users in the group. For more information
      # about user pool groups, see Adding groups to a user pool . Amazon Cognito evaluates Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you must
      # use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def list_users_in_group(
        group_name : String,
        user_pool_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsersInGroupResponse

        input = Types::ListUsersInGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id, limit: limit, next_token: next_token)
        list_users_in_group(input)
      end

      def list_users_in_group(input : Types::ListUsersInGroupRequest) : Types::ListUsersInGroupResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS_IN_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersInGroupResponse, "ListUsersInGroup")
      end

      # Generates a list of the currently signed-in user's registered passkey, or WebAuthn, credentials.
      # Authorize this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def list_web_authn_credentials(
        access_token : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWebAuthnCredentialsResponse

        input = Types::ListWebAuthnCredentialsRequest.new(access_token: access_token, max_results: max_results, next_token: next_token)
        list_web_authn_credentials(input)
      end

      def list_web_authn_credentials(input : Types::ListWebAuthnCredentialsRequest) : Types::ListWebAuthnCredentialsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WEB_AUTHN_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWebAuthnCredentialsResponse, "ListWebAuthnCredentials")
      end

      # Resends the code that confirms a new account for a user who has signed up in your user pool. Amazon
      # Cognito sends confirmation codes to the user attribute in the AutoVerifiedAttributes property of
      # your user pool. When you prompt new users for the confirmation code, include a "Resend code" option
      # that generates a call to this API operation. Amazon Cognito doesn't evaluate Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM
      # credentials to authorize requests, and you can't grant IAM permissions in policies. For more
      # information about authorization models in Amazon Cognito, see Using the Amazon Cognito user pools
      # API and user pool endpoints . This action might generate an SMS text message. Starting June 1, 2021,
      # US telecom carriers require you to register an origination phone number before you can send SMS
      # messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a
      # phone number with Amazon Pinpoint . Amazon Cognito uses the registered number automatically.
      # Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate
      # their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any
      # other Amazon Web Services service, Amazon Simple Notification Service might place your account in
      # the SMS sandbox. In sandbox mode , you can send messages only to verified phone numbers. After you
      # test your app while in the sandbox environment, you can move out of the sandbox and into production.
      # For more information, see SMS message settings for Amazon Cognito user pools in the Amazon Cognito
      # Developer Guide .

      def resend_confirmation_code(
        client_id : String,
        username : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        client_metadata : Hash(String, String)? = nil,
        secret_hash : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::ResendConfirmationCodeResponse

        input = Types::ResendConfirmationCodeRequest.new(client_id: client_id, username: username, analytics_metadata: analytics_metadata, client_metadata: client_metadata, secret_hash: secret_hash, user_context_data: user_context_data)
        resend_confirmation_code(input)
      end

      def resend_confirmation_code(input : Types::ResendConfirmationCodeRequest) : Types::ResendConfirmationCodeResponse
        request = Protocol::JsonRpc.build_request(Model::RESEND_CONFIRMATION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResendConfirmationCodeResponse, "ResendConfirmationCode")
      end

      # Some API operations in a user pool generate a challenge, like a prompt for an MFA code, for device
      # authentication that bypasses MFA, or for a custom authentication challenge. A RespondToAuthChallenge
      # API request provides the answer to that challenge, like a code or a secure remote password (SRP).
      # The parameters of a response to an authentication challenge vary with the type of challenge. For
      # more information about custom authentication challenges, see Custom authentication challenge Lambda
      # triggers . Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests
      # for this API operation. For this operation, you can't use IAM credentials to authorize requests, and
      # you can't grant IAM permissions in policies. For more information about authorization models in
      # Amazon Cognito, see Using the Amazon Cognito user pools API and user pool endpoints . This action
      # might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to
      # register an origination phone number before you can send SMS messages to US phone numbers. If you
      # use SMS text messages in Amazon Cognito, you must register a phone number with Amazon Pinpoint .
      # Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must
      # receive SMS messages might not be able to sign up, activate their accounts, or sign in. If you have
      # never used SMS text messages with Amazon Cognito or any other Amazon Web Services service, Amazon
      # Simple Notification Service might place your account in the SMS sandbox. In sandbox mode , you can
      # send messages only to verified phone numbers. After you test your app while in the sandbox
      # environment, you can move out of the sandbox and into production. For more information, see SMS
      # message settings for Amazon Cognito user pools in the Amazon Cognito Developer Guide .

      def respond_to_auth_challenge(
        challenge_name : String,
        client_id : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        challenge_responses : Hash(String, String)? = nil,
        client_metadata : Hash(String, String)? = nil,
        session : String? = nil,
        user_context_data : Types::UserContextDataType? = nil
      ) : Types::RespondToAuthChallengeResponse

        input = Types::RespondToAuthChallengeRequest.new(challenge_name: challenge_name, client_id: client_id, analytics_metadata: analytics_metadata, challenge_responses: challenge_responses, client_metadata: client_metadata, session: session, user_context_data: user_context_data)
        respond_to_auth_challenge(input)
      end

      def respond_to_auth_challenge(input : Types::RespondToAuthChallengeRequest) : Types::RespondToAuthChallengeResponse
        request = Protocol::JsonRpc.build_request(Model::RESPOND_TO_AUTH_CHALLENGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RespondToAuthChallengeResponse, "RespondToAuthChallenge")
      end

      # Revokes all of the access tokens generated by, and at the same time as, the specified refresh token.
      # After a token is revoked, you can't use the revoked token to access Amazon Cognito user APIs, or to
      # authorize access to your resource server. Amazon Cognito doesn't evaluate Identity and Access
      # Management (IAM) policies in requests for this API operation. For this operation, you can't use IAM
      # credentials to authorize requests, and you can't grant IAM permissions in policies. For more
      # information about authorization models in Amazon Cognito, see Using the Amazon Cognito user pools
      # API and user pool endpoints .

      def revoke_token(
        client_id : String,
        token : String,
        client_secret : String? = nil
      ) : Types::RevokeTokenResponse

        input = Types::RevokeTokenRequest.new(client_id: client_id, token: token, client_secret: client_secret)
        revoke_token(input)
      end

      def revoke_token(input : Types::RevokeTokenRequest) : Types::RevokeTokenResponse
        request = Protocol::JsonRpc.build_request(Model::REVOKE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RevokeTokenResponse, "RevokeToken")
      end

      # Sets up or modifies the logging configuration of a user pool. User pools can export user
      # notification logs and, when threat protection is active, user-activity logs. For more information,
      # see Exporting user pool logs .

      def set_log_delivery_configuration(
        log_configurations : Array(Types::LogConfigurationType),
        user_pool_id : String
      ) : Types::SetLogDeliveryConfigurationResponse

        input = Types::SetLogDeliveryConfigurationRequest.new(log_configurations: log_configurations, user_pool_id: user_pool_id)
        set_log_delivery_configuration(input)
      end

      def set_log_delivery_configuration(input : Types::SetLogDeliveryConfigurationRequest) : Types::SetLogDeliveryConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::SET_LOG_DELIVERY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetLogDeliveryConfigurationResponse, "SetLogDeliveryConfiguration")
      end

      # Configures threat protection for a user pool or app client. Sets configuration for the following.
      # Responses to risks with adaptive authentication Responses to vulnerable passwords with
      # compromised-credentials detection Notifications to users who have had risky activity detected
      # IP-address denylist and allowlist To set the risk configuration for the user pool to defaults, send
      # this request with only the UserPoolId parameter. To reset the threat protection settings of an app
      # client to be inherited from the user pool, send UserPoolId and ClientId parameters only. To change
      # threat protection to audit-only or off, update the value of UserPoolAddOns in an UpdateUserPool
      # request. To activate this setting, your user pool must be on the Plus tier .

      def set_risk_configuration(
        user_pool_id : String,
        account_takeover_risk_configuration : Types::AccountTakeoverRiskConfigurationType? = nil,
        client_id : String? = nil,
        compromised_credentials_risk_configuration : Types::CompromisedCredentialsRiskConfigurationType? = nil,
        risk_exception_configuration : Types::RiskExceptionConfigurationType? = nil
      ) : Types::SetRiskConfigurationResponse

        input = Types::SetRiskConfigurationRequest.new(user_pool_id: user_pool_id, account_takeover_risk_configuration: account_takeover_risk_configuration, client_id: client_id, compromised_credentials_risk_configuration: compromised_credentials_risk_configuration, risk_exception_configuration: risk_exception_configuration)
        set_risk_configuration(input)
      end

      def set_risk_configuration(input : Types::SetRiskConfigurationRequest) : Types::SetRiskConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::SET_RISK_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetRiskConfigurationResponse, "SetRiskConfiguration")
      end

      # Configures UI branding settings for domains with the hosted UI (classic) branding version. Your user
      # pool must have a domain. Configure a domain with . Set the default configuration for all clients
      # with a ClientId of ALL . When the ClientId value is an app client ID, the settings you pass in this
      # request apply to that app client and override the default ALL configuration. Amazon Cognito
      # evaluates Identity and Access Management (IAM) policies in requests for this API operation. For this
      # operation, you must use IAM credentials to authorize requests, and you must grant yourself the
      # corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests Using
      # the Amazon Cognito user pools API and user pool endpoints

      def set_ui_customization(
        user_pool_id : String,
        css : String? = nil,
        client_id : String? = nil,
        image_file : Bytes? = nil
      ) : Types::SetUICustomizationResponse

        input = Types::SetUICustomizationRequest.new(user_pool_id: user_pool_id, css: css, client_id: client_id, image_file: image_file)
        set_ui_customization(input)
      end

      def set_ui_customization(input : Types::SetUICustomizationRequest) : Types::SetUICustomizationResponse
        request = Protocol::JsonRpc.build_request(Model::SET_UI_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetUICustomizationResponse, "SetUICustomization")
      end

      # Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are
      # activated and if any are preferred. Only one factor can be set as preferred. The preferred MFA
      # factor will be used to authenticate a user if multiple factors are activated. If multiple options
      # are activated and no preference is set, a challenge to choose an MFA option will be returned during
      # sign-in. If an MFA type is activated for a user, the user will be prompted for MFA during all
      # sign-in attempts unless device tracking is turned on and the device has been trusted. If you want
      # MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA
      # for users and turn on Adaptive Authentication for the user pool. Authorize this action with a
      # signed-in user's access token. It must include the scope aws.cognito.signin.user.admin . Amazon
      # Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you can't use IAM credentials to authorize requests, and you can't
      # grant IAM permissions in policies. For more information about authorization models in Amazon
      # Cognito, see Using the Amazon Cognito user pools API and user pool endpoints .

      def set_user_mfa_preference(
        access_token : String,
        email_mfa_settings : Types::EmailMfaSettingsType? = nil,
        sms_mfa_settings : Types::SMSMfaSettingsType? = nil,
        software_token_mfa_settings : Types::SoftwareTokenMfaSettingsType? = nil
      ) : Types::SetUserMFAPreferenceResponse

        input = Types::SetUserMFAPreferenceRequest.new(access_token: access_token, email_mfa_settings: email_mfa_settings, sms_mfa_settings: sms_mfa_settings, software_token_mfa_settings: software_token_mfa_settings)
        set_user_mfa_preference(input)
      end

      def set_user_mfa_preference(input : Types::SetUserMFAPreferenceRequest) : Types::SetUserMFAPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::SET_USER_MFA_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetUserMFAPreferenceResponse, "SetUserMFAPreference")
      end

      # Sets user pool multi-factor authentication (MFA) and passkey configuration. For more information
      # about user pool MFA, see Adding MFA . For more information about WebAuthn passkeys see
      # Authentication flows . This action might generate an SMS text message. Starting June 1, 2021, US
      # telecom carriers require you to register an origination phone number before you can send SMS
      # messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a
      # phone number with Amazon Pinpoint . Amazon Cognito uses the registered number automatically.
      # Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate
      # their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any
      # other Amazon Web Services service, Amazon Simple Notification Service might place your account in
      # the SMS sandbox. In sandbox mode , you can send messages only to verified phone numbers. After you
      # test your app while in the sandbox environment, you can move out of the sandbox and into production.
      # For more information, see SMS message settings for Amazon Cognito user pools in the Amazon Cognito
      # Developer Guide .

      def set_user_pool_mfa_config(
        user_pool_id : String,
        email_mfa_configuration : Types::EmailMfaConfigType? = nil,
        mfa_configuration : String? = nil,
        sms_mfa_configuration : Types::SmsMfaConfigType? = nil,
        software_token_mfa_configuration : Types::SoftwareTokenMfaConfigType? = nil,
        web_authn_configuration : Types::WebAuthnConfigurationType? = nil
      ) : Types::SetUserPoolMfaConfigResponse

        input = Types::SetUserPoolMfaConfigRequest.new(user_pool_id: user_pool_id, email_mfa_configuration: email_mfa_configuration, mfa_configuration: mfa_configuration, sms_mfa_configuration: sms_mfa_configuration, software_token_mfa_configuration: software_token_mfa_configuration, web_authn_configuration: web_authn_configuration)
        set_user_pool_mfa_config(input)
      end

      def set_user_pool_mfa_config(input : Types::SetUserPoolMfaConfigRequest) : Types::SetUserPoolMfaConfigResponse
        request = Protocol::JsonRpc.build_request(Model::SET_USER_POOL_MFA_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetUserPoolMfaConfigResponse, "SetUserPoolMfaConfig")
      end

      # This action is no longer supported. You can use it to configure only SMS MFA. You can't use it to
      # configure time-based one-time password (TOTP) software token or email MFA. Authorize this action
      # with a signed-in user's access token. It must include the scope aws.cognito.signin.user.admin .
      # Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests for this
      # API operation. For this operation, you can't use IAM credentials to authorize requests, and you
      # can't grant IAM permissions in policies. For more information about authorization models in Amazon
      # Cognito, see Using the Amazon Cognito user pools API and user pool endpoints .

      def set_user_settings(
        access_token : String,
        mfa_options : Array(Types::MFAOptionType)
      ) : Types::SetUserSettingsResponse

        input = Types::SetUserSettingsRequest.new(access_token: access_token, mfa_options: mfa_options)
        set_user_settings(input)
      end

      def set_user_settings(input : Types::SetUserSettingsRequest) : Types::SetUserSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::SET_USER_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetUserSettingsResponse, "SetUserSettings")
      end

      # Registers a user with an app client and requests a user name, password, and user attributes in the
      # user pool. Amazon Cognito doesn't evaluate Identity and Access Management (IAM) policies in requests
      # for this API operation. For this operation, you can't use IAM credentials to authorize requests, and
      # you can't grant IAM permissions in policies. For more information about authorization models in
      # Amazon Cognito, see Using the Amazon Cognito user pools API and user pool endpoints . This action
      # might generate an SMS text message. Starting June 1, 2021, US telecom carriers require you to
      # register an origination phone number before you can send SMS messages to US phone numbers. If you
      # use SMS text messages in Amazon Cognito, you must register a phone number with Amazon Pinpoint .
      # Amazon Cognito uses the registered number automatically. Otherwise, Amazon Cognito users who must
      # receive SMS messages might not be able to sign up, activate their accounts, or sign in. If you have
      # never used SMS text messages with Amazon Cognito or any other Amazon Web Services service, Amazon
      # Simple Notification Service might place your account in the SMS sandbox. In sandbox mode , you can
      # send messages only to verified phone numbers. After you test your app while in the sandbox
      # environment, you can move out of the sandbox and into production. For more information, see SMS
      # message settings for Amazon Cognito user pools in the Amazon Cognito Developer Guide . You might
      # receive a LimitExceeded exception in response to this request if you have exceeded a rate quota for
      # email or SMS messages, and if your user pool automatically verifies email addresses or phone
      # numbers. When you get this exception in the response, the user is successfully created and is in an
      # UNCONFIRMED state.

      def sign_up(
        client_id : String,
        username : String,
        analytics_metadata : Types::AnalyticsMetadataType? = nil,
        client_metadata : Hash(String, String)? = nil,
        password : String? = nil,
        secret_hash : String? = nil,
        user_attributes : Array(Types::AttributeType)? = nil,
        user_context_data : Types::UserContextDataType? = nil,
        validation_data : Array(Types::AttributeType)? = nil
      ) : Types::SignUpResponse

        input = Types::SignUpRequest.new(client_id: client_id, username: username, analytics_metadata: analytics_metadata, client_metadata: client_metadata, password: password, secret_hash: secret_hash, user_attributes: user_attributes, user_context_data: user_context_data, validation_data: validation_data)
        sign_up(input)
      end

      def sign_up(input : Types::SignUpRequest) : Types::SignUpResponse
        request = Protocol::JsonRpc.build_request(Model::SIGN_UP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SignUpResponse, "SignUp")
      end

      # Instructs your user pool to start importing users from a CSV file that contains their usernames and
      # attributes. For more information about importing users from a CSV file, see Importing users from a
      # CSV file .

      def start_user_import_job(
        job_id : String,
        user_pool_id : String
      ) : Types::StartUserImportJobResponse

        input = Types::StartUserImportJobRequest.new(job_id: job_id, user_pool_id: user_pool_id)
        start_user_import_job(input)
      end

      def start_user_import_job(input : Types::StartUserImportJobRequest) : Types::StartUserImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_USER_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartUserImportJobResponse, "StartUserImportJob")
      end

      # Requests credential creation options from your user pool for the currently signed-in user. Returns
      # information about the user pool, the user profile, and authentication requirements. Users must
      # provide this information in their request to enroll your application with their passkey provider.
      # Authorize this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin .

      def start_web_authn_registration(
        access_token : String
      ) : Types::StartWebAuthnRegistrationResponse

        input = Types::StartWebAuthnRegistrationRequest.new(access_token: access_token)
        start_web_authn_registration(input)
      end

      def start_web_authn_registration(input : Types::StartWebAuthnRegistrationRequest) : Types::StartWebAuthnRegistrationResponse
        request = Protocol::JsonRpc.build_request(Model::START_WEB_AUTHN_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartWebAuthnRegistrationResponse, "StartWebAuthnRegistration")
      end

      # Instructs your user pool to stop a running job that's importing users from a CSV file that contains
      # their usernames and attributes. For more information about importing users from a CSV file, see
      # Importing users from a CSV file .

      def stop_user_import_job(
        job_id : String,
        user_pool_id : String
      ) : Types::StopUserImportJobResponse

        input = Types::StopUserImportJobRequest.new(job_id: job_id, user_pool_id: user_pool_id)
        stop_user_import_job(input)
      end

      def stop_user_import_job(input : Types::StopUserImportJobRequest) : Types::StopUserImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_USER_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopUserImportJobResponse, "StopUserImportJob")
      end

      # Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to
      # categorize and manage user pools in different ways, such as by purpose, owner, environment, or other
      # criteria. Each tag consists of a key and value, both of which you define. A key is a general
      # category for more specific values. For example, if you have two versions of a user pool, one for
      # testing and another for production, you might assign an Environment tag key to both user pools. The
      # value of this key might be Test for one user pool, and Production for the other. Tags are useful for
      # cost tracking and access control. You can activate your tags so that they appear on the Billing and
      # Cost Management console, where you can track the costs associated with your user pools. In an
      # Identity and Access Management policy, you can constrain permissions for user pools based on
      # specific tags or tag values. You can use this action up to 5 times per second, per account. A user
      # pool can have as many as 50 tags.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Given tag IDs that you previously assigned to a user pool, removes them.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Provides the feedback for an authentication event generated by threat protection features. The
      # user's response indicates that you think that the event either was from a valid user or was an
      # unwanted authentication attempt. This feedback improves the risk evaluation decision for the user
      # pool as part of Amazon Cognito threat protection. To activate this setting, your user pool must be
      # on the Plus tier . This operation requires a FeedbackToken that Amazon Cognito generates and adds to
      # notification emails when users have potentially suspicious authentication events. Users invoke this
      # operation when they select the link that corresponds to {one-click-link-valid} or
      # {one-click-link-invalid} in your notification template. Because FeedbackToken is a required
      # parameter, you can't make requests to UpdateAuthEventFeedback without the contents of the
      # notification email message. Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def update_auth_event_feedback(
        event_id : String,
        feedback_token : String,
        feedback_value : String,
        user_pool_id : String,
        username : String
      ) : Types::UpdateAuthEventFeedbackResponse

        input = Types::UpdateAuthEventFeedbackRequest.new(event_id: event_id, feedback_token: feedback_token, feedback_value: feedback_value, user_pool_id: user_pool_id, username: username)
        update_auth_event_feedback(input)
      end

      def update_auth_event_feedback(input : Types::UpdateAuthEventFeedbackRequest) : Types::UpdateAuthEventFeedbackResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AUTH_EVENT_FEEDBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAuthEventFeedbackResponse, "UpdateAuthEventFeedback")
      end

      # Updates the status of a the currently signed-in user's device so that it is marked as remembered or
      # not remembered for the purpose of device authentication. Device authentication is a "remember me"
      # mechanism that silently completes sign-in from trusted devices with a device key instead of a
      # user-provided MFA code. This operation changes the status of a device without deleting it, so you
      # can enable it again later. For more information about device authentication, see Working with
      # devices . Authorize this action with a signed-in user's access token. It must include the scope
      # aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def update_device_status(
        access_token : String,
        device_key : String,
        device_remembered_status : String? = nil
      ) : Types::UpdateDeviceStatusResponse

        input = Types::UpdateDeviceStatusRequest.new(access_token: access_token, device_key: device_key, device_remembered_status: device_remembered_status)
        update_device_status(input)
      end

      def update_device_status(input : Types::UpdateDeviceStatusRequest) : Types::UpdateDeviceStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEVICE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDeviceStatusResponse, "UpdateDeviceStatus")
      end

      # Given the name of a user pool group, updates any of the properties for precedence, IAM role, or
      # description. For more information about user pool groups, see Adding groups to a user pool . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def update_group(
        group_name : String,
        user_pool_id : String,
        description : String? = nil,
        precedence : Int32? = nil,
        role_arn : String? = nil
      ) : Types::UpdateGroupResponse

        input = Types::UpdateGroupRequest.new(group_name: group_name, user_pool_id: user_pool_id, description: description, precedence: precedence, role_arn: role_arn)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Types::UpdateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGroupResponse, "UpdateGroup")
      end

      # Modifies the configuration and trust relationship between a third-party identity provider (IdP) and
      # a user pool. Amazon Cognito accepts sign-in with third-party identity providers through managed
      # login and OIDC relying-party libraries. For more information, see Third-party IdP sign-in . Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def update_identity_provider(
        provider_name : String,
        user_pool_id : String,
        attribute_mapping : Hash(String, String)? = nil,
        idp_identifiers : Array(String)? = nil,
        provider_details : Hash(String, String)? = nil
      ) : Types::UpdateIdentityProviderResponse

        input = Types::UpdateIdentityProviderRequest.new(provider_name: provider_name, user_pool_id: user_pool_id, attribute_mapping: attribute_mapping, idp_identifiers: idp_identifiers, provider_details: provider_details)
        update_identity_provider(input)
      end

      def update_identity_provider(input : Types::UpdateIdentityProviderRequest) : Types::UpdateIdentityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IDENTITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIdentityProviderResponse, "UpdateIdentityProvider")
      end

      # Configures the branding settings for a user pool style. This operation is the programmatic option
      # for the configuration of a style in the branding editor. Provides values for UI customization in a
      # Settings JSON object and image files in an Assets array. This operation has a 2-megabyte
      # request-size limit and include the CSS settings and image assets for your app client. Your branding
      # settings might exceed 2MB in size. Amazon Cognito doesn't require that you pass all parameters in
      # one request and preserves existing style settings that you don't specify. If your request is larger
      # than 2MB, separate it into multiple requests, each with a size smaller than the limit. Amazon
      # Cognito evaluates Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you must use IAM credentials to authorize requests, and you must grant yourself
      # the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services API Requests
      # Using the Amazon Cognito user pools API and user pool endpoints

      def update_managed_login_branding(
        assets : Array(Types::AssetType)? = nil,
        managed_login_branding_id : String? = nil,
        settings : Types::Document? = nil,
        use_cognito_provided_values : Bool? = nil,
        user_pool_id : String? = nil
      ) : Types::UpdateManagedLoginBrandingResponse

        input = Types::UpdateManagedLoginBrandingRequest.new(assets: assets, managed_login_branding_id: managed_login_branding_id, settings: settings, use_cognito_provided_values: use_cognito_provided_values, user_pool_id: user_pool_id)
        update_managed_login_branding(input)
      end

      def update_managed_login_branding(input : Types::UpdateManagedLoginBrandingRequest) : Types::UpdateManagedLoginBrandingResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MANAGED_LOGIN_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateManagedLoginBrandingResponse, "UpdateManagedLoginBranding")
      end

      # Updates the name and scopes of a resource server. All other fields are read-only. For more
      # information about resource servers, see Access control with resource servers . If you don't provide
      # a value for an attribute, it is set to the default value. Amazon Cognito evaluates Identity and
      # Access Management (IAM) policies in requests for this API operation. For this operation, you must
      # use IAM credentials to authorize requests, and you must grant yourself the corresponding IAM
      # permission in a policy. Learn more Signing Amazon Web Services API Requests Using the Amazon Cognito
      # user pools API and user pool endpoints

      def update_resource_server(
        identifier : String,
        name : String,
        user_pool_id : String,
        scopes : Array(Types::ResourceServerScopeType)? = nil
      ) : Types::UpdateResourceServerResponse

        input = Types::UpdateResourceServerRequest.new(identifier: identifier, name: name, user_pool_id: user_pool_id, scopes: scopes)
        update_resource_server(input)
      end

      def update_resource_server(input : Types::UpdateResourceServerRequest) : Types::UpdateResourceServerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOURCE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResourceServerResponse, "UpdateResourceServer")
      end

      # Modifies existing terms documents for the requested app client. When Terms and conditions and
      # Privacy policy documents are configured, the app client displays links to them in the sign-up page
      # of managed login for the app client. You can provide URLs for terms documents in the languages that
      # are supported by managed login localization . Amazon Cognito directs users to the terms documents
      # for their current language, with fallback to default if no document exists for the language. Each
      # request accepts one type of terms document and a map of language-to-link for that document type. You
      # must provide both types of terms documents in at least one language before Amazon Cognito displays
      # your terms documents. Supply each type in separate requests. For more information, see Terms
      # documents . Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for
      # this API operation. For this operation, you must use IAM credentials to authorize requests, and you
      # must grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web
      # Services API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def update_terms(
        terms_id : String,
        user_pool_id : String,
        enforcement : String? = nil,
        links : Hash(String, String)? = nil,
        terms_name : String? = nil,
        terms_source : String? = nil
      ) : Types::UpdateTermsResponse

        input = Types::UpdateTermsRequest.new(terms_id: terms_id, user_pool_id: user_pool_id, enforcement: enforcement, links: links, terms_name: terms_name, terms_source: terms_source)
        update_terms(input)
      end

      def update_terms(input : Types::UpdateTermsRequest) : Types::UpdateTermsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTermsResponse, "UpdateTerms")
      end

      # Updates the currently signed-in user's attributes. To delete an attribute from the user, submit the
      # attribute in your API request with a blank value. For custom attributes, you must add a custom:
      # prefix to the attribute name, for example custom:department . Authorize this action with a signed-in
      # user's access token. It must include the scope aws.cognito.signin.user.admin . Amazon Cognito
      # doesn't evaluate Identity and Access Management (IAM) policies in requests for this API operation.
      # For this operation, you can't use IAM credentials to authorize requests, and you can't grant IAM
      # permissions in policies. For more information about authorization models in Amazon Cognito, see
      # Using the Amazon Cognito user pools API and user pool endpoints . This action might generate an SMS
      # text message. Starting June 1, 2021, US telecom carriers require you to register an origination
      # phone number before you can send SMS messages to US phone numbers. If you use SMS text messages in
      # Amazon Cognito, you must register a phone number with Amazon Pinpoint . Amazon Cognito uses the
      # registered number automatically. Otherwise, Amazon Cognito users who must receive SMS messages might
      # not be able to sign up, activate their accounts, or sign in. If you have never used SMS text
      # messages with Amazon Cognito or any other Amazon Web Services service, Amazon Simple Notification
      # Service might place your account in the SMS sandbox. In sandbox mode , you can send messages only to
      # verified phone numbers. After you test your app while in the sandbox environment, you can move out
      # of the sandbox and into production. For more information, see SMS message settings for Amazon
      # Cognito user pools in the Amazon Cognito Developer Guide .

      def update_user_attributes(
        access_token : String,
        user_attributes : Array(Types::AttributeType),
        client_metadata : Hash(String, String)? = nil
      ) : Types::UpdateUserAttributesResponse

        input = Types::UpdateUserAttributesRequest.new(access_token: access_token, user_attributes: user_attributes, client_metadata: client_metadata)
        update_user_attributes(input)
      end

      def update_user_attributes(input : Types::UpdateUserAttributesRequest) : Types::UpdateUserAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserAttributesResponse, "UpdateUserAttributes")
      end

      # Updates the configuration of a user pool. To avoid setting parameters to Amazon Cognito defaults,
      # construct this API request to pass the existing configuration of your user pool, modified to include
      # the changes that you want to make. If you don't provide a value for an attribute, Amazon Cognito
      # sets it to its default value. This action might generate an SMS text message. Starting June 1, 2021,
      # US telecom carriers require you to register an origination phone number before you can send SMS
      # messages to US phone numbers. If you use SMS text messages in Amazon Cognito, you must register a
      # phone number with Amazon Pinpoint . Amazon Cognito uses the registered number automatically.
      # Otherwise, Amazon Cognito users who must receive SMS messages might not be able to sign up, activate
      # their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any
      # other Amazon Web Services service, Amazon Simple Notification Service might place your account in
      # the SMS sandbox. In sandbox mode , you can send messages only to verified phone numbers. After you
      # test your app while in the sandbox environment, you can move out of the sandbox and into production.
      # For more information, see SMS message settings for Amazon Cognito user pools in the Amazon Cognito
      # Developer Guide . Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests
      # for this API operation. For this operation, you must use IAM credentials to authorize requests, and
      # you must grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web
      # Services API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def update_user_pool(
        user_pool_id : String,
        account_recovery_setting : Types::AccountRecoverySettingType? = nil,
        admin_create_user_config : Types::AdminCreateUserConfigType? = nil,
        auto_verified_attributes : Array(String)? = nil,
        deletion_protection : String? = nil,
        device_configuration : Types::DeviceConfigurationType? = nil,
        email_configuration : Types::EmailConfigurationType? = nil,
        email_verification_message : String? = nil,
        email_verification_subject : String? = nil,
        lambda_config : Types::LambdaConfigType? = nil,
        mfa_configuration : String? = nil,
        policies : Types::UserPoolPolicyType? = nil,
        pool_name : String? = nil,
        sms_authentication_message : String? = nil,
        sms_configuration : Types::SmsConfigurationType? = nil,
        sms_verification_message : String? = nil,
        user_attribute_update_settings : Types::UserAttributeUpdateSettingsType? = nil,
        user_pool_add_ons : Types::UserPoolAddOnsType? = nil,
        user_pool_tags : Hash(String, String)? = nil,
        user_pool_tier : String? = nil,
        verification_message_template : Types::VerificationMessageTemplateType? = nil
      ) : Types::UpdateUserPoolResponse

        input = Types::UpdateUserPoolRequest.new(user_pool_id: user_pool_id, account_recovery_setting: account_recovery_setting, admin_create_user_config: admin_create_user_config, auto_verified_attributes: auto_verified_attributes, deletion_protection: deletion_protection, device_configuration: device_configuration, email_configuration: email_configuration, email_verification_message: email_verification_message, email_verification_subject: email_verification_subject, lambda_config: lambda_config, mfa_configuration: mfa_configuration, policies: policies, pool_name: pool_name, sms_authentication_message: sms_authentication_message, sms_configuration: sms_configuration, sms_verification_message: sms_verification_message, user_attribute_update_settings: user_attribute_update_settings, user_pool_add_ons: user_pool_add_ons, user_pool_tags: user_pool_tags, user_pool_tier: user_pool_tier, verification_message_template: verification_message_template)
        update_user_pool(input)
      end

      def update_user_pool(input : Types::UpdateUserPoolRequest) : Types::UpdateUserPoolResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserPoolResponse, "UpdateUserPool")
      end

      # Given a user pool app client ID, updates the configuration. To avoid setting parameters to Amazon
      # Cognito defaults, construct this API request to pass the existing configuration of your app client,
      # modified to include the changes that you want to make. If you don't provide a value for an
      # attribute, Amazon Cognito sets it to its default value. Unlike app clients created in the console,
      # Amazon Cognito doesn't automatically assign a branding style to app clients that you configure with
      # this API operation. Managed login and classic hosted UI pages aren't available for your client until
      # after you apply a branding style. Amazon Cognito evaluates Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you must use IAM credentials to
      # authorize requests, and you must grant yourself the corresponding IAM permission in a policy. Learn
      # more Signing Amazon Web Services API Requests Using the Amazon Cognito user pools API and user pool
      # endpoints

      def update_user_pool_client(
        client_id : String,
        user_pool_id : String,
        access_token_validity : Int32? = nil,
        allowed_o_auth_flows : Array(String)? = nil,
        allowed_o_auth_flows_user_pool_client : Bool? = nil,
        allowed_o_auth_scopes : Array(String)? = nil,
        analytics_configuration : Types::AnalyticsConfigurationType? = nil,
        auth_session_validity : Int32? = nil,
        callback_ur_ls : Array(String)? = nil,
        client_name : String? = nil,
        default_redirect_uri : String? = nil,
        enable_propagate_additional_user_context_data : Bool? = nil,
        enable_token_revocation : Bool? = nil,
        explicit_auth_flows : Array(String)? = nil,
        id_token_validity : Int32? = nil,
        logout_ur_ls : Array(String)? = nil,
        prevent_user_existence_errors : String? = nil,
        read_attributes : Array(String)? = nil,
        refresh_token_rotation : Types::RefreshTokenRotationType? = nil,
        refresh_token_validity : Int32? = nil,
        supported_identity_providers : Array(String)? = nil,
        token_validity_units : Types::TokenValidityUnitsType? = nil,
        write_attributes : Array(String)? = nil
      ) : Types::UpdateUserPoolClientResponse

        input = Types::UpdateUserPoolClientRequest.new(client_id: client_id, user_pool_id: user_pool_id, access_token_validity: access_token_validity, allowed_o_auth_flows: allowed_o_auth_flows, allowed_o_auth_flows_user_pool_client: allowed_o_auth_flows_user_pool_client, allowed_o_auth_scopes: allowed_o_auth_scopes, analytics_configuration: analytics_configuration, auth_session_validity: auth_session_validity, callback_ur_ls: callback_ur_ls, client_name: client_name, default_redirect_uri: default_redirect_uri, enable_propagate_additional_user_context_data: enable_propagate_additional_user_context_data, enable_token_revocation: enable_token_revocation, explicit_auth_flows: explicit_auth_flows, id_token_validity: id_token_validity, logout_ur_ls: logout_ur_ls, prevent_user_existence_errors: prevent_user_existence_errors, read_attributes: read_attributes, refresh_token_rotation: refresh_token_rotation, refresh_token_validity: refresh_token_validity, supported_identity_providers: supported_identity_providers, token_validity_units: token_validity_units, write_attributes: write_attributes)
        update_user_pool_client(input)
      end

      def update_user_pool_client(input : Types::UpdateUserPoolClientRequest) : Types::UpdateUserPoolClientResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_POOL_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserPoolClientResponse, "UpdateUserPoolClient")
      end

      # A user pool domain hosts managed login, an authorization server and web server for authentication in
      # your application. This operation updates the branding version for user pool domains between 1 for
      # hosted UI (classic) and 2 for managed login. It also updates the SSL certificate for user pool
      # custom domains. Changes to the domain branding version take up to one minute to take effect for a
      # prefix domain and up to five minutes for a custom domain. This operation doesn't change the name of
      # your user pool domain. To change your domain, delete it with DeleteUserPoolDomain and create a new
      # domain with CreateUserPoolDomain . You can pass the ARN of a new Certificate Manager certificate in
      # this request. Typically, ACM certificates automatically renew and you user pool can continue to use
      # the same ARN. But if you generate a new certificate for your custom domain name, replace the
      # original configuration with the new ARN in this request. ACM certificates for custom domains must be
      # in the US East (N. Virginia) Amazon Web Services Region. After you submit your request, Amazon
      # Cognito requires up to 1 hour to distribute your new certificate to your custom domain. For more
      # information about adding a custom domain to your user pool, see Configuring a user pool domain .
      # Amazon Cognito evaluates Identity and Access Management (IAM) policies in requests for this API
      # operation. For this operation, you must use IAM credentials to authorize requests, and you must
      # grant yourself the corresponding IAM permission in a policy. Learn more Signing Amazon Web Services
      # API Requests Using the Amazon Cognito user pools API and user pool endpoints

      def update_user_pool_domain(
        domain : String,
        user_pool_id : String,
        custom_domain_config : Types::CustomDomainConfigType? = nil,
        managed_login_version : Int32? = nil
      ) : Types::UpdateUserPoolDomainResponse

        input = Types::UpdateUserPoolDomainRequest.new(domain: domain, user_pool_id: user_pool_id, custom_domain_config: custom_domain_config, managed_login_version: managed_login_version)
        update_user_pool_domain(input)
      end

      def update_user_pool_domain(input : Types::UpdateUserPoolDomainRequest) : Types::UpdateUserPoolDomainResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_POOL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserPoolDomainResponse, "UpdateUserPoolDomain")
      end

      # Registers the current user's time-based one-time password (TOTP) authenticator with a code generated
      # in their authenticator app from a private key that's supplied by your user pool. Marks the user's
      # software token MFA status as "verified" if successful. The request takes an access token or a
      # session string, but not both. Amazon Cognito doesn't evaluate Identity and Access Management (IAM)
      # policies in requests for this API operation. For this operation, you can't use IAM credentials to
      # authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def verify_software_token(
        user_code : String,
        access_token : String? = nil,
        friendly_device_name : String? = nil,
        session : String? = nil
      ) : Types::VerifySoftwareTokenResponse

        input = Types::VerifySoftwareTokenRequest.new(user_code: user_code, access_token: access_token, friendly_device_name: friendly_device_name, session: session)
        verify_software_token(input)
      end

      def verify_software_token(input : Types::VerifySoftwareTokenRequest) : Types::VerifySoftwareTokenResponse
        request = Protocol::JsonRpc.build_request(Model::VERIFY_SOFTWARE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VerifySoftwareTokenResponse, "VerifySoftwareToken")
      end

      # Submits a verification code for a signed-in user who has added or changed a value of an
      # auto-verified attribute. When successful, the user's attribute becomes verified and the attribute
      # email_verified or phone_number_verified becomes true . If your user pool requires verification
      # before Amazon Cognito updates the attribute value, this operation updates the affected attribute to
      # its pending value. Authorize this action with a signed-in user's access token. It must include the
      # scope aws.cognito.signin.user.admin . Amazon Cognito doesn't evaluate Identity and Access Management
      # (IAM) policies in requests for this API operation. For this operation, you can't use IAM credentials
      # to authorize requests, and you can't grant IAM permissions in policies. For more information about
      # authorization models in Amazon Cognito, see Using the Amazon Cognito user pools API and user pool
      # endpoints .

      def verify_user_attribute(
        access_token : String,
        attribute_name : String,
        code : String
      ) : Types::VerifyUserAttributeResponse

        input = Types::VerifyUserAttributeRequest.new(access_token: access_token, attribute_name: attribute_name, code: code)
        verify_user_attribute(input)
      end

      def verify_user_attribute(input : Types::VerifyUserAttributeRequest) : Types::VerifyUserAttributeResponse
        request = Protocol::JsonRpc.build_request(Model::VERIFY_USER_ATTRIBUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VerifyUserAttributeResponse, "VerifyUserAttribute")
      end
    end
  end
end
