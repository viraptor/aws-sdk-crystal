require "json"
require "time"

module AwsSdk
  module Route53GlobalResolver
    module Types

      # You don't have permission to perform this operation. Check your IAM permissions and try again.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Summary information about an access source.
      struct AccessSourcesItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access source.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The CIDR block that defines the IP address range for the access source.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The date and time when the access source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view that the access source is associated with.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier of the access source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IP address type of the access source.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The protocol used by the access source.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The current status of the access source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the access source was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The name of the access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @cidr : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @ip_address_type : String,
          @protocol : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      # Summary information about a token.
      struct AccessTokenItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the token was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with the token.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The date and time when the token expires.
        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time

        # The ID of the global resolver associated with the token.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The current status of the token.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the token was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The name of the token.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dns_view_id : String,
          @expires_at : Time,
          @global_resolver_id : String,
          @id : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      struct AssociateHostedZoneInput
        include JSON::Serializable

        # The ID of the Route 53 private hosted zone to associate with the Route 53 Global Resolver resource.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # Name for the private hosted zone association.
        @[JSON::Field(key: "name")]
        getter name : String

        # An Amazon Resource Name (ARN) of the Route 53 Global Resolver the private hosted zone will be
        # associated to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @hosted_zone_id : String,
          @name : String,
          @resource_arn : String
        )
        end
      end

      struct AssociateHostedZoneOutput
        include JSON::Serializable

        # The date and time the private hosted zone association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # ID of the private hosted zone.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # Name of the hosted zone (also the domain associated with the hosted zone).
        @[JSON::Field(key: "hostedZoneName")]
        getter hosted_zone_name : String

        # ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name for the private hosted zone association.
        @[JSON::Field(key: "name")]
        getter name : String

        # An Amazon Resource Name (ARN) of the Route 53 Global Resolver the private hosted zone is associated
        # to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Aggregate status for all the AWS Regions in which the Route 53 Global Resolver exists.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the private hosted zone association was modified.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @hosted_zone_id : String,
          @hosted_zone_name : String,
          @id : String,
          @name : String,
          @resource_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      struct BatchCreateFirewallRuleInput
        include JSON::Serializable

        # The BatchCreateFirewallRuleInputItem objects contain the information for each Firewall rule.
        @[JSON::Field(key: "firewallRules")]
        getter firewall_rules : Array(Types::BatchCreateFirewallRuleInputItem)

        def initialize(
          @firewall_rules : Array(Types::BatchCreateFirewallRuleInputItem)
        )
        end
      end

      # Information about a DNS Firewall rule to create in a batch operation.
      struct BatchCreateFirewallRuleInputItem
        include JSON::Serializable

        # The action to take when a DNS query matches the firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # A unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ID of the DNS view to associate the firewall rule with.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # A name for the firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The DNS record type for the custom response when the action is BLOCK.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain name for the BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value for the custom response when the action is BLOCK.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The type of block response to return when the action is BLOCK.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # A description of the firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether to enable advanced DNS threat protection for the firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list to associate with the rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The priority of the firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        # The DNS query type that the firewall rule should match.
        @[JSON::Field(key: "qType")]
        getter q_type : String?

        def initialize(
          @action : String,
          @client_token : String,
          @dns_view_id : String,
          @name : String,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @priority : Int64? = nil,
          @q_type : String? = nil
        )
        end
      end

      struct BatchCreateFirewallRuleOutput
        include JSON::Serializable

        # High level information about the DNS Firewall rules that failed to create.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::BatchCreateFirewallRuleOutputItem)

        # High level information about the DNS Firewall rules that were created.
        @[JSON::Field(key: "successes")]
        getter successes : Array(Types::BatchCreateFirewallRuleOutputItem)

        def initialize(
          @failures : Array(Types::BatchCreateFirewallRuleOutputItem),
          @successes : Array(Types::BatchCreateFirewallRuleOutputItem)
        )
        end
      end

      # Information about the result of creating a DNS Firewall rule in a batch operation.
      struct BatchCreateFirewallRuleOutputItem
        include JSON::Serializable

        # The HTTP response code for the batch operation result.
        @[JSON::Field(key: "code")]
        getter code : Int32

        # The firewall rule that was created in the batch operation.
        @[JSON::Field(key: "firewallRule")]
        getter firewall_rule : Types::BatchCreateFirewallRuleResult

        # A message describing the result of the batch operation, including error details if applicable.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32,
          @firewall_rule : Types::BatchCreateFirewallRuleResult,
          @message : String? = nil
        )
        end
      end

      # The result of creating a firewall rule in a batch operation.
      struct BatchCreateFirewallRuleResult
        include JSON::Serializable

        # The action configured for the created firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The unique string that identified the request and ensured idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ID of the DNS view associated with the created firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The name of the created firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The DNS record type configured for the created firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain name configured for the created firewall rule's BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value configured for the created firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The type of block response configured for the created firewall rule.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold configured for the created firewall rule's advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The date and time when the firewall rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the created firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether advanced DNS threat protection is enabled for the created firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list associated with the created firewall rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The unique identifier of the created firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the managed domain list associated with the created firewall rule.
        @[JSON::Field(key: "managedDomainListName")]
        getter managed_domain_list_name : String?

        # The priority of the created firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        # The DNS query type that the created firewall rule matches.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        # The current status of the created firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The date and time when the firewall rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : String,
          @client_token : String,
          @dns_view_id : String,
          @name : String,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @id : String? = nil,
          @managed_domain_list_name : String? = nil,
          @priority : Int64? = nil,
          @query_type : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct BatchDeleteFirewallRuleInput
        include JSON::Serializable

        # An array of the DNS Firewall IDs to be deleted.
        @[JSON::Field(key: "firewallRules")]
        getter firewall_rules : Array(Types::BatchDeleteFirewallRuleInputItem)

        def initialize(
          @firewall_rules : Array(Types::BatchDeleteFirewallRuleInputItem)
        )
        end
      end

      # Information about a DNS Firewall rule to delete in a batch operation.
      struct BatchDeleteFirewallRuleInputItem
        include JSON::Serializable

        # The ID of the DNS Firewall rule to delete.
        @[JSON::Field(key: "firewallRuleId")]
        getter firewall_rule_id : String

        def initialize(
          @firewall_rule_id : String
        )
        end
      end

      struct BatchDeleteFirewallRuleOutput
        include JSON::Serializable

        # High level information about the DNS Firewall rules that failed to delete.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::BatchDeleteFirewallRuleOutputItem)

        # High level information about the DNS Firewall rules that were deleted successfully.
        @[JSON::Field(key: "successes")]
        getter successes : Array(Types::BatchDeleteFirewallRuleOutputItem)

        def initialize(
          @failures : Array(Types::BatchDeleteFirewallRuleOutputItem),
          @successes : Array(Types::BatchDeleteFirewallRuleOutputItem)
        )
        end
      end

      # The result of deleting a firewall rule in a batch operation.
      struct BatchDeleteFirewallRuleOutputItem
        include JSON::Serializable

        # The response code for the delete operation.
        @[JSON::Field(key: "code")]
        getter code : Int32

        # The firewall rule that was deleted in the batch operation.
        @[JSON::Field(key: "firewallRule")]
        getter firewall_rule : Types::BatchDeleteFirewallRuleResult

        # The response message for the delete operation.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32,
          @firewall_rule : Types::BatchDeleteFirewallRuleResult,
          @message : String? = nil
        )
        end
      end

      # Information about a firewall rule that was deleted in a batch operation.
      struct BatchDeleteFirewallRuleResult
        include JSON::Serializable

        # The unique identifier of the deleted firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The unique string that identified the request and ensured idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the deleted firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The final status of the deleted firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @client_token : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct BatchUpdateFirewallRuleInput
        include JSON::Serializable

        # The DNS Firewall rule IDs to be updated.
        @[JSON::Field(key: "firewallRules")]
        getter firewall_rules : Array(Types::BatchUpdateFirewallRuleInputItem)

        def initialize(
          @firewall_rules : Array(Types::BatchUpdateFirewallRuleInputItem)
        )
        end
      end

      # Information for updating a firewall rule in a batch operation.
      struct BatchUpdateFirewallRuleInputItem
        include JSON::Serializable

        # The unique identifier of the firewall rule to update.
        @[JSON::Field(key: "firewallRuleId")]
        getter firewall_rule_id : String

        # The action to take when a DNS query matches the firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The DNS record type for the custom response when the action is BLOCK.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain name for the BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value for the custom response when the action is BLOCK.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The type of block response to return when the action is BLOCK.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # A description of the firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether to enable advanced DNS threat protection for the firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # A name for the firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The priority of the firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        def initialize(
          @firewall_rule_id : String,
          @action : String? = nil,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @name : String? = nil,
          @priority : Int64? = nil
        )
        end
      end

      struct BatchUpdateFirewallRuleOutput
        include JSON::Serializable

        # High level information about the DNS Firewall rules that failed to update.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::BatchUpdateFirewallRuleOutputItem)

        # High level information about the DNS Firewall rules that were successfully updated.
        @[JSON::Field(key: "successes")]
        getter successes : Array(Types::BatchUpdateFirewallRuleOutputItem)

        def initialize(
          @failures : Array(Types::BatchUpdateFirewallRuleOutputItem),
          @successes : Array(Types::BatchUpdateFirewallRuleOutputItem)
        )
        end
      end

      # The result of updating a firewall rule in a batch operation.
      struct BatchUpdateFirewallRuleOutputItem
        include JSON::Serializable

        # The response code for the update operation.
        @[JSON::Field(key: "code")]
        getter code : Int32

        # The firewall rule that was updated in the batch operation.
        @[JSON::Field(key: "firewallRule")]
        getter firewall_rule : Types::BatchUpdateFirewallRuleResult

        # The response message for the update operation.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : Int32,
          @firewall_rule : Types::BatchUpdateFirewallRuleResult,
          @message : String? = nil
        )
        end
      end

      # Information about a firewall rule that was updated in a batch operation.
      struct BatchUpdateFirewallRuleResult
        include JSON::Serializable

        # The unique identifier of the updated firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The action configured for the updated firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The DNS record type configured for the updated firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain name configured for the updated firewall rule's BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value configured for the updated firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The type of block response configured for the updated firewall rule.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The unique string that identified the request and ensured idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The confidence threshold configured for the updated firewall rule's advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The date and time when the firewall rule was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the updated firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether advanced DNS threat protection is enabled for the updated firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the DNS view associated with the updated firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String?

        # The ID of the firewall domain list associated with the updated firewall rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The name of the updated firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The priority of the updated firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        # The DNS query type that the updated firewall rule matches.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        # The current status of the updated firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The date and time when the firewall rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @id : String,
          @action : String? = nil,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @client_token : String? = nil,
          @confidence_threshold : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @dns_view_id : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @name : String? = nil,
          @priority : Int64? = nil,
          @query_type : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The request conflicts with the current state of the resource. This can occur when trying to modify a
      # resource that is not in a valid state for the requested operation.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The type of the conflicting resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The ID of the conflicting resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_type : String,
          @resource_id : String? = nil
        )
        end
      end

      struct CreateAccessSourceInput
        include JSON::Serializable

        # The IP address or CIDR range that is allowed to send DNS queries to the Route 53 Global Resolver.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The ID of the DNS view to associate with this access source.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The DNS protocol that is permitted for this access source. Valid values are Do53 (DNS over port 53),
        # DoT (DNS over TLS), and DoH (DNS over HTTPS).
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # A unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The IP address type for this access source. Valid values are IPv4 and IPv6 (if the Route 53 Global
        # Resolver supports dual-stack).
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # A descriptive name for the access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags to associate with the access source.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cidr : String,
          @dns_view_id : String,
          @protocol : String,
          @client_token : String? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAccessSourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access source.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The IP address or CIDR range that is allowed to send DNS queries to the Route 53 Global Resolver.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The date and time when the access source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with this access source.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier for the access source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IP address type for this access source (IPv4 or IPv6).
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The DNS protocol that is permitted for this access source (Do53, DoT, or DoH).
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The operational status of the access source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the access source was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The descriptive name of the access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @cidr : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @ip_address_type : String,
          @protocol : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      struct CreateAccessTokenInput
        include JSON::Serializable

        # The ID of the DNS view to associate with this token.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The date and time when the token expires. Tokens can have a minimum expiration of 30 days and
        # maximum of 365 days from creation.
        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time?

        # A descriptive name for the access token.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An array of user-defined keys and optional values. These tags can be used for categorization and
        # organization.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dns_view_id : String,
          @client_token : String? = nil,
          @expires_at : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAccessTokenOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access token.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the access token was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with this access token.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The date and time when the access token expires.
        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time

        # The unique identifier for the access token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The operational status of the access token.
        @[JSON::Field(key: "status")]
        getter status : String

        # The access token value. This token should be included in DoH and DoT requests for authentication.
        # Keep this value secure as it provides access to your Route 53 Global Resolver.
        @[JSON::Field(key: "value")]
        getter value : String

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the access token.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dns_view_id : String,
          @expires_at : Time,
          @id : String,
          @status : String,
          @value : String,
          @client_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct CreateDNSViewInput
        include JSON::Serializable

        # The ID of the Route 53 Global Resolver to associate with this DNS view.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # A descriptive name for the DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional description for the DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether to enable DNSSEC validation for DNS queries in this DNS view. When enabled, the resolver
        # verifies the authenticity and integrity of DNS responses from public name servers for DNSSEC-signed
        # domains.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String?

        # Whether to enable EDNS Client Subnet injection for DNS queries in this DNS view. When enabled,
        # client subnet information is forwarded to provide more accurate geographic-based DNS responses.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String?

        # Determines the behavior when Route 53 Global Resolver cannot apply DNS firewall rules due to service
        # impairment. When enabled, DNS queries are allowed through; when disabled, queries are blocked.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String?

        # Tags to associate with the DNS view.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @global_resolver_id : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @dnssec_validation : String? = nil,
          @edns_client_subnet : String? = nil,
          @firewall_rules_fail_open : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDNSViewOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the DNS view was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation is enabled for DNS queries in this DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection is enabled for DNS queries in this DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # The behavior when Route 53 Global Resolver cannot apply DNS firewall rules due to service
        # impairment.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the Route 53 Global Resolver instance the DNS view is created for.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier for the DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The descriptive name of the DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The operational status of the DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateFirewallDomainListInput
        include JSON::Serializable

        # The ID of the Route 53 Global Resolver that the domain list will be associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # A descriptive name for the firewall domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional description for the firewall domain list.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of user-defined keys and optional values. These tags can be used for categorization and
        # organization.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @global_resolver_id : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateFirewallDomainListOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) for the domain list.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time and date the domain list was created on.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Number of domains in the domain list.
        @[JSON::Field(key: "domainCount")]
        getter domain_count : Int32

        # The ID of the Route 53 Global Resolver that the domain list is associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # ID of the domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name of the domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # Creation status of the domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the domain list was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Description for the domain list.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @domain_count : Int32,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct CreateFirewallRuleInput
        include JSON::Serializable

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list: ALLOW - Permit the request to go through. ALERT - Permit the request and send
        # metrics and logs to CloudWatch. BLOCK - Disallow the request. This option requires additional
        # details in the rule's BlockResponse .
        @[JSON::Field(key: "action")]
        getter action : String

        # The ID of the DNS view to associate with this firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # A descriptive name for the firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE . This
        # setting is required if the BlockResponse setting is OVERRIDE .
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE . This setting is required if the BlockResponse setting is
        # OVERRIDE .
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        # This setting is required if the BlockResponse setting is OVERRIDE .
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The response to return when the action is BLOCK. Valid values are NXDOMAIN (domain does not exist),
        # NODATA (domain exists but no records), or OVERRIDE (return custom response).
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The confidence threshold for advanced threat detection. Valid values are HIGH, MEDIUM, or LOW,
        # indicating the accuracy level required for threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # An optional description for the firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether to enable advanced DNS threat protection for this rule. Advanced protection can detect and
        # block DNS tunneling and Domain Generation Algorithm (DGA) threats.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list to use in this rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The priority of this rule. Rules are evaluated in priority order, with lower numbers having higher
        # priority. When a DNS query matches multiple rules, the rule with the highest priority (lowest
        # number) is applied.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        # The DNS query type to match for this rule. Examples include A (IPv4 address), AAAA (IPv6 address),
        # MX (mail exchange), or TXT (text record).
        @[JSON::Field(key: "qType")]
        getter q_type : String?

        def initialize(
          @action : String,
          @dns_view_id : String,
          @name : String,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @client_token : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @priority : Int64? = nil,
          @q_type : String? = nil
        )
        end
      end

      struct CreateFirewallRuleOutput
        include JSON::Serializable

        # The action that DNS Firewall takes on DNS queries that match this rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The date and time when the firewall rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with this firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier for the firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The priority of the firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64

        # The operational status of the firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the firewall rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The DNS record type for the custom response when blockResponse is OVERRIDE.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain to return when the action is BLOCK and blockResponse is OVERRIDE.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The time-to-live (TTL) value for the custom response when blockResponse is OVERRIDE.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The response to return when the action is BLOCK.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description of the firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether advanced DNS threat protection is enabled for this rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list used in this rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The DNS query type that this rule matches.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @name : String,
          @priority : Int64,
          @status : String,
          @updated_at : Time,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end

      struct CreateGlobalResolverInput
        include JSON::Serializable

        # A descriptive name for the Route 53 Global Resolver instance. Maximum length of 64 characters.
        @[JSON::Field(key: "name")]
        getter name : String

        # List of AWS regions where the Route 53 Global Resolver will operate. The resolver will be
        # distributed across these regions to provide global availability and low-latency DNS resolution.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # A unique string that identifies the request and ensures idempotency. If you make multiple requests
        # with the same client token, only one Route 53 Global Resolver is created.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional description for the Route 53 Global Resolver instance. Maximum length of 1024
        # characters.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS region where query resolution logs and metrics will be aggregated and delivered. If not
        # specified, logging is not enabled.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        # Tags to associate with the Route 53 Global Resolver. Tags are key-value pairs that help you organize
        # and identify your resources.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @regions : Array(String),
          @client_token : String? = nil,
          @description : String? = nil,
          @observability_region : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateGlobalResolverOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Route 53 Global Resolver.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The date and time when the Route 53 Global Resolver was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The hostname that DNS clients should use for TLS certificate validation when connecting to the Route
        # 53 Global Resolver. This value resolves to the global anycast IP addresses for the resolver.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String

        # The unique identifier for the Route 53 Global Resolver.
        @[JSON::Field(key: "id")]
        getter id : String

        # The global anycast IPv4 addresses associated with the Route 53 Global Resolver. DNS clients can send
        # queries to these addresses from anywhere on the internet.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)

        # The name of the Route 53 Global Resolver.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Regions where the Route 53 Global Resolver is deployed and operational.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The current status of the Route 53 Global Resolver. Possible values are CREATING (being
        # provisioned), UPDATING (being modified), OPERATIONAL (ready to serve queries), or DELETING (being
        # removed).
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the Route 53 Global Resolver was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the Route 53 Global Resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Region where observability data for the Route 53 Global Resolver is stored.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dns_name : String,
          @id : String,
          @ipv4_addresses : Array(String),
          @name : String,
          @regions : Array(String),
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      # Summary information about a DNS view.
      struct DNSViewSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The date and time when the DNS view was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation is enabled for the DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection is enabled for the DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # Whether firewall rules fail open when they cannot be evaluated.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the global resolver that the DNS view is associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A description of the DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct DeleteAccessSourceInput
        include JSON::Serializable

        # The unique identifier of the access source to delete.
        @[JSON::Field(key: "accessSourceId")]
        getter access_source_id : String

        def initialize(
          @access_source_id : String
        )
        end
      end

      struct DeleteAccessSourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted access source.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The IP address or CIDR range of the deleted access source.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The date and time when the access source was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view that was associated with the deleted access source.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier of the deleted access source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IP address type of the deleted access source (IPv4 or IPv6).
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The DNS protocol that was permitted for the deleted access source.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The final status of the deleted access source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the access source was last updated before deletion.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The name of the deleted access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @cidr : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @ip_address_type : String,
          @protocol : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      struct DeleteAccessTokenInput
        include JSON::Serializable

        # The unique identifier of the access token to delete.
        @[JSON::Field(key: "accessTokenId")]
        getter access_token_id : String

        def initialize(
          @access_token_id : String
        )
        end
      end

      struct DeleteAccessTokenOutput
        include JSON::Serializable

        # The date and time when the access token was deleted.
        @[JSON::Field(key: "deletedAt")]
        getter deleted_at : Time

        # The unique identifier of the deleted access token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The final status of the deleted access token.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @deleted_at : Time,
          @id : String,
          @status : String
        )
        end
      end

      struct DeleteDNSViewInput
        include JSON::Serializable

        # The unique identifier of the DNS view to delete.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        def initialize(
          @dns_view_id : String
        )
        end
      end

      struct DeleteDNSViewOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the DNS view was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation was enabled for the deleted DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection was enabled for the deleted DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # The firewall rules fail-open behavior that was configured for the deleted DNS view.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the Route 53 Global Resolver that the deleted DNS view was associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the deleted DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the deleted DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The final status of the deleted DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated before deletion.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the deleted DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct DeleteFirewallDomainListInput
        include JSON::Serializable

        # The unique identifier of the firewall domain list to delete.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String

        def initialize(
          @firewall_domain_list_id : String
        )
        end
      end

      struct DeleteFirewallDomainListOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted firewall domain list.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the deleted firewall domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the deleted firewall domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # The final status of the deleted firewall domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @status : String
        )
        end
      end

      struct DeleteFirewallRuleInput
        include JSON::Serializable

        # The unique identifier of the firewall rule to delete.
        @[JSON::Field(key: "firewallRuleId")]
        getter firewall_rule_id : String

        def initialize(
          @firewall_rule_id : String
        )
        end
      end

      struct DeleteFirewallRuleOutput
        include JSON::Serializable

        # The action that was configured for the deleted firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The date and time when the firewall rule was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view that was associated with the deleted firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier of the deleted firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the deleted firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The priority that was configured for the deleted firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64

        # The final status of the deleted firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the firewall rule was last updated before deletion.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The DNS record type that was configured for the deleted firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain that was configured for the deleted firewall rule's BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value that was configured for the deleted firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The block response type that was configured for the deleted firewall rule.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold that was configured for the deleted firewall rule's advanced threat
        # detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description of the deleted firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether advanced DNS threat protection was enabled for the deleted firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list that was associated with the deleted firewall rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The DNS query type that the deleted firewall rule was configured to match.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @name : String,
          @priority : Int64,
          @status : String,
          @updated_at : Time,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end

      struct DeleteGlobalResolverInput
        include JSON::Serializable

        # The unique identifier of the Route 53 Global Resolver to delete.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        def initialize(
          @global_resolver_id : String
        )
        end
      end

      struct DeleteGlobalResolverOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The date and time when the Route 53 Global Resolver was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The hostname that DNS clients used for TLS certificate validation when connecting to the deleted
        # Route 53 Global Resolver.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String

        # The unique identifier of the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "id")]
        getter id : String

        # The global anycast IPv4 addresses that were associated with the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)

        # The name of the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Regions where the deleted Route 53 Global Resolver was deployed and operational.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The final status of the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the Route 53 Global Resolver was last updated before deletion.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the deleted Route 53 Global Resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Region where observability data for the deleted Route 53 Global Resolver was stored.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dns_name : String,
          @id : String,
          @ipv4_addresses : Array(String),
          @name : String,
          @regions : Array(String),
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      struct DisableDNSViewInput
        include JSON::Serializable

        # The unique identifier of the DNS view to disable.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        def initialize(
          @dns_view_id : String
        )
        end
      end

      struct DisableDNSViewOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the disabled DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the DNS view was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation is enabled for the disabled DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection is enabled for the disabled DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # The firewall rules fail-open behavior configured for the disabled DNS view.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the Route 53 Global Resolver that the disabled DNS view is associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the disabled DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the disabled DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the disabled DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the disabled DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct DisassociateHostedZoneInput
        include JSON::Serializable

        # The ID of the Route 53 private hosted zone to disassociate.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # The Amazon Resource Name (ARN) of the Route 53 Global Resolver resource to disassociate the hosted
        # zone from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @hosted_zone_id : String,
          @resource_arn : String
        )
        end
      end

      struct DisassociateHostedZoneOutput
        include JSON::Serializable

        # The date and time when the association was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the Route 53 private hosted zone that was disassociated.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # The name of the Route 53 private hosted zone that was disassociated.
        @[JSON::Field(key: "hostedZoneName")]
        getter hosted_zone_name : String

        # The unique identifier of the disassociation.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the association that was removed.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Route 53 Global Resolver resource that the hosted zone was
        # disassociated from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The final status of the disassociation.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the association was last updated before disassociation.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @hosted_zone_id : String,
          @hosted_zone_name : String,
          @id : String,
          @name : String,
          @resource_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      struct EnableDNSViewInput
        include JSON::Serializable

        # The unique identifier of the DNS view to enable.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        def initialize(
          @dns_view_id : String
        )
        end
      end

      struct EnableDNSViewOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the enabled DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the DNS view was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation is enabled for the enabled DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection is enabled for the enabled DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # The firewall rules fail-open behavior configured for the enabled DNS view.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the Route 53 Global Resolver that the enabled DNS view is associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the enabled DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the enabled DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the enabled DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the enabled DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Summary information about a firewall domain list.
      struct FirewallDomainListsItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the firewall domain list.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the firewall domain list was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the global resolver that the firewall domain list is associated with.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the firewall domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the firewall domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the firewall domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the firewall domain list was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A description of the firewall domain list.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Summary information about a firewall rule.
      struct FirewallRulesItem
        include JSON::Serializable

        # The action configured for the firewall rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The date and time when the firewall rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with the firewall rule.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier of the firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The priority of the firewall rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int64

        # The current status of the firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the firewall rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The DNS record type configured for the firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom domain name configured for the firewall rule's BLOCK response.
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The TTL value configured for the firewall rule's custom response.
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The type of block response configured for the firewall rule.
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold configured for the firewall rule's advanced threat detection.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description of the firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether advanced DNS threat protection is enabled for the firewall rule.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the firewall domain list associated with the firewall rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The DNS query type that the firewall rule matches.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @name : String,
          @priority : Int64,
          @status : String,
          @updated_at : Time,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end

      struct GetAccessSourceInput
        include JSON::Serializable

        # The unique identifier of the access source to retrieve.
        @[JSON::Field(key: "accessSourceId")]
        getter access_source_id : String

        def initialize(
          @access_source_id : String
        )
        end
      end

      struct GetAccessSourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access source.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The IP range for the rule's parameters in CIDR notation.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The time and date the rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # ID for the DNS view that the rule is associated to.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # ID for the rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IP address type.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The protocol determines how data is transmitted to a Global Resolver instance.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # Information about the status of the rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the access source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Name for the access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @cidr : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @ip_address_type : String,
          @protocol : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      struct GetAccessTokenInput
        include JSON::Serializable

        # ID of the token.
        @[JSON::Field(key: "accessTokenId")]
        getter access_token_id : String

        def initialize(
          @access_token_id : String
        )
        end
      end

      struct GetAccessTokenOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the token.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time and date the token was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # ID of the DNS view the token is associated to.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The token's expiration time and date.
        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time

        # ID of the Global Resolver.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # ID of the token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The operational status of the token.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the token was created.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The value of the token.
        @[JSON::Field(key: "value")]
        getter value : String

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Name of the token.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dns_view_id : String,
          @expires_at : Time,
          @global_resolver_id : String,
          @id : String,
          @status : String,
          @updated_at : Time,
          @value : String,
          @client_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct GetDNSViewInput
        include JSON::Serializable

        # The ID of the DNS view to retrieve information about.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        def initialize(
          @dns_view_id : String
        )
        end
      end

      struct GetDNSViewOutput
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time and date the DNS view was creates on.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Specifies whether DNSSEC is enabled or disabled for the DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Specifies whether edns0 client subnet is enabled.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # Specifies the DNS Firewall failure mode configuration. When enabled, the DNS Firewall allows DNS
        # queries to proceed if it's unable to properly evaluate them. When disabled, the DNS Firewall blocks
        # DNS queries it's unable to evaluate.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # ID of the Global Resolver the DNS view is associated to.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # ID of the DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name of the DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # Operational status of the DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the DNS view was updated on.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Description of the DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct GetFirewallDomainListInput
        include JSON::Serializable

        # ID of the domain list.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String

        def initialize(
          @firewall_domain_list_id : String
        )
        end
      end

      struct GetFirewallDomainListOutput
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the domain list.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time and date the domain list was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Number of domains in the domain list.
        @[JSON::Field(key: "domainCount")]
        getter domain_count : Int32

        # ID of the Global Resolver that the domain list is associated to.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # ID of the domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name of the domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # Operational status of the domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the domain list was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the domain list.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Additional information about the status of the domain list.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @domain_count : Int32,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetFirewallRuleInput
        include JSON::Serializable

        # ID of the DNS Firewall rule.
        @[JSON::Field(key: "firewallRuleId")]
        getter firewall_rule_id : String

        def initialize(
          @firewall_rule_id : String
        )
        end
      end

      struct GetFirewallRuleOutput
        include JSON::Serializable

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The time and date the DNS Firewall rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The DNS view ID the DNS Firewall is associated with.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # ID of the DNS Firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the DNS Firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The setting that determines the processing order of the rule in the rule group. DNS Firewall
        # processes the rules in a rule group by order of priority, starting from the lowest setting.
        @[JSON::Field(key: "priority")]
        getter priority : Int64

        # The operational status of the DNS Firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the DNS Firewall rule was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request. Used for the rule action setting BLOCK .
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description of the DNS Firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of the DNS Firewall Advanced rule. Valid values are DGA and DNS_TUNNELING.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of a DNS Firewall domain list.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The DNS query type you want the rule to evaluate.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @name : String,
          @priority : Int64,
          @status : String,
          @updated_at : Time,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end

      struct GetGlobalResolverInput
        include JSON::Serializable

        # The ID of the Route 53 Global Resolver to retrieve information about.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        def initialize(
          @global_resolver_id : String
        )
        end
      end

      struct GetGlobalResolverOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Global Resolver.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The date and time the Global Resolver was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The hostname used by the customers' DNS clients for certification validation.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String

        # The ID of the Global Resolver.
        @[JSON::Field(key: "id")]
        getter id : String

        # List of anycast IPv4 addresses associated with the Global Resolver instance.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)

        # The name of the Global Resolver.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Regions in which the Global Resolver operate.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The operational status of the Global Resolver.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the Global Resolver was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the Global Resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Regions in which the users' Global Resolver query resolution logs will be propagated.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dns_name : String,
          @id : String,
          @ipv4_addresses : Array(String),
          @name : String,
          @regions : Array(String),
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      struct GetHostedZoneAssociationInput
        include JSON::Serializable

        # ID of the private hosted zone association.
        @[JSON::Field(key: "hostedZoneAssociationId")]
        getter hosted_zone_association_id : String

        def initialize(
          @hosted_zone_association_id : String
        )
        end
      end

      struct GetHostedZoneAssociationOutput
        include JSON::Serializable

        # The time and date the private hosted zone association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # ID of the hosted zone associated to the DNS view.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # Name of the domain associated with the private hosted zone.
        @[JSON::Field(key: "hostedZoneName")]
        getter hosted_zone_name : String

        # ID of the private hosted zone association.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name of the private hosted zone association.
        @[JSON::Field(key: "name")]
        getter name : String

        # Amazon Resource Name (ARN) of the DNS view the private hosted zone is associated to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The operational status of the private hosted zone association.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the private hosted zone association was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @hosted_zone_id : String,
          @hosted_zone_name : String,
          @id : String,
          @name : String,
          @resource_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      struct GetManagedFirewallDomainListInput
        include JSON::Serializable

        # ID of the Managed Domain List.
        @[JSON::Field(key: "managedFirewallDomainListId")]
        getter managed_firewall_domain_list_id : String

        def initialize(
          @managed_firewall_domain_list_id : String
        )
        end
      end

      struct GetManagedFirewallDomainListOutput
        include JSON::Serializable

        # ID of the Managed Domain List.
        @[JSON::Field(key: "id")]
        getter id : String

        # Type of the managed category. This is either THREAT or CONTENT .
        @[JSON::Field(key: "managedListType")]
        getter managed_list_type : String

        # Name of the Managed Domain List.
        @[JSON::Field(key: "name")]
        getter name : String

        # Description of the Managed Domain List.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @id : String,
          @managed_list_type : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # Summary information about a global resolver.
      struct GlobalResolversItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the global resolver.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The date and time when the global resolver was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The DNS name of the global resolver.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String

        # The unique identifier of the global resolver.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IPv4 addresses assigned to the global resolver.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)

        # The name of the global resolver.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Regions where the global resolver is deployed.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The current status of the global resolver.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the global resolver was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A description of the global resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Region where observability data is collected for the global resolver.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dns_name : String,
          @id : String,
          @ipv4_addresses : Array(String),
          @name : String,
          @regions : Array(String),
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      # Summary information about a hosted zone association.
      struct HostedZoneAssociationSummary
        include JSON::Serializable

        # The date and time when the hosted zone association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the hosted zone.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # The name of the hosted zone.
        @[JSON::Field(key: "hostedZoneName")]
        getter hosted_zone_name : String

        # The unique identifier of the hosted zone association.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the hosted zone association.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the resource associated with the hosted zone.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The current status of the hosted zone association.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the hosted zone association was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @hosted_zone_id : String,
          @hosted_zone_name : String,
          @id : String,
          @name : String,
          @resource_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      struct ImportFirewallDomainsInput
        include JSON::Serializable

        # The fully qualified URL of the file in Amazon S3 that contains the list of domains to import. The
        # file should contain one domain per line.
        @[JSON::Field(key: "domainFileUrl")]
        getter domain_file_url : String

        # ID of the DNS Firewall domain list that you want to import the domain list to.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String

        # This value is REPLACE , and it updates the domain list to match the list of domains in the imported
        # file.
        @[JSON::Field(key: "operation")]
        getter operation : String

        def initialize(
          @domain_file_url : String,
          @firewall_domain_list_id : String,
          @operation : String
        )
        end
      end

      struct ImportFirewallDomainsOutput
        include JSON::Serializable

        # ID of the DNS Firewall domain list that you imported the domain list to.
        @[JSON::Field(key: "id")]
        getter id : String

        # Name of the DNS Firewall domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # Operational status of the DNS Firewall domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @name : String,
          @status : String
        )
        end
      end

      # An internal server error occurred. Try again later.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Number of seconds in which the caller can retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListAccessSourcesInput
        include JSON::Serializable

        # Values to filter the results.
        @[JSON::Field(key: "filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessSourcesOutput
        include JSON::Serializable

        # An array containing information about the access sources, such as the ID, CIDR etc.
        @[JSON::Field(key: "accessSources")]
        getter access_sources : Array(Types::AccessSourcesItem)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_sources : Array(Types::AccessSourcesItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessTokensInput
        include JSON::Serializable

        # The ID of the DNS view to list the tokens for.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # Filtering parameters.
        @[JSON::Field(key: "filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @dns_view_id : String,
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessTokensOutput
        include JSON::Serializable

        # List of the tokens.
        @[JSON::Field(key: "accessTokens")]
        getter access_tokens : Array(Types::AccessTokenItem)?

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_tokens : Array(Types::AccessTokenItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDNSViewsInput
        include JSON::Serializable

        # The Global Resolver ID.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @global_resolver_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDNSViewsOutput
        include JSON::Serializable

        # An array of information about the DNS views, such as whether DNSSEC is enabled, creation time, etc.
        @[JSON::Field(key: "dnsViews")]
        getter dns_views : Array(Types::DNSViewSummary)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dns_views : Array(Types::DNSViewSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallDomainListsInput
        include JSON::Serializable

        # The ID of the Global Resolver that contains the DNS view the domain lists are associated to.
        @[JSON::Field(key: "global_resolver_id")]
        getter global_resolver_id : String?

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @global_resolver_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallDomainListsOutput
        include JSON::Serializable

        # List of the DNS Firewall domain lists.
        @[JSON::Field(key: "firewallDomainLists")]
        getter firewall_domain_lists : Array(Types::FirewallDomainListsItem)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @firewall_domain_lists : Array(Types::FirewallDomainListsItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallDomainsInput
        include JSON::Serializable

        # ID of the DNS Firewall domain list.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @firewall_domain_list_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallDomainsOutput
        include JSON::Serializable

        # List of domains in the specified domain list.
        @[JSON::Field(key: "domains")]
        getter domains : Array(String)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domains : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallRulesInput
        include JSON::Serializable

        # ID of the DNS view.
        @[JSON::Field(key: "dnsview_id")]
        getter dns_view_id : String

        # Values to filter the results.
        @[JSON::Field(key: "filters")]
        getter filters : Hash(String, Array(String))?

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @dns_view_id : String,
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFirewallRulesOutput
        include JSON::Serializable

        # List of the firewall rules and information about them.
        @[JSON::Field(key: "firewallRules")]
        getter firewall_rules : Array(Types::FirewallRulesItem)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @firewall_rules : Array(Types::FirewallRulesItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListGlobalResolversInput
        include JSON::Serializable

        # The maximum number of Route 53 Global Resolver instances to return in the response. Valid range is
        # 1-100.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results. This value is returned in the response if there are more
        # results to retrieve.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGlobalResolversOutput
        include JSON::Serializable

        # Paginated list of Global Resolvers.
        @[JSON::Field(key: "globalResolvers")]
        getter global_resolvers : Array(Types::GlobalResolversItem)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @global_resolvers : Array(Types::GlobalResolversItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListHostedZoneAssociationsInput
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the DNS view.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHostedZoneAssociationsOutput
        include JSON::Serializable

        # List of the private hosted zone associations.
        @[JSON::Field(key: "hostedZoneAssociations")]
        getter hosted_zone_associations : Array(Types::HostedZoneAssociationSummary)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @hosted_zone_associations : Array(Types::HostedZoneAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedFirewallDomainListsInput
        include JSON::Serializable

        # The category of the Manage DNS list either THREAT or CONTENT .
        @[JSON::Field(key: "managedFirewallDomainListType")]
        getter managed_firewall_domain_list_type : String

        # The maximum number of results to retrieve in a single call.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # A pagination token used for large sets of results that can't be returned in a single response.
        @[JSON::Field(key: "next_token")]
        getter next_token : String?

        def initialize(
          @managed_firewall_domain_list_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedFirewallDomainListsOutput
        include JSON::Serializable

        # List of the Managed Domain Lists.
        @[JSON::Field(key: "managedFirewallDomainLists")]
        getter managed_firewall_domain_lists : Array(Types::ManagedFirewallDomainListsItem)

        # A pagination token used for large sets of results that can't be returned in a single response.
        # Provide this token in the next call to get the results not returned in this call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_firewall_domain_lists : Array(Types::ManagedFirewallDomainListsItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array of user-defined keys and optional values. These tags can be used for categorization and
        # organization.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a managed firewall domain list.
      struct ManagedFirewallDomainListsItem
        include JSON::Serializable

        # The unique identifier of the managed firewall domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the managed firewall domain list.
        @[JSON::Field(key: "managedListType")]
        getter managed_list_type : String

        # The name of the managed firewall domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the managed firewall domain list.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @id : String,
          @managed_list_type : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # The specified resource was not found. Verify the resource ID and try again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource type of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The unique ID of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_type : String,
          @resource_id : String? = nil
        )
        end
      end

      # The request would exceed one or more service quotas. Check your current usage and quotas, then try
      # again.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource type of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The quota code recognized by the AWS Service Quotas service.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The unique ID of the resource referenced in the failed request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The code for the AWS service that owns the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @resource_type : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource to be tagged.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # An array of user-defined keys and optional values. These tags can be used for categorization and
        # organization.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was throttled due to too many requests. Wait a moment and try again.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The quota code recognized by the AWS Service Quotas service.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Number of seconds in which the caller can retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code for the AWS service that owns the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys associated with the resource.
        @[JSON::Field(key: "tagKeys")]
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

      struct UpdateAccessSourceInput
        include JSON::Serializable

        # The unique identifier of the access source to update.
        @[JSON::Field(key: "accessSourceId")]
        getter access_source_id : String

        # The CIDR block for the access source.
        @[JSON::Field(key: "cidr")]
        getter cidr : String?

        # The IP address type for the access source.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The name of the access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol for the access source.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @access_source_id : String,
          @cidr : String? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol : String? = nil
        )
        end
      end

      struct UpdateAccessSourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated access source.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The CIDR block of the updated access source.
        @[JSON::Field(key: "cidr")]
        getter cidr : String

        # The date and time when the access source was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view associated with the updated access source.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The unique identifier of the updated access source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The IP address type of the updated access source.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The protocol of the updated access source.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The current status of the updated access source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the access source was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The name of the updated access source.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @cidr : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @ip_address_type : String,
          @protocol : String,
          @status : String,
          @updated_at : Time,
          @name : String? = nil
        )
        end
      end

      struct UpdateAccessTokenInput
        include JSON::Serializable

        # The ID of the token.
        @[JSON::Field(key: "accessTokenId")]
        getter access_token_id : String

        # The new name of the token.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @access_token_id : String,
          @name : String
        )
        end
      end

      struct UpdateAccessTokenOutput
        include JSON::Serializable

        # The ID of the token.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the token.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end

      struct UpdateDNSViewInput
        include JSON::Serializable

        # The unique identifier of the DNS view to update.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # A description of the DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether to enable DNSSEC validation for the DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String?

        # Whether to enable EDNS Client Subnet injection for the DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String?

        # Whether firewall rules should fail open when they cannot be evaluated.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String?

        # The name of the DNS view.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @dns_view_id : String,
          @description : String? = nil,
          @dnssec_validation : String? = nil,
          @edns_client_subnet : String? = nil,
          @firewall_rules_fail_open : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateDNSViewOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated DNS view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the DNS view was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Whether DNSSEC validation is enabled for the updated DNS view.
        @[JSON::Field(key: "dnssecValidation")]
        getter dnssec_validation : String

        # Whether EDNS Client Subnet injection is enabled for the updated DNS view.
        @[JSON::Field(key: "ednsClientSubnet")]
        getter edns_client_subnet : String

        # Whether firewall rules fail open when they cannot be evaluated for the updated DNS view.
        @[JSON::Field(key: "firewallRulesFailOpen")]
        getter firewall_rules_fail_open : String

        # The ID of the global resolver associated with the updated DNS view.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The unique identifier of the updated DNS view.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the updated DNS view.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the updated DNS view.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time when the DNS view was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The unique string that identifies the request and ensures idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the updated DNS view.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @dnssec_validation : String,
          @edns_client_subnet : String,
          @firewall_rules_fail_open : String,
          @global_resolver_id : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct UpdateFirewallDomainsInput
        include JSON::Serializable

        # A list of the domains. You can add up to 1000 domains per request.
        @[JSON::Field(key: "domains")]
        getter domains : Array(String)

        # The ID of the DNS Firewall domain list to which you want to add the domains.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String

        # The operation for updating the domain list. The allowed values are ADD, REMOVE, and REPLACE.
        @[JSON::Field(key: "operation")]
        getter operation : String

        def initialize(
          @domains : Array(String),
          @firewall_domain_list_id : String,
          @operation : String
        )
        end
      end

      struct UpdateFirewallDomainsOutput
        include JSON::Serializable

        # The ID of the DNS Firewall domain list.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the domain list.
        @[JSON::Field(key: "name")]
        getter name : String

        # The operational status of the domain list.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @name : String,
          @status : String
        )
        end
      end

      struct UpdateFirewallRuleInput
        include JSON::Serializable

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ID of the DNS Firewall rule.
        @[JSON::Field(key: "firewallRuleId")]
        getter firewall_rule_id : String

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request. Used for the rule action setting BLOCK .
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description for the Firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of the DNS Firewall Advanced rule. Valid values are DGA and DNS_TUNNELING.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The name of the DNS Firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The setting that determines the processing order of the rule in the rule group. DNS Firewall
        # processes the rules in a rule group by order of priority, starting from the lowest setting.
        @[JSON::Field(key: "priority")]
        getter priority : Int64?

        def initialize(
          @client_token : String,
          @firewall_rule_id : String,
          @action : String? = nil,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @name : String? = nil,
          @priority : Int64? = nil
        )
        end
      end

      struct UpdateFirewallRuleOutput
        include JSON::Serializable

        # The action that DNS Firewall should take on a DNS query when it matches one of the domains in the
        # rule's domain list, or a threat in a DNS Firewall Advanced rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The time and date the Firewall rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the DNS view the Firewall rule is associated with.
        @[JSON::Field(key: "dnsViewId")]
        getter dns_view_id : String

        # The ID of the Firewall rule.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the Firewall rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The setting that determines the processing order of the rule in the rule group. DNS Firewall
        # processes the rules in a rule group by order of priority, starting from the lowest setting.
        @[JSON::Field(key: "priority")]
        getter priority : Int64

        # The operational status of the firewall rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the rule was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The DNS record's type. This determines the format of the record value that you provided in
        # BlockOverrideDomain . Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDnsType")]
        getter block_override_dns_type : String?

        # The custom DNS record to send back in response to the query. Used for the rule action BLOCK with a
        # BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideDomain")]
        getter block_override_domain : String?

        # The recommended amount of time, in seconds, for the DNS resolver or web browser to cache the
        # provided override record. Used for the rule action BLOCK with a BlockResponse setting of OVERRIDE .
        @[JSON::Field(key: "blockOverrideTtl")]
        getter block_override_ttl : Int32?

        # The way that you want DNS Firewall to block the request. Used for the rule action setting BLOCK .
        @[JSON::Field(key: "blockResponse")]
        getter block_response : String?

        # The confidence threshold for DNS Firewall Advanced. You must provide this value when you create a
        # DNS Firewall Advanced rule.
        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : String?

        # The description of the Firewall rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of the DNS Firewall Advanced rule. Valid values are DGA and DNS_TUNNELING.
        @[JSON::Field(key: "dnsAdvancedProtection")]
        getter dns_advanced_protection : String?

        # The ID of the domain list associated with the Firewall rule.
        @[JSON::Field(key: "firewallDomainListId")]
        getter firewall_domain_list_id : String?

        # The DNS query type you want the rule to evaluate.
        @[JSON::Field(key: "queryType")]
        getter query_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @dns_view_id : String,
          @id : String,
          @name : String,
          @priority : Int64,
          @status : String,
          @updated_at : Time,
          @block_override_dns_type : String? = nil,
          @block_override_domain : String? = nil,
          @block_override_ttl : Int32? = nil,
          @block_response : String? = nil,
          @confidence_threshold : String? = nil,
          @description : String? = nil,
          @dns_advanced_protection : String? = nil,
          @firewall_domain_list_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end

      struct UpdateGlobalResolverInput
        include JSON::Serializable

        # The ID of the Global Resolver.
        @[JSON::Field(key: "globalResolverId")]
        getter global_resolver_id : String

        # The description of the Global Resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Global Resolver.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The AWS Regions in which the users' Global Resolver query resolution logs will be propagated.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @global_resolver_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      struct UpdateGlobalResolverOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Global Resolver.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A unique, case-sensitive identifier to ensure idempotency. This means that making the same request
        # multiple times with the same clientToken has the same result every time.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The time and date the Global Resolverwas created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The hostname to be used by the customers' DNS clients for certification validation.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String

        # The ID of the Global Resolver.
        @[JSON::Field(key: "id")]
        getter id : String

        # List of anycast IPv4 addresses associated with the Global Resolver instance.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)

        # Name of the Global Resolver.
        @[JSON::Field(key: "name")]
        getter name : String

        # The AWS Regions in which the Global Resolver will operate.
        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The operational status of the Global Resolver.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the Global Resolver was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Description of the Global Resolver.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Regions in which the users' Global Resolver query resolution logs will be propagated.
        @[JSON::Field(key: "observabilityRegion")]
        getter observability_region : String?

        def initialize(
          @arn : String,
          @client_token : String,
          @created_at : Time,
          @dns_name : String,
          @id : String,
          @ipv4_addresses : Array(String),
          @name : String,
          @regions : Array(String),
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @observability_region : String? = nil
        )
        end
      end

      struct UpdateHostedZoneAssociationInput
        include JSON::Serializable

        # The ID of the private hosted zone association.
        @[JSON::Field(key: "hostedZoneAssociationId")]
        getter hosted_zone_association_id : String

        # The name you want to update the hosted zone association to.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @hosted_zone_association_id : String,
          @name : String? = nil
        )
        end
      end

      struct UpdateHostedZoneAssociationOutput
        include JSON::Serializable

        # The time and date the private hosted zone association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the private hosted zone.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String

        # The name of the domain associated with the private hosted zone.
        @[JSON::Field(key: "hostedZoneName")]
        getter hosted_zone_name : String

        # The ID of the private hosted zone association.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the private hosted zone association.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the private hosted zone association.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The operational status of the private hosted zone association.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time and date the private hosted zone association was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @created_at : Time,
          @hosted_zone_id : String,
          @hosted_zone_name : String,
          @id : String,
          @name : String,
          @resource_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      # The input parameters are invalid. Check the parameter values and try again.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Reason the request failed validation.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The list of fields that aren't valid.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Information about a field that failed validation.
      struct ValidationExceptionField
        include JSON::Serializable

        # The validation error message for the field.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that failed validation.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
