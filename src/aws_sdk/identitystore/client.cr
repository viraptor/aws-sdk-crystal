module AwsSdk
  module Identitystore
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a group within the specified identity store.

      def create_group(
        identity_store_id : String,
        description : String? = nil,
        display_name : String? = nil
      ) : Types::CreateGroupResponse

        input = Types::CreateGroupRequest.new(identity_store_id: identity_store_id, description: description, display_name: display_name)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Types::CreateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGroupResponse, "CreateGroup")
      end

      # Creates a relationship between a member and a group. The following identifiers must be specified:
      # GroupId , IdentityStoreId , and MemberId .

      def create_group_membership(
        group_id : String,
        identity_store_id : String,
        member_id : Types::MemberId
      ) : Types::CreateGroupMembershipResponse

        input = Types::CreateGroupMembershipRequest.new(group_id: group_id, identity_store_id: identity_store_id, member_id: member_id)
        create_group_membership(input)
      end

      def create_group_membership(input : Types::CreateGroupMembershipRequest) : Types::CreateGroupMembershipResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GROUP_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGroupMembershipResponse, "CreateGroupMembership")
      end

      # Creates a user within the specified identity store.

      def create_user(
        identity_store_id : String,
        addresses : Array(Types::Address)? = nil,
        birthdate : String? = nil,
        display_name : String? = nil,
        emails : Array(Types::Email)? = nil,
        extensions : Hash(String, Types::AttributeValue)? = nil,
        locale : String? = nil,
        name : Types::Name? = nil,
        nick_name : String? = nil,
        phone_numbers : Array(Types::PhoneNumber)? = nil,
        photos : Array(Types::Photo)? = nil,
        preferred_language : String? = nil,
        profile_url : String? = nil,
        roles : Array(Types::Role)? = nil,
        timezone : String? = nil,
        title : String? = nil,
        user_name : String? = nil,
        user_type : String? = nil,
        website : String? = nil
      ) : Types::CreateUserResponse

        input = Types::CreateUserRequest.new(identity_store_id: identity_store_id, addresses: addresses, birthdate: birthdate, display_name: display_name, emails: emails, extensions: extensions, locale: locale, name: name, nick_name: nick_name, phone_numbers: phone_numbers, photos: photos, preferred_language: preferred_language, profile_url: profile_url, roles: roles, timezone: timezone, title: title, user_name: user_name, user_type: user_type, website: website)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Delete a group within an identity store given GroupId .

      def delete_group(
        group_id : String,
        identity_store_id : String
      ) : Types::DeleteGroupResponse

        input = Types::DeleteGroupRequest.new(group_id: group_id, identity_store_id: identity_store_id)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Types::DeleteGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGroupResponse, "DeleteGroup")
      end

      # Delete a membership within a group given MembershipId .

      def delete_group_membership(
        identity_store_id : String,
        membership_id : String
      ) : Types::DeleteGroupMembershipResponse

        input = Types::DeleteGroupMembershipRequest.new(identity_store_id: identity_store_id, membership_id: membership_id)
        delete_group_membership(input)
      end

      def delete_group_membership(input : Types::DeleteGroupMembershipRequest) : Types::DeleteGroupMembershipResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GROUP_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGroupMembershipResponse, "DeleteGroupMembership")
      end

      # Deletes a user within an identity store given UserId .

      def delete_user(
        identity_store_id : String,
        user_id : String
      ) : Types::DeleteUserResponse

        input = Types::DeleteUserRequest.new(identity_store_id: identity_store_id, user_id: user_id)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Types::DeleteUserResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserResponse, "DeleteUser")
      end

      # Retrieves the group metadata and attributes from GroupId in an identity store. If you have access to
      # a member account, you can use this API operation from the member account. For more information, see
      # Limiting access to the identity store from member accounts in the IAM Identity Center User Guide .

      def describe_group(
        group_id : String,
        identity_store_id : String
      ) : Types::DescribeGroupResponse

        input = Types::DescribeGroupRequest.new(group_id: group_id, identity_store_id: identity_store_id)
        describe_group(input)
      end

      def describe_group(input : Types::DescribeGroupRequest) : Types::DescribeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGroupResponse, "DescribeGroup")
      end

      # Retrieves membership metadata and attributes from MembershipId in an identity store. If you have
      # access to a member account, you can use this API operation from the member account. For more
      # information, see Limiting access to the identity store from member accounts in the IAM Identity
      # Center User Guide .

      def describe_group_membership(
        identity_store_id : String,
        membership_id : String
      ) : Types::DescribeGroupMembershipResponse

        input = Types::DescribeGroupMembershipRequest.new(identity_store_id: identity_store_id, membership_id: membership_id)
        describe_group_membership(input)
      end

      def describe_group_membership(input : Types::DescribeGroupMembershipRequest) : Types::DescribeGroupMembershipResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GROUP_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGroupMembershipResponse, "DescribeGroupMembership")
      end

      # Retrieves the user metadata and attributes from the UserId in an identity store. If you have access
      # to a member account, you can use this API operation from the member account. For more information,
      # see Limiting access to the identity store from member accounts in the IAM Identity Center User Guide
      # .

      def describe_user(
        identity_store_id : String,
        user_id : String,
        extensions : Array(String)? = nil
      ) : Types::DescribeUserResponse

        input = Types::DescribeUserRequest.new(identity_store_id: identity_store_id, user_id: user_id, extensions: extensions)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Types::DescribeUserResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserResponse, "DescribeUser")
      end

      # Retrieves GroupId in an identity store. If you have access to a member account, you can use this API
      # operation from the member account. For more information, see Limiting access to the identity store
      # from member accounts in the IAM Identity Center User Guide .

      def get_group_id(
        alternate_identifier : Types::AlternateIdentifier,
        identity_store_id : String
      ) : Types::GetGroupIdResponse

        input = Types::GetGroupIdRequest.new(alternate_identifier: alternate_identifier, identity_store_id: identity_store_id)
        get_group_id(input)
      end

      def get_group_id(input : Types::GetGroupIdRequest) : Types::GetGroupIdResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GROUP_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGroupIdResponse, "GetGroupId")
      end

      # Retrieves the MembershipId in an identity store. If you have access to a member account, you can use
      # this API operation from the member account. For more information, see Limiting access to the
      # identity store from member accounts in the IAM Identity Center User Guide .

      def get_group_membership_id(
        group_id : String,
        identity_store_id : String,
        member_id : Types::MemberId
      ) : Types::GetGroupMembershipIdResponse

        input = Types::GetGroupMembershipIdRequest.new(group_id: group_id, identity_store_id: identity_store_id, member_id: member_id)
        get_group_membership_id(input)
      end

      def get_group_membership_id(input : Types::GetGroupMembershipIdRequest) : Types::GetGroupMembershipIdResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GROUP_MEMBERSHIP_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGroupMembershipIdResponse, "GetGroupMembershipId")
      end

      # Retrieves the UserId in an identity store. If you have access to a member account, you can use this
      # API operation from the member account. For more information, see Limiting access to the identity
      # store from member accounts in the IAM Identity Center User Guide .

      def get_user_id(
        alternate_identifier : Types::AlternateIdentifier,
        identity_store_id : String
      ) : Types::GetUserIdResponse

        input = Types::GetUserIdRequest.new(alternate_identifier: alternate_identifier, identity_store_id: identity_store_id)
        get_user_id(input)
      end

      def get_user_id(input : Types::GetUserIdRequest) : Types::GetUserIdResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserIdResponse, "GetUserId")
      end

      # Checks the user's membership in all requested groups and returns if the member exists in all queried
      # groups. If you have access to a member account, you can use this API operation from the member
      # account. For more information, see Limiting access to the identity store from member accounts in the
      # IAM Identity Center User Guide .

      def is_member_in_groups(
        group_ids : Array(String),
        identity_store_id : String,
        member_id : Types::MemberId
      ) : Types::IsMemberInGroupsResponse

        input = Types::IsMemberInGroupsRequest.new(group_ids: group_ids, identity_store_id: identity_store_id, member_id: member_id)
        is_member_in_groups(input)
      end

      def is_member_in_groups(input : Types::IsMemberInGroupsRequest) : Types::IsMemberInGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::IS_MEMBER_IN_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IsMemberInGroupsResponse, "IsMemberInGroups")
      end

      # For the specified group in the specified identity store, returns the list of all GroupMembership
      # objects and returns results in paginated form. If you have access to a member account, you can use
      # this API operation from the member account. For more information, see Limiting access to the
      # identity store from member accounts in the IAM Identity Center User Guide .

      def list_group_memberships(
        group_id : String,
        identity_store_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupMembershipsResponse

        input = Types::ListGroupMembershipsRequest.new(group_id: group_id, identity_store_id: identity_store_id, max_results: max_results, next_token: next_token)
        list_group_memberships(input)
      end

      def list_group_memberships(input : Types::ListGroupMembershipsRequest) : Types::ListGroupMembershipsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUP_MEMBERSHIPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupMembershipsResponse, "ListGroupMemberships")
      end

      # For the specified member in the specified identity store, returns the list of all GroupMembership
      # objects and returns results in paginated form. If you have access to a member account, you can use
      # this API operation from the member account. For more information, see Limiting access to the
      # identity store from member accounts in the IAM Identity Center User Guide .

      def list_group_memberships_for_member(
        identity_store_id : String,
        member_id : Types::MemberId,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupMembershipsForMemberResponse

        input = Types::ListGroupMembershipsForMemberRequest.new(identity_store_id: identity_store_id, member_id: member_id, max_results: max_results, next_token: next_token)
        list_group_memberships_for_member(input)
      end

      def list_group_memberships_for_member(input : Types::ListGroupMembershipsForMemberRequest) : Types::ListGroupMembershipsForMemberResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUP_MEMBERSHIPS_FOR_MEMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupMembershipsForMemberResponse, "ListGroupMembershipsForMember")
      end

      # Lists all groups in the identity store. Returns a paginated list of complete Group objects.
      # Filtering for a Group by the DisplayName attribute is deprecated. Instead, use the GetGroupId API
      # action. If you have access to a member account, you can use this API operation from the member
      # account. For more information, see Limiting access to the identity store from member accounts in the
      # IAM Identity Center User Guide .

      def list_groups(
        identity_store_id : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupsResponse

        input = Types::ListGroupsRequest.new(identity_store_id: identity_store_id, filters: filters, max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Types::ListGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupsResponse, "ListGroups")
      end

      # Lists all users in the identity store. Returns a paginated list of complete User objects. Filtering
      # for a User by the UserName attribute is deprecated. Instead, use the GetUserId API action. If you
      # have access to a member account, you can use this API operation from the member account. For more
      # information, see Limiting access to the identity store from member accounts in the IAM Identity
      # Center User Guide .

      def list_users(
        identity_store_id : String,
        extensions : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsersResponse

        input = Types::ListUsersRequest.new(identity_store_id: identity_store_id, extensions: extensions, filters: filters, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # Updates the specified group metadata and attributes in the specified identity store.

      def update_group(
        group_id : String,
        identity_store_id : String,
        operations : Array(Types::AttributeOperation)
      ) : Types::UpdateGroupResponse

        input = Types::UpdateGroupRequest.new(group_id: group_id, identity_store_id: identity_store_id, operations: operations)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Types::UpdateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGroupResponse, "UpdateGroup")
      end

      # Updates the specified user metadata and attributes in the specified identity store.

      def update_user(
        identity_store_id : String,
        operations : Array(Types::AttributeOperation),
        user_id : String
      ) : Types::UpdateUserResponse

        input = Types::UpdateUserRequest.new(identity_store_id: identity_store_id, operations: operations, user_id: user_id)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Types::UpdateUserResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserResponse, "UpdateUser")
      end
    end
  end
end
