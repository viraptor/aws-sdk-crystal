module Aws
  module Chatbot
    module Model
      API_VERSION = "2017-10-11"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chatbot"
      ENDPOINT_PREFIX = "chatbot"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://chatbot-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://chatbot-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://chatbot.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://chatbot.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_TO_CONFIGURATION = OperationModel.new(
        name: "AssociateToConfiguration",
        http_method: "POST",
        request_uri: "/associate-to-configuration"
      )

      CREATE_CHIME_WEBHOOK_CONFIGURATION = OperationModel.new(
        name: "CreateChimeWebhookConfiguration",
        http_method: "POST",
        request_uri: "/create-chime-webhook-configuration"
      )

      CREATE_CUSTOM_ACTION = OperationModel.new(
        name: "CreateCustomAction",
        http_method: "POST",
        request_uri: "/create-custom-action"
      )

      CREATE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "CreateMicrosoftTeamsChannelConfiguration",
        http_method: "POST",
        request_uri: "/create-ms-teams-channel-configuration"
      )

      CREATE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "CreateSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/create-slack-channel-configuration"
      )

      DELETE_CHIME_WEBHOOK_CONFIGURATION = OperationModel.new(
        name: "DeleteChimeWebhookConfiguration",
        http_method: "POST",
        request_uri: "/delete-chime-webhook-configuration"
      )

      DELETE_CUSTOM_ACTION = OperationModel.new(
        name: "DeleteCustomAction",
        http_method: "POST",
        request_uri: "/delete-custom-action"
      )

      DELETE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "DeleteMicrosoftTeamsChannelConfiguration",
        http_method: "POST",
        request_uri: "/delete-ms-teams-channel-configuration"
      )

      DELETE_MICROSOFT_TEAMS_CONFIGURED_TEAM = OperationModel.new(
        name: "DeleteMicrosoftTeamsConfiguredTeam",
        http_method: "POST",
        request_uri: "/delete-ms-teams-configured-teams"
      )

      DELETE_MICROSOFT_TEAMS_USER_IDENTITY = OperationModel.new(
        name: "DeleteMicrosoftTeamsUserIdentity",
        http_method: "POST",
        request_uri: "/delete-ms-teams-user-identity"
      )

      DELETE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "DeleteSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/delete-slack-channel-configuration"
      )

      DELETE_SLACK_USER_IDENTITY = OperationModel.new(
        name: "DeleteSlackUserIdentity",
        http_method: "POST",
        request_uri: "/delete-slack-user-identity"
      )

      DELETE_SLACK_WORKSPACE_AUTHORIZATION = OperationModel.new(
        name: "DeleteSlackWorkspaceAuthorization",
        http_method: "POST",
        request_uri: "/delete-slack-workspace-authorization"
      )

      DESCRIBE_CHIME_WEBHOOK_CONFIGURATIONS = OperationModel.new(
        name: "DescribeChimeWebhookConfigurations",
        http_method: "POST",
        request_uri: "/describe-chime-webhook-configurations"
      )

      DESCRIBE_SLACK_CHANNEL_CONFIGURATIONS = OperationModel.new(
        name: "DescribeSlackChannelConfigurations",
        http_method: "POST",
        request_uri: "/describe-slack-channel-configurations"
      )

      DESCRIBE_SLACK_USER_IDENTITIES = OperationModel.new(
        name: "DescribeSlackUserIdentities",
        http_method: "POST",
        request_uri: "/describe-slack-user-identities"
      )

      DESCRIBE_SLACK_WORKSPACES = OperationModel.new(
        name: "DescribeSlackWorkspaces",
        http_method: "POST",
        request_uri: "/describe-slack-workspaces"
      )

      DISASSOCIATE_FROM_CONFIGURATION = OperationModel.new(
        name: "DisassociateFromConfiguration",
        http_method: "POST",
        request_uri: "/disassociate-from-configuration"
      )

      GET_ACCOUNT_PREFERENCES = OperationModel.new(
        name: "GetAccountPreferences",
        http_method: "POST",
        request_uri: "/get-account-preferences"
      )

      GET_CUSTOM_ACTION = OperationModel.new(
        name: "GetCustomAction",
        http_method: "POST",
        request_uri: "/get-custom-action"
      )

      GET_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "GetMicrosoftTeamsChannelConfiguration",
        http_method: "POST",
        request_uri: "/get-ms-teams-channel-configuration"
      )

      LIST_ASSOCIATIONS = OperationModel.new(
        name: "ListAssociations",
        http_method: "POST",
        request_uri: "/list-associations"
      )

      LIST_CUSTOM_ACTIONS = OperationModel.new(
        name: "ListCustomActions",
        http_method: "POST",
        request_uri: "/list-custom-actions"
      )

      LIST_MICROSOFT_TEAMS_CHANNEL_CONFIGURATIONS = OperationModel.new(
        name: "ListMicrosoftTeamsChannelConfigurations",
        http_method: "POST",
        request_uri: "/list-ms-teams-channel-configurations"
      )

      LIST_MICROSOFT_TEAMS_CONFIGURED_TEAMS = OperationModel.new(
        name: "ListMicrosoftTeamsConfiguredTeams",
        http_method: "POST",
        request_uri: "/list-ms-teams-configured-teams"
      )

      LIST_MICROSOFT_TEAMS_USER_IDENTITIES = OperationModel.new(
        name: "ListMicrosoftTeamsUserIdentities",
        http_method: "POST",
        request_uri: "/list-ms-teams-user-identities"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/list-tags-for-resource"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untag-resource"
      )

      UPDATE_ACCOUNT_PREFERENCES = OperationModel.new(
        name: "UpdateAccountPreferences",
        http_method: "POST",
        request_uri: "/update-account-preferences"
      )

      UPDATE_CHIME_WEBHOOK_CONFIGURATION = OperationModel.new(
        name: "UpdateChimeWebhookConfiguration",
        http_method: "POST",
        request_uri: "/update-chime-webhook-configuration"
      )

      UPDATE_CUSTOM_ACTION = OperationModel.new(
        name: "UpdateCustomAction",
        http_method: "POST",
        request_uri: "/update-custom-action"
      )

      UPDATE_MICROSOFT_TEAMS_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "UpdateMicrosoftTeamsChannelConfiguration",
        http_method: "POST",
        request_uri: "/update-ms-teams-channel-configuration"
      )

      UPDATE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "UpdateSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/update-slack-channel-configuration"
      )
    end
  end
end
