module AwsSdk
  module ElasticLoadBalancing
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

      # Adds the specified tags to the specified load balancer. Each load balancer can have a maximum of 10
      # tags. Each tag consists of a key and an optional value. If a tag with the same key is already
      # associated with the load balancer, AddTags updates its value. For more information, see Tag Your
      # Classic Load Balancer in the Classic Load Balancers Guide .

      def add_tags(
        load_balancer_names : Array(String),
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput

        input = Types::AddTagsInput.new(load_balancer_names: load_balancer_names, tags: tags)
        add_tags(input)
      end

      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::Query.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Associates one or more security groups with your load balancer in a virtual private cloud (VPC). The
      # specified security groups override the previously associated security groups. For more information,
      # see Security Groups for Load Balancers in a VPC in the Classic Load Balancers Guide .

      def apply_security_groups_to_load_balancer(
        load_balancer_name : String,
        security_groups : Array(String)
      ) : Types::ApplySecurityGroupsToLoadBalancerOutput

        input = Types::ApplySecurityGroupsToLoadBalancerInput.new(load_balancer_name: load_balancer_name, security_groups: security_groups)
        apply_security_groups_to_load_balancer(input)
      end

      def apply_security_groups_to_load_balancer(input : Types::ApplySecurityGroupsToLoadBalancerInput) : Types::ApplySecurityGroupsToLoadBalancerOutput
        request = Protocol::Query.build_request(Model::APPLY_SECURITY_GROUPS_TO_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplySecurityGroupsToLoadBalancerOutput, "ApplySecurityGroupsToLoadBalancer")
      end

      # Adds one or more subnets to the set of configured subnets for the specified load balancer. The load
      # balancer evenly distributes requests across all registered subnets. For more information, see Add or
      # Remove Subnets for Your Load Balancer in a VPC in the Classic Load Balancers Guide .

      def attach_load_balancer_to_subnets(
        load_balancer_name : String,
        subnets : Array(String)
      ) : Types::AttachLoadBalancerToSubnetsOutput

        input = Types::AttachLoadBalancerToSubnetsInput.new(load_balancer_name: load_balancer_name, subnets: subnets)
        attach_load_balancer_to_subnets(input)
      end

      def attach_load_balancer_to_subnets(input : Types::AttachLoadBalancerToSubnetsInput) : Types::AttachLoadBalancerToSubnetsOutput
        request = Protocol::Query.build_request(Model::ATTACH_LOAD_BALANCER_TO_SUBNETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AttachLoadBalancerToSubnetsOutput, "AttachLoadBalancerToSubnets")
      end

      # Specifies the health check settings to use when evaluating the health state of your EC2 instances.
      # For more information, see Configure Health Checks for Your Load Balancer in the Classic Load
      # Balancers Guide .

      def configure_health_check(
        health_check : Types::HealthCheck,
        load_balancer_name : String
      ) : Types::ConfigureHealthCheckOutput

        input = Types::ConfigureHealthCheckInput.new(health_check: health_check, load_balancer_name: load_balancer_name)
        configure_health_check(input)
      end

      def configure_health_check(input : Types::ConfigureHealthCheckInput) : Types::ConfigureHealthCheckOutput
        request = Protocol::Query.build_request(Model::CONFIGURE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfigureHealthCheckOutput, "ConfigureHealthCheck")
      end

      # Generates a stickiness policy with sticky session lifetimes that follow that of an
      # application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners. This
      # policy is similar to the policy created by CreateLBCookieStickinessPolicy , except that the lifetime
      # of the special Elastic Load Balancing cookie, AWSELB , follows the lifetime of the
      # application-generated cookie specified in the policy configuration. The load balancer only inserts a
      # new stickiness cookie when the application response includes a new application cookie. If the
      # application cookie is explicitly removed or expires, the session stops being sticky until a new
      # application cookie is issued. For more information, see Application-Controlled Session Stickiness in
      # the Classic Load Balancers Guide .

      def create_app_cookie_stickiness_policy(
        cookie_name : String,
        load_balancer_name : String,
        policy_name : String
      ) : Types::CreateAppCookieStickinessPolicyOutput

        input = Types::CreateAppCookieStickinessPolicyInput.new(cookie_name: cookie_name, load_balancer_name: load_balancer_name, policy_name: policy_name)
        create_app_cookie_stickiness_policy(input)
      end

      def create_app_cookie_stickiness_policy(input : Types::CreateAppCookieStickinessPolicyInput) : Types::CreateAppCookieStickinessPolicyOutput
        request = Protocol::Query.build_request(Model::CREATE_APP_COOKIE_STICKINESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateAppCookieStickinessPolicyOutput, "CreateAppCookieStickinessPolicy")
      end

      # Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the
      # browser (user-agent) or a specified expiration period. This policy can be associated only with
      # HTTP/HTTPS listeners. When a load balancer implements this policy, the load balancer uses a special
      # cookie to track the instance for each request. When the load balancer receives a request, it first
      # checks to see if this cookie is present in the request. If so, the load balancer sends the request
      # to the application server specified in the cookie. If not, the load balancer sends the request to a
      # server that is chosen based on the existing load-balancing algorithm. A cookie is inserted into the
      # response for binding subsequent requests from the same user to that server. The validity of the
      # cookie is based on the cookie expiration time, which is specified in the policy configuration. For
      # more information, see Duration-Based Session Stickiness in the Classic Load Balancers Guide .

      def create_lb_cookie_stickiness_policy(
        load_balancer_name : String,
        policy_name : String,
        cookie_expiration_period : Int64? = nil
      ) : Types::CreateLBCookieStickinessPolicyOutput

        input = Types::CreateLBCookieStickinessPolicyInput.new(load_balancer_name: load_balancer_name, policy_name: policy_name, cookie_expiration_period: cookie_expiration_period)
        create_lb_cookie_stickiness_policy(input)
      end

      def create_lb_cookie_stickiness_policy(input : Types::CreateLBCookieStickinessPolicyInput) : Types::CreateLBCookieStickinessPolicyOutput
        request = Protocol::Query.build_request(Model::CREATE_LB_COOKIE_STICKINESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateLBCookieStickinessPolicyOutput, "CreateLBCookieStickinessPolicy")
      end

      # Creates a Classic Load Balancer. You can add listeners, security groups, subnets, and tags when you
      # create your load balancer, or you can add them later using CreateLoadBalancerListeners ,
      # ApplySecurityGroupsToLoadBalancer , AttachLoadBalancerToSubnets , and AddTags . To describe your
      # current load balancers, see DescribeLoadBalancers . When you are finished with a load balancer, you
      # can delete it using DeleteLoadBalancer . You can create up to 20 load balancers per region per
      # account. You can request an increase for the number of load balancers for your account. For more
      # information, see Limits for Your Classic Load Balancer in the Classic Load Balancers Guide .

      def create_load_balancer(
        listeners : Array(Types::Listener),
        load_balancer_name : String,
        availability_zones : Array(String)? = nil,
        scheme : String? = nil,
        security_groups : Array(String)? = nil,
        subnets : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAccessPointOutput

        input = Types::CreateAccessPointInput.new(listeners: listeners, load_balancer_name: load_balancer_name, availability_zones: availability_zones, scheme: scheme, security_groups: security_groups, subnets: subnets, tags: tags)
        create_load_balancer(input)
      end

      def create_load_balancer(input : Types::CreateAccessPointInput) : Types::CreateAccessPointOutput
        request = Protocol::Query.build_request(Model::CREATE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateAccessPointOutput, "CreateLoadBalancer")
      end

      # Creates one or more listeners for the specified load balancer. If a listener with the specified port
      # does not already exist, it is created; otherwise, the properties of the new listener must match the
      # properties of the existing listener. For more information, see Listeners for Your Classic Load
      # Balancer in the Classic Load Balancers Guide .

      def create_load_balancer_listeners(
        listeners : Array(Types::Listener),
        load_balancer_name : String
      ) : Types::CreateLoadBalancerListenerOutput

        input = Types::CreateLoadBalancerListenerInput.new(listeners: listeners, load_balancer_name: load_balancer_name)
        create_load_balancer_listeners(input)
      end

      def create_load_balancer_listeners(input : Types::CreateLoadBalancerListenerInput) : Types::CreateLoadBalancerListenerOutput
        request = Protocol::Query.build_request(Model::CREATE_LOAD_BALANCER_LISTENERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateLoadBalancerListenerOutput, "CreateLoadBalancerListeners")
      end

      # Creates a policy with the specified attributes for the specified load balancer. Policies are
      # settings that are saved for your load balancer and that can be applied to the listener or the
      # application server, depending on the policy type.

      def create_load_balancer_policy(
        load_balancer_name : String,
        policy_name : String,
        policy_type_name : String,
        policy_attributes : Array(Types::PolicyAttribute)? = nil
      ) : Types::CreateLoadBalancerPolicyOutput

        input = Types::CreateLoadBalancerPolicyInput.new(load_balancer_name: load_balancer_name, policy_name: policy_name, policy_type_name: policy_type_name, policy_attributes: policy_attributes)
        create_load_balancer_policy(input)
      end

      def create_load_balancer_policy(input : Types::CreateLoadBalancerPolicyInput) : Types::CreateLoadBalancerPolicyOutput
        request = Protocol::Query.build_request(Model::CREATE_LOAD_BALANCER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateLoadBalancerPolicyOutput, "CreateLoadBalancerPolicy")
      end

      # Deletes the specified load balancer. If you are attempting to recreate a load balancer, you must
      # reconfigure all settings. The DNS name associated with a deleted load balancer are no longer usable.
      # The name and associated DNS record of the deleted load balancer no longer exist and traffic sent to
      # any of its IP addresses is no longer delivered to your instances. If the load balancer does not
      # exist or has already been deleted, the call to DeleteLoadBalancer still succeeds.

      def delete_load_balancer(
        load_balancer_name : String
      ) : Types::DeleteAccessPointOutput

        input = Types::DeleteAccessPointInput.new(load_balancer_name: load_balancer_name)
        delete_load_balancer(input)
      end

      def delete_load_balancer(input : Types::DeleteAccessPointInput) : Types::DeleteAccessPointOutput
        request = Protocol::Query.build_request(Model::DELETE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteAccessPointOutput, "DeleteLoadBalancer")
      end

      # Deletes the specified listeners from the specified load balancer.

      def delete_load_balancer_listeners(
        load_balancer_name : String,
        load_balancer_ports : Array(Int32)
      ) : Types::DeleteLoadBalancerListenerOutput

        input = Types::DeleteLoadBalancerListenerInput.new(load_balancer_name: load_balancer_name, load_balancer_ports: load_balancer_ports)
        delete_load_balancer_listeners(input)
      end

      def delete_load_balancer_listeners(input : Types::DeleteLoadBalancerListenerInput) : Types::DeleteLoadBalancerListenerOutput
        request = Protocol::Query.build_request(Model::DELETE_LOAD_BALANCER_LISTENERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteLoadBalancerListenerOutput, "DeleteLoadBalancerListeners")
      end

      # Deletes the specified policy from the specified load balancer. This policy must not be enabled for
      # any listeners.

      def delete_load_balancer_policy(
        load_balancer_name : String,
        policy_name : String
      ) : Types::DeleteLoadBalancerPolicyOutput

        input = Types::DeleteLoadBalancerPolicyInput.new(load_balancer_name: load_balancer_name, policy_name: policy_name)
        delete_load_balancer_policy(input)
      end

      def delete_load_balancer_policy(input : Types::DeleteLoadBalancerPolicyInput) : Types::DeleteLoadBalancerPolicyOutput
        request = Protocol::Query.build_request(Model::DELETE_LOAD_BALANCER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteLoadBalancerPolicyOutput, "DeleteLoadBalancerPolicy")
      end

      # Deregisters the specified instances from the specified load balancer. After the instance is
      # deregistered, it no longer receives traffic from the load balancer. You can use
      # DescribeLoadBalancers to verify that the instance is deregistered from the load balancer. For more
      # information, see Register or De-Register EC2 Instances in the Classic Load Balancers Guide .

      def deregister_instances_from_load_balancer(
        instances : Array(Types::Instance),
        load_balancer_name : String
      ) : Types::DeregisterEndPointsOutput

        input = Types::DeregisterEndPointsInput.new(instances: instances, load_balancer_name: load_balancer_name)
        deregister_instances_from_load_balancer(input)
      end

      def deregister_instances_from_load_balancer(input : Types::DeregisterEndPointsInput) : Types::DeregisterEndPointsOutput
        request = Protocol::Query.build_request(Model::DEREGISTER_INSTANCES_FROM_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeregisterEndPointsOutput, "DeregisterInstancesFromLoadBalancer")
      end

      # Describes the current Elastic Load Balancing resource limits for your AWS account. For more
      # information, see Limits for Your Classic Load Balancer in the Classic Load Balancers Guide .

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

      # Describes the state of the specified instances with respect to the specified load balancer. If no
      # instances are specified, the call describes the state of all instances that are currently registered
      # with the load balancer. If instances are specified, their state is returned even if they are no
      # longer registered with the load balancer. The state of terminated instances is not returned.

      def describe_instance_health(
        load_balancer_name : String,
        instances : Array(Types::Instance)? = nil
      ) : Types::DescribeEndPointStateOutput

        input = Types::DescribeEndPointStateInput.new(load_balancer_name: load_balancer_name, instances: instances)
        describe_instance_health(input)
      end

      def describe_instance_health(input : Types::DescribeEndPointStateInput) : Types::DescribeEndPointStateOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_INSTANCE_HEALTH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEndPointStateOutput, "DescribeInstanceHealth")
      end

      # Describes the attributes for the specified load balancer.

      def describe_load_balancer_attributes(
        load_balancer_name : String
      ) : Types::DescribeLoadBalancerAttributesOutput

        input = Types::DescribeLoadBalancerAttributesInput.new(load_balancer_name: load_balancer_name)
        describe_load_balancer_attributes(input)
      end

      def describe_load_balancer_attributes(input : Types::DescribeLoadBalancerAttributesInput) : Types::DescribeLoadBalancerAttributesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancerAttributesOutput, "DescribeLoadBalancerAttributes")
      end

      # Describes the specified policies. If you specify a load balancer name, the action returns the
      # descriptions of all policies created for the load balancer. If you specify a policy name associated
      # with your load balancer, the action returns the description of that policy. If you don't specify a
      # load balancer name, the action returns descriptions of the specified sample policies, or
      # descriptions of all sample policies. The names of the sample policies have the ELBSample- prefix.

      def describe_load_balancer_policies(
        load_balancer_name : String? = nil,
        policy_names : Array(String)? = nil
      ) : Types::DescribeLoadBalancerPoliciesOutput

        input = Types::DescribeLoadBalancerPoliciesInput.new(load_balancer_name: load_balancer_name, policy_names: policy_names)
        describe_load_balancer_policies(input)
      end

      def describe_load_balancer_policies(input : Types::DescribeLoadBalancerPoliciesInput) : Types::DescribeLoadBalancerPoliciesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCER_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancerPoliciesOutput, "DescribeLoadBalancerPolicies")
      end

      # Describes the specified load balancer policy types or all load balancer policy types. The
      # description of each type indicates how it can be used. For example, some policies can be used only
      # with layer 7 listeners, some policies can be used only with layer 4 listeners, and some policies can
      # be used only with your EC2 instances. You can use CreateLoadBalancerPolicy to create a policy
      # configuration for any of these policy types. Then, depending on the policy type, use either
      # SetLoadBalancerPoliciesOfListener or SetLoadBalancerPoliciesForBackendServer to set the policy.

      def describe_load_balancer_policy_types(
        policy_type_names : Array(String)? = nil
      ) : Types::DescribeLoadBalancerPolicyTypesOutput

        input = Types::DescribeLoadBalancerPolicyTypesInput.new(policy_type_names: policy_type_names)
        describe_load_balancer_policy_types(input)
      end

      def describe_load_balancer_policy_types(input : Types::DescribeLoadBalancerPolicyTypesInput) : Types::DescribeLoadBalancerPolicyTypesOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCER_POLICY_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeLoadBalancerPolicyTypesOutput, "DescribeLoadBalancerPolicyTypes")
      end

      # Describes the specified the load balancers. If no load balancers are specified, the call describes
      # all of your load balancers.

      def describe_load_balancers(
        load_balancer_names : Array(String)? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Types::DescribeAccessPointsOutput

        input = Types::DescribeAccessPointsInput.new(load_balancer_names: load_balancer_names, marker: marker, page_size: page_size)
        describe_load_balancers(input)
      end

      def describe_load_balancers(input : Types::DescribeAccessPointsInput) : Types::DescribeAccessPointsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAccessPointsOutput, "DescribeLoadBalancers")
      end

      # Describes the tags associated with the specified load balancers.

      def describe_tags(
        load_balancer_names : Array(String)
      ) : Types::DescribeTagsOutput

        input = Types::DescribeTagsInput.new(load_balancer_names: load_balancer_names)
        describe_tags(input)
      end

      def describe_tags(input : Types::DescribeTagsInput) : Types::DescribeTagsOutput
        request = Protocol::Query.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeTagsOutput, "DescribeTags")
      end

      # Removes the specified subnets from the set of configured subnets for the load balancer. After a
      # subnet is removed, all EC2 instances registered with the load balancer in the removed subnet go into
      # the OutOfService state. Then, the load balancer balances the traffic among the remaining routable
      # subnets.

      def detach_load_balancer_from_subnets(
        load_balancer_name : String,
        subnets : Array(String)
      ) : Types::DetachLoadBalancerFromSubnetsOutput

        input = Types::DetachLoadBalancerFromSubnetsInput.new(load_balancer_name: load_balancer_name, subnets: subnets)
        detach_load_balancer_from_subnets(input)
      end

      def detach_load_balancer_from_subnets(input : Types::DetachLoadBalancerFromSubnetsInput) : Types::DetachLoadBalancerFromSubnetsOutput
        request = Protocol::Query.build_request(Model::DETACH_LOAD_BALANCER_FROM_SUBNETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DetachLoadBalancerFromSubnetsOutput, "DetachLoadBalancerFromSubnets")
      end

      # Removes the specified Availability Zones from the set of Availability Zones for the specified load
      # balancer in EC2-Classic or a default VPC. For load balancers in a non-default VPC, use
      # DetachLoadBalancerFromSubnets . There must be at least one Availability Zone registered with a load
      # balancer at all times. After an Availability Zone is removed, all instances registered with the load
      # balancer that are in the removed Availability Zone go into the OutOfService state. Then, the load
      # balancer attempts to equally balance the traffic among its remaining Availability Zones. For more
      # information, see Add or Remove Availability Zones in the Classic Load Balancers Guide .

      def disable_availability_zones_for_load_balancer(
        availability_zones : Array(String),
        load_balancer_name : String
      ) : Types::RemoveAvailabilityZonesOutput

        input = Types::RemoveAvailabilityZonesInput.new(availability_zones: availability_zones, load_balancer_name: load_balancer_name)
        disable_availability_zones_for_load_balancer(input)
      end

      def disable_availability_zones_for_load_balancer(input : Types::RemoveAvailabilityZonesInput) : Types::RemoveAvailabilityZonesOutput
        request = Protocol::Query.build_request(Model::DISABLE_AVAILABILITY_ZONES_FOR_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveAvailabilityZonesOutput, "DisableAvailabilityZonesForLoadBalancer")
      end

      # Adds the specified Availability Zones to the set of Availability Zones for the specified load
      # balancer in EC2-Classic or a default VPC. For load balancers in a non-default VPC, use
      # AttachLoadBalancerToSubnets . The load balancer evenly distributes requests across all its
      # registered Availability Zones that contain instances. For more information, see Add or Remove
      # Availability Zones in the Classic Load Balancers Guide .

      def enable_availability_zones_for_load_balancer(
        availability_zones : Array(String),
        load_balancer_name : String
      ) : Types::AddAvailabilityZonesOutput

        input = Types::AddAvailabilityZonesInput.new(availability_zones: availability_zones, load_balancer_name: load_balancer_name)
        enable_availability_zones_for_load_balancer(input)
      end

      def enable_availability_zones_for_load_balancer(input : Types::AddAvailabilityZonesInput) : Types::AddAvailabilityZonesOutput
        request = Protocol::Query.build_request(Model::ENABLE_AVAILABILITY_ZONES_FOR_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddAvailabilityZonesOutput, "EnableAvailabilityZonesForLoadBalancer")
      end

      # Modifies the attributes of the specified load balancer. You can modify the load balancer attributes,
      # such as AccessLogs , ConnectionDraining , and CrossZoneLoadBalancing by either enabling or disabling
      # them. Or, you can modify the load balancer attribute ConnectionSettings by specifying an idle
      # connection timeout value for your load balancer. For more information, see the following in the
      # Classic Load Balancers Guide : Cross-Zone Load Balancing Connection Draining Access Logs Idle
      # Connection Timeout

      def modify_load_balancer_attributes(
        load_balancer_attributes : Types::LoadBalancerAttributes,
        load_balancer_name : String
      ) : Types::ModifyLoadBalancerAttributesOutput

        input = Types::ModifyLoadBalancerAttributesInput.new(load_balancer_attributes: load_balancer_attributes, load_balancer_name: load_balancer_name)
        modify_load_balancer_attributes(input)
      end

      def modify_load_balancer_attributes(input : Types::ModifyLoadBalancerAttributesInput) : Types::ModifyLoadBalancerAttributesOutput
        request = Protocol::Query.build_request(Model::MODIFY_LOAD_BALANCER_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyLoadBalancerAttributesOutput, "ModifyLoadBalancerAttributes")
      end

      # Adds the specified instances to the specified load balancer. The instance must be a running instance
      # in the same network as the load balancer (EC2-Classic or the same VPC). If you have EC2-Classic
      # instances and a load balancer in a VPC with ClassicLink enabled, you can link the EC2-Classic
      # instances to that VPC and then register the linked EC2-Classic instances with the load balancer in
      # the VPC. Note that RegisterInstanceWithLoadBalancer completes when the request has been registered.
      # Instance registration takes a little time to complete. To check the state of the registered
      # instances, use DescribeLoadBalancers or DescribeInstanceHealth . After the instance is registered,
      # it starts receiving traffic and requests from the load balancer. Any instance that is not in one of
      # the Availability Zones registered for the load balancer is moved to the OutOfService state. If an
      # Availability Zone is added to the load balancer later, any instances registered with the load
      # balancer move to the InService state. To deregister instances from a load balancer, use
      # DeregisterInstancesFromLoadBalancer . For more information, see Register or De-Register EC2
      # Instances in the Classic Load Balancers Guide .

      def register_instances_with_load_balancer(
        instances : Array(Types::Instance),
        load_balancer_name : String
      ) : Types::RegisterEndPointsOutput

        input = Types::RegisterEndPointsInput.new(instances: instances, load_balancer_name: load_balancer_name)
        register_instances_with_load_balancer(input)
      end

      def register_instances_with_load_balancer(input : Types::RegisterEndPointsInput) : Types::RegisterEndPointsOutput
        request = Protocol::Query.build_request(Model::REGISTER_INSTANCES_WITH_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterEndPointsOutput, "RegisterInstancesWithLoadBalancer")
      end

      # Removes one or more tags from the specified load balancer.

      def remove_tags(
        load_balancer_names : Array(String),
        tags : Array(Types::TagKeyOnly)
      ) : Types::RemoveTagsOutput

        input = Types::RemoveTagsInput.new(load_balancer_names: load_balancer_names, tags: tags)
        remove_tags(input)
      end

      def remove_tags(input : Types::RemoveTagsInput) : Types::RemoveTagsOutput
        request = Protocol::Query.build_request(Model::REMOVE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveTagsOutput, "RemoveTags")
      end

      # Sets the certificate that terminates the specified listener's SSL connections. The specified
      # certificate replaces any prior certificate that was used on the same load balancer and port. For
      # more information about updating your SSL certificate, see Replace the SSL Certificate for Your Load
      # Balancer in the Classic Load Balancers Guide .

      def set_load_balancer_listener_ssl_certificate(
        load_balancer_name : String,
        load_balancer_port : Int32,
        ssl_certificate_id : String
      ) : Types::SetLoadBalancerListenerSSLCertificateOutput

        input = Types::SetLoadBalancerListenerSSLCertificateInput.new(load_balancer_name: load_balancer_name, load_balancer_port: load_balancer_port, ssl_certificate_id: ssl_certificate_id)
        set_load_balancer_listener_ssl_certificate(input)
      end

      def set_load_balancer_listener_ssl_certificate(input : Types::SetLoadBalancerListenerSSLCertificateInput) : Types::SetLoadBalancerListenerSSLCertificateOutput
        request = Protocol::Query.build_request(Model::SET_LOAD_BALANCER_LISTENER_SSL_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetLoadBalancerListenerSSLCertificateOutput, "SetLoadBalancerListenerSSLCertificate")
      end

      # Replaces the set of policies associated with the specified port on which the EC2 instance is
      # listening with a new set of policies. At this time, only the back-end server authentication policy
      # type can be applied to the instance ports; this policy type is composed of multiple public key
      # policies. Each time you use SetLoadBalancerPoliciesForBackendServer to enable the policies, use the
      # PolicyNames parameter to list the policies that you want to enable. You can use
      # DescribeLoadBalancers or DescribeLoadBalancerPolicies to verify that the policy is associated with
      # the EC2 instance. For more information about enabling back-end instance authentication, see
      # Configure Back-end Instance Authentication in the Classic Load Balancers Guide . For more
      # information about Proxy Protocol, see Configure Proxy Protocol Support in the Classic Load Balancers
      # Guide .

      def set_load_balancer_policies_for_backend_server(
        instance_port : Int32,
        load_balancer_name : String,
        policy_names : Array(String)
      ) : Types::SetLoadBalancerPoliciesForBackendServerOutput

        input = Types::SetLoadBalancerPoliciesForBackendServerInput.new(instance_port: instance_port, load_balancer_name: load_balancer_name, policy_names: policy_names)
        set_load_balancer_policies_for_backend_server(input)
      end

      def set_load_balancer_policies_for_backend_server(input : Types::SetLoadBalancerPoliciesForBackendServerInput) : Types::SetLoadBalancerPoliciesForBackendServerOutput
        request = Protocol::Query.build_request(Model::SET_LOAD_BALANCER_POLICIES_FOR_BACKEND_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetLoadBalancerPoliciesForBackendServerOutput, "SetLoadBalancerPoliciesForBackendServer")
      end

      # Replaces the current set of policies for the specified load balancer port with the specified set of
      # policies. To enable back-end server authentication, use SetLoadBalancerPoliciesForBackendServer .
      # For more information about setting policies, see Update the SSL Negotiation Configuration ,
      # Duration-Based Session Stickiness , and Application-Controlled Session Stickiness in the Classic
      # Load Balancers Guide .

      def set_load_balancer_policies_of_listener(
        load_balancer_name : String,
        load_balancer_port : Int32,
        policy_names : Array(String)
      ) : Types::SetLoadBalancerPoliciesOfListenerOutput

        input = Types::SetLoadBalancerPoliciesOfListenerInput.new(load_balancer_name: load_balancer_name, load_balancer_port: load_balancer_port, policy_names: policy_names)
        set_load_balancer_policies_of_listener(input)
      end

      def set_load_balancer_policies_of_listener(input : Types::SetLoadBalancerPoliciesOfListenerInput) : Types::SetLoadBalancerPoliciesOfListenerOutput
        request = Protocol::Query.build_request(Model::SET_LOAD_BALANCER_POLICIES_OF_LISTENER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetLoadBalancerPoliciesOfListenerOutput, "SetLoadBalancerPoliciesOfListener")
      end
    end
  end
end
