require "json"
require "time"

module AwsSdk
  module Route53
    module Types

      # A complex type that contains the type of limit that you specified in the request and the current
      # value for that limit.

      struct AccountLimit
        include JSON::Serializable

        # The limit that you requested. Valid values include the following: MAX_HEALTH_CHECKS_BY_OWNER : The
        # maximum number of health checks that you can create using the current account.
        # MAX_HOSTED_ZONES_BY_OWNER : The maximum number of hosted zones that you can create using the current
        # account. MAX_REUSABLE_DELEGATION_SETS_BY_OWNER : The maximum number of reusable delegation sets that
        # you can create using the current account. MAX_TRAFFIC_POLICIES_BY_OWNER : The maximum number of
        # traffic policies that you can create using the current account.
        # MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER : The maximum number of traffic policy instances that you can
        # create using the current account. (Traffic policy instances are referred to as traffic flow policy
        # records in the Amazon Route 53 console.)

        @[JSON::Field(key: "Type")]
        getter type : String

        # The current value for the limit that is specified by Type .

        @[JSON::Field(key: "Value")]
        getter value : Int64

        def initialize(
          @type : String,
          @value : Int64
        )
        end
      end


      struct ActivateKeySigningKeyRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # A string used to identify a key-signing key (KSK). Name can include numbers, letters, and
        # underscores (_). Name must be unique for each key-signing key in the same hosted zone.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @hosted_zone_id : String,
          @name : String
        )
        end
      end


      struct ActivateKeySigningKeyResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to
      # use to determine whether the specified health check is healthy.

      struct AlarmIdentifier
        include JSON::Serializable

        # The name of the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine
        # whether this health check is healthy. Route 53 supports CloudWatch alarms with the following
        # features: Standard-resolution metrics. High-resolution metrics aren't supported. For more
        # information, see High-Resolution Metrics in the Amazon CloudWatch User Guide . Statistics: Average,
        # Minimum, Maximum, Sum, and SampleCount. Extended statistics aren't supported.

        @[JSON::Field(key: "Name")]
        getter name : String

        # For the CloudWatch alarm that you want Route 53 health checkers to use to determine whether this
        # health check is healthy, the region that the alarm was created in. For the current list of
        # CloudWatch regions, see Amazon CloudWatch endpoints and quotas in the Amazon Web Services General
        # Reference .

        @[JSON::Field(key: "Region")]
        getter region : String

        def initialize(
          @name : String,
          @region : String
        )
        end
      end

      # Alias resource record sets only: Information about the Amazon Web Services resource, such as a
      # CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to. When creating
      # resource record sets for a private hosted zone, note the following: For information about creating
      # failover resource record sets in a private hosted zone, see Configuring Failover in a Private Hosted
      # Zone .

      struct AliasTarget
        include JSON::Serializable

        # Alias resource record sets only: The value that you specify depends on where you want to route
        # queries: Amazon API Gateway custom regional APIs and edge-optimized APIs Specify the applicable
        # domain name for your API. You can get the applicable value using the CLI command get-domain-names :
        # For regional APIs, specify the value of regionalDomainName . For edge-optimized APIs, specify the
        # value of distributionDomainName . This is the name of the associated CloudFront distribution, such
        # as da1b2c3d4e5.cloudfront.net . The name of the record that you're creating must match a custom
        # domain name for your API, such as api.example.com . Amazon Virtual Private Cloud interface VPC
        # endpoint Enter the API endpoint for the interface endpoint, such as
        # vpce-123456789abcdef01-example-us-east-1a.elasticloadbalancing.us-east-1.vpce.amazonaws.com . For
        # edge-optimized APIs, this is the domain name for the corresponding CloudFront distribution. You can
        # get the value of DnsName using the CLI command describe-vpc-endpoints . CloudFront distribution
        # Specify the domain name that CloudFront assigned when you created your distribution. Your CloudFront
        # distribution must include an alternate domain name that matches the name of the resource record set.
        # For example, if the name of the resource record set is acme.example.com , your CloudFront
        # distribution must include acme.example.com as one of the alternate domain names. For more
        # information, see Using Alternate Domain Names (CNAMEs) in the Amazon CloudFront Developer Guide .
        # You can't create a resource record set in a private hosted zone to route traffic to a CloudFront
        # distribution. For failover alias records, you can't specify a CloudFront distribution for both the
        # primary and secondary records. A distribution must include an alternate domain name that matches the
        # name of the record. However, the primary and secondary records have the same name, and you can't
        # include the same alternate domain name in more than one distribution. Elastic Beanstalk environment
        # If the domain name for your Elastic Beanstalk environment includes the region that you deployed the
        # environment in, you can create an alias record that routes traffic to the environment. For example,
        # the domain name my-environment. us-west-2 .elasticbeanstalk.com is a regionalized domain name. For
        # environments that were created before early 2016, the domain name doesn't include the region. To
        # route traffic to these environments, you must create a CNAME record instead of an alias record. Note
        # that you can't create a CNAME record for the root domain name. For example, if your domain name is
        # example.com, you can create a record that routes traffic for acme.example.com to your Elastic
        # Beanstalk environment, but you can't create a record that routes traffic for example.com to your
        # Elastic Beanstalk environment. For Elastic Beanstalk environments that have regionalized subdomains,
        # specify the CNAME attribute for the environment. You can use the following methods to get the value
        # of the CNAME attribute: Amazon Web Services Management Console : For information about how to get
        # the value by using the console, see Using Custom Domains with Elastic Beanstalk in the Elastic
        # Beanstalk Developer Guide . Elastic Beanstalk API : Use the DescribeEnvironments action to get the
        # value of the CNAME attribute. For more information, see DescribeEnvironments in the Elastic
        # Beanstalk API Reference . CLI : Use the describe-environments command to get the value of the CNAME
        # attribute. For more information, see describe-environments in the CLI Command Reference . ELB load
        # balancer Specify the DNS name that is associated with the load balancer. Get the DNS name by using
        # the Amazon Web Services Management Console, the ELB API, or the CLI. Amazon Web Services Management
        # Console : Go to the EC2 page, choose Load Balancers in the navigation pane, choose the load
        # balancer, choose the Description tab, and get the value of the DNS name field. If you're routing
        # traffic to a Classic Load Balancer, get the value that begins with dualstack . If you're routing
        # traffic to another type of load balancer, get the value that applies to the record type, A or AAAA.
        # Elastic Load Balancing API : Use DescribeLoadBalancers to get the value of DNSName . For more
        # information, see the applicable guide: Classic Load Balancers: DescribeLoadBalancers Application and
        # Network Load Balancers: DescribeLoadBalancers CLI : Use describe-load-balancers to get the value of
        # DNSName . For more information, see the applicable guide: Classic Load Balancers:
        # describe-load-balancers Application and Network Load Balancers: describe-load-balancers Global
        # Accelerator accelerator Specify the DNS name for your accelerator: Global Accelerator API: To get
        # the DNS name, use DescribeAccelerator . CLI: To get the DNS name, use describe-accelerator . Amazon
        # S3 bucket that is configured as a static website Specify the domain name of the Amazon S3 website
        # endpoint that you created the bucket in, for example, s3-website.us-east-2.amazonaws.com . For more
        # information about valid values, see the table Amazon S3 Website Endpoints in the Amazon Web Services
        # General Reference . For more information about using S3 buckets for websites, see Getting Started
        # with Amazon Route 53 in the Amazon Route 53 Developer Guide. Another Route 53 resource record set
        # Specify the value of the Name element for a resource record set in the current hosted zone. If
        # you're creating an alias record that has the same name as the hosted zone (known as the zone apex),
        # you can't specify the domain name for a record for which the value of Type is CNAME . This is
        # because the alias record must have the same type as the record that you're routing traffic to, and
        # creating a CNAME record for the zone apex isn't supported even for an alias record.

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String

        # Applies only to alias, failover alias, geolocation alias, latency alias, and weighted alias resource
        # record sets: When EvaluateTargetHealth is true , an alias resource record set inherits the health of
        # the referenced Amazon Web Services resource, such as an ELB load balancer or another resource record
        # set in the hosted zone. Note the following: CloudFront distributions You can't set
        # EvaluateTargetHealth to true when the alias target is a CloudFront distribution. Elastic Beanstalk
        # environments that have regionalized subdomains If you specify an Elastic Beanstalk environment in
        # DNSName and the environment contains an ELB load balancer, Elastic Load Balancing routes queries
        # only to the healthy Amazon EC2 instances that are registered with the load balancer. (An environment
        # automatically contains an ELB load balancer if it includes more than one Amazon EC2 instance.) If
        # you set EvaluateTargetHealth to true and either no Amazon EC2 instances are healthy or the load
        # balancer itself is unhealthy, Route 53 routes queries to other available resources that are healthy,
        # if any. If the environment contains a single Amazon EC2 instance, there are no special requirements.
        # ELB load balancers Health checking behavior depends on the type of load balancer: Classic Load
        # Balancers : If you specify an ELB Classic Load Balancer in DNSName , Elastic Load Balancing routes
        # queries only to the healthy Amazon EC2 instances that are registered with the load balancer. If you
        # set EvaluateTargetHealth to true and either no EC2 instances are healthy or the load balancer itself
        # is unhealthy, Route 53 routes queries to other resources. Application and Network Load Balancers :
        # If you specify an ELB Application or Network Load Balancer and you set EvaluateTargetHealth to true
        # , Route 53 routes queries to the load balancer based on the health of the target groups that are
        # associated with the load balancer: For an Application or Network Load Balancer to be considered
        # healthy, every target group that contains targets must contain at least one healthy target. If any
        # target group contains only unhealthy targets, the load balancer is considered unhealthy, and Route
        # 53 routes queries to other resources. A target group that has no registered targets is considered
        # unhealthy. When you create a load balancer, you configure settings for Elastic Load Balancing health
        # checks; they're not Route 53 health checks, but they perform a similar function. Do not create Route
        # 53 health checks for the EC2 instances that you register with an ELB load balancer. API Gateway APIs
        # There are no special requirements for setting EvaluateTargetHealth to true when the alias target is
        # an API Gateway API. However, because API Gateway is highly available by design, EvaluateTargetHealth
        # provides no operational benefit and Route 53 health checks are recommended instead for failover
        # scenarios. S3 buckets There are no special requirements for setting EvaluateTargetHealth to true
        # when the alias target is an S3 bucket. However, because S3 buckets are highly available by design,
        # EvaluateTargetHealth provides no operational benefit and Route 53 health checks are recommended
        # instead for failover scenarios. VPC interface endpoints There are no special requirements for
        # setting EvaluateTargetHealth to true when the alias target is a VPC interface endpoint. However,
        # because VPC interface endpoints are highly available by design, EvaluateTargetHealth provides no
        # operational benefit and Route 53 health checks are recommended instead for failover scenarios. Other
        # records in the same hosted zone If the Amazon Web Services resource that you specify in DNSName is a
        # record or a group of records (for example, a group of weighted records) but is not another alias
        # record, we recommend that you associate a health check with all of the records in the alias target.
        # For more information, see What Happens When You Omit Health Checks? in the Amazon Route 53 Developer
        # Guide . While EvaluateTargetHealth can be set to true for highly available Amazon Web Services
        # services (such as S3 buckets, VPC interface endpoints, and API Gateway), these services are designed
        # for high availability and rarely experience outages that would be detected by this feature. For
        # failover scenarios with these services, consider using Route 53 health checks that monitor your
        # application's ability to access the service instead. For more information and examples, see Amazon
        # Route 53 Health Checks and DNS Failover in the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "EvaluateTargetHealth")]
        getter evaluate_target_health : Bool

        # Alias resource records sets only : The value used depends on where you want to route traffic: Amazon
        # API Gateway custom regional APIs and edge-optimized APIs Specify the hosted zone ID for your API.
        # You can get the applicable value using the CLI command get-domain-names : For regional APIs, specify
        # the value of regionalHostedZoneId . For edge-optimized APIs, specify the value of
        # distributionHostedZoneId . Amazon Virtual Private Cloud interface VPC endpoint Specify the hosted
        # zone ID for your interface endpoint. You can get the value of HostedZoneId using the CLI command
        # describe-vpc-endpoints . CloudFront distribution Specify Z2FDTNDATAQYW2 . Alias resource record sets
        # for CloudFront can't be created in a private zone. Elastic Beanstalk environment Specify the hosted
        # zone ID for the region that you created the environment in. The environment must have a regionalized
        # subdomain. For a list of regions and the corresponding hosted zone IDs, see Elastic Beanstalk
        # endpoints and quotas in the Amazon Web Services General Reference . ELB load balancer Specify the
        # value of the hosted zone ID for the load balancer. Use the following methods to get the hosted zone
        # ID: Elastic Load Balancing endpoints and quotas topic in the Amazon Web Services General Reference :
        # Use the value that corresponds with the region that you created your load balancer in. Note that
        # there are separate columns for Application and Classic Load Balancers and for Network Load
        # Balancers. Amazon Web Services Management Console : Go to the Amazon EC2 page, choose Load Balancers
        # in the navigation pane, select the load balancer, and get the value of the Hosted zone field on the
        # Description tab. Elastic Load Balancing API : Use DescribeLoadBalancers to get the applicable value.
        # For more information, see the applicable guide: Classic Load Balancers: Use DescribeLoadBalancers to
        # get the value of CanonicalHostedZoneNameId . Application and Network Load Balancers: Use
        # DescribeLoadBalancers to get the value of CanonicalHostedZoneId . CLI : Use describe-load-balancers
        # to get the applicable value. For more information, see the applicable guide: Classic Load Balancers:
        # Use describe-load-balancers to get the value of CanonicalHostedZoneNameId . Application and Network
        # Load Balancers: Use describe-load-balancers to get the value of CanonicalHostedZoneId . Global
        # Accelerator accelerator Specify Z2BJ6XQ5FK7U4H . An Amazon S3 bucket configured as a static website
        # Specify the hosted zone ID for the region that you created the bucket in. For more information about
        # valid values, see the table Amazon S3 Website Endpoints in the Amazon Web Services General Reference
        # . Another Route 53 resource record set in your hosted zone Specify the hosted zone ID of your hosted
        # zone. (An alias resource record set can't reference a resource record set in a different hosted
        # zone.)

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        def initialize(
          @dns_name : String,
          @evaluate_target_health : Bool,
          @hosted_zone_id : String
        )
        end
      end

      # A complex type that contains information about the request to associate a VPC with a private hosted
      # zone.

      struct AssociateVPCWithHostedZoneRequest
        include JSON::Serializable

        # The ID of the private hosted zone that you want to associate an Amazon VPC with. Note that you can't
        # associate a VPC with a hosted zone that doesn't have an existing VPC association.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # A complex type that contains information about the VPC that you want to associate with a private
        # hosted zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC

        # Optional: A comment about the association request.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @hosted_zone_id : String,
          @vpc : Types::VPC,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the AssociateVPCWithHostedZone request.

      struct AssociateVPCWithHostedZoneResponse
        include JSON::Serializable

        # A complex type that describes the changes made to your hosted zone.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # The information for each resource record set that you want to change.

      struct Change
        include JSON::Serializable

        # The action to perform: CREATE : Creates a resource record set that has the specified values. DELETE
        # : Deletes a existing resource record set. To delete the resource record set that is associated with
        # a traffic policy instance, use DeleteTrafficPolicyInstance . Amazon Route 53 will delete the
        # resource record set automatically. If you delete the resource record set by using
        # ChangeResourceRecordSets , Route 53 doesn't automatically delete the traffic policy instance, and
        # you'll continue to be charged for it even though it's no longer in use. UPSERT : If a resource
        # record set doesn't already exist, Route 53 creates it. If a resource record set does exist, Route 53
        # updates it with the values in the request.

        @[JSON::Field(key: "Action")]
        getter action : String

        # Information about the resource record set to create, delete, or update.

        @[JSON::Field(key: "ResourceRecordSet")]
        getter resource_record_set : Types::ResourceRecordSet

        def initialize(
          @action : String,
          @resource_record_set : Types::ResourceRecordSet
        )
        end
      end

      # The information for a change request.

      struct ChangeBatch
        include JSON::Serializable

        # Information about the changes to make to the record sets.

        @[JSON::Field(key: "Changes")]
        getter changes : Array(Types::Change)

        # Optional: Any comments you want to include about a change batch request.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @changes : Array(Types::Change),
          @comment : String? = nil
        )
        end
      end


      struct ChangeCidrCollectionRequest
        include JSON::Serializable

        # Information about changes to a CIDR collection.

        @[JSON::Field(key: "Changes")]
        getter changes : Array(Types::CidrCollectionChange)

        # The UUID of the CIDR collection to update.

        @[JSON::Field(key: "CidrCollectionId")]
        getter id : String

        # A sequential counter that Amazon Route 53 sets to 1 when you create a collection and increments it
        # by 1 each time you update the collection. We recommend that you use ListCidrCollection to get the
        # current value of CollectionVersion for the collection that you want to update, and then include that
        # value with the change request. This prevents Route 53 from overwriting an intervening update: If the
        # value in the request matches the value of CollectionVersion in the collection, Route 53 updates the
        # collection. If the value of CollectionVersion in the collection is greater than the value in the
        # request, the collection was changed after you got the version number. Route 53 does not update the
        # collection, and it returns a CidrCollectionVersionMismatch error.

        @[JSON::Field(key: "CollectionVersion")]
        getter collection_version : Int64?

        def initialize(
          @changes : Array(Types::CidrCollectionChange),
          @id : String,
          @collection_version : Int64? = nil
        )
        end
      end


      struct ChangeCidrCollectionResponse
        include JSON::Serializable

        # The ID that is returned by ChangeCidrCollection . You can use it as input to GetChange to see if a
        # CIDR collection change has propagated or not.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that describes change information about changes made to your hosted zone.

      struct ChangeInfo
        include JSON::Serializable

        # This element contains an ID that you use when performing a GetChange action to get detailed
        # information about the change.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current state of the request. PENDING indicates that this request has not yet been applied to
        # all Amazon Route 53 DNS servers.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The date and time that the change request was submitted in ISO 8601 format and Coordinated Universal
        # Time (UTC). For example, the value 2017-03-27T17:48:16.751Z represents March 27, 2017 at
        # 17:48:16.751 UTC.

        @[JSON::Field(key: "SubmittedAt")]
        getter submitted_at : Time

        # A comment you can provide.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @id : String,
          @status : String,
          @submitted_at : Time,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains change information for the resource record set.

      struct ChangeResourceRecordSetsRequest
        include JSON::Serializable

        # A complex type that contains an optional comment and the Changes element.

        @[JSON::Field(key: "ChangeBatch")]
        getter change_batch : Types::ChangeBatch

        # The ID of the hosted zone that contains the resource record sets that you want to change.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        def initialize(
          @change_batch : Types::ChangeBatch,
          @hosted_zone_id : String
        )
        end
      end

      # A complex type containing the response for the request.

      struct ChangeResourceRecordSetsResponse
        include JSON::Serializable

        # A complex type that contains information about changes made to your hosted zone. This element
        # contains an ID that you use when performing a GetChange action to get detailed information about the
        # change.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # A complex type that contains information about the tags that you want to add, edit, or delete.

      struct ChangeTagsForResourceRequest
        include JSON::Serializable

        # The ID of the resource for which you want to add, change, or delete tags.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource. The resource type for health checks is healthcheck . The resource type for
        # hosted zones is hostedzone .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # A complex type that contains a list of the tags that you want to add to the specified health check
        # or hosted zone and/or the tags that you want to edit Value for. You can add a maximum of 10 tags to
        # a health check or a hosted zone.

        @[JSON::Field(key: "AddTags")]
        getter add_tags : Array(Types::Tag)?

        # A complex type that contains a list of the tags that you want to delete from the specified health
        # check or hosted zone. You can specify up to 10 keys.

        @[JSON::Field(key: "RemoveTagKeys")]
        getter remove_tag_keys : Array(String)?

        def initialize(
          @resource_id : String,
          @resource_type : String,
          @add_tags : Array(Types::Tag)? = nil,
          @remove_tag_keys : Array(String)? = nil
        )
        end
      end

      # Empty response for the request.

      struct ChangeTagsForResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This CIDR block is already in use.

      struct CidrBlockInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that lists the CIDR blocks.

      struct CidrBlockSummary
        include JSON::Serializable

        # Value for the CIDR block.

        @[JSON::Field(key: "CidrBlock")]
        getter cidr_block : String?

        # The location name of the CIDR block.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String?

        def initialize(
          @cidr_block : String? = nil,
          @location_name : String? = nil
        )
        end
      end

      # A complex type that identifies a CIDR collection.

      struct CidrCollection
        include JSON::Serializable

        # The ARN of the collection. Can be used to reference the collection in IAM policy or in another
        # Amazon Web Services account.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique ID of the CIDR collection.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of a CIDR collection.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A sequential counter that Route 53 sets to 1 when you create a CIDR collection and increments by 1
        # each time you update settings for the CIDR collection.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # A CIDR collection with this name and a different caller reference already exists in this account.

      struct CidrCollectionAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about the CIDR collection change.

      struct CidrCollectionChange
        include JSON::Serializable

        # CIDR collection change action.

        @[JSON::Field(key: "Action")]
        getter action : String

        # List of CIDR blocks.

        @[JSON::Field(key: "CidrList")]
        getter cidr_list : Array(String)

        # Name of the location that is associated with the CIDR collection.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String

        def initialize(
          @action : String,
          @cidr_list : Array(String),
          @location_name : String
        )
        end
      end

      # This CIDR collection is in use, and isn't empty.

      struct CidrCollectionInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CIDR collection version you provided, doesn't match the one in the ListCidrCollections
      # operation.

      struct CidrCollectionVersionMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The object that is specified in resource record set object when you are linking a resource record
      # set to a CIDR location. A LocationName with an asterisk “*” can be used to create a default CIDR
      # record. CollectionId is still required for default record.

      struct CidrRoutingConfig
        include JSON::Serializable

        # The CIDR collection ID.

        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # The CIDR collection location name.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String

        def initialize(
          @collection_id : String,
          @location_name : String
        )
        end
      end

      # A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is
      # monitoring for this health check.

      struct CloudWatchAlarmConfiguration
        include JSON::Serializable

        # For the metric that the CloudWatch alarm is associated with, the arithmetic operation that is used
        # for the comparison.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # For the metric that the CloudWatch alarm is associated with, the number of periods that the metric
        # is compared to the threshold.

        @[JSON::Field(key: "EvaluationPeriods")]
        getter evaluation_periods : Int32

        # The name of the CloudWatch metric that the alarm is associated with.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The namespace of the metric that the alarm is associated with. For more information, see Amazon
        # CloudWatch Namespaces, Dimensions, and Metrics Reference in the Amazon CloudWatch User Guide .

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # For the metric that the CloudWatch alarm is associated with, the duration of one evaluation period
        # in seconds.

        @[JSON::Field(key: "Period")]
        getter period : Int32

        # For the metric that the CloudWatch alarm is associated with, the statistic that is applied to the
        # metric.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String

        # For the metric that the CloudWatch alarm is associated with, the value the metric is compared with.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64

        # For the metric that the CloudWatch alarm is associated with, a complex type that contains
        # information about the dimensions for the metric. For information, see Amazon CloudWatch Namespaces,
        # Dimensions, and Metrics Reference in the Amazon CloudWatch User Guide .

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        def initialize(
          @comparison_operator : String,
          @evaluation_periods : Int32,
          @metric_name : String,
          @namespace : String,
          @period : Int32,
          @statistic : String,
          @threshold : Float64,
          @dimensions : Array(Types::Dimension)? = nil
        )
        end
      end

      # A complex type that is an entry in an CidrCollection array.

      struct CollectionSummary
        include JSON::Serializable

        # The ARN of the collection summary. Can be used to reference the collection in IAM policy or
        # cross-account.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Unique ID for the CIDR collection.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of a CIDR collection.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A sequential counter that Route 53 sets to 1 when you create a CIDR collection and increments by 1
        # each time you update settings for the CIDR collection.

        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Another user submitted a request to create, update, or delete the object at the same time that you
      # did. Retry the request.

      struct ConcurrentModification
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The cause of this error depends on the operation that you're performing: Create a public hosted
      # zone: Two hosted zones that have the same name or that have a parent/child relationship (example.com
      # and test.example.com) can't have any common name servers. You tried to create a hosted zone that has
      # the same name as an existing hosted zone or that's the parent or child of an existing hosted zone,
      # and you specified a delegation set that shares one or more name servers with the existing hosted
      # zone. For more information, see CreateReusableDelegationSet . Create a private hosted zone: A hosted
      # zone with the specified name already exists and is already associated with the Amazon VPC that you
      # specified. Associate VPCs with a private hosted zone: The VPC that you specified is already
      # associated with another hosted zone that has the same name.

      struct ConflictingDomainExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You tried to update a traffic policy instance by using a traffic policy version that has a different
      # DNS type than the current type for the instance. You specified the type in the JSON document in the
      # CreateTrafficPolicy or CreateTrafficPolicyVersion request.

      struct ConflictingTypes
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that lists the coordinates for a geoproximity resource record.

      struct Coordinates
        include JSON::Serializable

        # Specifies a coordinate of the north–south position of a geographic point on the surface of the Earth
        # (-90 - 90).

        @[JSON::Field(key: "Latitude")]
        getter latitude : String

        # Specifies a coordinate of the east–west position of a geographic point on the surface of the Earth
        # (-180 - 180).

        @[JSON::Field(key: "Longitude")]
        getter longitude : String

        def initialize(
          @latitude : String,
          @longitude : String
        )
        end
      end


      struct CreateCidrCollectionRequest
        include JSON::Serializable

        # A client-specific token that allows requests to be securely retried so that the intended outcome
        # will only occur once, retries receive a similar response, and there are no additional edge cases to
        # handle.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A unique identifier for the account that can be used to reference the collection from other API
        # calls.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @caller_reference : String,
          @name : String
        )
        end
      end


      struct CreateCidrCollectionResponse
        include JSON::Serializable

        # A complex type that contains information about the CIDR collection.

        @[JSON::Field(key: "Collection")]
        getter collection : Types::CidrCollection?

        # A unique URL that represents the location for the CIDR collection.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @collection : Types::CidrCollection? = nil,
          @location : String? = nil
        )
        end
      end

      # A complex type that contains the health check request information.

      struct CreateHealthCheckRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows you to retry a failed CreateHealthCheck
        # request without the risk of creating two identical health checks: If you send a CreateHealthCheck
        # request with the same CallerReference and settings as a previous request, and if the health check
        # doesn't exist, Amazon Route 53 creates the health check. If the health check does exist, Route 53
        # returns the health check configuration in the response. If you send a CreateHealthCheck request with
        # the same CallerReference as a deleted health check, regardless of the settings, Route 53 returns a
        # HealthCheckAlreadyExists error. If you send a CreateHealthCheck request with the same
        # CallerReference as an existing health check but with different settings, Route 53 returns a
        # HealthCheckAlreadyExists error. If you send a CreateHealthCheck request with a unique
        # CallerReference but settings identical to an existing health check, Route 53 creates the health
        # check. Route 53 does not store the CallerReference for a deleted health check indefinitely. The
        # CallerReference for a deleted health check will be deleted after a number of days.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A complex type that contains settings for a new health check.

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig

        def initialize(
          @caller_reference : String,
          @health_check_config : Types::HealthCheckConfig
        )
        end
      end

      # A complex type containing the response information for the new health check.

      struct CreateHealthCheckResponse
        include JSON::Serializable

        # A complex type that contains identifying information about the health check.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck

        # The unique URL representing the new health check.

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @health_check : Types::HealthCheck,
          @location : String
        )
        end
      end

      # A complex type that contains information about the request to create a public or private hosted
      # zone.

      struct CreateHostedZoneRequest
        include JSON::Serializable

        # A unique string that identifies the request and that allows failed CreateHostedZone requests to be
        # retried without the risk of executing the operation twice. You must use a unique CallerReference
        # string every time you submit a CreateHostedZone request. CallerReference can be any unique string,
        # for example, a date/time stamp.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # The name of the domain. Specify a fully qualified domain name, for example, www.example.com . The
        # trailing dot is optional; Amazon Route 53 assumes that the domain name is fully qualified. This
        # means that Route 53 treats www.example.com (without a trailing dot) and www.example.com. (with a
        # trailing dot) as identical. If you're creating a public hosted zone, this is the name you have
        # registered with your DNS registrar. If your domain name is registered with a registrar other than
        # Route 53, change the name servers for your domain to the set of NameServers that CreateHostedZone
        # returns in DelegationSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        # If you want to associate a reusable delegation set with this hosted zone, the ID that Amazon Route
        # 53 assigned to the reusable delegation set when you created it. For more information about reusable
        # delegation sets, see CreateReusableDelegationSet . If you are using a reusable delegation set to
        # create a public hosted zone for a subdomain, make sure that the parent hosted zone doesn't use one
        # or more of the same name servers. If you have overlapping nameservers, the operation will cause a
        # ConflictingDomainsExist error.

        @[JSON::Field(key: "DelegationSetId")]
        getter delegation_set_id : String?

        # (Optional) A complex type that contains the following optional values: For public and private hosted
        # zones, an optional comment For private hosted zones, an optional PrivateZone element If you don't
        # specify a comment or the PrivateZone element, omit HostedZoneConfig and the other elements.

        @[JSON::Field(key: "HostedZoneConfig")]
        getter hosted_zone_config : Types::HostedZoneConfig?

        # (Private hosted zones only) A complex type that contains information about the Amazon VPC that
        # you're associating with this hosted zone. You can specify only one Amazon VPC when you create a
        # private hosted zone. If you are associating a VPC with a hosted zone with this request, the
        # paramaters VPCId and VPCRegion are also required. To associate additional Amazon VPCs with the
        # hosted zone, use AssociateVPCWithHostedZone after you create a hosted zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC?

        def initialize(
          @caller_reference : String,
          @name : String,
          @delegation_set_id : String? = nil,
          @hosted_zone_config : Types::HostedZoneConfig? = nil,
          @vpc : Types::VPC? = nil
        )
        end
      end

      # A complex type containing the response information for the hosted zone.

      struct CreateHostedZoneResponse
        include JSON::Serializable

        # A complex type that contains information about the CreateHostedZone request.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        # A complex type that describes the name servers for this hosted zone.

        @[JSON::Field(key: "DelegationSet")]
        getter delegation_set : Types::DelegationSet

        # A complex type that contains general information about the hosted zone.

        @[JSON::Field(key: "HostedZone")]
        getter hosted_zone : Types::HostedZone

        # The unique URL representing the new hosted zone.

        @[JSON::Field(key: "Location")]
        getter location : String

        # A complex type that contains information about an Amazon VPC that you associated with this hosted
        # zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC?

        def initialize(
          @change_info : Types::ChangeInfo,
          @delegation_set : Types::DelegationSet,
          @hosted_zone : Types::HostedZone,
          @location : String,
          @vpc : Types::VPC? = nil
        )
        end
      end


      struct CreateKeySigningKeyRequest
        include JSON::Serializable

        # A unique string that identifies the request.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # The unique string (ID) used to identify a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The Amazon resource name (ARN) for a customer managed key in Key Management Service (KMS). The
        # KeyManagementServiceArn must be unique for each key-signing key (KSK) in a single hosted zone. To
        # see an example of KeyManagementServiceArn that grants the correct permissions for DNSSEC, scroll
        # down to Example . You must configure the customer managed customer managed key as follows: Status
        # Enabled Key spec ECC_NIST_P256 Key usage Sign and verify Key policy The key policy must give
        # permission for the following actions: DescribeKey GetPublicKey Sign The key policy must also include
        # the Amazon Route 53 service in the principal for your account. Specify the following: "Service":
        # "dnssec-route53.amazonaws.com" For more information about working with a customer managed key in
        # KMS, see Key Management Service concepts .

        @[JSON::Field(key: "KeyManagementServiceArn")]
        getter key_management_service_arn : String

        # A string used to identify a key-signing key (KSK). Name can include numbers, letters, and
        # underscores (_). Name must be unique for each key-signing key in the same hosted zone.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A string specifying the initial status of the key-signing key (KSK). You can set the value to ACTIVE
        # or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @caller_reference : String,
          @hosted_zone_id : String,
          @key_management_service_arn : String,
          @name : String,
          @status : String
        )
        end
      end


      struct CreateKeySigningKeyResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        # The key-signing key (KSK) that the request creates.

        @[JSON::Field(key: "KeySigningKey")]
        getter key_signing_key : Types::KeySigningKey

        # The unique URL representing the new key-signing key (KSK).

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @change_info : Types::ChangeInfo,
          @key_signing_key : Types::KeySigningKey,
          @location : String
        )
        end
      end


      struct CreateQueryLoggingConfigRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the log group that you want to Amazon Route 53 to send query logs
        # to. This is the format of the ARN: arn:aws:logs: region : account-id :log-group: log_group_name To
        # get the ARN for a log group, you can use the CloudWatch console, the DescribeLogGroups API action,
        # the describe-log-groups command, or the applicable command in one of the Amazon Web Services SDKs.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String

        # The ID of the hosted zone that you want to log queries for. You can log queries only for public
        # hosted zones.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        def initialize(
          @cloud_watch_logs_log_group_arn : String,
          @hosted_zone_id : String
        )
        end
      end


      struct CreateQueryLoggingConfigResponse
        include JSON::Serializable

        # The unique URL representing the new query logging configuration.

        @[JSON::Field(key: "Location")]
        getter location : String

        # A complex type that contains the ID for a query logging configuration, the ID of the hosted zone
        # that you want to log queries for, and the ARN for the log group that you want Amazon Route 53 to
        # send query logs to.

        @[JSON::Field(key: "QueryLoggingConfig")]
        getter query_logging_config : Types::QueryLoggingConfig

        def initialize(
          @location : String,
          @query_logging_config : Types::QueryLoggingConfig
        )
        end
      end


      struct CreateReusableDelegationSetRequest
        include JSON::Serializable

        # A unique string that identifies the request, and that allows you to retry failed
        # CreateReusableDelegationSet requests without the risk of executing the operation twice. You must use
        # a unique CallerReference string every time you submit a CreateReusableDelegationSet request.
        # CallerReference can be any unique string, for example a date/time stamp.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # If you want to mark the delegation set for an existing hosted zone as reusable, the ID for that
        # hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        def initialize(
          @caller_reference : String,
          @hosted_zone_id : String? = nil
        )
        end
      end


      struct CreateReusableDelegationSetResponse
        include JSON::Serializable

        # A complex type that contains name server information.

        @[JSON::Field(key: "DelegationSet")]
        getter delegation_set : Types::DelegationSet

        # The unique URL representing the new reusable delegation set.

        @[JSON::Field(key: "Location")]
        getter location : String

        def initialize(
          @delegation_set : Types::DelegationSet,
          @location : String
        )
        end
      end

      # A complex type that contains information about the resource record sets that you want to create
      # based on a specified traffic policy.

      struct CreateTrafficPolicyInstanceRequest
        include JSON::Serializable

        # The ID of the hosted zone that you want Amazon Route 53 to create resource record sets in by using
        # the configuration in a traffic policy.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The domain name (such as example.com) or subdomain name (such as www.example.com) for which Amazon
        # Route 53 responds to DNS queries by using the resource record sets that Route 53 creates for this
        # traffic policy instance.

        @[JSON::Field(key: "Name")]
        getter name : String

        # (Optional) The TTL that you want Amazon Route 53 to assign to all of the resource record sets that
        # it creates in the specified hosted zone.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        # The ID of the traffic policy that you want to use to create resource record sets in the specified
        # hosted zone.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # The version of the traffic policy that you want to use to create resource record sets in the
        # specified hosted zone.

        @[JSON::Field(key: "TrafficPolicyVersion")]
        getter traffic_policy_version : Int32

        def initialize(
          @hosted_zone_id : String,
          @name : String,
          @ttl : Int64,
          @traffic_policy_id : String,
          @traffic_policy_version : Int32
        )
        end
      end

      # A complex type that contains the response information for the CreateTrafficPolicyInstance request.

      struct CreateTrafficPolicyInstanceResponse
        include JSON::Serializable

        # A unique URL that represents a new traffic policy instance.

        @[JSON::Field(key: "Location")]
        getter location : String

        # A complex type that contains settings for the new traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyInstance")]
        getter traffic_policy_instance : Types::TrafficPolicyInstance

        def initialize(
          @location : String,
          @traffic_policy_instance : Types::TrafficPolicyInstance
        )
        end
      end

      # A complex type that contains information about the traffic policy that you want to create.

      struct CreateTrafficPolicyRequest
        include JSON::Serializable

        # The definition of this traffic policy in JSON format. For more information, see Traffic Policy
        # Document Format .

        @[JSON::Field(key: "Document")]
        getter document : String

        # The name of the traffic policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # (Optional) Any comments that you want to include about the traffic policy.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @document : String,
          @name : String,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the CreateTrafficPolicy request.

      struct CreateTrafficPolicyResponse
        include JSON::Serializable

        # A unique URL that represents a new traffic policy.

        @[JSON::Field(key: "Location")]
        getter location : String

        # A complex type that contains settings for the new traffic policy.

        @[JSON::Field(key: "TrafficPolicy")]
        getter traffic_policy : Types::TrafficPolicy

        def initialize(
          @location : String,
          @traffic_policy : Types::TrafficPolicy
        )
        end
      end

      # A complex type that contains information about the traffic policy that you want to create a new
      # version for.

      struct CreateTrafficPolicyVersionRequest
        include JSON::Serializable

        # The definition of this version of the traffic policy, in JSON format. You specified the JSON in the
        # CreateTrafficPolicyVersion request. For more information about the JSON format, see
        # CreateTrafficPolicy .

        @[JSON::Field(key: "Document")]
        getter document : String

        # The ID of the traffic policy for which you want to create a new version.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The comment that you specified in the CreateTrafficPolicyVersion request, if any.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @document : String,
          @id : String,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the CreateTrafficPolicyVersion request.

      struct CreateTrafficPolicyVersionResponse
        include JSON::Serializable

        # A unique URL that represents a new traffic policy version.

        @[JSON::Field(key: "Location")]
        getter location : String

        # A complex type that contains settings for the new version of the traffic policy.

        @[JSON::Field(key: "TrafficPolicy")]
        getter traffic_policy : Types::TrafficPolicy

        def initialize(
          @location : String,
          @traffic_policy : Types::TrafficPolicy
        )
        end
      end

      # A complex type that contains information about the request to authorize associating a VPC with your
      # private hosted zone. Authorization is only required when a private hosted zone and a VPC were
      # created by using different accounts.

      struct CreateVPCAssociationAuthorizationRequest
        include JSON::Serializable

        # The ID of the private hosted zone that you want to authorize associating a VPC with.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # A complex type that contains the VPC ID and region for the VPC that you want to authorize
        # associating with your hosted zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC

        def initialize(
          @hosted_zone_id : String,
          @vpc : Types::VPC
        )
        end
      end

      # A complex type that contains the response information from a CreateVPCAssociationAuthorization
      # request.

      struct CreateVPCAssociationAuthorizationResponse
        include JSON::Serializable

        # The ID of the hosted zone that you authorized associating a VPC with.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The VPC that you authorized associating with a hosted zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC

        def initialize(
          @hosted_zone_id : String,
          @vpc : Types::VPC
        )
        end
      end

      # The hosted zone doesn't have any DNSSEC resources.

      struct DNSSECNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A string representing the status of DNSSEC signing.

      struct DNSSECStatus
        include JSON::Serializable

        # A string that represents the current hosted zone signing status. Status can have one of the
        # following values: SIGNING DNSSEC signing is enabled for the hosted zone. NOT_SIGNING DNSSEC signing
        # is not enabled for the hosted zone. DELETING DNSSEC signing is in the process of being removed for
        # the hosted zone. ACTION_NEEDED There is a problem with signing in the hosted zone that requires you
        # to take action to resolve. For example, the customer managed key might have been deleted, or the
        # permissions for the customer managed key might have been changed. INTERNAL_FAILURE There was an
        # error during a request. Before you can continue to work with DNSSEC signing, including with
        # key-signing keys (KSKs), you must correct the problem by enabling or disabling DNSSEC signing for
        # the hosted zone.

        @[JSON::Field(key: "ServeSignature")]
        getter serve_signature : String?

        # The status message provided for the following DNSSEC signing status: INTERNAL_FAILURE . The status
        # message includes information about what the problem might be and steps that you can take to correct
        # the issue.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @serve_signature : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct DeactivateKeySigningKeyRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # A string used to identify a key-signing key (KSK).

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @hosted_zone_id : String,
          @name : String
        )
        end
      end


      struct DeactivateKeySigningKeyResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # A complex type that lists the name servers in a delegation set, as well as the CallerReference and
      # the ID for the delegation set.

      struct DelegationSet
        include JSON::Serializable

        # A complex type that contains a list of the authoritative name servers for a hosted zone or for a
        # reusable delegation set.

        @[JSON::Field(key: "NameServers")]
        getter name_servers : Array(String)

        # The value that you specified for CallerReference when you created the reusable delegation set.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String?

        # The ID that Amazon Route 53 assigns to a reusable delegation set.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @name_servers : Array(String),
          @caller_reference : String? = nil,
          @id : String? = nil
        )
        end
      end

      # A delegation set with the same owner and caller reference combination has already been created.

      struct DelegationSetAlreadyCreated
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified delegation set has already been marked as reusable.

      struct DelegationSetAlreadyReusable
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified delegation contains associated hosted zones which must be deleted before the reusable
      # delegation set can be deleted.

      struct DelegationSetInUse
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can create a hosted zone that has the same name as an existing hosted zone (example.com is
      # common), but there is a limit to the number of hosted zones that have the same name. If you get this
      # error, Amazon Route 53 has reached that limit. If you own the domain name and Route 53 generates
      # this error, contact Customer Support.

      struct DelegationSetNotAvailable
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A reusable delegation set with the specified ID does not exist.

      struct DelegationSetNotReusable
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteCidrCollectionRequest
        include JSON::Serializable

        # The UUID of the collection to delete.

        @[JSON::Field(key: "CidrCollectionId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteCidrCollectionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This action deletes a health check.

      struct DeleteHealthCheckRequest
        include JSON::Serializable

        # The ID of the health check that you want to delete.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String

        def initialize(
          @health_check_id : String
        )
        end
      end

      # An empty element.

      struct DeleteHealthCheckResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a hosted zone.

      struct DeleteHostedZoneRequest
        include JSON::Serializable

        # The ID of the hosted zone you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that contains the response to a DeleteHostedZone request.

      struct DeleteHostedZoneResponse
        include JSON::Serializable

        # A complex type that contains the ID, the status, and the date and time of a request to delete a
        # hosted zone.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end


      struct DeleteKeySigningKeyRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # A string used to identify a key-signing key (KSK).

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @hosted_zone_id : String,
          @name : String
        )
        end
      end


      struct DeleteKeySigningKeyResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end


      struct DeleteQueryLoggingConfigRequest
        include JSON::Serializable

        # The ID of the configuration that you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteQueryLoggingConfigResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a reusable delegation set.

      struct DeleteReusableDelegationSetRequest
        include JSON::Serializable

        # The ID of the reusable delegation set that you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # An empty element.

      struct DeleteReusableDelegationSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a specified traffic policy instance.

      struct DeleteTrafficPolicyInstanceRequest
        include JSON::Serializable

        # The ID of the traffic policy instance that you want to delete. When you delete a traffic policy
        # instance, Amazon Route 53 also deletes all of the resource record sets that were created when you
        # created the traffic policy instance.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # An empty element.

      struct DeleteTrafficPolicyInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a specified traffic policy version.

      struct DeleteTrafficPolicyRequest
        include JSON::Serializable

        # The ID of the traffic policy that you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version number of the traffic policy that you want to delete.

        @[JSON::Field(key: "Version")]
        getter version : Int32

        def initialize(
          @id : String,
          @version : Int32
        )
        end
      end

      # An empty element.

      struct DeleteTrafficPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains information about the request to remove authorization to associate a
      # VPC that was created by one Amazon Web Services account with a hosted zone that was created with a
      # different Amazon Web Services account.

      struct DeleteVPCAssociationAuthorizationRequest
        include JSON::Serializable

        # When removing authorization to associate a VPC that was created by one Amazon Web Services account
        # with a hosted zone that was created with a different Amazon Web Services account, the ID of the
        # hosted zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # When removing authorization to associate a VPC that was created by one Amazon Web Services account
        # with a hosted zone that was created with a different Amazon Web Services account, a complex type
        # that includes the ID and region of the VPC.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC

        def initialize(
          @hosted_zone_id : String,
          @vpc : Types::VPC
        )
        end
      end

      # Empty response for the request.

      struct DeleteVPCAssociationAuthorizationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # For the metric that the CloudWatch alarm is associated with, a complex type that contains
      # information about one dimension.

      struct Dimension
        include JSON::Serializable

        # For the metric that the CloudWatch alarm is associated with, the name of one dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # For the metric that the CloudWatch alarm is associated with, the value of one dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end


      struct DisableHostedZoneDNSSECRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        def initialize(
          @hosted_zone_id : String
        )
        end
      end


      struct DisableHostedZoneDNSSECResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # A complex type that contains information about the VPC that you want to disassociate from a
      # specified private hosted zone.

      struct DisassociateVPCFromHostedZoneRequest
        include JSON::Serializable

        # The ID of the private hosted zone that you want to disassociate a VPC from.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # A complex type that contains information about the VPC that you're disassociating from the specified
        # hosted zone.

        @[JSON::Field(key: "VPC")]
        getter vpc : Types::VPC

        # Optional: A comment about the disassociation request.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @hosted_zone_id : String,
          @vpc : Types::VPC,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the disassociate request.

      struct DisassociateVPCFromHostedZoneResponse
        include JSON::Serializable

        # A complex type that describes the changes made to the specified private hosted zone.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end


      struct EnableHostedZoneDNSSECRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        def initialize(
          @hosted_zone_id : String
        )
        end
      end


      struct EnableHostedZoneDNSSECResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # A complex type that contains information about a geographic location.

      struct GeoLocation
        include JSON::Serializable

        # The two-letter code for the continent. Amazon Route 53 supports the following continent codes: AF :
        # Africa AN : Antarctica AS : Asia EU : Europe OC : Oceania NA : North America SA : South America
        # Constraint: Specifying ContinentCode with either CountryCode or SubdivisionCode returns an
        # InvalidInput error.

        @[JSON::Field(key: "ContinentCode")]
        getter continent_code : String?

        # For geolocation resource record sets, the two-letter code for a country. Amazon Route 53 uses the
        # two-letter country codes that are specified in ISO standard 3166-1 alpha-2 . Route 53 also supports
        # the country code UA for Ukraine.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # For geolocation resource record sets, the two-letter code for a state of the United States. Route 53
        # doesn't support any other values for SubdivisionCode . For a list of state abbreviations, see
        # Appendix B: Two–Letter State and Possession Abbreviations on the United States Postal Service
        # website. If you specify subdivisioncode , you must also specify US for CountryCode .

        @[JSON::Field(key: "SubdivisionCode")]
        getter subdivision_code : String?

        def initialize(
          @continent_code : String? = nil,
          @country_code : String? = nil,
          @subdivision_code : String? = nil
        )
        end
      end

      # A complex type that contains the codes and full continent, country, and subdivision names for the
      # specified geolocation code.

      struct GeoLocationDetails
        include JSON::Serializable

        # The two-letter code for the continent.

        @[JSON::Field(key: "ContinentCode")]
        getter continent_code : String?

        # The full name of the continent.

        @[JSON::Field(key: "ContinentName")]
        getter continent_name : String?

        # The two-letter code for the country.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # The name of the country.

        @[JSON::Field(key: "CountryName")]
        getter country_name : String?

        # The code for the subdivision, such as a particular state within the United States. For a list of US
        # state abbreviations, see Appendix B: Two–Letter State and Possession Abbreviations on the United
        # States Postal Service website. For a list of all supported subdivision codes, use the
        # ListGeoLocations API.

        @[JSON::Field(key: "SubdivisionCode")]
        getter subdivision_code : String?

        # The full name of the subdivision. Route 53 currently supports only states in the United States.

        @[JSON::Field(key: "SubdivisionName")]
        getter subdivision_name : String?

        def initialize(
          @continent_code : String? = nil,
          @continent_name : String? = nil,
          @country_code : String? = nil,
          @country_name : String? = nil,
          @subdivision_code : String? = nil,
          @subdivision_name : String? = nil
        )
        end
      end

      # (Resource record sets only): A complex type that lets you specify where your resources are located.
      # Only one of LocalZoneGroup , Coordinates , or Amazon Web ServicesRegion is allowed per request at a
      # time. For more information about geoproximity routing, see Geoproximity routing in the Amazon Route
      # 53 Developer Guide .

      struct GeoProximityLocation
        include JSON::Serializable

        # The Amazon Web Services Region the resource you are directing DNS traffic to, is in.

        @[JSON::Field(key: "AWSRegion")]
        getter aws_region : String?

        # The bias increases or decreases the size of the geographic region from which Route 53 routes traffic
        # to a resource. To use Bias to change the size of the geographic region, specify the applicable value
        # for the bias: To expand the size of the geographic region from which Route 53 routes traffic to a
        # resource, specify a positive integer from 1 to 99 for the bias. Route 53 shrinks the size of
        # adjacent regions. To shrink the size of the geographic region from which Route 53 routes traffic to
        # a resource, specify a negative bias of -1 to -99. Route 53 expands the size of adjacent regions.

        @[JSON::Field(key: "Bias")]
        getter bias : Int32?

        # Contains the longitude and latitude for a geographic region.

        @[JSON::Field(key: "Coordinates")]
        getter coordinates : Types::Coordinates?

        # Specifies an Amazon Web Services Local Zone Group. A local Zone Group is usually the Local Zone code
        # without the ending character. For example, if the Local Zone is us-east-1-bue-1a the Local Zone
        # Group is us-east-1-bue-1 . You can identify the Local Zones Group for a specific Local Zone by using
        # the describe-availability-zones CLI command: This command returns: "GroupName": "us-west-2-den-1" ,
        # specifying that the Local Zone us-west-2-den-1a belongs to the Local Zone Group us-west-2-den-1 .

        @[JSON::Field(key: "LocalZoneGroup")]
        getter local_zone_group : String?

        def initialize(
          @aws_region : String? = nil,
          @bias : Int32? = nil,
          @coordinates : Types::Coordinates? = nil,
          @local_zone_group : String? = nil
        )
        end
      end

      # A complex type that contains information about the request to create a hosted zone.

      struct GetAccountLimitRequest
        include JSON::Serializable

        # The limit that you want to get. Valid values include the following: MAX_HEALTH_CHECKS_BY_OWNER : The
        # maximum number of health checks that you can create using the current account.
        # MAX_HOSTED_ZONES_BY_OWNER : The maximum number of hosted zones that you can create using the current
        # account. MAX_REUSABLE_DELEGATION_SETS_BY_OWNER : The maximum number of reusable delegation sets that
        # you can create using the current account. MAX_TRAFFIC_POLICIES_BY_OWNER : The maximum number of
        # traffic policies that you can create using the current account.
        # MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER : The maximum number of traffic policy instances that you can
        # create using the current account. (Traffic policy instances are referred to as traffic flow policy
        # records in the Amazon Route 53 console.)

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # A complex type that contains the requested limit.

      struct GetAccountLimitResponse
        include JSON::Serializable

        # The current number of entities that you have created of the specified type. For example, if you
        # specified MAX_HEALTH_CHECKS_BY_OWNER for the value of Type in the request, the value of Count is the
        # current number of health checks that you have created using the current account.

        @[JSON::Field(key: "Count")]
        getter count : Int64

        # The current setting for the specified limit. For example, if you specified
        # MAX_HEALTH_CHECKS_BY_OWNER for the value of Type in the request, the value of Limit is the maximum
        # number of health checks that you can create using the current account.

        @[JSON::Field(key: "Limit")]
        getter limit : Types::AccountLimit

        def initialize(
          @count : Int64,
          @limit : Types::AccountLimit
        )
        end
      end

      # The input for a GetChange request.

      struct GetChangeRequest
        include JSON::Serializable

        # The ID of the change batch request. The value that you specify here is the value that
        # ChangeResourceRecordSets returned in the Id element when you submitted the request.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that contains the ChangeInfo element.

      struct GetChangeResponse
        include JSON::Serializable

        # A complex type that contains information about the specified change batch.

        @[JSON::Field(key: "ChangeInfo")]
        getter change_info : Types::ChangeInfo

        def initialize(
          @change_info : Types::ChangeInfo
        )
        end
      end

      # Empty request.

      struct GetCheckerIpRangesRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains the CheckerIpRanges element.

      struct GetCheckerIpRangesResponse
        include JSON::Serializable

        # A complex type that contains sorted list of IP ranges in CIDR format for Amazon Route 53 health
        # checkers.

        @[JSON::Field(key: "CheckerIpRanges")]
        getter checker_ip_ranges : Array(String)

        def initialize(
          @checker_ip_ranges : Array(String)
        )
        end
      end


      struct GetDNSSECRequest
        include JSON::Serializable

        # A unique string used to identify a hosted zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        def initialize(
          @hosted_zone_id : String
        )
        end
      end


      struct GetDNSSECResponse
        include JSON::Serializable

        # The key-signing keys (KSKs) in your account.

        @[JSON::Field(key: "KeySigningKeys")]
        getter key_signing_keys : Array(Types::KeySigningKey)

        # A string representing the status of DNSSEC.

        @[JSON::Field(key: "Status")]
        getter status : Types::DNSSECStatus

        def initialize(
          @key_signing_keys : Array(Types::KeySigningKey),
          @status : Types::DNSSECStatus
        )
        end
      end

      # A request for information about whether a specified geographic location is supported for Amazon
      # Route 53 geolocation resource record sets.

      struct GetGeoLocationRequest
        include JSON::Serializable

        # For geolocation resource record sets, a two-letter abbreviation that identifies a continent. Amazon
        # Route 53 supports the following continent codes: AF : Africa AN : Antarctica AS : Asia EU : Europe
        # OC : Oceania NA : North America SA : South America

        @[JSON::Field(key: "continentcode")]
        getter continent_code : String?

        # Amazon Route 53 uses the two-letter country codes that are specified in ISO standard 3166-1 alpha-2
        # . Route 53 also supports the country code UA for Ukraine.

        @[JSON::Field(key: "countrycode")]
        getter country_code : String?

        # The code for the subdivision, such as a particular state within the United States. For a list of US
        # state abbreviations, see Appendix B: Two–Letter State and Possession Abbreviations on the United
        # States Postal Service website. For a list of all supported subdivision codes, use the
        # ListGeoLocations API.

        @[JSON::Field(key: "subdivisioncode")]
        getter subdivision_code : String?

        def initialize(
          @continent_code : String? = nil,
          @country_code : String? = nil,
          @subdivision_code : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the specified geolocation code.

      struct GetGeoLocationResponse
        include JSON::Serializable

        # A complex type that contains the codes and full continent, country, and subdivision names for the
        # specified geolocation code.

        @[JSON::Field(key: "GeoLocationDetails")]
        getter geo_location_details : Types::GeoLocationDetails

        def initialize(
          @geo_location_details : Types::GeoLocationDetails
        )
        end
      end

      # A request for the number of health checks that are associated with the current Amazon Web Services
      # account.

      struct GetHealthCheckCountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains the response to a GetHealthCheckCount request.

      struct GetHealthCheckCountResponse
        include JSON::Serializable

        # The number of health checks associated with the current Amazon Web Services account.

        @[JSON::Field(key: "HealthCheckCount")]
        getter health_check_count : Int64

        def initialize(
          @health_check_count : Int64
        )
        end
      end

      # A request for the reason that a health check failed most recently.

      struct GetHealthCheckLastFailureReasonRequest
        include JSON::Serializable

        # The ID for the health check for which you want the last failure reason. When you created the health
        # check, CreateHealthCheck returned the ID in the response, in the HealthCheckId element. If you want
        # to get the last failure reason for a calculated health check, you must use the Amazon Route 53
        # console or the CloudWatch console. You can't use GetHealthCheckLastFailureReason for a calculated
        # health check.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String

        def initialize(
          @health_check_id : String
        )
        end
      end

      # A complex type that contains the response to a GetHealthCheckLastFailureReason request.

      struct GetHealthCheckLastFailureReasonResponse
        include JSON::Serializable

        # A list that contains one Observation element for each Amazon Route 53 health checker that is
        # reporting a last failure reason.

        @[JSON::Field(key: "HealthCheckObservations")]
        getter health_check_observations : Array(Types::HealthCheckObservation)

        def initialize(
          @health_check_observations : Array(Types::HealthCheckObservation)
        )
        end
      end

      # A request to get information about a specified health check.

      struct GetHealthCheckRequest
        include JSON::Serializable

        # The identifier that Amazon Route 53 assigned to the health check when you created it. When you add
        # or update a resource record set, you use this value to specify which health check to use. The value
        # can be up to 64 characters long.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String

        def initialize(
          @health_check_id : String
        )
        end
      end

      # A complex type that contains the response to a GetHealthCheck request.

      struct GetHealthCheckResponse
        include JSON::Serializable

        # A complex type that contains information about one health check that is associated with the current
        # Amazon Web Services account.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck

        def initialize(
          @health_check : Types::HealthCheck
        )
        end
      end

      # A request to get the status for a health check.

      struct GetHealthCheckStatusRequest
        include JSON::Serializable

        # The ID for the health check that you want the current status for. When you created the health check,
        # CreateHealthCheck returned the ID in the response, in the HealthCheckId element. If you want to
        # check the status of a calculated health check, you must use the Amazon Route 53 console or the
        # CloudWatch console. You can't use GetHealthCheckStatus to get the status of a calculated health
        # check.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String

        def initialize(
          @health_check_id : String
        )
        end
      end

      # A complex type that contains the response to a GetHealthCheck request.

      struct GetHealthCheckStatusResponse
        include JSON::Serializable

        # A list that contains one HealthCheckObservation element for each Amazon Route 53 health checker that
        # is reporting a status about the health check endpoint.

        @[JSON::Field(key: "HealthCheckObservations")]
        getter health_check_observations : Array(Types::HealthCheckObservation)

        def initialize(
          @health_check_observations : Array(Types::HealthCheckObservation)
        )
        end
      end

      # A request to retrieve a count of all the hosted zones that are associated with the current Amazon
      # Web Services account.

      struct GetHostedZoneCountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains the response to a GetHostedZoneCount request.

      struct GetHostedZoneCountResponse
        include JSON::Serializable

        # The total number of public and private hosted zones that are associated with the current Amazon Web
        # Services account.

        @[JSON::Field(key: "HostedZoneCount")]
        getter hosted_zone_count : Int64

        def initialize(
          @hosted_zone_count : Int64
        )
        end
      end

      # A complex type that contains information about the request to create a hosted zone.

      struct GetHostedZoneLimitRequest
        include JSON::Serializable

        # The ID of the hosted zone that you want to get a limit for.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # The limit that you want to get. Valid values include the following: MAX_RRSETS_BY_ZONE : The maximum
        # number of records that you can create in the specified hosted zone. MAX_VPCS_ASSOCIATED_BY_ZONE :
        # The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @hosted_zone_id : String,
          @type : String
        )
        end
      end

      # A complex type that contains the requested limit.

      struct GetHostedZoneLimitResponse
        include JSON::Serializable

        # The current number of entities that you have created of the specified type. For example, if you
        # specified MAX_RRSETS_BY_ZONE for the value of Type in the request, the value of Count is the current
        # number of records that you have created in the specified hosted zone.

        @[JSON::Field(key: "Count")]
        getter count : Int64

        # The current setting for the specified limit. For example, if you specified MAX_RRSETS_BY_ZONE for
        # the value of Type in the request, the value of Limit is the maximum number of records that you can
        # create in the specified hosted zone.

        @[JSON::Field(key: "Limit")]
        getter limit : Types::HostedZoneLimit

        def initialize(
          @count : Int64,
          @limit : Types::HostedZoneLimit
        )
        end
      end

      # A request to get information about a specified hosted zone.

      struct GetHostedZoneRequest
        include JSON::Serializable

        # The ID of the hosted zone that you want to get information about.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that contain the response to a GetHostedZone request.

      struct GetHostedZoneResponse
        include JSON::Serializable

        # A complex type that contains general information about the specified hosted zone.

        @[JSON::Field(key: "HostedZone")]
        getter hosted_zone : Types::HostedZone

        # A complex type that lists the Amazon Route 53 name servers for the specified hosted zone.

        @[JSON::Field(key: "DelegationSet")]
        getter delegation_set : Types::DelegationSet?

        # A complex type that contains information about the VPCs that are associated with the specified
        # hosted zone.

        @[JSON::Field(key: "VPCs")]
        getter vp_cs : Array(Types::VPC)?

        def initialize(
          @hosted_zone : Types::HostedZone,
          @delegation_set : Types::DelegationSet? = nil,
          @vp_cs : Array(Types::VPC)? = nil
        )
        end
      end


      struct GetQueryLoggingConfigRequest
        include JSON::Serializable

        # The ID of the configuration for DNS query logging that you want to get information about.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetQueryLoggingConfigResponse
        include JSON::Serializable

        # A complex type that contains information about the query logging configuration that you specified in
        # a GetQueryLoggingConfig request.

        @[JSON::Field(key: "QueryLoggingConfig")]
        getter query_logging_config : Types::QueryLoggingConfig

        def initialize(
          @query_logging_config : Types::QueryLoggingConfig
        )
        end
      end

      # A complex type that contains information about the request to create a hosted zone.

      struct GetReusableDelegationSetLimitRequest
        include JSON::Serializable

        # The ID of the delegation set that you want to get the limit for.

        @[JSON::Field(key: "Id")]
        getter delegation_set_id : String

        # Specify MAX_ZONES_BY_REUSABLE_DELEGATION_SET to get the maximum number of hosted zones that you can
        # associate with the specified reusable delegation set.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @delegation_set_id : String,
          @type : String
        )
        end
      end

      # A complex type that contains the requested limit.

      struct GetReusableDelegationSetLimitResponse
        include JSON::Serializable

        # The current number of hosted zones that you can associate with the specified reusable delegation
        # set.

        @[JSON::Field(key: "Count")]
        getter count : Int64

        # The current setting for the limit on hosted zones that you can associate with the specified reusable
        # delegation set.

        @[JSON::Field(key: "Limit")]
        getter limit : Types::ReusableDelegationSetLimit

        def initialize(
          @count : Int64,
          @limit : Types::ReusableDelegationSetLimit
        )
        end
      end

      # A request to get information about a specified reusable delegation set.

      struct GetReusableDelegationSetRequest
        include JSON::Serializable

        # The ID of the reusable delegation set that you want to get a list of name servers for.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that contains the response to the GetReusableDelegationSet request.

      struct GetReusableDelegationSetResponse
        include JSON::Serializable

        # A complex type that contains information about the reusable delegation set.

        @[JSON::Field(key: "DelegationSet")]
        getter delegation_set : Types::DelegationSet

        def initialize(
          @delegation_set : Types::DelegationSet
        )
        end
      end

      # Request to get the number of traffic policy instances that are associated with the current Amazon
      # Web Services account.

      struct GetTrafficPolicyInstanceCountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains information about the resource record sets that Amazon Route 53 created
      # based on a specified traffic policy.

      struct GetTrafficPolicyInstanceCountResponse
        include JSON::Serializable

        # The number of traffic policy instances that are associated with the current Amazon Web Services
        # account.

        @[JSON::Field(key: "TrafficPolicyInstanceCount")]
        getter traffic_policy_instance_count : Int32

        def initialize(
          @traffic_policy_instance_count : Int32
        )
        end
      end

      # Gets information about a specified traffic policy instance.

      struct GetTrafficPolicyInstanceRequest
        include JSON::Serializable

        # The ID of the traffic policy instance that you want to get information about.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A complex type that contains information about the resource record sets that Amazon Route 53 created
      # based on a specified traffic policy.

      struct GetTrafficPolicyInstanceResponse
        include JSON::Serializable

        # A complex type that contains settings for the traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyInstance")]
        getter traffic_policy_instance : Types::TrafficPolicyInstance

        def initialize(
          @traffic_policy_instance : Types::TrafficPolicyInstance
        )
        end
      end

      # Gets information about a specific traffic policy version.

      struct GetTrafficPolicyRequest
        include JSON::Serializable

        # The ID of the traffic policy that you want to get information about.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version number of the traffic policy that you want to get information about.

        @[JSON::Field(key: "Version")]
        getter version : Int32

        def initialize(
          @id : String,
          @version : Int32
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct GetTrafficPolicyResponse
        include JSON::Serializable

        # A complex type that contains settings for the specified traffic policy.

        @[JSON::Field(key: "TrafficPolicy")]
        getter traffic_policy : Types::TrafficPolicy

        def initialize(
          @traffic_policy : Types::TrafficPolicy
        )
        end
      end

      # A complex type that contains information about one health check that is associated with the current
      # Amazon Web Services account.

      struct HealthCheck
        include JSON::Serializable

        # A unique string that you specified when you created the health check.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A complex type that contains detailed information about one health check.

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig

        # The version of the health check. You can optionally pass this value in a call to UpdateHealthCheck
        # to prevent overwriting another change to the health check.

        @[JSON::Field(key: "HealthCheckVersion")]
        getter health_check_version : Int64

        # The identifier that Amazon Route 53 assigned to the health check when you created it. When you add
        # or update a resource record set, you use this value to specify which health check to use. The value
        # can be up to 64 characters long.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is
        # monitoring for this health check.

        @[JSON::Field(key: "CloudWatchAlarmConfiguration")]
        getter cloud_watch_alarm_configuration : Types::CloudWatchAlarmConfiguration?

        # If the health check was created by another service, the service that created the health check. When
        # a health check is created by another service, you can't edit or delete it using Amazon Route 53.

        @[JSON::Field(key: "LinkedService")]
        getter linked_service : Types::LinkedService?

        def initialize(
          @caller_reference : String,
          @health_check_config : Types::HealthCheckConfig,
          @health_check_version : Int64,
          @id : String,
          @cloud_watch_alarm_configuration : Types::CloudWatchAlarmConfiguration? = nil,
          @linked_service : Types::LinkedService? = nil
        )
        end
      end

      # The health check you're attempting to create already exists. Amazon Route 53 returns this error when
      # you submit a request that has the following values: The same value for CallerReference as an
      # existing health check, and one or more values that differ from the existing health check that has
      # the same caller reference. The same value for CallerReference as a health check that you created and
      # later deleted, regardless of the other settings in the request.

      struct HealthCheckAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about the health check.

      struct HealthCheckConfig
        include JSON::Serializable

        # The type of health check that you want to create, which indicates how Amazon Route 53 determines
        # whether an endpoint is healthy. You can't change the value of Type after you create a health check.
        # You can create the following types of health checks: HTTP : Route 53 tries to establish a TCP
        # connection. If successful, Route 53 submits an HTTP request and waits for an HTTP status code of 200
        # or greater and less than 400. HTTPS : Route 53 tries to establish a TCP connection. If successful,
        # Route 53 submits an HTTPS request and waits for an HTTP status code of 200 or greater and less than
        # 400. If you specify HTTPS for the value of Type , the endpoint must support TLS v1.0, v1.1, or v1.2.
        # HTTP_STR_MATCH : Route 53 tries to establish a TCP connection. If successful, Route 53 submits an
        # HTTP request and searches the first 5,120 bytes of the response body for the string that you specify
        # in SearchString . HTTPS_STR_MATCH : Route 53 tries to establish a TCP connection. If successful,
        # Route 53 submits an HTTPS request and searches the first 5,120 bytes of the response body for the
        # string that you specify in SearchString . TCP : Route 53 tries to establish a TCP connection.
        # CLOUDWATCH_METRIC : The health check is associated with a CloudWatch alarm. If the state of the
        # alarm is OK , the health check is considered healthy. If the state is ALARM , the health check is
        # considered unhealthy. If CloudWatch doesn't have sufficient data to determine whether the state is
        # OK or ALARM , the health check status depends on the setting for InsufficientDataHealthStatus :
        # Healthy , Unhealthy , or LastKnownStatus . CALCULATED : For health checks that monitor the status of
        # other health checks, Route 53 adds up the number of health checks that Route 53 health checkers
        # consider to be healthy and compares that number with the value of HealthThreshold . RECOVERY_CONTROL
        # : The health check is associated with a Route53 Application Recovery Controller routing control. If
        # the routing control state is ON , the health check is considered healthy. If the state is OFF , the
        # health check is considered unhealthy. For more information, see How Route 53 Determines Whether an
        # Endpoint Is Healthy in the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to
        # use to determine whether the specified health check is healthy.

        @[JSON::Field(key: "AlarmIdentifier")]
        getter alarm_identifier : Types::AlarmIdentifier?

        # (CALCULATED Health Checks Only) A complex type that contains one ChildHealthCheck element for each
        # health check that you want to associate with a CALCULATED health check.

        @[JSON::Field(key: "ChildHealthChecks")]
        getter child_health_checks : Array(String)?

        # Stops Route 53 from performing health checks. When you disable a health check, here's what happens:
        # Health checks that check the health of endpoints: Route 53 stops submitting requests to your
        # application, server, or other resource. Calculated health checks: Route 53 stops aggregating the
        # status of the referenced health checks. Health checks that monitor CloudWatch alarms: Route 53 stops
        # monitoring the corresponding CloudWatch metrics. After you disable a health check, Route 53
        # considers the status of the health check to always be healthy. If you configured DNS failover, Route
        # 53 continues to route traffic to the corresponding resources. If you want to stop routing traffic to
        # a resource, change the value of Inverted . Charges for a health check still apply when the health
        # check is disabled. For more information, see Amazon Route 53 Pricing .

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # Specify whether you want Amazon Route 53 to send the value of FullyQualifiedDomainName to the
        # endpoint in the client_hello message during TLS negotiation. This allows the endpoint to respond to
        # HTTPS health check requests with the applicable SSL/TLS certificate. Some endpoints require that
        # HTTPS requests include the host name in the client_hello message. If you don't enable SNI, the
        # status of the health check will be SSL alert handshake_failure . A health check can also have that
        # status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS
        # configuration on your endpoint and confirm that your certificate is valid. The SSL/TLS certificate
        # on your endpoint includes a domain name in the Common Name field and possibly several more in the
        # Subject Alternative Names field. One of the domain names in the certificate should match the value
        # that you specify for FullyQualifiedDomainName . If the endpoint responds to the client_hello message
        # with a certificate that does not include the domain name that you specified in
        # FullyQualifiedDomainName , a health checker will retry the handshake. In the second attempt, the
        # health checker will omit FullyQualifiedDomainName from the client_hello message.

        @[JSON::Field(key: "EnableSNI")]
        getter enable_sni : Bool?

        # The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to
        # change the current status of the endpoint from unhealthy to healthy or vice versa. For more
        # information, see How Amazon Route 53 Determines Whether an Endpoint Is Healthy in the Amazon Route
        # 53 Developer Guide . FailureThreshold is not supported when you specify a value for Type of
        # RECOVERY_CONTROL . Otherwise, if you don't specify a value for FailureThreshold , the default value
        # is three health checks.

        @[JSON::Field(key: "FailureThreshold")]
        getter failure_threshold : Int32?

        # Amazon Route 53 behavior depends on whether you specify a value for IPAddress . If you specify a
        # value for IPAddress : Amazon Route 53 sends health check requests to the specified IPv4 or IPv6
        # address and passes the value of FullyQualifiedDomainName in the Host header for all health checks
        # except TCP health checks. This is typically the fully qualified DNS name of the endpoint on which
        # you want Route 53 to perform health checks. When Route 53 checks the health of an endpoint, here is
        # how it constructs the Host header: If you specify a value of 80 for Port and HTTP or HTTP_STR_MATCH
        # for Type , Route 53 passes the value of FullyQualifiedDomainName to the endpoint in the Host header.
        # If you specify a value of 443 for Port and HTTPS or HTTPS_STR_MATCH for Type , Route 53 passes the
        # value of FullyQualifiedDomainName to the endpoint in the Host header. If you specify another value
        # for Port and any value except TCP for Type , Route 53 passes FullyQualifiedDomainName:Port to the
        # endpoint in the Host header. If you don't specify a value for FullyQualifiedDomainName , Route 53
        # substitutes the value of IPAddress in the Host header in each of the preceding cases. If you don't
        # specify a value for IPAddress : Route 53 sends a DNS request to the domain that you specify for
        # FullyQualifiedDomainName at the interval that you specify for RequestInterval . Using an IPv4
        # address that DNS returns, Route 53 then checks the health of the endpoint. If you don't specify a
        # value for IPAddress , Route 53 uses only IPv4 to send health checks to the endpoint. If there's no
        # resource record set with a type of A for the name that you specify for FullyQualifiedDomainName ,
        # the health check fails with a "DNS resolution failed" error. If you want to check the health of
        # weighted, latency, or failover resource record sets and you choose to specify the endpoint only by
        # FullyQualifiedDomainName , we recommend that you create a separate health check for each endpoint.
        # For example, create a health check for each HTTP server that is serving content for www.example.com.
        # For the value of FullyQualifiedDomainName , specify the domain name of the server (such as
        # us-east-2-www.example.com), not the name of the resource record sets (www.example.com). In this
        # configuration, if you create a health check for which the value of FullyQualifiedDomainName matches
        # the name of the resource record sets and you then associate the health check with those resource
        # record sets, health check results will be unpredictable. In addition, if the value that you specify
        # for Type is HTTP , HTTPS , HTTP_STR_MATCH , or HTTPS_STR_MATCH , Route 53 passes the value of
        # FullyQualifiedDomainName in the Host header, as it does when you specify a value for IPAddress . If
        # the value of Type is TCP , Route 53 doesn't pass a Host header.

        @[JSON::Field(key: "FullyQualifiedDomainName")]
        getter fully_qualified_domain_name : String?

        # The number of child health checks that are associated with a CALCULATED health check that Amazon
        # Route 53 must consider healthy for the CALCULATED health check to be considered healthy. To specify
        # the child health checks that you want to associate with a CALCULATED health check, use the
        # ChildHealthChecks element. Note the following: If you specify a number greater than the number of
        # child health checks, Route 53 always considers this health check to be unhealthy. If you specify 0 ,
        # Route 53 always considers this health check to be healthy.

        @[JSON::Field(key: "HealthThreshold")]
        getter health_threshold : Int32?

        # The IPv4 or IPv6 IP address of the endpoint that you want Amazon Route 53 to perform health checks
        # on. If you don't specify a value for IPAddress , Route 53 sends a DNS request to resolve the domain
        # name that you specify in FullyQualifiedDomainName at the interval that you specify in
        # RequestInterval . Using an IP address returned by DNS, Route 53 then checks the health of the
        # endpoint. Use one of the following formats for the value of IPAddress : IPv4 address : four values
        # between 0 and 255, separated by periods (.), for example, 192.0.2.44 . IPv6 address : eight groups
        # of four hexadecimal values, separated by colons (:), for example,
        # 2001:0db8:85a3:0000:0000:abcd:0001:2345 . You can also shorten IPv6 addresses as described in RFC
        # 5952, for example, 2001:db8:85a3::abcd:1:2345 . If the endpoint is an EC2 instance, we recommend
        # that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic
        # IP address for IPAddress . This ensures that the IP address of your instance will never change. For
        # more information, see FullyQualifiedDomainName . Constraints: Route 53 can't check the health of
        # endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more
        # information about IP addresses for which you can't create health checks, see the following
        # documents: RFC 5735, Special Use IPv4 Addresses RFC 6598, IANA-Reserved IPv4 Prefix for Shared
        # Address Space RFC 5156, Special-Use IPv6 Addresses When the value of Type is CALCULATED or
        # CLOUDWATCH_METRIC , omit IPAddress .

        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String?

        # When CloudWatch has insufficient data about the metric to determine the alarm state, the status that
        # you want Amazon Route 53 to assign to the health check: Healthy : Route 53 considers the health
        # check to be healthy. Unhealthy : Route 53 considers the health check to be unhealthy.
        # LastKnownStatus : Route 53 uses the status of the health check from the last time that CloudWatch
        # had sufficient data to determine the alarm state. For new health checks that have no last known
        # status, the default status for the health check is healthy.

        @[JSON::Field(key: "InsufficientDataHealthStatus")]
        getter insufficient_data_health_status : String?

        # Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to
        # consider a health check unhealthy when it otherwise would be considered healthy.

        @[JSON::Field(key: "Inverted")]
        getter inverted : Bool?

        # Specify whether you want Amazon Route 53 to measure the latency between health checkers in multiple
        # Amazon Web Services regions and your endpoint, and to display CloudWatch latency graphs on the
        # Health Checks page in the Route 53 console. MeasureLatency is not supported when you specify a value
        # for Type of RECOVERY_CONTROL . You can't change the value of MeasureLatency after you create a
        # health check.

        @[JSON::Field(key: "MeasureLatency")]
        getter measure_latency : Bool?

        # The port on the endpoint that you want Amazon Route 53 to perform health checks on. Don't specify a
        # value for Port when you specify a value for Type of CLOUDWATCH_METRIC or CALCULATED .

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # A complex type that contains one Region element for each region from which you want Amazon Route 53
        # health checkers to check the specified endpoint. If you don't specify any regions, Route 53 health
        # checkers automatically performs checks from all of the regions that are listed under Valid Values .
        # If you update a health check to remove a region that has been performing health checks, Route 53
        # will briefly continue to perform checks from that region to ensure that some health checkers are
        # always checking the endpoint (for example, if you replace three regions with four different
        # regions).

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and
        # the time that it sends the next health check request. Each Route 53 health checker makes requests at
        # this interval. RequestInterval is not supported when you specify a value for Type of
        # RECOVERY_CONTROL . You can't change the value of RequestInterval after you create a health check. If
        # you don't specify a value for RequestInterval , the default value is 30 seconds.

        @[JSON::Field(key: "RequestInterval")]
        getter request_interval : Int32?

        # The path, if any, that you want Amazon Route 53 to request when performing health checks. The path
        # can be any value for which your endpoint will return an HTTP status code of 2xx or 3xx when the
        # endpoint is healthy, for example, the file /docs/route53-health-check.html. You can also include
        # query string parameters, for example, /welcome.html?language=jp&amp;login=y .

        @[JSON::Field(key: "ResourcePath")]
        getter resource_path : String?

        # The Amazon Resource Name (ARN) for the Route 53 Application Recovery Controller routing control. For
        # more information about Route 53 Application Recovery Controller, see Route 53 Application Recovery
        # Controller Developer Guide. .

        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String?

        # If the value of Type is HTTP_STR_MATCH or HTTPS_STR_MATCH , the string that you want Amazon Route 53
        # to search for in the response body from the specified resource. If the string appears in the
        # response body, Route 53 considers the resource healthy. Route 53 considers case when searching for
        # SearchString in the response body.

        @[JSON::Field(key: "SearchString")]
        getter search_string : String?

        def initialize(
          @type : String,
          @alarm_identifier : Types::AlarmIdentifier? = nil,
          @child_health_checks : Array(String)? = nil,
          @disabled : Bool? = nil,
          @enable_sni : Bool? = nil,
          @failure_threshold : Int32? = nil,
          @fully_qualified_domain_name : String? = nil,
          @health_threshold : Int32? = nil,
          @ip_address : String? = nil,
          @insufficient_data_health_status : String? = nil,
          @inverted : Bool? = nil,
          @measure_latency : Bool? = nil,
          @port : Int32? = nil,
          @regions : Array(String)? = nil,
          @request_interval : Int32? = nil,
          @resource_path : String? = nil,
          @routing_control_arn : String? = nil,
          @search_string : String? = nil
        )
        end
      end

      # This error code is not in use.

      struct HealthCheckInUse
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains the last failure reason as reported by one Amazon Route 53 health
      # checker.

      struct HealthCheckObservation
        include JSON::Serializable

        # The IP address of the Amazon Route 53 health checker that provided the failure reason in
        # StatusReport .

        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String?

        # The region of the Amazon Route 53 health checker that provided the status in StatusReport .

        @[JSON::Field(key: "Region")]
        getter region : String?

        # A complex type that contains the last failure reason as reported by one Amazon Route 53 health
        # checker and the time of the failed health check.

        @[JSON::Field(key: "StatusReport")]
        getter status_report : Types::StatusReport?

        def initialize(
          @ip_address : String? = nil,
          @region : String? = nil,
          @status_report : Types::StatusReport? = nil
        )
        end
      end

      # The value of HealthCheckVersion in the request doesn't match the value of HealthCheckVersion in the
      # health check.

      struct HealthCheckVersionMismatch
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains general information about the hosted zone.

      struct HostedZone
        include JSON::Serializable

        # The value that you specified for CallerReference when you created the hosted zone.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # The ID that Amazon Route 53 assigned to the hosted zone when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the domain. For public hosted zones, this is the name that you have registered with your
        # DNS registrar. For information about how to specify characters other than a-z , 0-9 , and - (hyphen)
        # and how to specify internationalized domain names, see CreateHostedZone .

        @[JSON::Field(key: "Name")]
        getter name : String

        # A complex type that includes the Comment and PrivateZone elements. If you omitted the
        # HostedZoneConfig and Comment elements from the request, the Config and Comment elements don't appear
        # in the response.

        @[JSON::Field(key: "Config")]
        getter config : Types::HostedZoneConfig?

        # The features configuration for the hosted zone, including accelerated recovery settings and status
        # information.

        @[JSON::Field(key: "Features")]
        getter features : Types::HostedZoneFeatures?

        # If the hosted zone was created by another service, the service that created the hosted zone. When a
        # hosted zone is created by another service, you can't edit or delete it using Route 53.

        @[JSON::Field(key: "LinkedService")]
        getter linked_service : Types::LinkedService?

        # The number of resource record sets in the hosted zone.

        @[JSON::Field(key: "ResourceRecordSetCount")]
        getter resource_record_set_count : Int64?

        def initialize(
          @caller_reference : String,
          @id : String,
          @name : String,
          @config : Types::HostedZoneConfig? = nil,
          @features : Types::HostedZoneFeatures? = nil,
          @linked_service : Types::LinkedService? = nil,
          @resource_record_set_count : Int64? = nil
        )
        end
      end

      # The hosted zone you're trying to create already exists. Amazon Route 53 returns this error when a
      # hosted zone has already been created with the specified CallerReference .

      struct HostedZoneAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains an optional comment about your hosted zone. If you don't want to
      # specify a comment, omit both the HostedZoneConfig and Comment elements.

      struct HostedZoneConfig
        include JSON::Serializable

        # Any comments that you want to include about the hosted zone.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # A value that indicates whether this is a private hosted zone.

        @[JSON::Field(key: "PrivateZone")]
        getter private_zone : Bool?

        def initialize(
          @comment : String? = nil,
          @private_zone : Bool? = nil
        )
        end
      end

      # Contains information about why certain features failed to be enabled or configured for the hosted
      # zone.

      struct HostedZoneFailureReasons
        include JSON::Serializable

        # The reason why accelerated recovery failed to be enabled or disabled for the hosted zone, if
        # applicable.

        @[JSON::Field(key: "AcceleratedRecovery")]
        getter accelerated_recovery : String?

        def initialize(
          @accelerated_recovery : String? = nil
        )
        end
      end

      # Represents the features configuration for a hosted zone, including the status of various features
      # and any associated failure reasons.

      struct HostedZoneFeatures
        include JSON::Serializable

        # The current status of accelerated recovery for the hosted zone.

        @[JSON::Field(key: "AcceleratedRecoveryStatus")]
        getter accelerated_recovery_status : String?

        # Information about any failures that occurred when attempting to enable or configure features for the
        # hosted zone.

        @[JSON::Field(key: "FailureReasons")]
        getter failure_reasons : Types::HostedZoneFailureReasons?

        def initialize(
          @accelerated_recovery_status : String? = nil,
          @failure_reasons : Types::HostedZoneFailureReasons? = nil
        )
        end
      end

      # A complex type that contains the type of limit that you specified in the request and the current
      # value for that limit.

      struct HostedZoneLimit
        include JSON::Serializable

        # The limit that you requested. Valid values include the following: MAX_RRSETS_BY_ZONE : The maximum
        # number of records that you can create in the specified hosted zone. MAX_VPCS_ASSOCIATED_BY_ZONE :
        # The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The current value for the limit that is specified by Type .

        @[JSON::Field(key: "Value")]
        getter value : Int64

        def initialize(
          @type : String,
          @value : Int64
        )
        end
      end

      # The hosted zone contains resource records that are not SOA or NS records.

      struct HostedZoneNotEmpty
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified HostedZone can't be found.

      struct HostedZoneNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified hosted zone is a public hosted zone, not a private hosted zone.

      struct HostedZoneNotPrivate
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that identifies a hosted zone that a specified Amazon VPC is associated with and the
      # owner of the hosted zone. If there is a value for OwningAccount , there is no value for
      # OwningService , and vice versa.

      struct HostedZoneOwner
        include JSON::Serializable

        # If the hosted zone was created by an Amazon Web Services account, or was created by an Amazon Web
        # Services service that creates hosted zones using the current account, OwningAccount contains the
        # account ID of that account. For example, when you use Cloud Map to create a hosted zone, Cloud Map
        # creates the hosted zone using the current Amazon Web Services account.

        @[JSON::Field(key: "OwningAccount")]
        getter owning_account : String?

        # If an Amazon Web Services service uses its own account to create a hosted zone and associate the
        # specified VPC with that hosted zone, OwningService contains an abbreviation that identifies the
        # service. For example, if Amazon Elastic File System (Amazon EFS) created a hosted zone and
        # associated a VPC with the hosted zone, the value of OwningService is efs.amazonaws.com .

        @[JSON::Field(key: "OwningService")]
        getter owning_service : String?

        def initialize(
          @owning_account : String? = nil,
          @owning_service : String? = nil
        )
        end
      end

      # The hosted zone nameservers don't match the parent nameservers. The hosted zone and parent must have
      # the same nameservers.

      struct HostedZonePartiallyDelegated
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # In the response to a ListHostedZonesByVPC request, the HostedZoneSummaries element contains one
      # HostedZoneSummary element for each hosted zone that the specified Amazon VPC is associated with.
      # Each HostedZoneSummary element contains the hosted zone name and ID, and information about who owns
      # the hosted zone.

      struct HostedZoneSummary
        include JSON::Serializable

        # The Route 53 hosted zone ID of a private hosted zone that the specified VPC is associated with.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The name of the private hosted zone, such as example.com .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The owner of a private hosted zone that the specified VPC is associated with. The owner can be
        # either an Amazon Web Services account or an Amazon Web Services service.

        @[JSON::Field(key: "Owner")]
        getter owner : Types::HostedZoneOwner

        def initialize(
          @hosted_zone_id : String,
          @name : String,
          @owner : Types::HostedZoneOwner
        )
        end
      end

      # The resource you're trying to access is unsupported on this Amazon Route 53 endpoint.

      struct IncompatibleVersion
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Route 53 doesn't have the permissions required to create log streams and send query logs to
      # log streams. Possible causes include the following: There is no resource policy that specifies the
      # log group ARN in the value for Resource . The resource policy that includes the log group ARN in the
      # value for Resource doesn't have the necessary permissions. The resource policy hasn't finished
      # propagating yet. The Key management service (KMS) key you specified doesn’t exist or it can’t be
      # used with the log group associated with query log. Update or provide a resource policy to grant
      # permissions for the KMS key. The Key management service (KMS) key you specified is marked as
      # disabled for the log group associated with query log. Update or provide a resource policy to grant
      # permissions for the KMS key.

      struct InsufficientCloudWatchLogsResourcePolicy
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter name is not valid.

      struct InvalidArgument
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception contains a list of messages that might contain one or more error messages. Each error
      # message indicates one error in the change batch.

      struct InvalidChangeBatch
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "messages")]
        getter messages : Array(String)?

        def initialize(
          @message : String? = nil,
          @messages : Array(String)? = nil
        )
        end
      end

      # The specified domain name is not valid.

      struct InvalidDomainName
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input is not valid.

      struct InvalidInput
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The KeyManagementServiceArn that you specified isn't valid to use with DNSSEC signing.

      struct InvalidKMSArn
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The key-signing key (KSK) name that you specified isn't a valid name.

      struct InvalidKeySigningKeyName
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The key-signing key (KSK) status isn't valid or another KSK has the status INTERNAL_FAILURE .

      struct InvalidKeySigningKeyStatus
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value that you specified to get the second or subsequent page of results is invalid.

      struct InvalidPaginationToken
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your hosted zone status isn't valid for this operation. In the hosted zone, change the status to
      # enable DNSSEC or disable DNSSEC .

      struct InvalidSigningStatus
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The format of the traffic policy document that you specified in the Document element is not valid.

      struct InvalidTrafficPolicyDocument
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The VPC ID that you specified either isn't a valid ID or the current account is not authorized to
      # access this VPC.

      struct InvalidVPCId
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A key-signing key (KSK) is a complex type that represents a public/private key pair. The private key
      # is used to generate a digital signature for the zone signing key (ZSK). The public key is stored in
      # the DNS and is used to authenticate the ZSK. A KSK is always associated with a hosted zone; it
      # cannot exist by itself.

      struct KeySigningKey
        include JSON::Serializable

        # The date when the key-signing key (KSK) was created.

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : Time?

        # A string that represents a DNSKEY record.

        @[JSON::Field(key: "DNSKEYRecord")]
        getter dnskey_record : String?

        # A string that represents a delegation signer (DS) record.

        @[JSON::Field(key: "DSRecord")]
        getter ds_record : String?

        # A string used to represent the delegation signer digest algorithm. This value must follow the
        # guidelines provided by RFC-8624 Section 3.3 .

        @[JSON::Field(key: "DigestAlgorithmMnemonic")]
        getter digest_algorithm_mnemonic : String?

        # An integer used to represent the delegation signer digest algorithm. This value must follow the
        # guidelines provided by RFC-8624 Section 3.3 .

        @[JSON::Field(key: "DigestAlgorithmType")]
        getter digest_algorithm_type : Int32?

        # A cryptographic digest of a DNSKEY resource record (RR). DNSKEY records are used to publish the
        # public key that resolvers can use to verify DNSSEC signatures that are used to secure certain kinds
        # of information provided by the DNS system.

        @[JSON::Field(key: "DigestValue")]
        getter digest_value : String?

        # An integer that specifies how the key is used. For key-signing key (KSK), this value is always 257.

        @[JSON::Field(key: "Flag")]
        getter flag : Int32?

        # An integer used to identify the DNSSEC record for the domain name. The process used to calculate the
        # value is described in RFC-4034 Appendix B .

        @[JSON::Field(key: "KeyTag")]
        getter key_tag : Int32?

        # The Amazon resource name (ARN) used to identify the customer managed key in Key Management Service
        # (KMS). The KmsArn must be unique for each key-signing key (KSK) in a single hosted zone. You must
        # configure the customer managed key as follows: Status Enabled Key spec ECC_NIST_P256 Key usage Sign
        # and verify Key policy The key policy must give permission for the following actions: DescribeKey
        # GetPublicKey Sign The key policy must also include the Amazon Route 53 service in the principal for
        # your account. Specify the following: "Service": "dnssec-route53.amazonaws.com" For more information
        # about working with the customer managed key in KMS, see Key Management Service concepts .

        @[JSON::Field(key: "KmsArn")]
        getter kms_arn : String?

        # The last time that the key-signing key (KSK) was changed.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # A string used to identify a key-signing key (KSK). Name can include numbers, letters, and
        # underscores (_). Name must be unique for each key-signing key in the same hosted zone.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The public key, represented as a Base64 encoding, as required by RFC-4034 Page 5 .

        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        # A string used to represent the signing algorithm. This value must follow the guidelines provided by
        # RFC-8624 Section 3.1 .

        @[JSON::Field(key: "SigningAlgorithmMnemonic")]
        getter signing_algorithm_mnemonic : String?

        # An integer used to represent the signing algorithm. This value must follow the guidelines provided
        # by RFC-8624 Section 3.1 .

        @[JSON::Field(key: "SigningAlgorithmType")]
        getter signing_algorithm_type : Int32?

        # A string that represents the current key-signing key (KSK) status. Status can have one of the
        # following values: ACTIVE The KSK is being used for signing. INACTIVE The KSK is not being used for
        # signing. DELETING The KSK is in the process of being deleted. ACTION_NEEDED There is a problem with
        # the KSK that requires you to take action to resolve. For example, the customer managed key might
        # have been deleted, or the permissions for the customer managed key might have been changed.
        # INTERNAL_FAILURE There was an error during a request. Before you can continue to work with DNSSEC
        # signing, including actions that involve this KSK, you must correct the problem. For example, you may
        # need to activate or deactivate the KSK.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message provided for the following key-signing key (KSK) statuses: ACTION_NEEDED or
        # INTERNAL_FAILURE . The status message includes information about what the problem might be and steps
        # that you can take to correct the issue.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @created_date : Time? = nil,
          @dnskey_record : String? = nil,
          @ds_record : String? = nil,
          @digest_algorithm_mnemonic : String? = nil,
          @digest_algorithm_type : Int32? = nil,
          @digest_value : String? = nil,
          @flag : Int32? = nil,
          @key_tag : Int32? = nil,
          @kms_arn : String? = nil,
          @last_modified_date : Time? = nil,
          @name : String? = nil,
          @public_key : String? = nil,
          @signing_algorithm_mnemonic : String? = nil,
          @signing_algorithm_type : Int32? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # You've already created a key-signing key (KSK) with this name or with the same customer managed key
      # ARN.

      struct KeySigningKeyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The key-signing key (KSK) is specified in a parent DS record.

      struct KeySigningKeyInParentDSRecord
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The key-signing key (KSK) that you specified can't be deactivated because it's the only KSK for a
      # currently-enabled DNSSEC. Disable DNSSEC signing, or add or enable another KSK.

      struct KeySigningKeyInUse
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A key-signing key (KSK) with ACTIVE status wasn't found.

      struct KeySigningKeyWithActiveStatusNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The VPC that you're trying to disassociate from the private hosted zone is the last VPC that is
      # associated with the hosted zone. Amazon Route 53 doesn't support disassociating the last VPC from a
      # hosted zone.

      struct LastVPCAssociation
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation can't be completed because the current account has reached the limit on the resource
      # you are trying to create. To request a higher limit, create a case with the Amazon Web Services
      # Support Center.

      struct LimitsExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If a health check or hosted zone was created by another service, LinkedService is a complex type
      # that describes the service that created the resource. When a resource is created by another service,
      # you can't edit or delete it using Amazon Route 53.

      struct LinkedService
        include JSON::Serializable

        # If the health check or hosted zone was created by another service, an optional description that can
        # be provided by the other service. When a resource is created by another service, you can't edit or
        # delete it using Amazon Route 53.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the health check or hosted zone was created by another service, the service that created the
        # resource. When a resource is created by another service, you can't edit or delete it using Amazon
        # Route 53.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @description : String? = nil,
          @service_principal : String? = nil
        )
        end
      end


      struct ListCidrBlocksRequest
        include JSON::Serializable

        # The UUID of the CIDR collection.

        @[JSON::Field(key: "CidrCollectionId")]
        getter collection_id : String

        # The name of the CIDR collection location.

        @[JSON::Field(key: "location")]
        getter location_name : String?

        # Maximum number of results you want returned.

        @[JSON::Field(key: "maxresults")]
        getter max_results : String?

        # An opaque pagination token to indicate where the service is to begin enumerating results.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @collection_id : String,
          @location_name : String? = nil,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCidrBlocksResponse
        include JSON::Serializable

        # A complex type that contains information about the CIDR blocks.

        @[JSON::Field(key: "CidrBlocks")]
        getter cidr_blocks : Array(Types::CidrBlockSummary)?

        # An opaque pagination token to indicate where the service is to begin enumerating results. If no
        # value is provided, the listing of results starts from the beginning.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cidr_blocks : Array(Types::CidrBlockSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCidrCollectionsRequest
        include JSON::Serializable

        # The maximum number of CIDR collections to return in the response.

        @[JSON::Field(key: "maxresults")]
        getter max_results : String?

        # An opaque pagination token to indicate where the service is to begin enumerating results. If no
        # value is provided, the listing of results starts from the beginning.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCidrCollectionsResponse
        include JSON::Serializable

        # A complex type with information about the CIDR collection.

        @[JSON::Field(key: "CidrCollections")]
        getter cidr_collections : Array(Types::CollectionSummary)?

        # An opaque pagination token to indicate where the service is to begin enumerating results. If no
        # value is provided, the listing of results starts from the beginning.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cidr_collections : Array(Types::CollectionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCidrLocationsRequest
        include JSON::Serializable

        # The CIDR collection ID.

        @[JSON::Field(key: "CidrCollectionId")]
        getter collection_id : String

        # The maximum number of CIDR collection locations to return in the response.

        @[JSON::Field(key: "maxresults")]
        getter max_results : String?

        # An opaque pagination token to indicate where the service is to begin enumerating results. If no
        # value is provided, the listing of results starts from the beginning.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @collection_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCidrLocationsResponse
        include JSON::Serializable

        # A complex type that contains information about the list of CIDR locations.

        @[JSON::Field(key: "CidrLocations")]
        getter cidr_locations : Array(Types::LocationSummary)?

        # An opaque pagination token to indicate where the service is to begin enumerating results. If no
        # value is provided, the listing of results starts from the beginning.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cidr_locations : Array(Types::LocationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A request to get a list of geographic locations that Amazon Route 53 supports for geolocation
      # resource record sets.

      struct ListGeoLocationsRequest
        include JSON::Serializable

        # (Optional) The maximum number of geolocations to be included in the response body for this request.
        # If more than maxitems geolocations remain to be listed, then the value of the IsTruncated element in
        # the response is true .

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # The code for the continent with which you want to start listing locations that Amazon Route 53
        # supports for geolocation. If Route 53 has already returned a page or more of results, if IsTruncated
        # is true, and if NextContinentCode from the previous response has a value, enter that value in
        # startcontinentcode to return the next page of results. Include startcontinentcode only if you want
        # to list continents. Don't include startcontinentcode when you're listing countries or countries with
        # their subdivisions.

        @[JSON::Field(key: "startcontinentcode")]
        getter start_continent_code : String?

        # The code for the country with which you want to start listing locations that Amazon Route 53
        # supports for geolocation. If Route 53 has already returned a page or more of results, if IsTruncated
        # is true , and if NextCountryCode from the previous response has a value, enter that value in
        # startcountrycode to return the next page of results.

        @[JSON::Field(key: "startcountrycode")]
        getter start_country_code : String?

        # The code for the state of the United States with which you want to start listing locations that
        # Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of
        # results, if IsTruncated is true , and if NextSubdivisionCode from the previous response has a value,
        # enter that value in startsubdivisioncode to return the next page of results. To list subdivisions
        # (U.S. states), you must include both startcountrycode and startsubdivisioncode .

        @[JSON::Field(key: "startsubdivisioncode")]
        getter start_subdivision_code : String?

        def initialize(
          @max_items : String? = nil,
          @start_continent_code : String? = nil,
          @start_country_code : String? = nil,
          @start_subdivision_code : String? = nil
        )
        end
      end

      # A complex type containing the response information for the request.

      struct ListGeoLocationsResponse
        include JSON::Serializable

        # A complex type that contains one GeoLocationDetails element for each location that Amazon Route 53
        # supports for geolocation.

        @[JSON::Field(key: "GeoLocationDetailsList")]
        getter geo_location_details_list : Array(Types::GeoLocationDetails)

        # A value that indicates whether more locations remain to be listed after the last location in this
        # response. If so, the value of IsTruncated is true . To get more values, submit another request and
        # include the values of NextContinentCode , NextCountryCode , and NextSubdivisionCode in the
        # startcontinentcode , startcountrycode , and startsubdivisioncode , as applicable.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for MaxItems in the request.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # If IsTruncated is true , you can make a follow-up request to display more locations. Enter the value
        # of NextContinentCode in the startcontinentcode parameter in another ListGeoLocations request.

        @[JSON::Field(key: "NextContinentCode")]
        getter next_continent_code : String?

        # If IsTruncated is true , you can make a follow-up request to display more locations. Enter the value
        # of NextCountryCode in the startcountrycode parameter in another ListGeoLocations request.

        @[JSON::Field(key: "NextCountryCode")]
        getter next_country_code : String?

        # If IsTruncated is true , you can make a follow-up request to display more locations. Enter the value
        # of NextSubdivisionCode in the startsubdivisioncode parameter in another ListGeoLocations request.

        @[JSON::Field(key: "NextSubdivisionCode")]
        getter next_subdivision_code : String?

        def initialize(
          @geo_location_details_list : Array(Types::GeoLocationDetails),
          @is_truncated : Bool,
          @max_items : String,
          @next_continent_code : String? = nil,
          @next_country_code : String? = nil,
          @next_subdivision_code : String? = nil
        )
        end
      end

      # A request to retrieve a list of the health checks that are associated with the current Amazon Web
      # Services account.

      struct ListHealthChecksRequest
        include JSON::Serializable

        # If the value of IsTruncated in the previous response was true , you have more health checks. To get
        # another group, submit another ListHealthChecks request. For the value of marker , specify the value
        # of NextMarker from the previous response, which is the ID of the first health check that Amazon
        # Route 53 will return if you submit another request. If the value of IsTruncated in the previous
        # response was false , there are no more health checks to get.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The maximum number of health checks that you want ListHealthChecks to return in response to the
        # current request. Amazon Route 53 returns a maximum of 1000 items. If you set MaxItems to a value
        # greater than 1000, Route 53 returns only the first 1000 health checks.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # A complex type that contains the response to a ListHealthChecks request.

      struct ListHealthChecksResponse
        include JSON::Serializable

        # A complex type that contains one HealthCheck element for each health check that is associated with
        # the current Amazon Web Services account.

        @[JSON::Field(key: "HealthChecks")]
        getter health_checks : Array(Types::HealthCheck)

        # A flag that indicates whether there are more health checks to be listed. If the response was
        # truncated, you can get the next group of health checks by submitting another ListHealthChecks
        # request and specifying the value of NextMarker in the marker parameter.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the maxitems parameter in the call to ListHealthChecks that
        # produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # For the second and subsequent calls to ListHealthChecks , Marker is the value that you specified for
        # the marker parameter in the previous request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If IsTruncated is true , the value of NextMarker identifies the first health check that Amazon Route
        # 53 returns if you submit another ListHealthChecks request and specify the value of NextMarker in the
        # marker parameter.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @health_checks : Array(Types::HealthCheck),
          @is_truncated : Bool,
          @max_items : String,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Retrieves a list of the public and private hosted zones that are associated with the current Amazon
      # Web Services account in ASCII order by domain name.

      struct ListHostedZonesByNameRequest
        include JSON::Serializable

        # (Optional) For your first request to ListHostedZonesByName , include the dnsname parameter only if
        # you want to specify the name of the first hosted zone in the response. If you don't include the
        # dnsname parameter, Amazon Route 53 returns all of the hosted zones that were created by the current
        # Amazon Web Services account, in ASCII order. For subsequent requests, include both dnsname and
        # hostedzoneid parameters. For dnsname , specify the value of NextDNSName from the previous response.

        @[JSON::Field(key: "dnsname")]
        getter dns_name : String?

        # (Optional) For your first request to ListHostedZonesByName , do not include the hostedzoneid
        # parameter. If you have more hosted zones than the value of maxitems , ListHostedZonesByName returns
        # only the first maxitems hosted zones. To get the next group of maxitems hosted zones, submit another
        # request to ListHostedZonesByName and include both dnsname and hostedzoneid parameters. For the value
        # of hostedzoneid , specify the value of the NextHostedZoneId element from the previous response.

        @[JSON::Field(key: "hostedzoneid")]
        getter hosted_zone_id : String?

        # The maximum number of hosted zones to be included in the response body for this request. If you have
        # more than maxitems hosted zones, then the value of the IsTruncated element in the response is true,
        # and the values of NextDNSName and NextHostedZoneId specify the first hosted zone in the next group
        # of maxitems hosted zones.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        def initialize(
          @dns_name : String? = nil,
          @hosted_zone_id : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListHostedZonesByNameResponse
        include JSON::Serializable

        # A complex type that contains general information about the hosted zone.

        @[JSON::Field(key: "HostedZones")]
        getter hosted_zones : Array(Types::HostedZone)

        # A flag that indicates whether there are more hosted zones to be listed. If the response was
        # truncated, you can get the next group of maxitems hosted zones by calling ListHostedZonesByName
        # again and specifying the values of NextDNSName and NextHostedZoneId elements in the dnsname and
        # hostedzoneid parameters.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the maxitems parameter in the call to ListHostedZonesByName that
        # produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # For the second and subsequent calls to ListHostedZonesByName , DNSName is the value that you
        # specified for the dnsname parameter in the request that produced the current response.

        @[JSON::Field(key: "DNSName")]
        getter dns_name : String?

        # The ID that Amazon Route 53 assigned to the hosted zone when you created it.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        # If IsTruncated is true, the value of NextDNSName is the name of the first hosted zone in the next
        # group of maxitems hosted zones. Call ListHostedZonesByName again and specify the value of
        # NextDNSName and NextHostedZoneId in the dnsname and hostedzoneid parameters, respectively. This
        # element is present only if IsTruncated is true .

        @[JSON::Field(key: "NextDNSName")]
        getter next_dns_name : String?

        # If IsTruncated is true , the value of NextHostedZoneId identifies the first hosted zone in the next
        # group of maxitems hosted zones. Call ListHostedZonesByName again and specify the value of
        # NextDNSName and NextHostedZoneId in the dnsname and hostedzoneid parameters, respectively. This
        # element is present only if IsTruncated is true .

        @[JSON::Field(key: "NextHostedZoneId")]
        getter next_hosted_zone_id : String?

        def initialize(
          @hosted_zones : Array(Types::HostedZone),
          @is_truncated : Bool,
          @max_items : String,
          @dns_name : String? = nil,
          @hosted_zone_id : String? = nil,
          @next_dns_name : String? = nil,
          @next_hosted_zone_id : String? = nil
        )
        end
      end

      # Lists all the private hosted zones that a specified VPC is associated with, regardless of which
      # Amazon Web Services account created the hosted zones.

      struct ListHostedZonesByVPCRequest
        include JSON::Serializable

        # The ID of the Amazon VPC that you want to list hosted zones for.

        @[JSON::Field(key: "vpcid")]
        getter vpc_id : String

        # For the Amazon VPC that you specified for VPCId , the Amazon Web Services Region that you created
        # the VPC in.

        @[JSON::Field(key: "vpcregion")]
        getter vpc_region : String

        # (Optional) The maximum number of hosted zones that you want Amazon Route 53 to return. If the
        # specified VPC is associated with more than MaxItems hosted zones, the response includes a NextToken
        # element. NextToken contains an encrypted token that identifies the first hosted zone that Route 53
        # will return if you submit another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # If the previous response included a NextToken element, the specified VPC is associated with more
        # hosted zones. To get more hosted zones, submit another ListHostedZonesByVPC request. For the value
        # of NextToken , specify the value of NextToken from the previous response. If the previous response
        # didn't include a NextToken element, there are no more hosted zones to get.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @vpc_id : String,
          @vpc_region : String,
          @max_items : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHostedZonesByVPCResponse
        include JSON::Serializable

        # A list that contains one HostedZoneSummary element for each hosted zone that the specified Amazon
        # VPC is associated with. Each HostedZoneSummary element contains the hosted zone name and ID, and
        # information about who owns the hosted zone.

        @[JSON::Field(key: "HostedZoneSummaries")]
        getter hosted_zone_summaries : Array(Types::HostedZoneSummary)

        # The value that you specified for MaxItems in the most recent ListHostedZonesByVPC request.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # The value that you will use for NextToken in the next ListHostedZonesByVPC request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hosted_zone_summaries : Array(Types::HostedZoneSummary),
          @max_items : String,
          @next_token : String? = nil
        )
        end
      end

      # A request to retrieve a list of the public and private hosted zones that are associated with the
      # current Amazon Web Services account.

      struct ListHostedZonesRequest
        include JSON::Serializable

        # If you're using reusable delegation sets and you want to list all of the hosted zones that are
        # associated with a reusable delegation set, specify the ID of that reusable delegation set.

        @[JSON::Field(key: "delegationsetid")]
        getter delegation_set_id : String?

        # (Optional) Specifies if the hosted zone is private.

        @[JSON::Field(key: "hostedzonetype")]
        getter hosted_zone_type : String?

        # If the value of IsTruncated in the previous response was true , you have more hosted zones. To get
        # more hosted zones, submit another ListHostedZones request. For the value of marker , specify the
        # value of NextMarker from the previous response, which is the ID of the first hosted zone that Amazon
        # Route 53 will return if you submit another request. If the value of IsTruncated in the previous
        # response was false , there are no more hosted zones to get.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # (Optional) The maximum number of hosted zones that you want Amazon Route 53 to return. If you have
        # more than maxitems hosted zones, the value of IsTruncated in the response is true , and the value of
        # NextMarker is the hosted zone ID of the first hosted zone that Route 53 will return if you submit
        # another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        def initialize(
          @delegation_set_id : String? = nil,
          @hosted_zone_type : String? = nil,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListHostedZonesResponse
        include JSON::Serializable

        # A complex type that contains general information about the hosted zone.

        @[JSON::Field(key: "HostedZones")]
        getter hosted_zones : Array(Types::HostedZone)

        # A flag indicating whether there are more hosted zones to be listed. If the response was truncated,
        # you can get more hosted zones by submitting another ListHostedZones request and specifying the value
        # of NextMarker in the marker parameter.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the maxitems parameter in the call to ListHostedZones that produced
        # the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # For the second and subsequent calls to ListHostedZones , Marker is the value that you specified for
        # the marker parameter in the request that produced the current response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If IsTruncated is true , the value of NextMarker identifies the first hosted zone in the next group
        # of hosted zones. Submit another ListHostedZones request, and specify the value of NextMarker from
        # the response in the marker parameter. This element is present only if IsTruncated is true .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @hosted_zones : Array(Types::HostedZone),
          @is_truncated : Bool,
          @max_items : String,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListQueryLoggingConfigsRequest
        include JSON::Serializable

        # (Optional) If you want to list the query logging configuration that is associated with a hosted
        # zone, specify the ID in HostedZoneId . If you don't specify a hosted zone ID,
        # ListQueryLoggingConfigs returns all of the configurations that are associated with the current
        # Amazon Web Services account.

        @[JSON::Field(key: "hostedzoneid")]
        getter hosted_zone_id : String?

        # (Optional) The maximum number of query logging configurations that you want Amazon Route 53 to
        # return in response to the current request. If the current Amazon Web Services account has more than
        # MaxResults configurations, use the value of NextToken in the response to get the next page of
        # results. If you don't specify a value for MaxResults , Route 53 returns up to 100 configurations.

        @[JSON::Field(key: "maxresults")]
        getter max_results : String?

        # (Optional) If the current Amazon Web Services account has more than MaxResults query logging
        # configurations, use NextToken to get the second and subsequent pages of results. For the first
        # ListQueryLoggingConfigs request, omit this value. For the second and subsequent requests, get the
        # value of NextToken from the previous response and specify that value for NextToken in the request.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @hosted_zone_id : String? = nil,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListQueryLoggingConfigsResponse
        include JSON::Serializable

        # An array that contains one QueryLoggingConfig element for each configuration for DNS query logging
        # that is associated with the current Amazon Web Services account.

        @[JSON::Field(key: "QueryLoggingConfigs")]
        getter query_logging_configs : Array(Types::QueryLoggingConfig)

        # If a response includes the last of the query logging configurations that are associated with the
        # current Amazon Web Services account, NextToken doesn't appear in the response. If a response doesn't
        # include the last of the configurations, you can get more configurations by submitting another
        # ListQueryLoggingConfigs request. Get the value of NextToken that Amazon Route 53 returned in the
        # previous response and include it in NextToken in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @query_logging_configs : Array(Types::QueryLoggingConfig),
          @next_token : String? = nil
        )
        end
      end

      # A request for the resource record sets that are associated with a specified hosted zone.

      struct ListResourceRecordSetsRequest
        include JSON::Serializable

        # The ID of the hosted zone that contains the resource record sets that you want to list.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # (Optional) The maximum number of resource records sets to include in the response body for this
        # request. If the response includes more than maxitems resource record sets, the value of the
        # IsTruncated element in the response is true , and the values of the NextRecordName and
        # NextRecordType elements in the response identify the first resource record set in the next group of
        # maxitems resource record sets.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # Resource record sets that have a routing policy other than simple: If results were truncated for a
        # given DNS name and type, specify the value of NextRecordIdentifier from the previous response to get
        # the next resource record set that has the current DNS name and type.

        @[JSON::Field(key: "identifier")]
        getter start_record_identifier : String?

        # The first name in the lexicographic ordering of resource record sets that you want to list. If the
        # specified record name doesn't exist, the results begin with the first resource record set that has a
        # name greater than the value of name .

        @[JSON::Field(key: "name")]
        getter start_record_name : String?

        # The type of resource record set to begin the record listing from. Valid values for basic resource
        # record sets: A | AAAA | CAA | CNAME | MX | NAPTR | NS | PTR | SOA | SPF | SRV | TXT Values for
        # weighted, latency, geolocation, and failover resource record sets: A | AAAA | CAA | CNAME | MX |
        # NAPTR | PTR | SPF | SRV | TXT Values for alias resource record sets: API Gateway custom regional API
        # or edge-optimized API : A CloudFront distribution : A or AAAA Elastic Beanstalk environment that has
        # a regionalized subdomain : A Elastic Load Balancing load balancer : A | AAAA S3 bucket : A VPC
        # interface VPC endpoint : A Another resource record set in this hosted zone: The type of the resource
        # record set that the alias references. Constraint: Specifying type without specifying name returns an
        # InvalidInput error.

        @[JSON::Field(key: "type")]
        getter start_record_type : String?

        def initialize(
          @hosted_zone_id : String,
          @max_items : String? = nil,
          @start_record_identifier : String? = nil,
          @start_record_name : String? = nil,
          @start_record_type : String? = nil
        )
        end
      end

      # A complex type that contains list information for the resource record set.

      struct ListResourceRecordSetsResponse
        include JSON::Serializable

        # A flag that indicates whether more resource record sets remain to be listed. If your results were
        # truncated, you can make a follow-up pagination request by using the NextRecordName element.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The maximum number of records you requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # Information about multiple resource record sets.

        @[JSON::Field(key: "ResourceRecordSets")]
        getter resource_record_sets : Array(Types::ResourceRecordSet)

        # Resource record sets that have a routing policy other than simple: If results were truncated for a
        # given DNS name and type, the value of SetIdentifier for the next resource record set that has the
        # current DNS name and type. For information about routing policies, see Choosing a Routing Policy in
        # the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "NextRecordIdentifier")]
        getter next_record_identifier : String?

        # If the results were truncated, the name of the next record in the list. This element is present only
        # if IsTruncated is true.

        @[JSON::Field(key: "NextRecordName")]
        getter next_record_name : String?

        # If the results were truncated, the type of the next record in the list. This element is present only
        # if IsTruncated is true.

        @[JSON::Field(key: "NextRecordType")]
        getter next_record_type : String?

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @resource_record_sets : Array(Types::ResourceRecordSet),
          @next_record_identifier : String? = nil,
          @next_record_name : String? = nil,
          @next_record_type : String? = nil
        )
        end
      end

      # A request to get a list of the reusable delegation sets that are associated with the current Amazon
      # Web Services account.

      struct ListReusableDelegationSetsRequest
        include JSON::Serializable

        # If the value of IsTruncated in the previous response was true , you have more reusable delegation
        # sets. To get another group, submit another ListReusableDelegationSets request. For the value of
        # marker , specify the value of NextMarker from the previous response, which is the ID of the first
        # reusable delegation set that Amazon Route 53 will return if you submit another request. If the value
        # of IsTruncated in the previous response was false , there are no more reusable delegation sets to
        # get.

        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The number of reusable delegation sets that you want Amazon Route 53 to return in the response to
        # this request. If you specify a value greater than 100, Route 53 returns only the first 100 reusable
        # delegation sets.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # A complex type that contains information about the reusable delegation sets that are associated with
      # the current Amazon Web Services account.

      struct ListReusableDelegationSetsResponse
        include JSON::Serializable

        # A complex type that contains one DelegationSet element for each reusable delegation set that was
        # created by the current Amazon Web Services account.

        @[JSON::Field(key: "DelegationSets")]
        getter delegation_sets : Array(Types::DelegationSet)

        # A flag that indicates whether there are more reusable delegation sets to be listed.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the maxitems parameter in the call to ListReusableDelegationSets
        # that produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # For the second and subsequent calls to ListReusableDelegationSets , Marker is the value that you
        # specified for the marker parameter in the request that produced the current response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # If IsTruncated is true , the value of NextMarker identifies the next reusable delegation set that
        # Amazon Route 53 will return if you submit another ListReusableDelegationSets request and specify the
        # value of NextMarker in the marker parameter.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @delegation_sets : Array(Types::DelegationSet),
          @is_truncated : Bool,
          @max_items : String,
          @marker : String? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A complex type containing information about a request for a list of the tags that are associated
      # with an individual resource.

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ID of the resource for which you want to retrieve tags.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource. The resource type for health checks is healthcheck . The resource type for
        # hosted zones is hostedzone .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A complex type that contains information about the health checks or hosted zones for which you want
      # to list tags.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A ResourceTagSet containing tags associated with the specified resource.

        @[JSON::Field(key: "ResourceTagSet")]
        getter resource_tag_set : Types::ResourceTagSet

        def initialize(
          @resource_tag_set : Types::ResourceTagSet
        )
        end
      end

      # A complex type that contains information about the health checks or hosted zones for which you want
      # to list tags.

      struct ListTagsForResourcesRequest
        include JSON::Serializable

        # A complex type that contains the ResourceId element for each resource for which you want to get a
        # list of tags.

        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)

        # The type of the resources. The resource type for health checks is healthcheck . The resource type
        # for hosted zones is hostedzone .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @resource_ids : Array(String),
          @resource_type : String
        )
        end
      end

      # A complex type containing tags for the specified resources.

      struct ListTagsForResourcesResponse
        include JSON::Serializable

        # A list of ResourceTagSet s containing tags associated with the specified resources.

        @[JSON::Field(key: "ResourceTagSets")]
        getter resource_tag_sets : Array(Types::ResourceTagSet)

        def initialize(
          @resource_tag_sets : Array(Types::ResourceTagSet)
        )
        end
      end

      # A complex type that contains the information about the request to list the traffic policies that are
      # associated with the current Amazon Web Services account.

      struct ListTrafficPoliciesRequest
        include JSON::Serializable

        # (Optional) The maximum number of traffic policies that you want Amazon Route 53 to return in
        # response to this request. If you have more than MaxItems traffic policies, the value of IsTruncated
        # in the response is true , and the value of TrafficPolicyIdMarker is the ID of the first traffic
        # policy that Route 53 will return if you submit another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # (Conditional) For your first request to ListTrafficPolicies , don't include the
        # TrafficPolicyIdMarker parameter. If you have more traffic policies than the value of MaxItems ,
        # ListTrafficPolicies returns only the first MaxItems traffic policies. To get the next group of
        # policies, submit another request to ListTrafficPolicies . For the value of TrafficPolicyIdMarker ,
        # specify the value of TrafficPolicyIdMarker that was returned in the previous response.

        @[JSON::Field(key: "trafficpolicyid")]
        getter traffic_policy_id_marker : String?

        def initialize(
          @max_items : String? = nil,
          @traffic_policy_id_marker : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListTrafficPoliciesResponse
        include JSON::Serializable

        # A flag that indicates whether there are more traffic policies to be listed. If the response was
        # truncated, you can get the next group of traffic policies by submitting another ListTrafficPolicies
        # request and specifying the value of TrafficPolicyIdMarker in the TrafficPolicyIdMarker request
        # parameter.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the MaxItems parameter in the ListTrafficPolicies request that
        # produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # If the value of IsTruncated is true , TrafficPolicyIdMarker is the ID of the first traffic policy in
        # the next group of MaxItems traffic policies.

        @[JSON::Field(key: "TrafficPolicyIdMarker")]
        getter traffic_policy_id_marker : String

        # A list that contains one TrafficPolicySummary element for each traffic policy that was created by
        # the current Amazon Web Services account.

        @[JSON::Field(key: "TrafficPolicySummaries")]
        getter traffic_policy_summaries : Array(Types::TrafficPolicySummary)

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @traffic_policy_id_marker : String,
          @traffic_policy_summaries : Array(Types::TrafficPolicySummary)
        )
        end
      end

      # A request for the traffic policy instances that you created in a specified hosted zone.

      struct ListTrafficPolicyInstancesByHostedZoneRequest
        include JSON::Serializable

        # The ID of the hosted zone that you want to list traffic policy instances for.

        @[JSON::Field(key: "id")]
        getter hosted_zone_id : String

        # The maximum number of traffic policy instances to be included in the response body for this request.
        # If you have more than MaxItems traffic policy instances, the value of the IsTruncated element in the
        # response is true , and the values of HostedZoneIdMarker , TrafficPolicyInstanceNameMarker , and
        # TrafficPolicyInstanceTypeMarker represent the first traffic policy instance that Amazon Route 53
        # will return if you submit another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # If the value of IsTruncated in the previous response is true, you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstances request.
        # For the value of trafficpolicyinstancename , specify the value of TrafficPolicyInstanceNameMarker
        # from the previous response, which is the name of the first traffic policy instance in the next group
        # of traffic policy instances. If the value of IsTruncated in the previous response was false , there
        # are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancename")]
        getter traffic_policy_instance_name_marker : String?

        # If the value of IsTruncated in the previous response is true, you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstances request.
        # For the value of trafficpolicyinstancetype , specify the value of TrafficPolicyInstanceTypeMarker
        # from the previous response, which is the type of the first traffic policy instance in the next group
        # of traffic policy instances. If the value of IsTruncated in the previous response was false , there
        # are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancetype")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @hosted_zone_id : String,
          @max_items : String? = nil,
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListTrafficPolicyInstancesByHostedZoneResponse
        include JSON::Serializable

        # A flag that indicates whether there are more traffic policy instances to be listed. If the response
        # was truncated, you can get the next group of traffic policy instances by submitting another
        # ListTrafficPolicyInstancesByHostedZone request and specifying the values of HostedZoneIdMarker ,
        # TrafficPolicyInstanceNameMarker , and TrafficPolicyInstanceTypeMarker in the corresponding request
        # parameters.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the MaxItems parameter in the
        # ListTrafficPolicyInstancesByHostedZone request that produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # A list that contains one TrafficPolicyInstance element for each traffic policy instance that matches
        # the elements in the request.

        @[JSON::Field(key: "TrafficPolicyInstances")]
        getter traffic_policy_instances : Array(Types::TrafficPolicyInstance)

        # If IsTruncated is true , TrafficPolicyInstanceNameMarker is the name of the first traffic policy
        # instance in the next group of traffic policy instances.

        @[JSON::Field(key: "TrafficPolicyInstanceNameMarker")]
        getter traffic_policy_instance_name_marker : String?

        # If IsTruncated is true, TrafficPolicyInstanceTypeMarker is the DNS type of the resource record sets
        # that are associated with the first traffic policy instance in the next group of traffic policy
        # instances.

        @[JSON::Field(key: "TrafficPolicyInstanceTypeMarker")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @traffic_policy_instances : Array(Types::TrafficPolicyInstance),
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A complex type that contains the information about the request to list your traffic policy
      # instances.

      struct ListTrafficPolicyInstancesByPolicyRequest
        include JSON::Serializable

        # The ID of the traffic policy for which you want to list traffic policy instances.

        @[JSON::Field(key: "id")]
        getter traffic_policy_id : String

        # The version of the traffic policy for which you want to list traffic policy instances. The version
        # must be associated with the traffic policy that is specified by TrafficPolicyId .

        @[JSON::Field(key: "version")]
        getter traffic_policy_version : Int32

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstancesByPolicy
        # request. For the value of hostedzoneid , specify the value of HostedZoneIdMarker from the previous
        # response, which is the hosted zone ID of the first traffic policy instance that Amazon Route 53 will
        # return if you submit another request. If the value of IsTruncated in the previous response was false
        # , there are no more traffic policy instances to get.

        @[JSON::Field(key: "hostedzoneid")]
        getter hosted_zone_id_marker : String?

        # The maximum number of traffic policy instances to be included in the response body for this request.
        # If you have more than MaxItems traffic policy instances, the value of the IsTruncated element in the
        # response is true , and the values of HostedZoneIdMarker , TrafficPolicyInstanceNameMarker , and
        # TrafficPolicyInstanceTypeMarker represent the first traffic policy instance that Amazon Route 53
        # will return if you submit another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstancesByPolicy
        # request. For the value of trafficpolicyinstancename , specify the value of
        # TrafficPolicyInstanceNameMarker from the previous response, which is the name of the first traffic
        # policy instance that Amazon Route 53 will return if you submit another request. If the value of
        # IsTruncated in the previous response was false , there are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancename")]
        getter traffic_policy_instance_name_marker : String?

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstancesByPolicy
        # request. For the value of trafficpolicyinstancetype , specify the value of
        # TrafficPolicyInstanceTypeMarker from the previous response, which is the name of the first traffic
        # policy instance that Amazon Route 53 will return if you submit another request. If the value of
        # IsTruncated in the previous response was false , there are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancetype")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @traffic_policy_id : String,
          @traffic_policy_version : Int32,
          @hosted_zone_id_marker : String? = nil,
          @max_items : String? = nil,
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListTrafficPolicyInstancesByPolicyResponse
        include JSON::Serializable

        # A flag that indicates whether there are more traffic policy instances to be listed. If the response
        # was truncated, you can get the next group of traffic policy instances by calling
        # ListTrafficPolicyInstancesByPolicy again and specifying the values of the HostedZoneIdMarker ,
        # TrafficPolicyInstanceNameMarker , and TrafficPolicyInstanceTypeMarker elements in the corresponding
        # request parameters.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the MaxItems parameter in the call to
        # ListTrafficPolicyInstancesByPolicy that produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # A list that contains one TrafficPolicyInstance element for each traffic policy instance that matches
        # the elements in the request.

        @[JSON::Field(key: "TrafficPolicyInstances")]
        getter traffic_policy_instances : Array(Types::TrafficPolicyInstance)

        # If IsTruncated is true , HostedZoneIdMarker is the ID of the hosted zone of the first traffic policy
        # instance in the next group of traffic policy instances.

        @[JSON::Field(key: "HostedZoneIdMarker")]
        getter hosted_zone_id_marker : String?

        # If IsTruncated is true , TrafficPolicyInstanceNameMarker is the name of the first traffic policy
        # instance in the next group of MaxItems traffic policy instances.

        @[JSON::Field(key: "TrafficPolicyInstanceNameMarker")]
        getter traffic_policy_instance_name_marker : String?

        # If IsTruncated is true , TrafficPolicyInstanceTypeMarker is the DNS type of the resource record sets
        # that are associated with the first traffic policy instance in the next group of MaxItems traffic
        # policy instances.

        @[JSON::Field(key: "TrafficPolicyInstanceTypeMarker")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @traffic_policy_instances : Array(Types::TrafficPolicyInstance),
          @hosted_zone_id_marker : String? = nil,
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A request to get information about the traffic policy instances that you created by using the
      # current Amazon Web Services account.

      struct ListTrafficPolicyInstancesRequest
        include JSON::Serializable

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstances request.
        # For the value of HostedZoneId , specify the value of HostedZoneIdMarker from the previous response,
        # which is the hosted zone ID of the first traffic policy instance in the next group of traffic policy
        # instances. If the value of IsTruncated in the previous response was false , there are no more
        # traffic policy instances to get.

        @[JSON::Field(key: "hostedzoneid")]
        getter hosted_zone_id_marker : String?

        # The maximum number of traffic policy instances that you want Amazon Route 53 to return in response
        # to a ListTrafficPolicyInstances request. If you have more than MaxItems traffic policy instances,
        # the value of the IsTruncated element in the response is true , and the values of HostedZoneIdMarker
        # , TrafficPolicyInstanceNameMarker , and TrafficPolicyInstanceTypeMarker represent the first traffic
        # policy instance in the next group of MaxItems traffic policy instances.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstances request.
        # For the value of trafficpolicyinstancename , specify the value of TrafficPolicyInstanceNameMarker
        # from the previous response, which is the name of the first traffic policy instance in the next group
        # of traffic policy instances. If the value of IsTruncated in the previous response was false , there
        # are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancename")]
        getter traffic_policy_instance_name_marker : String?

        # If the value of IsTruncated in the previous response was true , you have more traffic policy
        # instances. To get more traffic policy instances, submit another ListTrafficPolicyInstances request.
        # For the value of trafficpolicyinstancetype , specify the value of TrafficPolicyInstanceTypeMarker
        # from the previous response, which is the type of the first traffic policy instance in the next group
        # of traffic policy instances. If the value of IsTruncated in the previous response was false , there
        # are no more traffic policy instances to get.

        @[JSON::Field(key: "trafficpolicyinstancetype")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @hosted_zone_id_marker : String? = nil,
          @max_items : String? = nil,
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListTrafficPolicyInstancesResponse
        include JSON::Serializable

        # A flag that indicates whether there are more traffic policy instances to be listed. If the response
        # was truncated, you can get more traffic policy instances by calling ListTrafficPolicyInstances again
        # and specifying the values of the HostedZoneIdMarker , TrafficPolicyInstanceNameMarker , and
        # TrafficPolicyInstanceTypeMarker in the corresponding request parameters.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the MaxItems parameter in the call to ListTrafficPolicyInstances
        # that produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # A list that contains one TrafficPolicyInstance element for each traffic policy instance that matches
        # the elements in the request.

        @[JSON::Field(key: "TrafficPolicyInstances")]
        getter traffic_policy_instances : Array(Types::TrafficPolicyInstance)

        # If IsTruncated is true , HostedZoneIdMarker is the ID of the hosted zone of the first traffic policy
        # instance that Route 53 will return if you submit another ListTrafficPolicyInstances request.

        @[JSON::Field(key: "HostedZoneIdMarker")]
        getter hosted_zone_id_marker : String?

        # If IsTruncated is true , TrafficPolicyInstanceNameMarker is the name of the first traffic policy
        # instance that Route 53 will return if you submit another ListTrafficPolicyInstances request.

        @[JSON::Field(key: "TrafficPolicyInstanceNameMarker")]
        getter traffic_policy_instance_name_marker : String?

        # If IsTruncated is true , TrafficPolicyInstanceTypeMarker is the DNS type of the resource record sets
        # that are associated with the first traffic policy instance that Amazon Route 53 will return if you
        # submit another ListTrafficPolicyInstances request.

        @[JSON::Field(key: "TrafficPolicyInstanceTypeMarker")]
        getter traffic_policy_instance_type_marker : String?

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @traffic_policy_instances : Array(Types::TrafficPolicyInstance),
          @hosted_zone_id_marker : String? = nil,
          @traffic_policy_instance_name_marker : String? = nil,
          @traffic_policy_instance_type_marker : String? = nil
        )
        end
      end

      # A complex type that contains the information about the request to list your traffic policies.

      struct ListTrafficPolicyVersionsRequest
        include JSON::Serializable

        # Specify the value of Id of the traffic policy for which you want to list all versions.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The maximum number of traffic policy versions that you want Amazon Route 53 to include in the
        # response body for this request. If the specified traffic policy has more than MaxItems versions, the
        # value of IsTruncated in the response is true , and the value of the TrafficPolicyVersionMarker
        # element is the ID of the first version that Route 53 will return if you submit another request.

        @[JSON::Field(key: "maxitems")]
        getter max_items : String?

        # For your first request to ListTrafficPolicyVersions , don't include the TrafficPolicyVersionMarker
        # parameter. If you have more traffic policy versions than the value of MaxItems ,
        # ListTrafficPolicyVersions returns only the first group of MaxItems versions. To get more traffic
        # policy versions, submit another ListTrafficPolicyVersions request. For the value of
        # TrafficPolicyVersionMarker , specify the value of TrafficPolicyVersionMarker in the previous
        # response.

        @[JSON::Field(key: "trafficpolicyversion")]
        getter traffic_policy_version_marker : String?

        def initialize(
          @id : String,
          @max_items : String? = nil,
          @traffic_policy_version_marker : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListTrafficPolicyVersionsResponse
        include JSON::Serializable

        # A flag that indicates whether there are more traffic policies to be listed. If the response was
        # truncated, you can get the next group of traffic policies by submitting another
        # ListTrafficPolicyVersions request and specifying the value of NextMarker in the marker parameter.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you specified for the maxitems parameter in the ListTrafficPolicyVersions request
        # that produced the current response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String

        # A list that contains one TrafficPolicy element for each traffic policy version that is associated
        # with the specified traffic policy.

        @[JSON::Field(key: "TrafficPolicies")]
        getter traffic_policies : Array(Types::TrafficPolicy)

        # If IsTruncated is true , the value of TrafficPolicyVersionMarker identifies the first traffic policy
        # that Amazon Route 53 will return if you submit another request. Call ListTrafficPolicyVersions again
        # and specify the value of TrafficPolicyVersionMarker in the TrafficPolicyVersionMarker request
        # parameter. This element is present only if IsTruncated is true .

        @[JSON::Field(key: "TrafficPolicyVersionMarker")]
        getter traffic_policy_version_marker : String

        def initialize(
          @is_truncated : Bool,
          @max_items : String,
          @traffic_policies : Array(Types::TrafficPolicy),
          @traffic_policy_version_marker : String
        )
        end
      end

      # A complex type that contains information about that can be associated with your hosted zone.

      struct ListVPCAssociationAuthorizationsRequest
        include JSON::Serializable

        # The ID of the hosted zone for which you want a list of VPCs that can be associated with the hosted
        # zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # Optional : An integer that specifies the maximum number of VPCs that you want Amazon Route 53 to
        # return. If you don't specify a value for MaxResults , Route 53 returns up to 50 VPCs per page.

        @[JSON::Field(key: "maxresults")]
        getter max_results : String?

        # Optional : If a response includes a NextToken element, there are more VPCs that can be associated
        # with the specified hosted zone. To get the next page of results, submit another request, and include
        # the value of NextToken from the response in the nexttoken parameter in another
        # ListVPCAssociationAuthorizations request.

        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @hosted_zone_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A complex type that contains the response information for the request.

      struct ListVPCAssociationAuthorizationsResponse
        include JSON::Serializable

        # The ID of the hosted zone that you can associate the listed VPCs with.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The list of VPCs that are authorized to be associated with the specified hosted zone.

        @[JSON::Field(key: "VPCs")]
        getter vp_cs : Array(Types::VPC)

        # When the response includes a NextToken element, there are more VPCs that can be associated with the
        # specified hosted zone. To get the next page of VPCs, submit another ListVPCAssociationAuthorizations
        # request, and include the value of the NextToken element from the response in the nexttoken request
        # parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hosted_zone_id : String,
          @vp_cs : Array(Types::VPC),
          @next_token : String? = nil
        )
        end
      end

      # A complex type that contains information about the CIDR location.

      struct LocationSummary
        include JSON::Serializable

        # A string that specifies a location name.

        @[JSON::Field(key: "LocationName")]
        getter location_name : String?

        def initialize(
          @location_name : String? = nil
        )
        end
      end

      # A change with the specified change ID does not exist.

      struct NoSuchChange
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CIDR collection you specified, doesn't exist.

      struct NoSuchCidrCollectionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CIDR collection location doesn't match any locations in your account.

      struct NoSuchCidrLocationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There is no CloudWatch Logs log group with the specified ARN.

      struct NoSuchCloudWatchLogsLogGroup
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A reusable delegation set with the specified ID does not exist.

      struct NoSuchDelegationSet
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Route 53 doesn't support the specified geographic location. For a list of supported
      # geolocation codes, see the GeoLocation data type.

      struct NoSuchGeoLocation
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No health check exists with the specified ID.

      struct NoSuchHealthCheck
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No hosted zone exists with the ID that you specified.

      struct NoSuchHostedZone
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified key-signing key (KSK) doesn't exist.

      struct NoSuchKeySigningKey
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There is no DNS query logging configuration with the specified ID.

      struct NoSuchQueryLoggingConfig
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No traffic policy exists with the specified ID.

      struct NoSuchTrafficPolicy
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No traffic policy instance exists with the specified ID.

      struct NoSuchTrafficPolicyInstance
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Associating the specified VPC with the specified hosted zone has not been authorized.

      struct NotAuthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If Amazon Route 53 can't process a request before the next request arrives, it will reject
      # subsequent requests for the same hosted zone and return an HTTP 400 error ( Bad request ). If Route
      # 53 returns this error repeatedly for the same request, we recommend that you wait, in intervals of
      # increasing duration, before you try the request again.

      struct PriorRequestNotComplete
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You're trying to associate a VPC with a public hosted zone. Amazon Route 53 doesn't support
      # associating a VPC with a public hosted zone.

      struct PublicZoneVPCAssociation
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about a configuration for DNS query logging.

      struct QueryLoggingConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch Logs log group that Amazon Route 53 is publishing
        # logs to.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String

        # The ID of the hosted zone that CloudWatch Logs is logging queries for.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The ID for a configuration for DNS query logging.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @cloud_watch_logs_log_group_arn : String,
          @hosted_zone_id : String,
          @id : String
        )
        end
      end

      # You can create only one query logging configuration for a hosted zone, and a query logging
      # configuration already exists for this hosted zone.

      struct QueryLoggingConfigAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information specific to the resource record. If you're creating an alias resource record set, omit
      # ResourceRecord .

      struct ResourceRecord
        include JSON::Serializable

        # The current or new DNS record value, not to exceed 4,000 characters. In the case of a DELETE action,
        # if the current value does not match the actual value, an error is returned. For descriptions about
        # how to format Value for different record types, see Supported DNS Resource Record Types in the
        # Amazon Route 53 Developer Guide . You can specify more than one value for all record types except
        # CNAME and SOA . If you're creating an alias resource record set, omit Value .

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # Information about the resource record set to create or delete.

      struct ResourceRecordSet
        include JSON::Serializable

        # For ChangeResourceRecordSets requests, the name of the record that you want to create, update, or
        # delete. For ListResourceRecordSets responses, the name of a record in the specified hosted zone.
        # ChangeResourceRecordSets Only Enter a fully qualified domain name, for example, www.example.com .
        # You can optionally include a trailing dot. If you omit the trailing dot, Amazon Route 53 assumes
        # that the domain name that you specify is fully qualified. This means that Route 53 treats
        # www.example.com (without a trailing dot) and www.example.com. (with a trailing dot) as identical.
        # For information about how to specify characters other than a-z , 0-9 , and - (hyphen) and how to
        # specify internationalized domain names, see DNS Domain Name Format in the Amazon Route 53 Developer
        # Guide . You can use the asterisk (*) wildcard to replace the leftmost label in a domain name, for
        # example, *.example.com . Note the following: The * must replace the entire label. For example, you
        # can't specify *prod.example.com or prod*.example.com . The * can't replace any of the middle labels,
        # for example, marketing.*.example.com. If you include * in any position other than the leftmost label
        # in a domain name, DNS treats it as an * character (ASCII 42), not as a wildcard. You can't use the *
        # wildcard for resource records sets that have a type of NS.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The DNS record type. For information about different record types and how data is encoded for them,
        # see Supported DNS Resource Record Types in the Amazon Route 53 Developer Guide . Valid values for
        # basic resource record sets: A | AAAA | CAA | CNAME | DS | MX | NAPTR | NS | PTR | SOA | SPF | SRV |
        # TXT | TLSA | SSHFP | SVCB | HTTPS Values for weighted, latency, geolocation, and failover resource
        # record sets: A | AAAA | CAA | CNAME | MX | NAPTR | PTR | SPF | SRV | TXT | TLSA | SSHFP | SVCB |
        # HTTPS . When creating a group of weighted, latency, geolocation, or failover resource record sets,
        # specify the same value for all of the resource record sets in the group. Valid values for multivalue
        # answer resource record sets: A | AAAA | MX | NAPTR | PTR | SPF | SRV | TXT | CAA | TLSA | SSHFP |
        # SVCB | HTTPS SPF records were formerly used to verify the identity of the sender of email messages.
        # However, we no longer recommend that you create resource record sets for which the value of Type is
        # SPF . RFC 7208, Sender Policy Framework (SPF) for Authorizing Use of Domains in Email, Version 1 ,
        # has been updated to say, "...[I]ts existence and mechanism defined in [RFC4408] have led to some
        # interoperability issues. Accordingly, its use is no longer appropriate for SPF version 1;
        # implementations are not to use it." In RFC 7208, see section 14.1, The SPF DNS Record Type . Values
        # for alias resource record sets: Amazon API Gateway custom regional APIs and edge-optimized APIs: A
        # CloudFront distributions: A If IPv6 is enabled for the distribution, create two resource record sets
        # to route traffic to your distribution, one with a value of A and one with a value of AAAA . Amazon
        # API Gateway environment that has a regionalized subdomain : A ELB load balancers: A | AAAA Amazon S3
        # buckets: A Amazon Virtual Private Cloud interface VPC endpoints A Another resource record set in
        # this hosted zone: Specify the type of the resource record set that you're creating the alias for.
        # All values are supported except NS and SOA . If you're creating an alias record that has the same
        # name as the hosted zone (known as the zone apex), you can't route traffic to a record for which the
        # value of Type is CNAME . This is because the alias record must have the same type as the record
        # you're routing traffic to, and creating a CNAME record for the zone apex isn't supported even for an
        # alias record.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Alias resource record sets only: Information about the Amazon Web Services resource, such as a
        # CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to. If you're
        # creating resource records sets for a private hosted zone, note the following: You can't create an
        # alias resource record set in a private hosted zone to route traffic to a CloudFront distribution.
        # For information about creating failover resource record sets in a private hosted zone, see
        # Configuring Failover in a Private Hosted Zone in the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "AliasTarget")]
        getter alias_target : Types::AliasTarget?


        @[JSON::Field(key: "CidrRoutingConfig")]
        getter cidr_routing_config : Types::CidrRoutingConfig?

        # Failover resource record sets only: To configure failover, you add the Failover element to two
        # resource record sets. For one resource record set, you specify PRIMARY as the value for Failover ;
        # for the other resource record set, you specify SECONDARY . In addition, you include the
        # HealthCheckId element and specify the health check that you want Amazon Route 53 to perform for each
        # resource record set. Except where noted, the following failover behaviors assume that you have
        # included the HealthCheckId element in both resource record sets: When the primary resource record
        # set is healthy, Route 53 responds to DNS queries with the applicable value from the primary resource
        # record set regardless of the health of the secondary resource record set. When the primary resource
        # record set is unhealthy and the secondary resource record set is healthy, Route 53 responds to DNS
        # queries with the applicable value from the secondary resource record set. When the secondary
        # resource record set is unhealthy, Route 53 responds to DNS queries with the applicable value from
        # the primary resource record set regardless of the health of the primary resource record set. If you
        # omit the HealthCheckId element for the secondary resource record set, and if the primary resource
        # record set is unhealthy, Route 53 always responds to DNS queries with the applicable value from the
        # secondary resource record set. This is true regardless of the health of the associated endpoint. You
        # can't create non-failover resource record sets that have the same values for the Name and Type
        # elements as failover resource record sets. For failover alias resource record sets, you must also
        # include the EvaluateTargetHealth element and set the value to true. For more information about
        # configuring failover for Route 53, see the following topics in the Amazon Route 53 Developer Guide :
        # Route 53 Health Checks and DNS Failover Configuring Failover in a Private Hosted Zone

        @[JSON::Field(key: "Failover")]
        getter failover : String?

        # Geolocation resource record sets only: A complex type that lets you control how Amazon Route 53
        # responds to DNS queries based on the geographic origin of the query. For example, if you want all
        # queries from Africa to be routed to a web server with an IP address of 192.0.2.111 , create a
        # resource record set with a Type of A and a ContinentCode of AF . If you create separate resource
        # record sets for overlapping geographic regions (for example, one resource record set for a continent
        # and one for a country on the same continent), priority goes to the smallest geographic region. This
        # allows you to route most queries for a continent to one resource and to route queries for a country
        # on that continent to a different resource. You can't create two geolocation resource record sets
        # that specify the same geographic location. The value * in the CountryCode element matches all
        # geographic locations that aren't specified in other geolocation resource record sets that have the
        # same values for the Name and Type elements. Geolocation works by mapping IP addresses to locations.
        # However, some IP addresses aren't mapped to geographic locations, so even if you create geolocation
        # resource record sets that cover all seven continents, Route 53 will receive some DNS queries from
        # locations that it can't identify. We recommend that you create a resource record set for which the
        # value of CountryCode is * . Two groups of queries are routed to the resource that you specify in
        # this record: queries that come from locations for which you haven't created geolocation resource
        # record sets and queries from IP addresses that aren't mapped to a location. If you don't create a *
        # resource record set, Route 53 returns a "no answer" response for queries from those locations. You
        # can't create non-geolocation resource record sets that have the same values for the Name and Type
        # elements as geolocation resource record sets.

        @[JSON::Field(key: "GeoLocation")]
        getter geo_location : Types::GeoLocation?

        # GeoproximityLocation resource record sets only: A complex type that lets you control how Route 53
        # responds to DNS queries based on the geographic origin of the query and your resources.

        @[JSON::Field(key: "GeoProximityLocation")]
        getter geo_proximity_location : Types::GeoProximityLocation?

        # If you want Amazon Route 53 to return this resource record set in response to a DNS query only when
        # the status of a health check is healthy, include the HealthCheckId element and specify the ID of the
        # applicable health check. Route 53 determines whether a resource record set is healthy based on one
        # of the following: By periodically sending a request to the endpoint that is specified in the health
        # check By aggregating the status of a specified group of health checks (calculated health checks) By
        # determining the current state of a CloudWatch alarm (CloudWatch metric health checks) Route 53
        # doesn't check the health of the endpoint that is specified in the resource record set, for example,
        # the endpoint specified by the IP address in the Value element. When you add a HealthCheckId element
        # to a resource record set, Route 53 checks the health of the endpoint that you specified in the
        # health check. For more information, see the following topics in the Amazon Route 53 Developer Guide
        # : How Amazon Route 53 Determines Whether an Endpoint Is Healthy Route 53 Health Checks and DNS
        # Failover Configuring Failover in a Private Hosted Zone When to Specify HealthCheckId Specifying a
        # value for HealthCheckId is useful only when Route 53 is choosing between two or more resource record
        # sets to respond to a DNS query, and you want Route 53 to base the choice in part on the status of a
        # health check. Configuring health checks makes sense only in the following configurations: Non-alias
        # resource record sets : You're checking the health of a group of non-alias resource record sets that
        # have the same routing policy, name, and type (such as multiple weighted records named
        # www.example.com with a type of A) and you specify health check IDs for all the resource record sets.
        # If the health check status for a resource record set is healthy, Route 53 includes the record among
        # the records that it responds to DNS queries with. If the health check status for a resource record
        # set is unhealthy, Route 53 stops responding to DNS queries using the value for that resource record
        # set. If the health check status for all resource record sets in the group is unhealthy, Route 53
        # considers all resource record sets in the group healthy and responds to DNS queries accordingly.
        # Alias resource record sets : You specify the following settings: You set EvaluateTargetHealth to
        # true for an alias resource record set in a group of resource record sets that have the same routing
        # policy, name, and type (such as multiple weighted records named www.example.com with a type of A).
        # You configure the alias resource record set to route traffic to a non-alias resource record set in
        # the same hosted zone. You specify a health check ID for the non-alias resource record set. If the
        # health check status is healthy, Route 53 considers the alias resource record set to be healthy and
        # includes the alias record among the records that it responds to DNS queries with. If the health
        # check status is unhealthy, Route 53 stops responding to DNS queries using the alias resource record
        # set. The alias resource record set can also route traffic to a group of non-alias resource record
        # sets that have the same routing policy, name, and type. In that configuration, associate health
        # checks with all of the resource record sets in the group of non-alias resource record sets.
        # Geolocation Routing For geolocation resource record sets, if an endpoint is unhealthy, Route 53
        # looks for a resource record set for the larger, associated geographic region. For example, suppose
        # you have resource record sets for a state in the United States, for the entire United States, for
        # North America, and a resource record set that has * for CountryCode is * , which applies to all
        # locations. If the endpoint for the state resource record set is unhealthy, Route 53 checks for
        # healthy resource record sets in the following order until it finds a resource record set for which
        # the endpoint is healthy: The United States North America The default resource record set Specifying
        # the Health Check Endpoint by Domain Name If your health checks specify the endpoint only by domain
        # name, we recommend that you create a separate health check for each endpoint. For example, create a
        # health check for each HTTP server that is serving content for www.example.com . For the value of
        # FullyQualifiedDomainName , specify the domain name of the server (such as us-east-2-www.example.com
        # ), not the name of the resource record sets ( www.example.com ). Health check results will be
        # unpredictable if you do the following: Create a health check that has the same value for
        # FullyQualifiedDomainName as the name of a resource record set. Associate that health check with the
        # resource record set.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String?

        # Multivalue answer resource record sets only : To route traffic approximately randomly to multiple
        # resources, such as web servers, create one multivalue answer record for each resource and specify
        # true for MultiValueAnswer . Note the following: If you associate a health check with a multivalue
        # answer resource record set, Amazon Route 53 responds to DNS queries with the corresponding IP
        # address only when the health check is healthy. If you don't associate a health check with a
        # multivalue answer record, Route 53 always considers the record to be healthy. Route 53 responds to
        # DNS queries with up to eight healthy records; if you have eight or fewer healthy records, Route 53
        # responds to all DNS queries with all the healthy records. If you have more than eight healthy
        # records, Route 53 responds to different DNS resolvers with different combinations of healthy
        # records. When all records are unhealthy, Route 53 responds to DNS queries with up to eight unhealthy
        # records. If a resource becomes unavailable after a resolver caches a response, client software
        # typically tries another of the IP addresses in the response. You can't create multivalue answer
        # alias records.

        @[JSON::Field(key: "MultiValueAnswer")]
        getter multi_value_answer : Bool?

        # Latency-based resource record sets only: The Amazon EC2 Region where you created the resource that
        # this resource record set refers to. The resource typically is an Amazon Web Services resource, such
        # as an EC2 instance or an ELB load balancer, and is referred to by an IP address or a DNS domain
        # name, depending on the record type. When Amazon Route 53 receives a DNS query for a domain name and
        # type for which you have created latency resource record sets, Route 53 selects the latency resource
        # record set that has the lowest latency between the end user and the associated Amazon EC2 Region.
        # Route 53 then returns the value that is associated with the selected resource record set. Note the
        # following: You can only specify one ResourceRecord per latency resource record set. You can only
        # create one latency resource record set for each Amazon EC2 Region. You aren't required to create
        # latency resource record sets for all Amazon EC2 Regions. Route 53 will choose the region with the
        # best latency from among the regions that you create latency resource record sets for. You can't
        # create non-latency resource record sets that have the same values for the Name and Type elements as
        # latency resource record sets.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Information about the resource records to act upon. If you're creating an alias resource record set,
        # omit ResourceRecords .

        @[JSON::Field(key: "ResourceRecords")]
        getter resource_records : Array(Types::ResourceRecord)?

        # Resource record sets that have a routing policy other than simple: An identifier that differentiates
        # among multiple resource record sets that have the same combination of name and type, such as
        # multiple weighted resource record sets named acme.example.com that have a type of A. In a group of
        # resource record sets that have the same name and type, the value of SetIdentifier must be unique for
        # each resource record set. For information about routing policies, see Choosing a Routing Policy in
        # the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "SetIdentifier")]
        getter set_identifier : String?

        # The resource record cache time to live (TTL), in seconds. Note the following: If you're creating or
        # updating an alias resource record set, omit TTL . Amazon Route 53 uses the value of TTL for the
        # alias target. If you're associating this resource record set with a health check (if you're adding a
        # HealthCheckId element), we recommend that you specify a TTL of 60 seconds or less so clients respond
        # quickly to changes in health status. All of the resource record sets in a group of weighted resource
        # record sets must have the same value for TTL . If a group of weighted resource record sets includes
        # one or more weighted alias resource record sets for which the alias target is an ELB load balancer,
        # we recommend that you specify a TTL of 60 seconds for all of the non-alias weighted resource record
        # sets that have the same name and type. Values other than 60 seconds (the TTL for load balancers)
        # will change the effect of the values that you specify for Weight .

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64?

        # When you create a traffic policy instance, Amazon Route 53 automatically creates a resource record
        # set. TrafficPolicyInstanceId is the ID of the traffic policy instance that Route 53 created this
        # resource record set for. To delete the resource record set that is associated with a traffic policy
        # instance, use DeleteTrafficPolicyInstance . Route 53 will delete the resource record set
        # automatically. If you delete the resource record set by using ChangeResourceRecordSets , Route 53
        # doesn't automatically delete the traffic policy instance, and you'll continue to be charged for it
        # even though it's no longer in use.

        @[JSON::Field(key: "TrafficPolicyInstanceId")]
        getter traffic_policy_instance_id : String?

        # Weighted resource record sets only: Among resource record sets that have the same combination of DNS
        # name and type, a value that determines the proportion of DNS queries that Amazon Route 53 responds
        # to using the current resource record set. Route 53 calculates the sum of the weights for the
        # resource record sets that have the same combination of DNS name and type. Route 53 then responds to
        # queries based on the ratio of a resource's weight to the total. Note the following: You must specify
        # a value for the Weight element for every weighted resource record set. You can only specify one
        # ResourceRecord per weighted resource record set. You can't create latency, failover, or geolocation
        # resource record sets that have the same values for the Name and Type elements as weighted resource
        # record sets. You can create a maximum of 100 weighted resource record sets that have the same values
        # for the Name and Type elements. For weighted (but not weighted alias) resource record sets, if you
        # set Weight to 0 for a resource record set, Route 53 never responds to queries with the applicable
        # value for that resource record set. However, if you set Weight to 0 for all resource record sets
        # that have the same combination of DNS name and type, traffic is routed to all resources with equal
        # probability. The effect of setting Weight to 0 is different when you associate health checks with
        # weighted resource record sets. For more information, see Options for Configuring Route 53
        # Active-Active and Active-Passive Failover in the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "Weight")]
        getter weight : Int64?

        def initialize(
          @name : String,
          @type : String,
          @alias_target : Types::AliasTarget? = nil,
          @cidr_routing_config : Types::CidrRoutingConfig? = nil,
          @failover : String? = nil,
          @geo_location : Types::GeoLocation? = nil,
          @geo_proximity_location : Types::GeoProximityLocation? = nil,
          @health_check_id : String? = nil,
          @multi_value_answer : Bool? = nil,
          @region : String? = nil,
          @resource_records : Array(Types::ResourceRecord)? = nil,
          @set_identifier : String? = nil,
          @ttl : Int64? = nil,
          @traffic_policy_instance_id : String? = nil,
          @weight : Int64? = nil
        )
        end
      end

      # A complex type containing a resource and its associated tags.

      struct ResourceTagSet
        include JSON::Serializable

        # The ID for the specified resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource. The resource type for health checks is healthcheck . The resource type for
        # hosted zones is hostedzone .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The tags associated with the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A complex type that contains the type of limit that you specified in the request and the current
      # value for that limit.

      struct ReusableDelegationSetLimit
        include JSON::Serializable

        # The limit that you requested: MAX_ZONES_BY_REUSABLE_DELEGATION_SET , the maximum number of hosted
        # zones that you can associate with the specified reusable delegation set.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The current value for the MAX_ZONES_BY_REUSABLE_DELEGATION_SET limit.

        @[JSON::Field(key: "Value")]
        getter value : Int64

        def initialize(
          @type : String,
          @value : Int64
        )
        end
      end

      # A complex type that contains the status that one Amazon Route 53 health checker reports and the time
      # of the health check.

      struct StatusReport
        include JSON::Serializable

        # The date and time that the health checker performed the health check in ISO 8601 format and
        # Coordinated Universal Time (UTC). For example, the value 2017-03-27T17:48:16.751Z represents March
        # 27, 2017 at 17:48:16.751 UTC.

        @[JSON::Field(key: "CheckedTime")]
        getter checked_time : Time?

        # A description of the status of the health check endpoint as reported by one of the Amazon Route 53
        # health checkers.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @checked_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # A complex type that contains information about a tag that you want to add or edit for the specified
      # health check or hosted zone.

      struct Tag
        include JSON::Serializable

        # The value of Key depends on the operation that you want to perform: Add a tag to a health check or
        # hosted zone : Key is the name that you want to give the new tag. Edit a tag : Key is the name of the
        # tag that you want to change the Value for. Delete a key : Key is the name of the tag you want to
        # remove. Give a name to a health check : Edit the default Name tag. In the Amazon Route 53 console,
        # the list of your health checks includes a Name column that lets you see the name that you've given
        # to each health check.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of Value depends on the operation that you want to perform: Add a tag to a health check or
        # hosted zone : Value is the value that you want to give the new tag. Edit a tag : Value is the new
        # value that you want to assign the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Gets the value that Amazon Route 53 returns in response to a DNS request for a specified record name
      # and type. You can optionally specify the IP address of a DNS resolver, an EDNS0 client subnet IP
      # address, and a subnet mask.

      struct TestDNSAnswerRequest
        include JSON::Serializable

        # The ID of the hosted zone that you want Amazon Route 53 to simulate a query for.

        @[JSON::Field(key: "hostedzoneid")]
        getter hosted_zone_id : String

        # The name of the resource record set that you want Amazon Route 53 to simulate a query for.

        @[JSON::Field(key: "recordname")]
        getter record_name : String

        # The type of the resource record set.

        @[JSON::Field(key: "recordtype")]
        getter record_type : String

        # If the resolver that you specified for resolverip supports EDNS0, specify the IPv4 or IPv6 address
        # of a client in the applicable location, for example, 192.0.2.44 or 2001:db8:85a3::8a2e:370:7334 .

        @[JSON::Field(key: "edns0clientsubnetip")]
        getter edns0_client_subnet_ip : String?

        # If you specify an IP address for edns0clientsubnetip , you can optionally specify the number of bits
        # of the IP address that you want the checking tool to include in the DNS query. For example, if you
        # specify 192.0.2.44 for edns0clientsubnetip and 24 for edns0clientsubnetmask , the checking tool will
        # simulate a request from 192.0.2.0/24. The default value is 24 bits for IPv4 addresses and 64 bits
        # for IPv6 addresses. The range of valid values depends on whether edns0clientsubnetip is an IPv4 or
        # an IPv6 address: IPv4 : Specify a value between 0 and 32 IPv6 : Specify a value between 0 and 128

        @[JSON::Field(key: "edns0clientsubnetmask")]
        getter edns0_client_subnet_mask : String?

        # If you want to simulate a request from a specific DNS resolver, specify the IP address for that
        # resolver. If you omit this value, TestDnsAnswer uses the IP address of a DNS resolver in the Amazon
        # Web Services US East (N. Virginia) Region ( us-east-1 ).

        @[JSON::Field(key: "resolverip")]
        getter resolver_ip : String?

        def initialize(
          @hosted_zone_id : String,
          @record_name : String,
          @record_type : String,
          @edns0_client_subnet_ip : String? = nil,
          @edns0_client_subnet_mask : String? = nil,
          @resolver_ip : String? = nil
        )
        end
      end

      # A complex type that contains the response to a TestDNSAnswer request.

      struct TestDNSAnswerResponse
        include JSON::Serializable

        # The Amazon Route 53 name server used to respond to the request.

        @[JSON::Field(key: "Nameserver")]
        getter nameserver : String

        # The protocol that Amazon Route 53 used to respond to the request, either UDP or TCP .

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # A list that contains values that Amazon Route 53 returned for this resource record set.

        @[JSON::Field(key: "RecordData")]
        getter record_data : Array(String)

        # The name of the resource record set that you submitted a request for.

        @[JSON::Field(key: "RecordName")]
        getter record_name : String

        # The type of the resource record set that you submitted a request for.

        @[JSON::Field(key: "RecordType")]
        getter record_type : String

        # A code that indicates whether the request is valid or not. The most common response code is NOERROR
        # , meaning that the request is valid. If the response is not valid, Amazon Route 53 returns a
        # response code that describes the error. For a list of possible response codes, see DNS RCODES on the
        # IANA website.

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : String

        def initialize(
          @nameserver : String,
          @protocol : String,
          @record_data : Array(String),
          @record_name : String,
          @record_type : String,
          @response_code : String
        )
        end
      end

      # The limit on the number of requests per second was exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This health check can't be created because the current account has reached the limit on the number
      # of active health checks. For information about default limits, see Limits in the Amazon Route 53
      # Developer Guide . For information about how to get the current limit for an account, see
      # GetAccountLimit . To request a higher limit, create a case with the Amazon Web Services Support
      # Center. You have reached the maximum number of active health checks for an Amazon Web Services
      # account. To request a higher limit, create a case with the Amazon Web Services Support Center.

      struct TooManyHealthChecks
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation can't be completed either because the current account has reached the limit on the
      # number of hosted zones or because you've reached the limit on the number of hosted zones that can be
      # associated with a reusable delegation set. For information about default limits, see Limits in the
      # Amazon Route 53 Developer Guide . To get the current limit on hosted zones that can be created by an
      # account, see GetAccountLimit . To get the current limit on hosted zones that can be associated with
      # a reusable delegation set, see GetReusableDelegationSetLimit . To request a higher limit, create a
      # case with the Amazon Web Services Support Center.

      struct TooManyHostedZones
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You've reached the limit for the number of key-signing keys (KSKs). Remove at least one KSK, and
      # then try again.

      struct TooManyKeySigningKeys
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This traffic policy can't be created because the current account has reached the limit on the number
      # of traffic policies. For information about default limits, see Limits in the Amazon Route 53
      # Developer Guide . To get the current limit for an account, see GetAccountLimit . To request a higher
      # limit, create a case with the Amazon Web Services Support Center.

      struct TooManyTrafficPolicies
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This traffic policy instance can't be created because the current account has reached the limit on
      # the number of traffic policy instances. For information about default limits, see Limits in the
      # Amazon Route 53 Developer Guide . For information about how to get the current limit for an account,
      # see GetAccountLimit . To request a higher limit, create a case with the Amazon Web Services Support
      # Center.

      struct TooManyTrafficPolicyInstances
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This traffic policy version can't be created because you've reached the limit of 1000 on the number
      # of versions that you can create for the current traffic policy. To create more traffic policy
      # versions, you can use GetTrafficPolicy to get the traffic policy document for a specified traffic
      # policy version, and then use CreateTrafficPolicy to create a new traffic policy using the traffic
      # policy document.

      struct TooManyTrafficPolicyVersionsForCurrentPolicy
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You've created the maximum number of authorizations that can be created for the specified hosted
      # zone. To authorize another VPC to be associated with the hosted zone, submit a
      # DeleteVPCAssociationAuthorization request to remove an existing authorization. To get a list of
      # existing authorizations, submit a ListVPCAssociationAuthorizations request.

      struct TooManyVPCAssociationAuthorizations
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains settings for a traffic policy.

      struct TrafficPolicy
        include JSON::Serializable

        # The definition of a traffic policy in JSON format. You specify the JSON document to use for a new
        # traffic policy in the CreateTrafficPolicy request. For more information about the JSON format, see
        # Traffic Policy Document Format .

        @[JSON::Field(key: "Document")]
        getter document : String

        # The ID that Amazon Route 53 assigned to a traffic policy when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name that you specified when you created the traffic policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy
        # to create a traffic policy instance.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The version number that Amazon Route 53 assigns to a traffic policy. For a new traffic policy, the
        # value of Version is always 1.

        @[JSON::Field(key: "Version")]
        getter version : Int32

        # The comment that you specify in the CreateTrafficPolicy request, if any.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @document : String,
          @id : String,
          @name : String,
          @type : String,
          @version : Int32,
          @comment : String? = nil
        )
        end
      end

      # A traffic policy that has the same value for Name already exists.

      struct TrafficPolicyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more traffic policy instances were created by using the specified traffic policy.

      struct TrafficPolicyInUse
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains settings for the new traffic policy instance.

      struct TrafficPolicyInstance
        include JSON::Serializable

        # The ID of the hosted zone that Amazon Route 53 created resource record sets in.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String

        # The ID that Amazon Route 53 assigned to the new traffic policy instance.

        @[JSON::Field(key: "Id")]
        getter id : String

        # If State is Failed , an explanation of the reason for the failure. If State is another value,
        # Message is empty.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The DNS name, such as www.example.com, for which Amazon Route 53 responds to queries by using the
        # resource record sets that are associated with this traffic policy instance.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of State is one of the following values: Applied Amazon Route 53 has finished creating
        # resource record sets, and changes have propagated to all Route 53 edge locations. Creating Route 53
        # is creating the resource record sets. Use GetTrafficPolicyInstance to confirm that the
        # CreateTrafficPolicyInstance request completed successfully. Failed Route 53 wasn't able to create or
        # update the resource record sets. When the value of State is Failed , see Message for an explanation
        # of what caused the request to fail.

        @[JSON::Field(key: "State")]
        getter state : String

        # The TTL that Amazon Route 53 assigned to all of the resource record sets that it created in the
        # specified hosted zone.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        # The ID of the traffic policy that Amazon Route 53 used to create resource record sets in the
        # specified hosted zone.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # The DNS type that Amazon Route 53 assigned to all of the resource record sets that it created for
        # this traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyType")]
        getter traffic_policy_type : String

        # The version of the traffic policy that Amazon Route 53 used to create resource record sets in the
        # specified hosted zone.

        @[JSON::Field(key: "TrafficPolicyVersion")]
        getter traffic_policy_version : Int32

        def initialize(
          @hosted_zone_id : String,
          @id : String,
          @message : String,
          @name : String,
          @state : String,
          @ttl : Int64,
          @traffic_policy_id : String,
          @traffic_policy_type : String,
          @traffic_policy_version : Int32
        )
        end
      end

      # There is already a traffic policy instance with the specified ID.

      struct TrafficPolicyInstanceAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about the latest version of one traffic policy that is
      # associated with the current Amazon Web Services account.

      struct TrafficPolicySummary
        include JSON::Serializable

        # The ID that Amazon Route 53 assigned to the traffic policy when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version number of the latest version of the traffic policy.

        @[JSON::Field(key: "LatestVersion")]
        getter latest_version : Int32

        # The name that you specified for the traffic policy when you created it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The number of traffic policies that are associated with the current Amazon Web Services account.

        @[JSON::Field(key: "TrafficPolicyCount")]
        getter traffic_policy_count : Int32

        # The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy
        # to create a traffic policy instance.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @latest_version : Int32,
          @name : String,
          @traffic_policy_count : Int32,
          @type : String
        )
        end
      end

      # A complex type that contains information about a request to update a health check.

      struct UpdateHealthCheckRequest
        include JSON::Serializable

        # The ID for the health check for which you want detailed information. When you created the health
        # check, CreateHealthCheck returned the ID in the response, in the HealthCheckId element.

        @[JSON::Field(key: "HealthCheckId")]
        getter health_check_id : String

        # A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to
        # use to determine whether the specified health check is healthy.

        @[JSON::Field(key: "AlarmIdentifier")]
        getter alarm_identifier : Types::AlarmIdentifier?

        # A complex type that contains one ChildHealthCheck element for each health check that you want to
        # associate with a CALCULATED health check.

        @[JSON::Field(key: "ChildHealthChecks")]
        getter child_health_checks : Array(String)?

        # Stops Route 53 from performing health checks. When you disable a health check, here's what happens:
        # Health checks that check the health of endpoints: Route 53 stops submitting requests to your
        # application, server, or other resource. Calculated health checks: Route 53 stops aggregating the
        # status of the referenced health checks. Health checks that monitor CloudWatch alarms: Route 53 stops
        # monitoring the corresponding CloudWatch metrics. After you disable a health check, Route 53
        # considers the status of the health check to always be healthy. If you configured DNS failover, Route
        # 53 continues to route traffic to the corresponding resources. Additionally, in disabled state, you
        # can also invert the status of the health check to route traffic differently. For more information,
        # see Inverted . Charges for a health check still apply when the health check is disabled. For more
        # information, see Amazon Route 53 Pricing .

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # Specify whether you want Amazon Route 53 to send the value of FullyQualifiedDomainName to the
        # endpoint in the client_hello message during TLS negotiation. This allows the endpoint to respond to
        # HTTPS health check requests with the applicable SSL/TLS certificate. Some endpoints require that
        # HTTPS requests include the host name in the client_hello message. If you don't enable SNI, the
        # status of the health check will be SSL alert handshake_failure . A health check can also have that
        # status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS
        # configuration on your endpoint and confirm that your certificate is valid. The SSL/TLS certificate
        # on your endpoint includes a domain name in the Common Name field and possibly several more in the
        # Subject Alternative Names field. One of the domain names in the certificate should match the value
        # that you specify for FullyQualifiedDomainName . If the endpoint responds to the client_hello message
        # with a certificate that does not include the domain name that you specified in
        # FullyQualifiedDomainName , a health checker will retry the handshake. In the second attempt, the
        # health checker will omit FullyQualifiedDomainName from the client_hello message.

        @[JSON::Field(key: "EnableSNI")]
        getter enable_sni : Bool?

        # The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to
        # change the current status of the endpoint from unhealthy to healthy or vice versa. For more
        # information, see How Amazon Route 53 Determines Whether an Endpoint Is Healthy in the Amazon Route
        # 53 Developer Guide . Otherwise, if you don't specify a value for FailureThreshold , the default
        # value is three health checks.

        @[JSON::Field(key: "FailureThreshold")]
        getter failure_threshold : Int32?

        # Amazon Route 53 behavior depends on whether you specify a value for IPAddress . If a health check
        # already has a value for IPAddress , you can change the value. However, you can't update an existing
        # health check to add or remove the value of IPAddress . If you specify a value for IPAddress : Route
        # 53 sends health check requests to the specified IPv4 or IPv6 address and passes the value of
        # FullyQualifiedDomainName in the Host header for all health checks except TCP health checks. This is
        # typically the fully qualified DNS name of the endpoint on which you want Route 53 to perform health
        # checks. When Route 53 checks the health of an endpoint, here is how it constructs the Host header:
        # If you specify a value of 80 for Port and HTTP or HTTP_STR_MATCH for Type , Route 53 passes the
        # value of FullyQualifiedDomainName to the endpoint in the Host header. If you specify a value of 443
        # for Port and HTTPS or HTTPS_STR_MATCH for Type , Route 53 passes the value of
        # FullyQualifiedDomainName to the endpoint in the Host header. If you specify another value for Port
        # and any value except TCP for Type , Route 53 passes FullyQualifiedDomainName : Port to the endpoint
        # in the Host header. If you don't specify a value for FullyQualifiedDomainName , Route 53 substitutes
        # the value of IPAddress in the Host header in each of the above cases. If you don't specify a value
        # for IPAddress : If you don't specify a value for IPAddress , Route 53 sends a DNS request to the
        # domain that you specify in FullyQualifiedDomainName at the interval you specify in RequestInterval .
        # Using an IPv4 address that is returned by DNS, Route 53 then checks the health of the endpoint. If
        # you don't specify a value for IPAddress , you can’t update the health check to remove the
        # FullyQualifiedDomainName ; if you don’t specify a value for IPAddress on creation, a
        # FullyQualifiedDomainName is required. If you don't specify a value for IPAddress , Route 53 uses
        # only IPv4 to send health checks to the endpoint. If there's no resource record set with a type of A
        # for the name that you specify for FullyQualifiedDomainName , the health check fails with a "DNS
        # resolution failed" error. If you want to check the health of weighted, latency, or failover resource
        # record sets and you choose to specify the endpoint only by FullyQualifiedDomainName , we recommend
        # that you create a separate health check for each endpoint. For example, create a health check for
        # each HTTP server that is serving content for www.example.com. For the value of
        # FullyQualifiedDomainName , specify the domain name of the server (such as us-east-2-www.example.com
        # ), not the name of the resource record sets (www.example.com). In this configuration, if the value
        # of FullyQualifiedDomainName matches the name of the resource record sets and you then associate the
        # health check with those resource record sets, health check results will be unpredictable. In
        # addition, if the value of Type is HTTP , HTTPS , HTTP_STR_MATCH , or HTTPS_STR_MATCH , Route 53
        # passes the value of FullyQualifiedDomainName in the Host header, as it does when you specify a value
        # for IPAddress . If the value of Type is TCP , Route 53 doesn't pass a Host header.

        @[JSON::Field(key: "FullyQualifiedDomainName")]
        getter fully_qualified_domain_name : String?

        # A sequential counter that Amazon Route 53 sets to 1 when you create a health check and increments by
        # 1 each time you update settings for the health check. We recommend that you use GetHealthCheck or
        # ListHealthChecks to get the current value of HealthCheckVersion for the health check that you want
        # to update, and that you include that value in your UpdateHealthCheck request. This prevents Route 53
        # from overwriting an intervening update: If the value in the UpdateHealthCheck request matches the
        # value of HealthCheckVersion in the health check, Route 53 updates the health check with the new
        # settings. If the value of HealthCheckVersion in the health check is greater, the health check was
        # changed after you got the version number. Route 53 does not update the health check, and it returns
        # a HealthCheckVersionMismatch error.

        @[JSON::Field(key: "HealthCheckVersion")]
        getter health_check_version : Int64?

        # The number of child health checks that are associated with a CALCULATED health that Amazon Route 53
        # must consider healthy for the CALCULATED health check to be considered healthy. To specify the child
        # health checks that you want to associate with a CALCULATED health check, use the ChildHealthChecks
        # and ChildHealthCheck elements. Note the following: If you specify a number greater than the number
        # of child health checks, Route 53 always considers this health check to be unhealthy. If you specify
        # 0 , Route 53 always considers this health check to be healthy.

        @[JSON::Field(key: "HealthThreshold")]
        getter health_threshold : Int32?

        # The IPv4 or IPv6 IP address for the endpoint that you want Amazon Route 53 to perform health checks
        # on. If you don't specify a value for IPAddress , Route 53 sends a DNS request to resolve the domain
        # name that you specify in FullyQualifiedDomainName at the interval that you specify in
        # RequestInterval . Using an IP address that is returned by DNS, Route 53 then checks the health of
        # the endpoint. Use one of the following formats for the value of IPAddress : IPv4 address : four
        # values between 0 and 255, separated by periods (.), for example, 192.0.2.44 . IPv6 address : eight
        # groups of four hexadecimal values, separated by colons (:), for example,
        # 2001:0db8:85a3:0000:0000:abcd:0001:2345 . You can also shorten IPv6 addresses as described in RFC
        # 5952, for example, 2001:db8:85a3::abcd:1:2345 . If the endpoint is an EC2 instance, we recommend
        # that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic
        # IP address for IPAddress . This ensures that the IP address of your instance never changes. For more
        # information, see the applicable documentation: Linux: Elastic IP Addresses (EIP) in the Amazon EC2
        # User Guide for Linux Instances Windows: Elastic IP Addresses (EIP) in the Amazon EC2 User Guide for
        # Windows Instances If a health check already has a value for IPAddress , you can change the value.
        # However, you can't update an existing health check to add or remove the value of IPAddress . For
        # more information, see FullyQualifiedDomainName . Constraints: Route 53 can't check the health of
        # endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more
        # information about IP addresses for which you can't create health checks, see the following
        # documents: RFC 5735, Special Use IPv4 Addresses RFC 6598, IANA-Reserved IPv4 Prefix for Shared
        # Address Space RFC 5156, Special-Use IPv6 Addresses

        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String?

        # When CloudWatch has insufficient data about the metric to determine the alarm state, the status that
        # you want Amazon Route 53 to assign to the health check: Healthy : Route 53 considers the health
        # check to be healthy. Unhealthy : Route 53 considers the health check to be unhealthy.
        # LastKnownStatus : By default, Route 53 uses the status of the health check from the last time
        # CloudWatch had sufficient data to determine the alarm state. For new health checks that have no last
        # known status, the status for the health check is healthy.

        @[JSON::Field(key: "InsufficientDataHealthStatus")]
        getter insufficient_data_health_status : String?

        # Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to
        # consider a health check unhealthy when it otherwise would be considered healthy.

        @[JSON::Field(key: "Inverted")]
        getter inverted : Bool?

        # The port on the endpoint that you want Amazon Route 53 to perform health checks on. Don't specify a
        # value for Port when you specify a value for Type of CLOUDWATCH_METRIC or CALCULATED .

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # A complex type that contains one Region element for each region that you want Amazon Route 53 health
        # checkers to check the specified endpoint from.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # A complex type that contains one ResettableElementName element for each element that you want to
        # reset to the default value. Valid values for ResettableElementName include the following:
        # ChildHealthChecks : Amazon Route 53 resets ChildHealthChecks to null. FullyQualifiedDomainName :
        # Route 53 resets FullyQualifiedDomainName . to null. Regions : Route 53 resets the Regions list to
        # the default set of regions. ResourcePath : Route 53 resets ResourcePath to null.

        @[JSON::Field(key: "ResetElements")]
        getter reset_elements : Array(String)?

        # The path that you want Amazon Route 53 to request when performing health checks. The path can be any
        # value for which your endpoint will return an HTTP status code of 2xx or 3xx when the endpoint is
        # healthy, for example the file /docs/route53-health-check.html. You can also include query string
        # parameters, for example, /welcome.html?language=jp&amp;login=y . Specify this value only if you want
        # to change it.

        @[JSON::Field(key: "ResourcePath")]
        getter resource_path : String?

        # If the value of Type is HTTP_STR_MATCH or HTTPS_STR_MATCH , the string that you want Amazon Route 53
        # to search for in the response body from the specified resource. If the string appears in the
        # response body, Route 53 considers the resource healthy. (You can't change the value of Type when you
        # update a health check.)

        @[JSON::Field(key: "SearchString")]
        getter search_string : String?

        def initialize(
          @health_check_id : String,
          @alarm_identifier : Types::AlarmIdentifier? = nil,
          @child_health_checks : Array(String)? = nil,
          @disabled : Bool? = nil,
          @enable_sni : Bool? = nil,
          @failure_threshold : Int32? = nil,
          @fully_qualified_domain_name : String? = nil,
          @health_check_version : Int64? = nil,
          @health_threshold : Int32? = nil,
          @ip_address : String? = nil,
          @insufficient_data_health_status : String? = nil,
          @inverted : Bool? = nil,
          @port : Int32? = nil,
          @regions : Array(String)? = nil,
          @reset_elements : Array(String)? = nil,
          @resource_path : String? = nil,
          @search_string : String? = nil
        )
        end
      end

      # A complex type that contains the response to the UpdateHealthCheck request.

      struct UpdateHealthCheckResponse
        include JSON::Serializable

        # A complex type that contains the response to an UpdateHealthCheck request.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : Types::HealthCheck

        def initialize(
          @health_check : Types::HealthCheck
        )
        end
      end

      # A request to update the comment for a hosted zone.

      struct UpdateHostedZoneCommentRequest
        include JSON::Serializable

        # The ID for the hosted zone that you want to update the comment for.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The new comment for the hosted zone. If you don't specify a value for Comment , Amazon Route 53
        # deletes the existing value of the Comment element, if any.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @id : String,
          @comment : String? = nil
        )
        end
      end

      # A complex type that contains the response to the UpdateHostedZoneComment request.

      struct UpdateHostedZoneCommentResponse
        include JSON::Serializable

        # A complex type that contains the response to the UpdateHostedZoneComment request.

        @[JSON::Field(key: "HostedZone")]
        getter hosted_zone : Types::HostedZone

        def initialize(
          @hosted_zone : Types::HostedZone
        )
        end
      end


      struct UpdateHostedZoneFeaturesRequest
        include JSON::Serializable

        # The ID of the hosted zone for which you want to update features. This is the unique identifier for
        # your hosted zone.

        @[JSON::Field(key: "Id")]
        getter hosted_zone_id : String

        # Specifies whether to enable accelerated recovery for the hosted zone. Set to true to enable
        # accelerated recovery, or false to disable it.

        @[JSON::Field(key: "EnableAcceleratedRecovery")]
        getter enable_accelerated_recovery : Bool?

        def initialize(
          @hosted_zone_id : String,
          @enable_accelerated_recovery : Bool? = nil
        )
        end
      end


      struct UpdateHostedZoneFeaturesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A complex type that contains information about the traffic policy that you want to update the
      # comment for.

      struct UpdateTrafficPolicyCommentRequest
        include JSON::Serializable

        # The new comment for the specified traffic policy and version.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The value of Id for the traffic policy that you want to update the comment for.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of Version for the traffic policy that you want to update the comment for.

        @[JSON::Field(key: "Version")]
        getter version : Int32

        def initialize(
          @comment : String,
          @id : String,
          @version : Int32
        )
        end
      end

      # A complex type that contains the response information for the traffic policy.

      struct UpdateTrafficPolicyCommentResponse
        include JSON::Serializable

        # A complex type that contains settings for the specified traffic policy.

        @[JSON::Field(key: "TrafficPolicy")]
        getter traffic_policy : Types::TrafficPolicy

        def initialize(
          @traffic_policy : Types::TrafficPolicy
        )
        end
      end

      # A complex type that contains information about the resource record sets that you want to update
      # based on a specified traffic policy instance.

      struct UpdateTrafficPolicyInstanceRequest
        include JSON::Serializable

        # The ID of the traffic policy instance that you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The TTL that you want Amazon Route 53 to assign to all of the updated resource record sets.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        # The ID of the traffic policy that you want Amazon Route 53 to use to update resource record sets for
        # the specified traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # The version of the traffic policy that you want Amazon Route 53 to use to update resource record
        # sets for the specified traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyVersion")]
        getter traffic_policy_version : Int32

        def initialize(
          @id : String,
          @ttl : Int64,
          @traffic_policy_id : String,
          @traffic_policy_version : Int32
        )
        end
      end

      # A complex type that contains information about the resource record sets that Amazon Route 53 created
      # based on a specified traffic policy.

      struct UpdateTrafficPolicyInstanceResponse
        include JSON::Serializable

        # A complex type that contains settings for the updated traffic policy instance.

        @[JSON::Field(key: "TrafficPolicyInstance")]
        getter traffic_policy_instance : Types::TrafficPolicyInstance

        def initialize(
          @traffic_policy_instance : Types::TrafficPolicyInstance
        )
        end
      end

      # (Private hosted zones only) A complex type that contains information about an Amazon VPC. If you
      # associate a private hosted zone with an Amazon VPC when you make a CreateHostedZone request, the
      # following parameters are also required.

      struct VPC
        include JSON::Serializable


        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String?

        # (Private hosted zones only) The region that an Amazon VPC was created in.

        @[JSON::Field(key: "VPCRegion")]
        getter vpc_region : String?

        def initialize(
          @vpc_id : String? = nil,
          @vpc_region : String? = nil
        )
        end
      end

      # The VPC that you specified is not authorized to be associated with the hosted zone.

      struct VPCAssociationAuthorizationNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified VPC and hosted zone are not currently associated.

      struct VPCAssociationNotFound
        include JSON::Serializable

        # The specified VPC or hosted zone weren't found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
