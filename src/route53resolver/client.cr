module Aws
  module Route53Resolver
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates a FirewallRuleGroup with a VPC, to provide DNS filtering for the VPC.

      def associate_firewall_rule_group(
        creator_request_id : String,
        firewall_rule_group_id : String,
        name : String,
        priority : Int32,
        vpc_id : String,
        mutation_protection : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::AssociateFirewallRuleGroupResponse

        input = Types::AssociateFirewallRuleGroupRequest.new(creator_request_id: creator_request_id, firewall_rule_group_id: firewall_rule_group_id, name: name, priority: priority, vpc_id: vpc_id, mutation_protection: mutation_protection, tags: tags)
        associate_firewall_rule_group(input)
      end

      def associate_firewall_rule_group(input : Types::AssociateFirewallRuleGroupRequest) : Types::AssociateFirewallRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FIREWALL_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFirewallRuleGroupResponse, "AssociateFirewallRuleGroup")
      end

      # Adds IP addresses to an inbound or an outbound Resolver endpoint. If you want to add more than one
      # IP address, submit one AssociateResolverEndpointIpAddress request for each IP address. To remove an
      # IP address from an endpoint, see DisassociateResolverEndpointIpAddress .

      def associate_resolver_endpoint_ip_address(
        ip_address : Types::IpAddressUpdate,
        resolver_endpoint_id : String
      ) : Types::AssociateResolverEndpointIpAddressResponse

        input = Types::AssociateResolverEndpointIpAddressRequest.new(ip_address: ip_address, resolver_endpoint_id: resolver_endpoint_id)
        associate_resolver_endpoint_ip_address(input)
      end

      def associate_resolver_endpoint_ip_address(input : Types::AssociateResolverEndpointIpAddressRequest) : Types::AssociateResolverEndpointIpAddressResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_RESOLVER_ENDPOINT_IP_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateResolverEndpointIpAddressResponse, "AssociateResolverEndpointIpAddress")
      end

      # Associates an Amazon VPC with a specified query logging configuration. Route 53 Resolver logs DNS
      # queries that originate in all of the Amazon VPCs that are associated with a specified query logging
      # configuration. To associate more than one VPC with a configuration, submit one
      # AssociateResolverQueryLogConfig request for each VPC. The VPCs that you associate with a query
      # logging configuration must be in the same Region as the configuration. To remove a VPC from a query
      # logging configuration, see DisassociateResolverQueryLogConfig .

      def associate_resolver_query_log_config(
        resolver_query_log_config_id : String,
        resource_id : String
      ) : Types::AssociateResolverQueryLogConfigResponse

        input = Types::AssociateResolverQueryLogConfigRequest.new(resolver_query_log_config_id: resolver_query_log_config_id, resource_id: resource_id)
        associate_resolver_query_log_config(input)
      end

      def associate_resolver_query_log_config(input : Types::AssociateResolverQueryLogConfigRequest) : Types::AssociateResolverQueryLogConfigResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_RESOLVER_QUERY_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateResolverQueryLogConfigResponse, "AssociateResolverQueryLogConfig")
      end

      # Associates a Resolver rule with a VPC. When you associate a rule with a VPC, Resolver forwards all
      # DNS queries for the domain name that is specified in the rule and that originate in the VPC. The
      # queries are forwarded to the IP addresses for the DNS resolvers that are specified in the rule. For
      # more information about rules, see CreateResolverRule .

      def associate_resolver_rule(
        resolver_rule_id : String,
        vpc_id : String,
        name : String? = nil
      ) : Types::AssociateResolverRuleResponse

        input = Types::AssociateResolverRuleRequest.new(resolver_rule_id: resolver_rule_id, vpc_id: vpc_id, name: name)
        associate_resolver_rule(input)
      end

      def associate_resolver_rule(input : Types::AssociateResolverRuleRequest) : Types::AssociateResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateResolverRuleResponse, "AssociateResolverRule")
      end

      # Creates an empty firewall domain list for use in DNS Firewall rules. You can populate the domains
      # for the new list with a file, using ImportFirewallDomains , or with domain strings, using
      # UpdateFirewallDomains .

      def create_firewall_domain_list(
        creator_request_id : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFirewallDomainListResponse

        input = Types::CreateFirewallDomainListRequest.new(creator_request_id: creator_request_id, name: name, tags: tags)
        create_firewall_domain_list(input)
      end

      def create_firewall_domain_list(input : Types::CreateFirewallDomainListRequest) : Types::CreateFirewallDomainListResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FIREWALL_DOMAIN_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFirewallDomainListResponse, "CreateFirewallDomainList")
      end

      # Creates a single DNS Firewall rule in the specified rule group, using the specified domain list.

      def create_firewall_rule(
        action : String,
        creator_request_id : String,
        firewall_rule_group_id : String,
        name : String,
        priority : Int32,
        block_override_dns_type : String? = nil,
        block_override_domain : String? = nil,
        block_override_ttl : Int32? = nil,
        block_response : String? = nil,
        confidence_threshold : String? = nil,
        dns_threat_protection : String? = nil,
        firewall_domain_list_id : String? = nil,
        firewall_domain_redirection_action : String? = nil,
        qtype : String? = nil
      ) : Types::CreateFirewallRuleResponse

        input = Types::CreateFirewallRuleRequest.new(action: action, creator_request_id: creator_request_id, firewall_rule_group_id: firewall_rule_group_id, name: name, priority: priority, block_override_dns_type: block_override_dns_type, block_override_domain: block_override_domain, block_override_ttl: block_override_ttl, block_response: block_response, confidence_threshold: confidence_threshold, dns_threat_protection: dns_threat_protection, firewall_domain_list_id: firewall_domain_list_id, firewall_domain_redirection_action: firewall_domain_redirection_action, qtype: qtype)
        create_firewall_rule(input)
      end

      def create_firewall_rule(input : Types::CreateFirewallRuleRequest) : Types::CreateFirewallRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FIREWALL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFirewallRuleResponse, "CreateFirewallRule")
      end

      # Creates an empty DNS Firewall rule group for filtering DNS network traffic in a VPC. You can add
      # rules to the new rule group by calling CreateFirewallRule .

      def create_firewall_rule_group(
        creator_request_id : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFirewallRuleGroupResponse

        input = Types::CreateFirewallRuleGroupRequest.new(creator_request_id: creator_request_id, name: name, tags: tags)
        create_firewall_rule_group(input)
      end

      def create_firewall_rule_group(input : Types::CreateFirewallRuleGroupRequest) : Types::CreateFirewallRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FIREWALL_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFirewallRuleGroupResponse, "CreateFirewallRuleGroup")
      end

      # Creates a Route 53 Resolver on an Outpost.

      def create_outpost_resolver(
        creator_request_id : String,
        name : String,
        outpost_arn : String,
        preferred_instance_type : String,
        instance_count : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOutpostResolverResponse

        input = Types::CreateOutpostResolverRequest.new(creator_request_id: creator_request_id, name: name, outpost_arn: outpost_arn, preferred_instance_type: preferred_instance_type, instance_count: instance_count, tags: tags)
        create_outpost_resolver(input)
      end

      def create_outpost_resolver(input : Types::CreateOutpostResolverRequest) : Types::CreateOutpostResolverResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_OUTPOST_RESOLVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOutpostResolverResponse, "CreateOutpostResolver")
      end

      # Creates a Resolver endpoint. There are two types of Resolver endpoints, inbound and outbound: An
      # inbound Resolver endpoint forwards DNS queries to the DNS service for a VPC from your network. An
      # outbound Resolver endpoint forwards DNS queries from the DNS service for a VPC to your network.

      def create_resolver_endpoint(
        creator_request_id : String,
        direction : String,
        ip_addresses : Array(Types::IpAddressRequest),
        security_group_ids : Array(String),
        name : String? = nil,
        outpost_arn : String? = nil,
        preferred_instance_type : String? = nil,
        protocols : Array(String)? = nil,
        resolver_endpoint_type : String? = nil,
        rni_enhanced_metrics_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        target_name_server_metrics_enabled : Bool? = nil
      ) : Types::CreateResolverEndpointResponse

        input = Types::CreateResolverEndpointRequest.new(creator_request_id: creator_request_id, direction: direction, ip_addresses: ip_addresses, security_group_ids: security_group_ids, name: name, outpost_arn: outpost_arn, preferred_instance_type: preferred_instance_type, protocols: protocols, resolver_endpoint_type: resolver_endpoint_type, rni_enhanced_metrics_enabled: rni_enhanced_metrics_enabled, tags: tags, target_name_server_metrics_enabled: target_name_server_metrics_enabled)
        create_resolver_endpoint(input)
      end

      def create_resolver_endpoint(input : Types::CreateResolverEndpointRequest) : Types::CreateResolverEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOLVER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResolverEndpointResponse, "CreateResolverEndpoint")
      end

      # Creates a Resolver query logging configuration, which defines where you want Resolver to save DNS
      # query logs that originate in your VPCs. Resolver can log queries only for VPCs that are in the same
      # Region as the query logging configuration. To specify which VPCs you want to log queries for, you
      # use AssociateResolverQueryLogConfig . For more information, see AssociateResolverQueryLogConfig .
      # You can optionally use Resource Access Manager (RAM) to share a query logging configuration with
      # other Amazon Web Services accounts. The other accounts can then associate VPCs with the
      # configuration. The query logs that Resolver creates for a configuration include all DNS queries that
      # originate in all VPCs that are associated with the configuration.

      def create_resolver_query_log_config(
        creator_request_id : String,
        destination_arn : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateResolverQueryLogConfigResponse

        input = Types::CreateResolverQueryLogConfigRequest.new(creator_request_id: creator_request_id, destination_arn: destination_arn, name: name, tags: tags)
        create_resolver_query_log_config(input)
      end

      def create_resolver_query_log_config(input : Types::CreateResolverQueryLogConfigRequest) : Types::CreateResolverQueryLogConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOLVER_QUERY_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResolverQueryLogConfigResponse, "CreateResolverQueryLogConfig")
      end

      # For DNS queries that originate in your VPCs, specifies which Resolver endpoint the queries pass
      # through, one domain name that you want to forward to your network, and the IP addresses of the DNS
      # resolvers in your network.

      def create_resolver_rule(
        creator_request_id : String,
        rule_type : String,
        delegation_record : String? = nil,
        domain_name : String? = nil,
        name : String? = nil,
        resolver_endpoint_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_ips : Array(Types::TargetAddress)? = nil
      ) : Types::CreateResolverRuleResponse

        input = Types::CreateResolverRuleRequest.new(creator_request_id: creator_request_id, rule_type: rule_type, delegation_record: delegation_record, domain_name: domain_name, name: name, resolver_endpoint_id: resolver_endpoint_id, tags: tags, target_ips: target_ips)
        create_resolver_rule(input)
      end

      def create_resolver_rule(input : Types::CreateResolverRuleRequest) : Types::CreateResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResolverRuleResponse, "CreateResolverRule")
      end

      # Deletes the specified domain list.

      def delete_firewall_domain_list(
        firewall_domain_list_id : String
      ) : Types::DeleteFirewallDomainListResponse

        input = Types::DeleteFirewallDomainListRequest.new(firewall_domain_list_id: firewall_domain_list_id)
        delete_firewall_domain_list(input)
      end

      def delete_firewall_domain_list(input : Types::DeleteFirewallDomainListRequest) : Types::DeleteFirewallDomainListResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL_DOMAIN_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallDomainListResponse, "DeleteFirewallDomainList")
      end

      # Deletes the specified firewall rule.

      def delete_firewall_rule(
        firewall_rule_group_id : String,
        firewall_domain_list_id : String? = nil,
        firewall_threat_protection_id : String? = nil,
        qtype : String? = nil
      ) : Types::DeleteFirewallRuleResponse

        input = Types::DeleteFirewallRuleRequest.new(firewall_rule_group_id: firewall_rule_group_id, firewall_domain_list_id: firewall_domain_list_id, firewall_threat_protection_id: firewall_threat_protection_id, qtype: qtype)
        delete_firewall_rule(input)
      end

      def delete_firewall_rule(input : Types::DeleteFirewallRuleRequest) : Types::DeleteFirewallRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallRuleResponse, "DeleteFirewallRule")
      end

      # Deletes the specified firewall rule group.

      def delete_firewall_rule_group(
        firewall_rule_group_id : String
      ) : Types::DeleteFirewallRuleGroupResponse

        input = Types::DeleteFirewallRuleGroupRequest.new(firewall_rule_group_id: firewall_rule_group_id)
        delete_firewall_rule_group(input)
      end

      def delete_firewall_rule_group(input : Types::DeleteFirewallRuleGroupRequest) : Types::DeleteFirewallRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallRuleGroupResponse, "DeleteFirewallRuleGroup")
      end

      # Deletes a Resolver on the Outpost.

      def delete_outpost_resolver(
        id : String
      ) : Types::DeleteOutpostResolverResponse

        input = Types::DeleteOutpostResolverRequest.new(id: id)
        delete_outpost_resolver(input)
      end

      def delete_outpost_resolver(input : Types::DeleteOutpostResolverRequest) : Types::DeleteOutpostResolverResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_OUTPOST_RESOLVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOutpostResolverResponse, "DeleteOutpostResolver")
      end

      # Deletes a Resolver endpoint. The effect of deleting a Resolver endpoint depends on whether it's an
      # inbound or an outbound Resolver endpoint: Inbound : DNS queries from your network are no longer
      # routed to the DNS service for the specified VPC. Outbound : DNS queries from a VPC are no longer
      # routed to your network.

      def delete_resolver_endpoint(
        resolver_endpoint_id : String
      ) : Types::DeleteResolverEndpointResponse

        input = Types::DeleteResolverEndpointRequest.new(resolver_endpoint_id: resolver_endpoint_id)
        delete_resolver_endpoint(input)
      end

      def delete_resolver_endpoint(input : Types::DeleteResolverEndpointRequest) : Types::DeleteResolverEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOLVER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResolverEndpointResponse, "DeleteResolverEndpoint")
      end

      # Deletes a query logging configuration. When you delete a configuration, Resolver stops logging DNS
      # queries for all of the Amazon VPCs that are associated with the configuration. This also applies if
      # the query logging configuration is shared with other Amazon Web Services accounts, and the other
      # accounts have associated VPCs with the shared configuration. Before you can delete a query logging
      # configuration, you must first disassociate all VPCs from the configuration. See
      # DisassociateResolverQueryLogConfig . If you used Resource Access Manager (RAM) to share a query
      # logging configuration with other accounts, you must stop sharing the configuration before you can
      # delete a configuration. The accounts that you shared the configuration with can first disassociate
      # VPCs that they associated with the configuration, but that's not necessary. If you stop sharing the
      # configuration, those VPCs are automatically disassociated from the configuration.

      def delete_resolver_query_log_config(
        resolver_query_log_config_id : String
      ) : Types::DeleteResolverQueryLogConfigResponse

        input = Types::DeleteResolverQueryLogConfigRequest.new(resolver_query_log_config_id: resolver_query_log_config_id)
        delete_resolver_query_log_config(input)
      end

      def delete_resolver_query_log_config(input : Types::DeleteResolverQueryLogConfigRequest) : Types::DeleteResolverQueryLogConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOLVER_QUERY_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResolverQueryLogConfigResponse, "DeleteResolverQueryLogConfig")
      end

      # Deletes a Resolver rule. Before you can delete a Resolver rule, you must disassociate it from all
      # the VPCs that you associated the Resolver rule with. For more information, see
      # DisassociateResolverRule .

      def delete_resolver_rule(
        resolver_rule_id : String
      ) : Types::DeleteResolverRuleResponse

        input = Types::DeleteResolverRuleRequest.new(resolver_rule_id: resolver_rule_id)
        delete_resolver_rule(input)
      end

      def delete_resolver_rule(input : Types::DeleteResolverRuleRequest) : Types::DeleteResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResolverRuleResponse, "DeleteResolverRule")
      end

      # Disassociates a FirewallRuleGroup from a VPC, to remove DNS filtering from the VPC.

      def disassociate_firewall_rule_group(
        firewall_rule_group_association_id : String
      ) : Types::DisassociateFirewallRuleGroupResponse

        input = Types::DisassociateFirewallRuleGroupRequest.new(firewall_rule_group_association_id: firewall_rule_group_association_id)
        disassociate_firewall_rule_group(input)
      end

      def disassociate_firewall_rule_group(input : Types::DisassociateFirewallRuleGroupRequest) : Types::DisassociateFirewallRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FIREWALL_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFirewallRuleGroupResponse, "DisassociateFirewallRuleGroup")
      end

      # Removes IP addresses from an inbound or an outbound Resolver endpoint. If you want to remove more
      # than one IP address, submit one DisassociateResolverEndpointIpAddress request for each IP address.
      # To add an IP address to an endpoint, see AssociateResolverEndpointIpAddress .

      def disassociate_resolver_endpoint_ip_address(
        ip_address : Types::IpAddressUpdate,
        resolver_endpoint_id : String
      ) : Types::DisassociateResolverEndpointIpAddressResponse

        input = Types::DisassociateResolverEndpointIpAddressRequest.new(ip_address: ip_address, resolver_endpoint_id: resolver_endpoint_id)
        disassociate_resolver_endpoint_ip_address(input)
      end

      def disassociate_resolver_endpoint_ip_address(input : Types::DisassociateResolverEndpointIpAddressRequest) : Types::DisassociateResolverEndpointIpAddressResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_RESOLVER_ENDPOINT_IP_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateResolverEndpointIpAddressResponse, "DisassociateResolverEndpointIpAddress")
      end

      # Disassociates a VPC from a query logging configuration. Before you can delete a query logging
      # configuration, you must first disassociate all VPCs from the configuration. If you used Resource
      # Access Manager (RAM) to share a query logging configuration with other accounts, VPCs can be
      # disassociated from the configuration in the following ways: The accounts that you shared the
      # configuration with can disassociate VPCs from the configuration. You can stop sharing the
      # configuration.

      def disassociate_resolver_query_log_config(
        resolver_query_log_config_id : String,
        resource_id : String
      ) : Types::DisassociateResolverQueryLogConfigResponse

        input = Types::DisassociateResolverQueryLogConfigRequest.new(resolver_query_log_config_id: resolver_query_log_config_id, resource_id: resource_id)
        disassociate_resolver_query_log_config(input)
      end

      def disassociate_resolver_query_log_config(input : Types::DisassociateResolverQueryLogConfigRequest) : Types::DisassociateResolverQueryLogConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_RESOLVER_QUERY_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateResolverQueryLogConfigResponse, "DisassociateResolverQueryLogConfig")
      end

      # Removes the association between a specified Resolver rule and a specified VPC. If you disassociate a
      # Resolver rule from a VPC, Resolver stops forwarding DNS queries for the domain name that you
      # specified in the Resolver rule.

      def disassociate_resolver_rule(
        resolver_rule_id : String,
        vpc_id : String
      ) : Types::DisassociateResolverRuleResponse

        input = Types::DisassociateResolverRuleRequest.new(resolver_rule_id: resolver_rule_id, vpc_id: vpc_id)
        disassociate_resolver_rule(input)
      end

      def disassociate_resolver_rule(input : Types::DisassociateResolverRuleRequest) : Types::DisassociateResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateResolverRuleResponse, "DisassociateResolverRule")
      end

      # Retrieves the configuration of the firewall behavior provided by DNS Firewall for a single VPC from
      # Amazon Virtual Private Cloud (Amazon VPC).

      def get_firewall_config(
        resource_id : String
      ) : Types::GetFirewallConfigResponse

        input = Types::GetFirewallConfigRequest.new(resource_id: resource_id)
        get_firewall_config(input)
      end

      def get_firewall_config(input : Types::GetFirewallConfigRequest) : Types::GetFirewallConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FIREWALL_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFirewallConfigResponse, "GetFirewallConfig")
      end

      # Retrieves the specified firewall domain list.

      def get_firewall_domain_list(
        firewall_domain_list_id : String
      ) : Types::GetFirewallDomainListResponse

        input = Types::GetFirewallDomainListRequest.new(firewall_domain_list_id: firewall_domain_list_id)
        get_firewall_domain_list(input)
      end

      def get_firewall_domain_list(input : Types::GetFirewallDomainListRequest) : Types::GetFirewallDomainListResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FIREWALL_DOMAIN_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFirewallDomainListResponse, "GetFirewallDomainList")
      end

      # Retrieves the specified firewall rule group.

      def get_firewall_rule_group(
        firewall_rule_group_id : String
      ) : Types::GetFirewallRuleGroupResponse

        input = Types::GetFirewallRuleGroupRequest.new(firewall_rule_group_id: firewall_rule_group_id)
        get_firewall_rule_group(input)
      end

      def get_firewall_rule_group(input : Types::GetFirewallRuleGroupRequest) : Types::GetFirewallRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FIREWALL_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFirewallRuleGroupResponse, "GetFirewallRuleGroup")
      end

      # Retrieves a firewall rule group association, which enables DNS filtering for a VPC with one rule
      # group. A VPC can have more than one firewall rule group association, and a rule group can be
      # associated with more than one VPC.

      def get_firewall_rule_group_association(
        firewall_rule_group_association_id : String
      ) : Types::GetFirewallRuleGroupAssociationResponse

        input = Types::GetFirewallRuleGroupAssociationRequest.new(firewall_rule_group_association_id: firewall_rule_group_association_id)
        get_firewall_rule_group_association(input)
      end

      def get_firewall_rule_group_association(input : Types::GetFirewallRuleGroupAssociationRequest) : Types::GetFirewallRuleGroupAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FIREWALL_RULE_GROUP_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFirewallRuleGroupAssociationResponse, "GetFirewallRuleGroupAssociation")
      end

      # Returns the Identity and Access Management (Amazon Web Services IAM) policy for sharing the
      # specified rule group. You can use the policy to share the rule group using Resource Access Manager
      # (RAM).

      def get_firewall_rule_group_policy(
        arn : String
      ) : Types::GetFirewallRuleGroupPolicyResponse

        input = Types::GetFirewallRuleGroupPolicyRequest.new(arn: arn)
        get_firewall_rule_group_policy(input)
      end

      def get_firewall_rule_group_policy(input : Types::GetFirewallRuleGroupPolicyRequest) : Types::GetFirewallRuleGroupPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FIREWALL_RULE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFirewallRuleGroupPolicyResponse, "GetFirewallRuleGroupPolicy")
      end

      # Gets information about a specified Resolver on the Outpost, such as its instance count and type,
      # name, and the current status of the Resolver.

      def get_outpost_resolver(
        id : String
      ) : Types::GetOutpostResolverResponse

        input = Types::GetOutpostResolverRequest.new(id: id)
        get_outpost_resolver(input)
      end

      def get_outpost_resolver(input : Types::GetOutpostResolverRequest) : Types::GetOutpostResolverResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OUTPOST_RESOLVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOutpostResolverResponse, "GetOutpostResolver")
      end

      # Retrieves the behavior configuration of Route 53 Resolver behavior for a single VPC from Amazon
      # Virtual Private Cloud.

      def get_resolver_config(
        resource_id : String
      ) : Types::GetResolverConfigResponse

        input = Types::GetResolverConfigRequest.new(resource_id: resource_id)
        get_resolver_config(input)
      end

      def get_resolver_config(input : Types::GetResolverConfigRequest) : Types::GetResolverConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverConfigResponse, "GetResolverConfig")
      end

      # Gets DNSSEC validation information for a specified resource.

      def get_resolver_dnssec_config(
        resource_id : String
      ) : Types::GetResolverDnssecConfigResponse

        input = Types::GetResolverDnssecConfigRequest.new(resource_id: resource_id)
        get_resolver_dnssec_config(input)
      end

      def get_resolver_dnssec_config(input : Types::GetResolverDnssecConfigRequest) : Types::GetResolverDnssecConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_DNSSEC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverDnssecConfigResponse, "GetResolverDnssecConfig")
      end

      # Gets information about a specified Resolver endpoint, such as whether it's an inbound or an outbound
      # Resolver endpoint, and the current status of the endpoint.

      def get_resolver_endpoint(
        resolver_endpoint_id : String
      ) : Types::GetResolverEndpointResponse

        input = Types::GetResolverEndpointRequest.new(resolver_endpoint_id: resolver_endpoint_id)
        get_resolver_endpoint(input)
      end

      def get_resolver_endpoint(input : Types::GetResolverEndpointRequest) : Types::GetResolverEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverEndpointResponse, "GetResolverEndpoint")
      end

      # Gets information about a specified Resolver query logging configuration, such as the number of VPCs
      # that the configuration is logging queries for and the location that logs are sent to.

      def get_resolver_query_log_config(
        resolver_query_log_config_id : String
      ) : Types::GetResolverQueryLogConfigResponse

        input = Types::GetResolverQueryLogConfigRequest.new(resolver_query_log_config_id: resolver_query_log_config_id)
        get_resolver_query_log_config(input)
      end

      def get_resolver_query_log_config(input : Types::GetResolverQueryLogConfigRequest) : Types::GetResolverQueryLogConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_QUERY_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverQueryLogConfigResponse, "GetResolverQueryLogConfig")
      end

      # Gets information about a specified association between a Resolver query logging configuration and an
      # Amazon VPC. When you associate a VPC with a query logging configuration, Resolver logs DNS queries
      # that originate in that VPC.

      def get_resolver_query_log_config_association(
        resolver_query_log_config_association_id : String
      ) : Types::GetResolverQueryLogConfigAssociationResponse

        input = Types::GetResolverQueryLogConfigAssociationRequest.new(resolver_query_log_config_association_id: resolver_query_log_config_association_id)
        get_resolver_query_log_config_association(input)
      end

      def get_resolver_query_log_config_association(input : Types::GetResolverQueryLogConfigAssociationRequest) : Types::GetResolverQueryLogConfigAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_QUERY_LOG_CONFIG_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverQueryLogConfigAssociationResponse, "GetResolverQueryLogConfigAssociation")
      end

      # Gets information about a query logging policy. A query logging policy specifies the Resolver query
      # logging operations and resources that you want to allow another Amazon Web Services account to be
      # able to use.

      def get_resolver_query_log_config_policy(
        arn : String
      ) : Types::GetResolverQueryLogConfigPolicyResponse

        input = Types::GetResolverQueryLogConfigPolicyRequest.new(arn: arn)
        get_resolver_query_log_config_policy(input)
      end

      def get_resolver_query_log_config_policy(input : Types::GetResolverQueryLogConfigPolicyRequest) : Types::GetResolverQueryLogConfigPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_QUERY_LOG_CONFIG_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverQueryLogConfigPolicyResponse, "GetResolverQueryLogConfigPolicy")
      end

      # Gets information about a specified Resolver rule, such as the domain name that the rule forwards DNS
      # queries for and the ID of the outbound Resolver endpoint that the rule is associated with.

      def get_resolver_rule(
        resolver_rule_id : String
      ) : Types::GetResolverRuleResponse

        input = Types::GetResolverRuleRequest.new(resolver_rule_id: resolver_rule_id)
        get_resolver_rule(input)
      end

      def get_resolver_rule(input : Types::GetResolverRuleRequest) : Types::GetResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverRuleResponse, "GetResolverRule")
      end

      # Gets information about an association between a specified Resolver rule and a VPC. You associate a
      # Resolver rule and a VPC using AssociateResolverRule .

      def get_resolver_rule_association(
        resolver_rule_association_id : String
      ) : Types::GetResolverRuleAssociationResponse

        input = Types::GetResolverRuleAssociationRequest.new(resolver_rule_association_id: resolver_rule_association_id)
        get_resolver_rule_association(input)
      end

      def get_resolver_rule_association(input : Types::GetResolverRuleAssociationRequest) : Types::GetResolverRuleAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_RULE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverRuleAssociationResponse, "GetResolverRuleAssociation")
      end

      # Gets information about the Resolver rule policy for a specified rule. A Resolver rule policy
      # includes the rule that you want to share with another account, the account that you want to share
      # the rule with, and the Resolver operations that you want to allow the account to use.

      def get_resolver_rule_policy(
        arn : String
      ) : Types::GetResolverRulePolicyResponse

        input = Types::GetResolverRulePolicyRequest.new(arn: arn)
        get_resolver_rule_policy(input)
      end

      def get_resolver_rule_policy(input : Types::GetResolverRulePolicyRequest) : Types::GetResolverRulePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOLVER_RULE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResolverRulePolicyResponse, "GetResolverRulePolicy")
      end

      # Imports domain names from a file into a domain list, for use in a DNS firewall rule group. Each
      # domain specification in your domain list must satisfy the following requirements: It can optionally
      # start with * (asterisk). With the exception of the optional starting asterisk, it must only contain
      # the following characters: A-Z , a-z , 0-9 , - (hyphen). It must be from 1-255 characters in length.

      def import_firewall_domains(
        domain_file_url : String,
        firewall_domain_list_id : String,
        operation : String
      ) : Types::ImportFirewallDomainsResponse

        input = Types::ImportFirewallDomainsRequest.new(domain_file_url: domain_file_url, firewall_domain_list_id: firewall_domain_list_id, operation: operation)
        import_firewall_domains(input)
      end

      def import_firewall_domains(input : Types::ImportFirewallDomainsRequest) : Types::ImportFirewallDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_FIREWALL_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportFirewallDomainsResponse, "ImportFirewallDomains")
      end

      # Retrieves the firewall configurations that you have defined. DNS Firewall uses the configurations to
      # manage firewall behavior for your VPCs. A single call might return only a partial list of the
      # configurations. For information, see MaxResults .

      def list_firewall_configs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFirewallConfigsResponse

        input = Types::ListFirewallConfigsRequest.new(max_results: max_results, next_token: next_token)
        list_firewall_configs(input)
      end

      def list_firewall_configs(input : Types::ListFirewallConfigsRequest) : Types::ListFirewallConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallConfigsResponse, "ListFirewallConfigs")
      end

      # Retrieves the firewall domain lists that you have defined. For each firewall domain list, you can
      # retrieve the domains that are defined for a list by calling ListFirewallDomains . A single call to
      # this list operation might return only a partial list of the domain lists. For information, see
      # MaxResults .

      def list_firewall_domain_lists(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFirewallDomainListsResponse

        input = Types::ListFirewallDomainListsRequest.new(max_results: max_results, next_token: next_token)
        list_firewall_domain_lists(input)
      end

      def list_firewall_domain_lists(input : Types::ListFirewallDomainListsRequest) : Types::ListFirewallDomainListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_DOMAIN_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallDomainListsResponse, "ListFirewallDomainLists")
      end

      # Retrieves the domains that you have defined for the specified firewall domain list. A single call
      # might return only a partial list of the domains. For information, see MaxResults .

      def list_firewall_domains(
        firewall_domain_list_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFirewallDomainsResponse

        input = Types::ListFirewallDomainsRequest.new(firewall_domain_list_id: firewall_domain_list_id, max_results: max_results, next_token: next_token)
        list_firewall_domains(input)
      end

      def list_firewall_domains(input : Types::ListFirewallDomainsRequest) : Types::ListFirewallDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallDomainsResponse, "ListFirewallDomains")
      end

      # Retrieves the firewall rule group associations that you have defined. Each association enables DNS
      # filtering for a VPC with one rule group. A single call might return only a partial list of the
      # associations. For information, see MaxResults .

      def list_firewall_rule_group_associations(
        firewall_rule_group_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        priority : Int32? = nil,
        status : String? = nil,
        vpc_id : String? = nil
      ) : Types::ListFirewallRuleGroupAssociationsResponse

        input = Types::ListFirewallRuleGroupAssociationsRequest.new(firewall_rule_group_id: firewall_rule_group_id, max_results: max_results, next_token: next_token, priority: priority, status: status, vpc_id: vpc_id)
        list_firewall_rule_group_associations(input)
      end

      def list_firewall_rule_group_associations(input : Types::ListFirewallRuleGroupAssociationsRequest) : Types::ListFirewallRuleGroupAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_RULE_GROUP_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallRuleGroupAssociationsResponse, "ListFirewallRuleGroupAssociations")
      end

      # Retrieves the minimal high-level information for the rule groups that you have defined. A single
      # call might return only a partial list of the rule groups. For information, see MaxResults .

      def list_firewall_rule_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFirewallRuleGroupsResponse

        input = Types::ListFirewallRuleGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_firewall_rule_groups(input)
      end

      def list_firewall_rule_groups(input : Types::ListFirewallRuleGroupsRequest) : Types::ListFirewallRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallRuleGroupsResponse, "ListFirewallRuleGroups")
      end

      # Retrieves the firewall rules that you have defined for the specified firewall rule group. DNS
      # Firewall uses the rules in a rule group to filter DNS network traffic for a VPC. A single call might
      # return only a partial list of the rules. For information, see MaxResults .

      def list_firewall_rules(
        firewall_rule_group_id : String,
        action : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        priority : Int32? = nil
      ) : Types::ListFirewallRulesResponse

        input = Types::ListFirewallRulesRequest.new(firewall_rule_group_id: firewall_rule_group_id, action: action, max_results: max_results, next_token: next_token, priority: priority)
        list_firewall_rules(input)
      end

      def list_firewall_rules(input : Types::ListFirewallRulesRequest) : Types::ListFirewallRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallRulesResponse, "ListFirewallRules")
      end

      # Lists all the Resolvers on Outposts that were created using the current Amazon Web Services account.

      def list_outpost_resolvers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        outpost_arn : String? = nil
      ) : Types::ListOutpostResolversResponse

        input = Types::ListOutpostResolversRequest.new(max_results: max_results, next_token: next_token, outpost_arn: outpost_arn)
        list_outpost_resolvers(input)
      end

      def list_outpost_resolvers(input : Types::ListOutpostResolversRequest) : Types::ListOutpostResolversResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OUTPOST_RESOLVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOutpostResolversResponse, "ListOutpostResolvers")
      end

      # Retrieves the Resolver configurations that you have defined. Route 53 Resolver uses the
      # configurations to manage DNS resolution behavior for your VPCs.

      def list_resolver_configs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverConfigsResponse

        input = Types::ListResolverConfigsRequest.new(max_results: max_results, next_token: next_token)
        list_resolver_configs(input)
      end

      def list_resolver_configs(input : Types::ListResolverConfigsRequest) : Types::ListResolverConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverConfigsResponse, "ListResolverConfigs")
      end

      # Lists the configurations for DNSSEC validation that are associated with the current Amazon Web
      # Services account.

      def list_resolver_dnssec_configs(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverDnssecConfigsResponse

        input = Types::ListResolverDnssecConfigsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resolver_dnssec_configs(input)
      end

      def list_resolver_dnssec_configs(input : Types::ListResolverDnssecConfigsRequest) : Types::ListResolverDnssecConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_DNSSEC_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverDnssecConfigsResponse, "ListResolverDnssecConfigs")
      end

      # Gets the IP addresses for a specified Resolver endpoint.

      def list_resolver_endpoint_ip_addresses(
        resolver_endpoint_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverEndpointIpAddressesResponse

        input = Types::ListResolverEndpointIpAddressesRequest.new(resolver_endpoint_id: resolver_endpoint_id, max_results: max_results, next_token: next_token)
        list_resolver_endpoint_ip_addresses(input)
      end

      def list_resolver_endpoint_ip_addresses(input : Types::ListResolverEndpointIpAddressesRequest) : Types::ListResolverEndpointIpAddressesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_ENDPOINT_IP_ADDRESSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverEndpointIpAddressesResponse, "ListResolverEndpointIpAddresses")
      end

      # Lists all the Resolver endpoints that were created using the current Amazon Web Services account.

      def list_resolver_endpoints(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverEndpointsResponse

        input = Types::ListResolverEndpointsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resolver_endpoints(input)
      end

      def list_resolver_endpoints(input : Types::ListResolverEndpointsRequest) : Types::ListResolverEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverEndpointsResponse, "ListResolverEndpoints")
      end

      # Lists information about associations between Amazon VPCs and query logging configurations.

      def list_resolver_query_log_config_associations(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListResolverQueryLogConfigAssociationsResponse

        input = Types::ListResolverQueryLogConfigAssociationsRequest.new(filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_resolver_query_log_config_associations(input)
      end

      def list_resolver_query_log_config_associations(input : Types::ListResolverQueryLogConfigAssociationsRequest) : Types::ListResolverQueryLogConfigAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_QUERY_LOG_CONFIG_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverQueryLogConfigAssociationsResponse, "ListResolverQueryLogConfigAssociations")
      end

      # Lists information about the specified query logging configurations. Each configuration defines where
      # you want Resolver to save DNS query logs and specifies the VPCs that you want to log queries for.

      def list_resolver_query_log_configs(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListResolverQueryLogConfigsResponse

        input = Types::ListResolverQueryLogConfigsRequest.new(filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_resolver_query_log_configs(input)
      end

      def list_resolver_query_log_configs(input : Types::ListResolverQueryLogConfigsRequest) : Types::ListResolverQueryLogConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_QUERY_LOG_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverQueryLogConfigsResponse, "ListResolverQueryLogConfigs")
      end

      # Lists the associations that were created between Resolver rules and VPCs using the current Amazon
      # Web Services account.

      def list_resolver_rule_associations(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverRuleAssociationsResponse

        input = Types::ListResolverRuleAssociationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resolver_rule_associations(input)
      end

      def list_resolver_rule_associations(input : Types::ListResolverRuleAssociationsRequest) : Types::ListResolverRuleAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_RULE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverRuleAssociationsResponse, "ListResolverRuleAssociations")
      end

      # Lists the Resolver rules that were created using the current Amazon Web Services account.

      def list_resolver_rules(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResolverRulesResponse

        input = Types::ListResolverRulesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resolver_rules(input)
      end

      def list_resolver_rules(input : Types::ListResolverRulesRequest) : Types::ListResolverRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOLVER_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResolverRulesResponse, "ListResolverRules")
      end

      # Lists the tags that you associated with the specified resource.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Attaches an Identity and Access Management (Amazon Web Services IAM) policy for sharing the rule
      # group. You can use the policy to share the rule group using Resource Access Manager (RAM).

      def put_firewall_rule_group_policy(
        arn : String,
        firewall_rule_group_policy : String
      ) : Types::PutFirewallRuleGroupPolicyResponse

        input = Types::PutFirewallRuleGroupPolicyRequest.new(arn: arn, firewall_rule_group_policy: firewall_rule_group_policy)
        put_firewall_rule_group_policy(input)
      end

      def put_firewall_rule_group_policy(input : Types::PutFirewallRuleGroupPolicyRequest) : Types::PutFirewallRuleGroupPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_FIREWALL_RULE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutFirewallRuleGroupPolicyResponse, "PutFirewallRuleGroupPolicy")
      end

      # Specifies an Amazon Web Services account that you want to share a query logging configuration with,
      # the query logging configuration that you want to share, and the operations that you want the account
      # to be able to perform on the configuration.

      def put_resolver_query_log_config_policy(
        arn : String,
        resolver_query_log_config_policy : String
      ) : Types::PutResolverQueryLogConfigPolicyResponse

        input = Types::PutResolverQueryLogConfigPolicyRequest.new(arn: arn, resolver_query_log_config_policy: resolver_query_log_config_policy)
        put_resolver_query_log_config_policy(input)
      end

      def put_resolver_query_log_config_policy(input : Types::PutResolverQueryLogConfigPolicyRequest) : Types::PutResolverQueryLogConfigPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOLVER_QUERY_LOG_CONFIG_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResolverQueryLogConfigPolicyResponse, "PutResolverQueryLogConfigPolicy")
      end

      # Specifies an Amazon Web Services rule that you want to share with another account, the account that
      # you want to share the rule with, and the operations that you want the account to be able to perform
      # on the rule.

      def put_resolver_rule_policy(
        arn : String,
        resolver_rule_policy : String
      ) : Types::PutResolverRulePolicyResponse

        input = Types::PutResolverRulePolicyRequest.new(arn: arn, resolver_rule_policy: resolver_rule_policy)
        put_resolver_rule_policy(input)
      end

      def put_resolver_rule_policy(input : Types::PutResolverRulePolicyRequest) : Types::PutResolverRulePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOLVER_RULE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResolverRulePolicyResponse, "PutResolverRulePolicy")
      end

      # Adds one or more tags to a specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from a specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the configuration of the firewall behavior provided by DNS Firewall for a single VPC from
      # Amazon Virtual Private Cloud (Amazon VPC).

      def update_firewall_config(
        firewall_fail_open : String,
        resource_id : String
      ) : Types::UpdateFirewallConfigResponse

        input = Types::UpdateFirewallConfigRequest.new(firewall_fail_open: firewall_fail_open, resource_id: resource_id)
        update_firewall_config(input)
      end

      def update_firewall_config(input : Types::UpdateFirewallConfigRequest) : Types::UpdateFirewallConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallConfigResponse, "UpdateFirewallConfig")
      end

      # Updates the firewall domain list from an array of domain specifications.

      def update_firewall_domains(
        domains : Array(String),
        firewall_domain_list_id : String,
        operation : String
      ) : Types::UpdateFirewallDomainsResponse

        input = Types::UpdateFirewallDomainsRequest.new(domains: domains, firewall_domain_list_id: firewall_domain_list_id, operation: operation)
        update_firewall_domains(input)
      end

      def update_firewall_domains(input : Types::UpdateFirewallDomainsRequest) : Types::UpdateFirewallDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallDomainsResponse, "UpdateFirewallDomains")
      end

      # Updates the specified firewall rule.

      def update_firewall_rule(
        firewall_rule_group_id : String,
        action : String? = nil,
        block_override_dns_type : String? = nil,
        block_override_domain : String? = nil,
        block_override_ttl : Int32? = nil,
        block_response : String? = nil,
        confidence_threshold : String? = nil,
        dns_threat_protection : String? = nil,
        firewall_domain_list_id : String? = nil,
        firewall_domain_redirection_action : String? = nil,
        firewall_threat_protection_id : String? = nil,
        name : String? = nil,
        priority : Int32? = nil,
        qtype : String? = nil
      ) : Types::UpdateFirewallRuleResponse

        input = Types::UpdateFirewallRuleRequest.new(firewall_rule_group_id: firewall_rule_group_id, action: action, block_override_dns_type: block_override_dns_type, block_override_domain: block_override_domain, block_override_ttl: block_override_ttl, block_response: block_response, confidence_threshold: confidence_threshold, dns_threat_protection: dns_threat_protection, firewall_domain_list_id: firewall_domain_list_id, firewall_domain_redirection_action: firewall_domain_redirection_action, firewall_threat_protection_id: firewall_threat_protection_id, name: name, priority: priority, qtype: qtype)
        update_firewall_rule(input)
      end

      def update_firewall_rule(input : Types::UpdateFirewallRuleRequest) : Types::UpdateFirewallRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallRuleResponse, "UpdateFirewallRule")
      end

      # Changes the association of a FirewallRuleGroup with a VPC. The association enables DNS filtering for
      # the VPC.

      def update_firewall_rule_group_association(
        firewall_rule_group_association_id : String,
        mutation_protection : String? = nil,
        name : String? = nil,
        priority : Int32? = nil
      ) : Types::UpdateFirewallRuleGroupAssociationResponse

        input = Types::UpdateFirewallRuleGroupAssociationRequest.new(firewall_rule_group_association_id: firewall_rule_group_association_id, mutation_protection: mutation_protection, name: name, priority: priority)
        update_firewall_rule_group_association(input)
      end

      def update_firewall_rule_group_association(input : Types::UpdateFirewallRuleGroupAssociationRequest) : Types::UpdateFirewallRuleGroupAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_RULE_GROUP_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallRuleGroupAssociationResponse, "UpdateFirewallRuleGroupAssociation")
      end

      # You can use UpdateOutpostResolver to update the instance count, type, or name of a Resolver on an
      # Outpost.

      def update_outpost_resolver(
        id : String,
        instance_count : Int32? = nil,
        name : String? = nil,
        preferred_instance_type : String? = nil
      ) : Types::UpdateOutpostResolverResponse

        input = Types::UpdateOutpostResolverRequest.new(id: id, instance_count: instance_count, name: name, preferred_instance_type: preferred_instance_type)
        update_outpost_resolver(input)
      end

      def update_outpost_resolver(input : Types::UpdateOutpostResolverRequest) : Types::UpdateOutpostResolverResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_OUTPOST_RESOLVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOutpostResolverResponse, "UpdateOutpostResolver")
      end

      # Updates the behavior configuration of Route 53 Resolver behavior for a single VPC from Amazon
      # Virtual Private Cloud.

      def update_resolver_config(
        autodefined_reverse_flag : String,
        resource_id : String
      ) : Types::UpdateResolverConfigResponse

        input = Types::UpdateResolverConfigRequest.new(autodefined_reverse_flag: autodefined_reverse_flag, resource_id: resource_id)
        update_resolver_config(input)
      end

      def update_resolver_config(input : Types::UpdateResolverConfigRequest) : Types::UpdateResolverConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOLVER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResolverConfigResponse, "UpdateResolverConfig")
      end

      # Updates an existing DNSSEC validation configuration. If there is no existing DNSSEC validation
      # configuration, one is created.

      def update_resolver_dnssec_config(
        resource_id : String,
        validation : String
      ) : Types::UpdateResolverDnssecConfigResponse

        input = Types::UpdateResolverDnssecConfigRequest.new(resource_id: resource_id, validation: validation)
        update_resolver_dnssec_config(input)
      end

      def update_resolver_dnssec_config(input : Types::UpdateResolverDnssecConfigRequest) : Types::UpdateResolverDnssecConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOLVER_DNSSEC_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResolverDnssecConfigResponse, "UpdateResolverDnssecConfig")
      end

      # Updates the name, or endpoint type for an inbound or an outbound Resolver endpoint. You can only
      # update between IPV4 and DUALSTACK, IPV6 endpoint type can't be updated to other type.

      def update_resolver_endpoint(
        resolver_endpoint_id : String,
        name : String? = nil,
        protocols : Array(String)? = nil,
        resolver_endpoint_type : String? = nil,
        rni_enhanced_metrics_enabled : Bool? = nil,
        target_name_server_metrics_enabled : Bool? = nil,
        update_ip_addresses : Array(Types::UpdateIpAddress)? = nil
      ) : Types::UpdateResolverEndpointResponse

        input = Types::UpdateResolverEndpointRequest.new(resolver_endpoint_id: resolver_endpoint_id, name: name, protocols: protocols, resolver_endpoint_type: resolver_endpoint_type, rni_enhanced_metrics_enabled: rni_enhanced_metrics_enabled, target_name_server_metrics_enabled: target_name_server_metrics_enabled, update_ip_addresses: update_ip_addresses)
        update_resolver_endpoint(input)
      end

      def update_resolver_endpoint(input : Types::UpdateResolverEndpointRequest) : Types::UpdateResolverEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOLVER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResolverEndpointResponse, "UpdateResolverEndpoint")
      end

      # Updates settings for a specified Resolver rule. ResolverRuleId is required, and all other parameters
      # are optional. If you don't specify a parameter, it retains its current value.

      def update_resolver_rule(
        config : Types::ResolverRuleConfig,
        resolver_rule_id : String
      ) : Types::UpdateResolverRuleResponse

        input = Types::UpdateResolverRuleRequest.new(config: config, resolver_rule_id: resolver_rule_id)
        update_resolver_rule(input)
      end

      def update_resolver_rule(input : Types::UpdateResolverRuleRequest) : Types::UpdateResolverRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOLVER_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResolverRuleResponse, "UpdateResolverRule")
      end
    end
  end
end
