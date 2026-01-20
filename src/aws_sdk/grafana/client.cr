module AwsSdk
  module Grafana
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

      # Assigns a Grafana Enterprise license to a workspace. To upgrade, you must use ENTERPRISE for the
      # licenseType , and pass in a valid Grafana Labs token for the grafanaToken . Upgrading to Grafana
      # Enterprise incurs additional fees. For more information, see Upgrade a workspace to Grafana
      # Enterprise .

      def associate_license(
        license_type : String,
        workspace_id : String,
        grafana_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateLicenseRequest.new(license_type: license_type, workspace_id: workspace_id, grafana_token: grafana_token)
        associate_license(input)
      end

      def associate_license(input : Types::AssociateLicenseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LICENSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a workspace . In a workspace, you can create Grafana dashboards and visualizations to
      # analyze your metrics, logs, and traces. You don't have to build, package, or deploy any hardware to
      # run the Grafana server. Don't use CreateWorkspace to modify an existing workspace. Instead, use
      # UpdateWorkspace .

      def create_workspace(
        account_access_type : String,
        authentication_providers : Array(String),
        permission_type : String,
        client_token : String? = nil,
        configuration : String? = nil,
        grafana_version : String? = nil,
        network_access_control : Types::NetworkAccessConfiguration? = nil,
        organization_role_name : String? = nil,
        stack_set_name : String? = nil,
        tags : Hash(String, String)? = nil,
        vpc_configuration : Types::VpcConfiguration? = nil,
        workspace_data_sources : Array(String)? = nil,
        workspace_description : String? = nil,
        workspace_name : String? = nil,
        workspace_notification_destinations : Array(String)? = nil,
        workspace_organizational_units : Array(String)? = nil,
        workspace_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkspaceRequest.new(account_access_type: account_access_type, authentication_providers: authentication_providers, permission_type: permission_type, client_token: client_token, configuration: configuration, grafana_version: grafana_version, network_access_control: network_access_control, organization_role_name: organization_role_name, stack_set_name: stack_set_name, tags: tags, vpc_configuration: vpc_configuration, workspace_data_sources: workspace_data_sources, workspace_description: workspace_description, workspace_name: workspace_name, workspace_notification_destinations: workspace_notification_destinations, workspace_organizational_units: workspace_organizational_units, workspace_role_arn: workspace_role_arn)
        create_workspace(input)
      end

      def create_workspace(input : Types::CreateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Grafana API key for the workspace. This key can be used to authenticate requests sent to
      # the workspace's HTTP API. See
      # https://docs.aws.amazon.com/grafana/latest/userguide/Using-Grafana-APIs.html for available APIs and
      # example requests. In workspaces compatible with Grafana version 9 or above, use workspace service
      # accounts instead of API keys. API keys will be removed in a future release.

      def create_workspace_api_key(
        key_name : String,
        key_role : String,
        seconds_to_live : Int32,
        workspace_id : String
      ) : Protocol::Request
        input = Types::CreateWorkspaceApiKeyRequest.new(key_name: key_name, key_role: key_role, seconds_to_live: seconds_to_live, workspace_id: workspace_id)
        create_workspace_api_key(input)
      end

      def create_workspace_api_key(input : Types::CreateWorkspaceApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service account for the workspace. A service account can be used to call Grafana HTTP
      # APIs, and run automated workloads. After creating the service account with the correct GrafanaRole
      # for your use case, use CreateWorkspaceServiceAccountToken to create a token that can be used to
      # authenticate and authorize Grafana HTTP API calls. You can only create service accounts for
      # workspaces that are compatible with Grafana version 9 and above. For more information about service
      # accounts, see Service accounts in the Amazon Managed Grafana User Guide . For more information about
      # the Grafana HTTP APIs, see Using Grafana HTTP APIs in the Amazon Managed Grafana User Guide .

      def create_workspace_service_account(
        grafana_role : String,
        name : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::CreateWorkspaceServiceAccountRequest.new(grafana_role: grafana_role, name: name, workspace_id: workspace_id)
        create_workspace_service_account(input)
      end

      def create_workspace_service_account(input : Types::CreateWorkspaceServiceAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE_SERVICE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a token that can be used to authenticate and authorize Grafana HTTP API operations for the
      # given workspace service account . The service account acts as a user for the API operations, and
      # defines the permissions that are used by the API. When you create the service account token, you
      # will receive a key that is used when calling Grafana APIs. Do not lose this key, as it will not be
      # retrievable again. If you do lose the key, you can delete the token and recreate it to receive a new
      # key. This will disable the initial key. Service accounts are only available for workspaces that are
      # compatible with Grafana version 9 and above.

      def create_workspace_service_account_token(
        name : String,
        seconds_to_live : Int32,
        service_account_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::CreateWorkspaceServiceAccountTokenRequest.new(name: name, seconds_to_live: seconds_to_live, service_account_id: service_account_id, workspace_id: workspace_id)
        create_workspace_service_account_token(input)
      end

      def create_workspace_service_account_token(input : Types::CreateWorkspaceServiceAccountTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE_SERVICE_ACCOUNT_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Managed Grafana workspace.

      def delete_workspace(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceRequest.new(workspace_id: workspace_id)
        delete_workspace(input)
      end

      def delete_workspace(input : Types::DeleteWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Grafana API key for the workspace. In workspaces compatible with Grafana version 9 or
      # above, use workspace service accounts instead of API keys. API keys will be removed in a future
      # release.

      def delete_workspace_api_key(
        key_name : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceApiKeyRequest.new(key_name: key_name, workspace_id: workspace_id)
        delete_workspace_api_key(input)
      end

      def delete_workspace_api_key(input : Types::DeleteWorkspaceApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workspace service account from the workspace. This will delete any tokens created for the
      # service account, as well. If the tokens are currently in use, the will fail to authenticate /
      # authorize after they are deleted. Service accounts are only available for workspaces that are
      # compatible with Grafana version 9 and above.

      def delete_workspace_service_account(
        service_account_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceServiceAccountRequest.new(service_account_id: service_account_id, workspace_id: workspace_id)
        delete_workspace_service_account(input)
      end

      def delete_workspace_service_account(input : Types::DeleteWorkspaceServiceAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE_SERVICE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a token for the workspace service account. This will disable the key associated with the
      # token. If any automation is currently using the key, it will no longer be authenticated or
      # authorized to perform actions with the Grafana HTTP APIs. Service accounts are only available for
      # workspaces that are compatible with Grafana version 9 and above.

      def delete_workspace_service_account_token(
        service_account_id : String,
        token_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceServiceAccountTokenRequest.new(service_account_id: service_account_id, token_id: token_id, workspace_id: workspace_id)
        delete_workspace_service_account_token(input)
      end

      def delete_workspace_service_account_token(input : Types::DeleteWorkspaceServiceAccountTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE_SERVICE_ACCOUNT_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays information about one Amazon Managed Grafana workspace.

      def describe_workspace(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceRequest.new(workspace_id: workspace_id)
        describe_workspace(input)
      end

      def describe_workspace(input : Types::DescribeWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays information about the authentication methods used in one Amazon Managed Grafana workspace.

      def describe_workspace_authentication(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceAuthenticationRequest.new(workspace_id: workspace_id)
        describe_workspace_authentication(input)
      end

      def describe_workspace_authentication(input : Types::DescribeWorkspaceAuthenticationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE_AUTHENTICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the current configuration string for the given workspace.

      def describe_workspace_configuration(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceConfigurationRequest.new(workspace_id: workspace_id)
        describe_workspace_configuration(input)
      end

      def describe_workspace_configuration(input : Types::DescribeWorkspaceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the Grafana Enterprise license from a workspace.

      def disassociate_license(
        license_type : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DisassociateLicenseRequest.new(license_type: license_type, workspace_id: workspace_id)
        disassociate_license(input)
      end

      def disassociate_license(input : Types::DisassociateLicenseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LICENSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the users and groups who have the Grafana Admin and Editor roles in this workspace. If you use
      # this operation without specifying userId or groupId , the operation returns the roles of all users
      # and groups. If you specify a userId or a groupId , only the roles for that user or group are
      # returned. If you do this, you can specify only one userId or one groupId .

      def list_permissions(
        workspace_id : String,
        group_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil,
        user_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionsRequest.new(workspace_id: workspace_id, group_id: group_id, max_results: max_results, next_token: next_token, user_id: user_id, user_type: user_type)
        list_permissions(input)
      end

      def list_permissions(input : Types::ListPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The ListTagsForResource operation returns the tags that are associated with the Amazon Managed
      # Service for Grafana resource specified by the resourceArn . Currently, the only resource that can be
      # tagged is a workspace.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists available versions of Grafana. These are available when calling CreateWorkspace . Optionally,
      # include a workspace to list the versions to which it can be upgraded.

      def list_versions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        workspace_id : String? = nil
      ) : Protocol::Request
        input = Types::ListVersionsRequest.new(max_results: max_results, next_token: next_token, workspace_id: workspace_id)
        list_versions(input)
      end

      def list_versions(input : Types::ListVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tokens for a workspace service account. This does not return the key for each
      # token. You cannot access keys after they are created. To create a new key, delete the token and
      # recreate it. Service accounts are only available for workspaces that are compatible with Grafana
      # version 9 and above.

      def list_workspace_service_account_tokens(
        service_account_id : String,
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspaceServiceAccountTokensRequest.new(service_account_id: service_account_id, workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        list_workspace_service_account_tokens(input)
      end

      def list_workspace_service_account_tokens(input : Types::ListWorkspaceServiceAccountTokensRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACE_SERVICE_ACCOUNT_TOKENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of service accounts for a workspace. Service accounts are only available for
      # workspaces that are compatible with Grafana version 9 and above.

      def list_workspace_service_accounts(
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspaceServiceAccountsRequest.new(workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        list_workspace_service_accounts(input)
      end

      def list_workspace_service_accounts(input : Types::ListWorkspaceServiceAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACE_SERVICE_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Amazon Managed Grafana workspaces in the account, with some information about each
      # workspace. For more complete information about one workspace, use DescribeWorkspace .

      def list_workspaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspacesRequest.new(max_results: max_results, next_token: next_token)
        list_workspaces(input)
      end

      def list_workspaces(input : Types::ListWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The TagResource operation associates tags with an Amazon Managed Grafana resource. Currently, the
      # only resource that can be tagged is workspaces. If you specify a new tag key for the resource, this
      # tag is appended to the list of tags associated with the resource. If you specify a tag key that is
      # already associated with the resource, the new tag value that you specify replaces the previous value
      # for that tag.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The UntagResource operation removes the association of the tag with the Amazon Managed Grafana
      # resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates which users in a workspace have the Grafana Admin or Editor roles.

      def update_permissions(
        update_instruction_batch : Array(Types::UpdateInstruction),
        workspace_id : String
      ) : Protocol::Request
        input = Types::UpdatePermissionsRequest.new(update_instruction_batch: update_instruction_batch, workspace_id: workspace_id)
        update_permissions(input)
      end

      def update_permissions(input : Types::UpdatePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies an existing Amazon Managed Grafana workspace. If you use this operation and omit any
      # optional parameters, the existing values of those parameters are not changed. To modify the user
      # authentication methods that the workspace uses, such as SAML or IAM Identity Center, use
      # UpdateWorkspaceAuthentication . To modify which users in the workspace have the Admin and Editor
      # Grafana roles, use UpdatePermissions .

      def update_workspace(
        workspace_id : String,
        account_access_type : String? = nil,
        network_access_control : Types::NetworkAccessConfiguration? = nil,
        organization_role_name : String? = nil,
        permission_type : String? = nil,
        remove_network_access_configuration : Bool? = nil,
        remove_vpc_configuration : Bool? = nil,
        stack_set_name : String? = nil,
        vpc_configuration : Types::VpcConfiguration? = nil,
        workspace_data_sources : Array(String)? = nil,
        workspace_description : String? = nil,
        workspace_name : String? = nil,
        workspace_notification_destinations : Array(String)? = nil,
        workspace_organizational_units : Array(String)? = nil,
        workspace_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceRequest.new(workspace_id: workspace_id, account_access_type: account_access_type, network_access_control: network_access_control, organization_role_name: organization_role_name, permission_type: permission_type, remove_network_access_configuration: remove_network_access_configuration, remove_vpc_configuration: remove_vpc_configuration, stack_set_name: stack_set_name, vpc_configuration: vpc_configuration, workspace_data_sources: workspace_data_sources, workspace_description: workspace_description, workspace_name: workspace_name, workspace_notification_destinations: workspace_notification_destinations, workspace_organizational_units: workspace_organizational_units, workspace_role_arn: workspace_role_arn)
        update_workspace(input)
      end

      def update_workspace(input : Types::UpdateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to define the identity provider (IdP) that this workspace authenticates users
      # from, using SAML. You can also map SAML assertion attributes to workspace user information and
      # define which groups in the assertion attribute are to have the Admin and Editor roles in the
      # workspace. Changes to the authentication method for a workspace may take a few minutes to take
      # effect.

      def update_workspace_authentication(
        authentication_providers : Array(String),
        workspace_id : String,
        saml_configuration : Types::SamlConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceAuthenticationRequest.new(authentication_providers: authentication_providers, workspace_id: workspace_id, saml_configuration: saml_configuration)
        update_workspace_authentication(input)
      end

      def update_workspace_authentication(input : Types::UpdateWorkspaceAuthenticationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_AUTHENTICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration string for the given workspace

      def update_workspace_configuration(
        configuration : String,
        workspace_id : String,
        grafana_version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceConfigurationRequest.new(configuration: configuration, workspace_id: workspace_id, grafana_version: grafana_version)
        update_workspace_configuration(input)
      end

      def update_workspace_configuration(input : Types::UpdateWorkspaceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
