require "json"
require "time"

module AwsSdk
  module Shield
    module Types

      # Exception that indicates the specified AttackId does not exist, or the requester does not have the
      # appropriate permissions to access the AttackId .
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # In order to grant the necessary access to the Shield Response Team (SRT) the user submitting the
      # request must have the iam:PassRole permission. This error indicates the user did not have the
      # appropriate permissions. For more information, see Granting a User Permissions to Pass a Role to an
      # Amazon Web Services Service .
      struct AccessDeniedForDependencyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The automatic application layer DDoS mitigation settings for a Protection . This configuration
      # determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to
      # application layer events that Shield Advanced determines to be DDoS attacks.
      struct ApplicationLayerAutomaticResponseConfiguration
        include JSON::Serializable

        # Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on
        # behalf of the protected resource in response to DDoS attacks. You specify this as part of the
        # configuration for the automatic application layer DDoS mitigation feature, when you enable or update
        # automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group,
        # inside the web ACL that you have associated with the resource.
        @[JSON::Field(key: "Action")]
        getter action : Types::ResponseAction

        # Indicates whether automatic application layer DDoS mitigation is enabled for the protection.
        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @action : Types::ResponseAction,
          @status : String
        )
        end
      end

      struct AssociateDRTLogBucketRequest
        include JSON::Serializable

        # The Amazon S3 bucket that contains the logs that you want to share.
        @[JSON::Field(key: "LogBucket")]
        getter log_bucket : String

        def initialize(
          @log_bucket : String
        )
        end
      end

      struct AssociateDRTLogBucketResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateDRTRoleRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the role the SRT will use to access your Amazon Web Services
        # account. Prior to making the AssociateDRTRole request, you must attach the AWSShieldDRTAccessPolicy
        # managed policy to this role. For more information see Attaching and Detaching IAM Policies .
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      struct AssociateDRTRoleResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateHealthCheckRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the health check to associate with the protection.
        @[JSON::Field(key: "HealthCheckArn")]
        getter health_check_arn : String

        # The unique identifier (ID) for the Protection object to add the health check association to.
        @[JSON::Field(key: "ProtectionId")]
        getter protection_id : String

        def initialize(
          @health_check_arn : String,
          @protection_id : String
        )
        end
      end

      struct AssociateHealthCheckResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateProactiveEngagementDetailsRequest
        include JSON::Serializable

        # A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact
        # you for escalations to the SRT and to initiate proactive customer support. To enable proactive
        # engagement, the contact list must include at least one phone number. The contacts that you provide
        # here replace any contacts that were already defined. If you already have contacts defined and want
        # to use them, retrieve the list using DescribeEmergencyContactSettings and then provide it here.
        @[JSON::Field(key: "EmergencyContactList")]
        getter emergency_contact_list : Array(Types::EmergencyContact)

        def initialize(
          @emergency_contact_list : Array(Types::EmergencyContact)
        )
        end
      end

      struct AssociateProactiveEngagementDetailsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The details of a DDoS attack.
      struct AttackDetail
        include JSON::Serializable

        # List of counters that describe the attack for the specified time period.
        @[JSON::Field(key: "AttackCounters")]
        getter attack_counters : Array(Types::SummarizedCounter)?

        # The unique identifier (ID) of the attack.
        @[JSON::Field(key: "AttackId")]
        getter attack_id : String?

        # The array of objects that provide details of the Shield event. For infrastructure layer events (L3
        # and L4 events), you can view metrics for top contributors in Amazon CloudWatch metrics. For more
        # information, see Shield metrics and alarms in the WAF Developer Guide .
        @[JSON::Field(key: "AttackProperties")]
        getter attack_properties : Array(Types::AttackProperty)?

        # The time the attack ended, in Unix time in seconds.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # List of mitigation actions taken for the attack.
        @[JSON::Field(key: "Mitigations")]
        getter mitigations : Array(Types::Mitigation)?

        # The ARN (Amazon Resource Name) of the resource that was attacked.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The time the attack started, in Unix time in seconds.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # If applicable, additional detail about the resource being attacked, for example, IP address or URL.
        @[JSON::Field(key: "SubResources")]
        getter sub_resources : Array(Types::SubResourceSummary)?

        def initialize(
          @attack_counters : Array(Types::SummarizedCounter)? = nil,
          @attack_id : String? = nil,
          @attack_properties : Array(Types::AttackProperty)? = nil,
          @end_time : Time? = nil,
          @mitigations : Array(Types::Mitigation)? = nil,
          @resource_arn : String? = nil,
          @start_time : Time? = nil,
          @sub_resources : Array(Types::SubResourceSummary)? = nil
        )
        end
      end

      # Details of a Shield event. This is provided as part of an AttackDetail .
      struct AttackProperty
        include JSON::Serializable

        # The type of Shield event that was observed. NETWORK indicates layer 3 and layer 4 events and
        # APPLICATION indicates layer 7 events. For infrastructure layer events (L3 and L4 events), you can
        # view metrics for top contributors in Amazon CloudWatch metrics. For more information, see Shield
        # metrics and alarms in the WAF Developer Guide .
        @[JSON::Field(key: "AttackLayer")]
        getter attack_layer : String?

        # Defines the Shield event property information that is provided. The WORDPRESS_PINGBACK_REFLECTOR and
        # WORDPRESS_PINGBACK_SOURCE values are valid only for WordPress reflective pingback events.
        @[JSON::Field(key: "AttackPropertyIdentifier")]
        getter attack_property_identifier : String?

        # Contributor objects for the top five contributors to a Shield event. A contributor is a source of
        # traffic that Shield Advanced identifies as responsible for some or all of an event.
        @[JSON::Field(key: "TopContributors")]
        getter top_contributors : Array(Types::Contributor)?

        # The total contributions made to this Shield event by all contributors.
        @[JSON::Field(key: "Total")]
        getter total : Int64?

        # The unit used for the Contributor Value property.
        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @attack_layer : String? = nil,
          @attack_property_identifier : String? = nil,
          @top_contributors : Array(Types::Contributor)? = nil,
          @total : Int64? = nil,
          @unit : String? = nil
        )
        end
      end

      # A single attack statistics data record. This is returned by DescribeAttackStatistics along with a
      # time range indicating the time period that the attack statistics apply to.
      struct AttackStatisticsDataItem
        include JSON::Serializable

        # The number of attacks detected during the time period. This is always present, but might be zero.
        @[JSON::Field(key: "AttackCount")]
        getter attack_count : Int64

        # Information about the volume of attacks during the time period. If the accompanying AttackCount is
        # zero, this setting might be empty.
        @[JSON::Field(key: "AttackVolume")]
        getter attack_volume : Types::AttackVolume?

        def initialize(
          @attack_count : Int64,
          @attack_volume : Types::AttackVolume? = nil
        )
        end
      end

      # Summarizes all DDoS attacks for a specified time period.
      struct AttackSummary
        include JSON::Serializable

        # The unique identifier (ID) of the attack.
        @[JSON::Field(key: "AttackId")]
        getter attack_id : String?

        # The list of attacks for a specified time period.
        @[JSON::Field(key: "AttackVectors")]
        getter attack_vectors : Array(Types::AttackVectorDescription)?

        # The end time of the attack, in Unix time in seconds.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ARN (Amazon Resource Name) of the resource that was attacked.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The start time of the attack, in Unix time in seconds.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @attack_id : String? = nil,
          @attack_vectors : Array(Types::AttackVectorDescription)? = nil,
          @end_time : Time? = nil,
          @resource_arn : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes the attack.
      struct AttackVectorDescription
        include JSON::Serializable

        # The attack type. Valid values: UDP_TRAFFIC UDP_FRAGMENT GENERIC_UDP_REFLECTION DNS_REFLECTION
        # NTP_REFLECTION CHARGEN_REFLECTION SSDP_REFLECTION PORT_MAPPER RIP_REFLECTION SNMP_REFLECTION
        # MSSQL_REFLECTION NET_BIOS_REFLECTION SYN_FLOOD ACK_FLOOD REQUEST_FLOOD HTTP_REFLECTION
        # UDS_REFLECTION MEMCACHED_REFLECTION
        @[JSON::Field(key: "VectorType")]
        getter vector_type : String

        def initialize(
          @vector_type : String
        )
        end
      end

      # Information about the volume of attacks during the time period, included in an
      # AttackStatisticsDataItem . If the accompanying AttackCount in the statistics object is zero, this
      # setting might be empty.
      struct AttackVolume
        include JSON::Serializable

        # A statistics object that uses bits per second as the unit. This is included for network level
        # attacks.
        @[JSON::Field(key: "BitsPerSecond")]
        getter bits_per_second : Types::AttackVolumeStatistics?

        # A statistics object that uses packets per second as the unit. This is included for network level
        # attacks.
        @[JSON::Field(key: "PacketsPerSecond")]
        getter packets_per_second : Types::AttackVolumeStatistics?

        # A statistics object that uses requests per second as the unit. This is included for application
        # level attacks, and is only available for accounts that are subscribed to Shield Advanced.
        @[JSON::Field(key: "RequestsPerSecond")]
        getter requests_per_second : Types::AttackVolumeStatistics?

        def initialize(
          @bits_per_second : Types::AttackVolumeStatistics? = nil,
          @packets_per_second : Types::AttackVolumeStatistics? = nil,
          @requests_per_second : Types::AttackVolumeStatistics? = nil
        )
        end
      end

      # Statistics objects for the various data types in AttackVolume .
      struct AttackVolumeStatistics
        include JSON::Serializable

        # The maximum attack volume observed for the given unit.
        @[JSON::Field(key: "Max")]
        getter max : Float64

        def initialize(
          @max : Float64
        )
        end
      end

      # Specifies that Shield Advanced should configure its WAF rules with the WAF Block action. This is
      # only used in the context of the ResponseAction setting. JSON specification: "Block": {}
      struct BlockAction
        include JSON::Serializable

        def initialize
        end
      end

      # A contributor to the attack and their contribution.
      struct Contributor
        include JSON::Serializable

        # The name of the contributor. The type of name that you'll find here depends on the
        # AttackPropertyIdentifier setting in the AttackProperty where this contributor is defined. For
        # example, if the AttackPropertyIdentifier is SOURCE_COUNTRY , the Name could be United States .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The contribution of this contributor expressed in Protection units. For example 10,000 .
        @[JSON::Field(key: "Value")]
        getter value : Int64?

        def initialize(
          @name : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # Specifies that Shield Advanced should configure its WAF rules with the WAF Count action. This is
      # only used in the context of the ResponseAction setting. JSON specification: "Count": {}
      struct CountAction
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateProtectionGroupRequest
        include JSON::Serializable

        # Defines how Shield combines resource data for the group in order to detect, mitigate, and report
        # events. Sum - Use the total traffic across the group. This is a good choice for most cases. Examples
        # include Elastic IP addresses for EC2 instances that scale manually or automatically. Mean - Use the
        # average of the traffic across the group. This is a good choice for resources that share traffic
        # uniformly. Examples include accelerators and load balancers. Max - Use the highest traffic from each
        # resource. This is useful for resources that don't share traffic and for resources that share that
        # traffic in a non-uniform way. Examples include Amazon CloudFront and origin resources for CloudFront
        # distributions.
        @[JSON::Field(key: "Aggregation")]
        getter aggregation : String

        # The criteria to use to choose the protected resources for inclusion in the group. You can include
        # all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or
        # include all resources of a specified resource type.
        @[JSON::Field(key: "Pattern")]
        getter pattern : String

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        # The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set
        # this when you set Pattern to ARBITRARY and you must not set it for any other Pattern setting.
        @[JSON::Field(key: "Members")]
        getter members : Array(String)?

        # The resource type to include in the protection group. All protected resources of this type are
        # included in the protection group. Newly protected resources of this type are automatically added to
        # the group. You must set this when you set Pattern to BY_RESOURCE_TYPE and you must not set it for
        # any other Pattern setting.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # One or more tag key-value pairs for the protection group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @aggregation : String,
          @pattern : String,
          @protection_group_id : String,
          @members : Array(String)? = nil,
          @resource_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProtectionGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateProtectionRequest
        include JSON::Serializable

        # Friendly name for the Protection you are creating.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN (Amazon Resource Name) of the resource to be protected. The ARN should be in one of the
        # following formats: For an Application Load Balancer: arn:aws:elasticloadbalancing: region :
        # account-id :loadbalancer/app/ load-balancer-name / load-balancer-id For an Elastic Load Balancer
        # (Classic Load Balancer): arn:aws:elasticloadbalancing: region : account-id :loadbalancer/
        # load-balancer-name For an Amazon CloudFront distribution: arn:aws:cloudfront:: account-id
        # :distribution/ distribution-id For an Global Accelerator standard accelerator:
        # arn:aws:globalaccelerator:: account-id :accelerator/ accelerator-id For Amazon Route 53:
        # arn:aws:route53:::hostedzone/ hosted-zone-id For an Elastic IP address: arn:aws:ec2: region :
        # account-id :eip-allocation/ allocation-id
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tag key-value pairs for the Protection object that is created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @resource_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProtectionResponse
        include JSON::Serializable

        # The unique identifier (ID) for the Protection object that is created.
        @[JSON::Field(key: "ProtectionId")]
        getter protection_id : String?

        def initialize(
          @protection_id : String? = nil
        )
        end
      end

      struct CreateSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProtectionGroupRequest
        include JSON::Serializable

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        def initialize(
          @protection_group_id : String
        )
        end
      end

      struct DeleteProtectionGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProtectionRequest
        include JSON::Serializable

        # The unique identifier (ID) for the Protection object to be deleted.
        @[JSON::Field(key: "ProtectionId")]
        getter protection_id : String

        def initialize(
          @protection_id : String
        )
        end
      end

      struct DeleteProtectionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeAttackRequest
        include JSON::Serializable

        # The unique identifier (ID) for the attack.
        @[JSON::Field(key: "AttackId")]
        getter attack_id : String

        def initialize(
          @attack_id : String
        )
        end
      end

      struct DescribeAttackResponse
        include JSON::Serializable

        # The attack that you requested.
        @[JSON::Field(key: "Attack")]
        getter attack : Types::AttackDetail?

        def initialize(
          @attack : Types::AttackDetail? = nil
        )
        end
      end

      struct DescribeAttackStatisticsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeAttackStatisticsResponse
        include JSON::Serializable

        # The data that describes the attacks detected during the time period.
        @[JSON::Field(key: "DataItems")]
        getter data_items : Array(Types::AttackStatisticsDataItem)

        # The time range of the attack.
        @[JSON::Field(key: "TimeRange")]
        getter time_range : Types::TimeRange

        def initialize(
          @data_items : Array(Types::AttackStatisticsDataItem),
          @time_range : Types::TimeRange
        )
        end
      end

      struct DescribeDRTAccessRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeDRTAccessResponse
        include JSON::Serializable

        # The list of Amazon S3 buckets accessed by the SRT.
        @[JSON::Field(key: "LogBucketList")]
        getter log_bucket_list : Array(String)?

        # The Amazon Resource Name (ARN) of the role the SRT used to access your Amazon Web Services account.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @log_bucket_list : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct DescribeEmergencyContactSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeEmergencyContactSettingsResponse
        include JSON::Serializable

        # A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact
        # you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive
        # customer support.
        @[JSON::Field(key: "EmergencyContactList")]
        getter emergency_contact_list : Array(Types::EmergencyContact)?

        def initialize(
          @emergency_contact_list : Array(Types::EmergencyContact)? = nil
        )
        end
      end

      struct DescribeProtectionGroupRequest
        include JSON::Serializable

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        def initialize(
          @protection_group_id : String
        )
        end
      end

      struct DescribeProtectionGroupResponse
        include JSON::Serializable

        # A grouping of protected resources that you and Shield Advanced can monitor as a collective. This
        # resource grouping improves the accuracy of detection and reduces false positives.
        @[JSON::Field(key: "ProtectionGroup")]
        getter protection_group : Types::ProtectionGroup

        def initialize(
          @protection_group : Types::ProtectionGroup
        )
        end
      end

      struct DescribeProtectionRequest
        include JSON::Serializable

        # The unique identifier (ID) for the Protection object to describe. You must provide either the
        # ResourceArn of the protected resource or the ProtectionID of the protection, but not both.
        @[JSON::Field(key: "ProtectionId")]
        getter protection_id : String?

        # The ARN (Amazon Resource Name) of the protected Amazon Web Services resource. You must provide
        # either the ResourceArn of the protected resource or the ProtectionID of the protection, but not
        # both.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @protection_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct DescribeProtectionResponse
        include JSON::Serializable

        # The Protection that you requested.
        @[JSON::Field(key: "Protection")]
        getter protection : Types::Protection?

        def initialize(
          @protection : Types::Protection? = nil
        )
        end
      end

      struct DescribeSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeSubscriptionResponse
        include JSON::Serializable

        # The Shield Advanced subscription details for an account.
        @[JSON::Field(key: "Subscription")]
        getter subscription : Types::Subscription?

        def initialize(
          @subscription : Types::Subscription? = nil
        )
        end
      end

      struct DisableApplicationLayerAutomaticResponseRequest
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the protected resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DisableApplicationLayerAutomaticResponseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisableProactiveEngagementRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisableProactiveEngagementResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateDRTLogBucketRequest
        include JSON::Serializable

        # The Amazon S3 bucket that contains the logs that you want to share.
        @[JSON::Field(key: "LogBucket")]
        getter log_bucket : String

        def initialize(
          @log_bucket : String
        )
        end
      end

      struct DisassociateDRTLogBucketResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateDRTRoleRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateDRTRoleResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateHealthCheckRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the health check that is associated with the protection.
        @[JSON::Field(key: "HealthCheckArn")]
        getter health_check_arn : String

        # The unique identifier (ID) for the Protection object to remove the health check association from.
        @[JSON::Field(key: "ProtectionId")]
        getter protection_id : String

        def initialize(
          @health_check_arn : String,
          @protection_id : String
        )
        end
      end

      struct DisassociateHealthCheckResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contact information that the SRT can use to contact you if you have proactive engagement enabled,
      # for escalations to the SRT and to initiate proactive customer support.
      struct EmergencyContact
        include JSON::Serializable

        # The email address for the contact.
        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # Additional notes regarding the contact.
        @[JSON::Field(key: "ContactNotes")]
        getter contact_notes : String?

        # The phone number for the contact.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @email_address : String,
          @contact_notes : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      struct EnableApplicationLayerAutomaticResponseRequest
        include JSON::Serializable

        # Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on
        # behalf of the protected resource in response to DDoS attacks. You specify this as part of the
        # configuration for the automatic application layer DDoS mitigation feature, when you enable or update
        # automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group,
        # inside the web ACL that you have associated with the resource.
        @[JSON::Field(key: "Action")]
        getter action : Types::ResponseAction

        # The ARN (Amazon Resource Name) of the protected resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @action : Types::ResponseAction,
          @resource_arn : String
        )
        end
      end

      struct EnableApplicationLayerAutomaticResponseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableProactiveEngagementRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableProactiveEngagementResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct GetSubscriptionStateRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetSubscriptionStateResponse
        include JSON::Serializable

        # The status of the subscription.
        @[JSON::Field(key: "SubscriptionState")]
        getter subscription_state : String

        def initialize(
          @subscription_state : String
        )
        end
      end

      # Narrows the set of protections that the call retrieves. You can retrieve a single protection by
      # providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also
      # retrieve all protections for a specific resource type. You can provide up to one criteria per filter
      # type. Shield Advanced returns protections that exactly match all of the filter criteria that you
      # provide.
      struct InclusionProtectionFilters
        include JSON::Serializable

        # The name of the protection that you want to retrieve.
        @[JSON::Field(key: "ProtectionNames")]
        getter protection_names : Array(String)?

        # The ARN (Amazon Resource Name) of the resource whose protection you want to retrieve.
        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)?

        # The type of protected resource whose protections you want to retrieve.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @protection_names : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      # Narrows the set of protection groups that the call retrieves. You can retrieve a single protection
      # group by its name and you can retrieve all protection groups that are configured with a specific
      # pattern, aggregation, or resource type. You can provide up to one criteria per filter type. Shield
      # Advanced returns the protection groups that exactly match all of the search criteria that you
      # provide.
      struct InclusionProtectionGroupFilters
        include JSON::Serializable

        # The aggregation setting of the protection groups that you want to retrieve.
        @[JSON::Field(key: "Aggregations")]
        getter aggregations : Array(String)?

        # The pattern specification of the protection groups that you want to retrieve.
        @[JSON::Field(key: "Patterns")]
        getter patterns : Array(String)?

        # The ID of the protection group that you want to retrieve.
        @[JSON::Field(key: "ProtectionGroupIds")]
        getter protection_group_ids : Array(String)?

        # The resource type configuration of the protection groups that you want to retrieve. In the
        # protection group configuration, you specify the resource type when you set the group's Pattern to
        # BY_RESOURCE_TYPE .
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @aggregations : Array(String)? = nil,
          @patterns : Array(String)? = nil,
          @protection_group_ids : Array(String)? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      # Exception that indicates that a problem occurred with the service infrastructure. You can retry the
      # request.
      struct InternalErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that indicates that the operation would not cause any change to occur.
      struct InvalidOperationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that indicates that the NextToken specified in the request is invalid. Submit the request
      # using the NextToken value that was returned in the prior response.
      struct InvalidPaginationTokenException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that indicates that the parameters passed to the API are invalid. If available, this
      # exception includes details in additional properties.
      struct InvalidParameterException
        include JSON::Serializable

        # Fields that caused the exception.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "message")]
        getter message : String?

        # Additional information about the exception.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Exception that indicates that the resource is invalid. You might not have access to the resource, or
      # the resource might not exist.
      struct InvalidResourceException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies how many protections of a given type you can create.
      struct Limit
        include JSON::Serializable

        # The maximum number of protections that can be created for the specified Type .
        @[JSON::Field(key: "Max")]
        getter max : Int64?

        # The type of protection.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @max : Int64? = nil,
          @type : String? = nil
        )
        end
      end

      # Exception that indicates that the operation would exceed a limit.
      struct LimitsExceededException
        include JSON::Serializable

        # The threshold that would be exceeded.
        @[JSON::Field(key: "Limit")]
        getter limit : Int64?

        # The type of limit that would be exceeded.
        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @limit : Int64? = nil,
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct ListAttacksRequest
        include JSON::Serializable

        # The end of the time period for the attacks. This is a timestamp type. The request syntax listing for
        # this call indicates a number type, but you can provide the time in any valid timestamp format
        # setting.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Types::TimeRange?

        # The greatest number of objects that you want Shield Advanced to return to the list request. Shield
        # Advanced might return fewer objects than you indicate in this setting, even if more objects are
        # available. If there are more objects remaining, Shield Advanced will always also return a NextToken
        # value in the response. The default setting is 20.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value. On your first call to a list operation, leave this setting
        # empty.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs (Amazon Resource Names) of the resources that were attacked. If you leave this blank, all
        # applicable resources for this account will be included.
        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)?

        # The start of the time period for the attacks. This is a timestamp type. The request syntax listing
        # for this call indicates a number type, but you can provide the time in any valid timestamp format
        # setting.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Types::TimeRange?

        def initialize(
          @end_time : Types::TimeRange? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_arns : Array(String)? = nil,
          @start_time : Types::TimeRange? = nil
        )
        end
      end

      struct ListAttacksResponse
        include JSON::Serializable

        # The attack information for the specified time range.
        @[JSON::Field(key: "AttackSummaries")]
        getter attack_summaries : Array(Types::AttackSummary)?

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attack_summaries : Array(Types::AttackSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectionGroupsRequest
        include JSON::Serializable

        # Narrows the set of protection groups that the call retrieves. You can retrieve a single protection
        # group by its name and you can retrieve all protection groups that are configured with specific
        # pattern or aggregation settings. You can provide up to one criteria per filter type. Shield Advanced
        # returns the protection groups that exactly match all of the search criteria that you provide.
        @[JSON::Field(key: "InclusionFilters")]
        getter inclusion_filters : Types::InclusionProtectionGroupFilters?

        # The greatest number of objects that you want Shield Advanced to return to the list request. Shield
        # Advanced might return fewer objects than you indicate in this setting, even if more objects are
        # available. If there are more objects remaining, Shield Advanced will always also return a NextToken
        # value in the response. The default setting is 20.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value. On your first call to a list operation, leave this setting
        # empty.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inclusion_filters : Types::InclusionProtectionGroupFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectionGroupsResponse
        include JSON::Serializable

        @[JSON::Field(key: "ProtectionGroups")]
        getter protection_groups : Array(Types::ProtectionGroup)

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @protection_groups : Array(Types::ProtectionGroup),
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectionsRequest
        include JSON::Serializable

        # Narrows the set of protections that the call retrieves. You can retrieve a single protection by
        # providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also
        # retrieve all protections for a specific resource type. You can provide up to one criteria per filter
        # type. Shield Advanced returns protections that exactly match all of the filter criteria that you
        # provide.
        @[JSON::Field(key: "InclusionFilters")]
        getter inclusion_filters : Types::InclusionProtectionFilters?

        # The greatest number of objects that you want Shield Advanced to return to the list request. Shield
        # Advanced might return fewer objects than you indicate in this setting, even if more objects are
        # available. If there are more objects remaining, Shield Advanced will always also return a NextToken
        # value in the response. The default setting is 20.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value. On your first call to a list operation, leave this setting
        # empty.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @inclusion_filters : Types::InclusionProtectionFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectionsResponse
        include JSON::Serializable

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The array of enabled Protection objects.
        @[JSON::Field(key: "Protections")]
        getter protections : Array(Types::Protection)?

        def initialize(
          @next_token : String? = nil,
          @protections : Array(Types::Protection)? = nil
        )
        end
      end

      struct ListResourcesInProtectionGroupRequest
        include JSON::Serializable

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        # The greatest number of objects that you want Shield Advanced to return to the list request. Shield
        # Advanced might return fewer objects than you indicate in this setting, even if more objects are
        # available. If there are more objects remaining, Shield Advanced will always also return a NextToken
        # value in the response. The default setting is 20.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value. On your first call to a list operation, leave this setting
        # empty.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @protection_group_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourcesInProtectionGroupResponse
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the resources that are included in the protection group.
        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        # When you request a list of objects from Shield Advanced, if the response does not include all of the
        # remaining available objects, Shield Advanced includes a NextToken value in the response. You can
        # retrieve the next batch of objects by requesting the list again and providing the token that was
        # returned by the prior call in your request. You can indicate the maximum number of objects that you
        # want Shield Advanced to return for a single call with the MaxResults setting. Shield Advanced will
        # not return more than MaxResults objects, but may return fewer, even if more objects are still
        # available. Whenever more objects remain that Shield Advanced has not yet returned to you, the
        # response will include a NextToken value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to get tags for.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tag key and value pairs associated with the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # You are trying to update a subscription that has not yet completed the 1-year commitment. You can
      # change the AutoRenew parameter during the last 30 days of your subscription. This exception
      # indicates that you are attempting to change AutoRenew prior to that period.
      struct LockedSubscriptionException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The mitigation applied to a DDoS attack.
      struct Mitigation
        include JSON::Serializable

        # The name of the mitigation taken for this attack.
        @[JSON::Field(key: "MitigationName")]
        getter mitigation_name : String?

        def initialize(
          @mitigation_name : String? = nil
        )
        end
      end

      # The ARN of the role that you specified does not exist.
      struct NoAssociatedRoleException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception that indicates that the resource state has been modified by another client. Retrieve the
      # resource and then retry your request.
      struct OptimisticLockException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents a resource that is under DDoS protection.
      struct Protection
        include JSON::Serializable

        # The automatic application layer DDoS mitigation settings for the protection. This configuration
        # determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to
        # application layer events that Shield Advanced determines to be DDoS attacks.
        @[JSON::Field(key: "ApplicationLayerAutomaticResponseConfiguration")]
        getter application_layer_automatic_response_configuration : Types::ApplicationLayerAutomaticResponseConfiguration?

        # The unique identifier (ID) for the Route 53 health check that's associated with the protection.
        @[JSON::Field(key: "HealthCheckIds")]
        getter health_check_ids : Array(String)?

        # The unique identifier (ID) of the protection.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the protection. For example, My CloudFront distributions .
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN (Amazon Resource Name) of the protection.
        @[JSON::Field(key: "ProtectionArn")]
        getter protection_arn : String?

        # The ARN (Amazon Resource Name) of the Amazon Web Services resource that is protected.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @application_layer_automatic_response_configuration : Types::ApplicationLayerAutomaticResponseConfiguration? = nil,
          @health_check_ids : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @protection_arn : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # A grouping of protected resources that you and Shield Advanced can monitor as a collective. This
      # resource grouping improves the accuracy of detection and reduces false positives.
      struct ProtectionGroup
        include JSON::Serializable

        # Defines how Shield combines resource data for the group in order to detect, mitigate, and report
        # events. Sum - Use the total traffic across the group. This is a good choice for most cases. Examples
        # include Elastic IP addresses for EC2 instances that scale manually or automatically. Mean - Use the
        # average of the traffic across the group. This is a good choice for resources that share traffic
        # uniformly. Examples include accelerators and load balancers. Max - Use the highest traffic from each
        # resource. This is useful for resources that don't share traffic and for resources that share that
        # traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources
        # for CloudFront distributions.
        @[JSON::Field(key: "Aggregation")]
        getter aggregation : String

        # The ARNs (Amazon Resource Names) of the resources to include in the protection group. You must set
        # this when you set Pattern to ARBITRARY and you must not set it for any other Pattern setting.
        @[JSON::Field(key: "Members")]
        getter members : Array(String)

        # The criteria to use to choose the protected resources for inclusion in the group. You can include
        # all resources that have protections, provide a list of resource ARNs (Amazon Resource Names), or
        # include all resources of a specified resource type.
        @[JSON::Field(key: "Pattern")]
        getter pattern : String

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        # The ARN (Amazon Resource Name) of the protection group.
        @[JSON::Field(key: "ProtectionGroupArn")]
        getter protection_group_arn : String?

        # The resource type to include in the protection group. All protected resources of this type are
        # included in the protection group. You must set this when you set Pattern to BY_RESOURCE_TYPE and you
        # must not set it for any other Pattern setting.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @aggregation : String,
          @members : Array(String),
          @pattern : String,
          @protection_group_id : String,
          @protection_group_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Limits settings on protection groups with arbitrary pattern type.
      struct ProtectionGroupArbitraryPatternLimits
        include JSON::Serializable

        # The maximum number of resources you can specify for a single arbitrary pattern in a protection
        # group.
        @[JSON::Field(key: "MaxMembers")]
        getter max_members : Int64

        def initialize(
          @max_members : Int64
        )
        end
      end

      # Limits settings on protection groups for your subscription.
      struct ProtectionGroupLimits
        include JSON::Serializable

        # The maximum number of protection groups that you can have at one time.
        @[JSON::Field(key: "MaxProtectionGroups")]
        getter max_protection_groups : Int64

        # Limits settings by pattern type in the protection groups for your subscription.
        @[JSON::Field(key: "PatternTypeLimits")]
        getter pattern_type_limits : Types::ProtectionGroupPatternTypeLimits

        def initialize(
          @max_protection_groups : Int64,
          @pattern_type_limits : Types::ProtectionGroupPatternTypeLimits
        )
        end
      end

      # Limits settings by pattern type in the protection groups for your subscription.
      struct ProtectionGroupPatternTypeLimits
        include JSON::Serializable

        # Limits settings on protection groups with arbitrary pattern type.
        @[JSON::Field(key: "ArbitraryPatternLimits")]
        getter arbitrary_pattern_limits : Types::ProtectionGroupArbitraryPatternLimits

        def initialize(
          @arbitrary_pattern_limits : Types::ProtectionGroupArbitraryPatternLimits
        )
        end
      end

      # Limits settings on protections for your subscription.
      struct ProtectionLimits
        include JSON::Serializable

        # The maximum number of resource types that you can specify in a protection.
        @[JSON::Field(key: "ProtectedResourceTypeLimits")]
        getter protected_resource_type_limits : Array(Types::Limit)

        def initialize(
          @protected_resource_type_limits : Array(Types::Limit)
        )
        end
      end

      # Exception indicating the specified resource already exists. If available, this exception includes
      # details in additional properties.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The type of resource that already exists.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Exception indicating the specified resource does not exist. If available, this exception includes
      # details in additional properties.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # Type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on
      # behalf of the protected resource in response to DDoS attacks. You specify this as part of the
      # configuration for the automatic application layer DDoS mitigation feature, when you enable or update
      # automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group,
      # inside the web ACL that you have associated with the resource.
      struct ResponseAction
        include JSON::Serializable

        # Specifies that Shield Advanced should configure its WAF rules with the WAF Block action. You must
        # specify exactly one action, either Block or Count .
        @[JSON::Field(key: "Block")]
        getter block : Types::BlockAction?

        # Specifies that Shield Advanced should configure its WAF rules with the WAF Count action. You must
        # specify exactly one action, either Block or Count .
        @[JSON::Field(key: "Count")]
        getter count : Types::CountAction?

        def initialize(
          @block : Types::BlockAction? = nil,
          @count : Types::CountAction? = nil
        )
        end
      end

      # The attack information for the specified SubResource.
      struct SubResourceSummary
        include JSON::Serializable

        # The list of attack types and associated counters.
        @[JSON::Field(key: "AttackVectors")]
        getter attack_vectors : Array(Types::SummarizedAttackVector)?

        # The counters that describe the details of the attack.
        @[JSON::Field(key: "Counters")]
        getter counters : Array(Types::SummarizedCounter)?

        # The unique identifier (ID) of the SubResource .
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The SubResource type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attack_vectors : Array(Types::SummarizedAttackVector)? = nil,
          @counters : Array(Types::SummarizedCounter)? = nil,
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the Shield Advanced subscription for an account.
      struct Subscription
        include JSON::Serializable

        # Limits settings for your subscription.
        @[JSON::Field(key: "SubscriptionLimits")]
        getter subscription_limits : Types::SubscriptionLimits

        # If ENABLED , the subscription will be automatically renewed at the end of the existing subscription
        # period. When you initally create a subscription, AutoRenew is set to ENABLED . You can change this
        # by submitting an UpdateSubscription request. If the UpdateSubscription request does not included a
        # value for AutoRenew , the existing value for AutoRenew remains unchanged.
        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : String?

        # The date and time your subscription will end.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Specifies how many protections of a given type you can create.
        @[JSON::Field(key: "Limits")]
        getter limits : Array(Types::Limit)?

        # If ENABLED , the Shield Response Team (SRT) will use email and phone to notify contacts about
        # escalations to the SRT and to initiate proactive customer support. If PENDING , you have requested
        # proactive engagement and the request is pending. The status changes to ENABLED when your request is
        # fully processed. If DISABLED , the SRT will not proactively notify contacts about escalations or to
        # initiate proactive customer support.
        @[JSON::Field(key: "ProactiveEngagementStatus")]
        getter proactive_engagement_status : String?

        # The start time of the subscription, in Unix time in seconds.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The ARN (Amazon Resource Name) of the subscription.
        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String?

        # The length, in seconds, of the Shield Advanced subscription for the account.
        @[JSON::Field(key: "TimeCommitmentInSeconds")]
        getter time_commitment_in_seconds : Int64?

        def initialize(
          @subscription_limits : Types::SubscriptionLimits,
          @auto_renew : String? = nil,
          @end_time : Time? = nil,
          @limits : Array(Types::Limit)? = nil,
          @proactive_engagement_status : String? = nil,
          @start_time : Time? = nil,
          @subscription_arn : String? = nil,
          @time_commitment_in_seconds : Int64? = nil
        )
        end
      end

      # Limits settings for your subscription.
      struct SubscriptionLimits
        include JSON::Serializable

        # Limits settings on protection groups for your subscription.
        @[JSON::Field(key: "ProtectionGroupLimits")]
        getter protection_group_limits : Types::ProtectionGroupLimits

        # Limits settings on protections for your subscription.
        @[JSON::Field(key: "ProtectionLimits")]
        getter protection_limits : Types::ProtectionLimits

        def initialize(
          @protection_group_limits : Types::ProtectionGroupLimits,
          @protection_limits : Types::ProtectionLimits
        )
        end
      end

      # A summary of information about the attack.
      struct SummarizedAttackVector
        include JSON::Serializable

        # The attack type, for example, SNMP reflection or SYN flood.
        @[JSON::Field(key: "VectorType")]
        getter vector_type : String

        # The list of counters that describe the details of the attack.
        @[JSON::Field(key: "VectorCounters")]
        getter vector_counters : Array(Types::SummarizedCounter)?

        def initialize(
          @vector_type : String,
          @vector_counters : Array(Types::SummarizedCounter)? = nil
        )
        end
      end

      # The counter that describes a DDoS attack.
      struct SummarizedCounter
        include JSON::Serializable

        # The average value of the counter for a specified time period.
        @[JSON::Field(key: "Average")]
        getter average : Float64?

        # The maximum value of the counter for a specified time period.
        @[JSON::Field(key: "Max")]
        getter max : Float64?

        # The number of counters for a specified time period.
        @[JSON::Field(key: "N")]
        getter n : Int32?

        # The counter name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The total of counter values for a specified time period.
        @[JSON::Field(key: "Sum")]
        getter sum : Float64?

        # The unit of the counters.
        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @average : Float64? = nil,
          @max : Float64? = nil,
          @n : Int32? = nil,
          @name : String? = nil,
          @sum : Float64? = nil,
          @unit : String? = nil
        )
        end
      end

      # A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to
      # categorize and manage your resources, for purposes like billing or other management. Typically, the
      # tag key represents a category, such as "environment", and the tag value represents a specific value
      # within that category, such as "test," "development," or "production". Or you might set the tag key
      # to "customer" and the value to the customer name or ID. You can specify one or more tags to add to
      # each Amazon Web Services resource, up to 50 tags for a resource.
      struct Tag
        include JSON::Serializable

        # Part of the key:value pair that defines a tag. You can use a tag key to describe a category of
        # information, such as "customer." Tag keys are case-sensitive.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value
        # within a category, such as "companyA" or "companyB." Tag values are case-sensitive.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to add or update tags for.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags that you want to modify or add to the resource.
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

      # The time range.
      struct TimeRange
        include JSON::Serializable

        # The start time, in Unix time in seconds.
        @[JSON::Field(key: "FromInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter from_inclusive : Time?

        # The end time, in Unix time in seconds.
        @[JSON::Field(key: "ToExclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter to_exclusive : Time?

        def initialize(
          @from_inclusive : Time? = nil,
          @to_exclusive : Time? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag key for each tag that you want to remove from the resource.
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

      struct UpdateApplicationLayerAutomaticResponseRequest
        include JSON::Serializable

        # Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on
        # behalf of the protected resource in response to DDoS attacks. You specify this as part of the
        # configuration for the automatic application layer DDoS mitigation feature, when you enable or update
        # automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group,
        # inside the web ACL that you have associated with the resource.
        @[JSON::Field(key: "Action")]
        getter action : Types::ResponseAction

        # The ARN (Amazon Resource Name) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @action : Types::ResponseAction,
          @resource_arn : String
        )
        end
      end

      struct UpdateApplicationLayerAutomaticResponseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateEmergencyContactSettingsRequest
        include JSON::Serializable

        # A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact
        # you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive
        # customer support. If you have proactive engagement enabled, the contact list must include at least
        # one phone number.
        @[JSON::Field(key: "EmergencyContactList")]
        getter emergency_contact_list : Array(Types::EmergencyContact)?

        def initialize(
          @emergency_contact_list : Array(Types::EmergencyContact)? = nil
        )
        end
      end

      struct UpdateEmergencyContactSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateProtectionGroupRequest
        include JSON::Serializable

        # Defines how Shield combines resource data for the group in order to detect, mitigate, and report
        # events. Sum - Use the total traffic across the group. This is a good choice for most cases. Examples
        # include Elastic IP addresses for EC2 instances that scale manually or automatically. Mean - Use the
        # average of the traffic across the group. This is a good choice for resources that share traffic
        # uniformly. Examples include accelerators and load balancers. Max - Use the highest traffic from each
        # resource. This is useful for resources that don't share traffic and for resources that share that
        # traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources
        # for CloudFront distributions.
        @[JSON::Field(key: "Aggregation")]
        getter aggregation : String

        # The criteria to use to choose the protected resources for inclusion in the group. You can include
        # all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or
        # include all resources of a specified resource type.
        @[JSON::Field(key: "Pattern")]
        getter pattern : String

        # The name of the protection group. You use this to identify the protection group in lists and to
        # manage the protection group, for example to update, delete, or describe it.
        @[JSON::Field(key: "ProtectionGroupId")]
        getter protection_group_id : String

        # The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set
        # this when you set Pattern to ARBITRARY and you must not set it for any other Pattern setting.
        @[JSON::Field(key: "Members")]
        getter members : Array(String)?

        # The resource type to include in the protection group. All protected resources of this type are
        # included in the protection group. You must set this when you set Pattern to BY_RESOURCE_TYPE and you
        # must not set it for any other Pattern setting.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @aggregation : String,
          @pattern : String,
          @protection_group_id : String,
          @members : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct UpdateProtectionGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateSubscriptionRequest
        include JSON::Serializable

        # When you initally create a subscription, AutoRenew is set to ENABLED . If ENABLED , the subscription
        # will be automatically renewed at the end of the existing subscription period. You can change this by
        # submitting an UpdateSubscription request. If the UpdateSubscription request does not included a
        # value for AutoRenew , the existing value for AutoRenew remains unchanged.
        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : String?

        def initialize(
          @auto_renew : String? = nil
        )
        end
      end

      struct UpdateSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about a particular parameter passed inside a request that resulted in an
      # exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message describing why the parameter failed validation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the parameter that failed validation.
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
