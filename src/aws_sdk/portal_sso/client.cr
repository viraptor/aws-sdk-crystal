module AwsSdk
  module SSO
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

      # Returns the STS short-term credentials for a given role name that is assigned to the user.
      def get_role_credentials(
        access_token : String,
        account_id : String,
        role_name : String
      ) : Protocol::Request
        input = Types::GetRoleCredentialsRequest.new(access_token: access_token, account_id: account_id, role_name: role_name)
        get_role_credentials(input)
      end
      def get_role_credentials(input : Types::GetRoleCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROLE_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all roles that are assigned to the user for a given AWS account.
      def list_account_roles(
        access_token : String,
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountRolesRequest.new(access_token: access_token, account_id: account_id, max_results: max_results, next_token: next_token)
        list_account_roles(input)
      end
      def list_account_roles(input : Types::ListAccountRolesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_ROLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all AWS accounts assigned to the user. These AWS accounts are assigned by the administrator of
      # the account. For more information, see Assign User Access in the IAM Identity Center User Guide .
      # This operation returns a paginated response.
      def list_accounts(
        access_token : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountsRequest.new(access_token: access_token, max_results: max_results, next_token: next_token)
        list_accounts(input)
      end
      def list_accounts(input : Types::ListAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the locally stored SSO tokens from the client-side cache and sends an API call to the IAM
      # Identity Center service to invalidate the corresponding server-side IAM Identity Center sign in
      # session. If a user uses IAM Identity Center to access the AWS CLI, the user’s IAM Identity Center
      # sign in session is used to obtain an IAM session, as specified in the corresponding IAM Identity
      # Center permission set. More specifically, IAM Identity Center assumes an IAM role in the target
      # account on behalf of the user, and the corresponding temporary AWS credentials are returned to the
      # client. After user logout, any existing IAM role sessions that were created by using IAM Identity
      # Center permission sets continue based on the duration configured in the permission set. For more
      # information, see User authentications in the IAM Identity Center User Guide .
      def logout(
        access_token : String
      ) : Protocol::Request
        input = Types::LogoutRequest.new(access_token: access_token)
        logout(input)
      end
      def logout(input : Types::LogoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LOGOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
