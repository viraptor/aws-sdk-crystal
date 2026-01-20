require "json"

module AwsSdk
  module Route53Resolver
    module Types

      # The current account doesn't have the IAM permissions required to perform the specified Resolver
      # operation. This error can also be thrown when a customer has reached the 5120 character limit for a
      # resource policy for CloudWatch Logs.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateFirewallRuleGroupRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # The unique identifier of the firewall rule group.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        # A name that lets you identify the association, to manage and use it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The setting that determines the processing order of the rule group among the rule groups that you
        # associate with the specified VPC. DNS Firewall filters VPC traffic starting from the rule group with
        # the lowest numeric priority setting. You must specify a unique priority for each rule group that you
        # associate with a single VPC. To make it easier to insert rule groups later, leave space between the
        # numbers, for example, use 101, 200, and so on. You can change the priority setting for a rule group
        # association after you create it. The allowed values for Priority are between 100 and 9900.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The unique identifier of the VPC that you want to associate with the rule group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # If enabled, this setting disallows modification or removal of the association, to help prevent
        # against accidentally altering DNS firewall protections. When you create the association, the default
        # setting is DISABLED .

        @[JSON::Field(key: "MutationProtection")]
        getter mutation_protection : String?

        # A list of the tag keys and values that you want to associate with the rule group association.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creator_request_id : String,
          @firewall_rule_group_id : String,
          @name : String,
          @priority : Int32,
          @vpc_id : String,
          @mutation_protection : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct AssociateFirewallRuleGroupResponse
        include JSON::Serializable

        # The association that you just created. The association has an ID that you can use to identify it in
        # other requests, like update and delete.

        @[JSON::Field(key: "FirewallRuleGroupAssociation")]
        getter firewall_rule_group_association : Types::FirewallRuleGroupAssociation?

        def initialize(
          @firewall_rule_group_association : Types::FirewallRuleGroupAssociation? = nil
        )
        end
      end


      struct AssociateResolverEndpointIpAddressRequest
        include JSON::Serializable

        # Either the IPv4 address that you want to add to a Resolver endpoint or a subnet ID. If you specify a
        # subnet ID, Resolver chooses an IP address for you from the available IPs in the specified subnet.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : Types::IpAddressUpdate

        # The ID of the Resolver endpoint that you want to associate IP addresses with.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        def initialize(
          @ip_address : Types::IpAddressUpdate,
          @resolver_endpoint_id : String
        )
        end
      end


      struct AssociateResolverEndpointIpAddressResponse
        include JSON::Serializable

        # The response to an AssociateResolverEndpointIpAddress request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct AssociateResolverQueryLogConfigRequest
        include JSON::Serializable

        # The ID of the query logging configuration that you want to associate a VPC with.

        @[JSON::Field(key: "ResolverQueryLogConfigId")]
        getter resolver_query_log_config_id : String

        # The ID of an Amazon VPC that you want this query logging configuration to log queries for. The VPCs
        # and the query logging configuration must be in the same Region.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resolver_query_log_config_id : String,
          @resource_id : String
        )
        end
      end


      struct AssociateResolverQueryLogConfigResponse
        include JSON::Serializable

        # A complex type that contains settings for a specified association between an Amazon VPC and a query
        # logging configuration.

        @[JSON::Field(key: "ResolverQueryLogConfigAssociation")]
        getter resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation?

        def initialize(
          @resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation? = nil
        )
        end
      end


      struct AssociateResolverRuleRequest
        include JSON::Serializable

        # The ID of the Resolver rule that you want to associate with the VPC. To list the existing Resolver
        # rules, use ListResolverRules .

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String

        # The ID of the VPC that you want to associate the Resolver rule with.

        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String

        # A name for the association that you're creating between a Resolver rule and a VPC. The name can be
        # up to 64 characters long and can contain letters (a-z, A-Z), numbers (0-9), hyphens (-), underscores
        # (_), and spaces. The name cannot consist of only numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @resolver_rule_id : String,
          @vpc_id : String,
          @name : String? = nil
        )
        end
      end


      struct AssociateResolverRuleResponse
        include JSON::Serializable

        # Information about the AssociateResolverRule request, including the status of the request.

        @[JSON::Field(key: "ResolverRuleAssociation")]
        getter resolver_rule_association : Types::ResolverRuleAssociation?

        def initialize(
          @resolver_rule_association : Types::ResolverRuleAssociation? = nil
        )
        end
      end

      # The requested state transition isn't valid. For example, you can't delete a firewall domain list if
      # it is in the process of being deleted, or you can't import domains into a domain list that is in the
      # process of being deleted.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateFirewallDomainListRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows you to retry failed requests without the
        # risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # A name that lets you identify the domain list to manage and use it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the tag keys and values that you want to associate with the domain list.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creator_request_id : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFirewallDomainListResponse
        include JSON::Serializable

        # The domain list that you just created.

        @[JSON::Field(key: "FirewallDomainList")]
        getter firewall_domain_list : Types::FirewallDomainList?

        def initialize(
          @firewall_domain_list : Types::FirewallDomainList? = nil
        )
        end
      end


      struct CreateFirewallRuleGroupRequest
        include JSON::Serializable

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # A name that lets you identify the rule group, to manage and use it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the tag keys and values that you want to associate with the rule group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creator_request_id : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFirewallRuleGroupResponse
        include JSON::Serializable

        # A collection of rules used to filter DNS network traffic.

        @[JSON::Field(key: "FirewallRuleGroup")]
        getter firewall_rule_group : Types::FirewallRuleGroup?

        def initialize(
          @firewall_rule_group : Types::FirewallRuleGroup? = nil
        )
        end
      end


      struct CreateFirewallRuleRequest
        include JSON::Serializable

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule: ALLOW - Permit the request to go
        # through. Not available for DNS Firewall Advanced rules. ALERT - Permit the request and send metrics
        # and logs to Cloud Watch. BLOCK - Disallow the request. This option requires additional details in
        # the rule's BlockResponse .

        @[JSON::Field(key: "Action")]
        getter action : String

        # A unique string that identifies the request and that allows you to retry failed requests without the
        # risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # The unique identifier of the firewall rule group where you want to create the rule.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        # A name that lets you identify the rule in the rule group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The setting that determines the processing order of the rule in the rule group. DNS Firewall
        # processes the rules in a rule group by order of priority, starting from the lowest setting. You must
        # specify a unique priority for each rule in a rule group. To make it easier to insert rules later,
        # leave space between the numbers, for example, use 100, 200, and so on. You can change the priority
        # setting for the rules in a rule group at any time.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE . This
        # setting is required if the BlockResponse setting is OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE . This setting is required if the BlockResponse setting is
        # OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        # This setting is required if the BlockResponse setting is OVERRIDE .

        @[JSON::Field(key: "BlockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request, used with the rule action setting BLOCK .
        # NODATA - Respond indicating that the query was successful, but no response is available for it.
        # NXDOMAIN - Respond indicating that the domain name that's in the query doesn't exist. OVERRIDE -
        # Provide a custom override in the response. This option requires custom handling details in the
        # rule's BlockOverride* settings. This setting is required if the rule action setting is BLOCK .

        @[JSON::Field(key: "BlockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule. The confidence level values mean: LOW : Provides the highest detection
        # rate for threats, but also increases false positives. MEDIUM : Provides a balance between detecting
        # threats and false positives. HIGH : Detects only the most well corroborated threats with a low rate
        # of false positives.

        @[JSON::Field(key: "ConfidenceThreshold")]
        getter confidence_threshold : String?

        # Use to create a DNS Firewall Advanced rule.

        @[JSON::Field(key: "DnsThreatProtection")]
        getter dns_threat_protection : String?

        # The ID of the domain list that you want to use in the rule. Can't be used together with
        # DnsThreatProtecton .

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String?

        # How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such as CNAME or
        # DNAME. INSPECT_REDIRECTION_DOMAIN : (Default) inspects all domains in the redirection chain. The
        # individual domains in the redirection chain must be added to the domain list.
        # TRUST_REDIRECTION_DOMAIN : Inspects only the first domain in the redirection chain. You don't need
        # to add the subsequent domains in the domain in the redirection list to the domain list.

        @[JSON::Field(key: "FirewallDomainRedirectionAction")]
        getter firewall_domain_redirection_action : String?

        # The DNS query type you want the rule to evaluate. Allowed values are; A: Returns an IPv4 address.
        # AAAA: Returns an Ipv6 address. CAA: Restricts CAs that can create SSL/TLS certifications for the
        # domain. CNAME: Returns another domain name. DS: Record that identifies the DNSSEC signing key of a
        # delegated zone. MX: Specifies mail servers. NAPTR: Regular-expression-based rewriting of domain
        # names. NS: Authoritative name servers. PTR: Maps an IP address to a domain name. SOA: Start of
        # authority record for the zone. SPF: Lists the servers authorized to send emails from a domain. SRV:
        # Application specific values that identify servers. TXT: Verifies email senders and
        # application-specific values. A query type you define by using the DNS type ID, for example 28 for
        # AAAA. The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334, for example,
        # TYPE28. For more information, see List of DNS record types .

        @[JSON::Field(key: "Qtype")]
        getter qtype : String?

        def initialize(
          @action : String,
          @creator_request_id : String,
          @firewall_rule_group_id : String,
          @name : String,
          @priority : Int32,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @dns_threat_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @firewall_domain_redirection_action : String? = nil,
          @qtype : String? = nil
        )
        end
      end


      struct CreateFirewallRuleResponse
        include JSON::Serializable

        # The firewall rule that you just created.

        @[JSON::Field(key: "FirewallRule")]
        getter firewall_rule : Types::FirewallRule?

        def initialize(
          @firewall_rule : Types::FirewallRule? = nil
        )
        end
      end


      struct CreateOutpostResolverRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # A friendly name that lets you easily find a configuration in the Resolver dashboard in the Route 53
        # console.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Outpost. If you specify this, you must also specify a value
        # for the PreferredInstanceType .

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String

        # The Amazon EC2 instance type. If you specify this, you must also specify a value for the OutpostArn
        # .

        @[JSON::Field(key: "PreferredInstanceType")]
        getter preferred_instance_type : String

        # Number of Amazon EC2 instances for the Resolver on Outpost. The default and minimal value is 4.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # A string that helps identify the Route 53 Resolvers on Outpost.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creator_request_id : String,
          @name : String,
          @outpost_arn : String,
          @preferred_instance_type : String,
          @instance_count : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateOutpostResolverResponse
        include JSON::Serializable

        # Information about the CreateOutpostResolver request, including the status of the request.

        @[JSON::Field(key: "OutpostResolver")]
        getter outpost_resolver : Types::OutpostResolver?

        def initialize(
          @outpost_resolver : Types::OutpostResolver? = nil
        )
        end
      end


      struct CreateResolverEndpointRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # Specify the applicable value: INBOUND : Resolver forwards DNS queries to the DNS service for a VPC
        # from your network. OUTBOUND : Resolver forwards DNS queries from the DNS service for a VPC to your
        # network. INBOUND_DELEGATION : Resolver delegates queries to Route 53 private hosted zones from your
        # network.

        @[JSON::Field(key: "Direction")]
        getter direction : String

        # The subnets and IP addresses in your VPC that DNS queries originate from (for outbound endpoints) or
        # that you forward DNS queries to (for inbound endpoints). The subnet ID uniquely identifies a VPC.
        # Even though the minimum is 1, Route 53 requires that you create at least two.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(Types::IpAddressRequest)

        # The ID of one or more security groups that you want to use to control access to this VPC. The
        # security group that you specify must include one or more inbound rules (for inbound Resolver
        # endpoints) or outbound rules (for outbound Resolver endpoints). Inbound and outbound rules must
        # allow TCP and UDP access. For inbound access, open port 53. For outbound access, open the port that
        # you're using for DNS queries on your network. Some security group rules will cause your connection
        # to be tracked. For outbound resolver endpoint, it can potentially impact the maximum queries per
        # second from outbound endpoint to your target name server. For inbound resolver endpoint, it can
        # bring down the overall maximum queries per second per IP address to as low as 1500. To avoid
        # connection tracking caused by security group, see Untracked connections .

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # A friendly name that lets you easily find a configuration in the Resolver dashboard in the Route 53
        # console.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the Outpost. If you specify this, you must also specify a value
        # for the PreferredInstanceType .

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The instance type. If you specify this, you must also specify a value for the OutpostArn .

        @[JSON::Field(key: "PreferredInstanceType")]
        getter preferred_instance_type : String?

        # The protocols you want to use for the endpoint. DoH-FIPS is applicable for default inbound endpoints
        # only. For a default inbound endpoint you can apply the protocols as follows: Do53 and DoH in
        # combination. Do53 and DoH-FIPS in combination. Do53 alone. DoH alone. DoH-FIPS alone. None, which is
        # treated as Do53. For a delegation inbound endpoint you can use Do53 only. For an outbound endpoint
        # you can apply the protocols as follows: Do53 and DoH in combination. Do53 alone. DoH alone. None,
        # which is treated as Do53.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # For the endpoint type you can choose either IPv4, IPv6, or dual-stack. A dual-stack endpoint means
        # that it will resolve via both IPv4 and IPv6. This endpoint type is applied to all IP addresses.

        @[JSON::Field(key: "ResolverEndpointType")]
        getter resolver_endpoint_type : String?

        # Specifies whether RNI enhanced metrics are enabled for the Resolver endpoints. When set to true,
        # one-minute granular metrics are published in CloudWatch for each RNI associated with this endpoint.
        # When set to false, metrics are not published. Default is false. Standard CloudWatch pricing and
        # charges are applied for using the Route 53 Resolver endpoint RNI enhanced metrics. For more
        # information, see Detailed metrics .

        @[JSON::Field(key: "RniEnhancedMetricsEnabled")]
        getter rni_enhanced_metrics_enabled : Bool?

        # A list of the tag keys and values that you want to associate with the endpoint.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether target name server metrics are enabled for the outbound Resolver endpoints. When
        # set to true, one-minute granular metrics are published in CloudWatch for each target name server
        # associated with this endpoint. When set to false, metrics are not published. Default is false. This
        # is not supported for inbound Resolver endpoints. Standard CloudWatch pricing and charges are applied
        # for using the Route 53 Resolver endpoint target name server metrics. For more information, see
        # Detailed metrics .

        @[JSON::Field(key: "TargetNameServerMetricsEnabled")]
        getter target_name_server_metrics_enabled : Bool?

        def initialize(
          @creator_request_id : String,
          @direction : String,
          @ip_addresses : Array(Types::IpAddressRequest),
          @security_group_ids : Array(String),
          @name : String? = nil,
          @outpost_arn : String? = nil,
          @preferred_instance_type : String? = nil,
          @protocols : Array(String)? = nil,
          @resolver_endpoint_type : String? = nil,
          @rni_enhanced_metrics_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_name_server_metrics_enabled : Bool? = nil
        )
        end
      end


      struct CreateResolverEndpointResponse
        include JSON::Serializable

        # Information about the CreateResolverEndpoint request, including the status of the request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct CreateResolverQueryLogConfigRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # The ARN of the resource that you want Resolver to send query logs. You can send query logs to an S3
        # bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery stream. Examples of valid
        # values include the following: S3 bucket : arn:aws:s3:::amzn-s3-demo-bucket You can optionally append
        # a file prefix to the end of the ARN. arn:aws:s3:::amzn-s3-demo-bucket/development/ CloudWatch Logs
        # log group : arn:aws:logs:us-west-1:123456789012:log-group:/mystack-testgroup-12ABC1AB12A1:* Kinesis
        # Data Firehose delivery stream : arn:aws:kinesis:us-east-2:0123456789:stream/my_stream_name

        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String

        # The name that you want to give the query logging configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the tag keys and values that you want to associate with the query logging configuration.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @creator_request_id : String,
          @destination_arn : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateResolverQueryLogConfigResponse
        include JSON::Serializable

        # Information about the CreateResolverQueryLogConfig request, including the status of the request.

        @[JSON::Field(key: "ResolverQueryLogConfig")]
        getter resolver_query_log_config : Types::ResolverQueryLogConfig?

        def initialize(
          @resolver_query_log_config : Types::ResolverQueryLogConfig? = nil
        )
        end
      end


      struct CreateResolverRuleRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string, for example, a
        # date/time stamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String

        # When you want to forward DNS queries for specified domain name to resolvers on your network, specify
        # FORWARD or DELEGATE . When you have a forwarding rule to forward DNS queries for a domain to your
        # network and you want Resolver to process queries for a subdomain of that domain, specify SYSTEM .
        # For example, to forward DNS queries for example.com to resolvers on your network, you create a rule
        # and specify FORWARD for RuleType . To then have Resolver process queries for apex.example.com, you
        # create a rule and specify SYSTEM for RuleType . Currently, only Resolver can create rules that have
        # a value of RECURSIVE for RuleType .

        @[JSON::Field(key: "RuleType")]
        getter rule_type : String

        # DNS queries with the delegation records that match this domain name are forwarded to the resolvers
        # on your network.

        @[JSON::Field(key: "DelegationRecord")]
        getter delegation_record : String?

        # DNS queries for this domain name are forwarded to the IP addresses that you specify in TargetIps .
        # If a query matches multiple Resolver rules (example.com and www.example.com), outbound DNS queries
        # are routed using the Resolver rule that contains the most specific domain name (www.example.com).

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # A friendly name that lets you easily find a rule in the Resolver dashboard in the Route 53 console.
        # The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers (0-9), hyphens
        # (-), underscores (_), and spaces. The name cannot consist of only numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the outbound Resolver endpoint that you want to use to route DNS queries to the IP
        # addresses that you specify in TargetIps .

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String?

        # A list of the tag keys and values that you want to associate with the endpoint.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The IPs that you want Resolver to forward DNS queries to. You can specify either Ipv4 or Ipv6
        # addresses but not both in the same rule. Separate IP addresses with a space. TargetIps is available
        # only when the value of Rule type is FORWARD . You should not provide TargetIps when the Rule type is
        # DELEGATE . when creating a DELEGATE rule, you must not provide the TargetIps parameter. If you
        # provide the TargetIps , you may receive an ERROR message similar to "Delegate resolver rules need to
        # specify a nameserver name". This error means you should not provide TargetIps .

        @[JSON::Field(key: "TargetIps")]
        getter target_ips : Array(Types::TargetAddress)?

        def initialize(
          @creator_request_id : String,
          @rule_type : String,
          @delegation_record : String? = nil,
          @domain_name : String? = nil,
          @name : String? = nil,
          @resolver_endpoint_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_ips : Array(Types::TargetAddress)? = nil
        )
        end
      end


      struct CreateResolverRuleResponse
        include JSON::Serializable

        # Information about the CreateResolverRule request, including the status of the request.

        @[JSON::Field(key: "ResolverRule")]
        getter resolver_rule : Types::ResolverRule?

        def initialize(
          @resolver_rule : Types::ResolverRule? = nil
        )
        end
      end


      struct DeleteFirewallDomainListRequest
        include JSON::Serializable

        # The ID of the domain list that you want to delete.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String

        def initialize(
          @firewall_domain_list_id : String
        )
        end
      end


      struct DeleteFirewallDomainListResponse
        include JSON::Serializable

        # The domain list that you just deleted.

        @[JSON::Field(key: "FirewallDomainList")]
        getter firewall_domain_list : Types::FirewallDomainList?

        def initialize(
          @firewall_domain_list : Types::FirewallDomainList? = nil
        )
        end
      end


      struct DeleteFirewallRuleGroupRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group that you want to delete.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        def initialize(
          @firewall_rule_group_id : String
        )
        end
      end


      struct DeleteFirewallRuleGroupResponse
        include JSON::Serializable

        # A collection of rules used to filter DNS network traffic.

        @[JSON::Field(key: "FirewallRuleGroup")]
        getter firewall_rule_group : Types::FirewallRuleGroup?

        def initialize(
          @firewall_rule_group : Types::FirewallRuleGroup? = nil
        )
        end
      end


      struct DeleteFirewallRuleRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group that you want to delete the rule from.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        # The ID of the domain list that's used in the rule.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The ID that is created for a DNS Firewall Advanced rule.

        @[JSON::Field(key: "FirewallThreatProtectionId")]
        getter firewall_threat_protection_id : String?

        # The DNS query type that the rule you are deleting evaluates. Allowed values are; A: Returns an IPv4
        # address. AAAA: Returns an Ipv6 address. CAA: Restricts CAs that can create SSL/TLS certifications
        # for the domain. CNAME: Returns another domain name. DS: Record that identifies the DNSSEC signing
        # key of a delegated zone. MX: Specifies mail servers. NAPTR: Regular-expression-based rewriting of
        # domain names. NS: Authoritative name servers. PTR: Maps an IP address to a domain name. SOA: Start
        # of authority record for the zone. SPF: Lists the servers authorized to send emails from a domain.
        # SRV: Application specific values that identify servers. TXT: Verifies email senders and
        # application-specific values. A query type you define by using the DNS type ID, for example 28 for
        # AAAA. The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334, for example,
        # TYPE28. For more information, see List of DNS record types .

        @[JSON::Field(key: "Qtype")]
        getter qtype : String?

        def initialize(
          @firewall_rule_group_id : String,
          @firewall_domain_list_id : String? = nil,
          @firewall_threat_protection_id : String? = nil,
          @qtype : String? = nil
        )
        end
      end


      struct DeleteFirewallRuleResponse
        include JSON::Serializable

        # The specification for the firewall rule that you just deleted.

        @[JSON::Field(key: "FirewallRule")]
        getter firewall_rule : Types::FirewallRule?

        def initialize(
          @firewall_rule : Types::FirewallRule? = nil
        )
        end
      end


      struct DeleteOutpostResolverRequest
        include JSON::Serializable

        # A unique string that identifies the Resolver on the Outpost.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteOutpostResolverResponse
        include JSON::Serializable

        # Information about the DeleteOutpostResolver request, including the status of the request.

        @[JSON::Field(key: "OutpostResolver")]
        getter outpost_resolver : Types::OutpostResolver?

        def initialize(
          @outpost_resolver : Types::OutpostResolver? = nil
        )
        end
      end


      struct DeleteResolverEndpointRequest
        include JSON::Serializable

        # The ID of the Resolver endpoint that you want to delete.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        def initialize(
          @resolver_endpoint_id : String
        )
        end
      end


      struct DeleteResolverEndpointResponse
        include JSON::Serializable

        # Information about the DeleteResolverEndpoint request, including the status of the request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct DeleteResolverQueryLogConfigRequest
        include JSON::Serializable

        # The ID of the query logging configuration that you want to delete.

        @[JSON::Field(key: "ResolverQueryLogConfigId")]
        getter resolver_query_log_config_id : String

        def initialize(
          @resolver_query_log_config_id : String
        )
        end
      end


      struct DeleteResolverQueryLogConfigResponse
        include JSON::Serializable

        # Information about the query logging configuration that you deleted, including the status of the
        # request.

        @[JSON::Field(key: "ResolverQueryLogConfig")]
        getter resolver_query_log_config : Types::ResolverQueryLogConfig?

        def initialize(
          @resolver_query_log_config : Types::ResolverQueryLogConfig? = nil
        )
        end
      end


      struct DeleteResolverRuleRequest
        include JSON::Serializable

        # The ID of the Resolver rule that you want to delete.

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String

        def initialize(
          @resolver_rule_id : String
        )
        end
      end


      struct DeleteResolverRuleResponse
        include JSON::Serializable

        # Information about the DeleteResolverRule request, including the status of the request.

        @[JSON::Field(key: "ResolverRule")]
        getter resolver_rule : Types::ResolverRule?

        def initialize(
          @resolver_rule : Types::ResolverRule? = nil
        )
        end
      end


      struct DisassociateFirewallRuleGroupRequest
        include JSON::Serializable

        # The identifier of the FirewallRuleGroupAssociation .

        @[JSON::Field(key: "FirewallRuleGroupAssociationId")]
        getter firewall_rule_group_association_id : String

        def initialize(
          @firewall_rule_group_association_id : String
        )
        end
      end


      struct DisassociateFirewallRuleGroupResponse
        include JSON::Serializable

        # The firewall rule group association that you just removed.

        @[JSON::Field(key: "FirewallRuleGroupAssociation")]
        getter firewall_rule_group_association : Types::FirewallRuleGroupAssociation?

        def initialize(
          @firewall_rule_group_association : Types::FirewallRuleGroupAssociation? = nil
        )
        end
      end


      struct DisassociateResolverEndpointIpAddressRequest
        include JSON::Serializable

        # The IPv4 address that you want to remove from a Resolver endpoint.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : Types::IpAddressUpdate

        # The ID of the Resolver endpoint that you want to disassociate an IP address from.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        def initialize(
          @ip_address : Types::IpAddressUpdate,
          @resolver_endpoint_id : String
        )
        end
      end


      struct DisassociateResolverEndpointIpAddressResponse
        include JSON::Serializable

        # The response to an DisassociateResolverEndpointIpAddress request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct DisassociateResolverQueryLogConfigRequest
        include JSON::Serializable

        # The ID of the query logging configuration that you want to disassociate a specified VPC from.

        @[JSON::Field(key: "ResolverQueryLogConfigId")]
        getter resolver_query_log_config_id : String

        # The ID of the Amazon VPC that you want to disassociate from a specified query logging configuration.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resolver_query_log_config_id : String,
          @resource_id : String
        )
        end
      end


      struct DisassociateResolverQueryLogConfigResponse
        include JSON::Serializable

        # A complex type that contains settings for the association that you deleted between an Amazon VPC and
        # a query logging configuration.

        @[JSON::Field(key: "ResolverQueryLogConfigAssociation")]
        getter resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation?

        def initialize(
          @resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation? = nil
        )
        end
      end


      struct DisassociateResolverRuleRequest
        include JSON::Serializable

        # The ID of the Resolver rule that you want to disassociate from the specified VPC.

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String

        # The ID of the VPC that you want to disassociate the Resolver rule from.

        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String

        def initialize(
          @resolver_rule_id : String,
          @vpc_id : String
        )
        end
      end


      struct DisassociateResolverRuleResponse
        include JSON::Serializable

        # Information about the DisassociateResolverRule request, including the status of the request.

        @[JSON::Field(key: "ResolverRuleAssociation")]
        getter resolver_rule_association : Types::ResolverRuleAssociation?

        def initialize(
          @resolver_rule_association : Types::ResolverRuleAssociation? = nil
        )
        end
      end

      # For Resolver list operations ( ListResolverEndpoints , ListResolverRules ,
      # ListResolverRuleAssociations , ListResolverQueryLogConfigs , ListResolverQueryLogConfigAssociations
      # ), and ListResolverDnssecConfigs ), an optional specification to return a subset of objects. To
      # filter objects, such as Resolver endpoints or Resolver rules, you specify Name and Values . For
      # example, to list only inbound Resolver endpoints, specify Direction for Name and specify INBOUND for
      # Values .

      struct Filter
        include JSON::Serializable

        # The name of the parameter that you want to use to filter objects. The valid values for Name depend
        # on the action that you're including the filter in, ListResolverEndpoints , ListResolverRules ,
        # ListResolverRuleAssociations , ListResolverQueryLogConfigs , or
        # ListResolverQueryLogConfigAssociations . In early versions of Resolver, values for Name were listed
        # as uppercase, with underscore (_) delimiters. For example, CreatorRequestId was originally listed as
        # CREATOR_REQUEST_ID . Uppercase values for Name are still supported. ListResolverEndpoints Valid
        # values for Name include the following: CreatorRequestId : The value that you specified when you
        # created the Resolver endpoint. Direction : Whether you want to return inbound or outbound Resolver
        # endpoints. If you specify DIRECTION for Name , specify INBOUND or OUTBOUND for Values . HostVPCId :
        # The ID of the VPC that inbound DNS queries pass through on the way from your network to your VPCs in
        # a region, or the VPC that outbound queries pass through on the way from your VPCs to your network.
        # In a CreateResolverEndpoint request, SubnetId indirectly identifies the VPC. In a
        # GetResolverEndpoint request, the VPC ID for a Resolver endpoint is returned in the HostVPCId
        # element. IpAddressCount : The number of IP addresses that you have associated with the Resolver
        # endpoint. Name : The name of the Resolver endpoint. SecurityGroupIds : The IDs of the VPC security
        # groups that you specified when you created the Resolver endpoint. Status : The status of the
        # Resolver endpoint. If you specify Status for Name , specify one of the following status codes for
        # Values : CREATING , OPERATIONAL , UPDATING , AUTO_RECOVERING , ACTION_NEEDED , or DELETING . For
        # more information, see Status in ResolverEndpoint . ListResolverRules Valid values for Name include
        # the following: CreatorRequestId : The value that you specified when you created the Resolver rule.
        # DomainName : The domain name for which Resolver is forwarding DNS queries to your network. In the
        # value that you specify for Values , include a trailing dot (.) after the domain name. For example,
        # if the domain name is example.com, specify the following value. Note the "." after com :
        # example.com. Name : The name of the Resolver rule. ResolverEndpointId : The ID of the Resolver
        # endpoint that the Resolver rule is associated with. You can filter on the Resolver endpoint only for
        # rules that have a value of FORWARD for RuleType . Status : The status of the Resolver rule. If you
        # specify Status for Name , specify one of the following status codes for Values : COMPLETE , DELETING
        # , UPDATING , or FAILED . Type : The type of the Resolver rule. If you specify TYPE for Name ,
        # specify FORWARD or SYSTEM for Values . ListResolverRuleAssociations Valid values for Name include
        # the following: Name : The name of the Resolver rule association. ResolverRuleId : The ID of the
        # Resolver rule that is associated with one or more VPCs. Status : The status of the Resolver rule
        # association. If you specify Status for Name , specify one of the following status codes for Values :
        # CREATING , COMPLETE , DELETING , or FAILED . VPCId : The ID of the VPC that the Resolver rule is
        # associated with. ListResolverQueryLogConfigs Valid values for Name include the following: Arn : The
        # ARN for the query logging configuration. AssociationCount : The number of VPCs that are associated
        # with the query logging configuration. CreationTime : The date and time that the query logging
        # configuration was created, in Unix time format and Coordinated Universal Time (UTC).
        # CreatorRequestId : A unique string that identifies the request that created the query logging
        # configuration. Destination : The Amazon Web Services service that you want to forward query logs to.
        # Valid values include the following: S3 CloudWatchLogs KinesisFirehose DestinationArn : The ARN of
        # the location that Resolver is sending query logs to. This value can be the ARN for an S3 bucket, a
        # CloudWatch Logs log group, or a Kinesis Data Firehose delivery stream. Id : The ID of the query
        # logging configuration Name : The name of the query logging configuration OwnerId : The Amazon Web
        # Services account ID for the account that created the query logging configuration. ShareStatus : An
        # indication of whether the query logging configuration is shared with other Amazon Web Services
        # accounts, or was shared with the current account by another Amazon Web Services account. Valid
        # values include: NOT_SHARED , SHARED_WITH_ME , or SHARED_BY_ME . Status : The status of the query
        # logging configuration. If you specify Status for Name , specify the applicable status code for
        # Values : CREATING , CREATED , DELETING , or FAILED . For more information, see Status .
        # ListResolverQueryLogConfigAssociations Valid values for Name include the following: CreationTime :
        # The date and time that the VPC was associated with the query logging configuration, in Unix time
        # format and Coordinated Universal Time (UTC). Error : If the value of Status is FAILED , specify the
        # cause: DESTINATION_NOT_FOUND or ACCESS_DENIED . Id : The ID of the query logging association.
        # ResolverQueryLogConfigId : The ID of the query logging configuration that a VPC is associated with.
        # ResourceId : The ID of the Amazon VPC that is associated with the query logging configuration.
        # Status : The status of the query logging association. If you specify Status for Name , specify the
        # applicable status code for Values : CREATING , CREATED , DELETING , or FAILED . For more
        # information, see Status .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # When you're using a List operation and you want the operation to return a subset of objects, such as
        # Resolver endpoints or Resolver rules, the value of the parameter that you want to use to filter
        # objects. For example, to list only inbound Resolver endpoints, specify Direction for Name and
        # specify INBOUND for Values .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Configuration of the firewall behavior provided by DNS Firewall for a single VPC from Amazon Virtual
      # Private Cloud (Amazon VPC).

      struct FirewallConfig
        include JSON::Serializable

        # Determines how DNS Firewall operates during failures, for example when all traffic that is sent to
        # DNS Firewall fails to receive a reply. By default, fail open is disabled, which means the failure
        # mode is closed. This approach favors security over availability. DNS Firewall returns a failure
        # error when it is unable to properly evaluate a query. If you enable this option, the failure mode is
        # open. This approach favors availability over security. DNS Firewall allows queries to proceed if it
        # is unable to properly evaluate them. This behavior is only enforced for VPCs that have at least one
        # DNS Firewall rule group association.

        @[JSON::Field(key: "FirewallFailOpen")]
        getter firewall_fail_open : String?

        # The ID of the firewall configuration.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Web Services account ID of the owner of the VPC that this firewall configuration applies
        # to.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The ID of the VPC that this firewall configuration applies to.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @firewall_fail_open : String? = nil,
          @id : String? = nil,
          @owner_id : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # High-level information about a list of firewall domains for use in a FirewallRule . This is returned
      # by GetFirewallDomainList . To retrieve the domains that are defined for this domain list, call
      # ListFirewallDomains .

      struct FirewallDomainList
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall domain list.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the domain list was created, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The number of domain names that are specified in the domain list.

        @[JSON::Field(key: "DomainCount")]
        getter domain_count : Int32?

        # The ID of the domain list.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The owner of the list, used only for lists that are not managed by you. For example, the managed
        # domain list AWSManagedDomainsMalwareDomainList has the managed owner name Route 53 Resolver DNS
        # Firewall .

        @[JSON::Field(key: "ManagedOwnerName")]
        getter managed_owner_name : String?

        # The date and time that the domain list was last modified, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # The name of the domain list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the domain list.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the status of the list, if available.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @domain_count : Int32? = nil,
          @id : String? = nil,
          @managed_owner_name : String? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Minimal high-level information for a firewall domain list. The action ListFirewallDomainLists
      # returns an array of these objects. To retrieve full information for a firewall domain list, call
      # GetFirewallDomainList and ListFirewallDomains .

      struct FirewallDomainListMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall domain list metadata.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ID of the domain list.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The owner of the list, used only for lists that are not managed by you. For example, the managed
        # domain list AWSManagedDomainsMalwareDomainList has the managed owner name Route 53 Resolver DNS
        # Firewall .

        @[JSON::Field(key: "ManagedOwnerName")]
        getter managed_owner_name : String?

        # The name of the domain list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creator_request_id : String? = nil,
          @id : String? = nil,
          @managed_owner_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A single firewall rule in a rule group.

      struct FirewallRule
        include JSON::Serializable

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule: ALLOW - Permit the request to go
        # through. Not available for DNS Firewall Advanced rules. ALERT - Permit the request to go through but
        # send an alert to the logs. BLOCK - Disallow the request. If this is specified, additional handling
        # details are provided in the rule's BlockResponse setting.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request. Used for the rule action setting BLOCK .
        # NODATA - Respond indicating that the query was successful, but no response is available for it.
        # NXDOMAIN - Respond indicating that the domain name that's in the query doesn't exist. OVERRIDE -
        # Provide a custom override in the response. This option requires custom handling details in the
        # rule's BlockOverride* settings.

        @[JSON::Field(key: "BlockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule. The confidence level values mean: LOW : Provides the highest detection
        # rate for threats, but also increases false positives. MEDIUM : Provides a balance between detecting
        # threats and false positives. HIGH : Detects only the most well corroborated threats with a low rate
        # of false positives.

        @[JSON::Field(key: "ConfidenceThreshold")]
        getter confidence_threshold : String?

        # The date and time that the rule was created, in Unix time format and Coordinated Universal Time
        # (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of executing the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The type of the DNS Firewall Advanced rule. Valid values are: DGA : Domain generation algorithms
        # detection. DGAs are used by attackers to generate a large number of domains to to launch malware
        # attacks. DNS_TUNNELING : DNS tunneling detection. DNS tunneling is used by attackers to exfiltrate
        # data from the client by using the DNS tunnel without making a network connection to the client.

        @[JSON::Field(key: "DnsThreatProtection")]
        getter dns_threat_protection : String?

        # The ID of the domain list that's used in the rule.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String?

        # How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such as CNAME or
        # DNAME. INSPECT_REDIRECTION_DOMAIN : (Default) inspects all domains in the redirection chain. The
        # individual domains in the redirection chain must be added to the domain list.
        # TRUST_REDIRECTION_DOMAIN : Inspects only the first domain in the redirection chain. You don't need
        # to add the subsequent domains in the domain in the redirection list to the domain list.

        @[JSON::Field(key: "FirewallDomainRedirectionAction")]
        getter firewall_domain_redirection_action : String?

        # The unique identifier of the Firewall rule group of the rule.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String?

        # ID of the DNS Firewall Advanced rule.

        @[JSON::Field(key: "FirewallThreatProtectionId")]
        getter firewall_threat_protection_id : String?

        # The date and time that the rule was last modified, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The priority of the rule in the rule group. This value must be unique within the rule group. DNS
        # Firewall processes the rules in a rule group by order of priority, starting from the lowest setting.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The DNS query type you want the rule to evaluate. Allowed values are; A: Returns an IPv4 address.
        # AAAA: Returns an Ipv6 address. CAA: Restricts CAs that can create SSL/TLS certifications for the
        # domain. CNAME: Returns another domain name. DS: Record that identifies the DNSSEC signing key of a
        # delegated zone. MX: Specifies mail servers. NAPTR: Regular-expression-based rewriting of domain
        # names. NS: Authoritative name servers. PTR: Maps an IP address to a domain name. SOA: Start of
        # authority record for the zone. SPF: Lists the servers authorized to send emails from a domain. SRV:
        # Application specific values that identify servers. TXT: Verifies email senders and
        # application-specific values. A query type you define by using the DNS type ID, for example 28 for
        # AAAA. The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334, for example,
        # TYPE28. For more information, see List of DNS record types .

        @[JSON::Field(key: "Qtype")]
        getter qtype : String?

        def initialize(
          @action : String? = nil,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @dns_threat_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @firewall_domain_redirection_action : String? = nil,
          @firewall_rule_group_id : String? = nil,
          @firewall_threat_protection_id : String? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @qtype : String? = nil
        )
        end
      end

      # High-level information for a firewall rule group. A firewall rule group is a collection of rules
      # that DNS Firewall uses to filter DNS network traffic for a VPC. To retrieve the rules for the rule
      # group, call ListFirewallRules .

      struct FirewallRuleGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the rule group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the rule group was created, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ID of the rule group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the rule group was last modified, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # The name of the rule group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID for the account that created the rule group. When a rule group is
        # shared with your account, this is the account that has shared the rule group with you.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The number of rules in the rule group.

        @[JSON::Field(key: "RuleCount")]
        getter rule_count : Int32?

        # Whether the rule group is shared with other Amazon Web Services accounts, or was shared with the
        # current account by another Amazon Web Services account. Sharing is configured through Resource
        # Access Manager (RAM).

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # The status of the domain list.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the status of the rule group, if available.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @id : String? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @rule_count : Int32? = nil,
          @share_status : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An association between a firewall rule group and a VPC, which enables DNS filtering for the VPC.

      struct FirewallRuleGroupAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall rule group association.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the association was created, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The unique identifier of the firewall rule group.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String?

        # The identifier for the association.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The owner of the association, used only for associations that are not managed by you. If you use
        # Firewall Manager to manage your DNS Firewalls, then this reports Firewall Manager as the managed
        # owner.

        @[JSON::Field(key: "ManagedOwnerName")]
        getter managed_owner_name : String?

        # The date and time that the association was last modified, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # If enabled, this setting disallows modification or removal of the association, to help prevent
        # against accidentally altering DNS firewall protections.

        @[JSON::Field(key: "MutationProtection")]
        getter mutation_protection : String?

        # The name of the association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The setting that determines the processing order of the rule group among the rule groups that are
        # associated with a single VPC. DNS Firewall filters VPC traffic starting from rule group with the
        # lowest numeric priority setting.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The current status of the association.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the status of the response, if available.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The unique identifier of the VPC that is associated with the rule group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @firewall_rule_group_id : String? = nil,
          @id : String? = nil,
          @managed_owner_name : String? = nil,
          @modification_time : String? = nil,
          @mutation_protection : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Minimal high-level information for a firewall rule group. The action ListFirewallRuleGroups returns
      # an array of these objects. To retrieve full information for a firewall rule group, call
      # GetFirewallRuleGroup and ListFirewallRules .

      struct FirewallRuleGroupMetadata
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the rule group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A unique string defined by you to identify the request. This allows you to retry failed requests
        # without the risk of running the operation twice. This can be any unique string, for example, a
        # timestamp.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ID of the rule group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the rule group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID for the account that created the rule group. When a rule group is
        # shared with your account, this is the account that has shared the rule group with you.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # Whether the rule group is shared with other Amazon Web Services accounts, or was shared with the
        # current account by another Amazon Web Services account. Sharing is configured through Resource
        # Access Manager (RAM).

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        def initialize(
          @arn : String? = nil,
          @creator_request_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @share_status : String? = nil
        )
        end
      end


      struct GetFirewallConfigRequest
        include JSON::Serializable

        # The ID of the VPC from Amazon VPC that the configuration is for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end


      struct GetFirewallConfigResponse
        include JSON::Serializable

        # Configuration of the firewall behavior provided by DNS Firewall for a single VPC from AmazonVPC.

        @[JSON::Field(key: "FirewallConfig")]
        getter firewall_config : Types::FirewallConfig?

        def initialize(
          @firewall_config : Types::FirewallConfig? = nil
        )
        end
      end


      struct GetFirewallDomainListRequest
        include JSON::Serializable

        # The ID of the domain list.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String

        def initialize(
          @firewall_domain_list_id : String
        )
        end
      end


      struct GetFirewallDomainListResponse
        include JSON::Serializable

        # The domain list that you requested.

        @[JSON::Field(key: "FirewallDomainList")]
        getter firewall_domain_list : Types::FirewallDomainList?

        def initialize(
          @firewall_domain_list : Types::FirewallDomainList? = nil
        )
        end
      end


      struct GetFirewallRuleGroupAssociationRequest
        include JSON::Serializable

        # The identifier of the FirewallRuleGroupAssociation .

        @[JSON::Field(key: "FirewallRuleGroupAssociationId")]
        getter firewall_rule_group_association_id : String

        def initialize(
          @firewall_rule_group_association_id : String
        )
        end
      end


      struct GetFirewallRuleGroupAssociationResponse
        include JSON::Serializable

        # The association that you requested.

        @[JSON::Field(key: "FirewallRuleGroupAssociation")]
        getter firewall_rule_group_association : Types::FirewallRuleGroupAssociation?

        def initialize(
          @firewall_rule_group_association : Types::FirewallRuleGroupAssociation? = nil
        )
        end
      end


      struct GetFirewallRuleGroupPolicyRequest
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the rule group.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetFirewallRuleGroupPolicyResponse
        include JSON::Serializable

        # The Identity and Access Management (Amazon Web Services IAM) policy for sharing the specified rule
        # group. You can use the policy to share the rule group using Resource Access Manager (RAM).

        @[JSON::Field(key: "FirewallRuleGroupPolicy")]
        getter firewall_rule_group_policy : String?

        def initialize(
          @firewall_rule_group_policy : String? = nil
        )
        end
      end


      struct GetFirewallRuleGroupRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        def initialize(
          @firewall_rule_group_id : String
        )
        end
      end


      struct GetFirewallRuleGroupResponse
        include JSON::Serializable

        # A collection of rules used to filter DNS network traffic.

        @[JSON::Field(key: "FirewallRuleGroup")]
        getter firewall_rule_group : Types::FirewallRuleGroup?

        def initialize(
          @firewall_rule_group : Types::FirewallRuleGroup? = nil
        )
        end
      end


      struct GetOutpostResolverRequest
        include JSON::Serializable

        # The ID of the Resolver on the Outpost.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetOutpostResolverResponse
        include JSON::Serializable

        # Information about the GetOutpostResolver request, including the status of the request.

        @[JSON::Field(key: "OutpostResolver")]
        getter outpost_resolver : Types::OutpostResolver?

        def initialize(
          @outpost_resolver : Types::OutpostResolver? = nil
        )
        end
      end


      struct GetResolverConfigRequest
        include JSON::Serializable

        # Resource ID of the Amazon VPC that you want to get information about.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end


      struct GetResolverConfigResponse
        include JSON::Serializable

        # Information about the behavior configuration of Route 53 Resolver behavior for the VPC you specified
        # in the GetResolverConfig request.

        @[JSON::Field(key: "ResolverConfig")]
        getter resolver_config : Types::ResolverConfig?

        def initialize(
          @resolver_config : Types::ResolverConfig? = nil
        )
        end
      end


      struct GetResolverDnssecConfigRequest
        include JSON::Serializable

        # The ID of the virtual private cloud (VPC) for the DNSSEC validation status.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end


      struct GetResolverDnssecConfigResponse
        include JSON::Serializable

        # The information about a configuration for DNSSEC validation.

        @[JSON::Field(key: "ResolverDNSSECConfig")]
        getter resolver_dnssec_config : Types::ResolverDnssecConfig?

        def initialize(
          @resolver_dnssec_config : Types::ResolverDnssecConfig? = nil
        )
        end
      end


      struct GetResolverEndpointRequest
        include JSON::Serializable

        # The ID of the Resolver endpoint that you want to get information about.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        def initialize(
          @resolver_endpoint_id : String
        )
        end
      end


      struct GetResolverEndpointResponse
        include JSON::Serializable

        # Information about the Resolver endpoint that you specified in a GetResolverEndpoint request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct GetResolverQueryLogConfigAssociationRequest
        include JSON::Serializable

        # The ID of the Resolver query logging configuration association that you want to get information
        # about.

        @[JSON::Field(key: "ResolverQueryLogConfigAssociationId")]
        getter resolver_query_log_config_association_id : String

        def initialize(
          @resolver_query_log_config_association_id : String
        )
        end
      end


      struct GetResolverQueryLogConfigAssociationResponse
        include JSON::Serializable

        # Information about the Resolver query logging configuration association that you specified in a
        # GetQueryLogConfigAssociation request.

        @[JSON::Field(key: "ResolverQueryLogConfigAssociation")]
        getter resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation?

        def initialize(
          @resolver_query_log_config_association : Types::ResolverQueryLogConfigAssociation? = nil
        )
        end
      end


      struct GetResolverQueryLogConfigPolicyRequest
        include JSON::Serializable

        # The ARN of the query logging configuration that you want to get the query logging policy for.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetResolverQueryLogConfigPolicyResponse
        include JSON::Serializable

        # Information about the query logging policy for the query logging configuration that you specified in
        # a GetResolverQueryLogConfigPolicy request.

        @[JSON::Field(key: "ResolverQueryLogConfigPolicy")]
        getter resolver_query_log_config_policy : String?

        def initialize(
          @resolver_query_log_config_policy : String? = nil
        )
        end
      end


      struct GetResolverQueryLogConfigRequest
        include JSON::Serializable

        # The ID of the Resolver query logging configuration that you want to get information about.

        @[JSON::Field(key: "ResolverQueryLogConfigId")]
        getter resolver_query_log_config_id : String

        def initialize(
          @resolver_query_log_config_id : String
        )
        end
      end


      struct GetResolverQueryLogConfigResponse
        include JSON::Serializable

        # Information about the Resolver query logging configuration that you specified in a GetQueryLogConfig
        # request.

        @[JSON::Field(key: "ResolverQueryLogConfig")]
        getter resolver_query_log_config : Types::ResolverQueryLogConfig?

        def initialize(
          @resolver_query_log_config : Types::ResolverQueryLogConfig? = nil
        )
        end
      end


      struct GetResolverRuleAssociationRequest
        include JSON::Serializable

        # The ID of the Resolver rule association that you want to get information about.

        @[JSON::Field(key: "ResolverRuleAssociationId")]
        getter resolver_rule_association_id : String

        def initialize(
          @resolver_rule_association_id : String
        )
        end
      end


      struct GetResolverRuleAssociationResponse
        include JSON::Serializable

        # Information about the Resolver rule association that you specified in a GetResolverRuleAssociation
        # request.

        @[JSON::Field(key: "ResolverRuleAssociation")]
        getter resolver_rule_association : Types::ResolverRuleAssociation?

        def initialize(
          @resolver_rule_association : Types::ResolverRuleAssociation? = nil
        )
        end
      end


      struct GetResolverRulePolicyRequest
        include JSON::Serializable

        # The ID of the Resolver rule that you want to get the Resolver rule policy for.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetResolverRulePolicyResponse
        include JSON::Serializable

        # The Resolver rule policy for the rule that you specified in a GetResolverRulePolicy request.

        @[JSON::Field(key: "ResolverRulePolicy")]
        getter resolver_rule_policy : String?

        def initialize(
          @resolver_rule_policy : String? = nil
        )
        end
      end


      struct GetResolverRuleRequest
        include JSON::Serializable

        # The ID of the Resolver rule that you want to get information about.

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String

        def initialize(
          @resolver_rule_id : String
        )
        end
      end


      struct GetResolverRuleResponse
        include JSON::Serializable

        # Information about the Resolver rule that you specified in a GetResolverRule request.

        @[JSON::Field(key: "ResolverRule")]
        getter resolver_rule : Types::ResolverRule?

        def initialize(
          @resolver_rule : Types::ResolverRule? = nil
        )
        end
      end


      struct ImportFirewallDomainsRequest
        include JSON::Serializable

        # The fully qualified URL or URI of the file stored in Amazon Simple Storage Service (Amazon S3) that
        # contains the list of domains to import. The file must be in an S3 bucket that's in the same Region
        # as your DNS Firewall. The file must be a text file and must contain a single domain per line.

        @[JSON::Field(key: "DomainFileUrl")]
        getter domain_file_url : String

        # The ID of the domain list that you want to modify with the import operation.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String

        # What you want DNS Firewall to do with the domains that are listed in the file. This must be set to
        # REPLACE , which updates the domain list to exactly match the list in the file.

        @[JSON::Field(key: "Operation")]
        getter operation : String

        def initialize(
          @domain_file_url : String,
          @firewall_domain_list_id : String,
          @operation : String
        )
        end
      end


      struct ImportFirewallDomainsResponse
        include JSON::Serializable

        # The Id of the firewall domain list that DNS Firewall just updated.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the domain list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Status of the import request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the status of the list, if available.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # We encountered an unknown error. Try again in a few minutes.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value that you specified for NextToken in a List request isn't valid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters in this request are not valid.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # For an InvalidParameterException error, the name of the parameter that's invalid.

        @[JSON::Field(key: "FieldName")]
        getter field_name : String?

        def initialize(
          @message : String,
          @field_name : String? = nil
        )
        end
      end

      # The specified Resolver rule policy is invalid.

      struct InvalidPolicyDocument
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is invalid.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified tag is invalid.

      struct InvalidTagException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # In a CreateResolverEndpoint request, the IP address that DNS queries originate from (for outbound
      # endpoints) or that you forward DNS queries to (for inbound endpoints). IpAddressRequest also
      # includes the ID of the subnet that contains the IP address.

      struct IpAddressRequest
        include JSON::Serializable

        # The ID of the subnet that contains the IP address.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # The IPv4 address that you want to use for DNS queries.

        @[JSON::Field(key: "Ip")]
        getter ip : String?

        # The IPv6 address that you want to use for DNS queries.

        @[JSON::Field(key: "Ipv6")]
        getter ipv6 : String?

        def initialize(
          @subnet_id : String,
          @ip : String? = nil,
          @ipv6 : String? = nil
        )
        end
      end

      # In the response to a GetResolverEndpoint request, information about the IP addresses that the
      # Resolver endpoint uses for DNS queries.

      struct IpAddressResponse
        include JSON::Serializable

        # The date and time that the IP address was created, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # One IPv4 address that the Resolver endpoint uses for DNS queries.

        @[JSON::Field(key: "Ip")]
        getter ip : String?

        # The ID of one IP address.

        @[JSON::Field(key: "IpId")]
        getter ip_id : String?

        # One IPv6 address that the Resolver endpoint uses for DNS queries.

        @[JSON::Field(key: "Ipv6")]
        getter ipv6 : String?

        # The date and time that the IP address was last modified, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # A status code that gives the current status of the request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message that provides additional information about the status of the request.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The ID of one subnet.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @creation_time : String? = nil,
          @ip : String? = nil,
          @ip_id : String? = nil,
          @ipv6 : String? = nil,
          @modification_time : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # In an UpdateResolverEndpoint request, information about an IP address to update.

      struct IpAddressUpdate
        include JSON::Serializable

        # The new IPv4 address.

        @[JSON::Field(key: "Ip")]
        getter ip : String?

        # Only when removing an IP address from a Resolver endpoint : The ID of the IP address that you want
        # to remove. To get this ID, use GetResolverEndpoint .

        @[JSON::Field(key: "IpId")]
        getter ip_id : String?

        # The new IPv6 address.

        @[JSON::Field(key: "Ipv6")]
        getter ipv6 : String?

        # The ID of the subnet that includes the IP address that you want to update. To get this ID, use
        # GetResolverEndpoint .

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @ip : String? = nil,
          @ip_id : String? = nil,
          @ipv6 : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # The request caused one or more limits to be exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # For a LimitExceededException error, the type of resource that exceeded the current limit.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListFirewallConfigsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallConfigsResponse
        include JSON::Serializable

        # The configurations for the firewall behavior provided by DNS Firewall for VPCs from Amazon Virtual
        # Private Cloud (Amazon VPC).

        @[JSON::Field(key: "FirewallConfigs")]
        getter firewall_configs : Array(Types::FirewallConfig)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_configs : Array(Types::FirewallConfig)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallDomainListsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallDomainListsResponse
        include JSON::Serializable

        # A list of the domain lists that you have defined. This might be a partial list of the domain lists
        # that you've defined. For information, see MaxResults .

        @[JSON::Field(key: "FirewallDomainLists")]
        getter firewall_domain_lists : Array(Types::FirewallDomainListMetadata)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_domain_lists : Array(Types::FirewallDomainListMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallDomainsRequest
        include JSON::Serializable

        # The ID of the domain list whose domains you want to retrieve.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_domain_list_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallDomainsResponse
        include JSON::Serializable

        # A list of the domains in the firewall domain list. This might be a partial list of the domains that
        # you've defined in the domain list. For information, see MaxResults .

        @[JSON::Field(key: "Domains")]
        getter domains : Array(String)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domains : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallRuleGroupAssociationsRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group that you want to retrieve the associations for.
        # Leave this blank to retrieve associations for any rule group.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String?

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The setting that determines the processing order of the rule group among the rule groups that are
        # associated with a single VPC. DNS Firewall filters VPC traffic starting from the rule group with the
        # lowest numeric priority setting.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The association Status setting that you want DNS Firewall to filter on for the list. If you don't
        # specify this, then DNS Firewall returns all associations, regardless of status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of the VPC that you want to retrieve the associations for. Leave this blank to
        # retrieve associations for any VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @firewall_rule_group_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @priority : Int32? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct ListFirewallRuleGroupAssociationsResponse
        include JSON::Serializable

        # A list of your firewall rule group associations. This might be a partial list of the associations
        # that you have defined. For information, see MaxResults .

        @[JSON::Field(key: "FirewallRuleGroupAssociations")]
        getter firewall_rule_group_associations : Array(Types::FirewallRuleGroupAssociation)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_rule_group_associations : Array(Types::FirewallRuleGroupAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallRuleGroupsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallRuleGroupsResponse
        include JSON::Serializable

        # A list of your firewall rule groups. This might be a partial list of the rule groups that you have
        # defined. For information, see MaxResults .

        @[JSON::Field(key: "FirewallRuleGroups")]
        getter firewall_rule_groups : Array(Types::FirewallRuleGroupMetadata)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_rule_groups : Array(Types::FirewallRuleGroupMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFirewallRulesRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group that you want to retrieve the rules for.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        # Optional additional filter for the rules to retrieve. The action that DNS Firewall should take on a
        # DNS query when it matches one of the domains in the rule's domain list, or a threat in a DNS
        # Firewall Advanced rule: ALLOW - Permit the request to go through. Not availabe for DNS Firewall
        # Advanced rules. ALERT - Permit the request to go through but send an alert to the logs. BLOCK -
        # Disallow the request. If this is specified, additional handling details are provided in the rule's
        # BlockResponse setting.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The maximum number of objects that you want Resolver to return for this request. If more objects are
        # available, in the response, Resolver provides a NextToken value that you can use in a subsequent
        # call to get the next batch of objects. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects,
        # Resolver returns at most the number of objects specified in MaxResults . If more objects are
        # available for retrieval, Resolver returns a NextToken value in the response. To retrieve the next
        # batch of objects, use the token that was returned for the prior request in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Optional additional filter for the rules to retrieve. The setting that determines the processing
        # order of the rules in a rule group. DNS Firewall processes the rules in a rule group by order of
        # priority, starting from the lowest setting.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        def initialize(
          @firewall_rule_group_id : String,
          @action : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @priority : Int32? = nil
        )
        end
      end


      struct ListFirewallRulesResponse
        include JSON::Serializable

        # A list of the rules that you have defined. This might be a partial list of the firewall rules that
        # you've defined. For information, see MaxResults .

        @[JSON::Field(key: "FirewallRules")]
        getter firewall_rules : Array(Types::FirewallRule)?

        # If objects are still available for retrieval, Resolver returns this token in the response. To
        # retrieve the next batch of objects, provide this token in your next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_rules : Array(Types::FirewallRule)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutpostResolversRequest
        include JSON::Serializable

        # The maximum number of Resolvers on the Outpost that you want to return in the response to a
        # ListOutpostResolver request. If you don't specify a value for MaxResults , the request returns up to
        # 100 Resolvers.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListOutpostResolver request, omit this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the Outpost.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @outpost_arn : String? = nil
        )
        end
      end


      struct ListOutpostResolversResponse
        include JSON::Serializable

        # If more than MaxResults Resolvers match the specified criteria, you can submit another
        # ListOutpostResolver request to get the next group of results. In the next request, specify the value
        # of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Resolvers on Outposts that were created by using the current Amazon Web Services account, and
        # that match the specified filters, if any.

        @[JSON::Field(key: "OutpostResolvers")]
        getter outpost_resolvers : Array(Types::OutpostResolver)?

        def initialize(
          @next_token : String? = nil,
          @outpost_resolvers : Array(Types::OutpostResolver)? = nil
        )
        end
      end


      struct ListResolverConfigsRequest
        include JSON::Serializable

        # The maximum number of Resolver configurations that you want to return in the response to a
        # ListResolverConfigs request. If you don't specify a value for MaxResults , up to 100 Resolver
        # configurations are returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) If the current Amazon Web Services account has more than MaxResults Resolver
        # configurations, use NextToken to get the second and subsequent pages of results. For the first
        # ListResolverConfigs request, omit this value. For the second and subsequent requests, get the value
        # of NextToken from the previous response and specify that value for NextToken in the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverConfigsResponse
        include JSON::Serializable

        # If a response includes the last of the Resolver configurations that are associated with the current
        # Amazon Web Services account, NextToken doesn't appear in the response. If a response doesn't include
        # the last of the configurations, you can get more configurations by submitting another
        # ListResolverConfigs request. Get the value of NextToken that Amazon Route 53 returned in the
        # previous response and include it in NextToken in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains one ResolverConfigs element for each Resolver configuration that is
        # associated with the current Amazon Web Services account.

        @[JSON::Field(key: "ResolverConfigs")]
        getter resolver_configs : Array(Types::ResolverConfig)?

        def initialize(
          @next_token : String? = nil,
          @resolver_configs : Array(Types::ResolverConfig)? = nil
        )
        end
      end


      struct ListResolverDnssecConfigsRequest
        include JSON::Serializable

        # An optional specification to return a subset of objects.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Optional : An integer that specifies the maximum number of DNSSEC configuration results that you
        # want Amazon Route 53 to return. If you don't specify a value for MaxResults , Route 53 returns up to
        # 100 configuration per page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) If the current Amazon Web Services account has more than MaxResults DNSSEC
        # configurations, use NextToken to get the second and subsequent pages of results. For the first
        # ListResolverDnssecConfigs request, omit this value. For the second and subsequent requests, get the
        # value of NextToken from the previous response and specify that value for NextToken in the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverDnssecConfigsResponse
        include JSON::Serializable

        # If a response includes the last of the DNSSEC configurations that are associated with the current
        # Amazon Web Services account, NextToken doesn't appear in the response. If a response doesn't include
        # the last of the configurations, you can get more configurations by submitting another
        # ListResolverDnssecConfigs request. Get the value of NextToken that Amazon Route 53 returned in the
        # previous response and include it in NextToken in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains one ResolverDnssecConfig element for each configuration for DNSSEC validation
        # that is associated with the current Amazon Web Services account. It doesn't contain disabled DNSSEC
        # configurations for the resource.

        @[JSON::Field(key: "ResolverDnssecConfigs")]
        getter resolver_dnssec_configs : Array(Types::ResolverDnssecConfig)?

        def initialize(
          @next_token : String? = nil,
          @resolver_dnssec_configs : Array(Types::ResolverDnssecConfig)? = nil
        )
        end
      end


      struct ListResolverEndpointIpAddressesRequest
        include JSON::Serializable

        # The ID of the Resolver endpoint that you want to get IP addresses for.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        # The maximum number of IP addresses that you want to return in the response to a
        # ListResolverEndpointIpAddresses request. If you don't specify a value for MaxResults , Resolver
        # returns up to 100 IP addresses.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverEndpointIpAddresses request, omit this value. If the specified Resolver
        # endpoint has more than MaxResults IP addresses, you can submit another
        # ListResolverEndpointIpAddresses request to get the next group of IP addresses. In the next request,
        # specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resolver_endpoint_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverEndpointIpAddressesResponse
        include JSON::Serializable

        # Information about the IP addresses in your VPC that DNS queries originate from (for outbound
        # endpoints) or that you forward DNS queries to (for inbound endpoints).

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(Types::IpAddressResponse)?

        # The value that you specified for MaxResults in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the specified endpoint has more than MaxResults IP addresses, you can submit another
        # ListResolverEndpointIpAddresses request to get the next group of IP addresses. In the next request,
        # specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ip_addresses : Array(Types::IpAddressResponse)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverEndpointsRequest
        include JSON::Serializable

        # An optional specification to return a subset of Resolver endpoints, such as all inbound Resolver
        # endpoints. If you submit a second or subsequent ListResolverEndpoints request and specify the
        # NextToken parameter, you must use the same values for Filters , if any, as in the previous request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of Resolver endpoints that you want to return in the response to a
        # ListResolverEndpoints request. If you don't specify a value for MaxResults , Resolver returns up to
        # 100 Resolver endpoints.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverEndpoints request, omit this value. If you have more than MaxResults
        # Resolver endpoints, you can submit another ListResolverEndpoints request to get the next group of
        # Resolver endpoints. In the next request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverEndpointsResponse
        include JSON::Serializable

        # The value that you specified for MaxResults in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If more than MaxResults IP addresses match the specified criteria, you can submit another
        # ListResolverEndpoint request to get the next group of results. In the next request, specify the
        # value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Resolver endpoints that were created by using the current Amazon Web Services account, and that
        # match the specified filters, if any.

        @[JSON::Field(key: "ResolverEndpoints")]
        getter resolver_endpoints : Array(Types::ResolverEndpoint)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolver_endpoints : Array(Types::ResolverEndpoint)? = nil
        )
        end
      end


      struct ListResolverQueryLogConfigAssociationsRequest
        include JSON::Serializable

        # An optional specification to return a subset of query logging associations. If you submit a second
        # or subsequent ListResolverQueryLogConfigAssociations request and specify the NextToken parameter,
        # you must use the same values for Filters , if any, as in the previous request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of query logging associations that you want to return in the response to a
        # ListResolverQueryLogConfigAssociations request. If you don't specify a value for MaxResults ,
        # Resolver returns up to 100 query logging associations.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverQueryLogConfigAssociations request, omit this value. If there are more
        # than MaxResults query logging associations that match the values that you specify for Filters , you
        # can submit another ListResolverQueryLogConfigAssociations request to get the next group of
        # associations. In the next request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The element that you want Resolver to sort query logging associations by. If you submit a second or
        # subsequent ListResolverQueryLogConfigAssociations request and specify the NextToken parameter, you
        # must use the same value for SortBy , if any, as in the previous request. Valid values include the
        # following elements: CreationTime : The ID of the query logging association. Error : If the value of
        # Status is FAILED , the value of Error indicates the cause: DESTINATION_NOT_FOUND : The specified
        # destination (for example, an Amazon S3 bucket) was deleted. ACCESS_DENIED : Permissions don't allow
        # sending logs to the destination. If Status is a value other than FAILED , ERROR is null. Id : The ID
        # of the query logging association ResolverQueryLogConfigId : The ID of the query logging
        # configuration ResourceId : The ID of the VPC that is associated with the query logging configuration
        # Status : The current status of the configuration. Valid values include the following: CREATING :
        # Resolver is creating an association between an Amazon VPC and a query logging configuration. CREATED
        # : The association between an Amazon VPC and a query logging configuration was successfully created.
        # Resolver is logging queries that originate in the specified VPC. DELETING : Resolver is deleting
        # this query logging association. FAILED : Resolver either couldn't create or couldn't delete the
        # query logging association. Here are two common causes: The specified destination (for example, an
        # Amazon S3 bucket) was deleted. Permissions don't allow sending logs to the destination.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # If you specified a value for SortBy , the order that you want query logging associations to be
        # listed in, ASCENDING or DESCENDING . If you submit a second or subsequent
        # ListResolverQueryLogConfigAssociations request and specify the NextToken parameter, you must use the
        # same value for SortOrder , if any, as in the previous request.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListResolverQueryLogConfigAssociationsResponse
        include JSON::Serializable

        # If there are more than MaxResults query logging associations, you can submit another
        # ListResolverQueryLogConfigAssociations request to get the next group of associations. In the next
        # request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list that contains one ResolverQueryLogConfigAssociations element for each query logging
        # association that matches the values that you specified for Filter .

        @[JSON::Field(key: "ResolverQueryLogConfigAssociations")]
        getter resolver_query_log_config_associations : Array(Types::ResolverQueryLogConfigAssociation)?

        # The total number of query logging associations that were created by the current account in the
        # specified Region. This count can differ from the number of associations that are returned in a
        # ListResolverQueryLogConfigAssociations response, depending on the values that you specify in the
        # request.

        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int32?

        # The total number of query logging associations that were created by the current account in the
        # specified Region and that match the filters that were specified in the
        # ListResolverQueryLogConfigAssociations request. For the total number of associations that were
        # created by the current account in the specified Region, see TotalCount .

        @[JSON::Field(key: "TotalFilteredCount")]
        getter total_filtered_count : Int32?

        def initialize(
          @next_token : String? = nil,
          @resolver_query_log_config_associations : Array(Types::ResolverQueryLogConfigAssociation)? = nil,
          @total_count : Int32? = nil,
          @total_filtered_count : Int32? = nil
        )
        end
      end


      struct ListResolverQueryLogConfigsRequest
        include JSON::Serializable

        # An optional specification to return a subset of query logging configurations. If you submit a second
        # or subsequent ListResolverQueryLogConfigs request and specify the NextToken parameter, you must use
        # the same values for Filters , if any, as in the previous request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of query logging configurations that you want to return in the response to a
        # ListResolverQueryLogConfigs request. If you don't specify a value for MaxResults , Resolver returns
        # up to 100 query logging configurations.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverQueryLogConfigs request, omit this value. If there are more than
        # MaxResults query logging configurations that match the values that you specify for Filters , you can
        # submit another ListResolverQueryLogConfigs request to get the next group of configurations. In the
        # next request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The element that you want Resolver to sort query logging configurations by. If you submit a second
        # or subsequent ListResolverQueryLogConfigs request and specify the NextToken parameter, you must use
        # the same value for SortBy , if any, as in the previous request. Valid values include the following
        # elements: Arn : The ARN of the query logging configuration AssociationCount : The number of VPCs
        # that are associated with the specified configuration CreationTime : The date and time that Resolver
        # returned when the configuration was created CreatorRequestId : The value that was specified for
        # CreatorRequestId when the configuration was created DestinationArn : The location that logs are sent
        # to Id : The ID of the configuration Name : The name of the configuration OwnerId : The Amazon Web
        # Services account number of the account that created the configuration ShareStatus : Whether the
        # configuration is shared with other Amazon Web Services accounts or shared with the current account
        # by another Amazon Web Services account. Sharing is configured through Resource Access Manager (RAM).
        # Status : The current status of the configuration. Valid values include the following: CREATING :
        # Resolver is creating the query logging configuration. CREATED : The query logging configuration was
        # successfully created. Resolver is logging queries that originate in the specified VPC. DELETING :
        # Resolver is deleting this query logging configuration. FAILED : Resolver either couldn't create or
        # couldn't delete the query logging configuration. Here are two common causes: The specified
        # destination (for example, an Amazon S3 bucket) was deleted. Permissions don't allow sending logs to
        # the destination.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # If you specified a value for SortBy , the order that you want query logging configurations to be
        # listed in, ASCENDING or DESCENDING . If you submit a second or subsequent
        # ListResolverQueryLogConfigs request and specify the NextToken parameter, you must use the same value
        # for SortOrder , if any, as in the previous request.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListResolverQueryLogConfigsResponse
        include JSON::Serializable

        # If there are more than MaxResults query logging configurations, you can submit another
        # ListResolverQueryLogConfigs request to get the next group of configurations. In the next request,
        # specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list that contains one ResolverQueryLogConfig element for each query logging configuration that
        # matches the values that you specified for Filter .

        @[JSON::Field(key: "ResolverQueryLogConfigs")]
        getter resolver_query_log_configs : Array(Types::ResolverQueryLogConfig)?

        # The total number of query logging configurations that were created by the current account in the
        # specified Region. This count can differ from the number of query logging configurations that are
        # returned in a ListResolverQueryLogConfigs response, depending on the values that you specify in the
        # request.

        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int32?

        # The total number of query logging configurations that were created by the current account in the
        # specified Region and that match the filters that were specified in the ListResolverQueryLogConfigs
        # request. For the total number of query logging configurations that were created by the current
        # account in the specified Region, see TotalCount .

        @[JSON::Field(key: "TotalFilteredCount")]
        getter total_filtered_count : Int32?

        def initialize(
          @next_token : String? = nil,
          @resolver_query_log_configs : Array(Types::ResolverQueryLogConfig)? = nil,
          @total_count : Int32? = nil,
          @total_filtered_count : Int32? = nil
        )
        end
      end


      struct ListResolverRuleAssociationsRequest
        include JSON::Serializable

        # An optional specification to return a subset of Resolver rules, such as Resolver rules that are
        # associated with the same VPC ID. If you submit a second or subsequent ListResolverRuleAssociations
        # request and specify the NextToken parameter, you must use the same values for Filters , if any, as
        # in the previous request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of rule associations that you want to return in the response to a
        # ListResolverRuleAssociations request. If you don't specify a value for MaxResults , Resolver returns
        # up to 100 rule associations.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverRuleAssociation request, omit this value. If you have more than MaxResults
        # rule associations, you can submit another ListResolverRuleAssociation request to get the next group
        # of rule associations. In the next request, specify the value of NextToken from the previous
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverRuleAssociationsResponse
        include JSON::Serializable

        # The value that you specified for MaxResults in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If more than MaxResults rule associations match the specified criteria, you can submit another
        # ListResolverRuleAssociation request to get the next group of results. In the next request, specify
        # the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The associations that were created between Resolver rules and VPCs using the current Amazon Web
        # Services account, and that match the specified filters, if any.

        @[JSON::Field(key: "ResolverRuleAssociations")]
        getter resolver_rule_associations : Array(Types::ResolverRuleAssociation)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolver_rule_associations : Array(Types::ResolverRuleAssociation)? = nil
        )
        end
      end


      struct ListResolverRulesRequest
        include JSON::Serializable

        # An optional specification to return a subset of Resolver rules, such as all Resolver rules that are
        # associated with the same Resolver endpoint. If you submit a second or subsequent ListResolverRules
        # request and specify the NextToken parameter, you must use the same values for Filters , if any, as
        # in the previous request.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of Resolver rules that you want to return in the response to a ListResolverRules
        # request. If you don't specify a value for MaxResults , Resolver returns up to 100 Resolver rules.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListResolverRules request, omit this value. If you have more than MaxResults Resolver
        # rules, you can submit another ListResolverRules request to get the next group of Resolver rules. In
        # the next request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolverRulesResponse
        include JSON::Serializable

        # The value that you specified for MaxResults in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If more than MaxResults Resolver rules match the specified criteria, you can submit another
        # ListResolverRules request to get the next group of results. In the next request, specify the value
        # of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Resolver rules that were created using the current Amazon Web Services account and that match
        # the specified filters, if any.

        @[JSON::Field(key: "ResolverRules")]
        getter resolver_rules : Array(Types::ResolverRule)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resolver_rules : Array(Types::ResolverRule)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to list tags for.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of tags that you want to return in the response to a ListTagsForResource request.
        # If you don't specify a value for MaxResults , Resolver returns up to 100 tags.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListTagsForResource request, omit this value. If you have more than MaxResults tags,
        # you can submit another ListTagsForResource request to get the next group of tags for the resource.
        # In the next request, specify the value of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # If more than MaxResults tags match the specified criteria, you can submit another
        # ListTagsForResource request to get the next group of results. In the next request, specify the value
        # of NextToken from the previous response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags that are associated with the resource that you specified in the ListTagsForResource
        # request.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A complex type that contains settings for an existing Resolver on an Outpost.

      struct OutpostResolver
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the Resolver on an Outpost.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the Outpost Resolver was created, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string that identifies the request that created the Resolver endpoint. The CreatorRequestId
        # allows failed requests to be retried without the risk of running the operation twice.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ID of the Resolver on Outpost.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Amazon EC2 instance count for the Resolver on the Outpost.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The date and time that the Outpost Resolver was modified, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # Name of the Resolver.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN (Amazon Resource Name) for the Outpost.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The Amazon EC2 instance type.

        @[JSON::Field(key: "PreferredInstanceType")]
        getter preferred_instance_type : String?

        # Status of the Resolver.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed description of the Resolver.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @id : String? = nil,
          @instance_count : Int32? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @outpost_arn : String? = nil,
          @preferred_instance_type : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct PutFirewallRuleGroupPolicyRequest
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the rule group that you want to share.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The Identity and Access Management (Amazon Web Services IAM) policy to attach to the rule group.

        @[JSON::Field(key: "FirewallRuleGroupPolicy")]
        getter firewall_rule_group_policy : String

        def initialize(
          @arn : String,
          @firewall_rule_group_policy : String
        )
        end
      end


      struct PutFirewallRuleGroupPolicyResponse
        include JSON::Serializable


        @[JSON::Field(key: "ReturnValue")]
        getter return_value : Bool?

        def initialize(
          @return_value : Bool? = nil
        )
        end
      end


      struct PutResolverQueryLogConfigPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the account that you want to share rules with.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An Identity and Access Management policy statement that lists the query logging configurations that
        # you want to share with another Amazon Web Services account and the operations that you want the
        # account to be able to perform. You can specify the following operations in the Actions section of
        # the statement: route53resolver:AssociateResolverQueryLogConfig
        # route53resolver:DisassociateResolverQueryLogConfig route53resolver:ListResolverQueryLogConfigs In
        # the Resource section of the statement, you specify the ARNs for the query logging configurations
        # that you want to share with the account that you specified in Arn .

        @[JSON::Field(key: "ResolverQueryLogConfigPolicy")]
        getter resolver_query_log_config_policy : String

        def initialize(
          @arn : String,
          @resolver_query_log_config_policy : String
        )
        end
      end

      # The response to a PutResolverQueryLogConfigPolicy request.

      struct PutResolverQueryLogConfigPolicyResponse
        include JSON::Serializable

        # Whether the PutResolverQueryLogConfigPolicy request was successful.

        @[JSON::Field(key: "ReturnValue")]
        getter return_value : Bool?

        def initialize(
          @return_value : Bool? = nil
        )
        end
      end


      struct PutResolverRulePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule that you want to share with another account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An Identity and Access Management policy statement that lists the rules that you want to share with
        # another Amazon Web Services account and the operations that you want the account to be able to
        # perform. You can specify the following operations in the Action section of the statement:
        # route53resolver:GetResolverRule route53resolver:AssociateResolverRule
        # route53resolver:DisassociateResolverRule route53resolver:ListResolverRules
        # route53resolver:ListResolverRuleAssociations In the Resource section of the statement, specify the
        # ARN for the rule that you want to share with another account. Specify the same ARN that you
        # specified in Arn .

        @[JSON::Field(key: "ResolverRulePolicy")]
        getter resolver_rule_policy : String

        def initialize(
          @arn : String,
          @resolver_rule_policy : String
        )
        end
      end

      # The response to a PutResolverRulePolicy request.

      struct PutResolverRulePolicyResponse
        include JSON::Serializable

        # Whether the PutResolverRulePolicy request was successful.

        @[JSON::Field(key: "ReturnValue")]
        getter return_value : Bool?

        def initialize(
          @return_value : Bool? = nil
        )
        end
      end

      # A complex type that contains information about a Resolver configuration for a VPC.

      struct ResolverConfig
        include JSON::Serializable

        # The status of whether or not the Resolver will create autodefined rules for reverse DNS lookups.
        # This is enabled by default. The status can be one of following: ENABLING: Autodefined rules for
        # reverse DNS lookups are being enabled but are not complete. ENABLED: Autodefined rules for reverse
        # DNS lookups are enabled. DISABLING: Autodefined rules for reverse DNS lookups are being disabled but
        # are not complete. DISABLED: Autodefined rules for reverse DNS lookups are disabled.

        @[JSON::Field(key: "AutodefinedReverse")]
        getter autodefined_reverse : String?

        # ID for the Resolver configuration.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The owner account ID of the Amazon Virtual Private Cloud VPC.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The ID of the Amazon Virtual Private Cloud VPC or a Route 53 Profile that you're configuring
        # Resolver for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @autodefined_reverse : String? = nil,
          @id : String? = nil,
          @owner_id : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # A complex type that contains information about a configuration for DNSSEC validation.

      struct ResolverDnssecConfig
        include JSON::Serializable

        # The ID for a configuration for DNSSEC validation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The owner account ID of the virtual private cloud (VPC) for a configuration for DNSSEC validation.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The ID of the virtual private cloud (VPC) that you're configuring the DNSSEC validation status for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The validation status for a DNSSEC configuration. The status can be one of the following: ENABLING:
        # DNSSEC validation is being enabled but is not complete. ENABLED: DNSSEC validation is enabled.
        # DISABLING: DNSSEC validation is being disabled but is not complete. DISABLED DNSSEC validation is
        # disabled.

        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String?

        def initialize(
          @id : String? = nil,
          @owner_id : String? = nil,
          @resource_id : String? = nil,
          @validation_status : String? = nil
        )
        end
      end

      # In the response to a CreateResolverEndpoint , DeleteResolverEndpoint , GetResolverEndpoint , Updates
      # the name, or ResolverEndpointType for an endpoint, or UpdateResolverEndpoint request, a complex type
      # that contains settings for an existing inbound or outbound Resolver endpoint.

      struct ResolverEndpoint
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the Resolver endpoint.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the endpoint was created, in Unix time format and Coordinated Universal Time
        # (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string that identifies the request that created the Resolver endpoint. The CreatorRequestId
        # allows failed requests to be retried without the risk of running the operation twice.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # Indicates whether the Resolver endpoint allows inbound or outbound DNS queries: INBOUND : allows DNS
        # queries to your VPC from your network OUTBOUND : allows DNS queries from your VPC to your network
        # INBOUND_DELEGATION : Resolver delegates queries to Route 53 private hosted zones from your network.

        @[JSON::Field(key: "Direction")]
        getter direction : String?

        # The ID of the VPC that you want to create the Resolver endpoint in.

        @[JSON::Field(key: "HostVPCId")]
        getter host_vpc_id : String?

        # The ID of the Resolver endpoint.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of IP addresses that the Resolver endpoint can use for DNS queries.

        @[JSON::Field(key: "IpAddressCount")]
        getter ip_address_count : Int32?

        # The date and time that the endpoint was last modified, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # The name that you assigned to the Resolver endpoint when you submitted a CreateResolverEndpoint
        # request.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN (Amazon Resource Name) for the Outpost.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The Amazon EC2 instance type.

        @[JSON::Field(key: "PreferredInstanceType")]
        getter preferred_instance_type : String?

        # Protocols used for the endpoint. DoH-FIPS is applicable for a default inbound endpoints only. For an
        # inbound endpoint you can apply the protocols as follows: Do53 and DoH in combination. Do53 and
        # DoH-FIPS in combination. Do53 alone. DoH alone. DoH-FIPS alone. None, which is treated as Do53. For
        # a delegation inbound endpoint you can use Do53 only. For an outbound endpoint you can apply the
        # protocols as follows: Do53 and DoH in combination. Do53 alone. DoH alone. None, which is treated as
        # Do53.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # The Resolver endpoint IP address type.

        @[JSON::Field(key: "ResolverEndpointType")]
        getter resolver_endpoint_type : String?

        # Indicates whether RNI enhanced metrics are enabled for the Resolver endpoint. When enabled,
        # one-minute granular metrics are published in CloudWatch for each RNI associated with this endpoint.
        # When disabled, these metrics are not published.

        @[JSON::Field(key: "RniEnhancedMetricsEnabled")]
        getter rni_enhanced_metrics_enabled : Bool?

        # The ID of one or more security groups that control access to this VPC. The security group must
        # include one or more inbound rules (for inbound endpoints) or outbound rules (for outbound
        # endpoints). Inbound and outbound rules must allow TCP and UDP access. For inbound access, open port
        # 53. For outbound access, open the port that you're using for DNS queries on your network.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A code that specifies the current status of the Resolver endpoint. Valid values include the
        # following: CREATING : Resolver is creating and configuring one or more Amazon VPC network interfaces
        # for this endpoint. OPERATIONAL : The Amazon VPC network interfaces for this endpoint are correctly
        # configured and able to pass inbound or outbound DNS queries between your network and Resolver.
        # UPDATING : Resolver is associating or disassociating one or more network interfaces with this
        # endpoint. AUTO_RECOVERING : Resolver is trying to recover one or more of the network interfaces that
        # are associated with this endpoint. During the recovery process, the endpoint functions with limited
        # capacity because of the limit on the number of DNS queries per IP address (per network interface).
        # For the current limit, see Limits on Route 53 Resolver . ACTION_NEEDED : This endpoint is unhealthy,
        # and Resolver can't automatically recover it. To resolve the problem, we recommend that you check
        # each IP address that you associated with the endpoint. For each IP address that isn't available, add
        # another IP address and then delete the IP address that isn't available. (An endpoint must always
        # include at least two IP addresses.) A status of ACTION_NEEDED can have a variety of causes. Here are
        # two common causes: One or more of the network interfaces that are associated with the endpoint were
        # deleted using Amazon VPC. The network interface couldn't be created for some reason that's outside
        # the control of Resolver. DELETING : Resolver is deleting this endpoint and the associated network
        # interfaces.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed description of the status of the Resolver endpoint.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Indicates whether target name server metrics are enabled for the outbound Resolver endpoint. When
        # enabled, one-minute granular metrics are published in CloudWatch for each target name server
        # associated with this endpoint. When disabled, these metrics are not published. This feature is not
        # supported for inbound Resolver endpoint.

        @[JSON::Field(key: "TargetNameServerMetricsEnabled")]
        getter target_name_server_metrics_enabled : Bool?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @direction : String? = nil,
          @host_vpc_id : String? = nil,
          @id : String? = nil,
          @ip_address_count : Int32? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @outpost_arn : String? = nil,
          @preferred_instance_type : String? = nil,
          @protocols : Array(String)? = nil,
          @resolver_endpoint_type : String? = nil,
          @rni_enhanced_metrics_enabled : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @target_name_server_metrics_enabled : Bool? = nil
        )
        end
      end

      # In the response to a CreateResolverQueryLogConfig , DeleteResolverQueryLogConfig ,
      # GetResolverQueryLogConfig , or ListResolverQueryLogConfigs request, a complex type that contains
      # settings for one query logging configuration.

      struct ResolverQueryLogConfig
        include JSON::Serializable

        # The ARN for the query logging configuration.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of VPCs that are associated with the query logging configuration.

        @[JSON::Field(key: "AssociationCount")]
        getter association_count : Int32?

        # The date and time that the query logging configuration was created, in Unix time format and
        # Coordinated Universal Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string that identifies the request that created the query logging configuration. The
        # CreatorRequestId allows failed requests to be retried without the risk of running the operation
        # twice.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ARN of the resource that you want Resolver to send query logs: an Amazon S3 bucket, a CloudWatch
        # Logs log group, or a Kinesis Data Firehose delivery stream.

        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        # The ID for the query logging configuration.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the query logging configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID for the account that created the query logging configuration.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # An indication of whether the query logging configuration is shared with other Amazon Web Services
        # accounts, or was shared with the current account by another Amazon Web Services account. Sharing is
        # configured through Resource Access Manager (RAM).

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # The status of the specified query logging configuration. Valid values include the following:
        # CREATING : Resolver is creating the query logging configuration. CREATED : The query logging
        # configuration was successfully created. Resolver is logging queries that originate in the specified
        # VPC. DELETING : Resolver is deleting this query logging configuration. FAILED : Resolver can't
        # deliver logs to the location that is specified in the query logging configuration. Here are two
        # common causes: The specified destination (for example, an Amazon S3 bucket) was deleted. Permissions
        # don't allow sending logs to the destination.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @association_count : Int32? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @destination_arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @share_status : String? = nil,
          @status : String? = nil
        )
        end
      end

      # In the response to an AssociateResolverQueryLogConfig , DisassociateResolverQueryLogConfig ,
      # GetResolverQueryLogConfigAssociation , or ListResolverQueryLogConfigAssociations , request, a
      # complex type that contains settings for a specified association between an Amazon VPC and a query
      # logging configuration.

      struct ResolverQueryLogConfigAssociation
        include JSON::Serializable

        # The date and time that the VPC was associated with the query logging configuration, in Unix time
        # format and Coordinated Universal Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # If the value of Status is FAILED , the value of Error indicates the cause: DESTINATION_NOT_FOUND :
        # The specified destination (for example, an Amazon S3 bucket) was deleted. ACCESS_DENIED :
        # Permissions don't allow sending logs to the destination. If the value of Status is a value other
        # than FAILED , Error is null.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # Contains additional information about the error. If the value or Error is null, the value of
        # ErrorMessage also is null.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the query logging association.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ID of the query logging configuration that a VPC is associated with.

        @[JSON::Field(key: "ResolverQueryLogConfigId")]
        getter resolver_query_log_config_id : String?

        # The ID of the Amazon VPC that is associated with the query logging configuration.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The status of the specified query logging association. Valid values include the following: CREATING
        # : Resolver is creating an association between an Amazon VPC and a query logging configuration.
        # ACTIVE : The association between an Amazon VPC and a query logging configuration was successfully
        # created. Resolver is logging queries that originate in the specified VPC. DELETING : Resolver is
        # deleting this query logging association. FAILED : Resolver either couldn't create or couldn't delete
        # the query logging association.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : String? = nil,
          @error : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @resolver_query_log_config_id : String? = nil,
          @resource_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # For queries that originate in your VPC, detailed information about a Resolver rule, which specifies
      # how to route DNS queries out of the VPC. The ResolverRule parameter appears in the response to a
      # CreateResolverRule , DeleteResolverRule , GetResolverRule , ListResolverRules , or
      # UpdateResolverRule request.

      struct ResolverRule
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the Resolver rule specified by Id .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the Resolver rule was created, in Unix time format and Coordinated Universal
        # Time (UTC).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String?

        # A unique string that you specified when you created the Resolver rule. CreatorRequestId identifies
        # the request and allows failed requests to be retried without the risk of running the operation
        # twice.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # DNS queries with delegation records that point to this domain name are forwarded to resolvers on
        # your network.

        @[JSON::Field(key: "DelegationRecord")]
        getter delegation_record : String?

        # DNS queries for this domain name are forwarded to the IP addresses that are specified in TargetIps .
        # If a query matches multiple Resolver rules (example.com and www.example.com), the query is routed
        # using the Resolver rule that contains the most specific domain name (www.example.com).

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The ID that Resolver assigned to the Resolver rule when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the Resolver rule was last updated, in Unix time format and Coordinated
        # Universal Time (UTC).

        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : String?

        # The name for the Resolver rule, which you specified when you created the Resolver rule. The name can
        # be up to 64 characters long and can contain letters (a-z, A-Z), numbers (0-9), hyphens (-),
        # underscores (_), and spaces. The name cannot consist of only numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # When a rule is shared with another Amazon Web Services account, the account ID of the account that
        # the rule is shared with.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The ID of the endpoint that the rule is associated with.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String?

        # When you want to forward DNS queries for specified domain name to resolvers on your network, specify
        # FORWARD or DELEGATE . If a query matches multiple Resolver rules (example.com and www.example.com),
        # outbound DNS queries are routed using the Resolver rule that contains the most specific domain name
        # (www.example.com). When you have a forwarding rule to forward DNS queries for a domain to your
        # network and you want Resolver to process queries for a subdomain of that domain, specify SYSTEM .
        # For example, to forward DNS queries for example.com to resolvers on your network, you create a rule
        # and specify FORWARD for RuleType . To then have Resolver process queries for apex.example.com, you
        # create a rule and specify SYSTEM for RuleType . Currently, only Resolver can create rules that have
        # a value of RECURSIVE for RuleType .

        @[JSON::Field(key: "RuleType")]
        getter rule_type : String?

        # Whether the rule is shared and, if so, whether the current account is sharing the rule with another
        # account, or another account is sharing the rule with the current account.

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # A code that specifies the current status of the Resolver rule.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed description of the status of a Resolver rule.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # An array that contains the IP addresses and ports that an outbound endpoint forwards DNS queries to.
        # Typically, these are the IP addresses of DNS resolvers on your network.

        @[JSON::Field(key: "TargetIps")]
        getter target_ips : Array(Types::TargetAddress)?

        def initialize(
          @arn : String? = nil,
          @creation_time : String? = nil,
          @creator_request_id : String? = nil,
          @delegation_record : String? = nil,
          @domain_name : String? = nil,
          @id : String? = nil,
          @modification_time : String? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @resolver_endpoint_id : String? = nil,
          @rule_type : String? = nil,
          @share_status : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @target_ips : Array(Types::TargetAddress)? = nil
        )
        end
      end

      # In the response to an AssociateResolverRule , DisassociateResolverRule , or
      # ListResolverRuleAssociations request, provides information about an association between a Resolver
      # rule and a VPC. The association determines which DNS queries that originate in the VPC are forwarded
      # to your network.

      struct ResolverRuleAssociation
        include JSON::Serializable

        # The ID of the association between a Resolver rule and a VPC. Resolver assigns this value when you
        # submit an AssociateResolverRule request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of an association between a Resolver rule and a VPC. The name can be up to 64 characters
        # long and can contain letters (a-z, A-Z), numbers (0-9), hyphens (-), underscores (_), and spaces.
        # The name cannot consist of only numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the Resolver rule that you associated with the VPC that is specified by VPCId .

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String?

        # A code that specifies the current status of the association between a Resolver rule and a VPC.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed description of the status of the association between a Resolver rule and a VPC.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The ID of the VPC that you associated the Resolver rule with.

        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @resolver_rule_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # In an UpdateResolverRule request, information about the changes that you want to make.

      struct ResolverRuleConfig
        include JSON::Serializable

        # The new name for the Resolver rule. The name that you specify appears in the Resolver dashboard in
        # the Route 53 console. The name can be up to 64 characters long and can contain letters (a-z, A-Z),
        # numbers (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the new outbound Resolver endpoint that you want to use to route DNS queries to the IP
        # addresses that you specify in TargetIps .

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String?

        # For DNS queries that originate in your VPC, the new IP addresses that you want to route outbound DNS
        # queries to.

        @[JSON::Field(key: "TargetIps")]
        getter target_ips : Array(Types::TargetAddress)?

        def initialize(
          @name : String? = nil,
          @resolver_endpoint_id : String? = nil,
          @target_ips : Array(Types::TargetAddress)? = nil
        )
        end
      end

      # The resource that you tried to create already exists.

      struct ResourceExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # For a ResourceExistsException error, the type of resource that the error applies to.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The resource that you tried to update or delete is currently in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # For a ResourceInUseException error, the type of resource that is currently in use.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The specified resource doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # For a ResourceNotFoundException error, the type of resource that doesn't exist.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The specified resource isn't available.

      struct ResourceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # For a ResourceUnavailableException error, the type of resource that isn't available.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Fulfilling the request would cause one or more quotas to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One tag that you want to add to the specified resource. A tag consists of a Key (a name for the tag)
      # and a Value .

      struct Tag
        include JSON::Serializable

        # The name for the tag. For example, if you want to associate Resolver resources with the account IDs
        # of your customers for billing purposes, the value of Key might be account-id .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the tag. For example, if Key is account-id , then Value might be the ID of the
        # customer account that you're creating the resource for.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to add tags to. To get the ARN for a
        # resource, use the applicable Get or List command: GetResolverEndpoint GetResolverRule
        # GetResolverRuleAssociation ListResolverEndpoints ListResolverRuleAssociations ListResolverRules

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags that you want to add to the specified resource.

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

      # In a CreateResolverRule request, an array of the IPs that you want to forward DNS queries to.

      struct TargetAddress
        include JSON::Serializable

        # One IPv4 address that you want to forward DNS queries to.

        @[JSON::Field(key: "Ip")]
        getter ip : String?

        # One IPv6 address that you want to forward DNS queries to.

        @[JSON::Field(key: "Ipv6")]
        getter ipv6 : String?

        # The port at Ip that you want to forward DNS queries to.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocols for the target address. The protocol you choose needs to be supported by the outbound
        # endpoint of the Resolver rule.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The Server Name Indication of the DoH server that you want to forward queries to. This is only used
        # if the Protocol of the TargetAddress is DoH .

        @[JSON::Field(key: "ServerNameIndication")]
        getter server_name_indication : String?

        def initialize(
          @ip : String? = nil,
          @ipv6 : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @server_name_indication : String? = nil
        )
        end
      end

      # The request was throttled. Try again in a few minutes.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource doesn't exist.

      struct UnknownResourceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to remove tags from. To get the ARN
        # for a resource, use the applicable Get or List command: GetResolverEndpoint GetResolverRule
        # GetResolverRuleAssociation ListResolverEndpoints ListResolverRuleAssociations ListResolverRules

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags that you want to remove to the specified resource.

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


      struct UpdateFirewallConfigRequest
        include JSON::Serializable

        # Determines how Route 53 Resolver handles queries during failures, for example when all traffic that
        # is sent to DNS Firewall fails to receive a reply. By default, fail open is disabled, which means the
        # failure mode is closed. This approach favors security over availability. DNS Firewall blocks queries
        # that it is unable to evaluate properly. If you enable this option, the failure mode is open. This
        # approach favors availability over security. DNS Firewall allows queries to proceed if it is unable
        # to properly evaluate them. This behavior is only enforced for VPCs that have at least one DNS
        # Firewall rule group association.

        @[JSON::Field(key: "FirewallFailOpen")]
        getter firewall_fail_open : String

        # The ID of the VPC that the configuration is for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @firewall_fail_open : String,
          @resource_id : String
        )
        end
      end


      struct UpdateFirewallConfigResponse
        include JSON::Serializable

        # Configuration of the firewall behavior provided by DNS Firewall for a single VPC.

        @[JSON::Field(key: "FirewallConfig")]
        getter firewall_config : Types::FirewallConfig?

        def initialize(
          @firewall_config : Types::FirewallConfig? = nil
        )
        end
      end


      struct UpdateFirewallDomainsRequest
        include JSON::Serializable

        # A list of domains to use in the update operation. There is a limit of 1000 domains per request. Each
        # domain specification in your domain list must satisfy the following requirements: It can optionally
        # start with * (asterisk). With the exception of the optional starting asterisk, it must only contain
        # the following characters: A-Z , a-z , 0-9 , - (hyphen). It must be from 1-255 characters in length.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(String)

        # The ID of the domain list whose domains you want to update.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String

        # What you want DNS Firewall to do with the domains that you are providing: ADD - Add the domains to
        # the ones that are already in the domain list. REMOVE - Search the domain list for the domains and
        # remove them from the list. REPLACE - Update the domain list to exactly match the list that you are
        # providing.

        @[JSON::Field(key: "Operation")]
        getter operation : String

        def initialize(
          @domains : Array(String),
          @firewall_domain_list_id : String,
          @operation : String
        )
        end
      end


      struct UpdateFirewallDomainsResponse
        include JSON::Serializable

        # The ID of the firewall domain list that DNS Firewall just updated.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the domain list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Status of the UpdateFirewallDomains request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the status of the list, if available.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct UpdateFirewallRuleGroupAssociationRequest
        include JSON::Serializable

        # The identifier of the FirewallRuleGroupAssociation .

        @[JSON::Field(key: "FirewallRuleGroupAssociationId")]
        getter firewall_rule_group_association_id : String

        # If enabled, this setting disallows modification or removal of the association, to help prevent
        # against accidentally altering DNS firewall protections.

        @[JSON::Field(key: "MutationProtection")]
        getter mutation_protection : String?

        # The name of the rule group association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The setting that determines the processing order of the rule group among the rule groups that you
        # associate with the specified VPC. DNS Firewall filters VPC traffic starting from the rule group with
        # the lowest numeric priority setting. You must specify a unique priority for each rule group that you
        # associate with a single VPC. To make it easier to insert rule groups later, leave space between the
        # numbers, for example, use 100, 200, and so on. You can change the priority setting for a rule group
        # association after you create it.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        def initialize(
          @firewall_rule_group_association_id : String,
          @mutation_protection : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end


      struct UpdateFirewallRuleGroupAssociationResponse
        include JSON::Serializable

        # The association that you just updated.

        @[JSON::Field(key: "FirewallRuleGroupAssociation")]
        getter firewall_rule_group_association : Types::FirewallRuleGroupAssociation?

        def initialize(
          @firewall_rule_group_association : Types::FirewallRuleGroupAssociation? = nil
        )
        end
      end


      struct UpdateFirewallRuleRequest
        include JSON::Serializable

        # The unique identifier of the firewall rule group for the rule.

        @[JSON::Field(key: "FirewallRuleGroupId")]
        getter firewall_rule_group_id : String

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule: ALLOW - Permit the request to go
        # through. Not available for DNS Firewall Advanced rules. ALERT - Permit the request to go through but
        # send an alert to the logs. BLOCK - Disallow the request. This option requires additional details in
        # the rule's BlockResponse .

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .

        @[JSON::Field(key: "BlockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request. Used for the rule action setting BLOCK .
        # NODATA - Respond indicating that the query was successful, but no response is available for it.
        # NXDOMAIN - Respond indicating that the domain name that's in the query doesn't exist. OVERRIDE -
        # Provide a custom override in the response. This option requires custom handling details in the
        # rule's BlockOverride* settings.

        @[JSON::Field(key: "BlockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule. The confidence level values mean: LOW : Provides the highest detection
        # rate for threats, but also increases false positives. MEDIUM : Provides a balance between detecting
        # threats and false positives. HIGH : Detects only the most well corroborated threats with a low rate
        # of false positives.

        @[JSON::Field(key: "ConfidenceThreshold")]
        getter confidence_threshold : String?

        # The type of the DNS Firewall Advanced rule. Valid values are: DGA : Domain generation algorithms
        # detection. DGAs are used by attackers to generate a large number of domains to to launch malware
        # attacks. DNS_TUNNELING : DNS tunneling detection. DNS tunneling is used by attackers to exfiltrate
        # data from the client by using the DNS tunnel without making a network connection to the client.

        @[JSON::Field(key: "DnsThreatProtection")]
        getter dns_threat_protection : String?

        # The ID of the domain list to use in the rule.

        @[JSON::Field(key: "FirewallDomainListId")]
        getter firewall_domain_list_id : String?

        # How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such as CNAME or
        # DNAME. INSPECT_REDIRECTION_DOMAIN : (Default) inspects all domains in the redirection chain. The
        # individual domains in the redirection chain must be added to the domain list.
        # TRUST_REDIRECTION_DOMAIN : Inspects only the first domain in the redirection chain. You don't need
        # to add the subsequent domains in the domain in the redirection list to the domain list.

        @[JSON::Field(key: "FirewallDomainRedirectionAction")]
        getter firewall_domain_redirection_action : String?

        # The DNS Firewall Advanced rule ID.

        @[JSON::Field(key: "FirewallThreatProtectionId")]
        getter firewall_threat_protection_id : String?

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The setting that determines the processing order of the rule in the rule group. DNS Firewall
        # processes the rules in a rule group by order of priority, starting from the lowest setting. You must
        # specify a unique priority for each rule in a rule group. To make it easier to insert rules later,
        # leave space between the numbers, for example, use 100, 200, and so on. You can change the priority
        # setting for the rules in a rule group at any time.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The DNS query type you want the rule to evaluate. Allowed values are; A: Returns an IPv4 address.
        # AAAA: Returns an Ipv6 address. CAA: Restricts CAs that can create SSL/TLS certifications for the
        # domain. CNAME: Returns another domain name. DS: Record that identifies the DNSSEC signing key of a
        # delegated zone. MX: Specifies mail servers. NAPTR: Regular-expression-based rewriting of domain
        # names. NS: Authoritative name servers. PTR: Maps an IP address to a domain name. SOA: Start of
        # authority record for the zone. SPF: Lists the servers authorized to send emails from a domain. SRV:
        # Application specific values that identify servers. TXT: Verifies email senders and
        # application-specific values. A query type you define by using the DNS type ID, for example 28 for
        # AAAA. The values must be defined as TYPENUMBER, where the NUMBER can be 1-65334, for example,
        # TYPE28. For more information, see List of DNS record types . If you set up a firewall BLOCK rule
        # with action NXDOMAIN on query type equals AAAA, this action will not be applied to synthetic IPv6
        # addresses generated when DNS64 is enabled.

        @[JSON::Field(key: "Qtype")]
        getter qtype : String?

        def initialize(
          @firewall_rule_group_id : String,
          @action : String? = nil,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @dns_threat_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @firewall_domain_redirection_action : String? = nil,
          @firewall_threat_protection_id : String? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @qtype : String? = nil
        )
        end
      end


      struct UpdateFirewallRuleResponse
        include JSON::Serializable

        # The firewall rule that you just updated.

        @[JSON::Field(key: "FirewallRule")]
        getter firewall_rule : Types::FirewallRule?

        def initialize(
          @firewall_rule : Types::FirewallRule? = nil
        )
        end
      end

      # Provides information about the IP address type in response to UpdateResolverEndpoint .

      struct UpdateIpAddress
        include JSON::Serializable

        # The ID of the IP address, specified by the ResolverEndpointId .

        @[JSON::Field(key: "IpId")]
        getter ip_id : String

        # The IPv6 address that you want to use for DNS queries.

        @[JSON::Field(key: "Ipv6")]
        getter ipv6 : String

        def initialize(
          @ip_id : String,
          @ipv6 : String
        )
        end
      end


      struct UpdateOutpostResolverRequest
        include JSON::Serializable

        # A unique string that identifies Resolver on an Outpost.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon EC2 instance count for a Resolver on the Outpost.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # Name of the Resolver on the Outpost.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Amazon EC2 instance type.

        @[JSON::Field(key: "PreferredInstanceType")]
        getter preferred_instance_type : String?

        def initialize(
          @id : String,
          @instance_count : Int32? = nil,
          @name : String? = nil,
          @preferred_instance_type : String? = nil
        )
        end
      end


      struct UpdateOutpostResolverResponse
        include JSON::Serializable

        # The response to an UpdateOutpostResolver request.

        @[JSON::Field(key: "OutpostResolver")]
        getter outpost_resolver : Types::OutpostResolver?

        def initialize(
          @outpost_resolver : Types::OutpostResolver? = nil
        )
        end
      end


      struct UpdateResolverConfigRequest
        include JSON::Serializable

        # Indicates whether or not the Resolver will create autodefined rules for reverse DNS lookups. This is
        # enabled by default. Disabling this option will also affect EC2-Classic instances using ClassicLink.
        # For more information, see ClassicLink in the Amazon EC2 guide . We are retiring EC2-Classic on
        # August 15, 2022. We recommend that you migrate from EC2-Classic to a VPC. For more information, see
        # Migrate from EC2-Classic to a VPC in the Amazon EC2 guide and the blog EC2-Classic Networking is
        # Retiring – Here’s How to Prepare . It can take some time for the status change to be completed.

        @[JSON::Field(key: "AutodefinedReverseFlag")]
        getter autodefined_reverse_flag : String

        # The ID of the Amazon Virtual Private Cloud VPC or a Route 53 Profile that you're configuring
        # Resolver for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @autodefined_reverse_flag : String,
          @resource_id : String
        )
        end
      end


      struct UpdateResolverConfigResponse
        include JSON::Serializable

        # An array that contains settings for the specified Resolver configuration.

        @[JSON::Field(key: "ResolverConfig")]
        getter resolver_config : Types::ResolverConfig?

        def initialize(
          @resolver_config : Types::ResolverConfig? = nil
        )
        end
      end


      struct UpdateResolverDnssecConfigRequest
        include JSON::Serializable

        # The ID of the virtual private cloud (VPC) that you're updating the DNSSEC validation status for.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The new value that you are specifying for DNSSEC validation for the VPC. The value can be ENABLE or
        # DISABLE . Be aware that it can take time for a validation status change to be completed.

        @[JSON::Field(key: "Validation")]
        getter validation : String

        def initialize(
          @resource_id : String,
          @validation : String
        )
        end
      end


      struct UpdateResolverDnssecConfigResponse
        include JSON::Serializable

        # A complex type that contains settings for the specified DNSSEC configuration.

        @[JSON::Field(key: "ResolverDNSSECConfig")]
        getter resolver_dnssec_config : Types::ResolverDnssecConfig?

        def initialize(
          @resolver_dnssec_config : Types::ResolverDnssecConfig? = nil
        )
        end
      end


      struct UpdateResolverEndpointRequest
        include JSON::Serializable

        # The ID of the Resolver endpoint that you want to update.

        @[JSON::Field(key: "ResolverEndpointId")]
        getter resolver_endpoint_id : String

        # The name of the Resolver endpoint that you want to update.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The protocols you want to use for the endpoint. DoH-FIPS is applicable for default inbound endpoints
        # only. For a default inbound endpoint you can apply the protocols as follows: Do53 and DoH in
        # combination. Do53 and DoH-FIPS in combination. Do53 alone. DoH alone. DoH-FIPS alone. None, which is
        # treated as Do53. For a delegation inbound endpoint you can use Do53 only. For an outbound endpoint
        # you can apply the protocols as follows: Do53 and DoH in combination. Do53 alone. DoH alone. None,
        # which is treated as Do53. You can't change the protocol of an inbound endpoint directly from only
        # Do53 to only DoH, or DoH-FIPS. This is to prevent a sudden disruption to incoming traffic that
        # relies on Do53. To change the protocol from Do53 to DoH, or DoH-FIPS, you must first enable both
        # Do53 and DoH, or Do53 and DoH-FIPS, to make sure that all incoming traffic has transferred to using
        # the DoH protocol, or DoH-FIPS, and then remove the Do53.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # Specifies the endpoint type for what type of IP address the endpoint uses to forward DNS queries.
        # Updating to IPV6 type isn't currently supported.

        @[JSON::Field(key: "ResolverEndpointType")]
        getter resolver_endpoint_type : String?

        # Updates whether RNI enhanced metrics are enabled for the Resolver endpoints. When set to true,
        # one-minute granular metrics are published in CloudWatch for each RNI associated with this endpoint.
        # When set to false, metrics are not published. Standard CloudWatch pricing and charges are applied
        # for using the Route 53 Resolver endpoint RNI enhanced metrics. For more information, see Detailed
        # metrics .

        @[JSON::Field(key: "RniEnhancedMetricsEnabled")]
        getter rni_enhanced_metrics_enabled : Bool?

        # Updates whether target name server metrics are enabled for the outbound Resolver endpoints. When set
        # to true, one-minute granular metrics are published in CloudWatch for each target name server
        # associated with this endpoint. When set to false, metrics are not published. This setting is not
        # supported for inbound Resolver endpoints. Standard CloudWatch pricing and charges are applied for
        # using the Route 53 Resolver endpoint target name server metrics. For more information, see Detailed
        # metrics .

        @[JSON::Field(key: "TargetNameServerMetricsEnabled")]
        getter target_name_server_metrics_enabled : Bool?

        # Specifies the IPv6 address when you update the Resolver endpoint from IPv4 to dual-stack. If you
        # don't specify an IPv6 address, one will be automatically chosen from your subnet.

        @[JSON::Field(key: "UpdateIpAddresses")]
        getter update_ip_addresses : Array(Types::UpdateIpAddress)?

        def initialize(
          @resolver_endpoint_id : String,
          @name : String? = nil,
          @protocols : Array(String)? = nil,
          @resolver_endpoint_type : String? = nil,
          @rni_enhanced_metrics_enabled : Bool? = nil,
          @target_name_server_metrics_enabled : Bool? = nil,
          @update_ip_addresses : Array(Types::UpdateIpAddress)? = nil
        )
        end
      end


      struct UpdateResolverEndpointResponse
        include JSON::Serializable

        # The response to an UpdateResolverEndpoint request.

        @[JSON::Field(key: "ResolverEndpoint")]
        getter resolver_endpoint : Types::ResolverEndpoint?

        def initialize(
          @resolver_endpoint : Types::ResolverEndpoint? = nil
        )
        end
      end


      struct UpdateResolverRuleRequest
        include JSON::Serializable

        # The new settings for the Resolver rule.

        @[JSON::Field(key: "Config")]
        getter config : Types::ResolverRuleConfig

        # The ID of the Resolver rule that you want to update.

        @[JSON::Field(key: "ResolverRuleId")]
        getter resolver_rule_id : String

        def initialize(
          @config : Types::ResolverRuleConfig,
          @resolver_rule_id : String
        )
        end
      end


      struct UpdateResolverRuleResponse
        include JSON::Serializable

        # The response to an UpdateResolverRule request.

        @[JSON::Field(key: "ResolverRule")]
        getter resolver_rule : Types::ResolverRule?

        def initialize(
          @resolver_rule : Types::ResolverRule? = nil
        )
        end
      end

      # You have provided an invalid command. If you ran the UpdateFirewallDomains request. supported values
      # are ADD , REMOVE , or REPLACE a domain.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
