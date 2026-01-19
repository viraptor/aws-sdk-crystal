module AwsSdk
  module SupportApp
    module Model
      API_VERSION = "2021-08-20"
      TARGET_PREFIX = ""
      SIGNING_NAME = "supportapp"
      ENDPOINT_PREFIX = "supportapp"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://supportapp-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://supportapp-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://supportapp.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://supportapp.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "CreateSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/control/create-slack-channel-configuration"
      )

      DELETE_ACCOUNT_ALIAS = OperationModel.new(
        name: "DeleteAccountAlias",
        http_method: "POST",
        request_uri: "/control/delete-account-alias"
      )

      DELETE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "DeleteSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/control/delete-slack-channel-configuration"
      )

      DELETE_SLACK_WORKSPACE_CONFIGURATION = OperationModel.new(
        name: "DeleteSlackWorkspaceConfiguration",
        http_method: "POST",
        request_uri: "/control/delete-slack-workspace-configuration"
      )

      GET_ACCOUNT_ALIAS = OperationModel.new(
        name: "GetAccountAlias",
        http_method: "POST",
        request_uri: "/control/get-account-alias"
      )

      LIST_SLACK_CHANNEL_CONFIGURATIONS = OperationModel.new(
        name: "ListSlackChannelConfigurations",
        http_method: "POST",
        request_uri: "/control/list-slack-channel-configurations"
      )

      LIST_SLACK_WORKSPACE_CONFIGURATIONS = OperationModel.new(
        name: "ListSlackWorkspaceConfigurations",
        http_method: "POST",
        request_uri: "/control/list-slack-workspace-configurations"
      )

      PUT_ACCOUNT_ALIAS = OperationModel.new(
        name: "PutAccountAlias",
        http_method: "POST",
        request_uri: "/control/put-account-alias"
      )

      REGISTER_SLACK_WORKSPACE_FOR_ORGANIZATION = OperationModel.new(
        name: "RegisterSlackWorkspaceForOrganization",
        http_method: "POST",
        request_uri: "/control/register-slack-workspace-for-organization"
      )

      UPDATE_SLACK_CHANNEL_CONFIGURATION = OperationModel.new(
        name: "UpdateSlackChannelConfiguration",
        http_method: "POST",
        request_uri: "/control/update-slack-channel-configuration"
      )
    end
  end
end
