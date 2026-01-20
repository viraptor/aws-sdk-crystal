module Aws
  module Route53GlobalResolver
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

      # Associates a Route 53 private hosted zone with a Route 53 Global Resolver resource. This allows the
      # resolver to resolve DNS queries for the private hosted zone from anywhere globally.

      def associate_hosted_zone(
        hosted_zone_id : String,
        name : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::AssociateHostedZoneInput.new(hosted_zone_id: hosted_zone_id, name: name, resource_arn: resource_arn)
        associate_hosted_zone(input)
      end

      def associate_hosted_zone(input : Types::AssociateHostedZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_HOSTED_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates multiple DNS firewall rules in a single operation. This is more efficient than creating
      # rules individually when you need to set up multiple rules at once.

      def batch_create_firewall_rule(
        firewall_rules : Array(Types::BatchCreateFirewallRuleInputItem)
      ) : Protocol::Request
        input = Types::BatchCreateFirewallRuleInput.new(firewall_rules: firewall_rules)
        batch_create_firewall_rule(input)
      end

      def batch_create_firewall_rule(input : Types::BatchCreateFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes multiple DNS firewall rules in a single operation. This is more efficient than deleting
      # rules individually.

      def batch_delete_firewall_rule(
        firewall_rules : Array(Types::BatchDeleteFirewallRuleInputItem)
      ) : Protocol::Request
        input = Types::BatchDeleteFirewallRuleInput.new(firewall_rules: firewall_rules)
        batch_delete_firewall_rule(input)
      end

      def batch_delete_firewall_rule(input : Types::BatchDeleteFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates multiple DNS firewall rules in a single operation. This is more efficient than updating
      # rules individually.

      def batch_update_firewall_rule(
        firewall_rules : Array(Types::BatchUpdateFirewallRuleInputItem)
      ) : Protocol::Request
        input = Types::BatchUpdateFirewallRuleInput.new(firewall_rules: firewall_rules)
        batch_update_firewall_rule(input)
      end

      def batch_update_firewall_rule(input : Types::BatchUpdateFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an access source for a DNS view. Access sources define IP addresses or CIDR ranges that are
      # allowed to send DNS queries to the Route 53 Global Resolver, along with the permitted DNS protocols.

      def create_access_source(
        cidr : String,
        dns_view_id : String,
        protocol : String,
        client_token : String? = nil,
        ip_address_type : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessSourceInput.new(cidr: cidr, dns_view_id: dns_view_id, protocol: protocol, client_token: client_token, ip_address_type: ip_address_type, name: name, tags: tags)
        create_access_source(input)
      end

      def create_access_source(input : Types::CreateAccessSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an access token for a DNS view. Access tokens provide token-based authentication for
      # DNS-over-HTTPS (DoH) and DNS-over-TLS (DoT) connections to the Route 53 Global Resolver.

      def create_access_token(
        dns_view_id : String,
        client_token : String? = nil,
        expires_at : Time? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessTokenInput.new(dns_view_id: dns_view_id, client_token: client_token, expires_at: expires_at, name: name, tags: tags)
        create_access_token(input)
      end

      def create_access_token(input : Types::CreateAccessTokenInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a DNS view within a Route 53 Global Resolver. A DNS view models end users, user groups,
      # networks, and devices, and serves as a parent resource that holds configurations controlling access,
      # authorization, DNS firewall rules, and forwarding rules.

      def create_dns_view(
        global_resolver_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        dnssec_validation : String? = nil,
        edns_client_subnet : String? = nil,
        firewall_rules_fail_open : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDNSViewInput.new(global_resolver_id: global_resolver_id, name: name, client_token: client_token, description: description, dnssec_validation: dnssec_validation, edns_client_subnet: edns_client_subnet, firewall_rules_fail_open: firewall_rules_fail_open, tags: tags)
        create_dns_view(input)
      end

      def create_dns_view(input : Types::CreateDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a firewall domain list. Domain lists are reusable sets of domain specifications that you use
      # in DNS firewall rules to allow, block, or alert on DNS queries to specific domains.

      def create_firewall_domain_list(
        global_resolver_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFirewallDomainListInput.new(global_resolver_id: global_resolver_id, name: name, client_token: client_token, description: description, tags: tags)
        create_firewall_domain_list(input)
      end

      def create_firewall_domain_list(input : Types::CreateFirewallDomainListInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FIREWALL_DOMAIN_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a DNS firewall rule. Firewall rules define actions (ALLOW, BLOCK, or ALERT) to take on DNS
      # queries that match specified domain lists, managed domain lists, or advanced threat protections.

      def create_firewall_rule(
        action : String,
        dns_view_id : String,
        name : String,
        block_override_dns_type : String? = nil,
        block_override_domain : String? = nil,
        block_override_ttl : Int32? = nil,
        block_response : String? = nil,
        client_token : String? = nil,
        confidence_threshold : String? = nil,
        description : String? = nil,
        dns_advanced_protection : String? = nil,
        firewall_domain_list_id : String? = nil,
        priority : Int64? = nil,
        q_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateFirewallRuleInput.new(action: action, dns_view_id: dns_view_id, name: name, block_override_dns_type: block_override_dns_type, block_override_domain: block_override_domain, block_override_ttl: block_override_ttl, block_response: block_response, client_token: client_token, confidence_threshold: confidence_threshold, description: description, dns_advanced_protection: dns_advanced_protection, firewall_domain_list_id: firewall_domain_list_id, priority: priority, q_type: q_type)
        create_firewall_rule(input)
      end

      def create_firewall_rule(input : Types::CreateFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Route 53 Global Resolver instance. A Route 53 Global Resolver is a global,
      # internet-accessible DNS resolver that provides secure DNS resolution for both public and private
      # domains through global anycast IP addresses.

      def create_global_resolver(
        name : String,
        regions : Array(String),
        client_token : String? = nil,
        description : String? = nil,
        observability_region : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGlobalResolverInput.new(name: name, regions: regions, client_token: client_token, description: description, observability_region: observability_region, tags: tags)
        create_global_resolver(input)
      end

      def create_global_resolver(input : Types::CreateGlobalResolverInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GLOBAL_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an access source. This operation cannot be undone.

      def delete_access_source(
        access_source_id : String
      ) : Protocol::Request
        input = Types::DeleteAccessSourceInput.new(access_source_id: access_source_id)
        delete_access_source(input)
      end

      def delete_access_source(input : Types::DeleteAccessSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an access token. This operation cannot be undone.

      def delete_access_token(
        access_token_id : String
      ) : Protocol::Request
        input = Types::DeleteAccessTokenInput.new(access_token_id: access_token_id)
        delete_access_token(input)
      end

      def delete_access_token(input : Types::DeleteAccessTokenInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a DNS view. This operation cannot be undone.

      def delete_dns_view(
        dns_view_id : String
      ) : Protocol::Request
        input = Types::DeleteDNSViewInput.new(dns_view_id: dns_view_id)
        delete_dns_view(input)
      end

      def delete_dns_view(input : Types::DeleteDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a firewall domain list. This operation cannot be undone.

      def delete_firewall_domain_list(
        firewall_domain_list_id : String
      ) : Protocol::Request
        input = Types::DeleteFirewallDomainListInput.new(firewall_domain_list_id: firewall_domain_list_id)
        delete_firewall_domain_list(input)
      end

      def delete_firewall_domain_list(input : Types::DeleteFirewallDomainListInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FIREWALL_DOMAIN_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a DNS firewall rule. This operation cannot be undone.

      def delete_firewall_rule(
        firewall_rule_id : String
      ) : Protocol::Request
        input = Types::DeleteFirewallRuleInput.new(firewall_rule_id: firewall_rule_id)
        delete_firewall_rule(input)
      end

      def delete_firewall_rule(input : Types::DeleteFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Route 53 Global Resolver instance. This operation cannot be undone. All associated DNS
      # views, access sources, tokens, and firewall rules are also deleted.

      def delete_global_resolver(
        global_resolver_id : String
      ) : Protocol::Request
        input = Types::DeleteGlobalResolverInput.new(global_resolver_id: global_resolver_id)
        delete_global_resolver(input)
      end

      def delete_global_resolver(input : Types::DeleteGlobalResolverInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GLOBAL_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables a DNS view, preventing it from serving DNS queries.

      def disable_dns_view(
        dns_view_id : String
      ) : Protocol::Request
        input = Types::DisableDNSViewInput.new(dns_view_id: dns_view_id)
        disable_dns_view(input)
      end

      def disable_dns_view(input : Types::DisableDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a Route 53 private hosted zone from a Route 53 Global Resolver resource.

      def disassociate_hosted_zone(
        hosted_zone_id : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::DisassociateHostedZoneInput.new(hosted_zone_id: hosted_zone_id, resource_arn: resource_arn)
        disassociate_hosted_zone(input)
      end

      def disassociate_hosted_zone(input : Types::DisassociateHostedZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_HOSTED_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables a disabled DNS view, allowing it to serve DNS queries again.

      def enable_dns_view(
        dns_view_id : String
      ) : Protocol::Request
        input = Types::EnableDNSViewInput.new(dns_view_id: dns_view_id)
        enable_dns_view(input)
      end

      def enable_dns_view(input : Types::EnableDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an access source.

      def get_access_source(
        access_source_id : String
      ) : Protocol::Request
        input = Types::GetAccessSourceInput.new(access_source_id: access_source_id)
        get_access_source(input)
      end

      def get_access_source(input : Types::GetAccessSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCESS_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an access token.

      def get_access_token(
        access_token_id : String
      ) : Protocol::Request
        input = Types::GetAccessTokenInput.new(access_token_id: access_token_id)
        get_access_token(input)
      end

      def get_access_token(input : Types::GetAccessTokenInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a DNS view.

      def get_dns_view(
        dns_view_id : String
      ) : Protocol::Request
        input = Types::GetDNSViewInput.new(dns_view_id: dns_view_id)
        get_dns_view(input)
      end

      def get_dns_view(input : Types::GetDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a firewall domain list.

      def get_firewall_domain_list(
        firewall_domain_list_id : String
      ) : Protocol::Request
        input = Types::GetFirewallDomainListInput.new(firewall_domain_list_id: firewall_domain_list_id)
        get_firewall_domain_list(input)
      end

      def get_firewall_domain_list(input : Types::GetFirewallDomainListInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FIREWALL_DOMAIN_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a DNS firewall rule.

      def get_firewall_rule(
        firewall_rule_id : String
      ) : Protocol::Request
        input = Types::GetFirewallRuleInput.new(firewall_rule_id: firewall_rule_id)
        get_firewall_rule(input)
      end

      def get_firewall_rule(input : Types::GetFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a Route 53 Global Resolver instance.

      def get_global_resolver(
        global_resolver_id : String
      ) : Protocol::Request
        input = Types::GetGlobalResolverInput.new(global_resolver_id: global_resolver_id)
        get_global_resolver(input)
      end

      def get_global_resolver(input : Types::GetGlobalResolverInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOBAL_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a hosted zone association.

      def get_hosted_zone_association(
        hosted_zone_association_id : String
      ) : Protocol::Request
        input = Types::GetHostedZoneAssociationInput.new(hosted_zone_association_id: hosted_zone_association_id)
        get_hosted_zone_association(input)
      end

      def get_hosted_zone_association(input : Types::GetHostedZoneAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_HOSTED_ZONE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an AWS-managed firewall domain list. Managed domain lists contain
      # domains associated with malicious activity, content categories, or specific threats.

      def get_managed_firewall_domain_list(
        managed_firewall_domain_list_id : String
      ) : Protocol::Request
        input = Types::GetManagedFirewallDomainListInput.new(managed_firewall_domain_list_id: managed_firewall_domain_list_id)
        get_managed_firewall_domain_list(input)
      end

      def get_managed_firewall_domain_list(input : Types::GetManagedFirewallDomainListInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_FIREWALL_DOMAIN_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a list of domains from an Amazon S3 file into a firewall domain list. The file should
      # contain one domain per line.

      def import_firewall_domains(
        domain_file_url : String,
        firewall_domain_list_id : String,
        operation : String
      ) : Protocol::Request
        input = Types::ImportFirewallDomainsInput.new(domain_file_url: domain_file_url, firewall_domain_list_id: firewall_domain_list_id, operation: operation)
        import_firewall_domains(input)
      end

      def import_firewall_domains(input : Types::ImportFirewallDomainsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_FIREWALL_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all access sources with pagination support.

      def list_access_sources(
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessSourcesInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_access_sources(input)
      end

      def list_access_sources(input : Types::ListAccessSourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all access tokens for a DNS view with pagination support.

      def list_access_tokens(
        dns_view_id : String,
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessTokensInput.new(dns_view_id: dns_view_id, filters: filters, max_results: max_results, next_token: next_token)
        list_access_tokens(input)
      end

      def list_access_tokens(input : Types::ListAccessTokensInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_TOKENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all DNS views for a Route 53 Global Resolver with pagination support.

      def list_dns_views(
        global_resolver_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDNSViewsInput.new(global_resolver_id: global_resolver_id, max_results: max_results, next_token: next_token)
        list_dns_views(input)
      end

      def list_dns_views(input : Types::ListDNSViewsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DNS_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all firewall domain lists for a Route 53 Global Resolver with pagination support.

      def list_firewall_domain_lists(
        global_resolver_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFirewallDomainListsInput.new(global_resolver_id: global_resolver_id, max_results: max_results, next_token: next_token)
        list_firewall_domain_lists(input)
      end

      def list_firewall_domain_lists(input : Types::ListFirewallDomainListsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FIREWALL_DOMAIN_LISTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the domains in DNS Firewall domain list you have created.

      def list_firewall_domains(
        firewall_domain_list_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFirewallDomainsInput.new(firewall_domain_list_id: firewall_domain_list_id, max_results: max_results, next_token: next_token)
        list_firewall_domains(input)
      end

      def list_firewall_domains(input : Types::ListFirewallDomainsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FIREWALL_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all DNS firewall rules for a DNS view with pagination support.

      def list_firewall_rules(
        dns_view_id : String,
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFirewallRulesInput.new(dns_view_id: dns_view_id, filters: filters, max_results: max_results, next_token: next_token)
        list_firewall_rules(input)
      end

      def list_firewall_rules(input : Types::ListFirewallRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FIREWALL_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Route 53 Global Resolver instances in your account with pagination support.

      def list_global_resolvers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGlobalResolversInput.new(max_results: max_results, next_token: next_token)
        list_global_resolvers(input)
      end

      def list_global_resolvers(input : Types::ListGlobalResolversInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GLOBAL_RESOLVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all hosted zone associations for a Route 53 Global Resolver resource with pagination support.

      def list_hosted_zone_associations(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListHostedZoneAssociationsInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_hosted_zone_associations(input)
      end

      def list_hosted_zone_associations(input : Types::ListHostedZoneAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HOSTED_ZONE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of the AWS Managed DNS Lists and the categories for DNS Firewall. The
      # categories are either THREAT or CONTENT .

      def list_managed_firewall_domain_lists(
        managed_firewall_domain_list_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedFirewallDomainListsInput.new(managed_firewall_domain_list_type: managed_firewall_domain_list_type, max_results: max_results, next_token: next_token)
        list_managed_firewall_domain_lists(input)
      end

      def list_managed_firewall_domain_lists(input : Types::ListManagedFirewallDomainListsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_FIREWALL_DOMAIN_LISTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with a Route 53 Global Resolver resource.

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

      # Adds or updates tags for a Route 53 Global Resolver resource. Tags are key-value pairs that help you
      # organize and identify your resources.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a Route 53 Global Resolver resource.

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

      # Updates the configuration of an access source.

      def update_access_source(
        access_source_id : String,
        cidr : String? = nil,
        ip_address_type : String? = nil,
        name : String? = nil,
        protocol : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccessSourceInput.new(access_source_id: access_source_id, cidr: cidr, ip_address_type: ip_address_type, name: name, protocol: protocol)
        update_access_source(input)
      end

      def update_access_source(input : Types::UpdateAccessSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCESS_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an access token.

      def update_access_token(
        access_token_id : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateAccessTokenInput.new(access_token_id: access_token_id, name: name)
        update_access_token(input)
      end

      def update_access_token(input : Types::UpdateAccessTokenInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a DNS view.

      def update_dns_view(
        dns_view_id : String,
        description : String? = nil,
        dnssec_validation : String? = nil,
        edns_client_subnet : String? = nil,
        firewall_rules_fail_open : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDNSViewInput.new(dns_view_id: dns_view_id, description: description, dnssec_validation: dnssec_validation, edns_client_subnet: edns_client_subnet, firewall_rules_fail_open: firewall_rules_fail_open, name: name)
        update_dns_view(input)
      end

      def update_dns_view(input : Types::UpdateDNSViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DNS_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a DNS Firewall domain list from an array of specified domains.

      def update_firewall_domains(
        domains : Array(String),
        firewall_domain_list_id : String,
        operation : String
      ) : Protocol::Request
        input = Types::UpdateFirewallDomainsInput.new(domains: domains, firewall_domain_list_id: firewall_domain_list_id, operation: operation)
        update_firewall_domains(input)
      end

      def update_firewall_domains(input : Types::UpdateFirewallDomainsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FIREWALL_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a DNS firewall rule.

      def update_firewall_rule(
        client_token : String,
        firewall_rule_id : String,
        action : String? = nil,
        block_override_dns_type : String? = nil,
        block_override_domain : String? = nil,
        block_override_ttl : Int32? = nil,
        block_response : String? = nil,
        confidence_threshold : String? = nil,
        description : String? = nil,
        dns_advanced_protection : String? = nil,
        name : String? = nil,
        priority : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateFirewallRuleInput.new(client_token: client_token, firewall_rule_id: firewall_rule_id, action: action, block_override_dns_type: block_override_dns_type, block_override_domain: block_override_domain, block_override_ttl: block_override_ttl, block_response: block_response, confidence_threshold: confidence_threshold, description: description, dns_advanced_protection: dns_advanced_protection, name: name, priority: priority)
        update_firewall_rule(input)
      end

      def update_firewall_rule(input : Types::UpdateFirewallRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FIREWALL_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a Route 53 Global Resolver instance. You can modify the name,
      # description, and observability region.

      def update_global_resolver(
        global_resolver_id : String,
        description : String? = nil,
        name : String? = nil,
        observability_region : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalResolverInput.new(global_resolver_id: global_resolver_id, description: description, name: name, observability_region: observability_region)
        update_global_resolver(input)
      end

      def update_global_resolver(input : Types::UpdateGlobalResolverInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a hosted zone association.

      def update_hosted_zone_association(
        hosted_zone_association_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateHostedZoneAssociationInput.new(hosted_zone_association_id: hosted_zone_association_id, name: name)
        update_hosted_zone_association(input)
      end

      def update_hosted_zone_association(input : Types::UpdateHostedZoneAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_HOSTED_ZONE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
