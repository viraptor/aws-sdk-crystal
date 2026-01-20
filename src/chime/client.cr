module Aws
  module Chime
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates a phone number with the specified Amazon Chime user.

      def associate_phone_number_with_user(
        account_id : String,
        e164_phone_number : String,
        user_id : String
      ) : Protocol::Request
        input = Types::AssociatePhoneNumberWithUserRequest.new(account_id: account_id, e164_phone_number: e164_phone_number, user_id: user_id)
        associate_phone_number_with_user(input)
      end

      def associate_phone_number_with_user(input : Types::AssociatePhoneNumberWithUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PHONE_NUMBER_WITH_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified sign-in delegate groups with the specified Amazon Chime account.

      def associate_signin_delegate_groups_with_account(
        account_id : String,
        signin_delegate_groups : Array(Types::SigninDelegateGroup)
      ) : Protocol::Request
        input = Types::AssociateSigninDelegateGroupsWithAccountRequest.new(account_id: account_id, signin_delegate_groups: signin_delegate_groups)
        associate_signin_delegate_groups_with_account(input)
      end

      def associate_signin_delegate_groups_with_account(input : Types::AssociateSigninDelegateGroupsWithAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SIGNIN_DELEGATE_GROUPS_WITH_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds up to 50 members to a chat room in an Amazon Chime Enterprise account. Members can be users or
      # bots. The member role designates whether the member is a chat room administrator or a general chat
      # room member.

      def batch_create_room_membership(
        account_id : String,
        membership_item_list : Array(Types::MembershipItem),
        room_id : String
      ) : Protocol::Request
        input = Types::BatchCreateRoomMembershipRequest.new(account_id: account_id, membership_item_list: membership_item_list, room_id: room_id)
        batch_create_room_membership(input)
      end

      def batch_create_room_membership(input : Types::BatchCreateRoomMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_ROOM_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Moves phone numbers into the Deletion queue . Phone numbers must be disassociated from any users or
      # Amazon Chime Voice Connectors before they can be deleted. Phone numbers remain in the Deletion queue
      # for 7 days before they are deleted permanently.

      def batch_delete_phone_number(
        phone_number_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeletePhoneNumberRequest.new(phone_number_ids: phone_number_ids)
        batch_delete_phone_number(input)
      end

      def batch_delete_phone_number(input : Types::BatchDeletePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Suspends up to 50 users from a Team or EnterpriseLWA Amazon Chime account. For more information
      # about different account types, see Managing Your Amazon Chime Accounts in the Amazon Chime
      # Administration Guide . Users suspended from a Team account are disassociated from the account,but
      # they can continue to use Amazon Chime as free users. To remove the suspension from suspended Team
      # account users, invite them to the Team account again. You can use the InviteUsers action to do so.
      # Users suspended from an EnterpriseLWA account are immediately signed out of Amazon Chime and can no
      # longer sign in. To remove the suspension from suspended EnterpriseLWA account users, use the
      # BatchUnsuspendUser action. To sign out users without suspending them, use the LogoutUser action.

      def batch_suspend_user(
        account_id : String,
        user_id_list : Array(String)
      ) : Protocol::Request
        input = Types::BatchSuspendUserRequest.new(account_id: account_id, user_id_list: user_id_list)
        batch_suspend_user(input)
      end

      def batch_suspend_user(input : Types::BatchSuspendUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_SUSPEND_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the suspension from up to 50 previously suspended users for the specified Amazon Chime
      # EnterpriseLWA account. Only users on EnterpriseLWA accounts can be unsuspended using this action.
      # For more information about different account types, see Managing Your Amazon Chime Accounts in the
      # account types, in the Amazon Chime Administration Guide . Previously suspended users who are
      # unsuspended using this action are returned to Registered status. Users who are not previously
      # suspended are ignored.

      def batch_unsuspend_user(
        account_id : String,
        user_id_list : Array(String)
      ) : Protocol::Request
        input = Types::BatchUnsuspendUserRequest.new(account_id: account_id, user_id_list: user_id_list)
        batch_unsuspend_user(input)
      end

      def batch_unsuspend_user(input : Types::BatchUnsuspendUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UNSUSPEND_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates phone number product types or calling names. You can update one attribute at a time for each
      # UpdatePhoneNumberRequestItem . For example, you can update the product type or the calling name. For
      # toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers
      # outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type. Updates
      # to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling
      # names must be complete before you can request another update.

      def batch_update_phone_number(
        update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)
      ) : Protocol::Request
        input = Types::BatchUpdatePhoneNumberRequest.new(update_phone_number_request_items: update_phone_number_request_items)
        batch_update_phone_number(input)
      end

      def batch_update_phone_number(input : Types::BatchUpdatePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates user details within the UpdateUserRequestItem object for up to 20 users for the specified
      # Amazon Chime account. Currently, only LicenseType updates are supported for this action.

      def batch_update_user(
        account_id : String,
        update_user_request_items : Array(Types::UpdateUserRequestItem)
      ) : Protocol::Request
        input = Types::BatchUpdateUserRequest.new(account_id: account_id, update_user_request_items: update_user_request_items)
        batch_update_user(input)
      end

      def batch_update_user(input : Types::BatchUpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Chime account under the administrator's AWS account. Only Team account types are
      # currently supported for this action. For more information about different account types, see
      # Managing Your Amazon Chime Accounts in the Amazon Chime Administration Guide .

      def create_account(
        name : String
      ) : Protocol::Request
        input = Types::CreateAccountRequest.new(name: name)
        create_account(input)
      end

      def create_account(input : Types::CreateAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a bot for an Amazon Chime Enterprise account.

      def create_bot(
        account_id : String,
        display_name : String,
        domain : String? = nil
      ) : Protocol::Request
        input = Types::CreateBotRequest.new(account_id: account_id, display_name: display_name, domain: domain)
        create_bot(input)
      end

      def create_bot(input : Types::CreateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uses the join token and call metadata in a meeting request (From number, To number, and so forth) to
      # initiate an outbound call to a public switched telephone network (PSTN) and join them into a Chime
      # meeting. Also ensures that the From number belongs to the customer. To play welcome audio or
      # implement an interactive voice response (IVR), use the CreateSipMediaApplicationCall action with the
      # corresponding SIP media application ID. This API is not available in a dedicated namespace.

      def create_meeting_dial_out(
        from_phone_number : String,
        join_token : String,
        meeting_id : String,
        to_phone_number : String
      ) : Protocol::Request
        input = Types::CreateMeetingDialOutRequest.new(from_phone_number: from_phone_number, join_token: join_token, meeting_id: meeting_id, to_phone_number: to_phone_number)
        create_meeting_dial_out(input)
      end

      def create_meeting_dial_out(input : Types::CreateMeetingDialOutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEETING_DIAL_OUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an order for phone numbers to be provisioned. For toll-free numbers, you cannot use the
      # Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon
      # Chime SIP Media Application Dial-In product type.

      def create_phone_number_order(
        e164_phone_numbers : Array(String),
        product_type : String
      ) : Protocol::Request
        input = Types::CreatePhoneNumberOrderRequest.new(e164_phone_numbers: e164_phone_numbers, product_type: product_type)
        create_phone_number_order(input)
      end

      def create_phone_number_order(input : Types::CreatePhoneNumberOrderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PHONE_NUMBER_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a chat room for the specified Amazon Chime Enterprise account.

      def create_room(
        account_id : String,
        name : String,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateRoomRequest.new(account_id: account_id, name: name, client_request_token: client_request_token)
        create_room(input)
      end

      def create_room(input : Types::CreateRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a member to a chat room in an Amazon Chime Enterprise account. A member can be either a user or
      # a bot. The member role designates whether the member is a chat room administrator or a general chat
      # room member.

      def create_room_membership(
        account_id : String,
        member_id : String,
        room_id : String,
        role : String? = nil
      ) : Protocol::Request
        input = Types::CreateRoomMembershipRequest.new(account_id: account_id, member_id: member_id, room_id: room_id, role: role)
        create_room_membership(input)
      end

      def create_room_membership(input : Types::CreateRoomMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROOM_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user under the specified Amazon Chime account.

      def create_user(
        account_id : String,
        email : String? = nil,
        user_type : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(account_id: account_id, email: email, user_type: user_type, username: username)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Amazon Chime account. You must suspend all users before deleting Team account.
      # You can use the BatchSuspendUser action to dodo. For EnterpriseLWA and EnterpriseAD accounts, you
      # must release the claimed domains for your Amazon Chime account before deletion. As soon as you
      # release the domain, all users under that account are suspended. Deleted accounts appear in your
      # Disabled accounts list for 90 days. To restore deleted account from your Disabled accounts list, you
      # must contact AWS Support. After 90 days, deleted accounts are permanently removed from your Disabled
      # accounts list.

      def delete_account(
        account_id : String
      ) : Protocol::Request
        input = Types::DeleteAccountRequest.new(account_id: account_id)
        delete_account(input)
      end

      def delete_account(input : Types::DeleteAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the events configuration that allows a bot to receive outgoing events.

      def delete_events_configuration(
        account_id : String,
        bot_id : String
      ) : Protocol::Request
        input = Types::DeleteEventsConfigurationRequest.new(account_id: account_id, bot_id: bot_id)
        delete_events_configuration(input)
      end

      def delete_events_configuration(input : Types::DeleteEventsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENTS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Moves the specified phone number into the Deletion queue . A phone number must be disassociated from
      # any users or Amazon Chime Voice Connectors before it can be deleted. Deleted phone numbers remain in
      # the Deletion queue for 7 days before they are deleted permanently.

      def delete_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::DeletePhoneNumberRequest.new(phone_number_id: phone_number_id)
        delete_phone_number(input)
      end

      def delete_phone_number(input : Types::DeletePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a chat room in an Amazon Chime Enterprise account.

      def delete_room(
        account_id : String,
        room_id : String
      ) : Protocol::Request
        input = Types::DeleteRoomRequest.new(account_id: account_id, room_id: room_id)
        delete_room(input)
      end

      def delete_room(input : Types::DeleteRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a member from a chat room in an Amazon Chime Enterprise account.

      def delete_room_membership(
        account_id : String,
        member_id : String,
        room_id : String
      ) : Protocol::Request
        input = Types::DeleteRoomMembershipRequest.new(account_id: account_id, member_id: member_id, room_id: room_id)
        delete_room_membership(input)
      end

      def delete_room_membership(input : Types::DeleteRoomMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROOM_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the primary provisioned phone number from the specified Amazon Chime user.

      def disassociate_phone_number_from_user(
        account_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DisassociatePhoneNumberFromUserRequest.new(account_id: account_id, user_id: user_id)
        disassociate_phone_number_from_user(input)
      end

      def disassociate_phone_number_from_user(input : Types::DisassociatePhoneNumberFromUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PHONE_NUMBER_FROM_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the specified sign-in delegate groups from the specified Amazon Chime account.

      def disassociate_signin_delegate_groups_from_account(
        account_id : String,
        group_names : Array(String)
      ) : Protocol::Request
        input = Types::DisassociateSigninDelegateGroupsFromAccountRequest.new(account_id: account_id, group_names: group_names)
        disassociate_signin_delegate_groups_from_account(input)
      end

      def disassociate_signin_delegate_groups_from_account(input : Types::DisassociateSigninDelegateGroupsFromAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SIGNIN_DELEGATE_GROUPS_FROM_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified Amazon Chime account, such as account type and supported
      # licenses.

      def get_account(
        account_id : String
      ) : Protocol::Request
        input = Types::GetAccountRequest.new(account_id: account_id)
        get_account(input)
      end

      def get_account(input : Types::GetAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves account settings for the specified Amazon Chime account ID, such as remote control and
      # dialout settings. For more information about these settings, see Use the Policies Page in the Amazon
      # Chime Administration Guide .

      def get_account_settings(
        account_id : String
      ) : Protocol::Request
        input = Types::GetAccountSettingsRequest.new(account_id: account_id)
        get_account_settings(input)
      end

      def get_account_settings(input : Types::GetAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified bot, such as bot email address, bot type, status, and display
      # name.

      def get_bot(
        account_id : String,
        bot_id : String
      ) : Protocol::Request
        input = Types::GetBotRequest.new(account_id: account_id, bot_id: bot_id)
        get_bot(input)
      end

      def get_bot(input : Types::GetBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details for an events configuration that allows a bot to receive outgoing events, such as an
      # HTTPS endpoint or Lambda function ARN.

      def get_events_configuration(
        account_id : String,
        bot_id : String
      ) : Protocol::Request
        input = Types::GetEventsConfigurationRequest.new(account_id: account_id, bot_id: bot_id)
        get_events_configuration(input)
      end

      def get_events_configuration(input : Types::GetEventsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENTS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves global settings for the administrator's AWS account, such as Amazon Chime Business Calling
      # and Amazon Chime Voice Connector settings.


      def get_global_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOBAL_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified phone number ID, such as associations, capabilities, and product
      # type.

      def get_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::GetPhoneNumberRequest.new(phone_number_id: phone_number_id)
        get_phone_number(input)
      end

      def get_phone_number(input : Types::GetPhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified phone number order, such as the order creation timestamp, phone
      # numbers in E.164 format, product type, and order status.

      def get_phone_number_order(
        phone_number_order_id : String
      ) : Protocol::Request
        input = Types::GetPhoneNumberOrderRequest.new(phone_number_order_id: phone_number_order_id)
        get_phone_number_order(input)
      end

      def get_phone_number_order(input : Types::GetPhoneNumberOrderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the phone number settings for the administrator's AWS account, such as the default
      # outbound calling name.


      def get_phone_number_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PHONE_NUMBER_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the retention settings for the specified Amazon Chime Enterprise account. For more information
      # about retention settings, see Managing Chat Retention Policies in the Amazon Chime Administration
      # Guide .

      def get_retention_settings(
        account_id : String
      ) : Protocol::Request
        input = Types::GetRetentionSettingsRequest.new(account_id: account_id)
        get_retention_settings(input)
      end

      def get_retention_settings(input : Types::GetRetentionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RETENTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves room details, such as the room name, for a room in an Amazon Chime Enterprise account.

      def get_room(
        account_id : String,
        room_id : String
      ) : Protocol::Request
        input = Types::GetRoomRequest.new(account_id: account_id, room_id: room_id)
        get_room(input)
      end

      def get_room(input : Types::GetRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for the specified user ID, such as primary email address, license type,and
      # personal meeting PIN. To retrieve user details with an email address instead of a user ID, use the
      # ListUsers action, and then filter by email address.

      def get_user(
        account_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::GetUserRequest.new(account_id: account_id, user_id: user_id)
        get_user(input)
      end

      def get_user(input : Types::GetUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves settings for the specified user ID, such as any associated phone number settings.

      def get_user_settings(
        account_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::GetUserSettingsRequest.new(account_id: account_id, user_id: user_id)
        get_user_settings(input)
      end

      def get_user_settings(input : Types::GetUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends email to a maximum of 50 users, inviting them to the specified Amazon Chime Team account. Only
      # Team account types are currently supported for this action.

      def invite_users(
        account_id : String,
        user_email_list : Array(String),
        user_type : String? = nil
      ) : Protocol::Request
        input = Types::InviteUsersRequest.new(account_id: account_id, user_email_list: user_email_list, user_type: user_type)
        invite_users(input)
      end

      def invite_users(input : Types::InviteUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVITE_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Chime accounts under the administrator's AWS account. You can filter accounts by
      # account name prefix. To find out which Amazon Chime account a user belongs to, you can filter by the
      # user's email address, which returns one account result.

      def list_accounts(
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        user_email : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountsRequest.new(max_results: max_results, name: name, next_token: next_token, user_email: user_email)
        list_accounts(input)
      end

      def list_accounts(input : Types::ListAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the bots associated with the administrator's Amazon Chime Enterprise account ID.

      def list_bots(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBotsRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_bots(input)
      end

      def list_bots(input : Types::ListBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the phone number orders for the administrator's Amazon Chime account.

      def list_phone_number_orders(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumberOrdersRequest.new(max_results: max_results, next_token: next_token)
        list_phone_number_orders(input)
      end

      def list_phone_number_orders(input : Types::ListPhoneNumberOrdersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBER_ORDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the phone numbers for the specified Amazon Chime account, Amazon Chime user, Amazon Chime
      # Voice Connector, or Amazon Chime Voice Connector group.

      def list_phone_numbers(
        filter_name : String? = nil,
        filter_value : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        product_type : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumbersRequest.new(filter_name: filter_name, filter_value: filter_value, max_results: max_results, next_token: next_token, product_type: product_type, status: status)
        list_phone_numbers(input)
      end

      def list_phone_numbers(input : Types::ListPhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the membership details for the specified room in an Amazon Chime Enterprise account, such as
      # the members' IDs, email addresses, and names.

      def list_room_memberships(
        account_id : String,
        room_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoomMembershipsRequest.new(account_id: account_id, room_id: room_id, max_results: max_results, next_token: next_token)
        list_room_memberships(input)
      end

      def list_room_memberships(input : Types::ListRoomMembershipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROOM_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the room details for the specified Amazon Chime Enterprise account. Optionally, filter the
      # results by a member ID (user ID or bot ID) to see a list of rooms that the member belongs to.

      def list_rooms(
        account_id : String,
        max_results : Int32? = nil,
        member_id : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoomsRequest.new(account_id: account_id, max_results: max_results, member_id: member_id, next_token: next_token)
        list_rooms(input)
      end

      def list_rooms(input : Types::ListRoomsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROOMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists supported phone number countries.

      def list_supported_phone_number_countries(
        product_type : String
      ) : Protocol::Request
        input = Types::ListSupportedPhoneNumberCountriesRequest.new(product_type: product_type)
        list_supported_phone_number_countries(input)
      end

      def list_supported_phone_number_countries(input : Types::ListSupportedPhoneNumberCountriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUPPORTED_PHONE_NUMBER_COUNTRIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the users that belong to the specified Amazon Chime account. You can specify an email address
      # to list only the user that the email address belongs to.

      def list_users(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_email : String? = nil,
        user_type : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(account_id: account_id, max_results: max_results, next_token: next_token, user_email: user_email, user_type: user_type)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Logs out the specified user from all of the devices they are currently logged into.

      def logout_user(
        account_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::LogoutUserRequest.new(account_id: account_id, user_id: user_id)
        logout_user(input)
      end

      def logout_user(input : Types::LogoutUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LOGOUT_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an events configuration that allows a bot to receive outgoing events sent by Amazon Chime.
      # Choose either an HTTPS endpoint or a Lambda function ARN. For more information, see Bot .

      def put_events_configuration(
        account_id : String,
        bot_id : String,
        lambda_function_arn : String? = nil,
        outbound_events_https_endpoint : String? = nil
      ) : Protocol::Request
        input = Types::PutEventsConfigurationRequest.new(account_id: account_id, bot_id: bot_id, lambda_function_arn: lambda_function_arn, outbound_events_https_endpoint: outbound_events_https_endpoint)
        put_events_configuration(input)
      end

      def put_events_configuration(input : Types::PutEventsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EVENTS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Puts retention settings for the specified Amazon Chime Enterprise account. We recommend using AWS
      # CloudTrail to monitor usage of this API for your account. For more information, see Logging Amazon
      # Chime API Calls with AWS CloudTrail in the Amazon Chime Administration Guide . To turn off existing
      # retention settings, remove the number of days from the corresponding RetentionDays field in the
      # RetentionSettings object. For more information about retention settings, see Managing Chat Retention
      # Policies in the Amazon Chime Administration Guide .

      def put_retention_settings(
        account_id : String,
        retention_settings : Types::RetentionSettings
      ) : Protocol::Request
        input = Types::PutRetentionSettingsRequest.new(account_id: account_id, retention_settings: retention_settings)
        put_retention_settings(input)
      end

      def put_retention_settings(input : Types::PutRetentionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RETENTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Redacts the specified message from the specified Amazon Chime conversation.

      def redact_conversation_message(
        account_id : String,
        conversation_id : String,
        message_id : String
      ) : Protocol::Request
        input = Types::RedactConversationMessageRequest.new(account_id: account_id, conversation_id: conversation_id, message_id: message_id)
        redact_conversation_message(input)
      end

      def redact_conversation_message(input : Types::RedactConversationMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REDACT_CONVERSATION_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Redacts the specified message from the specified Amazon Chime channel.

      def redact_room_message(
        account_id : String,
        message_id : String,
        room_id : String
      ) : Protocol::Request
        input = Types::RedactRoomMessageRequest.new(account_id: account_id, message_id: message_id, room_id: room_id)
        redact_room_message(input)
      end

      def redact_room_message(input : Types::RedactRoomMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REDACT_ROOM_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Regenerates the security token for a bot.

      def regenerate_security_token(
        account_id : String,
        bot_id : String
      ) : Protocol::Request
        input = Types::RegenerateSecurityTokenRequest.new(account_id: account_id, bot_id: bot_id)
        regenerate_security_token(input)
      end

      def regenerate_security_token(input : Types::RegenerateSecurityTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGENERATE_SECURITY_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets the personal meeting PIN for the specified user on an Amazon Chime account. Returns the User
      # object with the updated personal meeting PIN.

      def reset_personal_pin(
        account_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::ResetPersonalPINRequest.new(account_id: account_id, user_id: user_id)
        reset_personal_pin(input)
      end

      def reset_personal_pin(input : Types::ResetPersonalPINRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_PERSONAL_PIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Moves a phone number from the Deletion queue back into the phone number Inventory .

      def restore_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::RestorePhoneNumberRequest.new(phone_number_id: phone_number_id)
        restore_phone_number(input)
      end

      def restore_phone_number(input : Types::RestorePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for phone numbers that can be ordered. For US numbers, provide at least one of the
      # following search filters: AreaCode , City , State , or TollFreePrefix . If you provide City , you
      # must also provide State . Numbers outside the US only support the PhoneNumberType filter, which you
      # must use.

      def search_available_phone_numbers(
        area_code : String? = nil,
        city : String? = nil,
        country : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        phone_number_type : String? = nil,
        state : String? = nil,
        toll_free_prefix : String? = nil
      ) : Protocol::Request
        input = Types::SearchAvailablePhoneNumbersRequest.new(area_code: area_code, city: city, country: country, max_results: max_results, next_token: next_token, phone_number_type: phone_number_type, state: state, toll_free_prefix: toll_free_prefix)
        search_available_phone_numbers(input)
      end

      def search_available_phone_numbers(input : Types::SearchAvailablePhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_AVAILABLE_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates account details for the specified Amazon Chime account. Currently, only account name and
      # default license updates are supported for this action.

      def update_account(
        account_id : String,
        default_license : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountRequest.new(account_id: account_id, default_license: default_license, name: name)
        update_account(input)
      end

      def update_account(input : Types::UpdateAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for the specified Amazon Chime account. You can update settings for remote
      # control of shared screens, or for the dial-out option. For more information about these settings,
      # see Use the Policies Page in the Amazon Chime Administration Guide .

      def update_account_settings(
        account_id : String,
        account_settings : Types::AccountSettings
      ) : Protocol::Request
        input = Types::UpdateAccountSettingsRequest.new(account_id: account_id, account_settings: account_settings)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of the specified bot, such as starting or stopping the bot from running in your
      # Amazon Chime Enterprise account.

      def update_bot(
        account_id : String,
        bot_id : String,
        disabled : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateBotRequest.new(account_id: account_id, bot_id: bot_id, disabled: disabled)
        update_bot(input)
      end

      def update_bot(input : Types::UpdateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates global settings for the administrator's AWS account, such as Amazon Chime Business Calling
      # and Amazon Chime Voice Connector settings.

      def update_global_settings(
        business_calling : Types::BusinessCallingSettings? = nil,
        voice_connector : Types::VoiceConnectorSettings? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalSettingsRequest.new(business_calling: business_calling, voice_connector: voice_connector)
        update_global_settings(input)
      end

      def update_global_settings(input : Types::UpdateGlobalSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates phone number details, such as product type or calling name, for the specified phone number
      # ID. You can update one phone number detail at a time. For example, you can update either the product
      # type or the calling name in one action. For toll-free numbers, you cannot use the Amazon Chime
      # Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media
      # Application Dial-In product type. Updates to outbound calling names can take 72 hours to complete.
      # Pending updates to outbound calling names must be complete before you can request another update.

      def update_phone_number(
        phone_number_id : String,
        calling_name : String? = nil,
        product_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberRequest.new(phone_number_id: phone_number_id, calling_name: calling_name, product_type: product_type)
        update_phone_number(input)
      end

      def update_phone_number(input : Types::UpdatePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the phone number settings for the administrator's AWS account, such as the default outbound
      # calling name. You can update the default outbound calling name once every seven days. Outbound
      # calling names can take up to 72 hours to update.

      def update_phone_number_settings(
        calling_name : String
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberSettingsRequest.new(calling_name: calling_name)
        update_phone_number_settings(input)
      end

      def update_phone_number_settings(input : Types::UpdatePhoneNumberSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates room details, such as the room name, for a room in an Amazon Chime Enterprise account.

      def update_room(
        account_id : String,
        room_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRoomRequest.new(account_id: account_id, room_id: room_id, name: name)
        update_room(input)
      end

      def update_room(input : Types::UpdateRoomRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROOM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates room membership details, such as the member role, for a room in an Amazon Chime Enterprise
      # account. The member role designates whether the member is a chat room administrator or a general
      # chat room member. The member role can be updated only for user IDs.

      def update_room_membership(
        account_id : String,
        member_id : String,
        room_id : String,
        role : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRoomMembershipRequest.new(account_id: account_id, member_id: member_id, room_id: room_id, role: role)
        update_room_membership(input)
      end

      def update_room_membership(input : Types::UpdateRoomMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROOM_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates user details for a specified user ID. Currently, only LicenseType updates are supported for
      # this action.

      def update_user(
        account_id : String,
        user_id : String,
        alexa_for_business_metadata : Types::AlexaForBusinessMetadata? = nil,
        license_type : String? = nil,
        user_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(account_id: account_id, user_id: user_id, alexa_for_business_metadata: alexa_for_business_metadata, license_type: license_type, user_type: user_type)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for the specified user, such as phone number settings.

      def update_user_settings(
        account_id : String,
        user_id : String,
        user_settings : Types::UserSettings
      ) : Protocol::Request
        input = Types::UpdateUserSettingsRequest.new(account_id: account_id, user_id: user_id, user_settings: user_settings)
        update_user_settings(input)
      end

      def update_user_settings(input : Types::UpdateUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
