module Aws
  module WAFV2
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates a web ACL with a resource, to protect the resource. Use this for all resource types
      # except for Amazon CloudFront distributions. For Amazon CloudFront, call UpdateDistribution for the
      # distribution and provide the Amazon Resource Name (ARN) of the web ACL in the web ACL ID. For
      # information, see UpdateDistribution in the Amazon CloudFront Developer Guide . Required permissions
      # for customer-managed IAM policies This call requires permissions that are specific to the protected
      # resource type. For details, see Permissions for AssociateWebACL in the WAF Developer Guide .
      # Temporary inconsistencies during updates When you create or change a web ACL or other WAF resources,
      # the changes take a small amount of time to propagate to all areas where the resources are stored.
      # The propagation time can be from a few seconds to a number of minutes. The following are examples of
      # the temporary inconsistencies that you might notice during change propagation: After you create a
      # web ACL, if you try to associate it with a resource, you might get an exception indicating that the
      # web ACL is unavailable. After you add a rule group to a web ACL, the new rule group rules might be
      # in effect in one area where the web ACL is used and not in another. After you change a rule action
      # setting, you might see the old action in some places and the new action in others. After you add an
      # IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one
      # area while still allowed in another.

      def associate_web_acl(
        resource_arn : String,
        web_acl_arn : String
      ) : Types::AssociateWebACLResponse

        input = Types::AssociateWebACLRequest.new(resource_arn: resource_arn, web_acl_arn: web_acl_arn)
        associate_web_acl(input)
      end

      def associate_web_acl(input : Types::AssociateWebACLRequest) : Types::AssociateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateWebACLResponse, "AssociateWebACL")
      end

      # Returns the web ACL capacity unit (WCU) requirements for a specified scope and set of rules. You can
      # use this to check the capacity requirements for the rules you want to use in a RuleGroup or WebACL .
      # WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule
      # groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the
      # relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex
      # rules that use more processing power. Rule group capacity is fixed at creation, which helps users
      # plan their web ACL WCU usage when they use a rule group. For more information, see WAF web ACL
      # capacity units (WCU) in the WAF Developer Guide .

      def check_capacity(
        rules : Array(Types::Rule),
        scope : String
      ) : Types::CheckCapacityResponse

        input = Types::CheckCapacityRequest.new(rules: rules, scope: scope)
        check_capacity(input)
      end

      def check_capacity(input : Types::CheckCapacityRequest) : Types::CheckCapacityResponse
        request = Protocol::JsonRpc.build_request(Model::CHECK_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckCapacityResponse, "CheckCapacity")
      end

      # Creates an API key that contains a set of token domains. API keys are required for the integration
      # of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement
      # and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA
      # JavaScript integration, see WAF client application integration in the WAF Developer Guide . You can
      # use a single key for up to 5 domains. After you generate a key, you can copy it for use in your
      # JavaScript integration.

      def create_api_key(
        scope : String,
        token_domains : Array(String)
      ) : Types::CreateAPIKeyResponse

        input = Types::CreateAPIKeyRequest.new(scope: scope, token_domains: token_domains)
        create_api_key(input)
      end

      def create_api_key(input : Types::CreateAPIKeyRequest) : Types::CreateAPIKeyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_API_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAPIKeyResponse, "CreateAPIKey")
      end

      # Creates an IPSet , which you use to identify web requests that originate from specific IP addresses
      # or ranges of IP addresses. For example, if you're receiving a lot of requests from a ranges of IP
      # addresses, you can configure WAF to block them using an IPSet that lists those IP addresses.

      def create_ip_set(
        addresses : Array(String),
        ip_address_version : String,
        name : String,
        scope : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateIPSetResponse

        input = Types::CreateIPSetRequest.new(addresses: addresses, ip_address_version: ip_address_version, name: name, scope: scope, description: description, tags: tags)
        create_ip_set(input)
      end

      def create_ip_set(input : Types::CreateIPSetRequest) : Types::CreateIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIPSetResponse, "CreateIPSet")
      end

      # Creates a RegexPatternSet , which you reference in a RegexPatternSetReferenceStatement , to have WAF
      # inspect a web request component for the specified patterns.

      def create_regex_pattern_set(
        name : String,
        regular_expression_list : Array(Types::Regex),
        scope : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRegexPatternSetResponse

        input = Types::CreateRegexPatternSetRequest.new(name: name, regular_expression_list: regular_expression_list, scope: scope, description: description, tags: tags)
        create_regex_pattern_set(input)
      end

      def create_regex_pattern_set(input : Types::CreateRegexPatternSetRequest) : Types::CreateRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegexPatternSetResponse, "CreateRegexPatternSet")
      end

      # Creates a RuleGroup per the specifications provided. A rule group defines a collection of rules to
      # inspect and control web requests that you can use in a WebACL . When you create a rule group, you
      # define an immutable capacity limit. If you update a rule group, you must stay within the capacity.
      # This allows others to reuse the rule group with confidence in its capacity requirements.

      def create_rule_group(
        capacity : Int64,
        name : String,
        scope : String,
        visibility_config : Types::VisibilityConfig,
        custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
        description : String? = nil,
        rules : Array(Types::Rule)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleGroupResponse

        input = Types::CreateRuleGroupRequest.new(capacity: capacity, name: name, scope: scope, visibility_config: visibility_config, custom_response_bodies: custom_response_bodies, description: description, rules: rules, tags: tags)
        create_rule_group(input)
      end

      def create_rule_group(input : Types::CreateRuleGroupRequest) : Types::CreateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleGroupResponse, "CreateRuleGroup")
      end

      # Creates a WebACL per the specifications provided. A web ACL defines a collection of rules to use to
      # inspect and control web requests. Each rule has a statement that defines what to look for in web
      # requests and an action that WAF applies to requests that match the statement. In the web ACL, you
      # assign a default action to take (allow, block) for any request that does not match any of the rules.
      # The rules in a web ACL can be a combination of the types Rule , RuleGroup , and managed rule group.
      # You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource
      # types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load
      # Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application,
      # and Amazon Web Services Verified Access instance.

      def create_web_acl(
        default_action : Types::DefaultAction,
        name : String,
        scope : String,
        visibility_config : Types::VisibilityConfig,
        application_config : Types::ApplicationConfig? = nil,
        association_config : Types::AssociationConfig? = nil,
        captcha_config : Types::CaptchaConfig? = nil,
        challenge_config : Types::ChallengeConfig? = nil,
        custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
        data_protection_config : Types::DataProtectionConfig? = nil,
        description : String? = nil,
        on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig? = nil,
        rules : Array(Types::Rule)? = nil,
        tags : Array(Types::Tag)? = nil,
        token_domains : Array(String)? = nil
      ) : Types::CreateWebACLResponse

        input = Types::CreateWebACLRequest.new(default_action: default_action, name: name, scope: scope, visibility_config: visibility_config, application_config: application_config, association_config: association_config, captcha_config: captcha_config, challenge_config: challenge_config, custom_response_bodies: custom_response_bodies, data_protection_config: data_protection_config, description: description, on_source_d_do_s_protection_config: on_source_d_do_s_protection_config, rules: rules, tags: tags, token_domains: token_domains)
        create_web_acl(input)
      end

      def create_web_acl(input : Types::CreateWebACLRequest) : Types::CreateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWebACLResponse, "CreateWebACL")
      end

      # Deletes the specified API key. After you delete a key, it can take up to 24 hours for WAF to
      # disallow use of the key in all regions.

      def delete_api_key(
        api_key : String,
        scope : String
      ) : Types::DeleteAPIKeyResponse

        input = Types::DeleteAPIKeyRequest.new(api_key: api_key, scope: scope)
        delete_api_key(input)
      end

      def delete_api_key(input : Types::DeleteAPIKeyRequest) : Types::DeleteAPIKeyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_API_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAPIKeyResponse, "DeleteAPIKey")
      end

      # Deletes all rule groups that are managed by Firewall Manager from the specified WebACL . You can
      # only use this if ManagedByFirewallManager and RetrofittedByFirewallManager are both false in the web
      # ACL.

      def delete_firewall_manager_rule_groups(
        web_acl_arn : String,
        web_acl_lock_token : String
      ) : Types::DeleteFirewallManagerRuleGroupsResponse

        input = Types::DeleteFirewallManagerRuleGroupsRequest.new(web_acl_arn: web_acl_arn, web_acl_lock_token: web_acl_lock_token)
        delete_firewall_manager_rule_groups(input)
      end

      def delete_firewall_manager_rule_groups(input : Types::DeleteFirewallManagerRuleGroupsRequest) : Types::DeleteFirewallManagerRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FIREWALL_MANAGER_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFirewallManagerRuleGroupsResponse, "DeleteFirewallManagerRuleGroups")
      end

      # Deletes the specified IPSet .

      def delete_ip_set(
        id : String,
        lock_token : String,
        name : String,
        scope : String
      ) : Types::DeleteIPSetResponse

        input = Types::DeleteIPSetRequest.new(id: id, lock_token: lock_token, name: name, scope: scope)
        delete_ip_set(input)
      end

      def delete_ip_set(input : Types::DeleteIPSetRequest) : Types::DeleteIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIPSetResponse, "DeleteIPSet")
      end

      # Deletes the LoggingConfiguration from the specified web ACL.

      def delete_logging_configuration(
        resource_arn : String,
        log_scope : String? = nil,
        log_type : String? = nil
      ) : Types::DeleteLoggingConfigurationResponse

        input = Types::DeleteLoggingConfigurationRequest.new(resource_arn: resource_arn, log_scope: log_scope, log_type: log_type)
        delete_logging_configuration(input)
      end

      def delete_logging_configuration(input : Types::DeleteLoggingConfigurationRequest) : Types::DeleteLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLoggingConfigurationResponse, "DeleteLoggingConfiguration")
      end

      # Permanently deletes an IAM policy from the specified rule group. You must be the owner of the rule
      # group to perform this operation.

      def delete_permission_policy(
        resource_arn : String
      ) : Types::DeletePermissionPolicyResponse

        input = Types::DeletePermissionPolicyRequest.new(resource_arn: resource_arn)
        delete_permission_policy(input)
      end

      def delete_permission_policy(input : Types::DeletePermissionPolicyRequest) : Types::DeletePermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePermissionPolicyResponse, "DeletePermissionPolicy")
      end

      # Deletes the specified RegexPatternSet .

      def delete_regex_pattern_set(
        id : String,
        lock_token : String,
        name : String,
        scope : String
      ) : Types::DeleteRegexPatternSetResponse

        input = Types::DeleteRegexPatternSetRequest.new(id: id, lock_token: lock_token, name: name, scope: scope)
        delete_regex_pattern_set(input)
      end

      def delete_regex_pattern_set(input : Types::DeleteRegexPatternSetRequest) : Types::DeleteRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegexPatternSetResponse, "DeleteRegexPatternSet")
      end

      # Deletes the specified RuleGroup .

      def delete_rule_group(
        id : String,
        lock_token : String,
        name : String,
        scope : String
      ) : Types::DeleteRuleGroupResponse

        input = Types::DeleteRuleGroupRequest.new(id: id, lock_token: lock_token, name: name, scope: scope)
        delete_rule_group(input)
      end

      def delete_rule_group(input : Types::DeleteRuleGroupRequest) : Types::DeleteRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleGroupResponse, "DeleteRuleGroup")
      end

      # Deletes the specified WebACL . You can only use this if ManagedByFirewallManager is false in the web
      # ACL. Before deleting any web ACL, first disassociate it from all resources. To retrieve a list of
      # the resources that are associated with a web ACL, use the following calls: For Amazon CloudFront
      # distributions, use the CloudFront call ListDistributionsByWebACLId . For information, see
      # ListDistributionsByWebACLId in the Amazon CloudFront API Reference . For all other resources, call
      # ListResourcesForWebACL . To disassociate a resource from a web ACL, use the following calls: For
      # Amazon CloudFront distributions, provide an empty web ACL ID in the CloudFront call
      # UpdateDistribution . For information, see UpdateDistribution in the Amazon CloudFront API Reference
      # . For all other resources, call DisassociateWebACL .

      def delete_web_acl(
        id : String,
        lock_token : String,
        name : String,
        scope : String
      ) : Types::DeleteWebACLResponse

        input = Types::DeleteWebACLRequest.new(id: id, lock_token: lock_token, name: name, scope: scope)
        delete_web_acl(input)
      end

      def delete_web_acl(input : Types::DeleteWebACLRequest) : Types::DeleteWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWebACLResponse, "DeleteWebACL")
      end

      # Provides high-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web
      # Services Marketplace managed rule groups.

      def describe_all_managed_products(
        scope : String
      ) : Types::DescribeAllManagedProductsResponse

        input = Types::DescribeAllManagedProductsRequest.new(scope: scope)
        describe_all_managed_products(input)
      end

      def describe_all_managed_products(input : Types::DescribeAllManagedProductsRequest) : Types::DescribeAllManagedProductsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ALL_MANAGED_PRODUCTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAllManagedProductsResponse, "DescribeAllManagedProducts")
      end

      # Provides high-level information for the managed rule groups owned by a specific vendor.

      def describe_managed_products_by_vendor(
        scope : String,
        vendor_name : String
      ) : Types::DescribeManagedProductsByVendorResponse

        input = Types::DescribeManagedProductsByVendorRequest.new(scope: scope, vendor_name: vendor_name)
        describe_managed_products_by_vendor(input)
      end

      def describe_managed_products_by_vendor(input : Types::DescribeManagedProductsByVendorRequest) : Types::DescribeManagedProductsByVendorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MANAGED_PRODUCTS_BY_VENDOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeManagedProductsByVendorResponse, "DescribeManagedProductsByVendor")
      end

      # Provides high-level information for a managed rule group, including descriptions of the rules.

      def describe_managed_rule_group(
        name : String,
        scope : String,
        vendor_name : String,
        version_name : String? = nil
      ) : Types::DescribeManagedRuleGroupResponse

        input = Types::DescribeManagedRuleGroupRequest.new(name: name, scope: scope, vendor_name: vendor_name, version_name: version_name)
        describe_managed_rule_group(input)
      end

      def describe_managed_rule_group(input : Types::DescribeManagedRuleGroupRequest) : Types::DescribeManagedRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MANAGED_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeManagedRuleGroupResponse, "DescribeManagedRuleGroup")
      end

      # Disassociates the specified resource from its web ACL association, if it has one. Use this for all
      # resource types except for Amazon CloudFront distributions. For Amazon CloudFront, call
      # UpdateDistribution for the distribution and provide an empty web ACL ID. For information, see
      # UpdateDistribution in the Amazon CloudFront API Reference . Required permissions for
      # customer-managed IAM policies This call requires permissions that are specific to the protected
      # resource type. For details, see Permissions for DisassociateWebACL in the WAF Developer Guide .

      def disassociate_web_acl(
        resource_arn : String
      ) : Types::DisassociateWebACLResponse

        input = Types::DisassociateWebACLRequest.new(resource_arn: resource_arn)
        disassociate_web_acl(input)
      end

      def disassociate_web_acl(input : Types::DisassociateWebACLRequest) : Types::DisassociateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateWebACLResponse, "DisassociateWebACL")
      end

      # Generates a presigned download URL for the specified release of the mobile SDK. The mobile SDK is
      # not generally available. Customers who have access to the mobile SDK can use it to establish and
      # manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see
      # WAF client application integration in the WAF Developer Guide .

      def generate_mobile_sdk_release_url(
        platform : String,
        release_version : String
      ) : Types::GenerateMobileSdkReleaseUrlResponse

        input = Types::GenerateMobileSdkReleaseUrlRequest.new(platform: platform, release_version: release_version)
        generate_mobile_sdk_release_url(input)
      end

      def generate_mobile_sdk_release_url(input : Types::GenerateMobileSdkReleaseUrlRequest) : Types::GenerateMobileSdkReleaseUrlResponse
        request = Protocol::JsonRpc.build_request(Model::GENERATE_MOBILE_SDK_RELEASE_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GenerateMobileSdkReleaseUrlResponse, "GenerateMobileSdkReleaseUrl")
      end

      # Returns your API key in decrypted form. Use this to check the token domains that you have defined
      # for the key. API keys are required for the integration of the CAPTCHA API in your JavaScript client
      # applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for
      # your end users. For more information about the CAPTCHA JavaScript integration, see WAF client
      # application integration in the WAF Developer Guide .

      def get_decrypted_api_key(
        api_key : String,
        scope : String
      ) : Types::GetDecryptedAPIKeyResponse

        input = Types::GetDecryptedAPIKeyRequest.new(api_key: api_key, scope: scope)
        get_decrypted_api_key(input)
      end

      def get_decrypted_api_key(input : Types::GetDecryptedAPIKeyRequest) : Types::GetDecryptedAPIKeyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DECRYPTED_API_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDecryptedAPIKeyResponse, "GetDecryptedAPIKey")
      end

      # Retrieves the specified IPSet .

      def get_ip_set(
        id : String,
        name : String,
        scope : String
      ) : Types::GetIPSetResponse

        input = Types::GetIPSetRequest.new(id: id, name: name, scope: scope)
        get_ip_set(input)
      end

      def get_ip_set(input : Types::GetIPSetRequest) : Types::GetIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIPSetResponse, "GetIPSet")
      end

      # Returns the LoggingConfiguration for the specified web ACL.

      def get_logging_configuration(
        resource_arn : String,
        log_scope : String? = nil,
        log_type : String? = nil
      ) : Types::GetLoggingConfigurationResponse

        input = Types::GetLoggingConfigurationRequest.new(resource_arn: resource_arn, log_scope: log_scope, log_type: log_type)
        get_logging_configuration(input)
      end

      def get_logging_configuration(input : Types::GetLoggingConfigurationRequest) : Types::GetLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoggingConfigurationResponse, "GetLoggingConfiguration")
      end

      # Retrieves the specified managed rule set. This is intended for use only by vendors of managed rule
      # sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you can
      # use the managed rule set APIs to provide controlled rollout of your versioned managed rule group
      # offerings for your customers. The APIs are ListManagedRuleSets , GetManagedRuleSet ,
      # PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      def get_managed_rule_set(
        id : String,
        name : String,
        scope : String
      ) : Types::GetManagedRuleSetResponse

        input = Types::GetManagedRuleSetRequest.new(id: id, name: name, scope: scope)
        get_managed_rule_set(input)
      end

      def get_managed_rule_set(input : Types::GetManagedRuleSetRequest) : Types::GetManagedRuleSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MANAGED_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetManagedRuleSetResponse, "GetManagedRuleSet")
      end

      # Retrieves information for the specified mobile SDK release, including release notes and tags. The
      # mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to
      # establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more
      # information, see WAF client application integration in the WAF Developer Guide .

      def get_mobile_sdk_release(
        platform : String,
        release_version : String
      ) : Types::GetMobileSdkReleaseResponse

        input = Types::GetMobileSdkReleaseRequest.new(platform: platform, release_version: release_version)
        get_mobile_sdk_release(input)
      end

      def get_mobile_sdk_release(input : Types::GetMobileSdkReleaseRequest) : Types::GetMobileSdkReleaseResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MOBILE_SDK_RELEASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMobileSdkReleaseResponse, "GetMobileSdkRelease")
      end

      # Returns the IAM policy that is attached to the specified rule group. You must be the owner of the
      # rule group to perform this operation.

      def get_permission_policy(
        resource_arn : String
      ) : Types::GetPermissionPolicyResponse

        input = Types::GetPermissionPolicyRequest.new(resource_arn: resource_arn)
        get_permission_policy(input)
      end

      def get_permission_policy(input : Types::GetPermissionPolicyRequest) : Types::GetPermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPermissionPolicyResponse, "GetPermissionPolicy")
      end

      # Retrieves the IP addresses that are currently blocked by a rate-based rule instance. This is only
      # available for rate-based rules that aggregate solely on the IP address or on the forwarded IP
      # address. The maximum number of addresses that can be blocked for a single rate-based rule instance
      # is 10,000. If more than 10,000 addresses exceed the rate limit, those with the highest rates are
      # blocked. For a rate-based rule that you've defined inside a rule group, provide the name of the rule
      # group reference statement in your request, in addition to the rate-based rule name and the web ACL
      # name. WAF monitors web requests and manages keys independently for each unique combination of web
      # ACL, optional rule group, and rate-based rule. For example, if you define a rate-based rule inside a
      # rule group, and then use the rule group in a web ACL, WAF monitors web requests and manages keys for
      # that web ACL, rule group reference statement, and rate-based rule instance. If you use the same rule
      # group in a second web ACL, WAF monitors web requests and manages keys for this second usage
      # completely independent of your first.

      def get_rate_based_statement_managed_keys(
        rule_name : String,
        scope : String,
        web_acl_id : String,
        web_acl_name : String,
        rule_group_rule_name : String? = nil
      ) : Types::GetRateBasedStatementManagedKeysResponse

        input = Types::GetRateBasedStatementManagedKeysRequest.new(rule_name: rule_name, scope: scope, web_acl_id: web_acl_id, web_acl_name: web_acl_name, rule_group_rule_name: rule_group_rule_name)
        get_rate_based_statement_managed_keys(input)
      end

      def get_rate_based_statement_managed_keys(input : Types::GetRateBasedStatementManagedKeysRequest) : Types::GetRateBasedStatementManagedKeysResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RATE_BASED_STATEMENT_MANAGED_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRateBasedStatementManagedKeysResponse, "GetRateBasedStatementManagedKeys")
      end

      # Retrieves the specified RegexPatternSet .

      def get_regex_pattern_set(
        id : String,
        name : String,
        scope : String
      ) : Types::GetRegexPatternSetResponse

        input = Types::GetRegexPatternSetRequest.new(id: id, name: name, scope: scope)
        get_regex_pattern_set(input)
      end

      def get_regex_pattern_set(input : Types::GetRegexPatternSetRequest) : Types::GetRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegexPatternSetResponse, "GetRegexPatternSet")
      end

      # Retrieves the specified RuleGroup .

      def get_rule_group(
        arn : String? = nil,
        id : String? = nil,
        name : String? = nil,
        scope : String? = nil
      ) : Types::GetRuleGroupResponse

        input = Types::GetRuleGroupRequest.new(arn: arn, id: id, name: name, scope: scope)
        get_rule_group(input)
      end

      def get_rule_group(input : Types::GetRuleGroupRequest) : Types::GetRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRuleGroupResponse, "GetRuleGroup")
      end

      # Gets detailed information about a specified number of requests--a sample--that WAF randomly selects
      # from among the first 5,000 requests that your Amazon Web Services resource received during a time
      # range that you choose. You can specify a sample size of up to 500 requests, and you can specify any
      # time range in the previous three hours. GetSampledRequests returns a time range, which is usually
      # the time range that you specified. However, if your resource (such as a CloudFront distribution)
      # received 5,000 requests before the specified time range elapsed, GetSampledRequests returns an
      # updated time range. This new time range indicates the actual period during which WAF selected the
      # requests in the sample.

      def get_sampled_requests(
        max_items : Int64,
        rule_metric_name : String,
        scope : String,
        time_window : Types::TimeWindow,
        web_acl_arn : String
      ) : Types::GetSampledRequestsResponse

        input = Types::GetSampledRequestsRequest.new(max_items: max_items, rule_metric_name: rule_metric_name, scope: scope, time_window: time_window, web_acl_arn: web_acl_arn)
        get_sampled_requests(input)
      end

      def get_sampled_requests(input : Types::GetSampledRequestsRequest) : Types::GetSampledRequestsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAMPLED_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSampledRequestsResponse, "GetSampledRequests")
      end

      # Retrieves the specified WebACL .

      def get_web_acl(
        arn : String? = nil,
        id : String? = nil,
        name : String? = nil,
        scope : String? = nil
      ) : Types::GetWebACLResponse

        input = Types::GetWebACLRequest.new(arn: arn, id: id, name: name, scope: scope)
        get_web_acl(input)
      end

      def get_web_acl(input : Types::GetWebACLRequest) : Types::GetWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWebACLResponse, "GetWebACL")
      end

      # Retrieves the WebACL for the specified resource. This call uses GetWebACL , to verify that your
      # account has permission to access the retrieved web ACL. If you get an error that indicates that your
      # account isn't authorized to perform wafv2:GetWebACL on the resource, that error won't be included in
      # your CloudTrail event history. For Amazon CloudFront, don't use this call. Instead, call the
      # CloudFront action GetDistributionConfig . For information, see GetDistributionConfig in the Amazon
      # CloudFront API Reference . Required permissions for customer-managed IAM policies This call requires
      # permissions that are specific to the protected resource type. For details, see Permissions for
      # GetWebACLForResource in the WAF Developer Guide .

      def get_web_acl_for_resource(
        resource_arn : String
      ) : Types::GetWebACLForResourceResponse

        input = Types::GetWebACLForResourceRequest.new(resource_arn: resource_arn)
        get_web_acl_for_resource(input)
      end

      def get_web_acl_for_resource(input : Types::GetWebACLForResourceRequest) : Types::GetWebACLForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WEB_ACL_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWebACLForResourceResponse, "GetWebACLForResource")
      end

      # Retrieves a list of the API keys that you've defined for the specified scope. API keys are required
      # for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you
      # customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more
      # information about the CAPTCHA JavaScript integration, see WAF client application integration in the
      # WAF Developer Guide .

      def list_api_keys(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListAPIKeysResponse

        input = Types::ListAPIKeysRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_api_keys(input)
      end

      def list_api_keys(input : Types::ListAPIKeysRequest) : Types::ListAPIKeysResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_API_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAPIKeysResponse, "ListAPIKeys")
      end

      # Returns a list of the available versions for the specified managed rule group.

      def list_available_managed_rule_group_versions(
        name : String,
        scope : String,
        vendor_name : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListAvailableManagedRuleGroupVersionsResponse

        input = Types::ListAvailableManagedRuleGroupVersionsRequest.new(name: name, scope: scope, vendor_name: vendor_name, limit: limit, next_marker: next_marker)
        list_available_managed_rule_group_versions(input)
      end

      def list_available_managed_rule_group_versions(input : Types::ListAvailableManagedRuleGroupVersionsRequest) : Types::ListAvailableManagedRuleGroupVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_MANAGED_RULE_GROUP_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableManagedRuleGroupVersionsResponse, "ListAvailableManagedRuleGroupVersions")
      end

      # Retrieves an array of managed rule groups that are available for you to use. This list includes all
      # Amazon Web Services Managed Rules rule groups and all of the Amazon Web Services Marketplace managed
      # rule groups that you're subscribed to.

      def list_available_managed_rule_groups(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListAvailableManagedRuleGroupsResponse

        input = Types::ListAvailableManagedRuleGroupsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_available_managed_rule_groups(input)
      end

      def list_available_managed_rule_groups(input : Types::ListAvailableManagedRuleGroupsRequest) : Types::ListAvailableManagedRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_MANAGED_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableManagedRuleGroupsResponse, "ListAvailableManagedRuleGroups")
      end

      # Retrieves an array of IPSetSummary objects for the IP sets that you manage.

      def list_ip_sets(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListIPSetsResponse

        input = Types::ListIPSetsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_ip_sets(input)
      end

      def list_ip_sets(input : Types::ListIPSetsRequest) : Types::ListIPSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IP_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIPSetsResponse, "ListIPSets")
      end

      # Retrieves an array of your LoggingConfiguration objects.

      def list_logging_configurations(
        scope : String,
        limit : Int32? = nil,
        log_scope : String? = nil,
        next_marker : String? = nil
      ) : Types::ListLoggingConfigurationsResponse

        input = Types::ListLoggingConfigurationsRequest.new(scope: scope, limit: limit, log_scope: log_scope, next_marker: next_marker)
        list_logging_configurations(input)
      end

      def list_logging_configurations(input : Types::ListLoggingConfigurationsRequest) : Types::ListLoggingConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LOGGING_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLoggingConfigurationsResponse, "ListLoggingConfigurations")
      end

      # Retrieves the managed rule sets that you own. This is intended for use only by vendors of managed
      # rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you
      # can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group
      # offerings for your customers. The APIs are ListManagedRuleSets , GetManagedRuleSet ,
      # PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      def list_managed_rule_sets(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListManagedRuleSetsResponse

        input = Types::ListManagedRuleSetsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_managed_rule_sets(input)
      end

      def list_managed_rule_sets(input : Types::ListManagedRuleSetsRequest) : Types::ListManagedRuleSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MANAGED_RULE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListManagedRuleSetsResponse, "ListManagedRuleSets")
      end

      # Retrieves a list of the available releases for the mobile SDK and the specified device platform. The
      # mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to
      # establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more
      # information, see WAF client application integration in the WAF Developer Guide .

      def list_mobile_sdk_releases(
        platform : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListMobileSdkReleasesResponse

        input = Types::ListMobileSdkReleasesRequest.new(platform: platform, limit: limit, next_marker: next_marker)
        list_mobile_sdk_releases(input)
      end

      def list_mobile_sdk_releases(input : Types::ListMobileSdkReleasesRequest) : Types::ListMobileSdkReleasesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MOBILE_SDK_RELEASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMobileSdkReleasesResponse, "ListMobileSdkReleases")
      end

      # Retrieves an array of RegexPatternSetSummary objects for the regex pattern sets that you manage.

      def list_regex_pattern_sets(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRegexPatternSetsResponse

        input = Types::ListRegexPatternSetsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_regex_pattern_sets(input)
      end

      def list_regex_pattern_sets(input : Types::ListRegexPatternSetsRequest) : Types::ListRegexPatternSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REGEX_PATTERN_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegexPatternSetsResponse, "ListRegexPatternSets")
      end

      # Retrieves an array of the Amazon Resource Names (ARNs) for the resources that are associated with
      # the specified web ACL. For Amazon CloudFront, don't use this call. Instead, use the CloudFront call
      # ListDistributionsByWebACLId . For information, see ListDistributionsByWebACLId in the Amazon
      # CloudFront API Reference . Required permissions for customer-managed IAM policies This call requires
      # permissions that are specific to the protected resource type. For details, see Permissions for
      # ListResourcesForWebACL in the WAF Developer Guide .

      def list_resources_for_web_acl(
        web_acl_arn : String,
        resource_type : String? = nil
      ) : Types::ListResourcesForWebACLResponse

        input = Types::ListResourcesForWebACLRequest.new(web_acl_arn: web_acl_arn, resource_type: resource_type)
        list_resources_for_web_acl(input)
      end

      def list_resources_for_web_acl(input : Types::ListResourcesForWebACLRequest) : Types::ListResourcesForWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCES_FOR_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourcesForWebACLResponse, "ListResourcesForWebACL")
      end

      # Retrieves an array of RuleGroupSummary objects for the rule groups that you manage.

      def list_rule_groups(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRuleGroupsResponse

        input = Types::ListRuleGroupsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_rule_groups(input)
      end

      def list_rule_groups(input : Types::ListRuleGroupsRequest) : Types::ListRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleGroupsResponse, "ListRuleGroups")
      end

      # Retrieves the TagInfoForResource for the specified resource. Tags are key:value pairs that you can
      # use to categorize and manage your resources, for purposes like billing. For example, you might set
      # the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags
      # to add to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon
      # Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex
      # pattern sets. You can't manage or view tags through the WAF console.

      def list_tags_for_resource(
        resource_arn : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, limit: limit, next_marker: next_marker)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Retrieves an array of WebACLSummary objects for the web ACLs that you manage.

      def list_web_ac_ls(
        scope : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListWebACLsResponse

        input = Types::ListWebACLsRequest.new(scope: scope, limit: limit, next_marker: next_marker)
        list_web_ac_ls(input)
      end

      def list_web_ac_ls(input : Types::ListWebACLsRequest) : Types::ListWebACLsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WEB_AC_LS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWebACLsResponse, "ListWebACLs")
      end

      # Enables the specified LoggingConfiguration , to start logging from a web ACL, according to the
      # configuration provided. If you configure data protection for the web ACL, the protection applies to
      # the data that WAF sends to the logs. This operation completely replaces any mutable specifications
      # that you already have for a logging configuration with the ones that you provide to this call. To
      # modify an existing logging configuration, do the following: Retrieve it by calling
      # GetLoggingConfiguration Update its settings as needed Provide the complete logging configuration
      # specification to this call You can define one logging destination per web ACL. You can access
      # information about the traffic that WAF inspects using the following steps: Create your logging
      # destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service
      # (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. The name that you give the destination must
      # start with aws-waf-logs- . Depending on the type of destination, you might need to configure
      # additional settings or permissions. For configuration requirements and pricing information for each
      # destination type, see Logging web ACL traffic in the WAF Developer Guide . Associate your logging
      # destination to your web ACL using a PutLoggingConfiguration request. When you successfully enable
      # logging using a PutLoggingConfiguration request, WAF creates an additional role or policy that is
      # required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF
      # creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy.
      # For an Amazon Kinesis Data Firehose, WAF creates a service-linked role. For additional information
      # about web ACL logging, see Logging web ACL traffic information in the WAF Developer Guide .

      def put_logging_configuration(
        logging_configuration : Types::LoggingConfiguration
      ) : Types::PutLoggingConfigurationResponse

        input = Types::PutLoggingConfigurationRequest.new(logging_configuration: logging_configuration)
        put_logging_configuration(input)
      end

      def put_logging_configuration(input : Types::PutLoggingConfigurationRequest) : Types::PutLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLoggingConfigurationResponse, "PutLoggingConfiguration")
      end

      # Defines the versions of your managed rule set that you are offering to the customers. Customers see
      # your offerings as managed rule groups with versioning. This is intended for use only by vendors of
      # managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
      # Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned
      # managed rule group offerings for your customers. The APIs are ListManagedRuleSets ,
      # GetManagedRuleSet , PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .
      # Customers retrieve their managed rule group list by calling ListAvailableManagedRuleGroups . The
      # name that you provide here for your managed rule set is the name the customer sees for the
      # corresponding managed rule group. Customers can retrieve the available versions for a managed rule
      # group by calling ListAvailableManagedRuleGroupVersions . You provide a rule group specification for
      # each version. For each managed rule set, you must specify a version that you recommend using. To
      # initiate the expiration of a managed rule group version, use UpdateManagedRuleSetVersionExpiryDate .

      def put_managed_rule_set_versions(
        id : String,
        lock_token : String,
        name : String,
        scope : String,
        recommended_version : String? = nil,
        versions_to_publish : Hash(String, Types::VersionToPublish)? = nil
      ) : Types::PutManagedRuleSetVersionsResponse

        input = Types::PutManagedRuleSetVersionsRequest.new(id: id, lock_token: lock_token, name: name, scope: scope, recommended_version: recommended_version, versions_to_publish: versions_to_publish)
        put_managed_rule_set_versions(input)
      end

      def put_managed_rule_set_versions(input : Types::PutManagedRuleSetVersionsRequest) : Types::PutManagedRuleSetVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_MANAGED_RULE_SET_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutManagedRuleSetVersionsResponse, "PutManagedRuleSetVersions")
      end

      # Use this to share a rule group with other accounts. This action attaches an IAM policy to the
      # specified resource. You must be the owner of the rule group to perform this operation. This action
      # is subject to the following restrictions: You can attach only one policy with each
      # PutPermissionPolicy request. The ARN in the request must be a valid WAF RuleGroup ARN and the rule
      # group must exist in the same Region. The user making the request must be the owner of the rule
      # group. If a rule group has been shared with your account, you can access it through the call
      # GetRuleGroup , and you can reference it in CreateWebACL and UpdateWebACL . Rule groups that are
      # shared with you don't appear in your WAF console rule groups listing.

      def put_permission_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutPermissionPolicyResponse

        input = Types::PutPermissionPolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_permission_policy(input)
      end

      def put_permission_policy(input : Types::PutPermissionPolicyRequest) : Types::PutPermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPermissionPolicyResponse, "PutPermissionPolicy")
      end

      # Associates tags with the specified Amazon Web Services resource. Tags are key:value pairs that you
      # can use to categorize and manage your resources, for purposes like billing. For example, you might
      # set the tag key to "customer" and the value to the customer name or ID. You can specify one or more
      # tags to add to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the
      # Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex
      # pattern sets. You can't manage or view tags through the WAF console.

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

      # Disassociates tags from an Amazon Web Services resource. Tags are key:value pairs that you can
      # associate with Amazon Web Services resources. For example, the tag key might be "customer" and the
      # tag value might be "companyA." You can specify one or more tags to add to each container. You can
      # add up to 50 tags to each Amazon Web Services resource.

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

      # Updates the specified IPSet . This operation completely replaces the mutable specifications that you
      # already have for the IP set with the ones that you provide to this call. To modify an IP set, do the
      # following: Retrieve it by calling GetIPSet Update its settings as needed Provide the complete IP set
      # specification to this call Temporary inconsistencies during updates When you create or change a web
      # ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where
      # the resources are stored. The propagation time can be from a few seconds to a number of minutes. The
      # following are examples of the temporary inconsistencies that you might notice during change
      # propagation: After you create a web ACL, if you try to associate it with a resource, you might get
      # an exception indicating that the web ACL is unavailable. After you add a rule group to a web ACL,
      # the new rule group rules might be in effect in one area where the web ACL is used and not in
      # another. After you change a rule action setting, you might see the old action in some places and the
      # new action in others. After you add an IP address to an IP set that is in use in a blocking rule,
      # the new address might be blocked in one area while still allowed in another.

      def update_ip_set(
        addresses : Array(String),
        id : String,
        lock_token : String,
        name : String,
        scope : String,
        description : String? = nil
      ) : Types::UpdateIPSetResponse

        input = Types::UpdateIPSetRequest.new(addresses: addresses, id: id, lock_token: lock_token, name: name, scope: scope, description: description)
        update_ip_set(input)
      end

      def update_ip_set(input : Types::UpdateIPSetRequest) : Types::UpdateIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIPSetResponse, "UpdateIPSet")
      end

      # Updates the expiration information for your managed rule set. Use this to initiate the expiration of
      # a managed rule group version. After you initiate expiration for a version, WAF excludes it from the
      # response to ListAvailableManagedRuleGroupVersions for the managed rule group. This is intended for
      # use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services
      # Marketplace sellers. Vendors, you can use the managed rule set APIs to provide controlled rollout of
      # your versioned managed rule group offerings for your customers. The APIs are ListManagedRuleSets ,
      # GetManagedRuleSet , PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      def update_managed_rule_set_version_expiry_date(
        expiry_timestamp : Time,
        id : String,
        lock_token : String,
        name : String,
        scope : String,
        version_to_expire : String
      ) : Types::UpdateManagedRuleSetVersionExpiryDateResponse

        input = Types::UpdateManagedRuleSetVersionExpiryDateRequest.new(expiry_timestamp: expiry_timestamp, id: id, lock_token: lock_token, name: name, scope: scope, version_to_expire: version_to_expire)
        update_managed_rule_set_version_expiry_date(input)
      end

      def update_managed_rule_set_version_expiry_date(input : Types::UpdateManagedRuleSetVersionExpiryDateRequest) : Types::UpdateManagedRuleSetVersionExpiryDateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MANAGED_RULE_SET_VERSION_EXPIRY_DATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateManagedRuleSetVersionExpiryDateResponse, "UpdateManagedRuleSetVersionExpiryDate")
      end

      # Updates the specified RegexPatternSet . This operation completely replaces the mutable
      # specifications that you already have for the regex pattern set with the ones that you provide to
      # this call. To modify a regex pattern set, do the following: Retrieve it by calling
      # GetRegexPatternSet Update its settings as needed Provide the complete regex pattern set
      # specification to this call Temporary inconsistencies during updates When you create or change a web
      # ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where
      # the resources are stored. The propagation time can be from a few seconds to a number of minutes. The
      # following are examples of the temporary inconsistencies that you might notice during change
      # propagation: After you create a web ACL, if you try to associate it with a resource, you might get
      # an exception indicating that the web ACL is unavailable. After you add a rule group to a web ACL,
      # the new rule group rules might be in effect in one area where the web ACL is used and not in
      # another. After you change a rule action setting, you might see the old action in some places and the
      # new action in others. After you add an IP address to an IP set that is in use in a blocking rule,
      # the new address might be blocked in one area while still allowed in another.

      def update_regex_pattern_set(
        id : String,
        lock_token : String,
        name : String,
        regular_expression_list : Array(Types::Regex),
        scope : String,
        description : String? = nil
      ) : Types::UpdateRegexPatternSetResponse

        input = Types::UpdateRegexPatternSetRequest.new(id: id, lock_token: lock_token, name: name, regular_expression_list: regular_expression_list, scope: scope, description: description)
        update_regex_pattern_set(input)
      end

      def update_regex_pattern_set(input : Types::UpdateRegexPatternSetRequest) : Types::UpdateRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRegexPatternSetResponse, "UpdateRegexPatternSet")
      end

      # Updates the specified RuleGroup . This operation completely replaces the mutable specifications that
      # you already have for the rule group with the ones that you provide to this call. To modify a rule
      # group, do the following: Retrieve it by calling GetRuleGroup Update its settings as needed Provide
      # the complete rule group specification to this call A rule group defines a collection of rules to
      # inspect and control web requests that you can use in a WebACL . When you create a rule group, you
      # define an immutable capacity limit. If you update a rule group, you must stay within the capacity.
      # This allows others to reuse the rule group with confidence in its capacity requirements. Temporary
      # inconsistencies during updates When you create or change a web ACL or other WAF resources, the
      # changes take a small amount of time to propagate to all areas where the resources are stored. The
      # propagation time can be from a few seconds to a number of minutes. The following are examples of the
      # temporary inconsistencies that you might notice during change propagation: After you create a web
      # ACL, if you try to associate it with a resource, you might get an exception indicating that the web
      # ACL is unavailable. After you add a rule group to a web ACL, the new rule group rules might be in
      # effect in one area where the web ACL is used and not in another. After you change a rule action
      # setting, you might see the old action in some places and the new action in others. After you add an
      # IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one
      # area while still allowed in another.

      def update_rule_group(
        id : String,
        lock_token : String,
        name : String,
        scope : String,
        visibility_config : Types::VisibilityConfig,
        custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
        description : String? = nil,
        rules : Array(Types::Rule)? = nil
      ) : Types::UpdateRuleGroupResponse

        input = Types::UpdateRuleGroupRequest.new(id: id, lock_token: lock_token, name: name, scope: scope, visibility_config: visibility_config, custom_response_bodies: custom_response_bodies, description: description, rules: rules)
        update_rule_group(input)
      end

      def update_rule_group(input : Types::UpdateRuleGroupRequest) : Types::UpdateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleGroupResponse, "UpdateRuleGroup")
      end

      # Updates the specified WebACL . While updating a web ACL, WAF provides continuous coverage to the
      # resources that you have associated with the web ACL. This operation completely replaces the mutable
      # specifications that you already have for the web ACL with the ones that you provide to this call. To
      # modify a web ACL, do the following: Retrieve it by calling GetWebACL Update its settings as needed
      # Provide the complete web ACL specification to this call A web ACL defines a collection of rules to
      # use to inspect and control web requests. Each rule has a statement that defines what to look for in
      # web requests and an action that WAF applies to requests that match the statement. In the web ACL,
      # you assign a default action to take (allow, block) for any request that does not match any of the
      # rules. The rules in a web ACL can be a combination of the types Rule , RuleGroup , and managed rule
      # group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The
      # resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load
      # Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application,
      # and Amazon Web Services Verified Access instance. Temporary inconsistencies during updates When you
      # create or change a web ACL or other WAF resources, the changes take a small amount of time to
      # propagate to all areas where the resources are stored. The propagation time can be from a few
      # seconds to a number of minutes. The following are examples of the temporary inconsistencies that you
      # might notice during change propagation: After you create a web ACL, if you try to associate it with
      # a resource, you might get an exception indicating that the web ACL is unavailable. After you add a
      # rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL
      # is used and not in another. After you change a rule action setting, you might see the old action in
      # some places and the new action in others. After you add an IP address to an IP set that is in use in
      # a blocking rule, the new address might be blocked in one area while still allowed in another.

      def update_web_acl(
        default_action : Types::DefaultAction,
        id : String,
        lock_token : String,
        name : String,
        scope : String,
        visibility_config : Types::VisibilityConfig,
        application_config : Types::ApplicationConfig? = nil,
        association_config : Types::AssociationConfig? = nil,
        captcha_config : Types::CaptchaConfig? = nil,
        challenge_config : Types::ChallengeConfig? = nil,
        custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
        data_protection_config : Types::DataProtectionConfig? = nil,
        description : String? = nil,
        on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig? = nil,
        rules : Array(Types::Rule)? = nil,
        token_domains : Array(String)? = nil
      ) : Types::UpdateWebACLResponse

        input = Types::UpdateWebACLRequest.new(default_action: default_action, id: id, lock_token: lock_token, name: name, scope: scope, visibility_config: visibility_config, application_config: application_config, association_config: association_config, captcha_config: captcha_config, challenge_config: challenge_config, custom_response_bodies: custom_response_bodies, data_protection_config: data_protection_config, description: description, on_source_d_do_s_protection_config: on_source_d_do_s_protection_config, rules: rules, token_domains: token_domains)
        update_web_acl(input)
      end

      def update_web_acl(input : Types::UpdateWebACLRequest) : Types::UpdateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWebACLResponse, "UpdateWebACL")
      end
    end
  end
end
