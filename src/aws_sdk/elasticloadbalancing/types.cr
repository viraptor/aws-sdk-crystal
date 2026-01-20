require "json"
require "time"

module AwsSdk
  module ElasticLoadBalancing
    module Types

      # Information about the AccessLog attribute.

      struct AccessLog
        include JSON::Serializable

        # Specifies whether access logs are enabled for the load balancer.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The interval for publishing the access logs. You can specify an interval of either 5 minutes or 60
        # minutes. Default: 60 minutes

        @[JSON::Field(key: "EmitInterval")]
        getter emit_interval : Int32?

        # The name of the Amazon S3 bucket where the access logs are stored.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The logical hierarchy you created for your Amazon S3 bucket, for example my-bucket-prefix/prod . If
        # the prefix is not provided, the log is placed at the root level of the bucket.

        @[JSON::Field(key: "S3BucketPrefix")]
        getter s3_bucket_prefix : String?

        def initialize(
          @enabled : Bool,
          @emit_interval : Int32? = nil,
          @s3_bucket_name : String? = nil,
          @s3_bucket_prefix : String? = nil
        )
        end
      end

      # The specified load balancer does not exist.

      struct AccessPointNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for EnableAvailabilityZonesForLoadBalancer.

      struct AddAvailabilityZonesInput
        include JSON::Serializable

        # The Availability Zones. These must be in the same region as the load balancer.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @availability_zones : Array(String),
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of EnableAvailabilityZonesForLoadBalancer.

      struct AddAvailabilityZonesOutput
        include JSON::Serializable

        # The updated list of Availability Zones for the load balancer.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        def initialize(
          @availability_zones : Array(String)? = nil
        )
        end
      end

      # Contains the parameters for AddTags.

      struct AddTagsInput
        include JSON::Serializable

        # The name of the load balancer. You can specify one load balancer only.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)

        # The tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @load_balancer_names : Array(String),
          @tags : Array(Types::Tag)
        )
        end
      end

      # Contains the output of AddTags.

      struct AddTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about additional load balancer attributes.

      struct AdditionalAttribute
        include JSON::Serializable

        # The name of the attribute. The following attribute is supported. elb.http.desyncmitigationmode -
        # Determines how the load balancer handles requests that might pose a security risk to your
        # application. The possible values are monitor , defensive , and strictest . The default is defensive
        # .

        @[JSON::Field(key: "Key")]
        getter key : String?

        # This value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a policy for application-controlled session stickiness.

      struct AppCookieStickinessPolicy
        include JSON::Serializable

        # The name of the application cookie used for stickiness.

        @[JSON::Field(key: "CookieName")]
        getter cookie_name : String?

        # The mnemonic name for the policy being created. The name must be unique within a set of policies for
        # this load balancer.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        def initialize(
          @cookie_name : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # Contains the parameters for ApplySecurityGroupsToLoadBalancer.

      struct ApplySecurityGroupsToLoadBalancerInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The IDs of the security groups to associate with the load balancer. Note that you cannot specify the
        # name of the security group.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)

        def initialize(
          @load_balancer_name : String,
          @security_groups : Array(String)
        )
        end
      end

      # Contains the output of ApplySecurityGroupsToLoadBalancer.

      struct ApplySecurityGroupsToLoadBalancerOutput
        include JSON::Serializable

        # The IDs of the security groups associated with the load balancer.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @security_groups : Array(String)? = nil
        )
        end
      end

      # Contains the parameters for AttachLoaBalancerToSubnets.

      struct AttachLoadBalancerToSubnetsInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The IDs of the subnets to add. You can add only one subnet per Availability Zone.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        def initialize(
          @load_balancer_name : String,
          @subnets : Array(String)
        )
        end
      end

      # Contains the output of AttachLoadBalancerToSubnets.

      struct AttachLoadBalancerToSubnetsOutput
        include JSON::Serializable

        # The IDs of the subnets attached to the load balancer.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        def initialize(
          @subnets : Array(String)? = nil
        )
        end
      end

      # Information about the configuration of an EC2 instance.

      struct BackendServerDescription
        include JSON::Serializable

        # The port on which the EC2 instance is listening.

        @[JSON::Field(key: "InstancePort")]
        getter instance_port : Int32?

        # The names of the policies enabled for the EC2 instance.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)?

        def initialize(
          @instance_port : Int32? = nil,
          @policy_names : Array(String)? = nil
        )
        end
      end

      # The specified ARN does not refer to a valid SSL certificate in AWS Identity and Access Management
      # (IAM) or AWS Certificate Manager (ACM). Note that if you recently uploaded the certificate to IAM,
      # this error might indicate that the certificate is not fully available yet.

      struct CertificateNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for ConfigureHealthCheck.

      struct ConfigureHealthCheckInput
        include JSON::Serializable

        # The configuration information.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @health_check : Types::HealthCheck,
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of ConfigureHealthCheck.

      struct ConfigureHealthCheckOutput
        include JSON::Serializable

        # The updated health check.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck?

        def initialize(
          @health_check : Types::HealthCheck? = nil
        )
        end
      end

      # Information about the ConnectionDraining attribute.

      struct ConnectionDraining
        include JSON::Serializable

        # Specifies whether connection draining is enabled for the load balancer.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The maximum time, in seconds, to keep the existing connections open before deregistering the
        # instances.

        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @enabled : Bool,
          @timeout : Int32? = nil
        )
        end
      end

      # Information about the ConnectionSettings attribute.

      struct ConnectionSettings
        include JSON::Serializable

        # The time, in seconds, that the connection is allowed to be idle (no data has been sent over the
        # connection) before it is closed by the load balancer.

        @[JSON::Field(key: "IdleTimeout")]
        getter idle_timeout : Int32

        def initialize(
          @idle_timeout : Int32
        )
        end
      end

      # Contains the parameters for CreateLoadBalancer.

      struct CreateAccessPointInput
        include JSON::Serializable

        # The listeners. For more information, see Listeners for Your Classic Load Balancer in the Classic
        # Load Balancers Guide .

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)

        # The name of the load balancer. This name must be unique within your set of load balancers for the
        # region, must have a maximum of 32 characters, must contain only alphanumeric characters or hyphens,
        # and cannot begin or end with a hyphen.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # One or more Availability Zones from the same region as the load balancer. You must specify at least
        # one Availability Zone. You can add more Availability Zones after you create the load balancer using
        # EnableAvailabilityZonesForLoadBalancer .

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The type of a load balancer. Valid only for load balancers in a VPC. By default, Elastic Load
        # Balancing creates an Internet-facing load balancer with a DNS name that resolves to public IP
        # addresses. For more information about Internet-facing and Internal load balancers, see Load Balancer
        # Scheme in the Elastic Load Balancing User Guide . Specify internal to create a load balancer with a
        # DNS name that resolves to private IP addresses.

        @[JSON::Field(key: "Scheme")]
        getter scheme : String?

        # The IDs of the security groups to assign to the load balancer.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The IDs of the subnets in your VPC to attach to the load balancer. Specify one subnet per
        # Availability Zone specified in AvailabilityZones .

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        # A list of tags to assign to the load balancer. For more information about tagging your load
        # balancer, see Tag Your Classic Load Balancer in the Classic Load Balancers Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @listeners : Array(Types::Listener),
          @load_balancer_name : String,
          @availability_zones : Array(String)? = nil,
          @scheme : String? = nil,
          @security_groups : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the output for CreateLoadBalancer.

      struct CreateAccessPointOutput
        include JSON::Serializable

        # The DNS name of the load balancer.

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        def initialize(
          @dns_name : String? = nil
        )
        end
      end

      # Contains the parameters for CreateAppCookieStickinessPolicy.

      struct CreateAppCookieStickinessPolicyInput
        include JSON::Serializable

        # The name of the application cookie used for stickiness.

        @[JSON::Field(key: "CookieName")]
        getter cookie_name : String

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The name of the policy being created. Policy names must consist of alphanumeric characters and
        # dashes (-). This name must be unique within the set of policies for this load balancer.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @cookie_name : String,
          @load_balancer_name : String,
          @policy_name : String
        )
        end
      end

      # Contains the output for CreateAppCookieStickinessPolicy.

      struct CreateAppCookieStickinessPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for CreateLBCookieStickinessPolicy.

      struct CreateLBCookieStickinessPolicyInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The name of the policy being created. Policy names must consist of alphanumeric characters and
        # dashes (-). This name must be unique within the set of policies for this load balancer.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The time period, in seconds, after which the cookie should be considered stale. If you do not
        # specify this parameter, the default value is 0, which indicates that the sticky session should last
        # for the duration of the browser session.

        @[JSON::Field(key: "CookieExpirationPeriod")]
        getter cookie_expiration_period : Int64?

        def initialize(
          @load_balancer_name : String,
          @policy_name : String,
          @cookie_expiration_period : Int64? = nil
        )
        end
      end

      # Contains the output for CreateLBCookieStickinessPolicy.

      struct CreateLBCookieStickinessPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for CreateLoadBalancerListeners.

      struct CreateLoadBalancerListenerInput
        include JSON::Serializable

        # The listeners.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @listeners : Array(Types::Listener),
          @load_balancer_name : String
        )
        end
      end

      # Contains the parameters for CreateLoadBalancerListener.

      struct CreateLoadBalancerListenerOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for CreateLoadBalancerPolicy.

      struct CreateLoadBalancerPolicyInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The name of the load balancer policy to be created. This name must be unique within the set of
        # policies for this load balancer.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the base policy type. To get the list of policy types, use
        # DescribeLoadBalancerPolicyTypes .

        @[JSON::Field(key: "PolicyTypeName")]
        getter policy_type_name : String

        # The policy attributes.

        @[JSON::Field(key: "PolicyAttributes")]
        getter policy_attributes : Array(Types::PolicyAttribute)?

        def initialize(
          @load_balancer_name : String,
          @policy_name : String,
          @policy_type_name : String,
          @policy_attributes : Array(Types::PolicyAttribute)? = nil
        )
        end
      end

      # Contains the output of CreateLoadBalancerPolicy.

      struct CreateLoadBalancerPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the CrossZoneLoadBalancing attribute.

      struct CrossZoneLoadBalancing
        include JSON::Serializable

        # Specifies whether cross-zone load balancing is enabled for the load balancer.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # Contains the parameters for DeleteLoadBalancer.

      struct DeleteAccessPointInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of DeleteLoadBalancer.

      struct DeleteAccessPointOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeleteLoadBalancerListeners.

      struct DeleteLoadBalancerListenerInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The client port numbers of the listeners.

        @[JSON::Field(key: "LoadBalancerPorts")]
        getter load_balancer_ports : Array(Int32)

        def initialize(
          @load_balancer_name : String,
          @load_balancer_ports : Array(Int32)
        )
        end
      end

      # Contains the output of DeleteLoadBalancerListeners.

      struct DeleteLoadBalancerListenerOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeleteLoadBalancerPolicy.

      struct DeleteLoadBalancerPolicyInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @load_balancer_name : String,
          @policy_name : String
        )
        end
      end

      # Contains the output of DeleteLoadBalancerPolicy.

      struct DeleteLoadBalancerPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A request made by Elastic Load Balancing to another service exceeds the maximum request rate
      # permitted for your account.

      struct DependencyThrottleException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeregisterInstancesFromLoadBalancer.

      struct DeregisterEndPointsInput
        include JSON::Serializable

        # The IDs of the instances.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @instances : Array(Types::Instance),
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of DeregisterInstancesFromLoadBalancer.

      struct DeregisterEndPointsOutput
        include JSON::Serializable

        # The remaining instances registered with the load balancer.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        def initialize(
          @instances : Array(Types::Instance)? = nil
        )
        end
      end

      # Contains the parameters for DescribeLoadBalancers.

      struct DescribeAccessPointsInput
        include JSON::Serializable

        # The names of the load balancers.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)?

        # The marker for the next set of results. (You received this marker from a previous call.)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of results to return with this call (a number from 1 to 400). The default is 400.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @load_balancer_names : Array(String)? = nil,
          @marker : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # Contains the parameters for DescribeLoadBalancers.

      struct DescribeAccessPointsOutput
        include JSON::Serializable

        # Information about the load balancers.

        @[JSON::Field(key: "LoadBalancerDescriptions")]
        getter load_balancer_descriptions : Array(Types::LoadBalancerDescription)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @load_balancer_descriptions : Array(Types::LoadBalancerDescription)? = nil,
          @next_marker : String? = nil
        )
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

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limits : Array(Types::Limit)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Contains the parameters for DescribeInstanceHealth.

      struct DescribeEndPointStateInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The IDs of the instances.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        def initialize(
          @load_balancer_name : String,
          @instances : Array(Types::Instance)? = nil
        )
        end
      end

      # Contains the output for DescribeInstanceHealth.

      struct DescribeEndPointStateOutput
        include JSON::Serializable

        # Information about the health of the instances.

        @[JSON::Field(key: "InstanceStates")]
        getter instance_states : Array(Types::InstanceState)?

        def initialize(
          @instance_states : Array(Types::InstanceState)? = nil
        )
        end
      end

      # Contains the parameters for DescribeLoadBalancerAttributes.

      struct DescribeLoadBalancerAttributesInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of DescribeLoadBalancerAttributes.

      struct DescribeLoadBalancerAttributesOutput
        include JSON::Serializable

        # Information about the load balancer attributes.

        @[JSON::Field(key: "LoadBalancerAttributes")]
        getter load_balancer_attributes : Types::LoadBalancerAttributes?

        def initialize(
          @load_balancer_attributes : Types::LoadBalancerAttributes? = nil
        )
        end
      end

      # Contains the parameters for DescribeLoadBalancerPolicies.

      struct DescribeLoadBalancerPoliciesInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        # The names of the policies.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)?

        def initialize(
          @load_balancer_name : String? = nil,
          @policy_names : Array(String)? = nil
        )
        end
      end

      # Contains the output of DescribeLoadBalancerPolicies.

      struct DescribeLoadBalancerPoliciesOutput
        include JSON::Serializable

        # Information about the policies.

        @[JSON::Field(key: "PolicyDescriptions")]
        getter policy_descriptions : Array(Types::PolicyDescription)?

        def initialize(
          @policy_descriptions : Array(Types::PolicyDescription)? = nil
        )
        end
      end

      # Contains the parameters for DescribeLoadBalancerPolicyTypes.

      struct DescribeLoadBalancerPolicyTypesInput
        include JSON::Serializable

        # The names of the policy types. If no names are specified, describes all policy types defined by
        # Elastic Load Balancing.

        @[JSON::Field(key: "PolicyTypeNames")]
        getter policy_type_names : Array(String)?

        def initialize(
          @policy_type_names : Array(String)? = nil
        )
        end
      end

      # Contains the output of DescribeLoadBalancerPolicyTypes.

      struct DescribeLoadBalancerPolicyTypesOutput
        include JSON::Serializable

        # Information about the policy types.

        @[JSON::Field(key: "PolicyTypeDescriptions")]
        getter policy_type_descriptions : Array(Types::PolicyTypeDescription)?

        def initialize(
          @policy_type_descriptions : Array(Types::PolicyTypeDescription)? = nil
        )
        end
      end

      # Contains the parameters for DescribeTags.

      struct DescribeTagsInput
        include JSON::Serializable

        # The names of the load balancers.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)

        def initialize(
          @load_balancer_names : Array(String)
        )
        end
      end

      # Contains the output for DescribeTags.

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

      # Contains the parameters for DetachLoadBalancerFromSubnets.

      struct DetachLoadBalancerFromSubnetsInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The IDs of the subnets.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        def initialize(
          @load_balancer_name : String,
          @subnets : Array(String)
        )
        end
      end

      # Contains the output of DetachLoadBalancerFromSubnets.

      struct DetachLoadBalancerFromSubnetsOutput
        include JSON::Serializable

        # The IDs of the remaining subnets for the load balancer.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        def initialize(
          @subnets : Array(String)? = nil
        )
        end
      end

      # The specified load balancer name already exists for this account.

      struct DuplicateAccessPointNameException
        include JSON::Serializable

        def initialize
        end
      end

      # A listener already exists for the specified load balancer name and port, but with a different
      # instance port, protocol, or SSL certificate.

      struct DuplicateListenerException
        include JSON::Serializable

        def initialize
        end
      end

      # A policy with the specified name already exists for this load balancer.

      struct DuplicatePolicyNameException
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

      # Information about a health check.

      struct HealthCheck
        include JSON::Serializable

        # The number of consecutive health checks successes required before moving the instance to the Healthy
        # state.

        @[JSON::Field(key: "HealthyThreshold")]
        getter healthy_threshold : Int32

        # The approximate interval, in seconds, between health checks of an individual instance.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32

        # The instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL. The range of valid
        # ports is one (1) through 65535. TCP is the default, specified as a TCP: port pair, for example
        # "TCP:5000". In this case, a health check simply attempts to open a TCP connection to the instance on
        # the specified port. Failure to connect within the configured timeout is considered unhealthy. SSL is
        # also specified as SSL: port pair, for example, SSL:5000. For HTTP/HTTPS, you must include a ping
        # path in the string. HTTP is specified as a HTTP:port;/;PathToPing; grouping, for example
        # "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is issued to the instance on the
        # given port and path. Any answer other than "200 OK" within the timeout period is considered
        # unhealthy. The total length of the HTTP ping target must be 1024 16-bit Unicode characters or less.

        @[JSON::Field(key: "Target")]
        getter target : String

        # The amount of time, in seconds, during which no response means a failed health check. This value
        # must be less than the Interval value.

        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32

        # The number of consecutive health check failures required before moving the instance to the Unhealthy
        # state.

        @[JSON::Field(key: "UnhealthyThreshold")]
        getter unhealthy_threshold : Int32

        def initialize(
          @healthy_threshold : Int32,
          @interval : Int32,
          @target : String,
          @timeout : Int32,
          @unhealthy_threshold : Int32
        )
        end
      end

      # The ID of an EC2 instance.

      struct Instance
        include JSON::Serializable

        # The instance ID.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        def initialize(
          @instance_id : String? = nil
        )
        end
      end

      # Information about the state of an EC2 instance.

      struct InstanceState
        include JSON::Serializable

        # A description of the instance state. This string can contain one or more of the following messages.
        # N/A A transient error occurred. Please try again later. Instance has failed at least the
        # UnhealthyThreshold number of health checks consecutively. Instance has not passed the configured
        # HealthyThreshold number of health checks consecutively. Instance registration is still in progress.
        # Instance is in the EC2 Availability Zone for which LoadBalancer is not configured to route traffic
        # to. Instance is not currently registered with the LoadBalancer. Instance deregistration currently in
        # progress. Disable Availability Zone is currently in progress. Instance is in pending state. Instance
        # is in stopped state. Instance is in terminated state.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Information about the cause of OutOfService instances. Specifically, whether the cause is Elastic
        # Load Balancing or the instance. Valid values: ELB | Instance | N/A

        @[JSON::Field(key: "ReasonCode")]
        getter reason_code : String?

        # The current state of the instance. Valid values: InService | OutOfService | Unknown

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @instance_id : String? = nil,
          @reason_code : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The requested configuration change is not valid.

      struct InvalidConfigurationRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified endpoint is not valid.

      struct InvalidEndPointException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified value for the schema is not valid. You can only specify a scheme for load balancers in
      # a VPC.

      struct InvalidSchemeException
        include JSON::Serializable

        def initialize
        end
      end

      # One or more of the specified security groups do not exist.

      struct InvalidSecurityGroupException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified VPC has no associated Internet gateway.

      struct InvalidSubnetException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a policy for duration-based session stickiness.

      struct LBCookieStickinessPolicy
        include JSON::Serializable

        # The time period, in seconds, after which the cookie should be considered stale. If this parameter is
        # not specified, the stickiness session lasts for the duration of the browser session.

        @[JSON::Field(key: "CookieExpirationPeriod")]
        getter cookie_expiration_period : Int64?

        # The name of the policy. This name must be unique within the set of policies for this load balancer.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        def initialize(
          @cookie_expiration_period : Int64? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # Information about an Elastic Load Balancing resource limit for your AWS account.

      struct Limit
        include JSON::Serializable

        # The maximum value of the limit.

        @[JSON::Field(key: "Max")]
        getter max : String?

        # The name of the limit. The possible values are: classic-listeners classic-load-balancers
        # classic-registered-instances

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @max : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a listener. For information about the protocols and the ports supported by Elastic
      # Load Balancing, see Listeners for Your Classic Load Balancer in the Classic Load Balancers Guide .

      struct Listener
        include JSON::Serializable

        # The port on which the instance is listening.

        @[JSON::Field(key: "InstancePort")]
        getter instance_port : Int32

        # The port on which the load balancer is listening. On EC2-VPC, you can specify any port from the
        # range 1-65535. On EC2-Classic, you can specify any port from the following list: 25, 80, 443, 465,
        # 587, 1024-65535.

        @[JSON::Field(key: "LoadBalancerPort")]
        getter load_balancer_port : Int32

        # The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP, or SSL.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or SSL. If the front-end
        # protocol is TCP or SSL, the back-end protocol must be TCP or SSL. If the front-end protocol is HTTP
        # or HTTPS, the back-end protocol must be HTTP or HTTPS. If there is another listener with the same
        # InstancePort whose InstanceProtocol is secure, (HTTPS or SSL), the listener's InstanceProtocol must
        # also be secure. If there is another listener with the same InstancePort whose InstanceProtocol is
        # HTTP or TCP, the listener's InstanceProtocol must be HTTP or TCP.

        @[JSON::Field(key: "InstanceProtocol")]
        getter instance_protocol : String?

        # The Amazon Resource Name (ARN) of the server certificate.

        @[JSON::Field(key: "SSLCertificateId")]
        getter ssl_certificate_id : String?

        def initialize(
          @instance_port : Int32,
          @load_balancer_port : Int32,
          @protocol : String,
          @instance_protocol : String? = nil,
          @ssl_certificate_id : String? = nil
        )
        end
      end

      # The policies enabled for a listener.

      struct ListenerDescription
        include JSON::Serializable

        # The listener.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::Listener?

        # The policies. If there are no policies enabled, the list is empty.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)?

        def initialize(
          @listener : Types::Listener? = nil,
          @policy_names : Array(String)? = nil
        )
        end
      end

      # The load balancer does not have a listener configured at the specified port.

      struct ListenerNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified load balancer attribute does not exist.

      struct LoadBalancerAttributeNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The attributes for a load balancer.

      struct LoadBalancerAttributes
        include JSON::Serializable

        # If enabled, the load balancer captures detailed information of all requests and delivers the
        # information to the Amazon S3 bucket that you specify. For more information, see Enable Access Logs
        # in the Classic Load Balancers Guide .

        @[JSON::Field(key: "AccessLog")]
        getter access_log : Types::AccessLog?

        # Any additional attributes.

        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Array(Types::AdditionalAttribute)?

        # If enabled, the load balancer allows existing requests to complete before the load balancer shifts
        # traffic away from a deregistered or unhealthy instance. For more information, see Configure
        # Connection Draining in the Classic Load Balancers Guide .

        @[JSON::Field(key: "ConnectionDraining")]
        getter connection_draining : Types::ConnectionDraining?

        # If enabled, the load balancer allows the connections to remain idle (no data is sent over the
        # connection) for the specified duration. By default, Elastic Load Balancing maintains a 60-second
        # idle connection timeout for both front-end and back-end connections of your load balancer. For more
        # information, see Configure Idle Connection Timeout in the Classic Load Balancers Guide .

        @[JSON::Field(key: "ConnectionSettings")]
        getter connection_settings : Types::ConnectionSettings?

        # If enabled, the load balancer routes the request traffic evenly across all instances regardless of
        # the Availability Zones. For more information, see Configure Cross-Zone Load Balancing in the Classic
        # Load Balancers Guide .

        @[JSON::Field(key: "CrossZoneLoadBalancing")]
        getter cross_zone_load_balancing : Types::CrossZoneLoadBalancing?

        def initialize(
          @access_log : Types::AccessLog? = nil,
          @additional_attributes : Array(Types::AdditionalAttribute)? = nil,
          @connection_draining : Types::ConnectionDraining? = nil,
          @connection_settings : Types::ConnectionSettings? = nil,
          @cross_zone_load_balancing : Types::CrossZoneLoadBalancing? = nil
        )
        end
      end

      # Information about a load balancer.

      struct LoadBalancerDescription
        include JSON::Serializable

        # The Availability Zones for the load balancer.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Information about your EC2 instances.

        @[JSON::Field(key: "BackendServerDescriptions")]
        getter backend_server_descriptions : Array(Types::BackendServerDescription)?

        # The DNS name of the load balancer. For more information, see Configure a Custom Domain Name in the
        # Classic Load Balancers Guide .

        @[JSON::Field(key: "CanonicalHostedZoneName")]
        getter canonical_hosted_zone_name : String?

        # The ID of the Amazon Route 53 hosted zone for the load balancer.

        @[JSON::Field(key: "CanonicalHostedZoneNameID")]
        getter canonical_hosted_zone_name_id : String?

        # The date and time the load balancer was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The DNS name of the load balancer.

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # Information about the health checks conducted on the load balancer.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck?

        # The IDs of the instances for the load balancer.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The listeners for the load balancer.

        @[JSON::Field(key: "ListenerDescriptions")]
        getter listener_descriptions : Array(Types::ListenerDescription)?

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        # The policies defined for the load balancer.

        @[JSON::Field(key: "Policies")]
        getter policies : Types::Policies?

        # The type of load balancer. Valid only for load balancers in a VPC. If Scheme is internet-facing ,
        # the load balancer has a public DNS name that resolves to a public IP address. If Scheme is internal
        # , the load balancer has a public DNS name that resolves to a private IP address.

        @[JSON::Field(key: "Scheme")]
        getter scheme : String?

        # The security groups for the load balancer. Valid only for load balancers in a VPC.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The security group for the load balancer, which you can use as part of your inbound rules for your
        # registered instances. To only allow traffic from load balancers, add a security group rule that
        # specifies this source security group as the inbound source.

        @[JSON::Field(key: "SourceSecurityGroup")]
        getter source_security_group : Types::SourceSecurityGroup?

        # The IDs of the subnets for the load balancer.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        # The ID of the VPC for the load balancer.

        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @backend_server_descriptions : Array(Types::BackendServerDescription)? = nil,
          @canonical_hosted_zone_name : String? = nil,
          @canonical_hosted_zone_name_id : String? = nil,
          @created_time : Time? = nil,
          @dns_name : String? = nil,
          @health_check : Types::HealthCheck? = nil,
          @instances : Array(Types::Instance)? = nil,
          @listener_descriptions : Array(Types::ListenerDescription)? = nil,
          @load_balancer_name : String? = nil,
          @policies : Types::Policies? = nil,
          @scheme : String? = nil,
          @security_groups : Array(String)? = nil,
          @source_security_group : Types::SourceSecurityGroup? = nil,
          @subnets : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains the parameters for ModifyLoadBalancerAttributes.

      struct ModifyLoadBalancerAttributesInput
        include JSON::Serializable

        # The attributes for the load balancer.

        @[JSON::Field(key: "LoadBalancerAttributes")]
        getter load_balancer_attributes : Types::LoadBalancerAttributes

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_attributes : Types::LoadBalancerAttributes,
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of ModifyLoadBalancerAttributes.

      struct ModifyLoadBalancerAttributesOutput
        include JSON::Serializable

        # Information about the load balancer attributes.

        @[JSON::Field(key: "LoadBalancerAttributes")]
        getter load_balancer_attributes : Types::LoadBalancerAttributes?

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        def initialize(
          @load_balancer_attributes : Types::LoadBalancerAttributes? = nil,
          @load_balancer_name : String? = nil
        )
        end
      end

      # This operation is not allowed.

      struct OperationNotPermittedException
        include JSON::Serializable

        def initialize
        end
      end

      # The policies for a load balancer.

      struct Policies
        include JSON::Serializable

        # The stickiness policies created using CreateAppCookieStickinessPolicy .

        @[JSON::Field(key: "AppCookieStickinessPolicies")]
        getter app_cookie_stickiness_policies : Array(Types::AppCookieStickinessPolicy)?

        # The stickiness policies created using CreateLBCookieStickinessPolicy .

        @[JSON::Field(key: "LBCookieStickinessPolicies")]
        getter lb_cookie_stickiness_policies : Array(Types::LBCookieStickinessPolicy)?

        # The policies other than the stickiness policies.

        @[JSON::Field(key: "OtherPolicies")]
        getter other_policies : Array(String)?

        def initialize(
          @app_cookie_stickiness_policies : Array(Types::AppCookieStickinessPolicy)? = nil,
          @lb_cookie_stickiness_policies : Array(Types::LBCookieStickinessPolicy)? = nil,
          @other_policies : Array(String)? = nil
        )
        end
      end

      # Information about a policy attribute.

      struct PolicyAttribute
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The value of the attribute.

        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_value : String? = nil
        )
        end
      end

      # Information about a policy attribute.

      struct PolicyAttributeDescription
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The value of the attribute.

        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_value : String? = nil
        )
        end
      end

      # Information about a policy attribute type.

      struct PolicyAttributeTypeDescription
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The type of the attribute. For example, Boolean or Integer .

        @[JSON::Field(key: "AttributeType")]
        getter attribute_type : String?

        # The cardinality of the attribute. Valid values: ONE(1) : Single value required ZERO_OR_ONE(0..1) :
        # Up to one value is allowed ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed
        # ONE_OR_MORE(1..*0) : Required. Multiple values are allowed

        @[JSON::Field(key: "Cardinality")]
        getter cardinality : String?

        # The default value of the attribute, if applicable.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # A description of the attribute.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_type : String? = nil,
          @cardinality : String? = nil,
          @default_value : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Information about a policy.

      struct PolicyDescription
        include JSON::Serializable

        # The policy attributes.

        @[JSON::Field(key: "PolicyAttributeDescriptions")]
        getter policy_attribute_descriptions : Array(Types::PolicyAttributeDescription)?

        # The name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # The name of the policy type.

        @[JSON::Field(key: "PolicyTypeName")]
        getter policy_type_name : String?

        def initialize(
          @policy_attribute_descriptions : Array(Types::PolicyAttributeDescription)? = nil,
          @policy_name : String? = nil,
          @policy_type_name : String? = nil
        )
        end
      end

      # One or more of the specified policies do not exist.

      struct PolicyNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a policy type.

      struct PolicyTypeDescription
        include JSON::Serializable

        # A description of the policy type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The description of the policy attributes associated with the policies defined by Elastic Load
        # Balancing.

        @[JSON::Field(key: "PolicyAttributeTypeDescriptions")]
        getter policy_attribute_type_descriptions : Array(Types::PolicyAttributeTypeDescription)?

        # The name of the policy type.

        @[JSON::Field(key: "PolicyTypeName")]
        getter policy_type_name : String?

        def initialize(
          @description : String? = nil,
          @policy_attribute_type_descriptions : Array(Types::PolicyAttributeTypeDescription)? = nil,
          @policy_type_name : String? = nil
        )
        end
      end

      # One or more of the specified policy types do not exist.

      struct PolicyTypeNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for RegisterInstancesWithLoadBalancer.

      struct RegisterEndPointsInput
        include JSON::Serializable

        # The IDs of the instances.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @instances : Array(Types::Instance),
          @load_balancer_name : String
        )
        end
      end

      # Contains the output of RegisterInstancesWithLoadBalancer.

      struct RegisterEndPointsOutput
        include JSON::Serializable

        # The updated list of instances for the load balancer.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        def initialize(
          @instances : Array(Types::Instance)? = nil
        )
        end
      end

      # Contains the parameters for DisableAvailabilityZonesForLoadBalancer.

      struct RemoveAvailabilityZonesInput
        include JSON::Serializable

        # The Availability Zones.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @availability_zones : Array(String),
          @load_balancer_name : String
        )
        end
      end

      # Contains the output for DisableAvailabilityZonesForLoadBalancer.

      struct RemoveAvailabilityZonesOutput
        include JSON::Serializable

        # The remaining Availability Zones for the load balancer.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        def initialize(
          @availability_zones : Array(String)? = nil
        )
        end
      end

      # Contains the parameters for RemoveTags.

      struct RemoveTagsInput
        include JSON::Serializable

        # The name of the load balancer. You can specify a maximum of one load balancer name.

        @[JSON::Field(key: "LoadBalancerNames")]
        getter load_balancer_names : Array(String)

        # The list of tag keys to remove.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagKeyOnly)

        def initialize(
          @load_balancer_names : Array(String),
          @tags : Array(Types::TagKeyOnly)
        )
        end
      end

      # Contains the output of RemoveTags.

      struct RemoveTagsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for SetLoadBalancerListenerSSLCertificate.

      struct SetLoadBalancerListenerSSLCertificateInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The port that uses the specified SSL certificate.

        @[JSON::Field(key: "LoadBalancerPort")]
        getter load_balancer_port : Int32

        # The Amazon Resource Name (ARN) of the SSL certificate.

        @[JSON::Field(key: "SSLCertificateId")]
        getter ssl_certificate_id : String

        def initialize(
          @load_balancer_name : String,
          @load_balancer_port : Int32,
          @ssl_certificate_id : String
        )
        end
      end

      # Contains the output of SetLoadBalancerListenerSSLCertificate.

      struct SetLoadBalancerListenerSSLCertificateOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for SetLoadBalancerPoliciesForBackendServer.

      struct SetLoadBalancerPoliciesForBackendServerInput
        include JSON::Serializable

        # The port number associated with the EC2 instance.

        @[JSON::Field(key: "InstancePort")]
        getter instance_port : Int32

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The names of the policies. If the list is empty, then all current polices are removed from the EC2
        # instance.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        def initialize(
          @instance_port : Int32,
          @load_balancer_name : String,
          @policy_names : Array(String)
        )
        end
      end

      # Contains the output of SetLoadBalancerPoliciesForBackendServer.

      struct SetLoadBalancerPoliciesForBackendServerOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for SetLoadBalancePoliciesOfListener.

      struct SetLoadBalancerPoliciesOfListenerInput
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String

        # The external port of the load balancer.

        @[JSON::Field(key: "LoadBalancerPort")]
        getter load_balancer_port : Int32

        # The names of the policies. This list must include all policies to be enabled. If you omit a policy
        # that is currently enabled, it is disabled. If the list is empty, all current policies are disabled.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        def initialize(
          @load_balancer_name : String,
          @load_balancer_port : Int32,
          @policy_names : Array(String)
        )
        end
      end

      # Contains the output of SetLoadBalancePoliciesOfListener.

      struct SetLoadBalancerPoliciesOfListenerOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a source security group.

      struct SourceSecurityGroup
        include JSON::Serializable

        # The name of the security group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The owner of the security group.

        @[JSON::Field(key: "OwnerAlias")]
        getter owner_alias : String?

        def initialize(
          @group_name : String? = nil,
          @owner_alias : String? = nil
        )
        end
      end

      # One or more of the specified subnets do not exist.

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

      # The tags associated with a load balancer.

      struct TagDescription
        include JSON::Serializable

        # The name of the load balancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        # The tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @load_balancer_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The key of a tag.

      struct TagKeyOnly
        include JSON::Serializable

        # The name of the key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @key : String? = nil
        )
        end
      end

      # The quota for the number of load balancers has been reached.

      struct TooManyAccessPointsException
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for the number of policies for this load balancer has been reached.

      struct TooManyPoliciesException
        include JSON::Serializable

        def initialize
        end
      end

      # The quota for the number of tags that can be assigned to a load balancer has been reached.

      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified protocol or signature version is not supported.

      struct UnsupportedProtocolException
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
