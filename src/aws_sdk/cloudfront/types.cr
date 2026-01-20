require "json"
require "time"

module AwsSdk
  module CloudFront
    module Types

      # Access denied.

      struct AccessDenied
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of key groups, and the public keys in each key group, that CloudFront can use to verify the
      # signatures of signed URLs and signed cookies.

      struct ActiveTrustedKeyGroups
        include JSON::Serializable

        # This field is true if any of the key groups have public keys that CloudFront can use to verify the
        # signatures of signed URLs and signed cookies. If not, this field is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The number of key groups in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of key groups, including the identifiers of the public keys in each key group that CloudFront
        # can use to verify the signatures of signed URLs and signed cookies.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::KGKeyPairIds)?

        def initialize(
          @enabled : Bool,
          @quantity : Int32,
          @items : Array(Types::KGKeyPairIds)? = nil
        )
        end
      end

      # A list of Amazon Web Services accounts and the active CloudFront key pairs in each account that
      # CloudFront can use to verify the signatures of signed URLs and signed cookies.

      struct ActiveTrustedSigners
        include JSON::Serializable

        # This field is true if any of the Amazon Web Services accounts in the list are configured as trusted
        # signers. If not, this field is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The number of Amazon Web Services accounts in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of Amazon Web Services accounts and the identifiers of active CloudFront key pairs in each
        # account that CloudFront can use to verify the signatures of signed URLs and signed cookies.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Signer)?

        def initialize(
          @enabled : Bool,
          @quantity : Int32,
          @items : Array(Types::Signer)? = nil
        )
        end
      end

      # Amazon Web Services services in China customers must file for an Internet Content Provider (ICP)
      # recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME,
      # that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs
      # associated with distributions. The status is returned in the CloudFront response; you can't
      # configure it yourself. For more information about ICP recordals, see Signup, Accounts, and
      # Credentials in Getting Started with Amazon Web Services services in China .

      struct AliasICPRecordal
        include JSON::Serializable

        # A domain name associated with a distribution.

        @[JSON::Field(key: "CNAME")]
        getter cname : String?

        # The Internet Content Provider (ICP) recordal status for a CNAME. The ICPRecordalStatus is set to
        # APPROVED for all CNAMEs (aliases) in Amazon Web Services Regions outside of China. The status values
        # returned are the following: APPROVED indicates that the associated CNAME has a valid ICP recordal
        # number. Multiple CNAMEs can be associated with a distribution, and CNAMEs can correspond to
        # different ICP recordals. To be marked as APPROVED, that is, valid to use with the China Regions, a
        # CNAME must have one ICP recordal number associated with it. SUSPENDED indicates that the associated
        # CNAME does not have a valid ICP recordal number. PENDING indicates that CloudFront can't determine
        # the ICP recordal status of the CNAME associated with the distribution because there was an error in
        # trying to determine the status. You can try again to see if the error is resolved in which case
        # CloudFront returns an APPROVED or SUSPENDED status.

        @[JSON::Field(key: "ICPRecordalStatus")]
        getter icp_recordal_status : String?

        def initialize(
          @cname : String? = nil,
          @icp_recordal_status : String? = nil
        )
        end
      end

      # A complex type that contains information about CNAMEs (alternate domain names), if any, for this
      # distribution.

      struct Aliases
        include JSON::Serializable

        # The number of CNAME aliases, if any, that you want to associate with this distribution.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains the CNAME aliases, if any, that you want to associate with this
        # distribution.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # A complex type that controls which HTTP methods CloudFront processes and forwards to your Amazon S3
      # bucket or your custom origin. There are three choices: CloudFront forwards only GET and HEAD
      # requests. CloudFront forwards only GET , HEAD , and OPTIONS requests. CloudFront forwards GET, HEAD,
      # OPTIONS, PUT, PATCH, POST , and DELETE requests. If you pick the third choice, you may need to
      # restrict access to your Amazon S3 bucket or to your custom origin so users can't perform operations
      # that you don't want them to. For example, you might not want users to have permissions to delete
      # objects from your origin.

      struct AllowedMethods
        include JSON::Serializable

        # A complex type that contains the HTTP methods that you want CloudFront to process and forward to
        # your origin.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of HTTP methods that you want CloudFront to forward to your origin. Valid values are 2
        # (for GET and HEAD requests), 3 (for GET , HEAD , and OPTIONS requests) and 7 (for GET, HEAD,
        # OPTIONS, PUT, PATCH, POST , and DELETE requests).

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32


        @[JSON::Field(key: "CachedMethods")]
        getter cached_methods : Types::CachedMethods?

        def initialize(
          @items : Array(String),
          @quantity : Int32,
          @cached_methods : Types::CachedMethods? = nil
        )
        end
      end

      # An Anycast static IP list. For more information, see Request Anycast static IPs to use for
      # allowlisting in the Amazon CloudFront Developer Guide .

      struct AnycastIpList
        include JSON::Serializable

        # The static IP addresses that are allocated to the Anycast static IP list.

        @[JSON::Field(key: "AnycastIps")]
        getter anycast_ips : Array(String)

        # The Amazon Resource Name (ARN) of the Anycast static IP list.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The number of IP addresses in the Anycast static IP list.

        @[JSON::Field(key: "IpCount")]
        getter ip_count : Int32

        # The last time the Anycast static IP list was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The name of the Anycast static IP list.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the Anycast static IP list. Valid values: Deployed , Deploying , or Failed .

        @[JSON::Field(key: "Status")]
        getter status : String

        # The IP address type for the Anycast static IP list.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The IPAM configuration for the Anycast static IP list, that contains the quantity and list of IPAM
        # CIDR configurations.

        @[JSON::Field(key: "IpamConfig")]
        getter ipam_config : Types::IpamConfig?

        def initialize(
          @anycast_ips : Array(String),
          @arn : String,
          @id : String,
          @ip_count : Int32,
          @last_modified_time : Time,
          @name : String,
          @status : String,
          @ip_address_type : String? = nil,
          @ipam_config : Types::IpamConfig? = nil
        )
        end
      end

      # The Anycast static IP list collection.

      struct AnycastIpListCollection
        include JSON::Serializable

        # If there are more items in the list collection than are in this response, this value is true .

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of Anycast static IP list collections that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The quantity of Anycast static IP lists in the collection.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Items in the Anycast static IP list collection. Each item is of the AnycastIpListSummary structure
        # type.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::AnycastIpListSummary)?

        # Indicates the next page of the Anycast static IP list collection. To get the next page of the list,
        # use this value in the Marker field of your request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::AnycastIpListSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # An abbreviated version of the AnycastIpList structure. Omits the allocated static IP addresses (
      # AnycastIpList$AnycastIps ).

      struct AnycastIpListSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Anycast static IP list.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The number of IP addresses in the Anycast static IP list.

        @[JSON::Field(key: "IpCount")]
        getter ip_count : Int32

        # The last time the Anycast static IP list was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The name of the Anycast static IP list.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The deployment status of the Anycast static IP list. Valid values: Deployed, Deploying, or Failed.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The current version (ETag value) of the Anycast static IP list.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The IP address type for the Anycast static IP list.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The IPAM configuration for the Anycast static IP list, that contains the quantity and list of IPAM
        # CIDR configurations.

        @[JSON::Field(key: "IpamConfig")]
        getter ipam_config : Types::IpamConfig?

        def initialize(
          @arn : String,
          @id : String,
          @ip_count : Int32,
          @last_modified_time : Time,
          @name : String,
          @status : String,
          @e_tag : String? = nil,
          @ip_address_type : String? = nil,
          @ipam_config : Types::IpamConfig? = nil
        )
        end
      end


      struct AssociateAliasRequest
        include JSON::Serializable

        # The alias (also known as a CNAME) to add to the target standard distribution.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The ID of the standard distribution that you're associating the alias with.

        @[JSON::Field(key: "TargetDistributionId")]
        getter target_distribution_id : String

        def initialize(
          @alias : String,
          @target_distribution_id : String
        )
        end
      end


      struct AssociateDistributionTenantWebACLRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the WAF web ACL to associate.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String

        # The current ETag of the distribution tenant. This value is returned in the response of the
        # GetDistributionTenant API operation.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @web_acl_arn : String,
          @if_match : String? = nil
        )
        end
      end


      struct AssociateDistributionTenantWebACLResult
        include JSON::Serializable

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ARN of the WAF web ACL that you associated with the distribution tenant.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @e_tag : String? = nil,
          @id : String? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end


      struct AssociateDistributionWebACLRequest
        include JSON::Serializable

        # The ID of the distribution.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the WAF web ACL to associate.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String

        # The value of the ETag header that you received when retrieving the distribution that you're
        # associating with the WAF web ACL.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @web_acl_arn : String,
          @if_match : String? = nil
        )
        end
      end


      struct AssociateDistributionWebACLResult
        include JSON::Serializable

        # The current version of the distribution.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The ID of the distribution.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ARN of the WAF web ACL that you associated with the distribution.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @e_tag : String? = nil,
          @id : String? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end

      # Invalidation batch specified is too large.

      struct BatchTooLarge
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CNAME specified is already defined for CloudFront.

      struct CNAMEAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CA certificates bundle location in Amazon S3.

      struct CaCertificatesBundleS3Location
        include JSON::Serializable

        # The S3 bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The location's key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The location's Region.

        @[JSON::Field(key: "Region")]
        getter region : String

        # The location's version.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @bucket : String,
          @key : String,
          @region : String,
          @version : String? = nil
        )
        end
      end

      # A CA certificates bundle source.

      struct CaCertificatesBundleSource
        include JSON::Serializable

        # The CA certificates bundle location in Amazon S3.

        @[JSON::Field(key: "CaCertificatesBundleS3Location")]
        getter ca_certificates_bundle_s3_location : Types::CaCertificatesBundleS3Location?

        def initialize(
          @ca_certificates_bundle_s3_location : Types::CaCertificatesBundleS3Location? = nil
        )
        end
      end

      # A complex type that describes how CloudFront processes requests. You must create at least as many
      # cache behaviors (including the default cache behavior) as you have origins if you want CloudFront to
      # serve objects from all of the origins. Each cache behavior specifies the one origin from which you
      # want CloudFront to get objects. If you have two origins and only the default cache behavior, the
      # default cache behavior will cause CloudFront to get objects from one of the origins, but the other
      # origin is never used. For the current quota (formerly known as limit) on the number of cache
      # behaviors that you can add to a distribution, see Quotas in the Amazon CloudFront Developer Guide .
      # If you don't want to specify any cache behaviors, include only an empty CacheBehaviors element.
      # Don't specify an empty individual CacheBehavior element, because this is invalid. For more
      # information, see CacheBehaviors . To delete all cache behaviors in an existing distribution, update
      # the distribution configuration and include only an empty CacheBehaviors element. To add, change, or
      # remove one or more cache behaviors, update the distribution configuration and specify all of the
      # cache behaviors that you want to include in the updated distribution. If your minimum TTL is greater
      # than 0, CloudFront will cache content for at least the duration specified in the cache policy's
      # minimum TTL, even if the Cache-Control: no-cache , no-store , or private directives are present in
      # the origin headers. For more information about cache behaviors, see Cache Behavior Settings in the
      # Amazon CloudFront Developer Guide .

      struct CacheBehavior
        include JSON::Serializable

        # The pattern (for example, images/*.jpg ) that specifies which requests to apply the behavior to.
        # When CloudFront receives a viewer request, the requested path is compared with path patterns in the
        # order in which cache behaviors are listed in the distribution. You can optionally include a slash (
        # / ) at the beginning of the path pattern. For example, /images/*.jpg . CloudFront behavior is the
        # same with or without the leading / . The path pattern for the default cache behavior is * and cannot
        # be changed. If the request for an object does not match the path pattern for any cache behaviors,
        # CloudFront applies the behavior in the default cache behavior. For more information, see Path
        # Pattern in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "PathPattern")]
        getter path_pattern : String

        # The value of ID for the origin that you want CloudFront to route requests to when they match this
        # cache behavior.

        @[JSON::Field(key: "TargetOriginId")]
        getter target_origin_id : String

        # The protocol that viewers can use to access the files in the origin specified by TargetOriginId when
        # a request matches the path pattern in PathPattern . You can specify the following options: allow-all
        # : Viewers can use HTTP or HTTPS. redirect-to-https : If a viewer submits an HTTP request, CloudFront
        # returns an HTTP status code of 301 (Moved Permanently) to the viewer along with the HTTPS URL. The
        # viewer then resubmits the request using the new URL. https-only : If a viewer sends an HTTP request,
        # CloudFront returns an HTTP status code of 403 (Forbidden). For more information about requiring the
        # HTTPS protocol, see Requiring HTTPS Between Viewers and CloudFront in the Amazon CloudFront
        # Developer Guide . The only way to guarantee that viewers retrieve an object that was fetched from
        # the origin using HTTPS is never to use any other protocol to fetch the object. If you have recently
        # changed from HTTP to HTTPS, we recommend that you clear your objects' cache because cached objects
        # are protocol agnostic. That means that an edge location will return an object from the cache
        # regardless of whether the current request protocol matches the protocol used previously. For more
        # information, see Managing Cache Expiration in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "ViewerProtocolPolicy")]
        getter viewer_protocol_policy : String


        @[JSON::Field(key: "AllowedMethods")]
        getter allowed_methods : Types::AllowedMethods?

        # The unique identifier of the cache policy that is attached to this cache behavior. For more
        # information, see Creating cache policies or Using the managed cache policies in the Amazon
        # CloudFront Developer Guide . A CacheBehavior must include either a CachePolicyId or ForwardedValues
        # . We recommend that you use a CachePolicyId .

        @[JSON::Field(key: "CachePolicyId")]
        getter cache_policy_id : String?

        # Whether you want CloudFront to automatically compress certain files for this cache behavior. If so,
        # specify true; if not, specify false. For more information, see Serving Compressed Files in the
        # Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Compress")]
        getter compress : Bool?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # DefaultTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The default
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. The value that you specify
        # applies only when your origin does not add HTTP headers such as Cache-Control max-age ,
        # Cache-Control s-maxage , and Expires to objects. For more information, see Managing How Long Content
        # Stays in an Edge Cache (Expiration) in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "DefaultTTL")]
        getter default_ttl : Int64?

        # The value of ID for the field-level encryption configuration that you want CloudFront to use for
        # encrypting specific fields of data for this cache behavior.

        @[JSON::Field(key: "FieldLevelEncryptionId")]
        getter field_level_encryption_id : String?

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. For more information, see Working with policies in the Amazon CloudFront
        # Developer Guide . If you want to include values in the cache key, use a cache policy. For more
        # information, see Creating cache policies or Using the managed cache policies in the Amazon
        # CloudFront Developer Guide . If you want to send values to the origin but not include them in the
        # cache key, use an origin request policy. For more information, see Creating origin request policies
        # or Using the managed origin request policies in the Amazon CloudFront Developer Guide . A
        # CacheBehavior must include either a CachePolicyId or ForwardedValues . We recommend that you use a
        # CachePolicyId . A complex type that specifies how CloudFront handles query strings, cookies, and
        # HTTP headers.

        @[JSON::Field(key: "ForwardedValues")]
        getter forwarded_values : Types::ForwardedValues?

        # A list of CloudFront functions that are associated with this cache behavior. CloudFront functions
        # must be published to the LIVE stage to associate them with a cache behavior.

        @[JSON::Field(key: "FunctionAssociations")]
        getter function_associations : Types::FunctionAssociations?

        # The gRPC configuration for your cache behavior.

        @[JSON::Field(key: "GrpcConfig")]
        getter grpc_config : Types::GrpcConfig?

        # A complex type that contains zero or more Lambda@Edge function associations for a cache behavior.

        @[JSON::Field(key: "LambdaFunctionAssociations")]
        getter lambda_function_associations : Types::LambdaFunctionAssociations?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # MaxTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The maximum
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. The value that you specify
        # applies only when your origin adds HTTP headers such as Cache-Control max-age , Cache-Control
        # s-maxage , and Expires to objects. For more information, see Managing How Long Content Stays in an
        # Edge Cache (Expiration) in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "MaxTTL")]
        getter max_ttl : Int64?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # MinTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The minimum
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. For more information, see
        # Managing How Long Content Stays in an Edge Cache (Expiration) in the Amazon CloudFront Developer
        # Guide . You must specify 0 for MinTTL if you configure CloudFront to forward all headers to your
        # origin (under Headers , if you specify 1 for Quantity and * for Name ).

        @[JSON::Field(key: "MinTTL")]
        getter min_ttl : Int64?

        # The unique identifier of the origin request policy that is attached to this cache behavior. For more
        # information, see Creating origin request policies or Using the managed origin request policies in
        # the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginRequestPolicyId")]
        getter origin_request_policy_id : String?

        # The Amazon Resource Name (ARN) of the real-time log configuration that is attached to this cache
        # behavior. For more information, see Real-time logs in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "RealtimeLogConfigArn")]
        getter realtime_log_config_arn : String?

        # The identifier for a response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicyId")]
        getter response_headers_policy_id : String?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . Indicates whether you want to distribute media files in
        # the Microsoft Smooth Streaming format using the origin that is associated with this cache behavior.
        # If so, specify true ; if not, specify false . If you specify true for SmoothStreaming , you can
        # still distribute other content using this cache behavior if the content matches the value of
        # PathPattern .

        @[JSON::Field(key: "SmoothStreaming")]
        getter smooth_streaming : Bool?

        # A list of key groups that CloudFront can use to validate signed URLs or signed cookies. When a cache
        # behavior contains trusted key groups, CloudFront requires signed URLs or signed cookies for all
        # requests that match the cache behavior. The URLs or cookies must be signed with a private key whose
        # corresponding public key is in the key group. The signed URL or cookie contains information about
        # which public key CloudFront should use to verify the signature. For more information, see Serving
        # private content in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedKeyGroups")]
        getter trusted_key_groups : Types::TrustedKeyGroups?

        # We recommend using TrustedKeyGroups instead of TrustedSigners . This field only supports standard
        # distributions. You can't specify this field for multi-tenant distributions. For more information,
        # see Unsupported features for SaaS Manager for Amazon CloudFront in the Amazon CloudFront Developer
        # Guide . A list of Amazon Web Services account IDs whose public keys CloudFront can use to validate
        # signed URLs or signed cookies. When a cache behavior contains trusted signers, CloudFront requires
        # signed URLs or signed cookies for all requests that match the cache behavior. The URLs or cookies
        # must be signed with the private key of a CloudFront key pair in the trusted signer's Amazon Web
        # Services account. The signed URL or cookie contains information about which public key CloudFront
        # should use to verify the signature. For more information, see Serving private content in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedSigners")]
        getter trusted_signers : Types::TrustedSigners?

        def initialize(
          @path_pattern : String,
          @target_origin_id : String,
          @viewer_protocol_policy : String,
          @allowed_methods : Types::AllowedMethods? = nil,
          @cache_policy_id : String? = nil,
          @compress : Bool? = nil,
          @default_ttl : Int64? = nil,
          @field_level_encryption_id : String? = nil,
          @forwarded_values : Types::ForwardedValues? = nil,
          @function_associations : Types::FunctionAssociations? = nil,
          @grpc_config : Types::GrpcConfig? = nil,
          @lambda_function_associations : Types::LambdaFunctionAssociations? = nil,
          @max_ttl : Int64? = nil,
          @min_ttl : Int64? = nil,
          @origin_request_policy_id : String? = nil,
          @realtime_log_config_arn : String? = nil,
          @response_headers_policy_id : String? = nil,
          @smooth_streaming : Bool? = nil,
          @trusted_key_groups : Types::TrustedKeyGroups? = nil,
          @trusted_signers : Types::TrustedSigners? = nil
        )
        end
      end

      # A complex type that contains zero or more CacheBehavior elements.

      struct CacheBehaviors
        include JSON::Serializable

        # The number of cache behaviors for this distribution.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Optional: A complex type that contains cache behaviors for this distribution. If Quantity is 0 , you
        # can omit Items .

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CacheBehavior)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::CacheBehavior)? = nil
        )
        end
      end

      # A cache policy. When it's attached to a cache behavior, the cache policy determines the following:
      # The values that CloudFront includes in the cache key. These values can include HTTP headers,
      # cookies, and URL query strings. CloudFront uses the cache key to find an object in its cache that it
      # can return to the viewer. The default, minimum, and maximum time to live (TTL) values that you want
      # objects to stay in the CloudFront cache. The headers, cookies, and query strings that are included
      # in the cache key are also included in requests that CloudFront sends to the origin. CloudFront sends
      # a request when it can't find a valid object in its cache that matches the request's cache key. If
      # you want to send values to the origin but not include them in the cache key, use OriginRequestPolicy
      # .

      struct CachePolicy
        include JSON::Serializable

        # The cache policy configuration.

        @[JSON::Field(key: "CachePolicyConfig")]
        getter cache_policy_config : Types::CachePolicyConfig

        # The unique identifier for the cache policy.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the cache policy was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @cache_policy_config : Types::CachePolicyConfig,
          @id : String,
          @last_modified_time : Time
        )
        end
      end

      # A cache policy with this name already exists. You must provide a unique name. To modify an existing
      # cache policy, use UpdateCachePolicy .

      struct CachePolicyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A cache policy configuration. This configuration determines the following: The values that
      # CloudFront includes in the cache key. These values can include HTTP headers, cookies, and URL query
      # strings. CloudFront uses the cache key to find an object in its cache that it can return to the
      # viewer. The default, minimum, and maximum time to live (TTL) values that you want objects to stay in
      # the CloudFront cache. If your minimum TTL is greater than 0, CloudFront will cache content for at
      # least the duration specified in the cache policy's minimum TTL, even if the Cache-Control: no-cache
      # , no-store , or private directives are present in the origin headers. The headers, cookies, and
      # query strings that are included in the cache key are also included in requests that CloudFront sends
      # to the origin. CloudFront sends a request when it can't find a valid object in its cache that
      # matches the request's cache key. If you want to send values to the origin but not include them in
      # the cache key, use OriginRequestPolicy .

      struct CachePolicyConfig
        include JSON::Serializable

        # The minimum amount of time, in seconds, that you want objects to stay in the CloudFront cache before
        # CloudFront sends another request to the origin to see if the object has been updated. For more
        # information, see Managing How Long Content Stays in an Edge Cache (Expiration) in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "MinTTL")]
        getter min_ttl : Int64

        # A unique name to identify the cache policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A comment to describe the cache policy. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The default amount of time, in seconds, that you want objects to stay in the CloudFront cache before
        # CloudFront sends another request to the origin to see if the object has been updated. CloudFront
        # uses this value as the object's time to live (TTL) only when the origin does not send Cache-Control
        # or Expires headers with the object. For more information, see Managing How Long Content Stays in an
        # Edge Cache (Expiration) in the Amazon CloudFront Developer Guide . The default value for this field
        # is 86400 seconds (one day). If the value of MinTTL is more than 86400 seconds, then the default
        # value for this field is the same as the value of MinTTL .

        @[JSON::Field(key: "DefaultTTL")]
        getter default_ttl : Int64?

        # The maximum amount of time, in seconds, that objects stay in the CloudFront cache before CloudFront
        # sends another request to the origin to see if the object has been updated. CloudFront uses this
        # value only when the origin sends Cache-Control or Expires headers with the object. For more
        # information, see Managing How Long Content Stays in an Edge Cache (Expiration) in the Amazon
        # CloudFront Developer Guide . The default value for this field is 31536000 seconds (one year). If the
        # value of MinTTL or DefaultTTL is more than 31536000 seconds, then the default value for this field
        # is the same as the value of DefaultTTL .

        @[JSON::Field(key: "MaxTTL")]
        getter max_ttl : Int64?

        # The HTTP headers, cookies, and URL query strings to include in the cache key. The values included in
        # the cache key are also included in requests that CloudFront sends to the origin.

        @[JSON::Field(key: "ParametersInCacheKeyAndForwardedToOrigin")]
        getter parameters_in_cache_key_and_forwarded_to_origin : Types::ParametersInCacheKeyAndForwardedToOrigin?

        def initialize(
          @min_ttl : Int64,
          @name : String,
          @comment : String? = nil,
          @default_ttl : Int64? = nil,
          @max_ttl : Int64? = nil,
          @parameters_in_cache_key_and_forwarded_to_origin : Types::ParametersInCacheKeyAndForwardedToOrigin? = nil
        )
        end
      end

      # An object that determines whether any cookies in viewer requests (and if so, which cookies) are
      # included in the cache key and in requests that CloudFront sends to the origin.

      struct CachePolicyCookiesConfig
        include JSON::Serializable

        # Determines whether any cookies in viewer requests are included in the cache key and in requests that
        # CloudFront sends to the origin. Valid values are: none – No cookies in viewer requests are included
        # in the cache key or in requests that CloudFront sends to the origin. Even when this field is set to
        # none , any cookies that are listed in an OriginRequestPolicy are included in origin requests.
        # whitelist – Only the cookies in viewer requests that are listed in the CookieNames type are included
        # in the cache key and in requests that CloudFront sends to the origin. allExcept – All cookies in
        # viewer requests are included in the cache key and in requests that CloudFront sends to the origin,
        # except for those that are listed in the CookieNames type, which are not included. all – All cookies
        # in viewer requests are included in the cache key and in requests that CloudFront sends to the
        # origin.

        @[JSON::Field(key: "CookieBehavior")]
        getter cookie_behavior : String


        @[JSON::Field(key: "Cookies")]
        getter cookies : Types::CookieNames?

        def initialize(
          @cookie_behavior : String,
          @cookies : Types::CookieNames? = nil
        )
        end
      end

      # An object that determines whether any HTTP headers (and if so, which headers) are included in the
      # cache key and in requests that CloudFront sends to the origin.

      struct CachePolicyHeadersConfig
        include JSON::Serializable

        # Determines whether any HTTP headers are included in the cache key and in requests that CloudFront
        # sends to the origin. Valid values are: none – No HTTP headers are included in the cache key or in
        # requests that CloudFront sends to the origin. Even when this field is set to none , any headers that
        # are listed in an OriginRequestPolicy are included in origin requests. whitelist – Only the HTTP
        # headers that are listed in the Headers type are included in the cache key and in requests that
        # CloudFront sends to the origin.

        @[JSON::Field(key: "HeaderBehavior")]
        getter header_behavior : String


        @[JSON::Field(key: "Headers")]
        getter headers : Types::Headers?

        def initialize(
          @header_behavior : String,
          @headers : Types::Headers? = nil
        )
        end
      end

      # Cannot delete the cache policy because it is attached to one or more cache behaviors.

      struct CachePolicyInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of cache policies.

      struct CachePolicyList
        include JSON::Serializable

        # The maximum number of cache policies requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The total number of cache policies returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Contains the cache policies in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CachePolicySummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing cache
        # policies where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::CachePolicySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # An object that determines whether any URL query strings in viewer requests (and if so, which query
      # strings) are included in the cache key and in requests that CloudFront sends to the origin.

      struct CachePolicyQueryStringsConfig
        include JSON::Serializable

        # Determines whether any URL query strings in viewer requests are included in the cache key and in
        # requests that CloudFront sends to the origin. Valid values are: none – No query strings in viewer
        # requests are included in the cache key or in requests that CloudFront sends to the origin. Even when
        # this field is set to none , any query strings that are listed in an OriginRequestPolicy are included
        # in origin requests. whitelist – Only the query strings in viewer requests that are listed in the
        # QueryStringNames type are included in the cache key and in requests that CloudFront sends to the
        # origin. allExcept – All query strings in viewer requests are included in the cache key and in
        # requests that CloudFront sends to the origin, except those that are listed in the QueryStringNames
        # type, which are not included. all – All query strings in viewer requests are included in the cache
        # key and in requests that CloudFront sends to the origin.

        @[JSON::Field(key: "QueryStringBehavior")]
        getter query_string_behavior : String

        # Contains the specific query strings in viewer requests that either are or are not included in the
        # cache key and in requests that CloudFront sends to the origin. The behavior depends on whether the
        # QueryStringBehavior field in the CachePolicyQueryStringsConfig type is set to whitelist (the listed
        # query strings are included) or allExcept (the listed query strings are not included, but all other
        # query strings are).

        @[JSON::Field(key: "QueryStrings")]
        getter query_strings : Types::QueryStringNames?

        def initialize(
          @query_string_behavior : String,
          @query_strings : Types::QueryStringNames? = nil
        )
        end
      end

      # Contains a cache policy.

      struct CachePolicySummary
        include JSON::Serializable

        # The cache policy.

        @[JSON::Field(key: "CachePolicy")]
        getter cache_policy : Types::CachePolicy

        # The type of cache policy, either managed (created by Amazon Web Services) or custom (created in this
        # Amazon Web Services account).

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @cache_policy : Types::CachePolicy,
          @type : String
        )
        end
      end

      # A complex type that controls whether CloudFront caches the response to requests using the specified
      # HTTP methods. There are two choices: CloudFront caches responses to GET and HEAD requests.
      # CloudFront caches responses to GET , HEAD , and OPTIONS requests. If you pick the second choice for
      # your Amazon S3 Origin, you may need to forward Access-Control-Request-Method,
      # Access-Control-Request-Headers, and Origin headers for the responses to be cached correctly.

      struct CachedMethods
        include JSON::Serializable

        # A complex type that contains the HTTP methods that you want CloudFront to cache responses to. Valid
        # values for CachedMethods include GET , HEAD , and OPTIONS , depending on which caching option you
        # choose. For more information, see the preceding section.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of HTTP methods for which you want CloudFront to cache responses. Valid values are 2 (for
        # caching responses to GET and HEAD requests) and 3 (for caching responses to GET , HEAD , and OPTIONS
        # requests).

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(String),
          @quantity : Int32
        )
        end
      end

      # You can't change the value of a public key.

      struct CannotChangeImmutablePublicKeyFields
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The entity cannot be deleted while it is in use.

      struct CannotDeleteEntityWhileInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The entity cannot be updated while it is in use.

      struct CannotUpdateEntityWhileInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Certificate Manager (ACM) certificate associated with your distribution.

      struct Certificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ACM certificate.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # CloudFront origin access identity.

      struct CloudFrontOriginAccessIdentity
        include JSON::Serializable

        # The ID for the origin access identity, for example, E74FTE3AJFJ256A .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon S3 canonical user ID for the origin access identity, used when giving the origin access
        # identity read permission to an object in Amazon S3.

        @[JSON::Field(key: "S3CanonicalUserId")]
        getter s3_canonical_user_id : String

        # The current configuration information for the identity.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentityConfig")]
        getter cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig?

        def initialize(
          @id : String,
          @s3_canonical_user_id : String,
          @cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig? = nil
        )
        end
      end

      # If the CallerReference is a value you already sent in a previous request to create an identity but
      # the content of the CloudFrontOriginAccessIdentityConfig is different from the original request,
      # CloudFront returns a CloudFrontOriginAccessIdentityAlreadyExists error.

      struct CloudFrontOriginAccessIdentityAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Origin access identity configuration. Send a GET request to the / CloudFront API version
      # /CloudFront/identity ID/config resource.

      struct CloudFrontOriginAccessIdentityConfig
        include JSON::Serializable

        # A unique value (for example, a date-time stamp) that ensures that the request can't be replayed. If
        # the value of CallerReference is new (regardless of the content of the
        # CloudFrontOriginAccessIdentityConfig object), a new origin access identity is created. If the
        # CallerReference is a value already sent in a previous identity request, and the content of the
        # CloudFrontOriginAccessIdentityConfig is identical to the original request (ignoring white space),
        # the response includes the same information returned to the original request. If the CallerReference
        # is a value you already sent in a previous request to create an identity, but the content of the
        # CloudFrontOriginAccessIdentityConfig is different from the original request, CloudFront returns a
        # CloudFrontOriginAccessIdentityAlreadyExists error.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A comment to describe the origin access identity. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        def initialize(
          @caller_reference : String,
          @comment : String
        )
        end
      end

      # The Origin Access Identity specified is already in use.

      struct CloudFrontOriginAccessIdentityInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Lists the origin access identities for CloudFront.Send a GET request to the / CloudFront API version
      # /origin-access-identity/cloudfront resource. The response includes a
      # CloudFrontOriginAccessIdentityList element with zero or more CloudFrontOriginAccessIdentitySummary
      # child elements. By default, your entire list of origin access identities is returned in one single
      # page. If the list is long, you can paginate it using the MaxItems and Marker parameters.

      struct CloudFrontOriginAccessIdentityList
        include JSON::Serializable

        # A flag that indicates whether more origin access identities remain to be listed. If your results
        # were truncated, you can make a follow-up pagination request using the Marker request parameter to
        # retrieve more items in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # Use this when paginating results to indicate where to begin in your list of origin access
        # identities. The results include identities in the list that occur after the marker. To get the next
        # page of results, set the Marker to the value of the NextMarker from the current page's response
        # (which is also the ID of the last identity on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of origin access identities you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of CloudFront origin access identities that were created by the current Amazon Web
        # Services account.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains one CloudFrontOriginAccessIdentitySummary element for each origin
        # access identity that was created by the current Amazon Web Services account.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CloudFrontOriginAccessIdentitySummary)?

        # If IsTruncated is true , this element is present and contains the value you can use for the Marker
        # request parameter to continue listing your origin access identities where they left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::CloudFrontOriginAccessIdentitySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Summary of the information about a CloudFront origin access identity.

      struct CloudFrontOriginAccessIdentitySummary
        include JSON::Serializable

        # The comment for this origin access identity, as originally specified when created.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The ID for the origin access identity. For example: E74FTE3AJFJ256A .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin
        # access identity read permission to an object in Amazon S3.

        @[JSON::Field(key: "S3CanonicalUserId")]
        getter s3_canonical_user_id : String

        def initialize(
          @comment : String,
          @id : String,
          @s3_canonical_user_id : String
        )
        end
      end

      # An alias (also called a CNAME) and the CloudFront standard distribution and Amazon Web Services
      # account ID that it's associated with. The standard distribution and account IDs are partially
      # hidden, which allows you to identify the standard distributions and accounts that you own, and helps
      # to protect the information of ones that you don't own.

      struct ConflictingAlias
        include JSON::Serializable

        # The (partially hidden) ID of the Amazon Web Services account that owns the standard distribution
        # that's associated with the alias.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # An alias (also called a CNAME).

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The (partially hidden) ID of the CloudFront standard distribution associated with the alias.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String?

        def initialize(
          @account_id : String? = nil,
          @alias : String? = nil,
          @distribution_id : String? = nil
        )
        end
      end

      # A list of aliases (also called CNAMEs) and the CloudFront standard distributions and Amazon Web
      # Services accounts that they are associated with. In the list, the standard distribution and account
      # IDs are partially hidden, which allows you to identify the standard distributions and accounts that
      # you own, but helps to protect the information of ones that you don't own.

      struct ConflictingAliasesList
        include JSON::Serializable

        # Contains the conflicting aliases in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ConflictingAlias)?

        # The maximum number of conflicting aliases requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing
        # conflicting aliases where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The number of conflicting aliases returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32?

        def initialize(
          @items : Array(Types::ConflictingAlias)? = nil,
          @max_items : Int32? = nil,
          @next_marker : String? = nil,
          @quantity : Int32? = nil
        )
        end
      end

      # A connection function association.

      struct ConnectionFunctionAssociation
        include JSON::Serializable

        # The association's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A connection function summary.

      struct ConnectionFunctionSummary
        include JSON::Serializable

        # The connection function Amazon Resource Name (ARN).

        @[JSON::Field(key: "ConnectionFunctionArn")]
        getter connection_function_arn : String


        @[JSON::Field(key: "ConnectionFunctionConfig")]
        getter connection_function_config : Types::FunctionConfig

        # The connection function created time.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The connection function ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The connection function last modified time.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The connection function name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The connection function stage.

        @[JSON::Field(key: "Stage")]
        getter stage : String

        # The connection function status.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @connection_function_arn : String,
          @connection_function_config : Types::FunctionConfig,
          @created_time : Time,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @stage : String,
          @status : String
        )
        end
      end

      # A connection function test result.

      struct ConnectionFunctionTestResult
        include JSON::Serializable

        # The connection function compute utilization.

        @[JSON::Field(key: "ComputeUtilization")]
        getter compute_utilization : String?

        # The connection function error message.

        @[JSON::Field(key: "ConnectionFunctionErrorMessage")]
        getter connection_function_error_message : String?

        # The connection function execution logs.

        @[JSON::Field(key: "ConnectionFunctionExecutionLogs")]
        getter connection_function_execution_logs : Array(String)?

        # The connection function output.

        @[JSON::Field(key: "ConnectionFunctionOutput")]
        getter connection_function_output : String?

        # The connection function summary.

        @[JSON::Field(key: "ConnectionFunctionSummary")]
        getter connection_function_summary : Types::ConnectionFunctionSummary?

        def initialize(
          @compute_utilization : String? = nil,
          @connection_function_error_message : String? = nil,
          @connection_function_execution_logs : Array(String)? = nil,
          @connection_function_output : String? = nil,
          @connection_function_summary : Types::ConnectionFunctionSummary? = nil
        )
        end
      end

      # The connection group for your distribution tenants. When you first create a distribution tenant and
      # you don't specify a connection group, CloudFront will automatically create a default connection
      # group for you. When you create a new distribution tenant and don't specify a connection group, the
      # default one will be associated with your distribution tenant.

      struct ConnectionGroup
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # The Amazon Resource Name (ARN) of the connection group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time when the connection group was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # Whether the connection group is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The ID of the connection group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # IPv6 is enabled for the connection group.

        @[JSON::Field(key: "Ipv6Enabled")]
        getter ipv6_enabled : Bool?

        # Whether the connection group is the default connection group for the distribution tenants.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The date and time when the connection group was updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the connection group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The routing endpoint (also known as the DNS name) that is assigned to the connection group, such as
        # d111111abcdef8.cloudfront.net.

        @[JSON::Field(key: "RoutingEndpoint")]
        getter routing_endpoint : String?

        # The status of the connection group.

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @anycast_ip_list_id : String? = nil,
          @arn : String? = nil,
          @created_time : Time? = nil,
          @enabled : Bool? = nil,
          @id : String? = nil,
          @ipv6_enabled : Bool? = nil,
          @is_default : Bool? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @routing_endpoint : String? = nil,
          @status : String? = nil,
          @tags : Types::Tags? = nil
        )
        end
      end

      # Contains information about what CloudFront resources your connection groups are associated with.

      struct ConnectionGroupAssociationFilter
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        def initialize(
          @anycast_ip_list_id : String? = nil
        )
        end
      end

      # A summary that contains details about your connection groups.

      struct ConnectionGroupSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection group.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time when the connection group was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The current version of the connection group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # The ID of the connection group.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the connection group was updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The name of the connection group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The routing endpoint (also known as the DNS name) that is assigned to the connection group, such as
        # d111111abcdef8.cloudfront.net.

        @[JSON::Field(key: "RoutingEndpoint")]
        getter routing_endpoint : String

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # Whether the connection group is enabled

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Whether the connection group is the default connection group for the distribution tenants.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The status of the connection group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String,
          @created_time : Time,
          @e_tag : String,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @routing_endpoint : String,
          @anycast_ip_list_id : String? = nil,
          @enabled : Bool? = nil,
          @is_default : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # A field-level encryption content type profile.

      struct ContentTypeProfile
        include JSON::Serializable

        # The content type for a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        # The format for a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The profile ID for a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        def initialize(
          @content_type : String,
          @format : String,
          @profile_id : String? = nil
        )
        end
      end

      # The configuration for a field-level encryption content type-profile mapping.

      struct ContentTypeProfileConfig
        include JSON::Serializable

        # The setting in a field-level encryption content type-profile mapping that specifies what to do when
        # an unknown content type is provided for the profile. If true, content is forwarded without being
        # encrypted when the content type is unknown. If false (the default), an error is returned when the
        # content type is unknown.

        @[JSON::Field(key: "ForwardWhenContentTypeIsUnknown")]
        getter forward_when_content_type_is_unknown : Bool

        # The configuration for a field-level encryption content type-profile.

        @[JSON::Field(key: "ContentTypeProfiles")]
        getter content_type_profiles : Types::ContentTypeProfiles?

        def initialize(
          @forward_when_content_type_is_unknown : Bool,
          @content_type_profiles : Types::ContentTypeProfiles? = nil
        )
        end
      end

      # Field-level encryption content type-profile.

      struct ContentTypeProfiles
        include JSON::Serializable

        # The number of field-level encryption content type-profile mappings.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Items in a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ContentTypeProfile)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::ContentTypeProfile)? = nil
        )
        end
      end

      # A continuous deployment policy.

      struct ContinuousDeploymentPolicy
        include JSON::Serializable


        @[JSON::Field(key: "ContinuousDeploymentPolicyConfig")]
        getter continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig

        # The identifier of the continuous deployment policy.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time the continuous deployment policy was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig,
          @id : String,
          @last_modified_time : Time
        )
        end
      end

      # A continuous deployment policy with this configuration already exists.

      struct ContinuousDeploymentPolicyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the configuration for a continuous deployment policy.

      struct ContinuousDeploymentPolicyConfig
        include JSON::Serializable

        # A Boolean that indicates whether this continuous deployment policy is enabled (in effect). When this
        # value is true , this policy is enabled and in effect. When this value is false , this policy is not
        # enabled and has no effect.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The CloudFront domain name of the staging distribution. For example: d111111abcdef8.cloudfront.net .

        @[JSON::Field(key: "StagingDistributionDnsNames")]
        getter staging_distribution_dns_names : Types::StagingDistributionDnsNames

        # Contains the parameters for routing production traffic from your primary to staging distributions.

        @[JSON::Field(key: "TrafficConfig")]
        getter traffic_config : Types::TrafficConfig?

        def initialize(
          @enabled : Bool,
          @staging_distribution_dns_names : Types::StagingDistributionDnsNames,
          @traffic_config : Types::TrafficConfig? = nil
        )
        end
      end

      # You cannot delete a continuous deployment policy that is associated with a primary distribution.

      struct ContinuousDeploymentPolicyInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains a list of continuous deployment policies.

      struct ContinuousDeploymentPolicyList
        include JSON::Serializable

        # The maximum number of continuous deployment policies that were specified in your request.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The total number of continuous deployment policies in your Amazon Web Services account, regardless
        # of the MaxItems value.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of continuous deployment policy items.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ContinuousDeploymentPolicySummary)?

        # Indicates the next page of continuous deployment policies. To get the next page of the list, use
        # this value in the Marker field of your request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::ContinuousDeploymentPolicySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A summary of the information about your continuous deployment policies.

      struct ContinuousDeploymentPolicySummary
        include JSON::Serializable

        # The continuous deployment policy.

        @[JSON::Field(key: "ContinuousDeploymentPolicy")]
        getter continuous_deployment_policy : Types::ContinuousDeploymentPolicy

        def initialize(
          @continuous_deployment_policy : Types::ContinuousDeploymentPolicy
        )
        end
      end

      # This configuration determines which HTTP requests are sent to the staging distribution. If the HTTP
      # request contains a header and value that matches what you specify here, the request is sent to the
      # staging distribution. Otherwise the request is sent to the primary distribution.

      struct ContinuousDeploymentSingleHeaderConfig
        include JSON::Serializable

        # The request header name that you want CloudFront to send to your staging distribution. The header
        # must contain the prefix aws-cf-cd- .

        @[JSON::Field(key: "Header")]
        getter header : String

        # The request header value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @header : String,
          @value : String
        )
        end
      end

      # Contains the percentage of traffic to send to a staging distribution.

      struct ContinuousDeploymentSingleWeightConfig
        include JSON::Serializable

        # The percentage of traffic to send to a staging distribution, expressed as a decimal number between 0
        # and 0.15. For example, a value of 0.10 means 10% of traffic is sent to the staging distribution.

        @[JSON::Field(key: "Weight")]
        getter weight : Float64


        @[JSON::Field(key: "SessionStickinessConfig")]
        getter session_stickiness_config : Types::SessionStickinessConfig?

        def initialize(
          @weight : Float64,
          @session_stickiness_config : Types::SessionStickinessConfig? = nil
        )
        end
      end

      # Contains a list of cookie names.

      struct CookieNames
        include JSON::Serializable

        # The number of cookie names in the Items list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of cookie names.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # This field is deprecated. We recommend that you use a cache policy or an origin request policy
      # instead of this field. If you want to include cookies in the cache key, use CookiesConfig in a cache
      # policy. See CachePolicy . If you want to send cookies to the origin but not include them in the
      # cache key, use CookiesConfig in an origin request policy. See OriginRequestPolicy . A complex type
      # that specifies whether you want CloudFront to forward cookies to the origin and, if so, which ones.
      # For more information about forwarding cookies to the origin, see Caching Content Based on Cookies in
      # the Amazon CloudFront Developer Guide .

      struct CookiePreference
        include JSON::Serializable

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include cookies in the cache key, use a cache policy. For more
        # information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you want to
        # send cookies to the origin but not include them in the cache key, use origin request policy. For
        # more information, see Creating origin request policies in the Amazon CloudFront Developer Guide .
        # Specifies which cookies to forward to the origin for this cache behavior: all, none, or the list of
        # cookies specified in the WhitelistedNames complex type. Amazon S3 doesn't process cookies. When the
        # cache behavior is forwarding requests to an Amazon S3 origin, specify none for the Forward element.

        @[JSON::Field(key: "Forward")]
        getter forward : String

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include cookies in the cache key, use a cache policy. For more
        # information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you want to
        # send cookies to the origin but not include them in the cache key, use an origin request policy. For
        # more information, see Creating origin request policies in the Amazon CloudFront Developer Guide .
        # Required if you specify whitelist for the value of Forward . A complex type that specifies how many
        # different cookies you want CloudFront to forward to the origin for this cache behavior and, if you
        # want to forward selected cookies, the names of those cookies. If you specify all or none for the
        # value of Forward , omit WhitelistedNames . If you change the value of Forward from whitelist to all
        # or none and you don't delete the WhitelistedNames element and its child elements, CloudFront deletes
        # them automatically. For the current limit on the number of cookie names that you can whitelist for
        # each cache behavior, see CloudFront Limits in the Amazon Web Services General Reference .

        @[JSON::Field(key: "WhitelistedNames")]
        getter whitelisted_names : Types::CookieNames?

        def initialize(
          @forward : String,
          @whitelisted_names : Types::CookieNames? = nil
        )
        end
      end


      struct CopyDistributionRequest
        include JSON::Serializable

        # A value that uniquely identifies a request to create a resource. This helps to prevent CloudFront
        # from creating a duplicate resource if you accidentally resubmit an identical request.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # The identifier of the primary distribution whose configuration you are copying. To get a
        # distribution ID, use ListDistributions .

        @[JSON::Field(key: "PrimaryDistributionId")]
        getter primary_distribution_id : String

        # A Boolean flag to specify the state of the staging distribution when it's created. When you set this
        # value to True , the staging distribution is enabled. When you set this value to False , the staging
        # distribution is disabled. If you omit this field, the default value is True .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The version identifier of the primary distribution whose configuration you are copying. This is the
        # ETag value returned in the response to GetDistribution and GetDistributionConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # The type of distribution that your primary distribution will be copied to. The only valid value is
        # True , indicating that you are copying to a staging distribution.

        @[JSON::Field(key: "Staging")]
        getter staging : Bool?

        def initialize(
          @caller_reference : String,
          @primary_distribution_id : String,
          @enabled : Bool? = nil,
          @if_match : String? = nil,
          @staging : Bool? = nil
        )
        end
      end


      struct CopyDistributionResult
        include JSON::Serializable


        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The version identifier for the current version of the staging distribution.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The URL of the staging distribution.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateAnycastIpListRequest
        include JSON::Serializable

        # The number of static IP addresses that are allocated to the Anycast static IP list. Valid values: 21
        # or 3.

        @[JSON::Field(key: "IpCount")]
        getter ip_count : Int32

        # Name of the Anycast static IP list.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The IP address type for the Anycast static IP list. You can specify one of the following options:
        # ipv4 only ipv6 only dualstack - Allocate a list of both IPv4 and IPv6 addresses

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # A list of IPAM CIDR configurations that specify the IP address ranges and IPAM pool settings for
        # creating the Anycast static IP list.

        @[JSON::Field(key: "IpamCidrConfigs")]
        getter ipam_cidr_configs : Array(Types::IpamCidrConfig)?


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @ip_count : Int32,
          @name : String,
          @ip_address_type : String? = nil,
          @ipam_cidr_configs : Array(Types::IpamCidrConfig)? = nil,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateAnycastIpListResult
        include JSON::Serializable

        # A response structure that includes the version identifier (ETag) and the created AnycastIpList
        # structure.

        @[JSON::Field(key: "AnycastIpList")]
        getter anycast_ip_list : Types::AnycastIpList?

        # The version identifier for the current version of the Anycast static IP list.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @anycast_ip_list : Types::AnycastIpList? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct CreateCachePolicyRequest
        include JSON::Serializable

        # A cache policy configuration.

        @[JSON::Field(key: "CachePolicyConfig")]
        getter cache_policy_config : Types::CachePolicyConfig

        def initialize(
          @cache_policy_config : Types::CachePolicyConfig
        )
        end
      end


      struct CreateCachePolicyResult
        include JSON::Serializable

        # A cache policy.

        @[JSON::Field(key: "CachePolicy")]
        getter cache_policy : Types::CachePolicy?

        # The current version of the cache policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the cache policy just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @cache_policy : Types::CachePolicy? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end

      # The request to create a new origin access identity (OAI). An origin access identity is a special
      # CloudFront user that you can associate with Amazon S3 origins, so that you can secure all or just
      # some of your Amazon S3 content. For more information, see Restricting Access to Amazon S3 Content by
      # Using an Origin Access Identity in the Amazon CloudFront Developer Guide .

      struct CreateCloudFrontOriginAccessIdentityRequest
        include JSON::Serializable

        # The current configuration information for the identity.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentityConfig")]
        getter cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig

        def initialize(
          @cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateCloudFrontOriginAccessIdentityResult
        include JSON::Serializable

        # The origin access identity's information.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentity")]
        getter cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity?

        # The current version of the origin access identity created.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the new origin access identity just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateConnectionFunctionRequest
        include JSON::Serializable

        # The code for the connection function.

        @[JSON::Field(key: "ConnectionFunctionCode")]
        getter connection_function_code : Bytes


        @[JSON::Field(key: "ConnectionFunctionConfig")]
        getter connection_function_config : Types::FunctionConfig

        # A name for the connection function.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @connection_function_code : Bytes,
          @connection_function_config : Types::FunctionConfig,
          @name : String,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateConnectionFunctionResult
        include JSON::Serializable

        # The summary for the connection function.

        @[JSON::Field(key: "ConnectionFunctionSummary")]
        getter connection_function_summary : Types::ConnectionFunctionSummary?

        # The version identifier for the current version of the connection function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The location of the connection function.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @connection_function_summary : Types::ConnectionFunctionSummary? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateConnectionGroupRequest
        include JSON::Serializable

        # The name of the connection group. Enter a friendly identifier that is unique within your Amazon Web
        # Services account. This name can't be updated after you create the connection group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # Enable the connection group.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Enable IPv6 for the connection group. The default is true . For more information, see Enable IPv6 in
        # the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Ipv6Enabled")]
        getter ipv6_enabled : Bool?


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @name : String,
          @anycast_ip_list_id : String? = nil,
          @enabled : Bool? = nil,
          @ipv6_enabled : Bool? = nil,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateConnectionGroupResult
        include JSON::Serializable

        # The connection group that you created.

        @[JSON::Field(key: "ConnectionGroup")]
        getter connection_group : Types::ConnectionGroup?

        # The current version of the connection group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_group : Types::ConnectionGroup? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct CreateContinuousDeploymentPolicyRequest
        include JSON::Serializable

        # Contains the configuration for a continuous deployment policy.

        @[JSON::Field(key: "ContinuousDeploymentPolicyConfig")]
        getter continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig

        def initialize(
          @continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig
        )
        end
      end


      struct CreateContinuousDeploymentPolicyResult
        include JSON::Serializable

        # A continuous deployment policy.

        @[JSON::Field(key: "ContinuousDeploymentPolicy")]
        getter continuous_deployment_policy : Types::ContinuousDeploymentPolicy?

        # The version identifier for the current version of the continuous deployment policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The location of the continuous deployment policy.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @continuous_deployment_policy : Types::ContinuousDeploymentPolicy? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end

      # The request to create a new distribution.

      struct CreateDistributionRequest
        include JSON::Serializable

        # The distribution's configuration information.

        @[JSON::Field(key: "DistributionConfig")]
        getter distribution_config : Types::DistributionConfig

        def initialize(
          @distribution_config : Types::DistributionConfig
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateDistributionResult
        include JSON::Serializable

        # The distribution's information.

        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The current version of the distribution created.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the new distribution resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateDistributionTenantRequest
        include JSON::Serializable

        # The ID of the multi-tenant distribution to use for creating the distribution tenant.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # The domains associated with the distribution tenant. You must specify at least one domain in the
        # request.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainItem)

        # The name of the distribution tenant. Enter a friendly identifier that is unique within your Amazon
        # Web Services account. This name can't be updated after you create the distribution tenant.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the connection group to associate with the distribution tenant.

        @[JSON::Field(key: "ConnectionGroupId")]
        getter connection_group_id : String?

        # Customizations for the distribution tenant. For each distribution tenant, you can specify the
        # geographic restrictions, and the Amazon Resource Names (ARNs) for the ACM certificate and WAF web
        # ACL. These are specific values that you can override or disable from the multi-tenant distribution
        # that was used to create the distribution tenant.

        @[JSON::Field(key: "Customizations")]
        getter customizations : Types::Customizations?

        # Indicates whether the distribution tenant should be enabled when created. If the distribution tenant
        # is disabled, the distribution tenant won't serve traffic.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The configuration for the CloudFront managed ACM certificate request.

        @[JSON::Field(key: "ManagedCertificateRequest")]
        getter managed_certificate_request : Types::ManagedCertificateRequest?

        # A list of parameter values to add to the resource. A parameter is specified as a key-value pair. A
        # valid parameter value must exist for any parameter that is marked as required in the multi-tenant
        # distribution.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @distribution_id : String,
          @domains : Array(Types::DomainItem),
          @name : String,
          @connection_group_id : String? = nil,
          @customizations : Types::Customizations? = nil,
          @enabled : Bool? = nil,
          @managed_certificate_request : Types::ManagedCertificateRequest? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateDistributionTenantResult
        include JSON::Serializable

        # The distribution tenant that you created.

        @[JSON::Field(key: "DistributionTenant")]
        getter distribution_tenant : Types::DistributionTenant?

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution_tenant : Types::DistributionTenant? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to create a new distribution with tags.

      struct CreateDistributionWithTagsRequest
        include JSON::Serializable

        # The distribution's configuration information.

        @[JSON::Field(key: "DistributionConfigWithTags")]
        getter distribution_config_with_tags : Types::DistributionConfigWithTags

        def initialize(
          @distribution_config_with_tags : Types::DistributionConfigWithTags
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateDistributionWithTagsResult
        include JSON::Serializable

        # The distribution's information.

        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The current version of the distribution created.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the new distribution resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateFieldLevelEncryptionConfigRequest
        include JSON::Serializable

        # The request to create a new field-level encryption configuration.

        @[JSON::Field(key: "FieldLevelEncryptionConfig")]
        getter field_level_encryption_config : Types::FieldLevelEncryptionConfig

        def initialize(
          @field_level_encryption_config : Types::FieldLevelEncryptionConfig
        )
        end
      end


      struct CreateFieldLevelEncryptionConfigResult
        include JSON::Serializable

        # The current version of the field level encryption configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Returned when you create a new field-level encryption configuration.

        @[JSON::Field(key: "FieldLevelEncryption")]
        getter field_level_encryption : Types::FieldLevelEncryption?

        # The fully qualified URI of the new configuration resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption : Types::FieldLevelEncryption? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateFieldLevelEncryptionProfileRequest
        include JSON::Serializable

        # The request to create a field-level encryption profile.

        @[JSON::Field(key: "FieldLevelEncryptionProfileConfig")]
        getter field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig

        def initialize(
          @field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig
        )
        end
      end


      struct CreateFieldLevelEncryptionProfileResult
        include JSON::Serializable

        # The current version of the field level encryption profile. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Returned when you create a new field-level encryption profile.

        @[JSON::Field(key: "FieldLevelEncryptionProfile")]
        getter field_level_encryption_profile : Types::FieldLevelEncryptionProfile?

        # The fully qualified URI of the new profile resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption_profile : Types::FieldLevelEncryptionProfile? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateFunctionRequest
        include JSON::Serializable

        # The function code. For more information about writing a CloudFront function, see Writing function
        # code for CloudFront Functions in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "FunctionCode")]
        getter function_code : Bytes

        # Configuration information about the function, including an optional comment and the function's
        # runtime.

        @[JSON::Field(key: "FunctionConfig")]
        getter function_config : Types::FunctionConfig

        # A name to identify the function.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @function_code : Bytes,
          @function_config : Types::FunctionConfig,
          @name : String
        )
        end
      end


      struct CreateFunctionResult
        include JSON::Serializable

        # The version identifier for the current version of the CloudFront function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains configuration information and metadata about a CloudFront function.

        @[JSON::Field(key: "FunctionSummary")]
        getter function_summary : Types::FunctionSummary?

        # The URL of the CloudFront function. Use the URL to manage the function with the CloudFront API.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @e_tag : String? = nil,
          @function_summary : Types::FunctionSummary? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateInvalidationForDistributionTenantRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "InvalidationBatch")]
        getter invalidation_batch : Types::InvalidationBatch

        def initialize(
          @id : String,
          @invalidation_batch : Types::InvalidationBatch
        )
        end
      end


      struct CreateInvalidationForDistributionTenantResult
        include JSON::Serializable


        @[JSON::Field(key: "Invalidation")]
        getter invalidation : Types::Invalidation?

        # The location for the invalidation.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @invalidation : Types::Invalidation? = nil,
          @location : String? = nil
        )
        end
      end

      # The request to create an invalidation.

      struct CreateInvalidationRequest
        include JSON::Serializable

        # The distribution's id.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # The batch information for the invalidation.

        @[JSON::Field(key: "InvalidationBatch")]
        getter invalidation_batch : Types::InvalidationBatch

        def initialize(
          @distribution_id : String,
          @invalidation_batch : Types::InvalidationBatch
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateInvalidationResult
        include JSON::Serializable

        # The invalidation's information.

        @[JSON::Field(key: "Invalidation")]
        getter invalidation : Types::Invalidation?

        # The fully qualified URI of the distribution and invalidation batch request, including the
        # Invalidation ID .

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @invalidation : Types::Invalidation? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateKeyGroupRequest
        include JSON::Serializable

        # A key group configuration.

        @[JSON::Field(key: "KeyGroupConfig")]
        getter key_group_config : Types::KeyGroupConfig

        def initialize(
          @key_group_config : Types::KeyGroupConfig
        )
        end
      end


      struct CreateKeyGroupResult
        include JSON::Serializable

        # The identifier for this version of the key group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The key group that was just created.

        @[JSON::Field(key: "KeyGroup")]
        getter key_group : Types::KeyGroup?

        # The URL of the key group.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @e_tag : String? = nil,
          @key_group : Types::KeyGroup? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateKeyValueStoreRequest
        include JSON::Serializable

        # The name of the key value store. The minimum length is 1 character and the maximum length is 64
        # characters.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The comment of the key value store.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The S3 bucket that provides the source for the import. The source must be in a valid JSON format.

        @[JSON::Field(key: "ImportSource")]
        getter import_source : Types::ImportSource?

        def initialize(
          @name : String,
          @comment : String? = nil,
          @import_source : Types::ImportSource? = nil
        )
        end
      end


      struct CreateKeyValueStoreResult
        include JSON::Serializable

        # The ETag in the resulting key value store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The resulting key value store.

        @[JSON::Field(key: "KeyValueStore")]
        getter key_value_store : Types::KeyValueStore?

        # The location of the resulting key value store.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @e_tag : String? = nil,
          @key_value_store : Types::KeyValueStore? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateMonitoringSubscriptionRequest
        include JSON::Serializable

        # The ID of the distribution that you are enabling metrics for.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # A monitoring subscription. This structure contains information about whether additional CloudWatch
        # metrics are enabled for a given CloudFront distribution.

        @[JSON::Field(key: "MonitoringSubscription")]
        getter monitoring_subscription : Types::MonitoringSubscription

        def initialize(
          @distribution_id : String,
          @monitoring_subscription : Types::MonitoringSubscription
        )
        end
      end


      struct CreateMonitoringSubscriptionResult
        include JSON::Serializable

        # A monitoring subscription. This structure contains information about whether additional CloudWatch
        # metrics are enabled for a given CloudFront distribution.

        @[JSON::Field(key: "MonitoringSubscription")]
        getter monitoring_subscription : Types::MonitoringSubscription?

        def initialize(
          @monitoring_subscription : Types::MonitoringSubscription? = nil
        )
        end
      end


      struct CreateOriginAccessControlRequest
        include JSON::Serializable

        # Contains the origin access control.

        @[JSON::Field(key: "OriginAccessControlConfig")]
        getter origin_access_control_config : Types::OriginAccessControlConfig

        def initialize(
          @origin_access_control_config : Types::OriginAccessControlConfig
        )
        end
      end


      struct CreateOriginAccessControlResult
        include JSON::Serializable

        # The version identifier for the current version of the origin access control.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The URL of the origin access control.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Contains an origin access control.

        @[JSON::Field(key: "OriginAccessControl")]
        getter origin_access_control : Types::OriginAccessControl?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @origin_access_control : Types::OriginAccessControl? = nil
        )
        end
      end


      struct CreateOriginRequestPolicyRequest
        include JSON::Serializable

        # An origin request policy configuration.

        @[JSON::Field(key: "OriginRequestPolicyConfig")]
        getter origin_request_policy_config : Types::OriginRequestPolicyConfig

        def initialize(
          @origin_request_policy_config : Types::OriginRequestPolicyConfig
        )
        end
      end


      struct CreateOriginRequestPolicyResult
        include JSON::Serializable

        # The current version of the origin request policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the origin request policy just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # An origin request policy.

        @[JSON::Field(key: "OriginRequestPolicy")]
        getter origin_request_policy : Types::OriginRequestPolicy?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @origin_request_policy : Types::OriginRequestPolicy? = nil
        )
        end
      end


      struct CreatePublicKeyRequest
        include JSON::Serializable

        # A CloudFront public key configuration.

        @[JSON::Field(key: "PublicKeyConfig")]
        getter public_key_config : Types::PublicKeyConfig

        def initialize(
          @public_key_config : Types::PublicKeyConfig
        )
        end
      end


      struct CreatePublicKeyResult
        include JSON::Serializable

        # The identifier for this version of the public key.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The URL of the public key.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The public key.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : Types::PublicKey?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @public_key : Types::PublicKey? = nil
        )
        end
      end


      struct CreateRealtimeLogConfigRequest
        include JSON::Serializable

        # Contains information about the Amazon Kinesis data stream where you are sending real-time log data.

        @[JSON::Field(key: "EndPoints")]
        getter end_points : Array(Types::EndPoint)

        # A list of fields to include in each real-time log record. For more information about fields, see
        # Real-time log configuration fields in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Fields")]
        getter fields : Array(String)

        # A unique name to identify this real-time log configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The sampling rate for this real-time log configuration. You can specify a whole number between 1 and
        # 100 (inclusive) to determine the percentage of viewer requests that are represented in the real-time
        # log data.

        @[JSON::Field(key: "SamplingRate")]
        getter sampling_rate : Int64

        def initialize(
          @end_points : Array(Types::EndPoint),
          @fields : Array(String),
          @name : String,
          @sampling_rate : Int64
        )
        end
      end


      struct CreateRealtimeLogConfigResult
        include JSON::Serializable

        # A real-time log configuration.

        @[JSON::Field(key: "RealtimeLogConfig")]
        getter realtime_log_config : Types::RealtimeLogConfig?

        def initialize(
          @realtime_log_config : Types::RealtimeLogConfig? = nil
        )
        end
      end


      struct CreateResponseHeadersPolicyRequest
        include JSON::Serializable

        # Contains metadata about the response headers policy, and a set of configurations that specify the
        # HTTP headers.

        @[JSON::Field(key: "ResponseHeadersPolicyConfig")]
        getter response_headers_policy_config : Types::ResponseHeadersPolicyConfig

        def initialize(
          @response_headers_policy_config : Types::ResponseHeadersPolicyConfig
        )
        end
      end


      struct CreateResponseHeadersPolicyResult
        include JSON::Serializable

        # The version identifier for the current version of the response headers policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The URL of the response headers policy.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Contains a response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicy")]
        getter response_headers_policy : Types::ResponseHeadersPolicy?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @response_headers_policy : Types::ResponseHeadersPolicy? = nil
        )
        end
      end

      # The request to create a new streaming distribution.

      struct CreateStreamingDistributionRequest
        include JSON::Serializable

        # The streaming distribution's configuration information.

        @[JSON::Field(key: "StreamingDistributionConfig")]
        getter streaming_distribution_config : Types::StreamingDistributionConfig

        def initialize(
          @streaming_distribution_config : Types::StreamingDistributionConfig
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateStreamingDistributionResult
        include JSON::Serializable

        # The current version of the streaming distribution created.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the new streaming distribution resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The streaming distribution's information.

        @[JSON::Field(key: "StreamingDistribution")]
        getter streaming_distribution : Types::StreamingDistribution?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @streaming_distribution : Types::StreamingDistribution? = nil
        )
        end
      end

      # The request to create a new streaming distribution with tags.

      struct CreateStreamingDistributionWithTagsRequest
        include JSON::Serializable

        # The streaming distribution's configuration information.

        @[JSON::Field(key: "StreamingDistributionConfigWithTags")]
        getter streaming_distribution_config_with_tags : Types::StreamingDistributionConfigWithTags

        def initialize(
          @streaming_distribution_config_with_tags : Types::StreamingDistributionConfigWithTags
        )
        end
      end

      # The returned result of the corresponding request.

      struct CreateStreamingDistributionWithTagsResult
        include JSON::Serializable

        # The current version of the distribution created.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The fully qualified URI of the new streaming distribution resource just created.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The streaming distribution's information.

        @[JSON::Field(key: "StreamingDistribution")]
        getter streaming_distribution : Types::StreamingDistribution?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @streaming_distribution : Types::StreamingDistribution? = nil
        )
        end
      end


      struct CreateTrustStoreRequest
        include JSON::Serializable

        # The CA certificates bundle source for the trust store.

        @[JSON::Field(key: "CaCertificatesBundleSource")]
        getter ca_certificates_bundle_source : Types::CaCertificatesBundleSource

        # A name for the trust store.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @ca_certificates_bundle_source : Types::CaCertificatesBundleSource,
          @name : String,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateTrustStoreResult
        include JSON::Serializable

        # The version identifier for the current version of the trust store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The trust store.

        @[JSON::Field(key: "TrustStore")]
        getter trust_store : Types::TrustStore?

        def initialize(
          @e_tag : String? = nil,
          @trust_store : Types::TrustStore? = nil
        )
        end
      end


      struct CreateVpcOriginRequest
        include JSON::Serializable

        # The VPC origin endpoint configuration.

        @[JSON::Field(key: "VpcOriginEndpointConfig")]
        getter vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig,
          @tags : Types::Tags? = nil
        )
        end
      end


      struct CreateVpcOriginResult
        include JSON::Serializable

        # The VPC origin ETag.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The VPC origin location.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The VPC origin.

        @[JSON::Field(key: "VpcOrigin")]
        getter vpc_origin : Types::VpcOrigin?

        def initialize(
          @e_tag : String? = nil,
          @location : String? = nil,
          @vpc_origin : Types::VpcOrigin? = nil
        )
        end
      end

      # A complex type that controls: Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range
      # with custom error messages before returning the response to the viewer. How long CloudFront caches
      # HTTP status codes in the 4xx and 5xx range. For more information about custom error pages, see
      # Customizing Error Responses in the Amazon CloudFront Developer Guide .

      struct CustomErrorResponse
        include JSON::Serializable

        # The HTTP status code for which you want to specify a custom error page and/or a caching duration.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : Int32

        # The minimum amount of time, in seconds, that you want CloudFront to cache the HTTP status code
        # specified in ErrorCode . When this time period has elapsed, CloudFront queries your origin to see
        # whether the problem that caused the error has been resolved and the requested object is now
        # available. For more information, see Customizing Error Responses in the Amazon CloudFront Developer
        # Guide .

        @[JSON::Field(key: "ErrorCachingMinTTL")]
        getter error_caching_min_ttl : Int64?

        # The HTTP status code that you want CloudFront to return to the viewer along with the custom error
        # page. There are a variety of reasons that you might want CloudFront to return a status code
        # different from the status code that your origin returned to CloudFront, for example: Some Internet
        # devices (some firewalls and corporate proxies, for example) intercept HTTP 4xx and 5xx and prevent
        # the response from being returned to the viewer. If you substitute 200 , the response typically won't
        # be intercepted. If you don't care about distinguishing among different client errors or server
        # errors, you can specify 400 or 500 as the ResponseCode for all 4xx or 5xx errors. You might want to
        # return a 200 status code (OK) and static website so your customers don't know that your website is
        # down. If you specify a value for ResponseCode , you must also specify a value for ResponsePagePath .

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : String?

        # The path to the custom error page that you want CloudFront to return to a viewer when your origin
        # returns the HTTP status code specified by ErrorCode , for example, /4xx-errors/403-forbidden.html .
        # If you want to store your objects and your custom error pages in different locations, your
        # distribution must include a cache behavior for which the following is true: The value of PathPattern
        # matches the path to your custom error messages. For example, suppose you saved custom error pages
        # for 4xx errors in an Amazon S3 bucket in a directory named /4xx-errors . Your distribution must
        # include a cache behavior for which the path pattern routes requests for your custom error pages to
        # that location, for example, /4xx-errors/* . The value of TargetOriginId specifies the value of the
        # ID element for the origin that contains your custom error pages. If you specify a value for
        # ResponsePagePath , you must also specify a value for ResponseCode . We recommend that you store
        # custom error pages in an Amazon S3 bucket. If you store custom error pages on an HTTP server and the
        # server starts to return 5xx errors, CloudFront can't get the files that you want to return to
        # viewers because the origin server is unavailable.

        @[JSON::Field(key: "ResponsePagePath")]
        getter response_page_path : String?

        def initialize(
          @error_code : Int32,
          @error_caching_min_ttl : Int64? = nil,
          @response_code : String? = nil,
          @response_page_path : String? = nil
        )
        end
      end

      # A complex type that controls: Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range
      # with custom error messages before returning the response to the viewer. How long CloudFront caches
      # HTTP status codes in the 4xx and 5xx range. For more information about custom error pages, see
      # Customizing Error Responses in the Amazon CloudFront Developer Guide .

      struct CustomErrorResponses
        include JSON::Serializable

        # The number of HTTP status codes for which you want to specify a custom error page and/or a caching
        # duration. If Quantity is 0 , you can omit Items .

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains a CustomErrorResponse element for each HTTP status code for which you
        # want to specify a custom error page and/or a caching duration.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::CustomErrorResponse)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::CustomErrorResponse)? = nil
        )
        end
      end

      # A complex type that contains the list of Custom Headers for each origin.

      struct CustomHeaders
        include JSON::Serializable

        # The number of custom headers, if any, for this distribution.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Optional : A list that contains one OriginCustomHeader element for each custom header that you want
        # CloudFront to forward to the origin. If Quantity is 0 , omit Items .

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginCustomHeader)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::OriginCustomHeader)? = nil
        )
        end
      end

      # A custom origin. A custom origin is any origin that is not an Amazon S3 bucket, with one exception.
      # An Amazon S3 bucket that is configured with static website hosting is a custom origin.

      struct CustomOriginConfig
        include JSON::Serializable

        # The HTTP port that CloudFront uses to connect to the origin. Specify the HTTP port that the origin
        # listens on.

        @[JSON::Field(key: "HTTPPort")]
        getter http_port : Int32

        # The HTTPS port that CloudFront uses to connect to the origin. Specify the HTTPS port that the origin
        # listens on.

        @[JSON::Field(key: "HTTPSPort")]
        getter https_port : Int32

        # Specifies the protocol (HTTP or HTTPS) that CloudFront uses to connect to the origin. Valid values
        # are: http-only – CloudFront always uses HTTP to connect to the origin. match-viewer – CloudFront
        # connects to the origin using the same protocol that the viewer used to connect to CloudFront.
        # https-only – CloudFront always uses HTTPS to connect to the origin.

        @[JSON::Field(key: "OriginProtocolPolicy")]
        getter origin_protocol_policy : String

        # Specifies which IP protocol CloudFront uses when connecting to your origin. If your origin uses both
        # IPv4 and IPv6 protocols, you can choose dualstack to help optimize reliability.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # Specifies how long, in seconds, CloudFront persists its connection to the origin. The minimum
        # timeout is 1 second, the maximum is 120 seconds, and the default (if you don't specify otherwise) is
        # 5 seconds. For more information, see Keep-alive timeout (custom origins only) in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "OriginKeepaliveTimeout")]
        getter origin_keepalive_timeout : Int32?

        # Specifies how long, in seconds, CloudFront waits for a response from the origin. This is also known
        # as the origin response timeout . The minimum timeout is 1 second, the maximum is 120 seconds, and
        # the default (if you don't specify otherwise) is 30 seconds. For more information, see Response
        # timeout in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginReadTimeout")]
        getter origin_read_timeout : Int32?

        # Specifies the minimum SSL/TLS protocol that CloudFront uses when connecting to your origin over
        # HTTPS. Valid values include SSLv3 , TLSv1 , TLSv1.1 , and TLSv1.2 . For more information, see
        # Minimum Origin SSL Protocol in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginSslProtocols")]
        getter origin_ssl_protocols : Types::OriginSslProtocols?

        def initialize(
          @http_port : Int32,
          @https_port : Int32,
          @origin_protocol_policy : String,
          @ip_address_type : String? = nil,
          @origin_keepalive_timeout : Int32? = nil,
          @origin_read_timeout : Int32? = nil,
          @origin_ssl_protocols : Types::OriginSslProtocols? = nil
        )
        end
      end

      # Customizations for the distribution tenant. For each distribution tenant, you can specify the
      # geographic restrictions, and the Amazon Resource Names (ARNs) for the ACM certificate and WAF web
      # ACL. These are specific values that you can override or disable from the multi-tenant distribution
      # that was used to create the distribution tenant.

      struct Customizations
        include JSON::Serializable

        # The Certificate Manager (ACM) certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::Certificate?

        # The geographic restrictions.

        @[JSON::Field(key: "GeoRestrictions")]
        getter geo_restrictions : Types::GeoRestrictionCustomization?

        # The WAF web ACL.

        @[JSON::Field(key: "WebAcl")]
        getter web_acl : Types::WebAclCustomization?

        def initialize(
          @certificate : Types::Certificate? = nil,
          @geo_restrictions : Types::GeoRestrictionCustomization? = nil,
          @web_acl : Types::WebAclCustomization? = nil
        )
        end
      end

      # A complex type that describes the default cache behavior if you don't specify a CacheBehavior
      # element or if request URLs don't match any of the values of PathPattern in CacheBehavior elements.
      # You must create exactly one default cache behavior. If your minimum TTL is greater than 0,
      # CloudFront will cache content for at least the duration specified in the cache policy's minimum TTL,
      # even if the Cache-Control: no-cache , no-store , or private directives are present in the origin
      # headers.

      struct DefaultCacheBehavior
        include JSON::Serializable

        # The value of ID for the origin that you want CloudFront to route requests to when they use the
        # default cache behavior.

        @[JSON::Field(key: "TargetOriginId")]
        getter target_origin_id : String

        # The protocol that viewers can use to access the files in the origin specified by TargetOriginId when
        # a request matches the path pattern in PathPattern . You can specify the following options: allow-all
        # : Viewers can use HTTP or HTTPS. redirect-to-https : If a viewer submits an HTTP request, CloudFront
        # returns an HTTP status code of 301 (Moved Permanently) to the viewer along with the HTTPS URL. The
        # viewer then resubmits the request using the new URL. https-only : If a viewer sends an HTTP request,
        # CloudFront returns an HTTP status code of 403 (Forbidden). For more information about requiring the
        # HTTPS protocol, see Requiring HTTPS Between Viewers and CloudFront in the Amazon CloudFront
        # Developer Guide . The only way to guarantee that viewers retrieve an object that was fetched from
        # the origin using HTTPS is never to use any other protocol to fetch the object. If you have recently
        # changed from HTTP to HTTPS, we recommend that you clear your objects' cache because cached objects
        # are protocol agnostic. That means that an edge location will return an object from the cache
        # regardless of whether the current request protocol matches the protocol used previously. For more
        # information, see Managing Cache Expiration in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "ViewerProtocolPolicy")]
        getter viewer_protocol_policy : String


        @[JSON::Field(key: "AllowedMethods")]
        getter allowed_methods : Types::AllowedMethods?

        # The unique identifier of the cache policy that is attached to the default cache behavior. For more
        # information, see Creating cache policies or Using the managed cache policies in the Amazon
        # CloudFront Developer Guide . A DefaultCacheBehavior must include either a CachePolicyId or
        # ForwardedValues . We recommend that you use a CachePolicyId .

        @[JSON::Field(key: "CachePolicyId")]
        getter cache_policy_id : String?

        # Whether you want CloudFront to automatically compress certain files for this cache behavior. If so,
        # specify true ; if not, specify false . For more information, see Serving Compressed Files in the
        # Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Compress")]
        getter compress : Bool?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # DefaultTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The default
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. The value that you specify
        # applies only when your origin does not add HTTP headers such as Cache-Control max-age ,
        # Cache-Control s-maxage , and Expires to objects. For more information, see Managing How Long Content
        # Stays in an Edge Cache (Expiration) in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "DefaultTTL")]
        getter default_ttl : Int64?

        # The value of ID for the field-level encryption configuration that you want CloudFront to use for
        # encrypting specific fields of data for the default cache behavior.

        @[JSON::Field(key: "FieldLevelEncryptionId")]
        getter field_level_encryption_id : String?

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. For more information, see Working with policies in the Amazon CloudFront
        # Developer Guide . If you want to include values in the cache key, use a cache policy. For more
        # information, see Creating cache policies or Using the managed cache policies in the Amazon
        # CloudFront Developer Guide . If you want to send values to the origin but not include them in the
        # cache key, use an origin request policy. For more information, see Creating origin request policies
        # or Using the managed origin request policies in the Amazon CloudFront Developer Guide . A
        # DefaultCacheBehavior must include either a CachePolicyId or ForwardedValues . We recommend that you
        # use a CachePolicyId . A complex type that specifies how CloudFront handles query strings, cookies,
        # and HTTP headers.

        @[JSON::Field(key: "ForwardedValues")]
        getter forwarded_values : Types::ForwardedValues?

        # A list of CloudFront functions that are associated with this cache behavior. Your functions must be
        # published to the LIVE stage to associate them with a cache behavior.

        @[JSON::Field(key: "FunctionAssociations")]
        getter function_associations : Types::FunctionAssociations?

        # The gRPC configuration for your cache behavior.

        @[JSON::Field(key: "GrpcConfig")]
        getter grpc_config : Types::GrpcConfig?

        # A complex type that contains zero or more Lambda@Edge function associations for a cache behavior.

        @[JSON::Field(key: "LambdaFunctionAssociations")]
        getter lambda_function_associations : Types::LambdaFunctionAssociations?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # MaxTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The maximum
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. The value that you specify
        # applies only when your origin adds HTTP headers such as Cache-Control max-age , Cache-Control
        # s-maxage , and Expires to objects. For more information, see Managing How Long Content Stays in an
        # Edge Cache (Expiration) in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "MaxTTL")]
        getter max_ttl : Int64?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use the
        # MinTTL field in a cache policy instead of this field. For more information, see Creating cache
        # policies or Using the managed cache policies in the Amazon CloudFront Developer Guide . The minimum
        # amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another
        # request to your origin to determine whether the object has been updated. For more information, see
        # Managing How Long Content Stays in an Edge Cache (Expiration) in the Amazon CloudFront Developer
        # Guide . You must specify 0 for MinTTL if you configure CloudFront to forward all headers to your
        # origin (under Headers , if you specify 1 for Quantity and * for Name ).

        @[JSON::Field(key: "MinTTL")]
        getter min_ttl : Int64?

        # The unique identifier of the origin request policy that is attached to the default cache behavior.
        # For more information, see Creating origin request policies or Using the managed origin request
        # policies in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginRequestPolicyId")]
        getter origin_request_policy_id : String?

        # The Amazon Resource Name (ARN) of the real-time log configuration that is attached to this cache
        # behavior. For more information, see Real-time logs in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "RealtimeLogConfigArn")]
        getter realtime_log_config_arn : String?

        # The identifier for a response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicyId")]
        getter response_headers_policy_id : String?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . Indicates whether you want to distribute media files in
        # the Microsoft Smooth Streaming format using the origin that is associated with this cache behavior.
        # If so, specify true ; if not, specify false . If you specify true for SmoothStreaming , you can
        # still distribute other content using this cache behavior if the content matches the value of
        # PathPattern .

        @[JSON::Field(key: "SmoothStreaming")]
        getter smooth_streaming : Bool?

        # A list of key groups that CloudFront can use to validate signed URLs or signed cookies. When a cache
        # behavior contains trusted key groups, CloudFront requires signed URLs or signed cookies for all
        # requests that match the cache behavior. The URLs or cookies must be signed with a private key whose
        # corresponding public key is in the key group. The signed URL or cookie contains information about
        # which public key CloudFront should use to verify the signature. For more information, see Serving
        # private content in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedKeyGroups")]
        getter trusted_key_groups : Types::TrustedKeyGroups?

        # We recommend using TrustedKeyGroups instead of TrustedSigners . This field only supports standard
        # distributions. You can't specify this field for multi-tenant distributions. For more information,
        # see Unsupported features for SaaS Manager for Amazon CloudFront in the Amazon CloudFront Developer
        # Guide . A list of Amazon Web Services account IDs whose public keys CloudFront can use to validate
        # signed URLs or signed cookies. When a cache behavior contains trusted signers, CloudFront requires
        # signed URLs or signed cookies for all requests that match the cache behavior. The URLs or cookies
        # must be signed with the private key of a CloudFront key pair in a trusted signer's Amazon Web
        # Services account. The signed URL or cookie contains information about which public key CloudFront
        # should use to verify the signature. For more information, see Serving private content in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedSigners")]
        getter trusted_signers : Types::TrustedSigners?

        def initialize(
          @target_origin_id : String,
          @viewer_protocol_policy : String,
          @allowed_methods : Types::AllowedMethods? = nil,
          @cache_policy_id : String? = nil,
          @compress : Bool? = nil,
          @default_ttl : Int64? = nil,
          @field_level_encryption_id : String? = nil,
          @forwarded_values : Types::ForwardedValues? = nil,
          @function_associations : Types::FunctionAssociations? = nil,
          @grpc_config : Types::GrpcConfig? = nil,
          @lambda_function_associations : Types::LambdaFunctionAssociations? = nil,
          @max_ttl : Int64? = nil,
          @min_ttl : Int64? = nil,
          @origin_request_policy_id : String? = nil,
          @realtime_log_config_arn : String? = nil,
          @response_headers_policy_id : String? = nil,
          @smooth_streaming : Bool? = nil,
          @trusted_key_groups : Types::TrustedKeyGroups? = nil,
          @trusted_signers : Types::TrustedSigners? = nil
        )
        end
      end


      struct DeleteAnycastIpListRequest
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the Anycast static IP list that you are deleting.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteCachePolicyRequest
        include JSON::Serializable

        # The unique identifier for the cache policy that you are deleting. To get the identifier, you can use
        # ListCachePolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version of the cache policy that you are deleting. The version is the cache policy's ETag value,
        # which you can get using ListCachePolicies , GetCachePolicy , or GetCachePolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end

      # Deletes a origin access identity.

      struct DeleteCloudFrontOriginAccessIdentityRequest
        include JSON::Serializable

        # The origin access identity's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header you received from a previous GET or PUT request. For example:
        # E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteConnectionFunctionRequest
        include JSON::Serializable

        # The connection function's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the connection function you are deleting.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteConnectionGroupRequest
        include JSON::Serializable

        # The ID of the connection group to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the connection group to delete.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteContinuousDeploymentPolicyRequest
        include JSON::Serializable

        # The identifier of the continuous deployment policy that you are deleting.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the continuous deployment policy that you are deleting.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end

      # This action deletes a web distribution. To delete a web distribution using the CloudFront API,
      # perform the following steps. To delete a web distribution using the CloudFront API: Disable the web
      # distribution Submit a GET Distribution Config request to get the current configuration and the Etag
      # header for the distribution. Update the XML document that was returned in the response to your GET
      # Distribution Config request to change the value of Enabled to false . Submit a PUT Distribution
      # Config request to update the configuration for your distribution. In the request body, include the
      # XML document that you updated in Step 3. Set the value of the HTTP If-Match header to the value of
      # the ETag header that CloudFront returned when you submitted the GET Distribution Config request in
      # Step 2. Review the response to the PUT Distribution Config request to confirm that the distribution
      # was successfully disabled. Submit a GET Distribution request to confirm that your changes have
      # propagated. When propagation is complete, the value of Status is Deployed . Submit a DELETE
      # Distribution request. Set the value of the HTTP If-Match header to the value of the ETag header that
      # CloudFront returned when you submitted the GET Distribution Config request in Step 6. Review the
      # response to your DELETE Distribution request to confirm that the distribution was successfully
      # deleted. For information about deleting a distribution using the CloudFront console, see Deleting a
      # Distribution in the Amazon CloudFront Developer Guide .

      struct DeleteDistributionRequest
        include JSON::Serializable

        # The distribution ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when you disabled the distribution. For example:
        # E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteDistributionTenantRequest
        include JSON::Serializable

        # The ID of the distribution tenant to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the distribution tenant. This value
        # is returned in the response of the GetDistributionTenant API operation.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteFieldLevelEncryptionConfigRequest
        include JSON::Serializable

        # The ID of the configuration you want to delete from CloudFront.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the configuration identity to delete.
        # For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteFieldLevelEncryptionProfileRequest
        include JSON::Serializable

        # Request the ID of the profile you want to delete from CloudFront.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the profile to delete. For example:
        # E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteFunctionRequest
        include JSON::Serializable

        # The current version ( ETag value) of the function that you are deleting, which you can get using
        # DescribeFunction .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the function that you are deleting.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @if_match : String,
          @name : String
        )
        end
      end


      struct DeleteKeyGroupRequest
        include JSON::Serializable

        # The identifier of the key group that you are deleting. To get the identifier, use ListKeyGroups .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version of the key group that you are deleting. The version is the key group's ETag value. To
        # get the ETag , use GetKeyGroup or GetKeyGroupConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteKeyValueStoreRequest
        include JSON::Serializable

        # The key value store to delete, if a match occurs.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the key value store.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @if_match : String,
          @name : String
        )
        end
      end


      struct DeleteMonitoringSubscriptionRequest
        include JSON::Serializable

        # The ID of the distribution that you are disabling metrics for.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        def initialize(
          @distribution_id : String
        )
        end
      end


      struct DeleteMonitoringSubscriptionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteOriginAccessControlRequest
        include JSON::Serializable

        # The unique identifier of the origin access control that you are deleting.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the origin access control that you are deleting.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteOriginRequestPolicyRequest
        include JSON::Serializable

        # The unique identifier for the origin request policy that you are deleting. To get the identifier,
        # you can use ListOriginRequestPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version of the origin request policy that you are deleting. The version is the origin request
        # policy's ETag value, which you can get using ListOriginRequestPolicies , GetOriginRequestPolicy , or
        # GetOriginRequestPolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeletePublicKeyRequest
        include JSON::Serializable

        # The ID of the public key you want to remove from CloudFront.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the public key identity to delete.
        # For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteRealtimeLogConfigRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the real-time log configuration to delete.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the real-time log configuration to delete.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudFront resource for which the resource policy should be
        # deleted.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeleteResponseHeadersPolicyRequest
        include JSON::Serializable

        # The identifier for the response headers policy that you are deleting. To get the identifier, you can
        # use ListResponseHeadersPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version of the response headers policy that you are deleting. The version is the response
        # headers policy's ETag value, which you can get using ListResponseHeadersPolicies ,
        # GetResponseHeadersPolicy , or GetResponseHeadersPolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end

      # The request to delete a streaming distribution.

      struct DeleteStreamingDistributionRequest
        include JSON::Serializable

        # The distribution ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when you disabled the streaming distribution. For
        # example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DeleteTrustStoreRequest
        include JSON::Serializable

        # The trust store's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the trust store you are deleting.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteVpcOriginRequest
        include JSON::Serializable

        # The VPC origin ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version identifier of the VPC origin to delete. This is the ETag value returned in the response
        # to GetVpcOrigin .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct DeleteVpcOriginResult
        include JSON::Serializable

        # The VPC origin ETag.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The VPC origin.

        @[JSON::Field(key: "VpcOrigin")]
        getter vpc_origin : Types::VpcOrigin?

        def initialize(
          @e_tag : String? = nil,
          @vpc_origin : Types::VpcOrigin? = nil
        )
        end
      end


      struct DescribeConnectionFunctionRequest
        include JSON::Serializable

        # The connection function's identifier.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The connection function's stage.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @identifier : String,
          @stage : String? = nil
        )
        end
      end


      struct DescribeConnectionFunctionResult
        include JSON::Serializable

        # The connection function's summary.

        @[JSON::Field(key: "ConnectionFunctionSummary")]
        getter connection_function_summary : Types::ConnectionFunctionSummary?

        # The version identifier for the current version of the connection function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_function_summary : Types::ConnectionFunctionSummary? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct DescribeFunctionRequest
        include JSON::Serializable

        # The name of the function that you are getting information about.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The function's stage, either DEVELOPMENT or LIVE .

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @name : String,
          @stage : String? = nil
        )
        end
      end


      struct DescribeFunctionResult
        include JSON::Serializable

        # The version identifier for the current version of the CloudFront function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains configuration information and metadata about a CloudFront function.

        @[JSON::Field(key: "FunctionSummary")]
        getter function_summary : Types::FunctionSummary?

        def initialize(
          @e_tag : String? = nil,
          @function_summary : Types::FunctionSummary? = nil
        )
        end
      end


      struct DescribeKeyValueStoreRequest
        include JSON::Serializable

        # The name of the key value store.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribeKeyValueStoreResult
        include JSON::Serializable

        # The ETag of the resulting key value store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The resulting key value store.

        @[JSON::Field(key: "KeyValueStore")]
        getter key_value_store : Types::KeyValueStore?

        def initialize(
          @e_tag : String? = nil,
          @key_value_store : Types::KeyValueStore? = nil
        )
        end
      end


      struct DisassociateDistributionTenantWebACLRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version of the distribution tenant that you're disassociating from the WAF web ACL. This
        # is the ETag value returned in the response to the GetDistributionTenant API operation.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DisassociateDistributionTenantWebACLResult
        include JSON::Serializable

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @e_tag : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct DisassociateDistributionWebACLRequest
        include JSON::Serializable

        # The ID of the distribution.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the distribution that you're
        # disassociating from the WAF web ACL.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct DisassociateDistributionWebACLResult
        include JSON::Serializable

        # The current version of the distribution.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The ID of the distribution.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @e_tag : String? = nil,
          @id : String? = nil
        )
        end
      end

      # A distribution tells CloudFront where you want content to be delivered from, and the details about
      # how to track and manage content delivery.

      struct Distribution
        include JSON::Serializable

        # The distribution's Amazon Resource Name (ARN).

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The distribution's configuration.

        @[JSON::Field(key: "DistributionConfig")]
        getter distribution_config : Types::DistributionConfig

        # The distribution's CloudFront domain name. For example: d111111abcdef8.cloudfront.net .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The distribution's identifier. For example: E1U5RQF7T870K0 .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The number of invalidation batches currently in progress.

        @[JSON::Field(key: "InProgressInvalidationBatches")]
        getter in_progress_invalidation_batches : Int32

        # The date and time when the distribution was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The distribution's status. When the status is Deployed , the distribution's information is fully
        # propagated to all CloudFront edge locations.

        @[JSON::Field(key: "Status")]
        getter status : String

        # This field contains a list of key groups and the public keys in each key group that CloudFront can
        # use to verify the signatures of signed URLs or signed cookies.

        @[JSON::Field(key: "ActiveTrustedKeyGroups")]
        getter active_trusted_key_groups : Types::ActiveTrustedKeyGroups?

        # We recommend using TrustedKeyGroups instead of TrustedSigners . This field contains a list of Amazon
        # Web Services account IDs and the active CloudFront key pairs in each account that CloudFront can use
        # to verify the signatures of signed URLs or signed cookies.

        @[JSON::Field(key: "ActiveTrustedSigners")]
        getter active_trusted_signers : Types::ActiveTrustedSigners?

        # Amazon Web Services services in China customers must file for an Internet Content Provider (ICP)
        # recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME,
        # that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs
        # associated with distributions. For more information about ICP recordals, see Signup, Accounts, and
        # Credentials in Getting Started with Amazon Web Services services in China .

        @[JSON::Field(key: "AliasICPRecordals")]
        getter alias_icp_recordals : Array(Types::AliasICPRecordal)?

        def initialize(
          @arn : String,
          @distribution_config : Types::DistributionConfig,
          @domain_name : String,
          @id : String,
          @in_progress_invalidation_batches : Int32,
          @last_modified_time : Time,
          @status : String,
          @active_trusted_key_groups : Types::ActiveTrustedKeyGroups? = nil,
          @active_trusted_signers : Types::ActiveTrustedSigners? = nil,
          @alias_icp_recordals : Array(Types::AliasICPRecordal)? = nil
        )
        end
      end

      # The caller reference you attempted to create the distribution with is associated with another
      # distribution.

      struct DistributionAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A distribution configuration.

      struct DistributionConfig
        include JSON::Serializable

        # A unique value (for example, a date-time stamp) that ensures that the request can't be replayed. If
        # the value of CallerReference is new (regardless of the content of the DistributionConfig object),
        # CloudFront creates a new distribution. If CallerReference is a value that you already sent in a
        # previous request to create a distribution, CloudFront returns a DistributionAlreadyExists error.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A comment to describe the distribution. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # A complex type that describes the default cache behavior if you don't specify a CacheBehavior
        # element or if files don't match any of the values of PathPattern in CacheBehavior elements. You must
        # create exactly one default cache behavior.

        @[JSON::Field(key: "DefaultCacheBehavior")]
        getter default_cache_behavior : Types::DefaultCacheBehavior

        # From this field, you can enable or disable the selected distribution.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # A complex type that contains information about origins for this distribution.

        @[JSON::Field(key: "Origins")]
        getter origins : Types::Origins

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . A complex type that contains information about CNAMEs
        # (alternate domain names), if any, for this distribution.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Types::Aliases?

        # To use this field for a multi-tenant distribution, use a connection group instead. For more
        # information, see ConnectionGroup . ID of the Anycast static IP list that is associated with the
        # distribution.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # A complex type that contains zero or more CacheBehavior elements.

        @[JSON::Field(key: "CacheBehaviors")]
        getter cache_behaviors : Types::CacheBehaviors?

        # The distribution's connection function association.

        @[JSON::Field(key: "ConnectionFunctionAssociation")]
        getter connection_function_association : Types::ConnectionFunctionAssociation?

        # This field specifies whether the connection mode is through a standard distribution (direct) or a
        # multi-tenant distribution with distribution tenants (tenant-only).

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . The identifier of a continuous deployment policy. For
        # more information, see CreateContinuousDeploymentPolicy .

        @[JSON::Field(key: "ContinuousDeploymentPolicyId")]
        getter continuous_deployment_policy_id : String?

        # A complex type that controls the following: Whether CloudFront replaces HTTP status codes in the 4xx
        # and 5xx range with custom error messages before returning the response to the viewer. How long
        # CloudFront caches HTTP status codes in the 4xx and 5xx range. For more information about custom
        # error pages, see Customizing Error Responses in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "CustomErrorResponses")]
        getter custom_error_responses : Types::CustomErrorResponses?

        # When a viewer requests the root URL for your distribution, the default root object is the object
        # that you want CloudFront to request from your origin. For example, if your root URL is
        # https://www.example.com , you can specify CloudFront to return the index.html file as the default
        # root object. You can specify a default root object so that viewers see a specific file or object,
        # instead of another object in your distribution (for example,
        # https://www.example.com/product-description.html ). A default root object avoids exposing the
        # contents of your distribution. You can specify the object name or a path to the object name (for
        # example, index.html or exampleFolderName/index.html ). Your string can't begin with a forward slash
        # ( / ). Only specify the object name or the path to the object. If you don't want to specify a
        # default root object when you create a distribution, include an empty DefaultRootObject element. To
        # delete the default root object from an existing distribution, update the distribution configuration
        # and include an empty DefaultRootObject element. To replace the default root object, update the
        # distribution configuration and specify the new object. For more information about the default root
        # object, see Specify a default root object in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "DefaultRootObject")]
        getter default_root_object : String?

        # (Optional) Specify the HTTP version(s) that you want viewers to use to communicate with CloudFront.
        # The default value for new web distributions is http2 . Viewers that don't support HTTP/2
        # automatically use an earlier HTTP version. For viewers and CloudFront to use HTTP/2, viewers must
        # support TLSv1.2 or later, and must support Server Name Indication (SNI). For viewers and CloudFront
        # to use HTTP/3, viewers must support TLSv1.3 and Server Name Indication (SNI). CloudFront supports
        # HTTP/3 connection migration to allow the viewer to switch networks without losing connection. For
        # more information about connection migration, see Connection Migration at RFC 9000. For more
        # information about supported TLSv1.3 ciphers, see Supported protocols and ciphers between viewers and
        # CloudFront .

        @[JSON::Field(key: "HttpVersion")]
        getter http_version : String?

        # To use this field for a multi-tenant distribution, use a connection group instead. For more
        # information, see ConnectionGroup . If you want CloudFront to respond to IPv6 DNS requests with an
        # IPv6 address for your distribution, specify true . If you specify false , CloudFront responds to
        # IPv6 DNS requests with the DNS response code NOERROR and with no IP addresses. This allows viewers
        # to submit a second request, for an IPv4 address for your distribution. In general, you should enable
        # IPv6 if you have users on IPv6 networks who want to access your content. However, if you're using
        # signed URLs or signed cookies to restrict access to your content, and if you're using a custom
        # policy that includes the IpAddress parameter to restrict the IP addresses that can access your
        # content, don't enable IPv6. If you want to restrict access to some content by IP address and not
        # restrict access to other content (or restrict access but not by IP address), you can create two
        # distributions. For more information, see Creating a Signed URL Using a Custom Policy in the Amazon
        # CloudFront Developer Guide . If you're using an Route 53 Amazon Web Services Integration alias
        # resource record set to route traffic to your CloudFront distribution, you need to create a second
        # alias resource record set when both of the following are true: You enable IPv6 for the distribution
        # You're using alternate domain names in the URLs for your objects For more information, see Routing
        # Traffic to an Amazon CloudFront Web Distribution by Using Your Domain Name in the Route 53 Amazon
        # Web Services Integration Developer Guide . If you created a CNAME resource record set, either with
        # Route 53 Amazon Web Services Integration or with another DNS service, you don't need to make any
        # changes. A CNAME record will route traffic to your distribution regardless of the IP address format
        # of the viewer request.

        @[JSON::Field(key: "IsIPV6Enabled")]
        getter is_ipv6_enabled : Bool?

        # A complex type that controls whether access logs are written for the distribution. For more
        # information about logging, see Access Logs in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Logging")]
        getter logging : Types::LoggingConfig?

        # A complex type that contains information about origin groups for this distribution.

        @[JSON::Field(key: "OriginGroups")]
        getter origin_groups : Types::OriginGroups?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . The price class that corresponds with the maximum price
        # that you want to pay for CloudFront service. If you specify PriceClass_All , CloudFront responds to
        # requests for your objects from all CloudFront edge locations. If you specify a price class other
        # than PriceClass_All , CloudFront serves your objects from the CloudFront edge location that has the
        # lowest latency among the edge locations in your price class. Viewers who are in or near regions that
        # are excluded from your specified price class may encounter slower performance. For more information
        # about price classes, see Choosing the Price Class for a CloudFront Distribution in the Amazon
        # CloudFront Developer Guide . For information about CloudFront pricing, including how price classes
        # (such as Price Class 100) map to CloudFront regions, see Amazon CloudFront Pricing .

        @[JSON::Field(key: "PriceClass")]
        getter price_class : String?

        # A complex type that identifies ways in which you want to restrict distribution of your content.

        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::Restrictions?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . A Boolean that indicates whether this is a staging
        # distribution. When this value is true , this is a staging distribution. When this value is false ,
        # this is not a staging distribution.

        @[JSON::Field(key: "Staging")]
        getter staging : Bool?

        # This field only supports multi-tenant distributions. You can't specify this field for standard
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . A distribution tenant configuration.

        @[JSON::Field(key: "TenantConfig")]
        getter tenant_config : Types::TenantConfig?

        # A complex type that determines the distribution's SSL/TLS configuration for communicating with
        # viewers.

        @[JSON::Field(key: "ViewerCertificate")]
        getter viewer_certificate : Types::ViewerCertificate?

        # The distribution's viewer mTLS configuration.

        @[JSON::Field(key: "ViewerMtlsConfig")]
        getter viewer_mtls_config : Types::ViewerMtlsConfig?

        # Multi-tenant distributions only support WAF V2 web ACLs. A unique identifier that specifies the WAF
        # web ACL, if any, to associate with this distribution. To specify a web ACL created using the latest
        # version of WAF, use the ACL ARN, for example
        # arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111
        # . To specify a web ACL created using WAF Classic, use the ACL ID, for example
        # a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 . WAF is a web application firewall that lets you monitor the
        # HTTP and HTTPS requests that are forwarded to CloudFront, and lets you control access to your
        # content. Based on conditions that you specify, such as the IP addresses that requests originate from
        # or the values of query strings, CloudFront responds to requests either with the requested content or
        # with an HTTP 403 status code (Forbidden). You can also configure CloudFront to return a custom error
        # page when a request is blocked. For more information about WAF, see the WAF Developer Guide .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String?

        def initialize(
          @caller_reference : String,
          @comment : String,
          @default_cache_behavior : Types::DefaultCacheBehavior,
          @enabled : Bool,
          @origins : Types::Origins,
          @aliases : Types::Aliases? = nil,
          @anycast_ip_list_id : String? = nil,
          @cache_behaviors : Types::CacheBehaviors? = nil,
          @connection_function_association : Types::ConnectionFunctionAssociation? = nil,
          @connection_mode : String? = nil,
          @continuous_deployment_policy_id : String? = nil,
          @custom_error_responses : Types::CustomErrorResponses? = nil,
          @default_root_object : String? = nil,
          @http_version : String? = nil,
          @is_ipv6_enabled : Bool? = nil,
          @logging : Types::LoggingConfig? = nil,
          @origin_groups : Types::OriginGroups? = nil,
          @price_class : String? = nil,
          @restrictions : Types::Restrictions? = nil,
          @staging : Bool? = nil,
          @tenant_config : Types::TenantConfig? = nil,
          @viewer_certificate : Types::ViewerCertificate? = nil,
          @viewer_mtls_config : Types::ViewerMtlsConfig? = nil,
          @web_acl_id : String? = nil
        )
        end
      end

      # A distribution Configuration and a list of tags to be associated with the distribution.

      struct DistributionConfigWithTags
        include JSON::Serializable

        # A distribution configuration.

        @[JSON::Field(key: "DistributionConfig")]
        getter distribution_config : Types::DistributionConfig

        # A complex type that contains zero or more Tag elements.

        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags

        def initialize(
          @distribution_config : Types::DistributionConfig,
          @tags : Types::Tags
        )
        end
      end

      # A list of distribution IDs.

      struct DistributionIdList
        include JSON::Serializable

        # A flag that indicates whether more distribution IDs remain to be listed. If your results were
        # truncated, you can make a subsequent request using the Marker request field to retrieve more
        # distribution IDs in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value provided in the Marker request field.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of distribution IDs requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The total number of distribution IDs returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Contains the distribution IDs in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        # Contains the value that you should use in the Marker field of a subsequent request to continue
        # listing distribution IDs where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(String)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A structure that pairs a CloudFront distribution ID with its owning Amazon Web Services account ID.

      struct DistributionIdOwner
        include JSON::Serializable

        # The ID of the distribution.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # The ID of the Amazon Web Services account that owns the distribution.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String

        def initialize(
          @distribution_id : String,
          @owner_account_id : String
        )
        end
      end

      # The list of distribution IDs and the Amazon Web Services accounts that they belong to.

      struct DistributionIdOwnerList
        include JSON::Serializable

        # A flag that indicates whether more DistributionIdOwner objects remain to be listed. If your results
        # were truncated, you can make a follow-up pagination request using the Marker request parameter to
        # retrieve more results in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # Use this field when paginating results to indicate where to begin in your list of
        # DistributionIdOwner objects. The response includes distributions in the list that occur after the
        # marker. To get the next page of the list, set this field's value to the value of NextMarker from the
        # current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of DistributionIdOwner objects to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # Specifies the actual number of DistributionIdOwner objects included in the list for the current
        # page.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The number of DistributionIdOwner objects.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DistributionIdOwner)?

        # A token used for pagination of results returned in the response. You can use the token from the
        # previous request to define where the current request should begin.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::DistributionIdOwner)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A distribution list.

      struct DistributionList
        include JSON::Serializable

        # A flag that indicates whether more distributions remain to be listed. If your results were
        # truncated, you can make a follow-up pagination request using the Marker request parameter to
        # retrieve more distributions in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value you provided for the Marker request parameter.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The value you provided for the MaxItems request parameter.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of distributions that were created by the current Amazon Web Services account.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains one DistributionSummary element for each distribution that was created
        # by the current Amazon Web Services account.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DistributionSummary)?

        # If IsTruncated is true , this element is present and contains the value you can use for the Marker
        # request parameter to continue listing your distributions where they left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::DistributionSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The specified CloudFront distribution is not disabled. You must disable the distribution before you
      # can delete it.

      struct DistributionNotDisabled
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The IDs for the distribution resources.

      struct DistributionResourceId
        include JSON::Serializable

        # The ID of the multi-tenant distribution.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String?

        # The ID of the distribution tenant.

        @[JSON::Field(key: "DistributionTenantId")]
        getter distribution_tenant_id : String?

        def initialize(
          @distribution_id : String? = nil,
          @distribution_tenant_id : String? = nil
        )
        end
      end

      # A summary of the information about a CloudFront distribution.

      struct DistributionSummary
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the distribution. For example:
        # arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5 , where 123456789012 is your Amazon
        # Web Services account ID.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # A complex type that contains information about CNAMEs (alternate domain names), if any, for this
        # distribution.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Types::Aliases

        # A complex type that contains zero or more CacheBehavior elements.

        @[JSON::Field(key: "CacheBehaviors")]
        getter cache_behaviors : Types::CacheBehaviors

        # The comment originally specified when this distribution was created.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # A complex type that contains zero or more CustomErrorResponses elements.

        @[JSON::Field(key: "CustomErrorResponses")]
        getter custom_error_responses : Types::CustomErrorResponses

        # A complex type that describes the default cache behavior if you don't specify a CacheBehavior
        # element or if files don't match any of the values of PathPattern in CacheBehavior elements. You must
        # create exactly one default cache behavior.

        @[JSON::Field(key: "DefaultCacheBehavior")]
        getter default_cache_behavior : Types::DefaultCacheBehavior

        # The domain name that corresponds to the distribution, for example, d111111abcdef8.cloudfront.net .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether the distribution is enabled to accept user requests for content.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Specify the maximum HTTP version that you want viewers to use to communicate with CloudFront. The
        # default value for new web distributions is http2 . Viewers that don't support HTTP/2 will
        # automatically use an earlier version.

        @[JSON::Field(key: "HttpVersion")]
        getter http_version : String

        # The identifier for the distribution. For example: EDFDVBD632BHDS5 .

        @[JSON::Field(key: "Id")]
        getter id : String

        # Whether CloudFront responds to IPv6 DNS requests with an IPv6 address for your distribution.

        @[JSON::Field(key: "IsIPV6Enabled")]
        getter is_ipv6_enabled : Bool

        # The date and time the distribution was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # A complex type that contains information about origins for this distribution.

        @[JSON::Field(key: "Origins")]
        getter origins : Types::Origins

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . A complex type that contains information about price
        # class for this streaming distribution.

        @[JSON::Field(key: "PriceClass")]
        getter price_class : String

        # A complex type that identifies ways in which you want to restrict distribution of your content.

        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::Restrictions

        # A Boolean that indicates whether this is a staging distribution. When this value is true , this is a
        # staging distribution. When this value is false , this is not a staging distribution.

        @[JSON::Field(key: "Staging")]
        getter staging : Bool

        # The current status of the distribution. When the status is Deployed , the distribution's information
        # is propagated to all CloudFront edge locations.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A complex type that determines the distribution's SSL/TLS configuration for communicating with
        # viewers.

        @[JSON::Field(key: "ViewerCertificate")]
        getter viewer_certificate : Types::ViewerCertificate

        # The Web ACL Id (if any) associated with the distribution.

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        # Amazon Web Services services in China customers must file for an Internet Content Provider (ICP)
        # recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME,
        # that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs
        # associated with distributions. For more information about ICP recordals, see Signup, Accounts, and
        # Credentials in Getting Started with Amazon Web Services services in China .

        @[JSON::Field(key: "AliasICPRecordals")]
        getter alias_icp_recordals : Array(Types::AliasICPRecordal)?

        # ID of the Anycast static IP list that is associated with the distribution.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # The distribution's connection function association.

        @[JSON::Field(key: "ConnectionFunctionAssociation")]
        getter connection_function_association : Types::ConnectionFunctionAssociation?

        # This field specifies whether the connection mode is through a standard distribution (direct) or a
        # multi-tenant distribution with distribution tenants (tenant-only).

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # The current version of the distribution.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # A complex type that contains information about origin groups for this distribution.

        @[JSON::Field(key: "OriginGroups")]
        getter origin_groups : Types::OriginGroups?

        # The distribution's viewer mTLS configuration.

        @[JSON::Field(key: "ViewerMtlsConfig")]
        getter viewer_mtls_config : Types::ViewerMtlsConfig?

        def initialize(
          @arn : String,
          @aliases : Types::Aliases,
          @cache_behaviors : Types::CacheBehaviors,
          @comment : String,
          @custom_error_responses : Types::CustomErrorResponses,
          @default_cache_behavior : Types::DefaultCacheBehavior,
          @domain_name : String,
          @enabled : Bool,
          @http_version : String,
          @id : String,
          @is_ipv6_enabled : Bool,
          @last_modified_time : Time,
          @origins : Types::Origins,
          @price_class : String,
          @restrictions : Types::Restrictions,
          @staging : Bool,
          @status : String,
          @viewer_certificate : Types::ViewerCertificate,
          @web_acl_id : String,
          @alias_icp_recordals : Array(Types::AliasICPRecordal)? = nil,
          @anycast_ip_list_id : String? = nil,
          @connection_function_association : Types::ConnectionFunctionAssociation? = nil,
          @connection_mode : String? = nil,
          @e_tag : String? = nil,
          @origin_groups : Types::OriginGroups? = nil,
          @viewer_mtls_config : Types::ViewerMtlsConfig? = nil
        )
        end
      end

      # The distribution tenant.

      struct DistributionTenant
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution tenant.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the connection group for the distribution tenant. If you don't specify a connection group,
        # CloudFront uses the default connection group.

        @[JSON::Field(key: "ConnectionGroupId")]
        getter connection_group_id : String?

        # The date and time when the distribution tenant was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # Customizations for the distribution tenant. For each distribution tenant, you can specify the
        # geographic restrictions, and the Amazon Resource Names (ARNs) for the ACM certificate and WAF web
        # ACL. These are specific values that you can override or disable from the multi-tenant distribution
        # that was used to create the distribution tenant.

        @[JSON::Field(key: "Customizations")]
        getter customizations : Types::Customizations?

        # The ID of the multi-tenant distribution.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String?

        # The domains associated with the distribution tenant.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainResult)?

        # Indicates whether the distribution tenant is in an enabled state. If disabled, the distribution
        # tenant won't serve traffic.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time when the distribution tenant was updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the distribution tenant.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of parameter values to add to the resource. A parameter is specified as a key-value pair. A
        # valid parameter value must exist for any parameter that is marked as required in the multi-tenant
        # distribution.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        # The status of the distribution tenant.

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags?

        def initialize(
          @arn : String? = nil,
          @connection_group_id : String? = nil,
          @created_time : Time? = nil,
          @customizations : Types::Customizations? = nil,
          @distribution_id : String? = nil,
          @domains : Array(Types::DomainResult)? = nil,
          @enabled : Bool? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @status : String? = nil,
          @tags : Types::Tags? = nil
        )
        end
      end

      # Filter by the associated distribution ID or connection group ID.

      struct DistributionTenantAssociationFilter
        include JSON::Serializable

        # The ID of the connection group to filter by. You can find distribution tenants associated with a
        # specific connection group.

        @[JSON::Field(key: "ConnectionGroupId")]
        getter connection_group_id : String?

        # The distribution ID to filter by. You can find distribution tenants associated with a specific
        # distribution.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String?

        def initialize(
          @connection_group_id : String? = nil,
          @distribution_id : String? = nil
        )
        end
      end

      # A summary of the information about a distribution tenant.

      struct DistributionTenantSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the distribution tenant.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time when the distribution tenant was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The identifier for the multi-tenant distribution. For example: EDFDVBD632BHDS5 .

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # The domains associated with the distribution tenant.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainResult)

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the distribution tenant was updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The name of the distribution tenant.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the connection group ID for the distribution tenant. If you don't specify a connection
        # group, CloudFront uses the default connection group.

        @[JSON::Field(key: "ConnectionGroupId")]
        getter connection_group_id : String?

        # Customizations for the distribution tenant. For each distribution tenant, you can specify the
        # geographic restrictions, and the Amazon Resource Names (ARNs) for the ACM certificate and WAF web
        # ACL. These are specific values that you can override or disable from the multi-tenant distribution
        # that was used to create the distribution tenant.

        @[JSON::Field(key: "Customizations")]
        getter customizations : Types::Customizations?

        # Indicates whether the distribution tenants are in an enabled state. If disabled, the distribution
        # tenant won't service traffic.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The status of the distribution tenant.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String,
          @created_time : Time,
          @distribution_id : String,
          @domains : Array(Types::DomainResult),
          @e_tag : String,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @connection_group_id : String? = nil,
          @customizations : Types::Customizations? = nil,
          @enabled : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # The DNS configuration for your domain names.

      struct DnsConfiguration
        include JSON::Serializable

        # The domain name that you're verifying.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The status of your domain name. valid-configuration : The domain name is correctly configured and
        # points to the correct routing endpoint of the connection group. invalid-configuration : There is
        # either a missing DNS record or the DNS record exists but it's using an incorrect routing endpoint.
        # Update the DNS record to point to the correct routing endpoint. unknown-configuration : CloudFront
        # can't validate your DNS configuration. This status can appear if CloudFront can't verify the DNS
        # record, or the DNS lookup request failed or timed out.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Explains the status of the DNS configuration.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @domain : String,
          @status : String,
          @reason : String? = nil
        )
        end
      end

      # Contains information about the domain conflict. Use this information to determine the affected
      # domain, the related resource, and the affected Amazon Web Services account.

      struct DomainConflict
        include JSON::Serializable

        # The ID of the Amazon Web Services account for the domain conflict.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The domain used to find existing conflicts for domain configurations.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The ID of the resource that has a domain conflict.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The CloudFront resource type that has a domain conflict.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @account_id : String,
          @domain : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The domain for the specified distribution tenant.

      struct DomainItem
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        def initialize(
          @domain : String
        )
        end
      end

      # The details about the domain result.

      struct DomainResult
        include JSON::Serializable

        # The specified domain.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # Whether the domain is active or inactive.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @domain : String,
          @status : String? = nil
        )
        end
      end

      # Complex data type for field-level encryption profiles that includes all of the encryption entities.

      struct EncryptionEntities
        include JSON::Serializable

        # Number of field pattern items in a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # An array of field patterns in a field-level encryption content type-profile mapping.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::EncryptionEntity)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::EncryptionEntity)? = nil
        )
        end
      end

      # Complex data type for field-level encryption profiles that includes the encryption key and field
      # pattern specifications.

      struct EncryptionEntity
        include JSON::Serializable

        # Field patterns in a field-level encryption content type profile specify the fields that you want to
        # be encrypted. You can provide the full field name, or any beginning characters followed by a
        # wildcard (*). You can't overlap field patterns. For example, you can't have both ABC* and AB*. Note
        # that field patterns are case-sensitive.

        @[JSON::Field(key: "FieldPatterns")]
        getter field_patterns : Types::FieldPatterns

        # The provider associated with the public key being used for encryption. This value must also be
        # provided with the private key for applications to be able to decrypt data.

        @[JSON::Field(key: "ProviderId")]
        getter provider_id : String

        # The public key associated with a set of field-level encryption patterns, to be used when encrypting
        # the fields that match the patterns.

        @[JSON::Field(key: "PublicKeyId")]
        getter public_key_id : String

        def initialize(
          @field_patterns : Types::FieldPatterns,
          @provider_id : String,
          @public_key_id : String
        )
        end
      end

      # Contains information about the Amazon Kinesis data stream where you're sending real-time log data in
      # a real-time log configuration.

      struct EndPoint
        include JSON::Serializable

        # The type of data stream where you are sending real-time log data. The only valid value is Kinesis .

        @[JSON::Field(key: "StreamType")]
        getter stream_type : String

        # Contains information about the Amazon Kinesis data stream where you are sending real-time log data
        # in a real-time log configuration.

        @[JSON::Field(key: "KinesisStreamConfig")]
        getter kinesis_stream_config : Types::KinesisStreamConfig?

        def initialize(
          @stream_type : String,
          @kinesis_stream_config : Types::KinesisStreamConfig? = nil
        )
        end
      end

      # The entity already exists. You must provide a unique entity.

      struct EntityAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The entity limit has been exceeded.

      struct EntityLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The entity was not found.

      struct EntityNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The entity size limit was exceeded.

      struct EntitySizeLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex data type that includes the profile configurations and other options specified for
      # field-level encryption.

      struct FieldLevelEncryption
        include JSON::Serializable

        # A complex data type that includes the profile configurations specified for field-level encryption.

        @[JSON::Field(key: "FieldLevelEncryptionConfig")]
        getter field_level_encryption_config : Types::FieldLevelEncryptionConfig

        # The configuration ID for a field-level encryption configuration which includes a set of profiles
        # that specify certain selected data fields to be encrypted by specific public keys.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The last time the field-level encryption configuration was changed.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @field_level_encryption_config : Types::FieldLevelEncryptionConfig,
          @id : String,
          @last_modified_time : Time
        )
        end
      end

      # A complex data type that includes the profile configurations specified for field-level encryption.

      struct FieldLevelEncryptionConfig
        include JSON::Serializable

        # A unique number that ensures the request can't be replayed.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # An optional comment about the configuration. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # A complex data type that specifies when to forward content if a content type isn't recognized and
        # profiles to use as by default in a request if a query argument doesn't specify a profile to use.

        @[JSON::Field(key: "ContentTypeProfileConfig")]
        getter content_type_profile_config : Types::ContentTypeProfileConfig?

        # A complex data type that specifies when to forward content if a profile isn't found and the profile
        # that can be provided as a query argument in a request.

        @[JSON::Field(key: "QueryArgProfileConfig")]
        getter query_arg_profile_config : Types::QueryArgProfileConfig?

        def initialize(
          @caller_reference : String,
          @comment : String? = nil,
          @content_type_profile_config : Types::ContentTypeProfileConfig? = nil,
          @query_arg_profile_config : Types::QueryArgProfileConfig? = nil
        )
        end
      end

      # The specified configuration for field-level encryption already exists.

      struct FieldLevelEncryptionConfigAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified configuration for field-level encryption is in use.

      struct FieldLevelEncryptionConfigInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # List of field-level encryption configurations.

      struct FieldLevelEncryptionList
        include JSON::Serializable

        # The maximum number of elements you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of field-level encryption items.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # An array of field-level encryption items.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::FieldLevelEncryptionSummary)?

        # If there are more elements to be listed, this element is present and contains the value that you can
        # use for the Marker request parameter to continue listing your configurations where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::FieldLevelEncryptionSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A complex data type for field-level encryption profiles.

      struct FieldLevelEncryptionProfile
        include JSON::Serializable

        # A complex data type that includes the profile name and the encryption entities for the field-level
        # encryption profile.

        @[JSON::Field(key: "FieldLevelEncryptionProfileConfig")]
        getter field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig

        # The ID for a field-level encryption profile configuration which includes a set of profiles that
        # specify certain selected data fields to be encrypted by specific public keys.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The last time the field-level encryption profile was updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig,
          @id : String,
          @last_modified_time : Time
        )
        end
      end

      # The specified profile for field-level encryption already exists.

      struct FieldLevelEncryptionProfileAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex data type of profiles for the field-level encryption.

      struct FieldLevelEncryptionProfileConfig
        include JSON::Serializable

        # A unique number that ensures that the request can't be replayed.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A complex data type of encryption entities for the field-level encryption profile that include the
        # public key ID, provider, and field patterns for specifying which fields to encrypt with this key.

        @[JSON::Field(key: "EncryptionEntities")]
        getter encryption_entities : Types::EncryptionEntities

        # Profile name for the field-level encryption profile.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An optional comment for the field-level encryption profile. The comment cannot be longer than 128
        # characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @caller_reference : String,
          @encryption_entities : Types::EncryptionEntities,
          @name : String,
          @comment : String? = nil
        )
        end
      end

      # The specified profile for field-level encryption is in use.

      struct FieldLevelEncryptionProfileInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # List of field-level encryption profiles.

      struct FieldLevelEncryptionProfileList
        include JSON::Serializable

        # The maximum number of field-level encryption profiles you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of field-level encryption profiles.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The field-level encryption profile items.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::FieldLevelEncryptionProfileSummary)?

        # If there are more elements to be listed, this element is present and contains the value that you can
        # use for the Marker request parameter to continue listing your profiles where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::FieldLevelEncryptionProfileSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The maximum size of a profile for field-level encryption was exceeded.

      struct FieldLevelEncryptionProfileSizeExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The field-level encryption profile summary.

      struct FieldLevelEncryptionProfileSummary
        include JSON::Serializable

        # A complex data type of encryption entities for the field-level encryption profile that include the
        # public key ID, provider, and field patterns for specifying which fields to encrypt with this key.

        @[JSON::Field(key: "EncryptionEntities")]
        getter encryption_entities : Types::EncryptionEntities

        # ID for the field-level encryption profile summary.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The time when the field-level encryption profile summary was last updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # Name for the field-level encryption profile summary.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An optional comment for the field-level encryption profile summary. The comment cannot be longer
        # than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @encryption_entities : Types::EncryptionEntities,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @comment : String? = nil
        )
        end
      end

      # A summary of a field-level encryption item.

      struct FieldLevelEncryptionSummary
        include JSON::Serializable

        # The unique ID of a field-level encryption item.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The last time that the summary of field-level encryption items was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # An optional comment about the field-level encryption item. The comment cannot be longer than 128
        # characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # A summary of a content type-profile mapping.

        @[JSON::Field(key: "ContentTypeProfileConfig")]
        getter content_type_profile_config : Types::ContentTypeProfileConfig?

        # A summary of a query argument-profile mapping.

        @[JSON::Field(key: "QueryArgProfileConfig")]
        getter query_arg_profile_config : Types::QueryArgProfileConfig?

        def initialize(
          @id : String,
          @last_modified_time : Time,
          @comment : String? = nil,
          @content_type_profile_config : Types::ContentTypeProfileConfig? = nil,
          @query_arg_profile_config : Types::QueryArgProfileConfig? = nil
        )
        end
      end

      # A complex data type that includes the field patterns to match for field-level encryption.

      struct FieldPatterns
        include JSON::Serializable

        # The number of field-level encryption field patterns.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # An array of the field-level encryption field patterns.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # This field only supports standard distributions. You can't specify this field for multi-tenant
      # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
      # in the Amazon CloudFront Developer Guide . This field is deprecated. We recommend that you use a
      # cache policy or an origin request policy instead of this field. If you want to include values in the
      # cache key, use a cache policy. For more information, see Creating cache policies in the Amazon
      # CloudFront Developer Guide . If you want to send values to the origin but not include them in the
      # cache key, use an origin request policy. For more information, see Creating origin request policies
      # in the Amazon CloudFront Developer Guide . A complex type that specifies how CloudFront handles
      # query strings, cookies, and HTTP headers.

      struct ForwardedValues
        include JSON::Serializable

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include cookies in the cache key, use a cache policy. For more
        # information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you want to
        # send cookies to the origin but not include them in the cache key, use an origin request policy. For
        # more information, see Creating origin request policies in the Amazon CloudFront Developer Guide . A
        # complex type that specifies whether you want CloudFront to forward cookies to the origin and, if so,
        # which ones. For more information about forwarding cookies to the origin, see How CloudFront
        # Forwards, Caches, and Logs Cookies in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Cookies")]
        getter cookies : Types::CookiePreference

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include query strings in the cache key, use a cache policy.
        # For more information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you
        # want to send query strings to the origin but not include them in the cache key, use an origin
        # request policy. For more information, see Creating origin request policies in the Amazon CloudFront
        # Developer Guide . Indicates whether you want CloudFront to forward query strings to the origin that
        # is associated with this cache behavior and cache based on the query string parameters. CloudFront
        # behavior depends on the value of QueryString and on the values that you specify for
        # QueryStringCacheKeys , if any: If you specify true for QueryString and you don't specify any values
        # for QueryStringCacheKeys , CloudFront forwards all query string parameters to the origin and caches
        # based on all query string parameters. Depending on how many query string parameters and values you
        # have, this can adversely affect performance because CloudFront must forward more requests to the
        # origin. If you specify true for QueryString and you specify one or more values for
        # QueryStringCacheKeys , CloudFront forwards all query string parameters to the origin, but it only
        # caches based on the query string parameters that you specify. If you specify false for QueryString ,
        # CloudFront doesn't forward any query string parameters to the origin, and doesn't cache based on
        # query string parameters. For more information, see Configuring CloudFront to Cache Based on Query
        # String Parameters in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "QueryString")]
        getter query_string : Bool

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include headers in the cache key, use a cache policy. For more
        # information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you want to
        # send headers to the origin but not include them in the cache key, use an origin request policy. For
        # more information, see Creating origin request policies in the Amazon CloudFront Developer Guide . A
        # complex type that specifies the Headers , if any, that you want CloudFront to forward to the origin
        # for this cache behavior (whitelisted headers). For the headers that you specify, CloudFront also
        # caches separate versions of a specified object that is based on the header values in viewer
        # requests. For more information, see Caching Content Based on Request Headers in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "Headers")]
        getter headers : Types::Headers?

        # This field is deprecated. We recommend that you use a cache policy or an origin request policy
        # instead of this field. If you want to include query strings in the cache key, use a cache policy.
        # For more information, see Creating cache policies in the Amazon CloudFront Developer Guide . If you
        # want to send query strings to the origin but not include them in the cache key, use an origin
        # request policy. For more information, see Creating origin request policies in the Amazon CloudFront
        # Developer Guide . A complex type that contains information about the query string parameters that
        # you want CloudFront to use for caching for this cache behavior.

        @[JSON::Field(key: "QueryStringCacheKeys")]
        getter query_string_cache_keys : Types::QueryStringCacheKeys?

        def initialize(
          @cookies : Types::CookiePreference,
          @query_string : Bool,
          @headers : Types::Headers? = nil,
          @query_string_cache_keys : Types::QueryStringCacheKeys? = nil
        )
        end
      end

      # A function with the same name already exists in this Amazon Web Services account. To create a
      # function, you must provide a unique name. To update an existing function, use UpdateFunction .

      struct FunctionAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A CloudFront function that is associated with a cache behavior in a CloudFront distribution.

      struct FunctionAssociation
        include JSON::Serializable

        # The event type of the function, either viewer-request or viewer-response . You cannot use
        # origin-facing event types ( origin-request and origin-response ) with a CloudFront function.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The Amazon Resource Name (ARN) of the function.

        @[JSON::Field(key: "FunctionARN")]
        getter function_arn : String

        def initialize(
          @event_type : String,
          @function_arn : String
        )
        end
      end

      # A list of CloudFront functions that are associated with a cache behavior in a CloudFront
      # distribution. Your functions must be published to the LIVE stage to associate them with a cache
      # behavior.

      struct FunctionAssociations
        include JSON::Serializable

        # The number of CloudFront functions in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The CloudFront functions that are associated with a cache behavior in a CloudFront distribution.
        # Your functions must be published to the LIVE stage to associate them with a cache behavior.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::FunctionAssociation)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::FunctionAssociation)? = nil
        )
        end
      end

      # Contains configuration information about a CloudFront function.

      struct FunctionConfig
        include JSON::Serializable

        # A comment to describe the function.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The function's runtime environment version.

        @[JSON::Field(key: "Runtime")]
        getter runtime : String

        # The configuration for the key value store associations.

        @[JSON::Field(key: "KeyValueStoreAssociations")]
        getter key_value_store_associations : Types::KeyValueStoreAssociations?

        def initialize(
          @comment : String,
          @runtime : String,
          @key_value_store_associations : Types::KeyValueStoreAssociations? = nil
        )
        end
      end

      # Cannot delete the function because it's attached to one or more cache behaviors.

      struct FunctionInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of CloudFront functions.

      struct FunctionList
        include JSON::Serializable

        # The maximum number of functions requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of functions returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Contains the functions in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::FunctionSummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing
        # functions where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::FunctionSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Contains metadata about a CloudFront function.

      struct FunctionMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function. The ARN uniquely identifies the function.

        @[JSON::Field(key: "FunctionARN")]
        getter function_arn : String

        # The date and time when the function was most recently updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The date and time when the function was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The stage that the function is in, either DEVELOPMENT or LIVE . When a function is in the
        # DEVELOPMENT stage, you can test the function with TestFunction , and update it with UpdateFunction .
        # When a function is in the LIVE stage, you can attach the function to a distribution's cache
        # behavior, using the function's ARN.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @function_arn : String,
          @last_modified_time : Time,
          @created_time : Time? = nil,
          @stage : String? = nil
        )
        end
      end

      # The function is too large. For more information, see Quotas (formerly known as limits) in the Amazon
      # CloudFront Developer Guide .

      struct FunctionSizeLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains configuration information and metadata about a CloudFront function.

      struct FunctionSummary
        include JSON::Serializable

        # Contains configuration information about a CloudFront function.

        @[JSON::Field(key: "FunctionConfig")]
        getter function_config : Types::FunctionConfig

        # Contains metadata about a CloudFront function.

        @[JSON::Field(key: "FunctionMetadata")]
        getter function_metadata : Types::FunctionMetadata

        # The name of the CloudFront function.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the CloudFront function.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @function_config : Types::FunctionConfig,
          @function_metadata : Types::FunctionMetadata,
          @name : String,
          @status : String? = nil
        )
        end
      end

      # A complex type that controls the countries in which your content is distributed. CloudFront
      # determines the location of your users using MaxMind GeoIP databases.

      struct GeoRestriction
        include JSON::Serializable

        # When geo restriction is enabled , this is the number of countries in your whitelist or blacklist .
        # Otherwise, when it is not enabled, Quantity is 0 , and you can omit Items .

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The method that you want to use to restrict distribution of your content by country: none : No geo
        # restriction is enabled, meaning access to content is not restricted by client geo location.
        # blacklist : The Location elements specify the countries in which you don't want CloudFront to
        # distribute your content. whitelist : The Location elements specify the countries in which you want
        # CloudFront to distribute your content.

        @[JSON::Field(key: "RestrictionType")]
        getter restriction_type : String

        # A complex type that contains a Location element for each country in which you want CloudFront either
        # to distribute your content ( whitelist ) or not distribute your content ( blacklist ). The Location
        # element is a two-letter, uppercase country code for a country that you want to include in your
        # blacklist or whitelist . Include one Location element for each country. CloudFront and MaxMind both
        # use ISO 3166 country codes. For the current list of countries and the corresponding codes, see ISO
        # 3166-1-alpha-2 code on the International Organization for Standardization website. You can also
        # refer to the country list on the CloudFront console, which includes both country names and codes.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @restriction_type : String,
          @items : Array(String)? = nil
        )
        end
      end

      # The customizations that you specified for the distribution tenant for geographic restrictions.

      struct GeoRestrictionCustomization
        include JSON::Serializable

        # The method that you want to use to restrict distribution of your content by country: none : No
        # geographic restriction is enabled, meaning access to content is not restricted by client geo
        # location. blacklist : The Location elements specify the countries in which you don't want CloudFront
        # to distribute your content. whitelist : The Location elements specify the countries in which you
        # want CloudFront to distribute your content.

        @[JSON::Field(key: "RestrictionType")]
        getter restriction_type : String

        # The locations for geographic restrictions.

        @[JSON::Field(key: "Locations")]
        getter locations : Array(String)?

        def initialize(
          @restriction_type : String,
          @locations : Array(String)? = nil
        )
        end
      end


      struct GetAnycastIpListRequest
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetAnycastIpListResult
        include JSON::Serializable

        # The Anycast static IP list details.

        @[JSON::Field(key: "AnycastIpList")]
        getter anycast_ip_list : Types::AnycastIpList?

        # The version identifier for the current version of the Anycast static IP list.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @anycast_ip_list : Types::AnycastIpList? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetCachePolicyConfigRequest
        include JSON::Serializable

        # The unique identifier for the cache policy. If the cache policy is attached to a distribution's
        # cache behavior, you can get the policy's identifier using ListDistributions or GetDistribution . If
        # the cache policy is not attached to a cache behavior, you can get the identifier using
        # ListCachePolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetCachePolicyConfigResult
        include JSON::Serializable

        # The cache policy configuration.

        @[JSON::Field(key: "CachePolicyConfig")]
        getter cache_policy_config : Types::CachePolicyConfig?

        # The current version of the cache policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cache_policy_config : Types::CachePolicyConfig? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetCachePolicyRequest
        include JSON::Serializable

        # The unique identifier for the cache policy. If the cache policy is attached to a distribution's
        # cache behavior, you can get the policy's identifier using ListDistributions or GetDistribution . If
        # the cache policy is not attached to a cache behavior, you can get the identifier using
        # ListCachePolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetCachePolicyResult
        include JSON::Serializable

        # The cache policy.

        @[JSON::Field(key: "CachePolicy")]
        getter cache_policy : Types::CachePolicy?

        # The current version of the cache policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cache_policy : Types::CachePolicy? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The origin access identity's configuration information. For more information, see
      # CloudFrontOriginAccessIdentityConfig .

      struct GetCloudFrontOriginAccessIdentityConfigRequest
        include JSON::Serializable

        # The identity's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetCloudFrontOriginAccessIdentityConfigResult
        include JSON::Serializable

        # The origin access identity's configuration information.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentityConfig")]
        getter cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig?

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to get an origin access identity's information.

      struct GetCloudFrontOriginAccessIdentityRequest
        include JSON::Serializable

        # The identity's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetCloudFrontOriginAccessIdentityResult
        include JSON::Serializable

        # The origin access identity's information.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentity")]
        getter cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity?

        # The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetConnectionFunctionRequest
        include JSON::Serializable

        # The connection function's identifier.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The connection function's stage.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @identifier : String,
          @stage : String? = nil
        )
        end
      end


      struct GetConnectionFunctionResult
        include JSON::Serializable

        # The connection function's code.

        @[JSON::Field(key: "ConnectionFunctionCode")]
        getter connection_function_code : Bytes?

        # The connection function's content type.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The version identifier for the current version of the connection function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_function_code : Bytes? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetConnectionGroupByRoutingEndpointRequest
        include JSON::Serializable

        # The routing endpoint for the target connection group, such as d111111abcdef8.cloudfront.net.

        @[JSON::Field(key: "RoutingEndpoint")]
        getter routing_endpoint : String

        def initialize(
          @routing_endpoint : String
        )
        end
      end


      struct GetConnectionGroupByRoutingEndpointResult
        include JSON::Serializable


        @[JSON::Field(key: "ConnectionGroup")]
        getter connection_group : Types::ConnectionGroup?

        # The current version of the connection group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_group : Types::ConnectionGroup? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetConnectionGroupRequest
        include JSON::Serializable

        # The ID, name, or Amazon Resource Name (ARN) of the connection group.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetConnectionGroupResult
        include JSON::Serializable

        # The connection group that you retrieved.

        @[JSON::Field(key: "ConnectionGroup")]
        getter connection_group : Types::ConnectionGroup?

        # The current version of the connection group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_group : Types::ConnectionGroup? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetContinuousDeploymentPolicyConfigRequest
        include JSON::Serializable

        # The identifier of the continuous deployment policy whose configuration you are getting.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetContinuousDeploymentPolicyConfigResult
        include JSON::Serializable


        @[JSON::Field(key: "ContinuousDeploymentPolicyConfig")]
        getter continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig?

        # The version identifier for the current version of the continuous deployment policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetContinuousDeploymentPolicyRequest
        include JSON::Serializable

        # The identifier of the continuous deployment policy that you are getting.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetContinuousDeploymentPolicyResult
        include JSON::Serializable

        # A continuous deployment policy.

        @[JSON::Field(key: "ContinuousDeploymentPolicy")]
        getter continuous_deployment_policy : Types::ContinuousDeploymentPolicy?

        # The version identifier for the current version of the continuous deployment policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @continuous_deployment_policy : Types::ContinuousDeploymentPolicy? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to get a distribution configuration.

      struct GetDistributionConfigRequest
        include JSON::Serializable

        # The distribution's ID. If the ID is empty, an empty distribution configuration is returned.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetDistributionConfigResult
        include JSON::Serializable

        # The distribution's configuration information.

        @[JSON::Field(key: "DistributionConfig")]
        getter distribution_config : Types::DistributionConfig?

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution_config : Types::DistributionConfig? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to get a distribution's information.

      struct GetDistributionRequest
        include JSON::Serializable

        # The distribution's ID. If the ID is empty, an empty distribution configuration is returned.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetDistributionResult
        include JSON::Serializable

        # The distribution's information.

        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The current version of the distribution's information. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetDistributionTenantByDomainRequest
        include JSON::Serializable

        # A domain name associated with the target distribution tenant.

        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @domain : String
        )
        end
      end


      struct GetDistributionTenantByDomainResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionTenant")]
        getter distribution_tenant : Types::DistributionTenant?

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution_tenant : Types::DistributionTenant? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetDistributionTenantRequest
        include JSON::Serializable

        # The identifier of the distribution tenant. You can specify the ARN, ID, or name of the distribution
        # tenant.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetDistributionTenantResult
        include JSON::Serializable

        # The distribution tenant that you retrieved.

        @[JSON::Field(key: "DistributionTenant")]
        getter distribution_tenant : Types::DistributionTenant?

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution_tenant : Types::DistributionTenant? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct GetFieldLevelEncryptionConfigRequest
        include JSON::Serializable

        # Request the ID for the field-level encryption configuration information.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetFieldLevelEncryptionConfigResult
        include JSON::Serializable

        # The current version of the field level encryption configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the field-level encryption configuration information.

        @[JSON::Field(key: "FieldLevelEncryptionConfig")]
        getter field_level_encryption_config : Types::FieldLevelEncryptionConfig?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption_config : Types::FieldLevelEncryptionConfig? = nil
        )
        end
      end


      struct GetFieldLevelEncryptionProfileConfigRequest
        include JSON::Serializable

        # Get the ID for the field-level encryption profile configuration information.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetFieldLevelEncryptionProfileConfigResult
        include JSON::Serializable

        # The current version of the field-level encryption profile configuration result. For example:
        # E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the field-level encryption profile configuration information.

        @[JSON::Field(key: "FieldLevelEncryptionProfileConfig")]
        getter field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig? = nil
        )
        end
      end


      struct GetFieldLevelEncryptionProfileRequest
        include JSON::Serializable

        # Get the ID for the field-level encryption profile information.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetFieldLevelEncryptionProfileResult
        include JSON::Serializable

        # The current version of the field level encryption profile. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the field-level encryption profile information.

        @[JSON::Field(key: "FieldLevelEncryptionProfile")]
        getter field_level_encryption_profile : Types::FieldLevelEncryptionProfile?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption_profile : Types::FieldLevelEncryptionProfile? = nil
        )
        end
      end


      struct GetFieldLevelEncryptionRequest
        include JSON::Serializable

        # Request the ID for the field-level encryption configuration information.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetFieldLevelEncryptionResult
        include JSON::Serializable

        # The current version of the field level encryption configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the field-level encryption configuration information.

        @[JSON::Field(key: "FieldLevelEncryption")]
        getter field_level_encryption : Types::FieldLevelEncryption?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption : Types::FieldLevelEncryption? = nil
        )
        end
      end


      struct GetFunctionRequest
        include JSON::Serializable

        # The name of the function whose code you are getting.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The function's stage, either DEVELOPMENT or LIVE .

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @name : String,
          @stage : String? = nil
        )
        end
      end


      struct GetFunctionResult
        include JSON::Serializable

        # The content type (media type) of the response.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The version identifier for the current version of the CloudFront function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The function code of a CloudFront function.

        @[JSON::Field(key: "FunctionCode")]
        getter function_code : Bytes?

        def initialize(
          @content_type : String? = nil,
          @e_tag : String? = nil,
          @function_code : Bytes? = nil
        )
        end
      end


      struct GetInvalidationForDistributionTenantRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "DistributionTenantId")]
        getter distribution_tenant_id : String

        # The ID of the invalidation to retrieve.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @distribution_tenant_id : String,
          @id : String
        )
        end
      end


      struct GetInvalidationForDistributionTenantResult
        include JSON::Serializable


        @[JSON::Field(key: "Invalidation")]
        getter invalidation : Types::Invalidation?

        def initialize(
          @invalidation : Types::Invalidation? = nil
        )
        end
      end

      # The request to get an invalidation's information.

      struct GetInvalidationRequest
        include JSON::Serializable

        # The distribution's ID.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # The identifier for the invalidation request, for example, IDFDVBD632BHDS5 .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @distribution_id : String,
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetInvalidationResult
        include JSON::Serializable

        # The invalidation's information. For more information, see Invalidation Complex Type .

        @[JSON::Field(key: "Invalidation")]
        getter invalidation : Types::Invalidation?

        def initialize(
          @invalidation : Types::Invalidation? = nil
        )
        end
      end


      struct GetKeyGroupConfigRequest
        include JSON::Serializable

        # The identifier of the key group whose configuration you are getting. To get the identifier, use
        # ListKeyGroups .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetKeyGroupConfigResult
        include JSON::Serializable

        # The identifier for this version of the key group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The key group configuration.

        @[JSON::Field(key: "KeyGroupConfig")]
        getter key_group_config : Types::KeyGroupConfig?

        def initialize(
          @e_tag : String? = nil,
          @key_group_config : Types::KeyGroupConfig? = nil
        )
        end
      end


      struct GetKeyGroupRequest
        include JSON::Serializable

        # The identifier of the key group that you are getting. To get the identifier, use ListKeyGroups .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetKeyGroupResult
        include JSON::Serializable

        # The identifier for this version of the key group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The key group.

        @[JSON::Field(key: "KeyGroup")]
        getter key_group : Types::KeyGroup?

        def initialize(
          @e_tag : String? = nil,
          @key_group : Types::KeyGroup? = nil
        )
        end
      end


      struct GetManagedCertificateDetailsRequest
        include JSON::Serializable

        # The identifier of the distribution tenant. You can specify the ARN, ID, or name of the distribution
        # tenant.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetManagedCertificateDetailsResult
        include JSON::Serializable

        # Contains details about the CloudFront managed ACM certificate.

        @[JSON::Field(key: "ManagedCertificateDetails")]
        getter managed_certificate_details : Types::ManagedCertificateDetails?

        def initialize(
          @managed_certificate_details : Types::ManagedCertificateDetails? = nil
        )
        end
      end


      struct GetMonitoringSubscriptionRequest
        include JSON::Serializable

        # The ID of the distribution that you are getting metrics information for.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        def initialize(
          @distribution_id : String
        )
        end
      end


      struct GetMonitoringSubscriptionResult
        include JSON::Serializable

        # A monitoring subscription. This structure contains information about whether additional CloudWatch
        # metrics are enabled for a given CloudFront distribution.

        @[JSON::Field(key: "MonitoringSubscription")]
        getter monitoring_subscription : Types::MonitoringSubscription?

        def initialize(
          @monitoring_subscription : Types::MonitoringSubscription? = nil
        )
        end
      end


      struct GetOriginAccessControlConfigRequest
        include JSON::Serializable

        # The unique identifier of the origin access control.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetOriginAccessControlConfigResult
        include JSON::Serializable

        # The version identifier for the current version of the origin access control.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains an origin access control configuration.

        @[JSON::Field(key: "OriginAccessControlConfig")]
        getter origin_access_control_config : Types::OriginAccessControlConfig?

        def initialize(
          @e_tag : String? = nil,
          @origin_access_control_config : Types::OriginAccessControlConfig? = nil
        )
        end
      end


      struct GetOriginAccessControlRequest
        include JSON::Serializable

        # The unique identifier of the origin access control.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetOriginAccessControlResult
        include JSON::Serializable

        # The version identifier for the current version of the origin access control.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains an origin access control, including its unique identifier.

        @[JSON::Field(key: "OriginAccessControl")]
        getter origin_access_control : Types::OriginAccessControl?

        def initialize(
          @e_tag : String? = nil,
          @origin_access_control : Types::OriginAccessControl? = nil
        )
        end
      end


      struct GetOriginRequestPolicyConfigRequest
        include JSON::Serializable

        # The unique identifier for the origin request policy. If the origin request policy is attached to a
        # distribution's cache behavior, you can get the policy's identifier using ListDistributions or
        # GetDistribution . If the origin request policy is not attached to a cache behavior, you can get the
        # identifier using ListOriginRequestPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetOriginRequestPolicyConfigResult
        include JSON::Serializable

        # The current version of the origin request policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The origin request policy configuration.

        @[JSON::Field(key: "OriginRequestPolicyConfig")]
        getter origin_request_policy_config : Types::OriginRequestPolicyConfig?

        def initialize(
          @e_tag : String? = nil,
          @origin_request_policy_config : Types::OriginRequestPolicyConfig? = nil
        )
        end
      end


      struct GetOriginRequestPolicyRequest
        include JSON::Serializable

        # The unique identifier for the origin request policy. If the origin request policy is attached to a
        # distribution's cache behavior, you can get the policy's identifier using ListDistributions or
        # GetDistribution . If the origin request policy is not attached to a cache behavior, you can get the
        # identifier using ListOriginRequestPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetOriginRequestPolicyResult
        include JSON::Serializable

        # The current version of the origin request policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The origin request policy.

        @[JSON::Field(key: "OriginRequestPolicy")]
        getter origin_request_policy : Types::OriginRequestPolicy?

        def initialize(
          @e_tag : String? = nil,
          @origin_request_policy : Types::OriginRequestPolicy? = nil
        )
        end
      end


      struct GetPublicKeyConfigRequest
        include JSON::Serializable

        # The identifier of the public key whose configuration you are getting.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetPublicKeyConfigResult
        include JSON::Serializable

        # The identifier for this version of the public key configuration.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # A public key configuration.

        @[JSON::Field(key: "PublicKeyConfig")]
        getter public_key_config : Types::PublicKeyConfig?

        def initialize(
          @e_tag : String? = nil,
          @public_key_config : Types::PublicKeyConfig? = nil
        )
        end
      end


      struct GetPublicKeyRequest
        include JSON::Serializable

        # The identifier of the public key you are getting.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetPublicKeyResult
        include JSON::Serializable

        # The identifier for this version of the public key.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The public key.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : Types::PublicKey?

        def initialize(
          @e_tag : String? = nil,
          @public_key : Types::PublicKey? = nil
        )
        end
      end


      struct GetRealtimeLogConfigRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the real-time log configuration to get.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the real-time log configuration to get.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetRealtimeLogConfigResult
        include JSON::Serializable

        # A real-time log configuration.

        @[JSON::Field(key: "RealtimeLogConfig")]
        getter realtime_log_config : Types::RealtimeLogConfig?

        def initialize(
          @realtime_log_config : Types::RealtimeLogConfig? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudFront resource that is associated with the resource
        # policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyResult
        include JSON::Serializable

        # The resource policy in JSON format.

        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The Amazon Resource Name (ARN) of the CloudFront resource that is associated with the resource
        # policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @policy_document : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct GetResponseHeadersPolicyConfigRequest
        include JSON::Serializable

        # The identifier for the response headers policy. If the response headers policy is attached to a
        # distribution's cache behavior, you can get the policy's identifier using ListDistributions or
        # GetDistribution . If the response headers policy is not attached to a cache behavior, you can get
        # the identifier using ListResponseHeadersPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetResponseHeadersPolicyConfigResult
        include JSON::Serializable

        # The version identifier for the current version of the response headers policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains a response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicyConfig")]
        getter response_headers_policy_config : Types::ResponseHeadersPolicyConfig?

        def initialize(
          @e_tag : String? = nil,
          @response_headers_policy_config : Types::ResponseHeadersPolicyConfig? = nil
        )
        end
      end


      struct GetResponseHeadersPolicyRequest
        include JSON::Serializable

        # The identifier for the response headers policy. If the response headers policy is attached to a
        # distribution's cache behavior, you can get the policy's identifier using ListDistributions or
        # GetDistribution . If the response headers policy is not attached to a cache behavior, you can get
        # the identifier using ListResponseHeadersPolicies .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetResponseHeadersPolicyResult
        include JSON::Serializable

        # The version identifier for the current version of the response headers policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Contains a response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicy")]
        getter response_headers_policy : Types::ResponseHeadersPolicy?

        def initialize(
          @e_tag : String? = nil,
          @response_headers_policy : Types::ResponseHeadersPolicy? = nil
        )
        end
      end

      # To request to get a streaming distribution configuration.

      struct GetStreamingDistributionConfigRequest
        include JSON::Serializable

        # The streaming distribution's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetStreamingDistributionConfigResult
        include JSON::Serializable

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The streaming distribution's configuration information.

        @[JSON::Field(key: "StreamingDistributionConfig")]
        getter streaming_distribution_config : Types::StreamingDistributionConfig?

        def initialize(
          @e_tag : String? = nil,
          @streaming_distribution_config : Types::StreamingDistributionConfig? = nil
        )
        end
      end

      # The request to get a streaming distribution's information.

      struct GetStreamingDistributionRequest
        include JSON::Serializable

        # The streaming distribution's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct GetStreamingDistributionResult
        include JSON::Serializable

        # The current version of the streaming distribution's information. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The streaming distribution's information.

        @[JSON::Field(key: "StreamingDistribution")]
        getter streaming_distribution : Types::StreamingDistribution?

        def initialize(
          @e_tag : String? = nil,
          @streaming_distribution : Types::StreamingDistribution? = nil
        )
        end
      end


      struct GetTrustStoreRequest
        include JSON::Serializable

        # The trust store's identifier.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetTrustStoreResult
        include JSON::Serializable

        # The version identifier for the current version of the trust store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The trust store.

        @[JSON::Field(key: "TrustStore")]
        getter trust_store : Types::TrustStore?

        def initialize(
          @e_tag : String? = nil,
          @trust_store : Types::TrustStore? = nil
        )
        end
      end


      struct GetVpcOriginRequest
        include JSON::Serializable

        # The VPC origin ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetVpcOriginResult
        include JSON::Serializable

        # The VPC origin ETag.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The VPC origin.

        @[JSON::Field(key: "VpcOrigin")]
        getter vpc_origin : Types::VpcOrigin?

        def initialize(
          @e_tag : String? = nil,
          @vpc_origin : Types::VpcOrigin? = nil
        )
        end
      end

      # Amazon CloudFront supports gRPC, an open-source remote procedure call (RPC) framework built on
      # HTTP/2. gRPC offers bi-directional streaming and binary protocol that buffers payloads, making it
      # suitable for applications that require low latency communications. To enable your distribution to
      # handle gRPC requests, you must include HTTP/2 as one of the supported HTTP versions and allow HTTP
      # methods, including POST . For more information, see Using gRPC with CloudFront distributions in the
      # Amazon CloudFront Developer Guide .

      struct GrpcConfig
        include JSON::Serializable

        # Enables your CloudFront distribution to receive gRPC requests and to proxy them directly to your
        # origins.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # Contains a list of HTTP header names.

      struct Headers
        include JSON::Serializable

        # The number of header names in the Items list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of HTTP header names.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # Deletion is not allowed for this entity.

      struct IllegalDelete
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified configuration for field-level encryption can't be associated with the specified cache
      # behavior.

      struct IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An origin cannot contain both an origin access control (OAC) and an origin access identity (OAI).

      struct IllegalOriginAccessConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The update contains modifications that are not allowed.

      struct IllegalUpdate
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The import source for the key value store.

      struct ImportSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the import source for the key value store.

        @[JSON::Field(key: "SourceARN")]
        getter source_arn : String

        # The source type of the import source for the key value store.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        def initialize(
          @source_arn : String,
          @source_type : String
        )
        end
      end

      # The value of Quantity and the size of Items don't match.

      struct InconsistentQuantities
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An argument is invalid.

      struct InvalidArgument
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified CloudFront resource can't be associated.

      struct InvalidAssociation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The default root object file name is too big or contains an invalid character.

      struct InvalidDefaultRootObject
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An origin access control is associated with an origin whose domain name is not supported.

      struct InvalidDomainNameForOriginAccessControl
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalid error code was specified.

      struct InvalidErrorCode
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains forward cookies option which doesn't match with the expectation for the
      # whitelisted list of cookie names. Either list of cookie names has been specified when not allowed or
      # list of cookie names is missing when expected.

      struct InvalidForwardCookies
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A CloudFront function association is invalid.

      struct InvalidFunctionAssociation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified geo restriction parameter is not valid.

      struct InvalidGeoRestrictionParameter
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The headers specified are not valid for an Amazon S3 origin.

      struct InvalidHeadersForS3Origin
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The If-Match version is missing or not valid.

      struct InvalidIfMatchVersion
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified Lambda@Edge function association is invalid.

      struct InvalidLambdaFunctionAssociation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The location code specified is not valid.

      struct InvalidLocationCode
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The minimum protocol version specified is not valid.

      struct InvalidMinimumProtocolVersion
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon S3 origin server specified does not refer to a valid Amazon S3 bucket.

      struct InvalidOrigin
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The origin access control is not valid.

      struct InvalidOriginAccessControl
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The origin access identity is not valid or doesn't exist.

      struct InvalidOriginAccessIdentity
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The keep alive timeout specified for the origin is not valid.

      struct InvalidOriginKeepaliveTimeout
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The read timeout specified for the origin is not valid.

      struct InvalidOriginReadTimeout
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You cannot specify SSLv3 as the minimum protocol version if you only want to support only clients
      # that support Server Name Indication (SNI).

      struct InvalidProtocolSettings
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The query string parameters specified are not valid.

      struct InvalidQueryStringParameters
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The relative path is too big, is not URL-encoded, or does not begin with a slash (/).

      struct InvalidRelativePath
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation requires the HTTPS protocol. Ensure that you specify the HTTPS protocol in your
      # request, or omit the RequiredProtocols element from your distribution configuration.

      struct InvalidRequiredProtocol
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A response code is not valid.

      struct InvalidResponseCode
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The TTL order specified is not valid.

      struct InvalidTTLOrder
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The tagging specified is not valid.

      struct InvalidTagging
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A viewer certificate specified is not valid.

      struct InvalidViewerCertificate
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A web ACL ID specified is not valid. To specify a web ACL created using the latest version of WAF,
      # use the ACL ARN, for example
      # arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/473e64fd-f30b-4765-81a0-62ad96dd167a
      # . To specify a web ACL created using WAF Classic, use the ACL ID, for example
      # 473e64fd-f30b-4765-81a0-62ad96dd167a .

      struct InvalidWebACLId
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalidation.

      struct Invalidation
        include JSON::Serializable

        # The date and time the invalidation request was first made.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The identifier for the invalidation request. For example: IDFDVBD632BHDS5 .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current invalidation information for the batch request.

        @[JSON::Field(key: "InvalidationBatch")]
        getter invalidation_batch : Types::InvalidationBatch

        # The status of the invalidation request. When the invalidation batch is finished, the status is
        # Completed .

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @create_time : Time,
          @id : String,
          @invalidation_batch : Types::InvalidationBatch,
          @status : String
        )
        end
      end

      # An invalidation batch.

      struct InvalidationBatch
        include JSON::Serializable

        # A value that you specify to uniquely identify an invalidation request. CloudFront uses the value to
        # prevent you from accidentally resubmitting an identical request. Whenever you create a new
        # invalidation request, you must specify a new value for CallerReference and change other values in
        # the request as applicable. One way to ensure that the value of CallerReference is unique is to use a
        # timestamp , for example, 20120301090000 . If you make a second invalidation request with the same
        # value for CallerReference , and if the rest of the request is the same, CloudFront doesn't create a
        # new invalidation request. Instead, CloudFront returns information about the invalidation request
        # that you previously created with the same CallerReference . If CallerReference is a value you
        # already sent in a previous invalidation batch request but the content of any Path is different from
        # the original request, CloudFront returns an InvalidationBatchAlreadyExists error.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # A complex type that contains information about the objects that you want to invalidate. For more
        # information, see Specifying the Objects to Invalidate in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Paths")]
        getter paths : Types::Paths

        def initialize(
          @caller_reference : String,
          @paths : Types::Paths
        )
        end
      end

      # The InvalidationList complex type describes the list of invalidation objects. For more information
      # about invalidation, see Invalidating Objects (Web Distributions Only) in the Amazon CloudFront
      # Developer Guide .

      struct InvalidationList
        include JSON::Serializable

        # A flag that indicates whether more invalidation batch requests remain to be listed. If your results
        # were truncated, you can make a follow-up pagination request using the Marker request parameter to
        # retrieve more invalidation batches in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value that you provided for the Marker request parameter.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The value that you provided for the MaxItems request parameter.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of invalidation batches that were created by the current Amazon Web Services account.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains one InvalidationSummary element for each invalidation batch created by
        # the current Amazon Web Services account.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::InvalidationSummary)?

        # If IsTruncated is true , this element is present and contains the value that you can use for the
        # Marker request parameter to continue listing your invalidation batches where they left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::InvalidationSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A summary of an invalidation request.

      struct InvalidationSummary
        include JSON::Serializable

        # The time that an invalidation request was created.

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The unique ID for an invalidation request.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The status of an invalidation request.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @create_time : Time,
          @id : String,
          @status : String
        )
        end
      end

      # Configuration for an IPAM CIDR that defines a specific IP address range, IPAM pool, and associated
      # Anycast IP address.

      struct IpamCidrConfig
        include JSON::Serializable

        # The CIDR that specifies the IP address range for this IPAM configuration.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        # The Amazon Resource Name (ARN) of the IPAM pool that the CIDR block is assigned to.

        @[JSON::Field(key: "IpamPoolArn")]
        getter ipam_pool_arn : String

        # The specified Anycast IP address allocated from the IPAM pool for this CIDR configuration.

        @[JSON::Field(key: "AnycastIp")]
        getter anycast_ip : String?

        # The current status of the IPAM CIDR configuration.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cidr : String,
          @ipam_pool_arn : String,
          @anycast_ip : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration IPAM settings that includes the quantity of CIDR configurations and the list of
      # IPAM CIDR configurations.

      struct IpamConfig
        include JSON::Serializable

        # A list of IPAM CIDR configurations that define the IP address ranges, IPAM pools, and associated
        # Anycast IP addresses.

        @[JSON::Field(key: "IpamCidrConfigs")]
        getter ipam_cidr_configs : Array(Types::IpamCidrConfig)

        # The number of IPAM CIDR configurations in the IpamCidrConfigs list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @ipam_cidr_configs : Array(Types::IpamCidrConfig),
          @quantity : Int32
        )
        end
      end

      # A list of identifiers for the public keys that CloudFront can use to verify the signatures of signed
      # URLs and signed cookies.

      struct KGKeyPairIds
        include JSON::Serializable

        # The identifier of the key group that contains the public keys.

        @[JSON::Field(key: "KeyGroupId")]
        getter key_group_id : String?


        @[JSON::Field(key: "KeyPairIds")]
        getter key_pair_ids : Types::KeyPairIds?

        def initialize(
          @key_group_id : String? = nil,
          @key_pair_ids : Types::KeyPairIds? = nil
        )
        end
      end

      # A key group. A key group contains a list of public keys that you can use with CloudFront signed URLs
      # and signed cookies .

      struct KeyGroup
        include JSON::Serializable

        # The identifier for the key group.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The key group configuration.

        @[JSON::Field(key: "KeyGroupConfig")]
        getter key_group_config : Types::KeyGroupConfig

        # The date and time when the key group was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @id : String,
          @key_group_config : Types::KeyGroupConfig,
          @last_modified_time : Time
        )
        end
      end

      # A key group with this name already exists. You must provide a unique name. To modify an existing key
      # group, use UpdateKeyGroup .

      struct KeyGroupAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A key group configuration. A key group contains a list of public keys that you can use with
      # CloudFront signed URLs and signed cookies .

      struct KeyGroupConfig
        include JSON::Serializable

        # A list of the identifiers of the public keys in the key group.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # A name to identify the key group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A comment to describe the key group. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @items : Array(String),
          @name : String,
          @comment : String? = nil
        )
        end
      end

      # A list of key groups.

      struct KeyGroupList
        include JSON::Serializable

        # The maximum number of key groups requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of key groups returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of key groups.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::KeyGroupSummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing key
        # groups.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::KeyGroupSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Contains information about a key group.

      struct KeyGroupSummary
        include JSON::Serializable

        # A key group.

        @[JSON::Field(key: "KeyGroup")]
        getter key_group : Types::KeyGroup

        def initialize(
          @key_group : Types::KeyGroup
        )
        end
      end

      # A list of CloudFront key pair identifiers.

      struct KeyPairIds
        include JSON::Serializable

        # The number of key pair identifiers in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of CloudFront key pair identifiers.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # The key value store. Use this to separate data from function code, allowing you to update data
      # without having to publish a new version of a function. The key value store holds keys and their
      # corresponding values.

      struct KeyValueStore
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the key value store.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # A comment for the key value store.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The unique Id for the key value store.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The last-modified time of the key value store.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The name of the key value store.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the key value store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String,
          @comment : String,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @status : String? = nil
        )
        end
      end

      # The key value store association.

      struct KeyValueStoreAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the key value store association.

        @[JSON::Field(key: "KeyValueStoreARN")]
        getter key_value_store_arn : String

        def initialize(
          @key_value_store_arn : String
        )
        end
      end

      # The key value store associations.

      struct KeyValueStoreAssociations
        include JSON::Serializable

        # The quantity of key value store associations.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The items of the key value store association.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::KeyValueStoreAssociation)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::KeyValueStoreAssociation)? = nil
        )
        end
      end

      # The key value store list.

      struct KeyValueStoreList
        include JSON::Serializable

        # The maximum number of items in the key value store list.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The quantity of the key value store list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The items of the key value store list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::KeyValueStore)?

        # The next marker associated with the key value store list.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::KeyValueStore)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Contains information about the Amazon Kinesis data stream where you are sending real-time log data.

      struct KinesisStreamConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Identity and Access Management (IAM) role that CloudFront can
        # use to send real-time log data to your Kinesis data stream. For more information the IAM role, see
        # Real-time log configuration IAM role in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the Kinesis data stream where you are sending real-time log data.

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String

        def initialize(
          @role_arn : String,
          @stream_arn : String
        )
        end
      end

      # A complex type that contains a Lambda@Edge function association.

      struct LambdaFunctionAssociation
        include JSON::Serializable

        # Specifies the event type that triggers a Lambda@Edge function invocation. You can specify the
        # following values: viewer-request : The function executes when CloudFront receives a request from a
        # viewer and before it checks to see whether the requested object is in the edge cache. origin-request
        # : The function executes only when CloudFront sends a request to your origin. When the requested
        # object is in the edge cache, the function doesn't execute. origin-response : The function executes
        # after CloudFront receives a response from the origin and before it caches the object in the
        # response. When the requested object is in the edge cache, the function doesn't execute.
        # viewer-response : The function executes before CloudFront returns the requested object to the
        # viewer. The function executes regardless of whether the object was already in the edge cache. If the
        # origin returns an HTTP status code other than HTTP 200 (OK), the function doesn't execute.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The ARN of the Lambda@Edge function. You must specify the ARN of a function version; you can't
        # specify an alias or $LATEST.

        @[JSON::Field(key: "LambdaFunctionARN")]
        getter lambda_function_arn : String

        # A flag that allows a Lambda@Edge function to have read access to the body content. For more
        # information, see Accessing the Request Body by Choosing the Include Body Option in the Amazon
        # CloudFront Developer Guide.

        @[JSON::Field(key: "IncludeBody")]
        getter include_body : Bool?

        def initialize(
          @event_type : String,
          @lambda_function_arn : String,
          @include_body : Bool? = nil
        )
        end
      end

      # A complex type that specifies a list of Lambda@Edge functions associations for a cache behavior. If
      # you want to invoke one or more Lambda@Edge functions triggered by requests that match the
      # PathPattern of the cache behavior, specify the applicable values for Quantity and Items . Note that
      # there can be up to 4 LambdaFunctionAssociation items in this list (one for each possible value of
      # EventType ) and each EventType can be associated with only one function. If you don't want to invoke
      # any Lambda@Edge functions for the requests that match PathPattern , specify 0 for Quantity and omit
      # Items .

      struct LambdaFunctionAssociations
        include JSON::Serializable

        # The number of Lambda@Edge function associations for this cache behavior.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Optional : A complex type that contains LambdaFunctionAssociation items for this cache behavior. If
        # Quantity is 0 , you can omit Items .

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::LambdaFunctionAssociation)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::LambdaFunctionAssociation)? = nil
        )
        end
      end


      struct ListAnycastIpListsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of Anycast static IP lists that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListAnycastIpListsResult
        include JSON::Serializable

        # Root level tag for the AnycastIpLists parameters.

        @[JSON::Field(key: "AnycastIpListCollection")]
        getter anycast_ip_lists : Types::AnycastIpListCollection?

        def initialize(
          @anycast_ip_lists : Types::AnycastIpListCollection? = nil
        )
        end
      end


      struct ListCachePoliciesRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of cache policies.
        # The response includes cache policies in the list that occur after the marker. To get the next page
        # of the list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of cache policies that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # A filter to return only the specified kinds of cache policies. Valid values are: managed – Returns
        # only the managed policies created by Amazon Web Services. custom – Returns only the custom policies
        # created in your Amazon Web Services account.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListCachePoliciesResult
        include JSON::Serializable

        # A list of cache policies.

        @[JSON::Field(key: "CachePolicyList")]
        getter cache_policy_list : Types::CachePolicyList?

        def initialize(
          @cache_policy_list : Types::CachePolicyList? = nil
        )
        end
      end

      # The request to list origin access identities.

      struct ListCloudFrontOriginAccessIdentitiesRequest
        include JSON::Serializable

        # Use this when paginating results to indicate where to begin in your list of origin access
        # identities. The results include identities in the list that occur after the marker. To get the next
        # page of results, set the Marker to the value of the NextMarker from the current page's response
        # (which is also the ID of the last identity on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of origin access identities you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct ListCloudFrontOriginAccessIdentitiesResult
        include JSON::Serializable

        # The CloudFrontOriginAccessIdentityList type.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentityList")]
        getter cloud_front_origin_access_identity_list : Types::CloudFrontOriginAccessIdentityList?

        def initialize(
          @cloud_front_origin_access_identity_list : Types::CloudFrontOriginAccessIdentityList? = nil
        )
        end
      end


      struct ListConflictingAliasesRequest
        include JSON::Serializable

        # The alias (also called a CNAME) to search for conflicting aliases.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The ID of a standard distribution in your account that has an attached TLS certificate that includes
        # the provided alias.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # Use this field when paginating results to indicate where to begin in the list of conflicting
        # aliases. The response includes conflicting aliases in the list that occur after the marker. To get
        # the next page of the list, set this field's value to the value of NextMarker from the current page's
        # response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of conflicting aliases that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @alias : String,
          @distribution_id : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListConflictingAliasesResult
        include JSON::Serializable

        # A list of conflicting aliases.

        @[JSON::Field(key: "ConflictingAliasesList")]
        getter conflicting_aliases_list : Types::ConflictingAliasesList?

        def initialize(
          @conflicting_aliases_list : Types::ConflictingAliasesList? = nil
        )
        end
      end


      struct ListConnectionFunctionsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of connection functions that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The connection function's stage.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @stage : String? = nil
        )
        end
      end


      struct ListConnectionFunctionsResult
        include JSON::Serializable

        # A list of connection functions.

        @[JSON::Field(key: "ConnectionFunctions")]
        getter connection_functions : Array(Types::ConnectionFunctionSummary)?

        # Indicates the next page of connection functions. To get the next page of the list, use this value in
        # the Marker field of your request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @connection_functions : Array(Types::ConnectionFunctionSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListConnectionGroupsRequest
        include JSON::Serializable

        # Filter by associated Anycast IP list ID.

        @[JSON::Field(key: "AssociationFilter")]
        getter association_filter : Types::ConnectionGroupAssociationFilter?

        # The marker for the next set of connection groups to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of connection groups to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @association_filter : Types::ConnectionGroupAssociationFilter? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListConnectionGroupsResult
        include JSON::Serializable

        # The list of connection groups that you retrieved.

        @[JSON::Field(key: "ConnectionGroups")]
        getter connection_groups : Array(Types::ConnectionGroupSummary)?

        # A token used for pagination of results returned in the response. You can use the token from the
        # previous request to define where the current request should begin.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @connection_groups : Array(Types::ConnectionGroupSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListContinuousDeploymentPoliciesRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of continuous
        # deployment policies. The response includes policies in the list that occur after the marker. To get
        # the next page of the list, set this field's value to the value of NextMarker from the current page's
        # response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of continuous deployment policies that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListContinuousDeploymentPoliciesResult
        include JSON::Serializable

        # A list of continuous deployment policies.

        @[JSON::Field(key: "ContinuousDeploymentPolicyList")]
        getter continuous_deployment_policy_list : Types::ContinuousDeploymentPolicyList?

        def initialize(
          @continuous_deployment_policy_list : Types::ContinuousDeploymentPolicyList? = nil
        )
        end
      end


      struct ListDistributionTenantsByCustomizationRequest
        include JSON::Serializable

        # Filter by the ARN of the associated ACM certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The marker for the next set of results.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution tenants to return by the specified customization.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # Filter by the ARN of the associated WAF web ACL.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @certificate_arn : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end


      struct ListDistributionTenantsByCustomizationResult
        include JSON::Serializable

        # A list of distribution tenants with the specified customization.

        @[JSON::Field(key: "DistributionTenantList")]
        getter distribution_tenant_list : Array(Types::DistributionTenantSummary)?

        # A token used for pagination of results returned in the response. You can use the token from the
        # previous request to define where the current request should begin.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @distribution_tenant_list : Array(Types::DistributionTenantSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListDistributionTenantsRequest
        include JSON::Serializable


        @[JSON::Field(key: "AssociationFilter")]
        getter association_filter : Types::DistributionTenantAssociationFilter?

        # The marker for the next set of results.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution tenants to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @association_filter : Types::DistributionTenantAssociationFilter? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListDistributionTenantsResult
        include JSON::Serializable

        # The list of distribution tenants that you retrieved.

        @[JSON::Field(key: "DistributionTenantList")]
        getter distribution_tenant_list : Array(Types::DistributionTenantSummary)?

        # A token used for pagination of results returned in the response. You can use the token from the
        # previous request to define where the current request should begin.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @distribution_tenant_list : Array(Types::DistributionTenantSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListDistributionsByAnycastIpListIdRequest
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @anycast_ip_list_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByAnycastIpListIdResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDistributionsByCachePolicyIdRequest
        include JSON::Serializable

        # The ID of the cache policy whose associated distribution IDs you want to list.

        @[JSON::Field(key: "CachePolicyId")]
        getter cache_policy_id : String

        # Use this field when paginating results to indicate where to begin in your list of distribution IDs.
        # The response includes distribution IDs in the list that occur after the marker. To get the next page
        # of the list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution IDs that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @cache_policy_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByCachePolicyIdResult
        include JSON::Serializable

        # A list of distribution IDs.

        @[JSON::Field(key: "DistributionIdList")]
        getter distribution_id_list : Types::DistributionIdList?

        def initialize(
          @distribution_id_list : Types::DistributionIdList? = nil
        )
        end
      end


      struct ListDistributionsByConnectionFunctionRequest
        include JSON::Serializable

        # The distributions by connection function identifier.

        @[JSON::Field(key: "ConnectionFunctionIdentifier")]
        getter connection_function_identifier : String

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @connection_function_identifier : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListDistributionsByConnectionFunctionResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDistributionsByConnectionModeRequest
        include JSON::Serializable

        # This field specifies whether the connection mode is through a standard distribution (direct) or a
        # multi-tenant distribution with distribution tenants (tenant-only).

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String

        # The marker for the next set of distributions to retrieve.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @connection_mode : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListDistributionsByConnectionModeResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDistributionsByKeyGroupRequest
        include JSON::Serializable

        # The ID of the key group whose associated distribution IDs you are listing.

        @[JSON::Field(key: "KeyGroupId")]
        getter key_group_id : String

        # Use this field when paginating results to indicate where to begin in your list of distribution IDs.
        # The response includes distribution IDs in the list that occur after the marker. To get the next page
        # of the list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution IDs that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @key_group_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByKeyGroupResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionIdList")]
        getter distribution_id_list : Types::DistributionIdList?

        def initialize(
          @distribution_id_list : Types::DistributionIdList? = nil
        )
        end
      end


      struct ListDistributionsByOriginRequestPolicyIdRequest
        include JSON::Serializable

        # The ID of the origin request policy whose associated distribution IDs you want to list.

        @[JSON::Field(key: "OriginRequestPolicyId")]
        getter origin_request_policy_id : String

        # Use this field when paginating results to indicate where to begin in your list of distribution IDs.
        # The response includes distribution IDs in the list that occur after the marker. To get the next page
        # of the list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution IDs that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @origin_request_policy_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByOriginRequestPolicyIdResult
        include JSON::Serializable

        # A list of distribution IDs.

        @[JSON::Field(key: "DistributionIdList")]
        getter distribution_id_list : Types::DistributionIdList?

        def initialize(
          @distribution_id_list : Types::DistributionIdList? = nil
        )
        end
      end


      struct ListDistributionsByOwnedResourceRequest
        include JSON::Serializable

        # The ARN of the CloudFront resource that you've shared with other Amazon Web Services accounts.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Use this field when paginating results to indicate where to begin in your list of distributions. The
        # response includes distributions in the list that occur after the marker. To get the next page of the
        # list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @resource_arn : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByOwnedResourceResult
        include JSON::Serializable

        # The list of distributions that are using the shared resource.

        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionIdOwnerList?

        def initialize(
          @distribution_list : Types::DistributionIdOwnerList? = nil
        )
        end
      end


      struct ListDistributionsByRealtimeLogConfigRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of distributions. The
        # response includes distributions in the list that occur after the marker. To get the next page of the
        # list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # The Amazon Resource Name (ARN) of the real-time log configuration whose associated distributions you
        # want to list.

        @[JSON::Field(key: "RealtimeLogConfigArn")]
        getter realtime_log_config_arn : String?

        # The name of the real-time log configuration whose associated distributions you want to list.

        @[JSON::Field(key: "RealtimeLogConfigName")]
        getter realtime_log_config_name : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @realtime_log_config_arn : String? = nil,
          @realtime_log_config_name : String? = nil
        )
        end
      end


      struct ListDistributionsByRealtimeLogConfigResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDistributionsByResponseHeadersPolicyIdRequest
        include JSON::Serializable

        # The ID of the response headers policy whose associated distribution IDs you want to list.

        @[JSON::Field(key: "ResponseHeadersPolicyId")]
        getter response_headers_policy_id : String

        # Use this field when paginating results to indicate where to begin in your list of distribution IDs.
        # The response includes distribution IDs in the list that occur after the marker. To get the next page
        # of the list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distribution IDs that you want to get in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @response_headers_policy_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByResponseHeadersPolicyIdResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionIdList")]
        getter distribution_id_list : Types::DistributionIdList?

        def initialize(
          @distribution_id_list : Types::DistributionIdList? = nil
        )
        end
      end


      struct ListDistributionsByTrustStoreRequest
        include JSON::Serializable

        # The distributions by trust store identifier.

        @[JSON::Field(key: "TrustStoreIdentifier")]
        getter trust_store_identifier : String

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @trust_store_identifier : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByTrustStoreResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDistributionsByVpcOriginIdRequest
        include JSON::Serializable

        # The VPC origin ID.

        @[JSON::Field(key: "VpcOriginId")]
        getter vpc_origin_id : String

        # The marker associated with the VPC origin distributions list.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of items included in the list.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @vpc_origin_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListDistributionsByVpcOriginIdResult
        include JSON::Serializable


        @[JSON::Field(key: "DistributionIdList")]
        getter distribution_id_list : Types::DistributionIdList?

        def initialize(
          @distribution_id_list : Types::DistributionIdList? = nil
        )
        end
      end

      # The request to list distributions that are associated with a specified WAF web ACL.

      struct ListDistributionsByWebACLIdRequest
        include JSON::Serializable

        # The ID of the WAF web ACL that you want to list the associated distributions. If you specify "null"
        # for the ID, the request returns a list of the distributions that aren't associated with a web ACL.
        # For WAFV2, this is the ARN of the web ACL, such as
        # arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111
        # . For WAF Classic, this is the ID of the web ACL, such as a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        # Use Marker and MaxItems to control pagination of results. If you have more than MaxItems
        # distributions that satisfy the request, the response includes a NextMarker element. To get the next
        # page of results, submit another request. For the value of Marker , specify the value of NextMarker
        # from the last response. (For the first request, omit Marker .)

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions that you want CloudFront to return in the response body. The
        # maximum and default values are both 100.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @web_acl_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # The response to a request to list the distributions that are associated with a specified WAF web
      # ACL.

      struct ListDistributionsByWebACLIdResult
        include JSON::Serializable

        # The DistributionList type.

        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end

      # The request to list your distributions.

      struct ListDistributionsRequest
        include JSON::Serializable

        # Use this when paginating results to indicate where to begin in your list of distributions. The
        # results include distributions in the list that occur after the marker. To get the next page of
        # results, set the Marker to the value of the NextMarker from the current page's response (which is
        # also the ID of the last distribution on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of distributions you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct ListDistributionsResult
        include JSON::Serializable

        # The DistributionList type.

        @[JSON::Field(key: "DistributionList")]
        getter distribution_list : Types::DistributionList?

        def initialize(
          @distribution_list : Types::DistributionList? = nil
        )
        end
      end


      struct ListDomainConflictsRequest
        include JSON::Serializable

        # The domain to check for conflicts.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The distribution resource identifier. This can be the standard distribution or distribution tenant
        # that has a valid certificate, which covers the domain that you specify.

        @[JSON::Field(key: "DomainControlValidationResource")]
        getter domain_control_validation_resource : Types::DistributionResourceId

        # The marker for the next set of domain conflicts.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of domain conflicts to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @domain : String,
          @domain_control_validation_resource : Types::DistributionResourceId,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListDomainConflictsResult
        include JSON::Serializable

        # Contains details about the domain conflicts.

        @[JSON::Field(key: "DomainConflicts")]
        getter domain_conflicts : Array(Types::DomainConflict)?

        # A token used for pagination of results returned in the response. You can use the token from the
        # previous request to define where the current request should begin.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @domain_conflicts : Array(Types::DomainConflict)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListFieldLevelEncryptionConfigsRequest
        include JSON::Serializable

        # Use this when paginating results to indicate where to begin in your list of configurations. The
        # results include configurations in the list that occur after the marker. To get the next page of
        # results, set the Marker to the value of the NextMarker from the current page's response (which is
        # also the ID of the last configuration on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of field-level encryption configurations you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListFieldLevelEncryptionConfigsResult
        include JSON::Serializable

        # Returns a list of all field-level encryption configurations that have been created in CloudFront for
        # this account.

        @[JSON::Field(key: "FieldLevelEncryptionList")]
        getter field_level_encryption_list : Types::FieldLevelEncryptionList?

        def initialize(
          @field_level_encryption_list : Types::FieldLevelEncryptionList? = nil
        )
        end
      end


      struct ListFieldLevelEncryptionProfilesRequest
        include JSON::Serializable

        # Use this when paginating results to indicate where to begin in your list of profiles. The results
        # include profiles in the list that occur after the marker. To get the next page of results, set the
        # Marker to the value of the NextMarker from the current page's response (which is also the ID of the
        # last profile on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of field-level encryption profiles you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListFieldLevelEncryptionProfilesResult
        include JSON::Serializable

        # Returns a list of the field-level encryption profiles that have been created in CloudFront for this
        # account.

        @[JSON::Field(key: "FieldLevelEncryptionProfileList")]
        getter field_level_encryption_profile_list : Types::FieldLevelEncryptionProfileList?

        def initialize(
          @field_level_encryption_profile_list : Types::FieldLevelEncryptionProfileList? = nil
        )
        end
      end


      struct ListFunctionsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of functions. The
        # response includes functions in the list that occur after the marker. To get the next page of the
        # list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of functions that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # An optional filter to return only the functions that are in the specified stage, either DEVELOPMENT
        # or LIVE .

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct ListFunctionsResult
        include JSON::Serializable

        # A list of CloudFront functions.

        @[JSON::Field(key: "FunctionList")]
        getter function_list : Types::FunctionList?

        def initialize(
          @function_list : Types::FunctionList? = nil
        )
        end
      end


      struct ListInvalidationsForDistributionTenantRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Use this parameter when paginating results to indicate where to begin in your list of invalidation
        # batches. Because the results are returned in decreasing order from most recent to oldest, the most
        # recent results are on the first page, the second page will contain earlier results, and so on. To
        # get the next page of results, set Marker to the value of the NextMarker from the current page's
        # response. This value is the same as the ID of the last invalidation batch on that page.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of invalidations to return for the distribution tenant.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @id : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListInvalidationsForDistributionTenantResult
        include JSON::Serializable


        @[JSON::Field(key: "InvalidationList")]
        getter invalidation_list : Types::InvalidationList?

        def initialize(
          @invalidation_list : Types::InvalidationList? = nil
        )
        end
      end

      # The request to list invalidations.

      struct ListInvalidationsRequest
        include JSON::Serializable

        # The distribution's ID.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String

        # Use this parameter when paginating results to indicate where to begin in your list of invalidation
        # batches. Because the results are returned in decreasing order from most recent to oldest, the most
        # recent results are on the first page, the second page will contain earlier results, and so on. To
        # get the next page of results, set Marker to the value of the NextMarker from the current page's
        # response. This value is the same as the ID of the last invalidation batch on that page.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of invalidation batches that you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @distribution_id : String,
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct ListInvalidationsResult
        include JSON::Serializable

        # Information about invalidation batches.

        @[JSON::Field(key: "InvalidationList")]
        getter invalidation_list : Types::InvalidationList?

        def initialize(
          @invalidation_list : Types::InvalidationList? = nil
        )
        end
      end


      struct ListKeyGroupsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of key groups. The
        # response includes key groups in the list that occur after the marker. To get the next page of the
        # list, set this field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of key groups that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListKeyGroupsResult
        include JSON::Serializable

        # A list of key groups.

        @[JSON::Field(key: "KeyGroupList")]
        getter key_group_list : Types::KeyGroupList?

        def initialize(
          @key_group_list : Types::KeyGroupList? = nil
        )
        end
      end


      struct ListKeyValueStoresRequest
        include JSON::Serializable

        # The marker associated with the key value stores list.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of items in the key value stores list.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # The status of the request for the key value stores list.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListKeyValueStoresResult
        include JSON::Serializable

        # The resulting key value stores list.

        @[JSON::Field(key: "KeyValueStoreList")]
        getter key_value_store_list : Types::KeyValueStoreList?

        def initialize(
          @key_value_store_list : Types::KeyValueStoreList? = nil
        )
        end
      end


      struct ListOriginAccessControlsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of origin access
        # controls. The response includes the items in the list that occur after the marker. To get the next
        # page of the list, set this field's value to the value of NextMarker from the current page's
        # response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of origin access controls that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListOriginAccessControlsResult
        include JSON::Serializable

        # A list of origin access controls.

        @[JSON::Field(key: "OriginAccessControlList")]
        getter origin_access_control_list : Types::OriginAccessControlList?

        def initialize(
          @origin_access_control_list : Types::OriginAccessControlList? = nil
        )
        end
      end


      struct ListOriginRequestPoliciesRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of origin request
        # policies. The response includes origin request policies in the list that occur after the marker. To
        # get the next page of the list, set this field's value to the value of NextMarker from the current
        # page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of origin request policies that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # A filter to return only the specified kinds of origin request policies. Valid values are: managed –
        # Returns only the managed policies created by Amazon Web Services. custom – Returns only the custom
        # policies created in your Amazon Web Services account.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListOriginRequestPoliciesResult
        include JSON::Serializable

        # A list of origin request policies.

        @[JSON::Field(key: "OriginRequestPolicyList")]
        getter origin_request_policy_list : Types::OriginRequestPolicyList?

        def initialize(
          @origin_request_policy_list : Types::OriginRequestPolicyList? = nil
        )
        end
      end


      struct ListPublicKeysRequest
        include JSON::Serializable

        # Use this when paginating results to indicate where to begin in your list of public keys. The results
        # include public keys in the list that occur after the marker. To get the next page of results, set
        # the Marker to the value of the NextMarker from the current page's response (which is also the ID of
        # the last public key on that page).

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of public keys you want in the response body.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListPublicKeysResult
        include JSON::Serializable

        # Returns a list of all public keys that have been added to CloudFront for this account.

        @[JSON::Field(key: "PublicKeyList")]
        getter public_key_list : Types::PublicKeyList?

        def initialize(
          @public_key_list : Types::PublicKeyList? = nil
        )
        end
      end


      struct ListRealtimeLogConfigsRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of real-time log
        # configurations. The response includes real-time log configurations in the list that occur after the
        # marker. To get the next page of the list, set this field's value to the value of NextMarker from the
        # current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of real-time log configurations that you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListRealtimeLogConfigsResult
        include JSON::Serializable

        # A list of real-time log configurations.

        @[JSON::Field(key: "RealtimeLogConfigs")]
        getter realtime_log_configs : Types::RealtimeLogConfigs?

        def initialize(
          @realtime_log_configs : Types::RealtimeLogConfigs? = nil
        )
        end
      end


      struct ListResponseHeadersPoliciesRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list of response headers
        # policies. The response includes response headers policies in the list that occur after the marker.
        # To get the next page of the list, set this field's value to the value of NextMarker from the current
        # page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of response headers policies that you want to get in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        # A filter to get only the specified kind of response headers policies. Valid values are: managed –
        # Gets only the managed policies created by Amazon Web Services. custom – Gets only the custom
        # policies created in your Amazon Web Services account.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListResponseHeadersPoliciesResult
        include JSON::Serializable

        # A list of response headers policies.

        @[JSON::Field(key: "ResponseHeadersPolicyList")]
        getter response_headers_policy_list : Types::ResponseHeadersPolicyList?

        def initialize(
          @response_headers_policy_list : Types::ResponseHeadersPolicyList? = nil
        )
        end
      end

      # The request to list your streaming distributions.

      struct ListStreamingDistributionsRequest
        include JSON::Serializable

        # The value that you provided for the Marker request parameter.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The value that you provided for the MaxItems request parameter.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct ListStreamingDistributionsResult
        include JSON::Serializable

        # The StreamingDistributionList type.

        @[JSON::Field(key: "StreamingDistributionList")]
        getter streaming_distribution_list : Types::StreamingDistributionList?

        def initialize(
          @streaming_distribution_list : Types::StreamingDistributionList? = nil
        )
        end
      end

      # The request to list tags for a CloudFront resource.

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # An ARN of a CloudFront resource.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @resource : String
        )
        end
      end

      # The returned result of the corresponding request.

      struct ListTagsForResourceResult
        include JSON::Serializable

        # A complex type that contains zero or more Tag elements.

        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags

        def initialize(
          @tags : Types::Tags
        )
        end
      end


      struct ListTrustStoresRequest
        include JSON::Serializable

        # Use this field when paginating results to indicate where to begin in your list. The response
        # includes items in the list that occur after the marker. To get the next page of the list, set this
        # field's value to the value of NextMarker from the current page's response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of trust stores that you want returned in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end


      struct ListTrustStoresResult
        include JSON::Serializable

        # Indicates the next page of trust stores. To get the next page of the list, use this value in the
        # Marker field of your request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The trust store list.

        @[JSON::Field(key: "TrustStoreList")]
        getter trust_store_list : Array(Types::TrustStoreSummary)?

        def initialize(
          @next_marker : String? = nil,
          @trust_store_list : Array(Types::TrustStoreSummary)? = nil
        )
        end
      end


      struct ListVpcOriginsRequest
        include JSON::Serializable

        # The marker associated with the VPC origins list.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of items included in the list.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : String?

        def initialize(
          @marker : String? = nil,
          @max_items : String? = nil
        )
        end
      end


      struct ListVpcOriginsResult
        include JSON::Serializable

        # List of VPC origins.

        @[JSON::Field(key: "VpcOriginList")]
        getter vpc_origin_list : Types::VpcOriginList?

        def initialize(
          @vpc_origin_list : Types::VpcOriginList? = nil
        )
        end
      end

      # A complex type that specifies whether access logs are written for the distribution. If you already
      # enabled standard logging (legacy) and you want to enable standard logging (v2) to send your access
      # logs to Amazon S3, we recommend that you specify a different Amazon S3 bucket or use a separate path
      # in the same bucket (for example, use a log prefix or partitioning). This helps you keep track of
      # which log files are associated with which logging subscription and prevents log files from
      # overwriting each other. For more information, see Standard logging (access logs) in the Amazon
      # CloudFront Developer Guide .

      struct LoggingConfig
        include JSON::Serializable

        # The Amazon S3 bucket to store the access logs in, for example, amzn-s3-demo-bucket.s3.amazonaws.com
        # .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # Specifies whether you want CloudFront to save access logs to an Amazon S3 bucket. If you don't want
        # to enable logging when you create a distribution or if you want to disable logging for an existing
        # distribution, specify false for Enabled , and specify empty Bucket and Prefix elements. If you
        # specify false for Enabled but you specify values for Bucket and prefix , the values are
        # automatically deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies whether you want CloudFront to include cookies in access logs, specify true for
        # IncludeCookies . If you choose to include cookies in logs, CloudFront logs all cookies regardless of
        # how you configure the cache behaviors for this distribution. If you don't want to include cookies
        # when you create a distribution or if you want to disable include cookies for an existing
        # distribution, specify false for IncludeCookies .

        @[JSON::Field(key: "IncludeCookies")]
        getter include_cookies : Bool?

        # An optional string that you want CloudFront to prefix to the access log filenames for this
        # distribution, for example, myprefix/ . If you want to enable logging, but you don't want to specify
        # a prefix, you still must include an empty Prefix element in the Logging element.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @enabled : Bool? = nil,
          @include_cookies : Bool? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Contains details about the CloudFront managed ACM certificate.

      struct ManagedCertificateDetails
        include JSON::Serializable

        # The ARN of the CloudFront managed ACM certificate.

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The status of the CloudFront managed ACM certificate. Your distribution tenant will be updated with
        # the latest certificate status. When calling the UpdateDistributionTenant operation, use the latest
        # value for the ETag .

        @[JSON::Field(key: "CertificateStatus")]
        getter certificate_status : String?

        # Contains details about the validation token of the specified CloudFront managed ACM certificate.

        @[JSON::Field(key: "ValidationTokenDetails")]
        getter validation_token_details : Array(Types::ValidationTokenDetail)?

        # Contains details about the validation token host of the specified CloudFront managed ACM
        # certificate. For cloudfront , CloudFront will automatically serve the validation token. Choose this
        # mode if you can point the domain's DNS to CloudFront immediately. For self-hosted , you serve the
        # validation token from your existing infrastructure. Choose this mode when you need to maintain
        # current traffic flow while your certificate is being issued. You can place the validation token at
        # the well-known path on your existing web server, wait for ACM to validate and issue the certificate,
        # and then update your DNS to point to CloudFront. This setting only affects the initial certificate
        # request. Once the DNS points to CloudFront, all future certificate renewals are automatically
        # handled through CloudFront.

        @[JSON::Field(key: "ValidationTokenHost")]
        getter validation_token_host : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_status : String? = nil,
          @validation_token_details : Array(Types::ValidationTokenDetail)? = nil,
          @validation_token_host : String? = nil
        )
        end
      end

      # An object that represents the request for the Amazon CloudFront managed ACM certificate.

      struct ManagedCertificateRequest
        include JSON::Serializable

        # Specify how the HTTP validation token will be served when requesting the CloudFront managed ACM
        # certificate. For cloudfront , CloudFront will automatically serve the validation token. Choose this
        # mode if you can point the domain's DNS to CloudFront immediately. For self-hosted , you serve the
        # validation token from your existing infrastructure. Choose this mode when you need to maintain
        # current traffic flow while your certificate is being issued. You can place the validation token at
        # the well-known path on your existing web server, wait for ACM to validate and issue the certificate,
        # and then update your DNS to point to CloudFront.

        @[JSON::Field(key: "ValidationTokenHost")]
        getter validation_token_host : String

        # You can opt out of certificate transparency logging by specifying the disabled option. Opt in by
        # specifying enabled . For more information, see Certificate Transparency Logging in the Certificate
        # Manager User Guide .

        @[JSON::Field(key: "CertificateTransparencyLoggingPreference")]
        getter certificate_transparency_logging_preference : String?

        # The primary domain name associated with the CloudFront managed ACM certificate.

        @[JSON::Field(key: "PrimaryDomainName")]
        getter primary_domain_name : String?

        def initialize(
          @validation_token_host : String,
          @certificate_transparency_logging_preference : String? = nil,
          @primary_domain_name : String? = nil
        )
        end
      end

      # This operation requires a body. Ensure that the body is present and the Content-Type header is set.

      struct MissingBody
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A monitoring subscription. This structure contains information about whether additional CloudWatch
      # metrics are enabled for a given CloudFront distribution.

      struct MonitoringSubscription
        include JSON::Serializable

        # A subscription configuration for additional CloudWatch metrics.

        @[JSON::Field(key: "RealtimeMetricsSubscriptionConfig")]
        getter realtime_metrics_subscription_config : Types::RealtimeMetricsSubscriptionConfig?

        def initialize(
          @realtime_metrics_subscription_config : Types::RealtimeMetricsSubscriptionConfig? = nil
        )
        end
      end

      # A monitoring subscription already exists for the specified distribution.

      struct MonitoringSubscriptionAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The cache policy does not exist.

      struct NoSuchCachePolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified origin access identity does not exist.

      struct NoSuchCloudFrontOriginAccessIdentity
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The continuous deployment policy doesn't exist.

      struct NoSuchContinuousDeploymentPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified distribution does not exist.

      struct NoSuchDistribution
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified configuration for field-level encryption doesn't exist.

      struct NoSuchFieldLevelEncryptionConfig
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified profile for field-level encryption doesn't exist.

      struct NoSuchFieldLevelEncryptionProfile
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The function does not exist.

      struct NoSuchFunctionExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified invalidation does not exist.

      struct NoSuchInvalidation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A monitoring subscription does not exist for the specified distribution.

      struct NoSuchMonitoringSubscription
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # No origin exists with the specified Origin Id .

      struct NoSuchOrigin
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The origin access control does not exist.

      struct NoSuchOriginAccessControl
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The origin request policy does not exist.

      struct NoSuchOriginRequestPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified public key doesn't exist.

      struct NoSuchPublicKey
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The real-time log configuration does not exist.

      struct NoSuchRealtimeLogConfig
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A resource that was specified is not valid.

      struct NoSuchResource
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The response headers policy does not exist.

      struct NoSuchResponseHeadersPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified streaming distribution does not exist.

      struct NoSuchStreamingDistribution
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An origin. An origin is the location where content is stored, and from which CloudFront gets content
      # to serve to viewers. To specify an origin: Use S3OriginConfig to specify an Amazon S3 bucket that is
      # not configured with static website hosting. Use VpcOriginConfig to specify a VPC origin. Use
      # CustomOriginConfig to specify all other kinds of origins, including: An Amazon S3 bucket that is
      # configured with static website hosting An Elastic Load Balancing load balancer An Elemental
      # MediaPackage endpoint An Elemental MediaStore container Any other HTTP server, running on an Amazon
      # EC2 instance or any other kind of host For the current maximum number of origins that you can
      # specify per distribution, see General Quotas on Web Distributions in the Amazon CloudFront Developer
      # Guide (quotas were formerly referred to as limits).

      struct Origin
        include JSON::Serializable

        # The domain name for the origin. For more information, see Origin Domain Name in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A unique identifier for the origin. This value must be unique within the distribution. Use this
        # value to specify the TargetOriginId in a CacheBehavior or DefaultCacheBehavior .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The number of times that CloudFront attempts to connect to the origin. The minimum number is 1, the
        # maximum is 3, and the default (if you don't specify otherwise) is 3. For a custom origin (including
        # an Amazon S3 bucket that's configured with static website hosting), this value also specifies the
        # number of times that CloudFront attempts to get a response from the origin, in the case of an Origin
        # Response Timeout . For more information, see Origin Connection Attempts in the Amazon CloudFront
        # Developer Guide .

        @[JSON::Field(key: "ConnectionAttempts")]
        getter connection_attempts : Int32?

        # The number of seconds that CloudFront waits when trying to establish a connection to the origin. The
        # minimum timeout is 1 second, the maximum is 10 seconds, and the default (if you don't specify
        # otherwise) is 10 seconds. For more information, see Origin Connection Timeout in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "ConnectionTimeout")]
        getter connection_timeout : Int32?

        # A list of HTTP header names and values that CloudFront adds to the requests that it sends to the
        # origin. For more information, see Adding Custom Headers to Origin Requests in the Amazon CloudFront
        # Developer Guide .

        @[JSON::Field(key: "CustomHeaders")]
        getter custom_headers : Types::CustomHeaders?

        # Use this type to specify an origin that is not an Amazon S3 bucket, with one exception. If the
        # Amazon S3 bucket is configured with static website hosting, use this type. If the Amazon S3 bucket
        # is not configured with static website hosting, use the S3OriginConfig type instead.

        @[JSON::Field(key: "CustomOriginConfig")]
        getter custom_origin_config : Types::CustomOriginConfig?

        # The unique identifier of an origin access control for this origin. For more information, see
        # Restricting access to an Amazon S3 origin in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginAccessControlId")]
        getter origin_access_control_id : String?

        # An optional path that CloudFront appends to the origin domain name when CloudFront requests content
        # from the origin. For more information, see Origin Path in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginPath")]
        getter origin_path : String?

        # CloudFront Origin Shield. Using Origin Shield can help reduce the load on your origin. For more
        # information, see Using Origin Shield in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginShield")]
        getter origin_shield : Types::OriginShield?

        # The time (in seconds) that a request from CloudFront to the origin can stay open and wait for a
        # response. If the complete response isn't received from the origin by this time, CloudFront ends the
        # connection. The value for ResponseCompletionTimeout must be equal to or greater than the value for
        # OriginReadTimeout . If you don't set a value for ResponseCompletionTimeout , CloudFront doesn't
        # enforce a maximum value. For more information, see Response completion timeout in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "ResponseCompletionTimeout")]
        getter response_completion_timeout : Int32?

        # Use this type to specify an origin that is an Amazon S3 bucket that is not configured with static
        # website hosting. To specify any other type of origin, including an Amazon S3 bucket that is
        # configured with static website hosting, use the CustomOriginConfig type instead.

        @[JSON::Field(key: "S3OriginConfig")]
        getter s3_origin_config : Types::S3OriginConfig?

        # The VPC origin configuration.

        @[JSON::Field(key: "VpcOriginConfig")]
        getter vpc_origin_config : Types::VpcOriginConfig?

        def initialize(
          @domain_name : String,
          @id : String,
          @connection_attempts : Int32? = nil,
          @connection_timeout : Int32? = nil,
          @custom_headers : Types::CustomHeaders? = nil,
          @custom_origin_config : Types::CustomOriginConfig? = nil,
          @origin_access_control_id : String? = nil,
          @origin_path : String? = nil,
          @origin_shield : Types::OriginShield? = nil,
          @response_completion_timeout : Int32? = nil,
          @s3_origin_config : Types::S3OriginConfig? = nil,
          @vpc_origin_config : Types::VpcOriginConfig? = nil
        )
        end
      end

      # A CloudFront origin access control, including its unique identifier.

      struct OriginAccessControl
        include JSON::Serializable

        # The unique identifier of the origin access control.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The origin access control.

        @[JSON::Field(key: "OriginAccessControlConfig")]
        getter origin_access_control_config : Types::OriginAccessControlConfig?

        def initialize(
          @id : String,
          @origin_access_control_config : Types::OriginAccessControlConfig? = nil
        )
        end
      end

      # An origin access control with the specified parameters already exists.

      struct OriginAccessControlAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A CloudFront origin access control configuration.

      struct OriginAccessControlConfig
        include JSON::Serializable

        # A name to identify the origin access control. You can specify up to 64 characters.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of origin that this origin access control is for.

        @[JSON::Field(key: "OriginAccessControlOriginType")]
        getter origin_access_control_origin_type : String

        # Specifies which requests CloudFront signs (adds authentication information to). Specify always for
        # the most common use case. For more information, see origin access control advanced settings in the
        # Amazon CloudFront Developer Guide . This field can have one of the following values: always –
        # CloudFront signs all origin requests, overwriting the Authorization header from the viewer request
        # if one exists. never – CloudFront doesn't sign any origin requests. This value turns off origin
        # access control for all origins in all distributions that use this origin access control. no-override
        # – If the viewer request doesn't contain the Authorization header, then CloudFront signs the origin
        # request. If the viewer request contains the Authorization header, then CloudFront doesn't sign the
        # origin request and instead passes along the Authorization header from the viewer request. WARNING:
        # To pass along the Authorization header from the viewer request, you must add the Authorization
        # header to a cache policy for all cache behaviors that use origins associated with this origin access
        # control.

        @[JSON::Field(key: "SigningBehavior")]
        getter signing_behavior : String

        # The signing protocol of the origin access control, which determines how CloudFront signs
        # (authenticates) requests. The only valid value is sigv4 .

        @[JSON::Field(key: "SigningProtocol")]
        getter signing_protocol : String

        # A description of the origin access control.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @origin_access_control_origin_type : String,
          @signing_behavior : String,
          @signing_protocol : String,
          @description : String? = nil
        )
        end
      end

      # Cannot delete the origin access control because it's in use by one or more distributions.

      struct OriginAccessControlInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of CloudFront origin access controls.

      struct OriginAccessControlList
        include JSON::Serializable

        # If there are more items in the list than are in this response, this value is true .

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value of the Marker field that was provided in the request.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of origin access controls requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of origin access controls returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Contains the origin access controls in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginAccessControlSummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value to use in the Marker field of another request to continue listing origin access controls.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::OriginAccessControlSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A CloudFront origin access control.

      struct OriginAccessControlSummary
        include JSON::Serializable

        # A description of the origin access control.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The unique identifier of the origin access control.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A unique name that identifies the origin access control.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of origin that this origin access control is for.

        @[JSON::Field(key: "OriginAccessControlOriginType")]
        getter origin_access_control_origin_type : String

        # A value that specifies which requests CloudFront signs (adds authentication information to). This
        # field can have one of the following values: never – CloudFront doesn't sign any origin requests.
        # always – CloudFront signs all origin requests, overwriting the Authorization header from the viewer
        # request if necessary. no-override – If the viewer request doesn't contain the Authorization header,
        # CloudFront signs the origin request. If the viewer request contains the Authorization header,
        # CloudFront doesn't sign the origin request, but instead passes along the Authorization header that
        # it received in the viewer request.

        @[JSON::Field(key: "SigningBehavior")]
        getter signing_behavior : String

        # The signing protocol of the origin access control. The signing protocol determines how CloudFront
        # signs (authenticates) requests. The only valid value is sigv4 .

        @[JSON::Field(key: "SigningProtocol")]
        getter signing_protocol : String

        def initialize(
          @description : String,
          @id : String,
          @name : String,
          @origin_access_control_origin_type : String,
          @signing_behavior : String,
          @signing_protocol : String
        )
        end
      end

      # A complex type that contains HeaderName and HeaderValue elements, if any, for this distribution.

      struct OriginCustomHeader
        include JSON::Serializable

        # The name of a header that you want CloudFront to send to your origin. For more information, see
        # Adding Custom Headers to Origin Requests in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String

        # The value for the header that you specified in the HeaderName field.

        @[JSON::Field(key: "HeaderValue")]
        getter header_value : String

        def initialize(
          @header_name : String,
          @header_value : String
        )
        end
      end

      # An origin group includes two origins (a primary origin and a secondary origin to failover to) and a
      # failover criteria that you specify. You create an origin group to support origin failover in
      # CloudFront. When you create or update a distribution, you can specify the origin group instead of a
      # single origin, and CloudFront will failover from the primary origin to the secondary origin under
      # the failover conditions that you've chosen. Optionally, you can choose selection criteria for your
      # origin group to specify how your origins are selected when your distribution routes viewer requests.

      struct OriginGroup
        include JSON::Serializable

        # A complex type that contains information about the failover criteria for an origin group.

        @[JSON::Field(key: "FailoverCriteria")]
        getter failover_criteria : Types::OriginGroupFailoverCriteria

        # The origin group's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A complex type that contains information about the origins in an origin group.

        @[JSON::Field(key: "Members")]
        getter members : Types::OriginGroupMembers

        # The selection criteria for the origin group. For more information, see Create an origin group in the
        # Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "SelectionCriteria")]
        getter selection_criteria : String?

        def initialize(
          @failover_criteria : Types::OriginGroupFailoverCriteria,
          @id : String,
          @members : Types::OriginGroupMembers,
          @selection_criteria : String? = nil
        )
        end
      end

      # A complex data type that includes information about the failover criteria for an origin group,
      # including the status codes for which CloudFront will failover from the primary origin to the second
      # origin.

      struct OriginGroupFailoverCriteria
        include JSON::Serializable

        # The status codes that, when returned from the primary origin, will trigger CloudFront to failover to
        # the second origin.

        @[JSON::Field(key: "StatusCodes")]
        getter status_codes : Types::StatusCodes

        def initialize(
          @status_codes : Types::StatusCodes
        )
        end
      end

      # An origin in an origin group.

      struct OriginGroupMember
        include JSON::Serializable

        # The ID for an origin in an origin group.

        @[JSON::Field(key: "OriginId")]
        getter origin_id : String

        def initialize(
          @origin_id : String
        )
        end
      end

      # A complex data type for the origins included in an origin group.

      struct OriginGroupMembers
        include JSON::Serializable

        # Items (origins) in an origin group.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginGroupMember)

        # The number of origins in an origin group.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(Types::OriginGroupMember),
          @quantity : Int32
        )
        end
      end

      # A complex data type for the origin groups specified for a distribution.

      struct OriginGroups
        include JSON::Serializable

        # The number of origin groups.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The items (origin groups) in a distribution.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginGroup)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::OriginGroup)? = nil
        )
        end
      end

      # An origin request policy. When it's attached to a cache behavior, the origin request policy
      # determines the values that CloudFront includes in requests that it sends to the origin. Each request
      # that CloudFront sends to the origin includes the following: The request body and the URL path
      # (without the domain name) from the viewer request. The headers that CloudFront automatically
      # includes in every origin request, including Host , User-Agent , and X-Amz-Cf-Id . All HTTP headers,
      # cookies, and URL query strings that are specified in the cache policy or the origin request policy.
      # These can include items from the viewer request and, in the case of headers, additional ones that
      # are added by CloudFront. CloudFront sends a request when it can't find an object in its cache that
      # matches the request. If you want to send values to the origin and also include them in the cache
      # key, use CachePolicy .

      struct OriginRequestPolicy
        include JSON::Serializable

        # The unique identifier for the origin request policy.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the origin request policy was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The origin request policy configuration.

        @[JSON::Field(key: "OriginRequestPolicyConfig")]
        getter origin_request_policy_config : Types::OriginRequestPolicyConfig

        def initialize(
          @id : String,
          @last_modified_time : Time,
          @origin_request_policy_config : Types::OriginRequestPolicyConfig
        )
        end
      end

      # An origin request policy with this name already exists. You must provide a unique name. To modify an
      # existing origin request policy, use UpdateOriginRequestPolicy .

      struct OriginRequestPolicyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An origin request policy configuration. This configuration determines the values that CloudFront
      # includes in requests that it sends to the origin. Each request that CloudFront sends to the origin
      # includes the following: The request body and the URL path (without the domain name) from the viewer
      # request. The headers that CloudFront automatically includes in every origin request, including Host
      # , User-Agent , and X-Amz-Cf-Id . All HTTP headers, cookies, and URL query strings that are specified
      # in the cache policy or the origin request policy. These can include items from the viewer request
      # and, in the case of headers, additional ones that are added by CloudFront. CloudFront sends a
      # request when it can't find an object in its cache that matches the request. If you want to send
      # values to the origin and also include them in the cache key, use CachePolicy .

      struct OriginRequestPolicyConfig
        include JSON::Serializable

        # The cookies from viewer requests to include in origin requests.

        @[JSON::Field(key: "CookiesConfig")]
        getter cookies_config : Types::OriginRequestPolicyCookiesConfig

        # The HTTP headers to include in origin requests. These can include headers from viewer requests and
        # additional headers added by CloudFront.

        @[JSON::Field(key: "HeadersConfig")]
        getter headers_config : Types::OriginRequestPolicyHeadersConfig

        # A unique name to identify the origin request policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The URL query strings from viewer requests to include in origin requests.

        @[JSON::Field(key: "QueryStringsConfig")]
        getter query_strings_config : Types::OriginRequestPolicyQueryStringsConfig

        # A comment to describe the origin request policy. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @cookies_config : Types::OriginRequestPolicyCookiesConfig,
          @headers_config : Types::OriginRequestPolicyHeadersConfig,
          @name : String,
          @query_strings_config : Types::OriginRequestPolicyQueryStringsConfig,
          @comment : String? = nil
        )
        end
      end

      # An object that determines whether any cookies in viewer requests (and if so, which cookies) are
      # included in requests that CloudFront sends to the origin.

      struct OriginRequestPolicyCookiesConfig
        include JSON::Serializable

        # Determines whether cookies in viewer requests are included in requests that CloudFront sends to the
        # origin. Valid values are: none – No cookies in viewer requests are included in requests that
        # CloudFront sends to the origin. Even when this field is set to none , any cookies that are listed in
        # a CachePolicy are included in origin requests. whitelist – Only the cookies in viewer requests that
        # are listed in the CookieNames type are included in requests that CloudFront sends to the origin. all
        # – All cookies in viewer requests are included in requests that CloudFront sends to the origin.
        # allExcept – All cookies in viewer requests are included in requests that CloudFront sends to the
        # origin, except for those listed in the CookieNames type, which are not included.

        @[JSON::Field(key: "CookieBehavior")]
        getter cookie_behavior : String


        @[JSON::Field(key: "Cookies")]
        getter cookies : Types::CookieNames?

        def initialize(
          @cookie_behavior : String,
          @cookies : Types::CookieNames? = nil
        )
        end
      end

      # An object that determines whether any HTTP headers (and if so, which headers) are included in
      # requests that CloudFront sends to the origin.

      struct OriginRequestPolicyHeadersConfig
        include JSON::Serializable

        # Determines whether any HTTP headers are included in requests that CloudFront sends to the origin.
        # Valid values are: none – No HTTP headers in viewer requests are included in requests that CloudFront
        # sends to the origin. Even when this field is set to none , any headers that are listed in a
        # CachePolicy are included in origin requests. whitelist – Only the HTTP headers that are listed in
        # the Headers type are included in requests that CloudFront sends to the origin. allViewer – All HTTP
        # headers in viewer requests are included in requests that CloudFront sends to the origin.
        # allViewerAndWhitelistCloudFront – All HTTP headers in viewer requests and the additional CloudFront
        # headers that are listed in the Headers type are included in requests that CloudFront sends to the
        # origin. The additional headers are added by CloudFront. allExcept – All HTTP headers in viewer
        # requests are included in requests that CloudFront sends to the origin, except for those listed in
        # the Headers type, which are not included.

        @[JSON::Field(key: "HeaderBehavior")]
        getter header_behavior : String


        @[JSON::Field(key: "Headers")]
        getter headers : Types::Headers?

        def initialize(
          @header_behavior : String,
          @headers : Types::Headers? = nil
        )
        end
      end

      # Cannot delete the origin request policy because it is attached to one or more cache behaviors.

      struct OriginRequestPolicyInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of origin request policies.

      struct OriginRequestPolicyList
        include JSON::Serializable

        # The maximum number of origin request policies requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The total number of origin request policies returned in the response.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Contains the origin request policies in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginRequestPolicySummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing origin
        # request policies where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::OriginRequestPolicySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # An object that determines whether any URL query strings in viewer requests (and if so, which query
      # strings) are included in requests that CloudFront sends to the origin.

      struct OriginRequestPolicyQueryStringsConfig
        include JSON::Serializable

        # Determines whether any URL query strings in viewer requests are included in requests that CloudFront
        # sends to the origin. Valid values are: none – No query strings in viewer requests are included in
        # requests that CloudFront sends to the origin. Even when this field is set to none , any query
        # strings that are listed in a CachePolicy are included in origin requests. whitelist – Only the query
        # strings in viewer requests that are listed in the QueryStringNames type are included in requests
        # that CloudFront sends to the origin. all – All query strings in viewer requests are included in
        # requests that CloudFront sends to the origin. allExcept – All query strings in viewer requests are
        # included in requests that CloudFront sends to the origin, except for those listed in the
        # QueryStringNames type, which are not included.

        @[JSON::Field(key: "QueryStringBehavior")]
        getter query_string_behavior : String

        # Contains the specific query strings in viewer requests that either are or are not included in
        # requests that CloudFront sends to the origin. The behavior depends on whether the
        # QueryStringBehavior field in the OriginRequestPolicyQueryStringsConfig type is set to whitelist (the
        # listed query strings are included) or allExcept (the listed query strings are not included, but all
        # other query strings are).

        @[JSON::Field(key: "QueryStrings")]
        getter query_strings : Types::QueryStringNames?

        def initialize(
          @query_string_behavior : String,
          @query_strings : Types::QueryStringNames? = nil
        )
        end
      end

      # Contains an origin request policy.

      struct OriginRequestPolicySummary
        include JSON::Serializable

        # The origin request policy.

        @[JSON::Field(key: "OriginRequestPolicy")]
        getter origin_request_policy : Types::OriginRequestPolicy

        # The type of origin request policy, either managed (created by Amazon Web Services) or custom
        # (created in this Amazon Web Services account).

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @origin_request_policy : Types::OriginRequestPolicy,
          @type : String
        )
        end
      end

      # CloudFront Origin Shield. Using Origin Shield can help reduce the load on your origin. For more
      # information, see Using Origin Shield in the Amazon CloudFront Developer Guide .

      struct OriginShield
        include JSON::Serializable

        # A flag that specifies whether Origin Shield is enabled. When it's enabled, CloudFront routes all
        # requests through Origin Shield, which can help protect your origin. When it's disabled, CloudFront
        # might send requests directly to your origin from multiple edge locations or regional edge caches.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The Amazon Web Services Region for Origin Shield. Specify the Amazon Web Services Region that has
        # the lowest latency to your origin. To specify a region, use the region code, not the region name.
        # For example, specify the US East (Ohio) region as us-east-2 . When you enable CloudFront Origin
        # Shield, you must specify the Amazon Web Services Region for Origin Shield. For the list of Amazon
        # Web Services Regions that you can specify, and for help choosing the best Region for your origin,
        # see Choosing the Amazon Web Services Region for Origin Shield in the Amazon CloudFront Developer
        # Guide .

        @[JSON::Field(key: "OriginShieldRegion")]
        getter origin_shield_region : String?

        def initialize(
          @enabled : Bool,
          @origin_shield_region : String? = nil
        )
        end
      end

      # A complex type that contains information about the SSL/TLS protocols that CloudFront can use when
      # establishing an HTTPS connection with your origin.

      struct OriginSslProtocols
        include JSON::Serializable

        # A list that contains allowed SSL/TLS protocols for this distribution.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of SSL/TLS protocols that you want to allow CloudFront to use when establishing an HTTPS
        # connection with this origin.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(String),
          @quantity : Int32
        )
        end
      end

      # Contains information about the origins for this distribution.

      struct Origins
        include JSON::Serializable

        # A list of origins.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Origin)

        # The number of origins for this distribution.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(Types::Origin),
          @quantity : Int32
        )
        end
      end

      # A list of parameter values to add to the resource. A parameter is specified as a key-value pair. A
      # valid parameter value must exist for any parameter that is marked as required in the multi-tenant
      # distribution.

      struct Parameter
        include JSON::Serializable

        # The parameter name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The parameter value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # A list of parameter values to add to the resource. A parameter is specified as a key-value pair. A
      # valid parameter value must exist for any parameter that is marked as required in the multi-tenant
      # distribution.

      struct ParameterDefinition
        include JSON::Serializable

        # The value that you assigned to the parameter.

        @[JSON::Field(key: "Definition")]
        getter definition : Types::ParameterDefinitionSchema

        # The name of the parameter.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @definition : Types::ParameterDefinitionSchema,
          @name : String
        )
        end
      end

      # An object that contains information about the parameter definition.

      struct ParameterDefinitionSchema
        include JSON::Serializable

        # An object that contains information about the string schema.

        @[JSON::Field(key: "StringSchema")]
        getter string_schema : Types::StringSchemaConfig?

        def initialize(
          @string_schema : Types::StringSchemaConfig? = nil
        )
        end
      end

      # This object determines the values that CloudFront includes in the cache key. These values can
      # include HTTP headers, cookies, and URL query strings. CloudFront uses the cache key to find an
      # object in its cache that it can return to the viewer. The headers, cookies, and query strings that
      # are included in the cache key are also included in requests that CloudFront sends to the origin.
      # CloudFront sends a request when it can't find an object in its cache that matches the request's
      # cache key. If you want to send values to the origin but not include them in the cache key, use
      # OriginRequestPolicy .

      struct ParametersInCacheKeyAndForwardedToOrigin
        include JSON::Serializable

        # An object that determines whether any cookies in viewer requests (and if so, which cookies) are
        # included in the cache key and in requests that CloudFront sends to the origin.

        @[JSON::Field(key: "CookiesConfig")]
        getter cookies_config : Types::CachePolicyCookiesConfig

        # A flag that can affect whether the Accept-Encoding HTTP header is included in the cache key and
        # included in requests that CloudFront sends to the origin. This field is related to the
        # EnableAcceptEncodingBrotli field. If one or both of these fields is true and the viewer request
        # includes the Accept-Encoding header, then CloudFront does the following: Normalizes the value of the
        # viewer's Accept-Encoding header Includes the normalized header in the cache key Includes the
        # normalized header in the request to the origin, if a request is necessary For more information, see
        # Compression support in the Amazon CloudFront Developer Guide . If you set this value to true , and
        # this cache behavior also has an origin request policy attached, do not include the Accept-Encoding
        # header in the origin request policy. CloudFront always includes the Accept-Encoding header in origin
        # requests when the value of this field is true , so including this header in an origin request policy
        # has no effect. If both of these fields are false , then CloudFront treats the Accept-Encoding header
        # the same as any other HTTP header in the viewer request. By default, it's not included in the cache
        # key and it's not included in origin requests. In this case, you can manually add Accept-Encoding to
        # the headers whitelist like any other HTTP header.

        @[JSON::Field(key: "EnableAcceptEncodingGzip")]
        getter enable_accept_encoding_gzip : Bool

        # An object that determines whether any HTTP headers (and if so, which headers) are included in the
        # cache key and in requests that CloudFront sends to the origin.

        @[JSON::Field(key: "HeadersConfig")]
        getter headers_config : Types::CachePolicyHeadersConfig

        # An object that determines whether any URL query strings in viewer requests (and if so, which query
        # strings) are included in the cache key and in requests that CloudFront sends to the origin.

        @[JSON::Field(key: "QueryStringsConfig")]
        getter query_strings_config : Types::CachePolicyQueryStringsConfig

        # A flag that can affect whether the Accept-Encoding HTTP header is included in the cache key and
        # included in requests that CloudFront sends to the origin. This field is related to the
        # EnableAcceptEncodingGzip field. If one or both of these fields is true and the viewer request
        # includes the Accept-Encoding header, then CloudFront does the following: Normalizes the value of the
        # viewer's Accept-Encoding header Includes the normalized header in the cache key Includes the
        # normalized header in the request to the origin, if a request is necessary For more information, see
        # Compression support in the Amazon CloudFront Developer Guide . If you set this value to true , and
        # this cache behavior also has an origin request policy attached, do not include the Accept-Encoding
        # header in the origin request policy. CloudFront always includes the Accept-Encoding header in origin
        # requests when the value of this field is true , so including this header in an origin request policy
        # has no effect. If both of these fields are false , then CloudFront treats the Accept-Encoding header
        # the same as any other HTTP header in the viewer request. By default, it's not included in the cache
        # key and it's not included in origin requests. In this case, you can manually add Accept-Encoding to
        # the headers whitelist like any other HTTP header.

        @[JSON::Field(key: "EnableAcceptEncodingBrotli")]
        getter enable_accept_encoding_brotli : Bool?

        def initialize(
          @cookies_config : Types::CachePolicyCookiesConfig,
          @enable_accept_encoding_gzip : Bool,
          @headers_config : Types::CachePolicyHeadersConfig,
          @query_strings_config : Types::CachePolicyQueryStringsConfig,
          @enable_accept_encoding_brotli : Bool? = nil
        )
        end
      end

      # A complex type that contains information about the objects that you want to invalidate. For more
      # information, see Specifying the Objects to Invalidate in the Amazon CloudFront Developer Guide .

      struct Paths
        include JSON::Serializable

        # The number of invalidation paths specified for the objects that you want to invalidate.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains a list of the paths that you want to invalidate.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # The precondition in one or more of the request fields evaluated to false .

      struct PreconditionFailed
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A public key that you can use with signed URLs and signed cookies , or with field-level encryption .
      # CloudFront supports signed URLs and signed cookies with RSA 2048 or ECDSA 256 key signatures.
      # Field-level encryption is only compatible with RSA 2048 key signatures.

      struct PublicKey
        include JSON::Serializable

        # The date and time when the public key was uploaded.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The identifier of the public key.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Configuration information about a public key that you can use with signed URLs and signed cookies ,
        # or with field-level encryption .

        @[JSON::Field(key: "PublicKeyConfig")]
        getter public_key_config : Types::PublicKeyConfig

        def initialize(
          @created_time : Time,
          @id : String,
          @public_key_config : Types::PublicKeyConfig
        )
        end
      end

      # The specified public key already exists.

      struct PublicKeyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration information about a public key that you can use with signed URLs and signed cookies ,
      # or with field-level encryption . CloudFront supports signed URLs and signed cookies with RSA 2048 or
      # ECDSA 256 key signatures. Field-level encryption is only compatible with RSA 2048 key signatures.

      struct PublicKeyConfig
        include JSON::Serializable

        # A string included in the request to help make sure that the request can't be replayed.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # The public key that you can use with signed URLs and signed cookies , or with field-level encryption
        # .

        @[JSON::Field(key: "EncodedKey")]
        getter encoded_key : String

        # A name to help identify the public key.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A comment to describe the public key. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @caller_reference : String,
          @encoded_key : String,
          @name : String,
          @comment : String? = nil
        )
        end
      end

      # The specified public key is in use.

      struct PublicKeyInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of public keys that you can use with signed URLs and signed cookies , or with field-level
      # encryption .

      struct PublicKeyList
        include JSON::Serializable

        # The maximum number of public keys you want in the response.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of public keys in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of public keys.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::PublicKeySummary)?

        # If there are more elements to be listed, this element is present and contains the value that you can
        # use for the Marker request parameter to continue listing your public keys where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::PublicKeySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Contains information about a public key.

      struct PublicKeySummary
        include JSON::Serializable

        # The date and time when the public key was uploaded.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The public key.

        @[JSON::Field(key: "EncodedKey")]
        getter encoded_key : String

        # The identifier of the public key.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A name to help identify the public key.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A comment to describe the public key. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        def initialize(
          @created_time : Time,
          @encoded_key : String,
          @id : String,
          @name : String,
          @comment : String? = nil
        )
        end
      end


      struct PublishConnectionFunctionRequest
        include JSON::Serializable

        # The connection function ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the connection function.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @id : String,
          @if_match : String
        )
        end
      end


      struct PublishConnectionFunctionResult
        include JSON::Serializable

        # The connection function summary.

        @[JSON::Field(key: "ConnectionFunctionSummary")]
        getter connection_function_summary : Types::ConnectionFunctionSummary?

        def initialize(
          @connection_function_summary : Types::ConnectionFunctionSummary? = nil
        )
        end
      end


      struct PublishFunctionRequest
        include JSON::Serializable

        # The current version ( ETag value) of the function that you are publishing, which you can get using
        # DescribeFunction .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the function that you are publishing.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @if_match : String,
          @name : String
        )
        end
      end


      struct PublishFunctionResult
        include JSON::Serializable

        # Contains configuration information and metadata about a CloudFront function.

        @[JSON::Field(key: "FunctionSummary")]
        getter function_summary : Types::FunctionSummary?

        def initialize(
          @function_summary : Types::FunctionSummary? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The JSON-formatted resource policy to create.

        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The Amazon Resource Name (ARN) of the CloudFront resource for which the policy is being created.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_document : String,
          @resource_arn : String
        )
        end
      end


      struct PutResourcePolicyResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudFront resource for which the policy was created.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      # Query argument-profile mapping for field-level encryption.

      struct QueryArgProfile
        include JSON::Serializable

        # ID of profile to use for field-level encryption query argument-profile mapping

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # Query argument for field-level encryption query argument-profile mapping.

        @[JSON::Field(key: "QueryArg")]
        getter query_arg : String

        def initialize(
          @profile_id : String,
          @query_arg : String
        )
        end
      end

      # Configuration for query argument-profile mapping for field-level encryption.

      struct QueryArgProfileConfig
        include JSON::Serializable

        # Flag to set if you want a request to be forwarded to the origin even if the profile specified by the
        # field-level encryption query argument, fle-profile, is unknown.

        @[JSON::Field(key: "ForwardWhenQueryArgProfileIsUnknown")]
        getter forward_when_query_arg_profile_is_unknown : Bool

        # Profiles specified for query argument-profile mapping for field-level encryption.

        @[JSON::Field(key: "QueryArgProfiles")]
        getter query_arg_profiles : Types::QueryArgProfiles?

        def initialize(
          @forward_when_query_arg_profile_is_unknown : Bool,
          @query_arg_profiles : Types::QueryArgProfiles? = nil
        )
        end
      end

      # No profile specified for the field-level encryption query argument.

      struct QueryArgProfileEmpty
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Query argument-profile mapping for field-level encryption.

      struct QueryArgProfiles
        include JSON::Serializable

        # Number of profiles for query argument-profile mapping for field-level encryption.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # Number of items for query argument-profile mapping for field-level encryption.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::QueryArgProfile)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::QueryArgProfile)? = nil
        )
        end
      end

      # This field is deprecated. We recommend that you use a cache policy or an origin request policy
      # instead of this field. If you want to include query strings in the cache key, use QueryStringsConfig
      # in a cache policy. See CachePolicy . If you want to send query strings to the origin but not include
      # them in the cache key, use QueryStringsConfig in an origin request policy. See OriginRequestPolicy .
      # A complex type that contains information about the query string parameters that you want CloudFront
      # to use for caching for a cache behavior.

      struct QueryStringCacheKeys
        include JSON::Serializable

        # The number of whitelisted query string parameters for a cache behavior.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list that contains the query string parameters that you want CloudFront to use as a basis for
        # caching for a cache behavior. If Quantity is 0, you can omit Items .

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # Contains a list of query string names.

      struct QueryStringNames
        include JSON::Serializable

        # The number of query string names in the Items list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of query string names.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # A real-time log configuration.

      struct RealtimeLogConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this real-time log configuration.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # Contains information about the Amazon Kinesis data stream where you are sending real-time log data
        # for this real-time log configuration.

        @[JSON::Field(key: "EndPoints")]
        getter end_points : Array(Types::EndPoint)

        # A list of fields that are included in each real-time log record. In an API response, the fields are
        # provided in the same order in which they are sent to the Amazon Kinesis data stream. For more
        # information about fields, see Real-time log configuration fields in the Amazon CloudFront Developer
        # Guide .

        @[JSON::Field(key: "Fields")]
        getter fields : Array(String)

        # The unique name of this real-time log configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The sampling rate for this real-time log configuration. The sampling rate determines the percentage
        # of viewer requests that are represented in the real-time log data. The sampling rate is an integer
        # between 1 and 100, inclusive.

        @[JSON::Field(key: "SamplingRate")]
        getter sampling_rate : Int64

        def initialize(
          @arn : String,
          @end_points : Array(Types::EndPoint),
          @fields : Array(String),
          @name : String,
          @sampling_rate : Int64
        )
        end
      end

      # A real-time log configuration with this name already exists. You must provide a unique name. To
      # modify an existing real-time log configuration, use UpdateRealtimeLogConfig .

      struct RealtimeLogConfigAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Cannot delete the real-time log configuration because it is attached to one or more cache behaviors.

      struct RealtimeLogConfigInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified real-time log configuration belongs to a different Amazon Web Services account.

      struct RealtimeLogConfigOwnerMismatch
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of real-time log configurations.

      struct RealtimeLogConfigs
        include JSON::Serializable

        # A flag that indicates whether there are more real-time log configurations than are contained in this
        # list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # This parameter indicates where this list of real-time log configurations begins. This list includes
        # real-time log configurations that occur after the marker.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of real-time log configurations requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # Contains the list of real-time log configurations.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::RealtimeLogConfig)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing
        # real-time log configurations where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @items : Array(Types::RealtimeLogConfig)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A subscription configuration for additional CloudWatch metrics.

      struct RealtimeMetricsSubscriptionConfig
        include JSON::Serializable

        # A flag that indicates whether additional CloudWatch metrics are enabled for a given CloudFront
        # distribution.

        @[JSON::Field(key: "RealtimeMetricsSubscriptionStatus")]
        getter realtime_metrics_subscription_status : String

        def initialize(
          @realtime_metrics_subscription_status : String
        )
        end
      end

      # Cannot delete this resource because it is in use.

      struct ResourceInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified CloudFront resource hasn't been disabled yet.

      struct ResourceNotDisabled
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A response headers policy. A response headers policy contains information about a set of HTTP
      # response headers. After you create a response headers policy, you can use its ID to attach it to one
      # or more cache behaviors in a CloudFront distribution. When it's attached to a cache behavior, the
      # response headers policy affects the HTTP headers that CloudFront includes in HTTP responses to
      # requests that match the cache behavior. CloudFront adds or removes response headers according to the
      # configuration of the response headers policy. For more information, see Adding or removing HTTP
      # headers in CloudFront responses in the Amazon CloudFront Developer Guide .

      struct ResponseHeadersPolicy
        include JSON::Serializable

        # The identifier for the response headers policy.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the response headers policy was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # A response headers policy configuration.

        @[JSON::Field(key: "ResponseHeadersPolicyConfig")]
        getter response_headers_policy_config : Types::ResponseHeadersPolicyConfig

        def initialize(
          @id : String,
          @last_modified_time : Time,
          @response_headers_policy_config : Types::ResponseHeadersPolicyConfig
        )
        end
      end

      # A list of HTTP header names that CloudFront includes as values for the Access-Control-Allow-Headers
      # HTTP response header. For more information about the Access-Control-Allow-Headers HTTP response
      # header, see Access-Control-Allow-Headers in the MDN Web Docs.

      struct ResponseHeadersPolicyAccessControlAllowHeaders
        include JSON::Serializable

        # The list of HTTP header names. You can specify * to allow all headers.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of HTTP header names in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(String),
          @quantity : Int32
        )
        end
      end

      # A list of HTTP methods that CloudFront includes as values for the Access-Control-Allow-Methods HTTP
      # response header. For more information about the Access-Control-Allow-Methods HTTP response header,
      # see Access-Control-Allow-Methods in the MDN Web Docs.

      struct ResponseHeadersPolicyAccessControlAllowMethods
        include JSON::Serializable

        # The list of HTTP methods. Valid values are: GET DELETE HEAD OPTIONS PATCH POST PUT ALL ALL is a
        # special value that includes all of the listed HTTP methods.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of HTTP methods in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(String),
          @quantity : Int32
        )
        end
      end

      # A list of origins (domain names) that CloudFront can use as the value for the
      # Access-Control-Allow-Origin HTTP response header. For more information about the
      # Access-Control-Allow-Origin HTTP response header, see Access-Control-Allow-Origin in the MDN Web
      # Docs.

      struct ResponseHeadersPolicyAccessControlAllowOrigins
        include JSON::Serializable

        # The list of origins (domain names). You can specify * to allow all origins.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # The number of origins in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(String),
          @quantity : Int32
        )
        end
      end

      # A list of HTTP headers that CloudFront includes as values for the Access-Control-Expose-Headers HTTP
      # response header. For more information about the Access-Control-Expose-Headers HTTP response header,
      # see Access-Control-Expose-Headers in the MDN Web Docs.

      struct ResponseHeadersPolicyAccessControlExposeHeaders
        include JSON::Serializable

        # The number of HTTP headers in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The list of HTTP headers. You can specify * to expose all headers.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # A response headers policy with this name already exists. You must provide a unique name. To modify
      # an existing response headers policy, use UpdateResponseHeadersPolicy .

      struct ResponseHeadersPolicyAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A response headers policy configuration. A response headers policy configuration contains metadata
      # about the response headers policy, and configurations for sets of HTTP response headers.

      struct ResponseHeadersPolicyConfig
        include JSON::Serializable

        # A name to identify the response headers policy. The name must be unique for response headers
        # policies in this Amazon Web Services account.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A comment to describe the response headers policy. The comment cannot be longer than 128 characters.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # A configuration for a set of HTTP response headers that are used for cross-origin resource sharing
        # (CORS).

        @[JSON::Field(key: "CorsConfig")]
        getter cors_config : Types::ResponseHeadersPolicyCorsConfig?

        # A configuration for a set of custom HTTP response headers.

        @[JSON::Field(key: "CustomHeadersConfig")]
        getter custom_headers_config : Types::ResponseHeadersPolicyCustomHeadersConfig?

        # A configuration for a set of HTTP headers to remove from the HTTP response.

        @[JSON::Field(key: "RemoveHeadersConfig")]
        getter remove_headers_config : Types::ResponseHeadersPolicyRemoveHeadersConfig?

        # A configuration for a set of security-related HTTP response headers.

        @[JSON::Field(key: "SecurityHeadersConfig")]
        getter security_headers_config : Types::ResponseHeadersPolicySecurityHeadersConfig?

        # A configuration for enabling the Server-Timing header in HTTP responses sent from CloudFront.

        @[JSON::Field(key: "ServerTimingHeadersConfig")]
        getter server_timing_headers_config : Types::ResponseHeadersPolicyServerTimingHeadersConfig?

        def initialize(
          @name : String,
          @comment : String? = nil,
          @cors_config : Types::ResponseHeadersPolicyCorsConfig? = nil,
          @custom_headers_config : Types::ResponseHeadersPolicyCustomHeadersConfig? = nil,
          @remove_headers_config : Types::ResponseHeadersPolicyRemoveHeadersConfig? = nil,
          @security_headers_config : Types::ResponseHeadersPolicySecurityHeadersConfig? = nil,
          @server_timing_headers_config : Types::ResponseHeadersPolicyServerTimingHeadersConfig? = nil
        )
        end
      end

      # The policy directives and their values that CloudFront includes as values for the
      # Content-Security-Policy HTTP response header. For more information about the Content-Security-Policy
      # HTTP response header, see Content-Security-Policy in the MDN Web Docs.

      struct ResponseHeadersPolicyContentSecurityPolicy
        include JSON::Serializable

        # The policy directives and their values that CloudFront includes as values for the
        # Content-Security-Policy HTTP response header.

        @[JSON::Field(key: "ContentSecurityPolicy")]
        getter content_security_policy : String

        # A Boolean that determines whether CloudFront overrides the Content-Security-Policy HTTP response
        # header received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        def initialize(
          @content_security_policy : String,
          @override : Bool
        )
        end
      end

      # Determines whether CloudFront includes the X-Content-Type-Options HTTP response header with its
      # value set to nosniff . For more information about the X-Content-Type-Options HTTP response header,
      # see X-Content-Type-Options in the MDN Web Docs.

      struct ResponseHeadersPolicyContentTypeOptions
        include JSON::Serializable

        # A Boolean that determines whether CloudFront overrides the X-Content-Type-Options HTTP response
        # header received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        def initialize(
          @override : Bool
        )
        end
      end

      # A configuration for a set of HTTP response headers that are used for cross-origin resource sharing
      # (CORS). CloudFront adds these headers to HTTP responses that it sends for CORS requests that match a
      # cache behavior associated with this response headers policy. For more information about CORS, see
      # Cross-Origin Resource Sharing (CORS) in the MDN Web Docs.

      struct ResponseHeadersPolicyCorsConfig
        include JSON::Serializable

        # A Boolean that CloudFront uses as the value for the Access-Control-Allow-Credentials HTTP response
        # header. For more information about the Access-Control-Allow-Credentials HTTP response header, see
        # Access-Control-Allow-Credentials in the MDN Web Docs.

        @[JSON::Field(key: "AccessControlAllowCredentials")]
        getter access_control_allow_credentials : Bool

        # A list of HTTP header names that CloudFront includes as values for the Access-Control-Allow-Headers
        # HTTP response header. For more information about the Access-Control-Allow-Headers HTTP response
        # header, see Access-Control-Allow-Headers in the MDN Web Docs.

        @[JSON::Field(key: "AccessControlAllowHeaders")]
        getter access_control_allow_headers : Types::ResponseHeadersPolicyAccessControlAllowHeaders

        # A list of HTTP methods that CloudFront includes as values for the Access-Control-Allow-Methods HTTP
        # response header. For more information about the Access-Control-Allow-Methods HTTP response header,
        # see Access-Control-Allow-Methods in the MDN Web Docs.

        @[JSON::Field(key: "AccessControlAllowMethods")]
        getter access_control_allow_methods : Types::ResponseHeadersPolicyAccessControlAllowMethods

        # A list of origins (domain names) that CloudFront can use as the value for the
        # Access-Control-Allow-Origin HTTP response header. For more information about the
        # Access-Control-Allow-Origin HTTP response header, see Access-Control-Allow-Origin in the MDN Web
        # Docs.

        @[JSON::Field(key: "AccessControlAllowOrigins")]
        getter access_control_allow_origins : Types::ResponseHeadersPolicyAccessControlAllowOrigins

        # A Boolean that determines whether CloudFront overrides HTTP response headers received from the
        # origin with the ones specified in this response headers policy.

        @[JSON::Field(key: "OriginOverride")]
        getter origin_override : Bool

        # A list of HTTP headers that CloudFront includes as values for the Access-Control-Expose-Headers HTTP
        # response header. For more information about the Access-Control-Expose-Headers HTTP response header,
        # see Access-Control-Expose-Headers in the MDN Web Docs.

        @[JSON::Field(key: "AccessControlExposeHeaders")]
        getter access_control_expose_headers : Types::ResponseHeadersPolicyAccessControlExposeHeaders?

        # A number that CloudFront uses as the value for the Access-Control-Max-Age HTTP response header. For
        # more information about the Access-Control-Max-Age HTTP response header, see Access-Control-Max-Age
        # in the MDN Web Docs.

        @[JSON::Field(key: "AccessControlMaxAgeSec")]
        getter access_control_max_age_sec : Int32?

        def initialize(
          @access_control_allow_credentials : Bool,
          @access_control_allow_headers : Types::ResponseHeadersPolicyAccessControlAllowHeaders,
          @access_control_allow_methods : Types::ResponseHeadersPolicyAccessControlAllowMethods,
          @access_control_allow_origins : Types::ResponseHeadersPolicyAccessControlAllowOrigins,
          @origin_override : Bool,
          @access_control_expose_headers : Types::ResponseHeadersPolicyAccessControlExposeHeaders? = nil,
          @access_control_max_age_sec : Int32? = nil
        )
        end
      end

      # An HTTP response header name and its value. CloudFront includes this header in HTTP responses that
      # it sends for requests that match a cache behavior that's associated with this response headers
      # policy.

      struct ResponseHeadersPolicyCustomHeader
        include JSON::Serializable

        # The HTTP response header name.

        @[JSON::Field(key: "Header")]
        getter header : String

        # A Boolean that determines whether CloudFront overrides a response header with the same name received
        # from the origin with the header specified here.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        # The value for the HTTP response header.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @header : String,
          @override : Bool,
          @value : String
        )
        end
      end

      # A list of HTTP response header names and their values. CloudFront includes these headers in HTTP
      # responses that it sends for requests that match a cache behavior that's associated with this
      # response headers policy.

      struct ResponseHeadersPolicyCustomHeadersConfig
        include JSON::Serializable

        # The number of HTTP response headers in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The list of HTTP response headers and their values.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ResponseHeadersPolicyCustomHeader)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::ResponseHeadersPolicyCustomHeader)? = nil
        )
        end
      end

      # Determines whether CloudFront includes the X-Frame-Options HTTP response header and the header's
      # value. For more information about the X-Frame-Options HTTP response header, see X-Frame-Options in
      # the MDN Web Docs.

      struct ResponseHeadersPolicyFrameOptions
        include JSON::Serializable

        # The value of the X-Frame-Options HTTP response header. Valid values are DENY and SAMEORIGIN . For
        # more information about these values, see X-Frame-Options in the MDN Web Docs.

        @[JSON::Field(key: "FrameOption")]
        getter frame_option : String

        # A Boolean that determines whether CloudFront overrides the X-Frame-Options HTTP response header
        # received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        def initialize(
          @frame_option : String,
          @override : Bool
        )
        end
      end

      # Cannot delete the response headers policy because it is attached to one or more cache behaviors in a
      # CloudFront distribution.

      struct ResponseHeadersPolicyInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of response headers policies.

      struct ResponseHeadersPolicyList
        include JSON::Serializable

        # The maximum number of response headers policies requested.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of response headers policies returned.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The response headers policies in the list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ResponseHeadersPolicySummary)?

        # If there are more items in the list than are in this response, this element is present. It contains
        # the value that you should use in the Marker field of a subsequent request to continue listing
        # response headers policies where you left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::ResponseHeadersPolicySummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # Determines whether CloudFront includes the Referrer-Policy HTTP response header and the header's
      # value. For more information about the Referrer-Policy HTTP response header, see Referrer-Policy in
      # the MDN Web Docs.

      struct ResponseHeadersPolicyReferrerPolicy
        include JSON::Serializable

        # A Boolean that determines whether CloudFront overrides the Referrer-Policy HTTP response header
        # received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        # The value of the Referrer-Policy HTTP response header. Valid values are: no-referrer
        # no-referrer-when-downgrade origin origin-when-cross-origin same-origin strict-origin
        # strict-origin-when-cross-origin unsafe-url For more information about these values, see
        # Referrer-Policy in the MDN Web Docs.

        @[JSON::Field(key: "ReferrerPolicy")]
        getter referrer_policy : String

        def initialize(
          @override : Bool,
          @referrer_policy : String
        )
        end
      end

      # The name of an HTTP header that CloudFront removes from HTTP responses to requests that match the
      # cache behavior that this response headers policy is attached to.

      struct ResponseHeadersPolicyRemoveHeader
        include JSON::Serializable

        # The HTTP header name.

        @[JSON::Field(key: "Header")]
        getter header : String

        def initialize(
          @header : String
        )
        end
      end

      # A list of HTTP header names that CloudFront removes from HTTP responses to requests that match the
      # cache behavior that this response headers policy is attached to.

      struct ResponseHeadersPolicyRemoveHeadersConfig
        include JSON::Serializable

        # The number of HTTP header names in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The list of HTTP header names.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ResponseHeadersPolicyRemoveHeader)?

        def initialize(
          @quantity : Int32,
          @items : Array(Types::ResponseHeadersPolicyRemoveHeader)? = nil
        )
        end
      end

      # A configuration for a set of security-related HTTP response headers. CloudFront adds these headers
      # to HTTP responses that it sends for requests that match a cache behavior associated with this
      # response headers policy.

      struct ResponseHeadersPolicySecurityHeadersConfig
        include JSON::Serializable

        # The policy directives and their values that CloudFront includes as values for the
        # Content-Security-Policy HTTP response header. For more information about the Content-Security-Policy
        # HTTP response header, see Content-Security-Policy in the MDN Web Docs.

        @[JSON::Field(key: "ContentSecurityPolicy")]
        getter content_security_policy : Types::ResponseHeadersPolicyContentSecurityPolicy?

        # Determines whether CloudFront includes the X-Content-Type-Options HTTP response header with its
        # value set to nosniff . For more information about the X-Content-Type-Options HTTP response header,
        # see X-Content-Type-Options in the MDN Web Docs.

        @[JSON::Field(key: "ContentTypeOptions")]
        getter content_type_options : Types::ResponseHeadersPolicyContentTypeOptions?

        # Determines whether CloudFront includes the X-Frame-Options HTTP response header and the header's
        # value. For more information about the X-Frame-Options HTTP response header, see X-Frame-Options in
        # the MDN Web Docs.

        @[JSON::Field(key: "FrameOptions")]
        getter frame_options : Types::ResponseHeadersPolicyFrameOptions?

        # Determines whether CloudFront includes the Referrer-Policy HTTP response header and the header's
        # value. For more information about the Referrer-Policy HTTP response header, see Referrer-Policy in
        # the MDN Web Docs.

        @[JSON::Field(key: "ReferrerPolicy")]
        getter referrer_policy : Types::ResponseHeadersPolicyReferrerPolicy?

        # Determines whether CloudFront includes the Strict-Transport-Security HTTP response header and the
        # header's value. For more information about the Strict-Transport-Security HTTP response header, see
        # Security headers in the Amazon CloudFront Developer Guide and Strict-Transport-Security in the MDN
        # Web Docs.

        @[JSON::Field(key: "StrictTransportSecurity")]
        getter strict_transport_security : Types::ResponseHeadersPolicyStrictTransportSecurity?

        # Determines whether CloudFront includes the X-XSS-Protection HTTP response header and the header's
        # value. For more information about the X-XSS-Protection HTTP response header, see X-XSS-Protection in
        # the MDN Web Docs.

        @[JSON::Field(key: "XSSProtection")]
        getter xss_protection : Types::ResponseHeadersPolicyXSSProtection?

        def initialize(
          @content_security_policy : Types::ResponseHeadersPolicyContentSecurityPolicy? = nil,
          @content_type_options : Types::ResponseHeadersPolicyContentTypeOptions? = nil,
          @frame_options : Types::ResponseHeadersPolicyFrameOptions? = nil,
          @referrer_policy : Types::ResponseHeadersPolicyReferrerPolicy? = nil,
          @strict_transport_security : Types::ResponseHeadersPolicyStrictTransportSecurity? = nil,
          @xss_protection : Types::ResponseHeadersPolicyXSSProtection? = nil
        )
        end
      end

      # A configuration for enabling the Server-Timing header in HTTP responses sent from CloudFront.
      # CloudFront adds this header to HTTP responses that it sends in response to requests that match a
      # cache behavior that's associated with this response headers policy. You can use the Server-Timing
      # header to view metrics that can help you gain insights about the behavior and performance of
      # CloudFront. For example, you can see which cache layer served a cache hit, or the first byte latency
      # from the origin when there was a cache miss. You can use the metrics in the Server-Timing header to
      # troubleshoot issues or test the efficiency of your CloudFront configuration. For more information,
      # see Server-Timing header in the Amazon CloudFront Developer Guide .

      struct ResponseHeadersPolicyServerTimingHeadersConfig
        include JSON::Serializable

        # A Boolean that determines whether CloudFront adds the Server-Timing header to HTTP responses that it
        # sends in response to requests that match a cache behavior that's associated with this response
        # headers policy.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # A number 0–100 (inclusive) that specifies the percentage of responses that you want CloudFront to
        # add the Server-Timing header to. When you set the sampling rate to 100, CloudFront adds the
        # Server-Timing header to the HTTP response for every request that matches the cache behavior that
        # this response headers policy is attached to. When you set it to 50, CloudFront adds the header to
        # 50% of the responses for requests that match the cache behavior. You can set the sampling rate to
        # any number 0–100 with up to four decimal places.

        @[JSON::Field(key: "SamplingRate")]
        getter sampling_rate : Float64?

        def initialize(
          @enabled : Bool,
          @sampling_rate : Float64? = nil
        )
        end
      end

      # Determines whether CloudFront includes the Strict-Transport-Security HTTP response header and the
      # header's value. For more information about the Strict-Transport-Security HTTP response header, see
      # Strict-Transport-Security in the MDN Web Docs.

      struct ResponseHeadersPolicyStrictTransportSecurity
        include JSON::Serializable

        # A number that CloudFront uses as the value for the max-age directive in the
        # Strict-Transport-Security HTTP response header.

        @[JSON::Field(key: "AccessControlMaxAgeSec")]
        getter access_control_max_age_sec : Int32

        # A Boolean that determines whether CloudFront overrides the Strict-Transport-Security HTTP response
        # header received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        # A Boolean that determines whether CloudFront includes the includeSubDomains directive in the
        # Strict-Transport-Security HTTP response header.

        @[JSON::Field(key: "IncludeSubdomains")]
        getter include_subdomains : Bool?

        # A Boolean that determines whether CloudFront includes the preload directive in the
        # Strict-Transport-Security HTTP response header.

        @[JSON::Field(key: "Preload")]
        getter preload : Bool?

        def initialize(
          @access_control_max_age_sec : Int32,
          @override : Bool,
          @include_subdomains : Bool? = nil,
          @preload : Bool? = nil
        )
        end
      end

      # Contains a response headers policy.

      struct ResponseHeadersPolicySummary
        include JSON::Serializable

        # The response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicy")]
        getter response_headers_policy : Types::ResponseHeadersPolicy

        # The type of response headers policy, either managed (created by Amazon Web Services) or custom
        # (created in this Amazon Web Services account).

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @response_headers_policy : Types::ResponseHeadersPolicy,
          @type : String
        )
        end
      end

      # Determines whether CloudFront includes the X-XSS-Protection HTTP response header and the header's
      # value. For more information about the X-XSS-Protection HTTP response header, see X-XSS-Protection in
      # the MDN Web Docs.

      struct ResponseHeadersPolicyXSSProtection
        include JSON::Serializable

        # A Boolean that determines whether CloudFront overrides the X-XSS-Protection HTTP response header
        # received from the origin with the one specified in this response headers policy.

        @[JSON::Field(key: "Override")]
        getter override : Bool

        # A Boolean that determines the value of the X-XSS-Protection HTTP response header. When this setting
        # is true , the value of the X-XSS-Protection header is 1 . When this setting is false , the value of
        # the X-XSS-Protection header is 0 . For more information about these settings, see X-XSS-Protection
        # in the MDN Web Docs.

        @[JSON::Field(key: "Protection")]
        getter protection : Bool

        # A Boolean that determines whether CloudFront includes the mode=block directive in the
        # X-XSS-Protection header. For more information about this directive, see X-XSS-Protection in the MDN
        # Web Docs.

        @[JSON::Field(key: "ModeBlock")]
        getter mode_block : Bool?

        # A reporting URI, which CloudFront uses as the value of the report directive in the X-XSS-Protection
        # header. You cannot specify a ReportUri when ModeBlock is true . For more information about using a
        # reporting URL, see X-XSS-Protection in the MDN Web Docs.

        @[JSON::Field(key: "ReportUri")]
        getter report_uri : String?

        def initialize(
          @override : Bool,
          @protection : Bool,
          @mode_block : Bool? = nil,
          @report_uri : String? = nil
        )
        end
      end

      # A complex type that identifies ways in which you want to restrict distribution of your content.

      struct Restrictions
        include JSON::Serializable

        # A complex type that controls the countries in which your content is distributed. CloudFront
        # determines the location of your users using MaxMind GeoIP databases.

        @[JSON::Field(key: "GeoRestriction")]
        getter geo_restriction : Types::GeoRestriction

        def initialize(
          @geo_restriction : Types::GeoRestriction
        )
        end
      end

      # A complex type that contains information about the Amazon S3 bucket from which you want CloudFront
      # to get your media files for distribution.

      struct S3Origin
        include JSON::Serializable

        # The DNS name of the Amazon S3 origin.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The CloudFront origin access identity to associate with the distribution. Use an origin access
        # identity to configure the distribution so that end users can only access objects in an Amazon S3
        # bucket through CloudFront. If you want end users to be able to access objects using either the
        # CloudFront URL or the Amazon S3 URL, specify an empty OriginAccessIdentity element. To delete the
        # origin access identity from an existing distribution, update the distribution configuration and
        # include an empty OriginAccessIdentity element. To replace the origin access identity, update the
        # distribution configuration and specify the new origin access identity. For more information, see
        # Using an Origin Access Identity to Restrict Access to Your Amazon S3 Content in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "OriginAccessIdentity")]
        getter origin_access_identity : String

        def initialize(
          @domain_name : String,
          @origin_access_identity : String
        )
        end
      end

      # A complex type that contains information about the Amazon S3 origin. If the origin is a custom
      # origin or an S3 bucket that is configured as a website endpoint, use the CustomOriginConfig element
      # instead.

      struct S3OriginConfig
        include JSON::Serializable

        # If you're using origin access control (OAC) instead of origin access identity, specify an empty
        # OriginAccessIdentity element. For more information, see Restricting access to an Amazon Web Services
        # in the Amazon CloudFront Developer Guide . The CloudFront origin access identity to associate with
        # the origin. Use an origin access identity to configure the origin so that viewers can only access
        # objects in an Amazon S3 bucket through CloudFront. The format of the value is:
        # origin-access-identity/cloudfront/ID-of-origin-access-identity The ID-of-origin-access-identity is
        # the value that CloudFront returned in the ID element when you created the origin access identity. If
        # you want viewers to be able to access objects using either the CloudFront URL or the Amazon S3 URL,
        # specify an empty OriginAccessIdentity element. To delete the origin access identity from an existing
        # distribution, update the distribution configuration and include an empty OriginAccessIdentity
        # element. To replace the origin access identity, update the distribution configuration and specify
        # the new origin access identity. For more information about the origin access identity, see Serving
        # Private Content through CloudFront in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginAccessIdentity")]
        getter origin_access_identity : String

        # Specifies how long, in seconds, CloudFront waits for a response from the origin. This is also known
        # as the origin response timeout . The minimum timeout is 1 second, the maximum is 120 seconds, and
        # the default (if you don't specify otherwise) is 30 seconds. For more information, see Response
        # timeout in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginReadTimeout")]
        getter origin_read_timeout : Int32?

        def initialize(
          @origin_access_identity : String,
          @origin_read_timeout : Int32? = nil
        )
        end
      end

      # Session stickiness provides the ability to define multiple requests from a single viewer as a single
      # session. This prevents the potentially inconsistent experience of sending some of a given user's
      # requests to your staging distribution, while others are sent to your primary distribution. Define
      # the session duration using TTL values.

      struct SessionStickinessConfig
        include JSON::Serializable

        # The amount of time after which you want sessions to cease if no requests are received. Allowed
        # values are 300–3600 seconds (5–60 minutes). The value must be less than or equal to MaximumTTL .

        @[JSON::Field(key: "IdleTTL")]
        getter idle_ttl : Int32

        # The maximum amount of time to consider requests from the viewer as being part of the same session.
        # Allowed values are 300–3600 seconds (5–60 minutes). The value must be greater than or equal to
        # IdleTTL .

        @[JSON::Field(key: "MaximumTTL")]
        getter maximum_ttl : Int32

        def initialize(
          @idle_ttl : Int32,
          @maximum_ttl : Int32
        )
        end
      end

      # A list of Amazon Web Services accounts and the active CloudFront key pairs in each account that
      # CloudFront can use to verify the signatures of signed URLs and signed cookies.

      struct Signer
        include JSON::Serializable

        # An Amazon Web Services account number that contains active CloudFront key pairs that CloudFront can
        # use to verify the signatures of signed URLs and signed cookies. If the Amazon Web Services account
        # that owns the key pairs is the same account that owns the CloudFront distribution, the value of this
        # field is self .

        @[JSON::Field(key: "AwsAccountNumber")]
        getter aws_account_number : String?

        # A list of CloudFront key pair identifiers.

        @[JSON::Field(key: "KeyPairIds")]
        getter key_pair_ids : Types::KeyPairIds?

        def initialize(
          @aws_account_number : String? = nil,
          @key_pair_ids : Types::KeyPairIds? = nil
        )
        end
      end

      # The CloudFront domain name of the staging distribution.

      struct StagingDistributionDnsNames
        include JSON::Serializable

        # The number of CloudFront domain names in your staging distribution.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The CloudFront domain name of the staging distribution.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # A continuous deployment policy for this staging distribution already exists.

      struct StagingDistributionInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex data type for the status codes that you specify that, when returned by a primary origin,
      # trigger CloudFront to failover to a second origin.

      struct StatusCodes
        include JSON::Serializable

        # The items (status codes) for an origin group.

        @[JSON::Field(key: "Items")]
        getter items : Array(Int32)

        # The number of status codes.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        def initialize(
          @items : Array(Int32),
          @quantity : Int32
        )
        end
      end

      # A streaming distribution tells CloudFront where you want RTMP content to be delivered from, and the
      # details about how to track and manage content delivery.

      struct StreamingDistribution
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the distribution. For example:
        # arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5 , where 123456789012 is your Amazon
        # Web Services account ID.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # A complex type that lists the Amazon Web Services accounts, if any, that you included in the
        # TrustedSigners complex type for this distribution. These are the accounts that you want to allow to
        # create signed URLs for private content. The Signer complex type lists the Amazon Web Services
        # account number of the trusted signer or self if the signer is the Amazon Web Services account that
        # created the distribution. The Signer element also includes the IDs of any active CloudFront key
        # pairs that are associated with the trusted signer's Amazon Web Services account. If no KeyPairId
        # element appears for a Signer , that signer can't create signed URLs. For more information, see
        # Serving Private Content through CloudFront in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "ActiveTrustedSigners")]
        getter active_trusted_signers : Types::ActiveTrustedSigners

        # The domain name that corresponds to the streaming distribution, for example,
        # s5c39gqb8ow64r.cloudfront.net .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The identifier for the RTMP distribution. For example: EGTXBD79EXAMPLE .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current status of the RTMP distribution. When the status is Deployed , the distribution's
        # information is propagated to all CloudFront edge locations.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The current configuration information for the RTMP distribution.

        @[JSON::Field(key: "StreamingDistributionConfig")]
        getter streaming_distribution_config : Types::StreamingDistributionConfig

        # The date and time that the distribution was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        def initialize(
          @arn : String,
          @active_trusted_signers : Types::ActiveTrustedSigners,
          @domain_name : String,
          @id : String,
          @status : String,
          @streaming_distribution_config : Types::StreamingDistributionConfig,
          @last_modified_time : Time? = nil
        )
        end
      end

      # The caller reference you attempted to create the streaming distribution with is associated with
      # another distribution

      struct StreamingDistributionAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The RTMP distribution's configuration information.

      struct StreamingDistributionConfig
        include JSON::Serializable

        # A unique value (for example, a date-time stamp) that ensures that the request can't be replayed. If
        # the value of CallerReference is new (regardless of the content of the StreamingDistributionConfig
        # object), CloudFront creates a new distribution. If CallerReference is a value that you already sent
        # in a previous request to create a distribution, CloudFront returns a DistributionAlreadyExists
        # error.

        @[JSON::Field(key: "CallerReference")]
        getter caller_reference : String

        # Any comments you want to include about the streaming distribution.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # Whether the streaming distribution is enabled to accept user requests for content.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # A complex type that contains information about the Amazon S3 bucket from which you want CloudFront
        # to get your media files for distribution.

        @[JSON::Field(key: "S3Origin")]
        getter s3_origin : Types::S3Origin

        # A complex type that specifies any Amazon Web Services accounts that you want to permit to create
        # signed URLs for private content. If you want the distribution to use signed URLs, include this
        # element; if you want the distribution to use public URLs, remove this element. For more information,
        # see Serving Private Content through CloudFront in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedSigners")]
        getter trusted_signers : Types::TrustedSigners

        # A complex type that contains information about CNAMEs (alternate domain names), if any, for this
        # streaming distribution.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Types::Aliases?

        # A complex type that controls whether access logs are written for the streaming distribution.

        @[JSON::Field(key: "Logging")]
        getter logging : Types::StreamingLoggingConfig?

        # A complex type that contains information about price class for this streaming distribution.

        @[JSON::Field(key: "PriceClass")]
        getter price_class : String?

        def initialize(
          @caller_reference : String,
          @comment : String,
          @enabled : Bool,
          @s3_origin : Types::S3Origin,
          @trusted_signers : Types::TrustedSigners,
          @aliases : Types::Aliases? = nil,
          @logging : Types::StreamingLoggingConfig? = nil,
          @price_class : String? = nil
        )
        end
      end

      # A streaming distribution Configuration and a list of tags to be associated with the streaming
      # distribution.

      struct StreamingDistributionConfigWithTags
        include JSON::Serializable

        # A streaming distribution Configuration.

        @[JSON::Field(key: "StreamingDistributionConfig")]
        getter streaming_distribution_config : Types::StreamingDistributionConfig

        # A complex type that contains zero or more Tag elements.

        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags

        def initialize(
          @streaming_distribution_config : Types::StreamingDistributionConfig,
          @tags : Types::Tags
        )
        end
      end

      # A streaming distribution list.

      struct StreamingDistributionList
        include JSON::Serializable

        # A flag that indicates whether more streaming distributions remain to be listed. If your results were
        # truncated, you can make a follow-up pagination request using the Marker request parameter to
        # retrieve more distributions in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The value you provided for the Marker request parameter.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The value you provided for the MaxItems request parameter.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of streaming distributions that were created by the current Amazon Web Services account.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A complex type that contains one StreamingDistributionSummary element for each distribution that was
        # created by the current Amazon Web Services account.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::StreamingDistributionSummary)?

        # If IsTruncated is true , this element is present and contains the value you can use for the Marker
        # request parameter to continue listing your RTMP distributions where they left off.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::StreamingDistributionSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The specified CloudFront distribution is not disabled. You must disable the distribution before you
      # can delete it.

      struct StreamingDistributionNotDisabled
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of the information for a CloudFront streaming distribution.

      struct StreamingDistributionSummary
        include JSON::Serializable

        # The ARN (Amazon Resource Name) for the streaming distribution. For example:
        # arn:aws:cloudfront::123456789012:streaming-distribution/EDFDVBD632BHDS5 , where 123456789012 is your
        # Amazon Web Services account ID.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # A complex type that contains information about CNAMEs (alternate domain names), if any, for this
        # streaming distribution.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Types::Aliases

        # The comment originally specified when this distribution was created.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The domain name corresponding to the distribution, for example, d111111abcdef8.cloudfront.net .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether the distribution is enabled to accept end user requests for content.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The identifier for the distribution, for example, EDFDVBD632BHDS5 .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time the distribution was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # A complex type that contains information about price class for this streaming distribution.

        @[JSON::Field(key: "PriceClass")]
        getter price_class : String

        # A complex type that contains information about the Amazon S3 bucket from which you want CloudFront
        # to get your media files for distribution.

        @[JSON::Field(key: "S3Origin")]
        getter s3_origin : Types::S3Origin

        # Indicates the current status of the distribution. When the status is Deployed , the distribution's
        # information is fully propagated throughout the Amazon CloudFront system.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A complex type that specifies the Amazon Web Services accounts, if any, that you want to allow to
        # create signed URLs for private content. If you want to require signed URLs in requests for objects
        # in the target origin that match the PathPattern for this cache behavior, specify true for Enabled ,
        # and specify the applicable values for Quantity and Items .If you don't want to require signed URLs
        # in requests for objects that match PathPattern , specify false for Enabled and 0 for Quantity . Omit
        # Items . To add, change, or remove one or more trusted signers, change Enabled to true (if it's
        # currently false ), change Quantity as applicable, and specify all of the trusted signers that you
        # want to include in the updated distribution. For more information, see Serving Private Content
        # through CloudFront in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "TrustedSigners")]
        getter trusted_signers : Types::TrustedSigners

        def initialize(
          @arn : String,
          @aliases : Types::Aliases,
          @comment : String,
          @domain_name : String,
          @enabled : Bool,
          @id : String,
          @last_modified_time : Time,
          @price_class : String,
          @s3_origin : Types::S3Origin,
          @status : String,
          @trusted_signers : Types::TrustedSigners
        )
        end
      end

      # A complex type that controls whether access logs are written for this streaming distribution.

      struct StreamingLoggingConfig
        include JSON::Serializable

        # The Amazon S3 bucket to store the access logs in, for example, amzn-s3-demo-bucket.s3.amazonaws.com
        # .

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specifies whether you want CloudFront to save access logs to an Amazon S3 bucket. If you don't want
        # to enable logging when you create a streaming distribution or if you want to disable logging for an
        # existing streaming distribution, specify false for Enabled , and specify empty Bucket and Prefix
        # elements. If you specify false for Enabled but you specify values for Bucket and Prefix , the values
        # are automatically deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # An optional string that you want CloudFront to prefix to the access log filenames for this streaming
        # distribution, for example, myprefix/ . If you want to enable logging, but you don't want to specify
        # a prefix, you still must include an empty Prefix element in the Logging element.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String

        def initialize(
          @bucket : String,
          @enabled : Bool,
          @prefix : String
        )
        end
      end

      # The configuration for a string schema.

      struct StringSchemaConfig
        include JSON::Serializable

        # Whether the defined parameter is required.

        @[JSON::Field(key: "Required")]
        getter required : Bool

        # A comment to describe the parameter.

        @[JSON::Field(key: "Comment")]
        getter comment : String?

        # The default value of the parameter.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        def initialize(
          @required : Bool,
          @comment : String? = nil,
          @default_value : String? = nil
        )
        end
      end

      # A complex type that contains Tag key and Tag value.

      struct Tag
        include JSON::Serializable

        # A string that contains Tag key. The string length should be between 1 and 128 characters. Valid
        # characters include a-z , A-Z , 0-9 , space, and the special characters _ - . : / = + @ .

        @[JSON::Field(key: "Key")]
        getter key : String

        # A string that contains an optional Tag value. The string length should be between 0 and 256
        # characters. Valid characters include a-z , A-Z , 0-9 , space, and the special characters _ - . : / =
        # + @ .

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # A complex type that contains zero or more Tag elements.

      struct TagKeys
        include JSON::Serializable

        # A complex type that contains Tag key elements.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @items : Array(String)? = nil
        )
        end
      end

      # The request to add tags to a CloudFront resource.

      struct TagResourceRequest
        include JSON::Serializable

        # An ARN of a CloudFront resource.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        # A complex type that contains zero or more Tag elements.

        @[JSON::Field(key: "Tags")]
        getter tags : Types::Tags

        def initialize(
          @resource : String,
          @tags : Types::Tags
        )
        end
      end

      # A complex type that contains zero or more Tag elements.

      struct Tags
        include JSON::Serializable

        # A complex type that contains Tag elements.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Tag)?

        def initialize(
          @items : Array(Types::Tag)? = nil
        )
        end
      end

      # This field only supports multi-tenant distributions. You can't specify this field for standard
      # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
      # in the Amazon CloudFront Developer Guide . The configuration for a distribution tenant.

      struct TenantConfig
        include JSON::Serializable

        # The parameters that you specify for a distribution tenant.

        @[JSON::Field(key: "ParameterDefinitions")]
        getter parameter_definitions : Array(Types::ParameterDefinition)?

        def initialize(
          @parameter_definitions : Array(Types::ParameterDefinition)? = nil
        )
        end
      end


      struct TestConnectionFunctionRequest
        include JSON::Serializable

        # The connection object.

        @[JSON::Field(key: "ConnectionObject")]
        getter connection_object : Bytes

        # The connection function ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the connection function.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The connection function stage.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @connection_object : Bytes,
          @id : String,
          @if_match : String,
          @stage : String? = nil
        )
        end
      end


      struct TestConnectionFunctionResult
        include JSON::Serializable

        # The connection function test result.

        @[JSON::Field(key: "ConnectionFunctionTestResult")]
        getter connection_function_test_result : Types::ConnectionFunctionTestResult?

        def initialize(
          @connection_function_test_result : Types::ConnectionFunctionTestResult? = nil
        )
        end
      end

      # The CloudFront function failed.

      struct TestFunctionFailed
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TestFunctionRequest
        include JSON::Serializable

        # The event object to test the function with. For more information about the structure of the event
        # object, see Testing functions in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "EventObject")]
        getter event_object : Bytes

        # The current version ( ETag value) of the function that you are testing, which you can get using
        # DescribeFunction .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the function that you are testing.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The stage of the function that you are testing, either DEVELOPMENT or LIVE .

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        def initialize(
          @event_object : Bytes,
          @if_match : String,
          @name : String,
          @stage : String? = nil
        )
        end
      end


      struct TestFunctionResult
        include JSON::Serializable

        # An object that represents the result of running the function with the provided event object.

        @[JSON::Field(key: "TestResult")]
        getter test_result : Types::TestResult?

        def initialize(
          @test_result : Types::TestResult? = nil
        )
        end
      end

      # Contains the result of testing a CloudFront function with TestFunction .

      struct TestResult
        include JSON::Serializable

        # The amount of time that the function took to run as a percentage of the maximum allowed time. For
        # example, a compute utilization of 35 means that the function completed in 35% of the maximum allowed
        # time.

        @[JSON::Field(key: "ComputeUtilization")]
        getter compute_utilization : String?

        # If the result of testing the function was an error, this field contains the error message.

        @[JSON::Field(key: "FunctionErrorMessage")]
        getter function_error_message : String?

        # Contains the log lines that the function wrote (if any) when running the test.

        @[JSON::Field(key: "FunctionExecutionLogs")]
        getter function_execution_logs : Array(String)?

        # The event object returned by the function. For more information about the structure of the event
        # object, see Event object structure in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "FunctionOutput")]
        getter function_output : String?

        # Contains configuration information and metadata about the CloudFront function that was tested.

        @[JSON::Field(key: "FunctionSummary")]
        getter function_summary : Types::FunctionSummary?

        def initialize(
          @compute_utilization : String? = nil,
          @function_error_message : String? = nil,
          @function_execution_logs : Array(String)? = nil,
          @function_output : String? = nil,
          @function_summary : Types::FunctionSummary? = nil
        )
        end
      end

      # The length of the Content-Security-Policy header value in the response headers policy exceeds the
      # maximum. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      struct TooLongCSPInResponseHeadersPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You cannot create more cache behaviors for the distribution.

      struct TooManyCacheBehaviors
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of cache policies for this Amazon Web Services account. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyCachePolicies
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You cannot create anymore custom SSL/TLS certificates.

      struct TooManyCertificates
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing your request would cause you to exceed the maximum number of origin access identities
      # allowed.

      struct TooManyCloudFrontOriginAccessIdentities
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of continuous deployment policies for this Amazon Web Services
      # account.

      struct TooManyContinuousDeploymentPolicies
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains more cookie names in the whitelist than are allowed per cache behavior.

      struct TooManyCookieNamesInWhiteList
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of cookies in the cache policy exceeds the maximum. For more information, see Quotas
      # (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyCookiesInCachePolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of cookies in the origin request policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyCookiesInOriginRequestPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of custom headers in the response headers policy exceeds the maximum. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyCustomHeadersInResponseHeadersPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains more CNAMEs than are allowed per distribution.

      struct TooManyDistributionCNAMEs
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing your request would cause you to exceed the maximum number of distributions allowed.

      struct TooManyDistributions
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified cache policy. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyDistributionsAssociatedToCachePolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified configuration for
      # field-level encryption.

      struct TooManyDistributionsAssociatedToFieldLevelEncryptionConfig
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of distributions that reference this key group is more than the maximum allowed. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyDistributionsAssociatedToKeyGroup
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified origin access control.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyDistributionsAssociatedToOriginAccessControl
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified origin request policy.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyDistributionsAssociatedToOriginRequestPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified response headers policy.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyDistributionsAssociatedToResponseHeadersPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of distributions that are associated with a CloudFront function.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyDistributionsWithFunctionAssociations
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing your request would cause the maximum number of distributions with Lambda@Edge function
      # associations per owner to be exceeded.

      struct TooManyDistributionsWithLambdaAssociations
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of distributions have been associated with the specified Lambda@Edge function.

      struct TooManyDistributionsWithSingleFunctionARN
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of configurations for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionConfigs
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of content type profiles for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionContentTypeProfiles
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of encryption entities for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionEncryptionEntities
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of field patterns for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionFieldPatterns
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of profiles for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionProfiles
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of query arg profiles for field-level encryption have been created.

      struct TooManyFieldLevelEncryptionQueryArgProfiles
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of CloudFront function associations for this distribution. For
      # more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyFunctionAssociations
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of CloudFront functions for this Amazon Web Services account.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyFunctions
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of headers in the cache policy exceeds the maximum. For more information, see Quotas
      # (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyHeadersInCachePolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains too many headers in forwarded values.

      struct TooManyHeadersInForwardedValues
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of headers in the origin request policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyHeadersInOriginRequestPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded the maximum number of allowable InProgress invalidation batch requests, or
      # invalidation objects.

      struct TooManyInvalidationsInProgress
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of key groups for this Amazon Web Services account. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyKeyGroups
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of key groups referenced by this distribution is more than the maximum allowed. For more
      # information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyKeyGroupsAssociatedToDistribution
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains more Lambda@Edge function associations than are allowed per distribution.

      struct TooManyLambdaFunctionAssociations
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of origin access controls in your Amazon Web Services account exceeds the maximum
      # allowed. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      struct TooManyOriginAccessControls
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains too many origin custom headers.

      struct TooManyOriginCustomHeaders
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing your request would cause you to exceed the maximum number of origin groups allowed.

      struct TooManyOriginGroupsPerDistribution
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of origin request policies for this Amazon Web Services account.
      # For more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide
      # .

      struct TooManyOriginRequestPolicies
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You cannot create more origins for the distribution.

      struct TooManyOrigins
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of public keys for field-level encryption have been created. To create a new
      # public key, delete one of the existing keys.

      struct TooManyPublicKeys
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of public keys in this key group is more than the maximum allowed. For more information,
      # see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyPublicKeysInKeyGroup
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains too many query string parameters.

      struct TooManyQueryStringParameters
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of query strings in the cache policy exceeds the maximum. For more information, see
      # Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyQueryStringsInCachePolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of query strings in the origin request policy exceeds the maximum. For more information,
      # see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyQueryStringsInOriginRequestPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of real-time log configurations for this Amazon Web Services
      # account. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      struct TooManyRealtimeLogConfigs
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of headers in RemoveHeadersConfig in the response headers policy exceeds the maximum. For
      # more information, see Quotas (formerly known as limits) in the Amazon CloudFront Developer Guide .

      struct TooManyRemoveHeadersInResponseHeadersPolicy
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have reached the maximum number of response headers policies for this Amazon Web Services
      # account. For more information, see Quotas (formerly known as limits) in the Amazon CloudFront
      # Developer Guide .

      struct TooManyResponseHeadersPolicies
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains more CNAMEs than are allowed per distribution.

      struct TooManyStreamingDistributionCNAMEs
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing your request would cause you to exceed the maximum number of streaming distributions
      # allowed.

      struct TooManyStreamingDistributions
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request contains more trusted signers than are allowed per distribution.

      struct TooManyTrustedSigners
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The traffic configuration of your continuous deployment.

      struct TrafficConfig
        include JSON::Serializable

        # The type of traffic configuration.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Determines which HTTP requests are sent to the staging distribution.

        @[JSON::Field(key: "SingleHeaderConfig")]
        getter single_header_config : Types::ContinuousDeploymentSingleHeaderConfig?

        # Contains the percentage of traffic to send to the staging distribution.

        @[JSON::Field(key: "SingleWeightConfig")]
        getter single_weight_config : Types::ContinuousDeploymentSingleWeightConfig?

        def initialize(
          @type : String,
          @single_header_config : Types::ContinuousDeploymentSingleHeaderConfig? = nil,
          @single_weight_config : Types::ContinuousDeploymentSingleWeightConfig? = nil
        )
        end
      end

      # A trust store.

      struct TrustStore
        include JSON::Serializable

        # The trust store's Amazon Resource Name (ARN).

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The trust store's ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The trust store's last modified time.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The trust store's name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The trust store's number of CA certificates.

        @[JSON::Field(key: "NumberOfCaCertificates")]
        getter number_of_ca_certificates : Int32?

        # The trust store's reason.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The trust store's status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @number_of_ca_certificates : Int32? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A trust store configuration.

      struct TrustStoreConfig
        include JSON::Serializable

        # The trust store ID.

        @[JSON::Field(key: "TrustStoreId")]
        getter trust_store_id : String

        # The configuration to use to advertise trust store CA names.

        @[JSON::Field(key: "AdvertiseTrustStoreCaNames")]
        getter advertise_trust_store_ca_names : Bool?

        # The configuration to use to ignore certificate expiration.

        @[JSON::Field(key: "IgnoreCertificateExpiry")]
        getter ignore_certificate_expiry : Bool?

        def initialize(
          @trust_store_id : String,
          @advertise_trust_store_ca_names : Bool? = nil,
          @ignore_certificate_expiry : Bool? = nil
        )
        end
      end

      # A trust store summary.

      struct TrustStoreSummary
        include JSON::Serializable

        # The trust store's Amazon Resource Name (ARN).

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The version identifier for the current version of the trust store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # The trust store's ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The trust store's last modified time.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The trust store's name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The trust store's number of CA certificates.

        @[JSON::Field(key: "NumberOfCaCertificates")]
        getter number_of_ca_certificates : Int32

        # The trust store's status.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The trust store's reason.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @arn : String,
          @e_tag : String,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @number_of_ca_certificates : Int32,
          @status : String,
          @reason : String? = nil
        )
        end
      end

      # The specified key group does not exist.

      struct TrustedKeyGroupDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of key groups whose public keys CloudFront can use to verify the signatures of signed URLs
      # and signed cookies.

      struct TrustedKeyGroups
        include JSON::Serializable

        # This field is true if any of the key groups in the list have public keys that CloudFront can use to
        # verify the signatures of signed URLs and signed cookies. If not, this field is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The number of key groups in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of key groups identifiers.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @enabled : Bool,
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # One or more of your trusted signers don't exist.

      struct TrustedSignerDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of Amazon Web Services accounts whose public keys CloudFront can use to verify the signatures
      # of signed URLs and signed cookies.

      struct TrustedSigners
        include JSON::Serializable

        # This field is true if any of the Amazon Web Services accounts in the list are configured as trusted
        # signers. If not, this field is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The number of Amazon Web Services accounts in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # A list of Amazon Web Services account identifiers.

        @[JSON::Field(key: "Items")]
        getter items : Array(String)?

        def initialize(
          @enabled : Bool,
          @quantity : Int32,
          @items : Array(String)? = nil
        )
        end
      end

      # This operation is not supported in this Amazon Web Services Region.

      struct UnsupportedOperation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request to remove tags from a CloudFront resource.

      struct UntagResourceRequest
        include JSON::Serializable

        # An ARN of a CloudFront resource.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        # A complex type that contains zero or more Tag key elements.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Types::TagKeys

        def initialize(
          @resource : String,
          @tag_keys : Types::TagKeys
        )
        end
      end


      struct UpdateAnycastIpListRequest
        include JSON::Serializable

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version (ETag value) of the Anycast static IP list that you are updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The IP address type for the Anycast static IP list. You can specify one of the following options:
        # ipv4 only ipv6 only dualstack - Allocate a list of both IPv4 and IPv6 addresses

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @id : String,
          @if_match : String,
          @ip_address_type : String? = nil
        )
        end
      end


      struct UpdateAnycastIpListResult
        include JSON::Serializable


        @[JSON::Field(key: "AnycastIpList")]
        getter anycast_ip_list : Types::AnycastIpList?

        # The current version of the Anycast static IP list.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @anycast_ip_list : Types::AnycastIpList? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateCachePolicyRequest
        include JSON::Serializable

        # A cache policy configuration.

        @[JSON::Field(key: "CachePolicyConfig")]
        getter cache_policy_config : Types::CachePolicyConfig

        # The unique identifier for the cache policy that you are updating. The identifier is returned in a
        # cache behavior's CachePolicyId field in the response to GetDistributionConfig .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The version of the cache policy that you are updating. The version is returned in the cache policy's
        # ETag field in the response to GetCachePolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @cache_policy_config : Types::CachePolicyConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateCachePolicyResult
        include JSON::Serializable

        # A cache policy.

        @[JSON::Field(key: "CachePolicy")]
        getter cache_policy : Types::CachePolicy?

        # The current version of the cache policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cache_policy : Types::CachePolicy? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to update an origin access identity.

      struct UpdateCloudFrontOriginAccessIdentityRequest
        include JSON::Serializable

        # The identity's configuration information.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentityConfig")]
        getter cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig

        # The identity's id.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the identity's configuration. For
        # example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @cloud_front_origin_access_identity_config : Types::CloudFrontOriginAccessIdentityConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct UpdateCloudFrontOriginAccessIdentityResult
        include JSON::Serializable

        # The origin access identity's information.

        @[JSON::Field(key: "CloudFrontOriginAccessIdentity")]
        getter cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity?

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @cloud_front_origin_access_identity : Types::CloudFrontOriginAccessIdentity? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateConnectionFunctionRequest
        include JSON::Serializable

        # The connection function code.

        @[JSON::Field(key: "ConnectionFunctionCode")]
        getter connection_function_code : Bytes


        @[JSON::Field(key: "ConnectionFunctionConfig")]
        getter connection_function_config : Types::FunctionConfig

        # The connection function ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the connection function you are updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @connection_function_code : Bytes,
          @connection_function_config : Types::FunctionConfig,
          @id : String,
          @if_match : String
        )
        end
      end


      struct UpdateConnectionFunctionResult
        include JSON::Serializable

        # The connection function summary.

        @[JSON::Field(key: "ConnectionFunctionSummary")]
        getter connection_function_summary : Types::ConnectionFunctionSummary?

        # The version identifier for the current version of the connection function.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_function_summary : Types::ConnectionFunctionSummary? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateConnectionGroupRequest
        include JSON::Serializable

        # The ID of the connection group.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the connection group that you're
        # updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The ID of the Anycast static IP list.

        @[JSON::Field(key: "AnycastIpListId")]
        getter anycast_ip_list_id : String?

        # Whether the connection group is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Enable IPv6 for the connection group. For more information, see Enable IPv6 in the Amazon CloudFront
        # Developer Guide .

        @[JSON::Field(key: "Ipv6Enabled")]
        getter ipv6_enabled : Bool?

        def initialize(
          @id : String,
          @if_match : String,
          @anycast_ip_list_id : String? = nil,
          @enabled : Bool? = nil,
          @ipv6_enabled : Bool? = nil
        )
        end
      end


      struct UpdateConnectionGroupResult
        include JSON::Serializable

        # The connection group that you updated.

        @[JSON::Field(key: "ConnectionGroup")]
        getter connection_group : Types::ConnectionGroup?

        # The current version of the connection group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @connection_group : Types::ConnectionGroup? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateContinuousDeploymentPolicyRequest
        include JSON::Serializable

        # The continuous deployment policy configuration.

        @[JSON::Field(key: "ContinuousDeploymentPolicyConfig")]
        getter continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig

        # The identifier of the continuous deployment policy that you are updating.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the continuous deployment policy that you are updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @continuous_deployment_policy_config : Types::ContinuousDeploymentPolicyConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateContinuousDeploymentPolicyResult
        include JSON::Serializable

        # A continuous deployment policy.

        @[JSON::Field(key: "ContinuousDeploymentPolicy")]
        getter continuous_deployment_policy : Types::ContinuousDeploymentPolicy?

        # The version identifier for the current version of the continuous deployment policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @continuous_deployment_policy : Types::ContinuousDeploymentPolicy? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request to update a distribution.

      struct UpdateDistributionRequest
        include JSON::Serializable

        # The distribution's configuration information.

        @[JSON::Field(key: "DistributionConfig")]
        getter distribution_config : Types::DistributionConfig

        # The distribution's id.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the distribution's configuration. For
        # example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @distribution_config : Types::DistributionConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct UpdateDistributionResult
        include JSON::Serializable

        # The distribution's information.

        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateDistributionTenantRequest
        include JSON::Serializable

        # The ID of the distribution tenant.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the distribution tenant to update.
        # This value is returned in the response of the GetDistributionTenant API operation.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The ID of the target connection group.

        @[JSON::Field(key: "ConnectionGroupId")]
        getter connection_group_id : String?

        # Customizations for the distribution tenant. For each distribution tenant, you can specify the
        # geographic restrictions, and the Amazon Resource Names (ARNs) for the ACM certificate and WAF web
        # ACL. These are specific values that you can override or disable from the multi-tenant distribution
        # that was used to create the distribution tenant.

        @[JSON::Field(key: "Customizations")]
        getter customizations : Types::Customizations?

        # The ID for the multi-tenant distribution.

        @[JSON::Field(key: "DistributionId")]
        getter distribution_id : String?

        # The domains to update for the distribution tenant. A domain object can contain only a domain
        # property. You must specify at least one domain. Each distribution tenant can have up to 5 domains.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainItem)?

        # Indicates whether the distribution tenant should be updated to an enabled state. If you update the
        # distribution tenant and it's not enabled, the distribution tenant won't serve traffic.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that contains the CloudFront managed ACM certificate request.

        @[JSON::Field(key: "ManagedCertificateRequest")]
        getter managed_certificate_request : Types::ManagedCertificateRequest?

        # A list of parameter values to add to the resource. A parameter is specified as a key-value pair. A
        # valid parameter value must exist for any parameter that is marked as required in the multi-tenant
        # distribution.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @id : String,
          @if_match : String,
          @connection_group_id : String? = nil,
          @customizations : Types::Customizations? = nil,
          @distribution_id : String? = nil,
          @domains : Array(Types::DomainItem)? = nil,
          @enabled : Bool? = nil,
          @managed_certificate_request : Types::ManagedCertificateRequest? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct UpdateDistributionTenantResult
        include JSON::Serializable

        # The distribution tenant that you're updating.

        @[JSON::Field(key: "DistributionTenant")]
        getter distribution_tenant : Types::DistributionTenant?

        # The current version of the distribution tenant.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution_tenant : Types::DistributionTenant? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateDistributionWithStagingConfigRequest
        include JSON::Serializable

        # The identifier of the primary distribution to which you are copying a staging distribution's
        # configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current versions ( ETag values) of both primary and staging distributions. Provide these in the
        # following format: &lt;primary ETag&gt;, &lt;staging ETag&gt;

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        # The identifier of the staging distribution whose configuration you are copying to the primary
        # distribution.

        @[JSON::Field(key: "StagingDistributionId")]
        getter staging_distribution_id : String?

        def initialize(
          @id : String,
          @if_match : String? = nil,
          @staging_distribution_id : String? = nil
        )
        end
      end


      struct UpdateDistributionWithStagingConfigResult
        include JSON::Serializable


        @[JSON::Field(key: "Distribution")]
        getter distribution : Types::Distribution?

        # The current version of the primary distribution (after it's updated).

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @distribution : Types::Distribution? = nil,
          @e_tag : String? = nil
        )
        end
      end


      struct UpdateDomainAssociationRequest
        include JSON::Serializable

        # The domain to update.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The target standard distribution or distribution tenant resource for the domain. You can specify
        # either DistributionId or DistributionTenantId , but not both.

        @[JSON::Field(key: "TargetResource")]
        getter target_resource : Types::DistributionResourceId

        # The value of the ETag identifier for the standard distribution or distribution tenant that will be
        # associated with the domain.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @domain : String,
          @target_resource : Types::DistributionResourceId,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateDomainAssociationResult
        include JSON::Serializable

        # The domain that you're moving.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The current version of the target standard distribution or distribution tenant that was associated
        # with the domain.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The intended destination for the domain.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @domain : String? = nil,
          @e_tag : String? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct UpdateFieldLevelEncryptionConfigRequest
        include JSON::Serializable

        # Request to update a field-level encryption configuration.

        @[JSON::Field(key: "FieldLevelEncryptionConfig")]
        getter field_level_encryption_config : Types::FieldLevelEncryptionConfig

        # The ID of the configuration you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the configuration identity to update.
        # For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @field_level_encryption_config : Types::FieldLevelEncryptionConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateFieldLevelEncryptionConfigResult
        include JSON::Serializable

        # The value of the ETag header that you received when updating the configuration. For example:
        # E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the results of updating the configuration.

        @[JSON::Field(key: "FieldLevelEncryption")]
        getter field_level_encryption : Types::FieldLevelEncryption?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption : Types::FieldLevelEncryption? = nil
        )
        end
      end


      struct UpdateFieldLevelEncryptionProfileRequest
        include JSON::Serializable

        # Request to update a field-level encryption profile.

        @[JSON::Field(key: "FieldLevelEncryptionProfileConfig")]
        getter field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig

        # The ID of the field-level encryption profile request.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The value of the ETag header that you received when retrieving the profile identity to update. For
        # example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @field_level_encryption_profile_config : Types::FieldLevelEncryptionProfileConfig,
          @id : String,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateFieldLevelEncryptionProfileResult
        include JSON::Serializable

        # The result of the field-level encryption profile request.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # Return the results of updating the profile.

        @[JSON::Field(key: "FieldLevelEncryptionProfile")]
        getter field_level_encryption_profile : Types::FieldLevelEncryptionProfile?

        def initialize(
          @e_tag : String? = nil,
          @field_level_encryption_profile : Types::FieldLevelEncryptionProfile? = nil
        )
        end
      end


      struct UpdateFunctionRequest
        include JSON::Serializable

        # The function code. For more information about writing a CloudFront function, see Writing function
        # code for CloudFront Functions in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "FunctionCode")]
        getter function_code : Bytes

        # Configuration information about the function.

        @[JSON::Field(key: "FunctionConfig")]
        getter function_config : Types::FunctionConfig

        # The current version ( ETag value) of the function that you are updating, which you can get using
        # DescribeFunction .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the function that you are updating.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @function_code : Bytes,
          @function_config : Types::FunctionConfig,
          @if_match : String,
          @name : String
        )
        end
      end


      struct UpdateFunctionResult
        include JSON::Serializable

        # The version identifier for the current version of the CloudFront function.

        @[JSON::Field(key: "ETtag")]
        getter e_tag : String?

        # Contains configuration information and metadata about a CloudFront function.

        @[JSON::Field(key: "FunctionSummary")]
        getter function_summary : Types::FunctionSummary?

        def initialize(
          @e_tag : String? = nil,
          @function_summary : Types::FunctionSummary? = nil
        )
        end
      end


      struct UpdateKeyGroupRequest
        include JSON::Serializable

        # The identifier of the key group that you are updating.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The key group configuration.

        @[JSON::Field(key: "KeyGroupConfig")]
        getter key_group_config : Types::KeyGroupConfig

        # The version of the key group that you are updating. The version is the key group's ETag value.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @key_group_config : Types::KeyGroupConfig,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateKeyGroupResult
        include JSON::Serializable

        # The identifier for this version of the key group.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The key group that was just updated.

        @[JSON::Field(key: "KeyGroup")]
        getter key_group : Types::KeyGroup?

        def initialize(
          @e_tag : String? = nil,
          @key_group : Types::KeyGroup? = nil
        )
        end
      end


      struct UpdateKeyValueStoreRequest
        include JSON::Serializable

        # The comment of the key value store to update.

        @[JSON::Field(key: "Comment")]
        getter comment : String

        # The key value store to update, if a match occurs.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The name of the key value store to update.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @comment : String,
          @if_match : String,
          @name : String
        )
        end
      end


      struct UpdateKeyValueStoreResult
        include JSON::Serializable

        # The ETag of the resulting key value store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The resulting key value store to update.

        @[JSON::Field(key: "KeyValueStore")]
        getter key_value_store : Types::KeyValueStore?

        def initialize(
          @e_tag : String? = nil,
          @key_value_store : Types::KeyValueStore? = nil
        )
        end
      end


      struct UpdateOriginAccessControlRequest
        include JSON::Serializable

        # The unique identifier of the origin access control that you are updating.

        @[JSON::Field(key: "Id")]
        getter id : String

        # An origin access control.

        @[JSON::Field(key: "OriginAccessControlConfig")]
        getter origin_access_control_config : Types::OriginAccessControlConfig

        # The current version ( ETag value) of the origin access control that you are updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @origin_access_control_config : Types::OriginAccessControlConfig,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateOriginAccessControlResult
        include JSON::Serializable

        # The new version of the origin access control after it has been updated.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The origin access control after it has been updated.

        @[JSON::Field(key: "OriginAccessControl")]
        getter origin_access_control : Types::OriginAccessControl?

        def initialize(
          @e_tag : String? = nil,
          @origin_access_control : Types::OriginAccessControl? = nil
        )
        end
      end


      struct UpdateOriginRequestPolicyRequest
        include JSON::Serializable

        # The unique identifier for the origin request policy that you are updating. The identifier is
        # returned in a cache behavior's OriginRequestPolicyId field in the response to GetDistributionConfig
        # .

        @[JSON::Field(key: "Id")]
        getter id : String

        # An origin request policy configuration.

        @[JSON::Field(key: "OriginRequestPolicyConfig")]
        getter origin_request_policy_config : Types::OriginRequestPolicyConfig

        # The version of the origin request policy that you are updating. The version is returned in the
        # origin request policy's ETag field in the response to GetOriginRequestPolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @origin_request_policy_config : Types::OriginRequestPolicyConfig,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateOriginRequestPolicyResult
        include JSON::Serializable

        # The current version of the origin request policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # An origin request policy.

        @[JSON::Field(key: "OriginRequestPolicy")]
        getter origin_request_policy : Types::OriginRequestPolicy?

        def initialize(
          @e_tag : String? = nil,
          @origin_request_policy : Types::OriginRequestPolicy? = nil
        )
        end
      end


      struct UpdatePublicKeyRequest
        include JSON::Serializable

        # The identifier of the public key that you are updating.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A public key configuration.

        @[JSON::Field(key: "PublicKeyConfig")]
        getter public_key_config : Types::PublicKeyConfig

        # The value of the ETag header that you received when retrieving the public key to update. For
        # example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @public_key_config : Types::PublicKeyConfig,
          @if_match : String? = nil
        )
        end
      end


      struct UpdatePublicKeyResult
        include JSON::Serializable

        # The identifier of the current version of the public key.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The public key.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : Types::PublicKey?

        def initialize(
          @e_tag : String? = nil,
          @public_key : Types::PublicKey? = nil
        )
        end
      end


      struct UpdateRealtimeLogConfigRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this real-time log configuration.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # Contains information about the Amazon Kinesis data stream where you are sending real-time log data.

        @[JSON::Field(key: "EndPoints")]
        getter end_points : Array(Types::EndPoint)?

        # A list of fields to include in each real-time log record. For more information about fields, see
        # Real-time log configuration fields in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "Fields")]
        getter fields : Array(String)?

        # The name for this real-time log configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The sampling rate for this real-time log configuration. The sampling rate determines the percentage
        # of viewer requests that are represented in the real-time log data. You must provide an integer
        # between 1 and 100, inclusive.

        @[JSON::Field(key: "SamplingRate")]
        getter sampling_rate : Int64?

        def initialize(
          @arn : String? = nil,
          @end_points : Array(Types::EndPoint)? = nil,
          @fields : Array(String)? = nil,
          @name : String? = nil,
          @sampling_rate : Int64? = nil
        )
        end
      end


      struct UpdateRealtimeLogConfigResult
        include JSON::Serializable

        # A real-time log configuration.

        @[JSON::Field(key: "RealtimeLogConfig")]
        getter realtime_log_config : Types::RealtimeLogConfig?

        def initialize(
          @realtime_log_config : Types::RealtimeLogConfig? = nil
        )
        end
      end


      struct UpdateResponseHeadersPolicyRequest
        include JSON::Serializable

        # The identifier for the response headers policy that you are updating.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A response headers policy configuration.

        @[JSON::Field(key: "ResponseHeadersPolicyConfig")]
        getter response_headers_policy_config : Types::ResponseHeadersPolicyConfig

        # The version of the response headers policy that you are updating. The version is returned in the
        # cache policy's ETag field in the response to GetResponseHeadersPolicyConfig .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @response_headers_policy_config : Types::ResponseHeadersPolicyConfig,
          @if_match : String? = nil
        )
        end
      end


      struct UpdateResponseHeadersPolicyResult
        include JSON::Serializable

        # The current version of the response headers policy.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # A response headers policy.

        @[JSON::Field(key: "ResponseHeadersPolicy")]
        getter response_headers_policy : Types::ResponseHeadersPolicy?

        def initialize(
          @e_tag : String? = nil,
          @response_headers_policy : Types::ResponseHeadersPolicy? = nil
        )
        end
      end

      # The request to update a streaming distribution.

      struct UpdateStreamingDistributionRequest
        include JSON::Serializable

        # The streaming distribution's id.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The streaming distribution's configuration information.

        @[JSON::Field(key: "StreamingDistributionConfig")]
        getter streaming_distribution_config : Types::StreamingDistributionConfig

        # The value of the ETag header that you received when retrieving the streaming distribution's
        # configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "If-Match")]
        getter if_match : String?

        def initialize(
          @id : String,
          @streaming_distribution_config : Types::StreamingDistributionConfig,
          @if_match : String? = nil
        )
        end
      end

      # The returned result of the corresponding request.

      struct UpdateStreamingDistributionResult
        include JSON::Serializable

        # The current version of the configuration. For example: E2QWRUHAPOMQZL .

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The streaming distribution's information.

        @[JSON::Field(key: "StreamingDistribution")]
        getter streaming_distribution : Types::StreamingDistribution?

        def initialize(
          @e_tag : String? = nil,
          @streaming_distribution : Types::StreamingDistribution? = nil
        )
        end
      end


      struct UpdateTrustStoreRequest
        include JSON::Serializable

        # The CA certificates bundle source.

        @[JSON::Field(key: "CaCertificatesBundleSource")]
        getter ca_certificates_bundle_source : Types::CaCertificatesBundleSource

        # The trust store ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The current version ( ETag value) of the trust store you are updating.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        def initialize(
          @ca_certificates_bundle_source : Types::CaCertificatesBundleSource,
          @id : String,
          @if_match : String
        )
        end
      end


      struct UpdateTrustStoreResult
        include JSON::Serializable

        # The version identifier for the current version of the trust store.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The trust store.

        @[JSON::Field(key: "TrustStore")]
        getter trust_store : Types::TrustStore?

        def initialize(
          @e_tag : String? = nil,
          @trust_store : Types::TrustStore? = nil
        )
        end
      end


      struct UpdateVpcOriginRequest
        include JSON::Serializable

        # The VPC origin ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The VPC origin to update, if a match occurs.

        @[JSON::Field(key: "If-Match")]
        getter if_match : String

        # The VPC origin endpoint configuration.

        @[JSON::Field(key: "VpcOriginEndpointConfig")]
        getter vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig

        def initialize(
          @id : String,
          @if_match : String,
          @vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig
        )
        end
      end


      struct UpdateVpcOriginResult
        include JSON::Serializable

        # The VPC origin ETag.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The VPC origin.

        @[JSON::Field(key: "VpcOrigin")]
        getter vpc_origin : Types::VpcOrigin?

        def initialize(
          @e_tag : String? = nil,
          @vpc_origin : Types::VpcOrigin? = nil
        )
        end
      end

      # Contains details about the validation token.

      struct ValidationTokenDetail
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The domain to redirect from.

        @[JSON::Field(key: "RedirectFrom")]
        getter redirect_from : String?

        # The domain to redirect to.

        @[JSON::Field(key: "RedirectTo")]
        getter redirect_to : String?

        def initialize(
          @domain : String,
          @redirect_from : String? = nil,
          @redirect_to : String? = nil
        )
        end
      end


      struct VerifyDnsConfigurationRequest
        include JSON::Serializable

        # The identifier of the distribution tenant. You can specify the ARN, ID, or name of the distribution
        # tenant.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The domain name that you're verifying.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        def initialize(
          @identifier : String,
          @domain : String? = nil
        )
        end
      end


      struct VerifyDnsConfigurationResult
        include JSON::Serializable

        # The list of domain names, their statuses, and a description of each status.

        @[JSON::Field(key: "DnsConfigurationList")]
        getter dns_configuration_list : Array(Types::DnsConfiguration)?

        def initialize(
          @dns_configuration_list : Array(Types::DnsConfiguration)? = nil
        )
        end
      end

      # A complex type that determines the distribution's SSL/TLS configuration for communicating with
      # viewers. If the distribution doesn't use Aliases (also known as alternate domain names or
      # CNAMEs)—that is, if the distribution uses the CloudFront domain name such as
      # d111111abcdef8.cloudfront.net —set CloudFrontDefaultCertificate to true and leave all other fields
      # empty. If the distribution uses Aliases (alternate domain names or CNAMEs), use the fields in this
      # type to specify the following settings: Which viewers the distribution accepts HTTPS connections
      # from: only viewers that support server name indication (SNI) (recommended), or all viewers including
      # those that don't support SNI. To accept HTTPS connections from only viewers that support SNI, set
      # SSLSupportMethod to sni-only . This is recommended. Most browsers and clients support SNI. To accept
      # HTTPS connections from all viewers, including those that don't support SNI, set SSLSupportMethod to
      # vip . This is not recommended, and results in additional monthly charges from CloudFront. The
      # minimum SSL/TLS protocol version that the distribution can use to communicate with viewers. To
      # specify a minimum version, choose a value for MinimumProtocolVersion . For more information, see
      # Security Policy in the Amazon CloudFront Developer Guide . The location of the SSL/TLS certificate,
      # Certificate Manager (ACM) (recommended) or Identity and Access Management (IAM) . You specify the
      # location by setting a value in one of the following fields (not both): ACMCertificateArn
      # IAMCertificateId All distributions support HTTPS connections from viewers. To require viewers to use
      # HTTPS only, or to redirect them from HTTP to HTTPS, use ViewerProtocolPolicy in the CacheBehavior or
      # DefaultCacheBehavior . To specify how CloudFront should use SSL/TLS to communicate with your custom
      # origin, use CustomOriginConfig . For more information, see Using HTTPS with CloudFront and Using
      # Alternate Domain Names and HTTPS in the Amazon CloudFront Developer Guide .

      struct ViewerCertificate
        include JSON::Serializable

        # If the distribution uses Aliases (alternate domain names or CNAMEs) and the SSL/TLS certificate is
        # stored in Certificate Manager (ACM) , provide the Amazon Resource Name (ARN) of the ACM certificate.
        # CloudFront only supports ACM certificates in the US East (N. Virginia) Region ( us-east-1 ). If you
        # specify an ACM certificate ARN, you must also specify values for MinimumProtocolVersion and
        # SSLSupportMethod .

        @[JSON::Field(key: "ACMCertificateArn")]
        getter acm_certificate_arn : String?

        # This field is deprecated. Use one of the following fields instead: ACMCertificateArn
        # IAMCertificateId CloudFrontDefaultCertificate

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # This field is deprecated. Use one of the following fields instead: ACMCertificateArn
        # IAMCertificateId CloudFrontDefaultCertificate

        @[JSON::Field(key: "CertificateSource")]
        getter certificate_source : String?

        # If the distribution uses the CloudFront domain name such as d111111abcdef8.cloudfront.net , set this
        # field to true . If the distribution uses Aliases (alternate domain names or CNAMEs), set this field
        # to false and specify values for the following fields: ACMCertificateArn or IAMCertificateId (specify
        # a value for one, not both) MinimumProtocolVersion SSLSupportMethod

        @[JSON::Field(key: "CloudFrontDefaultCertificate")]
        getter cloud_front_default_certificate : Bool?

        # This field only supports standard distributions. You can't specify this field for multi-tenant
        # distributions. For more information, see Unsupported features for SaaS Manager for Amazon CloudFront
        # in the Amazon CloudFront Developer Guide . If the distribution uses Aliases (alternate domain names
        # or CNAMEs) and the SSL/TLS certificate is stored in Identity and Access Management (IAM) , provide
        # the ID of the IAM certificate. If you specify an IAM certificate ID, you must also specify values
        # for MinimumProtocolVersion and SSLSupportMethod .

        @[JSON::Field(key: "IAMCertificateId")]
        getter iam_certificate_id : String?

        # If the distribution uses Aliases (alternate domain names or CNAMEs), specify the security policy
        # that you want CloudFront to use for HTTPS connections with viewers. The security policy determines
        # two settings: The minimum SSL/TLS protocol that CloudFront can use to communicate with viewers. The
        # ciphers that CloudFront can use to encrypt the content that it returns to viewers. For more
        # information, see Security Policy and Supported Protocols and Ciphers Between Viewers and CloudFront
        # in the Amazon CloudFront Developer Guide . On the CloudFront console, this setting is called
        # Security Policy . When you're using SNI only (you set SSLSupportMethod to sni-only ), you must
        # specify TLSv1 or higher. If the distribution uses the CloudFront domain name such as
        # d111111abcdef8.cloudfront.net (you set CloudFrontDefaultCertificate to true ), CloudFront
        # automatically sets the security policy to TLSv1 regardless of the value that you set here.

        @[JSON::Field(key: "MinimumProtocolVersion")]
        getter minimum_protocol_version : String?

        # If the distribution uses Aliases (alternate domain names or CNAMEs), specify which viewers the
        # distribution accepts HTTPS connections from. sni-only – The distribution accepts HTTPS connections
        # from only viewers that support server name indication (SNI) . This is recommended. Most browsers and
        # clients support SNI. vip – The distribution accepts HTTPS connections from all viewers including
        # those that don't support SNI. This is not recommended, and results in additional monthly charges
        # from CloudFront. static-ip - Do not specify this value unless your distribution has been enabled for
        # this feature by the CloudFront team. If you have a use case that requires static IP addresses for a
        # distribution, contact CloudFront through the Amazon Web ServicesSupport Center . If the distribution
        # uses the CloudFront domain name such as d111111abcdef8.cloudfront.net , don't set a value for this
        # field.

        @[JSON::Field(key: "SSLSupportMethod")]
        getter ssl_support_method : String?

        def initialize(
          @acm_certificate_arn : String? = nil,
          @certificate : String? = nil,
          @certificate_source : String? = nil,
          @cloud_front_default_certificate : Bool? = nil,
          @iam_certificate_id : String? = nil,
          @minimum_protocol_version : String? = nil,
          @ssl_support_method : String? = nil
        )
        end
      end

      # A viewer mTLS configuration.

      struct ViewerMtlsConfig
        include JSON::Serializable

        # The viewer mTLS mode.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The trust store configuration associated with the viewer mTLS configuration.

        @[JSON::Field(key: "TrustStoreConfig")]
        getter trust_store_config : Types::TrustStoreConfig?

        def initialize(
          @mode : String? = nil,
          @trust_store_config : Types::TrustStoreConfig? = nil
        )
        end
      end

      # An Amazon CloudFront VPC origin.

      struct VpcOrigin
        include JSON::Serializable

        # The VPC origin ARN.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The VPC origin created time.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The VPC origin ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The VPC origin last modified time.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The VPC origin status.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The VPC origin endpoint configuration.

        @[JSON::Field(key: "VpcOriginEndpointConfig")]
        getter vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig

        # The account ID of the Amazon Web Services account that owns the VPC origin.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @arn : String,
          @created_time : Time,
          @id : String,
          @last_modified_time : Time,
          @status : String,
          @vpc_origin_endpoint_config : Types::VpcOriginEndpointConfig,
          @account_id : String? = nil
        )
        end
      end

      # An Amazon CloudFront VPC origin configuration.

      struct VpcOriginConfig
        include JSON::Serializable

        # The VPC origin ID.

        @[JSON::Field(key: "VpcOriginId")]
        getter vpc_origin_id : String

        # Specifies how long, in seconds, CloudFront persists its connection to the origin. The minimum
        # timeout is 1 second, the maximum is 120 seconds, and the default (if you don't specify otherwise) is
        # 5 seconds. For more information, see Keep-alive timeout (custom origins only) in the Amazon
        # CloudFront Developer Guide .

        @[JSON::Field(key: "OriginKeepaliveTimeout")]
        getter origin_keepalive_timeout : Int32?

        # Specifies how long, in seconds, CloudFront waits for a response from the origin. This is also known
        # as the origin response timeout . The minimum timeout is 1 second, the maximum is 120 seconds, and
        # the default (if you don't specify otherwise) is 30 seconds. For more information, see Response
        # timeout in the Amazon CloudFront Developer Guide .

        @[JSON::Field(key: "OriginReadTimeout")]
        getter origin_read_timeout : Int32?

        # The account ID of the Amazon Web Services account that owns the VPC origin.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        def initialize(
          @vpc_origin_id : String,
          @origin_keepalive_timeout : Int32? = nil,
          @origin_read_timeout : Int32? = nil,
          @owner_account_id : String? = nil
        )
        end
      end

      # An Amazon CloudFront VPC origin endpoint configuration.

      struct VpcOriginEndpointConfig
        include JSON::Serializable

        # The ARN of the CloudFront VPC origin endpoint configuration.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The HTTP port for the CloudFront VPC origin endpoint configuration. The default value is 80 .

        @[JSON::Field(key: "HTTPPort")]
        getter http_port : Int32

        # The HTTPS port of the CloudFront VPC origin endpoint configuration. The default value is 443 .

        @[JSON::Field(key: "HTTPSPort")]
        getter https_port : Int32

        # The name of the CloudFront VPC origin endpoint configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The origin protocol policy for the CloudFront VPC origin endpoint configuration.

        @[JSON::Field(key: "OriginProtocolPolicy")]
        getter origin_protocol_policy : String


        @[JSON::Field(key: "OriginSslProtocols")]
        getter origin_ssl_protocols : Types::OriginSslProtocols?

        def initialize(
          @arn : String,
          @http_port : Int32,
          @https_port : Int32,
          @name : String,
          @origin_protocol_policy : String,
          @origin_ssl_protocols : Types::OriginSslProtocols? = nil
        )
        end
      end

      # A list of CloudFront VPC origins.

      struct VpcOriginList
        include JSON::Serializable

        # A flag that indicates whether more VPC origins remain to be listed. If your results were truncated,
        # you can make a follow-up pagination request using the Marker request parameter to retrieve more VPC
        # origins in the list.

        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool

        # The marker associated with the VPC origins list.

        @[JSON::Field(key: "Marker")]
        getter marker : String

        # The maximum number of items included in the list.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32

        # The number of VPC origins in the list.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32

        # The items of the VPC origins list.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::VpcOriginSummary)?

        # The next marker associated with the VPC origins list.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @is_truncated : Bool,
          @marker : String,
          @max_items : Int32,
          @quantity : Int32,
          @items : Array(Types::VpcOriginSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # A summary of the CloudFront VPC origin.

      struct VpcOriginSummary
        include JSON::Serializable

        # The VPC origin summary ARN.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The VPC origin summary created time.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        # The VPC origin summary ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The VPC origin summary last modified time.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The VPC origin summary name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The VPC origin summary origin endpoint ARN.

        @[JSON::Field(key: "OriginEndpointArn")]
        getter origin_endpoint_arn : String

        # The VPC origin summary status.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The account ID of the Amazon Web Services account that owns the VPC origin.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @arn : String,
          @created_time : Time,
          @id : String,
          @last_modified_time : Time,
          @name : String,
          @origin_endpoint_arn : String,
          @status : String,
          @account_id : String? = nil
        )
        end
      end

      # The WAF web ACL customization specified for the distribution tenant.

      struct WebAclCustomization
        include JSON::Serializable

        # The action for the WAF web ACL customization. You can specify override to specify a separate WAF web
        # ACL for the distribution tenant. If you specify disable , the distribution tenant won't have WAF web
        # ACL protections and won't inherit from the multi-tenant distribution.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The Amazon Resource Name (ARN) of the WAF web ACL.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @action : String,
          @arn : String? = nil
        )
        end
      end
    end
  end
end
