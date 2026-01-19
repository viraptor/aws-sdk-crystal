require "json"
require "time"

module AwsSdk
  module NetworkFirewall
    module Types

      # The status of the firewall endpoint defined by a VpcEndpointAssociation .
      struct AZSyncState
        include JSON::Serializable

        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        def initialize(
          @attachment : Types::Attachment? = nil
        )
        end
      end

      struct AcceptNetworkFirewallTransitGatewayAttachmentRequest
        include JSON::Serializable

        # Required. The unique identifier of the transit gateway attachment to accept. This ID is returned in
        # the response when creating a transit gateway-attached firewall.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        def initialize(
          @transit_gateway_attachment_id : String
        )
        end
      end

      struct AcceptNetworkFirewallTransitGatewayAttachmentResponse
        include JSON::Serializable

        # The unique identifier of the transit gateway attachment that was accepted.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        # The current status of the transit gateway attachment. Valid values are: CREATING - The attachment is
        # being created DELETING - The attachment is being deleted DELETED - The attachment has been deleted
        # FAILED - The attachment creation has failed and cannot be recovered ERROR - The attachment is in an
        # error state that might be recoverable READY - The attachment is active and processing traffic
        # PENDING_ACCEPTANCE - The attachment is waiting to be accepted REJECTING - The attachment is in the
        # process of being rejected REJECTED - The attachment has been rejected
        @[JSON::Field(key: "TransitGatewayAttachmentStatus")]
        getter transit_gateway_attachment_status : String

        def initialize(
          @transit_gateway_attachment_id : String,
          @transit_gateway_attachment_status : String
        )
        end
      end

      # A custom action to use in stateless rule actions settings. This is used in CustomAction .
      struct ActionDefinition
        include JSON::Serializable

        # Stateless inspection criteria that publishes the specified metrics to Amazon CloudWatch for the
        # matching packet. This setting defines a CloudWatch dimension value to be published. You can pair
        # this custom action with any of the standard stateless rule actions. For example, you could pair this
        # in a rule action with the standard action that forwards the packet for stateful inspection. Then,
        # when a packet matches the rule, Network Firewall publishes metrics for the packet and forwards it.
        @[JSON::Field(key: "PublishMetricAction")]
        getter publish_metric_action : Types::PublishMetricAction?

        def initialize(
          @publish_metric_action : Types::PublishMetricAction? = nil
        )
        end
      end

      # A single IP address specification. This is used in the MatchAttributes source and destination
      # specifications.
      struct Address
        include JSON::Serializable

        # Specify an IP address or a block of IP addresses in Classless Inter-Domain Routing (CIDR) notation.
        # Network Firewall supports all address ranges for IPv4 and IPv6. Examples: To configure Network
        # Firewall to inspect for the IP address 192.0.2.44, specify 192.0.2.44/32 . To configure Network
        # Firewall to inspect for IP addresses from 192.0.2.0 to 192.0.2.255, specify 192.0.2.0/24 . To
        # configure Network Firewall to inspect for the IP address 1111:0000:0000:0000:0000:0000:0000:0111,
        # specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . To configure Network Firewall to inspect for
        # IP addresses from 1111:0000:0000:0000:0000:0000:0000:0000 to
        # 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        @[JSON::Field(key: "AddressDefinition")]
        getter address_definition : String

        def initialize(
          @address_definition : String
        )
        end
      end

      # A report that captures key activity from the last 30 days of network traffic monitored by your
      # firewall. You can generate up to one report per traffic type, per 30 day period. For example, when
      # you successfully create an HTTP traffic report, you cannot create another HTTP traffic report until
      # 30 days pass. Alternatively, if you generate a report that combines metrics on both HTTP and HTTPS
      # traffic, you cannot create another report for either traffic type until 30 days pass.
      struct AnalysisReport
        include JSON::Serializable

        # The unique ID of the query that ran when you requested an analysis report.
        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String?

        # The type of traffic that will be used to generate a report.
        @[JSON::Field(key: "AnalysisType")]
        getter analysis_type : String?

        # The date and time the analysis report was ran.
        @[JSON::Field(key: "ReportTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter report_time : Time?

        # The status of the analysis report you specify. Statuses include RUNNING , COMPLETED , or FAILED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @analysis_report_id : String? = nil,
          @analysis_type : String? = nil,
          @report_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The analysis result for Network Firewall's stateless rule group analyzer. Every time you call
      # CreateRuleGroup , UpdateRuleGroup , or DescribeRuleGroup on a stateless rule group, Network Firewall
      # analyzes the stateless rule groups in your account and identifies the rules that might adversely
      # effect your firewall's functionality. For example, if Network Firewall detects a rule that's routing
      # traffic asymmetrically, which impacts the service's ability to properly process traffic, the service
      # includes the rule in a list of analysis results. The AnalysisResult data type is not related to
      # traffic analysis reports you generate using StartAnalysisReport . For information on traffic
      # analysis report results, see AnalysisTypeReportResult .
      struct AnalysisResult
        include JSON::Serializable

        # Provides analysis details for the identified rule.
        @[JSON::Field(key: "AnalysisDetail")]
        getter analysis_detail : String?

        # The priority number of the stateless rules identified in the analysis.
        @[JSON::Field(key: "IdentifiedRuleIds")]
        getter identified_rule_ids : Array(String)?

        # The types of rule configurations that Network Firewall analyzes your rule groups for. Network
        # Firewall analyzes stateless rule groups for the following types of rule configurations:
        # STATELESS_RULE_FORWARDING_ASYMMETRICALLY Cause: One or more stateless rules with the action pass or
        # forward are forwarding traffic asymmetrically. Specifically, the rule's set of source IP addresses
        # or their associated port numbers, don't match the set of destination IP addresses or their
        # associated port numbers. To mitigate: Make sure that there's an existing return path. For example,
        # if the rule allows traffic from source 10.1.0.0/24 to destination 20.1.0.0/24, you should allow
        # return traffic from source 20.1.0.0/24 to destination 10.1.0.0/24. STATELESS_RULE_CONTAINS_TCP_FLAGS
        # Cause: At least one stateless rule with the action pass or forward contains TCP flags that are
        # inconsistent in the forward and return directions. To mitigate: Prevent asymmetric routing issues
        # caused by TCP flags by following these actions: Remove unnecessary TCP flag inspections from the
        # rules. If you need to inspect TCP flags, check that the rules correctly account for changes in TCP
        # flags throughout the TCP connection cycle, for example SYN and ACK flags used in a 3-way TCP
        # handshake.
        @[JSON::Field(key: "IdentifiedType")]
        getter identified_type : String?

        def initialize(
          @analysis_detail : String? = nil,
          @identified_rule_ids : Array(String)? = nil,
          @identified_type : String? = nil
        )
        end
      end

      # The results of a COMPLETED analysis report generated with StartAnalysisReport . For an example of
      # traffic analysis report results, see the response syntax of GetAnalysisReportResults .
      struct AnalysisTypeReportResult
        include JSON::Serializable

        # The most frequently accessed domains.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The date and time any domain was first accessed (within the last 30 day period).
        @[JSON::Field(key: "FirstAccessed", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter first_accessed : Time?

        # The number of attempts made to access a observed domain.
        @[JSON::Field(key: "Hits")]
        getter hits : Types::Hits?

        # The date and time any domain was last accessed (within the last 30 day period).
        @[JSON::Field(key: "LastAccessed", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_accessed : Time?

        # The type of traffic captured by the analysis report.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The number of unique source IP addresses that connected to a domain.
        @[JSON::Field(key: "UniqueSources")]
        getter unique_sources : Types::UniqueSources?

        def initialize(
          @domain : String? = nil,
          @first_accessed : Time? = nil,
          @hits : Types::Hits? = nil,
          @last_accessed : Time? = nil,
          @protocol : String? = nil,
          @unique_sources : Types::UniqueSources? = nil
        )
        end
      end

      struct AssociateAvailabilityZonesRequest
        include JSON::Serializable

        # Required. The Availability Zones where you want to create firewall endpoints. You must specify at
        # least one Availability Zone.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping),
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AssociateAvailabilityZonesResponse
        include JSON::Serializable

        # The Availability Zones where Network Firewall created firewall endpoints. Each mapping specifies an
        # Availability Zone where the firewall processes traffic.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping)? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AssociateFirewallPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall policy.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_policy_arn : String,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AssociateFirewallPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The Amazon Resource Name (ARN) of the firewall policy.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @firewall_policy_arn : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AssociateSubnetsRequest
        include JSON::Serializable

        # The IDs of the subnets that you want to associate with the firewall.
        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @subnet_mappings : Array(Types::SubnetMapping),
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AssociateSubnetsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The IDs of the subnets that are associated with the firewall.
        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @subnet_mappings : Array(Types::SubnetMapping)? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct AttachRuleGroupsToProxyConfigurationRequest
        include JSON::Serializable

        # The proxy rule group(s) to attach to the proxy configuration
        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::ProxyRuleGroupAttachment)

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @rule_groups : Array(Types::ProxyRuleGroupAttachment),
          @update_token : String,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct AttachRuleGroupsToProxyConfigurationResponse
        include JSON::Serializable

        # The updated proxy configuration resource that reflects the updates from the request.
        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @update_token : String? = nil
        )
        end
      end

      # The definition and status of the firewall endpoint for a single subnet. In each configured subnet,
      # Network Firewall instantiates a firewall endpoint to handle network traffic. This data type is used
      # for any firewall endpoint type: For Firewall.SubnetMappings , this Attachment is part of the
      # FirewallStatus sync states information. You define firewall subnets using CreateFirewall and
      # AssociateSubnets . For VpcEndpointAssociation , this Attachment is part of the
      # VpcEndpointAssociationStatus sync states information. You define these subnets using
      # CreateVpcEndpointAssociation .
      struct Attachment
        include JSON::Serializable

        # The identifier of the firewall endpoint that Network Firewall has instantiated in the subnet. You
        # use this to identify the firewall endpoint in the VPC route tables, when you redirect the VPC
        # traffic through the endpoint.
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The current status of the firewall endpoint instantiation in the subnet. When this value is READY ,
        # the endpoint is available to handle network traffic. Otherwise, this value reflects its state, for
        # example CREATING or DELETING .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # If Network Firewall fails to create or delete the firewall endpoint in the subnet, it populates this
        # with the reason for the error or failure and how to resolve it. A FAILED status indicates a
        # non-recoverable state, and a ERROR status indicates an issue that you can fix. Depending on the
        # error, it can take as many as 15 minutes to populate this field. For more information about the
        # causes for failiure or errors and solutions available for this field, see Troubleshooting firewall
        # endpoint failures in the Network Firewall Developer Guide .
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The unique identifier of the subnet that you've specified to be used for a firewall endpoint.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @endpoint_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # Defines the mapping between an Availability Zone and a firewall endpoint for a transit
      # gateway-attached firewall. Each mapping represents where the firewall can process traffic. You use
      # these mappings when calling CreateFirewall , AssociateAvailabilityZones , and
      # DisassociateAvailabilityZones . To retrieve the current Availability Zone mappings for a firewall,
      # use DescribeFirewall .
      struct AvailabilityZoneMapping
        include JSON::Serializable

        # The ID of the Availability Zone where the firewall endpoint is located. For example, us-east-2a .
        # The Availability Zone must be in the same Region as the transit gateway.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String

        def initialize(
          @availability_zone : String
        )
        end
      end

      # High-level information about an Availability Zone where the firewall has an endpoint defined.
      struct AvailabilityZoneMetadata
        include JSON::Serializable

        # The IP address type of the Firewall subnet in the Availability Zone. You can't change the IP address
        # type after you create the subnet.
        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : String?

        def initialize(
          @ip_address_type : String? = nil
        )
        end
      end

      # Summarizes the CIDR blocks used by the IP set references in a firewall. Network Firewall calculates
      # the number of CIDRs by taking an aggregated count of all CIDRs used by the IP sets you are
      # referencing.
      struct CIDRSummary
        include JSON::Serializable

        # The number of CIDR blocks available for use by the IP set references in a firewall.
        @[JSON::Field(key: "AvailableCIDRCount")]
        getter available_cidr_count : Int32?

        # The list of the IP set references used by a firewall.
        @[JSON::Field(key: "IPSetReferences")]
        getter ip_set_references : Hash(String, Types::IPSetMetadata)?

        # The number of CIDR blocks used by the IP set references in a firewall.
        @[JSON::Field(key: "UtilizedCIDRCount")]
        getter utilized_cidr_count : Int32?

        def initialize(
          @available_cidr_count : Int32? = nil,
          @ip_set_references : Hash(String, Types::IPSetMetadata)? = nil,
          @utilized_cidr_count : Int32? = nil
        )
        end
      end

      # The capacity usage summary of the resources used by the ReferenceSets in a firewall.
      struct CapacityUsageSummary
        include JSON::Serializable

        # Describes the capacity usage of the CIDR blocks used by the IP set references in a firewall.
        @[JSON::Field(key: "CIDRs")]
        getter cid_rs : Types::CIDRSummary?

        def initialize(
          @cid_rs : Types::CIDRSummary? = nil
        )
        end
      end

      # Defines the actions to take on the SSL/TLS connection if the certificate presented by the server in
      # the connection has a revoked or unknown status.
      struct CheckCertificateRevocationStatusActions
        include JSON::Serializable

        # Configures how Network Firewall processes traffic when it determines that the certificate presented
        # by the server in the SSL/TLS connection has a revoked status. PASS - Allow the connection to
        # continue, and pass subsequent packets to the stateful engine for inspection. DROP - Network Firewall
        # closes the connection and drops subsequent packets for that connection. REJECT - Network Firewall
        # sends a TCP reject packet back to your client. The service closes the connection and drops
        # subsequent packets for that connection. REJECT is available only for TCP traffic.
        @[JSON::Field(key: "RevokedStatusAction")]
        getter revoked_status_action : String?

        # Configures how Network Firewall processes traffic when it determines that the certificate presented
        # by the server in the SSL/TLS connection has an unknown status, or a status that cannot be determined
        # for any other reason, including when the service is unable to connect to the OCSP and CRL endpoints
        # for the certificate. PASS - Allow the connection to continue, and pass subsequent packets to the
        # stateful engine for inspection. DROP - Network Firewall closes the connection and drops subsequent
        # packets for that connection. REJECT - Network Firewall sends a TCP reject packet back to your
        # client. The service closes the connection and drops subsequent packets for that connection. REJECT
        # is available only for TCP traffic.
        @[JSON::Field(key: "UnknownStatusAction")]
        getter unknown_status_action : String?

        def initialize(
          @revoked_status_action : String? = nil,
          @unknown_status_action : String? = nil
        )
        end
      end

      struct CreateFirewallPolicyRequest
        include JSON::Serializable

        # The rule groups and policy actions to use in the firewall policy.
        @[JSON::Field(key: "FirewallPolicy")]
        getter firewall_policy : Types::FirewallPolicy

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String

        # A description of the firewall policy.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether you want Network Firewall to just check the validity of the request, rather than
        # run the request. If set to TRUE , Network Firewall checks whether the request can run successfully,
        # but doesn't actually make the requested changes. The call returns the value that the request would
        # return if you ran it with dry run set to FALSE , but doesn't make additions or changes to your
        # resources. This option allows you to make sure that you have the required permissions to run the
        # request and that your request parameters are valid. If set to FALSE , Network Firewall makes the
        # requested changes to your resources.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # A complex type that contains settings for encryption of your firewall policy resources.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @firewall_policy : Types::FirewallPolicy,
          @firewall_policy_name : String,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateFirewallPolicyResponse
        include JSON::Serializable

        # The high-level properties of a firewall policy. This, along with the FirewallPolicy , define the
        # policy. You can retrieve all objects for a firewall policy by calling DescribeFirewallPolicy .
        @[JSON::Field(key: "FirewallPolicyResponse")]
        getter firewall_policy_response : Types::FirewallPolicyResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the firewall policy. The token marks the state of the policy resource at the time of the request. To
        # make changes to the policy, you provide the token in your request. Network Firewall uses the token
        # to ensure that the policy hasn't changed since you last retrieved it. If it has changed, the
        # operation fails with an InvalidTokenException . If this happens, retrieve the firewall policy again
        # to get a current copy of it with current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @firewall_policy_response : Types::FirewallPolicyResponse,
          @update_token : String
        )
        end
      end

      struct CreateFirewallRequest
        include JSON::Serializable

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String

        # The Amazon Resource Name (ARN) of the FirewallPolicy that you want to use for the firewall.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String

        # Optional. A setting indicating whether the firewall is protected against changes to its Availability
        # Zone configuration. When set to TRUE , you cannot add or remove Availability Zones without first
        # disabling this protection using UpdateAvailabilityZoneChangeProtection . Default value: FALSE
        @[JSON::Field(key: "AvailabilityZoneChangeProtection")]
        getter availability_zone_change_protection : Bool?

        # Required. The Availability Zones where you want to create firewall endpoints for a transit
        # gateway-attached firewall. You must specify at least one Availability Zone. Consider enabling the
        # firewall in every Availability Zone where you have workloads to maintain Availability Zone
        # isolation. You can modify Availability Zones later using AssociateAvailabilityZones or
        # DisassociateAvailabilityZones , but this may briefly disrupt traffic. The
        # AvailabilityZoneChangeProtection setting controls whether you can make these modifications.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)?

        # A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that
        # the firewall is protected against deletion. Use this setting to protect against accidentally
        # deleting a firewall that is in use. When you create a firewall, the operation initializes this flag
        # to TRUE .
        @[JSON::Field(key: "DeleteProtection")]
        getter delete_protection : Bool?

        # A description of the firewall.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional setting indicating the specific traffic analysis types to enable on the firewall.
        @[JSON::Field(key: "EnabledAnalysisTypes")]
        getter enabled_analysis_types : Array(String)?

        # A complex type that contains settings for encryption of your firewall resources.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A setting indicating whether the firewall is protected against a change to the firewall policy
        # association. Use this setting to protect against accidentally modifying the firewall policy for a
        # firewall that is in use. When you create a firewall, the operation initializes this setting to TRUE
        # .
        @[JSON::Field(key: "FirewallPolicyChangeProtection")]
        getter firewall_policy_change_protection : Bool?

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "SubnetChangeProtection")]
        getter subnet_change_protection : Bool?

        # The public subnets to use for your Network Firewall firewalls. Each subnet must belong to a
        # different Availability Zone in the VPC. Network Firewall creates a firewall endpoint in each subnet.
        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Required when creating a transit gateway-attached firewall. The unique identifier of the transit
        # gateway to attach to this firewall. You can provide either a transit gateway from your account or
        # one that has been shared with you through Resource Access Manager. After creating the firewall, you
        # cannot change the transit gateway association. To use a different transit gateway, you must create a
        # new firewall. For information about creating firewalls, see CreateFirewall . For specific guidance
        # about transit gateway-attached firewalls, see Considerations for transit gateway-attached firewalls
        # in the Network Firewall Developer Guide .
        @[JSON::Field(key: "TransitGatewayId")]
        getter transit_gateway_id : String?

        # The unique identifier of the VPC where Network Firewall should create the firewall. You can't change
        # this setting after you create the firewall.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @firewall_name : String,
          @firewall_policy_arn : String,
          @availability_zone_change_protection : Bool? = nil,
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping)? = nil,
          @delete_protection : Bool? = nil,
          @description : String? = nil,
          @enabled_analysis_types : Array(String)? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_policy_change_protection : Bool? = nil,
          @subnet_change_protection : Bool? = nil,
          @subnet_mappings : Array(Types::SubnetMapping)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transit_gateway_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct CreateFirewallResponse
        include JSON::Serializable

        # The configuration settings for the firewall. These settings include the firewall policy and the
        # subnets in your VPC to use for the firewall endpoints.
        @[JSON::Field(key: "Firewall")]
        getter firewall : Types::Firewall?

        # Detailed information about the current status of a Firewall . You can retrieve this for a firewall
        # by calling DescribeFirewall and providing the firewall name and ARN. The firewall status indicates a
        # combined status. It indicates whether all subnets are up-to-date with the latest firewall
        # configurations, which is based on the sync states config values, and also whether all subnets have
        # their endpoints fully enabled, based on their sync states attachment values.
        @[JSON::Field(key: "FirewallStatus")]
        getter firewall_status : Types::FirewallStatus?

        def initialize(
          @firewall : Types::Firewall? = nil,
          @firewall_status : Types::FirewallStatus? = nil
        )
        end
      end

      struct CreateProxyConfigurationRequest
        include JSON::Serializable

        # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
        # where the rule match is applied.
        @[JSON::Field(key: "DefaultRulePhaseActions")]
        getter default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String

        # A description of the proxy configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The proxy rule group arn(s) to attach to the proxy configuration. You must specify the ARNs or the
        # names, and you can specify both.
        @[JSON::Field(key: "RuleGroupArns")]
        getter rule_group_arns : Array(String)?

        # The proxy rule group name(s) to attach to the proxy configuration. You must specify the ARNs or the
        # names, and you can specify both.
        @[JSON::Field(key: "RuleGroupNames")]
        getter rule_group_names : Array(String)?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest,
          @proxy_configuration_name : String,
          @description : String? = nil,
          @rule_group_arns : Array(String)? = nil,
          @rule_group_names : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProxyConfigurationResponse
        include JSON::Serializable

        # The properties that define the proxy configuration.
        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct CreateProxyRequest
        include JSON::Serializable

        # A unique identifier for the NAT gateway to use with proxy resources.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String

        # TLS decryption on traffic to filter on attributes in the HTTP header.
        @[JSON::Field(key: "TlsInterceptProperties")]
        getter tls_intercept_properties : Types::TlsInterceptPropertiesRequest

        # Listener properties for HTTP and HTTPS traffic.
        @[JSON::Field(key: "ListenerProperties")]
        getter listener_properties : Array(Types::ListenerPropertyRequest)?

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @nat_gateway_id : String,
          @proxy_name : String,
          @tls_intercept_properties : Types::TlsInterceptPropertiesRequest,
          @listener_properties : Array(Types::ListenerPropertyRequest)? = nil,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProxyResponse
        include JSON::Serializable

        # Proxy attached to a NAT gateway.
        @[JSON::Field(key: "Proxy")]
        getter proxy : Types::Proxy?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy. The token marks the state of the proxy resource at the time of the request. To make
        # changes to the proxy, you provide the token in your request. Network Firewall uses the token to
        # ensure that the proxy hasn't changed since you last retrieved it. If it has changed, the operation
        # fails with an InvalidTokenException . If this happens, retrieve the proxy again to get a current
        # copy of it with a current token. Reapply your changes as needed, then try the operation again using
        # the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy : Types::Proxy? = nil,
          @update_token : String? = nil
        )
        end
      end

      # Individual rules that define match conditions and actions for application-layer traffic. Rules
      # specify what to inspect (domains, headers, methods) and what action to take (allow, deny, alert).
      struct CreateProxyRule
        include JSON::Serializable

        # Action to take.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Match criteria that specify what traffic attributes to examine. Conditions include operators
        # (StringEquals, StringLike) and values to match against.
        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::ProxyRuleCondition)?

        # A description of the proxy rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Where to insert a proxy rule in a proxy rule group.
        @[JSON::Field(key: "InsertPosition")]
        getter insert_position : Int32?

        # The descriptive name of the proxy rule. You can't change the name of a proxy rule after you create
        # it.
        @[JSON::Field(key: "ProxyRuleName")]
        getter proxy_rule_name : String?

        def initialize(
          @action : String? = nil,
          @conditions : Array(Types::ProxyRuleCondition)? = nil,
          @description : String? = nil,
          @insert_position : Int32? = nil,
          @proxy_rule_name : String? = nil
        )
        end
      end

      struct CreateProxyRuleGroupRequest
        include JSON::Serializable

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String

        # A description of the proxy rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Individual rules that define match conditions and actions for application-layer traffic. Rules
        # specify what to inspect (domains, headers, methods) and what action to take (allow, deny, alert).
        @[JSON::Field(key: "Rules")]
        getter rules : Types::ProxyRulesByRequestPhase?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @proxy_rule_group_name : String,
          @description : String? = nil,
          @rules : Types::ProxyRulesByRequestPhase? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProxyRuleGroupResponse
        include JSON::Serializable

        # The properties that define the proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroup")]
        getter proxy_rule_group : Types::ProxyRuleGroup?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule group. The token marks the state of the proxy rule group resource at the time of the
        # request. To make changes to the proxy rule group, you provide the token in your request. Network
        # Firewall uses the token to ensure that the proxy rule group hasn't changed since you last retrieved
        # it. If it has changed, the operation fails with an InvalidTokenException . If this happens, retrieve
        # the proxy rule group again to get a current copy of it with a current token. Reapply your changes as
        # needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule_group : Types::ProxyRuleGroup? = nil,
          @update_token : String? = nil
        )
        end
      end

      # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
      # where the rule match is applied. This data type is used specifically for the CreateProxyRules API.
      # Pre-DNS - before domain resolution. Pre-Request - after DNS, before request. Post-Response - after
      # receiving response.
      struct CreateProxyRulesByRequestPhase
        include JSON::Serializable

        # After receiving response.
        @[JSON::Field(key: "PostRESPONSE")]
        getter post_response : Array(Types::CreateProxyRule)?

        # Before domain resolution.
        @[JSON::Field(key: "PreDNS")]
        getter pre_dns : Array(Types::CreateProxyRule)?

        # After DNS, before request.
        @[JSON::Field(key: "PreREQUEST")]
        getter pre_request : Array(Types::CreateProxyRule)?

        def initialize(
          @post_response : Array(Types::CreateProxyRule)? = nil,
          @pre_dns : Array(Types::CreateProxyRule)? = nil,
          @pre_request : Array(Types::CreateProxyRule)? = nil
        )
        end
      end

      struct CreateProxyRulesRequest
        include JSON::Serializable

        # Individual rules that define match conditions and actions for application-layer traffic. Rules
        # specify what to inspect (domains, headers, methods) and what action to take (allow, deny, alert).
        @[JSON::Field(key: "Rules")]
        getter rules : Types::CreateProxyRulesByRequestPhase

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @rules : Types::CreateProxyRulesByRequestPhase,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct CreateProxyRulesResponse
        include JSON::Serializable

        # The properties that define the proxy rule group with the newly created proxy rule(s).
        @[JSON::Field(key: "ProxyRuleGroup")]
        getter proxy_rule_group : Types::ProxyRuleGroup?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule. The token marks the state of the proxy rule resource at the time of the request. To
        # make changes to the proxy rule, you provide the token in your request. Network Firewall uses the
        # token to ensure that the proxy rule hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the proxy rule again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule_group : Types::ProxyRuleGroup? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct CreateRuleGroupRequest
        include JSON::Serializable

        # The maximum operating resources that this rule group can use. Rule group capacity is fixed at
        # creation. When you update a rule group, you are limited to this capacity. When you reference a rule
        # group from a firewall policy, Network Firewall reserves this capacity for the rule group. You can
        # retrieve the capacity that would be required for a rule group before you create the rule group by
        # calling CreateRuleGroup with DryRun set to TRUE . You can't change or exceed this capacity when you
        # update the rule group, so leave room for your rule group to grow. Capacity for a stateless rule
        # group For a stateless rule group, the capacity required is the sum of the capacity requirements of
        # the individual rules that you expect to have in the rule group. To calculate the capacity
        # requirement of a single rule, multiply the capacity requirement values of each of the rule's match
        # settings: A match setting with no criteria specified has a value of 1. A match setting with Any
        # specified has a value of 1. All other match settings have a value equal to the number of elements
        # provided in the setting. For example, a protocol setting ["UDP"] and a source setting
        # ["10.0.0.0/24"] each have a value of 1. A protocol setting ["UDP","TCP"] has a value of 2. A source
        # setting ["10.0.0.0/24","10.0.0.1/24","10.0.0.2/24"] has a value of 3. A rule with no criteria
        # specified in any of its match settings has a capacity requirement of 1. A rule with protocol setting
        # ["UDP","TCP"], source setting ["10.0.0.0/24","10.0.0.1/24","10.0.0.2/24"], and a single
        # specification or no specification for each of the other match settings has a capacity requirement of
        # 6. Capacity for a stateful rule group For a stateful rule group, the minimum capacity required is
        # the number of individual rules that you expect to have in the rule group.
        @[JSON::Field(key: "Capacity")]
        getter capacity : Int32

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Indicates whether you want Network Firewall to analyze the stateless rules in the rule group for
        # rule behavior such as asymmetric routing. If set to TRUE , Network Firewall runs the analysis and
        # then creates the rule group for you. To run the stateless rule group analyzer without creating the
        # rule group, set DryRun to TRUE .
        @[JSON::Field(key: "AnalyzeRuleGroup")]
        getter analyze_rule_group : Bool?

        # A description of the rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether you want Network Firewall to just check the validity of the request, rather than
        # run the request. If set to TRUE , Network Firewall checks whether the request can run successfully,
        # but doesn't actually make the requested changes. The call returns the value that the request would
        # return if you ran it with dry run set to FALSE , but doesn't make additions or changes to your
        # resources. This option allows you to make sure that you have the required permissions to run the
        # request and that your request parameters are valid. If set to FALSE , Network Firewall makes the
        # requested changes to your resources.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # A complex type that contains settings for encryption of your rule group resources.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # An object that defines the rule group rules. You must provide either this rule group setting or a
        # Rules setting, but not both.
        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        # A string containing stateful rule group rules specifications in Suricata flat format, with one rule
        # per line. Use this to import your existing Suricata compatible rule groups. You must provide either
        # this rules setting or a populated RuleGroup setting, but not both. You can provide your rule group
        # specification in Suricata flat format through this setting when you create or update your rule
        # group. The call response returns a RuleGroup object that Network Firewall has populated from your
        # string.
        @[JSON::Field(key: "Rules")]
        getter rules : String?

        # A complex type that contains metadata about the rule group that your own rule group is copied from.
        # You can use the metadata to keep track of updates made to the originating rule group.
        @[JSON::Field(key: "SourceMetadata")]
        getter source_metadata : Types::SourceMetadata?

        # An object that contains a RuleOptions array of strings. You use RuleOptions to determine which of
        # the following RuleSummary values are returned in response to DescribeRuleGroupSummary . Metadata -
        # returns Msg SID
        @[JSON::Field(key: "SummaryConfiguration")]
        getter summary_configuration : Types::SummaryConfiguration?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @capacity : Int32,
          @rule_group_name : String,
          @type : String,
          @analyze_rule_group : Bool? = nil,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @rule_group : Types::RuleGroup? = nil,
          @rules : String? = nil,
          @source_metadata : Types::SourceMetadata? = nil,
          @summary_configuration : Types::SummaryConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRuleGroupResponse
        include JSON::Serializable

        # The high-level properties of a rule group. This, along with the RuleGroup , define the rule group.
        # You can retrieve all objects for a rule group by calling DescribeRuleGroup .
        @[JSON::Field(key: "RuleGroupResponse")]
        getter rule_group_response : Types::RuleGroupResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the rule group. The token marks the state of the rule group resource at the time of the request. To
        # make changes to the rule group, you provide the token in your request. Network Firewall uses the
        # token to ensure that the rule group hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the rule group again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @rule_group_response : Types::RuleGroupResponse,
          @update_token : String
        )
        end
      end

      struct CreateTLSInspectionConfigurationRequest
        include JSON::Serializable

        # The object that defines a TLS inspection configuration. This, along with
        # TLSInspectionConfigurationResponse , define the TLS inspection configuration. You can retrieve all
        # objects for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration . Network
        # Firewall uses a TLS inspection configuration to decrypt traffic. Network Firewall re-encrypts the
        # traffic before sending it to its destination. To use a TLS inspection configuration, you add it to a
        # new Network Firewall firewall policy, then you apply the firewall policy to a firewall. Network
        # Firewall acts as a proxy service to decrypt and inspect the traffic traveling through your
        # firewalls. You can reference a TLS inspection configuration from more than one firewall policy, and
        # you can use a firewall policy in more than one firewall. For more information about using TLS
        # inspection configurations, see Inspecting SSL/TLS traffic with TLS inspection configurations in the
        # Network Firewall Developer Guide .
        @[JSON::Field(key: "TLSInspectionConfiguration")]
        getter tls_inspection_configuration : Types::TLSInspectionConfiguration

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it.
        @[JSON::Field(key: "TLSInspectionConfigurationName")]
        getter tls_inspection_configuration_name : String

        # A description of the TLS inspection configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tls_inspection_configuration : Types::TLSInspectionConfiguration,
          @tls_inspection_configuration_name : String,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTLSInspectionConfigurationResponse
        include JSON::Serializable

        # The high-level properties of a TLS inspection configuration. This, along with the
        # TLSInspectionConfiguration , define the TLS inspection configuration. You can retrieve all objects
        # for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration .
        @[JSON::Field(key: "TLSInspectionConfigurationResponse")]
        getter tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the TLS inspection configuration. The token marks the state of the TLS inspection configuration
        # resource at the time of the request. To make changes to the TLS inspection configuration, you
        # provide the token in your request. Network Firewall uses the token to ensure that the TLS inspection
        # configuration hasn't changed since you last retrieved it. If it has changed, the operation fails
        # with an InvalidTokenException . If this happens, retrieve the TLS inspection configuration again to
        # get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse,
          @update_token : String
        )
        end
      end

      struct CreateVpcEndpointAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        @[JSON::Field(key: "SubnetMapping")]
        getter subnet_mapping : Types::SubnetMapping

        # The unique identifier of the VPC where you want to create a firewall endpoint.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # A description of the VPC endpoint association.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @firewall_arn : String,
          @subnet_mapping : Types::SubnetMapping,
          @vpc_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVpcEndpointAssociationResponse
        include JSON::Serializable

        # The configuration settings for the VPC endpoint association. These settings include the firewall and
        # the VPC and subnet to use for the firewall endpoint.
        @[JSON::Field(key: "VpcEndpointAssociation")]
        getter vpc_endpoint_association : Types::VpcEndpointAssociation?

        # Detailed information about the current status of a VpcEndpointAssociation . You can retrieve this by
        # calling DescribeVpcEndpointAssociation and providing the VPC endpoint association ARN.
        @[JSON::Field(key: "VpcEndpointAssociationStatus")]
        getter vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus?

        def initialize(
          @vpc_endpoint_association : Types::VpcEndpointAssociation? = nil,
          @vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus? = nil
        )
        end
      end

      # An optional, non-standard action to use for stateless packet handling. You can define this in
      # addition to the standard action that you must specify. You define and name the custom actions that
      # you want to be able to use, and then you reference them by name in your actions settings. You can
      # use custom actions in the following places: In a rule group's StatelessRulesAndCustomActions
      # specification. The custom actions are available for use by name inside the
      # StatelessRulesAndCustomActions where you define them. You can use them for your stateless rule
      # actions to specify what to do with a packet that matches the rule's match attributes. In a
      # FirewallPolicy specification, in StatelessCustomActions . The custom actions are available for use
      # inside the policy where you define them. You can use them for the policy's default stateless actions
      # settings to specify what to do with packets that don't match any of the policy's stateless rules.
      struct CustomAction
        include JSON::Serializable

        # The custom action associated with the action name.
        @[JSON::Field(key: "ActionDefinition")]
        getter action_definition : Types::ActionDefinition

        # The descriptive name of the custom action. You can't change the name of a custom action after you
        # create it.
        @[JSON::Field(key: "ActionName")]
        getter action_name : String

        def initialize(
          @action_definition : Types::ActionDefinition,
          @action_name : String
        )
        end
      end

      struct DeleteFirewallPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall policy. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String?

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String?

        def initialize(
          @firewall_policy_arn : String? = nil,
          @firewall_policy_name : String? = nil
        )
        end
      end

      struct DeleteFirewallPolicyResponse
        include JSON::Serializable

        # The object containing the definition of the FirewallPolicyResponse that you asked to delete.
        @[JSON::Field(key: "FirewallPolicyResponse")]
        getter firewall_policy_response : Types::FirewallPolicyResponse

        def initialize(
          @firewall_policy_response : Types::FirewallPolicyResponse
        )
        end
      end

      struct DeleteFirewallRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil
        )
        end
      end

      struct DeleteFirewallResponse
        include JSON::Serializable

        @[JSON::Field(key: "Firewall")]
        getter firewall : Types::Firewall?

        @[JSON::Field(key: "FirewallStatus")]
        getter firewall_status : Types::FirewallStatus?

        def initialize(
          @firewall : Types::Firewall? = nil,
          @firewall_status : Types::FirewallStatus? = nil
        )
        end
      end

      struct DeleteNetworkFirewallTransitGatewayAttachmentRequest
        include JSON::Serializable

        # Required. The unique identifier of the transit gateway attachment to delete.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        def initialize(
          @transit_gateway_attachment_id : String
        )
        end
      end

      struct DeleteNetworkFirewallTransitGatewayAttachmentResponse
        include JSON::Serializable

        # The ID of the transit gateway attachment that was deleted.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        # The current status of the transit gateway attachment deletion process. Valid values are: CREATING -
        # The attachment is being created DELETING - The attachment is being deleted DELETED - The attachment
        # has been deleted FAILED - The attachment creation has failed and cannot be recovered ERROR - The
        # attachment is in an error state that might be recoverable READY - The attachment is active and
        # processing traffic PENDING_ACCEPTANCE - The attachment is waiting to be accepted REJECTING - The
        # attachment is in the process of being rejected REJECTED - The attachment has been rejected
        @[JSON::Field(key: "TransitGatewayAttachmentStatus")]
        getter transit_gateway_attachment_status : String

        def initialize(
          @transit_gateway_attachment_id : String,
          @transit_gateway_attachment_status : String
        )
        end
      end

      struct DeleteProxyConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct DeleteProxyConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy configuration.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct DeleteProxyRequest
        include JSON::Serializable

        # The NAT Gateway the proxy is attached to.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String

        # The Amazon Resource Name (ARN) of a proxy. You must specify the ARN or the name, and you can specify
        # both.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it. You
        # must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        def initialize(
          @nat_gateway_id : String,
          @proxy_arn : String? = nil,
          @proxy_name : String? = nil
        )
        end
      end

      struct DeleteProxyResponse
        include JSON::Serializable

        # The NAT Gateway the Proxy was attached to.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String?

        # The Amazon Resource Name (ARN) of a proxy.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        def initialize(
          @nat_gateway_id : String? = nil,
          @proxy_arn : String? = nil,
          @proxy_name : String? = nil
        )
        end
      end

      struct DeleteProxyRuleGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct DeleteProxyRuleGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct DeleteProxyRulesRequest
        include JSON::Serializable

        # The proxy rule(s) to remove from the existing proxy rule group.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(String)

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @rules : Array(String),
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct DeleteProxyRulesResponse
        include JSON::Serializable

        # The properties that define the proxy rule group with the newly created proxy rule(s).
        @[JSON::Field(key: "ProxyRuleGroup")]
        getter proxy_rule_group : Types::ProxyRuleGroup?

        def initialize(
          @proxy_rule_group : Types::ProxyRuleGroup? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group or firewall policy whose resource policy you want
        # to delete.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRuleGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules. This setting is required
        # for requests that do not include the RuleGroupARN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @rule_group_arn : String? = nil,
          @rule_group_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DeleteRuleGroupResponse
        include JSON::Serializable

        # The high-level properties of a rule group. This, along with the RuleGroup , define the rule group.
        # You can retrieve all objects for a rule group by calling DescribeRuleGroup .
        @[JSON::Field(key: "RuleGroupResponse")]
        getter rule_group_response : Types::RuleGroupResponse

        def initialize(
          @rule_group_response : Types::RuleGroupResponse
        )
        end
      end

      struct DeleteTLSInspectionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the TLS inspection configuration. You must specify the ARN or the
        # name, and you can specify both.
        @[JSON::Field(key: "TLSInspectionConfigurationArn")]
        getter tls_inspection_configuration_arn : String?

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "TLSInspectionConfigurationName")]
        getter tls_inspection_configuration_name : String?

        def initialize(
          @tls_inspection_configuration_arn : String? = nil,
          @tls_inspection_configuration_name : String? = nil
        )
        end
      end

      struct DeleteTLSInspectionConfigurationResponse
        include JSON::Serializable

        # The high-level properties of a TLS inspection configuration. This, along with the
        # TLSInspectionConfiguration , define the TLS inspection configuration. You can retrieve all objects
        # for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration .
        @[JSON::Field(key: "TLSInspectionConfigurationResponse")]
        getter tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse

        def initialize(
          @tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse
        )
        end
      end

      struct DeleteVpcEndpointAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String

        def initialize(
          @vpc_endpoint_association_arn : String
        )
        end
      end

      struct DeleteVpcEndpointAssociationResponse
        include JSON::Serializable

        # The configuration settings for the VPC endpoint association. These settings include the firewall and
        # the VPC and subnet to use for the firewall endpoint.
        @[JSON::Field(key: "VpcEndpointAssociation")]
        getter vpc_endpoint_association : Types::VpcEndpointAssociation?

        # Detailed information about the current status of a VpcEndpointAssociation . You can retrieve this by
        # calling DescribeVpcEndpointAssociation and providing the VPC endpoint association ARN.
        @[JSON::Field(key: "VpcEndpointAssociationStatus")]
        getter vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus?

        def initialize(
          @vpc_endpoint_association : Types::VpcEndpointAssociation? = nil,
          @vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus? = nil
        )
        end
      end

      struct DescribeFirewallMetadataRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        def initialize(
          @firewall_arn : String? = nil
        )
        end
      end

      struct DescribeFirewallMetadataResponse
        include JSON::Serializable

        # A description of the firewall.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The Amazon Resource Name (ARN) of the firewall policy.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String?

        # The readiness of the configured firewall to handle network traffic across all of the Availability
        # Zones where you have it configured. This setting is READY only when the
        # ConfigurationSyncStateSummary value is IN_SYNC and the Attachment Status values for all of the
        # configured subnets are READY .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Availability Zones that the firewall currently supports. This includes all Availability Zones
        # for which the firewall has a subnet defined.
        @[JSON::Field(key: "SupportedAvailabilityZones")]
        getter supported_availability_zones : Hash(String, Types::AvailabilityZoneMetadata)?

        # The unique identifier of the transit gateway attachment associated with this firewall. This field is
        # only present for transit gateway-attached firewalls.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String?

        def initialize(
          @description : String? = nil,
          @firewall_arn : String? = nil,
          @firewall_policy_arn : String? = nil,
          @status : String? = nil,
          @supported_availability_zones : Hash(String, Types::AvailabilityZoneMetadata)? = nil,
          @transit_gateway_attachment_id : String? = nil
        )
        end
      end

      struct DescribeFirewallPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall policy. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String?

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String?

        def initialize(
          @firewall_policy_arn : String? = nil,
          @firewall_policy_name : String? = nil
        )
        end
      end

      struct DescribeFirewallPolicyResponse
        include JSON::Serializable

        # The high-level properties of a firewall policy. This, along with the FirewallPolicy , define the
        # policy. You can retrieve all objects for a firewall policy by calling DescribeFirewallPolicy .
        @[JSON::Field(key: "FirewallPolicyResponse")]
        getter firewall_policy_response : Types::FirewallPolicyResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the firewall policy. The token marks the state of the policy resource at the time of the request. To
        # make changes to the policy, you provide the token in your request. Network Firewall uses the token
        # to ensure that the policy hasn't changed since you last retrieved it. If it has changed, the
        # operation fails with an InvalidTokenException . If this happens, retrieve the firewall policy again
        # to get a current copy of it with current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The policy for the specified firewall policy.
        @[JSON::Field(key: "FirewallPolicy")]
        getter firewall_policy : Types::FirewallPolicy?

        def initialize(
          @firewall_policy_response : Types::FirewallPolicyResponse,
          @update_token : String,
          @firewall_policy : Types::FirewallPolicy? = nil
        )
        end
      end

      struct DescribeFirewallRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil
        )
        end
      end

      struct DescribeFirewallResponse
        include JSON::Serializable

        # The configuration settings for the firewall. These settings include the firewall policy and the
        # subnets in your VPC to use for the firewall endpoints.
        @[JSON::Field(key: "Firewall")]
        getter firewall : Types::Firewall?

        # Detailed information about the current status of a Firewall . You can retrieve this for a firewall
        # by calling DescribeFirewall and providing the firewall name and ARN. The firewall status indicates a
        # combined status. It indicates whether all subnets are up-to-date with the latest firewall
        # configurations, which is based on the sync states config values, and also whether all subnets have
        # their endpoints fully enabled, based on their sync states attachment values.
        @[JSON::Field(key: "FirewallStatus")]
        getter firewall_status : Types::FirewallStatus?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall : Types::Firewall? = nil,
          @firewall_status : Types::FirewallStatus? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DescribeFlowOperationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @firewall_arn : String,
          @flow_operation_id : String,
          @availability_zone : String? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct DescribeFlowOperationResponse
        include JSON::Serializable

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # Returns key information about a flow operation, such as related statuses, unique identifiers, and
        # all filters defined in the operation.
        @[JSON::Field(key: "FlowOperation")]
        getter flow_operation : Types::FlowOperation?

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String?

        # Returns the status of the flow operation. This string is returned in the responses to start, list,
        # and describe commands. If the status is COMPLETED_WITH_ERRORS , results may be returned with any
        # number of Flows missing from the response. If the status is FAILED , Flows returned will be empty.
        @[JSON::Field(key: "FlowOperationStatus")]
        getter flow_operation_status : String?

        # Defines the type of FlowOperation .
        @[JSON::Field(key: "FlowOperationType")]
        getter flow_operation_type : String?

        # A timestamp indicating when the Suricata engine identified flows impacted by an operation.
        @[JSON::Field(key: "FlowRequestTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter flow_request_timestamp : Time?

        # If the asynchronous operation fails, Network Firewall populates this with the reason for the error
        # or failure. Options include Flow operation error and Flow timeout .
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @firewall_arn : String? = nil,
          @flow_operation : Types::FlowOperation? = nil,
          @flow_operation_id : String? = nil,
          @flow_operation_status : String? = nil,
          @flow_operation_type : String? = nil,
          @flow_request_timestamp : Time? = nil,
          @status_message : String? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct DescribeLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil
        )
        end
      end

      struct DescribeLoggingConfigurationResponse
        include JSON::Serializable

        # A boolean that reflects whether or not the firewall monitoring dashboard is enabled on a firewall.
        # Returns TRUE when the firewall monitoring dashboard is enabled on the firewall. Returns FALSE when
        # the firewall monitoring dashboard is not enabled on the firewall.
        @[JSON::Field(key: "EnableMonitoringDashboard")]
        getter enable_monitoring_dashboard : Bool?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @enable_monitoring_dashboard : Bool? = nil,
          @firewall_arn : String? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end

      struct DescribeProxyConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct DescribeProxyConfigurationResponse
        include JSON::Serializable

        # The configuration for the specified proxy configuration.
        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DescribeProxyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy. You must specify the ARN or the name, and you can specify
        # both.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it. You
        # must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        def initialize(
          @proxy_arn : String? = nil,
          @proxy_name : String? = nil
        )
        end
      end

      # Proxy attached to a NAT gateway.
      struct DescribeProxyResource
        include JSON::Serializable

        # Time the Proxy was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # Time the Proxy was deleted.
        @[JSON::Field(key: "DeleteTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_time : Time?

        # Failure code for cases when the Proxy fails to attach or update.
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # Failure message for cases when the Proxy fails to attach or update.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # Listener properties for HTTP and HTTPS traffic.
        @[JSON::Field(key: "ListenerProperties")]
        getter listener_properties : Array(Types::ListenerProperty)?

        # The NAT Gateway for the proxy.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String?

        # The private DNS name of the Proxy.
        @[JSON::Field(key: "PrivateDNSName")]
        getter private_dns_name : String?

        # The Amazon Resource Name (ARN) of a proxy.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The Amazon Resource Name (ARN) of a proxy configuration.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        # Current modification status of the Proxy.
        @[JSON::Field(key: "ProxyModifyState")]
        getter proxy_modify_state : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        # Current attachment/detachment status of the Proxy.
        @[JSON::Field(key: "ProxyState")]
        getter proxy_state : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # TLS decryption on traffic to filter on attributes in the HTTP header.
        @[JSON::Field(key: "TlsInterceptProperties")]
        getter tls_intercept_properties : Types::TlsInterceptProperties?

        # Time the Proxy was updated.
        @[JSON::Field(key: "UpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_time : Time?

        # The service endpoint created in the VPC.
        @[JSON::Field(key: "VpcEndpointServiceName")]
        getter vpc_endpoint_service_name : String?

        def initialize(
          @create_time : Time? = nil,
          @delete_time : Time? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @listener_properties : Array(Types::ListenerProperty)? = nil,
          @nat_gateway_id : String? = nil,
          @private_dns_name : String? = nil,
          @proxy_arn : String? = nil,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil,
          @proxy_modify_state : String? = nil,
          @proxy_name : String? = nil,
          @proxy_state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tls_intercept_properties : Types::TlsInterceptProperties? = nil,
          @update_time : Time? = nil,
          @vpc_endpoint_service_name : String? = nil
        )
        end
      end

      struct DescribeProxyResponse
        include JSON::Serializable

        # Proxy attached to a NAT gateway.
        @[JSON::Field(key: "Proxy")]
        getter proxy : Types::DescribeProxyResource?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy. The token marks the state of the proxy resource at the time of the request. To make
        # changes to the proxy, you provide the token in your request. Network Firewall uses the token to
        # ensure that the proxy hasn't changed since you last retrieved it. If it has changed, the operation
        # fails with an InvalidTokenException . If this happens, retrieve the proxy again to get a current
        # copy of it with a current token. Reapply your changes as needed, then try the operation again using
        # the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy : Types::DescribeProxyResource? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DescribeProxyRuleGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct DescribeProxyRuleGroupResponse
        include JSON::Serializable

        # The configuration for the specified proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroup")]
        getter proxy_rule_group : Types::ProxyRuleGroup?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule group. The token marks the state of the proxy rule group resource at the time of the
        # request. To make changes to the proxy rule group, you provide the token in your request. Network
        # Firewall uses the token to ensure that the proxy rule group hasn't changed since you last retrieved
        # it. If it has changed, the operation fails with an InvalidTokenException . If this happens, retrieve
        # the proxy rule group again to get a current copy of it with a current token. Reapply your changes as
        # needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule_group : Types::ProxyRuleGroup? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DescribeProxyRuleRequest
        include JSON::Serializable

        # The descriptive name of the proxy rule. You can't change the name of a proxy rule after you create
        # it.
        @[JSON::Field(key: "ProxyRuleName")]
        getter proxy_rule_name : String

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @proxy_rule_name : String,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct DescribeProxyRuleResponse
        include JSON::Serializable

        # The configuration for the specified proxy rule.
        @[JSON::Field(key: "ProxyRule")]
        getter proxy_rule : Types::ProxyRule?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule. The token marks the state of the proxy rule resource at the time of the request. To
        # make changes to the proxy rule, you provide the token in your request. Network Firewall uses the
        # token to ensure that the proxy rule hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the proxy rule again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule : Types::ProxyRule? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DescribeResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group or firewall policy whose resource policy you want
        # to retrieve.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # The IAM policy for the resource.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      struct DescribeRuleGroupMetadataRequest
        include JSON::Serializable

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules. This setting is required
        # for requests that do not include the RuleGroupARN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @rule_group_arn : String? = nil,
          @rule_group_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeRuleGroupMetadataResponse
        include JSON::Serializable

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String

        # The maximum operating resources that this rule group can use. Rule group capacity is fixed at
        # creation. When you update a rule group, you are limited to this capacity. When you reference a rule
        # group from a firewall policy, Network Firewall reserves this capacity for the rule group. You can
        # retrieve the capacity that would be required for a rule group before you create the rule group by
        # calling CreateRuleGroup with DryRun set to TRUE .
        @[JSON::Field(key: "Capacity")]
        getter capacity : Int32?

        # Returns the metadata objects for the specified rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A timestamp indicating when the rule group was last modified.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The display name of the product listing for this rule group.
        @[JSON::Field(key: "ListingName")]
        getter listing_name : String?

        # The unique identifier for the product listing associated with this rule group.
        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        @[JSON::Field(key: "StatefulRuleOptions")]
        getter stateful_rule_options : Types::StatefulRuleOptions?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules. This setting is required
        # for requests that do not include the RuleGroupARN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The name of the Amazon Web Services Marketplace vendor that provides this rule group.
        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        def initialize(
          @rule_group_arn : String,
          @rule_group_name : String,
          @capacity : Int32? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @listing_name : String? = nil,
          @product_id : String? = nil,
          @stateful_rule_options : Types::StatefulRuleOptions? = nil,
          @type : String? = nil,
          @vendor_name : String? = nil
        )
        end
      end

      struct DescribeRuleGroupRequest
        include JSON::Serializable

        # Indicates whether you want Network Firewall to analyze the stateless rules in the rule group for
        # rule behavior such as asymmetric routing. If set to TRUE , Network Firewall runs the analysis.
        @[JSON::Field(key: "AnalyzeRuleGroup")]
        getter analyze_rule_group : Bool?

        # The Amazon Resource Name (ARN) of the rule group. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules. This setting is required
        # for requests that do not include the RuleGroupARN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @analyze_rule_group : Bool? = nil,
          @rule_group_arn : String? = nil,
          @rule_group_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeRuleGroupResponse
        include JSON::Serializable

        # The high-level properties of a rule group. This, along with the RuleGroup , define the rule group.
        # You can retrieve all objects for a rule group by calling DescribeRuleGroup .
        @[JSON::Field(key: "RuleGroupResponse")]
        getter rule_group_response : Types::RuleGroupResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the rule group. The token marks the state of the rule group resource at the time of the request. To
        # make changes to the rule group, you provide the token in your request. Network Firewall uses the
        # token to ensure that the rule group hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the rule group again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The object that defines the rules in a rule group. This, along with RuleGroupResponse , define the
        # rule group. You can retrieve all objects for a rule group by calling DescribeRuleGroup . Network
        # Firewall uses a rule group to inspect and control network traffic. You define stateless rule groups
        # to inspect individual packets and you define stateful rule groups to inspect packets in the context
        # of their traffic flow. To use a rule group, you include it by reference in an Network Firewall
        # firewall policy, then you use the policy in a firewall. You can reference a rule group from more
        # than one firewall policy, and you can use a firewall policy in more than one firewall.
        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        def initialize(
          @rule_group_response : Types::RuleGroupResponse,
          @update_token : String,
          @rule_group : Types::RuleGroup? = nil
        )
        end
      end

      struct DescribeRuleGroupSummaryRequest
        include JSON::Serializable

        # Required. The Amazon Resource Name (ARN) of the rule group. You must specify the ARN or the name,
        # and you can specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        # The type of rule group you want a summary for. This is a required field. Valid value: STATEFUL Note
        # that STATELESS exists but is not currently supported. If you provide STATELESS , an exception is
        # returned.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @rule_group_arn : String? = nil,
          @rule_group_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeRuleGroupSummaryResponse
        include JSON::Serializable

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String

        # A description of the rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains rule information based on the rule group's configured summary settings.
        # The content varies depending on the fields that you specified to extract in your
        # SummaryConfiguration. When you haven't configured any summary settings, this returns an empty array.
        # The response might include: Rule identifiers Rule descriptions Any metadata fields that you
        # specified in your SummaryConfiguration
        @[JSON::Field(key: "Summary")]
        getter summary : Types::Summary?

        def initialize(
          @rule_group_name : String,
          @description : String? = nil,
          @summary : Types::Summary? = nil
        )
        end
      end

      struct DescribeTLSInspectionConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the TLS inspection configuration. You must specify the ARN or the
        # name, and you can specify both.
        @[JSON::Field(key: "TLSInspectionConfigurationArn")]
        getter tls_inspection_configuration_arn : String?

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "TLSInspectionConfigurationName")]
        getter tls_inspection_configuration_name : String?

        def initialize(
          @tls_inspection_configuration_arn : String? = nil,
          @tls_inspection_configuration_name : String? = nil
        )
        end
      end

      struct DescribeTLSInspectionConfigurationResponse
        include JSON::Serializable

        # The high-level properties of a TLS inspection configuration. This, along with the
        # TLSInspectionConfiguration , define the TLS inspection configuration. You can retrieve all objects
        # for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration .
        @[JSON::Field(key: "TLSInspectionConfigurationResponse")]
        getter tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the TLS inspection configuration. The token marks the state of the TLS inspection configuration
        # resource at the time of the request. To make changes to the TLS inspection configuration, you
        # provide the token in your request. Network Firewall uses the token to ensure that the TLS inspection
        # configuration hasn't changed since you last retrieved it. If it has changed, the operation fails
        # with an InvalidTokenException . If this happens, retrieve the TLS inspection configuration again to
        # get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The object that defines a TLS inspection configuration. This, along with
        # TLSInspectionConfigurationResponse , define the TLS inspection configuration. You can retrieve all
        # objects for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration . Network
        # Firewall uses a TLS inspection configuration to decrypt traffic. Network Firewall re-encrypts the
        # traffic before sending it to its destination. To use a TLS inspection configuration, you add it to a
        # new Network Firewall firewall policy, then you apply the firewall policy to a firewall. Network
        # Firewall acts as a proxy service to decrypt and inspect the traffic traveling through your
        # firewalls. You can reference a TLS inspection configuration from more than one firewall policy, and
        # you can use a firewall policy in more than one firewall. For more information about using TLS
        # inspection configurations, see Inspecting SSL/TLS traffic with TLS inspection configurations in the
        # Network Firewall Developer Guide .
        @[JSON::Field(key: "TLSInspectionConfiguration")]
        getter tls_inspection_configuration : Types::TLSInspectionConfiguration?

        def initialize(
          @tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse,
          @update_token : String,
          @tls_inspection_configuration : Types::TLSInspectionConfiguration? = nil
        )
        end
      end

      struct DescribeVpcEndpointAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String

        def initialize(
          @vpc_endpoint_association_arn : String
        )
        end
      end

      struct DescribeVpcEndpointAssociationResponse
        include JSON::Serializable

        # The configuration settings for the VPC endpoint association. These settings include the firewall and
        # the VPC and subnet to use for the firewall endpoint.
        @[JSON::Field(key: "VpcEndpointAssociation")]
        getter vpc_endpoint_association : Types::VpcEndpointAssociation?

        # Detailed information about the current status of a VpcEndpointAssociation . You can retrieve this by
        # calling DescribeVpcEndpointAssociation and providing the VPC endpoint association ARN.
        @[JSON::Field(key: "VpcEndpointAssociationStatus")]
        getter vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus?

        def initialize(
          @vpc_endpoint_association : Types::VpcEndpointAssociation? = nil,
          @vpc_endpoint_association_status : Types::VpcEndpointAssociationStatus? = nil
        )
        end
      end

      struct DetachRuleGroupsFromProxyConfigurationRequest
        include JSON::Serializable

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        # The proxy rule group arns to detach from the proxy configuration
        @[JSON::Field(key: "RuleGroupArns")]
        getter rule_group_arns : Array(String)?

        # The proxy rule group names to detach from the proxy configuration
        @[JSON::Field(key: "RuleGroupNames")]
        getter rule_group_names : Array(String)?

        def initialize(
          @update_token : String,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil,
          @rule_group_arns : Array(String)? = nil,
          @rule_group_names : Array(String)? = nil
        )
        end
      end

      struct DetachRuleGroupsFromProxyConfigurationResponse
        include JSON::Serializable

        # The updated proxy configuration resource that reflects the updates from the request.
        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @update_token : String? = nil
        )
        end
      end

      # The value to use in an Amazon CloudWatch custom metric dimension. This is used in the PublishMetrics
      # CustomAction . A CloudWatch custom metric dimension is a name/value pair that's part of the identity
      # of a metric. Network Firewall sets the dimension name to CustomAction and you provide the dimension
      # value. For more information about CloudWatch custom metric dimensions, see Publishing Custom Metrics
      # in the Amazon CloudWatch User Guide .
      struct Dimension
        include JSON::Serializable

        # The value to use in the custom metric dimension.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      struct DisassociateAvailabilityZonesRequest
        include JSON::Serializable

        # Required. The Availability Zones to remove from the firewall's configuration.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping),
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DisassociateAvailabilityZonesResponse
        include JSON::Serializable

        # The remaining Availability Zones where the firewall has endpoints after the disassociation.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping)? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DisassociateSubnetsRequest
        include JSON::Serializable

        # The unique identifiers for the subnets that you want to disassociate.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @subnet_ids : Array(String),
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct DisassociateSubnetsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The IDs of the subnets that are associated with the firewall.
        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @subnet_mappings : Array(Types::SubnetMapping)? = nil,
          @update_token : String? = nil
        )
        end
      end

      # A complex type that contains optional Amazon Web Services Key Management Service (KMS) encryption
      # settings for your Network Firewall resources. Your data is encrypted by default with an Amazon Web
      # Services owned key that Amazon Web Services owns and manages for you. You can use either the Amazon
      # Web Services owned key, or provide your own customer managed key. To learn more about KMS encryption
      # of your Network Firewall resources, see Encryption at rest with Amazon Web Services Key Managment
      # Service in the Network Firewall Developer Guide .
      struct EncryptionConfiguration
        include JSON::Serializable

        # The type of Amazon Web Services KMS key to use for encryption of your Network Firewall resources.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The ID of the Amazon Web Services Key Management Service (KMS) customer managed key. You can use any
        # of the key identifiers that KMS supports, unless you're using a key that's managed by another
        # account. If you're using a key managed by another account, then specify the key ARN. For more
        # information, see Key ID in the Amazon Web Services KMS Developer Guide .
        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        def initialize(
          @type : String,
          @key_id : String? = nil
        )
        end
      end

      # A firewall defines the behavior of a firewall, the main VPC where the firewall is used, the
      # Availability Zones where the firewall can be used, and one subnet to use for a firewall endpoint
      # within each of the Availability Zones. The Availability Zones are defined implicitly in the subnet
      # specifications. In addition to the firewall endpoints that you define in this Firewall
      # specification, you can create firewall endpoints in VpcEndpointAssociation resources for any VPC, in
      # any Availability Zone where the firewall is already in use. The status of the firewall, for example
      # whether it's ready to filter network traffic, is provided in the corresponding FirewallStatus . You
      # can retrieve both the firewall and firewall status by calling DescribeFirewall .
      struct Firewall
        include JSON::Serializable

        # The unique identifier for the firewall.
        @[JSON::Field(key: "FirewallId")]
        getter firewall_id : String

        # The Amazon Resource Name (ARN) of the firewall policy. The relationship of firewall to firewall
        # policy is many to one. Each firewall requires one firewall policy association, and you can use the
        # same firewall policy for multiple firewalls.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String

        # The primary public subnets that Network Firewall is using for the firewall. Network Firewall creates
        # a firewall endpoint in each subnet. Create a subnet mapping for each Availability Zone where you
        # want to use the firewall. These subnets are all defined for a single, primary VPC, and each must
        # belong to a different Availability Zone. Each of these subnets establishes the availability of the
        # firewall in its Availability Zone. In addition to these subnets, you can define other endpoints for
        # the firewall in VpcEndpointAssociation resources. You can define these additional endpoints for any
        # VPC, and for any of the Availability Zones where the firewall resource already has a subnet mapping.
        # VPC endpoint associations give you the ability to protect multiple VPCs using a single firewall, and
        # to define multiple firewall endpoints for a VPC in a single Availability Zone.
        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)

        # The unique identifier of the VPC where the firewall is in use.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # A setting indicating whether the firewall is protected against changes to its Availability Zone
        # configuration. When set to TRUE , you must first disable this protection before adding or removing
        # Availability Zones.
        @[JSON::Field(key: "AvailabilityZoneChangeProtection")]
        getter availability_zone_change_protection : Bool?

        # The Availability Zones where the firewall endpoints are created for a transit gateway-attached
        # firewall. Each mapping specifies an Availability Zone where the firewall processes traffic.
        @[JSON::Field(key: "AvailabilityZoneMappings")]
        getter availability_zone_mappings : Array(Types::AvailabilityZoneMapping)?

        # A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that
        # the firewall is protected against deletion. Use this setting to protect against accidentally
        # deleting a firewall that is in use. When you create a firewall, the operation initializes this flag
        # to TRUE .
        @[JSON::Field(key: "DeleteProtection")]
        getter delete_protection : Bool?

        # A description of the firewall.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional setting indicating the specific traffic analysis types to enable on the firewall.
        @[JSON::Field(key: "EnabledAnalysisTypes")]
        getter enabled_analysis_types : Array(String)?

        # A complex type that contains the Amazon Web Services KMS encryption configuration settings for your
        # firewall.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # A setting indicating whether the firewall is protected against a change to the firewall policy
        # association. Use this setting to protect against accidentally modifying the firewall policy for a
        # firewall that is in use. When you create a firewall, the operation initializes this setting to TRUE
        # .
        @[JSON::Field(key: "FirewallPolicyChangeProtection")]
        getter firewall_policy_change_protection : Bool?

        # The number of VpcEndpointAssociation resources that use this firewall.
        @[JSON::Field(key: "NumberOfAssociations")]
        getter number_of_associations : Int32?

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "SubnetChangeProtection")]
        getter subnet_change_protection : Bool?

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The unique identifier of the transit gateway associated with this firewall. This field is only
        # present for transit gateway-attached firewalls.
        @[JSON::Field(key: "TransitGatewayId")]
        getter transit_gateway_id : String?

        # The Amazon Web Services account ID that owns the transit gateway. This may be different from the
        # firewall owner's account ID when using a shared transit gateway.
        @[JSON::Field(key: "TransitGatewayOwnerAccountId")]
        getter transit_gateway_owner_account_id : String?

        def initialize(
          @firewall_id : String,
          @firewall_policy_arn : String,
          @subnet_mappings : Array(Types::SubnetMapping),
          @vpc_id : String,
          @availability_zone_change_protection : Bool? = nil,
          @availability_zone_mappings : Array(Types::AvailabilityZoneMapping)? = nil,
          @delete_protection : Bool? = nil,
          @description : String? = nil,
          @enabled_analysis_types : Array(String)? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @firewall_policy_change_protection : Bool? = nil,
          @number_of_associations : Int32? = nil,
          @subnet_change_protection : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transit_gateway_id : String? = nil,
          @transit_gateway_owner_account_id : String? = nil
        )
        end
      end

      # High-level information about a firewall, returned by operations like create and describe. You can
      # use the information provided in the metadata to retrieve and manage a firewall.
      struct FirewallMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The unique identifier of the transit gateway attachment associated with this firewall. This field is
        # only present for transit gateway-attached firewalls.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @transit_gateway_attachment_id : String? = nil
        )
        end
      end

      # The firewall policy defines the behavior of a firewall using a collection of stateless and stateful
      # rule groups and other settings. You can use one firewall policy for multiple firewalls. This, along
      # with FirewallPolicyResponse , define the policy. You can retrieve all objects for a firewall policy
      # by calling DescribeFirewallPolicy .
      struct FirewallPolicy
        include JSON::Serializable

        # The actions to take on a packet if it doesn't match any of the stateless rules in the policy. If you
        # want non-matching packets to be forwarded for stateful inspection, specify aws:forward_to_sfe . You
        # must specify one of the standard actions: aws:pass , aws:drop , or aws:forward_to_sfe . In addition,
        # you can specify custom actions that are compatible with your standard section choice. For example,
        # you could specify ["aws:pass"] or you could specify ["aws:pass", “customActionName”] . For
        # information about compatibility, see the custom action descriptions under CustomAction .
        @[JSON::Field(key: "StatelessDefaultActions")]
        getter stateless_default_actions : Array(String)

        # The actions to take on a fragmented UDP packet if it doesn't match any of the stateless rules in the
        # policy. Network Firewall only manages UDP packet fragments and silently drops packet fragments for
        # other protocols. If you want non-matching fragmented UDP packets to be forwarded for stateful
        # inspection, specify aws:forward_to_sfe . You must specify one of the standard actions: aws:pass ,
        # aws:drop , or aws:forward_to_sfe . In addition, you can specify custom actions that are compatible
        # with your standard section choice. For example, you could specify ["aws:pass"] or you could specify
        # ["aws:pass", “customActionName”] . For information about compatibility, see the custom action
        # descriptions under CustomAction .
        @[JSON::Field(key: "StatelessFragmentDefaultActions")]
        getter stateless_fragment_default_actions : Array(String)

        # When true, prevents TCP and TLS packets from reaching destination servers until TLS Inspection has
        # evaluated Server Name Indication (SNI) rules. Requires an associated TLS Inspection configuration.
        @[JSON::Field(key: "EnableTLSSessionHolding")]
        getter enable_tls_session_holding : Bool?

        # Contains variables that you can use to override default Suricata settings in your firewall policy.
        @[JSON::Field(key: "PolicyVariables")]
        getter policy_variables : Types::PolicyVariables?

        # The default actions to take on a packet that doesn't match any stateful rules. The stateful default
        # action is optional, and is only valid when using the strict rule order. Valid values of the stateful
        # default action: aws:drop_strict aws:drop_established aws:alert_strict aws:alert_established For more
        # information, see Strict evaluation order in the Network Firewall Developer Guide .
        @[JSON::Field(key: "StatefulDefaultActions")]
        getter stateful_default_actions : Array(String)?

        # Additional options governing how Network Firewall handles stateful rules. The stateful rule groups
        # that you use in your policy must have stateful rule options settings that are compatible with these
        # settings.
        @[JSON::Field(key: "StatefulEngineOptions")]
        getter stateful_engine_options : Types::StatefulEngineOptions?

        # References to the stateful rule groups that are used in the policy. These define the inspection
        # criteria in stateful rules.
        @[JSON::Field(key: "StatefulRuleGroupReferences")]
        getter stateful_rule_group_references : Array(Types::StatefulRuleGroupReference)?

        # The custom action definitions that are available for use in the firewall policy's
        # StatelessDefaultActions setting. You name each custom action that you define, and then you can use
        # it by name in your default actions specifications.
        @[JSON::Field(key: "StatelessCustomActions")]
        getter stateless_custom_actions : Array(Types::CustomAction)?

        # References to the stateless rule groups that are used in the policy. These define the matching
        # criteria in stateless rules.
        @[JSON::Field(key: "StatelessRuleGroupReferences")]
        getter stateless_rule_group_references : Array(Types::StatelessRuleGroupReference)?

        # The Amazon Resource Name (ARN) of the TLS inspection configuration.
        @[JSON::Field(key: "TLSInspectionConfigurationArn")]
        getter tls_inspection_configuration_arn : String?

        def initialize(
          @stateless_default_actions : Array(String),
          @stateless_fragment_default_actions : Array(String),
          @enable_tls_session_holding : Bool? = nil,
          @policy_variables : Types::PolicyVariables? = nil,
          @stateful_default_actions : Array(String)? = nil,
          @stateful_engine_options : Types::StatefulEngineOptions? = nil,
          @stateful_rule_group_references : Array(Types::StatefulRuleGroupReference)? = nil,
          @stateless_custom_actions : Array(Types::CustomAction)? = nil,
          @stateless_rule_group_references : Array(Types::StatelessRuleGroupReference)? = nil,
          @tls_inspection_configuration_arn : String? = nil
        )
        end
      end

      # High-level information about a firewall policy, returned by operations like create and describe. You
      # can use the information provided in the metadata to retrieve and manage a firewall policy. You can
      # retrieve all objects for a firewall policy by calling DescribeFirewallPolicy .
      struct FirewallPolicyMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall policy.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The high-level properties of a firewall policy. This, along with the FirewallPolicy , define the
      # policy. You can retrieve all objects for a firewall policy by calling DescribeFirewallPolicy .
      struct FirewallPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall policy. If this response is for a create request that
        # had DryRun set to TRUE , then this ARN is a placeholder that isn't attached to a valid resource.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String

        # The unique identifier for the firewall policy.
        @[JSON::Field(key: "FirewallPolicyId")]
        getter firewall_policy_id : String

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String

        # The number of capacity units currently consumed by the policy's stateful rules.
        @[JSON::Field(key: "ConsumedStatefulRuleCapacity")]
        getter consumed_stateful_rule_capacity : Int32?

        # The number of capacity units currently consumed by the policy's stateless rules.
        @[JSON::Field(key: "ConsumedStatelessRuleCapacity")]
        getter consumed_stateless_rule_capacity : Int32?

        # A description of the firewall policy.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains the Amazon Web Services KMS encryption configuration settings for your
        # firewall policy.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The current status of the firewall policy. You can retrieve this for a firewall policy by calling
        # DescribeFirewallPolicy and providing the firewall policy's name or ARN.
        @[JSON::Field(key: "FirewallPolicyStatus")]
        getter firewall_policy_status : String?

        # The last time that the firewall policy was changed.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The number of firewalls that are associated with this firewall policy.
        @[JSON::Field(key: "NumberOfAssociations")]
        getter number_of_associations : Int32?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @firewall_policy_arn : String,
          @firewall_policy_id : String,
          @firewall_policy_name : String,
          @consumed_stateful_rule_capacity : Int32? = nil,
          @consumed_stateless_rule_capacity : Int32? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_policy_status : String? = nil,
          @last_modified_time : Time? = nil,
          @number_of_associations : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Detailed information about the current status of a Firewall . You can retrieve this for a firewall
      # by calling DescribeFirewall and providing the firewall name and ARN. The firewall status indicates a
      # combined status. It indicates whether all subnets are up-to-date with the latest firewall
      # configurations, which is based on the sync states config values, and also whether all subnets have
      # their endpoints fully enabled, based on their sync states attachment values.
      struct FirewallStatus
        include JSON::Serializable

        # The configuration sync state for the firewall. This summarizes the Config settings in the SyncStates
        # for this firewall status object. When you create a firewall or update its configuration, for example
        # by adding a rule group to its firewall policy, Network Firewall distributes the configuration
        # changes to all Availability Zones that have subnets defined for the firewall. This summary indicates
        # whether the configuration changes have been applied everywhere. This status must be IN_SYNC for the
        # firewall to be ready for use, but it doesn't indicate that the firewall is ready. The Status setting
        # indicates firewall readiness. It's based on this setting and the readiness of the firewall endpoints
        # to take traffic.
        @[JSON::Field(key: "ConfigurationSyncStateSummary")]
        getter configuration_sync_state_summary : String

        # The readiness of the configured firewall to handle network traffic across all of the Availability
        # Zones where you have it configured. This setting is READY only when the
        # ConfigurationSyncStateSummary value is IN_SYNC and the Attachment Status values for all of the
        # configured subnets are READY .
        @[JSON::Field(key: "Status")]
        getter status : String

        # Describes the capacity usage of the resources contained in a firewall's reference sets. Network
        # Firewall calculates the capacity usage by taking an aggregated count of all of the resources used by
        # all of the reference sets in a firewall.
        @[JSON::Field(key: "CapacityUsageSummary")]
        getter capacity_usage_summary : Types::CapacityUsageSummary?

        # Status for the subnets that you've configured in the firewall. This contains one array element per
        # Availability Zone where you've configured a subnet in the firewall. These objects provide detailed
        # information for the settings ConfigurationSyncStateSummary and Status .
        @[JSON::Field(key: "SyncStates")]
        getter sync_states : Hash(String, Types::SyncState)?

        # The synchronization state of the transit gateway attachment. This indicates whether the firewall's
        # transit gateway configuration is properly synchronized and operational. Use this to verify that your
        # transit gateway configuration changes have been applied.
        @[JSON::Field(key: "TransitGatewayAttachmentSyncState")]
        getter transit_gateway_attachment_sync_state : Types::TransitGatewayAttachmentSyncState?

        def initialize(
          @configuration_sync_state_summary : String,
          @status : String,
          @capacity_usage_summary : Types::CapacityUsageSummary? = nil,
          @sync_states : Hash(String, Types::SyncState)? = nil,
          @transit_gateway_attachment_sync_state : Types::TransitGatewayAttachmentSyncState? = nil
        )
        end
      end

      # Any number of arrays, where each array is a single flow identified in the scope of the operation. If
      # multiple flows were in the scope of the operation, multiple Flows arrays are returned.
      struct Flow
        include JSON::Serializable

        # Returned as info about age of the flows identified by the flow operation.
        @[JSON::Field(key: "Age")]
        getter age : Int32?

        # Returns the number of bytes received or transmitted in a specific flow.
        @[JSON::Field(key: "ByteCount")]
        getter byte_count : Int64?

        @[JSON::Field(key: "DestinationAddress")]
        getter destination_address : Types::Address?

        # The destination port to inspect for. You can specify an individual port, for example 1994 and you
        # can specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "DestinationPort")]
        getter destination_port : String?

        # Returns the total number of data packets received or transmitted in a flow.
        @[JSON::Field(key: "PacketCount")]
        getter packet_count : Int32?

        # The protocols to inspect for, specified using the assigned internet protocol number (IANA) for each
        # protocol. If not specified, this matches with any protocol.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        @[JSON::Field(key: "SourceAddress")]
        getter source_address : Types::Address?

        # The source port to inspect for. You can specify an individual port, for example 1994 and you can
        # specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "SourcePort")]
        getter source_port : String?

        def initialize(
          @age : Int32? = nil,
          @byte_count : Int64? = nil,
          @destination_address : Types::Address? = nil,
          @destination_port : String? = nil,
          @packet_count : Int32? = nil,
          @protocol : String? = nil,
          @source_address : Types::Address? = nil,
          @source_port : String? = nil
        )
        end
      end

      # Defines the scope a flow operation. You can use up to 20 filters to configure a single flow
      # operation.
      struct FlowFilter
        include JSON::Serializable

        @[JSON::Field(key: "DestinationAddress")]
        getter destination_address : Types::Address?

        # The destination port to inspect for. You can specify an individual port, for example 1994 and you
        # can specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "DestinationPort")]
        getter destination_port : String?

        # The protocols to inspect for, specified using the assigned internet protocol number (IANA) for each
        # protocol. If not specified, this matches with any protocol.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        @[JSON::Field(key: "SourceAddress")]
        getter source_address : Types::Address?

        # The source port to inspect for. You can specify an individual port, for example 1994 and you can
        # specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "SourcePort")]
        getter source_port : String?

        def initialize(
          @destination_address : Types::Address? = nil,
          @destination_port : String? = nil,
          @protocols : Array(String)? = nil,
          @source_address : Types::Address? = nil,
          @source_port : String? = nil
        )
        end
      end

      # Contains information about a flow operation, such as related statuses, unique identifiers, and all
      # filters defined in the operation. Flow operations let you manage the flows tracked in the flow
      # table, also known as the firewall table. A flow is network traffic that is monitored by a firewall,
      # either by stateful or stateless rules. For traffic to be considered part of a flow, it must share
      # Destination, DestinationPort, Direction, Protocol, Source, and SourcePort.
      struct FlowOperation
        include JSON::Serializable

        # Defines the scope a flow operation. You can use up to 20 filters to configure a single flow
        # operation.
        @[JSON::Field(key: "FlowFilters")]
        getter flow_filters : Array(Types::FlowFilter)?

        # The reqested FlowOperation ignores flows with an age (in seconds) lower than MinimumFlowAgeInSeconds
        # . You provide this for start commands.
        @[JSON::Field(key: "MinimumFlowAgeInSeconds")]
        getter minimum_flow_age_in_seconds : Int32?

        def initialize(
          @flow_filters : Array(Types::FlowFilter)? = nil,
          @minimum_flow_age_in_seconds : Int32? = nil
        )
        end
      end

      # An array of objects with metadata about the requested FlowOperation .
      struct FlowOperationMetadata
        include JSON::Serializable

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String?

        # Returns the status of the flow operation. This string is returned in the responses to start, list,
        # and describe commands. If the status is COMPLETED_WITH_ERRORS , results may be returned with any
        # number of Flows missing from the response. If the status is FAILED , Flows returned will be empty.
        @[JSON::Field(key: "FlowOperationStatus")]
        getter flow_operation_status : String?

        # Defines the type of FlowOperation .
        @[JSON::Field(key: "FlowOperationType")]
        getter flow_operation_type : String?

        # A timestamp indicating when the Suricata engine identified flows impacted by an operation.
        @[JSON::Field(key: "FlowRequestTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter flow_request_timestamp : Time?

        def initialize(
          @flow_operation_id : String? = nil,
          @flow_operation_status : String? = nil,
          @flow_operation_type : String? = nil,
          @flow_request_timestamp : Time? = nil
        )
        end
      end

      # Describes the amount of time that can pass without any traffic sent through the firewall before the
      # firewall determines that the connection is idle and Network Firewall removes the flow entry from its
      # flow table. Existing connections and flows are not impacted when you update this value. Only new
      # connections after you update this value are impacted.
      struct FlowTimeouts
        include JSON::Serializable

        # The number of seconds that can pass without any TCP traffic sent through the firewall before the
        # firewall determines that the connection is idle. After the idle timeout passes, data packets are
        # dropped, however, the next TCP SYN packet is considered a new flow and is processed by the firewall.
        # Clients or targets can use TCP keepalive packets to reset the idle timeout. You can define the
        # TcpIdleTimeoutSeconds value to be between 60 and 6000 seconds. If no value is provided, it defaults
        # to 350 seconds.
        @[JSON::Field(key: "TcpIdleTimeoutSeconds")]
        getter tcp_idle_timeout_seconds : Int32?

        def initialize(
          @tcp_idle_timeout_seconds : Int32? = nil
        )
        end
      end

      struct GetAnalysisReportResultsRequest
        include JSON::Serializable

        # The unique ID of the query that ran when you requested an analysis report.
        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @analysis_report_id : String,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAnalysisReportResultsResponse
        include JSON::Serializable

        # Retrieves the results of a traffic analysis report.
        @[JSON::Field(key: "AnalysisReportResults")]
        getter analysis_report_results : Array(Types::AnalysisTypeReportResult)?

        # The type of traffic that will be used to generate a report.
        @[JSON::Field(key: "AnalysisType")]
        getter analysis_type : String?

        # The date and time, up to the current date, from which to stop retrieving analysis data, in UTC
        # format (for example, YYYY-MM-DDTHH:MM:SSZ ).
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The date and time the analysis report was ran.
        @[JSON::Field(key: "ReportTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter report_time : Time?

        # The date and time within the last 30 days from which to start retrieving analysis data, in UTC
        # format (for example, YYYY-MM-DDTHH:MM:SSZ .
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the analysis report you specify. Statuses include RUNNING , COMPLETED , or FAILED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @analysis_report_results : Array(Types::AnalysisTypeReportResult)? = nil,
          @analysis_type : String? = nil,
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @report_time : Time? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The basic rule criteria for Network Firewall to use to inspect packet headers in stateful traffic
      # flow inspection. Traffic flows that match the criteria are a match for the corresponding
      # StatefulRule .
      struct Header
        include JSON::Serializable

        # The destination IP address or address range to inspect for, in CIDR notation. To match with any
        # address, specify ANY . Specify an IP address or a block of IP addresses in Classless Inter-Domain
        # Routing (CIDR) notation. Network Firewall supports all address ranges for IPv4 and IPv6. Examples:
        # To configure Network Firewall to inspect for the IP address 192.0.2.44, specify 192.0.2.44/32 . To
        # configure Network Firewall to inspect for IP addresses from 192.0.2.0 to 192.0.2.255, specify
        # 192.0.2.0/24 . To configure Network Firewall to inspect for the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . To
        # configure Network Firewall to inspect for IP addresses from 1111:0000:0000:0000:0000:0000:0000:0000
        # to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        @[JSON::Field(key: "Destination")]
        getter destination : String

        # The destination port to inspect for. You can specify an individual port, for example 1994 and you
        # can specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "DestinationPort")]
        getter destination_port : String

        # The direction of traffic flow to inspect. If set to ANY , the inspection matches bidirectional
        # traffic, both from the source to the destination and from the destination to the source. If set to
        # FORWARD , the inspection only matches traffic going from the source to the destination.
        @[JSON::Field(key: "Direction")]
        getter direction : String

        # The protocol to inspect for. To specify all, you can use IP , because all traffic on Amazon Web
        # Services and on the internet is IP.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The source IP address or address range to inspect for, in CIDR notation. To match with any address,
        # specify ANY . Specify an IP address or a block of IP addresses in Classless Inter-Domain Routing
        # (CIDR) notation. Network Firewall supports all address ranges for IPv4 and IPv6. Examples: To
        # configure Network Firewall to inspect for the IP address 192.0.2.44, specify 192.0.2.44/32 . To
        # configure Network Firewall to inspect for IP addresses from 192.0.2.0 to 192.0.2.255, specify
        # 192.0.2.0/24 . To configure Network Firewall to inspect for the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . To
        # configure Network Firewall to inspect for IP addresses from 1111:0000:0000:0000:0000:0000:0000:0000
        # to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        @[JSON::Field(key: "Source")]
        getter source : String

        # The source port to inspect for. You can specify an individual port, for example 1994 and you can
        # specify a port range, for example 1990:1994 . To match with any port, specify ANY .
        @[JSON::Field(key: "SourcePort")]
        getter source_port : String

        def initialize(
          @destination : String,
          @destination_port : String,
          @direction : String,
          @protocol : String,
          @source : String,
          @source_port : String
        )
        end
      end

      # Attempts made to a access domain.
      struct Hits
        include JSON::Serializable

        # The number of attempts made to access a domain.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        def initialize(
          @count : Int32? = nil
        )
        end
      end

      # A list of IP addresses and address ranges, in CIDR notation. This is part of a RuleVariables .
      struct IPSet
        include JSON::Serializable

        # The list of IP addresses and address ranges, in CIDR notation.
        @[JSON::Field(key: "Definition")]
        getter definition : Array(String)

        def initialize(
          @definition : Array(String)
        )
        end
      end

      # General information about the IP set.
      struct IPSetMetadata
        include JSON::Serializable

        # Describes the total number of CIDR blocks currently in use by the IP set references in a firewall.
        # To determine how many CIDR blocks are available for you to use in a firewall, you can call
        # AvailableCIDRCount .
        @[JSON::Field(key: "ResolvedCIDRCount")]
        getter resolved_cidr_count : Int32?

        def initialize(
          @resolved_cidr_count : Int32? = nil
        )
        end
      end

      # Configures one or more IP set references for a Suricata-compatible rule group. This is used in
      # CreateRuleGroup or UpdateRuleGroup . An IP set reference is a rule variable that references
      # resources that you create and manage in another Amazon Web Services service, such as an Amazon VPC
      # prefix list. Network Firewall IP set references enable you to dynamically update the contents of
      # your rules. When you create, update, or delete the resource you are referencing in your rule,
      # Network Firewall automatically updates the rule's content with the changes. For more information
      # about IP set references in Network Firewall, see Using IP set references in the Network Firewall
      # Developer Guide . Network Firewall currently supports Amazon VPC prefix lists and resource groups in
      # IP set references.
      struct IPSetReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you are referencing in your rule group.
        @[JSON::Field(key: "ReferenceArn")]
        getter reference_arn : String?

        def initialize(
          @reference_arn : String? = nil
        )
        end
      end

      # Amazon Web Services doesn't currently have enough available capacity to fulfill your request. Try
      # your request later.
      struct InsufficientCapacityException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request is valid, but Network Firewall couldn't perform the operation because of a system
      # problem. Retry your request.
      struct InternalServerError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because it's not valid. For example, you might have tried to delete a rule
      # group or firewall policy that's in use.
      struct InvalidOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because of a problem with your request. Examples include: You specified an
      # unsupported parameter name or value. You tried to update a property with a value that isn't among
      # the available types. Your request references an ARN that is malformed, or corresponds to a resource
      # that isn't valid in the context of the request.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The policy statement failed validation.
      struct InvalidResourcePolicyException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The token you provided is stale or isn't valid for the operation.
      struct InvalidTokenException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Unable to perform the operation because doing so would violate a limit setting.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAnalysisReportsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAnalysisReportsResponse
        include JSON::Serializable

        # The id and ReportTime associated with a requested analysis report. Does not provide the status of
        # the analysis report.
        @[JSON::Field(key: "AnalysisReports")]
        getter analysis_reports : Array(Types::AnalysisReport)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @analysis_reports : Array(Types::AnalysisReport)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallPoliciesRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallPoliciesResponse
        include JSON::Serializable

        # The metadata for the firewall policies. Depending on your setting for max results and the number of
        # firewall policies that you have, this might not be the full list.
        @[JSON::Field(key: "FirewallPolicies")]
        getter firewall_policies : Array(Types::FirewallPolicyMetadata)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_policies : Array(Types::FirewallPolicyMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifiers of the VPCs that you want Network Firewall to retrieve the firewalls for.
        # Leave this blank to retrieve all firewalls that you have defined.
        @[JSON::Field(key: "VpcIds")]
        getter vpc_ids : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @vpc_ids : Array(String)? = nil
        )
        end
      end

      struct ListFirewallsResponse
        include JSON::Serializable

        # The firewall metadata objects for the VPCs that you specified. Depending on your setting for max
        # results and the number of firewalls you have, a single call might not be the full list.
        @[JSON::Field(key: "Firewalls")]
        getter firewalls : Array(Types::FirewallMetadata)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewalls : Array(Types::FirewallMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowOperationResultsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @firewall_arn : String,
          @flow_operation_id : String,
          @availability_zone : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct ListFlowOperationResultsResponse
        include JSON::Serializable

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String?

        # Returns the status of the flow operation. This string is returned in the responses to start, list,
        # and describe commands. If the status is COMPLETED_WITH_ERRORS , results may be returned with any
        # number of Flows missing from the response. If the status is FAILED , Flows returned will be empty.
        @[JSON::Field(key: "FlowOperationStatus")]
        getter flow_operation_status : String?

        # A timestamp indicating when the Suricata engine identified flows impacted by an operation.
        @[JSON::Field(key: "FlowRequestTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter flow_request_timestamp : Time?

        # Any number of arrays, where each array is a single flow identified in the scope of the operation. If
        # multiple flows were in the scope of the operation, multiple Flows arrays are returned.
        @[JSON::Field(key: "Flows")]
        getter flows : Array(Types::Flow)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the asynchronous operation fails, Network Firewall populates this with the reason for the error
        # or failure. Options include Flow operation error and Flow timeout .
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @firewall_arn : String? = nil,
          @flow_operation_id : String? = nil,
          @flow_operation_status : String? = nil,
          @flow_request_timestamp : Time? = nil,
          @flows : Array(Types::Flow)? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct ListFlowOperationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # An optional string that defines whether any or all operation types are returned.
        @[JSON::Field(key: "FlowOperationType")]
        getter flow_operation_type : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @firewall_arn : String,
          @availability_zone : String? = nil,
          @flow_operation_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct ListFlowOperationsResponse
        include JSON::Serializable

        # Flow operations let you manage the flows tracked in the flow table, also known as the firewall
        # table. A flow is network traffic that is monitored by a firewall, either by stateful or stateless
        # rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort,
        # Direction, Protocol, Source, and SourcePort.
        @[JSON::Field(key: "FlowOperations")]
        getter flow_operations : Array(Types::FlowOperationMetadata)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @flow_operations : Array(Types::FlowOperationMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProxiesRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProxiesResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The metadata for the proxies. Depending on your setting for max results and the number of proxies
        # that you have, this might not be the full list.
        @[JSON::Field(key: "Proxies")]
        getter proxies : Array(Types::ProxyMetadata)?

        def initialize(
          @next_token : String? = nil,
          @proxies : Array(Types::ProxyMetadata)? = nil
        )
        end
      end

      struct ListProxyConfigurationsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProxyConfigurationsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The metadata for the proxy configurations. Depending on your setting for max results and the number
        # of proxy configurations that you have, this might not be the full list.
        @[JSON::Field(key: "ProxyConfigurations")]
        getter proxy_configurations : Array(Types::ProxyConfigurationMetadata)?

        def initialize(
          @next_token : String? = nil,
          @proxy_configurations : Array(Types::ProxyConfigurationMetadata)? = nil
        )
        end
      end

      struct ListProxyRuleGroupsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProxyRuleGroupsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The metadata for the proxy rule groups. Depending on your setting for max results and the number of
        # proxy rule groups that you have, this might not be the full list.
        @[JSON::Field(key: "ProxyRuleGroups")]
        getter proxy_rule_groups : Array(Types::ProxyRuleGroupMetadata)?

        def initialize(
          @next_token : String? = nil,
          @proxy_rule_groups : Array(Types::ProxyRuleGroupMetadata)? = nil
        )
        end
      end

      struct ListRuleGroupsRequest
        include JSON::Serializable

        # Indicates the general category of the Amazon Web Services managed rule group.
        @[JSON::Field(key: "ManagedType")]
        getter managed_type : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The scope of the request. The default setting of ACCOUNT or a setting of NULL returns all of the
        # rule groups in your account. A setting of MANAGED returns all available managed rule groups.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # Filters the results to show only rule groups with the specified subscription status. Use this to
        # find subscribed or unsubscribed rule groups.
        @[JSON::Field(key: "SubscriptionStatus")]
        getter subscription_status : String?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @managed_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scope : String? = nil,
          @subscription_status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListRuleGroupsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The rule group metadata objects that you've defined. Depending on your setting for max results and
        # the number of rule groups, this might not be the full list.
        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::RuleGroupMetadata)?

        def initialize(
          @next_token : String? = nil,
          @rule_groups : Array(Types::RuleGroupMetadata)? = nil
        )
        end
      end

      struct ListTLSInspectionConfigurationsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTLSInspectionConfigurationsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The TLS inspection configuration metadata objects that you've defined. Depending on your setting for
        # max results and the number of TLS inspection configurations, this might not be the full list.
        @[JSON::Field(key: "TLSInspectionConfigurations")]
        getter tls_inspection_configurations : Array(Types::TLSInspectionConfigurationMetadata)?

        def initialize(
          @next_token : String? = nil,
          @tls_inspection_configurations : Array(Types::TLSInspectionConfigurationMetadata)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
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

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListVpcEndpointAssociationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall. If you don't specify this, Network Firewall
        # retrieves all VPC endpoint associations that you have defined.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The maximum number of objects that you want Network Firewall to return for this request. If more
        # objects are available, in the response, Network Firewall provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVpcEndpointAssociationsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Network Firewall returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The VPC endpoint assocation metadata objects for the firewall that you specified. If you didn't
        # specify a firewall, this is all VPC endpoint associations that you have defined. Depending on your
        # setting for max results and the number of firewalls you have, a single call might not be the full
        # list.
        @[JSON::Field(key: "VpcEndpointAssociations")]
        getter vpc_endpoint_associations : Array(Types::VpcEndpointAssociationMetadata)?

        def initialize(
          @next_token : String? = nil,
          @vpc_endpoint_associations : Array(Types::VpcEndpointAssociationMetadata)? = nil
        )
        end
      end

      # Open port for taking HTTP or HTTPS traffic.
      struct ListenerProperty
        include JSON::Serializable

        # Port for processing traffic.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # Selection of HTTP or HTTPS traffic.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @port : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # This data type is used specifically for the CreateProxy and UpdateProxy APIs. Open port for taking
      # HTTP or HTTPS traffic.
      struct ListenerPropertyRequest
        include JSON::Serializable

        # Port for processing traffic.
        @[JSON::Field(key: "Port")]
        getter port : Int32

        # Selection of HTTP or HTTPS traffic.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @port : Int32,
          @type : String
        )
        end
      end

      # Defines where Network Firewall sends logs for the firewall for one log type. This is used in
      # LoggingConfiguration . You can send each type of log to an Amazon S3 bucket, a CloudWatch log group,
      # or a Firehose delivery stream. Network Firewall generates logs for stateful rule groups. You can
      # save alert, flow, and TLS log types.
      struct LogDestinationConfig
        include JSON::Serializable

        # The named location for the logs, provided in a key:value mapping that is specific to the chosen
        # destination type. For an Amazon S3 bucket, provide the name of the bucket, with key bucketName , and
        # optionally provide a prefix, with key prefix . The following example specifies an Amazon S3 bucket
        # named DOC-EXAMPLE-BUCKET and the prefix alerts : "LogDestination": { "bucketName":
        # "DOC-EXAMPLE-BUCKET", "prefix": "alerts" } For a CloudWatch log group, provide the name of the
        # CloudWatch log group, with key logGroup . The following example specifies a log group named
        # alert-log-group : "LogDestination": { "logGroup": "alert-log-group" } For a Firehose delivery
        # stream, provide the name of the delivery stream, with key deliveryStream . The following example
        # specifies a delivery stream named alert-delivery-stream : "LogDestination": { "deliveryStream":
        # "alert-delivery-stream" }
        @[JSON::Field(key: "LogDestination")]
        getter log_destination : Hash(String, String)

        # The type of storage destination to send these logs to. You can send logs to an Amazon S3 bucket, a
        # CloudWatch log group, or a Firehose delivery stream.
        @[JSON::Field(key: "LogDestinationType")]
        getter log_destination_type : String

        # The type of log to record. You can record the following types of logs from your Network Firewall
        # stateful engine. ALERT - Logs for traffic that matches your stateful rules and that have an action
        # that sends an alert. A stateful rule sends alerts for the rule actions DROP, ALERT, and REJECT. For
        # more information, see StatefulRule . FLOW - Standard network traffic flow logs. The stateful rules
        # engine records flow logs for all network traffic that it receives. Each flow log record captures the
        # network flow for a specific standard stateless rule group. TLS - Logs for events that are related to
        # TLS inspection. For more information, see Inspecting SSL/TLS traffic with TLS inspection
        # configurations in the Network Firewall Developer Guide .
        @[JSON::Field(key: "LogType")]
        getter log_type : String

        def initialize(
          @log_destination : Hash(String, String),
          @log_destination_type : String,
          @log_type : String
        )
        end
      end

      # Unable to send logs to a configured logging destination.
      struct LogDestinationPermissionException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines how Network Firewall performs logging for a Firewall .
      struct LoggingConfiguration
        include JSON::Serializable

        # Defines the logging destinations for the logs for a firewall. Network Firewall generates logs for
        # stateful rule groups.
        @[JSON::Field(key: "LogDestinationConfigs")]
        getter log_destination_configs : Array(Types::LogDestinationConfig)

        def initialize(
          @log_destination_configs : Array(Types::LogDestinationConfig)
        )
        end
      end

      # Criteria for Network Firewall to use to inspect an individual packet in stateless rule inspection.
      # Each match attributes set can include one or more items such as IP address, CIDR range, port number,
      # protocol, and TCP flags.
      struct MatchAttributes
        include JSON::Serializable

        # The destination port to inspect for. You can specify an individual port, for example 1994 and you
        # can specify a port range, for example 1990:1994 . To match with any port, specify ANY . This setting
        # is only used for protocols 6 (TCP) and 17 (UDP).
        @[JSON::Field(key: "DestinationPorts")]
        getter destination_ports : Array(Types::PortRange)?

        # The destination IP addresses and address ranges to inspect for, in CIDR notation. If not specified,
        # this matches with any destination address.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Address)?

        # The protocols to inspect for, specified using the assigned internet protocol number (IANA) for each
        # protocol. If not specified, this matches with any protocol.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(Int32)?

        # The source port to inspect for. You can specify an individual port, for example 1994 and you can
        # specify a port range, for example 1990:1994 . To match with any port, specify ANY . If not
        # specified, this matches with any source port. This setting is only used for protocols 6 (TCP) and 17
        # (UDP).
        @[JSON::Field(key: "SourcePorts")]
        getter source_ports : Array(Types::PortRange)?

        # The source IP addresses and address ranges to inspect for, in CIDR notation. If not specified, this
        # matches with any source address.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::Address)?

        # The TCP flags and masks to inspect for. If not specified, this matches with any settings. This
        # setting is only used for protocol 6 (TCP).
        @[JSON::Field(key: "TCPFlags")]
        getter tcp_flags : Array(Types::TCPFlagField)?

        def initialize(
          @destination_ports : Array(Types::PortRange)? = nil,
          @destinations : Array(Types::Address)? = nil,
          @protocols : Array(Int32)? = nil,
          @source_ports : Array(Types::PortRange)? = nil,
          @sources : Array(Types::Address)? = nil,
          @tcp_flags : Array(Types::TCPFlagField)? = nil
        )
        end
      end

      # Provides configuration status for a single policy or rule group that is used for a firewall
      # endpoint. Network Firewall provides each endpoint with the rules that are configured in the firewall
      # policy. Each time you add a subnet or modify the associated firewall policy, Network Firewall
      # synchronizes the rules in the endpoint, so it can properly filter network traffic. This is part of a
      # SyncState for a firewall.
      struct PerObjectStatus
        include JSON::Serializable

        # Indicates whether this object is in sync with the version indicated in the update token.
        @[JSON::Field(key: "SyncStatus")]
        getter sync_status : String?

        # The current version of the object that is either in sync or pending synchronization.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @sync_status : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      # Contains variables that you can use to override default Suricata settings in your firewall policy.
      struct PolicyVariables
        include JSON::Serializable

        # The IPv4 or IPv6 addresses in CIDR notation to use for the Suricata HOME_NET variable. If your
        # firewall uses an inspection VPC, you might want to override the HOME_NET variable with the CIDRs of
        # your home networks. If you don't override HOME_NET with your own CIDRs, Network Firewall by default
        # uses the CIDR of your inspection VPC.
        @[JSON::Field(key: "RuleVariables")]
        getter rule_variables : Hash(String, Types::IPSet)?

        def initialize(
          @rule_variables : Hash(String, Types::IPSet)? = nil
        )
        end
      end

      # A single port range specification. This is used for source and destination port ranges in the
      # stateless rule MatchAttributes , SourcePorts , and DestinationPorts settings.
      struct PortRange
        include JSON::Serializable

        # The lower limit of the port range. This must be less than or equal to the ToPort specification.
        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32

        # The upper limit of the port range. This must be greater than or equal to the FromPort specification.
        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32

        def initialize(
          @from_port : Int32,
          @to_port : Int32
        )
        end
      end

      # A set of port ranges for use in the rules in a rule group.
      struct PortSet
        include JSON::Serializable

        # The set of port ranges.
        @[JSON::Field(key: "Definition")]
        getter definition : Array(String)?

        def initialize(
          @definition : Array(String)? = nil
        )
        end
      end

      # Proxy attached to a NAT gateway.
      struct Proxy
        include JSON::Serializable

        # Time the Proxy was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # Time the Proxy was deleted.
        @[JSON::Field(key: "DeleteTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_time : Time?

        # Failure code for cases when the Proxy fails to attach or update.
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # Failure message for cases when the Proxy fails to attach or update.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # Listener properties for HTTP and HTTPS traffic.
        @[JSON::Field(key: "ListenerProperties")]
        getter listener_properties : Array(Types::ListenerProperty)?

        # The NAT Gateway for the proxy.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String?

        # The Amazon Resource Name (ARN) of a proxy.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The Amazon Resource Name (ARN) of a proxy configuration.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        # Current modification status of the Proxy.
        @[JSON::Field(key: "ProxyModifyState")]
        getter proxy_modify_state : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        # Current attachment/detachment status of the Proxy.
        @[JSON::Field(key: "ProxyState")]
        getter proxy_state : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # TLS decryption on traffic to filter on attributes in the HTTP header.
        @[JSON::Field(key: "TlsInterceptProperties")]
        getter tls_intercept_properties : Types::TlsInterceptProperties?

        # Time the Proxy was updated.
        @[JSON::Field(key: "UpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_time : Time?

        def initialize(
          @create_time : Time? = nil,
          @delete_time : Time? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @listener_properties : Array(Types::ListenerProperty)? = nil,
          @nat_gateway_id : String? = nil,
          @proxy_arn : String? = nil,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil,
          @proxy_modify_state : String? = nil,
          @proxy_name : String? = nil,
          @proxy_state : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tls_intercept_properties : Types::TlsInterceptProperties? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
      # where the rule match is applied. This data type is used specifically for the
      # CreateProxyConfiguration and UpdateProxyConfiguration APIs.
      struct ProxyConfigDefaultRulePhaseActionsRequest
        include JSON::Serializable

        # After receiving response.
        @[JSON::Field(key: "PostRESPONSE")]
        getter post_response : String?

        # Before domain resolution.
        @[JSON::Field(key: "PreDNS")]
        getter pre_dns : String?

        # After DNS, before request.
        @[JSON::Field(key: "PreREQUEST")]
        getter pre_request : String?

        def initialize(
          @post_response : String? = nil,
          @pre_dns : String? = nil,
          @pre_request : String? = nil
        )
        end
      end

      # Proxy rule group contained within a proxy configuration.
      struct ProxyConfigRuleGroup
        include JSON::Serializable

        # Priority of the proxy rule group in the proxy configuration.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of a proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        # Proxy rule group type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @priority : Int32? = nil,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details of the
      # behavior are defined in the rule groups that you add to your configuration.
      struct ProxyConfiguration
        include JSON::Serializable

        # Time the Proxy Configuration was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
        # where the rule match is applied. Pre-DNS - before domain resolution. Pre-Request - after DNS, before
        # request. Post-Response - after receiving response.
        @[JSON::Field(key: "DefaultRulePhaseActions")]
        getter default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest?

        # Time the Proxy Configuration was deleted.
        @[JSON::Field(key: "DeleteTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_time : Time?

        # A description of the proxy configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of a proxy configuration.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        # Proxy rule groups within the proxy configuration.
        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::ProxyConfigRuleGroup)?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @create_time : Time? = nil,
          @default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest? = nil,
          @delete_time : Time? = nil,
          @description : String? = nil,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil,
          @rule_groups : Array(Types::ProxyConfigRuleGroup)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # High-level information about a proxy configuration, returned by operations like create and describe.
      # You can use the information provided in the metadata to retrieve and manage a proxy configuration.
      # You can retrieve all objects for a proxy configuration by calling DescribeProxyConfiguration .
      struct ProxyConfigurationMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy configuration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # High-level information about a proxy, returned by operations like create and describe. You can use
      # the information provided in the metadata to retrieve and manage a proxy. You can retrieve all
      # objects for a proxy by calling DescribeProxy .
      struct ProxyMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Individual rules that define match conditions and actions for application-layer traffic. Rules
      # specify what to inspect (domains, headers, methods) and what action to take (allow, deny, alert).
      struct ProxyRule
        include JSON::Serializable

        # Action to take.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Match criteria that specify what traffic attributes to examine. Conditions include operators
        # (StringEquals, StringLike) and values to match against.
        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::ProxyRuleCondition)?

        # A description of the proxy rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The descriptive name of the proxy rule. You can't change the name of a proxy rule after you create
        # it.
        @[JSON::Field(key: "ProxyRuleName")]
        getter proxy_rule_name : String?

        def initialize(
          @action : String? = nil,
          @conditions : Array(Types::ProxyRuleCondition)? = nil,
          @description : String? = nil,
          @proxy_rule_name : String? = nil
        )
        end
      end

      # Match criteria that specify what traffic attributes to examine.
      struct ProxyRuleCondition
        include JSON::Serializable

        # Defines what is to be matched.
        @[JSON::Field(key: "ConditionKey")]
        getter condition_key : String?

        # Defines how to perform a match.
        @[JSON::Field(key: "ConditionOperator")]
        getter condition_operator : String?

        # Specifes the exact value that needs to be matched against.
        @[JSON::Field(key: "ConditionValues")]
        getter condition_values : Array(String)?

        def initialize(
          @condition_key : String? = nil,
          @condition_operator : String? = nil,
          @condition_values : Array(String)? = nil
        )
        end
      end

      # Collections of related proxy filtering rules. Rule groups help you manage and reuse sets of rules
      # across multiple proxy configurations.
      struct ProxyRuleGroup
        include JSON::Serializable

        # Time the Proxy Rule Group was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # Time the Proxy Rule Group was deleted.
        @[JSON::Field(key: "DeleteTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_time : Time?

        # A description of the proxy rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of a proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        # Individual rules that define match conditions and actions for application-layer traffic. Rules
        # specify what to inspect (domains, headers, methods) and what action to take (allow, deny, alert).
        @[JSON::Field(key: "Rules")]
        getter rules : Types::ProxyRulesByRequestPhase?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @create_time : Time? = nil,
          @delete_time : Time? = nil,
          @description : String? = nil,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil,
          @rules : Types::ProxyRulesByRequestPhase? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The proxy rule group(s) to attach to the proxy configuration
      struct ProxyRuleGroupAttachment
        include JSON::Serializable

        # Where to insert a proxy rule group in a proxy configuration.
        @[JSON::Field(key: "InsertPosition")]
        getter insert_position : Int32?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @insert_position : Int32? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      # High-level information about a proxy rule group, returned by operations like create and describe.
      # You can use the information provided in the metadata to retrieve and manage a proxy rule group. You
      # can retrieve all objects for a proxy rule group by calling DescribeProxyRuleGroup .
      struct ProxyRuleGroupMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy rule group.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Proxy rule group name and new desired position.
      struct ProxyRuleGroupPriority
        include JSON::Serializable

        # Where to move a proxy rule group in a proxy configuration.
        @[JSON::Field(key: "NewPosition")]
        getter new_position : Int32?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @new_position : Int32? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      # Proxy rule group along with its priority.
      struct ProxyRuleGroupPriorityResult
        include JSON::Serializable

        # Priority of the proxy rule group in the proxy configuration.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @priority : Int32? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      # Proxy rule name and new desired position.
      struct ProxyRulePriority
        include JSON::Serializable

        # Where to move a proxy rule in a proxy rule group.
        @[JSON::Field(key: "NewPosition")]
        getter new_position : Int32?

        # The descriptive name of the proxy rule. You can't change the name of a proxy rule after you create
        # it.
        @[JSON::Field(key: "ProxyRuleName")]
        getter proxy_rule_name : String?

        def initialize(
          @new_position : Int32? = nil,
          @proxy_rule_name : String? = nil
        )
        end
      end

      # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
      # where the rule match is applied.
      struct ProxyRulesByRequestPhase
        include JSON::Serializable

        # After receiving response.
        @[JSON::Field(key: "PostRESPONSE")]
        getter post_response : Array(Types::ProxyRule)?

        # Before domain resolution.
        @[JSON::Field(key: "PreDNS")]
        getter pre_dns : Array(Types::ProxyRule)?

        # After DNS, before request.
        @[JSON::Field(key: "PreREQUEST")]
        getter pre_request : Array(Types::ProxyRule)?

        def initialize(
          @post_response : Array(Types::ProxyRule)? = nil,
          @pre_dns : Array(Types::ProxyRule)? = nil,
          @pre_request : Array(Types::ProxyRule)? = nil
        )
        end
      end

      # Stateless inspection criteria that publishes the specified metrics to Amazon CloudWatch for the
      # matching packet. This setting defines a CloudWatch dimension value to be published.
      struct PublishMetricAction
        include JSON::Serializable

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)

        def initialize(
          @dimensions : Array(Types::Dimension)
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The IAM policy statement that lists the accounts that you want to share your Network Firewall
        # resources with and the operations that you want the accounts to be able to perform. For a rule group
        # resource, you can specify the following operations in the Actions section of the statement:
        # network-firewall:CreateFirewallPolicy network-firewall:UpdateFirewallPolicy
        # network-firewall:ListRuleGroups For a firewall policy resource, you can specify the following
        # operations in the Actions section of the statement: network-firewall:AssociateFirewallPolicy
        # network-firewall:ListFirewallPolicies For a firewall resource, you can specify the following
        # operations in the Actions section of the statement: network-firewall:CreateVpcEndpointAssociation
        # network-firewall:DescribeFirewallMetadata network-firewall:ListFirewalls In the Resource section of
        # the statement, you specify the ARNs for the Network Firewall resources that you want to share with
        # the account that you specified in Arn .
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the account that you want to share your Network Firewall resources
        # with.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains a set of IP set references.
      struct ReferenceSets
        include JSON::Serializable

        # The list of IP set references.
        @[JSON::Field(key: "IPSetReferences")]
        getter ip_set_references : Hash(String, Types::IPSetReference)?

        def initialize(
          @ip_set_references : Hash(String, Types::IPSetReference)? = nil
        )
        end
      end

      struct RejectNetworkFirewallTransitGatewayAttachmentRequest
        include JSON::Serializable

        # Required. The unique identifier of the transit gateway attachment to reject. This ID is returned in
        # the response when creating a transit gateway-attached firewall.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        def initialize(
          @transit_gateway_attachment_id : String
        )
        end
      end

      struct RejectNetworkFirewallTransitGatewayAttachmentResponse
        include JSON::Serializable

        # The unique identifier of the transit gateway attachment that was rejected.
        @[JSON::Field(key: "TransitGatewayAttachmentId")]
        getter transit_gateway_attachment_id : String

        # The current status of the transit gateway attachment. Valid values are: CREATING - The attachment is
        # being created DELETING - The attachment is being deleted DELETED - The attachment has been deleted
        # FAILED - The attachment creation has failed and cannot be recovered ERROR - The attachment is in an
        # error state that might be recoverable READY - The attachment is active and processing traffic
        # PENDING_ACCEPTANCE - The attachment is waiting to be accepted REJECTING - The attachment is in the
        # process of being rejected REJECTED - The attachment has been rejected For information about
        # troubleshooting endpoint failures, see Troubleshooting firewall endpoint failures in the Network
        # Firewall Developer Guide .
        @[JSON::Field(key: "TransitGatewayAttachmentStatus")]
        getter transit_gateway_attachment_status : String

        def initialize(
          @transit_gateway_attachment_id : String,
          @transit_gateway_attachment_status : String
        )
        end
      end

      # Unable to locate a resource using the parameters that you provided.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Unable to change the resource because your account doesn't own it.
      struct ResourceOwnerCheckException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The inspection criteria and action for a single stateless rule. Network Firewall inspects each
      # packet for the specified matching criteria. When a packet matches the criteria, Network Firewall
      # performs the rule's actions on the packet.
      struct RuleDefinition
        include JSON::Serializable

        # The actions to take on a packet that matches one of the stateless rule definition's match
        # attributes. You must specify a standard action and you can add custom actions. Network Firewall only
        # forwards a packet for stateful rule inspection if you specify aws:forward_to_sfe for a rule that the
        # packet matches, or if the packet doesn't match any stateless rule and you specify aws:forward_to_sfe
        # for the StatelessDefaultActions setting for the FirewallPolicy . For every rule, you must specify
        # exactly one of the following standard actions. aws:pass - Discontinues all inspection of the packet
        # and permits it to go to its intended destination. aws:drop - Discontinues all inspection of the
        # packet and blocks it from going to its intended destination. aws:forward_to_sfe - Discontinues
        # stateless inspection of the packet and forwards it to the stateful rule engine for inspection.
        # Additionally, you can specify a custom action. To do this, you define a custom action by name and
        # type, then provide the name you've assigned to the action in this Actions setting. For information
        # about the options, see CustomAction . To provide more than one action in this setting, separate the
        # settings with a comma. For example, if you have a custom PublishMetrics action that you've named
        # MyMetricsAction , then you could specify the standard action aws:pass and the custom action with
        # [“aws:pass”, “MyMetricsAction”] .
        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # Criteria for Network Firewall to use to inspect an individual packet in stateless rule inspection.
        # Each match attributes set can include one or more items such as IP address, CIDR range, port number,
        # protocol, and TCP flags.
        @[JSON::Field(key: "MatchAttributes")]
        getter match_attributes : Types::MatchAttributes

        def initialize(
          @actions : Array(String),
          @match_attributes : Types::MatchAttributes
        )
        end
      end

      # The object that defines the rules in a rule group. This, along with RuleGroupResponse , define the
      # rule group. You can retrieve all objects for a rule group by calling DescribeRuleGroup . Network
      # Firewall uses a rule group to inspect and control network traffic. You define stateless rule groups
      # to inspect individual packets and you define stateful rule groups to inspect packets in the context
      # of their traffic flow. To use a rule group, you include it by reference in an Network Firewall
      # firewall policy, then you use the policy in a firewall. You can reference a rule group from more
      # than one firewall policy, and you can use a firewall policy in more than one firewall.
      struct RuleGroup
        include JSON::Serializable

        # The stateful rules or stateless rules for the rule group.
        @[JSON::Field(key: "RulesSource")]
        getter rules_source : Types::RulesSource

        # The list of a rule group's reference sets.
        @[JSON::Field(key: "ReferenceSets")]
        getter reference_sets : Types::ReferenceSets?

        # Settings that are available for use in the rules in the rule group. You can only use these for
        # stateful rule groups.
        @[JSON::Field(key: "RuleVariables")]
        getter rule_variables : Types::RuleVariables?

        # Additional options governing how Network Firewall handles stateful rules. The policies where you use
        # your stateful rule group must have stateful rule options settings that are compatible with these
        # settings. Some limitations apply; for more information, see Strict evaluation order in the Network
        # Firewall Developer Guide .
        @[JSON::Field(key: "StatefulRuleOptions")]
        getter stateful_rule_options : Types::StatefulRuleOptions?

        def initialize(
          @rules_source : Types::RulesSource,
          @reference_sets : Types::ReferenceSets? = nil,
          @rule_variables : Types::RuleVariables? = nil,
          @stateful_rule_options : Types::StatefulRuleOptions? = nil
        )
        end
      end

      # High-level information about a rule group, returned by ListRuleGroups . You can use the information
      # provided in the metadata to retrieve and manage a rule group.
      struct RuleGroupMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the Amazon Web Services Marketplace seller that provides this rule group.
        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @vendor_name : String? = nil
        )
        end
      end

      # The high-level properties of a rule group. This, along with the RuleGroup , define the rule group.
      # You can retrieve all objects for a rule group by calling DescribeRuleGroup .
      struct RuleGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group. If this response is for a create request that had
        # DryRun set to TRUE , then this ARN is a placeholder that isn't attached to a valid resource.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String

        # The unique identifier for the rule group.
        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String

        # The list of analysis results for AnalyzeRuleGroup . If you set AnalyzeRuleGroup to TRUE in
        # CreateRuleGroup , UpdateRuleGroup , or DescribeRuleGroup , Network Firewall analyzes the rule group
        # and identifies the rules that might adversely effect your firewall's functionality. For example, if
        # Network Firewall detects a rule that's routing traffic asymmetrically, which impacts the service's
        # ability to properly process traffic, the service includes the rule in the list of analysis results.
        @[JSON::Field(key: "AnalysisResults")]
        getter analysis_results : Array(Types::AnalysisResult)?

        # The maximum operating resources that this rule group can use. Rule group capacity is fixed at
        # creation. When you update a rule group, you are limited to this capacity. When you reference a rule
        # group from a firewall policy, Network Firewall reserves this capacity for the rule group. You can
        # retrieve the capacity that would be required for a rule group before you create the rule group by
        # calling CreateRuleGroup with DryRun set to TRUE .
        @[JSON::Field(key: "Capacity")]
        getter capacity : Int32?

        # The number of capacity units currently consumed by the rule group rules.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Int32?

        # A description of the rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains the Amazon Web Services KMS encryption configuration settings for your
        # rule group.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The last time that the rule group was changed.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The number of firewall policies that use this rule group.
        @[JSON::Field(key: "NumberOfAssociations")]
        getter number_of_associations : Int32?

        # Detailed information about the current status of a rule group.
        @[JSON::Field(key: "RuleGroupStatus")]
        getter rule_group_status : String?

        # The Amazon Resource Name (ARN) of the Amazon Simple Notification Service SNS topic that's used to
        # record changes to the managed rule group. You can subscribe to the SNS topic to receive
        # notifications when the managed rule group is modified, such as for new versions and for version
        # expiration. For more information, see the Amazon Simple Notification Service Developer Guide. .
        @[JSON::Field(key: "SnsTopic")]
        getter sns_topic : String?

        # A complex type that contains metadata about the rule group that your own rule group is copied from.
        # You can use the metadata to track the version updates made to the originating rule group.
        @[JSON::Field(key: "SourceMetadata")]
        getter source_metadata : Types::SourceMetadata?

        # A complex type containing the currently selected rule option fields that will be displayed for rule
        # summarization returned by DescribeRuleGroupSummary . The RuleOptions specified in
        # SummaryConfiguration Rule metadata organization preferences
        @[JSON::Field(key: "SummaryConfiguration")]
        getter summary_configuration : Types::SummaryConfiguration?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @rule_group_arn : String,
          @rule_group_id : String,
          @rule_group_name : String,
          @analysis_results : Array(Types::AnalysisResult)? = nil,
          @capacity : Int32? = nil,
          @consumed_capacity : Int32? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @number_of_associations : Int32? = nil,
          @rule_group_status : String? = nil,
          @sns_topic : String? = nil,
          @source_metadata : Types::SourceMetadata? = nil,
          @summary_configuration : Types::SummaryConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # Additional settings for a stateful rule. This is part of the StatefulRule configuration.
      struct RuleOption
        include JSON::Serializable

        # The keyword for the Suricata compatible rule option. You must include a sid (signature ID), and can
        # optionally include other keywords. For information about Suricata compatible keywords, see Rule
        # options in the Suricata documentation.
        @[JSON::Field(key: "Keyword")]
        getter keyword : String

        # The settings of the Suricata compatible rule option. Rule options have zero or more setting values,
        # and the number of possible and required settings depends on the Keyword . For more information about
        # the settings for specific options, see Rule options .
        @[JSON::Field(key: "Settings")]
        getter settings : Array(String)?

        def initialize(
          @keyword : String,
          @settings : Array(String)? = nil
        )
        end
      end

      # A complex type containing details about a Suricata rule. Contains: SID Msg Metadata Summaries are
      # available for rule groups you manage and for active threat defense Amazon Web Services managed rule
      # groups.
      struct RuleSummary
        include JSON::Serializable

        # The contents of the rule's metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : String?

        # The contents taken from the rule's msg field.
        @[JSON::Field(key: "Msg")]
        getter msg : String?

        # The unique identifier (Signature ID) of the Suricata rule.
        @[JSON::Field(key: "SID")]
        getter sid : String?

        def initialize(
          @metadata : String? = nil,
          @msg : String? = nil,
          @sid : String? = nil
        )
        end
      end

      # Settings that are available for use in the rules in the RuleGroup where this is defined. See
      # CreateRuleGroup or UpdateRuleGroup for usage.
      struct RuleVariables
        include JSON::Serializable

        # A list of IP addresses and address ranges, in CIDR notation.
        @[JSON::Field(key: "IPSets")]
        getter ip_sets : Hash(String, Types::IPSet)?

        # A list of port ranges.
        @[JSON::Field(key: "PortSets")]
        getter port_sets : Hash(String, Types::PortSet)?

        def initialize(
          @ip_sets : Hash(String, Types::IPSet)? = nil,
          @port_sets : Hash(String, Types::PortSet)? = nil
        )
        end
      end

      # The stateless or stateful rules definitions for use in a single rule group. Each rule group requires
      # a single RulesSource . You can use an instance of this for either stateless rules or stateful rules.
      struct RulesSource
        include JSON::Serializable

        # Stateful inspection criteria for a domain list rule group.
        @[JSON::Field(key: "RulesSourceList")]
        getter rules_source_list : Types::RulesSourceList?

        # Stateful inspection criteria, provided in Suricata compatible rules. Suricata is an open-source
        # threat detection framework that includes a standard rule-based language for network traffic
        # inspection. These rules contain the inspection criteria and the action to take for traffic that
        # matches the criteria, so this type of rule group doesn't have a separate action setting. You can't
        # use the priority keyword if the RuleOrder option in StatefulRuleOptions is set to STRICT_ORDER .
        @[JSON::Field(key: "RulesString")]
        getter rules_string : String?

        # An array of individual stateful rules inspection criteria to be used together in a stateful rule
        # group. Use this option to specify simple Suricata rules with protocol, source and destination,
        # ports, direction, and rule options. For information about the Suricata Rules format, see Rules
        # Format .
        @[JSON::Field(key: "StatefulRules")]
        getter stateful_rules : Array(Types::StatefulRule)?

        # Stateless inspection criteria to be used in a stateless rule group.
        @[JSON::Field(key: "StatelessRulesAndCustomActions")]
        getter stateless_rules_and_custom_actions : Types::StatelessRulesAndCustomActions?

        def initialize(
          @rules_source_list : Types::RulesSourceList? = nil,
          @rules_string : String? = nil,
          @stateful_rules : Array(Types::StatefulRule)? = nil,
          @stateless_rules_and_custom_actions : Types::StatelessRulesAndCustomActions? = nil
        )
        end
      end

      # Stateful inspection criteria for a domain list rule group. For HTTPS traffic, domain filtering is
      # SNI-based. It uses the server name indicator extension of the TLS handshake. By default, Network
      # Firewall domain list inspection only includes traffic coming from the VPC where you deploy the
      # firewall. To inspect traffic from IP addresses outside of the deployment VPC, you set the HOME_NET
      # rule variable to include the CIDR range of the deployment VPC plus the other CIDR ranges. For more
      # information, see RuleVariables in this guide and Stateful domain list rule groups in Network
      # Firewall in the Network Firewall Developer Guide .
      struct RulesSourceList
        include JSON::Serializable

        # Whether you want to apply allow, reject, alert, or drop behavior to the domains in your target list.
        # When logging is enabled and you choose Alert, traffic that matches the domain specifications
        # generates an alert in the firewall's logs. Then, traffic either passes, is rejected, or drops based
        # on other rules in the firewall policy.
        @[JSON::Field(key: "GeneratedRulesType")]
        getter generated_rules_type : String

        # The protocols you want to inspect. Specify TLS_SNI for HTTPS . Specify HTTP_HOST for HTTP . You can
        # specify either or both.
        @[JSON::Field(key: "TargetTypes")]
        getter target_types : Array(String)

        # The domains that you want to inspect for in your traffic flows. Valid domain specifications are the
        # following: Explicit names. For example, abc.example.com matches only the domain abc.example.com .
        # Names that use a domain wildcard, which you indicate with an initial ' . '. For example,
        # .example.com matches example.com and matches all subdomains of example.com , such as abc.example.com
        # and www.example.com .
        @[JSON::Field(key: "Targets")]
        getter targets : Array(String)

        def initialize(
          @generated_rules_type : String,
          @target_types : Array(String),
          @targets : Array(String)
        )
        end
      end

      # Any Certificate Manager (ACM) Secure Sockets Layer/Transport Layer Security (SSL/TLS) server
      # certificate that's associated with a ServerCertificateConfiguration . Used in a
      # TLSInspectionConfiguration for inspection of inbound traffic to your firewall. You must request or
      # import a SSL/TLS certificate into ACM for each domain Network Firewall needs to decrypt and inspect.
      # Network Firewall uses the SSL/TLS certificates to decrypt specified inbound SSL/TLS traffic going to
      # your firewall. For information about working with certificates in Certificate Manager, see Request a
      # public certificate or Importing certificates in the Certificate Manager User Guide .
      struct ServerCertificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Certificate Manager SSL/TLS server certificate that's used for
        # inbound SSL/TLS inspection.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      # Configures the Certificate Manager certificates and scope that Network Firewall uses to decrypt and
      # re-encrypt traffic using a TLSInspectionConfiguration . You can configure ServerCertificates for
      # inbound SSL/TLS inspection, a CertificateAuthorityArn for outbound SSL/TLS inspection, or both. For
      # information about working with certificates for TLS inspection, see Using SSL/TLS server
      # certficiates with TLS inspection configurations in the Network Firewall Developer Guide . If a
      # server certificate that's associated with your TLSInspectionConfiguration is revoked, deleted, or
      # expired it can result in client-side TLS errors.
      struct ServerCertificateConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the imported certificate authority (CA) certificate within
        # Certificate Manager (ACM) to use for outbound SSL/TLS inspection. The following limitations apply:
        # You can use CA certificates that you imported into ACM, but you can't generate CA certificates with
        # ACM. You can't use certificates issued by Private Certificate Authority. For more information about
        # configuring certificates for outbound inspection, see Using SSL/TLS certificates with TLS inspection
        # configurations in the Network Firewall Developer Guide . For information about working with
        # certificates in ACM, see Importing certificates in the Certificate Manager User Guide .
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # When enabled, Network Firewall checks if the server certificate presented by the server in the
        # SSL/TLS connection has a revoked or unkown status. If the certificate has an unknown or revoked
        # status, you must specify the actions that Network Firewall takes on outbound traffic. To check the
        # certificate revocation status, you must also specify a CertificateAuthorityArn in
        # ServerCertificateConfiguration .
        @[JSON::Field(key: "CheckCertificateRevocationStatus")]
        getter check_certificate_revocation_status : Types::CheckCertificateRevocationStatusActions?

        # A list of scopes.
        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(Types::ServerCertificateScope)?

        # The list of server certificates to use for inbound SSL/TLS inspection.
        @[JSON::Field(key: "ServerCertificates")]
        getter server_certificates : Array(Types::ServerCertificate)?

        def initialize(
          @certificate_authority_arn : String? = nil,
          @check_certificate_revocation_status : Types::CheckCertificateRevocationStatusActions? = nil,
          @scopes : Array(Types::ServerCertificateScope)? = nil,
          @server_certificates : Array(Types::ServerCertificate)? = nil
        )
        end
      end

      # Settings that define the Secure Sockets Layer/Transport Layer Security (SSL/TLS) traffic that
      # Network Firewall should decrypt for inspection by the stateful rule engine.
      struct ServerCertificateScope
        include JSON::Serializable

        # The destination ports to decrypt for inspection, in Transmission Control Protocol (TCP) format. If
        # not specified, this matches with any destination port. You can specify individual ports, for example
        # 1994 , and you can specify port ranges, such as 1990:1994 .
        @[JSON::Field(key: "DestinationPorts")]
        getter destination_ports : Array(Types::PortRange)?

        # The destination IP addresses and address ranges to decrypt for inspection, in CIDR notation. If not
        # specified, this matches with any destination address.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Address)?

        # The protocols to inspect for, specified using the assigned internet protocol number (IANA) for each
        # protocol. If not specified, this matches with any protocol. Network Firewall currently supports only
        # TCP.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(Int32)?

        # The source ports to decrypt for inspection, in Transmission Control Protocol (TCP) format. If not
        # specified, this matches with any source port. You can specify individual ports, for example 1994 ,
        # and you can specify port ranges, such as 1990:1994 .
        @[JSON::Field(key: "SourcePorts")]
        getter source_ports : Array(Types::PortRange)?

        # The source IP addresses and address ranges to decrypt for inspection, in CIDR notation. If not
        # specified, this matches with any source address.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::Address)?

        def initialize(
          @destination_ports : Array(Types::PortRange)? = nil,
          @destinations : Array(Types::Address)? = nil,
          @protocols : Array(Int32)? = nil,
          @source_ports : Array(Types::PortRange)? = nil,
          @sources : Array(Types::Address)? = nil
        )
        end
      end

      # High-level information about the managed rule group that your own rule group is copied from. You can
      # use the the metadata to track version updates made to the originating rule group. You can retrieve
      # all objects for a rule group by calling DescribeRuleGroup .
      struct SourceMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group that your own rule group is copied from.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The update token of the Amazon Web Services managed rule group that your own rule group is copied
        # from. To determine the update token for the managed rule group, call DescribeRuleGroup .
        @[JSON::Field(key: "SourceUpdateToken")]
        getter source_update_token : String?

        def initialize(
          @source_arn : String? = nil,
          @source_update_token : String? = nil
        )
        end
      end

      struct StartAnalysisReportRequest
        include JSON::Serializable

        # The type of traffic that will be used to generate a report.
        @[JSON::Field(key: "AnalysisType")]
        getter analysis_type : String

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        def initialize(
          @analysis_type : String,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil
        )
        end
      end

      struct StartAnalysisReportResponse
        include JSON::Serializable

        # The unique ID of the query that ran when you requested an analysis report.
        @[JSON::Field(key: "AnalysisReportId")]
        getter analysis_report_id : String

        def initialize(
          @analysis_report_id : String
        )
        end
      end

      struct StartFlowCaptureRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        # Defines the scope a flow operation. You can use up to 20 filters to configure a single flow
        # operation.
        @[JSON::Field(key: "FlowFilters")]
        getter flow_filters : Array(Types::FlowFilter)

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reqested FlowOperation ignores flows with an age (in seconds) lower than MinimumFlowAgeInSeconds
        # . You provide this for start commands. We recommend setting this value to at least 1 minute (60
        # seconds) to reduce chance of capturing flows that are not yet established.
        @[JSON::Field(key: "MinimumFlowAgeInSeconds")]
        getter minimum_flow_age_in_seconds : Int32?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @firewall_arn : String,
          @flow_filters : Array(Types::FlowFilter),
          @availability_zone : String? = nil,
          @minimum_flow_age_in_seconds : Int32? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct StartFlowCaptureResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String?

        # Returns the status of the flow operation. This string is returned in the responses to start, list,
        # and describe commands. If the status is COMPLETED_WITH_ERRORS , results may be returned with any
        # number of Flows missing from the response. If the status is FAILED , Flows returned will be empty.
        @[JSON::Field(key: "FlowOperationStatus")]
        getter flow_operation_status : String?

        def initialize(
          @firewall_arn : String? = nil,
          @flow_operation_id : String? = nil,
          @flow_operation_status : String? = nil
        )
        end
      end

      struct StartFlowFlushRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        # Defines the scope a flow operation. You can use up to 20 filters to configure a single flow
        # operation.
        @[JSON::Field(key: "FlowFilters")]
        getter flow_filters : Array(Types::FlowFilter)

        # The ID of the Availability Zone where the firewall is located. For example, us-east-2a . Defines the
        # scope a flow operation. You can use up to 20 filters to configure a single flow operation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reqested FlowOperation ignores flows with an age (in seconds) lower than MinimumFlowAgeInSeconds
        # . You provide this for start commands.
        @[JSON::Field(key: "MinimumFlowAgeInSeconds")]
        getter minimum_flow_age_in_seconds : Int32?

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        # A unique identifier for the primary endpoint associated with a firewall.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @firewall_arn : String,
          @flow_filters : Array(Types::FlowFilter),
          @availability_zone : String? = nil,
          @minimum_flow_age_in_seconds : Int32? = nil,
          @vpc_endpoint_association_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct StartFlowFlushResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # A unique identifier for the flow operation. This ID is returned in the responses to start and list
        # commands. You provide to describe commands.
        @[JSON::Field(key: "FlowOperationId")]
        getter flow_operation_id : String?

        # Returns the status of the flow operation. This string is returned in the responses to start, list,
        # and describe commands. If the status is COMPLETED_WITH_ERRORS , results may be returned with any
        # number of Flows missing from the response. If the status is FAILED , Flows returned will be empty.
        @[JSON::Field(key: "FlowOperationStatus")]
        getter flow_operation_status : String?

        def initialize(
          @firewall_arn : String? = nil,
          @flow_operation_id : String? = nil,
          @flow_operation_status : String? = nil
        )
        end
      end

      # Configuration settings for the handling of the stateful rule groups in a firewall policy.
      struct StatefulEngineOptions
        include JSON::Serializable

        # Configures the amount of time that can pass without any traffic sent through the firewall before the
        # firewall determines that the connection is idle.
        @[JSON::Field(key: "FlowTimeouts")]
        getter flow_timeouts : Types::FlowTimeouts?

        # Indicates how to manage the order of stateful rule evaluation for the policy. STRICT_ORDER is the
        # recommended option, but DEFAULT_ACTION_ORDER is the default option. With STRICT_ORDER , provide your
        # rules in the order that you want them to be evaluated. You can then choose one or more default
        # actions for packets that don't match any rules. Choose STRICT_ORDER to have the stateful rules
        # engine determine the evaluation order of your rules. The default action for this rule order is PASS
        # , followed by DROP , REJECT , and ALERT actions. Stateful rules are provided to the rule engine as
        # Suricata compatible strings, and Suricata evaluates them based on your settings. For more
        # information, see Evaluation order for stateful rules in the Network Firewall Developer Guide .
        @[JSON::Field(key: "RuleOrder")]
        getter rule_order : String?

        # Configures how Network Firewall processes traffic when a network connection breaks midstream.
        # Network connections can break due to disruptions in external networks or within the firewall itself.
        # DROP - Network Firewall fails closed and drops all subsequent traffic going to the firewall. This is
        # the default behavior. CONTINUE - Network Firewall continues to apply rules to the subsequent traffic
        # without context from traffic before the break. This impacts the behavior of rules that depend on
        # this context. For example, if you have a stateful rule to drop http traffic, Network Firewall won't
        # match the traffic for this rule because the service won't have the context from session
        # initialization defining the application layer protocol as HTTP. However, this behavior is rule
        # dependent—a TCP-layer rule using a flow:stateless rule would still match, as would the
        # aws:drop_strict default action. REJECT - Network Firewall fails closed and drops all subsequent
        # traffic going to the firewall. Network Firewall also sends a TCP reject packet back to your client
        # so that the client can immediately establish a new session. Network Firewall will have context about
        # the new session and will apply rules to the subsequent traffic.
        @[JSON::Field(key: "StreamExceptionPolicy")]
        getter stream_exception_policy : String?

        def initialize(
          @flow_timeouts : Types::FlowTimeouts? = nil,
          @rule_order : String? = nil,
          @stream_exception_policy : String? = nil
        )
        end
      end

      # A single Suricata rules specification, for use in a stateful rule group. Use this option to specify
      # a simple Suricata rule with protocol, source and destination, ports, direction, and rule options.
      # For information about the Suricata Rules format, see Rules Format .
      struct StatefulRule
        include JSON::Serializable

        # Defines what Network Firewall should do with the packets in a traffic flow when the flow matches the
        # stateful rule criteria. For all actions, Network Firewall performs the specified action and
        # discontinues stateful inspection of the traffic flow. The actions for a stateful rule are defined as
        # follows: PASS - Permits the packets to go to the intended destination. DROP - Blocks the packets
        # from going to the intended destination and sends an alert log message, if alert logging is
        # configured in the Firewall LoggingConfiguration . ALERT - Sends an alert log message, if alert
        # logging is configured in the Firewall LoggingConfiguration . You can use this action to test a rule
        # that you intend to use to drop traffic. You can enable the rule with ALERT action, verify in the
        # logs that the rule is filtering as you want, then change the action to DROP . REJECT - Drops traffic
        # that matches the conditions of the stateful rule, and sends a TCP reset packet back to sender of the
        # packet. A TCP reset packet is a packet with no payload and an RST bit contained in the TCP header
        # flags. REJECT is available only for TCP traffic. This option doesn't support FTP or IMAP protocols.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The stateful inspection criteria for this rule, used to inspect traffic flows.
        @[JSON::Field(key: "Header")]
        getter header : Types::Header

        # Additional options for the rule. These are the Suricata RuleOptions settings.
        @[JSON::Field(key: "RuleOptions")]
        getter rule_options : Array(Types::RuleOption)

        def initialize(
          @action : String,
          @header : Types::Header,
          @rule_options : Array(Types::RuleOption)
        )
        end
      end

      # The setting that allows the policy owner to change the behavior of the rule group within a policy.
      struct StatefulRuleGroupOverride
        include JSON::Serializable

        # The action that changes the rule group from DROP to ALERT . This only applies to managed rule
        # groups.
        @[JSON::Field(key: "Action")]
        getter action : String?

        def initialize(
          @action : String? = nil
        )
        end
      end

      # Identifier for a single stateful rule group, used in a firewall policy to refer to a rule group.
      struct StatefulRuleGroupReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the stateful rule group.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Network Firewall plans to augment the active threat defense managed rule group with an additional
        # deep threat inspection capability. When this capability is released, Amazon Web Services will
        # analyze service logs of network traffic processed by these rule groups to identify threat indicators
        # across customers. Amazon Web Services will use these threat indicators to improve the active threat
        # defense managed rule groups and protect the security of Amazon Web Services customers and services.
        # Customers can opt-out of deep threat inspection at any time through the Network Firewall console or
        # API. When customers opt out, Network Firewall will not use the network traffic processed by those
        # customers' active threat defense rule groups for rule group improvement.
        @[JSON::Field(key: "DeepThreatInspection")]
        getter deep_threat_inspection : Bool?

        # The action that allows the policy owner to override the behavior of the rule group within a policy.
        @[JSON::Field(key: "Override")]
        getter override : Types::StatefulRuleGroupOverride?

        # An integer setting that indicates the order in which to run the stateful rule groups in a single
        # FirewallPolicy . This setting only applies to firewall policies that specify the STRICT_ORDER rule
        # order in the stateful engine options settings. Network Firewall evalutes each stateful rule group
        # against a packet starting with the group that has the lowest priority setting. You must ensure that
        # the priority settings are unique within each policy. You can change the priority settings of your
        # rule groups at any time. To make it easier to insert rule groups later, number them so there's a
        # wide range in between, for example use 100, 200, and so on.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        def initialize(
          @resource_arn : String,
          @deep_threat_inspection : Bool? = nil,
          @override : Types::StatefulRuleGroupOverride? = nil,
          @priority : Int32? = nil
        )
        end
      end

      # Additional options governing how Network Firewall handles the rule group. You can only use these for
      # stateful rule groups.
      struct StatefulRuleOptions
        include JSON::Serializable

        # Indicates how to manage the order of the rule evaluation for the rule group. DEFAULT_ACTION_ORDER is
        # the default behavior. Stateful rules are provided to the rule engine as Suricata compatible strings,
        # and Suricata evaluates them based on certain settings. For more information, see Evaluation order
        # for stateful rules in the Network Firewall Developer Guide .
        @[JSON::Field(key: "RuleOrder")]
        getter rule_order : String?

        def initialize(
          @rule_order : String? = nil
        )
        end
      end

      # A single stateless rule. This is used in StatelessRulesAndCustomActions .
      struct StatelessRule
        include JSON::Serializable

        # Indicates the order in which to run this rule relative to all of the rules that are defined for a
        # stateless rule group. Network Firewall evaluates the rules in a rule group starting with the lowest
        # priority setting. You must ensure that the priority settings are unique for the rule group. Each
        # stateless rule group uses exactly one StatelessRulesAndCustomActions object, and each
        # StatelessRulesAndCustomActions contains exactly one StatelessRules object. To ensure unique priority
        # settings for your rule groups, set unique priorities for the stateless rules that you define inside
        # any single StatelessRules object. You can change the priority settings of your rules at any time. To
        # make it easier to insert rules later, number them so there's a wide range in between, for example
        # use 100, 200, and so on.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # Defines the stateless 5-tuple packet inspection criteria and the action to take on a packet that
        # matches the criteria.
        @[JSON::Field(key: "RuleDefinition")]
        getter rule_definition : Types::RuleDefinition

        def initialize(
          @priority : Int32,
          @rule_definition : Types::RuleDefinition
        )
        end
      end

      # Identifier for a single stateless rule group, used in a firewall policy to refer to the rule group.
      struct StatelessRuleGroupReference
        include JSON::Serializable

        # An integer setting that indicates the order in which to run the stateless rule groups in a single
        # FirewallPolicy . Network Firewall applies each stateless rule group to a packet starting with the
        # group that has the lowest priority setting. You must ensure that the priority settings are unique
        # within each policy.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The Amazon Resource Name (ARN) of the stateless rule group.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @priority : Int32,
          @resource_arn : String
        )
        end
      end

      # Stateless inspection criteria. Each stateless rule group uses exactly one of these data types to
      # define its stateless rules.
      struct StatelessRulesAndCustomActions
        include JSON::Serializable

        # Defines the set of stateless rules for use in a stateless rule group.
        @[JSON::Field(key: "StatelessRules")]
        getter stateless_rules : Array(Types::StatelessRule)

        # Defines an array of individual custom action definitions that are available for use by the stateless
        # rules in this StatelessRulesAndCustomActions specification. You name each custom action that you
        # define, and then you can use it by name in your StatelessRule RuleDefinition Actions specification.
        @[JSON::Field(key: "CustomActions")]
        getter custom_actions : Array(Types::CustomAction)?

        def initialize(
          @stateless_rules : Array(Types::StatelessRule),
          @custom_actions : Array(Types::CustomAction)? = nil
        )
        end
      end

      # The ID for a subnet that's used in an association with a firewall. This is used in CreateFirewall ,
      # AssociateSubnets , and CreateVpcEndpointAssociation . Network Firewall creates an instance of the
      # associated firewall in each subnet that you specify, to filter traffic in the subnet's Availability
      # Zone.
      struct SubnetMapping
        include JSON::Serializable

        # The unique identifier for the subnet.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # The subnet's IP address type. You can't change the IP address type after you create the subnet.
        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : String?

        def initialize(
          @subnet_id : String,
          @ip_address_type : String? = nil
        )
        end
      end

      # A complex type containing summaries of security protections provided by a rule group. Network
      # Firewall extracts this information from selected fields in the rule group's Suricata rules, based on
      # your SummaryConfiguration settings.
      struct Summary
        include JSON::Serializable

        # An array of RuleSummary objects containing individual rule details that had been configured by the
        # rulegroup's SummaryConfiguration.
        @[JSON::Field(key: "RuleSummaries")]
        getter rule_summaries : Array(Types::RuleSummary)?

        def initialize(
          @rule_summaries : Array(Types::RuleSummary)? = nil
        )
        end
      end

      # A complex type that specifies which Suricata rule metadata fields to use when displaying threat
      # information. Contains: RuleOptions - The Suricata rule options fields to extract and display These
      # settings affect how threat information appears in both the console and API responses. Summaries are
      # available for rule groups you manage and for active threat defense Amazon Web Services managed rule
      # groups.
      struct SummaryConfiguration
        include JSON::Serializable

        # Specifies the selected rule options returned by DescribeRuleGroupSummary .
        @[JSON::Field(key: "RuleOptions")]
        getter rule_options : Array(String)?

        def initialize(
          @rule_options : Array(String)? = nil
        )
        end
      end

      # The status of the firewall endpoint and firewall policy configuration for a single VPC subnet. This
      # is part of the FirewallStatus . For each VPC subnet that you associate with a firewall, Network
      # Firewall does the following: Instantiates a firewall endpoint in the subnet, ready to take traffic.
      # Configures the endpoint with the current firewall policy settings, to provide the filtering behavior
      # for the endpoint. When you update a firewall, for example to add a subnet association or change a
      # rule group in the firewall policy, the affected sync states reflect out-of-sync or not ready status
      # until the changes are complete.
      struct SyncState
        include JSON::Serializable

        # The configuration and status for a single firewall subnet. For each configured subnet, Network
        # Firewall creates the attachment by instantiating the firewall endpoint in the subnet so that it's
        # ready to take traffic.
        @[JSON::Field(key: "Attachment")]
        getter attachment : Types::Attachment?

        # The configuration status of the firewall endpoint in a single VPC subnet. Network Firewall provides
        # each endpoint with the rules that are configured in the firewall policy. Each time you add a subnet
        # or modify the associated firewall policy, Network Firewall synchronizes the rules in the endpoint,
        # so it can properly filter network traffic.
        @[JSON::Field(key: "Config")]
        getter config : Hash(String, Types::PerObjectStatus)?

        def initialize(
          @attachment : Types::Attachment? = nil,
          @config : Hash(String, Types::PerObjectStatus)? = nil
        )
        end
      end

      # TCP flags and masks to inspect packets for, used in stateless rules MatchAttributes settings.
      struct TCPFlagField
        include JSON::Serializable

        # Used in conjunction with the Masks setting to define the flags that must be set and flags that must
        # not be set in order for the packet to match. This setting can only specify values that are also
        # specified in the Masks setting. For the flags that are specified in the masks setting, the following
        # must be true for the packet to match: The ones that are set in this flags setting must be set in the
        # packet. The ones that are not set in this flags setting must also not be set in the packet.
        @[JSON::Field(key: "Flags")]
        getter flags : Array(String)

        # The set of flags to consider in the inspection. To inspect all flags in the valid values list, leave
        # this with no setting.
        @[JSON::Field(key: "Masks")]
        getter masks : Array(String)?

        def initialize(
          @flags : Array(String),
          @masks : Array(String)? = nil
        )
        end
      end

      # The object that defines a TLS inspection configuration. This, along with
      # TLSInspectionConfigurationResponse , define the TLS inspection configuration. You can retrieve all
      # objects for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration . Network
      # Firewall uses a TLS inspection configuration to decrypt traffic. Network Firewall re-encrypts the
      # traffic before sending it to its destination. To use a TLS inspection configuration, you add it to a
      # new Network Firewall firewall policy, then you apply the firewall policy to a firewall. Network
      # Firewall acts as a proxy service to decrypt and inspect the traffic traveling through your
      # firewalls. You can reference a TLS inspection configuration from more than one firewall policy, and
      # you can use a firewall policy in more than one firewall. For more information about using TLS
      # inspection configurations, see Inspecting SSL/TLS traffic with TLS inspection configurations in the
      # Network Firewall Developer Guide .
      struct TLSInspectionConfiguration
        include JSON::Serializable

        # Lists the server certificate configurations that are associated with the TLS configuration.
        @[JSON::Field(key: "ServerCertificateConfigurations")]
        getter server_certificate_configurations : Array(Types::ServerCertificateConfiguration)?

        def initialize(
          @server_certificate_configurations : Array(Types::ServerCertificateConfiguration)? = nil
        )
        end
      end

      # High-level information about a TLS inspection configuration, returned by
      # ListTLSInspectionConfigurations . You can use the information provided in the metadata to retrieve
      # and manage a TLS configuration.
      struct TLSInspectionConfigurationMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the TLS inspection configuration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The high-level properties of a TLS inspection configuration. This, along with the
      # TLSInspectionConfiguration , define the TLS inspection configuration. You can retrieve all objects
      # for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration .
      struct TLSInspectionConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the TLS inspection configuration.
        @[JSON::Field(key: "TLSInspectionConfigurationArn")]
        getter tls_inspection_configuration_arn : String

        # A unique identifier for the TLS inspection configuration. This ID is returned in the responses to
        # create and list commands. You provide it to operations such as update and delete.
        @[JSON::Field(key: "TLSInspectionConfigurationId")]
        getter tls_inspection_configuration_id : String

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it.
        @[JSON::Field(key: "TLSInspectionConfigurationName")]
        getter tls_inspection_configuration_name : String

        @[JSON::Field(key: "CertificateAuthority")]
        getter certificate_authority : Types::TlsCertificateData?

        # A list of the certificates associated with the TLS inspection configuration.
        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::TlsCertificateData)?

        # A description of the TLS inspection configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains the Amazon Web Services KMS encryption configuration settings for your
        # TLS inspection configuration.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The last time that the TLS inspection configuration was changed.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The number of firewall policies that use this TLS inspection configuration.
        @[JSON::Field(key: "NumberOfAssociations")]
        getter number_of_associations : Int32?

        # Detailed information about the current status of a TLSInspectionConfiguration . You can retrieve
        # this for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration and providing
        # the TLS inspection configuration name and ARN.
        @[JSON::Field(key: "TLSInspectionConfigurationStatus")]
        getter tls_inspection_configuration_status : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tls_inspection_configuration_arn : String,
          @tls_inspection_configuration_id : String,
          @tls_inspection_configuration_name : String,
          @certificate_authority : Types::TlsCertificateData? = nil,
          @certificates : Array(Types::TlsCertificateData)? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @number_of_associations : Int32? = nil,
          @tls_inspection_configuration_status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A key:value pair associated with an Amazon Web Services resource. The key:value pair can be anything
      # you define. Typically, the tag key represents a category (such as "environment") and the tag value
      # represents a specific value within that category (such as "test," "development," or "production").
      # You can add up to 50 tags to each Amazon Web Services resource.
      struct Tag
        include JSON::Serializable

        # The part of the key:value pair that defines a tag. You can use a tag key to describe a category of
        # information, such as "customer." Tag keys are case-sensitive.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The part of the key:value pair that defines a tag. You can use a tag value to describe a specific
        # value within a category, such as "companyA" or "companyB." Tag values are case-sensitive.
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

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

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

      # Unable to process the request due to throttling limitations.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains metadata about an Certificate Manager certificate.
      struct TlsCertificateData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The serial number of the certificate.
        @[JSON::Field(key: "CertificateSerial")]
        getter certificate_serial : String?

        # The status of the certificate.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Contains details about the certificate status, including information about certificate errors.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_serial : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # TLS decryption on traffic to filter on attributes in the HTTP header.
      struct TlsInterceptProperties
        include JSON::Serializable

        # Private Certificate Authority (PCA) used to issue private TLS certificates so that the proxy can
        # present PCA-signed certificates which applications trust through the same root, establishing a
        # secure and consistent trust model for encrypted communication.
        @[JSON::Field(key: "PcaArn")]
        getter pca_arn : String?

        # Specifies whether to enable or disable TLS Intercept Mode.
        @[JSON::Field(key: "TlsInterceptMode")]
        getter tls_intercept_mode : String?

        def initialize(
          @pca_arn : String? = nil,
          @tls_intercept_mode : String? = nil
        )
        end
      end

      # This data type is used specifically for the CreateProxy and UpdateProxy APIs. TLS decryption on
      # traffic to filter on attributes in the HTTP header.
      struct TlsInterceptPropertiesRequest
        include JSON::Serializable

        # Private Certificate Authority (PCA) used to issue private TLS certificates so that the proxy can
        # present PCA-signed certificates which applications trust through the same root, establishing a
        # secure and consistent trust model for encrypted communication.
        @[JSON::Field(key: "PcaArn")]
        getter pca_arn : String?

        # Specifies whether to enable or disable TLS Intercept Mode.
        @[JSON::Field(key: "TlsInterceptMode")]
        getter tls_intercept_mode : String?

        def initialize(
          @pca_arn : String? = nil,
          @tls_intercept_mode : String? = nil
        )
        end
      end

      # Contains information about the synchronization state of a transit gateway attachment, including its
      # current status and any error messages. Network Firewall uses this to track the state of your transit
      # gateway configuration changes.
      struct TransitGatewayAttachmentSyncState
        include JSON::Serializable

        # The unique identifier of the transit gateway attachment.
        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # A message providing additional information about the current status, particularly useful when the
        # transit gateway attachment is in a non- READY state. Valid values are: CREATING - The attachment is
        # being created DELETING - The attachment is being deleted DELETED - The attachment has been deleted
        # FAILED - The attachment creation has failed and cannot be recovered ERROR - The attachment is in an
        # error state that might be recoverable READY - The attachment is active and processing traffic
        # PENDING_ACCEPTANCE - The attachment is waiting to be accepted REJECTING - The attachment is in the
        # process of being rejected REJECTED - The attachment has been rejected For information about
        # troubleshooting endpoint failures, see Troubleshooting firewall endpoint failures in the Network
        # Firewall Developer Guide .
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The current status of the transit gateway attachment. Valid values are: CREATING - The attachment is
        # being created DELETING - The attachment is being deleted DELETED - The attachment has been deleted
        # FAILED - The attachment creation has failed and cannot be recovered ERROR - The attachment is in an
        # error state that might be recoverable READY - The attachment is active and processing traffic
        # PENDING_ACCEPTANCE - The attachment is waiting to be accepted REJECTING - The attachment is in the
        # process of being rejected REJECTED - The attachment has been rejected
        @[JSON::Field(key: "TransitGatewayAttachmentStatus")]
        getter transit_gateway_attachment_status : String?

        def initialize(
          @attachment_id : String? = nil,
          @status_message : String? = nil,
          @transit_gateway_attachment_status : String? = nil
        )
        end
      end

      # A unique source IP address that connected to a domain.
      struct UniqueSources
        include JSON::Serializable

        # The number of unique source IP addresses that connected to a domain.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        def initialize(
          @count : Int32? = nil
        )
        end
      end

      # The operation you requested isn't supported by Network Firewall.
      struct UnsupportedOperationException
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

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

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

      struct UpdateAvailabilityZoneChangeProtectionRequest
        include JSON::Serializable

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "AvailabilityZoneChangeProtection")]
        getter availability_zone_change_protection : Bool

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_change_protection : Bool,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateAvailabilityZoneChangeProtectionResponse
        include JSON::Serializable

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "AvailabilityZoneChangeProtection")]
        getter availability_zone_change_protection : Bool?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @availability_zone_change_protection : Bool? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallAnalysisSettingsRequest
        include JSON::Serializable

        # An optional setting indicating the specific traffic analysis types to enable on the firewall.
        @[JSON::Field(key: "EnabledAnalysisTypes")]
        getter enabled_analysis_types : Array(String)?

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @enabled_analysis_types : Array(String)? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallAnalysisSettingsResponse
        include JSON::Serializable

        # An optional setting indicating the specific traffic analysis types to enable on the firewall.
        @[JSON::Field(key: "EnabledAnalysisTypes")]
        getter enabled_analysis_types : Array(String)?

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @enabled_analysis_types : Array(String)? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallDeleteProtectionRequest
        include JSON::Serializable

        # A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that
        # the firewall is protected against deletion. Use this setting to protect against accidentally
        # deleting a firewall that is in use. When you create a firewall, the operation initializes this flag
        # to TRUE .
        @[JSON::Field(key: "DeleteProtection")]
        getter delete_protection : Bool

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @delete_protection : Bool,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallDeleteProtectionResponse
        include JSON::Serializable

        # A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that
        # the firewall is protected against deletion. Use this setting to protect against accidentally
        # deleting a firewall that is in use. When you create a firewall, the operation initializes this flag
        # to TRUE .
        @[JSON::Field(key: "DeleteProtection")]
        getter delete_protection : Bool?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @delete_protection : Bool? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallDescriptionRequest
        include JSON::Serializable

        # The new description for the firewall. If you omit this setting, Network Firewall removes the
        # description for the firewall.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @description : String? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallDescriptionResponse
        include JSON::Serializable

        # A description of the firewall.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @description : String? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallEncryptionConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallEncryptionConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallPolicyChangeProtectionRequest
        include JSON::Serializable

        # A setting indicating whether the firewall is protected against a change to the firewall policy
        # association. Use this setting to protect against accidentally modifying the firewall policy for a
        # firewall that is in use. When you create a firewall, the operation initializes this setting to TRUE
        # .
        @[JSON::Field(key: "FirewallPolicyChangeProtection")]
        getter firewall_policy_change_protection : Bool

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_policy_change_protection : Bool,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallPolicyChangeProtectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # A setting indicating whether the firewall is protected against a change to the firewall policy
        # association. Use this setting to protect against accidentally modifying the firewall policy for a
        # firewall that is in use. When you create a firewall, the operation initializes this setting to TRUE
        # .
        @[JSON::Field(key: "FirewallPolicyChangeProtection")]
        getter firewall_policy_change_protection : Bool?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @firewall_policy_change_protection : Bool? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateFirewallPolicyRequest
        include JSON::Serializable

        # The updated firewall policy to use for the firewall. You can't add or remove a
        # TLSInspectionConfiguration after you create a firewall policy. However, you can replace an existing
        # TLS inspection configuration with another TLSInspectionConfiguration .
        @[JSON::Field(key: "FirewallPolicy")]
        getter firewall_policy : Types::FirewallPolicy

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the firewall policy. The token marks the state of the policy resource at the time of the request. To
        # make changes to the policy, you provide the token in your request. Network Firewall uses the token
        # to ensure that the policy hasn't changed since you last retrieved it. If it has changed, the
        # operation fails with an InvalidTokenException . If this happens, retrieve the firewall policy again
        # to get a current copy of it with current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # A description of the firewall policy.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether you want Network Firewall to just check the validity of the request, rather than
        # run the request. If set to TRUE , Network Firewall checks whether the request can run successfully,
        # but doesn't actually make the requested changes. The call returns the value that the request would
        # return if you ran it with dry run set to FALSE , but doesn't make additions or changes to your
        # resources. This option allows you to make sure that you have the required permissions to run the
        # request and that your request parameters are valid. If set to FALSE , Network Firewall makes the
        # requested changes to your resources.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # A complex type that contains settings for encryption of your firewall policy resources.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of the firewall policy. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "FirewallPolicyArn")]
        getter firewall_policy_arn : String?

        # The descriptive name of the firewall policy. You can't change the name of a firewall policy after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String?

        def initialize(
          @firewall_policy : Types::FirewallPolicy,
          @update_token : String,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @firewall_policy_arn : String? = nil,
          @firewall_policy_name : String? = nil
        )
        end
      end

      struct UpdateFirewallPolicyResponse
        include JSON::Serializable

        # The high-level properties of a firewall policy. This, along with the FirewallPolicy , define the
        # policy. You can retrieve all objects for a firewall policy by calling DescribeFirewallPolicy .
        @[JSON::Field(key: "FirewallPolicyResponse")]
        getter firewall_policy_response : Types::FirewallPolicyResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the firewall policy. The token marks the state of the policy resource at the time of the request. To
        # make changes to the policy, you provide the token in your request. Network Firewall uses the token
        # to ensure that the policy hasn't changed since you last retrieved it. If it has changed, the
        # operation fails with an InvalidTokenException . If this happens, retrieve the firewall policy again
        # to get a current copy of it with current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @firewall_policy_response : Types::FirewallPolicyResponse,
          @update_token : String
        )
        end
      end

      struct UpdateLoggingConfigurationRequest
        include JSON::Serializable

        # A boolean that lets you enable or disable the detailed firewall monitoring dashboard on the
        # firewall. The monitoring dashboard provides comprehensive visibility into your firewall's flow logs
        # and alert logs. After you enable detailed monitoring, you can access these dashboards directly from
        # the Monitoring page of the Network Firewall console. Specify TRUE to enable the the detailed
        # monitoring dashboard on the firewall. Specify FALSE to disable the the detailed monitoring dashboard
        # on the firewall.
        @[JSON::Field(key: "EnableMonitoringDashboard")]
        getter enable_monitoring_dashboard : Bool?

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # Defines how Network Firewall performs logging for a firewall. If you omit this setting, Network
        # Firewall disables logging for the firewall.
        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @enable_monitoring_dashboard : Bool? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end

      struct UpdateLoggingConfigurationResponse
        include JSON::Serializable

        # A boolean that reflects whether or not the firewall monitoring dashboard is enabled on a firewall.
        # Returns TRUE when the firewall monitoring dashboard is enabled on the firewall. Returns FALSE when
        # the firewall monitoring dashboard is not enabled on the firewall.
        @[JSON::Field(key: "EnableMonitoringDashboard")]
        getter enable_monitoring_dashboard : Bool?

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @enable_monitoring_dashboard : Bool? = nil,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end

      struct UpdateProxyConfigurationRequest
        include JSON::Serializable

        # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
        # where the rule match is applied.
        @[JSON::Field(key: "DefaultRulePhaseActions")]
        getter default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @default_rule_phase_actions : Types::ProxyConfigDefaultRulePhaseActionsRequest,
          @update_token : String,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct UpdateProxyConfigurationResponse
        include JSON::Serializable

        # The updated proxy configuration resource that reflects the updates from the request.
        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateProxyRequest
        include JSON::Serializable

        # The NAT Gateway the proxy is attached to.
        @[JSON::Field(key: "NatGatewayId")]
        getter nat_gateway_id : String

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy. The token marks the state of the proxy resource at the time of the request. To make
        # changes to the proxy, you provide the token in your request. Network Firewall uses the token to
        # ensure that the proxy hasn't changed since you last retrieved it. If it has changed, the operation
        # fails with an InvalidTokenException . If this happens, retrieve the proxy again to get a current
        # copy of it with a current token. Reapply your changes as needed, then try the operation again using
        # the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # Listener properties for HTTP and HTTPS traffic to add.
        @[JSON::Field(key: "ListenerPropertiesToAdd")]
        getter listener_properties_to_add : Array(Types::ListenerPropertyRequest)?

        # Listener properties for HTTP and HTTPS traffic to remove.
        @[JSON::Field(key: "ListenerPropertiesToRemove")]
        getter listener_properties_to_remove : Array(Types::ListenerPropertyRequest)?

        # The Amazon Resource Name (ARN) of a proxy. You must specify the ARN or the name, and you can specify
        # both.
        @[JSON::Field(key: "ProxyArn")]
        getter proxy_arn : String?

        # The descriptive name of the proxy. You can't change the name of a proxy after you create it. You
        # must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyName")]
        getter proxy_name : String?

        # TLS decryption on traffic to filter on attributes in the HTTP header.
        @[JSON::Field(key: "TlsInterceptProperties")]
        getter tls_intercept_properties : Types::TlsInterceptPropertiesRequest?

        def initialize(
          @nat_gateway_id : String,
          @update_token : String,
          @listener_properties_to_add : Array(Types::ListenerPropertyRequest)? = nil,
          @listener_properties_to_remove : Array(Types::ListenerPropertyRequest)? = nil,
          @proxy_arn : String? = nil,
          @proxy_name : String? = nil,
          @tls_intercept_properties : Types::TlsInterceptPropertiesRequest? = nil
        )
        end
      end

      struct UpdateProxyResponse
        include JSON::Serializable

        # The updated proxy resource that reflects the updates from the request.
        @[JSON::Field(key: "Proxy")]
        getter proxy : Types::Proxy?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy. The token marks the state of the proxy resource at the time of the request. To make
        # changes to the proxy, you provide the token in your request. Network Firewall uses the token to
        # ensure that the proxy hasn't changed since you last retrieved it. If it has changed, the operation
        # fails with an InvalidTokenException . If this happens, retrieve the proxy again to get a current
        # copy of it with a current token. Reapply your changes as needed, then try the operation again using
        # the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy : Types::Proxy? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateProxyRuleGroupPrioritiesRequest
        include JSON::Serializable

        # proxy rule group resources to update to new positions.
        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::ProxyRuleGroupPriority)

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The Amazon Resource Name (ARN) of a proxy configuration. You must specify the ARN or the name, and
        # you can specify both.
        @[JSON::Field(key: "ProxyConfigurationArn")]
        getter proxy_configuration_arn : String?

        # The descriptive name of the proxy configuration. You can't change the name of a proxy configuration
        # after you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyConfigurationName")]
        getter proxy_configuration_name : String?

        def initialize(
          @rule_groups : Array(Types::ProxyRuleGroupPriority),
          @update_token : String,
          @proxy_configuration_arn : String? = nil,
          @proxy_configuration_name : String? = nil
        )
        end
      end

      struct UpdateProxyRuleGroupPrioritiesResponse
        include JSON::Serializable

        # The updated proxy rule group hierarchy that reflects the updates from the request.
        @[JSON::Field(key: "ProxyRuleGroups")]
        getter proxy_rule_groups : Array(Types::ProxyRuleGroupPriorityResult)?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy configuration. The token marks the state of the proxy configuration resource at the time
        # of the request. To make changes to the proxy configuration, you provide the token in your request.
        # Network Firewall uses the token to ensure that the proxy configuration hasn't changed since you last
        # retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the proxy configuration again to get a current copy of it with a current token.
        # Reapply your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule_groups : Array(Types::ProxyRuleGroupPriorityResult)? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateProxyRulePrioritiesRequest
        include JSON::Serializable

        # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
        # where the rule match is applied.
        @[JSON::Field(key: "RuleGroupRequestPhase")]
        getter rule_group_request_phase : String

        # proxy rule resources to update to new positions.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ProxyRulePriority)

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule group. The token marks the state of the proxy rule group resource at the time of the
        # request. To make changes to the proxy rule group, you provide the token in your request. Network
        # Firewall uses the token to ensure that the proxy rule group hasn't changed since you last retrieved
        # it. If it has changed, the operation fails with an InvalidTokenException . If this happens, retrieve
        # the proxy rule group again to get a current copy of it with a current token. Reapply your changes as
        # needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        def initialize(
          @rule_group_request_phase : String,
          @rules : Array(Types::ProxyRulePriority),
          @update_token : String,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil
        )
        end
      end

      struct UpdateProxyRulePrioritiesResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a proxy rule group.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        # Evaluation points in the traffic flow where rules are applied. There are three phases in a traffic
        # where the rule match is applied.
        @[JSON::Field(key: "RuleGroupRequestPhase")]
        getter rule_group_request_phase : String?

        # The updated proxy rule hierarchy that reflects the updates from the request.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ProxyRulePriority)?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule group. The token marks the state of the proxy rule group resource at the time of the
        # request. To make changes to the proxy rule group, you provide the token in your request. Network
        # Firewall uses the token to ensure that the proxy rule group hasn't changed since you last retrieved
        # it. If it has changed, the operation fails with an InvalidTokenException . If this happens, retrieve
        # the proxy rule group again to get a current copy of it with a current token. Reapply your changes as
        # needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil,
          @rule_group_request_phase : String? = nil,
          @rules : Array(Types::ProxyRulePriority)? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateProxyRuleRequest
        include JSON::Serializable

        # The descriptive name of the proxy rule. You can't change the name of a proxy rule after you create
        # it.
        @[JSON::Field(key: "ProxyRuleName")]
        getter proxy_rule_name : String

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule. The token marks the state of the proxy rule resource at the time of the request. To
        # make changes to the proxy rule, you provide the token in your request. Network Firewall uses the
        # token to ensure that the proxy rule hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the proxy rule again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # Depending on the match action, the proxy either stops the evaluation (if the action is terminal -
        # allow or deny), or continues it (if the action is alert) until it matches a rule with a terminal
        # action.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Proxy rule conditions to add. Match criteria that specify what traffic attributes to examine.
        # Conditions include operators (StringEquals, StringLike) and values to match against.
        @[JSON::Field(key: "AddConditions")]
        getter add_conditions : Array(Types::ProxyRuleCondition)?

        # A description of the proxy rule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of a proxy rule group. You must specify the ARN or the name, and you
        # can specify both.
        @[JSON::Field(key: "ProxyRuleGroupArn")]
        getter proxy_rule_group_arn : String?

        # The descriptive name of the proxy rule group. You can't change the name of a proxy rule group after
        # you create it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "ProxyRuleGroupName")]
        getter proxy_rule_group_name : String?

        # Proxy rule conditions to remove. Match criteria that specify what traffic attributes to examine.
        # Conditions include operators (StringEquals, StringLike) and values to match against.
        @[JSON::Field(key: "RemoveConditions")]
        getter remove_conditions : Array(Types::ProxyRuleCondition)?

        def initialize(
          @proxy_rule_name : String,
          @update_token : String,
          @action : String? = nil,
          @add_conditions : Array(Types::ProxyRuleCondition)? = nil,
          @description : String? = nil,
          @proxy_rule_group_arn : String? = nil,
          @proxy_rule_group_name : String? = nil,
          @remove_conditions : Array(Types::ProxyRuleCondition)? = nil
        )
        end
      end

      struct UpdateProxyRuleResponse
        include JSON::Serializable

        # The updated proxy rule resource that reflects the updates from the request.
        @[JSON::Field(key: "ProxyRule")]
        getter proxy_rule : Types::ProxyRule?

        # Proxy rule conditions removed from the rule.
        @[JSON::Field(key: "RemovedConditions")]
        getter removed_conditions : Array(Types::ProxyRuleCondition)?

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the proxy rule. The token marks the state of the proxy rule resource at the time of the request. To
        # make changes to the proxy rule, you provide the token in your request. Network Firewall uses the
        # token to ensure that the proxy rule hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the proxy rule again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @proxy_rule : Types::ProxyRule? = nil,
          @removed_conditions : Array(Types::ProxyRuleCondition)? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateRuleGroupRequest
        include JSON::Serializable

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the rule group. The token marks the state of the rule group resource at the time of the request. To
        # make changes to the rule group, you provide the token in your request. Network Firewall uses the
        # token to ensure that the rule group hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the rule group again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # Indicates whether you want Network Firewall to analyze the stateless rules in the rule group for
        # rule behavior such as asymmetric routing. If set to TRUE , Network Firewall runs the analysis and
        # then updates the rule group for you. To run the stateless rule group analyzer without updating the
        # rule group, set DryRun to TRUE .
        @[JSON::Field(key: "AnalyzeRuleGroup")]
        getter analyze_rule_group : Bool?

        # A description of the rule group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether you want Network Firewall to just check the validity of the request, rather than
        # run the request. If set to TRUE , Network Firewall checks whether the request can run successfully,
        # but doesn't actually make the requested changes. The call returns the value that the request would
        # return if you ran it with dry run set to FALSE , but doesn't make additions or changes to your
        # resources. This option allows you to make sure that you have the required permissions to run the
        # request and that your request parameters are valid. If set to FALSE , Network Firewall makes the
        # requested changes to your resources.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # A complex type that contains settings for encryption of your rule group resources.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # An object that defines the rule group rules. You must provide either this rule group setting or a
        # Rules setting, but not both.
        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        # The Amazon Resource Name (ARN) of the rule group. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "RuleGroupArn")]
        getter rule_group_arn : String?

        # The descriptive name of the rule group. You can't change the name of a rule group after you create
        # it. You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        # A string containing stateful rule group rules specifications in Suricata flat format, with one rule
        # per line. Use this to import your existing Suricata compatible rule groups. You must provide either
        # this rules setting or a populated RuleGroup setting, but not both. You can provide your rule group
        # specification in Suricata flat format through this setting when you create or update your rule
        # group. The call response returns a RuleGroup object that Network Firewall has populated from your
        # string.
        @[JSON::Field(key: "Rules")]
        getter rules : String?

        # A complex type that contains metadata about the rule group that your own rule group is copied from.
        # You can use the metadata to keep track of updates made to the originating rule group.
        @[JSON::Field(key: "SourceMetadata")]
        getter source_metadata : Types::SourceMetadata?

        # Updates the selected summary configuration for a rule group. Changes affect subsequent responses
        # from DescribeRuleGroupSummary .
        @[JSON::Field(key: "SummaryConfiguration")]
        getter summary_configuration : Types::SummaryConfiguration?

        # Indicates whether the rule group is stateless or stateful. If the rule group is stateless, it
        # contains stateless rules. If it is stateful, it contains stateful rules. This setting is required
        # for requests that do not include the RuleGroupARN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @update_token : String,
          @analyze_rule_group : Bool? = nil,
          @description : String? = nil,
          @dry_run : Bool? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @rule_group : Types::RuleGroup? = nil,
          @rule_group_arn : String? = nil,
          @rule_group_name : String? = nil,
          @rules : String? = nil,
          @source_metadata : Types::SourceMetadata? = nil,
          @summary_configuration : Types::SummaryConfiguration? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateRuleGroupResponse
        include JSON::Serializable

        # The high-level properties of a rule group. This, along with the RuleGroup , define the rule group.
        # You can retrieve all objects for a rule group by calling DescribeRuleGroup .
        @[JSON::Field(key: "RuleGroupResponse")]
        getter rule_group_response : Types::RuleGroupResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the rule group. The token marks the state of the rule group resource at the time of the request. To
        # make changes to the rule group, you provide the token in your request. Network Firewall uses the
        # token to ensure that the rule group hasn't changed since you last retrieved it. If it has changed,
        # the operation fails with an InvalidTokenException . If this happens, retrieve the rule group again
        # to get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @rule_group_response : Types::RuleGroupResponse,
          @update_token : String
        )
        end
      end

      struct UpdateSubnetChangeProtectionRequest
        include JSON::Serializable

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "SubnetChangeProtection")]
        getter subnet_change_protection : Bool

        # The Amazon Resource Name (ARN) of the firewall. You must specify the ARN or the name, and you can
        # specify both.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        # You must specify the ARN or the name, and you can specify both.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @subnet_change_protection : Bool,
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateSubnetChangeProtectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String?

        # The descriptive name of the firewall. You can't change the name of a firewall after you create it.
        @[JSON::Field(key: "FirewallName")]
        getter firewall_name : String?

        # A setting indicating whether the firewall is protected against changes to the subnet associations.
        # Use this setting to protect against accidentally modifying the subnet associations for a firewall
        # that is in use. When you create a firewall, the operation initializes this setting to TRUE .
        @[JSON::Field(key: "SubnetChangeProtection")]
        getter subnet_change_protection : Bool?

        # An optional token that you can use for optimistic locking. Network Firewall returns a token to your
        # requests that access the firewall. The token marks the state of the firewall resource at the time of
        # the request. To make an unconditional change to the firewall, omit the token in your update request.
        # Without the token, Network Firewall performs your updates regardless of whether the firewall has
        # changed since you last retrieved it. To make a conditional change to the firewall, provide the token
        # in your update request. Network Firewall uses the token to ensure that the firewall hasn't changed
        # since you last retrieved it. If it has changed, the operation fails with an InvalidTokenException .
        # If this happens, retrieve the firewall again to get a current copy of it with a new token. Reapply
        # your changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @firewall_arn : String? = nil,
          @firewall_name : String? = nil,
          @subnet_change_protection : Bool? = nil,
          @update_token : String? = nil
        )
        end
      end

      struct UpdateTLSInspectionConfigurationRequest
        include JSON::Serializable

        # The object that defines a TLS inspection configuration. This, along with
        # TLSInspectionConfigurationResponse , define the TLS inspection configuration. You can retrieve all
        # objects for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration . Network
        # Firewall uses a TLS inspection configuration to decrypt traffic. Network Firewall re-encrypts the
        # traffic before sending it to its destination. To use a TLS inspection configuration, you add it to a
        # new Network Firewall firewall policy, then you apply the firewall policy to a firewall. Network
        # Firewall acts as a proxy service to decrypt and inspect the traffic traveling through your
        # firewalls. You can reference a TLS inspection configuration from more than one firewall policy, and
        # you can use a firewall policy in more than one firewall. For more information about using TLS
        # inspection configurations, see Inspecting SSL/TLS traffic with TLS inspection configurations in the
        # Network Firewall Developer Guide .
        @[JSON::Field(key: "TLSInspectionConfiguration")]
        getter tls_inspection_configuration : Types::TLSInspectionConfiguration

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the TLS inspection configuration. The token marks the state of the TLS inspection configuration
        # resource at the time of the request. To make changes to the TLS inspection configuration, you
        # provide the token in your request. Network Firewall uses the token to ensure that the TLS inspection
        # configuration hasn't changed since you last retrieved it. If it has changed, the operation fails
        # with an InvalidTokenException . If this happens, retrieve the TLS inspection configuration again to
        # get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        # A description of the TLS inspection configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains the Amazon Web Services KMS encryption configuration settings for your
        # TLS inspection configuration.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of the TLS inspection configuration.
        @[JSON::Field(key: "TLSInspectionConfigurationArn")]
        getter tls_inspection_configuration_arn : String?

        # The descriptive name of the TLS inspection configuration. You can't change the name of a TLS
        # inspection configuration after you create it.
        @[JSON::Field(key: "TLSInspectionConfigurationName")]
        getter tls_inspection_configuration_name : String?

        def initialize(
          @tls_inspection_configuration : Types::TLSInspectionConfiguration,
          @update_token : String,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tls_inspection_configuration_arn : String? = nil,
          @tls_inspection_configuration_name : String? = nil
        )
        end
      end

      struct UpdateTLSInspectionConfigurationResponse
        include JSON::Serializable

        # The high-level properties of a TLS inspection configuration. This, along with the
        # TLSInspectionConfiguration , define the TLS inspection configuration. You can retrieve all objects
        # for a TLS inspection configuration by calling DescribeTLSInspectionConfiguration .
        @[JSON::Field(key: "TLSInspectionConfigurationResponse")]
        getter tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse

        # A token used for optimistic locking. Network Firewall returns a token to your requests that access
        # the TLS inspection configuration. The token marks the state of the TLS inspection configuration
        # resource at the time of the request. To make changes to the TLS inspection configuration, you
        # provide the token in your request. Network Firewall uses the token to ensure that the TLS inspection
        # configuration hasn't changed since you last retrieved it. If it has changed, the operation fails
        # with an InvalidTokenException . If this happens, retrieve the TLS inspection configuration again to
        # get a current copy of it with a current token. Reapply your changes as needed, then try the
        # operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String

        def initialize(
          @tls_inspection_configuration_response : Types::TLSInspectionConfigurationResponse,
          @update_token : String
        )
        end
      end

      # A VPC endpoint association defines a single subnet to use for a firewall endpoint for a Firewall .
      # You can define VPC endpoint associations only in the Availability Zones that already have a subnet
      # mapping defined in the Firewall resource. You can retrieve the list of Availability Zones that are
      # available for use by calling DescribeFirewallMetadata . To manage firewall endpoints, first, in the
      # Firewall specification, you specify a single VPC and one subnet for each of the Availability Zones
      # where you want to use the firewall. Then you can define additional endpoints as VPC endpoint
      # associations. You can use VPC endpoint associations to expand the protections of the firewall as
      # follows: Protect multiple VPCs with a single firewall - You can use the firewall to protect other
      # VPCs, either in your account or in accounts where the firewall is shared. You can only specify
      # Availability Zones that already have a firewall endpoint defined in the Firewall subnet mappings.
      # Define multiple firewall endpoints for a VPC in an Availability Zone - You can create additional
      # firewall endpoints for the VPC that you have defined in the firewall, in any Availability Zone that
      # already has an endpoint defined in the Firewall subnet mappings. You can create multiple VPC
      # endpoint associations for any other VPC where you use the firewall. You can use Resource Access
      # Manager to share a Firewall that you own with other accounts, which gives them the ability to use
      # the firewall to create VPC endpoint associations. For information about sharing a firewall, see
      # PutResourcePolicy in this guide and see Sharing Network Firewall resources in the Network Firewall
      # Developer Guide . The status of the VPC endpoint association, which indicates whether it's ready to
      # filter network traffic, is provided in the corresponding VpcEndpointAssociationStatus . You can
      # retrieve both the association and its status by calling DescribeVpcEndpointAssociation .
      struct VpcEndpointAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall.
        @[JSON::Field(key: "FirewallArn")]
        getter firewall_arn : String

        @[JSON::Field(key: "SubnetMapping")]
        getter subnet_mapping : Types::SubnetMapping

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String

        # The unique identifier of the VPC for the endpoint association.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # A description of the VPC endpoint association.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The key:value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The unique identifier of the VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationId")]
        getter vpc_endpoint_association_id : String?

        def initialize(
          @firewall_arn : String,
          @subnet_mapping : Types::SubnetMapping,
          @vpc_endpoint_association_arn : String,
          @vpc_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_endpoint_association_id : String? = nil
        )
        end
      end

      # High-level information about a VPC endpoint association, returned by ListVpcEndpointAssociations .
      # You can use the information provided in the metadata to retrieve and manage a VPC endpoint
      # association.
      struct VpcEndpointAssociationMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a VPC endpoint association.
        @[JSON::Field(key: "VpcEndpointAssociationArn")]
        getter vpc_endpoint_association_arn : String?

        def initialize(
          @vpc_endpoint_association_arn : String? = nil
        )
        end
      end

      # Detailed information about the current status of a VpcEndpointAssociation . You can retrieve this by
      # calling DescribeVpcEndpointAssociation and providing the VPC endpoint association ARN.
      struct VpcEndpointAssociationStatus
        include JSON::Serializable

        # The readiness of the configured firewall endpoint to handle network traffic.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The list of the Availability Zone sync states for all subnets that are defined by the firewall.
        @[JSON::Field(key: "AssociationSyncState")]
        getter association_sync_state : Hash(String, Types::AZSyncState)?

        def initialize(
          @status : String,
          @association_sync_state : Hash(String, Types::AZSyncState)? = nil
        )
        end
      end
    end
  end
end
