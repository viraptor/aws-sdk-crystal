module AwsSdk
  module Shield
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

      # Authorizes the Shield Response Team (SRT) to access the specified Amazon S3 bucket containing log
      # data such as Application Load Balancer access logs, CloudFront logs, or logs from third party
      # sources. You can associate up to 10 Amazon S3 buckets with your subscription. To use the services of
      # the SRT and make an AssociateDRTLogBucket request, you must be subscribed to the Business Support
      # plan or the Enterprise Support plan .
      def associate_drt_log_bucket(
        log_bucket : String
      ) : Types::AssociateDRTLogBucketResponse
        input = Types::AssociateDRTLogBucketRequest.new(log_bucket: log_bucket)
        associate_drt_log_bucket(input)
      end
      def associate_drt_log_bucket(input : Types::AssociateDRTLogBucketRequest) : Types::AssociateDRTLogBucketResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_DRT_LOG_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateDRTLogBucketResponse, "AssociateDRTLogBucket")
      end

      # Authorizes the Shield Response Team (SRT) using the specified role, to access your Amazon Web
      # Services account to assist with DDoS attack mitigation during potential attacks. This enables the
      # SRT to inspect your WAF configuration and create or update WAF rules and web ACLs. You can associate
      # only one RoleArn with your subscription. If you submit an AssociateDRTRole request for an account
      # that already has an associated role, the new RoleArn will replace the existing RoleArn . Prior to
      # making the AssociateDRTRole request, you must attach the AWSShieldDRTAccessPolicy managed policy to
      # the role that you'll specify in the request. You can access this policy in the IAM console at
      # AWSShieldDRTAccessPolicy . For more information see Adding and removing IAM identity permissions .
      # The role must also trust the service principal drt.shield.amazonaws.com . For more information, see
      # IAM JSON policy elements: Principal . The SRT will have access only to your WAF and Shield
      # resources. By submitting this request, you authorize the SRT to inspect your WAF and Shield
      # configuration and create and update WAF rules and web ACLs on your behalf. The SRT takes these
      # actions only if explicitly authorized by you. You must have the iam:PassRole permission to make an
      # AssociateDRTRole request. For more information, see Granting a user permissions to pass a role to an
      # Amazon Web Services service . To use the services of the SRT and make an AssociateDRTRole request,
      # you must be subscribed to the Business Support plan or the Enterprise Support plan .
      def associate_drt_role(
        role_arn : String
      ) : Types::AssociateDRTRoleResponse
        input = Types::AssociateDRTRoleRequest.new(role_arn: role_arn)
        associate_drt_role(input)
      end
      def associate_drt_role(input : Types::AssociateDRTRoleRequest) : Types::AssociateDRTRoleResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_DRT_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateDRTRoleResponse, "AssociateDRTRole")
      end

      # Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced
      # health-based detection uses the health of your Amazon Web Services resource to improve
      # responsiveness and accuracy in attack detection and response. You define the health check in Route
      # 53 and then associate it with your Shield Advanced protection. For more information, see Shield
      # Advanced Health-Based Detection in the WAF Developer Guide .
      def associate_health_check(
        health_check_arn : String,
        protection_id : String
      ) : Types::AssociateHealthCheckResponse
        input = Types::AssociateHealthCheckRequest.new(health_check_arn: health_check_arn, protection_id: protection_id)
        associate_health_check(input)
      end
      def associate_health_check(input : Types::AssociateHealthCheckRequest) : Types::AssociateHealthCheckResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateHealthCheckResponse, "AssociateHealthCheck")
      end

      # Initializes proactive engagement and sets the list of contacts for the Shield Response Team (SRT) to
      # use. You must provide at least one phone number in the emergency contact list. After you have
      # initialized proactive engagement using this call, to disable or enable proactive engagement, use the
      # calls DisableProactiveEngagement and EnableProactiveEngagement . This call defines the list of email
      # addresses and phone numbers that the SRT can use to contact you for escalations to the SRT and to
      # initiate proactive customer support. The contacts that you provide in the request replace any
      # contacts that were already defined. If you already have contacts defined and want to use them,
      # retrieve the list using DescribeEmergencyContactSettings and then provide it to this call.
      def associate_proactive_engagement_details(
        emergency_contact_list : Array(Types::EmergencyContact)
      ) : Types::AssociateProactiveEngagementDetailsResponse
        input = Types::AssociateProactiveEngagementDetailsRequest.new(emergency_contact_list: emergency_contact_list)
        associate_proactive_engagement_details(input)
      end
      def associate_proactive_engagement_details(input : Types::AssociateProactiveEngagementDetailsRequest) : Types::AssociateProactiveEngagementDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_PROACTIVE_ENGAGEMENT_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateProactiveEngagementDetailsResponse, "AssociateProactiveEngagementDetails")
      end

      # Enables Shield Advanced for a specific Amazon Web Services resource. The resource can be an Amazon
      # CloudFront distribution, Amazon Route 53 hosted zone, Global Accelerator standard accelerator,
      # Elastic IP Address, Application Load Balancer, or a Classic Load Balancer. You can protect Amazon
      # EC2 instances and Network Load Balancers by association with protected Amazon EC2 Elastic IP
      # addresses. You can add protection to only a single resource with each CreateProtection request. You
      # can add protection to multiple resources at once through the Shield Advanced console at
      # https://console.aws.amazon.com/wafv2/shieldv2#/ . For more information see Getting Started with
      # Shield Advanced and Adding Shield Advanced protection to Amazon Web Services resources .
      def create_protection(
        name : String,
        resource_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProtectionResponse
        input = Types::CreateProtectionRequest.new(name: name, resource_arn: resource_arn, tags: tags)
        create_protection(input)
      end
      def create_protection(input : Types::CreateProtectionRequest) : Types::CreateProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProtectionResponse, "CreateProtection")
      end

      # Creates a grouping of protected resources so they can be handled as a collective. This resource
      # grouping improves the accuracy of detection and reduces false positives.
      def create_protection_group(
        aggregation : String,
        pattern : String,
        protection_group_id : String,
        members : Array(String)? = nil,
        resource_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProtectionGroupResponse
        input = Types::CreateProtectionGroupRequest.new(aggregation: aggregation, pattern: pattern, protection_group_id: protection_group_id, members: members, resource_type: resource_type, tags: tags)
        create_protection_group(input)
      end
      def create_protection_group(input : Types::CreateProtectionGroupRequest) : Types::CreateProtectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROTECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProtectionGroupResponse, "CreateProtectionGroup")
      end

      # Activates Shield Advanced for an account. For accounts that are members of an Organizations
      # organization, Shield Advanced subscriptions are billed against the organization's payer account,
      # regardless of whether the payer account itself is subscribed. When you initially create a
      # subscription, your subscription is set to be automatically renewed at the end of the existing
      # subscription period. You can change this by submitting an UpdateSubscription request.
      def create_subscription : Types::CreateSubscriptionResponse
        input = Types::CreateSubscriptionRequest.new
        create_subscription(input)
      end
      def create_subscription(input : Types::CreateSubscriptionRequest) : Types::CreateSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSubscriptionResponse, "CreateSubscription")
      end

      # Deletes an Shield Advanced Protection .
      def delete_protection(
        protection_id : String
      ) : Types::DeleteProtectionResponse
        input = Types::DeleteProtectionRequest.new(protection_id: protection_id)
        delete_protection(input)
      end
      def delete_protection(input : Types::DeleteProtectionRequest) : Types::DeleteProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProtectionResponse, "DeleteProtection")
      end

      # Removes the specified protection group.
      def delete_protection_group(
        protection_group_id : String
      ) : Types::DeleteProtectionGroupResponse
        input = Types::DeleteProtectionGroupRequest.new(protection_group_id: protection_group_id)
        delete_protection_group(input)
      end
      def delete_protection_group(input : Types::DeleteProtectionGroupRequest) : Types::DeleteProtectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROTECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProtectionGroupResponse, "DeleteProtectionGroup")
      end

      # Removes Shield Advanced from an account. Shield Advanced requires a 1-year subscription commitment.
      # You cannot delete a subscription prior to the completion of that commitment.
      def delete_subscription : Types::DeleteSubscriptionResponse
        input = Types::DeleteSubscriptionRequest.new
        delete_subscription(input)
      end
      def delete_subscription(input : Types::DeleteSubscriptionRequest) : Types::DeleteSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSubscriptionResponse, "DeleteSubscription")
      end

      # Describes the details of a DDoS attack.
      def describe_attack(
        attack_id : String
      ) : Types::DescribeAttackResponse
        input = Types::DescribeAttackRequest.new(attack_id: attack_id)
        describe_attack(input)
      end
      def describe_attack(input : Types::DescribeAttackRequest) : Types::DescribeAttackResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ATTACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAttackResponse, "DescribeAttack")
      end

      # Provides information about the number and type of attacks Shield has detected in the last year for
      # all resources that belong to your account, regardless of whether you've defined Shield protections
      # for them. This operation is available to Shield customers as well as to Shield Advanced customers.
      # The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today.
      # For example, if the current time is 2020-10-26 15:39:32 PDT , equal to 2020-10-26 22:39:32 UTC ,
      # then the time range for the attack data returned is from 2019-10-26 00:00:00 UTC to 2020-10-26
      # 00:00:00 UTC . The time range indicates the period covered by the attack statistics data items.
      def describe_attack_statistics : Types::DescribeAttackStatisticsResponse
        input = Types::DescribeAttackStatisticsRequest.new
        describe_attack_statistics(input)
      end
      def describe_attack_statistics(input : Types::DescribeAttackStatisticsRequest) : Types::DescribeAttackStatisticsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ATTACK_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAttackStatisticsResponse, "DescribeAttackStatistics")
      end

      # Returns the current role and list of Amazon S3 log buckets used by the Shield Response Team (SRT) to
      # access your Amazon Web Services account while assisting with attack mitigation.
      def describe_drt_access : Types::DescribeDRTAccessResponse
        input = Types::DescribeDRTAccessRequest.new
        describe_drt_access(input)
      end
      def describe_drt_access(input : Types::DescribeDRTAccessRequest) : Types::DescribeDRTAccessResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DRT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDRTAccessResponse, "DescribeDRTAccess")
      end

      # A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact
      # you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive
      # customer support.
      def describe_emergency_contact_settings : Types::DescribeEmergencyContactSettingsResponse
        input = Types::DescribeEmergencyContactSettingsRequest.new
        describe_emergency_contact_settings(input)
      end
      def describe_emergency_contact_settings(input : Types::DescribeEmergencyContactSettingsRequest) : Types::DescribeEmergencyContactSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EMERGENCY_CONTACT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEmergencyContactSettingsResponse, "DescribeEmergencyContactSettings")
      end

      # Lists the details of a Protection object.
      def describe_protection(
        protection_id : String? = nil,
        resource_arn : String? = nil
      ) : Types::DescribeProtectionResponse
        input = Types::DescribeProtectionRequest.new(protection_id: protection_id, resource_arn: resource_arn)
        describe_protection(input)
      end
      def describe_protection(input : Types::DescribeProtectionRequest) : Types::DescribeProtectionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROTECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProtectionResponse, "DescribeProtection")
      end

      # Returns the specification for the specified protection group.
      def describe_protection_group(
        protection_group_id : String
      ) : Types::DescribeProtectionGroupResponse
        input = Types::DescribeProtectionGroupRequest.new(protection_group_id: protection_group_id)
        describe_protection_group(input)
      end
      def describe_protection_group(input : Types::DescribeProtectionGroupRequest) : Types::DescribeProtectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROTECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProtectionGroupResponse, "DescribeProtectionGroup")
      end

      # Provides details about the Shield Advanced subscription for an account.
      def describe_subscription : Types::DescribeSubscriptionResponse
        input = Types::DescribeSubscriptionRequest.new
        describe_subscription(input)
      end
      def describe_subscription(input : Types::DescribeSubscriptionRequest) : Types::DescribeSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSubscriptionResponse, "DescribeSubscription")
      end

      # Disable the Shield Advanced automatic application layer DDoS mitigation feature for the protected
      # resource. This stops Shield Advanced from creating, verifying, and applying WAF rules for attacks
      # that it detects for the resource.
      def disable_application_layer_automatic_response(
        resource_arn : String
      ) : Types::DisableApplicationLayerAutomaticResponseResponse
        input = Types::DisableApplicationLayerAutomaticResponseRequest.new(resource_arn: resource_arn)
        disable_application_layer_automatic_response(input)
      end
      def disable_application_layer_automatic_response(input : Types::DisableApplicationLayerAutomaticResponseRequest) : Types::DisableApplicationLayerAutomaticResponseResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_APPLICATION_LAYER_AUTOMATIC_RESPONSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableApplicationLayerAutomaticResponseResponse, "DisableApplicationLayerAutomaticResponse")
      end

      # Removes authorization from the Shield Response Team (SRT) to notify contacts about escalations to
      # the SRT and to initiate proactive customer support.
      def disable_proactive_engagement : Types::DisableProactiveEngagementResponse
        input = Types::DisableProactiveEngagementRequest.new
        disable_proactive_engagement(input)
      end
      def disable_proactive_engagement(input : Types::DisableProactiveEngagementRequest) : Types::DisableProactiveEngagementResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_PROACTIVE_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableProactiveEngagementResponse, "DisableProactiveEngagement")
      end

      # Removes the Shield Response Team's (SRT) access to the specified Amazon S3 bucket containing the
      # logs that you shared previously.
      def disassociate_drt_log_bucket(
        log_bucket : String
      ) : Types::DisassociateDRTLogBucketResponse
        input = Types::DisassociateDRTLogBucketRequest.new(log_bucket: log_bucket)
        disassociate_drt_log_bucket(input)
      end
      def disassociate_drt_log_bucket(input : Types::DisassociateDRTLogBucketRequest) : Types::DisassociateDRTLogBucketResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_DRT_LOG_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateDRTLogBucketResponse, "DisassociateDRTLogBucket")
      end

      # Removes the Shield Response Team's (SRT) access to your Amazon Web Services account.
      def disassociate_drt_role : Types::DisassociateDRTRoleResponse
        input = Types::DisassociateDRTRoleRequest.new
        disassociate_drt_role(input)
      end
      def disassociate_drt_role(input : Types::DisassociateDRTRoleRequest) : Types::DisassociateDRTRoleResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_DRT_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateDRTRoleResponse, "DisassociateDRTRole")
      end

      # Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced
      # health-based detection uses the health of your Amazon Web Services resource to improve
      # responsiveness and accuracy in attack detection and response. You define the health check in Route
      # 53 and then associate or disassociate it with your Shield Advanced protection. For more information,
      # see Shield Advanced Health-Based Detection in the WAF Developer Guide .
      def disassociate_health_check(
        health_check_arn : String,
        protection_id : String
      ) : Types::DisassociateHealthCheckResponse
        input = Types::DisassociateHealthCheckRequest.new(health_check_arn: health_check_arn, protection_id: protection_id)
        disassociate_health_check(input)
      end
      def disassociate_health_check(input : Types::DisassociateHealthCheckRequest) : Types::DisassociateHealthCheckResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateHealthCheckResponse, "DisassociateHealthCheck")
      end

      # Enable the Shield Advanced automatic application layer DDoS mitigation for the protected resource.
      # This feature is available for Amazon CloudFront distributions and Application Load Balancers only.
      # This causes Shield Advanced to create, verify, and apply WAF rules for DDoS attacks that it detects
      # for the resource. Shield Advanced applies the rules in a Shield rule group inside the web ACL that
      # you've associated with the resource. For information about how automatic mitigation works and the
      # requirements for using it, see Shield Advanced automatic application layer DDoS mitigation . Don't
      # use this action to make changes to automatic mitigation settings when it's already enabled for a
      # resource. Instead, use UpdateApplicationLayerAutomaticResponse . To use this feature, you must
      # associate a web ACL with the protected resource. The web ACL must be created using the latest
      # version of WAF (v2). You can associate the web ACL through the Shield Advanced console at
      # https://console.aws.amazon.com/wafv2/shieldv2#/ . For more information, see Getting Started with
      # Shield Advanced . You can also associate the web ACL to the resource through the WAF console or the
      # WAF API, but you must manage Shield Advanced automatic mitigation through Shield Advanced. For
      # information about WAF, see WAF Developer Guide .
      def enable_application_layer_automatic_response(
        action : Types::ResponseAction,
        resource_arn : String
      ) : Types::EnableApplicationLayerAutomaticResponseResponse
        input = Types::EnableApplicationLayerAutomaticResponseRequest.new(action: action, resource_arn: resource_arn)
        enable_application_layer_automatic_response(input)
      end
      def enable_application_layer_automatic_response(input : Types::EnableApplicationLayerAutomaticResponseRequest) : Types::EnableApplicationLayerAutomaticResponseResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_APPLICATION_LAYER_AUTOMATIC_RESPONSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableApplicationLayerAutomaticResponseResponse, "EnableApplicationLayerAutomaticResponse")
      end

      # Authorizes the Shield Response Team (SRT) to use email and phone to notify contacts about
      # escalations to the SRT and to initiate proactive customer support.
      def enable_proactive_engagement : Types::EnableProactiveEngagementResponse
        input = Types::EnableProactiveEngagementRequest.new
        enable_proactive_engagement(input)
      end
      def enable_proactive_engagement(input : Types::EnableProactiveEngagementRequest) : Types::EnableProactiveEngagementResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_PROACTIVE_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableProactiveEngagementResponse, "EnableProactiveEngagement")
      end

      # Returns the SubscriptionState , either Active or Inactive .
      def get_subscription_state : Types::GetSubscriptionStateResponse
        input = Types::GetSubscriptionStateRequest.new
        get_subscription_state(input)
      end
      def get_subscription_state(input : Types::GetSubscriptionStateRequest) : Types::GetSubscriptionStateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SUBSCRIPTION_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSubscriptionStateResponse, "GetSubscriptionState")
      end

      # Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.
      def list_attacks(
        end_time : Types::TimeRange? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_arns : Array(String)? = nil,
        start_time : Types::TimeRange? = nil
      ) : Types::ListAttacksResponse
        input = Types::ListAttacksRequest.new(end_time: end_time, max_results: max_results, next_token: next_token, resource_arns: resource_arns, start_time: start_time)
        list_attacks(input)
      end
      def list_attacks(input : Types::ListAttacksRequest) : Types::ListAttacksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ATTACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAttacksResponse, "ListAttacks")
      end

      # Retrieves ProtectionGroup objects for the account. You can retrieve all protection groups or you can
      # provide filtering criteria and retrieve just the subset of protection groups that match the
      # criteria.
      def list_protection_groups(
        inclusion_filters : Types::InclusionProtectionGroupFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProtectionGroupsResponse
        input = Types::ListProtectionGroupsRequest.new(inclusion_filters: inclusion_filters, max_results: max_results, next_token: next_token)
        list_protection_groups(input)
      end
      def list_protection_groups(input : Types::ListProtectionGroupsRequest) : Types::ListProtectionGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROTECTION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProtectionGroupsResponse, "ListProtectionGroups")
      end

      # Retrieves Protection objects for the account. You can retrieve all protections or you can provide
      # filtering criteria and retrieve just the subset of protections that match the criteria.
      def list_protections(
        inclusion_filters : Types::InclusionProtectionFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProtectionsResponse
        input = Types::ListProtectionsRequest.new(inclusion_filters: inclusion_filters, max_results: max_results, next_token: next_token)
        list_protections(input)
      end
      def list_protections(input : Types::ListProtectionsRequest) : Types::ListProtectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROTECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProtectionsResponse, "ListProtections")
      end

      # Retrieves the resources that are included in the protection group.
      def list_resources_in_protection_group(
        protection_group_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourcesInProtectionGroupResponse
        input = Types::ListResourcesInProtectionGroupRequest.new(protection_group_id: protection_group_id, max_results: max_results, next_token: next_token)
        list_resources_in_protection_group(input)
      end
      def list_resources_in_protection_group(input : Types::ListResourcesInProtectionGroupRequest) : Types::ListResourcesInProtectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCES_IN_PROTECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourcesInProtectionGroupResponse, "ListResourcesInProtectionGroup")
      end

      # Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in
      # Shield.
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Adds or updates tags for a resource in Shield.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from a resource in Shield.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing Shield Advanced automatic application layer DDoS mitigation configuration for
      # the specified resource.
      def update_application_layer_automatic_response(
        action : Types::ResponseAction,
        resource_arn : String
      ) : Types::UpdateApplicationLayerAutomaticResponseResponse
        input = Types::UpdateApplicationLayerAutomaticResponseRequest.new(action: action, resource_arn: resource_arn)
        update_application_layer_automatic_response(input)
      end
      def update_application_layer_automatic_response(input : Types::UpdateApplicationLayerAutomaticResponseRequest) : Types::UpdateApplicationLayerAutomaticResponseResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION_LAYER_AUTOMATIC_RESPONSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationLayerAutomaticResponseResponse, "UpdateApplicationLayerAutomaticResponse")
      end

      # Updates the details of the list of email addresses and phone numbers that the Shield Response Team
      # (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT
      # and to initiate proactive customer support.
      def update_emergency_contact_settings(
        emergency_contact_list : Array(Types::EmergencyContact)? = nil
      ) : Types::UpdateEmergencyContactSettingsResponse
        input = Types::UpdateEmergencyContactSettingsRequest.new(emergency_contact_list: emergency_contact_list)
        update_emergency_contact_settings(input)
      end
      def update_emergency_contact_settings(input : Types::UpdateEmergencyContactSettingsRequest) : Types::UpdateEmergencyContactSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EMERGENCY_CONTACT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEmergencyContactSettingsResponse, "UpdateEmergencyContactSettings")
      end

      # Updates an existing protection group. A protection group is a grouping of protected resources so
      # they can be handled as a collective. This resource grouping improves the accuracy of detection and
      # reduces false positives.
      def update_protection_group(
        aggregation : String,
        pattern : String,
        protection_group_id : String,
        members : Array(String)? = nil,
        resource_type : String? = nil
      ) : Types::UpdateProtectionGroupResponse
        input = Types::UpdateProtectionGroupRequest.new(aggregation: aggregation, pattern: pattern, protection_group_id: protection_group_id, members: members, resource_type: resource_type)
        update_protection_group(input)
      end
      def update_protection_group(input : Types::UpdateProtectionGroupRequest) : Types::UpdateProtectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROTECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProtectionGroupResponse, "UpdateProtectionGroup")
      end

      # Updates the details of an existing subscription. Only enter values for parameters you want to
      # change. Empty parameters are not updated. For accounts that are members of an Organizations
      # organization, Shield Advanced subscriptions are billed against the organization's payer account,
      # regardless of whether the payer account itself is subscribed.
      def update_subscription(
        auto_renew : String? = nil
      ) : Types::UpdateSubscriptionResponse
        input = Types::UpdateSubscriptionRequest.new(auto_renew: auto_renew)
        update_subscription(input)
      end
      def update_subscription(input : Types::UpdateSubscriptionRequest) : Types::UpdateSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSubscriptionResponse, "UpdateSubscription")
      end
    end
  end
end
