module AwsSdk
  module ElasticLoadBalancingV2
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

      # Adds the specified SSL server certificate to the certificate list for the specified HTTPS or TLS
      # listener. If the certificate in already in the certificate list, the call is successful but the
      # certificate is not added again. For more information, see SSL certificates in the Application Load
      # Balancers Guide or Server certificates in the Network Load Balancers Guide .

      def add_listener_certificates(
        certificates : Array(Types::Certificate),
        listener_arn : String
      ) : Types::AddListenerCertificatesOutput

        input = Types::AddListenerCertificatesInput.new(certificates: certificates, listener_arn: listener_arn)
        add_listener_certificates(input)
      end

      def add_listener_certificates(input : Types::AddListenerCertificatesInput) : Types::AddListenerCertificatesOutput
        request = Protocol::Query.build_request(Model::ADD_LISTENER_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddListenerCertificatesOutput, "AddListenerCertificates")
      end

      # Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your
      # Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, trust
      # stores, listeners, and rules. Each tag consists of a key and an optional value. If a resource
      # already has a tag with the same key, AddTags updates its value.

      def add_tags(
        resource_arns : Array(String),
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput

        input = Types::AddTagsInput.new(resource_arns: resource_arns, tags: tags)
        add_tags(input)
      end

      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::Query.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Adds the specified revocation file to the specified trust store.

      def add_trust_store_revocations(
        trust_store_arn : String,
        revocation_contents : Array(Types::RevocationContent)? = nil
      ) : Types::AddTrustStoreRevocationsOutput

        input = Types::AddTrustStoreRevocationsInput.new(trust_store_arn: trust_store_arn, revocation_contents: revocation_contents)
        add_trust_store_revocations(input)
      end

      def add_trust_store_revocations(input : Types::AddTrustStoreRevocationsInput) : Types::AddTrustStoreRevocationsOutput
        request = Protocol::Query.build_request(Model::ADD_TRUST_STORE_REVOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddTrustStoreRevocationsOutput, "AddTrustStoreRevocations")
      end

      # Creates a listener for the specified Application Load Balancer, Network Load Balancer, or Gateway
      # Load Balancer. For more information, see the following: Listeners for your Application Load
      # Balancers Listeners for your Network Load Balancers Listeners for your Gateway Load Balancers This
      # operation is idempotent, which means that it completes at most one time. If you attempt to create
      # multiple listeners with the same settings, each call succeeds.

      def create_listener(
        default_actions : Array(Types::Action),
        load_balancer_arn : String,
        alpn_policy : Array(String)? = nil,
        certificates : Array(Types::Certificate)? = nil,
        mutual_authentication : Types::MutualAuthenticationAttributes? = nil,
        port : Int32? = nil,
        protocol : String? = nil,
        ssl_policy : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateListenerOutput

        input = Types::CreateListenerInput.new(default_actions: default_actions, load_balancer_arn: load_balancer_arn, alpn_policy: alpn_policy, certificates: certificates, mutual_authentication: mutual_authentication, port: port, protocol: protocol, ssl_policy: ssl_policy, tags: tags)
        create_listener(input)
      end

      def create_listener(input : Types::CreateListenerInput) : Types::CreateListenerOutput
        request = Protocol::Query.build_request(Model::CREATE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateListenerOutput, "CreateListener")
      end

      # Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer. For more
      # information, see the following: Application Load Balancers Network Load Balancers Gateway Load
      # Balancers This operation is idempotent, which means that it completes at most one time. If you
      # attempt to create multiple load balancers with the same settings, each call succeeds.

      def create_load_balancer(
        name : String,
        customer_owned_ipv4_pool : String? = nil,
        enable_prefix_for_ipv6_source_nat : String? = nil,
        ip_address_type : String? = nil,
        ipam_pools : Types::IpamPools? = nil,
        scheme : String? = nil,
        security_groups : Array(String)? = nil,
        subnet_mappings : Array(Types::SubnetMapping)? = nil,
        subnets : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Types::CreateLoadBalancerOutput

        input = Types::CreateLoadBalancerInput.new(name: name, customer_owned_ipv4_pool: customer_owned_ipv4_pool, enable_prefix_for_ipv6_source_nat: enable_prefix_for_ipv6_source_nat, ip_address_type: ip_address_type, ipam_pools: ipam_pools, scheme: scheme, security_groups: security_groups, subnet_mappings: subnet_mappings, subnets: subnets, tags: tags, type: type)
        create_load_balancer(input)
      end

      def create_load_balancer(input : Types::CreateLoadBalancerInput) : Types::CreateLoadBalancerOutput
        request = Protocol::Query.build_request(Model::CREATE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateLoadBalancerOutput, "CreateLoadBalancer")
      end

      # Creates a rule for the specified listener. The listener must be associated with an Application Load
      # Balancer. Each rule consists of a priority, one or more actions, one or more conditions, and up to
      # two optional transforms. Rules are evaluated in priority order, from the lowest value to the highest
      # value. When the conditions for a rule are met, its actions are performed. If the conditions for no
      # rules are met, the actions for the default rule are performed. For more information, see Listener
      # rules in the Application Load Balancers Guide .

      def create_rule(
        actions : Array(Types::Action),
        conditions : Array(Types::RuleCondition),
        listener_arn : String,
        priority : Int32,
        tags : Array(Types::Tag)? = nil,
        transforms : Array(Types::RuleTransform)? = nil
      ) : Types::CreateRuleOutput

        input = Types::CreateRuleInput.new(actions: actions, conditions: conditions, listener_arn: listener_arn, priority: priority, tags: tags, transforms: transforms)
        create_rule(input)
      end

      def create_rule(input : Types::CreateRuleInput) : Types::CreateRuleOutput
        request = Protocol::Query.build_request(Model::CREATE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateRuleOutput, "CreateRule")
      end

      # Creates a target group. For more information, see the following: Target groups for your Application
      # Load Balancers Target groups for your Network Load Balancers Target groups for your Gateway Load
      # Balancers This operation is idempotent, which means that it completes at most one time. If you
      # attempt to create multiple target groups with the same settings, each call succeeds.

      def create_target_group(
        name : String,
        health_check_enabled : Bool? = nil,
        health_check_interval_seconds : Int32? = nil,
        health_check_path : String? = nil,
        health_check_port : String? = nil,
        health_check_protocol : String? = nil,
        health_check_timeout_seconds : Int32? = nil,
        healthy_threshold_count : Int32? = nil,
        ip_address_type : String? = nil,
        matcher : Types::Matcher? = nil,
        port : Int32? = nil,
        protocol : String? = nil,
        protocol_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_control_port : Int32? = nil,
        target_type : String? = nil,
        unhealthy_threshold_count : Int32? = nil,
        vpc_id : String? = nil
      ) : Types::CreateTargetGroupOutput

        input = Types::CreateTargetGroupInput.new(name: name, health_check_enabled: health_check_enabled, health_check_interval_seconds: health_check_interval_seconds, health_check_path: health_check_path, health_check_port: health_check_port, health_check_protocol: health_check_protocol, health_check_timeout_seconds: health_check_timeout_seconds, healthy_threshold_count: healthy_threshold_count, ip_address_type: ip_address_type, matcher: matcher, port: port, protocol: protocol, protocol_version: protocol_version, tags: tags, target_control_port: target_control_port, target_type: target_type, unhealthy_threshold_count: unhealthy_threshold_count, vpc_id: vpc_id)
        create_target_group(input)
      end

      def create_target_group(input : Types::CreateTargetGroupInput) : Types::CreateTargetGroupOutput
        request = Protocol::Query.build_request(Model::CREATE_TARGET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateTargetGroupOutput, "CreateTargetGroup")
      end

      # Creates a trust store. For more information, see Mutual TLS for Application Load Balancers .

      def create_trust_store(
        ca_certificates_bundle_s3_bucket : String,
        ca_certificates_bundle_s3_key : String,
        name : String,
        ca_certificates_bundle_s3_object_version : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrustStoreOutput

        input = Types::CreateTrustStoreInput.new(ca_certificates_bundle_s3_bucket: ca_certificates_bundle_s3_bucket, ca_certificates_bundle_s3_key: ca_certificates_bundle_s3_key, name: name, ca_certificates_bundle_s3_object_version: ca_certificates_bundle_s3_object_version, tags: tags)
        create_trust_store(input)
      end

      def create_trust_store(input : Types::CreateTrustStoreInput) : Types::CreateTrustStoreOutput
        request = Protocol::Query.build_request(Model::CREATE_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateTrustStoreOutput, "CreateTrustStore")
      end

      # Deletes the specified listener. Alternatively, your listener is deleted when you delete the load
      # balancer to which it is attached.

      def delete_listener(
        listener_arn : String
      ) : Types::DeleteListenerOutput

        input = Types::DeleteListenerInput.new(listener_arn: listener_arn)
        delete_listener(input)
      end

      def delete_listener(input : Types::DeleteListenerInput) : Types::DeleteListenerOutput
        request = Protocol::Query.build_request(Model::DELETE_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteListenerOutput, "DeleteListener")
      end

      # Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.
      # Deleting a load balancer also deletes its listeners. You can't delete a load balancer if deletion
      # protection is enabled. If the load balancer does not exist or has already been deleted, the call
      # succeeds. Deleting a load balancer does not affect its registered targets. For example, your EC2
      # instances continue to run and are still registered to their target groups. If you no longer need
      # these EC2 instances, you can stop or terminate them.

      def delete_load_balancer(
        load_balancer_arn : String
      ) : Types::DeleteLoadBalancerOutput

        input = Types::DeleteLoadBalancerInput.new(load_balancer_arn: load_balancer_arn)
        delete_load_balancer(input)
      end

      def delete_load_balancer(input : Types::DeleteLoadBalancerInput) : Types::DeleteLoadBalancerOutput
        request = Protocol::Query.build_request(Model::DELETE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteLoadBalancerOutput, "DeleteLoadBalancer")
      end

      # Deletes the specified rule. You can't delete the default rule.

      def delete_rule(
        rule_arn : String
      ) : Types::DeleteRuleOutput

        input = Types::DeleteRuleInput.new(rule_arn: rule_arn)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleInput) : Types::DeleteRuleOutput
        request = Protocol::Query.build_request(Model::DELETE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteRuleOutput, "DeleteRule")
      end

      # Deletes a shared trust store association.

      def delete_shared_trust_store_association(
        resource_arn : String,
        trust_store_arn : String
      ) : Types::DeleteSharedTrustStoreAssociationOutput

        input = Types::DeleteSharedTrustStoreAssociationInput.new(resource_arn: resource_arn, trust_store_arn: trust_store_arn)
        delete_shared_trust_store_association(input)
      end

      def delete_shared_trust_store_association(input : Types::DeleteSharedTrustStoreAssociationInput) : Types::DeleteSharedTrustStoreAssociationOutput
        request = Protocol::Query.build_request(Model::DELETE_SHARED_TRUST_STORE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteSharedTrustStoreAssociationOutput, "DeleteSharedTrustStoreAssociation")
      end

      # Deletes the specified target group. You can delete a target group if it is not referenced by any
      # actions. Deleting a target group also deletes any associated health checks. Deleting a target group
      # does not affect its registered targets. For example, any EC2 instances continue to run until you
      # stop or terminate them.

      def delete_target_group(
        target_group_arn : String
      ) : Types::DeleteTargetGroupOutput

        input = Types::DeleteTargetGroupInput.new(target_group_arn: target_group_arn)
        delete_target_group(input)
      end

      def delete_target_group(input : Types::DeleteTargetGroupInput) : Types::DeleteTargetGroupOutput
        request = Protocol::Query.build_request(Model::DELETE_TARGET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteTargetGroupOutput, "DeleteTargetGroup")
      end

      # Deletes a trust store.

      def delete_trust_store(
        trust_store_arn : String
      ) : Types::DeleteTrustStoreOutput

        input = Types::DeleteTrustStoreInput.new(trust_store_arn: trust_store_arn)
        delete_trust_store(input)
      end

      def delete_trust_store(input : Types::DeleteTrustStoreInput) : Types::DeleteTrustStoreOutput
        request = Protocol::Query.build_request(Model::DELETE_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteTrustStoreOutput, "DeleteTrustStore")
      end

      # Deregisters the specified targets from the specified target group. After the targets are
      # deregistered, they no longer receive traffic from the load balancer. The load balancer stops sending
      # requests to targets that are deregistering, but uses connection draining to ensure that in-flight
      # traffic completes on the existing connections. This deregistration delay is configured by default
      # but can be updated for each target group. For more information, see the following: Deregistration
      # delay in the Application Load Balancers User Guide Deregistration delay in the Network Load
      # Balancers User Guide Deregistration delay in the Gateway Load Balancers User Guide Note: If the
      # specified target does not exist, the action returns successfully.

      def deregister_targets(
        target_group_arn : String,
        targets : Array(Types::TargetDescription)
      ) : Types::DeregisterTargetsOutput

        input = Types::DeregisterTargetsInput.new(target_group_arn: target_group_arn, targets: targets)
        deregister_targets(input)
      end

      def deregister_targets(input : Types::DeregisterTargetsInput) : Types::DeregisterTargetsOutput
        request = Protocol::Query.build_request(Model::DEREGISTER_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeregisterTargetsOutput, "DeregisterTargets")
      end

      # Describes the current Elastic Load Balancing resource limits for your Amazon Web Services account.
      # For more information, see the following: Quotas for your Application Load Balancers Quotas for your
      # Network Load Balancers Quotas for your Gateway Load Balancers

      def describe_account_limits(
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeAccountLimitsOutput

        input = Types::DescribeAccountLimitsInput.new(marker: marker, page_size: page_size)
        describe_account_limits(input)
      end

      def describe_account_limits(input : Types::DescribeAccountLimitsInput) : Types::DescribeAccountLimitsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAccountLimitsOutput, "DescribeAccountLimits")
      end

      # Describes the capacity reservation status for the specified load balancer.

      def describe_capacity_reservation(
        load_balancer_arn : String
      ) : Types::DescribeCapacityReservationOutput

        input = Types::DescribeCapacityReservationInput.new(load_balancer_arn: load_balancer_arn)
        describe_capacity_reservation(input)
      end

      def describe_capacity_reservation(input : Types::DescribeCapacityReservationInput) : Types::DescribeCapacityReservationOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeCapacityReservationOutput, "DescribeCapacityReservation")
      end

      # Describes the attributes for the specified listener.

      def describe_listener_attributes(
        listener_arn : String
      ) : Types::DescribeListenerAttributesOutput

        input = Types::DescribeListenerAttributesInput.new(listener_arn: listener_arn)
        describe_listener_attributes(input)
      end

      def describe_listener_attributes(input : Types::DescribeListenerAttributesInput) : Types::DescribeListenerAttributesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LISTENER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeListenerAttributesOutput, "DescribeListenerAttributes")
      end

      # Describes the default certificate and the certificate list for the specified HTTPS or TLS listener.
      # If the default certificate is also in the certificate list, it appears twice in the results (once
      # with IsDefault set to true and once with IsDefault set to false). For more information, see SSL
      # certificates in the Application Load Balancers Guide or Server certificates in the Network Load
      # Balancers Guide .

      def describe_listener_certificates(
        listener_arn : String,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeListenerCertificatesOutput

        input = Types::DescribeListenerCertificatesInput.new(listener_arn: listener_arn, marker: marker, page_size: page_size)
        describe_listener_certificates(input)
      end

      def describe_listener_certificates(input : Types::DescribeListenerCertificatesInput) : Types::DescribeListenerCertificatesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LISTENER_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeListenerCertificatesOutput, "DescribeListenerCertificates")
      end

      # Describes the specified listeners or the listeners for the specified Application Load Balancer,
      # Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one or
      # more listeners.

      def describe_listeners(
        listener_arns : Array(String)? = nil,
        load_balancer_arn : String? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeListenersOutput

        input = Types::DescribeListenersInput.new(listener_arns: listener_arns, load_balancer_arn: load_balancer_arn, marker: marker, page_size: page_size)
        describe_listeners(input)
      end

      def describe_listeners(input : Types::DescribeListenersInput) : Types::DescribeListenersOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LISTENERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeListenersOutput, "DescribeListeners")
      end

      # Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or
      # Gateway Load Balancer. For more information, see the following: Load balancer attributes in the
      # Application Load Balancers Guide Load balancer attributes in the Network Load Balancers Guide Load
      # balancer attributes in the Gateway Load Balancers Guide

      def describe_load_balancer_attributes(
        load_balancer_arn : String
      ) : Types::DescribeLoadBalancerAttributesOutput

        input = Types::DescribeLoadBalancerAttributesInput.new(load_balancer_arn: load_balancer_arn)
        describe_load_balancer_attributes(input)
      end

      def describe_load_balancer_attributes(input : Types::DescribeLoadBalancerAttributesInput) : Types::DescribeLoadBalancerAttributesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancerAttributesOutput, "DescribeLoadBalancerAttributes")
      end

      # Describes the specified load balancers or all of your load balancers.

      def describe_load_balancers(
        load_balancer_arns : Array(String)? = nil,
        marker : String? = nil,
        names : Array(String)? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeLoadBalancersOutput

        input = Types::DescribeLoadBalancersInput.new(load_balancer_arns: load_balancer_arns, marker: marker, names: names, page_size: page_size)
        describe_load_balancers(input)
      end

      def describe_load_balancers(input : Types::DescribeLoadBalancersInput) : Types::DescribeLoadBalancersOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancersOutput, "DescribeLoadBalancers")
      end

      # Describes the specified rules or the rules for the specified listener. You must specify either a
      # listener or rules.

      def describe_rules(
        listener_arn : String? = nil,
        marker : String? = nil,
        page_size : Int32? = nil,
        rule_arns : Array(String)? = nil
      ) : Types::DescribeRulesOutput

        input = Types::DescribeRulesInput.new(listener_arn: listener_arn, marker: marker, page_size: page_size, rule_arns: rule_arns)
        describe_rules(input)
      end

      def describe_rules(input : Types::DescribeRulesInput) : Types::DescribeRulesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeRulesOutput, "DescribeRules")
      end

      # Describes the specified policies or all policies used for SSL negotiation. For more information, see
      # Security policies in the Application Load Balancers Guide and Security policies in the Network Load
      # Balancers Guide .

      def describe_ssl_policies(
        load_balancer_type : String? = nil,
        marker : String? = nil,
        names : Array(String)? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeSSLPoliciesOutput

        input = Types::DescribeSSLPoliciesInput.new(load_balancer_type: load_balancer_type, marker: marker, names: names, page_size: page_size)
        describe_ssl_policies(input)
      end

      def describe_ssl_policies(input : Types::DescribeSSLPoliciesInput) : Types::DescribeSSLPoliciesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_SSL_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeSSLPoliciesOutput, "DescribeSSLPolicies")
      end

      # Describes the tags for the specified Elastic Load Balancing resources. You can describe the tags for
      # one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target
      # groups, listeners, or rules.

      def describe_tags(
        resource_arns : Array(String)
      ) : Types::DescribeTagsOutput

        input = Types::DescribeTagsInput.new(resource_arns: resource_arns)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsInput) : Types::DescribeTagsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTagsOutput, "DescribeTags")
      end

      # Describes the attributes for the specified target group. For more information, see the following:
      # Target group attributes in the Application Load Balancers Guide Target group attributes in the
      # Network Load Balancers Guide Target group attributes in the Gateway Load Balancers Guide

      def describe_target_group_attributes(
        target_group_arn : String
      ) : Types::DescribeTargetGroupAttributesOutput

        input = Types::DescribeTargetGroupAttributesInput.new(target_group_arn: target_group_arn)
        describe_target_group_attributes(input)
      end

      def describe_target_group_attributes(input : Types::DescribeTargetGroupAttributesInput) : Types::DescribeTargetGroupAttributesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TARGET_GROUP_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTargetGroupAttributesOutput, "DescribeTargetGroupAttributes")
      end

      # Describes the specified target groups or all of your target groups. By default, all target groups
      # are described. Alternatively, you can specify one of the following to filter the results: the ARN of
      # the load balancer, the names of one or more target groups, or the ARNs of one or more target groups.

      def describe_target_groups(
        load_balancer_arn : String? = nil,
        marker : String? = nil,
        names : Array(String)? = nil,
        page_size : Int32? = nil,
        target_group_arns : Array(String)? = nil
      ) : Types::DescribeTargetGroupsOutput

        input = Types::DescribeTargetGroupsInput.new(load_balancer_arn: load_balancer_arn, marker: marker, names: names, page_size: page_size, target_group_arns: target_group_arns)
        describe_target_groups(input)
      end

      def describe_target_groups(input : Types::DescribeTargetGroupsInput) : Types::DescribeTargetGroupsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TARGET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTargetGroupsOutput, "DescribeTargetGroups")
      end

      # Describes the health of the specified targets or all of your targets.

      def describe_target_health(
        target_group_arn : String,
        include : Array(String)? = nil,
        targets : Array(Types::TargetDescription)? = nil
      ) : Types::DescribeTargetHealthOutput

        input = Types::DescribeTargetHealthInput.new(target_group_arn: target_group_arn, include: include, targets: targets)
        describe_target_health(input)
      end

      def describe_target_health(input : Types::DescribeTargetHealthInput) : Types::DescribeTargetHealthOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TARGET_HEALTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTargetHealthOutput, "DescribeTargetHealth")
      end

      # Describes all resources associated with the specified trust store.

      def describe_trust_store_associations(
        trust_store_arn : String,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeTrustStoreAssociationsOutput

        input = Types::DescribeTrustStoreAssociationsInput.new(trust_store_arn: trust_store_arn, marker: marker, page_size: page_size)
        describe_trust_store_associations(input)
      end

      def describe_trust_store_associations(input : Types::DescribeTrustStoreAssociationsInput) : Types::DescribeTrustStoreAssociationsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TRUST_STORE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTrustStoreAssociationsOutput, "DescribeTrustStoreAssociations")
      end

      # Describes the revocation files in use by the specified trust store or revocation files.

      def describe_trust_store_revocations(
        trust_store_arn : String,
        marker : String? = nil,
        page_size : Int32? = nil,
        revocation_ids : Array(Int64)? = nil
      ) : Types::DescribeTrustStoreRevocationsOutput

        input = Types::DescribeTrustStoreRevocationsInput.new(trust_store_arn: trust_store_arn, marker: marker, page_size: page_size, revocation_ids: revocation_ids)
        describe_trust_store_revocations(input)
      end

      def describe_trust_store_revocations(input : Types::DescribeTrustStoreRevocationsInput) : Types::DescribeTrustStoreRevocationsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TRUST_STORE_REVOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTrustStoreRevocationsOutput, "DescribeTrustStoreRevocations")
      end

      # Describes all trust stores for the specified account.

      def describe_trust_stores(
        marker : String? = nil,
        names : Array(String)? = nil,
        page_size : Int32? = nil,
        trust_store_arns : Array(String)? = nil
      ) : Types::DescribeTrustStoresOutput

        input = Types::DescribeTrustStoresInput.new(marker: marker, names: names, page_size: page_size, trust_store_arns: trust_store_arns)
        describe_trust_stores(input)
      end

      def describe_trust_stores(input : Types::DescribeTrustStoresInput) : Types::DescribeTrustStoresOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TRUST_STORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTrustStoresOutput, "DescribeTrustStores")
      end

      # Retrieves the resource policy for a specified resource.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyOutput

        input = Types::GetResourcePolicyInput.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyInput) : Types::GetResourcePolicyOutput
        request = Protocol::Query.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetResourcePolicyOutput, "GetResourcePolicy")
      end

      # Retrieves the ca certificate bundle. This action returns a pre-signed S3 URI which is active for ten
      # minutes.

      def get_trust_store_ca_certificates_bundle(
        trust_store_arn : String
      ) : Types::GetTrustStoreCaCertificatesBundleOutput

        input = Types::GetTrustStoreCaCertificatesBundleInput.new(trust_store_arn: trust_store_arn)
        get_trust_store_ca_certificates_bundle(input)
      end

      def get_trust_store_ca_certificates_bundle(input : Types::GetTrustStoreCaCertificatesBundleInput) : Types::GetTrustStoreCaCertificatesBundleOutput
        request = Protocol::Query.build_request(Model::GET_TRUST_STORE_CA_CERTIFICATES_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTrustStoreCaCertificatesBundleOutput, "GetTrustStoreCaCertificatesBundle")
      end

      # Retrieves the specified revocation file. This action returns a pre-signed S3 URI which is active for
      # ten minutes.

      def get_trust_store_revocation_content(
        revocation_id : Int64,
        trust_store_arn : String
      ) : Types::GetTrustStoreRevocationContentOutput

        input = Types::GetTrustStoreRevocationContentInput.new(revocation_id: revocation_id, trust_store_arn: trust_store_arn)
        get_trust_store_revocation_content(input)
      end

      def get_trust_store_revocation_content(input : Types::GetTrustStoreRevocationContentInput) : Types::GetTrustStoreRevocationContentOutput
        request = Protocol::Query.build_request(Model::GET_TRUST_STORE_REVOCATION_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTrustStoreRevocationContentOutput, "GetTrustStoreRevocationContent")
      end

      # Modifies the capacity reservation of the specified load balancer. When modifying capacity
      # reservation, you must include at least one MinimumLoadBalancerCapacity or ResetCapacityReservation .

      def modify_capacity_reservation(
        load_balancer_arn : String,
        minimum_load_balancer_capacity : Types::MinimumLoadBalancerCapacity? = nil,
        reset_capacity_reservation : Bool? = nil
      ) : Types::ModifyCapacityReservationOutput

        input = Types::ModifyCapacityReservationInput.new(load_balancer_arn: load_balancer_arn, minimum_load_balancer_capacity: minimum_load_balancer_capacity, reset_capacity_reservation: reset_capacity_reservation)
        modify_capacity_reservation(input)
      end

      def modify_capacity_reservation(input : Types::ModifyCapacityReservationInput) : Types::ModifyCapacityReservationOutput
        request = Protocol::Query.build_request(Model::MODIFY_CAPACITY_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyCapacityReservationOutput, "ModifyCapacityReservation")
      end

      # [Application Load Balancers] Modify the IP pool associated to a load balancer.

      def modify_ip_pools(
        load_balancer_arn : String,
        ipam_pools : Types::IpamPools? = nil,
        remove_ipam_pools : Array(String)? = nil
      ) : Types::ModifyIpPoolsOutput

        input = Types::ModifyIpPoolsInput.new(load_balancer_arn: load_balancer_arn, ipam_pools: ipam_pools, remove_ipam_pools: remove_ipam_pools)
        modify_ip_pools(input)
      end

      def modify_ip_pools(input : Types::ModifyIpPoolsInput) : Types::ModifyIpPoolsOutput
        request = Protocol::Query.build_request(Model::MODIFY_IP_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyIpPoolsOutput, "ModifyIpPools")
      end

      # Replaces the specified properties of the specified listener. Any properties that you do not specify
      # remain unchanged. Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security
      # policy and default certificate properties. If you change the protocol from HTTP to HTTPS, or from
      # TCP to TLS, you must add the security policy and default certificate properties. To add an item to a
      # list, remove an item from a list, or update an item in a list, you must provide the entire list. For
      # example, to add an action, specify a list with the current actions plus the new action.

      def modify_listener(
        listener_arn : String,
        alpn_policy : Array(String)? = nil,
        certificates : Array(Types::Certificate)? = nil,
        default_actions : Array(Types::Action)? = nil,
        mutual_authentication : Types::MutualAuthenticationAttributes? = nil,
        port : Int32? = nil,
        protocol : String? = nil,
        ssl_policy : String? = nil
      ) : Types::ModifyListenerOutput

        input = Types::ModifyListenerInput.new(listener_arn: listener_arn, alpn_policy: alpn_policy, certificates: certificates, default_actions: default_actions, mutual_authentication: mutual_authentication, port: port, protocol: protocol, ssl_policy: ssl_policy)
        modify_listener(input)
      end

      def modify_listener(input : Types::ModifyListenerInput) : Types::ModifyListenerOutput
        request = Protocol::Query.build_request(Model::MODIFY_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyListenerOutput, "ModifyListener")
      end

      # Modifies the specified attributes of the specified listener.

      def modify_listener_attributes(
        attributes : Array(Types::ListenerAttribute),
        listener_arn : String
      ) : Types::ModifyListenerAttributesOutput

        input = Types::ModifyListenerAttributesInput.new(attributes: attributes, listener_arn: listener_arn)
        modify_listener_attributes(input)
      end

      def modify_listener_attributes(input : Types::ModifyListenerAttributesInput) : Types::ModifyListenerAttributesOutput
        request = Protocol::Query.build_request(Model::MODIFY_LISTENER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyListenerAttributesOutput, "ModifyListenerAttributes")
      end

      # Modifies the specified attributes of the specified Application Load Balancer, Network Load Balancer,
      # or Gateway Load Balancer. If any of the specified attributes can't be modified as requested, the
      # call fails. Any existing attributes that you do not modify retain their current values.

      def modify_load_balancer_attributes(
        attributes : Array(Types::LoadBalancerAttribute),
        load_balancer_arn : String
      ) : Types::ModifyLoadBalancerAttributesOutput

        input = Types::ModifyLoadBalancerAttributesInput.new(attributes: attributes, load_balancer_arn: load_balancer_arn)
        modify_load_balancer_attributes(input)
      end

      def modify_load_balancer_attributes(input : Types::ModifyLoadBalancerAttributesInput) : Types::ModifyLoadBalancerAttributesOutput
        request = Protocol::Query.build_request(Model::MODIFY_LOAD_BALANCER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyLoadBalancerAttributesOutput, "ModifyLoadBalancerAttributes")
      end

      # Replaces the specified properties of the specified rule. Any properties that you do not specify are
      # unchanged. To add an item to a list, remove an item from a list, or update an item in a list, you
      # must provide the entire list. For example, to add an action, specify a list with the current actions
      # plus the new action.

      def modify_rule(
        rule_arn : String,
        actions : Array(Types::Action)? = nil,
        conditions : Array(Types::RuleCondition)? = nil,
        reset_transforms : Bool? = nil,
        transforms : Array(Types::RuleTransform)? = nil
      ) : Types::ModifyRuleOutput

        input = Types::ModifyRuleInput.new(rule_arn: rule_arn, actions: actions, conditions: conditions, reset_transforms: reset_transforms, transforms: transforms)
        modify_rule(input)
      end

      def modify_rule(input : Types::ModifyRuleInput) : Types::ModifyRuleOutput
        request = Protocol::Query.build_request(Model::MODIFY_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyRuleOutput, "ModifyRule")
      end

      # Modifies the health checks used when evaluating the health state of the targets in the specified
      # target group.

      def modify_target_group(
        target_group_arn : String,
        health_check_enabled : Bool? = nil,
        health_check_interval_seconds : Int32? = nil,
        health_check_path : String? = nil,
        health_check_port : String? = nil,
        health_check_protocol : String? = nil,
        health_check_timeout_seconds : Int32? = nil,
        healthy_threshold_count : Int32? = nil,
        matcher : Types::Matcher? = nil,
        unhealthy_threshold_count : Int32? = nil
      ) : Types::ModifyTargetGroupOutput

        input = Types::ModifyTargetGroupInput.new(target_group_arn: target_group_arn, health_check_enabled: health_check_enabled, health_check_interval_seconds: health_check_interval_seconds, health_check_path: health_check_path, health_check_port: health_check_port, health_check_protocol: health_check_protocol, health_check_timeout_seconds: health_check_timeout_seconds, healthy_threshold_count: healthy_threshold_count, matcher: matcher, unhealthy_threshold_count: unhealthy_threshold_count)
        modify_target_group(input)
      end

      def modify_target_group(input : Types::ModifyTargetGroupInput) : Types::ModifyTargetGroupOutput
        request = Protocol::Query.build_request(Model::MODIFY_TARGET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyTargetGroupOutput, "ModifyTargetGroup")
      end

      # Modifies the specified attributes of the specified target group.

      def modify_target_group_attributes(
        attributes : Array(Types::TargetGroupAttribute),
        target_group_arn : String
      ) : Types::ModifyTargetGroupAttributesOutput

        input = Types::ModifyTargetGroupAttributesInput.new(attributes: attributes, target_group_arn: target_group_arn)
        modify_target_group_attributes(input)
      end

      def modify_target_group_attributes(input : Types::ModifyTargetGroupAttributesInput) : Types::ModifyTargetGroupAttributesOutput
        request = Protocol::Query.build_request(Model::MODIFY_TARGET_GROUP_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyTargetGroupAttributesOutput, "ModifyTargetGroupAttributes")
      end

      # Update the ca certificate bundle for the specified trust store.

      def modify_trust_store(
        ca_certificates_bundle_s3_bucket : String,
        ca_certificates_bundle_s3_key : String,
        trust_store_arn : String,
        ca_certificates_bundle_s3_object_version : String? = nil
      ) : Types::ModifyTrustStoreOutput

        input = Types::ModifyTrustStoreInput.new(ca_certificates_bundle_s3_bucket: ca_certificates_bundle_s3_bucket, ca_certificates_bundle_s3_key: ca_certificates_bundle_s3_key, trust_store_arn: trust_store_arn, ca_certificates_bundle_s3_object_version: ca_certificates_bundle_s3_object_version)
        modify_trust_store(input)
      end

      def modify_trust_store(input : Types::ModifyTrustStoreInput) : Types::ModifyTrustStoreOutput
        request = Protocol::Query.build_request(Model::MODIFY_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyTrustStoreOutput, "ModifyTrustStore")
      end

      # Registers the specified targets with the specified target group. If the target is an EC2 instance,
      # it must be in the running state when you register it. By default, the load balancer routes requests
      # to registered targets using the protocol and port for the target group. Alternatively, you can
      # override the port for a target when you register it. You can register each EC2 instance or IP
      # address with the same target group multiple times using different ports. For more information, see
      # the following: Register targets for your Application Load Balancer Register targets for your Network
      # Load Balancer Register targets for your Gateway Load Balancer

      def register_targets(
        target_group_arn : String,
        targets : Array(Types::TargetDescription)
      ) : Types::RegisterTargetsOutput

        input = Types::RegisterTargetsInput.new(target_group_arn: target_group_arn, targets: targets)
        register_targets(input)
      end

      def register_targets(input : Types::RegisterTargetsInput) : Types::RegisterTargetsOutput
        request = Protocol::Query.build_request(Model::REGISTER_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterTargetsOutput, "RegisterTargets")
      end

      # Removes the specified certificate from the certificate list for the specified HTTPS or TLS listener.

      def remove_listener_certificates(
        certificates : Array(Types::Certificate),
        listener_arn : String
      ) : Types::RemoveListenerCertificatesOutput

        input = Types::RemoveListenerCertificatesInput.new(certificates: certificates, listener_arn: listener_arn)
        remove_listener_certificates(input)
      end

      def remove_listener_certificates(input : Types::RemoveListenerCertificatesInput) : Types::RemoveListenerCertificatesOutput
        request = Protocol::Query.build_request(Model::REMOVE_LISTENER_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveListenerCertificatesOutput, "RemoveListenerCertificates")
      end

      # Removes the specified tags from the specified Elastic Load Balancing resources. You can remove the
      # tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load Balancers,
      # target groups, listeners, or rules.

      def remove_tags(
        resource_arns : Array(String),
        tag_keys : Array(String)
      ) : Types::RemoveTagsOutput

        input = Types::RemoveTagsInput.new(resource_arns: resource_arns, tag_keys: tag_keys)
        remove_tags(input)
      end

      def remove_tags(input : Types::RemoveTagsInput) : Types::RemoveTagsOutput
        request = Protocol::Query.build_request(Model::REMOVE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveTagsOutput, "RemoveTags")
      end

      # Removes the specified revocation file from the specified trust store.

      def remove_trust_store_revocations(
        revocation_ids : Array(Int64),
        trust_store_arn : String
      ) : Types::RemoveTrustStoreRevocationsOutput

        input = Types::RemoveTrustStoreRevocationsInput.new(revocation_ids: revocation_ids, trust_store_arn: trust_store_arn)
        remove_trust_store_revocations(input)
      end

      def remove_trust_store_revocations(input : Types::RemoveTrustStoreRevocationsInput) : Types::RemoveTrustStoreRevocationsOutput
        request = Protocol::Query.build_request(Model::REMOVE_TRUST_STORE_REVOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveTrustStoreRevocationsOutput, "RemoveTrustStoreRevocations")
      end

      # Sets the type of IP addresses used by the subnets of the specified load balancer.

      def set_ip_address_type(
        ip_address_type : String,
        load_balancer_arn : String
      ) : Types::SetIpAddressTypeOutput

        input = Types::SetIpAddressTypeInput.new(ip_address_type: ip_address_type, load_balancer_arn: load_balancer_arn)
        set_ip_address_type(input)
      end

      def set_ip_address_type(input : Types::SetIpAddressTypeInput) : Types::SetIpAddressTypeOutput
        request = Protocol::Query.build_request(Model::SET_IP_ADDRESS_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIpAddressTypeOutput, "SetIpAddressType")
      end

      # Sets the priorities of the specified rules. You can reorder the rules as long as there are no
      # priority conflicts in the new order. Any existing rules that you do not specify retain their current
      # priority.

      def set_rule_priorities(
        rule_priorities : Array(Types::RulePriorityPair)
      ) : Types::SetRulePrioritiesOutput

        input = Types::SetRulePrioritiesInput.new(rule_priorities: rule_priorities)
        set_rule_priorities(input)
      end

      def set_rule_priorities(input : Types::SetRulePrioritiesInput) : Types::SetRulePrioritiesOutput
        request = Protocol::Query.build_request(Model::SET_RULE_PRIORITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetRulePrioritiesOutput, "SetRulePriorities")
      end

      # Associates the specified security groups with the specified Application Load Balancer or Network
      # Load Balancer. The specified security groups override the previously associated security groups. You
      # can't perform this operation on a Network Load Balancer unless you specified a security group for
      # the load balancer when you created it. You can't associate a security group with a Gateway Load
      # Balancer.

      def set_security_groups(
        load_balancer_arn : String,
        security_groups : Array(String),
        enforce_security_group_inbound_rules_on_private_link_traffic : String? = nil
      ) : Types::SetSecurityGroupsOutput

        input = Types::SetSecurityGroupsInput.new(load_balancer_arn: load_balancer_arn, security_groups: security_groups, enforce_security_group_inbound_rules_on_private_link_traffic: enforce_security_group_inbound_rules_on_private_link_traffic)
        set_security_groups(input)
      end

      def set_security_groups(input : Types::SetSecurityGroupsInput) : Types::SetSecurityGroupsOutput
        request = Protocol::Query.build_request(Model::SET_SECURITY_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetSecurityGroupsOutput, "SetSecurityGroups")
      end

      # Enables the Availability Zones for the specified public subnets for the specified Application Load
      # Balancer, Network Load Balancer or Gateway Load Balancer. The specified subnets replace the
      # previously enabled subnets.

      def set_subnets(
        load_balancer_arn : String,
        enable_prefix_for_ipv6_source_nat : String? = nil,
        ip_address_type : String? = nil,
        subnet_mappings : Array(Types::SubnetMapping)? = nil,
        subnets : Array(String)? = nil
      ) : Types::SetSubnetsOutput

        input = Types::SetSubnetsInput.new(load_balancer_arn: load_balancer_arn, enable_prefix_for_ipv6_source_nat: enable_prefix_for_ipv6_source_nat, ip_address_type: ip_address_type, subnet_mappings: subnet_mappings, subnets: subnets)
        set_subnets(input)
      end

      def set_subnets(input : Types::SetSubnetsInput) : Types::SetSubnetsOutput
        request = Protocol::Query.build_request(Model::SET_SUBNETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetSubnetsOutput, "SetSubnets")
      end
    end
  end
end
