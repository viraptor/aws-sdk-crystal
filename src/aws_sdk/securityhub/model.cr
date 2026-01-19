module AwsSdk
  module SecurityHub
    module Model
      API_VERSION = "2018-10-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "securityhub"
      ENDPOINT_PREFIX = "securityhub"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://securityhub-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://securityhub-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://securityhub.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://securityhub.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ADMINISTRATOR_INVITATION = OperationModel.new(
        name: "AcceptAdministratorInvitation",
        http_method: "POST",
        request_uri: "/administrator"
      )

      ACCEPT_INVITATION = OperationModel.new(
        name: "AcceptInvitation",
        http_method: "POST",
        request_uri: "/master"
      )

      BATCH_DELETE_AUTOMATION_RULES = OperationModel.new(
        name: "BatchDeleteAutomationRules",
        http_method: "POST",
        request_uri: "/automationrules/delete"
      )

      BATCH_DISABLE_STANDARDS = OperationModel.new(
        name: "BatchDisableStandards",
        http_method: "POST",
        request_uri: "/standards/deregister"
      )

      BATCH_ENABLE_STANDARDS = OperationModel.new(
        name: "BatchEnableStandards",
        http_method: "POST",
        request_uri: "/standards/register"
      )

      BATCH_GET_AUTOMATION_RULES = OperationModel.new(
        name: "BatchGetAutomationRules",
        http_method: "POST",
        request_uri: "/automationrules/get"
      )

      BATCH_GET_CONFIGURATION_POLICY_ASSOCIATIONS = OperationModel.new(
        name: "BatchGetConfigurationPolicyAssociations",
        http_method: "POST",
        request_uri: "/configurationPolicyAssociation/batchget"
      )

      BATCH_GET_SECURITY_CONTROLS = OperationModel.new(
        name: "BatchGetSecurityControls",
        http_method: "POST",
        request_uri: "/securityControls/batchGet"
      )

      BATCH_GET_STANDARDS_CONTROL_ASSOCIATIONS = OperationModel.new(
        name: "BatchGetStandardsControlAssociations",
        http_method: "POST",
        request_uri: "/associations/batchGet"
      )

      BATCH_IMPORT_FINDINGS = OperationModel.new(
        name: "BatchImportFindings",
        http_method: "POST",
        request_uri: "/findings/import"
      )

      BATCH_UPDATE_AUTOMATION_RULES = OperationModel.new(
        name: "BatchUpdateAutomationRules",
        http_method: "PATCH",
        request_uri: "/automationrules/update"
      )

      BATCH_UPDATE_FINDINGS = OperationModel.new(
        name: "BatchUpdateFindings",
        http_method: "PATCH",
        request_uri: "/findings/batchupdate"
      )

      BATCH_UPDATE_FINDINGS_V2 = OperationModel.new(
        name: "BatchUpdateFindingsV2",
        http_method: "PATCH",
        request_uri: "/findingsv2/batchupdatev2"
      )

      BATCH_UPDATE_STANDARDS_CONTROL_ASSOCIATIONS = OperationModel.new(
        name: "BatchUpdateStandardsControlAssociations",
        http_method: "PATCH",
        request_uri: "/associations"
      )

      CREATE_ACTION_TARGET = OperationModel.new(
        name: "CreateActionTarget",
        http_method: "POST",
        request_uri: "/actionTargets"
      )

      CREATE_AGGREGATOR_V2 = OperationModel.new(
        name: "CreateAggregatorV2",
        http_method: "POST",
        request_uri: "/aggregatorv2/create"
      )

      CREATE_AUTOMATION_RULE = OperationModel.new(
        name: "CreateAutomationRule",
        http_method: "POST",
        request_uri: "/automationrules/create"
      )

      CREATE_AUTOMATION_RULE_V2 = OperationModel.new(
        name: "CreateAutomationRuleV2",
        http_method: "POST",
        request_uri: "/automationrulesv2/create"
      )

      CREATE_CONFIGURATION_POLICY = OperationModel.new(
        name: "CreateConfigurationPolicy",
        http_method: "POST",
        request_uri: "/configurationPolicy/create"
      )

      CREATE_CONNECTOR_V2 = OperationModel.new(
        name: "CreateConnectorV2",
        http_method: "POST",
        request_uri: "/connectorsv2"
      )

      CREATE_FINDING_AGGREGATOR = OperationModel.new(
        name: "CreateFindingAggregator",
        http_method: "POST",
        request_uri: "/findingAggregator/create"
      )

      CREATE_INSIGHT = OperationModel.new(
        name: "CreateInsight",
        http_method: "POST",
        request_uri: "/insights"
      )

      CREATE_MEMBERS = OperationModel.new(
        name: "CreateMembers",
        http_method: "POST",
        request_uri: "/members"
      )

      CREATE_TICKET_V2 = OperationModel.new(
        name: "CreateTicketV2",
        http_method: "POST",
        request_uri: "/ticketsv2"
      )

      DECLINE_INVITATIONS = OperationModel.new(
        name: "DeclineInvitations",
        http_method: "POST",
        request_uri: "/invitations/decline"
      )

      DELETE_ACTION_TARGET = OperationModel.new(
        name: "DeleteActionTarget",
        http_method: "DELETE",
        request_uri: "/actionTargets/{ActionTargetArn+}"
      )

      DELETE_AGGREGATOR_V2 = OperationModel.new(
        name: "DeleteAggregatorV2",
        http_method: "DELETE",
        request_uri: "/aggregatorv2/delete/{AggregatorV2Arn+}"
      )

      DELETE_AUTOMATION_RULE_V2 = OperationModel.new(
        name: "DeleteAutomationRuleV2",
        http_method: "DELETE",
        request_uri: "/automationrulesv2/{Identifier}"
      )

      DELETE_CONFIGURATION_POLICY = OperationModel.new(
        name: "DeleteConfigurationPolicy",
        http_method: "DELETE",
        request_uri: "/configurationPolicy/{Identifier}"
      )

      DELETE_CONNECTOR_V2 = OperationModel.new(
        name: "DeleteConnectorV2",
        http_method: "DELETE",
        request_uri: "/connectorsv2/{ConnectorId+}"
      )

      DELETE_FINDING_AGGREGATOR = OperationModel.new(
        name: "DeleteFindingAggregator",
        http_method: "DELETE",
        request_uri: "/findingAggregator/delete/{FindingAggregatorArn+}"
      )

      DELETE_INSIGHT = OperationModel.new(
        name: "DeleteInsight",
        http_method: "DELETE",
        request_uri: "/insights/{InsightArn+}"
      )

      DELETE_INVITATIONS = OperationModel.new(
        name: "DeleteInvitations",
        http_method: "POST",
        request_uri: "/invitations/delete"
      )

      DELETE_MEMBERS = OperationModel.new(
        name: "DeleteMembers",
        http_method: "POST",
        request_uri: "/members/delete"
      )

      DESCRIBE_ACTION_TARGETS = OperationModel.new(
        name: "DescribeActionTargets",
        http_method: "POST",
        request_uri: "/actionTargets/get"
      )

      DESCRIBE_HUB = OperationModel.new(
        name: "DescribeHub",
        http_method: "GET",
        request_uri: "/accounts"
      )

      DESCRIBE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeOrganizationConfiguration",
        http_method: "GET",
        request_uri: "/organization/configuration"
      )

      DESCRIBE_PRODUCTS = OperationModel.new(
        name: "DescribeProducts",
        http_method: "GET",
        request_uri: "/products"
      )

      DESCRIBE_PRODUCTS_V2 = OperationModel.new(
        name: "DescribeProductsV2",
        http_method: "GET",
        request_uri: "/productsV2"
      )

      DESCRIBE_SECURITY_HUB_V2 = OperationModel.new(
        name: "DescribeSecurityHubV2",
        http_method: "GET",
        request_uri: "/hubv2"
      )

      DESCRIBE_STANDARDS = OperationModel.new(
        name: "DescribeStandards",
        http_method: "GET",
        request_uri: "/standards"
      )

      DESCRIBE_STANDARDS_CONTROLS = OperationModel.new(
        name: "DescribeStandardsControls",
        http_method: "GET",
        request_uri: "/standards/controls/{StandardsSubscriptionArn+}"
      )

      DISABLE_IMPORT_FINDINGS_FOR_PRODUCT = OperationModel.new(
        name: "DisableImportFindingsForProduct",
        http_method: "DELETE",
        request_uri: "/productSubscriptions/{ProductSubscriptionArn+}"
      )

      DISABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/organization/admin/disable"
      )

      DISABLE_SECURITY_HUB = OperationModel.new(
        name: "DisableSecurityHub",
        http_method: "DELETE",
        request_uri: "/accounts"
      )

      DISABLE_SECURITY_HUB_V2 = OperationModel.new(
        name: "DisableSecurityHubV2",
        http_method: "DELETE",
        request_uri: "/hubv2"
      )

      DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "DisassociateFromAdministratorAccount",
        http_method: "POST",
        request_uri: "/administrator/disassociate"
      )

      DISASSOCIATE_FROM_MASTER_ACCOUNT = OperationModel.new(
        name: "DisassociateFromMasterAccount",
        http_method: "POST",
        request_uri: "/master/disassociate"
      )

      DISASSOCIATE_MEMBERS = OperationModel.new(
        name: "DisassociateMembers",
        http_method: "POST",
        request_uri: "/members/disassociate"
      )

      ENABLE_IMPORT_FINDINGS_FOR_PRODUCT = OperationModel.new(
        name: "EnableImportFindingsForProduct",
        http_method: "POST",
        request_uri: "/productSubscriptions"
      )

      ENABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/organization/admin/enable"
      )

      ENABLE_SECURITY_HUB = OperationModel.new(
        name: "EnableSecurityHub",
        http_method: "POST",
        request_uri: "/accounts"
      )

      ENABLE_SECURITY_HUB_V2 = OperationModel.new(
        name: "EnableSecurityHubV2",
        http_method: "POST",
        request_uri: "/hubv2"
      )

      GET_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "GetAdministratorAccount",
        http_method: "GET",
        request_uri: "/administrator"
      )

      GET_AGGREGATOR_V2 = OperationModel.new(
        name: "GetAggregatorV2",
        http_method: "GET",
        request_uri: "/aggregatorv2/get/{AggregatorV2Arn+}"
      )

      GET_AUTOMATION_RULE_V2 = OperationModel.new(
        name: "GetAutomationRuleV2",
        http_method: "GET",
        request_uri: "/automationrulesv2/{Identifier}"
      )

      GET_CONFIGURATION_POLICY = OperationModel.new(
        name: "GetConfigurationPolicy",
        http_method: "GET",
        request_uri: "/configurationPolicy/get/{Identifier}"
      )

      GET_CONFIGURATION_POLICY_ASSOCIATION = OperationModel.new(
        name: "GetConfigurationPolicyAssociation",
        http_method: "POST",
        request_uri: "/configurationPolicyAssociation/get"
      )

      GET_CONNECTOR_V2 = OperationModel.new(
        name: "GetConnectorV2",
        http_method: "GET",
        request_uri: "/connectorsv2/{ConnectorId+}"
      )

      GET_ENABLED_STANDARDS = OperationModel.new(
        name: "GetEnabledStandards",
        http_method: "POST",
        request_uri: "/standards/get"
      )

      GET_FINDING_AGGREGATOR = OperationModel.new(
        name: "GetFindingAggregator",
        http_method: "GET",
        request_uri: "/findingAggregator/get/{FindingAggregatorArn+}"
      )

      GET_FINDING_HISTORY = OperationModel.new(
        name: "GetFindingHistory",
        http_method: "POST",
        request_uri: "/findingHistory/get"
      )

      GET_FINDING_STATISTICS_V2 = OperationModel.new(
        name: "GetFindingStatisticsV2",
        http_method: "POST",
        request_uri: "/findingsv2/statistics"
      )

      GET_FINDINGS = OperationModel.new(
        name: "GetFindings",
        http_method: "POST",
        request_uri: "/findings"
      )

      GET_FINDINGS_TRENDS_V2 = OperationModel.new(
        name: "GetFindingsTrendsV2",
        http_method: "POST",
        request_uri: "/findingsTrendsv2"
      )

      GET_FINDINGS_V2 = OperationModel.new(
        name: "GetFindingsV2",
        http_method: "POST",
        request_uri: "/findingsv2"
      )

      GET_INSIGHT_RESULTS = OperationModel.new(
        name: "GetInsightResults",
        http_method: "GET",
        request_uri: "/insights/results/{InsightArn+}"
      )

      GET_INSIGHTS = OperationModel.new(
        name: "GetInsights",
        http_method: "POST",
        request_uri: "/insights/get"
      )

      GET_INVITATIONS_COUNT = OperationModel.new(
        name: "GetInvitationsCount",
        http_method: "GET",
        request_uri: "/invitations/count"
      )

      GET_MASTER_ACCOUNT = OperationModel.new(
        name: "GetMasterAccount",
        http_method: "GET",
        request_uri: "/master"
      )

      GET_MEMBERS = OperationModel.new(
        name: "GetMembers",
        http_method: "POST",
        request_uri: "/members/get"
      )

      GET_RESOURCES_STATISTICS_V2 = OperationModel.new(
        name: "GetResourcesStatisticsV2",
        http_method: "POST",
        request_uri: "/resourcesv2/statistics"
      )

      GET_RESOURCES_TRENDS_V2 = OperationModel.new(
        name: "GetResourcesTrendsV2",
        http_method: "POST",
        request_uri: "/resourcesTrendsv2"
      )

      GET_RESOURCES_V2 = OperationModel.new(
        name: "GetResourcesV2",
        http_method: "POST",
        request_uri: "/resourcesv2"
      )

      GET_SECURITY_CONTROL_DEFINITION = OperationModel.new(
        name: "GetSecurityControlDefinition",
        http_method: "GET",
        request_uri: "/securityControl/definition"
      )

      INVITE_MEMBERS = OperationModel.new(
        name: "InviteMembers",
        http_method: "POST",
        request_uri: "/members/invite"
      )

      LIST_AGGREGATORS_V2 = OperationModel.new(
        name: "ListAggregatorsV2",
        http_method: "GET",
        request_uri: "/aggregatorv2/list"
      )

      LIST_AUTOMATION_RULES = OperationModel.new(
        name: "ListAutomationRules",
        http_method: "GET",
        request_uri: "/automationrules/list"
      )

      LIST_AUTOMATION_RULES_V2 = OperationModel.new(
        name: "ListAutomationRulesV2",
        http_method: "GET",
        request_uri: "/automationrulesv2/list"
      )

      LIST_CONFIGURATION_POLICIES = OperationModel.new(
        name: "ListConfigurationPolicies",
        http_method: "GET",
        request_uri: "/configurationPolicy/list"
      )

      LIST_CONFIGURATION_POLICY_ASSOCIATIONS = OperationModel.new(
        name: "ListConfigurationPolicyAssociations",
        http_method: "POST",
        request_uri: "/configurationPolicyAssociation/list"
      )

      LIST_CONNECTORS_V2 = OperationModel.new(
        name: "ListConnectorsV2",
        http_method: "GET",
        request_uri: "/connectorsv2"
      )

      LIST_ENABLED_PRODUCTS_FOR_IMPORT = OperationModel.new(
        name: "ListEnabledProductsForImport",
        http_method: "GET",
        request_uri: "/productSubscriptions"
      )

      LIST_FINDING_AGGREGATORS = OperationModel.new(
        name: "ListFindingAggregators",
        http_method: "GET",
        request_uri: "/findingAggregator/list"
      )

      LIST_INVITATIONS = OperationModel.new(
        name: "ListInvitations",
        http_method: "GET",
        request_uri: "/invitations"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "GET",
        request_uri: "/members"
      )

      LIST_ORGANIZATION_ADMIN_ACCOUNTS = OperationModel.new(
        name: "ListOrganizationAdminAccounts",
        http_method: "GET",
        request_uri: "/organization/admin"
      )

      LIST_SECURITY_CONTROL_DEFINITIONS = OperationModel.new(
        name: "ListSecurityControlDefinitions",
        http_method: "GET",
        request_uri: "/securityControls/definitions"
      )

      LIST_STANDARDS_CONTROL_ASSOCIATIONS = OperationModel.new(
        name: "ListStandardsControlAssociations",
        http_method: "GET",
        request_uri: "/associations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      REGISTER_CONNECTOR_V2 = OperationModel.new(
        name: "RegisterConnectorV2",
        http_method: "POST",
        request_uri: "/connectorsv2/register"
      )

      START_CONFIGURATION_POLICY_ASSOCIATION = OperationModel.new(
        name: "StartConfigurationPolicyAssociation",
        http_method: "POST",
        request_uri: "/configurationPolicyAssociation/associate"
      )

      START_CONFIGURATION_POLICY_DISASSOCIATION = OperationModel.new(
        name: "StartConfigurationPolicyDisassociation",
        http_method: "POST",
        request_uri: "/configurationPolicyAssociation/disassociate"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_ACTION_TARGET = OperationModel.new(
        name: "UpdateActionTarget",
        http_method: "PATCH",
        request_uri: "/actionTargets/{ActionTargetArn+}"
      )

      UPDATE_AGGREGATOR_V2 = OperationModel.new(
        name: "UpdateAggregatorV2",
        http_method: "PATCH",
        request_uri: "/aggregatorv2/update/{AggregatorV2Arn+}"
      )

      UPDATE_AUTOMATION_RULE_V2 = OperationModel.new(
        name: "UpdateAutomationRuleV2",
        http_method: "PATCH",
        request_uri: "/automationrulesv2/{Identifier}"
      )

      UPDATE_CONFIGURATION_POLICY = OperationModel.new(
        name: "UpdateConfigurationPolicy",
        http_method: "PATCH",
        request_uri: "/configurationPolicy/{Identifier}"
      )

      UPDATE_CONNECTOR_V2 = OperationModel.new(
        name: "UpdateConnectorV2",
        http_method: "PATCH",
        request_uri: "/connectorsv2/{ConnectorId+}"
      )

      UPDATE_FINDING_AGGREGATOR = OperationModel.new(
        name: "UpdateFindingAggregator",
        http_method: "PATCH",
        request_uri: "/findingAggregator/update"
      )

      UPDATE_FINDINGS = OperationModel.new(
        name: "UpdateFindings",
        http_method: "PATCH",
        request_uri: "/findings"
      )

      UPDATE_INSIGHT = OperationModel.new(
        name: "UpdateInsight",
        http_method: "PATCH",
        request_uri: "/insights/{InsightArn+}"
      )

      UPDATE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/organization/configuration"
      )

      UPDATE_SECURITY_CONTROL = OperationModel.new(
        name: "UpdateSecurityControl",
        http_method: "PATCH",
        request_uri: "/securityControl/update"
      )

      UPDATE_SECURITY_HUB_CONFIGURATION = OperationModel.new(
        name: "UpdateSecurityHubConfiguration",
        http_method: "PATCH",
        request_uri: "/accounts"
      )

      UPDATE_STANDARDS_CONTROL = OperationModel.new(
        name: "UpdateStandardsControl",
        http_method: "PATCH",
        request_uri: "/standards/control/{StandardsControlArn+}"
      )
    end
  end
end
