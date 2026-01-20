require "json"

module Aws
  module Chatbot
    module Types

      # Preferences related to AWS Chatbot usage in the calling AWS account.

      struct AccountPreferences
        include JSON::Serializable

        # Turns on training data collection. This helps improve the AWS Chatbot experience by allowing AWS
        # Chatbot to store and use your customer information, such as AWS Chatbot configurations,
        # notifications, user inputs, AWS Chatbot generated responses, and interaction data. This data helps
        # us to continuously improve and develop Artificial Intelligence (AI) technologies. Your data is not
        # shared with any third parties and is protected using sophisticated controls to prevent unauthorized
        # access and misuse. AWS Chatbot does not store or use interactions in chat channels with Amazon Q for
        # training AI technologies for AWS Chatbot.

        @[JSON::Field(key: "TrainingDataCollectionEnabled")]
        getter training_data_collection_enabled : Bool?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @training_data_collection_enabled : Bool? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct AssociateToConfigurationRequest
        include JSON::Serializable

        # The channel configuration to associate with the resource.

        @[JSON::Field(key: "ChatConfiguration")]
        getter chat_configuration : String

        # The resource Amazon Resource Name (ARN) to link.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @chat_configuration : String,
          @resource : String
        )
        end
      end


      struct AssociateToConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end

      # A listing of an association with a channel configuration.

      struct AssociationListing
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource (for example, a custom action).

        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @resource : String
        )
        end
      end

      # An AWS Chatbot configuration for Amazon Chime.

      struct ChimeWebhookConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ChimeWebhookConfiguration.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)

        # A description of the webhook. We recommend using the convention RoomName/WebhookName . For more
        # information, see Tutorial: Get started with Amazon Chime in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "WebhookDescription")]
        getter webhook_description : String

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # Either ENABLED or DISABLED . The resource returns DISABLED if the organization's AWS Chatbot policy
        # has explicitly denied that configuration. For example, if Amazon Chime is disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provided if State is DISABLED . Provides context as to why the resource is disabled.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @chat_configuration_arn : String,
          @iam_role_arn : String,
          @sns_topic_arns : Array(String),
          @webhook_description : String,
          @configuration_name : String? = nil,
          @logging_level : String? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A Microsoft Teams team that is authorized with AWS Chatbot.

      struct ConfiguredTeam
        include JSON::Serializable

        # The ID of the Microsoft Teams authorized with AWS Chatbot. To get the team ID, you must perform the
        # initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy and
        # paste the team ID from the console. For more information, see Step 1: Configure a Microsoft Teams
        # client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        # The ID of the Microsoft Teams tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String

        # Either ENABLED or DISABLED . The resource returns DISABLED if the organization's AWS Chatbot policy
        # has explicitly denied that configuration. For example, if Amazon Chime is disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provided if State is DISABLED . Provides context as to why the resource is disabled.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The name of the Microsoft Teams Team.

        @[JSON::Field(key: "TeamName")]
        getter team_name : String?

        def initialize(
          @team_id : String,
          @tenant_id : String,
          @state : String? = nil,
          @state_reason : String? = nil,
          @team_name : String? = nil
        )
        end
      end

      # There was an issue processing your request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct CreateChimeWebhookConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateChimeWebhookConfigurationRequest
        include JSON::Serializable

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)

        # A description of the webhook. We recommend using the convention RoomName/WebhookName . For more
        # information, see Tutorial: Get started with Amazon Chime in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "WebhookDescription")]
        getter webhook_description : String

        # The URL for the Amazon Chime webhook.

        @[JSON::Field(key: "WebhookUrl")]
        getter webhook_url : String

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration_name : String,
          @iam_role_arn : String,
          @sns_topic_arns : Array(String),
          @webhook_description : String,
          @webhook_url : String,
          @logging_level : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateChimeWebhookConfigurationResult
        include JSON::Serializable

        # An Amazon Chime webhook configuration.

        @[JSON::Field(key: "WebhookConfiguration")]
        getter webhook_configuration : Types::ChimeWebhookConfiguration?

        def initialize(
          @webhook_configuration : Types::ChimeWebhookConfiguration? = nil
        )
        end
      end


      struct CreateCustomActionRequest
        include JSON::Serializable

        # The name of the custom action. This name is included in the Amazon Resource Name (ARN).

        @[JSON::Field(key: "ActionName")]
        getter action_name : String

        # The definition of the command to run when invoked as an alias or as an action button.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::CustomActionDefinition

        # The name used to invoke this action in a chat channel. For example, @aws run my-alias .

        @[JSON::Field(key: "AliasName")]
        getter alias_name : String?

        # Defines when this custom action button should be attached to a notification.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::CustomActionAttachment)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, subsequent retries with the same client token returns the
        # result from the original successful request. If you do not specify a client token, one is
        # automatically generated by the SDK.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @action_name : String,
          @definition : Types::CustomActionDefinition,
          @alias_name : String? = nil,
          @attachments : Array(Types::CustomActionAttachment)? = nil,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCustomActionResult
        include JSON::Serializable

        # The fully defined ARN of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        def initialize(
          @custom_action_arn : String
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct CreateSlackChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateSlackChannelConfigurationRequest
        include JSON::Serializable

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The ID of the Slack channel. To get this ID, open Slack, right click on the channel name in the left
        # pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For
        # example, ABCBBLZZZ.

        @[JSON::Field(key: "SlackChannelId")]
        getter slack_channel_id : String

        # The ID of the Slack workspace authorized with AWS Chatbot.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # The name of the Slack channel.

        @[JSON::Field(key: "SlackChannelName")]
        getter slack_channel_name : String?

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @configuration_name : String,
          @iam_role_arn : String,
          @slack_channel_id : String,
          @slack_team_id : String,
          @guardrail_policy_arns : Array(String)? = nil,
          @logging_level : String? = nil,
          @slack_channel_name : String? = nil,
          @sns_topic_arns : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct CreateSlackChannelConfigurationResult
        include JSON::Serializable

        # The configuration for a Slack channel configured with AWS Chatbot.

        @[JSON::Field(key: "ChannelConfiguration")]
        getter channel_configuration : Types::SlackChannelConfiguration?

        def initialize(
          @channel_configuration : Types::SlackChannelConfiguration? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct CreateTeamsChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateTeamsChannelConfigurationRequest
        include JSON::Serializable

        # The ID of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The ID of the Microsoft Teams authorized with AWS Chatbot. To get the team ID, you must perform the
        # initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy and
        # paste the team ID from the console. For more information, see Step 1: Configure a Microsoft Teams
        # client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        # The ID of the Microsoft Teams tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String

        # The name of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The name of the Microsoft Teams Team.

        @[JSON::Field(key: "TeamName")]
        getter team_name : String?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @channel_id : String,
          @configuration_name : String,
          @iam_role_arn : String,
          @team_id : String,
          @tenant_id : String,
          @channel_name : String? = nil,
          @guardrail_policy_arns : Array(String)? = nil,
          @logging_level : String? = nil,
          @sns_topic_arns : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @team_name : String? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct CreateTeamsChannelConfigurationResult
        include JSON::Serializable

        # The configuration for a Microsoft Teams channel configured with AWS Chatbot.

        @[JSON::Field(key: "ChannelConfiguration")]
        getter channel_configuration : Types::TeamsChannelConfiguration?

        def initialize(
          @channel_configuration : Types::TeamsChannelConfiguration? = nil
        )
        end
      end

      # Represents a parameterized command that can be invoked as an alias or as a notification button in
      # the chat client.

      struct CustomAction
        include JSON::Serializable

        # The fully defined Amazon Resource Name (ARN) of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        # The definition of the command to run when invoked an alias or as an action button.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::CustomActionDefinition

        # The name of the custom action that is included in the ARN.

        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        # The name used to invoke this action in the chat channel. For example, @aws run my-alias .

        @[JSON::Field(key: "AliasName")]
        getter alias_name : String?

        # Defines when this custom action button should be attached to a notification.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::CustomActionAttachment)?

        def initialize(
          @custom_action_arn : String,
          @definition : Types::CustomActionDefinition,
          @action_name : String? = nil,
          @alias_name : String? = nil,
          @attachments : Array(Types::CustomActionAttachment)? = nil
        )
        end
      end

      # Defines when a custom action button should be attached to a notification.

      struct CustomActionAttachment
        include JSON::Serializable

        # The text of the button that appears on the notification.

        @[JSON::Field(key: "ButtonText")]
        getter button_text : String?

        # The criteria for when a button should be shown based on values in the notification.

        @[JSON::Field(key: "Criteria")]
        getter criteria : Array(Types::CustomActionAttachmentCriteria)?

        # The type of notification that the custom action should be attached to.

        @[JSON::Field(key: "NotificationType")]
        getter notification_type : String?

        # The variables to extract from the notification.

        @[JSON::Field(key: "Variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @button_text : String? = nil,
          @criteria : Array(Types::CustomActionAttachmentCriteria)? = nil,
          @notification_type : String? = nil,
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # A criteria for when a button should be shown based on values in the notification

      struct CustomActionAttachmentCriteria
        include JSON::Serializable

        # The operation to perform on the named variable.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The name of the variable to operate on.

        @[JSON::Field(key: "VariableName")]
        getter variable_name : String

        # A value that is compared with the actual value of the variable based on the behavior of the
        # operator.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @operator : String,
          @variable_name : String,
          @value : String? = nil
        )
        end
      end

      # The definition of the command to run when invoked as an alias or as an action button.

      struct CustomActionDefinition
        include JSON::Serializable

        # The command string to run which may include variables by prefixing with a dollar sign ($).

        @[JSON::Field(key: "CommandText")]
        getter command_text : String

        def initialize(
          @command_text : String
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteChimeWebhookConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteChimeWebhookConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ChimeWebhookConfiguration to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        def initialize(
          @chat_configuration_arn : String
        )
        end
      end


      struct DeleteChimeWebhookConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCustomActionRequest
        include JSON::Serializable

        # The fully defined ARN of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        def initialize(
          @custom_action_arn : String
        )
        end
      end


      struct DeleteCustomActionResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteMicrosoftTeamsUserIdentityException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteMicrosoftTeamsUserIdentityRequest
        include JSON::Serializable

        # The ARN of the MicrosoftTeamsChannelConfiguration associated with the user identity to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # The Microsoft Teams user ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @chat_configuration_arn : String,
          @user_id : String
        )
        end
      end


      struct DeleteMicrosoftTeamsUserIdentityResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteSlackChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteSlackChannelConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SlackChannelConfiguration to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        def initialize(
          @chat_configuration_arn : String
        )
        end
      end


      struct DeleteSlackChannelConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteSlackUserIdentityException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteSlackUserIdentityRequest
        include JSON::Serializable

        # The ARN of the SlackChannelConfiguration associated with the user identity to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # The ID of the Slack workspace authorized with AWS Chatbot.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        # The ID of the user in Slack

        @[JSON::Field(key: "SlackUserId")]
        getter slack_user_id : String

        def initialize(
          @chat_configuration_arn : String,
          @slack_team_id : String,
          @slack_user_id : String
        )
        end
      end


      struct DeleteSlackUserIdentityResult
        include JSON::Serializable

        def initialize
        end
      end

      # There was an issue deleting your Slack workspace.

      struct DeleteSlackWorkspaceAuthorizationFault
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteSlackWorkspaceAuthorizationRequest
        include JSON::Serializable

        # The ID of the Slack workspace authorized with AWS Chatbot.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        def initialize(
          @slack_team_id : String
        )
        end
      end


      struct DeleteSlackWorkspaceAuthorizationResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteTeamsChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteTeamsChannelConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the MicrosoftTeamsChannelConfiguration associated with the user
        # identity to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        def initialize(
          @chat_configuration_arn : String
        )
        end
      end


      struct DeleteTeamsChannelConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DeleteTeamsConfiguredTeamException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteTeamsConfiguredTeamRequest
        include JSON::Serializable

        # The ID of the Microsoft Teams team authorized with AWS Chatbot. To get the team ID, you must perform
        # the initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy
        # and paste the team ID from the console. For more information, see Step 1: Configure a Microsoft
        # Teams client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        def initialize(
          @team_id : String
        )
        end
      end


      struct DeleteTeamsConfiguredTeamResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DescribeChimeWebhookConfigurationsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeChimeWebhookConfigurationsRequest
        include JSON::Serializable

        # An optional Amazon Resource Name (ARN) of a ChimeWebhookConfiguration to describe.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @chat_configuration_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeChimeWebhookConfigurationsResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Amazon Chime webhooks associated with the account.

        @[JSON::Field(key: "WebhookConfigurations")]
        getter webhook_configurations : Array(Types::ChimeWebhookConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @webhook_configurations : Array(Types::ChimeWebhookConfiguration)? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DescribeSlackChannelConfigurationsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeSlackChannelConfigurationsRequest
        include JSON::Serializable

        # An optional Amazon Resource Name (ARN) of a SlackChannelConfiguration to describe.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @chat_configuration_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSlackChannelConfigurationsResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Slack channel configurations.

        @[JSON::Field(key: "SlackChannelConfigurations")]
        getter slack_channel_configurations : Array(Types::SlackChannelConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @slack_channel_configurations : Array(Types::SlackChannelConfiguration)? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DescribeSlackUserIdentitiesException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeSlackUserIdentitiesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SlackChannelConfiguration associated with the user identities
        # to describe.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @chat_configuration_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSlackUserIdentitiesResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Slack User Identities.

        @[JSON::Field(key: "SlackUserIdentities")]
        getter slack_user_identities : Array(Types::SlackUserIdentity)?

        def initialize(
          @next_token : String? = nil,
          @slack_user_identities : Array(Types::SlackUserIdentity)? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct DescribeSlackWorkspacesException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeSlackWorkspacesRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSlackWorkspacesResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Slack workspaces registered with AWS Chatbot.

        @[JSON::Field(key: "SlackWorkspaces")]
        getter slack_workspaces : Array(Types::SlackWorkspace)?

        def initialize(
          @next_token : String? = nil,
          @slack_workspaces : Array(Types::SlackWorkspace)? = nil
        )
        end
      end


      struct DisassociateFromConfigurationRequest
        include JSON::Serializable

        # The channel configuration the resource is being disassociated from.

        @[JSON::Field(key: "ChatConfiguration")]
        getter chat_configuration : String

        # The resource (for example, a custom action) Amazon Resource Name (ARN) to unlink.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @chat_configuration : String,
          @resource : String
        )
        end
      end


      struct DisassociateFromConfigurationResult
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct GetAccountPreferencesException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAccountPreferencesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountPreferencesResult
        include JSON::Serializable

        # The preferences related to AWS Chatbot usage in the calling AWS account.

        @[JSON::Field(key: "AccountPreferences")]
        getter account_preferences : Types::AccountPreferences?

        def initialize(
          @account_preferences : Types::AccountPreferences? = nil
        )
        end
      end


      struct GetCustomActionRequest
        include JSON::Serializable

        # Returns the fully defined Amazon Resource Name (ARN) of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        def initialize(
          @custom_action_arn : String
        )
        end
      end


      struct GetCustomActionResult
        include JSON::Serializable

        # Returns the custom action.

        @[JSON::Field(key: "CustomAction")]
        getter custom_action : Types::CustomAction?

        def initialize(
          @custom_action : Types::CustomAction? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct GetTeamsChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetTeamsChannelConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the MicrosoftTeamsChannelConfiguration to retrieve.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        def initialize(
          @chat_configuration_arn : String
        )
        end
      end


      struct GetTeamsChannelConfigurationResult
        include JSON::Serializable

        # The configuration for a Microsoft Teams channel configured with AWS Chatbot.

        @[JSON::Field(key: "ChannelConfiguration")]
        getter channel_configuration : Types::TeamsChannelConfiguration?

        def initialize(
          @channel_configuration : Types::TeamsChannelConfiguration? = nil
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServiceError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request input doesn't meet the constraints required by AWS Chatbot.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request input doesn't meet the constraints required by AWS Chatbot.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded a service limit for AWS Chatbot.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAssociationsRequest
        include JSON::Serializable

        # The channel configuration to list associations for.

        @[JSON::Field(key: "ChatConfiguration")]
        getter chat_configuration : String

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @chat_configuration : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociationsResult
        include JSON::Serializable

        # The resources associated with this channel configuration.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::AssociationListing)

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::AssociationListing),
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomActionsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomActionsResult
        include JSON::Serializable

        # A list of custom actions.

        @[JSON::Field(key: "CustomActions")]
        getter custom_actions : Array(String)

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_actions : Array(String),
          @next_token : String? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct ListMicrosoftTeamsConfiguredTeamsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListMicrosoftTeamsConfiguredTeamsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMicrosoftTeamsConfiguredTeamsResult
        include JSON::Serializable

        # A list of teams in Microsoft Teams that are configured with AWS Chatbot.

        @[JSON::Field(key: "ConfiguredTeams")]
        getter configured_teams : Array(Types::ConfiguredTeam)?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configured_teams : Array(Types::ConfiguredTeam)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct ListMicrosoftTeamsUserIdentitiesException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListMicrosoftTeamsUserIdentitiesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the MicrosoftTeamsChannelConfiguration associated with the user
        # identities to list.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @chat_configuration_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMicrosoftTeamsUserIdentitiesResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # User level permissions associated to a channel configuration.

        @[JSON::Field(key: "TeamsUserIdentities")]
        getter teams_user_identities : Array(Types::TeamsUserIdentity)?

        def initialize(
          @next_token : String? = nil,
          @teams_user_identities : Array(Types::TeamsUserIdentity)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource to list tags for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Key-value pairs that are assigned to a resource, usually for the purpose of grouping and searching
        # for items. Tags are metadata that you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct ListTeamsChannelConfigurationsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListTeamsChannelConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the Microsoft Teams authorized with AWS Chatbot. To get the team ID, you must perform the
        # initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy and
        # paste the team ID from the console. For more information, see Step 1: Configure a Microsoft Teams
        # client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @team_id : String? = nil
        )
        end
      end


      struct ListTeamsChannelConfigurationsResult
        include JSON::Serializable

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of AWS Chatbot channel configurations for Microsoft Teams.

        @[JSON::Field(key: "TeamChannelConfigurations")]
        getter team_channel_configurations : Array(Types::TeamsChannelConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @team_channel_configurations : Array(Types::TeamsChannelConfiguration)? = nil
        )
        end
      end

      # We were unable to find the resource for your request

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An AWS Chatbot configuration for Slack.

      struct SlackChannelConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SlackChannelConfiguration.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The ID of the Slack channel. To get this ID, open Slack, right click on the channel name in the left
        # pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For
        # example, ABCBBLZZZ.

        @[JSON::Field(key: "SlackChannelId")]
        getter slack_channel_id : String

        # The name of the Slack channel.

        @[JSON::Field(key: "SlackChannelName")]
        getter slack_channel_name : String

        # The ID of the Slack workspace authorized with Amazon Chime.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        # Name of the Slack workspace.

        @[JSON::Field(key: "SlackTeamName")]
        getter slack_team_name : String

        # The ARNs of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # Either ENABLED or DISABLED . The resource returns DISABLED if the organization's AWS Chatbot policy
        # has explicitly denied that configuration. For example, if Amazon Chime is disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provided if State is DISABLED . Provides context as to why the resource is disabled.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @chat_configuration_arn : String,
          @iam_role_arn : String,
          @slack_channel_id : String,
          @slack_channel_name : String,
          @slack_team_id : String,
          @slack_team_name : String,
          @sns_topic_arns : Array(String),
          @configuration_name : String? = nil,
          @guardrail_policy_arns : Array(String)? = nil,
          @logging_level : String? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end

      # Identifes a user level permission for a channel configuration.

      struct SlackUserIdentity
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SlackChannelConfiguration associated with the user identity to
        # delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The ID of the Slack workspace authorized with AWS Chatbot.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        # The ID of the user in Slack

        @[JSON::Field(key: "SlackUserId")]
        getter slack_user_id : String

        # The AWS user identity ARN used to associate a Slack user ID with an IAM Role.

        @[JSON::Field(key: "AwsUserIdentity")]
        getter aws_user_identity : String?

        def initialize(
          @chat_configuration_arn : String,
          @iam_role_arn : String,
          @slack_team_id : String,
          @slack_user_id : String,
          @aws_user_identity : String? = nil
        )
        end
      end

      # A Slack workspace.

      struct SlackWorkspace
        include JSON::Serializable

        # The ID of the Slack workspace authorized with AWS Chatbot.

        @[JSON::Field(key: "SlackTeamId")]
        getter slack_team_id : String

        # The name of the Slack workspace.

        @[JSON::Field(key: "SlackTeamName")]
        getter slack_team_name : String

        # Either ENABLED or DISABLED . The resource returns DISABLED if the organization's AWS Chatbot policy
        # has explicitly denied that configuration. For example, if Amazon Chime is disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provided if State is DISABLED . Provides context as to why the resource is disabled.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @slack_team_id : String,
          @slack_team_name : String,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both
      # required, but tag values can be empty (null) strings. Do not include confidential or sensitive
      # information in this field. For more information, see User-Defined Tag Restrictions in the AWS
      # Billing and Cost Management User Guide .

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # The value of the tag.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String

        def initialize(
          @tag_key : String,
          @tag_value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the configuration.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags to apply to the configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An AWS Chatbot configuration for Microsoft Teams.

      struct TeamsChannelConfiguration
        include JSON::Serializable

        # The ID of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String

        # The Amazon Resource Name (ARN) of the MicrosoftTeamsChannelConfiguration associated with the user
        # identity to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)

        # The ID of the Microsoft Teams authorized with AWS Chatbot. To get the team ID, you must perform the
        # initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy and
        # paste the team ID from the console. For more information, see Step 1: Configure a Microsoft Teams
        # client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        # The ID of the Microsoft Teams tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String

        # The name of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The name of the configuration.

        @[JSON::Field(key: "ConfigurationName")]
        getter configuration_name : String?

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # Either ENABLED or DISABLED . The resource returns DISABLED if the organization's AWS Chatbot policy
        # has explicitly denied that configuration. For example, if Amazon Chime is disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Provided if State is DISABLED . Provides context as to why the resource is disabled.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The name of the Microsoft Teams Team.

        @[JSON::Field(key: "TeamName")]
        getter team_name : String?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @channel_id : String,
          @chat_configuration_arn : String,
          @iam_role_arn : String,
          @sns_topic_arns : Array(String),
          @team_id : String,
          @tenant_id : String,
          @channel_name : String? = nil,
          @configuration_name : String? = nil,
          @guardrail_policy_arns : Array(String)? = nil,
          @logging_level : String? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @team_name : String? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end

      # Identifes a user level permission for a channel configuration.

      struct TeamsUserIdentity
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the MicrosoftTeamsChannelConfiguration associated with the user
        # identity to delete.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The ID of the Microsoft Teams authorized with AWS Chatbot. To get the team ID, you must perform the
        # initial authorization flow with Microsoft Teams in the AWS Chatbot console. Then you can copy and
        # paste the team ID from the console. For more information, see Step 1: Configure a Microsoft Teams
        # client in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        # The AWS user identity ARN used to associate a Microsoft Teams user Identity with an IAM Role.

        @[JSON::Field(key: "AwsUserIdentity")]
        getter aws_user_identity : String?

        # The ID of the Microsoft Teams channel.

        @[JSON::Field(key: "TeamsChannelId")]
        getter teams_channel_id : String?

        # The ID of the Microsoft Teams tenant.

        @[JSON::Field(key: "TeamsTenantId")]
        getter teams_tenant_id : String?

        # The Microsoft Teams user ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @chat_configuration_arn : String,
          @iam_role_arn : String,
          @team_id : String,
          @aws_user_identity : String? = nil,
          @teams_channel_id : String? = nil,
          @teams_tenant_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The supplied list of tags contains too many tags.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it doesn't have valid credentials for the target resource.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The value of the resource that will have the tag removed. An Amazon Resource Name (ARN) is an
        # identifier for a specific AWS resource, such as a server, user, or role.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # TagKeys are key-value pairs assigned to ARNs that can be used to group and search for resources by
        # type. This metadata can be attached to resources for any purpose.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct UpdateAccountPreferencesException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateAccountPreferencesRequest
        include JSON::Serializable

        # Turns on training data collection. This helps improve the AWS Chatbot experience by allowing AWS
        # Chatbot to store and use your customer information, such as AWS Chatbot configurations,
        # notifications, user inputs, AWS Chatbot generated responses, and interaction data. This data helps
        # us to continuously improve and develop Artificial Intelligence (AI) technologies. Your data is not
        # shared with any third parties and is protected using sophisticated controls to prevent unauthorized
        # access and misuse. AWS Chatbot does not store or use interactions in chat channels with Amazon Q for
        # training AI technologies for AWS Chatbot.

        @[JSON::Field(key: "TrainingDataCollectionEnabled")]
        getter training_data_collection_enabled : Bool?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @training_data_collection_enabled : Bool? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct UpdateAccountPreferencesResult
        include JSON::Serializable

        # Preferences related to AWS Chatbot usage in the calling AWS account.

        @[JSON::Field(key: "AccountPreferences")]
        getter account_preferences : Types::AccountPreferences?

        def initialize(
          @account_preferences : Types::AccountPreferences? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct UpdateChimeWebhookConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateChimeWebhookConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ChimeWebhookConfiguration to update.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # The ARNs of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)?

        # A description of the webhook. We recommend using the convention RoomName/WebhookName . For more
        # information, see Tutorial: Get started with Amazon Chime in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "WebhookDescription")]
        getter webhook_description : String?

        # The URL for the Amazon Chime webhook.

        @[JSON::Field(key: "WebhookUrl")]
        getter webhook_url : String?

        def initialize(
          @chat_configuration_arn : String,
          @iam_role_arn : String? = nil,
          @logging_level : String? = nil,
          @sns_topic_arns : Array(String)? = nil,
          @webhook_description : String? = nil,
          @webhook_url : String? = nil
        )
        end
      end


      struct UpdateChimeWebhookConfigurationResult
        include JSON::Serializable

        # A Amazon Chime webhook configuration.

        @[JSON::Field(key: "WebhookConfiguration")]
        getter webhook_configuration : Types::ChimeWebhookConfiguration?

        def initialize(
          @webhook_configuration : Types::ChimeWebhookConfiguration? = nil
        )
        end
      end


      struct UpdateCustomActionRequest
        include JSON::Serializable

        # The fully defined Amazon Resource Name (ARN) of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        # The definition of the command to run when invoked as an alias or as an action button.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::CustomActionDefinition

        # The name used to invoke this action in the chat channel. For example, @aws run my-alias .

        @[JSON::Field(key: "AliasName")]
        getter alias_name : String?

        # Defines when this custom action button should be attached to a notification.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::CustomActionAttachment)?

        def initialize(
          @custom_action_arn : String,
          @definition : Types::CustomActionDefinition,
          @alias_name : String? = nil,
          @attachments : Array(Types::CustomActionAttachment)? = nil
        )
        end
      end


      struct UpdateCustomActionResult
        include JSON::Serializable

        # The fully defined ARN of the custom action.

        @[JSON::Field(key: "CustomActionArn")]
        getter custom_action_arn : String

        def initialize(
          @custom_action_arn : String
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct UpdateSlackChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateSlackChannelConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SlackChannelConfiguration to update.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # The ID of the Slack channel. To get this ID, open Slack, right click on the channel name in the left
        # pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For
        # example, ABCBBLZZZ.

        @[JSON::Field(key: "SlackChannelId")]
        getter slack_channel_id : String

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # The name of the Slack channel.

        @[JSON::Field(key: "SlackChannelName")]
        getter slack_channel_name : String?

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @chat_configuration_arn : String,
          @slack_channel_id : String,
          @guardrail_policy_arns : Array(String)? = nil,
          @iam_role_arn : String? = nil,
          @logging_level : String? = nil,
          @slack_channel_name : String? = nil,
          @sns_topic_arns : Array(String)? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct UpdateSlackChannelConfigurationResult
        include JSON::Serializable

        # The configuration for a Slack channel configured with AWS Chatbot.

        @[JSON::Field(key: "ChannelConfiguration")]
        getter channel_configuration : Types::SlackChannelConfiguration?

        def initialize(
          @channel_configuration : Types::SlackChannelConfiguration? = nil
        )
        end
      end

      # We can’t process your request right now because of a server issue. Try again later.

      struct UpdateTeamsChannelConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateTeamsChannelConfigurationRequest
        include JSON::Serializable

        # The ID of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelId")]
        getter channel_id : String

        # The Amazon Resource Name (ARN) of the TeamsChannelConfiguration to update.

        @[JSON::Field(key: "ChatConfigurationArn")]
        getter chat_configuration_arn : String

        # The name of the Microsoft Teams channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The list of IAM policy ARNs that are applied as channel guardrails. The AWS managed
        # AdministratorAccess policy is applied by default if this is not set.

        @[JSON::Field(key: "GuardrailPolicyArns")]
        getter guardrail_policy_arns : Array(String)?

        # A user-defined role that AWS Chatbot assumes. This is not the service-linked role. For more
        # information, see IAM policies for AWS Chatbot in the AWS Chatbot Administrator Guide .

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # Logging levels include ERROR , INFO , or NONE .

        @[JSON::Field(key: "LoggingLevel")]
        getter logging_level : String?

        # The Amazon Resource Names (ARNs) of the SNS topics that deliver notifications to AWS Chatbot.

        @[JSON::Field(key: "SnsTopicArns")]
        getter sns_topic_arns : Array(String)?

        # Enables use of a user role requirement in your chat configuration.

        @[JSON::Field(key: "UserAuthorizationRequired")]
        getter user_authorization_required : Bool?

        def initialize(
          @channel_id : String,
          @chat_configuration_arn : String,
          @channel_name : String? = nil,
          @guardrail_policy_arns : Array(String)? = nil,
          @iam_role_arn : String? = nil,
          @logging_level : String? = nil,
          @sns_topic_arns : Array(String)? = nil,
          @user_authorization_required : Bool? = nil
        )
        end
      end


      struct UpdateTeamsChannelConfigurationResult
        include JSON::Serializable

        # The configuration for a Microsoft Teams channel configured with AWS Chatbot.

        @[JSON::Field(key: "ChannelConfiguration")]
        getter channel_configuration : Types::TeamsChannelConfiguration?

        def initialize(
          @channel_configuration : Types::TeamsChannelConfiguration? = nil
        )
        end
      end
    end
  end
end
