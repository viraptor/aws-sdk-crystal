module Aws
  module SupportApp
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

      # Creates a Slack channel configuration for your Amazon Web Services account. You can add up to 5
      # Slack workspaces for your account. You can add up to 20 Slack channels for your account. A Slack
      # channel can have up to 100 Amazon Web Services accounts. This means that only 100 accounts can add
      # the same Slack channel to the Amazon Web Services Support App. We recommend that you only add the
      # accounts that you need to manage support cases for your organization. This can reduce the
      # notifications about case updates that you receive in the Slack channel. We recommend that you choose
      # a private Slack channel so that only members in that channel have read and write access to your
      # support cases. Anyone in your Slack channel can create, update, or resolve support cases for your
      # account. Users require an invitation to join private channels.

      def create_slack_channel_configuration(
        channel_id : String,
        channel_role_arn : String,
        notify_on_case_severity : String,
        team_id : String,
        channel_name : String? = nil,
        notify_on_add_correspondence_to_case : Bool? = nil,
        notify_on_create_or_reopen_case : Bool? = nil,
        notify_on_resolve_case : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateSlackChannelConfigurationRequest.new(channel_id: channel_id, channel_role_arn: channel_role_arn, notify_on_case_severity: notify_on_case_severity, team_id: team_id, channel_name: channel_name, notify_on_add_correspondence_to_case: notify_on_add_correspondence_to_case, notify_on_create_or_reopen_case: notify_on_create_or_reopen_case, notify_on_resolve_case: notify_on_resolve_case)
        create_slack_channel_configuration(input)
      end

      def create_slack_channel_configuration(input : Types::CreateSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an alias for an Amazon Web Services account ID. The alias appears in the Amazon Web Services
      # Support App page of the Amazon Web Services Support Center. The alias also appears in Slack messages
      # from the Amazon Web Services Support App.

      def delete_account_alias : Protocol::Request
        input = Types::DeleteAccountAliasRequest.new
        delete_account_alias(input)
      end

      def delete_account_alias(input : Types::DeleteAccountAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Slack channel configuration from your Amazon Web Services account. This operation doesn't
      # delete your Slack channel.

      def delete_slack_channel_configuration(
        channel_id : String,
        team_id : String
      ) : Protocol::Request
        input = Types::DeleteSlackChannelConfigurationRequest.new(channel_id: channel_id, team_id: team_id)
        delete_slack_channel_configuration(input)
      end

      def delete_slack_channel_configuration(input : Types::DeleteSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Slack workspace configuration from your Amazon Web Services account. This operation
      # doesn't delete your Slack workspace.

      def delete_slack_workspace_configuration(
        team_id : String
      ) : Protocol::Request
        input = Types::DeleteSlackWorkspaceConfigurationRequest.new(team_id: team_id)
        delete_slack_workspace_configuration(input)
      end

      def delete_slack_workspace_configuration(input : Types::DeleteSlackWorkspaceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLACK_WORKSPACE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the alias from an Amazon Web Services account ID. The alias appears in the Amazon Web
      # Services Support App page of the Amazon Web Services Support Center. The alias also appears in Slack
      # messages from the Amazon Web Services Support App.

      def get_account_alias : Protocol::Request
        input = Types::GetAccountAliasRequest.new
        get_account_alias(input)
      end

      def get_account_alias(input : Types::GetAccountAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Slack channel configurations for an Amazon Web Services account.

      def list_slack_channel_configurations(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSlackChannelConfigurationsRequest.new(next_token: next_token)
        list_slack_channel_configurations(input)
      end

      def list_slack_channel_configurations(input : Types::ListSlackChannelConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SLACK_CHANNEL_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Slack workspace configurations for an Amazon Web Services account.

      def list_slack_workspace_configurations(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSlackWorkspaceConfigurationsRequest.new(next_token: next_token)
        list_slack_workspace_configurations(input)
      end

      def list_slack_workspace_configurations(input : Types::ListSlackWorkspaceConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SLACK_WORKSPACE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates an individual alias for each Amazon Web Services account ID. The alias appears in
      # the Amazon Web Services Support App page of the Amazon Web Services Support Center. The alias also
      # appears in Slack messages from the Amazon Web Services Support App.

      def put_account_alias(
        account_alias : String
      ) : Protocol::Request
        input = Types::PutAccountAliasRequest.new(account_alias: account_alias)
        put_account_alias(input)
      end

      def put_account_alias(input : Types::PutAccountAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a Slack workspace for your Amazon Web Services account. To call this API, your account
      # must be part of an organization in Organizations. If you're the management account and you want to
      # register Slack workspaces for your organization, you must complete the following tasks: Sign in to
      # the Amazon Web Services Support Center and authorize the Slack workspaces where you want your
      # organization to have access to. See Authorize a Slack workspace in the Amazon Web Services Support
      # User Guide . Call the RegisterSlackWorkspaceForOrganization API to authorize each Slack workspace
      # for the organization. After the management account authorizes the Slack workspace, member accounts
      # can call this API to authorize the same Slack workspace for their individual accounts. Member
      # accounts don't need to authorize the Slack workspace manually through the Amazon Web Services
      # Support Center . To use the Amazon Web Services Support App, each account must then complete the
      # following tasks: Create an Identity and Access Management (IAM) role with the required permission.
      # For more information, see Managing access to the Amazon Web Services Support App . Configure a Slack
      # channel to use the Amazon Web Services Support App for support cases for that account. For more
      # information, see Configuring a Slack channel .

      def register_slack_workspace_for_organization(
        team_id : String
      ) : Protocol::Request
        input = Types::RegisterSlackWorkspaceForOrganizationRequest.new(team_id: team_id)
        register_slack_workspace_for_organization(input)
      end

      def register_slack_workspace_for_organization(input : Types::RegisterSlackWorkspaceForOrganizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_SLACK_WORKSPACE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for a Slack channel, such as case update notifications.

      def update_slack_channel_configuration(
        channel_id : String,
        team_id : String,
        channel_name : String? = nil,
        channel_role_arn : String? = nil,
        notify_on_add_correspondence_to_case : Bool? = nil,
        notify_on_case_severity : String? = nil,
        notify_on_create_or_reopen_case : Bool? = nil,
        notify_on_resolve_case : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateSlackChannelConfigurationRequest.new(channel_id: channel_id, team_id: team_id, channel_name: channel_name, channel_role_arn: channel_role_arn, notify_on_add_correspondence_to_case: notify_on_add_correspondence_to_case, notify_on_case_severity: notify_on_case_severity, notify_on_create_or_reopen_case: notify_on_create_or_reopen_case, notify_on_resolve_case: notify_on_resolve_case)
        update_slack_channel_configuration(input)
      end

      def update_slack_channel_configuration(input : Types::UpdateSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
