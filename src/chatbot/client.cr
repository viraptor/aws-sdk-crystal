module Aws
  module Chatbot
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

      # Links a resource (for example, a custom action) to a channel configuration.

      def associate_to_configuration(
        chat_configuration : String,
        resource : String
      ) : Protocol::Request
        input = Types::AssociateToConfigurationRequest.new(chat_configuration: chat_configuration, resource: resource)
        associate_to_configuration(input)
      end

      def associate_to_configuration(input : Types::AssociateToConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TO_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS Chatbot configuration for Amazon Chime.

      def create_chime_webhook_configuration(
        configuration_name : String,
        iam_role_arn : String,
        sns_topic_arns : Array(String),
        webhook_description : String,
        webhook_url : String,
        logging_level : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateChimeWebhookConfigurationRequest.new(configuration_name: configuration_name, iam_role_arn: iam_role_arn, sns_topic_arns: sns_topic_arns, webhook_description: webhook_description, webhook_url: webhook_url, logging_level: logging_level, tags: tags)
        create_chime_webhook_configuration(input)
      end

      def create_chime_webhook_configuration(input : Types::CreateChimeWebhookConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHIME_WEBHOOK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom action that can be invoked as an alias or as a button on a notification.

      def create_custom_action(
        action_name : String,
        definition : Types::CustomActionDefinition,
        alias_name : String? = nil,
        attachments : Array(Types::CustomActionAttachment)? = nil,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomActionRequest.new(action_name: action_name, definition: definition, alias_name: alias_name, attachments: attachments, client_token: client_token, tags: tags)
        create_custom_action(input)
      end

      def create_custom_action(input : Types::CreateCustomActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS Chatbot configuration for Microsoft Teams.

      def create_microsoft_teams_channel_configuration(
        channel_id : String,
        configuration_name : String,
        iam_role_arn : String,
        team_id : String,
        tenant_id : String,
        channel_name : String? = nil,
        guardrail_policy_arns : Array(String)? = nil,
        logging_level : String? = nil,
        sns_topic_arns : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        team_name : String? = nil,
        user_authorization_required : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateTeamsChannelConfigurationRequest.new(channel_id: channel_id, configuration_name: configuration_name, iam_role_arn: iam_role_arn, team_id: team_id, tenant_id: tenant_id, channel_name: channel_name, guardrail_policy_arns: guardrail_policy_arns, logging_level: logging_level, sns_topic_arns: sns_topic_arns, tags: tags, team_name: team_name, user_authorization_required: user_authorization_required)
        create_microsoft_teams_channel_configuration(input)
      end

      def create_microsoft_teams_channel_configuration(input : Types::CreateTeamsChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS Chatbot confugration for Slack.

      def create_slack_channel_configuration(
        configuration_name : String,
        iam_role_arn : String,
        slack_channel_id : String,
        slack_team_id : String,
        guardrail_policy_arns : Array(String)? = nil,
        logging_level : String? = nil,
        slack_channel_name : String? = nil,
        sns_topic_arns : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        user_authorization_required : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateSlackChannelConfigurationRequest.new(configuration_name: configuration_name, iam_role_arn: iam_role_arn, slack_channel_id: slack_channel_id, slack_team_id: slack_team_id, guardrail_policy_arns: guardrail_policy_arns, logging_level: logging_level, slack_channel_name: slack_channel_name, sns_topic_arns: sns_topic_arns, tags: tags, user_authorization_required: user_authorization_required)
        create_slack_channel_configuration(input)
      end

      def create_slack_channel_configuration(input : Types::CreateSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Amazon Chime webhook configuration for AWS Chatbot.

      def delete_chime_webhook_configuration(
        chat_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteChimeWebhookConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn)
        delete_chime_webhook_configuration(input)
      end

      def delete_chime_webhook_configuration(input : Types::DeleteChimeWebhookConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHIME_WEBHOOK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom action.

      def delete_custom_action(
        custom_action_arn : String
      ) : Protocol::Request
        input = Types::DeleteCustomActionRequest.new(custom_action_arn: custom_action_arn)
        delete_custom_action(input)
      end

      def delete_custom_action(input : Types::DeleteCustomActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Microsoft Teams channel configuration for AWS Chatbot

      def delete_microsoft_teams_channel_configuration(
        chat_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteTeamsChannelConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn)
        delete_microsoft_teams_channel_configuration(input)
      end

      def delete_microsoft_teams_channel_configuration(input : Types::DeleteTeamsChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Microsoft Teams team authorization allowing for channels to be configured in that
      # Microsoft Teams team. Note that the Microsoft Teams team must have no channels configured to remove
      # it.

      def delete_microsoft_teams_configured_team(
        team_id : String
      ) : Protocol::Request
        input = Types::DeleteTeamsConfiguredTeamRequest.new(team_id: team_id)
        delete_microsoft_teams_configured_team(input)
      end

      def delete_microsoft_teams_configured_team(input : Types::DeleteTeamsConfiguredTeamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MICROSOFT_TEAMS_CONFIGURED_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Identifes a user level permission for a channel configuration.

      def delete_microsoft_teams_user_identity(
        chat_configuration_arn : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteMicrosoftTeamsUserIdentityRequest.new(chat_configuration_arn: chat_configuration_arn, user_id: user_id)
        delete_microsoft_teams_user_identity(input)
      end

      def delete_microsoft_teams_user_identity(input : Types::DeleteMicrosoftTeamsUserIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MICROSOFT_TEAMS_USER_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Slack channel configuration for AWS Chatbot

      def delete_slack_channel_configuration(
        chat_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteSlackChannelConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn)
        delete_slack_channel_configuration(input)
      end

      def delete_slack_channel_configuration(input : Types::DeleteSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user level permission for a Slack channel configuration.

      def delete_slack_user_identity(
        chat_configuration_arn : String,
        slack_team_id : String,
        slack_user_id : String
      ) : Protocol::Request
        input = Types::DeleteSlackUserIdentityRequest.new(chat_configuration_arn: chat_configuration_arn, slack_team_id: slack_team_id, slack_user_id: slack_user_id)
        delete_slack_user_identity(input)
      end

      def delete_slack_user_identity(input : Types::DeleteSlackUserIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLACK_USER_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Slack workspace authorization that allows channels to be configured in that workspace.
      # This requires all configured channels in the workspace to be deleted.

      def delete_slack_workspace_authorization(
        slack_team_id : String
      ) : Protocol::Request
        input = Types::DeleteSlackWorkspaceAuthorizationRequest.new(slack_team_id: slack_team_id)
        delete_slack_workspace_authorization(input)
      end

      def delete_slack_workspace_authorization(input : Types::DeleteSlackWorkspaceAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SLACK_WORKSPACE_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Chime webhook configurations optionally filtered by ChatConfigurationArn

      def describe_chime_webhook_configurations(
        chat_configuration_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeChimeWebhookConfigurationsRequest.new(chat_configuration_arn: chat_configuration_arn, max_results: max_results, next_token: next_token)
        describe_chime_webhook_configurations(input)
      end

      def describe_chime_webhook_configurations(input : Types::DescribeChimeWebhookConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHIME_WEBHOOK_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Slack channel configurations optionally filtered by ChatConfigurationArn

      def describe_slack_channel_configurations(
        chat_configuration_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSlackChannelConfigurationsRequest.new(chat_configuration_arn: chat_configuration_arn, max_results: max_results, next_token: next_token)
        describe_slack_channel_configurations(input)
      end

      def describe_slack_channel_configurations(input : Types::DescribeSlackChannelConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SLACK_CHANNEL_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Slack user identities with a mapped role.

      def describe_slack_user_identities(
        chat_configuration_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSlackUserIdentitiesRequest.new(chat_configuration_arn: chat_configuration_arn, max_results: max_results, next_token: next_token)
        describe_slack_user_identities(input)
      end

      def describe_slack_user_identities(input : Types::DescribeSlackUserIdentitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SLACK_USER_IDENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all authorized Slack workspaces connected to the AWS Account onboarded with AWS Chatbot.

      def describe_slack_workspaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSlackWorkspacesRequest.new(max_results: max_results, next_token: next_token)
        describe_slack_workspaces(input)
      end

      def describe_slack_workspaces(input : Types::DescribeSlackWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SLACK_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unlink a resource, for example a custom action, from a channel configuration.

      def disassociate_from_configuration(
        chat_configuration : String,
        resource : String
      ) : Protocol::Request
        input = Types::DisassociateFromConfigurationRequest.new(chat_configuration: chat_configuration, resource: resource)
        disassociate_from_configuration(input)
      end

      def disassociate_from_configuration(input : Types::DisassociateFromConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns AWS Chatbot account preferences.

      def get_account_preferences : Protocol::Request
        input = Types::GetAccountPreferencesRequest.new
        get_account_preferences(input)
      end

      def get_account_preferences(input : Types::GetAccountPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a custom action.

      def get_custom_action(
        custom_action_arn : String
      ) : Protocol::Request
        input = Types::GetCustomActionRequest.new(custom_action_arn: custom_action_arn)
        get_custom_action(input)
      end

      def get_custom_action(input : Types::GetCustomActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a Microsoft Teams channel configuration in an AWS account.

      def get_microsoft_teams_channel_configuration(
        chat_configuration_arn : String
      ) : Protocol::Request
        input = Types::GetTeamsChannelConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn)
        get_microsoft_teams_channel_configuration(input)
      end

      def get_microsoft_teams_channel_configuration(input : Types::GetTeamsChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists resources associated with a channel configuration.

      def list_associations(
        chat_configuration : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociationsRequest.new(chat_configuration: chat_configuration, max_results: max_results, next_token: next_token)
        list_associations(input)
      end

      def list_associations(input : Types::ListAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists custom actions defined in this account.

      def list_custom_actions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomActionsRequest.new(max_results: max_results, next_token: next_token)
        list_custom_actions(input)
      end

      def list_custom_actions(input : Types::ListCustomActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all AWS Chatbot Microsoft Teams channel configurations in an AWS account.

      def list_microsoft_teams_channel_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        team_id : String? = nil
      ) : Protocol::Request
        input = Types::ListTeamsChannelConfigurationsRequest.new(max_results: max_results, next_token: next_token, team_id: team_id)
        list_microsoft_teams_channel_configurations(input)
      end

      def list_microsoft_teams_channel_configurations(input : Types::ListTeamsChannelConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MICROSOFT_TEAMS_CHANNEL_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all authorized Microsoft Teams for an AWS Account

      def list_microsoft_teams_configured_teams(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMicrosoftTeamsConfiguredTeamsRequest.new(max_results: max_results, next_token: next_token)
        list_microsoft_teams_configured_teams(input)
      end

      def list_microsoft_teams_configured_teams(input : Types::ListMicrosoftTeamsConfiguredTeamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MICROSOFT_TEAMS_CONFIGURED_TEAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list all Microsoft Teams user identities with a mapped role.

      def list_microsoft_teams_user_identities(
        chat_configuration_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMicrosoftTeamsUserIdentitiesRequest.new(chat_configuration_arn: chat_configuration_arn, max_results: max_results, next_token: next_token)
        list_microsoft_teams_user_identities(input)
      end

      def list_microsoft_teams_user_identities(input : Types::ListMicrosoftTeamsUserIdentitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MICROSOFT_TEAMS_USER_IDENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The resource
      # can be a user, server, or role.

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

      # Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources
      # are users, servers, roles, and other entities.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN).
      # Resources are users, servers, roles, and other entities.

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

      # Updates AWS Chatbot account preferences.

      def update_account_preferences(
        training_data_collection_enabled : Bool? = nil,
        user_authorization_required : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountPreferencesRequest.new(training_data_collection_enabled: training_data_collection_enabled, user_authorization_required: user_authorization_required)
        update_account_preferences(input)
      end

      def update_account_preferences(input : Types::UpdateAccountPreferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_PREFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Amazon Chime webhook configuration.

      def update_chime_webhook_configuration(
        chat_configuration_arn : String,
        iam_role_arn : String? = nil,
        logging_level : String? = nil,
        sns_topic_arns : Array(String)? = nil,
        webhook_description : String? = nil,
        webhook_url : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChimeWebhookConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn, iam_role_arn: iam_role_arn, logging_level: logging_level, sns_topic_arns: sns_topic_arns, webhook_description: webhook_description, webhook_url: webhook_url)
        update_chime_webhook_configuration(input)
      end

      def update_chime_webhook_configuration(input : Types::UpdateChimeWebhookConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHIME_WEBHOOK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom action.

      def update_custom_action(
        custom_action_arn : String,
        definition : Types::CustomActionDefinition,
        alias_name : String? = nil,
        attachments : Array(Types::CustomActionAttachment)? = nil
      ) : Protocol::Request
        input = Types::UpdateCustomActionRequest.new(custom_action_arn: custom_action_arn, definition: definition, alias_name: alias_name, attachments: attachments)
        update_custom_action(input)
      end

      def update_custom_action(input : Types::UpdateCustomActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Microsoft Teams channel configuration.

      def update_microsoft_teams_channel_configuration(
        channel_id : String,
        chat_configuration_arn : String,
        channel_name : String? = nil,
        guardrail_policy_arns : Array(String)? = nil,
        iam_role_arn : String? = nil,
        logging_level : String? = nil,
        sns_topic_arns : Array(String)? = nil,
        user_authorization_required : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateTeamsChannelConfigurationRequest.new(channel_id: channel_id, chat_configuration_arn: chat_configuration_arn, channel_name: channel_name, guardrail_policy_arns: guardrail_policy_arns, iam_role_arn: iam_role_arn, logging_level: logging_level, sns_topic_arns: sns_topic_arns, user_authorization_required: user_authorization_required)
        update_microsoft_teams_channel_configuration(input)
      end

      def update_microsoft_teams_channel_configuration(input : Types::UpdateTeamsChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Slack channel configuration.

      def update_slack_channel_configuration(
        chat_configuration_arn : String,
        slack_channel_id : String,
        guardrail_policy_arns : Array(String)? = nil,
        iam_role_arn : String? = nil,
        logging_level : String? = nil,
        slack_channel_name : String? = nil,
        sns_topic_arns : Array(String)? = nil,
        user_authorization_required : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateSlackChannelConfigurationRequest.new(chat_configuration_arn: chat_configuration_arn, slack_channel_id: slack_channel_id, guardrail_policy_arns: guardrail_policy_arns, iam_role_arn: iam_role_arn, logging_level: logging_level, slack_channel_name: slack_channel_name, sns_topic_arns: sns_topic_arns, user_authorization_required: user_authorization_required)
        update_slack_channel_configuration(input)
      end

      def update_slack_channel_configuration(input : Types::UpdateSlackChannelConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SLACK_CHANNEL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
