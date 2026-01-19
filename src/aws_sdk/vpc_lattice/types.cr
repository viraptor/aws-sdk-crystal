require "json"
require "time"

module AwsSdk
  module VPCLattice
    module Types

      # The user does not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Summary information about an access log subscription.
      struct AccessLogSubscriptionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access log subscription
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the access log subscription was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The ID of the access log subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time that the access log subscription was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the service or service network.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the service or service network.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Log type of the service network.
        @[JSON::Field(key: "serviceNetworkLogType")]
        getter service_network_log_type : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @destination_arn : String,
          @id : String,
          @last_updated_at : Time,
          @resource_arn : String,
          @resource_id : String,
          @service_network_log_type : String? = nil
        )
        end
      end

      # The Amazon Resource Name (ARN) of the resource.
      struct ArnResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      struct BatchUpdateRuleRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The rules for the specified listener.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RuleUpdate)

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @listener_identifier : String,
          @rules : Array(Types::RuleUpdate),
          @service_identifier : String
        )
        end
      end

      struct BatchUpdateRuleResponse
        include JSON::Serializable

        # The rules that were successfully updated.
        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::RuleUpdateSuccess)?

        # The rules that the operation couldn't update.
        @[JSON::Field(key: "unsuccessful")]
        getter unsuccessful : Array(Types::RuleUpdateFailure)?

        def initialize(
          @successful : Array(Types::RuleUpdateSuccess)? = nil,
          @unsuccessful : Array(Types::RuleUpdateFailure)? = nil
        )
        end
      end

      # The request conflicts with the current state of the resource. Updating or deleting a resource can
      # cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateAccessLogSubscriptionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination. The supported destination types are CloudWatch
        # Log groups, Kinesis Data Firehose delivery streams, and Amazon S3 buckets.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The ID or ARN of the service network or service.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The type of log that monitors your Amazon VPC Lattice service networks.
        @[JSON::Field(key: "serviceNetworkLogType")]
        getter service_network_log_type : String?

        # The tags for the access log subscription.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_arn : String,
          @resource_identifier : String,
          @client_token : String? = nil,
          @service_network_log_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAccessLogSubscriptionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access log subscription.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the log destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The ID of the access log subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the service network or service.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the service network or service.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of log that monitors your Amazon VPC Lattice service networks.
        @[JSON::Field(key: "serviceNetworkLogType")]
        getter service_network_log_type : String?

        def initialize(
          @arn : String,
          @destination_arn : String,
          @id : String,
          @resource_arn : String,
          @resource_id : String,
          @service_network_log_type : String? = nil
        )
        end
      end

      struct CreateListenerRequest
        include JSON::Serializable

        # The action for the default rule. Each listener has a default rule. The default rule is used if no
        # other rules match.
        @[JSON::Field(key: "defaultAction")]
        getter default_action : Types::RuleAction

        # The name of the listener. A listener name must be unique within a service. The valid characters are
        # a-z, 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or immediately
        # after another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The listener protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The listener port. You can specify a value from 1 to 65535. For HTTP, the default is 80. For HTTPS,
        # the default is 443.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The tags for the listener.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @default_action : Types::RuleAction,
          @name : String,
          @protocol : String,
          @service_identifier : String,
          @client_token : String? = nil,
          @port : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateListenerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The action for the default rule.
        @[JSON::Field(key: "defaultAction")]
        getter default_action : Types::RuleAction?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The port number of the listener.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol of the listener.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ID of the service.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String?

        def initialize(
          @arn : String? = nil,
          @default_action : Types::RuleAction? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil
        )
        end
      end

      struct CreateResourceConfigurationRequest
        include JSON::Serializable

        # The name of the resource configuration. The name must be unique within the account. The valid
        # characters are a-z, 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or
        # immediately after another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of resource configuration. A resource configuration can be one of the following types:
        # SINGLE - A single resource. GROUP - A group of resources. You must create a group resource
        # configuration before you create a child resource configuration. CHILD - A single resource that is
        # part of a group resource configuration. ARN - An Amazon Web Services resource.
        @[JSON::Field(key: "type")]
        getter type : String

        # (SINGLE, GROUP, ARN) Specifies whether the resource configuration can be associated with a sharable
        # service network. The default is false.
        @[JSON::Field(key: "allowAssociationToShareableServiceNetwork")]
        getter allow_association_to_shareable_service_network : Bool?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A custom domain name for your resource configuration. Additionally, provide a DomainVerificationID
        # to prove your ownership of a domain.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The domain verification ID of your verified custom domain name. If you don't provide an ID, you must
        # configure the DNS settings yourself.
        @[JSON::Field(key: "domainVerificationIdentifier")]
        getter domain_verification_identifier : String?

        # (GROUP) The group domain for a group resource configuration. Any domains that you create for the
        # child resource are subdomains of the group domain. Child resources inherit the verification status
        # of the domain.
        @[JSON::Field(key: "groupDomain")]
        getter group_domain : String?

        # (SINGLE, GROUP, CHILD) The TCP port ranges that a consumer can use to access a resource
        # configuration (for example: 1-65535). You can separate port ranges using commas (for example:
        # 1,2,22-30).
        @[JSON::Field(key: "portRanges")]
        getter port_ranges : Array(String)?

        # (SINGLE, GROUP) The protocol accepted by the resource configuration.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Identifies the resource configuration in one of the following ways: Amazon Resource Name (ARN) -
        # Supported resource-types that are provisioned by Amazon Web Services services, such as RDS
        # databases, can be identified by their ARN. Domain name - Any domain name that is publicly
        # resolvable. IP address - For IPv4 and IPv6, only IP addresses in the VPC are supported.
        @[JSON::Field(key: "resourceConfigurationDefinition")]
        getter resource_configuration_definition : Types::ResourceConfigurationDefinition?

        # (CHILD) The ID or ARN of the parent resource configuration of type GROUP . This is used to associate
        # a child resource configuration with a group resource configuration.
        @[JSON::Field(key: "resourceConfigurationGroupIdentifier")]
        getter resource_configuration_group_identifier : String?

        # (SINGLE, GROUP, ARN) The ID or ARN of the resource gateway used to connect to the resource
        # configuration. For a child resource configuration, this value is inherited from the parent resource
        # configuration.
        @[JSON::Field(key: "resourceGatewayIdentifier")]
        getter resource_gateway_identifier : String?

        # The tags for the resource configuration.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @allow_association_to_shareable_service_network : Bool? = nil,
          @client_token : String? = nil,
          @custom_domain_name : String? = nil,
          @domain_verification_identifier : String? = nil,
          @group_domain : String? = nil,
          @port_ranges : Array(String)? = nil,
          @protocol : String? = nil,
          @resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil,
          @resource_configuration_group_identifier : String? = nil,
          @resource_gateway_identifier : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateResourceConfigurationResponse
        include JSON::Serializable

        # Specifies whether the resource configuration can be associated with a sharable service network.
        @[JSON::Field(key: "allowAssociationToShareableServiceNetwork")]
        getter allow_association_to_shareable_service_network : Bool?

        # The Amazon Resource Name (ARN) of the resource configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the resource configuration was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The custom domain name for your resource configuration.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The verification ID ARN
        @[JSON::Field(key: "domainVerificationArn")]
        getter domain_verification_arn : String?

        # The domain name verification ID.
        @[JSON::Field(key: "domainVerificationId")]
        getter domain_verification_id : String?

        # The reason that the request failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # (GROUP) The group domain for a group resource configuration. Any domains that you create for the
        # child resource are subdomains of the group domain. Child resources inherit the verification status
        # of the domain.
        @[JSON::Field(key: "groupDomain")]
        getter group_domain : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the resource configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The port range.
        @[JSON::Field(key: "portRanges")]
        getter port_ranges : Array(String)?

        # The protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Identifies the resource configuration in one of the following ways: Amazon Resource Name (ARN) -
        # Supported resource-types that are provisioned by Amazon Web Services services, such as RDS
        # databases, can be identified by their ARN. Domain name - Any domain name that is publicly
        # resolvable. IP address - For IPv4 and IPv6, only IP addresses in the VPC are supported.
        @[JSON::Field(key: "resourceConfigurationDefinition")]
        getter resource_configuration_definition : Types::ResourceConfigurationDefinition?

        # The ID of the parent resource configuration of type GROUP .
        @[JSON::Field(key: "resourceConfigurationGroupId")]
        getter resource_configuration_group_id : String?

        # The ID of the resource gateway associated with the resource configuration.
        @[JSON::Field(key: "resourceGatewayId")]
        getter resource_gateway_id : String?

        # The current status of the resource configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of resource configuration. A resource configuration can be one of the following types:
        # SINGLE - A single resource. GROUP - A group of resources. You must create a group resource
        # configuration before you create a child resource configuration. CHILD - A single resource that is
        # part of a group resource configuration. ARN - An Amazon Web Services resource.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allow_association_to_shareable_service_network : Bool? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @custom_domain_name : String? = nil,
          @domain_verification_arn : String? = nil,
          @domain_verification_id : String? = nil,
          @failure_reason : String? = nil,
          @group_domain : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @port_ranges : Array(String)? = nil,
          @protocol : String? = nil,
          @resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil,
          @resource_configuration_group_id : String? = nil,
          @resource_gateway_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct CreateResourceGatewayRequest
        include JSON::Serializable

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A resource gateway can have IPv4, IPv6 or dualstack addresses. The IP address type of a resource
        # gateway must be compatible with the subnets of the resource gateway and the IP address type of the
        # resource, as described here: IPv4 Assign IPv4 addresses to your resource gateway network interfaces.
        # This option is supported only if all selected subnets have IPv4 address ranges, and the resource
        # also has an IPv4 address. IPv6 Assign IPv6 addresses to your resource gateway network interfaces.
        # This option is supported only if all selected subnets are IPv6 only subnets, and the resource also
        # has an IPv6 address. Dualstack Assign both IPv4 and IPv6 addresses to your resource gateway network
        # interfaces. This option is supported only if all selected subnets have both IPv4 and IPv6 address
        # ranges, and the resource either has an IPv4 or IPv6 address. The IP address type of the resource
        # gateway is independent of the IP address type of the client or the VPC endpoint through which the
        # resource is accessed.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The number of IPv4 addresses in each ENI for the resource gateway.
        @[JSON::Field(key: "ipv4AddressesPerEni")]
        getter ipv4_addresses_per_eni : Int32?

        # The IDs of the security groups to apply to the resource gateway. The security groups must be in the
        # same VPC.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the VPC subnets in which to create the resource gateway.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The tags for the resource gateway.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the VPC for the resource gateway.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @ip_address_type : String? = nil,
          @ipv4_addresses_per_eni : Int32? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      struct CreateResourceGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the resource gateway.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of IP address for the resource gateway.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The number of IPv4 addresses in each ENI for the resource gateway.
        @[JSON::Field(key: "ipv4AddressesPerEni")]
        getter ipv4_addresses_per_eni : Int32?

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The IDs of the security groups for the resource gateway.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The status of the resource gateway.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The IDs of the resource gateway subnets.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @ip_address_type : String? = nil,
          @ipv4_addresses_per_eni : Int32? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      struct CreateRuleRequest
        include JSON::Serializable

        # The action for the default rule.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch

        # The name of the rule. The name must be unique within the listener. The valid characters are a-z,
        # 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or immediately after
        # another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The priority assigned to the rule. Each rule for a specific listener must have a unique priority.
        # The lower the priority number the higher the priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags for the rule.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : Types::RuleAction,
          @listener_identifier : String,
          @match : Types::RuleMatch,
          @name : String,
          @priority : Int32,
          @service_identifier : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRuleResponse
        include JSON::Serializable

        # The rule action.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The Amazon Resource Name (ARN) of the rule.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the rule.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The rule match. The RuleMatch must be an HttpMatch . This means that the rule should be an exact
        # match on HTTP constraints which are made up of the HTTP method, path, and header.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The priority assigned to the rule. The lower the priority number the higher the priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @action : Types::RuleAction? = nil,
          @arn : String? = nil,
          @id : String? = nil,
          @match : Types::RuleMatch? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end

      struct CreateServiceNetworkRequest
        include JSON::Serializable

        # The name of the service network. The name must be unique to the account. The valid characters are
        # a-z, 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or immediately
        # after another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of IAM policy. NONE : The resource does not use an IAM policy. This is the default. AWS_IAM
        # : The resource uses an IAM policy. When this type is used, auth is enabled and an auth policy is
        # required.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specify if the service network should be enabled for sharing.
        @[JSON::Field(key: "sharingConfig")]
        getter sharing_config : Types::SharingConfig?

        # The tags for the service network.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @auth_type : String? = nil,
          @client_token : String? = nil,
          @sharing_config : Types::SharingConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateServiceNetworkResourceAssociationRequest
        include JSON::Serializable

        # The ID of the resource configuration to associate with the service network.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String

        # The ID of the service network to associate with the resource configuration.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Indicates if private DNS is enabled for the service network resource association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # A key-value pair to associate with a resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_configuration_identifier : String,
          @service_network_identifier : String,
          @client_token : String? = nil,
          @private_dns_enabled : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateServiceNetworkResourceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates if private DNS is is enabled for the service network resource association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @private_dns_enabled : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateServiceNetworkResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The ID of the service network.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the service network.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies if the service network is enabled for sharing.
        @[JSON::Field(key: "sharingConfig")]
        getter sharing_config : Types::SharingConfig?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @sharing_config : Types::SharingConfig? = nil
        )
        end
      end

      struct CreateServiceNetworkServiceAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # The ID or ARN of the service network. You must use an ARN if the resources are in different
        # accounts.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags for the association.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @service_identifier : String,
          @service_network_identifier : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateServiceNetworkServiceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The DNS name of the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The association status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateServiceNetworkVpcAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the service network. You must use an ARN if the resources are in different
        # accounts.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        # The ID of the VPC.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # DNS options for the service network VPC association.
        @[JSON::Field(key: "dnsOptions")]
        getter dns_options : Types::DnsOptions?

        # Indicates if private DNS is enabled for the VPC association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The IDs of the security groups. Security groups aren't added by default. You can add a security
        # group to apply network level controls to control which resources in a VPC are allowed to access the
        # service network and its services. For more information, see Control traffic to resources using
        # security groups in the Amazon VPC User Guide .
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The tags for the association.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @service_network_identifier : String,
          @vpc_identifier : String,
          @client_token : String? = nil,
          @dns_options : Types::DnsOptions? = nil,
          @private_dns_enabled : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateServiceNetworkVpcAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        @[JSON::Field(key: "dnsOptions")]
        getter dns_options : Types::DnsOptions?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates if private DNS is enabled for the VPC association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The IDs of the security groups.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The association status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @dns_options : Types::DnsOptions? = nil,
          @id : String? = nil,
          @private_dns_enabled : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateServiceRequest
        include JSON::Serializable

        # The name of the service. The name must be unique within the account. The valid characters are a-z,
        # 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or immediately after
        # another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of IAM policy. NONE : The resource does not use an IAM policy. This is the default. AWS_IAM
        # : The resource uses an IAM policy. When this type is used, auth is enabled and an auth policy is
        # required.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The tags for the service.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil,
          @client_token : String? = nil,
          @custom_domain_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateServiceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The public DNS name of the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The ID of the service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the service.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status. If the status is CREATE_FAILED , you must delete and recreate the service.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateTargetGroupRequest
        include JSON::Serializable

        # The name of the target group. The name must be unique within the account. The valid characters are
        # a-z, 0-9, and hyphens (-). You can't use a hyphen as the first or last character, or immediately
        # after another hyphen.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of target group.
        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The target group configuration.
        @[JSON::Field(key: "config")]
        getter config : Types::TargetGroupConfig?

        # The tags for the target group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @config : Types::TargetGroupConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTargetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The target group configuration.
        @[JSON::Field(key: "config")]
        getter config : Types::TargetGroupConfig?

        # The ID of the target group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the target group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status. You can retry the operation if the status is CREATE_FAILED . However, if you retry it
        # while the status is CREATE_IN_PROGRESS , there is no change in the status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of target group.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @config : Types::TargetGroupConfig? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DeleteAccessLogSubscriptionRequest
        include JSON::Serializable

        # The ID or ARN of the access log subscription.
        @[JSON::Field(key: "accessLogSubscriptionIdentifier")]
        getter access_log_subscription_identifier : String

        def initialize(
          @access_log_subscription_identifier : String
        )
        end
      end

      struct DeleteAccessLogSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAuthPolicyRequest
        include JSON::Serializable

        # The ID or ARN of the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @resource_identifier : String
        )
        end
      end

      struct DeleteAuthPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDomainVerificationRequest
        include JSON::Serializable

        # The ID of the domain verification to delete.
        @[JSON::Field(key: "domainVerificationIdentifier")]
        getter domain_verification_identifier : String

        def initialize(
          @domain_verification_identifier : String
        )
        end
      end

      struct DeleteDomainVerificationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteListenerRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @listener_identifier : String,
          @service_identifier : String
        )
        end
      end

      struct DeleteListenerResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourceConfigurationRequest
        include JSON::Serializable

        # The ID or ARN of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String

        def initialize(
          @resource_configuration_identifier : String
        )
        end
      end

      struct DeleteResourceConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourceEndpointAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the association.
        @[JSON::Field(key: "resourceEndpointAssociationIdentifier")]
        getter resource_endpoint_association_identifier : String

        def initialize(
          @resource_endpoint_association_identifier : String
        )
        end
      end

      struct DeleteResourceEndpointAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the resource configuration associated with the VPC endpoint of
        # type resource.
        @[JSON::Field(key: "resourceConfigurationArn")]
        getter resource_configuration_arn : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationId")]
        getter resource_configuration_id : String?

        # The ID of the resource VPC endpoint that is associated with the resource configuration.
        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @resource_configuration_arn : String? = nil,
          @resource_configuration_id : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct DeleteResourceGatewayRequest
        include JSON::Serializable

        # The ID or ARN of the resource gateway.
        @[JSON::Field(key: "resourceGatewayIdentifier")]
        getter resource_gateway_identifier : String

        def initialize(
          @resource_gateway_identifier : String
        )
        end
      end

      struct DeleteResourceGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the resource gateway.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the resource gateway.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
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

      struct DeleteRuleRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the rule.
        @[JSON::Field(key: "ruleIdentifier")]
        getter rule_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @listener_identifier : String,
          @rule_identifier : String,
          @service_identifier : String
        )
        end
      end

      struct DeleteRuleResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteServiceNetworkRequest
        include JSON::Serializable

        # The ID or ARN of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        def initialize(
          @service_network_identifier : String
        )
        end
      end

      struct DeleteServiceNetworkResourceAssociationRequest
        include JSON::Serializable

        # The ID of the association.
        @[JSON::Field(key: "serviceNetworkResourceAssociationIdentifier")]
        getter service_network_resource_association_identifier : String

        def initialize(
          @service_network_resource_association_identifier : String
        )
        end
      end

      struct DeleteServiceNetworkResourceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteServiceNetworkResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteServiceNetworkServiceAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the association.
        @[JSON::Field(key: "serviceNetworkServiceAssociationIdentifier")]
        getter service_network_service_association_identifier : String

        def initialize(
          @service_network_service_association_identifier : String
        )
        end
      end

      struct DeleteServiceNetworkServiceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status. You can retry the operation if the status is DELETE_FAILED . However, if you retry it
        # when the status is DELETE_IN_PROGRESS , there is no change in the status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteServiceNetworkVpcAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the association.
        @[JSON::Field(key: "serviceNetworkVpcAssociationIdentifier")]
        getter service_network_vpc_association_identifier : String

        def initialize(
          @service_network_vpc_association_identifier : String
        )
        end
      end

      struct DeleteServiceNetworkVpcAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status. You can retry the operation if the status is DELETE_FAILED . However, if you retry it
        # while the status is DELETE_IN_PROGRESS , there is no change in the status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteServiceRequest
        include JSON::Serializable

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @service_identifier : String
        )
        end
      end

      struct DeleteServiceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the service.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status. You can retry the operation if the status is DELETE_FAILED . However, if you retry it
        # while the status is DELETE_IN_PROGRESS , the status doesn't change.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteTargetGroupRequest
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        def initialize(
          @target_group_identifier : String
        )
        end
      end

      struct DeleteTargetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the target group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status. You can retry the operation if the status is DELETE_FAILED . However, if you retry it
        # while the status is DELETE_IN_PROGRESS , the status doesn't change.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeregisterTargetsRequest
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        # The targets to deregister.
        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::Target)

        def initialize(
          @target_group_identifier : String,
          @targets : Array(Types::Target)
        )
        end
      end

      struct DeregisterTargetsResponse
        include JSON::Serializable

        # The targets that were successfully deregistered.
        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::Target)?

        # The targets that the operation couldn't deregister.
        @[JSON::Field(key: "unsuccessful")]
        getter unsuccessful : Array(Types::TargetFailure)?

        def initialize(
          @successful : Array(Types::Target)? = nil,
          @unsuccessful : Array(Types::TargetFailure)? = nil
        )
        end
      end

      # Describes the DNS information of a service.
      struct DnsEntry
        include JSON::Serializable

        # The domain name of the service.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The ID of the hosted zone.
        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String?

        def initialize(
          @domain_name : String? = nil,
          @hosted_zone_id : String? = nil
        )
        end
      end

      # The DNS configuration options.
      struct DnsOptions
        include JSON::Serializable

        # The preference for which private domains have a private hosted zone created for and associated with
        # the specified VPC. Only supported when private DNS is enabled and when the VPC endpoint type is
        # ServiceNetwork or Resource. ALL_DOMAINS - VPC Lattice provisions private hosted zones for all custom
        # domain names. VERIFIED_DOMAINS_ONLY - VPC Lattice provisions a private hosted zone only if custom
        # domain name has been verified by the provider. VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS - VPC Lattice
        # provisions private hosted zones for all verified custom domain names and other domain names that the
        # resource consumer specifies. The resource consumer specifies the domain names in the
        # privateDnsSpecifiedDomains parameter. SPECIFIED_DOMAINS_ONLY - VPC Lattice provisions a private
        # hosted zone for domain names specified by the resource consumer. The resource consumer specifies the
        # domain names in the privateDnsSpecifiedDomains parameter.
        @[JSON::Field(key: "privateDnsPreference")]
        getter private_dns_preference : String?

        # Indicates which of the private domains to create private hosted zones for and associate with the
        # specified VPC. Only supported when private DNS is enabled and the private DNS preference is
        # VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS or SPECIFIED_DOMAINS_ONLY .
        @[JSON::Field(key: "privateDnsSpecifiedDomains")]
        getter private_dns_specified_domains : Array(String)?

        def initialize(
          @private_dns_preference : String? = nil,
          @private_dns_specified_domains : Array(String)? = nil
        )
        end
      end

      # The DNS name of the resource.
      struct DnsResource
        include JSON::Serializable

        # The domain name of the resource.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The type of IP address. Dualstack is currently not supported.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        def initialize(
          @domain_name : String? = nil,
          @ip_address_type : String? = nil
        )
        end
      end

      # Summary information about a domain verification.
      struct DomainVerificationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain verification.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the domain verification was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The domain name being verified.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The ID of the domain verification.
        @[JSON::Field(key: "id")]
        getter id : String

        # The current status of the domain verification process.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time that the domain was last successfully verified, in ISO-8601 format.
        @[JSON::Field(key: "lastVerifiedTime")]
        getter last_verified_time : Time?

        # The tags associated with the domain verification.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The TXT record configuration used for domain verification.
        @[JSON::Field(key: "txtMethodConfig")]
        getter txt_method_config : Types::TxtMethodConfig?

        def initialize(
          @arn : String,
          @created_at : Time,
          @domain_name : String,
          @id : String,
          @status : String,
          @last_verified_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @txt_method_config : Types::TxtMethodConfig? = nil
        )
        end
      end

      # Describes an action that returns a custom HTTP response.
      struct FixedResponseAction
        include JSON::Serializable

        # The HTTP response code. Only 404 and 500 status codes are supported.
        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32

        def initialize(
          @status_code : Int32
        )
        end
      end

      # Describes a forward action. You can use forward actions to route requests to one or more target
      # groups.
      struct ForwardAction
        include JSON::Serializable

        # The target groups. Traffic matching the rule is forwarded to the specified target groups. With
        # forward actions, you can assign a weight that controls the prioritization and selection of each
        # target group. This means that requests are distributed to individual target groups based on their
        # weights. For example, if two target groups have the same weight, each target group receives half of
        # the traffic. The default value is 1. This means that if only one target group is provided, there is
        # no need to set the weight; 100% of the traffic goes to that target group.
        @[JSON::Field(key: "targetGroups")]
        getter target_groups : Array(Types::WeightedTargetGroup)

        def initialize(
          @target_groups : Array(Types::WeightedTargetGroup)
        )
        end
      end

      struct GetAccessLogSubscriptionRequest
        include JSON::Serializable

        # The ID or ARN of the access log subscription.
        @[JSON::Field(key: "accessLogSubscriptionIdentifier")]
        getter access_log_subscription_identifier : String

        def initialize(
          @access_log_subscription_identifier : String
        )
        end
      end

      struct GetAccessLogSubscriptionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access log subscription.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the access log subscription was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the access log destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The ID of the access log subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time that the access log subscription was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the service network or service.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the service network or service.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The log type for the service network.
        @[JSON::Field(key: "serviceNetworkLogType")]
        getter service_network_log_type : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @destination_arn : String,
          @id : String,
          @last_updated_at : Time,
          @resource_arn : String,
          @resource_id : String,
          @service_network_log_type : String? = nil
        )
        end
      end

      struct GetAuthPolicyRequest
        include JSON::Serializable

        # The ID or ARN of the service network or service.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @resource_identifier : String
        )
        end
      end

      struct GetAuthPolicyResponse
        include JSON::Serializable

        # The date and time that the auth policy was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The date and time that the auth policy was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The auth policy.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The state of the auth policy. The auth policy is only active when the auth type is set to AWS_IAM .
        # If you provide a policy, then authentication and authorization decisions are made based on this
        # policy and the client's IAM policy. If the auth type is NONE , then any auth policy that you provide
        # remains inactive. For more information, see Create a service network in the Amazon VPC Lattice User
        # Guide .
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @policy : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct GetDomainVerificationRequest
        include JSON::Serializable

        # The ID or ARN of the domain verification to retrieve.
        @[JSON::Field(key: "domainVerificationIdentifier")]
        getter domain_verification_identifier : String

        def initialize(
          @domain_verification_identifier : String
        )
        end
      end

      struct GetDomainVerificationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain verification.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the domain verification was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The domain name being verified.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The ID of the domain verification.
        @[JSON::Field(key: "id")]
        getter id : String

        # The current status of the domain verification process.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time that the domain was last successfully verified, in ISO-8601 format.
        @[JSON::Field(key: "lastVerifiedTime")]
        getter last_verified_time : Time?

        # The tags associated with the domain verification.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The TXT record configuration used for domain verification.
        @[JSON::Field(key: "txtMethodConfig")]
        getter txt_method_config : Types::TxtMethodConfig?

        def initialize(
          @arn : String,
          @created_at : Time,
          @domain_name : String,
          @id : String,
          @status : String,
          @last_verified_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @txt_method_config : Types::TxtMethodConfig? = nil
        )
        end
      end

      struct GetListenerRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @listener_identifier : String,
          @service_identifier : String
        )
        end
      end

      struct GetListenerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the listener was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The actions for the default listener rule.
        @[JSON::Field(key: "defaultAction")]
        getter default_action : Types::RuleAction?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the listener was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The listener port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The listener protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ID of the service.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @default_action : Types::RuleAction? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil
        )
        end
      end

      struct GetResourceConfigurationRequest
        include JSON::Serializable

        # The ID of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String

        def initialize(
          @resource_configuration_identifier : String
        )
        end
      end

      struct GetResourceConfigurationResponse
        include JSON::Serializable

        # Specifies whether the resource configuration is associated with a sharable service network.
        @[JSON::Field(key: "allowAssociationToShareableServiceNetwork")]
        getter allow_association_to_shareable_service_network : Bool?

        # Indicates whether the resource configuration was created and is managed by Amazon.
        @[JSON::Field(key: "amazonManaged")]
        getter amazon_managed : Bool?

        # The Amazon Resource Name (ARN) of the resource configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the resource configuration was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The custom domain name of the resource configuration.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The ARN of the domain verification.
        @[JSON::Field(key: "domainVerificationArn")]
        getter domain_verification_arn : String?

        # The domain verification ID.
        @[JSON::Field(key: "domainVerificationId")]
        getter domain_verification_id : String?

        # The domain verification status.
        @[JSON::Field(key: "domainVerificationStatus")]
        getter domain_verification_status : String?

        # The reason the create-resource-configuration request failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # (GROUP) The group domain for a group resource configuration. Any domains that you create for the
        # child resource are subdomains of the group domain. Child resources inherit the verification status
        # of the domain.
        @[JSON::Field(key: "groupDomain")]
        getter group_domain : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The most recent date and time that the resource configuration was updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the resource configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The TCP port ranges that a consumer can use to access a resource configuration. You can separate
        # port ranges with a comma. Example: 1-65535 or 1,2,22-30
        @[JSON::Field(key: "portRanges")]
        getter port_ranges : Array(String)?

        # The TCP protocol accepted by the specified resource configuration.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The resource configuration.
        @[JSON::Field(key: "resourceConfigurationDefinition")]
        getter resource_configuration_definition : Types::ResourceConfigurationDefinition?

        # The ID of the group resource configuration.
        @[JSON::Field(key: "resourceConfigurationGroupId")]
        getter resource_configuration_group_id : String?

        # The ID of the resource gateway used to connect to the resource configuration in a given VPC. You can
        # specify the resource gateway identifier only for resource configurations with type SINGLE, GROUP, or
        # ARN.
        @[JSON::Field(key: "resourceGatewayId")]
        getter resource_gateway_id : String?

        # The status of the resource configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of resource configuration. SINGLE - A single resource. GROUP - A group of resources. CHILD
        # - A single resource that is part of a group resource configuration. ARN - An Amazon Web Services
        # resource.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allow_association_to_shareable_service_network : Bool? = nil,
          @amazon_managed : Bool? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @custom_domain_name : String? = nil,
          @domain_verification_arn : String? = nil,
          @domain_verification_id : String? = nil,
          @domain_verification_status : String? = nil,
          @failure_reason : String? = nil,
          @group_domain : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @port_ranges : Array(String)? = nil,
          @protocol : String? = nil,
          @resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil,
          @resource_configuration_group_id : String? = nil,
          @resource_gateway_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct GetResourceGatewayRequest
        include JSON::Serializable

        # The ID of the resource gateway.
        @[JSON::Field(key: "resourceGatewayIdentifier")]
        getter resource_gateway_identifier : String

        def initialize(
          @resource_gateway_identifier : String
        )
        end
      end

      struct GetResourceGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the resource gateway was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the resource gateway.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of IP address for the resource gateway.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The number of IPv4 addresses in each ENI for the resource gateway.
        @[JSON::Field(key: "ipv4AddressesPerEni")]
        getter ipv4_addresses_per_eni : Int32?

        # The date and time that the resource gateway was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The security group IDs associated with the resource gateway.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The status for the resource gateway.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The IDs of the VPC subnets for resource gateway.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC for the resource gateway.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @ip_address_type : String? = nil,
          @ipv4_addresses_per_eni : Int32? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service network or service.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # An IAM policy.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      struct GetRuleRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the listener rule.
        @[JSON::Field(key: "ruleIdentifier")]
        getter rule_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @listener_identifier : String,
          @rule_identifier : String,
          @service_identifier : String
        )
        end
      end

      struct GetRuleResponse
        include JSON::Serializable

        # The action for the default rule.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the listener rule was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether this is the default rule.
        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool?

        # The date and time that the listener rule was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The priority level for the specified rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @action : Types::RuleAction? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @is_default : Bool? = nil,
          @last_updated_at : Time? = nil,
          @match : Types::RuleMatch? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end

      struct GetServiceNetworkRequest
        include JSON::Serializable

        # The ID or ARN of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        def initialize(
          @service_network_identifier : String
        )
        end
      end

      struct GetServiceNetworkResourceAssociationRequest
        include JSON::Serializable

        # The ID of the association.
        @[JSON::Field(key: "serviceNetworkResourceAssociationIdentifier")]
        getter service_network_resource_association_identifier : String

        def initialize(
          @service_network_resource_association_identifier : String
        )
        end
      end

      struct GetServiceNetworkResourceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The DNS entry for the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The domain verification status in the service network resource association.
        @[JSON::Field(key: "domainVerificationStatus")]
        getter domain_verification_status : String?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The reason the association request failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether the association is managed by Amazon.
        @[JSON::Field(key: "isManagedAssociation")]
        getter is_managed_association : Bool?

        # The most recent date and time that the association was updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates if private DNS is enabled in the service network resource association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The private DNS entry for the service.
        @[JSON::Field(key: "privateDnsEntry")]
        getter private_dns_entry : Types::DnsEntry?

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "resourceConfigurationArn")]
        getter resource_configuration_arn : String?

        # The ID of the resource configuration that is associated with the service network.
        @[JSON::Field(key: "resourceConfigurationId")]
        getter resource_configuration_id : String?

        # The name of the resource configuration that is associated with the service network.
        @[JSON::Field(key: "resourceConfigurationName")]
        getter resource_configuration_name : String?

        # The Amazon Resource Name (ARN) of the service network that is associated with the resource
        # configuration.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network that is associated with the resource configuration.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network that is associated with the resource configuration.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @domain_verification_status : String? = nil,
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @id : String? = nil,
          @is_managed_association : Bool? = nil,
          @last_updated_at : Time? = nil,
          @private_dns_enabled : Bool? = nil,
          @private_dns_entry : Types::DnsEntry? = nil,
          @resource_configuration_arn : String? = nil,
          @resource_configuration_id : String? = nil,
          @resource_configuration_name : String? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetServiceNetworkResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The date and time that the service network was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the service network.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time of the last update, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the service network.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of services associated with the service network.
        @[JSON::Field(key: "numberOfAssociatedServices")]
        getter number_of_associated_services : Int64?

        # The number of VPCs associated with the service network.
        @[JSON::Field(key: "numberOfAssociatedVPCs")]
        getter number_of_associated_vp_cs : Int64?

        # Specifies if the service network is enabled for sharing.
        @[JSON::Field(key: "sharingConfig")]
        getter sharing_config : Types::SharingConfig?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @number_of_associated_services : Int64? = nil,
          @number_of_associated_vp_cs : Int64? = nil,
          @sharing_config : Types::SharingConfig? = nil
        )
        end
      end

      struct GetServiceNetworkServiceAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the association.
        @[JSON::Field(key: "serviceNetworkServiceAssociationIdentifier")]
        getter service_network_service_association_identifier : String

        def initialize(
          @service_network_service_association_identifier : String
        )
        end
      end

      struct GetServiceNetworkServiceAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The DNS name of the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID of the service network and service association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ID of the service.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String?

        # The name of the service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil,
          @service_name : String? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetServiceNetworkVpcAssociationRequest
        include JSON::Serializable

        # The ID or ARN of the association.
        @[JSON::Field(key: "serviceNetworkVpcAssociationIdentifier")]
        getter service_network_vpc_association_identifier : String

        def initialize(
          @service_network_vpc_association_identifier : String
        )
        end
      end

      struct GetServiceNetworkVpcAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # DNS options for the service network VPC association.
        @[JSON::Field(key: "dnsOptions")]
        getter dns_options : Types::DnsOptions?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the association was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates if private DNS is enabled in the VPC association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The IDs of the security groups.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status of the association.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the VPC.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @dns_options : Types::DnsOptions? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @private_dns_enabled : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct GetServiceRequest
        include JSON::Serializable

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @service_identifier : String
        )
        end
      end

      struct GetServiceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The date and time that the service was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The DNS name of the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID of the service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the service was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the service.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the service.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil,
          @created_at : Time? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTargetGroupRequest
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        def initialize(
          @target_group_identifier : String
        )
        end
      end

      struct GetTargetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The target group configuration.
        @[JSON::Field(key: "config")]
        getter config : Types::TargetGroupConfig?

        # The date and time that the target group was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID of the target group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the target group was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the target group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Names (ARNs) of the service.
        @[JSON::Field(key: "serviceArns")]
        getter service_arns : Array(String)?

        # The status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The target group type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @config : Types::TargetGroupConfig? = nil,
          @created_at : Time? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @service_arns : Array(String)? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the constraints for a header match. Matches incoming requests with rule based on request
      # header value before applying rule action.
      struct HeaderMatch
        include JSON::Serializable

        # The header match type.
        @[JSON::Field(key: "match")]
        getter match : Types::HeaderMatchType

        # The name of the header.
        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether the match is case sensitive.
        @[JSON::Field(key: "caseSensitive")]
        getter case_sensitive : Bool?

        def initialize(
          @match : Types::HeaderMatchType,
          @name : String,
          @case_sensitive : Bool? = nil
        )
        end
      end

      # Describes a header match type.
      struct HeaderMatchType
        include JSON::Serializable

        # A contains type match.
        @[JSON::Field(key: "contains")]
        getter contains : String?

        # An exact type match.
        @[JSON::Field(key: "exact")]
        getter exact : String?

        # A prefix type match. Matches the value with the prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @contains : String? = nil,
          @exact : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes the health check configuration of a target group. Health check configurations aren't used
      # for target groups of type LAMBDA or ALB .
      struct HealthCheckConfig
        include JSON::Serializable

        # Indicates whether health checking is enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The approximate amount of time, in seconds, between health checks of an individual target. The range
        # is 5–300 seconds. The default is 30 seconds.
        @[JSON::Field(key: "healthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # The amount of time, in seconds, to wait before reporting a target as unhealthy. The range is 1–120
        # seconds. The default is 5 seconds.
        @[JSON::Field(key: "healthCheckTimeoutSeconds")]
        getter health_check_timeout_seconds : Int32?

        # The number of consecutive successful health checks required before considering an unhealthy target
        # healthy. The range is 2–10. The default is 5.
        @[JSON::Field(key: "healthyThresholdCount")]
        getter healthy_threshold_count : Int32?

        # The codes to use when checking for a successful response from a target.
        @[JSON::Field(key: "matcher")]
        getter matcher : Types::Matcher?

        # The destination for health checks on the targets. If the protocol version is HTTP/1.1 or HTTP/2 ,
        # specify a valid URI (for example, /path?query ). The default path is / . Health checks are not
        # supported if the protocol version is gRPC , however, you can choose HTTP/1.1 or HTTP/2 and specify a
        # valid URI.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The port used when performing health checks on targets. The default setting is the port that a
        # target receives traffic on.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol used when performing health checks on targets. The possible protocols are HTTP and
        # HTTPS . The default is HTTP .
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The protocol version used when performing health checks on targets. The possible protocol versions
        # are HTTP1 and HTTP2 .
        @[JSON::Field(key: "protocolVersion")]
        getter protocol_version : String?

        # The number of consecutive failed health checks required before considering a target unhealthy. The
        # range is 2–10. The default is 2.
        @[JSON::Field(key: "unhealthyThresholdCount")]
        getter unhealthy_threshold_count : Int32?

        def initialize(
          @enabled : Bool? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_timeout_seconds : Int32? = nil,
          @healthy_threshold_count : Int32? = nil,
          @matcher : Types::Matcher? = nil,
          @path : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @protocol_version : String? = nil,
          @unhealthy_threshold_count : Int32? = nil
        )
        end
      end

      # Describes criteria that can be applied to incoming requests.
      struct HttpMatch
        include JSON::Serializable

        # The header matches. Matches incoming requests with rule based on request header value before
        # applying rule action.
        @[JSON::Field(key: "headerMatches")]
        getter header_matches : Array(Types::HeaderMatch)?

        # The HTTP method type.
        @[JSON::Field(key: "method")]
        getter method : String?

        # The path match.
        @[JSON::Field(key: "pathMatch")]
        getter path_match : Types::PathMatch?

        def initialize(
          @header_matches : Array(Types::HeaderMatch)? = nil,
          @method : String? = nil,
          @path_match : Types::PathMatch? = nil
        )
        end
      end

      # An unexpected error occurred while processing the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Describes an IP resource.
      struct IpResource
        include JSON::Serializable

        # The IP address of the IP resource.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        def initialize(
          @ip_address : String? = nil
        )
        end
      end

      struct ListAccessLogSubscriptionsRequest
        include JSON::Serializable

        # The ID or ARN of the service network or service.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessLogSubscriptionsResponse
        include JSON::Serializable

        # Information about the access log subscriptions.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AccessLogSubscriptionSummary)

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AccessLogSubscriptionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainVerificationsRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainVerificationsResponse
        include JSON::Serializable

        # Information about the domain verifications.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DomainVerificationSummary)

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainVerificationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListListenersRequest
        include JSON::Serializable

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListListenersResponse
        include JSON::Serializable

        # Information about the listeners.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListenerSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListenerSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceConfigurationsRequest
        include JSON::Serializable

        # The domain verification ID.
        @[JSON::Field(key: "domainVerificationIdentifier")]
        getter domain_verification_identifier : String?

        # The maximum page size.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the resource configuration of type Group .
        @[JSON::Field(key: "resourceConfigurationGroupIdentifier")]
        getter resource_configuration_group_identifier : String?

        # The ID of the resource gateway for the resource configuration.
        @[JSON::Field(key: "resourceGatewayIdentifier")]
        getter resource_gateway_identifier : String?

        def initialize(
          @domain_verification_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_configuration_group_identifier : String? = nil,
          @resource_gateway_identifier : String? = nil
        )
        end
      end

      struct ListResourceConfigurationsResponse
        include JSON::Serializable

        # Information about the resource configurations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ResourceConfigurationSummary)?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ResourceConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceEndpointAssociationsRequest
        include JSON::Serializable

        # The ID for the resource configuration associated with the VPC endpoint.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String

        # The maximum page size.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the association.
        @[JSON::Field(key: "resourceEndpointAssociationIdentifier")]
        getter resource_endpoint_association_identifier : String?

        # The ID of the VPC endpoint in the association.
        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The owner of the VPC endpoint in the association.
        @[JSON::Field(key: "vpcEndpointOwner")]
        getter vpc_endpoint_owner : String?

        def initialize(
          @resource_configuration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_endpoint_association_identifier : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_endpoint_owner : String? = nil
        )
        end
      end

      struct ListResourceEndpointAssociationsResponse
        include JSON::Serializable

        # Information about the VPC endpoint associations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ResourceEndpointAssociationSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ResourceEndpointAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceGatewaysRequest
        include JSON::Serializable

        # The maximum page size.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceGatewaysResponse
        include JSON::Serializable

        # Information about the resource gateways.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ResourceGatewaySummary)?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ResourceGatewaySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @listener_identifier : String,
          @service_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesResponse
        include JSON::Serializable

        # Information about the rules.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RuleSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RuleSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworkResourceAssociationsRequest
        include JSON::Serializable

        # Include service network resource associations of the child resource configuration with the grouped
        # resource configuration. The type is boolean and the default value is false.
        @[JSON::Field(key: "includeChildren")]
        getter include_children : Bool?

        # The maximum page size.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String?

        # The ID of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String?

        def initialize(
          @include_children : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_configuration_identifier : String? = nil,
          @service_network_identifier : String? = nil
        )
        end
      end

      struct ListServiceNetworkResourceAssociationsResponse
        include JSON::Serializable

        # Information about the associations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceNetworkResourceAssociationSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceNetworkResourceAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworkServiceAssociationsRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String?

        # The ID or ARN of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_identifier : String? = nil,
          @service_network_identifier : String? = nil
        )
        end
      end

      struct ListServiceNetworkServiceAssociationsResponse
        include JSON::Serializable

        # Information about the associations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceNetworkServiceAssociationSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceNetworkServiceAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworkVpcAssociationsRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID or ARN of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String?

        # The ID or ARN of the VPC.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_network_identifier : String? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      struct ListServiceNetworkVpcAssociationsResponse
        include JSON::Serializable

        # Information about the associations.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceNetworkVpcAssociationSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceNetworkVpcAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworkVpcEndpointAssociationsRequest
        include JSON::Serializable

        # The ID of the service network associated with the VPC endpoint.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        # The maximum page size.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_network_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworkVpcEndpointAssociationsResponse
        include JSON::Serializable

        # Information about the association between the VPC endpoint and service network.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceNetworkEndpointAssociation)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceNetworkEndpointAssociation),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworksRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceNetworksResponse
        include JSON::Serializable

        # Information about the service networks.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceNetworkSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceNetworkSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesResponse
        include JSON::Serializable

        # Information about the services.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ServiceSummary)?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ServiceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Information about the tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTargetGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The target group type.
        @[JSON::Field(key: "targetGroupType")]
        getter target_group_type : String?

        # The ID or ARN of the VPC.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_group_type : String? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      struct ListTargetGroupsResponse
        include JSON::Serializable

        # Information about the target groups.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::TargetGroupSummary)?

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TargetGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTargetsRequest
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        # The maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The targets.
        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @target_group_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      struct ListTargetsResponse
        include JSON::Serializable

        # Information about the targets.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::TargetSummary)

        # If there are additional results, a pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TargetSummary),
          @next_token : String? = nil
        )
        end
      end

      # Summary information about a listener.
      struct ListenerSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the listener was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the listener was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The listener port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The listener protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil
        )
        end
      end

      # Describes the codes to use when checking for a successful response from a target for health checks.
      struct Matcher
        include JSON::Serializable

        # The HTTP code to use when checking for a successful response from a target.
        @[JSON::Field(key: "httpCode")]
        getter http_code : String?

        def initialize(
          @http_code : String? = nil
        )
        end
      end

      # Describes the conditions that can be applied when matching a path for incoming requests.
      struct PathMatch
        include JSON::Serializable

        # The type of path match.
        @[JSON::Field(key: "match")]
        getter match : Types::PathMatchType

        # Indicates whether the match is case sensitive.
        @[JSON::Field(key: "caseSensitive")]
        getter case_sensitive : Bool?

        def initialize(
          @match : Types::PathMatchType,
          @case_sensitive : Bool? = nil
        )
        end
      end

      # Describes a path match type. Each rule can include only one of the following types of paths.
      struct PathMatchType
        include JSON::Serializable

        # An exact match of the path.
        @[JSON::Field(key: "exact")]
        getter exact : String?

        # A prefix match of the path.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @exact : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      struct PutAuthPolicyRequest
        include JSON::Serializable

        # The auth policy. The policy string in JSON must not contain newlines or blank lines.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # The ID or ARN of the service network or service for which the policy is created.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @policy : String,
          @resource_identifier : String
        )
        end
      end

      struct PutAuthPolicyResponse
        include JSON::Serializable

        # The auth policy. The policy string in JSON must not contain newlines or blank lines.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The state of the auth policy. The auth policy is only active when the auth type is set to AWS_IAM .
        # If you provide a policy, then authentication and authorization decisions are made based on this
        # policy and the client's IAM policy. If the Auth type is NONE , then, any auth policy that you
        # provide remains inactive. For more information, see Create a service network in the Amazon VPC
        # Lattice User Guide .
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @policy : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # An IAM policy. The policy string in JSON must not contain newlines or blank lines.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # The ID or ARN of the service network or service for which the policy is created.
        @[JSON::Field(key: "resourceArn")]
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

      struct RegisterTargetsRequest
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        # The targets.
        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::Target)

        def initialize(
          @target_group_identifier : String,
          @targets : Array(Types::Target)
        )
        end
      end

      struct RegisterTargetsResponse
        include JSON::Serializable

        # The targets that were successfully registered.
        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::Target)?

        # The targets that were not registered.
        @[JSON::Field(key: "unsuccessful")]
        getter unsuccessful : Array(Types::TargetFailure)?

        def initialize(
          @successful : Array(Types::Target)? = nil,
          @unsuccessful : Array(Types::TargetFailure)? = nil
        )
        end
      end

      # Describes a resource configuration.
      struct ResourceConfigurationDefinition
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "arnResource")]
        getter arn_resource : Types::ArnResource?

        # The DNS name of the resource.
        @[JSON::Field(key: "dnsResource")]
        getter dns_resource : Types::DnsResource?

        # The IP resource.
        @[JSON::Field(key: "ipResource")]
        getter ip_resource : Types::IpResource?

        def initialize(
          @arn_resource : Types::ArnResource? = nil,
          @dns_resource : Types::DnsResource? = nil,
          @ip_resource : Types::IpResource? = nil
        )
        end
      end

      # Summary information about a resource configuration.
      struct ResourceConfigurationSummary
        include JSON::Serializable

        # Indicates whether the resource configuration was created and is managed by Amazon.
        @[JSON::Field(key: "amazonManaged")]
        getter amazon_managed : Bool?

        # The Amazon Resource Name (ARN) of the resource configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the resource configuration was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The custom domain name.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The domain verification ID.
        @[JSON::Field(key: "domainVerificationId")]
        getter domain_verification_id : String?

        # (GROUP) The group domain for a group resource configuration. Any domains that you create for the
        # child resource are subdomains of the group domain. Child resources inherit the verification status
        # of the domain.
        @[JSON::Field(key: "groupDomain")]
        getter group_domain : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The most recent date and time that the resource configuration was updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the resource configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the group resource configuration.
        @[JSON::Field(key: "resourceConfigurationGroupId")]
        getter resource_configuration_group_id : String?

        # The ID of the resource gateway.
        @[JSON::Field(key: "resourceGatewayId")]
        getter resource_gateway_id : String?

        # The status of the resource configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of resource configuration. SINGLE - A single resource. GROUP - A group of resources. You
        # must create a group resource configuration before you create a child resource configuration. CHILD -
        # A single resource that is part of a group resource configuration. ARN - An Amazon Web Services
        # resource.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @amazon_managed : Bool? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @custom_domain_name : String? = nil,
          @domain_verification_id : String? = nil,
          @group_domain : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @resource_configuration_group_id : String? = nil,
          @resource_gateway_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary information about a VPC endpoint association.
      struct ResourceEndpointAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the VPC endpoint association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the VPC endpoint association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the VPC endpoint association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationArn")]
        getter resource_configuration_arn : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationId")]
        getter resource_configuration_id : String?

        # The name of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationName")]
        getter resource_configuration_name : String?

        # The ID of the VPC endpoint.
        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The owner of the VPC endpoint.
        @[JSON::Field(key: "vpcEndpointOwner")]
        getter vpc_endpoint_owner : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @resource_configuration_arn : String? = nil,
          @resource_configuration_id : String? = nil,
          @resource_configuration_name : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_endpoint_owner : String? = nil
        )
        end
      end

      # Summary information about a resource gateway.
      struct ResourceGatewaySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the VPC endpoint association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the resource gateway.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of IP address used by the resource gateway.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The number of IPv4 addresses in each ENI for the resource gateway.
        @[JSON::Field(key: "ipv4AddressesPerEni")]
        getter ipv4_addresses_per_eni : Int32?

        # The most recent date and time that the resource gateway was updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The IDs of the security groups applied to the resource gateway.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The name of the resource gateway.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The IDs of the VPC subnets for the resource gateway.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC for the resource gateway.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @ip_address_type : String? = nil,
          @ipv4_addresses_per_eni : Int32? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      # The request references a resource that does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Describes the action for a rule.
      struct RuleAction
        include JSON::Serializable

        # The fixed response action. The rule returns a custom HTTP response.
        @[JSON::Field(key: "fixedResponse")]
        getter fixed_response : Types::FixedResponseAction?

        # The forward action. Traffic that matches the rule is forwarded to the specified target groups.
        @[JSON::Field(key: "forward")]
        getter forward : Types::ForwardAction?

        def initialize(
          @fixed_response : Types::FixedResponseAction? = nil,
          @forward : Types::ForwardAction? = nil
        )
        end
      end

      # Describes a rule match.
      struct RuleMatch
        include JSON::Serializable

        # The HTTP criteria that a rule must match.
        @[JSON::Field(key: "httpMatch")]
        getter http_match : Types::HttpMatch?

        def initialize(
          @http_match : Types::HttpMatch? = nil
        )
        end
      end

      # Summary information about a listener rule.
      struct RuleSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the listener rule was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the rule.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether this is the default listener rule.
        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool?

        # The date and time that the listener rule was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The priority of the rule.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @is_default : Bool? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end

      # Describes a rule update.
      struct RuleUpdate
        include JSON::Serializable

        # The ID or ARN of the rule.
        @[JSON::Field(key: "ruleIdentifier")]
        getter rule_identifier : String

        # The rule action.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The rule priority. A listener can't have multiple rules with the same priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @rule_identifier : String,
          @action : Types::RuleAction? = nil,
          @match : Types::RuleMatch? = nil,
          @priority : Int32? = nil
        )
        end
      end

      # Describes a rule update that failed.
      struct RuleUpdateFailure
        include JSON::Serializable

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID or ARN of the rule.
        @[JSON::Field(key: "ruleIdentifier")]
        getter rule_identifier : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @rule_identifier : String? = nil
        )
        end
      end

      # Describes a successful rule update.
      struct RuleUpdateSuccess
        include JSON::Serializable

        # The action for the rule.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether this is the default rule.
        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool?

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The rule priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @action : Types::RuleAction? = nil,
          @arn : String? = nil,
          @id : String? = nil,
          @is_default : Bool? = nil,
          @match : Types::RuleMatch? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end

      # Describes the association between a service network and a VPC endpoint.
      struct ServiceNetworkEndpointAssociation
        include JSON::Serializable

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The state of the association.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The ID of the VPC endpoint associated with the service network.
        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The owner of the VPC endpoint associated with the service network.
        @[JSON::Field(key: "vpcEndpointOwnerId")]
        getter vpc_endpoint_owner_id : String?

        # The ID of the VPC for the association.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @service_network_arn : String? = nil,
          @state : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_endpoint_owner_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Summary information about an association between a service network and a resource configuration.
      struct ServiceNetworkResourceAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The DNS entry for the service.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The ID of the association between the service network and resource configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Specifies whether the association is managed by Amazon.
        @[JSON::Field(key: "isManagedAssociation")]
        getter is_managed_association : Bool?

        # Indicates if private DNS is enabled for the service network resource association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The private DNS entry for the service.
        @[JSON::Field(key: "privateDnsEntry")]
        getter private_dns_entry : Types::DnsEntry?

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "resourceConfigurationArn")]
        getter resource_configuration_arn : String?

        # The ID of the resource configuration associated with the service network.
        @[JSON::Field(key: "resourceConfigurationId")]
        getter resource_configuration_id : String?

        # The name of the resource configuration associated with the service network.
        @[JSON::Field(key: "resourceConfigurationName")]
        getter resource_configuration_name : String?

        # The Amazon Resource Name (ARN) of the service network associated with the resource configuration.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network associated with the resource configuration.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network associated with the resource configuration.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status of the service network’s association with the resource configuration. If the deletion
        # fails, try to delete again.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @failure_code : String? = nil,
          @id : String? = nil,
          @is_managed_association : Bool? = nil,
          @private_dns_enabled : Bool? = nil,
          @private_dns_entry : Types::DnsEntry? = nil,
          @resource_configuration_arn : String? = nil,
          @resource_configuration_id : String? = nil,
          @resource_configuration_name : String? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information about an association between a service network and a service.
      struct ServiceNetworkServiceAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The DNS information.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ID of the service.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String?

        # The name of the service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status of the service network’s association with the service. If the deletion fails, try to
        # delete again.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @id : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil,
          @service_name : String? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information about a service network.
      struct ServiceNetworkSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the service network was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the service network.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the service network was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the service network.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of resource configurations associated with a service network.
        @[JSON::Field(key: "numberOfAssociatedResourceConfigurations")]
        getter number_of_associated_resource_configurations : Int64?

        # The number of services associated with the service network.
        @[JSON::Field(key: "numberOfAssociatedServices")]
        getter number_of_associated_services : Int64?

        # The number of VPCs associated with the service network.
        @[JSON::Field(key: "numberOfAssociatedVPCs")]
        getter number_of_associated_vp_cs : Int64?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @number_of_associated_resource_configurations : Int64? = nil,
          @number_of_associated_services : Int64? = nil,
          @number_of_associated_vp_cs : Int64? = nil
        )
        end
      end

      # Summary information about an association between a service network and a VPC.
      struct ServiceNetworkVpcAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the association was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The DNS options for the service network VPC association.
        @[JSON::Field(key: "dnsOptions")]
        getter dns_options : Types::DnsOptions?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the association was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates if private DNS is enabled for the service network VPC association.
        @[JSON::Field(key: "privateDnsEnabled")]
        getter private_dns_enabled : Bool?

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "serviceNetworkArn")]
        getter service_network_arn : String?

        # The ID of the service network.
        @[JSON::Field(key: "serviceNetworkId")]
        getter service_network_id : String?

        # The name of the service network.
        @[JSON::Field(key: "serviceNetworkName")]
        getter service_network_name : String?

        # The status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the VPC.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @dns_options : Types::DnsOptions? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @private_dns_enabled : Bool? = nil,
          @service_network_arn : String? = nil,
          @service_network_id : String? = nil,
          @service_network_name : String? = nil,
          @status : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The service code.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_type : String,
          @service_code : String,
          @resource_id : String? = nil
        )
        end
      end

      # Summary information about a service.
      struct ServiceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the service was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The DNS information.
        @[JSON::Field(key: "dnsEntry")]
        getter dns_entry : Types::DnsEntry?

        # The ID of the service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time that the service was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the service.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @custom_domain_name : String? = nil,
          @dns_entry : Types::DnsEntry? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies if the service network should be enabled for sharing.
      struct SharingConfig
        include JSON::Serializable

        # Specifies if the service network is enabled for sharing.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      struct StartDomainVerificationRequest
        include JSON::Serializable

        # The domain name to verify ownership for.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request that completed successfully using the same client token and parameters, the
        # retry succeeds without performing any actions. If the parameters aren't identical, the retry fails.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags for the domain verification.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartDomainVerificationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain verification.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The domain name being verified.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The ID of the domain verification.
        @[JSON::Field(key: "id")]
        getter id : String

        # The current status of the domain verification process.
        @[JSON::Field(key: "status")]
        getter status : String

        # The TXT record configuration used for domain verification.
        @[JSON::Field(key: "txtMethodConfig")]
        getter txt_method_config : Types::TxtMethodConfig?

        def initialize(
          @arn : String,
          @domain_name : String,
          @id : String,
          @status : String,
          @txt_method_config : Types::TxtMethodConfig? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags for the resource.
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

      # Describes a target.
      struct Target
        include JSON::Serializable

        # The ID of the target. If the target group type is INSTANCE , this is an instance ID. If the target
        # group type is IP , this is an IP address. If the target group type is LAMBDA , this is the ARN of a
        # Lambda function. If the target group type is ALB , this is the ARN of an Application Load Balancer.
        @[JSON::Field(key: "id")]
        getter id : String

        # The port on which the target is listening. For HTTP, the default is 80. For HTTPS, the default is
        # 443.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @id : String,
          @port : Int32? = nil
        )
        end
      end

      # Describes a target failure.
      struct TargetFailure
        include JSON::Serializable

        # The failure code.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # The failure message.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The ID of the target. If the target group type is INSTANCE , this is an instance ID. If the target
        # group type is IP , this is an IP address. If the target group type is LAMBDA , this is the ARN of a
        # Lambda function. If the target group type is ALB , this is the ARN of an Application Load Balancer.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The port on which the target is listening. This parameter doesn't apply if the target is a Lambda
        # function.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Describes the configuration of a target group. For more information, see Target groups in the Amazon
      # VPC Lattice User Guide .
      struct TargetGroupConfig
        include JSON::Serializable

        # The health check configuration. Not supported if the target group type is LAMBDA or ALB .
        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::HealthCheckConfig?

        # The type of IP address used for the target group. Supported only if the target group type is IP .
        # The default is IPV4 .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The version of the event structure that your Lambda function receives. Supported only if the target
        # group type is LAMBDA . The default is V1 .
        @[JSON::Field(key: "lambdaEventStructureVersion")]
        getter lambda_event_structure_version : String?

        # The port on which the targets are listening. For HTTP, the default is 80. For HTTPS, the default is
        # 443. Not supported if the target group type is LAMBDA .
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol to use for routing traffic to the targets. The default is the protocol of the target
        # group. Not supported if the target group type is LAMBDA .
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The protocol version. The default is HTTP1 . Not supported if the target group type is LAMBDA .
        @[JSON::Field(key: "protocolVersion")]
        getter protocol_version : String?

        # The ID of the VPC. Not supported if the target group type is LAMBDA .
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @health_check : Types::HealthCheckConfig? = nil,
          @ip_address_type : String? = nil,
          @lambda_event_structure_version : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @protocol_version : String? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      # Summary information about a target group. For more information, see Target groups in the Amazon VPC
      # Lattice User Guide .
      struct TargetGroupSummary
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the target group was created, in ISO-8601 format.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the target group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of IP address used for the target group. The possible values are IPV4 and IPV6 . This is an
        # optional parameter. If not specified, the default is IPV4 .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The version of the event structure that your Lambda function receives. Supported only if the target
        # group type is LAMBDA .
        @[JSON::Field(key: "lambdaEventStructureVersion")]
        getter lambda_event_structure_version : String?

        # The date and time that the target group was last updated, in ISO-8601 format.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the target group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The port of the target group.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol of the target group.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Amazon Resource Names (ARNs) of the service.
        @[JSON::Field(key: "serviceArns")]
        getter service_arns : Array(String)?

        # The status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The target group type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The ID of the VPC of the target group.
        @[JSON::Field(key: "vpcIdentifier")]
        getter vpc_identifier : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @ip_address_type : String? = nil,
          @lambda_event_structure_version : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @service_arns : Array(String)? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @vpc_identifier : String? = nil
        )
        end
      end

      # Summary information about a target.
      struct TargetSummary
        include JSON::Serializable

        # The ID of the target. If the target group type is INSTANCE , this is an instance ID. If the target
        # group type is IP , this is an IP address. If the target group type is LAMBDA , this is the ARN of a
        # Lambda function. If the target type is ALB , this is the ARN of an Application Load Balancer.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The port on which the target is listening.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The code for why the target status is what it is.
        @[JSON::Field(key: "reasonCode")]
        getter reason_code : String?

        # The status of the target. DRAINING : The target is being deregistered. No new connections are sent
        # to this target while current connections are being drained. The default draining time is 5 minutes.
        # UNAVAILABLE : Health checks are unavailable for the target group. HEALTHY : The target is healthy.
        # UNHEALTHY : The target is unhealthy. INITIAL : Initial health checks on the target are being
        # performed. UNUSED : Target group is not used in a service.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @port : Int32? = nil,
          @reason_code : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The limit on the number of requests per second was exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The service code.
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

      # Configuration for TXT record-based domain verification method.
      struct TxtMethodConfig
        include JSON::Serializable

        # The name of the TXT record that must be created for domain verification.
        @[JSON::Field(key: "name")]
        getter name : String

        # The value that must be added to the TXT record for domain verification.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys of the tags to remove.
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

      struct UpdateAccessLogSubscriptionRequest
        include JSON::Serializable

        # The ID or ARN of the access log subscription.
        @[JSON::Field(key: "accessLogSubscriptionIdentifier")]
        getter access_log_subscription_identifier : String

        # The Amazon Resource Name (ARN) of the access log destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        def initialize(
          @access_log_subscription_identifier : String,
          @destination_arn : String
        )
        end
      end

      struct UpdateAccessLogSubscriptionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access log subscription.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the access log destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The ID of the access log subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the access log subscription.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ID of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @arn : String,
          @destination_arn : String,
          @id : String,
          @resource_arn : String,
          @resource_id : String
        )
        end
      end

      struct UpdateListenerRequest
        include JSON::Serializable

        # The action for the default rule.
        @[JSON::Field(key: "defaultAction")]
        getter default_action : Types::RuleAction

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        def initialize(
          @default_action : Types::RuleAction,
          @listener_identifier : String,
          @service_identifier : String
        )
        end
      end

      struct UpdateListenerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The action for the default rule.
        @[JSON::Field(key: "defaultAction")]
        getter default_action : Types::RuleAction?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The listener port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol of the listener.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ID of the service.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String?

        def initialize(
          @arn : String? = nil,
          @default_action : Types::RuleAction? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil
        )
        end
      end

      struct UpdateResourceConfigurationRequest
        include JSON::Serializable

        # The ID of the resource configuration.
        @[JSON::Field(key: "resourceConfigurationIdentifier")]
        getter resource_configuration_identifier : String

        # Indicates whether to add the resource configuration to service networks that are shared with other
        # accounts.
        @[JSON::Field(key: "allowAssociationToShareableServiceNetwork")]
        getter allow_association_to_shareable_service_network : Bool?

        # The TCP port ranges that a consumer can use to access a resource configuration. You can separate
        # port ranges with a comma. Example: 1-65535 or 1,2,22-30
        @[JSON::Field(key: "portRanges")]
        getter port_ranges : Array(String)?

        # Identifies the resource configuration in one of the following ways: Amazon Resource Name (ARN) -
        # Supported resource-types that are provisioned by Amazon Web Services services, such as RDS
        # databases, can be identified by their ARN. Domain name - Any domain name that is publicly
        # resolvable. IP address - For IPv4 and IPv6, only IP addresses in the VPC are supported.
        @[JSON::Field(key: "resourceConfigurationDefinition")]
        getter resource_configuration_definition : Types::ResourceConfigurationDefinition?

        def initialize(
          @resource_configuration_identifier : String,
          @allow_association_to_shareable_service_network : Bool? = nil,
          @port_ranges : Array(String)? = nil,
          @resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil
        )
        end
      end

      struct UpdateResourceConfigurationResponse
        include JSON::Serializable

        # Indicates whether to add the resource configuration to service networks that are shared with other
        # accounts.
        @[JSON::Field(key: "allowAssociationToShareableServiceNetwork")]
        getter allow_association_to_shareable_service_network : Bool?

        # The Amazon Resource Name (ARN) of the resource configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the resource configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the resource configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The TCP port ranges that a consumer can use to access a resource configuration. You can separate
        # port ranges with a comma. Example: 1-65535 or 1,2,22-30
        @[JSON::Field(key: "portRanges")]
        getter port_ranges : Array(String)?

        # The TCP protocol accepted by the specified resource configuration.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The resource configuration.
        @[JSON::Field(key: "resourceConfigurationDefinition")]
        getter resource_configuration_definition : Types::ResourceConfigurationDefinition?

        # The ID of the group resource configuration.
        @[JSON::Field(key: "resourceConfigurationGroupId")]
        getter resource_configuration_group_id : String?

        # The ID of the resource gateway associated with the resource configuration.
        @[JSON::Field(key: "resourceGatewayId")]
        getter resource_gateway_id : String?

        # The status of the resource configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of resource configuration. SINGLE - A single resource. GROUP - A group of resources. CHILD
        # - A single resource that is part of a group resource configuration. ARN - An Amazon Web Services
        # resource.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allow_association_to_shareable_service_network : Bool? = nil,
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @port_ranges : Array(String)? = nil,
          @protocol : String? = nil,
          @resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil,
          @resource_configuration_group_id : String? = nil,
          @resource_gateway_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateResourceGatewayRequest
        include JSON::Serializable

        # The ID or ARN of the resource gateway.
        @[JSON::Field(key: "resourceGatewayIdentifier")]
        getter resource_gateway_identifier : String

        # The IDs of the security groups associated with the resource gateway.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @resource_gateway_identifier : String,
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      struct UpdateResourceGatewayResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the resource gateway.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of IP address used by the resource gateway.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The name of the resource gateway.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The IDs of the security groups associated with the resource gateway.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The status of the resource gateway.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The IDs of the VPC subnets for the resource gateway.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC for the resource gateway.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct UpdateRuleRequest
        include JSON::Serializable

        # The ID or ARN of the listener.
        @[JSON::Field(key: "listenerIdentifier")]
        getter listener_identifier : String

        # The ID or ARN of the rule.
        @[JSON::Field(key: "ruleIdentifier")]
        getter rule_identifier : String

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # Information about the action for the specified listener rule.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The rule priority. A listener can't have multiple rules with the same priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @listener_identifier : String,
          @rule_identifier : String,
          @service_identifier : String,
          @action : Types::RuleAction? = nil,
          @match : Types::RuleMatch? = nil,
          @priority : Int32? = nil
        )
        end
      end

      struct UpdateRuleResponse
        include JSON::Serializable

        # Information about the action for the specified listener rule.
        @[JSON::Field(key: "action")]
        getter action : Types::RuleAction?

        # The Amazon Resource Name (ARN) of the listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the listener.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Indicates whether this is the default rule.
        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool?

        # The rule match.
        @[JSON::Field(key: "match")]
        getter match : Types::RuleMatch?

        # The name of the listener.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The rule priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @action : Types::RuleAction? = nil,
          @arn : String? = nil,
          @id : String? = nil,
          @is_default : Bool? = nil,
          @match : Types::RuleMatch? = nil,
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end

      struct UpdateServiceNetworkRequest
        include JSON::Serializable

        # The type of IAM policy. NONE : The resource does not use an IAM policy. This is the default. AWS_IAM
        # : The resource uses an IAM policy. When this type is used, auth is enabled and an auth policy is
        # required.
        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The ID or ARN of the service network.
        @[JSON::Field(key: "serviceNetworkIdentifier")]
        getter service_network_identifier : String

        def initialize(
          @auth_type : String,
          @service_network_identifier : String
        )
        end
      end

      struct UpdateServiceNetworkResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service network.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The ID of the service network.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the service network.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateServiceNetworkVpcAssociationRequest
        include JSON::Serializable

        # The IDs of the security groups.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The ID or ARN of the association.
        @[JSON::Field(key: "serviceNetworkVpcAssociationIdentifier")]
        getter service_network_vpc_association_identifier : String

        def initialize(
          @security_group_ids : Array(String),
          @service_network_vpc_association_identifier : String
        )
        end
      end

      struct UpdateServiceNetworkVpcAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The account that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the association.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The IDs of the security groups.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The status. You can retry the operation if the status is DELETE_FAILED . However, if you retry it
        # while the status is DELETE_IN_PROGRESS , there is no change in the status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateServiceRequest
        include JSON::Serializable

        # The ID or ARN of the service.
        @[JSON::Field(key: "serviceIdentifier")]
        getter service_identifier : String

        # The type of IAM policy. NONE : The resource does not use an IAM policy. This is the default. AWS_IAM
        # : The resource uses an IAM policy. When this type is used, auth is enabled and an auth policy is
        # required.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        def initialize(
          @service_identifier : String,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil
        )
        end
      end

      struct UpdateServiceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of IAM policy.
        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The custom domain name of the service.
        @[JSON::Field(key: "customDomainName")]
        getter custom_domain_name : String?

        # The ID of the service.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the service.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @auth_type : String? = nil,
          @certificate_arn : String? = nil,
          @custom_domain_name : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateTargetGroupRequest
        include JSON::Serializable

        # The health check configuration.
        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::HealthCheckConfig

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        def initialize(
          @health_check : Types::HealthCheckConfig,
          @target_group_identifier : String
        )
        end
      end

      struct UpdateTargetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The target group configuration.
        @[JSON::Field(key: "config")]
        getter config : Types::TargetGroupConfig?

        # The ID of the target group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the target group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The target group type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @config : Types::TargetGroupConfig? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The input does not satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The fields that failed validation.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Describes a validation failure.
      struct ValidationExceptionField
        include JSON::Serializable

        # Additional information about why the validation failed.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the validation exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Describes the weight of a target group.
      struct WeightedTargetGroup
        include JSON::Serializable

        # The ID or ARN of the target group.
        @[JSON::Field(key: "targetGroupIdentifier")]
        getter target_group_identifier : String

        # Only required if you specify multiple target groups for a forward action. The weight determines how
        # requests are distributed to the target group. For example, if you specify two target groups, each
        # with a weight of 10, each target group receives half the requests. If you specify two target groups,
        # one with a weight of 10 and the other with a weight of 20, the target group with a weight of 20
        # receives twice as many requests as the other target group. If there's only one target group
        # specified, then the default value is 100.
        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @target_group_identifier : String,
          @weight : Int32? = nil
        )
        end
      end
    end
  end
end
