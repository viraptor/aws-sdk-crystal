module Aws
  module Route53Resolver
    module Model
      API_VERSION = "2018-04-01"
      TARGET_PREFIX = "Route53Resolver"
      SIGNING_NAME = "route53resolver"
      ENDPOINT_PREFIX = "route53resolver"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53resolver-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://route53resolver.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://route53resolver.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://route53resolver-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53resolver.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://route53resolver.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_FIREWALL_RULE_GROUP = OperationModel.new(
        name: "AssociateFirewallRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_RESOLVER_ENDPOINT_IP_ADDRESS = OperationModel.new(
        name: "AssociateResolverEndpointIpAddress",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_RESOLVER_QUERY_LOG_CONFIG = OperationModel.new(
        name: "AssociateResolverQueryLogConfig",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_RESOLVER_RULE = OperationModel.new(
        name: "AssociateResolverRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "CreateFirewallDomainList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FIREWALL_RULE = OperationModel.new(
        name: "CreateFirewallRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FIREWALL_RULE_GROUP = OperationModel.new(
        name: "CreateFirewallRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OUTPOST_RESOLVER = OperationModel.new(
        name: "CreateOutpostResolver",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOLVER_ENDPOINT = OperationModel.new(
        name: "CreateResolverEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOLVER_QUERY_LOG_CONFIG = OperationModel.new(
        name: "CreateResolverQueryLogConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOLVER_RULE = OperationModel.new(
        name: "CreateResolverRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "DeleteFirewallDomainList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL_RULE = OperationModel.new(
        name: "DeleteFirewallRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL_RULE_GROUP = OperationModel.new(
        name: "DeleteFirewallRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OUTPOST_RESOLVER = OperationModel.new(
        name: "DeleteOutpostResolver",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOLVER_ENDPOINT = OperationModel.new(
        name: "DeleteResolverEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOLVER_QUERY_LOG_CONFIG = OperationModel.new(
        name: "DeleteResolverQueryLogConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOLVER_RULE = OperationModel.new(
        name: "DeleteResolverRule",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FIREWALL_RULE_GROUP = OperationModel.new(
        name: "DisassociateFirewallRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_RESOLVER_ENDPOINT_IP_ADDRESS = OperationModel.new(
        name: "DisassociateResolverEndpointIpAddress",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_RESOLVER_QUERY_LOG_CONFIG = OperationModel.new(
        name: "DisassociateResolverQueryLogConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_RESOLVER_RULE = OperationModel.new(
        name: "DisassociateResolverRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FIREWALL_CONFIG = OperationModel.new(
        name: "GetFirewallConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "GetFirewallDomainList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FIREWALL_RULE_GROUP = OperationModel.new(
        name: "GetFirewallRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FIREWALL_RULE_GROUP_ASSOCIATION = OperationModel.new(
        name: "GetFirewallRuleGroupAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FIREWALL_RULE_GROUP_POLICY = OperationModel.new(
        name: "GetFirewallRuleGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OUTPOST_RESOLVER = OperationModel.new(
        name: "GetOutpostResolver",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_CONFIG = OperationModel.new(
        name: "GetResolverConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_DNSSEC_CONFIG = OperationModel.new(
        name: "GetResolverDnssecConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_ENDPOINT = OperationModel.new(
        name: "GetResolverEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_QUERY_LOG_CONFIG = OperationModel.new(
        name: "GetResolverQueryLogConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_QUERY_LOG_CONFIG_ASSOCIATION = OperationModel.new(
        name: "GetResolverQueryLogConfigAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_QUERY_LOG_CONFIG_POLICY = OperationModel.new(
        name: "GetResolverQueryLogConfigPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_RULE = OperationModel.new(
        name: "GetResolverRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_RULE_ASSOCIATION = OperationModel.new(
        name: "GetResolverRuleAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOLVER_RULE_POLICY = OperationModel.new(
        name: "GetResolverRulePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_FIREWALL_DOMAINS = OperationModel.new(
        name: "ImportFirewallDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_CONFIGS = OperationModel.new(
        name: "ListFirewallConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_DOMAIN_LISTS = OperationModel.new(
        name: "ListFirewallDomainLists",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_DOMAINS = OperationModel.new(
        name: "ListFirewallDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_RULE_GROUP_ASSOCIATIONS = OperationModel.new(
        name: "ListFirewallRuleGroupAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_RULE_GROUPS = OperationModel.new(
        name: "ListFirewallRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FIREWALL_RULES = OperationModel.new(
        name: "ListFirewallRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OUTPOST_RESOLVERS = OperationModel.new(
        name: "ListOutpostResolvers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_CONFIGS = OperationModel.new(
        name: "ListResolverConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_DNSSEC_CONFIGS = OperationModel.new(
        name: "ListResolverDnssecConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_ENDPOINT_IP_ADDRESSES = OperationModel.new(
        name: "ListResolverEndpointIpAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_ENDPOINTS = OperationModel.new(
        name: "ListResolverEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_QUERY_LOG_CONFIG_ASSOCIATIONS = OperationModel.new(
        name: "ListResolverQueryLogConfigAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_QUERY_LOG_CONFIGS = OperationModel.new(
        name: "ListResolverQueryLogConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_RULE_ASSOCIATIONS = OperationModel.new(
        name: "ListResolverRuleAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOLVER_RULES = OperationModel.new(
        name: "ListResolverRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_FIREWALL_RULE_GROUP_POLICY = OperationModel.new(
        name: "PutFirewallRuleGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOLVER_QUERY_LOG_CONFIG_POLICY = OperationModel.new(
        name: "PutResolverQueryLogConfigPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOLVER_RULE_POLICY = OperationModel.new(
        name: "PutResolverRulePolicy",
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

      UPDATE_FIREWALL_CONFIG = OperationModel.new(
        name: "UpdateFirewallConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_DOMAINS = OperationModel.new(
        name: "UpdateFirewallDomains",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_RULE = OperationModel.new(
        name: "UpdateFirewallRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FIREWALL_RULE_GROUP_ASSOCIATION = OperationModel.new(
        name: "UpdateFirewallRuleGroupAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_OUTPOST_RESOLVER = OperationModel.new(
        name: "UpdateOutpostResolver",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOLVER_CONFIG = OperationModel.new(
        name: "UpdateResolverConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOLVER_DNSSEC_CONFIG = OperationModel.new(
        name: "UpdateResolverDnssecConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOLVER_ENDPOINT = OperationModel.new(
        name: "UpdateResolverEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOLVER_RULE = OperationModel.new(
        name: "UpdateResolverRule",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
