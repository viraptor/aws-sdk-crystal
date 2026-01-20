require "json"
require "time"

module AwsSdk
  module AppSync
    module Types

      # You don't have access to perform this operation on this resource.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an additional authentication provider.

      struct AdditionalAuthenticationProvider
        include JSON::Serializable

        # The authentication type: API key, Identity and Access Management (IAM), OpenID Connect (OIDC),
        # Amazon Cognito user pools, or Lambda.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # Configuration for Lambda function authorization.

        @[JSON::Field(key: "lambdaAuthorizerConfig")]
        getter lambda_authorizer_config : Types::LambdaAuthorizerConfig?

        # The OIDC configuration.

        @[JSON::Field(key: "openIDConnectConfig")]
        getter open_id_connect_config : Types::OpenIDConnectConfig?

        # The Amazon Cognito user pool configuration.

        @[JSON::Field(key: "userPoolConfig")]
        getter user_pool_config : Types::CognitoUserPoolConfig?

        def initialize(
          @authentication_type : String? = nil,
          @lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
          @open_id_connect_config : Types::OpenIDConnectConfig? = nil,
          @user_pool_config : Types::CognitoUserPoolConfig? = nil
        )
        end
      end

      # Describes an AppSync API. You can use Api for an AppSync API with your preferred configuration, such
      # as an Event API that provides real-time message publishing and message subscriptions over
      # WebSockets.

      struct Api
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Api .

        @[JSON::Field(key: "apiArn")]
        getter api_arn : String?

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # The date and time that the Api was created.

        @[JSON::Field(key: "created")]
        getter created : Time?

        # The DNS records for the API. This will include an HTTP and a real-time endpoint.

        @[JSON::Field(key: "dns")]
        getter dns : Hash(String, String)?

        # The Event API configuration. This includes the default authorization configuration for connecting,
        # publishing, and subscribing to an Event API.

        @[JSON::Field(key: "eventConfig")]
        getter event_config : Types::EventConfig?

        # The name of the Api .

        @[JSON::Field(key: "name")]
        getter name : String?

        # The owner contact information for the Api

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the WAF web access control list (web ACL) associated with this Api
        # , if one exists.

        @[JSON::Field(key: "wafWebAclArn")]
        getter waf_web_acl_arn : String?

        # A flag indicating whether to use X-Ray tracing for this Api .

        @[JSON::Field(key: "xrayEnabled")]
        getter xray_enabled : Bool?

        def initialize(
          @api_arn : String? = nil,
          @api_id : String? = nil,
          @created : Time? = nil,
          @dns : Hash(String, String)? = nil,
          @event_config : Types::EventConfig? = nil,
          @name : String? = nil,
          @owner_contact : String? = nil,
          @tags : Hash(String, String)? = nil,
          @waf_web_acl_arn : String? = nil,
          @xray_enabled : Bool? = nil
        )
        end
      end

      # Describes an ApiAssociation object.

      struct ApiAssociation
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # Identifies the status of an association. PROCESSING : The API association is being created. You
        # cannot modify association requests during processing. SUCCESS : The API association was successful.
        # You can modify associations after success. FAILED : The API association has failed. You can modify
        # associations after failure.

        @[JSON::Field(key: "associationStatus")]
        getter association_status : String?

        # Details about the last deployment status.

        @[JSON::Field(key: "deploymentDetail")]
        getter deployment_detail : String?

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @api_id : String? = nil,
          @association_status : String? = nil,
          @deployment_detail : String? = nil,
          @domain_name : String? = nil
        )
        end
      end

      # The ApiCache object.

      struct ApiCache
        include JSON::Serializable

        # Caching behavior. FULL_REQUEST_CACHING : All requests from the same user are cached. Individual
        # resolvers are automatically cached. All API calls will try to return responses from the cache.
        # PER_RESOLVER_CACHING : Individual resolvers that you specify are cached. OPERATION_LEVEL_CACHING :
        # Full requests are cached together and returned without executing resolvers.

        @[JSON::Field(key: "apiCachingBehavior")]
        getter api_caching_behavior : String?

        # At-rest encryption flag for cache. You cannot update this setting after creation.

        @[JSON::Field(key: "atRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # Controls how cache health metrics will be emitted to CloudWatch. Cache health metrics include:
        # NetworkBandwidthOutAllowanceExceeded: The network packets dropped because the throughput exceeded
        # the aggregated bandwidth limit. This is useful for diagnosing bottlenecks in a cache configuration.
        # EngineCPUUtilization: The CPU utilization (percentage) allocated to the Redis process. This is
        # useful for diagnosing bottlenecks in a cache configuration. Metrics will be recorded by API ID. You
        # can set the value to ENABLED or DISABLED .

        @[JSON::Field(key: "healthMetricsConfig")]
        getter health_metrics_config : String?

        # The cache instance status. AVAILABLE : The instance is available for use. CREATING : The instance is
        # currently creating. DELETING : The instance is currently deleting. MODIFYING : The instance is
        # currently modifying. FAILED : The instance has failed creation.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Transit encryption flag when connecting to cache. You cannot update this setting after creation.

        @[JSON::Field(key: "transitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # TTL in seconds for cache entries. Valid values are 1–3,600 seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : Int64?

        # The cache instance type. Valid values are SMALL MEDIUM LARGE XLARGE LARGE_2X LARGE_4X LARGE_8X (not
        # available in all regions) LARGE_12X Historically, instance types were identified by an EC2-style
        # value. As of July 2020, this is deprecated, and the generic identifiers above should be used. The
        # following legacy instance types are available, but their use is discouraged: T2_SMALL : A t2.small
        # instance type. T2_MEDIUM : A t2.medium instance type. R4_LARGE : A r4.large instance type. R4_XLARGE
        # : A r4.xlarge instance type. R4_2XLARGE : A r4.2xlarge instance type. R4_4XLARGE : A r4.4xlarge
        # instance type. R4_8XLARGE : A r4.8xlarge instance type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @api_caching_behavior : String? = nil,
          @at_rest_encryption_enabled : Bool? = nil,
          @health_metrics_config : String? = nil,
          @status : String? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @ttl : Int64? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes an API key. Customers invoke AppSync GraphQL API operations with API keys as an identity
      # mechanism. There are two key versions: da1 : We introduced this version at launch in November 2017.
      # These keys always expire after 7 days. Amazon DynamoDB TTL manages key expiration. These keys ceased
      # to be valid after February 21, 2018, and they should no longer be used. ListApiKeys returns the
      # expiration time in milliseconds. CreateApiKey returns the expiration time in milliseconds.
      # UpdateApiKey is not available for this key version. DeleteApiKey deletes the item from the table.
      # Expiration is stored in DynamoDB as milliseconds. This results in a bug where keys are not
      # automatically deleted because DynamoDB expects the TTL to be stored in seconds. As a one-time
      # action, we deleted these keys from the table on February 21, 2018. da2 : We introduced this version
      # in February 2018 when AppSync added support to extend key expiration. ListApiKeys returns the
      # expiration time and deletion time in seconds. CreateApiKey returns the expiration time and deletion
      # time in seconds and accepts a user-provided expiration time in seconds. UpdateApiKey returns the
      # expiration time and and deletion time in seconds and accepts a user-provided expiration time in
      # seconds. Expired API keys are kept for 60 days after the expiration time. You can update the key
      # expiration time as long as the key isn't deleted. DeleteApiKey deletes the item from the table.
      # Expiration is stored in DynamoDB as seconds. After the expiration time, using the key to
      # authenticate will fail. However, you can reinstate the key before deletion. Deletion is stored in
      # DynamoDB as seconds. The key is deleted after deletion time.

      struct ApiKey
        include JSON::Serializable

        # The time after which the API key is deleted. The date is represented as seconds since the epoch,
        # rounded down to the nearest hour.

        @[JSON::Field(key: "deletes")]
        getter deletes : Int64?

        # A description of the purpose of the API key.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time after which the API key expires. The date is represented as seconds since the epoch,
        # rounded down to the nearest hour.

        @[JSON::Field(key: "expires")]
        getter expires : Int64?

        # The API key ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @deletes : Int64? = nil,
          @description : String? = nil,
          @expires : Int64? = nil,
          @id : String? = nil
        )
        end
      end

      # The API key exceeded a limit. Try your request again.

      struct ApiKeyLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The API key expiration must be set to a value between 1 and 365 days from creation (for CreateApiKey
      # ) or from update (for UpdateApiKey ).

      struct ApiKeyValidityOutOfBoundsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The GraphQL API exceeded a limit. Try your request again.

      struct ApiLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a runtime used by an Amazon Web Services AppSync pipeline resolver or Amazon Web Services
      # AppSync function. Specifies the name and version of the runtime to use. Note that if a runtime is
      # specified, code must also be specified.

      struct AppSyncRuntime
        include JSON::Serializable

        # The name of the runtime to use. Currently, the only allowed value is APPSYNC_JS .

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the runtime to use. Currently, the only allowed version is 1.0.0 .

        @[JSON::Field(key: "runtimeVersion")]
        getter runtime_version : String

        def initialize(
          @name : String,
          @runtime_version : String
        )
        end
      end


      struct AssociateApiRequest
        include JSON::Serializable

        # The API ID. Private APIs can not be associated with custom domains.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @api_id : String,
          @domain_name : String
        )
        end
      end


      struct AssociateApiResponse
        include JSON::Serializable

        # The ApiAssociation object.

        @[JSON::Field(key: "apiAssociation")]
        getter api_association : Types::ApiAssociation?

        def initialize(
          @api_association : Types::ApiAssociation? = nil
        )
        end
      end


      struct AssociateMergedGraphqlApiRequest
        include JSON::Serializable

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        # The identifier of the AppSync Source API. This is generated by the AppSync service. In most cases,
        # source APIs (especially in your account) only require the API ID value or ARN of the source API.
        # However, source APIs from other accounts (cross-account use cases) strictly require the full
        # resource ARN of the source API.

        @[JSON::Field(key: "sourceApiIdentifier")]
        getter source_api_identifier : String

        # The description field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The SourceApiAssociationConfig object data.

        @[JSON::Field(key: "sourceApiAssociationConfig")]
        getter source_api_association_config : Types::SourceApiAssociationConfig?

        def initialize(
          @merged_api_identifier : String,
          @source_api_identifier : String,
          @description : String? = nil,
          @source_api_association_config : Types::SourceApiAssociationConfig? = nil
        )
        end
      end


      struct AssociateMergedGraphqlApiResponse
        include JSON::Serializable

        # The SourceApiAssociation object data.

        @[JSON::Field(key: "sourceApiAssociation")]
        getter source_api_association : Types::SourceApiAssociation?

        def initialize(
          @source_api_association : Types::SourceApiAssociation? = nil
        )
        end
      end


      struct AssociateSourceGraphqlApiRequest
        include JSON::Serializable

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        # The identifier of the AppSync Source API. This is generated by the AppSync service. In most cases,
        # source APIs (especially in your account) only require the API ID value or ARN of the source API.
        # However, source APIs from other accounts (cross-account use cases) strictly require the full
        # resource ARN of the source API.

        @[JSON::Field(key: "sourceApiIdentifier")]
        getter source_api_identifier : String

        # The description field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The SourceApiAssociationConfig object data.

        @[JSON::Field(key: "sourceApiAssociationConfig")]
        getter source_api_association_config : Types::SourceApiAssociationConfig?

        def initialize(
          @merged_api_identifier : String,
          @source_api_identifier : String,
          @description : String? = nil,
          @source_api_association_config : Types::SourceApiAssociationConfig? = nil
        )
        end
      end


      struct AssociateSourceGraphqlApiResponse
        include JSON::Serializable

        # The SourceApiAssociation object data.

        @[JSON::Field(key: "sourceApiAssociation")]
        getter source_api_association : Types::SourceApiAssociation?

        def initialize(
          @source_api_association : Types::SourceApiAssociation? = nil
        )
        end
      end

      # Describes an authorization configuration. Use AuthMode to specify the publishing and subscription
      # authorization configuration for an Event API.

      struct AuthMode
        include JSON::Serializable

        # The authorization type.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        def initialize(
          @auth_type : String
        )
        end
      end

      # Describes an authorization provider.

      struct AuthProvider
        include JSON::Serializable

        # The authorization type.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # Describes an Amazon Cognito user pool configuration.

        @[JSON::Field(key: "cognitoConfig")]
        getter cognito_config : Types::CognitoConfig?


        @[JSON::Field(key: "lambdaAuthorizerConfig")]
        getter lambda_authorizer_config : Types::LambdaAuthorizerConfig?


        @[JSON::Field(key: "openIDConnectConfig")]
        getter open_id_connect_config : Types::OpenIDConnectConfig?

        def initialize(
          @auth_type : String,
          @cognito_config : Types::CognitoConfig? = nil,
          @lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
          @open_id_connect_config : Types::OpenIDConnectConfig? = nil
        )
        end
      end

      # The authorization configuration in case the HTTP endpoint requires authorization.

      struct AuthorizationConfig
        include JSON::Serializable

        # The authorization type that the HTTP endpoint requires. AWS_IAM : The authorization type is
        # Signature Version 4 (SigV4).

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String

        # The Identity and Access Management (IAM) settings.

        @[JSON::Field(key: "awsIamConfig")]
        getter aws_iam_config : Types::AwsIamConfig?

        def initialize(
          @authorization_type : String,
          @aws_iam_config : Types::AwsIamConfig? = nil
        )
        end
      end

      # The Identity and Access Management (IAM) configuration.

      struct AwsIamConfig
        include JSON::Serializable

        # The signing Amazon Web Services Region for IAM authorization.

        @[JSON::Field(key: "signingRegion")]
        getter signing_region : String?

        # The signing service name for IAM authorization.

        @[JSON::Field(key: "signingServiceName")]
        getter signing_service_name : String?

        def initialize(
          @signing_region : String? = nil,
          @signing_service_name : String? = nil
        )
        end
      end

      # Provides further details for the reason behind the bad request. For reason type CODE_ERROR , the
      # detail will contain a list of code errors.

      struct BadRequestDetail
        include JSON::Serializable

        # Contains the list of errors in the request.

        @[JSON::Field(key: "codeErrors")]
        getter code_errors : Array(Types::CodeError)?

        def initialize(
          @code_errors : Array(Types::CodeError)? = nil
        )
        end
      end

      # The request is not well formed. For example, a value is invalid or a required field is missing.
      # Check the field values, and then try again.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "detail")]
        getter detail : Types::BadRequestDetail?


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @detail : Types::BadRequestDetail? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The caching configuration for a resolver that has caching activated.

      struct CachingConfig
        include JSON::Serializable

        # The TTL in seconds for a resolver that has caching activated. Valid values are 1–3,600 seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : Int64

        # The caching keys for a resolver that has caching activated. Valid values are entries from the
        # $context.arguments , $context.source , and $context.identity maps.

        @[JSON::Field(key: "cachingKeys")]
        getter caching_keys : Array(String)?

        def initialize(
          @ttl : Int64,
          @caching_keys : Array(String)? = nil
        )
        end
      end

      # Describes a channel namespace associated with an Api . The ChannelNamespace contains the definitions
      # for code handlers for the Api .

      struct ChannelNamespace
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # The Amazon Resource Name (ARN) for the ChannelNamespace .

        @[JSON::Field(key: "channelNamespaceArn")]
        getter channel_namespace_arn : String?

        # The event handler functions that run custom business logic to process published events and subscribe
        # requests.

        @[JSON::Field(key: "codeHandlers")]
        getter code_handlers : String?

        # The date and time that the ChannelNamespace was created.

        @[JSON::Field(key: "created")]
        getter created : Time?

        # The configuration for the OnPublish and OnSubscribe handlers.

        @[JSON::Field(key: "handlerConfigs")]
        getter handler_configs : Types::HandlerConfigs?

        # The date and time that the ChannelNamespace was last changed.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?

        # The name of the channel namespace. This name must be unique within the Api .

        @[JSON::Field(key: "name")]
        getter name : String?

        # The authorization mode to use for publishing messages on the channel namespace. This configuration
        # overrides the default Api authorization configuration.

        @[JSON::Field(key: "publishAuthModes")]
        getter publish_auth_modes : Array(Types::AuthMode)?

        # The authorization mode to use for subscribing to messages on the channel namespace. This
        # configuration overrides the default Api authorization configuration.

        @[JSON::Field(key: "subscribeAuthModes")]
        getter subscribe_auth_modes : Array(Types::AuthMode)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_id : String? = nil,
          @channel_namespace_arn : String? = nil,
          @code_handlers : String? = nil,
          @created : Time? = nil,
          @handler_configs : Types::HandlerConfigs? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @publish_auth_modes : Array(Types::AuthMode)? = nil,
          @subscribe_auth_modes : Array(Types::AuthMode)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes an AppSync error.

      struct CodeError
        include JSON::Serializable

        # The type of code error. Examples include, but aren't limited to: LINT_ERROR , PARSER_ERROR .

        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        # The line, column, and span location of the error in the code.

        @[JSON::Field(key: "location")]
        getter location : Types::CodeErrorLocation?

        # A user presentable error. Examples include, but aren't limited to: Parsing error: Unterminated
        # string literal .

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @error_type : String? = nil,
          @location : Types::CodeErrorLocation? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes the location of the error in a code sample.

      struct CodeErrorLocation
        include JSON::Serializable

        # The column number in the code. Defaults to 0 if unknown.

        @[JSON::Field(key: "column")]
        getter column : Int32?

        # The line number in the code. Defaults to 0 if unknown.

        @[JSON::Field(key: "line")]
        getter line : Int32?

        # The span/length of the error. Defaults to -1 if unknown.

        @[JSON::Field(key: "span")]
        getter span : Int32?

        def initialize(
          @column : Int32? = nil,
          @line : Int32? = nil,
          @span : Int32? = nil
        )
        end
      end

      # Describes an Amazon Cognito configuration.

      struct CognitoConfig
        include JSON::Serializable

        # The Amazon Web Services Region in which the user pool was created.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The user pool ID.

        @[JSON::Field(key: "userPoolId")]
        getter user_pool_id : String

        # A regular expression for validating the incoming Amazon Cognito user pool app client ID. If this
        # value isn't set, no filtering is applied.

        @[JSON::Field(key: "appIdClientRegex")]
        getter app_id_client_regex : String?

        def initialize(
          @aws_region : String,
          @user_pool_id : String,
          @app_id_client_regex : String? = nil
        )
        end
      end

      # Describes an Amazon Cognito user pool configuration.

      struct CognitoUserPoolConfig
        include JSON::Serializable

        # The Amazon Web Services Region in which the user pool was created.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The user pool ID.

        @[JSON::Field(key: "userPoolId")]
        getter user_pool_id : String

        # A regular expression for validating the incoming Amazon Cognito user pool app client ID. If this
        # value isn't set, no filtering is applied.

        @[JSON::Field(key: "appIdClientRegex")]
        getter app_id_client_regex : String?

        def initialize(
          @aws_region : String,
          @user_pool_id : String,
          @app_id_client_regex : String? = nil
        )
        end
      end

      # Another modification is in progress at this time and it must complete before you can make your
      # change.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A conflict with a previous successful update is detected. This typically occurs when the previous
      # update did not have time to propagate before the next update was made. A retry (with appropriate
      # backoff logic) is the recommended response to this exception.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input of a CreateApiCache operation.

      struct CreateApiCacheRequest
        include JSON::Serializable

        # Caching behavior. FULL_REQUEST_CACHING : All requests from the same user are cached. Individual
        # resolvers are automatically cached. All API calls will try to return responses from the cache.
        # PER_RESOLVER_CACHING : Individual resolvers that you specify are cached. OPERATION_LEVEL_CACHING :
        # Full requests are cached together and returned without executing resolvers.

        @[JSON::Field(key: "apiCachingBehavior")]
        getter api_caching_behavior : String

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # TTL in seconds for cache entries. Valid values are 1–3,600 seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : Int64

        # The cache instance type. Valid values are SMALL MEDIUM LARGE XLARGE LARGE_2X LARGE_4X LARGE_8X (not
        # available in all regions) LARGE_12X Historically, instance types were identified by an EC2-style
        # value. As of July 2020, this is deprecated, and the generic identifiers above should be used. The
        # following legacy instance types are available, but their use is discouraged: T2_SMALL : A t2.small
        # instance type. T2_MEDIUM : A t2.medium instance type. R4_LARGE : A r4.large instance type. R4_XLARGE
        # : A r4.xlarge instance type. R4_2XLARGE : A r4.2xlarge instance type. R4_4XLARGE : A r4.4xlarge
        # instance type. R4_8XLARGE : A r4.8xlarge instance type.

        @[JSON::Field(key: "type")]
        getter type : String

        # At-rest encryption flag for cache. You cannot update this setting after creation.

        @[JSON::Field(key: "atRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # Controls how cache health metrics will be emitted to CloudWatch. Cache health metrics include:
        # NetworkBandwidthOutAllowanceExceeded: The network packets dropped because the throughput exceeded
        # the aggregated bandwidth limit. This is useful for diagnosing bottlenecks in a cache configuration.
        # EngineCPUUtilization: The CPU utilization (percentage) allocated to the Redis process. This is
        # useful for diagnosing bottlenecks in a cache configuration. Metrics will be recorded by API ID. You
        # can set the value to ENABLED or DISABLED .

        @[JSON::Field(key: "healthMetricsConfig")]
        getter health_metrics_config : String?

        # Transit encryption flag when connecting to cache. You cannot update this setting after creation.

        @[JSON::Field(key: "transitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        def initialize(
          @api_caching_behavior : String,
          @api_id : String,
          @ttl : Int64,
          @type : String,
          @at_rest_encryption_enabled : Bool? = nil,
          @health_metrics_config : String? = nil,
          @transit_encryption_enabled : Bool? = nil
        )
        end
      end

      # Represents the output of a CreateApiCache operation.

      struct CreateApiCacheResponse
        include JSON::Serializable

        # The ApiCache object.

        @[JSON::Field(key: "apiCache")]
        getter api_cache : Types::ApiCache?

        def initialize(
          @api_cache : Types::ApiCache? = nil
        )
        end
      end


      struct CreateApiKeyRequest
        include JSON::Serializable

        # The ID for your GraphQL API.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # A description of the purpose of the API key.

        @[JSON::Field(key: "description")]
        getter description : String?

        # From the creation time, the time after which the API key expires. The date is represented as seconds
        # since the epoch, rounded down to the nearest hour. The default value for this parameter is 7 days
        # from creation time. For more information, see .

        @[JSON::Field(key: "expires")]
        getter expires : Int64?

        def initialize(
          @api_id : String,
          @description : String? = nil,
          @expires : Int64? = nil
        )
        end
      end


      struct CreateApiKeyResponse
        include JSON::Serializable

        # The API key.

        @[JSON::Field(key: "apiKey")]
        getter api_key : Types::ApiKey?

        def initialize(
          @api_key : Types::ApiKey? = nil
        )
        end
      end


      struct CreateApiRequest
        include JSON::Serializable

        # The Event API configuration. This includes the default authorization configuration for connecting,
        # publishing, and subscribing to an Event API.

        @[JSON::Field(key: "eventConfig")]
        getter event_config : Types::EventConfig

        # The name for the Api .

        @[JSON::Field(key: "name")]
        getter name : String

        # The owner contact information for the Api .

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_config : Types::EventConfig,
          @name : String,
          @owner_contact : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApiResponse
        include JSON::Serializable

        # The Api object.

        @[JSON::Field(key: "api")]
        getter api : Types::Api?

        def initialize(
          @api : Types::Api? = nil
        )
        end
      end


      struct CreateChannelNamespaceRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the ChannelNamespace . This name must be unique within the Api

        @[JSON::Field(key: "name")]
        getter name : String

        # The event handler functions that run custom business logic to process published events and subscribe
        # requests.

        @[JSON::Field(key: "codeHandlers")]
        getter code_handlers : String?

        # The configuration for the OnPublish and OnSubscribe handlers.

        @[JSON::Field(key: "handlerConfigs")]
        getter handler_configs : Types::HandlerConfigs?

        # The authorization mode to use for publishing messages on the channel namespace. This configuration
        # overrides the default Api authorization configuration.

        @[JSON::Field(key: "publishAuthModes")]
        getter publish_auth_modes : Array(Types::AuthMode)?

        # The authorization mode to use for subscribing to messages on the channel namespace. This
        # configuration overrides the default Api authorization configuration.

        @[JSON::Field(key: "subscribeAuthModes")]
        getter subscribe_auth_modes : Array(Types::AuthMode)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_id : String,
          @name : String,
          @code_handlers : String? = nil,
          @handler_configs : Types::HandlerConfigs? = nil,
          @publish_auth_modes : Array(Types::AuthMode)? = nil,
          @subscribe_auth_modes : Array(Types::AuthMode)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateChannelNamespaceResponse
        include JSON::Serializable

        # The ChannelNamespace object.

        @[JSON::Field(key: "channelNamespace")]
        getter channel_namespace : Types::ChannelNamespace?

        def initialize(
          @channel_namespace : Types::ChannelNamespace? = nil
        )
        end
      end


      struct CreateDataSourceRequest
        include JSON::Serializable

        # The API ID for the GraphQL API for the DataSource .

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # A user-supplied name for the DataSource .

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the DataSource .

        @[JSON::Field(key: "type")]
        getter type : String

        # A description of the DataSource .

        @[JSON::Field(key: "description")]
        getter description : String?

        # Amazon DynamoDB settings.

        @[JSON::Field(key: "dynamodbConfig")]
        getter dynamodb_config : Types::DynamodbDataSourceConfig?

        # Amazon OpenSearch Service settings. As of September 2021, Amazon Elasticsearch service is Amazon
        # OpenSearch Service. This configuration is deprecated. For new data sources, use
        # CreateDataSourceRequest$openSearchServiceConfig to create an OpenSearch data source.

        @[JSON::Field(key: "elasticsearchConfig")]
        getter elasticsearch_config : Types::ElasticsearchDataSourceConfig?

        # Amazon EventBridge settings.

        @[JSON::Field(key: "eventBridgeConfig")]
        getter event_bridge_config : Types::EventBridgeDataSourceConfig?

        # HTTP endpoint settings.

        @[JSON::Field(key: "httpConfig")]
        getter http_config : Types::HttpDataSourceConfig?

        # Lambda settings.

        @[JSON::Field(key: "lambdaConfig")]
        getter lambda_config : Types::LambdaDataSourceConfig?

        # Enables or disables enhanced data source metrics for specified data sources. Note that metricsConfig
        # won't be used unless the dataSourceLevelMetricsBehavior value is set to PER_DATA_SOURCE_METRICS . If
        # the dataSourceLevelMetricsBehavior is set to FULL_REQUEST_DATA_SOURCE_METRICS instead, metricsConfig
        # will be ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # Amazon OpenSearch Service settings.

        @[JSON::Field(key: "openSearchServiceConfig")]
        getter open_search_service_config : Types::OpenSearchServiceDataSourceConfig?

        # Relational database settings.

        @[JSON::Field(key: "relationalDatabaseConfig")]
        getter relational_database_config : Types::RelationalDatabaseDataSourceConfig?

        # The Identity and Access Management (IAM) service role Amazon Resource Name (ARN) for the data
        # source. The system assumes this role when accessing the data source.

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String?

        def initialize(
          @api_id : String,
          @name : String,
          @type : String,
          @description : String? = nil,
          @dynamodb_config : Types::DynamodbDataSourceConfig? = nil,
          @elasticsearch_config : Types::ElasticsearchDataSourceConfig? = nil,
          @event_bridge_config : Types::EventBridgeDataSourceConfig? = nil,
          @http_config : Types::HttpDataSourceConfig? = nil,
          @lambda_config : Types::LambdaDataSourceConfig? = nil,
          @metrics_config : String? = nil,
          @open_search_service_config : Types::OpenSearchServiceDataSourceConfig? = nil,
          @relational_database_config : Types::RelationalDatabaseDataSourceConfig? = nil,
          @service_role_arn : String? = nil
        )
        end
      end


      struct CreateDataSourceResponse
        include JSON::Serializable

        # The DataSource object.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource?

        def initialize(
          @data_source : Types::DataSource? = nil
        )
        end
      end


      struct CreateDomainNameRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate. This can be an Certificate Manager (ACM)
        # certificate or an Identity and Access Management (IAM) server certificate.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # A description of the DomainName .

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @certificate_arn : String,
          @domain_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainNameResponse
        include JSON::Serializable

        # The configuration for the DomainName .

        @[JSON::Field(key: "domainNameConfig")]
        getter domain_name_config : Types::DomainNameConfig?

        def initialize(
          @domain_name_config : Types::DomainNameConfig? = nil
        )
        end
      end


      struct CreateFunctionRequest
        include JSON::Serializable

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The Function DataSource name.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String

        # The Function name. The function name does not have to be unique.

        @[JSON::Field(key: "name")]
        getter name : String

        # The function code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The Function description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the request mapping template. Currently, the supported value is 2018-05-29. Note that
        # when using VTL and mapping templates, the functionVersion is required.

        @[JSON::Field(key: "functionVersion")]
        getter function_version : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # The Function request mapping template. Functions support only the 2018-05-29 version of the request
        # mapping template.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The Function response mapping template.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?


        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        def initialize(
          @api_id : String,
          @data_source_name : String,
          @name : String,
          @code : String? = nil,
          @description : String? = nil,
          @function_version : String? = nil,
          @max_batch_size : Int32? = nil,
          @request_mapping_template : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil
        )
        end
      end


      struct CreateFunctionResponse
        include JSON::Serializable

        # The Function object.

        @[JSON::Field(key: "functionConfiguration")]
        getter function_configuration : Types::FunctionConfiguration?

        def initialize(
          @function_configuration : Types::FunctionConfiguration? = nil
        )
        end
      end


      struct CreateGraphqlApiRequest
        include JSON::Serializable

        # The authentication type: API key, Identity and Access Management (IAM), OpenID Connect (OIDC),
        # Amazon Cognito user pools, or Lambda.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String

        # A user-supplied name for the GraphqlApi .

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of additional authentication providers for the GraphqlApi API.

        @[JSON::Field(key: "additionalAuthenticationProviders")]
        getter additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)?

        # The value that indicates whether the GraphQL API is a standard API ( GRAPHQL ) or merged API (
        # MERGED ).

        @[JSON::Field(key: "apiType")]
        getter api_type : String?

        # The enhancedMetricsConfig object.

        @[JSON::Field(key: "enhancedMetricsConfig")]
        getter enhanced_metrics_config : Types::EnhancedMetricsConfig?

        # Sets the value of the GraphQL API to enable ( ENABLED ) or disable ( DISABLED ) introspection. If no
        # value is provided, the introspection configuration will be set to ENABLED by default. This field
        # will produce an error if the operation attempts to use the introspection feature while this field is
        # disabled. For more information about introspection, see GraphQL introspection .

        @[JSON::Field(key: "introspectionConfig")]
        getter introspection_config : String?

        # Configuration for Lambda function authorization.

        @[JSON::Field(key: "lambdaAuthorizerConfig")]
        getter lambda_authorizer_config : Types::LambdaAuthorizerConfig?

        # The Amazon CloudWatch Logs configuration.

        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::LogConfig?

        # The Identity and Access Management service role ARN for a merged API. The AppSync service assumes
        # this role on behalf of the Merged API to validate access to source APIs at runtime and to prompt the
        # AUTO_MERGE to update the merged API endpoint with the source API changes automatically.

        @[JSON::Field(key: "mergedApiExecutionRoleArn")]
        getter merged_api_execution_role_arn : String?

        # The OIDC configuration.

        @[JSON::Field(key: "openIDConnectConfig")]
        getter open_id_connect_config : Types::OpenIDConnectConfig?

        # The owner contact information for an API resource. This field accepts any string input with a length
        # of 0 - 256 characters.

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?

        # The maximum depth a query can have in a single request. Depth refers to the amount of nested levels
        # allowed in the body of query. The default value is 0 (or unspecified), which indicates there's no
        # depth limit. If you set a limit, it can be between 1 and 75 nested levels. This field will produce a
        # limit error if the operation falls out of bounds. Note that fields can still be set to nullable or
        # non-nullable. If a non-nullable field produces an error, the error will be thrown upwards to the
        # first nullable field available.

        @[JSON::Field(key: "queryDepthLimit")]
        getter query_depth_limit : Int32?

        # The maximum number of resolvers that can be invoked in a single request. The default value is 0 (or
        # unspecified), which will set the limit to 10000 . When specified, the limit value can be between 1
        # and 10000 . This field will produce a limit error if the operation falls out of bounds.

        @[JSON::Field(key: "resolverCountLimit")]
        getter resolver_count_limit : Int32?

        # A TagMap object.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Cognito user pool configuration.

        @[JSON::Field(key: "userPoolConfig")]
        getter user_pool_config : Types::UserPoolConfig?

        # Sets the value of the GraphQL API to public ( GLOBAL ) or private ( PRIVATE ). If no value is
        # provided, the visibility will be set to GLOBAL by default. This value cannot be changed once the API
        # has been created.

        @[JSON::Field(key: "visibility")]
        getter visibility : String?

        # A flag indicating whether to use X-Ray tracing for the GraphqlApi .

        @[JSON::Field(key: "xrayEnabled")]
        getter xray_enabled : Bool?

        def initialize(
          @authentication_type : String,
          @name : String,
          @additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)? = nil,
          @api_type : String? = nil,
          @enhanced_metrics_config : Types::EnhancedMetricsConfig? = nil,
          @introspection_config : String? = nil,
          @lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
          @log_config : Types::LogConfig? = nil,
          @merged_api_execution_role_arn : String? = nil,
          @open_id_connect_config : Types::OpenIDConnectConfig? = nil,
          @owner_contact : String? = nil,
          @query_depth_limit : Int32? = nil,
          @resolver_count_limit : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @user_pool_config : Types::UserPoolConfig? = nil,
          @visibility : String? = nil,
          @xray_enabled : Bool? = nil
        )
        end
      end


      struct CreateGraphqlApiResponse
        include JSON::Serializable

        # The GraphqlApi .

        @[JSON::Field(key: "graphqlApi")]
        getter graphql_api : Types::GraphqlApi?

        def initialize(
          @graphql_api : Types::GraphqlApi? = nil
        )
        end
      end


      struct CreateResolverRequest
        include JSON::Serializable

        # The ID for the GraphQL API for which the resolver is being created.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the field to attach the resolver to.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The name of the Type .

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The caching configuration for the resolver.

        @[JSON::Field(key: "cachingConfig")]
        getter caching_config : Types::CachingConfig?

        # The resolver code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The name of the data source for which the resolver is being created.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String?

        # The resolver type. UNIT : A UNIT resolver type. A UNIT resolver is the default resolver type. You
        # can use a UNIT resolver to run a GraphQL query against a single data source. PIPELINE : A PIPELINE
        # resolver type. You can use a PIPELINE resolver to invoke a series of Function objects in a serial
        # manner. You can use a pipeline resolver to run a GraphQL query against multiple data sources.

        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # Enables or disables enhanced resolver metrics for specified resolvers. Note that metricsConfig won't
        # be used unless the resolverLevelMetricsBehavior value is set to PER_RESOLVER_METRICS . If the
        # resolverLevelMetricsBehavior is set to FULL_REQUEST_RESOLVER_METRICS instead, metricsConfig will be
        # ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # The PipelineConfig .

        @[JSON::Field(key: "pipelineConfig")]
        getter pipeline_config : Types::PipelineConfig?

        # The mapping template to use for requests. A resolver uses a request mapping template to convert a
        # GraphQL expression into a format that a data source can understand. Mapping templates are written in
        # Apache Velocity Template Language (VTL). VTL request mapping templates are optional when using an
        # Lambda data source. For all other data sources, VTL request and response mapping templates are
        # required.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The mapping template to use for responses from the data source.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?

        # The SyncConfig for a resolver attached to a versioned data source.

        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        def initialize(
          @api_id : String,
          @field_name : String,
          @type_name : String,
          @caching_config : Types::CachingConfig? = nil,
          @code : String? = nil,
          @data_source_name : String? = nil,
          @kind : String? = nil,
          @max_batch_size : Int32? = nil,
          @metrics_config : String? = nil,
          @pipeline_config : Types::PipelineConfig? = nil,
          @request_mapping_template : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil
        )
        end
      end


      struct CreateResolverResponse
        include JSON::Serializable

        # The Resolver object.

        @[JSON::Field(key: "resolver")]
        getter resolver : Types::Resolver?

        def initialize(
          @resolver : Types::Resolver? = nil
        )
        end
      end


      struct CreateTypeRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The type definition, in GraphQL Schema Definition Language (SDL) format. For more information, see
        # the GraphQL SDL documentation .

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The type format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String

        def initialize(
          @api_id : String,
          @definition : String,
          @format : String
        )
        end
      end


      struct CreateTypeResponse
        include JSON::Serializable

        # The Type object.

        @[JSON::Field(key: "type")]
        getter type : Types::Type?

        def initialize(
          @type : Types::Type? = nil
        )
        end
      end

      # Describes a data source.

      struct DataSource
        include JSON::Serializable

        # The data source Amazon Resource Name (ARN).

        @[JSON::Field(key: "dataSourceArn")]
        getter data_source_arn : String?

        # The description of the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        # DynamoDB settings.

        @[JSON::Field(key: "dynamodbConfig")]
        getter dynamodb_config : Types::DynamodbDataSourceConfig?

        # Amazon OpenSearch Service settings.

        @[JSON::Field(key: "elasticsearchConfig")]
        getter elasticsearch_config : Types::ElasticsearchDataSourceConfig?

        # Amazon EventBridge settings.

        @[JSON::Field(key: "eventBridgeConfig")]
        getter event_bridge_config : Types::EventBridgeDataSourceConfig?

        # HTTP endpoint settings.

        @[JSON::Field(key: "httpConfig")]
        getter http_config : Types::HttpDataSourceConfig?

        # Lambda settings.

        @[JSON::Field(key: "lambdaConfig")]
        getter lambda_config : Types::LambdaDataSourceConfig?

        # Enables or disables enhanced data source metrics for specified data sources. Note that metricsConfig
        # won't be used unless the dataSourceLevelMetricsBehavior value is set to PER_DATA_SOURCE_METRICS . If
        # the dataSourceLevelMetricsBehavior is set to FULL_REQUEST_DATA_SOURCE_METRICS instead, metricsConfig
        # will be ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Amazon OpenSearch Service settings.

        @[JSON::Field(key: "openSearchServiceConfig")]
        getter open_search_service_config : Types::OpenSearchServiceDataSourceConfig?

        # Relational database settings.

        @[JSON::Field(key: "relationalDatabaseConfig")]
        getter relational_database_config : Types::RelationalDatabaseDataSourceConfig?

        # The Identity and Access Management (IAM) service role Amazon Resource Name (ARN) for the data
        # source. The system assumes this role when accessing the data source.

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String?

        # The type of the data source. AWS_LAMBDA : The data source is an Lambda function. AMAZON_DYNAMODB :
        # The data source is an Amazon DynamoDB table. AMAZON_ELASTICSEARCH : The data source is an Amazon
        # OpenSearch Service domain. AMAZON_OPENSEARCH_SERVICE : The data source is an Amazon OpenSearch
        # Service domain. AMAZON_EVENTBRIDGE : The data source is an Amazon EventBridge configuration.
        # AMAZON_BEDROCK_RUNTIME : The data source is the Amazon Bedrock runtime. NONE : There is no data
        # source. Use this type when you want to invoke a GraphQL operation without connecting to a data
        # source, such as when you're performing data transformation with resolvers or invoking a subscription
        # from a mutation. HTTP : The data source is an HTTP endpoint. RELATIONAL_DATABASE : The data source
        # is a relational database.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @data_source_arn : String? = nil,
          @description : String? = nil,
          @dynamodb_config : Types::DynamodbDataSourceConfig? = nil,
          @elasticsearch_config : Types::ElasticsearchDataSourceConfig? = nil,
          @event_bridge_config : Types::EventBridgeDataSourceConfig? = nil,
          @http_config : Types::HttpDataSourceConfig? = nil,
          @lambda_config : Types::LambdaDataSourceConfig? = nil,
          @metrics_config : String? = nil,
          @name : String? = nil,
          @open_search_service_config : Types::OpenSearchServiceDataSourceConfig? = nil,
          @relational_database_config : Types::RelationalDatabaseDataSourceConfig? = nil,
          @service_role_arn : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains the introspected data that was retrieved from the data source.

      struct DataSourceIntrospectionModel
        include JSON::Serializable

        # The DataSourceIntrospectionModelField object data.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::DataSourceIntrospectionModelField)?

        # The array of DataSourceIntrospectionModelIndex objects.

        @[JSON::Field(key: "indexes")]
        getter indexes : Array(Types::DataSourceIntrospectionModelIndex)?

        # The name of the model. For example, this could be the name of a single table in a database.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The primary key stored as a DataSourceIntrospectionModelIndex object.

        @[JSON::Field(key: "primaryKey")]
        getter primary_key : Types::DataSourceIntrospectionModelIndex?

        # Contains the output of the SDL that was generated from the introspected types. This is controlled by
        # the includeModelsSDL parameter of the GetDataSourceIntrospection operation.

        @[JSON::Field(key: "sdl")]
        getter sdl : String?

        def initialize(
          @fields : Array(Types::DataSourceIntrospectionModelField)? = nil,
          @indexes : Array(Types::DataSourceIntrospectionModelIndex)? = nil,
          @name : String? = nil,
          @primary_key : Types::DataSourceIntrospectionModelIndex? = nil,
          @sdl : String? = nil
        )
        end
      end

      # Represents the fields that were retrieved from the introspected data.

      struct DataSourceIntrospectionModelField
        include JSON::Serializable

        # The length value of the introspected field.

        @[JSON::Field(key: "length")]
        getter length : Int64?

        # The name of the field that was retrieved from the introspected data.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The DataSourceIntrospectionModelFieldType object data.

        @[JSON::Field(key: "type")]
        getter type : Types::DataSourceIntrospectionModelFieldType?

        def initialize(
          @length : Int64? = nil,
          @name : String? = nil,
          @type : Types::DataSourceIntrospectionModelFieldType? = nil
        )
        end
      end

      # Represents the type data for each field retrieved from the introspection.

      struct DataSourceIntrospectionModelFieldType
        include JSON::Serializable

        # Specifies the classification of data. For example, this could be set to values like Scalar or
        # NonNull to indicate a fundamental property of the field. Valid values include: Scalar : Indicates
        # the value is a primitive type (scalar). NonNull : Indicates the field cannot be null . List :
        # Indicates the field contains a list.

        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The name of the data type that represents the field. For example, String is a valid name value.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The DataSourceIntrospectionModelFieldType object data. The type is only present if
        # DataSourceIntrospectionModelFieldType.kind is set to NonNull or List . The type typically contains
        # its own kind and name fields to represent the actual type data. For instance, type could contain a
        # kind value of Scalar with a name value of String . The values Scalar and String will be collectively
        # stored in the values field.

        @[JSON::Field(key: "type")]
        getter type : Types::DataSourceIntrospectionModelFieldType?

        # The values of the type field. This field represents the AppSync data type equivalent of the
        # introspected field.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @kind : String? = nil,
          @name : String? = nil,
          @type : Types::DataSourceIntrospectionModelFieldType? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The index that was retrieved from the introspected data.

      struct DataSourceIntrospectionModelIndex
        include JSON::Serializable

        # The fields of the index.

        @[JSON::Field(key: "fields")]
        getter fields : Array(String)?

        # The name of the index.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @fields : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents the output of a DataSourceIntrospectionResult . This is the populated result of a
      # GetDataSourceIntrospection operation.

      struct DataSourceIntrospectionResult
        include JSON::Serializable

        # The array of DataSourceIntrospectionModel objects.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::DataSourceIntrospectionModel)?

        # Determines the number of types to be returned in a single response before paginating. This value is
        # typically taken from nextToken value from the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @models : Array(Types::DataSourceIntrospectionModel)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a DeleteApiCache operation.

      struct DeleteApiCacheRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end

      # Represents the output of a DeleteApiCache operation.

      struct DeleteApiCacheResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApiKeyRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The ID for the API key.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @api_id : String,
          @id : String
        )
        end
      end


      struct DeleteApiKeyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApiRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct DeleteApiResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteChannelNamespaceRequest
        include JSON::Serializable

        # The ID of the Api associated with the ChannelNamespace .

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the ChannelNamespace .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_id : String,
          @name : String
        )
        end
      end


      struct DeleteChannelNamespaceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataSourceRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_id : String,
          @name : String
        )
        end
      end


      struct DeleteDataSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDomainNameRequest
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DeleteDomainNameResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFunctionRequest
        include JSON::Serializable

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The Function ID.

        @[JSON::Field(key: "functionId")]
        getter function_id : String

        def initialize(
          @api_id : String,
          @function_id : String
        )
        end
      end


      struct DeleteFunctionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGraphqlApiRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct DeleteGraphqlApiResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResolverRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The resolver field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The name of the resolver type.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @api_id : String,
          @field_name : String,
          @type_name : String
        )
        end
      end


      struct DeleteResolverResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTypeRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @api_id : String,
          @type_name : String
        )
        end
      end


      struct DeleteTypeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a Delta Sync configuration.

      struct DeltaSyncConfig
        include JSON::Serializable

        # The number of minutes that an Item is stored in the data source.

        @[JSON::Field(key: "baseTableTTL")]
        getter base_table_ttl : Int64?

        # The Delta Sync table name.

        @[JSON::Field(key: "deltaSyncTableName")]
        getter delta_sync_table_name : String?

        # The number of minutes that a Delta Sync log entry is stored in the Delta Sync table.

        @[JSON::Field(key: "deltaSyncTableTTL")]
        getter delta_sync_table_ttl : Int64?

        def initialize(
          @base_table_ttl : Int64? = nil,
          @delta_sync_table_name : String? = nil,
          @delta_sync_table_ttl : Int64? = nil
        )
        end
      end


      struct DisassociateApiRequest
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DisassociateApiResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateMergedGraphqlApiRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The identifier of the AppSync Source API. This is generated by the AppSync service. In most cases,
        # source APIs (especially in your account) only require the API ID value or ARN of the source API.
        # However, source APIs from other accounts (cross-account use cases) strictly require the full
        # resource ARN of the source API.

        @[JSON::Field(key: "sourceApiIdentifier")]
        getter source_api_identifier : String

        def initialize(
          @association_id : String,
          @source_api_identifier : String
        )
        end
      end


      struct DisassociateMergedGraphqlApiResponse
        include JSON::Serializable

        # The state of the source API association.

        @[JSON::Field(key: "sourceApiAssociationStatus")]
        getter source_api_association_status : String?

        def initialize(
          @source_api_association_status : String? = nil
        )
        end
      end


      struct DisassociateSourceGraphqlApiRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        def initialize(
          @association_id : String,
          @merged_api_identifier : String
        )
        end
      end


      struct DisassociateSourceGraphqlApiResponse
        include JSON::Serializable

        # The state of the source API association.

        @[JSON::Field(key: "sourceApiAssociationStatus")]
        getter source_api_association_status : String?

        def initialize(
          @source_api_association_status : String? = nil
        )
        end
      end

      # Describes a configuration for a custom domain.

      struct DomainNameConfig
        include JSON::Serializable

        # The domain name that AppSync provides.

        @[JSON::Field(key: "appsyncDomainName")]
        getter appsync_domain_name : String?

        # The Amazon Resource Name (ARN) of the certificate. This can be an Certificate Manager (ACM)
        # certificate or an Identity and Access Management (IAM) server certificate.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # A description of the DomainName configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The Amazon Resource Name (ARN) of the domain name.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?

        # The ID of your Amazon Route 53 hosted zone.

        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @appsync_domain_name : String? = nil,
          @certificate_arn : String? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @domain_name_arn : String? = nil,
          @hosted_zone_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes an Amazon DynamoDB data source configuration.

      struct DynamodbDataSourceConfig
        include JSON::Serializable

        # The Amazon Web Services Region.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The table name.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The DeltaSyncConfig for a versioned data source.

        @[JSON::Field(key: "deltaSyncConfig")]
        getter delta_sync_config : Types::DeltaSyncConfig?

        # Set to TRUE to use Amazon Cognito credentials with this data source.

        @[JSON::Field(key: "useCallerCredentials")]
        getter use_caller_credentials : Bool?

        # Set to TRUE to use Conflict Detection and Resolution with this data source.

        @[JSON::Field(key: "versioned")]
        getter versioned : Bool?

        def initialize(
          @aws_region : String,
          @table_name : String,
          @delta_sync_config : Types::DeltaSyncConfig? = nil,
          @use_caller_credentials : Bool? = nil,
          @versioned : Bool? = nil
        )
        end
      end

      # Describes an OpenSearch data source configuration. As of September 2021, Amazon Elasticsearch
      # service is Amazon OpenSearch Service. This configuration is deprecated. For new data sources, use
      # OpenSearchServiceDataSourceConfig to specify an OpenSearch data source.

      struct ElasticsearchDataSourceConfig
        include JSON::Serializable

        # The Amazon Web Services Region.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        def initialize(
          @aws_region : String,
          @endpoint : String
        )
        end
      end

      # Enables and controls the enhanced metrics feature. Enhanced metrics emit granular data on API usage
      # and performance such as AppSync request and error counts, latency, and cache hits/misses. All
      # enhanced metric data is sent to your CloudWatch account, and you can configure the types of data
      # that will be sent. Enhanced metrics can be configured at the resolver, data source, and operation
      # levels. EnhancedMetricsConfig contains three required parameters, each controlling one of these
      # categories: resolverLevelMetricsBehavior : Controls how resolver metrics will be emitted to
      # CloudWatch. Resolver metrics include: GraphQL errors: The number of GraphQL errors that occurred.
      # Requests: The number of invocations that occurred during a request. Latency: The time to complete a
      # resolver invocation. Cache hits: The number of cache hits during a request. Cache misses: The number
      # of cache misses during a request. These metrics can be emitted to CloudWatch per resolver or for all
      # resolvers in the request. Metrics will be recorded by API ID and resolver name.
      # resolverLevelMetricsBehavior accepts one of these values at a time: FULL_REQUEST_RESOLVER_METRICS :
      # Records and emits metric data for all resolvers in the request. PER_RESOLVER_METRICS : Records and
      # emits metric data for resolvers that have the metricsConfig value set to ENABLED .
      # dataSourceLevelMetricsBehavior : Controls how data source metrics will be emitted to CloudWatch.
      # Data source metrics include: Requests: The number of invocations that occured during a request.
      # Latency: The time to complete a data source invocation. Errors: The number of errors that occurred
      # during a data source invocation. These metrics can be emitted to CloudWatch per data source or for
      # all data sources in the request. Metrics will be recorded by API ID and data source name.
      # dataSourceLevelMetricsBehavior accepts one of these values at a time:
      # FULL_REQUEST_DATA_SOURCE_METRICS : Records and emits metric data for all data sources in the
      # request. PER_DATA_SOURCE_METRICS : Records and emits metric data for data sources that have the
      # metricsConfig value set to ENABLED . operationLevelMetricsConfig : Controls how operation metrics
      # will be emitted to CloudWatch. Operation metrics include: Requests: The number of times a specified
      # GraphQL operation was called. GraphQL errors: The number of GraphQL errors that occurred during a
      # specified GraphQL operation. Metrics will be recorded by API ID and operation name. You can set the
      # value to ENABLED or DISABLED .

      struct EnhancedMetricsConfig
        include JSON::Serializable

        # Controls how data source metrics will be emitted to CloudWatch. Data source metrics include:
        # Requests: The number of invocations that occured during a request. Latency: The time to complete a
        # data source invocation. Errors: The number of errors that occurred during a data source invocation.
        # These metrics can be emitted to CloudWatch per data source or for all data sources in the request.
        # Metrics will be recorded by API ID and data source name. dataSourceLevelMetricsBehavior accepts one
        # of these values at a time: FULL_REQUEST_DATA_SOURCE_METRICS : Records and emits metric data for all
        # data sources in the request. PER_DATA_SOURCE_METRICS : Records and emits metric data for data
        # sources that have the metricsConfig value set to ENABLED .

        @[JSON::Field(key: "dataSourceLevelMetricsBehavior")]
        getter data_source_level_metrics_behavior : String

        # Controls how operation metrics will be emitted to CloudWatch. Operation metrics include: Requests:
        # The number of times a specified GraphQL operation was called. GraphQL errors: The number of GraphQL
        # errors that occurred during a specified GraphQL operation. Metrics will be recorded by API ID and
        # operation name. You can set the value to ENABLED or DISABLED .

        @[JSON::Field(key: "operationLevelMetricsConfig")]
        getter operation_level_metrics_config : String

        # Controls how resolver metrics will be emitted to CloudWatch. Resolver metrics include: GraphQL
        # errors: The number of GraphQL errors that occurred. Requests: The number of invocations that
        # occurred during a request. Latency: The time to complete a resolver invocation. Cache hits: The
        # number of cache hits during a request. Cache misses: The number of cache misses during a request.
        # These metrics can be emitted to CloudWatch per resolver or for all resolvers in the request. Metrics
        # will be recorded by API ID and resolver name. resolverLevelMetricsBehavior accepts one of these
        # values at a time: FULL_REQUEST_RESOLVER_METRICS : Records and emits metric data for all resolvers in
        # the request. PER_RESOLVER_METRICS : Records and emits metric data for resolvers that have the
        # metricsConfig value set to ENABLED .

        @[JSON::Field(key: "resolverLevelMetricsBehavior")]
        getter resolver_level_metrics_behavior : String

        def initialize(
          @data_source_level_metrics_behavior : String,
          @operation_level_metrics_config : String,
          @resolver_level_metrics_behavior : String
        )
        end
      end

      # Contains the list of errors generated. When using JavaScript, this will apply to the request or
      # response function evaluation.

      struct ErrorDetail
        include JSON::Serializable

        # The error payload.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the list of errors from a code evaluation response.

      struct EvaluateCodeErrorDetail
        include JSON::Serializable

        # Contains the list of CodeError objects.

        @[JSON::Field(key: "codeErrors")]
        getter code_errors : Array(Types::CodeError)?

        # The error payload.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code_errors : Array(Types::CodeError)? = nil,
          @message : String? = nil
        )
        end
      end


      struct EvaluateCodeRequest
        include JSON::Serializable

        # The code definition to be evaluated. Note that code and runtime are both required for this action.
        # The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String

        # The map that holds all of the contextual information for your resolver invocation. A context is
        # required for this action.

        @[JSON::Field(key: "context")]
        getter context : String

        # The runtime to be used when evaluating the code. Currently, only the APPSYNC_JS runtime is
        # supported.

        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime

        # The function within the code to be evaluated. If provided, the valid values are request and response
        # .

        @[JSON::Field(key: "function")]
        getter function : String?

        def initialize(
          @code : String,
          @context : String,
          @runtime : Types::AppSyncRuntime,
          @function : String? = nil
        )
        end
      end


      struct EvaluateCodeResponse
        include JSON::Serializable

        # Contains the payload of the response error.

        @[JSON::Field(key: "error")]
        getter error : Types::EvaluateCodeErrorDetail?

        # The result of the evaluation operation.

        @[JSON::Field(key: "evaluationResult")]
        getter evaluation_result : String?

        # A list of logs that were generated by calls to util.log.info and util.log.error in the evaluated
        # code.

        @[JSON::Field(key: "logs")]
        getter logs : Array(String)?

        # The list of runtime errors that are added to the GraphQL operation response.

        @[JSON::Field(key: "outErrors")]
        getter out_errors : String?

        # An object available inside each resolver and function handler. A single stash object lives through a
        # single resolver run. Therefore, you can use the stash to pass arbitrary data across request and
        # response handlers and across functions in a pipeline resolver.

        @[JSON::Field(key: "stash")]
        getter stash : String?

        def initialize(
          @error : Types::EvaluateCodeErrorDetail? = nil,
          @evaluation_result : String? = nil,
          @logs : Array(String)? = nil,
          @out_errors : String? = nil,
          @stash : String? = nil
        )
        end
      end


      struct EvaluateMappingTemplateRequest
        include JSON::Serializable

        # The map that holds all of the contextual information for your resolver invocation. A context is
        # required for this action.

        @[JSON::Field(key: "context")]
        getter context : String

        # The mapping template; this can be a request or response template. A template is required for this
        # action.

        @[JSON::Field(key: "template")]
        getter template : String

        def initialize(
          @context : String,
          @template : String
        )
        end
      end


      struct EvaluateMappingTemplateResponse
        include JSON::Serializable

        # The ErrorDetail object.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The mapping template; this can be a request or response template.

        @[JSON::Field(key: "evaluationResult")]
        getter evaluation_result : String?

        # A list of logs that were generated by calls to util.log.info and util.log.error in the evaluated
        # code.

        @[JSON::Field(key: "logs")]
        getter logs : Array(String)?

        # The list of runtime errors that are added to the GraphQL operation response.

        @[JSON::Field(key: "outErrors")]
        getter out_errors : String?

        # An object available inside each resolver and function handler. A single stash object lives through a
        # single resolver run. Therefore, you can use the stash to pass arbitrary data across request and
        # response handlers and across functions in a pipeline resolver.

        @[JSON::Field(key: "stash")]
        getter stash : String?

        def initialize(
          @error : Types::ErrorDetail? = nil,
          @evaluation_result : String? = nil,
          @logs : Array(String)? = nil,
          @out_errors : String? = nil,
          @stash : String? = nil
        )
        end
      end

      # Describes an Amazon EventBridge bus data source configuration.

      struct EventBridgeDataSourceConfig
        include JSON::Serializable

        # The ARN of the event bus. For more information about event buses, see Amazon EventBridge event buses
        # .

        @[JSON::Field(key: "eventBusArn")]
        getter event_bus_arn : String

        def initialize(
          @event_bus_arn : String
        )
        end
      end

      # Describes the authorization configuration for connections, message publishing, message
      # subscriptions, and logging for an Event API.

      struct EventConfig
        include JSON::Serializable

        # A list of authorization providers.

        @[JSON::Field(key: "authProviders")]
        getter auth_providers : Array(Types::AuthProvider)

        # A list of valid authorization modes for the Event API connections.

        @[JSON::Field(key: "connectionAuthModes")]
        getter connection_auth_modes : Array(Types::AuthMode)

        # A list of valid authorization modes for the Event API publishing.

        @[JSON::Field(key: "defaultPublishAuthModes")]
        getter default_publish_auth_modes : Array(Types::AuthMode)

        # A list of valid authorization modes for the Event API subscriptions.

        @[JSON::Field(key: "defaultSubscribeAuthModes")]
        getter default_subscribe_auth_modes : Array(Types::AuthMode)

        # The CloudWatch Logs configuration for the Event API.

        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::EventLogConfig?

        def initialize(
          @auth_providers : Array(Types::AuthProvider),
          @connection_auth_modes : Array(Types::AuthMode),
          @default_publish_auth_modes : Array(Types::AuthMode),
          @default_subscribe_auth_modes : Array(Types::AuthMode),
          @log_config : Types::EventLogConfig? = nil
        )
        end
      end

      # Describes the CloudWatch Logs configuration for the Event API.

      struct EventLogConfig
        include JSON::Serializable

        # The IAM service role that AppSync assumes to publish CloudWatch Logs in your account.

        @[JSON::Field(key: "cloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String

        # The type of information to log for the Event API.

        @[JSON::Field(key: "logLevel")]
        getter log_level : String

        def initialize(
          @cloud_watch_logs_role_arn : String,
          @log_level : String
        )
        end
      end

      # Represents the input of a FlushApiCache operation.

      struct FlushApiCacheRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end

      # Represents the output of a FlushApiCache operation.

      struct FlushApiCacheResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A function is a reusable entity. You can use multiple functions to compose the resolver logic.

      struct FunctionConfiguration
        include JSON::Serializable

        # The function code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The name of the DataSource .

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String?

        # The Function description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the Function object.

        @[JSON::Field(key: "functionArn")]
        getter function_arn : String?

        # A unique ID representing the Function object.

        @[JSON::Field(key: "functionId")]
        getter function_id : String?

        # The version of the request mapping template. Currently, only the 2018-05-29 version of the template
        # is supported.

        @[JSON::Field(key: "functionVersion")]
        getter function_version : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # The name of the Function object.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Function request mapping template. Functions support only the 2018-05-29 version of the request
        # mapping template.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The Function response mapping template.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?


        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        def initialize(
          @code : String? = nil,
          @data_source_name : String? = nil,
          @description : String? = nil,
          @function_arn : String? = nil,
          @function_id : String? = nil,
          @function_version : String? = nil,
          @max_batch_size : Int32? = nil,
          @name : String? = nil,
          @request_mapping_template : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil
        )
        end
      end


      struct GetApiAssociationRequest
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct GetApiAssociationResponse
        include JSON::Serializable

        # The ApiAssociation object.

        @[JSON::Field(key: "apiAssociation")]
        getter api_association : Types::ApiAssociation?

        def initialize(
          @api_association : Types::ApiAssociation? = nil
        )
        end
      end

      # Represents the input of a GetApiCache operation.

      struct GetApiCacheRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end

      # Represents the output of a GetApiCache operation.

      struct GetApiCacheResponse
        include JSON::Serializable

        # The ApiCache object.

        @[JSON::Field(key: "apiCache")]
        getter api_cache : Types::ApiCache?

        def initialize(
          @api_cache : Types::ApiCache? = nil
        )
        end
      end


      struct GetApiRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct GetApiResponse
        include JSON::Serializable

        # The Api object.

        @[JSON::Field(key: "api")]
        getter api : Types::Api?

        def initialize(
          @api : Types::Api? = nil
        )
        end
      end


      struct GetChannelNamespaceRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the ChannelNamespace .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_id : String,
          @name : String
        )
        end
      end


      struct GetChannelNamespaceResponse
        include JSON::Serializable

        # The ChannelNamespace object.

        @[JSON::Field(key: "channelNamespace")]
        getter channel_namespace : Types::ChannelNamespace?

        def initialize(
          @channel_namespace : Types::ChannelNamespace? = nil
        )
        end
      end


      struct GetDataSourceIntrospectionRequest
        include JSON::Serializable

        # The introspection ID. Each introspection contains a unique ID that can be used to reference the
        # instrospection record.

        @[JSON::Field(key: "introspectionId")]
        getter introspection_id : String

        # A boolean flag that determines whether SDL should be generated for introspected types. If set to
        # true , each model will contain an sdl property that contains the SDL for that type. The SDL only
        # contains the type data and no additional metadata or directives.

        @[JSON::Field(key: "includeModelsSDL")]
        getter include_models_sdl : Bool?

        # The maximum number of introspected types that will be returned in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Determines the number of types to be returned in a single response before paginating. This value is
        # typically taken from nextToken value from the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @introspection_id : String,
          @include_models_sdl : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDataSourceIntrospectionResponse
        include JSON::Serializable

        # The introspection ID. Each introspection contains a unique ID that can be used to reference the
        # instrospection record.

        @[JSON::Field(key: "introspectionId")]
        getter introspection_id : String?

        # The DataSourceIntrospectionResult object data.

        @[JSON::Field(key: "introspectionResult")]
        getter introspection_result : Types::DataSourceIntrospectionResult?

        # The status of the introspection during retrieval. By default, when a new instrospection is being
        # retrieved, the status will be set to PROCESSING . Once the operation has been completed, the status
        # will change to SUCCESS or FAILED depending on how the data was parsed. A FAILED operation will
        # return an error and its details as an introspectionStatusDetail .

        @[JSON::Field(key: "introspectionStatus")]
        getter introspection_status : String?

        # The error detail field. When a FAILED introspectionStatus is returned, the introspectionStatusDetail
        # will also return the exact error that was generated during the operation.

        @[JSON::Field(key: "introspectionStatusDetail")]
        getter introspection_status_detail : String?

        def initialize(
          @introspection_id : String? = nil,
          @introspection_result : Types::DataSourceIntrospectionResult? = nil,
          @introspection_status : String? = nil,
          @introspection_status_detail : String? = nil
        )
        end
      end


      struct GetDataSourceRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_id : String,
          @name : String
        )
        end
      end


      struct GetDataSourceResponse
        include JSON::Serializable

        # The DataSource object.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource?

        def initialize(
          @data_source : Types::DataSource? = nil
        )
        end
      end


      struct GetDomainNameRequest
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct GetDomainNameResponse
        include JSON::Serializable

        # The configuration for the DomainName .

        @[JSON::Field(key: "domainNameConfig")]
        getter domain_name_config : Types::DomainNameConfig?

        def initialize(
          @domain_name_config : Types::DomainNameConfig? = nil
        )
        end
      end


      struct GetFunctionRequest
        include JSON::Serializable

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The Function ID.

        @[JSON::Field(key: "functionId")]
        getter function_id : String

        def initialize(
          @api_id : String,
          @function_id : String
        )
        end
      end


      struct GetFunctionResponse
        include JSON::Serializable

        # The Function object.

        @[JSON::Field(key: "functionConfiguration")]
        getter function_configuration : Types::FunctionConfiguration?

        def initialize(
          @function_configuration : Types::FunctionConfiguration? = nil
        )
        end
      end


      struct GetGraphqlApiEnvironmentVariablesRequest
        include JSON::Serializable

        # The ID of the API from which the environmental variable list will be retrieved.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct GetGraphqlApiEnvironmentVariablesResponse
        include JSON::Serializable

        # The payload containing each environmental variable in the "key" : "value" format.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        def initialize(
          @environment_variables : Hash(String, String)? = nil
        )
        end
      end


      struct GetGraphqlApiRequest
        include JSON::Serializable

        # The API ID for the GraphQL API.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct GetGraphqlApiResponse
        include JSON::Serializable

        # The GraphqlApi object.

        @[JSON::Field(key: "graphqlApi")]
        getter graphql_api : Types::GraphqlApi?

        def initialize(
          @graphql_api : Types::GraphqlApi? = nil
        )
        end
      end


      struct GetIntrospectionSchemaRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The schema format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String

        # A flag that specifies whether the schema introspection should contain directives.

        @[JSON::Field(key: "includeDirectives")]
        getter include_directives : Bool?

        def initialize(
          @api_id : String,
          @format : String,
          @include_directives : Bool? = nil
        )
        end
      end


      struct GetIntrospectionSchemaResponse
        include JSON::Serializable

        # The schema, in GraphQL Schema Definition Language (SDL) format. For more information, see the
        # GraphQL SDL documentation .

        @[JSON::Field(key: "schema")]
        getter schema : Bytes?

        def initialize(
          @schema : Bytes? = nil
        )
        end
      end


      struct GetResolverRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The resolver field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The resolver type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @api_id : String,
          @field_name : String,
          @type_name : String
        )
        end
      end


      struct GetResolverResponse
        include JSON::Serializable

        # The Resolver object.

        @[JSON::Field(key: "resolver")]
        getter resolver : Types::Resolver?

        def initialize(
          @resolver : Types::Resolver? = nil
        )
        end
      end


      struct GetSchemaCreationStatusRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct GetSchemaCreationStatusResponse
        include JSON::Serializable

        # Detailed information about the status of the schema creation operation.

        @[JSON::Field(key: "details")]
        getter details : String?

        # The current state of the schema (PROCESSING, FAILED, SUCCESS, or NOT_APPLICABLE). When the schema is
        # in the ACTIVE state, you can add data.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @details : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetSourceApiAssociationRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        def initialize(
          @association_id : String,
          @merged_api_identifier : String
        )
        end
      end


      struct GetSourceApiAssociationResponse
        include JSON::Serializable

        # The SourceApiAssociation object data.

        @[JSON::Field(key: "sourceApiAssociation")]
        getter source_api_association : Types::SourceApiAssociation?

        def initialize(
          @source_api_association : Types::SourceApiAssociation? = nil
        )
        end
      end


      struct GetTypeRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The type format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String

        # The type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @api_id : String,
          @format : String,
          @type_name : String
        )
        end
      end


      struct GetTypeResponse
        include JSON::Serializable

        # The Type object.

        @[JSON::Field(key: "type")]
        getter type : Types::Type?

        def initialize(
          @type : Types::Type? = nil
        )
        end
      end

      # The GraphQL schema is not valid.

      struct GraphQLSchemaException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a GraphQL API.

      struct GraphqlApi
        include JSON::Serializable

        # A list of additional authentication providers for the GraphqlApi API.

        @[JSON::Field(key: "additionalAuthenticationProviders")]
        getter additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)?

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # The value that indicates whether the GraphQL API is a standard API ( GRAPHQL ) or merged API (
        # MERGED ).

        @[JSON::Field(key: "apiType")]
        getter api_type : String?

        # The Amazon Resource Name (ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The authentication type.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The DNS records for the API.

        @[JSON::Field(key: "dns")]
        getter dns : Hash(String, String)?

        # The enhancedMetricsConfig object.

        @[JSON::Field(key: "enhancedMetricsConfig")]
        getter enhanced_metrics_config : Types::EnhancedMetricsConfig?

        # Sets the value of the GraphQL API to enable ( ENABLED ) or disable ( DISABLED ) introspection. If no
        # value is provided, the introspection configuration will be set to ENABLED by default. This field
        # will produce an error if the operation attempts to use the introspection feature while this field is
        # disabled. For more information about introspection, see GraphQL introspection .

        @[JSON::Field(key: "introspectionConfig")]
        getter introspection_config : String?

        # Configuration for Lambda function authorization.

        @[JSON::Field(key: "lambdaAuthorizerConfig")]
        getter lambda_authorizer_config : Types::LambdaAuthorizerConfig?

        # The Amazon CloudWatch Logs configuration.

        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::LogConfig?

        # The Identity and Access Management service role ARN for a merged API. The AppSync service assumes
        # this role on behalf of the Merged API to validate access to source APIs at runtime and to prompt the
        # AUTO_MERGE to update the merged API endpoint with the source API changes automatically.

        @[JSON::Field(key: "mergedApiExecutionRoleArn")]
        getter merged_api_execution_role_arn : String?

        # The API name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The OpenID Connect configuration.

        @[JSON::Field(key: "openIDConnectConfig")]
        getter open_id_connect_config : Types::OpenIDConnectConfig?

        # The account owner of the GraphQL API.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The owner contact information for an API resource. This field accepts any string input with a length
        # of 0 - 256 characters.

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?

        # The maximum depth a query can have in a single request. Depth refers to the amount of nested levels
        # allowed in the body of query. The default value is 0 (or unspecified), which indicates there's no
        # depth limit. If you set a limit, it can be between 1 and 75 nested levels. This field will produce a
        # limit error if the operation falls out of bounds. Note that fields can still be set to nullable or
        # non-nullable. If a non-nullable field produces an error, the error will be thrown upwards to the
        # first nullable field available.

        @[JSON::Field(key: "queryDepthLimit")]
        getter query_depth_limit : Int32?

        # The maximum number of resolvers that can be invoked in a single request. The default value is 0 (or
        # unspecified), which will set the limit to 10000 . When specified, the limit value can be between 1
        # and 10000 . This field will produce a limit error if the operation falls out of bounds.

        @[JSON::Field(key: "resolverCountLimit")]
        getter resolver_count_limit : Int32?

        # The tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The URIs.

        @[JSON::Field(key: "uris")]
        getter uris : Hash(String, String)?

        # The Amazon Cognito user pool configuration.

        @[JSON::Field(key: "userPoolConfig")]
        getter user_pool_config : Types::UserPoolConfig?

        # Sets the value of the GraphQL API to public ( GLOBAL ) or private ( PRIVATE ). If no value is
        # provided, the visibility will be set to GLOBAL by default. This value cannot be changed once the API
        # has been created.

        @[JSON::Field(key: "visibility")]
        getter visibility : String?

        # The ARN of the WAF access control list (ACL) associated with this GraphqlApi , if one exists.

        @[JSON::Field(key: "wafWebAclArn")]
        getter waf_web_acl_arn : String?

        # A flag indicating whether to use X-Ray tracing for this GraphqlApi .

        @[JSON::Field(key: "xrayEnabled")]
        getter xray_enabled : Bool?

        def initialize(
          @additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)? = nil,
          @api_id : String? = nil,
          @api_type : String? = nil,
          @arn : String? = nil,
          @authentication_type : String? = nil,
          @dns : Hash(String, String)? = nil,
          @enhanced_metrics_config : Types::EnhancedMetricsConfig? = nil,
          @introspection_config : String? = nil,
          @lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
          @log_config : Types::LogConfig? = nil,
          @merged_api_execution_role_arn : String? = nil,
          @name : String? = nil,
          @open_id_connect_config : Types::OpenIDConnectConfig? = nil,
          @owner : String? = nil,
          @owner_contact : String? = nil,
          @query_depth_limit : Int32? = nil,
          @resolver_count_limit : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @uris : Hash(String, String)? = nil,
          @user_pool_config : Types::UserPoolConfig? = nil,
          @visibility : String? = nil,
          @waf_web_acl_arn : String? = nil,
          @xray_enabled : Bool? = nil
        )
        end
      end

      # The configuration for a handler.

      struct HandlerConfig
        include JSON::Serializable

        # The behavior for the handler.

        @[JSON::Field(key: "behavior")]
        getter behavior : String

        # The integration data source configuration for the handler.

        @[JSON::Field(key: "integration")]
        getter integration : Types::Integration

        def initialize(
          @behavior : String,
          @integration : Types::Integration
        )
        end
      end

      # The configuration for the OnPublish and OnSubscribe handlers.

      struct HandlerConfigs
        include JSON::Serializable

        # The configuration for the OnPublish handler.

        @[JSON::Field(key: "onPublish")]
        getter on_publish : Types::HandlerConfig?

        # The configuration for the OnSubscribe handler.

        @[JSON::Field(key: "onSubscribe")]
        getter on_subscribe : Types::HandlerConfig?

        def initialize(
          @on_publish : Types::HandlerConfig? = nil,
          @on_subscribe : Types::HandlerConfig? = nil
        )
        end
      end

      # Describes an HTTP data source configuration.

      struct HttpDataSourceConfig
        include JSON::Serializable

        # The authorization configuration in case the HTTP endpoint requires authorization.

        @[JSON::Field(key: "authorizationConfig")]
        getter authorization_config : Types::AuthorizationConfig?

        # The HTTP URL endpoint. You can specify either the domain name or IP, and port combination, and the
        # URL scheme must be HTTP or HTTPS. If you don't specify the port, AppSync uses the default port 80
        # for the HTTP endpoint and port 443 for HTTPS endpoints.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        def initialize(
          @authorization_config : Types::AuthorizationConfig? = nil,
          @endpoint : String? = nil
        )
        end
      end

      # The integration data source configuration for the handler.

      struct Integration
        include JSON::Serializable

        # The unique name of the data source that has been configured on the API.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String

        # The configuration for a Lambda data source.

        @[JSON::Field(key: "lambdaConfig")]
        getter lambda_config : Types::LambdaConfig?

        def initialize(
          @data_source_name : String,
          @lambda_config : Types::LambdaConfig? = nil
        )
        end
      end

      # An internal AppSync error occurred. Try your request again.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A LambdaAuthorizerConfig specifies how to authorize AppSync API access when using the AWS_LAMBDA
      # authorizer mode. Be aware that an AppSync API can have only one Lambda authorizer configured at a
      # time.

      struct LambdaAuthorizerConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function to be called for authorization. This can be a
        # standard Lambda ARN, a version ARN ( .../v3 ), or an alias ARN. Note : This Lambda function must
        # have the following resource-based policy assigned to it. When configuring Lambda authorizers in the
        # console, this is done for you. To use the Command Line Interface (CLI), run the following: aws
        # lambda add-permission --function-name "arn:aws:lambda:us-east-2:111122223333:function:my-function"
        # --statement-id "appsync" --principal appsync.amazonaws.com --action lambda:InvokeFunction

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String

        # The number of seconds a response should be cached for. The default is 0 seconds, which disables
        # caching. If you don't specify a value for authorizerResultTtlInSeconds , the default value is used.
        # The maximum value is one hour (3600 seconds). The Lambda function can override this by returning a
        # ttlOverride key in its response.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # A regular expression for validation of tokens before the Lambda function is called.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        def initialize(
          @authorizer_uri : String,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @identity_validation_expression : String? = nil
        )
        end
      end

      # The configuration for a Lambda data source.

      struct LambdaConfig
        include JSON::Serializable

        # The invocation type for a Lambda data source.

        @[JSON::Field(key: "invokeType")]
        getter invoke_type : String?

        def initialize(
          @invoke_type : String? = nil
        )
        end
      end

      # The LambdaConflictHandlerConfig object when configuring LAMBDA as the Conflict Handler.

      struct LambdaConflictHandlerConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Lambda function to use as the Conflict Handler.

        @[JSON::Field(key: "lambdaConflictHandlerArn")]
        getter lambda_conflict_handler_arn : String?

        def initialize(
          @lambda_conflict_handler_arn : String? = nil
        )
        end
      end

      # Describes an Lambda data source configuration.

      struct LambdaDataSourceConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Lambda function.

        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String

        def initialize(
          @lambda_function_arn : String
        )
        end
      end

      # The request exceeded a limit. Try your request again.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListApiKeysRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApiKeysResponse
        include JSON::Serializable

        # The ApiKey objects.

        @[JSON::Field(key: "apiKeys")]
        getter api_keys : Array(Types::ApiKey)?

        # An identifier to pass in the next request to this operation to return the next set of items in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_keys : Array(Types::ApiKey)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApisRequest
        include JSON::Serializable

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApisResponse
        include JSON::Serializable

        # The Api objects.

        @[JSON::Field(key: "apis")]
        getter apis : Array(Types::Api)?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @apis : Array(Types::Api)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelNamespacesRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelNamespacesResponse
        include JSON::Serializable

        # The ChannelNamespace objects.

        @[JSON::Field(key: "channelNamespaces")]
        getter channel_namespaces : Array(Types::ChannelNamespace)?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_namespaces : Array(Types::ChannelNamespace)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesResponse
        include JSON::Serializable

        # The DataSource objects.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # An identifier to pass in the next request to this operation to return the next set of items in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_sources : Array(Types::DataSource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainNamesRequest
        include JSON::Serializable

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainNamesResponse
        include JSON::Serializable

        # Lists configurations for multiple domain names.

        @[JSON::Field(key: "domainNameConfigs")]
        getter domain_name_configs : Array(Types::DomainNameConfig)?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name_configs : Array(Types::DomainNameConfig)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFunctionsRequest
        include JSON::Serializable

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFunctionsResponse
        include JSON::Serializable

        # A list of Function objects.

        @[JSON::Field(key: "functions")]
        getter functions : Array(Types::FunctionConfiguration)?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @functions : Array(Types::FunctionConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphqlApisRequest
        include JSON::Serializable

        # The value that indicates whether the GraphQL API is a standard API ( GRAPHQL ) or merged API (
        # MERGED ).

        @[JSON::Field(key: "apiType")]
        getter api_type : String?

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The account owner of the GraphQL API.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        def initialize(
          @api_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct ListGraphqlApisResponse
        include JSON::Serializable

        # The GraphqlApi objects.

        @[JSON::Field(key: "graphqlApis")]
        getter graphql_apis : Array(Types::GraphqlApi)?

        # An identifier to pass in the next request to this operation to return the next set of items in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graphql_apis : Array(Types::GraphqlApi)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolversByFunctionRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The function ID.

        @[JSON::Field(key: "functionId")]
        getter function_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @function_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolversByFunctionResponse
        include JSON::Serializable

        # An identifier that you can use to return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of resolvers.

        @[JSON::Field(key: "resolvers")]
        getter resolvers : Array(Types::Resolver)?

        def initialize(
          @next_token : String? = nil,
          @resolvers : Array(Types::Resolver)? = nil
        )
        end
      end


      struct ListResolversRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @type_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResolversResponse
        include JSON::Serializable

        # An identifier to pass in the next request to this operation to return the next set of items in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Resolver objects.

        @[JSON::Field(key: "resolvers")]
        getter resolvers : Array(Types::Resolver)?

        def initialize(
          @next_token : String? = nil,
          @resolvers : Array(Types::Resolver)? = nil
        )
        end
      end


      struct ListSourceApiAssociationsRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSourceApiAssociationsResponse
        include JSON::Serializable

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The SourceApiAssociationSummary object data.

        @[JSON::Field(key: "sourceApiAssociationSummaries")]
        getter source_api_association_summaries : Array(Types::SourceApiAssociationSummary)?

        def initialize(
          @next_token : String? = nil,
          @source_api_association_summaries : Array(Types::SourceApiAssociationSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The GraphqlApi Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A TagMap object.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTypesByAssociationRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The format type.

        @[JSON::Field(key: "format")]
        getter format : String

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @association_id : String,
          @format : String,
          @merged_api_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTypesByAssociationResponse
        include JSON::Serializable

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Type objects.

        @[JSON::Field(key: "types")]
        getter types : Array(Types::Type)?

        def initialize(
          @next_token : String? = nil,
          @types : Array(Types::Type)? = nil
        )
        end
      end


      struct ListTypesRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The type format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String

        # The maximum number of results that you want the request to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which you can use to
        # return the next set of items in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @format : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTypesResponse
        include JSON::Serializable

        # An identifier to pass in the next request to this operation to return the next set of items in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Type objects.

        @[JSON::Field(key: "types")]
        getter types : Array(Types::Type)?

        def initialize(
          @next_token : String? = nil,
          @types : Array(Types::Type)? = nil
        )
        end
      end

      # The Amazon CloudWatch Logs configuration.

      struct LogConfig
        include JSON::Serializable

        # The service role that AppSync assumes to publish to CloudWatch logs in your account.

        @[JSON::Field(key: "cloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String

        # The field logging level. Values can be NONE, ERROR, or ALL. NONE : No field-level logs are captured.
        # ERROR : Logs the following information only for the fields that are in error: The error section in
        # the server response. Field-level errors. The generated request/response functions that got resolved
        # for error fields. ALL : The following information is logged for all fields in the query: Field-level
        # tracing information. The generated request/response functions that got resolved for each field.

        @[JSON::Field(key: "fieldLogLevel")]
        getter field_log_level : String

        # Set to TRUE to exclude sections that contain information such as headers, context, and evaluated
        # mapping templates, regardless of logging level.

        @[JSON::Field(key: "excludeVerboseContent")]
        getter exclude_verbose_content : Bool?

        def initialize(
          @cloud_watch_logs_role_arn : String,
          @field_log_level : String,
          @exclude_verbose_content : Bool? = nil
        )
        end
      end

      # The resource specified in the request was not found. Check the resource, and then try again.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an OpenID Connect (OIDC) configuration.

      struct OpenIDConnectConfig
        include JSON::Serializable

        # The issuer for the OIDC configuration. The issuer returned by discovery must exactly match the value
        # of iss in the ID token.

        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The number of milliseconds that a token is valid after being authenticated.

        @[JSON::Field(key: "authTTL")]
        getter auth_ttl : Int64?

        # The client identifier of the relying party at the OpenID identity provider. This identifier is
        # typically obtained when the relying party is registered with the OpenID identity provider. You can
        # specify a regular expression so that AppSync can validate against multiple client identifiers at a
        # time.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The number of milliseconds that a token is valid after it's issued to a user.

        @[JSON::Field(key: "iatTTL")]
        getter iat_ttl : Int64?

        def initialize(
          @issuer : String,
          @auth_ttl : Int64? = nil,
          @client_id : String? = nil,
          @iat_ttl : Int64? = nil
        )
        end
      end

      # Describes an OpenSearch data source configuration.

      struct OpenSearchServiceDataSourceConfig
        include JSON::Serializable

        # The Amazon Web Services Region.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        def initialize(
          @aws_region : String,
          @endpoint : String
        )
        end
      end

      # The pipeline configuration for a resolver of kind PIPELINE .

      struct PipelineConfig
        include JSON::Serializable

        # A list of Function objects.

        @[JSON::Field(key: "functions")]
        getter functions : Array(String)?

        def initialize(
          @functions : Array(String)? = nil
        )
        end
      end


      struct PutGraphqlApiEnvironmentVariablesRequest
        include JSON::Serializable

        # The ID of the API to which the environmental variable list will be written.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The list of environmental variables to add to the API. When creating an environmental variable
        # key-value pair, it must follow the additional constraints below: Keys must begin with a letter. Keys
        # must be at least two characters long. Keys can only contain letters, numbers, and the underscore
        # character (_). Values can be up to 512 characters long. You can configure up to 50 key-value pairs
        # in a GraphQL API. You can create a list of environmental variables by adding it to the
        # environmentVariables payload as a list in the format {"key1":"value1","key2":"value2", …} . Note
        # that each call of the PutGraphqlApiEnvironmentVariables action will result in the overwriting of the
        # existing environmental variable list of that API. This means the existing environmental variables
        # will be lost. To avoid this, you must include all existing and new environmental variables in the
        # list each time you call this action.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)

        def initialize(
          @api_id : String,
          @environment_variables : Hash(String, String)
        )
        end
      end


      struct PutGraphqlApiEnvironmentVariablesResponse
        include JSON::Serializable

        # The payload containing each environmental variable in the "key" : "value" format.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        def initialize(
          @environment_variables : Hash(String, String)? = nil
        )
        end
      end

      # Contains the metadata required to introspect the RDS cluster.

      struct RdsDataApiConfig
        include JSON::Serializable

        # The name of the database in the cluster.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The resource ARN of the RDS cluster.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The secret's ARN that was obtained from Secrets Manager. A secret consists of secret information,
        # the secret value, plus metadata about the secret. A secret value can be a string or binary. It
        # typically includes the ARN, secret name and description, policies, tags, encryption key from the Key
        # Management Service, and key rotation data.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        def initialize(
          @database_name : String,
          @resource_arn : String,
          @secret_arn : String
        )
        end
      end

      # The Amazon Relational Database Service (Amazon RDS) HTTP endpoint configuration.

      struct RdsHttpEndpointConfig
        include JSON::Serializable

        # Amazon Web Services Region for Amazon RDS HTTP endpoint.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # Amazon Web Services secret store Amazon Resource Name (ARN) for database credentials.

        @[JSON::Field(key: "awsSecretStoreArn")]
        getter aws_secret_store_arn : String?

        # Logical database name.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # Amazon RDS cluster Amazon Resource Name (ARN).

        @[JSON::Field(key: "dbClusterIdentifier")]
        getter db_cluster_identifier : String?

        # Logical schema name.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @aws_region : String? = nil,
          @aws_secret_store_arn : String? = nil,
          @database_name : String? = nil,
          @db_cluster_identifier : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # Describes a relational database data source configuration.

      struct RelationalDatabaseDataSourceConfig
        include JSON::Serializable

        # Amazon RDS HTTP endpoint settings.

        @[JSON::Field(key: "rdsHttpEndpointConfig")]
        getter rds_http_endpoint_config : Types::RdsHttpEndpointConfig?

        # Source type for the relational database. RDS_HTTP_ENDPOINT : The relational database source type is
        # an Amazon Relational Database Service (Amazon RDS) HTTP endpoint.

        @[JSON::Field(key: "relationalDatabaseSourceType")]
        getter relational_database_source_type : String?

        def initialize(
          @rds_http_endpoint_config : Types::RdsHttpEndpointConfig? = nil,
          @relational_database_source_type : String? = nil
        )
        end
      end

      # Describes a resolver.

      struct Resolver
        include JSON::Serializable

        # The caching configuration for the resolver.

        @[JSON::Field(key: "cachingConfig")]
        getter caching_config : Types::CachingConfig?

        # The resolver code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The resolver data source name.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String?

        # The resolver field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String?

        # The resolver type. UNIT : A UNIT resolver type. A UNIT resolver is the default resolver type. You
        # can use a UNIT resolver to run a GraphQL query against a single data source. PIPELINE : A PIPELINE
        # resolver type. You can use a PIPELINE resolver to invoke a series of Function objects in a serial
        # manner. You can use a pipeline resolver to run a GraphQL query against multiple data sources.

        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # Enables or disables enhanced resolver metrics for specified resolvers. Note that metricsConfig won't
        # be used unless the resolverLevelMetricsBehavior value is set to PER_RESOLVER_METRICS . If the
        # resolverLevelMetricsBehavior is set to FULL_REQUEST_RESOLVER_METRICS instead, metricsConfig will be
        # ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # The PipelineConfig .

        @[JSON::Field(key: "pipelineConfig")]
        getter pipeline_config : Types::PipelineConfig?

        # The request mapping template.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The resolver Amazon Resource Name (ARN).

        @[JSON::Field(key: "resolverArn")]
        getter resolver_arn : String?

        # The response mapping template.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?

        # The SyncConfig for a resolver attached to a versioned data source.

        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        # The resolver type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String?

        def initialize(
          @caching_config : Types::CachingConfig? = nil,
          @code : String? = nil,
          @data_source_name : String? = nil,
          @field_name : String? = nil,
          @kind : String? = nil,
          @max_batch_size : Int32? = nil,
          @metrics_config : String? = nil,
          @pipeline_config : Types::PipelineConfig? = nil,
          @request_mapping_template : String? = nil,
          @resolver_arn : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil,
          @type_name : String? = nil
        )
        end
      end

      # The operation exceeded the service quota for this resource.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the configuration of a source API. A source API is a GraphQL API that is linked to a
      # merged API. There can be multiple source APIs attached to each merged API. When linked to a merged
      # API, the source API's schema, data sources, and resolvers will be combined with other linked source
      # API data to form a new, singular API. Source APIs can originate from your account or from other
      # accounts via Amazon Web Services Resource Access Manager. For more information about sharing
      # resources from other accounts, see What is Amazon Web Services Resource Access Manager? in the
      # Amazon Web Services Resource Access Manager guide.

      struct SourceApiAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source API association.

        @[JSON::Field(key: "associationArn")]
        getter association_arn : String?

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The description field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The datetime value of the last successful merge of the source API association. The result will be in
        # UTC format and your local time zone.

        @[JSON::Field(key: "lastSuccessfulMergeDate")]
        getter last_successful_merge_date : Time?

        # The Amazon Resource Name (ARN) of the AppSync Merged API.

        @[JSON::Field(key: "mergedApiArn")]
        getter merged_api_arn : String?

        # The ID of the AppSync Merged API.

        @[JSON::Field(key: "mergedApiId")]
        getter merged_api_id : String?

        # The Amazon Resource Name (ARN) of the AppSync source API.

        @[JSON::Field(key: "sourceApiArn")]
        getter source_api_arn : String?

        # The SourceApiAssociationConfig object data.

        @[JSON::Field(key: "sourceApiAssociationConfig")]
        getter source_api_association_config : Types::SourceApiAssociationConfig?

        # The state of the source API association.

        @[JSON::Field(key: "sourceApiAssociationStatus")]
        getter source_api_association_status : String?

        # The detailed message related to the current state of the source API association.

        @[JSON::Field(key: "sourceApiAssociationStatusDetail")]
        getter source_api_association_status_detail : String?

        # The ID of the AppSync source API.

        @[JSON::Field(key: "sourceApiId")]
        getter source_api_id : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @description : String? = nil,
          @last_successful_merge_date : Time? = nil,
          @merged_api_arn : String? = nil,
          @merged_api_id : String? = nil,
          @source_api_arn : String? = nil,
          @source_api_association_config : Types::SourceApiAssociationConfig? = nil,
          @source_api_association_status : String? = nil,
          @source_api_association_status_detail : String? = nil,
          @source_api_id : String? = nil
        )
        end
      end

      # Describes properties used to specify configurations related to a source API.

      struct SourceApiAssociationConfig
        include JSON::Serializable

        # The property that indicates which merging option is enabled in the source API association. Valid
        # merge types are MANUAL_MERGE (default) and AUTO_MERGE . Manual merges are the default behavior and
        # require the user to trigger any changes from the source APIs to the merged API manually. Auto merges
        # subscribe the merged API to the changes performed on the source APIs so that any change in the
        # source APIs are also made to the merged API. Auto merges use MergedApiExecutionRoleArn to perform
        # merge operations.

        @[JSON::Field(key: "mergeType")]
        getter merge_type : String?

        def initialize(
          @merge_type : String? = nil
        )
        end
      end

      # Describes the ARNs and IDs of associations, Merged APIs, and source APIs.

      struct SourceApiAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source API association.

        @[JSON::Field(key: "associationArn")]
        getter association_arn : String?

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The description field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the AppSync Merged API.

        @[JSON::Field(key: "mergedApiArn")]
        getter merged_api_arn : String?

        # The ID of the AppSync Merged API.

        @[JSON::Field(key: "mergedApiId")]
        getter merged_api_id : String?

        # The Amazon Resource Name (ARN) of the AppSync Source API.

        @[JSON::Field(key: "sourceApiArn")]
        getter source_api_arn : String?

        # The ID of the AppSync source API.

        @[JSON::Field(key: "sourceApiId")]
        getter source_api_id : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @description : String? = nil,
          @merged_api_arn : String? = nil,
          @merged_api_id : String? = nil,
          @source_api_arn : String? = nil,
          @source_api_id : String? = nil
        )
        end
      end


      struct StartDataSourceIntrospectionRequest
        include JSON::Serializable

        # The rdsDataApiConfig object data.

        @[JSON::Field(key: "rdsDataApiConfig")]
        getter rds_data_api_config : Types::RdsDataApiConfig?

        def initialize(
          @rds_data_api_config : Types::RdsDataApiConfig? = nil
        )
        end
      end


      struct StartDataSourceIntrospectionResponse
        include JSON::Serializable

        # The introspection ID. Each introspection contains a unique ID that can be used to reference the
        # instrospection record.

        @[JSON::Field(key: "introspectionId")]
        getter introspection_id : String?

        # The status of the introspection during creation. By default, when a new instrospection has been
        # created, the status will be set to PROCESSING . Once the operation has been completed, the status
        # will change to SUCCESS or FAILED depending on how the data was parsed. A FAILED operation will
        # return an error and its details as an introspectionStatusDetail .

        @[JSON::Field(key: "introspectionStatus")]
        getter introspection_status : String?

        # The error detail field. When a FAILED introspectionStatus is returned, the introspectionStatusDetail
        # will also return the exact error that was generated during the operation.

        @[JSON::Field(key: "introspectionStatusDetail")]
        getter introspection_status_detail : String?

        def initialize(
          @introspection_id : String? = nil,
          @introspection_status : String? = nil,
          @introspection_status_detail : String? = nil
        )
        end
      end


      struct StartSchemaCreationRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The schema definition, in GraphQL schema language format.

        @[JSON::Field(key: "definition")]
        getter definition : Bytes

        def initialize(
          @api_id : String,
          @definition : Bytes
        )
        end
      end


      struct StartSchemaCreationResponse
        include JSON::Serializable

        # The current state of the schema (PROCESSING, FAILED, SUCCESS, or NOT_APPLICABLE). When the schema is
        # in the ACTIVE state, you can add data.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct StartSchemaMergeRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        def initialize(
          @association_id : String,
          @merged_api_identifier : String
        )
        end
      end


      struct StartSchemaMergeResponse
        include JSON::Serializable

        # The state of the source API association.

        @[JSON::Field(key: "sourceApiAssociationStatus")]
        getter source_api_association_status : String?

        def initialize(
          @source_api_association_status : String? = nil
        )
        end
      end

      # Describes a Sync configuration for a resolver. Specifies which Conflict Detection strategy and
      # Resolution strategy to use when the resolver is invoked.

      struct SyncConfig
        include JSON::Serializable

        # The Conflict Detection strategy to use. VERSION : Detect conflicts based on object versions for this
        # resolver. NONE : Do not detect conflicts when invoking this resolver.

        @[JSON::Field(key: "conflictDetection")]
        getter conflict_detection : String?

        # The Conflict Resolution strategy to perform in the event of a conflict. OPTIMISTIC_CONCURRENCY :
        # Resolve conflicts by rejecting mutations when versions don't match the latest version at the server.
        # AUTOMERGE : Resolve conflicts with the Automerge conflict resolution strategy. LAMBDA : Resolve
        # conflicts with an Lambda function supplied in the LambdaConflictHandlerConfig .

        @[JSON::Field(key: "conflictHandler")]
        getter conflict_handler : String?

        # The LambdaConflictHandlerConfig when configuring LAMBDA as the Conflict Handler.

        @[JSON::Field(key: "lambdaConflictHandlerConfig")]
        getter lambda_conflict_handler_config : Types::LambdaConflictHandlerConfig?

        def initialize(
          @conflict_detection : String? = nil,
          @conflict_handler : String? = nil,
          @lambda_conflict_handler_config : Types::LambdaConflictHandlerConfig? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The GraphqlApi Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A TagMap object.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a type.

      struct Type
        include JSON::Serializable

        # The type Amazon Resource Name (ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type definition.

        @[JSON::Field(key: "definition")]
        getter definition : String?

        # The type description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The type format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The type name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @definition : String? = nil,
          @description : String? = nil,
          @format : String? = nil,
          @name : String? = nil
        )
        end
      end

      # You aren't authorized to perform this operation.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The GraphqlApi Amazon Resource Name (ARN).

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of TagKey objects.

        @[JSON::Field(key: "tagKeys")]
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

      # Represents the input of a UpdateApiCache operation.

      struct UpdateApiCacheRequest
        include JSON::Serializable

        # Caching behavior. FULL_REQUEST_CACHING : All requests from the same user are cached. Individual
        # resolvers are automatically cached. All API calls will try to return responses from the cache.
        # PER_RESOLVER_CACHING : Individual resolvers that you specify are cached. OPERATION_LEVEL_CACHING :
        # Full requests are cached together and returned without executing resolvers.

        @[JSON::Field(key: "apiCachingBehavior")]
        getter api_caching_behavior : String

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # TTL in seconds for cache entries. Valid values are 1–3,600 seconds.

        @[JSON::Field(key: "ttl")]
        getter ttl : Int64

        # The cache instance type. Valid values are SMALL MEDIUM LARGE XLARGE LARGE_2X LARGE_4X LARGE_8X (not
        # available in all regions) LARGE_12X Historically, instance types were identified by an EC2-style
        # value. As of July 2020, this is deprecated, and the generic identifiers above should be used. The
        # following legacy instance types are available, but their use is discouraged: T2_SMALL : A t2.small
        # instance type. T2_MEDIUM : A t2.medium instance type. R4_LARGE : A r4.large instance type. R4_XLARGE
        # : A r4.xlarge instance type. R4_2XLARGE : A r4.2xlarge instance type. R4_4XLARGE : A r4.4xlarge
        # instance type. R4_8XLARGE : A r4.8xlarge instance type.

        @[JSON::Field(key: "type")]
        getter type : String

        # Controls how cache health metrics will be emitted to CloudWatch. Cache health metrics include:
        # NetworkBandwidthOutAllowanceExceeded: The network packets dropped because the throughput exceeded
        # the aggregated bandwidth limit. This is useful for diagnosing bottlenecks in a cache configuration.
        # EngineCPUUtilization: The CPU utilization (percentage) allocated to the Redis process. This is
        # useful for diagnosing bottlenecks in a cache configuration. Metrics will be recorded by API ID. You
        # can set the value to ENABLED or DISABLED .

        @[JSON::Field(key: "healthMetricsConfig")]
        getter health_metrics_config : String?

        def initialize(
          @api_caching_behavior : String,
          @api_id : String,
          @ttl : Int64,
          @type : String,
          @health_metrics_config : String? = nil
        )
        end
      end

      # Represents the output of a UpdateApiCache operation.

      struct UpdateApiCacheResponse
        include JSON::Serializable

        # The ApiCache object.

        @[JSON::Field(key: "apiCache")]
        getter api_cache : Types::ApiCache?

        def initialize(
          @api_cache : Types::ApiCache? = nil
        )
        end
      end


      struct UpdateApiKeyRequest
        include JSON::Serializable

        # The ID for the GraphQL API.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The API key ID.

        @[JSON::Field(key: "id")]
        getter id : String

        # A description of the purpose of the API key.

        @[JSON::Field(key: "description")]
        getter description : String?

        # From the update time, the time after which the API key expires. The date is represented as seconds
        # since the epoch. For more information, see .

        @[JSON::Field(key: "expires")]
        getter expires : Int64?

        def initialize(
          @api_id : String,
          @id : String,
          @description : String? = nil,
          @expires : Int64? = nil
        )
        end
      end


      struct UpdateApiKeyResponse
        include JSON::Serializable

        # The API key.

        @[JSON::Field(key: "apiKey")]
        getter api_key : Types::ApiKey?

        def initialize(
          @api_key : Types::ApiKey? = nil
        )
        end
      end


      struct UpdateApiRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The new event configuration. This includes the default authorization configuration for connecting,
        # publishing, and subscribing to an Event API.

        @[JSON::Field(key: "eventConfig")]
        getter event_config : Types::EventConfig

        # The name of the Api.

        @[JSON::Field(key: "name")]
        getter name : String

        # The owner contact information for the Api .

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?

        def initialize(
          @api_id : String,
          @event_config : Types::EventConfig,
          @name : String,
          @owner_contact : String? = nil
        )
        end
      end


      struct UpdateApiResponse
        include JSON::Serializable

        # The Api object.

        @[JSON::Field(key: "api")]
        getter api : Types::Api?

        def initialize(
          @api : Types::Api? = nil
        )
        end
      end


      struct UpdateChannelNamespaceRequest
        include JSON::Serializable

        # The Api ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the ChannelNamespace .

        @[JSON::Field(key: "name")]
        getter name : String

        # The event handler functions that run custom business logic to process published events and subscribe
        # requests.

        @[JSON::Field(key: "codeHandlers")]
        getter code_handlers : String?

        # The configuration for the OnPublish and OnSubscribe handlers.

        @[JSON::Field(key: "handlerConfigs")]
        getter handler_configs : Types::HandlerConfigs?

        # The authorization mode to use for publishing messages on the channel namespace. This configuration
        # overrides the default Api authorization configuration.

        @[JSON::Field(key: "publishAuthModes")]
        getter publish_auth_modes : Array(Types::AuthMode)?

        # The authorization mode to use for subscribing to messages on the channel namespace. This
        # configuration overrides the default Api authorization configuration.

        @[JSON::Field(key: "subscribeAuthModes")]
        getter subscribe_auth_modes : Array(Types::AuthMode)?

        def initialize(
          @api_id : String,
          @name : String,
          @code_handlers : String? = nil,
          @handler_configs : Types::HandlerConfigs? = nil,
          @publish_auth_modes : Array(Types::AuthMode)? = nil,
          @subscribe_auth_modes : Array(Types::AuthMode)? = nil
        )
        end
      end


      struct UpdateChannelNamespaceResponse
        include JSON::Serializable

        # The ChannelNamespace object.

        @[JSON::Field(key: "channelNamespace")]
        getter channel_namespace : Types::ChannelNamespace?

        def initialize(
          @channel_namespace : Types::ChannelNamespace? = nil
        )
        end
      end


      struct UpdateDataSourceRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The new name for the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new data source type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The new description for the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new Amazon DynamoDB configuration.

        @[JSON::Field(key: "dynamodbConfig")]
        getter dynamodb_config : Types::DynamodbDataSourceConfig?

        # The new OpenSearch configuration. As of September 2021, Amazon Elasticsearch service is Amazon
        # OpenSearch Service. This configuration is deprecated. Instead, use
        # UpdateDataSourceRequest$openSearchServiceConfig to update an OpenSearch data source.

        @[JSON::Field(key: "elasticsearchConfig")]
        getter elasticsearch_config : Types::ElasticsearchDataSourceConfig?

        # The new Amazon EventBridge settings.

        @[JSON::Field(key: "eventBridgeConfig")]
        getter event_bridge_config : Types::EventBridgeDataSourceConfig?

        # The new HTTP endpoint configuration.

        @[JSON::Field(key: "httpConfig")]
        getter http_config : Types::HttpDataSourceConfig?

        # The new Lambda configuration.

        @[JSON::Field(key: "lambdaConfig")]
        getter lambda_config : Types::LambdaDataSourceConfig?

        # Enables or disables enhanced data source metrics for specified data sources. Note that metricsConfig
        # won't be used unless the dataSourceLevelMetricsBehavior value is set to PER_DATA_SOURCE_METRICS . If
        # the dataSourceLevelMetricsBehavior is set to FULL_REQUEST_DATA_SOURCE_METRICS instead, metricsConfig
        # will be ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # The new OpenSearch configuration.

        @[JSON::Field(key: "openSearchServiceConfig")]
        getter open_search_service_config : Types::OpenSearchServiceDataSourceConfig?

        # The new relational database configuration.

        @[JSON::Field(key: "relationalDatabaseConfig")]
        getter relational_database_config : Types::RelationalDatabaseDataSourceConfig?

        # The new service role Amazon Resource Name (ARN) for the data source.

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String?

        def initialize(
          @api_id : String,
          @name : String,
          @type : String,
          @description : String? = nil,
          @dynamodb_config : Types::DynamodbDataSourceConfig? = nil,
          @elasticsearch_config : Types::ElasticsearchDataSourceConfig? = nil,
          @event_bridge_config : Types::EventBridgeDataSourceConfig? = nil,
          @http_config : Types::HttpDataSourceConfig? = nil,
          @lambda_config : Types::LambdaDataSourceConfig? = nil,
          @metrics_config : String? = nil,
          @open_search_service_config : Types::OpenSearchServiceDataSourceConfig? = nil,
          @relational_database_config : Types::RelationalDatabaseDataSourceConfig? = nil,
          @service_role_arn : String? = nil
        )
        end
      end


      struct UpdateDataSourceResponse
        include JSON::Serializable

        # The updated DataSource object.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource?

        def initialize(
          @data_source : Types::DataSource? = nil
        )
        end
      end


      struct UpdateDomainNameRequest
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # A description of the DomainName .

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_name : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateDomainNameResponse
        include JSON::Serializable

        # The configuration for the DomainName .

        @[JSON::Field(key: "domainNameConfig")]
        getter domain_name_config : Types::DomainNameConfig?

        def initialize(
          @domain_name_config : Types::DomainNameConfig? = nil
        )
        end
      end


      struct UpdateFunctionRequest
        include JSON::Serializable

        # The GraphQL API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The Function DataSource name.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String

        # The function ID.

        @[JSON::Field(key: "functionId")]
        getter function_id : String

        # The Function name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The function code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The Function description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the request mapping template. Currently, the supported value is 2018-05-29. Note that
        # when using VTL and mapping templates, the functionVersion is required.

        @[JSON::Field(key: "functionVersion")]
        getter function_version : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # The Function request mapping template. Functions support only the 2018-05-29 version of the request
        # mapping template.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The Function request mapping template.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?


        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        def initialize(
          @api_id : String,
          @data_source_name : String,
          @function_id : String,
          @name : String,
          @code : String? = nil,
          @description : String? = nil,
          @function_version : String? = nil,
          @max_batch_size : Int32? = nil,
          @request_mapping_template : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil
        )
        end
      end


      struct UpdateFunctionResponse
        include JSON::Serializable

        # The Function object.

        @[JSON::Field(key: "functionConfiguration")]
        getter function_configuration : Types::FunctionConfiguration?

        def initialize(
          @function_configuration : Types::FunctionConfiguration? = nil
        )
        end
      end


      struct UpdateGraphqlApiRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The new authentication type for the GraphqlApi object.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String

        # The new name for the GraphqlApi object.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of additional authentication providers for the GraphqlApi API.

        @[JSON::Field(key: "additionalAuthenticationProviders")]
        getter additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)?

        # The enhancedMetricsConfig object.

        @[JSON::Field(key: "enhancedMetricsConfig")]
        getter enhanced_metrics_config : Types::EnhancedMetricsConfig?

        # Sets the value of the GraphQL API to enable ( ENABLED ) or disable ( DISABLED ) introspection. If no
        # value is provided, the introspection configuration will be set to ENABLED by default. This field
        # will produce an error if the operation attempts to use the introspection feature while this field is
        # disabled. For more information about introspection, see GraphQL introspection .

        @[JSON::Field(key: "introspectionConfig")]
        getter introspection_config : String?

        # Configuration for Lambda function authorization.

        @[JSON::Field(key: "lambdaAuthorizerConfig")]
        getter lambda_authorizer_config : Types::LambdaAuthorizerConfig?

        # The Amazon CloudWatch Logs configuration for the GraphqlApi object.

        @[JSON::Field(key: "logConfig")]
        getter log_config : Types::LogConfig?

        # The Identity and Access Management service role ARN for a merged API. The AppSync service assumes
        # this role on behalf of the Merged API to validate access to source APIs at runtime and to prompt the
        # AUTO_MERGE to update the merged API endpoint with the source API changes automatically.

        @[JSON::Field(key: "mergedApiExecutionRoleArn")]
        getter merged_api_execution_role_arn : String?

        # The OpenID Connect configuration for the GraphqlApi object.

        @[JSON::Field(key: "openIDConnectConfig")]
        getter open_id_connect_config : Types::OpenIDConnectConfig?

        # The owner contact information for an API resource. This field accepts any string input with a length
        # of 0 - 256 characters.

        @[JSON::Field(key: "ownerContact")]
        getter owner_contact : String?

        # The maximum depth a query can have in a single request. Depth refers to the amount of nested levels
        # allowed in the body of query. The default value is 0 (or unspecified), which indicates there's no
        # depth limit. If you set a limit, it can be between 1 and 75 nested levels. This field will produce a
        # limit error if the operation falls out of bounds. Note that fields can still be set to nullable or
        # non-nullable. If a non-nullable field produces an error, the error will be thrown upwards to the
        # first nullable field available.

        @[JSON::Field(key: "queryDepthLimit")]
        getter query_depth_limit : Int32?

        # The maximum number of resolvers that can be invoked in a single request. The default value is 0 (or
        # unspecified), which will set the limit to 10000 . When specified, the limit value can be between 1
        # and 10000 . This field will produce a limit error if the operation falls out of bounds.

        @[JSON::Field(key: "resolverCountLimit")]
        getter resolver_count_limit : Int32?

        # The new Amazon Cognito user pool configuration for the ~GraphqlApi object.

        @[JSON::Field(key: "userPoolConfig")]
        getter user_pool_config : Types::UserPoolConfig?

        # A flag indicating whether to use X-Ray tracing for the GraphqlApi .

        @[JSON::Field(key: "xrayEnabled")]
        getter xray_enabled : Bool?

        def initialize(
          @api_id : String,
          @authentication_type : String,
          @name : String,
          @additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)? = nil,
          @enhanced_metrics_config : Types::EnhancedMetricsConfig? = nil,
          @introspection_config : String? = nil,
          @lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
          @log_config : Types::LogConfig? = nil,
          @merged_api_execution_role_arn : String? = nil,
          @open_id_connect_config : Types::OpenIDConnectConfig? = nil,
          @owner_contact : String? = nil,
          @query_depth_limit : Int32? = nil,
          @resolver_count_limit : Int32? = nil,
          @user_pool_config : Types::UserPoolConfig? = nil,
          @xray_enabled : Bool? = nil
        )
        end
      end


      struct UpdateGraphqlApiResponse
        include JSON::Serializable

        # The updated GraphqlApi object.

        @[JSON::Field(key: "graphqlApi")]
        getter graphql_api : Types::GraphqlApi?

        def initialize(
          @graphql_api : Types::GraphqlApi? = nil
        )
        end
      end


      struct UpdateResolverRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The new field name.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # The new type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The caching configuration for the resolver.

        @[JSON::Field(key: "cachingConfig")]
        getter caching_config : Types::CachingConfig?

        # The resolver code that contains the request and response functions. When code is used, the runtime
        # is required. The runtime value must be APPSYNC_JS .

        @[JSON::Field(key: "code")]
        getter code : String?

        # The new data source name.

        @[JSON::Field(key: "dataSourceName")]
        getter data_source_name : String?

        # The resolver type. UNIT : A UNIT resolver type. A UNIT resolver is the default resolver type. You
        # can use a UNIT resolver to run a GraphQL query against a single data source. PIPELINE : A PIPELINE
        # resolver type. You can use a PIPELINE resolver to invoke a series of Function objects in a serial
        # manner. You can use a pipeline resolver to run a GraphQL query against multiple data sources.

        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The maximum batching size for a resolver.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # Enables or disables enhanced resolver metrics for specified resolvers. Note that metricsConfig won't
        # be used unless the resolverLevelMetricsBehavior value is set to PER_RESOLVER_METRICS . If the
        # resolverLevelMetricsBehavior is set to FULL_REQUEST_RESOLVER_METRICS instead, metricsConfig will be
        # ignored. However, you can still set its value. metricsConfig can be ENABLED or DISABLED .

        @[JSON::Field(key: "metricsConfig")]
        getter metrics_config : String?

        # The PipelineConfig .

        @[JSON::Field(key: "pipelineConfig")]
        getter pipeline_config : Types::PipelineConfig?

        # The new request mapping template. A resolver uses a request mapping template to convert a GraphQL
        # expression into a format that a data source can understand. Mapping templates are written in Apache
        # Velocity Template Language (VTL). VTL request mapping templates are optional when using an Lambda
        # data source. For all other data sources, VTL request and response mapping templates are required.

        @[JSON::Field(key: "requestMappingTemplate")]
        getter request_mapping_template : String?

        # The new response mapping template.

        @[JSON::Field(key: "responseMappingTemplate")]
        getter response_mapping_template : String?


        @[JSON::Field(key: "runtime")]
        getter runtime : Types::AppSyncRuntime?

        # The SyncConfig for a resolver attached to a versioned data source.

        @[JSON::Field(key: "syncConfig")]
        getter sync_config : Types::SyncConfig?

        def initialize(
          @api_id : String,
          @field_name : String,
          @type_name : String,
          @caching_config : Types::CachingConfig? = nil,
          @code : String? = nil,
          @data_source_name : String? = nil,
          @kind : String? = nil,
          @max_batch_size : Int32? = nil,
          @metrics_config : String? = nil,
          @pipeline_config : Types::PipelineConfig? = nil,
          @request_mapping_template : String? = nil,
          @response_mapping_template : String? = nil,
          @runtime : Types::AppSyncRuntime? = nil,
          @sync_config : Types::SyncConfig? = nil
        )
        end
      end


      struct UpdateResolverResponse
        include JSON::Serializable

        # The updated Resolver object.

        @[JSON::Field(key: "resolver")]
        getter resolver : Types::Resolver?

        def initialize(
          @resolver : Types::Resolver? = nil
        )
        end
      end


      struct UpdateSourceApiAssociationRequest
        include JSON::Serializable

        # The ID generated by the AppSync service for the source API association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The identifier of the AppSync Merged API. This is generated by the AppSync service. In most cases,
        # Merged APIs (especially in your account) only require the API ID value or ARN of the merged API.
        # However, Merged APIs in other accounts (cross-account use cases) strictly require the full resource
        # ARN of the merged API.

        @[JSON::Field(key: "mergedApiIdentifier")]
        getter merged_api_identifier : String

        # The description field.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The SourceApiAssociationConfig object data.

        @[JSON::Field(key: "sourceApiAssociationConfig")]
        getter source_api_association_config : Types::SourceApiAssociationConfig?

        def initialize(
          @association_id : String,
          @merged_api_identifier : String,
          @description : String? = nil,
          @source_api_association_config : Types::SourceApiAssociationConfig? = nil
        )
        end
      end


      struct UpdateSourceApiAssociationResponse
        include JSON::Serializable

        # The SourceApiAssociation object data.

        @[JSON::Field(key: "sourceApiAssociation")]
        getter source_api_association : Types::SourceApiAssociation?

        def initialize(
          @source_api_association : Types::SourceApiAssociation? = nil
        )
        end
      end


      struct UpdateTypeRequest
        include JSON::Serializable

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The new type format: SDL or JSON.

        @[JSON::Field(key: "format")]
        getter format : String

        # The new type name.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The new definition.

        @[JSON::Field(key: "definition")]
        getter definition : String?

        def initialize(
          @api_id : String,
          @format : String,
          @type_name : String,
          @definition : String? = nil
        )
        end
      end


      struct UpdateTypeResponse
        include JSON::Serializable

        # The updated Type object.

        @[JSON::Field(key: "type")]
        getter type : Types::Type?

        def initialize(
          @type : Types::Type? = nil
        )
        end
      end

      # Describes an Amazon Cognito user pool configuration.

      struct UserPoolConfig
        include JSON::Serializable

        # The Amazon Web Services Region in which the user pool was created.

        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String

        # The action that you want your GraphQL API to take when a request that uses Amazon Cognito user pool
        # authentication doesn't match the Amazon Cognito user pool configuration.

        @[JSON::Field(key: "defaultAction")]
        getter default_action : String

        # The user pool ID.

        @[JSON::Field(key: "userPoolId")]
        getter user_pool_id : String

        # A regular expression for validating the incoming Amazon Cognito user pool app client ID. If this
        # value isn't set, no filtering is applied.

        @[JSON::Field(key: "appIdClientRegex")]
        getter app_id_client_regex : String?

        def initialize(
          @aws_region : String,
          @default_action : String,
          @user_pool_id : String,
          @app_id_client_regex : String? = nil
        )
        end
      end
    end
  end
end
