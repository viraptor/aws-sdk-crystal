module AwsSdk
  module NetworkFirewall
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Accepts a transit gateway attachment request for Network Firewall. When you accept the attachment
      # request, Network Firewall creates the necessary routing components to enable traffic flow between
      # the transit gateway and firewall endpoints. You must accept a transit gateway attachment to complete
      # the creation of a transit gateway-attached firewall, unless auto-accept is enabled on the transit
      # gateway. After acceptance, use DescribeFirewall to verify the firewall status. To reject an
      # attachment instead of accepting it, use RejectNetworkFirewallTransitGatewayAttachment . It can take
      # several minutes for the attachment acceptance to complete and the firewall to become available.
      def accept_network_firewall_transit_gateway_attachment(
        transit_gateway_attachment_id : String
      ) : Types::AcceptNetworkFirewallTransitGatewayAttachmentResponse
        input = Types::AcceptNetworkFirewallTransitGatewayAttachmentRequest.new(transit_gateway_attachment_id: transit_gateway_attachment_id)
        accept_network_firewall_transit_gateway_attachment(input)
      end
      def accept_network_firewall_transit_gateway_attachment(input : Types::AcceptNetworkFirewallTransitGatewayAttachmentRequest) : Types::AcceptNetworkFirewallTransitGatewayAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptNetworkFirewallTransitGatewayAttachmentResponse, "AcceptNetworkFirewallTransitGatewayAttachment")
      end

      # Associates the specified Availability Zones with a transit gateway-attached firewall. For each
      # Availability Zone, Network Firewall creates a firewall endpoint to process traffic. You can specify
      # one or more Availability Zones where you want to deploy the firewall. After adding Availability
      # Zones, you must update your transit gateway route tables to direct traffic through the new firewall
      # endpoints. Use DescribeFirewall to monitor the status of the new endpoints.
      def associate_availability_zones(
        availability_zone_mappings : Array(Types::AvailabilityZoneMapping),
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::AssociateAvailabilityZonesResponse
        input = Types::AssociateAvailabilityZonesRequest.new(availability_zone_mappings: availability_zone_mappings, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        associate_availability_zones(input)
      end
      def associate_availability_zones(input : Types::AssociateAvailabilityZonesRequest) : Types::AssociateAvailabilityZonesResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_AVAILABILITY_ZONES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateAvailabilityZonesResponse, "AssociateAvailabilityZones")
      end

      # Associates a FirewallPolicy to a Firewall . A firewall policy defines how to monitor and manage your
      # VPC network traffic, using a collection of inspection rule groups and other settings. Each firewall
      # requires one firewall policy association, and you can use the same firewall policy for multiple
      # firewalls.
      def associate_firewall_policy(
        firewall_policy_arn : String,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::AssociateFirewallPolicyResponse
        input = Types::AssociateFirewallPolicyRequest.new(firewall_policy_arn: firewall_policy_arn, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        associate_firewall_policy(input)
      end
      def associate_firewall_policy(input : Types::AssociateFirewallPolicyRequest) : Types::AssociateFirewallPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FIREWALL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFirewallPolicyResponse, "AssociateFirewallPolicy")
      end

      # Associates the specified subnets in the Amazon VPC to the firewall. You can specify one subnet for
      # each of the Availability Zones that the VPC spans. This request creates an Network Firewall firewall
      # endpoint in each of the subnets. To enable the firewall's protections, you must also modify the
      # VPC's route tables for each subnet's Availability Zone, to redirect the traffic that's coming into
      # and going out of the zone through the firewall endpoint.
      def associate_subnets(
        subnet_mappings : Array(Types::SubnetMapping),
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::AssociateSubnetsResponse
        input = Types::AssociateSubnetsRequest.new(subnet_mappings: subnet_mappings, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        associate_subnets(input)
      end
      def associate_subnets(input : Types::AssociateSubnetsRequest) : Types::AssociateSubnetsResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SUBNETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateSubnetsResponse, "AssociateSubnets")
      end

      # Attaches ProxyRuleGroup resources to a ProxyConfiguration A Proxy Configuration defines the
      # monitoring and protection behavior for a Proxy. The details of the behavior are defined in the rule
      # groups that you add to your configuration.
      def attach_rule_groups_to_proxy_configuration(
        rule_groups : Array(Types::ProxyRuleGroupAttachment),
        update_token : String,
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil
      ) : Types::AttachRuleGroupsToProxyConfigurationResponse
        input = Types::AttachRuleGroupsToProxyConfigurationRequest.new(rule_groups: rule_groups, update_token: update_token, proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name)
        attach_rule_groups_to_proxy_configuration(input)
      end
      def attach_rule_groups_to_proxy_configuration(input : Types::AttachRuleGroupsToProxyConfigurationRequest) : Types::AttachRuleGroupsToProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::ATTACH_RULE_GROUPS_TO_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachRuleGroupsToProxyConfigurationResponse, "AttachRuleGroupsToProxyConfiguration")
      end

      # Creates an Network Firewall Firewall and accompanying FirewallStatus for a VPC. The firewall defines
      # the configuration settings for an Network Firewall firewall. The settings that you can define at
      # creation include the firewall policy, the subnets in your VPC to use for the firewall endpoints, and
      # any tags that are attached to the firewall Amazon Web Services resource. After you create a
      # firewall, you can provide additional settings, like the logging configuration. To update the
      # settings for a firewall, you use the operations that apply to the settings themselves, for example
      # UpdateLoggingConfiguration , AssociateSubnets , and UpdateFirewallDeleteProtection . To manage a
      # firewall's tags, use the standard Amazon Web Services resource tagging operations,
      # ListTagsForResource , TagResource , and UntagResource . To retrieve information about firewalls, use
      # ListFirewalls and DescribeFirewall . To generate a report on the last 30 days of traffic monitored
      # by a firewall, use StartAnalysisReport .
      def create_firewall(
        firewall_name : String,
        firewall_policy_arn : String,
        availability_zone_change_protection : Bool? = nil,
        availability_zone_mappings : Array(Types::AvailabilityZoneMapping)? = nil,
        delete_protection : Bool? = nil,
        description : String? = nil,
        enabled_analysis_types : Array(String)? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        firewall_policy_change_protection : Bool? = nil,
        subnet_change_protection : Bool? = nil,
        subnet_mappings : Array(Types::SubnetMapping)? = nil,
        tags : Array(Types::Tag)? = nil,
        transit_gateway_id : String? = nil,
        vpc_id : String? = nil
      ) : Types::CreateFirewallResponse
        input = Types::CreateFirewallRequest.new(firewall_name: firewall_name, firewall_policy_arn: firewall_policy_arn, availability_zone_change_protection: availability_zone_change_protection, availability_zone_mappings: availability_zone_mappings, delete_protection: delete_protection, description: description, enabled_analysis_types: enabled_analysis_types, encryption_configuration: encryption_configuration, firewall_policy_change_protection: firewall_policy_change_protection, subnet_change_protection: subnet_change_protection, subnet_mappings: subnet_mappings, tags: tags, transit_gateway_id: transit_gateway_id, vpc_id: vpc_id)
        create_firewall(input)
      end
      def create_firewall(input : Types::CreateFirewallRequest) : Types::CreateFirewallResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FIREWALL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFirewallResponse, "CreateFirewall")
      end

      # Creates the firewall policy for the firewall according to the specifications. An Network Firewall
      # firewall policy defines the behavior of a firewall, in a collection of stateless and stateful rule
      # groups and other settings. You can use one firewall policy for multiple firewalls.
      def create_firewall_policy(
        firewall_policy : Types::FirewallPolicy,
        firewall_policy_name : String,
        description : String? = nil,
        dry_run : Bool? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFirewallPolicyResponse
        input = Types::CreateFirewallPolicyRequest.new(firewall_policy: firewall_policy, firewall_policy_name: firewall_policy_name, description: description, dry_run: dry_run, encryption_configuration: encryption_configuration, tags: tags)
        create_firewall_policy(input)
      end
      def create_firewall_policy(input : Types::CreateFirewallPolicyRequest) : Types::CreateFirewallPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FIREWALL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFirewallPolicyResponse, "CreateFirewallPolicy")
      end

      # Creates an Network Firewall Proxy Attaches a Proxy configuration to a NAT Gateway. To manage a
      # proxy's tags, use the standard Amazon Web Services resource tagging operations, ListTagsForResource
      # , TagResource , and UntagResource . To retrieve information about proxies, use ListProxies and
      # DescribeProxy .
      def create_proxy(
        nat_gateway_id : String,
        proxy_name : String,
        tls_intercept_properties : Types::TlsInterceptPropertiesRequest,
        listener_properties : Array(Types::ListenerPropertyRequest)? = nil,
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProxyResponse
        input = Types::CreateProxyRequest.new(nat_gateway_id: nat_gateway_id, proxy_name: proxy_name, tls_intercept_properties: tls_intercept_properties, listener_properties: listener_properties, proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name, tags: tags)
        create_proxy(input)
      end
      def create_proxy(input : Types::CreateProxyRequest) : Types::CreateProxyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProxyResponse, "CreateProxy")
      end

      # Creates an Network Firewall ProxyConfiguration A Proxy Configuration defines the monitoring and
      # protection behavior for a Proxy. The details of the behavior are defined in the rule groups that you
      # add to your configuration. To manage a proxy configuration's tags, use the standard Amazon Web
      # Services resource tagging operations, ListTagsForResource , TagResource , and UntagResource . To
      # retrieve information about proxies, use ListProxyConfigurations and DescribeProxyConfiguration .
      def create_proxy_configuration(
        default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest,
        proxy_configuration_name : String,
        description : String? = nil,
        rule_group_arns : Array(String)? = nil,
        rule_group_names : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProxyConfigurationResponse
        input = Types::CreateProxyConfigurationRequest.new(default_rule_phase_actions: default_rule_phase_actions, proxy_configuration_name: proxy_configuration_name, description: description, rule_group_arns: rule_group_arns, rule_group_names: rule_group_names, tags: tags)
        create_proxy_configuration(input)
      end
      def create_proxy_configuration(input : Types::CreateProxyConfigurationRequest) : Types::CreateProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProxyConfigurationResponse, "CreateProxyConfiguration")
      end

      # Creates an Network Firewall ProxyRuleGroup Collections of related proxy filtering rules. Rule groups
      # help you manage and reuse sets of rules across multiple proxy configurations. To manage a proxy rule
      # group's tags, use the standard Amazon Web Services resource tagging operations, ListTagsForResource
      # , TagResource , and UntagResource . To retrieve information about proxy rule groups, use
      # ListProxyRuleGroups and DescribeProxyRuleGroup . To retrieve information about individual proxy
      # rules, use DescribeProxyRuleGroup and DescribeProxyRule .
      def create_proxy_rule_group(
        proxy_rule_group_name : String,
        description : String? = nil,
        rules : Types::ProxyRulesByRequestPhase? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProxyRuleGroupResponse
        input = Types::CreateProxyRuleGroupRequest.new(proxy_rule_group_name: proxy_rule_group_name, description: description, rules: rules, tags: tags)
        create_proxy_rule_group(input)
      end
      def create_proxy_rule_group(input : Types::CreateProxyRuleGroupRequest) : Types::CreateProxyRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROXY_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProxyRuleGroupResponse, "CreateProxyRuleGroup")
      end

      # Creates Network Firewall ProxyRule resources. Attaches new proxy rule(s) to an existing proxy rule
      # group. To retrieve information about individual proxy rules, use DescribeProxyRuleGroup and
      # DescribeProxyRule .
      def create_proxy_rules(
        rules : Types::CreateProxyRulesByRequestPhase,
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::CreateProxyRulesResponse
        input = Types::CreateProxyRulesRequest.new(rules: rules, proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        create_proxy_rules(input)
      end
      def create_proxy_rules(input : Types::CreateProxyRulesRequest) : Types::CreateProxyRulesResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROXY_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProxyRulesResponse, "CreateProxyRules")
      end

      # Creates the specified stateless or stateful rule group, which includes the rules for network traffic
      # inspection, a capacity setting, and tags. You provide your rule group specification in your request
      # using either RuleGroup or Rules .
      def create_rule_group(
        capacity : Int32,
        rule_group_name : String,
        type : String,
        analyze_rule_group : Bool? = nil,
        description : String? = nil,
        dry_run : Bool? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        rule_group : Types::RuleGroup? = nil,
        rules : String? = nil,
        source_metadata : Types::SourceMetadata? = nil,
        summary_configuration : Types::SummaryConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleGroupResponse
        input = Types::CreateRuleGroupRequest.new(capacity: capacity, rule_group_name: rule_group_name, type: type, analyze_rule_group: analyze_rule_group, description: description, dry_run: dry_run, encryption_configuration: encryption_configuration, rule_group: rule_group, rules: rules, source_metadata: source_metadata, summary_configuration: summary_configuration, tags: tags)
        create_rule_group(input)
      end
      def create_rule_group(input : Types::CreateRuleGroupRequest) : Types::CreateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleGroupResponse, "CreateRuleGroup")
      end

      # Creates an Network Firewall TLS inspection configuration. Network Firewall uses TLS inspection
      # configurations to decrypt your firewall's inbound and outbound SSL/TLS traffic. After decryption,
      # Network Firewall inspects the traffic according to your firewall policy's stateful rules, and then
      # re-encrypts it before sending it to its destination. You can enable inspection of your firewall's
      # inbound traffic, outbound traffic, or both. To use TLS inspection with your firewall, you must first
      # import or provision certificates using ACM, create a TLS inspection configuration, add that
      # configuration to a new firewall policy, and then associate that policy with your firewall. To update
      # the settings for a TLS inspection configuration, use UpdateTLSInspectionConfiguration . To manage a
      # TLS inspection configuration's tags, use the standard Amazon Web Services resource tagging
      # operations, ListTagsForResource , TagResource , and UntagResource . To retrieve information about
      # TLS inspection configurations, use ListTLSInspectionConfigurations and
      # DescribeTLSInspectionConfiguration . For more information about TLS inspection configurations, see
      # Inspecting SSL/TLS traffic with TLS inspection configurations in the Network Firewall Developer
      # Guide .
      def create_tls_inspection_configuration(
        tls_inspection_configuration : Types::TLSInspectionConfiguration,
        tls_inspection_configuration_name : String,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTLSInspectionConfigurationResponse
        input = Types::CreateTLSInspectionConfigurationRequest.new(tls_inspection_configuration: tls_inspection_configuration, tls_inspection_configuration_name: tls_inspection_configuration_name, description: description, encryption_configuration: encryption_configuration, tags: tags)
        create_tls_inspection_configuration(input)
      end
      def create_tls_inspection_configuration(input : Types::CreateTLSInspectionConfigurationRequest) : Types::CreateTLSInspectionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TLS_INSPECTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTLSInspectionConfigurationResponse, "CreateTLSInspectionConfiguration")
      end

      # Creates a firewall endpoint for an Network Firewall firewall. This type of firewall endpoint is
      # independent of the firewall endpoints that you specify in the Firewall itself, and you define it in
      # addition to those endpoints after the firewall has been created. You can define a VPC endpoint
      # association using a different VPC than the one you used in the firewall specifications.
      def create_vpc_endpoint_association(
        firewall_arn : String,
        subnet_mapping : Types::SubnetMapping,
        vpc_id : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVpcEndpointAssociationResponse
        input = Types::CreateVpcEndpointAssociationRequest.new(firewall_arn: firewall_arn, subnet_mapping: subnet_mapping, vpc_id: vpc_id, description: description, tags: tags)
        create_vpc_endpoint_association(input)
      end
      def create_vpc_endpoint_association(input : Types::CreateVpcEndpointAssociationRequest) : Types::CreateVpcEndpointAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_ENDPOINT_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcEndpointAssociationResponse, "CreateVpcEndpointAssociation")
      end

      # Deletes the specified Firewall and its FirewallStatus . This operation requires the firewall's
      # DeleteProtection flag to be FALSE . You can't revert this operation. You can check whether a
      # firewall is in use by reviewing the route tables for the Availability Zones where you have firewall
      # subnet mappings. Retrieve the subnet mappings by calling DescribeFirewall . You define and update
      # the route tables through Amazon VPC. As needed, update the route tables for the zones to remove the
      # firewall endpoints. When the route tables no longer use the firewall endpoints, you can remove the
      # firewall safely. To delete a firewall, remove the delete protection if you need to using
      # UpdateFirewallDeleteProtection , then delete the firewall by calling DeleteFirewall .
      def delete_firewall(
        firewall_arn : String? = nil,
        firewall_name : String? = nil
      ) : Types::DeleteFirewallResponse
        input = Types::DeleteFirewallRequest.new(firewall_arn: firewall_arn, firewall_name: firewall_name)
        delete_firewall(input)
      end
      def delete_firewall(input : Types::DeleteFirewallRequest) : Types::DeleteFirewallResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallResponse, "DeleteFirewall")
      end

      # Deletes the specified FirewallPolicy .
      def delete_firewall_policy(
        firewall_policy_arn : String? = nil,
        firewall_policy_name : String? = nil
      ) : Types::DeleteFirewallPolicyResponse
        input = Types::DeleteFirewallPolicyRequest.new(firewall_policy_arn: firewall_policy_arn, firewall_policy_name: firewall_policy_name)
        delete_firewall_policy(input)
      end
      def delete_firewall_policy(input : Types::DeleteFirewallPolicyRequest) : Types::DeleteFirewallPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallPolicyResponse, "DeleteFirewallPolicy")
      end

      # Deletes a transit gateway attachment from a Network Firewall. Either the firewall owner or the
      # transit gateway owner can delete the attachment. After you delete a transit gateway attachment,
      # traffic will no longer flow through the firewall endpoints. After you initiate the delete operation,
      # use DescribeFirewall to monitor the deletion status.
      def delete_network_firewall_transit_gateway_attachment(
        transit_gateway_attachment_id : String
      ) : Types::DeleteNetworkFirewallTransitGatewayAttachmentResponse
        input = Types::DeleteNetworkFirewallTransitGatewayAttachmentRequest.new(transit_gateway_attachment_id: transit_gateway_attachment_id)
        delete_network_firewall_transit_gateway_attachment(input)
      end
      def delete_network_firewall_transit_gateway_attachment(input : Types::DeleteNetworkFirewallTransitGatewayAttachmentRequest) : Types::DeleteNetworkFirewallTransitGatewayAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNetworkFirewallTransitGatewayAttachmentResponse, "DeleteNetworkFirewallTransitGatewayAttachment")
      end

      # Deletes the specified Proxy . Detaches a Proxy configuration from a NAT Gateway.
      def delete_proxy(
        nat_gateway_id : String,
        proxy_arn : String? = nil,
        proxy_name : String? = nil
      ) : Types::DeleteProxyResponse
        input = Types::DeleteProxyRequest.new(nat_gateway_id: nat_gateway_id, proxy_arn: proxy_arn, proxy_name: proxy_name)
        delete_proxy(input)
      end
      def delete_proxy(input : Types::DeleteProxyRequest) : Types::DeleteProxyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProxyResponse, "DeleteProxy")
      end

      # Deletes the specified ProxyConfiguration .
      def delete_proxy_configuration(
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil
      ) : Types::DeleteProxyConfigurationResponse
        input = Types::DeleteProxyConfigurationRequest.new(proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name)
        delete_proxy_configuration(input)
      end
      def delete_proxy_configuration(input : Types::DeleteProxyConfigurationRequest) : Types::DeleteProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProxyConfigurationResponse, "DeleteProxyConfiguration")
      end

      # Deletes the specified ProxyRuleGroup .
      def delete_proxy_rule_group(
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::DeleteProxyRuleGroupResponse
        input = Types::DeleteProxyRuleGroupRequest.new(proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        delete_proxy_rule_group(input)
      end
      def delete_proxy_rule_group(input : Types::DeleteProxyRuleGroupRequest) : Types::DeleteProxyRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROXY_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProxyRuleGroupResponse, "DeleteProxyRuleGroup")
      end

      # Deletes the specified ProxyRule (s). currently attached to a ProxyRuleGroup
      def delete_proxy_rules(
        rules : Array(String),
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::DeleteProxyRulesResponse
        input = Types::DeleteProxyRulesRequest.new(rules: rules, proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        delete_proxy_rules(input)
      end
      def delete_proxy_rules(input : Types::DeleteProxyRulesRequest) : Types::DeleteProxyRulesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROXY_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProxyRulesResponse, "DeleteProxyRules")
      end

      # Deletes a resource policy that you created in a PutResourcePolicy request.
      def delete_resource_policy(
        resource_arn : String
      ) : Types::DeleteResourcePolicyResponse
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Deletes the specified RuleGroup .
      def delete_rule_group(
        rule_group_arn : String? = nil,
        rule_group_name : String? = nil,
        type : String? = nil
      ) : Types::DeleteRuleGroupResponse
        input = Types::DeleteRuleGroupRequest.new(rule_group_arn: rule_group_arn, rule_group_name: rule_group_name, type: type)
        delete_rule_group(input)
      end
      def delete_rule_group(input : Types::DeleteRuleGroupRequest) : Types::DeleteRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleGroupResponse, "DeleteRuleGroup")
      end

      # Deletes the specified TLSInspectionConfiguration .
      def delete_tls_inspection_configuration(
        tls_inspection_configuration_arn : String? = nil,
        tls_inspection_configuration_name : String? = nil
      ) : Types::DeleteTLSInspectionConfigurationResponse
        input = Types::DeleteTLSInspectionConfigurationRequest.new(tls_inspection_configuration_arn: tls_inspection_configuration_arn, tls_inspection_configuration_name: tls_inspection_configuration_name)
        delete_tls_inspection_configuration(input)
      end
      def delete_tls_inspection_configuration(input : Types::DeleteTLSInspectionConfigurationRequest) : Types::DeleteTLSInspectionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TLS_INSPECTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTLSInspectionConfigurationResponse, "DeleteTLSInspectionConfiguration")
      end

      # Deletes the specified VpcEndpointAssociation . You can check whether an endpoint association is in
      # use by reviewing the route tables for the Availability Zones where you have the endpoint subnet
      # mapping. You can retrieve the subnet mapping by calling DescribeVpcEndpointAssociation . You define
      # and update the route tables through Amazon VPC. As needed, update the route tables for the
      # Availability Zone to remove the firewall endpoint for the association. When the route tables no
      # longer use the firewall endpoint, you can remove the endpoint association safely.
      def delete_vpc_endpoint_association(
        vpc_endpoint_association_arn : String
      ) : Types::DeleteVpcEndpointAssociationResponse
        input = Types::DeleteVpcEndpointAssociationRequest.new(vpc_endpoint_association_arn: vpc_endpoint_association_arn)
        delete_vpc_endpoint_association(input)
      end
      def delete_vpc_endpoint_association(input : Types::DeleteVpcEndpointAssociationRequest) : Types::DeleteVpcEndpointAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_ENDPOINT_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcEndpointAssociationResponse, "DeleteVpcEndpointAssociation")
      end

      # Returns the data objects for the specified firewall.
      def describe_firewall(
        firewall_arn : String? = nil,
        firewall_name : String? = nil
      ) : Types::DescribeFirewallResponse
        input = Types::DescribeFirewallRequest.new(firewall_arn: firewall_arn, firewall_name: firewall_name)
        describe_firewall(input)
      end
      def describe_firewall(input : Types::DescribeFirewallRequest) : Types::DescribeFirewallResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FIREWALL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFirewallResponse, "DescribeFirewall")
      end

      # Returns the high-level information about a firewall, including the Availability Zones where the
      # Firewall is currently in use.
      def describe_firewall_metadata(
        firewall_arn : String? = nil
      ) : Types::DescribeFirewallMetadataResponse
        input = Types::DescribeFirewallMetadataRequest.new(firewall_arn: firewall_arn)
        describe_firewall_metadata(input)
      end
      def describe_firewall_metadata(input : Types::DescribeFirewallMetadataRequest) : Types::DescribeFirewallMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FIREWALL_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFirewallMetadataResponse, "DescribeFirewallMetadata")
      end

      # Returns the data objects for the specified firewall policy.
      def describe_firewall_policy(
        firewall_policy_arn : String? = nil,
        firewall_policy_name : String? = nil
      ) : Types::DescribeFirewallPolicyResponse
        input = Types::DescribeFirewallPolicyRequest.new(firewall_policy_arn: firewall_policy_arn, firewall_policy_name: firewall_policy_name)
        describe_firewall_policy(input)
      end
      def describe_firewall_policy(input : Types::DescribeFirewallPolicyRequest) : Types::DescribeFirewallPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FIREWALL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFirewallPolicyResponse, "DescribeFirewallPolicy")
      end

      # Returns key information about a specific flow operation.
      def describe_flow_operation(
        firewall_arn : String,
        flow_operation_id : String,
        availability_zone : String? = nil,
        vpc_endpoint_association_arn : String? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::DescribeFlowOperationResponse
        input = Types::DescribeFlowOperationRequest.new(firewall_arn: firewall_arn, flow_operation_id: flow_operation_id, availability_zone: availability_zone, vpc_endpoint_association_arn: vpc_endpoint_association_arn, vpc_endpoint_id: vpc_endpoint_id)
        describe_flow_operation(input)
      end
      def describe_flow_operation(input : Types::DescribeFlowOperationRequest) : Types::DescribeFlowOperationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLOW_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFlowOperationResponse, "DescribeFlowOperation")
      end

      # Returns the logging configuration for the specified firewall.
      def describe_logging_configuration(
        firewall_arn : String? = nil,
        firewall_name : String? = nil
      ) : Types::DescribeLoggingConfigurationResponse
        input = Types::DescribeLoggingConfigurationRequest.new(firewall_arn: firewall_arn, firewall_name: firewall_name)
        describe_logging_configuration(input)
      end
      def describe_logging_configuration(input : Types::DescribeLoggingConfigurationRequest) : Types::DescribeLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLoggingConfigurationResponse, "DescribeLoggingConfiguration")
      end

      # Returns the data objects for the specified proxy.
      def describe_proxy(
        proxy_arn : String? = nil,
        proxy_name : String? = nil
      ) : Types::DescribeProxyResponse
        input = Types::DescribeProxyRequest.new(proxy_arn: proxy_arn, proxy_name: proxy_name)
        describe_proxy(input)
      end
      def describe_proxy(input : Types::DescribeProxyRequest) : Types::DescribeProxyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProxyResponse, "DescribeProxy")
      end

      # Returns the data objects for the specified proxy configuration.
      def describe_proxy_configuration(
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil
      ) : Types::DescribeProxyConfigurationResponse
        input = Types::DescribeProxyConfigurationRequest.new(proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name)
        describe_proxy_configuration(input)
      end
      def describe_proxy_configuration(input : Types::DescribeProxyConfigurationRequest) : Types::DescribeProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProxyConfigurationResponse, "DescribeProxyConfiguration")
      end

      # Returns the data objects for the specified proxy configuration for the specified proxy rule group.
      def describe_proxy_rule(
        proxy_rule_name : String,
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::DescribeProxyRuleResponse
        input = Types::DescribeProxyRuleRequest.new(proxy_rule_name: proxy_rule_name, proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        describe_proxy_rule(input)
      end
      def describe_proxy_rule(input : Types::DescribeProxyRuleRequest) : Types::DescribeProxyRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROXY_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProxyRuleResponse, "DescribeProxyRule")
      end

      # Returns the data objects for the specified proxy rule group.
      def describe_proxy_rule_group(
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::DescribeProxyRuleGroupResponse
        input = Types::DescribeProxyRuleGroupRequest.new(proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        describe_proxy_rule_group(input)
      end
      def describe_proxy_rule_group(input : Types::DescribeProxyRuleGroupRequest) : Types::DescribeProxyRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROXY_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProxyRuleGroupResponse, "DescribeProxyRuleGroup")
      end

      # Retrieves a resource policy that you created in a PutResourcePolicy request.
      def describe_resource_policy(
        resource_arn : String
      ) : Types::DescribeResourcePolicyResponse
        input = Types::DescribeResourcePolicyRequest.new(resource_arn: resource_arn)
        describe_resource_policy(input)
      end
      def describe_resource_policy(input : Types::DescribeResourcePolicyRequest) : Types::DescribeResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourcePolicyResponse, "DescribeResourcePolicy")
      end

      # Returns the data objects for the specified rule group.
      def describe_rule_group(
        analyze_rule_group : Bool? = nil,
        rule_group_arn : String? = nil,
        rule_group_name : String? = nil,
        type : String? = nil
      ) : Types::DescribeRuleGroupResponse
        input = Types::DescribeRuleGroupRequest.new(analyze_rule_group: analyze_rule_group, rule_group_arn: rule_group_arn, rule_group_name: rule_group_name, type: type)
        describe_rule_group(input)
      end
      def describe_rule_group(input : Types::DescribeRuleGroupRequest) : Types::DescribeRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRuleGroupResponse, "DescribeRuleGroup")
      end

      # High-level information about a rule group, returned by operations like create and describe. You can
      # use the information provided in the metadata to retrieve and manage a rule group. You can retrieve
      # all objects for a rule group by calling DescribeRuleGroup .
      def describe_rule_group_metadata(
        rule_group_arn : String? = nil,
        rule_group_name : String? = nil,
        type : String? = nil
      ) : Types::DescribeRuleGroupMetadataResponse
        input = Types::DescribeRuleGroupMetadataRequest.new(rule_group_arn: rule_group_arn, rule_group_name: rule_group_name, type: type)
        describe_rule_group_metadata(input)
      end
      def describe_rule_group_metadata(input : Types::DescribeRuleGroupMetadataRequest) : Types::DescribeRuleGroupMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RULE_GROUP_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRuleGroupMetadataResponse, "DescribeRuleGroupMetadata")
      end

      # Returns detailed information for a stateful rule group. For active threat defense Amazon Web
      # Services managed rule groups, this operation provides insight into the protections enabled by the
      # rule group, based on Suricata rule metadata fields. Summaries are available for rule groups you
      # manage and for active threat defense Amazon Web Services managed rule groups. To modify how threat
      # information appears in summaries, use the SummaryConfiguration parameter in UpdateRuleGroup .
      def describe_rule_group_summary(
        rule_group_arn : String? = nil,
        rule_group_name : String? = nil,
        type : String? = nil
      ) : Types::DescribeRuleGroupSummaryResponse
        input = Types::DescribeRuleGroupSummaryRequest.new(rule_group_arn: rule_group_arn, rule_group_name: rule_group_name, type: type)
        describe_rule_group_summary(input)
      end
      def describe_rule_group_summary(input : Types::DescribeRuleGroupSummaryRequest) : Types::DescribeRuleGroupSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RULE_GROUP_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRuleGroupSummaryResponse, "DescribeRuleGroupSummary")
      end

      # Returns the data objects for the specified TLS inspection configuration.
      def describe_tls_inspection_configuration(
        tls_inspection_configuration_arn : String? = nil,
        tls_inspection_configuration_name : String? = nil
      ) : Types::DescribeTLSInspectionConfigurationResponse
        input = Types::DescribeTLSInspectionConfigurationRequest.new(tls_inspection_configuration_arn: tls_inspection_configuration_arn, tls_inspection_configuration_name: tls_inspection_configuration_name)
        describe_tls_inspection_configuration(input)
      end
      def describe_tls_inspection_configuration(input : Types::DescribeTLSInspectionConfigurationRequest) : Types::DescribeTLSInspectionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TLS_INSPECTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTLSInspectionConfigurationResponse, "DescribeTLSInspectionConfiguration")
      end

      # Returns the data object for the specified VPC endpoint association.
      def describe_vpc_endpoint_association(
        vpc_endpoint_association_arn : String
      ) : Types::DescribeVpcEndpointAssociationResponse
        input = Types::DescribeVpcEndpointAssociationRequest.new(vpc_endpoint_association_arn: vpc_endpoint_association_arn)
        describe_vpc_endpoint_association(input)
      end
      def describe_vpc_endpoint_association(input : Types::DescribeVpcEndpointAssociationRequest) : Types::DescribeVpcEndpointAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VPC_ENDPOINT_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVpcEndpointAssociationResponse, "DescribeVpcEndpointAssociation")
      end

      # Detaches ProxyRuleGroup resources from a ProxyConfiguration A Proxy Configuration defines the
      # monitoring and protection behavior for a Proxy. The details of the behavior are defined in the rule
      # groups that you add to your configuration.
      def detach_rule_groups_from_proxy_configuration(
        update_token : String,
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil,
        rule_group_arns : Array(String)? = nil,
        rule_group_names : Array(String)? = nil
      ) : Types::DetachRuleGroupsFromProxyConfigurationResponse
        input = Types::DetachRuleGroupsFromProxyConfigurationRequest.new(update_token: update_token, proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name, rule_group_arns: rule_group_arns, rule_group_names: rule_group_names)
        detach_rule_groups_from_proxy_configuration(input)
      end
      def detach_rule_groups_from_proxy_configuration(input : Types::DetachRuleGroupsFromProxyConfigurationRequest) : Types::DetachRuleGroupsFromProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DETACH_RULE_GROUPS_FROM_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachRuleGroupsFromProxyConfigurationResponse, "DetachRuleGroupsFromProxyConfiguration")
      end

      # Removes the specified Availability Zone associations from a transit gateway-attached firewall. This
      # removes the firewall endpoints from these Availability Zones and stops traffic filtering in those
      # zones. Before removing an Availability Zone, ensure you've updated your transit gateway route tables
      # to redirect traffic appropriately. If AvailabilityZoneChangeProtection is enabled, you must first
      # disable it using UpdateAvailabilityZoneChangeProtection . To verify the status of your Availability
      # Zone changes, use DescribeFirewall .
      def disassociate_availability_zones(
        availability_zone_mappings : Array(Types::AvailabilityZoneMapping),
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::DisassociateAvailabilityZonesResponse
        input = Types::DisassociateAvailabilityZonesRequest.new(availability_zone_mappings: availability_zone_mappings, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        disassociate_availability_zones(input)
      end
      def disassociate_availability_zones(input : Types::DisassociateAvailabilityZonesRequest) : Types::DisassociateAvailabilityZonesResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_AVAILABILITY_ZONES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateAvailabilityZonesResponse, "DisassociateAvailabilityZones")
      end

      # Removes the specified subnet associations from the firewall. This removes the firewall endpoints
      # from the subnets and removes any network filtering protections that the endpoints were providing.
      def disassociate_subnets(
        subnet_ids : Array(String),
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::DisassociateSubnetsResponse
        input = Types::DisassociateSubnetsRequest.new(subnet_ids: subnet_ids, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        disassociate_subnets(input)
      end
      def disassociate_subnets(input : Types::DisassociateSubnetsRequest) : Types::DisassociateSubnetsResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SUBNETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateSubnetsResponse, "DisassociateSubnets")
      end

      # The results of a COMPLETED analysis report generated with StartAnalysisReport . For more
      # information, see AnalysisTypeReportResult .
      def get_analysis_report_results(
        analysis_report_id : String,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAnalysisReportResultsResponse
        input = Types::GetAnalysisReportResultsRequest.new(analysis_report_id: analysis_report_id, firewall_arn: firewall_arn, firewall_name: firewall_name, max_results: max_results, next_token: next_token)
        get_analysis_report_results(input)
      end
      def get_analysis_report_results(input : Types::GetAnalysisReportResultsRequest) : Types::GetAnalysisReportResultsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ANALYSIS_REPORT_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAnalysisReportResultsResponse, "GetAnalysisReportResults")
      end

      # Returns a list of all traffic analysis reports generated within the last 30 days.
      def list_analysis_reports(
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAnalysisReportsResponse
        input = Types::ListAnalysisReportsRequest.new(firewall_arn: firewall_arn, firewall_name: firewall_name, max_results: max_results, next_token: next_token)
        list_analysis_reports(input)
      end
      def list_analysis_reports(input : Types::ListAnalysisReportsRequest) : Types::ListAnalysisReportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ANALYSIS_REPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAnalysisReportsResponse, "ListAnalysisReports")
      end

      # Retrieves the metadata for the firewall policies that you have defined. Depending on your setting
      # for max results and the number of firewall policies, a single call might not return the full list.
      def list_firewall_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFirewallPoliciesResponse
        input = Types::ListFirewallPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_firewall_policies(input)
      end
      def list_firewall_policies(input : Types::ListFirewallPoliciesRequest) : Types::ListFirewallPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALL_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallPoliciesResponse, "ListFirewallPolicies")
      end

      # Retrieves the metadata for the firewalls that you have defined. If you provide VPC identifiers in
      # your request, this returns only the firewalls for those VPCs. Depending on your setting for max
      # results and the number of firewalls, a single call might not return the full list.
      def list_firewalls(
        max_results : Int32? = nil,
        next_token : String? = nil,
        vpc_ids : Array(String)? = nil
      ) : Types::ListFirewallsResponse
        input = Types::ListFirewallsRequest.new(max_results: max_results, next_token: next_token, vpc_ids: vpc_ids)
        list_firewalls(input)
      end
      def list_firewalls(input : Types::ListFirewallsRequest) : Types::ListFirewallsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FIREWALLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFirewallsResponse, "ListFirewalls")
      end

      # Returns the results of a specific flow operation. Flow operations let you manage the flows tracked
      # in the flow table, also known as the firewall table. A flow is network traffic that is monitored by
      # a firewall, either by stateful or stateless rules. For traffic to be considered part of a flow, it
      # must share Destination, DestinationPort, Direction, Protocol, Source, and SourcePort.
      def list_flow_operation_results(
        firewall_arn : String,
        flow_operation_id : String,
        availability_zone : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        vpc_endpoint_association_arn : String? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::ListFlowOperationResultsResponse
        input = Types::ListFlowOperationResultsRequest.new(firewall_arn: firewall_arn, flow_operation_id: flow_operation_id, availability_zone: availability_zone, max_results: max_results, next_token: next_token, vpc_endpoint_association_arn: vpc_endpoint_association_arn, vpc_endpoint_id: vpc_endpoint_id)
        list_flow_operation_results(input)
      end
      def list_flow_operation_results(input : Types::ListFlowOperationResultsRequest) : Types::ListFlowOperationResultsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLOW_OPERATION_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlowOperationResultsResponse, "ListFlowOperationResults")
      end

      # Returns a list of all flow operations ran in a specific firewall. You can optionally narrow the
      # request scope by specifying the operation type or Availability Zone associated with a firewall's
      # flow operations. Flow operations let you manage the flows tracked in the flow table, also known as
      # the firewall table. A flow is network traffic that is monitored by a firewall, either by stateful or
      # stateless rules. For traffic to be considered part of a flow, it must share Destination,
      # DestinationPort, Direction, Protocol, Source, and SourcePort.
      def list_flow_operations(
        firewall_arn : String,
        availability_zone : String? = nil,
        flow_operation_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        vpc_endpoint_association_arn : String? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::ListFlowOperationsResponse
        input = Types::ListFlowOperationsRequest.new(firewall_arn: firewall_arn, availability_zone: availability_zone, flow_operation_type: flow_operation_type, max_results: max_results, next_token: next_token, vpc_endpoint_association_arn: vpc_endpoint_association_arn, vpc_endpoint_id: vpc_endpoint_id)
        list_flow_operations(input)
      end
      def list_flow_operations(input : Types::ListFlowOperationsRequest) : Types::ListFlowOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLOW_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlowOperationsResponse, "ListFlowOperations")
      end

      # Retrieves the metadata for the proxies that you have defined. Depending on your setting for max
      # results and the number of proxies, a single call might not return the full list.
      def list_proxies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProxiesResponse
        input = Types::ListProxiesRequest.new(max_results: max_results, next_token: next_token)
        list_proxies(input)
      end
      def list_proxies(input : Types::ListProxiesRequest) : Types::ListProxiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROXIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProxiesResponse, "ListProxies")
      end

      # Retrieves the metadata for the proxy configuration that you have defined. Depending on your setting
      # for max results and the number of proxy configurations, a single call might not return the full
      # list.
      def list_proxy_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProxyConfigurationsResponse
        input = Types::ListProxyConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_proxy_configurations(input)
      end
      def list_proxy_configurations(input : Types::ListProxyConfigurationsRequest) : Types::ListProxyConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROXY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProxyConfigurationsResponse, "ListProxyConfigurations")
      end

      # Retrieves the metadata for the proxy rule groups that you have defined. Depending on your setting
      # for max results and the number of proxy rule groups, a single call might not return the full list.
      def list_proxy_rule_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProxyRuleGroupsResponse
        input = Types::ListProxyRuleGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_proxy_rule_groups(input)
      end
      def list_proxy_rule_groups(input : Types::ListProxyRuleGroupsRequest) : Types::ListProxyRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROXY_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProxyRuleGroupsResponse, "ListProxyRuleGroups")
      end

      # Retrieves the metadata for the rule groups that you have defined. Depending on your setting for max
      # results and the number of rule groups, a single call might not return the full list.
      def list_rule_groups(
        managed_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scope : String? = nil,
        subscription_status : String? = nil,
        type : String? = nil
      ) : Types::ListRuleGroupsResponse
        input = Types::ListRuleGroupsRequest.new(managed_type: managed_type, max_results: max_results, next_token: next_token, scope: scope, subscription_status: subscription_status, type: type)
        list_rule_groups(input)
      end
      def list_rule_groups(input : Types::ListRuleGroupsRequest) : Types::ListRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleGroupsResponse, "ListRuleGroups")
      end

      # Retrieves the metadata for the TLS inspection configurations that you have defined. Depending on
      # your setting for max results and the number of TLS inspection configurations, a single call might
      # not return the full list.
      def list_tls_inspection_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTLSInspectionConfigurationsResponse
        input = Types::ListTLSInspectionConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_tls_inspection_configurations(input)
      end
      def list_tls_inspection_configurations(input : Types::ListTLSInspectionConfigurationsRequest) : Types::ListTLSInspectionConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TLS_INSPECTION_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTLSInspectionConfigurationsResponse, "ListTLSInspectionConfigurations")
      end

      # Retrieves the tags associated with the specified resource. Tags are key:value pairs that you can use
      # to categorize and manage your resources, for purposes like billing. For example, you might set the
      # tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to
      # add to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon Web
      # Services resources that you manage through Network Firewall: firewalls, firewall policies, and rule
      # groups.
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

      # Retrieves the metadata for the VPC endpoint associations that you have defined. If you specify a
      # fireawll, this returns only the endpoint associations for that firewall. Depending on your setting
      # for max results and the number of associations, a single call might not return the full list.
      def list_vpc_endpoint_associations(
        firewall_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVpcEndpointAssociationsResponse
        input = Types::ListVpcEndpointAssociationsRequest.new(firewall_arn: firewall_arn, max_results: max_results, next_token: next_token)
        list_vpc_endpoint_associations(input)
      end
      def list_vpc_endpoint_associations(input : Types::ListVpcEndpointAssociationsRequest) : Types::ListVpcEndpointAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VPC_ENDPOINT_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVpcEndpointAssociationsResponse, "ListVpcEndpointAssociations")
      end

      # Creates or updates an IAM policy for your rule group, firewall policy, or firewall. Use this to
      # share these resources between accounts. This operation works in conjunction with the Amazon Web
      # Services Resource Access Manager (RAM) service to manage resource sharing for Network Firewall. For
      # information about using sharing with Network Firewall resources, see Sharing Network Firewall
      # resources in the Network Firewall Developer Guide . Use this operation to create or update a
      # resource policy for your Network Firewall rule group, firewall policy, or firewall. In the resource
      # policy, you specify the accounts that you want to share the Network Firewall resource with and the
      # operations that you want the accounts to be able to perform. When you add an account in the resource
      # policy, you then run the following Resource Access Manager (RAM) operations to access and accept the
      # shared resource. GetResourceShareInvitations - Returns the Amazon Resource Names (ARNs) of the
      # resource share invitations. AcceptResourceShareInvitation - Accepts the share invitation for a
      # specified resource share. For additional information about resource sharing using RAM, see Resource
      # Access Manager User Guide .
      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutResourcePolicyResponse
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Rejects a transit gateway attachment request for Network Firewall. When you reject the attachment
      # request, Network Firewall cancels the creation of routing components between the transit gateway and
      # firewall endpoints. Only the transit gateway owner can reject the attachment. After rejection, no
      # traffic will flow through the firewall endpoints for this attachment. Use DescribeFirewall to
      # monitor the rejection status. To accept the attachment instead of rejecting it, use
      # AcceptNetworkFirewallTransitGatewayAttachment . Once rejected, you cannot reverse this action. To
      # establish connectivity, you must create a new transit gateway-attached firewall.
      def reject_network_firewall_transit_gateway_attachment(
        transit_gateway_attachment_id : String
      ) : Types::RejectNetworkFirewallTransitGatewayAttachmentResponse
        input = Types::RejectNetworkFirewallTransitGatewayAttachmentRequest.new(transit_gateway_attachment_id: transit_gateway_attachment_id)
        reject_network_firewall_transit_gateway_attachment(input)
      end
      def reject_network_firewall_transit_gateway_attachment(input : Types::RejectNetworkFirewallTransitGatewayAttachmentRequest) : Types::RejectNetworkFirewallTransitGatewayAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_NETWORK_FIREWALL_TRANSIT_GATEWAY_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectNetworkFirewallTransitGatewayAttachmentResponse, "RejectNetworkFirewallTransitGatewayAttachment")
      end

      # Generates a traffic analysis report for the timeframe and traffic type you specify. For information
      # on the contents of a traffic analysis report, see AnalysisReport .
      def start_analysis_report(
        analysis_type : String,
        firewall_arn : String? = nil,
        firewall_name : String? = nil
      ) : Types::StartAnalysisReportResponse
        input = Types::StartAnalysisReportRequest.new(analysis_type: analysis_type, firewall_arn: firewall_arn, firewall_name: firewall_name)
        start_analysis_report(input)
      end
      def start_analysis_report(input : Types::StartAnalysisReportRequest) : Types::StartAnalysisReportResponse
        request = Protocol::JsonRpc.build_request(Model::START_ANALYSIS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAnalysisReportResponse, "StartAnalysisReport")
      end

      # Begins capturing the flows in a firewall, according to the filters you define. Captures are similar,
      # but not identical to snapshots. Capture operations provide visibility into flows that are not closed
      # and are tracked by a firewall's flow table. Unlike snapshots, captures are a time-boxed view. A flow
      # is network traffic that is monitored by a firewall, either by stateful or stateless rules. For
      # traffic to be considered part of a flow, it must share Destination, DestinationPort, Direction,
      # Protocol, Source, and SourcePort. To avoid encountering operation limits, you should avoid starting
      # captures with broad filters, like wide IP ranges. Instead, we recommend you define more specific
      # criteria with FlowFilters , like narrow IP ranges, ports, or protocols.
      def start_flow_capture(
        firewall_arn : String,
        flow_filters : Array(Types::FlowFilter),
        availability_zone : String? = nil,
        minimum_flow_age_in_seconds : Int32? = nil,
        vpc_endpoint_association_arn : String? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::StartFlowCaptureResponse
        input = Types::StartFlowCaptureRequest.new(firewall_arn: firewall_arn, flow_filters: flow_filters, availability_zone: availability_zone, minimum_flow_age_in_seconds: minimum_flow_age_in_seconds, vpc_endpoint_association_arn: vpc_endpoint_association_arn, vpc_endpoint_id: vpc_endpoint_id)
        start_flow_capture(input)
      end
      def start_flow_capture(input : Types::StartFlowCaptureRequest) : Types::StartFlowCaptureResponse
        request = Protocol::JsonRpc.build_request(Model::START_FLOW_CAPTURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFlowCaptureResponse, "StartFlowCapture")
      end

      # Begins the flushing of traffic from the firewall, according to the filters you define. When the
      # operation starts, impacted flows are temporarily marked as timed out before the Suricata engine
      # prunes, or flushes, the flows from the firewall table. While the flush completes, impacted flows are
      # processed as midstream traffic. This may result in a temporary increase in midstream traffic
      # metrics. We recommend that you double check your stream exception policy before you perform a flush
      # operation.
      def start_flow_flush(
        firewall_arn : String,
        flow_filters : Array(Types::FlowFilter),
        availability_zone : String? = nil,
        minimum_flow_age_in_seconds : Int32? = nil,
        vpc_endpoint_association_arn : String? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::StartFlowFlushResponse
        input = Types::StartFlowFlushRequest.new(firewall_arn: firewall_arn, flow_filters: flow_filters, availability_zone: availability_zone, minimum_flow_age_in_seconds: minimum_flow_age_in_seconds, vpc_endpoint_association_arn: vpc_endpoint_association_arn, vpc_endpoint_id: vpc_endpoint_id)
        start_flow_flush(input)
      end
      def start_flow_flush(input : Types::StartFlowFlushRequest) : Types::StartFlowFlushResponse
        request = Protocol::JsonRpc.build_request(Model::START_FLOW_FLUSH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFlowFlushResponse, "StartFlowFlush")
      end

      # Adds the specified tags to the specified resource. Tags are key:value pairs that you can use to
      # categorize and manage your resources, for purposes like billing. For example, you might set the tag
      # key to "customer" and the value to the customer name or ID. You can specify one or more tags to add
      # to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon Web
      # Services resources that you manage through Network Firewall: firewalls, firewall policies, and rule
      # groups.
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

      # Removes the tags with the specified keys from the specified resource. Tags are key:value pairs that
      # you can use to categorize and manage your resources, for purposes like billing. For example, you
      # might set the tag key to "customer" and the value to the customer name or ID. You can specify one or
      # more tags to add to each Amazon Web Services resource, up to 50 tags for a resource. You can manage
      # tags for the Amazon Web Services resources that you manage through Network Firewall: firewalls,
      # firewall policies, and rule groups.
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

      # Modifies the AvailabilityZoneChangeProtection setting for a transit gateway-attached firewall. When
      # enabled, this setting prevents accidental changes to the firewall's Availability Zone configuration.
      # This helps protect against disrupting traffic flow in production environments. When enabled, you
      # must disable this protection before using AssociateAvailabilityZones or
      # DisassociateAvailabilityZones to modify the firewall's Availability Zone configuration.
      def update_availability_zone_change_protection(
        availability_zone_change_protection : Bool,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateAvailabilityZoneChangeProtectionResponse
        input = Types::UpdateAvailabilityZoneChangeProtectionRequest.new(availability_zone_change_protection: availability_zone_change_protection, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_availability_zone_change_protection(input)
      end
      def update_availability_zone_change_protection(input : Types::UpdateAvailabilityZoneChangeProtectionRequest) : Types::UpdateAvailabilityZoneChangeProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AVAILABILITY_ZONE_CHANGE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAvailabilityZoneChangeProtectionResponse, "UpdateAvailabilityZoneChangeProtection")
      end

      # Enables specific types of firewall analysis on a specific firewall you define.
      def update_firewall_analysis_settings(
        enabled_analysis_types : Array(String)? = nil,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateFirewallAnalysisSettingsResponse
        input = Types::UpdateFirewallAnalysisSettingsRequest.new(enabled_analysis_types: enabled_analysis_types, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_firewall_analysis_settings(input)
      end
      def update_firewall_analysis_settings(input : Types::UpdateFirewallAnalysisSettingsRequest) : Types::UpdateFirewallAnalysisSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_ANALYSIS_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallAnalysisSettingsResponse, "UpdateFirewallAnalysisSettings")
      end

      # Modifies the flag, DeleteProtection , which indicates whether it is possible to delete the firewall.
      # If the flag is set to TRUE , the firewall is protected against deletion. This setting helps protect
      # against accidentally deleting a firewall that's in use.
      def update_firewall_delete_protection(
        delete_protection : Bool,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateFirewallDeleteProtectionResponse
        input = Types::UpdateFirewallDeleteProtectionRequest.new(delete_protection: delete_protection, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_firewall_delete_protection(input)
      end
      def update_firewall_delete_protection(input : Types::UpdateFirewallDeleteProtectionRequest) : Types::UpdateFirewallDeleteProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_DELETE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallDeleteProtectionResponse, "UpdateFirewallDeleteProtection")
      end

      # Modifies the description for the specified firewall. Use the description to help you identify the
      # firewall when you're working with it.
      def update_firewall_description(
        description : String? = nil,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateFirewallDescriptionResponse
        input = Types::UpdateFirewallDescriptionRequest.new(description: description, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_firewall_description(input)
      end
      def update_firewall_description(input : Types::UpdateFirewallDescriptionRequest) : Types::UpdateFirewallDescriptionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_DESCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallDescriptionResponse, "UpdateFirewallDescription")
      end

      # A complex type that contains settings for encryption of your firewall resources.
      def update_firewall_encryption_configuration(
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateFirewallEncryptionConfigurationResponse
        input = Types::UpdateFirewallEncryptionConfigurationRequest.new(encryption_configuration: encryption_configuration, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_firewall_encryption_configuration(input)
      end
      def update_firewall_encryption_configuration(input : Types::UpdateFirewallEncryptionConfigurationRequest) : Types::UpdateFirewallEncryptionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_ENCRYPTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallEncryptionConfigurationResponse, "UpdateFirewallEncryptionConfiguration")
      end

      # Updates the properties of the specified firewall policy.
      def update_firewall_policy(
        firewall_policy : Types::FirewallPolicy,
        update_token : String,
        description : String? = nil,
        dry_run : Bool? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        firewall_policy_arn : String? = nil,
        firewall_policy_name : String? = nil
      ) : Types::UpdateFirewallPolicyResponse
        input = Types::UpdateFirewallPolicyRequest.new(firewall_policy: firewall_policy, update_token: update_token, description: description, dry_run: dry_run, encryption_configuration: encryption_configuration, firewall_policy_arn: firewall_policy_arn, firewall_policy_name: firewall_policy_name)
        update_firewall_policy(input)
      end
      def update_firewall_policy(input : Types::UpdateFirewallPolicyRequest) : Types::UpdateFirewallPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallPolicyResponse, "UpdateFirewallPolicy")
      end

      # Modifies the flag, ChangeProtection , which indicates whether it is possible to change the firewall.
      # If the flag is set to TRUE , the firewall is protected from changes. This setting helps protect
      # against accidentally changing a firewall that's in use.
      def update_firewall_policy_change_protection(
        firewall_policy_change_protection : Bool,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateFirewallPolicyChangeProtectionResponse
        input = Types::UpdateFirewallPolicyChangeProtectionRequest.new(firewall_policy_change_protection: firewall_policy_change_protection, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_firewall_policy_change_protection(input)
      end
      def update_firewall_policy_change_protection(input : Types::UpdateFirewallPolicyChangeProtectionRequest) : Types::UpdateFirewallPolicyChangeProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FIREWALL_POLICY_CHANGE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFirewallPolicyChangeProtectionResponse, "UpdateFirewallPolicyChangeProtection")
      end

      # Sets the logging configuration for the specified firewall. To change the logging configuration,
      # retrieve the LoggingConfiguration by calling DescribeLoggingConfiguration , then change it and
      # provide the modified object to this update call. You must change the logging configuration one
      # LogDestinationConfig at a time inside the retrieved LoggingConfiguration object. You can perform
      # only one of the following actions in any call to UpdateLoggingConfiguration : Create a new log
      # destination object by adding a single LogDestinationConfig array element to LogDestinationConfigs .
      # Delete a log destination object by removing a single LogDestinationConfig array element from
      # LogDestinationConfigs . Change the LogDestination setting in a single LogDestinationConfig array
      # element. You can't change the LogDestinationType or LogType in a LogDestinationConfig . To change
      # these settings, delete the existing LogDestinationConfig object and create a new one, using two
      # separate calls to this update operation.
      def update_logging_configuration(
        enable_monitoring_dashboard : Bool? = nil,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        logging_configuration : Types::LoggingConfiguration? = nil
      ) : Types::UpdateLoggingConfigurationResponse
        input = Types::UpdateLoggingConfigurationRequest.new(enable_monitoring_dashboard: enable_monitoring_dashboard, firewall_arn: firewall_arn, firewall_name: firewall_name, logging_configuration: logging_configuration)
        update_logging_configuration(input)
      end
      def update_logging_configuration(input : Types::UpdateLoggingConfigurationRequest) : Types::UpdateLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLoggingConfigurationResponse, "UpdateLoggingConfiguration")
      end

      # Updates the properties of the specified proxy.
      def update_proxy(
        nat_gateway_id : String,
        update_token : String,
        listener_properties_to_add : Array(Types::ListenerPropertyRequest)? = nil,
        listener_properties_to_remove : Array(Types::ListenerPropertyRequest)? = nil,
        proxy_arn : String? = nil,
        proxy_name : String? = nil,
        tls_intercept_properties : Types::TlsInterceptPropertiesRequest? = nil
      ) : Types::UpdateProxyResponse
        input = Types::UpdateProxyRequest.new(nat_gateway_id: nat_gateway_id, update_token: update_token, listener_properties_to_add: listener_properties_to_add, listener_properties_to_remove: listener_properties_to_remove, proxy_arn: proxy_arn, proxy_name: proxy_name, tls_intercept_properties: tls_intercept_properties)
        update_proxy(input)
      end
      def update_proxy(input : Types::UpdateProxyRequest) : Types::UpdateProxyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProxyResponse, "UpdateProxy")
      end

      # Updates the properties of the specified proxy configuration.
      def update_proxy_configuration(
        default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest,
        update_token : String,
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil
      ) : Types::UpdateProxyConfigurationResponse
        input = Types::UpdateProxyConfigurationRequest.new(default_rule_phase_actions: default_rule_phase_actions, update_token: update_token, proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name)
        update_proxy_configuration(input)
      end
      def update_proxy_configuration(input : Types::UpdateProxyConfigurationRequest) : Types::UpdateProxyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROXY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProxyConfigurationResponse, "UpdateProxyConfiguration")
      end

      # Updates the properties of the specified proxy rule.
      def update_proxy_rule(
        proxy_rule_name : String,
        update_token : String,
        action : String? = nil,
        add_conditions : Array(Types::ProxyRuleCondition)? = nil,
        description : String? = nil,
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil,
        remove_conditions : Array(Types::ProxyRuleCondition)? = nil
      ) : Types::UpdateProxyRuleResponse
        input = Types::UpdateProxyRuleRequest.new(proxy_rule_name: proxy_rule_name, update_token: update_token, action: action, add_conditions: add_conditions, description: description, proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name, remove_conditions: remove_conditions)
        update_proxy_rule(input)
      end
      def update_proxy_rule(input : Types::UpdateProxyRuleRequest) : Types::UpdateProxyRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROXY_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProxyRuleResponse, "UpdateProxyRule")
      end

      # Updates proxy rule group priorities within a proxy configuration.
      def update_proxy_rule_group_priorities(
        rule_groups : Array(Types::ProxyRuleGroupPriority),
        update_token : String,
        proxy_configuration_arn : String? = nil,
        proxy_configuration_name : String? = nil
      ) : Types::UpdateProxyRuleGroupPrioritiesResponse
        input = Types::UpdateProxyRuleGroupPrioritiesRequest.new(rule_groups: rule_groups, update_token: update_token, proxy_configuration_arn: proxy_configuration_arn, proxy_configuration_name: proxy_configuration_name)
        update_proxy_rule_group_priorities(input)
      end
      def update_proxy_rule_group_priorities(input : Types::UpdateProxyRuleGroupPrioritiesRequest) : Types::UpdateProxyRuleGroupPrioritiesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROXY_RULE_GROUP_PRIORITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProxyRuleGroupPrioritiesResponse, "UpdateProxyRuleGroupPriorities")
      end

      # Updates proxy rule priorities within a proxy rule group.
      def update_proxy_rule_priorities(
        rule_group_request_phase : String,
        rules : Array(Types::ProxyRulePriority),
        update_token : String,
        proxy_rule_group_arn : String? = nil,
        proxy_rule_group_name : String? = nil
      ) : Types::UpdateProxyRulePrioritiesResponse
        input = Types::UpdateProxyRulePrioritiesRequest.new(rule_group_request_phase: rule_group_request_phase, rules: rules, update_token: update_token, proxy_rule_group_arn: proxy_rule_group_arn, proxy_rule_group_name: proxy_rule_group_name)
        update_proxy_rule_priorities(input)
      end
      def update_proxy_rule_priorities(input : Types::UpdateProxyRulePrioritiesRequest) : Types::UpdateProxyRulePrioritiesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROXY_RULE_PRIORITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProxyRulePrioritiesResponse, "UpdateProxyRulePriorities")
      end

      # Updates the rule settings for the specified rule group. You use a rule group by reference in one or
      # more firewall policies. When you modify a rule group, you modify all firewall policies that use the
      # rule group. To update a rule group, first call DescribeRuleGroup to retrieve the current RuleGroup
      # object, update the object as needed, and then provide the updated object to this call.
      def update_rule_group(
        update_token : String,
        analyze_rule_group : Bool? = nil,
        description : String? = nil,
        dry_run : Bool? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        rule_group : Types::RuleGroup? = nil,
        rule_group_arn : String? = nil,
        rule_group_name : String? = nil,
        rules : String? = nil,
        source_metadata : Types::SourceMetadata? = nil,
        summary_configuration : Types::SummaryConfiguration? = nil,
        type : String? = nil
      ) : Types::UpdateRuleGroupResponse
        input = Types::UpdateRuleGroupRequest.new(update_token: update_token, analyze_rule_group: analyze_rule_group, description: description, dry_run: dry_run, encryption_configuration: encryption_configuration, rule_group: rule_group, rule_group_arn: rule_group_arn, rule_group_name: rule_group_name, rules: rules, source_metadata: source_metadata, summary_configuration: summary_configuration, type: type)
        update_rule_group(input)
      end
      def update_rule_group(input : Types::UpdateRuleGroupRequest) : Types::UpdateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleGroupResponse, "UpdateRuleGroup")
      end

      def update_subnet_change_protection(
        subnet_change_protection : Bool,
        firewall_arn : String? = nil,
        firewall_name : String? = nil,
        update_token : String? = nil
      ) : Types::UpdateSubnetChangeProtectionResponse
        input = Types::UpdateSubnetChangeProtectionRequest.new(subnet_change_protection: subnet_change_protection, firewall_arn: firewall_arn, firewall_name: firewall_name, update_token: update_token)
        update_subnet_change_protection(input)
      end
      def update_subnet_change_protection(input : Types::UpdateSubnetChangeProtectionRequest) : Types::UpdateSubnetChangeProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SUBNET_CHANGE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSubnetChangeProtectionResponse, "UpdateSubnetChangeProtection")
      end

      # Updates the TLS inspection configuration settings for the specified TLS inspection configuration.
      # You use a TLS inspection configuration by referencing it in one or more firewall policies. When you
      # modify a TLS inspection configuration, you modify all firewall policies that use the TLS inspection
      # configuration. To update a TLS inspection configuration, first call
      # DescribeTLSInspectionConfiguration to retrieve the current TLSInspectionConfiguration object, update
      # the object as needed, and then provide the updated object to this call.
      def update_tls_inspection_configuration(
        tls_inspection_configuration : Types::TLSInspectionConfiguration,
        update_token : String,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tls_inspection_configuration_arn : String? = nil,
        tls_inspection_configuration_name : String? = nil
      ) : Types::UpdateTLSInspectionConfigurationResponse
        input = Types::UpdateTLSInspectionConfigurationRequest.new(tls_inspection_configuration: tls_inspection_configuration, update_token: update_token, description: description, encryption_configuration: encryption_configuration, tls_inspection_configuration_arn: tls_inspection_configuration_arn, tls_inspection_configuration_name: tls_inspection_configuration_name)
        update_tls_inspection_configuration(input)
      end
      def update_tls_inspection_configuration(input : Types::UpdateTLSInspectionConfigurationRequest) : Types::UpdateTLSInspectionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TLS_INSPECTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTLSInspectionConfigurationResponse, "UpdateTLSInspectionConfiguration")
      end
    end
  end
end
