module Aws
  module DirectoryServiceData
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

      # Adds an existing user, group, or computer as a group member.

      def add_group_member(
        directory_id : String,
        group_name : String,
        member_name : String,
        client_token : String? = nil,
        member_realm : String? = nil
      ) : Protocol::Request
        input = Types::AddGroupMemberRequest.new(directory_id: directory_id, group_name: group_name, member_name: member_name, client_token: client_token, member_realm: member_realm)
        add_group_member(input)
      end

      def add_group_member(input : Types::AddGroupMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_GROUP_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new group.

      def create_group(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil,
        group_scope : String? = nil,
        group_type : String? = nil,
        other_attributes : Hash(String, Types::AttributeValue)? = nil
      ) : Protocol::Request
        input = Types::CreateGroupRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token, group_scope: group_scope, group_type: group_type, other_attributes: other_attributes)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new user.

      def create_user(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil,
        email_address : String? = nil,
        given_name : String? = nil,
        other_attributes : Hash(String, Types::AttributeValue)? = nil,
        surname : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token, email_address: email_address, given_name: given_name, other_attributes: other_attributes, surname: surname)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group.

      def delete_group(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user.

      def delete_user(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific group.

      def describe_group(
        directory_id : String,
        sam_account_name : String,
        other_attributes : Array(String)? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::DescribeGroupRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, other_attributes: other_attributes, realm: realm)
        describe_group(input)
      end

      def describe_group(input : Types::DescribeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific user.

      def describe_user(
        directory_id : String,
        sam_account_name : String,
        other_attributes : Array(String)? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::DescribeUserRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, other_attributes: other_attributes, realm: realm)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deactivates an active user account. For information about how to enable an inactive user account,
      # see ResetUserPassword in the Directory Service API Reference .

      def disable_user(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisableUserRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token)
        disable_user(input)
      end

      def disable_user(input : Types::DisableUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns member information for the specified group. This operation supports pagination with the use
      # of the NextToken request and response parameters. If more results are available, the
      # ListGroupMembers.NextToken member contains a token that you pass in the next call to
      # ListGroupMembers . This retrieves the next set of items. You can also specify a maximum number of
      # return results with the MaxResults parameter.

      def list_group_members(
        directory_id : String,
        sam_account_name : String,
        max_results : Int32? = nil,
        member_realm : String? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupMembersRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, max_results: max_results, member_realm: member_realm, next_token: next_token, realm: realm)
        list_group_members(input)
      end

      def list_group_members(input : Types::ListGroupMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns group information for the specified directory. This operation supports pagination with the
      # use of the NextToken request and response parameters. If more results are available, the
      # ListGroups.NextToken member contains a token that you pass in the next call to ListGroups . This
      # retrieves the next set of items. You can also specify a maximum number of return results with the
      # MaxResults parameter.

      def list_groups(
        directory_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsRequest.new(directory_id: directory_id, max_results: max_results, next_token: next_token, realm: realm)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns group information for the specified member. This operation supports pagination with the use
      # of the NextToken request and response parameters. If more results are available, the
      # ListGroupsForMember.NextToken member contains a token that you pass in the next call to
      # ListGroupsForMember . This retrieves the next set of items. You can also specify a maximum number of
      # return results with the MaxResults parameter.

      def list_groups_for_member(
        directory_id : String,
        sam_account_name : String,
        max_results : Int32? = nil,
        member_realm : String? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsForMemberRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, max_results: max_results, member_realm: member_realm, next_token: next_token, realm: realm)
        list_groups_for_member(input)
      end

      def list_groups_for_member(input : Types::ListGroupsForMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS_FOR_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns user information for the specified directory. This operation supports pagination with the
      # use of the NextToken request and response parameters. If more results are available, the
      # ListUsers.NextToken member contains a token that you pass in the next call to ListUsers . This
      # retrieves the next set of items. You can also specify a maximum number of return results with the
      # MaxResults parameter.

      def list_users(
        directory_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(directory_id: directory_id, max_results: max_results, next_token: next_token, realm: realm)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a member from a group.

      def remove_group_member(
        directory_id : String,
        group_name : String,
        member_name : String,
        client_token : String? = nil,
        member_realm : String? = nil
      ) : Protocol::Request
        input = Types::RemoveGroupMemberRequest.new(directory_id: directory_id, group_name: group_name, member_name: member_name, client_token: client_token, member_realm: member_realm)
        remove_group_member(input)
      end

      def remove_group_member(input : Types::RemoveGroupMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_GROUP_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the specified directory for a group. You can find groups that match the SearchString
      # parameter with the value of their attributes included in the SearchString parameter. This operation
      # supports pagination with the use of the NextToken request and response parameters. If more results
      # are available, the SearchGroups.NextToken member contains a token that you pass in the next call to
      # SearchGroups . This retrieves the next set of items. You can also specify a maximum number of return
      # results with the MaxResults parameter.

      def search_groups(
        directory_id : String,
        search_attributes : Array(String),
        search_string : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::SearchGroupsRequest.new(directory_id: directory_id, search_attributes: search_attributes, search_string: search_string, max_results: max_results, next_token: next_token, realm: realm)
        search_groups(input)
      end

      def search_groups(input : Types::SearchGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the specified directory for a user. You can find users that match the SearchString
      # parameter with the value of their attributes included in the SearchString parameter. This operation
      # supports pagination with the use of the NextToken request and response parameters. If more results
      # are available, the SearchUsers.NextToken member contains a token that you pass in the next call to
      # SearchUsers . This retrieves the next set of items. You can also specify a maximum number of return
      # results with the MaxResults parameter.

      def search_users(
        directory_id : String,
        search_attributes : Array(String),
        search_string : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::SearchUsersRequest.new(directory_id: directory_id, search_attributes: search_attributes, search_string: search_string, max_results: max_results, next_token: next_token, realm: realm)
        search_users(input)
      end

      def search_users(input : Types::SearchUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates group information.

      def update_group(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil,
        group_scope : String? = nil,
        group_type : String? = nil,
        other_attributes : Hash(String, Types::AttributeValue)? = nil,
        update_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token, group_scope: group_scope, group_type: group_type, other_attributes: other_attributes, update_type: update_type)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates user information.

      def update_user(
        directory_id : String,
        sam_account_name : String,
        client_token : String? = nil,
        email_address : String? = nil,
        given_name : String? = nil,
        other_attributes : Hash(String, Types::AttributeValue)? = nil,
        surname : String? = nil,
        update_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(directory_id: directory_id, sam_account_name: sam_account_name, client_token: client_token, email_address: email_address, given_name: given_name, other_attributes: other_attributes, surname: surname, update_type: update_type)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
