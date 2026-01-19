module AwsSdk
  module Route53GlobalResolver
    module Model
      API_VERSION = "2022-09-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "route53globalresolver"
      ENDPOINT_PREFIX = "route53globalresolver"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://route53globalresolver-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://route53globalresolver.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_HOSTED_ZONE = OperationModel.new(
        name: "AssociateHostedZone",
        http_method: "POST",
        request_uri: "/hosted-zone-associations/{hostedZoneId}"
      )

      BATCH_CREATE_FIREWALL_RULE = OperationModel.new(
        name: "BatchCreateFirewallRule",
        http_method: "POST",
        request_uri: "/firewall-rules/batch-create"
      )

      BATCH_DELETE_FIREWALL_RULE = OperationModel.new(
        name: "BatchDeleteFirewallRule",
        http_method: "POST",
        request_uri: "/firewall-rules/batch-delete"
      )

      BATCH_UPDATE_FIREWALL_RULE = OperationModel.new(
        name: "BatchUpdateFirewallRule",
        http_method: "POST",
        request_uri: "/firewall-rules/batch-update"
      )

      CREATE_ACCESS_SOURCE = OperationModel.new(
        name: "CreateAccessSource",
        http_method: "POST",
        request_uri: "/access-sources"
      )

      CREATE_ACCESS_TOKEN = OperationModel.new(
        name: "CreateAccessToken",
        http_method: "POST",
        request_uri: "/tokens/{dnsViewId}"
      )

      CREATE_DNS_VIEW = OperationModel.new(
        name: "CreateDNSView",
        http_method: "POST",
        request_uri: "/dns-views/{globalResolverId}"
      )

      CREATE_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "CreateFirewallDomainList",
        http_method: "POST",
        request_uri: "/firewall-domain-lists/{globalResolverId}"
      )

      CREATE_FIREWALL_RULE = OperationModel.new(
        name: "CreateFirewallRule",
        http_method: "POST",
        request_uri: "/firewall-rules"
      )

      CREATE_GLOBAL_RESOLVER = OperationModel.new(
        name: "CreateGlobalResolver",
        http_method: "POST",
        request_uri: "/global-resolver"
      )

      DELETE_ACCESS_SOURCE = OperationModel.new(
        name: "DeleteAccessSource",
        http_method: "DELETE",
        request_uri: "/access-sources/{accessSourceId}"
      )

      DELETE_ACCESS_TOKEN = OperationModel.new(
        name: "DeleteAccessToken",
        http_method: "DELETE",
        request_uri: "/tokens/{accessTokenId}"
      )

      DELETE_DNS_VIEW = OperationModel.new(
        name: "DeleteDNSView",
        http_method: "DELETE",
        request_uri: "/dns-views/{dnsViewId}"
      )

      DELETE_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "DeleteFirewallDomainList",
        http_method: "DELETE",
        request_uri: "/firewall-domain-lists/{firewallDomainListId}"
      )

      DELETE_FIREWALL_RULE = OperationModel.new(
        name: "DeleteFirewallRule",
        http_method: "DELETE",
        request_uri: "/firewall-rules/{firewallRuleId}"
      )

      DELETE_GLOBAL_RESOLVER = OperationModel.new(
        name: "DeleteGlobalResolver",
        http_method: "DELETE",
        request_uri: "/global-resolver/{globalResolverId}"
      )

      DISABLE_DNS_VIEW = OperationModel.new(
        name: "DisableDNSView",
        http_method: "PATCH",
        request_uri: "/dns-views/{dnsViewId}/disable"
      )

      DISASSOCIATE_HOSTED_ZONE = OperationModel.new(
        name: "DisassociateHostedZone",
        http_method: "DELETE",
        request_uri: "/hosted-zone-associations/hosted-zone/{hostedZoneId}/resource-arn/{resourceArn+}"
      )

      ENABLE_DNS_VIEW = OperationModel.new(
        name: "EnableDNSView",
        http_method: "PATCH",
        request_uri: "/dns-views/{dnsViewId}/enable"
      )

      GET_ACCESS_SOURCE = OperationModel.new(
        name: "GetAccessSource",
        http_method: "GET",
        request_uri: "/access-sources/{accessSourceId}"
      )

      GET_ACCESS_TOKEN = OperationModel.new(
        name: "GetAccessToken",
        http_method: "GET",
        request_uri: "/tokens/{accessTokenId}"
      )

      GET_DNS_VIEW = OperationModel.new(
        name: "GetDNSView",
        http_method: "GET",
        request_uri: "/dns-views/{dnsViewId}"
      )

      GET_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "GetFirewallDomainList",
        http_method: "GET",
        request_uri: "/firewall-domain-lists/{firewallDomainListId}"
      )

      GET_FIREWALL_RULE = OperationModel.new(
        name: "GetFirewallRule",
        http_method: "GET",
        request_uri: "/firewall-rules/{firewallRuleId}"
      )

      GET_GLOBAL_RESOLVER = OperationModel.new(
        name: "GetGlobalResolver",
        http_method: "GET",
        request_uri: "/global-resolver/{globalResolverId}"
      )

      GET_HOSTED_ZONE_ASSOCIATION = OperationModel.new(
        name: "GetHostedZoneAssociation",
        http_method: "GET",
        request_uri: "/hosted-zone-associations/{hostedZoneAssociationId}"
      )

      GET_MANAGED_FIREWALL_DOMAIN_LIST = OperationModel.new(
        name: "GetManagedFirewallDomainList",
        http_method: "GET",
        request_uri: "/managed-firewall-domain-lists/{managedFirewallDomainListId}"
      )

      IMPORT_FIREWALL_DOMAINS = OperationModel.new(
        name: "ImportFirewallDomains",
        http_method: "PATCH",
        request_uri: "/firewall-domain-lists/{firewallDomainListId}/domains/s3_file_url"
      )

      LIST_ACCESS_SOURCES = OperationModel.new(
        name: "ListAccessSources",
        http_method: "GET",
        request_uri: "/access-sources"
      )

      LIST_ACCESS_TOKENS = OperationModel.new(
        name: "ListAccessTokens",
        http_method: "GET",
        request_uri: "/tokens/dns-view/{dnsViewId}"
      )

      LIST_DNS_VIEWS = OperationModel.new(
        name: "ListDNSViews",
        http_method: "GET",
        request_uri: "/dns-views/resolver/{globalResolverId}"
      )

      LIST_FIREWALL_DOMAIN_LISTS = OperationModel.new(
        name: "ListFirewallDomainLists",
        http_method: "GET",
        request_uri: "/firewall-domain-lists"
      )

      LIST_FIREWALL_DOMAINS = OperationModel.new(
        name: "ListFirewallDomains",
        http_method: "GET",
        request_uri: "/firewall-domain-lists/{firewallDomainListId}/domains"
      )

      LIST_FIREWALL_RULES = OperationModel.new(
        name: "ListFirewallRules",
        http_method: "GET",
        request_uri: "/firewall-rules"
      )

      LIST_GLOBAL_RESOLVERS = OperationModel.new(
        name: "ListGlobalResolvers",
        http_method: "GET",
        request_uri: "/global-resolver"
      )

      LIST_HOSTED_ZONE_ASSOCIATIONS = OperationModel.new(
        name: "ListHostedZoneAssociations",
        http_method: "GET",
        request_uri: "/hosted-zone-associations/resource-arn/{resourceArn+}"
      )

      LIST_MANAGED_FIREWALL_DOMAIN_LISTS = OperationModel.new(
        name: "ListManagedFirewallDomainLists",
        http_method: "GET",
        request_uri: "/list-managed-firewall-domain-lists/{managedFirewallDomainListType}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/get-all-tags"
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

      UPDATE_ACCESS_SOURCE = OperationModel.new(
        name: "UpdateAccessSource",
        http_method: "PATCH",
        request_uri: "/access-sources/{accessSourceId}"
      )

      UPDATE_ACCESS_TOKEN = OperationModel.new(
        name: "UpdateAccessToken",
        http_method: "PATCH",
        request_uri: "/tokens/{accessTokenId}"
      )

      UPDATE_DNS_VIEW = OperationModel.new(
        name: "UpdateDNSView",
        http_method: "PATCH",
        request_uri: "/dns-views/{dnsViewId}"
      )

      UPDATE_FIREWALL_DOMAINS = OperationModel.new(
        name: "UpdateFirewallDomains",
        http_method: "PATCH",
        request_uri: "/firewall-domain-lists/{firewallDomainListId}/domains"
      )

      UPDATE_FIREWALL_RULE = OperationModel.new(
        name: "UpdateFirewallRule",
        http_method: "PATCH",
        request_uri: "/firewall-rules/{firewallRuleId}"
      )

      UPDATE_GLOBAL_RESOLVER = OperationModel.new(
        name: "UpdateGlobalResolver",
        http_method: "PATCH",
        request_uri: "/global-resolver/{globalResolverId}"
      )

      UPDATE_HOSTED_ZONE_ASSOCIATION = OperationModel.new(
        name: "UpdateHostedZoneAssociation",
        http_method: "PATCH",
        request_uri: "/hosted-zone-associations/{hostedZoneAssociationId}"
      )
    end
  end
end
