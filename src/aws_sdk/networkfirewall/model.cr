module AwsSdk
  module NetworkFirewall
    module Model
      API_VERSION = "2020-11-12"
      TARGET_PREFIX = "NetworkFirewall_20201112"
      SIGNING_NAME = "network-firewall"
      ENDPOINT_PREFIX = "network-firewall"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://network-firewall-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://network-firewall-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://network-firewall.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://network-firewall.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "AcceptNetworkFirewallTransitGatewayAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_AVAILABILITY_ZONES = OperationModel.new(
        name: "AssociateAvailabilityZones",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_FIREWALL_POLICY = OperationModel.new(
        name: "AssociateFirewallPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SUBNETS = OperationModel.new(
        name: "AssociateSubnets",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_RULE_GROUPS_TO_PROXY_CONFIGURATION = OperationModel.new(
        name: "AttachRuleGroupsToProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FIREWALL = OperationModel.new(
        name: "CreateFirewall",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FIREWALL_POLICY = OperationModel.new(
        name: "CreateFirewallPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROXY = OperationModel.new(
        name: "CreateProxy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROXY_CONFIGURATION = OperationModel.new(
        name: "CreateProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROXY_RULE_GROUP = OperationModel.new(
        name: "CreateProxyRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROXY_RULES = OperationModel.new(
        name: "CreateProxyRules",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE_GROUP = OperationModel.new(
        name: "CreateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TLS_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "CreateTLSInspectionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENDPOINT_ASSOCIATION = OperationModel.new(
        name: "CreateVpcEndpointAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL = OperationModel.new(
        name: "DeleteFirewall",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL_POLICY = OperationModel.new(
        name: "DeleteFirewallPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "DeleteNetworkFirewallTransitGatewayAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROXY = OperationModel.new(
        name: "DeleteProxy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROXY_CONFIGURATION = OperationModel.new(
        name: "DeleteProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROXY_RULE_GROUP = OperationModel.new(
        name: "DeleteProxyRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROXY_RULES = OperationModel.new(
        name: "DeleteProxyRules",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE_GROUP = OperationModel.new(
        name: "DeleteRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TLS_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "DeleteTLSInspectionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENDPOINT_ASSOCIATION = OperationModel.new(
        name: "DeleteVpcEndpointAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FIREWALL = OperationModel.new(
        name: "DescribeFirewall",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FIREWALL_METADATA = OperationModel.new(
        name: "DescribeFirewallMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FIREWALL_POLICY = OperationModel.new(
        name: "DescribeFirewallPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLOW_OPERATION = OperationModel.new(
        name: "DescribeFlowOperation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DescribeLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROXY = OperationModel.new(
        name: "DescribeProxy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROXY_CONFIGURATION = OperationModel.new(
        name: "DescribeProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROXY_RULE = OperationModel.new(
        name: "DescribeProxyRule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROXY_RULE_GROUP = OperationModel.new(
        name: "DescribeProxyRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULE_GROUP = OperationModel.new(
        name: "DescribeRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULE_GROUP_METADATA = OperationModel.new(
        name: "DescribeRuleGroupMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULE_GROUP_SUMMARY = OperationModel.new(
        name: "DescribeRuleGroupSummary",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TLS_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "DescribeTLSInspectionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_ASSOCIATION = OperationModel.new(
        name: "DescribeVpcEndpointAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_RULE_GROUPS_FROM_PROXY_CONFIGURATION = OperationModel.new(
        name: "DetachRuleGroupsFromProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_AVAILABILITY_ZONES = OperationModel.new(
        name: "DisassociateAvailabilityZones",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SUBNETS = OperationModel.new(
        name: "DisassociateSubnets",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ANALYSIS_REPORT_RESULTS = OperationModel.new(
        name: "GetAnalysisReportResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ANALYSIS_REPORTS = OperationModel.new(
        name: "ListAnalysisReports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_POLICIES = OperationModel.new(
        name: "ListFirewallPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALLS = OperationModel.new(
        name: "ListFirewalls",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLOW_OPERATION_RESULTS = OperationModel.new(
        name: "ListFlowOperationResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLOW_OPERATIONS = OperationModel.new(
        name: "ListFlowOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROXIES = OperationModel.new(
        name: "ListProxies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROXY_CONFIGURATIONS = OperationModel.new(
        name: "ListProxyConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROXY_RULE_GROUPS = OperationModel.new(
        name: "ListProxyRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_GROUPS = OperationModel.new(
        name: "ListRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TLS_INSPECTION_CONFIGURATIONS = OperationModel.new(
        name: "ListTLSInspectionConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VPC_ENDPOINT_ASSOCIATIONS = OperationModel.new(
        name: "ListVpcEndpointAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "RejectNetworkFirewallTransitGatewayAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      START_ANALYSIS_REPORT = OperationModel.new(
        name: "StartAnalysisReport",
        http_method: "POST",
        request_uri: "/"
      )

      START_FLOW_CAPTURE = OperationModel.new(
        name: "StartFlowCapture",
        http_method: "POST",
        request_uri: "/"
      )

      START_FLOW_FLUSH = OperationModel.new(
        name: "StartFlowFlush",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AVAILABILITY_ZONE_CHANGE_PROTECTION = OperationModel.new(
        name: "UpdateAvailabilityZoneChangeProtection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_ANALYSIS_SETTINGS = OperationModel.new(
        name: "UpdateFirewallAnalysisSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_DELETE_PROTECTION = OperationModel.new(
        name: "UpdateFirewallDeleteProtection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_DESCRIPTION = OperationModel.new(
        name: "UpdateFirewallDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "UpdateFirewallEncryptionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_POLICY = OperationModel.new(
        name: "UpdateFirewallPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_POLICY_CHANGE_PROTECTION = OperationModel.new(
        name: "UpdateFirewallPolicyChangeProtection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "UpdateLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROXY = OperationModel.new(
        name: "UpdateProxy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROXY_CONFIGURATION = OperationModel.new(
        name: "UpdateProxyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROXY_RULE = OperationModel.new(
        name: "UpdateProxyRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROXY_RULE_GROUP_PRIORITIES = OperationModel.new(
        name: "UpdateProxyRuleGroupPriorities",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROXY_RULE_PRIORITIES = OperationModel.new(
        name: "UpdateProxyRulePriorities",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_GROUP = OperationModel.new(
        name: "UpdateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SUBNET_CHANGE_PROTECTION = OperationModel.new(
        name: "UpdateSubnetChangeProtection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TLS_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "UpdateTLSInspectionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
