require "json"

module AwsSdk
  module SupportApp
    module Types

      # You don't have sufficient permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request has a conflict. For example, you might receive this error if you try the following:
      # Add, update, or delete a Slack channel configuration before you add a Slack workspace to your Amazon
      # Web Services account. Add a Slack channel configuration that already exists in your Amazon Web
      # Services account. Delete a Slack channel configuration for a live chat channel. Delete a Slack
      # workspace from your Amazon Web Services account that has an active live chat channel. Call the
      # RegisterSlackWorkspaceForOrganization API from an Amazon Web Services account that doesn't belong to
      # an organization. Call the RegisterSlackWorkspaceForOrganization API from a member account, but the
      # management account hasn't registered that workspace yet for the organization.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateSlackChannelConfigurationRequest
        include JSON::Serializable

        # The channel ID in Slack. This ID identifies a channel within a Slack workspace.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The Amazon Resource Name (ARN) of an IAM role that you want to use to perform operations on Amazon
        # Web Services. For more information, see Managing access to the Amazon Web Services Support App in
        # the Amazon Web Services Support User Guide .

        @[JSON::Field(key: "channelRoleArn")]
        getter channel_role_arn : String

        # The case severity for a support case that you want to receive notifications. If you specify high or
        # all , you must specify true for at least one of the following parameters:
        # notifyOnAddCorrespondenceToCase notifyOnCreateOrReopenCase notifyOnResolveCase If you specify none ,
        # the following parameters must be null or false : notifyOnAddCorrespondenceToCase
        # notifyOnCreateOrReopenCase notifyOnResolveCase If you don't specify these parameters in your
        # request, they default to false .

        @[JSON::Field(key: "notifyOnCaseSeverity")]
        getter notify_on_case_severity : String

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        # The name of the Slack channel that you configure for the Amazon Web Services Support App.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # Whether you want to get notified when a support case has a new correspondence.

        @[JSON::Field(key: "notifyOnAddCorrespondenceToCase")]
        getter notify_on_add_correspondence_to_case : Bool?

        # Whether you want to get notified when a support case is created or reopened.

        @[JSON::Field(key: "notifyOnCreateOrReopenCase")]
        getter notify_on_create_or_reopen_case : Bool?

        # Whether you want to get notified when a support case is resolved.

        @[JSON::Field(key: "notifyOnResolveCase")]
        getter notify_on_resolve_case : Bool?

        def initialize(
          @channel_id : String,
          @channel_role_arn : String,
          @notify_on_case_severity : String,
          @team_id : String,
          @channel_name : String? = nil,
          @notify_on_add_correspondence_to_case : Bool? = nil,
          @notify_on_create_or_reopen_case : Bool? = nil,
          @notify_on_resolve_case : Bool? = nil
        )
        end
      end


      struct CreateSlackChannelConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAccountAliasRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAccountAliasResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSlackChannelConfigurationRequest
        include JSON::Serializable

        # The channel ID in Slack. This ID identifies a channel within a Slack workspace.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        def initialize(
          @channel_id : String,
          @team_id : String
        )
        end
      end


      struct DeleteSlackChannelConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSlackWorkspaceConfigurationRequest
        include JSON::Serializable

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        def initialize(
          @team_id : String
        )
        end
      end


      struct DeleteSlackWorkspaceConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountAliasRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountAliasResult
        include JSON::Serializable

        # An alias or short name for an Amazon Web Services account.

        @[JSON::Field(key: "accountAlias")]
        getter account_alias : String?

        def initialize(
          @account_alias : String? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListSlackChannelConfigurationsRequest
        include JSON::Serializable

        # If the results of a search are large, the API only returns a portion of the results and includes a
        # nextToken pagination token in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When the API returns the last set of results, the
        # response doesn't include a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListSlackChannelConfigurationsResult
        include JSON::Serializable

        # The configurations for a Slack channel.

        @[JSON::Field(key: "slackChannelConfigurations")]
        getter slack_channel_configurations : Array(Types::SlackChannelConfiguration)

        # The point where pagination should resume when the response returns only partial results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @slack_channel_configurations : Array(Types::SlackChannelConfiguration),
          @next_token : String? = nil
        )
        end
      end


      struct ListSlackWorkspaceConfigurationsRequest
        include JSON::Serializable

        # If the results of a search are large, the API only returns a portion of the results and includes a
        # nextToken pagination token in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When the API returns the last set of results, the
        # response doesn't include a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListSlackWorkspaceConfigurationsResult
        include JSON::Serializable

        # The point where pagination should resume when the response returns only partial results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The configurations for a Slack workspace.

        @[JSON::Field(key: "slackWorkspaceConfigurations")]
        getter slack_workspace_configurations : Array(Types::SlackWorkspaceConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @slack_workspace_configurations : Array(Types::SlackWorkspaceConfiguration)? = nil
        )
        end
      end


      struct PutAccountAliasRequest
        include JSON::Serializable

        # An alias or short name for an Amazon Web Services account.

        @[JSON::Field(key: "accountAlias")]
        getter account_alias : String

        def initialize(
          @account_alias : String
        )
        end
      end


      struct PutAccountAliasResult
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterSlackWorkspaceForOrganizationRequest
        include JSON::Serializable

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG . Specify
        # the Slack workspace that you want to use for your organization.

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        def initialize(
          @team_id : String
        )
        end
      end


      struct RegisterSlackWorkspaceForOrganizationResult
        include JSON::Serializable

        # Whether the Amazon Web Services account is a management or member account that's part of an
        # organization in Organizations.

        @[JSON::Field(key: "accountType")]
        getter account_type : String?

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String?

        # The name of the Slack workspace.

        @[JSON::Field(key: "teamName")]
        getter team_name : String?

        def initialize(
          @account_type : String? = nil,
          @team_id : String? = nil,
          @team_name : String? = nil
        )
        end
      end

      # The specified resource is missing or doesn't exist, such as an account alias, Slack channel
      # configuration, or Slack workspace configuration.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your Service Quotas request exceeds the quota for the service. For example, your Service Quotas
      # request to Amazon Web Services Support App might exceed the maximum number of workspaces or channels
      # per account, or the maximum number of accounts per Slack channel.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for a Slack channel that you added for your Amazon Web Services account.

      struct SlackChannelConfiguration
        include JSON::Serializable

        # The channel ID in Slack. This ID identifies a channel within a Slack workspace.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        # The name of the Slack channel that you configured with the Amazon Web Services Support App for your
        # Amazon Web Services account.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # The Amazon Resource Name (ARN) of an IAM role that you want to use to perform operations on Amazon
        # Web Services. For more information, see Managing access to the Amazon Web Services Support App in
        # the Amazon Web Services Support User Guide .

        @[JSON::Field(key: "channelRoleArn")]
        getter channel_role_arn : String?

        # Whether you want to get notified when a support case has a new correspondence.

        @[JSON::Field(key: "notifyOnAddCorrespondenceToCase")]
        getter notify_on_add_correspondence_to_case : Bool?

        # The case severity for a support case that you want to receive notifications.

        @[JSON::Field(key: "notifyOnCaseSeverity")]
        getter notify_on_case_severity : String?

        # Whether you want to get notified when a support case is created or reopened.

        @[JSON::Field(key: "notifyOnCreateOrReopenCase")]
        getter notify_on_create_or_reopen_case : Bool?

        # Whether you want to get notified when a support case is resolved.

        @[JSON::Field(key: "notifyOnResolveCase")]
        getter notify_on_resolve_case : Bool?

        def initialize(
          @channel_id : String,
          @team_id : String,
          @channel_name : String? = nil,
          @channel_role_arn : String? = nil,
          @notify_on_add_correspondence_to_case : Bool? = nil,
          @notify_on_case_severity : String? = nil,
          @notify_on_create_or_reopen_case : Bool? = nil,
          @notify_on_resolve_case : Bool? = nil
        )
        end
      end

      # The configuration for a Slack workspace that you added to an Amazon Web Services account.

      struct SlackWorkspaceConfiguration
        include JSON::Serializable

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        # Whether to allow member accounts to authorize Slack workspaces. Member accounts must be part of an
        # organization in Organizations.

        @[JSON::Field(key: "allowOrganizationMemberAccount")]
        getter allow_organization_member_account : Bool?

        # The name of the Slack workspace.

        @[JSON::Field(key: "teamName")]
        getter team_name : String?

        def initialize(
          @team_id : String,
          @allow_organization_member_account : Bool? = nil,
          @team_name : String? = nil
        )
        end
      end


      struct UpdateSlackChannelConfigurationRequest
        include JSON::Serializable

        # The channel ID in Slack. This ID identifies a channel within a Slack workspace.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String

        # The Slack channel name that you want to update.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # The Amazon Resource Name (ARN) of an IAM role that you want to use to perform operations on Amazon
        # Web Services. For more information, see Managing access to the Amazon Web Services Support App in
        # the Amazon Web Services Support User Guide .

        @[JSON::Field(key: "channelRoleArn")]
        getter channel_role_arn : String?

        # Whether you want to get notified when a support case has a new correspondence.

        @[JSON::Field(key: "notifyOnAddCorrespondenceToCase")]
        getter notify_on_add_correspondence_to_case : Bool?

        # The case severity for a support case that you want to receive notifications. If you specify high or
        # all , at least one of the following parameters must be true : notifyOnAddCorrespondenceToCase
        # notifyOnCreateOrReopenCase notifyOnResolveCase If you specify none , any of the following parameters
        # that you specify in your request must be false : notifyOnAddCorrespondenceToCase
        # notifyOnCreateOrReopenCase notifyOnResolveCase If you don't specify these parameters in your
        # request, the Amazon Web Services Support App uses the current values by default.

        @[JSON::Field(key: "notifyOnCaseSeverity")]
        getter notify_on_case_severity : String?

        # Whether you want to get notified when a support case is created or reopened.

        @[JSON::Field(key: "notifyOnCreateOrReopenCase")]
        getter notify_on_create_or_reopen_case : Bool?

        # Whether you want to get notified when a support case is resolved.

        @[JSON::Field(key: "notifyOnResolveCase")]
        getter notify_on_resolve_case : Bool?

        def initialize(
          @channel_id : String,
          @team_id : String,
          @channel_name : String? = nil,
          @channel_role_arn : String? = nil,
          @notify_on_add_correspondence_to_case : Bool? = nil,
          @notify_on_case_severity : String? = nil,
          @notify_on_create_or_reopen_case : Bool? = nil,
          @notify_on_resolve_case : Bool? = nil
        )
        end
      end


      struct UpdateSlackChannelConfigurationResult
        include JSON::Serializable

        # The channel ID in Slack. This ID identifies a channel within a Slack workspace.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?

        # The name of the Slack channel that you configure for the Amazon Web Services Support App.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # The Amazon Resource Name (ARN) of an IAM role that you want to use to perform operations on Amazon
        # Web Services. For more information, see Managing access to the Amazon Web Services Support App in
        # the Amazon Web Services Support User Guide .

        @[JSON::Field(key: "channelRoleArn")]
        getter channel_role_arn : String?

        # Whether you want to get notified when a support case has a new correspondence.

        @[JSON::Field(key: "notifyOnAddCorrespondenceToCase")]
        getter notify_on_add_correspondence_to_case : Bool?

        # The case severity for a support case that you want to receive notifications.

        @[JSON::Field(key: "notifyOnCaseSeverity")]
        getter notify_on_case_severity : String?

        # Whether you want to get notified when a support case is created or reopened.

        @[JSON::Field(key: "notifyOnCreateOrReopenCase")]
        getter notify_on_create_or_reopen_case : Bool?

        # Whether you want to get notified when a support case is resolved.

        @[JSON::Field(key: "notifyOnResolveCase")]
        getter notify_on_resolve_case : Bool?

        # The team ID in Slack. This ID uniquely identifies a Slack workspace, such as T012ABCDEFG .

        @[JSON::Field(key: "teamId")]
        getter team_id : String?

        def initialize(
          @channel_id : String? = nil,
          @channel_name : String? = nil,
          @channel_role_arn : String? = nil,
          @notify_on_add_correspondence_to_case : Bool? = nil,
          @notify_on_case_severity : String? = nil,
          @notify_on_create_or_reopen_case : Bool? = nil,
          @notify_on_resolve_case : Bool? = nil,
          @team_id : String? = nil
        )
        end
      end

      # Your request input doesn't meet the constraints that the Amazon Web Services Support App specifies.

      struct ValidationException
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
