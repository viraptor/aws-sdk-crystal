require "json"
require "time"

module AwsSdk
  module ElasticLoadBalancingV2
    module Types

      # The specified ALPN policy is not supported.

      struct ALPNPolicyNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an action. Each rule must include exactly one of the following routing actions:
      # forward , fixed-response , or redirect , and it must be the last action to be performed. Optionally,
      # a rule for an HTTPS listener can also include one of the following user authentication actions:
      # authenticate-oidc , authenticate-cognito , or jwt-validation .

      struct Action
        include JSON::Serializable

        # The type of action.

        @[JSON::Field(key: "Type")]
        getter type : String

        # [HTTPS listeners] Information for using Amazon Cognito to authenticate users. Specify only when Type
        # is authenticate-cognito .

        @[JSON::Field(key: "AuthenticateCognitoConfig")]
        getter authenticate_cognito_config : Types::AuthenticateCognitoActionConfig?

        # [HTTPS listeners] Information about an identity provider that is compliant with OpenID Connect
        # (OIDC). Specify only when Type is authenticate-oidc .

        @[JSON::Field(key: "AuthenticateOidcConfig")]
        getter authenticate_oidc_config : Types::AuthenticateOidcActionConfig?

        # [Application Load Balancer] Information for creating an action that returns a custom HTTP response.
        # Specify only when Type is fixed-response .

        @[JSON::Field(key: "FixedResponseConfig")]
        getter fixed_response_config : Types::FixedResponseActionConfig?

        # Information for creating an action that distributes requests among multiple target groups. Specify
        # only when Type is forward . If you specify both ForwardConfig and TargetGroupArn , you can specify
        # only one target group using ForwardConfig and it must be the same target group specified in
        # TargetGroupArn .

        @[JSON::Field(key: "ForwardConfig")]
        getter forward_config : Types::ForwardActionConfig?

        # [HTTPS listeners] Information for validating JWT access tokens in client requests. Specify only when
        # Type is jwt-validation .

        @[JSON::Field(key: "JwtValidationConfig")]
        getter jwt_validation_config : Types::JwtValidationActionConfig?

        # The order for the action. This value is required for rules with multiple actions. The action with
        # the lowest value for order is performed first.

        @[JSON::Field(key: "Order")]
        getter order : Int32?

        # [Application Load Balancer] Information for creating a redirect action. Specify only when Type is
        # redirect .

        @[JSON::Field(key: "RedirectConfig")]
        getter redirect_config : Types::RedirectActionConfig?

        # The Amazon Resource Name (ARN) of the target group. Specify only when Type is forward and you want
        # to route to a single target group. To route to multiple target groups, you must use ForwardConfig
        # instead.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String?

        def initialize(
          @type : String,
          @authenticate_cognito_config : Types::AuthenticateCognitoActionConfig? = nil,
          @authenticate_oidc_config : Types::AuthenticateOidcActionConfig? = nil,
          @fixed_response_config : Types::FixedResponseActionConfig? = nil,
          @forward_config : Types::ForwardActionConfig? = nil,
          @jwt_validation_config : Types::JwtValidationActionConfig? = nil,
          @order : Int32? = nil,
          @redirect_config : Types::RedirectActionConfig? = nil,
          @target_group_arn : String? = nil
        )
        end
      end


      struct AddListenerCertificatesInput
        include JSON::Serializable

        # The certificate to add. You can specify one certificate per call. Set CertificateArn to the
        # certificate ARN but do not set IsDefault .

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @certificates : Array(Types::Certificate),
          @listener_arn : String
        )
        end
      end


      struct AddListenerCertificatesOutput
        include JSON::Serializable

        # Information about the certificates in the certificate list.

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil
        )
        end
      end


      struct AddTagsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        # The tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arns : Array(String),
          @tags : Array(Types::Tag)
        )
        end
      end


      struct AddTagsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct AddTrustStoreRevocationsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        # The revocation file to add.

        @[JSON::Field(key: "RevocationContents")]
        getter revocation_contents : Array(Types::RevocationContent)?

        def initialize(
          @trust_store_arn : String,
          @revocation_contents : Array(Types::RevocationContent)? = nil
        )
        end
      end


      struct AddTrustStoreRevocationsOutput
        include JSON::Serializable

        # Information about the revocation file added to the trust store.

        @[JSON::Field(key: "TrustStoreRevocations")]
        getter trust_store_revocations : Array(Types::TrustStoreRevocation)?

        def initialize(
          @trust_store_revocations : Array(Types::TrustStoreRevocation)? = nil
        )
        end
      end

      # Information about the override status applied to a target.

      struct AdministrativeOverride
        include JSON::Serializable

        # A description of the override state that provides additional details.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The reason code for the state.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The state of the override.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @reason : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The specified allocation ID does not exist.

      struct AllocationIdNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about anomaly detection and mitigation.

      struct AnomalyDetection
        include JSON::Serializable

        # Indicates whether anomaly mitigation is in progress.

        @[JSON::Field(key: "MitigationInEffect")]
        getter mitigation_in_effect : String?

        # The latest anomaly detection result.

        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @mitigation_in_effect : String? = nil,
          @result : String? = nil
        )
        end
      end

      # Request parameters to use when integrating with Amazon Cognito to authenticate users.

      struct AuthenticateCognitoActionConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Cognito user pool.

        @[JSON::Field(key: "UserPoolArn")]
        getter user_pool_arn : String

        # The ID of the Amazon Cognito user pool client.

        @[JSON::Field(key: "UserPoolClientId")]
        getter user_pool_client_id : String

        # The domain prefix or fully-qualified domain name of the Amazon Cognito user pool.

        @[JSON::Field(key: "UserPoolDomain")]
        getter user_pool_domain : String

        # The query parameters (up to 10) to include in the redirect request to the authorization endpoint.

        @[JSON::Field(key: "AuthenticationRequestExtraParams")]
        getter authentication_request_extra_params : Hash(String, String)?

        # The behavior if the user is not authenticated. The following are possible values: deny - Return an
        # HTTP 401 Unauthorized error. allow - Allow the request to be forwarded to the target. authenticate -
        # Redirect the request to the IdP authorization endpoint. This is the default value.

        @[JSON::Field(key: "OnUnauthenticatedRequest")]
        getter on_unauthenticated_request : String?

        # The set of user claims to be requested from the IdP. The default is openid . To verify which scope
        # values your IdP supports and how to separate multiple values, see the documentation for your IdP.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.

        @[JSON::Field(key: "SessionCookieName")]
        getter session_cookie_name : String?

        # The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7
        # days).

        @[JSON::Field(key: "SessionTimeout")]
        getter session_timeout : Int64?

        def initialize(
          @user_pool_arn : String,
          @user_pool_client_id : String,
          @user_pool_domain : String,
          @authentication_request_extra_params : Hash(String, String)? = nil,
          @on_unauthenticated_request : String? = nil,
          @scope : String? = nil,
          @session_cookie_name : String? = nil,
          @session_timeout : Int64? = nil
        )
        end
      end

      # Request parameters when using an identity provider (IdP) that is compliant with OpenID Connect
      # (OIDC) to authenticate users.

      struct AuthenticateOidcActionConfig
        include JSON::Serializable

        # The authorization endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the
        # domain, and the path.

        @[JSON::Field(key: "AuthorizationEndpoint")]
        getter authorization_endpoint : String

        # The OAuth 2.0 client identifier.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String

        # The OIDC issuer identifier of the IdP. This must be a full URL, including the HTTPS protocol, the
        # domain, and the path.

        @[JSON::Field(key: "Issuer")]
        getter issuer : String

        # The token endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the domain,
        # and the path.

        @[JSON::Field(key: "TokenEndpoint")]
        getter token_endpoint : String

        # The user info endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the
        # domain, and the path.

        @[JSON::Field(key: "UserInfoEndpoint")]
        getter user_info_endpoint : String

        # The query parameters (up to 10) to include in the redirect request to the authorization endpoint.

        @[JSON::Field(key: "AuthenticationRequestExtraParams")]
        getter authentication_request_extra_params : Hash(String, String)?

        # The OAuth 2.0 client secret. This parameter is required if you are creating a rule. If you are
        # modifying a rule, you can omit this parameter if you set UseExistingClientSecret to true.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String?

        # The behavior if the user is not authenticated. The following are possible values: deny - Return an
        # HTTP 401 Unauthorized error. allow - Allow the request to be forwarded to the target. authenticate -
        # Redirect the request to the IdP authorization endpoint. This is the default value.

        @[JSON::Field(key: "OnUnauthenticatedRequest")]
        getter on_unauthenticated_request : String?

        # The set of user claims to be requested from the IdP. The default is openid . To verify which scope
        # values your IdP supports and how to separate multiple values, see the documentation for your IdP.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The name of the cookie used to maintain session information. The default is AWSELBAuthSessionCookie.

        @[JSON::Field(key: "SessionCookieName")]
        getter session_cookie_name : String?

        # The maximum duration of the authentication session, in seconds. The default is 604800 seconds (7
        # days).

        @[JSON::Field(key: "SessionTimeout")]
        getter session_timeout : Int64?

        # Indicates whether to use the existing client secret when modifying a rule. If you are creating a
        # rule, you can omit this parameter or set it to false.

        @[JSON::Field(key: "UseExistingClientSecret")]
        getter use_existing_client_secret : Bool?

        def initialize(
          @authorization_endpoint : String,
          @client_id : String,
          @issuer : String,
          @token_endpoint : String,
          @user_info_endpoint : String,
          @authentication_request_extra_params : Hash(String, String)? = nil,
          @client_secret : String? = nil,
          @on_unauthenticated_request : String? = nil,
          @scope : String? = nil,
          @session_cookie_name : String? = nil,
          @session_timeout : Int64? = nil,
          @use_existing_client_secret : Bool? = nil
        )
        end
      end

      # Information about an Availability Zone.

      struct AvailabilityZone
        include JSON::Serializable

        # [Network Load Balancers] If you need static IP addresses for your load balancer, you can specify one
        # Elastic IP address per Availability Zone when you create an internal-facing load balancer. For
        # internal load balancers, you can specify a private IP address from the IPv4 range of the subnet.

        @[JSON::Field(key: "LoadBalancerAddresses")]
        getter load_balancer_addresses : Array(Types::LoadBalancerAddress)?

        # [Application Load Balancers on Outposts] The ID of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # [Network Load Balancers with UDP listeners] The IPv6 prefixes to use for source NAT. For each
        # subnet, specify an IPv6 prefix (/80 netmask) from the subnet CIDR block or auto_assigned to use an
        # IPv6 prefix selected at random from the subnet CIDR block.

        @[JSON::Field(key: "SourceNatIpv6Prefixes")]
        getter source_nat_ipv6_prefixes : Array(String)?

        # The ID of the subnet. You can specify one subnet per Availability Zone.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The name of the Availability Zone.

        @[JSON::Field(key: "ZoneName")]
        getter zone_name : String?

        def initialize(
          @load_balancer_addresses : Array(Types::LoadBalancerAddress)? = nil,
          @outpost_id : String? = nil,
          @source_nat_ipv6_prefixes : Array(String)? = nil,
          @subnet_id : String? = nil,
          @zone_name : String? = nil
        )
        end
      end

      # The specified Availability Zone is not supported.

      struct AvailabilityZoneNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ca certificate bundle does not exist.

      struct CaCertificatesBundleNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # You've exceeded the daily capacity decrease limit for this reservation.

      struct CapacityDecreaseRequestsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # There is a pending capacity reservation.

      struct CapacityReservationPendingException
        include JSON::Serializable

        def initialize
        end
      end

      # The status of a capacity reservation.

      struct CapacityReservationStatus
        include JSON::Serializable

        # The status code.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The reason code for the status.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @code : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # You've exceeded the capacity units limit.

      struct CapacityUnitsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an SSL server certificate.

      struct Certificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # Indicates whether the certificate is the default certificate. Do not set this value when specifying
        # a certificate as an input. This value is not included in the output when describing a listener, but
        # is included when describing listener certificates.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        def initialize(
          @certificate_arn : String? = nil,
          @is_default : Bool? = nil
        )
        end
      end

      # The specified certificate does not exist.

      struct CertificateNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a cipher used in a policy.

      struct Cipher
        include JSON::Serializable

        # The name of the cipher.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The priority of the cipher.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        def initialize(
          @name : String? = nil,
          @priority : Int32? = nil
        )
        end
      end


      struct CreateListenerInput
        include JSON::Serializable

        # The actions for the default rule.

        @[JSON::Field(key: "DefaultActions")]
        getter default_actions : Array(Types::Action)

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        # [TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can
        # specify one policy name. The following are the possible values: HTTP1Only HTTP2Only HTTP2Optional
        # HTTP2Preferred None For more information, see ALPN policies in the Network Load Balancers Guide .

        @[JSON::Field(key: "AlpnPolicy")]
        getter alpn_policy : Array(String)?

        # [HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one
        # certificate. Set CertificateArn to the certificate ARN but do not set IsDefault .

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # [HTTPS listeners] The mutual authentication configuration information.

        @[JSON::Field(key: "MutualAuthentication")]
        getter mutual_authentication : Types::MutualAuthenticationAttributes?

        # The port on which the load balancer is listening. You can't specify a port for a Gateway Load
        # Balancer.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol for connections from clients to the load balancer. For Application Load Balancers, the
        # supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP,
        # TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC. You can’t specify the UDP, TCP_UDP, QUIC, or TCP_QUIC
        # protocol if dual-stack mode is enabled. You can't specify a protocol for a Gateway Load Balancer.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # [HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are
        # supported. For more information, see Security policies in the Application Load Balancers Guide and
        # Security policies in the Network Load Balancers Guide .

        @[JSON::Field(key: "SslPolicy")]
        getter ssl_policy : String?

        # The tags to assign to the listener.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @default_actions : Array(Types::Action),
          @load_balancer_arn : String,
          @alpn_policy : Array(String)? = nil,
          @certificates : Array(Types::Certificate)? = nil,
          @mutual_authentication : Types::MutualAuthenticationAttributes? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @ssl_policy : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateListenerOutput
        include JSON::Serializable

        # Information about the listener.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)?

        def initialize(
          @listeners : Array(Types::Listener)? = nil
        )
        end
      end


      struct CreateLoadBalancerInput
        include JSON::Serializable

        # The name of the load balancer. This name must be unique per region per account, can have a maximum
        # of 32 characters, must contain only alphanumeric characters or hyphens, must not begin or end with a
        # hyphen, and must not begin with "internal-".

        @[JSON::Field(key: "Name")]
        getter name : String

        # [Application Load Balancers on Outposts] The ID of the customer-owned address pool (CoIP pool).

        @[JSON::Field(key: "CustomerOwnedIpv4Pool")]
        getter customer_owned_ipv4_pool : String?

        # [Network Load Balancers with UDP listeners] Indicates whether to use an IPv6 prefix from each subnet
        # for source NAT. The IP address type must be dualstack . The default value is off .

        @[JSON::Field(key: "EnablePrefixForIpv6SourceNat")]
        getter enable_prefix_for_ipv6_source_nat : String?

        # The IP address type. Internal load balancers must use ipv4 . [Application Load Balancers] The
        # possible values are ipv4 (IPv4 addresses), dualstack (IPv4 and IPv6 addresses), and
        # dualstack-without-public-ipv4 (public IPv6 addresses and private IPv4 and IPv6 addresses). [Network
        # Load Balancers and Gateway Load Balancers] The possible values are ipv4 (IPv4 addresses) and
        # dualstack (IPv4 and IPv6 addresses).

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # [Application Load Balancers] The IPAM pools to use with the load balancer.

        @[JSON::Field(key: "IpamPools")]
        getter ipam_pools : Types::IpamPools?

        # The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an
        # Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes.
        # Therefore, Internet-facing load balancers can route requests from clients over the internet. The
        # nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load
        # balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load
        # balancers can route requests only from clients with access to the VPC for the load balancer. The
        # default is an Internet-facing load balancer. You can't specify a scheme for a Gateway Load Balancer.

        @[JSON::Field(key: "Scheme")]
        getter scheme : String?

        # [Application Load Balancers and Network Load Balancers] The IDs of the security groups for the load
        # balancer.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The IDs of the subnets. You can specify only one subnet per Availability Zone. You must specify
        # either subnets or subnet mappings, but not both. [Application Load Balancers] You must specify
        # subnets from at least two Availability Zones. You can't specify Elastic IP addresses for your
        # subnets. [Application Load Balancers on Outposts] You must specify one Outpost subnet. [Application
        # Load Balancers on Local Zones] You can specify subnets from one or more Local Zones. [Network Load
        # Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic
        # IP address per subnet if you need static IP addresses for your internet-facing load balancer. For
        # internal load balancers, you can specify one private IP address per subnet from the IPv4 range of
        # the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet. [Gateway
        # Load Balancers] You can specify subnets from one or more Availability Zones. You can't specify
        # Elastic IP addresses for your subnets.

        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)?

        # The IDs of the subnets. You can specify only one subnet per Availability Zone. You must specify
        # either subnets or subnet mappings, but not both. To specify an Elastic IP address, specify subnet
        # mappings instead of subnets. [Application Load Balancers] You must specify subnets from at least two
        # Availability Zones. [Application Load Balancers on Outposts] You must specify one Outpost subnet.
        # [Application Load Balancers on Local Zones] You can specify subnets from one or more Local Zones.
        # [Network Load Balancers and Gateway Load Balancers] You can specify subnets from one or more
        # Availability Zones.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        # The tags to assign to the load balancer.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The type of load balancer. The default is application .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String,
          @customer_owned_ipv4_pool : String? = nil,
          @enable_prefix_for_ipv6_source_nat : String? = nil,
          @ip_address_type : String? = nil,
          @ipam_pools : Types::IpamPools? = nil,
          @scheme : String? = nil,
          @security_groups : Array(String)? = nil,
          @subnet_mappings : Array(Types::SubnetMapping)? = nil,
          @subnets : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateLoadBalancerOutput
        include JSON::Serializable

        # Information about the load balancer.

        @[JSON::Field(key: "LoadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        def initialize(
          @load_balancers : Array(Types::LoadBalancer)? = nil
        )
        end
      end


      struct CreateRuleInput
        include JSON::Serializable

        # The actions.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::Action)

        # The conditions.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::RuleCondition)

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The rule priority. A listener can't have multiple rules with the same priority.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The tags to assign to the rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The transforms to apply to requests that match this rule. You can add one host header rewrite
        # transform and one URL rewrite transform.

        @[JSON::Field(key: "Transforms")]
        getter transforms : Array(Types::RuleTransform)?

        def initialize(
          @actions : Array(Types::Action),
          @conditions : Array(Types::RuleCondition),
          @listener_arn : String,
          @priority : Int32,
          @tags : Array(Types::Tag)? = nil,
          @transforms : Array(Types::RuleTransform)? = nil
        )
        end
      end


      struct CreateRuleOutput
        include JSON::Serializable

        # Information about the rule.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct CreateTargetGroupInput
        include JSON::Serializable

        # The name of the target group. This name must be unique per region per account, can have a maximum of
        # 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with
        # a hyphen.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Indicates whether health checks are enabled. If the target type is lambda , health checks are
        # disabled by default but can be enabled. If the target type is instance , ip , or alb , health checks
        # are always enabled and can't be disabled.

        @[JSON::Field(key: "HealthCheckEnabled")]
        getter health_check_enabled : Bool?

        # The approximate amount of time, in seconds, between health checks of an individual target. The range
        # is 5-300. If the target group protocol is TCP, TLS, UDP, TCP_UDP, QUIC, TCP_QUIC, HTTP or HTTPS, the
        # default is 30 seconds. If the target group protocol is GENEVE, the default is 10 seconds. If the
        # target type is lambda , the default is 35 seconds.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # [HTTP/HTTPS health checks] The destination for health checks on the targets. [HTTP1 or HTTP2
        # protocol version] The ping path. The default is /. [GRPC protocol version] The path of a custom
        # health check method with the format /package.service/method. The default is /Amazon Web
        # Services.ALB/healthcheck.

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port the load balancer uses when performing health checks on targets. If the protocol is HTTP,
        # HTTPS, TCP, TLS, UDP, TCP_UDP, QUIC, or TCP_QUIC the default is traffic-port , which is the port on
        # which each target receives traffic from the load balancer. If the protocol is GENEVE, the default is
        # port 80.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : String?

        # The protocol the load balancer uses when performing health checks on targets. For Application Load
        # Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default
        # is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is
        # HTTP or HTTPS. The GENEVE, TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC protocols are not supported for
        # health checks.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # The amount of time, in seconds, during which no response from a target means a failed health check.
        # The range is 2–120 seconds. For target groups with a protocol of HTTP, the default is 6 seconds. For
        # target groups with a protocol of TCP, TLS or HTTPS, the default is 10 seconds. For target groups
        # with a protocol of GENEVE, the default is 5 seconds. If the target type is lambda , the default is
        # 30 seconds.

        @[JSON::Field(key: "HealthCheckTimeoutSeconds")]
        getter health_check_timeout_seconds : Int32?

        # The number of consecutive health check successes required before considering a target healthy. The
        # range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, HTTP or HTTPS, the default is
        # 5. For target groups with a protocol of GENEVE, the default is 5. If the target type is lambda , the
        # default is 5.

        @[JSON::Field(key: "HealthyThresholdCount")]
        getter healthy_threshold_count : Int32?

        # The IP address type. The default value is ipv4 .

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # [HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response
        # from a target. For target groups with a protocol of TCP, TCP_UDP, UDP, QUIC, TCP_QUIC, or TLS the
        # range is 200-599. For target groups with a protocol of HTTP or HTTPS, the range is 200-499. For
        # target groups with a protocol of GENEVE, the range is 200-399.

        @[JSON::Field(key: "Matcher")]
        getter matcher : Types::Matcher?

        # The port on which the targets receive traffic. This port is used unless you specify a port override
        # when registering the target. If the target is a Lambda function, this parameter does not apply. If
        # the protocol is GENEVE, the supported port is 6081.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol to use for routing traffic to the targets. For Application Load Balancers, the
        # supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported protocols are TCP,
        # TLS, UDP, TCP_UDP, QUIC, or TCP_QUIC. For Gateway Load Balancers, the supported protocol is GENEVE.
        # A TCP_UDP listener must be associated with a TCP_UDP target group. A TCP_QUIC listener must be
        # associated with a TCP_QUIC target group. If the target is a Lambda function, this parameter does not
        # apply.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # [HTTP/HTTPS protocol] The protocol version. Specify GRPC to send requests to targets using gRPC.
        # Specify HTTP2 to send requests to targets using HTTP/2. The default is HTTP1 , which sends requests
        # to targets using HTTP/1.1.

        @[JSON::Field(key: "ProtocolVersion")]
        getter protocol_version : String?

        # The tags to assign to the target group.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The port on which the target control agent and application load balancer exchange management traffic
        # for the target optimizer feature.

        @[JSON::Field(key: "TargetControlPort")]
        getter target_control_port : Int32?

        # The type of target that you must specify when registering targets with this target group. You can't
        # specify targets for a target group using more than one target type. instance - Register targets by
        # instance ID. This is the default value. ip - Register targets by IP address. You can specify IP
        # addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918
        # range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You
        # can't specify publicly routable IP addresses. lambda - Register a single Lambda function as a
        # target. alb - Register a single Application Load Balancer as a target.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # The number of consecutive health check failures required before considering a target unhealthy. The
        # range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, QUIC, TCP_QUIC, HTTP or
        # HTTPS, the default is 2. For target groups with a protocol of GENEVE, the default is 2. If the
        # target type is lambda , the default is 5.

        @[JSON::Field(key: "UnhealthyThresholdCount")]
        getter unhealthy_threshold_count : Int32?

        # The identifier of the virtual private cloud (VPC). If the target is a Lambda function, this
        # parameter does not apply. Otherwise, this parameter is required.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @name : String,
          @health_check_enabled : Bool? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : String? = nil,
          @health_check_protocol : String? = nil,
          @health_check_timeout_seconds : Int32? = nil,
          @healthy_threshold_count : Int32? = nil,
          @ip_address_type : String? = nil,
          @matcher : Types::Matcher? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @protocol_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_control_port : Int32? = nil,
          @target_type : String? = nil,
          @unhealthy_threshold_count : Int32? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct CreateTargetGroupOutput
        include JSON::Serializable

        # Information about the target group.

        @[JSON::Field(key: "TargetGroups")]
        getter target_groups : Array(Types::TargetGroup)?

        def initialize(
          @target_groups : Array(Types::TargetGroup)? = nil
        )
        end
      end


      struct CreateTrustStoreInput
        include JSON::Serializable

        # The Amazon S3 bucket for the ca certificates bundle.

        @[JSON::Field(key: "CaCertificatesBundleS3Bucket")]
        getter ca_certificates_bundle_s3_bucket : String

        # The Amazon S3 path for the ca certificates bundle.

        @[JSON::Field(key: "CaCertificatesBundleS3Key")]
        getter ca_certificates_bundle_s3_key : String

        # The name of the trust store. This name must be unique per region and can't be changed after
        # creation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon S3 object version for the ca certificates bundle. If undefined the current version is
        # used.

        @[JSON::Field(key: "CaCertificatesBundleS3ObjectVersion")]
        getter ca_certificates_bundle_s3_object_version : String?

        # The tags to assign to the trust store.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ca_certificates_bundle_s3_bucket : String,
          @ca_certificates_bundle_s3_key : String,
          @name : String,
          @ca_certificates_bundle_s3_object_version : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateTrustStoreOutput
        include JSON::Serializable

        # Information about the trust store created.

        @[JSON::Field(key: "TrustStores")]
        getter trust_stores : Array(Types::TrustStore)?

        def initialize(
          @trust_stores : Array(Types::TrustStore)? = nil
        )
        end
      end

      # The specified association can't be within the same account.

      struct DeleteAssociationSameAccountException
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteListenerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DeleteListenerOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLoadBalancerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        def initialize(
          @load_balancer_arn : String
        )
        end
      end


      struct DeleteLoadBalancerOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRuleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String

        def initialize(
          @rule_arn : String
        )
        end
      end


      struct DeleteRuleOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSharedTrustStoreAssociationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @resource_arn : String,
          @trust_store_arn : String
        )
        end
      end


      struct DeleteSharedTrustStoreAssociationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTargetGroupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        def initialize(
          @target_group_arn : String
        )
        end
      end


      struct DeleteTargetGroupOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTrustStoreInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end


      struct DeleteTrustStoreOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterTargetsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        # The targets. If you specified a port override when you registered a target, you must specify both
        # the target ID and the port when you deregister it.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::TargetDescription)

        def initialize(
          @target_group_arn : String,
          @targets : Array(Types::TargetDescription)
        )
        end
      end


      struct DeregisterTargetsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountLimitsInput
        include JSON::Serializable

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeAccountLimitsOutput
        include JSON::Serializable

        # Information about the limits.

        @[JSON::Field(key: "Limits")]
        getter limits : Array(Types::Limit)?

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limits : Array(Types::Limit)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeCapacityReservationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        def initialize(
          @load_balancer_arn : String
        )
        end
      end


      struct DescribeCapacityReservationOutput
        include JSON::Serializable

        # The state of the capacity reservation.

        @[JSON::Field(key: "CapacityReservationState")]
        getter capacity_reservation_state : Array(Types::ZonalCapacityReservationState)?

        # The amount of daily capacity decreases remaining.

        @[JSON::Field(key: "DecreaseRequestsRemaining")]
        getter decrease_requests_remaining : Int32?

        # The last time the capacity reservation was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The requested minimum capacity reservation for the load balancer

        @[JSON::Field(key: "MinimumLoadBalancerCapacity")]
        getter minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity?

        def initialize(
          @capacity_reservation_state : Array(Types::ZonalCapacityReservationState)? = nil,
          @decrease_requests_remaining : Int32? = nil,
          @last_modified_time : Time? = nil,
          @minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity? = nil
        )
        end
      end


      struct DescribeListenerAttributesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DescribeListenerAttributesOutput
        include JSON::Serializable

        # Information about the listener attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ListenerAttribute)?

        def initialize(
          @attributes : Array(Types::ListenerAttribute)? = nil
        )
        end
      end


      struct DescribeListenerCertificatesInput
        include JSON::Serializable

        # The Amazon Resource Names (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @listener_arn : String,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeListenerCertificatesOutput
        include JSON::Serializable

        # Information about the certificates.

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @certificates : Array(Types::Certificate)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeListenersInput
        include JSON::Serializable

        # The Amazon Resource Names (ARN) of the listeners.

        @[JSON::Field(key: "ListenerArns")]
        getter listener_arns : Array(String)?

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @listener_arns : Array(String)? = nil,
          @load_balancer_arn : String? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeListenersOutput
        include JSON::Serializable

        # Information about the listeners.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)?

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @listeners : Array(Types::Listener)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeLoadBalancerAttributesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        def initialize(
          @load_balancer_arn : String
        )
        end
      end


      struct DescribeLoadBalancerAttributesOutput
        include JSON::Serializable

        # Information about the load balancer attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::LoadBalancerAttribute)?

        def initialize(
          @attributes : Array(Types::LoadBalancerAttribute)? = nil
        )
        end
      end


      struct DescribeLoadBalancersInput
        include JSON::Serializable

        # The Amazon Resource Names (ARN) of the load balancers. You can specify up to 20 load balancers in a
        # single call.

        @[JSON::Field(key: "LoadBalancerArns")]
        getter load_balancer_arns : Array(String)?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The names of the load balancers.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @load_balancer_arns : Array(String)? = nil,
          @marker : String? = nil,
          @names : Array(String)? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeLoadBalancersOutput
        include JSON::Serializable

        # Information about the load balancers.

        @[JSON::Field(key: "LoadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct DescribeRulesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The Amazon Resource Names (ARN) of the rules.

        @[JSON::Field(key: "RuleArns")]
        getter rule_arns : Array(String)?

        def initialize(
          @listener_arn : String? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @rule_arns : Array(String)? = nil
        )
        end
      end


      struct DescribeRulesOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @next_marker : String? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct DescribeSSLPoliciesInput
        include JSON::Serializable

        # The type of load balancer. The default lists the SSL policies for all load balancers.

        @[JSON::Field(key: "LoadBalancerType")]
        getter load_balancer_type : String?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The names of the policies.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @load_balancer_type : String? = nil,
          @marker : String? = nil,
          @names : Array(String)? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeSSLPoliciesOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the security policies.

        @[JSON::Field(key: "SslPolicies")]
        getter ssl_policies : Array(Types::SslPolicy)?

        def initialize(
          @next_marker : String? = nil,
          @ssl_policies : Array(Types::SslPolicy)? = nil
        )
        end
      end


      struct DescribeTagsInput
        include JSON::Serializable

        # The Amazon Resource Names (ARN) of the resources. You can specify up to 20 resources in a single
        # call.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        def initialize(
          @resource_arns : Array(String)
        )
        end
      end


      struct DescribeTagsOutput
        include JSON::Serializable

        # Information about the tags.

        @[JSON::Field(key: "TagDescriptions")]
        getter tag_descriptions : Array(Types::TagDescription)?

        def initialize(
          @tag_descriptions : Array(Types::TagDescription)? = nil
        )
        end
      end


      struct DescribeTargetGroupAttributesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        def initialize(
          @target_group_arn : String
        )
        end
      end


      struct DescribeTargetGroupAttributesOutput
        include JSON::Serializable

        # Information about the target group attributes

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::TargetGroupAttribute)?

        def initialize(
          @attributes : Array(Types::TargetGroupAttribute)? = nil
        )
        end
      end


      struct DescribeTargetGroupsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The names of the target groups.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The Amazon Resource Names (ARN) of the target groups.

        @[JSON::Field(key: "TargetGroupArns")]
        getter target_group_arns : Array(String)?

        def initialize(
          @load_balancer_arn : String? = nil,
          @marker : String? = nil,
          @names : Array(String)? = nil,
          @page_size : Int32? = nil,
          @target_group_arns : Array(String)? = nil
        )
        end
      end


      struct DescribeTargetGroupsOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the target groups.

        @[JSON::Field(key: "TargetGroups")]
        getter target_groups : Array(Types::TargetGroup)?

        def initialize(
          @next_marker : String? = nil,
          @target_groups : Array(Types::TargetGroup)? = nil
        )
        end
      end


      struct DescribeTargetHealthInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        # Used to include anomaly detection information.

        @[JSON::Field(key: "Include")]
        getter include : Array(String)?

        # The targets.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::TargetDescription)?

        def initialize(
          @target_group_arn : String,
          @include : Array(String)? = nil,
          @targets : Array(Types::TargetDescription)? = nil
        )
        end
      end


      struct DescribeTargetHealthOutput
        include JSON::Serializable

        # Information about the health of the targets.

        @[JSON::Field(key: "TargetHealthDescriptions")]
        getter target_health_descriptions : Array(Types::TargetHealthDescription)?

        def initialize(
          @target_health_descriptions : Array(Types::TargetHealthDescription)? = nil
        )
        end
      end


      struct DescribeTrustStoreAssociationsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @trust_store_arn : String,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct DescribeTrustStoreAssociationsOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the resources the trust store is associated to.

        @[JSON::Field(key: "TrustStoreAssociations")]
        getter trust_store_associations : Array(Types::TrustStoreAssociation)?

        def initialize(
          @next_marker : String? = nil,
          @trust_store_associations : Array(Types::TrustStoreAssociation)? = nil
        )
        end
      end

      # Information about the revocations used by a trust store.

      struct DescribeTrustStoreRevocation
        include JSON::Serializable

        # The number of revoked certificates.

        @[JSON::Field(key: "NumberOfRevokedEntries")]
        getter number_of_revoked_entries : Int64?

        # The revocation ID of a revocation file in use.

        @[JSON::Field(key: "RevocationId")]
        getter revocation_id : Int64?

        # The type of revocation file.

        @[JSON::Field(key: "RevocationType")]
        getter revocation_type : String?

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String?

        def initialize(
          @number_of_revoked_entries : Int64? = nil,
          @revocation_id : Int64? = nil,
          @revocation_type : String? = nil,
          @trust_store_arn : String? = nil
        )
        end
      end


      struct DescribeTrustStoreRevocationsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The revocation IDs of the revocation files you want to describe.

        @[JSON::Field(key: "RevocationIds")]
        getter revocation_ids : Array(Int64)?

        def initialize(
          @trust_store_arn : String,
          @marker : String? = nil,
          @page_size : Int32? = nil,
          @revocation_ids : Array(Int64)? = nil
        )
        end
      end


      struct DescribeTrustStoreRevocationsOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the revocation file in the trust store.

        @[JSON::Field(key: "TrustStoreRevocations")]
        getter trust_store_revocations : Array(Types::DescribeTrustStoreRevocation)?

        def initialize(
          @next_marker : String? = nil,
          @trust_store_revocations : Array(Types::DescribeTrustStoreRevocation)? = nil
        )
        end
      end


      struct DescribeTrustStoresInput
        include JSON::Serializable

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The names of the trust stores.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The maximum number of results to return with this call.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArns")]
        getter trust_store_arns : Array(String)?

        def initialize(
          @marker : String? = nil,
          @names : Array(String)? = nil,
          @page_size : Int32? = nil,
          @trust_store_arns : Array(String)? = nil
        )
        end
      end


      struct DescribeTrustStoresOutput
        include JSON::Serializable

        # If there are additional results, this is the marker for the next set of results. Otherwise, this is
        # null.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Information about the trust stores.

        @[JSON::Field(key: "TrustStores")]
        getter trust_stores : Array(Types::TrustStore)?

        def initialize(
          @next_marker : String? = nil,
          @trust_stores : Array(Types::TrustStore)? = nil
        )
        end
      end

      # A listener with the specified port already exists.

      struct DuplicateListenerException
        include JSON::Serializable

        def initialize
        end
      end

      # A load balancer with the specified name already exists.

      struct DuplicateLoadBalancerNameException
        include JSON::Serializable

        def initialize
        end
      end

      # A tag key was specified more than once.

      struct DuplicateTagKeysException
        include JSON::Serializable

        def initialize
        end
      end

      # A target group with the specified name already exists.

      struct DuplicateTargetGroupNameException
        include JSON::Serializable

        def initialize
        end
      end

      # A trust store with the specified name already exists.

      struct DuplicateTrustStoreNameException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an action that returns a custom HTTP response.

      struct FixedResponseActionConfig
        include JSON::Serializable

        # The HTTP response code (2XX, 4XX, or 5XX).

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # The content type. Valid Values: text/plain | text/css | text/html | application/javascript |
        # application/json

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The message.

        @[JSON::Field(key: "MessageBody")]
        getter message_body : String?

        def initialize(
          @status_code : String,
          @content_type : String? = nil,
          @message_body : String? = nil
        )
        end
      end

      # Information about a forward action.

      struct ForwardActionConfig
        include JSON::Serializable

        # The target group stickiness for the rule.

        @[JSON::Field(key: "TargetGroupStickinessConfig")]
        getter target_group_stickiness_config : Types::TargetGroupStickinessConfig?

        # The target groups.

        @[JSON::Field(key: "TargetGroups")]
        getter target_groups : Array(Types::TargetGroupTuple)?

        def initialize(
          @target_group_stickiness_config : Types::TargetGroupStickinessConfig? = nil,
          @target_groups : Array(Types::TargetGroupTuple)? = nil
        )
        end
      end


      struct GetResourcePolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyOutput
        include JSON::Serializable

        # The content of the resource policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetTrustStoreCaCertificatesBundleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @trust_store_arn : String
        )
        end
      end


      struct GetTrustStoreCaCertificatesBundleOutput
        include JSON::Serializable

        # The ca certificate bundles Amazon S3 URI.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @location : String? = nil
        )
        end
      end


      struct GetTrustStoreRevocationContentInput
        include JSON::Serializable

        # The revocation ID of the revocation file.

        @[JSON::Field(key: "RevocationId")]
        getter revocation_id : Int64

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @revocation_id : Int64,
          @trust_store_arn : String
        )
        end
      end


      struct GetTrustStoreRevocationContentOutput
        include JSON::Serializable

        # The revocation files Amazon S3 URI.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @location : String? = nil
        )
        end
      end

      # The health of the specified targets could not be retrieved due to an internal error.

      struct HealthUnavailableException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a host header condition.

      struct HostHeaderConditionConfig
        include JSON::Serializable

        # The regular expressions to compare against the host header. The maximum length of each string is 128
        # characters.

        @[JSON::Field(key: "RegexValues")]
        getter regex_values : Array(String)?

        # The host names. The maximum length of each string is 128 characters. The comparison is case
        # insensitive. The following wildcard characters are supported: * (matches 0 or more characters) and ?
        # (matches exactly 1 character). You must include at least one "." character. You can include only
        # alphabetical characters after the final "." character. If you specify multiple strings, the
        # condition is satisfied if one of the strings matches the host name.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @regex_values : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a host header rewrite transform. This transform matches a pattern in the host
      # header in an HTTP request and replaces it with the specified string.

      struct HostHeaderRewriteConfig
        include JSON::Serializable

        # The host header rewrite transform. Each transform consists of a regular expression to match and a
        # replacement string.

        @[JSON::Field(key: "Rewrites")]
        getter rewrites : Array(Types::RewriteConfig)?

        def initialize(
          @rewrites : Array(Types::RewriteConfig)? = nil
        )
        end
      end

      # Information about an HTTP header condition. There is a set of standard HTTP header fields. You can
      # also define custom HTTP header fields.

      struct HttpHeaderConditionConfig
        include JSON::Serializable

        # The name of the HTTP header field. The maximum length is 40 characters. The header name is case
        # insensitive. The allowed characters are specified by RFC 7230. Wildcards are not supported. You
        # can't use an HTTP header condition to specify the host header. Instead, use a host condition .

        @[JSON::Field(key: "HttpHeaderName")]
        getter http_header_name : String?

        # The regular expression to compare against the HTTP header. The maximum length of each string is 128
        # characters.

        @[JSON::Field(key: "RegexValues")]
        getter regex_values : Array(String)?

        # The strings to compare against the value of the HTTP header. The maximum length of each string is
        # 128 characters. The comparison strings are case insensitive. The following wildcard characters are
        # supported: * (matches 0 or more characters) and ? (matches exactly 1 character). If the same header
        # appears multiple times in the request, we search them in order until a match is found. If you
        # specify multiple strings, the condition is satisfied if one of the strings matches the value of the
        # HTTP header. To require that all of the strings are a match, create one condition per string.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @http_header_name : String? = nil,
          @regex_values : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about an HTTP method condition. HTTP defines a set of request methods, also referred to
      # as HTTP verbs. For more information, see the HTTP Method Registry . You can also define custom HTTP
      # methods.

      struct HttpRequestMethodConditionConfig
        include JSON::Serializable

        # The name of the request method. The maximum length is 40 characters. The allowed characters are A-Z,
        # hyphen (-), and underscore (_). The comparison is case sensitive. Wildcards are not supported;
        # therefore, the method name must be an exact match. If you specify multiple strings, the condition is
        # satisfied if one of the strings matches the HTTP request method. We recommend that you route GET and
        # HEAD requests in the same way, because the response to a HEAD request may be cached.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @values : Array(String)? = nil
        )
        end
      end

      # The specified configuration is not valid with this protocol.

      struct IncompatibleProtocolsException
        include JSON::Serializable

        def initialize
        end
      end

      # There is insufficient capacity to reserve.

      struct InsufficientCapacityException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ca certificate bundle is in an invalid format, or corrupt.

      struct InvalidCaCertificatesBundleException
        include JSON::Serializable

        def initialize
        end
      end

      # The requested configuration is not valid.

      struct InvalidConfigurationRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # The requested action is not valid.

      struct InvalidLoadBalancerActionException
        include JSON::Serializable

        def initialize
        end
      end

      # The provided revocation file is an invalid format, or uses an incorrect algorithm.

      struct InvalidRevocationContentException
        include JSON::Serializable

        def initialize
        end
      end

      # The requested scheme is not valid.

      struct InvalidSchemeException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified security group does not exist.

      struct InvalidSecurityGroupException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet is out of available addresses.

      struct InvalidSubnetException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified target does not exist, is not in the same VPC as the target group, or has an
      # unsupported instance type.

      struct InvalidTargetException
        include JSON::Serializable

        def initialize
        end
      end

      # An IPAM pool is a collection of IP address CIDRs. IPAM pools enable you to organize your IP
      # addresses according to your routing and security needs.

      struct IpamPools
        include JSON::Serializable

        # The ID of the IPv4 IPAM pool.

        @[JSON::Field(key: "Ipv4IpamPoolId")]
        getter ipv4_ipam_pool_id : String?

        def initialize(
          @ipv4_ipam_pool_id : String? = nil
        )
        end
      end

      # Information about an additional claim to validate.

      struct JwtValidationActionAdditionalClaim
        include JSON::Serializable

        # The format of the claim value.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The name of the claim. You can't specify exp , iss , nbf , or iat because we validate them by
        # default.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The claim value. The maximum size of the list is 10. Each value can be up to 256 characters in
        # length. If the format is space-separated-values , the values can't include spaces.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @format : String,
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Information about a JSON Web Token (JWT) validation action.

      struct JwtValidationActionConfig
        include JSON::Serializable

        # The issuer of the JWT. The maximum length is 256 characters.

        @[JSON::Field(key: "Issuer")]
        getter issuer : String

        # The JSON Web Key Set (JWKS) endpoint. This endpoint contains JSON Web Keys (JWK) that are used to
        # validate signatures from the provider. This must be a full URL, including the HTTPS protocol, the
        # domain, and the path. The maximum length is 256 characters.

        @[JSON::Field(key: "JwksEndpoint")]
        getter jwks_endpoint : String

        # Additional claims to validate. The maximum size of the list is 10. We validate the exp , iss , nbf ,
        # and iat claims by default.

        @[JSON::Field(key: "AdditionalClaims")]
        getter additional_claims : Array(Types::JwtValidationActionAdditionalClaim)?

        def initialize(
          @issuer : String,
          @jwks_endpoint : String,
          @additional_claims : Array(Types::JwtValidationActionAdditionalClaim)? = nil
        )
        end
      end

      # Information about an Elastic Load Balancing resource limit for your Amazon Web Services account. For
      # more information, see the following: Quotas for your Application Load Balancers Quotas for your
      # Network Load Balancers Quotas for your Gateway Load Balancers

      struct Limit
        include JSON::Serializable

        # The maximum value of the limit.

        @[JSON::Field(key: "Max")]
        getter max : String?

        # The name of the limit.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @max : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a listener.

      struct Listener
        include JSON::Serializable

        # [TLS listener] The name of the Application-Layer Protocol Negotiation (ALPN) policy.

        @[JSON::Field(key: "AlpnPolicy")]
        getter alpn_policy : Array(String)?

        # [HTTPS or TLS listener] The default certificate for the listener.

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # The default actions for the listener.

        @[JSON::Field(key: "DefaultActions")]
        getter default_actions : Array(Types::Action)?

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String?

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String?

        # The mutual authentication configuration information.

        @[JSON::Field(key: "MutualAuthentication")]
        getter mutual_authentication : Types::MutualAuthenticationAttributes?

        # The port on which the load balancer is listening.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol for connections from clients to the load balancer.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # [HTTPS or TLS listener] The security policy that defines which protocols and ciphers are supported.

        @[JSON::Field(key: "SslPolicy")]
        getter ssl_policy : String?

        def initialize(
          @alpn_policy : Array(String)? = nil,
          @certificates : Array(Types::Certificate)? = nil,
          @default_actions : Array(Types::Action)? = nil,
          @listener_arn : String? = nil,
          @load_balancer_arn : String? = nil,
          @mutual_authentication : Types::MutualAuthenticationAttributes? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @ssl_policy : String? = nil
        )
        end
      end

      # Information about a listener attribute.

      struct ListenerAttribute
        include JSON::Serializable

        # The name of the attribute. The following attribute is supported by Network Load Balancers, and
        # Gateway Load Balancers. tcp.idle_timeout.seconds - The tcp idle timeout value, in seconds. The valid
        # range is 60-6000 seconds. The default is 350 seconds. The following attributes are only supported by
        # Application Load Balancers. routing.http.request.x_amzn_mtls_clientcert_serial_number.header_name -
        # Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Serial-Number HTTP request
        # header. routing.http.request.x_amzn_mtls_clientcert_issuer.header_name - Enables you to modify the
        # header name of the X-Amzn-Mtls-Clientcert-Issuer HTTP request header.
        # routing.http.request.x_amzn_mtls_clientcert_subject.header_name - Enables you to modify the header
        # name of the X-Amzn-Mtls-Clientcert-Subject HTTP request header.
        # routing.http.request.x_amzn_mtls_clientcert_validity.header_name - Enables you to modify the header
        # name of the X-Amzn-Mtls-Clientcert-Validity HTTP request header.
        # routing.http.request.x_amzn_mtls_clientcert_leaf.header_name - Enables you to modify the header name
        # of the X-Amzn-Mtls-Clientcert-Leaf HTTP request header.
        # routing.http.request.x_amzn_mtls_clientcert.header_name - Enables you to modify the header name of
        # the X-Amzn-Mtls-Clientcert HTTP request header. routing.http.request.x_amzn_tls_version.header_name
        # - Enables you to modify the header name of the X-Amzn-Tls-Version HTTP request header.
        # routing.http.request.x_amzn_tls_cipher_suite.header_name - Enables you to modify the header name of
        # the X-Amzn-Tls-Cipher-Suite HTTP request header. routing.http.response.server.enabled - Enables you
        # to allow or remove the HTTP response server header.
        # routing.http.response.strict_transport_security.header_value - Informs browsers that the site should
        # only be accessed using HTTPS, and that any future attempts to access it using HTTP should
        # automatically be converted to HTTPS. routing.http.response.access_control_allow_origin.header_value
        # - Specifies which origins are allowed to access the server.
        # routing.http.response.access_control_allow_methods.header_value - Returns which HTTP methods are
        # allowed when accessing the server from a different origin.
        # routing.http.response.access_control_allow_headers.header_value - Specifies which headers can be
        # used during the request. routing.http.response.access_control_allow_credentials.header_value -
        # Indicates whether the browser should include credentials such as cookies or authentication when
        # making requests. routing.http.response.access_control_expose_headers.header_value - Returns which
        # headers the browser can expose to the requesting client.
        # routing.http.response.access_control_max_age.header_value - Specifies how long the results of a
        # preflight request can be cached, in seconds.
        # routing.http.response.content_security_policy.header_value - Specifies restrictions enforced by the
        # browser to help minimize the risk of certain types of security threats.
        # routing.http.response.x_content_type_options.header_value - Indicates whether the MIME types
        # advertised in the Content-Type headers should be followed and not be changed.
        # routing.http.response.x_frame_options.header_value - Indicates whether the browser is allowed to
        # render a page in a frame , iframe , embed or object .

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The specified listener does not exist.

      struct ListenerNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a load balancer.

      struct LoadBalancer
        include JSON::Serializable

        # The subnets for the load balancer.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The ID of the Amazon Route 53 hosted zone associated with the load balancer.

        @[JSON::Field(key: "CanonicalHostedZoneId")]
        getter canonical_hosted_zone_id : String?

        # The date and time the load balancer was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # [Application Load Balancers on Outposts] The ID of the customer-owned address pool.

        @[JSON::Field(key: "CustomerOwnedIpv4Pool")]
        getter customer_owned_ipv4_pool : String?

        # The public DNS name of the load balancer.

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # [Network Load Balancers with UDP listeners] Indicates whether to use an IPv6 prefix from each subnet
        # for source NAT. The IP address type must be dualstack . The default value is off .

        @[JSON::Field(key: "EnablePrefixForIpv6SourceNat")]
        getter enable_prefix_for_ipv6_source_nat : String?

        # Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load
        # Balancer through Amazon Web Services PrivateLink.

        @[JSON::Field(key: "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic")]
        getter enforce_security_group_inbound_rules_on_private_link_traffic : String?

        # The type of IP addresses used for public or private connections by the subnets attached to your load
        # balancer. [Application Load Balancers] The possible values are ipv4 (IPv4 addresses), dualstack
        # (IPv4 and IPv6 addresses), and dualstack-without-public-ipv4 (public IPv6 addresses and private IPv4
        # and IPv6 addresses). [Network Load Balancers and Gateway Load Balancers] The possible values are
        # ipv4 (IPv4 addresses) and dualstack (IPv4 and IPv6 addresses).

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # [Application Load Balancers] The IPAM pool in use by the load balancer, if configured.

        @[JSON::Field(key: "IpamPools")]
        getter ipam_pools : Types::IpamPools?

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String?

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        # The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of an
        # Internet-facing load balancer is publicly resolvable to the public IP addresses of the nodes.
        # Therefore, Internet-facing load balancers can route requests from clients over the internet. The
        # nodes of an internal load balancer have only private IP addresses. The DNS name of an internal load
        # balancer is publicly resolvable to the private IP addresses of the nodes. Therefore, internal load
        # balancers can route requests only from clients with access to the VPC for the load balancer.

        @[JSON::Field(key: "Scheme")]
        getter scheme : String?

        # The IDs of the security groups for the load balancer.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The state of the load balancer.

        @[JSON::Field(key: "State")]
        getter state : Types::LoadBalancerState?

        # The type of load balancer.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The ID of the VPC for the load balancer.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @canonical_hosted_zone_id : String? = nil,
          @created_time : Time? = nil,
          @customer_owned_ipv4_pool : String? = nil,
          @dns_name : String? = nil,
          @enable_prefix_for_ipv6_source_nat : String? = nil,
          @enforce_security_group_inbound_rules_on_private_link_traffic : String? = nil,
          @ip_address_type : String? = nil,
          @ipam_pools : Types::IpamPools? = nil,
          @load_balancer_arn : String? = nil,
          @load_balancer_name : String? = nil,
          @scheme : String? = nil,
          @security_groups : Array(String)? = nil,
          @state : Types::LoadBalancerState? = nil,
          @type : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Information about a static IP address for a load balancer.

      struct LoadBalancerAddress
        include JSON::Serializable

        # [Network Load Balancers] The allocation ID of the Elastic IP address for an internal-facing load
        # balancer.

        @[JSON::Field(key: "AllocationId")]
        getter allocation_id : String?

        # [Network Load Balancers] The IPv6 address.

        @[JSON::Field(key: "IPv6Address")]
        getter i_pv6_address : String?

        # The static IP address.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # [Network Load Balancers] The private IPv4 address for an internal load balancer.

        @[JSON::Field(key: "PrivateIPv4Address")]
        getter private_i_pv4_address : String?

        def initialize(
          @allocation_id : String? = nil,
          @i_pv6_address : String? = nil,
          @ip_address : String? = nil,
          @private_i_pv4_address : String? = nil
        )
        end
      end

      # Information about a load balancer attribute.

      struct LoadBalancerAttribute
        include JSON::Serializable

        # The name of the attribute. The following attributes are supported by all load balancers:
        # deletion_protection.enabled - Indicates whether deletion protection is enabled. The value is true or
        # false . The default is false . load_balancing.cross_zone.enabled - Indicates whether cross-zone load
        # balancing is enabled. The possible values are true and false . The default for Network Load
        # Balancers and Gateway Load Balancers is false . The default for Application Load Balancers is true ,
        # and can't be changed. The following attributes are supported by both Application Load Balancers and
        # Network Load Balancers: access_logs.s3.enabled - Indicates whether access logs are enabled. The
        # value is true or false . The default is false . access_logs.s3.bucket - The name of the S3 bucket
        # for the access logs. This attribute is required if access logs are enabled. The bucket must exist in
        # the same region as the load balancer and have a bucket policy that grants Elastic Load Balancing
        # permissions to write to the bucket. access_logs.s3.prefix - The prefix for the location in the S3
        # bucket for the access logs. ipv6.deny_all_igw_traffic - Blocks internet gateway (IGW) access to the
        # load balancer. It is set to false for internet-facing load balancers and true for internal load
        # balancers, preventing unintended access to your internal load balancer through an internet gateway.
        # zonal_shift.config.enabled - Indicates whether zonal shift is enabled. The possible values are true
        # and false . The default is false . The following attributes are supported by only Application Load
        # Balancers: idle_timeout.timeout_seconds - The idle timeout value, in seconds. The valid range is
        # 1-4000 seconds. The default is 60 seconds. client_keep_alive.seconds - The client keep alive value,
        # in seconds. The valid range is 60-604800 seconds. The default is 3600 seconds.
        # connection_logs.s3.enabled - Indicates whether connection logs are enabled. The value is true or
        # false . The default is false . connection_logs.s3.bucket - The name of the S3 bucket for the
        # connection logs. This attribute is required if connection logs are enabled. The bucket must exist in
        # the same region as the load balancer and have a bucket policy that grants Elastic Load Balancing
        # permissions to write to the bucket. connection_logs.s3.prefix - The prefix for the location in the
        # S3 bucket for the connection logs. health_check_logs.s3.enabled - Indicates whether health check
        # logs are enabled. The value is true or false . The default is false . health_check_logs.s3.bucket -
        # The name of the S3 bucket for the health check logs. This attribute is required if health check logs
        # are enabled. The bucket must exist in the same region as the load balancer and have a bucket policy
        # that grants Elastic Load Balancing permissions to write to the bucket. health_check_logs.s3.prefix -
        # The prefix for the location in the S3 bucket for the health check logs.
        # routing.http.desync_mitigation_mode - Determines how the load balancer handles requests that might
        # pose a security risk to your application. The possible values are monitor , defensive , and
        # strictest . The default is defensive . routing.http.drop_invalid_header_fields.enabled - Indicates
        # whether HTTP headers with invalid header fields are removed by the load balancer ( true ) or routed
        # to targets ( false ). The default is false . routing.http.preserve_host_header.enabled - Indicates
        # whether the Application Load Balancer should preserve the Host header in the HTTP request and send
        # it to the target without any change. The possible values are true and false . The default is false .
        # routing.http.x_amzn_tls_version_and_cipher_suite.enabled - Indicates whether the two headers (
        # x-amzn-tls-version and x-amzn-tls-cipher-suite ), which contain information about the negotiated TLS
        # version and cipher suite, are added to the client request before sending it to the target. The
        # x-amzn-tls-version header has information about the TLS protocol version negotiated with the client,
        # and the x-amzn-tls-cipher-suite header has information about the cipher suite negotiated with the
        # client. Both headers are in OpenSSL format. The possible values for the attribute are true and false
        # . The default is false . routing.http.xff_client_port.enabled - Indicates whether the
        # X-Forwarded-For header should preserve the source port that the client used to connect to the load
        # balancer. The possible values are true and false . The default is false .
        # routing.http.xff_header_processing.mode - Enables you to modify, preserve, or remove the
        # X-Forwarded-For header in the HTTP request before the Application Load Balancer sends the request to
        # the target. The possible values are append , preserve , and remove . The default is append . If the
        # value is append , the Application Load Balancer adds the client IP address (of the last hop) to the
        # X-Forwarded-For header in the HTTP request before it sends it to targets. If the value is preserve
        # the Application Load Balancer preserves the X-Forwarded-For header in the HTTP request, and sends it
        # to targets without any change. If the value is remove , the Application Load Balancer removes the
        # X-Forwarded-For header in the HTTP request before it sends it to targets. routing.http2.enabled -
        # Indicates whether clients can connect to the load balancer using HTTP/2. If true , clients can
        # connect using HTTP/2 or HTTP/1.1. However, all client requests are subject to the stricter HTTP/2
        # header validation rules. For example, message header names must contain only alphanumeric characters
        # and hyphens. If false , clients must connect using HTTP/1.1. The default is true .
        # waf.fail_open.enabled - Indicates whether to allow a WAF-enabled load balancer to route requests to
        # targets if it is unable to forward the request to Amazon Web Services WAF. The possible values are
        # true and false . The default is false . The following attributes are supported by only Network Load
        # Balancers: dns_record.client_routing_policy - Indicates how traffic is distributed among the load
        # balancer Availability Zones. The possible values are availability_zone_affinity with 100 percent
        # zonal affinity, partial_availability_zone_affinity with 85 percent zonal affinity, and
        # any_availability_zone with 0 percent zonal affinity. secondary_ips.auto_assigned.per_subnet - The
        # number of secondary IP addresses to configure for your load balancer nodes. Use to address port
        # allocation errors if you can't add targets. The valid range is 0 to 7. The default is 0. After you
        # set this value, you can't decrease it.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The specified load balancer does not exist.

      struct LoadBalancerNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the state of the load balancer.

      struct LoadBalancerState
        include JSON::Serializable

        # The state code. The initial state of the load balancer is provisioning . After the load balancer is
        # fully set up and ready to route traffic, its state is active . If load balancer is routing traffic
        # but does not have the resources it needs to scale, its state is active_impaired . If the load
        # balancer could not be set up, its state is failed .

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A description of the state.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @code : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The codes to use when checking for a successful response from a target. If the protocol version is
      # gRPC, these are gRPC codes. Otherwise, these are HTTP codes.

      struct Matcher
        include JSON::Serializable

        # You can specify values between 0 and 99. You can specify multiple values (for example, "0,1") or a
        # range of values (for example, "0-5"). The default value is 12.

        @[JSON::Field(key: "GrpcCode")]
        getter grpc_code : String?

        # For Application Load Balancers, you can specify values between 200 and 499, with the default value
        # being 200. You can specify multiple values (for example, "200,202") or a range of values (for
        # example, "200-299"). For Network Load Balancers, you can specify values between 200 and 599, with
        # the default value being 200-399. You can specify multiple values (for example, "200,202") or a range
        # of values (for example, "200-299"). For Gateway Load Balancers, this must be "200–399". Note that
        # when using shorthand syntax, some values such as commas need to be escaped.

        @[JSON::Field(key: "HttpCode")]
        getter http_code : String?

        def initialize(
          @grpc_code : String? = nil,
          @http_code : String? = nil
        )
        end
      end

      # The minimum capacity for a load balancer.

      struct MinimumLoadBalancerCapacity
        include JSON::Serializable

        # The number of capacity units.

        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Int32?

        def initialize(
          @capacity_units : Int32? = nil
        )
        end
      end


      struct ModifyCapacityReservationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        # The minimum load balancer capacity reserved.

        @[JSON::Field(key: "MinimumLoadBalancerCapacity")]
        getter minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity?

        # Resets the capacity reservation.

        @[JSON::Field(key: "ResetCapacityReservation")]
        getter reset_capacity_reservation : Bool?

        def initialize(
          @load_balancer_arn : String,
          @minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity? = nil,
          @reset_capacity_reservation : Bool? = nil
        )
        end
      end


      struct ModifyCapacityReservationOutput
        include JSON::Serializable

        # The state of the capacity reservation.

        @[JSON::Field(key: "CapacityReservationState")]
        getter capacity_reservation_state : Array(Types::ZonalCapacityReservationState)?

        # The amount of daily capacity decreases remaining.

        @[JSON::Field(key: "DecreaseRequestsRemaining")]
        getter decrease_requests_remaining : Int32?

        # The last time the capacity reservation was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The requested minimum capacity reservation for the load balancer

        @[JSON::Field(key: "MinimumLoadBalancerCapacity")]
        getter minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity?

        def initialize(
          @capacity_reservation_state : Array(Types::ZonalCapacityReservationState)? = nil,
          @decrease_requests_remaining : Int32? = nil,
          @last_modified_time : Time? = nil,
          @minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity? = nil
        )
        end
      end


      struct ModifyIpPoolsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        # The IPAM pools to be modified.

        @[JSON::Field(key: "IpamPools")]
        getter ipam_pools : Types::IpamPools?

        # Remove the IP pools in use by the load balancer.

        @[JSON::Field(key: "RemoveIpamPools")]
        getter remove_ipam_pools : Array(String)?

        def initialize(
          @load_balancer_arn : String,
          @ipam_pools : Types::IpamPools? = nil,
          @remove_ipam_pools : Array(String)? = nil
        )
        end
      end


      struct ModifyIpPoolsOutput
        include JSON::Serializable

        # The IPAM pool ID.

        @[JSON::Field(key: "IpamPools")]
        getter ipam_pools : Types::IpamPools?

        def initialize(
          @ipam_pools : Types::IpamPools? = nil
        )
        end
      end


      struct ModifyListenerAttributesInput
        include JSON::Serializable

        # The listener attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ListenerAttribute)

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @attributes : Array(Types::ListenerAttribute),
          @listener_arn : String
        )
        end
      end


      struct ModifyListenerAttributesOutput
        include JSON::Serializable

        # Information about the listener attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ListenerAttribute)?

        def initialize(
          @attributes : Array(Types::ListenerAttribute)? = nil
        )
        end
      end


      struct ModifyListenerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # [TLS listeners] The name of the Application-Layer Protocol Negotiation (ALPN) policy. You can
        # specify one policy name. The following are the possible values: HTTP1Only HTTP2Only HTTP2Optional
        # HTTP2Preferred None For more information, see ALPN policies in the Network Load Balancers Guide .

        @[JSON::Field(key: "AlpnPolicy")]
        getter alpn_policy : Array(String)?

        # [HTTPS and TLS listeners] The default certificate for the listener. You must provide exactly one
        # certificate. Set CertificateArn to the certificate ARN but do not set IsDefault .

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)?

        # The actions for the default rule.

        @[JSON::Field(key: "DefaultActions")]
        getter default_actions : Array(Types::Action)?

        # [HTTPS listeners] The mutual authentication configuration information.

        @[JSON::Field(key: "MutualAuthentication")]
        getter mutual_authentication : Types::MutualAuthenticationAttributes?

        # The port for connections from clients to the load balancer. You can't specify a port for a Gateway
        # Load Balancer.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol for connections from clients to the load balancer. Application Load Balancers support
        # the HTTP and HTTPS protocols. Network Load Balancers support the TCP, TLS, UDP, TCP_UDP, QUIC, and
        # TCP_QUIC protocols. You can’t change the protocol to UDP, TCP_UDP, QUIC, or TCP_QUIC if dual-stack
        # mode is enabled. You can't specify a protocol for a Gateway Load Balancer.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # [HTTPS and TLS listeners] The security policy that defines which protocols and ciphers are
        # supported. For more information, see Security policies in the Application Load Balancers Guide or
        # Security policies in the Network Load Balancers Guide .

        @[JSON::Field(key: "SslPolicy")]
        getter ssl_policy : String?

        def initialize(
          @listener_arn : String,
          @alpn_policy : Array(String)? = nil,
          @certificates : Array(Types::Certificate)? = nil,
          @default_actions : Array(Types::Action)? = nil,
          @mutual_authentication : Types::MutualAuthenticationAttributes? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @ssl_policy : String? = nil
        )
        end
      end


      struct ModifyListenerOutput
        include JSON::Serializable

        # Information about the modified listener.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)?

        def initialize(
          @listeners : Array(Types::Listener)? = nil
        )
        end
      end


      struct ModifyLoadBalancerAttributesInput
        include JSON::Serializable

        # The load balancer attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::LoadBalancerAttribute)

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        def initialize(
          @attributes : Array(Types::LoadBalancerAttribute),
          @load_balancer_arn : String
        )
        end
      end


      struct ModifyLoadBalancerAttributesOutput
        include JSON::Serializable

        # Information about the load balancer attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::LoadBalancerAttribute)?

        def initialize(
          @attributes : Array(Types::LoadBalancerAttribute)? = nil
        )
        end
      end


      struct ModifyRuleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String

        # The actions.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::Action)?

        # The conditions.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::RuleCondition)?

        # Indicates whether to remove all transforms from the rule. If you specify ResetTransforms , you can't
        # specify Transforms .

        @[JSON::Field(key: "ResetTransforms")]
        getter reset_transforms : Bool?

        # The transforms to apply to requests that match this rule. You can add one host header rewrite
        # transform and one URL rewrite transform. If you specify Transforms , you can't specify
        # ResetTransforms .

        @[JSON::Field(key: "Transforms")]
        getter transforms : Array(Types::RuleTransform)?

        def initialize(
          @rule_arn : String,
          @actions : Array(Types::Action)? = nil,
          @conditions : Array(Types::RuleCondition)? = nil,
          @reset_transforms : Bool? = nil,
          @transforms : Array(Types::RuleTransform)? = nil
        )
        end
      end


      struct ModifyRuleOutput
        include JSON::Serializable

        # Information about the modified rule.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct ModifyTargetGroupAttributesInput
        include JSON::Serializable

        # The target group attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::TargetGroupAttribute)

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        def initialize(
          @attributes : Array(Types::TargetGroupAttribute),
          @target_group_arn : String
        )
        end
      end


      struct ModifyTargetGroupAttributesOutput
        include JSON::Serializable

        # Information about the target group attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::TargetGroupAttribute)?

        def initialize(
          @attributes : Array(Types::TargetGroupAttribute)? = nil
        )
        end
      end


      struct ModifyTargetGroupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        # Indicates whether health checks are enabled. If the target type is lambda , health checks are
        # disabled by default but can be enabled. If the target type is instance , ip , or alb , health checks
        # are always enabled and can't be disabled.

        @[JSON::Field(key: "HealthCheckEnabled")]
        getter health_check_enabled : Bool?

        # The approximate amount of time, in seconds, between health checks of an individual target.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # [HTTP/HTTPS health checks] The destination for health checks on the targets. [HTTP1 or HTTP2
        # protocol version] The ping path. The default is /. [GRPC protocol version] The path of a custom
        # health check method with the format /package.service/method. The default is /Amazon Web
        # Services.ALB/healthcheck.

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port the load balancer uses when performing health checks on targets.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : String?

        # The protocol the load balancer uses when performing health checks on targets. For Application Load
        # Balancers, the default is HTTP. For Network Load Balancers and Gateway Load Balancers, the default
        # is TCP. The TCP protocol is not supported for health checks if the protocol of the target group is
        # HTTP or HTTPS. It is supported for health checks only if the protocol of the target group is TCP,
        # TLS, UDP, or TCP_UDP. The GENEVE, TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC protocols are not supported
        # for health checks.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # [HTTP/HTTPS health checks] The amount of time, in seconds, during which no response means a failed
        # health check.

        @[JSON::Field(key: "HealthCheckTimeoutSeconds")]
        getter health_check_timeout_seconds : Int32?

        # The number of consecutive health checks successes required before considering an unhealthy target
        # healthy.

        @[JSON::Field(key: "HealthyThresholdCount")]
        getter healthy_threshold_count : Int32?

        # [HTTP/HTTPS health checks] The HTTP or gRPC codes to use when checking for a successful response
        # from a target. For target groups with a protocol of TCP, TCP_UDP, UDP or TLS the range is 200-599.
        # For target groups with a protocol of HTTP or HTTPS, the range is 200-499. For target groups with a
        # protocol of GENEVE, the range is 200-399.

        @[JSON::Field(key: "Matcher")]
        getter matcher : Types::Matcher?

        # The number of consecutive health check failures required before considering the target unhealthy.

        @[JSON::Field(key: "UnhealthyThresholdCount")]
        getter unhealthy_threshold_count : Int32?

        def initialize(
          @target_group_arn : String,
          @health_check_enabled : Bool? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : String? = nil,
          @health_check_protocol : String? = nil,
          @health_check_timeout_seconds : Int32? = nil,
          @healthy_threshold_count : Int32? = nil,
          @matcher : Types::Matcher? = nil,
          @unhealthy_threshold_count : Int32? = nil
        )
        end
      end


      struct ModifyTargetGroupOutput
        include JSON::Serializable

        # Information about the modified target group.

        @[JSON::Field(key: "TargetGroups")]
        getter target_groups : Array(Types::TargetGroup)?

        def initialize(
          @target_groups : Array(Types::TargetGroup)? = nil
        )
        end
      end


      struct ModifyTrustStoreInput
        include JSON::Serializable

        # The Amazon S3 bucket for the ca certificates bundle.

        @[JSON::Field(key: "CaCertificatesBundleS3Bucket")]
        getter ca_certificates_bundle_s3_bucket : String

        # The Amazon S3 path for the ca certificates bundle.

        @[JSON::Field(key: "CaCertificatesBundleS3Key")]
        getter ca_certificates_bundle_s3_key : String

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        # The Amazon S3 object version for the ca certificates bundle. If undefined the current version is
        # used.

        @[JSON::Field(key: "CaCertificatesBundleS3ObjectVersion")]
        getter ca_certificates_bundle_s3_object_version : String?

        def initialize(
          @ca_certificates_bundle_s3_bucket : String,
          @ca_certificates_bundle_s3_key : String,
          @trust_store_arn : String,
          @ca_certificates_bundle_s3_object_version : String? = nil
        )
        end
      end


      struct ModifyTrustStoreOutput
        include JSON::Serializable

        # Information about the modified trust store.

        @[JSON::Field(key: "TrustStores")]
        getter trust_stores : Array(Types::TrustStore)?

        def initialize(
          @trust_stores : Array(Types::TrustStore)? = nil
        )
        end
      end

      # Information about the mutual authentication attributes of a listener.

      struct MutualAuthenticationAttributes
        include JSON::Serializable

        # Indicates whether trust store CA certificate names are advertised.

        @[JSON::Field(key: "AdvertiseTrustStoreCaNames")]
        getter advertise_trust_store_ca_names : String?

        # Indicates whether expired client certificates are ignored.

        @[JSON::Field(key: "IgnoreClientCertificateExpiry")]
        getter ignore_client_certificate_expiry : Bool?

        # The client certificate handling method. Options are off , passthrough or verify . The default value
        # is off .

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String?

        # Indicates a shared trust stores association status.

        @[JSON::Field(key: "TrustStoreAssociationStatus")]
        getter trust_store_association_status : String?

        def initialize(
          @advertise_trust_store_ca_names : String? = nil,
          @ignore_client_certificate_expiry : Bool? = nil,
          @mode : String? = nil,
          @trust_store_arn : String? = nil,
          @trust_store_association_status : String? = nil
        )
        end
      end

      # This operation is not allowed.

      struct OperationNotPermittedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a path pattern condition.

      struct PathPatternConditionConfig
        include JSON::Serializable

        # The regular expressions to compare against the request URL. The maximum length of each string is 128
        # characters.

        @[JSON::Field(key: "RegexValues")]
        getter regex_values : Array(String)?

        # The path patterns to compare against the request URL. The maximum length of each string is 128
        # characters. The comparison is case sensitive. The following wildcard characters are supported: *
        # (matches 0 or more characters) and ? (matches exactly 1 character). If you specify multiple strings,
        # the condition is satisfied if one of them matches the request URL. The path pattern is compared only
        # to the path of the URL, not to its query string. To compare against the query string, use a query
        # string condition .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @regex_values : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # This operation is not allowed while a prior request has not been completed.

      struct PriorRequestNotCompleteException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified priority is in use.

      struct PriorityInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a query string condition. The query string component of a URI starts after the
      # first '?' character and is terminated by either a '#' character or the end of the URI. A typical
      # query string contains key/value pairs separated by '&amp;' characters. The allowed characters are
      # specified by RFC 3986. Any character can be percentage encoded.

      struct QueryStringConditionConfig
        include JSON::Serializable

        # The key/value pairs or values to find in the query string. The maximum length of each string is 128
        # characters. The comparison is case insensitive. The following wildcard characters are supported: *
        # (matches 0 or more characters) and ? (matches exactly 1 character). To search for a literal '*' or
        # '?' character in a query string, you must escape these characters in Values using a '\' character.
        # If you specify multiple key/value pairs or values, the condition is satisfied if one of them is
        # found in the query string.

        @[JSON::Field(key: "Values")]
        getter values : Array(Types::QueryStringKeyValuePair)?

        def initialize(
          @values : Array(Types::QueryStringKeyValuePair)? = nil
        )
        end
      end

      # Information about a key/value pair.

      struct QueryStringKeyValuePair
        include JSON::Serializable

        # The key. You can omit the key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a redirect action. A URI consists of the following components:
      # protocol://hostname:port/path?query. You must modify at least one of the following components to
      # avoid a redirect loop: protocol, hostname, port, or path. Any components that you do not modify
      # retain their original values. You can reuse URI components using the following reserved keywords:
      # #{protocol} #{host} #{port} #{path} (the leading "/" is removed) #{query} For example, you can
      # change the path to "/new/#{path}", the hostname to "example.#{host}", or the query to
      # "#{query}&amp;value=xyz".

      struct RedirectActionConfig
        include JSON::Serializable

        # The HTTP redirect code. The redirect is either permanent (HTTP 301) or temporary (HTTP 302).

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # The hostname. This component is not percent-encoded. The hostname can contain #{host}.

        @[JSON::Field(key: "Host")]
        getter host : String?

        # The absolute path, starting with the leading "/". This component is not percent-encoded. The path
        # can contain #{host}, #{path}, and #{port}.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # The port. You can specify a value from 1 to 65535 or #{port}.

        @[JSON::Field(key: "Port")]
        getter port : String?

        # The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can redirect HTTP to HTTP, HTTP to
        # HTTPS, and HTTPS to HTTPS. You can't redirect HTTPS to HTTP.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the
        # leading "?", as it is automatically added. You can specify any of the reserved keywords.

        @[JSON::Field(key: "Query")]
        getter query : String?

        def initialize(
          @status_code : String,
          @host : String? = nil,
          @path : String? = nil,
          @port : String? = nil,
          @protocol : String? = nil,
          @query : String? = nil
        )
        end
      end


      struct RegisterTargetsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String

        # The targets.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::TargetDescription)

        def initialize(
          @target_group_arn : String,
          @targets : Array(Types::TargetDescription)
        )
        end
      end


      struct RegisterTargetsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveListenerCertificatesInput
        include JSON::Serializable

        # The certificate to remove. You can specify one certificate per call. Set CertificateArn to the
        # certificate ARN but do not set IsDefault .

        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::Certificate)

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @certificates : Array(Types::Certificate),
          @listener_arn : String
        )
        end
      end


      struct RemoveListenerCertificatesOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveTagsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        # The tag keys for the tags to remove.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arns : Array(String),
          @tag_keys : Array(String)
        )
        end
      end


      struct RemoveTagsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveTrustStoreRevocationsInput
        include JSON::Serializable

        # The revocation IDs of the revocation files you want to remove.

        @[JSON::Field(key: "RevocationIds")]
        getter revocation_ids : Array(Int64)

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String

        def initialize(
          @revocation_ids : Array(Int64),
          @trust_store_arn : String
        )
        end
      end


      struct RemoveTrustStoreRevocationsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a revocation file.

      struct RevocationContent
        include JSON::Serializable

        # The type of revocation file.

        @[JSON::Field(key: "RevocationType")]
        getter revocation_type : String?

        # The Amazon S3 bucket for the revocation file.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 path for the revocation file.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        # The Amazon S3 object version of the revocation file.

        @[JSON::Field(key: "S3ObjectVersion")]
        getter s3_object_version : String?

        def initialize(
          @revocation_type : String? = nil,
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_object_version : String? = nil
        )
        end
      end

      # The specified revocation file does not exist.

      struct RevocationContentNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified revocation ID does not exist.

      struct RevocationIdNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a rewrite transform. This transform matches a pattern and replaces it with the
      # specified string.

      struct RewriteConfig
        include JSON::Serializable

        # The regular expression to match in the input string. The maximum length of the string is 1,024
        # characters.

        @[JSON::Field(key: "Regex")]
        getter regex : String

        # The replacement string to use when rewriting the matched input. The maximum length of the string is
        # 1,024 characters. You can specify capture groups in the regular expression (for example, $1 and $2).

        @[JSON::Field(key: "Replace")]
        getter replace : String

        def initialize(
          @regex : String,
          @replace : String
        )
        end
      end

      # Information about a rule.

      struct Rule
        include JSON::Serializable

        # The actions. Each rule must include exactly one of the following types of actions: forward ,
        # redirect , or fixed-response , and it must be the last action to be performed.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::Action)?

        # The conditions. Each rule can include zero or one of the following conditions: http-request-method ,
        # host-header , path-pattern , and source-ip , and zero or more of the following conditions:
        # http-header and query-string .

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::RuleCondition)?

        # Indicates whether this is the default rule.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The priority.

        @[JSON::Field(key: "Priority")]
        getter priority : String?

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The transforms for the rule.

        @[JSON::Field(key: "Transforms")]
        getter transforms : Array(Types::RuleTransform)?

        def initialize(
          @actions : Array(Types::Action)? = nil,
          @conditions : Array(Types::RuleCondition)? = nil,
          @is_default : Bool? = nil,
          @priority : String? = nil,
          @rule_arn : String? = nil,
          @transforms : Array(Types::RuleTransform)? = nil
        )
        end
      end

      # Information about a condition for a rule. Each rule can optionally include up to one of each of the
      # following conditions: http-request-method , host-header , path-pattern , and source-ip . Each rule
      # can also optionally include one or more of each of the following conditions: http-header and
      # query-string . Note that the value for a condition can't be empty. For more information, see Quotas
      # for your Application Load Balancers .

      struct RuleCondition
        include JSON::Serializable

        # The field in the HTTP request. The following are the possible values: http-header
        # http-request-method host-header path-pattern query-string source-ip

        @[JSON::Field(key: "Field")]
        getter field : String?

        # Information for a host header condition. Specify only when Field is host-header .

        @[JSON::Field(key: "HostHeaderConfig")]
        getter host_header_config : Types::HostHeaderConditionConfig?

        # Information for an HTTP header condition. Specify only when Field is http-header .

        @[JSON::Field(key: "HttpHeaderConfig")]
        getter http_header_config : Types::HttpHeaderConditionConfig?

        # Information for an HTTP method condition. Specify only when Field is http-request-method .

        @[JSON::Field(key: "HttpRequestMethodConfig")]
        getter http_request_method_config : Types::HttpRequestMethodConditionConfig?

        # Information for a path pattern condition. Specify only when Field is path-pattern .

        @[JSON::Field(key: "PathPatternConfig")]
        getter path_pattern_config : Types::PathPatternConditionConfig?

        # Information for a query string condition. Specify only when Field is query-string .

        @[JSON::Field(key: "QueryStringConfig")]
        getter query_string_config : Types::QueryStringConditionConfig?

        # The regular expressions to match against the condition field. The maximum length of each string is
        # 128 characters. Specify only when Field is http-header , host-header , or path-pattern .

        @[JSON::Field(key: "RegexValues")]
        getter regex_values : Array(String)?

        # Information for a source IP condition. Specify only when Field is source-ip .

        @[JSON::Field(key: "SourceIpConfig")]
        getter source_ip_config : Types::SourceIpConditionConfig?

        # The condition value. Specify only when Field is host-header or path-pattern . Alternatively, to
        # specify multiple host names or multiple path patterns, use HostHeaderConfig or PathPatternConfig .
        # If Field is host-header and you are not using HostHeaderConfig , you can specify a single host name
        # (for example, my.example.com) in Values . A host name is case insensitive, can be up to 128
        # characters in length, and can contain any of the following characters. A-Z, a-z, 0-9 - . * (matches
        # 0 or more characters) ? (matches exactly 1 character) If Field is path-pattern and you are not using
        # PathPatternConfig , you can specify a single path pattern (for example, /img/*) in Values . A path
        # pattern is case-sensitive, can be up to 128 characters in length, and can contain any of the
        # following characters. A-Z, a-z, 0-9 _ - . $ / ~ " ' @ : + &amp; (using &amp;amp;) * (matches 0 or
        # more characters) ? (matches exactly 1 character)

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @field : String? = nil,
          @host_header_config : Types::HostHeaderConditionConfig? = nil,
          @http_header_config : Types::HttpHeaderConditionConfig? = nil,
          @http_request_method_config : Types::HttpRequestMethodConditionConfig? = nil,
          @path_pattern_config : Types::PathPatternConditionConfig? = nil,
          @query_string_config : Types::QueryStringConditionConfig? = nil,
          @regex_values : Array(String)? = nil,
          @source_ip_config : Types::SourceIpConditionConfig? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The specified rule does not exist.

      struct RuleNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the priorities for the rules for a listener.

      struct RulePriorityPair
        include JSON::Serializable

        # The rule priority.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @priority : Int32? = nil,
          @rule_arn : String? = nil
        )
        end
      end

      # Information about a transform to apply to requests that match a rule. Transforms are applied to
      # requests before they are sent to targets.

      struct RuleTransform
        include JSON::Serializable

        # The type of transform. host-header-rewrite - Rewrite the host header. url-rewrite - Rewrite the
        # request URL.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Information about a host header rewrite transform. This transform modifies the host header in an
        # HTTP request. Specify only when Type is host-header-rewrite .

        @[JSON::Field(key: "HostHeaderRewriteConfig")]
        getter host_header_rewrite_config : Types::HostHeaderRewriteConfig?

        # Information about a URL rewrite transform. This transform modifies the request URL. Specify only
        # when Type is url-rewrite .

        @[JSON::Field(key: "UrlRewriteConfig")]
        getter url_rewrite_config : Types::UrlRewriteConfig?

        def initialize(
          @type : String,
          @host_header_rewrite_config : Types::HostHeaderRewriteConfig? = nil,
          @url_rewrite_config : Types::UrlRewriteConfig? = nil
        )
        end
      end

      # The specified SSL policy does not exist.

      struct SSLPolicyNotFoundException
        include JSON::Serializable

        def initialize
        end
      end


      struct SetIpAddressTypeInput
        include JSON::Serializable

        # The IP address type. Internal load balancers must use ipv4 . [Application Load Balancers] The
        # possible values are ipv4 (IPv4 addresses), dualstack (IPv4 and IPv6 addresses), and
        # dualstack-without-public-ipv4 (public IPv6 addresses and private IPv4 and IPv6 addresses).
        # Application Load Balancer authentication supports IPv4 addresses only when connecting to an Identity
        # Provider (IdP) or Amazon Cognito endpoint. Without a public IPv4 address the load balancer can't
        # complete the authentication process, resulting in HTTP 500 errors. [Network Load Balancers and
        # Gateway Load Balancers] The possible values are ipv4 (IPv4 addresses) and dualstack (IPv4 and IPv6
        # addresses).

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        def initialize(
          @ip_address_type : String,
          @load_balancer_arn : String
        )
        end
      end


      struct SetIpAddressTypeOutput
        include JSON::Serializable

        # The IP address type.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @ip_address_type : String? = nil
        )
        end
      end


      struct SetRulePrioritiesInput
        include JSON::Serializable

        # The rule priorities.

        @[JSON::Field(key: "RulePriorities")]
        getter rule_priorities : Array(Types::RulePriorityPair)

        def initialize(
          @rule_priorities : Array(Types::RulePriorityPair)
        )
        end
      end


      struct SetRulePrioritiesOutput
        include JSON::Serializable

        # Information about the rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct SetSecurityGroupsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        # The IDs of the security groups.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)

        # Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load
        # Balancer through Amazon Web Services PrivateLink. Applies only if the load balancer has an
        # associated security group. The default is on .

        @[JSON::Field(key: "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic")]
        getter enforce_security_group_inbound_rules_on_private_link_traffic : String?

        def initialize(
          @load_balancer_arn : String,
          @security_groups : Array(String),
          @enforce_security_group_inbound_rules_on_private_link_traffic : String? = nil
        )
        end
      end


      struct SetSecurityGroupsOutput
        include JSON::Serializable

        # Indicates whether to evaluate inbound security group rules for traffic sent to a Network Load
        # Balancer through Amazon Web Services PrivateLink.

        @[JSON::Field(key: "EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic")]
        getter enforce_security_group_inbound_rules_on_private_link_traffic : String?

        # The IDs of the security groups associated with the load balancer.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @enforce_security_group_inbound_rules_on_private_link_traffic : String? = nil,
          @security_group_ids : Array(String)? = nil
        )
        end
      end


      struct SetSubnetsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.

        @[JSON::Field(key: "LoadBalancerArn")]
        getter load_balancer_arn : String

        # [Network Load Balancers with UDP listeners] Indicates whether to use an IPv6 prefix from each subnet
        # for source NAT. The IP address type must be dualstack . The default value is off .

        @[JSON::Field(key: "EnablePrefixForIpv6SourceNat")]
        getter enable_prefix_for_ipv6_source_nat : String?

        # The IP address type. [Application Load Balancers] The possible values are ipv4 (IPv4 addresses),
        # dualstack (IPv4 and IPv6 addresses), and dualstack-without-public-ipv4 (public IPv6 addresses and
        # private IPv4 and IPv6 addresses). [Network Load Balancers and Gateway Load Balancers] The possible
        # values are ipv4 (IPv4 addresses) and dualstack (IPv4 and IPv6 addresses).

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must
        # specify either subnets or subnet mappings. [Application Load Balancers] You must specify subnets
        # from at least two Availability Zones. You can't specify Elastic IP addresses for your subnets.
        # [Application Load Balancers on Outposts] You must specify one Outpost subnet. [Application Load
        # Balancers on Local Zones] You can specify subnets from one or more Local Zones. [Network Load
        # Balancers] You can specify subnets from one or more Availability Zones. You can specify one Elastic
        # IP address per subnet if you need static IP addresses for your internet-facing load balancer. For
        # internal load balancers, you can specify one private IP address per subnet from the IPv4 range of
        # the subnet. For internet-facing load balancer, you can specify one IPv6 address per subnet. [Gateway
        # Load Balancers] You can specify subnets from one or more Availability Zones.

        @[JSON::Field(key: "SubnetMappings")]
        getter subnet_mappings : Array(Types::SubnetMapping)?

        # The IDs of the public subnets. You can specify only one subnet per Availability Zone. You must
        # specify either subnets or subnet mappings. [Application Load Balancers] You must specify subnets
        # from at least two Availability Zones. [Application Load Balancers on Outposts] You must specify one
        # Outpost subnet. [Application Load Balancers on Local Zones] You can specify subnets from one or more
        # Local Zones. [Network Load Balancers] You can specify subnets from one or more Availability Zones.
        # [Gateway Load Balancers] You can specify subnets from one or more Availability Zones. You must
        # include all subnets that were enabled previously, with their existing configurations, plus any
        # additional subnets.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        def initialize(
          @load_balancer_arn : String,
          @enable_prefix_for_ipv6_source_nat : String? = nil,
          @ip_address_type : String? = nil,
          @subnet_mappings : Array(Types::SubnetMapping)? = nil,
          @subnets : Array(String)? = nil
        )
        end
      end


      struct SetSubnetsOutput
        include JSON::Serializable

        # Information about the subnets.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # [Network Load Balancers] Indicates whether to use an IPv6 prefix from each subnet for source NAT.

        @[JSON::Field(key: "EnablePrefixForIpv6SourceNat")]
        getter enable_prefix_for_ipv6_source_nat : String?

        # The IP address type.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @enable_prefix_for_ipv6_source_nat : String? = nil,
          @ip_address_type : String? = nil
        )
        end
      end

      # Information about a source IP condition. You can use this condition to route based on the IP address
      # of the source that connects to the load balancer. If a client is behind a proxy, this is the IP
      # address of the proxy not the IP address of the client.

      struct SourceIpConditionConfig
        include JSON::Serializable

        # The source IP addresses, in CIDR format. You can use both IPv4 and IPv6 addresses. Wildcards are not
        # supported. If you specify multiple addresses, the condition is satisfied if the source IP address of
        # the request matches one of the CIDR blocks. This condition is not satisfied by the addresses in the
        # X-Forwarded-For header. To search for addresses in the X-Forwarded-For header, use an HTTP header
        # condition . The total number of values must be less than, or equal to five.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a policy used for SSL negotiation.

      struct SslPolicy
        include JSON::Serializable

        # The ciphers.

        @[JSON::Field(key: "Ciphers")]
        getter ciphers : Array(Types::Cipher)?

        # The name of the policy.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The protocols.

        @[JSON::Field(key: "SslProtocols")]
        getter ssl_protocols : Array(String)?

        # The supported load balancers.

        @[JSON::Field(key: "SupportedLoadBalancerTypes")]
        getter supported_load_balancer_types : Array(String)?

        def initialize(
          @ciphers : Array(Types::Cipher)? = nil,
          @name : String? = nil,
          @ssl_protocols : Array(String)? = nil,
          @supported_load_balancer_types : Array(String)? = nil
        )
        end
      end

      # Information about a subnet mapping.

      struct SubnetMapping
        include JSON::Serializable

        # [Network Load Balancers] The allocation ID of the Elastic IP address for an internet-facing load
        # balancer.

        @[JSON::Field(key: "AllocationId")]
        getter allocation_id : String?

        # [Network Load Balancers] The IPv6 address.

        @[JSON::Field(key: "IPv6Address")]
        getter i_pv6_address : String?

        # [Network Load Balancers] The private IPv4 address for an internal load balancer.

        @[JSON::Field(key: "PrivateIPv4Address")]
        getter private_i_pv4_address : String?

        # [Network Load Balancers with UDP listeners] The IPv6 prefix to use for source NAT. Specify an IPv6
        # prefix (/80 netmask) from the subnet CIDR block or auto_assigned to use an IPv6 prefix selected at
        # random from the subnet CIDR block.

        @[JSON::Field(key: "SourceNatIpv6Prefix")]
        getter source_nat_ipv6_prefix : String?

        # The ID of the subnet.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        def initialize(
          @allocation_id : String? = nil,
          @i_pv6_address : String? = nil,
          @private_i_pv4_address : String? = nil,
          @source_nat_ipv6_prefix : String? = nil,
          @subnet_id : String? = nil
        )
        end
      end

      # The specified subnet does not exist.

      struct SubnetNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a tag.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # The tags associated with a resource.

      struct TagDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Information about the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a target.

      struct TargetDescription
        include JSON::Serializable

        # The ID of the target. If the target type of the target group is instance , specify an instance ID.
        # If the target type is ip , specify an IP address. If the target type is lambda , specify the ARN of
        # the Lambda function. If the target type is alb , specify the ARN of the Application Load Balancer
        # target.

        @[JSON::Field(key: "Id")]
        getter id : String

        # An Availability Zone or all . This determines whether the target receives traffic from the load
        # balancer nodes in the specified Availability Zone or from all enabled Availability Zones for the
        # load balancer. For Application Load Balancer target groups, the specified Availability Zone value is
        # only applicable when cross-zone load balancing is off. Otherwise the parameter is ignored and
        # treated as all . This parameter is not supported if the target type of the target group is instance
        # or alb . If the target type is ip and the IP address is in a subnet of the VPC for the target group,
        # the Availability Zone is automatically detected and this parameter is optional. If the IP address is
        # outside the VPC, this parameter is required. For Application Load Balancer target groups with
        # cross-zone load balancing off, if the target type is ip and the IP address is outside of the VPC for
        # the target group, this should be an Availability Zone inside the VPC for the target group. If the
        # target type is lambda , this parameter is optional and the only supported value is all .

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The port on which the target is listening. If the target group protocol is GENEVE, the supported
        # port is 6081. If the target type is alb , the targeted Application Load Balancer must have at least
        # one listener whose port matches the target group port. This parameter is not used if the target is a
        # Lambda function.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The server ID for the targets. This value is required if the protocol is QUIC or TCP_QUIC and can't
        # be used with other protocols. The ID consists of the 0x prefix followed by 16 hexadecimal
        # characters. Any letters must be lowercase. The value must be unique at the listener level. You can't
        # modify the server ID for a registered target. You must deregister the target and then provide a new
        # server ID when you register the target again.

        @[JSON::Field(key: "QuicServerId")]
        getter quic_server_id : String?

        def initialize(
          @id : String,
          @availability_zone : String? = nil,
          @port : Int32? = nil,
          @quic_server_id : String? = nil
        )
        end
      end

      # Information about a target group.

      struct TargetGroup
        include JSON::Serializable

        # Indicates whether health checks are enabled.

        @[JSON::Field(key: "HealthCheckEnabled")]
        getter health_check_enabled : Bool?

        # The approximate amount of time, in seconds, between health checks of an individual target.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # The destination for health checks on the targets.

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port to use to connect with the target.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : String?

        # The protocol to use to connect with the target. The GENEVE, TLS, UDP, and TCP_UDP protocols are not
        # supported for health checks.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # The amount of time, in seconds, during which no response means a failed health check.

        @[JSON::Field(key: "HealthCheckTimeoutSeconds")]
        getter health_check_timeout_seconds : Int32?

        # The number of consecutive health checks successes required before considering an unhealthy target
        # healthy.

        @[JSON::Field(key: "HealthyThresholdCount")]
        getter healthy_threshold_count : Int32?

        # The IP address type. The default value is ipv4 .

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Amazon Resource Name (ARN) of the load balancer that routes traffic to this target group. You
        # can use each target group with only one load balancer.

        @[JSON::Field(key: "LoadBalancerArns")]
        getter load_balancer_arns : Array(String)?

        # The HTTP or gRPC codes to use when checking for a successful response from a target.

        @[JSON::Field(key: "Matcher")]
        getter matcher : Types::Matcher?

        # The port on which the targets are listening. This parameter is not used if the target is a Lambda
        # function.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol to use for routing traffic to the targets.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # [HTTP/HTTPS protocol] The protocol version. The possible values are GRPC , HTTP1 , and HTTP2 .

        @[JSON::Field(key: "ProtocolVersion")]
        getter protocol_version : String?

        # The port on which the target control agent and application load balancer exchange management traffic
        # for the target optimizer feature.

        @[JSON::Field(key: "TargetControlPort")]
        getter target_control_port : Int32?

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String?

        # The name of the target group.

        @[JSON::Field(key: "TargetGroupName")]
        getter target_group_name : String?

        # The type of target that you must specify when registering targets with this target group. The
        # possible values are instance (register targets by instance ID), ip (register targets by IP address),
        # lambda (register a single Lambda function as a target), or alb (register a single Application Load
        # Balancer as a target).

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        # The number of consecutive health check failures required before considering the target unhealthy.

        @[JSON::Field(key: "UnhealthyThresholdCount")]
        getter unhealthy_threshold_count : Int32?

        # The ID of the VPC for the targets.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @health_check_enabled : Bool? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : String? = nil,
          @health_check_protocol : String? = nil,
          @health_check_timeout_seconds : Int32? = nil,
          @healthy_threshold_count : Int32? = nil,
          @ip_address_type : String? = nil,
          @load_balancer_arns : Array(String)? = nil,
          @matcher : Types::Matcher? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @protocol_version : String? = nil,
          @target_control_port : Int32? = nil,
          @target_group_arn : String? = nil,
          @target_group_name : String? = nil,
          @target_type : String? = nil,
          @unhealthy_threshold_count : Int32? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # You've reached the limit on the number of load balancers per target group.

      struct TargetGroupAssociationLimitException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a target group attribute.

      struct TargetGroupAttribute
        include JSON::Serializable

        # The name of the attribute. The following attributes are supported by all load balancers:
        # deregistration_delay.timeout_seconds - The amount of time, in seconds, for Elastic Load Balancing to
        # wait before changing the state of a deregistering target from draining to unused . The range is
        # 0-3600 seconds. The default value is 300 seconds. If the target is a Lambda function, this attribute
        # is not supported. stickiness.enabled - Indicates whether target stickiness is enabled. The value is
        # true or false . The default is false . stickiness.type - Indicates the type of stickiness. The
        # possible values are: lb_cookie and app_cookie for Application Load Balancers. source_ip for Network
        # Load Balancers. source_ip_dest_ip and source_ip_dest_ip_proto for Gateway Load Balancers. The
        # following attributes are supported by Application Load Balancers and Network Load Balancers:
        # load_balancing.cross_zone.enabled - Indicates whether cross zone load balancing is enabled. The
        # value is true , false or use_load_balancer_configuration . The default is
        # use_load_balancer_configuration . target_group_health.dns_failover.minimum_healthy_targets.count -
        # The minimum number of targets that must be healthy. If the number of healthy targets is below this
        # value, mark the zone as unhealthy in DNS, so that traffic is routed only to healthy zones. The
        # possible values are off or an integer from 1 to the maximum number of targets. The default is 1.
        # target_group_health.dns_failover.minimum_healthy_targets.percentage - The minimum percentage of
        # targets that must be healthy. If the percentage of healthy targets is below this value, mark the
        # zone as unhealthy in DNS, so that traffic is routed only to healthy zones. The possible values are
        # off or an integer from 1 to 100. The default is off .
        # target_group_health.unhealthy_state_routing.minimum_healthy_targets.count - The minimum number of
        # targets that must be healthy. If the number of healthy targets is below this value, send traffic to
        # all targets, including unhealthy targets. The possible values are 1 to the maximum number of
        # targets. The default is 1.
        # target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage - The minimum
        # percentage of targets that must be healthy. If the percentage of healthy targets is below this
        # value, send traffic to all targets, including unhealthy targets. The possible values are off or an
        # integer from 1 to 100. The default is off . The following attributes are supported only if the load
        # balancer is an Application Load Balancer and the target is an instance or an IP address:
        # load_balancing.algorithm.type - The load balancing algorithm determines how the load balancer
        # selects targets when routing requests. The value is round_robin , least_outstanding_requests , or
        # weighted_random . The default is round_robin . load_balancing.algorithm.anomaly_mitigation - Only
        # available when load_balancing.algorithm.type is weighted_random . Indicates whether anomaly
        # mitigation is enabled. The value is on or off . The default is off . slow_start.duration_seconds -
        # The time period, in seconds, during which a newly registered target receives an increasing share of
        # the traffic to the target group. After this time period ends, the target receives its full share of
        # traffic. The range is 30-900 seconds (15 minutes). The default is 0 seconds (disabled).
        # stickiness.app_cookie.cookie_name - Indicates the name of the application-based cookie. Names that
        # start with the following prefixes are not allowed: AWSALB , AWSALBAPP , and AWSALBTG ; they're
        # reserved for use by the load balancer. stickiness.app_cookie.duration_seconds - The time period, in
        # seconds, during which requests from a client should be routed to the same target. After this time
        # period expires, the application-based cookie is considered stale. The range is 1 second to 1 week
        # (604800 seconds). The default value is 1 day (86400 seconds). stickiness.lb_cookie.duration_seconds
        # - The time period, in seconds, during which requests from a client should be routed to the same
        # target. After this time period expires, the load balancer-generated cookie is considered stale. The
        # range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). The
        # following attribute is supported only if the load balancer is an Application Load Balancer and the
        # target is a Lambda function: lambda.multi_value_headers.enabled - Indicates whether the request and
        # response headers that are exchanged between the load balancer and the Lambda function include arrays
        # of values or strings. The value is true or false . The default is false . If the value is false and
        # the request contains a duplicate header field name or query parameter key, the load balancer uses
        # the last value sent by the client. The following attributes are supported only by Network Load
        # Balancers: deregistration_delay.connection_termination.enabled - Indicates whether the load balancer
        # terminates connections at the end of the deregistration timeout. The value is true or false . For
        # new UDP/TCP_UDP target groups the default is true . Otherwise, the default is false .
        # preserve_client_ip.enabled - Indicates whether client IP preservation is enabled. The value is true
        # or false . The default is disabled if the target group type is IP address and the target group
        # protocol is TCP or TLS. Otherwise, the default is enabled. Client IP preservation can't be disabled
        # for UDP and TCP_UDP target groups. proxy_protocol_v2.enabled - Indicates whether Proxy Protocol
        # version 2 is enabled. The value is true or false . The default is false .
        # target_health_state.unhealthy.connection_termination.enabled - Indicates whether the load balancer
        # terminates connections to unhealthy targets. The value is true or false . The default is true . This
        # attribute can't be enabled for UDP and TCP_UDP target groups.
        # target_health_state.unhealthy.draining_interval_seconds - The amount of time for Elastic Load
        # Balancing to wait before changing the state of an unhealthy target from unhealthy.draining to
        # unhealthy . The range is 0-360000 seconds. The default value is 0 seconds. Note: This attribute can
        # only be configured when target_health_state.unhealthy.connection_termination.enabled is false . The
        # following attributes are supported only by Gateway Load Balancers: target_failover.on_deregistration
        # - Indicates how the Gateway Load Balancer handles existing flows when a target is deregistered. The
        # possible values are rebalance and no_rebalance . The default is no_rebalance . The two attributes (
        # target_failover.on_deregistration and target_failover.on_unhealthy ) can't be set independently. The
        # value you set for both attributes must be the same. target_failover.on_unhealthy - Indicates how the
        # Gateway Load Balancer handles existing flows when a target is unhealthy. The possible values are
        # rebalance and no_rebalance . The default is no_rebalance . The two attributes (
        # target_failover.on_deregistration and target_failover.on_unhealthy ) can't be set independently. The
        # value you set for both attributes must be the same.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The specified target group does not exist.

      struct TargetGroupNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the target group stickiness for a rule.

      struct TargetGroupStickinessConfig
        include JSON::Serializable

        # [Application Load Balancers] The time period, in seconds, during which requests from a client should
        # be routed to the same target group. The range is 1-604800 seconds (7 days). You must specify this
        # value when enabling target group stickiness.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        # Indicates whether target group stickiness is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @duration_seconds : Int32? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # Information about how traffic will be distributed between multiple target groups in a forward rule.

      struct TargetGroupTuple
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target group.

        @[JSON::Field(key: "TargetGroupArn")]
        getter target_group_arn : String?

        # The weight. The range is 0 to 999.

        @[JSON::Field(key: "Weight")]
        getter weight : Int32?

        def initialize(
          @target_group_arn : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # Information about the current health of a target.

      struct TargetHealth
        include JSON::Serializable

        # A description of the target health that provides additional details. If the state is healthy , a
        # description is not provided.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The reason code. If the target state is healthy , a reason code is not provided. If the target state
        # is initial , the reason code can be one of the following values: Elb.RegistrationInProgress - The
        # target is in the process of being registered with the load balancer. Elb.InitialHealthChecking - The
        # load balancer is still sending the target the minimum number of health checks required to determine
        # its health status. If the target state is unhealthy , the reason code can be one of the following
        # values: Target.ResponseCodeMismatch - The health checks did not return an expected HTTP code.
        # Target.Timeout - The health check requests timed out. Target.FailedHealthChecks - The load balancer
        # received an error while establishing a connection to the target or the target response was
        # malformed. Elb.InternalError - The health checks failed due to an internal error. If the target
        # state is unused , the reason code can be one of the following values: Target.NotRegistered - The
        # target is not registered with the target group. Target.NotInUse - The target group is not used by
        # any load balancer or the target is in an Availability Zone that is not enabled for its load
        # balancer. Target.InvalidState - The target is in the stopped or terminated state. Target.IpUnusable
        # - The target IP address is reserved for use by a load balancer. If the target state is draining ,
        # the reason code can be the following value: Target.DeregistrationInProgress - The target is in the
        # process of being deregistered and the deregistration delay period has not expired. If the target
        # state is unavailable , the reason code can be the following value: Target.HealthCheckDisabled -
        # Health checks are disabled for the target group. Elb.InternalError - Target health is unavailable
        # due to an internal error.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The state of the target.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @reason : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Information about the health of a target.

      struct TargetHealthDescription
        include JSON::Serializable

        # The administrative override information for the target.

        @[JSON::Field(key: "AdministrativeOverride")]
        getter administrative_override : Types::AdministrativeOverride?

        # The anomaly detection result for the target. If no anomalies were detected, the result is normal .
        # If anomalies were detected, the result is anomalous .

        @[JSON::Field(key: "AnomalyDetection")]
        getter anomaly_detection : Types::AnomalyDetection?

        # The port to use to connect with the target.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : String?

        # The description of the target.

        @[JSON::Field(key: "Target")]
        getter target : Types::TargetDescription?

        # The health information for the target.

        @[JSON::Field(key: "TargetHealth")]
        getter target_health : Types::TargetHealth?

        def initialize(
          @administrative_override : Types::AdministrativeOverride? = nil,
          @anomaly_detection : Types::AnomalyDetection? = nil,
          @health_check_port : String? = nil,
          @target : Types::TargetDescription? = nil,
          @target_health : Types::TargetHealth? = nil
        )
        end
      end

      # You've reached the limit on the number of actions per rule.

      struct TooManyActionsException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of certificates per load balancer.

      struct TooManyCertificatesException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of listeners per load balancer.

      struct TooManyListenersException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of load balancers for your Amazon Web Services account.

      struct TooManyLoadBalancersException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of times a target can be registered with a load balancer.

      struct TooManyRegistrationsForTargetIdException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of rules per load balancer.

      struct TooManyRulesException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of tags for this resource.

      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of target groups for your Amazon Web Services account.

      struct TooManyTargetGroupsException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of targets.

      struct TooManyTargetsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified trust store has too many revocation entries.

      struct TooManyTrustStoreRevocationEntriesException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of trust stores for your Amazon Web Services account.

      struct TooManyTrustStoresException
        include JSON::Serializable

        def initialize
        end
      end

      # You've reached the limit on the number of unique target groups per load balancer across all
      # listeners. If a target group is used by multiple actions for a load balancer, it is counted as only
      # one use.

      struct TooManyUniqueTargetGroupsPerLoadBalancerException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a trust store.

      struct TrustStore
        include JSON::Serializable

        # The name of the trust store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The number of ca certificates in the trust store.

        @[JSON::Field(key: "NumberOfCaCertificates")]
        getter number_of_ca_certificates : Int32?

        # The current status of the trust store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The number of revoked certificates in the trust store.

        @[JSON::Field(key: "TotalRevokedEntries")]
        getter total_revoked_entries : Int64?

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String?

        def initialize(
          @name : String? = nil,
          @number_of_ca_certificates : Int32? = nil,
          @status : String? = nil,
          @total_revoked_entries : Int64? = nil,
          @trust_store_arn : String? = nil
        )
        end
      end

      # Information about the resources a trust store is associated with.

      struct TrustStoreAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      # The specified association does not exist.

      struct TrustStoreAssociationNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified trust store is currently in use.

      struct TrustStoreInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified trust store does not exist.

      struct TrustStoreNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified trust store is not active.

      struct TrustStoreNotReadyException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a revocation file in use by a trust store.

      struct TrustStoreRevocation
        include JSON::Serializable

        # The number of revoked certificates.

        @[JSON::Field(key: "NumberOfRevokedEntries")]
        getter number_of_revoked_entries : Int64?

        # The revocation ID of the revocation file.

        @[JSON::Field(key: "RevocationId")]
        getter revocation_id : Int64?

        # The type of revocation file.

        @[JSON::Field(key: "RevocationType")]
        getter revocation_type : String?

        # The Amazon Resource Name (ARN) of the trust store.

        @[JSON::Field(key: "TrustStoreArn")]
        getter trust_store_arn : String?

        def initialize(
          @number_of_revoked_entries : Int64? = nil,
          @revocation_id : Int64? = nil,
          @revocation_type : String? = nil,
          @trust_store_arn : String? = nil
        )
        end
      end

      # The specified protocol is not supported.

      struct UnsupportedProtocolException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a URL rewrite transform. This transform matches a pattern in the request URL and
      # replaces it with the specified string.

      struct UrlRewriteConfig
        include JSON::Serializable

        # The URL rewrite transform to apply to the request. The transform consists of a regular expression to
        # match and a replacement string.

        @[JSON::Field(key: "Rewrites")]
        getter rewrites : Array(Types::RewriteConfig)?

        def initialize(
          @rewrites : Array(Types::RewriteConfig)? = nil
        )
        end
      end

      # The capacity reservation status for each Availability Zone.

      struct ZonalCapacityReservationState
        include JSON::Serializable

        # Information about the Availability Zone.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The number of effective capacity units.

        @[JSON::Field(key: "EffectiveCapacityUnits")]
        getter effective_capacity_units : Float64?

        # The state of the capacity reservation.

        @[JSON::Field(key: "State")]
        getter state : Types::CapacityReservationStatus?

        def initialize(
          @availability_zone : String? = nil,
          @effective_capacity_units : Float64? = nil,
          @state : Types::CapacityReservationStatus? = nil
        )
        end
      end
    end
  end
end
