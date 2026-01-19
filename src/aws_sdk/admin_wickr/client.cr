module AwsSdk
  module Wickr
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates multiple users in a specified Wickr network. This operation allows you to provision multiple
      # user accounts simultaneously, optionally specifying security groups, and validation requirements for
      # each user. codeValidation , inviteCode , and inviteCodeTtl are restricted to networks under preview
      # only.
      def batch_create_user(
        network_id : String,
        users : Array(Types::BatchCreateUserRequestItem),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchCreateUserRequest.new(network_id: network_id, users: users, client_token: client_token)
        batch_create_user(input)
      end
      def batch_create_user(input : Types::BatchCreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes multiple users from a specified Wickr network. This operation permanently removes user
      # accounts and their associated data from the network.
      def batch_delete_user(
        network_id : String,
        user_ids : Array(String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteUserRequest.new(network_id: network_id, user_ids: user_ids, client_token: client_token)
        batch_delete_user(input)
      end
      def batch_delete_user(input : Types::BatchDeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Looks up multiple user usernames from their unique username hashes (unames). This operation allows
      # you to retrieve the email addresses associated with a list of username hashes.
      def batch_lookup_user_uname(
        network_id : String,
        unames : Array(String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchLookupUserUnameRequest.new(network_id: network_id, unames: unames, client_token: client_token)
        batch_lookup_user_uname(input)
      end
      def batch_lookup_user_uname(input : Types::BatchLookupUserUnameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_LOOKUP_USER_UNAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resends invitation codes to multiple users who have pending invitations in a Wickr network. This
      # operation is useful when users haven't accepted their initial invitations or when invitations have
      # expired.
      def batch_reinvite_user(
        network_id : String,
        user_ids : Array(String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchReinviteUserRequest.new(network_id: network_id, user_ids: user_ids, client_token: client_token)
        batch_reinvite_user(input)
      end
      def batch_reinvite_user(input : Types::BatchReinviteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_REINVITE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets multiple devices for a specific user in a Wickr network. This operation forces the selected
      # devices to log out and requires users to re-authenticate, which is useful for security purposes or
      # when devices need to be revoked.
      def batch_reset_devices_for_user(
        app_ids : Array(String),
        network_id : String,
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchResetDevicesForUserRequest.new(app_ids: app_ids, network_id: network_id, user_id: user_id, client_token: client_token)
        batch_reset_devices_for_user(input)
      end
      def batch_reset_devices_for_user(input : Types::BatchResetDevicesForUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_RESET_DEVICES_FOR_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Suspends or unsuspends multiple users in a Wickr network. Suspended users cannot access the network
      # until they are unsuspended. This operation is useful for temporarily restricting access without
      # deleting user accounts.
      def batch_toggle_user_suspend_status(
        network_id : String,
        suspend : Bool,
        user_ids : Array(String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchToggleUserSuspendStatusRequest.new(network_id: network_id, suspend: suspend, user_ids: user_ids, client_token: client_token)
        batch_toggle_user_suspend_status(input)
      end
      def batch_toggle_user_suspend_status(input : Types::BatchToggleUserSuspendStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_TOGGLE_USER_SUSPEND_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new bot in a specified Wickr network. Bots are automated accounts that can send and
      # receive messages, enabling integration with external systems and automation of tasks.
      def create_bot(
        challenge : String,
        group_id : String,
        network_id : String,
        username : String,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateBotRequest.new(challenge: challenge, group_id: group_id, network_id: network_id, username: username, display_name: display_name)
        create_bot(input)
      end
      def create_bot(input : Types::CreateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data retention bot in a Wickr network. Data retention bots are specialized bots that
      # handle message archiving and compliance by capturing and storing messages for regulatory or
      # organizational requirements.
      def create_data_retention_bot(
        network_id : String
      ) : Protocol::Request
        input = Types::CreateDataRetentionBotRequest.new(network_id: network_id)
        create_data_retention_bot(input)
      end
      def create_data_retention_bot(input : Types::CreateDataRetentionBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_RETENTION_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new challenge password for the data retention bot. This password is used for
      # authentication when the bot connects to the network.
      def create_data_retention_bot_challenge(
        network_id : String
      ) : Protocol::Request
        input = Types::CreateDataRetentionBotChallengeRequest.new(network_id: network_id)
        create_data_retention_bot_challenge(input)
      end
      def create_data_retention_bot_challenge(input : Types::CreateDataRetentionBotChallengeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_RETENTION_BOT_CHALLENGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Wickr network with specified access level and configuration. This operation provisions
      # a new communication network for your organization.
      def create_network(
        access_level : String,
        network_name : String,
        enable_premium_free_trial : Bool? = nil,
        encryption_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateNetworkRequest.new(access_level: access_level, network_name: network_name, enable_premium_free_trial: enable_premium_free_trial, encryption_key_arn: encryption_key_arn)
        create_network(input)
      end
      def create_network(input : Types::CreateNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new security group in a Wickr network. Security groups allow you to organize users and
      # control their permissions, features, and security settings.
      def create_security_group(
        name : String,
        network_id : String,
        security_group_settings : Types::SecurityGroupSettingsRequest,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateSecurityGroupRequest.new(name: name, network_id: network_id, security_group_settings: security_group_settings, client_token: client_token)
        create_security_group(input)
      end
      def create_security_group(input : Types::CreateSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a bot from a specified Wickr network. This operation permanently removes the bot account and
      # its associated data from the network.
      def delete_bot(
        bot_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::DeleteBotRequest.new(bot_id: bot_id, network_id: network_id)
        delete_bot(input)
      end
      def delete_bot(input : Types::DeleteBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the data retention bot from a Wickr network. This operation permanently removes the bot and
      # all its associated data from the database.
      def delete_data_retention_bot(
        network_id : String
      ) : Protocol::Request
        input = Types::DeleteDataRetentionBotRequest.new(network_id: network_id)
        delete_data_retention_bot(input)
      end
      def delete_data_retention_bot(input : Types::DeleteDataRetentionBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_RETENTION_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Wickr network and all its associated resources, including users, bots, security groups,
      # and settings. This operation is permanent and cannot be undone.
      def delete_network(
        network_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteNetworkRequest.new(network_id: network_id, client_token: client_token)
        delete_network(input)
      end
      def delete_network(input : Types::DeleteNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a security group from a Wickr network. This operation cannot be performed on the default
      # security group.
      def delete_security_group(
        group_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::DeleteSecurityGroupRequest.new(group_id: group_id, network_id: network_id)
        delete_security_group(input)
      end
      def delete_security_group(input : Types::DeleteSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific bot in a Wickr network, including its status, group
      # membership, and authentication details.
      def get_bot(
        bot_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::GetBotRequest.new(bot_id: bot_id, network_id: network_id)
        get_bot(input)
      end
      def get_bot(input : Types::GetBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the count of bots in a Wickr network, categorized by their status (pending, active, and
      # total).
      def get_bots_count(
        network_id : String
      ) : Protocol::Request
        input = Types::GetBotsCountRequest.new(network_id: network_id)
        get_bots_count(input)
      end
      def get_bots_count(input : Types::GetBotsCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOTS_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the data retention bot in a Wickr network, including its status and
      # whether the data retention service is enabled.
      def get_data_retention_bot(
        network_id : String
      ) : Protocol::Request
        input = Types::GetDataRetentionBotRequest.new(network_id: network_id)
        get_data_retention_bot(input)
      end
      def get_data_retention_bot(input : Types::GetDataRetentionBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_RETENTION_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves historical guest user count data for a Wickr network, showing the number of guest users
      # per billing period over the past 90 days.
      def get_guest_user_history_count(
        network_id : String
      ) : Protocol::Request
        input = Types::GetGuestUserHistoryCountRequest.new(network_id: network_id)
        get_guest_user_history_count(input)
      end
      def get_guest_user_history_count(input : Types::GetGuestUserHistoryCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GUEST_USER_HISTORY_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific Wickr network, including its configuration, access
      # level, and status.
      def get_network(
        network_id : String
      ) : Protocol::Request
        input = Types::GetNetworkRequest.new(network_id: network_id)
        get_network(input)
      end
      def get_network(input : Types::GetNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all network-level settings for a Wickr network, including client metrics, data retention,
      # and other configuration options.
      def get_network_settings(
        network_id : String
      ) : Protocol::Request
        input = Types::GetNetworkSettingsRequest.new(network_id: network_id)
        get_network_settings(input)
      end
      def get_network_settings(input : Types::GetNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the OpenID Connect (OIDC) configuration for a Wickr network, including SSO settings and
      # optional token information if access token parameters are provided.
      def get_oidc_info(
        network_id : String,
        certificate : String? = nil,
        client_id : String? = nil,
        client_secret : String? = nil,
        code : String? = nil,
        code_verifier : String? = nil,
        grant_type : String? = nil,
        redirect_uri : String? = nil,
        url : String? = nil
      ) : Protocol::Request
        input = Types::GetOidcInfoRequest.new(network_id: network_id, certificate: certificate, client_id: client_id, client_secret: client_secret, code: code, code_verifier: code_verifier, grant_type: grant_type, redirect_uri: redirect_uri, url: url)
        get_oidc_info(input)
      end
      def get_oidc_info(input : Types::GetOidcInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OIDC_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific security group in a Wickr network, including its
      # settings, member counts, and configuration.
      def get_security_group(
        group_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::GetSecurityGroupRequest.new(group_id: group_id, network_id: network_id)
        get_security_group(input)
      end
      def get_security_group(input : Types::GetSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific user in a Wickr network, including their profile,
      # status, and activity history.
      def get_user(
        network_id : String,
        user_id : String,
        end_time : Time? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetUserRequest.new(network_id: network_id, user_id: user_id, end_time: end_time, start_time: start_time)
        get_user(input)
      end
      def get_user(input : Types::GetUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the count of users in a Wickr network, categorized by their status (pending, active,
      # rejected) and showing how many users can still be added.
      def get_users_count(
        network_id : String
      ) : Protocol::Request
        input = Types::GetUsersCountRequest.new(network_id: network_id)
        get_users_count(input)
      end
      def get_users_count(input : Types::GetUsersCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USERS_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of guest users who have been blocked from a Wickr network. You can filter
      # and sort the results.
      def list_blocked_guest_users(
        network_id : String,
        admin : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::ListBlockedGuestUsersRequest.new(network_id: network_id, admin: admin, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields, username: username)
        list_blocked_guest_users(input)
      end
      def list_blocked_guest_users(input : Types::ListBlockedGuestUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BLOCKED_GUEST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of bots in a specified Wickr network. You can filter and sort the results
      # based on various criteria.
      def list_bots(
        network_id : String,
        display_name : String? = nil,
        group_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil,
        status : Int32? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::ListBotsRequest.new(network_id: network_id, display_name: display_name, group_id: group_id, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields, status: status, username: username)
        list_bots(input)
      end
      def list_bots(input : Types::ListBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of devices associated with a specific user in a Wickr network. This
      # operation returns information about all devices where the user has logged into Wickr.
      def list_devices_for_user(
        network_id : String,
        user_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesForUserRequest.new(network_id: network_id, user_id: user_id, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields)
        list_devices_for_user(input)
      end
      def list_devices_for_user(input : Types::ListDevicesForUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES_FOR_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of guest users who have communicated with your Wickr network. Guest users
      # are external users from federated networks who can communicate with network members.
      def list_guest_users(
        network_id : String,
        billing_period : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::ListGuestUsersRequest.new(network_id: network_id, billing_period: billing_period, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields, username: username)
        list_guest_users(input)
      end
      def list_guest_users(input : Types::ListGuestUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GUEST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of all Wickr networks associated with your Amazon Web Services account.
      # You can sort the results by network ID or name.
      def list_networks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil
      ) : Protocol::Request
        input = Types::ListNetworksRequest.new(max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields)
        list_networks(input)
      end
      def list_networks(input : Types::ListNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of users who belong to a specific security group in a Wickr network.
      def list_security_group_users(
        group_id : String,
        network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityGroupUsersRequest.new(group_id: group_id, network_id: network_id, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields)
        list_security_group_users(input)
      end
      def list_security_group_users(input : Types::ListSecurityGroupUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_GROUP_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of security groups in a specified Wickr network. You can sort the results
      # by various criteria.
      def list_security_groups(
        network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityGroupsRequest.new(network_id: network_id, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields)
        list_security_groups(input)
      end
      def list_security_groups(input : Types::ListSecurityGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of users in a specified Wickr network. You can filter and sort the
      # results based on various criteria such as name, status, or security group membership.
      def list_users(
        network_id : String,
        first_name : String? = nil,
        group_id : String? = nil,
        last_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_direction : String? = nil,
        sort_fields : String? = nil,
        status : Int32? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(network_id: network_id, first_name: first_name, group_id: group_id, last_name: last_name, max_results: max_results, next_token: next_token, sort_direction: sort_direction, sort_fields: sort_fields, status: status, username: username)
        list_users(input)
      end
      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers and saves an OpenID Connect (OIDC) configuration for a Wickr network, enabling Single
      # Sign-On (SSO) authentication through an identity provider.
      def register_oidc_config(
        company_id : String,
        issuer : String,
        network_id : String,
        scopes : String,
        custom_username : String? = nil,
        extra_auth_params : String? = nil,
        secret : String? = nil,
        sso_token_buffer_minutes : Int32? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::RegisterOidcConfigRequest.new(company_id: company_id, issuer: issuer, network_id: network_id, scopes: scopes, custom_username: custom_username, extra_auth_params: extra_auth_params, secret: secret, sso_token_buffer_minutes: sso_token_buffer_minutes, user_id: user_id)
        register_oidc_config(input)
      end
      def register_oidc_config(input : Types::RegisterOidcConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_OIDC_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tests an OpenID Connect (OIDC) configuration for a Wickr network by validating the connection to the
      # identity provider and retrieving its supported capabilities.
      def register_oidc_config_test(
        issuer : String,
        network_id : String,
        scopes : String,
        certificate : String? = nil,
        extra_auth_params : String? = nil
      ) : Protocol::Request
        input = Types::RegisterOidcConfigTestRequest.new(issuer: issuer, network_id: network_id, scopes: scopes, certificate: certificate, extra_auth_params: extra_auth_params)
        register_oidc_config_test(input)
      end
      def register_oidc_config_test(input : Types::RegisterOidcConfigTestRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_OIDC_CONFIG_TEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing bot in a Wickr network. This operation allows you to modify
      # the bot's display name, security group, password, or suspension status.
      def update_bot(
        bot_id : String,
        network_id : String,
        challenge : String? = nil,
        display_name : String? = nil,
        group_id : String? = nil,
        suspend : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateBotRequest.new(bot_id: bot_id, network_id: network_id, challenge: challenge, display_name: display_name, group_id: group_id, suspend: suspend)
        update_bot(input)
      end
      def update_bot(input : Types::UpdateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data retention bot settings, allowing you to enable or disable the data retention
      # service, or acknowledge the public key message.
      def update_data_retention(
        action_type : String,
        network_id : String
      ) : Protocol::Request
        input = Types::UpdateDataRetentionRequest.new(action_type: action_type, network_id: network_id)
        update_data_retention(input)
      end
      def update_data_retention(input : Types::UpdateDataRetentionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_RETENTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the block status of a guest user in a Wickr network. This operation allows you to block or
      # unblock a guest user from accessing the network.
      def update_guest_user(
        block : Bool,
        network_id : String,
        username_hash : String
      ) : Protocol::Request
        input = Types::UpdateGuestUserRequest.new(block: block, network_id: network_id, username_hash: username_hash)
        update_guest_user(input)
      end
      def update_guest_user(input : Types::UpdateGuestUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GUEST_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing Wickr network, such as its name or encryption key
      # configuration.
      def update_network(
        network_id : String,
        network_name : String,
        client_token : String? = nil,
        encryption_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNetworkRequest.new(network_id: network_id, network_name: network_name, client_token: client_token, encryption_key_arn: encryption_key_arn)
        update_network(input)
      end
      def update_network(input : Types::UpdateNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates network-level settings for a Wickr network. You can modify settings such as client metrics,
      # data retention, and other network-wide options.
      def update_network_settings(
        network_id : String,
        settings : Types::NetworkSettings
      ) : Protocol::Request
        input = Types::UpdateNetworkSettingsRequest.new(network_id: network_id, settings: settings)
        update_network_settings(input)
      end
      def update_network_settings(input : Types::UpdateNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing security group in a Wickr network, such as its name or
      # settings.
      def update_security_group(
        group_id : String,
        network_id : String,
        name : String? = nil,
        security_group_settings : Types::SecurityGroupSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityGroupRequest.new(group_id: group_id, network_id: network_id, name: name, security_group_settings: security_group_settings)
        update_security_group(input)
      end
      def update_security_group(input : Types::UpdateSecurityGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing user in a Wickr network. This operation allows you to modify
      # the user's name, password, security group membership, and invite code settings. codeValidation ,
      # inviteCode , and inviteCodeTtl are restricted to networks under preview only.
      def update_user(
        network_id : String,
        user_id : String,
        user_details : Types::UpdateUserDetails? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(network_id: network_id, user_id: user_id, user_details: user_details)
        update_user(input)
      end
      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
