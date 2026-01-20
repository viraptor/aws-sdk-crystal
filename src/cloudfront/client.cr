module Aws
  module CloudFront
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

      # The AssociateAlias API operation only supports standard distributions. To move domains between
      # distribution tenants and/or standard distributions, we recommend that you use the
      # UpdateDomainAssociation API operation instead. Associates an alias with a CloudFront standard
      # distribution. An alias is commonly known as a custom domain or vanity domain. It can also be called
      # a CNAME or alternate domain name. With this operation, you can move an alias that's already used for
      # a standard distribution to a different standard distribution. This prevents the downtime that could
      # occur if you first remove the alias from one standard distribution and then separately add the alias
      # to another standard distribution. To use this operation, specify the alias and the ID of the target
      # standard distribution. For more information, including how to set up the target standard
      # distribution, prerequisites that you must complete, and other restrictions, see Moving an alternate
      # domain name to a different standard distribution or distribution tenant in the Amazon CloudFront
      # Developer Guide .

      def associate_alias(
        alias_ : String,
        target_distribution_id : String
      ) : Nil

        input = Types::AssociateAliasRequest.new(alias_: alias_, target_distribution_id: target_distribution_id)
        associate_alias(input)
      end

      def associate_alias(input : Types::AssociateAliasRequest) : Nil
        request = Protocol::RestXml.build_request(Model::ASSOCIATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Associates the WAF web ACL with a distribution tenant.

      def associate_distribution_tenant_web_acl(
        id : String,
        web_acl_arn : String,
        if_match : String? = nil
      ) : Types::AssociateDistributionTenantWebACLResult

        input = Types::AssociateDistributionTenantWebACLRequest.new(id: id, web_acl_arn: web_acl_arn, if_match: if_match)
        associate_distribution_tenant_web_acl(input)
      end

      def associate_distribution_tenant_web_acl(input : Types::AssociateDistributionTenantWebACLRequest) : Types::AssociateDistributionTenantWebACLResult
        request = Protocol::RestXml.build_request(Model::ASSOCIATE_DISTRIBUTION_TENANT_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::AssociateDistributionTenantWebACLResult, "AssociateDistributionTenantWebACL")
      end

      # Associates the WAF web ACL with a distribution.

      def associate_distribution_web_acl(
        id : String,
        web_acl_arn : String,
        if_match : String? = nil
      ) : Types::AssociateDistributionWebACLResult

        input = Types::AssociateDistributionWebACLRequest.new(id: id, web_acl_arn: web_acl_arn, if_match: if_match)
        associate_distribution_web_acl(input)
      end

      def associate_distribution_web_acl(input : Types::AssociateDistributionWebACLRequest) : Types::AssociateDistributionWebACLResult
        request = Protocol::RestXml.build_request(Model::ASSOCIATE_DISTRIBUTION_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::AssociateDistributionWebACLResult, "AssociateDistributionWebACL")
      end

      # Creates a staging distribution using the configuration of the provided primary distribution. A
      # staging distribution is a copy of an existing distribution (called the primary distribution) that
      # you can use in a continuous deployment workflow. After you create a staging distribution, you can
      # use UpdateDistribution to modify the staging distribution's configuration. Then you can use
      # CreateContinuousDeploymentPolicy to incrementally move traffic to the staging distribution. This API
      # operation requires the following IAM permissions: GetDistribution CreateDistribution
      # CopyDistribution

      def copy_distribution(
        caller_reference : String,
        primary_distribution_id : String,
        enabled : Bool? = nil,
        if_match : String? = nil,
        staging : Bool? = nil
      ) : Types::CopyDistributionResult

        input = Types::CopyDistributionRequest.new(caller_reference: caller_reference, primary_distribution_id: primary_distribution_id, enabled: enabled, if_match: if_match, staging: staging)
        copy_distribution(input)
      end

      def copy_distribution(input : Types::CopyDistributionRequest) : Types::CopyDistributionResult
        request = Protocol::RestXml.build_request(Model::COPY_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CopyDistributionResult, "CopyDistribution")
      end

      # Creates an Anycast static IP list.

      def create_anycast_ip_list(
        ip_count : Int32,
        name : String,
        ip_address_type : String? = nil,
        ipam_cidr_configs : Array(Types::IpamCidrConfig)? = nil,
        tags : Types::Tags? = nil
      ) : Types::CreateAnycastIpListResult

        input = Types::CreateAnycastIpListRequest.new(ip_count: ip_count, name: name, ip_address_type: ip_address_type, ipam_cidr_configs: ipam_cidr_configs, tags: tags)
        create_anycast_ip_list(input)
      end

      def create_anycast_ip_list(input : Types::CreateAnycastIpListRequest) : Types::CreateAnycastIpListResult
        request = Protocol::RestXml.build_request(Model::CREATE_ANYCAST_IP_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateAnycastIpListResult, "CreateAnycastIpList")
      end

      # Creates a cache policy. After you create a cache policy, you can attach it to one or more cache
      # behaviors. When it's attached to a cache behavior, the cache policy determines the following: The
      # values that CloudFront includes in the cache key . These values can include HTTP headers, cookies,
      # and URL query strings. CloudFront uses the cache key to find an object in its cache that it can
      # return to the viewer. The default, minimum, and maximum time to live (TTL) values that you want
      # objects to stay in the CloudFront cache. If your minimum TTL is greater than 0, CloudFront will
      # cache content for at least the duration specified in the cache policy's minimum TTL, even if the
      # Cache-Control: no-cache , no-store , or private directives are present in the origin headers. The
      # headers, cookies, and query strings that are included in the cache key are also included in requests
      # that CloudFront sends to the origin. CloudFront sends a request when it can't find an object in its
      # cache that matches the request's cache key. If you want to send values to the origin but not include
      # them in the cache key, use OriginRequestPolicy . For more information about cache policies, see
      # Controlling the cache key in the Amazon CloudFront Developer Guide .

      def create_cache_policy(
        cache_policy_config : Types::CachePolicyConfig
      ) : Types::CreateCachePolicyResult

        input = Types::CreateCachePolicyRequest.new(cache_policy_config: cache_policy_config)
        create_cache_policy(input)
      end

      def create_cache_policy(input : Types::CreateCachePolicyRequest) : Types::CreateCachePolicyResult
        request = Protocol::RestXml.build_request(Model::CREATE_CACHE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateCachePolicyResult, "CreateCachePolicy")
      end

      # Creates a new origin access identity. If you're using Amazon S3 for your origin, you can use an
      # origin access identity to require users to access your content using a CloudFront URL instead of the
      # Amazon S3 URL. For more information about how to use origin access identities, see Serving Private
      # Content through CloudFront in the Amazon CloudFront Developer Guide .

      def create_cloud_front_origin_access_identity(
        cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig
      ) : Types::CreateCloudFrontOriginAccessIdentityResult

        input = Types::CreateCloudFrontOriginAccessIdentityRequest.new(cloud_front_origin_access_identity_config: cloud_front_origin_access_identity_config)
        create_cloud_front_origin_access_identity(input)
      end

      def create_cloud_front_origin_access_identity(input : Types::CreateCloudFrontOriginAccessIdentityRequest) : Types::CreateCloudFrontOriginAccessIdentityResult
        request = Protocol::RestXml.build_request(Model::CREATE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateCloudFrontOriginAccessIdentityResult, "CreateCloudFrontOriginAccessIdentity")
      end

      # Creates a connection function.

      def create_connection_function(
        connection_function_code : Bytes,
        connection_function_config : Types::FunctionConfig,
        name : String,
        tags : Types::Tags? = nil
      ) : Types::CreateConnectionFunctionResult

        input = Types::CreateConnectionFunctionRequest.new(connection_function_code: connection_function_code, connection_function_config: connection_function_config, name: name, tags: tags)
        create_connection_function(input)
      end

      def create_connection_function(input : Types::CreateConnectionFunctionRequest) : Types::CreateConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::CREATE_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateConnectionFunctionResult, "CreateConnectionFunction")
      end

      # Creates a connection group.

      def create_connection_group(
        name : String,
        anycast_ip_list_id : String? = nil,
        enabled : Bool? = nil,
        ipv6_enabled : Bool? = nil,
        tags : Types::Tags? = nil
      ) : Types::CreateConnectionGroupResult

        input = Types::CreateConnectionGroupRequest.new(name: name, anycast_ip_list_id: anycast_ip_list_id, enabled: enabled, ipv6_enabled: ipv6_enabled, tags: tags)
        create_connection_group(input)
      end

      def create_connection_group(input : Types::CreateConnectionGroupRequest) : Types::CreateConnectionGroupResult
        request = Protocol::RestXml.build_request(Model::CREATE_CONNECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateConnectionGroupResult, "CreateConnectionGroup")
      end

      # Creates a continuous deployment policy that distributes traffic for a custom domain name to two
      # different CloudFront distributions. To use a continuous deployment policy, first use
      # CopyDistribution to create a staging distribution, then use UpdateDistribution to modify the staging
      # distribution's configuration. After you create and update a staging distribution, you can use a
      # continuous deployment policy to incrementally move traffic to the staging distribution. This
      # workflow enables you to test changes to a distribution's configuration before moving all of your
      # domain's production traffic to the new configuration.

      def create_continuous_deployment_policy(
        continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig
      ) : Types::CreateContinuousDeploymentPolicyResult

        input = Types::CreateContinuousDeploymentPolicyRequest.new(continuous_deployment_policy_config: continuous_deployment_policy_config)
        create_continuous_deployment_policy(input)
      end

      def create_continuous_deployment_policy(input : Types::CreateContinuousDeploymentPolicyRequest) : Types::CreateContinuousDeploymentPolicyResult
        request = Protocol::RestXml.build_request(Model::CREATE_CONTINUOUS_DEPLOYMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateContinuousDeploymentPolicyResult, "CreateContinuousDeploymentPolicy")
      end

      # Creates a CloudFront distribution.

      def create_distribution(
        distribution_config : Types::DistributionConfig
      ) : Types::CreateDistributionResult

        input = Types::CreateDistributionRequest.new(distribution_config: distribution_config)
        create_distribution(input)
      end

      def create_distribution(input : Types::CreateDistributionRequest) : Types::CreateDistributionResult
        request = Protocol::RestXml.build_request(Model::CREATE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateDistributionResult, "CreateDistribution")
      end

      # Creates a distribution tenant.

      def create_distribution_tenant(
        distribution_id : String,
        domains : Array(Types::DomainItem),
        name : String,
        connection_group_id : String? = nil,
        customizations : Types::Customizations? = nil,
        enabled : Bool? = nil,
        managed_certificate_request : Types::ManagedCertificateRequest? = nil,
        parameters : Array(Types::Parameter)? = nil,
        tags : Types::Tags? = nil
      ) : Types::CreateDistributionTenantResult

        input = Types::CreateDistributionTenantRequest.new(distribution_id: distribution_id, domains: domains, name: name, connection_group_id: connection_group_id, customizations: customizations, enabled: enabled, managed_certificate_request: managed_certificate_request, parameters: parameters, tags: tags)
        create_distribution_tenant(input)
      end

      def create_distribution_tenant(input : Types::CreateDistributionTenantRequest) : Types::CreateDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::CREATE_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateDistributionTenantResult, "CreateDistributionTenant")
      end

      # Create a new distribution with tags. This API operation requires the following IAM permissions:
      # CreateDistribution TagResource

      def create_distribution_with_tags(
        distribution_config_with_tags : Types::DistributionConfigWithTags
      ) : Types::CreateDistributionWithTagsResult

        input = Types::CreateDistributionWithTagsRequest.new(distribution_config_with_tags: distribution_config_with_tags)
        create_distribution_with_tags(input)
      end

      def create_distribution_with_tags(input : Types::CreateDistributionWithTagsRequest) : Types::CreateDistributionWithTagsResult
        request = Protocol::RestXml.build_request(Model::CREATE_DISTRIBUTION_WITH_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateDistributionWithTagsResult, "CreateDistributionWithTags")
      end

      # Create a new field-level encryption configuration.

      def create_field_level_encryption_config(
        field_level_encryption_config : Types::FieldLevelEncryptionConfig
      ) : Types::CreateFieldLevelEncryptionConfigResult

        input = Types::CreateFieldLevelEncryptionConfigRequest.new(field_level_encryption_config: field_level_encryption_config)
        create_field_level_encryption_config(input)
      end

      def create_field_level_encryption_config(input : Types::CreateFieldLevelEncryptionConfigRequest) : Types::CreateFieldLevelEncryptionConfigResult
        request = Protocol::RestXml.build_request(Model::CREATE_FIELD_LEVEL_ENCRYPTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateFieldLevelEncryptionConfigResult, "CreateFieldLevelEncryptionConfig")
      end

      # Create a field-level encryption profile.

      def create_field_level_encryption_profile(
        field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig
      ) : Types::CreateFieldLevelEncryptionProfileResult

        input = Types::CreateFieldLevelEncryptionProfileRequest.new(field_level_encryption_profile_config: field_level_encryption_profile_config)
        create_field_level_encryption_profile(input)
      end

      def create_field_level_encryption_profile(input : Types::CreateFieldLevelEncryptionProfileRequest) : Types::CreateFieldLevelEncryptionProfileResult
        request = Protocol::RestXml.build_request(Model::CREATE_FIELD_LEVEL_ENCRYPTION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateFieldLevelEncryptionProfileResult, "CreateFieldLevelEncryptionProfile")
      end

      # Creates a CloudFront function. To create a function, you provide the function code and some
      # configuration information about the function. The response contains an Amazon Resource Name (ARN)
      # that uniquely identifies the function. When you create a function, it's in the DEVELOPMENT stage. In
      # this stage, you can test the function with TestFunction , and update it with UpdateFunction . When
      # you're ready to use your function with a CloudFront distribution, use PublishFunction to copy the
      # function from the DEVELOPMENT stage to LIVE . When it's live, you can attach the function to a
      # distribution's cache behavior, using the function's ARN.

      def create_function(
        function_code : Bytes,
        function_config : Types::FunctionConfig,
        name : String
      ) : Types::CreateFunctionResult

        input = Types::CreateFunctionRequest.new(function_code: function_code, function_config: function_config, name: name)
        create_function(input)
      end

      def create_function(input : Types::CreateFunctionRequest) : Types::CreateFunctionResult
        request = Protocol::RestXml.build_request(Model::CREATE_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateFunctionResult, "CreateFunction")
      end

      # Create a new invalidation. For more information, see Invalidating files in the Amazon CloudFront
      # Developer Guide .

      def create_invalidation(
        distribution_id : String,
        invalidation_batch : Types::InvalidationBatch
      ) : Types::CreateInvalidationResult

        input = Types::CreateInvalidationRequest.new(distribution_id: distribution_id, invalidation_batch: invalidation_batch)
        create_invalidation(input)
      end

      def create_invalidation(input : Types::CreateInvalidationRequest) : Types::CreateInvalidationResult
        request = Protocol::RestXml.build_request(Model::CREATE_INVALIDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateInvalidationResult, "CreateInvalidation")
      end

      # Creates an invalidation for a distribution tenant. For more information, see Invalidating files in
      # the Amazon CloudFront Developer Guide .

      def create_invalidation_for_distribution_tenant(
        id : String,
        invalidation_batch : Types::InvalidationBatch
      ) : Types::CreateInvalidationForDistributionTenantResult

        input = Types::CreateInvalidationForDistributionTenantRequest.new(id: id, invalidation_batch: invalidation_batch)
        create_invalidation_for_distribution_tenant(input)
      end

      def create_invalidation_for_distribution_tenant(input : Types::CreateInvalidationForDistributionTenantRequest) : Types::CreateInvalidationForDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::CREATE_INVALIDATION_FOR_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateInvalidationForDistributionTenantResult, "CreateInvalidationForDistributionTenant")
      end

      # Creates a key group that you can use with CloudFront signed URLs and signed cookies . To create a
      # key group, you must specify at least one public key for the key group. After you create a key group,
      # you can reference it from one or more cache behaviors. When you reference a key group in a cache
      # behavior, CloudFront requires signed URLs or signed cookies for all requests that match the cache
      # behavior. The URLs or cookies must be signed with a private key whose corresponding public key is in
      # the key group. The signed URL or cookie contains information about which public key CloudFront
      # should use to verify the signature. For more information, see Serving private content in the Amazon
      # CloudFront Developer Guide .

      def create_key_group(
        key_group_config : Types::KeyGroupConfig
      ) : Types::CreateKeyGroupResult

        input = Types::CreateKeyGroupRequest.new(key_group_config: key_group_config)
        create_key_group(input)
      end

      def create_key_group(input : Types::CreateKeyGroupRequest) : Types::CreateKeyGroupResult
        request = Protocol::RestXml.build_request(Model::CREATE_KEY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateKeyGroupResult, "CreateKeyGroup")
      end

      # Specifies the key value store resource to add to your account. In your account, the key value store
      # names must be unique. You can also import key value store data in JSON format from an S3 bucket by
      # providing a valid ImportSource that you own.

      def create_key_value_store(
        name : String,
        comment : String? = nil,
        import_source : Types::ImportSource? = nil
      ) : Types::CreateKeyValueStoreResult

        input = Types::CreateKeyValueStoreRequest.new(name: name, comment: comment, import_source: import_source)
        create_key_value_store(input)
      end

      def create_key_value_store(input : Types::CreateKeyValueStoreRequest) : Types::CreateKeyValueStoreResult
        request = Protocol::RestXml.build_request(Model::CREATE_KEY_VALUE_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateKeyValueStoreResult, "CreateKeyValueStore")
      end

      # Enables or disables additional Amazon CloudWatch metrics for the specified CloudFront distribution.
      # The additional metrics incur an additional cost. For more information, see Viewing additional
      # CloudFront distribution metrics in the Amazon CloudFront Developer Guide .

      def create_monitoring_subscription(
        distribution_id : String,
        monitoring_subscription : Types::MonitoringSubscription
      ) : Types::CreateMonitoringSubscriptionResult

        input = Types::CreateMonitoringSubscriptionRequest.new(distribution_id: distribution_id, monitoring_subscription: monitoring_subscription)
        create_monitoring_subscription(input)
      end

      def create_monitoring_subscription(input : Types::CreateMonitoringSubscriptionRequest) : Types::CreateMonitoringSubscriptionResult
        request = Protocol::RestXml.build_request(Model::CREATE_MONITORING_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateMonitoringSubscriptionResult, "CreateMonitoringSubscription")
      end

      # Creates a new origin access control in CloudFront. After you create an origin access control, you
      # can add it to an origin in a CloudFront distribution so that CloudFront sends authenticated (signed)
      # requests to the origin. This makes it possible to block public access to the origin, allowing
      # viewers (users) to access the origin's content only through CloudFront. For more information about
      # using a CloudFront origin access control, see Restricting access to an Amazon Web Services origin in
      # the Amazon CloudFront Developer Guide .

      def create_origin_access_control(
        origin_access_control_config : Types::OriginAccessControlConfig
      ) : Types::CreateOriginAccessControlResult

        input = Types::CreateOriginAccessControlRequest.new(origin_access_control_config: origin_access_control_config)
        create_origin_access_control(input)
      end

      def create_origin_access_control(input : Types::CreateOriginAccessControlRequest) : Types::CreateOriginAccessControlResult
        request = Protocol::RestXml.build_request(Model::CREATE_ORIGIN_ACCESS_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateOriginAccessControlResult, "CreateOriginAccessControl")
      end

      # Creates an origin request policy. After you create an origin request policy, you can attach it to
      # one or more cache behaviors. When it's attached to a cache behavior, the origin request policy
      # determines the values that CloudFront includes in requests that it sends to the origin. Each request
      # that CloudFront sends to the origin includes the following: The request body and the URL path
      # (without the domain name) from the viewer request. The headers that CloudFront automatically
      # includes in every origin request, including Host , User-Agent , and X-Amz-Cf-Id . All HTTP headers,
      # cookies, and URL query strings that are specified in the cache policy or the origin request policy.
      # These can include items from the viewer request and, in the case of headers, additional ones that
      # are added by CloudFront. CloudFront sends a request when it can't find a valid object in its cache
      # that matches the request. If you want to send values to the origin and also include them in the
      # cache key, use CachePolicy . For more information about origin request policies, see Controlling
      # origin requests in the Amazon CloudFront Developer Guide .

      def create_origin_request_policy(
        origin_request_policy_config : Types::OriginRequestPolicyConfig
      ) : Types::CreateOriginRequestPolicyResult

        input = Types::CreateOriginRequestPolicyRequest.new(origin_request_policy_config: origin_request_policy_config)
        create_origin_request_policy(input)
      end

      def create_origin_request_policy(input : Types::CreateOriginRequestPolicyRequest) : Types::CreateOriginRequestPolicyResult
        request = Protocol::RestXml.build_request(Model::CREATE_ORIGIN_REQUEST_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateOriginRequestPolicyResult, "CreateOriginRequestPolicy")
      end

      # Uploads a public key to CloudFront that you can use with signed URLs and signed cookies , or with
      # field-level encryption .

      def create_public_key(
        public_key_config : Types::PublicKeyConfig
      ) : Types::CreatePublicKeyResult

        input = Types::CreatePublicKeyRequest.new(public_key_config: public_key_config)
        create_public_key(input)
      end

      def create_public_key(input : Types::CreatePublicKeyRequest) : Types::CreatePublicKeyResult
        request = Protocol::RestXml.build_request(Model::CREATE_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreatePublicKeyResult, "CreatePublicKey")
      end

      # Creates a real-time log configuration. After you create a real-time log configuration, you can
      # attach it to one or more cache behaviors to send real-time log data to the specified Amazon Kinesis
      # data stream. For more information about real-time log configurations, see Real-time logs in the
      # Amazon CloudFront Developer Guide .

      def create_realtime_log_config(
        end_points : Array(Types::EndPoint),
        fields : Array(String),
        name : String,
        sampling_rate : Int64
      ) : Types::CreateRealtimeLogConfigResult

        input = Types::CreateRealtimeLogConfigRequest.new(end_points: end_points, fields: fields, name: name, sampling_rate: sampling_rate)
        create_realtime_log_config(input)
      end

      def create_realtime_log_config(input : Types::CreateRealtimeLogConfigRequest) : Types::CreateRealtimeLogConfigResult
        request = Protocol::RestXml.build_request(Model::CREATE_REALTIME_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateRealtimeLogConfigResult, "CreateRealtimeLogConfig")
      end

      # Creates a response headers policy. A response headers policy contains information about a set of
      # HTTP headers. To create a response headers policy, you provide some metadata about the policy and a
      # set of configurations that specify the headers. After you create a response headers policy, you can
      # use its ID to attach it to one or more cache behaviors in a CloudFront distribution. When it's
      # attached to a cache behavior, the response headers policy affects the HTTP headers that CloudFront
      # includes in HTTP responses to requests that match the cache behavior. CloudFront adds or removes
      # response headers according to the configuration of the response headers policy. For more
      # information, see Adding or removing HTTP headers in CloudFront responses in the Amazon CloudFront
      # Developer Guide .

      def create_response_headers_policy(
        response_headers_policy_config : Types::ResponseHeadersPolicyConfig
      ) : Types::CreateResponseHeadersPolicyResult

        input = Types::CreateResponseHeadersPolicyRequest.new(response_headers_policy_config: response_headers_policy_config)
        create_response_headers_policy(input)
      end

      def create_response_headers_policy(input : Types::CreateResponseHeadersPolicyRequest) : Types::CreateResponseHeadersPolicyResult
        request = Protocol::RestXml.build_request(Model::CREATE_RESPONSE_HEADERS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateResponseHeadersPolicyResult, "CreateResponseHeadersPolicy")
      end

      # This API is deprecated. Amazon CloudFront is deprecating real-time messaging protocol (RTMP)
      # distributions on December 31, 2020. For more information, read the announcement on the Amazon
      # CloudFront discussion forum.

      def create_streaming_distribution(
        streaming_distribution_config : Types::StreamingDistributionConfig
      ) : Types::CreateStreamingDistributionResult

        input = Types::CreateStreamingDistributionRequest.new(streaming_distribution_config: streaming_distribution_config)
        create_streaming_distribution(input)
      end

      def create_streaming_distribution(input : Types::CreateStreamingDistributionRequest) : Types::CreateStreamingDistributionResult
        request = Protocol::RestXml.build_request(Model::CREATE_STREAMING_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateStreamingDistributionResult, "CreateStreamingDistribution")
      end

      # This API is deprecated. Amazon CloudFront is deprecating real-time messaging protocol (RTMP)
      # distributions on December 31, 2020. For more information, read the announcement on the Amazon
      # CloudFront discussion forum.

      def create_streaming_distribution_with_tags(
        streaming_distribution_config_with_tags : Types::StreamingDistributionConfigWithTags
      ) : Types::CreateStreamingDistributionWithTagsResult

        input = Types::CreateStreamingDistributionWithTagsRequest.new(streaming_distribution_config_with_tags: streaming_distribution_config_with_tags)
        create_streaming_distribution_with_tags(input)
      end

      def create_streaming_distribution_with_tags(input : Types::CreateStreamingDistributionWithTagsRequest) : Types::CreateStreamingDistributionWithTagsResult
        request = Protocol::RestXml.build_request(Model::CREATE_STREAMING_DISTRIBUTION_WITH_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateStreamingDistributionWithTagsResult, "CreateStreamingDistributionWithTags")
      end

      # Creates a trust store.

      def create_trust_store(
        ca_certificates_bundle_source : Types::CaCertificatesBundleSource,
        name : String,
        tags : Types::Tags? = nil
      ) : Types::CreateTrustStoreResult

        input = Types::CreateTrustStoreRequest.new(ca_certificates_bundle_source: ca_certificates_bundle_source, name: name, tags: tags)
        create_trust_store(input)
      end

      def create_trust_store(input : Types::CreateTrustStoreRequest) : Types::CreateTrustStoreResult
        request = Protocol::RestXml.build_request(Model::CREATE_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateTrustStoreResult, "CreateTrustStore")
      end

      # Create an Amazon CloudFront VPC origin.

      def create_vpc_origin(
        vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig,
        tags : Types::Tags? = nil
      ) : Types::CreateVpcOriginResult

        input = Types::CreateVpcOriginRequest.new(vpc_origin_endpoint_config: vpc_origin_endpoint_config, tags: tags)
        create_vpc_origin(input)
      end

      def create_vpc_origin(input : Types::CreateVpcOriginRequest) : Types::CreateVpcOriginResult
        request = Protocol::RestXml.build_request(Model::CREATE_VPC_ORIGIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateVpcOriginResult, "CreateVpcOrigin")
      end

      # Deletes an Anycast static IP list.

      def delete_anycast_ip_list(
        id : String,
        if_match : String
      ) : Nil

        input = Types::DeleteAnycastIpListRequest.new(id: id, if_match: if_match)
        delete_anycast_ip_list(input)
      end

      def delete_anycast_ip_list(input : Types::DeleteAnycastIpListRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ANYCAST_IP_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a cache policy. You cannot delete a cache policy if it's attached to a cache behavior. First
      # update your distributions to remove the cache policy from all cache behaviors, then delete the cache
      # policy. To delete a cache policy, you must provide the policy's identifier and version. To get these
      # values, you can use ListCachePolicies or GetCachePolicy .

      def delete_cache_policy(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteCachePolicyRequest.new(id: id, if_match: if_match)
        delete_cache_policy(input)
      end

      def delete_cache_policy(input : Types::DeleteCachePolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_CACHE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Delete an origin access identity.

      def delete_cloud_front_origin_access_identity(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteCloudFrontOriginAccessIdentityRequest.new(id: id, if_match: if_match)
        delete_cloud_front_origin_access_identity(input)
      end

      def delete_cloud_front_origin_access_identity(input : Types::DeleteCloudFrontOriginAccessIdentityRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a connection function.

      def delete_connection_function(
        id : String,
        if_match : String
      ) : Nil

        input = Types::DeleteConnectionFunctionRequest.new(id: id, if_match: if_match)
        delete_connection_function(input)
      end

      def delete_connection_function(input : Types::DeleteConnectionFunctionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a connection group.

      def delete_connection_group(
        id : String,
        if_match : String
      ) : Nil

        input = Types::DeleteConnectionGroupRequest.new(id: id, if_match: if_match)
        delete_connection_group(input)
      end

      def delete_connection_group(input : Types::DeleteConnectionGroupRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_CONNECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a continuous deployment policy. You cannot delete a continuous deployment policy that's
      # attached to a primary distribution. First update your distribution to remove the continuous
      # deployment policy, then you can delete the policy.

      def delete_continuous_deployment_policy(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteContinuousDeploymentPolicyRequest.new(id: id, if_match: if_match)
        delete_continuous_deployment_policy(input)
      end

      def delete_continuous_deployment_policy(input : Types::DeleteContinuousDeploymentPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_CONTINUOUS_DEPLOYMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a distribution. Before you can delete a distribution, you must disable it, which requires
      # permission to update the distribution. Once deleted, a distribution cannot be recovered.

      def delete_distribution(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteDistributionRequest.new(id: id, if_match: if_match)
        delete_distribution(input)
      end

      def delete_distribution(input : Types::DeleteDistributionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a distribution tenant. If you use this API operation to delete a distribution tenant that is
      # currently enabled, the request will fail. To delete a distribution tenant, you must first disable
      # the distribution tenant by using the UpdateDistributionTenant API operation.

      def delete_distribution_tenant(
        id : String,
        if_match : String
      ) : Nil

        input = Types::DeleteDistributionTenantRequest.new(id: id, if_match: if_match)
        delete_distribution_tenant(input)
      end

      def delete_distribution_tenant(input : Types::DeleteDistributionTenantRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Remove a field-level encryption configuration.

      def delete_field_level_encryption_config(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteFieldLevelEncryptionConfigRequest.new(id: id, if_match: if_match)
        delete_field_level_encryption_config(input)
      end

      def delete_field_level_encryption_config(input : Types::DeleteFieldLevelEncryptionConfigRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_FIELD_LEVEL_ENCRYPTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Remove a field-level encryption profile.

      def delete_field_level_encryption_profile(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteFieldLevelEncryptionProfileRequest.new(id: id, if_match: if_match)
        delete_field_level_encryption_profile(input)
      end

      def delete_field_level_encryption_profile(input : Types::DeleteFieldLevelEncryptionProfileRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_FIELD_LEVEL_ENCRYPTION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a CloudFront function. You cannot delete a function if it's associated with a cache
      # behavior. First, update your distributions to remove the function association from all cache
      # behaviors, then delete the function. To delete a function, you must provide the function's name and
      # version ( ETag value). To get these values, you can use ListFunctions and DescribeFunction .

      def delete_function(
        if_match : String,
        name : String
      ) : Nil

        input = Types::DeleteFunctionRequest.new(if_match: if_match, name: name)
        delete_function(input)
      end

      def delete_function(input : Types::DeleteFunctionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a key group. You cannot delete a key group that is referenced in a cache behavior. First
      # update your distributions to remove the key group from all cache behaviors, then delete the key
      # group. To delete a key group, you must provide the key group's identifier and version. To get these
      # values, use ListKeyGroups followed by GetKeyGroup or GetKeyGroupConfig .

      def delete_key_group(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteKeyGroupRequest.new(id: id, if_match: if_match)
        delete_key_group(input)
      end

      def delete_key_group(input : Types::DeleteKeyGroupRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_KEY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Specifies the key value store to delete.

      def delete_key_value_store(
        if_match : String,
        name : String
      ) : Nil

        input = Types::DeleteKeyValueStoreRequest.new(if_match: if_match, name: name)
        delete_key_value_store(input)
      end

      def delete_key_value_store(input : Types::DeleteKeyValueStoreRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_KEY_VALUE_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Disables additional CloudWatch metrics for the specified CloudFront distribution.

      def delete_monitoring_subscription(
        distribution_id : String
      ) : Types::DeleteMonitoringSubscriptionResult

        input = Types::DeleteMonitoringSubscriptionRequest.new(distribution_id: distribution_id)
        delete_monitoring_subscription(input)
      end

      def delete_monitoring_subscription(input : Types::DeleteMonitoringSubscriptionRequest) : Types::DeleteMonitoringSubscriptionResult
        request = Protocol::RestXml.build_request(Model::DELETE_MONITORING_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteMonitoringSubscriptionResult, "DeleteMonitoringSubscription")
      end

      # Deletes a CloudFront origin access control. You cannot delete an origin access control if it's in
      # use. First, update all distributions to remove the origin access control from all origins, then
      # delete the origin access control.

      def delete_origin_access_control(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteOriginAccessControlRequest.new(id: id, if_match: if_match)
        delete_origin_access_control(input)
      end

      def delete_origin_access_control(input : Types::DeleteOriginAccessControlRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ORIGIN_ACCESS_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an origin request policy. You cannot delete an origin request policy if it's attached to any
      # cache behaviors. First update your distributions to remove the origin request policy from all cache
      # behaviors, then delete the origin request policy. To delete an origin request policy, you must
      # provide the policy's identifier and version. To get the identifier, you can use
      # ListOriginRequestPolicies or GetOriginRequestPolicy .

      def delete_origin_request_policy(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteOriginRequestPolicyRequest.new(id: id, if_match: if_match)
        delete_origin_request_policy(input)
      end

      def delete_origin_request_policy(input : Types::DeleteOriginRequestPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_ORIGIN_REQUEST_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Remove a public key you previously added to CloudFront.

      def delete_public_key(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeletePublicKeyRequest.new(id: id, if_match: if_match)
        delete_public_key(input)
      end

      def delete_public_key(input : Types::DeletePublicKeyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a real-time log configuration. You cannot delete a real-time log configuration if it's
      # attached to a cache behavior. First update your distributions to remove the real-time log
      # configuration from all cache behaviors, then delete the real-time log configuration. To delete a
      # real-time log configuration, you can provide the configuration's name or its Amazon Resource Name
      # (ARN). You must provide at least one. If you provide both, CloudFront uses the name to identify the
      # real-time log configuration to delete.

      def delete_realtime_log_config(
        arn : String? = nil,
        name : String? = nil
      ) : Nil

        input = Types::DeleteRealtimeLogConfigRequest.new(arn: arn, name: name)
        delete_realtime_log_config(input)
      end

      def delete_realtime_log_config(input : Types::DeleteRealtimeLogConfigRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_REALTIME_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource policy attached to the CloudFront resource.

      def delete_resource_policy(
        resource_arn : String
      ) : Nil

        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a response headers policy. You cannot delete a response headers policy if it's attached to a
      # cache behavior. First update your distributions to remove the response headers policy from all cache
      # behaviors, then delete the response headers policy. To delete a response headers policy, you must
      # provide the policy's identifier and version. To get these values, you can use
      # ListResponseHeadersPolicies or GetResponseHeadersPolicy .

      def delete_response_headers_policy(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteResponseHeadersPolicyRequest.new(id: id, if_match: if_match)
        delete_response_headers_policy(input)
      end

      def delete_response_headers_policy(input : Types::DeleteResponseHeadersPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_RESPONSE_HEADERS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a streaming distribution. To delete an RTMP distribution using the CloudFront API, perform
      # the following steps. To delete an RTMP distribution using the CloudFront API : Disable the RTMP
      # distribution. Submit a GET Streaming Distribution Config request to get the current configuration
      # and the Etag header for the distribution. Update the XML document that was returned in the response
      # to your GET Streaming Distribution Config request to change the value of Enabled to false . Submit a
      # PUT Streaming Distribution Config request to update the configuration for your distribution. In the
      # request body, include the XML document that you updated in Step 3. Then set the value of the HTTP
      # If-Match header to the value of the ETag header that CloudFront returned when you submitted the GET
      # Streaming Distribution Config request in Step 2. Review the response to the PUT Streaming
      # Distribution Config request to confirm that the distribution was successfully disabled. Submit a GET
      # Streaming Distribution Config request to confirm that your changes have propagated. When propagation
      # is complete, the value of Status is Deployed . Submit a DELETE Streaming Distribution request. Set
      # the value of the HTTP If-Match header to the value of the ETag header that CloudFront returned when
      # you submitted the GET Streaming Distribution Config request in Step 2. Review the response to your
      # DELETE Streaming Distribution request to confirm that the distribution was successfully deleted. For
      # information about deleting a distribution using the CloudFront console, see Deleting a Distribution
      # in the Amazon CloudFront Developer Guide .

      def delete_streaming_distribution(
        id : String,
        if_match : String? = nil
      ) : Nil

        input = Types::DeleteStreamingDistributionRequest.new(id: id, if_match: if_match)
        delete_streaming_distribution(input)
      end

      def delete_streaming_distribution(input : Types::DeleteStreamingDistributionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_STREAMING_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a trust store.

      def delete_trust_store(
        id : String,
        if_match : String
      ) : Nil

        input = Types::DeleteTrustStoreRequest.new(id: id, if_match: if_match)
        delete_trust_store(input)
      end

      def delete_trust_store(input : Types::DeleteTrustStoreRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Delete an Amazon CloudFront VPC origin.

      def delete_vpc_origin(
        id : String,
        if_match : String
      ) : Types::DeleteVpcOriginResult

        input = Types::DeleteVpcOriginRequest.new(id: id, if_match: if_match)
        delete_vpc_origin(input)
      end

      def delete_vpc_origin(input : Types::DeleteVpcOriginRequest) : Types::DeleteVpcOriginResult
        request = Protocol::RestXml.build_request(Model::DELETE_VPC_ORIGIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteVpcOriginResult, "DeleteVpcOrigin")
      end

      # Describes a connection function.

      def describe_connection_function(
        identifier : String,
        stage : String? = nil
      ) : Types::DescribeConnectionFunctionResult

        input = Types::DescribeConnectionFunctionRequest.new(identifier: identifier, stage: stage)
        describe_connection_function(input)
      end

      def describe_connection_function(input : Types::DescribeConnectionFunctionRequest) : Types::DescribeConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::DESCRIBE_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DescribeConnectionFunctionResult, "DescribeConnectionFunction")
      end

      # Gets configuration information and metadata about a CloudFront function, but not the function's
      # code. To get a function's code, use GetFunction . To get configuration information and metadata
      # about a function, you must provide the function's name and stage. To get these values, you can use
      # ListFunctions .

      def describe_function(
        name : String,
        stage : String? = nil
      ) : Types::DescribeFunctionResult

        input = Types::DescribeFunctionRequest.new(name: name, stage: stage)
        describe_function(input)
      end

      def describe_function(input : Types::DescribeFunctionRequest) : Types::DescribeFunctionResult
        request = Protocol::RestXml.build_request(Model::DESCRIBE_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DescribeFunctionResult, "DescribeFunction")
      end

      # Specifies the key value store and its configuration.

      def describe_key_value_store(
        name : String
      ) : Types::DescribeKeyValueStoreResult

        input = Types::DescribeKeyValueStoreRequest.new(name: name)
        describe_key_value_store(input)
      end

      def describe_key_value_store(input : Types::DescribeKeyValueStoreRequest) : Types::DescribeKeyValueStoreResult
        request = Protocol::RestXml.build_request(Model::DESCRIBE_KEY_VALUE_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DescribeKeyValueStoreResult, "DescribeKeyValueStore")
      end

      # Disassociates a distribution tenant from the WAF web ACL.

      def disassociate_distribution_tenant_web_acl(
        id : String,
        if_match : String? = nil
      ) : Types::DisassociateDistributionTenantWebACLResult

        input = Types::DisassociateDistributionTenantWebACLRequest.new(id: id, if_match: if_match)
        disassociate_distribution_tenant_web_acl(input)
      end

      def disassociate_distribution_tenant_web_acl(input : Types::DisassociateDistributionTenantWebACLRequest) : Types::DisassociateDistributionTenantWebACLResult
        request = Protocol::RestXml.build_request(Model::DISASSOCIATE_DISTRIBUTION_TENANT_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DisassociateDistributionTenantWebACLResult, "DisassociateDistributionTenantWebACL")
      end

      # Disassociates a distribution from the WAF web ACL.

      def disassociate_distribution_web_acl(
        id : String,
        if_match : String? = nil
      ) : Types::DisassociateDistributionWebACLResult

        input = Types::DisassociateDistributionWebACLRequest.new(id: id, if_match: if_match)
        disassociate_distribution_web_acl(input)
      end

      def disassociate_distribution_web_acl(input : Types::DisassociateDistributionWebACLRequest) : Types::DisassociateDistributionWebACLResult
        request = Protocol::RestXml.build_request(Model::DISASSOCIATE_DISTRIBUTION_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DisassociateDistributionWebACLResult, "DisassociateDistributionWebACL")
      end

      # Gets an Anycast static IP list.

      def get_anycast_ip_list(
        id : String
      ) : Types::GetAnycastIpListResult

        input = Types::GetAnycastIpListRequest.new(id: id)
        get_anycast_ip_list(input)
      end

      def get_anycast_ip_list(input : Types::GetAnycastIpListRequest) : Types::GetAnycastIpListResult
        request = Protocol::RestXml.build_request(Model::GET_ANYCAST_IP_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAnycastIpListResult, "GetAnycastIpList")
      end

      # Gets a cache policy, including the following metadata: The policy's identifier. The date and time
      # when the policy was last modified. To get a cache policy, you must provide the policy's identifier.
      # If the cache policy is attached to a distribution's cache behavior, you can get the policy's
      # identifier using ListDistributions or GetDistribution . If the cache policy is not attached to a
      # cache behavior, you can get the identifier using ListCachePolicies .

      def get_cache_policy(
        id : String
      ) : Types::GetCachePolicyResult

        input = Types::GetCachePolicyRequest.new(id: id)
        get_cache_policy(input)
      end

      def get_cache_policy(input : Types::GetCachePolicyRequest) : Types::GetCachePolicyResult
        request = Protocol::RestXml.build_request(Model::GET_CACHE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetCachePolicyResult, "GetCachePolicy")
      end

      # Gets a cache policy configuration. To get a cache policy configuration, you must provide the
      # policy's identifier. If the cache policy is attached to a distribution's cache behavior, you can get
      # the policy's identifier using ListDistributions or GetDistribution . If the cache policy is not
      # attached to a cache behavior, you can get the identifier using ListCachePolicies .

      def get_cache_policy_config(
        id : String
      ) : Types::GetCachePolicyConfigResult

        input = Types::GetCachePolicyConfigRequest.new(id: id)
        get_cache_policy_config(input)
      end

      def get_cache_policy_config(input : Types::GetCachePolicyConfigRequest) : Types::GetCachePolicyConfigResult
        request = Protocol::RestXml.build_request(Model::GET_CACHE_POLICY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetCachePolicyConfigResult, "GetCachePolicyConfig")
      end

      # Get the information about an origin access identity.

      def get_cloud_front_origin_access_identity(
        id : String
      ) : Types::GetCloudFrontOriginAccessIdentityResult

        input = Types::GetCloudFrontOriginAccessIdentityRequest.new(id: id)
        get_cloud_front_origin_access_identity(input)
      end

      def get_cloud_front_origin_access_identity(input : Types::GetCloudFrontOriginAccessIdentityRequest) : Types::GetCloudFrontOriginAccessIdentityResult
        request = Protocol::RestXml.build_request(Model::GET_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetCloudFrontOriginAccessIdentityResult, "GetCloudFrontOriginAccessIdentity")
      end

      # Get the configuration information about an origin access identity.

      def get_cloud_front_origin_access_identity_config(
        id : String
      ) : Types::GetCloudFrontOriginAccessIdentityConfigResult

        input = Types::GetCloudFrontOriginAccessIdentityConfigRequest.new(id: id)
        get_cloud_front_origin_access_identity_config(input)
      end

      def get_cloud_front_origin_access_identity_config(input : Types::GetCloudFrontOriginAccessIdentityConfigRequest) : Types::GetCloudFrontOriginAccessIdentityConfigResult
        request = Protocol::RestXml.build_request(Model::GET_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetCloudFrontOriginAccessIdentityConfigResult, "GetCloudFrontOriginAccessIdentityConfig")
      end

      # Gets a connection function.

      def get_connection_function(
        identifier : String,
        stage : String? = nil
      ) : Types::GetConnectionFunctionResult

        input = Types::GetConnectionFunctionRequest.new(identifier: identifier, stage: stage)
        get_connection_function(input)
      end

      def get_connection_function(input : Types::GetConnectionFunctionRequest) : Types::GetConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::GET_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetConnectionFunctionResult, "GetConnectionFunction")
      end

      # Gets information about a connection group.

      def get_connection_group(
        identifier : String
      ) : Types::GetConnectionGroupResult

        input = Types::GetConnectionGroupRequest.new(identifier: identifier)
        get_connection_group(input)
      end

      def get_connection_group(input : Types::GetConnectionGroupRequest) : Types::GetConnectionGroupResult
        request = Protocol::RestXml.build_request(Model::GET_CONNECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetConnectionGroupResult, "GetConnectionGroup")
      end

      # Gets information about a connection group by using the endpoint that you specify.

      def get_connection_group_by_routing_endpoint(
        routing_endpoint : String
      ) : Types::GetConnectionGroupByRoutingEndpointResult

        input = Types::GetConnectionGroupByRoutingEndpointRequest.new(routing_endpoint: routing_endpoint)
        get_connection_group_by_routing_endpoint(input)
      end

      def get_connection_group_by_routing_endpoint(input : Types::GetConnectionGroupByRoutingEndpointRequest) : Types::GetConnectionGroupByRoutingEndpointResult
        request = Protocol::RestXml.build_request(Model::GET_CONNECTION_GROUP_BY_ROUTING_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetConnectionGroupByRoutingEndpointResult, "GetConnectionGroupByRoutingEndpoint")
      end

      # Gets a continuous deployment policy, including metadata (the policy's identifier and the date and
      # time when the policy was last modified).

      def get_continuous_deployment_policy(
        id : String
      ) : Types::GetContinuousDeploymentPolicyResult

        input = Types::GetContinuousDeploymentPolicyRequest.new(id: id)
        get_continuous_deployment_policy(input)
      end

      def get_continuous_deployment_policy(input : Types::GetContinuousDeploymentPolicyRequest) : Types::GetContinuousDeploymentPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_CONTINUOUS_DEPLOYMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetContinuousDeploymentPolicyResult, "GetContinuousDeploymentPolicy")
      end

      # Gets configuration information about a continuous deployment policy.

      def get_continuous_deployment_policy_config(
        id : String
      ) : Types::GetContinuousDeploymentPolicyConfigResult

        input = Types::GetContinuousDeploymentPolicyConfigRequest.new(id: id)
        get_continuous_deployment_policy_config(input)
      end

      def get_continuous_deployment_policy_config(input : Types::GetContinuousDeploymentPolicyConfigRequest) : Types::GetContinuousDeploymentPolicyConfigResult
        request = Protocol::RestXml.build_request(Model::GET_CONTINUOUS_DEPLOYMENT_POLICY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetContinuousDeploymentPolicyConfigResult, "GetContinuousDeploymentPolicyConfig")
      end

      # Get the information about a distribution.

      def get_distribution(
        id : String
      ) : Types::GetDistributionResult

        input = Types::GetDistributionRequest.new(id: id)
        get_distribution(input)
      end

      def get_distribution(input : Types::GetDistributionRequest) : Types::GetDistributionResult
        request = Protocol::RestXml.build_request(Model::GET_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDistributionResult, "GetDistribution")
      end

      # Get the configuration information about a distribution.

      def get_distribution_config(
        id : String
      ) : Types::GetDistributionConfigResult

        input = Types::GetDistributionConfigRequest.new(id: id)
        get_distribution_config(input)
      end

      def get_distribution_config(input : Types::GetDistributionConfigRequest) : Types::GetDistributionConfigResult
        request = Protocol::RestXml.build_request(Model::GET_DISTRIBUTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDistributionConfigResult, "GetDistributionConfig")
      end

      # Gets information about a distribution tenant.

      def get_distribution_tenant(
        identifier : String
      ) : Types::GetDistributionTenantResult

        input = Types::GetDistributionTenantRequest.new(identifier: identifier)
        get_distribution_tenant(input)
      end

      def get_distribution_tenant(input : Types::GetDistributionTenantRequest) : Types::GetDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::GET_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDistributionTenantResult, "GetDistributionTenant")
      end

      # Gets information about a distribution tenant by the associated domain.

      def get_distribution_tenant_by_domain(
        domain : String
      ) : Types::GetDistributionTenantByDomainResult

        input = Types::GetDistributionTenantByDomainRequest.new(domain: domain)
        get_distribution_tenant_by_domain(input)
      end

      def get_distribution_tenant_by_domain(input : Types::GetDistributionTenantByDomainRequest) : Types::GetDistributionTenantByDomainResult
        request = Protocol::RestXml.build_request(Model::GET_DISTRIBUTION_TENANT_BY_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDistributionTenantByDomainResult, "GetDistributionTenantByDomain")
      end

      # Get the field-level encryption configuration information.

      def get_field_level_encryption(
        id : String
      ) : Types::GetFieldLevelEncryptionResult

        input = Types::GetFieldLevelEncryptionRequest.new(id: id)
        get_field_level_encryption(input)
      end

      def get_field_level_encryption(input : Types::GetFieldLevelEncryptionRequest) : Types::GetFieldLevelEncryptionResult
        request = Protocol::RestXml.build_request(Model::GET_FIELD_LEVEL_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetFieldLevelEncryptionResult, "GetFieldLevelEncryption")
      end

      # Get the field-level encryption configuration information.

      def get_field_level_encryption_config(
        id : String
      ) : Types::GetFieldLevelEncryptionConfigResult

        input = Types::GetFieldLevelEncryptionConfigRequest.new(id: id)
        get_field_level_encryption_config(input)
      end

      def get_field_level_encryption_config(input : Types::GetFieldLevelEncryptionConfigRequest) : Types::GetFieldLevelEncryptionConfigResult
        request = Protocol::RestXml.build_request(Model::GET_FIELD_LEVEL_ENCRYPTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetFieldLevelEncryptionConfigResult, "GetFieldLevelEncryptionConfig")
      end

      # Get the field-level encryption profile information.

      def get_field_level_encryption_profile(
        id : String
      ) : Types::GetFieldLevelEncryptionProfileResult

        input = Types::GetFieldLevelEncryptionProfileRequest.new(id: id)
        get_field_level_encryption_profile(input)
      end

      def get_field_level_encryption_profile(input : Types::GetFieldLevelEncryptionProfileRequest) : Types::GetFieldLevelEncryptionProfileResult
        request = Protocol::RestXml.build_request(Model::GET_FIELD_LEVEL_ENCRYPTION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetFieldLevelEncryptionProfileResult, "GetFieldLevelEncryptionProfile")
      end

      # Get the field-level encryption profile configuration information.

      def get_field_level_encryption_profile_config(
        id : String
      ) : Types::GetFieldLevelEncryptionProfileConfigResult

        input = Types::GetFieldLevelEncryptionProfileConfigRequest.new(id: id)
        get_field_level_encryption_profile_config(input)
      end

      def get_field_level_encryption_profile_config(input : Types::GetFieldLevelEncryptionProfileConfigRequest) : Types::GetFieldLevelEncryptionProfileConfigResult
        request = Protocol::RestXml.build_request(Model::GET_FIELD_LEVEL_ENCRYPTION_PROFILE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetFieldLevelEncryptionProfileConfigResult, "GetFieldLevelEncryptionProfileConfig")
      end

      # Gets the code of a CloudFront function. To get configuration information and metadata about a
      # function, use DescribeFunction . To get a function's code, you must provide the function's name and
      # stage. To get these values, you can use ListFunctions .

      def get_function(
        name : String,
        stage : String? = nil
      ) : Types::GetFunctionResult

        input = Types::GetFunctionRequest.new(name: name, stage: stage)
        get_function(input)
      end

      def get_function(input : Types::GetFunctionRequest) : Types::GetFunctionResult
        request = Protocol::RestXml.build_request(Model::GET_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetFunctionResult, "GetFunction")
      end

      # Get the information about an invalidation.

      def get_invalidation(
        distribution_id : String,
        id : String
      ) : Types::GetInvalidationResult

        input = Types::GetInvalidationRequest.new(distribution_id: distribution_id, id: id)
        get_invalidation(input)
      end

      def get_invalidation(input : Types::GetInvalidationRequest) : Types::GetInvalidationResult
        request = Protocol::RestXml.build_request(Model::GET_INVALIDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetInvalidationResult, "GetInvalidation")
      end

      # Gets information about a specific invalidation for a distribution tenant.

      def get_invalidation_for_distribution_tenant(
        distribution_tenant_id : String,
        id : String
      ) : Types::GetInvalidationForDistributionTenantResult

        input = Types::GetInvalidationForDistributionTenantRequest.new(distribution_tenant_id: distribution_tenant_id, id: id)
        get_invalidation_for_distribution_tenant(input)
      end

      def get_invalidation_for_distribution_tenant(input : Types::GetInvalidationForDistributionTenantRequest) : Types::GetInvalidationForDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::GET_INVALIDATION_FOR_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetInvalidationForDistributionTenantResult, "GetInvalidationForDistributionTenant")
      end

      # Gets a key group, including the date and time when the key group was last modified. To get a key
      # group, you must provide the key group's identifier. If the key group is referenced in a
      # distribution's cache behavior, you can get the key group's identifier using ListDistributions or
      # GetDistribution . If the key group is not referenced in a cache behavior, you can get the identifier
      # using ListKeyGroups .

      def get_key_group(
        id : String
      ) : Types::GetKeyGroupResult

        input = Types::GetKeyGroupRequest.new(id: id)
        get_key_group(input)
      end

      def get_key_group(input : Types::GetKeyGroupRequest) : Types::GetKeyGroupResult
        request = Protocol::RestXml.build_request(Model::GET_KEY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetKeyGroupResult, "GetKeyGroup")
      end

      # Gets a key group configuration. To get a key group configuration, you must provide the key group's
      # identifier. If the key group is referenced in a distribution's cache behavior, you can get the key
      # group's identifier using ListDistributions or GetDistribution . If the key group is not referenced
      # in a cache behavior, you can get the identifier using ListKeyGroups .

      def get_key_group_config(
        id : String
      ) : Types::GetKeyGroupConfigResult

        input = Types::GetKeyGroupConfigRequest.new(id: id)
        get_key_group_config(input)
      end

      def get_key_group_config(input : Types::GetKeyGroupConfigRequest) : Types::GetKeyGroupConfigResult
        request = Protocol::RestXml.build_request(Model::GET_KEY_GROUP_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetKeyGroupConfigResult, "GetKeyGroupConfig")
      end

      # Gets details about the CloudFront managed ACM certificate.

      def get_managed_certificate_details(
        identifier : String
      ) : Types::GetManagedCertificateDetailsResult

        input = Types::GetManagedCertificateDetailsRequest.new(identifier: identifier)
        get_managed_certificate_details(input)
      end

      def get_managed_certificate_details(input : Types::GetManagedCertificateDetailsRequest) : Types::GetManagedCertificateDetailsResult
        request = Protocol::RestXml.build_request(Model::GET_MANAGED_CERTIFICATE_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetManagedCertificateDetailsResult, "GetManagedCertificateDetails")
      end

      # Gets information about whether additional CloudWatch metrics are enabled for the specified
      # CloudFront distribution.

      def get_monitoring_subscription(
        distribution_id : String
      ) : Types::GetMonitoringSubscriptionResult

        input = Types::GetMonitoringSubscriptionRequest.new(distribution_id: distribution_id)
        get_monitoring_subscription(input)
      end

      def get_monitoring_subscription(input : Types::GetMonitoringSubscriptionRequest) : Types::GetMonitoringSubscriptionResult
        request = Protocol::RestXml.build_request(Model::GET_MONITORING_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetMonitoringSubscriptionResult, "GetMonitoringSubscription")
      end

      # Gets a CloudFront origin access control, including its unique identifier.

      def get_origin_access_control(
        id : String
      ) : Types::GetOriginAccessControlResult

        input = Types::GetOriginAccessControlRequest.new(id: id)
        get_origin_access_control(input)
      end

      def get_origin_access_control(input : Types::GetOriginAccessControlRequest) : Types::GetOriginAccessControlResult
        request = Protocol::RestXml.build_request(Model::GET_ORIGIN_ACCESS_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetOriginAccessControlResult, "GetOriginAccessControl")
      end

      # Gets a CloudFront origin access control configuration.

      def get_origin_access_control_config(
        id : String
      ) : Types::GetOriginAccessControlConfigResult

        input = Types::GetOriginAccessControlConfigRequest.new(id: id)
        get_origin_access_control_config(input)
      end

      def get_origin_access_control_config(input : Types::GetOriginAccessControlConfigRequest) : Types::GetOriginAccessControlConfigResult
        request = Protocol::RestXml.build_request(Model::GET_ORIGIN_ACCESS_CONTROL_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetOriginAccessControlConfigResult, "GetOriginAccessControlConfig")
      end

      # Gets an origin request policy, including the following metadata: The policy's identifier. The date
      # and time when the policy was last modified. To get an origin request policy, you must provide the
      # policy's identifier. If the origin request policy is attached to a distribution's cache behavior,
      # you can get the policy's identifier using ListDistributions or GetDistribution . If the origin
      # request policy is not attached to a cache behavior, you can get the identifier using
      # ListOriginRequestPolicies .

      def get_origin_request_policy(
        id : String
      ) : Types::GetOriginRequestPolicyResult

        input = Types::GetOriginRequestPolicyRequest.new(id: id)
        get_origin_request_policy(input)
      end

      def get_origin_request_policy(input : Types::GetOriginRequestPolicyRequest) : Types::GetOriginRequestPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_ORIGIN_REQUEST_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetOriginRequestPolicyResult, "GetOriginRequestPolicy")
      end

      # Gets an origin request policy configuration. To get an origin request policy configuration, you must
      # provide the policy's identifier. If the origin request policy is attached to a distribution's cache
      # behavior, you can get the policy's identifier using ListDistributions or GetDistribution . If the
      # origin request policy is not attached to a cache behavior, you can get the identifier using
      # ListOriginRequestPolicies .

      def get_origin_request_policy_config(
        id : String
      ) : Types::GetOriginRequestPolicyConfigResult

        input = Types::GetOriginRequestPolicyConfigRequest.new(id: id)
        get_origin_request_policy_config(input)
      end

      def get_origin_request_policy_config(input : Types::GetOriginRequestPolicyConfigRequest) : Types::GetOriginRequestPolicyConfigResult
        request = Protocol::RestXml.build_request(Model::GET_ORIGIN_REQUEST_POLICY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetOriginRequestPolicyConfigResult, "GetOriginRequestPolicyConfig")
      end

      # Gets a public key.

      def get_public_key(
        id : String
      ) : Types::GetPublicKeyResult

        input = Types::GetPublicKeyRequest.new(id: id)
        get_public_key(input)
      end

      def get_public_key(input : Types::GetPublicKeyRequest) : Types::GetPublicKeyResult
        request = Protocol::RestXml.build_request(Model::GET_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetPublicKeyResult, "GetPublicKey")
      end

      # Gets a public key configuration.

      def get_public_key_config(
        id : String
      ) : Types::GetPublicKeyConfigResult

        input = Types::GetPublicKeyConfigRequest.new(id: id)
        get_public_key_config(input)
      end

      def get_public_key_config(input : Types::GetPublicKeyConfigRequest) : Types::GetPublicKeyConfigResult
        request = Protocol::RestXml.build_request(Model::GET_PUBLIC_KEY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetPublicKeyConfigResult, "GetPublicKeyConfig")
      end

      # Gets a real-time log configuration. To get a real-time log configuration, you can provide the
      # configuration's name or its Amazon Resource Name (ARN). You must provide at least one. If you
      # provide both, CloudFront uses the name to identify the real-time log configuration to get.

      def get_realtime_log_config(
        arn : String? = nil,
        name : String? = nil
      ) : Types::GetRealtimeLogConfigResult

        input = Types::GetRealtimeLogConfigRequest.new(arn: arn, name: name)
        get_realtime_log_config(input)
      end

      def get_realtime_log_config(input : Types::GetRealtimeLogConfigRequest) : Types::GetRealtimeLogConfigResult
        request = Protocol::RestXml.build_request(Model::GET_REALTIME_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetRealtimeLogConfigResult, "GetRealtimeLogConfig")
      end

      # Retrieves the resource policy for the specified CloudFront resource that you own and have shared.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResult

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResult
        request = Protocol::RestXml.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetResourcePolicyResult, "GetResourcePolicy")
      end

      # Gets a response headers policy, including metadata (the policy's identifier and the date and time
      # when the policy was last modified). To get a response headers policy, you must provide the policy's
      # identifier. If the response headers policy is attached to a distribution's cache behavior, you can
      # get the policy's identifier using ListDistributions or GetDistribution . If the response headers
      # policy is not attached to a cache behavior, you can get the identifier using
      # ListResponseHeadersPolicies .

      def get_response_headers_policy(
        id : String
      ) : Types::GetResponseHeadersPolicyResult

        input = Types::GetResponseHeadersPolicyRequest.new(id: id)
        get_response_headers_policy(input)
      end

      def get_response_headers_policy(input : Types::GetResponseHeadersPolicyRequest) : Types::GetResponseHeadersPolicyResult
        request = Protocol::RestXml.build_request(Model::GET_RESPONSE_HEADERS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetResponseHeadersPolicyResult, "GetResponseHeadersPolicy")
      end

      # Gets a response headers policy configuration. To get a response headers policy configuration, you
      # must provide the policy's identifier. If the response headers policy is attached to a distribution's
      # cache behavior, you can get the policy's identifier using ListDistributions or GetDistribution . If
      # the response headers policy is not attached to a cache behavior, you can get the identifier using
      # ListResponseHeadersPolicies .

      def get_response_headers_policy_config(
        id : String
      ) : Types::GetResponseHeadersPolicyConfigResult

        input = Types::GetResponseHeadersPolicyConfigRequest.new(id: id)
        get_response_headers_policy_config(input)
      end

      def get_response_headers_policy_config(input : Types::GetResponseHeadersPolicyConfigRequest) : Types::GetResponseHeadersPolicyConfigResult
        request = Protocol::RestXml.build_request(Model::GET_RESPONSE_HEADERS_POLICY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetResponseHeadersPolicyConfigResult, "GetResponseHeadersPolicyConfig")
      end

      # Gets information about a specified RTMP distribution, including the distribution configuration.

      def get_streaming_distribution(
        id : String
      ) : Types::GetStreamingDistributionResult

        input = Types::GetStreamingDistributionRequest.new(id: id)
        get_streaming_distribution(input)
      end

      def get_streaming_distribution(input : Types::GetStreamingDistributionRequest) : Types::GetStreamingDistributionResult
        request = Protocol::RestXml.build_request(Model::GET_STREAMING_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetStreamingDistributionResult, "GetStreamingDistribution")
      end

      # Get the configuration information about a streaming distribution.

      def get_streaming_distribution_config(
        id : String
      ) : Types::GetStreamingDistributionConfigResult

        input = Types::GetStreamingDistributionConfigRequest.new(id: id)
        get_streaming_distribution_config(input)
      end

      def get_streaming_distribution_config(input : Types::GetStreamingDistributionConfigRequest) : Types::GetStreamingDistributionConfigResult
        request = Protocol::RestXml.build_request(Model::GET_STREAMING_DISTRIBUTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetStreamingDistributionConfigResult, "GetStreamingDistributionConfig")
      end

      # Gets a trust store.

      def get_trust_store(
        identifier : String
      ) : Types::GetTrustStoreResult

        input = Types::GetTrustStoreRequest.new(identifier: identifier)
        get_trust_store(input)
      end

      def get_trust_store(input : Types::GetTrustStoreRequest) : Types::GetTrustStoreResult
        request = Protocol::RestXml.build_request(Model::GET_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetTrustStoreResult, "GetTrustStore")
      end

      # Get the details of an Amazon CloudFront VPC origin.

      def get_vpc_origin(
        id : String
      ) : Types::GetVpcOriginResult

        input = Types::GetVpcOriginRequest.new(id: id)
        get_vpc_origin(input)
      end

      def get_vpc_origin(input : Types::GetVpcOriginRequest) : Types::GetVpcOriginResult
        request = Protocol::RestXml.build_request(Model::GET_VPC_ORIGIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetVpcOriginResult, "GetVpcOrigin")
      end

      # Lists your Anycast static IP lists.

      def list_anycast_ip_lists(
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListAnycastIpListsResult

        input = Types::ListAnycastIpListsRequest.new(marker: marker, max_items: max_items)
        list_anycast_ip_lists(input)
      end

      def list_anycast_ip_lists(input : Types::ListAnycastIpListsRequest) : Types::ListAnycastIpListsResult
        request = Protocol::RestXml.build_request(Model::LIST_ANYCAST_IP_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListAnycastIpListsResult, "ListAnycastIpLists")
      end

      # Gets a list of cache policies. You can optionally apply a filter to return only the managed policies
      # created by Amazon Web Services, or only the custom policies created in your Amazon Web Services
      # account. You can optionally specify the maximum number of items to receive in the response. If the
      # total number of items in the list exceeds the maximum that you specify, or the default maximum, the
      # response is paginated. To get the next page of items, send a subsequent request that specifies the
      # NextMarker value from the current response as the Marker value in the subsequent request.

      def list_cache_policies(
        marker : String? = nil,
        max_items : String? = nil,
        type : String? = nil
      ) : Types::ListCachePoliciesResult

        input = Types::ListCachePoliciesRequest.new(marker: marker, max_items: max_items, type: type)
        list_cache_policies(input)
      end

      def list_cache_policies(input : Types::ListCachePoliciesRequest) : Types::ListCachePoliciesResult
        request = Protocol::RestXml.build_request(Model::LIST_CACHE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCachePoliciesResult, "ListCachePolicies")
      end

      # Lists origin access identities.

      def list_cloud_front_origin_access_identities(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListCloudFrontOriginAccessIdentitiesResult

        input = Types::ListCloudFrontOriginAccessIdentitiesRequest.new(marker: marker, max_items: max_items)
        list_cloud_front_origin_access_identities(input)
      end

      def list_cloud_front_origin_access_identities(input : Types::ListCloudFrontOriginAccessIdentitiesRequest) : Types::ListCloudFrontOriginAccessIdentitiesResult
        request = Protocol::RestXml.build_request(Model::LIST_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCloudFrontOriginAccessIdentitiesResult, "ListCloudFrontOriginAccessIdentities")
      end

      # The ListConflictingAliases API operation only supports standard distributions. To list domain
      # conflicts for both standard distributions and distribution tenants, we recommend that you use the
      # ListDomainConflicts API operation instead. Gets a list of aliases that conflict or overlap with the
      # provided alias, and the associated CloudFront standard distribution and Amazon Web Services accounts
      # for each conflicting alias. An alias is commonly known as a custom domain or vanity domain. It can
      # also be called a CNAME or alternate domain name. In the returned list, the standard distribution and
      # account IDs are partially hidden, which allows you to identify the standard distribution and
      # accounts that you own, and helps to protect the information of ones that you don't own. Use this
      # operation to find aliases that are in use in CloudFront that conflict or overlap with the provided
      # alias. For example, if you provide www.example.com as input, the returned list can include
      # www.example.com and the overlapping wildcard alternate domain name ( .example.com ), if they exist.
      # If you provide .example.com as input, the returned list can include *.example.com and any alternate
      # domain names covered by that wildcard (for example, www.example.com , test.example.com ,
      # dev.example.com , and so on), if they exist. To list conflicting aliases, specify the alias to
      # search and the ID of a standard distribution in your account that has an attached TLS certificate
      # that includes the provided alias. For more information, including how to set up the standard
      # distribution and certificate, see Moving an alternate domain name to a different standard
      # distribution or distribution tenant in the Amazon CloudFront Developer Guide . You can optionally
      # specify the maximum number of items to receive in the response. If the total number of items in the
      # list exceeds the maximum that you specify, or the default maximum, the response is paginated. To get
      # the next page of items, send a subsequent request that specifies the NextMarker value from the
      # current response as the Marker value in the subsequent request.

      def list_conflicting_aliases(
        alias_ : String,
        distribution_id : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListConflictingAliasesResult

        input = Types::ListConflictingAliasesRequest.new(alias_: alias_, distribution_id: distribution_id, marker: marker, max_items: max_items)
        list_conflicting_aliases(input)
      end

      def list_conflicting_aliases(input : Types::ListConflictingAliasesRequest) : Types::ListConflictingAliasesResult
        request = Protocol::RestXml.build_request(Model::LIST_CONFLICTING_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListConflictingAliasesResult, "ListConflictingAliases")
      end

      # Lists connection functions.

      def list_connection_functions(
        marker : String? = nil,
        max_items : Int32? = nil,
        stage : String? = nil
      ) : Types::ListConnectionFunctionsResult

        input = Types::ListConnectionFunctionsRequest.new(marker: marker, max_items: max_items, stage: stage)
        list_connection_functions(input)
      end

      def list_connection_functions(input : Types::ListConnectionFunctionsRequest) : Types::ListConnectionFunctionsResult
        request = Protocol::RestXml.build_request(Model::LIST_CONNECTION_FUNCTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListConnectionFunctionsResult, "ListConnectionFunctions")
      end

      # Lists the connection groups in your Amazon Web Services account.

      def list_connection_groups(
        association_filter : Types::ConnectionGroupAssociationFilter? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListConnectionGroupsResult

        input = Types::ListConnectionGroupsRequest.new(association_filter: association_filter, marker: marker, max_items: max_items)
        list_connection_groups(input)
      end

      def list_connection_groups(input : Types::ListConnectionGroupsRequest) : Types::ListConnectionGroupsResult
        request = Protocol::RestXml.build_request(Model::LIST_CONNECTION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListConnectionGroupsResult, "ListConnectionGroups")
      end

      # Gets a list of the continuous deployment policies in your Amazon Web Services account. You can
      # optionally specify the maximum number of items to receive in the response. If the total number of
      # items in the list exceeds the maximum that you specify, or the default maximum, the response is
      # paginated. To get the next page of items, send a subsequent request that specifies the NextMarker
      # value from the current response as the Marker value in the subsequent request.

      def list_continuous_deployment_policies(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListContinuousDeploymentPoliciesResult

        input = Types::ListContinuousDeploymentPoliciesRequest.new(marker: marker, max_items: max_items)
        list_continuous_deployment_policies(input)
      end

      def list_continuous_deployment_policies(input : Types::ListContinuousDeploymentPoliciesRequest) : Types::ListContinuousDeploymentPoliciesResult
        request = Protocol::RestXml.build_request(Model::LIST_CONTINUOUS_DEPLOYMENT_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListContinuousDeploymentPoliciesResult, "ListContinuousDeploymentPolicies")
      end

      # Lists the distribution tenants in your Amazon Web Services account.

      def list_distribution_tenants(
        association_filter : Types::DistributionTenantAssociationFilter? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListDistributionTenantsResult

        input = Types::ListDistributionTenantsRequest.new(association_filter: association_filter, marker: marker, max_items: max_items)
        list_distribution_tenants(input)
      end

      def list_distribution_tenants(input : Types::ListDistributionTenantsRequest) : Types::ListDistributionTenantsResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTION_TENANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionTenantsResult, "ListDistributionTenants")
      end

      # Lists distribution tenants by the customization that you specify. You must specify either the
      # CertificateArn parameter or WebACLArn parameter, but not both in the same request.

      def list_distribution_tenants_by_customization(
        certificate_arn : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        web_acl_arn : String? = nil
      ) : Types::ListDistributionTenantsByCustomizationResult

        input = Types::ListDistributionTenantsByCustomizationRequest.new(certificate_arn: certificate_arn, marker: marker, max_items: max_items, web_acl_arn: web_acl_arn)
        list_distribution_tenants_by_customization(input)
      end

      def list_distribution_tenants_by_customization(input : Types::ListDistributionTenantsByCustomizationRequest) : Types::ListDistributionTenantsByCustomizationResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTION_TENANTS_BY_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionTenantsByCustomizationResult, "ListDistributionTenantsByCustomization")
      end

      # List CloudFront distributions.

      def list_distributions(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsResult

        input = Types::ListDistributionsRequest.new(marker: marker, max_items: max_items)
        list_distributions(input)
      end

      def list_distributions(input : Types::ListDistributionsRequest) : Types::ListDistributionsResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsResult, "ListDistributions")
      end

      # Lists the distributions in your account that are associated with the specified AnycastIpListId .

      def list_distributions_by_anycast_ip_list_id(
        anycast_ip_list_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByAnycastIpListIdResult

        input = Types::ListDistributionsByAnycastIpListIdRequest.new(anycast_ip_list_id: anycast_ip_list_id, marker: marker, max_items: max_items)
        list_distributions_by_anycast_ip_list_id(input)
      end

      def list_distributions_by_anycast_ip_list_id(input : Types::ListDistributionsByAnycastIpListIdRequest) : Types::ListDistributionsByAnycastIpListIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_ANYCAST_IP_LIST_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByAnycastIpListIdResult, "ListDistributionsByAnycastIpListId")
      end

      # Gets a list of distribution IDs for distributions that have a cache behavior that's associated with
      # the specified cache policy. You can optionally specify the maximum number of items to receive in the
      # response. If the total number of items in the list exceeds the maximum that you specify, or the
      # default maximum, the response is paginated. To get the next page of items, send a subsequent request
      # that specifies the NextMarker value from the current response as the Marker value in the subsequent
      # request.

      def list_distributions_by_cache_policy_id(
        cache_policy_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByCachePolicyIdResult

        input = Types::ListDistributionsByCachePolicyIdRequest.new(cache_policy_id: cache_policy_id, marker: marker, max_items: max_items)
        list_distributions_by_cache_policy_id(input)
      end

      def list_distributions_by_cache_policy_id(input : Types::ListDistributionsByCachePolicyIdRequest) : Types::ListDistributionsByCachePolicyIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_CACHE_POLICY_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByCachePolicyIdResult, "ListDistributionsByCachePolicyId")
      end

      # Lists distributions by connection function.

      def list_distributions_by_connection_function(
        connection_function_identifier : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListDistributionsByConnectionFunctionResult

        input = Types::ListDistributionsByConnectionFunctionRequest.new(connection_function_identifier: connection_function_identifier, marker: marker, max_items: max_items)
        list_distributions_by_connection_function(input)
      end

      def list_distributions_by_connection_function(input : Types::ListDistributionsByConnectionFunctionRequest) : Types::ListDistributionsByConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByConnectionFunctionResult, "ListDistributionsByConnectionFunction")
      end

      # Lists the distributions by the connection mode that you specify.

      def list_distributions_by_connection_mode(
        connection_mode : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListDistributionsByConnectionModeResult

        input = Types::ListDistributionsByConnectionModeRequest.new(connection_mode: connection_mode, marker: marker, max_items: max_items)
        list_distributions_by_connection_mode(input)
      end

      def list_distributions_by_connection_mode(input : Types::ListDistributionsByConnectionModeRequest) : Types::ListDistributionsByConnectionModeResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_CONNECTION_MODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByConnectionModeResult, "ListDistributionsByConnectionMode")
      end

      # Gets a list of distribution IDs for distributions that have a cache behavior that references the
      # specified key group. You can optionally specify the maximum number of items to receive in the
      # response. If the total number of items in the list exceeds the maximum that you specify, or the
      # default maximum, the response is paginated. To get the next page of items, send a subsequent request
      # that specifies the NextMarker value from the current response as the Marker value in the subsequent
      # request.

      def list_distributions_by_key_group(
        key_group_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByKeyGroupResult

        input = Types::ListDistributionsByKeyGroupRequest.new(key_group_id: key_group_id, marker: marker, max_items: max_items)
        list_distributions_by_key_group(input)
      end

      def list_distributions_by_key_group(input : Types::ListDistributionsByKeyGroupRequest) : Types::ListDistributionsByKeyGroupResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_KEY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByKeyGroupResult, "ListDistributionsByKeyGroup")
      end

      # Gets a list of distribution IDs for distributions that have a cache behavior that's associated with
      # the specified origin request policy. You can optionally specify the maximum number of items to
      # receive in the response. If the total number of items in the list exceeds the maximum that you
      # specify, or the default maximum, the response is paginated. To get the next page of items, send a
      # subsequent request that specifies the NextMarker value from the current response as the Marker value
      # in the subsequent request.

      def list_distributions_by_origin_request_policy_id(
        origin_request_policy_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByOriginRequestPolicyIdResult

        input = Types::ListDistributionsByOriginRequestPolicyIdRequest.new(origin_request_policy_id: origin_request_policy_id, marker: marker, max_items: max_items)
        list_distributions_by_origin_request_policy_id(input)
      end

      def list_distributions_by_origin_request_policy_id(input : Types::ListDistributionsByOriginRequestPolicyIdRequest) : Types::ListDistributionsByOriginRequestPolicyIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_ORIGIN_REQUEST_POLICY_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByOriginRequestPolicyIdResult, "ListDistributionsByOriginRequestPolicyId")
      end

      # Lists the CloudFront distributions that are associated with the specified resource that you own.

      def list_distributions_by_owned_resource(
        resource_arn : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByOwnedResourceResult

        input = Types::ListDistributionsByOwnedResourceRequest.new(resource_arn: resource_arn, marker: marker, max_items: max_items)
        list_distributions_by_owned_resource(input)
      end

      def list_distributions_by_owned_resource(input : Types::ListDistributionsByOwnedResourceRequest) : Types::ListDistributionsByOwnedResourceResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_OWNED_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByOwnedResourceResult, "ListDistributionsByOwnedResource")
      end

      # Gets a list of distributions that have a cache behavior that's associated with the specified
      # real-time log configuration. You can specify the real-time log configuration by its name or its
      # Amazon Resource Name (ARN). You must provide at least one. If you provide both, CloudFront uses the
      # name to identify the real-time log configuration to list distributions for. You can optionally
      # specify the maximum number of items to receive in the response. If the total number of items in the
      # list exceeds the maximum that you specify, or the default maximum, the response is paginated. To get
      # the next page of items, send a subsequent request that specifies the NextMarker value from the
      # current response as the Marker value in the subsequent request.

      def list_distributions_by_realtime_log_config(
        marker : String? = nil,
        max_items : String? = nil,
        realtime_log_config_arn : String? = nil,
        realtime_log_config_name : String? = nil
      ) : Types::ListDistributionsByRealtimeLogConfigResult

        input = Types::ListDistributionsByRealtimeLogConfigRequest.new(marker: marker, max_items: max_items, realtime_log_config_arn: realtime_log_config_arn, realtime_log_config_name: realtime_log_config_name)
        list_distributions_by_realtime_log_config(input)
      end

      def list_distributions_by_realtime_log_config(input : Types::ListDistributionsByRealtimeLogConfigRequest) : Types::ListDistributionsByRealtimeLogConfigResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_REALTIME_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByRealtimeLogConfigResult, "ListDistributionsByRealtimeLogConfig")
      end

      # Gets a list of distribution IDs for distributions that have a cache behavior that's associated with
      # the specified response headers policy. You can optionally specify the maximum number of items to
      # receive in the response. If the total number of items in the list exceeds the maximum that you
      # specify, or the default maximum, the response is paginated. To get the next page of items, send a
      # subsequent request that specifies the NextMarker value from the current response as the Marker value
      # in the subsequent request.

      def list_distributions_by_response_headers_policy_id(
        response_headers_policy_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByResponseHeadersPolicyIdResult

        input = Types::ListDistributionsByResponseHeadersPolicyIdRequest.new(response_headers_policy_id: response_headers_policy_id, marker: marker, max_items: max_items)
        list_distributions_by_response_headers_policy_id(input)
      end

      def list_distributions_by_response_headers_policy_id(input : Types::ListDistributionsByResponseHeadersPolicyIdRequest) : Types::ListDistributionsByResponseHeadersPolicyIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_RESPONSE_HEADERS_POLICY_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByResponseHeadersPolicyIdResult, "ListDistributionsByResponseHeadersPolicyId")
      end

      # Lists distributions by trust store.

      def list_distributions_by_trust_store(
        trust_store_identifier : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByTrustStoreResult

        input = Types::ListDistributionsByTrustStoreRequest.new(trust_store_identifier: trust_store_identifier, marker: marker, max_items: max_items)
        list_distributions_by_trust_store(input)
      end

      def list_distributions_by_trust_store(input : Types::ListDistributionsByTrustStoreRequest) : Types::ListDistributionsByTrustStoreResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByTrustStoreResult, "ListDistributionsByTrustStore")
      end

      # List CloudFront distributions by their VPC origin ID.

      def list_distributions_by_vpc_origin_id(
        vpc_origin_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByVpcOriginIdResult

        input = Types::ListDistributionsByVpcOriginIdRequest.new(vpc_origin_id: vpc_origin_id, marker: marker, max_items: max_items)
        list_distributions_by_vpc_origin_id(input)
      end

      def list_distributions_by_vpc_origin_id(input : Types::ListDistributionsByVpcOriginIdRequest) : Types::ListDistributionsByVpcOriginIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_VPC_ORIGIN_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByVpcOriginIdResult, "ListDistributionsByVpcOriginId")
      end

      # List the distributions that are associated with a specified WAF web ACL.

      def list_distributions_by_web_acl_id(
        web_acl_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListDistributionsByWebACLIdResult

        input = Types::ListDistributionsByWebACLIdRequest.new(web_acl_id: web_acl_id, marker: marker, max_items: max_items)
        list_distributions_by_web_acl_id(input)
      end

      def list_distributions_by_web_acl_id(input : Types::ListDistributionsByWebACLIdRequest) : Types::ListDistributionsByWebACLIdResult
        request = Protocol::RestXml.build_request(Model::LIST_DISTRIBUTIONS_BY_WEB_ACL_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDistributionsByWebACLIdResult, "ListDistributionsByWebACLId")
      end

      # We recommend that you use the ListDomainConflicts API operation to check for domain conflicts, as it
      # supports both standard distributions and distribution tenants. ListConflictingAliases performs
      # similar checks but only supports standard distributions. Lists existing domain associations that
      # conflict with the domain that you specify. You can use this API operation to identify potential
      # domain conflicts when moving domains between standard distributions and/or distribution tenants.
      # Domain conflicts must be resolved first before they can be moved. For example, if you provide
      # www.example.com as input, the returned list can include www.example.com and the overlapping wildcard
      # alternate domain name ( .example.com ), if they exist. If you provide .example.com as input, the
      # returned list can include *.example.com and any alternate domain names covered by that wildcard (for
      # example, www.example.com , test.example.com , dev.example.com , and so on), if they exist. To list
      # conflicting domains, specify the following: The domain to search for The ID of a standard
      # distribution or distribution tenant in your account that has an attached TLS certificate, which
      # covers the specified domain For more information, including how to set up the standard distribution
      # or distribution tenant, and the certificate, see Moving an alternate domain name to a different
      # standard distribution or distribution tenant in the Amazon CloudFront Developer Guide . You can
      # optionally specify the maximum number of items to receive in the response. If the total number of
      # items in the list exceeds the maximum that you specify, or the default maximum, the response is
      # paginated. To get the next page of items, send a subsequent request that specifies the NextMarker
      # value from the current response as the Marker value in the subsequent request.

      def list_domain_conflicts(
        domain : String,
        domain_control_validation_resource : Types::DistributionResourceId,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListDomainConflictsResult

        input = Types::ListDomainConflictsRequest.new(domain: domain, domain_control_validation_resource: domain_control_validation_resource, marker: marker, max_items: max_items)
        list_domain_conflicts(input)
      end

      def list_domain_conflicts(input : Types::ListDomainConflictsRequest) : Types::ListDomainConflictsResult
        request = Protocol::RestXml.build_request(Model::LIST_DOMAIN_CONFLICTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDomainConflictsResult, "ListDomainConflicts")
      end

      # List all field-level encryption configurations that have been created in CloudFront for this
      # account.

      def list_field_level_encryption_configs(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListFieldLevelEncryptionConfigsResult

        input = Types::ListFieldLevelEncryptionConfigsRequest.new(marker: marker, max_items: max_items)
        list_field_level_encryption_configs(input)
      end

      def list_field_level_encryption_configs(input : Types::ListFieldLevelEncryptionConfigsRequest) : Types::ListFieldLevelEncryptionConfigsResult
        request = Protocol::RestXml.build_request(Model::LIST_FIELD_LEVEL_ENCRYPTION_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListFieldLevelEncryptionConfigsResult, "ListFieldLevelEncryptionConfigs")
      end

      # Request a list of field-level encryption profiles that have been created in CloudFront for this
      # account.

      def list_field_level_encryption_profiles(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListFieldLevelEncryptionProfilesResult

        input = Types::ListFieldLevelEncryptionProfilesRequest.new(marker: marker, max_items: max_items)
        list_field_level_encryption_profiles(input)
      end

      def list_field_level_encryption_profiles(input : Types::ListFieldLevelEncryptionProfilesRequest) : Types::ListFieldLevelEncryptionProfilesResult
        request = Protocol::RestXml.build_request(Model::LIST_FIELD_LEVEL_ENCRYPTION_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListFieldLevelEncryptionProfilesResult, "ListFieldLevelEncryptionProfiles")
      end

      # Gets a list of all CloudFront functions in your Amazon Web Services account. You can optionally
      # apply a filter to return only the functions that are in the specified stage, either DEVELOPMENT or
      # LIVE . You can optionally specify the maximum number of items to receive in the response. If the
      # total number of items in the list exceeds the maximum that you specify, or the default maximum, the
      # response is paginated. To get the next page of items, send a subsequent request that specifies the
      # NextMarker value from the current response as the Marker value in the subsequent request.

      def list_functions(
        marker : String? = nil,
        max_items : String? = nil,
        stage : String? = nil
      ) : Types::ListFunctionsResult

        input = Types::ListFunctionsRequest.new(marker: marker, max_items: max_items, stage: stage)
        list_functions(input)
      end

      def list_functions(input : Types::ListFunctionsRequest) : Types::ListFunctionsResult
        request = Protocol::RestXml.build_request(Model::LIST_FUNCTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListFunctionsResult, "ListFunctions")
      end

      # Lists invalidation batches.

      def list_invalidations(
        distribution_id : String,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListInvalidationsResult

        input = Types::ListInvalidationsRequest.new(distribution_id: distribution_id, marker: marker, max_items: max_items)
        list_invalidations(input)
      end

      def list_invalidations(input : Types::ListInvalidationsRequest) : Types::ListInvalidationsResult
        request = Protocol::RestXml.build_request(Model::LIST_INVALIDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListInvalidationsResult, "ListInvalidations")
      end

      # Lists the invalidations for a distribution tenant.

      def list_invalidations_for_distribution_tenant(
        id : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListInvalidationsForDistributionTenantResult

        input = Types::ListInvalidationsForDistributionTenantRequest.new(id: id, marker: marker, max_items: max_items)
        list_invalidations_for_distribution_tenant(input)
      end

      def list_invalidations_for_distribution_tenant(input : Types::ListInvalidationsForDistributionTenantRequest) : Types::ListInvalidationsForDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::LIST_INVALIDATIONS_FOR_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListInvalidationsForDistributionTenantResult, "ListInvalidationsForDistributionTenant")
      end

      # Gets a list of key groups. You can optionally specify the maximum number of items to receive in the
      # response. If the total number of items in the list exceeds the maximum that you specify, or the
      # default maximum, the response is paginated. To get the next page of items, send a subsequent request
      # that specifies the NextMarker value from the current response as the Marker value in the subsequent
      # request.

      def list_key_groups(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListKeyGroupsResult

        input = Types::ListKeyGroupsRequest.new(marker: marker, max_items: max_items)
        list_key_groups(input)
      end

      def list_key_groups(input : Types::ListKeyGroupsRequest) : Types::ListKeyGroupsResult
        request = Protocol::RestXml.build_request(Model::LIST_KEY_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListKeyGroupsResult, "ListKeyGroups")
      end

      # Specifies the key value stores to list.

      def list_key_value_stores(
        marker : String? = nil,
        max_items : String? = nil,
        status : String? = nil
      ) : Types::ListKeyValueStoresResult

        input = Types::ListKeyValueStoresRequest.new(marker: marker, max_items: max_items, status: status)
        list_key_value_stores(input)
      end

      def list_key_value_stores(input : Types::ListKeyValueStoresRequest) : Types::ListKeyValueStoresResult
        request = Protocol::RestXml.build_request(Model::LIST_KEY_VALUE_STORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListKeyValueStoresResult, "ListKeyValueStores")
      end

      # Gets the list of CloudFront origin access controls (OACs) in this Amazon Web Services account. You
      # can optionally specify the maximum number of items to receive in the response. If the total number
      # of items in the list exceeds the maximum that you specify, or the default maximum, the response is
      # paginated. To get the next page of items, send another request that specifies the NextMarker value
      # from the current response as the Marker value in the next request. If you're not using origin access
      # controls for your Amazon Web Services account, the ListOriginAccessControls operation doesn't return
      # the Items element in the response.

      def list_origin_access_controls(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListOriginAccessControlsResult

        input = Types::ListOriginAccessControlsRequest.new(marker: marker, max_items: max_items)
        list_origin_access_controls(input)
      end

      def list_origin_access_controls(input : Types::ListOriginAccessControlsRequest) : Types::ListOriginAccessControlsResult
        request = Protocol::RestXml.build_request(Model::LIST_ORIGIN_ACCESS_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListOriginAccessControlsResult, "ListOriginAccessControls")
      end

      # Gets a list of origin request policies. You can optionally apply a filter to return only the managed
      # policies created by Amazon Web Services, or only the custom policies created in your Amazon Web
      # Services account. You can optionally specify the maximum number of items to receive in the response.
      # If the total number of items in the list exceeds the maximum that you specify, or the default
      # maximum, the response is paginated. To get the next page of items, send a subsequent request that
      # specifies the NextMarker value from the current response as the Marker value in the subsequent
      # request.

      def list_origin_request_policies(
        marker : String? = nil,
        max_items : String? = nil,
        type : String? = nil
      ) : Types::ListOriginRequestPoliciesResult

        input = Types::ListOriginRequestPoliciesRequest.new(marker: marker, max_items: max_items, type: type)
        list_origin_request_policies(input)
      end

      def list_origin_request_policies(input : Types::ListOriginRequestPoliciesRequest) : Types::ListOriginRequestPoliciesResult
        request = Protocol::RestXml.build_request(Model::LIST_ORIGIN_REQUEST_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListOriginRequestPoliciesResult, "ListOriginRequestPolicies")
      end

      # List all public keys that have been added to CloudFront for this account.

      def list_public_keys(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListPublicKeysResult

        input = Types::ListPublicKeysRequest.new(marker: marker, max_items: max_items)
        list_public_keys(input)
      end

      def list_public_keys(input : Types::ListPublicKeysRequest) : Types::ListPublicKeysResult
        request = Protocol::RestXml.build_request(Model::LIST_PUBLIC_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListPublicKeysResult, "ListPublicKeys")
      end

      # Gets a list of real-time log configurations. You can optionally specify the maximum number of items
      # to receive in the response. If the total number of items in the list exceeds the maximum that you
      # specify, or the default maximum, the response is paginated. To get the next page of items, send a
      # subsequent request that specifies the NextMarker value from the current response as the Marker value
      # in the subsequent request.

      def list_realtime_log_configs(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListRealtimeLogConfigsResult

        input = Types::ListRealtimeLogConfigsRequest.new(marker: marker, max_items: max_items)
        list_realtime_log_configs(input)
      end

      def list_realtime_log_configs(input : Types::ListRealtimeLogConfigsRequest) : Types::ListRealtimeLogConfigsResult
        request = Protocol::RestXml.build_request(Model::LIST_REALTIME_LOG_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListRealtimeLogConfigsResult, "ListRealtimeLogConfigs")
      end

      # Gets a list of response headers policies. You can optionally apply a filter to get only the managed
      # policies created by Amazon Web Services, or only the custom policies created in your Amazon Web
      # Services account. You can optionally specify the maximum number of items to receive in the response.
      # If the total number of items in the list exceeds the maximum that you specify, or the default
      # maximum, the response is paginated. To get the next page of items, send a subsequent request that
      # specifies the NextMarker value from the current response as the Marker value in the subsequent
      # request.

      def list_response_headers_policies(
        marker : String? = nil,
        max_items : String? = nil,
        type : String? = nil
      ) : Types::ListResponseHeadersPoliciesResult

        input = Types::ListResponseHeadersPoliciesRequest.new(marker: marker, max_items: max_items, type: type)
        list_response_headers_policies(input)
      end

      def list_response_headers_policies(input : Types::ListResponseHeadersPoliciesRequest) : Types::ListResponseHeadersPoliciesResult
        request = Protocol::RestXml.build_request(Model::LIST_RESPONSE_HEADERS_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListResponseHeadersPoliciesResult, "ListResponseHeadersPolicies")
      end

      # List streaming distributions.

      def list_streaming_distributions(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListStreamingDistributionsResult

        input = Types::ListStreamingDistributionsRequest.new(marker: marker, max_items: max_items)
        list_streaming_distributions(input)
      end

      def list_streaming_distributions(input : Types::ListStreamingDistributionsRequest) : Types::ListStreamingDistributionsResult
        request = Protocol::RestXml.build_request(Model::LIST_STREAMING_DISTRIBUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListStreamingDistributionsResult, "ListStreamingDistributions")
      end

      # List tags for a CloudFront resource. For more information, see Tagging a distribution in the Amazon
      # CloudFront Developer Guide .

      def list_tags_for_resource(
        resource : String
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(resource: resource)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::RestXml.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Lists trust stores.

      def list_trust_stores(
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListTrustStoresResult

        input = Types::ListTrustStoresRequest.new(marker: marker, max_items: max_items)
        list_trust_stores(input)
      end

      def list_trust_stores(input : Types::ListTrustStoresRequest) : Types::ListTrustStoresResult
        request = Protocol::RestXml.build_request(Model::LIST_TRUST_STORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrustStoresResult, "ListTrustStores")
      end

      # List the CloudFront VPC origins in your account.

      def list_vpc_origins(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListVpcOriginsResult

        input = Types::ListVpcOriginsRequest.new(marker: marker, max_items: max_items)
        list_vpc_origins(input)
      end

      def list_vpc_origins(input : Types::ListVpcOriginsRequest) : Types::ListVpcOriginsResult
        request = Protocol::RestXml.build_request(Model::LIST_VPC_ORIGINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListVpcOriginsResult, "ListVpcOrigins")
      end

      # Publishes a connection function.

      def publish_connection_function(
        id : String,
        if_match : String
      ) : Types::PublishConnectionFunctionResult

        input = Types::PublishConnectionFunctionRequest.new(id: id, if_match: if_match)
        publish_connection_function(input)
      end

      def publish_connection_function(input : Types::PublishConnectionFunctionRequest) : Types::PublishConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::PUBLISH_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PublishConnectionFunctionResult, "PublishConnectionFunction")
      end

      # Publishes a CloudFront function by copying the function code from the DEVELOPMENT stage to LIVE .
      # This automatically updates all cache behaviors that are using this function to use the newly
      # published copy in the LIVE stage. When a function is published to the LIVE stage, you can attach the
      # function to a distribution's cache behavior, using the function's Amazon Resource Name (ARN). To
      # publish a function, you must provide the function's name and version ( ETag value). To get these
      # values, you can use ListFunctions and DescribeFunction .

      def publish_function(
        if_match : String,
        name : String
      ) : Types::PublishFunctionResult

        input = Types::PublishFunctionRequest.new(if_match: if_match, name: name)
        publish_function(input)
      end

      def publish_function(input : Types::PublishFunctionRequest) : Types::PublishFunctionResult
        request = Protocol::RestXml.build_request(Model::PUBLISH_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PublishFunctionResult, "PublishFunction")
      end

      # Creates a resource control policy for a given CloudFront resource.

      def put_resource_policy(
        policy_document : String,
        resource_arn : String
      ) : Types::PutResourcePolicyResult

        input = Types::PutResourcePolicyRequest.new(policy_document: policy_document, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResult
        request = Protocol::RestXml.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutResourcePolicyResult, "PutResourcePolicy")
      end

      # Add tags to a CloudFront resource. For more information, see Tagging a distribution in the Amazon
      # CloudFront Developer Guide .

      def tag_resource(
        resource : String,
        tags : Types::Tags
      ) : Nil

        input = Types::TagResourceRequest.new(resource: resource, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::RestXml.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Tests a connection function.

      def test_connection_function(
        connection_object : Bytes,
        id : String,
        if_match : String,
        stage : String? = nil
      ) : Types::TestConnectionFunctionResult

        input = Types::TestConnectionFunctionRequest.new(connection_object: connection_object, id: id, if_match: if_match, stage: stage)
        test_connection_function(input)
      end

      def test_connection_function(input : Types::TestConnectionFunctionRequest) : Types::TestConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::TEST_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::TestConnectionFunctionResult, "TestConnectionFunction")
      end

      # Tests a CloudFront function. To test a function, you provide an event object that represents an HTTP
      # request or response that your CloudFront distribution could receive in production. CloudFront runs
      # the function, passing it the event object that you provided, and returns the function's result (the
      # modified event object) in the response. The response also contains function logs and error messages,
      # if any exist. For more information about testing functions, see Testing functions in the Amazon
      # CloudFront Developer Guide . To test a function, you provide the function's name and version ( ETag
      # value) along with the event object. To get the function's name and version, you can use
      # ListFunctions and DescribeFunction .

      def test_function(
        event_object : Bytes,
        if_match : String,
        name : String,
        stage : String? = nil
      ) : Types::TestFunctionResult

        input = Types::TestFunctionRequest.new(event_object: event_object, if_match: if_match, name: name, stage: stage)
        test_function(input)
      end

      def test_function(input : Types::TestFunctionRequest) : Types::TestFunctionResult
        request = Protocol::RestXml.build_request(Model::TEST_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::TestFunctionResult, "TestFunction")
      end

      # Remove tags from a CloudFront resource. For more information, see Tagging a distribution in the
      # Amazon CloudFront Developer Guide .

      def untag_resource(
        resource : String,
        tag_keys : Types::TagKeys
      ) : Nil

        input = Types::UntagResourceRequest.new(resource: resource, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::RestXml.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Updates an Anycast static IP list.

      def update_anycast_ip_list(
        id : String,
        if_match : String,
        ip_address_type : String? = nil
      ) : Types::UpdateAnycastIpListResult

        input = Types::UpdateAnycastIpListRequest.new(id: id, if_match: if_match, ip_address_type: ip_address_type)
        update_anycast_ip_list(input)
      end

      def update_anycast_ip_list(input : Types::UpdateAnycastIpListRequest) : Types::UpdateAnycastIpListResult
        request = Protocol::RestXml.build_request(Model::UPDATE_ANYCAST_IP_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateAnycastIpListResult, "UpdateAnycastIpList")
      end

      # Updates a cache policy configuration. When you update a cache policy configuration, all the fields
      # are updated with the values provided in the request. You cannot update some fields independent of
      # others. To update a cache policy configuration: Use GetCachePolicyConfig to get the current
      # configuration. Locally modify the fields in the cache policy configuration that you want to update.
      # Call UpdateCachePolicy by providing the entire cache policy configuration, including the fields that
      # you modified and those that you didn't. If your minimum TTL is greater than 0, CloudFront will cache
      # content for at least the duration specified in the cache policy's minimum TTL, even if the
      # Cache-Control: no-cache , no-store , or private directives are present in the origin headers.

      def update_cache_policy(
        cache_policy_config : Types::CachePolicyConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateCachePolicyResult

        input = Types::UpdateCachePolicyRequest.new(cache_policy_config: cache_policy_config, id: id, if_match: if_match)
        update_cache_policy(input)
      end

      def update_cache_policy(input : Types::UpdateCachePolicyRequest) : Types::UpdateCachePolicyResult
        request = Protocol::RestXml.build_request(Model::UPDATE_CACHE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateCachePolicyResult, "UpdateCachePolicy")
      end

      # Update an origin access identity.

      def update_cloud_front_origin_access_identity(
        cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateCloudFrontOriginAccessIdentityResult

        input = Types::UpdateCloudFrontOriginAccessIdentityRequest.new(cloud_front_origin_access_identity_config: cloud_front_origin_access_identity_config, id: id, if_match: if_match)
        update_cloud_front_origin_access_identity(input)
      end

      def update_cloud_front_origin_access_identity(input : Types::UpdateCloudFrontOriginAccessIdentityRequest) : Types::UpdateCloudFrontOriginAccessIdentityResult
        request = Protocol::RestXml.build_request(Model::UPDATE_CLOUD_FRONT_ORIGIN_ACCESS_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateCloudFrontOriginAccessIdentityResult, "UpdateCloudFrontOriginAccessIdentity")
      end

      # Updates a connection function.

      def update_connection_function(
        connection_function_code : Bytes,
        connection_function_config : Types::FunctionConfig,
        id : String,
        if_match : String
      ) : Types::UpdateConnectionFunctionResult

        input = Types::UpdateConnectionFunctionRequest.new(connection_function_code: connection_function_code, connection_function_config: connection_function_config, id: id, if_match: if_match)
        update_connection_function(input)
      end

      def update_connection_function(input : Types::UpdateConnectionFunctionRequest) : Types::UpdateConnectionFunctionResult
        request = Protocol::RestXml.build_request(Model::UPDATE_CONNECTION_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateConnectionFunctionResult, "UpdateConnectionFunction")
      end

      # Updates a connection group.

      def update_connection_group(
        id : String,
        if_match : String,
        anycast_ip_list_id : String? = nil,
        enabled : Bool? = nil,
        ipv6_enabled : Bool? = nil
      ) : Types::UpdateConnectionGroupResult

        input = Types::UpdateConnectionGroupRequest.new(id: id, if_match: if_match, anycast_ip_list_id: anycast_ip_list_id, enabled: enabled, ipv6_enabled: ipv6_enabled)
        update_connection_group(input)
      end

      def update_connection_group(input : Types::UpdateConnectionGroupRequest) : Types::UpdateConnectionGroupResult
        request = Protocol::RestXml.build_request(Model::UPDATE_CONNECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateConnectionGroupResult, "UpdateConnectionGroup")
      end

      # Updates a continuous deployment policy. You can update a continuous deployment policy to enable or
      # disable it, to change the percentage of traffic that it sends to the staging distribution, or to
      # change the staging distribution that it sends traffic to. When you update a continuous deployment
      # policy configuration, all the fields are updated with the values that are provided in the request.
      # You cannot update some fields independent of others. To update a continuous deployment policy
      # configuration: Use GetContinuousDeploymentPolicyConfig to get the current configuration. Locally
      # modify the fields in the continuous deployment policy configuration that you want to update. Use
      # UpdateContinuousDeploymentPolicy , providing the entire continuous deployment policy configuration,
      # including the fields that you modified and those that you didn't.

      def update_continuous_deployment_policy(
        continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateContinuousDeploymentPolicyResult

        input = Types::UpdateContinuousDeploymentPolicyRequest.new(continuous_deployment_policy_config: continuous_deployment_policy_config, id: id, if_match: if_match)
        update_continuous_deployment_policy(input)
      end

      def update_continuous_deployment_policy(input : Types::UpdateContinuousDeploymentPolicyRequest) : Types::UpdateContinuousDeploymentPolicyResult
        request = Protocol::RestXml.build_request(Model::UPDATE_CONTINUOUS_DEPLOYMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateContinuousDeploymentPolicyResult, "UpdateContinuousDeploymentPolicy")
      end

      # Updates the configuration for a CloudFront distribution. The update process includes getting the
      # current distribution configuration, updating it to make your changes, and then submitting an
      # UpdateDistribution request to make the updates. To update a web distribution using the CloudFront
      # API Use GetDistributionConfig to get the current configuration, including the version identifier (
      # ETag ). Update the distribution configuration that was returned in the response. Note the following
      # important requirements and restrictions: You must copy the ETag field value from the response.
      # (You'll use it for the IfMatch parameter in your request.) Then, remove the ETag field from the
      # distribution configuration. You can't change the value of CallerReference . Submit an
      # UpdateDistribution request, providing the updated distribution configuration. The new configuration
      # replaces the existing configuration. The values that you specify in an UpdateDistribution request
      # are not merged into your existing configuration. Make sure to include all fields: the ones that you
      # modified and also the ones that you didn't.

      def update_distribution(
        distribution_config : Types::DistributionConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateDistributionResult

        input = Types::UpdateDistributionRequest.new(distribution_config: distribution_config, id: id, if_match: if_match)
        update_distribution(input)
      end

      def update_distribution(input : Types::UpdateDistributionRequest) : Types::UpdateDistributionResult
        request = Protocol::RestXml.build_request(Model::UPDATE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateDistributionResult, "UpdateDistribution")
      end

      # Updates a distribution tenant.

      def update_distribution_tenant(
        id : String,
        if_match : String,
        connection_group_id : String? = nil,
        customizations : Types::Customizations? = nil,
        distribution_id : String? = nil,
        domains : Array(Types::DomainItem)? = nil,
        enabled : Bool? = nil,
        managed_certificate_request : Types::ManagedCertificateRequest? = nil,
        parameters : Array(Types::Parameter)? = nil
      ) : Types::UpdateDistributionTenantResult

        input = Types::UpdateDistributionTenantRequest.new(id: id, if_match: if_match, connection_group_id: connection_group_id, customizations: customizations, distribution_id: distribution_id, domains: domains, enabled: enabled, managed_certificate_request: managed_certificate_request, parameters: parameters)
        update_distribution_tenant(input)
      end

      def update_distribution_tenant(input : Types::UpdateDistributionTenantRequest) : Types::UpdateDistributionTenantResult
        request = Protocol::RestXml.build_request(Model::UPDATE_DISTRIBUTION_TENANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateDistributionTenantResult, "UpdateDistributionTenant")
      end

      # Copies the staging distribution's configuration to its corresponding primary distribution. The
      # primary distribution retains its Aliases (also known as alternate domain names or CNAMEs) and
      # ContinuousDeploymentPolicyId value, but otherwise its configuration is overwritten to match the
      # staging distribution. You can use this operation in a continuous deployment workflow after you have
      # tested configuration changes on the staging distribution. After using a continuous deployment policy
      # to move a portion of your domain name's traffic to the staging distribution and verifying that it
      # works as intended, you can use this operation to copy the staging distribution's configuration to
      # the primary distribution. This action will disable the continuous deployment policy and move your
      # domain's traffic back to the primary distribution. This API operation requires the following IAM
      # permissions: GetDistribution UpdateDistribution

      def update_distribution_with_staging_config(
        id : String,
        if_match : String? = nil,
        staging_distribution_id : String? = nil
      ) : Types::UpdateDistributionWithStagingConfigResult

        input = Types::UpdateDistributionWithStagingConfigRequest.new(id: id, if_match: if_match, staging_distribution_id: staging_distribution_id)
        update_distribution_with_staging_config(input)
      end

      def update_distribution_with_staging_config(input : Types::UpdateDistributionWithStagingConfigRequest) : Types::UpdateDistributionWithStagingConfigResult
        request = Protocol::RestXml.build_request(Model::UPDATE_DISTRIBUTION_WITH_STAGING_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateDistributionWithStagingConfigResult, "UpdateDistributionWithStagingConfig")
      end

      # We recommend that you use the UpdateDomainAssociation API operation to move a domain association, as
      # it supports both standard distributions and distribution tenants. AssociateAlias performs similar
      # checks but only supports standard distributions. Moves a domain from its current standard
      # distribution or distribution tenant to another one. You must first disable the source distribution
      # (standard distribution or distribution tenant) and then separately call this operation to move the
      # domain to another target distribution (standard distribution or distribution tenant). To use this
      # operation, specify the domain and the ID of the target resource (standard distribution or
      # distribution tenant). For more information, including how to set up the target resource,
      # prerequisites that you must complete, and other restrictions, see Moving an alternate domain name to
      # a different standard distribution or distribution tenant in the Amazon CloudFront Developer Guide .

      def update_domain_association(
        domain : String,
        target_resource : Types::DistributionResourceId,
        if_match : String? = nil
      ) : Types::UpdateDomainAssociationResult

        input = Types::UpdateDomainAssociationRequest.new(domain: domain, target_resource: target_resource, if_match: if_match)
        update_domain_association(input)
      end

      def update_domain_association(input : Types::UpdateDomainAssociationRequest) : Types::UpdateDomainAssociationResult
        request = Protocol::RestXml.build_request(Model::UPDATE_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateDomainAssociationResult, "UpdateDomainAssociation")
      end

      # Update a field-level encryption configuration.

      def update_field_level_encryption_config(
        field_level_encryption_config : Types::FieldLevelEncryptionConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateFieldLevelEncryptionConfigResult

        input = Types::UpdateFieldLevelEncryptionConfigRequest.new(field_level_encryption_config: field_level_encryption_config, id: id, if_match: if_match)
        update_field_level_encryption_config(input)
      end

      def update_field_level_encryption_config(input : Types::UpdateFieldLevelEncryptionConfigRequest) : Types::UpdateFieldLevelEncryptionConfigResult
        request = Protocol::RestXml.build_request(Model::UPDATE_FIELD_LEVEL_ENCRYPTION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateFieldLevelEncryptionConfigResult, "UpdateFieldLevelEncryptionConfig")
      end

      # Update a field-level encryption profile.

      def update_field_level_encryption_profile(
        field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig,
        id : String,
        if_match : String? = nil
      ) : Types::UpdateFieldLevelEncryptionProfileResult

        input = Types::UpdateFieldLevelEncryptionProfileRequest.new(field_level_encryption_profile_config: field_level_encryption_profile_config, id: id, if_match: if_match)
        update_field_level_encryption_profile(input)
      end

      def update_field_level_encryption_profile(input : Types::UpdateFieldLevelEncryptionProfileRequest) : Types::UpdateFieldLevelEncryptionProfileResult
        request = Protocol::RestXml.build_request(Model::UPDATE_FIELD_LEVEL_ENCRYPTION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateFieldLevelEncryptionProfileResult, "UpdateFieldLevelEncryptionProfile")
      end

      # Updates a CloudFront function. You can update a function's code or the comment that describes the
      # function. You cannot update a function's name. To update a function, you provide the function's name
      # and version ( ETag value) along with the updated function code. To get the name and version, you can
      # use ListFunctions and DescribeFunction .

      def update_function(
        function_code : Bytes,
        function_config : Types::FunctionConfig,
        if_match : String,
        name : String
      ) : Types::UpdateFunctionResult

        input = Types::UpdateFunctionRequest.new(function_code: function_code, function_config: function_config, if_match: if_match, name: name)
        update_function(input)
      end

      def update_function(input : Types::UpdateFunctionRequest) : Types::UpdateFunctionResult
        request = Protocol::RestXml.build_request(Model::UPDATE_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateFunctionResult, "UpdateFunction")
      end

      # Updates a key group. When you update a key group, all the fields are updated with the values
      # provided in the request. You cannot update some fields independent of others. To update a key group:
      # Get the current key group with GetKeyGroup or GetKeyGroupConfig . Locally modify the fields in the
      # key group that you want to update. For example, add or remove public key IDs. Call UpdateKeyGroup
      # with the entire key group object, including the fields that you modified and those that you didn't.

      def update_key_group(
        id : String,
        key_group_config : Types::KeyGroupConfig,
        if_match : String? = nil
      ) : Types::UpdateKeyGroupResult

        input = Types::UpdateKeyGroupRequest.new(id: id, key_group_config: key_group_config, if_match: if_match)
        update_key_group(input)
      end

      def update_key_group(input : Types::UpdateKeyGroupRequest) : Types::UpdateKeyGroupResult
        request = Protocol::RestXml.build_request(Model::UPDATE_KEY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateKeyGroupResult, "UpdateKeyGroup")
      end

      # Specifies the key value store to update.

      def update_key_value_store(
        comment : String,
        if_match : String,
        name : String
      ) : Types::UpdateKeyValueStoreResult

        input = Types::UpdateKeyValueStoreRequest.new(comment: comment, if_match: if_match, name: name)
        update_key_value_store(input)
      end

      def update_key_value_store(input : Types::UpdateKeyValueStoreRequest) : Types::UpdateKeyValueStoreResult
        request = Protocol::RestXml.build_request(Model::UPDATE_KEY_VALUE_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateKeyValueStoreResult, "UpdateKeyValueStore")
      end

      # Updates a CloudFront origin access control.

      def update_origin_access_control(
        id : String,
        origin_access_control_config : Types::OriginAccessControlConfig,
        if_match : String? = nil
      ) : Types::UpdateOriginAccessControlResult

        input = Types::UpdateOriginAccessControlRequest.new(id: id, origin_access_control_config: origin_access_control_config, if_match: if_match)
        update_origin_access_control(input)
      end

      def update_origin_access_control(input : Types::UpdateOriginAccessControlRequest) : Types::UpdateOriginAccessControlResult
        request = Protocol::RestXml.build_request(Model::UPDATE_ORIGIN_ACCESS_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateOriginAccessControlResult, "UpdateOriginAccessControl")
      end

      # Updates an origin request policy configuration. When you update an origin request policy
      # configuration, all the fields are updated with the values provided in the request. You cannot update
      # some fields independent of others. To update an origin request policy configuration: Use
      # GetOriginRequestPolicyConfig to get the current configuration. Locally modify the fields in the
      # origin request policy configuration that you want to update. Call UpdateOriginRequestPolicy by
      # providing the entire origin request policy configuration, including the fields that you modified and
      # those that you didn't.

      def update_origin_request_policy(
        id : String,
        origin_request_policy_config : Types::OriginRequestPolicyConfig,
        if_match : String? = nil
      ) : Types::UpdateOriginRequestPolicyResult

        input = Types::UpdateOriginRequestPolicyRequest.new(id: id, origin_request_policy_config: origin_request_policy_config, if_match: if_match)
        update_origin_request_policy(input)
      end

      def update_origin_request_policy(input : Types::UpdateOriginRequestPolicyRequest) : Types::UpdateOriginRequestPolicyResult
        request = Protocol::RestXml.build_request(Model::UPDATE_ORIGIN_REQUEST_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateOriginRequestPolicyResult, "UpdateOriginRequestPolicy")
      end

      # Update public key information. Note that the only value you can change is the comment.

      def update_public_key(
        id : String,
        public_key_config : Types::PublicKeyConfig,
        if_match : String? = nil
      ) : Types::UpdatePublicKeyResult

        input = Types::UpdatePublicKeyRequest.new(id: id, public_key_config: public_key_config, if_match: if_match)
        update_public_key(input)
      end

      def update_public_key(input : Types::UpdatePublicKeyRequest) : Types::UpdatePublicKeyResult
        request = Protocol::RestXml.build_request(Model::UPDATE_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdatePublicKeyResult, "UpdatePublicKey")
      end

      # Updates a real-time log configuration. When you update a real-time log configuration, all the
      # parameters are updated with the values provided in the request. You cannot update some parameters
      # independent of others. To update a real-time log configuration: Call GetRealtimeLogConfig to get the
      # current real-time log configuration. Locally modify the parameters in the real-time log
      # configuration that you want to update. Call this API ( UpdateRealtimeLogConfig ) by providing the
      # entire real-time log configuration, including the parameters that you modified and those that you
      # didn't. You cannot update a real-time log configuration's Name or ARN .

      def update_realtime_log_config(
        arn : String? = nil,
        end_points : Array(Types::EndPoint)? = nil,
        fields : Array(String)? = nil,
        name : String? = nil,
        sampling_rate : Int64? = nil
      ) : Types::UpdateRealtimeLogConfigResult

        input = Types::UpdateRealtimeLogConfigRequest.new(arn: arn, end_points: end_points, fields: fields, name: name, sampling_rate: sampling_rate)
        update_realtime_log_config(input)
      end

      def update_realtime_log_config(input : Types::UpdateRealtimeLogConfigRequest) : Types::UpdateRealtimeLogConfigResult
        request = Protocol::RestXml.build_request(Model::UPDATE_REALTIME_LOG_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateRealtimeLogConfigResult, "UpdateRealtimeLogConfig")
      end

      # Updates a response headers policy. When you update a response headers policy, the entire policy is
      # replaced. You cannot update some policy fields independent of others. To update a response headers
      # policy configuration: Use GetResponseHeadersPolicyConfig to get the current policy's configuration.
      # Modify the fields in the response headers policy configuration that you want to update. Call
      # UpdateResponseHeadersPolicy , providing the entire response headers policy configuration, including
      # the fields that you modified and those that you didn't.

      def update_response_headers_policy(
        id : String,
        response_headers_policy_config : Types::ResponseHeadersPolicyConfig,
        if_match : String? = nil
      ) : Types::UpdateResponseHeadersPolicyResult

        input = Types::UpdateResponseHeadersPolicyRequest.new(id: id, response_headers_policy_config: response_headers_policy_config, if_match: if_match)
        update_response_headers_policy(input)
      end

      def update_response_headers_policy(input : Types::UpdateResponseHeadersPolicyRequest) : Types::UpdateResponseHeadersPolicyResult
        request = Protocol::RestXml.build_request(Model::UPDATE_RESPONSE_HEADERS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateResponseHeadersPolicyResult, "UpdateResponseHeadersPolicy")
      end

      # Update a streaming distribution.

      def update_streaming_distribution(
        id : String,
        streaming_distribution_config : Types::StreamingDistributionConfig,
        if_match : String? = nil
      ) : Types::UpdateStreamingDistributionResult

        input = Types::UpdateStreamingDistributionRequest.new(id: id, streaming_distribution_config: streaming_distribution_config, if_match: if_match)
        update_streaming_distribution(input)
      end

      def update_streaming_distribution(input : Types::UpdateStreamingDistributionRequest) : Types::UpdateStreamingDistributionResult
        request = Protocol::RestXml.build_request(Model::UPDATE_STREAMING_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateStreamingDistributionResult, "UpdateStreamingDistribution")
      end

      # Updates a trust store.

      def update_trust_store(
        ca_certificates_bundle_source : Types::CaCertificatesBundleSource,
        id : String,
        if_match : String
      ) : Types::UpdateTrustStoreResult

        input = Types::UpdateTrustStoreRequest.new(ca_certificates_bundle_source: ca_certificates_bundle_source, id: id, if_match: if_match)
        update_trust_store(input)
      end

      def update_trust_store(input : Types::UpdateTrustStoreRequest) : Types::UpdateTrustStoreResult
        request = Protocol::RestXml.build_request(Model::UPDATE_TRUST_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateTrustStoreResult, "UpdateTrustStore")
      end

      # Update an Amazon CloudFront VPC origin in your account.

      def update_vpc_origin(
        id : String,
        if_match : String,
        vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig
      ) : Types::UpdateVpcOriginResult

        input = Types::UpdateVpcOriginRequest.new(id: id, if_match: if_match, vpc_origin_endpoint_config: vpc_origin_endpoint_config)
        update_vpc_origin(input)
      end

      def update_vpc_origin(input : Types::UpdateVpcOriginRequest) : Types::UpdateVpcOriginResult
        request = Protocol::RestXml.build_request(Model::UPDATE_VPC_ORIGIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateVpcOriginResult, "UpdateVpcOrigin")
      end

      # Verify the DNS configuration for your domain names. This API operation checks whether your domain
      # name points to the correct routing endpoint of the connection group, such as
      # d111111abcdef8.cloudfront.net. You can use this API operation to troubleshoot and resolve DNS
      # configuration issues.

      def verify_dns_configuration(
        identifier : String,
        domain : String? = nil
      ) : Types::VerifyDnsConfigurationResult

        input = Types::VerifyDnsConfigurationRequest.new(identifier: identifier, domain: domain)
        verify_dns_configuration(input)
      end

      def verify_dns_configuration(input : Types::VerifyDnsConfigurationRequest) : Types::VerifyDnsConfigurationResult
        request = Protocol::RestXml.build_request(Model::VERIFY_DNS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::VerifyDnsConfigurationResult, "VerifyDnsConfiguration")
      end
    end
  end
end
