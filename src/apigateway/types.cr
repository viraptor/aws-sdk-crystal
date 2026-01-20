require "json"
require "time"

module Aws
  module APIGateway
    module Types

      # Access log settings, including the access log format and access log destination ARN.

      struct AccessLogSettings
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch Logs log group or Kinesis Data Firehose delivery
        # stream to receive access logs. If you specify a Kinesis Data Firehose delivery stream, the stream
        # name must begin with amazon-apigateway- .

        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        # A single line format of the access logs of data, as specified by selected $context variables. The
        # format must include at least $context.requestId .

        @[JSON::Field(key: "format")]
        getter format : String?

        def initialize(
          @destination_arn : String? = nil,
          @format : String? = nil
        )
        end
      end

      # Represents an AWS account that is associated with API Gateway.

      struct Account
        include JSON::Serializable

        # The version of the API keys used for the account.

        @[JSON::Field(key: "apiKeyVersion")]
        getter api_key_version : String?

        # The ARN of an Amazon CloudWatch role for the current Account.

        @[JSON::Field(key: "cloudwatchRoleArn")]
        getter cloudwatch_role_arn : String?

        # A list of features supported for the account. When usage plans are enabled, the features list will
        # include an entry of "UsagePlans" .

        @[JSON::Field(key: "features")]
        getter features : Array(String)?

        # Specifies the API request limits configured for the current Account.

        @[JSON::Field(key: "throttleSettings")]
        getter throttle_settings : Types::ThrottleSettings?

        def initialize(
          @api_key_version : String? = nil,
          @cloudwatch_role_arn : String? = nil,
          @features : Array(String)? = nil,
          @throttle_settings : Types::ThrottleSettings? = nil
        )
        end
      end

      # A resource that can be distributed to callers for executing Method resources that require an API
      # key. API keys can be mapped to any Stage on any RestApi, which indicates that the callers with the
      # API key can make requests to that stage.

      struct ApiKey
        include JSON::Serializable

        # The timestamp when the API Key was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # An Amazon Web Services Marketplace customer identifier, when integrating with the Amazon Web
        # Services SaaS Marketplace.

        @[JSON::Field(key: "customerId")]
        getter customer_id : String?

        # The description of the API Key.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the API Key can be used by callers.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The identifier of the API Key.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp when the API Key was last updated.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # The name of the API Key.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of Stage resources that are associated with the ApiKey resource.

        @[JSON::Field(key: "stageKeys")]
        getter stage_keys : Array(String)?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The value of the API Key.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @created_date : Time? = nil,
          @customer_id : String? = nil,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @id : String? = nil,
          @last_updated_date : Time? = nil,
          @name : String? = nil,
          @stage_keys : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @value : String? = nil
        )
        end
      end

      # The identifier of an ApiKey used in a UsagePlan.

      struct ApiKeyIds
        include JSON::Serializable

        # A list of all the ApiKey identifiers.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # A list of warning messages.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @ids : Array(String)? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Represents a collection of API keys as represented by an ApiKeys resource.

      struct ApiKeys
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::ApiKey)?


        @[JSON::Field(key: "position")]
        getter position : String?

        # A list of warning messages logged during the import of API keys when the failOnWarnings option is
        # set to true.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @items : Array(Types::ApiKey)? = nil,
          @position : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # API stage name of the associated API stage in a usage plan.

      struct ApiStage
        include JSON::Serializable

        # API Id of the associated API stage in a usage plan.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # API stage name of the associated API stage in a usage plan.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        # Map containing method level throttling information for API stage in a usage plan.

        @[JSON::Field(key: "throttle")]
        getter throttle : Hash(String, Types::ThrottleSettings)?

        def initialize(
          @api_id : String? = nil,
          @stage : String? = nil,
          @throttle : Hash(String, Types::ThrottleSettings)? = nil
        )
        end
      end

      # Represents an authorization layer for methods. If enabled on a method, API Gateway will activate the
      # authorizer when a client calls the method.

      struct Authorizer
        include JSON::Serializable

        # Optional customer-defined field, used in OpenAPI imports and exports without functional impact.

        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To
        # specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
        # resource-based permissions on the Lambda function, specify null.

        @[JSON::Field(key: "authorizerCredentials")]
        getter authorizer_credentials : String?

        # The TTL in seconds of cached authorizer results. If it equals 0, authorization caching is disabled.
        # If it is greater than 0, API Gateway will cache authorizer responses. If this field is not set, the
        # default value is 300. The maximum value is 3600, or 1 hour.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # Specifies the authorizer's Uniform Resource Identifier (URI). For TOKEN or REQUEST authorizers, this
        # must be a well-formed Lambda function URI, for example,
        # arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations
        # . In general, the URI has this form arn:aws:apigateway:{region}:lambda:path/{service_api} , where
        # {region} is the same as the region hosting the Lambda function, path indicates that the remaining
        # substring in the URI should be treated as the path to the resource, including the initial / . For
        # Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations .

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?

        # The identifier for the authorizer resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The identity source for which authorization is requested. For a TOKEN or COGNITO_USER_POOLS
        # authorizer, this is required and specifies the request header mapping expression for the custom
        # header holding the authorization token submitted by the client. For example, if the token header
        # name is Auth , the header mapping expression is method.request.header.Auth . For the REQUEST
        # authorizer, this is required when authorization caching is enabled. The value is a comma-separated
        # string of one or more mapping expressions of the specified request parameters. For example, if an
        # Auth header, a Name query string parameter are defined as identity sources, this value is
        # method.request.header.Auth , method.request.querystring.Name . These parameters will be used to
        # derive the authorization caching key and to perform runtime validation of the REQUEST authorizer by
        # verifying all of the identity-related request parameters are present, not null and non-empty. Only
        # when this is true does the authorizer invoke the authorizer Lambda function, otherwise, it returns a
        # 401 Unauthorized response without calling the Lambda function. The valid value is a string of
        # comma-separated mapping expressions of the specified request parameters. When the authorization
        # caching is not enabled, this property is optional.

        @[JSON::Field(key: "identitySource")]
        getter identity_source : String?

        # A validation expression for the incoming identity token. For TOKEN authorizers, this value is a
        # regular expression. For COGNITO_USER_POOLS authorizers, API Gateway will match the aud field of the
        # incoming token from the client against the specified regular expression. It will invoke the
        # authorizer's Lambda function when there is a match. Otherwise, it will return a 401 Unauthorized
        # response without calling the Lambda function. The validation expression does not apply to the
        # REQUEST authorizer.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        # The name of the authorizer.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of the Amazon Cognito user pool ARNs for the COGNITO_USER_POOLS authorizer. Each element is
        # of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id} . For a TOKEN or
        # REQUEST authorizer, this is not defined.

        @[JSON::Field(key: "providerARNs")]
        getter provider_ar_ns : Array(String)?

        # The authorizer type. Valid values are TOKEN for a Lambda function using a single authorization token
        # submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, and
        # COGNITO_USER_POOLS for using an Amazon Cognito user pool.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @auth_type : String? = nil,
          @authorizer_credentials : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_uri : String? = nil,
          @id : String? = nil,
          @identity_source : String? = nil,
          @identity_validation_expression : String? = nil,
          @name : String? = nil,
          @provider_ar_ns : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents a collection of Authorizer resources.

      struct Authorizers
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::Authorizer)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::Authorizer)? = nil,
          @position : String? = nil
        )
        end
      end

      # The submitted request is not valid, for example, the input is incomplete or incorrect. See the
      # accompanying error message for details.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the base path that callers of the API must provide as part of the URL after the domain
      # name.

      struct BasePathMapping
        include JSON::Serializable

        # The base path name that callers of the API must provide as part of the URL after the domain name.

        @[JSON::Field(key: "basePath")]
        getter base_path : String?

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restApiId")]
        getter rest_api_id : String?

        # The name of the associated stage.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @base_path : String? = nil,
          @rest_api_id : String? = nil,
          @stage : String? = nil
        )
        end
      end

      # Represents a collection of BasePathMapping resources.

      struct BasePathMappings
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::BasePathMapping)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::BasePathMapping)? = nil,
          @position : String? = nil
        )
        end
      end

      # Configuration settings of a canary deployment.

      struct CanarySettings
        include JSON::Serializable

        # The ID of the canary deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The percent (0-100) of traffic diverted to a canary deployment.

        @[JSON::Field(key: "percentTraffic")]
        getter percent_traffic : Float64?

        # Stage variables overridden for a canary release deployment, including new stage variables introduced
        # in the canary. These stage variables are represented as a string-to-string map between stage
        # variable names and their values.

        @[JSON::Field(key: "stageVariableOverrides")]
        getter stage_variable_overrides : Hash(String, String)?

        # A Boolean flag to indicate whether the canary deployment uses the stage cache or not.

        @[JSON::Field(key: "useStageCache")]
        getter use_stage_cache : Bool?

        def initialize(
          @deployment_id : String? = nil,
          @percent_traffic : Float64? = nil,
          @stage_variable_overrides : Hash(String, String)? = nil,
          @use_stage_cache : Bool? = nil
        )
        end
      end

      # Represents a client certificate used to configure client-side SSL authentication while sending
      # requests to the integration endpoint.

      struct ClientCertificate
        include JSON::Serializable

        # The identifier of the client certificate.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # The timestamp when the client certificate was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The description of the client certificate.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the client certificate will expire.

        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # The PEM-encoded public key of the client certificate, which can be used to configure certificate
        # authentication in the integration endpoint .

        @[JSON::Field(key: "pemEncodedCertificate")]
        getter pem_encoded_certificate : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @pem_encoded_certificate : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a collection of ClientCertificate resources.

      struct ClientCertificates
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::ClientCertificate)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::ClientCertificate)? = nil,
          @position : String? = nil
        )
        end
      end

      # The request configuration has conflicts. For details, see the accompanying error message.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Request to create an ApiKey resource.

      struct CreateApiKeyRequest
        include JSON::Serializable

        # An Amazon Web Services Marketplace customer identifier, when integrating with the Amazon Web
        # Services SaaS Marketplace.

        @[JSON::Field(key: "customerId")]
        getter customer_id : String?

        # The description of the ApiKey.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the ApiKey can be used by callers.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Specifies whether ( true ) or not ( false ) the key identifier is distinct from the created API key
        # value. This parameter is deprecated and should not be used.

        @[JSON::Field(key: "generateDistinctId")]
        getter generate_distinct_id : Bool?

        # The name of the ApiKey.

        @[JSON::Field(key: "name")]
        getter name : String?

        # DEPRECATED FOR USAGE PLANS - Specifies stages associated with the API key.

        @[JSON::Field(key: "stageKeys")]
        getter stage_keys : Array(Types::StageKey)?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies a value of the API key.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @customer_id : String? = nil,
          @description : String? = nil,
          @enabled : Bool? = nil,
          @generate_distinct_id : Bool? = nil,
          @name : String? = nil,
          @stage_keys : Array(Types::StageKey)? = nil,
          @tags : Hash(String, String)? = nil,
          @value : String? = nil
        )
        end
      end

      # Request to add a new Authorizer to an existing RestApi resource.

      struct CreateAuthorizerRequest
        include JSON::Serializable

        # The name of the authorizer.

        @[JSON::Field(key: "name")]
        getter name : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The authorizer type. Valid values are TOKEN for a Lambda function using a single authorization token
        # submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, and
        # COGNITO_USER_POOLS for using an Amazon Cognito user pool.

        @[JSON::Field(key: "type")]
        getter type : String

        # Optional customer-defined field, used in OpenAPI imports and exports without functional impact.

        @[JSON::Field(key: "authType")]
        getter auth_type : String?

        # Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To
        # specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
        # resource-based permissions on the Lambda function, specify null.

        @[JSON::Field(key: "authorizerCredentials")]
        getter authorizer_credentials : String?

        # The TTL in seconds of cached authorizer results. If it equals 0, authorization caching is disabled.
        # If it is greater than 0, API Gateway will cache authorizer responses. If this field is not set, the
        # default value is 300. The maximum value is 3600, or 1 hour.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # Specifies the authorizer's Uniform Resource Identifier (URI). For TOKEN or REQUEST authorizers, this
        # must be a well-formed Lambda function URI, for example,
        # arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations
        # . In general, the URI has this form arn:aws:apigateway:{region}:lambda:path/{service_api} , where
        # {region} is the same as the region hosting the Lambda function, path indicates that the remaining
        # substring in the URI should be treated as the path to the resource, including the initial / . For
        # Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations .

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?

        # The identity source for which authorization is requested. For a TOKEN or COGNITO_USER_POOLS
        # authorizer, this is required and specifies the request header mapping expression for the custom
        # header holding the authorization token submitted by the client. For example, if the token header
        # name is Auth , the header mapping expression is method.request.header.Auth . For the REQUEST
        # authorizer, this is required when authorization caching is enabled. The value is a comma-separated
        # string of one or more mapping expressions of the specified request parameters. For example, if an
        # Auth header, a Name query string parameter are defined as identity sources, this value is
        # method.request.header.Auth, method.request.querystring.Name . These parameters will be used to
        # derive the authorization caching key and to perform runtime validation of the REQUEST authorizer by
        # verifying all of the identity-related request parameters are present, not null and non-empty. Only
        # when this is true does the authorizer invoke the authorizer Lambda function, otherwise, it returns a
        # 401 Unauthorized response without calling the Lambda function. The valid value is a string of
        # comma-separated mapping expressions of the specified request parameters. When the authorization
        # caching is not enabled, this property is optional.

        @[JSON::Field(key: "identitySource")]
        getter identity_source : String?

        # A validation expression for the incoming identity token. For TOKEN authorizers, this value is a
        # regular expression. For COGNITO_USER_POOLS authorizers, API Gateway will match the aud field of the
        # incoming token from the client against the specified regular expression. It will invoke the
        # authorizer's Lambda function when there is a match. Otherwise, it will return a 401 Unauthorized
        # response without calling the Lambda function. The validation expression does not apply to the
        # REQUEST authorizer.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        # A list of the Amazon Cognito user pool ARNs for the COGNITO_USER_POOLS authorizer. Each element is
        # of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id} . For a TOKEN or
        # REQUEST authorizer, this is not defined.

        @[JSON::Field(key: "providerARNs")]
        getter provider_ar_ns : Array(String)?

        def initialize(
          @name : String,
          @rest_api_id : String,
          @type : String,
          @auth_type : String? = nil,
          @authorizer_credentials : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_uri : String? = nil,
          @identity_source : String? = nil,
          @identity_validation_expression : String? = nil,
          @provider_ar_ns : Array(String)? = nil
        )
        end
      end

      # Requests API Gateway to create a new BasePathMapping resource.

      struct CreateBasePathMappingRequest
        include JSON::Serializable

        # The domain name of the BasePathMapping resource to create.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restApiId")]
        getter rest_api_id : String

        # The base path name that callers of the API must provide as part of the URL after the domain name.
        # This value must be unique for all of the mappings across a single API. Specify '(none)' if you do
        # not want callers to specify a base path name after the domain name.

        @[JSON::Field(key: "basePath")]
        getter base_path : String?

        # The identifier for the domain name resource. Required for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        # The name of the API's stage that you want to use for this mapping. Specify '(none)' if you want
        # callers to explicitly specify the stage name after any base path name.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @domain_name : String,
          @rest_api_id : String,
          @base_path : String? = nil,
          @domain_name_id : String? = nil,
          @stage : String? = nil
        )
        end
      end

      # Requests API Gateway to create a Deployment resource.

      struct CreateDeploymentRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Enables a cache cluster for the Stage resource specified in the input.

        @[JSON::Field(key: "cacheClusterEnabled")]
        getter cache_cluster_enabled : Bool?

        # The stage's cache capacity in GB. For more information about choosing a cache size, see Enabling API
        # caching to enhance responsiveness .

        @[JSON::Field(key: "cacheClusterSize")]
        getter cache_cluster_size : String?

        # The input configuration for the canary deployment when the deployment is a canary release
        # deployment.

        @[JSON::Field(key: "canarySettings")]
        getter canary_settings : Types::DeploymentCanarySettings?

        # The description for the Deployment resource to create.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The description of the Stage resource for the Deployment resource to create.

        @[JSON::Field(key: "stageDescription")]
        getter stage_description : String?

        # The name of the Stage resource for the Deployment resource to create.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        # Specifies whether active tracing with X-ray is enabled for the Stage.

        @[JSON::Field(key: "tracingEnabled")]
        getter tracing_enabled : Bool?

        # A map that defines the stage variables for the Stage resource that is associated with the new
        # deployment. Variable names can have alphanumeric and underscore characters, and the values must
        # match [A-Za-z0-9-._~:/?#&amp;=,]+ .

        @[JSON::Field(key: "variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @rest_api_id : String,
          @cache_cluster_enabled : Bool? = nil,
          @cache_cluster_size : String? = nil,
          @canary_settings : Types::DeploymentCanarySettings? = nil,
          @description : String? = nil,
          @stage_description : String? = nil,
          @stage_name : String? = nil,
          @tracing_enabled : Bool? = nil,
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # Creates a new documentation part of a given API.

      struct CreateDocumentationPartRequest
        include JSON::Serializable

        # The location of the targeted API entity of the to-be-created documentation part.

        @[JSON::Field(key: "location")]
        getter location : Types::DocumentationPartLocation

        # The new documentation content map of the targeted API entity. Enclosed key-value pairs are
        # API-specific, but only OpenAPI-compliant key-value pairs can be exported and, hence, published.

        @[JSON::Field(key: "properties")]
        getter properties : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @location : Types::DocumentationPartLocation,
          @properties : String,
          @rest_api_id : String
        )
        end
      end

      # Creates a new documentation version of a given API.

      struct CreateDocumentationVersionRequest
        include JSON::Serializable

        # The version identifier of the new snapshot.

        @[JSON::Field(key: "documentationVersion")]
        getter documentation_version : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A description about the new documentation snapshot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The stage name to be associated with the new documentation snapshot.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @documentation_version : String,
          @rest_api_id : String,
          @description : String? = nil,
          @stage_name : String? = nil
        )
        end
      end


      struct CreateDomainNameAccessAssociationRequest
        include JSON::Serializable

        # The identifier of the domain name access association source. For a VPCE, the value is the VPC
        # endpoint ID.

        @[JSON::Field(key: "accessAssociationSource")]
        getter access_association_source : String

        # The type of the domain name access association source.

        @[JSON::Field(key: "accessAssociationSourceType")]
        getter access_association_source_type : String

        # The ARN of the domain name.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_association_source : String,
          @access_association_source_type : String,
          @domain_name_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A request to create a new domain name.

      struct CreateDomainNameRequest
        include JSON::Serializable

        # The name of the DomainName resource.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The reference to an Amazon Web Services-managed certificate that will be used by edge-optimized
        # endpoint or private endpoint for this domain name. Certificate Manager is the only supported source.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # [Deprecated] The body of the server certificate that will be used by edge-optimized endpoint or
        # private endpoint for this domain name provided by your certificate authority.

        @[JSON::Field(key: "certificateBody")]
        getter certificate_body : String?

        # [Deprecated] The intermediate certificates and optionally the root certificate, one after the other
        # without any blank lines, used by an edge-optimized endpoint for this domain name. If you include the
        # root certificate, your certificate chain must start with intermediate certificates and end with the
        # root certificate. Use the intermediate certificates that were provided by your certificate
        # authority. Do not include any intermediaries that are not in the chain of trust path.

        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : String?

        # The user-friendly name of the certificate that will be used by edge-optimized endpoint or private
        # endpoint for this domain name.

        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # [Deprecated] Your edge-optimized endpoint's domain name certificate's private key.

        @[JSON::Field(key: "certificatePrivateKey")]
        getter certificate_private_key : String?

        # The endpoint access mode of the DomainName. Only available for DomainNames that use security
        # policies that start with SecurityPolicy_ .

        @[JSON::Field(key: "endpointAccessMode")]
        getter endpoint_access_mode : String?

        # The endpoint configuration of this DomainName showing the endpoint types and IP address types of the
        # domain name.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfiguration?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthenticationInput?

        # The ARN of the public certificate issued by ACM to validate ownership of your custom domain. Only
        # required when configuring mutual TLS and using an ACM imported or private CA certificate ARN as the
        # regionalCertificateArn.

        @[JSON::Field(key: "ownershipVerificationCertificateArn")]
        getter ownership_verification_certificate_arn : String?

        # A stringified JSON policy document that applies to the execute-api service for this DomainName
        # regardless of the caller and Method configuration. Supported only for private custom domain names.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The reference to an Amazon Web Services-managed certificate that will be used by regional endpoint
        # for this domain name. Certificate Manager is the only supported source.

        @[JSON::Field(key: "regionalCertificateArn")]
        getter regional_certificate_arn : String?

        # The user-friendly name of the certificate that will be used by regional endpoint for this domain
        # name.

        @[JSON::Field(key: "regionalCertificateName")]
        getter regional_certificate_name : String?

        # The routing mode for this domain name. The routing mode determines how API Gateway sends traffic
        # from your custom domain name to your private APIs.

        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        # The Transport Layer Security (TLS) version + cipher suite for this DomainName.

        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @certificate_arn : String? = nil,
          @certificate_body : String? = nil,
          @certificate_chain : String? = nil,
          @certificate_name : String? = nil,
          @certificate_private_key : String? = nil,
          @endpoint_access_mode : String? = nil,
          @endpoint_configuration : Types::EndpointConfiguration? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
          @ownership_verification_certificate_arn : String? = nil,
          @policy : String? = nil,
          @regional_certificate_arn : String? = nil,
          @regional_certificate_name : String? = nil,
          @routing_mode : String? = nil,
          @security_policy : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Request to add a new Model to an existing RestApi resource.

      struct CreateModelRequest
        include JSON::Serializable

        # The content-type for the model.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The name of the model. Must be alphanumeric.

        @[JSON::Field(key: "name")]
        getter name : String

        # The RestApi identifier under which the Model will be created.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The description of the model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The schema for the model. For application/json models, this should be JSON schema draft 4 model. The
        # maximum size of the model is 400 KB.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String,
          @name : String,
          @rest_api_id : String,
          @description : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # Creates a RequestValidator of a given RestApi.

      struct CreateRequestValidatorRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the to-be-created RequestValidator.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A Boolean flag to indicate whether to validate request body according to the configured model schema
        # for the method ( true ) or not ( false ).

        @[JSON::Field(key: "validateRequestBody")]
        getter validate_request_body : Bool?

        # A Boolean flag to indicate whether to validate request parameters, true , or not false .

        @[JSON::Field(key: "validateRequestParameters")]
        getter validate_request_parameters : Bool?

        def initialize(
          @rest_api_id : String,
          @name : String? = nil,
          @validate_request_body : Bool? = nil,
          @validate_request_parameters : Bool? = nil
        )
        end
      end

      # Requests API Gateway to create a Resource resource.

      struct CreateResourceRequest
        include JSON::Serializable

        # The parent resource's identifier.

        @[JSON::Field(key: "parent_id")]
        getter parent_id : String

        # The last path segment for this resource.

        @[JSON::Field(key: "pathPart")]
        getter path_part : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @parent_id : String,
          @path_part : String,
          @rest_api_id : String
        )
        end
      end

      # The POST Request to add a new RestApi resource to your collection.

      struct CreateRestApiRequest
        include JSON::Serializable

        # The name of the RestApi.

        @[JSON::Field(key: "name")]
        getter name : String

        # The source of the API key for metering requests according to a usage plan. Valid values are: HEADER
        # to read the API key from the X-API-Key header of a request. AUTHORIZER to read the API key from the
        # UsageIdentifierKey from a custom authorizer.

        @[JSON::Field(key: "apiKeySource")]
        getter api_key_source : String?

        # The list of binary media types supported by the RestApi. By default, the RestApi supports only
        # UTF-8-encoded text payloads.

        @[JSON::Field(key: "binaryMediaTypes")]
        getter binary_media_types : Array(String)?

        # The ID of the RestApi that you want to clone from.

        @[JSON::Field(key: "cloneFrom")]
        getter clone_from : String?

        # The description of the RestApi.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether clients can invoke your API by using the default execute-api endpoint. By default,
        # clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com
        # endpoint. To require that clients use a custom domain name to invoke your API, disable the default
        # endpoint

        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?

        # The endpoint access mode of the RestApi. Only available for RestApis that use security policies that
        # start with SecurityPolicy_ .

        @[JSON::Field(key: "endpointAccessMode")]
        getter endpoint_access_mode : String?

        # The endpoint configuration of this RestApi showing the endpoint types and IP address types of the
        # API.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfiguration?

        # A nullable integer that is used to enable compression (with non-negative between 0 and 10485760
        # (10M) bytes, inclusive) or disable compression (with a null value) on an API. When compression is
        # enabled, compression or decompression is not applied on the payload if the payload size is smaller
        # than this value. Setting it to zero allows compression for any payload size.

        @[JSON::Field(key: "minimumCompressionSize")]
        getter minimum_compression_size : Int32?

        # A stringified JSON policy document that applies to this RestApi regardless of the caller and Method
        # configuration.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The Transport Layer Security (TLS) version + cipher suite for this RestApi.

        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A version identifier for the API.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String,
          @api_key_source : String? = nil,
          @binary_media_types : Array(String)? = nil,
          @clone_from : String? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @endpoint_access_mode : String? = nil,
          @endpoint_configuration : Types::EndpointConfiguration? = nil,
          @minimum_compression_size : Int32? = nil,
          @policy : String? = nil,
          @security_policy : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil
        )
        end
      end

      # Requests API Gateway to create a Stage resource.

      struct CreateStageRequest
        include JSON::Serializable

        # The identifier of the Deployment resource for the Stage resource.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name for the Stage resource. Stage names can only contain alphanumeric characters, hyphens, and
        # underscores. Maximum length is 128 characters.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # Whether cache clustering is enabled for the stage.

        @[JSON::Field(key: "cacheClusterEnabled")]
        getter cache_cluster_enabled : Bool?

        # The stage's cache capacity in GB. For more information about choosing a cache size, see Enabling API
        # caching to enhance responsiveness .

        @[JSON::Field(key: "cacheClusterSize")]
        getter cache_cluster_size : String?

        # The canary deployment settings of this stage.

        @[JSON::Field(key: "canarySettings")]
        getter canary_settings : Types::CanarySettings?

        # The description of the Stage resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the associated API documentation.

        @[JSON::Field(key: "documentationVersion")]
        getter documentation_version : String?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies whether active tracing with X-ray is enabled for the Stage.

        @[JSON::Field(key: "tracingEnabled")]
        getter tracing_enabled : Bool?

        # A map that defines the stage variables for the new Stage resource. Variable names can have
        # alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+ .

        @[JSON::Field(key: "variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @deployment_id : String,
          @rest_api_id : String,
          @stage_name : String,
          @cache_cluster_enabled : Bool? = nil,
          @cache_cluster_size : String? = nil,
          @canary_settings : Types::CanarySettings? = nil,
          @description : String? = nil,
          @documentation_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tracing_enabled : Bool? = nil,
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # The POST request to create a usage plan key for adding an existing API key to a usage plan.

      struct CreateUsagePlanKeyRequest
        include JSON::Serializable

        # The identifier of a UsagePlanKey resource for a plan customer.

        @[JSON::Field(key: "keyId")]
        getter key_id : String

        # The type of a UsagePlanKey resource for a plan customer.

        @[JSON::Field(key: "keyType")]
        getter key_type : String

        # The Id of the UsagePlan resource representing the usage plan containing the to-be-created
        # UsagePlanKey resource representing a plan customer.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        def initialize(
          @key_id : String,
          @key_type : String,
          @usage_plan_id : String
        )
        end
      end

      # The POST request to create a usage plan with the name, description, throttle limits and quota
      # limits, as well as the associated API stages, specified in the payload.

      struct CreateUsagePlanRequest
        include JSON::Serializable

        # The name of the usage plan.

        @[JSON::Field(key: "name")]
        getter name : String

        # The associated API stages of the usage plan.

        @[JSON::Field(key: "apiStages")]
        getter api_stages : Array(Types::ApiStage)?

        # The description of the usage plan.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The quota of the usage plan.

        @[JSON::Field(key: "quota")]
        getter quota : Types::QuotaSettings?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The throttling limits of the usage plan.

        @[JSON::Field(key: "throttle")]
        getter throttle : Types::ThrottleSettings?

        def initialize(
          @name : String,
          @api_stages : Array(Types::ApiStage)? = nil,
          @description : String? = nil,
          @quota : Types::QuotaSettings? = nil,
          @tags : Hash(String, String)? = nil,
          @throttle : Types::ThrottleSettings? = nil
        )
        end
      end

      # Creates a VPC link, under the caller's account in a selected region, in an asynchronous operation
      # that typically takes 2-4 minutes to complete and become operational. The caller must have
      # permissions to create and update VPC Endpoint services.

      struct CreateVpcLinkRequest
        include JSON::Serializable

        # The name used to label and identify the VPC link.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the network load balancer of the VPC targeted by the VPC link. The network load balancer
        # must be owned by the same Amazon Web Services account of the API owner.

        @[JSON::Field(key: "targetArns")]
        getter target_arns : Array(String)

        # The description of the VPC link.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @target_arns : Array(String),
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A request to delete the ApiKey resource.

      struct DeleteApiKeyRequest
        include JSON::Serializable

        # The identifier of the ApiKey resource to be deleted.

        @[JSON::Field(key: "api_Key")]
        getter api_key : String

        def initialize(
          @api_key : String
        )
        end
      end

      # Request to delete an existing Authorizer resource.

      struct DeleteAuthorizerRequest
        include JSON::Serializable

        # The identifier of the Authorizer resource.

        @[JSON::Field(key: "authorizer_id")]
        getter authorizer_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @authorizer_id : String,
          @rest_api_id : String
        )
        end
      end

      # A request to delete the BasePathMapping resource.

      struct DeleteBasePathMappingRequest
        include JSON::Serializable

        # The base path name of the BasePathMapping resource to delete. To specify an empty base path, set
        # this parameter to '(none)' .

        @[JSON::Field(key: "base_path")]
        getter base_path : String

        # The domain name of the BasePathMapping resource to delete.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @base_path : String,
          @domain_name : String,
          @domain_name_id : String? = nil
        )
        end
      end

      # A request to delete the ClientCertificate resource.

      struct DeleteClientCertificateRequest
        include JSON::Serializable

        # The identifier of the ClientCertificate resource to be deleted.

        @[JSON::Field(key: "clientcertificate_id")]
        getter client_certificate_id : String

        def initialize(
          @client_certificate_id : String
        )
        end
      end

      # Requests API Gateway to delete a Deployment resource.

      struct DeleteDeploymentRequest
        include JSON::Serializable

        # The identifier of the Deployment resource to delete.

        @[JSON::Field(key: "deployment_id")]
        getter deployment_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @deployment_id : String,
          @rest_api_id : String
        )
        end
      end

      # Deletes an existing documentation part of an API.

      struct DeleteDocumentationPartRequest
        include JSON::Serializable

        # The identifier of the to-be-deleted documentation part.

        @[JSON::Field(key: "part_id")]
        getter documentation_part_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @documentation_part_id : String,
          @rest_api_id : String
        )
        end
      end

      # Deletes an existing documentation version of an API.

      struct DeleteDocumentationVersionRequest
        include JSON::Serializable

        # The version identifier of a to-be-deleted documentation snapshot.

        @[JSON::Field(key: "doc_version")]
        getter documentation_version : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @documentation_version : String,
          @rest_api_id : String
        )
        end
      end


      struct DeleteDomainNameAccessAssociationRequest
        include JSON::Serializable

        # The ARN of the domain name access association resource.

        @[JSON::Field(key: "domain_name_access_association_arn")]
        getter domain_name_access_association_arn : String

        def initialize(
          @domain_name_access_association_arn : String
        )
        end
      end

      # A request to delete the DomainName resource.

      struct DeleteDomainNameRequest
        include JSON::Serializable

        # The name of the DomainName resource to be deleted.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @domain_name : String,
          @domain_name_id : String? = nil
        )
        end
      end

      # Clears any customization of a GatewayResponse of a specified response type on the given RestApi and
      # resets it with the default settings.

      struct DeleteGatewayResponseRequest
        include JSON::Serializable

        # The response type of the associated GatewayResponse.

        @[JSON::Field(key: "response_type")]
        getter response_type : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @response_type : String,
          @rest_api_id : String
        )
        end
      end

      # Represents a delete integration request.

      struct DeleteIntegrationRequest
        include JSON::Serializable

        # Specifies a delete integration request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a delete integration request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String
        )
        end
      end

      # Represents a delete integration response request.

      struct DeleteIntegrationResponseRequest
        include JSON::Serializable

        # Specifies a delete integration response request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a delete integration response request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies a delete integration response request's status code.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String
        )
        end
      end

      # Request to delete an existing Method resource.

      struct DeleteMethodRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the Method resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String
        )
        end
      end

      # A request to delete an existing MethodResponse resource.

      struct DeleteMethodResponseRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the MethodResponse resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The status code identifier for the MethodResponse resource.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String
        )
        end
      end

      # Request to delete an existing model in an existing RestApi resource.

      struct DeleteModelRequest
        include JSON::Serializable

        # The name of the model to delete.

        @[JSON::Field(key: "model_name")]
        getter model_name : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @model_name : String,
          @rest_api_id : String
        )
        end
      end

      # Deletes a specified RequestValidator of a given RestApi.

      struct DeleteRequestValidatorRequest
        include JSON::Serializable

        # The identifier of the RequestValidator to be deleted.

        @[JSON::Field(key: "requestvalidator_id")]
        getter request_validator_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @request_validator_id : String,
          @rest_api_id : String
        )
        end
      end

      # Request to delete a Resource.

      struct DeleteResourceRequest
        include JSON::Serializable

        # The identifier of the Resource resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @resource_id : String,
          @rest_api_id : String
        )
        end
      end

      # Request to delete the specified API from your collection.

      struct DeleteRestApiRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @rest_api_id : String
        )
        end
      end

      # Requests API Gateway to delete a Stage resource.

      struct DeleteStageRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the Stage resource to delete.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        def initialize(
          @rest_api_id : String,
          @stage_name : String
        )
        end
      end

      # The DELETE request to delete a usage plan key and remove the underlying API key from the associated
      # usage plan.

      struct DeleteUsagePlanKeyRequest
        include JSON::Serializable

        # The Id of the UsagePlanKey resource to be deleted.

        @[JSON::Field(key: "keyId")]
        getter key_id : String

        # The Id of the UsagePlan resource representing the usage plan containing the to-be-deleted
        # UsagePlanKey resource representing a plan customer.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        def initialize(
          @key_id : String,
          @usage_plan_id : String
        )
        end
      end

      # The DELETE request to delete a usage plan of a given plan Id.

      struct DeleteUsagePlanRequest
        include JSON::Serializable

        # The Id of the to-be-deleted usage plan.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        def initialize(
          @usage_plan_id : String
        )
        end
      end

      # Deletes an existing VpcLink of a specified identifier.

      struct DeleteVpcLinkRequest
        include JSON::Serializable

        # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.

        @[JSON::Field(key: "vpclink_id")]
        getter vpc_link_id : String

        def initialize(
          @vpc_link_id : String
        )
        end
      end

      # An immutable representation of a RestApi resource that can be called by users using Stages. A
      # deployment must be associated with a Stage for it to be callable over the Internet.

      struct Deployment
        include JSON::Serializable

        # A summary of the RestApi at the date and time that the deployment resource was created.

        @[JSON::Field(key: "apiSummary")]
        getter api_summary : Hash(String, Hash(String, Types::MethodSnapshot))?

        # The date and time that the deployment resource was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The description for the deployment resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier for the deployment resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @api_summary : Hash(String, Hash(String, Types::MethodSnapshot))? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The input configuration for a canary deployment.

      struct DeploymentCanarySettings
        include JSON::Serializable

        # The percentage (0.0-100.0) of traffic routed to the canary deployment.

        @[JSON::Field(key: "percentTraffic")]
        getter percent_traffic : Float64?

        # A stage variable overrides used for the canary release deployment. They can override existing stage
        # variables or add new stage variables for the canary release deployment. These stage variables are
        # represented as a string-to-string map between stage variable names and their values.

        @[JSON::Field(key: "stageVariableOverrides")]
        getter stage_variable_overrides : Hash(String, String)?

        # A Boolean flag to indicate whether the canary release deployment uses the stage cache or not.

        @[JSON::Field(key: "useStageCache")]
        getter use_stage_cache : Bool?

        def initialize(
          @percent_traffic : Float64? = nil,
          @stage_variable_overrides : Hash(String, String)? = nil,
          @use_stage_cache : Bool? = nil
        )
        end
      end

      # Represents a collection resource that contains zero or more references to your existing deployments,
      # and links that guide you on how to interact with your collection. The collection offers a paginated
      # view of the contained deployments.

      struct Deployments
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::Deployment)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::Deployment)? = nil,
          @position : String? = nil
        )
        end
      end

      # A documentation part for a targeted API entity.

      struct DocumentationPart
        include JSON::Serializable

        # The DocumentationPart identifier, generated by API Gateway when the DocumentationPart is created.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The location of the API entity to which the documentation applies. Valid fields depend on the
        # targeted API entity type. All the valid location fields are not required. If not explicitly
        # specified, a valid location field is treated as a wildcard and associated documentation content may
        # be inherited by matching entities, unless overridden.

        @[JSON::Field(key: "location")]
        getter location : Types::DocumentationPartLocation?

        # A content map of API-specific key-value pairs describing the targeted API entity. The map must be
        # encoded as a JSON string, e.g., "{ \"description\": \"The API does ...\" }" . Only OpenAPI-compliant
        # documentation-related fields from the properties map are exported and, hence, published as part of
        # the API entity definitions, while the original documentation parts are exported in a OpenAPI
        # extension of x-amazon-apigateway-documentation .

        @[JSON::Field(key: "properties")]
        getter properties : String?

        def initialize(
          @id : String? = nil,
          @location : Types::DocumentationPartLocation? = nil,
          @properties : String? = nil
        )
        end
      end

      # A collection of the imported DocumentationPart identifiers.

      struct DocumentationPartIds
        include JSON::Serializable

        # A list of the returned documentation part identifiers.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # A list of warning messages reported during import of documentation parts.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @ids : Array(String)? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Specifies the target API entity to which the documentation applies.

      struct DocumentationPartLocation
        include JSON::Serializable

        # The type of API entity to which the documentation content applies. Valid values are API , AUTHORIZER
        # , MODEL , RESOURCE , METHOD , PATH_PARAMETER , QUERY_PARAMETER , REQUEST_HEADER , REQUEST_BODY ,
        # RESPONSE , RESPONSE_HEADER , and RESPONSE_BODY . Content inheritance does not apply to any entity of
        # the API , AUTHORIZER , METHOD , MODEL , REQUEST_BODY , or RESOURCE type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The HTTP verb of a method. It is a valid field for the API entity types of METHOD , PATH_PARAMETER ,
        # QUERY_PARAMETER , REQUEST_HEADER , REQUEST_BODY , RESPONSE , RESPONSE_HEADER , and RESPONSE_BODY .
        # The default value is * for any method. When an applicable child entity inherits the content of an
        # entity of the same type with more general specifications of the other location attributes, the child
        # entity's method attribute must match that of the parent entity exactly.

        @[JSON::Field(key: "method")]
        getter method : String?

        # The name of the targeted API entity. It is a valid and required field for the API entity types of
        # AUTHORIZER , MODEL , PATH_PARAMETER , QUERY_PARAMETER , REQUEST_HEADER , REQUEST_BODY and
        # RESPONSE_HEADER . It is an invalid field for any other entity type.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL path of the target. It is a valid field for the API entity types of RESOURCE , METHOD ,
        # PATH_PARAMETER , QUERY_PARAMETER , REQUEST_HEADER , REQUEST_BODY , RESPONSE , RESPONSE_HEADER , and
        # RESPONSE_BODY . The default value is / for the root resource. When an applicable child entity
        # inherits the content of another entity of the same type with more general specifications of the
        # other location attributes, the child entity's path attribute must match that of the parent entity as
        # a prefix.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The HTTP status code of a response. It is a valid field for the API entity types of RESPONSE ,
        # RESPONSE_HEADER , and RESPONSE_BODY . The default value is * for any status code. When an applicable
        # child entity inherits the content of an entity of the same type with more general specifications of
        # the other location attributes, the child entity's statusCode attribute must match that of the parent
        # entity exactly.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @type : String,
          @method : String? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The collection of documentation parts of an API.

      struct DocumentationParts
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::DocumentationPart)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::DocumentationPart)? = nil,
          @position : String? = nil
        )
        end
      end

      # A snapshot of the documentation of an API.

      struct DocumentationVersion
        include JSON::Serializable

        # The date when the API documentation snapshot is created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The description of the API documentation snapshot.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version identifier of the API documentation snapshot.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @created_date : Time? = nil,
          @description : String? = nil,
          @version : String? = nil
        )
        end
      end

      # The collection of documentation snapshots of an API.

      struct DocumentationVersions
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::DocumentationVersion)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::DocumentationVersion)? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents a custom domain name as a user-friendly host name of an API (RestApi).

      struct DomainName
        include JSON::Serializable

        # The reference to an Amazon Web Services-managed certificate that will be used by edge-optimized
        # endpoint or private endpoint for this domain name. Certificate Manager is the only supported source.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The name of the certificate that will be used by edge-optimized endpoint or private endpoint for
        # this domain name.

        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The timestamp when the certificate that was used by edge-optimized endpoint or private endpoint for
        # this domain name was uploaded.

        @[JSON::Field(key: "certificateUploadDate")]
        getter certificate_upload_date : Time?

        # The domain name of the Amazon CloudFront distribution associated with this custom domain name for an
        # edge-optimized endpoint. You set up this association when adding a DNS record pointing the custom
        # domain name to this distribution name. For more information about CloudFront distributions, see the
        # Amazon CloudFront documentation.

        @[JSON::Field(key: "distributionDomainName")]
        getter distribution_domain_name : String?

        # The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized endpoint. The valid value
        # is Z2FDTNDATAQYW2 for all the regions. For more information, see Set up a Regional Custom Domain
        # Name and AWS Regions and Endpoints for API Gateway.

        @[JSON::Field(key: "distributionHostedZoneId")]
        getter distribution_hosted_zone_id : String?

        # The custom domain name as an API host name, for example, my-api.example.com .

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The ARN of the domain name.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        # The status of the DomainName migration. The valid values are AVAILABLE and UPDATING . If the status
        # is UPDATING , the domain cannot be modified further until the existing operation is complete. If it
        # is AVAILABLE , the domain can be updated.

        @[JSON::Field(key: "domainNameStatus")]
        getter domain_name_status : String?

        # An optional text message containing detailed information about status of the DomainName migration.

        @[JSON::Field(key: "domainNameStatusMessage")]
        getter domain_name_status_message : String?

        # The endpoint access mode of the DomainName.

        @[JSON::Field(key: "endpointAccessMode")]
        getter endpoint_access_mode : String?

        # The endpoint configuration of this DomainName showing the endpoint types and IP address types of the
        # domain name.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfiguration?

        # A stringified JSON policy document that applies to the API Gateway Management service for this
        # DomainName. This policy document controls access for access association sources to create domain
        # name access associations with this DomainName. Supported only for private custom domain names.

        @[JSON::Field(key: "managementPolicy")]
        getter management_policy : String?

        # The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway
        # performs two-way authentication between the client and the server. Clients must present a trusted
        # certificate to access your API.

        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthentication?

        # The ARN of the public certificate issued by ACM to validate ownership of your custom domain. Only
        # required when configuring mutual TLS and using an ACM imported or private CA certificate ARN as the
        # regionalCertificateArn.

        @[JSON::Field(key: "ownershipVerificationCertificateArn")]
        getter ownership_verification_certificate_arn : String?

        # A stringified JSON policy document that applies to the execute-api service for this DomainName
        # regardless of the caller and Method configuration. Supported only for private custom domain names.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The reference to an Amazon Web Services-managed certificate that will be used for validating the
        # regional domain name. Certificate Manager is the only supported source.

        @[JSON::Field(key: "regionalCertificateArn")]
        getter regional_certificate_arn : String?

        # The name of the certificate that will be used for validating the regional domain name.

        @[JSON::Field(key: "regionalCertificateName")]
        getter regional_certificate_name : String?

        # The domain name associated with the regional endpoint for this custom domain name. You set up this
        # association by adding a DNS record that points the custom domain name to this regional domain name.
        # The regional domain name is returned by API Gateway when you create a regional endpoint.

        @[JSON::Field(key: "regionalDomainName")]
        getter regional_domain_name : String?

        # The region-specific Amazon Route 53 Hosted Zone ID of the regional endpoint. For more information,
        # see Set up a Regional Custom Domain Name and AWS Regions and Endpoints for API Gateway.

        @[JSON::Field(key: "regionalHostedZoneId")]
        getter regional_hosted_zone_id : String?

        # The routing mode for this domain name. The routing mode determines how API Gateway sends traffic
        # from your custom domain name to your private APIs.

        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        # The Transport Layer Security (TLS) version + cipher suite for this DomainName.

        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_name : String? = nil,
          @certificate_upload_date : Time? = nil,
          @distribution_domain_name : String? = nil,
          @distribution_hosted_zone_id : String? = nil,
          @domain_name : String? = nil,
          @domain_name_arn : String? = nil,
          @domain_name_id : String? = nil,
          @domain_name_status : String? = nil,
          @domain_name_status_message : String? = nil,
          @endpoint_access_mode : String? = nil,
          @endpoint_configuration : Types::EndpointConfiguration? = nil,
          @management_policy : String? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthentication? = nil,
          @ownership_verification_certificate_arn : String? = nil,
          @policy : String? = nil,
          @regional_certificate_arn : String? = nil,
          @regional_certificate_name : String? = nil,
          @regional_domain_name : String? = nil,
          @regional_hosted_zone_id : String? = nil,
          @routing_mode : String? = nil,
          @security_policy : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a domain name access association between an access association source and a private
      # custom domain name. With a domain name access association, an access association source can invoke a
      # private custom domain name while isolated from the public internet.

      struct DomainNameAccessAssociation
        include JSON::Serializable

        # The ARN of the domain name access association source. For a VPCE, the ARN must be a VPC endpoint.

        @[JSON::Field(key: "accessAssociationSource")]
        getter access_association_source : String?

        # The type of the domain name access association source.

        @[JSON::Field(key: "accessAssociationSourceType")]
        getter access_association_source_type : String?

        # The ARN of the domain name access association resource.

        @[JSON::Field(key: "domainNameAccessAssociationArn")]
        getter domain_name_access_association_arn : String?

        # The ARN of the domain name.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_association_source : String? = nil,
          @access_association_source_type : String? = nil,
          @domain_name_access_association_arn : String? = nil,
          @domain_name_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DomainNameAccessAssociations
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::DomainNameAccessAssociation)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::DomainNameAccessAssociation)? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents a collection of DomainName resources.

      struct DomainNames
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::DomainName)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::DomainName)? = nil,
          @position : String? = nil
        )
        end
      end

      # The endpoint configuration to indicate the types of endpoints an API (RestApi) or its custom domain
      # name (DomainName) has and the IP address types that can invoke it.

      struct EndpointConfiguration
        include JSON::Serializable

        # The IP address types that can invoke an API (RestApi) or a DomainName. Use ipv4 to allow only IPv4
        # addresses to invoke an API or DomainName, or use dualstack to allow both IPv4 and IPv6 addresses to
        # invoke an API or a DomainName. For the PRIVATE endpoint type, only dualstack is supported.

        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # A list of endpoint types of an API (RestApi) or its custom domain name (DomainName). For an
        # edge-optimized API and its custom domain name, the endpoint type is "EDGE" . For a regional API and
        # its custom domain name, the endpoint type is REGIONAL . For a private API, the endpoint type is
        # PRIVATE .

        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        # A list of VpcEndpointIds of an API (RestApi) against which to create Route53 ALIASes. It is only
        # supported for PRIVATE endpoint type.

        @[JSON::Field(key: "vpcEndpointIds")]
        getter vpc_endpoint_ids : Array(String)?

        def initialize(
          @ip_address_type : String? = nil,
          @types : Array(String)? = nil,
          @vpc_endpoint_ids : Array(String)? = nil
        )
        end
      end

      # The binary blob response to GetExport, which contains the generated SDK.

      struct ExportResponse
        include JSON::Serializable

        # The binary blob response to GetExport, which contains the export.

        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The content-disposition header value in the HTTP response.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # The content-type header value in the HTTP response. This will correspond to a valid 'accept' type in
        # the request.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @body : Bytes? = nil,
          @content_disposition : String? = nil,
          @content_type : String? = nil
        )
        end
      end

      # Request to flush authorizer cache entries on a specified stage.

      struct FlushStageAuthorizersCacheRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the stage to flush.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        def initialize(
          @rest_api_id : String,
          @stage_name : String
        )
        end
      end

      # Requests API Gateway to flush a stage's cache.

      struct FlushStageCacheRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the stage to flush its cache.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        def initialize(
          @rest_api_id : String,
          @stage_name : String
        )
        end
      end

      # A gateway response of a given response type and status code, with optional response parameters and
      # mapping templates.

      struct GatewayResponse
        include JSON::Serializable

        # A Boolean flag to indicate whether this GatewayResponse is the default gateway response ( true ) or
        # not ( false ). A default gateway response is one generated by API Gateway without any customization
        # by an API developer.

        @[JSON::Field(key: "defaultResponse")]
        getter default_response : Bool?

        # Response parameters (paths, query strings and headers) of the GatewayResponse as a string-to-string
        # map of key-value pairs.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # Response templates of the GatewayResponse as a string-to-string map of key-value pairs.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # The response type of the associated GatewayResponse.

        @[JSON::Field(key: "responseType")]
        getter response_type : String?

        # The HTTP status code for this GatewayResponse.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @default_response : Bool? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @response_type : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The collection of the GatewayResponse instances of a RestApi as a responseType -to-GatewayResponse
      # object map of key-value pairs. As such, pagination is not supported for querying this collection.

      struct GatewayResponses
        include JSON::Serializable

        # Returns the entire collection, because of no pagination support.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::GatewayResponse)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::GatewayResponse)? = nil,
          @position : String? = nil
        )
        end
      end

      # A request to generate a ClientCertificate resource.

      struct GenerateClientCertificateRequest
        include JSON::Serializable

        # The description of the ClientCertificate.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Requests API Gateway to get information about the current Account resource.

      struct GetAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A request to get information about the current ApiKey resource.

      struct GetApiKeyRequest
        include JSON::Serializable

        # The identifier of the ApiKey resource.

        @[JSON::Field(key: "api_Key")]
        getter api_key : String

        # A boolean flag to specify whether ( true ) or not ( false ) the result contains the key value.

        @[JSON::Field(key: "includeValue")]
        getter include_value : Bool?

        def initialize(
          @api_key : String,
          @include_value : Bool? = nil
        )
        end
      end

      # A request to get information about the current ApiKeys resource.

      struct GetApiKeysRequest
        include JSON::Serializable

        # The identifier of a customer in Amazon Web Services Marketplace or an external system, such as a
        # developer portal.

        @[JSON::Field(key: "customerId")]
        getter customer_id : String?

        # A boolean flag to specify whether ( true ) or not ( false ) the result contains key values.

        @[JSON::Field(key: "includeValues")]
        getter include_values : Bool?

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The name of queried API keys.

        @[JSON::Field(key: "name")]
        getter name_query : String?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @customer_id : String? = nil,
          @include_values : Bool? = nil,
          @limit : Int32? = nil,
          @name_query : String? = nil,
          @position : String? = nil
        )
        end
      end

      # Request to describe an existing Authorizer resource.

      struct GetAuthorizerRequest
        include JSON::Serializable

        # The identifier of the Authorizer resource.

        @[JSON::Field(key: "authorizer_id")]
        getter authorizer_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @authorizer_id : String,
          @rest_api_id : String
        )
        end
      end

      # Request to describe an existing Authorizers resource.

      struct GetAuthorizersRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Request to describe a BasePathMapping resource.

      struct GetBasePathMappingRequest
        include JSON::Serializable

        # The base path name that callers of the API must provide as part of the URL after the domain name.
        # This value must be unique for all of the mappings across a single API. Specify '(none)' if you do
        # not want callers to specify any base path name after the domain name.

        @[JSON::Field(key: "base_path")]
        getter base_path : String

        # The domain name of the BasePathMapping resource to be described.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @base_path : String,
          @domain_name : String,
          @domain_name_id : String? = nil
        )
        end
      end

      # A request to get information about a collection of BasePathMapping resources.

      struct GetBasePathMappingsRequest
        include JSON::Serializable

        # The domain name of a BasePathMapping resource.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @domain_name : String,
          @domain_name_id : String? = nil,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # A request to get information about the current ClientCertificate resource.

      struct GetClientCertificateRequest
        include JSON::Serializable

        # The identifier of the ClientCertificate resource to be described.

        @[JSON::Field(key: "clientcertificate_id")]
        getter client_certificate_id : String

        def initialize(
          @client_certificate_id : String
        )
        end
      end

      # A request to get information about a collection of ClientCertificate resources.

      struct GetClientCertificatesRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Requests API Gateway to get information about a Deployment resource.

      struct GetDeploymentRequest
        include JSON::Serializable

        # The identifier of the Deployment resource to get information about.

        @[JSON::Field(key: "deployment_id")]
        getter deployment_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter to retrieve the specified embedded resources of the returned Deployment resource
        # in the response. In a REST API call, this embed parameter value is a list of comma-separated
        # strings, as in GET /restapis/{restapi_id}/deployments/{deployment_id}?embed=var1,var2 . The SDK and
        # other platform-dependent libraries might use a different format for the list. Currently, this
        # request supports only retrieval of the embedded API summary this way. Hence, the parameter value
        # must be a single-valued list containing only the "apisummary" string. For example, GET
        # /restapis/{restapi_id}/deployments/{deployment_id}?embed=apisummary .

        @[JSON::Field(key: "embed")]
        getter embed : Array(String)?

        def initialize(
          @deployment_id : String,
          @rest_api_id : String,
          @embed : Array(String)? = nil
        )
        end
      end

      # Requests API Gateway to get information about a Deployments collection.

      struct GetDeploymentsRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Gets a specified documentation part of a given API.

      struct GetDocumentationPartRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "part_id")]
        getter documentation_part_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @documentation_part_id : String,
          @rest_api_id : String
        )
        end
      end

      # Gets the documentation parts of an API. The result may be filtered by the type, name, or path of API
      # entities (targets).

      struct GetDocumentationPartsRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The status of the API documentation parts to retrieve. Valid values are DOCUMENTED for retrieving
        # DocumentationPart resources with content and UNDOCUMENTED for DocumentationPart resources without
        # content.

        @[JSON::Field(key: "locationStatus")]
        getter location_status : String?

        # The name of API entities of the to-be-retrieved documentation parts.

        @[JSON::Field(key: "name")]
        getter name_query : String?

        # The path of API entities of the to-be-retrieved documentation parts.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        # The type of API entities of the to-be-retrieved documentation parts.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @location_status : String? = nil,
          @name_query : String? = nil,
          @path : String? = nil,
          @position : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Gets a documentation snapshot of an API.

      struct GetDocumentationVersionRequest
        include JSON::Serializable

        # The version identifier of the to-be-retrieved documentation snapshot.

        @[JSON::Field(key: "doc_version")]
        getter documentation_version : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @documentation_version : String,
          @rest_api_id : String
        )
        end
      end

      # Gets the documentation versions of an API.

      struct GetDocumentationVersionsRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end


      struct GetDomainNameAccessAssociationsRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        # The owner of the domain name access association. Use SELF to only list the domain name access
        # associations owned by your own account. Use OTHER_ACCOUNTS to list the domain name access
        # associations with your private custom domain names that are owned by other AWS accounts.

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end

      # Request to get the name of a DomainName resource.

      struct GetDomainNameRequest
        include JSON::Serializable

        # The name of the DomainName resource.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Required for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @domain_name : String,
          @domain_name_id : String? = nil
        )
        end
      end

      # Request to describe a collection of DomainName resources.

      struct GetDomainNamesRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        # The owner of the domain name access association.

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end

      # Request a new export of a RestApi for a particular Stage.

      struct GetExportRequest
        include JSON::Serializable

        # The type of export. Acceptable values are 'oas30' for OpenAPI 3.0.x and 'swagger' for
        # Swagger/OpenAPI 2.0.

        @[JSON::Field(key: "export_type")]
        getter export_type : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the Stage that will be exported.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        # The content-type of the export, for example application/json . Currently application/json and
        # application/yaml are supported for exportType of oas30 and swagger . This should be specified in the
        # Accept header for direct API requests.

        @[JSON::Field(key: "Accept")]
        getter accepts : String?

        # A key-value map of query string parameters that specify properties of the export, depending on the
        # requested exportType . For exportType oas30 and swagger , any combination of the following
        # parameters are supported: extensions='integrations' or extensions='apigateway' will export the API
        # with x-amazon-apigateway-integration extensions. extensions='authorizers' will export the API with
        # x-amazon-apigateway-authorizer extensions. postman will export the API with Postman extensions,
        # allowing for import to the Postman tool

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @export_type : String,
          @rest_api_id : String,
          @stage_name : String,
          @accepts : String? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Gets a GatewayResponse of a specified response type on the given RestApi.

      struct GetGatewayResponseRequest
        include JSON::Serializable

        # The response type of the associated GatewayResponse.

        @[JSON::Field(key: "response_type")]
        getter response_type : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @response_type : String,
          @rest_api_id : String
        )
        end
      end

      # Gets the GatewayResponses collection on the given RestApi. If an API developer has not added any
      # definitions for gateway responses, the result will be the API Gateway-generated default
      # GatewayResponses collection for the supported response types.

      struct GetGatewayResponsesRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500. The GatewayResponses collection does not support pagination and the limit does not apply here.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set. The GatewayResponse collection does not
        # support pagination and the position does not apply here.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents a request to get the integration configuration.

      struct GetIntegrationRequest
        include JSON::Serializable

        # Specifies a get integration request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a get integration request's resource identifier

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String
        )
        end
      end

      # Represents a get integration response request.

      struct GetIntegrationResponseRequest
        include JSON::Serializable

        # Specifies a get integration response request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a get integration response request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies a get integration response request's status code.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String
        )
        end
      end

      # Request to describe an existing Method resource.

      struct GetMethodRequest
        include JSON::Serializable

        # Specifies the method request's HTTP method type.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the Method resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String
        )
        end
      end

      # Request to describe a MethodResponse resource.

      struct GetMethodResponseRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the MethodResponse resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The status code for the MethodResponse resource.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String
        )
        end
      end

      # Request to list information about a model in an existing RestApi resource.

      struct GetModelRequest
        include JSON::Serializable

        # The name of the model as an identifier.

        @[JSON::Field(key: "model_name")]
        getter model_name : String

        # The RestApi identifier under which the Model exists.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter of a Boolean value to resolve ( true ) all external model references and returns a
        # flattened model schema or not ( false ) The default is false .

        @[JSON::Field(key: "flatten")]
        getter flatten : Bool?

        def initialize(
          @model_name : String,
          @rest_api_id : String,
          @flatten : Bool? = nil
        )
        end
      end

      # Request to generate a sample mapping template used to transform the payload.

      struct GetModelTemplateRequest
        include JSON::Serializable

        # The name of the model for which to generate a template.

        @[JSON::Field(key: "model_name")]
        getter model_name : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @model_name : String,
          @rest_api_id : String
        )
        end
      end

      # Request to list existing Models defined for a RestApi resource.

      struct GetModelsRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Gets a RequestValidator of a given RestApi.

      struct GetRequestValidatorRequest
        include JSON::Serializable

        # The identifier of the RequestValidator to be retrieved.

        @[JSON::Field(key: "requestvalidator_id")]
        getter request_validator_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @request_validator_id : String,
          @rest_api_id : String
        )
        end
      end

      # Gets the RequestValidators collection of a given RestApi.

      struct GetRequestValidatorsRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Request to list information about a resource.

      struct GetResourceRequest
        include JSON::Serializable

        # The identifier for the Resource resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter to retrieve the specified resources embedded in the returned Resource
        # representation in the response. This embed parameter value is a list of comma-separated strings.
        # Currently, the request supports only retrieval of the embedded Method resources this way. The query
        # parameter value must be a single-valued list and contain the "methods" string. For example, GET
        # /restapis/{restapi_id}/resources/{resource_id}?embed=methods .

        @[JSON::Field(key: "embed")]
        getter embed : Array(String)?

        def initialize(
          @resource_id : String,
          @rest_api_id : String,
          @embed : Array(String)? = nil
        )
        end
      end

      # Request to list information about a collection of resources.

      struct GetResourcesRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter used to retrieve the specified resources embedded in the returned Resources
        # resource in the response. This embed parameter value is a list of comma-separated strings.
        # Currently, the request supports only retrieval of the embedded Method resources this way. The query
        # parameter value must be a single-valued list and contain the "methods" string. For example, GET
        # /restapis/{restapi_id}/resources?embed=methods .

        @[JSON::Field(key: "embed")]
        getter embed : Array(String)?

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @rest_api_id : String,
          @embed : Array(String)? = nil,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # The GET request to list an existing RestApi defined for your collection.

      struct GetRestApiRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        def initialize(
          @rest_api_id : String
        )
        end
      end

      # The GET request to list existing RestApis defined for your collection.

      struct GetRestApisRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Request a new generated client SDK for a RestApi and Stage.

      struct GetSdkRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The language for the generated SDK. Currently java , javascript , android , objectivec (for iOS),
        # swift (for iOS), and ruby are supported.

        @[JSON::Field(key: "sdk_type")]
        getter sdk_type : String

        # The name of the Stage that the SDK will use.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        # A string-to-string key-value map of query parameters sdkType -dependent properties of the SDK. For
        # sdkType of objectivec or swift , a parameter named classPrefix is required. For sdkType of android ,
        # parameters named groupId , artifactId , artifactVersion , and invokerPackage are required. For
        # sdkType of java , parameters named serviceName and javaPackageName are required.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @rest_api_id : String,
          @sdk_type : String,
          @stage_name : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Get an SdkType instance.

      struct GetSdkTypeRequest
        include JSON::Serializable

        # The identifier of the queried SdkType instance.

        @[JSON::Field(key: "sdktype_id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Get the SdkTypes collection.

      struct GetSdkTypesRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Requests API Gateway to get information about a Stage resource.

      struct GetStageRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the Stage resource to get information about.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        def initialize(
          @rest_api_id : String,
          @stage_name : String
        )
        end
      end

      # Requests API Gateway to get information about one or more Stage resources.

      struct GetStagesRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The stages' deployment identifiers.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        def initialize(
          @rest_api_id : String,
          @deployment_id : String? = nil
        )
        end
      end

      # Gets the Tags collection for a given resource.

      struct GetTagsRequest
        include JSON::Serializable

        # The ARN of a resource that can be tagged.

        @[JSON::Field(key: "resource_arn")]
        getter resource_arn : String

        # (Not currently supported) The maximum number of returned results per page. The default value is 25
        # and the maximum value is 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # (Not currently supported) The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @resource_arn : String,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # The GET request to get a usage plan key of a given key identifier.

      struct GetUsagePlanKeyRequest
        include JSON::Serializable

        # The key Id of the to-be-retrieved UsagePlanKey resource representing a plan customer.

        @[JSON::Field(key: "keyId")]
        getter key_id : String

        # The Id of the UsagePlan resource representing the usage plan containing the to-be-retrieved
        # UsagePlanKey resource representing a plan customer.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        def initialize(
          @key_id : String,
          @usage_plan_id : String
        )
        end
      end

      # The GET request to get all the usage plan keys representing the API keys added to a specified usage
      # plan.

      struct GetUsagePlanKeysRequest
        include JSON::Serializable

        # The Id of the UsagePlan resource representing the usage plan containing the to-be-retrieved
        # UsagePlanKey resource representing a plan customer.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # A query parameter specifying the name of the to-be-returned usage plan keys.

        @[JSON::Field(key: "name")]
        getter name_query : String?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @usage_plan_id : String,
          @limit : Int32? = nil,
          @name_query : String? = nil,
          @position : String? = nil
        )
        end
      end

      # The GET request to get a usage plan of a given plan identifier.

      struct GetUsagePlanRequest
        include JSON::Serializable

        # The identifier of the UsagePlan resource to be retrieved.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        def initialize(
          @usage_plan_id : String
        )
        end
      end

      # The GET request to get all the usage plans of the caller's account.

      struct GetUsagePlansRequest
        include JSON::Serializable

        # The identifier of the API key associated with the usage plans.

        @[JSON::Field(key: "keyId")]
        getter key_id : String?

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @key_id : String? = nil,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # The GET request to get the usage data of a usage plan in a specified time interval.

      struct GetUsageRequest
        include JSON::Serializable

        # The ending date (e.g., 2016-12-31) of the usage data.

        @[JSON::Field(key: "endDate")]
        getter end_date : String

        # The starting date (e.g., 2016-01-01) of the usage data.

        @[JSON::Field(key: "startDate")]
        getter start_date : String

        # The Id of the usage plan associated with the usage data.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        # The Id of the API key associated with the resultant usage data.

        @[JSON::Field(key: "keyId")]
        getter key_id : String?

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @end_date : String,
          @start_date : String,
          @usage_plan_id : String,
          @key_id : String? = nil,
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # Gets a specified VPC link under the caller's account in a region.

      struct GetVpcLinkRequest
        include JSON::Serializable

        # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.

        @[JSON::Field(key: "vpclink_id")]
        getter vpc_link_id : String

        def initialize(
          @vpc_link_id : String
        )
        end
      end

      # Gets the VpcLinks collection under the caller's account in a selected region.

      struct GetVpcLinksRequest
        include JSON::Serializable

        # The maximum number of returned results per page. The default value is 25 and the maximum value is
        # 500.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The current pagination position in the paged result set.

        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @limit : Int32? = nil,
          @position : String? = nil
        )
        end
      end

      # The POST request to import API keys from an external source, such as a CSV-formatted file.

      struct ImportApiKeysRequest
        include JSON::Serializable

        # The payload of the POST request to import API keys. For the payload format, see API Key File Format.

        @[JSON::Field(key: "body")]
        getter body : Bytes

        # A query parameter to specify the input format to imported API keys. Currently, only the csv format
        # is supported.

        @[JSON::Field(key: "format")]
        getter format : String

        # A query parameter to indicate whether to rollback ApiKey importation ( true ) or not ( false ) when
        # error is encountered.

        @[JSON::Field(key: "failonwarnings")]
        getter fail_on_warnings : Bool?

        def initialize(
          @body : Bytes,
          @format : String,
          @fail_on_warnings : Bool? = nil
        )
        end
      end

      # Import documentation parts from an external (e.g., OpenAPI) definition file.

      struct ImportDocumentationPartsRequest
        include JSON::Serializable

        # Raw byte array representing the to-be-imported documentation parts. To import from an OpenAPI file,
        # this is a JSON object.

        @[JSON::Field(key: "body")]
        getter body : Bytes

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter to specify whether to rollback the documentation importation ( true ) or not (
        # false ) when a warning is encountered. The default value is false .

        @[JSON::Field(key: "failonwarnings")]
        getter fail_on_warnings : Bool?

        # A query parameter to indicate whether to overwrite ( overwrite ) any existing DocumentationParts
        # definition or to merge ( merge ) the new definition into the existing one. The default value is
        # merge .

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @body : Bytes,
          @rest_api_id : String,
          @fail_on_warnings : Bool? = nil,
          @mode : String? = nil
        )
        end
      end

      # A POST request to import an API to API Gateway using an input of an API definition file.

      struct ImportRestApiRequest
        include JSON::Serializable

        # The POST request body containing external API definitions. Currently, only OpenAPI definition
        # JSON/YAML files are supported. The maximum size of the API definition file is 6MB.

        @[JSON::Field(key: "body")]
        getter body : Bytes

        # A query parameter to indicate whether to rollback the API creation ( true ) or not ( false ) when a
        # warning is encountered. The default value is false .

        @[JSON::Field(key: "failonwarnings")]
        getter fail_on_warnings : Bool?

        # A key-value map of context-specific query string parameters specifying the behavior of different API
        # importing operations. The following shows operation-specific parameters and their supported values.
        # To exclude DocumentationParts from the import, set parameters as ignore=documentation . To configure
        # the endpoint type, set parameters as endpointConfigurationTypes=EDGE ,
        # endpointConfigurationTypes=REGIONAL , or endpointConfigurationTypes=PRIVATE . The default endpoint
        # type is EDGE . To handle imported basepath , set parameters as basepath=ignore , basepath=prepend or
        # basepath=split .

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @body : Bytes,
          @fail_on_warnings : Bool? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Represents an HTTP , HTTP_PROXY , AWS , AWS_PROXY , or Mock integration.

      struct Integration
        include JSON::Serializable

        # A list of request parameters whose values API Gateway caches. To be valid values for
        # cacheKeyParameters , these parameters must also be specified for Method requestParameters .

        @[JSON::Field(key: "cacheKeyParameters")]
        getter cache_key_parameters : Array(String)?

        # Specifies a group of related cached parameters. By default, API Gateway uses the resource ID as the
        # cacheNamespace . You can specify the same cacheNamespace across resources to return the same cached
        # data for requests to different resources.

        @[JSON::Field(key: "cacheNamespace")]
        getter cache_namespace : String?

        # The ID of the VpcLink used for the integration when connectionType=VPC_LINK and undefined,
        # otherwise.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The type of the network connection to the integration endpoint. The valid value is INTERNET for
        # connections through the public routable internet or VPC_LINK for private connections between API
        # Gateway and a network load balancer in a VPC. The default value is INTERNET .

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # Specifies how to handle request payload content type conversions. Supported values are
        # CONVERT_TO_BINARY and CONVERT_TO_TEXT , with the following behaviors: If this property is not
        # defined, the request payload will be passed through from the method request to integration request
        # without modification, provided that the passthroughBehavior is configured to support payload
        # pass-through.

        @[JSON::Field(key: "contentHandling")]
        getter content_handling : String?

        # Specifies the credentials required for the integration, if any. For AWS integrations, three options
        # are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name
        # (ARN). To require that the caller's identity be passed through from the request, specify the string
        # arn:aws:iam::\*:user/\* . To use resource-based permissions on supported Amazon Web Services
        # services, specify null.

        @[JSON::Field(key: "credentials")]
        getter credentials : String?

        # Specifies the integration's HTTP method type. For the Type property, if you specify MOCK , this
        # property is optional. For Lambda integrations, you must set the integration method to POST . For all
        # other types, you must specify this property.

        @[JSON::Field(key: "httpMethod")]
        getter http_method : String?

        # Specifies the integration's responses.

        @[JSON::Field(key: "integrationResponses")]
        getter integration_responses : Hash(String, Types::IntegrationResponse)?

        # The ALB or NLB listener to send the request to.

        @[JSON::Field(key: "integrationTarget")]
        getter integration_target : String?

        # Specifies how the method request body of an unmapped content type will be passed through the
        # integration request to the back end without transformation. A content type is unmapped if no mapping
        # template is defined in the integration or the content type does not match any of the mapped content
        # types, as specified in requestTemplates . The valid value is one of the following: WHEN_NO_MATCH :
        # passes the method request body through the integration request to the back end without
        # transformation when the method request content type does not match any content type associated with
        # the mapping templates defined in the integration request. WHEN_NO_TEMPLATES : passes the method
        # request body through the integration request to the back end without transformation when no mapping
        # template is defined in the integration request. If a template is defined when this option is
        # selected, the method request of an unmapped content-type will be rejected with an HTTP 415
        # Unsupported Media Type response. NEVER : rejects the method request with an HTTP 415 Unsupported
        # Media Type response when either the method request content type does not match any content type
        # associated with the mapping templates defined in the integration request or no mapping template is
        # defined in the integration request.

        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?

        # A key-value map specifying request parameters that are passed from the method request to the back
        # end. The key is an integration request parameter name and the associated value is a method request
        # parameter value or static value that must be enclosed within single quotes and pre-encoded as
        # required by the back end. The method request parameter value must match the pattern of
        # method.request.{location}.{name} , where location is querystring , path , or header and name must be
        # a valid and unique method request parameter name.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?

        # Represents a map of Velocity templates that are applied on the request payload based on the value of
        # the Content-Type header sent by the client. The content type value is the key in this map, and the
        # template (as a String) is the value.

        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?

        # The response transfer mode of the integration.

        @[JSON::Field(key: "responseTransferMode")]
        getter response_transfer_mode : String?

        # Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds or 29
        # seconds. You can increase the default value to longer than 29 seconds for Regional or private APIs
        # only.

        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?

        # Specifies the TLS configuration for an integration.

        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        # Specifies an API method integration type. The valid value is one of the following: For the HTTP and
        # HTTP proxy integrations, each integration can specify a protocol ( http/https ), port and path.
        # Standard 80 and 443 ports are supported as well as custom ports above 1024. An HTTP or HTTP proxy
        # integration with a connectionType of VPC_LINK is referred to as a private integration and uses a
        # VpcLink to connect API Gateway to a network load balancer of a VPC.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Specifies Uniform Resource Identifier (URI) of the integration endpoint. For HTTP or HTTP_PROXY
        # integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986
        # specification for standard integrations. If connectionType is VPC_LINK specify the Network Load
        # Balancer DNS name. For AWS or AWS_PROXY integrations, the URI is of the form
        # arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api} . Here, {Region}
        # is the API Gateway region (e.g., us-east-1); {service} is the name of the integrated Amazon Web
        # Services service (e.g., s3); and {subdomain} is a designated subdomain supported by certain Amazon
        # Web Services service for fast host-name lookup. action can be used for an Amazon Web Services
        # service action-based API, using an Action={name}&amp;{p1}={v1}&amp;p2={v2}... query string. The
        # ensuing {service_api} refers to a supported action {name} plus any required input parameters.
        # Alternatively, path can be used for an Amazon Web Services service path-based API. The ensuing
        # service_api refers to the path to an Amazon Web Services service resource, including the region of
        # the integrated Amazon Web Services service, if applicable. For example, for integration with the S3
        # API of GetObject, the uri can be either
        # arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key} or
        # arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @cache_key_parameters : Array(String)? = nil,
          @cache_namespace : String? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling : String? = nil,
          @credentials : String? = nil,
          @http_method : String? = nil,
          @integration_responses : Hash(String, Types::IntegrationResponse)? = nil,
          @integration_target : String? = nil,
          @passthrough_behavior : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_transfer_mode : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil,
          @type : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # Represents an integration response. The status code must map to an existing MethodResponse, and
      # parameters and templates can be used to transform the back-end response.

      struct IntegrationResponse
        include JSON::Serializable

        # Specifies how to handle response payload content type conversions. Supported values are
        # CONVERT_TO_BINARY and CONVERT_TO_TEXT , with the following behaviors: If this property is not
        # defined, the response payload will be passed through from the integration response to the method
        # response without modification.

        @[JSON::Field(key: "contentHandling")]
        getter content_handling : String?

        # A key-value map specifying response parameters that are passed to the method response from the back
        # end. The key is a method response header parameter name and the mapped value is an integration
        # response header value, a static value enclosed within a pair of single quotes, or a JSON expression
        # from the integration response body. The mapping key must match the pattern of
        # method.response.header.{name} , where name is a valid and unique header name. The mapped non-static
        # value must match the pattern of integration.response.header.{name} or
        # integration.response.body.{JSON-expression} , where name is a valid and unique response header name
        # and JSON-expression is a valid JSON expression without the $ prefix.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # Specifies the templates used to transform the integration response body. Response templates are
        # represented as a key/value map, with a content-type as the key and a template as the value.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # Specifies the regular expression (regex) pattern used to choose an integration response based on the
        # response from the back end. For example, if the success response returns nothing and the error
        # response returns some string, you could use the .+ regex to match error response. However, make sure
        # that the error response does not contain any newline ( \n ) character in such cases. If the back end
        # is an Lambda function, the Lambda function error header is matched. For all other HTTP and Amazon
        # Web Services back ends, the HTTP status code is matched.

        @[JSON::Field(key: "selectionPattern")]
        getter selection_pattern : String?

        # Specifies the status code that is used to map the integration response to an existing
        # MethodResponse.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @content_handling : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @selection_pattern : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The request exceeded the rate limit. Retry after the specified time period.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end

      # Represents a client-facing interface by which the client calls the API to access back-end resources.
      # A Method resource is integrated with an Integration resource. Both consist of a request and one or
      # more responses. The method request takes the client input that is passed to the back end through the
      # integration request. A method response returns the output from the back end to the client through an
      # integration response. A method request is embodied in a Method resource, whereas an integration
      # request is embodied in an Integration resource. On the other hand, a method response is represented
      # by a MethodResponse resource, whereas an integration response is represented by an
      # IntegrationResponse resource.

      struct Method
        include JSON::Serializable

        # A boolean flag specifying whether a valid ApiKey is required to invoke this method.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # A list of authorization scopes configured on the method. The scopes are used with a
        # COGNITO_USER_POOLS authorizer to authorize the method invocation. The authorization works by
        # matching the method scopes against the scopes parsed from the access token in the incoming request.
        # The method invocation is authorized if any method scopes matches a claimed scope in the access
        # token. Otherwise, the invocation is not authorized. When the method scope is configured, the client
        # must provide an access token instead of an identity token for authorization purposes.

        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?

        # The method's authorization type. Valid values are NONE for open access, AWS_IAM for using AWS IAM
        # permissions, CUSTOM for using a custom authorizer, or COGNITO_USER_POOLS for using a Cognito user
        # pool.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?

        # The identifier of an Authorizer to use on this method. The authorizationType must be CUSTOM .

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # The method's HTTP verb.

        @[JSON::Field(key: "httpMethod")]
        getter http_method : String?

        # Gets the method's integration responsible for passing the client-submitted request to the back end
        # and performing necessary transformations to make the request compliant with the back end.

        @[JSON::Field(key: "methodIntegration")]
        getter method_integration : Types::Integration?

        # Gets a method response associated with a given HTTP status code.

        @[JSON::Field(key: "methodResponses")]
        getter method_responses : Hash(String, Types::MethodResponse)?

        # A human-friendly operation identifier for the method. For example, you can assign the operationName
        # of ListPets for the GET /pets method in the PetStore example.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # A key-value map specifying data schemas, represented by Model resources, (as the mapped value) of
        # the request payloads of given content types (as the mapping key).

        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?

        # A key-value map defining required or optional method request parameters that can be accepted by API
        # Gateway. A key is a method request parameter name matching the pattern of
        # method.request.{location}.{name} , where location is querystring , path , or header and name is a
        # valid and unique parameter name. The value associated with the key is a Boolean flag indicating
        # whether the parameter is required ( true ) or optional ( false ). The method request parameter names
        # defined here are available in Integration to be mapped to integration request parameters or
        # templates.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Bool)?

        # The identifier of a RequestValidator for request validation.

        @[JSON::Field(key: "requestValidatorId")]
        getter request_validator_id : String?

        def initialize(
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @http_method : String? = nil,
          @method_integration : Types::Integration? = nil,
          @method_responses : Hash(String, Types::MethodResponse)? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Bool)? = nil,
          @request_validator_id : String? = nil
        )
        end
      end

      # Represents a method response of a given HTTP status code returned to the client. The method response
      # is passed from the back end through the associated integration response that can be transformed
      # using a mapping template.

      struct MethodResponse
        include JSON::Serializable

        # Specifies the Model resources used for the response's content-type. Response models are represented
        # as a key/value map, with a content-type as the key and a Model name as the value.

        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?

        # A key-value map specifying required or optional response parameters that API Gateway can send back
        # to the caller. A key defines a method response header and the value specifies whether the associated
        # method response header is required or not. The expression of the key must match the pattern
        # method.response.header.{name} , where name is a valid and unique header name. API Gateway passes
        # certain integration response data to the method response headers specified here according to the
        # mapping you prescribe in the API's IntegrationResponse. The integration response data that can be
        # mapped include an integration response header expressed in integration.response.header.{name} , a
        # static value enclosed within a pair of single quotes (e.g., 'application/json' ), or a JSON
        # expression from the back-end response payload in the form of
        # integration.response.body.{JSON-expression} , where JSON-expression is a valid JSON expression
        # without the $ prefix.)

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Bool)?

        # The method response's status code.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Bool)? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Specifies the method setting properties.

      struct MethodSetting
        include JSON::Serializable

        # Specifies whether the cached responses are encrypted.

        @[JSON::Field(key: "cacheDataEncrypted")]
        getter cache_data_encrypted : Bool?

        # Specifies the time to live (TTL), in seconds, for cached responses. The higher the TTL, the longer
        # the response will be cached.

        @[JSON::Field(key: "cacheTtlInSeconds")]
        getter cache_ttl_in_seconds : Int32?

        # Specifies whether responses should be cached and returned for requests. A cache cluster must be
        # enabled on the stage for responses to be cached.

        @[JSON::Field(key: "cachingEnabled")]
        getter caching_enabled : Bool?

        # Specifies whether data trace logging is enabled for this method, which affects the log entries
        # pushed to Amazon CloudWatch Logs. This can be useful to troubleshoot APIs, but can result in logging
        # sensitive data. We recommend that you don't enable this option for production APIs.

        @[JSON::Field(key: "dataTraceEnabled")]
        getter data_trace_enabled : Bool?

        # Specifies the logging level for this method, which affects the log entries pushed to Amazon
        # CloudWatch Logs. Valid values are OFF , ERROR , and INFO . Choose ERROR to write only error-level
        # entries to CloudWatch Logs, or choose INFO to include all ERROR events as well as extra
        # informational events.

        @[JSON::Field(key: "loggingLevel")]
        getter logging_level : String?

        # Specifies whether Amazon CloudWatch metrics are enabled for this method.

        @[JSON::Field(key: "metricsEnabled")]
        getter metrics_enabled : Bool?

        # Specifies whether authorization is required for a cache invalidation request.

        @[JSON::Field(key: "requireAuthorizationForCacheControl")]
        getter require_authorization_for_cache_control : Bool?

        # Specifies the throttling burst limit.

        @[JSON::Field(key: "throttlingBurstLimit")]
        getter throttling_burst_limit : Int32?

        # Specifies the throttling rate limit.

        @[JSON::Field(key: "throttlingRateLimit")]
        getter throttling_rate_limit : Float64?

        # Specifies how to handle unauthorized requests for cache invalidation.

        @[JSON::Field(key: "unauthorizedCacheControlHeaderStrategy")]
        getter unauthorized_cache_control_header_strategy : String?

        def initialize(
          @cache_data_encrypted : Bool? = nil,
          @cache_ttl_in_seconds : Int32? = nil,
          @caching_enabled : Bool? = nil,
          @data_trace_enabled : Bool? = nil,
          @logging_level : String? = nil,
          @metrics_enabled : Bool? = nil,
          @require_authorization_for_cache_control : Bool? = nil,
          @throttling_burst_limit : Int32? = nil,
          @throttling_rate_limit : Float64? = nil,
          @unauthorized_cache_control_header_strategy : String? = nil
        )
        end
      end

      # Represents a summary of a Method resource, given a particular date and time.

      struct MethodSnapshot
        include JSON::Serializable

        # Specifies whether the method requires a valid ApiKey.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # The method's authorization type. Valid values are NONE for open access, AWS_IAM for using AWS IAM
        # permissions, CUSTOM for using a custom authorizer, or COGNITO_USER_POOLS for using a Cognito user
        # pool.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?

        def initialize(
          @api_key_required : Bool? = nil,
          @authorization_type : String? = nil
        )
        end
      end

      # Represents the data structure of a method's request or response payload.

      struct Model
        include JSON::Serializable

        # The content-type for the model.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier for the model resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the model. Must be an alphanumeric string.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The schema for the model. For application/json models, this should be JSON schema draft 4 model. Do
        # not include "\*/" characters in the description of any properties because such "\*/" characters may
        # be interpreted as the closing marker for comments in some languages, such as Java or JavaScript,
        # causing the installation of your API's SDK generated by API Gateway to fail.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # Represents a collection of Model resources.

      struct Models
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::Model)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::Model)? = nil,
          @position : String? = nil
        )
        end
      end

      # The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway
      # performs two-way authentication between the client and the server. Clients must present a trusted
      # certificate to access your API.

      struct MutualTlsAuthentication
        include JSON::Serializable

        # An Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example
        # s3://bucket-name/key-name . The truststore can contain certificates from public or private
        # certificate authorities. To update the truststore, upload a new version to S3, and then update your
        # custom domain name to use the new version. To update the truststore, you must have permissions to
        # access the S3 object.

        @[JSON::Field(key: "truststoreUri")]
        getter truststore_uri : String?

        # The version of the S3 object that contains your truststore. To specify a version, you must have
        # versioning enabled for the S3 bucket.

        @[JSON::Field(key: "truststoreVersion")]
        getter truststore_version : String?

        # A list of warnings that API Gateway returns while processing your truststore. Invalid certificates
        # produce warnings. Mutual TLS is still enabled, but some clients might not be able to access your
        # API. To resolve warnings, upload a new truststore to S3, and then update you domain name to use the
        # new version.

        @[JSON::Field(key: "truststoreWarnings")]
        getter truststore_warnings : Array(String)?

        def initialize(
          @truststore_uri : String? = nil,
          @truststore_version : String? = nil,
          @truststore_warnings : Array(String)? = nil
        )
        end
      end

      # The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway
      # performs two-way authentication between the client and the server. Clients must present a trusted
      # certificate to access your API.

      struct MutualTlsAuthenticationInput
        include JSON::Serializable

        # An Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example
        # s3://bucket-name/key-name . The truststore can contain certificates from public or private
        # certificate authorities. To update the truststore, upload a new version to S3, and then update your
        # custom domain name to use the new version. To update the truststore, you must have permissions to
        # access the S3 object.

        @[JSON::Field(key: "truststoreUri")]
        getter truststore_uri : String?

        # The version of the S3 object that contains your truststore. To specify a version, you must have
        # versioning enabled for the S3 bucket

        @[JSON::Field(key: "truststoreVersion")]
        getter truststore_version : String?

        def initialize(
          @truststore_uri : String? = nil,
          @truststore_version : String? = nil
        )
        end
      end

      # The requested resource is not found. Make sure that the request URI is correct.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # For more information about supported patch operations, see Patch Operations .

      struct PatchOperation
        include JSON::Serializable

        # The copy update operation's source as identified by a JSON-Pointer value referencing the location
        # within the targeted resource to copy the value from. For example, to promote a canary deployment,
        # you copy the canary deployment ID to the affiliated deployment ID by calling a PATCH request on a
        # Stage resource with "op":"copy", "from":"/canarySettings/deploymentId" and "path":"/deploymentId".

        @[JSON::Field(key: "from")]
        getter from : String?

        # An update operation to be performed with this PATCH request. The valid value can be add, remove,
        # replace or copy. Not all valid operations are supported for a given resource. Support of the
        # operations depends on specific operational contexts. Attempts to apply an unsupported operation on a
        # resource will return an error message..

        @[JSON::Field(key: "op")]
        getter op : String?

        # The op operation's target, as identified by a JSON Pointer value that references a location within
        # the targeted resource. For example, if the target resource has an updateable property of
        # {"name":"value"}, the path for this property is /name. If the name property value is a JSON object
        # (e.g., {"name": {"child/name": "child-value"}}), the path for the child/name property will be
        # /name/child~1name. Any slash ("/") character appearing in path names must be escaped with "~1", as
        # shown in the example above. Each op operation can have only one path associated with it.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The new target value of the update operation. It is applicable for the add or replace operation.
        # When using AWS CLI to update a property of a JSON value, enclose the JSON object with a pair of
        # single quotes in a Linux shell, e.g., '{"a": ...}'.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @from : String? = nil,
          @op : String? = nil,
          @path : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Creates a customization of a GatewayResponse of a specified response type and status code on the
      # given RestApi.

      struct PutGatewayResponseRequest
        include JSON::Serializable

        # The response type of the associated GatewayResponse

        @[JSON::Field(key: "response_type")]
        getter response_type : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Response parameters (paths, query strings and headers) of the GatewayResponse as a string-to-string
        # map of key-value pairs.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # Response templates of the GatewayResponse as a string-to-string map of key-value pairs.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # The HTTP status code of the GatewayResponse.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @response_type : String,
          @rest_api_id : String,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Sets up a method's integration.

      struct PutIntegrationRequest
        include JSON::Serializable

        # Specifies the HTTP method for the integration.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a put integration request's resource ID.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies a put integration input's type.

        @[JSON::Field(key: "type")]
        getter type : String

        # A list of request parameters whose values API Gateway caches. To be valid values for
        # cacheKeyParameters , these parameters must also be specified for Method requestParameters .

        @[JSON::Field(key: "cacheKeyParameters")]
        getter cache_key_parameters : Array(String)?

        # Specifies a group of related cached parameters. By default, API Gateway uses the resource ID as the
        # cacheNamespace . You can specify the same cacheNamespace across resources to return the same cached
        # data for requests to different resources.

        @[JSON::Field(key: "cacheNamespace")]
        getter cache_namespace : String?

        # The ID of the VpcLink used for the integration. Specify this value only if you specify VPC_LINK as
        # the connection type.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The type of the network connection to the integration endpoint. The valid value is INTERNET for
        # connections through the public routable internet or VPC_LINK for private connections between API
        # Gateway and a network load balancer in a VPC. The default value is INTERNET .

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # Specifies how to handle request payload content type conversions. Supported values are
        # CONVERT_TO_BINARY and CONVERT_TO_TEXT , with the following behaviors: If this property is not
        # defined, the request payload will be passed through from the method request to integration request
        # without modification, provided that the passthroughBehavior is configured to support payload
        # pass-through.

        @[JSON::Field(key: "contentHandling")]
        getter content_handling : String?

        # Specifies whether credentials are required for a put integration.

        @[JSON::Field(key: "credentials")]
        getter credentials : String?

        # The HTTP method for the integration.

        @[JSON::Field(key: "httpMethod")]
        getter integration_http_method : String?

        # The ALB or NLB listener to send the request to.

        @[JSON::Field(key: "integrationTarget")]
        getter integration_target : String?

        # Specifies the pass-through behavior for incoming requests based on the Content-Type header in the
        # request, and the available mapping templates specified as the requestTemplates property on the
        # Integration resource. There are three valid values: WHEN_NO_MATCH , WHEN_NO_TEMPLATES , and NEVER .

        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?

        # A key-value map specifying request parameters that are passed from the method request to the back
        # end. The key is an integration request parameter name and the associated value is a method request
        # parameter value or static value that must be enclosed within single quotes and pre-encoded as
        # required by the back end. The method request parameter value must match the pattern of
        # method.request.{location}.{name} , where location is querystring , path , or header and name must be
        # a valid and unique method request parameter name.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?

        # Represents a map of Velocity templates that are applied on the request payload based on the value of
        # the Content-Type header sent by the client. The content type value is the key in this map, and the
        # template (as a String) is the value.

        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?

        # The response transfer mode of the integration.

        @[JSON::Field(key: "responseTransferMode")]
        getter response_transfer_mode : String?

        # Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds or 29
        # seconds. You can increase the default value to longer than 29 seconds for Regional or private APIs
        # only.

        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        # Specifies Uniform Resource Identifier (URI) of the integration endpoint. For HTTP or HTTP_PROXY
        # integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986
        # specification, for either standard integration, where connectionType is not VPC_LINK , or private
        # integration, where connectionType is VPC_LINK . For a private HTTP integration, the URI is not used
        # for routing. For AWS or AWS_PROXY integrations, the URI is of the form
        # arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api }. Here, {Region}
        # is the API Gateway region (e.g., us-east-1); {service} is the name of the integrated Amazon Web
        # Services service (e.g., s3); and {subdomain} is a designated subdomain supported by certain Amazon
        # Web Services service for fast host-name lookup. action can be used for an Amazon Web Services
        # service action-based API, using an Action={name}&amp;{p1}={v1}&amp;p2={v2}... query string. The
        # ensuing {service_api} refers to a supported action {name} plus any required input parameters.
        # Alternatively, path can be used for an Amazon Web Services service path-based API. The ensuing
        # service_api refers to the path to an Amazon Web Services service resource, including the region of
        # the integrated Amazon Web Services service, if applicable. For example, for integration with the S3
        # API of GetObject , the uri can be either
        # arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key} or
        # arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key} .

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @type : String,
          @cache_key_parameters : Array(String)? = nil,
          @cache_namespace : String? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling : String? = nil,
          @credentials : String? = nil,
          @integration_http_method : String? = nil,
          @integration_target : String? = nil,
          @passthrough_behavior : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_transfer_mode : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil,
          @uri : String? = nil
        )
        end
      end

      # Represents a put integration response request.

      struct PutIntegrationResponseRequest
        include JSON::Serializable

        # Specifies a put integration response request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a put integration response request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies the status code that is used to map the integration response to an existing
        # MethodResponse.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        # Specifies how to handle response payload content type conversions. Supported values are
        # CONVERT_TO_BINARY and CONVERT_TO_TEXT , with the following behaviors: If this property is not
        # defined, the response payload will be passed through from the integration response to the method
        # response without modification.

        @[JSON::Field(key: "contentHandling")]
        getter content_handling : String?

        # A key-value map specifying response parameters that are passed to the method response from the back
        # end. The key is a method response header parameter name and the mapped value is an integration
        # response header value, a static value enclosed within a pair of single quotes, or a JSON expression
        # from the integration response body. The mapping key must match the pattern of
        # method.response.header.{name} , where name is a valid and unique header name. The mapped non-static
        # value must match the pattern of integration.response.header.{name} or
        # integration.response.body.{JSON-expression} , where name must be a valid and unique response header
        # name and JSON-expression a valid JSON expression without the $ prefix.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # Specifies a put integration response's templates.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # Specifies the selection pattern of a put integration response.

        @[JSON::Field(key: "selectionPattern")]
        getter selection_pattern : String?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String,
          @content_handling : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @selection_pattern : String? = nil
        )
        end
      end

      # Request to add a method to an existing Resource resource.

      struct PutMethodRequest
        include JSON::Serializable

        # The method's authorization type. Valid values are NONE for open access, AWS_IAM for using AWS IAM
        # permissions, CUSTOM for using a custom authorizer, or COGNITO_USER_POOLS for using a Cognito user
        # pool.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String

        # Specifies the method request's HTTP method type.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the new Method resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies whether the method required a valid ApiKey.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # A list of authorization scopes configured on the method. The scopes are used with a
        # COGNITO_USER_POOLS authorizer to authorize the method invocation. The authorization works by
        # matching the method scopes against the scopes parsed from the access token in the incoming request.
        # The method invocation is authorized if any method scopes matches a claimed scope in the access
        # token. Otherwise, the invocation is not authorized. When the method scope is configured, the client
        # must provide an access token instead of an identity token for authorization purposes.

        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?

        # Specifies the identifier of an Authorizer to use on this Method, if the type is CUSTOM or
        # COGNITO_USER_POOLS. The authorizer identifier is generated by API Gateway when you created the
        # authorizer.

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # A human-friendly operation identifier for the method. For example, you can assign the operationName
        # of ListPets for the GET /pets method in the PetStore example.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # Specifies the Model resources used for the request's content type. Request models are represented as
        # a key/value map, with a content type as the key and a Model name as the value.

        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?

        # A key-value map defining required or optional method request parameters that can be accepted by API
        # Gateway. A key defines a method request parameter name matching the pattern of
        # method.request.{location}.{name} , where location is querystring , path , or header and name is a
        # valid and unique parameter name. The value associated with the key is a Boolean flag indicating
        # whether the parameter is required ( true ) or optional ( false ). The method request parameter names
        # defined here are available in Integration to be mapped to integration request parameters or
        # body-mapping templates.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Bool)?

        # The identifier of a RequestValidator for validating the method request.

        @[JSON::Field(key: "requestValidatorId")]
        getter request_validator_id : String?

        def initialize(
          @authorization_type : String,
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorizer_id : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Bool)? = nil,
          @request_validator_id : String? = nil
        )
        end
      end

      # Request to add a MethodResponse to an existing Method resource.

      struct PutMethodResponseRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the Method resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The method response's status code.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        # Specifies the Model resources used for the response's content type. Response models are represented
        # as a key/value map, with a content type as the key and a Model name as the value.

        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?

        # A key-value map specifying required or optional response parameters that API Gateway can send back
        # to the caller. A key defines a method response header name and the associated value is a Boolean
        # flag indicating whether the method response parameter is required or not. The method response header
        # names must match the pattern of method.response.header.{name} , where name is a valid and unique
        # header name. The response parameter names defined here are available in the integration response to
        # be mapped from an integration response header expressed in integration.response.header.{name} , a
        # static value enclosed within a pair of single quotes (e.g., 'application/json' ), or a JSON
        # expression from the back-end response payload in the form of
        # integration.response.body.{JSON-expression} , where JSON-expression is a valid JSON expression
        # without the $ prefix.)

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Bool)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Bool)? = nil
        )
        end
      end

      # A PUT request to update an existing API, with external API definitions specified as the request
      # body.

      struct PutRestApiRequest
        include JSON::Serializable

        # The PUT request body containing external API definitions. Currently, only OpenAPI definition
        # JSON/YAML files are supported. The maximum size of the API definition file is 6MB.

        @[JSON::Field(key: "body")]
        getter body : Bytes

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A query parameter to indicate whether to rollback the API update ( true ) or not ( false ) when a
        # warning is encountered. The default value is false .

        @[JSON::Field(key: "failonwarnings")]
        getter fail_on_warnings : Bool?

        # The mode query parameter to specify the update mode. Valid values are "merge" and "overwrite". By
        # default, the update mode is "merge".

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # Custom header parameters as part of the request. For example, to exclude DocumentationParts from an
        # imported API, set ignore=documentation as a parameters value, as in the AWS CLI command of aws
        # apigateway import-rest-api --parameters ignore=documentation --body
        # 'file:///path/to/imported-api-body.json' .

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @body : Bytes,
          @rest_api_id : String,
          @fail_on_warnings : Bool? = nil,
          @mode : String? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Quotas configured for a usage plan.

      struct QuotaSettings
        include JSON::Serializable

        # The target maximum number of requests that can be made in a given time period.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The number of requests subtracted from the given limit in the initial time period.

        @[JSON::Field(key: "offset")]
        getter offset : Int32?

        # The time period in which the limit applies. Valid values are "DAY", "WEEK" or "MONTH".

        @[JSON::Field(key: "period")]
        getter period : String?

        def initialize(
          @limit : Int32? = nil,
          @offset : Int32? = nil,
          @period : String? = nil
        )
        end
      end


      struct RejectDomainNameAccessAssociationRequest
        include JSON::Serializable

        # The ARN of the domain name access association resource.

        @[JSON::Field(key: "domainNameAccessAssociationArn")]
        getter domain_name_access_association_arn : String

        # The ARN of the domain name.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String

        def initialize(
          @domain_name_access_association_arn : String,
          @domain_name_arn : String
        )
        end
      end

      # A set of validation rules for incoming Method requests.

      struct RequestValidator
        include JSON::Serializable

        # The identifier of this RequestValidator.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of this RequestValidator

        @[JSON::Field(key: "name")]
        getter name : String?

        # A Boolean flag to indicate whether to validate a request body according to the configured Model
        # schema.

        @[JSON::Field(key: "validateRequestBody")]
        getter validate_request_body : Bool?

        # A Boolean flag to indicate whether to validate request parameters ( true ) or not ( false ).

        @[JSON::Field(key: "validateRequestParameters")]
        getter validate_request_parameters : Bool?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @validate_request_body : Bool? = nil,
          @validate_request_parameters : Bool? = nil
        )
        end
      end

      # A collection of RequestValidator resources of a given RestApi.

      struct RequestValidators
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::RequestValidator)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::RequestValidator)? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents an API resource.

      struct Resource
        include JSON::Serializable

        # The resource's identifier.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The parent resource's identifier.

        @[JSON::Field(key: "parentId")]
        getter parent_id : String?

        # The full path for this resource.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The last path segment for this resource.

        @[JSON::Field(key: "pathPart")]
        getter path_part : String?

        # Gets an API resource's method of a given HTTP verb.

        @[JSON::Field(key: "resourceMethods")]
        getter resource_methods : Hash(String, Types::Method)?

        def initialize(
          @id : String? = nil,
          @parent_id : String? = nil,
          @path : String? = nil,
          @path_part : String? = nil,
          @resource_methods : Hash(String, Types::Method)? = nil
        )
        end
      end

      # Represents a collection of Resource resources.

      struct Resources
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::Resource)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::Resource)? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents a REST API.

      struct RestApi
        include JSON::Serializable

        # The source of the API key for metering requests according to a usage plan. Valid values are: &gt;
        # HEADER to read the API key from the X-API-Key header of a request. AUTHORIZER to read the API key
        # from the UsageIdentifierKey from a custom authorizer.

        @[JSON::Field(key: "apiKeySource")]
        getter api_key_source : String?

        # The ApiStatus of the RestApi.

        @[JSON::Field(key: "apiStatus")]
        getter api_status : String?

        # The status message of the RestApi. When the status message is UPDATING you can still invoke it.

        @[JSON::Field(key: "apiStatusMessage")]
        getter api_status_message : String?

        # The list of binary media types supported by the RestApi. By default, the RestApi supports only
        # UTF-8-encoded text payloads.

        @[JSON::Field(key: "binaryMediaTypes")]
        getter binary_media_types : Array(String)?

        # The timestamp when the API was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The API's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether clients can invoke your API by using the default execute-api endpoint. By default,
        # clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com
        # endpoint. To require that clients use a custom domain name to invoke your API, disable the default
        # endpoint.

        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?

        # The endpoint access mode of the RestApi.

        @[JSON::Field(key: "endpointAccessMode")]
        getter endpoint_access_mode : String?

        # The endpoint configuration of this RestApi showing the endpoint types and IP address types of the
        # API.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfiguration?

        # The API's identifier. This identifier is unique across all of your APIs in API Gateway.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A nullable integer that is used to enable compression (with non-negative between 0 and 10485760
        # (10M) bytes, inclusive) or disable compression (with a null value) on an API. When compression is
        # enabled, compression or decompression is not applied on the payload if the payload size is smaller
        # than this value. Setting it to zero allows compression for any payload size.

        @[JSON::Field(key: "minimumCompressionSize")]
        getter minimum_compression_size : Int32?

        # The API's name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A stringified JSON policy document that applies to this RestApi regardless of the caller and Method
        # configuration.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The API's root resource ID.

        @[JSON::Field(key: "rootResourceId")]
        getter root_resource_id : String?

        # The Transport Layer Security (TLS) version + cipher suite for this RestApi.

        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A version identifier for the API.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The warning messages reported when failonwarnings is turned on during API import.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_key_source : String? = nil,
          @api_status : String? = nil,
          @api_status_message : String? = nil,
          @binary_media_types : Array(String)? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @endpoint_access_mode : String? = nil,
          @endpoint_configuration : Types::EndpointConfiguration? = nil,
          @id : String? = nil,
          @minimum_compression_size : Int32? = nil,
          @name : String? = nil,
          @policy : String? = nil,
          @root_resource_id : String? = nil,
          @security_policy : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Contains references to your APIs and links that guide you in how to interact with your collection. A
      # collection offers a paginated view of your APIs.

      struct RestApis
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::RestApi)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::RestApi)? = nil,
          @position : String? = nil
        )
        end
      end

      # A configuration property of an SDK type.

      struct SdkConfigurationProperty
        include JSON::Serializable

        # The default value of an SdkType configuration property.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The description of an SdkType configuration property.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The user-friendly name of an SdkType configuration property.

        @[JSON::Field(key: "friendlyName")]
        getter friendly_name : String?

        # The name of a an SdkType configuration property.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A boolean flag of an SdkType configuration property to indicate if the associated SDK configuration
        # property is required ( true ) or not ( false ).

        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @friendly_name : String? = nil,
          @name : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # The binary blob response to GetSdk, which contains the generated SDK.

      struct SdkResponse
        include JSON::Serializable

        # The binary blob response to GetSdk, which contains the generated SDK.

        @[JSON::Field(key: "body")]
        getter body : Bytes?

        # The content-disposition header value in the HTTP response.

        @[JSON::Field(key: "Content-Disposition")]
        getter content_disposition : String?

        # The content-type header value in the HTTP response.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @body : Bytes? = nil,
          @content_disposition : String? = nil,
          @content_type : String? = nil
        )
        end
      end

      # A type of SDK that API Gateway can generate.

      struct SdkType
        include JSON::Serializable

        # A list of configuration properties of an SdkType.

        @[JSON::Field(key: "configurationProperties")]
        getter configuration_properties : Array(Types::SdkConfigurationProperty)?

        # The description of an SdkType.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The user-friendly name of an SdkType instance.

        @[JSON::Field(key: "friendlyName")]
        getter friendly_name : String?

        # The identifier of an SdkType instance.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @configuration_properties : Array(Types::SdkConfigurationProperty)? = nil,
          @description : String? = nil,
          @friendly_name : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The collection of SdkType instances.

      struct SdkTypes
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::SdkType)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::SdkType)? = nil,
          @position : String? = nil
        )
        end
      end

      # The requested service is not available. For details see the accompanying error message. Retry after
      # the specified time period.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end

      # Represents a unique identifier for a version of a deployed RestApi that is callable by users.

      struct Stage
        include JSON::Serializable

        # Settings for logging access in this stage.

        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?

        # Specifies whether a cache cluster is enabled for the stage. To activate a method-level cache, set
        # CachingEnabled to true for a method.

        @[JSON::Field(key: "cacheClusterEnabled")]
        getter cache_cluster_enabled : Bool?

        # The stage's cache capacity in GB. For more information about choosing a cache size, see Enabling API
        # caching to enhance responsiveness .

        @[JSON::Field(key: "cacheClusterSize")]
        getter cache_cluster_size : String?

        # The status of the cache cluster for the stage, if enabled.

        @[JSON::Field(key: "cacheClusterStatus")]
        getter cache_cluster_status : String?

        # Settings for the canary deployment in this stage.

        @[JSON::Field(key: "canarySettings")]
        getter canary_settings : Types::CanarySettings?

        # The identifier of a client certificate for an API stage.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # The timestamp when the stage was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The identifier of the Deployment that the stage points to.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The stage's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the associated API documentation.

        @[JSON::Field(key: "documentationVersion")]
        getter documentation_version : String?

        # The timestamp when the stage last updated.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # A map that defines the method settings for a Stage resource. Keys (designated as
        # /{method_setting_key below) are method paths defined as {resource_path}/{http_method} for an
        # individual method override, or /\*/\* for overriding all methods in the stage.

        @[JSON::Field(key: "methodSettings")]
        getter method_settings : Hash(String, Types::MethodSetting)?

        # The name of the stage is the first path segment in the Uniform Resource Identifier (URI) of a call
        # to API Gateway. Stage names can only contain alphanumeric characters, hyphens, and underscores.
        # Maximum length is 128 characters.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies whether active tracing with X-ray is enabled for the Stage.

        @[JSON::Field(key: "tracingEnabled")]
        getter tracing_enabled : Bool?

        # A map that defines the stage variables for a Stage resource. Variable names can have alphanumeric
        # and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+ .

        @[JSON::Field(key: "variables")]
        getter variables : Hash(String, String)?

        # The ARN of the WebAcl associated with the Stage.

        @[JSON::Field(key: "webAclArn")]
        getter web_acl_arn : String?

        def initialize(
          @access_log_settings : Types::AccessLogSettings? = nil,
          @cache_cluster_enabled : Bool? = nil,
          @cache_cluster_size : String? = nil,
          @cache_cluster_status : String? = nil,
          @canary_settings : Types::CanarySettings? = nil,
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @documentation_version : String? = nil,
          @last_updated_date : Time? = nil,
          @method_settings : Hash(String, Types::MethodSetting)? = nil,
          @stage_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tracing_enabled : Bool? = nil,
          @variables : Hash(String, String)? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end

      # A reference to a unique stage identified in the format {restApiId}/{stage} .

      struct StageKey
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restApiId")]
        getter rest_api_id : String?

        # The stage name associated with the stage key.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @rest_api_id : String? = nil,
          @stage_name : String? = nil
        )
        end
      end

      # A list of Stage resources that are associated with the ApiKey resource.

      struct Stages
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter item : Array(Types::Stage)?

        def initialize(
          @item : Array(Types::Stage)? = nil
        )
        end
      end

      # Adds or updates a tag on a given resource.

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of a resource that can be tagged.

        @[JSON::Field(key: "resource_arn")]
        getter resource_arn : String

        # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to
        # 128 characters and must not start with aws: . The tag value can be up to 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The collection of tags. Each tag element is associated with a given resource.

      struct Tags
        include JSON::Serializable

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a mapping template used to transform a payload.

      struct Template
        include JSON::Serializable

        # The Apache Velocity Template Language (VTL) template content used for the template resource.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end

      # Make a request to simulate the invocation of an Authorizer.

      struct TestInvokeAuthorizerRequest
        include JSON::Serializable

        # Specifies a test invoke authorizer request's Authorizer ID.

        @[JSON::Field(key: "authorizer_id")]
        getter authorizer_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # A key-value map of additional context variables.

        @[JSON::Field(key: "additionalContext")]
        getter additional_context : Hash(String, String)?

        # The simulated request body of an incoming invocation request.

        @[JSON::Field(key: "body")]
        getter body : String?

        # A key-value map of headers to simulate an incoming invocation request. This is where the incoming
        # authorization token, or identity source, should be specified.

        @[JSON::Field(key: "headers")]
        getter headers : Hash(String, String)?

        # The headers as a map from string to list of values to simulate an incoming invocation request. This
        # is where the incoming authorization token, or identity source, may be specified.

        @[JSON::Field(key: "multiValueHeaders")]
        getter multi_value_headers : Hash(String, Array(String))?

        # The URI path, including query string, of the simulated invocation request. Use this to specify path
        # parameters and query string parameters.

        @[JSON::Field(key: "pathWithQueryString")]
        getter path_with_query_string : String?

        # A key-value map of stage variables to simulate an invocation on a deployed Stage.

        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        def initialize(
          @authorizer_id : String,
          @rest_api_id : String,
          @additional_context : Hash(String, String)? = nil,
          @body : String? = nil,
          @headers : Hash(String, String)? = nil,
          @multi_value_headers : Hash(String, Array(String))? = nil,
          @path_with_query_string : String? = nil,
          @stage_variables : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response of the test invoke request for a custom Authorizer

      struct TestInvokeAuthorizerResponse
        include JSON::Serializable

        # The authorization response.

        @[JSON::Field(key: "authorization")]
        getter authorization : Hash(String, Array(String))?

        # The open identity claims, with any supported custom attributes, returned from the Cognito Your User
        # Pool configured for the API.

        @[JSON::Field(key: "claims")]
        getter claims : Hash(String, String)?

        # The HTTP status code that the client would have received. Value is 0 if the authorizer succeeded.

        @[JSON::Field(key: "clientStatus")]
        getter client_status : Int32?

        # The execution latency, in ms, of the test authorizer request.

        @[JSON::Field(key: "latency")]
        getter latency : Int64?

        # The API Gateway execution log for the test authorizer request.

        @[JSON::Field(key: "log")]
        getter log : String?

        # The JSON policy document returned by the Authorizer

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # The principal identity returned by the Authorizer

        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @authorization : Hash(String, Array(String))? = nil,
          @claims : Hash(String, String)? = nil,
          @client_status : Int32? = nil,
          @latency : Int64? = nil,
          @log : String? = nil,
          @policy : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      # Make a request to simulate the invocation of a Method.

      struct TestInvokeMethodRequest
        include JSON::Serializable

        # Specifies a test invoke method request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies a test invoke method request's resource ID.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The simulated request body of an incoming invocation request.

        @[JSON::Field(key: "body")]
        getter body : String?

        # A ClientCertificate identifier to use in the test invocation. API Gateway will use the certificate
        # when making the HTTPS request to the defined back-end endpoint.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # A key-value map of headers to simulate an incoming invocation request.

        @[JSON::Field(key: "headers")]
        getter headers : Hash(String, String)?

        # The headers as a map from string to list of values to simulate an incoming invocation request.

        @[JSON::Field(key: "multiValueHeaders")]
        getter multi_value_headers : Hash(String, Array(String))?

        # The URI path, including query string, of the simulated invocation request. Use this to specify path
        # parameters and query string parameters.

        @[JSON::Field(key: "pathWithQueryString")]
        getter path_with_query_string : String?

        # A key-value map of stage variables to simulate an invocation on a deployed Stage.

        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @body : String? = nil,
          @client_certificate_id : String? = nil,
          @headers : Hash(String, String)? = nil,
          @multi_value_headers : Hash(String, Array(String))? = nil,
          @path_with_query_string : String? = nil,
          @stage_variables : Hash(String, String)? = nil
        )
        end
      end

      # Represents the response of the test invoke request in the HTTP method.

      struct TestInvokeMethodResponse
        include JSON::Serializable

        # The body of the HTTP response.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The headers of the HTTP response.

        @[JSON::Field(key: "headers")]
        getter headers : Hash(String, String)?

        # The execution latency, in ms, of the test invoke request.

        @[JSON::Field(key: "latency")]
        getter latency : Int64?

        # The API Gateway execution log for the test invoke request.

        @[JSON::Field(key: "log")]
        getter log : String?

        # The headers of the HTTP response as a map from string to list of values.

        @[JSON::Field(key: "multiValueHeaders")]
        getter multi_value_headers : Hash(String, Array(String))?

        # The HTTP status code.

        @[JSON::Field(key: "status")]
        getter status : Int32?

        def initialize(
          @body : String? = nil,
          @headers : Hash(String, String)? = nil,
          @latency : Int64? = nil,
          @log : String? = nil,
          @multi_value_headers : Hash(String, Array(String))? = nil,
          @status : Int32? = nil
        )
        end
      end

      # The API request rate limits.

      struct ThrottleSettings
        include JSON::Serializable

        # The API target request burst rate limit. This allows more requests through for a period of time than
        # the target rate limit.

        @[JSON::Field(key: "burstLimit")]
        getter burst_limit : Int32?

        # The API target request rate limit.

        @[JSON::Field(key: "rateLimit")]
        getter rate_limit : Float64?

        def initialize(
          @burst_limit : Int32? = nil,
          @rate_limit : Float64? = nil
        )
        end
      end

      # Specifies the TLS configuration for an integration.

      struct TlsConfig
        include JSON::Serializable

        # Specifies whether or not API Gateway skips verification that the certificate for an integration
        # endpoint is issued by a supported certificate authority. This isn’t recommended, but it enables you
        # to use certificates that are signed by private certificate authorities, or certificates that are
        # self-signed. If enabled, API Gateway still performs basic certificate validation, which includes
        # checking the certificate's expiration date, hostname, and presence of a root certificate authority.
        # Supported only for HTTP and HTTP_PROXY integrations. Enabling insecureSkipVerification isn't
        # recommended, especially for integrations with public HTTPS endpoints. If you enable
        # insecureSkipVerification , you increase the risk of man-in-the-middle attacks.

        @[JSON::Field(key: "insecureSkipVerification")]
        getter insecure_skip_verification : Bool?

        def initialize(
          @insecure_skip_verification : Bool? = nil
        )
        end
      end

      # The request has reached its throttling limit. Retry after the specified time period.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end

      # The request is denied because the caller has insufficient permissions.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Removes a tag from a given resource.

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of a resource that can be tagged.

        @[JSON::Field(key: "resource_arn")]
        getter resource_arn : String

        # The Tag keys to delete.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Requests API Gateway to change information about the current Account resource.

      struct UpdateAccountRequest
        include JSON::Serializable

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # A request to change information about an ApiKey resource.

      struct UpdateApiKeyRequest
        include JSON::Serializable

        # The identifier of the ApiKey resource to be updated.

        @[JSON::Field(key: "api_Key")]
        getter api_key : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @api_key : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Request to update an existing Authorizer resource.

      struct UpdateAuthorizerRequest
        include JSON::Serializable

        # The identifier of the Authorizer resource.

        @[JSON::Field(key: "authorizer_id")]
        getter authorizer_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @authorizer_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # A request to change information about the BasePathMapping resource.

      struct UpdateBasePathMappingRequest
        include JSON::Serializable

        # The base path of the BasePathMapping resource to change. To specify an empty base path, set this
        # parameter to '(none)' .

        @[JSON::Field(key: "base_path")]
        getter base_path : String

        # The domain name of the BasePathMapping resource to change.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @base_path : String,
          @domain_name : String,
          @domain_name_id : String? = nil,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # A request to change information about an ClientCertificate resource.

      struct UpdateClientCertificateRequest
        include JSON::Serializable

        # The identifier of the ClientCertificate resource to be updated.

        @[JSON::Field(key: "clientcertificate_id")]
        getter client_certificate_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @client_certificate_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Requests API Gateway to change information about a Deployment resource.

      struct UpdateDeploymentRequest
        include JSON::Serializable

        # The replacement identifier for the Deployment resource to change information about.

        @[JSON::Field(key: "deployment_id")]
        getter deployment_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @deployment_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Updates an existing documentation part of a given API.

      struct UpdateDocumentationPartRequest
        include JSON::Serializable

        # The identifier of the to-be-updated documentation part.

        @[JSON::Field(key: "part_id")]
        getter documentation_part_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @documentation_part_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Updates an existing documentation version of an API.

      struct UpdateDocumentationVersionRequest
        include JSON::Serializable

        # The version identifier of the to-be-updated documentation version.

        @[JSON::Field(key: "doc_version")]
        getter documentation_version : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @documentation_version : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # A request to change information about the DomainName resource.

      struct UpdateDomainNameRequest
        include JSON::Serializable

        # The name of the DomainName resource to be changed.

        @[JSON::Field(key: "domain_name")]
        getter domain_name : String

        # The identifier for the domain name resource. Supported only for private custom domain names.

        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @domain_name : String,
          @domain_name_id : String? = nil,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Updates a GatewayResponse of a specified response type on the given RestApi.

      struct UpdateGatewayResponseRequest
        include JSON::Serializable

        # The response type of the associated GatewayResponse.

        @[JSON::Field(key: "response_type")]
        getter response_type : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @response_type : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Represents an update integration request.

      struct UpdateIntegrationRequest
        include JSON::Serializable

        # Represents an update integration request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Represents an update integration request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Represents an update integration response request.

      struct UpdateIntegrationResponseRequest
        include JSON::Serializable

        # Specifies an update integration response request's HTTP method.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # Specifies an update integration response request's resource identifier.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # Specifies an update integration response request's status code.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Request to update an existing Method resource.

      struct UpdateMethodRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the Method resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # A request to update an existing MethodResponse resource.

      struct UpdateMethodResponseRequest
        include JSON::Serializable

        # The HTTP verb of the Method resource.

        @[JSON::Field(key: "http_method")]
        getter http_method : String

        # The Resource identifier for the MethodResponse resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The status code for the MethodResponse resource.

        @[JSON::Field(key: "status_code")]
        getter status_code : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @http_method : String,
          @resource_id : String,
          @rest_api_id : String,
          @status_code : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Request to update an existing model in an existing RestApi resource.

      struct UpdateModelRequest
        include JSON::Serializable

        # The name of the model to update.

        @[JSON::Field(key: "model_name")]
        getter model_name : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @model_name : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Updates a RequestValidator of a given RestApi.

      struct UpdateRequestValidatorRequest
        include JSON::Serializable

        # The identifier of RequestValidator to be updated.

        @[JSON::Field(key: "requestvalidator_id")]
        getter request_validator_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @request_validator_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Request to change information about a Resource resource.

      struct UpdateResourceRequest
        include JSON::Serializable

        # The identifier of the Resource resource.

        @[JSON::Field(key: "resource_id")]
        getter resource_id : String

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @resource_id : String,
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Request to update an existing RestApi resource in your collection.

      struct UpdateRestApiRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @rest_api_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Requests API Gateway to change information about a Stage resource.

      struct UpdateStageRequest
        include JSON::Serializable

        # The string identifier of the associated RestApi.

        @[JSON::Field(key: "restapi_id")]
        getter rest_api_id : String

        # The name of the Stage resource to change information about.

        @[JSON::Field(key: "stage_name")]
        getter stage_name : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @rest_api_id : String,
          @stage_name : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # The PATCH request to update a usage plan of a given plan Id.

      struct UpdateUsagePlanRequest
        include JSON::Serializable

        # The Id of the to-be-updated usage plan.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @usage_plan_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # The PATCH request to grant a temporary extension to the remaining quota of a usage plan associated
      # with a specified API key.

      struct UpdateUsageRequest
        include JSON::Serializable

        # The identifier of the API key associated with the usage plan in which a temporary extension is
        # granted to the remaining quota.

        @[JSON::Field(key: "keyId")]
        getter key_id : String

        # The Id of the usage plan associated with the usage data.

        @[JSON::Field(key: "usageplanId")]
        getter usage_plan_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @key_id : String,
          @usage_plan_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Updates an existing VpcLink of a specified identifier.

      struct UpdateVpcLinkRequest
        include JSON::Serializable

        # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.

        @[JSON::Field(key: "vpclink_id")]
        getter vpc_link_id : String

        # For more information about supported patch operations, see Patch Operations .

        @[JSON::Field(key: "patchOperations")]
        getter patch_operations : Array(Types::PatchOperation)?

        def initialize(
          @vpc_link_id : String,
          @patch_operations : Array(Types::PatchOperation)? = nil
        )
        end
      end

      # Represents the usage data of a usage plan.

      struct Usage
        include JSON::Serializable

        # The ending date of the usage data.

        @[JSON::Field(key: "endDate")]
        getter end_date : String?

        # The usage data, as daily logs of used and remaining quotas, over the specified time interval indexed
        # over the API keys in a usage plan. For example, {..., "values" : { "{api_key}" : [ [0, 100], [10,
        # 90], [100, 10]]} , where {api_key} stands for an API key value and the daily log entry is of the
        # format [used quota, remaining quota] .

        @[JSON::Field(key: "values")]
        getter items : Hash(String, Array(Array(Int64)))?


        @[JSON::Field(key: "position")]
        getter position : String?

        # The starting date of the usage data.

        @[JSON::Field(key: "startDate")]
        getter start_date : String?

        # The plan Id associated with this usage data.

        @[JSON::Field(key: "usagePlanId")]
        getter usage_plan_id : String?

        def initialize(
          @end_date : String? = nil,
          @items : Hash(String, Array(Array(Int64)))? = nil,
          @position : String? = nil,
          @start_date : String? = nil,
          @usage_plan_id : String? = nil
        )
        end
      end

      # Represents a usage plan used to specify who can assess associated API stages. Optionally, target
      # request rate and quota limits can be set. In some cases clients can exceed the targets that you set.
      # Don’t rely on usage plans to control costs. Consider using Amazon Web Services Budgets to monitor
      # costs and WAF to manage API requests.

      struct UsagePlan
        include JSON::Serializable

        # The associated API stages of a usage plan.

        @[JSON::Field(key: "apiStages")]
        getter api_stages : Array(Types::ApiStage)?

        # The description of a usage plan.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of a UsagePlan resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of a usage plan.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Web Services Marketplace product identifier to associate with the usage plan as a SaaS
        # product on the Amazon Web Services Marketplace.

        @[JSON::Field(key: "productCode")]
        getter product_code : String?

        # The target maximum number of permitted requests per a given unit time interval.

        @[JSON::Field(key: "quota")]
        getter quota : Types::QuotaSettings?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A map containing method level throttling information for API stage in a usage plan.

        @[JSON::Field(key: "throttle")]
        getter throttle : Types::ThrottleSettings?

        def initialize(
          @api_stages : Array(Types::ApiStage)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @product_code : String? = nil,
          @quota : Types::QuotaSettings? = nil,
          @tags : Hash(String, String)? = nil,
          @throttle : Types::ThrottleSettings? = nil
        )
        end
      end

      # Represents a usage plan key to identify a plan customer.

      struct UsagePlanKey
        include JSON::Serializable

        # The Id of a usage plan key.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of a usage plan key.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of a usage plan key. Currently, the valid key type is API_KEY .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The value of a usage plan key.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Represents the collection of usage plan keys added to usage plans for the associated API keys and,
      # possibly, other types of keys.

      struct UsagePlanKeys
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::UsagePlanKey)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::UsagePlanKey)? = nil,
          @position : String? = nil
        )
        end
      end

      # Represents a collection of usage plans for an AWS account.

      struct UsagePlans
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::UsagePlan)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::UsagePlan)? = nil,
          @position : String? = nil
        )
        end
      end

      # An API Gateway VPC link for a RestApi to access resources in an Amazon Virtual Private Cloud (VPC).

      struct VpcLink
        include JSON::Serializable

        # The description of the VPC link.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name used to label and identify the VPC link.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the VPC link. The valid values are AVAILABLE , PENDING , DELETING , or FAILED .
        # Deploying an API will wait if the status is PENDING and will fail if the status is DELETING .

        @[JSON::Field(key: "status")]
        getter status : String?

        # A description about the VPC link status.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ARN of the network load balancer of the VPC targeted by the VPC link. The network load balancer
        # must be owned by the same Amazon Web Services account of the API owner.

        @[JSON::Field(key: "targetArns")]
        getter target_arns : Array(String)?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_arns : Array(String)? = nil
        )
        end
      end

      # The collection of VPC links under the caller's account in a region.

      struct VpcLinks
        include JSON::Serializable

        # The current page of elements from this collection.

        @[JSON::Field(key: "item")]
        getter items : Array(Types::VpcLink)?


        @[JSON::Field(key: "position")]
        getter position : String?

        def initialize(
          @items : Array(Types::VpcLink)? = nil,
          @position : String? = nil
        )
        end
      end
    end
  end
end
